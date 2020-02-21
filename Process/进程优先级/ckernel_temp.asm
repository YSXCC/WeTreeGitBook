; Disassembly of file: ckernel.o
; Fri Feb 21 17:06:51 2020
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
global task_sleep: function

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
        sub     esp, 164                                ; 0004 _ 81. EC, 000000A4
; Note: Absolute memory address without relocation
        mov     eax, dword [gs:14H]                     ; 000A _ 65: A1, 00000014
        mov     dword [ebp-0CH], eax                    ; 0010 _ 89. 45, F4
        xor     eax, eax                                ; 0013 _ 31. C0
        mov     dword [esp], screen_info                ; 0015 _ C7. 04 24, 00000000(d)
        call    init_screeninfo                         ; 001C _ E8, FFFFFFFC(rel)
        mov     eax, dword [screen_info]                ; 0021 _ A1, 00000000(d)
        mov     dword [ebp-64H], eax                    ; 0026 _ 89. 45, 9C
        movzx   eax, word [screen_info+4H]              ; 0029 _ 0F B7. 05, 00000004(d)
        cwde                                            ; 0030 _ 98
        mov     dword [ebp-60H], eax                    ; 0031 _ 89. 45, A0
        movzx   eax, word [screen_info+6H]              ; 0034 _ 0F B7. 05, 00000006(d)
        cwde                                            ; 003B _ 98
        mov     dword [ebp-5CH], eax                    ; 003C _ 89. 45, A4
        mov     eax, dword [memman]                     ; 003F _ A1, 00000000(d)
        mov     dword [esp], eax                        ; 0044 _ 89. 04 24
        call    memman_init                             ; 0047 _ E8, FFFFFFFC(rel)
        mov     eax, dword [memman]                     ; 004C _ A1, 00000000(d)
        mov     dword [esp+8H], 1072594944              ; 0051 _ C7. 44 24, 08, 3FEE8000
        mov     dword [esp+4H], 17301504                ; 0059 _ C7. 44 24, 04, 01080000
        mov     dword [esp], eax                        ; 0061 _ 89. 04 24
        call    memman_free                             ; 0064 _ E8, FFFFFFFC(rel)
        mov     eax, dword [memman]                     ; 0069 _ A1, 00000000(d)
        mov     edx, dword [ebp-5CH]                    ; 006E _ 8B. 55, A4
        mov     dword [esp+0CH], edx                    ; 0071 _ 89. 54 24, 0C
        mov     edx, dword [ebp-60H]                    ; 0075 _ 8B. 55, A0
        mov     dword [esp+8H], edx                     ; 0078 _ 89. 54 24, 08
        mov     edx, dword [ebp-64H]                    ; 007C _ 8B. 55, 9C
        mov     dword [esp+4H], edx                     ; 007F _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0083 _ 89. 04 24
        call    sheet_control_init                      ; 0086 _ E8, FFFFFFFC(rel)
        mov     dword [sheet_control], eax              ; 008B _ A3, 00000000(d)
        mov     eax, dword [sheet_control]              ; 0090 _ A1, 00000000(d)
        mov     dword [esp], eax                        ; 0095 _ 89. 04 24
        call    sheet_alloc                             ; 0098 _ E8, FFFFFFFC(rel)
        mov     dword [back_sheet], eax                 ; 009D _ A3, 00000004(d)
        mov     eax, dword [sheet_control]              ; 00A2 _ A1, 00000000(d)
        mov     dword [esp], eax                        ; 00A7 _ 89. 04 24
        call    sheet_alloc                             ; 00AA _ E8, FFFFFFFC(rel)
        mov     dword [mouse_sheet], eax                ; 00AF _ A3, 00000008(d)
        mov     eax, dword [ebp-60H]                    ; 00B4 _ 8B. 45, A0
        imul    eax, dword [ebp-5CH]                    ; 00B7 _ 0F AF. 45, A4
        mov     edx, eax                                ; 00BB _ 89. C2
        mov     eax, dword [memman]                     ; 00BD _ A1, 00000000(d)
        mov     dword [esp+4H], edx                     ; 00C2 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 00C6 _ 89. 04 24
        call    memman_alloc_4k                         ; 00C9 _ E8, FFFFFFFC(rel)
        mov     dword [back_buf], eax                   ; 00CE _ A3, 00000000(d)
        mov     edx, dword [back_buf]                   ; 00D3 _ 8B. 15, 00000000(d)
        mov     eax, dword [back_sheet]                 ; 00D9 _ A1, 00000004(d)
        mov     dword [esp+10H], 99                     ; 00DE _ C7. 44 24, 10, 00000063
        mov     ecx, dword [ebp-5CH]                    ; 00E6 _ 8B. 4D, A4
        mov     dword [esp+0CH], ecx                    ; 00E9 _ 89. 4C 24, 0C
        mov     ecx, dword [ebp-60H]                    ; 00ED _ 8B. 4D, A0
        mov     dword [esp+8H], ecx                     ; 00F0 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 00F4 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 00F8 _ 89. 04 24
        call    sheet_setbuf                            ; 00FB _ E8, FFFFFFFC(rel)
        mov     eax, dword [mouse_sheet]                ; 0100 _ A1, 00000008(d)
        mov     dword [esp+10H], 99                     ; 0105 _ C7. 44 24, 10, 00000063
        mov     dword [esp+0CH], 16                     ; 010D _ C7. 44 24, 0C, 00000010
        mov     dword [esp+8H], 16                      ; 0115 _ C7. 44 24, 08, 00000010
        mov     dword [esp+4H], mouse_cursor_buf        ; 011D _ C7. 44 24, 04, 00000000(d)
        mov     dword [esp], eax                        ; 0125 _ 89. 04 24
        call    sheet_setbuf                            ; 0128 _ E8, FFFFFFFC(rel)
        call    init_mouse_position                     ; 012D _ E8, FFFFFFFC(rel)
        call    init_palette                            ; 0132 _ E8, FFFFFFFC(rel)
        call    init_fifo_buf                           ; 0137 _ E8, FFFFFFFC(rel)
        call    init_keyboard                           ; 013C _ E8, FFFFFFFC(rel)
        call    get_timer_control                       ; 0141 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-58H], eax                    ; 0146 _ 89. 45, A8
        call    init_time_port                          ; 0149 _ E8, FFFFFFFC(rel)
        mov     dword [esp+0CH], 0                      ; 014E _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], timerbuf1.1718          ; 0156 _ C7. 44 24, 08, 00000028(d)
        mov     dword [esp+4H], 8                       ; 015E _ C7. 44 24, 04, 00000008
        mov     dword [esp], timerinfo1.1715            ; 0166 _ C7. 04 24, 0000000C(d)
        call    fifo8_init                              ; 016D _ E8, FFFFFFFC(rel)
        call    timer_alloc                             ; 0172 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-54H], eax                    ; 0177 _ 89. 45, AC
        mov     dword [esp+8H], 1                       ; 017A _ C7. 44 24, 08, 00000001
        mov     dword [esp+4H], timerinfo1.1715         ; 0182 _ C7. 44 24, 04, 0000000C(d)
        mov     eax, dword [ebp-54H]                    ; 018A _ 8B. 45, AC
        mov     dword [esp], eax                        ; 018D _ 89. 04 24
        call    timer_init                              ; 0190 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 100                     ; 0195 _ C7. 44 24, 04, 00000064
        mov     eax, dword [ebp-54H]                    ; 019D _ 8B. 45, AC
        mov     dword [esp], eax                        ; 01A0 _ 89. 04 24
        call    timer_settime                           ; 01A3 _ E8, FFFFFFFC(rel)
        mov     dword [esp+0CH], 0                      ; 01A8 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], timerbuf2.1719          ; 01B0 _ C7. 44 24, 08, 0000004C(d)
        mov     dword [esp+4H], 8                       ; 01B8 _ C7. 44 24, 04, 00000008
        mov     dword [esp], timerinfo2.1716            ; 01C0 _ C7. 04 24, 00000030(d)
        call    fifo8_init                              ; 01C7 _ E8, FFFFFFFC(rel)
        call    timer_alloc                             ; 01CC _ E8, FFFFFFFC(rel)
        mov     dword [ebp-50H], eax                    ; 01D1 _ 89. 45, B0
        mov     dword [esp+8H], 1                       ; 01D4 _ C7. 44 24, 08, 00000001
        mov     dword [esp+4H], timerinfo2.1716         ; 01DC _ C7. 44 24, 04, 00000030(d)
        mov     eax, dword [ebp-50H]                    ; 01E4 _ 8B. 45, B0
        mov     dword [esp], eax                        ; 01E7 _ 89. 04 24
        call    timer_init                              ; 01EA _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 300                     ; 01EF _ C7. 44 24, 04, 0000012C
        mov     eax, dword [ebp-50H]                    ; 01F7 _ 8B. 45, B0
        mov     dword [esp], eax                        ; 01FA _ 89. 04 24
        call    timer_settime                           ; 01FD _ E8, FFFFFFFC(rel)
        mov     dword [esp+0CH], 0                      ; 0202 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], timerbuf3.1720          ; 020A _ C7. 44 24, 08, 00000070(d)
        mov     dword [esp+4H], 8                       ; 0212 _ C7. 44 24, 04, 00000008
        mov     dword [esp], timerinfo3.1717            ; 021A _ C7. 04 24, 00000054(d)
        call    fifo8_init                              ; 0221 _ E8, FFFFFFFC(rel)
        call    timer_alloc                             ; 0226 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-4CH], eax                    ; 022B _ 89. 45, B4
        mov     dword [esp+8H], 1                       ; 022E _ C7. 44 24, 08, 00000001
        mov     dword [esp+4H], timerinfo3.1717         ; 0236 _ C7. 44 24, 04, 00000054(d)
        mov     eax, dword [ebp-4CH]                    ; 023E _ 8B. 45, B4
        mov     dword [esp], eax                        ; 0241 _ 89. 04 24
        call    timer_init                              ; 0244 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 50                      ; 0249 _ C7. 44 24, 04, 00000032
        mov     eax, dword [ebp-4CH]                    ; 0251 _ 8B. 45, B4
        mov     dword [esp], eax                        ; 0254 _ 89. 04 24
        call    timer_settime                           ; 0257 _ E8, FFFFFFFC(rel)
        call    io_sti                                  ; 025C _ E8, FFFFFFFC(rel)
        mov     eax, dword [back_buf]                   ; 0261 _ A1, 00000000(d)
        mov     edx, dword [ebp-5CH]                    ; 0266 _ 8B. 55, A4
        mov     dword [esp+8H], edx                     ; 0269 _ 89. 54 24, 08
        mov     edx, dword [ebp-60H]                    ; 026D _ 8B. 55, A0
        mov     dword [esp+4H], edx                     ; 0270 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0274 _ 89. 04 24
        call    init_desktop                            ; 0277 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 99                      ; 027C _ C7. 44 24, 04, 00000063
        mov     dword [esp], mouse_cursor_buf           ; 0284 _ C7. 04 24, 00000000(d)
        call    init_mouse_cursor                       ; 028B _ E8, FFFFFFFC(rel)
        mov     edx, dword [back_sheet]                 ; 0290 _ 8B. 15, 00000004(d)
        mov     eax, dword [sheet_control]              ; 0296 _ A1, 00000000(d)
        mov     dword [esp+0CH], 0                      ; 029B _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 0                       ; 02A3 _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], edx                     ; 02AB _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 02AF _ 89. 04 24
        call    sheet_slide                             ; 02B2 _ E8, FFFFFFFC(rel)
        mov     ebx, dword [mouse_y]                    ; 02B7 _ 8B. 1D, 00000000(d)
        mov     ecx, dword [mouse_x]                    ; 02BD _ 8B. 0D, 00000000(d)
        mov     edx, dword [mouse_sheet]                ; 02C3 _ 8B. 15, 00000008(d)
        mov     eax, dword [sheet_control]              ; 02C9 _ A1, 00000000(d)
        mov     dword [esp+0CH], ebx                    ; 02CE _ 89. 5C 24, 0C
        mov     dword [esp+8H], ecx                     ; 02D2 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 02D6 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 02DA _ 89. 04 24
        call    sheet_slide                             ; 02DD _ E8, FFFFFFFC(rel)
        mov     eax, dword [sheet_control]              ; 02E2 _ A1, 00000000(d)
        mov     dword [esp+4H], ?_189                   ; 02E7 _ C7. 44 24, 04, 00000000(d)
        mov     dword [esp], eax                        ; 02EF _ 89. 04 24
        call    message_box                             ; 02F2 _ E8, FFFFFFFC(rel)
        mov     dword [sheet_win], eax                  ; 02F7 _ A3, 00000000(d)
        mov     edx, dword [back_sheet]                 ; 02FC _ 8B. 15, 00000004(d)
        mov     eax, dword [sheet_control]              ; 0302 _ A1, 00000000(d)
        mov     dword [esp+8H], 0                       ; 0307 _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], edx                     ; 030F _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0313 _ 89. 04 24
        call    sheet_updown                            ; 0316 _ E8, FFFFFFFC(rel)
        mov     edx, dword [mouse_sheet]                ; 031B _ 8B. 15, 00000008(d)
        mov     eax, dword [sheet_control]              ; 0321 _ A1, 00000000(d)
        mov     dword [esp+8H], 100                     ; 0326 _ C7. 44 24, 08, 00000064
        mov     dword [esp+4H], edx                     ; 032E _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0332 _ 89. 04 24
        call    sheet_updown                            ; 0335 _ E8, FFFFFFFC(rel)
        call    enable_mouse                            ; 033A _ E8, FFFFFFFC(rel)
        call    get_code32_addr                         ; 033F _ E8, FFFFFFFC(rel)
        mov     dword [ebp-48H], eax                    ; 0344 _ 89. 45, B8
        call    get_addr_gdt                            ; 0347 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-44H], eax                    ; 034C _ 89. 45, BC
        mov     eax, dword [memman]                     ; 034F _ A1, 00000000(d)
        mov     dword [esp], eax                        ; 0354 _ 89. 04 24
        call    task_init                               ; 0357 _ E8, FFFFFFFC(rel)
        mov     dword [task_a.1728], eax                ; 035C _ A3, 00000078(d)
        mov     eax, dword [task_a.1728]                ; 0361 _ A1, 00000078(d)
        mov     dword [keyinfo+18H], eax                ; 0366 _ A3, 00000018(d)
        mov     byte [ebp-12H], 116                     ; 036B _ C6. 45, EE, 74
        mov     byte [ebp-11H], 97                      ; 036F _ C6. 45, EF, 61
        mov     byte [ebp-10H], 115                     ; 0373 _ C6. 45, F0, 73
        mov     byte [ebp-0FH], 107                     ; 0377 _ C6. 45, F1, 6B
        mov     byte [ebp-0EH], 0                       ; 037B _ C6. 45, F2, 00
        mov     byte [ebp-0DH], 0                       ; 037F _ C6. 45, F3, 00
        mov     dword [ebp-78H], 0                      ; 0383 _ C7. 45, 88, 00000000
        jmp     ?_002                                   ; 038A _ E9, 00000168

?_001:  mov     eax, dword [sheet_control]              ; 038F _ A1, 00000000(d)
        mov     dword [esp], eax                        ; 0394 _ 89. 04 24
        call    sheet_alloc                             ; 0397 _ E8, FFFFFFFC(rel)
        mov     edx, dword [ebp-78H]                    ; 039C _ 8B. 55, 88
        mov     dword [ebp+edx*4-2CH], eax              ; 039F _ 89. 44 95, D4
        mov     eax, dword [memman]                     ; 03A3 _ A1, 00000000(d)
        mov     dword [esp+4H], 7488                    ; 03A8 _ C7. 44 24, 04, 00001D40
        mov     dword [esp], eax                        ; 03B0 _ 89. 04 24
        call    memman_alloc_4k                         ; 03B3 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-40H], eax                    ; 03B8 _ 89. 45, C0
        mov     eax, dword [ebp-78H]                    ; 03BB _ 8B. 45, 88
        add     eax, 98                                 ; 03BE _ 83. C0, 62
        mov     byte [ebp-7BH], al                      ; 03C1 _ 88. 45, 85
        movzx   eax, byte [ebp-7BH]                     ; 03C4 _ 0F B6. 45, 85
        mov     byte [ebp-0EH], al                      ; 03C8 _ 88. 45, F2
        mov     eax, dword [ebp-78H]                    ; 03CB _ 8B. 45, 88
        mov     eax, dword [ebp+eax*4-2CH]              ; 03CE _ 8B. 44 85, D4
        mov     dword [esp+10H], -1                     ; 03D2 _ C7. 44 24, 10, FFFFFFFF
        mov     dword [esp+0CH], 52                     ; 03DA _ C7. 44 24, 0C, 00000034
        mov     dword [esp+8H], 144                     ; 03E2 _ C7. 44 24, 08, 00000090
        mov     edx, dword [ebp-40H]                    ; 03EA _ 8B. 55, C0
        mov     dword [esp+4H], edx                     ; 03ED _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 03F1 _ 89. 04 24
        call    sheet_setbuf                            ; 03F4 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-78H]                    ; 03F9 _ 8B. 45, 88
        mov     edx, dword [ebp+eax*4-2CH]              ; 03FC _ 8B. 54 85, D4
        mov     eax, dword [sheet_control]              ; 0400 _ A1, 00000000(d)
        lea     ecx, [ebp-12H]                          ; 0405 _ 8D. 4D, EE
        mov     dword [esp+8H], ecx                     ; 0408 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 040C _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0410 _ 89. 04 24
        call    make_windows                            ; 0413 _ E8, FFFFFFFC(rel)
        call    task_alloc                              ; 0418 _ E8, FFFFFFFC(rel)
        mov     edx, dword [ebp-78H]                    ; 041D _ 8B. 55, 88
        mov     dword [ebp+edx*4-20H], eax              ; 0420 _ 89. 44 95, E0
        mov     eax, dword [ebp-78H]                    ; 0424 _ 8B. 45, 88
        mov     eax, dword [ebp+eax*4-20H]              ; 0427 _ 8B. 44 85, E0
        mov     dword [eax+6CH], 0                      ; 042B _ C7. 40, 6C, 00000000
        mov     eax, dword [ebp-78H]                    ; 0432 _ 8B. 45, 88
        mov     eax, dword [ebp+eax*4-20H]              ; 0435 _ 8B. 44 85, E0
        mov     dword [eax+70H], 1073741824             ; 0439 _ C7. 40, 70, 40000000
        mov     eax, dword [ebp-78H]                    ; 0440 _ 8B. 45, 88
        mov     eax, dword [ebp+eax*4-20H]              ; 0443 _ 8B. 44 85, E0
        mov     edx, task_b_main                        ; 0447 _ BA, 00000000(d)
        sub     edx, dword [ebp-48H]                    ; 044C _ 2B. 55, B8
        mov     dword [eax+2CH], edx                    ; 044F _ 89. 50, 2C
        mov     eax, dword [ebp-78H]                    ; 0452 _ 8B. 45, 88
        mov     eax, dword [ebp+eax*4-20H]              ; 0455 _ 8B. 44 85, E0
        mov     dword [eax+54H], 0                      ; 0459 _ C7. 40, 54, 00000000
        mov     eax, dword [ebp-78H]                    ; 0460 _ 8B. 45, 88
        mov     eax, dword [ebp+eax*4-20H]              ; 0463 _ 8B. 44 85, E0
        mov     dword [eax+58H], 8                      ; 0467 _ C7. 40, 58, 00000008
        mov     eax, dword [ebp-78H]                    ; 046E _ 8B. 45, 88
        mov     eax, dword [ebp+eax*4-20H]              ; 0471 _ 8B. 44 85, E0
        mov     dword [eax+5CH], 48                     ; 0475 _ C7. 40, 5C, 00000030
        mov     eax, dword [ebp-78H]                    ; 047C _ 8B. 45, 88
        mov     eax, dword [ebp+eax*4-20H]              ; 047F _ 8B. 44 85, E0
        mov     dword [eax+60H], 32                     ; 0483 _ C7. 40, 60, 00000020
        mov     eax, dword [ebp-78H]                    ; 048A _ 8B. 45, 88
        mov     eax, dword [ebp+eax*4-20H]              ; 048D _ 8B. 44 85, E0
        mov     dword [eax+64H], 0                      ; 0491 _ C7. 40, 64, 00000000
        mov     eax, dword [ebp-78H]                    ; 0498 _ 8B. 45, 88
        mov     eax, dword [ebp+eax*4-20H]              ; 049B _ 8B. 44 85, E0
        mov     dword [eax+68H], 16                     ; 049F _ C7. 40, 68, 00000010
        mov     eax, dword [ebp-78H]                    ; 04A6 _ 8B. 45, 88
        mov     eax, dword [ebp+eax*4-20H]              ; 04A9 _ 8B. 44 85, E0
        mov     edx, dword [ebp-78H]                    ; 04AD _ 8B. 55, 88
        mov     edx, dword [ebp+edx*4-20H]              ; 04B0 _ 8B. 54 95, E0
        mov     edx, dword [edx+44H]                    ; 04B4 _ 8B. 52, 44
        sub     edx, 8                                  ; 04B7 _ 83. EA, 08
        mov     dword [eax+44H], edx                    ; 04BA _ 89. 50, 44
        mov     eax, dword [ebp-78H]                    ; 04BD _ 8B. 45, 88
        mov     eax, dword [ebp+eax*4-20H]              ; 04C0 _ 8B. 44 85, E0
        mov     eax, dword [eax+44H]                    ; 04C4 _ 8B. 40, 44
        add     eax, 4                                  ; 04C7 _ 83. C0, 04
        mov     edx, dword [ebp-78H]                    ; 04CA _ 8B. 55, 88
        mov     edx, dword [ebp+edx*4-2CH]              ; 04CD _ 8B. 54 95, D4
        mov     dword [eax], edx                        ; 04D1 _ 89. 10
        mov     eax, dword [ebp-78H]                    ; 04D3 _ 8B. 45, 88
        lea     edx, [eax+1H]                           ; 04D6 _ 8D. 50, 01
        mov     eax, edx                                ; 04D9 _ 89. D0
        shl     eax, 2                                  ; 04DB _ C1. E0, 02
        add     edx, eax                                ; 04DE _ 01. C2
        mov     eax, dword [ebp-78H]                    ; 04E0 _ 8B. 45, 88
        mov     eax, dword [ebp+eax*4-20H]              ; 04E3 _ 8B. 44 85, E0
        mov     dword [esp+4H], edx                     ; 04E7 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 04EB _ 89. 04 24
        call    task_run                                ; 04EE _ E8, FFFFFFFC(rel)
        add     dword [ebp-78H], 1                      ; 04F3 _ 83. 45, 88, 01
?_002:  cmp     dword [ebp-78H], 1                      ; 04F7 _ 83. 7D, 88, 01
        jle     ?_001                                   ; 04FB _ 0F 8E, FFFFFE8E
        mov     edx, dword [ebp-2CH]                    ; 0501 _ 8B. 55, D4
        mov     eax, dword [sheet_control]              ; 0504 _ A1, 00000000(d)
        mov     dword [esp+0CH], 28                     ; 0509 _ C7. 44 24, 0C, 0000001C
        mov     dword [esp+8H], 16                      ; 0511 _ C7. 44 24, 08, 00000010
        mov     dword [esp+4H], edx                     ; 0519 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 051D _ 89. 04 24
        call    sheet_slide                             ; 0520 _ E8, FFFFFFFC(rel)
        mov     edx, dword [ebp-2CH]                    ; 0525 _ 8B. 55, D4
        mov     eax, dword [sheet_control]              ; 0528 _ A1, 00000000(d)
        mov     dword [esp+8H], 1                       ; 052D _ C7. 44 24, 08, 00000001
        mov     dword [esp+4H], edx                     ; 0535 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0539 _ 89. 04 24
        call    sheet_updown                            ; 053C _ E8, FFFFFFFC(rel)
        mov     edx, dword [ebp-28H]                    ; 0541 _ 8B. 55, D8
        mov     eax, dword [sheet_control]              ; 0544 _ A1, 00000000(d)
        mov     dword [esp+0CH], 28                     ; 0549 _ C7. 44 24, 0C, 0000001C
        mov     dword [esp+8H], 160                     ; 0551 _ C7. 44 24, 08, 000000A0
        mov     dword [esp+4H], edx                     ; 0559 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 055D _ 89. 04 24
        call    sheet_slide                             ; 0560 _ E8, FFFFFFFC(rel)
        mov     edx, dword [ebp-28H]                    ; 0565 _ 8B. 55, D8
        mov     eax, dword [sheet_control]              ; 0568 _ A1, 00000000(d)
        mov     dword [esp+8H], 1                       ; 056D _ C7. 44 24, 08, 00000001
        mov     dword [esp+4H], edx                     ; 0575 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0579 _ 89. 04 24
        call    sheet_updown                            ; 057C _ E8, FFFFFFFC(rel)
        mov     dword [ebp-3CH], 0                      ; 0581 _ C7. 45, C4, 00000000
        mov     dword [ebp-38H], 0                      ; 0588 _ C7. 45, C8, 00000000
        mov     dword [ebp-34H], 0                      ; 058F _ C7. 45, CC, 00000000
        mov     dword [ebp-74H], 8                      ; 0596 _ C7. 45, 8C, 00000008
        mov     dword [ebp-70H], 7                      ; 059D _ C7. 45, 90, 00000007
        mov     dword [ebp-6CH], 0                      ; 05A4 _ C7. 45, 94, 00000000
        mov     dword [ebp-68H], 0                      ; 05AB _ C7. 45, 98, 00000000
?_003:  call    io_cli                                  ; 05B2 _ E8, FFFFFFFC(rel)
        mov     dword [esp], keyinfo                    ; 05B7 _ C7. 04 24, 00000000(d)
        call    fifo8_status                            ; 05BE _ E8, FFFFFFFC(rel)
        mov     ebx, eax                                ; 05C3 _ 89. C3
        mov     dword [esp], mouseinfo                  ; 05C5 _ C7. 04 24, 00000000(d)
        call    fifo8_status                            ; 05CC _ E8, FFFFFFFC(rel)
        add     ebx, eax                                ; 05D1 _ 01. C3
        mov     dword [esp], timerinfo1.1715            ; 05D3 _ C7. 04 24, 0000000C(d)
        call    fifo8_status                            ; 05DA _ E8, FFFFFFFC(rel)
        add     ebx, eax                                ; 05DF _ 01. C3
        mov     dword [esp], timerinfo2.1716            ; 05E1 _ C7. 04 24, 00000030(d)
        call    fifo8_status                            ; 05E8 _ E8, FFFFFFFC(rel)
        add     ebx, eax                                ; 05ED _ 01. C3
        mov     dword [esp], timerinfo3.1717            ; 05EF _ C7. 04 24, 00000054(d)
        call    fifo8_status                            ; 05F6 _ E8, FFFFFFFC(rel)
        add     eax, ebx                                ; 05FB _ 01. D8
        test    eax, eax                                ; 05FD _ 85. C0
        jnz     ?_004                                   ; 05FF _ 75, 0A
        call    io_sti                                  ; 0601 _ E8, FFFFFFFC(rel)
        jmp     ?_012                                   ; 0606 _ E9, 000003B9

?_004:  mov     dword [esp], keyinfo                    ; 060B _ C7. 04 24, 00000000(d)
        call    fifo8_status                            ; 0612 _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 0617 _ 85. C0
        je      ?_006                                   ; 0619 _ 0F 84, 0000019D
        call    io_sti                                  ; 061F _ E8, FFFFFFFC(rel)
        mov     dword [esp], keyinfo                    ; 0624 _ C7. 04 24, 00000000(d)
        call    fifo8_get                               ; 062B _ E8, FFFFFFFC(rel)
        mov     dword [ebp-3CH], eax                    ; 0630 _ 89. 45, C4
        cmp     dword [ebp-3CH], 128                    ; 0633 _ 81. 7D, C4, 00000080
        jle     ?_005                                   ; 063A _ 7E, 05
        jmp     ?_012                                   ; 063C _ E9, 00000383

?_005:  cmp     dword [ebp-3CH], 28                     ; 0641 _ 83. 7D, C4, 1C
        je      ?_012                                   ; 0645 _ 0F 84, 00000379
        mov     eax, dword [ebp-3CH]                    ; 064B _ 8B. 45, C4
        add     eax, keytable                           ; 064E _ 05, 00000000(d)
        movzx   eax, byte [eax]                         ; 0653 _ 0F B6. 00
        test    al, al                                  ; 0656 _ 84. C0
        je      ?_012                                   ; 0658 _ 0F 84, 00000366
        cmp     dword [ebp-74H], 143                    ; 065E _ 81. 7D, 8C, 0000008F
        jg      ?_012                                   ; 0665 _ 0F 8F, 00000359
        mov     eax, dword [ebp-74H]                    ; 066B _ 8B. 45, 8C
        lea     ecx, [eax+7H]                           ; 066E _ 8D. 48, 07
        mov     eax, dword [sheet_win]                  ; 0671 _ A1, 00000000(d)
        mov     edx, dword [eax+4H]                     ; 0676 _ 8B. 50, 04
        mov     eax, dword [sheet_win]                  ; 0679 _ A1, 00000000(d)
        mov     eax, dword [eax]                        ; 067E _ 8B. 00
        mov     dword [esp+18H], 43                     ; 0680 _ C7. 44 24, 18, 0000002B
        mov     dword [esp+14H], ecx                    ; 0688 _ 89. 4C 24, 14
        mov     dword [esp+10H], 28                     ; 068C _ C7. 44 24, 10, 0000001C
        mov     ecx, dword [ebp-74H]                    ; 0694 _ 8B. 4D, 8C
        mov     dword [esp+0CH], ecx                    ; 0697 _ 89. 4C 24, 0C
        mov     dword [esp+8H], 7                       ; 069B _ C7. 44 24, 08, 00000007
        mov     dword [esp+4H], edx                     ; 06A3 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 06A7 _ 89. 04 24
        call    paint_rectangle                         ; 06AA _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-74H]                    ; 06AF _ 8B. 45, 8C
        lea     ecx, [eax+8H]                           ; 06B2 _ 8D. 48, 08
        mov     edx, dword [sheet_win]                  ; 06B5 _ 8B. 15, 00000000(d)
        mov     eax, dword [sheet_control]              ; 06BB _ A1, 00000000(d)
        mov     dword [esp+14H], 44                     ; 06C0 _ C7. 44 24, 14, 0000002C
        mov     dword [esp+10H], ecx                    ; 06C8 _ 89. 4C 24, 10
        mov     dword [esp+0CH], 28                     ; 06CC _ C7. 44 24, 0C, 0000001C
        mov     ecx, dword [ebp-74H]                    ; 06D4 _ 8B. 4D, 8C
        mov     dword [esp+8H], ecx                     ; 06D7 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 06DB _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 06DF _ 89. 04 24
        call    sheet_refresh                           ; 06E2 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-3CH]                    ; 06E7 _ 8B. 45, C4
        add     eax, keytable                           ; 06EA _ 05, 00000000(d)
        movzx   eax, byte [eax]                         ; 06EF _ 0F B6. 00
        mov     byte [ebp-7AH], al                      ; 06F2 _ 88. 45, 86
        mov     byte [ebp-79H], 0                       ; 06F5 _ C6. 45, 87, 00
        mov     edx, dword [sheet_win]                  ; 06F9 _ 8B. 15, 00000000(d)
        mov     eax, dword [sheet_control]              ; 06FF _ A1, 00000000(d)
        mov     dword [esp+14H], 0                      ; 0704 _ C7. 44 24, 14, 00000000
        lea     ecx, [ebp-7AH]                          ; 070C _ 8D. 4D, 86
        mov     dword [esp+10H], ecx                    ; 070F _ 89. 4C 24, 10
        mov     dword [esp+0CH], 28                     ; 0713 _ C7. 44 24, 0C, 0000001C
        mov     ecx, dword [ebp-74H]                    ; 071B _ 8B. 4D, 8C
        mov     dword [esp+8H], ecx                     ; 071E _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 0722 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0726 _ 89. 04 24
        call    paint_string                            ; 0729 _ E8, FFFFFFFC(rel)
        add     dword [ebp-74H], 8                      ; 072E _ 83. 45, 8C, 08
        mov     dword [ebp-68H], 1                      ; 0732 _ C7. 45, 98, 00000001
        mov     eax, dword [ebp-74H]                    ; 0739 _ 8B. 45, 8C
        lea     ebx, [eax+7H]                           ; 073C _ 8D. 58, 07
        mov     eax, dword [ebp-70H]                    ; 073F _ 8B. 45, 90
        movzx   ecx, al                                 ; 0742 _ 0F B6. C8
        mov     eax, dword [sheet_win]                  ; 0745 _ A1, 00000000(d)
        mov     edx, dword [eax+4H]                     ; 074A _ 8B. 50, 04
        mov     eax, dword [sheet_win]                  ; 074D _ A1, 00000000(d)
        mov     eax, dword [eax]                        ; 0752 _ 8B. 00
        mov     dword [esp+18H], 43                     ; 0754 _ C7. 44 24, 18, 0000002B
        mov     dword [esp+14H], ebx                    ; 075C _ 89. 5C 24, 14
        mov     dword [esp+10H], 28                     ; 0760 _ C7. 44 24, 10, 0000001C
        mov     ebx, dword [ebp-74H]                    ; 0768 _ 8B. 5D, 8C
        mov     dword [esp+0CH], ebx                    ; 076B _ 89. 5C 24, 0C
        mov     dword [esp+8H], ecx                     ; 076F _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 0773 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0777 _ 89. 04 24
        call    paint_rectangle                         ; 077A _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-74H]                    ; 077F _ 8B. 45, 8C
        lea     ecx, [eax+8H]                           ; 0782 _ 8D. 48, 08
        mov     edx, dword [sheet_win]                  ; 0785 _ 8B. 15, 00000000(d)
        mov     eax, dword [sheet_control]              ; 078B _ A1, 00000000(d)
        mov     dword [esp+14H], 44                     ; 0790 _ C7. 44 24, 14, 0000002C
        mov     dword [esp+10H], ecx                    ; 0798 _ 89. 4C 24, 10
        mov     dword [esp+0CH], 28                     ; 079C _ C7. 44 24, 0C, 0000001C
        mov     ecx, dword [ebp-74H]                    ; 07A4 _ 8B. 4D, 8C
        mov     dword [esp+8H], ecx                     ; 07A7 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 07AB _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 07AF _ 89. 04 24
        call    sheet_refresh                           ; 07B2 _ E8, FFFFFFFC(rel)
        jmp     ?_003                                   ; 07B7 _ E9, FFFFFDF6

?_006:  mov     dword [esp], mouseinfo                  ; 07BC _ C7. 04 24, 00000000(d)
        call    fifo8_status                            ; 07C3 _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 07C8 _ 85. C0
        jz      ?_007                                   ; 07CA _ 74, 26
        mov     ecx, dword [mouse_sheet]                ; 07CC _ 8B. 0D, 00000008(d)
        mov     edx, dword [back_sheet]                 ; 07D2 _ 8B. 15, 00000004(d)
        mov     eax, dword [sheet_control]              ; 07D8 _ A1, 00000000(d)
        mov     dword [esp+8H], ecx                     ; 07DD _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 07E1 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 07E5 _ 89. 04 24
        call    show_mouse_info                         ; 07E8 _ E8, FFFFFFFC(rel)
        jmp     ?_012                                   ; 07ED _ E9, 000001D2

?_007:  mov     dword [esp], timerinfo1.1715            ; 07F2 _ C7. 04 24, 0000000C(d)
        call    fifo8_status                            ; 07F9 _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 07FE _ 85. C0
        je      ?_008                                   ; 0800 _ 0F 84, 0000008E
        call    io_sti                                  ; 0806 _ E8, FFFFFFFC(rel)
        mov     dword [esp], timerinfo1.1715            ; 080B _ C7. 04 24, 0000000C(d)
        call    fifo8_get                               ; 0812 _ E8, FFFFFFFC(rel)
        mov     edx, dword [back_sheet]                 ; 0817 _ 8B. 15, 00000004(d)
        mov     eax, dword [sheet_control]              ; 081D _ A1, 00000000(d)
        mov     dword [esp+14H], 7                      ; 0822 _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_190                  ; 082A _ C7. 44 24, 10, 00000007(d)
        mov     dword [esp+0CH], 144                    ; 0832 _ C7. 44 24, 0C, 00000090
        mov     ecx, dword [ebp-6CH]                    ; 083A _ 8B. 4D, 94
        mov     dword [esp+8H], ecx                     ; 083D _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 0841 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0845 _ 89. 04 24
        call    paint_string                            ; 0848 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 100                     ; 084D _ C7. 44 24, 04, 00000064
        mov     eax, dword [ebp-54H]                    ; 0855 _ 8B. 45, AC
        mov     dword [esp], eax                        ; 0858 _ 89. 04 24
        call    timer_settime                           ; 085B _ E8, FFFFFFFC(rel)
        add     dword [ebp-6CH], 8                      ; 0860 _ 83. 45, 94, 08
        cmp     dword [ebp-6CH], 40                     ; 0864 _ 83. 7D, 94, 28
        jle     ?_012                                   ; 0868 _ 0F 8E, 00000156
        cmp     dword [ebp-68H], 0                      ; 086E _ 83. 7D, 98, 00
        jne     ?_012                                   ; 0872 _ 0F 85, 0000014C
        call    io_cli                                  ; 0878 _ E8, FFFFFFFC(rel)
        mov     eax, dword [task_a.1728]                ; 087D _ A1, 00000078(d)
        mov     dword [esp], eax                        ; 0882 _ 89. 04 24
        call    task_sleep                              ; 0885 _ E8, FFFFFFFC(rel)
        call    io_sti                                  ; 088A _ E8, FFFFFFFC(rel)
        jmp     ?_003                                   ; 088F _ E9, FFFFFD1E

?_008:  mov     dword [esp], timerinfo2.1716            ; 0894 _ C7. 04 24, 00000030(d)
        call    fifo8_status                            ; 089B _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 08A0 _ 85. C0
        jz      ?_009                                   ; 08A2 _ 74, 16
        call    io_sti                                  ; 08A4 _ E8, FFFFFFFC(rel)
        mov     dword [esp], timerinfo2.1716            ; 08A9 _ C7. 04 24, 00000030(d)
        call    fifo8_get                               ; 08B0 _ E8, FFFFFFFC(rel)
        jmp     ?_012                                   ; 08B5 _ E9, 0000010A

?_009:  mov     dword [esp], timerinfo3.1717            ; 08BA _ C7. 04 24, 00000054(d)
        call    fifo8_status                            ; 08C1 _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 08C6 _ 85. C0
        je      ?_012                                   ; 08C8 _ 0F 84, 000000F6
        mov     dword [esp], timerinfo3.1717            ; 08CE _ C7. 04 24, 00000054(d)
        call    fifo8_get                               ; 08D5 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-30H], eax                    ; 08DA _ 89. 45, D0
        call    io_sti                                  ; 08DD _ E8, FFFFFFFC(rel)
        cmp     dword [ebp-30H], 0                      ; 08E2 _ 83. 7D, D0, 00
        jz      ?_010                                   ; 08E6 _ 74, 24
        mov     dword [esp+8H], 0                       ; 08E8 _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], timerinfo3.1717         ; 08F0 _ C7. 44 24, 04, 00000054(d)
        mov     eax, dword [ebp-4CH]                    ; 08F8 _ 8B. 45, B4
        mov     dword [esp], eax                        ; 08FB _ 89. 04 24
        call    timer_init                              ; 08FE _ E8, FFFFFFFC(rel)
        mov     dword [ebp-70H], 0                      ; 0903 _ C7. 45, 90, 00000000
        jmp     ?_011                                   ; 090A _ EB, 22

?_010:  mov     dword [esp+8H], 1                       ; 090C _ C7. 44 24, 08, 00000001
        mov     dword [esp+4H], timerinfo3.1717         ; 0914 _ C7. 44 24, 04, 00000054(d)
        mov     eax, dword [ebp-4CH]                    ; 091C _ 8B. 45, B4
        mov     dword [esp], eax                        ; 091F _ 89. 04 24
        call    timer_init                              ; 0922 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-70H], 7                      ; 0927 _ C7. 45, 90, 00000007
?_011:  mov     dword [esp+4H], 50                      ; 092E _ C7. 44 24, 04, 00000032
        mov     eax, dword [ebp-4CH]                    ; 0936 _ 8B. 45, B4
        mov     dword [esp], eax                        ; 0939 _ 89. 04 24
        call    timer_settime                           ; 093C _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-74H]                    ; 0941 _ 8B. 45, 8C
        lea     ebx, [eax+7H]                           ; 0944 _ 8D. 58, 07
        mov     eax, dword [ebp-70H]                    ; 0947 _ 8B. 45, 90
        movzx   ecx, al                                 ; 094A _ 0F B6. C8
        mov     eax, dword [sheet_win]                  ; 094D _ A1, 00000000(d)
        mov     edx, dword [eax+4H]                     ; 0952 _ 8B. 50, 04
        mov     eax, dword [sheet_win]                  ; 0955 _ A1, 00000000(d)
        mov     eax, dword [eax]                        ; 095A _ 8B. 00
        mov     dword [esp+18H], 43                     ; 095C _ C7. 44 24, 18, 0000002B
        mov     dword [esp+14H], ebx                    ; 0964 _ 89. 5C 24, 14
        mov     dword [esp+10H], 28                     ; 0968 _ C7. 44 24, 10, 0000001C
        mov     ebx, dword [ebp-74H]                    ; 0970 _ 8B. 5D, 8C
        mov     dword [esp+0CH], ebx                    ; 0973 _ 89. 5C 24, 0C
        mov     dword [esp+8H], ecx                     ; 0977 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 097B _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 097F _ 89. 04 24
        call    paint_rectangle                         ; 0982 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-74H]                    ; 0987 _ 8B. 45, 8C
        lea     ecx, [eax+8H]                           ; 098A _ 8D. 48, 08
        mov     edx, dword [sheet_win]                  ; 098D _ 8B. 15, 00000000(d)
        mov     eax, dword [sheet_control]              ; 0993 _ A1, 00000000(d)
        mov     dword [esp+14H], 44                     ; 0998 _ C7. 44 24, 14, 0000002C
        mov     dword [esp+10H], ecx                    ; 09A0 _ 89. 4C 24, 10
        mov     dword [esp+0CH], 28                     ; 09A4 _ C7. 44 24, 0C, 0000001C
        mov     ecx, dword [ebp-74H]                    ; 09AC _ 8B. 4D, 8C
        mov     dword [esp+8H], ecx                     ; 09AF _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 09B3 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 09B7 _ 89. 04 24
        call    sheet_refresh                           ; 09BA _ E8, FFFFFFFC(rel)
        jmp     ?_003                                   ; 09BF _ E9, FFFFFBEE

?_012:  jmp     ?_003                                   ; 09C4 _ E9, FFFFFBE9
; CMain End of function

task_b_main:; Function begin
        push    ebp                                     ; 09C9 _ 55
        mov     ebp, esp                                ; 09CA _ 89. E5
        sub     esp, 104                                ; 09CC _ 83. EC, 68
        mov     eax, dword [ebp+8H]                     ; 09CF _ 8B. 45, 08
        mov     dword [ebp-4CH], eax                    ; 09D2 _ 89. 45, B4
; Note: Absolute memory address without relocation
        mov     eax, dword [gs:14H]                     ; 09D5 _ 65: A1, 00000014
        mov     dword [ebp-0CH], eax                    ; 09DB _ 89. 45, F4
        xor     eax, eax                                ; 09DE _ 31. C0
        mov     edx, dword [back_sheet]                 ; 09E0 _ 8B. 15, 00000004(d)
        mov     eax, dword [sheet_control]              ; 09E6 _ A1, 00000000(d)
        mov     dword [esp+14H], 7                      ; 09EB _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_191                  ; 09F3 _ C7. 44 24, 10, 00000009(d)
        mov     dword [esp+0CH], 160                    ; 09FB _ C7. 44 24, 0C, 000000A0
        mov     dword [esp+8H], 0                       ; 0A03 _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], edx                     ; 0A0B _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0A0F _ 89. 04 24
        call    paint_string                            ; 0A12 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-3CH], 0                      ; 0A17 _ C7. 45, C4, 00000000
        mov     dword [ebp-38H], 0                      ; 0A1E _ C7. 45, C8, 00000000
        mov     dword [esp+0CH], 0                      ; 0A25 _ C7. 44 24, 0C, 00000000
        lea     eax, [ebp-14H]                          ; 0A2D _ 8D. 45, EC
        mov     dword [esp+8H], eax                     ; 0A30 _ 89. 44 24, 08
        mov     dword [esp+4H], 8                       ; 0A34 _ C7. 44 24, 04, 00000008
        lea     eax, [ebp-30H]                          ; 0A3C _ 8D. 45, D0
        mov     dword [esp], eax                        ; 0A3F _ 89. 04 24
        call    fifo8_init                              ; 0A42 _ E8, FFFFFFFC(rel)
        call    timer_alloc                             ; 0A47 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-3CH], eax                    ; 0A4C _ 89. 45, C4
        mov     dword [esp+8H], 123                     ; 0A4F _ C7. 44 24, 08, 0000007B
        lea     eax, [ebp-30H]                          ; 0A57 _ 8D. 45, D0
        mov     dword [esp+4H], eax                     ; 0A5A _ 89. 44 24, 04
        mov     eax, dword [ebp-3CH]                    ; 0A5E _ 8B. 45, C4
        mov     dword [esp], eax                        ; 0A61 _ 89. 04 24
        call    timer_init                              ; 0A64 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 100                     ; 0A69 _ C7. 44 24, 04, 00000064
        mov     eax, dword [ebp-3CH]                    ; 0A71 _ 8B. 45, C4
        mov     dword [esp], eax                        ; 0A74 _ 89. 04 24
        call    timer_settime                           ; 0A77 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-44H], 0                      ; 0A7C _ C7. 45, BC, 00000000
        mov     dword [ebp-40H], 0                      ; 0A83 _ C7. 45, C0, 00000000
?_013:  add     dword [ebp-44H], 1                      ; 0A8A _ 83. 45, BC, 01
        call    io_cli                                  ; 0A8E _ E8, FFFFFFFC(rel)
        lea     eax, [ebp-30H]                          ; 0A93 _ 8D. 45, D0
        mov     dword [esp], eax                        ; 0A96 _ 89. 04 24
        call    fifo8_status                            ; 0A99 _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 0A9E _ 85. C0
        jnz     ?_014                                   ; 0AA0 _ 75, 0A
        call    io_sti                                  ; 0AA2 _ E8, FFFFFFFC(rel)
        jmp     ?_015                                   ; 0AA7 _ E9, 00000121

?_014:  lea     eax, [ebp-30H]                          ; 0AAC _ 8D. 45, D0
        mov     dword [esp], eax                        ; 0AAF _ 89. 04 24
        call    fifo8_get                               ; 0AB2 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-38H], eax                    ; 0AB7 _ 89. 45, C8
        call    io_sti                                  ; 0ABA _ E8, FFFFFFFC(rel)
        cmp     dword [ebp-38H], 123                    ; 0ABF _ 83. 7D, C8, 7B
        jne     ?_015                                   ; 0AC3 _ 0F 85, 00000104
        mov     edx, dword [back_sheet]                 ; 0AC9 _ 8B. 15, 00000004(d)
        mov     eax, dword [sheet_control]              ; 0ACF _ A1, 00000000(d)
        mov     dword [esp+14H], 7                      ; 0AD4 _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_192                  ; 0ADC _ C7. 44 24, 10, 00000016(d)
        mov     dword [esp+0CH], 176                    ; 0AE4 _ C7. 44 24, 0C, 000000B0
        mov     ecx, dword [ebp-40H]                    ; 0AEC _ 8B. 4D, C0
        mov     dword [esp+8H], ecx                     ; 0AEF _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 0AF3 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0AF7 _ 89. 04 24
        call    paint_string                            ; 0AFA _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 100                     ; 0AFF _ C7. 44 24, 04, 00000064
        mov     eax, dword [ebp-3CH]                    ; 0B07 _ 8B. 45, C4
        mov     dword [esp], eax                        ; 0B0A _ 89. 04 24
        call    timer_settime                           ; 0B0D _ E8, FFFFFFFC(rel)
        add     dword [ebp-40H], 8                      ; 0B12 _ 83. 45, C0, 08
        mov     eax, dword [ebp-4CH]                    ; 0B16 _ 8B. 45, B4
        mov     eax, dword [eax]                        ; 0B19 _ 8B. 00
        mov     dword [esp+18H], 44                     ; 0B1B _ C7. 44 24, 18, 0000002C
        mov     dword [esp+14H], 104                    ; 0B23 _ C7. 44 24, 14, 00000068
        mov     dword [esp+10H], 28                     ; 0B2B _ C7. 44 24, 10, 0000001C
        mov     dword [esp+0CH], 24                     ; 0B33 _ C7. 44 24, 0C, 00000018
        mov     dword [esp+8H], 8                       ; 0B3B _ C7. 44 24, 08, 00000008
        mov     dword [esp+4H], 144                     ; 0B43 _ C7. 44 24, 04, 00000090
        mov     dword [esp], eax                        ; 0B4B _ 89. 04 24
        call    paint_rectangle                         ; 0B4E _ E8, FFFFFFFC(rel)
        mov     eax, dword [sheet_control]              ; 0B53 _ A1, 00000000(d)
        mov     dword [esp+14H], 44                     ; 0B58 _ C7. 44 24, 14, 0000002C
        mov     dword [esp+10H], 104                    ; 0B60 _ C7. 44 24, 10, 00000068
        mov     dword [esp+0CH], 28                     ; 0B68 _ C7. 44 24, 0C, 0000001C
        mov     dword [esp+8H], 24                      ; 0B70 _ C7. 44 24, 08, 00000018
        mov     edx, dword [ebp-4CH]                    ; 0B78 _ 8B. 55, B4
        mov     dword [esp+4H], edx                     ; 0B7B _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0B7F _ 89. 04 24
        call    sheet_refresh                           ; 0B82 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-44H]                    ; 0B87 _ 8B. 45, BC
        mov     dword [esp], eax                        ; 0B8A _ 89. 04 24
        call    intToHexStr                             ; 0B8D _ E8, FFFFFFFC(rel)
        mov     dword [ebp-34H], eax                    ; 0B92 _ 89. 45, CC
        mov     eax, dword [sheet_control]              ; 0B95 _ A1, 00000000(d)
        mov     dword [esp+14H], 7                      ; 0B9A _ C7. 44 24, 14, 00000007
        mov     edx, dword [ebp-34H]                    ; 0BA2 _ 8B. 55, CC
        mov     dword [esp+10H], edx                    ; 0BA5 _ 89. 54 24, 10
        mov     dword [esp+0CH], 28                     ; 0BA9 _ C7. 44 24, 0C, 0000001C
        mov     dword [esp+8H], 24                      ; 0BB1 _ C7. 44 24, 08, 00000018
        mov     edx, dword [ebp-4CH]                    ; 0BB9 _ 8B. 55, B4
        mov     dword [esp+4H], edx                     ; 0BBC _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0BC0 _ 89. 04 24
        call    paint_string                            ; 0BC3 _ E8, FFFFFFFC(rel)
        jmp     ?_013                                   ; 0BC8 _ E9, FFFFFEBD

?_015:  jmp     ?_013                                   ; 0BCD _ E9, FFFFFEB8
; task_b_main End of function

init_screeninfo:; Function begin
        push    ebp                                     ; 0BD2 _ 55
        mov     ebp, esp                                ; 0BD3 _ 89. E5
        mov     eax, dword [VRAM_ADDRESS]               ; 0BD5 _ A1, 00000000(d)
        mov     edx, eax                                ; 0BDA _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0BDC _ 8B. 45, 08
        mov     dword [eax], edx                        ; 0BDF _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 0BE1 _ 8B. 45, 08
; Note: Length-changing prefix causes delay on Intel processors
        mov     word [eax+4H], 640                      ; 0BE4 _ 66: C7. 40, 04, 0280
        mov     eax, dword [ebp+8H]                     ; 0BEA _ 8B. 45, 08
; Note: Length-changing prefix causes delay on Intel processors
        mov     word [eax+6H], 480                      ; 0BED _ 66: C7. 40, 06, 01E0
        pop     ebp                                     ; 0BF3 _ 5D
        ret                                             ; 0BF4 _ C3
; init_screeninfo End of function

init_palette:; Function begin
        push    ebp                                     ; 0BF5 _ 55
        mov     ebp, esp                                ; 0BF6 _ 89. E5
        sub     esp, 24                                 ; 0BF8 _ 83. EC, 18
        mov     dword [esp+8H], table_rgb.1686          ; 0BFB _ C7. 44 24, 08, 00000080(d)
        mov     dword [esp+4H], 15                      ; 0C03 _ C7. 44 24, 04, 0000000F
        mov     dword [esp], 0                          ; 0C0B _ C7. 04 24, 00000000
        call    set_palette                             ; 0C12 _ E8, FFFFFFFC(rel)
        nop                                             ; 0C17 _ 90
        leave                                           ; 0C18 _ C9
        ret                                             ; 0C19 _ C3
; init_palette End of function

set_palette:; Function begin
        push    ebp                                     ; 0C1A _ 55
        mov     ebp, esp                                ; 0C1B _ 89. E5
        sub     esp, 40                                 ; 0C1D _ 83. EC, 28
        call    io_load_eflags                          ; 0C20 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 0C25 _ 89. 45, F4
        call    io_cli                                  ; 0C28 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 0C2D _ 8B. 45, 08
        mov     dword [esp+4H], eax                     ; 0C30 _ 89. 44 24, 04
        mov     dword [esp], 968                        ; 0C34 _ C7. 04 24, 000003C8
        call    io_out8                                 ; 0C3B _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 0C40 _ 8B. 45, 08
        mov     dword [ebp-10H], eax                    ; 0C43 _ 89. 45, F0
        jmp     ?_017                                   ; 0C46 _ EB, 62

?_016:  mov     eax, dword [ebp+10H]                    ; 0C48 _ 8B. 45, 10
        movzx   eax, byte [eax]                         ; 0C4B _ 0F B6. 00
        shr     al, 2                                   ; 0C4E _ C0. E8, 02
        movzx   eax, al                                 ; 0C51 _ 0F B6. C0
        mov     dword [esp+4H], eax                     ; 0C54 _ 89. 44 24, 04
        mov     dword [esp], 969                        ; 0C58 _ C7. 04 24, 000003C9
        call    io_out8                                 ; 0C5F _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0C64 _ 8B. 45, 10
        add     eax, 1                                  ; 0C67 _ 83. C0, 01
        movzx   eax, byte [eax]                         ; 0C6A _ 0F B6. 00
        shr     al, 2                                   ; 0C6D _ C0. E8, 02
        movzx   eax, al                                 ; 0C70 _ 0F B6. C0
        mov     dword [esp+4H], eax                     ; 0C73 _ 89. 44 24, 04
        mov     dword [esp], 969                        ; 0C77 _ C7. 04 24, 000003C9
        call    io_out8                                 ; 0C7E _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0C83 _ 8B. 45, 10
        add     eax, 2                                  ; 0C86 _ 83. C0, 02
        movzx   eax, byte [eax]                         ; 0C89 _ 0F B6. 00
        shr     al, 2                                   ; 0C8C _ C0. E8, 02
        movzx   eax, al                                 ; 0C8F _ 0F B6. C0
        mov     dword [esp+4H], eax                     ; 0C92 _ 89. 44 24, 04
        mov     dword [esp], 969                        ; 0C96 _ C7. 04 24, 000003C9
        call    io_out8                                 ; 0C9D _ E8, FFFFFFFC(rel)
        add     dword [ebp+10H], 3                      ; 0CA2 _ 83. 45, 10, 03
        add     dword [ebp-10H], 1                      ; 0CA6 _ 83. 45, F0, 01
?_017:  mov     eax, dword [ebp-10H]                    ; 0CAA _ 8B. 45, F0
        cmp     eax, dword [ebp+0CH]                    ; 0CAD _ 3B. 45, 0C
        jle     ?_016                                   ; 0CB0 _ 7E, 96
        mov     eax, dword [ebp-0CH]                    ; 0CB2 _ 8B. 45, F4
        mov     dword [esp], eax                        ; 0CB5 _ 89. 04 24
        call    io_store_eflags                         ; 0CB8 _ E8, FFFFFFFC(rel)
        nop                                             ; 0CBD _ 90
        leave                                           ; 0CBE _ C9
        ret                                             ; 0CBF _ C3
; set_palette End of function

paint_rectangle:; Function begin
        push    ebp                                     ; 0CC0 _ 55
        mov     ebp, esp                                ; 0CC1 _ 89. E5
        sub     esp, 20                                 ; 0CC3 _ 83. EC, 14
        mov     eax, dword [ebp+10H]                    ; 0CC6 _ 8B. 45, 10
        mov     byte [ebp-14H], al                      ; 0CC9 _ 88. 45, EC
        mov     eax, dword [ebp+18H]                    ; 0CCC _ 8B. 45, 18
        mov     dword [ebp-4H], eax                     ; 0CCF _ 89. 45, FC
        jmp     ?_021                                   ; 0CD2 _ EB, 33

?_018:  mov     eax, dword [ebp+14H]                    ; 0CD4 _ 8B. 45, 14
        mov     dword [ebp-8H], eax                     ; 0CD7 _ 89. 45, F8
        jmp     ?_020                                   ; 0CDA _ EB, 1F

?_019:  mov     eax, dword [ebp-4H]                     ; 0CDC _ 8B. 45, FC
        imul    eax, dword [ebp+0CH]                    ; 0CDF _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0CE3 _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 0CE5 _ 8B. 45, F8
        add     eax, edx                                ; 0CE8 _ 01. D0
        mov     edx, eax                                ; 0CEA _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0CEC _ 8B. 45, 08
        add     edx, eax                                ; 0CEF _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0CF1 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0CF5 _ 88. 02
        add     dword [ebp-8H], 1                       ; 0CF7 _ 83. 45, F8, 01
?_020:  mov     eax, dword [ebp-8H]                     ; 0CFB _ 8B. 45, F8
        cmp     eax, dword [ebp+1CH]                    ; 0CFE _ 3B. 45, 1C
        jle     ?_019                                   ; 0D01 _ 7E, D9
        add     dword [ebp-4H], 1                       ; 0D03 _ 83. 45, FC, 01
?_021:  mov     eax, dword [ebp-4H]                     ; 0D07 _ 8B. 45, FC
        cmp     eax, dword [ebp+20H]                    ; 0D0A _ 3B. 45, 20
        jle     ?_018                                   ; 0D0D _ 7E, C5
        leave                                           ; 0D0F _ C9
        ret                                             ; 0D10 _ C3
; paint_rectangle End of function

init_desktop:; Function begin
        push    ebp                                     ; 0D11 _ 55
        mov     ebp, esp                                ; 0D12 _ 89. E5
        push    ebx                                     ; 0D14 _ 53
        sub     esp, 28                                 ; 0D15 _ 83. EC, 1C
        mov     eax, dword [ebp+10H]                    ; 0D18 _ 8B. 45, 10
        lea     edx, [eax-1DH]                          ; 0D1B _ 8D. 50, E3
        mov     eax, dword [ebp+0CH]                    ; 0D1E _ 8B. 45, 0C
        sub     eax, 1                                  ; 0D21 _ 83. E8, 01
        mov     dword [esp+18H], edx                    ; 0D24 _ 89. 54 24, 18
        mov     dword [esp+14H], eax                    ; 0D28 _ 89. 44 24, 14
        mov     dword [esp+10H], 0                      ; 0D2C _ C7. 44 24, 10, 00000000
        mov     dword [esp+0CH], 0                      ; 0D34 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 2                       ; 0D3C _ C7. 44 24, 08, 00000002
        mov     eax, dword [ebp+0CH]                    ; 0D44 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0D47 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0D4B _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0D4E _ 89. 04 24
        call    paint_rectangle                         ; 0D51 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0D56 _ 8B. 45, 10
        lea     ecx, [eax-1CH]                          ; 0D59 _ 8D. 48, E4
        mov     eax, dword [ebp+0CH]                    ; 0D5C _ 8B. 45, 0C
        lea     edx, [eax-1H]                           ; 0D5F _ 8D. 50, FF
        mov     eax, dword [ebp+10H]                    ; 0D62 _ 8B. 45, 10
        sub     eax, 28                                 ; 0D65 _ 83. E8, 1C
        mov     dword [esp+18H], ecx                    ; 0D68 _ 89. 4C 24, 18
        mov     dword [esp+14H], edx                    ; 0D6C _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 0D70 _ 89. 44 24, 10
        mov     dword [esp+0CH], 0                      ; 0D74 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 8                       ; 0D7C _ C7. 44 24, 08, 00000008
        mov     eax, dword [ebp+0CH]                    ; 0D84 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0D87 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0D8B _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0D8E _ 89. 04 24
        call    paint_rectangle                         ; 0D91 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0D96 _ 8B. 45, 10
        lea     ecx, [eax-1BH]                          ; 0D99 _ 8D. 48, E5
        mov     eax, dword [ebp+0CH]                    ; 0D9C _ 8B. 45, 0C
        lea     edx, [eax-1H]                           ; 0D9F _ 8D. 50, FF
        mov     eax, dword [ebp+10H]                    ; 0DA2 _ 8B. 45, 10
        sub     eax, 27                                 ; 0DA5 _ 83. E8, 1B
        mov     dword [esp+18H], ecx                    ; 0DA8 _ 89. 4C 24, 18
        mov     dword [esp+14H], edx                    ; 0DAC _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 0DB0 _ 89. 44 24, 10
        mov     dword [esp+0CH], 0                      ; 0DB4 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 7                       ; 0DBC _ C7. 44 24, 08, 00000007
        mov     eax, dword [ebp+0CH]                    ; 0DC4 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0DC7 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0DCB _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0DCE _ 89. 04 24
        call    paint_rectangle                         ; 0DD1 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0DD6 _ 8B. 45, 10
        lea     ecx, [eax-1H]                           ; 0DD9 _ 8D. 48, FF
        mov     eax, dword [ebp+0CH]                    ; 0DDC _ 8B. 45, 0C
        lea     edx, [eax-1H]                           ; 0DDF _ 8D. 50, FF
        mov     eax, dword [ebp+10H]                    ; 0DE2 _ 8B. 45, 10
        sub     eax, 26                                 ; 0DE5 _ 83. E8, 1A
        mov     dword [esp+18H], ecx                    ; 0DE8 _ 89. 4C 24, 18
        mov     dword [esp+14H], edx                    ; 0DEC _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 0DF0 _ 89. 44 24, 10
        mov     dword [esp+0CH], 0                      ; 0DF4 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 8                       ; 0DFC _ C7. 44 24, 08, 00000008
        mov     eax, dword [ebp+0CH]                    ; 0E04 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0E07 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0E0B _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0E0E _ 89. 04 24
        call    paint_rectangle                         ; 0E11 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0E16 _ 8B. 45, 10
        lea     edx, [eax-18H]                          ; 0E19 _ 8D. 50, E8
        mov     eax, dword [ebp+10H]                    ; 0E1C _ 8B. 45, 10
        sub     eax, 24                                 ; 0E1F _ 83. E8, 18
        mov     dword [esp+18H], edx                    ; 0E22 _ 89. 54 24, 18
        mov     dword [esp+14H], 59                     ; 0E26 _ C7. 44 24, 14, 0000003B
        mov     dword [esp+10H], eax                    ; 0E2E _ 89. 44 24, 10
        mov     dword [esp+0CH], 3                      ; 0E32 _ C7. 44 24, 0C, 00000003
        mov     dword [esp+8H], 7                       ; 0E3A _ C7. 44 24, 08, 00000007
        mov     eax, dword [ebp+0CH]                    ; 0E42 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0E45 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0E49 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0E4C _ 89. 04 24
        call    paint_rectangle                         ; 0E4F _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0E54 _ 8B. 45, 10
        lea     edx, [eax-4H]                           ; 0E57 _ 8D. 50, FC
        mov     eax, dword [ebp+10H]                    ; 0E5A _ 8B. 45, 10
        sub     eax, 24                                 ; 0E5D _ 83. E8, 18
        mov     dword [esp+18H], edx                    ; 0E60 _ 89. 54 24, 18
        mov     dword [esp+14H], 2                      ; 0E64 _ C7. 44 24, 14, 00000002
        mov     dword [esp+10H], eax                    ; 0E6C _ 89. 44 24, 10
        mov     dword [esp+0CH], 2                      ; 0E70 _ C7. 44 24, 0C, 00000002
        mov     dword [esp+8H], 7                       ; 0E78 _ C7. 44 24, 08, 00000007
        mov     eax, dword [ebp+0CH]                    ; 0E80 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0E83 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0E87 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0E8A _ 89. 04 24
        call    paint_rectangle                         ; 0E8D _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0E92 _ 8B. 45, 10
        lea     edx, [eax-4H]                           ; 0E95 _ 8D. 50, FC
        mov     eax, dword [ebp+10H]                    ; 0E98 _ 8B. 45, 10
        sub     eax, 4                                  ; 0E9B _ 83. E8, 04
        mov     dword [esp+18H], edx                    ; 0E9E _ 89. 54 24, 18
        mov     dword [esp+14H], 59                     ; 0EA2 _ C7. 44 24, 14, 0000003B
        mov     dword [esp+10H], eax                    ; 0EAA _ 89. 44 24, 10
        mov     dword [esp+0CH], 3                      ; 0EAE _ C7. 44 24, 0C, 00000003
        mov     dword [esp+8H], 2                       ; 0EB6 _ C7. 44 24, 08, 00000002
        mov     eax, dword [ebp+0CH]                    ; 0EBE _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0EC1 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0EC5 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0EC8 _ 89. 04 24
        call    paint_rectangle                         ; 0ECB _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0ED0 _ 8B. 45, 10
        lea     edx, [eax-5H]                           ; 0ED3 _ 8D. 50, FB
        mov     eax, dword [ebp+10H]                    ; 0ED6 _ 8B. 45, 10
        sub     eax, 23                                 ; 0ED9 _ 83. E8, 17
        mov     dword [esp+18H], edx                    ; 0EDC _ 89. 54 24, 18
        mov     dword [esp+14H], 59                     ; 0EE0 _ C7. 44 24, 14, 0000003B
        mov     dword [esp+10H], eax                    ; 0EE8 _ 89. 44 24, 10
        mov     dword [esp+0CH], 59                     ; 0EEC _ C7. 44 24, 0C, 0000003B
        mov     dword [esp+8H], 2                       ; 0EF4 _ C7. 44 24, 08, 00000002
        mov     eax, dword [ebp+0CH]                    ; 0EFC _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0EFF _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0F03 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0F06 _ 89. 04 24
        call    paint_rectangle                         ; 0F09 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0F0E _ 8B. 45, 10
        lea     edx, [eax-3H]                           ; 0F11 _ 8D. 50, FD
        mov     eax, dword [ebp+10H]                    ; 0F14 _ 8B. 45, 10
        sub     eax, 3                                  ; 0F17 _ 83. E8, 03
        mov     dword [esp+18H], edx                    ; 0F1A _ 89. 54 24, 18
        mov     dword [esp+14H], 59                     ; 0F1E _ C7. 44 24, 14, 0000003B
        mov     dword [esp+10H], eax                    ; 0F26 _ 89. 44 24, 10
        mov     dword [esp+0CH], 2                      ; 0F2A _ C7. 44 24, 0C, 00000002
        mov     dword [esp+8H], 0                       ; 0F32 _ C7. 44 24, 08, 00000000
        mov     eax, dword [ebp+0CH]                    ; 0F3A _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0F3D _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0F41 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0F44 _ 89. 04 24
        call    paint_rectangle                         ; 0F47 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0F4C _ 8B. 45, 10
        lea     edx, [eax-3H]                           ; 0F4F _ 8D. 50, FD
        mov     eax, dword [ebp+10H]                    ; 0F52 _ 8B. 45, 10
        sub     eax, 24                                 ; 0F55 _ 83. E8, 18
        mov     dword [esp+18H], edx                    ; 0F58 _ 89. 54 24, 18
        mov     dword [esp+14H], 60                     ; 0F5C _ C7. 44 24, 14, 0000003C
        mov     dword [esp+10H], eax                    ; 0F64 _ 89. 44 24, 10
        mov     dword [esp+0CH], 60                     ; 0F68 _ C7. 44 24, 0C, 0000003C
        mov     dword [esp+8H], 0                       ; 0F70 _ C7. 44 24, 08, 00000000
        mov     eax, dword [ebp+0CH]                    ; 0F78 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0F7B _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0F7F _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0F82 _ 89. 04 24
        call    paint_rectangle                         ; 0F85 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0F8A _ 8B. 45, 10
        lea     ebx, [eax-18H]                          ; 0F8D _ 8D. 58, E8
        mov     eax, dword [ebp+0CH]                    ; 0F90 _ 8B. 45, 0C
        lea     ecx, [eax-4H]                           ; 0F93 _ 8D. 48, FC
        mov     eax, dword [ebp+10H]                    ; 0F96 _ 8B. 45, 10
        lea     edx, [eax-18H]                          ; 0F99 _ 8D. 50, E8
        mov     eax, dword [ebp+0CH]                    ; 0F9C _ 8B. 45, 0C
        sub     eax, 47                                 ; 0F9F _ 83. E8, 2F
        mov     dword [esp+18H], ebx                    ; 0FA2 _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 0FA6 _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 0FAA _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 0FAE _ 89. 44 24, 0C
        mov     dword [esp+8H], 2                       ; 0FB2 _ C7. 44 24, 08, 00000002
        mov     eax, dword [ebp+0CH]                    ; 0FBA _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0FBD _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0FC1 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0FC4 _ 89. 04 24
        call    paint_rectangle                         ; 0FC7 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0FCC _ 8B. 45, 10
        lea     ebx, [eax-4H]                           ; 0FCF _ 8D. 58, FC
        mov     eax, dword [ebp+0CH]                    ; 0FD2 _ 8B. 45, 0C
        lea     ecx, [eax-2FH]                          ; 0FD5 _ 8D. 48, D1
        mov     eax, dword [ebp+10H]                    ; 0FD8 _ 8B. 45, 10
        lea     edx, [eax-17H]                          ; 0FDB _ 8D. 50, E9
        mov     eax, dword [ebp+0CH]                    ; 0FDE _ 8B. 45, 0C
        sub     eax, 47                                 ; 0FE1 _ 83. E8, 2F
        mov     dword [esp+18H], ebx                    ; 0FE4 _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 0FE8 _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 0FEC _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 0FF0 _ 89. 44 24, 0C
        mov     dword [esp+8H], 2                       ; 0FF4 _ C7. 44 24, 08, 00000002
        mov     eax, dword [ebp+0CH]                    ; 0FFC _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0FFF _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1003 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1006 _ 89. 04 24
        call    paint_rectangle                         ; 1009 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 100E _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 1011 _ 8D. 58, FD
        mov     eax, dword [ebp+0CH]                    ; 1014 _ 8B. 45, 0C
        lea     ecx, [eax-4H]                           ; 1017 _ 8D. 48, FC
        mov     eax, dword [ebp+10H]                    ; 101A _ 8B. 45, 10
        lea     edx, [eax-3H]                           ; 101D _ 8D. 50, FD
        mov     eax, dword [ebp+0CH]                    ; 1020 _ 8B. 45, 0C
        sub     eax, 47                                 ; 1023 _ 83. E8, 2F
        mov     dword [esp+18H], ebx                    ; 1026 _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 102A _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 102E _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 1032 _ 89. 44 24, 0C
        mov     dword [esp+8H], 7                       ; 1036 _ C7. 44 24, 08, 00000007
        mov     eax, dword [ebp+0CH]                    ; 103E _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 1041 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1045 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1048 _ 89. 04 24
        call    paint_rectangle                         ; 104B _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 1050 _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 1053 _ 8D. 58, FD
        mov     eax, dword [ebp+0CH]                    ; 1056 _ 8B. 45, 0C
        lea     ecx, [eax-3H]                           ; 1059 _ 8D. 48, FD
        mov     eax, dword [ebp+10H]                    ; 105C _ 8B. 45, 10
        lea     edx, [eax-18H]                          ; 105F _ 8D. 50, E8
        mov     eax, dword [ebp+0CH]                    ; 1062 _ 8B. 45, 0C
        sub     eax, 3                                  ; 1065 _ 83. E8, 03
        mov     dword [esp+18H], ebx                    ; 1068 _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 106C _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 1070 _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 1074 _ 89. 44 24, 0C
        mov     dword [esp+8H], 7                       ; 1078 _ C7. 44 24, 08, 00000007
        mov     eax, dword [ebp+0CH]                    ; 1080 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 1083 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1087 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 108A _ 89. 04 24
        call    paint_rectangle                         ; 108D _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1092 _ 83. C4, 1C
        pop     ebx                                     ; 1095 _ 5B
        pop     ebp                                     ; 1096 _ 5D
        ret                                             ; 1097 _ C3
; init_desktop End of function

init_mouse_position:; Function begin
        push    ebp                                     ; 1098 _ 55
        mov     ebp, esp                                ; 1099 _ 89. E5
        sub     esp, 16                                 ; 109B _ 83. EC, 10
        movzx   eax, word [?_201]                       ; 109E _ 0F B7. 05, 00000184(d)
        cwde                                            ; 10A5 _ 98
        mov     dword [ebp-8H], eax                     ; 10A6 _ 89. 45, F8
        movzx   eax, word [?_202]                       ; 10A9 _ 0F B7. 05, 00000186(d)
        cwde                                            ; 10B0 _ 98
        mov     dword [ebp-4H], eax                     ; 10B1 _ 89. 45, FC
        mov     eax, dword [ebp-8H]                     ; 10B4 _ 8B. 45, F8
        sub     eax, 16                                 ; 10B7 _ 83. E8, 10
        mov     edx, eax                                ; 10BA _ 89. C2
        shr     edx, 31                                 ; 10BC _ C1. EA, 1F
        add     eax, edx                                ; 10BF _ 01. D0
        sar     eax, 1                                  ; 10C1 _ D1. F8
        mov     dword [mouse_x], eax                    ; 10C3 _ A3, 000002A8(d)
        mov     eax, dword [ebp-4H]                     ; 10C8 _ 8B. 45, FC
        sub     eax, 44                                 ; 10CB _ 83. E8, 2C
        mov     edx, eax                                ; 10CE _ 89. C2
        shr     edx, 31                                 ; 10D0 _ C1. EA, 1F
        add     eax, edx                                ; 10D3 _ 01. D0
        sar     eax, 1                                  ; 10D5 _ D1. F8
        mov     dword [mouse_y], eax                    ; 10D7 _ A3, 000002AC(d)
        leave                                           ; 10DC _ C9
        ret                                             ; 10DD _ C3
; init_mouse_position End of function

paint_font:; Function begin
        push    ebp                                     ; 10DE _ 55
        mov     ebp, esp                                ; 10DF _ 89. E5
        sub     esp, 20                                 ; 10E1 _ 83. EC, 14
        mov     eax, dword [ebp+1CH]                    ; 10E4 _ 8B. 45, 1C
        mov     byte [ebp-14H], al                      ; 10E7 _ 88. 45, EC
        mov     dword [ebp-4H], 0                       ; 10EA _ C7. 45, FC, 00000000
        jmp     ?_031                                   ; 10F1 _ E9, 0000016E

?_022:  mov     edx, dword [ebp-4H]                     ; 10F6 _ 8B. 55, FC
        mov     eax, dword [ebp+18H]                    ; 10F9 _ 8B. 45, 18
        add     eax, edx                                ; 10FC _ 01. D0
        movzx   eax, byte [eax]                         ; 10FE _ 0F B6. 00
        mov     byte [ebp-5H], al                       ; 1101 _ 88. 45, FB
        movzx   eax, byte [ebp-5H]                      ; 1104 _ 0F B6. 45, FB
        test    al, al                                  ; 1108 _ 84. C0
        jns     ?_023                                   ; 110A _ 79, 20
        mov     eax, dword [ebp-4H]                     ; 110C _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 110F _ 8B. 55, 14
        add     eax, edx                                ; 1112 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 1114 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 1118 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 111A _ 8B. 45, 10
        add     eax, edx                                ; 111D _ 01. D0
        mov     edx, eax                                ; 111F _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 1121 _ 8B. 45, 08
        add     edx, eax                                ; 1124 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 1126 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 112A _ 88. 02
?_023:  movzx   eax, byte [ebp-5H]                      ; 112C _ 0F B6. 45, FB
        and     eax, 40H                                ; 1130 _ 83. E0, 40
        test    eax, eax                                ; 1133 _ 85. C0
        jz      ?_024                                   ; 1135 _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 1137 _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 113A _ 8B. 55, 14
        add     eax, edx                                ; 113D _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 113F _ 0F AF. 45, 0C
        mov     edx, eax                                ; 1143 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 1145 _ 8B. 45, 10
        add     eax, edx                                ; 1148 _ 01. D0
        lea     edx, [eax+1H]                           ; 114A _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 114D _ 8B. 45, 08
        add     edx, eax                                ; 1150 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 1152 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 1156 _ 88. 02
?_024:  movzx   eax, byte [ebp-5H]                      ; 1158 _ 0F B6. 45, FB
        and     eax, 20H                                ; 115C _ 83. E0, 20
        test    eax, eax                                ; 115F _ 85. C0
        jz      ?_025                                   ; 1161 _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 1163 _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 1166 _ 8B. 55, 14
        add     eax, edx                                ; 1169 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 116B _ 0F AF. 45, 0C
        mov     edx, eax                                ; 116F _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 1171 _ 8B. 45, 10
        add     eax, edx                                ; 1174 _ 01. D0
        lea     edx, [eax+2H]                           ; 1176 _ 8D. 50, 02
        mov     eax, dword [ebp+8H]                     ; 1179 _ 8B. 45, 08
        add     edx, eax                                ; 117C _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 117E _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 1182 _ 88. 02
?_025:  movzx   eax, byte [ebp-5H]                      ; 1184 _ 0F B6. 45, FB
        and     eax, 10H                                ; 1188 _ 83. E0, 10
        test    eax, eax                                ; 118B _ 85. C0
        jz      ?_026                                   ; 118D _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 118F _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 1192 _ 8B. 55, 14
        add     eax, edx                                ; 1195 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 1197 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 119B _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 119D _ 8B. 45, 10
        add     eax, edx                                ; 11A0 _ 01. D0
        lea     edx, [eax+3H]                           ; 11A2 _ 8D. 50, 03
        mov     eax, dword [ebp+8H]                     ; 11A5 _ 8B. 45, 08
        add     edx, eax                                ; 11A8 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 11AA _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 11AE _ 88. 02
?_026:  movzx   eax, byte [ebp-5H]                      ; 11B0 _ 0F B6. 45, FB
        and     eax, 08H                                ; 11B4 _ 83. E0, 08
        test    eax, eax                                ; 11B7 _ 85. C0
        jz      ?_027                                   ; 11B9 _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 11BB _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 11BE _ 8B. 55, 14
        add     eax, edx                                ; 11C1 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 11C3 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 11C7 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 11C9 _ 8B. 45, 10
        add     eax, edx                                ; 11CC _ 01. D0
        lea     edx, [eax+4H]                           ; 11CE _ 8D. 50, 04
        mov     eax, dword [ebp+8H]                     ; 11D1 _ 8B. 45, 08
        add     edx, eax                                ; 11D4 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 11D6 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 11DA _ 88. 02
?_027:  movzx   eax, byte [ebp-5H]                      ; 11DC _ 0F B6. 45, FB
        and     eax, 04H                                ; 11E0 _ 83. E0, 04
        test    eax, eax                                ; 11E3 _ 85. C0
        jz      ?_028                                   ; 11E5 _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 11E7 _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 11EA _ 8B. 55, 14
        add     eax, edx                                ; 11ED _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 11EF _ 0F AF. 45, 0C
        mov     edx, eax                                ; 11F3 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 11F5 _ 8B. 45, 10
        add     eax, edx                                ; 11F8 _ 01. D0
        lea     edx, [eax+5H]                           ; 11FA _ 8D. 50, 05
        mov     eax, dword [ebp+8H]                     ; 11FD _ 8B. 45, 08
        add     edx, eax                                ; 1200 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 1202 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 1206 _ 88. 02
?_028:  movzx   eax, byte [ebp-5H]                      ; 1208 _ 0F B6. 45, FB
        and     eax, 02H                                ; 120C _ 83. E0, 02
        test    eax, eax                                ; 120F _ 85. C0
        jz      ?_029                                   ; 1211 _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 1213 _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 1216 _ 8B. 55, 14
        add     eax, edx                                ; 1219 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 121B _ 0F AF. 45, 0C
        mov     edx, eax                                ; 121F _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 1221 _ 8B. 45, 10
        add     eax, edx                                ; 1224 _ 01. D0
        lea     edx, [eax+6H]                           ; 1226 _ 8D. 50, 06
        mov     eax, dword [ebp+8H]                     ; 1229 _ 8B. 45, 08
        add     edx, eax                                ; 122C _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 122E _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 1232 _ 88. 02
?_029:  movzx   eax, byte [ebp-5H]                      ; 1234 _ 0F B6. 45, FB
        and     eax, 01H                                ; 1238 _ 83. E0, 01
        test    eax, eax                                ; 123B _ 85. C0
        jz      ?_030                                   ; 123D _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 123F _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 1242 _ 8B. 55, 14
        add     eax, edx                                ; 1245 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 1247 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 124B _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 124D _ 8B. 45, 10
        add     eax, edx                                ; 1250 _ 01. D0
        lea     edx, [eax+7H]                           ; 1252 _ 8D. 50, 07
        mov     eax, dword [ebp+8H]                     ; 1255 _ 8B. 45, 08
        add     edx, eax                                ; 1258 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 125A _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 125E _ 88. 02
?_030:  add     dword [ebp-4H], 1                       ; 1260 _ 83. 45, FC, 01
?_031:  cmp     dword [ebp-4H], 15                      ; 1264 _ 83. 7D, FC, 0F
        jle     ?_022                                   ; 1268 _ 0F 8E, FFFFFE88
        leave                                           ; 126E _ C9
        ret                                             ; 126F _ C3
; paint_font End of function

paint_string:; Function begin
        push    ebp                                     ; 1270 _ 55
        mov     ebp, esp                                ; 1271 _ 89. E5
        push    ebx                                     ; 1273 _ 53
        sub     esp, 52                                 ; 1274 _ 83. EC, 34
        mov     eax, dword [ebp+1CH]                    ; 1277 _ 8B. 45, 1C
        mov     byte [ebp-1CH], al                      ; 127A _ 88. 45, E4
        mov     eax, dword [ebp+10H]                    ; 127D _ 8B. 45, 10
        mov     dword [ebp-0CH], eax                    ; 1280 _ 89. 45, F4
        jmp     ?_033                                   ; 1283 _ EB, 4B

?_032:  movsx   ecx, byte [ebp-1CH]                     ; 1285 _ 0F BE. 4D, E4
        mov     eax, dword [ebp+18H]                    ; 1289 _ 8B. 45, 18
        movzx   eax, byte [eax]                         ; 128C _ 0F B6. 00
        movsx   eax, al                                 ; 128F _ 0F BE. C0
        shl     eax, 4                                  ; 1292 _ C1. E0, 04
        lea     ebx, [systemFont+eax]                   ; 1295 _ 8D. 98, 00000000(d)
        mov     eax, dword [ebp+0CH]                    ; 129B _ 8B. 45, 0C
        mov     edx, dword [eax+4H]                     ; 129E _ 8B. 50, 04
        mov     eax, dword [ebp+0CH]                    ; 12A1 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 12A4 _ 8B. 00
        mov     dword [esp+14H], ecx                    ; 12A6 _ 89. 4C 24, 14
        mov     dword [esp+10H], ebx                    ; 12AA _ 89. 5C 24, 10
        mov     ecx, dword [ebp+14H]                    ; 12AE _ 8B. 4D, 14
        mov     dword [esp+0CH], ecx                    ; 12B1 _ 89. 4C 24, 0C
        mov     ecx, dword [ebp+10H]                    ; 12B5 _ 8B. 4D, 10
        mov     dword [esp+8H], ecx                     ; 12B8 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 12BC _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 12C0 _ 89. 04 24
        call    paint_font                              ; 12C3 _ E8, FFFFFFFC(rel)
        add     dword [ebp+10H], 8                      ; 12C8 _ 83. 45, 10, 08
        add     dword [ebp+18H], 1                      ; 12CC _ 83. 45, 18, 01
?_033:  mov     eax, dword [ebp+18H]                    ; 12D0 _ 8B. 45, 18
        movzx   eax, byte [eax]                         ; 12D3 _ 0F B6. 00
        test    al, al                                  ; 12D6 _ 84. C0
        jnz     ?_032                                   ; 12D8 _ 75, AB
        mov     eax, dword [ebp+14H]                    ; 12DA _ 8B. 45, 14
        add     eax, 16                                 ; 12DD _ 83. C0, 10
        mov     dword [esp+14H], eax                    ; 12E0 _ 89. 44 24, 14
        mov     eax, dword [ebp+10H]                    ; 12E4 _ 8B. 45, 10
        mov     dword [esp+10H], eax                    ; 12E7 _ 89. 44 24, 10
        mov     eax, dword [ebp+14H]                    ; 12EB _ 8B. 45, 14
        mov     dword [esp+0CH], eax                    ; 12EE _ 89. 44 24, 0C
        mov     eax, dword [ebp-0CH]                    ; 12F2 _ 8B. 45, F4
        mov     dword [esp+8H], eax                     ; 12F5 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 12F9 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 12FC _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1300 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1303 _ 89. 04 24
        call    sheet_refresh                           ; 1306 _ E8, FFFFFFFC(rel)
        add     esp, 52                                 ; 130B _ 83. C4, 34
        pop     ebx                                     ; 130E _ 5B
        pop     ebp                                     ; 130F _ 5D
        ret                                             ; 1310 _ C3
; paint_string End of function

init_mouse_cursor:; Function begin
        push    ebp                                     ; 1311 _ 55
        mov     ebp, esp                                ; 1312 _ 89. E5
        sub     esp, 20                                 ; 1314 _ 83. EC, 14
        mov     eax, dword [ebp+0CH]                    ; 1317 _ 8B. 45, 0C
        mov     byte [ebp-14H], al                      ; 131A _ 88. 45, EC
        mov     dword [ebp-8H], 0                       ; 131D _ C7. 45, F8, 00000000
        jmp     ?_040                                   ; 1324 _ E9, 0000009C

?_034:  mov     dword [ebp-4H], 0                       ; 1329 _ C7. 45, FC, 00000000
        jmp     ?_039                                   ; 1330 _ E9, 00000082

?_035:  mov     eax, dword [ebp-8H]                     ; 1335 _ 8B. 45, F8
        shl     eax, 4                                  ; 1338 _ C1. E0, 04
        mov     edx, eax                                ; 133B _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 133D _ 8B. 45, FC
        add     eax, edx                                ; 1340 _ 01. D0
        add     eax, cursor.1754                        ; 1342 _ 05, 000000C0(d)
        movzx   eax, byte [eax]                         ; 1347 _ 0F B6. 00
        cmp     al, 42                                  ; 134A _ 3C, 2A
        jnz     ?_036                                   ; 134C _ 75, 19
        mov     eax, dword [ebp-8H]                     ; 134E _ 8B. 45, F8
        shl     eax, 4                                  ; 1351 _ C1. E0, 04
        mov     edx, eax                                ; 1354 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 1356 _ 8B. 45, FC
        add     eax, edx                                ; 1359 _ 01. D0
        mov     edx, eax                                ; 135B _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 135D _ 8B. 45, 08
        add     eax, edx                                ; 1360 _ 01. D0
        mov     byte [eax], 0                           ; 1362 _ C6. 00, 00
        jmp     ?_038                                   ; 1365 _ EB, 4C

?_036:  mov     eax, dword [ebp-8H]                     ; 1367 _ 8B. 45, F8
        shl     eax, 4                                  ; 136A _ C1. E0, 04
        mov     edx, eax                                ; 136D _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 136F _ 8B. 45, FC
        add     eax, edx                                ; 1372 _ 01. D0
        add     eax, cursor.1754                        ; 1374 _ 05, 000000C0(d)
        movzx   eax, byte [eax]                         ; 1379 _ 0F B6. 00
        cmp     al, 79                                  ; 137C _ 3C, 4F
        jnz     ?_037                                   ; 137E _ 75, 19
        mov     eax, dword [ebp-8H]                     ; 1380 _ 8B. 45, F8
        shl     eax, 4                                  ; 1383 _ C1. E0, 04
        mov     edx, eax                                ; 1386 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 1388 _ 8B. 45, FC
        add     eax, edx                                ; 138B _ 01. D0
        mov     edx, eax                                ; 138D _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 138F _ 8B. 45, 08
        add     eax, edx                                ; 1392 _ 01. D0
        mov     byte [eax], 7                           ; 1394 _ C6. 00, 07
        jmp     ?_038                                   ; 1397 _ EB, 1A

?_037:  mov     eax, dword [ebp-8H]                     ; 1399 _ 8B. 45, F8
        shl     eax, 4                                  ; 139C _ C1. E0, 04
        mov     edx, eax                                ; 139F _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 13A1 _ 8B. 45, FC
        add     eax, edx                                ; 13A4 _ 01. D0
        mov     edx, eax                                ; 13A6 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 13A8 _ 8B. 45, 08
        add     edx, eax                                ; 13AB _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 13AD _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 13B1 _ 88. 02
?_038:  add     dword [ebp-4H], 1                       ; 13B3 _ 83. 45, FC, 01
?_039:  cmp     dword [ebp-4H], 15                      ; 13B7 _ 83. 7D, FC, 0F
        jle     ?_035                                   ; 13BB _ 0F 8E, FFFFFF74
        add     dword [ebp-8H], 1                       ; 13C1 _ 83. 45, F8, 01
?_040:  cmp     dword [ebp-8H], 15                      ; 13C5 _ 83. 7D, F8, 0F
        jle     ?_034                                   ; 13C9 _ 0F 8E, FFFFFF5A
        leave                                           ; 13CF _ C9
        ret                                             ; 13D0 _ C3
; init_mouse_cursor End of function

paint_block:; Function begin
        push    ebp                                     ; 13D1 _ 55
        mov     ebp, esp                                ; 13D2 _ 89. E5
        sub     esp, 16                                 ; 13D4 _ 83. EC, 10
        mov     dword [ebp-8H], 0                       ; 13D7 _ C7. 45, F8, 00000000
        jmp     ?_044                                   ; 13DE _ EB, 50

?_041:  mov     dword [ebp-4H], 0                       ; 13E0 _ C7. 45, FC, 00000000
        jmp     ?_043                                   ; 13E7 _ EB, 3B

?_042:  mov     eax, dword [ebp-8H]                     ; 13E9 _ 8B. 45, F8
        mov     edx, dword [ebp+14H]                    ; 13EC _ 8B. 55, 14
        add     eax, edx                                ; 13EF _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 13F1 _ 0F AF. 45, 0C
        mov     edx, dword [ebp-4H]                     ; 13F5 _ 8B. 55, FC
        mov     ecx, dword [ebp+10H]                    ; 13F8 _ 8B. 4D, 10
        add     edx, ecx                                ; 13FB _ 01. CA
        add     eax, edx                                ; 13FD _ 01. D0
        mov     edx, eax                                ; 13FF _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 1401 _ 8B. 45, 08
        add     edx, eax                                ; 1404 _ 01. C2
        mov     eax, dword [ebp-8H]                     ; 1406 _ 8B. 45, F8
        imul    eax, dword [ebp+18H]                    ; 1409 _ 0F AF. 45, 18
        mov     ecx, eax                                ; 140D _ 89. C1
        mov     eax, dword [ebp-4H]                     ; 140F _ 8B. 45, FC
        add     eax, ecx                                ; 1412 _ 01. C8
        mov     ecx, eax                                ; 1414 _ 89. C1
        mov     eax, dword [ebp+20H]                    ; 1416 _ 8B. 45, 20
        add     eax, ecx                                ; 1419 _ 01. C8
        movzx   eax, byte [eax]                         ; 141B _ 0F B6. 00
        mov     byte [edx], al                          ; 141E _ 88. 02
        add     dword [ebp-4H], 1                       ; 1420 _ 83. 45, FC, 01
?_043:  mov     eax, dword [ebp-4H]                     ; 1424 _ 8B. 45, FC
        cmp     eax, dword [ebp+18H]                    ; 1427 _ 3B. 45, 18
        jl      ?_042                                   ; 142A _ 7C, BD
        add     dword [ebp-8H], 1                       ; 142C _ 83. 45, F8, 01
?_044:  mov     eax, dword [ebp-8H]                     ; 1430 _ 8B. 45, F8
        cmp     eax, dword [ebp+1CH]                    ; 1433 _ 3B. 45, 1C
        jl      ?_041                                   ; 1436 _ 7C, A8
        leave                                           ; 1438 _ C9
        ret                                             ; 1439 _ C3
; paint_block End of function

init_fifo_buf:; Function begin
        push    ebp                                     ; 143A _ 55
        mov     ebp, esp                                ; 143B _ 89. E5
        sub     esp, 24                                 ; 143D _ 83. EC, 18
        mov     dword [esp+0CH], 0                      ; 1440 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], mousebuf                ; 1448 _ C7. 44 24, 08, 00000000(d)
        mov     dword [esp+4H], 128                     ; 1450 _ C7. 44 24, 04, 00000080
        mov     dword [esp], mouseinfo                  ; 1458 _ C7. 04 24, 00000000(d)
        call    fifo8_init                              ; 145F _ E8, FFFFFFFC(rel)
        mov     dword [esp+0CH], 0                      ; 1464 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], keybuf                  ; 146C _ C7. 44 24, 08, 00000000(d)
        mov     dword [esp+4H], 32                      ; 1474 _ C7. 44 24, 04, 00000020
        mov     dword [esp], keyinfo                    ; 147C _ C7. 04 24, 00000000(d)
        call    fifo8_init                              ; 1483 _ E8, FFFFFFFC(rel)
        leave                                           ; 1488 _ C9
        ret                                             ; 1489 _ C3
; init_fifo_buf End of function

compute_mouse_position:; Function begin
        push    ebp                                     ; 148A _ 55
        mov     ebp, esp                                ; 148B _ 89. E5
        mov     eax, dword [ebp+10H]                    ; 148D _ 8B. 45, 10
        mov     edx, dword [eax+4H]                     ; 1490 _ 8B. 50, 04
        mov     eax, dword [mouse_x]                    ; 1493 _ A1, 000002A8(d)
        add     eax, edx                                ; 1498 _ 01. D0
        mov     dword [mouse_x], eax                    ; 149A _ A3, 000002A8(d)
        mov     eax, dword [ebp+10H]                    ; 149F _ 8B. 45, 10
        mov     edx, dword [eax+8H]                     ; 14A2 _ 8B. 50, 08
        mov     eax, dword [mouse_y]                    ; 14A5 _ A1, 000002AC(d)
        add     eax, edx                                ; 14AA _ 01. D0
        mov     dword [mouse_y], eax                    ; 14AC _ A3, 000002AC(d)
        mov     eax, dword [mouse_x]                    ; 14B1 _ A1, 000002A8(d)
        test    eax, eax                                ; 14B6 _ 85. C0
        jns     ?_045                                   ; 14B8 _ 79, 0A
        mov     dword [mouse_x], 0                      ; 14BA _ C7. 05, 000002A8(d), 00000000
?_045:  mov     eax, dword [mouse_y]                    ; 14C4 _ A1, 000002AC(d)
        test    eax, eax                                ; 14C9 _ 85. C0
        jns     ?_046                                   ; 14CB _ 79, 0A
        mov     dword [mouse_y], 0                      ; 14CD _ C7. 05, 000002AC(d), 00000000
?_046:  movzx   eax, word [?_201]                       ; 14D7 _ 0F B7. 05, 00000184(d)
        cwde                                            ; 14DE _ 98
        lea     edx, [eax-10H]                          ; 14DF _ 8D. 50, F0
        mov     eax, dword [mouse_x]                    ; 14E2 _ A1, 000002A8(d)
        cmp     edx, eax                                ; 14E7 _ 39. C2
        jge     ?_047                                   ; 14E9 _ 7D, 10
        movzx   eax, word [?_201]                       ; 14EB _ 0F B7. 05, 00000184(d)
        cwde                                            ; 14F2 _ 98
        sub     eax, 16                                 ; 14F3 _ 83. E8, 10
        mov     dword [mouse_x], eax                    ; 14F6 _ A3, 000002A8(d)
?_047:  movzx   eax, word [?_201]                       ; 14FB _ 0F B7. 05, 00000184(d)
        cwde                                            ; 1502 _ 98
        lea     edx, [eax-10H]                          ; 1503 _ 8D. 50, F0
        mov     eax, dword [mouse_y]                    ; 1506 _ A1, 000002AC(d)
        cmp     edx, eax                                ; 150B _ 39. C2
        jge     ?_048                                   ; 150D _ 7D, 10
        movzx   eax, word [?_201]                       ; 150F _ 0F B7. 05, 00000184(d)
        cwde                                            ; 1516 _ 98
        sub     eax, 16                                 ; 1517 _ 83. E8, 10
        mov     dword [mouse_y], eax                    ; 151A _ A3, 000002AC(d)
?_048:  pop     ebp                                     ; 151F _ 5D
        ret                                             ; 1520 _ C3
; compute_mouse_position End of function

show_mouse_info:; Function begin
        push    ebp                                     ; 1521 _ 55
        mov     ebp, esp                                ; 1522 _ 89. E5
        sub     esp, 40                                 ; 1524 _ 83. EC, 28
        mov     byte [ebp-9H], 0                        ; 1527 _ C6. 45, F7, 00
        call    io_sti                                  ; 152B _ E8, FFFFFFFC(rel)
        mov     dword [esp], mouseinfo                  ; 1530 _ C7. 04 24, 00000000(d)
        call    fifo8_get                               ; 1537 _ E8, FFFFFFFC(rel)
        mov     byte [ebp-9H], al                       ; 153C _ 88. 45, F7
        movzx   eax, byte [ebp-9H]                      ; 153F _ 0F B6. 45, F7
        mov     dword [esp+4H], eax                     ; 1543 _ 89. 44 24, 04
        mov     dword [esp], mouse_send_info            ; 1547 _ C7. 04 24, 00000000(d)
        call    mouse_decode                            ; 154E _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 1553 _ 85. C0
        jz      ?_049                                   ; 1555 _ 74, 77
        mov     dword [esp+8H], mouse_send_info         ; 1557 _ C7. 44 24, 08, 00000000(d)
        mov     eax, dword [ebp+0CH]                    ; 155F _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 1562 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1566 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1569 _ 89. 04 24
        call    compute_mouse_position                  ; 156C _ E8, FFFFFFFC(rel)
        mov     edx, dword [mouse_y]                    ; 1571 _ 8B. 15, 000002AC(d)
        mov     eax, dword [mouse_x]                    ; 1577 _ A1, 000002A8(d)
        mov     dword [esp+0CH], edx                    ; 157C _ 89. 54 24, 0C
        mov     dword [esp+8H], eax                     ; 1580 _ 89. 44 24, 08
        mov     eax, dword [ebp+10H]                    ; 1584 _ 8B. 45, 10
        mov     dword [esp+4H], eax                     ; 1587 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 158B _ 8B. 45, 08
        mov     dword [esp], eax                        ; 158E _ 89. 04 24
        call    sheet_slide                             ; 1591 _ E8, FFFFFFFC(rel)
        mov     eax, dword [mouse_send_info+0CH]        ; 1596 _ A1, 0000000C(d)
        and     eax, 01H                                ; 159B _ 83. E0, 01
        test    eax, eax                                ; 159E _ 85. C0
        jz      ?_049                                   ; 15A0 _ 74, 2C
        mov     eax, dword [mouse_y]                    ; 15A2 _ A1, 000002AC(d)
        lea     ecx, [eax-8H]                           ; 15A7 _ 8D. 48, F8
        mov     eax, dword [mouse_x]                    ; 15AA _ A1, 000002A8(d)
        lea     edx, [eax-50H]                          ; 15AF _ 8D. 50, B0
        mov     eax, dword [sheet_win]                  ; 15B2 _ A1, 000002A4(d)
        mov     dword [esp+0CH], ecx                    ; 15B7 _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 15BB _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 15BF _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 15C3 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 15C6 _ 89. 04 24
        call    sheet_slide                             ; 15C9 _ E8, FFFFFFFC(rel)
?_049:  leave                                           ; 15CE _ C9
        ret                                             ; 15CF _ C3
; show_mouse_info End of function

show_memory_info:; Function begin
        push    ebp                                     ; 15D0 _ 55
        mov     ebp, esp                                ; 15D1 _ 89. E5
        sub     esp, 88                                 ; 15D3 _ 83. EC, 58
        mov     dword [ebp-38H], 0                      ; 15D6 _ C7. 45, C8, 00000000
        mov     dword [ebp-34H], 0                      ; 15DD _ C7. 45, CC, 00000000
        mov     dword [ebp-30H], 104                    ; 15E4 _ C7. 45, D0, 00000068
        mov     eax, dword [screen_info]                ; 15EB _ A1, 00000180(d)
        mov     dword [ebp-2CH], eax                    ; 15F0 _ 89. 45, D4
        movzx   eax, word [?_201]                       ; 15F3 _ 0F B7. 05, 00000184(d)
        cwde                                            ; 15FA _ 98
        mov     dword [ebp-28H], eax                    ; 15FB _ 89. 45, D8
        movzx   eax, word [?_202]                       ; 15FE _ 0F B7. 05, 00000186(d)
        cwde                                            ; 1605 _ 98
        mov     dword [ebp-24H], eax                    ; 1606 _ 89. 45, DC
        mov     eax, dword [ebp+0CH]                    ; 1609 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 160C _ 8B. 00
        mov     edx, dword [ebp-24H]                    ; 160E _ 8B. 55, DC
        mov     dword [esp+8H], edx                     ; 1611 _ 89. 54 24, 08
        mov     edx, dword [ebp-28H]                    ; 1615 _ 8B. 55, D8
        mov     dword [esp+4H], edx                     ; 1618 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 161C _ 89. 04 24
        call    init_desktop                            ; 161F _ E8, FFFFFFFC(rel)
        mov     dword [esp+14H], 7                      ; 1624 _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_193                  ; 162C _ C7. 44 24, 10, 00000018(d)
        mov     eax, dword [ebp-34H]                    ; 1634 _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 1637 _ 89. 44 24, 0C
        mov     eax, dword [ebp-38H]                    ; 163B _ 8B. 45, C8
        mov     dword [esp+8H], eax                     ; 163E _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 1642 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 1645 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1649 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 164C _ 89. 04 24
        call    paint_string                            ; 164F _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+14H]                    ; 1654 _ 8B. 45, 14
        mov     dword [esp], eax                        ; 1657 _ 89. 04 24
        call    intToHexStr                             ; 165A _ E8, FFFFFFFC(rel)
        mov     dword [ebp-20H], eax                    ; 165F _ 89. 45, E0
        mov     dword [esp+14H], 7                      ; 1662 _ C7. 44 24, 14, 00000007
        mov     eax, dword [ebp-20H]                    ; 166A _ 8B. 45, E0
        mov     dword [esp+10H], eax                    ; 166D _ 89. 44 24, 10
        mov     eax, dword [ebp-34H]                    ; 1671 _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 1674 _ 89. 44 24, 0C
        mov     eax, dword [ebp-30H]                    ; 1678 _ 8B. 45, D0
        mov     dword [esp+8H], eax                     ; 167B _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 167F _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 1682 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1686 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1689 _ 89. 04 24
        call    paint_string                            ; 168C _ E8, FFFFFFFC(rel)
        add     dword [ebp-34H], 16                     ; 1691 _ 83. 45, CC, 10
        mov     dword [esp+14H], 7                      ; 1695 _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_194                  ; 169D _ C7. 44 24, 10, 00000022(d)
        mov     eax, dword [ebp-34H]                    ; 16A5 _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 16A8 _ 89. 44 24, 0C
        mov     eax, dword [ebp-38H]                    ; 16AC _ 8B. 45, C8
        mov     dword [esp+8H], eax                     ; 16AF _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 16B3 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 16B6 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 16BA _ 8B. 45, 08
        mov     dword [esp], eax                        ; 16BD _ 89. 04 24
        call    paint_string                            ; 16C0 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 16C5 _ 8B. 45, 10
        mov     eax, dword [eax]                        ; 16C8 _ 8B. 00
        mov     dword [esp], eax                        ; 16CA _ 89. 04 24
        call    intToHexStr                             ; 16CD _ E8, FFFFFFFC(rel)
        mov     dword [ebp-1CH], eax                    ; 16D2 _ 89. 45, E4
        mov     dword [esp+14H], 7                      ; 16D5 _ C7. 44 24, 14, 00000007
        mov     eax, dword [ebp-1CH]                    ; 16DD _ 8B. 45, E4
        mov     dword [esp+10H], eax                    ; 16E0 _ 89. 44 24, 10
        mov     eax, dword [ebp-34H]                    ; 16E4 _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 16E7 _ 89. 44 24, 0C
        mov     eax, dword [ebp-30H]                    ; 16EB _ 8B. 45, D0
        mov     dword [esp+8H], eax                     ; 16EE _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 16F2 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 16F5 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 16F9 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 16FC _ 89. 04 24
        call    paint_string                            ; 16FF _ E8, FFFFFFFC(rel)
        add     dword [ebp-34H], 16                     ; 1704 _ 83. 45, CC, 10
        mov     dword [esp+14H], 7                      ; 1708 _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_195                  ; 1710 _ C7. 44 24, 10, 0000002E(d)
        mov     eax, dword [ebp-34H]                    ; 1718 _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 171B _ 89. 44 24, 0C
        mov     eax, dword [ebp-38H]                    ; 171F _ 8B. 45, C8
        mov     dword [esp+8H], eax                     ; 1722 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 1726 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 1729 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 172D _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1730 _ 89. 04 24
        call    paint_string                            ; 1733 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 1738 _ 8B. 45, 10
        mov     eax, dword [eax+4H]                     ; 173B _ 8B. 40, 04
        mov     dword [esp], eax                        ; 173E _ 89. 04 24
        call    intToHexStr                             ; 1741 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-18H], eax                    ; 1746 _ 89. 45, E8
        mov     dword [esp+14H], 7                      ; 1749 _ C7. 44 24, 14, 00000007
        mov     eax, dword [ebp-18H]                    ; 1751 _ 8B. 45, E8
        mov     dword [esp+10H], eax                    ; 1754 _ 89. 44 24, 10
        mov     eax, dword [ebp-34H]                    ; 1758 _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 175B _ 89. 44 24, 0C
        mov     eax, dword [ebp-30H]                    ; 175F _ 8B. 45, D0
        mov     dword [esp+8H], eax                     ; 1762 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 1766 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 1769 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 176D _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1770 _ 89. 04 24
        call    paint_string                            ; 1773 _ E8, FFFFFFFC(rel)
        add     dword [ebp-34H], 16                     ; 1778 _ 83. 45, CC, 10
        mov     dword [esp+14H], 7                      ; 177C _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_196                  ; 1784 _ C7. 44 24, 10, 0000003A(d)
        mov     eax, dword [ebp-34H]                    ; 178C _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 178F _ 89. 44 24, 0C
        mov     eax, dword [ebp-38H]                    ; 1793 _ 8B. 45, C8
        mov     dword [esp+8H], eax                     ; 1796 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 179A _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 179D _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 17A1 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 17A4 _ 89. 04 24
        call    paint_string                            ; 17A7 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 17AC _ 8B. 45, 10
        mov     eax, dword [eax+8H]                     ; 17AF _ 8B. 40, 08
        mov     dword [esp], eax                        ; 17B2 _ 89. 04 24
        call    intToHexStr                             ; 17B5 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-14H], eax                    ; 17BA _ 89. 45, EC
        mov     dword [esp+14H], 7                      ; 17BD _ C7. 44 24, 14, 00000007
        mov     eax, dword [ebp-14H]                    ; 17C5 _ 8B. 45, EC
        mov     dword [esp+10H], eax                    ; 17C8 _ 89. 44 24, 10
        mov     eax, dword [ebp-34H]                    ; 17CC _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 17CF _ 89. 44 24, 0C
        mov     eax, dword [ebp-30H]                    ; 17D3 _ 8B. 45, D0
        mov     dword [esp+8H], eax                     ; 17D6 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 17DA _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 17DD _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 17E1 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 17E4 _ 89. 04 24
        call    paint_string                            ; 17E7 _ E8, FFFFFFFC(rel)
        add     dword [ebp-34H], 16                     ; 17EC _ 83. 45, CC, 10
        mov     dword [esp+14H], 7                      ; 17F0 _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_197                  ; 17F8 _ C7. 44 24, 10, 00000046(d)
        mov     eax, dword [ebp-34H]                    ; 1800 _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 1803 _ 89. 44 24, 0C
        mov     eax, dword [ebp-38H]                    ; 1807 _ 8B. 45, C8
        mov     dword [esp+8H], eax                     ; 180A _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 180E _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 1811 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1815 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1818 _ 89. 04 24
        call    paint_string                            ; 181B _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 1820 _ 8B. 45, 10
        mov     eax, dword [eax+0CH]                    ; 1823 _ 8B. 40, 0C
        mov     dword [esp], eax                        ; 1826 _ 89. 04 24
        call    intToHexStr                             ; 1829 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 182E _ 89. 45, F0
        mov     dword [esp+14H], 7                      ; 1831 _ C7. 44 24, 14, 00000007
        mov     eax, dword [ebp-10H]                    ; 1839 _ 8B. 45, F0
        mov     dword [esp+10H], eax                    ; 183C _ 89. 44 24, 10
        mov     eax, dword [ebp-34H]                    ; 1840 _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 1843 _ 89. 44 24, 0C
        mov     eax, dword [ebp-30H]                    ; 1847 _ 8B. 45, D0
        mov     dword [esp+8H], eax                     ; 184A _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 184E _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 1851 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1855 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1858 _ 89. 04 24
        call    paint_string                            ; 185B _ E8, FFFFFFFC(rel)
        add     dword [ebp-34H], 16                     ; 1860 _ 83. 45, CC, 10
        mov     dword [esp+14H], 7                      ; 1864 _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_198                  ; 186C _ C7. 44 24, 10, 00000053(d)
        mov     eax, dword [ebp-34H]                    ; 1874 _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 1877 _ 89. 44 24, 0C
        mov     eax, dword [ebp-38H]                    ; 187B _ 8B. 45, C8
        mov     dword [esp+8H], eax                     ; 187E _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 1882 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 1885 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1889 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 188C _ 89. 04 24
        call    paint_string                            ; 188F _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 1894 _ 8B. 45, 10
        mov     eax, dword [eax+10H]                    ; 1897 _ 8B. 40, 10
        mov     dword [esp], eax                        ; 189A _ 89. 04 24
        call    intToHexStr                             ; 189D _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 18A2 _ 89. 45, F4
        mov     dword [esp+14H], 7                      ; 18A5 _ C7. 44 24, 14, 00000007
        mov     eax, dword [ebp-0CH]                    ; 18AD _ 8B. 45, F4
        mov     dword [esp+10H], eax                    ; 18B0 _ 89. 44 24, 10
        mov     eax, dword [ebp-34H]                    ; 18B4 _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 18B7 _ 89. 44 24, 0C
        mov     eax, dword [ebp-30H]                    ; 18BB _ 8B. 45, D0
        mov     dword [esp+8H], eax                     ; 18BE _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 18C2 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 18C5 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 18C9 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 18CC _ 89. 04 24
        call    paint_string                            ; 18CF _ E8, FFFFFFFC(rel)
        add     dword [ebp-34H], 16                     ; 18D4 _ 83. 45, CC, 10
        leave                                           ; 18D8 _ C9
        ret                                             ; 18D9 _ C3
; show_memory_info End of function

message_box:; Function begin
        push    ebp                                     ; 18DA _ 55
        mov     ebp, esp                                ; 18DB _ 89. E5
        sub     esp, 56                                 ; 18DD _ 83. EC, 38
        mov     eax, dword [ebp+8H]                     ; 18E0 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 18E3 _ 89. 04 24
        call    sheet_alloc                             ; 18E6 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 18EB _ 89. 45, F0
        mov     eax, dword [memman]                     ; 18EE _ A1, 00000000(d)
        mov     dword [esp+4H], 10880                   ; 18F3 _ C7. 44 24, 04, 00002A80
        mov     dword [esp], eax                        ; 18FB _ 89. 04 24
        call    memman_alloc_4k                         ; 18FE _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 1903 _ 89. 45, F4
        mov     dword [esp+10H], 99                     ; 1906 _ C7. 44 24, 10, 00000063
        mov     dword [esp+0CH], 68                     ; 190E _ C7. 44 24, 0C, 00000044
        mov     dword [esp+8H], 160                     ; 1916 _ C7. 44 24, 08, 000000A0
        mov     eax, dword [ebp-0CH]                    ; 191E _ 8B. 45, F4
        mov     dword [esp+4H], eax                     ; 1921 _ 89. 44 24, 04
        mov     eax, dword [ebp-10H]                    ; 1925 _ 8B. 45, F0
        mov     dword [esp], eax                        ; 1928 _ 89. 04 24
        call    sheet_setbuf                            ; 192B _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+0CH]                    ; 1930 _ 8B. 45, 0C
        mov     dword [esp+8H], eax                     ; 1933 _ 89. 44 24, 08
        mov     eax, dword [ebp-10H]                    ; 1937 _ 8B. 45, F0
        mov     dword [esp+4H], eax                     ; 193A _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 193E _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1941 _ 89. 04 24
        call    make_windows                            ; 1944 _ E8, FFFFFFFC(rel)
        mov     dword [esp+14H], 7                      ; 1949 _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], 16                     ; 1951 _ C7. 44 24, 10, 00000010
        mov     dword [esp+0CH], 144                    ; 1959 _ C7. 44 24, 0C, 00000090
        mov     dword [esp+8H], 28                      ; 1961 _ C7. 44 24, 08, 0000001C
        mov     dword [esp+4H], 8                       ; 1969 _ C7. 44 24, 04, 00000008
        mov     eax, dword [ebp-10H]                    ; 1971 _ 8B. 45, F0
        mov     dword [esp], eax                        ; 1974 _ 89. 04 24
        call    make_textbox                            ; 1977 _ E8, FFFFFFFC(rel)
        mov     dword [esp+0CH], 172                    ; 197C _ C7. 44 24, 0C, 000000AC
        mov     dword [esp+8H], 260                     ; 1984 _ C7. 44 24, 08, 00000104
        mov     eax, dword [ebp-10H]                    ; 198C _ 8B. 45, F0
        mov     dword [esp+4H], eax                     ; 198F _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1993 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1996 _ 89. 04 24
        call    sheet_slide                             ; 1999 _ E8, FFFFFFFC(rel)
        mov     dword [esp+8H], 2                       ; 199E _ C7. 44 24, 08, 00000002
        mov     eax, dword [ebp-10H]                    ; 19A6 _ 8B. 45, F0
        mov     dword [esp+4H], eax                     ; 19A9 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 19AD _ 8B. 45, 08
        mov     dword [esp], eax                        ; 19B0 _ 89. 04 24
        call    sheet_updown                            ; 19B3 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 19B8 _ 8B. 45, F0
        leave                                           ; 19BB _ C9
        ret                                             ; 19BC _ C3
; message_box End of function

make_textbox:; Function begin
        push    ebp                                     ; 19BD _ 55
        mov     ebp, esp                                ; 19BE _ 89. E5
        push    edi                                     ; 19C0 _ 57
        push    esi                                     ; 19C1 _ 56
        push    ebx                                     ; 19C2 _ 53
        sub     esp, 44                                 ; 19C3 _ 83. EC, 2C
        mov     eax, dword [ebp+14H]                    ; 19C6 _ 8B. 45, 14
        mov     edx, dword [ebp+0CH]                    ; 19C9 _ 8B. 55, 0C
        add     eax, edx                                ; 19CC _ 01. D0
        mov     dword [ebp-14H], eax                    ; 19CE _ 89. 45, EC
        mov     eax, dword [ebp+18H]                    ; 19D1 _ 8B. 45, 18
        mov     edx, dword [ebp+10H]                    ; 19D4 _ 8B. 55, 10
        add     eax, edx                                ; 19D7 _ 01. D0
        mov     dword [ebp-10H], eax                    ; 19D9 _ 89. 45, F0
        mov     eax, dword [ebp+10H]                    ; 19DC _ 8B. 45, 10
        lea     edi, [eax-3H]                           ; 19DF _ 8D. 78, FD
        mov     eax, dword [ebp-14H]                    ; 19E2 _ 8B. 45, EC
        lea     esi, [eax+1H]                           ; 19E5 _ 8D. 70, 01
        mov     eax, dword [ebp+10H]                    ; 19E8 _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 19EB _ 8D. 58, FD
        mov     eax, dword [ebp+0CH]                    ; 19EE _ 8B. 45, 0C
        lea     ecx, [eax-2H]                           ; 19F1 _ 8D. 48, FE
        mov     eax, dword [ebp+8H]                     ; 19F4 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 19F7 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 19FA _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 19FD _ 8B. 00
        mov     dword [esp+18H], edi                    ; 19FF _ 89. 7C 24, 18
        mov     dword [esp+14H], esi                    ; 1A03 _ 89. 74 24, 14
        mov     dword [esp+10H], ebx                    ; 1A07 _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 1A0B _ 89. 4C 24, 0C
        mov     dword [esp+8H], 15                      ; 1A0F _ C7. 44 24, 08, 0000000F
        mov     dword [esp+4H], edx                     ; 1A17 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1A1B _ 89. 04 24
        call    paint_rectangle                         ; 1A1E _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 1A23 _ 8B. 45, F0
        lea     edi, [eax+1H]                           ; 1A26 _ 8D. 78, 01
        mov     eax, dword [ebp+0CH]                    ; 1A29 _ 8B. 45, 0C
        lea     esi, [eax-3H]                           ; 1A2C _ 8D. 70, FD
        mov     eax, dword [ebp+10H]                    ; 1A2F _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 1A32 _ 8D. 58, FD
        mov     eax, dword [ebp+0CH]                    ; 1A35 _ 8B. 45, 0C
        lea     ecx, [eax-3H]                           ; 1A38 _ 8D. 48, FD
        mov     eax, dword [ebp+8H]                     ; 1A3B _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 1A3E _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1A41 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1A44 _ 8B. 00
        mov     dword [esp+18H], edi                    ; 1A46 _ 89. 7C 24, 18
        mov     dword [esp+14H], esi                    ; 1A4A _ 89. 74 24, 14
        mov     dword [esp+10H], ebx                    ; 1A4E _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 1A52 _ 89. 4C 24, 0C
        mov     dword [esp+8H], 15                      ; 1A56 _ C7. 44 24, 08, 0000000F
        mov     dword [esp+4H], edx                     ; 1A5E _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1A62 _ 89. 04 24
        call    paint_rectangle                         ; 1A65 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 1A6A _ 8B. 45, F0
        lea     edi, [eax+2H]                           ; 1A6D _ 8D. 78, 02
        mov     eax, dword [ebp-14H]                    ; 1A70 _ 8B. 45, EC
        lea     esi, [eax+1H]                           ; 1A73 _ 8D. 70, 01
        mov     eax, dword [ebp-10H]                    ; 1A76 _ 8B. 45, F0
        lea     ebx, [eax+2H]                           ; 1A79 _ 8D. 58, 02
        mov     eax, dword [ebp+0CH]                    ; 1A7C _ 8B. 45, 0C
        lea     ecx, [eax-3H]                           ; 1A7F _ 8D. 48, FD
        mov     eax, dword [ebp+8H]                     ; 1A82 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 1A85 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1A88 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1A8B _ 8B. 00
        mov     dword [esp+18H], edi                    ; 1A8D _ 89. 7C 24, 18
        mov     dword [esp+14H], esi                    ; 1A91 _ 89. 74 24, 14
        mov     dword [esp+10H], ebx                    ; 1A95 _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 1A99 _ 89. 4C 24, 0C
        mov     dword [esp+8H], 7                       ; 1A9D _ C7. 44 24, 08, 00000007
        mov     dword [esp+4H], edx                     ; 1AA5 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1AA9 _ 89. 04 24
        call    paint_rectangle                         ; 1AAC _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 1AB1 _ 8B. 45, F0
        lea     edi, [eax+2H]                           ; 1AB4 _ 8D. 78, 02
        mov     eax, dword [ebp-14H]                    ; 1AB7 _ 8B. 45, EC
        lea     esi, [eax+2H]                           ; 1ABA _ 8D. 70, 02
        mov     eax, dword [ebp+10H]                    ; 1ABD _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 1AC0 _ 8D. 58, FD
        mov     eax, dword [ebp-14H]                    ; 1AC3 _ 8B. 45, EC
        lea     ecx, [eax+2H]                           ; 1AC6 _ 8D. 48, 02
        mov     eax, dword [ebp+8H]                     ; 1AC9 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 1ACC _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1ACF _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1AD2 _ 8B. 00
        mov     dword [esp+18H], edi                    ; 1AD4 _ 89. 7C 24, 18
        mov     dword [esp+14H], esi                    ; 1AD8 _ 89. 74 24, 14
        mov     dword [esp+10H], ebx                    ; 1ADC _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 1AE0 _ 89. 4C 24, 0C
        mov     dword [esp+8H], 7                       ; 1AE4 _ C7. 44 24, 08, 00000007
        mov     dword [esp+4H], edx                     ; 1AEC _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1AF0 _ 89. 04 24
        call    paint_rectangle                         ; 1AF3 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 1AF8 _ 8B. 45, 10
        lea     ecx, [eax-2H]                           ; 1AFB _ 8D. 48, FE
        mov     eax, dword [ebp+10H]                    ; 1AFE _ 8B. 45, 10
        lea     esi, [eax-2H]                           ; 1B01 _ 8D. 70, FE
        mov     eax, dword [ebp+0CH]                    ; 1B04 _ 8B. 45, 0C
        lea     ebx, [eax-1H]                           ; 1B07 _ 8D. 58, FF
        mov     eax, dword [ebp+8H]                     ; 1B0A _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 1B0D _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1B10 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1B13 _ 8B. 00
        mov     dword [esp+18H], ecx                    ; 1B15 _ 89. 4C 24, 18
        mov     ecx, dword [ebp-14H]                    ; 1B19 _ 8B. 4D, EC
        mov     dword [esp+14H], ecx                    ; 1B1C _ 89. 4C 24, 14
        mov     dword [esp+10H], esi                    ; 1B20 _ 89. 74 24, 10
        mov     dword [esp+0CH], ebx                    ; 1B24 _ 89. 5C 24, 0C
        mov     dword [esp+8H], 0                       ; 1B28 _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], edx                     ; 1B30 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1B34 _ 89. 04 24
        call    paint_rectangle                         ; 1B37 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+0CH]                    ; 1B3C _ 8B. 45, 0C
        lea     edi, [eax-2H]                           ; 1B3F _ 8D. 78, FE
        mov     eax, dword [ebp+10H]                    ; 1B42 _ 8B. 45, 10
        lea     esi, [eax-2H]                           ; 1B45 _ 8D. 70, FE
        mov     eax, dword [ebp+0CH]                    ; 1B48 _ 8B. 45, 0C
        lea     ebx, [eax-2H]                           ; 1B4B _ 8D. 58, FE
        mov     eax, dword [ebp+8H]                     ; 1B4E _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 1B51 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1B54 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1B57 _ 8B. 00
        mov     ecx, dword [ebp-10H]                    ; 1B59 _ 8B. 4D, F0
        mov     dword [esp+18H], ecx                    ; 1B5C _ 89. 4C 24, 18
        mov     dword [esp+14H], edi                    ; 1B60 _ 89. 7C 24, 14
        mov     dword [esp+10H], esi                    ; 1B64 _ 89. 74 24, 10
        mov     dword [esp+0CH], ebx                    ; 1B68 _ 89. 5C 24, 0C
        mov     dword [esp+8H], 0                       ; 1B6C _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], edx                     ; 1B74 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1B78 _ 89. 04 24
        call    paint_rectangle                         ; 1B7B _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 1B80 _ 8B. 45, F0
        lea     ecx, [eax+1H]                           ; 1B83 _ 8D. 48, 01
        mov     eax, dword [ebp-10H]                    ; 1B86 _ 8B. 45, F0
        lea     esi, [eax+1H]                           ; 1B89 _ 8D. 70, 01
        mov     eax, dword [ebp+0CH]                    ; 1B8C _ 8B. 45, 0C
        lea     ebx, [eax-2H]                           ; 1B8F _ 8D. 58, FE
        mov     eax, dword [ebp+8H]                     ; 1B92 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 1B95 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1B98 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1B9B _ 8B. 00
        mov     dword [esp+18H], ecx                    ; 1B9D _ 89. 4C 24, 18
        mov     ecx, dword [ebp-14H]                    ; 1BA1 _ 8B. 4D, EC
        mov     dword [esp+14H], ecx                    ; 1BA4 _ 89. 4C 24, 14
        mov     dword [esp+10H], esi                    ; 1BA8 _ 89. 74 24, 10
        mov     dword [esp+0CH], ebx                    ; 1BAC _ 89. 5C 24, 0C
        mov     dword [esp+8H], 8                       ; 1BB0 _ C7. 44 24, 08, 00000008
        mov     dword [esp+4H], edx                     ; 1BB8 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1BBC _ 89. 04 24
        call    paint_rectangle                         ; 1BBF _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 1BC4 _ 8B. 45, F0
        lea     edi, [eax+1H]                           ; 1BC7 _ 8D. 78, 01
        mov     eax, dword [ebp-14H]                    ; 1BCA _ 8B. 45, EC
        lea     esi, [eax+1H]                           ; 1BCD _ 8D. 70, 01
        mov     eax, dword [ebp+10H]                    ; 1BD0 _ 8B. 45, 10
        lea     ebx, [eax-2H]                           ; 1BD3 _ 8D. 58, FE
        mov     eax, dword [ebp-14H]                    ; 1BD6 _ 8B. 45, EC
        lea     ecx, [eax+1H]                           ; 1BD9 _ 8D. 48, 01
        mov     eax, dword [ebp+8H]                     ; 1BDC _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 1BDF _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1BE2 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1BE5 _ 8B. 00
        mov     dword [esp+18H], edi                    ; 1BE7 _ 89. 7C 24, 18
        mov     dword [esp+14H], esi                    ; 1BEB _ 89. 74 24, 14
        mov     dword [esp+10H], ebx                    ; 1BEF _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 1BF3 _ 89. 4C 24, 0C
        mov     dword [esp+8H], 8                       ; 1BF7 _ C7. 44 24, 08, 00000008
        mov     dword [esp+4H], edx                     ; 1BFF _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1C03 _ 89. 04 24
        call    paint_rectangle                         ; 1C06 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 1C0B _ 8B. 45, 10
        lea     edi, [eax-1H]                           ; 1C0E _ 8D. 78, FF
        mov     eax, dword [ebp+0CH]                    ; 1C11 _ 8B. 45, 0C
        lea     esi, [eax-1H]                           ; 1C14 _ 8D. 70, FF
        mov     eax, dword [ebp+1CH]                    ; 1C17 _ 8B. 45, 1C
        movzx   ecx, al                                 ; 1C1A _ 0F B6. C8
        mov     eax, dword [ebp+8H]                     ; 1C1D _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 1C20 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1C23 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1C26 _ 8B. 00
        mov     ebx, dword [ebp-10H]                    ; 1C28 _ 8B. 5D, F0
        mov     dword [esp+18H], ebx                    ; 1C2B _ 89. 5C 24, 18
        mov     ebx, dword [ebp-14H]                    ; 1C2F _ 8B. 5D, EC
        mov     dword [esp+14H], ebx                    ; 1C32 _ 89. 5C 24, 14
        mov     dword [esp+10H], edi                    ; 1C36 _ 89. 7C 24, 10
        mov     dword [esp+0CH], esi                    ; 1C3A _ 89. 74 24, 0C
        mov     dword [esp+8H], ecx                     ; 1C3E _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 1C42 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1C46 _ 89. 04 24
        call    paint_rectangle                         ; 1C49 _ E8, FFFFFFFC(rel)
        add     esp, 44                                 ; 1C4E _ 83. C4, 2C
        pop     ebx                                     ; 1C51 _ 5B
        pop     esi                                     ; 1C52 _ 5E
        pop     edi                                     ; 1C53 _ 5F
        pop     ebp                                     ; 1C54 _ 5D
        ret                                             ; 1C55 _ C3
; make_textbox End of function

make_windows:; Function begin
        push    ebp                                     ; 1C56 _ 55
        mov     ebp, esp                                ; 1C57 _ 89. E5
        push    ebx                                     ; 1C59 _ 53
        sub     esp, 68                                 ; 1C5A _ 83. EC, 44
        mov     eax, dword [ebp+0CH]                    ; 1C5D _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 1C60 _ 8B. 40, 04
        mov     dword [ebp-10H], eax                    ; 1C63 _ 89. 45, F0
        mov     eax, dword [ebp+0CH]                    ; 1C66 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 1C69 _ 8B. 40, 08
        mov     dword [ebp-0CH], eax                    ; 1C6C _ 89. 45, F4
        mov     eax, dword [ebp-10H]                    ; 1C6F _ 8B. 45, F0
        lea     edx, [eax-1H]                           ; 1C72 _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 1C75 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1C78 _ 8B. 00
        mov     dword [esp+18H], 0                      ; 1C7A _ C7. 44 24, 18, 00000000
        mov     dword [esp+14H], edx                    ; 1C82 _ 89. 54 24, 14
        mov     dword [esp+10H], 0                      ; 1C86 _ C7. 44 24, 10, 00000000
        mov     dword [esp+0CH], 0                      ; 1C8E _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 8                       ; 1C96 _ C7. 44 24, 08, 00000008
        mov     edx, dword [ebp-10H]                    ; 1C9E _ 8B. 55, F0
        mov     dword [esp+4H], edx                     ; 1CA1 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1CA5 _ 89. 04 24
        call    paint_rectangle                         ; 1CA8 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 1CAD _ 8B. 45, F0
        lea     edx, [eax-2H]                           ; 1CB0 _ 8D. 50, FE
        mov     eax, dword [ebp+0CH]                    ; 1CB3 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1CB6 _ 8B. 00
        mov     dword [esp+18H], 1                      ; 1CB8 _ C7. 44 24, 18, 00000001
        mov     dword [esp+14H], edx                    ; 1CC0 _ 89. 54 24, 14
        mov     dword [esp+10H], 1                      ; 1CC4 _ C7. 44 24, 10, 00000001
        mov     dword [esp+0CH], 1                      ; 1CCC _ C7. 44 24, 0C, 00000001
        mov     dword [esp+8H], 7                       ; 1CD4 _ C7. 44 24, 08, 00000007
        mov     edx, dword [ebp-10H]                    ; 1CDC _ 8B. 55, F0
        mov     dword [esp+4H], edx                     ; 1CDF _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1CE3 _ 89. 04 24
        call    paint_rectangle                         ; 1CE6 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 1CEB _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 1CEE _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 1CF1 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1CF4 _ 8B. 00
        mov     dword [esp+18H], edx                    ; 1CF6 _ 89. 54 24, 18
        mov     dword [esp+14H], 0                      ; 1CFA _ C7. 44 24, 14, 00000000
        mov     dword [esp+10H], 0                      ; 1D02 _ C7. 44 24, 10, 00000000
        mov     dword [esp+0CH], 0                      ; 1D0A _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 8                       ; 1D12 _ C7. 44 24, 08, 00000008
        mov     edx, dword [ebp-10H]                    ; 1D1A _ 8B. 55, F0
        mov     dword [esp+4H], edx                     ; 1D1D _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1D21 _ 89. 04 24
        call    paint_rectangle                         ; 1D24 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 1D29 _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 1D2C _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 1D2F _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1D32 _ 8B. 00
        mov     dword [esp+18H], edx                    ; 1D34 _ 89. 54 24, 18
        mov     dword [esp+14H], 1                      ; 1D38 _ C7. 44 24, 14, 00000001
        mov     dword [esp+10H], 1                      ; 1D40 _ C7. 44 24, 10, 00000001
        mov     dword [esp+0CH], 1                      ; 1D48 _ C7. 44 24, 0C, 00000001
        mov     dword [esp+8H], 7                       ; 1D50 _ C7. 44 24, 08, 00000007
        mov     edx, dword [ebp-10H]                    ; 1D58 _ 8B. 55, F0
        mov     dword [esp+4H], edx                     ; 1D5B _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1D5F _ 89. 04 24
        call    paint_rectangle                         ; 1D62 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 1D67 _ 8B. 45, F4
        lea     ebx, [eax-2H]                           ; 1D6A _ 8D. 58, FE
        mov     eax, dword [ebp-10H]                    ; 1D6D _ 8B. 45, F0
        lea     ecx, [eax-2H]                           ; 1D70 _ 8D. 48, FE
        mov     eax, dword [ebp-10H]                    ; 1D73 _ 8B. 45, F0
        lea     edx, [eax-2H]                           ; 1D76 _ 8D. 50, FE
        mov     eax, dword [ebp+0CH]                    ; 1D79 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1D7C _ 8B. 00
        mov     dword [esp+18H], ebx                    ; 1D7E _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 1D82 _ 89. 4C 24, 14
        mov     dword [esp+10H], 1                      ; 1D86 _ C7. 44 24, 10, 00000001
        mov     dword [esp+0CH], edx                    ; 1D8E _ 89. 54 24, 0C
        mov     dword [esp+8H], 15                      ; 1D92 _ C7. 44 24, 08, 0000000F
        mov     edx, dword [ebp-10H]                    ; 1D9A _ 8B. 55, F0
        mov     dword [esp+4H], edx                     ; 1D9D _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1DA1 _ 89. 04 24
        call    paint_rectangle                         ; 1DA4 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 1DA9 _ 8B. 45, F4
        lea     ebx, [eax-1H]                           ; 1DAC _ 8D. 58, FF
        mov     eax, dword [ebp-10H]                    ; 1DAF _ 8B. 45, F0
        lea     ecx, [eax-1H]                           ; 1DB2 _ 8D. 48, FF
        mov     eax, dword [ebp-10H]                    ; 1DB5 _ 8B. 45, F0
        lea     edx, [eax-1H]                           ; 1DB8 _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 1DBB _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1DBE _ 8B. 00
        mov     dword [esp+18H], ebx                    ; 1DC0 _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 1DC4 _ 89. 4C 24, 14
        mov     dword [esp+10H], 0                      ; 1DC8 _ C7. 44 24, 10, 00000000
        mov     dword [esp+0CH], edx                    ; 1DD0 _ 89. 54 24, 0C
        mov     dword [esp+8H], 0                       ; 1DD4 _ C7. 44 24, 08, 00000000
        mov     edx, dword [ebp-10H]                    ; 1DDC _ 8B. 55, F0
        mov     dword [esp+4H], edx                     ; 1DDF _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1DE3 _ 89. 04 24
        call    paint_rectangle                         ; 1DE6 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 1DEB _ 8B. 45, F4
        lea     ecx, [eax-3H]                           ; 1DEE _ 8D. 48, FD
        mov     eax, dword [ebp-10H]                    ; 1DF1 _ 8B. 45, F0
        lea     edx, [eax-3H]                           ; 1DF4 _ 8D. 50, FD
        mov     eax, dword [ebp+0CH]                    ; 1DF7 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1DFA _ 8B. 00
        mov     dword [esp+18H], ecx                    ; 1DFC _ 89. 4C 24, 18
        mov     dword [esp+14H], edx                    ; 1E00 _ 89. 54 24, 14
        mov     dword [esp+10H], 2                      ; 1E04 _ C7. 44 24, 10, 00000002
        mov     dword [esp+0CH], 2                      ; 1E0C _ C7. 44 24, 0C, 00000002
        mov     dword [esp+8H], 8                       ; 1E14 _ C7. 44 24, 08, 00000008
        mov     edx, dword [ebp-10H]                    ; 1E1C _ 8B. 55, F0
        mov     dword [esp+4H], edx                     ; 1E1F _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1E23 _ 89. 04 24
        call    paint_rectangle                         ; 1E26 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 1E2B _ 8B. 45, F0
        lea     edx, [eax-4H]                           ; 1E2E _ 8D. 50, FC
        mov     eax, dword [ebp+0CH]                    ; 1E31 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1E34 _ 8B. 00
        mov     dword [esp+18H], 20                     ; 1E36 _ C7. 44 24, 18, 00000014
        mov     dword [esp+14H], edx                    ; 1E3E _ 89. 54 24, 14
        mov     dword [esp+10H], 3                      ; 1E42 _ C7. 44 24, 10, 00000003
        mov     dword [esp+0CH], 3                      ; 1E4A _ C7. 44 24, 0C, 00000003
        mov     dword [esp+8H], 12                      ; 1E52 _ C7. 44 24, 08, 0000000C
        mov     edx, dword [ebp-10H]                    ; 1E5A _ 8B. 55, F0
        mov     dword [esp+4H], edx                     ; 1E5D _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1E61 _ 89. 04 24
        call    paint_rectangle                         ; 1E64 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 1E69 _ 8B. 45, F4
        lea     ebx, [eax-2H]                           ; 1E6C _ 8D. 58, FE
        mov     eax, dword [ebp-10H]                    ; 1E6F _ 8B. 45, F0
        lea     ecx, [eax-2H]                           ; 1E72 _ 8D. 48, FE
        mov     eax, dword [ebp-0CH]                    ; 1E75 _ 8B. 45, F4
        lea     edx, [eax-2H]                           ; 1E78 _ 8D. 50, FE
        mov     eax, dword [ebp+0CH]                    ; 1E7B _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1E7E _ 8B. 00
        mov     dword [esp+18H], ebx                    ; 1E80 _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 1E84 _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 1E88 _ 89. 54 24, 10
        mov     dword [esp+0CH], 1                      ; 1E8C _ C7. 44 24, 0C, 00000001
        mov     dword [esp+8H], 15                      ; 1E94 _ C7. 44 24, 08, 0000000F
        mov     edx, dword [ebp-10H]                    ; 1E9C _ 8B. 55, F0
        mov     dword [esp+4H], edx                     ; 1E9F _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1EA3 _ 89. 04 24
        call    paint_rectangle                         ; 1EA6 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 1EAB _ 8B. 45, F4
        lea     ebx, [eax-1H]                           ; 1EAE _ 8D. 58, FF
        mov     eax, dword [ebp-10H]                    ; 1EB1 _ 8B. 45, F0
        lea     ecx, [eax-1H]                           ; 1EB4 _ 8D. 48, FF
        mov     eax, dword [ebp-0CH]                    ; 1EB7 _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 1EBA _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 1EBD _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1EC0 _ 8B. 00
        mov     dword [esp+18H], ebx                    ; 1EC2 _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 1EC6 _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 1ECA _ 89. 54 24, 10
        mov     dword [esp+0CH], 0                      ; 1ECE _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 0                       ; 1ED6 _ C7. 44 24, 08, 00000000
        mov     edx, dword [ebp-10H]                    ; 1EDE _ 8B. 55, F0
        mov     dword [esp+4H], edx                     ; 1EE1 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1EE5 _ 89. 04 24
        call    paint_rectangle                         ; 1EE8 _ E8, FFFFFFFC(rel)
        mov     dword [esp+14H], 7                      ; 1EED _ C7. 44 24, 14, 00000007
        mov     eax, dword [ebp+10H]                    ; 1EF5 _ 8B. 45, 10
        mov     dword [esp+10H], eax                    ; 1EF8 _ 89. 44 24, 10
        mov     dword [esp+0CH], 4                      ; 1EFC _ C7. 44 24, 0C, 00000004
        mov     dword [esp+8H], 24                      ; 1F04 _ C7. 44 24, 08, 00000018
        mov     eax, dword [ebp+0CH]                    ; 1F0C _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 1F0F _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1F13 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1F16 _ 89. 04 24
        call    paint_string                            ; 1F19 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-14H], 0                      ; 1F1E _ C7. 45, EC, 00000000
        jmp     ?_057                                   ; 1F25 _ E9, 00000083

?_050:  mov     dword [ebp-18H], 0                      ; 1F2A _ C7. 45, E8, 00000000
        jmp     ?_056                                   ; 1F31 _ EB, 70

?_051:  mov     eax, dword [ebp-14H]                    ; 1F33 _ 8B. 45, EC
        shl     eax, 4                                  ; 1F36 _ C1. E0, 04
        mov     edx, eax                                ; 1F39 _ 89. C2
        mov     eax, dword [ebp-18H]                    ; 1F3B _ 8B. 45, E8
        add     eax, edx                                ; 1F3E _ 01. D0
        add     eax, closebtn.1832                      ; 1F40 _ 05, 000001C0(d)
        movzx   eax, byte [eax]                         ; 1F45 _ 0F B6. 00
        mov     byte [ebp-19H], al                      ; 1F48 _ 88. 45, E7
        cmp     byte [ebp-19H], 64                      ; 1F4B _ 80. 7D, E7, 40
        jnz     ?_052                                   ; 1F4F _ 75, 06
        mov     byte [ebp-19H], 0                       ; 1F51 _ C6. 45, E7, 00
        jmp     ?_055                                   ; 1F55 _ EB, 1C

?_052:  cmp     byte [ebp-19H], 36                      ; 1F57 _ 80. 7D, E7, 24
        jnz     ?_053                                   ; 1F5B _ 75, 06
        mov     byte [ebp-19H], 15                      ; 1F5D _ C6. 45, E7, 0F
        jmp     ?_055                                   ; 1F61 _ EB, 10

?_053:  cmp     byte [ebp-19H], 81                      ; 1F63 _ 80. 7D, E7, 51
        jnz     ?_054                                   ; 1F67 _ 75, 06
        mov     byte [ebp-19H], 8                       ; 1F69 _ C6. 45, E7, 08
        jmp     ?_055                                   ; 1F6D _ EB, 04

?_054:  mov     byte [ebp-19H], 7                       ; 1F6F _ C6. 45, E7, 07
?_055:  mov     eax, dword [ebp+0CH]                    ; 1F73 _ 8B. 45, 0C
        mov     edx, dword [eax]                        ; 1F76 _ 8B. 10
        mov     eax, dword [ebp-14H]                    ; 1F78 _ 8B. 45, EC
        lea     ecx, [eax+5H]                           ; 1F7B _ 8D. 48, 05
        mov     eax, dword [ebp+0CH]                    ; 1F7E _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 1F81 _ 8B. 40, 04
        imul    ecx, eax                                ; 1F84 _ 0F AF. C8
        mov     eax, dword [ebp+0CH]                    ; 1F87 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 1F8A _ 8B. 40, 04
        lea     ebx, [eax-15H]                          ; 1F8D _ 8D. 58, EB
        mov     eax, dword [ebp-18H]                    ; 1F90 _ 8B. 45, E8
        add     eax, ebx                                ; 1F93 _ 01. D8
        add     eax, ecx                                ; 1F95 _ 01. C8
        add     edx, eax                                ; 1F97 _ 01. C2
        movzx   eax, byte [ebp-19H]                     ; 1F99 _ 0F B6. 45, E7
        mov     byte [edx], al                          ; 1F9D _ 88. 02
        add     dword [ebp-18H], 1                      ; 1F9F _ 83. 45, E8, 01
?_056:  cmp     dword [ebp-18H], 15                     ; 1FA3 _ 83. 7D, E8, 0F
        jle     ?_051                                   ; 1FA7 _ 7E, 8A
        add     dword [ebp-14H], 1                      ; 1FA9 _ 83. 45, EC, 01
?_057:  cmp     dword [ebp-14H], 13                     ; 1FAD _ 83. 7D, EC, 0D
        jle     ?_050                                   ; 1FB1 _ 0F 8E, FFFFFF73
        add     esp, 68                                 ; 1FB7 _ 83. C4, 44
        pop     ebx                                     ; 1FBA _ 5B
        pop     ebp                                     ; 1FBB _ 5D
        ret                                             ; 1FBC _ C3
; make_windows End of function

wait_KBC_sendready:; Function begin
        push    ebp                                     ; 1FBD _ 55
        mov     ebp, esp                                ; 1FBE _ 89. E5
        sub     esp, 24                                 ; 1FC0 _ 83. EC, 18
?_058:  mov     dword [esp], 100                        ; 1FC3 _ C7. 04 24, 00000064
        call    io_in8                                  ; 1FCA _ E8, FFFFFFFC(rel)
        and     eax, 02H                                ; 1FCF _ 83. E0, 02
        test    eax, eax                                ; 1FD2 _ 85. C0
        jnz     ?_059                                   ; 1FD4 _ 75, 02
        jmp     ?_060                                   ; 1FD6 _ EB, 02

?_059:  jmp     ?_058                                   ; 1FD8 _ EB, E9

?_060:  leave                                           ; 1FDA _ C9
        ret                                             ; 1FDB _ C3
; wait_KBC_sendready End of function

init_keyboard:; Function begin
        push    ebp                                     ; 1FDC _ 55
        mov     ebp, esp                                ; 1FDD _ 89. E5
        sub     esp, 24                                 ; 1FDF _ 83. EC, 18
        call    wait_KBC_sendready                      ; 1FE2 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 96                      ; 1FE7 _ C7. 44 24, 04, 00000060
        mov     dword [esp], 100                        ; 1FEF _ C7. 04 24, 00000064
        call    io_out8                                 ; 1FF6 _ E8, FFFFFFFC(rel)
        call    wait_KBC_sendready                      ; 1FFB _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 71                      ; 2000 _ C7. 44 24, 04, 00000047
        mov     dword [esp], 96                         ; 2008 _ C7. 04 24, 00000060
        call    io_out8                                 ; 200F _ E8, FFFFFFFC(rel)
        leave                                           ; 2014 _ C9
        ret                                             ; 2015 _ C3
; init_keyboard End of function

enable_mouse:; Function begin
        push    ebp                                     ; 2016 _ 55
        mov     ebp, esp                                ; 2017 _ 89. E5
        sub     esp, 24                                 ; 2019 _ 83. EC, 18
        call    wait_KBC_sendready                      ; 201C _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 212                     ; 2021 _ C7. 44 24, 04, 000000D4
        mov     dword [esp], 100                        ; 2029 _ C7. 04 24, 00000064
        call    io_out8                                 ; 2030 _ E8, FFFFFFFC(rel)
        call    wait_KBC_sendready                      ; 2035 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 244                     ; 203A _ C7. 44 24, 04, 000000F4
        mov     dword [esp], 96                         ; 2042 _ C7. 04 24, 00000060
        call    io_out8                                 ; 2049 _ E8, FFFFFFFC(rel)
        leave                                           ; 204E _ C9
        ret                                             ; 204F _ C3
; enable_mouse End of function

mouse_decode:; Function begin
        push    ebp                                     ; 2050 _ 55
        mov     ebp, esp                                ; 2051 _ 89. E5
        sub     esp, 4                                  ; 2053 _ 83. EC, 04
        mov     eax, dword [ebp+0CH]                    ; 2056 _ 8B. 45, 0C
        mov     byte [ebp-4H], al                       ; 2059 _ 88. 45, FC
        mov     eax, dword [ebp+8H]                     ; 205C _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 205F _ 0F B6. 40, 03
        test    al, al                                  ; 2063 _ 84. C0
        jnz     ?_062                                   ; 2065 _ 75, 17
        cmp     byte [ebp-4H], -6                       ; 2067 _ 80. 7D, FC, FA
        jnz     ?_061                                   ; 206B _ 75, 07
        mov     eax, dword [ebp+8H]                     ; 206D _ 8B. 45, 08
        mov     byte [eax+3H], 1                        ; 2070 _ C6. 40, 03, 01
?_061:  mov     eax, 0                                  ; 2074 _ B8, 00000000
        jmp     ?_069                                   ; 2079 _ E9, 0000010F

?_062:  mov     eax, dword [ebp+8H]                     ; 207E _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 2081 _ 0F B6. 40, 03
        cmp     al, 1                                   ; 2085 _ 3C, 01
        jnz     ?_064                                   ; 2087 _ 75, 28
        movzx   eax, byte [ebp-4H]                      ; 2089 _ 0F B6. 45, FC
        and     eax, 0C8H                               ; 208D _ 25, 000000C8
        cmp     eax, 8                                  ; 2092 _ 83. F8, 08
        jnz     ?_063                                   ; 2095 _ 75, 10
        mov     eax, dword [ebp+8H]                     ; 2097 _ 8B. 45, 08
        movzx   edx, byte [ebp-4H]                      ; 209A _ 0F B6. 55, FC
        mov     byte [eax], dl                          ; 209E _ 88. 10
        mov     eax, dword [ebp+8H]                     ; 20A0 _ 8B. 45, 08
        mov     byte [eax+3H], 2                        ; 20A3 _ C6. 40, 03, 02
?_063:  mov     eax, 0                                  ; 20A7 _ B8, 00000000
        jmp     ?_069                                   ; 20AC _ E9, 000000DC

?_064:  mov     eax, dword [ebp+8H]                     ; 20B1 _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 20B4 _ 0F B6. 40, 03
        cmp     al, 2                                   ; 20B8 _ 3C, 02
        jnz     ?_065                                   ; 20BA _ 75, 1B
        mov     eax, dword [ebp+8H]                     ; 20BC _ 8B. 45, 08
        movzx   edx, byte [ebp-4H]                      ; 20BF _ 0F B6. 55, FC
        mov     byte [eax+1H], dl                       ; 20C3 _ 88. 50, 01
        mov     eax, dword [ebp+8H]                     ; 20C6 _ 8B. 45, 08
        mov     byte [eax+3H], 3                        ; 20C9 _ C6. 40, 03, 03
        mov     eax, 0                                  ; 20CD _ B8, 00000000
        jmp     ?_069                                   ; 20D2 _ E9, 000000B6

?_065:  mov     eax, dword [ebp+8H]                     ; 20D7 _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 20DA _ 0F B6. 40, 03
        cmp     al, 3                                   ; 20DE _ 3C, 03
        jne     ?_068                                   ; 20E0 _ 0F 85, 000000A2
        mov     eax, dword [ebp+8H]                     ; 20E6 _ 8B. 45, 08
        movzx   edx, byte [ebp-4H]                      ; 20E9 _ 0F B6. 55, FC
        mov     byte [eax+2H], dl                       ; 20ED _ 88. 50, 02
        mov     eax, dword [ebp+8H]                     ; 20F0 _ 8B. 45, 08
        mov     byte [eax+3H], 1                        ; 20F3 _ C6. 40, 03, 01
        mov     eax, dword [ebp+8H]                     ; 20F7 _ 8B. 45, 08
        movzx   eax, byte [eax]                         ; 20FA _ 0F B6. 00
        movzx   eax, al                                 ; 20FD _ 0F B6. C0
        and     eax, 07H                                ; 2100 _ 83. E0, 07
        mov     edx, eax                                ; 2103 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 2105 _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 2108 _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 210B _ 8B. 45, 08
        movzx   eax, byte [eax+1H]                      ; 210E _ 0F B6. 40, 01
        movzx   edx, al                                 ; 2112 _ 0F B6. D0
        mov     eax, dword [ebp+8H]                     ; 2115 _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 2118 _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 211B _ 8B. 45, 08
        movzx   eax, byte [eax+2H]                      ; 211E _ 0F B6. 40, 02
        movzx   edx, al                                 ; 2122 _ 0F B6. D0
        mov     eax, dword [ebp+8H]                     ; 2125 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 2128 _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 212B _ 8B. 45, 08
        movzx   eax, byte [eax]                         ; 212E _ 0F B6. 00
        movzx   eax, al                                 ; 2131 _ 0F B6. C0
        and     eax, 10H                                ; 2134 _ 83. E0, 10
        test    eax, eax                                ; 2137 _ 85. C0
        jz      ?_066                                   ; 2139 _ 74, 13
        mov     eax, dword [ebp+8H]                     ; 213B _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 213E _ 8B. 40, 04
        or      eax, 0FFFFFF00H                         ; 2141 _ 0D, FFFFFF00
        mov     edx, eax                                ; 2146 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 2148 _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 214B _ 89. 50, 04
?_066:  mov     eax, dword [ebp+8H]                     ; 214E _ 8B. 45, 08
        movzx   eax, byte [eax]                         ; 2151 _ 0F B6. 00
        movzx   eax, al                                 ; 2154 _ 0F B6. C0
        and     eax, 20H                                ; 2157 _ 83. E0, 20
        test    eax, eax                                ; 215A _ 85. C0
        jz      ?_067                                   ; 215C _ 74, 13
        mov     eax, dword [ebp+8H]                     ; 215E _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 2161 _ 8B. 40, 08
        or      eax, 0FFFFFF00H                         ; 2164 _ 0D, FFFFFF00
        mov     edx, eax                                ; 2169 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 216B _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 216E _ 89. 50, 08
?_067:  mov     eax, dword [ebp+8H]                     ; 2171 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 2174 _ 8B. 40, 08
        neg     eax                                     ; 2177 _ F7. D8
        mov     edx, eax                                ; 2179 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 217B _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 217E _ 89. 50, 08
        mov     eax, 1                                  ; 2181 _ B8, 00000001
        jmp     ?_069                                   ; 2186 _ EB, 05

?_068:  mov     eax, 4294967295                         ; 2188 _ B8, FFFFFFFF
?_069:  leave                                           ; 218D _ C9
        ret                                             ; 218E _ C3
; mouse_decode End of function

intHandlerKeyboard:; Function begin
        push    ebp                                     ; 218F _ 55
        mov     ebp, esp                                ; 2190 _ 89. E5
        sub     esp, 40                                 ; 2192 _ 83. EC, 28
        mov     dword [esp+4H], 32                      ; 2195 _ C7. 44 24, 04, 00000020
        mov     dword [esp], 32                         ; 219D _ C7. 04 24, 00000020
        call    io_out8                                 ; 21A4 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 32                      ; 21A9 _ C7. 44 24, 04, 00000020
        mov     dword [esp], 160                        ; 21B1 _ C7. 04 24, 000000A0
        call    io_out8                                 ; 21B8 _ E8, FFFFFFFC(rel)
        mov     dword [esp], 96                         ; 21BD _ C7. 04 24, 00000060
        call    io_in8                                  ; 21C4 _ E8, FFFFFFFC(rel)
        mov     byte [ebp-9H], al                       ; 21C9 _ 88. 45, F7
        movzx   eax, byte [ebp-9H]                      ; 21CC _ 0F B6. 45, F7
        mov     dword [esp+4H], eax                     ; 21D0 _ 89. 44 24, 04
        mov     dword [esp], keyinfo                    ; 21D4 _ C7. 04 24, 00000000(d)
        call    fifo8_put                               ; 21DB _ E8, FFFFFFFC(rel)
        leave                                           ; 21E0 _ C9
        ret                                             ; 21E1 _ C3
; intHandlerKeyboard End of function

intHandlerMouse:; Function begin
        push    ebp                                     ; 21E2 _ 55
        mov     ebp, esp                                ; 21E3 _ 89. E5
        sub     esp, 40                                 ; 21E5 _ 83. EC, 28
        mov     dword [esp+4H], 32                      ; 21E8 _ C7. 44 24, 04, 00000020
        mov     dword [esp], 32                         ; 21F0 _ C7. 04 24, 00000020
        call    io_out8                                 ; 21F7 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 32                      ; 21FC _ C7. 44 24, 04, 00000020
        mov     dword [esp], 160                        ; 2204 _ C7. 04 24, 000000A0
        call    io_out8                                 ; 220B _ E8, FFFFFFFC(rel)
        mov     dword [esp], 96                         ; 2210 _ C7. 04 24, 00000060
        call    io_in8                                  ; 2217 _ E8, FFFFFFFC(rel)
        mov     byte [ebp-9H], al                       ; 221C _ 88. 45, F7
        movzx   eax, byte [ebp-9H]                      ; 221F _ 0F B6. 45, F7
        mov     dword [esp+4H], eax                     ; 2223 _ 89. 44 24, 04
        mov     dword [esp], mouseinfo                  ; 2227 _ C7. 04 24, 00000000(d)
        call    fifo8_put                               ; 222E _ E8, FFFFFFFC(rel)
        leave                                           ; 2233 _ C9
        ret                                             ; 2234 _ C3
; intHandlerMouse End of function

fifo8_init:; Function begin
        push    ebp                                     ; 2235 _ 55
        mov     ebp, esp                                ; 2236 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 2238 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 223B _ 8B. 55, 10
        mov     dword [eax], edx                        ; 223E _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 2240 _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 2243 _ C7. 40, 04, 00000000
        mov     eax, dword [ebp+8H]                     ; 224A _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 224D _ C7. 40, 08, 00000000
        mov     eax, dword [ebp+8H]                     ; 2254 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 2257 _ 8B. 55, 0C
        mov     dword [eax+0CH], edx                    ; 225A _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 225D _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 2260 _ 8B. 55, 0C
        mov     dword [eax+10H], edx                    ; 2263 _ 89. 50, 10
        mov     eax, dword [ebp+8H]                     ; 2266 _ 8B. 45, 08
        mov     dword [eax+14H], 0                      ; 2269 _ C7. 40, 14, 00000000
        mov     eax, dword [ebp+8H]                     ; 2270 _ 8B. 45, 08
        mov     edx, dword [ebp+14H]                    ; 2273 _ 8B. 55, 14
        mov     dword [eax+18H], edx                    ; 2276 _ 89. 50, 18
        pop     ebp                                     ; 2279 _ 5D
        ret                                             ; 227A _ C3
; fifo8_init End of function

fifo8_put:; Function begin
        push    ebp                                     ; 227B _ 55
        mov     ebp, esp                                ; 227C _ 89. E5
        sub     esp, 40                                 ; 227E _ 83. EC, 28
        mov     eax, dword [ebp+0CH]                    ; 2281 _ 8B. 45, 0C
        mov     byte [ebp-1CH], al                      ; 2284 _ 88. 45, E4
        cmp     dword [ebp+8H], 0                       ; 2287 _ 83. 7D, 08, 00
        jnz     ?_070                                   ; 228B _ 75, 0A
        mov     eax, 4294967295                         ; 228D _ B8, FFFFFFFF
        jmp     ?_074                                   ; 2292 _ E9, 000000A9

?_070:  mov     eax, dword [ebp+8H]                     ; 2297 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 229A _ 8B. 40, 10
        test    eax, eax                                ; 229D _ 85. C0
        jnz     ?_071                                   ; 229F _ 75, 1B
        mov     eax, dword [ebp+8H]                     ; 22A1 _ 8B. 45, 08
        mov     eax, dword [eax+14H]                    ; 22A4 _ 8B. 40, 14
        or      eax, 01H                                ; 22A7 _ 83. C8, 01
        mov     edx, eax                                ; 22AA _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 22AC _ 8B. 45, 08
        mov     dword [eax+14H], edx                    ; 22AF _ 89. 50, 14
        mov     eax, 4294967295                         ; 22B2 _ B8, FFFFFFFF
        jmp     ?_074                                   ; 22B7 _ E9, 00000084

?_071:  mov     eax, dword [ebp+8H]                     ; 22BC _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 22BF _ 8B. 40, 04
        mov     dword [ebp-0CH], eax                    ; 22C2 _ 89. 45, F4
        mov     eax, dword [ebp+8H]                     ; 22C5 _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 22C8 _ 8B. 10
        mov     eax, dword [ebp-0CH]                    ; 22CA _ 8B. 45, F4
        add     edx, eax                                ; 22CD _ 01. C2
        movzx   eax, byte [ebp-1CH]                     ; 22CF _ 0F B6. 45, E4
        mov     byte [edx], al                          ; 22D3 _ 88. 02
        mov     eax, dword [ebp+8H]                     ; 22D5 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 22D8 _ 8B. 40, 04
        lea     edx, [eax+1H]                           ; 22DB _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 22DE _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 22E1 _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 22E4 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 22E7 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 22EA _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 22ED _ 8B. 40, 0C
        cmp     edx, eax                                ; 22F0 _ 39. C2
        jnz     ?_072                                   ; 22F2 _ 75, 0A
        mov     eax, dword [ebp+8H]                     ; 22F4 _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 22F7 _ C7. 40, 04, 00000000
?_072:  mov     eax, dword [ebp+8H]                     ; 22FE _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 2301 _ 8B. 40, 10
        lea     edx, [eax-1H]                           ; 2304 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 2307 _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 230A _ 89. 50, 10
        mov     eax, dword [ebp+8H]                     ; 230D _ 8B. 45, 08
        mov     eax, dword [eax+18H]                    ; 2310 _ 8B. 40, 18
        test    eax, eax                                ; 2313 _ 85. C0
        jz      ?_073                                   ; 2315 _ 74, 24
        mov     eax, dword [ebp+8H]                     ; 2317 _ 8B. 45, 08
        mov     eax, dword [eax+18H]                    ; 231A _ 8B. 40, 18
        mov     eax, dword [eax+4H]                     ; 231D _ 8B. 40, 04
        cmp     eax, 2                                  ; 2320 _ 83. F8, 02
        jz      ?_073                                   ; 2323 _ 74, 16
        mov     eax, dword [ebp+8H]                     ; 2325 _ 8B. 45, 08
        mov     eax, dword [eax+18H]                    ; 2328 _ 8B. 40, 18
        mov     dword [esp+4H], 0                       ; 232B _ C7. 44 24, 04, 00000000
        mov     dword [esp], eax                        ; 2333 _ 89. 04 24
        call    task_run                                ; 2336 _ E8, FFFFFFFC(rel)
?_073:  mov     eax, 0                                  ; 233B _ B8, 00000000
?_074:  leave                                           ; 2340 _ C9
        ret                                             ; 2341 _ C3
; fifo8_put End of function

fifo8_get:; Function begin
        push    ebp                                     ; 2342 _ 55
        mov     ebp, esp                                ; 2343 _ 89. E5
        sub     esp, 16                                 ; 2345 _ 83. EC, 10
        mov     eax, dword [ebp+8H]                     ; 2348 _ 8B. 45, 08
        mov     edx, dword [eax+10H]                    ; 234B _ 8B. 50, 10
        mov     eax, dword [ebp+8H]                     ; 234E _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 2351 _ 8B. 40, 0C
        cmp     edx, eax                                ; 2354 _ 39. C2
        jnz     ?_075                                   ; 2356 _ 75, 11
        mov     eax, dword [ebp+8H]                     ; 2358 _ 8B. 45, 08
        mov     dword [eax+14H], 0                      ; 235B _ C7. 40, 14, 00000000
        mov     eax, 4294967295                         ; 2362 _ B8, FFFFFFFF
        jmp     ?_077                                   ; 2367 _ EB, 57

?_075:  mov     eax, dword [ebp+8H]                     ; 2369 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 236C _ 8B. 40, 08
        mov     dword [ebp-8H], eax                     ; 236F _ 89. 45, F8
        mov     eax, dword [ebp+8H]                     ; 2372 _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 2375 _ 8B. 10
        mov     eax, dword [ebp-8H]                     ; 2377 _ 8B. 45, F8
        add     eax, edx                                ; 237A _ 01. D0
        movzx   eax, byte [eax]                         ; 237C _ 0F B6. 00
        movzx   eax, al                                 ; 237F _ 0F B6. C0
        mov     dword [ebp-4H], eax                     ; 2382 _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 2385 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 2388 _ 8B. 40, 08
        lea     edx, [eax+1H]                           ; 238B _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 238E _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 2391 _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 2394 _ 8B. 45, 08
        mov     edx, dword [eax+8H]                     ; 2397 _ 8B. 50, 08
        mov     eax, dword [ebp+8H]                     ; 239A _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 239D _ 8B. 40, 0C
        cmp     edx, eax                                ; 23A0 _ 39. C2
        jnz     ?_076                                   ; 23A2 _ 75, 0A
        mov     eax, dword [ebp+8H]                     ; 23A4 _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 23A7 _ C7. 40, 08, 00000000
?_076:  mov     eax, dword [ebp+8H]                     ; 23AE _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 23B1 _ 8B. 40, 10
        lea     edx, [eax+1H]                           ; 23B4 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 23B7 _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 23BA _ 89. 50, 10
        mov     eax, dword [ebp-4H]                     ; 23BD _ 8B. 45, FC
?_077:  leave                                           ; 23C0 _ C9
        ret                                             ; 23C1 _ C3
; fifo8_get End of function

fifo8_status:; Function begin
        push    ebp                                     ; 23C2 _ 55
        mov     ebp, esp                                ; 23C3 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 23C5 _ 8B. 45, 08
        mov     edx, dword [eax+0CH]                    ; 23C8 _ 8B. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 23CB _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 23CE _ 8B. 40, 10
        sub     edx, eax                                ; 23D1 _ 29. C2
        mov     eax, edx                                ; 23D3 _ 89. D0
        pop     ebp                                     ; 23D5 _ 5D
        ret                                             ; 23D6 _ C3
; fifo8_status End of function

charToHexVal:; Function begin
        push    ebp                                     ; 23D7 _ 55
        mov     ebp, esp                                ; 23D8 _ 89. E5
        sub     esp, 4                                  ; 23DA _ 83. EC, 04
        mov     eax, dword [ebp+8H]                     ; 23DD _ 8B. 45, 08
        mov     byte [ebp-4H], al                       ; 23E0 _ 88. 45, FC
        cmp     byte [ebp-4H], 9                        ; 23E3 _ 80. 7D, FC, 09
        jle     ?_078                                   ; 23E7 _ 7E, 09
        movzx   eax, byte [ebp-4H]                      ; 23E9 _ 0F B6. 45, FC
        add     eax, 55                                 ; 23ED _ 83. C0, 37
        jmp     ?_079                                   ; 23F0 _ EB, 07

?_078:  movzx   eax, byte [ebp-4H]                      ; 23F2 _ 0F B6. 45, FC
        add     eax, 48                                 ; 23F6 _ 83. C0, 30
?_079:  leave                                           ; 23F9 _ C9
        ret                                             ; 23FA _ C3
; charToHexVal End of function

charToHexStr:; Function begin
        push    ebp                                     ; 23FB _ 55
        mov     ebp, esp                                ; 23FC _ 89. E5
        sub     esp, 24                                 ; 23FE _ 83. EC, 18
        mov     eax, dword [ebp+8H]                     ; 2401 _ 8B. 45, 08
        mov     byte [ebp-14H], al                      ; 2404 _ 88. 45, EC
        mov     dword [ebp-4H], 0                       ; 2407 _ C7. 45, FC, 00000000
        movzx   eax, byte [ebp-14H]                     ; 240E _ 0F B6. 45, EC
        and     eax, 0FH                                ; 2412 _ 83. E0, 0F
        mov     byte [ebp-5H], al                       ; 2415 _ 88. 45, FB
        movsx   eax, byte [ebp-5H]                      ; 2418 _ 0F BE. 45, FB
        mov     dword [esp], eax                        ; 241C _ 89. 04 24
        call    charToHexVal                            ; 241F _ E8, FFFFFFFC(rel)
        mov     byte [?_200], al                        ; 2424 _ A2, 000002A3(d)
        movzx   eax, byte [ebp-14H]                     ; 2429 _ 0F B6. 45, EC
        shr     al, 4                                   ; 242D _ C0. E8, 04
        mov     byte [ebp-14H], al                      ; 2430 _ 88. 45, EC
        movzx   eax, byte [ebp-14H]                     ; 2433 _ 0F B6. 45, EC
        movsx   eax, al                                 ; 2437 _ 0F BE. C0
        mov     dword [esp], eax                        ; 243A _ 89. 04 24
        call    charToHexVal                            ; 243D _ E8, FFFFFFFC(rel)
        mov     byte [?_199], al                        ; 2442 _ A2, 000002A2(d)
        mov     eax, keyval                             ; 2447 _ B8, 000002A0(d)
        leave                                           ; 244C _ C9
        ret                                             ; 244D _ C3
; charToHexStr End of function

intToHexStr:; Function begin
        push    ebp                                     ; 244E _ 55
        mov     ebp, esp                                ; 244F _ 89. E5
        sub     esp, 16                                 ; 2451 _ 83. EC, 10
        mov     byte [str.1386], 48                     ; 2454 _ C6. 05, 000003A0(d), 30
        mov     byte [?_203], 88                        ; 245B _ C6. 05, 000003A1(d), 58
        mov     byte [?_204], 0                         ; 2462 _ C6. 05, 000003AA(d), 00
        mov     dword [ebp-0CH], 2                      ; 2469 _ C7. 45, F4, 00000002
        jmp     ?_081                                   ; 2470 _ EB, 0F

?_080:  mov     eax, dword [ebp-0CH]                    ; 2472 _ 8B. 45, F4
        add     eax, str.1386                           ; 2475 _ 05, 000003A0(d)
        mov     byte [eax], 48                          ; 247A _ C6. 00, 30
        add     dword [ebp-0CH], 1                      ; 247D _ 83. 45, F4, 01
?_081:  cmp     dword [ebp-0CH], 9                      ; 2481 _ 83. 7D, F4, 09
        jle     ?_080                                   ; 2485 _ 7E, EB
        mov     dword [ebp-8H], 9                       ; 2487 _ C7. 45, F8, 00000009
        jmp     ?_085                                   ; 248E _ EB, 40

?_082:  mov     eax, dword [ebp+8H]                     ; 2490 _ 8B. 45, 08
        and     eax, 0FH                                ; 2493 _ 83. E0, 0F
        mov     dword [ebp-4H], eax                     ; 2496 _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 2499 _ 8B. 45, 08
        shr     eax, 4                                  ; 249C _ C1. E8, 04
        mov     dword [ebp+8H], eax                     ; 249F _ 89. 45, 08
        cmp     dword [ebp-4H], 9                       ; 24A2 _ 83. 7D, FC, 09
        jle     ?_083                                   ; 24A6 _ 7E, 13
        mov     eax, dword [ebp-4H]                     ; 24A8 _ 8B. 45, FC
        add     eax, 55                                 ; 24AB _ 83. C0, 37
        mov     edx, dword [ebp-8H]                     ; 24AE _ 8B. 55, F8
        add     edx, str.1386                           ; 24B1 _ 81. C2, 000003A0(d)
        mov     byte [edx], al                          ; 24B7 _ 88. 02
        jmp     ?_084                                   ; 24B9 _ EB, 11

?_083:  mov     eax, dword [ebp-4H]                     ; 24BB _ 8B. 45, FC
        add     eax, 48                                 ; 24BE _ 83. C0, 30
        mov     edx, dword [ebp-8H]                     ; 24C1 _ 8B. 55, F8
        add     edx, str.1386                           ; 24C4 _ 81. C2, 000003A0(d)
        mov     byte [edx], al                          ; 24CA _ 88. 02
?_084:  sub     dword [ebp-8H], 1                       ; 24CC _ 83. 6D, F8, 01
?_085:  cmp     dword [ebp-8H], 1                       ; 24D0 _ 83. 7D, F8, 01
        jle     ?_086                                   ; 24D4 _ 7E, 06
        cmp     dword [ebp+8H], 0                       ; 24D6 _ 83. 7D, 08, 00
        jnz     ?_082                                   ; 24DA _ 75, B4
?_086:  mov     eax, str.1386                           ; 24DC _ B8, 000003A0(d)
        leave                                           ; 24E1 _ C9
        ret                                             ; 24E2 _ C3
; intToHexStr End of function

memman_init:; Function begin
        push    ebp                                     ; 24E3 _ 55
        mov     ebp, esp                                ; 24E4 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 24E6 _ 8B. 45, 08
        mov     dword [eax], 0                          ; 24E9 _ C7. 00, 00000000
        mov     eax, dword [ebp+8H]                     ; 24EF _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 24F2 _ C7. 40, 04, 00000000
        mov     eax, dword [ebp+8H]                     ; 24F9 _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 24FC _ C7. 40, 08, 00000000
        mov     eax, dword [ebp+8H]                     ; 2503 _ 8B. 45, 08
        mov     dword [eax+0CH], 0                      ; 2506 _ C7. 40, 0C, 00000000
        pop     ebp                                     ; 250D _ 5D
        ret                                             ; 250E _ C3
; memman_init End of function

memman_total:; Function begin
        push    ebp                                     ; 250F _ 55
        mov     ebp, esp                                ; 2510 _ 89. E5
        sub     esp, 16                                 ; 2512 _ 83. EC, 10
        mov     dword [ebp-4H], 0                       ; 2515 _ C7. 45, FC, 00000000
        mov     dword [ebp-8H], 0                       ; 251C _ C7. 45, F8, 00000000
        jmp     ?_088                                   ; 2523 _ EB, 14

?_087:  mov     eax, dword [ebp+8H]                     ; 2525 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 2528 _ 8B. 55, F8
        add     edx, 2                                  ; 252B _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 252E _ 8B. 44 D0, 04
        add     dword [ebp-4H], eax                     ; 2532 _ 01. 45, FC
        add     dword [ebp-8H], 1                       ; 2535 _ 83. 45, F8, 01
?_088:  mov     eax, dword [ebp+8H]                     ; 2539 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 253C _ 8B. 00
        cmp     eax, dword [ebp-8H]                     ; 253E _ 3B. 45, F8
        ja      ?_087                                   ; 2541 _ 77, E2
        mov     eax, dword [ebp-4H]                     ; 2543 _ 8B. 45, FC
        leave                                           ; 2546 _ C9
        ret                                             ; 2547 _ C3
; memman_total End of function

memman_alloc:; Function begin
        push    ebp                                     ; 2548 _ 55
        mov     ebp, esp                                ; 2549 _ 89. E5
        sub     esp, 16                                 ; 254B _ 83. EC, 10
        mov     dword [ebp-8H], 0                       ; 254E _ C7. 45, F8, 00000000
        jmp     ?_092                                   ; 2555 _ E9, 00000085

?_089:  mov     eax, dword [ebp+8H]                     ; 255A _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 255D _ 8B. 55, F8
        add     edx, 2                                  ; 2560 _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 2563 _ 8B. 44 D0, 04
        cmp     eax, dword [ebp+0CH]                    ; 2567 _ 3B. 45, 0C
        jc      ?_091                                   ; 256A _ 72, 6F
        mov     eax, dword [ebp+8H]                     ; 256C _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 256F _ 8B. 55, F8
        add     edx, 2                                  ; 2572 _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 2575 _ 8B. 04 D0
        mov     dword [ebp-4H], eax                     ; 2578 _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 257B _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 257E _ 8B. 55, F8
        add     edx, 2                                  ; 2581 _ 83. C2, 02
        mov     edx, dword [eax+edx*8]                  ; 2584 _ 8B. 14 D0
        mov     eax, dword [ebp+0CH]                    ; 2587 _ 8B. 45, 0C
        lea     ecx, [edx+eax]                          ; 258A _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 258D _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 2590 _ 8B. 55, F8
        add     edx, 2                                  ; 2593 _ 83. C2, 02
        mov     dword [eax+edx*8], ecx                  ; 2596 _ 89. 0C D0
        mov     eax, dword [ebp+8H]                     ; 2599 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 259C _ 8B. 55, F8
        add     edx, 2                                  ; 259F _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 25A2 _ 8B. 44 D0, 04
        sub     eax, dword [ebp+0CH]                    ; 25A6 _ 2B. 45, 0C
        mov     edx, eax                                ; 25A9 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 25AB _ 8B. 45, 08
        mov     ecx, dword [ebp-8H]                     ; 25AE _ 8B. 4D, F8
        add     ecx, 2                                  ; 25B1 _ 83. C1, 02
        mov     dword [eax+ecx*8+4H], edx               ; 25B4 _ 89. 54 C8, 04
        mov     eax, dword [ebp+8H]                     ; 25B8 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 25BB _ 8B. 55, F8
        add     edx, 2                                  ; 25BE _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 25C1 _ 8B. 44 D0, 04
        test    eax, eax                                ; 25C5 _ 85. C0
        jnz     ?_090                                   ; 25C7 _ 75, 0D
        mov     eax, dword [ebp+8H]                     ; 25C9 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 25CC _ 8B. 00
        lea     edx, [eax-1H]                           ; 25CE _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 25D1 _ 8B. 45, 08
        mov     dword [eax], edx                        ; 25D4 _ 89. 10
?_090:  mov     eax, dword [ebp-4H]                     ; 25D6 _ 8B. 45, FC
        jmp     ?_093                                   ; 25D9 _ EB, 17

?_091:  add     dword [ebp-8H], 1                       ; 25DB _ 83. 45, F8, 01
?_092:  mov     eax, dword [ebp+8H]                     ; 25DF _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 25E2 _ 8B. 00
        cmp     eax, dword [ebp-8H]                     ; 25E4 _ 3B. 45, F8
        ja      ?_089                                   ; 25E7 _ 0F 87, FFFFFF6D
        mov     eax, 0                                  ; 25ED _ B8, 00000000
?_093:  leave                                           ; 25F2 _ C9
        ret                                             ; 25F3 _ C3
; memman_alloc End of function

memman_free:; Function begin
        push    ebp                                     ; 25F4 _ 55
        mov     ebp, esp                                ; 25F5 _ 89. E5
        push    ebx                                     ; 25F7 _ 53
        sub     esp, 16                                 ; 25F8 _ 83. EC, 10
        mov     dword [ebp-0CH], 0                      ; 25FB _ C7. 45, F4, 00000000
        jmp     ?_096                                   ; 2602 _ EB, 17

?_094:  mov     eax, dword [ebp+8H]                     ; 2604 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 2607 _ 8B. 55, F4
        add     edx, 2                                  ; 260A _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 260D _ 8B. 04 D0
        cmp     eax, dword [ebp+0CH]                    ; 2610 _ 3B. 45, 0C
        jbe     ?_095                                   ; 2613 _ 76, 02
        jmp     ?_097                                   ; 2615 _ EB, 0E

?_095:  add     dword [ebp-0CH], 1                      ; 2617 _ 83. 45, F4, 01
?_096:  mov     eax, dword [ebp+8H]                     ; 261B _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 261E _ 8B. 00
        cmp     eax, dword [ebp-0CH]                    ; 2620 _ 3B. 45, F4
        jg      ?_094                                   ; 2623 _ 7F, DF
?_097:  cmp     dword [ebp-0CH], 0                      ; 2625 _ 83. 7D, F4, 00
        jle     ?_099                                   ; 2629 _ 0F 8E, 000000BA
        mov     eax, dword [ebp-0CH]                    ; 262F _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 2632 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 2635 _ 8B. 45, 08
        add     edx, 2                                  ; 2638 _ 83. C2, 02
        mov     edx, dword [eax+edx*8]                  ; 263B _ 8B. 14 D0
        mov     eax, dword [ebp-0CH]                    ; 263E _ 8B. 45, F4
        lea     ecx, [eax-1H]                           ; 2641 _ 8D. 48, FF
        mov     eax, dword [ebp+8H]                     ; 2644 _ 8B. 45, 08
        add     ecx, 2                                  ; 2647 _ 83. C1, 02
        mov     eax, dword [eax+ecx*8+4H]               ; 264A _ 8B. 44 C8, 04
        add     eax, edx                                ; 264E _ 01. D0
        cmp     eax, dword [ebp+0CH]                    ; 2650 _ 3B. 45, 0C
        jne     ?_099                                   ; 2653 _ 0F 85, 00000090
        mov     eax, dword [ebp-0CH]                    ; 2659 _ 8B. 45, F4
        lea     ebx, [eax-1H]                           ; 265C _ 8D. 58, FF
        mov     eax, dword [ebp-0CH]                    ; 265F _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 2662 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 2665 _ 8B. 45, 08
        add     edx, 2                                  ; 2668 _ 83. C2, 02
        mov     edx, dword [eax+edx*8+4H]               ; 266B _ 8B. 54 D0, 04
        mov     eax, dword [ebp+10H]                    ; 266F _ 8B. 45, 10
        lea     ecx, [edx+eax]                          ; 2672 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 2675 _ 8B. 45, 08
        lea     edx, [ebx+2H]                           ; 2678 _ 8D. 53, 02
        mov     dword [eax+edx*8+4H], ecx               ; 267B _ 89. 4C D0, 04
        mov     eax, dword [ebp+8H]                     ; 267F _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 2682 _ 8B. 00
        cmp     eax, dword [ebp-0CH]                    ; 2684 _ 3B. 45, F4
        jle     ?_098                                   ; 2687 _ 7E, 56
        mov     eax, dword [ebp+10H]                    ; 2689 _ 8B. 45, 10
        mov     edx, dword [ebp+0CH]                    ; 268C _ 8B. 55, 0C
        lea     ecx, [edx+eax]                          ; 268F _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 2692 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 2695 _ 8B. 55, F4
        add     edx, 2                                  ; 2698 _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 269B _ 8B. 04 D0
        cmp     ecx, eax                                ; 269E _ 39. C1
        jnz     ?_098                                   ; 26A0 _ 75, 3D
        mov     eax, dword [ebp-0CH]                    ; 26A2 _ 8B. 45, F4
        lea     ebx, [eax-1H]                           ; 26A5 _ 8D. 58, FF
        mov     eax, dword [ebp-0CH]                    ; 26A8 _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 26AB _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 26AE _ 8B. 45, 08
        add     edx, 2                                  ; 26B1 _ 83. C2, 02
        mov     edx, dword [eax+edx*8+4H]               ; 26B4 _ 8B. 54 D0, 04
        mov     eax, dword [ebp+8H]                     ; 26B8 _ 8B. 45, 08
        mov     ecx, dword [ebp-0CH]                    ; 26BB _ 8B. 4D, F4
        add     ecx, 2                                  ; 26BE _ 83. C1, 02
        mov     eax, dword [eax+ecx*8+4H]               ; 26C1 _ 8B. 44 C8, 04
        lea     ecx, [edx+eax]                          ; 26C5 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 26C8 _ 8B. 45, 08
        lea     edx, [ebx+2H]                           ; 26CB _ 8D. 53, 02
        mov     dword [eax+edx*8+4H], ecx               ; 26CE _ 89. 4C D0, 04
        mov     eax, dword [ebp+8H]                     ; 26D2 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 26D5 _ 8B. 00
        lea     edx, [eax-1H]                           ; 26D7 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 26DA _ 8B. 45, 08
        mov     dword [eax], edx                        ; 26DD _ 89. 10
?_098:  mov     eax, 0                                  ; 26DF _ B8, 00000000
        jmp     ?_105                                   ; 26E4 _ E9, 0000011C

?_099:  mov     eax, dword [ebp+8H]                     ; 26E9 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 26EC _ 8B. 00
        cmp     eax, dword [ebp-0CH]                    ; 26EE _ 3B. 45, F4
        jle     ?_100                                   ; 26F1 _ 7E, 52
        mov     eax, dword [ebp+10H]                    ; 26F3 _ 8B. 45, 10
        mov     edx, dword [ebp+0CH]                    ; 26F6 _ 8B. 55, 0C
        lea     ecx, [edx+eax]                          ; 26F9 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 26FC _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 26FF _ 8B. 55, F4
        add     edx, 2                                  ; 2702 _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 2705 _ 8B. 04 D0
        cmp     ecx, eax                                ; 2708 _ 39. C1
        jnz     ?_100                                   ; 270A _ 75, 39
        mov     eax, dword [ebp+8H]                     ; 270C _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 270F _ 8B. 55, F4
        lea     ecx, [edx+2H]                           ; 2712 _ 8D. 4A, 02
        mov     edx, dword [ebp+0CH]                    ; 2715 _ 8B. 55, 0C
        mov     dword [eax+ecx*8], edx                  ; 2718 _ 89. 14 C8
        mov     eax, dword [ebp+8H]                     ; 271B _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 271E _ 8B. 55, F4
        add     edx, 2                                  ; 2721 _ 83. C2, 02
        mov     edx, dword [eax+edx*8+4H]               ; 2724 _ 8B. 54 D0, 04
        mov     eax, dword [ebp+10H]                    ; 2728 _ 8B. 45, 10
        lea     ecx, [edx+eax]                          ; 272B _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 272E _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 2731 _ 8B. 55, F4
        add     edx, 2                                  ; 2734 _ 83. C2, 02
        mov     dword [eax+edx*8+4H], ecx               ; 2737 _ 89. 4C D0, 04
        mov     eax, 0                                  ; 273B _ B8, 00000000
        jmp     ?_105                                   ; 2740 _ E9, 000000C0

?_100:  mov     eax, dword [ebp+8H]                     ; 2745 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 2748 _ 8B. 00
        cmp     eax, 4095                               ; 274A _ 3D, 00000FFF
        jg      ?_104                                   ; 274F _ 0F 8F, 00000087
        mov     eax, dword [ebp+8H]                     ; 2755 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 2758 _ 8B. 00
        mov     dword [ebp-8H], eax                     ; 275A _ 89. 45, F8
        jmp     ?_102                                   ; 275D _ EB, 28

?_101:  mov     eax, dword [ebp-8H]                     ; 275F _ 8B. 45, F8
        lea     edx, [eax-1H]                           ; 2762 _ 8D. 50, FF
        mov     ecx, dword [ebp+8H]                     ; 2765 _ 8B. 4D, 08
        mov     eax, dword [ebp-8H]                     ; 2768 _ 8B. 45, F8
        lea     ebx, [eax+2H]                           ; 276B _ 8D. 58, 02
        mov     eax, dword [ebp+8H]                     ; 276E _ 8B. 45, 08
        add     edx, 2                                  ; 2771 _ 83. C2, 02
        lea     edx, [eax+edx*8]                        ; 2774 _ 8D. 14 D0
        mov     eax, dword [edx]                        ; 2777 _ 8B. 02
        mov     edx, dword [edx+4H]                     ; 2779 _ 8B. 52, 04
        mov     dword [ecx+ebx*8], eax                  ; 277C _ 89. 04 D9
        mov     dword [ecx+ebx*8+4H], edx               ; 277F _ 89. 54 D9, 04
        sub     dword [ebp-8H], 1                       ; 2783 _ 83. 6D, F8, 01
?_102:  mov     eax, dword [ebp-8H]                     ; 2787 _ 8B. 45, F8
        cmp     eax, dword [ebp-0CH]                    ; 278A _ 3B. 45, F4
        jg      ?_101                                   ; 278D _ 7F, D0
        mov     eax, dword [ebp+8H]                     ; 278F _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 2792 _ 8B. 00
        lea     edx, [eax+1H]                           ; 2794 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 2797 _ 8B. 45, 08
        mov     dword [eax], edx                        ; 279A _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 279C _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 279F _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 27A2 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 27A5 _ 8B. 00
        cmp     edx, eax                                ; 27A7 _ 39. C2
        jge     ?_103                                   ; 27A9 _ 7D, 0B
        mov     eax, dword [ebp+8H]                     ; 27AB _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 27AE _ 8B. 10
        mov     eax, dword [ebp+8H]                     ; 27B0 _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 27B3 _ 89. 50, 04
?_103:  mov     eax, dword [ebp+8H]                     ; 27B6 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 27B9 _ 8B. 55, F4
        lea     ecx, [edx+2H]                           ; 27BC _ 8D. 4A, 02
        mov     edx, dword [ebp+0CH]                    ; 27BF _ 8B. 55, 0C
        mov     dword [eax+ecx*8], edx                  ; 27C2 _ 89. 14 C8
        mov     eax, dword [ebp+8H]                     ; 27C5 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 27C8 _ 8B. 55, F4
        lea     ecx, [edx+2H]                           ; 27CB _ 8D. 4A, 02
        mov     edx, dword [ebp+10H]                    ; 27CE _ 8B. 55, 10
        mov     dword [eax+ecx*8+4H], edx               ; 27D1 _ 89. 54 C8, 04
        mov     eax, 0                                  ; 27D5 _ B8, 00000000
        jmp     ?_105                                   ; 27DA _ EB, 29

?_104:  mov     eax, dword [ebp+8H]                     ; 27DC _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 27DF _ 8B. 40, 0C
        lea     edx, [eax+1H]                           ; 27E2 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 27E5 _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 27E8 _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 27EB _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 27EE _ 8B. 40, 08
        mov     edx, eax                                ; 27F1 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 27F3 _ 8B. 45, 10
        add     eax, edx                                ; 27F6 _ 01. D0
        mov     edx, eax                                ; 27F8 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 27FA _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 27FD _ 89. 50, 08
        mov     eax, 4294967295                         ; 2800 _ B8, FFFFFFFF
?_105:  add     esp, 16                                 ; 2805 _ 83. C4, 10
        pop     ebx                                     ; 2808 _ 5B
        pop     ebp                                     ; 2809 _ 5D
        ret                                             ; 280A _ C3
; memman_free End of function

memman_alloc_4k:; Function begin
        push    ebp                                     ; 280B _ 55
        mov     ebp, esp                                ; 280C _ 89. E5
        sub     esp, 24                                 ; 280E _ 83. EC, 18
        mov     eax, dword [ebp+0CH]                    ; 2811 _ 8B. 45, 0C
        add     eax, 4095                               ; 2814 _ 05, 00000FFF
        and     eax, 0FFFFF000H                         ; 2819 _ 25, FFFFF000
        mov     dword [ebp+0CH], eax                    ; 281E _ 89. 45, 0C
        mov     eax, dword [ebp+0CH]                    ; 2821 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 2824 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2828 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 282B _ 89. 04 24
        call    memman_alloc                            ; 282E _ E8, FFFFFFFC(rel)
        mov     dword [ebp-4H], eax                     ; 2833 _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 2836 _ 8B. 45, FC
        leave                                           ; 2839 _ C9
        ret                                             ; 283A _ C3
; memman_alloc_4k End of function

memman_free_4k:; Function begin
        push    ebp                                     ; 283B _ 55
        mov     ebp, esp                                ; 283C _ 89. E5
        sub     esp, 28                                 ; 283E _ 83. EC, 1C
        mov     eax, dword [ebp+10H]                    ; 2841 _ 8B. 45, 10
        add     eax, 4095                               ; 2844 _ 05, 00000FFF
        and     eax, 0FFFFF000H                         ; 2849 _ 25, FFFFF000
        mov     dword [ebp+10H], eax                    ; 284E _ 89. 45, 10
        mov     eax, dword [ebp+10H]                    ; 2851 _ 8B. 45, 10
        mov     dword [esp+8H], eax                     ; 2854 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 2858 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 285B _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 285F _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2862 _ 89. 04 24
        call    memman_free                             ; 2865 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-4H], eax                     ; 286A _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 286D _ 8B. 45, FC
        leave                                           ; 2870 _ C9
        ret                                             ; 2871 _ C3
; memman_free_4k End of function

sheet_control_init:; Function begin
        push    ebp                                     ; 2872 _ 55
        mov     ebp, esp                                ; 2873 _ 89. E5
        sub     esp, 40                                 ; 2875 _ 83. EC, 28
        mov     dword [esp+4H], 9236                    ; 2878 _ C7. 44 24, 04, 00002414
        mov     eax, dword [ebp+8H]                     ; 2880 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2883 _ 89. 04 24
        call    memman_alloc_4k                         ; 2886 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 288B _ 89. 45, F4
        cmp     dword [ebp-0CH], 0                      ; 288E _ 83. 7D, F4, 00
        jnz     ?_106                                   ; 2892 _ 75, 24
        mov     eax, dword [ebp-0CH]                    ; 2894 _ 8B. 45, F4
        mov     dword [esp+8H], 9236                    ; 2897 _ C7. 44 24, 08, 00002414
        mov     dword [esp+4H], eax                     ; 289F _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 28A3 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 28A6 _ 89. 04 24
        call    memman_free_4k                          ; 28A9 _ E8, FFFFFFFC(rel)
        mov     eax, 0                                  ; 28AE _ B8, 00000000
        jmp     ?_110                                   ; 28B3 _ E9, 0000009D

?_106:  mov     eax, dword [ebp-0CH]                    ; 28B8 _ 8B. 45, F4
        mov     edx, dword [ebp+0CH]                    ; 28BB _ 8B. 55, 0C
        mov     dword [eax], edx                        ; 28BE _ 89. 10
        mov     eax, dword [ebp-0CH]                    ; 28C0 _ 8B. 45, F4
        mov     edx, dword [ebp+10H]                    ; 28C3 _ 8B. 55, 10
        mov     dword [eax+4H], edx                     ; 28C6 _ 89. 50, 04
        mov     eax, dword [ebp-0CH]                    ; 28C9 _ 8B. 45, F4
        mov     edx, dword [ebp+14H]                    ; 28CC _ 8B. 55, 14
        mov     dword [eax+8H], edx                     ; 28CF _ 89. 50, 08
        mov     eax, dword [ebp-0CH]                    ; 28D2 _ 8B. 45, F4
        mov     dword [eax+0CH], -1                     ; 28D5 _ C7. 40, 0C, FFFFFFFF
        mov     dword [ebp-10H], 0                      ; 28DC _ C7. 45, F0, 00000000
        jmp     ?_108                                   ; 28E3 _ EB, 1B

?_107:  mov     eax, dword [ebp-0CH]                    ; 28E5 _ 8B. 45, F4
        mov     edx, dword [ebp-10H]                    ; 28E8 _ 8B. 55, F0
        add     edx, 33                                 ; 28EB _ 83. C2, 21
        shl     edx, 5                                  ; 28EE _ C1. E2, 05
        add     eax, edx                                ; 28F1 _ 01. D0
        add     eax, 16                                 ; 28F3 _ 83. C0, 10
        mov     dword [eax], 0                          ; 28F6 _ C7. 00, 00000000
        add     dword [ebp-10H], 1                      ; 28FC _ 83. 45, F0, 01
?_108:  cmp     dword [ebp-10H], 255                    ; 2900 _ 81. 7D, F0, 000000FF
        jle     ?_107                                   ; 2907 _ 7E, DC
        mov     eax, dword [ebp+10H]                    ; 2909 _ 8B. 45, 10
        imul    eax, dword [ebp+14H]                    ; 290C _ 0F AF. 45, 14
        mov     dword [esp+4H], eax                     ; 2910 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2914 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2917 _ 89. 04 24
        call    memman_alloc_4k                         ; 291A _ E8, FFFFFFFC(rel)
        mov     edx, eax                                ; 291F _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 2921 _ 8B. 45, F4
        mov     dword [eax+10H], edx                    ; 2924 _ 89. 50, 10
        mov     eax, dword [ebp-0CH]                    ; 2927 _ 8B. 45, F4
        mov     eax, dword [eax+10H]                    ; 292A _ 8B. 40, 10
        test    eax, eax                                ; 292D _ 85. C0
        jnz     ?_109                                   ; 292F _ 75, 21
        mov     eax, dword [ebp-0CH]                    ; 2931 _ 8B. 45, F4
        mov     dword [esp+8H], 9236                    ; 2934 _ C7. 44 24, 08, 00002414
        mov     dword [esp+4H], eax                     ; 293C _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2940 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2943 _ 89. 04 24
        call    memman_free_4k                          ; 2946 _ E8, FFFFFFFC(rel)
        mov     eax, 0                                  ; 294B _ B8, 00000000
        jmp     ?_110                                   ; 2950 _ EB, 03

?_109:  mov     eax, dword [ebp-0CH]                    ; 2952 _ 8B. 45, F4
?_110:  leave                                           ; 2955 _ C9
        ret                                             ; 2956 _ C3
; sheet_control_init End of function

sheet_alloc:; Function begin
        push    ebp                                     ; 2957 _ 55
        mov     ebp, esp                                ; 2958 _ 89. E5
        sub     esp, 16                                 ; 295A _ 83. EC, 10
        mov     dword [ebp-8H], 0                       ; 295D _ C7. 45, F8, 00000000
        jmp     ?_113                                   ; 2964 _ EB, 5B

?_111:  mov     eax, dword [ebp+8H]                     ; 2966 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 2969 _ 8B. 55, F8
        add     edx, 33                                 ; 296C _ 83. C2, 21
        shl     edx, 5                                  ; 296F _ C1. E2, 05
        add     eax, edx                                ; 2972 _ 01. D0
        add     eax, 16                                 ; 2974 _ 83. C0, 10
        mov     eax, dword [eax]                        ; 2977 _ 8B. 00
        test    eax, eax                                ; 2979 _ 85. C0
        jnz     ?_112                                   ; 297B _ 75, 40
        mov     eax, dword [ebp-8H]                     ; 297D _ 8B. 45, F8
        shl     eax, 5                                  ; 2980 _ C1. E0, 05
        lea     edx, [eax+410H]                         ; 2983 _ 8D. 90, 00000410
        mov     eax, dword [ebp+8H]                     ; 2989 _ 8B. 45, 08
        add     eax, edx                                ; 298C _ 01. D0
        add     eax, 4                                  ; 298E _ 83. C0, 04
        mov     dword [ebp-4H], eax                     ; 2991 _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 2994 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 2997 _ 8B. 55, F8
        lea     ecx, [edx+4H]                           ; 299A _ 8D. 4A, 04
        mov     edx, dword [ebp-4H]                     ; 299D _ 8B. 55, FC
        mov     dword [eax+ecx*4+4H], edx               ; 29A0 _ 89. 54 88, 04
        mov     eax, dword [ebp-4H]                     ; 29A4 _ 8B. 45, FC
        mov     dword [eax+1CH], 1                      ; 29A7 _ C7. 40, 1C, 00000001
        mov     eax, dword [ebp-4H]                     ; 29AE _ 8B. 45, FC
        mov     dword [eax+18H], -1                     ; 29B1 _ C7. 40, 18, FFFFFFFF
        mov     eax, dword [ebp-4H]                     ; 29B8 _ 8B. 45, FC
        jmp     ?_114                                   ; 29BB _ EB, 12

?_112:  add     dword [ebp-8H], 1                       ; 29BD _ 83. 45, F8, 01
?_113:  cmp     dword [ebp-8H], 255                     ; 29C1 _ 81. 7D, F8, 000000FF
        jle     ?_111                                   ; 29C8 _ 7E, 9C
        mov     eax, 0                                  ; 29CA _ B8, 00000000
?_114:  leave                                           ; 29CF _ C9
        ret                                             ; 29D0 _ C3
; sheet_alloc End of function

sheet_setbuf:; Function begin
        push    ebp                                     ; 29D1 _ 55
        mov     ebp, esp                                ; 29D2 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 29D4 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 29D7 _ 8B. 55, 0C
        mov     dword [eax], edx                        ; 29DA _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 29DC _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 29DF _ 8B. 55, 10
        mov     dword [eax+4H], edx                     ; 29E2 _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 29E5 _ 8B. 45, 08
        mov     edx, dword [ebp+14H]                    ; 29E8 _ 8B. 55, 14
        mov     dword [eax+8H], edx                     ; 29EB _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 29EE _ 8B. 45, 08
        mov     edx, dword [ebp+18H]                    ; 29F1 _ 8B. 55, 18
        mov     dword [eax+14H], edx                    ; 29F4 _ 89. 50, 14
        pop     ebp                                     ; 29F7 _ 5D
        ret                                             ; 29F8 _ C3
; sheet_setbuf End of function

sheet_updown:; Function begin
        push    ebp                                     ; 29F9 _ 55
        mov     ebp, esp                                ; 29FA _ 89. E5
        push    esi                                     ; 29FC _ 56
        push    ebx                                     ; 29FD _ 53
        sub     esp, 48                                 ; 29FE _ 83. EC, 30
        mov     eax, dword [ebp+0CH]                    ; 2A01 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 2A04 _ 8B. 40, 18
        mov     dword [ebp-0CH], eax                    ; 2A07 _ 89. 45, F4
        mov     eax, dword [ebp+8H]                     ; 2A0A _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 2A0D _ 8B. 40, 0C
        add     eax, 1                                  ; 2A10 _ 83. C0, 01
        cmp     eax, dword [ebp+10H]                    ; 2A13 _ 3B. 45, 10
        jge     ?_115                                   ; 2A16 _ 7D, 0C
        mov     eax, dword [ebp+8H]                     ; 2A18 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 2A1B _ 8B. 40, 0C
        add     eax, 1                                  ; 2A1E _ 83. C0, 01
        mov     dword [ebp+10H], eax                    ; 2A21 _ 89. 45, 10
?_115:  cmp     dword [ebp+10H], -1                     ; 2A24 _ 83. 7D, 10, FF
        jge     ?_116                                   ; 2A28 _ 7D, 07
        mov     dword [ebp+10H], -1                     ; 2A2A _ C7. 45, 10, FFFFFFFF
?_116:  mov     eax, dword [ebp+0CH]                    ; 2A31 _ 8B. 45, 0C
        mov     edx, dword [ebp+10H]                    ; 2A34 _ 8B. 55, 10
        mov     dword [eax+18H], edx                    ; 2A37 _ 89. 50, 18
        mov     eax, dword [ebp-0CH]                    ; 2A3A _ 8B. 45, F4
        cmp     eax, dword [ebp+10H]                    ; 2A3D _ 3B. 45, 10
        jle     ?_123                                   ; 2A40 _ 0F 8E, 00000201
        cmp     dword [ebp+10H], 0                      ; 2A46 _ 83. 7D, 10, 00
        js      ?_119                                   ; 2A4A _ 0F 88, 000000F7
        mov     eax, dword [ebp-0CH]                    ; 2A50 _ 8B. 45, F4
        mov     dword [ebp-10H], eax                    ; 2A53 _ 89. 45, F0
        jmp     ?_118                                   ; 2A56 _ EB, 34

?_117:  mov     eax, dword [ebp-10H]                    ; 2A58 _ 8B. 45, F0
        lea     edx, [eax-1H]                           ; 2A5B _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 2A5E _ 8B. 45, 08
        add     edx, 4                                  ; 2A61 _ 83. C2, 04
        mov     edx, dword [eax+edx*4+4H]               ; 2A64 _ 8B. 54 90, 04
        mov     eax, dword [ebp+8H]                     ; 2A68 _ 8B. 45, 08
        mov     ecx, dword [ebp-10H]                    ; 2A6B _ 8B. 4D, F0
        add     ecx, 4                                  ; 2A6E _ 83. C1, 04
        mov     dword [eax+ecx*4+4H], edx               ; 2A71 _ 89. 54 88, 04
        mov     eax, dword [ebp+8H]                     ; 2A75 _ 8B. 45, 08
        mov     edx, dword [ebp-10H]                    ; 2A78 _ 8B. 55, F0
        add     edx, 4                                  ; 2A7B _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 2A7E _ 8B. 44 90, 04
        mov     edx, dword [ebp-10H]                    ; 2A82 _ 8B. 55, F0
        mov     dword [eax+18H], edx                    ; 2A85 _ 89. 50, 18
        sub     dword [ebp-10H], 1                      ; 2A88 _ 83. 6D, F0, 01
?_118:  mov     eax, dword [ebp-10H]                    ; 2A8C _ 8B. 45, F0
        cmp     eax, dword [ebp+10H]                    ; 2A8F _ 3B. 45, 10
        jg      ?_117                                   ; 2A92 _ 7F, C4
        mov     eax, dword [ebp+8H]                     ; 2A94 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 2A97 _ 8B. 55, 10
        lea     ecx, [edx+4H]                           ; 2A9A _ 8D. 4A, 04
        mov     edx, dword [ebp+0CH]                    ; 2A9D _ 8B. 55, 0C
        mov     dword [eax+ecx*4+4H], edx               ; 2AA0 _ 89. 54 88, 04
        mov     eax, dword [ebp+10H]                    ; 2AA4 _ 8B. 45, 10
        lea     esi, [eax+1H]                           ; 2AA7 _ 8D. 70, 01
        mov     eax, dword [ebp+0CH]                    ; 2AAA _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 2AAD _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 2AB0 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 2AB3 _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 2AB6 _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 2AB9 _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 2ABC _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 2ABF _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 2AC2 _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 2AC5 _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 2AC8 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 2ACB _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 2ACE _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 2AD1 _ 8B. 40, 0C
        mov     dword [esp+14H], esi                    ; 2AD4 _ 89. 74 24, 14
        mov     dword [esp+10H], ebx                    ; 2AD8 _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 2ADC _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 2AE0 _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 2AE4 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2AE8 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2AEB _ 89. 04 24
        call    sheet_refresh_map                       ; 2AEE _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 2AF3 _ 8B. 45, 10
        lea     esi, [eax+1H]                           ; 2AF6 _ 8D. 70, 01
        mov     eax, dword [ebp+0CH]                    ; 2AF9 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 2AFC _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 2AFF _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 2B02 _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 2B05 _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 2B08 _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 2B0B _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 2B0E _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 2B11 _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 2B14 _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 2B17 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 2B1A _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 2B1D _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 2B20 _ 8B. 40, 0C
        mov     dword [esp+14H], esi                    ; 2B23 _ 89. 74 24, 14
        mov     dword [esp+10H], ebx                    ; 2B27 _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 2B2B _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 2B2F _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 2B33 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2B37 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2B3A _ 89. 04 24
        call    sheet_refresh_local                     ; 2B3D _ E8, FFFFFFFC(rel)
        jmp     ?_130                                   ; 2B42 _ E9, 0000026C

?_119:  mov     eax, dword [ebp+8H]                     ; 2B47 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 2B4A _ 8B. 40, 0C
        cmp     eax, dword [ebp-0CH]                    ; 2B4D _ 3B. 45, F4
        jle     ?_122                                   ; 2B50 _ 7E, 47
        mov     eax, dword [ebp-0CH]                    ; 2B52 _ 8B. 45, F4
        mov     dword [ebp-10H], eax                    ; 2B55 _ 89. 45, F0
        jmp     ?_121                                   ; 2B58 _ EB, 34

?_120:  mov     eax, dword [ebp-10H]                    ; 2B5A _ 8B. 45, F0
        lea     edx, [eax+1H]                           ; 2B5D _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 2B60 _ 8B. 45, 08
        add     edx, 4                                  ; 2B63 _ 83. C2, 04
        mov     edx, dword [eax+edx*4+4H]               ; 2B66 _ 8B. 54 90, 04
        mov     eax, dword [ebp+8H]                     ; 2B6A _ 8B. 45, 08
        mov     ecx, dword [ebp-10H]                    ; 2B6D _ 8B. 4D, F0
        add     ecx, 4                                  ; 2B70 _ 83. C1, 04
        mov     dword [eax+ecx*4+4H], edx               ; 2B73 _ 89. 54 88, 04
        mov     eax, dword [ebp+8H]                     ; 2B77 _ 8B. 45, 08
        mov     edx, dword [ebp-10H]                    ; 2B7A _ 8B. 55, F0
        add     edx, 4                                  ; 2B7D _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 2B80 _ 8B. 44 90, 04
        mov     edx, dword [ebp-10H]                    ; 2B84 _ 8B. 55, F0
        mov     dword [eax+18H], edx                    ; 2B87 _ 89. 50, 18
        add     dword [ebp-10H], 1                      ; 2B8A _ 83. 45, F0, 01
?_121:  mov     eax, dword [ebp+8H]                     ; 2B8E _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 2B91 _ 8B. 40, 0C
        cmp     eax, dword [ebp-10H]                    ; 2B94 _ 3B. 45, F0
        jg      ?_120                                   ; 2B97 _ 7F, C1
?_122:  mov     eax, dword [ebp+8H]                     ; 2B99 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 2B9C _ 8B. 40, 0C
        lea     edx, [eax-1H]                           ; 2B9F _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 2BA2 _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 2BA5 _ 89. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 2BA8 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 2BAB _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 2BAE _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 2BB1 _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 2BB4 _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 2BB7 _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 2BBA _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 2BBD _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 2BC0 _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 2BC3 _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 2BC6 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 2BC9 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 2BCC _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 2BCF _ 8B. 40, 0C
        mov     dword [esp+14H], 0                      ; 2BD2 _ C7. 44 24, 14, 00000000
        mov     dword [esp+10H], ebx                    ; 2BDA _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 2BDE _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 2BE2 _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 2BE6 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2BEA _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2BED _ 89. 04 24
        call    sheet_refresh_map                       ; 2BF0 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+0CH]                    ; 2BF5 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 2BF8 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 2BFB _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 2BFE _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 2C01 _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 2C04 _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 2C07 _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 2C0A _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 2C0D _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 2C10 _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 2C13 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 2C16 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 2C19 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 2C1C _ 8B. 40, 0C
        mov     dword [esp+14H], 0                      ; 2C1F _ C7. 44 24, 14, 00000000
        mov     dword [esp+10H], ebx                    ; 2C27 _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 2C2B _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 2C2F _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 2C33 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2C37 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2C3A _ 89. 04 24
        call    sheet_refresh_local                     ; 2C3D _ E8, FFFFFFFC(rel)
        jmp     ?_130                                   ; 2C42 _ E9, 0000016C

?_123:  mov     eax, dword [ebp-0CH]                    ; 2C47 _ 8B. 45, F4
        cmp     eax, dword [ebp+10H]                    ; 2C4A _ 3B. 45, 10
        jge     ?_130                                   ; 2C4D _ 0F 8D, 00000160
        cmp     dword [ebp-0CH], 0                      ; 2C53 _ 83. 7D, F4, 00
        js      ?_126                                   ; 2C57 _ 78, 56
        mov     eax, dword [ebp-0CH]                    ; 2C59 _ 8B. 45, F4
        mov     dword [ebp-10H], eax                    ; 2C5C _ 89. 45, F0
        jmp     ?_125                                   ; 2C5F _ EB, 34

?_124:  mov     eax, dword [ebp-10H]                    ; 2C61 _ 8B. 45, F0
        lea     edx, [eax+1H]                           ; 2C64 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 2C67 _ 8B. 45, 08
        add     edx, 4                                  ; 2C6A _ 83. C2, 04
        mov     edx, dword [eax+edx*4+4H]               ; 2C6D _ 8B. 54 90, 04
        mov     eax, dword [ebp+8H]                     ; 2C71 _ 8B. 45, 08
        mov     ecx, dword [ebp-10H]                    ; 2C74 _ 8B. 4D, F0
        add     ecx, 4                                  ; 2C77 _ 83. C1, 04
        mov     dword [eax+ecx*4+4H], edx               ; 2C7A _ 89. 54 88, 04
        mov     eax, dword [ebp+8H]                     ; 2C7E _ 8B. 45, 08
        mov     edx, dword [ebp-10H]                    ; 2C81 _ 8B. 55, F0
        add     edx, 4                                  ; 2C84 _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 2C87 _ 8B. 44 90, 04
        mov     edx, dword [ebp-10H]                    ; 2C8B _ 8B. 55, F0
        mov     dword [eax+18H], edx                    ; 2C8E _ 89. 50, 18
        add     dword [ebp-10H], 1                      ; 2C91 _ 83. 45, F0, 01
?_125:  mov     eax, dword [ebp-10H]                    ; 2C95 _ 8B. 45, F0
        cmp     eax, dword [ebp+10H]                    ; 2C98 _ 3B. 45, 10
        jl      ?_124                                   ; 2C9B _ 7C, C4
        mov     eax, dword [ebp+8H]                     ; 2C9D _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 2CA0 _ 8B. 55, 10
        lea     ecx, [edx+4H]                           ; 2CA3 _ 8D. 4A, 04
        mov     edx, dword [ebp+0CH]                    ; 2CA6 _ 8B. 55, 0C
        mov     dword [eax+ecx*4+4H], edx               ; 2CA9 _ 89. 54 88, 04
        jmp     ?_129                                   ; 2CAD _ EB, 6C

?_126:  mov     eax, dword [ebp+8H]                     ; 2CAF _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 2CB2 _ 8B. 40, 0C
        mov     dword [ebp-10H], eax                    ; 2CB5 _ 89. 45, F0
        jmp     ?_128                                   ; 2CB8 _ EB, 3A

?_127:  mov     eax, dword [ebp-10H]                    ; 2CBA _ 8B. 45, F0
        lea     ecx, [eax+1H]                           ; 2CBD _ 8D. 48, 01
        mov     eax, dword [ebp+8H]                     ; 2CC0 _ 8B. 45, 08
        mov     edx, dword [ebp-10H]                    ; 2CC3 _ 8B. 55, F0
        add     edx, 4                                  ; 2CC6 _ 83. C2, 04
        mov     edx, dword [eax+edx*4+4H]               ; 2CC9 _ 8B. 54 90, 04
        mov     eax, dword [ebp+8H]                     ; 2CCD _ 8B. 45, 08
        add     ecx, 4                                  ; 2CD0 _ 83. C1, 04
        mov     dword [eax+ecx*4+4H], edx               ; 2CD3 _ 89. 54 88, 04
        mov     eax, dword [ebp-10H]                    ; 2CD7 _ 8B. 45, F0
        lea     edx, [eax+1H]                           ; 2CDA _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 2CDD _ 8B. 45, 08
        add     edx, 4                                  ; 2CE0 _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 2CE3 _ 8B. 44 90, 04
        mov     edx, dword [ebp-10H]                    ; 2CE7 _ 8B. 55, F0
        add     edx, 1                                  ; 2CEA _ 83. C2, 01
        mov     dword [eax+18H], edx                    ; 2CED _ 89. 50, 18
        sub     dword [ebp-10H], 1                      ; 2CF0 _ 83. 6D, F0, 01
?_128:  mov     eax, dword [ebp-10H]                    ; 2CF4 _ 8B. 45, F0
        cmp     eax, dword [ebp+10H]                    ; 2CF7 _ 3B. 45, 10
        jge     ?_127                                   ; 2CFA _ 7D, BE
        mov     eax, dword [ebp+8H]                     ; 2CFC _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 2CFF _ 8B. 55, 10
        lea     ecx, [edx+4H]                           ; 2D02 _ 8D. 4A, 04
        mov     edx, dword [ebp+0CH]                    ; 2D05 _ 8B. 55, 0C
        mov     dword [eax+ecx*4+4H], edx               ; 2D08 _ 89. 54 88, 04
        mov     eax, dword [ebp+8H]                     ; 2D0C _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 2D0F _ 8B. 40, 0C
        lea     edx, [eax+1H]                           ; 2D12 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 2D15 _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 2D18 _ 89. 50, 0C
?_129:  mov     eax, dword [ebp+0CH]                    ; 2D1B _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 2D1E _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 2D21 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 2D24 _ 8B. 40, 08
        lea     esi, [edx+eax]                          ; 2D27 _ 8D. 34 02
        mov     eax, dword [ebp+0CH]                    ; 2D2A _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 2D2D _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 2D30 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 2D33 _ 8B. 40, 04
        lea     ebx, [edx+eax]                          ; 2D36 _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 2D39 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 2D3C _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 2D3F _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 2D42 _ 8B. 40, 0C
        mov     ecx, dword [ebp+10H]                    ; 2D45 _ 8B. 4D, 10
        mov     dword [esp+14H], ecx                    ; 2D48 _ 89. 4C 24, 14
        mov     dword [esp+10H], esi                    ; 2D4C _ 89. 74 24, 10
        mov     dword [esp+0CH], ebx                    ; 2D50 _ 89. 5C 24, 0C
        mov     dword [esp+8H], edx                     ; 2D54 _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 2D58 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2D5C _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2D5F _ 89. 04 24
        call    sheet_refresh_map                       ; 2D62 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+0CH]                    ; 2D67 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 2D6A _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 2D6D _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 2D70 _ 8B. 40, 08
        lea     esi, [edx+eax]                          ; 2D73 _ 8D. 34 02
        mov     eax, dword [ebp+0CH]                    ; 2D76 _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 2D79 _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 2D7C _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 2D7F _ 8B. 40, 04
        lea     ebx, [edx+eax]                          ; 2D82 _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 2D85 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 2D88 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 2D8B _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 2D8E _ 8B. 40, 0C
        mov     ecx, dword [ebp+10H]                    ; 2D91 _ 8B. 4D, 10
        mov     dword [esp+14H], ecx                    ; 2D94 _ 89. 4C 24, 14
        mov     dword [esp+10H], esi                    ; 2D98 _ 89. 74 24, 10
        mov     dword [esp+0CH], ebx                    ; 2D9C _ 89. 5C 24, 0C
        mov     dword [esp+8H], edx                     ; 2DA0 _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 2DA4 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2DA8 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2DAB _ 89. 04 24
        call    sheet_refresh_local                     ; 2DAE _ E8, FFFFFFFC(rel)
?_130:  add     esp, 48                                 ; 2DB3 _ 83. C4, 30
        pop     ebx                                     ; 2DB6 _ 5B
        pop     esi                                     ; 2DB7 _ 5E
        pop     ebp                                     ; 2DB8 _ 5D
        ret                                             ; 2DB9 _ C3
; sheet_updown End of function

sheet_refresh:; Function begin
        push    ebp                                     ; 2DBA _ 55
        mov     ebp, esp                                ; 2DBB _ 89. E5
        push    edi                                     ; 2DBD _ 57
        push    esi                                     ; 2DBE _ 56
        push    ebx                                     ; 2DBF _ 53
        sub     esp, 44                                 ; 2DC0 _ 83. EC, 2C
        mov     eax, dword [ebp+0CH]                    ; 2DC3 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 2DC6 _ 8B. 40, 18
        test    eax, eax                                ; 2DC9 _ 85. C0
        js      ?_131                                   ; 2DCB _ 78, 53
        mov     eax, dword [ebp+0CH]                    ; 2DCD _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 2DD0 _ 8B. 40, 18
        mov     edx, dword [ebp+0CH]                    ; 2DD3 _ 8B. 55, 0C
        mov     ecx, dword [edx+10H]                    ; 2DD6 _ 8B. 4A, 10
        mov     edx, dword [ebp+1CH]                    ; 2DD9 _ 8B. 55, 1C
        lea     esi, [ecx+edx]                          ; 2DDC _ 8D. 34 11
        mov     edx, dword [ebp+0CH]                    ; 2DDF _ 8B. 55, 0C
        mov     ecx, dword [edx+0CH]                    ; 2DE2 _ 8B. 4A, 0C
        mov     edx, dword [ebp+18H]                    ; 2DE5 _ 8B. 55, 18
        lea     ebx, [ecx+edx]                          ; 2DE8 _ 8D. 1C 11
        mov     edx, dword [ebp+0CH]                    ; 2DEB _ 8B. 55, 0C
        mov     ecx, dword [edx+10H]                    ; 2DEE _ 8B. 4A, 10
        mov     edx, dword [ebp+14H]                    ; 2DF1 _ 8B. 55, 14
        add     ecx, edx                                ; 2DF4 _ 01. D1
        mov     edx, dword [ebp+0CH]                    ; 2DF6 _ 8B. 55, 0C
        mov     edi, dword [edx+0CH]                    ; 2DF9 _ 8B. 7A, 0C
        mov     edx, dword [ebp+10H]                    ; 2DFC _ 8B. 55, 10
        add     edx, edi                                ; 2DFF _ 01. FA
        mov     dword [esp+14H], eax                    ; 2E01 _ 89. 44 24, 14
        mov     dword [esp+10H], esi                    ; 2E05 _ 89. 74 24, 10
        mov     dword [esp+0CH], ebx                    ; 2E09 _ 89. 5C 24, 0C
        mov     dword [esp+8H], ecx                     ; 2E0D _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 2E11 _ 89. 54 24, 04
        mov     eax, dword [ebp+8H]                     ; 2E15 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2E18 _ 89. 04 24
        call    sheet_refresh_local                     ; 2E1B _ E8, FFFFFFFC(rel)
?_131:  mov     eax, 0                                  ; 2E20 _ B8, 00000000
        add     esp, 44                                 ; 2E25 _ 83. C4, 2C
        pop     ebx                                     ; 2E28 _ 5B
        pop     esi                                     ; 2E29 _ 5E
        pop     edi                                     ; 2E2A _ 5F
        pop     ebp                                     ; 2E2B _ 5D
        ret                                             ; 2E2C _ C3
; sheet_refresh End of function

sheet_slide:; Function begin
        push    ebp                                     ; 2E2D _ 55
        mov     ebp, esp                                ; 2E2E _ 89. E5
        push    ebx                                     ; 2E30 _ 53
        sub     esp, 52                                 ; 2E31 _ 83. EC, 34
        mov     eax, dword [ebp+0CH]                    ; 2E34 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 2E37 _ 8B. 40, 0C
        mov     dword [ebp-10H], eax                    ; 2E3A _ 89. 45, F0
        mov     eax, dword [ebp+0CH]                    ; 2E3D _ 8B. 45, 0C
        mov     eax, dword [eax+10H]                    ; 2E40 _ 8B. 40, 10
        mov     dword [ebp-0CH], eax                    ; 2E43 _ 89. 45, F4
        mov     eax, dword [ebp+0CH]                    ; 2E46 _ 8B. 45, 0C
        mov     edx, dword [ebp+10H]                    ; 2E49 _ 8B. 55, 10
        mov     dword [eax+0CH], edx                    ; 2E4C _ 89. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 2E4F _ 8B. 45, 0C
        mov     edx, dword [ebp+14H]                    ; 2E52 _ 8B. 55, 14
        mov     dword [eax+10H], edx                    ; 2E55 _ 89. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 2E58 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 2E5B _ 8B. 40, 18
        test    eax, eax                                ; 2E5E _ 85. C0
        js      ?_132                                   ; 2E60 _ 0F 88, 00000100
        mov     eax, dword [ebp+0CH]                    ; 2E66 _ 8B. 45, 0C
        mov     edx, dword [eax+8H]                     ; 2E69 _ 8B. 50, 08
        mov     eax, dword [ebp-0CH]                    ; 2E6C _ 8B. 45, F4
        add     edx, eax                                ; 2E6F _ 01. C2
        mov     eax, dword [ebp+0CH]                    ; 2E71 _ 8B. 45, 0C
        mov     ecx, dword [eax+4H]                     ; 2E74 _ 8B. 48, 04
        mov     eax, dword [ebp-10H]                    ; 2E77 _ 8B. 45, F0
        add     eax, ecx                                ; 2E7A _ 01. C8
        mov     dword [esp+14H], 0                      ; 2E7C _ C7. 44 24, 14, 00000000
        mov     dword [esp+10H], edx                    ; 2E84 _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 2E88 _ 89. 44 24, 0C
        mov     eax, dword [ebp-0CH]                    ; 2E8C _ 8B. 45, F4
        mov     dword [esp+8H], eax                     ; 2E8F _ 89. 44 24, 08
        mov     eax, dword [ebp-10H]                    ; 2E93 _ 8B. 45, F0
        mov     dword [esp+4H], eax                     ; 2E96 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2E9A _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2E9D _ 89. 04 24
        call    sheet_refresh_map                       ; 2EA0 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+0CH]                    ; 2EA5 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 2EA8 _ 8B. 40, 18
        mov     edx, dword [ebp+0CH]                    ; 2EAB _ 8B. 55, 0C
        mov     ecx, dword [edx+8H]                     ; 2EAE _ 8B. 4A, 08
        mov     edx, dword [ebp+14H]                    ; 2EB1 _ 8B. 55, 14
        add     ecx, edx                                ; 2EB4 _ 01. D1
        mov     edx, dword [ebp+0CH]                    ; 2EB6 _ 8B. 55, 0C
        mov     ebx, dword [edx+4H]                     ; 2EB9 _ 8B. 5A, 04
        mov     edx, dword [ebp+10H]                    ; 2EBC _ 8B. 55, 10
        add     edx, ebx                                ; 2EBF _ 01. DA
        mov     dword [esp+14H], eax                    ; 2EC1 _ 89. 44 24, 14
        mov     dword [esp+10H], ecx                    ; 2EC5 _ 89. 4C 24, 10
        mov     dword [esp+0CH], edx                    ; 2EC9 _ 89. 54 24, 0C
        mov     eax, dword [ebp+14H]                    ; 2ECD _ 8B. 45, 14
        mov     dword [esp+8H], eax                     ; 2ED0 _ 89. 44 24, 08
        mov     eax, dword [ebp+10H]                    ; 2ED4 _ 8B. 45, 10
        mov     dword [esp+4H], eax                     ; 2ED7 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2EDB _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2EDE _ 89. 04 24
        call    sheet_refresh_map                       ; 2EE1 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+0CH]                    ; 2EE6 _ 8B. 45, 0C
        mov     edx, dword [eax+8H]                     ; 2EE9 _ 8B. 50, 08
        mov     eax, dword [ebp-0CH]                    ; 2EEC _ 8B. 45, F4
        add     edx, eax                                ; 2EEF _ 01. C2
        mov     eax, dword [ebp+0CH]                    ; 2EF1 _ 8B. 45, 0C
        mov     ecx, dword [eax+4H]                     ; 2EF4 _ 8B. 48, 04
        mov     eax, dword [ebp-10H]                    ; 2EF7 _ 8B. 45, F0
        add     eax, ecx                                ; 2EFA _ 01. C8
        mov     dword [esp+14H], 0                      ; 2EFC _ C7. 44 24, 14, 00000000
        mov     dword [esp+10H], edx                    ; 2F04 _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 2F08 _ 89. 44 24, 0C
        mov     eax, dword [ebp-0CH]                    ; 2F0C _ 8B. 45, F4
        mov     dword [esp+8H], eax                     ; 2F0F _ 89. 44 24, 08
        mov     eax, dword [ebp-10H]                    ; 2F13 _ 8B. 45, F0
        mov     dword [esp+4H], eax                     ; 2F16 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2F1A _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2F1D _ 89. 04 24
        call    sheet_refresh_local                     ; 2F20 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+0CH]                    ; 2F25 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 2F28 _ 8B. 40, 18
        mov     edx, dword [ebp+0CH]                    ; 2F2B _ 8B. 55, 0C
        mov     ecx, dword [edx+8H]                     ; 2F2E _ 8B. 4A, 08
        mov     edx, dword [ebp+14H]                    ; 2F31 _ 8B. 55, 14
        add     ecx, edx                                ; 2F34 _ 01. D1
        mov     edx, dword [ebp+0CH]                    ; 2F36 _ 8B. 55, 0C
        mov     ebx, dword [edx+4H]                     ; 2F39 _ 8B. 5A, 04
        mov     edx, dword [ebp+10H]                    ; 2F3C _ 8B. 55, 10
        add     edx, ebx                                ; 2F3F _ 01. DA
        mov     dword [esp+14H], eax                    ; 2F41 _ 89. 44 24, 14
        mov     dword [esp+10H], ecx                    ; 2F45 _ 89. 4C 24, 10
        mov     dword [esp+0CH], edx                    ; 2F49 _ 89. 54 24, 0C
        mov     eax, dword [ebp+14H]                    ; 2F4D _ 8B. 45, 14
        mov     dword [esp+8H], eax                     ; 2F50 _ 89. 44 24, 08
        mov     eax, dword [ebp+10H]                    ; 2F54 _ 8B. 45, 10
        mov     dword [esp+4H], eax                     ; 2F57 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2F5B _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2F5E _ 89. 04 24
        call    sheet_refresh_local                     ; 2F61 _ E8, FFFFFFFC(rel)
?_132:  add     esp, 52                                 ; 2F66 _ 83. C4, 34
        pop     ebx                                     ; 2F69 _ 5B
        pop     ebp                                     ; 2F6A _ 5D
        ret                                             ; 2F6B _ C3
; sheet_slide End of function

sheet_refresh_local:; Function begin
        push    ebp                                     ; 2F6C _ 55
        mov     ebp, esp                                ; 2F6D _ 89. E5
        sub     esp, 48                                 ; 2F6F _ 83. EC, 30
        mov     eax, dword [ebp+8H]                     ; 2F72 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 2F75 _ 8B. 00
        mov     dword [ebp-18H], eax                    ; 2F77 _ 89. 45, E8
        mov     eax, dword [ebp+8H]                     ; 2F7A _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 2F7D _ 8B. 40, 10
        mov     dword [ebp-14H], eax                    ; 2F80 _ 89. 45, EC
        cmp     dword [ebp+0CH], 0                      ; 2F83 _ 83. 7D, 0C, 00
        jns     ?_133                                   ; 2F87 _ 79, 07
        mov     dword [ebp+0CH], 0                      ; 2F89 _ C7. 45, 0C, 00000000
?_133:  cmp     dword [ebp+10H], 0                      ; 2F90 _ 83. 7D, 10, 00
        jns     ?_134                                   ; 2F94 _ 79, 07
        mov     dword [ebp+10H], 0                      ; 2F96 _ C7. 45, 10, 00000000
?_134:  mov     eax, dword [ebp+8H]                     ; 2F9D _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 2FA0 _ 8B. 40, 04
        cmp     eax, dword [ebp+14H]                    ; 2FA3 _ 3B. 45, 14
        jge     ?_135                                   ; 2FA6 _ 7D, 09
        mov     eax, dword [ebp+8H]                     ; 2FA8 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 2FAB _ 8B. 40, 04
        mov     dword [ebp+14H], eax                    ; 2FAE _ 89. 45, 14
?_135:  mov     eax, dword [ebp+8H]                     ; 2FB1 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 2FB4 _ 8B. 40, 08
        cmp     eax, dword [ebp+18H]                    ; 2FB7 _ 3B. 45, 18
        jge     ?_136                                   ; 2FBA _ 7D, 09
        mov     eax, dword [ebp+8H]                     ; 2FBC _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 2FBF _ 8B. 40, 08
        mov     dword [ebp+18H], eax                    ; 2FC2 _ 89. 45, 18
?_136:  mov     eax, dword [ebp+1CH]                    ; 2FC5 _ 8B. 45, 1C
        mov     dword [ebp-24H], eax                    ; 2FC8 _ 89. 45, DC
        jmp     ?_143                                   ; 2FCB _ E9, 00000119

?_137:  mov     eax, dword [ebp+8H]                     ; 2FD0 _ 8B. 45, 08
        mov     edx, dword [ebp-24H]                    ; 2FD3 _ 8B. 55, DC
        add     edx, 4                                  ; 2FD6 _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 2FD9 _ 8B. 44 90, 04
        mov     dword [ebp-10H], eax                    ; 2FDD _ 89. 45, F0
        mov     eax, dword [ebp-10H]                    ; 2FE0 _ 8B. 45, F0
        mov     eax, dword [eax]                        ; 2FE3 _ 8B. 00
        mov     dword [ebp-0CH], eax                    ; 2FE5 _ 89. 45, F4
        mov     edx, dword [ebp-10H]                    ; 2FE8 _ 8B. 55, F0
        mov     eax, dword [ebp+8H]                     ; 2FEB _ 8B. 45, 08
        add     eax, 1044                               ; 2FEE _ 05, 00000414
        sub     edx, eax                                ; 2FF3 _ 29. C2
        mov     eax, edx                                ; 2FF5 _ 89. D0
        sar     eax, 5                                  ; 2FF7 _ C1. F8, 05
        mov     byte [ebp-26H], al                      ; 2FFA _ 88. 45, DA
        mov     dword [ebp-1CH], 0                      ; 2FFD _ C7. 45, E4, 00000000
        jmp     ?_142                                   ; 3004 _ E9, 000000CD

?_138:  mov     eax, dword [ebp-10H]                    ; 3009 _ 8B. 45, F0
        mov     edx, dword [eax+10H]                    ; 300C _ 8B. 50, 10
        mov     eax, dword [ebp-1CH]                    ; 300F _ 8B. 45, E4
        add     eax, edx                                ; 3012 _ 01. D0
        mov     dword [ebp-8H], eax                     ; 3014 _ 89. 45, F8
        mov     dword [ebp-20H], 0                      ; 3017 _ C7. 45, E0, 00000000
        jmp     ?_141                                   ; 301E _ E9, 000000A0

?_139:  mov     eax, dword [ebp-10H]                    ; 3023 _ 8B. 45, F0
        mov     edx, dword [eax+0CH]                    ; 3026 _ 8B. 50, 0C
        mov     eax, dword [ebp-20H]                    ; 3029 _ 8B. 45, E0
        add     eax, edx                                ; 302C _ 01. D0
        mov     dword [ebp-4H], eax                     ; 302E _ 89. 45, FC
        mov     eax, dword [ebp+0CH]                    ; 3031 _ 8B. 45, 0C
        cmp     eax, dword [ebp-4H]                     ; 3034 _ 3B. 45, FC
        jg      ?_140                                   ; 3037 _ 0F 8F, 00000082
        mov     eax, dword [ebp-4H]                     ; 303D _ 8B. 45, FC
        cmp     eax, dword [ebp+14H]                    ; 3040 _ 3B. 45, 14
        jge     ?_140                                   ; 3043 _ 7D, 7A
        mov     eax, dword [ebp+10H]                    ; 3045 _ 8B. 45, 10
        cmp     eax, dword [ebp-8H]                     ; 3048 _ 3B. 45, F8
        jg      ?_140                                   ; 304B _ 7F, 72
        mov     eax, dword [ebp-8H]                     ; 304D _ 8B. 45, F8
        cmp     eax, dword [ebp+18H]                    ; 3050 _ 3B. 45, 18
        jge     ?_140                                   ; 3053 _ 7D, 6A
        mov     eax, dword [ebp-10H]                    ; 3055 _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 3058 _ 8B. 40, 04
        imul    eax, dword [ebp-1CH]                    ; 305B _ 0F AF. 45, E4
        mov     edx, eax                                ; 305F _ 89. C2
        mov     eax, dword [ebp-20H]                    ; 3061 _ 8B. 45, E0
        add     eax, edx                                ; 3064 _ 01. D0
        mov     edx, eax                                ; 3066 _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 3068 _ 8B. 45, F4
        add     eax, edx                                ; 306B _ 01. D0
        movzx   eax, byte [eax]                         ; 306D _ 0F B6. 00
        mov     byte [ebp-25H], al                      ; 3070 _ 88. 45, DB
        movzx   edx, byte [ebp-25H]                     ; 3073 _ 0F B6. 55, DB
        mov     eax, dword [ebp-10H]                    ; 3077 _ 8B. 45, F0
        mov     eax, dword [eax+14H]                    ; 307A _ 8B. 40, 14
        cmp     edx, eax                                ; 307D _ 39. C2
        jz      ?_140                                   ; 307F _ 74, 3E
        mov     eax, dword [ebp+8H]                     ; 3081 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 3084 _ 8B. 40, 04
        imul    eax, dword [ebp-8H]                     ; 3087 _ 0F AF. 45, F8
        mov     edx, eax                                ; 308B _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 308D _ 8B. 45, FC
        add     eax, edx                                ; 3090 _ 01. D0
        mov     edx, eax                                ; 3092 _ 89. C2
        mov     eax, dword [ebp-14H]                    ; 3094 _ 8B. 45, EC
        add     eax, edx                                ; 3097 _ 01. D0
        movzx   eax, byte [eax]                         ; 3099 _ 0F B6. 00
        cmp     al, byte [ebp-26H]                      ; 309C _ 3A. 45, DA
        jnz     ?_140                                   ; 309F _ 75, 1E
        mov     eax, dword [ebp+8H]                     ; 30A1 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 30A4 _ 8B. 40, 04
        imul    eax, dword [ebp-8H]                     ; 30A7 _ 0F AF. 45, F8
        mov     edx, eax                                ; 30AB _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 30AD _ 8B. 45, FC
        add     eax, edx                                ; 30B0 _ 01. D0
        mov     edx, eax                                ; 30B2 _ 89. C2
        mov     eax, dword [ebp-18H]                    ; 30B4 _ 8B. 45, E8
        add     edx, eax                                ; 30B7 _ 01. C2
        movzx   eax, byte [ebp-25H]                     ; 30B9 _ 0F B6. 45, DB
        mov     byte [edx], al                          ; 30BD _ 88. 02
?_140:  add     dword [ebp-20H], 1                      ; 30BF _ 83. 45, E0, 01
?_141:  mov     eax, dword [ebp-10H]                    ; 30C3 _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 30C6 _ 8B. 40, 04
        cmp     eax, dword [ebp-20H]                    ; 30C9 _ 3B. 45, E0
        jg      ?_139                                   ; 30CC _ 0F 8F, FFFFFF51
        add     dword [ebp-1CH], 1                      ; 30D2 _ 83. 45, E4, 01
?_142:  mov     eax, dword [ebp-10H]                    ; 30D6 _ 8B. 45, F0
        mov     eax, dword [eax+8H]                     ; 30D9 _ 8B. 40, 08
        cmp     eax, dword [ebp-1CH]                    ; 30DC _ 3B. 45, E4
        jg      ?_138                                   ; 30DF _ 0F 8F, FFFFFF24
        add     dword [ebp-24H], 1                      ; 30E5 _ 83. 45, DC, 01
?_143:  mov     eax, dword [ebp+8H]                     ; 30E9 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 30EC _ 8B. 40, 0C
        cmp     eax, dword [ebp-24H]                    ; 30EF _ 3B. 45, DC
        jge     ?_137                                   ; 30F2 _ 0F 8D, FFFFFED8
        leave                                           ; 30F8 _ C9
        ret                                             ; 30F9 _ C3
; sheet_refresh_local End of function

sheet_refresh_map:; Function begin
        push    ebp                                     ; 30FA _ 55
        mov     ebp, esp                                ; 30FB _ 89. E5
        sub     esp, 64                                 ; 30FD _ 83. EC, 40
        mov     eax, dword [ebp+8H]                     ; 3100 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 3103 _ 8B. 00
        mov     dword [ebp-18H], eax                    ; 3105 _ 89. 45, E8
        mov     eax, dword [ebp+8H]                     ; 3108 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 310B _ 8B. 40, 10
        mov     dword [ebp-14H], eax                    ; 310E _ 89. 45, EC
        cmp     dword [ebp+0CH], 0                      ; 3111 _ 83. 7D, 0C, 00
        jns     ?_144                                   ; 3115 _ 79, 07
        mov     dword [ebp+0CH], 0                      ; 3117 _ C7. 45, 0C, 00000000
?_144:  cmp     dword [ebp+10H], 0                      ; 311E _ 83. 7D, 10, 00
        jns     ?_145                                   ; 3122 _ 79, 07
        mov     dword [ebp+10H], 0                      ; 3124 _ C7. 45, 10, 00000000
?_145:  mov     eax, dword [ebp+8H]                     ; 312B _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 312E _ 8B. 40, 04
        cmp     eax, dword [ebp+14H]                    ; 3131 _ 3B. 45, 14
        jge     ?_146                                   ; 3134 _ 7D, 09
        mov     eax, dword [ebp+8H]                     ; 3136 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 3139 _ 8B. 40, 04
        mov     dword [ebp+14H], eax                    ; 313C _ 89. 45, 14
?_146:  mov     eax, dword [ebp+8H]                     ; 313F _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 3142 _ 8B. 40, 08
        cmp     eax, dword [ebp+18H]                    ; 3145 _ 3B. 45, 18
        jge     ?_147                                   ; 3148 _ 7D, 09
        mov     eax, dword [ebp+8H]                     ; 314A _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 314D _ 8B. 40, 08
        mov     dword [ebp+18H], eax                    ; 3150 _ 89. 45, 18
?_147:  mov     eax, dword [ebp+1CH]                    ; 3153 _ 8B. 45, 1C
        mov     dword [ebp-34H], eax                    ; 3156 _ 89. 45, CC
        jmp     ?_158                                   ; 3159 _ E9, 00000141

?_148:  mov     eax, dword [ebp+8H]                     ; 315E _ 8B. 45, 08
        mov     edx, dword [ebp-34H]                    ; 3161 _ 8B. 55, CC
        add     edx, 4                                  ; 3164 _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 3167 _ 8B. 44 90, 04
        mov     dword [ebp-10H], eax                    ; 316B _ 89. 45, F0
        mov     edx, dword [ebp-10H]                    ; 316E _ 8B. 55, F0
        mov     eax, dword [ebp+8H]                     ; 3171 _ 8B. 45, 08
        add     eax, 1044                               ; 3174 _ 05, 00000414
        sub     edx, eax                                ; 3179 _ 29. C2
        mov     eax, edx                                ; 317B _ 89. D0
        sar     eax, 5                                  ; 317D _ C1. F8, 05
        mov     byte [ebp-35H], al                      ; 3180 _ 88. 45, CB
        mov     eax, dword [ebp-10H]                    ; 3183 _ 8B. 45, F0
        mov     eax, dword [eax]                        ; 3186 _ 8B. 00
        mov     dword [ebp-0CH], eax                    ; 3188 _ 89. 45, F4
        mov     eax, dword [ebp-10H]                    ; 318B _ 8B. 45, F0
        mov     eax, dword [eax+0CH]                    ; 318E _ 8B. 40, 0C
        mov     edx, dword [ebp+0CH]                    ; 3191 _ 8B. 55, 0C
        sub     edx, eax                                ; 3194 _ 29. C2
        mov     eax, edx                                ; 3196 _ 89. D0
        mov     dword [ebp-30H], eax                    ; 3198 _ 89. 45, D0
        mov     eax, dword [ebp-10H]                    ; 319B _ 8B. 45, F0
        mov     eax, dword [eax+10H]                    ; 319E _ 8B. 40, 10
        mov     edx, dword [ebp+10H]                    ; 31A1 _ 8B. 55, 10
        sub     edx, eax                                ; 31A4 _ 29. C2
        mov     eax, edx                                ; 31A6 _ 89. D0
        mov     dword [ebp-2CH], eax                    ; 31A8 _ 89. 45, D4
        mov     eax, dword [ebp-10H]                    ; 31AB _ 8B. 45, F0
        mov     eax, dword [eax+0CH]                    ; 31AE _ 8B. 40, 0C
        mov     edx, dword [ebp+14H]                    ; 31B1 _ 8B. 55, 14
        sub     edx, eax                                ; 31B4 _ 29. C2
        mov     eax, edx                                ; 31B6 _ 89. D0
        mov     dword [ebp-28H], eax                    ; 31B8 _ 89. 45, D8
        mov     eax, dword [ebp-10H]                    ; 31BB _ 8B. 45, F0
        mov     eax, dword [eax+10H]                    ; 31BE _ 8B. 40, 10
        mov     edx, dword [ebp+18H]                    ; 31C1 _ 8B. 55, 18
        sub     edx, eax                                ; 31C4 _ 29. C2
        mov     eax, edx                                ; 31C6 _ 89. D0
        mov     dword [ebp-24H], eax                    ; 31C8 _ 89. 45, DC
        cmp     dword [ebp-30H], 0                      ; 31CB _ 83. 7D, D0, 00
        jns     ?_149                                   ; 31CF _ 79, 07
        mov     dword [ebp-30H], 0                      ; 31D1 _ C7. 45, D0, 00000000
?_149:  cmp     dword [ebp-2CH], 0                      ; 31D8 _ 83. 7D, D4, 00
        jns     ?_150                                   ; 31DC _ 79, 07
        mov     dword [ebp-2CH], 0                      ; 31DE _ C7. 45, D4, 00000000
?_150:  mov     eax, dword [ebp-10H]                    ; 31E5 _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 31E8 _ 8B. 40, 04
        cmp     eax, dword [ebp-28H]                    ; 31EB _ 3B. 45, D8
        jge     ?_151                                   ; 31EE _ 7D, 09
        mov     eax, dword [ebp-10H]                    ; 31F0 _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 31F3 _ 8B. 40, 04
        mov     dword [ebp-28H], eax                    ; 31F6 _ 89. 45, D8
?_151:  mov     eax, dword [ebp-10H]                    ; 31F9 _ 8B. 45, F0
        mov     eax, dword [eax+8H]                     ; 31FC _ 8B. 40, 08
        cmp     eax, dword [ebp-24H]                    ; 31FF _ 3B. 45, DC
        jge     ?_152                                   ; 3202 _ 7D, 09
        mov     eax, dword [ebp-10H]                    ; 3204 _ 8B. 45, F0
        mov     eax, dword [eax+8H]                     ; 3207 _ 8B. 40, 08
        mov     dword [ebp-24H], eax                    ; 320A _ 89. 45, DC
?_152:  mov     eax, dword [ebp-2CH]                    ; 320D _ 8B. 45, D4
        mov     dword [ebp-1CH], eax                    ; 3210 _ 89. 45, E4
        jmp     ?_157                                   ; 3213 _ EB, 7A

?_153:  mov     eax, dword [ebp-10H]                    ; 3215 _ 8B. 45, F0
        mov     edx, dword [eax+10H]                    ; 3218 _ 8B. 50, 10
        mov     eax, dword [ebp-1CH]                    ; 321B _ 8B. 45, E4
        add     eax, edx                                ; 321E _ 01. D0
        mov     dword [ebp-8H], eax                     ; 3220 _ 89. 45, F8
        mov     eax, dword [ebp-30H]                    ; 3223 _ 8B. 45, D0
        mov     dword [ebp-20H], eax                    ; 3226 _ 89. 45, E0
        jmp     ?_156                                   ; 3229 _ EB, 58

?_154:  mov     eax, dword [ebp-10H]                    ; 322B _ 8B. 45, F0
        mov     edx, dword [eax+0CH]                    ; 322E _ 8B. 50, 0C
        mov     eax, dword [ebp-20H]                    ; 3231 _ 8B. 45, E0
        add     eax, edx                                ; 3234 _ 01. D0
        mov     dword [ebp-4H], eax                     ; 3236 _ 89. 45, FC
        mov     eax, dword [ebp-10H]                    ; 3239 _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 323C _ 8B. 40, 04
        imul    eax, dword [ebp-1CH]                    ; 323F _ 0F AF. 45, E4
        mov     edx, eax                                ; 3243 _ 89. C2
        mov     eax, dword [ebp-20H]                    ; 3245 _ 8B. 45, E0
        add     eax, edx                                ; 3248 _ 01. D0
        mov     edx, eax                                ; 324A _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 324C _ 8B. 45, F4
        add     eax, edx                                ; 324F _ 01. D0
        movzx   eax, byte [eax]                         ; 3251 _ 0F B6. 00
        movzx   edx, al                                 ; 3254 _ 0F B6. D0
        mov     eax, dword [ebp-10H]                    ; 3257 _ 8B. 45, F0
        mov     eax, dword [eax+14H]                    ; 325A _ 8B. 40, 14
        cmp     edx, eax                                ; 325D _ 39. C2
        jz      ?_155                                   ; 325F _ 74, 1E
        mov     eax, dword [ebp+8H]                     ; 3261 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 3264 _ 8B. 40, 04
        imul    eax, dword [ebp-8H]                     ; 3267 _ 0F AF. 45, F8
        mov     edx, eax                                ; 326B _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 326D _ 8B. 45, FC
        add     eax, edx                                ; 3270 _ 01. D0
        mov     edx, eax                                ; 3272 _ 89. C2
        mov     eax, dword [ebp-14H]                    ; 3274 _ 8B. 45, EC
        add     edx, eax                                ; 3277 _ 01. C2
        movzx   eax, byte [ebp-35H]                     ; 3279 _ 0F B6. 45, CB
        mov     byte [edx], al                          ; 327D _ 88. 02
?_155:  add     dword [ebp-20H], 1                      ; 327F _ 83. 45, E0, 01
?_156:  mov     eax, dword [ebp-20H]                    ; 3283 _ 8B. 45, E0
        cmp     eax, dword [ebp-28H]                    ; 3286 _ 3B. 45, D8
        jl      ?_154                                   ; 3289 _ 7C, A0
        add     dword [ebp-1CH], 1                      ; 328B _ 83. 45, E4, 01
?_157:  mov     eax, dword [ebp-1CH]                    ; 328F _ 8B. 45, E4
        cmp     eax, dword [ebp-24H]                    ; 3292 _ 3B. 45, DC
        jl      ?_153                                   ; 3295 _ 0F 8C, FFFFFF7A
        add     dword [ebp-34H], 1                      ; 329B _ 83. 45, CC, 01
?_158:  mov     eax, dword [ebp+8H]                     ; 329F _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 32A2 _ 8B. 40, 0C
        cmp     eax, dword [ebp-34H]                    ; 32A5 _ 3B. 45, CC
        jge     ?_148                                   ; 32A8 _ 0F 8D, FFFFFEB0
        leave                                           ; 32AE _ C9
        ret                                             ; 32AF _ C3
; sheet_refresh_map End of function

init_time_port:; Function begin
        push    ebp                                     ; 32B0 _ 55
        mov     ebp, esp                                ; 32B1 _ 89. E5
        sub     esp, 40                                 ; 32B3 _ 83. EC, 28
        mov     dword [esp+4H], 52                      ; 32B6 _ C7. 44 24, 04, 00000034
        mov     dword [esp], 67                         ; 32BE _ C7. 04 24, 00000043
        call    io_out8                                 ; 32C5 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 156                     ; 32CA _ C7. 44 24, 04, 0000009C
        mov     dword [esp], 64                         ; 32D2 _ C7. 04 24, 00000040
        call    io_out8                                 ; 32D9 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 46                      ; 32DE _ C7. 44 24, 04, 0000002E
        mov     dword [esp], 64                         ; 32E6 _ C7. 04 24, 00000040
        call    io_out8                                 ; 32ED _ E8, FFFFFFFC(rel)
        mov     dword [timer_control], 0                ; 32F2 _ C7. 05, 000003C0(d), 00000000
        mov     dword [ebp-0CH], 0                      ; 32FC _ C7. 45, F4, 00000000
        jmp     ?_160                                   ; 3303 _ EB, 28

?_159:  mov     eax, dword [ebp-0CH]                    ; 3305 _ 8B. 45, F4
        shl     eax, 4                                  ; 3308 _ C1. E0, 04
        add     eax, timer_control                      ; 330B _ 05, 000003C0(d)
        mov     dword [eax+8H], 0                       ; 3310 _ C7. 40, 08, 00000000
        mov     eax, dword [ebp-0CH]                    ; 3317 _ 8B. 45, F4
        shl     eax, 4                                  ; 331A _ C1. E0, 04
        add     eax, timer_control                      ; 331D _ 05, 000003C0(d)
        mov     dword [eax+0CH], 0                      ; 3322 _ C7. 40, 0C, 00000000
        add     dword [ebp-0CH], 1                      ; 3329 _ 83. 45, F4, 01
?_160:  cmp     dword [ebp-0CH], 499                    ; 332D _ 81. 7D, F4, 000001F3
        jle     ?_159                                   ; 3334 _ 7E, CF
        leave                                           ; 3336 _ C9
        ret                                             ; 3337 _ C3
; init_time_port End of function

get_timer_control:; Function begin
        push    ebp                                     ; 3338 _ 55
        mov     ebp, esp                                ; 3339 _ 89. E5
        mov     eax, timer_control                      ; 333B _ B8, 000003C0(d)
        pop     ebp                                     ; 3340 _ 5D
        ret                                             ; 3341 _ C3
; get_timer_control End of function

timer_alloc:; Function begin
        push    ebp                                     ; 3342 _ 55
        mov     ebp, esp                                ; 3343 _ 89. E5
        sub     esp, 16                                 ; 3345 _ 83. EC, 10
        mov     dword [ebp-4H], 0                       ; 3348 _ C7. 45, FC, 00000000
        jmp     ?_163                                   ; 334F _ EB, 26

?_161:  mov     eax, dword [ebp-4H]                     ; 3351 _ 8B. 45, FC
        shl     eax, 4                                  ; 3354 _ C1. E0, 04
        add     eax, timer_control                      ; 3357 _ 05, 000003C0(d)
        mov     eax, dword [eax+8H]                     ; 335C _ 8B. 40, 08
        test    eax, eax                                ; 335F _ 85. C0
        jnz     ?_162                                   ; 3361 _ 75, 10
        mov     eax, dword [ebp-4H]                     ; 3363 _ 8B. 45, FC
        shl     eax, 4                                  ; 3366 _ C1. E0, 04
        add     eax, timer_control                      ; 3369 _ 05, 000003C0(d)
        add     eax, 4                                  ; 336E _ 83. C0, 04
        jmp     ?_164                                   ; 3371 _ EB, 0D

?_162:  add     dword [ebp-4H], 1                       ; 3373 _ 83. 45, FC, 01
?_163:  cmp     dword [ebp-4H], 499                     ; 3377 _ 81. 7D, FC, 000001F3
        jle     ?_161                                   ; 337E _ 7E, D1
?_164:  leave                                           ; 3380 _ C9
        ret                                             ; 3381 _ C3
; timer_alloc End of function

timer_free:; Function begin
        push    ebp                                     ; 3382 _ 55
        mov     ebp, esp                                ; 3383 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 3385 _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 3388 _ C7. 40, 04, 00000000
        pop     ebp                                     ; 338F _ 5D
        ret                                             ; 3390 _ C3
; timer_free End of function

timer_init:; Function begin
        push    ebp                                     ; 3391 _ 55
        mov     ebp, esp                                ; 3392 _ 89. E5
        sub     esp, 4                                  ; 3394 _ 83. EC, 04
        mov     eax, dword [ebp+10H]                    ; 3397 _ 8B. 45, 10
        mov     byte [ebp-4H], al                       ; 339A _ 88. 45, FC
        mov     eax, dword [ebp+8H]                     ; 339D _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 33A0 _ 8B. 55, 0C
        mov     dword [eax+8H], edx                     ; 33A3 _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 33A6 _ 8B. 45, 08
        movzx   edx, byte [ebp-4H]                      ; 33A9 _ 0F B6. 55, FC
        mov     byte [eax+0CH], dl                      ; 33AD _ 88. 50, 0C
        leave                                           ; 33B0 _ C9
        ret                                             ; 33B1 _ C3
; timer_init End of function

timer_settime:; Function begin
        push    ebp                                     ; 33B2 _ 55
        mov     ebp, esp                                ; 33B3 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 33B5 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 33B8 _ 8B. 55, 0C
        mov     dword [eax], edx                        ; 33BB _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 33BD _ 8B. 45, 08
        mov     dword [eax+4H], 2                       ; 33C0 _ C7. 40, 04, 00000002
        pop     ebp                                     ; 33C7 _ 5D
        ret                                             ; 33C8 _ C3
; timer_settime End of function

intHandlerTimer:; Function begin
        push    ebp                                     ; 33C9 _ 55
        mov     ebp, esp                                ; 33CA _ 89. E5
        sub     esp, 40                                 ; 33CC _ 83. EC, 28
        mov     dword [esp+4H], 96                      ; 33CF _ C7. 44 24, 04, 00000060
        mov     dword [esp], 32                         ; 33D7 _ C7. 04 24, 00000020
        call    io_out8                                 ; 33DE _ E8, FFFFFFFC(rel)
        mov     eax, dword [timer_control]              ; 33E3 _ A1, 000003C0(d)
        add     eax, 1                                  ; 33E8 _ 83. C0, 01
        mov     dword [timer_control], eax              ; 33EB _ A3, 000003C0(d)
        mov     byte [ebp-0DH], 0                       ; 33F0 _ C6. 45, F3, 00
        mov     dword [ebp-0CH], 0                      ; 33F4 _ C7. 45, F4, 00000000
        jmp     ?_168                                   ; 33FB _ E9, 000000B0

?_165:  mov     eax, dword [ebp-0CH]                    ; 3400 _ 8B. 45, F4
        shl     eax, 4                                  ; 3403 _ C1. E0, 04
        add     eax, timer_control                      ; 3406 _ 05, 000003C0(d)
        mov     eax, dword [eax+8H]                     ; 340B _ 8B. 40, 08
        cmp     eax, 2                                  ; 340E _ 83. F8, 02
        jne     ?_166                                   ; 3411 _ 0F 85, 0000008A
        mov     eax, dword [ebp-0CH]                    ; 3417 _ 8B. 45, F4
        shl     eax, 4                                  ; 341A _ C1. E0, 04
        add     eax, timer_control                      ; 341D _ 05, 000003C0(d)
        mov     eax, dword [eax+4H]                     ; 3422 _ 8B. 40, 04
        lea     edx, [eax-1H]                           ; 3425 _ 8D. 50, FF
        mov     eax, dword [ebp-0CH]                    ; 3428 _ 8B. 45, F4
        shl     eax, 4                                  ; 342B _ C1. E0, 04
        add     eax, timer_control                      ; 342E _ 05, 000003C0(d)
        mov     dword [eax+4H], edx                     ; 3433 _ 89. 50, 04
        mov     eax, dword [ebp-0CH]                    ; 3436 _ 8B. 45, F4
        shl     eax, 4                                  ; 3439 _ C1. E0, 04
        add     eax, timer_control                      ; 343C _ 05, 000003C0(d)
        mov     eax, dword [eax+4H]                     ; 3441 _ 8B. 40, 04
        test    eax, eax                                ; 3444 _ 85. C0
        jnz     ?_166                                   ; 3446 _ 75, 59
        mov     eax, dword [ebp-0CH]                    ; 3448 _ 8B. 45, F4
        shl     eax, 4                                  ; 344B _ C1. E0, 04
        add     eax, timer_control                      ; 344E _ 05, 000003C0(d)
        mov     dword [eax+8H], 1                       ; 3453 _ C7. 40, 08, 00000001
        mov     eax, dword [ebp-0CH]                    ; 345A _ 8B. 45, F4
        shl     eax, 4                                  ; 345D _ C1. E0, 04
        add     eax, timer_control                      ; 3460 _ 05, 000003C0(d)
        movzx   eax, byte [eax+10H]                     ; 3465 _ 0F B6. 40, 10
        movzx   edx, al                                 ; 3469 _ 0F B6. D0
        mov     eax, dword [ebp-0CH]                    ; 346C _ 8B. 45, F4
        shl     eax, 4                                  ; 346F _ C1. E0, 04
        add     eax, timer_control                      ; 3472 _ 05, 000003C0(d)
        mov     eax, dword [eax+0CH]                    ; 3477 _ 8B. 40, 0C
        mov     dword [esp+4H], edx                     ; 347A _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 347E _ 89. 04 24
        call    fifo8_put                               ; 3481 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 3486 _ 8B. 45, F4
        shl     eax, 4                                  ; 3489 _ C1. E0, 04
        add     eax, timer_control                      ; 348C _ 05, 000003C0(d)
        lea     edx, [eax+4H]                           ; 3491 _ 8D. 50, 04
        mov     eax, dword [task_timer]                 ; 3494 _ A1, 00000000(d)
        cmp     edx, eax                                ; 3499 _ 39. C2
        jnz     ?_166                                   ; 349B _ 75, 04
        mov     byte [ebp-0DH], 1                       ; 349D _ C6. 45, F3, 01
?_166:  cmp     byte [ebp-0DH], 0                       ; 34A1 _ 80. 7D, F3, 00
        jz      ?_167                                   ; 34A5 _ 74, 05
        call    task_switch                             ; 34A7 _ E8, FFFFFFFC(rel)
?_167:  add     dword [ebp-0CH], 1                      ; 34AC _ 83. 45, F4, 01
?_168:  cmp     dword [ebp-0CH], 499                    ; 34B0 _ 81. 7D, F4, 000001F3
        jle     ?_165                                   ; 34B7 _ 0F 8E, FFFFFF43
        leave                                           ; 34BD _ C9
        ret                                             ; 34BE _ C3
; intHandlerTimer End of function

segment_descriptor:; Function begin
        push    ebp                                     ; 34BF _ 55
        mov     ebp, esp                                ; 34C0 _ 89. E5
        cmp     dword [ebp+0CH], 1048575                ; 34C2 _ 81. 7D, 0C, 000FFFFF
        jbe     ?_169                                   ; 34C9 _ 76, 10
        or      dword [ebp+14H], 8000H                  ; 34CB _ 81. 4D, 14, 00008000
        mov     eax, dword [ebp+0CH]                    ; 34D2 _ 8B. 45, 0C
        shr     eax, 12                                 ; 34D5 _ C1. E8, 0C
        mov     dword [ebp+0CH], eax                    ; 34D8 _ 89. 45, 0C
?_169:  mov     eax, dword [ebp+0CH]                    ; 34DB _ 8B. 45, 0C
        mov     edx, eax                                ; 34DE _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 34E0 _ 8B. 45, 08
        mov     word [eax], dx                          ; 34E3 _ 66: 89. 10
        mov     eax, dword [ebp+10H]                    ; 34E6 _ 8B. 45, 10
        mov     edx, eax                                ; 34E9 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 34EB _ 8B. 45, 08
        mov     word [eax+2H], dx                       ; 34EE _ 66: 89. 50, 02
        mov     eax, dword [ebp+10H]                    ; 34F2 _ 8B. 45, 10
        sar     eax, 16                                 ; 34F5 _ C1. F8, 10
        mov     edx, eax                                ; 34F8 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 34FA _ 8B. 45, 08
        mov     byte [eax+4H], dl                       ; 34FD _ 88. 50, 04
        mov     eax, dword [ebp+14H]                    ; 3500 _ 8B. 45, 14
        mov     edx, eax                                ; 3503 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 3505 _ 8B. 45, 08
        mov     byte [eax+5H], dl                       ; 3508 _ 88. 50, 05
        mov     eax, dword [ebp+0CH]                    ; 350B _ 8B. 45, 0C
        shr     eax, 16                                 ; 350E _ C1. E8, 10
        and     eax, 0FH                                ; 3511 _ 83. E0, 0F
        mov     edx, eax                                ; 3514 _ 89. C2
        mov     eax, dword [ebp+14H]                    ; 3516 _ 8B. 45, 14
        sar     eax, 8                                  ; 3519 _ C1. F8, 08
        and     eax, 0FFFFFFF0H                         ; 351C _ 83. E0, F0
        or      eax, edx                                ; 351F _ 09. D0
        mov     edx, eax                                ; 3521 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 3523 _ 8B. 45, 08
        mov     byte [eax+6H], dl                       ; 3526 _ 88. 50, 06
        mov     eax, dword [ebp+10H]                    ; 3529 _ 8B. 45, 10
        shr     eax, 24                                 ; 352C _ C1. E8, 18
        mov     edx, eax                                ; 352F _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 3531 _ 8B. 45, 08
        mov     byte [eax+7H], dl                       ; 3534 _ 88. 50, 07
        pop     ebp                                     ; 3537 _ 5D
        ret                                             ; 3538 _ C3
; segment_descriptor End of function

task_init:; Function begin
        push    ebp                                     ; 3539 _ 55
        mov     ebp, esp                                ; 353A _ 89. E5
        sub     esp, 40                                 ; 353C _ 83. EC, 28
        call    get_addr_gdt                            ; 353F _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 3544 _ 89. 45, F0
        mov     dword [esp+4H], 588                     ; 3547 _ C7. 44 24, 04, 0000024C
        mov     eax, dword [ebp+8H]                     ; 354F _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3552 _ 89. 04 24
        call    memman_alloc_4k                         ; 3555 _ E8, FFFFFFFC(rel)
        mov     dword [task_control], eax               ; 355A _ A3, 00002308(d)
        mov     dword [ebp-14H], 0                      ; 355F _ C7. 45, EC, 00000000
        jmp     ?_171                                   ; 3566 _ EB, 7C

?_170:  mov     edx, dword [task_control]               ; 3568 _ 8B. 15, 00002308(d)
        mov     eax, dword [ebp-14H]                    ; 356E _ 8B. 45, EC
        imul    eax, eax, 116                           ; 3571 _ 6B. C0, 74
        add     eax, edx                                ; 3574 _ 01. D0
        add     eax, 32                                 ; 3576 _ 83. C0, 20
        mov     dword [eax], 0                          ; 3579 _ C7. 00, 00000000
        mov     ecx, dword [task_control]               ; 357F _ 8B. 0D, 00002308(d)
        mov     eax, dword [ebp-14H]                    ; 3585 _ 8B. 45, EC
        add     eax, 8                                  ; 3588 _ 83. C0, 08
        lea     edx, [eax*8]                            ; 358B _ 8D. 14 C5, 00000000
        mov     eax, dword [ebp-14H]                    ; 3592 _ 8B. 45, EC
        imul    eax, eax, 116                           ; 3595 _ 6B. C0, 74
        add     eax, ecx                                ; 3598 _ 01. C8
        add     eax, 28                                 ; 359A _ 83. C0, 1C
        mov     dword [eax], edx                        ; 359D _ 89. 10
        mov     eax, dword [task_control]               ; 359F _ A1, 00002308(d)
        mov     edx, dword [ebp-14H]                    ; 35A4 _ 8B. 55, EC
        imul    edx, edx, 116                           ; 35A7 _ 6B. D2, 74
        add     edx, 16                                 ; 35AA _ 83. C2, 10
        add     eax, edx                                ; 35AD _ 01. D0
        add     eax, 24                                 ; 35AF _ 83. C0, 18
        mov     edx, dword [ebp-14H]                    ; 35B2 _ 8B. 55, EC
        add     edx, 8                                  ; 35B5 _ 83. C2, 08
        lea     ecx, [edx*8]                            ; 35B8 _ 8D. 0C D5, 00000000
        mov     edx, dword [ebp-10H]                    ; 35BF _ 8B. 55, F0
        add     edx, ecx                                ; 35C2 _ 01. CA
        mov     dword [esp+0CH], 137                    ; 35C4 _ C7. 44 24, 0C, 00000089
        mov     dword [esp+8H], eax                     ; 35CC _ 89. 44 24, 08
        mov     dword [esp+4H], 103                     ; 35D0 _ C7. 44 24, 04, 00000067
        mov     dword [esp], edx                        ; 35D8 _ 89. 14 24
        call    segment_descriptor                      ; 35DB _ E8, FFFFFFFC(rel)
        add     dword [ebp-14H], 1                      ; 35E0 _ 83. 45, EC, 01
?_171:  cmp     dword [ebp-14H], 4                      ; 35E4 _ 83. 7D, EC, 04
        jle     ?_170                                   ; 35E8 _ 0F 8E, FFFFFF7A
        call    task_alloc                              ; 35EE _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 35F3 _ 89. 45, F4
        mov     eax, dword [ebp-0CH]                    ; 35F6 _ 8B. 45, F4
        mov     dword [eax+4H], 2                       ; 35F9 _ C7. 40, 04, 00000002
        mov     eax, dword [ebp-0CH]                    ; 3600 _ 8B. 45, F4
        mov     dword [eax+8H], 100                     ; 3603 _ C7. 40, 08, 00000064
        mov     eax, dword [task_control]               ; 360A _ A1, 00002308(d)
        mov     dword [eax], 1                          ; 360F _ C7. 00, 00000001
        mov     eax, dword [task_control]               ; 3615 _ A1, 00002308(d)
        mov     dword [eax+4H], 0                       ; 361A _ C7. 40, 04, 00000000
        mov     eax, dword [task_control]               ; 3621 _ A1, 00002308(d)
        mov     edx, dword [ebp-0CH]                    ; 3626 _ 8B. 55, F4
        mov     dword [eax+8H], edx                     ; 3629 _ 89. 50, 08
        mov     eax, dword [ebp-0CH]                    ; 362C _ 8B. 45, F4
        mov     eax, dword [eax]                        ; 362F _ 8B. 00
        mov     dword [esp], eax                        ; 3631 _ 89. 04 24
        call    load_tr                                 ; 3634 _ E8, FFFFFFFC(rel)
        call    timer_alloc                             ; 3639 _ E8, FFFFFFFC(rel)
        mov     dword [task_timer], eax                 ; 363E _ A3, 00002304(d)
        mov     eax, dword [ebp-0CH]                    ; 3643 _ 8B. 45, F4
        mov     eax, dword [eax+8H]                     ; 3646 _ 8B. 40, 08
        mov     edx, eax                                ; 3649 _ 89. C2
        mov     eax, dword [task_timer]                 ; 364B _ A1, 00002304(d)
        mov     dword [esp+4H], edx                     ; 3650 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 3654 _ 89. 04 24
        call    timer_settime                           ; 3657 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 365C _ 8B. 45, F4
        leave                                           ; 365F _ C9
        ret                                             ; 3660 _ C3
; task_init End of function

task_alloc:; Function begin
        push    ebp                                     ; 3661 _ 55
        mov     ebp, esp                                ; 3662 _ 89. E5
        sub     esp, 16                                 ; 3664 _ 83. EC, 10
        mov     dword [ebp-8H], 0                       ; 3667 _ C7. 45, F8, 00000000
        jmp     ?_174                                   ; 366E _ E9, 000000E1

?_172:  mov     edx, dword [task_control]               ; 3673 _ 8B. 15, 00002308(d)
        mov     eax, dword [ebp-8H]                     ; 3679 _ 8B. 45, F8
        imul    eax, eax, 116                           ; 367C _ 6B. C0, 74
        add     eax, edx                                ; 367F _ 01. D0
        add     eax, 32                                 ; 3681 _ 83. C0, 20
        mov     eax, dword [eax]                        ; 3684 _ 8B. 00
        test    eax, eax                                ; 3686 _ 85. C0
        jne     ?_173                                   ; 3688 _ 0F 85, 000000C2
        mov     eax, dword [task_control]               ; 368E _ A1, 00002308(d)
        mov     edx, dword [ebp-8H]                     ; 3693 _ 8B. 55, F8
        imul    edx, edx, 116                           ; 3696 _ 6B. D2, 74
        add     edx, 16                                 ; 3699 _ 83. C2, 10
        add     eax, edx                                ; 369C _ 01. D0
        add     eax, 12                                 ; 369E _ 83. C0, 0C
        mov     dword [ebp-4H], eax                     ; 36A1 _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 36A4 _ 8B. 45, FC
        mov     dword [eax+4H], 1                       ; 36A7 _ C7. 40, 04, 00000001
        mov     eax, dword [ebp-4H]                     ; 36AE _ 8B. 45, FC
        mov     dword [eax+30H], 514                    ; 36B1 _ C7. 40, 30, 00000202
        mov     eax, dword [ebp-4H]                     ; 36B8 _ 8B. 45, FC
        mov     dword [eax+34H], 0                      ; 36BB _ C7. 40, 34, 00000000
        mov     eax, dword [ebp-4H]                     ; 36C2 _ 8B. 45, FC
        mov     dword [eax+38H], 0                      ; 36C5 _ C7. 40, 38, 00000000
        mov     eax, dword [ebp-4H]                     ; 36CC _ 8B. 45, FC
        mov     dword [eax+3CH], 0                      ; 36CF _ C7. 40, 3C, 00000000
        mov     eax, dword [ebp-4H]                     ; 36D6 _ 8B. 45, FC
        mov     dword [eax+40H], 0                      ; 36D9 _ C7. 40, 40, 00000000
        mov     eax, dword [ebp-8H]                     ; 36E0 _ 8B. 45, F8
        add     eax, 1                                  ; 36E3 _ 83. C0, 01
        shl     eax, 9                                  ; 36E6 _ C1. E0, 09
        mov     edx, eax                                ; 36E9 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 36EB _ 8B. 45, FC
        mov     dword [eax+44H], edx                    ; 36EE _ 89. 50, 44
        mov     eax, dword [ebp-4H]                     ; 36F1 _ 8B. 45, FC
        mov     dword [eax+48H], 0                      ; 36F4 _ C7. 40, 48, 00000000
        mov     eax, dword [ebp-4H]                     ; 36FB _ 8B. 45, FC
        mov     dword [eax+4CH], 0                      ; 36FE _ C7. 40, 4C, 00000000
        mov     eax, dword [ebp-4H]                     ; 3705 _ 8B. 45, FC
        mov     dword [eax+50H], 0                      ; 3708 _ C7. 40, 50, 00000000
        mov     eax, dword [ebp-4H]                     ; 370F _ 8B. 45, FC
        mov     dword [eax+54H], 0                      ; 3712 _ C7. 40, 54, 00000000
        mov     eax, dword [ebp-4H]                     ; 3719 _ 8B. 45, FC
        mov     dword [eax+60H], 0                      ; 371C _ C7. 40, 60, 00000000
        mov     eax, dword [ebp-4H]                     ; 3723 _ 8B. 45, FC
        mov     dword [eax+64H], 0                      ; 3726 _ C7. 40, 64, 00000000
        mov     eax, dword [ebp-4H]                     ; 372D _ 8B. 45, FC
        mov     dword [eax+68H], 0                      ; 3730 _ C7. 40, 68, 00000000
        mov     eax, dword [ebp-4H]                     ; 3737 _ 8B. 45, FC
        mov     dword [eax+6CH], 0                      ; 373A _ C7. 40, 6C, 00000000
        mov     eax, dword [ebp-4H]                     ; 3741 _ 8B. 45, FC
        mov     dword [eax+70H], 1073741824             ; 3744 _ C7. 40, 70, 40000000
        mov     eax, dword [ebp-4H]                     ; 374B _ 8B. 45, FC
        jmp     ?_175                                   ; 374E _ EB, 13

?_173:  add     dword [ebp-8H], 1                       ; 3750 _ 83. 45, F8, 01
?_174:  cmp     dword [ebp-8H], 4                       ; 3754 _ 83. 7D, F8, 04
        jle     ?_172                                   ; 3758 _ 0F 8E, FFFFFF15
        mov     eax, 0                                  ; 375E _ B8, 00000000
?_175:  leave                                           ; 3763 _ C9
        ret                                             ; 3764 _ C3
; task_alloc End of function

task_run:; Function begin
        push    ebp                                     ; 3765 _ 55
        mov     ebp, esp                                ; 3766 _ 89. E5
        cmp     dword [ebp+0CH], 0                      ; 3768 _ 83. 7D, 0C, 00
        jle     ?_176                                   ; 376C _ 7E, 09
        mov     eax, dword [ebp+8H]                     ; 376E _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 3771 _ 8B. 55, 0C
        mov     dword [eax+8H], edx                     ; 3774 _ 89. 50, 08
?_176:  mov     eax, dword [ebp+8H]                     ; 3777 _ 8B. 45, 08
        mov     dword [eax+4H], 2                       ; 377A _ C7. 40, 04, 00000002
        mov     eax, dword [task_control]               ; 3781 _ A1, 00002308(d)
        mov     edx, dword [task_control]               ; 3786 _ 8B. 15, 00002308(d)
        mov     edx, dword [edx]                        ; 378C _ 8B. 12
        mov     ecx, dword [ebp+8H]                     ; 378E _ 8B. 4D, 08
        mov     dword [eax+edx*4+8H], ecx               ; 3791 _ 89. 4C 90, 08
        mov     eax, dword [task_control]               ; 3795 _ A1, 00002308(d)
        mov     edx, dword [eax]                        ; 379A _ 8B. 10
        add     edx, 1                                  ; 379C _ 83. C2, 01
        mov     dword [eax], edx                        ; 379F _ 89. 10
        pop     ebp                                     ; 37A1 _ 5D
        ret                                             ; 37A2 _ C3
; task_run End of function

task_switch:; Function begin
        push    ebp                                     ; 37A3 _ 55
        mov     ebp, esp                                ; 37A4 _ 89. E5
        sub     esp, 40                                 ; 37A6 _ 83. EC, 28
        mov     eax, dword [task_timer]                 ; 37A9 _ A1, 00002304(d)
        mov     dword [esp+4H], 100                     ; 37AE _ C7. 44 24, 04, 00000064
        mov     dword [esp], eax                        ; 37B6 _ 89. 04 24
        call    timer_settime                           ; 37B9 _ E8, FFFFFFFC(rel)
        mov     eax, dword [task_control]               ; 37BE _ A1, 00002308(d)
        mov     eax, dword [eax]                        ; 37C3 _ 8B. 00
        cmp     eax, 1                                  ; 37C5 _ 83. F8, 01
        jle     ?_178                                   ; 37C8 _ 7E, 7F
        mov     eax, dword [task_control]               ; 37CA _ A1, 00002308(d)
        mov     edx, dword [eax+4H]                     ; 37CF _ 8B. 50, 04
        add     edx, 1                                  ; 37D2 _ 83. C2, 01
        mov     dword [eax+4H], edx                     ; 37D5 _ 89. 50, 04
        mov     eax, dword [task_control]               ; 37D8 _ A1, 00002308(d)
        mov     edx, dword [eax+4H]                     ; 37DD _ 8B. 50, 04
        mov     eax, dword [task_control]               ; 37E0 _ A1, 00002308(d)
        mov     eax, dword [eax]                        ; 37E5 _ 8B. 00
        cmp     edx, eax                                ; 37E7 _ 39. C2
        jnz     ?_177                                   ; 37E9 _ 75, 0C
        mov     eax, dword [task_control]               ; 37EB _ A1, 00002308(d)
        mov     dword [eax+4H], 0                       ; 37F0 _ C7. 40, 04, 00000000
?_177:  mov     eax, dword [task_control]               ; 37F7 _ A1, 00002308(d)
        mov     edx, dword [task_control]               ; 37FC _ 8B. 15, 00002308(d)
        mov     edx, dword [edx+4H]                     ; 3802 _ 8B. 52, 04
        mov     eax, dword [eax+edx*4+8H]               ; 3805 _ 8B. 44 90, 08
        mov     dword [ebp-0CH], eax                    ; 3809 _ 89. 45, F4
        mov     eax, dword [ebp-0CH]                    ; 380C _ 8B. 45, F4
        mov     eax, dword [eax+8H]                     ; 380F _ 8B. 40, 08
        mov     edx, eax                                ; 3812 _ 89. C2
        mov     eax, dword [task_timer]                 ; 3814 _ A1, 00002304(d)
        mov     dword [esp+4H], edx                     ; 3819 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 381D _ 89. 04 24
        call    timer_settime                           ; 3820 _ E8, FFFFFFFC(rel)
        mov     eax, dword [task_control]               ; 3825 _ A1, 00002308(d)
        mov     edx, dword [task_control]               ; 382A _ 8B. 15, 00002308(d)
        mov     edx, dword [edx+4H]                     ; 3830 _ 8B. 52, 04
        mov     eax, dword [eax+edx*4+8H]               ; 3833 _ 8B. 44 90, 08
        mov     eax, dword [eax]                        ; 3837 _ 8B. 00
        mov     dword [esp+4H], eax                     ; 3839 _ 89. 44 24, 04
        mov     dword [esp], 0                          ; 383D _ C7. 04 24, 00000000
        call    farjmp                                  ; 3844 _ E8, FFFFFFFC(rel)
?_178:  leave                                           ; 3849 _ C9
        ret                                             ; 384A _ C3
; task_switch End of function

task_sleep:; Function begin
        push    ebp                                     ; 384B _ 55
        mov     ebp, esp                                ; 384C _ 89. E5
        sub     esp, 40                                 ; 384E _ 83. EC, 28
        mov     byte [ebp-0DH], 0                       ; 3851 _ C6. 45, F3, 00
        mov     eax, dword [ebp+8H]                     ; 3855 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 3858 _ 8B. 40, 04
        cmp     eax, 2                                  ; 385B _ 83. F8, 02
        jne     ?_188                                   ; 385E _ 0F 85, 000000F1
        mov     eax, dword [task_control]               ; 3864 _ A1, 00002308(d)
        mov     edx, dword [task_control]               ; 3869 _ 8B. 15, 00002308(d)
        mov     edx, dword [edx+4H]                     ; 386F _ 8B. 52, 04
        mov     eax, dword [eax+edx*4+8H]               ; 3872 _ 8B. 44 90, 08
        cmp     eax, dword [ebp+8H]                     ; 3876 _ 3B. 45, 08
        jnz     ?_179                                   ; 3879 _ 75, 04
        mov     byte [ebp-0DH], 1                       ; 387B _ C6. 45, F3, 01
?_179:  mov     dword [ebp-0CH], 0                      ; 387F _ C7. 45, F4, 00000000
        jmp     ?_182                                   ; 3886 _ EB, 17

?_180:  mov     eax, dword [task_control]               ; 3888 _ A1, 00002308(d)
        mov     edx, dword [ebp-0CH]                    ; 388D _ 8B. 55, F4
        mov     eax, dword [eax+edx*4+8H]               ; 3890 _ 8B. 44 90, 08
        cmp     eax, dword [ebp+8H]                     ; 3894 _ 3B. 45, 08
        jnz     ?_181                                   ; 3897 _ 75, 02
        jmp     ?_183                                   ; 3899 _ EB, 10

?_181:  add     dword [ebp-0CH], 1                      ; 389B _ 83. 45, F4, 01
?_182:  mov     eax, dword [task_control]               ; 389F _ A1, 00002308(d)
        mov     eax, dword [eax]                        ; 38A4 _ 8B. 00
        cmp     eax, dword [ebp-0CH]                    ; 38A6 _ 3B. 45, F4
        jg      ?_180                                   ; 38A9 _ 7F, DD
?_183:  mov     eax, dword [task_control]               ; 38AB _ A1, 00002308(d)
        mov     edx, dword [eax]                        ; 38B0 _ 8B. 10
        sub     edx, 1                                  ; 38B2 _ 83. EA, 01
        mov     dword [eax], edx                        ; 38B5 _ 89. 10
        mov     eax, dword [task_control]               ; 38B7 _ A1, 00002308(d)
        mov     eax, dword [eax+4H]                     ; 38BC _ 8B. 40, 04
        cmp     eax, dword [ebp-0CH]                    ; 38BF _ 3B. 45, F4
        jle     ?_184                                   ; 38C2 _ 7E, 10
        mov     eax, dword [task_control]               ; 38C4 _ A1, 00002308(d)
        mov     edx, dword [eax+4H]                     ; 38C9 _ 8B. 50, 04
        sub     edx, 1                                  ; 38CC _ 83. EA, 01
        mov     dword [eax+4H], edx                     ; 38CF _ 89. 50, 04
        jmp     ?_186                                   ; 38D2 _ EB, 22

?_184:  jmp     ?_186                                   ; 38D4 _ EB, 20

?_185:  mov     eax, dword [task_control]               ; 38D6 _ A1, 00002308(d)
        mov     edx, dword [task_control]               ; 38DB _ 8B. 15, 00002308(d)
        mov     ecx, dword [ebp-0CH]                    ; 38E1 _ 8B. 4D, F4
        add     ecx, 1                                  ; 38E4 _ 83. C1, 01
        mov     ecx, dword [edx+ecx*4+8H]               ; 38E7 _ 8B. 4C 8A, 08
        mov     edx, dword [ebp-0CH]                    ; 38EB _ 8B. 55, F4
        mov     dword [eax+edx*4+8H], ecx               ; 38EE _ 89. 4C 90, 08
        add     dword [ebp-0CH], 1                      ; 38F2 _ 83. 45, F4, 01
?_186:  mov     eax, dword [task_control]               ; 38F6 _ A1, 00002308(d)
        mov     eax, dword [eax]                        ; 38FB _ 8B. 00
        cmp     eax, dword [ebp-0CH]                    ; 38FD _ 3B. 45, F4
        jg      ?_185                                   ; 3900 _ 7F, D4
        mov     eax, dword [ebp+8H]                     ; 3902 _ 8B. 45, 08
        mov     dword [eax+4H], 1                       ; 3905 _ C7. 40, 04, 00000001
        cmp     byte [ebp-0DH], 0                       ; 390C _ 80. 7D, F3, 00
        jz      ?_187                                   ; 3910 _ 74, 1F
        mov     eax, dword [task_control]               ; 3912 _ A1, 00002308(d)
        mov     edx, dword [eax+4H]                     ; 3917 _ 8B. 50, 04
        mov     eax, dword [task_control]               ; 391A _ A1, 00002308(d)
        mov     eax, dword [eax]                        ; 391F _ 8B. 00
        cmp     edx, eax                                ; 3921 _ 39. C2
        jl      ?_187                                   ; 3923 _ 7C, 0C
        mov     eax, dword [task_control]               ; 3925 _ A1, 00002308(d)
        mov     dword [eax+4H], 0                       ; 392A _ C7. 40, 04, 00000000
?_187:  mov     eax, dword [task_control]               ; 3931 _ A1, 00002308(d)
        mov     edx, dword [task_control]               ; 3936 _ 8B. 15, 00002308(d)
        mov     edx, dword [edx+4H]                     ; 393C _ 8B. 52, 04
        mov     eax, dword [eax+edx*4+8H]               ; 393F _ 8B. 44 90, 08
        mov     eax, dword [eax]                        ; 3943 _ 8B. 00
        mov     dword [esp+4H], eax                     ; 3945 _ 89. 44 24, 04
        mov     dword [esp], 0                          ; 3949 _ C7. 04 24, 00000000
        call    farjmp                                  ; 3950 _ E8, FFFFFFFC(rel)
?_188:  leave                                           ; 3955 _ C9
        ret                                             ; 3956 _ C3
; task_sleep End of function


SECTION .rodata align=1 noexecute                       ; section number 2, const

?_189:                                                  ; byte
        db 77H, 69H, 6EH, 64H, 6FH, 77H, 00H            ; 0000 _ window.

?_190:                                                  ; byte
        db 41H, 00H                                     ; 0007 _ A.

?_191:                                                  ; byte
        db 65H, 6EH, 74H, 65H, 72H, 20H, 74H, 61H       ; 0009 _ enter ta
        db 73H, 6BH, 20H, 62H, 00H                      ; 0011 _ sk b.

?_192:                                                  ; byte
        db 42H, 00H                                     ; 0016 _ B.

?_193:                                                  ; byte
        db 70H, 61H, 67H, 65H, 20H, 69H, 73H, 3AH       ; 0018 _ page is:
        db 20H, 00H                                     ; 0020 _  .

?_194:                                                  ; byte
        db 42H, 61H, 73H, 65H, 41H, 64H, 64H, 72H       ; 0022 _ BaseAddr
        db 4CH, 3AH, 20H, 00H                           ; 002A _ L: .

?_195:                                                  ; byte
        db 42H, 61H, 73H, 65H, 41H, 64H, 64H, 72H       ; 002E _ BaseAddr
        db 48H, 3AH, 20H, 00H                           ; 0036 _ H: .

?_196:                                                  ; byte
        db 6CH, 65H, 6EH, 67H, 74H, 68H, 4CH, 6FH       ; 003A _ lengthLo
        db 77H, 3AH, 20H, 00H                           ; 0042 _ w: .

?_197:                                                  ; byte
        db 6CH, 65H, 6EH, 67H, 74H, 68H, 48H, 69H       ; 0046 _ lengthHi
        db 67H, 68H, 3AH, 20H, 00H                      ; 004E _ gh: .

?_198:                                                  ; byte
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

table_rgb.1686:                                         ; byte
        db 00H, 00H, 00H, 0FFH, 00H, 00H, 44H, 8CH      ; 0080 _ ......D.
        db 0BBH, 0FFH, 0FFH, 00H, 00H, 00H, 0FFH, 0FFH  ; 0088 _ ........
        db 00H, 0FFH, 00H, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH ; 0090 _ ........
        db 0C6H, 0C6H, 0C6H, 84H, 00H, 00H, 00H, 84H    ; 0098 _ ........
        db 00H, 84H, 84H, 00H, 00H, 00H, 84H, 84H       ; 00A0 _ ........
        db 00H, 84H, 00H, 84H, 84H, 84H, 84H, 84H       ; 00A8 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 00B0 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 00B8 _ ........

cursor.1754:                                            ; byte
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

closebtn.1832:                                          ; byte
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

?_199:  db 00H                                          ; 02A2 _ .

?_200:  db 00H, 00H                                     ; 02A3 _ ..


SECTION .bss    align=32 noexecute                      ; section number 4, bss

sheet_control:                                          ; dword
        resd    1                                       ; 0000

back_sheet:                                             ; dword
        resd    1                                       ; 0004

mouse_sheet:                                            ; dword
        resd    1                                       ; 0008

timerinfo1.1715:                                        ; byte
        resb    28                                      ; 000C

timerbuf1.1718:                                         ; qword
        resq    1                                       ; 0028

timerinfo2.1716:                                        ; byte
        resb    28                                      ; 0030

timerbuf2.1719:                                         ; qword
        resq    1                                       ; 004C

timerinfo3.1717:                                        ; byte
        resb    28                                      ; 0054

timerbuf3.1720:                                         ; qword
        resq    1                                       ; 0070

task_a.1728:                                            ; dword
        resd    2                                       ; 0078

tss_b.1727:                                             ; byte
        resb    128                                     ; 0080

tss_a.1726:                                             ; byte
        resb    128                                     ; 0100

screen_info:                                            ; qword
        resb    4                                       ; 0180

?_201:  resw    1                                       ; 0184

?_202:  resw    13                                      ; 0186

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

?_203:  resb    9                                       ; 03A1

?_204:  resb    22                                      ; 03AA

timer_control:                                          ; byte
        resd    2001                                    ; 03C0

task_timer:                                             ; dword
        resd    1                                       ; 2304

task_control:                                           ; dword
        resd    1                                       ; 2308


