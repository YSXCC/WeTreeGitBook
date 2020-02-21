; Disassembly of file: ckernel.o
; Fri Feb 21 16:54:10 2020
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
        mov     dword [esp+8H], timerbuf1.1716          ; 0156 _ C7. 44 24, 08, 00000028(d)
        mov     dword [esp+4H], 8                       ; 015E _ C7. 44 24, 04, 00000008
        mov     dword [esp], timerinfo1.1713            ; 0166 _ C7. 04 24, 0000000C(d)
        call    fifo8_init                              ; 016D _ E8, FFFFFFFC(rel)
        call    timer_alloc                             ; 0172 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-54H], eax                    ; 0177 _ 89. 45, AC
        mov     dword [esp+8H], 1                       ; 017A _ C7. 44 24, 08, 00000001
        mov     dword [esp+4H], timerinfo1.1713         ; 0182 _ C7. 44 24, 04, 0000000C(d)
        mov     eax, dword [ebp-54H]                    ; 018A _ 8B. 45, AC
        mov     dword [esp], eax                        ; 018D _ 89. 04 24
        call    timer_init                              ; 0190 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 100                     ; 0195 _ C7. 44 24, 04, 00000064
        mov     eax, dword [ebp-54H]                    ; 019D _ 8B. 45, AC
        mov     dword [esp], eax                        ; 01A0 _ 89. 04 24
        call    timer_settime                           ; 01A3 _ E8, FFFFFFFC(rel)
        mov     dword [esp+0CH], 0                      ; 01A8 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], timerbuf2.1717          ; 01B0 _ C7. 44 24, 08, 0000004C(d)
        mov     dword [esp+4H], 8                       ; 01B8 _ C7. 44 24, 04, 00000008
        mov     dword [esp], timerinfo2.1714            ; 01C0 _ C7. 04 24, 00000030(d)
        call    fifo8_init                              ; 01C7 _ E8, FFFFFFFC(rel)
        call    timer_alloc                             ; 01CC _ E8, FFFFFFFC(rel)
        mov     dword [ebp-50H], eax                    ; 01D1 _ 89. 45, B0
        mov     dword [esp+8H], 1                       ; 01D4 _ C7. 44 24, 08, 00000001
        mov     dword [esp+4H], timerinfo2.1714         ; 01DC _ C7. 44 24, 04, 00000030(d)
        mov     eax, dword [ebp-50H]                    ; 01E4 _ 8B. 45, B0
        mov     dword [esp], eax                        ; 01E7 _ 89. 04 24
        call    timer_init                              ; 01EA _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 300                     ; 01EF _ C7. 44 24, 04, 0000012C
        mov     eax, dword [ebp-50H]                    ; 01F7 _ 8B. 45, B0
        mov     dword [esp], eax                        ; 01FA _ 89. 04 24
        call    timer_settime                           ; 01FD _ E8, FFFFFFFC(rel)
        mov     dword [esp+0CH], 0                      ; 0202 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], timerbuf3.1718          ; 020A _ C7. 44 24, 08, 00000070(d)
        mov     dword [esp+4H], 8                       ; 0212 _ C7. 44 24, 04, 00000008
        mov     dword [esp], timerinfo3.1715            ; 021A _ C7. 04 24, 00000054(d)
        call    fifo8_init                              ; 0221 _ E8, FFFFFFFC(rel)
        call    timer_alloc                             ; 0226 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-4CH], eax                    ; 022B _ 89. 45, B4
        mov     dword [esp+8H], 1                       ; 022E _ C7. 44 24, 08, 00000001
        mov     dword [esp+4H], timerinfo3.1715         ; 0236 _ C7. 44 24, 04, 00000054(d)
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
        mov     dword [esp+4H], ?_188                   ; 02E7 _ C7. 44 24, 04, 00000000(d)
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
        mov     dword [task_a.1726], eax                ; 035C _ A3, 00000078(d)
        mov     eax, dword [task_a.1726]                ; 0361 _ A1, 00000078(d)
        mov     dword [keyinfo+18H], eax                ; 0366 _ A3, 00000018(d)
        mov     byte [ebp-12H], 116                     ; 036B _ C6. 45, EE, 74
        mov     byte [ebp-11H], 97                      ; 036F _ C6. 45, EF, 61
        mov     byte [ebp-10H], 115                     ; 0373 _ C6. 45, F0, 73
        mov     byte [ebp-0FH], 107                     ; 0377 _ C6. 45, F1, 6B
        mov     byte [ebp-0EH], 0                       ; 037B _ C6. 45, F2, 00
        mov     byte [ebp-0DH], 0                       ; 037F _ C6. 45, F3, 00
        mov     dword [ebp-78H], 0                      ; 0383 _ C7. 45, 88, 00000000
        jmp     ?_002                                   ; 038A _ E9, 00000157

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
        mov     dword [eax+68H], 0                      ; 042B _ C7. 40, 68, 00000000
        mov     eax, dword [ebp-78H]                    ; 0432 _ 8B. 45, 88
        mov     eax, dword [ebp+eax*4-20H]              ; 0435 _ 8B. 44 85, E0
        mov     dword [eax+6CH], 1073741824             ; 0439 _ C7. 40, 6C, 40000000
        mov     eax, dword [ebp-78H]                    ; 0440 _ 8B. 45, 88
        mov     eax, dword [ebp+eax*4-20H]              ; 0443 _ 8B. 44 85, E0
        mov     edx, task_b_main                        ; 0447 _ BA, 00000000(d)
        sub     edx, dword [ebp-48H]                    ; 044C _ 2B. 55, B8
        mov     dword [eax+28H], edx                    ; 044F _ 89. 50, 28
        mov     eax, dword [ebp-78H]                    ; 0452 _ 8B. 45, 88
        mov     eax, dword [ebp+eax*4-20H]              ; 0455 _ 8B. 44 85, E0
        mov     dword [eax+50H], 0                      ; 0459 _ C7. 40, 50, 00000000
        mov     eax, dword [ebp-78H]                    ; 0460 _ 8B. 45, 88
        mov     eax, dword [ebp+eax*4-20H]              ; 0463 _ 8B. 44 85, E0
        mov     dword [eax+54H], 8                      ; 0467 _ C7. 40, 54, 00000008
        mov     eax, dword [ebp-78H]                    ; 046E _ 8B. 45, 88
        mov     eax, dword [ebp+eax*4-20H]              ; 0471 _ 8B. 44 85, E0
        mov     dword [eax+58H], 48                     ; 0475 _ C7. 40, 58, 00000030
        mov     eax, dword [ebp-78H]                    ; 047C _ 8B. 45, 88
        mov     eax, dword [ebp+eax*4-20H]              ; 047F _ 8B. 44 85, E0
        mov     dword [eax+5CH], 32                     ; 0483 _ C7. 40, 5C, 00000020
        mov     eax, dword [ebp-78H]                    ; 048A _ 8B. 45, 88
        mov     eax, dword [ebp+eax*4-20H]              ; 048D _ 8B. 44 85, E0
        mov     dword [eax+60H], 0                      ; 0491 _ C7. 40, 60, 00000000
        mov     eax, dword [ebp-78H]                    ; 0498 _ 8B. 45, 88
        mov     eax, dword [ebp+eax*4-20H]              ; 049B _ 8B. 44 85, E0
        mov     dword [eax+64H], 16                     ; 049F _ C7. 40, 64, 00000010
        mov     eax, dword [ebp-78H]                    ; 04A6 _ 8B. 45, 88
        mov     eax, dword [ebp+eax*4-20H]              ; 04A9 _ 8B. 44 85, E0
        mov     edx, dword [ebp-78H]                    ; 04AD _ 8B. 55, 88
        mov     edx, dword [ebp+edx*4-20H]              ; 04B0 _ 8B. 54 95, E0
        mov     edx, dword [edx+40H]                    ; 04B4 _ 8B. 52, 40
        sub     edx, 8                                  ; 04B7 _ 83. EA, 08
        mov     dword [eax+40H], edx                    ; 04BA _ 89. 50, 40
        mov     eax, dword [ebp-78H]                    ; 04BD _ 8B. 45, 88
        mov     eax, dword [ebp+eax*4-20H]              ; 04C0 _ 8B. 44 85, E0
        mov     eax, dword [eax+40H]                    ; 04C4 _ 8B. 40, 40
        add     eax, 4                                  ; 04C7 _ 83. C0, 04
        mov     edx, dword [ebp-78H]                    ; 04CA _ 8B. 55, 88
        mov     edx, dword [ebp+edx*4-2CH]              ; 04CD _ 8B. 54 95, D4
        mov     dword [eax], edx                        ; 04D1 _ 89. 10
        mov     eax, dword [ebp-78H]                    ; 04D3 _ 8B. 45, 88
        mov     eax, dword [ebp+eax*4-20H]              ; 04D6 _ 8B. 44 85, E0
        mov     dword [esp], eax                        ; 04DA _ 89. 04 24
        call    task_run                                ; 04DD _ E8, FFFFFFFC(rel)
        add     dword [ebp-78H], 1                      ; 04E2 _ 83. 45, 88, 01
?_002:  cmp     dword [ebp-78H], 1                      ; 04E6 _ 83. 7D, 88, 01
        jle     ?_001                                   ; 04EA _ 0F 8E, FFFFFE9F
        mov     edx, dword [ebp-2CH]                    ; 04F0 _ 8B. 55, D4
        mov     eax, dword [sheet_control]              ; 04F3 _ A1, 00000000(d)
        mov     dword [esp+0CH], 28                     ; 04F8 _ C7. 44 24, 0C, 0000001C
        mov     dword [esp+8H], 16                      ; 0500 _ C7. 44 24, 08, 00000010
        mov     dword [esp+4H], edx                     ; 0508 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 050C _ 89. 04 24
        call    sheet_slide                             ; 050F _ E8, FFFFFFFC(rel)
        mov     edx, dword [ebp-2CH]                    ; 0514 _ 8B. 55, D4
        mov     eax, dword [sheet_control]              ; 0517 _ A1, 00000000(d)
        mov     dword [esp+8H], 1                       ; 051C _ C7. 44 24, 08, 00000001
        mov     dword [esp+4H], edx                     ; 0524 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0528 _ 89. 04 24
        call    sheet_updown                            ; 052B _ E8, FFFFFFFC(rel)
        mov     edx, dword [ebp-28H]                    ; 0530 _ 8B. 55, D8
        mov     eax, dword [sheet_control]              ; 0533 _ A1, 00000000(d)
        mov     dword [esp+0CH], 28                     ; 0538 _ C7. 44 24, 0C, 0000001C
        mov     dword [esp+8H], 160                     ; 0540 _ C7. 44 24, 08, 000000A0
        mov     dword [esp+4H], edx                     ; 0548 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 054C _ 89. 04 24
        call    sheet_slide                             ; 054F _ E8, FFFFFFFC(rel)
        mov     edx, dword [ebp-28H]                    ; 0554 _ 8B. 55, D8
        mov     eax, dword [sheet_control]              ; 0557 _ A1, 00000000(d)
        mov     dword [esp+8H], 1                       ; 055C _ C7. 44 24, 08, 00000001
        mov     dword [esp+4H], edx                     ; 0564 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0568 _ 89. 04 24
        call    sheet_updown                            ; 056B _ E8, FFFFFFFC(rel)
        mov     dword [ebp-3CH], 0                      ; 0570 _ C7. 45, C4, 00000000
        mov     dword [ebp-38H], 0                      ; 0577 _ C7. 45, C8, 00000000
        mov     dword [ebp-34H], 0                      ; 057E _ C7. 45, CC, 00000000
        mov     dword [ebp-74H], 8                      ; 0585 _ C7. 45, 8C, 00000008
        mov     dword [ebp-70H], 7                      ; 058C _ C7. 45, 90, 00000007
        mov     dword [ebp-6CH], 0                      ; 0593 _ C7. 45, 94, 00000000
        mov     dword [ebp-68H], 0                      ; 059A _ C7. 45, 98, 00000000
?_003:  call    io_cli                                  ; 05A1 _ E8, FFFFFFFC(rel)
        mov     dword [esp], keyinfo                    ; 05A6 _ C7. 04 24, 00000000(d)
        call    fifo8_status                            ; 05AD _ E8, FFFFFFFC(rel)
        mov     ebx, eax                                ; 05B2 _ 89. C3
        mov     dword [esp], mouseinfo                  ; 05B4 _ C7. 04 24, 00000000(d)
        call    fifo8_status                            ; 05BB _ E8, FFFFFFFC(rel)
        add     ebx, eax                                ; 05C0 _ 01. C3
        mov     dword [esp], timerinfo1.1713            ; 05C2 _ C7. 04 24, 0000000C(d)
        call    fifo8_status                            ; 05C9 _ E8, FFFFFFFC(rel)
        add     ebx, eax                                ; 05CE _ 01. C3
        mov     dword [esp], timerinfo2.1714            ; 05D0 _ C7. 04 24, 00000030(d)
        call    fifo8_status                            ; 05D7 _ E8, FFFFFFFC(rel)
        add     ebx, eax                                ; 05DC _ 01. C3
        mov     dword [esp], timerinfo3.1715            ; 05DE _ C7. 04 24, 00000054(d)
        call    fifo8_status                            ; 05E5 _ E8, FFFFFFFC(rel)
        add     eax, ebx                                ; 05EA _ 01. D8
        test    eax, eax                                ; 05EC _ 85. C0
        jnz     ?_004                                   ; 05EE _ 75, 0A
        call    io_sti                                  ; 05F0 _ E8, FFFFFFFC(rel)
        jmp     ?_012                                   ; 05F5 _ E9, 000003B9

?_004:  mov     dword [esp], keyinfo                    ; 05FA _ C7. 04 24, 00000000(d)
        call    fifo8_status                            ; 0601 _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 0606 _ 85. C0
        je      ?_006                                   ; 0608 _ 0F 84, 0000019D
        call    io_sti                                  ; 060E _ E8, FFFFFFFC(rel)
        mov     dword [esp], keyinfo                    ; 0613 _ C7. 04 24, 00000000(d)
        call    fifo8_get                               ; 061A _ E8, FFFFFFFC(rel)
        mov     dword [ebp-3CH], eax                    ; 061F _ 89. 45, C4
        cmp     dword [ebp-3CH], 128                    ; 0622 _ 81. 7D, C4, 00000080
        jle     ?_005                                   ; 0629 _ 7E, 05
        jmp     ?_012                                   ; 062B _ E9, 00000383

?_005:  cmp     dword [ebp-3CH], 28                     ; 0630 _ 83. 7D, C4, 1C
        je      ?_012                                   ; 0634 _ 0F 84, 00000379
        mov     eax, dword [ebp-3CH]                    ; 063A _ 8B. 45, C4
        add     eax, keytable                           ; 063D _ 05, 00000000(d)
        movzx   eax, byte [eax]                         ; 0642 _ 0F B6. 00
        test    al, al                                  ; 0645 _ 84. C0
        je      ?_012                                   ; 0647 _ 0F 84, 00000366
        cmp     dword [ebp-74H], 143                    ; 064D _ 81. 7D, 8C, 0000008F
        jg      ?_012                                   ; 0654 _ 0F 8F, 00000359
        mov     eax, dword [ebp-74H]                    ; 065A _ 8B. 45, 8C
        lea     ecx, [eax+7H]                           ; 065D _ 8D. 48, 07
        mov     eax, dword [sheet_win]                  ; 0660 _ A1, 00000000(d)
        mov     edx, dword [eax+4H]                     ; 0665 _ 8B. 50, 04
        mov     eax, dword [sheet_win]                  ; 0668 _ A1, 00000000(d)
        mov     eax, dword [eax]                        ; 066D _ 8B. 00
        mov     dword [esp+18H], 43                     ; 066F _ C7. 44 24, 18, 0000002B
        mov     dword [esp+14H], ecx                    ; 0677 _ 89. 4C 24, 14
        mov     dword [esp+10H], 28                     ; 067B _ C7. 44 24, 10, 0000001C
        mov     ecx, dword [ebp-74H]                    ; 0683 _ 8B. 4D, 8C
        mov     dword [esp+0CH], ecx                    ; 0686 _ 89. 4C 24, 0C
        mov     dword [esp+8H], 7                       ; 068A _ C7. 44 24, 08, 00000007
        mov     dword [esp+4H], edx                     ; 0692 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0696 _ 89. 04 24
        call    paint_rectangle                         ; 0699 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-74H]                    ; 069E _ 8B. 45, 8C
        lea     ecx, [eax+8H]                           ; 06A1 _ 8D. 48, 08
        mov     edx, dword [sheet_win]                  ; 06A4 _ 8B. 15, 00000000(d)
        mov     eax, dword [sheet_control]              ; 06AA _ A1, 00000000(d)
        mov     dword [esp+14H], 44                     ; 06AF _ C7. 44 24, 14, 0000002C
        mov     dword [esp+10H], ecx                    ; 06B7 _ 89. 4C 24, 10
        mov     dword [esp+0CH], 28                     ; 06BB _ C7. 44 24, 0C, 0000001C
        mov     ecx, dword [ebp-74H]                    ; 06C3 _ 8B. 4D, 8C
        mov     dword [esp+8H], ecx                     ; 06C6 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 06CA _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 06CE _ 89. 04 24
        call    sheet_refresh                           ; 06D1 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-3CH]                    ; 06D6 _ 8B. 45, C4
        add     eax, keytable                           ; 06D9 _ 05, 00000000(d)
        movzx   eax, byte [eax]                         ; 06DE _ 0F B6. 00
        mov     byte [ebp-7AH], al                      ; 06E1 _ 88. 45, 86
        mov     byte [ebp-79H], 0                       ; 06E4 _ C6. 45, 87, 00
        mov     edx, dword [sheet_win]                  ; 06E8 _ 8B. 15, 00000000(d)
        mov     eax, dword [sheet_control]              ; 06EE _ A1, 00000000(d)
        mov     dword [esp+14H], 0                      ; 06F3 _ C7. 44 24, 14, 00000000
        lea     ecx, [ebp-7AH]                          ; 06FB _ 8D. 4D, 86
        mov     dword [esp+10H], ecx                    ; 06FE _ 89. 4C 24, 10
        mov     dword [esp+0CH], 28                     ; 0702 _ C7. 44 24, 0C, 0000001C
        mov     ecx, dword [ebp-74H]                    ; 070A _ 8B. 4D, 8C
        mov     dword [esp+8H], ecx                     ; 070D _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 0711 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0715 _ 89. 04 24
        call    paint_string                            ; 0718 _ E8, FFFFFFFC(rel)
        add     dword [ebp-74H], 8                      ; 071D _ 83. 45, 8C, 08
        mov     dword [ebp-68H], 1                      ; 0721 _ C7. 45, 98, 00000001
        mov     eax, dword [ebp-74H]                    ; 0728 _ 8B. 45, 8C
        lea     ebx, [eax+7H]                           ; 072B _ 8D. 58, 07
        mov     eax, dword [ebp-70H]                    ; 072E _ 8B. 45, 90
        movzx   ecx, al                                 ; 0731 _ 0F B6. C8
        mov     eax, dword [sheet_win]                  ; 0734 _ A1, 00000000(d)
        mov     edx, dword [eax+4H]                     ; 0739 _ 8B. 50, 04
        mov     eax, dword [sheet_win]                  ; 073C _ A1, 00000000(d)
        mov     eax, dword [eax]                        ; 0741 _ 8B. 00
        mov     dword [esp+18H], 43                     ; 0743 _ C7. 44 24, 18, 0000002B
        mov     dword [esp+14H], ebx                    ; 074B _ 89. 5C 24, 14
        mov     dword [esp+10H], 28                     ; 074F _ C7. 44 24, 10, 0000001C
        mov     ebx, dword [ebp-74H]                    ; 0757 _ 8B. 5D, 8C
        mov     dword [esp+0CH], ebx                    ; 075A _ 89. 5C 24, 0C
        mov     dword [esp+8H], ecx                     ; 075E _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 0762 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0766 _ 89. 04 24
        call    paint_rectangle                         ; 0769 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-74H]                    ; 076E _ 8B. 45, 8C
        lea     ecx, [eax+8H]                           ; 0771 _ 8D. 48, 08
        mov     edx, dword [sheet_win]                  ; 0774 _ 8B. 15, 00000000(d)
        mov     eax, dword [sheet_control]              ; 077A _ A1, 00000000(d)
        mov     dword [esp+14H], 44                     ; 077F _ C7. 44 24, 14, 0000002C
        mov     dword [esp+10H], ecx                    ; 0787 _ 89. 4C 24, 10
        mov     dword [esp+0CH], 28                     ; 078B _ C7. 44 24, 0C, 0000001C
        mov     ecx, dword [ebp-74H]                    ; 0793 _ 8B. 4D, 8C
        mov     dword [esp+8H], ecx                     ; 0796 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 079A _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 079E _ 89. 04 24
        call    sheet_refresh                           ; 07A1 _ E8, FFFFFFFC(rel)
        jmp     ?_003                                   ; 07A6 _ E9, FFFFFDF6

?_006:  mov     dword [esp], mouseinfo                  ; 07AB _ C7. 04 24, 00000000(d)
        call    fifo8_status                            ; 07B2 _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 07B7 _ 85. C0
        jz      ?_007                                   ; 07B9 _ 74, 26
        mov     ecx, dword [mouse_sheet]                ; 07BB _ 8B. 0D, 00000008(d)
        mov     edx, dword [back_sheet]                 ; 07C1 _ 8B. 15, 00000004(d)
        mov     eax, dword [sheet_control]              ; 07C7 _ A1, 00000000(d)
        mov     dword [esp+8H], ecx                     ; 07CC _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 07D0 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 07D4 _ 89. 04 24
        call    show_mouse_info                         ; 07D7 _ E8, FFFFFFFC(rel)
        jmp     ?_012                                   ; 07DC _ E9, 000001D2

?_007:  mov     dword [esp], timerinfo1.1713            ; 07E1 _ C7. 04 24, 0000000C(d)
        call    fifo8_status                            ; 07E8 _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 07ED _ 85. C0
        je      ?_008                                   ; 07EF _ 0F 84, 0000008E
        call    io_sti                                  ; 07F5 _ E8, FFFFFFFC(rel)
        mov     dword [esp], timerinfo1.1713            ; 07FA _ C7. 04 24, 0000000C(d)
        call    fifo8_get                               ; 0801 _ E8, FFFFFFFC(rel)
        mov     edx, dword [back_sheet]                 ; 0806 _ 8B. 15, 00000004(d)
        mov     eax, dword [sheet_control]              ; 080C _ A1, 00000000(d)
        mov     dword [esp+14H], 7                      ; 0811 _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_189                  ; 0819 _ C7. 44 24, 10, 00000007(d)
        mov     dword [esp+0CH], 144                    ; 0821 _ C7. 44 24, 0C, 00000090
        mov     ecx, dword [ebp-6CH]                    ; 0829 _ 8B. 4D, 94
        mov     dword [esp+8H], ecx                     ; 082C _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 0830 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0834 _ 89. 04 24
        call    paint_string                            ; 0837 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 100                     ; 083C _ C7. 44 24, 04, 00000064
        mov     eax, dword [ebp-54H]                    ; 0844 _ 8B. 45, AC
        mov     dword [esp], eax                        ; 0847 _ 89. 04 24
        call    timer_settime                           ; 084A _ E8, FFFFFFFC(rel)
        add     dword [ebp-6CH], 8                      ; 084F _ 83. 45, 94, 08
        cmp     dword [ebp-6CH], 40                     ; 0853 _ 83. 7D, 94, 28
        jle     ?_012                                   ; 0857 _ 0F 8E, 00000156
        cmp     dword [ebp-68H], 0                      ; 085D _ 83. 7D, 98, 00
        jne     ?_012                                   ; 0861 _ 0F 85, 0000014C
        call    io_cli                                  ; 0867 _ E8, FFFFFFFC(rel)
        mov     eax, dword [task_a.1726]                ; 086C _ A1, 00000078(d)
        mov     dword [esp], eax                        ; 0871 _ 89. 04 24
        call    task_sleep                              ; 0874 _ E8, FFFFFFFC(rel)
        call    io_sti                                  ; 0879 _ E8, FFFFFFFC(rel)
        jmp     ?_003                                   ; 087E _ E9, FFFFFD1E

?_008:  mov     dword [esp], timerinfo2.1714            ; 0883 _ C7. 04 24, 00000030(d)
        call    fifo8_status                            ; 088A _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 088F _ 85. C0
        jz      ?_009                                   ; 0891 _ 74, 16
        call    io_sti                                  ; 0893 _ E8, FFFFFFFC(rel)
        mov     dword [esp], timerinfo2.1714            ; 0898 _ C7. 04 24, 00000030(d)
        call    fifo8_get                               ; 089F _ E8, FFFFFFFC(rel)
        jmp     ?_012                                   ; 08A4 _ E9, 0000010A

?_009:  mov     dword [esp], timerinfo3.1715            ; 08A9 _ C7. 04 24, 00000054(d)
        call    fifo8_status                            ; 08B0 _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 08B5 _ 85. C0
        je      ?_012                                   ; 08B7 _ 0F 84, 000000F6
        mov     dword [esp], timerinfo3.1715            ; 08BD _ C7. 04 24, 00000054(d)
        call    fifo8_get                               ; 08C4 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-30H], eax                    ; 08C9 _ 89. 45, D0
        call    io_sti                                  ; 08CC _ E8, FFFFFFFC(rel)
        cmp     dword [ebp-30H], 0                      ; 08D1 _ 83. 7D, D0, 00
        jz      ?_010                                   ; 08D5 _ 74, 24
        mov     dword [esp+8H], 0                       ; 08D7 _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], timerinfo3.1715         ; 08DF _ C7. 44 24, 04, 00000054(d)
        mov     eax, dword [ebp-4CH]                    ; 08E7 _ 8B. 45, B4
        mov     dword [esp], eax                        ; 08EA _ 89. 04 24
        call    timer_init                              ; 08ED _ E8, FFFFFFFC(rel)
        mov     dword [ebp-70H], 0                      ; 08F2 _ C7. 45, 90, 00000000
        jmp     ?_011                                   ; 08F9 _ EB, 22

?_010:  mov     dword [esp+8H], 1                       ; 08FB _ C7. 44 24, 08, 00000001
        mov     dword [esp+4H], timerinfo3.1715         ; 0903 _ C7. 44 24, 04, 00000054(d)
        mov     eax, dword [ebp-4CH]                    ; 090B _ 8B. 45, B4
        mov     dword [esp], eax                        ; 090E _ 89. 04 24
        call    timer_init                              ; 0911 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-70H], 7                      ; 0916 _ C7. 45, 90, 00000007
?_011:  mov     dword [esp+4H], 50                      ; 091D _ C7. 44 24, 04, 00000032
        mov     eax, dword [ebp-4CH]                    ; 0925 _ 8B. 45, B4
        mov     dword [esp], eax                        ; 0928 _ 89. 04 24
        call    timer_settime                           ; 092B _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-74H]                    ; 0930 _ 8B. 45, 8C
        lea     ebx, [eax+7H]                           ; 0933 _ 8D. 58, 07
        mov     eax, dword [ebp-70H]                    ; 0936 _ 8B. 45, 90
        movzx   ecx, al                                 ; 0939 _ 0F B6. C8
        mov     eax, dword [sheet_win]                  ; 093C _ A1, 00000000(d)
        mov     edx, dword [eax+4H]                     ; 0941 _ 8B. 50, 04
        mov     eax, dword [sheet_win]                  ; 0944 _ A1, 00000000(d)
        mov     eax, dword [eax]                        ; 0949 _ 8B. 00
        mov     dword [esp+18H], 43                     ; 094B _ C7. 44 24, 18, 0000002B
        mov     dword [esp+14H], ebx                    ; 0953 _ 89. 5C 24, 14
        mov     dword [esp+10H], 28                     ; 0957 _ C7. 44 24, 10, 0000001C
        mov     ebx, dword [ebp-74H]                    ; 095F _ 8B. 5D, 8C
        mov     dword [esp+0CH], ebx                    ; 0962 _ 89. 5C 24, 0C
        mov     dword [esp+8H], ecx                     ; 0966 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 096A _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 096E _ 89. 04 24
        call    paint_rectangle                         ; 0971 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-74H]                    ; 0976 _ 8B. 45, 8C
        lea     ecx, [eax+8H]                           ; 0979 _ 8D. 48, 08
        mov     edx, dword [sheet_win]                  ; 097C _ 8B. 15, 00000000(d)
        mov     eax, dword [sheet_control]              ; 0982 _ A1, 00000000(d)
        mov     dword [esp+14H], 44                     ; 0987 _ C7. 44 24, 14, 0000002C
        mov     dword [esp+10H], ecx                    ; 098F _ 89. 4C 24, 10
        mov     dword [esp+0CH], 28                     ; 0993 _ C7. 44 24, 0C, 0000001C
        mov     ecx, dword [ebp-74H]                    ; 099B _ 8B. 4D, 8C
        mov     dword [esp+8H], ecx                     ; 099E _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 09A2 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 09A6 _ 89. 04 24
        call    sheet_refresh                           ; 09A9 _ E8, FFFFFFFC(rel)
        jmp     ?_003                                   ; 09AE _ E9, FFFFFBEE

?_012:  jmp     ?_003                                   ; 09B3 _ E9, FFFFFBE9
; CMain End of function

task_b_main:; Function begin
        push    ebp                                     ; 09B8 _ 55
        mov     ebp, esp                                ; 09B9 _ 89. E5
        sub     esp, 104                                ; 09BB _ 83. EC, 68
        mov     eax, dword [ebp+8H]                     ; 09BE _ 8B. 45, 08
        mov     dword [ebp-4CH], eax                    ; 09C1 _ 89. 45, B4
; Note: Absolute memory address without relocation
        mov     eax, dword [gs:14H]                     ; 09C4 _ 65: A1, 00000014
        mov     dword [ebp-0CH], eax                    ; 09CA _ 89. 45, F4
        xor     eax, eax                                ; 09CD _ 31. C0
        mov     edx, dword [back_sheet]                 ; 09CF _ 8B. 15, 00000004(d)
        mov     eax, dword [sheet_control]              ; 09D5 _ A1, 00000000(d)
        mov     dword [esp+14H], 7                      ; 09DA _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_190                  ; 09E2 _ C7. 44 24, 10, 00000009(d)
        mov     dword [esp+0CH], 160                    ; 09EA _ C7. 44 24, 0C, 000000A0
        mov     dword [esp+8H], 0                       ; 09F2 _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], edx                     ; 09FA _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 09FE _ 89. 04 24
        call    paint_string                            ; 0A01 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-3CH], 0                      ; 0A06 _ C7. 45, C4, 00000000
        mov     dword [ebp-38H], 0                      ; 0A0D _ C7. 45, C8, 00000000
        mov     dword [esp+0CH], 0                      ; 0A14 _ C7. 44 24, 0C, 00000000
        lea     eax, [ebp-14H]                          ; 0A1C _ 8D. 45, EC
        mov     dword [esp+8H], eax                     ; 0A1F _ 89. 44 24, 08
        mov     dword [esp+4H], 8                       ; 0A23 _ C7. 44 24, 04, 00000008
        lea     eax, [ebp-30H]                          ; 0A2B _ 8D. 45, D0
        mov     dword [esp], eax                        ; 0A2E _ 89. 04 24
        call    fifo8_init                              ; 0A31 _ E8, FFFFFFFC(rel)
        call    timer_alloc                             ; 0A36 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-3CH], eax                    ; 0A3B _ 89. 45, C4
        mov     dword [esp+8H], 123                     ; 0A3E _ C7. 44 24, 08, 0000007B
        lea     eax, [ebp-30H]                          ; 0A46 _ 8D. 45, D0
        mov     dword [esp+4H], eax                     ; 0A49 _ 89. 44 24, 04
        mov     eax, dword [ebp-3CH]                    ; 0A4D _ 8B. 45, C4
        mov     dword [esp], eax                        ; 0A50 _ 89. 04 24
        call    timer_init                              ; 0A53 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 100                     ; 0A58 _ C7. 44 24, 04, 00000064
        mov     eax, dword [ebp-3CH]                    ; 0A60 _ 8B. 45, C4
        mov     dword [esp], eax                        ; 0A63 _ 89. 04 24
        call    timer_settime                           ; 0A66 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-44H], 0                      ; 0A6B _ C7. 45, BC, 00000000
        mov     dword [ebp-40H], 0                      ; 0A72 _ C7. 45, C0, 00000000
?_013:  add     dword [ebp-44H], 1                      ; 0A79 _ 83. 45, BC, 01
        call    io_cli                                  ; 0A7D _ E8, FFFFFFFC(rel)
        lea     eax, [ebp-30H]                          ; 0A82 _ 8D. 45, D0
        mov     dword [esp], eax                        ; 0A85 _ 89. 04 24
        call    fifo8_status                            ; 0A88 _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 0A8D _ 85. C0
        jnz     ?_014                                   ; 0A8F _ 75, 0A
        call    io_sti                                  ; 0A91 _ E8, FFFFFFFC(rel)
        jmp     ?_015                                   ; 0A96 _ E9, 00000121

?_014:  lea     eax, [ebp-30H]                          ; 0A9B _ 8D. 45, D0
        mov     dword [esp], eax                        ; 0A9E _ 89. 04 24
        call    fifo8_get                               ; 0AA1 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-38H], eax                    ; 0AA6 _ 89. 45, C8
        call    io_sti                                  ; 0AA9 _ E8, FFFFFFFC(rel)
        cmp     dword [ebp-38H], 123                    ; 0AAE _ 83. 7D, C8, 7B
        jne     ?_015                                   ; 0AB2 _ 0F 85, 00000104
        mov     edx, dword [back_sheet]                 ; 0AB8 _ 8B. 15, 00000004(d)
        mov     eax, dword [sheet_control]              ; 0ABE _ A1, 00000000(d)
        mov     dword [esp+14H], 7                      ; 0AC3 _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_191                  ; 0ACB _ C7. 44 24, 10, 00000016(d)
        mov     dword [esp+0CH], 176                    ; 0AD3 _ C7. 44 24, 0C, 000000B0
        mov     ecx, dword [ebp-40H]                    ; 0ADB _ 8B. 4D, C0
        mov     dword [esp+8H], ecx                     ; 0ADE _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 0AE2 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0AE6 _ 89. 04 24
        call    paint_string                            ; 0AE9 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 100                     ; 0AEE _ C7. 44 24, 04, 00000064
        mov     eax, dword [ebp-3CH]                    ; 0AF6 _ 8B. 45, C4
        mov     dword [esp], eax                        ; 0AF9 _ 89. 04 24
        call    timer_settime                           ; 0AFC _ E8, FFFFFFFC(rel)
        add     dword [ebp-40H], 8                      ; 0B01 _ 83. 45, C0, 08
        mov     eax, dword [ebp-4CH]                    ; 0B05 _ 8B. 45, B4
        mov     eax, dword [eax]                        ; 0B08 _ 8B. 00
        mov     dword [esp+18H], 44                     ; 0B0A _ C7. 44 24, 18, 0000002C
        mov     dword [esp+14H], 104                    ; 0B12 _ C7. 44 24, 14, 00000068
        mov     dword [esp+10H], 28                     ; 0B1A _ C7. 44 24, 10, 0000001C
        mov     dword [esp+0CH], 24                     ; 0B22 _ C7. 44 24, 0C, 00000018
        mov     dword [esp+8H], 8                       ; 0B2A _ C7. 44 24, 08, 00000008
        mov     dword [esp+4H], 144                     ; 0B32 _ C7. 44 24, 04, 00000090
        mov     dword [esp], eax                        ; 0B3A _ 89. 04 24
        call    paint_rectangle                         ; 0B3D _ E8, FFFFFFFC(rel)
        mov     eax, dword [sheet_control]              ; 0B42 _ A1, 00000000(d)
        mov     dword [esp+14H], 44                     ; 0B47 _ C7. 44 24, 14, 0000002C
        mov     dword [esp+10H], 104                    ; 0B4F _ C7. 44 24, 10, 00000068
        mov     dword [esp+0CH], 28                     ; 0B57 _ C7. 44 24, 0C, 0000001C
        mov     dword [esp+8H], 24                      ; 0B5F _ C7. 44 24, 08, 00000018
        mov     edx, dword [ebp-4CH]                    ; 0B67 _ 8B. 55, B4
        mov     dword [esp+4H], edx                     ; 0B6A _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0B6E _ 89. 04 24
        call    sheet_refresh                           ; 0B71 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-44H]                    ; 0B76 _ 8B. 45, BC
        mov     dword [esp], eax                        ; 0B79 _ 89. 04 24
        call    intToHexStr                             ; 0B7C _ E8, FFFFFFFC(rel)
        mov     dword [ebp-34H], eax                    ; 0B81 _ 89. 45, CC
        mov     eax, dword [sheet_control]              ; 0B84 _ A1, 00000000(d)
        mov     dword [esp+14H], 7                      ; 0B89 _ C7. 44 24, 14, 00000007
        mov     edx, dword [ebp-34H]                    ; 0B91 _ 8B. 55, CC
        mov     dword [esp+10H], edx                    ; 0B94 _ 89. 54 24, 10
        mov     dword [esp+0CH], 28                     ; 0B98 _ C7. 44 24, 0C, 0000001C
        mov     dword [esp+8H], 24                      ; 0BA0 _ C7. 44 24, 08, 00000018
        mov     edx, dword [ebp-4CH]                    ; 0BA8 _ 8B. 55, B4
        mov     dword [esp+4H], edx                     ; 0BAB _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0BAF _ 89. 04 24
        call    paint_string                            ; 0BB2 _ E8, FFFFFFFC(rel)
        jmp     ?_013                                   ; 0BB7 _ E9, FFFFFEBD

?_015:  jmp     ?_013                                   ; 0BBC _ E9, FFFFFEB8
; task_b_main End of function

init_screeninfo:; Function begin
        push    ebp                                     ; 0BC1 _ 55
        mov     ebp, esp                                ; 0BC2 _ 89. E5
        mov     eax, dword [VRAM_ADDRESS]               ; 0BC4 _ A1, 00000000(d)
        mov     edx, eax                                ; 0BC9 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0BCB _ 8B. 45, 08
        mov     dword [eax], edx                        ; 0BCE _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 0BD0 _ 8B. 45, 08
; Note: Length-changing prefix causes delay on Intel processors
        mov     word [eax+4H], 640                      ; 0BD3 _ 66: C7. 40, 04, 0280
        mov     eax, dword [ebp+8H]                     ; 0BD9 _ 8B. 45, 08
; Note: Length-changing prefix causes delay on Intel processors
        mov     word [eax+6H], 480                      ; 0BDC _ 66: C7. 40, 06, 01E0
        pop     ebp                                     ; 0BE2 _ 5D
        ret                                             ; 0BE3 _ C3
; init_screeninfo End of function

init_palette:; Function begin
        push    ebp                                     ; 0BE4 _ 55
        mov     ebp, esp                                ; 0BE5 _ 89. E5
        sub     esp, 24                                 ; 0BE7 _ 83. EC, 18
        mov     dword [esp+8H], table_rgb.1684          ; 0BEA _ C7. 44 24, 08, 00000080(d)
        mov     dword [esp+4H], 15                      ; 0BF2 _ C7. 44 24, 04, 0000000F
        mov     dword [esp], 0                          ; 0BFA _ C7. 04 24, 00000000
        call    set_palette                             ; 0C01 _ E8, FFFFFFFC(rel)
        nop                                             ; 0C06 _ 90
        leave                                           ; 0C07 _ C9
        ret                                             ; 0C08 _ C3
; init_palette End of function

set_palette:; Function begin
        push    ebp                                     ; 0C09 _ 55
        mov     ebp, esp                                ; 0C0A _ 89. E5
        sub     esp, 40                                 ; 0C0C _ 83. EC, 28
        call    io_load_eflags                          ; 0C0F _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 0C14 _ 89. 45, F4
        call    io_cli                                  ; 0C17 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 0C1C _ 8B. 45, 08
        mov     dword [esp+4H], eax                     ; 0C1F _ 89. 44 24, 04
        mov     dword [esp], 968                        ; 0C23 _ C7. 04 24, 000003C8
        call    io_out8                                 ; 0C2A _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 0C2F _ 8B. 45, 08
        mov     dword [ebp-10H], eax                    ; 0C32 _ 89. 45, F0
        jmp     ?_017                                   ; 0C35 _ EB, 62

?_016:  mov     eax, dword [ebp+10H]                    ; 0C37 _ 8B. 45, 10
        movzx   eax, byte [eax]                         ; 0C3A _ 0F B6. 00
        shr     al, 2                                   ; 0C3D _ C0. E8, 02
        movzx   eax, al                                 ; 0C40 _ 0F B6. C0
        mov     dword [esp+4H], eax                     ; 0C43 _ 89. 44 24, 04
        mov     dword [esp], 969                        ; 0C47 _ C7. 04 24, 000003C9
        call    io_out8                                 ; 0C4E _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0C53 _ 8B. 45, 10
        add     eax, 1                                  ; 0C56 _ 83. C0, 01
        movzx   eax, byte [eax]                         ; 0C59 _ 0F B6. 00
        shr     al, 2                                   ; 0C5C _ C0. E8, 02
        movzx   eax, al                                 ; 0C5F _ 0F B6. C0
        mov     dword [esp+4H], eax                     ; 0C62 _ 89. 44 24, 04
        mov     dword [esp], 969                        ; 0C66 _ C7. 04 24, 000003C9
        call    io_out8                                 ; 0C6D _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0C72 _ 8B. 45, 10
        add     eax, 2                                  ; 0C75 _ 83. C0, 02
        movzx   eax, byte [eax]                         ; 0C78 _ 0F B6. 00
        shr     al, 2                                   ; 0C7B _ C0. E8, 02
        movzx   eax, al                                 ; 0C7E _ 0F B6. C0
        mov     dword [esp+4H], eax                     ; 0C81 _ 89. 44 24, 04
        mov     dword [esp], 969                        ; 0C85 _ C7. 04 24, 000003C9
        call    io_out8                                 ; 0C8C _ E8, FFFFFFFC(rel)
        add     dword [ebp+10H], 3                      ; 0C91 _ 83. 45, 10, 03
        add     dword [ebp-10H], 1                      ; 0C95 _ 83. 45, F0, 01
?_017:  mov     eax, dword [ebp-10H]                    ; 0C99 _ 8B. 45, F0
        cmp     eax, dword [ebp+0CH]                    ; 0C9C _ 3B. 45, 0C
        jle     ?_016                                   ; 0C9F _ 7E, 96
        mov     eax, dword [ebp-0CH]                    ; 0CA1 _ 8B. 45, F4
        mov     dword [esp], eax                        ; 0CA4 _ 89. 04 24
        call    io_store_eflags                         ; 0CA7 _ E8, FFFFFFFC(rel)
        nop                                             ; 0CAC _ 90
        leave                                           ; 0CAD _ C9
        ret                                             ; 0CAE _ C3
; set_palette End of function

paint_rectangle:; Function begin
        push    ebp                                     ; 0CAF _ 55
        mov     ebp, esp                                ; 0CB0 _ 89. E5
        sub     esp, 20                                 ; 0CB2 _ 83. EC, 14
        mov     eax, dword [ebp+10H]                    ; 0CB5 _ 8B. 45, 10
        mov     byte [ebp-14H], al                      ; 0CB8 _ 88. 45, EC
        mov     eax, dword [ebp+18H]                    ; 0CBB _ 8B. 45, 18
        mov     dword [ebp-4H], eax                     ; 0CBE _ 89. 45, FC
        jmp     ?_021                                   ; 0CC1 _ EB, 33

?_018:  mov     eax, dword [ebp+14H]                    ; 0CC3 _ 8B. 45, 14
        mov     dword [ebp-8H], eax                     ; 0CC6 _ 89. 45, F8
        jmp     ?_020                                   ; 0CC9 _ EB, 1F

?_019:  mov     eax, dword [ebp-4H]                     ; 0CCB _ 8B. 45, FC
        imul    eax, dword [ebp+0CH]                    ; 0CCE _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0CD2 _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 0CD4 _ 8B. 45, F8
        add     eax, edx                                ; 0CD7 _ 01. D0
        mov     edx, eax                                ; 0CD9 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0CDB _ 8B. 45, 08
        add     edx, eax                                ; 0CDE _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0CE0 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0CE4 _ 88. 02
        add     dword [ebp-8H], 1                       ; 0CE6 _ 83. 45, F8, 01
?_020:  mov     eax, dword [ebp-8H]                     ; 0CEA _ 8B. 45, F8
        cmp     eax, dword [ebp+1CH]                    ; 0CED _ 3B. 45, 1C
        jle     ?_019                                   ; 0CF0 _ 7E, D9
        add     dword [ebp-4H], 1                       ; 0CF2 _ 83. 45, FC, 01
?_021:  mov     eax, dword [ebp-4H]                     ; 0CF6 _ 8B. 45, FC
        cmp     eax, dword [ebp+20H]                    ; 0CF9 _ 3B. 45, 20
        jle     ?_018                                   ; 0CFC _ 7E, C5
        leave                                           ; 0CFE _ C9
        ret                                             ; 0CFF _ C3
; paint_rectangle End of function

init_desktop:; Function begin
        push    ebp                                     ; 0D00 _ 55
        mov     ebp, esp                                ; 0D01 _ 89. E5
        push    ebx                                     ; 0D03 _ 53
        sub     esp, 28                                 ; 0D04 _ 83. EC, 1C
        mov     eax, dword [ebp+10H]                    ; 0D07 _ 8B. 45, 10
        lea     edx, [eax-1DH]                          ; 0D0A _ 8D. 50, E3
        mov     eax, dword [ebp+0CH]                    ; 0D0D _ 8B. 45, 0C
        sub     eax, 1                                  ; 0D10 _ 83. E8, 01
        mov     dword [esp+18H], edx                    ; 0D13 _ 89. 54 24, 18
        mov     dword [esp+14H], eax                    ; 0D17 _ 89. 44 24, 14
        mov     dword [esp+10H], 0                      ; 0D1B _ C7. 44 24, 10, 00000000
        mov     dword [esp+0CH], 0                      ; 0D23 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 2                       ; 0D2B _ C7. 44 24, 08, 00000002
        mov     eax, dword [ebp+0CH]                    ; 0D33 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0D36 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0D3A _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0D3D _ 89. 04 24
        call    paint_rectangle                         ; 0D40 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0D45 _ 8B. 45, 10
        lea     ecx, [eax-1CH]                          ; 0D48 _ 8D. 48, E4
        mov     eax, dword [ebp+0CH]                    ; 0D4B _ 8B. 45, 0C
        lea     edx, [eax-1H]                           ; 0D4E _ 8D. 50, FF
        mov     eax, dword [ebp+10H]                    ; 0D51 _ 8B. 45, 10
        sub     eax, 28                                 ; 0D54 _ 83. E8, 1C
        mov     dword [esp+18H], ecx                    ; 0D57 _ 89. 4C 24, 18
        mov     dword [esp+14H], edx                    ; 0D5B _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 0D5F _ 89. 44 24, 10
        mov     dword [esp+0CH], 0                      ; 0D63 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 8                       ; 0D6B _ C7. 44 24, 08, 00000008
        mov     eax, dword [ebp+0CH]                    ; 0D73 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0D76 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0D7A _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0D7D _ 89. 04 24
        call    paint_rectangle                         ; 0D80 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0D85 _ 8B. 45, 10
        lea     ecx, [eax-1BH]                          ; 0D88 _ 8D. 48, E5
        mov     eax, dword [ebp+0CH]                    ; 0D8B _ 8B. 45, 0C
        lea     edx, [eax-1H]                           ; 0D8E _ 8D. 50, FF
        mov     eax, dword [ebp+10H]                    ; 0D91 _ 8B. 45, 10
        sub     eax, 27                                 ; 0D94 _ 83. E8, 1B
        mov     dword [esp+18H], ecx                    ; 0D97 _ 89. 4C 24, 18
        mov     dword [esp+14H], edx                    ; 0D9B _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 0D9F _ 89. 44 24, 10
        mov     dword [esp+0CH], 0                      ; 0DA3 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 7                       ; 0DAB _ C7. 44 24, 08, 00000007
        mov     eax, dword [ebp+0CH]                    ; 0DB3 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0DB6 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0DBA _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0DBD _ 89. 04 24
        call    paint_rectangle                         ; 0DC0 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0DC5 _ 8B. 45, 10
        lea     ecx, [eax-1H]                           ; 0DC8 _ 8D. 48, FF
        mov     eax, dword [ebp+0CH]                    ; 0DCB _ 8B. 45, 0C
        lea     edx, [eax-1H]                           ; 0DCE _ 8D. 50, FF
        mov     eax, dword [ebp+10H]                    ; 0DD1 _ 8B. 45, 10
        sub     eax, 26                                 ; 0DD4 _ 83. E8, 1A
        mov     dword [esp+18H], ecx                    ; 0DD7 _ 89. 4C 24, 18
        mov     dword [esp+14H], edx                    ; 0DDB _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 0DDF _ 89. 44 24, 10
        mov     dword [esp+0CH], 0                      ; 0DE3 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 8                       ; 0DEB _ C7. 44 24, 08, 00000008
        mov     eax, dword [ebp+0CH]                    ; 0DF3 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0DF6 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0DFA _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0DFD _ 89. 04 24
        call    paint_rectangle                         ; 0E00 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0E05 _ 8B. 45, 10
        lea     edx, [eax-18H]                          ; 0E08 _ 8D. 50, E8
        mov     eax, dword [ebp+10H]                    ; 0E0B _ 8B. 45, 10
        sub     eax, 24                                 ; 0E0E _ 83. E8, 18
        mov     dword [esp+18H], edx                    ; 0E11 _ 89. 54 24, 18
        mov     dword [esp+14H], 59                     ; 0E15 _ C7. 44 24, 14, 0000003B
        mov     dword [esp+10H], eax                    ; 0E1D _ 89. 44 24, 10
        mov     dword [esp+0CH], 3                      ; 0E21 _ C7. 44 24, 0C, 00000003
        mov     dword [esp+8H], 7                       ; 0E29 _ C7. 44 24, 08, 00000007
        mov     eax, dword [ebp+0CH]                    ; 0E31 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0E34 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0E38 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0E3B _ 89. 04 24
        call    paint_rectangle                         ; 0E3E _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0E43 _ 8B. 45, 10
        lea     edx, [eax-4H]                           ; 0E46 _ 8D. 50, FC
        mov     eax, dword [ebp+10H]                    ; 0E49 _ 8B. 45, 10
        sub     eax, 24                                 ; 0E4C _ 83. E8, 18
        mov     dword [esp+18H], edx                    ; 0E4F _ 89. 54 24, 18
        mov     dword [esp+14H], 2                      ; 0E53 _ C7. 44 24, 14, 00000002
        mov     dword [esp+10H], eax                    ; 0E5B _ 89. 44 24, 10
        mov     dword [esp+0CH], 2                      ; 0E5F _ C7. 44 24, 0C, 00000002
        mov     dword [esp+8H], 7                       ; 0E67 _ C7. 44 24, 08, 00000007
        mov     eax, dword [ebp+0CH]                    ; 0E6F _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0E72 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0E76 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0E79 _ 89. 04 24
        call    paint_rectangle                         ; 0E7C _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0E81 _ 8B. 45, 10
        lea     edx, [eax-4H]                           ; 0E84 _ 8D. 50, FC
        mov     eax, dword [ebp+10H]                    ; 0E87 _ 8B. 45, 10
        sub     eax, 4                                  ; 0E8A _ 83. E8, 04
        mov     dword [esp+18H], edx                    ; 0E8D _ 89. 54 24, 18
        mov     dword [esp+14H], 59                     ; 0E91 _ C7. 44 24, 14, 0000003B
        mov     dword [esp+10H], eax                    ; 0E99 _ 89. 44 24, 10
        mov     dword [esp+0CH], 3                      ; 0E9D _ C7. 44 24, 0C, 00000003
        mov     dword [esp+8H], 2                       ; 0EA5 _ C7. 44 24, 08, 00000002
        mov     eax, dword [ebp+0CH]                    ; 0EAD _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0EB0 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0EB4 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0EB7 _ 89. 04 24
        call    paint_rectangle                         ; 0EBA _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0EBF _ 8B. 45, 10
        lea     edx, [eax-5H]                           ; 0EC2 _ 8D. 50, FB
        mov     eax, dword [ebp+10H]                    ; 0EC5 _ 8B. 45, 10
        sub     eax, 23                                 ; 0EC8 _ 83. E8, 17
        mov     dword [esp+18H], edx                    ; 0ECB _ 89. 54 24, 18
        mov     dword [esp+14H], 59                     ; 0ECF _ C7. 44 24, 14, 0000003B
        mov     dword [esp+10H], eax                    ; 0ED7 _ 89. 44 24, 10
        mov     dword [esp+0CH], 59                     ; 0EDB _ C7. 44 24, 0C, 0000003B
        mov     dword [esp+8H], 2                       ; 0EE3 _ C7. 44 24, 08, 00000002
        mov     eax, dword [ebp+0CH]                    ; 0EEB _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0EEE _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0EF2 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0EF5 _ 89. 04 24
        call    paint_rectangle                         ; 0EF8 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0EFD _ 8B. 45, 10
        lea     edx, [eax-3H]                           ; 0F00 _ 8D. 50, FD
        mov     eax, dword [ebp+10H]                    ; 0F03 _ 8B. 45, 10
        sub     eax, 3                                  ; 0F06 _ 83. E8, 03
        mov     dword [esp+18H], edx                    ; 0F09 _ 89. 54 24, 18
        mov     dword [esp+14H], 59                     ; 0F0D _ C7. 44 24, 14, 0000003B
        mov     dword [esp+10H], eax                    ; 0F15 _ 89. 44 24, 10
        mov     dword [esp+0CH], 2                      ; 0F19 _ C7. 44 24, 0C, 00000002
        mov     dword [esp+8H], 0                       ; 0F21 _ C7. 44 24, 08, 00000000
        mov     eax, dword [ebp+0CH]                    ; 0F29 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0F2C _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0F30 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0F33 _ 89. 04 24
        call    paint_rectangle                         ; 0F36 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0F3B _ 8B. 45, 10
        lea     edx, [eax-3H]                           ; 0F3E _ 8D. 50, FD
        mov     eax, dword [ebp+10H]                    ; 0F41 _ 8B. 45, 10
        sub     eax, 24                                 ; 0F44 _ 83. E8, 18
        mov     dword [esp+18H], edx                    ; 0F47 _ 89. 54 24, 18
        mov     dword [esp+14H], 60                     ; 0F4B _ C7. 44 24, 14, 0000003C
        mov     dword [esp+10H], eax                    ; 0F53 _ 89. 44 24, 10
        mov     dword [esp+0CH], 60                     ; 0F57 _ C7. 44 24, 0C, 0000003C
        mov     dword [esp+8H], 0                       ; 0F5F _ C7. 44 24, 08, 00000000
        mov     eax, dword [ebp+0CH]                    ; 0F67 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0F6A _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0F6E _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0F71 _ 89. 04 24
        call    paint_rectangle                         ; 0F74 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0F79 _ 8B. 45, 10
        lea     ebx, [eax-18H]                          ; 0F7C _ 8D. 58, E8
        mov     eax, dword [ebp+0CH]                    ; 0F7F _ 8B. 45, 0C
        lea     ecx, [eax-4H]                           ; 0F82 _ 8D. 48, FC
        mov     eax, dword [ebp+10H]                    ; 0F85 _ 8B. 45, 10
        lea     edx, [eax-18H]                          ; 0F88 _ 8D. 50, E8
        mov     eax, dword [ebp+0CH]                    ; 0F8B _ 8B. 45, 0C
        sub     eax, 47                                 ; 0F8E _ 83. E8, 2F
        mov     dword [esp+18H], ebx                    ; 0F91 _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 0F95 _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 0F99 _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 0F9D _ 89. 44 24, 0C
        mov     dword [esp+8H], 2                       ; 0FA1 _ C7. 44 24, 08, 00000002
        mov     eax, dword [ebp+0CH]                    ; 0FA9 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0FAC _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0FB0 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0FB3 _ 89. 04 24
        call    paint_rectangle                         ; 0FB6 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0FBB _ 8B. 45, 10
        lea     ebx, [eax-4H]                           ; 0FBE _ 8D. 58, FC
        mov     eax, dword [ebp+0CH]                    ; 0FC1 _ 8B. 45, 0C
        lea     ecx, [eax-2FH]                          ; 0FC4 _ 8D. 48, D1
        mov     eax, dword [ebp+10H]                    ; 0FC7 _ 8B. 45, 10
        lea     edx, [eax-17H]                          ; 0FCA _ 8D. 50, E9
        mov     eax, dword [ebp+0CH]                    ; 0FCD _ 8B. 45, 0C
        sub     eax, 47                                 ; 0FD0 _ 83. E8, 2F
        mov     dword [esp+18H], ebx                    ; 0FD3 _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 0FD7 _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 0FDB _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 0FDF _ 89. 44 24, 0C
        mov     dword [esp+8H], 2                       ; 0FE3 _ C7. 44 24, 08, 00000002
        mov     eax, dword [ebp+0CH]                    ; 0FEB _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0FEE _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0FF2 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0FF5 _ 89. 04 24
        call    paint_rectangle                         ; 0FF8 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0FFD _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 1000 _ 8D. 58, FD
        mov     eax, dword [ebp+0CH]                    ; 1003 _ 8B. 45, 0C
        lea     ecx, [eax-4H]                           ; 1006 _ 8D. 48, FC
        mov     eax, dword [ebp+10H]                    ; 1009 _ 8B. 45, 10
        lea     edx, [eax-3H]                           ; 100C _ 8D. 50, FD
        mov     eax, dword [ebp+0CH]                    ; 100F _ 8B. 45, 0C
        sub     eax, 47                                 ; 1012 _ 83. E8, 2F
        mov     dword [esp+18H], ebx                    ; 1015 _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 1019 _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 101D _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 1021 _ 89. 44 24, 0C
        mov     dword [esp+8H], 7                       ; 1025 _ C7. 44 24, 08, 00000007
        mov     eax, dword [ebp+0CH]                    ; 102D _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 1030 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1034 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1037 _ 89. 04 24
        call    paint_rectangle                         ; 103A _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 103F _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 1042 _ 8D. 58, FD
        mov     eax, dword [ebp+0CH]                    ; 1045 _ 8B. 45, 0C
        lea     ecx, [eax-3H]                           ; 1048 _ 8D. 48, FD
        mov     eax, dword [ebp+10H]                    ; 104B _ 8B. 45, 10
        lea     edx, [eax-18H]                          ; 104E _ 8D. 50, E8
        mov     eax, dword [ebp+0CH]                    ; 1051 _ 8B. 45, 0C
        sub     eax, 3                                  ; 1054 _ 83. E8, 03
        mov     dword [esp+18H], ebx                    ; 1057 _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 105B _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 105F _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 1063 _ 89. 44 24, 0C
        mov     dword [esp+8H], 7                       ; 1067 _ C7. 44 24, 08, 00000007
        mov     eax, dword [ebp+0CH]                    ; 106F _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 1072 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1076 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1079 _ 89. 04 24
        call    paint_rectangle                         ; 107C _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1081 _ 83. C4, 1C
        pop     ebx                                     ; 1084 _ 5B
        pop     ebp                                     ; 1085 _ 5D
        ret                                             ; 1086 _ C3
; init_desktop End of function

init_mouse_position:; Function begin
        push    ebp                                     ; 1087 _ 55
        mov     ebp, esp                                ; 1088 _ 89. E5
        sub     esp, 16                                 ; 108A _ 83. EC, 10
        movzx   eax, word [?_200]                       ; 108D _ 0F B7. 05, 00000184(d)
        cwde                                            ; 1094 _ 98
        mov     dword [ebp-8H], eax                     ; 1095 _ 89. 45, F8
        movzx   eax, word [?_201]                       ; 1098 _ 0F B7. 05, 00000186(d)
        cwde                                            ; 109F _ 98
        mov     dword [ebp-4H], eax                     ; 10A0 _ 89. 45, FC
        mov     eax, dword [ebp-8H]                     ; 10A3 _ 8B. 45, F8
        sub     eax, 16                                 ; 10A6 _ 83. E8, 10
        mov     edx, eax                                ; 10A9 _ 89. C2
        shr     edx, 31                                 ; 10AB _ C1. EA, 1F
        add     eax, edx                                ; 10AE _ 01. D0
        sar     eax, 1                                  ; 10B0 _ D1. F8
        mov     dword [mouse_x], eax                    ; 10B2 _ A3, 000002A8(d)
        mov     eax, dword [ebp-4H]                     ; 10B7 _ 8B. 45, FC
        sub     eax, 44                                 ; 10BA _ 83. E8, 2C
        mov     edx, eax                                ; 10BD _ 89. C2
        shr     edx, 31                                 ; 10BF _ C1. EA, 1F
        add     eax, edx                                ; 10C2 _ 01. D0
        sar     eax, 1                                  ; 10C4 _ D1. F8
        mov     dword [mouse_y], eax                    ; 10C6 _ A3, 000002AC(d)
        leave                                           ; 10CB _ C9
        ret                                             ; 10CC _ C3
; init_mouse_position End of function

paint_font:; Function begin
        push    ebp                                     ; 10CD _ 55
        mov     ebp, esp                                ; 10CE _ 89. E5
        sub     esp, 20                                 ; 10D0 _ 83. EC, 14
        mov     eax, dword [ebp+1CH]                    ; 10D3 _ 8B. 45, 1C
        mov     byte [ebp-14H], al                      ; 10D6 _ 88. 45, EC
        mov     dword [ebp-4H], 0                       ; 10D9 _ C7. 45, FC, 00000000
        jmp     ?_031                                   ; 10E0 _ E9, 0000016E

?_022:  mov     edx, dword [ebp-4H]                     ; 10E5 _ 8B. 55, FC
        mov     eax, dword [ebp+18H]                    ; 10E8 _ 8B. 45, 18
        add     eax, edx                                ; 10EB _ 01. D0
        movzx   eax, byte [eax]                         ; 10ED _ 0F B6. 00
        mov     byte [ebp-5H], al                       ; 10F0 _ 88. 45, FB
        movzx   eax, byte [ebp-5H]                      ; 10F3 _ 0F B6. 45, FB
        test    al, al                                  ; 10F7 _ 84. C0
        jns     ?_023                                   ; 10F9 _ 79, 20
        mov     eax, dword [ebp-4H]                     ; 10FB _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 10FE _ 8B. 55, 14
        add     eax, edx                                ; 1101 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 1103 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 1107 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 1109 _ 8B. 45, 10
        add     eax, edx                                ; 110C _ 01. D0
        mov     edx, eax                                ; 110E _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 1110 _ 8B. 45, 08
        add     edx, eax                                ; 1113 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 1115 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 1119 _ 88. 02
?_023:  movzx   eax, byte [ebp-5H]                      ; 111B _ 0F B6. 45, FB
        and     eax, 40H                                ; 111F _ 83. E0, 40
        test    eax, eax                                ; 1122 _ 85. C0
        jz      ?_024                                   ; 1124 _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 1126 _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 1129 _ 8B. 55, 14
        add     eax, edx                                ; 112C _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 112E _ 0F AF. 45, 0C
        mov     edx, eax                                ; 1132 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 1134 _ 8B. 45, 10
        add     eax, edx                                ; 1137 _ 01. D0
        lea     edx, [eax+1H]                           ; 1139 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 113C _ 8B. 45, 08
        add     edx, eax                                ; 113F _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 1141 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 1145 _ 88. 02
?_024:  movzx   eax, byte [ebp-5H]                      ; 1147 _ 0F B6. 45, FB
        and     eax, 20H                                ; 114B _ 83. E0, 20
        test    eax, eax                                ; 114E _ 85. C0
        jz      ?_025                                   ; 1150 _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 1152 _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 1155 _ 8B. 55, 14
        add     eax, edx                                ; 1158 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 115A _ 0F AF. 45, 0C
        mov     edx, eax                                ; 115E _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 1160 _ 8B. 45, 10
        add     eax, edx                                ; 1163 _ 01. D0
        lea     edx, [eax+2H]                           ; 1165 _ 8D. 50, 02
        mov     eax, dword [ebp+8H]                     ; 1168 _ 8B. 45, 08
        add     edx, eax                                ; 116B _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 116D _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 1171 _ 88. 02
?_025:  movzx   eax, byte [ebp-5H]                      ; 1173 _ 0F B6. 45, FB
        and     eax, 10H                                ; 1177 _ 83. E0, 10
        test    eax, eax                                ; 117A _ 85. C0
        jz      ?_026                                   ; 117C _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 117E _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 1181 _ 8B. 55, 14
        add     eax, edx                                ; 1184 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 1186 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 118A _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 118C _ 8B. 45, 10
        add     eax, edx                                ; 118F _ 01. D0
        lea     edx, [eax+3H]                           ; 1191 _ 8D. 50, 03
        mov     eax, dword [ebp+8H]                     ; 1194 _ 8B. 45, 08
        add     edx, eax                                ; 1197 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 1199 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 119D _ 88. 02
?_026:  movzx   eax, byte [ebp-5H]                      ; 119F _ 0F B6. 45, FB
        and     eax, 08H                                ; 11A3 _ 83. E0, 08
        test    eax, eax                                ; 11A6 _ 85. C0
        jz      ?_027                                   ; 11A8 _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 11AA _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 11AD _ 8B. 55, 14
        add     eax, edx                                ; 11B0 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 11B2 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 11B6 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 11B8 _ 8B. 45, 10
        add     eax, edx                                ; 11BB _ 01. D0
        lea     edx, [eax+4H]                           ; 11BD _ 8D. 50, 04
        mov     eax, dword [ebp+8H]                     ; 11C0 _ 8B. 45, 08
        add     edx, eax                                ; 11C3 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 11C5 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 11C9 _ 88. 02
?_027:  movzx   eax, byte [ebp-5H]                      ; 11CB _ 0F B6. 45, FB
        and     eax, 04H                                ; 11CF _ 83. E0, 04
        test    eax, eax                                ; 11D2 _ 85. C0
        jz      ?_028                                   ; 11D4 _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 11D6 _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 11D9 _ 8B. 55, 14
        add     eax, edx                                ; 11DC _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 11DE _ 0F AF. 45, 0C
        mov     edx, eax                                ; 11E2 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 11E4 _ 8B. 45, 10
        add     eax, edx                                ; 11E7 _ 01. D0
        lea     edx, [eax+5H]                           ; 11E9 _ 8D. 50, 05
        mov     eax, dword [ebp+8H]                     ; 11EC _ 8B. 45, 08
        add     edx, eax                                ; 11EF _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 11F1 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 11F5 _ 88. 02
?_028:  movzx   eax, byte [ebp-5H]                      ; 11F7 _ 0F B6. 45, FB
        and     eax, 02H                                ; 11FB _ 83. E0, 02
        test    eax, eax                                ; 11FE _ 85. C0
        jz      ?_029                                   ; 1200 _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 1202 _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 1205 _ 8B. 55, 14
        add     eax, edx                                ; 1208 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 120A _ 0F AF. 45, 0C
        mov     edx, eax                                ; 120E _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 1210 _ 8B. 45, 10
        add     eax, edx                                ; 1213 _ 01. D0
        lea     edx, [eax+6H]                           ; 1215 _ 8D. 50, 06
        mov     eax, dword [ebp+8H]                     ; 1218 _ 8B. 45, 08
        add     edx, eax                                ; 121B _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 121D _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 1221 _ 88. 02
?_029:  movzx   eax, byte [ebp-5H]                      ; 1223 _ 0F B6. 45, FB
        and     eax, 01H                                ; 1227 _ 83. E0, 01
        test    eax, eax                                ; 122A _ 85. C0
        jz      ?_030                                   ; 122C _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 122E _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 1231 _ 8B. 55, 14
        add     eax, edx                                ; 1234 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 1236 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 123A _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 123C _ 8B. 45, 10
        add     eax, edx                                ; 123F _ 01. D0
        lea     edx, [eax+7H]                           ; 1241 _ 8D. 50, 07
        mov     eax, dword [ebp+8H]                     ; 1244 _ 8B. 45, 08
        add     edx, eax                                ; 1247 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 1249 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 124D _ 88. 02
?_030:  add     dword [ebp-4H], 1                       ; 124F _ 83. 45, FC, 01
?_031:  cmp     dword [ebp-4H], 15                      ; 1253 _ 83. 7D, FC, 0F
        jle     ?_022                                   ; 1257 _ 0F 8E, FFFFFE88
        leave                                           ; 125D _ C9
        ret                                             ; 125E _ C3
; paint_font End of function

paint_string:; Function begin
        push    ebp                                     ; 125F _ 55
        mov     ebp, esp                                ; 1260 _ 89. E5
        push    ebx                                     ; 1262 _ 53
        sub     esp, 52                                 ; 1263 _ 83. EC, 34
        mov     eax, dword [ebp+1CH]                    ; 1266 _ 8B. 45, 1C
        mov     byte [ebp-1CH], al                      ; 1269 _ 88. 45, E4
        mov     eax, dword [ebp+10H]                    ; 126C _ 8B. 45, 10
        mov     dword [ebp-0CH], eax                    ; 126F _ 89. 45, F4
        jmp     ?_033                                   ; 1272 _ EB, 4B

?_032:  movsx   ecx, byte [ebp-1CH]                     ; 1274 _ 0F BE. 4D, E4
        mov     eax, dword [ebp+18H]                    ; 1278 _ 8B. 45, 18
        movzx   eax, byte [eax]                         ; 127B _ 0F B6. 00
        movsx   eax, al                                 ; 127E _ 0F BE. C0
        shl     eax, 4                                  ; 1281 _ C1. E0, 04
        lea     ebx, [systemFont+eax]                   ; 1284 _ 8D. 98, 00000000(d)
        mov     eax, dword [ebp+0CH]                    ; 128A _ 8B. 45, 0C
        mov     edx, dword [eax+4H]                     ; 128D _ 8B. 50, 04
        mov     eax, dword [ebp+0CH]                    ; 1290 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1293 _ 8B. 00
        mov     dword [esp+14H], ecx                    ; 1295 _ 89. 4C 24, 14
        mov     dword [esp+10H], ebx                    ; 1299 _ 89. 5C 24, 10
        mov     ecx, dword [ebp+14H]                    ; 129D _ 8B. 4D, 14
        mov     dword [esp+0CH], ecx                    ; 12A0 _ 89. 4C 24, 0C
        mov     ecx, dword [ebp+10H]                    ; 12A4 _ 8B. 4D, 10
        mov     dword [esp+8H], ecx                     ; 12A7 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 12AB _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 12AF _ 89. 04 24
        call    paint_font                              ; 12B2 _ E8, FFFFFFFC(rel)
        add     dword [ebp+10H], 8                      ; 12B7 _ 83. 45, 10, 08
        add     dword [ebp+18H], 1                      ; 12BB _ 83. 45, 18, 01
?_033:  mov     eax, dword [ebp+18H]                    ; 12BF _ 8B. 45, 18
        movzx   eax, byte [eax]                         ; 12C2 _ 0F B6. 00
        test    al, al                                  ; 12C5 _ 84. C0
        jnz     ?_032                                   ; 12C7 _ 75, AB
        mov     eax, dword [ebp+14H]                    ; 12C9 _ 8B. 45, 14
        add     eax, 16                                 ; 12CC _ 83. C0, 10
        mov     dword [esp+14H], eax                    ; 12CF _ 89. 44 24, 14
        mov     eax, dword [ebp+10H]                    ; 12D3 _ 8B. 45, 10
        mov     dword [esp+10H], eax                    ; 12D6 _ 89. 44 24, 10
        mov     eax, dword [ebp+14H]                    ; 12DA _ 8B. 45, 14
        mov     dword [esp+0CH], eax                    ; 12DD _ 89. 44 24, 0C
        mov     eax, dword [ebp-0CH]                    ; 12E1 _ 8B. 45, F4
        mov     dword [esp+8H], eax                     ; 12E4 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 12E8 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 12EB _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 12EF _ 8B. 45, 08
        mov     dword [esp], eax                        ; 12F2 _ 89. 04 24
        call    sheet_refresh                           ; 12F5 _ E8, FFFFFFFC(rel)
        add     esp, 52                                 ; 12FA _ 83. C4, 34
        pop     ebx                                     ; 12FD _ 5B
        pop     ebp                                     ; 12FE _ 5D
        ret                                             ; 12FF _ C3
; paint_string End of function

init_mouse_cursor:; Function begin
        push    ebp                                     ; 1300 _ 55
        mov     ebp, esp                                ; 1301 _ 89. E5
        sub     esp, 20                                 ; 1303 _ 83. EC, 14
        mov     eax, dword [ebp+0CH]                    ; 1306 _ 8B. 45, 0C
        mov     byte [ebp-14H], al                      ; 1309 _ 88. 45, EC
        mov     dword [ebp-8H], 0                       ; 130C _ C7. 45, F8, 00000000
        jmp     ?_040                                   ; 1313 _ E9, 0000009C

?_034:  mov     dword [ebp-4H], 0                       ; 1318 _ C7. 45, FC, 00000000
        jmp     ?_039                                   ; 131F _ E9, 00000082

?_035:  mov     eax, dword [ebp-8H]                     ; 1324 _ 8B. 45, F8
        shl     eax, 4                                  ; 1327 _ C1. E0, 04
        mov     edx, eax                                ; 132A _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 132C _ 8B. 45, FC
        add     eax, edx                                ; 132F _ 01. D0
        add     eax, cursor.1752                        ; 1331 _ 05, 000000C0(d)
        movzx   eax, byte [eax]                         ; 1336 _ 0F B6. 00
        cmp     al, 42                                  ; 1339 _ 3C, 2A
        jnz     ?_036                                   ; 133B _ 75, 19
        mov     eax, dword [ebp-8H]                     ; 133D _ 8B. 45, F8
        shl     eax, 4                                  ; 1340 _ C1. E0, 04
        mov     edx, eax                                ; 1343 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 1345 _ 8B. 45, FC
        add     eax, edx                                ; 1348 _ 01. D0
        mov     edx, eax                                ; 134A _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 134C _ 8B. 45, 08
        add     eax, edx                                ; 134F _ 01. D0
        mov     byte [eax], 0                           ; 1351 _ C6. 00, 00
        jmp     ?_038                                   ; 1354 _ EB, 4C

?_036:  mov     eax, dword [ebp-8H]                     ; 1356 _ 8B. 45, F8
        shl     eax, 4                                  ; 1359 _ C1. E0, 04
        mov     edx, eax                                ; 135C _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 135E _ 8B. 45, FC
        add     eax, edx                                ; 1361 _ 01. D0
        add     eax, cursor.1752                        ; 1363 _ 05, 000000C0(d)
        movzx   eax, byte [eax]                         ; 1368 _ 0F B6. 00
        cmp     al, 79                                  ; 136B _ 3C, 4F
        jnz     ?_037                                   ; 136D _ 75, 19
        mov     eax, dword [ebp-8H]                     ; 136F _ 8B. 45, F8
        shl     eax, 4                                  ; 1372 _ C1. E0, 04
        mov     edx, eax                                ; 1375 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 1377 _ 8B. 45, FC
        add     eax, edx                                ; 137A _ 01. D0
        mov     edx, eax                                ; 137C _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 137E _ 8B. 45, 08
        add     eax, edx                                ; 1381 _ 01. D0
        mov     byte [eax], 7                           ; 1383 _ C6. 00, 07
        jmp     ?_038                                   ; 1386 _ EB, 1A

?_037:  mov     eax, dword [ebp-8H]                     ; 1388 _ 8B. 45, F8
        shl     eax, 4                                  ; 138B _ C1. E0, 04
        mov     edx, eax                                ; 138E _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 1390 _ 8B. 45, FC
        add     eax, edx                                ; 1393 _ 01. D0
        mov     edx, eax                                ; 1395 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 1397 _ 8B. 45, 08
        add     edx, eax                                ; 139A _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 139C _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 13A0 _ 88. 02
?_038:  add     dword [ebp-4H], 1                       ; 13A2 _ 83. 45, FC, 01
?_039:  cmp     dword [ebp-4H], 15                      ; 13A6 _ 83. 7D, FC, 0F
        jle     ?_035                                   ; 13AA _ 0F 8E, FFFFFF74
        add     dword [ebp-8H], 1                       ; 13B0 _ 83. 45, F8, 01
?_040:  cmp     dword [ebp-8H], 15                      ; 13B4 _ 83. 7D, F8, 0F
        jle     ?_034                                   ; 13B8 _ 0F 8E, FFFFFF5A
        leave                                           ; 13BE _ C9
        ret                                             ; 13BF _ C3
; init_mouse_cursor End of function

paint_block:; Function begin
        push    ebp                                     ; 13C0 _ 55
        mov     ebp, esp                                ; 13C1 _ 89. E5
        sub     esp, 16                                 ; 13C3 _ 83. EC, 10
        mov     dword [ebp-8H], 0                       ; 13C6 _ C7. 45, F8, 00000000
        jmp     ?_044                                   ; 13CD _ EB, 50

?_041:  mov     dword [ebp-4H], 0                       ; 13CF _ C7. 45, FC, 00000000
        jmp     ?_043                                   ; 13D6 _ EB, 3B

?_042:  mov     eax, dword [ebp-8H]                     ; 13D8 _ 8B. 45, F8
        mov     edx, dword [ebp+14H]                    ; 13DB _ 8B. 55, 14
        add     eax, edx                                ; 13DE _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 13E0 _ 0F AF. 45, 0C
        mov     edx, dword [ebp-4H]                     ; 13E4 _ 8B. 55, FC
        mov     ecx, dword [ebp+10H]                    ; 13E7 _ 8B. 4D, 10
        add     edx, ecx                                ; 13EA _ 01. CA
        add     eax, edx                                ; 13EC _ 01. D0
        mov     edx, eax                                ; 13EE _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 13F0 _ 8B. 45, 08
        add     edx, eax                                ; 13F3 _ 01. C2
        mov     eax, dword [ebp-8H]                     ; 13F5 _ 8B. 45, F8
        imul    eax, dword [ebp+18H]                    ; 13F8 _ 0F AF. 45, 18
        mov     ecx, eax                                ; 13FC _ 89. C1
        mov     eax, dword [ebp-4H]                     ; 13FE _ 8B. 45, FC
        add     eax, ecx                                ; 1401 _ 01. C8
        mov     ecx, eax                                ; 1403 _ 89. C1
        mov     eax, dword [ebp+20H]                    ; 1405 _ 8B. 45, 20
        add     eax, ecx                                ; 1408 _ 01. C8
        movzx   eax, byte [eax]                         ; 140A _ 0F B6. 00
        mov     byte [edx], al                          ; 140D _ 88. 02
        add     dword [ebp-4H], 1                       ; 140F _ 83. 45, FC, 01
?_043:  mov     eax, dword [ebp-4H]                     ; 1413 _ 8B. 45, FC
        cmp     eax, dword [ebp+18H]                    ; 1416 _ 3B. 45, 18
        jl      ?_042                                   ; 1419 _ 7C, BD
        add     dword [ebp-8H], 1                       ; 141B _ 83. 45, F8, 01
?_044:  mov     eax, dword [ebp-8H]                     ; 141F _ 8B. 45, F8
        cmp     eax, dword [ebp+1CH]                    ; 1422 _ 3B. 45, 1C
        jl      ?_041                                   ; 1425 _ 7C, A8
        leave                                           ; 1427 _ C9
        ret                                             ; 1428 _ C3
; paint_block End of function

init_fifo_buf:; Function begin
        push    ebp                                     ; 1429 _ 55
        mov     ebp, esp                                ; 142A _ 89. E5
        sub     esp, 24                                 ; 142C _ 83. EC, 18
        mov     dword [esp+0CH], 0                      ; 142F _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], mousebuf                ; 1437 _ C7. 44 24, 08, 00000000(d)
        mov     dword [esp+4H], 128                     ; 143F _ C7. 44 24, 04, 00000080
        mov     dword [esp], mouseinfo                  ; 1447 _ C7. 04 24, 00000000(d)
        call    fifo8_init                              ; 144E _ E8, FFFFFFFC(rel)
        mov     dword [esp+0CH], 0                      ; 1453 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], keybuf                  ; 145B _ C7. 44 24, 08, 00000000(d)
        mov     dword [esp+4H], 32                      ; 1463 _ C7. 44 24, 04, 00000020
        mov     dword [esp], keyinfo                    ; 146B _ C7. 04 24, 00000000(d)
        call    fifo8_init                              ; 1472 _ E8, FFFFFFFC(rel)
        leave                                           ; 1477 _ C9
        ret                                             ; 1478 _ C3
; init_fifo_buf End of function

compute_mouse_position:; Function begin
        push    ebp                                     ; 1479 _ 55
        mov     ebp, esp                                ; 147A _ 89. E5
        mov     eax, dword [ebp+10H]                    ; 147C _ 8B. 45, 10
        mov     edx, dword [eax+4H]                     ; 147F _ 8B. 50, 04
        mov     eax, dword [mouse_x]                    ; 1482 _ A1, 000002A8(d)
        add     eax, edx                                ; 1487 _ 01. D0
        mov     dword [mouse_x], eax                    ; 1489 _ A3, 000002A8(d)
        mov     eax, dword [ebp+10H]                    ; 148E _ 8B. 45, 10
        mov     edx, dword [eax+8H]                     ; 1491 _ 8B. 50, 08
        mov     eax, dword [mouse_y]                    ; 1494 _ A1, 000002AC(d)
        add     eax, edx                                ; 1499 _ 01. D0
        mov     dword [mouse_y], eax                    ; 149B _ A3, 000002AC(d)
        mov     eax, dword [mouse_x]                    ; 14A0 _ A1, 000002A8(d)
        test    eax, eax                                ; 14A5 _ 85. C0
        jns     ?_045                                   ; 14A7 _ 79, 0A
        mov     dword [mouse_x], 0                      ; 14A9 _ C7. 05, 000002A8(d), 00000000
?_045:  mov     eax, dword [mouse_y]                    ; 14B3 _ A1, 000002AC(d)
        test    eax, eax                                ; 14B8 _ 85. C0
        jns     ?_046                                   ; 14BA _ 79, 0A
        mov     dword [mouse_y], 0                      ; 14BC _ C7. 05, 000002AC(d), 00000000
?_046:  movzx   eax, word [?_200]                       ; 14C6 _ 0F B7. 05, 00000184(d)
        cwde                                            ; 14CD _ 98
        lea     edx, [eax-10H]                          ; 14CE _ 8D. 50, F0
        mov     eax, dword [mouse_x]                    ; 14D1 _ A1, 000002A8(d)
        cmp     edx, eax                                ; 14D6 _ 39. C2
        jge     ?_047                                   ; 14D8 _ 7D, 10
        movzx   eax, word [?_200]                       ; 14DA _ 0F B7. 05, 00000184(d)
        cwde                                            ; 14E1 _ 98
        sub     eax, 16                                 ; 14E2 _ 83. E8, 10
        mov     dword [mouse_x], eax                    ; 14E5 _ A3, 000002A8(d)
?_047:  movzx   eax, word [?_200]                       ; 14EA _ 0F B7. 05, 00000184(d)
        cwde                                            ; 14F1 _ 98
        lea     edx, [eax-10H]                          ; 14F2 _ 8D. 50, F0
        mov     eax, dword [mouse_y]                    ; 14F5 _ A1, 000002AC(d)
        cmp     edx, eax                                ; 14FA _ 39. C2
        jge     ?_048                                   ; 14FC _ 7D, 10
        movzx   eax, word [?_200]                       ; 14FE _ 0F B7. 05, 00000184(d)
        cwde                                            ; 1505 _ 98
        sub     eax, 16                                 ; 1506 _ 83. E8, 10
        mov     dword [mouse_y], eax                    ; 1509 _ A3, 000002AC(d)
?_048:  pop     ebp                                     ; 150E _ 5D
        ret                                             ; 150F _ C3
; compute_mouse_position End of function

show_mouse_info:; Function begin
        push    ebp                                     ; 1510 _ 55
        mov     ebp, esp                                ; 1511 _ 89. E5
        sub     esp, 40                                 ; 1513 _ 83. EC, 28
        mov     byte [ebp-9H], 0                        ; 1516 _ C6. 45, F7, 00
        call    io_sti                                  ; 151A _ E8, FFFFFFFC(rel)
        mov     dword [esp], mouseinfo                  ; 151F _ C7. 04 24, 00000000(d)
        call    fifo8_get                               ; 1526 _ E8, FFFFFFFC(rel)
        mov     byte [ebp-9H], al                       ; 152B _ 88. 45, F7
        movzx   eax, byte [ebp-9H]                      ; 152E _ 0F B6. 45, F7
        mov     dword [esp+4H], eax                     ; 1532 _ 89. 44 24, 04
        mov     dword [esp], mouse_send_info            ; 1536 _ C7. 04 24, 00000000(d)
        call    mouse_decode                            ; 153D _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 1542 _ 85. C0
        jz      ?_049                                   ; 1544 _ 74, 77
        mov     dword [esp+8H], mouse_send_info         ; 1546 _ C7. 44 24, 08, 00000000(d)
        mov     eax, dword [ebp+0CH]                    ; 154E _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 1551 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1555 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1558 _ 89. 04 24
        call    compute_mouse_position                  ; 155B _ E8, FFFFFFFC(rel)
        mov     edx, dword [mouse_y]                    ; 1560 _ 8B. 15, 000002AC(d)
        mov     eax, dword [mouse_x]                    ; 1566 _ A1, 000002A8(d)
        mov     dword [esp+0CH], edx                    ; 156B _ 89. 54 24, 0C
        mov     dword [esp+8H], eax                     ; 156F _ 89. 44 24, 08
        mov     eax, dword [ebp+10H]                    ; 1573 _ 8B. 45, 10
        mov     dword [esp+4H], eax                     ; 1576 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 157A _ 8B. 45, 08
        mov     dword [esp], eax                        ; 157D _ 89. 04 24
        call    sheet_slide                             ; 1580 _ E8, FFFFFFFC(rel)
        mov     eax, dword [mouse_send_info+0CH]        ; 1585 _ A1, 0000000C(d)
        and     eax, 01H                                ; 158A _ 83. E0, 01
        test    eax, eax                                ; 158D _ 85. C0
        jz      ?_049                                   ; 158F _ 74, 2C
        mov     eax, dword [mouse_y]                    ; 1591 _ A1, 000002AC(d)
        lea     ecx, [eax-8H]                           ; 1596 _ 8D. 48, F8
        mov     eax, dword [mouse_x]                    ; 1599 _ A1, 000002A8(d)
        lea     edx, [eax-50H]                          ; 159E _ 8D. 50, B0
        mov     eax, dword [sheet_win]                  ; 15A1 _ A1, 000002A4(d)
        mov     dword [esp+0CH], ecx                    ; 15A6 _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 15AA _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 15AE _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 15B2 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 15B5 _ 89. 04 24
        call    sheet_slide                             ; 15B8 _ E8, FFFFFFFC(rel)
?_049:  leave                                           ; 15BD _ C9
        ret                                             ; 15BE _ C3
; show_mouse_info End of function

show_memory_info:; Function begin
        push    ebp                                     ; 15BF _ 55
        mov     ebp, esp                                ; 15C0 _ 89. E5
        sub     esp, 88                                 ; 15C2 _ 83. EC, 58
        mov     dword [ebp-38H], 0                      ; 15C5 _ C7. 45, C8, 00000000
        mov     dword [ebp-34H], 0                      ; 15CC _ C7. 45, CC, 00000000
        mov     dword [ebp-30H], 104                    ; 15D3 _ C7. 45, D0, 00000068
        mov     eax, dword [screen_info]                ; 15DA _ A1, 00000180(d)
        mov     dword [ebp-2CH], eax                    ; 15DF _ 89. 45, D4
        movzx   eax, word [?_200]                       ; 15E2 _ 0F B7. 05, 00000184(d)
        cwde                                            ; 15E9 _ 98
        mov     dword [ebp-28H], eax                    ; 15EA _ 89. 45, D8
        movzx   eax, word [?_201]                       ; 15ED _ 0F B7. 05, 00000186(d)
        cwde                                            ; 15F4 _ 98
        mov     dword [ebp-24H], eax                    ; 15F5 _ 89. 45, DC
        mov     eax, dword [ebp+0CH]                    ; 15F8 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 15FB _ 8B. 00
        mov     edx, dword [ebp-24H]                    ; 15FD _ 8B. 55, DC
        mov     dword [esp+8H], edx                     ; 1600 _ 89. 54 24, 08
        mov     edx, dword [ebp-28H]                    ; 1604 _ 8B. 55, D8
        mov     dword [esp+4H], edx                     ; 1607 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 160B _ 89. 04 24
        call    init_desktop                            ; 160E _ E8, FFFFFFFC(rel)
        mov     dword [esp+14H], 7                      ; 1613 _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_192                  ; 161B _ C7. 44 24, 10, 00000018(d)
        mov     eax, dword [ebp-34H]                    ; 1623 _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 1626 _ 89. 44 24, 0C
        mov     eax, dword [ebp-38H]                    ; 162A _ 8B. 45, C8
        mov     dword [esp+8H], eax                     ; 162D _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 1631 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 1634 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1638 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 163B _ 89. 04 24
        call    paint_string                            ; 163E _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+14H]                    ; 1643 _ 8B. 45, 14
        mov     dword [esp], eax                        ; 1646 _ 89. 04 24
        call    intToHexStr                             ; 1649 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-20H], eax                    ; 164E _ 89. 45, E0
        mov     dword [esp+14H], 7                      ; 1651 _ C7. 44 24, 14, 00000007
        mov     eax, dword [ebp-20H]                    ; 1659 _ 8B. 45, E0
        mov     dword [esp+10H], eax                    ; 165C _ 89. 44 24, 10
        mov     eax, dword [ebp-34H]                    ; 1660 _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 1663 _ 89. 44 24, 0C
        mov     eax, dword [ebp-30H]                    ; 1667 _ 8B. 45, D0
        mov     dword [esp+8H], eax                     ; 166A _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 166E _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 1671 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1675 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1678 _ 89. 04 24
        call    paint_string                            ; 167B _ E8, FFFFFFFC(rel)
        add     dword [ebp-34H], 16                     ; 1680 _ 83. 45, CC, 10
        mov     dword [esp+14H], 7                      ; 1684 _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_193                  ; 168C _ C7. 44 24, 10, 00000022(d)
        mov     eax, dword [ebp-34H]                    ; 1694 _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 1697 _ 89. 44 24, 0C
        mov     eax, dword [ebp-38H]                    ; 169B _ 8B. 45, C8
        mov     dword [esp+8H], eax                     ; 169E _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 16A2 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 16A5 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 16A9 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 16AC _ 89. 04 24
        call    paint_string                            ; 16AF _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 16B4 _ 8B. 45, 10
        mov     eax, dword [eax]                        ; 16B7 _ 8B. 00
        mov     dword [esp], eax                        ; 16B9 _ 89. 04 24
        call    intToHexStr                             ; 16BC _ E8, FFFFFFFC(rel)
        mov     dword [ebp-1CH], eax                    ; 16C1 _ 89. 45, E4
        mov     dword [esp+14H], 7                      ; 16C4 _ C7. 44 24, 14, 00000007
        mov     eax, dword [ebp-1CH]                    ; 16CC _ 8B. 45, E4
        mov     dword [esp+10H], eax                    ; 16CF _ 89. 44 24, 10
        mov     eax, dword [ebp-34H]                    ; 16D3 _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 16D6 _ 89. 44 24, 0C
        mov     eax, dword [ebp-30H]                    ; 16DA _ 8B. 45, D0
        mov     dword [esp+8H], eax                     ; 16DD _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 16E1 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 16E4 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 16E8 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 16EB _ 89. 04 24
        call    paint_string                            ; 16EE _ E8, FFFFFFFC(rel)
        add     dword [ebp-34H], 16                     ; 16F3 _ 83. 45, CC, 10
        mov     dword [esp+14H], 7                      ; 16F7 _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_194                  ; 16FF _ C7. 44 24, 10, 0000002E(d)
        mov     eax, dword [ebp-34H]                    ; 1707 _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 170A _ 89. 44 24, 0C
        mov     eax, dword [ebp-38H]                    ; 170E _ 8B. 45, C8
        mov     dword [esp+8H], eax                     ; 1711 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 1715 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 1718 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 171C _ 8B. 45, 08
        mov     dword [esp], eax                        ; 171F _ 89. 04 24
        call    paint_string                            ; 1722 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 1727 _ 8B. 45, 10
        mov     eax, dword [eax+4H]                     ; 172A _ 8B. 40, 04
        mov     dword [esp], eax                        ; 172D _ 89. 04 24
        call    intToHexStr                             ; 1730 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-18H], eax                    ; 1735 _ 89. 45, E8
        mov     dword [esp+14H], 7                      ; 1738 _ C7. 44 24, 14, 00000007
        mov     eax, dword [ebp-18H]                    ; 1740 _ 8B. 45, E8
        mov     dword [esp+10H], eax                    ; 1743 _ 89. 44 24, 10
        mov     eax, dword [ebp-34H]                    ; 1747 _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 174A _ 89. 44 24, 0C
        mov     eax, dword [ebp-30H]                    ; 174E _ 8B. 45, D0
        mov     dword [esp+8H], eax                     ; 1751 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 1755 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 1758 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 175C _ 8B. 45, 08
        mov     dword [esp], eax                        ; 175F _ 89. 04 24
        call    paint_string                            ; 1762 _ E8, FFFFFFFC(rel)
        add     dword [ebp-34H], 16                     ; 1767 _ 83. 45, CC, 10
        mov     dword [esp+14H], 7                      ; 176B _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_195                  ; 1773 _ C7. 44 24, 10, 0000003A(d)
        mov     eax, dword [ebp-34H]                    ; 177B _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 177E _ 89. 44 24, 0C
        mov     eax, dword [ebp-38H]                    ; 1782 _ 8B. 45, C8
        mov     dword [esp+8H], eax                     ; 1785 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 1789 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 178C _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1790 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1793 _ 89. 04 24
        call    paint_string                            ; 1796 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 179B _ 8B. 45, 10
        mov     eax, dword [eax+8H]                     ; 179E _ 8B. 40, 08
        mov     dword [esp], eax                        ; 17A1 _ 89. 04 24
        call    intToHexStr                             ; 17A4 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-14H], eax                    ; 17A9 _ 89. 45, EC
        mov     dword [esp+14H], 7                      ; 17AC _ C7. 44 24, 14, 00000007
        mov     eax, dword [ebp-14H]                    ; 17B4 _ 8B. 45, EC
        mov     dword [esp+10H], eax                    ; 17B7 _ 89. 44 24, 10
        mov     eax, dword [ebp-34H]                    ; 17BB _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 17BE _ 89. 44 24, 0C
        mov     eax, dword [ebp-30H]                    ; 17C2 _ 8B. 45, D0
        mov     dword [esp+8H], eax                     ; 17C5 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 17C9 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 17CC _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 17D0 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 17D3 _ 89. 04 24
        call    paint_string                            ; 17D6 _ E8, FFFFFFFC(rel)
        add     dword [ebp-34H], 16                     ; 17DB _ 83. 45, CC, 10
        mov     dword [esp+14H], 7                      ; 17DF _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_196                  ; 17E7 _ C7. 44 24, 10, 00000046(d)
        mov     eax, dword [ebp-34H]                    ; 17EF _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 17F2 _ 89. 44 24, 0C
        mov     eax, dword [ebp-38H]                    ; 17F6 _ 8B. 45, C8
        mov     dword [esp+8H], eax                     ; 17F9 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 17FD _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 1800 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1804 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1807 _ 89. 04 24
        call    paint_string                            ; 180A _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 180F _ 8B. 45, 10
        mov     eax, dword [eax+0CH]                    ; 1812 _ 8B. 40, 0C
        mov     dword [esp], eax                        ; 1815 _ 89. 04 24
        call    intToHexStr                             ; 1818 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 181D _ 89. 45, F0
        mov     dword [esp+14H], 7                      ; 1820 _ C7. 44 24, 14, 00000007
        mov     eax, dword [ebp-10H]                    ; 1828 _ 8B. 45, F0
        mov     dword [esp+10H], eax                    ; 182B _ 89. 44 24, 10
        mov     eax, dword [ebp-34H]                    ; 182F _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 1832 _ 89. 44 24, 0C
        mov     eax, dword [ebp-30H]                    ; 1836 _ 8B. 45, D0
        mov     dword [esp+8H], eax                     ; 1839 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 183D _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 1840 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1844 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1847 _ 89. 04 24
        call    paint_string                            ; 184A _ E8, FFFFFFFC(rel)
        add     dword [ebp-34H], 16                     ; 184F _ 83. 45, CC, 10
        mov     dword [esp+14H], 7                      ; 1853 _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_197                  ; 185B _ C7. 44 24, 10, 00000053(d)
        mov     eax, dword [ebp-34H]                    ; 1863 _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 1866 _ 89. 44 24, 0C
        mov     eax, dword [ebp-38H]                    ; 186A _ 8B. 45, C8
        mov     dword [esp+8H], eax                     ; 186D _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 1871 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 1874 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1878 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 187B _ 89. 04 24
        call    paint_string                            ; 187E _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 1883 _ 8B. 45, 10
        mov     eax, dword [eax+10H]                    ; 1886 _ 8B. 40, 10
        mov     dword [esp], eax                        ; 1889 _ 89. 04 24
        call    intToHexStr                             ; 188C _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 1891 _ 89. 45, F4
        mov     dword [esp+14H], 7                      ; 1894 _ C7. 44 24, 14, 00000007
        mov     eax, dword [ebp-0CH]                    ; 189C _ 8B. 45, F4
        mov     dword [esp+10H], eax                    ; 189F _ 89. 44 24, 10
        mov     eax, dword [ebp-34H]                    ; 18A3 _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 18A6 _ 89. 44 24, 0C
        mov     eax, dword [ebp-30H]                    ; 18AA _ 8B. 45, D0
        mov     dword [esp+8H], eax                     ; 18AD _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 18B1 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 18B4 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 18B8 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 18BB _ 89. 04 24
        call    paint_string                            ; 18BE _ E8, FFFFFFFC(rel)
        add     dword [ebp-34H], 16                     ; 18C3 _ 83. 45, CC, 10
        leave                                           ; 18C7 _ C9
        ret                                             ; 18C8 _ C3
; show_memory_info End of function

message_box:; Function begin
        push    ebp                                     ; 18C9 _ 55
        mov     ebp, esp                                ; 18CA _ 89. E5
        sub     esp, 56                                 ; 18CC _ 83. EC, 38
        mov     eax, dword [ebp+8H]                     ; 18CF _ 8B. 45, 08
        mov     dword [esp], eax                        ; 18D2 _ 89. 04 24
        call    sheet_alloc                             ; 18D5 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 18DA _ 89. 45, F0
        mov     eax, dword [memman]                     ; 18DD _ A1, 00000000(d)
        mov     dword [esp+4H], 10880                   ; 18E2 _ C7. 44 24, 04, 00002A80
        mov     dword [esp], eax                        ; 18EA _ 89. 04 24
        call    memman_alloc_4k                         ; 18ED _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 18F2 _ 89. 45, F4
        mov     dword [esp+10H], 99                     ; 18F5 _ C7. 44 24, 10, 00000063
        mov     dword [esp+0CH], 68                     ; 18FD _ C7. 44 24, 0C, 00000044
        mov     dword [esp+8H], 160                     ; 1905 _ C7. 44 24, 08, 000000A0
        mov     eax, dword [ebp-0CH]                    ; 190D _ 8B. 45, F4
        mov     dword [esp+4H], eax                     ; 1910 _ 89. 44 24, 04
        mov     eax, dword [ebp-10H]                    ; 1914 _ 8B. 45, F0
        mov     dword [esp], eax                        ; 1917 _ 89. 04 24
        call    sheet_setbuf                            ; 191A _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+0CH]                    ; 191F _ 8B. 45, 0C
        mov     dword [esp+8H], eax                     ; 1922 _ 89. 44 24, 08
        mov     eax, dword [ebp-10H]                    ; 1926 _ 8B. 45, F0
        mov     dword [esp+4H], eax                     ; 1929 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 192D _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1930 _ 89. 04 24
        call    make_windows                            ; 1933 _ E8, FFFFFFFC(rel)
        mov     dword [esp+14H], 7                      ; 1938 _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], 16                     ; 1940 _ C7. 44 24, 10, 00000010
        mov     dword [esp+0CH], 144                    ; 1948 _ C7. 44 24, 0C, 00000090
        mov     dword [esp+8H], 28                      ; 1950 _ C7. 44 24, 08, 0000001C
        mov     dword [esp+4H], 8                       ; 1958 _ C7. 44 24, 04, 00000008
        mov     eax, dword [ebp-10H]                    ; 1960 _ 8B. 45, F0
        mov     dword [esp], eax                        ; 1963 _ 89. 04 24
        call    make_textbox                            ; 1966 _ E8, FFFFFFFC(rel)
        mov     dword [esp+0CH], 172                    ; 196B _ C7. 44 24, 0C, 000000AC
        mov     dword [esp+8H], 260                     ; 1973 _ C7. 44 24, 08, 00000104
        mov     eax, dword [ebp-10H]                    ; 197B _ 8B. 45, F0
        mov     dword [esp+4H], eax                     ; 197E _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1982 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1985 _ 89. 04 24
        call    sheet_slide                             ; 1988 _ E8, FFFFFFFC(rel)
        mov     dword [esp+8H], 2                       ; 198D _ C7. 44 24, 08, 00000002
        mov     eax, dword [ebp-10H]                    ; 1995 _ 8B. 45, F0
        mov     dword [esp+4H], eax                     ; 1998 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 199C _ 8B. 45, 08
        mov     dword [esp], eax                        ; 199F _ 89. 04 24
        call    sheet_updown                            ; 19A2 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 19A7 _ 8B. 45, F0
        leave                                           ; 19AA _ C9
        ret                                             ; 19AB _ C3
; message_box End of function

make_textbox:; Function begin
        push    ebp                                     ; 19AC _ 55
        mov     ebp, esp                                ; 19AD _ 89. E5
        push    edi                                     ; 19AF _ 57
        push    esi                                     ; 19B0 _ 56
        push    ebx                                     ; 19B1 _ 53
        sub     esp, 44                                 ; 19B2 _ 83. EC, 2C
        mov     eax, dword [ebp+14H]                    ; 19B5 _ 8B. 45, 14
        mov     edx, dword [ebp+0CH]                    ; 19B8 _ 8B. 55, 0C
        add     eax, edx                                ; 19BB _ 01. D0
        mov     dword [ebp-14H], eax                    ; 19BD _ 89. 45, EC
        mov     eax, dword [ebp+18H]                    ; 19C0 _ 8B. 45, 18
        mov     edx, dword [ebp+10H]                    ; 19C3 _ 8B. 55, 10
        add     eax, edx                                ; 19C6 _ 01. D0
        mov     dword [ebp-10H], eax                    ; 19C8 _ 89. 45, F0
        mov     eax, dword [ebp+10H]                    ; 19CB _ 8B. 45, 10
        lea     edi, [eax-3H]                           ; 19CE _ 8D. 78, FD
        mov     eax, dword [ebp-14H]                    ; 19D1 _ 8B. 45, EC
        lea     esi, [eax+1H]                           ; 19D4 _ 8D. 70, 01
        mov     eax, dword [ebp+10H]                    ; 19D7 _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 19DA _ 8D. 58, FD
        mov     eax, dword [ebp+0CH]                    ; 19DD _ 8B. 45, 0C
        lea     ecx, [eax-2H]                           ; 19E0 _ 8D. 48, FE
        mov     eax, dword [ebp+8H]                     ; 19E3 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 19E6 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 19E9 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 19EC _ 8B. 00
        mov     dword [esp+18H], edi                    ; 19EE _ 89. 7C 24, 18
        mov     dword [esp+14H], esi                    ; 19F2 _ 89. 74 24, 14
        mov     dword [esp+10H], ebx                    ; 19F6 _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 19FA _ 89. 4C 24, 0C
        mov     dword [esp+8H], 15                      ; 19FE _ C7. 44 24, 08, 0000000F
        mov     dword [esp+4H], edx                     ; 1A06 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1A0A _ 89. 04 24
        call    paint_rectangle                         ; 1A0D _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 1A12 _ 8B. 45, F0
        lea     edi, [eax+1H]                           ; 1A15 _ 8D. 78, 01
        mov     eax, dword [ebp+0CH]                    ; 1A18 _ 8B. 45, 0C
        lea     esi, [eax-3H]                           ; 1A1B _ 8D. 70, FD
        mov     eax, dword [ebp+10H]                    ; 1A1E _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 1A21 _ 8D. 58, FD
        mov     eax, dword [ebp+0CH]                    ; 1A24 _ 8B. 45, 0C
        lea     ecx, [eax-3H]                           ; 1A27 _ 8D. 48, FD
        mov     eax, dword [ebp+8H]                     ; 1A2A _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 1A2D _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1A30 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1A33 _ 8B. 00
        mov     dword [esp+18H], edi                    ; 1A35 _ 89. 7C 24, 18
        mov     dword [esp+14H], esi                    ; 1A39 _ 89. 74 24, 14
        mov     dword [esp+10H], ebx                    ; 1A3D _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 1A41 _ 89. 4C 24, 0C
        mov     dword [esp+8H], 15                      ; 1A45 _ C7. 44 24, 08, 0000000F
        mov     dword [esp+4H], edx                     ; 1A4D _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1A51 _ 89. 04 24
        call    paint_rectangle                         ; 1A54 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 1A59 _ 8B. 45, F0
        lea     edi, [eax+2H]                           ; 1A5C _ 8D. 78, 02
        mov     eax, dword [ebp-14H]                    ; 1A5F _ 8B. 45, EC
        lea     esi, [eax+1H]                           ; 1A62 _ 8D. 70, 01
        mov     eax, dword [ebp-10H]                    ; 1A65 _ 8B. 45, F0
        lea     ebx, [eax+2H]                           ; 1A68 _ 8D. 58, 02
        mov     eax, dword [ebp+0CH]                    ; 1A6B _ 8B. 45, 0C
        lea     ecx, [eax-3H]                           ; 1A6E _ 8D. 48, FD
        mov     eax, dword [ebp+8H]                     ; 1A71 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 1A74 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1A77 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1A7A _ 8B. 00
        mov     dword [esp+18H], edi                    ; 1A7C _ 89. 7C 24, 18
        mov     dword [esp+14H], esi                    ; 1A80 _ 89. 74 24, 14
        mov     dword [esp+10H], ebx                    ; 1A84 _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 1A88 _ 89. 4C 24, 0C
        mov     dword [esp+8H], 7                       ; 1A8C _ C7. 44 24, 08, 00000007
        mov     dword [esp+4H], edx                     ; 1A94 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1A98 _ 89. 04 24
        call    paint_rectangle                         ; 1A9B _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 1AA0 _ 8B. 45, F0
        lea     edi, [eax+2H]                           ; 1AA3 _ 8D. 78, 02
        mov     eax, dword [ebp-14H]                    ; 1AA6 _ 8B. 45, EC
        lea     esi, [eax+2H]                           ; 1AA9 _ 8D. 70, 02
        mov     eax, dword [ebp+10H]                    ; 1AAC _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 1AAF _ 8D. 58, FD
        mov     eax, dword [ebp-14H]                    ; 1AB2 _ 8B. 45, EC
        lea     ecx, [eax+2H]                           ; 1AB5 _ 8D. 48, 02
        mov     eax, dword [ebp+8H]                     ; 1AB8 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 1ABB _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1ABE _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1AC1 _ 8B. 00
        mov     dword [esp+18H], edi                    ; 1AC3 _ 89. 7C 24, 18
        mov     dword [esp+14H], esi                    ; 1AC7 _ 89. 74 24, 14
        mov     dword [esp+10H], ebx                    ; 1ACB _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 1ACF _ 89. 4C 24, 0C
        mov     dword [esp+8H], 7                       ; 1AD3 _ C7. 44 24, 08, 00000007
        mov     dword [esp+4H], edx                     ; 1ADB _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1ADF _ 89. 04 24
        call    paint_rectangle                         ; 1AE2 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 1AE7 _ 8B. 45, 10
        lea     ecx, [eax-2H]                           ; 1AEA _ 8D. 48, FE
        mov     eax, dword [ebp+10H]                    ; 1AED _ 8B. 45, 10
        lea     esi, [eax-2H]                           ; 1AF0 _ 8D. 70, FE
        mov     eax, dword [ebp+0CH]                    ; 1AF3 _ 8B. 45, 0C
        lea     ebx, [eax-1H]                           ; 1AF6 _ 8D. 58, FF
        mov     eax, dword [ebp+8H]                     ; 1AF9 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 1AFC _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1AFF _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1B02 _ 8B. 00
        mov     dword [esp+18H], ecx                    ; 1B04 _ 89. 4C 24, 18
        mov     ecx, dword [ebp-14H]                    ; 1B08 _ 8B. 4D, EC
        mov     dword [esp+14H], ecx                    ; 1B0B _ 89. 4C 24, 14
        mov     dword [esp+10H], esi                    ; 1B0F _ 89. 74 24, 10
        mov     dword [esp+0CH], ebx                    ; 1B13 _ 89. 5C 24, 0C
        mov     dword [esp+8H], 0                       ; 1B17 _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], edx                     ; 1B1F _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1B23 _ 89. 04 24
        call    paint_rectangle                         ; 1B26 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+0CH]                    ; 1B2B _ 8B. 45, 0C
        lea     edi, [eax-2H]                           ; 1B2E _ 8D. 78, FE
        mov     eax, dword [ebp+10H]                    ; 1B31 _ 8B. 45, 10
        lea     esi, [eax-2H]                           ; 1B34 _ 8D. 70, FE
        mov     eax, dword [ebp+0CH]                    ; 1B37 _ 8B. 45, 0C
        lea     ebx, [eax-2H]                           ; 1B3A _ 8D. 58, FE
        mov     eax, dword [ebp+8H]                     ; 1B3D _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 1B40 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1B43 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1B46 _ 8B. 00
        mov     ecx, dword [ebp-10H]                    ; 1B48 _ 8B. 4D, F0
        mov     dword [esp+18H], ecx                    ; 1B4B _ 89. 4C 24, 18
        mov     dword [esp+14H], edi                    ; 1B4F _ 89. 7C 24, 14
        mov     dword [esp+10H], esi                    ; 1B53 _ 89. 74 24, 10
        mov     dword [esp+0CH], ebx                    ; 1B57 _ 89. 5C 24, 0C
        mov     dword [esp+8H], 0                       ; 1B5B _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], edx                     ; 1B63 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1B67 _ 89. 04 24
        call    paint_rectangle                         ; 1B6A _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 1B6F _ 8B. 45, F0
        lea     ecx, [eax+1H]                           ; 1B72 _ 8D. 48, 01
        mov     eax, dword [ebp-10H]                    ; 1B75 _ 8B. 45, F0
        lea     esi, [eax+1H]                           ; 1B78 _ 8D. 70, 01
        mov     eax, dword [ebp+0CH]                    ; 1B7B _ 8B. 45, 0C
        lea     ebx, [eax-2H]                           ; 1B7E _ 8D. 58, FE
        mov     eax, dword [ebp+8H]                     ; 1B81 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 1B84 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1B87 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1B8A _ 8B. 00
        mov     dword [esp+18H], ecx                    ; 1B8C _ 89. 4C 24, 18
        mov     ecx, dword [ebp-14H]                    ; 1B90 _ 8B. 4D, EC
        mov     dword [esp+14H], ecx                    ; 1B93 _ 89. 4C 24, 14
        mov     dword [esp+10H], esi                    ; 1B97 _ 89. 74 24, 10
        mov     dword [esp+0CH], ebx                    ; 1B9B _ 89. 5C 24, 0C
        mov     dword [esp+8H], 8                       ; 1B9F _ C7. 44 24, 08, 00000008
        mov     dword [esp+4H], edx                     ; 1BA7 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1BAB _ 89. 04 24
        call    paint_rectangle                         ; 1BAE _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 1BB3 _ 8B. 45, F0
        lea     edi, [eax+1H]                           ; 1BB6 _ 8D. 78, 01
        mov     eax, dword [ebp-14H]                    ; 1BB9 _ 8B. 45, EC
        lea     esi, [eax+1H]                           ; 1BBC _ 8D. 70, 01
        mov     eax, dword [ebp+10H]                    ; 1BBF _ 8B. 45, 10
        lea     ebx, [eax-2H]                           ; 1BC2 _ 8D. 58, FE
        mov     eax, dword [ebp-14H]                    ; 1BC5 _ 8B. 45, EC
        lea     ecx, [eax+1H]                           ; 1BC8 _ 8D. 48, 01
        mov     eax, dword [ebp+8H]                     ; 1BCB _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 1BCE _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1BD1 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1BD4 _ 8B. 00
        mov     dword [esp+18H], edi                    ; 1BD6 _ 89. 7C 24, 18
        mov     dword [esp+14H], esi                    ; 1BDA _ 89. 74 24, 14
        mov     dword [esp+10H], ebx                    ; 1BDE _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 1BE2 _ 89. 4C 24, 0C
        mov     dword [esp+8H], 8                       ; 1BE6 _ C7. 44 24, 08, 00000008
        mov     dword [esp+4H], edx                     ; 1BEE _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1BF2 _ 89. 04 24
        call    paint_rectangle                         ; 1BF5 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 1BFA _ 8B. 45, 10
        lea     edi, [eax-1H]                           ; 1BFD _ 8D. 78, FF
        mov     eax, dword [ebp+0CH]                    ; 1C00 _ 8B. 45, 0C
        lea     esi, [eax-1H]                           ; 1C03 _ 8D. 70, FF
        mov     eax, dword [ebp+1CH]                    ; 1C06 _ 8B. 45, 1C
        movzx   ecx, al                                 ; 1C09 _ 0F B6. C8
        mov     eax, dword [ebp+8H]                     ; 1C0C _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 1C0F _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1C12 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1C15 _ 8B. 00
        mov     ebx, dword [ebp-10H]                    ; 1C17 _ 8B. 5D, F0
        mov     dword [esp+18H], ebx                    ; 1C1A _ 89. 5C 24, 18
        mov     ebx, dword [ebp-14H]                    ; 1C1E _ 8B. 5D, EC
        mov     dword [esp+14H], ebx                    ; 1C21 _ 89. 5C 24, 14
        mov     dword [esp+10H], edi                    ; 1C25 _ 89. 7C 24, 10
        mov     dword [esp+0CH], esi                    ; 1C29 _ 89. 74 24, 0C
        mov     dword [esp+8H], ecx                     ; 1C2D _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 1C31 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1C35 _ 89. 04 24
        call    paint_rectangle                         ; 1C38 _ E8, FFFFFFFC(rel)
        add     esp, 44                                 ; 1C3D _ 83. C4, 2C
        pop     ebx                                     ; 1C40 _ 5B
        pop     esi                                     ; 1C41 _ 5E
        pop     edi                                     ; 1C42 _ 5F
        pop     ebp                                     ; 1C43 _ 5D
        ret                                             ; 1C44 _ C3
; make_textbox End of function

make_windows:; Function begin
        push    ebp                                     ; 1C45 _ 55
        mov     ebp, esp                                ; 1C46 _ 89. E5
        push    ebx                                     ; 1C48 _ 53
        sub     esp, 68                                 ; 1C49 _ 83. EC, 44
        mov     eax, dword [ebp+0CH]                    ; 1C4C _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 1C4F _ 8B. 40, 04
        mov     dword [ebp-10H], eax                    ; 1C52 _ 89. 45, F0
        mov     eax, dword [ebp+0CH]                    ; 1C55 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 1C58 _ 8B. 40, 08
        mov     dword [ebp-0CH], eax                    ; 1C5B _ 89. 45, F4
        mov     eax, dword [ebp-10H]                    ; 1C5E _ 8B. 45, F0
        lea     edx, [eax-1H]                           ; 1C61 _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 1C64 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1C67 _ 8B. 00
        mov     dword [esp+18H], 0                      ; 1C69 _ C7. 44 24, 18, 00000000
        mov     dword [esp+14H], edx                    ; 1C71 _ 89. 54 24, 14
        mov     dword [esp+10H], 0                      ; 1C75 _ C7. 44 24, 10, 00000000
        mov     dword [esp+0CH], 0                      ; 1C7D _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 8                       ; 1C85 _ C7. 44 24, 08, 00000008
        mov     edx, dword [ebp-10H]                    ; 1C8D _ 8B. 55, F0
        mov     dword [esp+4H], edx                     ; 1C90 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1C94 _ 89. 04 24
        call    paint_rectangle                         ; 1C97 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 1C9C _ 8B. 45, F0
        lea     edx, [eax-2H]                           ; 1C9F _ 8D. 50, FE
        mov     eax, dword [ebp+0CH]                    ; 1CA2 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1CA5 _ 8B. 00
        mov     dword [esp+18H], 1                      ; 1CA7 _ C7. 44 24, 18, 00000001
        mov     dword [esp+14H], edx                    ; 1CAF _ 89. 54 24, 14
        mov     dword [esp+10H], 1                      ; 1CB3 _ C7. 44 24, 10, 00000001
        mov     dword [esp+0CH], 1                      ; 1CBB _ C7. 44 24, 0C, 00000001
        mov     dword [esp+8H], 7                       ; 1CC3 _ C7. 44 24, 08, 00000007
        mov     edx, dword [ebp-10H]                    ; 1CCB _ 8B. 55, F0
        mov     dword [esp+4H], edx                     ; 1CCE _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1CD2 _ 89. 04 24
        call    paint_rectangle                         ; 1CD5 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 1CDA _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 1CDD _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 1CE0 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1CE3 _ 8B. 00
        mov     dword [esp+18H], edx                    ; 1CE5 _ 89. 54 24, 18
        mov     dword [esp+14H], 0                      ; 1CE9 _ C7. 44 24, 14, 00000000
        mov     dword [esp+10H], 0                      ; 1CF1 _ C7. 44 24, 10, 00000000
        mov     dword [esp+0CH], 0                      ; 1CF9 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 8                       ; 1D01 _ C7. 44 24, 08, 00000008
        mov     edx, dword [ebp-10H]                    ; 1D09 _ 8B. 55, F0
        mov     dword [esp+4H], edx                     ; 1D0C _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1D10 _ 89. 04 24
        call    paint_rectangle                         ; 1D13 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 1D18 _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 1D1B _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 1D1E _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1D21 _ 8B. 00
        mov     dword [esp+18H], edx                    ; 1D23 _ 89. 54 24, 18
        mov     dword [esp+14H], 1                      ; 1D27 _ C7. 44 24, 14, 00000001
        mov     dword [esp+10H], 1                      ; 1D2F _ C7. 44 24, 10, 00000001
        mov     dword [esp+0CH], 1                      ; 1D37 _ C7. 44 24, 0C, 00000001
        mov     dword [esp+8H], 7                       ; 1D3F _ C7. 44 24, 08, 00000007
        mov     edx, dword [ebp-10H]                    ; 1D47 _ 8B. 55, F0
        mov     dword [esp+4H], edx                     ; 1D4A _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1D4E _ 89. 04 24
        call    paint_rectangle                         ; 1D51 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 1D56 _ 8B. 45, F4
        lea     ebx, [eax-2H]                           ; 1D59 _ 8D. 58, FE
        mov     eax, dword [ebp-10H]                    ; 1D5C _ 8B. 45, F0
        lea     ecx, [eax-2H]                           ; 1D5F _ 8D. 48, FE
        mov     eax, dword [ebp-10H]                    ; 1D62 _ 8B. 45, F0
        lea     edx, [eax-2H]                           ; 1D65 _ 8D. 50, FE
        mov     eax, dword [ebp+0CH]                    ; 1D68 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1D6B _ 8B. 00
        mov     dword [esp+18H], ebx                    ; 1D6D _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 1D71 _ 89. 4C 24, 14
        mov     dword [esp+10H], 1                      ; 1D75 _ C7. 44 24, 10, 00000001
        mov     dword [esp+0CH], edx                    ; 1D7D _ 89. 54 24, 0C
        mov     dword [esp+8H], 15                      ; 1D81 _ C7. 44 24, 08, 0000000F
        mov     edx, dword [ebp-10H]                    ; 1D89 _ 8B. 55, F0
        mov     dword [esp+4H], edx                     ; 1D8C _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1D90 _ 89. 04 24
        call    paint_rectangle                         ; 1D93 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 1D98 _ 8B. 45, F4
        lea     ebx, [eax-1H]                           ; 1D9B _ 8D. 58, FF
        mov     eax, dword [ebp-10H]                    ; 1D9E _ 8B. 45, F0
        lea     ecx, [eax-1H]                           ; 1DA1 _ 8D. 48, FF
        mov     eax, dword [ebp-10H]                    ; 1DA4 _ 8B. 45, F0
        lea     edx, [eax-1H]                           ; 1DA7 _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 1DAA _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1DAD _ 8B. 00
        mov     dword [esp+18H], ebx                    ; 1DAF _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 1DB3 _ 89. 4C 24, 14
        mov     dword [esp+10H], 0                      ; 1DB7 _ C7. 44 24, 10, 00000000
        mov     dword [esp+0CH], edx                    ; 1DBF _ 89. 54 24, 0C
        mov     dword [esp+8H], 0                       ; 1DC3 _ C7. 44 24, 08, 00000000
        mov     edx, dword [ebp-10H]                    ; 1DCB _ 8B. 55, F0
        mov     dword [esp+4H], edx                     ; 1DCE _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1DD2 _ 89. 04 24
        call    paint_rectangle                         ; 1DD5 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 1DDA _ 8B. 45, F4
        lea     ecx, [eax-3H]                           ; 1DDD _ 8D. 48, FD
        mov     eax, dword [ebp-10H]                    ; 1DE0 _ 8B. 45, F0
        lea     edx, [eax-3H]                           ; 1DE3 _ 8D. 50, FD
        mov     eax, dword [ebp+0CH]                    ; 1DE6 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1DE9 _ 8B. 00
        mov     dword [esp+18H], ecx                    ; 1DEB _ 89. 4C 24, 18
        mov     dword [esp+14H], edx                    ; 1DEF _ 89. 54 24, 14
        mov     dword [esp+10H], 2                      ; 1DF3 _ C7. 44 24, 10, 00000002
        mov     dword [esp+0CH], 2                      ; 1DFB _ C7. 44 24, 0C, 00000002
        mov     dword [esp+8H], 8                       ; 1E03 _ C7. 44 24, 08, 00000008
        mov     edx, dword [ebp-10H]                    ; 1E0B _ 8B. 55, F0
        mov     dword [esp+4H], edx                     ; 1E0E _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1E12 _ 89. 04 24
        call    paint_rectangle                         ; 1E15 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 1E1A _ 8B. 45, F0
        lea     edx, [eax-4H]                           ; 1E1D _ 8D. 50, FC
        mov     eax, dword [ebp+0CH]                    ; 1E20 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1E23 _ 8B. 00
        mov     dword [esp+18H], 20                     ; 1E25 _ C7. 44 24, 18, 00000014
        mov     dword [esp+14H], edx                    ; 1E2D _ 89. 54 24, 14
        mov     dword [esp+10H], 3                      ; 1E31 _ C7. 44 24, 10, 00000003
        mov     dword [esp+0CH], 3                      ; 1E39 _ C7. 44 24, 0C, 00000003
        mov     dword [esp+8H], 12                      ; 1E41 _ C7. 44 24, 08, 0000000C
        mov     edx, dword [ebp-10H]                    ; 1E49 _ 8B. 55, F0
        mov     dword [esp+4H], edx                     ; 1E4C _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1E50 _ 89. 04 24
        call    paint_rectangle                         ; 1E53 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 1E58 _ 8B. 45, F4
        lea     ebx, [eax-2H]                           ; 1E5B _ 8D. 58, FE
        mov     eax, dword [ebp-10H]                    ; 1E5E _ 8B. 45, F0
        lea     ecx, [eax-2H]                           ; 1E61 _ 8D. 48, FE
        mov     eax, dword [ebp-0CH]                    ; 1E64 _ 8B. 45, F4
        lea     edx, [eax-2H]                           ; 1E67 _ 8D. 50, FE
        mov     eax, dword [ebp+0CH]                    ; 1E6A _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1E6D _ 8B. 00
        mov     dword [esp+18H], ebx                    ; 1E6F _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 1E73 _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 1E77 _ 89. 54 24, 10
        mov     dword [esp+0CH], 1                      ; 1E7B _ C7. 44 24, 0C, 00000001
        mov     dword [esp+8H], 15                      ; 1E83 _ C7. 44 24, 08, 0000000F
        mov     edx, dword [ebp-10H]                    ; 1E8B _ 8B. 55, F0
        mov     dword [esp+4H], edx                     ; 1E8E _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1E92 _ 89. 04 24
        call    paint_rectangle                         ; 1E95 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 1E9A _ 8B. 45, F4
        lea     ebx, [eax-1H]                           ; 1E9D _ 8D. 58, FF
        mov     eax, dword [ebp-10H]                    ; 1EA0 _ 8B. 45, F0
        lea     ecx, [eax-1H]                           ; 1EA3 _ 8D. 48, FF
        mov     eax, dword [ebp-0CH]                    ; 1EA6 _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 1EA9 _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 1EAC _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1EAF _ 8B. 00
        mov     dword [esp+18H], ebx                    ; 1EB1 _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 1EB5 _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 1EB9 _ 89. 54 24, 10
        mov     dword [esp+0CH], 0                      ; 1EBD _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 0                       ; 1EC5 _ C7. 44 24, 08, 00000000
        mov     edx, dword [ebp-10H]                    ; 1ECD _ 8B. 55, F0
        mov     dword [esp+4H], edx                     ; 1ED0 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1ED4 _ 89. 04 24
        call    paint_rectangle                         ; 1ED7 _ E8, FFFFFFFC(rel)
        mov     dword [esp+14H], 7                      ; 1EDC _ C7. 44 24, 14, 00000007
        mov     eax, dword [ebp+10H]                    ; 1EE4 _ 8B. 45, 10
        mov     dword [esp+10H], eax                    ; 1EE7 _ 89. 44 24, 10
        mov     dword [esp+0CH], 4                      ; 1EEB _ C7. 44 24, 0C, 00000004
        mov     dword [esp+8H], 24                      ; 1EF3 _ C7. 44 24, 08, 00000018
        mov     eax, dword [ebp+0CH]                    ; 1EFB _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 1EFE _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1F02 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1F05 _ 89. 04 24
        call    paint_string                            ; 1F08 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-14H], 0                      ; 1F0D _ C7. 45, EC, 00000000
        jmp     ?_057                                   ; 1F14 _ E9, 00000083

?_050:  mov     dword [ebp-18H], 0                      ; 1F19 _ C7. 45, E8, 00000000
        jmp     ?_056                                   ; 1F20 _ EB, 70

?_051:  mov     eax, dword [ebp-14H]                    ; 1F22 _ 8B. 45, EC
        shl     eax, 4                                  ; 1F25 _ C1. E0, 04
        mov     edx, eax                                ; 1F28 _ 89. C2
        mov     eax, dword [ebp-18H]                    ; 1F2A _ 8B. 45, E8
        add     eax, edx                                ; 1F2D _ 01. D0
        add     eax, closebtn.1830                      ; 1F2F _ 05, 000001C0(d)
        movzx   eax, byte [eax]                         ; 1F34 _ 0F B6. 00
        mov     byte [ebp-19H], al                      ; 1F37 _ 88. 45, E7
        cmp     byte [ebp-19H], 64                      ; 1F3A _ 80. 7D, E7, 40
        jnz     ?_052                                   ; 1F3E _ 75, 06
        mov     byte [ebp-19H], 0                       ; 1F40 _ C6. 45, E7, 00
        jmp     ?_055                                   ; 1F44 _ EB, 1C

?_052:  cmp     byte [ebp-19H], 36                      ; 1F46 _ 80. 7D, E7, 24
        jnz     ?_053                                   ; 1F4A _ 75, 06
        mov     byte [ebp-19H], 15                      ; 1F4C _ C6. 45, E7, 0F
        jmp     ?_055                                   ; 1F50 _ EB, 10

?_053:  cmp     byte [ebp-19H], 81                      ; 1F52 _ 80. 7D, E7, 51
        jnz     ?_054                                   ; 1F56 _ 75, 06
        mov     byte [ebp-19H], 8                       ; 1F58 _ C6. 45, E7, 08
        jmp     ?_055                                   ; 1F5C _ EB, 04

?_054:  mov     byte [ebp-19H], 7                       ; 1F5E _ C6. 45, E7, 07
?_055:  mov     eax, dword [ebp+0CH]                    ; 1F62 _ 8B. 45, 0C
        mov     edx, dword [eax]                        ; 1F65 _ 8B. 10
        mov     eax, dword [ebp-14H]                    ; 1F67 _ 8B. 45, EC
        lea     ecx, [eax+5H]                           ; 1F6A _ 8D. 48, 05
        mov     eax, dword [ebp+0CH]                    ; 1F6D _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 1F70 _ 8B. 40, 04
        imul    ecx, eax                                ; 1F73 _ 0F AF. C8
        mov     eax, dword [ebp+0CH]                    ; 1F76 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 1F79 _ 8B. 40, 04
        lea     ebx, [eax-15H]                          ; 1F7C _ 8D. 58, EB
        mov     eax, dword [ebp-18H]                    ; 1F7F _ 8B. 45, E8
        add     eax, ebx                                ; 1F82 _ 01. D8
        add     eax, ecx                                ; 1F84 _ 01. C8
        add     edx, eax                                ; 1F86 _ 01. C2
        movzx   eax, byte [ebp-19H]                     ; 1F88 _ 0F B6. 45, E7
        mov     byte [edx], al                          ; 1F8C _ 88. 02
        add     dword [ebp-18H], 1                      ; 1F8E _ 83. 45, E8, 01
?_056:  cmp     dword [ebp-18H], 15                     ; 1F92 _ 83. 7D, E8, 0F
        jle     ?_051                                   ; 1F96 _ 7E, 8A
        add     dword [ebp-14H], 1                      ; 1F98 _ 83. 45, EC, 01
?_057:  cmp     dword [ebp-14H], 13                     ; 1F9C _ 83. 7D, EC, 0D
        jle     ?_050                                   ; 1FA0 _ 0F 8E, FFFFFF73
        add     esp, 68                                 ; 1FA6 _ 83. C4, 44
        pop     ebx                                     ; 1FA9 _ 5B
        pop     ebp                                     ; 1FAA _ 5D
        ret                                             ; 1FAB _ C3
; make_windows End of function

wait_KBC_sendready:; Function begin
        push    ebp                                     ; 1FAC _ 55
        mov     ebp, esp                                ; 1FAD _ 89. E5
        sub     esp, 24                                 ; 1FAF _ 83. EC, 18
?_058:  mov     dword [esp], 100                        ; 1FB2 _ C7. 04 24, 00000064
        call    io_in8                                  ; 1FB9 _ E8, FFFFFFFC(rel)
        and     eax, 02H                                ; 1FBE _ 83. E0, 02
        test    eax, eax                                ; 1FC1 _ 85. C0
        jnz     ?_059                                   ; 1FC3 _ 75, 02
        jmp     ?_060                                   ; 1FC5 _ EB, 02

?_059:  jmp     ?_058                                   ; 1FC7 _ EB, E9

?_060:  leave                                           ; 1FC9 _ C9
        ret                                             ; 1FCA _ C3
; wait_KBC_sendready End of function

init_keyboard:; Function begin
        push    ebp                                     ; 1FCB _ 55
        mov     ebp, esp                                ; 1FCC _ 89. E5
        sub     esp, 24                                 ; 1FCE _ 83. EC, 18
        call    wait_KBC_sendready                      ; 1FD1 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 96                      ; 1FD6 _ C7. 44 24, 04, 00000060
        mov     dword [esp], 100                        ; 1FDE _ C7. 04 24, 00000064
        call    io_out8                                 ; 1FE5 _ E8, FFFFFFFC(rel)
        call    wait_KBC_sendready                      ; 1FEA _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 71                      ; 1FEF _ C7. 44 24, 04, 00000047
        mov     dword [esp], 96                         ; 1FF7 _ C7. 04 24, 00000060
        call    io_out8                                 ; 1FFE _ E8, FFFFFFFC(rel)
        leave                                           ; 2003 _ C9
        ret                                             ; 2004 _ C3
; init_keyboard End of function

enable_mouse:; Function begin
        push    ebp                                     ; 2005 _ 55
        mov     ebp, esp                                ; 2006 _ 89. E5
        sub     esp, 24                                 ; 2008 _ 83. EC, 18
        call    wait_KBC_sendready                      ; 200B _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 212                     ; 2010 _ C7. 44 24, 04, 000000D4
        mov     dword [esp], 100                        ; 2018 _ C7. 04 24, 00000064
        call    io_out8                                 ; 201F _ E8, FFFFFFFC(rel)
        call    wait_KBC_sendready                      ; 2024 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 244                     ; 2029 _ C7. 44 24, 04, 000000F4
        mov     dword [esp], 96                         ; 2031 _ C7. 04 24, 00000060
        call    io_out8                                 ; 2038 _ E8, FFFFFFFC(rel)
        leave                                           ; 203D _ C9
        ret                                             ; 203E _ C3
; enable_mouse End of function

mouse_decode:; Function begin
        push    ebp                                     ; 203F _ 55
        mov     ebp, esp                                ; 2040 _ 89. E5
        sub     esp, 4                                  ; 2042 _ 83. EC, 04
        mov     eax, dword [ebp+0CH]                    ; 2045 _ 8B. 45, 0C
        mov     byte [ebp-4H], al                       ; 2048 _ 88. 45, FC
        mov     eax, dword [ebp+8H]                     ; 204B _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 204E _ 0F B6. 40, 03
        test    al, al                                  ; 2052 _ 84. C0
        jnz     ?_062                                   ; 2054 _ 75, 17
        cmp     byte [ebp-4H], -6                       ; 2056 _ 80. 7D, FC, FA
        jnz     ?_061                                   ; 205A _ 75, 07
        mov     eax, dword [ebp+8H]                     ; 205C _ 8B. 45, 08
        mov     byte [eax+3H], 1                        ; 205F _ C6. 40, 03, 01
?_061:  mov     eax, 0                                  ; 2063 _ B8, 00000000
        jmp     ?_069                                   ; 2068 _ E9, 0000010F

?_062:  mov     eax, dword [ebp+8H]                     ; 206D _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 2070 _ 0F B6. 40, 03
        cmp     al, 1                                   ; 2074 _ 3C, 01
        jnz     ?_064                                   ; 2076 _ 75, 28
        movzx   eax, byte [ebp-4H]                      ; 2078 _ 0F B6. 45, FC
        and     eax, 0C8H                               ; 207C _ 25, 000000C8
        cmp     eax, 8                                  ; 2081 _ 83. F8, 08
        jnz     ?_063                                   ; 2084 _ 75, 10
        mov     eax, dword [ebp+8H]                     ; 2086 _ 8B. 45, 08
        movzx   edx, byte [ebp-4H]                      ; 2089 _ 0F B6. 55, FC
        mov     byte [eax], dl                          ; 208D _ 88. 10
        mov     eax, dword [ebp+8H]                     ; 208F _ 8B. 45, 08
        mov     byte [eax+3H], 2                        ; 2092 _ C6. 40, 03, 02
?_063:  mov     eax, 0                                  ; 2096 _ B8, 00000000
        jmp     ?_069                                   ; 209B _ E9, 000000DC

?_064:  mov     eax, dword [ebp+8H]                     ; 20A0 _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 20A3 _ 0F B6. 40, 03
        cmp     al, 2                                   ; 20A7 _ 3C, 02
        jnz     ?_065                                   ; 20A9 _ 75, 1B
        mov     eax, dword [ebp+8H]                     ; 20AB _ 8B. 45, 08
        movzx   edx, byte [ebp-4H]                      ; 20AE _ 0F B6. 55, FC
        mov     byte [eax+1H], dl                       ; 20B2 _ 88. 50, 01
        mov     eax, dword [ebp+8H]                     ; 20B5 _ 8B. 45, 08
        mov     byte [eax+3H], 3                        ; 20B8 _ C6. 40, 03, 03
        mov     eax, 0                                  ; 20BC _ B8, 00000000
        jmp     ?_069                                   ; 20C1 _ E9, 000000B6

?_065:  mov     eax, dword [ebp+8H]                     ; 20C6 _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 20C9 _ 0F B6. 40, 03
        cmp     al, 3                                   ; 20CD _ 3C, 03
        jne     ?_068                                   ; 20CF _ 0F 85, 000000A2
        mov     eax, dword [ebp+8H]                     ; 20D5 _ 8B. 45, 08
        movzx   edx, byte [ebp-4H]                      ; 20D8 _ 0F B6. 55, FC
        mov     byte [eax+2H], dl                       ; 20DC _ 88. 50, 02
        mov     eax, dword [ebp+8H]                     ; 20DF _ 8B. 45, 08
        mov     byte [eax+3H], 1                        ; 20E2 _ C6. 40, 03, 01
        mov     eax, dword [ebp+8H]                     ; 20E6 _ 8B. 45, 08
        movzx   eax, byte [eax]                         ; 20E9 _ 0F B6. 00
        movzx   eax, al                                 ; 20EC _ 0F B6. C0
        and     eax, 07H                                ; 20EF _ 83. E0, 07
        mov     edx, eax                                ; 20F2 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 20F4 _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 20F7 _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 20FA _ 8B. 45, 08
        movzx   eax, byte [eax+1H]                      ; 20FD _ 0F B6. 40, 01
        movzx   edx, al                                 ; 2101 _ 0F B6. D0
        mov     eax, dword [ebp+8H]                     ; 2104 _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 2107 _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 210A _ 8B. 45, 08
        movzx   eax, byte [eax+2H]                      ; 210D _ 0F B6. 40, 02
        movzx   edx, al                                 ; 2111 _ 0F B6. D0
        mov     eax, dword [ebp+8H]                     ; 2114 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 2117 _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 211A _ 8B. 45, 08
        movzx   eax, byte [eax]                         ; 211D _ 0F B6. 00
        movzx   eax, al                                 ; 2120 _ 0F B6. C0
        and     eax, 10H                                ; 2123 _ 83. E0, 10
        test    eax, eax                                ; 2126 _ 85. C0
        jz      ?_066                                   ; 2128 _ 74, 13
        mov     eax, dword [ebp+8H]                     ; 212A _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 212D _ 8B. 40, 04
        or      eax, 0FFFFFF00H                         ; 2130 _ 0D, FFFFFF00
        mov     edx, eax                                ; 2135 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 2137 _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 213A _ 89. 50, 04
?_066:  mov     eax, dword [ebp+8H]                     ; 213D _ 8B. 45, 08
        movzx   eax, byte [eax]                         ; 2140 _ 0F B6. 00
        movzx   eax, al                                 ; 2143 _ 0F B6. C0
        and     eax, 20H                                ; 2146 _ 83. E0, 20
        test    eax, eax                                ; 2149 _ 85. C0
        jz      ?_067                                   ; 214B _ 74, 13
        mov     eax, dword [ebp+8H]                     ; 214D _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 2150 _ 8B. 40, 08
        or      eax, 0FFFFFF00H                         ; 2153 _ 0D, FFFFFF00
        mov     edx, eax                                ; 2158 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 215A _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 215D _ 89. 50, 08
?_067:  mov     eax, dword [ebp+8H]                     ; 2160 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 2163 _ 8B. 40, 08
        neg     eax                                     ; 2166 _ F7. D8
        mov     edx, eax                                ; 2168 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 216A _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 216D _ 89. 50, 08
        mov     eax, 1                                  ; 2170 _ B8, 00000001
        jmp     ?_069                                   ; 2175 _ EB, 05

?_068:  mov     eax, 4294967295                         ; 2177 _ B8, FFFFFFFF
?_069:  leave                                           ; 217C _ C9
        ret                                             ; 217D _ C3
; mouse_decode End of function

intHandlerKeyboard:; Function begin
        push    ebp                                     ; 217E _ 55
        mov     ebp, esp                                ; 217F _ 89. E5
        sub     esp, 40                                 ; 2181 _ 83. EC, 28
        mov     dword [esp+4H], 32                      ; 2184 _ C7. 44 24, 04, 00000020
        mov     dword [esp], 32                         ; 218C _ C7. 04 24, 00000020
        call    io_out8                                 ; 2193 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 32                      ; 2198 _ C7. 44 24, 04, 00000020
        mov     dword [esp], 160                        ; 21A0 _ C7. 04 24, 000000A0
        call    io_out8                                 ; 21A7 _ E8, FFFFFFFC(rel)
        mov     dword [esp], 96                         ; 21AC _ C7. 04 24, 00000060
        call    io_in8                                  ; 21B3 _ E8, FFFFFFFC(rel)
        mov     byte [ebp-9H], al                       ; 21B8 _ 88. 45, F7
        movzx   eax, byte [ebp-9H]                      ; 21BB _ 0F B6. 45, F7
        mov     dword [esp+4H], eax                     ; 21BF _ 89. 44 24, 04
        mov     dword [esp], keyinfo                    ; 21C3 _ C7. 04 24, 00000000(d)
        call    fifo8_put                               ; 21CA _ E8, FFFFFFFC(rel)
        leave                                           ; 21CF _ C9
        ret                                             ; 21D0 _ C3
; intHandlerKeyboard End of function

intHandlerMouse:; Function begin
        push    ebp                                     ; 21D1 _ 55
        mov     ebp, esp                                ; 21D2 _ 89. E5
        sub     esp, 40                                 ; 21D4 _ 83. EC, 28
        mov     dword [esp+4H], 32                      ; 21D7 _ C7. 44 24, 04, 00000020
        mov     dword [esp], 32                         ; 21DF _ C7. 04 24, 00000020
        call    io_out8                                 ; 21E6 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 32                      ; 21EB _ C7. 44 24, 04, 00000020
        mov     dword [esp], 160                        ; 21F3 _ C7. 04 24, 000000A0
        call    io_out8                                 ; 21FA _ E8, FFFFFFFC(rel)
        mov     dword [esp], 96                         ; 21FF _ C7. 04 24, 00000060
        call    io_in8                                  ; 2206 _ E8, FFFFFFFC(rel)
        mov     byte [ebp-9H], al                       ; 220B _ 88. 45, F7
        movzx   eax, byte [ebp-9H]                      ; 220E _ 0F B6. 45, F7
        mov     dword [esp+4H], eax                     ; 2212 _ 89. 44 24, 04
        mov     dword [esp], mouseinfo                  ; 2216 _ C7. 04 24, 00000000(d)
        call    fifo8_put                               ; 221D _ E8, FFFFFFFC(rel)
        leave                                           ; 2222 _ C9
        ret                                             ; 2223 _ C3
; intHandlerMouse End of function

fifo8_init:; Function begin
        push    ebp                                     ; 2224 _ 55
        mov     ebp, esp                                ; 2225 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 2227 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 222A _ 8B. 55, 10
        mov     dword [eax], edx                        ; 222D _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 222F _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 2232 _ C7. 40, 04, 00000000
        mov     eax, dword [ebp+8H]                     ; 2239 _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 223C _ C7. 40, 08, 00000000
        mov     eax, dword [ebp+8H]                     ; 2243 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 2246 _ 8B. 55, 0C
        mov     dword [eax+0CH], edx                    ; 2249 _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 224C _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 224F _ 8B. 55, 0C
        mov     dword [eax+10H], edx                    ; 2252 _ 89. 50, 10
        mov     eax, dword [ebp+8H]                     ; 2255 _ 8B. 45, 08
        mov     dword [eax+14H], 0                      ; 2258 _ C7. 40, 14, 00000000
        mov     eax, dword [ebp+8H]                     ; 225F _ 8B. 45, 08
        mov     edx, dword [ebp+14H]                    ; 2262 _ 8B. 55, 14
        mov     dword [eax+18H], edx                    ; 2265 _ 89. 50, 18
        pop     ebp                                     ; 2268 _ 5D
        ret                                             ; 2269 _ C3
; fifo8_init End of function

fifo8_put:; Function begin
        push    ebp                                     ; 226A _ 55
        mov     ebp, esp                                ; 226B _ 89. E5
        sub     esp, 40                                 ; 226D _ 83. EC, 28
        mov     eax, dword [ebp+0CH]                    ; 2270 _ 8B. 45, 0C
        mov     byte [ebp-1CH], al                      ; 2273 _ 88. 45, E4
        cmp     dword [ebp+8H], 0                       ; 2276 _ 83. 7D, 08, 00
        jnz     ?_070                                   ; 227A _ 75, 0A
        mov     eax, 4294967295                         ; 227C _ B8, FFFFFFFF
        jmp     ?_074                                   ; 2281 _ E9, 0000009E

?_070:  mov     eax, dword [ebp+8H]                     ; 2286 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 2289 _ 8B. 40, 10
        test    eax, eax                                ; 228C _ 85. C0
        jnz     ?_071                                   ; 228E _ 75, 18
        mov     eax, dword [ebp+8H]                     ; 2290 _ 8B. 45, 08
        mov     eax, dword [eax+14H]                    ; 2293 _ 8B. 40, 14
        or      eax, 01H                                ; 2296 _ 83. C8, 01
        mov     edx, eax                                ; 2299 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 229B _ 8B. 45, 08
        mov     dword [eax+14H], edx                    ; 229E _ 89. 50, 14
        mov     eax, 4294967295                         ; 22A1 _ B8, FFFFFFFF
        jmp     ?_074                                   ; 22A6 _ EB, 7C

?_071:  mov     eax, dword [ebp+8H]                     ; 22A8 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 22AB _ 8B. 40, 04
        mov     dword [ebp-0CH], eax                    ; 22AE _ 89. 45, F4
        mov     eax, dword [ebp+8H]                     ; 22B1 _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 22B4 _ 8B. 10
        mov     eax, dword [ebp-0CH]                    ; 22B6 _ 8B. 45, F4
        add     edx, eax                                ; 22B9 _ 01. C2
        movzx   eax, byte [ebp-1CH]                     ; 22BB _ 0F B6. 45, E4
        mov     byte [edx], al                          ; 22BF _ 88. 02
        mov     eax, dword [ebp+8H]                     ; 22C1 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 22C4 _ 8B. 40, 04
        lea     edx, [eax+1H]                           ; 22C7 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 22CA _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 22CD _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 22D0 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 22D3 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 22D6 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 22D9 _ 8B. 40, 0C
        cmp     edx, eax                                ; 22DC _ 39. C2
        jnz     ?_072                                   ; 22DE _ 75, 0A
        mov     eax, dword [ebp+8H]                     ; 22E0 _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 22E3 _ C7. 40, 04, 00000000
?_072:  mov     eax, dword [ebp+8H]                     ; 22EA _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 22ED _ 8B. 40, 10
        lea     edx, [eax-1H]                           ; 22F0 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 22F3 _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 22F6 _ 89. 50, 10
        mov     eax, dword [ebp+8H]                     ; 22F9 _ 8B. 45, 08
        mov     eax, dword [eax+18H]                    ; 22FC _ 8B. 40, 18
        test    eax, eax                                ; 22FF _ 85. C0
        jz      ?_073                                   ; 2301 _ 74, 1C
        mov     eax, dword [ebp+8H]                     ; 2303 _ 8B. 45, 08
        mov     eax, dword [eax+18H]                    ; 2306 _ 8B. 40, 18
        mov     eax, dword [eax+4H]                     ; 2309 _ 8B. 40, 04
        cmp     eax, 2                                  ; 230C _ 83. F8, 02
        jz      ?_073                                   ; 230F _ 74, 0E
        mov     eax, dword [ebp+8H]                     ; 2311 _ 8B. 45, 08
        mov     eax, dword [eax+18H]                    ; 2314 _ 8B. 40, 18
        mov     dword [esp], eax                        ; 2317 _ 89. 04 24
        call    task_run                                ; 231A _ E8, FFFFFFFC(rel)
?_073:  mov     eax, 0                                  ; 231F _ B8, 00000000
?_074:  leave                                           ; 2324 _ C9
        ret                                             ; 2325 _ C3
; fifo8_put End of function

fifo8_get:; Function begin
        push    ebp                                     ; 2326 _ 55
        mov     ebp, esp                                ; 2327 _ 89. E5
        sub     esp, 16                                 ; 2329 _ 83. EC, 10
        mov     eax, dword [ebp+8H]                     ; 232C _ 8B. 45, 08
        mov     edx, dword [eax+10H]                    ; 232F _ 8B. 50, 10
        mov     eax, dword [ebp+8H]                     ; 2332 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 2335 _ 8B. 40, 0C
        cmp     edx, eax                                ; 2338 _ 39. C2
        jnz     ?_075                                   ; 233A _ 75, 11
        mov     eax, dword [ebp+8H]                     ; 233C _ 8B. 45, 08
        mov     dword [eax+14H], 0                      ; 233F _ C7. 40, 14, 00000000
        mov     eax, 4294967295                         ; 2346 _ B8, FFFFFFFF
        jmp     ?_077                                   ; 234B _ EB, 57

?_075:  mov     eax, dword [ebp+8H]                     ; 234D _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 2350 _ 8B. 40, 08
        mov     dword [ebp-8H], eax                     ; 2353 _ 89. 45, F8
        mov     eax, dword [ebp+8H]                     ; 2356 _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 2359 _ 8B. 10
        mov     eax, dword [ebp-8H]                     ; 235B _ 8B. 45, F8
        add     eax, edx                                ; 235E _ 01. D0
        movzx   eax, byte [eax]                         ; 2360 _ 0F B6. 00
        movzx   eax, al                                 ; 2363 _ 0F B6. C0
        mov     dword [ebp-4H], eax                     ; 2366 _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 2369 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 236C _ 8B. 40, 08
        lea     edx, [eax+1H]                           ; 236F _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 2372 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 2375 _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 2378 _ 8B. 45, 08
        mov     edx, dword [eax+8H]                     ; 237B _ 8B. 50, 08
        mov     eax, dword [ebp+8H]                     ; 237E _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 2381 _ 8B. 40, 0C
        cmp     edx, eax                                ; 2384 _ 39. C2
        jnz     ?_076                                   ; 2386 _ 75, 0A
        mov     eax, dword [ebp+8H]                     ; 2388 _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 238B _ C7. 40, 08, 00000000
?_076:  mov     eax, dword [ebp+8H]                     ; 2392 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 2395 _ 8B. 40, 10
        lea     edx, [eax+1H]                           ; 2398 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 239B _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 239E _ 89. 50, 10
        mov     eax, dword [ebp-4H]                     ; 23A1 _ 8B. 45, FC
?_077:  leave                                           ; 23A4 _ C9
        ret                                             ; 23A5 _ C3
; fifo8_get End of function

fifo8_status:; Function begin
        push    ebp                                     ; 23A6 _ 55
        mov     ebp, esp                                ; 23A7 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 23A9 _ 8B. 45, 08
        mov     edx, dword [eax+0CH]                    ; 23AC _ 8B. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 23AF _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 23B2 _ 8B. 40, 10
        sub     edx, eax                                ; 23B5 _ 29. C2
        mov     eax, edx                                ; 23B7 _ 89. D0
        pop     ebp                                     ; 23B9 _ 5D
        ret                                             ; 23BA _ C3
; fifo8_status End of function

charToHexVal:; Function begin
        push    ebp                                     ; 23BB _ 55
        mov     ebp, esp                                ; 23BC _ 89. E5
        sub     esp, 4                                  ; 23BE _ 83. EC, 04
        mov     eax, dword [ebp+8H]                     ; 23C1 _ 8B. 45, 08
        mov     byte [ebp-4H], al                       ; 23C4 _ 88. 45, FC
        cmp     byte [ebp-4H], 9                        ; 23C7 _ 80. 7D, FC, 09
        jle     ?_078                                   ; 23CB _ 7E, 09
        movzx   eax, byte [ebp-4H]                      ; 23CD _ 0F B6. 45, FC
        add     eax, 55                                 ; 23D1 _ 83. C0, 37
        jmp     ?_079                                   ; 23D4 _ EB, 07

?_078:  movzx   eax, byte [ebp-4H]                      ; 23D6 _ 0F B6. 45, FC
        add     eax, 48                                 ; 23DA _ 83. C0, 30
?_079:  leave                                           ; 23DD _ C9
        ret                                             ; 23DE _ C3
; charToHexVal End of function

charToHexStr:; Function begin
        push    ebp                                     ; 23DF _ 55
        mov     ebp, esp                                ; 23E0 _ 89. E5
        sub     esp, 24                                 ; 23E2 _ 83. EC, 18
        mov     eax, dword [ebp+8H]                     ; 23E5 _ 8B. 45, 08
        mov     byte [ebp-14H], al                      ; 23E8 _ 88. 45, EC
        mov     dword [ebp-4H], 0                       ; 23EB _ C7. 45, FC, 00000000
        movzx   eax, byte [ebp-14H]                     ; 23F2 _ 0F B6. 45, EC
        and     eax, 0FH                                ; 23F6 _ 83. E0, 0F
        mov     byte [ebp-5H], al                       ; 23F9 _ 88. 45, FB
        movsx   eax, byte [ebp-5H]                      ; 23FC _ 0F BE. 45, FB
        mov     dword [esp], eax                        ; 2400 _ 89. 04 24
        call    charToHexVal                            ; 2403 _ E8, FFFFFFFC(rel)
        mov     byte [?_199], al                        ; 2408 _ A2, 000002A3(d)
        movzx   eax, byte [ebp-14H]                     ; 240D _ 0F B6. 45, EC
        shr     al, 4                                   ; 2411 _ C0. E8, 04
        mov     byte [ebp-14H], al                      ; 2414 _ 88. 45, EC
        movzx   eax, byte [ebp-14H]                     ; 2417 _ 0F B6. 45, EC
        movsx   eax, al                                 ; 241B _ 0F BE. C0
        mov     dword [esp], eax                        ; 241E _ 89. 04 24
        call    charToHexVal                            ; 2421 _ E8, FFFFFFFC(rel)
        mov     byte [?_198], al                        ; 2426 _ A2, 000002A2(d)
        mov     eax, keyval                             ; 242B _ B8, 000002A0(d)
        leave                                           ; 2430 _ C9
        ret                                             ; 2431 _ C3
; charToHexStr End of function

intToHexStr:; Function begin
        push    ebp                                     ; 2432 _ 55
        mov     ebp, esp                                ; 2433 _ 89. E5
        sub     esp, 16                                 ; 2435 _ 83. EC, 10
        mov     byte [str.1386], 48                     ; 2438 _ C6. 05, 000003A0(d), 30
        mov     byte [?_202], 88                        ; 243F _ C6. 05, 000003A1(d), 58
        mov     byte [?_203], 0                         ; 2446 _ C6. 05, 000003AA(d), 00
        mov     dword [ebp-0CH], 2                      ; 244D _ C7. 45, F4, 00000002
        jmp     ?_081                                   ; 2454 _ EB, 0F

?_080:  mov     eax, dword [ebp-0CH]                    ; 2456 _ 8B. 45, F4
        add     eax, str.1386                           ; 2459 _ 05, 000003A0(d)
        mov     byte [eax], 48                          ; 245E _ C6. 00, 30
        add     dword [ebp-0CH], 1                      ; 2461 _ 83. 45, F4, 01
?_081:  cmp     dword [ebp-0CH], 9                      ; 2465 _ 83. 7D, F4, 09
        jle     ?_080                                   ; 2469 _ 7E, EB
        mov     dword [ebp-8H], 9                       ; 246B _ C7. 45, F8, 00000009
        jmp     ?_085                                   ; 2472 _ EB, 40

?_082:  mov     eax, dword [ebp+8H]                     ; 2474 _ 8B. 45, 08
        and     eax, 0FH                                ; 2477 _ 83. E0, 0F
        mov     dword [ebp-4H], eax                     ; 247A _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 247D _ 8B. 45, 08
        shr     eax, 4                                  ; 2480 _ C1. E8, 04
        mov     dword [ebp+8H], eax                     ; 2483 _ 89. 45, 08
        cmp     dword [ebp-4H], 9                       ; 2486 _ 83. 7D, FC, 09
        jle     ?_083                                   ; 248A _ 7E, 13
        mov     eax, dword [ebp-4H]                     ; 248C _ 8B. 45, FC
        add     eax, 55                                 ; 248F _ 83. C0, 37
        mov     edx, dword [ebp-8H]                     ; 2492 _ 8B. 55, F8
        add     edx, str.1386                           ; 2495 _ 81. C2, 000003A0(d)
        mov     byte [edx], al                          ; 249B _ 88. 02
        jmp     ?_084                                   ; 249D _ EB, 11

?_083:  mov     eax, dword [ebp-4H]                     ; 249F _ 8B. 45, FC
        add     eax, 48                                 ; 24A2 _ 83. C0, 30
        mov     edx, dword [ebp-8H]                     ; 24A5 _ 8B. 55, F8
        add     edx, str.1386                           ; 24A8 _ 81. C2, 000003A0(d)
        mov     byte [edx], al                          ; 24AE _ 88. 02
?_084:  sub     dword [ebp-8H], 1                       ; 24B0 _ 83. 6D, F8, 01
?_085:  cmp     dword [ebp-8H], 1                       ; 24B4 _ 83. 7D, F8, 01
        jle     ?_086                                   ; 24B8 _ 7E, 06
        cmp     dword [ebp+8H], 0                       ; 24BA _ 83. 7D, 08, 00
        jnz     ?_082                                   ; 24BE _ 75, B4
?_086:  mov     eax, str.1386                           ; 24C0 _ B8, 000003A0(d)
        leave                                           ; 24C5 _ C9
        ret                                             ; 24C6 _ C3
; intToHexStr End of function

memman_init:; Function begin
        push    ebp                                     ; 24C7 _ 55
        mov     ebp, esp                                ; 24C8 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 24CA _ 8B. 45, 08
        mov     dword [eax], 0                          ; 24CD _ C7. 00, 00000000
        mov     eax, dword [ebp+8H]                     ; 24D3 _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 24D6 _ C7. 40, 04, 00000000
        mov     eax, dword [ebp+8H]                     ; 24DD _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 24E0 _ C7. 40, 08, 00000000
        mov     eax, dword [ebp+8H]                     ; 24E7 _ 8B. 45, 08
        mov     dword [eax+0CH], 0                      ; 24EA _ C7. 40, 0C, 00000000
        pop     ebp                                     ; 24F1 _ 5D
        ret                                             ; 24F2 _ C3
; memman_init End of function

memman_total:; Function begin
        push    ebp                                     ; 24F3 _ 55
        mov     ebp, esp                                ; 24F4 _ 89. E5
        sub     esp, 16                                 ; 24F6 _ 83. EC, 10
        mov     dword [ebp-4H], 0                       ; 24F9 _ C7. 45, FC, 00000000
        mov     dword [ebp-8H], 0                       ; 2500 _ C7. 45, F8, 00000000
        jmp     ?_088                                   ; 2507 _ EB, 14

?_087:  mov     eax, dword [ebp+8H]                     ; 2509 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 250C _ 8B. 55, F8
        add     edx, 2                                  ; 250F _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 2512 _ 8B. 44 D0, 04
        add     dword [ebp-4H], eax                     ; 2516 _ 01. 45, FC
        add     dword [ebp-8H], 1                       ; 2519 _ 83. 45, F8, 01
?_088:  mov     eax, dword [ebp+8H]                     ; 251D _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 2520 _ 8B. 00
        cmp     eax, dword [ebp-8H]                     ; 2522 _ 3B. 45, F8
        ja      ?_087                                   ; 2525 _ 77, E2
        mov     eax, dword [ebp-4H]                     ; 2527 _ 8B. 45, FC
        leave                                           ; 252A _ C9
        ret                                             ; 252B _ C3
; memman_total End of function

memman_alloc:; Function begin
        push    ebp                                     ; 252C _ 55
        mov     ebp, esp                                ; 252D _ 89. E5
        sub     esp, 16                                 ; 252F _ 83. EC, 10
        mov     dword [ebp-8H], 0                       ; 2532 _ C7. 45, F8, 00000000
        jmp     ?_092                                   ; 2539 _ E9, 00000085

?_089:  mov     eax, dword [ebp+8H]                     ; 253E _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 2541 _ 8B. 55, F8
        add     edx, 2                                  ; 2544 _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 2547 _ 8B. 44 D0, 04
        cmp     eax, dword [ebp+0CH]                    ; 254B _ 3B. 45, 0C
        jc      ?_091                                   ; 254E _ 72, 6F
        mov     eax, dword [ebp+8H]                     ; 2550 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 2553 _ 8B. 55, F8
        add     edx, 2                                  ; 2556 _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 2559 _ 8B. 04 D0
        mov     dword [ebp-4H], eax                     ; 255C _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 255F _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 2562 _ 8B. 55, F8
        add     edx, 2                                  ; 2565 _ 83. C2, 02
        mov     edx, dword [eax+edx*8]                  ; 2568 _ 8B. 14 D0
        mov     eax, dword [ebp+0CH]                    ; 256B _ 8B. 45, 0C
        lea     ecx, [edx+eax]                          ; 256E _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 2571 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 2574 _ 8B. 55, F8
        add     edx, 2                                  ; 2577 _ 83. C2, 02
        mov     dword [eax+edx*8], ecx                  ; 257A _ 89. 0C D0
        mov     eax, dword [ebp+8H]                     ; 257D _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 2580 _ 8B. 55, F8
        add     edx, 2                                  ; 2583 _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 2586 _ 8B. 44 D0, 04
        sub     eax, dword [ebp+0CH]                    ; 258A _ 2B. 45, 0C
        mov     edx, eax                                ; 258D _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 258F _ 8B. 45, 08
        mov     ecx, dword [ebp-8H]                     ; 2592 _ 8B. 4D, F8
        add     ecx, 2                                  ; 2595 _ 83. C1, 02
        mov     dword [eax+ecx*8+4H], edx               ; 2598 _ 89. 54 C8, 04
        mov     eax, dword [ebp+8H]                     ; 259C _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 259F _ 8B. 55, F8
        add     edx, 2                                  ; 25A2 _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 25A5 _ 8B. 44 D0, 04
        test    eax, eax                                ; 25A9 _ 85. C0
        jnz     ?_090                                   ; 25AB _ 75, 0D
        mov     eax, dword [ebp+8H]                     ; 25AD _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 25B0 _ 8B. 00
        lea     edx, [eax-1H]                           ; 25B2 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 25B5 _ 8B. 45, 08
        mov     dword [eax], edx                        ; 25B8 _ 89. 10
?_090:  mov     eax, dword [ebp-4H]                     ; 25BA _ 8B. 45, FC
        jmp     ?_093                                   ; 25BD _ EB, 17

?_091:  add     dword [ebp-8H], 1                       ; 25BF _ 83. 45, F8, 01
?_092:  mov     eax, dword [ebp+8H]                     ; 25C3 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 25C6 _ 8B. 00
        cmp     eax, dword [ebp-8H]                     ; 25C8 _ 3B. 45, F8
        ja      ?_089                                   ; 25CB _ 0F 87, FFFFFF6D
        mov     eax, 0                                  ; 25D1 _ B8, 00000000
?_093:  leave                                           ; 25D6 _ C9
        ret                                             ; 25D7 _ C3
; memman_alloc End of function

memman_free:; Function begin
        push    ebp                                     ; 25D8 _ 55
        mov     ebp, esp                                ; 25D9 _ 89. E5
        push    ebx                                     ; 25DB _ 53
        sub     esp, 16                                 ; 25DC _ 83. EC, 10
        mov     dword [ebp-0CH], 0                      ; 25DF _ C7. 45, F4, 00000000
        jmp     ?_096                                   ; 25E6 _ EB, 17

?_094:  mov     eax, dword [ebp+8H]                     ; 25E8 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 25EB _ 8B. 55, F4
        add     edx, 2                                  ; 25EE _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 25F1 _ 8B. 04 D0
        cmp     eax, dword [ebp+0CH]                    ; 25F4 _ 3B. 45, 0C
        jbe     ?_095                                   ; 25F7 _ 76, 02
        jmp     ?_097                                   ; 25F9 _ EB, 0E

?_095:  add     dword [ebp-0CH], 1                      ; 25FB _ 83. 45, F4, 01
?_096:  mov     eax, dword [ebp+8H]                     ; 25FF _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 2602 _ 8B. 00
        cmp     eax, dword [ebp-0CH]                    ; 2604 _ 3B. 45, F4
        jg      ?_094                                   ; 2607 _ 7F, DF
?_097:  cmp     dword [ebp-0CH], 0                      ; 2609 _ 83. 7D, F4, 00
        jle     ?_099                                   ; 260D _ 0F 8E, 000000BA
        mov     eax, dword [ebp-0CH]                    ; 2613 _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 2616 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 2619 _ 8B. 45, 08
        add     edx, 2                                  ; 261C _ 83. C2, 02
        mov     edx, dword [eax+edx*8]                  ; 261F _ 8B. 14 D0
        mov     eax, dword [ebp-0CH]                    ; 2622 _ 8B. 45, F4
        lea     ecx, [eax-1H]                           ; 2625 _ 8D. 48, FF
        mov     eax, dword [ebp+8H]                     ; 2628 _ 8B. 45, 08
        add     ecx, 2                                  ; 262B _ 83. C1, 02
        mov     eax, dword [eax+ecx*8+4H]               ; 262E _ 8B. 44 C8, 04
        add     eax, edx                                ; 2632 _ 01. D0
        cmp     eax, dword [ebp+0CH]                    ; 2634 _ 3B. 45, 0C
        jne     ?_099                                   ; 2637 _ 0F 85, 00000090
        mov     eax, dword [ebp-0CH]                    ; 263D _ 8B. 45, F4
        lea     ebx, [eax-1H]                           ; 2640 _ 8D. 58, FF
        mov     eax, dword [ebp-0CH]                    ; 2643 _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 2646 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 2649 _ 8B. 45, 08
        add     edx, 2                                  ; 264C _ 83. C2, 02
        mov     edx, dword [eax+edx*8+4H]               ; 264F _ 8B. 54 D0, 04
        mov     eax, dword [ebp+10H]                    ; 2653 _ 8B. 45, 10
        lea     ecx, [edx+eax]                          ; 2656 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 2659 _ 8B. 45, 08
        lea     edx, [ebx+2H]                           ; 265C _ 8D. 53, 02
        mov     dword [eax+edx*8+4H], ecx               ; 265F _ 89. 4C D0, 04
        mov     eax, dword [ebp+8H]                     ; 2663 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 2666 _ 8B. 00
        cmp     eax, dword [ebp-0CH]                    ; 2668 _ 3B. 45, F4
        jle     ?_098                                   ; 266B _ 7E, 56
        mov     eax, dword [ebp+10H]                    ; 266D _ 8B. 45, 10
        mov     edx, dword [ebp+0CH]                    ; 2670 _ 8B. 55, 0C
        lea     ecx, [edx+eax]                          ; 2673 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 2676 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 2679 _ 8B. 55, F4
        add     edx, 2                                  ; 267C _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 267F _ 8B. 04 D0
        cmp     ecx, eax                                ; 2682 _ 39. C1
        jnz     ?_098                                   ; 2684 _ 75, 3D
        mov     eax, dword [ebp-0CH]                    ; 2686 _ 8B. 45, F4
        lea     ebx, [eax-1H]                           ; 2689 _ 8D. 58, FF
        mov     eax, dword [ebp-0CH]                    ; 268C _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 268F _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 2692 _ 8B. 45, 08
        add     edx, 2                                  ; 2695 _ 83. C2, 02
        mov     edx, dword [eax+edx*8+4H]               ; 2698 _ 8B. 54 D0, 04
        mov     eax, dword [ebp+8H]                     ; 269C _ 8B. 45, 08
        mov     ecx, dword [ebp-0CH]                    ; 269F _ 8B. 4D, F4
        add     ecx, 2                                  ; 26A2 _ 83. C1, 02
        mov     eax, dword [eax+ecx*8+4H]               ; 26A5 _ 8B. 44 C8, 04
        lea     ecx, [edx+eax]                          ; 26A9 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 26AC _ 8B. 45, 08
        lea     edx, [ebx+2H]                           ; 26AF _ 8D. 53, 02
        mov     dword [eax+edx*8+4H], ecx               ; 26B2 _ 89. 4C D0, 04
        mov     eax, dword [ebp+8H]                     ; 26B6 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 26B9 _ 8B. 00
        lea     edx, [eax-1H]                           ; 26BB _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 26BE _ 8B. 45, 08
        mov     dword [eax], edx                        ; 26C1 _ 89. 10
?_098:  mov     eax, 0                                  ; 26C3 _ B8, 00000000
        jmp     ?_105                                   ; 26C8 _ E9, 0000011C

?_099:  mov     eax, dword [ebp+8H]                     ; 26CD _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 26D0 _ 8B. 00
        cmp     eax, dword [ebp-0CH]                    ; 26D2 _ 3B. 45, F4
        jle     ?_100                                   ; 26D5 _ 7E, 52
        mov     eax, dword [ebp+10H]                    ; 26D7 _ 8B. 45, 10
        mov     edx, dword [ebp+0CH]                    ; 26DA _ 8B. 55, 0C
        lea     ecx, [edx+eax]                          ; 26DD _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 26E0 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 26E3 _ 8B. 55, F4
        add     edx, 2                                  ; 26E6 _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 26E9 _ 8B. 04 D0
        cmp     ecx, eax                                ; 26EC _ 39. C1
        jnz     ?_100                                   ; 26EE _ 75, 39
        mov     eax, dword [ebp+8H]                     ; 26F0 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 26F3 _ 8B. 55, F4
        lea     ecx, [edx+2H]                           ; 26F6 _ 8D. 4A, 02
        mov     edx, dword [ebp+0CH]                    ; 26F9 _ 8B. 55, 0C
        mov     dword [eax+ecx*8], edx                  ; 26FC _ 89. 14 C8
        mov     eax, dword [ebp+8H]                     ; 26FF _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 2702 _ 8B. 55, F4
        add     edx, 2                                  ; 2705 _ 83. C2, 02
        mov     edx, dword [eax+edx*8+4H]               ; 2708 _ 8B. 54 D0, 04
        mov     eax, dword [ebp+10H]                    ; 270C _ 8B. 45, 10
        lea     ecx, [edx+eax]                          ; 270F _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 2712 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 2715 _ 8B. 55, F4
        add     edx, 2                                  ; 2718 _ 83. C2, 02
        mov     dword [eax+edx*8+4H], ecx               ; 271B _ 89. 4C D0, 04
        mov     eax, 0                                  ; 271F _ B8, 00000000
        jmp     ?_105                                   ; 2724 _ E9, 000000C0

?_100:  mov     eax, dword [ebp+8H]                     ; 2729 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 272C _ 8B. 00
        cmp     eax, 4095                               ; 272E _ 3D, 00000FFF
        jg      ?_104                                   ; 2733 _ 0F 8F, 00000087
        mov     eax, dword [ebp+8H]                     ; 2739 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 273C _ 8B. 00
        mov     dword [ebp-8H], eax                     ; 273E _ 89. 45, F8
        jmp     ?_102                                   ; 2741 _ EB, 28

?_101:  mov     eax, dword [ebp-8H]                     ; 2743 _ 8B. 45, F8
        lea     edx, [eax-1H]                           ; 2746 _ 8D. 50, FF
        mov     ecx, dword [ebp+8H]                     ; 2749 _ 8B. 4D, 08
        mov     eax, dword [ebp-8H]                     ; 274C _ 8B. 45, F8
        lea     ebx, [eax+2H]                           ; 274F _ 8D. 58, 02
        mov     eax, dword [ebp+8H]                     ; 2752 _ 8B. 45, 08
        add     edx, 2                                  ; 2755 _ 83. C2, 02
        lea     edx, [eax+edx*8]                        ; 2758 _ 8D. 14 D0
        mov     eax, dword [edx]                        ; 275B _ 8B. 02
        mov     edx, dword [edx+4H]                     ; 275D _ 8B. 52, 04
        mov     dword [ecx+ebx*8], eax                  ; 2760 _ 89. 04 D9
        mov     dword [ecx+ebx*8+4H], edx               ; 2763 _ 89. 54 D9, 04
        sub     dword [ebp-8H], 1                       ; 2767 _ 83. 6D, F8, 01
?_102:  mov     eax, dword [ebp-8H]                     ; 276B _ 8B. 45, F8
        cmp     eax, dword [ebp-0CH]                    ; 276E _ 3B. 45, F4
        jg      ?_101                                   ; 2771 _ 7F, D0
        mov     eax, dword [ebp+8H]                     ; 2773 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 2776 _ 8B. 00
        lea     edx, [eax+1H]                           ; 2778 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 277B _ 8B. 45, 08
        mov     dword [eax], edx                        ; 277E _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 2780 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 2783 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 2786 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 2789 _ 8B. 00
        cmp     edx, eax                                ; 278B _ 39. C2
        jge     ?_103                                   ; 278D _ 7D, 0B
        mov     eax, dword [ebp+8H]                     ; 278F _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 2792 _ 8B. 10
        mov     eax, dword [ebp+8H]                     ; 2794 _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 2797 _ 89. 50, 04
?_103:  mov     eax, dword [ebp+8H]                     ; 279A _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 279D _ 8B. 55, F4
        lea     ecx, [edx+2H]                           ; 27A0 _ 8D. 4A, 02
        mov     edx, dword [ebp+0CH]                    ; 27A3 _ 8B. 55, 0C
        mov     dword [eax+ecx*8], edx                  ; 27A6 _ 89. 14 C8
        mov     eax, dword [ebp+8H]                     ; 27A9 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 27AC _ 8B. 55, F4
        lea     ecx, [edx+2H]                           ; 27AF _ 8D. 4A, 02
        mov     edx, dword [ebp+10H]                    ; 27B2 _ 8B. 55, 10
        mov     dword [eax+ecx*8+4H], edx               ; 27B5 _ 89. 54 C8, 04
        mov     eax, 0                                  ; 27B9 _ B8, 00000000
        jmp     ?_105                                   ; 27BE _ EB, 29

?_104:  mov     eax, dword [ebp+8H]                     ; 27C0 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 27C3 _ 8B. 40, 0C
        lea     edx, [eax+1H]                           ; 27C6 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 27C9 _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 27CC _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 27CF _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 27D2 _ 8B. 40, 08
        mov     edx, eax                                ; 27D5 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 27D7 _ 8B. 45, 10
        add     eax, edx                                ; 27DA _ 01. D0
        mov     edx, eax                                ; 27DC _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 27DE _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 27E1 _ 89. 50, 08
        mov     eax, 4294967295                         ; 27E4 _ B8, FFFFFFFF
?_105:  add     esp, 16                                 ; 27E9 _ 83. C4, 10
        pop     ebx                                     ; 27EC _ 5B
        pop     ebp                                     ; 27ED _ 5D
        ret                                             ; 27EE _ C3
; memman_free End of function

memman_alloc_4k:; Function begin
        push    ebp                                     ; 27EF _ 55
        mov     ebp, esp                                ; 27F0 _ 89. E5
        sub     esp, 24                                 ; 27F2 _ 83. EC, 18
        mov     eax, dword [ebp+0CH]                    ; 27F5 _ 8B. 45, 0C
        add     eax, 4095                               ; 27F8 _ 05, 00000FFF
        and     eax, 0FFFFF000H                         ; 27FD _ 25, FFFFF000
        mov     dword [ebp+0CH], eax                    ; 2802 _ 89. 45, 0C
        mov     eax, dword [ebp+0CH]                    ; 2805 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 2808 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 280C _ 8B. 45, 08
        mov     dword [esp], eax                        ; 280F _ 89. 04 24
        call    memman_alloc                            ; 2812 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-4H], eax                     ; 2817 _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 281A _ 8B. 45, FC
        leave                                           ; 281D _ C9
        ret                                             ; 281E _ C3
; memman_alloc_4k End of function

memman_free_4k:; Function begin
        push    ebp                                     ; 281F _ 55
        mov     ebp, esp                                ; 2820 _ 89. E5
        sub     esp, 28                                 ; 2822 _ 83. EC, 1C
        mov     eax, dword [ebp+10H]                    ; 2825 _ 8B. 45, 10
        add     eax, 4095                               ; 2828 _ 05, 00000FFF
        and     eax, 0FFFFF000H                         ; 282D _ 25, FFFFF000
        mov     dword [ebp+10H], eax                    ; 2832 _ 89. 45, 10
        mov     eax, dword [ebp+10H]                    ; 2835 _ 8B. 45, 10
        mov     dword [esp+8H], eax                     ; 2838 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 283C _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 283F _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2843 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2846 _ 89. 04 24
        call    memman_free                             ; 2849 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-4H], eax                     ; 284E _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 2851 _ 8B. 45, FC
        leave                                           ; 2854 _ C9
        ret                                             ; 2855 _ C3
; memman_free_4k End of function

sheet_control_init:; Function begin
        push    ebp                                     ; 2856 _ 55
        mov     ebp, esp                                ; 2857 _ 89. E5
        sub     esp, 40                                 ; 2859 _ 83. EC, 28
        mov     dword [esp+4H], 9236                    ; 285C _ C7. 44 24, 04, 00002414
        mov     eax, dword [ebp+8H]                     ; 2864 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2867 _ 89. 04 24
        call    memman_alloc_4k                         ; 286A _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 286F _ 89. 45, F4
        cmp     dword [ebp-0CH], 0                      ; 2872 _ 83. 7D, F4, 00
        jnz     ?_106                                   ; 2876 _ 75, 24
        mov     eax, dword [ebp-0CH]                    ; 2878 _ 8B. 45, F4
        mov     dword [esp+8H], 9236                    ; 287B _ C7. 44 24, 08, 00002414
        mov     dword [esp+4H], eax                     ; 2883 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2887 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 288A _ 89. 04 24
        call    memman_free_4k                          ; 288D _ E8, FFFFFFFC(rel)
        mov     eax, 0                                  ; 2892 _ B8, 00000000
        jmp     ?_110                                   ; 2897 _ E9, 0000009D

?_106:  mov     eax, dword [ebp-0CH]                    ; 289C _ 8B. 45, F4
        mov     edx, dword [ebp+0CH]                    ; 289F _ 8B. 55, 0C
        mov     dword [eax], edx                        ; 28A2 _ 89. 10
        mov     eax, dword [ebp-0CH]                    ; 28A4 _ 8B. 45, F4
        mov     edx, dword [ebp+10H]                    ; 28A7 _ 8B. 55, 10
        mov     dword [eax+4H], edx                     ; 28AA _ 89. 50, 04
        mov     eax, dword [ebp-0CH]                    ; 28AD _ 8B. 45, F4
        mov     edx, dword [ebp+14H]                    ; 28B0 _ 8B. 55, 14
        mov     dword [eax+8H], edx                     ; 28B3 _ 89. 50, 08
        mov     eax, dword [ebp-0CH]                    ; 28B6 _ 8B. 45, F4
        mov     dword [eax+0CH], -1                     ; 28B9 _ C7. 40, 0C, FFFFFFFF
        mov     dword [ebp-10H], 0                      ; 28C0 _ C7. 45, F0, 00000000
        jmp     ?_108                                   ; 28C7 _ EB, 1B

?_107:  mov     eax, dword [ebp-0CH]                    ; 28C9 _ 8B. 45, F4
        mov     edx, dword [ebp-10H]                    ; 28CC _ 8B. 55, F0
        add     edx, 33                                 ; 28CF _ 83. C2, 21
        shl     edx, 5                                  ; 28D2 _ C1. E2, 05
        add     eax, edx                                ; 28D5 _ 01. D0
        add     eax, 16                                 ; 28D7 _ 83. C0, 10
        mov     dword [eax], 0                          ; 28DA _ C7. 00, 00000000
        add     dword [ebp-10H], 1                      ; 28E0 _ 83. 45, F0, 01
?_108:  cmp     dword [ebp-10H], 255                    ; 28E4 _ 81. 7D, F0, 000000FF
        jle     ?_107                                   ; 28EB _ 7E, DC
        mov     eax, dword [ebp+10H]                    ; 28ED _ 8B. 45, 10
        imul    eax, dword [ebp+14H]                    ; 28F0 _ 0F AF. 45, 14
        mov     dword [esp+4H], eax                     ; 28F4 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 28F8 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 28FB _ 89. 04 24
        call    memman_alloc_4k                         ; 28FE _ E8, FFFFFFFC(rel)
        mov     edx, eax                                ; 2903 _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 2905 _ 8B. 45, F4
        mov     dword [eax+10H], edx                    ; 2908 _ 89. 50, 10
        mov     eax, dword [ebp-0CH]                    ; 290B _ 8B. 45, F4
        mov     eax, dword [eax+10H]                    ; 290E _ 8B. 40, 10
        test    eax, eax                                ; 2911 _ 85. C0
        jnz     ?_109                                   ; 2913 _ 75, 21
        mov     eax, dword [ebp-0CH]                    ; 2915 _ 8B. 45, F4
        mov     dword [esp+8H], 9236                    ; 2918 _ C7. 44 24, 08, 00002414
        mov     dword [esp+4H], eax                     ; 2920 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2924 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2927 _ 89. 04 24
        call    memman_free_4k                          ; 292A _ E8, FFFFFFFC(rel)
        mov     eax, 0                                  ; 292F _ B8, 00000000
        jmp     ?_110                                   ; 2934 _ EB, 03

?_109:  mov     eax, dword [ebp-0CH]                    ; 2936 _ 8B. 45, F4
?_110:  leave                                           ; 2939 _ C9
        ret                                             ; 293A _ C3
; sheet_control_init End of function

sheet_alloc:; Function begin
        push    ebp                                     ; 293B _ 55
        mov     ebp, esp                                ; 293C _ 89. E5
        sub     esp, 16                                 ; 293E _ 83. EC, 10
        mov     dword [ebp-8H], 0                       ; 2941 _ C7. 45, F8, 00000000
        jmp     ?_113                                   ; 2948 _ EB, 5B

?_111:  mov     eax, dword [ebp+8H]                     ; 294A _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 294D _ 8B. 55, F8
        add     edx, 33                                 ; 2950 _ 83. C2, 21
        shl     edx, 5                                  ; 2953 _ C1. E2, 05
        add     eax, edx                                ; 2956 _ 01. D0
        add     eax, 16                                 ; 2958 _ 83. C0, 10
        mov     eax, dword [eax]                        ; 295B _ 8B. 00
        test    eax, eax                                ; 295D _ 85. C0
        jnz     ?_112                                   ; 295F _ 75, 40
        mov     eax, dword [ebp-8H]                     ; 2961 _ 8B. 45, F8
        shl     eax, 5                                  ; 2964 _ C1. E0, 05
        lea     edx, [eax+410H]                         ; 2967 _ 8D. 90, 00000410
        mov     eax, dword [ebp+8H]                     ; 296D _ 8B. 45, 08
        add     eax, edx                                ; 2970 _ 01. D0
        add     eax, 4                                  ; 2972 _ 83. C0, 04
        mov     dword [ebp-4H], eax                     ; 2975 _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 2978 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 297B _ 8B. 55, F8
        lea     ecx, [edx+4H]                           ; 297E _ 8D. 4A, 04
        mov     edx, dword [ebp-4H]                     ; 2981 _ 8B. 55, FC
        mov     dword [eax+ecx*4+4H], edx               ; 2984 _ 89. 54 88, 04
        mov     eax, dword [ebp-4H]                     ; 2988 _ 8B. 45, FC
        mov     dword [eax+1CH], 1                      ; 298B _ C7. 40, 1C, 00000001
        mov     eax, dword [ebp-4H]                     ; 2992 _ 8B. 45, FC
        mov     dword [eax+18H], -1                     ; 2995 _ C7. 40, 18, FFFFFFFF
        mov     eax, dword [ebp-4H]                     ; 299C _ 8B. 45, FC
        jmp     ?_114                                   ; 299F _ EB, 12

?_112:  add     dword [ebp-8H], 1                       ; 29A1 _ 83. 45, F8, 01
?_113:  cmp     dword [ebp-8H], 255                     ; 29A5 _ 81. 7D, F8, 000000FF
        jle     ?_111                                   ; 29AC _ 7E, 9C
        mov     eax, 0                                  ; 29AE _ B8, 00000000
?_114:  leave                                           ; 29B3 _ C9
        ret                                             ; 29B4 _ C3
; sheet_alloc End of function

sheet_setbuf:; Function begin
        push    ebp                                     ; 29B5 _ 55
        mov     ebp, esp                                ; 29B6 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 29B8 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 29BB _ 8B. 55, 0C
        mov     dword [eax], edx                        ; 29BE _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 29C0 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 29C3 _ 8B. 55, 10
        mov     dword [eax+4H], edx                     ; 29C6 _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 29C9 _ 8B. 45, 08
        mov     edx, dword [ebp+14H]                    ; 29CC _ 8B. 55, 14
        mov     dword [eax+8H], edx                     ; 29CF _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 29D2 _ 8B. 45, 08
        mov     edx, dword [ebp+18H]                    ; 29D5 _ 8B. 55, 18
        mov     dword [eax+14H], edx                    ; 29D8 _ 89. 50, 14
        pop     ebp                                     ; 29DB _ 5D
        ret                                             ; 29DC _ C3
; sheet_setbuf End of function

sheet_updown:; Function begin
        push    ebp                                     ; 29DD _ 55
        mov     ebp, esp                                ; 29DE _ 89. E5
        push    esi                                     ; 29E0 _ 56
        push    ebx                                     ; 29E1 _ 53
        sub     esp, 48                                 ; 29E2 _ 83. EC, 30
        mov     eax, dword [ebp+0CH]                    ; 29E5 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 29E8 _ 8B. 40, 18
        mov     dword [ebp-0CH], eax                    ; 29EB _ 89. 45, F4
        mov     eax, dword [ebp+8H]                     ; 29EE _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 29F1 _ 8B. 40, 0C
        add     eax, 1                                  ; 29F4 _ 83. C0, 01
        cmp     eax, dword [ebp+10H]                    ; 29F7 _ 3B. 45, 10
        jge     ?_115                                   ; 29FA _ 7D, 0C
        mov     eax, dword [ebp+8H]                     ; 29FC _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 29FF _ 8B. 40, 0C
        add     eax, 1                                  ; 2A02 _ 83. C0, 01
        mov     dword [ebp+10H], eax                    ; 2A05 _ 89. 45, 10
?_115:  cmp     dword [ebp+10H], -1                     ; 2A08 _ 83. 7D, 10, FF
        jge     ?_116                                   ; 2A0C _ 7D, 07
        mov     dword [ebp+10H], -1                     ; 2A0E _ C7. 45, 10, FFFFFFFF
?_116:  mov     eax, dword [ebp+0CH]                    ; 2A15 _ 8B. 45, 0C
        mov     edx, dword [ebp+10H]                    ; 2A18 _ 8B. 55, 10
        mov     dword [eax+18H], edx                    ; 2A1B _ 89. 50, 18
        mov     eax, dword [ebp-0CH]                    ; 2A1E _ 8B. 45, F4
        cmp     eax, dword [ebp+10H]                    ; 2A21 _ 3B. 45, 10
        jle     ?_123                                   ; 2A24 _ 0F 8E, 00000201
        cmp     dword [ebp+10H], 0                      ; 2A2A _ 83. 7D, 10, 00
        js      ?_119                                   ; 2A2E _ 0F 88, 000000F7
        mov     eax, dword [ebp-0CH]                    ; 2A34 _ 8B. 45, F4
        mov     dword [ebp-10H], eax                    ; 2A37 _ 89. 45, F0
        jmp     ?_118                                   ; 2A3A _ EB, 34

?_117:  mov     eax, dword [ebp-10H]                    ; 2A3C _ 8B. 45, F0
        lea     edx, [eax-1H]                           ; 2A3F _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 2A42 _ 8B. 45, 08
        add     edx, 4                                  ; 2A45 _ 83. C2, 04
        mov     edx, dword [eax+edx*4+4H]               ; 2A48 _ 8B. 54 90, 04
        mov     eax, dword [ebp+8H]                     ; 2A4C _ 8B. 45, 08
        mov     ecx, dword [ebp-10H]                    ; 2A4F _ 8B. 4D, F0
        add     ecx, 4                                  ; 2A52 _ 83. C1, 04
        mov     dword [eax+ecx*4+4H], edx               ; 2A55 _ 89. 54 88, 04
        mov     eax, dword [ebp+8H]                     ; 2A59 _ 8B. 45, 08
        mov     edx, dword [ebp-10H]                    ; 2A5C _ 8B. 55, F0
        add     edx, 4                                  ; 2A5F _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 2A62 _ 8B. 44 90, 04
        mov     edx, dword [ebp-10H]                    ; 2A66 _ 8B. 55, F0
        mov     dword [eax+18H], edx                    ; 2A69 _ 89. 50, 18
        sub     dword [ebp-10H], 1                      ; 2A6C _ 83. 6D, F0, 01
?_118:  mov     eax, dword [ebp-10H]                    ; 2A70 _ 8B. 45, F0
        cmp     eax, dword [ebp+10H]                    ; 2A73 _ 3B. 45, 10
        jg      ?_117                                   ; 2A76 _ 7F, C4
        mov     eax, dword [ebp+8H]                     ; 2A78 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 2A7B _ 8B. 55, 10
        lea     ecx, [edx+4H]                           ; 2A7E _ 8D. 4A, 04
        mov     edx, dword [ebp+0CH]                    ; 2A81 _ 8B. 55, 0C
        mov     dword [eax+ecx*4+4H], edx               ; 2A84 _ 89. 54 88, 04
        mov     eax, dword [ebp+10H]                    ; 2A88 _ 8B. 45, 10
        lea     esi, [eax+1H]                           ; 2A8B _ 8D. 70, 01
        mov     eax, dword [ebp+0CH]                    ; 2A8E _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 2A91 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 2A94 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 2A97 _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 2A9A _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 2A9D _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 2AA0 _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 2AA3 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 2AA6 _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 2AA9 _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 2AAC _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 2AAF _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 2AB2 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 2AB5 _ 8B. 40, 0C
        mov     dword [esp+14H], esi                    ; 2AB8 _ 89. 74 24, 14
        mov     dword [esp+10H], ebx                    ; 2ABC _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 2AC0 _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 2AC4 _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 2AC8 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2ACC _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2ACF _ 89. 04 24
        call    sheet_refresh_map                       ; 2AD2 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 2AD7 _ 8B. 45, 10
        lea     esi, [eax+1H]                           ; 2ADA _ 8D. 70, 01
        mov     eax, dword [ebp+0CH]                    ; 2ADD _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 2AE0 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 2AE3 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 2AE6 _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 2AE9 _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 2AEC _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 2AEF _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 2AF2 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 2AF5 _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 2AF8 _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 2AFB _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 2AFE _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 2B01 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 2B04 _ 8B. 40, 0C
        mov     dword [esp+14H], esi                    ; 2B07 _ 89. 74 24, 14
        mov     dword [esp+10H], ebx                    ; 2B0B _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 2B0F _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 2B13 _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 2B17 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2B1B _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2B1E _ 89. 04 24
        call    sheet_refresh_local                     ; 2B21 _ E8, FFFFFFFC(rel)
        jmp     ?_130                                   ; 2B26 _ E9, 0000026C

?_119:  mov     eax, dword [ebp+8H]                     ; 2B2B _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 2B2E _ 8B. 40, 0C
        cmp     eax, dword [ebp-0CH]                    ; 2B31 _ 3B. 45, F4
        jle     ?_122                                   ; 2B34 _ 7E, 47
        mov     eax, dword [ebp-0CH]                    ; 2B36 _ 8B. 45, F4
        mov     dword [ebp-10H], eax                    ; 2B39 _ 89. 45, F0
        jmp     ?_121                                   ; 2B3C _ EB, 34

?_120:  mov     eax, dword [ebp-10H]                    ; 2B3E _ 8B. 45, F0
        lea     edx, [eax+1H]                           ; 2B41 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 2B44 _ 8B. 45, 08
        add     edx, 4                                  ; 2B47 _ 83. C2, 04
        mov     edx, dword [eax+edx*4+4H]               ; 2B4A _ 8B. 54 90, 04
        mov     eax, dword [ebp+8H]                     ; 2B4E _ 8B. 45, 08
        mov     ecx, dword [ebp-10H]                    ; 2B51 _ 8B. 4D, F0
        add     ecx, 4                                  ; 2B54 _ 83. C1, 04
        mov     dword [eax+ecx*4+4H], edx               ; 2B57 _ 89. 54 88, 04
        mov     eax, dword [ebp+8H]                     ; 2B5B _ 8B. 45, 08
        mov     edx, dword [ebp-10H]                    ; 2B5E _ 8B. 55, F0
        add     edx, 4                                  ; 2B61 _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 2B64 _ 8B. 44 90, 04
        mov     edx, dword [ebp-10H]                    ; 2B68 _ 8B. 55, F0
        mov     dword [eax+18H], edx                    ; 2B6B _ 89. 50, 18
        add     dword [ebp-10H], 1                      ; 2B6E _ 83. 45, F0, 01
?_121:  mov     eax, dword [ebp+8H]                     ; 2B72 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 2B75 _ 8B. 40, 0C
        cmp     eax, dword [ebp-10H]                    ; 2B78 _ 3B. 45, F0
        jg      ?_120                                   ; 2B7B _ 7F, C1
?_122:  mov     eax, dword [ebp+8H]                     ; 2B7D _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 2B80 _ 8B. 40, 0C
        lea     edx, [eax-1H]                           ; 2B83 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 2B86 _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 2B89 _ 89. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 2B8C _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 2B8F _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 2B92 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 2B95 _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 2B98 _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 2B9B _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 2B9E _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 2BA1 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 2BA4 _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 2BA7 _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 2BAA _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 2BAD _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 2BB0 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 2BB3 _ 8B. 40, 0C
        mov     dword [esp+14H], 0                      ; 2BB6 _ C7. 44 24, 14, 00000000
        mov     dword [esp+10H], ebx                    ; 2BBE _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 2BC2 _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 2BC6 _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 2BCA _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2BCE _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2BD1 _ 89. 04 24
        call    sheet_refresh_map                       ; 2BD4 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+0CH]                    ; 2BD9 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 2BDC _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 2BDF _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 2BE2 _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 2BE5 _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 2BE8 _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 2BEB _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 2BEE _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 2BF1 _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 2BF4 _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 2BF7 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 2BFA _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 2BFD _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 2C00 _ 8B. 40, 0C
        mov     dword [esp+14H], 0                      ; 2C03 _ C7. 44 24, 14, 00000000
        mov     dword [esp+10H], ebx                    ; 2C0B _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 2C0F _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 2C13 _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 2C17 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2C1B _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2C1E _ 89. 04 24
        call    sheet_refresh_local                     ; 2C21 _ E8, FFFFFFFC(rel)
        jmp     ?_130                                   ; 2C26 _ E9, 0000016C

?_123:  mov     eax, dword [ebp-0CH]                    ; 2C2B _ 8B. 45, F4
        cmp     eax, dword [ebp+10H]                    ; 2C2E _ 3B. 45, 10
        jge     ?_130                                   ; 2C31 _ 0F 8D, 00000160
        cmp     dword [ebp-0CH], 0                      ; 2C37 _ 83. 7D, F4, 00
        js      ?_126                                   ; 2C3B _ 78, 56
        mov     eax, dword [ebp-0CH]                    ; 2C3D _ 8B. 45, F4
        mov     dword [ebp-10H], eax                    ; 2C40 _ 89. 45, F0
        jmp     ?_125                                   ; 2C43 _ EB, 34

?_124:  mov     eax, dword [ebp-10H]                    ; 2C45 _ 8B. 45, F0
        lea     edx, [eax+1H]                           ; 2C48 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 2C4B _ 8B. 45, 08
        add     edx, 4                                  ; 2C4E _ 83. C2, 04
        mov     edx, dword [eax+edx*4+4H]               ; 2C51 _ 8B. 54 90, 04
        mov     eax, dword [ebp+8H]                     ; 2C55 _ 8B. 45, 08
        mov     ecx, dword [ebp-10H]                    ; 2C58 _ 8B. 4D, F0
        add     ecx, 4                                  ; 2C5B _ 83. C1, 04
        mov     dword [eax+ecx*4+4H], edx               ; 2C5E _ 89. 54 88, 04
        mov     eax, dword [ebp+8H]                     ; 2C62 _ 8B. 45, 08
        mov     edx, dword [ebp-10H]                    ; 2C65 _ 8B. 55, F0
        add     edx, 4                                  ; 2C68 _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 2C6B _ 8B. 44 90, 04
        mov     edx, dword [ebp-10H]                    ; 2C6F _ 8B. 55, F0
        mov     dword [eax+18H], edx                    ; 2C72 _ 89. 50, 18
        add     dword [ebp-10H], 1                      ; 2C75 _ 83. 45, F0, 01
?_125:  mov     eax, dword [ebp-10H]                    ; 2C79 _ 8B. 45, F0
        cmp     eax, dword [ebp+10H]                    ; 2C7C _ 3B. 45, 10
        jl      ?_124                                   ; 2C7F _ 7C, C4
        mov     eax, dword [ebp+8H]                     ; 2C81 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 2C84 _ 8B. 55, 10
        lea     ecx, [edx+4H]                           ; 2C87 _ 8D. 4A, 04
        mov     edx, dword [ebp+0CH]                    ; 2C8A _ 8B. 55, 0C
        mov     dword [eax+ecx*4+4H], edx               ; 2C8D _ 89. 54 88, 04
        jmp     ?_129                                   ; 2C91 _ EB, 6C

?_126:  mov     eax, dword [ebp+8H]                     ; 2C93 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 2C96 _ 8B. 40, 0C
        mov     dword [ebp-10H], eax                    ; 2C99 _ 89. 45, F0
        jmp     ?_128                                   ; 2C9C _ EB, 3A

?_127:  mov     eax, dword [ebp-10H]                    ; 2C9E _ 8B. 45, F0
        lea     ecx, [eax+1H]                           ; 2CA1 _ 8D. 48, 01
        mov     eax, dword [ebp+8H]                     ; 2CA4 _ 8B. 45, 08
        mov     edx, dword [ebp-10H]                    ; 2CA7 _ 8B. 55, F0
        add     edx, 4                                  ; 2CAA _ 83. C2, 04
        mov     edx, dword [eax+edx*4+4H]               ; 2CAD _ 8B. 54 90, 04
        mov     eax, dword [ebp+8H]                     ; 2CB1 _ 8B. 45, 08
        add     ecx, 4                                  ; 2CB4 _ 83. C1, 04
        mov     dword [eax+ecx*4+4H], edx               ; 2CB7 _ 89. 54 88, 04
        mov     eax, dword [ebp-10H]                    ; 2CBB _ 8B. 45, F0
        lea     edx, [eax+1H]                           ; 2CBE _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 2CC1 _ 8B. 45, 08
        add     edx, 4                                  ; 2CC4 _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 2CC7 _ 8B. 44 90, 04
        mov     edx, dword [ebp-10H]                    ; 2CCB _ 8B. 55, F0
        add     edx, 1                                  ; 2CCE _ 83. C2, 01
        mov     dword [eax+18H], edx                    ; 2CD1 _ 89. 50, 18
        sub     dword [ebp-10H], 1                      ; 2CD4 _ 83. 6D, F0, 01
?_128:  mov     eax, dword [ebp-10H]                    ; 2CD8 _ 8B. 45, F0
        cmp     eax, dword [ebp+10H]                    ; 2CDB _ 3B. 45, 10
        jge     ?_127                                   ; 2CDE _ 7D, BE
        mov     eax, dword [ebp+8H]                     ; 2CE0 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 2CE3 _ 8B. 55, 10
        lea     ecx, [edx+4H]                           ; 2CE6 _ 8D. 4A, 04
        mov     edx, dword [ebp+0CH]                    ; 2CE9 _ 8B. 55, 0C
        mov     dword [eax+ecx*4+4H], edx               ; 2CEC _ 89. 54 88, 04
        mov     eax, dword [ebp+8H]                     ; 2CF0 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 2CF3 _ 8B. 40, 0C
        lea     edx, [eax+1H]                           ; 2CF6 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 2CF9 _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 2CFC _ 89. 50, 0C
?_129:  mov     eax, dword [ebp+0CH]                    ; 2CFF _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 2D02 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 2D05 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 2D08 _ 8B. 40, 08
        lea     esi, [edx+eax]                          ; 2D0B _ 8D. 34 02
        mov     eax, dword [ebp+0CH]                    ; 2D0E _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 2D11 _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 2D14 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 2D17 _ 8B. 40, 04
        lea     ebx, [edx+eax]                          ; 2D1A _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 2D1D _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 2D20 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 2D23 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 2D26 _ 8B. 40, 0C
        mov     ecx, dword [ebp+10H]                    ; 2D29 _ 8B. 4D, 10
        mov     dword [esp+14H], ecx                    ; 2D2C _ 89. 4C 24, 14
        mov     dword [esp+10H], esi                    ; 2D30 _ 89. 74 24, 10
        mov     dword [esp+0CH], ebx                    ; 2D34 _ 89. 5C 24, 0C
        mov     dword [esp+8H], edx                     ; 2D38 _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 2D3C _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2D40 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2D43 _ 89. 04 24
        call    sheet_refresh_map                       ; 2D46 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+0CH]                    ; 2D4B _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 2D4E _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 2D51 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 2D54 _ 8B. 40, 08
        lea     esi, [edx+eax]                          ; 2D57 _ 8D. 34 02
        mov     eax, dword [ebp+0CH]                    ; 2D5A _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 2D5D _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 2D60 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 2D63 _ 8B. 40, 04
        lea     ebx, [edx+eax]                          ; 2D66 _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 2D69 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 2D6C _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 2D6F _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 2D72 _ 8B. 40, 0C
        mov     ecx, dword [ebp+10H]                    ; 2D75 _ 8B. 4D, 10
        mov     dword [esp+14H], ecx                    ; 2D78 _ 89. 4C 24, 14
        mov     dword [esp+10H], esi                    ; 2D7C _ 89. 74 24, 10
        mov     dword [esp+0CH], ebx                    ; 2D80 _ 89. 5C 24, 0C
        mov     dword [esp+8H], edx                     ; 2D84 _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 2D88 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2D8C _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2D8F _ 89. 04 24
        call    sheet_refresh_local                     ; 2D92 _ E8, FFFFFFFC(rel)
?_130:  add     esp, 48                                 ; 2D97 _ 83. C4, 30
        pop     ebx                                     ; 2D9A _ 5B
        pop     esi                                     ; 2D9B _ 5E
        pop     ebp                                     ; 2D9C _ 5D
        ret                                             ; 2D9D _ C3
; sheet_updown End of function

sheet_refresh:; Function begin
        push    ebp                                     ; 2D9E _ 55
        mov     ebp, esp                                ; 2D9F _ 89. E5
        push    edi                                     ; 2DA1 _ 57
        push    esi                                     ; 2DA2 _ 56
        push    ebx                                     ; 2DA3 _ 53
        sub     esp, 44                                 ; 2DA4 _ 83. EC, 2C
        mov     eax, dword [ebp+0CH]                    ; 2DA7 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 2DAA _ 8B. 40, 18
        test    eax, eax                                ; 2DAD _ 85. C0
        js      ?_131                                   ; 2DAF _ 78, 53
        mov     eax, dword [ebp+0CH]                    ; 2DB1 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 2DB4 _ 8B. 40, 18
        mov     edx, dword [ebp+0CH]                    ; 2DB7 _ 8B. 55, 0C
        mov     ecx, dword [edx+10H]                    ; 2DBA _ 8B. 4A, 10
        mov     edx, dword [ebp+1CH]                    ; 2DBD _ 8B. 55, 1C
        lea     esi, [ecx+edx]                          ; 2DC0 _ 8D. 34 11
        mov     edx, dword [ebp+0CH]                    ; 2DC3 _ 8B. 55, 0C
        mov     ecx, dword [edx+0CH]                    ; 2DC6 _ 8B. 4A, 0C
        mov     edx, dword [ebp+18H]                    ; 2DC9 _ 8B. 55, 18
        lea     ebx, [ecx+edx]                          ; 2DCC _ 8D. 1C 11
        mov     edx, dword [ebp+0CH]                    ; 2DCF _ 8B. 55, 0C
        mov     ecx, dword [edx+10H]                    ; 2DD2 _ 8B. 4A, 10
        mov     edx, dword [ebp+14H]                    ; 2DD5 _ 8B. 55, 14
        add     ecx, edx                                ; 2DD8 _ 01. D1
        mov     edx, dword [ebp+0CH]                    ; 2DDA _ 8B. 55, 0C
        mov     edi, dword [edx+0CH]                    ; 2DDD _ 8B. 7A, 0C
        mov     edx, dword [ebp+10H]                    ; 2DE0 _ 8B. 55, 10
        add     edx, edi                                ; 2DE3 _ 01. FA
        mov     dword [esp+14H], eax                    ; 2DE5 _ 89. 44 24, 14
        mov     dword [esp+10H], esi                    ; 2DE9 _ 89. 74 24, 10
        mov     dword [esp+0CH], ebx                    ; 2DED _ 89. 5C 24, 0C
        mov     dword [esp+8H], ecx                     ; 2DF1 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 2DF5 _ 89. 54 24, 04
        mov     eax, dword [ebp+8H]                     ; 2DF9 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2DFC _ 89. 04 24
        call    sheet_refresh_local                     ; 2DFF _ E8, FFFFFFFC(rel)
?_131:  mov     eax, 0                                  ; 2E04 _ B8, 00000000
        add     esp, 44                                 ; 2E09 _ 83. C4, 2C
        pop     ebx                                     ; 2E0C _ 5B
        pop     esi                                     ; 2E0D _ 5E
        pop     edi                                     ; 2E0E _ 5F
        pop     ebp                                     ; 2E0F _ 5D
        ret                                             ; 2E10 _ C3
; sheet_refresh End of function

sheet_slide:; Function begin
        push    ebp                                     ; 2E11 _ 55
        mov     ebp, esp                                ; 2E12 _ 89. E5
        push    ebx                                     ; 2E14 _ 53
        sub     esp, 52                                 ; 2E15 _ 83. EC, 34
        mov     eax, dword [ebp+0CH]                    ; 2E18 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 2E1B _ 8B. 40, 0C
        mov     dword [ebp-10H], eax                    ; 2E1E _ 89. 45, F0
        mov     eax, dword [ebp+0CH]                    ; 2E21 _ 8B. 45, 0C
        mov     eax, dword [eax+10H]                    ; 2E24 _ 8B. 40, 10
        mov     dword [ebp-0CH], eax                    ; 2E27 _ 89. 45, F4
        mov     eax, dword [ebp+0CH]                    ; 2E2A _ 8B. 45, 0C
        mov     edx, dword [ebp+10H]                    ; 2E2D _ 8B. 55, 10
        mov     dword [eax+0CH], edx                    ; 2E30 _ 89. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 2E33 _ 8B. 45, 0C
        mov     edx, dword [ebp+14H]                    ; 2E36 _ 8B. 55, 14
        mov     dword [eax+10H], edx                    ; 2E39 _ 89. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 2E3C _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 2E3F _ 8B. 40, 18
        test    eax, eax                                ; 2E42 _ 85. C0
        js      ?_132                                   ; 2E44 _ 0F 88, 00000100
        mov     eax, dword [ebp+0CH]                    ; 2E4A _ 8B. 45, 0C
        mov     edx, dword [eax+8H]                     ; 2E4D _ 8B. 50, 08
        mov     eax, dword [ebp-0CH]                    ; 2E50 _ 8B. 45, F4
        add     edx, eax                                ; 2E53 _ 01. C2
        mov     eax, dword [ebp+0CH]                    ; 2E55 _ 8B. 45, 0C
        mov     ecx, dword [eax+4H]                     ; 2E58 _ 8B. 48, 04
        mov     eax, dword [ebp-10H]                    ; 2E5B _ 8B. 45, F0
        add     eax, ecx                                ; 2E5E _ 01. C8
        mov     dword [esp+14H], 0                      ; 2E60 _ C7. 44 24, 14, 00000000
        mov     dword [esp+10H], edx                    ; 2E68 _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 2E6C _ 89. 44 24, 0C
        mov     eax, dword [ebp-0CH]                    ; 2E70 _ 8B. 45, F4
        mov     dword [esp+8H], eax                     ; 2E73 _ 89. 44 24, 08
        mov     eax, dword [ebp-10H]                    ; 2E77 _ 8B. 45, F0
        mov     dword [esp+4H], eax                     ; 2E7A _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2E7E _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2E81 _ 89. 04 24
        call    sheet_refresh_map                       ; 2E84 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+0CH]                    ; 2E89 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 2E8C _ 8B. 40, 18
        mov     edx, dword [ebp+0CH]                    ; 2E8F _ 8B. 55, 0C
        mov     ecx, dword [edx+8H]                     ; 2E92 _ 8B. 4A, 08
        mov     edx, dword [ebp+14H]                    ; 2E95 _ 8B. 55, 14
        add     ecx, edx                                ; 2E98 _ 01. D1
        mov     edx, dword [ebp+0CH]                    ; 2E9A _ 8B. 55, 0C
        mov     ebx, dword [edx+4H]                     ; 2E9D _ 8B. 5A, 04
        mov     edx, dword [ebp+10H]                    ; 2EA0 _ 8B. 55, 10
        add     edx, ebx                                ; 2EA3 _ 01. DA
        mov     dword [esp+14H], eax                    ; 2EA5 _ 89. 44 24, 14
        mov     dword [esp+10H], ecx                    ; 2EA9 _ 89. 4C 24, 10
        mov     dword [esp+0CH], edx                    ; 2EAD _ 89. 54 24, 0C
        mov     eax, dword [ebp+14H]                    ; 2EB1 _ 8B. 45, 14
        mov     dword [esp+8H], eax                     ; 2EB4 _ 89. 44 24, 08
        mov     eax, dword [ebp+10H]                    ; 2EB8 _ 8B. 45, 10
        mov     dword [esp+4H], eax                     ; 2EBB _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2EBF _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2EC2 _ 89. 04 24
        call    sheet_refresh_map                       ; 2EC5 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+0CH]                    ; 2ECA _ 8B. 45, 0C
        mov     edx, dword [eax+8H]                     ; 2ECD _ 8B. 50, 08
        mov     eax, dword [ebp-0CH]                    ; 2ED0 _ 8B. 45, F4
        add     edx, eax                                ; 2ED3 _ 01. C2
        mov     eax, dword [ebp+0CH]                    ; 2ED5 _ 8B. 45, 0C
        mov     ecx, dword [eax+4H]                     ; 2ED8 _ 8B. 48, 04
        mov     eax, dword [ebp-10H]                    ; 2EDB _ 8B. 45, F0
        add     eax, ecx                                ; 2EDE _ 01. C8
        mov     dword [esp+14H], 0                      ; 2EE0 _ C7. 44 24, 14, 00000000
        mov     dword [esp+10H], edx                    ; 2EE8 _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 2EEC _ 89. 44 24, 0C
        mov     eax, dword [ebp-0CH]                    ; 2EF0 _ 8B. 45, F4
        mov     dword [esp+8H], eax                     ; 2EF3 _ 89. 44 24, 08
        mov     eax, dword [ebp-10H]                    ; 2EF7 _ 8B. 45, F0
        mov     dword [esp+4H], eax                     ; 2EFA _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2EFE _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2F01 _ 89. 04 24
        call    sheet_refresh_local                     ; 2F04 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+0CH]                    ; 2F09 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 2F0C _ 8B. 40, 18
        mov     edx, dword [ebp+0CH]                    ; 2F0F _ 8B. 55, 0C
        mov     ecx, dword [edx+8H]                     ; 2F12 _ 8B. 4A, 08
        mov     edx, dword [ebp+14H]                    ; 2F15 _ 8B. 55, 14
        add     ecx, edx                                ; 2F18 _ 01. D1
        mov     edx, dword [ebp+0CH]                    ; 2F1A _ 8B. 55, 0C
        mov     ebx, dword [edx+4H]                     ; 2F1D _ 8B. 5A, 04
        mov     edx, dword [ebp+10H]                    ; 2F20 _ 8B. 55, 10
        add     edx, ebx                                ; 2F23 _ 01. DA
        mov     dword [esp+14H], eax                    ; 2F25 _ 89. 44 24, 14
        mov     dword [esp+10H], ecx                    ; 2F29 _ 89. 4C 24, 10
        mov     dword [esp+0CH], edx                    ; 2F2D _ 89. 54 24, 0C
        mov     eax, dword [ebp+14H]                    ; 2F31 _ 8B. 45, 14
        mov     dword [esp+8H], eax                     ; 2F34 _ 89. 44 24, 08
        mov     eax, dword [ebp+10H]                    ; 2F38 _ 8B. 45, 10
        mov     dword [esp+4H], eax                     ; 2F3B _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2F3F _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2F42 _ 89. 04 24
        call    sheet_refresh_local                     ; 2F45 _ E8, FFFFFFFC(rel)
?_132:  add     esp, 52                                 ; 2F4A _ 83. C4, 34
        pop     ebx                                     ; 2F4D _ 5B
        pop     ebp                                     ; 2F4E _ 5D
        ret                                             ; 2F4F _ C3
; sheet_slide End of function

sheet_refresh_local:; Function begin
        push    ebp                                     ; 2F50 _ 55
        mov     ebp, esp                                ; 2F51 _ 89. E5
        sub     esp, 48                                 ; 2F53 _ 83. EC, 30
        mov     eax, dword [ebp+8H]                     ; 2F56 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 2F59 _ 8B. 00
        mov     dword [ebp-18H], eax                    ; 2F5B _ 89. 45, E8
        mov     eax, dword [ebp+8H]                     ; 2F5E _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 2F61 _ 8B. 40, 10
        mov     dword [ebp-14H], eax                    ; 2F64 _ 89. 45, EC
        cmp     dword [ebp+0CH], 0                      ; 2F67 _ 83. 7D, 0C, 00
        jns     ?_133                                   ; 2F6B _ 79, 07
        mov     dword [ebp+0CH], 0                      ; 2F6D _ C7. 45, 0C, 00000000
?_133:  cmp     dword [ebp+10H], 0                      ; 2F74 _ 83. 7D, 10, 00
        jns     ?_134                                   ; 2F78 _ 79, 07
        mov     dword [ebp+10H], 0                      ; 2F7A _ C7. 45, 10, 00000000
?_134:  mov     eax, dword [ebp+8H]                     ; 2F81 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 2F84 _ 8B. 40, 04
        cmp     eax, dword [ebp+14H]                    ; 2F87 _ 3B. 45, 14
        jge     ?_135                                   ; 2F8A _ 7D, 09
        mov     eax, dword [ebp+8H]                     ; 2F8C _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 2F8F _ 8B. 40, 04
        mov     dword [ebp+14H], eax                    ; 2F92 _ 89. 45, 14
?_135:  mov     eax, dword [ebp+8H]                     ; 2F95 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 2F98 _ 8B. 40, 08
        cmp     eax, dword [ebp+18H]                    ; 2F9B _ 3B. 45, 18
        jge     ?_136                                   ; 2F9E _ 7D, 09
        mov     eax, dword [ebp+8H]                     ; 2FA0 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 2FA3 _ 8B. 40, 08
        mov     dword [ebp+18H], eax                    ; 2FA6 _ 89. 45, 18
?_136:  mov     eax, dword [ebp+1CH]                    ; 2FA9 _ 8B. 45, 1C
        mov     dword [ebp-24H], eax                    ; 2FAC _ 89. 45, DC
        jmp     ?_143                                   ; 2FAF _ E9, 00000119

?_137:  mov     eax, dword [ebp+8H]                     ; 2FB4 _ 8B. 45, 08
        mov     edx, dword [ebp-24H]                    ; 2FB7 _ 8B. 55, DC
        add     edx, 4                                  ; 2FBA _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 2FBD _ 8B. 44 90, 04
        mov     dword [ebp-10H], eax                    ; 2FC1 _ 89. 45, F0
        mov     eax, dword [ebp-10H]                    ; 2FC4 _ 8B. 45, F0
        mov     eax, dword [eax]                        ; 2FC7 _ 8B. 00
        mov     dword [ebp-0CH], eax                    ; 2FC9 _ 89. 45, F4
        mov     edx, dword [ebp-10H]                    ; 2FCC _ 8B. 55, F0
        mov     eax, dword [ebp+8H]                     ; 2FCF _ 8B. 45, 08
        add     eax, 1044                               ; 2FD2 _ 05, 00000414
        sub     edx, eax                                ; 2FD7 _ 29. C2
        mov     eax, edx                                ; 2FD9 _ 89. D0
        sar     eax, 5                                  ; 2FDB _ C1. F8, 05
        mov     byte [ebp-26H], al                      ; 2FDE _ 88. 45, DA
        mov     dword [ebp-1CH], 0                      ; 2FE1 _ C7. 45, E4, 00000000
        jmp     ?_142                                   ; 2FE8 _ E9, 000000CD

?_138:  mov     eax, dword [ebp-10H]                    ; 2FED _ 8B. 45, F0
        mov     edx, dword [eax+10H]                    ; 2FF0 _ 8B. 50, 10
        mov     eax, dword [ebp-1CH]                    ; 2FF3 _ 8B. 45, E4
        add     eax, edx                                ; 2FF6 _ 01. D0
        mov     dword [ebp-8H], eax                     ; 2FF8 _ 89. 45, F8
        mov     dword [ebp-20H], 0                      ; 2FFB _ C7. 45, E0, 00000000
        jmp     ?_141                                   ; 3002 _ E9, 000000A0

?_139:  mov     eax, dword [ebp-10H]                    ; 3007 _ 8B. 45, F0
        mov     edx, dword [eax+0CH]                    ; 300A _ 8B. 50, 0C
        mov     eax, dword [ebp-20H]                    ; 300D _ 8B. 45, E0
        add     eax, edx                                ; 3010 _ 01. D0
        mov     dword [ebp-4H], eax                     ; 3012 _ 89. 45, FC
        mov     eax, dword [ebp+0CH]                    ; 3015 _ 8B. 45, 0C
        cmp     eax, dword [ebp-4H]                     ; 3018 _ 3B. 45, FC
        jg      ?_140                                   ; 301B _ 0F 8F, 00000082
        mov     eax, dword [ebp-4H]                     ; 3021 _ 8B. 45, FC
        cmp     eax, dword [ebp+14H]                    ; 3024 _ 3B. 45, 14
        jge     ?_140                                   ; 3027 _ 7D, 7A
        mov     eax, dword [ebp+10H]                    ; 3029 _ 8B. 45, 10
        cmp     eax, dword [ebp-8H]                     ; 302C _ 3B. 45, F8
        jg      ?_140                                   ; 302F _ 7F, 72
        mov     eax, dword [ebp-8H]                     ; 3031 _ 8B. 45, F8
        cmp     eax, dword [ebp+18H]                    ; 3034 _ 3B. 45, 18
        jge     ?_140                                   ; 3037 _ 7D, 6A
        mov     eax, dword [ebp-10H]                    ; 3039 _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 303C _ 8B. 40, 04
        imul    eax, dword [ebp-1CH]                    ; 303F _ 0F AF. 45, E4
        mov     edx, eax                                ; 3043 _ 89. C2
        mov     eax, dword [ebp-20H]                    ; 3045 _ 8B. 45, E0
        add     eax, edx                                ; 3048 _ 01. D0
        mov     edx, eax                                ; 304A _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 304C _ 8B. 45, F4
        add     eax, edx                                ; 304F _ 01. D0
        movzx   eax, byte [eax]                         ; 3051 _ 0F B6. 00
        mov     byte [ebp-25H], al                      ; 3054 _ 88. 45, DB
        movzx   edx, byte [ebp-25H]                     ; 3057 _ 0F B6. 55, DB
        mov     eax, dword [ebp-10H]                    ; 305B _ 8B. 45, F0
        mov     eax, dword [eax+14H]                    ; 305E _ 8B. 40, 14
        cmp     edx, eax                                ; 3061 _ 39. C2
        jz      ?_140                                   ; 3063 _ 74, 3E
        mov     eax, dword [ebp+8H]                     ; 3065 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 3068 _ 8B. 40, 04
        imul    eax, dword [ebp-8H]                     ; 306B _ 0F AF. 45, F8
        mov     edx, eax                                ; 306F _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 3071 _ 8B. 45, FC
        add     eax, edx                                ; 3074 _ 01. D0
        mov     edx, eax                                ; 3076 _ 89. C2
        mov     eax, dword [ebp-14H]                    ; 3078 _ 8B. 45, EC
        add     eax, edx                                ; 307B _ 01. D0
        movzx   eax, byte [eax]                         ; 307D _ 0F B6. 00
        cmp     al, byte [ebp-26H]                      ; 3080 _ 3A. 45, DA
        jnz     ?_140                                   ; 3083 _ 75, 1E
        mov     eax, dword [ebp+8H]                     ; 3085 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 3088 _ 8B. 40, 04
        imul    eax, dword [ebp-8H]                     ; 308B _ 0F AF. 45, F8
        mov     edx, eax                                ; 308F _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 3091 _ 8B. 45, FC
        add     eax, edx                                ; 3094 _ 01. D0
        mov     edx, eax                                ; 3096 _ 89. C2
        mov     eax, dword [ebp-18H]                    ; 3098 _ 8B. 45, E8
        add     edx, eax                                ; 309B _ 01. C2
        movzx   eax, byte [ebp-25H]                     ; 309D _ 0F B6. 45, DB
        mov     byte [edx], al                          ; 30A1 _ 88. 02
?_140:  add     dword [ebp-20H], 1                      ; 30A3 _ 83. 45, E0, 01
?_141:  mov     eax, dword [ebp-10H]                    ; 30A7 _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 30AA _ 8B. 40, 04
        cmp     eax, dword [ebp-20H]                    ; 30AD _ 3B. 45, E0
        jg      ?_139                                   ; 30B0 _ 0F 8F, FFFFFF51
        add     dword [ebp-1CH], 1                      ; 30B6 _ 83. 45, E4, 01
?_142:  mov     eax, dword [ebp-10H]                    ; 30BA _ 8B. 45, F0
        mov     eax, dword [eax+8H]                     ; 30BD _ 8B. 40, 08
        cmp     eax, dword [ebp-1CH]                    ; 30C0 _ 3B. 45, E4
        jg      ?_138                                   ; 30C3 _ 0F 8F, FFFFFF24
        add     dword [ebp-24H], 1                      ; 30C9 _ 83. 45, DC, 01
?_143:  mov     eax, dword [ebp+8H]                     ; 30CD _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 30D0 _ 8B. 40, 0C
        cmp     eax, dword [ebp-24H]                    ; 30D3 _ 3B. 45, DC
        jge     ?_137                                   ; 30D6 _ 0F 8D, FFFFFED8
        leave                                           ; 30DC _ C9
        ret                                             ; 30DD _ C3
; sheet_refresh_local End of function

sheet_refresh_map:; Function begin
        push    ebp                                     ; 30DE _ 55
        mov     ebp, esp                                ; 30DF _ 89. E5
        sub     esp, 64                                 ; 30E1 _ 83. EC, 40
        mov     eax, dword [ebp+8H]                     ; 30E4 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 30E7 _ 8B. 00
        mov     dword [ebp-18H], eax                    ; 30E9 _ 89. 45, E8
        mov     eax, dword [ebp+8H]                     ; 30EC _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 30EF _ 8B. 40, 10
        mov     dword [ebp-14H], eax                    ; 30F2 _ 89. 45, EC
        cmp     dword [ebp+0CH], 0                      ; 30F5 _ 83. 7D, 0C, 00
        jns     ?_144                                   ; 30F9 _ 79, 07
        mov     dword [ebp+0CH], 0                      ; 30FB _ C7. 45, 0C, 00000000
?_144:  cmp     dword [ebp+10H], 0                      ; 3102 _ 83. 7D, 10, 00
        jns     ?_145                                   ; 3106 _ 79, 07
        mov     dword [ebp+10H], 0                      ; 3108 _ C7. 45, 10, 00000000
?_145:  mov     eax, dword [ebp+8H]                     ; 310F _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 3112 _ 8B. 40, 04
        cmp     eax, dword [ebp+14H]                    ; 3115 _ 3B. 45, 14
        jge     ?_146                                   ; 3118 _ 7D, 09
        mov     eax, dword [ebp+8H]                     ; 311A _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 311D _ 8B. 40, 04
        mov     dword [ebp+14H], eax                    ; 3120 _ 89. 45, 14
?_146:  mov     eax, dword [ebp+8H]                     ; 3123 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 3126 _ 8B. 40, 08
        cmp     eax, dword [ebp+18H]                    ; 3129 _ 3B. 45, 18
        jge     ?_147                                   ; 312C _ 7D, 09
        mov     eax, dword [ebp+8H]                     ; 312E _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 3131 _ 8B. 40, 08
        mov     dword [ebp+18H], eax                    ; 3134 _ 89. 45, 18
?_147:  mov     eax, dword [ebp+1CH]                    ; 3137 _ 8B. 45, 1C
        mov     dword [ebp-34H], eax                    ; 313A _ 89. 45, CC
        jmp     ?_158                                   ; 313D _ E9, 00000141

?_148:  mov     eax, dword [ebp+8H]                     ; 3142 _ 8B. 45, 08
        mov     edx, dword [ebp-34H]                    ; 3145 _ 8B. 55, CC
        add     edx, 4                                  ; 3148 _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 314B _ 8B. 44 90, 04
        mov     dword [ebp-10H], eax                    ; 314F _ 89. 45, F0
        mov     edx, dword [ebp-10H]                    ; 3152 _ 8B. 55, F0
        mov     eax, dword [ebp+8H]                     ; 3155 _ 8B. 45, 08
        add     eax, 1044                               ; 3158 _ 05, 00000414
        sub     edx, eax                                ; 315D _ 29. C2
        mov     eax, edx                                ; 315F _ 89. D0
        sar     eax, 5                                  ; 3161 _ C1. F8, 05
        mov     byte [ebp-35H], al                      ; 3164 _ 88. 45, CB
        mov     eax, dword [ebp-10H]                    ; 3167 _ 8B. 45, F0
        mov     eax, dword [eax]                        ; 316A _ 8B. 00
        mov     dword [ebp-0CH], eax                    ; 316C _ 89. 45, F4
        mov     eax, dword [ebp-10H]                    ; 316F _ 8B. 45, F0
        mov     eax, dword [eax+0CH]                    ; 3172 _ 8B. 40, 0C
        mov     edx, dword [ebp+0CH]                    ; 3175 _ 8B. 55, 0C
        sub     edx, eax                                ; 3178 _ 29. C2
        mov     eax, edx                                ; 317A _ 89. D0
        mov     dword [ebp-30H], eax                    ; 317C _ 89. 45, D0
        mov     eax, dword [ebp-10H]                    ; 317F _ 8B. 45, F0
        mov     eax, dword [eax+10H]                    ; 3182 _ 8B. 40, 10
        mov     edx, dword [ebp+10H]                    ; 3185 _ 8B. 55, 10
        sub     edx, eax                                ; 3188 _ 29. C2
        mov     eax, edx                                ; 318A _ 89. D0
        mov     dword [ebp-2CH], eax                    ; 318C _ 89. 45, D4
        mov     eax, dword [ebp-10H]                    ; 318F _ 8B. 45, F0
        mov     eax, dword [eax+0CH]                    ; 3192 _ 8B. 40, 0C
        mov     edx, dword [ebp+14H]                    ; 3195 _ 8B. 55, 14
        sub     edx, eax                                ; 3198 _ 29. C2
        mov     eax, edx                                ; 319A _ 89. D0
        mov     dword [ebp-28H], eax                    ; 319C _ 89. 45, D8
        mov     eax, dword [ebp-10H]                    ; 319F _ 8B. 45, F0
        mov     eax, dword [eax+10H]                    ; 31A2 _ 8B. 40, 10
        mov     edx, dword [ebp+18H]                    ; 31A5 _ 8B. 55, 18
        sub     edx, eax                                ; 31A8 _ 29. C2
        mov     eax, edx                                ; 31AA _ 89. D0
        mov     dword [ebp-24H], eax                    ; 31AC _ 89. 45, DC
        cmp     dword [ebp-30H], 0                      ; 31AF _ 83. 7D, D0, 00
        jns     ?_149                                   ; 31B3 _ 79, 07
        mov     dword [ebp-30H], 0                      ; 31B5 _ C7. 45, D0, 00000000
?_149:  cmp     dword [ebp-2CH], 0                      ; 31BC _ 83. 7D, D4, 00
        jns     ?_150                                   ; 31C0 _ 79, 07
        mov     dword [ebp-2CH], 0                      ; 31C2 _ C7. 45, D4, 00000000
?_150:  mov     eax, dword [ebp-10H]                    ; 31C9 _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 31CC _ 8B. 40, 04
        cmp     eax, dword [ebp-28H]                    ; 31CF _ 3B. 45, D8
        jge     ?_151                                   ; 31D2 _ 7D, 09
        mov     eax, dword [ebp-10H]                    ; 31D4 _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 31D7 _ 8B. 40, 04
        mov     dword [ebp-28H], eax                    ; 31DA _ 89. 45, D8
?_151:  mov     eax, dword [ebp-10H]                    ; 31DD _ 8B. 45, F0
        mov     eax, dword [eax+8H]                     ; 31E0 _ 8B. 40, 08
        cmp     eax, dword [ebp-24H]                    ; 31E3 _ 3B. 45, DC
        jge     ?_152                                   ; 31E6 _ 7D, 09
        mov     eax, dword [ebp-10H]                    ; 31E8 _ 8B. 45, F0
        mov     eax, dword [eax+8H]                     ; 31EB _ 8B. 40, 08
        mov     dword [ebp-24H], eax                    ; 31EE _ 89. 45, DC
?_152:  mov     eax, dword [ebp-2CH]                    ; 31F1 _ 8B. 45, D4
        mov     dword [ebp-1CH], eax                    ; 31F4 _ 89. 45, E4
        jmp     ?_157                                   ; 31F7 _ EB, 7A

?_153:  mov     eax, dword [ebp-10H]                    ; 31F9 _ 8B. 45, F0
        mov     edx, dword [eax+10H]                    ; 31FC _ 8B. 50, 10
        mov     eax, dword [ebp-1CH]                    ; 31FF _ 8B. 45, E4
        add     eax, edx                                ; 3202 _ 01. D0
        mov     dword [ebp-8H], eax                     ; 3204 _ 89. 45, F8
        mov     eax, dword [ebp-30H]                    ; 3207 _ 8B. 45, D0
        mov     dword [ebp-20H], eax                    ; 320A _ 89. 45, E0
        jmp     ?_156                                   ; 320D _ EB, 58

?_154:  mov     eax, dword [ebp-10H]                    ; 320F _ 8B. 45, F0
        mov     edx, dword [eax+0CH]                    ; 3212 _ 8B. 50, 0C
        mov     eax, dword [ebp-20H]                    ; 3215 _ 8B. 45, E0
        add     eax, edx                                ; 3218 _ 01. D0
        mov     dword [ebp-4H], eax                     ; 321A _ 89. 45, FC
        mov     eax, dword [ebp-10H]                    ; 321D _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 3220 _ 8B. 40, 04
        imul    eax, dword [ebp-1CH]                    ; 3223 _ 0F AF. 45, E4
        mov     edx, eax                                ; 3227 _ 89. C2
        mov     eax, dword [ebp-20H]                    ; 3229 _ 8B. 45, E0
        add     eax, edx                                ; 322C _ 01. D0
        mov     edx, eax                                ; 322E _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 3230 _ 8B. 45, F4
        add     eax, edx                                ; 3233 _ 01. D0
        movzx   eax, byte [eax]                         ; 3235 _ 0F B6. 00
        movzx   edx, al                                 ; 3238 _ 0F B6. D0
        mov     eax, dword [ebp-10H]                    ; 323B _ 8B. 45, F0
        mov     eax, dword [eax+14H]                    ; 323E _ 8B. 40, 14
        cmp     edx, eax                                ; 3241 _ 39. C2
        jz      ?_155                                   ; 3243 _ 74, 1E
        mov     eax, dword [ebp+8H]                     ; 3245 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 3248 _ 8B. 40, 04
        imul    eax, dword [ebp-8H]                     ; 324B _ 0F AF. 45, F8
        mov     edx, eax                                ; 324F _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 3251 _ 8B. 45, FC
        add     eax, edx                                ; 3254 _ 01. D0
        mov     edx, eax                                ; 3256 _ 89. C2
        mov     eax, dword [ebp-14H]                    ; 3258 _ 8B. 45, EC
        add     edx, eax                                ; 325B _ 01. C2
        movzx   eax, byte [ebp-35H]                     ; 325D _ 0F B6. 45, CB
        mov     byte [edx], al                          ; 3261 _ 88. 02
?_155:  add     dword [ebp-20H], 1                      ; 3263 _ 83. 45, E0, 01
?_156:  mov     eax, dword [ebp-20H]                    ; 3267 _ 8B. 45, E0
        cmp     eax, dword [ebp-28H]                    ; 326A _ 3B. 45, D8
        jl      ?_154                                   ; 326D _ 7C, A0
        add     dword [ebp-1CH], 1                      ; 326F _ 83. 45, E4, 01
?_157:  mov     eax, dword [ebp-1CH]                    ; 3273 _ 8B. 45, E4
        cmp     eax, dword [ebp-24H]                    ; 3276 _ 3B. 45, DC
        jl      ?_153                                   ; 3279 _ 0F 8C, FFFFFF7A
        add     dword [ebp-34H], 1                      ; 327F _ 83. 45, CC, 01
?_158:  mov     eax, dword [ebp+8H]                     ; 3283 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 3286 _ 8B. 40, 0C
        cmp     eax, dword [ebp-34H]                    ; 3289 _ 3B. 45, CC
        jge     ?_148                                   ; 328C _ 0F 8D, FFFFFEB0
        leave                                           ; 3292 _ C9
        ret                                             ; 3293 _ C3
; sheet_refresh_map End of function

init_time_port:; Function begin
        push    ebp                                     ; 3294 _ 55
        mov     ebp, esp                                ; 3295 _ 89. E5
        sub     esp, 40                                 ; 3297 _ 83. EC, 28
        mov     dword [esp+4H], 52                      ; 329A _ C7. 44 24, 04, 00000034
        mov     dword [esp], 67                         ; 32A2 _ C7. 04 24, 00000043
        call    io_out8                                 ; 32A9 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 156                     ; 32AE _ C7. 44 24, 04, 0000009C
        mov     dword [esp], 64                         ; 32B6 _ C7. 04 24, 00000040
        call    io_out8                                 ; 32BD _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 46                      ; 32C2 _ C7. 44 24, 04, 0000002E
        mov     dword [esp], 64                         ; 32CA _ C7. 04 24, 00000040
        call    io_out8                                 ; 32D1 _ E8, FFFFFFFC(rel)
        mov     dword [timer_control], 0                ; 32D6 _ C7. 05, 000003C0(d), 00000000
        mov     dword [ebp-0CH], 0                      ; 32E0 _ C7. 45, F4, 00000000
        jmp     ?_160                                   ; 32E7 _ EB, 28

?_159:  mov     eax, dword [ebp-0CH]                    ; 32E9 _ 8B. 45, F4
        shl     eax, 4                                  ; 32EC _ C1. E0, 04
        add     eax, timer_control                      ; 32EF _ 05, 000003C0(d)
        mov     dword [eax+8H], 0                       ; 32F4 _ C7. 40, 08, 00000000
        mov     eax, dword [ebp-0CH]                    ; 32FB _ 8B. 45, F4
        shl     eax, 4                                  ; 32FE _ C1. E0, 04
        add     eax, timer_control                      ; 3301 _ 05, 000003C0(d)
        mov     dword [eax+0CH], 0                      ; 3306 _ C7. 40, 0C, 00000000
        add     dword [ebp-0CH], 1                      ; 330D _ 83. 45, F4, 01
?_160:  cmp     dword [ebp-0CH], 499                    ; 3311 _ 81. 7D, F4, 000001F3
        jle     ?_159                                   ; 3318 _ 7E, CF
        leave                                           ; 331A _ C9
        ret                                             ; 331B _ C3
; init_time_port End of function

get_timer_control:; Function begin
        push    ebp                                     ; 331C _ 55
        mov     ebp, esp                                ; 331D _ 89. E5
        mov     eax, timer_control                      ; 331F _ B8, 000003C0(d)
        pop     ebp                                     ; 3324 _ 5D
        ret                                             ; 3325 _ C3
; get_timer_control End of function

timer_alloc:; Function begin
        push    ebp                                     ; 3326 _ 55
        mov     ebp, esp                                ; 3327 _ 89. E5
        sub     esp, 16                                 ; 3329 _ 83. EC, 10
        mov     dword [ebp-4H], 0                       ; 332C _ C7. 45, FC, 00000000
        jmp     ?_163                                   ; 3333 _ EB, 26

?_161:  mov     eax, dword [ebp-4H]                     ; 3335 _ 8B. 45, FC
        shl     eax, 4                                  ; 3338 _ C1. E0, 04
        add     eax, timer_control                      ; 333B _ 05, 000003C0(d)
        mov     eax, dword [eax+8H]                     ; 3340 _ 8B. 40, 08
        test    eax, eax                                ; 3343 _ 85. C0
        jnz     ?_162                                   ; 3345 _ 75, 10
        mov     eax, dword [ebp-4H]                     ; 3347 _ 8B. 45, FC
        shl     eax, 4                                  ; 334A _ C1. E0, 04
        add     eax, timer_control                      ; 334D _ 05, 000003C0(d)
        add     eax, 4                                  ; 3352 _ 83. C0, 04
        jmp     ?_164                                   ; 3355 _ EB, 0D

?_162:  add     dword [ebp-4H], 1                       ; 3357 _ 83. 45, FC, 01
?_163:  cmp     dword [ebp-4H], 499                     ; 335B _ 81. 7D, FC, 000001F3
        jle     ?_161                                   ; 3362 _ 7E, D1
?_164:  leave                                           ; 3364 _ C9
        ret                                             ; 3365 _ C3
; timer_alloc End of function

timer_free:; Function begin
        push    ebp                                     ; 3366 _ 55
        mov     ebp, esp                                ; 3367 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 3369 _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 336C _ C7. 40, 04, 00000000
        pop     ebp                                     ; 3373 _ 5D
        ret                                             ; 3374 _ C3
; timer_free End of function

timer_init:; Function begin
        push    ebp                                     ; 3375 _ 55
        mov     ebp, esp                                ; 3376 _ 89. E5
        sub     esp, 4                                  ; 3378 _ 83. EC, 04
        mov     eax, dword [ebp+10H]                    ; 337B _ 8B. 45, 10
        mov     byte [ebp-4H], al                       ; 337E _ 88. 45, FC
        mov     eax, dword [ebp+8H]                     ; 3381 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 3384 _ 8B. 55, 0C
        mov     dword [eax+8H], edx                     ; 3387 _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 338A _ 8B. 45, 08
        movzx   edx, byte [ebp-4H]                      ; 338D _ 0F B6. 55, FC
        mov     byte [eax+0CH], dl                      ; 3391 _ 88. 50, 0C
        leave                                           ; 3394 _ C9
        ret                                             ; 3395 _ C3
; timer_init End of function

timer_settime:; Function begin
        push    ebp                                     ; 3396 _ 55
        mov     ebp, esp                                ; 3397 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 3399 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 339C _ 8B. 55, 0C
        mov     dword [eax], edx                        ; 339F _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 33A1 _ 8B. 45, 08
        mov     dword [eax+4H], 2                       ; 33A4 _ C7. 40, 04, 00000002
        pop     ebp                                     ; 33AB _ 5D
        ret                                             ; 33AC _ C3
; timer_settime End of function

intHandlerTimer:; Function begin
        push    ebp                                     ; 33AD _ 55
        mov     ebp, esp                                ; 33AE _ 89. E5
        sub     esp, 40                                 ; 33B0 _ 83. EC, 28
        mov     dword [esp+4H], 96                      ; 33B3 _ C7. 44 24, 04, 00000060
        mov     dword [esp], 32                         ; 33BB _ C7. 04 24, 00000020
        call    io_out8                                 ; 33C2 _ E8, FFFFFFFC(rel)
        mov     eax, dword [timer_control]              ; 33C7 _ A1, 000003C0(d)
        add     eax, 1                                  ; 33CC _ 83. C0, 01
        mov     dword [timer_control], eax              ; 33CF _ A3, 000003C0(d)
        mov     byte [ebp-0DH], 0                       ; 33D4 _ C6. 45, F3, 00
        mov     dword [ebp-0CH], 0                      ; 33D8 _ C7. 45, F4, 00000000
        jmp     ?_168                                   ; 33DF _ E9, 000000B0

?_165:  mov     eax, dword [ebp-0CH]                    ; 33E4 _ 8B. 45, F4
        shl     eax, 4                                  ; 33E7 _ C1. E0, 04
        add     eax, timer_control                      ; 33EA _ 05, 000003C0(d)
        mov     eax, dword [eax+8H]                     ; 33EF _ 8B. 40, 08
        cmp     eax, 2                                  ; 33F2 _ 83. F8, 02
        jne     ?_166                                   ; 33F5 _ 0F 85, 0000008A
        mov     eax, dword [ebp-0CH]                    ; 33FB _ 8B. 45, F4
        shl     eax, 4                                  ; 33FE _ C1. E0, 04
        add     eax, timer_control                      ; 3401 _ 05, 000003C0(d)
        mov     eax, dword [eax+4H]                     ; 3406 _ 8B. 40, 04
        lea     edx, [eax-1H]                           ; 3409 _ 8D. 50, FF
        mov     eax, dword [ebp-0CH]                    ; 340C _ 8B. 45, F4
        shl     eax, 4                                  ; 340F _ C1. E0, 04
        add     eax, timer_control                      ; 3412 _ 05, 000003C0(d)
        mov     dword [eax+4H], edx                     ; 3417 _ 89. 50, 04
        mov     eax, dword [ebp-0CH]                    ; 341A _ 8B. 45, F4
        shl     eax, 4                                  ; 341D _ C1. E0, 04
        add     eax, timer_control                      ; 3420 _ 05, 000003C0(d)
        mov     eax, dword [eax+4H]                     ; 3425 _ 8B. 40, 04
        test    eax, eax                                ; 3428 _ 85. C0
        jnz     ?_166                                   ; 342A _ 75, 59
        mov     eax, dword [ebp-0CH]                    ; 342C _ 8B. 45, F4
        shl     eax, 4                                  ; 342F _ C1. E0, 04
        add     eax, timer_control                      ; 3432 _ 05, 000003C0(d)
        mov     dword [eax+8H], 1                       ; 3437 _ C7. 40, 08, 00000001
        mov     eax, dword [ebp-0CH]                    ; 343E _ 8B. 45, F4
        shl     eax, 4                                  ; 3441 _ C1. E0, 04
        add     eax, timer_control                      ; 3444 _ 05, 000003C0(d)
        movzx   eax, byte [eax+10H]                     ; 3449 _ 0F B6. 40, 10
        movzx   edx, al                                 ; 344D _ 0F B6. D0
        mov     eax, dword [ebp-0CH]                    ; 3450 _ 8B. 45, F4
        shl     eax, 4                                  ; 3453 _ C1. E0, 04
        add     eax, timer_control                      ; 3456 _ 05, 000003C0(d)
        mov     eax, dword [eax+0CH]                    ; 345B _ 8B. 40, 0C
        mov     dword [esp+4H], edx                     ; 345E _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 3462 _ 89. 04 24
        call    fifo8_put                               ; 3465 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 346A _ 8B. 45, F4
        shl     eax, 4                                  ; 346D _ C1. E0, 04
        add     eax, timer_control                      ; 3470 _ 05, 000003C0(d)
        lea     edx, [eax+4H]                           ; 3475 _ 8D. 50, 04
        mov     eax, dword [task_timer]                 ; 3478 _ A1, 00000000(d)
        cmp     edx, eax                                ; 347D _ 39. C2
        jnz     ?_166                                   ; 347F _ 75, 04
        mov     byte [ebp-0DH], 1                       ; 3481 _ C6. 45, F3, 01
?_166:  cmp     byte [ebp-0DH], 0                       ; 3485 _ 80. 7D, F3, 00
        jz      ?_167                                   ; 3489 _ 74, 05
        call    task_switch                             ; 348B _ E8, FFFFFFFC(rel)
?_167:  add     dword [ebp-0CH], 1                      ; 3490 _ 83. 45, F4, 01
?_168:  cmp     dword [ebp-0CH], 499                    ; 3494 _ 81. 7D, F4, 000001F3
        jle     ?_165                                   ; 349B _ 0F 8E, FFFFFF43
        leave                                           ; 34A1 _ C9
        ret                                             ; 34A2 _ C3
; intHandlerTimer End of function

segment_descriptor:; Function begin
        push    ebp                                     ; 34A3 _ 55
        mov     ebp, esp                                ; 34A4 _ 89. E5
        cmp     dword [ebp+0CH], 1048575                ; 34A6 _ 81. 7D, 0C, 000FFFFF
        jbe     ?_169                                   ; 34AD _ 76, 10
        or      dword [ebp+14H], 8000H                  ; 34AF _ 81. 4D, 14, 00008000
        mov     eax, dword [ebp+0CH]                    ; 34B6 _ 8B. 45, 0C
        shr     eax, 12                                 ; 34B9 _ C1. E8, 0C
        mov     dword [ebp+0CH], eax                    ; 34BC _ 89. 45, 0C
?_169:  mov     eax, dword [ebp+0CH]                    ; 34BF _ 8B. 45, 0C
        mov     edx, eax                                ; 34C2 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 34C4 _ 8B. 45, 08
        mov     word [eax], dx                          ; 34C7 _ 66: 89. 10
        mov     eax, dword [ebp+10H]                    ; 34CA _ 8B. 45, 10
        mov     edx, eax                                ; 34CD _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 34CF _ 8B. 45, 08
        mov     word [eax+2H], dx                       ; 34D2 _ 66: 89. 50, 02
        mov     eax, dword [ebp+10H]                    ; 34D6 _ 8B. 45, 10
        sar     eax, 16                                 ; 34D9 _ C1. F8, 10
        mov     edx, eax                                ; 34DC _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 34DE _ 8B. 45, 08
        mov     byte [eax+4H], dl                       ; 34E1 _ 88. 50, 04
        mov     eax, dword [ebp+14H]                    ; 34E4 _ 8B. 45, 14
        mov     edx, eax                                ; 34E7 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 34E9 _ 8B. 45, 08
        mov     byte [eax+5H], dl                       ; 34EC _ 88. 50, 05
        mov     eax, dword [ebp+0CH]                    ; 34EF _ 8B. 45, 0C
        shr     eax, 16                                 ; 34F2 _ C1. E8, 10
        and     eax, 0FH                                ; 34F5 _ 83. E0, 0F
        mov     edx, eax                                ; 34F8 _ 89. C2
        mov     eax, dword [ebp+14H]                    ; 34FA _ 8B. 45, 14
        sar     eax, 8                                  ; 34FD _ C1. F8, 08
        and     eax, 0FFFFFFF0H                         ; 3500 _ 83. E0, F0
        or      eax, edx                                ; 3503 _ 09. D0
        mov     edx, eax                                ; 3505 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 3507 _ 8B. 45, 08
        mov     byte [eax+6H], dl                       ; 350A _ 88. 50, 06
        mov     eax, dword [ebp+10H]                    ; 350D _ 8B. 45, 10
        shr     eax, 24                                 ; 3510 _ C1. E8, 18
        mov     edx, eax                                ; 3513 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 3515 _ 8B. 45, 08
        mov     byte [eax+7H], dl                       ; 3518 _ 88. 50, 07
        pop     ebp                                     ; 351B _ 5D
        ret                                             ; 351C _ C3
; segment_descriptor End of function

task_init:; Function begin
        push    ebp                                     ; 351D _ 55
        mov     ebp, esp                                ; 351E _ 89. E5
        push    ebx                                     ; 3520 _ 53
        sub     esp, 36                                 ; 3521 _ 83. EC, 24
        call    get_addr_gdt                            ; 3524 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 3529 _ 89. 45, F0
        mov     dword [esp+4H], 588                     ; 352C _ C7. 44 24, 04, 0000024C
        mov     eax, dword [ebp+8H]                     ; 3534 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3537 _ 89. 04 24
        call    memman_alloc_4k                         ; 353A _ E8, FFFFFFFC(rel)
        mov     dword [task_control], eax               ; 353F _ A3, 00002308(d)
        mov     dword [ebp-14H], 0                      ; 3544 _ C7. 45, EC, 00000000
        jmp     ?_171                                   ; 354B _ E9, 0000009A

?_170:  mov     ecx, dword [task_control]               ; 3550 _ 8B. 0D, 00002308(d)
        mov     eax, dword [ebp-14H]                    ; 3556 _ 8B. 45, EC
        shl     eax, 4                                  ; 3559 _ C1. E0, 04
        lea     edx, [eax*8]                            ; 355C _ 8D. 14 C5, 00000000
        sub     edx, eax                                ; 3563 _ 29. C2
        lea     eax, [ecx+edx]                          ; 3565 _ 8D. 04 11
        add     eax, 32                                 ; 3568 _ 83. C0, 20
        mov     dword [eax], 0                          ; 356B _ C7. 00, 00000000
        mov     ebx, dword [task_control]               ; 3571 _ 8B. 1D, 00002308(d)
        mov     eax, dword [ebp-14H]                    ; 3577 _ 8B. 45, EC
        add     eax, 8                                  ; 357A _ 83. C0, 08
        lea     ecx, [eax*8]                            ; 357D _ 8D. 0C C5, 00000000
        mov     eax, dword [ebp-14H]                    ; 3584 _ 8B. 45, EC
        shl     eax, 4                                  ; 3587 _ C1. E0, 04
        lea     edx, [eax*8]                            ; 358A _ 8D. 14 C5, 00000000
        sub     edx, eax                                ; 3591 _ 29. C2
        lea     eax, [ebx+edx]                          ; 3593 _ 8D. 04 13
        add     eax, 28                                 ; 3596 _ 83. C0, 1C
        mov     dword [eax], ecx                        ; 3599 _ 89. 08
        mov     ecx, dword [task_control]               ; 359B _ 8B. 0D, 00002308(d)
        mov     eax, dword [ebp-14H]                    ; 35A1 _ 8B. 45, EC
        shl     eax, 4                                  ; 35A4 _ C1. E0, 04
        lea     edx, [eax*8]                            ; 35A7 _ 8D. 14 C5, 00000000
        sub     edx, eax                                ; 35AE _ 29. C2
        lea     eax, [edx+10H]                          ; 35B0 _ 8D. 42, 10
        add     eax, ecx                                ; 35B3 _ 01. C8
        add     eax, 20                                 ; 35B5 _ 83. C0, 14
        mov     edx, dword [ebp-14H]                    ; 35B8 _ 8B. 55, EC
        add     edx, 8                                  ; 35BB _ 83. C2, 08
        lea     ecx, [edx*8]                            ; 35BE _ 8D. 0C D5, 00000000
        mov     edx, dword [ebp-10H]                    ; 35C5 _ 8B. 55, F0
        add     edx, ecx                                ; 35C8 _ 01. CA
        mov     dword [esp+0CH], 137                    ; 35CA _ C7. 44 24, 0C, 00000089
        mov     dword [esp+8H], eax                     ; 35D2 _ 89. 44 24, 08
        mov     dword [esp+4H], 103                     ; 35D6 _ C7. 44 24, 04, 00000067
        mov     dword [esp], edx                        ; 35DE _ 89. 14 24
        call    segment_descriptor                      ; 35E1 _ E8, FFFFFFFC(rel)
        add     dword [ebp-14H], 1                      ; 35E6 _ 83. 45, EC, 01
?_171:  cmp     dword [ebp-14H], 4                      ; 35EA _ 83. 7D, EC, 04
        jle     ?_170                                   ; 35EE _ 0F 8E, FFFFFF5C
        call    task_alloc                              ; 35F4 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 35F9 _ 89. 45, F4
        mov     eax, dword [ebp-0CH]                    ; 35FC _ 8B. 45, F4
        mov     dword [eax+4H], 2                       ; 35FF _ C7. 40, 04, 00000002
        mov     eax, dword [task_control]               ; 3606 _ A1, 00002308(d)
        mov     dword [eax], 1                          ; 360B _ C7. 00, 00000001
        mov     eax, dword [task_control]               ; 3611 _ A1, 00002308(d)
        mov     dword [eax+4H], 0                       ; 3616 _ C7. 40, 04, 00000000
        mov     eax, dword [task_control]               ; 361D _ A1, 00002308(d)
        mov     edx, dword [ebp-0CH]                    ; 3622 _ 8B. 55, F4
        mov     dword [eax+8H], edx                     ; 3625 _ 89. 50, 08
        mov     eax, dword [ebp-0CH]                    ; 3628 _ 8B. 45, F4
        mov     eax, dword [eax]                        ; 362B _ 8B. 00
        mov     dword [esp], eax                        ; 362D _ 89. 04 24
        call    load_tr                                 ; 3630 _ E8, FFFFFFFC(rel)
        call    timer_alloc                             ; 3635 _ E8, FFFFFFFC(rel)
        mov     dword [task_timer], eax                 ; 363A _ A3, 00002304(d)
        mov     eax, dword [task_timer]                 ; 363F _ A1, 00002304(d)
        mov     dword [esp+4H], 100                     ; 3644 _ C7. 44 24, 04, 00000064
        mov     dword [esp], eax                        ; 364C _ 89. 04 24
        call    timer_settime                           ; 364F _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 3654 _ 8B. 45, F4
        add     esp, 36                                 ; 3657 _ 83. C4, 24
        pop     ebx                                     ; 365A _ 5B
        pop     ebp                                     ; 365B _ 5D
        ret                                             ; 365C _ C3
; task_init End of function

task_alloc:; Function begin
        push    ebp                                     ; 365D _ 55
        mov     ebp, esp                                ; 365E _ 89. E5
        sub     esp, 16                                 ; 3660 _ 83. EC, 10
        mov     dword [ebp-8H], 0                       ; 3663 _ C7. 45, F8, 00000000
        jmp     ?_174                                   ; 366A _ E9, 000000F5

?_172:  mov     ecx, dword [task_control]               ; 366F _ 8B. 0D, 00002308(d)
        mov     eax, dword [ebp-8H]                     ; 3675 _ 8B. 45, F8
        shl     eax, 4                                  ; 3678 _ C1. E0, 04
        lea     edx, [eax*8]                            ; 367B _ 8D. 14 C5, 00000000
        sub     edx, eax                                ; 3682 _ 29. C2
        lea     eax, [ecx+edx]                          ; 3684 _ 8D. 04 11
        add     eax, 32                                 ; 3687 _ 83. C0, 20
        mov     eax, dword [eax]                        ; 368A _ 8B. 00
        test    eax, eax                                ; 368C _ 85. C0
        jne     ?_173                                   ; 368E _ 0F 85, 000000CC
        mov     ecx, dword [task_control]               ; 3694 _ 8B. 0D, 00002308(d)
        mov     eax, dword [ebp-8H]                     ; 369A _ 8B. 45, F8
        shl     eax, 4                                  ; 369D _ C1. E0, 04
        lea     edx, [eax*8]                            ; 36A0 _ 8D. 14 C5, 00000000
        sub     edx, eax                                ; 36A7 _ 29. C2
        lea     eax, [edx+10H]                          ; 36A9 _ 8D. 42, 10
        add     eax, ecx                                ; 36AC _ 01. C8
        add     eax, 12                                 ; 36AE _ 83. C0, 0C
        mov     dword [ebp-4H], eax                     ; 36B1 _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 36B4 _ 8B. 45, FC
        mov     dword [eax+4H], 1                       ; 36B7 _ C7. 40, 04, 00000001
        mov     eax, dword [ebp-4H]                     ; 36BE _ 8B. 45, FC
        mov     dword [eax+2CH], 514                    ; 36C1 _ C7. 40, 2C, 00000202
        mov     eax, dword [ebp-4H]                     ; 36C8 _ 8B. 45, FC
        mov     dword [eax+30H], 0                      ; 36CB _ C7. 40, 30, 00000000
        mov     eax, dword [ebp-4H]                     ; 36D2 _ 8B. 45, FC
        mov     dword [eax+34H], 0                      ; 36D5 _ C7. 40, 34, 00000000
        mov     eax, dword [ebp-4H]                     ; 36DC _ 8B. 45, FC
        mov     dword [eax+38H], 0                      ; 36DF _ C7. 40, 38, 00000000
        mov     eax, dword [ebp-4H]                     ; 36E6 _ 8B. 45, FC
        mov     dword [eax+3CH], 0                      ; 36E9 _ C7. 40, 3C, 00000000
        mov     eax, dword [ebp-8H]                     ; 36F0 _ 8B. 45, F8
        add     eax, 1                                  ; 36F3 _ 83. C0, 01
        shl     eax, 9                                  ; 36F6 _ C1. E0, 09
        mov     edx, eax                                ; 36F9 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 36FB _ 8B. 45, FC
        mov     dword [eax+40H], edx                    ; 36FE _ 89. 50, 40
        mov     eax, dword [ebp-4H]                     ; 3701 _ 8B. 45, FC
        mov     dword [eax+44H], 0                      ; 3704 _ C7. 40, 44, 00000000
        mov     eax, dword [ebp-4H]                     ; 370B _ 8B. 45, FC
        mov     dword [eax+48H], 0                      ; 370E _ C7. 40, 48, 00000000
        mov     eax, dword [ebp-4H]                     ; 3715 _ 8B. 45, FC
        mov     dword [eax+4CH], 0                      ; 3718 _ C7. 40, 4C, 00000000
        mov     eax, dword [ebp-4H]                     ; 371F _ 8B. 45, FC
        mov     dword [eax+50H], 0                      ; 3722 _ C7. 40, 50, 00000000
        mov     eax, dword [ebp-4H]                     ; 3729 _ 8B. 45, FC
        mov     dword [eax+5CH], 0                      ; 372C _ C7. 40, 5C, 00000000
        mov     eax, dword [ebp-4H]                     ; 3733 _ 8B. 45, FC
        mov     dword [eax+60H], 0                      ; 3736 _ C7. 40, 60, 00000000
        mov     eax, dword [ebp-4H]                     ; 373D _ 8B. 45, FC
        mov     dword [eax+64H], 0                      ; 3740 _ C7. 40, 64, 00000000
        mov     eax, dword [ebp-4H]                     ; 3747 _ 8B. 45, FC
        mov     dword [eax+68H], 0                      ; 374A _ C7. 40, 68, 00000000
        mov     eax, dword [ebp-4H]                     ; 3751 _ 8B. 45, FC
        mov     dword [eax+6CH], 1073741824             ; 3754 _ C7. 40, 6C, 40000000
        mov     eax, dword [ebp-4H]                     ; 375B _ 8B. 45, FC
        jmp     ?_175                                   ; 375E _ EB, 13

?_173:  add     dword [ebp-8H], 1                       ; 3760 _ 83. 45, F8, 01
?_174:  cmp     dword [ebp-8H], 4                       ; 3764 _ 83. 7D, F8, 04
        jle     ?_172                                   ; 3768 _ 0F 8E, FFFFFF01
        mov     eax, 0                                  ; 376E _ B8, 00000000
?_175:  leave                                           ; 3773 _ C9
        ret                                             ; 3774 _ C3
; task_alloc End of function

task_run:; Function begin
        push    ebp                                     ; 3775 _ 55
        mov     ebp, esp                                ; 3776 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 3778 _ 8B. 45, 08
        mov     dword [eax+4H], 2                       ; 377B _ C7. 40, 04, 00000002
        mov     eax, dword [task_control]               ; 3782 _ A1, 00002308(d)
        mov     edx, dword [task_control]               ; 3787 _ 8B. 15, 00002308(d)
        mov     edx, dword [edx]                        ; 378D _ 8B. 12
        mov     ecx, dword [ebp+8H]                     ; 378F _ 8B. 4D, 08
        mov     dword [eax+edx*4+8H], ecx               ; 3792 _ 89. 4C 90, 08
        mov     eax, dword [task_control]               ; 3796 _ A1, 00002308(d)
        mov     edx, dword [eax]                        ; 379B _ 8B. 10
        add     edx, 1                                  ; 379D _ 83. C2, 01
        mov     dword [eax], edx                        ; 37A0 _ 89. 10
        pop     ebp                                     ; 37A2 _ 5D
        ret                                             ; 37A3 _ C3
; task_run End of function

task_switch:; Function begin
        push    ebp                                     ; 37A4 _ 55
        mov     ebp, esp                                ; 37A5 _ 89. E5
        sub     esp, 24                                 ; 37A7 _ 83. EC, 18
        mov     eax, dword [task_timer]                 ; 37AA _ A1, 00002304(d)
        mov     dword [esp+4H], 100                     ; 37AF _ C7. 44 24, 04, 00000064
        mov     dword [esp], eax                        ; 37B7 _ 89. 04 24
        call    timer_settime                           ; 37BA _ E8, FFFFFFFC(rel)
        mov     eax, dword [task_control]               ; 37BF _ A1, 00002308(d)
        mov     eax, dword [eax]                        ; 37C4 _ 8B. 00
        cmp     eax, 1                                  ; 37C6 _ 83. F8, 01
        jle     ?_177                                   ; 37C9 _ 7E, 51
        mov     eax, dword [task_control]               ; 37CB _ A1, 00002308(d)
        mov     edx, dword [eax+4H]                     ; 37D0 _ 8B. 50, 04
        add     edx, 1                                  ; 37D3 _ 83. C2, 01
        mov     dword [eax+4H], edx                     ; 37D6 _ 89. 50, 04
        mov     eax, dword [task_control]               ; 37D9 _ A1, 00002308(d)
        mov     edx, dword [eax+4H]                     ; 37DE _ 8B. 50, 04
        mov     eax, dword [task_control]               ; 37E1 _ A1, 00002308(d)
        mov     eax, dword [eax]                        ; 37E6 _ 8B. 00
        cmp     edx, eax                                ; 37E8 _ 39. C2
        jnz     ?_176                                   ; 37EA _ 75, 0C
        mov     eax, dword [task_control]               ; 37EC _ A1, 00002308(d)
        mov     dword [eax+4H], 0                       ; 37F1 _ C7. 40, 04, 00000000
?_176:  mov     eax, dword [task_control]               ; 37F8 _ A1, 00002308(d)
        mov     edx, dword [task_control]               ; 37FD _ 8B. 15, 00002308(d)
        mov     edx, dword [edx+4H]                     ; 3803 _ 8B. 52, 04
        mov     eax, dword [eax+edx*4+8H]               ; 3806 _ 8B. 44 90, 08
        mov     eax, dword [eax]                        ; 380A _ 8B. 00
        mov     dword [esp+4H], eax                     ; 380C _ 89. 44 24, 04
        mov     dword [esp], 0                          ; 3810 _ C7. 04 24, 00000000
        call    farjmp                                  ; 3817 _ E8, FFFFFFFC(rel)
?_177:  leave                                           ; 381C _ C9
        ret                                             ; 381D _ C3
; task_switch End of function

task_sleep:; Function begin
        push    ebp                                     ; 381E _ 55
        mov     ebp, esp                                ; 381F _ 89. E5
        sub     esp, 40                                 ; 3821 _ 83. EC, 28
        mov     byte [ebp-0DH], 0                       ; 3824 _ C6. 45, F3, 00
        mov     eax, dword [ebp+8H]                     ; 3828 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 382B _ 8B. 40, 04
        cmp     eax, 2                                  ; 382E _ 83. F8, 02
        jne     ?_187                                   ; 3831 _ 0F 85, 000000F1
        mov     eax, dword [task_control]               ; 3837 _ A1, 00002308(d)
        mov     edx, dword [task_control]               ; 383C _ 8B. 15, 00002308(d)
        mov     edx, dword [edx+4H]                     ; 3842 _ 8B. 52, 04
        mov     eax, dword [eax+edx*4+8H]               ; 3845 _ 8B. 44 90, 08
        cmp     eax, dword [ebp+8H]                     ; 3849 _ 3B. 45, 08
        jnz     ?_178                                   ; 384C _ 75, 04
        mov     byte [ebp-0DH], 1                       ; 384E _ C6. 45, F3, 01
?_178:  mov     dword [ebp-0CH], 0                      ; 3852 _ C7. 45, F4, 00000000
        jmp     ?_181                                   ; 3859 _ EB, 17

?_179:  mov     eax, dword [task_control]               ; 385B _ A1, 00002308(d)
        mov     edx, dword [ebp-0CH]                    ; 3860 _ 8B. 55, F4
        mov     eax, dword [eax+edx*4+8H]               ; 3863 _ 8B. 44 90, 08
        cmp     eax, dword [ebp+8H]                     ; 3867 _ 3B. 45, 08
        jnz     ?_180                                   ; 386A _ 75, 02
        jmp     ?_182                                   ; 386C _ EB, 10

?_180:  add     dword [ebp-0CH], 1                      ; 386E _ 83. 45, F4, 01
?_181:  mov     eax, dword [task_control]               ; 3872 _ A1, 00002308(d)
        mov     eax, dword [eax]                        ; 3877 _ 8B. 00
        cmp     eax, dword [ebp-0CH]                    ; 3879 _ 3B. 45, F4
        jg      ?_179                                   ; 387C _ 7F, DD
?_182:  mov     eax, dword [task_control]               ; 387E _ A1, 00002308(d)
        mov     edx, dword [eax]                        ; 3883 _ 8B. 10
        sub     edx, 1                                  ; 3885 _ 83. EA, 01
        mov     dword [eax], edx                        ; 3888 _ 89. 10
        mov     eax, dword [task_control]               ; 388A _ A1, 00002308(d)
        mov     eax, dword [eax+4H]                     ; 388F _ 8B. 40, 04
        cmp     eax, dword [ebp-0CH]                    ; 3892 _ 3B. 45, F4
        jle     ?_183                                   ; 3895 _ 7E, 10
        mov     eax, dword [task_control]               ; 3897 _ A1, 00002308(d)
        mov     edx, dword [eax+4H]                     ; 389C _ 8B. 50, 04
        sub     edx, 1                                  ; 389F _ 83. EA, 01
        mov     dword [eax+4H], edx                     ; 38A2 _ 89. 50, 04
        jmp     ?_185                                   ; 38A5 _ EB, 22

?_183:  jmp     ?_185                                   ; 38A7 _ EB, 20

?_184:  mov     eax, dword [task_control]               ; 38A9 _ A1, 00002308(d)
        mov     edx, dword [task_control]               ; 38AE _ 8B. 15, 00002308(d)
        mov     ecx, dword [ebp-0CH]                    ; 38B4 _ 8B. 4D, F4
        add     ecx, 1                                  ; 38B7 _ 83. C1, 01
        mov     ecx, dword [edx+ecx*4+8H]               ; 38BA _ 8B. 4C 8A, 08
        mov     edx, dword [ebp-0CH]                    ; 38BE _ 8B. 55, F4
        mov     dword [eax+edx*4+8H], ecx               ; 38C1 _ 89. 4C 90, 08
        add     dword [ebp-0CH], 1                      ; 38C5 _ 83. 45, F4, 01
?_185:  mov     eax, dword [task_control]               ; 38C9 _ A1, 00002308(d)
        mov     eax, dword [eax]                        ; 38CE _ 8B. 00
        cmp     eax, dword [ebp-0CH]                    ; 38D0 _ 3B. 45, F4
        jg      ?_184                                   ; 38D3 _ 7F, D4
        mov     eax, dword [ebp+8H]                     ; 38D5 _ 8B. 45, 08
        mov     dword [eax+4H], 1                       ; 38D8 _ C7. 40, 04, 00000001
        cmp     byte [ebp-0DH], 0                       ; 38DF _ 80. 7D, F3, 00
        jz      ?_186                                   ; 38E3 _ 74, 1F
        mov     eax, dword [task_control]               ; 38E5 _ A1, 00002308(d)
        mov     edx, dword [eax+4H]                     ; 38EA _ 8B. 50, 04
        mov     eax, dword [task_control]               ; 38ED _ A1, 00002308(d)
        mov     eax, dword [eax]                        ; 38F2 _ 8B. 00
        cmp     edx, eax                                ; 38F4 _ 39. C2
        jl      ?_186                                   ; 38F6 _ 7C, 0C
        mov     eax, dword [task_control]               ; 38F8 _ A1, 00002308(d)
        mov     dword [eax+4H], 0                       ; 38FD _ C7. 40, 04, 00000000
?_186:  mov     eax, dword [task_control]               ; 3904 _ A1, 00002308(d)
        mov     edx, dword [task_control]               ; 3909 _ 8B. 15, 00002308(d)
        mov     edx, dword [edx+4H]                     ; 390F _ 8B. 52, 04
        mov     eax, dword [eax+edx*4+8H]               ; 3912 _ 8B. 44 90, 08
        mov     eax, dword [eax]                        ; 3916 _ 8B. 00
        mov     dword [esp+4H], eax                     ; 3918 _ 89. 44 24, 04
        mov     dword [esp], 0                          ; 391C _ C7. 04 24, 00000000
        call    farjmp                                  ; 3923 _ E8, FFFFFFFC(rel)
?_187:  leave                                           ; 3928 _ C9
        ret                                             ; 3929 _ C3
; task_sleep End of function


SECTION .rodata align=1 noexecute                       ; section number 2, const

?_188:                                                  ; byte
        db 77H, 69H, 6EH, 64H, 6FH, 77H, 00H            ; 0000 _ window.

?_189:                                                  ; byte
        db 41H, 00H                                     ; 0007 _ A.

?_190:                                                  ; byte
        db 65H, 6EH, 74H, 65H, 72H, 20H, 74H, 61H       ; 0009 _ enter ta
        db 73H, 6BH, 20H, 62H, 00H                      ; 0011 _ sk b.

?_191:                                                  ; byte
        db 42H, 00H                                     ; 0016 _ B.

?_192:                                                  ; byte
        db 70H, 61H, 67H, 65H, 20H, 69H, 73H, 3AH       ; 0018 _ page is:
        db 20H, 00H                                     ; 0020 _  .

?_193:                                                  ; byte
        db 42H, 61H, 73H, 65H, 41H, 64H, 64H, 72H       ; 0022 _ BaseAddr
        db 4CH, 3AH, 20H, 00H                           ; 002A _ L: .

?_194:                                                  ; byte
        db 42H, 61H, 73H, 65H, 41H, 64H, 64H, 72H       ; 002E _ BaseAddr
        db 48H, 3AH, 20H, 00H                           ; 0036 _ H: .

?_195:                                                  ; byte
        db 6CH, 65H, 6EH, 67H, 74H, 68H, 4CH, 6FH       ; 003A _ lengthLo
        db 77H, 3AH, 20H, 00H                           ; 0042 _ w: .

?_196:                                                  ; byte
        db 6CH, 65H, 6EH, 67H, 74H, 68H, 48H, 69H       ; 0046 _ lengthHi
        db 67H, 68H, 3AH, 20H, 00H                      ; 004E _ gh: .

?_197:                                                  ; byte
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

table_rgb.1684:                                         ; byte
        db 00H, 00H, 00H, 0FFH, 00H, 00H, 44H, 8CH      ; 0080 _ ......D.
        db 0BBH, 0FFH, 0FFH, 00H, 00H, 00H, 0FFH, 0FFH  ; 0088 _ ........
        db 00H, 0FFH, 00H, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH ; 0090 _ ........
        db 0C6H, 0C6H, 0C6H, 84H, 00H, 00H, 00H, 84H    ; 0098 _ ........
        db 00H, 84H, 84H, 00H, 00H, 00H, 84H, 84H       ; 00A0 _ ........
        db 00H, 84H, 00H, 84H, 84H, 84H, 84H, 84H       ; 00A8 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 00B0 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 00B8 _ ........

cursor.1752:                                            ; byte
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

closebtn.1830:                                          ; byte
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

?_198:  db 00H                                          ; 02A2 _ .

?_199:  db 00H, 00H                                     ; 02A3 _ ..


SECTION .bss    align=32 noexecute                      ; section number 4, bss

sheet_control:                                          ; dword
        resd    1                                       ; 0000

back_sheet:                                             ; dword
        resd    1                                       ; 0004

mouse_sheet:                                            ; dword
        resd    1                                       ; 0008

timerinfo1.1713:                                        ; byte
        resb    28                                      ; 000C

timerbuf1.1716:                                         ; qword
        resq    1                                       ; 0028

timerinfo2.1714:                                        ; byte
        resb    28                                      ; 0030

timerbuf2.1717:                                         ; qword
        resq    1                                       ; 004C

timerinfo3.1715:                                        ; byte
        resb    28                                      ; 0054

timerbuf3.1718:                                         ; qword
        resq    1                                       ; 0070

task_a.1726:                                            ; dword
        resd    2                                       ; 0078

tss_b.1725:                                             ; byte
        resb    128                                     ; 0080

tss_a.1724:                                             ; byte
        resb    128                                     ; 0100

screen_info:                                            ; qword
        resb    4                                       ; 0180

?_200:  resw    1                                       ; 0184

?_201:  resw    13                                      ; 0186

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

?_202:  resb    9                                       ; 03A1

?_203:  resb    22                                      ; 03AA

timer_control:                                          ; byte
        resd    2001                                    ; 03C0

task_timer:                                             ; dword
        resd    1                                       ; 2304

task_control:                                           ; dword
        resd    1                                       ; 2308


