; Disassembly of file: ckernel.o
; Thu Feb 20 17:39:42 2020
; Mode: 32 bits
; Syntax: YASM/NASM
; Instruction set: Pentium Pro


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

extern mouse_y                                          ; dword
extern keyinfo                                          ; byte
extern memman                                           ; dword
extern back_buf                                         ; dword
extern io_out8                                          ; near
extern mouse_send_info                                  ; dword
extern io_sti                                           ; near
extern load_tr                                          ; near
extern taskswitch9                                      ; near
extern get_code32_addr                                  ; near
extern taskswitch10                                     ; near
extern keybuf                                           ; byte
extern keytable                                         ; byte
extern io_store_eflags                                  ; near
extern mouse_cursor_buf                                 ; byte
extern get_addr_gdt                                     ; near
extern io_cli                                           ; near
extern screen_info                                      ; dword
extern taskswitch8                                      ; near
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
        mov     eax, dword [memman]                     ; 005B _ A1, 00000000(d)
        mov     edx, dword [ebp-3CH]                    ; 0060 _ 8B. 55, C4
        mov     dword [esp+0CH], edx                    ; 0063 _ 89. 54 24, 0C
        mov     edx, dword [ebp-40H]                    ; 0067 _ 8B. 55, C0
        mov     dword [esp+8H], edx                     ; 006A _ 89. 54 24, 08
        mov     edx, dword [ebp-44H]                    ; 006E _ 8B. 55, BC
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
        mov     eax, dword [ebp-40H]                    ; 00A6 _ 8B. 45, C0
        imul    eax, dword [ebp-3CH]                    ; 00A9 _ 0F AF. 45, C4
        mov     edx, eax                                ; 00AD _ 89. C2
        mov     eax, dword [memman]                     ; 00AF _ A1, 00000000(d)
        mov     dword [esp+4H], edx                     ; 00B4 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 00B8 _ 89. 04 24
        call    memman_alloc_4k                         ; 00BB _ E8, FFFFFFFC(rel)
        mov     dword [back_buf], eax                   ; 00C0 _ A3, 00000000(d)
        mov     edx, dword [back_buf]                   ; 00C5 _ 8B. 15, 00000000(d)
        mov     eax, dword [back_sheet]                 ; 00CB _ A1, 00000004(d)
        mov     dword [esp+10H], 99                     ; 00D0 _ C7. 44 24, 10, 00000063
        mov     ecx, dword [ebp-3CH]                    ; 00D8 _ 8B. 4D, C4
        mov     dword [esp+0CH], ecx                    ; 00DB _ 89. 4C 24, 0C
        mov     ecx, dword [ebp-40H]                    ; 00DF _ 8B. 4D, C0
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
        mov     dword [ebp-38H], eax                    ; 0138 _ 89. 45, C8
        call    init_time_port                          ; 013B _ E8, FFFFFFFC(rel)
        mov     dword [esp+8H], timerbuf1.1695          ; 0140 _ C7. 44 24, 08, 00000024(d)
        mov     dword [esp+4H], 8                       ; 0148 _ C7. 44 24, 04, 00000008
        mov     dword [esp], timerinfo1.1692            ; 0150 _ C7. 04 24, 0000000C(d)
        call    fifo8_init                              ; 0157 _ E8, FFFFFFFC(rel)
        call    timer_alloc                             ; 015C _ E8, FFFFFFFC(rel)
        mov     dword [ebp-34H], eax                    ; 0161 _ 89. 45, CC
        mov     dword [esp+8H], 1                       ; 0164 _ C7. 44 24, 08, 00000001
        mov     dword [esp+4H], timerinfo1.1692         ; 016C _ C7. 44 24, 04, 0000000C(d)
        mov     eax, dword [ebp-34H]                    ; 0174 _ 8B. 45, CC
        mov     dword [esp], eax                        ; 0177 _ 89. 04 24
        call    timer_init                              ; 017A _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 500                     ; 017F _ C7. 44 24, 04, 000001F4
        mov     eax, dword [ebp-34H]                    ; 0187 _ 8B. 45, CC
        mov     dword [esp], eax                        ; 018A _ 89. 04 24
        call    timer_settime                           ; 018D _ E8, FFFFFFFC(rel)
        mov     dword [esp+8H], timerbuf2.1696          ; 0192 _ C7. 44 24, 08, 00000044(d)
        mov     dword [esp+4H], 8                       ; 019A _ C7. 44 24, 04, 00000008
        mov     dword [esp], timerinfo2.1693            ; 01A2 _ C7. 04 24, 0000002C(d)
        call    fifo8_init                              ; 01A9 _ E8, FFFFFFFC(rel)
        call    timer_alloc                             ; 01AE _ E8, FFFFFFFC(rel)
        mov     dword [ebp-30H], eax                    ; 01B3 _ 89. 45, D0
        mov     dword [esp+8H], 1                       ; 01B6 _ C7. 44 24, 08, 00000001
        mov     dword [esp+4H], timerinfo2.1693         ; 01BE _ C7. 44 24, 04, 0000002C(d)
        mov     eax, dword [ebp-30H]                    ; 01C6 _ 8B. 45, D0
        mov     dword [esp], eax                        ; 01C9 _ 89. 04 24
        call    timer_init                              ; 01CC _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 300                     ; 01D1 _ C7. 44 24, 04, 0000012C
        mov     eax, dword [ebp-30H]                    ; 01D9 _ 8B. 45, D0
        mov     dword [esp], eax                        ; 01DC _ 89. 04 24
        call    timer_settime                           ; 01DF _ E8, FFFFFFFC(rel)
        mov     dword [esp+8H], timerbuf3.1697          ; 01E4 _ C7. 44 24, 08, 00000064(d)
        mov     dword [esp+4H], 8                       ; 01EC _ C7. 44 24, 04, 00000008
        mov     dword [esp], timerinfo3.1694            ; 01F4 _ C7. 04 24, 0000004C(d)
        call    fifo8_init                              ; 01FB _ E8, FFFFFFFC(rel)
        call    timer_alloc                             ; 0200 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-2CH], eax                    ; 0205 _ 89. 45, D4
        mov     dword [esp+8H], 1                       ; 0208 _ C7. 44 24, 08, 00000001
        mov     dword [esp+4H], timerinfo3.1694         ; 0210 _ C7. 44 24, 04, 0000004C(d)
        mov     eax, dword [ebp-2CH]                    ; 0218 _ 8B. 45, D4
        mov     dword [esp], eax                        ; 021B _ 89. 04 24
        call    timer_init                              ; 021E _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 50                      ; 0223 _ C7. 44 24, 04, 00000032
        mov     eax, dword [ebp-2CH]                    ; 022B _ 8B. 45, D4
        mov     dword [esp], eax                        ; 022E _ 89. 04 24
        call    timer_settime                           ; 0231 _ E8, FFFFFFFC(rel)
        call    io_sti                                  ; 0236 _ E8, FFFFFFFC(rel)
        mov     eax, dword [back_buf]                   ; 023B _ A1, 00000000(d)
        mov     edx, dword [ebp-3CH]                    ; 0240 _ 8B. 55, C4
        mov     dword [esp+8H], edx                     ; 0243 _ 89. 54 24, 08
        mov     edx, dword [ebp-40H]                    ; 0247 _ 8B. 55, C0
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
        mov     dword [esp+4H], ?_163                   ; 02C1 _ C7. 44 24, 04, 00000000(d)
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
        mov     dword [ebp-28H], eax                    ; 031E _ 89. 45, D8
        call    get_addr_gdt                            ; 0321 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-24H], eax                    ; 0326 _ 89. 45, DC
        mov     dword [?_184], 0                        ; 0329 _ C7. 05, 000000E0(d), 00000000
        mov     dword [?_185], 1073741824               ; 0333 _ C7. 05, 000000E4(d), 40000000
        mov     dword [?_202], 0                        ; 033D _ C7. 05, 00000160(d), 00000000
        mov     dword [?_203], 1073741824               ; 0347 _ C7. 05, 00000164(d), 40000000
        mov     eax, tss_a.1701                         ; 0351 _ B8, 00000080(d)
        mov     edx, dword [ebp-24H]                    ; 0356 _ 8B. 55, DC
        add     edx, 64                                 ; 0359 _ 83. C2, 40
        mov     dword [esp+0CH], 137                    ; 035C _ C7. 44 24, 0C, 00000089
        mov     dword [esp+8H], eax                     ; 0364 _ 89. 44 24, 08
        mov     dword [esp+4H], 103                     ; 0368 _ C7. 44 24, 04, 00000067
        mov     dword [esp], edx                        ; 0370 _ 89. 14 24
        call    segment_descriptor                      ; 0373 _ E8, FFFFFFFC(rel)
        mov     eax, tss_a.1701                         ; 0378 _ B8, 00000080(d)
        mov     edx, dword [ebp-24H]                    ; 037D _ 8B. 55, DC
        add     edx, 72                                 ; 0380 _ 83. C2, 48
        mov     dword [esp+0CH], 137                    ; 0383 _ C7. 44 24, 0C, 00000089
        mov     dword [esp+8H], eax                     ; 038B _ 89. 44 24, 08
        mov     dword [esp+4H], 103                     ; 038F _ C7. 44 24, 04, 00000067
        mov     dword [esp], edx                        ; 0397 _ 89. 14 24
        call    segment_descriptor                      ; 039A _ E8, FFFFFFFC(rel)
        mov     eax, tss_b.1702                         ; 039F _ B8, 00000100(d)
        mov     edx, dword [ebp-24H]                    ; 03A4 _ 8B. 55, DC
        add     edx, 80                                 ; 03A7 _ 83. C2, 50
        mov     dword [esp+0CH], 137                    ; 03AA _ C7. 44 24, 0C, 00000089
        mov     dword [esp+8H], eax                     ; 03B2 _ 89. 44 24, 08
        mov     dword [esp+4H], 103                     ; 03B6 _ C7. 44 24, 04, 00000067
        mov     dword [esp], edx                        ; 03BE _ 89. 14 24
        call    segment_descriptor                      ; 03C1 _ E8, FFFFFFFC(rel)
        mov     eax, task_b_main                        ; 03C6 _ B8, 00000000(d)
        mov     edx, dword [ebp-24H]                    ; 03CB _ 8B. 55, DC
        add     edx, 56                                 ; 03CE _ 83. C2, 38
        mov     dword [esp+0CH], 16538                  ; 03D1 _ C7. 44 24, 0C, 0000409A
        mov     dword [esp+8H], eax                     ; 03D9 _ 89. 44 24, 08
        mov     dword [esp+4H], 65535                   ; 03DD _ C7. 44 24, 04, 0000FFFF
        mov     dword [esp], edx                        ; 03E5 _ 89. 14 24
        call    segment_descriptor                      ; 03E8 _ E8, FFFFFFFC(rel)
        mov     dword [esp], 64                         ; 03ED _ C7. 04 24, 00000040
        call    load_tr                                 ; 03F4 _ E8, FFFFFFFC(rel)
        call    taskswitch9                             ; 03F9 _ E8, FFFFFFFC(rel)
        mov     eax, dword [?_176]                      ; 03FE _ A1, 000000A4(d)
        mov     dword [esp], eax                        ; 0403 _ 89. 04 24
        call    intToHexStr                             ; 0406 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-20H], eax                    ; 040B _ 89. 45, E0
        mov     edx, dword [back_sheet]                 ; 040E _ 8B. 15, 00000004(d)
        mov     eax, dword [sheet_control]              ; 0414 _ A1, 00000000(d)
        mov     dword [esp+14H], 7                      ; 0419 _ C7. 44 24, 14, 00000007
        mov     ecx, dword [ebp-20H]                    ; 0421 _ 8B. 4D, E0
        mov     dword [esp+10H], ecx                    ; 0424 _ 89. 4C 24, 10
        mov     dword [esp+0CH], 0                      ; 0428 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 0                       ; 0430 _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], edx                     ; 0438 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 043C _ 89. 04 24
        call    paint_string                            ; 043F _ E8, FFFFFFFC(rel)
        mov     eax, dword [?_177]                      ; 0444 _ A1, 000000B8(d)
        mov     dword [esp], eax                        ; 0449 _ 89. 04 24
        call    intToHexStr                             ; 044C _ E8, FFFFFFFC(rel)
        mov     dword [ebp-20H], eax                    ; 0451 _ 89. 45, E0
        mov     edx, dword [back_sheet]                 ; 0454 _ 8B. 15, 00000004(d)
        mov     eax, dword [sheet_control]              ; 045A _ A1, 00000000(d)
        mov     dword [esp+14H], 7                      ; 045F _ C7. 44 24, 14, 00000007
        mov     ecx, dword [ebp-20H]                    ; 0467 _ 8B. 4D, E0
        mov     dword [esp+10H], ecx                    ; 046A _ 89. 4C 24, 10
        mov     dword [esp+0CH], 16                     ; 046E _ C7. 44 24, 0C, 00000010
        mov     dword [esp+8H], 0                       ; 0476 _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], edx                     ; 047E _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0482 _ 89. 04 24
        call    paint_string                            ; 0485 _ E8, FFFFFFFC(rel)
        mov     eax, dword [?_178]                      ; 048A _ A1, 000000C8(d)
        lea     edx, [eax+7H]                           ; 048F _ 8D. 50, 07
        test    eax, eax                                ; 0492 _ 85. C0
        cmovs   eax, edx                                ; 0494 _ 0F 48. C2
        sar     eax, 3                                  ; 0497 _ C1. F8, 03
        mov     dword [esp], eax                        ; 049A _ 89. 04 24
        call    intToHexStr                             ; 049D _ E8, FFFFFFFC(rel)
        mov     dword [ebp-20H], eax                    ; 04A2 _ 89. 45, E0
        mov     edx, dword [back_sheet]                 ; 04A5 _ 8B. 15, 00000004(d)
        mov     eax, dword [sheet_control]              ; 04AB _ A1, 00000000(d)
        mov     dword [esp+14H], 7                      ; 04B0 _ C7. 44 24, 14, 00000007
        mov     ecx, dword [ebp-20H]                    ; 04B8 _ 8B. 4D, E0
        mov     dword [esp+10H], ecx                    ; 04BB _ 89. 4C 24, 10
        mov     dword [esp+0CH], 32                     ; 04BF _ C7. 44 24, 0C, 00000020
        mov     dword [esp+8H], 0                       ; 04C7 _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], edx                     ; 04CF _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 04D3 _ 89. 04 24
        call    paint_string                            ; 04D6 _ E8, FFFFFFFC(rel)
        mov     eax, dword [?_179]                      ; 04DB _ A1, 000000CC(d)
        lea     edx, [eax+7H]                           ; 04E0 _ 8D. 50, 07
        test    eax, eax                                ; 04E3 _ 85. C0
        cmovs   eax, edx                                ; 04E5 _ 0F 48. C2
        sar     eax, 3                                  ; 04E8 _ C1. F8, 03
        mov     dword [esp], eax                        ; 04EB _ 89. 04 24
        call    intToHexStr                             ; 04EE _ E8, FFFFFFFC(rel)
        mov     dword [ebp-20H], eax                    ; 04F3 _ 89. 45, E0
        mov     edx, dword [back_sheet]                 ; 04F6 _ 8B. 15, 00000004(d)
        mov     eax, dword [sheet_control]              ; 04FC _ A1, 00000000(d)
        mov     dword [esp+14H], 7                      ; 0501 _ C7. 44 24, 14, 00000007
        mov     ecx, dword [ebp-20H]                    ; 0509 _ 8B. 4D, E0
        mov     dword [esp+10H], ecx                    ; 050C _ 89. 4C 24, 10
        mov     dword [esp+0CH], 48                     ; 0510 _ C7. 44 24, 0C, 00000030
        mov     dword [esp+8H], 0                       ; 0518 _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], edx                     ; 0520 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0524 _ 89. 04 24
        call    paint_string                            ; 0527 _ E8, FFFFFFFC(rel)
        mov     eax, dword [?_180]                      ; 052C _ A1, 000000D0(d)
        lea     edx, [eax+7H]                           ; 0531 _ 8D. 50, 07
        test    eax, eax                                ; 0534 _ 85. C0
        cmovs   eax, edx                                ; 0536 _ 0F 48. C2
        sar     eax, 3                                  ; 0539 _ C1. F8, 03
        mov     dword [esp], eax                        ; 053C _ 89. 04 24
        call    intToHexStr                             ; 053F _ E8, FFFFFFFC(rel)
        mov     dword [ebp-20H], eax                    ; 0544 _ 89. 45, E0
        mov     edx, dword [back_sheet]                 ; 0547 _ 8B. 15, 00000004(d)
        mov     eax, dword [sheet_control]              ; 054D _ A1, 00000000(d)
        mov     dword [esp+14H], 7                      ; 0552 _ C7. 44 24, 14, 00000007
        mov     ecx, dword [ebp-20H]                    ; 055A _ 8B. 4D, E0
        mov     dword [esp+10H], ecx                    ; 055D _ 89. 4C 24, 10
        mov     dword [esp+0CH], 64                     ; 0561 _ C7. 44 24, 0C, 00000040
        mov     dword [esp+8H], 0                       ; 0569 _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], edx                     ; 0571 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0575 _ 89. 04 24
        call    paint_string                            ; 0578 _ E8, FFFFFFFC(rel)
        mov     eax, dword [?_181]                      ; 057D _ A1, 000000D4(d)
        lea     edx, [eax+7H]                           ; 0582 _ 8D. 50, 07
        test    eax, eax                                ; 0585 _ 85. C0
        cmovs   eax, edx                                ; 0587 _ 0F 48. C2
        sar     eax, 3                                  ; 058A _ C1. F8, 03
        mov     dword [esp], eax                        ; 058D _ 89. 04 24
        call    intToHexStr                             ; 0590 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-20H], eax                    ; 0595 _ 89. 45, E0
        mov     edx, dword [back_sheet]                 ; 0598 _ 8B. 15, 00000004(d)
        mov     eax, dword [sheet_control]              ; 059E _ A1, 00000000(d)
        mov     dword [esp+14H], 7                      ; 05A3 _ C7. 44 24, 14, 00000007
        mov     ecx, dword [ebp-20H]                    ; 05AB _ 8B. 4D, E0
        mov     dword [esp+10H], ecx                    ; 05AE _ 89. 4C 24, 10
        mov     dword [esp+0CH], 80                     ; 05B2 _ C7. 44 24, 0C, 00000050
        mov     dword [esp+8H], 0                       ; 05BA _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], edx                     ; 05C2 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 05C6 _ 89. 04 24
        call    paint_string                            ; 05C9 _ E8, FFFFFFFC(rel)
        mov     eax, dword [?_183]                      ; 05CE _ A1, 000000DC(d)
        lea     edx, [eax+7H]                           ; 05D3 _ 8D. 50, 07
        test    eax, eax                                ; 05D6 _ 85. C0
        cmovs   eax, edx                                ; 05D8 _ 0F 48. C2
        sar     eax, 3                                  ; 05DB _ C1. F8, 03
        mov     dword [esp], eax                        ; 05DE _ 89. 04 24
        call    intToHexStr                             ; 05E1 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-20H], eax                    ; 05E6 _ 89. 45, E0
        mov     edx, dword [back_sheet]                 ; 05E9 _ 8B. 15, 00000004(d)
        mov     eax, dword [sheet_control]              ; 05EF _ A1, 00000000(d)
        mov     dword [esp+14H], 7                      ; 05F4 _ C7. 44 24, 14, 00000007
        mov     ecx, dword [ebp-20H]                    ; 05FC _ 8B. 4D, E0
        mov     dword [esp+10H], ecx                    ; 05FF _ 89. 4C 24, 10
        mov     dword [esp+0CH], 96                     ; 0603 _ C7. 44 24, 0C, 00000060
        mov     dword [esp+8H], 0                       ; 060B _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], edx                     ; 0613 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0617 _ 89. 04 24
        call    paint_string                            ; 061A _ E8, FFFFFFFC(rel)
        mov     eax, dword [?_182]                      ; 061F _ A1, 000000D8(d)
        lea     edx, [eax+7H]                           ; 0624 _ 8D. 50, 07
        test    eax, eax                                ; 0627 _ 85. C0
        cmovs   eax, edx                                ; 0629 _ 0F 48. C2
        sar     eax, 3                                  ; 062C _ C1. F8, 03
        mov     dword [esp], eax                        ; 062F _ 89. 04 24
        call    intToHexStr                             ; 0632 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-20H], eax                    ; 0637 _ 89. 45, E0
        mov     edx, dword [back_sheet]                 ; 063A _ 8B. 15, 00000004(d)
        mov     eax, dword [sheet_control]              ; 0640 _ A1, 00000000(d)
        mov     dword [esp+14H], 7                      ; 0645 _ C7. 44 24, 14, 00000007
        mov     ecx, dword [ebp-20H]                    ; 064D _ 8B. 4D, E0
        mov     dword [esp+10H], ecx                    ; 0650 _ 89. 4C 24, 10
        mov     dword [esp+0CH], 112                    ; 0654 _ C7. 44 24, 0C, 00000070
        mov     dword [esp+8H], 0                       ; 065C _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], edx                     ; 0664 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0668 _ 89. 04 24
        call    paint_string                            ; 066B _ E8, FFFFFFFC(rel)
        mov     eax, dword [?_175]                      ; 0670 _ A1, 0000009C(d)
        mov     dword [esp], eax                        ; 0675 _ 89. 04 24
        call    intToHexStr                             ; 0678 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-20H], eax                    ; 067D _ 89. 45, E0
        mov     edx, dword [back_sheet]                 ; 0680 _ 8B. 15, 00000004(d)
        mov     eax, dword [sheet_control]              ; 0686 _ A1, 00000000(d)
        mov     dword [esp+14H], 7                      ; 068B _ C7. 44 24, 14, 00000007
        mov     ecx, dword [ebp-20H]                    ; 0693 _ 8B. 4D, E0
        mov     dword [esp+10H], ecx                    ; 0696 _ 89. 4C 24, 10
        mov     dword [esp+0CH], 128                    ; 069A _ C7. 44 24, 0C, 00000080
        mov     dword [esp+8H], 0                       ; 06A2 _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], edx                     ; 06AA _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 06AE _ 89. 04 24
        call    paint_string                            ; 06B1 _ E8, FFFFFFFC(rel)
        mov     eax, dword [memman]                     ; 06B6 _ A1, 00000000(d)
        mov     dword [esp+4H], 65536                   ; 06BB _ C7. 44 24, 04, 00010000
        mov     dword [esp], eax                        ; 06C3 _ 89. 04 24
        call    memman_alloc_4k                         ; 06C6 _ E8, FFFFFFFC(rel)
        add     eax, 65536                              ; 06CB _ 05, 00010000
        mov     dword [ebp-1CH], eax                    ; 06D0 _ 89. 45, E4
        mov     eax, task_b_main                        ; 06D3 _ B8, 00000000(d)
        sub     eax, dword [ebp-28H]                    ; 06D8 _ 2B. 45, D8
        mov     dword [?_186], eax                      ; 06DB _ A3, 00000120(d)
        mov     dword [?_187], 514                      ; 06E0 _ C7. 05, 00000124(d), 00000202
        mov     dword [?_188], 0                        ; 06EA _ C7. 05, 00000128(d), 00000000
        mov     dword [?_189], 0                        ; 06F4 _ C7. 05, 0000012C(d), 00000000
        mov     dword [?_190], 0                        ; 06FE _ C7. 05, 00000130(d), 00000000
        mov     dword [?_191], 0                        ; 0708 _ C7. 05, 00000134(d), 00000000
        mov     dword [?_192], 1024                     ; 0712 _ C7. 05, 00000138(d), 00000400
        mov     dword [?_193], 0                        ; 071C _ C7. 05, 0000013C(d), 00000000
        mov     dword [?_194], 0                        ; 0726 _ C7. 05, 00000140(d), 00000000
        mov     dword [?_195], 0                        ; 0730 _ C7. 05, 00000144(d), 00000000
        mov     eax, dword [?_178]                      ; 073A _ A1, 000000C8(d)
        mov     dword [?_196], eax                      ; 073F _ A3, 00000148(d)
        mov     eax, dword [?_179]                      ; 0744 _ A1, 000000CC(d)
        mov     dword [?_197], eax                      ; 0749 _ A3, 0000014C(d)
        mov     eax, dword [?_180]                      ; 074E _ A1, 000000D0(d)
        mov     dword [?_198], eax                      ; 0753 _ A3, 00000150(d)
        mov     eax, dword [?_181]                      ; 0758 _ A1, 000000D4(d)
        mov     dword [?_199], eax                      ; 075D _ A3, 00000154(d)
        mov     eax, dword [?_182]                      ; 0762 _ A1, 000000D8(d)
        mov     dword [?_200], eax                      ; 0767 _ A3, 00000158(d)
        mov     eax, dword [?_183]                      ; 076C _ A1, 000000DC(d)
        mov     dword [?_201], eax                      ; 0771 _ A3, 0000015C(d)
        mov     dword [ebp-18H], 0                      ; 0776 _ C7. 45, E8, 00000000
        mov     dword [ebp-14H], 0                      ; 077D _ C7. 45, EC, 00000000
        mov     dword [ebp-10H], 0                      ; 0784 _ C7. 45, F0, 00000000
        mov     dword [ebp-4CH], 8                      ; 078B _ C7. 45, B4, 00000008
        mov     dword [ebp-48H], 7                      ; 0792 _ C7. 45, B8, 00000007
?_001:  call    io_cli                                  ; 0799 _ E8, FFFFFFFC(rel)
        mov     dword [esp], keyinfo                    ; 079E _ C7. 04 24, 00000000(d)
        call    fifo8_status                            ; 07A5 _ E8, FFFFFFFC(rel)
        mov     ebx, eax                                ; 07AA _ 89. C3
        mov     dword [esp], mouseinfo                  ; 07AC _ C7. 04 24, 00000000(d)
        call    fifo8_status                            ; 07B3 _ E8, FFFFFFFC(rel)
        add     ebx, eax                                ; 07B8 _ 01. C3
        mov     dword [esp], timerinfo1.1692            ; 07BA _ C7. 04 24, 0000000C(d)
        call    fifo8_status                            ; 07C1 _ E8, FFFFFFFC(rel)
        add     ebx, eax                                ; 07C6 _ 01. C3
        mov     dword [esp], timerinfo2.1693            ; 07C8 _ C7. 04 24, 0000002C(d)
        call    fifo8_status                            ; 07CF _ E8, FFFFFFFC(rel)
        add     ebx, eax                                ; 07D4 _ 01. C3
        mov     dword [esp], timerinfo3.1694            ; 07D6 _ C7. 04 24, 0000004C(d)
        call    fifo8_status                            ; 07DD _ E8, FFFFFFFC(rel)
        add     eax, ebx                                ; 07E2 _ 01. D8
        test    eax, eax                                ; 07E4 _ 85. C0
        jnz     ?_002                                   ; 07E6 _ 75, 0A
        call    io_sti                                  ; 07E8 _ E8, FFFFFFFC(rel)
        jmp     ?_010                                   ; 07ED _ E9, 00000372

?_002:  mov     dword [esp], keyinfo                    ; 07F2 _ C7. 04 24, 00000000(d)
        call    fifo8_status                            ; 07F9 _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 07FE _ 85. C0
        je      ?_004                                   ; 0800 _ 0F 84, 00000196
        call    io_sti                                  ; 0806 _ E8, FFFFFFFC(rel)
        mov     dword [esp], keyinfo                    ; 080B _ C7. 04 24, 00000000(d)
        call    fifo8_get                               ; 0812 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-18H], eax                    ; 0817 _ 89. 45, E8
        cmp     dword [ebp-18H], 128                    ; 081A _ 81. 7D, E8, 00000080
        jle     ?_003                                   ; 0821 _ 7E, 05
        jmp     ?_010                                   ; 0823 _ E9, 0000033C

?_003:  cmp     dword [ebp-18H], 28                     ; 0828 _ 83. 7D, E8, 1C
        je      ?_010                                   ; 082C _ 0F 84, 00000332
        mov     eax, dword [ebp-18H]                    ; 0832 _ 8B. 45, E8
        add     eax, keytable                           ; 0835 _ 05, 00000000(d)
        movzx   eax, byte [eax]                         ; 083A _ 0F B6. 00
        test    al, al                                  ; 083D _ 84. C0
        je      ?_010                                   ; 083F _ 0F 84, 0000031F
        cmp     dword [ebp-4CH], 143                    ; 0845 _ 81. 7D, B4, 0000008F
        jg      ?_010                                   ; 084C _ 0F 8F, 00000312
        mov     eax, dword [ebp-4CH]                    ; 0852 _ 8B. 45, B4
        lea     ecx, [eax+7H]                           ; 0855 _ 8D. 48, 07
        mov     eax, dword [sheet_win]                  ; 0858 _ A1, 00000000(d)
        mov     edx, dword [eax+4H]                     ; 085D _ 8B. 50, 04
        mov     eax, dword [sheet_win]                  ; 0860 _ A1, 00000000(d)
        mov     eax, dword [eax]                        ; 0865 _ 8B. 00
        mov     dword [esp+18H], 43                     ; 0867 _ C7. 44 24, 18, 0000002B
        mov     dword [esp+14H], ecx                    ; 086F _ 89. 4C 24, 14
        mov     dword [esp+10H], 28                     ; 0873 _ C7. 44 24, 10, 0000001C
        mov     ecx, dword [ebp-4CH]                    ; 087B _ 8B. 4D, B4
        mov     dword [esp+0CH], ecx                    ; 087E _ 89. 4C 24, 0C
        mov     dword [esp+8H], 7                       ; 0882 _ C7. 44 24, 08, 00000007
        mov     dword [esp+4H], edx                     ; 088A _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 088E _ 89. 04 24
        call    paint_rectangle                         ; 0891 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-4CH]                    ; 0896 _ 8B. 45, B4
        lea     ecx, [eax+8H]                           ; 0899 _ 8D. 48, 08
        mov     edx, dword [sheet_win]                  ; 089C _ 8B. 15, 00000000(d)
        mov     eax, dword [sheet_control]              ; 08A2 _ A1, 00000000(d)
        mov     dword [esp+14H], 44                     ; 08A7 _ C7. 44 24, 14, 0000002C
        mov     dword [esp+10H], ecx                    ; 08AF _ 89. 4C 24, 10
        mov     dword [esp+0CH], 28                     ; 08B3 _ C7. 44 24, 0C, 0000001C
        mov     ecx, dword [ebp-4CH]                    ; 08BB _ 8B. 4D, B4
        mov     dword [esp+8H], ecx                     ; 08BE _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 08C2 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 08C6 _ 89. 04 24
        call    sheet_refresh                           ; 08C9 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-18H]                    ; 08CE _ 8B. 45, E8
        add     eax, keytable                           ; 08D1 _ 05, 00000000(d)
        movzx   eax, byte [eax]                         ; 08D6 _ 0F B6. 00
        mov     byte [ebp-4EH], al                      ; 08D9 _ 88. 45, B2
        mov     byte [ebp-4DH], 0                       ; 08DC _ C6. 45, B3, 00
        mov     edx, dword [sheet_win]                  ; 08E0 _ 8B. 15, 00000000(d)
        mov     eax, dword [sheet_control]              ; 08E6 _ A1, 00000000(d)
        mov     dword [esp+14H], 0                      ; 08EB _ C7. 44 24, 14, 00000000
        lea     ecx, [ebp-4EH]                          ; 08F3 _ 8D. 4D, B2
        mov     dword [esp+10H], ecx                    ; 08F6 _ 89. 4C 24, 10
        mov     dword [esp+0CH], 28                     ; 08FA _ C7. 44 24, 0C, 0000001C
        mov     ecx, dword [ebp-4CH]                    ; 0902 _ 8B. 4D, B4
        mov     dword [esp+8H], ecx                     ; 0905 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 0909 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 090D _ 89. 04 24
        call    paint_string                            ; 0910 _ E8, FFFFFFFC(rel)
        add     dword [ebp-4CH], 8                      ; 0915 _ 83. 45, B4, 08
        mov     eax, dword [ebp-4CH]                    ; 0919 _ 8B. 45, B4
        lea     ebx, [eax+7H]                           ; 091C _ 8D. 58, 07
        mov     eax, dword [ebp-48H]                    ; 091F _ 8B. 45, B8
        movzx   ecx, al                                 ; 0922 _ 0F B6. C8
        mov     eax, dword [sheet_win]                  ; 0925 _ A1, 00000000(d)
        mov     edx, dword [eax+4H]                     ; 092A _ 8B. 50, 04
        mov     eax, dword [sheet_win]                  ; 092D _ A1, 00000000(d)
        mov     eax, dword [eax]                        ; 0932 _ 8B. 00
        mov     dword [esp+18H], 43                     ; 0934 _ C7. 44 24, 18, 0000002B
        mov     dword [esp+14H], ebx                    ; 093C _ 89. 5C 24, 14
        mov     dword [esp+10H], 28                     ; 0940 _ C7. 44 24, 10, 0000001C
        mov     ebx, dword [ebp-4CH]                    ; 0948 _ 8B. 5D, B4
        mov     dword [esp+0CH], ebx                    ; 094B _ 89. 5C 24, 0C
        mov     dword [esp+8H], ecx                     ; 094F _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 0953 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0957 _ 89. 04 24
        call    paint_rectangle                         ; 095A _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-4CH]                    ; 095F _ 8B. 45, B4
        lea     ecx, [eax+8H]                           ; 0962 _ 8D. 48, 08
        mov     edx, dword [sheet_win]                  ; 0965 _ 8B. 15, 00000000(d)
        mov     eax, dword [sheet_control]              ; 096B _ A1, 00000000(d)
        mov     dword [esp+14H], 44                     ; 0970 _ C7. 44 24, 14, 0000002C
        mov     dword [esp+10H], ecx                    ; 0978 _ 89. 4C 24, 10
        mov     dword [esp+0CH], 28                     ; 097C _ C7. 44 24, 0C, 0000001C
        mov     ecx, dword [ebp-4CH]                    ; 0984 _ 8B. 4D, B4
        mov     dword [esp+8H], ecx                     ; 0987 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 098B _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 098F _ 89. 04 24
        call    sheet_refresh                           ; 0992 _ E8, FFFFFFFC(rel)
        jmp     ?_001                                   ; 0997 _ E9, FFFFFDFD

?_004:  mov     dword [esp], mouseinfo                  ; 099C _ C7. 04 24, 00000000(d)
        call    fifo8_status                            ; 09A3 _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 09A8 _ 85. C0
        jz      ?_005                                   ; 09AA _ 74, 26
        mov     ecx, dword [mouse_sheet]                ; 09AC _ 8B. 0D, 00000008(d)
        mov     edx, dword [back_sheet]                 ; 09B2 _ 8B. 15, 00000004(d)
        mov     eax, dword [sheet_control]              ; 09B8 _ A1, 00000000(d)
        mov     dword [esp+8H], ecx                     ; 09BD _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 09C1 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 09C5 _ 89. 04 24
        call    show_mouse_info                         ; 09C8 _ E8, FFFFFFFC(rel)
        jmp     ?_010                                   ; 09CD _ E9, 00000192

?_005:  mov     dword [esp], timerinfo1.1692            ; 09D2 _ C7. 04 24, 0000000C(d)
        call    fifo8_status                            ; 09D9 _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 09DE _ 85. C0
        jz      ?_006                                   ; 09E0 _ 74, 52
        call    io_sti                                  ; 09E2 _ E8, FFFFFFFC(rel)
        mov     dword [esp], timerinfo1.1692            ; 09E7 _ C7. 04 24, 0000000C(d)
        call    fifo8_get                               ; 09EE _ E8, FFFFFFFC(rel)
        mov     edx, dword [back_sheet]                 ; 09F3 _ 8B. 15, 00000004(d)
        mov     eax, dword [sheet_control]              ; 09F9 _ A1, 00000000(d)
        mov     dword [esp+14H], 7                      ; 09FE _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_164                  ; 0A06 _ C7. 44 24, 10, 00000007(d)
        mov     dword [esp+0CH], 176                    ; 0A0E _ C7. 44 24, 0C, 000000B0
        mov     dword [esp+8H], 0                       ; 0A16 _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], edx                     ; 0A1E _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0A22 _ 89. 04 24
        call    paint_string                            ; 0A25 _ E8, FFFFFFFC(rel)
        call    taskswitch10                            ; 0A2A _ E8, FFFFFFFC(rel)
        jmp     ?_010                                   ; 0A2F _ E9, 00000130

?_006:  mov     dword [esp], timerinfo2.1693            ; 0A34 _ C7. 04 24, 0000002C(d)
        call    fifo8_status                            ; 0A3B _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 0A40 _ 85. C0
        jz      ?_007                                   ; 0A42 _ 74, 16
        call    io_sti                                  ; 0A44 _ E8, FFFFFFFC(rel)
        mov     dword [esp], timerinfo2.1693            ; 0A49 _ C7. 04 24, 0000002C(d)
        call    fifo8_get                               ; 0A50 _ E8, FFFFFFFC(rel)
        jmp     ?_010                                   ; 0A55 _ E9, 0000010A

?_007:  mov     dword [esp], timerinfo3.1694            ; 0A5A _ C7. 04 24, 0000004C(d)
        call    fifo8_status                            ; 0A61 _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 0A66 _ 85. C0
        je      ?_010                                   ; 0A68 _ 0F 84, 000000F6
        mov     dword [esp], timerinfo3.1694            ; 0A6E _ C7. 04 24, 0000004C(d)
        call    fifo8_get                               ; 0A75 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 0A7A _ 89. 45, F4
        call    io_sti                                  ; 0A7D _ E8, FFFFFFFC(rel)
        cmp     dword [ebp-0CH], 0                      ; 0A82 _ 83. 7D, F4, 00
        jz      ?_008                                   ; 0A86 _ 74, 24
        mov     dword [esp+8H], 0                       ; 0A88 _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], timerinfo3.1694         ; 0A90 _ C7. 44 24, 04, 0000004C(d)
        mov     eax, dword [ebp-2CH]                    ; 0A98 _ 8B. 45, D4
        mov     dword [esp], eax                        ; 0A9B _ 89. 04 24
        call    timer_init                              ; 0A9E _ E8, FFFFFFFC(rel)
        mov     dword [ebp-48H], 0                      ; 0AA3 _ C7. 45, B8, 00000000
        jmp     ?_009                                   ; 0AAA _ EB, 22

?_008:  mov     dword [esp+8H], 1                       ; 0AAC _ C7. 44 24, 08, 00000001
        mov     dword [esp+4H], timerinfo3.1694         ; 0AB4 _ C7. 44 24, 04, 0000004C(d)
        mov     eax, dword [ebp-2CH]                    ; 0ABC _ 8B. 45, D4
        mov     dword [esp], eax                        ; 0ABF _ 89. 04 24
        call    timer_init                              ; 0AC2 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-48H], 7                      ; 0AC7 _ C7. 45, B8, 00000007
?_009:  mov     dword [esp+4H], 50                      ; 0ACE _ C7. 44 24, 04, 00000032
        mov     eax, dword [ebp-2CH]                    ; 0AD6 _ 8B. 45, D4
        mov     dword [esp], eax                        ; 0AD9 _ 89. 04 24
        call    timer_settime                           ; 0ADC _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-4CH]                    ; 0AE1 _ 8B. 45, B4
        lea     ebx, [eax+7H]                           ; 0AE4 _ 8D. 58, 07
        mov     eax, dword [ebp-48H]                    ; 0AE7 _ 8B. 45, B8
        movzx   ecx, al                                 ; 0AEA _ 0F B6. C8
        mov     eax, dword [sheet_win]                  ; 0AED _ A1, 00000000(d)
        mov     edx, dword [eax+4H]                     ; 0AF2 _ 8B. 50, 04
        mov     eax, dword [sheet_win]                  ; 0AF5 _ A1, 00000000(d)
        mov     eax, dword [eax]                        ; 0AFA _ 8B. 00
        mov     dword [esp+18H], 43                     ; 0AFC _ C7. 44 24, 18, 0000002B
        mov     dword [esp+14H], ebx                    ; 0B04 _ 89. 5C 24, 14
        mov     dword [esp+10H], 28                     ; 0B08 _ C7. 44 24, 10, 0000001C
        mov     ebx, dword [ebp-4CH]                    ; 0B10 _ 8B. 5D, B4
        mov     dword [esp+0CH], ebx                    ; 0B13 _ 89. 5C 24, 0C
        mov     dword [esp+8H], ecx                     ; 0B17 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 0B1B _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0B1F _ 89. 04 24
        call    paint_rectangle                         ; 0B22 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-4CH]                    ; 0B27 _ 8B. 45, B4
        lea     ecx, [eax+8H]                           ; 0B2A _ 8D. 48, 08
        mov     edx, dword [sheet_win]                  ; 0B2D _ 8B. 15, 00000000(d)
        mov     eax, dword [sheet_control]              ; 0B33 _ A1, 00000000(d)
        mov     dword [esp+14H], 44                     ; 0B38 _ C7. 44 24, 14, 0000002C
        mov     dword [esp+10H], ecx                    ; 0B40 _ 89. 4C 24, 10
        mov     dword [esp+0CH], 28                     ; 0B44 _ C7. 44 24, 0C, 0000001C
        mov     ecx, dword [ebp-4CH]                    ; 0B4C _ 8B. 4D, B4
        mov     dword [esp+8H], ecx                     ; 0B4F _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 0B53 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0B57 _ 89. 04 24
        call    sheet_refresh                           ; 0B5A _ E8, FFFFFFFC(rel)
        jmp     ?_001                                   ; 0B5F _ E9, FFFFFC35

?_010:  jmp     ?_001                                   ; 0B64 _ E9, FFFFFC30
; CMain End of function

task_b_main:; Function begin
        push    ebp                                     ; 0B69 _ 55
        mov     ebp, esp                                ; 0B6A _ 89. E5
        sub     esp, 88                                 ; 0B6C _ 83. EC, 58
; Note: Absolute memory address without relocation
        mov     eax, dword [gs:14H]                     ; 0B6F _ 65: A1, 00000014
        mov     dword [ebp-0CH], eax                    ; 0B75 _ 89. 45, F4
        xor     eax, eax                                ; 0B78 _ 31. C0
        mov     edx, dword [back_sheet]                 ; 0B7A _ 8B. 15, 00000004(d)
        mov     eax, dword [sheet_control]              ; 0B80 _ A1, 00000000(d)
        mov     dword [esp+14H], 7                      ; 0B85 _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_165                  ; 0B8D _ C7. 44 24, 10, 00000018(d)
        mov     dword [esp+0CH], 144                    ; 0B95 _ C7. 44 24, 0C, 00000090
        mov     dword [esp+8H], 0                       ; 0B9D _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], edx                     ; 0BA5 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0BA9 _ 89. 04 24
        call    paint_string                            ; 0BAC _ E8, FFFFFFFC(rel)
        mov     dword [ebp-34H], 0                      ; 0BB1 _ C7. 45, CC, 00000000
        mov     dword [ebp-30H], 0                      ; 0BB8 _ C7. 45, D0, 00000000
        lea     eax, [ebp-14H]                          ; 0BBF _ 8D. 45, EC
        mov     dword [esp+8H], eax                     ; 0BC2 _ 89. 44 24, 08
        mov     dword [esp+4H], 8                       ; 0BC6 _ C7. 44 24, 04, 00000008
        lea     eax, [ebp-2CH]                          ; 0BCE _ 8D. 45, D4
        mov     dword [esp], eax                        ; 0BD1 _ 89. 04 24
        call    fifo8_init                              ; 0BD4 _ E8, FFFFFFFC(rel)
        call    timer_alloc                             ; 0BD9 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-34H], eax                    ; 0BDE _ 89. 45, CC
        mov     dword [esp+8H], 123                     ; 0BE1 _ C7. 44 24, 08, 0000007B
        lea     eax, [ebp-2CH]                          ; 0BE9 _ 8D. 45, D4
        mov     dword [esp+4H], eax                     ; 0BEC _ 89. 44 24, 04
        mov     eax, dword [ebp-34H]                    ; 0BF0 _ 8B. 45, CC
        mov     dword [esp], eax                        ; 0BF3 _ 89. 04 24
        call    timer_init                              ; 0BF6 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 500                     ; 0BFB _ C7. 44 24, 04, 000001F4
        mov     eax, dword [ebp-34H]                    ; 0C03 _ 8B. 45, CC
        mov     dword [esp], eax                        ; 0C06 _ 89. 04 24
        call    timer_settime                           ; 0C09 _ E8, FFFFFFFC(rel)
?_011:  call    io_cli                                  ; 0C0E _ E8, FFFFFFFC(rel)
        lea     eax, [ebp-2CH]                          ; 0C13 _ 8D. 45, D4
        mov     dword [esp], eax                        ; 0C16 _ 89. 04 24
        call    fifo8_status                            ; 0C19 _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 0C1E _ 85. C0
        jnz     ?_012                                   ; 0C20 _ 75, 07
        call    io_sti                                  ; 0C22 _ E8, FFFFFFFC(rel)
        jmp     ?_013                                   ; 0C27 _ EB, 57

?_012:  lea     eax, [ebp-2CH]                          ; 0C29 _ 8D. 45, D4
        mov     dword [esp], eax                        ; 0C2C _ 89. 04 24
        call    fifo8_get                               ; 0C2F _ E8, FFFFFFFC(rel)
        mov     dword [ebp-30H], eax                    ; 0C34 _ 89. 45, D0
        call    io_sti                                  ; 0C37 _ E8, FFFFFFFC(rel)
        cmp     dword [ebp-30H], 123                    ; 0C3C _ 83. 7D, D0, 7B
        jnz     ?_013                                   ; 0C40 _ 75, 3E
        mov     edx, dword [back_sheet]                 ; 0C42 _ 8B. 15, 00000004(d)
        mov     eax, dword [sheet_control]              ; 0C48 _ A1, 00000000(d)
        mov     dword [esp+14H], 7                      ; 0C4D _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_166                  ; 0C55 _ C7. 44 24, 10, 00000025(d)
        mov     dword [esp+0CH], 160                    ; 0C5D _ C7. 44 24, 0C, 000000A0
        mov     dword [esp+8H], 0                       ; 0C65 _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], edx                     ; 0C6D _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0C71 _ 89. 04 24
        call    paint_string                            ; 0C74 _ E8, FFFFFFFC(rel)
        call    taskswitch8                             ; 0C79 _ E8, FFFFFFFC(rel)
        jmp     ?_011                                   ; 0C7E _ EB, 8E

?_013:  jmp     ?_011                                   ; 0C80 _ EB, 8C
; task_b_main End of function

init_screeninfo:; Function begin
        push    ebp                                     ; 0C82 _ 55
        mov     ebp, esp                                ; 0C83 _ 89. E5
        mov     eax, dword [VRAM_ADDRESS]               ; 0C85 _ A1, 00000000(d)
        mov     edx, eax                                ; 0C8A _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0C8C _ 8B. 45, 08
        mov     dword [eax], edx                        ; 0C8F _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 0C91 _ 8B. 45, 08
; Note: Length-changing prefix causes delay on Intel processors
        mov     word [eax+4H], 640                      ; 0C94 _ 66: C7. 40, 04, 0280
        mov     eax, dword [ebp+8H]                     ; 0C9A _ 8B. 45, 08
; Note: Length-changing prefix causes delay on Intel processors
        mov     word [eax+6H], 480                      ; 0C9D _ 66: C7. 40, 06, 01E0
        pop     ebp                                     ; 0CA3 _ 5D
        ret                                             ; 0CA4 _ C3
; init_screeninfo End of function

init_palette:; Function begin
        push    ebp                                     ; 0CA5 _ 55
        mov     ebp, esp                                ; 0CA6 _ 89. E5
        sub     esp, 24                                 ; 0CA8 _ 83. EC, 18
        mov     dword [esp+8H], table_rgb.1622          ; 0CAB _ C7. 44 24, 08, 00000080(d)
        mov     dword [esp+4H], 15                      ; 0CB3 _ C7. 44 24, 04, 0000000F
        mov     dword [esp], 0                          ; 0CBB _ C7. 04 24, 00000000
        call    set_palette                             ; 0CC2 _ E8, FFFFFFFC(rel)
        nop                                             ; 0CC7 _ 90
        leave                                           ; 0CC8 _ C9
        ret                                             ; 0CC9 _ C3
; init_palette End of function

set_palette:; Function begin
        push    ebp                                     ; 0CCA _ 55
        mov     ebp, esp                                ; 0CCB _ 89. E5
        sub     esp, 40                                 ; 0CCD _ 83. EC, 28
        call    io_load_eflags                          ; 0CD0 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 0CD5 _ 89. 45, F4
        call    io_cli                                  ; 0CD8 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 0CDD _ 8B. 45, 08
        mov     dword [esp+4H], eax                     ; 0CE0 _ 89. 44 24, 04
        mov     dword [esp], 968                        ; 0CE4 _ C7. 04 24, 000003C8
        call    io_out8                                 ; 0CEB _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 0CF0 _ 8B. 45, 08
        mov     dword [ebp-10H], eax                    ; 0CF3 _ 89. 45, F0
        jmp     ?_015                                   ; 0CF6 _ EB, 62

?_014:  mov     eax, dword [ebp+10H]                    ; 0CF8 _ 8B. 45, 10
        movzx   eax, byte [eax]                         ; 0CFB _ 0F B6. 00
        shr     al, 2                                   ; 0CFE _ C0. E8, 02
        movzx   eax, al                                 ; 0D01 _ 0F B6. C0
        mov     dword [esp+4H], eax                     ; 0D04 _ 89. 44 24, 04
        mov     dword [esp], 969                        ; 0D08 _ C7. 04 24, 000003C9
        call    io_out8                                 ; 0D0F _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0D14 _ 8B. 45, 10
        add     eax, 1                                  ; 0D17 _ 83. C0, 01
        movzx   eax, byte [eax]                         ; 0D1A _ 0F B6. 00
        shr     al, 2                                   ; 0D1D _ C0. E8, 02
        movzx   eax, al                                 ; 0D20 _ 0F B6. C0
        mov     dword [esp+4H], eax                     ; 0D23 _ 89. 44 24, 04
        mov     dword [esp], 969                        ; 0D27 _ C7. 04 24, 000003C9
        call    io_out8                                 ; 0D2E _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0D33 _ 8B. 45, 10
        add     eax, 2                                  ; 0D36 _ 83. C0, 02
        movzx   eax, byte [eax]                         ; 0D39 _ 0F B6. 00
        shr     al, 2                                   ; 0D3C _ C0. E8, 02
        movzx   eax, al                                 ; 0D3F _ 0F B6. C0
        mov     dword [esp+4H], eax                     ; 0D42 _ 89. 44 24, 04
        mov     dword [esp], 969                        ; 0D46 _ C7. 04 24, 000003C9
        call    io_out8                                 ; 0D4D _ E8, FFFFFFFC(rel)
        add     dword [ebp+10H], 3                      ; 0D52 _ 83. 45, 10, 03
        add     dword [ebp-10H], 1                      ; 0D56 _ 83. 45, F0, 01
?_015:  mov     eax, dword [ebp-10H]                    ; 0D5A _ 8B. 45, F0
        cmp     eax, dword [ebp+0CH]                    ; 0D5D _ 3B. 45, 0C
        jle     ?_014                                   ; 0D60 _ 7E, 96
        mov     eax, dword [ebp-0CH]                    ; 0D62 _ 8B. 45, F4
        mov     dword [esp], eax                        ; 0D65 _ 89. 04 24
        call    io_store_eflags                         ; 0D68 _ E8, FFFFFFFC(rel)
        nop                                             ; 0D6D _ 90
        leave                                           ; 0D6E _ C9
        ret                                             ; 0D6F _ C3
; set_palette End of function

paint_rectangle:; Function begin
        push    ebp                                     ; 0D70 _ 55
        mov     ebp, esp                                ; 0D71 _ 89. E5
        sub     esp, 20                                 ; 0D73 _ 83. EC, 14
        mov     eax, dword [ebp+10H]                    ; 0D76 _ 8B. 45, 10
        mov     byte [ebp-14H], al                      ; 0D79 _ 88. 45, EC
        mov     eax, dword [ebp+18H]                    ; 0D7C _ 8B. 45, 18
        mov     dword [ebp-4H], eax                     ; 0D7F _ 89. 45, FC
        jmp     ?_019                                   ; 0D82 _ EB, 33

?_016:  mov     eax, dword [ebp+14H]                    ; 0D84 _ 8B. 45, 14
        mov     dword [ebp-8H], eax                     ; 0D87 _ 89. 45, F8
        jmp     ?_018                                   ; 0D8A _ EB, 1F

?_017:  mov     eax, dword [ebp-4H]                     ; 0D8C _ 8B. 45, FC
        imul    eax, dword [ebp+0CH]                    ; 0D8F _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0D93 _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 0D95 _ 8B. 45, F8
        add     eax, edx                                ; 0D98 _ 01. D0
        mov     edx, eax                                ; 0D9A _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0D9C _ 8B. 45, 08
        add     edx, eax                                ; 0D9F _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0DA1 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0DA5 _ 88. 02
        add     dword [ebp-8H], 1                       ; 0DA7 _ 83. 45, F8, 01
?_018:  mov     eax, dword [ebp-8H]                     ; 0DAB _ 8B. 45, F8
        cmp     eax, dword [ebp+1CH]                    ; 0DAE _ 3B. 45, 1C
        jle     ?_017                                   ; 0DB1 _ 7E, D9
        add     dword [ebp-4H], 1                       ; 0DB3 _ 83. 45, FC, 01
?_019:  mov     eax, dword [ebp-4H]                     ; 0DB7 _ 8B. 45, FC
        cmp     eax, dword [ebp+20H]                    ; 0DBA _ 3B. 45, 20
        jle     ?_016                                   ; 0DBD _ 7E, C5
        leave                                           ; 0DBF _ C9
        ret                                             ; 0DC0 _ C3
; paint_rectangle End of function

init_desktop:; Function begin
        push    ebp                                     ; 0DC1 _ 55
        mov     ebp, esp                                ; 0DC2 _ 89. E5
        push    ebx                                     ; 0DC4 _ 53
        sub     esp, 28                                 ; 0DC5 _ 83. EC, 1C
        mov     eax, dword [ebp+10H]                    ; 0DC8 _ 8B. 45, 10
        lea     edx, [eax-1DH]                          ; 0DCB _ 8D. 50, E3
        mov     eax, dword [ebp+0CH]                    ; 0DCE _ 8B. 45, 0C
        sub     eax, 1                                  ; 0DD1 _ 83. E8, 01
        mov     dword [esp+18H], edx                    ; 0DD4 _ 89. 54 24, 18
        mov     dword [esp+14H], eax                    ; 0DD8 _ 89. 44 24, 14
        mov     dword [esp+10H], 0                      ; 0DDC _ C7. 44 24, 10, 00000000
        mov     dword [esp+0CH], 0                      ; 0DE4 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 2                       ; 0DEC _ C7. 44 24, 08, 00000002
        mov     eax, dword [ebp+0CH]                    ; 0DF4 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0DF7 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0DFB _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0DFE _ 89. 04 24
        call    paint_rectangle                         ; 0E01 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0E06 _ 8B. 45, 10
        lea     ecx, [eax-1CH]                          ; 0E09 _ 8D. 48, E4
        mov     eax, dword [ebp+0CH]                    ; 0E0C _ 8B. 45, 0C
        lea     edx, [eax-1H]                           ; 0E0F _ 8D. 50, FF
        mov     eax, dword [ebp+10H]                    ; 0E12 _ 8B. 45, 10
        sub     eax, 28                                 ; 0E15 _ 83. E8, 1C
        mov     dword [esp+18H], ecx                    ; 0E18 _ 89. 4C 24, 18
        mov     dword [esp+14H], edx                    ; 0E1C _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 0E20 _ 89. 44 24, 10
        mov     dword [esp+0CH], 0                      ; 0E24 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 8                       ; 0E2C _ C7. 44 24, 08, 00000008
        mov     eax, dword [ebp+0CH]                    ; 0E34 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0E37 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0E3B _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0E3E _ 89. 04 24
        call    paint_rectangle                         ; 0E41 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0E46 _ 8B. 45, 10
        lea     ecx, [eax-1BH]                          ; 0E49 _ 8D. 48, E5
        mov     eax, dword [ebp+0CH]                    ; 0E4C _ 8B. 45, 0C
        lea     edx, [eax-1H]                           ; 0E4F _ 8D. 50, FF
        mov     eax, dword [ebp+10H]                    ; 0E52 _ 8B. 45, 10
        sub     eax, 27                                 ; 0E55 _ 83. E8, 1B
        mov     dword [esp+18H], ecx                    ; 0E58 _ 89. 4C 24, 18
        mov     dword [esp+14H], edx                    ; 0E5C _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 0E60 _ 89. 44 24, 10
        mov     dword [esp+0CH], 0                      ; 0E64 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 7                       ; 0E6C _ C7. 44 24, 08, 00000007
        mov     eax, dword [ebp+0CH]                    ; 0E74 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0E77 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0E7B _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0E7E _ 89. 04 24
        call    paint_rectangle                         ; 0E81 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0E86 _ 8B. 45, 10
        lea     ecx, [eax-1H]                           ; 0E89 _ 8D. 48, FF
        mov     eax, dword [ebp+0CH]                    ; 0E8C _ 8B. 45, 0C
        lea     edx, [eax-1H]                           ; 0E8F _ 8D. 50, FF
        mov     eax, dword [ebp+10H]                    ; 0E92 _ 8B. 45, 10
        sub     eax, 26                                 ; 0E95 _ 83. E8, 1A
        mov     dword [esp+18H], ecx                    ; 0E98 _ 89. 4C 24, 18
        mov     dword [esp+14H], edx                    ; 0E9C _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 0EA0 _ 89. 44 24, 10
        mov     dword [esp+0CH], 0                      ; 0EA4 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 8                       ; 0EAC _ C7. 44 24, 08, 00000008
        mov     eax, dword [ebp+0CH]                    ; 0EB4 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0EB7 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0EBB _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0EBE _ 89. 04 24
        call    paint_rectangle                         ; 0EC1 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0EC6 _ 8B. 45, 10
        lea     edx, [eax-18H]                          ; 0EC9 _ 8D. 50, E8
        mov     eax, dword [ebp+10H]                    ; 0ECC _ 8B. 45, 10
        sub     eax, 24                                 ; 0ECF _ 83. E8, 18
        mov     dword [esp+18H], edx                    ; 0ED2 _ 89. 54 24, 18
        mov     dword [esp+14H], 59                     ; 0ED6 _ C7. 44 24, 14, 0000003B
        mov     dword [esp+10H], eax                    ; 0EDE _ 89. 44 24, 10
        mov     dword [esp+0CH], 3                      ; 0EE2 _ C7. 44 24, 0C, 00000003
        mov     dword [esp+8H], 7                       ; 0EEA _ C7. 44 24, 08, 00000007
        mov     eax, dword [ebp+0CH]                    ; 0EF2 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0EF5 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0EF9 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0EFC _ 89. 04 24
        call    paint_rectangle                         ; 0EFF _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0F04 _ 8B. 45, 10
        lea     edx, [eax-4H]                           ; 0F07 _ 8D. 50, FC
        mov     eax, dword [ebp+10H]                    ; 0F0A _ 8B. 45, 10
        sub     eax, 24                                 ; 0F0D _ 83. E8, 18
        mov     dword [esp+18H], edx                    ; 0F10 _ 89. 54 24, 18
        mov     dword [esp+14H], 2                      ; 0F14 _ C7. 44 24, 14, 00000002
        mov     dword [esp+10H], eax                    ; 0F1C _ 89. 44 24, 10
        mov     dword [esp+0CH], 2                      ; 0F20 _ C7. 44 24, 0C, 00000002
        mov     dword [esp+8H], 7                       ; 0F28 _ C7. 44 24, 08, 00000007
        mov     eax, dword [ebp+0CH]                    ; 0F30 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0F33 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0F37 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0F3A _ 89. 04 24
        call    paint_rectangle                         ; 0F3D _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0F42 _ 8B. 45, 10
        lea     edx, [eax-4H]                           ; 0F45 _ 8D. 50, FC
        mov     eax, dword [ebp+10H]                    ; 0F48 _ 8B. 45, 10
        sub     eax, 4                                  ; 0F4B _ 83. E8, 04
        mov     dword [esp+18H], edx                    ; 0F4E _ 89. 54 24, 18
        mov     dword [esp+14H], 59                     ; 0F52 _ C7. 44 24, 14, 0000003B
        mov     dword [esp+10H], eax                    ; 0F5A _ 89. 44 24, 10
        mov     dword [esp+0CH], 3                      ; 0F5E _ C7. 44 24, 0C, 00000003
        mov     dword [esp+8H], 2                       ; 0F66 _ C7. 44 24, 08, 00000002
        mov     eax, dword [ebp+0CH]                    ; 0F6E _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0F71 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0F75 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0F78 _ 89. 04 24
        call    paint_rectangle                         ; 0F7B _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0F80 _ 8B. 45, 10
        lea     edx, [eax-5H]                           ; 0F83 _ 8D. 50, FB
        mov     eax, dword [ebp+10H]                    ; 0F86 _ 8B. 45, 10
        sub     eax, 23                                 ; 0F89 _ 83. E8, 17
        mov     dword [esp+18H], edx                    ; 0F8C _ 89. 54 24, 18
        mov     dword [esp+14H], 59                     ; 0F90 _ C7. 44 24, 14, 0000003B
        mov     dword [esp+10H], eax                    ; 0F98 _ 89. 44 24, 10
        mov     dword [esp+0CH], 59                     ; 0F9C _ C7. 44 24, 0C, 0000003B
        mov     dword [esp+8H], 2                       ; 0FA4 _ C7. 44 24, 08, 00000002
        mov     eax, dword [ebp+0CH]                    ; 0FAC _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0FAF _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0FB3 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0FB6 _ 89. 04 24
        call    paint_rectangle                         ; 0FB9 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0FBE _ 8B. 45, 10
        lea     edx, [eax-3H]                           ; 0FC1 _ 8D. 50, FD
        mov     eax, dword [ebp+10H]                    ; 0FC4 _ 8B. 45, 10
        sub     eax, 3                                  ; 0FC7 _ 83. E8, 03
        mov     dword [esp+18H], edx                    ; 0FCA _ 89. 54 24, 18
        mov     dword [esp+14H], 59                     ; 0FCE _ C7. 44 24, 14, 0000003B
        mov     dword [esp+10H], eax                    ; 0FD6 _ 89. 44 24, 10
        mov     dword [esp+0CH], 2                      ; 0FDA _ C7. 44 24, 0C, 00000002
        mov     dword [esp+8H], 0                       ; 0FE2 _ C7. 44 24, 08, 00000000
        mov     eax, dword [ebp+0CH]                    ; 0FEA _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0FED _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0FF1 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0FF4 _ 89. 04 24
        call    paint_rectangle                         ; 0FF7 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0FFC _ 8B. 45, 10
        lea     edx, [eax-3H]                           ; 0FFF _ 8D. 50, FD
        mov     eax, dword [ebp+10H]                    ; 1002 _ 8B. 45, 10
        sub     eax, 24                                 ; 1005 _ 83. E8, 18
        mov     dword [esp+18H], edx                    ; 1008 _ 89. 54 24, 18
        mov     dword [esp+14H], 60                     ; 100C _ C7. 44 24, 14, 0000003C
        mov     dword [esp+10H], eax                    ; 1014 _ 89. 44 24, 10
        mov     dword [esp+0CH], 60                     ; 1018 _ C7. 44 24, 0C, 0000003C
        mov     dword [esp+8H], 0                       ; 1020 _ C7. 44 24, 08, 00000000
        mov     eax, dword [ebp+0CH]                    ; 1028 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 102B _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 102F _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1032 _ 89. 04 24
        call    paint_rectangle                         ; 1035 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 103A _ 8B. 45, 10
        lea     ebx, [eax-18H]                          ; 103D _ 8D. 58, E8
        mov     eax, dword [ebp+0CH]                    ; 1040 _ 8B. 45, 0C
        lea     ecx, [eax-4H]                           ; 1043 _ 8D. 48, FC
        mov     eax, dword [ebp+10H]                    ; 1046 _ 8B. 45, 10
        lea     edx, [eax-18H]                          ; 1049 _ 8D. 50, E8
        mov     eax, dword [ebp+0CH]                    ; 104C _ 8B. 45, 0C
        sub     eax, 47                                 ; 104F _ 83. E8, 2F
        mov     dword [esp+18H], ebx                    ; 1052 _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 1056 _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 105A _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 105E _ 89. 44 24, 0C
        mov     dword [esp+8H], 2                       ; 1062 _ C7. 44 24, 08, 00000002
        mov     eax, dword [ebp+0CH]                    ; 106A _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 106D _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1071 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1074 _ 89. 04 24
        call    paint_rectangle                         ; 1077 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 107C _ 8B. 45, 10
        lea     ebx, [eax-4H]                           ; 107F _ 8D. 58, FC
        mov     eax, dword [ebp+0CH]                    ; 1082 _ 8B. 45, 0C
        lea     ecx, [eax-2FH]                          ; 1085 _ 8D. 48, D1
        mov     eax, dword [ebp+10H]                    ; 1088 _ 8B. 45, 10
        lea     edx, [eax-17H]                          ; 108B _ 8D. 50, E9
        mov     eax, dword [ebp+0CH]                    ; 108E _ 8B. 45, 0C
        sub     eax, 47                                 ; 1091 _ 83. E8, 2F
        mov     dword [esp+18H], ebx                    ; 1094 _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 1098 _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 109C _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 10A0 _ 89. 44 24, 0C
        mov     dword [esp+8H], 2                       ; 10A4 _ C7. 44 24, 08, 00000002
        mov     eax, dword [ebp+0CH]                    ; 10AC _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 10AF _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 10B3 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 10B6 _ 89. 04 24
        call    paint_rectangle                         ; 10B9 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 10BE _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 10C1 _ 8D. 58, FD
        mov     eax, dword [ebp+0CH]                    ; 10C4 _ 8B. 45, 0C
        lea     ecx, [eax-4H]                           ; 10C7 _ 8D. 48, FC
        mov     eax, dword [ebp+10H]                    ; 10CA _ 8B. 45, 10
        lea     edx, [eax-3H]                           ; 10CD _ 8D. 50, FD
        mov     eax, dword [ebp+0CH]                    ; 10D0 _ 8B. 45, 0C
        sub     eax, 47                                 ; 10D3 _ 83. E8, 2F
        mov     dword [esp+18H], ebx                    ; 10D6 _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 10DA _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 10DE _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 10E2 _ 89. 44 24, 0C
        mov     dword [esp+8H], 7                       ; 10E6 _ C7. 44 24, 08, 00000007
        mov     eax, dword [ebp+0CH]                    ; 10EE _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 10F1 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 10F5 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 10F8 _ 89. 04 24
        call    paint_rectangle                         ; 10FB _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 1100 _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 1103 _ 8D. 58, FD
        mov     eax, dword [ebp+0CH]                    ; 1106 _ 8B. 45, 0C
        lea     ecx, [eax-3H]                           ; 1109 _ 8D. 48, FD
        mov     eax, dword [ebp+10H]                    ; 110C _ 8B. 45, 10
        lea     edx, [eax-18H]                          ; 110F _ 8D. 50, E8
        mov     eax, dword [ebp+0CH]                    ; 1112 _ 8B. 45, 0C
        sub     eax, 3                                  ; 1115 _ 83. E8, 03
        mov     dword [esp+18H], ebx                    ; 1118 _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 111C _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 1120 _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 1124 _ 89. 44 24, 0C
        mov     dword [esp+8H], 7                       ; 1128 _ C7. 44 24, 08, 00000007
        mov     eax, dword [ebp+0CH]                    ; 1130 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 1133 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1137 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 113A _ 89. 04 24
        call    paint_rectangle                         ; 113D _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1142 _ 83. C4, 1C
        pop     ebx                                     ; 1145 _ 5B
        pop     ebp                                     ; 1146 _ 5D
        ret                                             ; 1147 _ C3
; init_desktop End of function

init_mouse_position:; Function begin
        push    ebp                                     ; 1148 _ 55
        mov     ebp, esp                                ; 1149 _ 89. E5
        sub     esp, 16                                 ; 114B _ 83. EC, 10
        movzx   eax, word [?_204]                       ; 114E _ 0F B7. 05, 00000184(d)
        cwde                                            ; 1155 _ 98
        mov     dword [ebp-8H], eax                     ; 1156 _ 89. 45, F8
        movzx   eax, word [?_205]                       ; 1159 _ 0F B7. 05, 00000186(d)
        cwde                                            ; 1160 _ 98
        mov     dword [ebp-4H], eax                     ; 1161 _ 89. 45, FC
        mov     eax, dword [ebp-8H]                     ; 1164 _ 8B. 45, F8
        sub     eax, 16                                 ; 1167 _ 83. E8, 10
        mov     edx, eax                                ; 116A _ 89. C2
        shr     edx, 31                                 ; 116C _ C1. EA, 1F
        add     eax, edx                                ; 116F _ 01. D0
        sar     eax, 1                                  ; 1171 _ D1. F8
        mov     dword [mouse_x], eax                    ; 1173 _ A3, 000002A8(d)
        mov     eax, dword [ebp-4H]                     ; 1178 _ 8B. 45, FC
        sub     eax, 44                                 ; 117B _ 83. E8, 2C
        mov     edx, eax                                ; 117E _ 89. C2
        shr     edx, 31                                 ; 1180 _ C1. EA, 1F
        add     eax, edx                                ; 1183 _ 01. D0
        sar     eax, 1                                  ; 1185 _ D1. F8
        mov     dword [mouse_y], eax                    ; 1187 _ A3, 000002AC(d)
        leave                                           ; 118C _ C9
        ret                                             ; 118D _ C3
; init_mouse_position End of function

paint_font:; Function begin
        push    ebp                                     ; 118E _ 55
        mov     ebp, esp                                ; 118F _ 89. E5
        sub     esp, 20                                 ; 1191 _ 83. EC, 14
        mov     eax, dword [ebp+1CH]                    ; 1194 _ 8B. 45, 1C
        mov     byte [ebp-14H], al                      ; 1197 _ 88. 45, EC
        mov     dword [ebp-4H], 0                       ; 119A _ C7. 45, FC, 00000000
        jmp     ?_029                                   ; 11A1 _ E9, 0000016E

?_020:  mov     edx, dword [ebp-4H]                     ; 11A6 _ 8B. 55, FC
        mov     eax, dword [ebp+18H]                    ; 11A9 _ 8B. 45, 18
        add     eax, edx                                ; 11AC _ 01. D0
        movzx   eax, byte [eax]                         ; 11AE _ 0F B6. 00
        mov     byte [ebp-5H], al                       ; 11B1 _ 88. 45, FB
        movzx   eax, byte [ebp-5H]                      ; 11B4 _ 0F B6. 45, FB
        test    al, al                                  ; 11B8 _ 84. C0
        jns     ?_021                                   ; 11BA _ 79, 20
        mov     eax, dword [ebp-4H]                     ; 11BC _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 11BF _ 8B. 55, 14
        add     eax, edx                                ; 11C2 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 11C4 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 11C8 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 11CA _ 8B. 45, 10
        add     eax, edx                                ; 11CD _ 01. D0
        mov     edx, eax                                ; 11CF _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 11D1 _ 8B. 45, 08
        add     edx, eax                                ; 11D4 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 11D6 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 11DA _ 88. 02
?_021:  movzx   eax, byte [ebp-5H]                      ; 11DC _ 0F B6. 45, FB
        and     eax, 40H                                ; 11E0 _ 83. E0, 40
        test    eax, eax                                ; 11E3 _ 85. C0
        jz      ?_022                                   ; 11E5 _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 11E7 _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 11EA _ 8B. 55, 14
        add     eax, edx                                ; 11ED _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 11EF _ 0F AF. 45, 0C
        mov     edx, eax                                ; 11F3 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 11F5 _ 8B. 45, 10
        add     eax, edx                                ; 11F8 _ 01. D0
        lea     edx, [eax+1H]                           ; 11FA _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 11FD _ 8B. 45, 08
        add     edx, eax                                ; 1200 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 1202 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 1206 _ 88. 02
?_022:  movzx   eax, byte [ebp-5H]                      ; 1208 _ 0F B6. 45, FB
        and     eax, 20H                                ; 120C _ 83. E0, 20
        test    eax, eax                                ; 120F _ 85. C0
        jz      ?_023                                   ; 1211 _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 1213 _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 1216 _ 8B. 55, 14
        add     eax, edx                                ; 1219 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 121B _ 0F AF. 45, 0C
        mov     edx, eax                                ; 121F _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 1221 _ 8B. 45, 10
        add     eax, edx                                ; 1224 _ 01. D0
        lea     edx, [eax+2H]                           ; 1226 _ 8D. 50, 02
        mov     eax, dword [ebp+8H]                     ; 1229 _ 8B. 45, 08
        add     edx, eax                                ; 122C _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 122E _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 1232 _ 88. 02
?_023:  movzx   eax, byte [ebp-5H]                      ; 1234 _ 0F B6. 45, FB
        and     eax, 10H                                ; 1238 _ 83. E0, 10
        test    eax, eax                                ; 123B _ 85. C0
        jz      ?_024                                   ; 123D _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 123F _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 1242 _ 8B. 55, 14
        add     eax, edx                                ; 1245 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 1247 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 124B _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 124D _ 8B. 45, 10
        add     eax, edx                                ; 1250 _ 01. D0
        lea     edx, [eax+3H]                           ; 1252 _ 8D. 50, 03
        mov     eax, dword [ebp+8H]                     ; 1255 _ 8B. 45, 08
        add     edx, eax                                ; 1258 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 125A _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 125E _ 88. 02
?_024:  movzx   eax, byte [ebp-5H]                      ; 1260 _ 0F B6. 45, FB
        and     eax, 08H                                ; 1264 _ 83. E0, 08
        test    eax, eax                                ; 1267 _ 85. C0
        jz      ?_025                                   ; 1269 _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 126B _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 126E _ 8B. 55, 14
        add     eax, edx                                ; 1271 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 1273 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 1277 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 1279 _ 8B. 45, 10
        add     eax, edx                                ; 127C _ 01. D0
        lea     edx, [eax+4H]                           ; 127E _ 8D. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1281 _ 8B. 45, 08
        add     edx, eax                                ; 1284 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 1286 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 128A _ 88. 02
?_025:  movzx   eax, byte [ebp-5H]                      ; 128C _ 0F B6. 45, FB
        and     eax, 04H                                ; 1290 _ 83. E0, 04
        test    eax, eax                                ; 1293 _ 85. C0
        jz      ?_026                                   ; 1295 _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 1297 _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 129A _ 8B. 55, 14
        add     eax, edx                                ; 129D _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 129F _ 0F AF. 45, 0C
        mov     edx, eax                                ; 12A3 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 12A5 _ 8B. 45, 10
        add     eax, edx                                ; 12A8 _ 01. D0
        lea     edx, [eax+5H]                           ; 12AA _ 8D. 50, 05
        mov     eax, dword [ebp+8H]                     ; 12AD _ 8B. 45, 08
        add     edx, eax                                ; 12B0 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 12B2 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 12B6 _ 88. 02
?_026:  movzx   eax, byte [ebp-5H]                      ; 12B8 _ 0F B6. 45, FB
        and     eax, 02H                                ; 12BC _ 83. E0, 02
        test    eax, eax                                ; 12BF _ 85. C0
        jz      ?_027                                   ; 12C1 _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 12C3 _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 12C6 _ 8B. 55, 14
        add     eax, edx                                ; 12C9 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 12CB _ 0F AF. 45, 0C
        mov     edx, eax                                ; 12CF _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 12D1 _ 8B. 45, 10
        add     eax, edx                                ; 12D4 _ 01. D0
        lea     edx, [eax+6H]                           ; 12D6 _ 8D. 50, 06
        mov     eax, dword [ebp+8H]                     ; 12D9 _ 8B. 45, 08
        add     edx, eax                                ; 12DC _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 12DE _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 12E2 _ 88. 02
?_027:  movzx   eax, byte [ebp-5H]                      ; 12E4 _ 0F B6. 45, FB
        and     eax, 01H                                ; 12E8 _ 83. E0, 01
        test    eax, eax                                ; 12EB _ 85. C0
        jz      ?_028                                   ; 12ED _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 12EF _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 12F2 _ 8B. 55, 14
        add     eax, edx                                ; 12F5 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 12F7 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 12FB _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 12FD _ 8B. 45, 10
        add     eax, edx                                ; 1300 _ 01. D0
        lea     edx, [eax+7H]                           ; 1302 _ 8D. 50, 07
        mov     eax, dword [ebp+8H]                     ; 1305 _ 8B. 45, 08
        add     edx, eax                                ; 1308 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 130A _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 130E _ 88. 02
?_028:  add     dword [ebp-4H], 1                       ; 1310 _ 83. 45, FC, 01
?_029:  cmp     dword [ebp-4H], 15                      ; 1314 _ 83. 7D, FC, 0F
        jle     ?_020                                   ; 1318 _ 0F 8E, FFFFFE88
        leave                                           ; 131E _ C9
        ret                                             ; 131F _ C3
; paint_font End of function

paint_string:; Function begin
        push    ebp                                     ; 1320 _ 55
        mov     ebp, esp                                ; 1321 _ 89. E5
        push    ebx                                     ; 1323 _ 53
        sub     esp, 52                                 ; 1324 _ 83. EC, 34
        mov     eax, dword [ebp+1CH]                    ; 1327 _ 8B. 45, 1C
        mov     byte [ebp-1CH], al                      ; 132A _ 88. 45, E4
        mov     eax, dword [ebp+10H]                    ; 132D _ 8B. 45, 10
        mov     dword [ebp-0CH], eax                    ; 1330 _ 89. 45, F4
        jmp     ?_031                                   ; 1333 _ EB, 4B

?_030:  movsx   ecx, byte [ebp-1CH]                     ; 1335 _ 0F BE. 4D, E4
        mov     eax, dword [ebp+18H]                    ; 1339 _ 8B. 45, 18
        movzx   eax, byte [eax]                         ; 133C _ 0F B6. 00
        movsx   eax, al                                 ; 133F _ 0F BE. C0
        shl     eax, 4                                  ; 1342 _ C1. E0, 04
        lea     ebx, [systemFont+eax]                   ; 1345 _ 8D. 98, 00000000(d)
        mov     eax, dword [ebp+0CH]                    ; 134B _ 8B. 45, 0C
        mov     edx, dword [eax+4H]                     ; 134E _ 8B. 50, 04
        mov     eax, dword [ebp+0CH]                    ; 1351 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1354 _ 8B. 00
        mov     dword [esp+14H], ecx                    ; 1356 _ 89. 4C 24, 14
        mov     dword [esp+10H], ebx                    ; 135A _ 89. 5C 24, 10
        mov     ecx, dword [ebp+14H]                    ; 135E _ 8B. 4D, 14
        mov     dword [esp+0CH], ecx                    ; 1361 _ 89. 4C 24, 0C
        mov     ecx, dword [ebp+10H]                    ; 1365 _ 8B. 4D, 10
        mov     dword [esp+8H], ecx                     ; 1368 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 136C _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1370 _ 89. 04 24
        call    paint_font                              ; 1373 _ E8, FFFFFFFC(rel)
        add     dword [ebp+10H], 8                      ; 1378 _ 83. 45, 10, 08
        add     dword [ebp+18H], 1                      ; 137C _ 83. 45, 18, 01
?_031:  mov     eax, dword [ebp+18H]                    ; 1380 _ 8B. 45, 18
        movzx   eax, byte [eax]                         ; 1383 _ 0F B6. 00
        test    al, al                                  ; 1386 _ 84. C0
        jnz     ?_030                                   ; 1388 _ 75, AB
        mov     eax, dword [ebp+14H]                    ; 138A _ 8B. 45, 14
        add     eax, 16                                 ; 138D _ 83. C0, 10
        mov     dword [esp+14H], eax                    ; 1390 _ 89. 44 24, 14
        mov     eax, dword [ebp+10H]                    ; 1394 _ 8B. 45, 10
        mov     dword [esp+10H], eax                    ; 1397 _ 89. 44 24, 10
        mov     eax, dword [ebp+14H]                    ; 139B _ 8B. 45, 14
        mov     dword [esp+0CH], eax                    ; 139E _ 89. 44 24, 0C
        mov     eax, dword [ebp-0CH]                    ; 13A2 _ 8B. 45, F4
        mov     dword [esp+8H], eax                     ; 13A5 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 13A9 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 13AC _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 13B0 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 13B3 _ 89. 04 24
        call    sheet_refresh                           ; 13B6 _ E8, FFFFFFFC(rel)
        add     esp, 52                                 ; 13BB _ 83. C4, 34
        pop     ebx                                     ; 13BE _ 5B
        pop     ebp                                     ; 13BF _ 5D
        ret                                             ; 13C0 _ C3
; paint_string End of function

init_mouse_cursor:; Function begin
        push    ebp                                     ; 13C1 _ 55
        mov     ebp, esp                                ; 13C2 _ 89. E5
        sub     esp, 20                                 ; 13C4 _ 83. EC, 14
        mov     eax, dword [ebp+0CH]                    ; 13C7 _ 8B. 45, 0C
        mov     byte [ebp-14H], al                      ; 13CA _ 88. 45, EC
        mov     dword [ebp-8H], 0                       ; 13CD _ C7. 45, F8, 00000000
        jmp     ?_038                                   ; 13D4 _ E9, 0000009C

?_032:  mov     dword [ebp-4H], 0                       ; 13D9 _ C7. 45, FC, 00000000
        jmp     ?_037                                   ; 13E0 _ E9, 00000082

?_033:  mov     eax, dword [ebp-8H]                     ; 13E5 _ 8B. 45, F8
        shl     eax, 4                                  ; 13E8 _ C1. E0, 04
        mov     edx, eax                                ; 13EB _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 13ED _ 8B. 45, FC
        add     eax, edx                                ; 13F0 _ 01. D0
        add     eax, cursor.1690                        ; 13F2 _ 05, 000000C0(d)
        movzx   eax, byte [eax]                         ; 13F7 _ 0F B6. 00
        cmp     al, 42                                  ; 13FA _ 3C, 2A
        jnz     ?_034                                   ; 13FC _ 75, 19
        mov     eax, dword [ebp-8H]                     ; 13FE _ 8B. 45, F8
        shl     eax, 4                                  ; 1401 _ C1. E0, 04
        mov     edx, eax                                ; 1404 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 1406 _ 8B. 45, FC
        add     eax, edx                                ; 1409 _ 01. D0
        mov     edx, eax                                ; 140B _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 140D _ 8B. 45, 08
        add     eax, edx                                ; 1410 _ 01. D0
        mov     byte [eax], 0                           ; 1412 _ C6. 00, 00
        jmp     ?_036                                   ; 1415 _ EB, 4C

?_034:  mov     eax, dword [ebp-8H]                     ; 1417 _ 8B. 45, F8
        shl     eax, 4                                  ; 141A _ C1. E0, 04
        mov     edx, eax                                ; 141D _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 141F _ 8B. 45, FC
        add     eax, edx                                ; 1422 _ 01. D0
        add     eax, cursor.1690                        ; 1424 _ 05, 000000C0(d)
        movzx   eax, byte [eax]                         ; 1429 _ 0F B6. 00
        cmp     al, 79                                  ; 142C _ 3C, 4F
        jnz     ?_035                                   ; 142E _ 75, 19
        mov     eax, dword [ebp-8H]                     ; 1430 _ 8B. 45, F8
        shl     eax, 4                                  ; 1433 _ C1. E0, 04
        mov     edx, eax                                ; 1436 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 1438 _ 8B. 45, FC
        add     eax, edx                                ; 143B _ 01. D0
        mov     edx, eax                                ; 143D _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 143F _ 8B. 45, 08
        add     eax, edx                                ; 1442 _ 01. D0
        mov     byte [eax], 7                           ; 1444 _ C6. 00, 07
        jmp     ?_036                                   ; 1447 _ EB, 1A

?_035:  mov     eax, dword [ebp-8H]                     ; 1449 _ 8B. 45, F8
        shl     eax, 4                                  ; 144C _ C1. E0, 04
        mov     edx, eax                                ; 144F _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 1451 _ 8B. 45, FC
        add     eax, edx                                ; 1454 _ 01. D0
        mov     edx, eax                                ; 1456 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 1458 _ 8B. 45, 08
        add     edx, eax                                ; 145B _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 145D _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 1461 _ 88. 02
?_036:  add     dword [ebp-4H], 1                       ; 1463 _ 83. 45, FC, 01
?_037:  cmp     dword [ebp-4H], 15                      ; 1467 _ 83. 7D, FC, 0F
        jle     ?_033                                   ; 146B _ 0F 8E, FFFFFF74
        add     dword [ebp-8H], 1                       ; 1471 _ 83. 45, F8, 01
?_038:  cmp     dword [ebp-8H], 15                      ; 1475 _ 83. 7D, F8, 0F
        jle     ?_032                                   ; 1479 _ 0F 8E, FFFFFF5A
        leave                                           ; 147F _ C9
        ret                                             ; 1480 _ C3
; init_mouse_cursor End of function

paint_block:; Function begin
        push    ebp                                     ; 1481 _ 55
        mov     ebp, esp                                ; 1482 _ 89. E5
        sub     esp, 16                                 ; 1484 _ 83. EC, 10
        mov     dword [ebp-8H], 0                       ; 1487 _ C7. 45, F8, 00000000
        jmp     ?_042                                   ; 148E _ EB, 50

?_039:  mov     dword [ebp-4H], 0                       ; 1490 _ C7. 45, FC, 00000000
        jmp     ?_041                                   ; 1497 _ EB, 3B

?_040:  mov     eax, dword [ebp-8H]                     ; 1499 _ 8B. 45, F8
        mov     edx, dword [ebp+14H]                    ; 149C _ 8B. 55, 14
        add     eax, edx                                ; 149F _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 14A1 _ 0F AF. 45, 0C
        mov     edx, dword [ebp-4H]                     ; 14A5 _ 8B. 55, FC
        mov     ecx, dword [ebp+10H]                    ; 14A8 _ 8B. 4D, 10
        add     edx, ecx                                ; 14AB _ 01. CA
        add     eax, edx                                ; 14AD _ 01. D0
        mov     edx, eax                                ; 14AF _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 14B1 _ 8B. 45, 08
        add     edx, eax                                ; 14B4 _ 01. C2
        mov     eax, dword [ebp-8H]                     ; 14B6 _ 8B. 45, F8
        imul    eax, dword [ebp+18H]                    ; 14B9 _ 0F AF. 45, 18
        mov     ecx, eax                                ; 14BD _ 89. C1
        mov     eax, dword [ebp-4H]                     ; 14BF _ 8B. 45, FC
        add     eax, ecx                                ; 14C2 _ 01. C8
        mov     ecx, eax                                ; 14C4 _ 89. C1
        mov     eax, dword [ebp+20H]                    ; 14C6 _ 8B. 45, 20
        add     eax, ecx                                ; 14C9 _ 01. C8
        movzx   eax, byte [eax]                         ; 14CB _ 0F B6. 00
        mov     byte [edx], al                          ; 14CE _ 88. 02
        add     dword [ebp-4H], 1                       ; 14D0 _ 83. 45, FC, 01
?_041:  mov     eax, dword [ebp-4H]                     ; 14D4 _ 8B. 45, FC
        cmp     eax, dword [ebp+18H]                    ; 14D7 _ 3B. 45, 18
        jl      ?_040                                   ; 14DA _ 7C, BD
        add     dword [ebp-8H], 1                       ; 14DC _ 83. 45, F8, 01
?_042:  mov     eax, dword [ebp-8H]                     ; 14E0 _ 8B. 45, F8
        cmp     eax, dword [ebp+1CH]                    ; 14E3 _ 3B. 45, 1C
        jl      ?_039                                   ; 14E6 _ 7C, A8
        leave                                           ; 14E8 _ C9
        ret                                             ; 14E9 _ C3
; paint_block End of function

init_fifo_buf:; Function begin
        push    ebp                                     ; 14EA _ 55
        mov     ebp, esp                                ; 14EB _ 89. E5
        sub     esp, 24                                 ; 14ED _ 83. EC, 18
        mov     dword [esp+8H], mousebuf                ; 14F0 _ C7. 44 24, 08, 00000000(d)
        mov     dword [esp+4H], 128                     ; 14F8 _ C7. 44 24, 04, 00000080
        mov     dword [esp], mouseinfo                  ; 1500 _ C7. 04 24, 00000000(d)
        call    fifo8_init                              ; 1507 _ E8, FFFFFFFC(rel)
        mov     dword [esp+8H], keybuf                  ; 150C _ C7. 44 24, 08, 00000000(d)
        mov     dword [esp+4H], 32                      ; 1514 _ C7. 44 24, 04, 00000020
        mov     dword [esp], keyinfo                    ; 151C _ C7. 04 24, 00000000(d)
        call    fifo8_init                              ; 1523 _ E8, FFFFFFFC(rel)
        leave                                           ; 1528 _ C9
        ret                                             ; 1529 _ C3
; init_fifo_buf End of function

compute_mouse_position:; Function begin
        push    ebp                                     ; 152A _ 55
        mov     ebp, esp                                ; 152B _ 89. E5
        mov     eax, dword [ebp+10H]                    ; 152D _ 8B. 45, 10
        mov     edx, dword [eax+4H]                     ; 1530 _ 8B. 50, 04
        mov     eax, dword [mouse_x]                    ; 1533 _ A1, 000002A8(d)
        add     eax, edx                                ; 1538 _ 01. D0
        mov     dword [mouse_x], eax                    ; 153A _ A3, 000002A8(d)
        mov     eax, dword [ebp+10H]                    ; 153F _ 8B. 45, 10
        mov     edx, dword [eax+8H]                     ; 1542 _ 8B. 50, 08
        mov     eax, dword [mouse_y]                    ; 1545 _ A1, 000002AC(d)
        add     eax, edx                                ; 154A _ 01. D0
        mov     dword [mouse_y], eax                    ; 154C _ A3, 000002AC(d)
        mov     eax, dword [mouse_x]                    ; 1551 _ A1, 000002A8(d)
        test    eax, eax                                ; 1556 _ 85. C0
        jns     ?_043                                   ; 1558 _ 79, 0A
        mov     dword [mouse_x], 0                      ; 155A _ C7. 05, 000002A8(d), 00000000
?_043:  mov     eax, dword [mouse_y]                    ; 1564 _ A1, 000002AC(d)
        test    eax, eax                                ; 1569 _ 85. C0
        jns     ?_044                                   ; 156B _ 79, 0A
        mov     dword [mouse_y], 0                      ; 156D _ C7. 05, 000002AC(d), 00000000
?_044:  movzx   eax, word [?_204]                       ; 1577 _ 0F B7. 05, 00000184(d)
        cwde                                            ; 157E _ 98
        lea     edx, [eax-10H]                          ; 157F _ 8D. 50, F0
        mov     eax, dword [mouse_x]                    ; 1582 _ A1, 000002A8(d)
        cmp     edx, eax                                ; 1587 _ 39. C2
        jge     ?_045                                   ; 1589 _ 7D, 10
        movzx   eax, word [?_204]                       ; 158B _ 0F B7. 05, 00000184(d)
        cwde                                            ; 1592 _ 98
        sub     eax, 16                                 ; 1593 _ 83. E8, 10
        mov     dword [mouse_x], eax                    ; 1596 _ A3, 000002A8(d)
?_045:  movzx   eax, word [?_204]                       ; 159B _ 0F B7. 05, 00000184(d)
        cwde                                            ; 15A2 _ 98
        lea     edx, [eax-10H]                          ; 15A3 _ 8D. 50, F0
        mov     eax, dword [mouse_y]                    ; 15A6 _ A1, 000002AC(d)
        cmp     edx, eax                                ; 15AB _ 39. C2
        jge     ?_046                                   ; 15AD _ 7D, 10
        movzx   eax, word [?_204]                       ; 15AF _ 0F B7. 05, 00000184(d)
        cwde                                            ; 15B6 _ 98
        sub     eax, 16                                 ; 15B7 _ 83. E8, 10
        mov     dword [mouse_y], eax                    ; 15BA _ A3, 000002AC(d)
?_046:  pop     ebp                                     ; 15BF _ 5D
        ret                                             ; 15C0 _ C3
; compute_mouse_position End of function

show_mouse_info:; Function begin
        push    ebp                                     ; 15C1 _ 55
        mov     ebp, esp                                ; 15C2 _ 89. E5
        sub     esp, 40                                 ; 15C4 _ 83. EC, 28
        mov     byte [ebp-9H], 0                        ; 15C7 _ C6. 45, F7, 00
        call    io_sti                                  ; 15CB _ E8, FFFFFFFC(rel)
        mov     dword [esp], mouseinfo                  ; 15D0 _ C7. 04 24, 00000000(d)
        call    fifo8_get                               ; 15D7 _ E8, FFFFFFFC(rel)
        mov     byte [ebp-9H], al                       ; 15DC _ 88. 45, F7
        movzx   eax, byte [ebp-9H]                      ; 15DF _ 0F B6. 45, F7
        mov     dword [esp+4H], eax                     ; 15E3 _ 89. 44 24, 04
        mov     dword [esp], mouse_send_info            ; 15E7 _ C7. 04 24, 00000000(d)
        call    mouse_decode                            ; 15EE _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 15F3 _ 85. C0
        jz      ?_047                                   ; 15F5 _ 74, 77
        mov     dword [esp+8H], mouse_send_info         ; 15F7 _ C7. 44 24, 08, 00000000(d)
        mov     eax, dword [ebp+0CH]                    ; 15FF _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 1602 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1606 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1609 _ 89. 04 24
        call    compute_mouse_position                  ; 160C _ E8, FFFFFFFC(rel)
        mov     edx, dword [mouse_y]                    ; 1611 _ 8B. 15, 000002AC(d)
        mov     eax, dword [mouse_x]                    ; 1617 _ A1, 000002A8(d)
        mov     dword [esp+0CH], edx                    ; 161C _ 89. 54 24, 0C
        mov     dword [esp+8H], eax                     ; 1620 _ 89. 44 24, 08
        mov     eax, dword [ebp+10H]                    ; 1624 _ 8B. 45, 10
        mov     dword [esp+4H], eax                     ; 1627 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 162B _ 8B. 45, 08
        mov     dword [esp], eax                        ; 162E _ 89. 04 24
        call    sheet_slide                             ; 1631 _ E8, FFFFFFFC(rel)
        mov     eax, dword [mouse_send_info+0CH]        ; 1636 _ A1, 0000000C(d)
        and     eax, 01H                                ; 163B _ 83. E0, 01
        test    eax, eax                                ; 163E _ 85. C0
        jz      ?_047                                   ; 1640 _ 74, 2C
        mov     eax, dword [mouse_y]                    ; 1642 _ A1, 000002AC(d)
        lea     ecx, [eax-8H]                           ; 1647 _ 8D. 48, F8
        mov     eax, dword [mouse_x]                    ; 164A _ A1, 000002A8(d)
        lea     edx, [eax-50H]                          ; 164F _ 8D. 50, B0
        mov     eax, dword [sheet_win]                  ; 1652 _ A1, 000002A4(d)
        mov     dword [esp+0CH], ecx                    ; 1657 _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 165B _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 165F _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1663 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1666 _ 89. 04 24
        call    sheet_slide                             ; 1669 _ E8, FFFFFFFC(rel)
?_047:  leave                                           ; 166E _ C9
        ret                                             ; 166F _ C3
; show_mouse_info End of function

show_memory_info:; Function begin
        push    ebp                                     ; 1670 _ 55
        mov     ebp, esp                                ; 1671 _ 89. E5
        sub     esp, 88                                 ; 1673 _ 83. EC, 58
        mov     dword [ebp-38H], 0                      ; 1676 _ C7. 45, C8, 00000000
        mov     dword [ebp-34H], 0                      ; 167D _ C7. 45, CC, 00000000
        mov     dword [ebp-30H], 104                    ; 1684 _ C7. 45, D0, 00000068
        mov     eax, dword [screen_info]                ; 168B _ A1, 00000180(d)
        mov     dword [ebp-2CH], eax                    ; 1690 _ 89. 45, D4
        movzx   eax, word [?_204]                       ; 1693 _ 0F B7. 05, 00000184(d)
        cwde                                            ; 169A _ 98
        mov     dword [ebp-28H], eax                    ; 169B _ 89. 45, D8
        movzx   eax, word [?_205]                       ; 169E _ 0F B7. 05, 00000186(d)
        cwde                                            ; 16A5 _ 98
        mov     dword [ebp-24H], eax                    ; 16A6 _ 89. 45, DC
        mov     eax, dword [ebp+0CH]                    ; 16A9 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 16AC _ 8B. 00
        mov     edx, dword [ebp-24H]                    ; 16AE _ 8B. 55, DC
        mov     dword [esp+8H], edx                     ; 16B1 _ 89. 54 24, 08
        mov     edx, dword [ebp-28H]                    ; 16B5 _ 8B. 55, D8
        mov     dword [esp+4H], edx                     ; 16B8 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 16BC _ 89. 04 24
        call    init_desktop                            ; 16BF _ E8, FFFFFFFC(rel)
        mov     dword [esp+14H], 7                      ; 16C4 _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_167                  ; 16CC _ C7. 44 24, 10, 00000031(d)
        mov     eax, dword [ebp-34H]                    ; 16D4 _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 16D7 _ 89. 44 24, 0C
        mov     eax, dword [ebp-38H]                    ; 16DB _ 8B. 45, C8
        mov     dword [esp+8H], eax                     ; 16DE _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 16E2 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 16E5 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 16E9 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 16EC _ 89. 04 24
        call    paint_string                            ; 16EF _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+14H]                    ; 16F4 _ 8B. 45, 14
        mov     dword [esp], eax                        ; 16F7 _ 89. 04 24
        call    intToHexStr                             ; 16FA _ E8, FFFFFFFC(rel)
        mov     dword [ebp-20H], eax                    ; 16FF _ 89. 45, E0
        mov     dword [esp+14H], 7                      ; 1702 _ C7. 44 24, 14, 00000007
        mov     eax, dword [ebp-20H]                    ; 170A _ 8B. 45, E0
        mov     dword [esp+10H], eax                    ; 170D _ 89. 44 24, 10
        mov     eax, dword [ebp-34H]                    ; 1711 _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 1714 _ 89. 44 24, 0C
        mov     eax, dword [ebp-30H]                    ; 1718 _ 8B. 45, D0
        mov     dword [esp+8H], eax                     ; 171B _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 171F _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 1722 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1726 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1729 _ 89. 04 24
        call    paint_string                            ; 172C _ E8, FFFFFFFC(rel)
        add     dword [ebp-34H], 16                     ; 1731 _ 83. 45, CC, 10
        mov     dword [esp+14H], 7                      ; 1735 _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_168                  ; 173D _ C7. 44 24, 10, 0000003B(d)
        mov     eax, dword [ebp-34H]                    ; 1745 _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 1748 _ 89. 44 24, 0C
        mov     eax, dword [ebp-38H]                    ; 174C _ 8B. 45, C8
        mov     dword [esp+8H], eax                     ; 174F _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 1753 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 1756 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 175A _ 8B. 45, 08
        mov     dword [esp], eax                        ; 175D _ 89. 04 24
        call    paint_string                            ; 1760 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 1765 _ 8B. 45, 10
        mov     eax, dword [eax]                        ; 1768 _ 8B. 00
        mov     dword [esp], eax                        ; 176A _ 89. 04 24
        call    intToHexStr                             ; 176D _ E8, FFFFFFFC(rel)
        mov     dword [ebp-1CH], eax                    ; 1772 _ 89. 45, E4
        mov     dword [esp+14H], 7                      ; 1775 _ C7. 44 24, 14, 00000007
        mov     eax, dword [ebp-1CH]                    ; 177D _ 8B. 45, E4
        mov     dword [esp+10H], eax                    ; 1780 _ 89. 44 24, 10
        mov     eax, dword [ebp-34H]                    ; 1784 _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 1787 _ 89. 44 24, 0C
        mov     eax, dword [ebp-30H]                    ; 178B _ 8B. 45, D0
        mov     dword [esp+8H], eax                     ; 178E _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 1792 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 1795 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1799 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 179C _ 89. 04 24
        call    paint_string                            ; 179F _ E8, FFFFFFFC(rel)
        add     dword [ebp-34H], 16                     ; 17A4 _ 83. 45, CC, 10
        mov     dword [esp+14H], 7                      ; 17A8 _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_169                  ; 17B0 _ C7. 44 24, 10, 00000047(d)
        mov     eax, dword [ebp-34H]                    ; 17B8 _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 17BB _ 89. 44 24, 0C
        mov     eax, dword [ebp-38H]                    ; 17BF _ 8B. 45, C8
        mov     dword [esp+8H], eax                     ; 17C2 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 17C6 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 17C9 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 17CD _ 8B. 45, 08
        mov     dword [esp], eax                        ; 17D0 _ 89. 04 24
        call    paint_string                            ; 17D3 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 17D8 _ 8B. 45, 10
        mov     eax, dword [eax+4H]                     ; 17DB _ 8B. 40, 04
        mov     dword [esp], eax                        ; 17DE _ 89. 04 24
        call    intToHexStr                             ; 17E1 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-18H], eax                    ; 17E6 _ 89. 45, E8
        mov     dword [esp+14H], 7                      ; 17E9 _ C7. 44 24, 14, 00000007
        mov     eax, dword [ebp-18H]                    ; 17F1 _ 8B. 45, E8
        mov     dword [esp+10H], eax                    ; 17F4 _ 89. 44 24, 10
        mov     eax, dword [ebp-34H]                    ; 17F8 _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 17FB _ 89. 44 24, 0C
        mov     eax, dword [ebp-30H]                    ; 17FF _ 8B. 45, D0
        mov     dword [esp+8H], eax                     ; 1802 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 1806 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 1809 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 180D _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1810 _ 89. 04 24
        call    paint_string                            ; 1813 _ E8, FFFFFFFC(rel)
        add     dword [ebp-34H], 16                     ; 1818 _ 83. 45, CC, 10
        mov     dword [esp+14H], 7                      ; 181C _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_170                  ; 1824 _ C7. 44 24, 10, 00000053(d)
        mov     eax, dword [ebp-34H]                    ; 182C _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 182F _ 89. 44 24, 0C
        mov     eax, dword [ebp-38H]                    ; 1833 _ 8B. 45, C8
        mov     dword [esp+8H], eax                     ; 1836 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 183A _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 183D _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1841 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1844 _ 89. 04 24
        call    paint_string                            ; 1847 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 184C _ 8B. 45, 10
        mov     eax, dword [eax+8H]                     ; 184F _ 8B. 40, 08
        mov     dword [esp], eax                        ; 1852 _ 89. 04 24
        call    intToHexStr                             ; 1855 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-14H], eax                    ; 185A _ 89. 45, EC
        mov     dword [esp+14H], 7                      ; 185D _ C7. 44 24, 14, 00000007
        mov     eax, dword [ebp-14H]                    ; 1865 _ 8B. 45, EC
        mov     dword [esp+10H], eax                    ; 1868 _ 89. 44 24, 10
        mov     eax, dword [ebp-34H]                    ; 186C _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 186F _ 89. 44 24, 0C
        mov     eax, dword [ebp-30H]                    ; 1873 _ 8B. 45, D0
        mov     dword [esp+8H], eax                     ; 1876 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 187A _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 187D _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1881 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1884 _ 89. 04 24
        call    paint_string                            ; 1887 _ E8, FFFFFFFC(rel)
        add     dword [ebp-34H], 16                     ; 188C _ 83. 45, CC, 10
        mov     dword [esp+14H], 7                      ; 1890 _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_171                  ; 1898 _ C7. 44 24, 10, 0000005F(d)
        mov     eax, dword [ebp-34H]                    ; 18A0 _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 18A3 _ 89. 44 24, 0C
        mov     eax, dword [ebp-38H]                    ; 18A7 _ 8B. 45, C8
        mov     dword [esp+8H], eax                     ; 18AA _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 18AE _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 18B1 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 18B5 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 18B8 _ 89. 04 24
        call    paint_string                            ; 18BB _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 18C0 _ 8B. 45, 10
        mov     eax, dword [eax+0CH]                    ; 18C3 _ 8B. 40, 0C
        mov     dword [esp], eax                        ; 18C6 _ 89. 04 24
        call    intToHexStr                             ; 18C9 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 18CE _ 89. 45, F0
        mov     dword [esp+14H], 7                      ; 18D1 _ C7. 44 24, 14, 00000007
        mov     eax, dword [ebp-10H]                    ; 18D9 _ 8B. 45, F0
        mov     dword [esp+10H], eax                    ; 18DC _ 89. 44 24, 10
        mov     eax, dword [ebp-34H]                    ; 18E0 _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 18E3 _ 89. 44 24, 0C
        mov     eax, dword [ebp-30H]                    ; 18E7 _ 8B. 45, D0
        mov     dword [esp+8H], eax                     ; 18EA _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 18EE _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 18F1 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 18F5 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 18F8 _ 89. 04 24
        call    paint_string                            ; 18FB _ E8, FFFFFFFC(rel)
        add     dword [ebp-34H], 16                     ; 1900 _ 83. 45, CC, 10
        mov     dword [esp+14H], 7                      ; 1904 _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_172                  ; 190C _ C7. 44 24, 10, 0000006C(d)
        mov     eax, dword [ebp-34H]                    ; 1914 _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 1917 _ 89. 44 24, 0C
        mov     eax, dword [ebp-38H]                    ; 191B _ 8B. 45, C8
        mov     dword [esp+8H], eax                     ; 191E _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 1922 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 1925 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1929 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 192C _ 89. 04 24
        call    paint_string                            ; 192F _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 1934 _ 8B. 45, 10
        mov     eax, dword [eax+10H]                    ; 1937 _ 8B. 40, 10
        mov     dword [esp], eax                        ; 193A _ 89. 04 24
        call    intToHexStr                             ; 193D _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 1942 _ 89. 45, F4
        mov     dword [esp+14H], 7                      ; 1945 _ C7. 44 24, 14, 00000007
        mov     eax, dword [ebp-0CH]                    ; 194D _ 8B. 45, F4
        mov     dword [esp+10H], eax                    ; 1950 _ 89. 44 24, 10
        mov     eax, dword [ebp-34H]                    ; 1954 _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 1957 _ 89. 44 24, 0C
        mov     eax, dword [ebp-30H]                    ; 195B _ 8B. 45, D0
        mov     dword [esp+8H], eax                     ; 195E _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 1962 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 1965 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1969 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 196C _ 89. 04 24
        call    paint_string                            ; 196F _ E8, FFFFFFFC(rel)
        add     dword [ebp-34H], 16                     ; 1974 _ 83. 45, CC, 10
        leave                                           ; 1978 _ C9
        ret                                             ; 1979 _ C3
; show_memory_info End of function

message_box:; Function begin
        push    ebp                                     ; 197A _ 55
        mov     ebp, esp                                ; 197B _ 89. E5
        sub     esp, 56                                 ; 197D _ 83. EC, 38
        mov     eax, dword [ebp+8H]                     ; 1980 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1983 _ 89. 04 24
        call    sheet_alloc                             ; 1986 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 198B _ 89. 45, F0
        mov     eax, dword [memman]                     ; 198E _ A1, 00000000(d)
        mov     dword [esp+4H], 10880                   ; 1993 _ C7. 44 24, 04, 00002A80
        mov     dword [esp], eax                        ; 199B _ 89. 04 24
        call    memman_alloc_4k                         ; 199E _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 19A3 _ 89. 45, F4
        mov     dword [esp+10H], 99                     ; 19A6 _ C7. 44 24, 10, 00000063
        mov     dword [esp+0CH], 68                     ; 19AE _ C7. 44 24, 0C, 00000044
        mov     dword [esp+8H], 160                     ; 19B6 _ C7. 44 24, 08, 000000A0
        mov     eax, dword [ebp-0CH]                    ; 19BE _ 8B. 45, F4
        mov     dword [esp+4H], eax                     ; 19C1 _ 89. 44 24, 04
        mov     eax, dword [ebp-10H]                    ; 19C5 _ 8B. 45, F0
        mov     dword [esp], eax                        ; 19C8 _ 89. 04 24
        call    sheet_setbuf                            ; 19CB _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+0CH]                    ; 19D0 _ 8B. 45, 0C
        mov     dword [esp+8H], eax                     ; 19D3 _ 89. 44 24, 08
        mov     eax, dword [ebp-10H]                    ; 19D7 _ 8B. 45, F0
        mov     dword [esp+4H], eax                     ; 19DA _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 19DE _ 8B. 45, 08
        mov     dword [esp], eax                        ; 19E1 _ 89. 04 24
        call    make_windows                            ; 19E4 _ E8, FFFFFFFC(rel)
        mov     dword [esp+14H], 7                      ; 19E9 _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], 16                     ; 19F1 _ C7. 44 24, 10, 00000010
        mov     dword [esp+0CH], 144                    ; 19F9 _ C7. 44 24, 0C, 00000090
        mov     dword [esp+8H], 28                      ; 1A01 _ C7. 44 24, 08, 0000001C
        mov     dword [esp+4H], 8                       ; 1A09 _ C7. 44 24, 04, 00000008
        mov     eax, dword [ebp-10H]                    ; 1A11 _ 8B. 45, F0
        mov     dword [esp], eax                        ; 1A14 _ 89. 04 24
        call    make_textbox                            ; 1A17 _ E8, FFFFFFFC(rel)
        mov     dword [esp+0CH], 72                     ; 1A1C _ C7. 44 24, 0C, 00000048
        mov     dword [esp+8H], 80                      ; 1A24 _ C7. 44 24, 08, 00000050
        mov     eax, dword [ebp-10H]                    ; 1A2C _ 8B. 45, F0
        mov     dword [esp+4H], eax                     ; 1A2F _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1A33 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1A36 _ 89. 04 24
        call    sheet_slide                             ; 1A39 _ E8, FFFFFFFC(rel)
        mov     dword [esp+8H], 2                       ; 1A3E _ C7. 44 24, 08, 00000002
        mov     eax, dword [ebp-10H]                    ; 1A46 _ 8B. 45, F0
        mov     dword [esp+4H], eax                     ; 1A49 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1A4D _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1A50 _ 89. 04 24
        call    sheet_updown                            ; 1A53 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 1A58 _ 8B. 45, F0
        leave                                           ; 1A5B _ C9
        ret                                             ; 1A5C _ C3
; message_box End of function

make_textbox:; Function begin
        push    ebp                                     ; 1A5D _ 55
        mov     ebp, esp                                ; 1A5E _ 89. E5
        push    edi                                     ; 1A60 _ 57
        push    esi                                     ; 1A61 _ 56
        push    ebx                                     ; 1A62 _ 53
        sub     esp, 44                                 ; 1A63 _ 83. EC, 2C
        mov     eax, dword [ebp+14H]                    ; 1A66 _ 8B. 45, 14
        mov     edx, dword [ebp+0CH]                    ; 1A69 _ 8B. 55, 0C
        add     eax, edx                                ; 1A6C _ 01. D0
        mov     dword [ebp-14H], eax                    ; 1A6E _ 89. 45, EC
        mov     eax, dword [ebp+18H]                    ; 1A71 _ 8B. 45, 18
        mov     edx, dword [ebp+10H]                    ; 1A74 _ 8B. 55, 10
        add     eax, edx                                ; 1A77 _ 01. D0
        mov     dword [ebp-10H], eax                    ; 1A79 _ 89. 45, F0
        mov     eax, dword [ebp+10H]                    ; 1A7C _ 8B. 45, 10
        lea     edi, [eax-3H]                           ; 1A7F _ 8D. 78, FD
        mov     eax, dword [ebp-14H]                    ; 1A82 _ 8B. 45, EC
        lea     esi, [eax+1H]                           ; 1A85 _ 8D. 70, 01
        mov     eax, dword [ebp+10H]                    ; 1A88 _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 1A8B _ 8D. 58, FD
        mov     eax, dword [ebp+0CH]                    ; 1A8E _ 8B. 45, 0C
        lea     ecx, [eax-2H]                           ; 1A91 _ 8D. 48, FE
        mov     eax, dword [ebp+8H]                     ; 1A94 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 1A97 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1A9A _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1A9D _ 8B. 00
        mov     dword [esp+18H], edi                    ; 1A9F _ 89. 7C 24, 18
        mov     dword [esp+14H], esi                    ; 1AA3 _ 89. 74 24, 14
        mov     dword [esp+10H], ebx                    ; 1AA7 _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 1AAB _ 89. 4C 24, 0C
        mov     dword [esp+8H], 15                      ; 1AAF _ C7. 44 24, 08, 0000000F
        mov     dword [esp+4H], edx                     ; 1AB7 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1ABB _ 89. 04 24
        call    paint_rectangle                         ; 1ABE _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 1AC3 _ 8B. 45, F0
        lea     edi, [eax+1H]                           ; 1AC6 _ 8D. 78, 01
        mov     eax, dword [ebp+0CH]                    ; 1AC9 _ 8B. 45, 0C
        lea     esi, [eax-3H]                           ; 1ACC _ 8D. 70, FD
        mov     eax, dword [ebp+10H]                    ; 1ACF _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 1AD2 _ 8D. 58, FD
        mov     eax, dword [ebp+0CH]                    ; 1AD5 _ 8B. 45, 0C
        lea     ecx, [eax-3H]                           ; 1AD8 _ 8D. 48, FD
        mov     eax, dword [ebp+8H]                     ; 1ADB _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 1ADE _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1AE1 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1AE4 _ 8B. 00
        mov     dword [esp+18H], edi                    ; 1AE6 _ 89. 7C 24, 18
        mov     dword [esp+14H], esi                    ; 1AEA _ 89. 74 24, 14
        mov     dword [esp+10H], ebx                    ; 1AEE _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 1AF2 _ 89. 4C 24, 0C
        mov     dword [esp+8H], 15                      ; 1AF6 _ C7. 44 24, 08, 0000000F
        mov     dword [esp+4H], edx                     ; 1AFE _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1B02 _ 89. 04 24
        call    paint_rectangle                         ; 1B05 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 1B0A _ 8B. 45, F0
        lea     edi, [eax+2H]                           ; 1B0D _ 8D. 78, 02
        mov     eax, dword [ebp-14H]                    ; 1B10 _ 8B. 45, EC
        lea     esi, [eax+1H]                           ; 1B13 _ 8D. 70, 01
        mov     eax, dword [ebp-10H]                    ; 1B16 _ 8B. 45, F0
        lea     ebx, [eax+2H]                           ; 1B19 _ 8D. 58, 02
        mov     eax, dword [ebp+0CH]                    ; 1B1C _ 8B. 45, 0C
        lea     ecx, [eax-3H]                           ; 1B1F _ 8D. 48, FD
        mov     eax, dword [ebp+8H]                     ; 1B22 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 1B25 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1B28 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1B2B _ 8B. 00
        mov     dword [esp+18H], edi                    ; 1B2D _ 89. 7C 24, 18
        mov     dword [esp+14H], esi                    ; 1B31 _ 89. 74 24, 14
        mov     dword [esp+10H], ebx                    ; 1B35 _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 1B39 _ 89. 4C 24, 0C
        mov     dword [esp+8H], 7                       ; 1B3D _ C7. 44 24, 08, 00000007
        mov     dword [esp+4H], edx                     ; 1B45 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1B49 _ 89. 04 24
        call    paint_rectangle                         ; 1B4C _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 1B51 _ 8B. 45, F0
        lea     edi, [eax+2H]                           ; 1B54 _ 8D. 78, 02
        mov     eax, dword [ebp-14H]                    ; 1B57 _ 8B. 45, EC
        lea     esi, [eax+2H]                           ; 1B5A _ 8D. 70, 02
        mov     eax, dword [ebp+10H]                    ; 1B5D _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 1B60 _ 8D. 58, FD
        mov     eax, dword [ebp-14H]                    ; 1B63 _ 8B. 45, EC
        lea     ecx, [eax+2H]                           ; 1B66 _ 8D. 48, 02
        mov     eax, dword [ebp+8H]                     ; 1B69 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 1B6C _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1B6F _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1B72 _ 8B. 00
        mov     dword [esp+18H], edi                    ; 1B74 _ 89. 7C 24, 18
        mov     dword [esp+14H], esi                    ; 1B78 _ 89. 74 24, 14
        mov     dword [esp+10H], ebx                    ; 1B7C _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 1B80 _ 89. 4C 24, 0C
        mov     dword [esp+8H], 7                       ; 1B84 _ C7. 44 24, 08, 00000007
        mov     dword [esp+4H], edx                     ; 1B8C _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1B90 _ 89. 04 24
        call    paint_rectangle                         ; 1B93 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 1B98 _ 8B. 45, 10
        lea     ecx, [eax-2H]                           ; 1B9B _ 8D. 48, FE
        mov     eax, dword [ebp+10H]                    ; 1B9E _ 8B. 45, 10
        lea     esi, [eax-2H]                           ; 1BA1 _ 8D. 70, FE
        mov     eax, dword [ebp+0CH]                    ; 1BA4 _ 8B. 45, 0C
        lea     ebx, [eax-1H]                           ; 1BA7 _ 8D. 58, FF
        mov     eax, dword [ebp+8H]                     ; 1BAA _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 1BAD _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1BB0 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1BB3 _ 8B. 00
        mov     dword [esp+18H], ecx                    ; 1BB5 _ 89. 4C 24, 18
        mov     ecx, dword [ebp-14H]                    ; 1BB9 _ 8B. 4D, EC
        mov     dword [esp+14H], ecx                    ; 1BBC _ 89. 4C 24, 14
        mov     dword [esp+10H], esi                    ; 1BC0 _ 89. 74 24, 10
        mov     dword [esp+0CH], ebx                    ; 1BC4 _ 89. 5C 24, 0C
        mov     dword [esp+8H], 0                       ; 1BC8 _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], edx                     ; 1BD0 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1BD4 _ 89. 04 24
        call    paint_rectangle                         ; 1BD7 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+0CH]                    ; 1BDC _ 8B. 45, 0C
        lea     edi, [eax-2H]                           ; 1BDF _ 8D. 78, FE
        mov     eax, dword [ebp+10H]                    ; 1BE2 _ 8B. 45, 10
        lea     esi, [eax-2H]                           ; 1BE5 _ 8D. 70, FE
        mov     eax, dword [ebp+0CH]                    ; 1BE8 _ 8B. 45, 0C
        lea     ebx, [eax-2H]                           ; 1BEB _ 8D. 58, FE
        mov     eax, dword [ebp+8H]                     ; 1BEE _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 1BF1 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1BF4 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1BF7 _ 8B. 00
        mov     ecx, dword [ebp-10H]                    ; 1BF9 _ 8B. 4D, F0
        mov     dword [esp+18H], ecx                    ; 1BFC _ 89. 4C 24, 18
        mov     dword [esp+14H], edi                    ; 1C00 _ 89. 7C 24, 14
        mov     dword [esp+10H], esi                    ; 1C04 _ 89. 74 24, 10
        mov     dword [esp+0CH], ebx                    ; 1C08 _ 89. 5C 24, 0C
        mov     dword [esp+8H], 0                       ; 1C0C _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], edx                     ; 1C14 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1C18 _ 89. 04 24
        call    paint_rectangle                         ; 1C1B _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 1C20 _ 8B. 45, F0
        lea     ecx, [eax+1H]                           ; 1C23 _ 8D. 48, 01
        mov     eax, dword [ebp-10H]                    ; 1C26 _ 8B. 45, F0
        lea     esi, [eax+1H]                           ; 1C29 _ 8D. 70, 01
        mov     eax, dword [ebp+0CH]                    ; 1C2C _ 8B. 45, 0C
        lea     ebx, [eax-2H]                           ; 1C2F _ 8D. 58, FE
        mov     eax, dword [ebp+8H]                     ; 1C32 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 1C35 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1C38 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1C3B _ 8B. 00
        mov     dword [esp+18H], ecx                    ; 1C3D _ 89. 4C 24, 18
        mov     ecx, dword [ebp-14H]                    ; 1C41 _ 8B. 4D, EC
        mov     dword [esp+14H], ecx                    ; 1C44 _ 89. 4C 24, 14
        mov     dword [esp+10H], esi                    ; 1C48 _ 89. 74 24, 10
        mov     dword [esp+0CH], ebx                    ; 1C4C _ 89. 5C 24, 0C
        mov     dword [esp+8H], 8                       ; 1C50 _ C7. 44 24, 08, 00000008
        mov     dword [esp+4H], edx                     ; 1C58 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1C5C _ 89. 04 24
        call    paint_rectangle                         ; 1C5F _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 1C64 _ 8B. 45, F0
        lea     edi, [eax+1H]                           ; 1C67 _ 8D. 78, 01
        mov     eax, dword [ebp-14H]                    ; 1C6A _ 8B. 45, EC
        lea     esi, [eax+1H]                           ; 1C6D _ 8D. 70, 01
        mov     eax, dword [ebp+10H]                    ; 1C70 _ 8B. 45, 10
        lea     ebx, [eax-2H]                           ; 1C73 _ 8D. 58, FE
        mov     eax, dword [ebp-14H]                    ; 1C76 _ 8B. 45, EC
        lea     ecx, [eax+1H]                           ; 1C79 _ 8D. 48, 01
        mov     eax, dword [ebp+8H]                     ; 1C7C _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 1C7F _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1C82 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1C85 _ 8B. 00
        mov     dword [esp+18H], edi                    ; 1C87 _ 89. 7C 24, 18
        mov     dword [esp+14H], esi                    ; 1C8B _ 89. 74 24, 14
        mov     dword [esp+10H], ebx                    ; 1C8F _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 1C93 _ 89. 4C 24, 0C
        mov     dword [esp+8H], 8                       ; 1C97 _ C7. 44 24, 08, 00000008
        mov     dword [esp+4H], edx                     ; 1C9F _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1CA3 _ 89. 04 24
        call    paint_rectangle                         ; 1CA6 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 1CAB _ 8B. 45, 10
        lea     edi, [eax-1H]                           ; 1CAE _ 8D. 78, FF
        mov     eax, dword [ebp+0CH]                    ; 1CB1 _ 8B. 45, 0C
        lea     esi, [eax-1H]                           ; 1CB4 _ 8D. 70, FF
        mov     eax, dword [ebp+1CH]                    ; 1CB7 _ 8B. 45, 1C
        movzx   ecx, al                                 ; 1CBA _ 0F B6. C8
        mov     eax, dword [ebp+8H]                     ; 1CBD _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 1CC0 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1CC3 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1CC6 _ 8B. 00
        mov     ebx, dword [ebp-10H]                    ; 1CC8 _ 8B. 5D, F0
        mov     dword [esp+18H], ebx                    ; 1CCB _ 89. 5C 24, 18
        mov     ebx, dword [ebp-14H]                    ; 1CCF _ 8B. 5D, EC
        mov     dword [esp+14H], ebx                    ; 1CD2 _ 89. 5C 24, 14
        mov     dword [esp+10H], edi                    ; 1CD6 _ 89. 7C 24, 10
        mov     dword [esp+0CH], esi                    ; 1CDA _ 89. 74 24, 0C
        mov     dword [esp+8H], ecx                     ; 1CDE _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 1CE2 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1CE6 _ 89. 04 24
        call    paint_rectangle                         ; 1CE9 _ E8, FFFFFFFC(rel)
        add     esp, 44                                 ; 1CEE _ 83. C4, 2C
        pop     ebx                                     ; 1CF1 _ 5B
        pop     esi                                     ; 1CF2 _ 5E
        pop     edi                                     ; 1CF3 _ 5F
        pop     ebp                                     ; 1CF4 _ 5D
        ret                                             ; 1CF5 _ C3
; make_textbox End of function

make_windows:; Function begin
        push    ebp                                     ; 1CF6 _ 55
        mov     ebp, esp                                ; 1CF7 _ 89. E5
        push    ebx                                     ; 1CF9 _ 53
        sub     esp, 68                                 ; 1CFA _ 83. EC, 44
        mov     eax, dword [ebp+0CH]                    ; 1CFD _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 1D00 _ 8B. 40, 04
        mov     dword [ebp-10H], eax                    ; 1D03 _ 89. 45, F0
        mov     eax, dword [ebp+0CH]                    ; 1D06 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 1D09 _ 8B. 40, 08
        mov     dword [ebp-0CH], eax                    ; 1D0C _ 89. 45, F4
        mov     eax, dword [ebp-10H]                    ; 1D0F _ 8B. 45, F0
        lea     edx, [eax-1H]                           ; 1D12 _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 1D15 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1D18 _ 8B. 00
        mov     dword [esp+18H], 0                      ; 1D1A _ C7. 44 24, 18, 00000000
        mov     dword [esp+14H], edx                    ; 1D22 _ 89. 54 24, 14
        mov     dword [esp+10H], 0                      ; 1D26 _ C7. 44 24, 10, 00000000
        mov     dword [esp+0CH], 0                      ; 1D2E _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 8                       ; 1D36 _ C7. 44 24, 08, 00000008
        mov     edx, dword [ebp-10H]                    ; 1D3E _ 8B. 55, F0
        mov     dword [esp+4H], edx                     ; 1D41 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1D45 _ 89. 04 24
        call    paint_rectangle                         ; 1D48 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 1D4D _ 8B. 45, F0
        lea     edx, [eax-2H]                           ; 1D50 _ 8D. 50, FE
        mov     eax, dword [ebp+0CH]                    ; 1D53 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1D56 _ 8B. 00
        mov     dword [esp+18H], 1                      ; 1D58 _ C7. 44 24, 18, 00000001
        mov     dword [esp+14H], edx                    ; 1D60 _ 89. 54 24, 14
        mov     dword [esp+10H], 1                      ; 1D64 _ C7. 44 24, 10, 00000001
        mov     dword [esp+0CH], 1                      ; 1D6C _ C7. 44 24, 0C, 00000001
        mov     dword [esp+8H], 7                       ; 1D74 _ C7. 44 24, 08, 00000007
        mov     edx, dword [ebp-10H]                    ; 1D7C _ 8B. 55, F0
        mov     dword [esp+4H], edx                     ; 1D7F _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1D83 _ 89. 04 24
        call    paint_rectangle                         ; 1D86 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 1D8B _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 1D8E _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 1D91 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1D94 _ 8B. 00
        mov     dword [esp+18H], edx                    ; 1D96 _ 89. 54 24, 18
        mov     dword [esp+14H], 0                      ; 1D9A _ C7. 44 24, 14, 00000000
        mov     dword [esp+10H], 0                      ; 1DA2 _ C7. 44 24, 10, 00000000
        mov     dword [esp+0CH], 0                      ; 1DAA _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 8                       ; 1DB2 _ C7. 44 24, 08, 00000008
        mov     edx, dword [ebp-10H]                    ; 1DBA _ 8B. 55, F0
        mov     dword [esp+4H], edx                     ; 1DBD _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1DC1 _ 89. 04 24
        call    paint_rectangle                         ; 1DC4 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 1DC9 _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 1DCC _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 1DCF _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1DD2 _ 8B. 00
        mov     dword [esp+18H], edx                    ; 1DD4 _ 89. 54 24, 18
        mov     dword [esp+14H], 1                      ; 1DD8 _ C7. 44 24, 14, 00000001
        mov     dword [esp+10H], 1                      ; 1DE0 _ C7. 44 24, 10, 00000001
        mov     dword [esp+0CH], 1                      ; 1DE8 _ C7. 44 24, 0C, 00000001
        mov     dword [esp+8H], 7                       ; 1DF0 _ C7. 44 24, 08, 00000007
        mov     edx, dword [ebp-10H]                    ; 1DF8 _ 8B. 55, F0
        mov     dword [esp+4H], edx                     ; 1DFB _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1DFF _ 89. 04 24
        call    paint_rectangle                         ; 1E02 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 1E07 _ 8B. 45, F4
        lea     ebx, [eax-2H]                           ; 1E0A _ 8D. 58, FE
        mov     eax, dword [ebp-10H]                    ; 1E0D _ 8B. 45, F0
        lea     ecx, [eax-2H]                           ; 1E10 _ 8D. 48, FE
        mov     eax, dword [ebp-10H]                    ; 1E13 _ 8B. 45, F0
        lea     edx, [eax-2H]                           ; 1E16 _ 8D. 50, FE
        mov     eax, dword [ebp+0CH]                    ; 1E19 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1E1C _ 8B. 00
        mov     dword [esp+18H], ebx                    ; 1E1E _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 1E22 _ 89. 4C 24, 14
        mov     dword [esp+10H], 1                      ; 1E26 _ C7. 44 24, 10, 00000001
        mov     dword [esp+0CH], edx                    ; 1E2E _ 89. 54 24, 0C
        mov     dword [esp+8H], 15                      ; 1E32 _ C7. 44 24, 08, 0000000F
        mov     edx, dword [ebp-10H]                    ; 1E3A _ 8B. 55, F0
        mov     dword [esp+4H], edx                     ; 1E3D _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1E41 _ 89. 04 24
        call    paint_rectangle                         ; 1E44 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 1E49 _ 8B. 45, F4
        lea     ebx, [eax-1H]                           ; 1E4C _ 8D. 58, FF
        mov     eax, dword [ebp-10H]                    ; 1E4F _ 8B. 45, F0
        lea     ecx, [eax-1H]                           ; 1E52 _ 8D. 48, FF
        mov     eax, dword [ebp-10H]                    ; 1E55 _ 8B. 45, F0
        lea     edx, [eax-1H]                           ; 1E58 _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 1E5B _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1E5E _ 8B. 00
        mov     dword [esp+18H], ebx                    ; 1E60 _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 1E64 _ 89. 4C 24, 14
        mov     dword [esp+10H], 0                      ; 1E68 _ C7. 44 24, 10, 00000000
        mov     dword [esp+0CH], edx                    ; 1E70 _ 89. 54 24, 0C
        mov     dword [esp+8H], 0                       ; 1E74 _ C7. 44 24, 08, 00000000
        mov     edx, dword [ebp-10H]                    ; 1E7C _ 8B. 55, F0
        mov     dword [esp+4H], edx                     ; 1E7F _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1E83 _ 89. 04 24
        call    paint_rectangle                         ; 1E86 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 1E8B _ 8B. 45, F4
        lea     ecx, [eax-3H]                           ; 1E8E _ 8D. 48, FD
        mov     eax, dword [ebp-10H]                    ; 1E91 _ 8B. 45, F0
        lea     edx, [eax-3H]                           ; 1E94 _ 8D. 50, FD
        mov     eax, dword [ebp+0CH]                    ; 1E97 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1E9A _ 8B. 00
        mov     dword [esp+18H], ecx                    ; 1E9C _ 89. 4C 24, 18
        mov     dword [esp+14H], edx                    ; 1EA0 _ 89. 54 24, 14
        mov     dword [esp+10H], 2                      ; 1EA4 _ C7. 44 24, 10, 00000002
        mov     dword [esp+0CH], 2                      ; 1EAC _ C7. 44 24, 0C, 00000002
        mov     dword [esp+8H], 8                       ; 1EB4 _ C7. 44 24, 08, 00000008
        mov     edx, dword [ebp-10H]                    ; 1EBC _ 8B. 55, F0
        mov     dword [esp+4H], edx                     ; 1EBF _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1EC3 _ 89. 04 24
        call    paint_rectangle                         ; 1EC6 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 1ECB _ 8B. 45, F0
        lea     edx, [eax-4H]                           ; 1ECE _ 8D. 50, FC
        mov     eax, dword [ebp+0CH]                    ; 1ED1 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1ED4 _ 8B. 00
        mov     dword [esp+18H], 20                     ; 1ED6 _ C7. 44 24, 18, 00000014
        mov     dword [esp+14H], edx                    ; 1EDE _ 89. 54 24, 14
        mov     dword [esp+10H], 3                      ; 1EE2 _ C7. 44 24, 10, 00000003
        mov     dword [esp+0CH], 3                      ; 1EEA _ C7. 44 24, 0C, 00000003
        mov     dword [esp+8H], 12                      ; 1EF2 _ C7. 44 24, 08, 0000000C
        mov     edx, dword [ebp-10H]                    ; 1EFA _ 8B. 55, F0
        mov     dword [esp+4H], edx                     ; 1EFD _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1F01 _ 89. 04 24
        call    paint_rectangle                         ; 1F04 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 1F09 _ 8B. 45, F4
        lea     ebx, [eax-2H]                           ; 1F0C _ 8D. 58, FE
        mov     eax, dword [ebp-10H]                    ; 1F0F _ 8B. 45, F0
        lea     ecx, [eax-2H]                           ; 1F12 _ 8D. 48, FE
        mov     eax, dword [ebp-0CH]                    ; 1F15 _ 8B. 45, F4
        lea     edx, [eax-2H]                           ; 1F18 _ 8D. 50, FE
        mov     eax, dword [ebp+0CH]                    ; 1F1B _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1F1E _ 8B. 00
        mov     dword [esp+18H], ebx                    ; 1F20 _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 1F24 _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 1F28 _ 89. 54 24, 10
        mov     dword [esp+0CH], 1                      ; 1F2C _ C7. 44 24, 0C, 00000001
        mov     dword [esp+8H], 15                      ; 1F34 _ C7. 44 24, 08, 0000000F
        mov     edx, dword [ebp-10H]                    ; 1F3C _ 8B. 55, F0
        mov     dword [esp+4H], edx                     ; 1F3F _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1F43 _ 89. 04 24
        call    paint_rectangle                         ; 1F46 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 1F4B _ 8B. 45, F4
        lea     ebx, [eax-1H]                           ; 1F4E _ 8D. 58, FF
        mov     eax, dword [ebp-10H]                    ; 1F51 _ 8B. 45, F0
        lea     ecx, [eax-1H]                           ; 1F54 _ 8D. 48, FF
        mov     eax, dword [ebp-0CH]                    ; 1F57 _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 1F5A _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 1F5D _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1F60 _ 8B. 00
        mov     dword [esp+18H], ebx                    ; 1F62 _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 1F66 _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 1F6A _ 89. 54 24, 10
        mov     dword [esp+0CH], 0                      ; 1F6E _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 0                       ; 1F76 _ C7. 44 24, 08, 00000000
        mov     edx, dword [ebp-10H]                    ; 1F7E _ 8B. 55, F0
        mov     dword [esp+4H], edx                     ; 1F81 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1F85 _ 89. 04 24
        call    paint_rectangle                         ; 1F88 _ E8, FFFFFFFC(rel)
        mov     dword [esp+14H], 7                      ; 1F8D _ C7. 44 24, 14, 00000007
        mov     eax, dword [ebp+10H]                    ; 1F95 _ 8B. 45, 10
        mov     dword [esp+10H], eax                    ; 1F98 _ 89. 44 24, 10
        mov     dword [esp+0CH], 4                      ; 1F9C _ C7. 44 24, 0C, 00000004
        mov     dword [esp+8H], 24                      ; 1FA4 _ C7. 44 24, 08, 00000018
        mov     eax, dword [ebp+0CH]                    ; 1FAC _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 1FAF _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1FB3 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1FB6 _ 89. 04 24
        call    paint_string                            ; 1FB9 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-14H], 0                      ; 1FBE _ C7. 45, EC, 00000000
        jmp     ?_055                                   ; 1FC5 _ E9, 00000083

?_048:  mov     dword [ebp-18H], 0                      ; 1FCA _ C7. 45, E8, 00000000
        jmp     ?_054                                   ; 1FD1 _ EB, 70

?_049:  mov     eax, dword [ebp-14H]                    ; 1FD3 _ 8B. 45, EC
        shl     eax, 4                                  ; 1FD6 _ C1. E0, 04
        mov     edx, eax                                ; 1FD9 _ 89. C2
        mov     eax, dword [ebp-18H]                    ; 1FDB _ 8B. 45, E8
        add     eax, edx                                ; 1FDE _ 01. D0
        add     eax, closebtn.1768                      ; 1FE0 _ 05, 000001C0(d)
        movzx   eax, byte [eax]                         ; 1FE5 _ 0F B6. 00
        mov     byte [ebp-19H], al                      ; 1FE8 _ 88. 45, E7
        cmp     byte [ebp-19H], 64                      ; 1FEB _ 80. 7D, E7, 40
        jnz     ?_050                                   ; 1FEF _ 75, 06
        mov     byte [ebp-19H], 0                       ; 1FF1 _ C6. 45, E7, 00
        jmp     ?_053                                   ; 1FF5 _ EB, 1C

?_050:  cmp     byte [ebp-19H], 36                      ; 1FF7 _ 80. 7D, E7, 24
        jnz     ?_051                                   ; 1FFB _ 75, 06
        mov     byte [ebp-19H], 15                      ; 1FFD _ C6. 45, E7, 0F
        jmp     ?_053                                   ; 2001 _ EB, 10

?_051:  cmp     byte [ebp-19H], 81                      ; 2003 _ 80. 7D, E7, 51
        jnz     ?_052                                   ; 2007 _ 75, 06
        mov     byte [ebp-19H], 8                       ; 2009 _ C6. 45, E7, 08
        jmp     ?_053                                   ; 200D _ EB, 04

?_052:  mov     byte [ebp-19H], 7                       ; 200F _ C6. 45, E7, 07
?_053:  mov     eax, dword [ebp+0CH]                    ; 2013 _ 8B. 45, 0C
        mov     edx, dword [eax]                        ; 2016 _ 8B. 10
        mov     eax, dword [ebp-14H]                    ; 2018 _ 8B. 45, EC
        lea     ecx, [eax+5H]                           ; 201B _ 8D. 48, 05
        mov     eax, dword [ebp+0CH]                    ; 201E _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 2021 _ 8B. 40, 04
        imul    ecx, eax                                ; 2024 _ 0F AF. C8
        mov     eax, dword [ebp+0CH]                    ; 2027 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 202A _ 8B. 40, 04
        lea     ebx, [eax-15H]                          ; 202D _ 8D. 58, EB
        mov     eax, dword [ebp-18H]                    ; 2030 _ 8B. 45, E8
        add     eax, ebx                                ; 2033 _ 01. D8
        add     eax, ecx                                ; 2035 _ 01. C8
        add     edx, eax                                ; 2037 _ 01. C2
        movzx   eax, byte [ebp-19H]                     ; 2039 _ 0F B6. 45, E7
        mov     byte [edx], al                          ; 203D _ 88. 02
        add     dword [ebp-18H], 1                      ; 203F _ 83. 45, E8, 01
?_054:  cmp     dword [ebp-18H], 15                     ; 2043 _ 83. 7D, E8, 0F
        jle     ?_049                                   ; 2047 _ 7E, 8A
        add     dword [ebp-14H], 1                      ; 2049 _ 83. 45, EC, 01
?_055:  cmp     dword [ebp-14H], 13                     ; 204D _ 83. 7D, EC, 0D
        jle     ?_048                                   ; 2051 _ 0F 8E, FFFFFF73
        add     esp, 68                                 ; 2057 _ 83. C4, 44
        pop     ebx                                     ; 205A _ 5B
        pop     ebp                                     ; 205B _ 5D
        ret                                             ; 205C _ C3
; make_windows End of function

wait_KBC_sendready:; Function begin
        push    ebp                                     ; 205D _ 55
        mov     ebp, esp                                ; 205E _ 89. E5
        sub     esp, 24                                 ; 2060 _ 83. EC, 18
?_056:  mov     dword [esp], 100                        ; 2063 _ C7. 04 24, 00000064
        call    io_in8                                  ; 206A _ E8, FFFFFFFC(rel)
        and     eax, 02H                                ; 206F _ 83. E0, 02
        test    eax, eax                                ; 2072 _ 85. C0
        jnz     ?_057                                   ; 2074 _ 75, 02
        jmp     ?_058                                   ; 2076 _ EB, 02

?_057:  jmp     ?_056                                   ; 2078 _ EB, E9

?_058:  leave                                           ; 207A _ C9
        ret                                             ; 207B _ C3
; wait_KBC_sendready End of function

init_keyboard:; Function begin
        push    ebp                                     ; 207C _ 55
        mov     ebp, esp                                ; 207D _ 89. E5
        sub     esp, 24                                 ; 207F _ 83. EC, 18
        call    wait_KBC_sendready                      ; 2082 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 96                      ; 2087 _ C7. 44 24, 04, 00000060
        mov     dword [esp], 100                        ; 208F _ C7. 04 24, 00000064
        call    io_out8                                 ; 2096 _ E8, FFFFFFFC(rel)
        call    wait_KBC_sendready                      ; 209B _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 71                      ; 20A0 _ C7. 44 24, 04, 00000047
        mov     dword [esp], 96                         ; 20A8 _ C7. 04 24, 00000060
        call    io_out8                                 ; 20AF _ E8, FFFFFFFC(rel)
        leave                                           ; 20B4 _ C9
        ret                                             ; 20B5 _ C3
; init_keyboard End of function

enable_mouse:; Function begin
        push    ebp                                     ; 20B6 _ 55
        mov     ebp, esp                                ; 20B7 _ 89. E5
        sub     esp, 24                                 ; 20B9 _ 83. EC, 18
        call    wait_KBC_sendready                      ; 20BC _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 212                     ; 20C1 _ C7. 44 24, 04, 000000D4
        mov     dword [esp], 100                        ; 20C9 _ C7. 04 24, 00000064
        call    io_out8                                 ; 20D0 _ E8, FFFFFFFC(rel)
        call    wait_KBC_sendready                      ; 20D5 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 244                     ; 20DA _ C7. 44 24, 04, 000000F4
        mov     dword [esp], 96                         ; 20E2 _ C7. 04 24, 00000060
        call    io_out8                                 ; 20E9 _ E8, FFFFFFFC(rel)
        leave                                           ; 20EE _ C9
        ret                                             ; 20EF _ C3
; enable_mouse End of function

mouse_decode:; Function begin
        push    ebp                                     ; 20F0 _ 55
        mov     ebp, esp                                ; 20F1 _ 89. E5
        sub     esp, 4                                  ; 20F3 _ 83. EC, 04
        mov     eax, dword [ebp+0CH]                    ; 20F6 _ 8B. 45, 0C
        mov     byte [ebp-4H], al                       ; 20F9 _ 88. 45, FC
        mov     eax, dword [ebp+8H]                     ; 20FC _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 20FF _ 0F B6. 40, 03
        test    al, al                                  ; 2103 _ 84. C0
        jnz     ?_060                                   ; 2105 _ 75, 17
        cmp     byte [ebp-4H], -6                       ; 2107 _ 80. 7D, FC, FA
        jnz     ?_059                                   ; 210B _ 75, 07
        mov     eax, dword [ebp+8H]                     ; 210D _ 8B. 45, 08
        mov     byte [eax+3H], 1                        ; 2110 _ C6. 40, 03, 01
?_059:  mov     eax, 0                                  ; 2114 _ B8, 00000000
        jmp     ?_067                                   ; 2119 _ E9, 0000010F

?_060:  mov     eax, dword [ebp+8H]                     ; 211E _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 2121 _ 0F B6. 40, 03
        cmp     al, 1                                   ; 2125 _ 3C, 01
        jnz     ?_062                                   ; 2127 _ 75, 28
        movzx   eax, byte [ebp-4H]                      ; 2129 _ 0F B6. 45, FC
        and     eax, 0C8H                               ; 212D _ 25, 000000C8
        cmp     eax, 8                                  ; 2132 _ 83. F8, 08
        jnz     ?_061                                   ; 2135 _ 75, 10
        mov     eax, dword [ebp+8H]                     ; 2137 _ 8B. 45, 08
        movzx   edx, byte [ebp-4H]                      ; 213A _ 0F B6. 55, FC
        mov     byte [eax], dl                          ; 213E _ 88. 10
        mov     eax, dword [ebp+8H]                     ; 2140 _ 8B. 45, 08
        mov     byte [eax+3H], 2                        ; 2143 _ C6. 40, 03, 02
?_061:  mov     eax, 0                                  ; 2147 _ B8, 00000000
        jmp     ?_067                                   ; 214C _ E9, 000000DC

?_062:  mov     eax, dword [ebp+8H]                     ; 2151 _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 2154 _ 0F B6. 40, 03
        cmp     al, 2                                   ; 2158 _ 3C, 02
        jnz     ?_063                                   ; 215A _ 75, 1B
        mov     eax, dword [ebp+8H]                     ; 215C _ 8B. 45, 08
        movzx   edx, byte [ebp-4H]                      ; 215F _ 0F B6. 55, FC
        mov     byte [eax+1H], dl                       ; 2163 _ 88. 50, 01
        mov     eax, dword [ebp+8H]                     ; 2166 _ 8B. 45, 08
        mov     byte [eax+3H], 3                        ; 2169 _ C6. 40, 03, 03
        mov     eax, 0                                  ; 216D _ B8, 00000000
        jmp     ?_067                                   ; 2172 _ E9, 000000B6

?_063:  mov     eax, dword [ebp+8H]                     ; 2177 _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 217A _ 0F B6. 40, 03
        cmp     al, 3                                   ; 217E _ 3C, 03
        jne     ?_066                                   ; 2180 _ 0F 85, 000000A2
        mov     eax, dword [ebp+8H]                     ; 2186 _ 8B. 45, 08
        movzx   edx, byte [ebp-4H]                      ; 2189 _ 0F B6. 55, FC
        mov     byte [eax+2H], dl                       ; 218D _ 88. 50, 02
        mov     eax, dword [ebp+8H]                     ; 2190 _ 8B. 45, 08
        mov     byte [eax+3H], 1                        ; 2193 _ C6. 40, 03, 01
        mov     eax, dword [ebp+8H]                     ; 2197 _ 8B. 45, 08
        movzx   eax, byte [eax]                         ; 219A _ 0F B6. 00
        movzx   eax, al                                 ; 219D _ 0F B6. C0
        and     eax, 07H                                ; 21A0 _ 83. E0, 07
        mov     edx, eax                                ; 21A3 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 21A5 _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 21A8 _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 21AB _ 8B. 45, 08
        movzx   eax, byte [eax+1H]                      ; 21AE _ 0F B6. 40, 01
        movzx   edx, al                                 ; 21B2 _ 0F B6. D0
        mov     eax, dword [ebp+8H]                     ; 21B5 _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 21B8 _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 21BB _ 8B. 45, 08
        movzx   eax, byte [eax+2H]                      ; 21BE _ 0F B6. 40, 02
        movzx   edx, al                                 ; 21C2 _ 0F B6. D0
        mov     eax, dword [ebp+8H]                     ; 21C5 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 21C8 _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 21CB _ 8B. 45, 08
        movzx   eax, byte [eax]                         ; 21CE _ 0F B6. 00
        movzx   eax, al                                 ; 21D1 _ 0F B6. C0
        and     eax, 10H                                ; 21D4 _ 83. E0, 10
        test    eax, eax                                ; 21D7 _ 85. C0
        jz      ?_064                                   ; 21D9 _ 74, 13
        mov     eax, dword [ebp+8H]                     ; 21DB _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 21DE _ 8B. 40, 04
        or      eax, 0FFFFFF00H                         ; 21E1 _ 0D, FFFFFF00
        mov     edx, eax                                ; 21E6 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 21E8 _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 21EB _ 89. 50, 04
?_064:  mov     eax, dword [ebp+8H]                     ; 21EE _ 8B. 45, 08
        movzx   eax, byte [eax]                         ; 21F1 _ 0F B6. 00
        movzx   eax, al                                 ; 21F4 _ 0F B6. C0
        and     eax, 20H                                ; 21F7 _ 83. E0, 20
        test    eax, eax                                ; 21FA _ 85. C0
        jz      ?_065                                   ; 21FC _ 74, 13
        mov     eax, dword [ebp+8H]                     ; 21FE _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 2201 _ 8B. 40, 08
        or      eax, 0FFFFFF00H                         ; 2204 _ 0D, FFFFFF00
        mov     edx, eax                                ; 2209 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 220B _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 220E _ 89. 50, 08
?_065:  mov     eax, dword [ebp+8H]                     ; 2211 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 2214 _ 8B. 40, 08
        neg     eax                                     ; 2217 _ F7. D8
        mov     edx, eax                                ; 2219 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 221B _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 221E _ 89. 50, 08
        mov     eax, 1                                  ; 2221 _ B8, 00000001
        jmp     ?_067                                   ; 2226 _ EB, 05

?_066:  mov     eax, 4294967295                         ; 2228 _ B8, FFFFFFFF
?_067:  leave                                           ; 222D _ C9
        ret                                             ; 222E _ C3
; mouse_decode End of function

intHandlerKeyboard:; Function begin
        push    ebp                                     ; 222F _ 55
        mov     ebp, esp                                ; 2230 _ 89. E5
        sub     esp, 40                                 ; 2232 _ 83. EC, 28
        mov     dword [esp+4H], 32                      ; 2235 _ C7. 44 24, 04, 00000020
        mov     dword [esp], 32                         ; 223D _ C7. 04 24, 00000020
        call    io_out8                                 ; 2244 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 32                      ; 2249 _ C7. 44 24, 04, 00000020
        mov     dword [esp], 160                        ; 2251 _ C7. 04 24, 000000A0
        call    io_out8                                 ; 2258 _ E8, FFFFFFFC(rel)
        mov     dword [esp], 96                         ; 225D _ C7. 04 24, 00000060
        call    io_in8                                  ; 2264 _ E8, FFFFFFFC(rel)
        mov     byte [ebp-9H], al                       ; 2269 _ 88. 45, F7
        movzx   eax, byte [ebp-9H]                      ; 226C _ 0F B6. 45, F7
        mov     dword [esp+4H], eax                     ; 2270 _ 89. 44 24, 04
        mov     dword [esp], keyinfo                    ; 2274 _ C7. 04 24, 00000000(d)
        call    fifo8_put                               ; 227B _ E8, FFFFFFFC(rel)
        leave                                           ; 2280 _ C9
        ret                                             ; 2281 _ C3
; intHandlerKeyboard End of function

intHandlerMouse:; Function begin
        push    ebp                                     ; 2282 _ 55
        mov     ebp, esp                                ; 2283 _ 89. E5
        sub     esp, 40                                 ; 2285 _ 83. EC, 28
        mov     dword [esp+4H], 32                      ; 2288 _ C7. 44 24, 04, 00000020
        mov     dword [esp], 32                         ; 2290 _ C7. 04 24, 00000020
        call    io_out8                                 ; 2297 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 32                      ; 229C _ C7. 44 24, 04, 00000020
        mov     dword [esp], 160                        ; 22A4 _ C7. 04 24, 000000A0
        call    io_out8                                 ; 22AB _ E8, FFFFFFFC(rel)
        mov     dword [esp], 96                         ; 22B0 _ C7. 04 24, 00000060
        call    io_in8                                  ; 22B7 _ E8, FFFFFFFC(rel)
        mov     byte [ebp-9H], al                       ; 22BC _ 88. 45, F7
        movzx   eax, byte [ebp-9H]                      ; 22BF _ 0F B6. 45, F7
        mov     dword [esp+4H], eax                     ; 22C3 _ 89. 44 24, 04
        mov     dword [esp], mouseinfo                  ; 22C7 _ C7. 04 24, 00000000(d)
        call    fifo8_put                               ; 22CE _ E8, FFFFFFFC(rel)
        leave                                           ; 22D3 _ C9
        ret                                             ; 22D4 _ C3
; intHandlerMouse End of function

fifo8_init:; Function begin
        push    ebp                                     ; 22D5 _ 55
        mov     ebp, esp                                ; 22D6 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 22D8 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 22DB _ 8B. 55, 10
        mov     dword [eax], edx                        ; 22DE _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 22E0 _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 22E3 _ C7. 40, 04, 00000000
        mov     eax, dword [ebp+8H]                     ; 22EA _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 22ED _ C7. 40, 08, 00000000
        mov     eax, dword [ebp+8H]                     ; 22F4 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 22F7 _ 8B. 55, 0C
        mov     dword [eax+0CH], edx                    ; 22FA _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 22FD _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 2300 _ 8B. 55, 0C
        mov     dword [eax+10H], edx                    ; 2303 _ 89. 50, 10
        mov     eax, dword [ebp+8H]                     ; 2306 _ 8B. 45, 08
        mov     dword [eax+14H], 0                      ; 2309 _ C7. 40, 14, 00000000
        pop     ebp                                     ; 2310 _ 5D
        ret                                             ; 2311 _ C3
; fifo8_init End of function

fifo8_put:; Function begin
        push    ebp                                     ; 2312 _ 55
        mov     ebp, esp                                ; 2313 _ 89. E5
        sub     esp, 20                                 ; 2315 _ 83. EC, 14
        mov     eax, dword [ebp+0CH]                    ; 2318 _ 8B. 45, 0C
        mov     byte [ebp-14H], al                      ; 231B _ 88. 45, EC
        mov     eax, dword [ebp+8H]                     ; 231E _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 2321 _ 8B. 40, 10
        test    eax, eax                                ; 2324 _ 85. C0
        jnz     ?_068                                   ; 2326 _ 75, 18
        mov     eax, dword [ebp+8H]                     ; 2328 _ 8B. 45, 08
        mov     eax, dword [eax+14H]                    ; 232B _ 8B. 40, 14
        or      eax, 01H                                ; 232E _ 83. C8, 01
        mov     edx, eax                                ; 2331 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 2333 _ 8B. 45, 08
        mov     dword [eax+14H], edx                    ; 2336 _ 89. 50, 14
        mov     eax, 4294967295                         ; 2339 _ B8, FFFFFFFF
        jmp     ?_070                                   ; 233E _ EB, 56

?_068:  mov     eax, dword [ebp+8H]                     ; 2340 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 2343 _ 8B. 40, 04
        mov     dword [ebp-4H], eax                     ; 2346 _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 2349 _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 234C _ 8B. 10
        mov     eax, dword [ebp-4H]                     ; 234E _ 8B. 45, FC
        add     edx, eax                                ; 2351 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 2353 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 2357 _ 88. 02
        mov     eax, dword [ebp+8H]                     ; 2359 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 235C _ 8B. 40, 04
        lea     edx, [eax+1H]                           ; 235F _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 2362 _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 2365 _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 2368 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 236B _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 236E _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 2371 _ 8B. 40, 0C
        cmp     edx, eax                                ; 2374 _ 39. C2
        jnz     ?_069                                   ; 2376 _ 75, 0A
        mov     eax, dword [ebp+8H]                     ; 2378 _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 237B _ C7. 40, 04, 00000000
?_069:  mov     eax, dword [ebp+8H]                     ; 2382 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 2385 _ 8B. 40, 10
        lea     edx, [eax-1H]                           ; 2388 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 238B _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 238E _ 89. 50, 10
        mov     eax, 0                                  ; 2391 _ B8, 00000000
?_070:  leave                                           ; 2396 _ C9
        ret                                             ; 2397 _ C3
; fifo8_put End of function

fifo8_get:; Function begin
        push    ebp                                     ; 2398 _ 55
        mov     ebp, esp                                ; 2399 _ 89. E5
        sub     esp, 16                                 ; 239B _ 83. EC, 10
        mov     eax, dword [ebp+8H]                     ; 239E _ 8B. 45, 08
        mov     edx, dword [eax+10H]                    ; 23A1 _ 8B. 50, 10
        mov     eax, dword [ebp+8H]                     ; 23A4 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 23A7 _ 8B. 40, 0C
        cmp     edx, eax                                ; 23AA _ 39. C2
        jnz     ?_071                                   ; 23AC _ 75, 11
        mov     eax, dword [ebp+8H]                     ; 23AE _ 8B. 45, 08
        mov     dword [eax+14H], 0                      ; 23B1 _ C7. 40, 14, 00000000
        mov     eax, 4294967295                         ; 23B8 _ B8, FFFFFFFF
        jmp     ?_073                                   ; 23BD _ EB, 57

?_071:  mov     eax, dword [ebp+8H]                     ; 23BF _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 23C2 _ 8B. 40, 08
        mov     dword [ebp-8H], eax                     ; 23C5 _ 89. 45, F8
        mov     eax, dword [ebp+8H]                     ; 23C8 _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 23CB _ 8B. 10
        mov     eax, dword [ebp-8H]                     ; 23CD _ 8B. 45, F8
        add     eax, edx                                ; 23D0 _ 01. D0
        movzx   eax, byte [eax]                         ; 23D2 _ 0F B6. 00
        movzx   eax, al                                 ; 23D5 _ 0F B6. C0
        mov     dword [ebp-4H], eax                     ; 23D8 _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 23DB _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 23DE _ 8B. 40, 08
        lea     edx, [eax+1H]                           ; 23E1 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 23E4 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 23E7 _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 23EA _ 8B. 45, 08
        mov     edx, dword [eax+8H]                     ; 23ED _ 8B. 50, 08
        mov     eax, dword [ebp+8H]                     ; 23F0 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 23F3 _ 8B. 40, 0C
        cmp     edx, eax                                ; 23F6 _ 39. C2
        jnz     ?_072                                   ; 23F8 _ 75, 0A
        mov     eax, dword [ebp+8H]                     ; 23FA _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 23FD _ C7. 40, 08, 00000000
?_072:  mov     eax, dword [ebp+8H]                     ; 2404 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 2407 _ 8B. 40, 10
        lea     edx, [eax+1H]                           ; 240A _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 240D _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 2410 _ 89. 50, 10
        mov     eax, dword [ebp-4H]                     ; 2413 _ 8B. 45, FC
?_073:  leave                                           ; 2416 _ C9
        ret                                             ; 2417 _ C3
; fifo8_get End of function

fifo8_status:; Function begin
        push    ebp                                     ; 2418 _ 55
        mov     ebp, esp                                ; 2419 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 241B _ 8B. 45, 08
        mov     edx, dword [eax+0CH]                    ; 241E _ 8B. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 2421 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 2424 _ 8B. 40, 10
        sub     edx, eax                                ; 2427 _ 29. C2
        mov     eax, edx                                ; 2429 _ 89. D0
        pop     ebp                                     ; 242B _ 5D
        ret                                             ; 242C _ C3
; fifo8_status End of function

charToHexVal:; Function begin
        push    ebp                                     ; 242D _ 55
        mov     ebp, esp                                ; 242E _ 89. E5
        sub     esp, 4                                  ; 2430 _ 83. EC, 04
        mov     eax, dword [ebp+8H]                     ; 2433 _ 8B. 45, 08
        mov     byte [ebp-4H], al                       ; 2436 _ 88. 45, FC
        cmp     byte [ebp-4H], 9                        ; 2439 _ 80. 7D, FC, 09
        jle     ?_074                                   ; 243D _ 7E, 09
        movzx   eax, byte [ebp-4H]                      ; 243F _ 0F B6. 45, FC
        add     eax, 55                                 ; 2443 _ 83. C0, 37
        jmp     ?_075                                   ; 2446 _ EB, 07

?_074:  movzx   eax, byte [ebp-4H]                      ; 2448 _ 0F B6. 45, FC
        add     eax, 48                                 ; 244C _ 83. C0, 30
?_075:  leave                                           ; 244F _ C9
        ret                                             ; 2450 _ C3
; charToHexVal End of function

charToHexStr:; Function begin
        push    ebp                                     ; 2451 _ 55
        mov     ebp, esp                                ; 2452 _ 89. E5
        sub     esp, 24                                 ; 2454 _ 83. EC, 18
        mov     eax, dword [ebp+8H]                     ; 2457 _ 8B. 45, 08
        mov     byte [ebp-14H], al                      ; 245A _ 88. 45, EC
        mov     dword [ebp-4H], 0                       ; 245D _ C7. 45, FC, 00000000
        movzx   eax, byte [ebp-14H]                     ; 2464 _ 0F B6. 45, EC
        and     eax, 0FH                                ; 2468 _ 83. E0, 0F
        mov     byte [ebp-5H], al                       ; 246B _ 88. 45, FB
        movsx   eax, byte [ebp-5H]                      ; 246E _ 0F BE. 45, FB
        mov     dword [esp], eax                        ; 2472 _ 89. 04 24
        call    charToHexVal                            ; 2475 _ E8, FFFFFFFC(rel)
        mov     byte [?_174], al                        ; 247A _ A2, 000002A3(d)
        movzx   eax, byte [ebp-14H]                     ; 247F _ 0F B6. 45, EC
        shr     al, 4                                   ; 2483 _ C0. E8, 04
        mov     byte [ebp-14H], al                      ; 2486 _ 88. 45, EC
        movzx   eax, byte [ebp-14H]                     ; 2489 _ 0F B6. 45, EC
        movsx   eax, al                                 ; 248D _ 0F BE. C0
        mov     dword [esp], eax                        ; 2490 _ 89. 04 24
        call    charToHexVal                            ; 2493 _ E8, FFFFFFFC(rel)
        mov     byte [?_173], al                        ; 2498 _ A2, 000002A2(d)
        mov     eax, keyval                             ; 249D _ B8, 000002A0(d)
        leave                                           ; 24A2 _ C9
        ret                                             ; 24A3 _ C3
; charToHexStr End of function

intToHexStr:; Function begin
        push    ebp                                     ; 24A4 _ 55
        mov     ebp, esp                                ; 24A5 _ 89. E5
        sub     esp, 16                                 ; 24A7 _ 83. EC, 10
        mov     byte [str.1386], 48                     ; 24AA _ C6. 05, 000003A0(d), 30
        mov     byte [?_206], 88                        ; 24B1 _ C6. 05, 000003A1(d), 58
        mov     byte [?_207], 0                         ; 24B8 _ C6. 05, 000003AA(d), 00
        mov     dword [ebp-0CH], 2                      ; 24BF _ C7. 45, F4, 00000002
        jmp     ?_077                                   ; 24C6 _ EB, 0F

?_076:  mov     eax, dword [ebp-0CH]                    ; 24C8 _ 8B. 45, F4
        add     eax, str.1386                           ; 24CB _ 05, 000003A0(d)
        mov     byte [eax], 48                          ; 24D0 _ C6. 00, 30
        add     dword [ebp-0CH], 1                      ; 24D3 _ 83. 45, F4, 01
?_077:  cmp     dword [ebp-0CH], 9                      ; 24D7 _ 83. 7D, F4, 09
        jle     ?_076                                   ; 24DB _ 7E, EB
        mov     dword [ebp-8H], 9                       ; 24DD _ C7. 45, F8, 00000009
        jmp     ?_081                                   ; 24E4 _ EB, 40

?_078:  mov     eax, dword [ebp+8H]                     ; 24E6 _ 8B. 45, 08
        and     eax, 0FH                                ; 24E9 _ 83. E0, 0F
        mov     dword [ebp-4H], eax                     ; 24EC _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 24EF _ 8B. 45, 08
        shr     eax, 4                                  ; 24F2 _ C1. E8, 04
        mov     dword [ebp+8H], eax                     ; 24F5 _ 89. 45, 08
        cmp     dword [ebp-4H], 9                       ; 24F8 _ 83. 7D, FC, 09
        jle     ?_079                                   ; 24FC _ 7E, 13
        mov     eax, dword [ebp-4H]                     ; 24FE _ 8B. 45, FC
        add     eax, 55                                 ; 2501 _ 83. C0, 37
        mov     edx, dword [ebp-8H]                     ; 2504 _ 8B. 55, F8
        add     edx, str.1386                           ; 2507 _ 81. C2, 000003A0(d)
        mov     byte [edx], al                          ; 250D _ 88. 02
        jmp     ?_080                                   ; 250F _ EB, 11

?_079:  mov     eax, dword [ebp-4H]                     ; 2511 _ 8B. 45, FC
        add     eax, 48                                 ; 2514 _ 83. C0, 30
        mov     edx, dword [ebp-8H]                     ; 2517 _ 8B. 55, F8
        add     edx, str.1386                           ; 251A _ 81. C2, 000003A0(d)
        mov     byte [edx], al                          ; 2520 _ 88. 02
?_080:  sub     dword [ebp-8H], 1                       ; 2522 _ 83. 6D, F8, 01
?_081:  cmp     dword [ebp-8H], 1                       ; 2526 _ 83. 7D, F8, 01
        jle     ?_082                                   ; 252A _ 7E, 06
        cmp     dword [ebp+8H], 0                       ; 252C _ 83. 7D, 08, 00
        jnz     ?_078                                   ; 2530 _ 75, B4
?_082:  mov     eax, str.1386                           ; 2532 _ B8, 000003A0(d)
        leave                                           ; 2537 _ C9
        ret                                             ; 2538 _ C3
; intToHexStr End of function

memman_init:; Function begin
        push    ebp                                     ; 2539 _ 55
        mov     ebp, esp                                ; 253A _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 253C _ 8B. 45, 08
        mov     dword [eax], 0                          ; 253F _ C7. 00, 00000000
        mov     eax, dword [ebp+8H]                     ; 2545 _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 2548 _ C7. 40, 04, 00000000
        mov     eax, dword [ebp+8H]                     ; 254F _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 2552 _ C7. 40, 08, 00000000
        mov     eax, dword [ebp+8H]                     ; 2559 _ 8B. 45, 08
        mov     dword [eax+0CH], 0                      ; 255C _ C7. 40, 0C, 00000000
        pop     ebp                                     ; 2563 _ 5D
        ret                                             ; 2564 _ C3
; memman_init End of function

memman_total:; Function begin
        push    ebp                                     ; 2565 _ 55
        mov     ebp, esp                                ; 2566 _ 89. E5
        sub     esp, 16                                 ; 2568 _ 83. EC, 10
        mov     dword [ebp-4H], 0                       ; 256B _ C7. 45, FC, 00000000
        mov     dword [ebp-8H], 0                       ; 2572 _ C7. 45, F8, 00000000
        jmp     ?_084                                   ; 2579 _ EB, 14

?_083:  mov     eax, dword [ebp+8H]                     ; 257B _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 257E _ 8B. 55, F8
        add     edx, 2                                  ; 2581 _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 2584 _ 8B. 44 D0, 04
        add     dword [ebp-4H], eax                     ; 2588 _ 01. 45, FC
        add     dword [ebp-8H], 1                       ; 258B _ 83. 45, F8, 01
?_084:  mov     eax, dword [ebp+8H]                     ; 258F _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 2592 _ 8B. 00
        cmp     eax, dword [ebp-8H]                     ; 2594 _ 3B. 45, F8
        ja      ?_083                                   ; 2597 _ 77, E2
        mov     eax, dword [ebp-4H]                     ; 2599 _ 8B. 45, FC
        leave                                           ; 259C _ C9
        ret                                             ; 259D _ C3
; memman_total End of function

memman_alloc:; Function begin
        push    ebp                                     ; 259E _ 55
        mov     ebp, esp                                ; 259F _ 89. E5
        sub     esp, 16                                 ; 25A1 _ 83. EC, 10
        mov     dword [ebp-8H], 0                       ; 25A4 _ C7. 45, F8, 00000000
        jmp     ?_088                                   ; 25AB _ E9, 00000085

?_085:  mov     eax, dword [ebp+8H]                     ; 25B0 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 25B3 _ 8B. 55, F8
        add     edx, 2                                  ; 25B6 _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 25B9 _ 8B. 44 D0, 04
        cmp     eax, dword [ebp+0CH]                    ; 25BD _ 3B. 45, 0C
        jc      ?_087                                   ; 25C0 _ 72, 6F
        mov     eax, dword [ebp+8H]                     ; 25C2 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 25C5 _ 8B. 55, F8
        add     edx, 2                                  ; 25C8 _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 25CB _ 8B. 04 D0
        mov     dword [ebp-4H], eax                     ; 25CE _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 25D1 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 25D4 _ 8B. 55, F8
        add     edx, 2                                  ; 25D7 _ 83. C2, 02
        mov     edx, dword [eax+edx*8]                  ; 25DA _ 8B. 14 D0
        mov     eax, dword [ebp+0CH]                    ; 25DD _ 8B. 45, 0C
        lea     ecx, [edx+eax]                          ; 25E0 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 25E3 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 25E6 _ 8B. 55, F8
        add     edx, 2                                  ; 25E9 _ 83. C2, 02
        mov     dword [eax+edx*8], ecx                  ; 25EC _ 89. 0C D0
        mov     eax, dword [ebp+8H]                     ; 25EF _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 25F2 _ 8B. 55, F8
        add     edx, 2                                  ; 25F5 _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 25F8 _ 8B. 44 D0, 04
        sub     eax, dword [ebp+0CH]                    ; 25FC _ 2B. 45, 0C
        mov     edx, eax                                ; 25FF _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 2601 _ 8B. 45, 08
        mov     ecx, dword [ebp-8H]                     ; 2604 _ 8B. 4D, F8
        add     ecx, 2                                  ; 2607 _ 83. C1, 02
        mov     dword [eax+ecx*8+4H], edx               ; 260A _ 89. 54 C8, 04
        mov     eax, dword [ebp+8H]                     ; 260E _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 2611 _ 8B. 55, F8
        add     edx, 2                                  ; 2614 _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 2617 _ 8B. 44 D0, 04
        test    eax, eax                                ; 261B _ 85. C0
        jnz     ?_086                                   ; 261D _ 75, 0D
        mov     eax, dword [ebp+8H]                     ; 261F _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 2622 _ 8B. 00
        lea     edx, [eax-1H]                           ; 2624 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 2627 _ 8B. 45, 08
        mov     dword [eax], edx                        ; 262A _ 89. 10
?_086:  mov     eax, dword [ebp-4H]                     ; 262C _ 8B. 45, FC
        jmp     ?_089                                   ; 262F _ EB, 17

?_087:  add     dword [ebp-8H], 1                       ; 2631 _ 83. 45, F8, 01
?_088:  mov     eax, dword [ebp+8H]                     ; 2635 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 2638 _ 8B. 00
        cmp     eax, dword [ebp-8H]                     ; 263A _ 3B. 45, F8
        ja      ?_085                                   ; 263D _ 0F 87, FFFFFF6D
        mov     eax, 0                                  ; 2643 _ B8, 00000000
?_089:  leave                                           ; 2648 _ C9
        ret                                             ; 2649 _ C3
; memman_alloc End of function

memman_free:; Function begin
        push    ebp                                     ; 264A _ 55
        mov     ebp, esp                                ; 264B _ 89. E5
        push    ebx                                     ; 264D _ 53
        sub     esp, 16                                 ; 264E _ 83. EC, 10
        mov     dword [ebp-0CH], 0                      ; 2651 _ C7. 45, F4, 00000000
        jmp     ?_092                                   ; 2658 _ EB, 17

?_090:  mov     eax, dword [ebp+8H]                     ; 265A _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 265D _ 8B. 55, F4
        add     edx, 2                                  ; 2660 _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 2663 _ 8B. 04 D0
        cmp     eax, dword [ebp+0CH]                    ; 2666 _ 3B. 45, 0C
        jbe     ?_091                                   ; 2669 _ 76, 02
        jmp     ?_093                                   ; 266B _ EB, 0E

?_091:  add     dword [ebp-0CH], 1                      ; 266D _ 83. 45, F4, 01
?_092:  mov     eax, dword [ebp+8H]                     ; 2671 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 2674 _ 8B. 00
        cmp     eax, dword [ebp-0CH]                    ; 2676 _ 3B. 45, F4
        jg      ?_090                                   ; 2679 _ 7F, DF
?_093:  cmp     dword [ebp-0CH], 0                      ; 267B _ 83. 7D, F4, 00
        jle     ?_095                                   ; 267F _ 0F 8E, 000000BA
        mov     eax, dword [ebp-0CH]                    ; 2685 _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 2688 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 268B _ 8B. 45, 08
        add     edx, 2                                  ; 268E _ 83. C2, 02
        mov     edx, dword [eax+edx*8]                  ; 2691 _ 8B. 14 D0
        mov     eax, dword [ebp-0CH]                    ; 2694 _ 8B. 45, F4
        lea     ecx, [eax-1H]                           ; 2697 _ 8D. 48, FF
        mov     eax, dword [ebp+8H]                     ; 269A _ 8B. 45, 08
        add     ecx, 2                                  ; 269D _ 83. C1, 02
        mov     eax, dword [eax+ecx*8+4H]               ; 26A0 _ 8B. 44 C8, 04
        add     eax, edx                                ; 26A4 _ 01. D0
        cmp     eax, dword [ebp+0CH]                    ; 26A6 _ 3B. 45, 0C
        jne     ?_095                                   ; 26A9 _ 0F 85, 00000090
        mov     eax, dword [ebp-0CH]                    ; 26AF _ 8B. 45, F4
        lea     ebx, [eax-1H]                           ; 26B2 _ 8D. 58, FF
        mov     eax, dword [ebp-0CH]                    ; 26B5 _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 26B8 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 26BB _ 8B. 45, 08
        add     edx, 2                                  ; 26BE _ 83. C2, 02
        mov     edx, dword [eax+edx*8+4H]               ; 26C1 _ 8B. 54 D0, 04
        mov     eax, dword [ebp+10H]                    ; 26C5 _ 8B. 45, 10
        lea     ecx, [edx+eax]                          ; 26C8 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 26CB _ 8B. 45, 08
        lea     edx, [ebx+2H]                           ; 26CE _ 8D. 53, 02
        mov     dword [eax+edx*8+4H], ecx               ; 26D1 _ 89. 4C D0, 04
        mov     eax, dword [ebp+8H]                     ; 26D5 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 26D8 _ 8B. 00
        cmp     eax, dword [ebp-0CH]                    ; 26DA _ 3B. 45, F4
        jle     ?_094                                   ; 26DD _ 7E, 56
        mov     eax, dword [ebp+10H]                    ; 26DF _ 8B. 45, 10
        mov     edx, dword [ebp+0CH]                    ; 26E2 _ 8B. 55, 0C
        lea     ecx, [edx+eax]                          ; 26E5 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 26E8 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 26EB _ 8B. 55, F4
        add     edx, 2                                  ; 26EE _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 26F1 _ 8B. 04 D0
        cmp     ecx, eax                                ; 26F4 _ 39. C1
        jnz     ?_094                                   ; 26F6 _ 75, 3D
        mov     eax, dword [ebp-0CH]                    ; 26F8 _ 8B. 45, F4
        lea     ebx, [eax-1H]                           ; 26FB _ 8D. 58, FF
        mov     eax, dword [ebp-0CH]                    ; 26FE _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 2701 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 2704 _ 8B. 45, 08
        add     edx, 2                                  ; 2707 _ 83. C2, 02
        mov     edx, dword [eax+edx*8+4H]               ; 270A _ 8B. 54 D0, 04
        mov     eax, dword [ebp+8H]                     ; 270E _ 8B. 45, 08
        mov     ecx, dword [ebp-0CH]                    ; 2711 _ 8B. 4D, F4
        add     ecx, 2                                  ; 2714 _ 83. C1, 02
        mov     eax, dword [eax+ecx*8+4H]               ; 2717 _ 8B. 44 C8, 04
        lea     ecx, [edx+eax]                          ; 271B _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 271E _ 8B. 45, 08
        lea     edx, [ebx+2H]                           ; 2721 _ 8D. 53, 02
        mov     dword [eax+edx*8+4H], ecx               ; 2724 _ 89. 4C D0, 04
        mov     eax, dword [ebp+8H]                     ; 2728 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 272B _ 8B. 00
        lea     edx, [eax-1H]                           ; 272D _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 2730 _ 8B. 45, 08
        mov     dword [eax], edx                        ; 2733 _ 89. 10
?_094:  mov     eax, 0                                  ; 2735 _ B8, 00000000
        jmp     ?_101                                   ; 273A _ E9, 0000011C

?_095:  mov     eax, dword [ebp+8H]                     ; 273F _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 2742 _ 8B. 00
        cmp     eax, dword [ebp-0CH]                    ; 2744 _ 3B. 45, F4
        jle     ?_096                                   ; 2747 _ 7E, 52
        mov     eax, dword [ebp+10H]                    ; 2749 _ 8B. 45, 10
        mov     edx, dword [ebp+0CH]                    ; 274C _ 8B. 55, 0C
        lea     ecx, [edx+eax]                          ; 274F _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 2752 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 2755 _ 8B. 55, F4
        add     edx, 2                                  ; 2758 _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 275B _ 8B. 04 D0
        cmp     ecx, eax                                ; 275E _ 39. C1
        jnz     ?_096                                   ; 2760 _ 75, 39
        mov     eax, dword [ebp+8H]                     ; 2762 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 2765 _ 8B. 55, F4
        lea     ecx, [edx+2H]                           ; 2768 _ 8D. 4A, 02
        mov     edx, dword [ebp+0CH]                    ; 276B _ 8B. 55, 0C
        mov     dword [eax+ecx*8], edx                  ; 276E _ 89. 14 C8
        mov     eax, dword [ebp+8H]                     ; 2771 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 2774 _ 8B. 55, F4
        add     edx, 2                                  ; 2777 _ 83. C2, 02
        mov     edx, dword [eax+edx*8+4H]               ; 277A _ 8B. 54 D0, 04
        mov     eax, dword [ebp+10H]                    ; 277E _ 8B. 45, 10
        lea     ecx, [edx+eax]                          ; 2781 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 2784 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 2787 _ 8B. 55, F4
        add     edx, 2                                  ; 278A _ 83. C2, 02
        mov     dword [eax+edx*8+4H], ecx               ; 278D _ 89. 4C D0, 04
        mov     eax, 0                                  ; 2791 _ B8, 00000000
        jmp     ?_101                                   ; 2796 _ E9, 000000C0

?_096:  mov     eax, dword [ebp+8H]                     ; 279B _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 279E _ 8B. 00
        cmp     eax, 4095                               ; 27A0 _ 3D, 00000FFF
        jg      ?_100                                   ; 27A5 _ 0F 8F, 00000087
        mov     eax, dword [ebp+8H]                     ; 27AB _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 27AE _ 8B. 00
        mov     dword [ebp-8H], eax                     ; 27B0 _ 89. 45, F8
        jmp     ?_098                                   ; 27B3 _ EB, 28

?_097:  mov     eax, dword [ebp-8H]                     ; 27B5 _ 8B. 45, F8
        lea     edx, [eax-1H]                           ; 27B8 _ 8D. 50, FF
        mov     ecx, dword [ebp+8H]                     ; 27BB _ 8B. 4D, 08
        mov     eax, dword [ebp-8H]                     ; 27BE _ 8B. 45, F8
        lea     ebx, [eax+2H]                           ; 27C1 _ 8D. 58, 02
        mov     eax, dword [ebp+8H]                     ; 27C4 _ 8B. 45, 08
        add     edx, 2                                  ; 27C7 _ 83. C2, 02
        lea     edx, [eax+edx*8]                        ; 27CA _ 8D. 14 D0
        mov     eax, dword [edx]                        ; 27CD _ 8B. 02
        mov     edx, dword [edx+4H]                     ; 27CF _ 8B. 52, 04
        mov     dword [ecx+ebx*8], eax                  ; 27D2 _ 89. 04 D9
        mov     dword [ecx+ebx*8+4H], edx               ; 27D5 _ 89. 54 D9, 04
        sub     dword [ebp-8H], 1                       ; 27D9 _ 83. 6D, F8, 01
?_098:  mov     eax, dword [ebp-8H]                     ; 27DD _ 8B. 45, F8
        cmp     eax, dword [ebp-0CH]                    ; 27E0 _ 3B. 45, F4
        jg      ?_097                                   ; 27E3 _ 7F, D0
        mov     eax, dword [ebp+8H]                     ; 27E5 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 27E8 _ 8B. 00
        lea     edx, [eax+1H]                           ; 27EA _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 27ED _ 8B. 45, 08
        mov     dword [eax], edx                        ; 27F0 _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 27F2 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 27F5 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 27F8 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 27FB _ 8B. 00
        cmp     edx, eax                                ; 27FD _ 39. C2
        jge     ?_099                                   ; 27FF _ 7D, 0B
        mov     eax, dword [ebp+8H]                     ; 2801 _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 2804 _ 8B. 10
        mov     eax, dword [ebp+8H]                     ; 2806 _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 2809 _ 89. 50, 04
?_099:  mov     eax, dword [ebp+8H]                     ; 280C _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 280F _ 8B. 55, F4
        lea     ecx, [edx+2H]                           ; 2812 _ 8D. 4A, 02
        mov     edx, dword [ebp+0CH]                    ; 2815 _ 8B. 55, 0C
        mov     dword [eax+ecx*8], edx                  ; 2818 _ 89. 14 C8
        mov     eax, dword [ebp+8H]                     ; 281B _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 281E _ 8B. 55, F4
        lea     ecx, [edx+2H]                           ; 2821 _ 8D. 4A, 02
        mov     edx, dword [ebp+10H]                    ; 2824 _ 8B. 55, 10
        mov     dword [eax+ecx*8+4H], edx               ; 2827 _ 89. 54 C8, 04
        mov     eax, 0                                  ; 282B _ B8, 00000000
        jmp     ?_101                                   ; 2830 _ EB, 29

?_100:  mov     eax, dword [ebp+8H]                     ; 2832 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 2835 _ 8B. 40, 0C
        lea     edx, [eax+1H]                           ; 2838 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 283B _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 283E _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 2841 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 2844 _ 8B. 40, 08
        mov     edx, eax                                ; 2847 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 2849 _ 8B. 45, 10
        add     eax, edx                                ; 284C _ 01. D0
        mov     edx, eax                                ; 284E _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 2850 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 2853 _ 89. 50, 08
        mov     eax, 4294967295                         ; 2856 _ B8, FFFFFFFF
?_101:  add     esp, 16                                 ; 285B _ 83. C4, 10
        pop     ebx                                     ; 285E _ 5B
        pop     ebp                                     ; 285F _ 5D
        ret                                             ; 2860 _ C3
; memman_free End of function

memman_alloc_4k:; Function begin
        push    ebp                                     ; 2861 _ 55
        mov     ebp, esp                                ; 2862 _ 89. E5
        sub     esp, 24                                 ; 2864 _ 83. EC, 18
        mov     eax, dword [ebp+0CH]                    ; 2867 _ 8B. 45, 0C
        add     eax, 4095                               ; 286A _ 05, 00000FFF
        and     eax, 0FFFFF000H                         ; 286F _ 25, FFFFF000
        mov     dword [ebp+0CH], eax                    ; 2874 _ 89. 45, 0C
        mov     eax, dword [ebp+0CH]                    ; 2877 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 287A _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 287E _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2881 _ 89. 04 24
        call    memman_alloc                            ; 2884 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-4H], eax                     ; 2889 _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 288C _ 8B. 45, FC
        leave                                           ; 288F _ C9
        ret                                             ; 2890 _ C3
; memman_alloc_4k End of function

memman_free_4k:; Function begin
        push    ebp                                     ; 2891 _ 55
        mov     ebp, esp                                ; 2892 _ 89. E5
        sub     esp, 28                                 ; 2894 _ 83. EC, 1C
        mov     eax, dword [ebp+10H]                    ; 2897 _ 8B. 45, 10
        add     eax, 4095                               ; 289A _ 05, 00000FFF
        and     eax, 0FFFFF000H                         ; 289F _ 25, FFFFF000
        mov     dword [ebp+10H], eax                    ; 28A4 _ 89. 45, 10
        mov     eax, dword [ebp+10H]                    ; 28A7 _ 8B. 45, 10
        mov     dword [esp+8H], eax                     ; 28AA _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 28AE _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 28B1 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 28B5 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 28B8 _ 89. 04 24
        call    memman_free                             ; 28BB _ E8, FFFFFFFC(rel)
        mov     dword [ebp-4H], eax                     ; 28C0 _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 28C3 _ 8B. 45, FC
        leave                                           ; 28C6 _ C9
        ret                                             ; 28C7 _ C3
; memman_free_4k End of function

sheet_control_init:; Function begin
        push    ebp                                     ; 28C8 _ 55
        mov     ebp, esp                                ; 28C9 _ 89. E5
        sub     esp, 40                                 ; 28CB _ 83. EC, 28
        mov     dword [esp+4H], 9236                    ; 28CE _ C7. 44 24, 04, 00002414
        mov     eax, dword [ebp+8H]                     ; 28D6 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 28D9 _ 89. 04 24
        call    memman_alloc_4k                         ; 28DC _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 28E1 _ 89. 45, F4
        cmp     dword [ebp-0CH], 0                      ; 28E4 _ 83. 7D, F4, 00
        jnz     ?_102                                   ; 28E8 _ 75, 24
        mov     eax, dword [ebp-0CH]                    ; 28EA _ 8B. 45, F4
        mov     dword [esp+8H], 9236                    ; 28ED _ C7. 44 24, 08, 00002414
        mov     dword [esp+4H], eax                     ; 28F5 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 28F9 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 28FC _ 89. 04 24
        call    memman_free_4k                          ; 28FF _ E8, FFFFFFFC(rel)
        mov     eax, 0                                  ; 2904 _ B8, 00000000
        jmp     ?_106                                   ; 2909 _ E9, 0000009D

?_102:  mov     eax, dword [ebp-0CH]                    ; 290E _ 8B. 45, F4
        mov     edx, dword [ebp+0CH]                    ; 2911 _ 8B. 55, 0C
        mov     dword [eax], edx                        ; 2914 _ 89. 10
        mov     eax, dword [ebp-0CH]                    ; 2916 _ 8B. 45, F4
        mov     edx, dword [ebp+10H]                    ; 2919 _ 8B. 55, 10
        mov     dword [eax+4H], edx                     ; 291C _ 89. 50, 04
        mov     eax, dword [ebp-0CH]                    ; 291F _ 8B. 45, F4
        mov     edx, dword [ebp+14H]                    ; 2922 _ 8B. 55, 14
        mov     dword [eax+8H], edx                     ; 2925 _ 89. 50, 08
        mov     eax, dword [ebp-0CH]                    ; 2928 _ 8B. 45, F4
        mov     dword [eax+0CH], -1                     ; 292B _ C7. 40, 0C, FFFFFFFF
        mov     dword [ebp-10H], 0                      ; 2932 _ C7. 45, F0, 00000000
        jmp     ?_104                                   ; 2939 _ EB, 1B

?_103:  mov     eax, dword [ebp-0CH]                    ; 293B _ 8B. 45, F4
        mov     edx, dword [ebp-10H]                    ; 293E _ 8B. 55, F0
        add     edx, 33                                 ; 2941 _ 83. C2, 21
        shl     edx, 5                                  ; 2944 _ C1. E2, 05
        add     eax, edx                                ; 2947 _ 01. D0
        add     eax, 16                                 ; 2949 _ 83. C0, 10
        mov     dword [eax], 0                          ; 294C _ C7. 00, 00000000
        add     dword [ebp-10H], 1                      ; 2952 _ 83. 45, F0, 01
?_104:  cmp     dword [ebp-10H], 255                    ; 2956 _ 81. 7D, F0, 000000FF
        jle     ?_103                                   ; 295D _ 7E, DC
        mov     eax, dword [ebp+10H]                    ; 295F _ 8B. 45, 10
        imul    eax, dword [ebp+14H]                    ; 2962 _ 0F AF. 45, 14
        mov     dword [esp+4H], eax                     ; 2966 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 296A _ 8B. 45, 08
        mov     dword [esp], eax                        ; 296D _ 89. 04 24
        call    memman_alloc_4k                         ; 2970 _ E8, FFFFFFFC(rel)
        mov     edx, eax                                ; 2975 _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 2977 _ 8B. 45, F4
        mov     dword [eax+10H], edx                    ; 297A _ 89. 50, 10
        mov     eax, dword [ebp-0CH]                    ; 297D _ 8B. 45, F4
        mov     eax, dword [eax+10H]                    ; 2980 _ 8B. 40, 10
        test    eax, eax                                ; 2983 _ 85. C0
        jnz     ?_105                                   ; 2985 _ 75, 21
        mov     eax, dword [ebp-0CH]                    ; 2987 _ 8B. 45, F4
        mov     dword [esp+8H], 9236                    ; 298A _ C7. 44 24, 08, 00002414
        mov     dword [esp+4H], eax                     ; 2992 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2996 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2999 _ 89. 04 24
        call    memman_free_4k                          ; 299C _ E8, FFFFFFFC(rel)
        mov     eax, 0                                  ; 29A1 _ B8, 00000000
        jmp     ?_106                                   ; 29A6 _ EB, 03

?_105:  mov     eax, dword [ebp-0CH]                    ; 29A8 _ 8B. 45, F4
?_106:  leave                                           ; 29AB _ C9
        ret                                             ; 29AC _ C3
; sheet_control_init End of function

sheet_alloc:; Function begin
        push    ebp                                     ; 29AD _ 55
        mov     ebp, esp                                ; 29AE _ 89. E5
        sub     esp, 16                                 ; 29B0 _ 83. EC, 10
        mov     dword [ebp-8H], 0                       ; 29B3 _ C7. 45, F8, 00000000
        jmp     ?_109                                   ; 29BA _ EB, 5B

?_107:  mov     eax, dword [ebp+8H]                     ; 29BC _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 29BF _ 8B. 55, F8
        add     edx, 33                                 ; 29C2 _ 83. C2, 21
        shl     edx, 5                                  ; 29C5 _ C1. E2, 05
        add     eax, edx                                ; 29C8 _ 01. D0
        add     eax, 16                                 ; 29CA _ 83. C0, 10
        mov     eax, dword [eax]                        ; 29CD _ 8B. 00
        test    eax, eax                                ; 29CF _ 85. C0
        jnz     ?_108                                   ; 29D1 _ 75, 40
        mov     eax, dword [ebp-8H]                     ; 29D3 _ 8B. 45, F8
        shl     eax, 5                                  ; 29D6 _ C1. E0, 05
        lea     edx, [eax+410H]                         ; 29D9 _ 8D. 90, 00000410
        mov     eax, dword [ebp+8H]                     ; 29DF _ 8B. 45, 08
        add     eax, edx                                ; 29E2 _ 01. D0
        add     eax, 4                                  ; 29E4 _ 83. C0, 04
        mov     dword [ebp-4H], eax                     ; 29E7 _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 29EA _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 29ED _ 8B. 55, F8
        lea     ecx, [edx+4H]                           ; 29F0 _ 8D. 4A, 04
        mov     edx, dword [ebp-4H]                     ; 29F3 _ 8B. 55, FC
        mov     dword [eax+ecx*4+4H], edx               ; 29F6 _ 89. 54 88, 04
        mov     eax, dword [ebp-4H]                     ; 29FA _ 8B. 45, FC
        mov     dword [eax+1CH], 1                      ; 29FD _ C7. 40, 1C, 00000001
        mov     eax, dword [ebp-4H]                     ; 2A04 _ 8B. 45, FC
        mov     dword [eax+18H], -1                     ; 2A07 _ C7. 40, 18, FFFFFFFF
        mov     eax, dword [ebp-4H]                     ; 2A0E _ 8B. 45, FC
        jmp     ?_110                                   ; 2A11 _ EB, 12

?_108:  add     dword [ebp-8H], 1                       ; 2A13 _ 83. 45, F8, 01
?_109:  cmp     dword [ebp-8H], 255                     ; 2A17 _ 81. 7D, F8, 000000FF
        jle     ?_107                                   ; 2A1E _ 7E, 9C
        mov     eax, 0                                  ; 2A20 _ B8, 00000000
?_110:  leave                                           ; 2A25 _ C9
        ret                                             ; 2A26 _ C3
; sheet_alloc End of function

sheet_setbuf:; Function begin
        push    ebp                                     ; 2A27 _ 55
        mov     ebp, esp                                ; 2A28 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 2A2A _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 2A2D _ 8B. 55, 0C
        mov     dword [eax], edx                        ; 2A30 _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 2A32 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 2A35 _ 8B. 55, 10
        mov     dword [eax+4H], edx                     ; 2A38 _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 2A3B _ 8B. 45, 08
        mov     edx, dword [ebp+14H]                    ; 2A3E _ 8B. 55, 14
        mov     dword [eax+8H], edx                     ; 2A41 _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 2A44 _ 8B. 45, 08
        mov     edx, dword [ebp+18H]                    ; 2A47 _ 8B. 55, 18
        mov     dword [eax+14H], edx                    ; 2A4A _ 89. 50, 14
        pop     ebp                                     ; 2A4D _ 5D
        ret                                             ; 2A4E _ C3
; sheet_setbuf End of function

sheet_updown:; Function begin
        push    ebp                                     ; 2A4F _ 55
        mov     ebp, esp                                ; 2A50 _ 89. E5
        push    esi                                     ; 2A52 _ 56
        push    ebx                                     ; 2A53 _ 53
        sub     esp, 48                                 ; 2A54 _ 83. EC, 30
        mov     eax, dword [ebp+0CH]                    ; 2A57 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 2A5A _ 8B. 40, 18
        mov     dword [ebp-0CH], eax                    ; 2A5D _ 89. 45, F4
        mov     eax, dword [ebp+8H]                     ; 2A60 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 2A63 _ 8B. 40, 0C
        add     eax, 1                                  ; 2A66 _ 83. C0, 01
        cmp     eax, dword [ebp+10H]                    ; 2A69 _ 3B. 45, 10
        jge     ?_111                                   ; 2A6C _ 7D, 0C
        mov     eax, dword [ebp+8H]                     ; 2A6E _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 2A71 _ 8B. 40, 0C
        add     eax, 1                                  ; 2A74 _ 83. C0, 01
        mov     dword [ebp+10H], eax                    ; 2A77 _ 89. 45, 10
?_111:  cmp     dword [ebp+10H], -1                     ; 2A7A _ 83. 7D, 10, FF
        jge     ?_112                                   ; 2A7E _ 7D, 07
        mov     dword [ebp+10H], -1                     ; 2A80 _ C7. 45, 10, FFFFFFFF
?_112:  mov     eax, dword [ebp+0CH]                    ; 2A87 _ 8B. 45, 0C
        mov     edx, dword [ebp+10H]                    ; 2A8A _ 8B. 55, 10
        mov     dword [eax+18H], edx                    ; 2A8D _ 89. 50, 18
        mov     eax, dword [ebp-0CH]                    ; 2A90 _ 8B. 45, F4
        cmp     eax, dword [ebp+10H]                    ; 2A93 _ 3B. 45, 10
        jle     ?_119                                   ; 2A96 _ 0F 8E, 00000201
        cmp     dword [ebp+10H], 0                      ; 2A9C _ 83. 7D, 10, 00
        js      ?_115                                   ; 2AA0 _ 0F 88, 000000F7
        mov     eax, dword [ebp-0CH]                    ; 2AA6 _ 8B. 45, F4
        mov     dword [ebp-10H], eax                    ; 2AA9 _ 89. 45, F0
        jmp     ?_114                                   ; 2AAC _ EB, 34

?_113:  mov     eax, dword [ebp-10H]                    ; 2AAE _ 8B. 45, F0
        lea     edx, [eax-1H]                           ; 2AB1 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 2AB4 _ 8B. 45, 08
        add     edx, 4                                  ; 2AB7 _ 83. C2, 04
        mov     edx, dword [eax+edx*4+4H]               ; 2ABA _ 8B. 54 90, 04
        mov     eax, dword [ebp+8H]                     ; 2ABE _ 8B. 45, 08
        mov     ecx, dword [ebp-10H]                    ; 2AC1 _ 8B. 4D, F0
        add     ecx, 4                                  ; 2AC4 _ 83. C1, 04
        mov     dword [eax+ecx*4+4H], edx               ; 2AC7 _ 89. 54 88, 04
        mov     eax, dword [ebp+8H]                     ; 2ACB _ 8B. 45, 08
        mov     edx, dword [ebp-10H]                    ; 2ACE _ 8B. 55, F0
        add     edx, 4                                  ; 2AD1 _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 2AD4 _ 8B. 44 90, 04
        mov     edx, dword [ebp-10H]                    ; 2AD8 _ 8B. 55, F0
        mov     dword [eax+18H], edx                    ; 2ADB _ 89. 50, 18
        sub     dword [ebp-10H], 1                      ; 2ADE _ 83. 6D, F0, 01
?_114:  mov     eax, dword [ebp-10H]                    ; 2AE2 _ 8B. 45, F0
        cmp     eax, dword [ebp+10H]                    ; 2AE5 _ 3B. 45, 10
        jg      ?_113                                   ; 2AE8 _ 7F, C4
        mov     eax, dword [ebp+8H]                     ; 2AEA _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 2AED _ 8B. 55, 10
        lea     ecx, [edx+4H]                           ; 2AF0 _ 8D. 4A, 04
        mov     edx, dword [ebp+0CH]                    ; 2AF3 _ 8B. 55, 0C
        mov     dword [eax+ecx*4+4H], edx               ; 2AF6 _ 89. 54 88, 04
        mov     eax, dword [ebp+10H]                    ; 2AFA _ 8B. 45, 10
        lea     esi, [eax+1H]                           ; 2AFD _ 8D. 70, 01
        mov     eax, dword [ebp+0CH]                    ; 2B00 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 2B03 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 2B06 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 2B09 _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 2B0C _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 2B0F _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 2B12 _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 2B15 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 2B18 _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 2B1B _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 2B1E _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 2B21 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 2B24 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 2B27 _ 8B. 40, 0C
        mov     dword [esp+14H], esi                    ; 2B2A _ 89. 74 24, 14
        mov     dword [esp+10H], ebx                    ; 2B2E _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 2B32 _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 2B36 _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 2B3A _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2B3E _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2B41 _ 89. 04 24
        call    sheet_refresh_map                       ; 2B44 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 2B49 _ 8B. 45, 10
        lea     esi, [eax+1H]                           ; 2B4C _ 8D. 70, 01
        mov     eax, dword [ebp+0CH]                    ; 2B4F _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 2B52 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 2B55 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 2B58 _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 2B5B _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 2B5E _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 2B61 _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 2B64 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 2B67 _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 2B6A _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 2B6D _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 2B70 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 2B73 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 2B76 _ 8B. 40, 0C
        mov     dword [esp+14H], esi                    ; 2B79 _ 89. 74 24, 14
        mov     dword [esp+10H], ebx                    ; 2B7D _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 2B81 _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 2B85 _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 2B89 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2B8D _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2B90 _ 89. 04 24
        call    sheet_refresh_local                     ; 2B93 _ E8, FFFFFFFC(rel)
        jmp     ?_126                                   ; 2B98 _ E9, 0000026C

?_115:  mov     eax, dword [ebp+8H]                     ; 2B9D _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 2BA0 _ 8B. 40, 0C
        cmp     eax, dword [ebp-0CH]                    ; 2BA3 _ 3B. 45, F4
        jle     ?_118                                   ; 2BA6 _ 7E, 47
        mov     eax, dword [ebp-0CH]                    ; 2BA8 _ 8B. 45, F4
        mov     dword [ebp-10H], eax                    ; 2BAB _ 89. 45, F0
        jmp     ?_117                                   ; 2BAE _ EB, 34

?_116:  mov     eax, dword [ebp-10H]                    ; 2BB0 _ 8B. 45, F0
        lea     edx, [eax+1H]                           ; 2BB3 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 2BB6 _ 8B. 45, 08
        add     edx, 4                                  ; 2BB9 _ 83. C2, 04
        mov     edx, dword [eax+edx*4+4H]               ; 2BBC _ 8B. 54 90, 04
        mov     eax, dword [ebp+8H]                     ; 2BC0 _ 8B. 45, 08
        mov     ecx, dword [ebp-10H]                    ; 2BC3 _ 8B. 4D, F0
        add     ecx, 4                                  ; 2BC6 _ 83. C1, 04
        mov     dword [eax+ecx*4+4H], edx               ; 2BC9 _ 89. 54 88, 04
        mov     eax, dword [ebp+8H]                     ; 2BCD _ 8B. 45, 08
        mov     edx, dword [ebp-10H]                    ; 2BD0 _ 8B. 55, F0
        add     edx, 4                                  ; 2BD3 _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 2BD6 _ 8B. 44 90, 04
        mov     edx, dword [ebp-10H]                    ; 2BDA _ 8B. 55, F0
        mov     dword [eax+18H], edx                    ; 2BDD _ 89. 50, 18
        add     dword [ebp-10H], 1                      ; 2BE0 _ 83. 45, F0, 01
?_117:  mov     eax, dword [ebp+8H]                     ; 2BE4 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 2BE7 _ 8B. 40, 0C
        cmp     eax, dword [ebp-10H]                    ; 2BEA _ 3B. 45, F0
        jg      ?_116                                   ; 2BED _ 7F, C1
?_118:  mov     eax, dword [ebp+8H]                     ; 2BEF _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 2BF2 _ 8B. 40, 0C
        lea     edx, [eax-1H]                           ; 2BF5 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 2BF8 _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 2BFB _ 89. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 2BFE _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 2C01 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 2C04 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 2C07 _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 2C0A _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 2C0D _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 2C10 _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 2C13 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 2C16 _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 2C19 _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 2C1C _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 2C1F _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 2C22 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 2C25 _ 8B. 40, 0C
        mov     dword [esp+14H], 0                      ; 2C28 _ C7. 44 24, 14, 00000000
        mov     dword [esp+10H], ebx                    ; 2C30 _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 2C34 _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 2C38 _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 2C3C _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2C40 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2C43 _ 89. 04 24
        call    sheet_refresh_map                       ; 2C46 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+0CH]                    ; 2C4B _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 2C4E _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 2C51 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 2C54 _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 2C57 _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 2C5A _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 2C5D _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 2C60 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 2C63 _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 2C66 _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 2C69 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 2C6C _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 2C6F _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 2C72 _ 8B. 40, 0C
        mov     dword [esp+14H], 0                      ; 2C75 _ C7. 44 24, 14, 00000000
        mov     dword [esp+10H], ebx                    ; 2C7D _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 2C81 _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 2C85 _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 2C89 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2C8D _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2C90 _ 89. 04 24
        call    sheet_refresh_local                     ; 2C93 _ E8, FFFFFFFC(rel)
        jmp     ?_126                                   ; 2C98 _ E9, 0000016C

?_119:  mov     eax, dword [ebp-0CH]                    ; 2C9D _ 8B. 45, F4
        cmp     eax, dword [ebp+10H]                    ; 2CA0 _ 3B. 45, 10
        jge     ?_126                                   ; 2CA3 _ 0F 8D, 00000160
        cmp     dword [ebp-0CH], 0                      ; 2CA9 _ 83. 7D, F4, 00
        js      ?_122                                   ; 2CAD _ 78, 56
        mov     eax, dword [ebp-0CH]                    ; 2CAF _ 8B. 45, F4
        mov     dword [ebp-10H], eax                    ; 2CB2 _ 89. 45, F0
        jmp     ?_121                                   ; 2CB5 _ EB, 34

?_120:  mov     eax, dword [ebp-10H]                    ; 2CB7 _ 8B. 45, F0
        lea     edx, [eax+1H]                           ; 2CBA _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 2CBD _ 8B. 45, 08
        add     edx, 4                                  ; 2CC0 _ 83. C2, 04
        mov     edx, dword [eax+edx*4+4H]               ; 2CC3 _ 8B. 54 90, 04
        mov     eax, dword [ebp+8H]                     ; 2CC7 _ 8B. 45, 08
        mov     ecx, dword [ebp-10H]                    ; 2CCA _ 8B. 4D, F0
        add     ecx, 4                                  ; 2CCD _ 83. C1, 04
        mov     dword [eax+ecx*4+4H], edx               ; 2CD0 _ 89. 54 88, 04
        mov     eax, dword [ebp+8H]                     ; 2CD4 _ 8B. 45, 08
        mov     edx, dword [ebp-10H]                    ; 2CD7 _ 8B. 55, F0
        add     edx, 4                                  ; 2CDA _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 2CDD _ 8B. 44 90, 04
        mov     edx, dword [ebp-10H]                    ; 2CE1 _ 8B. 55, F0
        mov     dword [eax+18H], edx                    ; 2CE4 _ 89. 50, 18
        add     dword [ebp-10H], 1                      ; 2CE7 _ 83. 45, F0, 01
?_121:  mov     eax, dword [ebp-10H]                    ; 2CEB _ 8B. 45, F0
        cmp     eax, dword [ebp+10H]                    ; 2CEE _ 3B. 45, 10
        jl      ?_120                                   ; 2CF1 _ 7C, C4
        mov     eax, dword [ebp+8H]                     ; 2CF3 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 2CF6 _ 8B. 55, 10
        lea     ecx, [edx+4H]                           ; 2CF9 _ 8D. 4A, 04
        mov     edx, dword [ebp+0CH]                    ; 2CFC _ 8B. 55, 0C
        mov     dword [eax+ecx*4+4H], edx               ; 2CFF _ 89. 54 88, 04
        jmp     ?_125                                   ; 2D03 _ EB, 6C

?_122:  mov     eax, dword [ebp+8H]                     ; 2D05 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 2D08 _ 8B. 40, 0C
        mov     dword [ebp-10H], eax                    ; 2D0B _ 89. 45, F0
        jmp     ?_124                                   ; 2D0E _ EB, 3A

?_123:  mov     eax, dword [ebp-10H]                    ; 2D10 _ 8B. 45, F0
        lea     ecx, [eax+1H]                           ; 2D13 _ 8D. 48, 01
        mov     eax, dword [ebp+8H]                     ; 2D16 _ 8B. 45, 08
        mov     edx, dword [ebp-10H]                    ; 2D19 _ 8B. 55, F0
        add     edx, 4                                  ; 2D1C _ 83. C2, 04
        mov     edx, dword [eax+edx*4+4H]               ; 2D1F _ 8B. 54 90, 04
        mov     eax, dword [ebp+8H]                     ; 2D23 _ 8B. 45, 08
        add     ecx, 4                                  ; 2D26 _ 83. C1, 04
        mov     dword [eax+ecx*4+4H], edx               ; 2D29 _ 89. 54 88, 04
        mov     eax, dword [ebp-10H]                    ; 2D2D _ 8B. 45, F0
        lea     edx, [eax+1H]                           ; 2D30 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 2D33 _ 8B. 45, 08
        add     edx, 4                                  ; 2D36 _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 2D39 _ 8B. 44 90, 04
        mov     edx, dword [ebp-10H]                    ; 2D3D _ 8B. 55, F0
        add     edx, 1                                  ; 2D40 _ 83. C2, 01
        mov     dword [eax+18H], edx                    ; 2D43 _ 89. 50, 18
        sub     dword [ebp-10H], 1                      ; 2D46 _ 83. 6D, F0, 01
?_124:  mov     eax, dword [ebp-10H]                    ; 2D4A _ 8B. 45, F0
        cmp     eax, dword [ebp+10H]                    ; 2D4D _ 3B. 45, 10
        jge     ?_123                                   ; 2D50 _ 7D, BE
        mov     eax, dword [ebp+8H]                     ; 2D52 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 2D55 _ 8B. 55, 10
        lea     ecx, [edx+4H]                           ; 2D58 _ 8D. 4A, 04
        mov     edx, dword [ebp+0CH]                    ; 2D5B _ 8B. 55, 0C
        mov     dword [eax+ecx*4+4H], edx               ; 2D5E _ 89. 54 88, 04
        mov     eax, dword [ebp+8H]                     ; 2D62 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 2D65 _ 8B. 40, 0C
        lea     edx, [eax+1H]                           ; 2D68 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 2D6B _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 2D6E _ 89. 50, 0C
?_125:  mov     eax, dword [ebp+0CH]                    ; 2D71 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 2D74 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 2D77 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 2D7A _ 8B. 40, 08
        lea     esi, [edx+eax]                          ; 2D7D _ 8D. 34 02
        mov     eax, dword [ebp+0CH]                    ; 2D80 _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 2D83 _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 2D86 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 2D89 _ 8B. 40, 04
        lea     ebx, [edx+eax]                          ; 2D8C _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 2D8F _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 2D92 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 2D95 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 2D98 _ 8B. 40, 0C
        mov     ecx, dword [ebp+10H]                    ; 2D9B _ 8B. 4D, 10
        mov     dword [esp+14H], ecx                    ; 2D9E _ 89. 4C 24, 14
        mov     dword [esp+10H], esi                    ; 2DA2 _ 89. 74 24, 10
        mov     dword [esp+0CH], ebx                    ; 2DA6 _ 89. 5C 24, 0C
        mov     dword [esp+8H], edx                     ; 2DAA _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 2DAE _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2DB2 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2DB5 _ 89. 04 24
        call    sheet_refresh_map                       ; 2DB8 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+0CH]                    ; 2DBD _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 2DC0 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 2DC3 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 2DC6 _ 8B. 40, 08
        lea     esi, [edx+eax]                          ; 2DC9 _ 8D. 34 02
        mov     eax, dword [ebp+0CH]                    ; 2DCC _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 2DCF _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 2DD2 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 2DD5 _ 8B. 40, 04
        lea     ebx, [edx+eax]                          ; 2DD8 _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 2DDB _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 2DDE _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 2DE1 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 2DE4 _ 8B. 40, 0C
        mov     ecx, dword [ebp+10H]                    ; 2DE7 _ 8B. 4D, 10
        mov     dword [esp+14H], ecx                    ; 2DEA _ 89. 4C 24, 14
        mov     dword [esp+10H], esi                    ; 2DEE _ 89. 74 24, 10
        mov     dword [esp+0CH], ebx                    ; 2DF2 _ 89. 5C 24, 0C
        mov     dword [esp+8H], edx                     ; 2DF6 _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 2DFA _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2DFE _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2E01 _ 89. 04 24
        call    sheet_refresh_local                     ; 2E04 _ E8, FFFFFFFC(rel)
?_126:  add     esp, 48                                 ; 2E09 _ 83. C4, 30
        pop     ebx                                     ; 2E0C _ 5B
        pop     esi                                     ; 2E0D _ 5E
        pop     ebp                                     ; 2E0E _ 5D
        ret                                             ; 2E0F _ C3
; sheet_updown End of function

sheet_refresh:; Function begin
        push    ebp                                     ; 2E10 _ 55
        mov     ebp, esp                                ; 2E11 _ 89. E5
        push    edi                                     ; 2E13 _ 57
        push    esi                                     ; 2E14 _ 56
        push    ebx                                     ; 2E15 _ 53
        sub     esp, 44                                 ; 2E16 _ 83. EC, 2C
        mov     eax, dword [ebp+0CH]                    ; 2E19 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 2E1C _ 8B. 40, 18
        test    eax, eax                                ; 2E1F _ 85. C0
        js      ?_127                                   ; 2E21 _ 78, 53
        mov     eax, dword [ebp+0CH]                    ; 2E23 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 2E26 _ 8B. 40, 18
        mov     edx, dword [ebp+0CH]                    ; 2E29 _ 8B. 55, 0C
        mov     ecx, dword [edx+10H]                    ; 2E2C _ 8B. 4A, 10
        mov     edx, dword [ebp+1CH]                    ; 2E2F _ 8B. 55, 1C
        lea     esi, [ecx+edx]                          ; 2E32 _ 8D. 34 11
        mov     edx, dword [ebp+0CH]                    ; 2E35 _ 8B. 55, 0C
        mov     ecx, dword [edx+0CH]                    ; 2E38 _ 8B. 4A, 0C
        mov     edx, dword [ebp+18H]                    ; 2E3B _ 8B. 55, 18
        lea     ebx, [ecx+edx]                          ; 2E3E _ 8D. 1C 11
        mov     edx, dword [ebp+0CH]                    ; 2E41 _ 8B. 55, 0C
        mov     ecx, dword [edx+10H]                    ; 2E44 _ 8B. 4A, 10
        mov     edx, dword [ebp+14H]                    ; 2E47 _ 8B. 55, 14
        add     ecx, edx                                ; 2E4A _ 01. D1
        mov     edx, dword [ebp+0CH]                    ; 2E4C _ 8B. 55, 0C
        mov     edi, dword [edx+0CH]                    ; 2E4F _ 8B. 7A, 0C
        mov     edx, dword [ebp+10H]                    ; 2E52 _ 8B. 55, 10
        add     edx, edi                                ; 2E55 _ 01. FA
        mov     dword [esp+14H], eax                    ; 2E57 _ 89. 44 24, 14
        mov     dword [esp+10H], esi                    ; 2E5B _ 89. 74 24, 10
        mov     dword [esp+0CH], ebx                    ; 2E5F _ 89. 5C 24, 0C
        mov     dword [esp+8H], ecx                     ; 2E63 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 2E67 _ 89. 54 24, 04
        mov     eax, dword [ebp+8H]                     ; 2E6B _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2E6E _ 89. 04 24
        call    sheet_refresh_local                     ; 2E71 _ E8, FFFFFFFC(rel)
?_127:  mov     eax, 0                                  ; 2E76 _ B8, 00000000
        add     esp, 44                                 ; 2E7B _ 83. C4, 2C
        pop     ebx                                     ; 2E7E _ 5B
        pop     esi                                     ; 2E7F _ 5E
        pop     edi                                     ; 2E80 _ 5F
        pop     ebp                                     ; 2E81 _ 5D
        ret                                             ; 2E82 _ C3
; sheet_refresh End of function

sheet_slide:; Function begin
        push    ebp                                     ; 2E83 _ 55
        mov     ebp, esp                                ; 2E84 _ 89. E5
        push    ebx                                     ; 2E86 _ 53
        sub     esp, 52                                 ; 2E87 _ 83. EC, 34
        mov     eax, dword [ebp+0CH]                    ; 2E8A _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 2E8D _ 8B. 40, 0C
        mov     dword [ebp-10H], eax                    ; 2E90 _ 89. 45, F0
        mov     eax, dword [ebp+0CH]                    ; 2E93 _ 8B. 45, 0C
        mov     eax, dword [eax+10H]                    ; 2E96 _ 8B. 40, 10
        mov     dword [ebp-0CH], eax                    ; 2E99 _ 89. 45, F4
        mov     eax, dword [ebp+0CH]                    ; 2E9C _ 8B. 45, 0C
        mov     edx, dword [ebp+10H]                    ; 2E9F _ 8B. 55, 10
        mov     dword [eax+0CH], edx                    ; 2EA2 _ 89. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 2EA5 _ 8B. 45, 0C
        mov     edx, dword [ebp+14H]                    ; 2EA8 _ 8B. 55, 14
        mov     dword [eax+10H], edx                    ; 2EAB _ 89. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 2EAE _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 2EB1 _ 8B. 40, 18
        test    eax, eax                                ; 2EB4 _ 85. C0
        js      ?_128                                   ; 2EB6 _ 0F 88, 00000100
        mov     eax, dword [ebp+0CH]                    ; 2EBC _ 8B. 45, 0C
        mov     edx, dword [eax+8H]                     ; 2EBF _ 8B. 50, 08
        mov     eax, dword [ebp-0CH]                    ; 2EC2 _ 8B. 45, F4
        add     edx, eax                                ; 2EC5 _ 01. C2
        mov     eax, dword [ebp+0CH]                    ; 2EC7 _ 8B. 45, 0C
        mov     ecx, dword [eax+4H]                     ; 2ECA _ 8B. 48, 04
        mov     eax, dword [ebp-10H]                    ; 2ECD _ 8B. 45, F0
        add     eax, ecx                                ; 2ED0 _ 01. C8
        mov     dword [esp+14H], 0                      ; 2ED2 _ C7. 44 24, 14, 00000000
        mov     dword [esp+10H], edx                    ; 2EDA _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 2EDE _ 89. 44 24, 0C
        mov     eax, dword [ebp-0CH]                    ; 2EE2 _ 8B. 45, F4
        mov     dword [esp+8H], eax                     ; 2EE5 _ 89. 44 24, 08
        mov     eax, dword [ebp-10H]                    ; 2EE9 _ 8B. 45, F0
        mov     dword [esp+4H], eax                     ; 2EEC _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2EF0 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2EF3 _ 89. 04 24
        call    sheet_refresh_map                       ; 2EF6 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+0CH]                    ; 2EFB _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 2EFE _ 8B. 40, 18
        mov     edx, dword [ebp+0CH]                    ; 2F01 _ 8B. 55, 0C
        mov     ecx, dword [edx+8H]                     ; 2F04 _ 8B. 4A, 08
        mov     edx, dword [ebp+14H]                    ; 2F07 _ 8B. 55, 14
        add     ecx, edx                                ; 2F0A _ 01. D1
        mov     edx, dword [ebp+0CH]                    ; 2F0C _ 8B. 55, 0C
        mov     ebx, dword [edx+4H]                     ; 2F0F _ 8B. 5A, 04
        mov     edx, dword [ebp+10H]                    ; 2F12 _ 8B. 55, 10
        add     edx, ebx                                ; 2F15 _ 01. DA
        mov     dword [esp+14H], eax                    ; 2F17 _ 89. 44 24, 14
        mov     dword [esp+10H], ecx                    ; 2F1B _ 89. 4C 24, 10
        mov     dword [esp+0CH], edx                    ; 2F1F _ 89. 54 24, 0C
        mov     eax, dword [ebp+14H]                    ; 2F23 _ 8B. 45, 14
        mov     dword [esp+8H], eax                     ; 2F26 _ 89. 44 24, 08
        mov     eax, dword [ebp+10H]                    ; 2F2A _ 8B. 45, 10
        mov     dword [esp+4H], eax                     ; 2F2D _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2F31 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2F34 _ 89. 04 24
        call    sheet_refresh_map                       ; 2F37 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+0CH]                    ; 2F3C _ 8B. 45, 0C
        mov     edx, dword [eax+8H]                     ; 2F3F _ 8B. 50, 08
        mov     eax, dword [ebp-0CH]                    ; 2F42 _ 8B. 45, F4
        add     edx, eax                                ; 2F45 _ 01. C2
        mov     eax, dword [ebp+0CH]                    ; 2F47 _ 8B. 45, 0C
        mov     ecx, dword [eax+4H]                     ; 2F4A _ 8B. 48, 04
        mov     eax, dword [ebp-10H]                    ; 2F4D _ 8B. 45, F0
        add     eax, ecx                                ; 2F50 _ 01. C8
        mov     dword [esp+14H], 0                      ; 2F52 _ C7. 44 24, 14, 00000000
        mov     dword [esp+10H], edx                    ; 2F5A _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 2F5E _ 89. 44 24, 0C
        mov     eax, dword [ebp-0CH]                    ; 2F62 _ 8B. 45, F4
        mov     dword [esp+8H], eax                     ; 2F65 _ 89. 44 24, 08
        mov     eax, dword [ebp-10H]                    ; 2F69 _ 8B. 45, F0
        mov     dword [esp+4H], eax                     ; 2F6C _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2F70 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2F73 _ 89. 04 24
        call    sheet_refresh_local                     ; 2F76 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+0CH]                    ; 2F7B _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 2F7E _ 8B. 40, 18
        mov     edx, dword [ebp+0CH]                    ; 2F81 _ 8B. 55, 0C
        mov     ecx, dword [edx+8H]                     ; 2F84 _ 8B. 4A, 08
        mov     edx, dword [ebp+14H]                    ; 2F87 _ 8B. 55, 14
        add     ecx, edx                                ; 2F8A _ 01. D1
        mov     edx, dword [ebp+0CH]                    ; 2F8C _ 8B. 55, 0C
        mov     ebx, dword [edx+4H]                     ; 2F8F _ 8B. 5A, 04
        mov     edx, dword [ebp+10H]                    ; 2F92 _ 8B. 55, 10
        add     edx, ebx                                ; 2F95 _ 01. DA
        mov     dword [esp+14H], eax                    ; 2F97 _ 89. 44 24, 14
        mov     dword [esp+10H], ecx                    ; 2F9B _ 89. 4C 24, 10
        mov     dword [esp+0CH], edx                    ; 2F9F _ 89. 54 24, 0C
        mov     eax, dword [ebp+14H]                    ; 2FA3 _ 8B. 45, 14
        mov     dword [esp+8H], eax                     ; 2FA6 _ 89. 44 24, 08
        mov     eax, dword [ebp+10H]                    ; 2FAA _ 8B. 45, 10
        mov     dword [esp+4H], eax                     ; 2FAD _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2FB1 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2FB4 _ 89. 04 24
        call    sheet_refresh_local                     ; 2FB7 _ E8, FFFFFFFC(rel)
?_128:  add     esp, 52                                 ; 2FBC _ 83. C4, 34
        pop     ebx                                     ; 2FBF _ 5B
        pop     ebp                                     ; 2FC0 _ 5D
        ret                                             ; 2FC1 _ C3
; sheet_slide End of function

sheet_refresh_local:; Function begin
        push    ebp                                     ; 2FC2 _ 55
        mov     ebp, esp                                ; 2FC3 _ 89. E5
        sub     esp, 48                                 ; 2FC5 _ 83. EC, 30
        mov     eax, dword [ebp+8H]                     ; 2FC8 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 2FCB _ 8B. 00
        mov     dword [ebp-18H], eax                    ; 2FCD _ 89. 45, E8
        mov     eax, dword [ebp+8H]                     ; 2FD0 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 2FD3 _ 8B. 40, 10
        mov     dword [ebp-14H], eax                    ; 2FD6 _ 89. 45, EC
        cmp     dword [ebp+0CH], 0                      ; 2FD9 _ 83. 7D, 0C, 00
        jns     ?_129                                   ; 2FDD _ 79, 07
        mov     dword [ebp+0CH], 0                      ; 2FDF _ C7. 45, 0C, 00000000
?_129:  cmp     dword [ebp+10H], 0                      ; 2FE6 _ 83. 7D, 10, 00
        jns     ?_130                                   ; 2FEA _ 79, 07
        mov     dword [ebp+10H], 0                      ; 2FEC _ C7. 45, 10, 00000000
?_130:  mov     eax, dword [ebp+8H]                     ; 2FF3 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 2FF6 _ 8B. 40, 04
        cmp     eax, dword [ebp+14H]                    ; 2FF9 _ 3B. 45, 14
        jge     ?_131                                   ; 2FFC _ 7D, 09
        mov     eax, dword [ebp+8H]                     ; 2FFE _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 3001 _ 8B. 40, 04
        mov     dword [ebp+14H], eax                    ; 3004 _ 89. 45, 14
?_131:  mov     eax, dword [ebp+8H]                     ; 3007 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 300A _ 8B. 40, 08
        cmp     eax, dword [ebp+18H]                    ; 300D _ 3B. 45, 18
        jge     ?_132                                   ; 3010 _ 7D, 09
        mov     eax, dword [ebp+8H]                     ; 3012 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 3015 _ 8B. 40, 08
        mov     dword [ebp+18H], eax                    ; 3018 _ 89. 45, 18
?_132:  mov     eax, dword [ebp+1CH]                    ; 301B _ 8B. 45, 1C
        mov     dword [ebp-24H], eax                    ; 301E _ 89. 45, DC
        jmp     ?_139                                   ; 3021 _ E9, 00000119

?_133:  mov     eax, dword [ebp+8H]                     ; 3026 _ 8B. 45, 08
        mov     edx, dword [ebp-24H]                    ; 3029 _ 8B. 55, DC
        add     edx, 4                                  ; 302C _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 302F _ 8B. 44 90, 04
        mov     dword [ebp-10H], eax                    ; 3033 _ 89. 45, F0
        mov     eax, dword [ebp-10H]                    ; 3036 _ 8B. 45, F0
        mov     eax, dword [eax]                        ; 3039 _ 8B. 00
        mov     dword [ebp-0CH], eax                    ; 303B _ 89. 45, F4
        mov     edx, dword [ebp-10H]                    ; 303E _ 8B. 55, F0
        mov     eax, dword [ebp+8H]                     ; 3041 _ 8B. 45, 08
        add     eax, 1044                               ; 3044 _ 05, 00000414
        sub     edx, eax                                ; 3049 _ 29. C2
        mov     eax, edx                                ; 304B _ 89. D0
        sar     eax, 5                                  ; 304D _ C1. F8, 05
        mov     byte [ebp-26H], al                      ; 3050 _ 88. 45, DA
        mov     dword [ebp-1CH], 0                      ; 3053 _ C7. 45, E4, 00000000
        jmp     ?_138                                   ; 305A _ E9, 000000CD

?_134:  mov     eax, dword [ebp-10H]                    ; 305F _ 8B. 45, F0
        mov     edx, dword [eax+10H]                    ; 3062 _ 8B. 50, 10
        mov     eax, dword [ebp-1CH]                    ; 3065 _ 8B. 45, E4
        add     eax, edx                                ; 3068 _ 01. D0
        mov     dword [ebp-8H], eax                     ; 306A _ 89. 45, F8
        mov     dword [ebp-20H], 0                      ; 306D _ C7. 45, E0, 00000000
        jmp     ?_137                                   ; 3074 _ E9, 000000A0

?_135:  mov     eax, dword [ebp-10H]                    ; 3079 _ 8B. 45, F0
        mov     edx, dword [eax+0CH]                    ; 307C _ 8B. 50, 0C
        mov     eax, dword [ebp-20H]                    ; 307F _ 8B. 45, E0
        add     eax, edx                                ; 3082 _ 01. D0
        mov     dword [ebp-4H], eax                     ; 3084 _ 89. 45, FC
        mov     eax, dword [ebp+0CH]                    ; 3087 _ 8B. 45, 0C
        cmp     eax, dword [ebp-4H]                     ; 308A _ 3B. 45, FC
        jg      ?_136                                   ; 308D _ 0F 8F, 00000082
        mov     eax, dword [ebp-4H]                     ; 3093 _ 8B. 45, FC
        cmp     eax, dword [ebp+14H]                    ; 3096 _ 3B. 45, 14
        jge     ?_136                                   ; 3099 _ 7D, 7A
        mov     eax, dword [ebp+10H]                    ; 309B _ 8B. 45, 10
        cmp     eax, dword [ebp-8H]                     ; 309E _ 3B. 45, F8
        jg      ?_136                                   ; 30A1 _ 7F, 72
        mov     eax, dword [ebp-8H]                     ; 30A3 _ 8B. 45, F8
        cmp     eax, dword [ebp+18H]                    ; 30A6 _ 3B. 45, 18
        jge     ?_136                                   ; 30A9 _ 7D, 6A
        mov     eax, dword [ebp-10H]                    ; 30AB _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 30AE _ 8B. 40, 04
        imul    eax, dword [ebp-1CH]                    ; 30B1 _ 0F AF. 45, E4
        mov     edx, eax                                ; 30B5 _ 89. C2
        mov     eax, dword [ebp-20H]                    ; 30B7 _ 8B. 45, E0
        add     eax, edx                                ; 30BA _ 01. D0
        mov     edx, eax                                ; 30BC _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 30BE _ 8B. 45, F4
        add     eax, edx                                ; 30C1 _ 01. D0
        movzx   eax, byte [eax]                         ; 30C3 _ 0F B6. 00
        mov     byte [ebp-25H], al                      ; 30C6 _ 88. 45, DB
        movzx   edx, byte [ebp-25H]                     ; 30C9 _ 0F B6. 55, DB
        mov     eax, dword [ebp-10H]                    ; 30CD _ 8B. 45, F0
        mov     eax, dword [eax+14H]                    ; 30D0 _ 8B. 40, 14
        cmp     edx, eax                                ; 30D3 _ 39. C2
        jz      ?_136                                   ; 30D5 _ 74, 3E
        mov     eax, dword [ebp+8H]                     ; 30D7 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 30DA _ 8B. 40, 04
        imul    eax, dword [ebp-8H]                     ; 30DD _ 0F AF. 45, F8
        mov     edx, eax                                ; 30E1 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 30E3 _ 8B. 45, FC
        add     eax, edx                                ; 30E6 _ 01. D0
        mov     edx, eax                                ; 30E8 _ 89. C2
        mov     eax, dword [ebp-14H]                    ; 30EA _ 8B. 45, EC
        add     eax, edx                                ; 30ED _ 01. D0
        movzx   eax, byte [eax]                         ; 30EF _ 0F B6. 00
        cmp     al, byte [ebp-26H]                      ; 30F2 _ 3A. 45, DA
        jnz     ?_136                                   ; 30F5 _ 75, 1E
        mov     eax, dword [ebp+8H]                     ; 30F7 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 30FA _ 8B. 40, 04
        imul    eax, dword [ebp-8H]                     ; 30FD _ 0F AF. 45, F8
        mov     edx, eax                                ; 3101 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 3103 _ 8B. 45, FC
        add     eax, edx                                ; 3106 _ 01. D0
        mov     edx, eax                                ; 3108 _ 89. C2
        mov     eax, dword [ebp-18H]                    ; 310A _ 8B. 45, E8
        add     edx, eax                                ; 310D _ 01. C2
        movzx   eax, byte [ebp-25H]                     ; 310F _ 0F B6. 45, DB
        mov     byte [edx], al                          ; 3113 _ 88. 02
?_136:  add     dword [ebp-20H], 1                      ; 3115 _ 83. 45, E0, 01
?_137:  mov     eax, dword [ebp-10H]                    ; 3119 _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 311C _ 8B. 40, 04
        cmp     eax, dword [ebp-20H]                    ; 311F _ 3B. 45, E0
        jg      ?_135                                   ; 3122 _ 0F 8F, FFFFFF51
        add     dword [ebp-1CH], 1                      ; 3128 _ 83. 45, E4, 01
?_138:  mov     eax, dword [ebp-10H]                    ; 312C _ 8B. 45, F0
        mov     eax, dword [eax+8H]                     ; 312F _ 8B. 40, 08
        cmp     eax, dword [ebp-1CH]                    ; 3132 _ 3B. 45, E4
        jg      ?_134                                   ; 3135 _ 0F 8F, FFFFFF24
        add     dword [ebp-24H], 1                      ; 313B _ 83. 45, DC, 01
?_139:  mov     eax, dword [ebp+8H]                     ; 313F _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 3142 _ 8B. 40, 0C
        cmp     eax, dword [ebp-24H]                    ; 3145 _ 3B. 45, DC
        jge     ?_133                                   ; 3148 _ 0F 8D, FFFFFED8
        leave                                           ; 314E _ C9
        ret                                             ; 314F _ C3
; sheet_refresh_local End of function

sheet_refresh_map:; Function begin
        push    ebp                                     ; 3150 _ 55
        mov     ebp, esp                                ; 3151 _ 89. E5
        sub     esp, 64                                 ; 3153 _ 83. EC, 40
        mov     eax, dword [ebp+8H]                     ; 3156 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 3159 _ 8B. 00
        mov     dword [ebp-18H], eax                    ; 315B _ 89. 45, E8
        mov     eax, dword [ebp+8H]                     ; 315E _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 3161 _ 8B. 40, 10
        mov     dword [ebp-14H], eax                    ; 3164 _ 89. 45, EC
        cmp     dword [ebp+0CH], 0                      ; 3167 _ 83. 7D, 0C, 00
        jns     ?_140                                   ; 316B _ 79, 07
        mov     dword [ebp+0CH], 0                      ; 316D _ C7. 45, 0C, 00000000
?_140:  cmp     dword [ebp+10H], 0                      ; 3174 _ 83. 7D, 10, 00
        jns     ?_141                                   ; 3178 _ 79, 07
        mov     dword [ebp+10H], 0                      ; 317A _ C7. 45, 10, 00000000
?_141:  mov     eax, dword [ebp+8H]                     ; 3181 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 3184 _ 8B. 40, 04
        cmp     eax, dword [ebp+14H]                    ; 3187 _ 3B. 45, 14
        jge     ?_142                                   ; 318A _ 7D, 09
        mov     eax, dword [ebp+8H]                     ; 318C _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 318F _ 8B. 40, 04
        mov     dword [ebp+14H], eax                    ; 3192 _ 89. 45, 14
?_142:  mov     eax, dword [ebp+8H]                     ; 3195 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 3198 _ 8B. 40, 08
        cmp     eax, dword [ebp+18H]                    ; 319B _ 3B. 45, 18
        jge     ?_143                                   ; 319E _ 7D, 09
        mov     eax, dword [ebp+8H]                     ; 31A0 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 31A3 _ 8B. 40, 08
        mov     dword [ebp+18H], eax                    ; 31A6 _ 89. 45, 18
?_143:  mov     eax, dword [ebp+1CH]                    ; 31A9 _ 8B. 45, 1C
        mov     dword [ebp-34H], eax                    ; 31AC _ 89. 45, CC
        jmp     ?_154                                   ; 31AF _ E9, 00000141

?_144:  mov     eax, dword [ebp+8H]                     ; 31B4 _ 8B. 45, 08
        mov     edx, dword [ebp-34H]                    ; 31B7 _ 8B. 55, CC
        add     edx, 4                                  ; 31BA _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 31BD _ 8B. 44 90, 04
        mov     dword [ebp-10H], eax                    ; 31C1 _ 89. 45, F0
        mov     edx, dword [ebp-10H]                    ; 31C4 _ 8B. 55, F0
        mov     eax, dword [ebp+8H]                     ; 31C7 _ 8B. 45, 08
        add     eax, 1044                               ; 31CA _ 05, 00000414
        sub     edx, eax                                ; 31CF _ 29. C2
        mov     eax, edx                                ; 31D1 _ 89. D0
        sar     eax, 5                                  ; 31D3 _ C1. F8, 05
        mov     byte [ebp-35H], al                      ; 31D6 _ 88. 45, CB
        mov     eax, dword [ebp-10H]                    ; 31D9 _ 8B. 45, F0
        mov     eax, dword [eax]                        ; 31DC _ 8B. 00
        mov     dword [ebp-0CH], eax                    ; 31DE _ 89. 45, F4
        mov     eax, dword [ebp-10H]                    ; 31E1 _ 8B. 45, F0
        mov     eax, dword [eax+0CH]                    ; 31E4 _ 8B. 40, 0C
        mov     edx, dword [ebp+0CH]                    ; 31E7 _ 8B. 55, 0C
        sub     edx, eax                                ; 31EA _ 29. C2
        mov     eax, edx                                ; 31EC _ 89. D0
        mov     dword [ebp-30H], eax                    ; 31EE _ 89. 45, D0
        mov     eax, dword [ebp-10H]                    ; 31F1 _ 8B. 45, F0
        mov     eax, dword [eax+10H]                    ; 31F4 _ 8B. 40, 10
        mov     edx, dword [ebp+10H]                    ; 31F7 _ 8B. 55, 10
        sub     edx, eax                                ; 31FA _ 29. C2
        mov     eax, edx                                ; 31FC _ 89. D0
        mov     dword [ebp-2CH], eax                    ; 31FE _ 89. 45, D4
        mov     eax, dword [ebp-10H]                    ; 3201 _ 8B. 45, F0
        mov     eax, dword [eax+0CH]                    ; 3204 _ 8B. 40, 0C
        mov     edx, dword [ebp+14H]                    ; 3207 _ 8B. 55, 14
        sub     edx, eax                                ; 320A _ 29. C2
        mov     eax, edx                                ; 320C _ 89. D0
        mov     dword [ebp-28H], eax                    ; 320E _ 89. 45, D8
        mov     eax, dword [ebp-10H]                    ; 3211 _ 8B. 45, F0
        mov     eax, dword [eax+10H]                    ; 3214 _ 8B. 40, 10
        mov     edx, dword [ebp+18H]                    ; 3217 _ 8B. 55, 18
        sub     edx, eax                                ; 321A _ 29. C2
        mov     eax, edx                                ; 321C _ 89. D0
        mov     dword [ebp-24H], eax                    ; 321E _ 89. 45, DC
        cmp     dword [ebp-30H], 0                      ; 3221 _ 83. 7D, D0, 00
        jns     ?_145                                   ; 3225 _ 79, 07
        mov     dword [ebp-30H], 0                      ; 3227 _ C7. 45, D0, 00000000
?_145:  cmp     dword [ebp-2CH], 0                      ; 322E _ 83. 7D, D4, 00
        jns     ?_146                                   ; 3232 _ 79, 07
        mov     dword [ebp-2CH], 0                      ; 3234 _ C7. 45, D4, 00000000
?_146:  mov     eax, dword [ebp-10H]                    ; 323B _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 323E _ 8B. 40, 04
        cmp     eax, dword [ebp-28H]                    ; 3241 _ 3B. 45, D8
        jge     ?_147                                   ; 3244 _ 7D, 09
        mov     eax, dword [ebp-10H]                    ; 3246 _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 3249 _ 8B. 40, 04
        mov     dword [ebp-28H], eax                    ; 324C _ 89. 45, D8
?_147:  mov     eax, dword [ebp-10H]                    ; 324F _ 8B. 45, F0
        mov     eax, dword [eax+8H]                     ; 3252 _ 8B. 40, 08
        cmp     eax, dword [ebp-24H]                    ; 3255 _ 3B. 45, DC
        jge     ?_148                                   ; 3258 _ 7D, 09
        mov     eax, dword [ebp-10H]                    ; 325A _ 8B. 45, F0
        mov     eax, dword [eax+8H]                     ; 325D _ 8B. 40, 08
        mov     dword [ebp-24H], eax                    ; 3260 _ 89. 45, DC
?_148:  mov     eax, dword [ebp-2CH]                    ; 3263 _ 8B. 45, D4
        mov     dword [ebp-1CH], eax                    ; 3266 _ 89. 45, E4
        jmp     ?_153                                   ; 3269 _ EB, 7A

?_149:  mov     eax, dword [ebp-10H]                    ; 326B _ 8B. 45, F0
        mov     edx, dword [eax+10H]                    ; 326E _ 8B. 50, 10
        mov     eax, dword [ebp-1CH]                    ; 3271 _ 8B. 45, E4
        add     eax, edx                                ; 3274 _ 01. D0
        mov     dword [ebp-8H], eax                     ; 3276 _ 89. 45, F8
        mov     eax, dword [ebp-30H]                    ; 3279 _ 8B. 45, D0
        mov     dword [ebp-20H], eax                    ; 327C _ 89. 45, E0
        jmp     ?_152                                   ; 327F _ EB, 58

?_150:  mov     eax, dword [ebp-10H]                    ; 3281 _ 8B. 45, F0
        mov     edx, dword [eax+0CH]                    ; 3284 _ 8B. 50, 0C
        mov     eax, dword [ebp-20H]                    ; 3287 _ 8B. 45, E0
        add     eax, edx                                ; 328A _ 01. D0
        mov     dword [ebp-4H], eax                     ; 328C _ 89. 45, FC
        mov     eax, dword [ebp-10H]                    ; 328F _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 3292 _ 8B. 40, 04
        imul    eax, dword [ebp-1CH]                    ; 3295 _ 0F AF. 45, E4
        mov     edx, eax                                ; 3299 _ 89. C2
        mov     eax, dword [ebp-20H]                    ; 329B _ 8B. 45, E0
        add     eax, edx                                ; 329E _ 01. D0
        mov     edx, eax                                ; 32A0 _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 32A2 _ 8B. 45, F4
        add     eax, edx                                ; 32A5 _ 01. D0
        movzx   eax, byte [eax]                         ; 32A7 _ 0F B6. 00
        movzx   edx, al                                 ; 32AA _ 0F B6. D0
        mov     eax, dword [ebp-10H]                    ; 32AD _ 8B. 45, F0
        mov     eax, dword [eax+14H]                    ; 32B0 _ 8B. 40, 14
        cmp     edx, eax                                ; 32B3 _ 39. C2
        jz      ?_151                                   ; 32B5 _ 74, 1E
        mov     eax, dword [ebp+8H]                     ; 32B7 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 32BA _ 8B. 40, 04
        imul    eax, dword [ebp-8H]                     ; 32BD _ 0F AF. 45, F8
        mov     edx, eax                                ; 32C1 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 32C3 _ 8B. 45, FC
        add     eax, edx                                ; 32C6 _ 01. D0
        mov     edx, eax                                ; 32C8 _ 89. C2
        mov     eax, dword [ebp-14H]                    ; 32CA _ 8B. 45, EC
        add     edx, eax                                ; 32CD _ 01. C2
        movzx   eax, byte [ebp-35H]                     ; 32CF _ 0F B6. 45, CB
        mov     byte [edx], al                          ; 32D3 _ 88. 02
?_151:  add     dword [ebp-20H], 1                      ; 32D5 _ 83. 45, E0, 01
?_152:  mov     eax, dword [ebp-20H]                    ; 32D9 _ 8B. 45, E0
        cmp     eax, dword [ebp-28H]                    ; 32DC _ 3B. 45, D8
        jl      ?_150                                   ; 32DF _ 7C, A0
        add     dword [ebp-1CH], 1                      ; 32E1 _ 83. 45, E4, 01
?_153:  mov     eax, dword [ebp-1CH]                    ; 32E5 _ 8B. 45, E4
        cmp     eax, dword [ebp-24H]                    ; 32E8 _ 3B. 45, DC
        jl      ?_149                                   ; 32EB _ 0F 8C, FFFFFF7A
        add     dword [ebp-34H], 1                      ; 32F1 _ 83. 45, CC, 01
?_154:  mov     eax, dword [ebp+8H]                     ; 32F5 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 32F8 _ 8B. 40, 0C
        cmp     eax, dword [ebp-34H]                    ; 32FB _ 3B. 45, CC
        jge     ?_144                                   ; 32FE _ 0F 8D, FFFFFEB0
        leave                                           ; 3304 _ C9
        ret                                             ; 3305 _ C3
; sheet_refresh_map End of function

init_time_port:; Function begin
        push    ebp                                     ; 3306 _ 55
        mov     ebp, esp                                ; 3307 _ 89. E5
        sub     esp, 24                                 ; 3309 _ 83. EC, 18
        mov     dword [esp+4H], 52                      ; 330C _ C7. 44 24, 04, 00000034
        mov     dword [esp], 67                         ; 3314 _ C7. 04 24, 00000043
        call    io_out8                                 ; 331B _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 156                     ; 3320 _ C7. 44 24, 04, 0000009C
        mov     dword [esp], 64                         ; 3328 _ C7. 04 24, 00000040
        call    io_out8                                 ; 332F _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 46                      ; 3334 _ C7. 44 24, 04, 0000002E
        mov     dword [esp], 64                         ; 333C _ C7. 04 24, 00000040
        call    io_out8                                 ; 3343 _ E8, FFFFFFFC(rel)
        mov     dword [timer_control], 0                ; 3348 _ C7. 05, 000003C0(d), 00000000
        leave                                           ; 3352 _ C9
        ret                                             ; 3353 _ C3
; init_time_port End of function

get_timer_control:; Function begin
        push    ebp                                     ; 3354 _ 55
        mov     ebp, esp                                ; 3355 _ 89. E5
        mov     eax, timer_control                      ; 3357 _ B8, 000003C0(d)
        pop     ebp                                     ; 335C _ 5D
        ret                                             ; 335D _ C3
; get_timer_control End of function

timer_alloc:; Function begin
        push    ebp                                     ; 335E _ 55
        mov     ebp, esp                                ; 335F _ 89. E5
        sub     esp, 16                                 ; 3361 _ 83. EC, 10
        mov     dword [ebp-4H], 0                       ; 3364 _ C7. 45, FC, 00000000
        jmp     ?_157                                   ; 336B _ EB, 26

?_155:  mov     eax, dword [ebp-4H]                     ; 336D _ 8B. 45, FC
        shl     eax, 4                                  ; 3370 _ C1. E0, 04
        add     eax, timer_control                      ; 3373 _ 05, 000003C0(d)
        mov     eax, dword [eax+8H]                     ; 3378 _ 8B. 40, 08
        test    eax, eax                                ; 337B _ 85. C0
        jnz     ?_156                                   ; 337D _ 75, 10
        mov     eax, dword [ebp-4H]                     ; 337F _ 8B. 45, FC
        shl     eax, 4                                  ; 3382 _ C1. E0, 04
        add     eax, timer_control                      ; 3385 _ 05, 000003C0(d)
        add     eax, 4                                  ; 338A _ 83. C0, 04
        jmp     ?_158                                   ; 338D _ EB, 0D

?_156:  add     dword [ebp-4H], 1                       ; 338F _ 83. 45, FC, 01
?_157:  cmp     dword [ebp-4H], 499                     ; 3393 _ 81. 7D, FC, 000001F3
        jle     ?_155                                   ; 339A _ 7E, D1
?_158:  leave                                           ; 339C _ C9
        ret                                             ; 339D _ C3
; timer_alloc End of function

timer_free:; Function begin
        push    ebp                                     ; 339E _ 55
        mov     ebp, esp                                ; 339F _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 33A1 _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 33A4 _ C7. 40, 04, 00000000
        pop     ebp                                     ; 33AB _ 5D
        ret                                             ; 33AC _ C3
; timer_free End of function

timer_init:; Function begin
        push    ebp                                     ; 33AD _ 55
        mov     ebp, esp                                ; 33AE _ 89. E5
        sub     esp, 4                                  ; 33B0 _ 83. EC, 04
        mov     eax, dword [ebp+10H]                    ; 33B3 _ 8B. 45, 10
        mov     byte [ebp-4H], al                       ; 33B6 _ 88. 45, FC
        mov     eax, dword [ebp+8H]                     ; 33B9 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 33BC _ 8B. 55, 0C
        mov     dword [eax+8H], edx                     ; 33BF _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 33C2 _ 8B. 45, 08
        movzx   edx, byte [ebp-4H]                      ; 33C5 _ 0F B6. 55, FC
        mov     byte [eax+0CH], dl                      ; 33C9 _ 88. 50, 0C
        leave                                           ; 33CC _ C9
        ret                                             ; 33CD _ C3
; timer_init End of function

timer_settime:; Function begin
        push    ebp                                     ; 33CE _ 55
        mov     ebp, esp                                ; 33CF _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 33D1 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 33D4 _ 8B. 55, 0C
        mov     dword [eax], edx                        ; 33D7 _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 33D9 _ 8B. 45, 08
        mov     dword [eax+4H], 2                       ; 33DC _ C7. 40, 04, 00000002
        pop     ebp                                     ; 33E3 _ 5D
        ret                                             ; 33E4 _ C3
; timer_settime End of function

intHandlerTimer:; Function begin
        push    ebp                                     ; 33E5 _ 55
        mov     ebp, esp                                ; 33E6 _ 89. E5
        sub     esp, 40                                 ; 33E8 _ 83. EC, 28
        mov     dword [esp+4H], 96                      ; 33EB _ C7. 44 24, 04, 00000060
        mov     dword [esp], 32                         ; 33F3 _ C7. 04 24, 00000020
        call    io_out8                                 ; 33FA _ E8, FFFFFFFC(rel)
        mov     eax, dword [timer_control]              ; 33FF _ A1, 000003C0(d)
        add     eax, 1                                  ; 3404 _ 83. C0, 01
        mov     dword [timer_control], eax              ; 3407 _ A3, 000003C0(d)
        mov     dword [ebp-0CH], 0                      ; 340C _ C7. 45, F4, 00000000
        jmp     ?_161                                   ; 3413 _ E9, 00000086

?_159:  mov     eax, dword [ebp-0CH]                    ; 3418 _ 8B. 45, F4
        shl     eax, 4                                  ; 341B _ C1. E0, 04
        add     eax, timer_control                      ; 341E _ 05, 000003C0(d)
        mov     eax, dword [eax+8H]                     ; 3423 _ 8B. 40, 08
        cmp     eax, 2                                  ; 3426 _ 83. F8, 02
        jnz     ?_160                                   ; 3429 _ 75, 6F
        mov     eax, dword [ebp-0CH]                    ; 342B _ 8B. 45, F4
        shl     eax, 4                                  ; 342E _ C1. E0, 04
        add     eax, timer_control                      ; 3431 _ 05, 000003C0(d)
        mov     eax, dword [eax+4H]                     ; 3436 _ 8B. 40, 04
        lea     edx, [eax-1H]                           ; 3439 _ 8D. 50, FF
        mov     eax, dword [ebp-0CH]                    ; 343C _ 8B. 45, F4
        shl     eax, 4                                  ; 343F _ C1. E0, 04
        add     eax, timer_control                      ; 3442 _ 05, 000003C0(d)
        mov     dword [eax+4H], edx                     ; 3447 _ 89. 50, 04
        mov     eax, dword [ebp-0CH]                    ; 344A _ 8B. 45, F4
        shl     eax, 4                                  ; 344D _ C1. E0, 04
        add     eax, timer_control                      ; 3450 _ 05, 000003C0(d)
        mov     eax, dword [eax+4H]                     ; 3455 _ 8B. 40, 04
        test    eax, eax                                ; 3458 _ 85. C0
        jnz     ?_160                                   ; 345A _ 75, 3E
        mov     eax, dword [ebp-0CH]                    ; 345C _ 8B. 45, F4
        shl     eax, 4                                  ; 345F _ C1. E0, 04
        add     eax, timer_control                      ; 3462 _ 05, 000003C0(d)
        mov     dword [eax+8H], 1                       ; 3467 _ C7. 40, 08, 00000001
        mov     eax, dword [ebp-0CH]                    ; 346E _ 8B. 45, F4
        shl     eax, 4                                  ; 3471 _ C1. E0, 04
        add     eax, timer_control                      ; 3474 _ 05, 000003C0(d)
        movzx   eax, byte [eax+10H]                     ; 3479 _ 0F B6. 40, 10
        movzx   edx, al                                 ; 347D _ 0F B6. D0
        mov     eax, dword [ebp-0CH]                    ; 3480 _ 8B. 45, F4
        shl     eax, 4                                  ; 3483 _ C1. E0, 04
        add     eax, timer_control                      ; 3486 _ 05, 000003C0(d)
        mov     eax, dword [eax+0CH]                    ; 348B _ 8B. 40, 0C
        mov     dword [esp+4H], edx                     ; 348E _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 3492 _ 89. 04 24
        call    fifo8_put                               ; 3495 _ E8, FFFFFFFC(rel)
?_160:  add     dword [ebp-0CH], 1                      ; 349A _ 83. 45, F4, 01
?_161:  cmp     dword [ebp-0CH], 499                    ; 349E _ 81. 7D, F4, 000001F3
        jle     ?_159                                   ; 34A5 _ 0F 8E, FFFFFF6D
        leave                                           ; 34AB _ C9
        ret                                             ; 34AC _ C3
; intHandlerTimer End of function

segment_descriptor:; Function begin
        push    ebp                                     ; 34AD _ 55
        mov     ebp, esp                                ; 34AE _ 89. E5
        cmp     dword [ebp+0CH], 1048575                ; 34B0 _ 81. 7D, 0C, 000FFFFF
        jbe     ?_162                                   ; 34B7 _ 76, 10
        or      dword [ebp+14H], 8000H                  ; 34B9 _ 81. 4D, 14, 00008000
        mov     eax, dword [ebp+0CH]                    ; 34C0 _ 8B. 45, 0C
        shr     eax, 12                                 ; 34C3 _ C1. E8, 0C
        mov     dword [ebp+0CH], eax                    ; 34C6 _ 89. 45, 0C
?_162:  mov     eax, dword [ebp+0CH]                    ; 34C9 _ 8B. 45, 0C
        mov     edx, eax                                ; 34CC _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 34CE _ 8B. 45, 08
        mov     word [eax], dx                          ; 34D1 _ 66: 89. 10
        mov     eax, dword [ebp+10H]                    ; 34D4 _ 8B. 45, 10
        mov     edx, eax                                ; 34D7 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 34D9 _ 8B. 45, 08
        mov     word [eax+2H], dx                       ; 34DC _ 66: 89. 50, 02
        mov     eax, dword [ebp+10H]                    ; 34E0 _ 8B. 45, 10
        sar     eax, 16                                 ; 34E3 _ C1. F8, 10
        mov     edx, eax                                ; 34E6 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 34E8 _ 8B. 45, 08
        mov     byte [eax+4H], dl                       ; 34EB _ 88. 50, 04
        mov     eax, dword [ebp+14H]                    ; 34EE _ 8B. 45, 14
        mov     edx, eax                                ; 34F1 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 34F3 _ 8B. 45, 08
        mov     byte [eax+5H], dl                       ; 34F6 _ 88. 50, 05
        mov     eax, dword [ebp+0CH]                    ; 34F9 _ 8B. 45, 0C
        shr     eax, 16                                 ; 34FC _ C1. E8, 10
        and     eax, 0FH                                ; 34FF _ 83. E0, 0F
        mov     edx, eax                                ; 3502 _ 89. C2
        mov     eax, dword [ebp+14H]                    ; 3504 _ 8B. 45, 14
        sar     eax, 8                                  ; 3507 _ C1. F8, 08
        and     eax, 0FFFFFFF0H                         ; 350A _ 83. E0, F0
        or      eax, edx                                ; 350D _ 09. D0
        mov     edx, eax                                ; 350F _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 3511 _ 8B. 45, 08
        mov     byte [eax+6H], dl                       ; 3514 _ 88. 50, 06
        mov     eax, dword [ebp+10H]                    ; 3517 _ 8B. 45, 10
        shr     eax, 24                                 ; 351A _ C1. E8, 18
        mov     edx, eax                                ; 351D _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 351F _ 8B. 45, 08
        mov     byte [eax+7H], dl                       ; 3522 _ 88. 50, 07
        pop     ebp                                     ; 3525 _ 5D
        ret                                             ; 3526 _ C3
; segment_descriptor End of function


SECTION .rodata align=1 noexecute                       ; section number 2, const

?_163:                                                  ; byte
        db 77H, 69H, 6EH, 64H, 6FH, 77H, 00H            ; 0000 _ window.

?_164:                                                  ; byte
        db 73H, 77H, 69H, 74H, 63H, 68H, 20H, 74H       ; 0007 _ switch t
        db 6FH, 20H, 74H, 61H, 73H, 6BH, 20H, 62H       ; 000F _ o task b
        db 00H                                          ; 0017 _ .

?_165:                                                  ; byte
        db 65H, 6EH, 74H, 65H, 72H, 20H, 74H, 61H       ; 0018 _ enter ta
        db 73H, 6BH, 20H, 62H, 00H                      ; 0020 _ sk b.

?_166:                                                  ; byte
        db 73H, 77H, 69H, 74H, 63H, 68H, 20H, 62H       ; 0025 _ switch b
        db 61H, 63H, 6BH, 00H                           ; 002D _ ack.

?_167:                                                  ; byte
        db 70H, 61H, 67H, 65H, 20H, 69H, 73H, 3AH       ; 0031 _ page is:
        db 20H, 00H                                     ; 0039 _  .

?_168:                                                  ; byte
        db 42H, 61H, 73H, 65H, 41H, 64H, 64H, 72H       ; 003B _ BaseAddr
        db 4CH, 3AH, 20H, 00H                           ; 0043 _ L: .

?_169:                                                  ; byte
        db 42H, 61H, 73H, 65H, 41H, 64H, 64H, 72H       ; 0047 _ BaseAddr
        db 48H, 3AH, 20H, 00H                           ; 004F _ H: .

?_170:                                                  ; byte
        db 6CH, 65H, 6EH, 67H, 74H, 68H, 4CH, 6FH       ; 0053 _ lengthLo
        db 77H, 3AH, 20H, 00H                           ; 005B _ w: .

?_171:                                                  ; byte
        db 6CH, 65H, 6EH, 67H, 74H, 68H, 48H, 69H       ; 005F _ lengthHi
        db 67H, 68H, 3AH, 20H, 00H                      ; 0067 _ gh: .

?_172:                                                  ; byte
        db 74H, 79H, 70H, 65H, 3AH, 20H, 00H            ; 006C _ type: .


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

?_173:  db 00H                                          ; 02A2 _ .

?_174:  db 00H, 00H                                     ; 02A3 _ ..


SECTION .bss    align=32 noexecute                      ; section number 4, bss

sheet_control:                                          ; dword
        resd    1                                       ; 0000

back_sheet:                                             ; dword
        resd    1                                       ; 0004

mouse_sheet:                                            ; dword
        resd    1                                       ; 0008

timerinfo1.1692:                                        ; byte
        resb    24                                      ; 000C

timerbuf1.1695:                                         ; qword
        resq    1                                       ; 0024

timerinfo2.1693:                                        ; byte
        resb    24                                      ; 002C

timerbuf2.1696:                                         ; qword
        resq    1                                       ; 0044

timerinfo3.1694:                                        ; byte
        resb    24                                      ; 004C

timerbuf3.1697:                                         ; qword
        resq    3                                       ; 0064
        resb    4                                       ; 007C

tss_a.1701:                                             ; byte
        resb    28                                      ; 0080

?_175:  resd    2                                       ; 009C

?_176:  resd    5                                       ; 00A4

?_177:  resd    4                                       ; 00B8

?_178:  resd    1                                       ; 00C8

?_179:  resd    1                                       ; 00CC

?_180:  resd    1                                       ; 00D0

?_181:  resd    1                                       ; 00D4

?_182:  resd    1                                       ; 00D8

?_183:  resd    1                                       ; 00DC

?_184:  resd    1                                       ; 00E0

?_185:  resd    7                                       ; 00E4

tss_b.1702:                                             ; byte
        resb    32                                      ; 0100

?_186:  resd    1                                       ; 0120

?_187:  resd    1                                       ; 0124

?_188:  resd    1                                       ; 0128

?_189:  resd    1                                       ; 012C

?_190:  resd    1                                       ; 0130

?_191:  resd    1                                       ; 0134

?_192:  resd    1                                       ; 0138

?_193:  resd    1                                       ; 013C

?_194:  resd    1                                       ; 0140

?_195:  resd    1                                       ; 0144

?_196:  resd    1                                       ; 0148

?_197:  resd    1                                       ; 014C

?_198:  resd    1                                       ; 0150

?_199:  resd    1                                       ; 0154

?_200:  resd    1                                       ; 0158

?_201:  resd    1                                       ; 015C

?_202:  resd    1                                       ; 0160

?_203:  resd    7                                       ; 0164

screen_info:                                            ; qword
        resb    4                                       ; 0180

?_204:  resw    1                                       ; 0184

?_205:  resw    13                                      ; 0186

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

?_206:  resb    9                                       ; 03A1

?_207:  resb    22                                      ; 03AA

timer_control:                                          ; byte
        resd    2001                                    ; 03C0


