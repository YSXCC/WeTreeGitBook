; Disassembly of file: ckernel.o
; Fri Mar 13 12:15:24 2020
; Mode: 32 bits
; Syntax: YASM/NASM
; Instruction set: 80386






CMain:  ; Function begin
        push    ebp                                     ; 0000 _ 55
        mov     ebp, esp                                ; 0001 _ 89. E5
        push    ebx                                     ; 0003 _ 53
        sub     esp, 132                                ; 0004 _ 81. EC, 00000084
        mov     dword [esp], screen_info                ; 000A _ C7. 04 24, 00000000(d)
        call    init_screeninfo                         ; 0011 _ E8, FFFFFFFC(rel)
        mov     eax, dword [screen_info]                ; 0016 _ A1, 00000000(d)
        mov     dword [ebp-48H], eax                    ; 001B _ 89. 45, B8
        movzx   eax, word [screen_info+4H]              ; 001E _ 0F B7. 05, 00000004(d)
        cwde                                            ; 0025 _ 98
        mov     dword [ebp-44H], eax                    ; 0026 _ 89. 45, BC
        movzx   eax, word [screen_info+6H]              ; 0029 _ 0F B7. 05, 00000006(d)
        cwde                                            ; 0030 _ 98
        mov     dword [ebp-40H], eax                    ; 0031 _ 89. 45, C0
        mov     eax, dword [memman]                     ; 0034 _ A1, 00000004(d)
        mov     dword [esp], eax                        ; 0039 _ 89. 04 24
        call    memman_init                             ; 003C _ E8, FFFFFFFC(rel)
        mov     eax, dword [memman]                     ; 0041 _ A1, 00000004(d)
        mov     dword [esp+8H], 1072594944              ; 0046 _ C7. 44 24, 08, 3FEE8000
        mov     dword [esp+4H], 17301504                ; 004E _ C7. 44 24, 04, 01080000
        mov     dword [esp], eax                        ; 0056 _ 89. 04 24
        call    memman_free                             ; 0059 _ E8, FFFFFFFC(rel)
        mov     eax, dword [memman]                     ; 005E _ A1, 00000004(d)
        mov     edx, dword [ebp-40H]                    ; 0063 _ 8B. 55, C0
        mov     dword [esp+0CH], edx                    ; 0066 _ 89. 54 24, 0C
        mov     edx, dword [ebp-44H]                    ; 006A _ 8B. 55, BC
        mov     dword [esp+8H], edx                     ; 006D _ 89. 54 24, 08
        mov     edx, dword [ebp-48H]                    ; 0071 _ 8B. 55, B8
        mov     dword [esp+4H], edx                     ; 0074 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0078 _ 89. 04 24
        call    sheet_control_init                      ; 007B _ E8, FFFFFFFC(rel)
        mov     dword [sheet_control], eax              ; 0080 _ A3, 0000000C(d)
        mov     eax, dword [sheet_control]              ; 0085 _ A1, 0000000C(d)
        mov     dword [esp], eax                        ; 008A _ 89. 04 24
        call    sheet_alloc                             ; 008D _ E8, FFFFFFFC(rel)
        mov     dword [back_sheet], eax                 ; 0092 _ A3, 00000010(d)
        mov     eax, dword [sheet_control]              ; 0097 _ A1, 0000000C(d)
        mov     dword [esp], eax                        ; 009C _ 89. 04 24
        call    sheet_alloc                             ; 009F _ E8, FFFFFFFC(rel)
        mov     dword [mouse_sheet], eax                ; 00A4 _ A3, 00000014(d)
        mov     eax, dword [ebp-44H]                    ; 00A9 _ 8B. 45, BC
        imul    eax, dword [ebp-40H]                    ; 00AC _ 0F AF. 45, C0
        mov     edx, eax                                ; 00B0 _ 89. C2
        mov     eax, dword [memman]                     ; 00B2 _ A1, 00000004(d)
        mov     dword [esp+4H], edx                     ; 00B7 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 00BB _ 89. 04 24
        call    memman_alloc_4k                         ; 00BE _ E8, FFFFFFFC(rel)
        mov     dword [back_buf], eax                   ; 00C3 _ A3, 00000000(d)
        mov     edx, dword [back_buf]                   ; 00C8 _ 8B. 15, 00000000(d)
        mov     eax, dword [back_sheet]                 ; 00CE _ A1, 00000010(d)
        mov     dword [esp+10H], 99                     ; 00D3 _ C7. 44 24, 10, 00000063
        mov     ecx, dword [ebp-40H]                    ; 00DB _ 8B. 4D, C0
        mov     dword [esp+0CH], ecx                    ; 00DE _ 89. 4C 24, 0C
        mov     ecx, dword [ebp-44H]                    ; 00E2 _ 8B. 4D, BC
        mov     dword [esp+8H], ecx                     ; 00E5 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 00E9 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 00ED _ 89. 04 24
        call    sheet_setbuf                            ; 00F0 _ E8, FFFFFFFC(rel)
        mov     eax, dword [mouse_sheet]                ; 00F5 _ A1, 00000014(d)
        mov     dword [esp+10H], 99                     ; 00FA _ C7. 44 24, 10, 00000063
        mov     dword [esp+0CH], 16                     ; 0102 _ C7. 44 24, 0C, 00000010
        mov     dword [esp+8H], 16                      ; 010A _ C7. 44 24, 08, 00000010
        mov     dword [esp+4H], mouse_cursor_buf        ; 0112 _ C7. 44 24, 04, 00000000(d)
        mov     dword [esp], eax                        ; 011A _ 89. 04 24
        call    sheet_setbuf                            ; 011D _ E8, FFFFFFFC(rel)
        call    init_mouse_position                     ; 0122 _ E8, FFFFFFFC(rel)
        call    init_palette                            ; 0127 _ E8, FFFFFFFC(rel)
        call    init_fifo_buf                           ; 012C _ E8, FFFFFFFC(rel)
        call    init_keyboard                           ; 0131 _ E8, FFFFFFFC(rel)
        call    get_timer_control                       ; 0136 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-3CH], eax                    ; 013B _ 89. 45, C4
        call    init_time_port                          ; 013E _ E8, FFFFFFFC(rel)
        mov     dword [esp+0CH], 0                      ; 0143 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], timerbuf1.1762          ; 014B _ C7. 44 24, 08, 00000034(d)
        mov     dword [esp+4H], 8                       ; 0153 _ C7. 44 24, 04, 00000008
        mov     dword [esp], timerinfo1.1759            ; 015B _ C7. 04 24, 00000018(d)
        call    fifo8_init                              ; 0162 _ E8, FFFFFFFC(rel)
        call    timer_alloc                             ; 0167 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-38H], eax                    ; 016C _ 89. 45, C8
        mov     dword [esp+8H], 1                       ; 016F _ C7. 44 24, 08, 00000001
        mov     dword [esp+4H], timerinfo1.1759         ; 0177 _ C7. 44 24, 04, 00000018(d)
        mov     eax, dword [ebp-38H]                    ; 017F _ 8B. 45, C8
        mov     dword [esp], eax                        ; 0182 _ 89. 04 24
        call    timer_init                              ; 0185 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 100                     ; 018A _ C7. 44 24, 04, 00000064
        mov     eax, dword [ebp-38H]                    ; 0192 _ 8B. 45, C8
        mov     dword [esp], eax                        ; 0195 _ 89. 04 24
        call    timer_settime                           ; 0198 _ E8, FFFFFFFC(rel)
        mov     dword [esp+0CH], 0                      ; 019D _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], timerbuf2.1763          ; 01A5 _ C7. 44 24, 08, 00000058(d)
        mov     dword [esp+4H], 8                       ; 01AD _ C7. 44 24, 04, 00000008
        mov     dword [esp], timerinfo2.1760            ; 01B5 _ C7. 04 24, 0000003C(d)
        call    fifo8_init                              ; 01BC _ E8, FFFFFFFC(rel)
        call    timer_alloc                             ; 01C1 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-34H], eax                    ; 01C6 _ 89. 45, CC
        mov     dword [esp+8H], 1                       ; 01C9 _ C7. 44 24, 08, 00000001
        mov     dword [esp+4H], timerinfo2.1760         ; 01D1 _ C7. 44 24, 04, 0000003C(d)
        mov     eax, dword [ebp-34H]                    ; 01D9 _ 8B. 45, CC
        mov     dword [esp], eax                        ; 01DC _ 89. 04 24
        call    timer_init                              ; 01DF _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 300                     ; 01E4 _ C7. 44 24, 04, 0000012C
        mov     eax, dword [ebp-34H]                    ; 01EC _ 8B. 45, CC
        mov     dword [esp], eax                        ; 01EF _ 89. 04 24
        call    timer_settime                           ; 01F2 _ E8, FFFFFFFC(rel)
        mov     dword [esp+0CH], 0                      ; 01F7 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], timerbuf3.1764          ; 01FF _ C7. 44 24, 08, 0000007C(d)
        mov     dword [esp+4H], 8                       ; 0207 _ C7. 44 24, 04, 00000008
        mov     dword [esp], timerinfo3.1761            ; 020F _ C7. 04 24, 00000060(d)
        call    fifo8_init                              ; 0216 _ E8, FFFFFFFC(rel)
        call    timer_alloc                             ; 021B _ E8, FFFFFFFC(rel)
        mov     dword [ebp-30H], eax                    ; 0220 _ 89. 45, D0
        mov     dword [esp+8H], 1                       ; 0223 _ C7. 44 24, 08, 00000001
        mov     dword [esp+4H], timerinfo3.1761         ; 022B _ C7. 44 24, 04, 00000060(d)
        mov     eax, dword [ebp-30H]                    ; 0233 _ 8B. 45, D0
        mov     dword [esp], eax                        ; 0236 _ 89. 04 24
        call    timer_init                              ; 0239 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 50                      ; 023E _ C7. 44 24, 04, 00000032
        mov     eax, dword [ebp-30H]                    ; 0246 _ 8B. 45, D0
        mov     dword [esp], eax                        ; 0249 _ 89. 04 24
        call    timer_settime                           ; 024C _ E8, FFFFFFFC(rel)
        call    io_sti                                  ; 0251 _ E8, FFFFFFFC(rel)
        mov     eax, dword [back_buf]                   ; 0256 _ A1, 00000000(d)
        mov     edx, dword [ebp-40H]                    ; 025B _ 8B. 55, C0
        mov     dword [esp+8H], edx                     ; 025E _ 89. 54 24, 08
        mov     edx, dword [ebp-44H]                    ; 0262 _ 8B. 55, BC
        mov     dword [esp+4H], edx                     ; 0265 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0269 _ 89. 04 24
        call    init_desktop                            ; 026C _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 99                      ; 0271 _ C7. 44 24, 04, 00000063
        mov     dword [esp], mouse_cursor_buf           ; 0279 _ C7. 04 24, 00000000(d)
        call    init_mouse_cursor                       ; 0280 _ E8, FFFFFFFC(rel)
        mov     edx, dword [back_sheet]                 ; 0285 _ 8B. 15, 00000010(d)
        mov     eax, dword [sheet_control]              ; 028B _ A1, 0000000C(d)
        mov     dword [esp+0CH], 0                      ; 0290 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 0                       ; 0298 _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], edx                     ; 02A0 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 02A4 _ 89. 04 24
        call    sheet_slide                             ; 02A7 _ E8, FFFFFFFC(rel)
        mov     ebx, dword [mouse_y]                    ; 02AC _ 8B. 1D, 00000000(d)
        mov     ecx, dword [mouse_x]                    ; 02B2 _ 8B. 0D, 00000000(d)
        mov     edx, dword [mouse_sheet]                ; 02B8 _ 8B. 15, 00000014(d)
        mov     eax, dword [sheet_control]              ; 02BE _ A1, 0000000C(d)
        mov     dword [esp+0CH], ebx                    ; 02C3 _ 89. 5C 24, 0C
        mov     dword [esp+8H], ecx                     ; 02C7 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 02CB _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 02CF _ 89. 04 24
        call    sheet_slide                             ; 02D2 _ E8, FFFFFFFC(rel)
        mov     eax, dword [sheet_control]              ; 02D7 _ A1, 0000000C(d)
        mov     dword [esp+4H], ?_230                   ; 02DC _ C7. 44 24, 04, 00000000(d)
        mov     dword [esp], eax                        ; 02E4 _ 89. 04 24
        call    message_box                             ; 02E7 _ E8, FFFFFFFC(rel)
        mov     dword [sheet_win], eax                  ; 02EC _ A3, 00000000(d)
        mov     edx, dword [back_sheet]                 ; 02F1 _ 8B. 15, 00000010(d)
        mov     eax, dword [sheet_control]              ; 02F7 _ A1, 0000000C(d)
        mov     dword [esp+8H], 0                       ; 02FC _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], edx                     ; 0304 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0308 _ 89. 04 24
        call    sheet_updown                            ; 030B _ E8, FFFFFFFC(rel)
        mov     edx, dword [mouse_sheet]                ; 0310 _ 8B. 15, 00000014(d)
        mov     eax, dword [sheet_control]              ; 0316 _ A1, 0000000C(d)
        mov     dword [esp+8H], 100                     ; 031B _ C7. 44 24, 08, 00000064
        mov     dword [esp+4H], edx                     ; 0323 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0327 _ 89. 04 24
        call    sheet_updown                            ; 032A _ E8, FFFFFFFC(rel)
        call    enable_mouse                            ; 032F _ E8, FFFFFFFC(rel)
        call    get_code32_addr                         ; 0334 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-2CH], eax                    ; 0339 _ 89. 45, D4
        call    get_addr_gdt                            ; 033C _ E8, FFFFFFFC(rel)
        mov     dword [ebp-28H], eax                    ; 0341 _ 89. 45, D8
        mov     eax, dword [memman]                     ; 0344 _ A1, 00000004(d)
        mov     dword [esp], eax                        ; 0349 _ 89. 04 24
        call    task_init                               ; 034C _ E8, FFFFFFFC(rel)
        mov     dword [task_a], eax                     ; 0351 _ A3, 00000008(d)
        mov     eax, dword [task_a]                     ; 0356 _ A1, 00000008(d)
        mov     dword [keyinfo+18H], eax                ; 035B _ A3, 00000018(d)
        mov     eax, dword [task_a]                     ; 0360 _ A1, 00000008(d)
        mov     dword [task_main], eax                  ; 0365 _ A3, 00000004(d)
        mov     eax, dword [task_a]                     ; 036A _ A1, 00000008(d)
        mov     dword [esp+8H], 0                       ; 036F _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], 0                       ; 0377 _ C7. 44 24, 04, 00000000
        mov     dword [esp], eax                        ; 037F _ 89. 04 24
        call    task_run                                ; 0382 _ E8, FFFFFFFC(rel)
        call    launch_console                          ; 0387 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-24H], eax                    ; 038C _ 89. 45, DC
        mov     dword [ebp-20H], 0                      ; 038F _ C7. 45, E0, 00000000
        mov     dword [ebp-1CH], 0                      ; 0396 _ C7. 45, E4, 00000000
        mov     dword [ebp-18H], 0                      ; 039D _ C7. 45, E8, 00000000
        mov     dword [ebp-58H], 8                      ; 03A4 _ C7. 45, A8, 00000008
        mov     dword [ebp-54H], 7                      ; 03AB _ C7. 45, AC, 00000007
        mov     dword [ebp-14H], 0                      ; 03B2 _ C7. 45, EC, 00000000
        mov     dword [ebp-50H], 0                      ; 03B9 _ C7. 45, B0, 00000000
        mov     dword [ebp-10H], 0                      ; 03C0 _ C7. 45, F0, 00000000
?_001:  call    io_cli                                  ; 03C7 _ E8, FFFFFFFC(rel)
        mov     dword [esp], keyinfo                    ; 03CC _ C7. 04 24, 00000000(d)
        call    fifo8_status                            ; 03D3 _ E8, FFFFFFFC(rel)
        mov     ebx, eax                                ; 03D8 _ 89. C3
        mov     dword [esp], mouseinfo                  ; 03DA _ C7. 04 24, 00000000(d)
        call    fifo8_status                            ; 03E1 _ E8, FFFFFFFC(rel)
        add     ebx, eax                                ; 03E6 _ 01. C3
        mov     dword [esp], timerinfo1.1759            ; 03E8 _ C7. 04 24, 00000018(d)
        call    fifo8_status                            ; 03EF _ E8, FFFFFFFC(rel)
        add     ebx, eax                                ; 03F4 _ 01. C3
        mov     dword [esp], timerinfo2.1760            ; 03F6 _ C7. 04 24, 0000003C(d)
        call    fifo8_status                            ; 03FD _ E8, FFFFFFFC(rel)
        add     ebx, eax                                ; 0402 _ 01. C3
        mov     dword [esp], timerinfo3.1761            ; 0404 _ C7. 04 24, 00000060(d)
        call    fifo8_status                            ; 040B _ E8, FFFFFFFC(rel)
        add     eax, ebx                                ; 0410 _ 01. D8
        test    eax, eax                                ; 0412 _ 85. C0
        jnz     ?_002                                   ; 0414 _ 75, 0A
        call    io_sti                                  ; 0416 _ E8, FFFFFFFC(rel)
        jmp     ?_010                                   ; 041B _ E9, 0000042B

?_002:  mov     dword [esp], keyinfo                    ; 0420 _ C7. 04 24, 00000000(d)
        call    fifo8_status                            ; 0427 _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 042C _ 85. C0
        je      ?_007                                   ; 042E _ 0F 84, 000003A0
        call    io_sti                                  ; 0434 _ E8, FFFFFFFC(rel)
        mov     dword [esp], keyinfo                    ; 0439 _ C7. 04 24, 00000000(d)
        call    fifo8_get                               ; 0440 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-20H], eax                    ; 0445 _ 89. 45, E0
        cmp     dword [ebp-20H], 28                     ; 0448 _ 83. 7D, E0, 1C
        je      ?_010                                   ; 044C _ 0F 84, 000003F9
        cmp     dword [ebp-20H], 15                     ; 0452 _ 83. 7D, E0, 0F
        jne     ?_005                                   ; 0456 _ 0F 85, 000001A5
        mov     dword [ebp-4CH], -1                     ; 045C _ C7. 45, B4, FFFFFFFF
        cmp     dword [ebp-50H], 0                      ; 0463 _ 83. 7D, B0, 00
        jne     ?_003                                   ; 0467 _ 0F 85, 00000089
        mov     dword [ebp-50H], 1                      ; 046D _ C7. 45, B0, 00000001
        mov     edx, dword [sheet_win]                  ; 0474 _ 8B. 15, 00000000(d)
        mov     eax, dword [sheet_control]              ; 047A _ A1, 0000000C(d)
        mov     dword [esp+0CH], 0                      ; 047F _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], ?_230                   ; 0487 _ C7. 44 24, 08, 00000000(d)
        mov     dword [esp+4H], edx                     ; 048F _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0493 _ 89. 04 24
        call    make_window_title                       ; 0496 _ E8, FFFFFFFC(rel)
        mov     eax, dword [sheet_control]              ; 049B _ A1, 0000000C(d)
        mov     dword [esp+0CH], 1                      ; 04A0 _ C7. 44 24, 0C, 00000001
        mov     dword [esp+8H], ?_231                   ; 04A8 _ C7. 44 24, 08, 00000007(d)
        mov     edx, dword [ebp-24H]                    ; 04B0 _ 8B. 55, DC
        mov     dword [esp+4H], edx                     ; 04B3 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 04B7 _ 89. 04 24
        call    make_window_title                       ; 04BA _ E8, FFFFFFFC(rel)
        mov     edx, dword [sheet_win]                  ; 04BF _ 8B. 15, 00000000(d)
        mov     eax, dword [sheet_control]              ; 04C5 _ A1, 0000000C(d)
        mov     dword [esp+10H], 7                      ; 04CA _ C7. 44 24, 10, 00000007
        mov     dword [esp+0CH], 28                     ; 04D2 _ C7. 44 24, 0C, 0000001C
        mov     ecx, dword [ebp-58H]                    ; 04DA _ 8B. 4D, A8
        mov     dword [esp+8H], ecx                     ; 04DD _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 04E1 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 04E5 _ 89. 04 24
        call    set_cursor                              ; 04E8 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-4CH], 87                     ; 04ED _ C7. 45, B4, 00000057
        jmp     ?_004                                   ; 04F4 _ EB, 71

?_003:  mov     dword [ebp-50H], 0                      ; 04F6 _ C7. 45, B0, 00000000
        mov     edx, dword [sheet_win]                  ; 04FD _ 8B. 15, 00000000(d)
        mov     eax, dword [sheet_control]              ; 0503 _ A1, 0000000C(d)
        mov     dword [esp+0CH], 1                      ; 0508 _ C7. 44 24, 0C, 00000001
        mov     dword [esp+8H], ?_230                   ; 0510 _ C7. 44 24, 08, 00000000(d)
        mov     dword [esp+4H], edx                     ; 0518 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 051C _ 89. 04 24
        call    make_window_title                       ; 051F _ E8, FFFFFFFC(rel)
        mov     eax, dword [sheet_control]              ; 0524 _ A1, 0000000C(d)
        mov     dword [esp+0CH], 0                      ; 0529 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], ?_231                   ; 0531 _ C7. 44 24, 08, 00000007(d)
        mov     edx, dword [ebp-24H]                    ; 0539 _ 8B. 55, DC
        mov     dword [esp+4H], edx                     ; 053C _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0540 _ 89. 04 24
        call    make_window_title                       ; 0543 _ E8, FFFFFFFC(rel)
        mov     eax, dword [task_console_g]             ; 0548 _ A1, 00000000(d)
        add     eax, 16                                 ; 054D _ 83. C0, 10
        mov     dword [esp+4H], 88                      ; 0550 _ C7. 44 24, 04, 00000058
        mov     dword [esp], eax                        ; 0558 _ 89. 04 24
        call    fifo8_put                               ; 055B _ E8, FFFFFFFC(rel)
        mov     dword [ebp-4CH], 88                     ; 0560 _ C7. 45, B4, 00000058
?_004:  mov     eax, dword [sheet_win]                  ; 0567 _ A1, 00000000(d)
        mov     ebx, dword [eax+8H]                     ; 056C _ 8B. 58, 08
        mov     eax, dword [sheet_win]                  ; 056F _ A1, 00000000(d)
        mov     ecx, dword [eax+4H]                     ; 0574 _ 8B. 48, 04
        mov     edx, dword [sheet_win]                  ; 0577 _ 8B. 15, 00000000(d)
        mov     eax, dword [sheet_control]              ; 057D _ A1, 0000000C(d)
        mov     dword [esp+14H], ebx                    ; 0582 _ 89. 5C 24, 14
        mov     dword [esp+10H], ecx                    ; 0586 _ 89. 4C 24, 10
        mov     dword [esp+0CH], 0                      ; 058A _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 0                       ; 0592 _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], edx                     ; 059A _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 059E _ 89. 04 24
        call    sheet_refresh                           ; 05A1 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-24H]                    ; 05A6 _ 8B. 45, DC
        mov     ecx, dword [eax+8H]                     ; 05A9 _ 8B. 48, 08
        mov     eax, dword [ebp-24H]                    ; 05AC _ 8B. 45, DC
        mov     edx, dword [eax+4H]                     ; 05AF _ 8B. 50, 04
        mov     eax, dword [sheet_control]              ; 05B2 _ A1, 0000000C(d)
        mov     dword [esp+14H], ecx                    ; 05B7 _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 05BB _ 89. 54 24, 10
        mov     dword [esp+0CH], 0                      ; 05BF _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 0                       ; 05C7 _ C7. 44 24, 08, 00000000
        mov     edx, dword [ebp-24H]                    ; 05CF _ 8B. 55, DC
        mov     dword [esp+4H], edx                     ; 05D2 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 05D6 _ 89. 04 24
        call    sheet_refresh                           ; 05D9 _ E8, FFFFFFFC(rel)
        mov     edx, dword [task_console_g]             ; 05DE _ 8B. 15, 00000000(d)
        mov     eax, dword [task_a]                     ; 05E4 _ A1, 00000008(d)
        mov     ecx, dword [ebp-4CH]                    ; 05E9 _ 8B. 4D, B4
        mov     dword [esp+8H], ecx                     ; 05EC _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 05F0 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 05F4 _ 89. 04 24
        call    task_send_message                       ; 05F7 _ E8, FFFFFFFC(rel)
        jmp     ?_010                                   ; 05FC _ E9, 0000024A

?_005:  cmp     dword [ebp-50H], 0                      ; 0601 _ 83. 7D, B0, 00
        jne     ?_006                                   ; 0605 _ 0F 85, 00000178
        mov     eax, dword [ebp-20H]                    ; 060B _ 8B. 45, E0
        mov     dword [esp], eax                        ; 060E _ 89. 04 24
        call    transfer_scancode                       ; 0611 _ E8, FFFFFFFC(rel)
        test    al, al                                  ; 0616 _ 84. C0
        je      ?_010                                   ; 0618 _ 0F 84, 0000022D
        cmp     dword [ebp-58H], 143                    ; 061E _ 81. 7D, A8, 0000008F
        jg      ?_010                                   ; 0625 _ 0F 8F, 00000220
        mov     eax, dword [ebp-58H]                    ; 062B _ 8B. 45, A8
        lea     ecx, [eax+7H]                           ; 062E _ 8D. 48, 07
        mov     eax, dword [sheet_win]                  ; 0631 _ A1, 00000000(d)
        mov     edx, dword [eax+4H]                     ; 0636 _ 8B. 50, 04
        mov     eax, dword [sheet_win]                  ; 0639 _ A1, 00000000(d)
        mov     eax, dword [eax]                        ; 063E _ 8B. 00
        mov     dword [esp+18H], 43                     ; 0640 _ C7. 44 24, 18, 0000002B
        mov     dword [esp+14H], ecx                    ; 0648 _ 89. 4C 24, 14
        mov     dword [esp+10H], 28                     ; 064C _ C7. 44 24, 10, 0000001C
        mov     ecx, dword [ebp-58H]                    ; 0654 _ 8B. 4D, A8
        mov     dword [esp+0CH], ecx                    ; 0657 _ 89. 4C 24, 0C
        mov     dword [esp+8H], 7                       ; 065B _ C7. 44 24, 08, 00000007
        mov     dword [esp+4H], edx                     ; 0663 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0667 _ 89. 04 24
        call    paint_rectangle                         ; 066A _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-58H]                    ; 066F _ 8B. 45, A8
        lea     ecx, [eax+8H]                           ; 0672 _ 8D. 48, 08
        mov     edx, dword [sheet_win]                  ; 0675 _ 8B. 15, 00000000(d)
        mov     eax, dword [sheet_control]              ; 067B _ A1, 0000000C(d)
        mov     dword [esp+14H], 44                     ; 0680 _ C7. 44 24, 14, 0000002C
        mov     dword [esp+10H], ecx                    ; 0688 _ 89. 4C 24, 10
        mov     dword [esp+0CH], 28                     ; 068C _ C7. 44 24, 0C, 0000001C
        mov     ecx, dword [ebp-58H]                    ; 0694 _ 8B. 4D, A8
        mov     dword [esp+8H], ecx                     ; 0697 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 069B _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 069F _ 89. 04 24
        call    sheet_refresh                           ; 06A2 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-20H]                    ; 06A7 _ 8B. 45, E0
        mov     dword [esp], eax                        ; 06AA _ 89. 04 24
        call    transfer_scancode                       ; 06AD _ E8, FFFFFFFC(rel)
        mov     byte [ebp-5BH], al                      ; 06B2 _ 88. 45, A5
        movzx   eax, byte [ebp-5BH]                     ; 06B5 _ 0F B6. 45, A5
        mov     byte [ebp-5AH], al                      ; 06B9 _ 88. 45, A6
        mov     byte [ebp-59H], 0                       ; 06BC _ C6. 45, A7, 00
        mov     edx, dword [sheet_win]                  ; 06C0 _ 8B. 15, 00000000(d)
        mov     eax, dword [sheet_control]              ; 06C6 _ A1, 0000000C(d)
        mov     dword [esp+14H], 0                      ; 06CB _ C7. 44 24, 14, 00000000
        lea     ecx, [ebp-5AH]                          ; 06D3 _ 8D. 4D, A6
        mov     dword [esp+10H], ecx                    ; 06D6 _ 89. 4C 24, 10
        mov     dword [esp+0CH], 28                     ; 06DA _ C7. 44 24, 0C, 0000001C
        mov     ecx, dword [ebp-58H]                    ; 06E2 _ 8B. 4D, A8
        mov     dword [esp+8H], ecx                     ; 06E5 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 06E9 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 06ED _ 89. 04 24
        call    paint_string                            ; 06F0 _ E8, FFFFFFFC(rel)
        add     dword [ebp-58H], 8                      ; 06F5 _ 83. 45, A8, 08
        mov     dword [ebp-10H], 1                      ; 06F9 _ C7. 45, F0, 00000001
        mov     eax, dword [ebp-58H]                    ; 0700 _ 8B. 45, A8
        lea     ebx, [eax+7H]                           ; 0703 _ 8D. 58, 07
        mov     eax, dword [ebp-54H]                    ; 0706 _ 8B. 45, AC
        movzx   ecx, al                                 ; 0709 _ 0F B6. C8
        mov     eax, dword [sheet_win]                  ; 070C _ A1, 00000000(d)
        mov     edx, dword [eax+4H]                     ; 0711 _ 8B. 50, 04
        mov     eax, dword [sheet_win]                  ; 0714 _ A1, 00000000(d)
        mov     eax, dword [eax]                        ; 0719 _ 8B. 00
        mov     dword [esp+18H], 43                     ; 071B _ C7. 44 24, 18, 0000002B
        mov     dword [esp+14H], ebx                    ; 0723 _ 89. 5C 24, 14
        mov     dword [esp+10H], 28                     ; 0727 _ C7. 44 24, 10, 0000001C
        mov     ebx, dword [ebp-58H]                    ; 072F _ 8B. 5D, A8
        mov     dword [esp+0CH], ebx                    ; 0732 _ 89. 5C 24, 0C
        mov     dword [esp+8H], ecx                     ; 0736 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 073A _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 073E _ 89. 04 24
        call    paint_rectangle                         ; 0741 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-58H]                    ; 0746 _ 8B. 45, A8
        lea     ecx, [eax+8H]                           ; 0749 _ 8D. 48, 08
        mov     edx, dword [sheet_win]                  ; 074C _ 8B. 15, 00000000(d)
        mov     eax, dword [sheet_control]              ; 0752 _ A1, 0000000C(d)
        mov     dword [esp+14H], 44                     ; 0757 _ C7. 44 24, 14, 0000002C
        mov     dword [esp+10H], ecx                    ; 075F _ 89. 4C 24, 10
        mov     dword [esp+0CH], 28                     ; 0763 _ C7. 44 24, 0C, 0000001C
        mov     ecx, dword [ebp-58H]                    ; 076B _ 8B. 4D, A8
        mov     dword [esp+8H], ecx                     ; 076E _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 0772 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0776 _ 89. 04 24
        call    sheet_refresh                           ; 0779 _ E8, FFFFFFFC(rel)
        jmp     ?_010                                   ; 077E _ E9, 000000C8

?_006:  mov     eax, dword [ebp-20H]                    ; 0783 _ 8B. 45, E0
        mov     dword [esp], eax                        ; 0786 _ 89. 04 24
        call    is_special_key                          ; 0789 _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 078E _ 85. C0
        jne     ?_010                                   ; 0790 _ 0F 85, 000000B5
        mov     eax, dword [ebp-20H]                    ; 0796 _ 8B. 45, E0
        movzx   eax, al                                 ; 0799 _ 0F B6. C0
        mov     edx, dword [task_console_g]             ; 079C _ 8B. 15, 00000000(d)
        add     edx, 16                                 ; 07A2 _ 83. C2, 10
        mov     dword [esp+4H], eax                     ; 07A5 _ 89. 44 24, 04
        mov     dword [esp], edx                        ; 07A9 _ 89. 14 24
        call    fifo8_put                               ; 07AC _ E8, FFFFFFFC(rel)
        mov     dword [esp], keyinfo                    ; 07B1 _ C7. 04 24, 00000000(d)
        call    fifo8_status                            ; 07B8 _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 07BD _ 85. C0
        jne     ?_010                                   ; 07BF _ 0F 85, 00000086
        mov     eax, dword [task_a]                     ; 07C5 _ A1, 00000008(d)
        mov     dword [esp], eax                        ; 07CA _ 89. 04 24
        call    task_sleep                              ; 07CD _ E8, FFFFFFFC(rel)
        jmp     ?_010                                   ; 07D2 _ EB, 77

?_007:  mov     dword [esp], mouseinfo                  ; 07D4 _ C7. 04 24, 00000000(d)
        call    fifo8_status                            ; 07DB _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 07E0 _ 85. C0
        jz      ?_008                                   ; 07E2 _ 74, 23
        mov     ecx, dword [mouse_sheet]                ; 07E4 _ 8B. 0D, 00000014(d)
        mov     edx, dword [back_sheet]                 ; 07EA _ 8B. 15, 00000010(d)
        mov     eax, dword [sheet_control]              ; 07F0 _ A1, 0000000C(d)
        mov     dword [esp+8H], ecx                     ; 07F5 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 07F9 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 07FD _ 89. 04 24
        call    show_mouse_info                         ; 0800 _ E8, FFFFFFFC(rel)
        jmp     ?_010                                   ; 0805 _ EB, 44

?_008:  mov     dword [esp], timerinfo1.1759            ; 0807 _ C7. 04 24, 00000018(d)
        call    fifo8_status                            ; 080E _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 0813 _ 85. C0
        jz      ?_009                                   ; 0815 _ 74, 13
        call    io_sti                                  ; 0817 _ E8, FFFFFFFC(rel)
        mov     dword [esp], timerinfo1.1759            ; 081C _ C7. 04 24, 00000018(d)
        call    fifo8_get                               ; 0823 _ E8, FFFFFFFC(rel)
        jmp     ?_010                                   ; 0828 _ EB, 21

?_009:  mov     dword [esp], timerinfo2.1760            ; 082A _ C7. 04 24, 0000003C(d)
        call    fifo8_status                            ; 0831 _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 0836 _ 85. C0
        jz      ?_010                                   ; 0838 _ 74, 11
        call    io_sti                                  ; 083A _ E8, FFFFFFFC(rel)
        mov     dword [esp], timerinfo2.1760            ; 083F _ C7. 04 24, 0000003C(d)
        call    fifo8_get                               ; 0846 _ E8, FFFFFFFC(rel)
?_010:  mov     dword [esp], timerinfo3.1761            ; 084B _ C7. 04 24, 00000060(d)
        call    fifo8_status                            ; 0852 _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 0857 _ 85. C0
        je      ?_014                                   ; 0859 _ 0F 84, 000000DB
        mov     dword [esp], timerinfo3.1761            ; 085F _ C7. 04 24, 00000060(d)
        call    fifo8_get                               ; 0866 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 086B _ 89. 45, F4
        call    io_sti                                  ; 086E _ E8, FFFFFFFC(rel)
        cmp     dword [ebp-0CH], 0                      ; 0873 _ 83. 7D, F4, 00
        jz      ?_011                                   ; 0877 _ 74, 24
        mov     dword [esp+8H], 0                       ; 0879 _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], timerinfo3.1761         ; 0881 _ C7. 44 24, 04, 00000060(d)
        mov     eax, dword [ebp-30H]                    ; 0889 _ 8B. 45, D0
        mov     dword [esp], eax                        ; 088C _ 89. 04 24
        call    timer_init                              ; 088F _ E8, FFFFFFFC(rel)
        mov     dword [ebp-54H], 0                      ; 0894 _ C7. 45, AC, 00000000
        jmp     ?_012                                   ; 089B _ EB, 22

?_011:  mov     dword [esp+8H], 1                       ; 089D _ C7. 44 24, 08, 00000001
        mov     dword [esp+4H], timerinfo3.1761         ; 08A5 _ C7. 44 24, 04, 00000060(d)
        mov     eax, dword [ebp-30H]                    ; 08AD _ 8B. 45, D0
        mov     dword [esp], eax                        ; 08B0 _ 89. 04 24
        call    timer_init                              ; 08B3 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-54H], 7                      ; 08B8 _ C7. 45, AC, 00000007
?_012:  mov     dword [esp+4H], 50                      ; 08BF _ C7. 44 24, 04, 00000032
        mov     eax, dword [ebp-30H]                    ; 08C7 _ 8B. 45, D0
        mov     dword [esp], eax                        ; 08CA _ 89. 04 24
        call    timer_settime                           ; 08CD _ E8, FFFFFFFC(rel)
        cmp     dword [ebp-50H], 0                      ; 08D2 _ 83. 7D, B0, 00
        jnz     ?_013                                   ; 08D6 _ 75, 2F
        mov     edx, dword [sheet_win]                  ; 08D8 _ 8B. 15, 00000000(d)
        mov     eax, dword [sheet_control]              ; 08DE _ A1, 0000000C(d)
        mov     ecx, dword [ebp-54H]                    ; 08E3 _ 8B. 4D, AC
        mov     dword [esp+10H], ecx                    ; 08E6 _ 89. 4C 24, 10
        mov     dword [esp+0CH], 28                     ; 08EA _ C7. 44 24, 0C, 0000001C
        mov     ecx, dword [ebp-58H]                    ; 08F2 _ 8B. 4D, A8
        mov     dword [esp+8H], ecx                     ; 08F5 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 08F9 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 08FD _ 89. 04 24
        call    set_cursor                              ; 0900 _ E8, FFFFFFFC(rel)
        jmp     ?_014                                   ; 0905 _ EB, 33

?_013:  mov     edx, dword [sheet_win]                  ; 0907 _ 8B. 15, 00000000(d)
        mov     eax, dword [sheet_control]              ; 090D _ A1, 0000000C(d)
        mov     dword [esp+10H], 7                      ; 0912 _ C7. 44 24, 10, 00000007
        mov     dword [esp+0CH], 28                     ; 091A _ C7. 44 24, 0C, 0000001C
        mov     ecx, dword [ebp-58H]                    ; 0922 _ 8B. 4D, A8
        mov     dword [esp+8H], ecx                     ; 0925 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 0929 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 092D _ 89. 04 24
        call    set_cursor                              ; 0930 _ E8, FFFFFFFC(rel)
        jmp     ?_001                                   ; 0935 _ E9, FFFFFA8D

?_014:  jmp     ?_001                                   ; 093A _ E9, FFFFFA88
; CMain End of function

task_b_main:; Function begin
        push    ebp                                     ; 093F _ 55
        mov     ebp, esp                                ; 0940 _ 89. E5
        sub     esp, 104                                ; 0942 _ 83. EC, 68
        mov     eax, dword [ebp+8H]                     ; 0945 _ 8B. 45, 08
        mov     dword [ebp-4CH], eax                    ; 0948 _ 89. 45, B4
; Note: Absolute memory address without relocation
        mov     eax, dword [gs:14H]                     ; 094B _ 65: A1, 00000014
        mov     dword [ebp-0CH], eax                    ; 0951 _ 89. 45, F4
        xor     eax, eax                                ; 0954 _ 31. C0
        mov     edx, dword [back_sheet]                 ; 0956 _ 8B. 15, 00000010(d)
        mov     eax, dword [sheet_control]              ; 095C _ A1, 0000000C(d)
        mov     dword [esp+14H], 7                      ; 0961 _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_232                  ; 0969 _ C7. 44 24, 10, 0000000F(d)
        mov     dword [esp+0CH], 160                    ; 0971 _ C7. 44 24, 0C, 000000A0
        mov     dword [esp+8H], 0                       ; 0979 _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], edx                     ; 0981 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0985 _ 89. 04 24
        call    paint_string                            ; 0988 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-38H], 0                      ; 098D _ C7. 45, C8, 00000000
        mov     dword [ebp-34H], 0                      ; 0994 _ C7. 45, CC, 00000000
        mov     dword [esp+0CH], 0                      ; 099B _ C7. 44 24, 0C, 00000000
        lea     eax, [ebp-14H]                          ; 09A3 _ 8D. 45, EC
        mov     dword [esp+8H], eax                     ; 09A6 _ 89. 44 24, 08
        mov     dword [esp+4H], 8                       ; 09AA _ C7. 44 24, 04, 00000008
        lea     eax, [ebp-30H]                          ; 09B2 _ 8D. 45, D0
        mov     dword [esp], eax                        ; 09B5 _ 89. 04 24
        call    fifo8_init                              ; 09B8 _ E8, FFFFFFFC(rel)
        call    timer_alloc                             ; 09BD _ E8, FFFFFFFC(rel)
        mov     dword [ebp-38H], eax                    ; 09C2 _ 89. 45, C8
        mov     dword [esp+8H], 123                     ; 09C5 _ C7. 44 24, 08, 0000007B
        lea     eax, [ebp-30H]                          ; 09CD _ 8D. 45, D0
        mov     dword [esp+4H], eax                     ; 09D0 _ 89. 44 24, 04
        mov     eax, dword [ebp-38H]                    ; 09D4 _ 8B. 45, C8
        mov     dword [esp], eax                        ; 09D7 _ 89. 04 24
        call    timer_init                              ; 09DA _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 100                     ; 09DF _ C7. 44 24, 04, 00000064
        mov     eax, dword [ebp-38H]                    ; 09E7 _ 8B. 45, C8
        mov     dword [esp], eax                        ; 09EA _ 89. 04 24
        call    timer_settime                           ; 09ED _ E8, FFFFFFFC(rel)
        mov     dword [ebp-40H], 0                      ; 09F2 _ C7. 45, C0, 00000000
        mov     dword [ebp-3CH], 0                      ; 09F9 _ C7. 45, C4, 00000000
?_015:  add     dword [ebp-40H], 1                      ; 0A00 _ 83. 45, C0, 01
        call    io_cli                                  ; 0A04 _ E8, FFFFFFFC(rel)
        lea     eax, [ebp-30H]                          ; 0A09 _ 8D. 45, D0
        mov     dword [esp], eax                        ; 0A0C _ 89. 04 24
        call    fifo8_status                            ; 0A0F _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 0A14 _ 85. C0
        jnz     ?_016                                   ; 0A16 _ 75, 07
        call    io_sti                                  ; 0A18 _ E8, FFFFFFFC(rel)
        jmp     ?_017                                   ; 0A1D _ EB, 6B

?_016:  lea     eax, [ebp-30H]                          ; 0A1F _ 8D. 45, D0
        mov     dword [esp], eax                        ; 0A22 _ 89. 04 24
        call    fifo8_get                               ; 0A25 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-34H], eax                    ; 0A2A _ 89. 45, CC
        call    io_sti                                  ; 0A2D _ E8, FFFFFFFC(rel)
        cmp     dword [ebp-34H], 123                    ; 0A32 _ 83. 7D, CC, 7B
        jnz     ?_017                                   ; 0A36 _ 75, 52
        mov     edx, dword [back_sheet]                 ; 0A38 _ 8B. 15, 00000010(d)
        mov     eax, dword [sheet_control]              ; 0A3E _ A1, 0000000C(d)
        mov     dword [esp+14H], 7                      ; 0A43 _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_233                  ; 0A4B _ C7. 44 24, 10, 0000001C(d)
        mov     dword [esp+0CH], 176                    ; 0A53 _ C7. 44 24, 0C, 000000B0
        mov     ecx, dword [ebp-3CH]                    ; 0A5B _ 8B. 4D, C4
        mov     dword [esp+8H], ecx                     ; 0A5E _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 0A62 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0A66 _ 89. 04 24
        call    paint_string                            ; 0A69 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 100                     ; 0A6E _ C7. 44 24, 04, 00000064
        mov     eax, dword [ebp-38H]                    ; 0A76 _ 8B. 45, C8
        mov     dword [esp], eax                        ; 0A79 _ 89. 04 24
        call    timer_settime                           ; 0A7C _ E8, FFFFFFFC(rel)
        add     dword [ebp-3CH], 8                      ; 0A81 _ 83. 45, C4, 08
        jmp     ?_015                                   ; 0A85 _ E9, FFFFFF76

?_017:  jmp     ?_015                                   ; 0A8A _ E9, FFFFFF71
; task_b_main End of function

init_screeninfo:; Function begin
        push    ebp                                     ; 0A8F _ 55
        mov     ebp, esp                                ; 0A90 _ 89. E5
        mov     eax, dword [VRAM_ADDRESS]               ; 0A92 _ A1, 00000000(d)
        mov     edx, eax                                ; 0A97 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0A99 _ 8B. 45, 08
        mov     dword [eax], edx                        ; 0A9C _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 0A9E _ 8B. 45, 08
; Note: Length-changing prefix causes delay on Intel processors
        mov     word [eax+4H], 640                      ; 0AA1 _ 66: C7. 40, 04, 0280
        mov     eax, dword [ebp+8H]                     ; 0AA7 _ 8B. 45, 08
; Note: Length-changing prefix causes delay on Intel processors
        mov     word [eax+6H], 480                      ; 0AAA _ 66: C7. 40, 06, 01E0
        pop     ebp                                     ; 0AB0 _ 5D
        ret                                             ; 0AB1 _ C3
; init_screeninfo End of function

init_palette:; Function begin
        push    ebp                                     ; 0AB2 _ 55
        mov     ebp, esp                                ; 0AB3 _ 89. E5
        sub     esp, 24                                 ; 0AB5 _ 83. EC, 18
        mov     dword [esp+8H], table_rgb.1758          ; 0AB8 _ C7. 44 24, 08, 00000120(d)
        mov     dword [esp+4H], 15                      ; 0AC0 _ C7. 44 24, 04, 0000000F
        mov     dword [esp], 0                          ; 0AC8 _ C7. 04 24, 00000000
        call    set_palette                             ; 0ACF _ E8, FFFFFFFC(rel)
        nop                                             ; 0AD4 _ 90
        leave                                           ; 0AD5 _ C9
        ret                                             ; 0AD6 _ C3
; init_palette End of function

set_palette:; Function begin
        push    ebp                                     ; 0AD7 _ 55
        mov     ebp, esp                                ; 0AD8 _ 89. E5
        sub     esp, 40                                 ; 0ADA _ 83. EC, 28
        call    io_load_eflags                          ; 0ADD _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 0AE2 _ 89. 45, F4
        call    io_cli                                  ; 0AE5 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 0AEA _ 8B. 45, 08
        mov     dword [esp+4H], eax                     ; 0AED _ 89. 44 24, 04
        mov     dword [esp], 968                        ; 0AF1 _ C7. 04 24, 000003C8
        call    io_out8                                 ; 0AF8 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 0AFD _ 8B. 45, 08
        mov     dword [ebp-10H], eax                    ; 0B00 _ 89. 45, F0
        jmp     ?_019                                   ; 0B03 _ EB, 62

?_018:  mov     eax, dword [ebp+10H]                    ; 0B05 _ 8B. 45, 10
        movzx   eax, byte [eax]                         ; 0B08 _ 0F B6. 00
        shr     al, 2                                   ; 0B0B _ C0. E8, 02
        movzx   eax, al                                 ; 0B0E _ 0F B6. C0
        mov     dword [esp+4H], eax                     ; 0B11 _ 89. 44 24, 04
        mov     dword [esp], 969                        ; 0B15 _ C7. 04 24, 000003C9
        call    io_out8                                 ; 0B1C _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0B21 _ 8B. 45, 10
        add     eax, 1                                  ; 0B24 _ 83. C0, 01
        movzx   eax, byte [eax]                         ; 0B27 _ 0F B6. 00
        shr     al, 2                                   ; 0B2A _ C0. E8, 02
        movzx   eax, al                                 ; 0B2D _ 0F B6. C0
        mov     dword [esp+4H], eax                     ; 0B30 _ 89. 44 24, 04
        mov     dword [esp], 969                        ; 0B34 _ C7. 04 24, 000003C9
        call    io_out8                                 ; 0B3B _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0B40 _ 8B. 45, 10
        add     eax, 2                                  ; 0B43 _ 83. C0, 02
        movzx   eax, byte [eax]                         ; 0B46 _ 0F B6. 00
        shr     al, 2                                   ; 0B49 _ C0. E8, 02
        movzx   eax, al                                 ; 0B4C _ 0F B6. C0
        mov     dword [esp+4H], eax                     ; 0B4F _ 89. 44 24, 04
        mov     dword [esp], 969                        ; 0B53 _ C7. 04 24, 000003C9
        call    io_out8                                 ; 0B5A _ E8, FFFFFFFC(rel)
        add     dword [ebp+10H], 3                      ; 0B5F _ 83. 45, 10, 03
        add     dword [ebp-10H], 1                      ; 0B63 _ 83. 45, F0, 01
?_019:  mov     eax, dword [ebp-10H]                    ; 0B67 _ 8B. 45, F0
        cmp     eax, dword [ebp+0CH]                    ; 0B6A _ 3B. 45, 0C
        jle     ?_018                                   ; 0B6D _ 7E, 96
        mov     eax, dword [ebp-0CH]                    ; 0B6F _ 8B. 45, F4
        mov     dword [esp], eax                        ; 0B72 _ 89. 04 24
        call    io_store_eflags                         ; 0B75 _ E8, FFFFFFFC(rel)
        nop                                             ; 0B7A _ 90
        leave                                           ; 0B7B _ C9
        ret                                             ; 0B7C _ C3
; set_palette End of function

paint_rectangle:; Function begin
        push    ebp                                     ; 0B7D _ 55
        mov     ebp, esp                                ; 0B7E _ 89. E5
        sub     esp, 20                                 ; 0B80 _ 83. EC, 14
        mov     eax, dword [ebp+10H]                    ; 0B83 _ 8B. 45, 10
        mov     byte [ebp-14H], al                      ; 0B86 _ 88. 45, EC
        mov     eax, dword [ebp+18H]                    ; 0B89 _ 8B. 45, 18
        mov     dword [ebp-4H], eax                     ; 0B8C _ 89. 45, FC
        jmp     ?_023                                   ; 0B8F _ EB, 33

?_020:  mov     eax, dword [ebp+14H]                    ; 0B91 _ 8B. 45, 14
        mov     dword [ebp-8H], eax                     ; 0B94 _ 89. 45, F8
        jmp     ?_022                                   ; 0B97 _ EB, 1F

?_021:  mov     eax, dword [ebp-4H]                     ; 0B99 _ 8B. 45, FC
        imul    eax, dword [ebp+0CH]                    ; 0B9C _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0BA0 _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 0BA2 _ 8B. 45, F8
        add     eax, edx                                ; 0BA5 _ 01. D0
        mov     edx, eax                                ; 0BA7 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0BA9 _ 8B. 45, 08
        add     edx, eax                                ; 0BAC _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0BAE _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0BB2 _ 88. 02
        add     dword [ebp-8H], 1                       ; 0BB4 _ 83. 45, F8, 01
?_022:  mov     eax, dword [ebp-8H]                     ; 0BB8 _ 8B. 45, F8
        cmp     eax, dword [ebp+1CH]                    ; 0BBB _ 3B. 45, 1C
        jle     ?_021                                   ; 0BBE _ 7E, D9
        add     dword [ebp-4H], 1                       ; 0BC0 _ 83. 45, FC, 01
?_023:  mov     eax, dword [ebp-4H]                     ; 0BC4 _ 8B. 45, FC
        cmp     eax, dword [ebp+20H]                    ; 0BC7 _ 3B. 45, 20
        jle     ?_020                                   ; 0BCA _ 7E, C5
        leave                                           ; 0BCC _ C9
        ret                                             ; 0BCD _ C3
; paint_rectangle End of function

init_desktop:; Function begin
        push    ebp                                     ; 0BCE _ 55
        mov     ebp, esp                                ; 0BCF _ 89. E5
        push    ebx                                     ; 0BD1 _ 53
        sub     esp, 28                                 ; 0BD2 _ 83. EC, 1C
        mov     eax, dword [ebp+10H]                    ; 0BD5 _ 8B. 45, 10
        lea     edx, [eax-1DH]                          ; 0BD8 _ 8D. 50, E3
        mov     eax, dword [ebp+0CH]                    ; 0BDB _ 8B. 45, 0C
        sub     eax, 1                                  ; 0BDE _ 83. E8, 01
        mov     dword [esp+18H], edx                    ; 0BE1 _ 89. 54 24, 18
        mov     dword [esp+14H], eax                    ; 0BE5 _ 89. 44 24, 14
        mov     dword [esp+10H], 0                      ; 0BE9 _ C7. 44 24, 10, 00000000
        mov     dword [esp+0CH], 0                      ; 0BF1 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 2                       ; 0BF9 _ C7. 44 24, 08, 00000002
        mov     eax, dword [ebp+0CH]                    ; 0C01 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0C04 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0C08 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0C0B _ 89. 04 24
        call    paint_rectangle                         ; 0C0E _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0C13 _ 8B. 45, 10
        lea     ecx, [eax-1CH]                          ; 0C16 _ 8D. 48, E4
        mov     eax, dword [ebp+0CH]                    ; 0C19 _ 8B. 45, 0C
        lea     edx, [eax-1H]                           ; 0C1C _ 8D. 50, FF
        mov     eax, dword [ebp+10H]                    ; 0C1F _ 8B. 45, 10
        sub     eax, 28                                 ; 0C22 _ 83. E8, 1C
        mov     dword [esp+18H], ecx                    ; 0C25 _ 89. 4C 24, 18
        mov     dword [esp+14H], edx                    ; 0C29 _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 0C2D _ 89. 44 24, 10
        mov     dword [esp+0CH], 0                      ; 0C31 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 8                       ; 0C39 _ C7. 44 24, 08, 00000008
        mov     eax, dword [ebp+0CH]                    ; 0C41 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0C44 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0C48 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0C4B _ 89. 04 24
        call    paint_rectangle                         ; 0C4E _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0C53 _ 8B. 45, 10
        lea     ecx, [eax-1BH]                          ; 0C56 _ 8D. 48, E5
        mov     eax, dword [ebp+0CH]                    ; 0C59 _ 8B. 45, 0C
        lea     edx, [eax-1H]                           ; 0C5C _ 8D. 50, FF
        mov     eax, dword [ebp+10H]                    ; 0C5F _ 8B. 45, 10
        sub     eax, 27                                 ; 0C62 _ 83. E8, 1B
        mov     dword [esp+18H], ecx                    ; 0C65 _ 89. 4C 24, 18
        mov     dword [esp+14H], edx                    ; 0C69 _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 0C6D _ 89. 44 24, 10
        mov     dword [esp+0CH], 0                      ; 0C71 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 7                       ; 0C79 _ C7. 44 24, 08, 00000007
        mov     eax, dword [ebp+0CH]                    ; 0C81 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0C84 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0C88 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0C8B _ 89. 04 24
        call    paint_rectangle                         ; 0C8E _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0C93 _ 8B. 45, 10
        lea     ecx, [eax-1H]                           ; 0C96 _ 8D. 48, FF
        mov     eax, dword [ebp+0CH]                    ; 0C99 _ 8B. 45, 0C
        lea     edx, [eax-1H]                           ; 0C9C _ 8D. 50, FF
        mov     eax, dword [ebp+10H]                    ; 0C9F _ 8B. 45, 10
        sub     eax, 26                                 ; 0CA2 _ 83. E8, 1A
        mov     dword [esp+18H], ecx                    ; 0CA5 _ 89. 4C 24, 18
        mov     dword [esp+14H], edx                    ; 0CA9 _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 0CAD _ 89. 44 24, 10
        mov     dword [esp+0CH], 0                      ; 0CB1 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 8                       ; 0CB9 _ C7. 44 24, 08, 00000008
        mov     eax, dword [ebp+0CH]                    ; 0CC1 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0CC4 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0CC8 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0CCB _ 89. 04 24
        call    paint_rectangle                         ; 0CCE _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0CD3 _ 8B. 45, 10
        lea     edx, [eax-18H]                          ; 0CD6 _ 8D. 50, E8
        mov     eax, dword [ebp+10H]                    ; 0CD9 _ 8B. 45, 10
        sub     eax, 24                                 ; 0CDC _ 83. E8, 18
        mov     dword [esp+18H], edx                    ; 0CDF _ 89. 54 24, 18
        mov     dword [esp+14H], 59                     ; 0CE3 _ C7. 44 24, 14, 0000003B
        mov     dword [esp+10H], eax                    ; 0CEB _ 89. 44 24, 10
        mov     dword [esp+0CH], 3                      ; 0CEF _ C7. 44 24, 0C, 00000003
        mov     dword [esp+8H], 7                       ; 0CF7 _ C7. 44 24, 08, 00000007
        mov     eax, dword [ebp+0CH]                    ; 0CFF _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0D02 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0D06 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0D09 _ 89. 04 24
        call    paint_rectangle                         ; 0D0C _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0D11 _ 8B. 45, 10
        lea     edx, [eax-4H]                           ; 0D14 _ 8D. 50, FC
        mov     eax, dword [ebp+10H]                    ; 0D17 _ 8B. 45, 10
        sub     eax, 24                                 ; 0D1A _ 83. E8, 18
        mov     dword [esp+18H], edx                    ; 0D1D _ 89. 54 24, 18
        mov     dword [esp+14H], 2                      ; 0D21 _ C7. 44 24, 14, 00000002
        mov     dword [esp+10H], eax                    ; 0D29 _ 89. 44 24, 10
        mov     dword [esp+0CH], 2                      ; 0D2D _ C7. 44 24, 0C, 00000002
        mov     dword [esp+8H], 7                       ; 0D35 _ C7. 44 24, 08, 00000007
        mov     eax, dword [ebp+0CH]                    ; 0D3D _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0D40 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0D44 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0D47 _ 89. 04 24
        call    paint_rectangle                         ; 0D4A _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0D4F _ 8B. 45, 10
        lea     edx, [eax-4H]                           ; 0D52 _ 8D. 50, FC
        mov     eax, dword [ebp+10H]                    ; 0D55 _ 8B. 45, 10
        sub     eax, 4                                  ; 0D58 _ 83. E8, 04
        mov     dword [esp+18H], edx                    ; 0D5B _ 89. 54 24, 18
        mov     dword [esp+14H], 59                     ; 0D5F _ C7. 44 24, 14, 0000003B
        mov     dword [esp+10H], eax                    ; 0D67 _ 89. 44 24, 10
        mov     dword [esp+0CH], 3                      ; 0D6B _ C7. 44 24, 0C, 00000003
        mov     dword [esp+8H], 2                       ; 0D73 _ C7. 44 24, 08, 00000002
        mov     eax, dword [ebp+0CH]                    ; 0D7B _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0D7E _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0D82 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0D85 _ 89. 04 24
        call    paint_rectangle                         ; 0D88 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0D8D _ 8B. 45, 10
        lea     edx, [eax-5H]                           ; 0D90 _ 8D. 50, FB
        mov     eax, dword [ebp+10H]                    ; 0D93 _ 8B. 45, 10
        sub     eax, 23                                 ; 0D96 _ 83. E8, 17
        mov     dword [esp+18H], edx                    ; 0D99 _ 89. 54 24, 18
        mov     dword [esp+14H], 59                     ; 0D9D _ C7. 44 24, 14, 0000003B
        mov     dword [esp+10H], eax                    ; 0DA5 _ 89. 44 24, 10
        mov     dword [esp+0CH], 59                     ; 0DA9 _ C7. 44 24, 0C, 0000003B
        mov     dword [esp+8H], 2                       ; 0DB1 _ C7. 44 24, 08, 00000002
        mov     eax, dword [ebp+0CH]                    ; 0DB9 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0DBC _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0DC0 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0DC3 _ 89. 04 24
        call    paint_rectangle                         ; 0DC6 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0DCB _ 8B. 45, 10
        lea     edx, [eax-3H]                           ; 0DCE _ 8D. 50, FD
        mov     eax, dword [ebp+10H]                    ; 0DD1 _ 8B. 45, 10
        sub     eax, 3                                  ; 0DD4 _ 83. E8, 03
        mov     dword [esp+18H], edx                    ; 0DD7 _ 89. 54 24, 18
        mov     dword [esp+14H], 59                     ; 0DDB _ C7. 44 24, 14, 0000003B
        mov     dword [esp+10H], eax                    ; 0DE3 _ 89. 44 24, 10
        mov     dword [esp+0CH], 2                      ; 0DE7 _ C7. 44 24, 0C, 00000002
        mov     dword [esp+8H], 0                       ; 0DEF _ C7. 44 24, 08, 00000000
        mov     eax, dword [ebp+0CH]                    ; 0DF7 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0DFA _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0DFE _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0E01 _ 89. 04 24
        call    paint_rectangle                         ; 0E04 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0E09 _ 8B. 45, 10
        lea     edx, [eax-3H]                           ; 0E0C _ 8D. 50, FD
        mov     eax, dword [ebp+10H]                    ; 0E0F _ 8B. 45, 10
        sub     eax, 24                                 ; 0E12 _ 83. E8, 18
        mov     dword [esp+18H], edx                    ; 0E15 _ 89. 54 24, 18
        mov     dword [esp+14H], 60                     ; 0E19 _ C7. 44 24, 14, 0000003C
        mov     dword [esp+10H], eax                    ; 0E21 _ 89. 44 24, 10
        mov     dword [esp+0CH], 60                     ; 0E25 _ C7. 44 24, 0C, 0000003C
        mov     dword [esp+8H], 0                       ; 0E2D _ C7. 44 24, 08, 00000000
        mov     eax, dword [ebp+0CH]                    ; 0E35 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0E38 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0E3C _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0E3F _ 89. 04 24
        call    paint_rectangle                         ; 0E42 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0E47 _ 8B. 45, 10
        lea     ebx, [eax-18H]                          ; 0E4A _ 8D. 58, E8
        mov     eax, dword [ebp+0CH]                    ; 0E4D _ 8B. 45, 0C
        lea     ecx, [eax-4H]                           ; 0E50 _ 8D. 48, FC
        mov     eax, dword [ebp+10H]                    ; 0E53 _ 8B. 45, 10
        lea     edx, [eax-18H]                          ; 0E56 _ 8D. 50, E8
        mov     eax, dword [ebp+0CH]                    ; 0E59 _ 8B. 45, 0C
        sub     eax, 47                                 ; 0E5C _ 83. E8, 2F
        mov     dword [esp+18H], ebx                    ; 0E5F _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 0E63 _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 0E67 _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 0E6B _ 89. 44 24, 0C
        mov     dword [esp+8H], 2                       ; 0E6F _ C7. 44 24, 08, 00000002
        mov     eax, dword [ebp+0CH]                    ; 0E77 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0E7A _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0E7E _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0E81 _ 89. 04 24
        call    paint_rectangle                         ; 0E84 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0E89 _ 8B. 45, 10
        lea     ebx, [eax-4H]                           ; 0E8C _ 8D. 58, FC
        mov     eax, dword [ebp+0CH]                    ; 0E8F _ 8B. 45, 0C
        lea     ecx, [eax-2FH]                          ; 0E92 _ 8D. 48, D1
        mov     eax, dword [ebp+10H]                    ; 0E95 _ 8B. 45, 10
        lea     edx, [eax-17H]                          ; 0E98 _ 8D. 50, E9
        mov     eax, dword [ebp+0CH]                    ; 0E9B _ 8B. 45, 0C
        sub     eax, 47                                 ; 0E9E _ 83. E8, 2F
        mov     dword [esp+18H], ebx                    ; 0EA1 _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 0EA5 _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 0EA9 _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 0EAD _ 89. 44 24, 0C
        mov     dword [esp+8H], 2                       ; 0EB1 _ C7. 44 24, 08, 00000002
        mov     eax, dword [ebp+0CH]                    ; 0EB9 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0EBC _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0EC0 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0EC3 _ 89. 04 24
        call    paint_rectangle                         ; 0EC6 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0ECB _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 0ECE _ 8D. 58, FD
        mov     eax, dword [ebp+0CH]                    ; 0ED1 _ 8B. 45, 0C
        lea     ecx, [eax-4H]                           ; 0ED4 _ 8D. 48, FC
        mov     eax, dword [ebp+10H]                    ; 0ED7 _ 8B. 45, 10
        lea     edx, [eax-3H]                           ; 0EDA _ 8D. 50, FD
        mov     eax, dword [ebp+0CH]                    ; 0EDD _ 8B. 45, 0C
        sub     eax, 47                                 ; 0EE0 _ 83. E8, 2F
        mov     dword [esp+18H], ebx                    ; 0EE3 _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 0EE7 _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 0EEB _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 0EEF _ 89. 44 24, 0C
        mov     dword [esp+8H], 7                       ; 0EF3 _ C7. 44 24, 08, 00000007
        mov     eax, dword [ebp+0CH]                    ; 0EFB _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0EFE _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0F02 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0F05 _ 89. 04 24
        call    paint_rectangle                         ; 0F08 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0F0D _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 0F10 _ 8D. 58, FD
        mov     eax, dword [ebp+0CH]                    ; 0F13 _ 8B. 45, 0C
        lea     ecx, [eax-3H]                           ; 0F16 _ 8D. 48, FD
        mov     eax, dword [ebp+10H]                    ; 0F19 _ 8B. 45, 10
        lea     edx, [eax-18H]                          ; 0F1C _ 8D. 50, E8
        mov     eax, dword [ebp+0CH]                    ; 0F1F _ 8B. 45, 0C
        sub     eax, 3                                  ; 0F22 _ 83. E8, 03
        mov     dword [esp+18H], ebx                    ; 0F25 _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 0F29 _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 0F2D _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 0F31 _ 89. 44 24, 0C
        mov     dword [esp+8H], 7                       ; 0F35 _ C7. 44 24, 08, 00000007
        mov     eax, dword [ebp+0CH]                    ; 0F3D _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0F40 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0F44 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0F47 _ 89. 04 24
        call    paint_rectangle                         ; 0F4A _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 0F4F _ 83. C4, 1C
        pop     ebx                                     ; 0F52 _ 5B
        pop     ebp                                     ; 0F53 _ 5D
        ret                                             ; 0F54 _ C3
; init_desktop End of function

init_mouse_position:; Function begin
        push    ebp                                     ; 0F55 _ 55
        mov     ebp, esp                                ; 0F56 _ 89. E5
        sub     esp, 16                                 ; 0F58 _ 83. EC, 10
        movzx   eax, word [?_244]                       ; 0F5B _ 0F B7. 05, 000000A4(d)
        cwde                                            ; 0F62 _ 98
        mov     dword [ebp-8H], eax                     ; 0F63 _ 89. 45, F8
        movzx   eax, word [?_245]                       ; 0F66 _ 0F B7. 05, 000000A6(d)
        cwde                                            ; 0F6D _ 98
        mov     dword [ebp-4H], eax                     ; 0F6E _ 89. 45, FC
        mov     eax, dword [ebp-8H]                     ; 0F71 _ 8B. 45, F8
        sub     eax, 16                                 ; 0F74 _ 83. E8, 10
        mov     edx, eax                                ; 0F77 _ 89. C2
        shr     edx, 31                                 ; 0F79 _ C1. EA, 1F
        add     eax, edx                                ; 0F7C _ 01. D0
        sar     eax, 1                                  ; 0F7E _ D1. F8
        mov     dword [mouse_x], eax                    ; 0F80 _ A3, 000001C8(d)
        mov     eax, dword [ebp-4H]                     ; 0F85 _ 8B. 45, FC
        sub     eax, 44                                 ; 0F88 _ 83. E8, 2C
        mov     edx, eax                                ; 0F8B _ 89. C2
        shr     edx, 31                                 ; 0F8D _ C1. EA, 1F
        add     eax, edx                                ; 0F90 _ 01. D0
        sar     eax, 1                                  ; 0F92 _ D1. F8
        mov     dword [mouse_y], eax                    ; 0F94 _ A3, 000001CC(d)
        leave                                           ; 0F99 _ C9
        ret                                             ; 0F9A _ C3
; init_mouse_position End of function

paint_font:; Function begin
        push    ebp                                     ; 0F9B _ 55
        mov     ebp, esp                                ; 0F9C _ 89. E5
        sub     esp, 20                                 ; 0F9E _ 83. EC, 14
        mov     eax, dword [ebp+1CH]                    ; 0FA1 _ 8B. 45, 1C
        mov     byte [ebp-14H], al                      ; 0FA4 _ 88. 45, EC
        mov     dword [ebp-4H], 0                       ; 0FA7 _ C7. 45, FC, 00000000
        jmp     ?_033                                   ; 0FAE _ E9, 0000016E

?_024:  mov     edx, dword [ebp-4H]                     ; 0FB3 _ 8B. 55, FC
        mov     eax, dword [ebp+18H]                    ; 0FB6 _ 8B. 45, 18
        add     eax, edx                                ; 0FB9 _ 01. D0
        movzx   eax, byte [eax]                         ; 0FBB _ 0F B6. 00
        mov     byte [ebp-5H], al                       ; 0FBE _ 88. 45, FB
        movzx   eax, byte [ebp-5H]                      ; 0FC1 _ 0F B6. 45, FB
        test    al, al                                  ; 0FC5 _ 84. C0
        jns     ?_025                                   ; 0FC7 _ 79, 20
        mov     eax, dword [ebp-4H]                     ; 0FC9 _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 0FCC _ 8B. 55, 14
        add     eax, edx                                ; 0FCF _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0FD1 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0FD5 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0FD7 _ 8B. 45, 10
        add     eax, edx                                ; 0FDA _ 01. D0
        mov     edx, eax                                ; 0FDC _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0FDE _ 8B. 45, 08
        add     edx, eax                                ; 0FE1 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0FE3 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0FE7 _ 88. 02
?_025:  movzx   eax, byte [ebp-5H]                      ; 0FE9 _ 0F B6. 45, FB
        and     eax, 40H                                ; 0FED _ 83. E0, 40
        test    eax, eax                                ; 0FF0 _ 85. C0
        jz      ?_026                                   ; 0FF2 _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 0FF4 _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 0FF7 _ 8B. 55, 14
        add     eax, edx                                ; 0FFA _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0FFC _ 0F AF. 45, 0C
        mov     edx, eax                                ; 1000 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 1002 _ 8B. 45, 10
        add     eax, edx                                ; 1005 _ 01. D0
        lea     edx, [eax+1H]                           ; 1007 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 100A _ 8B. 45, 08
        add     edx, eax                                ; 100D _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 100F _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 1013 _ 88. 02
?_026:  movzx   eax, byte [ebp-5H]                      ; 1015 _ 0F B6. 45, FB
        and     eax, 20H                                ; 1019 _ 83. E0, 20
        test    eax, eax                                ; 101C _ 85. C0
        jz      ?_027                                   ; 101E _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 1020 _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 1023 _ 8B. 55, 14
        add     eax, edx                                ; 1026 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 1028 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 102C _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 102E _ 8B. 45, 10
        add     eax, edx                                ; 1031 _ 01. D0
        lea     edx, [eax+2H]                           ; 1033 _ 8D. 50, 02
        mov     eax, dword [ebp+8H]                     ; 1036 _ 8B. 45, 08
        add     edx, eax                                ; 1039 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 103B _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 103F _ 88. 02
?_027:  movzx   eax, byte [ebp-5H]                      ; 1041 _ 0F B6. 45, FB
        and     eax, 10H                                ; 1045 _ 83. E0, 10
        test    eax, eax                                ; 1048 _ 85. C0
        jz      ?_028                                   ; 104A _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 104C _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 104F _ 8B. 55, 14
        add     eax, edx                                ; 1052 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 1054 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 1058 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 105A _ 8B. 45, 10
        add     eax, edx                                ; 105D _ 01. D0
        lea     edx, [eax+3H]                           ; 105F _ 8D. 50, 03
        mov     eax, dword [ebp+8H]                     ; 1062 _ 8B. 45, 08
        add     edx, eax                                ; 1065 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 1067 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 106B _ 88. 02
?_028:  movzx   eax, byte [ebp-5H]                      ; 106D _ 0F B6. 45, FB
        and     eax, 08H                                ; 1071 _ 83. E0, 08
        test    eax, eax                                ; 1074 _ 85. C0
        jz      ?_029                                   ; 1076 _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 1078 _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 107B _ 8B. 55, 14
        add     eax, edx                                ; 107E _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 1080 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 1084 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 1086 _ 8B. 45, 10
        add     eax, edx                                ; 1089 _ 01. D0
        lea     edx, [eax+4H]                           ; 108B _ 8D. 50, 04
        mov     eax, dword [ebp+8H]                     ; 108E _ 8B. 45, 08
        add     edx, eax                                ; 1091 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 1093 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 1097 _ 88. 02
?_029:  movzx   eax, byte [ebp-5H]                      ; 1099 _ 0F B6. 45, FB
        and     eax, 04H                                ; 109D _ 83. E0, 04
        test    eax, eax                                ; 10A0 _ 85. C0
        jz      ?_030                                   ; 10A2 _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 10A4 _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 10A7 _ 8B. 55, 14
        add     eax, edx                                ; 10AA _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 10AC _ 0F AF. 45, 0C
        mov     edx, eax                                ; 10B0 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 10B2 _ 8B. 45, 10
        add     eax, edx                                ; 10B5 _ 01. D0
        lea     edx, [eax+5H]                           ; 10B7 _ 8D. 50, 05
        mov     eax, dword [ebp+8H]                     ; 10BA _ 8B. 45, 08
        add     edx, eax                                ; 10BD _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 10BF _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 10C3 _ 88. 02
?_030:  movzx   eax, byte [ebp-5H]                      ; 10C5 _ 0F B6. 45, FB
        and     eax, 02H                                ; 10C9 _ 83. E0, 02
        test    eax, eax                                ; 10CC _ 85. C0
        jz      ?_031                                   ; 10CE _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 10D0 _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 10D3 _ 8B. 55, 14
        add     eax, edx                                ; 10D6 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 10D8 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 10DC _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 10DE _ 8B. 45, 10
        add     eax, edx                                ; 10E1 _ 01. D0
        lea     edx, [eax+6H]                           ; 10E3 _ 8D. 50, 06
        mov     eax, dword [ebp+8H]                     ; 10E6 _ 8B. 45, 08
        add     edx, eax                                ; 10E9 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 10EB _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 10EF _ 88. 02
?_031:  movzx   eax, byte [ebp-5H]                      ; 10F1 _ 0F B6. 45, FB
        and     eax, 01H                                ; 10F5 _ 83. E0, 01
        test    eax, eax                                ; 10F8 _ 85. C0
        jz      ?_032                                   ; 10FA _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 10FC _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 10FF _ 8B. 55, 14
        add     eax, edx                                ; 1102 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 1104 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 1108 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 110A _ 8B. 45, 10
        add     eax, edx                                ; 110D _ 01. D0
        lea     edx, [eax+7H]                           ; 110F _ 8D. 50, 07
        mov     eax, dword [ebp+8H]                     ; 1112 _ 8B. 45, 08
        add     edx, eax                                ; 1115 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 1117 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 111B _ 88. 02
?_032:  add     dword [ebp-4H], 1                       ; 111D _ 83. 45, FC, 01
?_033:  cmp     dword [ebp-4H], 15                      ; 1121 _ 83. 7D, FC, 0F
        jle     ?_024                                   ; 1125 _ 0F 8E, FFFFFE88
        leave                                           ; 112B _ C9
        ret                                             ; 112C _ C3
; paint_font End of function

paint_string:; Function begin
        push    ebp                                     ; 112D _ 55
        mov     ebp, esp                                ; 112E _ 89. E5
        push    ebx                                     ; 1130 _ 53
        sub     esp, 52                                 ; 1131 _ 83. EC, 34
        mov     eax, dword [ebp+1CH]                    ; 1134 _ 8B. 45, 1C
        mov     byte [ebp-1CH], al                      ; 1137 _ 88. 45, E4
        mov     eax, dword [ebp+10H]                    ; 113A _ 8B. 45, 10
        mov     dword [ebp-0CH], eax                    ; 113D _ 89. 45, F4
        jmp     ?_035                                   ; 1140 _ EB, 4B

?_034:  movsx   ecx, byte [ebp-1CH]                     ; 1142 _ 0F BE. 4D, E4
        mov     eax, dword [ebp+18H]                    ; 1146 _ 8B. 45, 18
        movzx   eax, byte [eax]                         ; 1149 _ 0F B6. 00
        movsx   eax, al                                 ; 114C _ 0F BE. C0
        shl     eax, 4                                  ; 114F _ C1. E0, 04
        lea     ebx, [systemFont+eax]                   ; 1152 _ 8D. 98, 00000000(d)
        mov     eax, dword [ebp+0CH]                    ; 1158 _ 8B. 45, 0C
        mov     edx, dword [eax+4H]                     ; 115B _ 8B. 50, 04
        mov     eax, dword [ebp+0CH]                    ; 115E _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1161 _ 8B. 00
        mov     dword [esp+14H], ecx                    ; 1163 _ 89. 4C 24, 14
        mov     dword [esp+10H], ebx                    ; 1167 _ 89. 5C 24, 10
        mov     ecx, dword [ebp+14H]                    ; 116B _ 8B. 4D, 14
        mov     dword [esp+0CH], ecx                    ; 116E _ 89. 4C 24, 0C
        mov     ecx, dword [ebp+10H]                    ; 1172 _ 8B. 4D, 10
        mov     dword [esp+8H], ecx                     ; 1175 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 1179 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 117D _ 89. 04 24
        call    paint_font                              ; 1180 _ E8, FFFFFFFC(rel)
        add     dword [ebp+10H], 8                      ; 1185 _ 83. 45, 10, 08
        add     dword [ebp+18H], 1                      ; 1189 _ 83. 45, 18, 01
?_035:  mov     eax, dword [ebp+18H]                    ; 118D _ 8B. 45, 18
        movzx   eax, byte [eax]                         ; 1190 _ 0F B6. 00
        test    al, al                                  ; 1193 _ 84. C0
        jnz     ?_034                                   ; 1195 _ 75, AB
        mov     eax, dword [ebp+14H]                    ; 1197 _ 8B. 45, 14
        add     eax, 16                                 ; 119A _ 83. C0, 10
        mov     dword [esp+14H], eax                    ; 119D _ 89. 44 24, 14
        mov     eax, dword [ebp+10H]                    ; 11A1 _ 8B. 45, 10
        mov     dword [esp+10H], eax                    ; 11A4 _ 89. 44 24, 10
        mov     eax, dword [ebp+14H]                    ; 11A8 _ 8B. 45, 14
        mov     dword [esp+0CH], eax                    ; 11AB _ 89. 44 24, 0C
        mov     eax, dword [ebp-0CH]                    ; 11AF _ 8B. 45, F4
        mov     dword [esp+8H], eax                     ; 11B2 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 11B6 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 11B9 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 11BD _ 8B. 45, 08
        mov     dword [esp], eax                        ; 11C0 _ 89. 04 24
        call    sheet_refresh                           ; 11C3 _ E8, FFFFFFFC(rel)
        add     esp, 52                                 ; 11C8 _ 83. C4, 34
        pop     ebx                                     ; 11CB _ 5B
        pop     ebp                                     ; 11CC _ 5D
        ret                                             ; 11CD _ C3
; paint_string End of function

init_mouse_cursor:; Function begin
        push    ebp                                     ; 11CE _ 55
        mov     ebp, esp                                ; 11CF _ 89. E5
        sub     esp, 20                                 ; 11D1 _ 83. EC, 14
        mov     eax, dword [ebp+0CH]                    ; 11D4 _ 8B. 45, 0C
        mov     byte [ebp-14H], al                      ; 11D7 _ 88. 45, EC
        mov     dword [ebp-8H], 0                       ; 11DA _ C7. 45, F8, 00000000
        jmp     ?_042                                   ; 11E1 _ E9, 0000009C

?_036:  mov     dword [ebp-4H], 0                       ; 11E6 _ C7. 45, FC, 00000000
        jmp     ?_041                                   ; 11ED _ E9, 00000082

?_037:  mov     eax, dword [ebp-8H]                     ; 11F2 _ 8B. 45, F8
        shl     eax, 4                                  ; 11F5 _ C1. E0, 04
        mov     edx, eax                                ; 11F8 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 11FA _ 8B. 45, FC
        add     eax, edx                                ; 11FD _ 01. D0
        add     eax, cursor.1826                        ; 11FF _ 05, 00000160(d)
        movzx   eax, byte [eax]                         ; 1204 _ 0F B6. 00
        cmp     al, 42                                  ; 1207 _ 3C, 2A
        jnz     ?_038                                   ; 1209 _ 75, 19
        mov     eax, dword [ebp-8H]                     ; 120B _ 8B. 45, F8
        shl     eax, 4                                  ; 120E _ C1. E0, 04
        mov     edx, eax                                ; 1211 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 1213 _ 8B. 45, FC
        add     eax, edx                                ; 1216 _ 01. D0
        mov     edx, eax                                ; 1218 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 121A _ 8B. 45, 08
        add     eax, edx                                ; 121D _ 01. D0
        mov     byte [eax], 0                           ; 121F _ C6. 00, 00
        jmp     ?_040                                   ; 1222 _ EB, 4C

?_038:  mov     eax, dword [ebp-8H]                     ; 1224 _ 8B. 45, F8
        shl     eax, 4                                  ; 1227 _ C1. E0, 04
        mov     edx, eax                                ; 122A _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 122C _ 8B. 45, FC
        add     eax, edx                                ; 122F _ 01. D0
        add     eax, cursor.1826                        ; 1231 _ 05, 00000160(d)
        movzx   eax, byte [eax]                         ; 1236 _ 0F B6. 00
        cmp     al, 79                                  ; 1239 _ 3C, 4F
        jnz     ?_039                                   ; 123B _ 75, 19
        mov     eax, dword [ebp-8H]                     ; 123D _ 8B. 45, F8
        shl     eax, 4                                  ; 1240 _ C1. E0, 04
        mov     edx, eax                                ; 1243 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 1245 _ 8B. 45, FC
        add     eax, edx                                ; 1248 _ 01. D0
        mov     edx, eax                                ; 124A _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 124C _ 8B. 45, 08
        add     eax, edx                                ; 124F _ 01. D0
        mov     byte [eax], 7                           ; 1251 _ C6. 00, 07
        jmp     ?_040                                   ; 1254 _ EB, 1A

?_039:  mov     eax, dword [ebp-8H]                     ; 1256 _ 8B. 45, F8
        shl     eax, 4                                  ; 1259 _ C1. E0, 04
        mov     edx, eax                                ; 125C _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 125E _ 8B. 45, FC
        add     eax, edx                                ; 1261 _ 01. D0
        mov     edx, eax                                ; 1263 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 1265 _ 8B. 45, 08
        add     edx, eax                                ; 1268 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 126A _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 126E _ 88. 02
?_040:  add     dword [ebp-4H], 1                       ; 1270 _ 83. 45, FC, 01
?_041:  cmp     dword [ebp-4H], 15                      ; 1274 _ 83. 7D, FC, 0F
        jle     ?_037                                   ; 1278 _ 0F 8E, FFFFFF74
        add     dword [ebp-8H], 1                       ; 127E _ 83. 45, F8, 01
?_042:  cmp     dword [ebp-8H], 15                      ; 1282 _ 83. 7D, F8, 0F
        jle     ?_036                                   ; 1286 _ 0F 8E, FFFFFF5A
        leave                                           ; 128C _ C9
        ret                                             ; 128D _ C3
; init_mouse_cursor End of function

paint_block:; Function begin
        push    ebp                                     ; 128E _ 55
        mov     ebp, esp                                ; 128F _ 89. E5
        sub     esp, 16                                 ; 1291 _ 83. EC, 10
        mov     dword [ebp-8H], 0                       ; 1294 _ C7. 45, F8, 00000000
        jmp     ?_046                                   ; 129B _ EB, 50

?_043:  mov     dword [ebp-4H], 0                       ; 129D _ C7. 45, FC, 00000000
        jmp     ?_045                                   ; 12A4 _ EB, 3B

?_044:  mov     eax, dword [ebp-8H]                     ; 12A6 _ 8B. 45, F8
        mov     edx, dword [ebp+14H]                    ; 12A9 _ 8B. 55, 14
        add     eax, edx                                ; 12AC _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 12AE _ 0F AF. 45, 0C
        mov     edx, dword [ebp-4H]                     ; 12B2 _ 8B. 55, FC
        mov     ecx, dword [ebp+10H]                    ; 12B5 _ 8B. 4D, 10
        add     edx, ecx                                ; 12B8 _ 01. CA
        add     eax, edx                                ; 12BA _ 01. D0
        mov     edx, eax                                ; 12BC _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 12BE _ 8B. 45, 08
        add     edx, eax                                ; 12C1 _ 01. C2
        mov     eax, dword [ebp-8H]                     ; 12C3 _ 8B. 45, F8
        imul    eax, dword [ebp+18H]                    ; 12C6 _ 0F AF. 45, 18
        mov     ecx, eax                                ; 12CA _ 89. C1
        mov     eax, dword [ebp-4H]                     ; 12CC _ 8B. 45, FC
        add     eax, ecx                                ; 12CF _ 01. C8
        mov     ecx, eax                                ; 12D1 _ 89. C1
        mov     eax, dword [ebp+20H]                    ; 12D3 _ 8B. 45, 20
        add     eax, ecx                                ; 12D6 _ 01. C8
        movzx   eax, byte [eax]                         ; 12D8 _ 0F B6. 00
        mov     byte [edx], al                          ; 12DB _ 88. 02
        add     dword [ebp-4H], 1                       ; 12DD _ 83. 45, FC, 01
?_045:  mov     eax, dword [ebp-4H]                     ; 12E1 _ 8B. 45, FC
        cmp     eax, dword [ebp+18H]                    ; 12E4 _ 3B. 45, 18
        jl      ?_044                                   ; 12E7 _ 7C, BD
        add     dword [ebp-8H], 1                       ; 12E9 _ 83. 45, F8, 01
?_046:  mov     eax, dword [ebp-8H]                     ; 12ED _ 8B. 45, F8
        cmp     eax, dword [ebp+1CH]                    ; 12F0 _ 3B. 45, 1C
        jl      ?_043                                   ; 12F3 _ 7C, A8
        leave                                           ; 12F5 _ C9
        ret                                             ; 12F6 _ C3
; paint_block End of function

init_fifo_buf:; Function begin
        push    ebp                                     ; 12F7 _ 55
        mov     ebp, esp                                ; 12F8 _ 89. E5
        sub     esp, 24                                 ; 12FA _ 83. EC, 18
        mov     dword [esp+0CH], 0                      ; 12FD _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], mousebuf                ; 1305 _ C7. 44 24, 08, 00000000(d)
        mov     dword [esp+4H], 128                     ; 130D _ C7. 44 24, 04, 00000080
        mov     dword [esp], mouseinfo                  ; 1315 _ C7. 04 24, 00000000(d)
        call    fifo8_init                              ; 131C _ E8, FFFFFFFC(rel)
        mov     dword [esp+0CH], 0                      ; 1321 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], keybuf                  ; 1329 _ C7. 44 24, 08, 00000000(d)
        mov     dword [esp+4H], 32                      ; 1331 _ C7. 44 24, 04, 00000020
        mov     dword [esp], keyinfo                    ; 1339 _ C7. 04 24, 00000000(d)
        call    fifo8_init                              ; 1340 _ E8, FFFFFFFC(rel)
        leave                                           ; 1345 _ C9
        ret                                             ; 1346 _ C3
; init_fifo_buf End of function

compute_mouse_position:; Function begin
        push    ebp                                     ; 1347 _ 55
        mov     ebp, esp                                ; 1348 _ 89. E5
        mov     eax, dword [ebp+10H]                    ; 134A _ 8B. 45, 10
        mov     edx, dword [eax+4H]                     ; 134D _ 8B. 50, 04
        mov     eax, dword [mouse_x]                    ; 1350 _ A1, 000001C8(d)
        add     eax, edx                                ; 1355 _ 01. D0
        mov     dword [mouse_x], eax                    ; 1357 _ A3, 000001C8(d)
        mov     eax, dword [ebp+10H]                    ; 135C _ 8B. 45, 10
        mov     edx, dword [eax+8H]                     ; 135F _ 8B. 50, 08
        mov     eax, dword [mouse_y]                    ; 1362 _ A1, 000001CC(d)
        add     eax, edx                                ; 1367 _ 01. D0
        mov     dword [mouse_y], eax                    ; 1369 _ A3, 000001CC(d)
        mov     eax, dword [mouse_x]                    ; 136E _ A1, 000001C8(d)
        test    eax, eax                                ; 1373 _ 85. C0
        jns     ?_047                                   ; 1375 _ 79, 0A
        mov     dword [mouse_x], 0                      ; 1377 _ C7. 05, 000001C8(d), 00000000
?_047:  mov     eax, dword [mouse_y]                    ; 1381 _ A1, 000001CC(d)
        test    eax, eax                                ; 1386 _ 85. C0
        jns     ?_048                                   ; 1388 _ 79, 0A
        mov     dword [mouse_y], 0                      ; 138A _ C7. 05, 000001CC(d), 00000000
?_048:  movzx   eax, word [?_244]                       ; 1394 _ 0F B7. 05, 000000A4(d)
        cwde                                            ; 139B _ 98
        lea     edx, [eax-10H]                          ; 139C _ 8D. 50, F0
        mov     eax, dword [mouse_x]                    ; 139F _ A1, 000001C8(d)
        cmp     edx, eax                                ; 13A4 _ 39. C2
        jge     ?_049                                   ; 13A6 _ 7D, 10
        movzx   eax, word [?_244]                       ; 13A8 _ 0F B7. 05, 000000A4(d)
        cwde                                            ; 13AF _ 98
        sub     eax, 16                                 ; 13B0 _ 83. E8, 10
        mov     dword [mouse_x], eax                    ; 13B3 _ A3, 000001C8(d)
?_049:  movzx   eax, word [?_244]                       ; 13B8 _ 0F B7. 05, 000000A4(d)
        cwde                                            ; 13BF _ 98
        lea     edx, [eax-10H]                          ; 13C0 _ 8D. 50, F0
        mov     eax, dword [mouse_y]                    ; 13C3 _ A1, 000001CC(d)
        cmp     edx, eax                                ; 13C8 _ 39. C2
        jge     ?_050                                   ; 13CA _ 7D, 10
        movzx   eax, word [?_244]                       ; 13CC _ 0F B7. 05, 000000A4(d)
        cwde                                            ; 13D3 _ 98
        sub     eax, 16                                 ; 13D4 _ 83. E8, 10
        mov     dword [mouse_y], eax                    ; 13D7 _ A3, 000001CC(d)
?_050:  pop     ebp                                     ; 13DC _ 5D
        ret                                             ; 13DD _ C3
; compute_mouse_position End of function

show_mouse_info:; Function begin
        push    ebp                                     ; 13DE _ 55
        mov     ebp, esp                                ; 13DF _ 89. E5
        sub     esp, 40                                 ; 13E1 _ 83. EC, 28
        mov     byte [ebp-9H], 0                        ; 13E4 _ C6. 45, F7, 00
        call    io_sti                                  ; 13E8 _ E8, FFFFFFFC(rel)
        mov     dword [esp], mouseinfo                  ; 13ED _ C7. 04 24, 00000000(d)
        call    fifo8_get                               ; 13F4 _ E8, FFFFFFFC(rel)
        mov     byte [ebp-9H], al                       ; 13F9 _ 88. 45, F7
        movzx   eax, byte [ebp-9H]                      ; 13FC _ 0F B6. 45, F7
        mov     dword [esp+4H], eax                     ; 1400 _ 89. 44 24, 04
        mov     dword [esp], mouse_send_info            ; 1404 _ C7. 04 24, 00000000(d)
        call    mouse_decode                            ; 140B _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 1410 _ 85. C0
        jz      ?_051                                   ; 1412 _ 74, 77
        mov     dword [esp+8H], mouse_send_info         ; 1414 _ C7. 44 24, 08, 00000000(d)
        mov     eax, dword [ebp+0CH]                    ; 141C _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 141F _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1423 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1426 _ 89. 04 24
        call    compute_mouse_position                  ; 1429 _ E8, FFFFFFFC(rel)
        mov     edx, dword [mouse_y]                    ; 142E _ 8B. 15, 000001CC(d)
        mov     eax, dword [mouse_x]                    ; 1434 _ A1, 000001C8(d)
        mov     dword [esp+0CH], edx                    ; 1439 _ 89. 54 24, 0C
        mov     dword [esp+8H], eax                     ; 143D _ 89. 44 24, 08
        mov     eax, dword [ebp+10H]                    ; 1441 _ 8B. 45, 10
        mov     dword [esp+4H], eax                     ; 1444 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1448 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 144B _ 89. 04 24
        call    sheet_slide                             ; 144E _ E8, FFFFFFFC(rel)
        mov     eax, dword [mouse_send_info+0CH]        ; 1453 _ A1, 0000000C(d)
        and     eax, 01H                                ; 1458 _ 83. E0, 01
        test    eax, eax                                ; 145B _ 85. C0
        jz      ?_051                                   ; 145D _ 74, 2C
        mov     eax, dword [mouse_y]                    ; 145F _ A1, 000001CC(d)
        lea     ecx, [eax-8H]                           ; 1464 _ 8D. 48, F8
        mov     eax, dword [mouse_x]                    ; 1467 _ A1, 000001C8(d)
        lea     edx, [eax-50H]                          ; 146C _ 8D. 50, B0
        mov     eax, dword [sheet_win]                  ; 146F _ A1, 000001C4(d)
        mov     dword [esp+0CH], ecx                    ; 1474 _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 1478 _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 147C _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1480 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1483 _ 89. 04 24
        call    sheet_slide                             ; 1486 _ E8, FFFFFFFC(rel)
?_051:  leave                                           ; 148B _ C9
        ret                                             ; 148C _ C3
; show_mouse_info End of function

show_memory_info:; Function begin
        push    ebp                                     ; 148D _ 55
        mov     ebp, esp                                ; 148E _ 89. E5
        sub     esp, 88                                 ; 1490 _ 83. EC, 58
        mov     dword [ebp-38H], 0                      ; 1493 _ C7. 45, C8, 00000000
        mov     dword [ebp-34H], 0                      ; 149A _ C7. 45, CC, 00000000
        mov     dword [ebp-30H], 104                    ; 14A1 _ C7. 45, D0, 00000068
        mov     eax, dword [screen_info]                ; 14A8 _ A1, 000000A0(d)
        mov     dword [ebp-2CH], eax                    ; 14AD _ 89. 45, D4
        movzx   eax, word [?_244]                       ; 14B0 _ 0F B7. 05, 000000A4(d)
        cwde                                            ; 14B7 _ 98
        mov     dword [ebp-28H], eax                    ; 14B8 _ 89. 45, D8
        movzx   eax, word [?_245]                       ; 14BB _ 0F B7. 05, 000000A6(d)
        cwde                                            ; 14C2 _ 98
        mov     dword [ebp-24H], eax                    ; 14C3 _ 89. 45, DC
        mov     eax, dword [ebp+0CH]                    ; 14C6 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 14C9 _ 8B. 00
        mov     edx, dword [ebp-24H]                    ; 14CB _ 8B. 55, DC
        mov     dword [esp+8H], edx                     ; 14CE _ 89. 54 24, 08
        mov     edx, dword [ebp-28H]                    ; 14D2 _ 8B. 55, D8
        mov     dword [esp+4H], edx                     ; 14D5 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 14D9 _ 89. 04 24
        call    init_desktop                            ; 14DC _ E8, FFFFFFFC(rel)
        mov     dword [esp+14H], 7                      ; 14E1 _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_234                  ; 14E9 _ C7. 44 24, 10, 0000001E(d)
        mov     eax, dword [ebp-34H]                    ; 14F1 _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 14F4 _ 89. 44 24, 0C
        mov     eax, dword [ebp-38H]                    ; 14F8 _ 8B. 45, C8
        mov     dword [esp+8H], eax                     ; 14FB _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 14FF _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 1502 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1506 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1509 _ 89. 04 24
        call    paint_string                            ; 150C _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+14H]                    ; 1511 _ 8B. 45, 14
        mov     dword [esp], eax                        ; 1514 _ 89. 04 24
        call    intToHexStr                             ; 1517 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-20H], eax                    ; 151C _ 89. 45, E0
        mov     dword [esp+14H], 7                      ; 151F _ C7. 44 24, 14, 00000007
        mov     eax, dword [ebp-20H]                    ; 1527 _ 8B. 45, E0
        mov     dword [esp+10H], eax                    ; 152A _ 89. 44 24, 10
        mov     eax, dword [ebp-34H]                    ; 152E _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 1531 _ 89. 44 24, 0C
        mov     eax, dword [ebp-30H]                    ; 1535 _ 8B. 45, D0
        mov     dword [esp+8H], eax                     ; 1538 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 153C _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 153F _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1543 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1546 _ 89. 04 24
        call    paint_string                            ; 1549 _ E8, FFFFFFFC(rel)
        add     dword [ebp-34H], 16                     ; 154E _ 83. 45, CC, 10
        mov     dword [esp+14H], 7                      ; 1552 _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_235                  ; 155A _ C7. 44 24, 10, 00000028(d)
        mov     eax, dword [ebp-34H]                    ; 1562 _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 1565 _ 89. 44 24, 0C
        mov     eax, dword [ebp-38H]                    ; 1569 _ 8B. 45, C8
        mov     dword [esp+8H], eax                     ; 156C _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 1570 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 1573 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1577 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 157A _ 89. 04 24
        call    paint_string                            ; 157D _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 1582 _ 8B. 45, 10
        mov     eax, dword [eax]                        ; 1585 _ 8B. 00
        mov     dword [esp], eax                        ; 1587 _ 89. 04 24
        call    intToHexStr                             ; 158A _ E8, FFFFFFFC(rel)
        mov     dword [ebp-1CH], eax                    ; 158F _ 89. 45, E4
        mov     dword [esp+14H], 7                      ; 1592 _ C7. 44 24, 14, 00000007
        mov     eax, dword [ebp-1CH]                    ; 159A _ 8B. 45, E4
        mov     dword [esp+10H], eax                    ; 159D _ 89. 44 24, 10
        mov     eax, dword [ebp-34H]                    ; 15A1 _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 15A4 _ 89. 44 24, 0C
        mov     eax, dword [ebp-30H]                    ; 15A8 _ 8B. 45, D0
        mov     dword [esp+8H], eax                     ; 15AB _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 15AF _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 15B2 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 15B6 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 15B9 _ 89. 04 24
        call    paint_string                            ; 15BC _ E8, FFFFFFFC(rel)
        add     dword [ebp-34H], 16                     ; 15C1 _ 83. 45, CC, 10
        mov     dword [esp+14H], 7                      ; 15C5 _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_236                  ; 15CD _ C7. 44 24, 10, 00000034(d)
        mov     eax, dword [ebp-34H]                    ; 15D5 _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 15D8 _ 89. 44 24, 0C
        mov     eax, dword [ebp-38H]                    ; 15DC _ 8B. 45, C8
        mov     dword [esp+8H], eax                     ; 15DF _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 15E3 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 15E6 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 15EA _ 8B. 45, 08
        mov     dword [esp], eax                        ; 15ED _ 89. 04 24
        call    paint_string                            ; 15F0 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 15F5 _ 8B. 45, 10
        mov     eax, dword [eax+4H]                     ; 15F8 _ 8B. 40, 04
        mov     dword [esp], eax                        ; 15FB _ 89. 04 24
        call    intToHexStr                             ; 15FE _ E8, FFFFFFFC(rel)
        mov     dword [ebp-18H], eax                    ; 1603 _ 89. 45, E8
        mov     dword [esp+14H], 7                      ; 1606 _ C7. 44 24, 14, 00000007
        mov     eax, dword [ebp-18H]                    ; 160E _ 8B. 45, E8
        mov     dword [esp+10H], eax                    ; 1611 _ 89. 44 24, 10
        mov     eax, dword [ebp-34H]                    ; 1615 _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 1618 _ 89. 44 24, 0C
        mov     eax, dword [ebp-30H]                    ; 161C _ 8B. 45, D0
        mov     dword [esp+8H], eax                     ; 161F _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 1623 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 1626 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 162A _ 8B. 45, 08
        mov     dword [esp], eax                        ; 162D _ 89. 04 24
        call    paint_string                            ; 1630 _ E8, FFFFFFFC(rel)
        add     dword [ebp-34H], 16                     ; 1635 _ 83. 45, CC, 10
        mov     dword [esp+14H], 7                      ; 1639 _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_237                  ; 1641 _ C7. 44 24, 10, 00000040(d)
        mov     eax, dword [ebp-34H]                    ; 1649 _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 164C _ 89. 44 24, 0C
        mov     eax, dword [ebp-38H]                    ; 1650 _ 8B. 45, C8
        mov     dword [esp+8H], eax                     ; 1653 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 1657 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 165A _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 165E _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1661 _ 89. 04 24
        call    paint_string                            ; 1664 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 1669 _ 8B. 45, 10
        mov     eax, dword [eax+8H]                     ; 166C _ 8B. 40, 08
        mov     dword [esp], eax                        ; 166F _ 89. 04 24
        call    intToHexStr                             ; 1672 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-14H], eax                    ; 1677 _ 89. 45, EC
        mov     dword [esp+14H], 7                      ; 167A _ C7. 44 24, 14, 00000007
        mov     eax, dword [ebp-14H]                    ; 1682 _ 8B. 45, EC
        mov     dword [esp+10H], eax                    ; 1685 _ 89. 44 24, 10
        mov     eax, dword [ebp-34H]                    ; 1689 _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 168C _ 89. 44 24, 0C
        mov     eax, dword [ebp-30H]                    ; 1690 _ 8B. 45, D0
        mov     dword [esp+8H], eax                     ; 1693 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 1697 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 169A _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 169E _ 8B. 45, 08
        mov     dword [esp], eax                        ; 16A1 _ 89. 04 24
        call    paint_string                            ; 16A4 _ E8, FFFFFFFC(rel)
        add     dword [ebp-34H], 16                     ; 16A9 _ 83. 45, CC, 10
        mov     dword [esp+14H], 7                      ; 16AD _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_238                  ; 16B5 _ C7. 44 24, 10, 0000004C(d)
        mov     eax, dword [ebp-34H]                    ; 16BD _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 16C0 _ 89. 44 24, 0C
        mov     eax, dword [ebp-38H]                    ; 16C4 _ 8B. 45, C8
        mov     dword [esp+8H], eax                     ; 16C7 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 16CB _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 16CE _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 16D2 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 16D5 _ 89. 04 24
        call    paint_string                            ; 16D8 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 16DD _ 8B. 45, 10
        mov     eax, dword [eax+0CH]                    ; 16E0 _ 8B. 40, 0C
        mov     dword [esp], eax                        ; 16E3 _ 89. 04 24
        call    intToHexStr                             ; 16E6 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 16EB _ 89. 45, F0
        mov     dword [esp+14H], 7                      ; 16EE _ C7. 44 24, 14, 00000007
        mov     eax, dword [ebp-10H]                    ; 16F6 _ 8B. 45, F0
        mov     dword [esp+10H], eax                    ; 16F9 _ 89. 44 24, 10
        mov     eax, dword [ebp-34H]                    ; 16FD _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 1700 _ 89. 44 24, 0C
        mov     eax, dword [ebp-30H]                    ; 1704 _ 8B. 45, D0
        mov     dword [esp+8H], eax                     ; 1707 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 170B _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 170E _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1712 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1715 _ 89. 04 24
        call    paint_string                            ; 1718 _ E8, FFFFFFFC(rel)
        add     dword [ebp-34H], 16                     ; 171D _ 83. 45, CC, 10
        mov     dword [esp+14H], 7                      ; 1721 _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_239                  ; 1729 _ C7. 44 24, 10, 00000059(d)
        mov     eax, dword [ebp-34H]                    ; 1731 _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 1734 _ 89. 44 24, 0C
        mov     eax, dword [ebp-38H]                    ; 1738 _ 8B. 45, C8
        mov     dword [esp+8H], eax                     ; 173B _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 173F _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 1742 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1746 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1749 _ 89. 04 24
        call    paint_string                            ; 174C _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 1751 _ 8B. 45, 10
        mov     eax, dword [eax+10H]                    ; 1754 _ 8B. 40, 10
        mov     dword [esp], eax                        ; 1757 _ 89. 04 24
        call    intToHexStr                             ; 175A _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 175F _ 89. 45, F4
        mov     dword [esp+14H], 7                      ; 1762 _ C7. 44 24, 14, 00000007
        mov     eax, dword [ebp-0CH]                    ; 176A _ 8B. 45, F4
        mov     dword [esp+10H], eax                    ; 176D _ 89. 44 24, 10
        mov     eax, dword [ebp-34H]                    ; 1771 _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 1774 _ 89. 44 24, 0C
        mov     eax, dword [ebp-30H]                    ; 1778 _ 8B. 45, D0
        mov     dword [esp+8H], eax                     ; 177B _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 177F _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 1782 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1786 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1789 _ 89. 04 24
        call    paint_string                            ; 178C _ E8, FFFFFFFC(rel)
        add     dword [ebp-34H], 16                     ; 1791 _ 83. 45, CC, 10
        leave                                           ; 1795 _ C9
        ret                                             ; 1796 _ C3
; show_memory_info End of function

message_box:; Function begin
        push    ebp                                     ; 1797 _ 55
        mov     ebp, esp                                ; 1798 _ 89. E5
        sub     esp, 56                                 ; 179A _ 83. EC, 38
        mov     eax, dword [ebp+8H]                     ; 179D _ 8B. 45, 08
        mov     dword [esp], eax                        ; 17A0 _ 89. 04 24
        call    sheet_alloc                             ; 17A3 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 17A8 _ 89. 45, F0
        mov     eax, dword [memman]                     ; 17AB _ A1, 00000000(d)
        mov     dword [esp+4H], 10880                   ; 17B0 _ C7. 44 24, 04, 00002A80
        mov     dword [esp], eax                        ; 17B8 _ 89. 04 24
        call    memman_alloc_4k                         ; 17BB _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 17C0 _ 89. 45, F4
        mov     dword [esp+10H], 99                     ; 17C3 _ C7. 44 24, 10, 00000063
        mov     dword [esp+0CH], 68                     ; 17CB _ C7. 44 24, 0C, 00000044
        mov     dword [esp+8H], 160                     ; 17D3 _ C7. 44 24, 08, 000000A0
        mov     eax, dword [ebp-0CH]                    ; 17DB _ 8B. 45, F4
        mov     dword [esp+4H], eax                     ; 17DE _ 89. 44 24, 04
        mov     eax, dword [ebp-10H]                    ; 17E2 _ 8B. 45, F0
        mov     dword [esp], eax                        ; 17E5 _ 89. 04 24
        call    sheet_setbuf                            ; 17E8 _ E8, FFFFFFFC(rel)
        mov     dword [esp+0CH], 1                      ; 17ED _ C7. 44 24, 0C, 00000001
        mov     eax, dword [ebp+0CH]                    ; 17F5 _ 8B. 45, 0C
        mov     dword [esp+8H], eax                     ; 17F8 _ 89. 44 24, 08
        mov     eax, dword [ebp-10H]                    ; 17FC _ 8B. 45, F0
        mov     dword [esp+4H], eax                     ; 17FF _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1803 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1806 _ 89. 04 24
        call    make_windows                            ; 1809 _ E8, FFFFFFFC(rel)
        mov     dword [esp+14H], 7                      ; 180E _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], 16                     ; 1816 _ C7. 44 24, 10, 00000010
        mov     dword [esp+0CH], 144                    ; 181E _ C7. 44 24, 0C, 00000090
        mov     dword [esp+8H], 28                      ; 1826 _ C7. 44 24, 08, 0000001C
        mov     dword [esp+4H], 8                       ; 182E _ C7. 44 24, 04, 00000008
        mov     eax, dword [ebp-10H]                    ; 1836 _ 8B. 45, F0
        mov     dword [esp], eax                        ; 1839 _ 89. 04 24
        call    make_textbox                            ; 183C _ E8, FFFFFFFC(rel)
        mov     dword [esp+0CH], 172                    ; 1841 _ C7. 44 24, 0C, 000000AC
        mov     dword [esp+8H], 260                     ; 1849 _ C7. 44 24, 08, 00000104
        mov     eax, dword [ebp-10H]                    ; 1851 _ 8B. 45, F0
        mov     dword [esp+4H], eax                     ; 1854 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1858 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 185B _ 89. 04 24
        call    sheet_slide                             ; 185E _ E8, FFFFFFFC(rel)
        mov     dword [esp+8H], 2                       ; 1863 _ C7. 44 24, 08, 00000002
        mov     eax, dword [ebp-10H]                    ; 186B _ 8B. 45, F0
        mov     dword [esp+4H], eax                     ; 186E _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1872 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1875 _ 89. 04 24
        call    sheet_updown                            ; 1878 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 187D _ 8B. 45, F0
        leave                                           ; 1880 _ C9
        ret                                             ; 1881 _ C3
; message_box End of function

make_textbox:; Function begin
        push    ebp                                     ; 1882 _ 55
        mov     ebp, esp                                ; 1883 _ 89. E5
        push    edi                                     ; 1885 _ 57
        push    esi                                     ; 1886 _ 56
        push    ebx                                     ; 1887 _ 53
        sub     esp, 44                                 ; 1888 _ 83. EC, 2C
        mov     eax, dword [ebp+14H]                    ; 188B _ 8B. 45, 14
        mov     edx, dword [ebp+0CH]                    ; 188E _ 8B. 55, 0C
        add     eax, edx                                ; 1891 _ 01. D0
        mov     dword [ebp-14H], eax                    ; 1893 _ 89. 45, EC
        mov     eax, dword [ebp+18H]                    ; 1896 _ 8B. 45, 18
        mov     edx, dword [ebp+10H]                    ; 1899 _ 8B. 55, 10
        add     eax, edx                                ; 189C _ 01. D0
        mov     dword [ebp-10H], eax                    ; 189E _ 89. 45, F0
        mov     eax, dword [ebp+10H]                    ; 18A1 _ 8B. 45, 10
        lea     edi, [eax-3H]                           ; 18A4 _ 8D. 78, FD
        mov     eax, dword [ebp-14H]                    ; 18A7 _ 8B. 45, EC
        lea     esi, [eax+1H]                           ; 18AA _ 8D. 70, 01
        mov     eax, dword [ebp+10H]                    ; 18AD _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 18B0 _ 8D. 58, FD
        mov     eax, dword [ebp+0CH]                    ; 18B3 _ 8B. 45, 0C
        lea     ecx, [eax-2H]                           ; 18B6 _ 8D. 48, FE
        mov     eax, dword [ebp+8H]                     ; 18B9 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 18BC _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 18BF _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 18C2 _ 8B. 00
        mov     dword [esp+18H], edi                    ; 18C4 _ 89. 7C 24, 18
        mov     dword [esp+14H], esi                    ; 18C8 _ 89. 74 24, 14
        mov     dword [esp+10H], ebx                    ; 18CC _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 18D0 _ 89. 4C 24, 0C
        mov     dword [esp+8H], 15                      ; 18D4 _ C7. 44 24, 08, 0000000F
        mov     dword [esp+4H], edx                     ; 18DC _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 18E0 _ 89. 04 24
        call    paint_rectangle                         ; 18E3 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 18E8 _ 8B. 45, F0
        lea     edi, [eax+1H]                           ; 18EB _ 8D. 78, 01
        mov     eax, dword [ebp+0CH]                    ; 18EE _ 8B. 45, 0C
        lea     esi, [eax-3H]                           ; 18F1 _ 8D. 70, FD
        mov     eax, dword [ebp+10H]                    ; 18F4 _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 18F7 _ 8D. 58, FD
        mov     eax, dword [ebp+0CH]                    ; 18FA _ 8B. 45, 0C
        lea     ecx, [eax-3H]                           ; 18FD _ 8D. 48, FD
        mov     eax, dword [ebp+8H]                     ; 1900 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 1903 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1906 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1909 _ 8B. 00
        mov     dword [esp+18H], edi                    ; 190B _ 89. 7C 24, 18
        mov     dword [esp+14H], esi                    ; 190F _ 89. 74 24, 14
        mov     dword [esp+10H], ebx                    ; 1913 _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 1917 _ 89. 4C 24, 0C
        mov     dword [esp+8H], 15                      ; 191B _ C7. 44 24, 08, 0000000F
        mov     dword [esp+4H], edx                     ; 1923 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1927 _ 89. 04 24
        call    paint_rectangle                         ; 192A _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 192F _ 8B. 45, F0
        lea     edi, [eax+2H]                           ; 1932 _ 8D. 78, 02
        mov     eax, dword [ebp-14H]                    ; 1935 _ 8B. 45, EC
        lea     esi, [eax+1H]                           ; 1938 _ 8D. 70, 01
        mov     eax, dword [ebp-10H]                    ; 193B _ 8B. 45, F0
        lea     ebx, [eax+2H]                           ; 193E _ 8D. 58, 02
        mov     eax, dword [ebp+0CH]                    ; 1941 _ 8B. 45, 0C
        lea     ecx, [eax-3H]                           ; 1944 _ 8D. 48, FD
        mov     eax, dword [ebp+8H]                     ; 1947 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 194A _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 194D _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1950 _ 8B. 00
        mov     dword [esp+18H], edi                    ; 1952 _ 89. 7C 24, 18
        mov     dword [esp+14H], esi                    ; 1956 _ 89. 74 24, 14
        mov     dword [esp+10H], ebx                    ; 195A _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 195E _ 89. 4C 24, 0C
        mov     dword [esp+8H], 7                       ; 1962 _ C7. 44 24, 08, 00000007
        mov     dword [esp+4H], edx                     ; 196A _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 196E _ 89. 04 24
        call    paint_rectangle                         ; 1971 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 1976 _ 8B. 45, F0
        lea     edi, [eax+2H]                           ; 1979 _ 8D. 78, 02
        mov     eax, dword [ebp-14H]                    ; 197C _ 8B. 45, EC
        lea     esi, [eax+2H]                           ; 197F _ 8D. 70, 02
        mov     eax, dword [ebp+10H]                    ; 1982 _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 1985 _ 8D. 58, FD
        mov     eax, dword [ebp-14H]                    ; 1988 _ 8B. 45, EC
        lea     ecx, [eax+2H]                           ; 198B _ 8D. 48, 02
        mov     eax, dword [ebp+8H]                     ; 198E _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 1991 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1994 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1997 _ 8B. 00
        mov     dword [esp+18H], edi                    ; 1999 _ 89. 7C 24, 18
        mov     dword [esp+14H], esi                    ; 199D _ 89. 74 24, 14
        mov     dword [esp+10H], ebx                    ; 19A1 _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 19A5 _ 89. 4C 24, 0C
        mov     dword [esp+8H], 7                       ; 19A9 _ C7. 44 24, 08, 00000007
        mov     dword [esp+4H], edx                     ; 19B1 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 19B5 _ 89. 04 24
        call    paint_rectangle                         ; 19B8 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 19BD _ 8B. 45, 10
        lea     ecx, [eax-2H]                           ; 19C0 _ 8D. 48, FE
        mov     eax, dword [ebp+10H]                    ; 19C3 _ 8B. 45, 10
        lea     esi, [eax-2H]                           ; 19C6 _ 8D. 70, FE
        mov     eax, dword [ebp+0CH]                    ; 19C9 _ 8B. 45, 0C
        lea     ebx, [eax-1H]                           ; 19CC _ 8D. 58, FF
        mov     eax, dword [ebp+8H]                     ; 19CF _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 19D2 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 19D5 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 19D8 _ 8B. 00
        mov     dword [esp+18H], ecx                    ; 19DA _ 89. 4C 24, 18
        mov     ecx, dword [ebp-14H]                    ; 19DE _ 8B. 4D, EC
        mov     dword [esp+14H], ecx                    ; 19E1 _ 89. 4C 24, 14
        mov     dword [esp+10H], esi                    ; 19E5 _ 89. 74 24, 10
        mov     dword [esp+0CH], ebx                    ; 19E9 _ 89. 5C 24, 0C
        mov     dword [esp+8H], 0                       ; 19ED _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], edx                     ; 19F5 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 19F9 _ 89. 04 24
        call    paint_rectangle                         ; 19FC _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+0CH]                    ; 1A01 _ 8B. 45, 0C
        lea     edi, [eax-2H]                           ; 1A04 _ 8D. 78, FE
        mov     eax, dword [ebp+10H]                    ; 1A07 _ 8B. 45, 10
        lea     esi, [eax-2H]                           ; 1A0A _ 8D. 70, FE
        mov     eax, dword [ebp+0CH]                    ; 1A0D _ 8B. 45, 0C
        lea     ebx, [eax-2H]                           ; 1A10 _ 8D. 58, FE
        mov     eax, dword [ebp+8H]                     ; 1A13 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 1A16 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1A19 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1A1C _ 8B. 00
        mov     ecx, dword [ebp-10H]                    ; 1A1E _ 8B. 4D, F0
        mov     dword [esp+18H], ecx                    ; 1A21 _ 89. 4C 24, 18
        mov     dword [esp+14H], edi                    ; 1A25 _ 89. 7C 24, 14
        mov     dword [esp+10H], esi                    ; 1A29 _ 89. 74 24, 10
        mov     dword [esp+0CH], ebx                    ; 1A2D _ 89. 5C 24, 0C
        mov     dword [esp+8H], 0                       ; 1A31 _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], edx                     ; 1A39 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1A3D _ 89. 04 24
        call    paint_rectangle                         ; 1A40 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 1A45 _ 8B. 45, F0
        lea     ecx, [eax+1H]                           ; 1A48 _ 8D. 48, 01
        mov     eax, dword [ebp-10H]                    ; 1A4B _ 8B. 45, F0
        lea     esi, [eax+1H]                           ; 1A4E _ 8D. 70, 01
        mov     eax, dword [ebp+0CH]                    ; 1A51 _ 8B. 45, 0C
        lea     ebx, [eax-2H]                           ; 1A54 _ 8D. 58, FE
        mov     eax, dword [ebp+8H]                     ; 1A57 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 1A5A _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1A5D _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1A60 _ 8B. 00
        mov     dword [esp+18H], ecx                    ; 1A62 _ 89. 4C 24, 18
        mov     ecx, dword [ebp-14H]                    ; 1A66 _ 8B. 4D, EC
        mov     dword [esp+14H], ecx                    ; 1A69 _ 89. 4C 24, 14
        mov     dword [esp+10H], esi                    ; 1A6D _ 89. 74 24, 10
        mov     dword [esp+0CH], ebx                    ; 1A71 _ 89. 5C 24, 0C
        mov     dword [esp+8H], 8                       ; 1A75 _ C7. 44 24, 08, 00000008
        mov     dword [esp+4H], edx                     ; 1A7D _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1A81 _ 89. 04 24
        call    paint_rectangle                         ; 1A84 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 1A89 _ 8B. 45, F0
        lea     edi, [eax+1H]                           ; 1A8C _ 8D. 78, 01
        mov     eax, dword [ebp-14H]                    ; 1A8F _ 8B. 45, EC
        lea     esi, [eax+1H]                           ; 1A92 _ 8D. 70, 01
        mov     eax, dword [ebp+10H]                    ; 1A95 _ 8B. 45, 10
        lea     ebx, [eax-2H]                           ; 1A98 _ 8D. 58, FE
        mov     eax, dword [ebp-14H]                    ; 1A9B _ 8B. 45, EC
        lea     ecx, [eax+1H]                           ; 1A9E _ 8D. 48, 01
        mov     eax, dword [ebp+8H]                     ; 1AA1 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 1AA4 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1AA7 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1AAA _ 8B. 00
        mov     dword [esp+18H], edi                    ; 1AAC _ 89. 7C 24, 18
        mov     dword [esp+14H], esi                    ; 1AB0 _ 89. 74 24, 14
        mov     dword [esp+10H], ebx                    ; 1AB4 _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 1AB8 _ 89. 4C 24, 0C
        mov     dword [esp+8H], 8                       ; 1ABC _ C7. 44 24, 08, 00000008
        mov     dword [esp+4H], edx                     ; 1AC4 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1AC8 _ 89. 04 24
        call    paint_rectangle                         ; 1ACB _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 1AD0 _ 8B. 45, 10
        lea     edi, [eax-1H]                           ; 1AD3 _ 8D. 78, FF
        mov     eax, dword [ebp+0CH]                    ; 1AD6 _ 8B. 45, 0C
        lea     esi, [eax-1H]                           ; 1AD9 _ 8D. 70, FF
        mov     eax, dword [ebp+1CH]                    ; 1ADC _ 8B. 45, 1C
        movzx   ecx, al                                 ; 1ADF _ 0F B6. C8
        mov     eax, dword [ebp+8H]                     ; 1AE2 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 1AE5 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1AE8 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1AEB _ 8B. 00
        mov     ebx, dword [ebp-10H]                    ; 1AED _ 8B. 5D, F0
        mov     dword [esp+18H], ebx                    ; 1AF0 _ 89. 5C 24, 18
        mov     ebx, dword [ebp-14H]                    ; 1AF4 _ 8B. 5D, EC
        mov     dword [esp+14H], ebx                    ; 1AF7 _ 89. 5C 24, 14
        mov     dword [esp+10H], edi                    ; 1AFB _ 89. 7C 24, 10
        mov     dword [esp+0CH], esi                    ; 1AFF _ 89. 74 24, 0C
        mov     dword [esp+8H], ecx                     ; 1B03 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 1B07 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1B0B _ 89. 04 24
        call    paint_rectangle                         ; 1B0E _ E8, FFFFFFFC(rel)
        add     esp, 44                                 ; 1B13 _ 83. C4, 2C
        pop     ebx                                     ; 1B16 _ 5B
        pop     esi                                     ; 1B17 _ 5E
        pop     edi                                     ; 1B18 _ 5F
        pop     ebp                                     ; 1B19 _ 5D
        ret                                             ; 1B1A _ C3
; make_textbox End of function

make_windows:; Function begin
        push    ebp                                     ; 1B1B _ 55
        mov     ebp, esp                                ; 1B1C _ 89. E5
        push    ebx                                     ; 1B1E _ 53
        sub     esp, 52                                 ; 1B1F _ 83. EC, 34
        mov     eax, dword [ebp+14H]                    ; 1B22 _ 8B. 45, 14
        mov     byte [ebp-1CH], al                      ; 1B25 _ 88. 45, E4
        mov     eax, dword [ebp+0CH]                    ; 1B28 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 1B2B _ 8B. 40, 04
        mov     dword [ebp-10H], eax                    ; 1B2E _ 89. 45, F0
        mov     eax, dword [ebp+0CH]                    ; 1B31 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 1B34 _ 8B. 40, 08
        mov     dword [ebp-0CH], eax                    ; 1B37 _ 89. 45, F4
        mov     eax, dword [ebp-10H]                    ; 1B3A _ 8B. 45, F0
        lea     edx, [eax-1H]                           ; 1B3D _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 1B40 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1B43 _ 8B. 00
        mov     dword [esp+18H], 0                      ; 1B45 _ C7. 44 24, 18, 00000000
        mov     dword [esp+14H], edx                    ; 1B4D _ 89. 54 24, 14
        mov     dword [esp+10H], 0                      ; 1B51 _ C7. 44 24, 10, 00000000
        mov     dword [esp+0CH], 0                      ; 1B59 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 8                       ; 1B61 _ C7. 44 24, 08, 00000008
        mov     edx, dword [ebp-10H]                    ; 1B69 _ 8B. 55, F0
        mov     dword [esp+4H], edx                     ; 1B6C _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1B70 _ 89. 04 24
        call    paint_rectangle                         ; 1B73 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 1B78 _ 8B. 45, F0
        lea     edx, [eax-2H]                           ; 1B7B _ 8D. 50, FE
        mov     eax, dword [ebp+0CH]                    ; 1B7E _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1B81 _ 8B. 00
        mov     dword [esp+18H], 1                      ; 1B83 _ C7. 44 24, 18, 00000001
        mov     dword [esp+14H], edx                    ; 1B8B _ 89. 54 24, 14
        mov     dword [esp+10H], 1                      ; 1B8F _ C7. 44 24, 10, 00000001
        mov     dword [esp+0CH], 1                      ; 1B97 _ C7. 44 24, 0C, 00000001
        mov     dword [esp+8H], 7                       ; 1B9F _ C7. 44 24, 08, 00000007
        mov     edx, dword [ebp-10H]                    ; 1BA7 _ 8B. 55, F0
        mov     dword [esp+4H], edx                     ; 1BAA _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1BAE _ 89. 04 24
        call    paint_rectangle                         ; 1BB1 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 1BB6 _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 1BB9 _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 1BBC _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1BBF _ 8B. 00
        mov     dword [esp+18H], edx                    ; 1BC1 _ 89. 54 24, 18
        mov     dword [esp+14H], 0                      ; 1BC5 _ C7. 44 24, 14, 00000000
        mov     dword [esp+10H], 0                      ; 1BCD _ C7. 44 24, 10, 00000000
        mov     dword [esp+0CH], 0                      ; 1BD5 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 8                       ; 1BDD _ C7. 44 24, 08, 00000008
        mov     edx, dword [ebp-10H]                    ; 1BE5 _ 8B. 55, F0
        mov     dword [esp+4H], edx                     ; 1BE8 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1BEC _ 89. 04 24
        call    paint_rectangle                         ; 1BEF _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 1BF4 _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 1BF7 _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 1BFA _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1BFD _ 8B. 00
        mov     dword [esp+18H], edx                    ; 1BFF _ 89. 54 24, 18
        mov     dword [esp+14H], 1                      ; 1C03 _ C7. 44 24, 14, 00000001
        mov     dword [esp+10H], 1                      ; 1C0B _ C7. 44 24, 10, 00000001
        mov     dword [esp+0CH], 1                      ; 1C13 _ C7. 44 24, 0C, 00000001
        mov     dword [esp+8H], 7                       ; 1C1B _ C7. 44 24, 08, 00000007
        mov     edx, dword [ebp-10H]                    ; 1C23 _ 8B. 55, F0
        mov     dword [esp+4H], edx                     ; 1C26 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1C2A _ 89. 04 24
        call    paint_rectangle                         ; 1C2D _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 1C32 _ 8B. 45, F4
        lea     ebx, [eax-2H]                           ; 1C35 _ 8D. 58, FE
        mov     eax, dword [ebp-10H]                    ; 1C38 _ 8B. 45, F0
        lea     ecx, [eax-2H]                           ; 1C3B _ 8D. 48, FE
        mov     eax, dword [ebp-10H]                    ; 1C3E _ 8B. 45, F0
        lea     edx, [eax-2H]                           ; 1C41 _ 8D. 50, FE
        mov     eax, dword [ebp+0CH]                    ; 1C44 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1C47 _ 8B. 00
        mov     dword [esp+18H], ebx                    ; 1C49 _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 1C4D _ 89. 4C 24, 14
        mov     dword [esp+10H], 1                      ; 1C51 _ C7. 44 24, 10, 00000001
        mov     dword [esp+0CH], edx                    ; 1C59 _ 89. 54 24, 0C
        mov     dword [esp+8H], 15                      ; 1C5D _ C7. 44 24, 08, 0000000F
        mov     edx, dword [ebp-10H]                    ; 1C65 _ 8B. 55, F0
        mov     dword [esp+4H], edx                     ; 1C68 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1C6C _ 89. 04 24
        call    paint_rectangle                         ; 1C6F _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 1C74 _ 8B. 45, F4
        lea     ebx, [eax-1H]                           ; 1C77 _ 8D. 58, FF
        mov     eax, dword [ebp-10H]                    ; 1C7A _ 8B. 45, F0
        lea     ecx, [eax-1H]                           ; 1C7D _ 8D. 48, FF
        mov     eax, dword [ebp-10H]                    ; 1C80 _ 8B. 45, F0
        lea     edx, [eax-1H]                           ; 1C83 _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 1C86 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1C89 _ 8B. 00
        mov     dword [esp+18H], ebx                    ; 1C8B _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 1C8F _ 89. 4C 24, 14
        mov     dword [esp+10H], 0                      ; 1C93 _ C7. 44 24, 10, 00000000
        mov     dword [esp+0CH], edx                    ; 1C9B _ 89. 54 24, 0C
        mov     dword [esp+8H], 0                       ; 1C9F _ C7. 44 24, 08, 00000000
        mov     edx, dword [ebp-10H]                    ; 1CA7 _ 8B. 55, F0
        mov     dword [esp+4H], edx                     ; 1CAA _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1CAE _ 89. 04 24
        call    paint_rectangle                         ; 1CB1 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 1CB6 _ 8B. 45, F4
        lea     ecx, [eax-3H]                           ; 1CB9 _ 8D. 48, FD
        mov     eax, dword [ebp-10H]                    ; 1CBC _ 8B. 45, F0
        lea     edx, [eax-3H]                           ; 1CBF _ 8D. 50, FD
        mov     eax, dword [ebp+0CH]                    ; 1CC2 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1CC5 _ 8B. 00
        mov     dword [esp+18H], ecx                    ; 1CC7 _ 89. 4C 24, 18
        mov     dword [esp+14H], edx                    ; 1CCB _ 89. 54 24, 14
        mov     dword [esp+10H], 2                      ; 1CCF _ C7. 44 24, 10, 00000002
        mov     dword [esp+0CH], 2                      ; 1CD7 _ C7. 44 24, 0C, 00000002
        mov     dword [esp+8H], 8                       ; 1CDF _ C7. 44 24, 08, 00000008
        mov     edx, dword [ebp-10H]                    ; 1CE7 _ 8B. 55, F0
        mov     dword [esp+4H], edx                     ; 1CEA _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1CEE _ 89. 04 24
        call    paint_rectangle                         ; 1CF1 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 1CF6 _ 8B. 45, F0
        lea     edx, [eax-4H]                           ; 1CF9 _ 8D. 50, FC
        mov     eax, dword [ebp+0CH]                    ; 1CFC _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1CFF _ 8B. 00
        mov     dword [esp+18H], 20                     ; 1D01 _ C7. 44 24, 18, 00000014
        mov     dword [esp+14H], edx                    ; 1D09 _ 89. 54 24, 14
        mov     dword [esp+10H], 3                      ; 1D0D _ C7. 44 24, 10, 00000003
        mov     dword [esp+0CH], 3                      ; 1D15 _ C7. 44 24, 0C, 00000003
        mov     dword [esp+8H], 12                      ; 1D1D _ C7. 44 24, 08, 0000000C
        mov     edx, dword [ebp-10H]                    ; 1D25 _ 8B. 55, F0
        mov     dword [esp+4H], edx                     ; 1D28 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1D2C _ 89. 04 24
        call    paint_rectangle                         ; 1D2F _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 1D34 _ 8B. 45, F4
        lea     ebx, [eax-2H]                           ; 1D37 _ 8D. 58, FE
        mov     eax, dword [ebp-10H]                    ; 1D3A _ 8B. 45, F0
        lea     ecx, [eax-2H]                           ; 1D3D _ 8D. 48, FE
        mov     eax, dword [ebp-0CH]                    ; 1D40 _ 8B. 45, F4
        lea     edx, [eax-2H]                           ; 1D43 _ 8D. 50, FE
        mov     eax, dword [ebp+0CH]                    ; 1D46 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1D49 _ 8B. 00
        mov     dword [esp+18H], ebx                    ; 1D4B _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 1D4F _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 1D53 _ 89. 54 24, 10
        mov     dword [esp+0CH], 1                      ; 1D57 _ C7. 44 24, 0C, 00000001
        mov     dword [esp+8H], 15                      ; 1D5F _ C7. 44 24, 08, 0000000F
        mov     edx, dword [ebp-10H]                    ; 1D67 _ 8B. 55, F0
        mov     dword [esp+4H], edx                     ; 1D6A _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1D6E _ 89. 04 24
        call    paint_rectangle                         ; 1D71 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 1D76 _ 8B. 45, F4
        lea     ebx, [eax-1H]                           ; 1D79 _ 8D. 58, FF
        mov     eax, dword [ebp-10H]                    ; 1D7C _ 8B. 45, F0
        lea     ecx, [eax-1H]                           ; 1D7F _ 8D. 48, FF
        mov     eax, dword [ebp-0CH]                    ; 1D82 _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 1D85 _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 1D88 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1D8B _ 8B. 00
        mov     dword [esp+18H], ebx                    ; 1D8D _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 1D91 _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 1D95 _ 89. 54 24, 10
        mov     dword [esp+0CH], 0                      ; 1D99 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 0                       ; 1DA1 _ C7. 44 24, 08, 00000000
        mov     edx, dword [ebp-10H]                    ; 1DA9 _ 8B. 55, F0
        mov     dword [esp+4H], edx                     ; 1DAC _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1DB0 _ 89. 04 24
        call    paint_rectangle                         ; 1DB3 _ E8, FFFFFFFC(rel)
        movsx   eax, byte [ebp-1CH]                     ; 1DB8 _ 0F BE. 45, E4
        mov     dword [esp+0CH], eax                    ; 1DBC _ 89. 44 24, 0C
        mov     eax, dword [ebp+10H]                    ; 1DC0 _ 8B. 45, 10
        mov     dword [esp+8H], eax                     ; 1DC3 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 1DC7 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 1DCA _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1DCE _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1DD1 _ 89. 04 24
        call    make_window_title                       ; 1DD4 _ E8, FFFFFFFC(rel)
        add     esp, 52                                 ; 1DD9 _ 83. C4, 34
        pop     ebx                                     ; 1DDC _ 5B
        pop     ebp                                     ; 1DDD _ 5D
        ret                                             ; 1DDE _ C3
; make_windows End of function

make_window_title:; Function begin
        push    ebp                                     ; 1DDF _ 55
        mov     ebp, esp                                ; 1DE0 _ 89. E5
        push    ebx                                     ; 1DE2 _ 53
        sub     esp, 52                                 ; 1DE3 _ 83. EC, 34
        mov     eax, dword [ebp+14H]                    ; 1DE6 _ 8B. 45, 14
        mov     byte [ebp-1CH], al                      ; 1DE9 _ 88. 45, E4
        cmp     byte [ebp-1CH], 0                       ; 1DEC _ 80. 7D, E4, 00
        jz      ?_052                                   ; 1DF0 _ 74, 0A
        mov     byte [ebp-12H], 7                       ; 1DF2 _ C6. 45, EE, 07
        mov     byte [ebp-11H], 12                      ; 1DF6 _ C6. 45, EF, 0C
        jmp     ?_053                                   ; 1DFA _ EB, 08

?_052:  mov     byte [ebp-12H], 8                       ; 1DFC _ C6. 45, EE, 08
        mov     byte [ebp-11H], 15                      ; 1E00 _ C6. 45, EF, 0F
?_053:  mov     eax, dword [ebp+0CH]                    ; 1E04 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 1E07 _ 8B. 40, 04
        lea     ebx, [eax-4H]                           ; 1E0A _ 8D. 58, FC
        movzx   eax, byte [ebp-11H]                     ; 1E0D _ 0F B6. 45, EF
        movzx   ecx, al                                 ; 1E11 _ 0F B6. C8
        mov     eax, dword [ebp+0CH]                    ; 1E14 _ 8B. 45, 0C
        mov     edx, dword [eax+4H]                     ; 1E17 _ 8B. 50, 04
        mov     eax, dword [ebp+0CH]                    ; 1E1A _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1E1D _ 8B. 00
        mov     dword [esp+18H], 20                     ; 1E1F _ C7. 44 24, 18, 00000014
        mov     dword [esp+14H], ebx                    ; 1E27 _ 89. 5C 24, 14
        mov     dword [esp+10H], 3                      ; 1E2B _ C7. 44 24, 10, 00000003
        mov     dword [esp+0CH], 3                      ; 1E33 _ C7. 44 24, 0C, 00000003
        mov     dword [esp+8H], ecx                     ; 1E3B _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 1E3F _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1E43 _ 89. 04 24
        call    paint_rectangle                         ; 1E46 _ E8, FFFFFFFC(rel)
        movsx   eax, byte [ebp-12H]                     ; 1E4B _ 0F BE. 45, EE
        mov     dword [esp+14H], eax                    ; 1E4F _ 89. 44 24, 14
        mov     eax, dword [ebp+10H]                    ; 1E53 _ 8B. 45, 10
        mov     dword [esp+10H], eax                    ; 1E56 _ 89. 44 24, 10
        mov     dword [esp+0CH], 4                      ; 1E5A _ C7. 44 24, 0C, 00000004
        mov     dword [esp+8H], 24                      ; 1E62 _ C7. 44 24, 08, 00000018
        mov     eax, dword [ebp+0CH]                    ; 1E6A _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 1E6D _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1E71 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1E74 _ 89. 04 24
        call    paint_string                            ; 1E77 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], 0                      ; 1E7C _ C7. 45, F4, 00000000
        jmp     ?_061                                   ; 1E83 _ E9, 00000083

?_054:  mov     dword [ebp-10H], 0                      ; 1E88 _ C7. 45, F0, 00000000
        jmp     ?_060                                   ; 1E8F _ EB, 70

?_055:  mov     eax, dword [ebp-0CH]                    ; 1E91 _ 8B. 45, F4
        shl     eax, 4                                  ; 1E94 _ C1. E0, 04
        mov     edx, eax                                ; 1E97 _ 89. C2
        mov     eax, dword [ebp-10H]                    ; 1E99 _ 8B. 45, F0
        add     eax, edx                                ; 1E9C _ 01. D0
        add     eax, closebtn.1913                      ; 1E9E _ 05, 00000260(d)
        movzx   eax, byte [eax]                         ; 1EA3 _ 0F B6. 00
        mov     byte [ebp-13H], al                      ; 1EA6 _ 88. 45, ED
        cmp     byte [ebp-13H], 64                      ; 1EA9 _ 80. 7D, ED, 40
        jnz     ?_056                                   ; 1EAD _ 75, 06
        mov     byte [ebp-13H], 0                       ; 1EAF _ C6. 45, ED, 00
        jmp     ?_059                                   ; 1EB3 _ EB, 1C

?_056:  cmp     byte [ebp-13H], 36                      ; 1EB5 _ 80. 7D, ED, 24
        jnz     ?_057                                   ; 1EB9 _ 75, 06
        mov     byte [ebp-13H], 15                      ; 1EBB _ C6. 45, ED, 0F
        jmp     ?_059                                   ; 1EBF _ EB, 10

?_057:  cmp     byte [ebp-13H], 81                      ; 1EC1 _ 80. 7D, ED, 51
        jnz     ?_058                                   ; 1EC5 _ 75, 06
        mov     byte [ebp-13H], 8                       ; 1EC7 _ C6. 45, ED, 08
        jmp     ?_059                                   ; 1ECB _ EB, 04

?_058:  mov     byte [ebp-13H], 7                       ; 1ECD _ C6. 45, ED, 07
?_059:  mov     eax, dword [ebp+0CH]                    ; 1ED1 _ 8B. 45, 0C
        mov     edx, dword [eax]                        ; 1ED4 _ 8B. 10
        mov     eax, dword [ebp-0CH]                    ; 1ED6 _ 8B. 45, F4
        lea     ecx, [eax+5H]                           ; 1ED9 _ 8D. 48, 05
        mov     eax, dword [ebp+0CH]                    ; 1EDC _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 1EDF _ 8B. 40, 04
        imul    ecx, eax                                ; 1EE2 _ 0F AF. C8
        mov     eax, dword [ebp+0CH]                    ; 1EE5 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 1EE8 _ 8B. 40, 04
        lea     ebx, [eax-15H]                          ; 1EEB _ 8D. 58, EB
        mov     eax, dword [ebp-10H]                    ; 1EEE _ 8B. 45, F0
        add     eax, ebx                                ; 1EF1 _ 01. D8
        add     eax, ecx                                ; 1EF3 _ 01. C8
        add     edx, eax                                ; 1EF5 _ 01. C2
        movzx   eax, byte [ebp-13H]                     ; 1EF7 _ 0F B6. 45, ED
        mov     byte [edx], al                          ; 1EFB _ 88. 02
        add     dword [ebp-10H], 1                      ; 1EFD _ 83. 45, F0, 01
?_060:  cmp     dword [ebp-10H], 15                     ; 1F01 _ 83. 7D, F0, 0F
        jle     ?_055                                   ; 1F05 _ 7E, 8A
        add     dword [ebp-0CH], 1                      ; 1F07 _ 83. 45, F4, 01
?_061:  cmp     dword [ebp-0CH], 13                     ; 1F0B _ 83. 7D, F4, 0D
        jle     ?_054                                   ; 1F0F _ 0F 8E, FFFFFF73
        add     esp, 52                                 ; 1F15 _ 83. C4, 34
        pop     ebx                                     ; 1F18 _ 5B
        pop     ebp                                     ; 1F19 _ 5D
        ret                                             ; 1F1A _ C3
; make_window_title End of function

transfer_scancode:; Function begin
        push    ebp                                     ; 1F1B _ 55
        mov     ebp, esp                                ; 1F1C _ 89. E5
        sub     esp, 16                                 ; 1F1E _ 83. EC, 10
        cmp     dword [ebp+8H], 42                      ; 1F21 _ 83. 7D, 08, 2A
        jnz     ?_062                                   ; 1F25 _ 75, 0D
        mov     eax, dword [key_shift]                  ; 1F27 _ A1, 000001D0(d)
        or      eax, 01H                                ; 1F2C _ 83. C8, 01
        mov     dword [key_shift], eax                  ; 1F2F _ A3, 000001D0(d)
?_062:  cmp     dword [ebp+8H], 54                      ; 1F34 _ 83. 7D, 08, 36
        jnz     ?_063                                   ; 1F38 _ 75, 0D
        mov     eax, dword [key_shift]                  ; 1F3A _ A1, 000001D0(d)
        or      eax, 02H                                ; 1F3F _ 83. C8, 02
        mov     dword [key_shift], eax                  ; 1F42 _ A3, 000001D0(d)
?_063:  cmp     dword [ebp+8H], 170                     ; 1F47 _ 81. 7D, 08, 000000AA
        jnz     ?_064                                   ; 1F4E _ 75, 0D
        mov     eax, dword [key_shift]                  ; 1F50 _ A1, 000001D0(d)
        and     eax, 0FFFFFFFEH                         ; 1F55 _ 83. E0, FE
        mov     dword [key_shift], eax                  ; 1F58 _ A3, 000001D0(d)
?_064:  cmp     dword [ebp+8H], 182                     ; 1F5D _ 81. 7D, 08, 000000B6
        jnz     ?_065                                   ; 1F64 _ 75, 0D
        mov     eax, dword [key_shift]                  ; 1F66 _ A1, 000001D0(d)
        and     eax, 0FFFFFFFDH                         ; 1F6B _ 83. E0, FD
        mov     dword [key_shift], eax                  ; 1F6E _ A3, 000001D0(d)
?_065:  cmp     dword [ebp+8H], 58                      ; 1F73 _ 83. 7D, 08, 3A
        jnz     ?_067                                   ; 1F77 _ 75, 1F
        mov     eax, dword [caps_lock]                  ; 1F79 _ A1, 000001D4(d)
        test    eax, eax                                ; 1F7E _ 85. C0
        jnz     ?_066                                   ; 1F80 _ 75, 0C
        mov     dword [caps_lock], 1                    ; 1F82 _ C7. 05, 000001D4(d), 00000001
        jmp     ?_067                                   ; 1F8C _ EB, 0A

?_066:  mov     dword [caps_lock], 0                    ; 1F8E _ C7. 05, 000001D4(d), 00000000
?_067:  cmp     dword [ebp+8H], 42                      ; 1F98 _ 83. 7D, 08, 2A
        jz      ?_068                                   ; 1F9C _ 74, 24
        cmp     dword [ebp+8H], 54                      ; 1F9E _ 83. 7D, 08, 36
        jz      ?_068                                   ; 1FA2 _ 74, 1E
        cmp     dword [ebp+8H], 170                     ; 1FA4 _ 81. 7D, 08, 000000AA
        jz      ?_068                                   ; 1FAB _ 74, 15
        cmp     dword [ebp+8H], 182                     ; 1FAD _ 81. 7D, 08, 000000B6
        jz      ?_068                                   ; 1FB4 _ 74, 0C
        cmp     dword [ebp+8H], 127                     ; 1FB6 _ 83. 7D, 08, 7F
        jg      ?_068                                   ; 1FBA _ 7F, 06
        cmp     dword [ebp+8H], 58                      ; 1FBC _ 83. 7D, 08, 3A
        jnz     ?_069                                   ; 1FC0 _ 75, 0A
?_068:  mov     eax, 0                                  ; 1FC2 _ B8, 00000000
        jmp     ?_074                                   ; 1FC7 _ E9, 00000089

?_069:  mov     byte [ebp-1H], 0                        ; 1FCC _ C6. 45, FF, 00
        mov     eax, dword [key_shift]                  ; 1FD0 _ A1, 000001D0(d)
        test    eax, eax                                ; 1FD5 _ 85. C0
        jnz     ?_071                                   ; 1FD7 _ 75, 46
        cmp     dword [ebp+8H], 127                     ; 1FD9 _ 83. 7D, 08, 7F
        jg      ?_071                                   ; 1FDD _ 7F, 40
        mov     eax, dword [ebp+8H]                     ; 1FDF _ 8B. 45, 08
        add     eax, keytable                           ; 1FE2 _ 05, 00000020(d)
        movzx   eax, byte [eax]                         ; 1FE7 _ 0F B6. 00
        test    al, al                                  ; 1FEA _ 84. C0
        jz      ?_071                                   ; 1FEC _ 74, 31
        mov     eax, dword [ebp+8H]                     ; 1FEE _ 8B. 45, 08
        add     eax, keytable                           ; 1FF1 _ 05, 00000020(d)
        movzx   eax, byte [eax]                         ; 1FF6 _ 0F B6. 00
        mov     byte [ebp-1H], al                       ; 1FF9 _ 88. 45, FF
        cmp     byte [ebp-1H], 64                       ; 1FFC _ 80. 7D, FF, 40
        jle     ?_070                                   ; 2000 _ 7E, 1B
        cmp     byte [ebp-1H], 90                       ; 2002 _ 80. 7D, FF, 5A
        jg      ?_070                                   ; 2006 _ 7F, 15
        mov     eax, dword [caps_lock]                  ; 2008 _ A1, 000001D4(d)
        test    eax, eax                                ; 200D _ 85. C0
        jnz     ?_070                                   ; 200F _ 75, 0C
        movzx   eax, byte [ebp-1H]                      ; 2011 _ 0F B6. 45, FF
        add     eax, 32                                 ; 2015 _ 83. C0, 20
        mov     byte [ebp-1H], al                       ; 2018 _ 88. 45, FF
        jmp     ?_073                                   ; 201B _ EB, 34

?_070:  jmp     ?_073                                   ; 201D _ EB, 32

?_071:  mov     eax, dword [key_shift]                  ; 201F _ A1, 000001D0(d)
        test    eax, eax                                ; 2024 _ 85. C0
        jz      ?_072                                   ; 2026 _ 74, 25
        cmp     dword [ebp+8H], 83                      ; 2028 _ 83. 7D, 08, 53
        jg      ?_072                                   ; 202C _ 7F, 1F
        mov     eax, dword [ebp+8H]                     ; 202E _ 8B. 45, 08
        add     eax, keytable_shift                     ; 2031 _ 05, 000000A0(d)
        movzx   eax, byte [eax]                         ; 2036 _ 0F B6. 00
        test    al, al                                  ; 2039 _ 84. C0
        jz      ?_072                                   ; 203B _ 74, 10
        mov     eax, dword [ebp+8H]                     ; 203D _ 8B. 45, 08
        add     eax, keytable_shift                     ; 2040 _ 05, 000000A0(d)
        movzx   eax, byte [eax]                         ; 2045 _ 0F B6. 00
        mov     byte [ebp-1H], al                       ; 2048 _ 88. 45, FF
        jmp     ?_073                                   ; 204B _ EB, 04

?_072:  mov     byte [ebp-1H], 0                        ; 204D _ C6. 45, FF, 00
?_073:  movzx   eax, byte [ebp-1H]                      ; 2051 _ 0F B6. 45, FF
?_074:  leave                                           ; 2055 _ C9
        ret                                             ; 2056 _ C3
; transfer_scancode End of function

is_special_key:; Function begin
        push    ebp                                     ; 2057 _ 55
        mov     ebp, esp                                ; 2058 _ 89. E5
        sub     esp, 4                                  ; 205A _ 83. EC, 04
        mov     eax, dword [ebp+8H]                     ; 205D _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2060 _ 89. 04 24
        call    transfer_scancode                       ; 2063 _ E8, FFFFFFFC(rel)
        cmp     dword [ebp+8H], 42                      ; 2068 _ 83. 7D, 08, 2A
        jz      ?_075                                   ; 206C _ 74, 27
        cmp     dword [ebp+8H], 54                      ; 206E _ 83. 7D, 08, 36
        jz      ?_075                                   ; 2072 _ 74, 21
        cmp     dword [ebp+8H], 170                     ; 2074 _ 81. 7D, 08, 000000AA
        jz      ?_075                                   ; 207B _ 74, 18
        cmp     dword [ebp+8H], 182                     ; 207D _ 81. 7D, 08, 000000B6
        jz      ?_075                                   ; 2084 _ 74, 0F
        cmp     dword [ebp+8H], 58                      ; 2086 _ 83. 7D, 08, 3A
        jz      ?_075                                   ; 208A _ 74, 09
        cmp     dword [ebp+8H], 186                     ; 208C _ 81. 7D, 08, 000000BA
        jnz     ?_076                                   ; 2093 _ 75, 07
?_075:  mov     eax, 1                                  ; 2095 _ B8, 00000001
        jmp     ?_077                                   ; 209A _ EB, 05

?_076:  mov     eax, 0                                  ; 209C _ B8, 00000000
?_077:  leave                                           ; 20A1 _ C9
        ret                                             ; 20A2 _ C3
; is_special_key End of function

console_task:; Function begin
        push    ebp                                     ; 20A3 _ 55
        mov     ebp, esp                                ; 20A4 _ 89. E5
        sub     esp, 200                                ; 20A6 _ 81. EC, 000000C8
        mov     eax, dword [ebp+8H]                     ; 20AC _ 8B. 45, 08
        mov     dword [ebp-0ACH], eax                   ; 20AF _ 89. 85, FFFFFF54
; Note: Absolute memory address without relocation
        mov     eax, dword [gs:14H]                     ; 20B5 _ 65: A1, 00000014
        mov     dword [ebp-0CH], eax                    ; 20BB _ 89. 45, F4
        xor     eax, eax                                ; 20BE _ 31. C0
        call    task_now                                ; 20C0 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-9CH], eax                    ; 20C5 _ 89. 85, FFFFFF64
        mov     dword [ebp-0A4H], 16                    ; 20CB _ C7. 85, FFFFFF5C, 00000010
        mov     dword [ebp-98H], 28                     ; 20D5 _ C7. 85, FFFFFF68, 0000001C
        mov     dword [ebp-0A0H], 0                     ; 20DF _ C7. 85, FFFFFF60, 00000000
        mov     eax, dword [ebp-9CH]                    ; 20E9 _ 8B. 85, FFFFFF64
        lea     edx, [eax+10H]                          ; 20EF _ 8D. 50, 10
        mov     eax, dword [ebp-9CH]                    ; 20F2 _ 8B. 85, FFFFFF64
        mov     dword [esp+0CH], eax                    ; 20F8 _ 89. 44 24, 0C
        lea     eax, [ebp-8CH]                          ; 20FC _ 8D. 85, FFFFFF74
        mov     dword [esp+8H], eax                     ; 2102 _ 89. 44 24, 08
        mov     dword [esp+4H], 128                     ; 2106 _ C7. 44 24, 04, 00000080
        mov     dword [esp], edx                        ; 210E _ 89. 14 24
        call    fifo8_init                              ; 2111 _ E8, FFFFFFFC(rel)
        call    timer_alloc                             ; 2116 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-94H], eax                    ; 211B _ 89. 85, FFFFFF6C
        mov     eax, dword [ebp-9CH]                    ; 2121 _ 8B. 85, FFFFFF64
        add     eax, 16                                 ; 2127 _ 83. C0, 10
        mov     dword [esp+8H], 1                       ; 212A _ C7. 44 24, 08, 00000001
        mov     dword [esp+4H], eax                     ; 2132 _ 89. 44 24, 04
        mov     eax, dword [ebp-94H]                    ; 2136 _ 8B. 85, FFFFFF6C
        mov     dword [esp], eax                        ; 213C _ 89. 04 24
        call    timer_init                              ; 213F _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 50                      ; 2144 _ C7. 44 24, 04, 00000032
        mov     eax, dword [ebp-94H]                    ; 214C _ 8B. 85, FFFFFF6C
        mov     dword [esp], eax                        ; 2152 _ 89. 04 24
        call    timer_settime                           ; 2155 _ E8, FFFFFFFC(rel)
        mov     eax, dword [sheet_control]              ; 215A _ A1, 00000000(d)
        mov     dword [esp+14H], 7                      ; 215F _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_240                  ; 2167 _ C7. 44 24, 10, 00000060(d)
        mov     dword [esp+0CH], 28                     ; 216F _ C7. 44 24, 0C, 0000001C
        mov     dword [esp+8H], 8                       ; 2177 _ C7. 44 24, 08, 00000008
        mov     edx, dword [ebp-0ACH]                   ; 217F _ 8B. 95, FFFFFF54
        mov     dword [esp+4H], edx                     ; 2185 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 2189 _ 89. 04 24
        call    paint_string                            ; 218C _ E8, FFFFFFFC(rel)
?_078:  call    io_cli                                  ; 2191 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-9CH]                    ; 2196 _ 8B. 85, FFFFFF64
        add     eax, 16                                 ; 219C _ 83. C0, 10
        mov     dword [esp], eax                        ; 219F _ 89. 04 24
        call    fifo8_status                            ; 21A2 _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 21A7 _ 85. C0
        jnz     ?_079                                   ; 21A9 _ 75, 0A
        call    io_sti                                  ; 21AB _ E8, FFFFFFFC(rel)
        jmp     ?_087                                   ; 21B0 _ E9, 00000347

?_079:  mov     eax, dword [ebp-9CH]                    ; 21B5 _ 8B. 85, FFFFFF64
        add     eax, 16                                 ; 21BB _ 83. C0, 10
        mov     dword [esp], eax                        ; 21BE _ 89. 04 24
        call    fifo8_get                               ; 21C1 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-90H], eax                    ; 21C6 _ 89. 85, FFFFFF70
        call    io_sti                                  ; 21CC _ E8, FFFFFFFC(rel)
        cmp     dword [ebp-90H], 1                      ; 21D1 _ 83. BD, FFFFFF70, 01
        jg      ?_082                                   ; 21D8 _ 0F 8F, 0000008D
        cmp     dword [ebp-0A0H], 0                     ; 21DE _ 83. BD, FFFFFF60, 00
        js      ?_082                                   ; 21E5 _ 0F 88, 00000080
        cmp     dword [ebp-90H], 0                      ; 21EB _ 83. BD, FFFFFF70, 00
        jz      ?_080                                   ; 21F2 _ 74, 2F
        mov     eax, dword [ebp-9CH]                    ; 21F4 _ 8B. 85, FFFFFF64
        add     eax, 16                                 ; 21FA _ 83. C0, 10
        mov     dword [esp+8H], 0                       ; 21FD _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], eax                     ; 2205 _ 89. 44 24, 04
        mov     eax, dword [ebp-94H]                    ; 2209 _ 8B. 85, FFFFFF6C
        mov     dword [esp], eax                        ; 220F _ 89. 04 24
        call    timer_init                              ; 2212 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0A0H], 7                     ; 2217 _ C7. 85, FFFFFF60, 00000007
        jmp     ?_081                                   ; 2221 _ EB, 2D

?_080:  mov     eax, dword [ebp-9CH]                    ; 2223 _ 8B. 85, FFFFFF64
        add     eax, 16                                 ; 2229 _ 83. C0, 10
        mov     dword [esp+8H], 1                       ; 222C _ C7. 44 24, 08, 00000001
        mov     dword [esp+4H], eax                     ; 2234 _ 89. 44 24, 04
        mov     eax, dword [ebp-94H]                    ; 2238 _ 8B. 85, FFFFFF6C
        mov     dword [esp], eax                        ; 223E _ 89. 04 24
        call    timer_init                              ; 2241 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0A0H], 0                     ; 2246 _ C7. 85, FFFFFF60, 00000000
?_081:  mov     dword [esp+4H], 50                      ; 2250 _ C7. 44 24, 04, 00000032
        mov     eax, dword [ebp-94H]                    ; 2258 _ 8B. 85, FFFFFF6C
        mov     dword [esp], eax                        ; 225E _ 89. 04 24
        call    timer_settime                           ; 2261 _ E8, FFFFFFFC(rel)
        jmp     ?_086                                   ; 2266 _ E9, 0000024E

?_082:  cmp     dword [ebp-90H], 87                     ; 226B _ 83. BD, FFFFFF70, 57
        jnz     ?_083                                   ; 2272 _ 75, 48
        mov     dword [ebp-0A0H], 7                     ; 2274 _ C7. 85, FFFFFF60, 00000007
        mov     eax, dword [ebp-9CH]                    ; 227E _ 8B. 85, FFFFFF64
        add     eax, 16                                 ; 2284 _ 83. C0, 10
        mov     dword [esp+8H], 0                       ; 2287 _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], eax                     ; 228F _ 89. 44 24, 04
        mov     eax, dword [ebp-94H]                    ; 2293 _ 8B. 85, FFFFFF6C
        mov     dword [esp], eax                        ; 2299 _ 89. 04 24
        call    timer_init                              ; 229C _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 50                      ; 22A1 _ C7. 44 24, 04, 00000032
        mov     eax, dword [ebp-94H]                    ; 22A9 _ 8B. 85, FFFFFF6C
        mov     dword [esp], eax                        ; 22AF _ 89. 04 24
        call    timer_settime                           ; 22B2 _ E8, FFFFFFFC(rel)
        jmp     ?_086                                   ; 22B7 _ E9, 000001FD

?_083:  cmp     dword [ebp-90H], 88                     ; 22BC _ 83. BD, FFFFFF70, 58
        jnz     ?_084                                   ; 22C3 _ 75, 5F
        mov     eax, dword [sheet_control]              ; 22C5 _ A1, 00000000(d)
        mov     dword [esp+10H], 0                      ; 22CA _ C7. 44 24, 10, 00000000
        mov     edx, dword [ebp-98H]                    ; 22D2 _ 8B. 95, FFFFFF68
        mov     dword [esp+0CH], edx                    ; 22D8 _ 89. 54 24, 0C
        mov     edx, dword [ebp-0A4H]                   ; 22DC _ 8B. 95, FFFFFF5C
        mov     dword [esp+8H], edx                     ; 22E2 _ 89. 54 24, 08
        mov     edx, dword [ebp-0ACH]                   ; 22E6 _ 8B. 95, FFFFFF54
        mov     dword [esp+4H], edx                     ; 22EC _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 22F0 _ 89. 04 24
        call    set_cursor                              ; 22F3 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0A0H], -1                    ; 22F8 _ C7. 85, FFFFFF60, FFFFFFFF
        mov     eax, dword [task_main]                  ; 2302 _ A1, 00000000(d)
        mov     dword [esp+8H], 0                       ; 2307 _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], -1                      ; 230F _ C7. 44 24, 04, FFFFFFFF
        mov     dword [esp], eax                        ; 2317 _ 89. 04 24
        call    task_run                                ; 231A _ E8, FFFFFFFC(rel)
        jmp     ?_086                                   ; 231F _ E9, 00000195

?_084:  cmp     dword [ebp-90H], 14                     ; 2324 _ 83. BD, FFFFFF70, 0E
        jnz     ?_085                                   ; 232B _ 75, 7B
        cmp     dword [ebp-0A4H], 16                    ; 232D _ 83. BD, FFFFFF5C, 10
        jle     ?_085                                   ; 2334 _ 7E, 72
        mov     eax, dword [sheet_control]              ; 2336 _ A1, 00000000(d)
        mov     dword [esp+10H], 0                      ; 233B _ C7. 44 24, 10, 00000000
        mov     edx, dword [ebp-98H]                    ; 2343 _ 8B. 95, FFFFFF68
        mov     dword [esp+0CH], edx                    ; 2349 _ 89. 54 24, 0C
        mov     edx, dword [ebp-0A4H]                   ; 234D _ 8B. 95, FFFFFF5C
        mov     dword [esp+8H], edx                     ; 2353 _ 89. 54 24, 08
        mov     edx, dword [ebp-0ACH]                   ; 2357 _ 8B. 95, FFFFFF54
        mov     dword [esp+4H], edx                     ; 235D _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 2361 _ 89. 04 24
        call    set_cursor                              ; 2364 _ E8, FFFFFFFC(rel)
        sub     dword [ebp-0A4H], 8                     ; 2369 _ 83. AD, FFFFFF5C, 08
        mov     eax, dword [sheet_control]              ; 2370 _ A1, 00000000(d)
        mov     dword [esp+10H], 0                      ; 2375 _ C7. 44 24, 10, 00000000
        mov     edx, dword [ebp-98H]                    ; 237D _ 8B. 95, FFFFFF68
        mov     dword [esp+0CH], edx                    ; 2383 _ 89. 54 24, 0C
        mov     edx, dword [ebp-0A4H]                   ; 2387 _ 8B. 95, FFFFFF5C
        mov     dword [esp+8H], edx                     ; 238D _ 89. 54 24, 08
        mov     edx, dword [ebp-0ACH]                   ; 2391 _ 8B. 95, FFFFFF54
        mov     dword [esp+4H], edx                     ; 2397 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 239B _ 89. 04 24
        call    set_cursor                              ; 239E _ E8, FFFFFFFC(rel)
        jmp     ?_086                                   ; 23A3 _ E9, 00000111

?_085:  mov     eax, dword [ebp-90H]                    ; 23A8 _ 8B. 85, FFFFFF70
        mov     dword [esp], eax                        ; 23AE _ 89. 04 24
        call    transfer_scancode                       ; 23B1 _ E8, FFFFFFFC(rel)
        mov     byte [ebp-0A7H], al                     ; 23B6 _ 88. 85, FFFFFF59
        cmp     byte [ebp-0A7H], 0                      ; 23BC _ 80. BD, FFFFFF59, 00
        je      ?_086                                   ; 23C3 _ 0F 84, 000000F0
        cmp     dword [ebp-0A4H], 239                   ; 23C9 _ 81. BD, FFFFFF5C, 000000EF
        jg      ?_086                                   ; 23D3 _ 0F 8F, 000000E0
        mov     eax, dword [ebp-0A4H]                   ; 23D9 _ 8B. 85, FFFFFF5C
        lea     ecx, [eax+7H]                           ; 23DF _ 8D. 48, 07
        mov     eax, dword [ebp-0ACH]                   ; 23E2 _ 8B. 85, FFFFFF54
        mov     edx, dword [eax+4H]                     ; 23E8 _ 8B. 50, 04
        mov     eax, dword [ebp-0ACH]                   ; 23EB _ 8B. 85, FFFFFF54
        mov     eax, dword [eax]                        ; 23F1 _ 8B. 00
        mov     dword [esp+18H], 43                     ; 23F3 _ C7. 44 24, 18, 0000002B
        mov     dword [esp+14H], ecx                    ; 23FB _ 89. 4C 24, 14
        mov     dword [esp+10H], 28                     ; 23FF _ C7. 44 24, 10, 0000001C
        mov     ecx, dword [ebp-0A4H]                   ; 2407 _ 8B. 8D, FFFFFF5C
        mov     dword [esp+0CH], ecx                    ; 240D _ 89. 4C 24, 0C
        mov     dword [esp+8H], 0                       ; 2411 _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], edx                     ; 2419 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 241D _ 89. 04 24
        call    paint_rectangle                         ; 2420 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0A4H]                   ; 2425 _ 8B. 85, FFFFFF5C
        lea     edx, [eax+8H]                           ; 242B _ 8D. 50, 08
        mov     eax, dword [sheet_control]              ; 242E _ A1, 00000000(d)
        mov     dword [esp+14H], 44                     ; 2433 _ C7. 44 24, 14, 0000002C
        mov     dword [esp+10H], edx                    ; 243B _ 89. 54 24, 10
        mov     dword [esp+0CH], 28                     ; 243F _ C7. 44 24, 0C, 0000001C
        mov     edx, dword [ebp-0A4H]                   ; 2447 _ 8B. 95, FFFFFF5C
        mov     dword [esp+8H], edx                     ; 244D _ 89. 54 24, 08
        mov     edx, dword [ebp-0ACH]                   ; 2451 _ 8B. 95, FFFFFF54
        mov     dword [esp+4H], edx                     ; 2457 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 245B _ 89. 04 24
        call    sheet_refresh                           ; 245E _ E8, FFFFFFFC(rel)
        movzx   eax, byte [ebp-0A7H]                    ; 2463 _ 0F B6. 85, FFFFFF59
        mov     byte [ebp-0A6H], al                     ; 246A _ 88. 85, FFFFFF5A
        mov     byte [ebp-0A5H], 0                      ; 2470 _ C6. 85, FFFFFF5B, 00
        mov     eax, dword [sheet_control]              ; 2477 _ A1, 00000000(d)
        mov     dword [esp+14H], 7                      ; 247C _ C7. 44 24, 14, 00000007
        lea     edx, [ebp-0A6H]                         ; 2484 _ 8D. 95, FFFFFF5A
        mov     dword [esp+10H], edx                    ; 248A _ 89. 54 24, 10
        mov     dword [esp+0CH], 28                     ; 248E _ C7. 44 24, 0C, 0000001C
        mov     edx, dword [ebp-0A4H]                   ; 2496 _ 8B. 95, FFFFFF5C
        mov     dword [esp+8H], edx                     ; 249C _ 89. 54 24, 08
        mov     edx, dword [ebp-0ACH]                   ; 24A0 _ 8B. 95, FFFFFF54
        mov     dword [esp+4H], edx                     ; 24A6 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 24AA _ 89. 04 24
        call    paint_string                            ; 24AD _ E8, FFFFFFFC(rel)
        add     dword [ebp-0A4H], 8                     ; 24B2 _ 83. 85, FFFFFF5C, 08
?_086:  cmp     dword [ebp-0A0H], 0                     ; 24B9 _ 83. BD, FFFFFF60, 00
        js      ?_087                                   ; 24C0 _ 78, 3A
        mov     eax, dword [sheet_control]              ; 24C2 _ A1, 00000000(d)
        mov     edx, dword [ebp-0A0H]                   ; 24C7 _ 8B. 95, FFFFFF60
        mov     dword [esp+10H], edx                    ; 24CD _ 89. 54 24, 10
        mov     edx, dword [ebp-98H]                    ; 24D1 _ 8B. 95, FFFFFF68
        mov     dword [esp+0CH], edx                    ; 24D7 _ 89. 54 24, 0C
        mov     edx, dword [ebp-0A4H]                   ; 24DB _ 8B. 95, FFFFFF5C
        mov     dword [esp+8H], edx                     ; 24E1 _ 89. 54 24, 08
        mov     edx, dword [ebp-0ACH]                   ; 24E5 _ 8B. 95, FFFFFF54
        mov     dword [esp+4H], edx                     ; 24EB _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 24EF _ 89. 04 24
        call    set_cursor                              ; 24F2 _ E8, FFFFFFFC(rel)
        jmp     ?_078                                   ; 24F7 _ E9, FFFFFC95

?_087:  jmp     ?_078                                   ; 24FC _ E9, FFFFFC90
; console_task End of function

launch_console:; Function begin
        push    ebp                                     ; 2501 _ 55
        mov     ebp, esp                                ; 2502 _ 89. E5
        sub     esp, 56                                 ; 2504 _ 83. EC, 38
        mov     eax, dword [sheet_control]              ; 2507 _ A1, 00000000(d)
        mov     dword [esp], eax                        ; 250C _ 89. 04 24
        call    sheet_alloc                             ; 250F _ E8, FFFFFFFC(rel)
        mov     dword [ebp-18H], eax                    ; 2514 _ 89. 45, E8
        mov     eax, dword [memman]                     ; 2517 _ A1, 00000000(d)
        mov     dword [esp+4H], 42240                   ; 251C _ C7. 44 24, 04, 0000A500
        mov     dword [esp], eax                        ; 2524 _ 89. 04 24
        call    memman_alloc_4k                         ; 2527 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-14H], eax                    ; 252C _ 89. 45, EC
        mov     dword [esp+10H], 99                     ; 252F _ C7. 44 24, 10, 00000063
        mov     dword [esp+0CH], 165                    ; 2537 _ C7. 44 24, 0C, 000000A5
        mov     dword [esp+8H], 256                     ; 253F _ C7. 44 24, 08, 00000100
        mov     eax, dword [ebp-14H]                    ; 2547 _ 8B. 45, EC
        mov     dword [esp+4H], eax                     ; 254A _ 89. 44 24, 04
        mov     eax, dword [ebp-18H]                    ; 254E _ 8B. 45, E8
        mov     dword [esp], eax                        ; 2551 _ 89. 04 24
        call    sheet_setbuf                            ; 2554 _ E8, FFFFFFFC(rel)
        mov     eax, dword [sheet_control]              ; 2559 _ A1, 00000000(d)
        mov     dword [esp+0CH], 0                      ; 255E _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], ?_241                   ; 2566 _ C7. 44 24, 08, 00000062(d)
        mov     edx, dword [ebp-18H]                    ; 256E _ 8B. 55, E8
        mov     dword [esp+4H], edx                     ; 2571 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 2575 _ 89. 04 24
        call    make_windows                            ; 2578 _ E8, FFFFFFFC(rel)
        mov     dword [esp+14H], 0                      ; 257D _ C7. 44 24, 14, 00000000
        mov     dword [esp+10H], 128                    ; 2585 _ C7. 44 24, 10, 00000080
        mov     dword [esp+0CH], 240                    ; 258D _ C7. 44 24, 0C, 000000F0
        mov     dword [esp+8H], 28                      ; 2595 _ C7. 44 24, 08, 0000001C
        mov     dword [esp+4H], 8                       ; 259D _ C7. 44 24, 04, 00000008
        mov     eax, dword [ebp-18H]                    ; 25A5 _ 8B. 45, E8
        mov     dword [esp], eax                        ; 25A8 _ 89. 04 24
        call    make_textbox                            ; 25AB _ E8, FFFFFFFC(rel)
        call    task_alloc                              ; 25B0 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 25B5 _ 89. 45, F0
        call    get_code32_addr                         ; 25B8 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 25BD _ 89. 45, F4
        mov     eax, dword [ebp-10H]                    ; 25C0 _ 8B. 45, F0
        mov     dword [eax+8CH], 0                      ; 25C3 _ C7. 80, 0000008C, 00000000
        mov     eax, dword [ebp-10H]                    ; 25CD _ 8B. 45, F0
        mov     dword [eax+90H], 1073741824             ; 25D0 _ C7. 80, 00000090, 40000000
        mov     eax, console_task                       ; 25DA _ B8, 00000000(d)
        sub     eax, dword [ebp-0CH]                    ; 25DF _ 2B. 45, F4
        mov     edx, eax                                ; 25E2 _ 89. C2
        mov     eax, dword [ebp-10H]                    ; 25E4 _ 8B. 45, F0
        mov     dword [eax+4CH], edx                    ; 25E7 _ 89. 50, 4C
        mov     eax, dword [ebp-10H]                    ; 25EA _ 8B. 45, F0
        mov     dword [eax+74H], 0                      ; 25ED _ C7. 40, 74, 00000000
        mov     eax, dword [ebp-10H]                    ; 25F4 _ 8B. 45, F0
        mov     dword [eax+78H], 8                      ; 25F7 _ C7. 40, 78, 00000008
        mov     eax, dword [ebp-10H]                    ; 25FE _ 8B. 45, F0
        mov     dword [eax+7CH], 48                     ; 2601 _ C7. 40, 7C, 00000030
        mov     eax, dword [ebp-10H]                    ; 2608 _ 8B. 45, F0
        mov     dword [eax+80H], 32                     ; 260B _ C7. 80, 00000080, 00000020
        mov     eax, dword [ebp-10H]                    ; 2615 _ 8B. 45, F0
        mov     dword [eax+84H], 0                      ; 2618 _ C7. 80, 00000084, 00000000
        mov     eax, dword [ebp-10H]                    ; 2622 _ 8B. 45, F0
        mov     dword [eax+88H], 16                     ; 2625 _ C7. 80, 00000088, 00000010
        mov     eax, dword [ebp-10H]                    ; 262F _ 8B. 45, F0
        mov     eax, dword [eax+64H]                    ; 2632 _ 8B. 40, 64
        lea     edx, [eax-4H]                           ; 2635 _ 8D. 50, FC
        mov     eax, dword [ebp-10H]                    ; 2638 _ 8B. 45, F0
        mov     dword [eax+64H], edx                    ; 263B _ 89. 50, 64
        mov     eax, dword [ebp-10H]                    ; 263E _ 8B. 45, F0
        mov     eax, dword [eax+64H]                    ; 2641 _ 8B. 40, 64
        add     eax, 4                                  ; 2644 _ 83. C0, 04
        mov     edx, dword [ebp-18H]                    ; 2647 _ 8B. 55, E8
        mov     dword [eax], edx                        ; 264A _ 89. 10
        mov     dword [esp+8H], 5                       ; 264C _ C7. 44 24, 08, 00000005
        mov     dword [esp+4H], 1                       ; 2654 _ C7. 44 24, 04, 00000001
        mov     eax, dword [ebp-10H]                    ; 265C _ 8B. 45, F0
        mov     dword [esp], eax                        ; 265F _ 89. 04 24
        call    task_run                                ; 2662 _ E8, FFFFFFFC(rel)
        mov     eax, dword [sheet_control]              ; 2667 _ A1, 00000000(d)
        mov     dword [esp+0CH], 4                      ; 266C _ C7. 44 24, 0C, 00000004
        mov     dword [esp+8H], 32                      ; 2674 _ C7. 44 24, 08, 00000020
        mov     edx, dword [ebp-18H]                    ; 267C _ 8B. 55, E8
        mov     dword [esp+4H], edx                     ; 267F _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 2683 _ 89. 04 24
        call    sheet_slide                             ; 2686 _ E8, FFFFFFFC(rel)
        mov     eax, dword [sheet_control]              ; 268B _ A1, 00000000(d)
        mov     dword [esp+8H], 1                       ; 2690 _ C7. 44 24, 08, 00000001
        mov     edx, dword [ebp-18H]                    ; 2698 _ 8B. 55, E8
        mov     dword [esp+4H], edx                     ; 269B _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 269F _ 89. 04 24
        call    sheet_updown                            ; 26A2 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 26A7 _ 8B. 45, F0
        mov     dword [task_console_g], eax             ; 26AA _ A3, 00000000(d)
        mov     eax, dword [ebp-18H]                    ; 26AF _ 8B. 45, E8
        leave                                           ; 26B2 _ C9
        ret                                             ; 26B3 _ C3
; launch_console End of function

set_cursor:; Function begin
        push    ebp                                     ; 26B4 _ 55
        mov     ebp, esp                                ; 26B5 _ 89. E5
        push    esi                                     ; 26B7 _ 56
        push    ebx                                     ; 26B8 _ 53
        sub     esp, 32                                 ; 26B9 _ 83. EC, 20
        mov     eax, dword [ebp+14H]                    ; 26BC _ 8B. 45, 14
        lea     esi, [eax+0FH]                          ; 26BF _ 8D. 70, 0F
        mov     eax, dword [ebp+10H]                    ; 26C2 _ 8B. 45, 10
        lea     ebx, [eax+7H]                           ; 26C5 _ 8D. 58, 07
        mov     eax, dword [ebp+18H]                    ; 26C8 _ 8B. 45, 18
        movzx   ecx, al                                 ; 26CB _ 0F B6. C8
        mov     eax, dword [ebp+0CH]                    ; 26CE _ 8B. 45, 0C
        mov     edx, dword [eax+4H]                     ; 26D1 _ 8B. 50, 04
        mov     eax, dword [ebp+0CH]                    ; 26D4 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 26D7 _ 8B. 00
        mov     dword [esp+18H], esi                    ; 26D9 _ 89. 74 24, 18
        mov     dword [esp+14H], ebx                    ; 26DD _ 89. 5C 24, 14
        mov     ebx, dword [ebp+14H]                    ; 26E1 _ 8B. 5D, 14
        mov     dword [esp+10H], ebx                    ; 26E4 _ 89. 5C 24, 10
        mov     ebx, dword [ebp+10H]                    ; 26E8 _ 8B. 5D, 10
        mov     dword [esp+0CH], ebx                    ; 26EB _ 89. 5C 24, 0C
        mov     dword [esp+8H], ecx                     ; 26EF _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 26F3 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 26F7 _ 89. 04 24
        call    paint_rectangle                         ; 26FA _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+14H]                    ; 26FF _ 8B. 45, 14
        lea     edx, [eax+10H]                          ; 2702 _ 8D. 50, 10
        mov     eax, dword [ebp+10H]                    ; 2705 _ 8B. 45, 10
        add     eax, 8                                  ; 2708 _ 83. C0, 08
        mov     dword [esp+14H], edx                    ; 270B _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 270F _ 89. 44 24, 10
        mov     eax, dword [ebp+14H]                    ; 2713 _ 8B. 45, 14
        mov     dword [esp+0CH], eax                    ; 2716 _ 89. 44 24, 0C
        mov     eax, dword [ebp+10H]                    ; 271A _ 8B. 45, 10
        mov     dword [esp+8H], eax                     ; 271D _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 2721 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 2724 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2728 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 272B _ 89. 04 24
        call    sheet_refresh                           ; 272E _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 2733 _ 83. C4, 20
        pop     ebx                                     ; 2736 _ 5B
        pop     esi                                     ; 2737 _ 5E
        pop     ebp                                     ; 2738 _ 5D
        ret                                             ; 2739 _ C3
; set_cursor End of function

wait_KBC_sendready:; Function begin
        push    ebp                                     ; 273A _ 55
        mov     ebp, esp                                ; 273B _ 89. E5
        sub     esp, 24                                 ; 273D _ 83. EC, 18
?_088:  mov     dword [esp], 100                        ; 2740 _ C7. 04 24, 00000064
        call    io_in8                                  ; 2747 _ E8, FFFFFFFC(rel)
        and     eax, 02H                                ; 274C _ 83. E0, 02
        test    eax, eax                                ; 274F _ 85. C0
        jnz     ?_089                                   ; 2751 _ 75, 02
        jmp     ?_090                                   ; 2753 _ EB, 02

?_089:  jmp     ?_088                                   ; 2755 _ EB, E9

?_090:  leave                                           ; 2757 _ C9
        ret                                             ; 2758 _ C3
; wait_KBC_sendready End of function

init_keyboard:; Function begin
        push    ebp                                     ; 2759 _ 55
        mov     ebp, esp                                ; 275A _ 89. E5
        sub     esp, 24                                 ; 275C _ 83. EC, 18
        call    wait_KBC_sendready                      ; 275F _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 96                      ; 2764 _ C7. 44 24, 04, 00000060
        mov     dword [esp], 100                        ; 276C _ C7. 04 24, 00000064
        call    io_out8                                 ; 2773 _ E8, FFFFFFFC(rel)
        call    wait_KBC_sendready                      ; 2778 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 71                      ; 277D _ C7. 44 24, 04, 00000047
        mov     dword [esp], 96                         ; 2785 _ C7. 04 24, 00000060
        call    io_out8                                 ; 278C _ E8, FFFFFFFC(rel)
        leave                                           ; 2791 _ C9
        ret                                             ; 2792 _ C3
; init_keyboard End of function

enable_mouse:; Function begin
        push    ebp                                     ; 2793 _ 55
        mov     ebp, esp                                ; 2794 _ 89. E5
        sub     esp, 24                                 ; 2796 _ 83. EC, 18
        call    wait_KBC_sendready                      ; 2799 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 212                     ; 279E _ C7. 44 24, 04, 000000D4
        mov     dword [esp], 100                        ; 27A6 _ C7. 04 24, 00000064
        call    io_out8                                 ; 27AD _ E8, FFFFFFFC(rel)
        call    wait_KBC_sendready                      ; 27B2 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 244                     ; 27B7 _ C7. 44 24, 04, 000000F4
        mov     dword [esp], 96                         ; 27BF _ C7. 04 24, 00000060
        call    io_out8                                 ; 27C6 _ E8, FFFFFFFC(rel)
        leave                                           ; 27CB _ C9
        ret                                             ; 27CC _ C3
; enable_mouse End of function

mouse_decode:; Function begin
        push    ebp                                     ; 27CD _ 55
        mov     ebp, esp                                ; 27CE _ 89. E5
        sub     esp, 4                                  ; 27D0 _ 83. EC, 04
        mov     eax, dword [ebp+0CH]                    ; 27D3 _ 8B. 45, 0C
        mov     byte [ebp-4H], al                       ; 27D6 _ 88. 45, FC
        mov     eax, dword [ebp+8H]                     ; 27D9 _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 27DC _ 0F B6. 40, 03
        test    al, al                                  ; 27E0 _ 84. C0
        jnz     ?_092                                   ; 27E2 _ 75, 17
        cmp     byte [ebp-4H], -6                       ; 27E4 _ 80. 7D, FC, FA
        jnz     ?_091                                   ; 27E8 _ 75, 07
        mov     eax, dword [ebp+8H]                     ; 27EA _ 8B. 45, 08
        mov     byte [eax+3H], 1                        ; 27ED _ C6. 40, 03, 01
?_091:  mov     eax, 0                                  ; 27F1 _ B8, 00000000
        jmp     ?_099                                   ; 27F6 _ E9, 0000010F

?_092:  mov     eax, dword [ebp+8H]                     ; 27FB _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 27FE _ 0F B6. 40, 03
        cmp     al, 1                                   ; 2802 _ 3C, 01
        jnz     ?_094                                   ; 2804 _ 75, 28
        movzx   eax, byte [ebp-4H]                      ; 2806 _ 0F B6. 45, FC
        and     eax, 0C8H                               ; 280A _ 25, 000000C8
        cmp     eax, 8                                  ; 280F _ 83. F8, 08
        jnz     ?_093                                   ; 2812 _ 75, 10
        mov     eax, dword [ebp+8H]                     ; 2814 _ 8B. 45, 08
        movzx   edx, byte [ebp-4H]                      ; 2817 _ 0F B6. 55, FC
        mov     byte [eax], dl                          ; 281B _ 88. 10
        mov     eax, dword [ebp+8H]                     ; 281D _ 8B. 45, 08
        mov     byte [eax+3H], 2                        ; 2820 _ C6. 40, 03, 02
?_093:  mov     eax, 0                                  ; 2824 _ B8, 00000000
        jmp     ?_099                                   ; 2829 _ E9, 000000DC

?_094:  mov     eax, dword [ebp+8H]                     ; 282E _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 2831 _ 0F B6. 40, 03
        cmp     al, 2                                   ; 2835 _ 3C, 02
        jnz     ?_095                                   ; 2837 _ 75, 1B
        mov     eax, dword [ebp+8H]                     ; 2839 _ 8B. 45, 08
        movzx   edx, byte [ebp-4H]                      ; 283C _ 0F B6. 55, FC
        mov     byte [eax+1H], dl                       ; 2840 _ 88. 50, 01
        mov     eax, dword [ebp+8H]                     ; 2843 _ 8B. 45, 08
        mov     byte [eax+3H], 3                        ; 2846 _ C6. 40, 03, 03
        mov     eax, 0                                  ; 284A _ B8, 00000000
        jmp     ?_099                                   ; 284F _ E9, 000000B6

?_095:  mov     eax, dword [ebp+8H]                     ; 2854 _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 2857 _ 0F B6. 40, 03
        cmp     al, 3                                   ; 285B _ 3C, 03
        jne     ?_098                                   ; 285D _ 0F 85, 000000A2
        mov     eax, dword [ebp+8H]                     ; 2863 _ 8B. 45, 08
        movzx   edx, byte [ebp-4H]                      ; 2866 _ 0F B6. 55, FC
        mov     byte [eax+2H], dl                       ; 286A _ 88. 50, 02
        mov     eax, dword [ebp+8H]                     ; 286D _ 8B. 45, 08
        mov     byte [eax+3H], 1                        ; 2870 _ C6. 40, 03, 01
        mov     eax, dword [ebp+8H]                     ; 2874 _ 8B. 45, 08
        movzx   eax, byte [eax]                         ; 2877 _ 0F B6. 00
        movzx   eax, al                                 ; 287A _ 0F B6. C0
        and     eax, 07H                                ; 287D _ 83. E0, 07
        mov     edx, eax                                ; 2880 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 2882 _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 2885 _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 2888 _ 8B. 45, 08
        movzx   eax, byte [eax+1H]                      ; 288B _ 0F B6. 40, 01
        movzx   edx, al                                 ; 288F _ 0F B6. D0
        mov     eax, dword [ebp+8H]                     ; 2892 _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 2895 _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 2898 _ 8B. 45, 08
        movzx   eax, byte [eax+2H]                      ; 289B _ 0F B6. 40, 02
        movzx   edx, al                                 ; 289F _ 0F B6. D0
        mov     eax, dword [ebp+8H]                     ; 28A2 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 28A5 _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 28A8 _ 8B. 45, 08
        movzx   eax, byte [eax]                         ; 28AB _ 0F B6. 00
        movzx   eax, al                                 ; 28AE _ 0F B6. C0
        and     eax, 10H                                ; 28B1 _ 83. E0, 10
        test    eax, eax                                ; 28B4 _ 85. C0
        jz      ?_096                                   ; 28B6 _ 74, 13
        mov     eax, dword [ebp+8H]                     ; 28B8 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 28BB _ 8B. 40, 04
        or      eax, 0FFFFFF00H                         ; 28BE _ 0D, FFFFFF00
        mov     edx, eax                                ; 28C3 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 28C5 _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 28C8 _ 89. 50, 04
?_096:  mov     eax, dword [ebp+8H]                     ; 28CB _ 8B. 45, 08
        movzx   eax, byte [eax]                         ; 28CE _ 0F B6. 00
        movzx   eax, al                                 ; 28D1 _ 0F B6. C0
        and     eax, 20H                                ; 28D4 _ 83. E0, 20
        test    eax, eax                                ; 28D7 _ 85. C0
        jz      ?_097                                   ; 28D9 _ 74, 13
        mov     eax, dword [ebp+8H]                     ; 28DB _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 28DE _ 8B. 40, 08
        or      eax, 0FFFFFF00H                         ; 28E1 _ 0D, FFFFFF00
        mov     edx, eax                                ; 28E6 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 28E8 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 28EB _ 89. 50, 08
?_097:  mov     eax, dword [ebp+8H]                     ; 28EE _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 28F1 _ 8B. 40, 08
        neg     eax                                     ; 28F4 _ F7. D8
        mov     edx, eax                                ; 28F6 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 28F8 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 28FB _ 89. 50, 08
        mov     eax, 1                                  ; 28FE _ B8, 00000001
        jmp     ?_099                                   ; 2903 _ EB, 05

?_098:  mov     eax, 4294967295                         ; 2905 _ B8, FFFFFFFF
?_099:  leave                                           ; 290A _ C9
        ret                                             ; 290B _ C3
; mouse_decode End of function

intHandlerKeyboard:; Function begin
        push    ebp                                     ; 290C _ 55
        mov     ebp, esp                                ; 290D _ 89. E5
        sub     esp, 40                                 ; 290F _ 83. EC, 28
        mov     dword [esp+4H], 32                      ; 2912 _ C7. 44 24, 04, 00000020
        mov     dword [esp], 32                         ; 291A _ C7. 04 24, 00000020
        call    io_out8                                 ; 2921 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 32                      ; 2926 _ C7. 44 24, 04, 00000020
        mov     dword [esp], 160                        ; 292E _ C7. 04 24, 000000A0
        call    io_out8                                 ; 2935 _ E8, FFFFFFFC(rel)
        mov     dword [esp], 96                         ; 293A _ C7. 04 24, 00000060
        call    io_in8                                  ; 2941 _ E8, FFFFFFFC(rel)
        mov     byte [ebp-9H], al                       ; 2946 _ 88. 45, F7
        movzx   eax, byte [ebp-9H]                      ; 2949 _ 0F B6. 45, F7
        mov     dword [esp+4H], eax                     ; 294D _ 89. 44 24, 04
        mov     dword [esp], keyinfo                    ; 2951 _ C7. 04 24, 00000000(d)
        call    fifo8_put                               ; 2958 _ E8, FFFFFFFC(rel)
        leave                                           ; 295D _ C9
        ret                                             ; 295E _ C3
; intHandlerKeyboard End of function

intHandlerMouse:; Function begin
        push    ebp                                     ; 295F _ 55
        mov     ebp, esp                                ; 2960 _ 89. E5
        sub     esp, 40                                 ; 2962 _ 83. EC, 28
        mov     dword [esp+4H], 32                      ; 2965 _ C7. 44 24, 04, 00000020
        mov     dword [esp], 32                         ; 296D _ C7. 04 24, 00000020
        call    io_out8                                 ; 2974 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 32                      ; 2979 _ C7. 44 24, 04, 00000020
        mov     dword [esp], 160                        ; 2981 _ C7. 04 24, 000000A0
        call    io_out8                                 ; 2988 _ E8, FFFFFFFC(rel)
        mov     dword [esp], 96                         ; 298D _ C7. 04 24, 00000060
        call    io_in8                                  ; 2994 _ E8, FFFFFFFC(rel)
        mov     byte [ebp-9H], al                       ; 2999 _ 88. 45, F7
        movzx   eax, byte [ebp-9H]                      ; 299C _ 0F B6. 45, F7
        mov     dword [esp+4H], eax                     ; 29A0 _ 89. 44 24, 04
        mov     dword [esp], mouseinfo                  ; 29A4 _ C7. 04 24, 00000000(d)
        call    fifo8_put                               ; 29AB _ E8, FFFFFFFC(rel)
        leave                                           ; 29B0 _ C9
        ret                                             ; 29B1 _ C3
; intHandlerMouse End of function

fifo8_init:; Function begin
        push    ebp                                     ; 29B2 _ 55
        mov     ebp, esp                                ; 29B3 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 29B5 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 29B8 _ 8B. 55, 10
        mov     dword [eax], edx                        ; 29BB _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 29BD _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 29C0 _ C7. 40, 04, 00000000
        mov     eax, dword [ebp+8H]                     ; 29C7 _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 29CA _ C7. 40, 08, 00000000
        mov     eax, dword [ebp+8H]                     ; 29D1 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 29D4 _ 8B. 55, 0C
        mov     dword [eax+0CH], edx                    ; 29D7 _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 29DA _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 29DD _ 8B. 55, 0C
        mov     dword [eax+10H], edx                    ; 29E0 _ 89. 50, 10
        mov     eax, dword [ebp+8H]                     ; 29E3 _ 8B. 45, 08
        mov     dword [eax+14H], 0                      ; 29E6 _ C7. 40, 14, 00000000
        mov     eax, dword [ebp+8H]                     ; 29ED _ 8B. 45, 08
        mov     edx, dword [ebp+14H]                    ; 29F0 _ 8B. 55, 14
        mov     dword [eax+18H], edx                    ; 29F3 _ 89. 50, 18
        pop     ebp                                     ; 29F6 _ 5D
        ret                                             ; 29F7 _ C3
; fifo8_init End of function

fifo8_put:; Function begin
        push    ebp                                     ; 29F8 _ 55
        mov     ebp, esp                                ; 29F9 _ 89. E5
        sub     esp, 40                                 ; 29FB _ 83. EC, 28
        mov     eax, dword [ebp+0CH]                    ; 29FE _ 8B. 45, 0C
        mov     byte [ebp-1CH], al                      ; 2A01 _ 88. 45, E4
        cmp     dword [ebp+8H], 0                       ; 2A04 _ 83. 7D, 08, 00
        jnz     ?_100                                   ; 2A08 _ 75, 0A
        mov     eax, 4294967295                         ; 2A0A _ B8, FFFFFFFF
        jmp     ?_104                                   ; 2A0F _ E9, 000000B1

?_100:  mov     eax, dword [ebp+8H]                     ; 2A14 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 2A17 _ 8B. 40, 10
        test    eax, eax                                ; 2A1A _ 85. C0
        jnz     ?_101                                   ; 2A1C _ 75, 1B
        mov     eax, dword [ebp+8H]                     ; 2A1E _ 8B. 45, 08
        mov     eax, dword [eax+14H]                    ; 2A21 _ 8B. 40, 14
        or      eax, 01H                                ; 2A24 _ 83. C8, 01
        mov     edx, eax                                ; 2A27 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 2A29 _ 8B. 45, 08
        mov     dword [eax+14H], edx                    ; 2A2C _ 89. 50, 14
        mov     eax, 4294967295                         ; 2A2F _ B8, FFFFFFFF
        jmp     ?_104                                   ; 2A34 _ E9, 0000008C

?_101:  mov     eax, dword [ebp+8H]                     ; 2A39 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 2A3C _ 8B. 40, 04
        mov     dword [ebp-0CH], eax                    ; 2A3F _ 89. 45, F4
        mov     eax, dword [ebp+8H]                     ; 2A42 _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 2A45 _ 8B. 10
        mov     eax, dword [ebp-0CH]                    ; 2A47 _ 8B. 45, F4
        add     edx, eax                                ; 2A4A _ 01. C2
        movzx   eax, byte [ebp-1CH]                     ; 2A4C _ 0F B6. 45, E4
        mov     byte [edx], al                          ; 2A50 _ 88. 02
        mov     eax, dword [ebp+8H]                     ; 2A52 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 2A55 _ 8B. 40, 04
        lea     edx, [eax+1H]                           ; 2A58 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 2A5B _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 2A5E _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 2A61 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 2A64 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 2A67 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 2A6A _ 8B. 40, 0C
        cmp     edx, eax                                ; 2A6D _ 39. C2
        jnz     ?_102                                   ; 2A6F _ 75, 0A
        mov     eax, dword [ebp+8H]                     ; 2A71 _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 2A74 _ C7. 40, 04, 00000000
?_102:  mov     eax, dword [ebp+8H]                     ; 2A7B _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 2A7E _ 8B. 40, 10
        lea     edx, [eax-1H]                           ; 2A81 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 2A84 _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 2A87 _ 89. 50, 10
        mov     eax, dword [ebp+8H]                     ; 2A8A _ 8B. 45, 08
        mov     eax, dword [eax+18H]                    ; 2A8D _ 8B. 40, 18
        test    eax, eax                                ; 2A90 _ 85. C0
        jz      ?_103                                   ; 2A92 _ 74, 2C
        mov     eax, dword [ebp+8H]                     ; 2A94 _ 8B. 45, 08
        mov     eax, dword [eax+18H]                    ; 2A97 _ 8B. 40, 18
        mov     eax, dword [eax+4H]                     ; 2A9A _ 8B. 40, 04
        cmp     eax, 2                                  ; 2A9D _ 83. F8, 02
        jz      ?_103                                   ; 2AA0 _ 74, 1E
        mov     eax, dword [ebp+8H]                     ; 2AA2 _ 8B. 45, 08
        mov     eax, dword [eax+18H]                    ; 2AA5 _ 8B. 40, 18
        mov     dword [esp+8H], 0                       ; 2AA8 _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], -1                      ; 2AB0 _ C7. 44 24, 04, FFFFFFFF
        mov     dword [esp], eax                        ; 2AB8 _ 89. 04 24
        call    task_run                                ; 2ABB _ E8, FFFFFFFC(rel)
?_103:  mov     eax, 0                                  ; 2AC0 _ B8, 00000000
?_104:  leave                                           ; 2AC5 _ C9
        ret                                             ; 2AC6 _ C3
; fifo8_put End of function

fifo8_get:; Function begin
        push    ebp                                     ; 2AC7 _ 55
        mov     ebp, esp                                ; 2AC8 _ 89. E5
        sub     esp, 16                                 ; 2ACA _ 83. EC, 10
        mov     eax, dword [ebp+8H]                     ; 2ACD _ 8B. 45, 08
        mov     edx, dword [eax+10H]                    ; 2AD0 _ 8B. 50, 10
        mov     eax, dword [ebp+8H]                     ; 2AD3 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 2AD6 _ 8B. 40, 0C
        cmp     edx, eax                                ; 2AD9 _ 39. C2
        jnz     ?_105                                   ; 2ADB _ 75, 11
        mov     eax, dword [ebp+8H]                     ; 2ADD _ 8B. 45, 08
        mov     dword [eax+14H], 0                      ; 2AE0 _ C7. 40, 14, 00000000
        mov     eax, 4294967295                         ; 2AE7 _ B8, FFFFFFFF
        jmp     ?_107                                   ; 2AEC _ EB, 57

?_105:  mov     eax, dword [ebp+8H]                     ; 2AEE _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 2AF1 _ 8B. 40, 08
        mov     dword [ebp-8H], eax                     ; 2AF4 _ 89. 45, F8
        mov     eax, dword [ebp+8H]                     ; 2AF7 _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 2AFA _ 8B. 10
        mov     eax, dword [ebp-8H]                     ; 2AFC _ 8B. 45, F8
        add     eax, edx                                ; 2AFF _ 01. D0
        movzx   eax, byte [eax]                         ; 2B01 _ 0F B6. 00
        movzx   eax, al                                 ; 2B04 _ 0F B6. C0
        mov     dword [ebp-4H], eax                     ; 2B07 _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 2B0A _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 2B0D _ 8B. 40, 08
        lea     edx, [eax+1H]                           ; 2B10 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 2B13 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 2B16 _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 2B19 _ 8B. 45, 08
        mov     edx, dword [eax+8H]                     ; 2B1C _ 8B. 50, 08
        mov     eax, dword [ebp+8H]                     ; 2B1F _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 2B22 _ 8B. 40, 0C
        cmp     edx, eax                                ; 2B25 _ 39. C2
        jnz     ?_106                                   ; 2B27 _ 75, 0A
        mov     eax, dword [ebp+8H]                     ; 2B29 _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 2B2C _ C7. 40, 08, 00000000
?_106:  mov     eax, dword [ebp+8H]                     ; 2B33 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 2B36 _ 8B. 40, 10
        lea     edx, [eax+1H]                           ; 2B39 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 2B3C _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 2B3F _ 89. 50, 10
        mov     eax, dword [ebp-4H]                     ; 2B42 _ 8B. 45, FC
?_107:  leave                                           ; 2B45 _ C9
        ret                                             ; 2B46 _ C3
; fifo8_get End of function

fifo8_status:; Function begin
        push    ebp                                     ; 2B47 _ 55
        mov     ebp, esp                                ; 2B48 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 2B4A _ 8B. 45, 08
        mov     edx, dword [eax+0CH]                    ; 2B4D _ 8B. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 2B50 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 2B53 _ 8B. 40, 10
        sub     edx, eax                                ; 2B56 _ 29. C2
        mov     eax, edx                                ; 2B58 _ 89. D0
        pop     ebp                                     ; 2B5A _ 5D
        ret                                             ; 2B5B _ C3
; fifo8_status End of function

charToHexVal:; Function begin
        push    ebp                                     ; 2B5C _ 55
        mov     ebp, esp                                ; 2B5D _ 89. E5
        sub     esp, 4                                  ; 2B5F _ 83. EC, 04
        mov     eax, dword [ebp+8H]                     ; 2B62 _ 8B. 45, 08
        mov     byte [ebp-4H], al                       ; 2B65 _ 88. 45, FC
        cmp     byte [ebp-4H], 9                        ; 2B68 _ 80. 7D, FC, 09
        jle     ?_108                                   ; 2B6C _ 7E, 09
        movzx   eax, byte [ebp-4H]                      ; 2B6E _ 0F B6. 45, FC
        add     eax, 55                                 ; 2B72 _ 83. C0, 37
        jmp     ?_109                                   ; 2B75 _ EB, 07

?_108:  movzx   eax, byte [ebp-4H]                      ; 2B77 _ 0F B6. 45, FC
        add     eax, 48                                 ; 2B7B _ 83. C0, 30
?_109:  leave                                           ; 2B7E _ C9
        ret                                             ; 2B7F _ C3
; charToHexVal End of function

charToHexStr:; Function begin
        push    ebp                                     ; 2B80 _ 55
        mov     ebp, esp                                ; 2B81 _ 89. E5
        sub     esp, 24                                 ; 2B83 _ 83. EC, 18
        mov     eax, dword [ebp+8H]                     ; 2B86 _ 8B. 45, 08
        mov     byte [ebp-14H], al                      ; 2B89 _ 88. 45, EC
        mov     dword [ebp-4H], 0                       ; 2B8C _ C7. 45, FC, 00000000
        movzx   eax, byte [ebp-14H]                     ; 2B93 _ 0F B6. 45, EC
        and     eax, 0FH                                ; 2B97 _ 83. E0, 0F
        mov     byte [ebp-5H], al                       ; 2B9A _ 88. 45, FB
        movsx   eax, byte [ebp-5H]                      ; 2B9D _ 0F BE. 45, FB
        mov     dword [esp], eax                        ; 2BA1 _ 89. 04 24
        call    charToHexVal                            ; 2BA4 _ E8, FFFFFFFC(rel)
        mov     byte [?_243], al                        ; 2BA9 _ A2, 00000343(d)
        movzx   eax, byte [ebp-14H]                     ; 2BAE _ 0F B6. 45, EC
        shr     al, 4                                   ; 2BB2 _ C0. E8, 04
        mov     byte [ebp-14H], al                      ; 2BB5 _ 88. 45, EC
        movzx   eax, byte [ebp-14H]                     ; 2BB8 _ 0F B6. 45, EC
        movsx   eax, al                                 ; 2BBC _ 0F BE. C0
        mov     dword [esp], eax                        ; 2BBF _ 89. 04 24
        call    charToHexVal                            ; 2BC2 _ E8, FFFFFFFC(rel)
        mov     byte [?_242], al                        ; 2BC7 _ A2, 00000342(d)
        mov     eax, keyval                             ; 2BCC _ B8, 00000340(d)
        leave                                           ; 2BD1 _ C9
        ret                                             ; 2BD2 _ C3
; charToHexStr End of function

intToHexStr:; Function begin
        push    ebp                                     ; 2BD3 _ 55
        mov     ebp, esp                                ; 2BD4 _ 89. E5
        sub     esp, 16                                 ; 2BD6 _ 83. EC, 10
        mov     byte [str.1386], 48                     ; 2BD9 _ C6. 05, 000002E0(d), 30
        mov     byte [?_246], 88                        ; 2BE0 _ C6. 05, 000002E1(d), 58
        mov     byte [?_247], 0                         ; 2BE7 _ C6. 05, 000002EA(d), 00
        mov     dword [ebp-0CH], 2                      ; 2BEE _ C7. 45, F4, 00000002
        jmp     ?_111                                   ; 2BF5 _ EB, 0F

?_110:  mov     eax, dword [ebp-0CH]                    ; 2BF7 _ 8B. 45, F4
        add     eax, str.1386                           ; 2BFA _ 05, 000002E0(d)
        mov     byte [eax], 48                          ; 2BFF _ C6. 00, 30
        add     dword [ebp-0CH], 1                      ; 2C02 _ 83. 45, F4, 01
?_111:  cmp     dword [ebp-0CH], 9                      ; 2C06 _ 83. 7D, F4, 09
        jle     ?_110                                   ; 2C0A _ 7E, EB
        mov     dword [ebp-8H], 9                       ; 2C0C _ C7. 45, F8, 00000009
        jmp     ?_115                                   ; 2C13 _ EB, 40

?_112:  mov     eax, dword [ebp+8H]                     ; 2C15 _ 8B. 45, 08
        and     eax, 0FH                                ; 2C18 _ 83. E0, 0F
        mov     dword [ebp-4H], eax                     ; 2C1B _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 2C1E _ 8B. 45, 08
        shr     eax, 4                                  ; 2C21 _ C1. E8, 04
        mov     dword [ebp+8H], eax                     ; 2C24 _ 89. 45, 08
        cmp     dword [ebp-4H], 9                       ; 2C27 _ 83. 7D, FC, 09
        jle     ?_113                                   ; 2C2B _ 7E, 13
        mov     eax, dword [ebp-4H]                     ; 2C2D _ 8B. 45, FC
        add     eax, 55                                 ; 2C30 _ 83. C0, 37
        mov     edx, dword [ebp-8H]                     ; 2C33 _ 8B. 55, F8
        add     edx, str.1386                           ; 2C36 _ 81. C2, 000002E0(d)
        mov     byte [edx], al                          ; 2C3C _ 88. 02
        jmp     ?_114                                   ; 2C3E _ EB, 11

?_113:  mov     eax, dword [ebp-4H]                     ; 2C40 _ 8B. 45, FC
        add     eax, 48                                 ; 2C43 _ 83. C0, 30
        mov     edx, dword [ebp-8H]                     ; 2C46 _ 8B. 55, F8
        add     edx, str.1386                           ; 2C49 _ 81. C2, 000002E0(d)
        mov     byte [edx], al                          ; 2C4F _ 88. 02
?_114:  sub     dword [ebp-8H], 1                       ; 2C51 _ 83. 6D, F8, 01
?_115:  cmp     dword [ebp-8H], 1                       ; 2C55 _ 83. 7D, F8, 01
        jle     ?_116                                   ; 2C59 _ 7E, 06
        cmp     dword [ebp+8H], 0                       ; 2C5B _ 83. 7D, 08, 00
        jnz     ?_112                                   ; 2C5F _ 75, B4
?_116:  mov     eax, str.1386                           ; 2C61 _ B8, 000002E0(d)
        leave                                           ; 2C66 _ C9
        ret                                             ; 2C67 _ C3
; intToHexStr End of function

memman_init:; Function begin
        push    ebp                                     ; 2C68 _ 55
        mov     ebp, esp                                ; 2C69 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 2C6B _ 8B. 45, 08
        mov     dword [eax], 0                          ; 2C6E _ C7. 00, 00000000
        mov     eax, dword [ebp+8H]                     ; 2C74 _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 2C77 _ C7. 40, 04, 00000000
        mov     eax, dword [ebp+8H]                     ; 2C7E _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 2C81 _ C7. 40, 08, 00000000
        mov     eax, dword [ebp+8H]                     ; 2C88 _ 8B. 45, 08
        mov     dword [eax+0CH], 0                      ; 2C8B _ C7. 40, 0C, 00000000
        pop     ebp                                     ; 2C92 _ 5D
        ret                                             ; 2C93 _ C3
; memman_init End of function

memman_total:; Function begin
        push    ebp                                     ; 2C94 _ 55
        mov     ebp, esp                                ; 2C95 _ 89. E5
        sub     esp, 16                                 ; 2C97 _ 83. EC, 10
        mov     dword [ebp-4H], 0                       ; 2C9A _ C7. 45, FC, 00000000
        mov     dword [ebp-8H], 0                       ; 2CA1 _ C7. 45, F8, 00000000
        jmp     ?_118                                   ; 2CA8 _ EB, 14

?_117:  mov     eax, dword [ebp+8H]                     ; 2CAA _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 2CAD _ 8B. 55, F8
        add     edx, 2                                  ; 2CB0 _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 2CB3 _ 8B. 44 D0, 04
        add     dword [ebp-4H], eax                     ; 2CB7 _ 01. 45, FC
        add     dword [ebp-8H], 1                       ; 2CBA _ 83. 45, F8, 01
?_118:  mov     eax, dword [ebp+8H]                     ; 2CBE _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 2CC1 _ 8B. 00
        cmp     eax, dword [ebp-8H]                     ; 2CC3 _ 3B. 45, F8
        ja      ?_117                                   ; 2CC6 _ 77, E2
        mov     eax, dword [ebp-4H]                     ; 2CC8 _ 8B. 45, FC
        leave                                           ; 2CCB _ C9
        ret                                             ; 2CCC _ C3
; memman_total End of function

memman_alloc:; Function begin
        push    ebp                                     ; 2CCD _ 55
        mov     ebp, esp                                ; 2CCE _ 89. E5
        sub     esp, 16                                 ; 2CD0 _ 83. EC, 10
        mov     dword [ebp-8H], 0                       ; 2CD3 _ C7. 45, F8, 00000000
        jmp     ?_122                                   ; 2CDA _ E9, 00000085

?_119:  mov     eax, dword [ebp+8H]                     ; 2CDF _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 2CE2 _ 8B. 55, F8
        add     edx, 2                                  ; 2CE5 _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 2CE8 _ 8B. 44 D0, 04
        cmp     eax, dword [ebp+0CH]                    ; 2CEC _ 3B. 45, 0C
        jc      ?_121                                   ; 2CEF _ 72, 6F
        mov     eax, dword [ebp+8H]                     ; 2CF1 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 2CF4 _ 8B. 55, F8
        add     edx, 2                                  ; 2CF7 _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 2CFA _ 8B. 04 D0
        mov     dword [ebp-4H], eax                     ; 2CFD _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 2D00 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 2D03 _ 8B. 55, F8
        add     edx, 2                                  ; 2D06 _ 83. C2, 02
        mov     edx, dword [eax+edx*8]                  ; 2D09 _ 8B. 14 D0
        mov     eax, dword [ebp+0CH]                    ; 2D0C _ 8B. 45, 0C
        lea     ecx, [edx+eax]                          ; 2D0F _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 2D12 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 2D15 _ 8B. 55, F8
        add     edx, 2                                  ; 2D18 _ 83. C2, 02
        mov     dword [eax+edx*8], ecx                  ; 2D1B _ 89. 0C D0
        mov     eax, dword [ebp+8H]                     ; 2D1E _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 2D21 _ 8B. 55, F8
        add     edx, 2                                  ; 2D24 _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 2D27 _ 8B. 44 D0, 04
        sub     eax, dword [ebp+0CH]                    ; 2D2B _ 2B. 45, 0C
        mov     edx, eax                                ; 2D2E _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 2D30 _ 8B. 45, 08
        mov     ecx, dword [ebp-8H]                     ; 2D33 _ 8B. 4D, F8
        add     ecx, 2                                  ; 2D36 _ 83. C1, 02
        mov     dword [eax+ecx*8+4H], edx               ; 2D39 _ 89. 54 C8, 04
        mov     eax, dword [ebp+8H]                     ; 2D3D _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 2D40 _ 8B. 55, F8
        add     edx, 2                                  ; 2D43 _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 2D46 _ 8B. 44 D0, 04
        test    eax, eax                                ; 2D4A _ 85. C0
        jnz     ?_120                                   ; 2D4C _ 75, 0D
        mov     eax, dword [ebp+8H]                     ; 2D4E _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 2D51 _ 8B. 00
        lea     edx, [eax-1H]                           ; 2D53 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 2D56 _ 8B. 45, 08
        mov     dword [eax], edx                        ; 2D59 _ 89. 10
?_120:  mov     eax, dword [ebp-4H]                     ; 2D5B _ 8B. 45, FC
        jmp     ?_123                                   ; 2D5E _ EB, 17

?_121:  add     dword [ebp-8H], 1                       ; 2D60 _ 83. 45, F8, 01
?_122:  mov     eax, dword [ebp+8H]                     ; 2D64 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 2D67 _ 8B. 00
        cmp     eax, dword [ebp-8H]                     ; 2D69 _ 3B. 45, F8
        ja      ?_119                                   ; 2D6C _ 0F 87, FFFFFF6D
        mov     eax, 0                                  ; 2D72 _ B8, 00000000
?_123:  leave                                           ; 2D77 _ C9
        ret                                             ; 2D78 _ C3
; memman_alloc End of function

memman_free:; Function begin
        push    ebp                                     ; 2D79 _ 55
        mov     ebp, esp                                ; 2D7A _ 89. E5
        push    ebx                                     ; 2D7C _ 53
        sub     esp, 16                                 ; 2D7D _ 83. EC, 10
        mov     dword [ebp-0CH], 0                      ; 2D80 _ C7. 45, F4, 00000000
        jmp     ?_126                                   ; 2D87 _ EB, 17

?_124:  mov     eax, dword [ebp+8H]                     ; 2D89 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 2D8C _ 8B. 55, F4
        add     edx, 2                                  ; 2D8F _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 2D92 _ 8B. 04 D0
        cmp     eax, dword [ebp+0CH]                    ; 2D95 _ 3B. 45, 0C
        jbe     ?_125                                   ; 2D98 _ 76, 02
        jmp     ?_127                                   ; 2D9A _ EB, 0E

?_125:  add     dword [ebp-0CH], 1                      ; 2D9C _ 83. 45, F4, 01
?_126:  mov     eax, dword [ebp+8H]                     ; 2DA0 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 2DA3 _ 8B. 00
        cmp     eax, dword [ebp-0CH]                    ; 2DA5 _ 3B. 45, F4
        jg      ?_124                                   ; 2DA8 _ 7F, DF
?_127:  cmp     dword [ebp-0CH], 0                      ; 2DAA _ 83. 7D, F4, 00
        jle     ?_129                                   ; 2DAE _ 0F 8E, 000000BA
        mov     eax, dword [ebp-0CH]                    ; 2DB4 _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 2DB7 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 2DBA _ 8B. 45, 08
        add     edx, 2                                  ; 2DBD _ 83. C2, 02
        mov     edx, dword [eax+edx*8]                  ; 2DC0 _ 8B. 14 D0
        mov     eax, dword [ebp-0CH]                    ; 2DC3 _ 8B. 45, F4
        lea     ecx, [eax-1H]                           ; 2DC6 _ 8D. 48, FF
        mov     eax, dword [ebp+8H]                     ; 2DC9 _ 8B. 45, 08
        add     ecx, 2                                  ; 2DCC _ 83. C1, 02
        mov     eax, dword [eax+ecx*8+4H]               ; 2DCF _ 8B. 44 C8, 04
        add     eax, edx                                ; 2DD3 _ 01. D0
        cmp     eax, dword [ebp+0CH]                    ; 2DD5 _ 3B. 45, 0C
        jne     ?_129                                   ; 2DD8 _ 0F 85, 00000090
        mov     eax, dword [ebp-0CH]                    ; 2DDE _ 8B. 45, F4
        lea     ebx, [eax-1H]                           ; 2DE1 _ 8D. 58, FF
        mov     eax, dword [ebp-0CH]                    ; 2DE4 _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 2DE7 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 2DEA _ 8B. 45, 08
        add     edx, 2                                  ; 2DED _ 83. C2, 02
        mov     edx, dword [eax+edx*8+4H]               ; 2DF0 _ 8B. 54 D0, 04
        mov     eax, dword [ebp+10H]                    ; 2DF4 _ 8B. 45, 10
        lea     ecx, [edx+eax]                          ; 2DF7 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 2DFA _ 8B. 45, 08
        lea     edx, [ebx+2H]                           ; 2DFD _ 8D. 53, 02
        mov     dword [eax+edx*8+4H], ecx               ; 2E00 _ 89. 4C D0, 04
        mov     eax, dword [ebp+8H]                     ; 2E04 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 2E07 _ 8B. 00
        cmp     eax, dword [ebp-0CH]                    ; 2E09 _ 3B. 45, F4
        jle     ?_128                                   ; 2E0C _ 7E, 56
        mov     eax, dword [ebp+10H]                    ; 2E0E _ 8B. 45, 10
        mov     edx, dword [ebp+0CH]                    ; 2E11 _ 8B. 55, 0C
        lea     ecx, [edx+eax]                          ; 2E14 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 2E17 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 2E1A _ 8B. 55, F4
        add     edx, 2                                  ; 2E1D _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 2E20 _ 8B. 04 D0
        cmp     ecx, eax                                ; 2E23 _ 39. C1
        jnz     ?_128                                   ; 2E25 _ 75, 3D
        mov     eax, dword [ebp-0CH]                    ; 2E27 _ 8B. 45, F4
        lea     ebx, [eax-1H]                           ; 2E2A _ 8D. 58, FF
        mov     eax, dword [ebp-0CH]                    ; 2E2D _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 2E30 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 2E33 _ 8B. 45, 08
        add     edx, 2                                  ; 2E36 _ 83. C2, 02
        mov     edx, dword [eax+edx*8+4H]               ; 2E39 _ 8B. 54 D0, 04
        mov     eax, dword [ebp+8H]                     ; 2E3D _ 8B. 45, 08
        mov     ecx, dword [ebp-0CH]                    ; 2E40 _ 8B. 4D, F4
        add     ecx, 2                                  ; 2E43 _ 83. C1, 02
        mov     eax, dword [eax+ecx*8+4H]               ; 2E46 _ 8B. 44 C8, 04
        lea     ecx, [edx+eax]                          ; 2E4A _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 2E4D _ 8B. 45, 08
        lea     edx, [ebx+2H]                           ; 2E50 _ 8D. 53, 02
        mov     dword [eax+edx*8+4H], ecx               ; 2E53 _ 89. 4C D0, 04
        mov     eax, dword [ebp+8H]                     ; 2E57 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 2E5A _ 8B. 00
        lea     edx, [eax-1H]                           ; 2E5C _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 2E5F _ 8B. 45, 08
        mov     dword [eax], edx                        ; 2E62 _ 89. 10
?_128:  mov     eax, 0                                  ; 2E64 _ B8, 00000000
        jmp     ?_135                                   ; 2E69 _ E9, 0000011C

?_129:  mov     eax, dword [ebp+8H]                     ; 2E6E _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 2E71 _ 8B. 00
        cmp     eax, dword [ebp-0CH]                    ; 2E73 _ 3B. 45, F4
        jle     ?_130                                   ; 2E76 _ 7E, 52
        mov     eax, dword [ebp+10H]                    ; 2E78 _ 8B. 45, 10
        mov     edx, dword [ebp+0CH]                    ; 2E7B _ 8B. 55, 0C
        lea     ecx, [edx+eax]                          ; 2E7E _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 2E81 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 2E84 _ 8B. 55, F4
        add     edx, 2                                  ; 2E87 _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 2E8A _ 8B. 04 D0
        cmp     ecx, eax                                ; 2E8D _ 39. C1
        jnz     ?_130                                   ; 2E8F _ 75, 39
        mov     eax, dword [ebp+8H]                     ; 2E91 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 2E94 _ 8B. 55, F4
        lea     ecx, [edx+2H]                           ; 2E97 _ 8D. 4A, 02
        mov     edx, dword [ebp+0CH]                    ; 2E9A _ 8B. 55, 0C
        mov     dword [eax+ecx*8], edx                  ; 2E9D _ 89. 14 C8
        mov     eax, dword [ebp+8H]                     ; 2EA0 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 2EA3 _ 8B. 55, F4
        add     edx, 2                                  ; 2EA6 _ 83. C2, 02
        mov     edx, dword [eax+edx*8+4H]               ; 2EA9 _ 8B. 54 D0, 04
        mov     eax, dword [ebp+10H]                    ; 2EAD _ 8B. 45, 10
        lea     ecx, [edx+eax]                          ; 2EB0 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 2EB3 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 2EB6 _ 8B. 55, F4
        add     edx, 2                                  ; 2EB9 _ 83. C2, 02
        mov     dword [eax+edx*8+4H], ecx               ; 2EBC _ 89. 4C D0, 04
        mov     eax, 0                                  ; 2EC0 _ B8, 00000000
        jmp     ?_135                                   ; 2EC5 _ E9, 000000C0

?_130:  mov     eax, dword [ebp+8H]                     ; 2ECA _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 2ECD _ 8B. 00
        cmp     eax, 4095                               ; 2ECF _ 3D, 00000FFF
        jg      ?_134                                   ; 2ED4 _ 0F 8F, 00000087
        mov     eax, dword [ebp+8H]                     ; 2EDA _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 2EDD _ 8B. 00
        mov     dword [ebp-8H], eax                     ; 2EDF _ 89. 45, F8
        jmp     ?_132                                   ; 2EE2 _ EB, 28

?_131:  mov     eax, dword [ebp-8H]                     ; 2EE4 _ 8B. 45, F8
        lea     edx, [eax-1H]                           ; 2EE7 _ 8D. 50, FF
        mov     ecx, dword [ebp+8H]                     ; 2EEA _ 8B. 4D, 08
        mov     eax, dword [ebp-8H]                     ; 2EED _ 8B. 45, F8
        lea     ebx, [eax+2H]                           ; 2EF0 _ 8D. 58, 02
        mov     eax, dword [ebp+8H]                     ; 2EF3 _ 8B. 45, 08
        add     edx, 2                                  ; 2EF6 _ 83. C2, 02
        lea     edx, [eax+edx*8]                        ; 2EF9 _ 8D. 14 D0
        mov     eax, dword [edx]                        ; 2EFC _ 8B. 02
        mov     edx, dword [edx+4H]                     ; 2EFE _ 8B. 52, 04
        mov     dword [ecx+ebx*8], eax                  ; 2F01 _ 89. 04 D9
        mov     dword [ecx+ebx*8+4H], edx               ; 2F04 _ 89. 54 D9, 04
        sub     dword [ebp-8H], 1                       ; 2F08 _ 83. 6D, F8, 01
?_132:  mov     eax, dword [ebp-8H]                     ; 2F0C _ 8B. 45, F8
        cmp     eax, dword [ebp-0CH]                    ; 2F0F _ 3B. 45, F4
        jg      ?_131                                   ; 2F12 _ 7F, D0
        mov     eax, dword [ebp+8H]                     ; 2F14 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 2F17 _ 8B. 00
        lea     edx, [eax+1H]                           ; 2F19 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 2F1C _ 8B. 45, 08
        mov     dword [eax], edx                        ; 2F1F _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 2F21 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 2F24 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 2F27 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 2F2A _ 8B. 00
        cmp     edx, eax                                ; 2F2C _ 39. C2
        jge     ?_133                                   ; 2F2E _ 7D, 0B
        mov     eax, dword [ebp+8H]                     ; 2F30 _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 2F33 _ 8B. 10
        mov     eax, dword [ebp+8H]                     ; 2F35 _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 2F38 _ 89. 50, 04
?_133:  mov     eax, dword [ebp+8H]                     ; 2F3B _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 2F3E _ 8B. 55, F4
        lea     ecx, [edx+2H]                           ; 2F41 _ 8D. 4A, 02
        mov     edx, dword [ebp+0CH]                    ; 2F44 _ 8B. 55, 0C
        mov     dword [eax+ecx*8], edx                  ; 2F47 _ 89. 14 C8
        mov     eax, dword [ebp+8H]                     ; 2F4A _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 2F4D _ 8B. 55, F4
        lea     ecx, [edx+2H]                           ; 2F50 _ 8D. 4A, 02
        mov     edx, dword [ebp+10H]                    ; 2F53 _ 8B. 55, 10
        mov     dword [eax+ecx*8+4H], edx               ; 2F56 _ 89. 54 C8, 04
        mov     eax, 0                                  ; 2F5A _ B8, 00000000
        jmp     ?_135                                   ; 2F5F _ EB, 29

?_134:  mov     eax, dword [ebp+8H]                     ; 2F61 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 2F64 _ 8B. 40, 0C
        lea     edx, [eax+1H]                           ; 2F67 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 2F6A _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 2F6D _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 2F70 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 2F73 _ 8B. 40, 08
        mov     edx, eax                                ; 2F76 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 2F78 _ 8B. 45, 10
        add     eax, edx                                ; 2F7B _ 01. D0
        mov     edx, eax                                ; 2F7D _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 2F7F _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 2F82 _ 89. 50, 08
        mov     eax, 4294967295                         ; 2F85 _ B8, FFFFFFFF
?_135:  add     esp, 16                                 ; 2F8A _ 83. C4, 10
        pop     ebx                                     ; 2F8D _ 5B
        pop     ebp                                     ; 2F8E _ 5D
        ret                                             ; 2F8F _ C3
; memman_free End of function

memman_alloc_4k:; Function begin
        push    ebp                                     ; 2F90 _ 55
        mov     ebp, esp                                ; 2F91 _ 89. E5
        sub     esp, 24                                 ; 2F93 _ 83. EC, 18
        mov     eax, dword [ebp+0CH]                    ; 2F96 _ 8B. 45, 0C
        add     eax, 4095                               ; 2F99 _ 05, 00000FFF
        and     eax, 0FFFFF000H                         ; 2F9E _ 25, FFFFF000
        mov     dword [ebp+0CH], eax                    ; 2FA3 _ 89. 45, 0C
        mov     eax, dword [ebp+0CH]                    ; 2FA6 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 2FA9 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2FAD _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2FB0 _ 89. 04 24
        call    memman_alloc                            ; 2FB3 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-4H], eax                     ; 2FB8 _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 2FBB _ 8B. 45, FC
        leave                                           ; 2FBE _ C9
        ret                                             ; 2FBF _ C3
; memman_alloc_4k End of function

memman_free_4k:; Function begin
        push    ebp                                     ; 2FC0 _ 55
        mov     ebp, esp                                ; 2FC1 _ 89. E5
        sub     esp, 28                                 ; 2FC3 _ 83. EC, 1C
        mov     eax, dword [ebp+10H]                    ; 2FC6 _ 8B. 45, 10
        add     eax, 4095                               ; 2FC9 _ 05, 00000FFF
        and     eax, 0FFFFF000H                         ; 2FCE _ 25, FFFFF000
        mov     dword [ebp+10H], eax                    ; 2FD3 _ 89. 45, 10
        mov     eax, dword [ebp+10H]                    ; 2FD6 _ 8B. 45, 10
        mov     dword [esp+8H], eax                     ; 2FD9 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 2FDD _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 2FE0 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2FE4 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2FE7 _ 89. 04 24
        call    memman_free                             ; 2FEA _ E8, FFFFFFFC(rel)
        mov     dword [ebp-4H], eax                     ; 2FEF _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 2FF2 _ 8B. 45, FC
        leave                                           ; 2FF5 _ C9
        ret                                             ; 2FF6 _ C3
; memman_free_4k End of function

sheet_control_init:; Function begin
        push    ebp                                     ; 2FF7 _ 55
        mov     ebp, esp                                ; 2FF8 _ 89. E5
        sub     esp, 40                                 ; 2FFA _ 83. EC, 28
        mov     dword [esp+4H], 9236                    ; 2FFD _ C7. 44 24, 04, 00002414
        mov     eax, dword [ebp+8H]                     ; 3005 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3008 _ 89. 04 24
        call    memman_alloc_4k                         ; 300B _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 3010 _ 89. 45, F4
        cmp     dword [ebp-0CH], 0                      ; 3013 _ 83. 7D, F4, 00
        jnz     ?_136                                   ; 3017 _ 75, 24
        mov     eax, dword [ebp-0CH]                    ; 3019 _ 8B. 45, F4
        mov     dword [esp+8H], 9236                    ; 301C _ C7. 44 24, 08, 00002414
        mov     dword [esp+4H], eax                     ; 3024 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 3028 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 302B _ 89. 04 24
        call    memman_free_4k                          ; 302E _ E8, FFFFFFFC(rel)
        mov     eax, 0                                  ; 3033 _ B8, 00000000
        jmp     ?_140                                   ; 3038 _ E9, 0000009D

?_136:  mov     eax, dword [ebp-0CH]                    ; 303D _ 8B. 45, F4
        mov     edx, dword [ebp+0CH]                    ; 3040 _ 8B. 55, 0C
        mov     dword [eax], edx                        ; 3043 _ 89. 10
        mov     eax, dword [ebp-0CH]                    ; 3045 _ 8B. 45, F4
        mov     edx, dword [ebp+10H]                    ; 3048 _ 8B. 55, 10
        mov     dword [eax+4H], edx                     ; 304B _ 89. 50, 04
        mov     eax, dword [ebp-0CH]                    ; 304E _ 8B. 45, F4
        mov     edx, dword [ebp+14H]                    ; 3051 _ 8B. 55, 14
        mov     dword [eax+8H], edx                     ; 3054 _ 89. 50, 08
        mov     eax, dword [ebp-0CH]                    ; 3057 _ 8B. 45, F4
        mov     dword [eax+0CH], -1                     ; 305A _ C7. 40, 0C, FFFFFFFF
        mov     dword [ebp-10H], 0                      ; 3061 _ C7. 45, F0, 00000000
        jmp     ?_138                                   ; 3068 _ EB, 1B

?_137:  mov     eax, dword [ebp-0CH]                    ; 306A _ 8B. 45, F4
        mov     edx, dword [ebp-10H]                    ; 306D _ 8B. 55, F0
        add     edx, 33                                 ; 3070 _ 83. C2, 21
        shl     edx, 5                                  ; 3073 _ C1. E2, 05
        add     eax, edx                                ; 3076 _ 01. D0
        add     eax, 16                                 ; 3078 _ 83. C0, 10
        mov     dword [eax], 0                          ; 307B _ C7. 00, 00000000
        add     dword [ebp-10H], 1                      ; 3081 _ 83. 45, F0, 01
?_138:  cmp     dword [ebp-10H], 255                    ; 3085 _ 81. 7D, F0, 000000FF
        jle     ?_137                                   ; 308C _ 7E, DC
        mov     eax, dword [ebp+10H]                    ; 308E _ 8B. 45, 10
        imul    eax, dword [ebp+14H]                    ; 3091 _ 0F AF. 45, 14
        mov     dword [esp+4H], eax                     ; 3095 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 3099 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 309C _ 89. 04 24
        call    memman_alloc_4k                         ; 309F _ E8, FFFFFFFC(rel)
        mov     edx, eax                                ; 30A4 _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 30A6 _ 8B. 45, F4
        mov     dword [eax+10H], edx                    ; 30A9 _ 89. 50, 10
        mov     eax, dword [ebp-0CH]                    ; 30AC _ 8B. 45, F4
        mov     eax, dword [eax+10H]                    ; 30AF _ 8B. 40, 10
        test    eax, eax                                ; 30B2 _ 85. C0
        jnz     ?_139                                   ; 30B4 _ 75, 21
        mov     eax, dword [ebp-0CH]                    ; 30B6 _ 8B. 45, F4
        mov     dword [esp+8H], 9236                    ; 30B9 _ C7. 44 24, 08, 00002414
        mov     dword [esp+4H], eax                     ; 30C1 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 30C5 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 30C8 _ 89. 04 24
        call    memman_free_4k                          ; 30CB _ E8, FFFFFFFC(rel)
        mov     eax, 0                                  ; 30D0 _ B8, 00000000
        jmp     ?_140                                   ; 30D5 _ EB, 03

?_139:  mov     eax, dword [ebp-0CH]                    ; 30D7 _ 8B. 45, F4
?_140:  leave                                           ; 30DA _ C9
        ret                                             ; 30DB _ C3
; sheet_control_init End of function

sheet_alloc:; Function begin
        push    ebp                                     ; 30DC _ 55
        mov     ebp, esp                                ; 30DD _ 89. E5
        sub     esp, 16                                 ; 30DF _ 83. EC, 10
        mov     dword [ebp-8H], 0                       ; 30E2 _ C7. 45, F8, 00000000
        jmp     ?_143                                   ; 30E9 _ EB, 5B

?_141:  mov     eax, dword [ebp+8H]                     ; 30EB _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 30EE _ 8B. 55, F8
        add     edx, 33                                 ; 30F1 _ 83. C2, 21
        shl     edx, 5                                  ; 30F4 _ C1. E2, 05
        add     eax, edx                                ; 30F7 _ 01. D0
        add     eax, 16                                 ; 30F9 _ 83. C0, 10
        mov     eax, dword [eax]                        ; 30FC _ 8B. 00
        test    eax, eax                                ; 30FE _ 85. C0
        jnz     ?_142                                   ; 3100 _ 75, 40
        mov     eax, dword [ebp-8H]                     ; 3102 _ 8B. 45, F8
        shl     eax, 5                                  ; 3105 _ C1. E0, 05
        lea     edx, [eax+410H]                         ; 3108 _ 8D. 90, 00000410
        mov     eax, dword [ebp+8H]                     ; 310E _ 8B. 45, 08
        add     eax, edx                                ; 3111 _ 01. D0
        add     eax, 4                                  ; 3113 _ 83. C0, 04
        mov     dword [ebp-4H], eax                     ; 3116 _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 3119 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 311C _ 8B. 55, F8
        lea     ecx, [edx+4H]                           ; 311F _ 8D. 4A, 04
        mov     edx, dword [ebp-4H]                     ; 3122 _ 8B. 55, FC
        mov     dword [eax+ecx*4+4H], edx               ; 3125 _ 89. 54 88, 04
        mov     eax, dword [ebp-4H]                     ; 3129 _ 8B. 45, FC
        mov     dword [eax+1CH], 1                      ; 312C _ C7. 40, 1C, 00000001
        mov     eax, dword [ebp-4H]                     ; 3133 _ 8B. 45, FC
        mov     dword [eax+18H], -1                     ; 3136 _ C7. 40, 18, FFFFFFFF
        mov     eax, dword [ebp-4H]                     ; 313D _ 8B. 45, FC
        jmp     ?_144                                   ; 3140 _ EB, 12

?_142:  add     dword [ebp-8H], 1                       ; 3142 _ 83. 45, F8, 01
?_143:  cmp     dword [ebp-8H], 255                     ; 3146 _ 81. 7D, F8, 000000FF
        jle     ?_141                                   ; 314D _ 7E, 9C
        mov     eax, 0                                  ; 314F _ B8, 00000000
?_144:  leave                                           ; 3154 _ C9
        ret                                             ; 3155 _ C3
; sheet_alloc End of function

sheet_setbuf:; Function begin
        push    ebp                                     ; 3156 _ 55
        mov     ebp, esp                                ; 3157 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 3159 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 315C _ 8B. 55, 0C
        mov     dword [eax], edx                        ; 315F _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 3161 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 3164 _ 8B. 55, 10
        mov     dword [eax+4H], edx                     ; 3167 _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 316A _ 8B. 45, 08
        mov     edx, dword [ebp+14H]                    ; 316D _ 8B. 55, 14
        mov     dword [eax+8H], edx                     ; 3170 _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 3173 _ 8B. 45, 08
        mov     edx, dword [ebp+18H]                    ; 3176 _ 8B. 55, 18
        mov     dword [eax+14H], edx                    ; 3179 _ 89. 50, 14
        pop     ebp                                     ; 317C _ 5D
        ret                                             ; 317D _ C3
; sheet_setbuf End of function

sheet_updown:; Function begin
        push    ebp                                     ; 317E _ 55
        mov     ebp, esp                                ; 317F _ 89. E5
        push    esi                                     ; 3181 _ 56
        push    ebx                                     ; 3182 _ 53
        sub     esp, 48                                 ; 3183 _ 83. EC, 30
        mov     eax, dword [ebp+0CH]                    ; 3186 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 3189 _ 8B. 40, 18
        mov     dword [ebp-0CH], eax                    ; 318C _ 89. 45, F4
        mov     eax, dword [ebp+8H]                     ; 318F _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 3192 _ 8B. 40, 0C
        add     eax, 1                                  ; 3195 _ 83. C0, 01
        cmp     eax, dword [ebp+10H]                    ; 3198 _ 3B. 45, 10
        jge     ?_145                                   ; 319B _ 7D, 0C
        mov     eax, dword [ebp+8H]                     ; 319D _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 31A0 _ 8B. 40, 0C
        add     eax, 1                                  ; 31A3 _ 83. C0, 01
        mov     dword [ebp+10H], eax                    ; 31A6 _ 89. 45, 10
?_145:  cmp     dword [ebp+10H], -1                     ; 31A9 _ 83. 7D, 10, FF
        jge     ?_146                                   ; 31AD _ 7D, 07
        mov     dword [ebp+10H], -1                     ; 31AF _ C7. 45, 10, FFFFFFFF
?_146:  mov     eax, dword [ebp+0CH]                    ; 31B6 _ 8B. 45, 0C
        mov     edx, dword [ebp+10H]                    ; 31B9 _ 8B. 55, 10
        mov     dword [eax+18H], edx                    ; 31BC _ 89. 50, 18
        mov     eax, dword [ebp-0CH]                    ; 31BF _ 8B. 45, F4
        cmp     eax, dword [ebp+10H]                    ; 31C2 _ 3B. 45, 10
        jle     ?_153                                   ; 31C5 _ 0F 8E, 00000201
        cmp     dword [ebp+10H], 0                      ; 31CB _ 83. 7D, 10, 00
        js      ?_149                                   ; 31CF _ 0F 88, 000000F7
        mov     eax, dword [ebp-0CH]                    ; 31D5 _ 8B. 45, F4
        mov     dword [ebp-10H], eax                    ; 31D8 _ 89. 45, F0
        jmp     ?_148                                   ; 31DB _ EB, 34

?_147:  mov     eax, dword [ebp-10H]                    ; 31DD _ 8B. 45, F0
        lea     edx, [eax-1H]                           ; 31E0 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 31E3 _ 8B. 45, 08
        add     edx, 4                                  ; 31E6 _ 83. C2, 04
        mov     edx, dword [eax+edx*4+4H]               ; 31E9 _ 8B. 54 90, 04
        mov     eax, dword [ebp+8H]                     ; 31ED _ 8B. 45, 08
        mov     ecx, dword [ebp-10H]                    ; 31F0 _ 8B. 4D, F0
        add     ecx, 4                                  ; 31F3 _ 83. C1, 04
        mov     dword [eax+ecx*4+4H], edx               ; 31F6 _ 89. 54 88, 04
        mov     eax, dword [ebp+8H]                     ; 31FA _ 8B. 45, 08
        mov     edx, dword [ebp-10H]                    ; 31FD _ 8B. 55, F0
        add     edx, 4                                  ; 3200 _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 3203 _ 8B. 44 90, 04
        mov     edx, dword [ebp-10H]                    ; 3207 _ 8B. 55, F0
        mov     dword [eax+18H], edx                    ; 320A _ 89. 50, 18
        sub     dword [ebp-10H], 1                      ; 320D _ 83. 6D, F0, 01
?_148:  mov     eax, dword [ebp-10H]                    ; 3211 _ 8B. 45, F0
        cmp     eax, dword [ebp+10H]                    ; 3214 _ 3B. 45, 10
        jg      ?_147                                   ; 3217 _ 7F, C4
        mov     eax, dword [ebp+8H]                     ; 3219 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 321C _ 8B. 55, 10
        lea     ecx, [edx+4H]                           ; 321F _ 8D. 4A, 04
        mov     edx, dword [ebp+0CH]                    ; 3222 _ 8B. 55, 0C
        mov     dword [eax+ecx*4+4H], edx               ; 3225 _ 89. 54 88, 04
        mov     eax, dword [ebp+10H]                    ; 3229 _ 8B. 45, 10
        lea     esi, [eax+1H]                           ; 322C _ 8D. 70, 01
        mov     eax, dword [ebp+0CH]                    ; 322F _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 3232 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 3235 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 3238 _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 323B _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 323E _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 3241 _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 3244 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 3247 _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 324A _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 324D _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 3250 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 3253 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 3256 _ 8B. 40, 0C
        mov     dword [esp+14H], esi                    ; 3259 _ 89. 74 24, 14
        mov     dword [esp+10H], ebx                    ; 325D _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 3261 _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 3265 _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 3269 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 326D _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3270 _ 89. 04 24
        call    sheet_refresh_map                       ; 3273 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 3278 _ 8B. 45, 10
        lea     esi, [eax+1H]                           ; 327B _ 8D. 70, 01
        mov     eax, dword [ebp+0CH]                    ; 327E _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 3281 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 3284 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 3287 _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 328A _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 328D _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 3290 _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 3293 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 3296 _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 3299 _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 329C _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 329F _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 32A2 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 32A5 _ 8B. 40, 0C
        mov     dword [esp+14H], esi                    ; 32A8 _ 89. 74 24, 14
        mov     dword [esp+10H], ebx                    ; 32AC _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 32B0 _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 32B4 _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 32B8 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 32BC _ 8B. 45, 08
        mov     dword [esp], eax                        ; 32BF _ 89. 04 24
        call    sheet_refresh_local                     ; 32C2 _ E8, FFFFFFFC(rel)
        jmp     ?_160                                   ; 32C7 _ E9, 0000026C

?_149:  mov     eax, dword [ebp+8H]                     ; 32CC _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 32CF _ 8B. 40, 0C
        cmp     eax, dword [ebp-0CH]                    ; 32D2 _ 3B. 45, F4
        jle     ?_152                                   ; 32D5 _ 7E, 47
        mov     eax, dword [ebp-0CH]                    ; 32D7 _ 8B. 45, F4
        mov     dword [ebp-10H], eax                    ; 32DA _ 89. 45, F0
        jmp     ?_151                                   ; 32DD _ EB, 34

?_150:  mov     eax, dword [ebp-10H]                    ; 32DF _ 8B. 45, F0
        lea     edx, [eax+1H]                           ; 32E2 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 32E5 _ 8B. 45, 08
        add     edx, 4                                  ; 32E8 _ 83. C2, 04
        mov     edx, dword [eax+edx*4+4H]               ; 32EB _ 8B. 54 90, 04
        mov     eax, dword [ebp+8H]                     ; 32EF _ 8B. 45, 08
        mov     ecx, dword [ebp-10H]                    ; 32F2 _ 8B. 4D, F0
        add     ecx, 4                                  ; 32F5 _ 83. C1, 04
        mov     dword [eax+ecx*4+4H], edx               ; 32F8 _ 89. 54 88, 04
        mov     eax, dword [ebp+8H]                     ; 32FC _ 8B. 45, 08
        mov     edx, dword [ebp-10H]                    ; 32FF _ 8B. 55, F0
        add     edx, 4                                  ; 3302 _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 3305 _ 8B. 44 90, 04
        mov     edx, dword [ebp-10H]                    ; 3309 _ 8B. 55, F0
        mov     dword [eax+18H], edx                    ; 330C _ 89. 50, 18
        add     dword [ebp-10H], 1                      ; 330F _ 83. 45, F0, 01
?_151:  mov     eax, dword [ebp+8H]                     ; 3313 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 3316 _ 8B. 40, 0C
        cmp     eax, dword [ebp-10H]                    ; 3319 _ 3B. 45, F0
        jg      ?_150                                   ; 331C _ 7F, C1
?_152:  mov     eax, dword [ebp+8H]                     ; 331E _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 3321 _ 8B. 40, 0C
        lea     edx, [eax-1H]                           ; 3324 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 3327 _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 332A _ 89. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 332D _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 3330 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 3333 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 3336 _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 3339 _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 333C _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 333F _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 3342 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 3345 _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 3348 _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 334B _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 334E _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 3351 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 3354 _ 8B. 40, 0C
        mov     dword [esp+14H], 0                      ; 3357 _ C7. 44 24, 14, 00000000
        mov     dword [esp+10H], ebx                    ; 335F _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 3363 _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 3367 _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 336B _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 336F _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3372 _ 89. 04 24
        call    sheet_refresh_map                       ; 3375 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+0CH]                    ; 337A _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 337D _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 3380 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 3383 _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 3386 _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 3389 _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 338C _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 338F _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 3392 _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 3395 _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 3398 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 339B _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 339E _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 33A1 _ 8B. 40, 0C
        mov     dword [esp+14H], 0                      ; 33A4 _ C7. 44 24, 14, 00000000
        mov     dword [esp+10H], ebx                    ; 33AC _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 33B0 _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 33B4 _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 33B8 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 33BC _ 8B. 45, 08
        mov     dword [esp], eax                        ; 33BF _ 89. 04 24
        call    sheet_refresh_local                     ; 33C2 _ E8, FFFFFFFC(rel)
        jmp     ?_160                                   ; 33C7 _ E9, 0000016C

?_153:  mov     eax, dword [ebp-0CH]                    ; 33CC _ 8B. 45, F4
        cmp     eax, dword [ebp+10H]                    ; 33CF _ 3B. 45, 10
        jge     ?_160                                   ; 33D2 _ 0F 8D, 00000160
        cmp     dword [ebp-0CH], 0                      ; 33D8 _ 83. 7D, F4, 00
        js      ?_156                                   ; 33DC _ 78, 56
        mov     eax, dword [ebp-0CH]                    ; 33DE _ 8B. 45, F4
        mov     dword [ebp-10H], eax                    ; 33E1 _ 89. 45, F0
        jmp     ?_155                                   ; 33E4 _ EB, 34

?_154:  mov     eax, dword [ebp-10H]                    ; 33E6 _ 8B. 45, F0
        lea     edx, [eax+1H]                           ; 33E9 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 33EC _ 8B. 45, 08
        add     edx, 4                                  ; 33EF _ 83. C2, 04
        mov     edx, dword [eax+edx*4+4H]               ; 33F2 _ 8B. 54 90, 04
        mov     eax, dword [ebp+8H]                     ; 33F6 _ 8B. 45, 08
        mov     ecx, dword [ebp-10H]                    ; 33F9 _ 8B. 4D, F0
        add     ecx, 4                                  ; 33FC _ 83. C1, 04
        mov     dword [eax+ecx*4+4H], edx               ; 33FF _ 89. 54 88, 04
        mov     eax, dword [ebp+8H]                     ; 3403 _ 8B. 45, 08
        mov     edx, dword [ebp-10H]                    ; 3406 _ 8B. 55, F0
        add     edx, 4                                  ; 3409 _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 340C _ 8B. 44 90, 04
        mov     edx, dword [ebp-10H]                    ; 3410 _ 8B. 55, F0
        mov     dword [eax+18H], edx                    ; 3413 _ 89. 50, 18
        add     dword [ebp-10H], 1                      ; 3416 _ 83. 45, F0, 01
?_155:  mov     eax, dword [ebp-10H]                    ; 341A _ 8B. 45, F0
        cmp     eax, dword [ebp+10H]                    ; 341D _ 3B. 45, 10
        jl      ?_154                                   ; 3420 _ 7C, C4
        mov     eax, dword [ebp+8H]                     ; 3422 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 3425 _ 8B. 55, 10
        lea     ecx, [edx+4H]                           ; 3428 _ 8D. 4A, 04
        mov     edx, dword [ebp+0CH]                    ; 342B _ 8B. 55, 0C
        mov     dword [eax+ecx*4+4H], edx               ; 342E _ 89. 54 88, 04
        jmp     ?_159                                   ; 3432 _ EB, 6C

?_156:  mov     eax, dword [ebp+8H]                     ; 3434 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 3437 _ 8B. 40, 0C
        mov     dword [ebp-10H], eax                    ; 343A _ 89. 45, F0
        jmp     ?_158                                   ; 343D _ EB, 3A

?_157:  mov     eax, dword [ebp-10H]                    ; 343F _ 8B. 45, F0
        lea     ecx, [eax+1H]                           ; 3442 _ 8D. 48, 01
        mov     eax, dword [ebp+8H]                     ; 3445 _ 8B. 45, 08
        mov     edx, dword [ebp-10H]                    ; 3448 _ 8B. 55, F0
        add     edx, 4                                  ; 344B _ 83. C2, 04
        mov     edx, dword [eax+edx*4+4H]               ; 344E _ 8B. 54 90, 04
        mov     eax, dword [ebp+8H]                     ; 3452 _ 8B. 45, 08
        add     ecx, 4                                  ; 3455 _ 83. C1, 04
        mov     dword [eax+ecx*4+4H], edx               ; 3458 _ 89. 54 88, 04
        mov     eax, dword [ebp-10H]                    ; 345C _ 8B. 45, F0
        lea     edx, [eax+1H]                           ; 345F _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 3462 _ 8B. 45, 08
        add     edx, 4                                  ; 3465 _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 3468 _ 8B. 44 90, 04
        mov     edx, dword [ebp-10H]                    ; 346C _ 8B. 55, F0
        add     edx, 1                                  ; 346F _ 83. C2, 01
        mov     dword [eax+18H], edx                    ; 3472 _ 89. 50, 18
        sub     dword [ebp-10H], 1                      ; 3475 _ 83. 6D, F0, 01
?_158:  mov     eax, dword [ebp-10H]                    ; 3479 _ 8B. 45, F0
        cmp     eax, dword [ebp+10H]                    ; 347C _ 3B. 45, 10
        jge     ?_157                                   ; 347F _ 7D, BE
        mov     eax, dword [ebp+8H]                     ; 3481 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 3484 _ 8B. 55, 10
        lea     ecx, [edx+4H]                           ; 3487 _ 8D. 4A, 04
        mov     edx, dword [ebp+0CH]                    ; 348A _ 8B. 55, 0C
        mov     dword [eax+ecx*4+4H], edx               ; 348D _ 89. 54 88, 04
        mov     eax, dword [ebp+8H]                     ; 3491 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 3494 _ 8B. 40, 0C
        lea     edx, [eax+1H]                           ; 3497 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 349A _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 349D _ 89. 50, 0C
?_159:  mov     eax, dword [ebp+0CH]                    ; 34A0 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 34A3 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 34A6 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 34A9 _ 8B. 40, 08
        lea     esi, [edx+eax]                          ; 34AC _ 8D. 34 02
        mov     eax, dword [ebp+0CH]                    ; 34AF _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 34B2 _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 34B5 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 34B8 _ 8B. 40, 04
        lea     ebx, [edx+eax]                          ; 34BB _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 34BE _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 34C1 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 34C4 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 34C7 _ 8B. 40, 0C
        mov     ecx, dword [ebp+10H]                    ; 34CA _ 8B. 4D, 10
        mov     dword [esp+14H], ecx                    ; 34CD _ 89. 4C 24, 14
        mov     dword [esp+10H], esi                    ; 34D1 _ 89. 74 24, 10
        mov     dword [esp+0CH], ebx                    ; 34D5 _ 89. 5C 24, 0C
        mov     dword [esp+8H], edx                     ; 34D9 _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 34DD _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 34E1 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 34E4 _ 89. 04 24
        call    sheet_refresh_map                       ; 34E7 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+0CH]                    ; 34EC _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 34EF _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 34F2 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 34F5 _ 8B. 40, 08
        lea     esi, [edx+eax]                          ; 34F8 _ 8D. 34 02
        mov     eax, dword [ebp+0CH]                    ; 34FB _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 34FE _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 3501 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 3504 _ 8B. 40, 04
        lea     ebx, [edx+eax]                          ; 3507 _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 350A _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 350D _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 3510 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 3513 _ 8B. 40, 0C
        mov     ecx, dword [ebp+10H]                    ; 3516 _ 8B. 4D, 10
        mov     dword [esp+14H], ecx                    ; 3519 _ 89. 4C 24, 14
        mov     dword [esp+10H], esi                    ; 351D _ 89. 74 24, 10
        mov     dword [esp+0CH], ebx                    ; 3521 _ 89. 5C 24, 0C
        mov     dword [esp+8H], edx                     ; 3525 _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 3529 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 352D _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3530 _ 89. 04 24
        call    sheet_refresh_local                     ; 3533 _ E8, FFFFFFFC(rel)
?_160:  add     esp, 48                                 ; 3538 _ 83. C4, 30
        pop     ebx                                     ; 353B _ 5B
        pop     esi                                     ; 353C _ 5E
        pop     ebp                                     ; 353D _ 5D
        ret                                             ; 353E _ C3
; sheet_updown End of function

sheet_refresh:; Function begin
        push    ebp                                     ; 353F _ 55
        mov     ebp, esp                                ; 3540 _ 89. E5
        push    edi                                     ; 3542 _ 57
        push    esi                                     ; 3543 _ 56
        push    ebx                                     ; 3544 _ 53
        sub     esp, 44                                 ; 3545 _ 83. EC, 2C
        mov     eax, dword [ebp+0CH]                    ; 3548 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 354B _ 8B. 40, 18
        test    eax, eax                                ; 354E _ 85. C0
        js      ?_161                                   ; 3550 _ 78, 53
        mov     eax, dword [ebp+0CH]                    ; 3552 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 3555 _ 8B. 40, 18
        mov     edx, dword [ebp+0CH]                    ; 3558 _ 8B. 55, 0C
        mov     ecx, dword [edx+10H]                    ; 355B _ 8B. 4A, 10
        mov     edx, dword [ebp+1CH]                    ; 355E _ 8B. 55, 1C
        lea     esi, [ecx+edx]                          ; 3561 _ 8D. 34 11
        mov     edx, dword [ebp+0CH]                    ; 3564 _ 8B. 55, 0C
        mov     ecx, dword [edx+0CH]                    ; 3567 _ 8B. 4A, 0C
        mov     edx, dword [ebp+18H]                    ; 356A _ 8B. 55, 18
        lea     ebx, [ecx+edx]                          ; 356D _ 8D. 1C 11
        mov     edx, dword [ebp+0CH]                    ; 3570 _ 8B. 55, 0C
        mov     ecx, dword [edx+10H]                    ; 3573 _ 8B. 4A, 10
        mov     edx, dword [ebp+14H]                    ; 3576 _ 8B. 55, 14
        add     ecx, edx                                ; 3579 _ 01. D1
        mov     edx, dword [ebp+0CH]                    ; 357B _ 8B. 55, 0C
        mov     edi, dword [edx+0CH]                    ; 357E _ 8B. 7A, 0C
        mov     edx, dword [ebp+10H]                    ; 3581 _ 8B. 55, 10
        add     edx, edi                                ; 3584 _ 01. FA
        mov     dword [esp+14H], eax                    ; 3586 _ 89. 44 24, 14
        mov     dword [esp+10H], esi                    ; 358A _ 89. 74 24, 10
        mov     dword [esp+0CH], ebx                    ; 358E _ 89. 5C 24, 0C
        mov     dword [esp+8H], ecx                     ; 3592 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 3596 _ 89. 54 24, 04
        mov     eax, dword [ebp+8H]                     ; 359A _ 8B. 45, 08
        mov     dword [esp], eax                        ; 359D _ 89. 04 24
        call    sheet_refresh_local                     ; 35A0 _ E8, FFFFFFFC(rel)
?_161:  mov     eax, 0                                  ; 35A5 _ B8, 00000000
        add     esp, 44                                 ; 35AA _ 83. C4, 2C
        pop     ebx                                     ; 35AD _ 5B
        pop     esi                                     ; 35AE _ 5E
        pop     edi                                     ; 35AF _ 5F
        pop     ebp                                     ; 35B0 _ 5D
        ret                                             ; 35B1 _ C3
; sheet_refresh End of function

sheet_slide:; Function begin
        push    ebp                                     ; 35B2 _ 55
        mov     ebp, esp                                ; 35B3 _ 89. E5
        push    ebx                                     ; 35B5 _ 53
        sub     esp, 52                                 ; 35B6 _ 83. EC, 34
        mov     eax, dword [ebp+0CH]                    ; 35B9 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 35BC _ 8B. 40, 0C
        mov     dword [ebp-10H], eax                    ; 35BF _ 89. 45, F0
        mov     eax, dword [ebp+0CH]                    ; 35C2 _ 8B. 45, 0C
        mov     eax, dword [eax+10H]                    ; 35C5 _ 8B. 40, 10
        mov     dword [ebp-0CH], eax                    ; 35C8 _ 89. 45, F4
        mov     eax, dword [ebp+0CH]                    ; 35CB _ 8B. 45, 0C
        mov     edx, dword [ebp+10H]                    ; 35CE _ 8B. 55, 10
        mov     dword [eax+0CH], edx                    ; 35D1 _ 89. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 35D4 _ 8B. 45, 0C
        mov     edx, dword [ebp+14H]                    ; 35D7 _ 8B. 55, 14
        mov     dword [eax+10H], edx                    ; 35DA _ 89. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 35DD _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 35E0 _ 8B. 40, 18
        test    eax, eax                                ; 35E3 _ 85. C0
        js      ?_162                                   ; 35E5 _ 0F 88, 00000100
        mov     eax, dword [ebp+0CH]                    ; 35EB _ 8B. 45, 0C
        mov     edx, dword [eax+8H]                     ; 35EE _ 8B. 50, 08
        mov     eax, dword [ebp-0CH]                    ; 35F1 _ 8B. 45, F4
        add     edx, eax                                ; 35F4 _ 01. C2
        mov     eax, dword [ebp+0CH]                    ; 35F6 _ 8B. 45, 0C
        mov     ecx, dword [eax+4H]                     ; 35F9 _ 8B. 48, 04
        mov     eax, dword [ebp-10H]                    ; 35FC _ 8B. 45, F0
        add     eax, ecx                                ; 35FF _ 01. C8
        mov     dword [esp+14H], 0                      ; 3601 _ C7. 44 24, 14, 00000000
        mov     dword [esp+10H], edx                    ; 3609 _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 360D _ 89. 44 24, 0C
        mov     eax, dword [ebp-0CH]                    ; 3611 _ 8B. 45, F4
        mov     dword [esp+8H], eax                     ; 3614 _ 89. 44 24, 08
        mov     eax, dword [ebp-10H]                    ; 3618 _ 8B. 45, F0
        mov     dword [esp+4H], eax                     ; 361B _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 361F _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3622 _ 89. 04 24
        call    sheet_refresh_map                       ; 3625 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+0CH]                    ; 362A _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 362D _ 8B. 40, 18
        mov     edx, dword [ebp+0CH]                    ; 3630 _ 8B. 55, 0C
        mov     ecx, dword [edx+8H]                     ; 3633 _ 8B. 4A, 08
        mov     edx, dword [ebp+14H]                    ; 3636 _ 8B. 55, 14
        add     ecx, edx                                ; 3639 _ 01. D1
        mov     edx, dword [ebp+0CH]                    ; 363B _ 8B. 55, 0C
        mov     ebx, dword [edx+4H]                     ; 363E _ 8B. 5A, 04
        mov     edx, dword [ebp+10H]                    ; 3641 _ 8B. 55, 10
        add     edx, ebx                                ; 3644 _ 01. DA
        mov     dword [esp+14H], eax                    ; 3646 _ 89. 44 24, 14
        mov     dword [esp+10H], ecx                    ; 364A _ 89. 4C 24, 10
        mov     dword [esp+0CH], edx                    ; 364E _ 89. 54 24, 0C
        mov     eax, dword [ebp+14H]                    ; 3652 _ 8B. 45, 14
        mov     dword [esp+8H], eax                     ; 3655 _ 89. 44 24, 08
        mov     eax, dword [ebp+10H]                    ; 3659 _ 8B. 45, 10
        mov     dword [esp+4H], eax                     ; 365C _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 3660 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3663 _ 89. 04 24
        call    sheet_refresh_map                       ; 3666 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+0CH]                    ; 366B _ 8B. 45, 0C
        mov     edx, dword [eax+8H]                     ; 366E _ 8B. 50, 08
        mov     eax, dword [ebp-0CH]                    ; 3671 _ 8B. 45, F4
        add     edx, eax                                ; 3674 _ 01. C2
        mov     eax, dword [ebp+0CH]                    ; 3676 _ 8B. 45, 0C
        mov     ecx, dword [eax+4H]                     ; 3679 _ 8B. 48, 04
        mov     eax, dword [ebp-10H]                    ; 367C _ 8B. 45, F0
        add     eax, ecx                                ; 367F _ 01. C8
        mov     dword [esp+14H], 0                      ; 3681 _ C7. 44 24, 14, 00000000
        mov     dword [esp+10H], edx                    ; 3689 _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 368D _ 89. 44 24, 0C
        mov     eax, dword [ebp-0CH]                    ; 3691 _ 8B. 45, F4
        mov     dword [esp+8H], eax                     ; 3694 _ 89. 44 24, 08
        mov     eax, dword [ebp-10H]                    ; 3698 _ 8B. 45, F0
        mov     dword [esp+4H], eax                     ; 369B _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 369F _ 8B. 45, 08
        mov     dword [esp], eax                        ; 36A2 _ 89. 04 24
        call    sheet_refresh_local                     ; 36A5 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+0CH]                    ; 36AA _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 36AD _ 8B. 40, 18
        mov     edx, dword [ebp+0CH]                    ; 36B0 _ 8B. 55, 0C
        mov     ecx, dword [edx+8H]                     ; 36B3 _ 8B. 4A, 08
        mov     edx, dword [ebp+14H]                    ; 36B6 _ 8B. 55, 14
        add     ecx, edx                                ; 36B9 _ 01. D1
        mov     edx, dword [ebp+0CH]                    ; 36BB _ 8B. 55, 0C
        mov     ebx, dword [edx+4H]                     ; 36BE _ 8B. 5A, 04
        mov     edx, dword [ebp+10H]                    ; 36C1 _ 8B. 55, 10
        add     edx, ebx                                ; 36C4 _ 01. DA
        mov     dword [esp+14H], eax                    ; 36C6 _ 89. 44 24, 14
        mov     dword [esp+10H], ecx                    ; 36CA _ 89. 4C 24, 10
        mov     dword [esp+0CH], edx                    ; 36CE _ 89. 54 24, 0C
        mov     eax, dword [ebp+14H]                    ; 36D2 _ 8B. 45, 14
        mov     dword [esp+8H], eax                     ; 36D5 _ 89. 44 24, 08
        mov     eax, dword [ebp+10H]                    ; 36D9 _ 8B. 45, 10
        mov     dword [esp+4H], eax                     ; 36DC _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 36E0 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 36E3 _ 89. 04 24
        call    sheet_refresh_local                     ; 36E6 _ E8, FFFFFFFC(rel)
?_162:  add     esp, 52                                 ; 36EB _ 83. C4, 34
        pop     ebx                                     ; 36EE _ 5B
        pop     ebp                                     ; 36EF _ 5D
        ret                                             ; 36F0 _ C3
; sheet_slide End of function

sheet_refresh_local:; Function begin
        push    ebp                                     ; 36F1 _ 55
        mov     ebp, esp                                ; 36F2 _ 89. E5
        sub     esp, 48                                 ; 36F4 _ 83. EC, 30
        mov     eax, dword [ebp+8H]                     ; 36F7 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 36FA _ 8B. 00
        mov     dword [ebp-18H], eax                    ; 36FC _ 89. 45, E8
        mov     eax, dword [ebp+8H]                     ; 36FF _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 3702 _ 8B. 40, 10
        mov     dword [ebp-14H], eax                    ; 3705 _ 89. 45, EC
        cmp     dword [ebp+0CH], 0                      ; 3708 _ 83. 7D, 0C, 00
        jns     ?_163                                   ; 370C _ 79, 07
        mov     dword [ebp+0CH], 0                      ; 370E _ C7. 45, 0C, 00000000
?_163:  cmp     dword [ebp+10H], 0                      ; 3715 _ 83. 7D, 10, 00
        jns     ?_164                                   ; 3719 _ 79, 07
        mov     dword [ebp+10H], 0                      ; 371B _ C7. 45, 10, 00000000
?_164:  mov     eax, dword [ebp+8H]                     ; 3722 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 3725 _ 8B. 40, 04
        cmp     eax, dword [ebp+14H]                    ; 3728 _ 3B. 45, 14
        jge     ?_165                                   ; 372B _ 7D, 09
        mov     eax, dword [ebp+8H]                     ; 372D _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 3730 _ 8B. 40, 04
        mov     dword [ebp+14H], eax                    ; 3733 _ 89. 45, 14
?_165:  mov     eax, dword [ebp+8H]                     ; 3736 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 3739 _ 8B. 40, 08
        cmp     eax, dword [ebp+18H]                    ; 373C _ 3B. 45, 18
        jge     ?_166                                   ; 373F _ 7D, 09
        mov     eax, dword [ebp+8H]                     ; 3741 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 3744 _ 8B. 40, 08
        mov     dword [ebp+18H], eax                    ; 3747 _ 89. 45, 18
?_166:  mov     eax, dword [ebp+1CH]                    ; 374A _ 8B. 45, 1C
        mov     dword [ebp-24H], eax                    ; 374D _ 89. 45, DC
        jmp     ?_173                                   ; 3750 _ E9, 00000119

?_167:  mov     eax, dword [ebp+8H]                     ; 3755 _ 8B. 45, 08
        mov     edx, dword [ebp-24H]                    ; 3758 _ 8B. 55, DC
        add     edx, 4                                  ; 375B _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 375E _ 8B. 44 90, 04
        mov     dword [ebp-10H], eax                    ; 3762 _ 89. 45, F0
        mov     eax, dword [ebp-10H]                    ; 3765 _ 8B. 45, F0
        mov     eax, dword [eax]                        ; 3768 _ 8B. 00
        mov     dword [ebp-0CH], eax                    ; 376A _ 89. 45, F4
        mov     edx, dword [ebp-10H]                    ; 376D _ 8B. 55, F0
        mov     eax, dword [ebp+8H]                     ; 3770 _ 8B. 45, 08
        add     eax, 1044                               ; 3773 _ 05, 00000414
        sub     edx, eax                                ; 3778 _ 29. C2
        mov     eax, edx                                ; 377A _ 89. D0
        sar     eax, 5                                  ; 377C _ C1. F8, 05
        mov     byte [ebp-26H], al                      ; 377F _ 88. 45, DA
        mov     dword [ebp-1CH], 0                      ; 3782 _ C7. 45, E4, 00000000
        jmp     ?_172                                   ; 3789 _ E9, 000000CD

?_168:  mov     eax, dword [ebp-10H]                    ; 378E _ 8B. 45, F0
        mov     edx, dword [eax+10H]                    ; 3791 _ 8B. 50, 10
        mov     eax, dword [ebp-1CH]                    ; 3794 _ 8B. 45, E4
        add     eax, edx                                ; 3797 _ 01. D0
        mov     dword [ebp-8H], eax                     ; 3799 _ 89. 45, F8
        mov     dword [ebp-20H], 0                      ; 379C _ C7. 45, E0, 00000000
        jmp     ?_171                                   ; 37A3 _ E9, 000000A0

?_169:  mov     eax, dword [ebp-10H]                    ; 37A8 _ 8B. 45, F0
        mov     edx, dword [eax+0CH]                    ; 37AB _ 8B. 50, 0C
        mov     eax, dword [ebp-20H]                    ; 37AE _ 8B. 45, E0
        add     eax, edx                                ; 37B1 _ 01. D0
        mov     dword [ebp-4H], eax                     ; 37B3 _ 89. 45, FC
        mov     eax, dword [ebp+0CH]                    ; 37B6 _ 8B. 45, 0C
        cmp     eax, dword [ebp-4H]                     ; 37B9 _ 3B. 45, FC
        jg      ?_170                                   ; 37BC _ 0F 8F, 00000082
        mov     eax, dword [ebp-4H]                     ; 37C2 _ 8B. 45, FC
        cmp     eax, dword [ebp+14H]                    ; 37C5 _ 3B. 45, 14
        jge     ?_170                                   ; 37C8 _ 7D, 7A
        mov     eax, dword [ebp+10H]                    ; 37CA _ 8B. 45, 10
        cmp     eax, dword [ebp-8H]                     ; 37CD _ 3B. 45, F8
        jg      ?_170                                   ; 37D0 _ 7F, 72
        mov     eax, dword [ebp-8H]                     ; 37D2 _ 8B. 45, F8
        cmp     eax, dword [ebp+18H]                    ; 37D5 _ 3B. 45, 18
        jge     ?_170                                   ; 37D8 _ 7D, 6A
        mov     eax, dword [ebp-10H]                    ; 37DA _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 37DD _ 8B. 40, 04
        imul    eax, dword [ebp-1CH]                    ; 37E0 _ 0F AF. 45, E4
        mov     edx, eax                                ; 37E4 _ 89. C2
        mov     eax, dword [ebp-20H]                    ; 37E6 _ 8B. 45, E0
        add     eax, edx                                ; 37E9 _ 01. D0
        mov     edx, eax                                ; 37EB _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 37ED _ 8B. 45, F4
        add     eax, edx                                ; 37F0 _ 01. D0
        movzx   eax, byte [eax]                         ; 37F2 _ 0F B6. 00
        mov     byte [ebp-25H], al                      ; 37F5 _ 88. 45, DB
        movzx   edx, byte [ebp-25H]                     ; 37F8 _ 0F B6. 55, DB
        mov     eax, dword [ebp-10H]                    ; 37FC _ 8B. 45, F0
        mov     eax, dword [eax+14H]                    ; 37FF _ 8B. 40, 14
        cmp     edx, eax                                ; 3802 _ 39. C2
        jz      ?_170                                   ; 3804 _ 74, 3E
        mov     eax, dword [ebp+8H]                     ; 3806 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 3809 _ 8B. 40, 04
        imul    eax, dword [ebp-8H]                     ; 380C _ 0F AF. 45, F8
        mov     edx, eax                                ; 3810 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 3812 _ 8B. 45, FC
        add     eax, edx                                ; 3815 _ 01. D0
        mov     edx, eax                                ; 3817 _ 89. C2
        mov     eax, dword [ebp-14H]                    ; 3819 _ 8B. 45, EC
        add     eax, edx                                ; 381C _ 01. D0
        movzx   eax, byte [eax]                         ; 381E _ 0F B6. 00
        cmp     al, byte [ebp-26H]                      ; 3821 _ 3A. 45, DA
        jnz     ?_170                                   ; 3824 _ 75, 1E
        mov     eax, dword [ebp+8H]                     ; 3826 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 3829 _ 8B. 40, 04
        imul    eax, dword [ebp-8H]                     ; 382C _ 0F AF. 45, F8
        mov     edx, eax                                ; 3830 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 3832 _ 8B. 45, FC
        add     eax, edx                                ; 3835 _ 01. D0
        mov     edx, eax                                ; 3837 _ 89. C2
        mov     eax, dword [ebp-18H]                    ; 3839 _ 8B. 45, E8
        add     edx, eax                                ; 383C _ 01. C2
        movzx   eax, byte [ebp-25H]                     ; 383E _ 0F B6. 45, DB
        mov     byte [edx], al                          ; 3842 _ 88. 02
?_170:  add     dword [ebp-20H], 1                      ; 3844 _ 83. 45, E0, 01
?_171:  mov     eax, dword [ebp-10H]                    ; 3848 _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 384B _ 8B. 40, 04
        cmp     eax, dword [ebp-20H]                    ; 384E _ 3B. 45, E0
        jg      ?_169                                   ; 3851 _ 0F 8F, FFFFFF51
        add     dword [ebp-1CH], 1                      ; 3857 _ 83. 45, E4, 01
?_172:  mov     eax, dword [ebp-10H]                    ; 385B _ 8B. 45, F0
        mov     eax, dword [eax+8H]                     ; 385E _ 8B. 40, 08
        cmp     eax, dword [ebp-1CH]                    ; 3861 _ 3B. 45, E4
        jg      ?_168                                   ; 3864 _ 0F 8F, FFFFFF24
        add     dword [ebp-24H], 1                      ; 386A _ 83. 45, DC, 01
?_173:  mov     eax, dword [ebp+8H]                     ; 386E _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 3871 _ 8B. 40, 0C
        cmp     eax, dword [ebp-24H]                    ; 3874 _ 3B. 45, DC
        jge     ?_167                                   ; 3877 _ 0F 8D, FFFFFED8
        leave                                           ; 387D _ C9
        ret                                             ; 387E _ C3
; sheet_refresh_local End of function

sheet_refresh_map:; Function begin
        push    ebp                                     ; 387F _ 55
        mov     ebp, esp                                ; 3880 _ 89. E5
        sub     esp, 64                                 ; 3882 _ 83. EC, 40
        mov     eax, dword [ebp+8H]                     ; 3885 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 3888 _ 8B. 00
        mov     dword [ebp-18H], eax                    ; 388A _ 89. 45, E8
        mov     eax, dword [ebp+8H]                     ; 388D _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 3890 _ 8B. 40, 10
        mov     dword [ebp-14H], eax                    ; 3893 _ 89. 45, EC
        cmp     dword [ebp+0CH], 0                      ; 3896 _ 83. 7D, 0C, 00
        jns     ?_174                                   ; 389A _ 79, 07
        mov     dword [ebp+0CH], 0                      ; 389C _ C7. 45, 0C, 00000000
?_174:  cmp     dword [ebp+10H], 0                      ; 38A3 _ 83. 7D, 10, 00
        jns     ?_175                                   ; 38A7 _ 79, 07
        mov     dword [ebp+10H], 0                      ; 38A9 _ C7. 45, 10, 00000000
?_175:  mov     eax, dword [ebp+8H]                     ; 38B0 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 38B3 _ 8B. 40, 04
        cmp     eax, dword [ebp+14H]                    ; 38B6 _ 3B. 45, 14
        jge     ?_176                                   ; 38B9 _ 7D, 09
        mov     eax, dword [ebp+8H]                     ; 38BB _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 38BE _ 8B. 40, 04
        mov     dword [ebp+14H], eax                    ; 38C1 _ 89. 45, 14
?_176:  mov     eax, dword [ebp+8H]                     ; 38C4 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 38C7 _ 8B. 40, 08
        cmp     eax, dword [ebp+18H]                    ; 38CA _ 3B. 45, 18
        jge     ?_177                                   ; 38CD _ 7D, 09
        mov     eax, dword [ebp+8H]                     ; 38CF _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 38D2 _ 8B. 40, 08
        mov     dword [ebp+18H], eax                    ; 38D5 _ 89. 45, 18
?_177:  mov     eax, dword [ebp+1CH]                    ; 38D8 _ 8B. 45, 1C
        mov     dword [ebp-34H], eax                    ; 38DB _ 89. 45, CC
        jmp     ?_188                                   ; 38DE _ E9, 00000141

?_178:  mov     eax, dword [ebp+8H]                     ; 38E3 _ 8B. 45, 08
        mov     edx, dword [ebp-34H]                    ; 38E6 _ 8B. 55, CC
        add     edx, 4                                  ; 38E9 _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 38EC _ 8B. 44 90, 04
        mov     dword [ebp-10H], eax                    ; 38F0 _ 89. 45, F0
        mov     edx, dword [ebp-10H]                    ; 38F3 _ 8B. 55, F0
        mov     eax, dword [ebp+8H]                     ; 38F6 _ 8B. 45, 08
        add     eax, 1044                               ; 38F9 _ 05, 00000414
        sub     edx, eax                                ; 38FE _ 29. C2
        mov     eax, edx                                ; 3900 _ 89. D0
        sar     eax, 5                                  ; 3902 _ C1. F8, 05
        mov     byte [ebp-35H], al                      ; 3905 _ 88. 45, CB
        mov     eax, dword [ebp-10H]                    ; 3908 _ 8B. 45, F0
        mov     eax, dword [eax]                        ; 390B _ 8B. 00
        mov     dword [ebp-0CH], eax                    ; 390D _ 89. 45, F4
        mov     eax, dword [ebp-10H]                    ; 3910 _ 8B. 45, F0
        mov     eax, dword [eax+0CH]                    ; 3913 _ 8B. 40, 0C
        mov     edx, dword [ebp+0CH]                    ; 3916 _ 8B. 55, 0C
        sub     edx, eax                                ; 3919 _ 29. C2
        mov     eax, edx                                ; 391B _ 89. D0
        mov     dword [ebp-30H], eax                    ; 391D _ 89. 45, D0
        mov     eax, dword [ebp-10H]                    ; 3920 _ 8B. 45, F0
        mov     eax, dword [eax+10H]                    ; 3923 _ 8B. 40, 10
        mov     edx, dword [ebp+10H]                    ; 3926 _ 8B. 55, 10
        sub     edx, eax                                ; 3929 _ 29. C2
        mov     eax, edx                                ; 392B _ 89. D0
        mov     dword [ebp-2CH], eax                    ; 392D _ 89. 45, D4
        mov     eax, dword [ebp-10H]                    ; 3930 _ 8B. 45, F0
        mov     eax, dword [eax+0CH]                    ; 3933 _ 8B. 40, 0C
        mov     edx, dword [ebp+14H]                    ; 3936 _ 8B. 55, 14
        sub     edx, eax                                ; 3939 _ 29. C2
        mov     eax, edx                                ; 393B _ 89. D0
        mov     dword [ebp-28H], eax                    ; 393D _ 89. 45, D8
        mov     eax, dword [ebp-10H]                    ; 3940 _ 8B. 45, F0
        mov     eax, dword [eax+10H]                    ; 3943 _ 8B. 40, 10
        mov     edx, dword [ebp+18H]                    ; 3946 _ 8B. 55, 18
        sub     edx, eax                                ; 3949 _ 29. C2
        mov     eax, edx                                ; 394B _ 89. D0
        mov     dword [ebp-24H], eax                    ; 394D _ 89. 45, DC
        cmp     dword [ebp-30H], 0                      ; 3950 _ 83. 7D, D0, 00
        jns     ?_179                                   ; 3954 _ 79, 07
        mov     dword [ebp-30H], 0                      ; 3956 _ C7. 45, D0, 00000000
?_179:  cmp     dword [ebp-2CH], 0                      ; 395D _ 83. 7D, D4, 00
        jns     ?_180                                   ; 3961 _ 79, 07
        mov     dword [ebp-2CH], 0                      ; 3963 _ C7. 45, D4, 00000000
?_180:  mov     eax, dword [ebp-10H]                    ; 396A _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 396D _ 8B. 40, 04
        cmp     eax, dword [ebp-28H]                    ; 3970 _ 3B. 45, D8
        jge     ?_181                                   ; 3973 _ 7D, 09
        mov     eax, dword [ebp-10H]                    ; 3975 _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 3978 _ 8B. 40, 04
        mov     dword [ebp-28H], eax                    ; 397B _ 89. 45, D8
?_181:  mov     eax, dword [ebp-10H]                    ; 397E _ 8B. 45, F0
        mov     eax, dword [eax+8H]                     ; 3981 _ 8B. 40, 08
        cmp     eax, dword [ebp-24H]                    ; 3984 _ 3B. 45, DC
        jge     ?_182                                   ; 3987 _ 7D, 09
        mov     eax, dword [ebp-10H]                    ; 3989 _ 8B. 45, F0
        mov     eax, dword [eax+8H]                     ; 398C _ 8B. 40, 08
        mov     dword [ebp-24H], eax                    ; 398F _ 89. 45, DC
?_182:  mov     eax, dword [ebp-2CH]                    ; 3992 _ 8B. 45, D4
        mov     dword [ebp-1CH], eax                    ; 3995 _ 89. 45, E4
        jmp     ?_187                                   ; 3998 _ EB, 7A

?_183:  mov     eax, dword [ebp-10H]                    ; 399A _ 8B. 45, F0
        mov     edx, dword [eax+10H]                    ; 399D _ 8B. 50, 10
        mov     eax, dword [ebp-1CH]                    ; 39A0 _ 8B. 45, E4
        add     eax, edx                                ; 39A3 _ 01. D0
        mov     dword [ebp-8H], eax                     ; 39A5 _ 89. 45, F8
        mov     eax, dword [ebp-30H]                    ; 39A8 _ 8B. 45, D0
        mov     dword [ebp-20H], eax                    ; 39AB _ 89. 45, E0
        jmp     ?_186                                   ; 39AE _ EB, 58

?_184:  mov     eax, dword [ebp-10H]                    ; 39B0 _ 8B. 45, F0
        mov     edx, dword [eax+0CH]                    ; 39B3 _ 8B. 50, 0C
        mov     eax, dword [ebp-20H]                    ; 39B6 _ 8B. 45, E0
        add     eax, edx                                ; 39B9 _ 01. D0
        mov     dword [ebp-4H], eax                     ; 39BB _ 89. 45, FC
        mov     eax, dword [ebp-10H]                    ; 39BE _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 39C1 _ 8B. 40, 04
        imul    eax, dword [ebp-1CH]                    ; 39C4 _ 0F AF. 45, E4
        mov     edx, eax                                ; 39C8 _ 89. C2
        mov     eax, dword [ebp-20H]                    ; 39CA _ 8B. 45, E0
        add     eax, edx                                ; 39CD _ 01. D0
        mov     edx, eax                                ; 39CF _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 39D1 _ 8B. 45, F4
        add     eax, edx                                ; 39D4 _ 01. D0
        movzx   eax, byte [eax]                         ; 39D6 _ 0F B6. 00
        movzx   edx, al                                 ; 39D9 _ 0F B6. D0
        mov     eax, dword [ebp-10H]                    ; 39DC _ 8B. 45, F0
        mov     eax, dword [eax+14H]                    ; 39DF _ 8B. 40, 14
        cmp     edx, eax                                ; 39E2 _ 39. C2
        jz      ?_185                                   ; 39E4 _ 74, 1E
        mov     eax, dword [ebp+8H]                     ; 39E6 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 39E9 _ 8B. 40, 04
        imul    eax, dword [ebp-8H]                     ; 39EC _ 0F AF. 45, F8
        mov     edx, eax                                ; 39F0 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 39F2 _ 8B. 45, FC
        add     eax, edx                                ; 39F5 _ 01. D0
        mov     edx, eax                                ; 39F7 _ 89. C2
        mov     eax, dword [ebp-14H]                    ; 39F9 _ 8B. 45, EC
        add     edx, eax                                ; 39FC _ 01. C2
        movzx   eax, byte [ebp-35H]                     ; 39FE _ 0F B6. 45, CB
        mov     byte [edx], al                          ; 3A02 _ 88. 02
?_185:  add     dword [ebp-20H], 1                      ; 3A04 _ 83. 45, E0, 01
?_186:  mov     eax, dword [ebp-20H]                    ; 3A08 _ 8B. 45, E0
        cmp     eax, dword [ebp-28H]                    ; 3A0B _ 3B. 45, D8
        jl      ?_184                                   ; 3A0E _ 7C, A0
        add     dword [ebp-1CH], 1                      ; 3A10 _ 83. 45, E4, 01
?_187:  mov     eax, dword [ebp-1CH]                    ; 3A14 _ 8B. 45, E4
        cmp     eax, dword [ebp-24H]                    ; 3A17 _ 3B. 45, DC
        jl      ?_183                                   ; 3A1A _ 0F 8C, FFFFFF7A
        add     dword [ebp-34H], 1                      ; 3A20 _ 83. 45, CC, 01
?_188:  mov     eax, dword [ebp+8H]                     ; 3A24 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 3A27 _ 8B. 40, 0C
        cmp     eax, dword [ebp-34H]                    ; 3A2A _ 3B. 45, CC
        jge     ?_178                                   ; 3A2D _ 0F 8D, FFFFFEB0
        leave                                           ; 3A33 _ C9
        ret                                             ; 3A34 _ C3
; sheet_refresh_map End of function

init_time_port:; Function begin
        push    ebp                                     ; 3A35 _ 55
        mov     ebp, esp                                ; 3A36 _ 89. E5
        sub     esp, 40                                 ; 3A38 _ 83. EC, 28
        mov     dword [esp+4H], 52                      ; 3A3B _ C7. 44 24, 04, 00000034
        mov     dword [esp], 67                         ; 3A43 _ C7. 04 24, 00000043
        call    io_out8                                 ; 3A4A _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 156                     ; 3A4F _ C7. 44 24, 04, 0000009C
        mov     dword [esp], 64                         ; 3A57 _ C7. 04 24, 00000040
        call    io_out8                                 ; 3A5E _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 46                      ; 3A63 _ C7. 44 24, 04, 0000002E
        mov     dword [esp], 64                         ; 3A6B _ C7. 04 24, 00000040
        call    io_out8                                 ; 3A72 _ E8, FFFFFFFC(rel)
        mov     dword [timer_control], 0                ; 3A77 _ C7. 05, 00000300(d), 00000000
        mov     dword [ebp-0CH], 0                      ; 3A81 _ C7. 45, F4, 00000000
        jmp     ?_190                                   ; 3A88 _ EB, 28

?_189:  mov     eax, dword [ebp-0CH]                    ; 3A8A _ 8B. 45, F4
        shl     eax, 4                                  ; 3A8D _ C1. E0, 04
        add     eax, timer_control                      ; 3A90 _ 05, 00000300(d)
        mov     dword [eax+8H], 0                       ; 3A95 _ C7. 40, 08, 00000000
        mov     eax, dword [ebp-0CH]                    ; 3A9C _ 8B. 45, F4
        shl     eax, 4                                  ; 3A9F _ C1. E0, 04
        add     eax, timer_control                      ; 3AA2 _ 05, 00000300(d)
        mov     dword [eax+0CH], 0                      ; 3AA7 _ C7. 40, 0C, 00000000
        add     dword [ebp-0CH], 1                      ; 3AAE _ 83. 45, F4, 01
?_190:  cmp     dword [ebp-0CH], 499                    ; 3AB2 _ 81. 7D, F4, 000001F3
        jle     ?_189                                   ; 3AB9 _ 7E, CF
        leave                                           ; 3ABB _ C9
        ret                                             ; 3ABC _ C3
; init_time_port End of function

get_timer_control:; Function begin
        push    ebp                                     ; 3ABD _ 55
        mov     ebp, esp                                ; 3ABE _ 89. E5
        mov     eax, timer_control                      ; 3AC0 _ B8, 00000300(d)
        pop     ebp                                     ; 3AC5 _ 5D
        ret                                             ; 3AC6 _ C3
; get_timer_control End of function

timer_alloc:; Function begin
        push    ebp                                     ; 3AC7 _ 55
        mov     ebp, esp                                ; 3AC8 _ 89. E5
        sub     esp, 16                                 ; 3ACA _ 83. EC, 10
        mov     dword [ebp-4H], 0                       ; 3ACD _ C7. 45, FC, 00000000
        jmp     ?_193                                   ; 3AD4 _ EB, 26

?_191:  mov     eax, dword [ebp-4H]                     ; 3AD6 _ 8B. 45, FC
        shl     eax, 4                                  ; 3AD9 _ C1. E0, 04
        add     eax, timer_control                      ; 3ADC _ 05, 00000300(d)
        mov     eax, dword [eax+8H]                     ; 3AE1 _ 8B. 40, 08
        test    eax, eax                                ; 3AE4 _ 85. C0
        jnz     ?_192                                   ; 3AE6 _ 75, 10
        mov     eax, dword [ebp-4H]                     ; 3AE8 _ 8B. 45, FC
        shl     eax, 4                                  ; 3AEB _ C1. E0, 04
        add     eax, timer_control                      ; 3AEE _ 05, 00000300(d)
        add     eax, 4                                  ; 3AF3 _ 83. C0, 04
        jmp     ?_194                                   ; 3AF6 _ EB, 0D

?_192:  add     dword [ebp-4H], 1                       ; 3AF8 _ 83. 45, FC, 01
?_193:  cmp     dword [ebp-4H], 499                     ; 3AFC _ 81. 7D, FC, 000001F3
        jle     ?_191                                   ; 3B03 _ 7E, D1
?_194:  leave                                           ; 3B05 _ C9
        ret                                             ; 3B06 _ C3
; timer_alloc End of function

timer_free:; Function begin
        push    ebp                                     ; 3B07 _ 55
        mov     ebp, esp                                ; 3B08 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 3B0A _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 3B0D _ C7. 40, 04, 00000000
        pop     ebp                                     ; 3B14 _ 5D
        ret                                             ; 3B15 _ C3
; timer_free End of function

timer_init:; Function begin
        push    ebp                                     ; 3B16 _ 55
        mov     ebp, esp                                ; 3B17 _ 89. E5
        sub     esp, 4                                  ; 3B19 _ 83. EC, 04
        mov     eax, dword [ebp+10H]                    ; 3B1C _ 8B. 45, 10
        mov     byte [ebp-4H], al                       ; 3B1F _ 88. 45, FC
        mov     eax, dword [ebp+8H]                     ; 3B22 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 3B25 _ 8B. 55, 0C
        mov     dword [eax+8H], edx                     ; 3B28 _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 3B2B _ 8B. 45, 08
        movzx   edx, byte [ebp-4H]                      ; 3B2E _ 0F B6. 55, FC
        mov     byte [eax+0CH], dl                      ; 3B32 _ 88. 50, 0C
        leave                                           ; 3B35 _ C9
        ret                                             ; 3B36 _ C3
; timer_init End of function

timer_settime:; Function begin
        push    ebp                                     ; 3B37 _ 55
        mov     ebp, esp                                ; 3B38 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 3B3A _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 3B3D _ 8B. 55, 0C
        mov     dword [eax], edx                        ; 3B40 _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 3B42 _ 8B. 45, 08
        mov     dword [eax+4H], 2                       ; 3B45 _ C7. 40, 04, 00000002
        pop     ebp                                     ; 3B4C _ 5D
        ret                                             ; 3B4D _ C3
; timer_settime End of function

intHandlerTimer:; Function begin
        push    ebp                                     ; 3B4E _ 55
        mov     ebp, esp                                ; 3B4F _ 89. E5
        sub     esp, 40                                 ; 3B51 _ 83. EC, 28
        mov     dword [esp+4H], 32                      ; 3B54 _ C7. 44 24, 04, 00000020
        mov     dword [esp], 32                         ; 3B5C _ C7. 04 24, 00000020
        call    io_out8                                 ; 3B63 _ E8, FFFFFFFC(rel)
        mov     eax, dword [timer_control]              ; 3B68 _ A1, 00000300(d)
        add     eax, 1                                  ; 3B6D _ 83. C0, 01
        mov     dword [timer_control], eax              ; 3B70 _ A3, 00000300(d)
        mov     byte [ebp-0DH], 0                       ; 3B75 _ C6. 45, F3, 00
        mov     dword [ebp-0CH], 0                      ; 3B79 _ C7. 45, F4, 00000000
        jmp     ?_198                                   ; 3B80 _ E9, 000000B0

?_195:  mov     eax, dword [ebp-0CH]                    ; 3B85 _ 8B. 45, F4
        shl     eax, 4                                  ; 3B88 _ C1. E0, 04
        add     eax, timer_control                      ; 3B8B _ 05, 00000300(d)
        mov     eax, dword [eax+8H]                     ; 3B90 _ 8B. 40, 08
        cmp     eax, 2                                  ; 3B93 _ 83. F8, 02
        jne     ?_196                                   ; 3B96 _ 0F 85, 0000008A
        mov     eax, dword [ebp-0CH]                    ; 3B9C _ 8B. 45, F4
        shl     eax, 4                                  ; 3B9F _ C1. E0, 04
        add     eax, timer_control                      ; 3BA2 _ 05, 00000300(d)
        mov     eax, dword [eax+4H]                     ; 3BA7 _ 8B. 40, 04
        lea     edx, [eax-1H]                           ; 3BAA _ 8D. 50, FF
        mov     eax, dword [ebp-0CH]                    ; 3BAD _ 8B. 45, F4
        shl     eax, 4                                  ; 3BB0 _ C1. E0, 04
        add     eax, timer_control                      ; 3BB3 _ 05, 00000300(d)
        mov     dword [eax+4H], edx                     ; 3BB8 _ 89. 50, 04
        mov     eax, dword [ebp-0CH]                    ; 3BBB _ 8B. 45, F4
        shl     eax, 4                                  ; 3BBE _ C1. E0, 04
        add     eax, timer_control                      ; 3BC1 _ 05, 00000300(d)
        mov     eax, dword [eax+4H]                     ; 3BC6 _ 8B. 40, 04
        test    eax, eax                                ; 3BC9 _ 85. C0
        jnz     ?_196                                   ; 3BCB _ 75, 59
        mov     eax, dword [ebp-0CH]                    ; 3BCD _ 8B. 45, F4
        shl     eax, 4                                  ; 3BD0 _ C1. E0, 04
        add     eax, timer_control                      ; 3BD3 _ 05, 00000300(d)
        mov     dword [eax+8H], 1                       ; 3BD8 _ C7. 40, 08, 00000001
        mov     eax, dword [ebp-0CH]                    ; 3BDF _ 8B. 45, F4
        shl     eax, 4                                  ; 3BE2 _ C1. E0, 04
        add     eax, timer_control                      ; 3BE5 _ 05, 00000300(d)
        movzx   eax, byte [eax+10H]                     ; 3BEA _ 0F B6. 40, 10
        movzx   edx, al                                 ; 3BEE _ 0F B6. D0
        mov     eax, dword [ebp-0CH]                    ; 3BF1 _ 8B. 45, F4
        shl     eax, 4                                  ; 3BF4 _ C1. E0, 04
        add     eax, timer_control                      ; 3BF7 _ 05, 00000300(d)
        mov     eax, dword [eax+0CH]                    ; 3BFC _ 8B. 40, 0C
        mov     dword [esp+4H], edx                     ; 3BFF _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 3C03 _ 89. 04 24
        call    fifo8_put                               ; 3C06 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 3C0B _ 8B. 45, F4
        shl     eax, 4                                  ; 3C0E _ C1. E0, 04
        add     eax, timer_control                      ; 3C11 _ 05, 00000300(d)
        lea     edx, [eax+4H]                           ; 3C16 _ 8D. 50, 04
        mov     eax, dword [task_timer]                 ; 3C19 _ A1, 00000000(d)
        cmp     edx, eax                                ; 3C1E _ 39. C2
        jnz     ?_196                                   ; 3C20 _ 75, 04
        mov     byte [ebp-0DH], 1                       ; 3C22 _ C6. 45, F3, 01
?_196:  cmp     byte [ebp-0DH], 0                       ; 3C26 _ 80. 7D, F3, 00
        jz      ?_197                                   ; 3C2A _ 74, 05
        call    task_switch                             ; 3C2C _ E8, FFFFFFFC(rel)
?_197:  add     dword [ebp-0CH], 1                      ; 3C31 _ 83. 45, F4, 01
?_198:  cmp     dword [ebp-0CH], 499                    ; 3C35 _ 81. 7D, F4, 000001F3
        jle     ?_195                                   ; 3C3C _ 0F 8E, FFFFFF43
        leave                                           ; 3C42 _ C9
        ret                                             ; 3C43 _ C3
; intHandlerTimer End of function

segment_descriptor:; Function begin
        push    ebp                                     ; 3C44 _ 55
        mov     ebp, esp                                ; 3C45 _ 89. E5
        cmp     dword [ebp+0CH], 1048575                ; 3C47 _ 81. 7D, 0C, 000FFFFF
        jbe     ?_199                                   ; 3C4E _ 76, 10
        or      dword [ebp+14H], 8000H                  ; 3C50 _ 81. 4D, 14, 00008000
        mov     eax, dword [ebp+0CH]                    ; 3C57 _ 8B. 45, 0C
        shr     eax, 12                                 ; 3C5A _ C1. E8, 0C
        mov     dword [ebp+0CH], eax                    ; 3C5D _ 89. 45, 0C
?_199:  mov     eax, dword [ebp+0CH]                    ; 3C60 _ 8B. 45, 0C
        mov     edx, eax                                ; 3C63 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 3C65 _ 8B. 45, 08
        mov     word [eax], dx                          ; 3C68 _ 66: 89. 10
        mov     eax, dword [ebp+10H]                    ; 3C6B _ 8B. 45, 10
        mov     edx, eax                                ; 3C6E _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 3C70 _ 8B. 45, 08
        mov     word [eax+2H], dx                       ; 3C73 _ 66: 89. 50, 02
        mov     eax, dword [ebp+10H]                    ; 3C77 _ 8B. 45, 10
        sar     eax, 16                                 ; 3C7A _ C1. F8, 10
        mov     edx, eax                                ; 3C7D _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 3C7F _ 8B. 45, 08
        mov     byte [eax+4H], dl                       ; 3C82 _ 88. 50, 04
        mov     eax, dword [ebp+14H]                    ; 3C85 _ 8B. 45, 14
        mov     edx, eax                                ; 3C88 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 3C8A _ 8B. 45, 08
        mov     byte [eax+5H], dl                       ; 3C8D _ 88. 50, 05
        mov     eax, dword [ebp+0CH]                    ; 3C90 _ 8B. 45, 0C
        shr     eax, 16                                 ; 3C93 _ C1. E8, 10
        and     eax, 0FH                                ; 3C96 _ 83. E0, 0F
        mov     edx, eax                                ; 3C99 _ 89. C2
        mov     eax, dword [ebp+14H]                    ; 3C9B _ 8B. 45, 14
        sar     eax, 8                                  ; 3C9E _ C1. F8, 08
        and     eax, 0FFFFFFF0H                         ; 3CA1 _ 83. E0, F0
        or      eax, edx                                ; 3CA4 _ 09. D0
        mov     edx, eax                                ; 3CA6 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 3CA8 _ 8B. 45, 08
        mov     byte [eax+6H], dl                       ; 3CAB _ 88. 50, 06
        mov     eax, dword [ebp+10H]                    ; 3CAE _ 8B. 45, 10
        shr     eax, 24                                 ; 3CB1 _ C1. E8, 18
        mov     edx, eax                                ; 3CB4 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 3CB6 _ 8B. 45, 08
        mov     byte [eax+7H], dl                       ; 3CB9 _ 88. 50, 07
        pop     ebp                                     ; 3CBC _ 5D
        ret                                             ; 3CBD _ C3
; segment_descriptor End of function

init_task_level:; Function begin
        push    ebp                                     ; 3CBE _ 55
        mov     ebp, esp                                ; 3CBF _ 89. E5
        sub     esp, 16                                 ; 3CC1 _ 83. EC, 10
        mov     ecx, dword [task_control]               ; 3CC4 _ 8B. 0D, 00002248(d)
        mov     edx, dword [ebp+8H]                     ; 3CCA _ 8B. 55, 08
        mov     eax, edx                                ; 3CCD _ 89. D0
        shl     eax, 2                                  ; 3CCF _ C1. E0, 02
        add     eax, edx                                ; 3CD2 _ 01. D0
        shl     eax, 2                                  ; 3CD4 _ C1. E0, 02
        add     eax, ecx                                ; 3CD7 _ 01. C8
        add     eax, 8                                  ; 3CD9 _ 83. C0, 08
        mov     dword [eax], 0                          ; 3CDC _ C7. 00, 00000000
        mov     ecx, dword [task_control]               ; 3CE2 _ 8B. 0D, 00002248(d)
        mov     edx, dword [ebp+8H]                     ; 3CE8 _ 8B. 55, 08
        mov     eax, edx                                ; 3CEB _ 89. D0
        shl     eax, 2                                  ; 3CED _ C1. E0, 02
        add     eax, edx                                ; 3CF0 _ 01. D0
        shl     eax, 2                                  ; 3CF2 _ C1. E0, 02
        add     eax, ecx                                ; 3CF5 _ 01. C8
        add     eax, 12                                 ; 3CF7 _ 83. C0, 0C
        mov     dword [eax], 0                          ; 3CFA _ C7. 00, 00000000
        mov     dword [ebp-4H], 0                       ; 3D00 _ C7. 45, FC, 00000000
        jmp     ?_201                                   ; 3D07 _ EB, 21

?_200:  mov     ecx, dword [task_control]               ; 3D09 _ 8B. 0D, 00002248(d)
        mov     edx, dword [ebp-4H]                     ; 3D0F _ 8B. 55, FC
        mov     eax, edx                                ; 3D12 _ 89. D0
        add     eax, eax                                ; 3D14 _ 01. C0
        add     eax, edx                                ; 3D16 _ 01. D0
        shl     eax, 3                                  ; 3D18 _ C1. E0, 03
        add     eax, ecx                                ; 3D1B _ 01. C8
        add     eax, 16                                 ; 3D1D _ 83. C0, 10
        mov     dword [eax], 0                          ; 3D20 _ C7. 00, 00000000
        add     dword [ebp-4H], 1                       ; 3D26 _ 83. 45, FC, 01
?_201:  cmp     dword [ebp-4H], 2                       ; 3D2A _ 83. 7D, FC, 02
        jle     ?_200                                   ; 3D2E _ 7E, D9
        leave                                           ; 3D30 _ C9
        ret                                             ; 3D31 _ C3
; init_task_level End of function

task_init:; Function begin
        push    ebp                                     ; 3D32 _ 55
        mov     ebp, esp                                ; 3D33 _ 89. E5
        sub     esp, 40                                 ; 3D35 _ 83. EC, 28
        call    get_addr_gdt                            ; 3D38 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 3D3D _ 89. 45, F0
        mov     dword [esp+4H], 668                     ; 3D40 _ C7. 44 24, 04, 0000029C
        mov     eax, dword [ebp+8H]                     ; 3D48 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3D4B _ 89. 04 24
        call    memman_alloc_4k                         ; 3D4E _ E8, FFFFFFFC(rel)
        mov     dword [task_control], eax               ; 3D53 _ A3, 00002248(d)
        mov     dword [ebp-14H], 0                      ; 3D58 _ C7. 45, EC, 00000000
        jmp     ?_203                                   ; 3D5F _ E9, 00000085

?_202:  mov     edx, dword [task_control]               ; 3D64 _ 8B. 15, 00002248(d)
        mov     eax, dword [ebp-14H]                    ; 3D6A _ 8B. 45, EC
        imul    eax, eax, 148                           ; 3D6D _ 69. C0, 00000094
        add     eax, edx                                ; 3D73 _ 01. D0
        add     eax, 72                                 ; 3D75 _ 83. C0, 48
        mov     dword [eax], 0                          ; 3D78 _ C7. 00, 00000000
        mov     ecx, dword [task_control]               ; 3D7E _ 8B. 0D, 00002248(d)
        mov     eax, dword [ebp-14H]                    ; 3D84 _ 8B. 45, EC
        add     eax, 8                                  ; 3D87 _ 83. C0, 08
        lea     edx, [eax*8]                            ; 3D8A _ 8D. 14 C5, 00000000
        mov     eax, dword [ebp-14H]                    ; 3D91 _ 8B. 45, EC
        imul    eax, eax, 148                           ; 3D94 _ 69. C0, 00000094
        add     eax, ecx                                ; 3D9A _ 01. C8
        add     eax, 68                                 ; 3D9C _ 83. C0, 44
        mov     dword [eax], edx                        ; 3D9F _ 89. 10
        mov     eax, dword [task_control]               ; 3DA1 _ A1, 00002248(d)
        mov     edx, dword [ebp-14H]                    ; 3DA6 _ 8B. 55, EC
        imul    edx, edx, 148                           ; 3DA9 _ 69. D2, 00000094
        add     edx, 96                                 ; 3DAF _ 83. C2, 60
        add     eax, edx                                ; 3DB2 _ 01. D0
        add     eax, 16                                 ; 3DB4 _ 83. C0, 10
        mov     edx, dword [ebp-14H]                    ; 3DB7 _ 8B. 55, EC
        add     edx, 8                                  ; 3DBA _ 83. C2, 08
        lea     ecx, [edx*8]                            ; 3DBD _ 8D. 0C D5, 00000000
        mov     edx, dword [ebp-10H]                    ; 3DC4 _ 8B. 55, F0
        add     edx, ecx                                ; 3DC7 _ 01. CA
        mov     dword [esp+0CH], 137                    ; 3DC9 _ C7. 44 24, 0C, 00000089
        mov     dword [esp+8H], eax                     ; 3DD1 _ 89. 44 24, 08
        mov     dword [esp+4H], 103                     ; 3DD5 _ C7. 44 24, 04, 00000067
        mov     dword [esp], edx                        ; 3DDD _ 89. 14 24
        call    segment_descriptor                      ; 3DE0 _ E8, FFFFFFFC(rel)
        add     dword [ebp-14H], 1                      ; 3DE5 _ 83. 45, EC, 01
?_203:  cmp     dword [ebp-14H], 4                      ; 3DE9 _ 83. 7D, EC, 04
        jle     ?_202                                   ; 3DED _ 0F 8E, FFFFFF71
        mov     dword [ebp-14H], 0                      ; 3DF3 _ C7. 45, EC, 00000000
        jmp     ?_205                                   ; 3DFA _ EB, 0F

?_204:  mov     eax, dword [ebp-14H]                    ; 3DFC _ 8B. 45, EC
        mov     dword [esp], eax                        ; 3DFF _ 89. 04 24
        call    init_task_level                         ; 3E02 _ E8, FFFFFFFC(rel)
        add     dword [ebp-14H], 1                      ; 3E07 _ 83. 45, EC, 01
?_205:  cmp     dword [ebp-14H], 2                      ; 3E0B _ 83. 7D, EC, 02
        jle     ?_204                                   ; 3E0F _ 7E, EB
        call    task_alloc                              ; 3E11 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 3E16 _ 89. 45, F4
        mov     eax, dword [ebp-0CH]                    ; 3E19 _ 8B. 45, F4
        mov     dword [eax+4H], 2                       ; 3E1C _ C7. 40, 04, 00000002
        mov     eax, dword [ebp-0CH]                    ; 3E23 _ 8B. 45, F4
        mov     dword [eax+8H], 100                     ; 3E26 _ C7. 40, 08, 00000064
        mov     eax, dword [ebp-0CH]                    ; 3E2D _ 8B. 45, F4
        mov     dword [eax+0CH], 0                      ; 3E30 _ C7. 40, 0C, 00000000
        mov     eax, dword [ebp-0CH]                    ; 3E37 _ 8B. 45, F4
        mov     dword [esp], eax                        ; 3E3A _ 89. 04 24
        call    task_add                                ; 3E3D _ E8, FFFFFFFC(rel)
        call    task_switch_sub                         ; 3E42 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 3E47 _ 8B. 45, F4
        mov     eax, dword [eax]                        ; 3E4A _ 8B. 00
        mov     dword [esp], eax                        ; 3E4C _ 89. 04 24
        call    load_tr                                 ; 3E4F _ E8, FFFFFFFC(rel)
        call    timer_alloc                             ; 3E54 _ E8, FFFFFFFC(rel)
        mov     dword [task_timer], eax                 ; 3E59 _ A3, 00002244(d)
        mov     eax, dword [ebp-0CH]                    ; 3E5E _ 8B. 45, F4
        mov     eax, dword [eax+8H]                     ; 3E61 _ 8B. 40, 08
        mov     edx, eax                                ; 3E64 _ 89. C2
        mov     eax, dword [task_timer]                 ; 3E66 _ A1, 00002244(d)
        mov     dword [esp+4H], edx                     ; 3E6B _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 3E6F _ 89. 04 24
        call    timer_settime                           ; 3E72 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 3E77 _ 8B. 45, F4
        leave                                           ; 3E7A _ C9
        ret                                             ; 3E7B _ C3
; task_init End of function

task_alloc:; Function begin
        push    ebp                                     ; 3E7C _ 55
        mov     ebp, esp                                ; 3E7D _ 89. E5
        sub     esp, 16                                 ; 3E7F _ 83. EC, 10
        mov     dword [ebp-8H], 0                       ; 3E82 _ C7. 45, F8, 00000000
        jmp     ?_208                                   ; 3E89 _ E9, 000000F6

?_206:  mov     edx, dword [task_control]               ; 3E8E _ 8B. 15, 00002248(d)
        mov     eax, dword [ebp-8H]                     ; 3E94 _ 8B. 45, F8
        imul    eax, eax, 148                           ; 3E97 _ 69. C0, 00000094
        add     eax, edx                                ; 3E9D _ 01. D0
        add     eax, 72                                 ; 3E9F _ 83. C0, 48
        mov     eax, dword [eax]                        ; 3EA2 _ 8B. 00
        test    eax, eax                                ; 3EA4 _ 85. C0
        jne     ?_207                                   ; 3EA6 _ 0F 85, 000000D4
        mov     eax, dword [task_control]               ; 3EAC _ A1, 00002248(d)
        mov     edx, dword [ebp-8H]                     ; 3EB1 _ 8B. 55, F8
        imul    edx, edx, 148                           ; 3EB4 _ 69. D2, 00000094
        add     edx, 64                                 ; 3EBA _ 83. C2, 40
        add     eax, edx                                ; 3EBD _ 01. D0
        add     eax, 4                                  ; 3EBF _ 83. C0, 04
        mov     dword [ebp-4H], eax                     ; 3EC2 _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 3EC5 _ 8B. 45, FC
        mov     dword [eax+4H], 1                       ; 3EC8 _ C7. 40, 04, 00000001
        mov     eax, dword [ebp-4H]                     ; 3ECF _ 8B. 45, FC
        mov     dword [eax+50H], 514                    ; 3ED2 _ C7. 40, 50, 00000202
        mov     eax, dword [ebp-4H]                     ; 3ED9 _ 8B. 45, FC
        mov     dword [eax+54H], 0                      ; 3EDC _ C7. 40, 54, 00000000
        mov     eax, dword [ebp-4H]                     ; 3EE3 _ 8B. 45, FC
        mov     dword [eax+58H], 0                      ; 3EE6 _ C7. 40, 58, 00000000
        mov     eax, dword [ebp-4H]                     ; 3EED _ 8B. 45, FC
        mov     dword [eax+5CH], 0                      ; 3EF0 _ C7. 40, 5C, 00000000
        mov     eax, dword [ebp-4H]                     ; 3EF7 _ 8B. 45, FC
        mov     dword [eax+60H], 0                      ; 3EFA _ C7. 40, 60, 00000000
        mov     eax, dword [ebp-8H]                     ; 3F01 _ 8B. 45, F8
        add     eax, 1                                  ; 3F04 _ 83. C0, 01
        shl     eax, 9                                  ; 3F07 _ C1. E0, 09
        mov     edx, eax                                ; 3F0A _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 3F0C _ 8B. 45, FC
        mov     dword [eax+64H], edx                    ; 3F0F _ 89. 50, 64
        mov     eax, dword [ebp-4H]                     ; 3F12 _ 8B. 45, FC
        mov     dword [eax+68H], 0                      ; 3F15 _ C7. 40, 68, 00000000
        mov     eax, dword [ebp-4H]                     ; 3F1C _ 8B. 45, FC
        mov     dword [eax+6CH], 0                      ; 3F1F _ C7. 40, 6C, 00000000
        mov     eax, dword [ebp-4H]                     ; 3F26 _ 8B. 45, FC
        mov     dword [eax+70H], 0                      ; 3F29 _ C7. 40, 70, 00000000
        mov     eax, dword [ebp-4H]                     ; 3F30 _ 8B. 45, FC
        mov     dword [eax+74H], 0                      ; 3F33 _ C7. 40, 74, 00000000
        mov     eax, dword [ebp-4H]                     ; 3F3A _ 8B. 45, FC
        mov     dword [eax+80H], 0                      ; 3F3D _ C7. 80, 00000080, 00000000
        mov     eax, dword [ebp-4H]                     ; 3F47 _ 8B. 45, FC
        mov     dword [eax+84H], 0                      ; 3F4A _ C7. 80, 00000084, 00000000
        mov     eax, dword [ebp-4H]                     ; 3F54 _ 8B. 45, FC
        mov     dword [eax+88H], 0                      ; 3F57 _ C7. 80, 00000088, 00000000
        mov     eax, dword [ebp-4H]                     ; 3F61 _ 8B. 45, FC
        mov     dword [eax+8CH], 0                      ; 3F64 _ C7. 80, 0000008C, 00000000
        mov     eax, dword [ebp-4H]                     ; 3F6E _ 8B. 45, FC
        mov     dword [eax+90H], 1073741824             ; 3F71 _ C7. 80, 00000090, 40000000
        mov     eax, dword [ebp-4H]                     ; 3F7B _ 8B. 45, FC
        jmp     ?_209                                   ; 3F7E _ EB, 13

?_207:  add     dword [ebp-8H], 1                       ; 3F80 _ 83. 45, F8, 01
?_208:  cmp     dword [ebp-8H], 4                       ; 3F84 _ 83. 7D, F8, 04
        jle     ?_206                                   ; 3F88 _ 0F 8E, FFFFFF00
        mov     eax, 0                                  ; 3F8E _ B8, 00000000
?_209:  leave                                           ; 3F93 _ C9
        ret                                             ; 3F94 _ C3
; task_alloc End of function

task_run:; Function begin
        push    ebp                                     ; 3F95 _ 55
        mov     ebp, esp                                ; 3F96 _ 89. E5
        sub     esp, 24                                 ; 3F98 _ 83. EC, 18
        cmp     dword [ebp+0CH], 0                      ; 3F9B _ 83. 7D, 0C, 00
        jns     ?_210                                   ; 3F9F _ 79, 09
        mov     eax, dword [ebp+8H]                     ; 3FA1 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 3FA4 _ 8B. 40, 0C
        mov     dword [ebp+0CH], eax                    ; 3FA7 _ 89. 45, 0C
?_210:  cmp     dword [ebp+10H], 0                      ; 3FAA _ 83. 7D, 10, 00
        jle     ?_211                                   ; 3FAE _ 7E, 09
        mov     eax, dword [ebp+8H]                     ; 3FB0 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 3FB3 _ 8B. 55, 10
        mov     dword [eax+8H], edx                     ; 3FB6 _ 89. 50, 08
?_211:  mov     eax, dword [ebp+8H]                     ; 3FB9 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 3FBC _ 8B. 40, 04
        cmp     eax, 2                                  ; 3FBF _ 83. F8, 02
        jnz     ?_212                                   ; 3FC2 _ 75, 16
        mov     eax, dword [ebp+8H]                     ; 3FC4 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 3FC7 _ 8B. 40, 0C
        cmp     eax, dword [ebp+0CH]                    ; 3FCA _ 3B. 45, 0C
        jz      ?_212                                   ; 3FCD _ 74, 0B
        mov     eax, dword [ebp+8H]                     ; 3FCF _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3FD2 _ 89. 04 24
        call    task_remove                             ; 3FD5 _ E8, FFFFFFFC(rel)
?_212:  mov     eax, dword [ebp+8H]                     ; 3FDA _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 3FDD _ 8B. 40, 04
        cmp     eax, 2                                  ; 3FE0 _ 83. F8, 02
        jz      ?_213                                   ; 3FE3 _ 74, 14
        mov     eax, dword [ebp+8H]                     ; 3FE5 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 3FE8 _ 8B. 55, 0C
        mov     dword [eax+0CH], edx                    ; 3FEB _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 3FEE _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3FF1 _ 89. 04 24
        call    task_add                                ; 3FF4 _ E8, FFFFFFFC(rel)
?_213:  mov     eax, dword [task_control]               ; 3FF9 _ A1, 00002248(d)
        mov     dword [eax+4H], 1                       ; 3FFE _ C7. 40, 04, 00000001
        leave                                           ; 4005 _ C9
        ret                                             ; 4006 _ C3
; task_run End of function

task_switch:; Function begin
        push    ebp                                     ; 4007 _ 55
        mov     ebp, esp                                ; 4008 _ 89. E5
        sub     esp, 40                                 ; 400A _ 83. EC, 28
        mov     ecx, dword [task_control]               ; 400D _ 8B. 0D, 00002248(d)
        mov     eax, dword [task_control]               ; 4013 _ A1, 00002248(d)
        mov     edx, dword [eax]                        ; 4018 _ 8B. 10
        mov     eax, edx                                ; 401A _ 89. D0
        shl     eax, 2                                  ; 401C _ C1. E0, 02
        add     eax, edx                                ; 401F _ 01. D0
        shl     eax, 2                                  ; 4021 _ C1. E0, 02
        add     eax, ecx                                ; 4024 _ 01. C8
        add     eax, 8                                  ; 4026 _ 83. C0, 08
        mov     dword [ebp-14H], eax                    ; 4029 _ 89. 45, EC
        mov     eax, dword [ebp-14H]                    ; 402C _ 8B. 45, EC
        mov     edx, dword [eax+4H]                     ; 402F _ 8B. 50, 04
        mov     eax, dword [ebp-14H]                    ; 4032 _ 8B. 45, EC
        mov     eax, dword [eax+edx*4+8H]               ; 4035 _ 8B. 44 90, 08
        mov     dword [ebp-10H], eax                    ; 4039 _ 89. 45, F0
        mov     eax, dword [ebp-14H]                    ; 403C _ 8B. 45, EC
        mov     eax, dword [eax+4H]                     ; 403F _ 8B. 40, 04
        lea     edx, [eax+1H]                           ; 4042 _ 8D. 50, 01
        mov     eax, dword [ebp-14H]                    ; 4045 _ 8B. 45, EC
        mov     dword [eax+4H], edx                     ; 4048 _ 89. 50, 04
        mov     eax, dword [ebp-14H]                    ; 404B _ 8B. 45, EC
        mov     edx, dword [eax+4H]                     ; 404E _ 8B. 50, 04
        mov     eax, dword [ebp-14H]                    ; 4051 _ 8B. 45, EC
        mov     eax, dword [eax]                        ; 4054 _ 8B. 00
        cmp     edx, eax                                ; 4056 _ 39. C2
        jnz     ?_214                                   ; 4058 _ 75, 0A
        mov     eax, dword [ebp-14H]                    ; 405A _ 8B. 45, EC
        mov     dword [eax+4H], 0                       ; 405D _ C7. 40, 04, 00000000
?_214:  mov     eax, dword [task_control]               ; 4064 _ A1, 00002248(d)
        mov     eax, dword [eax+4H]                     ; 4069 _ 8B. 40, 04
        test    eax, eax                                ; 406C _ 85. C0
        jz      ?_215                                   ; 406E _ 74, 24
        call    task_switch_sub                         ; 4070 _ E8, FFFFFFFC(rel)
        mov     ecx, dword [task_control]               ; 4075 _ 8B. 0D, 00002248(d)
        mov     eax, dword [task_control]               ; 407B _ A1, 00002248(d)
        mov     edx, dword [eax]                        ; 4080 _ 8B. 10
        mov     eax, edx                                ; 4082 _ 89. D0
        shl     eax, 2                                  ; 4084 _ C1. E0, 02
        add     eax, edx                                ; 4087 _ 01. D0
        shl     eax, 2                                  ; 4089 _ C1. E0, 02
        add     eax, ecx                                ; 408C _ 01. C8
        add     eax, 8                                  ; 408E _ 83. C0, 08
        mov     dword [ebp-14H], eax                    ; 4091 _ 89. 45, EC
?_215:  mov     eax, dword [ebp-14H]                    ; 4094 _ 8B. 45, EC
        mov     edx, dword [eax+4H]                     ; 4097 _ 8B. 50, 04
        mov     eax, dword [ebp-14H]                    ; 409A _ 8B. 45, EC
        mov     eax, dword [eax+edx*4+8H]               ; 409D _ 8B. 44 90, 08
        mov     dword [ebp-0CH], eax                    ; 40A1 _ 89. 45, F4
        mov     eax, dword [ebp-0CH]                    ; 40A4 _ 8B. 45, F4
        mov     eax, dword [eax+8H]                     ; 40A7 _ 8B. 40, 08
        mov     edx, eax                                ; 40AA _ 89. C2
        mov     eax, dword [task_timer]                 ; 40AC _ A1, 00002244(d)
        mov     dword [esp+4H], edx                     ; 40B1 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 40B5 _ 89. 04 24
        call    timer_settime                           ; 40B8 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 40BD _ 8B. 45, F4
        cmp     eax, dword [ebp-10H]                    ; 40C0 _ 3B. 45, F0
        jz      ?_216                                   ; 40C3 _ 74, 1B
        cmp     dword [ebp-0CH], 0                      ; 40C5 _ 83. 7D, F4, 00
        jz      ?_216                                   ; 40C9 _ 74, 15
        mov     eax, dword [ebp-0CH]                    ; 40CB _ 8B. 45, F4
        mov     eax, dword [eax]                        ; 40CE _ 8B. 00
        mov     dword [esp+4H], eax                     ; 40D0 _ 89. 44 24, 04
        mov     dword [esp], 0                          ; 40D4 _ C7. 04 24, 00000000
        call    farjmp                                  ; 40DB _ E8, FFFFFFFC(rel)
?_216:  leave                                           ; 40E0 _ C9
        ret                                             ; 40E1 _ C3
; task_switch End of function

task_sleep:; Function begin
        push    ebp                                     ; 40E2 _ 55
        mov     ebp, esp                                ; 40E3 _ 89. E5
        sub     esp, 40                                 ; 40E5 _ 83. EC, 28
        mov     dword [ebp-0CH], 0                      ; 40E8 _ C7. 45, F4, 00000000
        mov     dword [ebp-10H], 0                      ; 40EF _ C7. 45, F0, 00000000
        mov     eax, dword [ebp+8H]                     ; 40F6 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 40F9 _ 8B. 40, 04
        cmp     eax, 2                                  ; 40FC _ 83. F8, 02
        jnz     ?_217                                   ; 40FF _ 75, 51
        call    task_now                                ; 4101 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 4106 _ 89. 45, F4
        mov     eax, dword [ebp+8H]                     ; 4109 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 410C _ 89. 04 24
        call    task_remove                             ; 410F _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], 1                      ; 4114 _ C7. 45, F0, 00000001
        mov     eax, dword [ebp+8H]                     ; 411B _ 8B. 45, 08
        cmp     eax, dword [ebp-0CH]                    ; 411E _ 3B. 45, F4
        jnz     ?_217                                   ; 4121 _ 75, 2F
        call    task_switch_sub                         ; 4123 _ E8, FFFFFFFC(rel)
        call    task_now                                ; 4128 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 412D _ 89. 45, F4
        mov     dword [ebp-10H], 2                      ; 4130 _ C7. 45, F0, 00000002
        cmp     dword [ebp-0CH], 0                      ; 4137 _ 83. 7D, F4, 00
        jz      ?_217                                   ; 413B _ 74, 15
        mov     eax, dword [ebp-0CH]                    ; 413D _ 8B. 45, F4
        mov     eax, dword [eax]                        ; 4140 _ 8B. 00
        mov     dword [esp+4H], eax                     ; 4142 _ 89. 44 24, 04
        mov     dword [esp], 0                          ; 4146 _ C7. 04 24, 00000000
        call    farjmp                                  ; 414D _ E8, FFFFFFFC(rel)
?_217:  mov     eax, dword [ebp-10H]                    ; 4152 _ 8B. 45, F0
        leave                                           ; 4155 _ C9
        ret                                             ; 4156 _ C3
; task_sleep End of function

task_now:; Function begin
        push    ebp                                     ; 4157 _ 55
        mov     ebp, esp                                ; 4158 _ 89. E5
        sub     esp, 16                                 ; 415A _ 83. EC, 10
        mov     ecx, dword [task_control]               ; 415D _ 8B. 0D, 00002248(d)
        mov     eax, dword [task_control]               ; 4163 _ A1, 00002248(d)
        mov     edx, dword [eax]                        ; 4168 _ 8B. 10
        mov     eax, edx                                ; 416A _ 89. D0
        shl     eax, 2                                  ; 416C _ C1. E0, 02
        add     eax, edx                                ; 416F _ 01. D0
        shl     eax, 2                                  ; 4171 _ C1. E0, 02
        add     eax, ecx                                ; 4174 _ 01. C8
        add     eax, 8                                  ; 4176 _ 83. C0, 08
        mov     dword [ebp-4H], eax                     ; 4179 _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 417C _ 8B. 45, FC
        mov     edx, dword [eax+4H]                     ; 417F _ 8B. 50, 04
        mov     eax, dword [ebp-4H]                     ; 4182 _ 8B. 45, FC
        mov     eax, dword [eax+edx*4+8H]               ; 4185 _ 8B. 44 90, 08
        leave                                           ; 4189 _ C9
        ret                                             ; 418A _ C3
; task_now End of function

task_add:; Function begin
        push    ebp                                     ; 418B _ 55
        mov     ebp, esp                                ; 418C _ 89. E5
        sub     esp, 16                                 ; 418E _ 83. EC, 10
        mov     ecx, dword [task_control]               ; 4191 _ 8B. 0D, 00002248(d)
        mov     eax, dword [ebp+8H]                     ; 4197 _ 8B. 45, 08
        mov     edx, dword [eax+0CH]                    ; 419A _ 8B. 50, 0C
        mov     eax, edx                                ; 419D _ 89. D0
        shl     eax, 2                                  ; 419F _ C1. E0, 02
        add     eax, edx                                ; 41A2 _ 01. D0
        shl     eax, 2                                  ; 41A4 _ C1. E0, 02
        add     eax, ecx                                ; 41A7 _ 01. C8
        add     eax, 8                                  ; 41A9 _ 83. C0, 08
        mov     dword [ebp-4H], eax                     ; 41AC _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 41AF _ 8B. 45, FC
        mov     edx, dword [eax]                        ; 41B2 _ 8B. 10
        mov     eax, dword [ebp-4H]                     ; 41B4 _ 8B. 45, FC
        mov     ecx, dword [ebp+8H]                     ; 41B7 _ 8B. 4D, 08
        mov     dword [eax+edx*4+8H], ecx               ; 41BA _ 89. 4C 90, 08
        mov     eax, dword [ebp-4H]                     ; 41BE _ 8B. 45, FC
        mov     eax, dword [eax]                        ; 41C1 _ 8B. 00
        lea     edx, [eax+1H]                           ; 41C3 _ 8D. 50, 01
        mov     eax, dword [ebp-4H]                     ; 41C6 _ 8B. 45, FC
        mov     dword [eax], edx                        ; 41C9 _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 41CB _ 8B. 45, 08
        mov     dword [eax+4H], 2                       ; 41CE _ C7. 40, 04, 00000002
        leave                                           ; 41D5 _ C9
        ret                                             ; 41D6 _ C3
; task_add End of function

task_remove:; Function begin
        push    ebp                                     ; 41D7 _ 55
        mov     ebp, esp                                ; 41D8 _ 89. E5
        sub     esp, 16                                 ; 41DA _ 83. EC, 10
        mov     ecx, dword [task_control]               ; 41DD _ 8B. 0D, 00002248(d)
        mov     eax, dword [ebp+8H]                     ; 41E3 _ 8B. 45, 08
        mov     edx, dword [eax+0CH]                    ; 41E6 _ 8B. 50, 0C
        mov     eax, edx                                ; 41E9 _ 89. D0
        shl     eax, 2                                  ; 41EB _ C1. E0, 02
        add     eax, edx                                ; 41EE _ 01. D0
        shl     eax, 2                                  ; 41F0 _ C1. E0, 02
        add     eax, ecx                                ; 41F3 _ 01. C8
        add     eax, 8                                  ; 41F5 _ 83. C0, 08
        mov     dword [ebp-4H], eax                     ; 41F8 _ 89. 45, FC
        mov     dword [ebp-8H], 0                       ; 41FB _ C7. 45, F8, 00000000
        jmp     ?_220                                   ; 4202 _ EB, 23

?_218:  mov     eax, dword [ebp-4H]                     ; 4204 _ 8B. 45, FC
        mov     edx, dword [ebp-8H]                     ; 4207 _ 8B. 55, F8
        mov     eax, dword [eax+edx*4+8H]               ; 420A _ 8B. 44 90, 08
        cmp     eax, dword [ebp+8H]                     ; 420E _ 3B. 45, 08
        jnz     ?_219                                   ; 4211 _ 75, 10
        mov     eax, dword [ebp-4H]                     ; 4213 _ 8B. 45, FC
        mov     edx, dword [ebp-8H]                     ; 4216 _ 8B. 55, F8
        mov     dword [eax+edx*4+8H], 0                 ; 4219 _ C7. 44 90, 08, 00000000
        jmp     ?_221                                   ; 4221 _ EB, 0E

?_219:  add     dword [ebp-8H], 1                       ; 4223 _ 83. 45, F8, 01
?_220:  mov     eax, dword [ebp-4H]                     ; 4227 _ 8B. 45, FC
        mov     eax, dword [eax]                        ; 422A _ 8B. 00
        cmp     eax, dword [ebp-8H]                     ; 422C _ 3B. 45, F8
        jg      ?_218                                   ; 422F _ 7F, D3
?_221:  mov     eax, dword [ebp-4H]                     ; 4231 _ 8B. 45, FC
        mov     eax, dword [eax]                        ; 4234 _ 8B. 00
        lea     edx, [eax-1H]                           ; 4236 _ 8D. 50, FF
        mov     eax, dword [ebp-4H]                     ; 4239 _ 8B. 45, FC
        mov     dword [eax], edx                        ; 423C _ 89. 10
        mov     eax, dword [ebp-4H]                     ; 423E _ 8B. 45, FC
        mov     eax, dword [eax+4H]                     ; 4241 _ 8B. 40, 04
        cmp     eax, dword [ebp-8H]                     ; 4244 _ 3B. 45, F8
        jle     ?_222                                   ; 4247 _ 7E, 0F
        mov     eax, dword [ebp-4H]                     ; 4249 _ 8B. 45, FC
        mov     eax, dword [eax+4H]                     ; 424C _ 8B. 40, 04
        lea     edx, [eax-1H]                           ; 424F _ 8D. 50, FF
        mov     eax, dword [ebp-4H]                     ; 4252 _ 8B. 45, FC
        mov     dword [eax+4H], edx                     ; 4255 _ 89. 50, 04
?_222:  mov     eax, dword [ebp-4H]                     ; 4258 _ 8B. 45, FC
        mov     edx, dword [eax+4H]                     ; 425B _ 8B. 50, 04
        mov     eax, dword [ebp-4H]                     ; 425E _ 8B. 45, FC
        mov     eax, dword [eax]                        ; 4261 _ 8B. 00
        cmp     edx, eax                                ; 4263 _ 39. C2
        jl      ?_223                                   ; 4265 _ 7C, 0A
        mov     eax, dword [ebp-4H]                     ; 4267 _ 8B. 45, FC
        mov     dword [eax+4H], 0                       ; 426A _ C7. 40, 04, 00000000
?_223:  mov     eax, dword [ebp+8H]                     ; 4271 _ 8B. 45, 08
        mov     dword [eax+4H], 1                       ; 4274 _ C7. 40, 04, 00000001
        jmp     ?_225                                   ; 427B _ EB, 1B

?_224:  mov     eax, dword [ebp-8H]                     ; 427D _ 8B. 45, F8
        lea     edx, [eax+1H]                           ; 4280 _ 8D. 50, 01
        mov     eax, dword [ebp-4H]                     ; 4283 _ 8B. 45, FC
        mov     ecx, dword [eax+edx*4+8H]               ; 4286 _ 8B. 4C 90, 08
        mov     eax, dword [ebp-4H]                     ; 428A _ 8B. 45, FC
        mov     edx, dword [ebp-8H]                     ; 428D _ 8B. 55, F8
        mov     dword [eax+edx*4+8H], ecx               ; 4290 _ 89. 4C 90, 08
        add     dword [ebp-8H], 1                       ; 4294 _ 83. 45, F8, 01
?_225:  mov     eax, dword [ebp-4H]                     ; 4298 _ 8B. 45, FC
        mov     eax, dword [eax]                        ; 429B _ 8B. 00
        cmp     eax, dword [ebp-8H]                     ; 429D _ 3B. 45, F8
        jg      ?_224                                   ; 42A0 _ 7F, DB
        leave                                           ; 42A2 _ C9
        ret                                             ; 42A3 _ C3
; task_remove End of function

task_switch_sub:; Function begin
        push    ebp                                     ; 42A4 _ 55
        mov     ebp, esp                                ; 42A5 _ 89. E5
        sub     esp, 16                                 ; 42A7 _ 83. EC, 10
        mov     dword [ebp-4H], 0                       ; 42AA _ C7. 45, FC, 00000000
        jmp     ?_228                                   ; 42B1 _ EB, 24

?_226:  mov     ecx, dword [task_control]               ; 42B3 _ 8B. 0D, 00002248(d)
        mov     edx, dword [ebp-4H]                     ; 42B9 _ 8B. 55, FC
        mov     eax, edx                                ; 42BC _ 89. D0
        shl     eax, 2                                  ; 42BE _ C1. E0, 02
        add     eax, edx                                ; 42C1 _ 01. D0
        shl     eax, 2                                  ; 42C3 _ C1. E0, 02
        add     eax, ecx                                ; 42C6 _ 01. C8
        add     eax, 8                                  ; 42C8 _ 83. C0, 08
        mov     eax, dword [eax]                        ; 42CB _ 8B. 00
        test    eax, eax                                ; 42CD _ 85. C0
        jle     ?_227                                   ; 42CF _ 7E, 02
        jmp     ?_229                                   ; 42D1 _ EB, 0A

?_227:  add     dword [ebp-4H], 1                       ; 42D3 _ 83. 45, FC, 01
?_228:  cmp     dword [ebp-4H], 2                       ; 42D7 _ 83. 7D, FC, 02
        jle     ?_226                                   ; 42DB _ 7E, D6
?_229:  mov     eax, dword [task_control]               ; 42DD _ A1, 00002248(d)
        mov     edx, dword [ebp-4H]                     ; 42E2 _ 8B. 55, FC
        mov     dword [eax], edx                        ; 42E5 _ 89. 10
        mov     eax, dword [task_control]               ; 42E7 _ A1, 00002248(d)
        mov     dword [eax+4H], 0                       ; 42EC _ C7. 40, 04, 00000000
        leave                                           ; 42F3 _ C9
        ret                                             ; 42F4 _ C3
; task_switch_sub End of function

task_send_message:; Function begin
        push    ebp                                     ; 42F5 _ 55
        mov     ebp, esp                                ; 42F6 _ 89. E5
        sub     esp, 24                                 ; 42F8 _ 83. EC, 18
        mov     eax, dword [ebp+10H]                    ; 42FB _ 8B. 45, 10
        movzx   eax, al                                 ; 42FE _ 0F B6. C0
        mov     edx, dword [ebp+0CH]                    ; 4301 _ 8B. 55, 0C
        add     edx, 16                                 ; 4304 _ 83. C2, 10
        mov     dword [esp+4H], eax                     ; 4307 _ 89. 44 24, 04
        mov     dword [esp], edx                        ; 430B _ 89. 14 24
        call    fifo8_put                               ; 430E _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 4313 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 4316 _ 89. 04 24
        call    task_sleep                              ; 4319 _ E8, FFFFFFFC(rel)
        leave                                           ; 431E _ C9
        ret                                             ; 431F _ C3
; task_send_message End of function



?_230:                                                  ; byte
        db 77H, 69H, 6EH, 64H, 6FH, 77H, 00H            ; 0000 _ window.

?_231:                                                  ; byte
        db 63H, 6FH, 6EH, 73H, 6FH, 6CH, 65H, 00H       ; 0007 _ console.

?_232:                                                  ; byte
        db 65H, 6EH, 74H, 65H, 72H, 20H, 74H, 61H       ; 000F _ enter ta
        db 73H, 6BH, 20H, 62H, 00H                      ; 0017 _ sk b.

?_233:                                                  ; byte
        db 42H, 00H                                     ; 001C _ B.

?_234:                                                  ; byte
        db 70H, 61H, 67H, 65H, 20H, 69H, 73H, 3AH       ; 001E _ page is:
        db 20H, 00H                                     ; 0026 _  .

?_235:                                                  ; byte
        db 42H, 61H, 73H, 65H, 41H, 64H, 64H, 72H       ; 0028 _ BaseAddr
        db 4CH, 3AH, 20H, 00H                           ; 0030 _ L: .

?_236:                                                  ; byte
        db 42H, 61H, 73H, 65H, 41H, 64H, 64H, 72H       ; 0034 _ BaseAddr
        db 48H, 3AH, 20H, 00H                           ; 003C _ H: .

?_237:                                                  ; byte
        db 6CH, 65H, 6EH, 67H, 74H, 68H, 4CH, 6FH       ; 0040 _ lengthLo
        db 77H, 3AH, 20H, 00H                           ; 0048 _ w: .

?_238:                                                  ; byte
        db 6CH, 65H, 6EH, 67H, 74H, 68H, 48H, 69H       ; 004C _ lengthHi
        db 67H, 68H, 3AH, 20H, 00H                      ; 0054 _ gh: .

?_239:                                                  ; byte
        db 74H, 79H, 70H, 65H, 3AH, 20H, 00H            ; 0059 _ type: .

?_240:                                                  ; byte
        db 3EH, 00H                                     ; 0060 _ >.

?_241:                                                  ; byte
        db 63H, 6FH, 6EH, 73H, 6FH, 6CH, 65H, 00H       ; 0062 _ console.



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
        db 2CH, 60H, 00H, 5CH, 5AH, 58H, 43H, 56H       ; 0048 _ ,`.\ZXCV
        db 42H, 4EH, 4DH, 2CH, 2EH, 2FH, 00H, 00H       ; 0050 _ BNM,./..
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0058 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0060 _ ........
        db 00H, 00H, 2DH, 00H, 00H, 2BH, 00H, 00H       ; 0068 _ ..-..+..
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0070 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0078 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0080 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0088 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0090 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0098 _ ........

keytable_shift:                                         ; byte
        db 00H, 00H, 21H, 40H, 23H, 24H, 25H, 5EH       ; 00A0 _ ..!@#$%^
        db 26H, 2AH, 28H, 29H, 5FH, 2BH, 00H, 00H       ; 00A8 _ &*()_+..
        db 51H, 57H, 45H, 52H, 54H, 59H, 55H, 49H       ; 00B0 _ QWERTYUI
        db 4FH, 50H, 7BH, 7DH, 00H, 00H, 41H, 53H       ; 00B8 _ OP{}..AS
        db 44H, 46H, 47H, 48H, 4AH, 4BH, 4CH, 3AH       ; 00C0 _ DFGHJKL:
        db 22H, 7EH, 00H, 7CH, 5AH, 58H, 43H, 56H       ; 00C8 _ "~.|ZXCV
        db 42H, 4EH, 4DH, 3CH, 3EH, 3FH, 00H, 00H       ; 00D0 _ BNM<>?..
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 00D8 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 00E0 _ ........
        db 00H, 00H, 2DH, 00H, 00H, 2BH, 00H, 00H       ; 00E8 _ ..-..+..
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 00F0 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 00F8 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0100 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0108 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0110 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0118 _ ........

table_rgb.1758:                                         ; byte
        db 00H, 00H, 00H, 0FFH, 00H, 00H, 44H, 8CH      ; 0120 _ ......D.
        db 0BBH, 0FFH, 0FFH, 00H, 00H, 00H, 0FFH, 0FFH  ; 0128 _ ........
        db 00H, 0FFH, 00H, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH ; 0130 _ ........
        db 0C6H, 0C6H, 0C6H, 84H, 00H, 00H, 00H, 84H    ; 0138 _ ........
        db 00H, 84H, 84H, 00H, 00H, 00H, 84H, 84H       ; 0140 _ ........
        db 00H, 84H, 00H, 84H, 84H, 84H, 84H, 84H       ; 0148 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0150 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0158 _ ........

cursor.1826:                                            ; byte
        db 2AH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0160 _ *.......
        db 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0168 _ ........
        db 2AH, 2AH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0170 _ **......
        db 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0178 _ ........
        db 2AH, 4FH, 2AH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0180 _ *O*.....
        db 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0188 _ ........
        db 2AH, 4FH, 4FH, 2AH, 2EH, 2EH, 2EH, 2EH       ; 0190 _ *OO*....
        db 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0198 _ ........
        db 2AH, 4FH, 4FH, 4FH, 2AH, 2EH, 2EH, 2EH       ; 01A0 _ *OOO*...
        db 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 01A8 _ ........
        db 2AH, 4FH, 4FH, 4FH, 4FH, 2AH, 2EH, 2EH       ; 01B0 _ *OOOO*..
        db 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 01B8 _ ........
        db 2AH, 4FH, 4FH, 4FH, 4FH, 4FH, 2AH, 2EH       ; 01C0 _ *OOOOO*.
        db 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 01C8 _ ........
        db 2AH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 2AH       ; 01D0 _ *OOOOOO*
        db 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 01D8 _ ........
        db 2AH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH       ; 01E0 _ *OOOOOOO
        db 2AH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 01E8 _ *.......
        db 2AH, 4FH, 4FH, 4FH, 4FH, 2AH, 2AH, 2AH       ; 01F0 _ *OOOO***
        db 2AH, 2AH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 01F8 _ **......
        db 2AH, 4FH, 4FH, 2AH, 4FH, 2AH, 2EH, 2EH       ; 0200 _ *OO*O*..
        db 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0208 _ ........
        db 2AH, 4FH, 2AH, 2EH, 2AH, 4FH, 2AH, 2EH       ; 0210 _ *O*.*O*.
        db 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0218 _ ........
        db 2AH, 2AH, 2EH, 2EH, 2AH, 4FH, 2AH, 2EH       ; 0220 _ **..*O*.
        db 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0228 _ ........
        db 2AH, 2EH, 2EH, 2EH, 2EH, 2AH, 4FH, 2AH       ; 0230 _ *....*O*
        db 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0238 _ ........
        db 2EH, 2EH, 2EH, 2EH, 2EH, 2AH, 4FH, 2AH       ; 0240 _ .....*O*
        db 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0248 _ ........
        db 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2AH, 2EH       ; 0250 _ ......*.
        db 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0258 _ ........

closebtn.1913:                                          ; byte
        db 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH       ; 0260 _ OOOOOOOO
        db 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 40H       ; 0268 _ OOOOOOO@
        db 4FH, 51H, 51H, 51H, 51H, 51H, 51H, 51H       ; 0270 _ OQQQQQQQ
        db 51H, 51H, 51H, 51H, 51H, 51H, 24H, 40H       ; 0278 _ QQQQQQ$@
        db 4FH, 51H, 51H, 51H, 51H, 51H, 51H, 51H       ; 0280 _ OQQQQQQQ
        db 51H, 51H, 51H, 51H, 51H, 51H, 24H, 40H       ; 0288 _ QQQQQQ$@
        db 4FH, 51H, 51H, 51H, 40H, 40H, 51H, 51H       ; 0290 _ OQQQ@@QQ
        db 51H, 51H, 40H, 40H, 51H, 51H, 24H, 40H       ; 0298 _ QQ@@QQ$@
        db 4FH, 51H, 51H, 51H, 51H, 40H, 40H, 51H       ; 02A0 _ OQQQQ@@Q
        db 51H, 40H, 40H, 51H, 51H, 51H, 24H, 40H       ; 02A8 _ Q@@QQQ$@
        db 4FH, 51H, 51H, 51H, 51H, 51H, 40H, 40H       ; 02B0 _ OQQQQQ@@
        db 40H, 40H, 51H, 51H, 51H, 51H, 24H, 40H       ; 02B8 _ @@QQQQ$@
        db 4FH, 51H, 51H, 51H, 51H, 51H, 51H, 40H       ; 02C0 _ OQQQQQQ@
        db 40H, 51H, 51H, 51H, 51H, 51H, 24H, 40H       ; 02C8 _ @QQQQQ$@
        db 4FH, 51H, 51H, 51H, 51H, 51H, 40H, 40H       ; 02D0 _ OQQQQQ@@
        db 40H, 40H, 51H, 51H, 51H, 51H, 24H, 40H       ; 02D8 _ @@QQQQ$@
        db 4FH, 51H, 51H, 51H, 51H, 40H, 40H, 51H       ; 02E0 _ OQQQQ@@Q
        db 51H, 40H, 40H, 51H, 51H, 51H, 24H, 40H       ; 02E8 _ Q@@QQQ$@
        db 4FH, 51H, 51H, 51H, 40H, 40H, 51H, 51H       ; 02F0 _ OQQQ@@QQ
        db 51H, 51H, 40H, 40H, 51H, 51H, 24H, 40H       ; 02F8 _ QQ@@QQ$@
        db 4FH, 51H, 51H, 51H, 51H, 51H, 51H, 51H       ; 0300 _ OQQQQQQQ
        db 51H, 51H, 51H, 51H, 51H, 51H, 24H, 40H       ; 0308 _ QQQQQQ$@
        db 4FH, 51H, 51H, 51H, 51H, 51H, 51H, 51H       ; 0310 _ OQQQQQQQ
        db 51H, 51H, 51H, 51H, 51H, 51H, 24H, 40H       ; 0318 _ QQQQQQ$@
        db 4FH, 24H, 24H, 24H, 24H, 24H, 24H, 24H       ; 0320 _ O$$$$$$$
        db 24H, 24H, 24H, 24H, 24H, 24H, 24H, 40H       ; 0328 _ $$$$$$$@
        db 40H, 40H, 40H, 40H, 40H, 40H, 40H, 40H       ; 0330 _ @@@@@@@@
        db 40H, 40H, 40H, 40H, 40H, 40H, 40H, 40H       ; 0338 _ @@@@@@@@

keyval:                                                 ; byte
        db 30H, 58H                                     ; 0340 _ 0X

?_242:  db 00H                                          ; 0342 _ .

?_243:  db 00H, 00H                                     ; 0343 _ ..



task_console_g:                                         ; dword
        resd    1                                       ; 0000

task_main:                                              ; dword
        resd    1                                       ; 0004

task_a: resd    1                                       ; 0008

sheet_control:                                          ; dword
        resd    1                                       ; 000C

back_sheet:                                             ; dword
        resd    1                                       ; 0010

mouse_sheet:                                            ; dword
        resd    1                                       ; 0014

timerinfo1.1759:                                        ; byte
        resb    28                                      ; 0018

timerbuf1.1762:                                         ; qword
        resq    1                                       ; 0034

timerinfo2.1760:                                        ; byte
        resb    28                                      ; 003C

timerbuf2.1763:                                         ; qword
        resq    1                                       ; 0058

timerinfo3.1761:                                        ; byte
        resb    28                                      ; 0060

timerbuf3.1764:                                         ; qword
        resq    4                                       ; 007C
        resb    4                                       ; 009C

screen_info:                                            ; qword
        resb    4                                       ; 00A0

?_244:  resw    1                                       ; 00A4

?_245:  resw    13                                      ; 00A6

mouse_cursor_buf:                                       ; byte
        resb    256                                     ; 00C0

back_buf: resd  1                                       ; 01C0

sheet_win:                                              ; dword
        resd    1                                       ; 01C4

mouse_x: resd   1                                       ; 01C8

mouse_y: resd   1                                       ; 01CC

key_shift:                                              ; dword
        resd    1                                       ; 01D0

caps_lock:                                              ; dword
        resd    1                                       ; 01D4

mouse_send_info:                                        ; oword
        resb    40                                      ; 01D8

keyinfo:                                                ; byte
        resb    32                                      ; 0200

keybuf:                                                 ; yword
        resb    32                                      ; 0220

mouseinfo:                                              ; byte
        resb    32                                      ; 0240

mousebuf:                                               ; byte
        resb    128                                     ; 0260

str.1386:                                               ; byte
        resb    1                                       ; 02E0

?_246:  resb    9                                       ; 02E1

?_247:  resb    22                                      ; 02EA

timer_control:                                          ; byte
        resd    2001                                    ; 0300

task_timer:                                             ; dword
        resd    1                                       ; 2244

task_control:                                           ; dword
        resd    1                                       ; 2248


