; Disassembly of file: ckernel.o
; Tue Mar 17 10:43:51 2020
; Mode: 32 bits
; Syntax: YASM/NASM
; Instruction set: Pentium Pro






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
        mov     dword [esp+8H], timerbuf1.1769          ; 014B _ C7. 44 24, 08, 00000034(d)
        mov     dword [esp+4H], 8                       ; 0153 _ C7. 44 24, 04, 00000008
        mov     dword [esp], timerinfo1.1766            ; 015B _ C7. 04 24, 00000018(d)
        call    fifo8_init                              ; 0162 _ E8, FFFFFFFC(rel)
        call    timer_alloc                             ; 0167 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-38H], eax                    ; 016C _ 89. 45, C8
        mov     dword [esp+8H], 1                       ; 016F _ C7. 44 24, 08, 00000001
        mov     dword [esp+4H], timerinfo1.1766         ; 0177 _ C7. 44 24, 04, 00000018(d)
        mov     eax, dword [ebp-38H]                    ; 017F _ 8B. 45, C8
        mov     dword [esp], eax                        ; 0182 _ 89. 04 24
        call    timer_init                              ; 0185 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 100                     ; 018A _ C7. 44 24, 04, 00000064
        mov     eax, dword [ebp-38H]                    ; 0192 _ 8B. 45, C8
        mov     dword [esp], eax                        ; 0195 _ 89. 04 24
        call    timer_settime                           ; 0198 _ E8, FFFFFFFC(rel)
        mov     dword [esp+0CH], 0                      ; 019D _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], timerbuf2.1770          ; 01A5 _ C7. 44 24, 08, 00000058(d)
        mov     dword [esp+4H], 8                       ; 01AD _ C7. 44 24, 04, 00000008
        mov     dword [esp], timerinfo2.1767            ; 01B5 _ C7. 04 24, 0000003C(d)
        call    fifo8_init                              ; 01BC _ E8, FFFFFFFC(rel)
        call    timer_alloc                             ; 01C1 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-34H], eax                    ; 01C6 _ 89. 45, CC
        mov     dword [esp+8H], 1                       ; 01C9 _ C7. 44 24, 08, 00000001
        mov     dword [esp+4H], timerinfo2.1767         ; 01D1 _ C7. 44 24, 04, 0000003C(d)
        mov     eax, dword [ebp-34H]                    ; 01D9 _ 8B. 45, CC
        mov     dword [esp], eax                        ; 01DC _ 89. 04 24
        call    timer_init                              ; 01DF _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 300                     ; 01E4 _ C7. 44 24, 04, 0000012C
        mov     eax, dword [ebp-34H]                    ; 01EC _ 8B. 45, CC
        mov     dword [esp], eax                        ; 01EF _ 89. 04 24
        call    timer_settime                           ; 01F2 _ E8, FFFFFFFC(rel)
        mov     dword [esp+0CH], 0                      ; 01F7 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], timerbuf3.1771          ; 01FF _ C7. 44 24, 08, 0000007C(d)
        mov     dword [esp+4H], 8                       ; 0207 _ C7. 44 24, 04, 00000008
        mov     dword [esp], timerinfo3.1768            ; 020F _ C7. 04 24, 00000060(d)
        call    fifo8_init                              ; 0216 _ E8, FFFFFFFC(rel)
        call    timer_alloc                             ; 021B _ E8, FFFFFFFC(rel)
        mov     dword [ebp-30H], eax                    ; 0220 _ 89. 45, D0
        mov     dword [esp+8H], 1                       ; 0223 _ C7. 44 24, 08, 00000001
        mov     dword [esp+4H], timerinfo3.1768         ; 022B _ C7. 44 24, 04, 00000060(d)
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
        mov     dword [esp+4H], ?_283                   ; 02DC _ C7. 44 24, 04, 00000000(d)
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
        mov     dword [esp], timerinfo1.1766            ; 03E8 _ C7. 04 24, 00000018(d)
        call    fifo8_status                            ; 03EF _ E8, FFFFFFFC(rel)
        add     ebx, eax                                ; 03F4 _ 01. C3
        mov     dword [esp], timerinfo2.1767            ; 03F6 _ C7. 04 24, 0000003C(d)
        call    fifo8_status                            ; 03FD _ E8, FFFFFFFC(rel)
        add     ebx, eax                                ; 0402 _ 01. C3
        mov     dword [esp], timerinfo3.1768            ; 0404 _ C7. 04 24, 00000060(d)
        call    fifo8_status                            ; 040B _ E8, FFFFFFFC(rel)
        add     eax, ebx                                ; 0410 _ 01. D8
        test    eax, eax                                ; 0412 _ 85. C0
        jnz     ?_002                                   ; 0414 _ 75, 0A
        call    io_sti                                  ; 0416 _ E8, FFFFFFFC(rel)
        jmp     ?_010                                   ; 041B _ E9, 00000421

?_002:  mov     dword [esp], keyinfo                    ; 0420 _ C7. 04 24, 00000000(d)
        call    fifo8_status                            ; 0427 _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 042C _ 85. C0
        je      ?_007                                   ; 042E _ 0F 84, 00000396
        call    io_sti                                  ; 0434 _ E8, FFFFFFFC(rel)
        mov     dword [esp], keyinfo                    ; 0439 _ C7. 04 24, 00000000(d)
        call    fifo8_get                               ; 0440 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-20H], eax                    ; 0445 _ 89. 45, E0
        cmp     dword [ebp-20H], 15                     ; 0448 _ 83. 7D, E0, 0F
        jne     ?_005                                   ; 044C _ 0F 85, 000001A5
        mov     dword [ebp-4CH], -1                     ; 0452 _ C7. 45, B4, FFFFFFFF
        cmp     dword [ebp-50H], 0                      ; 0459 _ 83. 7D, B0, 00
        jne     ?_003                                   ; 045D _ 0F 85, 00000089
        mov     dword [ebp-50H], 1                      ; 0463 _ C7. 45, B0, 00000001
        mov     edx, dword [sheet_win]                  ; 046A _ 8B. 15, 00000000(d)
        mov     eax, dword [sheet_control]              ; 0470 _ A1, 0000000C(d)
        mov     dword [esp+0CH], 0                      ; 0475 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], ?_283                   ; 047D _ C7. 44 24, 08, 00000000(d)
        mov     dword [esp+4H], edx                     ; 0485 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0489 _ 89. 04 24
        call    make_window_title                       ; 048C _ E8, FFFFFFFC(rel)
        mov     eax, dword [sheet_control]              ; 0491 _ A1, 0000000C(d)
        mov     dword [esp+0CH], 1                      ; 0496 _ C7. 44 24, 0C, 00000001
        mov     dword [esp+8H], ?_284                   ; 049E _ C7. 44 24, 08, 00000007(d)
        mov     edx, dword [ebp-24H]                    ; 04A6 _ 8B. 55, DC
        mov     dword [esp+4H], edx                     ; 04A9 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 04AD _ 89. 04 24
        call    make_window_title                       ; 04B0 _ E8, FFFFFFFC(rel)
        mov     edx, dword [sheet_win]                  ; 04B5 _ 8B. 15, 00000000(d)
        mov     eax, dword [sheet_control]              ; 04BB _ A1, 0000000C(d)
        mov     dword [esp+10H], 7                      ; 04C0 _ C7. 44 24, 10, 00000007
        mov     dword [esp+0CH], 28                     ; 04C8 _ C7. 44 24, 0C, 0000001C
        mov     ecx, dword [ebp-58H]                    ; 04D0 _ 8B. 4D, A8
        mov     dword [esp+8H], ecx                     ; 04D3 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 04D7 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 04DB _ 89. 04 24
        call    set_cursor                              ; 04DE _ E8, FFFFFFFC(rel)
        mov     dword [ebp-4CH], 87                     ; 04E3 _ C7. 45, B4, 00000057
        jmp     ?_004                                   ; 04EA _ EB, 71

?_003:  mov     dword [ebp-50H], 0                      ; 04EC _ C7. 45, B0, 00000000
        mov     edx, dword [sheet_win]                  ; 04F3 _ 8B. 15, 00000000(d)
        mov     eax, dword [sheet_control]              ; 04F9 _ A1, 0000000C(d)
        mov     dword [esp+0CH], 1                      ; 04FE _ C7. 44 24, 0C, 00000001
        mov     dword [esp+8H], ?_283                   ; 0506 _ C7. 44 24, 08, 00000000(d)
        mov     dword [esp+4H], edx                     ; 050E _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0512 _ 89. 04 24
        call    make_window_title                       ; 0515 _ E8, FFFFFFFC(rel)
        mov     eax, dword [sheet_control]              ; 051A _ A1, 0000000C(d)
        mov     dword [esp+0CH], 0                      ; 051F _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], ?_284                   ; 0527 _ C7. 44 24, 08, 00000007(d)
        mov     edx, dword [ebp-24H]                    ; 052F _ 8B. 55, DC
        mov     dword [esp+4H], edx                     ; 0532 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0536 _ 89. 04 24
        call    make_window_title                       ; 0539 _ E8, FFFFFFFC(rel)
        mov     eax, dword [task_console_g]             ; 053E _ A1, 00000000(d)
        add     eax, 16                                 ; 0543 _ 83. C0, 10
        mov     dword [esp+4H], 88                      ; 0546 _ C7. 44 24, 04, 00000058
        mov     dword [esp], eax                        ; 054E _ 89. 04 24
        call    fifo8_put                               ; 0551 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-4CH], 88                     ; 0556 _ C7. 45, B4, 00000058
?_004:  mov     eax, dword [sheet_win]                  ; 055D _ A1, 00000000(d)
        mov     ebx, dword [eax+8H]                     ; 0562 _ 8B. 58, 08
        mov     eax, dword [sheet_win]                  ; 0565 _ A1, 00000000(d)
        mov     ecx, dword [eax+4H]                     ; 056A _ 8B. 48, 04
        mov     edx, dword [sheet_win]                  ; 056D _ 8B. 15, 00000000(d)
        mov     eax, dword [sheet_control]              ; 0573 _ A1, 0000000C(d)
        mov     dword [esp+14H], ebx                    ; 0578 _ 89. 5C 24, 14
        mov     dword [esp+10H], ecx                    ; 057C _ 89. 4C 24, 10
        mov     dword [esp+0CH], 0                      ; 0580 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 0                       ; 0588 _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], edx                     ; 0590 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0594 _ 89. 04 24
        call    sheet_refresh                           ; 0597 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-24H]                    ; 059C _ 8B. 45, DC
        mov     ecx, dword [eax+8H]                     ; 059F _ 8B. 48, 08
        mov     eax, dword [ebp-24H]                    ; 05A2 _ 8B. 45, DC
        mov     edx, dword [eax+4H]                     ; 05A5 _ 8B. 50, 04
        mov     eax, dword [sheet_control]              ; 05A8 _ A1, 0000000C(d)
        mov     dword [esp+14H], ecx                    ; 05AD _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 05B1 _ 89. 54 24, 10
        mov     dword [esp+0CH], 0                      ; 05B5 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 0                       ; 05BD _ C7. 44 24, 08, 00000000
        mov     edx, dword [ebp-24H]                    ; 05C5 _ 8B. 55, DC
        mov     dword [esp+4H], edx                     ; 05C8 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 05CC _ 89. 04 24
        call    sheet_refresh                           ; 05CF _ E8, FFFFFFFC(rel)
        mov     edx, dword [task_console_g]             ; 05D4 _ 8B. 15, 00000000(d)
        mov     eax, dword [task_a]                     ; 05DA _ A1, 00000008(d)
        mov     ecx, dword [ebp-4CH]                    ; 05DF _ 8B. 4D, B4
        mov     dword [esp+8H], ecx                     ; 05E2 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 05E6 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 05EA _ 89. 04 24
        call    task_send_message                       ; 05ED _ E8, FFFFFFFC(rel)
        jmp     ?_010                                   ; 05F2 _ E9, 0000024A

?_005:  cmp     dword [ebp-50H], 0                      ; 05F7 _ 83. 7D, B0, 00
        jne     ?_006                                   ; 05FB _ 0F 85, 00000178
        mov     eax, dword [ebp-20H]                    ; 0601 _ 8B. 45, E0
        mov     dword [esp], eax                        ; 0604 _ 89. 04 24
        call    transfer_scancode                       ; 0607 _ E8, FFFFFFFC(rel)
        test    al, al                                  ; 060C _ 84. C0
        je      ?_010                                   ; 060E _ 0F 84, 0000022D
        cmp     dword [ebp-58H], 143                    ; 0614 _ 81. 7D, A8, 0000008F
        jg      ?_010                                   ; 061B _ 0F 8F, 00000220
        mov     eax, dword [ebp-58H]                    ; 0621 _ 8B. 45, A8
        lea     ecx, [eax+7H]                           ; 0624 _ 8D. 48, 07
        mov     eax, dword [sheet_win]                  ; 0627 _ A1, 00000000(d)
        mov     edx, dword [eax+4H]                     ; 062C _ 8B. 50, 04
        mov     eax, dword [sheet_win]                  ; 062F _ A1, 00000000(d)
        mov     eax, dword [eax]                        ; 0634 _ 8B. 00
        mov     dword [esp+18H], 43                     ; 0636 _ C7. 44 24, 18, 0000002B
        mov     dword [esp+14H], ecx                    ; 063E _ 89. 4C 24, 14
        mov     dword [esp+10H], 28                     ; 0642 _ C7. 44 24, 10, 0000001C
        mov     ecx, dword [ebp-58H]                    ; 064A _ 8B. 4D, A8
        mov     dword [esp+0CH], ecx                    ; 064D _ 89. 4C 24, 0C
        mov     dword [esp+8H], 7                       ; 0651 _ C7. 44 24, 08, 00000007
        mov     dword [esp+4H], edx                     ; 0659 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 065D _ 89. 04 24
        call    paint_rectangle                         ; 0660 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-58H]                    ; 0665 _ 8B. 45, A8
        lea     ecx, [eax+8H]                           ; 0668 _ 8D. 48, 08
        mov     edx, dword [sheet_win]                  ; 066B _ 8B. 15, 00000000(d)
        mov     eax, dword [sheet_control]              ; 0671 _ A1, 0000000C(d)
        mov     dword [esp+14H], 44                     ; 0676 _ C7. 44 24, 14, 0000002C
        mov     dword [esp+10H], ecx                    ; 067E _ 89. 4C 24, 10
        mov     dword [esp+0CH], 28                     ; 0682 _ C7. 44 24, 0C, 0000001C
        mov     ecx, dword [ebp-58H]                    ; 068A _ 8B. 4D, A8
        mov     dword [esp+8H], ecx                     ; 068D _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 0691 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0695 _ 89. 04 24
        call    sheet_refresh                           ; 0698 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-20H]                    ; 069D _ 8B. 45, E0
        mov     dword [esp], eax                        ; 06A0 _ 89. 04 24
        call    transfer_scancode                       ; 06A3 _ E8, FFFFFFFC(rel)
        mov     byte [ebp-5BH], al                      ; 06A8 _ 88. 45, A5
        movzx   eax, byte [ebp-5BH]                     ; 06AB _ 0F B6. 45, A5
        mov     byte [ebp-5AH], al                      ; 06AF _ 88. 45, A6
        mov     byte [ebp-59H], 0                       ; 06B2 _ C6. 45, A7, 00
        mov     edx, dword [sheet_win]                  ; 06B6 _ 8B. 15, 00000000(d)
        mov     eax, dword [sheet_control]              ; 06BC _ A1, 0000000C(d)
        mov     dword [esp+14H], 0                      ; 06C1 _ C7. 44 24, 14, 00000000
        lea     ecx, [ebp-5AH]                          ; 06C9 _ 8D. 4D, A6
        mov     dword [esp+10H], ecx                    ; 06CC _ 89. 4C 24, 10
        mov     dword [esp+0CH], 28                     ; 06D0 _ C7. 44 24, 0C, 0000001C
        mov     ecx, dword [ebp-58H]                    ; 06D8 _ 8B. 4D, A8
        mov     dword [esp+8H], ecx                     ; 06DB _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 06DF _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 06E3 _ 89. 04 24
        call    paint_string                            ; 06E6 _ E8, FFFFFFFC(rel)
        add     dword [ebp-58H], 8                      ; 06EB _ 83. 45, A8, 08
        mov     dword [ebp-10H], 1                      ; 06EF _ C7. 45, F0, 00000001
        mov     eax, dword [ebp-58H]                    ; 06F6 _ 8B. 45, A8
        lea     ebx, [eax+7H]                           ; 06F9 _ 8D. 58, 07
        mov     eax, dword [ebp-54H]                    ; 06FC _ 8B. 45, AC
        movzx   ecx, al                                 ; 06FF _ 0F B6. C8
        mov     eax, dword [sheet_win]                  ; 0702 _ A1, 00000000(d)
        mov     edx, dword [eax+4H]                     ; 0707 _ 8B. 50, 04
        mov     eax, dword [sheet_win]                  ; 070A _ A1, 00000000(d)
        mov     eax, dword [eax]                        ; 070F _ 8B. 00
        mov     dword [esp+18H], 43                     ; 0711 _ C7. 44 24, 18, 0000002B
        mov     dword [esp+14H], ebx                    ; 0719 _ 89. 5C 24, 14
        mov     dword [esp+10H], 28                     ; 071D _ C7. 44 24, 10, 0000001C
        mov     ebx, dword [ebp-58H]                    ; 0725 _ 8B. 5D, A8
        mov     dword [esp+0CH], ebx                    ; 0728 _ 89. 5C 24, 0C
        mov     dword [esp+8H], ecx                     ; 072C _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 0730 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0734 _ 89. 04 24
        call    paint_rectangle                         ; 0737 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-58H]                    ; 073C _ 8B. 45, A8
        lea     ecx, [eax+8H]                           ; 073F _ 8D. 48, 08
        mov     edx, dword [sheet_win]                  ; 0742 _ 8B. 15, 00000000(d)
        mov     eax, dword [sheet_control]              ; 0748 _ A1, 0000000C(d)
        mov     dword [esp+14H], 44                     ; 074D _ C7. 44 24, 14, 0000002C
        mov     dword [esp+10H], ecx                    ; 0755 _ 89. 4C 24, 10
        mov     dword [esp+0CH], 28                     ; 0759 _ C7. 44 24, 0C, 0000001C
        mov     ecx, dword [ebp-58H]                    ; 0761 _ 8B. 4D, A8
        mov     dword [esp+8H], ecx                     ; 0764 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 0768 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 076C _ 89. 04 24
        call    sheet_refresh                           ; 076F _ E8, FFFFFFFC(rel)
        jmp     ?_010                                   ; 0774 _ E9, 000000C8

?_006:  mov     eax, dword [ebp-20H]                    ; 0779 _ 8B. 45, E0
        mov     dword [esp], eax                        ; 077C _ 89. 04 24
        call    is_special_key                          ; 077F _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 0784 _ 85. C0
        jne     ?_010                                   ; 0786 _ 0F 85, 000000B5
        mov     eax, dword [ebp-20H]                    ; 078C _ 8B. 45, E0
        movzx   eax, al                                 ; 078F _ 0F B6. C0
        mov     edx, dword [task_console_g]             ; 0792 _ 8B. 15, 00000000(d)
        add     edx, 16                                 ; 0798 _ 83. C2, 10
        mov     dword [esp+4H], eax                     ; 079B _ 89. 44 24, 04
        mov     dword [esp], edx                        ; 079F _ 89. 14 24
        call    fifo8_put                               ; 07A2 _ E8, FFFFFFFC(rel)
        mov     dword [esp], keyinfo                    ; 07A7 _ C7. 04 24, 00000000(d)
        call    fifo8_status                            ; 07AE _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 07B3 _ 85. C0
        jne     ?_010                                   ; 07B5 _ 0F 85, 00000086
        mov     eax, dword [task_a]                     ; 07BB _ A1, 00000008(d)
        mov     dword [esp], eax                        ; 07C0 _ 89. 04 24
        call    task_sleep                              ; 07C3 _ E8, FFFFFFFC(rel)
        jmp     ?_010                                   ; 07C8 _ EB, 77

?_007:  mov     dword [esp], mouseinfo                  ; 07CA _ C7. 04 24, 00000000(d)
        call    fifo8_status                            ; 07D1 _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 07D6 _ 85. C0
        jz      ?_008                                   ; 07D8 _ 74, 23
        mov     ecx, dword [mouse_sheet]                ; 07DA _ 8B. 0D, 00000014(d)
        mov     edx, dword [back_sheet]                 ; 07E0 _ 8B. 15, 00000010(d)
        mov     eax, dword [sheet_control]              ; 07E6 _ A1, 0000000C(d)
        mov     dword [esp+8H], ecx                     ; 07EB _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 07EF _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 07F3 _ 89. 04 24
        call    show_mouse_info                         ; 07F6 _ E8, FFFFFFFC(rel)
        jmp     ?_010                                   ; 07FB _ EB, 44

?_008:  mov     dword [esp], timerinfo1.1766            ; 07FD _ C7. 04 24, 00000018(d)
        call    fifo8_status                            ; 0804 _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 0809 _ 85. C0
        jz      ?_009                                   ; 080B _ 74, 13
        call    io_sti                                  ; 080D _ E8, FFFFFFFC(rel)
        mov     dword [esp], timerinfo1.1766            ; 0812 _ C7. 04 24, 00000018(d)
        call    fifo8_get                               ; 0819 _ E8, FFFFFFFC(rel)
        jmp     ?_010                                   ; 081E _ EB, 21

?_009:  mov     dword [esp], timerinfo2.1767            ; 0820 _ C7. 04 24, 0000003C(d)
        call    fifo8_status                            ; 0827 _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 082C _ 85. C0
        jz      ?_010                                   ; 082E _ 74, 11
        call    io_sti                                  ; 0830 _ E8, FFFFFFFC(rel)
        mov     dword [esp], timerinfo2.1767            ; 0835 _ C7. 04 24, 0000003C(d)
        call    fifo8_get                               ; 083C _ E8, FFFFFFFC(rel)
?_010:  mov     dword [esp], timerinfo3.1768            ; 0841 _ C7. 04 24, 00000060(d)
        call    fifo8_status                            ; 0848 _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 084D _ 85. C0
        je      ?_014                                   ; 084F _ 0F 84, 000000DB
        mov     dword [esp], timerinfo3.1768            ; 0855 _ C7. 04 24, 00000060(d)
        call    fifo8_get                               ; 085C _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 0861 _ 89. 45, F4
        call    io_sti                                  ; 0864 _ E8, FFFFFFFC(rel)
        cmp     dword [ebp-0CH], 0                      ; 0869 _ 83. 7D, F4, 00
        jz      ?_011                                   ; 086D _ 74, 24
        mov     dword [esp+8H], 0                       ; 086F _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], timerinfo3.1768         ; 0877 _ C7. 44 24, 04, 00000060(d)
        mov     eax, dword [ebp-30H]                    ; 087F _ 8B. 45, D0
        mov     dword [esp], eax                        ; 0882 _ 89. 04 24
        call    timer_init                              ; 0885 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-54H], 0                      ; 088A _ C7. 45, AC, 00000000
        jmp     ?_012                                   ; 0891 _ EB, 22

?_011:  mov     dword [esp+8H], 1                       ; 0893 _ C7. 44 24, 08, 00000001
        mov     dword [esp+4H], timerinfo3.1768         ; 089B _ C7. 44 24, 04, 00000060(d)
        mov     eax, dword [ebp-30H]                    ; 08A3 _ 8B. 45, D0
        mov     dword [esp], eax                        ; 08A6 _ 89. 04 24
        call    timer_init                              ; 08A9 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-54H], 7                      ; 08AE _ C7. 45, AC, 00000007
?_012:  mov     dword [esp+4H], 50                      ; 08B5 _ C7. 44 24, 04, 00000032
        mov     eax, dword [ebp-30H]                    ; 08BD _ 8B. 45, D0
        mov     dword [esp], eax                        ; 08C0 _ 89. 04 24
        call    timer_settime                           ; 08C3 _ E8, FFFFFFFC(rel)
        cmp     dword [ebp-50H], 0                      ; 08C8 _ 83. 7D, B0, 00
        jnz     ?_013                                   ; 08CC _ 75, 2F
        mov     edx, dword [sheet_win]                  ; 08CE _ 8B. 15, 00000000(d)
        mov     eax, dword [sheet_control]              ; 08D4 _ A1, 0000000C(d)
        mov     ecx, dword [ebp-54H]                    ; 08D9 _ 8B. 4D, AC
        mov     dword [esp+10H], ecx                    ; 08DC _ 89. 4C 24, 10
        mov     dword [esp+0CH], 28                     ; 08E0 _ C7. 44 24, 0C, 0000001C
        mov     ecx, dword [ebp-58H]                    ; 08E8 _ 8B. 4D, A8
        mov     dword [esp+8H], ecx                     ; 08EB _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 08EF _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 08F3 _ 89. 04 24
        call    set_cursor                              ; 08F6 _ E8, FFFFFFFC(rel)
        jmp     ?_014                                   ; 08FB _ EB, 33

?_013:  mov     edx, dword [sheet_win]                  ; 08FD _ 8B. 15, 00000000(d)
        mov     eax, dword [sheet_control]              ; 0903 _ A1, 0000000C(d)
        mov     dword [esp+10H], 7                      ; 0908 _ C7. 44 24, 10, 00000007
        mov     dword [esp+0CH], 28                     ; 0910 _ C7. 44 24, 0C, 0000001C
        mov     ecx, dword [ebp-58H]                    ; 0918 _ 8B. 4D, A8
        mov     dword [esp+8H], ecx                     ; 091B _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 091F _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0923 _ 89. 04 24
        call    set_cursor                              ; 0926 _ E8, FFFFFFFC(rel)
        jmp     ?_001                                   ; 092B _ E9, FFFFFA97

?_014:  jmp     ?_001                                   ; 0930 _ E9, FFFFFA92
; CMain End of function

task_b_main:; Function begin
        push    ebp                                     ; 0935 _ 55
        mov     ebp, esp                                ; 0936 _ 89. E5
        sub     esp, 104                                ; 0938 _ 83. EC, 68
        mov     eax, dword [ebp+8H]                     ; 093B _ 8B. 45, 08
        mov     dword [ebp-4CH], eax                    ; 093E _ 89. 45, B4
; Note: Absolute memory address without relocation
        mov     eax, dword [gs:14H]                     ; 0941 _ 65: A1, 00000014
        mov     dword [ebp-0CH], eax                    ; 0947 _ 89. 45, F4
        xor     eax, eax                                ; 094A _ 31. C0
        mov     edx, dword [back_sheet]                 ; 094C _ 8B. 15, 00000010(d)
        mov     eax, dword [sheet_control]              ; 0952 _ A1, 0000000C(d)
        mov     dword [esp+14H], 7                      ; 0957 _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_285                  ; 095F _ C7. 44 24, 10, 0000000F(d)
        mov     dword [esp+0CH], 160                    ; 0967 _ C7. 44 24, 0C, 000000A0
        mov     dword [esp+8H], 0                       ; 096F _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], edx                     ; 0977 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 097B _ 89. 04 24
        call    paint_string                            ; 097E _ E8, FFFFFFFC(rel)
        mov     dword [ebp-38H], 0                      ; 0983 _ C7. 45, C8, 00000000
        mov     dword [ebp-34H], 0                      ; 098A _ C7. 45, CC, 00000000
        mov     dword [esp+0CH], 0                      ; 0991 _ C7. 44 24, 0C, 00000000
        lea     eax, [ebp-14H]                          ; 0999 _ 8D. 45, EC
        mov     dword [esp+8H], eax                     ; 099C _ 89. 44 24, 08
        mov     dword [esp+4H], 8                       ; 09A0 _ C7. 44 24, 04, 00000008
        lea     eax, [ebp-30H]                          ; 09A8 _ 8D. 45, D0
        mov     dword [esp], eax                        ; 09AB _ 89. 04 24
        call    fifo8_init                              ; 09AE _ E8, FFFFFFFC(rel)
        call    timer_alloc                             ; 09B3 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-38H], eax                    ; 09B8 _ 89. 45, C8
        mov     dword [esp+8H], 123                     ; 09BB _ C7. 44 24, 08, 0000007B
        lea     eax, [ebp-30H]                          ; 09C3 _ 8D. 45, D0
        mov     dword [esp+4H], eax                     ; 09C6 _ 89. 44 24, 04
        mov     eax, dword [ebp-38H]                    ; 09CA _ 8B. 45, C8
        mov     dword [esp], eax                        ; 09CD _ 89. 04 24
        call    timer_init                              ; 09D0 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 100                     ; 09D5 _ C7. 44 24, 04, 00000064
        mov     eax, dword [ebp-38H]                    ; 09DD _ 8B. 45, C8
        mov     dword [esp], eax                        ; 09E0 _ 89. 04 24
        call    timer_settime                           ; 09E3 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-40H], 0                      ; 09E8 _ C7. 45, C0, 00000000
        mov     dword [ebp-3CH], 0                      ; 09EF _ C7. 45, C4, 00000000
?_015:  add     dword [ebp-40H], 1                      ; 09F6 _ 83. 45, C0, 01
        call    io_cli                                  ; 09FA _ E8, FFFFFFFC(rel)
        lea     eax, [ebp-30H]                          ; 09FF _ 8D. 45, D0
        mov     dword [esp], eax                        ; 0A02 _ 89. 04 24
        call    fifo8_status                            ; 0A05 _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 0A0A _ 85. C0
        jnz     ?_016                                   ; 0A0C _ 75, 07
        call    io_sti                                  ; 0A0E _ E8, FFFFFFFC(rel)
        jmp     ?_017                                   ; 0A13 _ EB, 6B

?_016:  lea     eax, [ebp-30H]                          ; 0A15 _ 8D. 45, D0
        mov     dword [esp], eax                        ; 0A18 _ 89. 04 24
        call    fifo8_get                               ; 0A1B _ E8, FFFFFFFC(rel)
        mov     dword [ebp-34H], eax                    ; 0A20 _ 89. 45, CC
        call    io_sti                                  ; 0A23 _ E8, FFFFFFFC(rel)
        cmp     dword [ebp-34H], 123                    ; 0A28 _ 83. 7D, CC, 7B
        jnz     ?_017                                   ; 0A2C _ 75, 52
        mov     edx, dword [back_sheet]                 ; 0A2E _ 8B. 15, 00000010(d)
        mov     eax, dword [sheet_control]              ; 0A34 _ A1, 0000000C(d)
        mov     dword [esp+14H], 7                      ; 0A39 _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_286                  ; 0A41 _ C7. 44 24, 10, 0000001C(d)
        mov     dword [esp+0CH], 176                    ; 0A49 _ C7. 44 24, 0C, 000000B0
        mov     ecx, dword [ebp-3CH]                    ; 0A51 _ 8B. 4D, C4
        mov     dword [esp+8H], ecx                     ; 0A54 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 0A58 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0A5C _ 89. 04 24
        call    paint_string                            ; 0A5F _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 100                     ; 0A64 _ C7. 44 24, 04, 00000064
        mov     eax, dword [ebp-38H]                    ; 0A6C _ 8B. 45, C8
        mov     dword [esp], eax                        ; 0A6F _ 89. 04 24
        call    timer_settime                           ; 0A72 _ E8, FFFFFFFC(rel)
        add     dword [ebp-3CH], 8                      ; 0A77 _ 83. 45, C4, 08
        jmp     ?_015                                   ; 0A7B _ E9, FFFFFF76

?_017:  jmp     ?_015                                   ; 0A80 _ E9, FFFFFF71
; task_b_main End of function

init_screeninfo:; Function begin
        push    ebp                                     ; 0A85 _ 55
        mov     ebp, esp                                ; 0A86 _ 89. E5
        mov     eax, dword [VRAM_ADDRESS]               ; 0A88 _ A1, 00000000(d)
        mov     edx, eax                                ; 0A8D _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0A8F _ 8B. 45, 08
        mov     dword [eax], edx                        ; 0A92 _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 0A94 _ 8B. 45, 08
; Note: Length-changing prefix causes delay on Intel processors
        mov     word [eax+4H], 640                      ; 0A97 _ 66: C7. 40, 04, 0280
        mov     eax, dword [ebp+8H]                     ; 0A9D _ 8B. 45, 08
; Note: Length-changing prefix causes delay on Intel processors
        mov     word [eax+6H], 480                      ; 0AA0 _ 66: C7. 40, 06, 01E0
        pop     ebp                                     ; 0AA6 _ 5D
        ret                                             ; 0AA7 _ C3
; init_screeninfo End of function

init_palette:; Function begin
        push    ebp                                     ; 0AA8 _ 55
        mov     ebp, esp                                ; 0AA9 _ 89. E5
        sub     esp, 24                                 ; 0AAB _ 83. EC, 18
        mov     dword [esp+8H], table_rgb.1775          ; 0AAE _ C7. 44 24, 08, 00000120(d)
        mov     dword [esp+4H], 15                      ; 0AB6 _ C7. 44 24, 04, 0000000F
        mov     dword [esp], 0                          ; 0ABE _ C7. 04 24, 00000000
        call    set_palette                             ; 0AC5 _ E8, FFFFFFFC(rel)
        nop                                             ; 0ACA _ 90
        leave                                           ; 0ACB _ C9
        ret                                             ; 0ACC _ C3
; init_palette End of function

set_palette:; Function begin
        push    ebp                                     ; 0ACD _ 55
        mov     ebp, esp                                ; 0ACE _ 89. E5
        sub     esp, 40                                 ; 0AD0 _ 83. EC, 28
        call    io_load_eflags                          ; 0AD3 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 0AD8 _ 89. 45, F4
        call    io_cli                                  ; 0ADB _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 0AE0 _ 8B. 45, 08
        mov     dword [esp+4H], eax                     ; 0AE3 _ 89. 44 24, 04
        mov     dword [esp], 968                        ; 0AE7 _ C7. 04 24, 000003C8
        call    io_out8                                 ; 0AEE _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 0AF3 _ 8B. 45, 08
        mov     dword [ebp-10H], eax                    ; 0AF6 _ 89. 45, F0
        jmp     ?_019                                   ; 0AF9 _ EB, 62

?_018:  mov     eax, dword [ebp+10H]                    ; 0AFB _ 8B. 45, 10
        movzx   eax, byte [eax]                         ; 0AFE _ 0F B6. 00
        shr     al, 2                                   ; 0B01 _ C0. E8, 02
        movzx   eax, al                                 ; 0B04 _ 0F B6. C0
        mov     dword [esp+4H], eax                     ; 0B07 _ 89. 44 24, 04
        mov     dword [esp], 969                        ; 0B0B _ C7. 04 24, 000003C9
        call    io_out8                                 ; 0B12 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0B17 _ 8B. 45, 10
        add     eax, 1                                  ; 0B1A _ 83. C0, 01
        movzx   eax, byte [eax]                         ; 0B1D _ 0F B6. 00
        shr     al, 2                                   ; 0B20 _ C0. E8, 02
        movzx   eax, al                                 ; 0B23 _ 0F B6. C0
        mov     dword [esp+4H], eax                     ; 0B26 _ 89. 44 24, 04
        mov     dword [esp], 969                        ; 0B2A _ C7. 04 24, 000003C9
        call    io_out8                                 ; 0B31 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0B36 _ 8B. 45, 10
        add     eax, 2                                  ; 0B39 _ 83. C0, 02
        movzx   eax, byte [eax]                         ; 0B3C _ 0F B6. 00
        shr     al, 2                                   ; 0B3F _ C0. E8, 02
        movzx   eax, al                                 ; 0B42 _ 0F B6. C0
        mov     dword [esp+4H], eax                     ; 0B45 _ 89. 44 24, 04
        mov     dword [esp], 969                        ; 0B49 _ C7. 04 24, 000003C9
        call    io_out8                                 ; 0B50 _ E8, FFFFFFFC(rel)
        add     dword [ebp+10H], 3                      ; 0B55 _ 83. 45, 10, 03
        add     dword [ebp-10H], 1                      ; 0B59 _ 83. 45, F0, 01
?_019:  mov     eax, dword [ebp-10H]                    ; 0B5D _ 8B. 45, F0
        cmp     eax, dword [ebp+0CH]                    ; 0B60 _ 3B. 45, 0C
        jle     ?_018                                   ; 0B63 _ 7E, 96
        mov     eax, dword [ebp-0CH]                    ; 0B65 _ 8B. 45, F4
        mov     dword [esp], eax                        ; 0B68 _ 89. 04 24
        call    io_store_eflags                         ; 0B6B _ E8, FFFFFFFC(rel)
        nop                                             ; 0B70 _ 90
        leave                                           ; 0B71 _ C9
        ret                                             ; 0B72 _ C3
; set_palette End of function

paint_rectangle:; Function begin
        push    ebp                                     ; 0B73 _ 55
        mov     ebp, esp                                ; 0B74 _ 89. E5
        sub     esp, 20                                 ; 0B76 _ 83. EC, 14
        mov     eax, dword [ebp+10H]                    ; 0B79 _ 8B. 45, 10
        mov     byte [ebp-14H], al                      ; 0B7C _ 88. 45, EC
        mov     eax, dword [ebp+18H]                    ; 0B7F _ 8B. 45, 18
        mov     dword [ebp-4H], eax                     ; 0B82 _ 89. 45, FC
        jmp     ?_023                                   ; 0B85 _ EB, 33

?_020:  mov     eax, dword [ebp+14H]                    ; 0B87 _ 8B. 45, 14
        mov     dword [ebp-8H], eax                     ; 0B8A _ 89. 45, F8
        jmp     ?_022                                   ; 0B8D _ EB, 1F

?_021:  mov     eax, dword [ebp-4H]                     ; 0B8F _ 8B. 45, FC
        imul    eax, dword [ebp+0CH]                    ; 0B92 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0B96 _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 0B98 _ 8B. 45, F8
        add     eax, edx                                ; 0B9B _ 01. D0
        mov     edx, eax                                ; 0B9D _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0B9F _ 8B. 45, 08
        add     edx, eax                                ; 0BA2 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0BA4 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0BA8 _ 88. 02
        add     dword [ebp-8H], 1                       ; 0BAA _ 83. 45, F8, 01
?_022:  mov     eax, dword [ebp-8H]                     ; 0BAE _ 8B. 45, F8
        cmp     eax, dword [ebp+1CH]                    ; 0BB1 _ 3B. 45, 1C
        jle     ?_021                                   ; 0BB4 _ 7E, D9
        add     dword [ebp-4H], 1                       ; 0BB6 _ 83. 45, FC, 01
?_023:  mov     eax, dword [ebp-4H]                     ; 0BBA _ 8B. 45, FC
        cmp     eax, dword [ebp+20H]                    ; 0BBD _ 3B. 45, 20
        jle     ?_020                                   ; 0BC0 _ 7E, C5
        leave                                           ; 0BC2 _ C9
        ret                                             ; 0BC3 _ C3
; paint_rectangle End of function

init_desktop:; Function begin
        push    ebp                                     ; 0BC4 _ 55
        mov     ebp, esp                                ; 0BC5 _ 89. E5
        push    ebx                                     ; 0BC7 _ 53
        sub     esp, 28                                 ; 0BC8 _ 83. EC, 1C
        mov     eax, dword [ebp+10H]                    ; 0BCB _ 8B. 45, 10
        lea     edx, [eax-1DH]                          ; 0BCE _ 8D. 50, E3
        mov     eax, dword [ebp+0CH]                    ; 0BD1 _ 8B. 45, 0C
        sub     eax, 1                                  ; 0BD4 _ 83. E8, 01
        mov     dword [esp+18H], edx                    ; 0BD7 _ 89. 54 24, 18
        mov     dword [esp+14H], eax                    ; 0BDB _ 89. 44 24, 14
        mov     dword [esp+10H], 0                      ; 0BDF _ C7. 44 24, 10, 00000000
        mov     dword [esp+0CH], 0                      ; 0BE7 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 2                       ; 0BEF _ C7. 44 24, 08, 00000002
        mov     eax, dword [ebp+0CH]                    ; 0BF7 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0BFA _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0BFE _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0C01 _ 89. 04 24
        call    paint_rectangle                         ; 0C04 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0C09 _ 8B. 45, 10
        lea     ecx, [eax-1CH]                          ; 0C0C _ 8D. 48, E4
        mov     eax, dword [ebp+0CH]                    ; 0C0F _ 8B. 45, 0C
        lea     edx, [eax-1H]                           ; 0C12 _ 8D. 50, FF
        mov     eax, dword [ebp+10H]                    ; 0C15 _ 8B. 45, 10
        sub     eax, 28                                 ; 0C18 _ 83. E8, 1C
        mov     dword [esp+18H], ecx                    ; 0C1B _ 89. 4C 24, 18
        mov     dword [esp+14H], edx                    ; 0C1F _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 0C23 _ 89. 44 24, 10
        mov     dword [esp+0CH], 0                      ; 0C27 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 8                       ; 0C2F _ C7. 44 24, 08, 00000008
        mov     eax, dword [ebp+0CH]                    ; 0C37 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0C3A _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0C3E _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0C41 _ 89. 04 24
        call    paint_rectangle                         ; 0C44 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0C49 _ 8B. 45, 10
        lea     ecx, [eax-1BH]                          ; 0C4C _ 8D. 48, E5
        mov     eax, dword [ebp+0CH]                    ; 0C4F _ 8B. 45, 0C
        lea     edx, [eax-1H]                           ; 0C52 _ 8D. 50, FF
        mov     eax, dword [ebp+10H]                    ; 0C55 _ 8B. 45, 10
        sub     eax, 27                                 ; 0C58 _ 83. E8, 1B
        mov     dword [esp+18H], ecx                    ; 0C5B _ 89. 4C 24, 18
        mov     dword [esp+14H], edx                    ; 0C5F _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 0C63 _ 89. 44 24, 10
        mov     dword [esp+0CH], 0                      ; 0C67 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 7                       ; 0C6F _ C7. 44 24, 08, 00000007
        mov     eax, dword [ebp+0CH]                    ; 0C77 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0C7A _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0C7E _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0C81 _ 89. 04 24
        call    paint_rectangle                         ; 0C84 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0C89 _ 8B. 45, 10
        lea     ecx, [eax-1H]                           ; 0C8C _ 8D. 48, FF
        mov     eax, dword [ebp+0CH]                    ; 0C8F _ 8B. 45, 0C
        lea     edx, [eax-1H]                           ; 0C92 _ 8D. 50, FF
        mov     eax, dword [ebp+10H]                    ; 0C95 _ 8B. 45, 10
        sub     eax, 26                                 ; 0C98 _ 83. E8, 1A
        mov     dword [esp+18H], ecx                    ; 0C9B _ 89. 4C 24, 18
        mov     dword [esp+14H], edx                    ; 0C9F _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 0CA3 _ 89. 44 24, 10
        mov     dword [esp+0CH], 0                      ; 0CA7 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 8                       ; 0CAF _ C7. 44 24, 08, 00000008
        mov     eax, dword [ebp+0CH]                    ; 0CB7 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0CBA _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0CBE _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0CC1 _ 89. 04 24
        call    paint_rectangle                         ; 0CC4 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0CC9 _ 8B. 45, 10
        lea     edx, [eax-18H]                          ; 0CCC _ 8D. 50, E8
        mov     eax, dword [ebp+10H]                    ; 0CCF _ 8B. 45, 10
        sub     eax, 24                                 ; 0CD2 _ 83. E8, 18
        mov     dword [esp+18H], edx                    ; 0CD5 _ 89. 54 24, 18
        mov     dword [esp+14H], 59                     ; 0CD9 _ C7. 44 24, 14, 0000003B
        mov     dword [esp+10H], eax                    ; 0CE1 _ 89. 44 24, 10
        mov     dword [esp+0CH], 3                      ; 0CE5 _ C7. 44 24, 0C, 00000003
        mov     dword [esp+8H], 7                       ; 0CED _ C7. 44 24, 08, 00000007
        mov     eax, dword [ebp+0CH]                    ; 0CF5 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0CF8 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0CFC _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0CFF _ 89. 04 24
        call    paint_rectangle                         ; 0D02 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0D07 _ 8B. 45, 10
        lea     edx, [eax-4H]                           ; 0D0A _ 8D. 50, FC
        mov     eax, dword [ebp+10H]                    ; 0D0D _ 8B. 45, 10
        sub     eax, 24                                 ; 0D10 _ 83. E8, 18
        mov     dword [esp+18H], edx                    ; 0D13 _ 89. 54 24, 18
        mov     dword [esp+14H], 2                      ; 0D17 _ C7. 44 24, 14, 00000002
        mov     dword [esp+10H], eax                    ; 0D1F _ 89. 44 24, 10
        mov     dword [esp+0CH], 2                      ; 0D23 _ C7. 44 24, 0C, 00000002
        mov     dword [esp+8H], 7                       ; 0D2B _ C7. 44 24, 08, 00000007
        mov     eax, dword [ebp+0CH]                    ; 0D33 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0D36 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0D3A _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0D3D _ 89. 04 24
        call    paint_rectangle                         ; 0D40 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0D45 _ 8B. 45, 10
        lea     edx, [eax-4H]                           ; 0D48 _ 8D. 50, FC
        mov     eax, dword [ebp+10H]                    ; 0D4B _ 8B. 45, 10
        sub     eax, 4                                  ; 0D4E _ 83. E8, 04
        mov     dword [esp+18H], edx                    ; 0D51 _ 89. 54 24, 18
        mov     dword [esp+14H], 59                     ; 0D55 _ C7. 44 24, 14, 0000003B
        mov     dword [esp+10H], eax                    ; 0D5D _ 89. 44 24, 10
        mov     dword [esp+0CH], 3                      ; 0D61 _ C7. 44 24, 0C, 00000003
        mov     dword [esp+8H], 2                       ; 0D69 _ C7. 44 24, 08, 00000002
        mov     eax, dword [ebp+0CH]                    ; 0D71 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0D74 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0D78 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0D7B _ 89. 04 24
        call    paint_rectangle                         ; 0D7E _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0D83 _ 8B. 45, 10
        lea     edx, [eax-5H]                           ; 0D86 _ 8D. 50, FB
        mov     eax, dword [ebp+10H]                    ; 0D89 _ 8B. 45, 10
        sub     eax, 23                                 ; 0D8C _ 83. E8, 17
        mov     dword [esp+18H], edx                    ; 0D8F _ 89. 54 24, 18
        mov     dword [esp+14H], 59                     ; 0D93 _ C7. 44 24, 14, 0000003B
        mov     dword [esp+10H], eax                    ; 0D9B _ 89. 44 24, 10
        mov     dword [esp+0CH], 59                     ; 0D9F _ C7. 44 24, 0C, 0000003B
        mov     dword [esp+8H], 2                       ; 0DA7 _ C7. 44 24, 08, 00000002
        mov     eax, dword [ebp+0CH]                    ; 0DAF _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0DB2 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0DB6 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0DB9 _ 89. 04 24
        call    paint_rectangle                         ; 0DBC _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0DC1 _ 8B. 45, 10
        lea     edx, [eax-3H]                           ; 0DC4 _ 8D. 50, FD
        mov     eax, dword [ebp+10H]                    ; 0DC7 _ 8B. 45, 10
        sub     eax, 3                                  ; 0DCA _ 83. E8, 03
        mov     dword [esp+18H], edx                    ; 0DCD _ 89. 54 24, 18
        mov     dword [esp+14H], 59                     ; 0DD1 _ C7. 44 24, 14, 0000003B
        mov     dword [esp+10H], eax                    ; 0DD9 _ 89. 44 24, 10
        mov     dword [esp+0CH], 2                      ; 0DDD _ C7. 44 24, 0C, 00000002
        mov     dword [esp+8H], 0                       ; 0DE5 _ C7. 44 24, 08, 00000000
        mov     eax, dword [ebp+0CH]                    ; 0DED _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0DF0 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0DF4 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0DF7 _ 89. 04 24
        call    paint_rectangle                         ; 0DFA _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0DFF _ 8B. 45, 10
        lea     edx, [eax-3H]                           ; 0E02 _ 8D. 50, FD
        mov     eax, dword [ebp+10H]                    ; 0E05 _ 8B. 45, 10
        sub     eax, 24                                 ; 0E08 _ 83. E8, 18
        mov     dword [esp+18H], edx                    ; 0E0B _ 89. 54 24, 18
        mov     dword [esp+14H], 60                     ; 0E0F _ C7. 44 24, 14, 0000003C
        mov     dword [esp+10H], eax                    ; 0E17 _ 89. 44 24, 10
        mov     dword [esp+0CH], 60                     ; 0E1B _ C7. 44 24, 0C, 0000003C
        mov     dword [esp+8H], 0                       ; 0E23 _ C7. 44 24, 08, 00000000
        mov     eax, dword [ebp+0CH]                    ; 0E2B _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0E2E _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0E32 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0E35 _ 89. 04 24
        call    paint_rectangle                         ; 0E38 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0E3D _ 8B. 45, 10
        lea     ebx, [eax-18H]                          ; 0E40 _ 8D. 58, E8
        mov     eax, dword [ebp+0CH]                    ; 0E43 _ 8B. 45, 0C
        lea     ecx, [eax-4H]                           ; 0E46 _ 8D. 48, FC
        mov     eax, dword [ebp+10H]                    ; 0E49 _ 8B. 45, 10
        lea     edx, [eax-18H]                          ; 0E4C _ 8D. 50, E8
        mov     eax, dword [ebp+0CH]                    ; 0E4F _ 8B. 45, 0C
        sub     eax, 47                                 ; 0E52 _ 83. E8, 2F
        mov     dword [esp+18H], ebx                    ; 0E55 _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 0E59 _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 0E5D _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 0E61 _ 89. 44 24, 0C
        mov     dword [esp+8H], 2                       ; 0E65 _ C7. 44 24, 08, 00000002
        mov     eax, dword [ebp+0CH]                    ; 0E6D _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0E70 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0E74 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0E77 _ 89. 04 24
        call    paint_rectangle                         ; 0E7A _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0E7F _ 8B. 45, 10
        lea     ebx, [eax-4H]                           ; 0E82 _ 8D. 58, FC
        mov     eax, dword [ebp+0CH]                    ; 0E85 _ 8B. 45, 0C
        lea     ecx, [eax-2FH]                          ; 0E88 _ 8D. 48, D1
        mov     eax, dword [ebp+10H]                    ; 0E8B _ 8B. 45, 10
        lea     edx, [eax-17H]                          ; 0E8E _ 8D. 50, E9
        mov     eax, dword [ebp+0CH]                    ; 0E91 _ 8B. 45, 0C
        sub     eax, 47                                 ; 0E94 _ 83. E8, 2F
        mov     dword [esp+18H], ebx                    ; 0E97 _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 0E9B _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 0E9F _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 0EA3 _ 89. 44 24, 0C
        mov     dword [esp+8H], 2                       ; 0EA7 _ C7. 44 24, 08, 00000002
        mov     eax, dword [ebp+0CH]                    ; 0EAF _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0EB2 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0EB6 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0EB9 _ 89. 04 24
        call    paint_rectangle                         ; 0EBC _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0EC1 _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 0EC4 _ 8D. 58, FD
        mov     eax, dword [ebp+0CH]                    ; 0EC7 _ 8B. 45, 0C
        lea     ecx, [eax-4H]                           ; 0ECA _ 8D. 48, FC
        mov     eax, dword [ebp+10H]                    ; 0ECD _ 8B. 45, 10
        lea     edx, [eax-3H]                           ; 0ED0 _ 8D. 50, FD
        mov     eax, dword [ebp+0CH]                    ; 0ED3 _ 8B. 45, 0C
        sub     eax, 47                                 ; 0ED6 _ 83. E8, 2F
        mov     dword [esp+18H], ebx                    ; 0ED9 _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 0EDD _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 0EE1 _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 0EE5 _ 89. 44 24, 0C
        mov     dword [esp+8H], 7                       ; 0EE9 _ C7. 44 24, 08, 00000007
        mov     eax, dword [ebp+0CH]                    ; 0EF1 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0EF4 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0EF8 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0EFB _ 89. 04 24
        call    paint_rectangle                         ; 0EFE _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0F03 _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 0F06 _ 8D. 58, FD
        mov     eax, dword [ebp+0CH]                    ; 0F09 _ 8B. 45, 0C
        lea     ecx, [eax-3H]                           ; 0F0C _ 8D. 48, FD
        mov     eax, dword [ebp+10H]                    ; 0F0F _ 8B. 45, 10
        lea     edx, [eax-18H]                          ; 0F12 _ 8D. 50, E8
        mov     eax, dword [ebp+0CH]                    ; 0F15 _ 8B. 45, 0C
        sub     eax, 3                                  ; 0F18 _ 83. E8, 03
        mov     dword [esp+18H], ebx                    ; 0F1B _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 0F1F _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 0F23 _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 0F27 _ 89. 44 24, 0C
        mov     dword [esp+8H], 7                       ; 0F2B _ C7. 44 24, 08, 00000007
        mov     eax, dword [ebp+0CH]                    ; 0F33 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0F36 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0F3A _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0F3D _ 89. 04 24
        call    paint_rectangle                         ; 0F40 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 0F45 _ 83. C4, 1C
        pop     ebx                                     ; 0F48 _ 5B
        pop     ebp                                     ; 0F49 _ 5D
        ret                                             ; 0F4A _ C3
; init_desktop End of function

init_mouse_position:; Function begin
        push    ebp                                     ; 0F4B _ 55
        mov     ebp, esp                                ; 0F4C _ 89. E5
        sub     esp, 16                                 ; 0F4E _ 83. EC, 10
        movzx   eax, word [?_302]                       ; 0F51 _ 0F B7. 05, 000000A4(d)
        cwde                                            ; 0F58 _ 98
        mov     dword [ebp-8H], eax                     ; 0F59 _ 89. 45, F8
        movzx   eax, word [?_303]                       ; 0F5C _ 0F B7. 05, 000000A6(d)
        cwde                                            ; 0F63 _ 98
        mov     dword [ebp-4H], eax                     ; 0F64 _ 89. 45, FC
        mov     eax, dword [ebp-8H]                     ; 0F67 _ 8B. 45, F8
        sub     eax, 16                                 ; 0F6A _ 83. E8, 10
        mov     edx, eax                                ; 0F6D _ 89. C2
        shr     edx, 31                                 ; 0F6F _ C1. EA, 1F
        add     eax, edx                                ; 0F72 _ 01. D0
        sar     eax, 1                                  ; 0F74 _ D1. F8
        mov     dword [mouse_x], eax                    ; 0F76 _ A3, 000001C8(d)
        mov     eax, dword [ebp-4H]                     ; 0F7B _ 8B. 45, FC
        sub     eax, 44                                 ; 0F7E _ 83. E8, 2C
        mov     edx, eax                                ; 0F81 _ 89. C2
        shr     edx, 31                                 ; 0F83 _ C1. EA, 1F
        add     eax, edx                                ; 0F86 _ 01. D0
        sar     eax, 1                                  ; 0F88 _ D1. F8
        mov     dword [mouse_y], eax                    ; 0F8A _ A3, 000001CC(d)
        leave                                           ; 0F8F _ C9
        ret                                             ; 0F90 _ C3
; init_mouse_position End of function

paint_font:; Function begin
        push    ebp                                     ; 0F91 _ 55
        mov     ebp, esp                                ; 0F92 _ 89. E5
        sub     esp, 20                                 ; 0F94 _ 83. EC, 14
        mov     eax, dword [ebp+1CH]                    ; 0F97 _ 8B. 45, 1C
        mov     byte [ebp-14H], al                      ; 0F9A _ 88. 45, EC
        mov     dword [ebp-4H], 0                       ; 0F9D _ C7. 45, FC, 00000000
        jmp     ?_033                                   ; 0FA4 _ E9, 0000016E

?_024:  mov     edx, dword [ebp-4H]                     ; 0FA9 _ 8B. 55, FC
        mov     eax, dword [ebp+18H]                    ; 0FAC _ 8B. 45, 18
        add     eax, edx                                ; 0FAF _ 01. D0
        movzx   eax, byte [eax]                         ; 0FB1 _ 0F B6. 00
        mov     byte [ebp-5H], al                       ; 0FB4 _ 88. 45, FB
        movzx   eax, byte [ebp-5H]                      ; 0FB7 _ 0F B6. 45, FB
        test    al, al                                  ; 0FBB _ 84. C0
        jns     ?_025                                   ; 0FBD _ 79, 20
        mov     eax, dword [ebp-4H]                     ; 0FBF _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 0FC2 _ 8B. 55, 14
        add     eax, edx                                ; 0FC5 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0FC7 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0FCB _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0FCD _ 8B. 45, 10
        add     eax, edx                                ; 0FD0 _ 01. D0
        mov     edx, eax                                ; 0FD2 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0FD4 _ 8B. 45, 08
        add     edx, eax                                ; 0FD7 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0FD9 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0FDD _ 88. 02
?_025:  movzx   eax, byte [ebp-5H]                      ; 0FDF _ 0F B6. 45, FB
        and     eax, 40H                                ; 0FE3 _ 83. E0, 40
        test    eax, eax                                ; 0FE6 _ 85. C0
        jz      ?_026                                   ; 0FE8 _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 0FEA _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 0FED _ 8B. 55, 14
        add     eax, edx                                ; 0FF0 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0FF2 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0FF6 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0FF8 _ 8B. 45, 10
        add     eax, edx                                ; 0FFB _ 01. D0
        lea     edx, [eax+1H]                           ; 0FFD _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 1000 _ 8B. 45, 08
        add     edx, eax                                ; 1003 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 1005 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 1009 _ 88. 02
?_026:  movzx   eax, byte [ebp-5H]                      ; 100B _ 0F B6. 45, FB
        and     eax, 20H                                ; 100F _ 83. E0, 20
        test    eax, eax                                ; 1012 _ 85. C0
        jz      ?_027                                   ; 1014 _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 1016 _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 1019 _ 8B. 55, 14
        add     eax, edx                                ; 101C _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 101E _ 0F AF. 45, 0C
        mov     edx, eax                                ; 1022 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 1024 _ 8B. 45, 10
        add     eax, edx                                ; 1027 _ 01. D0
        lea     edx, [eax+2H]                           ; 1029 _ 8D. 50, 02
        mov     eax, dword [ebp+8H]                     ; 102C _ 8B. 45, 08
        add     edx, eax                                ; 102F _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 1031 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 1035 _ 88. 02
?_027:  movzx   eax, byte [ebp-5H]                      ; 1037 _ 0F B6. 45, FB
        and     eax, 10H                                ; 103B _ 83. E0, 10
        test    eax, eax                                ; 103E _ 85. C0
        jz      ?_028                                   ; 1040 _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 1042 _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 1045 _ 8B. 55, 14
        add     eax, edx                                ; 1048 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 104A _ 0F AF. 45, 0C
        mov     edx, eax                                ; 104E _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 1050 _ 8B. 45, 10
        add     eax, edx                                ; 1053 _ 01. D0
        lea     edx, [eax+3H]                           ; 1055 _ 8D. 50, 03
        mov     eax, dword [ebp+8H]                     ; 1058 _ 8B. 45, 08
        add     edx, eax                                ; 105B _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 105D _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 1061 _ 88. 02
?_028:  movzx   eax, byte [ebp-5H]                      ; 1063 _ 0F B6. 45, FB
        and     eax, 08H                                ; 1067 _ 83. E0, 08
        test    eax, eax                                ; 106A _ 85. C0
        jz      ?_029                                   ; 106C _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 106E _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 1071 _ 8B. 55, 14
        add     eax, edx                                ; 1074 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 1076 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 107A _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 107C _ 8B. 45, 10
        add     eax, edx                                ; 107F _ 01. D0
        lea     edx, [eax+4H]                           ; 1081 _ 8D. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1084 _ 8B. 45, 08
        add     edx, eax                                ; 1087 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 1089 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 108D _ 88. 02
?_029:  movzx   eax, byte [ebp-5H]                      ; 108F _ 0F B6. 45, FB
        and     eax, 04H                                ; 1093 _ 83. E0, 04
        test    eax, eax                                ; 1096 _ 85. C0
        jz      ?_030                                   ; 1098 _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 109A _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 109D _ 8B. 55, 14
        add     eax, edx                                ; 10A0 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 10A2 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 10A6 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 10A8 _ 8B. 45, 10
        add     eax, edx                                ; 10AB _ 01. D0
        lea     edx, [eax+5H]                           ; 10AD _ 8D. 50, 05
        mov     eax, dword [ebp+8H]                     ; 10B0 _ 8B. 45, 08
        add     edx, eax                                ; 10B3 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 10B5 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 10B9 _ 88. 02
?_030:  movzx   eax, byte [ebp-5H]                      ; 10BB _ 0F B6. 45, FB
        and     eax, 02H                                ; 10BF _ 83. E0, 02
        test    eax, eax                                ; 10C2 _ 85. C0
        jz      ?_031                                   ; 10C4 _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 10C6 _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 10C9 _ 8B. 55, 14
        add     eax, edx                                ; 10CC _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 10CE _ 0F AF. 45, 0C
        mov     edx, eax                                ; 10D2 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 10D4 _ 8B. 45, 10
        add     eax, edx                                ; 10D7 _ 01. D0
        lea     edx, [eax+6H]                           ; 10D9 _ 8D. 50, 06
        mov     eax, dword [ebp+8H]                     ; 10DC _ 8B. 45, 08
        add     edx, eax                                ; 10DF _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 10E1 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 10E5 _ 88. 02
?_031:  movzx   eax, byte [ebp-5H]                      ; 10E7 _ 0F B6. 45, FB
        and     eax, 01H                                ; 10EB _ 83. E0, 01
        test    eax, eax                                ; 10EE _ 85. C0
        jz      ?_032                                   ; 10F0 _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 10F2 _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 10F5 _ 8B. 55, 14
        add     eax, edx                                ; 10F8 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 10FA _ 0F AF. 45, 0C
        mov     edx, eax                                ; 10FE _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 1100 _ 8B. 45, 10
        add     eax, edx                                ; 1103 _ 01. D0
        lea     edx, [eax+7H]                           ; 1105 _ 8D. 50, 07
        mov     eax, dword [ebp+8H]                     ; 1108 _ 8B. 45, 08
        add     edx, eax                                ; 110B _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 110D _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 1111 _ 88. 02
?_032:  add     dword [ebp-4H], 1                       ; 1113 _ 83. 45, FC, 01
?_033:  cmp     dword [ebp-4H], 15                      ; 1117 _ 83. 7D, FC, 0F
        jle     ?_024                                   ; 111B _ 0F 8E, FFFFFE88
        leave                                           ; 1121 _ C9
        ret                                             ; 1122 _ C3
; paint_font End of function

paint_string:; Function begin
        push    ebp                                     ; 1123 _ 55
        mov     ebp, esp                                ; 1124 _ 89. E5
        push    ebx                                     ; 1126 _ 53
        sub     esp, 52                                 ; 1127 _ 83. EC, 34
        mov     eax, dword [ebp+1CH]                    ; 112A _ 8B. 45, 1C
        mov     byte [ebp-1CH], al                      ; 112D _ 88. 45, E4
        mov     eax, dword [ebp+10H]                    ; 1130 _ 8B. 45, 10
        mov     dword [ebp-0CH], eax                    ; 1133 _ 89. 45, F4
        jmp     ?_035                                   ; 1136 _ EB, 4B

?_034:  movsx   ecx, byte [ebp-1CH]                     ; 1138 _ 0F BE. 4D, E4
        mov     eax, dword [ebp+18H]                    ; 113C _ 8B. 45, 18
        movzx   eax, byte [eax]                         ; 113F _ 0F B6. 00
        movsx   eax, al                                 ; 1142 _ 0F BE. C0
        shl     eax, 4                                  ; 1145 _ C1. E0, 04
        lea     ebx, [systemFont+eax]                   ; 1148 _ 8D. 98, 00000000(d)
        mov     eax, dword [ebp+0CH]                    ; 114E _ 8B. 45, 0C
        mov     edx, dword [eax+4H]                     ; 1151 _ 8B. 50, 04
        mov     eax, dword [ebp+0CH]                    ; 1154 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1157 _ 8B. 00
        mov     dword [esp+14H], ecx                    ; 1159 _ 89. 4C 24, 14
        mov     dword [esp+10H], ebx                    ; 115D _ 89. 5C 24, 10
        mov     ecx, dword [ebp+14H]                    ; 1161 _ 8B. 4D, 14
        mov     dword [esp+0CH], ecx                    ; 1164 _ 89. 4C 24, 0C
        mov     ecx, dword [ebp+10H]                    ; 1168 _ 8B. 4D, 10
        mov     dword [esp+8H], ecx                     ; 116B _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 116F _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1173 _ 89. 04 24
        call    paint_font                              ; 1176 _ E8, FFFFFFFC(rel)
        add     dword [ebp+10H], 8                      ; 117B _ 83. 45, 10, 08
        add     dword [ebp+18H], 1                      ; 117F _ 83. 45, 18, 01
?_035:  mov     eax, dword [ebp+18H]                    ; 1183 _ 8B. 45, 18
        movzx   eax, byte [eax]                         ; 1186 _ 0F B6. 00
        test    al, al                                  ; 1189 _ 84. C0
        jnz     ?_034                                   ; 118B _ 75, AB
        mov     eax, dword [ebp+14H]                    ; 118D _ 8B. 45, 14
        add     eax, 16                                 ; 1190 _ 83. C0, 10
        mov     dword [esp+14H], eax                    ; 1193 _ 89. 44 24, 14
        mov     eax, dword [ebp+10H]                    ; 1197 _ 8B. 45, 10
        mov     dword [esp+10H], eax                    ; 119A _ 89. 44 24, 10
        mov     eax, dword [ebp+14H]                    ; 119E _ 8B. 45, 14
        mov     dword [esp+0CH], eax                    ; 11A1 _ 89. 44 24, 0C
        mov     eax, dword [ebp-0CH]                    ; 11A5 _ 8B. 45, F4
        mov     dword [esp+8H], eax                     ; 11A8 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 11AC _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 11AF _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 11B3 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 11B6 _ 89. 04 24
        call    sheet_refresh                           ; 11B9 _ E8, FFFFFFFC(rel)
        add     esp, 52                                 ; 11BE _ 83. C4, 34
        pop     ebx                                     ; 11C1 _ 5B
        pop     ebp                                     ; 11C2 _ 5D
        ret                                             ; 11C3 _ C3
; paint_string End of function

init_mouse_cursor:; Function begin
        push    ebp                                     ; 11C4 _ 55
        mov     ebp, esp                                ; 11C5 _ 89. E5
        sub     esp, 20                                 ; 11C7 _ 83. EC, 14
        mov     eax, dword [ebp+0CH]                    ; 11CA _ 8B. 45, 0C
        mov     byte [ebp-14H], al                      ; 11CD _ 88. 45, EC
        mov     dword [ebp-8H], 0                       ; 11D0 _ C7. 45, F8, 00000000
        jmp     ?_042                                   ; 11D7 _ E9, 0000009C

?_036:  mov     dword [ebp-4H], 0                       ; 11DC _ C7. 45, FC, 00000000
        jmp     ?_041                                   ; 11E3 _ E9, 00000082

?_037:  mov     eax, dword [ebp-8H]                     ; 11E8 _ 8B. 45, F8
        shl     eax, 4                                  ; 11EB _ C1. E0, 04
        mov     edx, eax                                ; 11EE _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 11F0 _ 8B. 45, FC
        add     eax, edx                                ; 11F3 _ 01. D0
        add     eax, cursor.1843                        ; 11F5 _ 05, 00000160(d)
        movzx   eax, byte [eax]                         ; 11FA _ 0F B6. 00
        cmp     al, 42                                  ; 11FD _ 3C, 2A
        jnz     ?_038                                   ; 11FF _ 75, 19
        mov     eax, dword [ebp-8H]                     ; 1201 _ 8B. 45, F8
        shl     eax, 4                                  ; 1204 _ C1. E0, 04
        mov     edx, eax                                ; 1207 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 1209 _ 8B. 45, FC
        add     eax, edx                                ; 120C _ 01. D0
        mov     edx, eax                                ; 120E _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 1210 _ 8B. 45, 08
        add     eax, edx                                ; 1213 _ 01. D0
        mov     byte [eax], 0                           ; 1215 _ C6. 00, 00
        jmp     ?_040                                   ; 1218 _ EB, 4C

?_038:  mov     eax, dword [ebp-8H]                     ; 121A _ 8B. 45, F8
        shl     eax, 4                                  ; 121D _ C1. E0, 04
        mov     edx, eax                                ; 1220 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 1222 _ 8B. 45, FC
        add     eax, edx                                ; 1225 _ 01. D0
        add     eax, cursor.1843                        ; 1227 _ 05, 00000160(d)
        movzx   eax, byte [eax]                         ; 122C _ 0F B6. 00
        cmp     al, 79                                  ; 122F _ 3C, 4F
        jnz     ?_039                                   ; 1231 _ 75, 19
        mov     eax, dword [ebp-8H]                     ; 1233 _ 8B. 45, F8
        shl     eax, 4                                  ; 1236 _ C1. E0, 04
        mov     edx, eax                                ; 1239 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 123B _ 8B. 45, FC
        add     eax, edx                                ; 123E _ 01. D0
        mov     edx, eax                                ; 1240 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 1242 _ 8B. 45, 08
        add     eax, edx                                ; 1245 _ 01. D0
        mov     byte [eax], 7                           ; 1247 _ C6. 00, 07
        jmp     ?_040                                   ; 124A _ EB, 1A

?_039:  mov     eax, dword [ebp-8H]                     ; 124C _ 8B. 45, F8
        shl     eax, 4                                  ; 124F _ C1. E0, 04
        mov     edx, eax                                ; 1252 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 1254 _ 8B. 45, FC
        add     eax, edx                                ; 1257 _ 01. D0
        mov     edx, eax                                ; 1259 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 125B _ 8B. 45, 08
        add     edx, eax                                ; 125E _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 1260 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 1264 _ 88. 02
?_040:  add     dword [ebp-4H], 1                       ; 1266 _ 83. 45, FC, 01
?_041:  cmp     dword [ebp-4H], 15                      ; 126A _ 83. 7D, FC, 0F
        jle     ?_037                                   ; 126E _ 0F 8E, FFFFFF74
        add     dword [ebp-8H], 1                       ; 1274 _ 83. 45, F8, 01
?_042:  cmp     dword [ebp-8H], 15                      ; 1278 _ 83. 7D, F8, 0F
        jle     ?_036                                   ; 127C _ 0F 8E, FFFFFF5A
        leave                                           ; 1282 _ C9
        ret                                             ; 1283 _ C3
; init_mouse_cursor End of function

paint_block:; Function begin
        push    ebp                                     ; 1284 _ 55
        mov     ebp, esp                                ; 1285 _ 89. E5
        sub     esp, 16                                 ; 1287 _ 83. EC, 10
        mov     dword [ebp-8H], 0                       ; 128A _ C7. 45, F8, 00000000
        jmp     ?_046                                   ; 1291 _ EB, 50

?_043:  mov     dword [ebp-4H], 0                       ; 1293 _ C7. 45, FC, 00000000
        jmp     ?_045                                   ; 129A _ EB, 3B

?_044:  mov     eax, dword [ebp-8H]                     ; 129C _ 8B. 45, F8
        mov     edx, dword [ebp+14H]                    ; 129F _ 8B. 55, 14
        add     eax, edx                                ; 12A2 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 12A4 _ 0F AF. 45, 0C
        mov     edx, dword [ebp-4H]                     ; 12A8 _ 8B. 55, FC
        mov     ecx, dword [ebp+10H]                    ; 12AB _ 8B. 4D, 10
        add     edx, ecx                                ; 12AE _ 01. CA
        add     eax, edx                                ; 12B0 _ 01. D0
        mov     edx, eax                                ; 12B2 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 12B4 _ 8B. 45, 08
        add     edx, eax                                ; 12B7 _ 01. C2
        mov     eax, dword [ebp-8H]                     ; 12B9 _ 8B. 45, F8
        imul    eax, dword [ebp+18H]                    ; 12BC _ 0F AF. 45, 18
        mov     ecx, eax                                ; 12C0 _ 89. C1
        mov     eax, dword [ebp-4H]                     ; 12C2 _ 8B. 45, FC
        add     eax, ecx                                ; 12C5 _ 01. C8
        mov     ecx, eax                                ; 12C7 _ 89. C1
        mov     eax, dword [ebp+20H]                    ; 12C9 _ 8B. 45, 20
        add     eax, ecx                                ; 12CC _ 01. C8
        movzx   eax, byte [eax]                         ; 12CE _ 0F B6. 00
        mov     byte [edx], al                          ; 12D1 _ 88. 02
        add     dword [ebp-4H], 1                       ; 12D3 _ 83. 45, FC, 01
?_045:  mov     eax, dword [ebp-4H]                     ; 12D7 _ 8B. 45, FC
        cmp     eax, dword [ebp+18H]                    ; 12DA _ 3B. 45, 18
        jl      ?_044                                   ; 12DD _ 7C, BD
        add     dword [ebp-8H], 1                       ; 12DF _ 83. 45, F8, 01
?_046:  mov     eax, dword [ebp-8H]                     ; 12E3 _ 8B. 45, F8
        cmp     eax, dword [ebp+1CH]                    ; 12E6 _ 3B. 45, 1C
        jl      ?_043                                   ; 12E9 _ 7C, A8
        leave                                           ; 12EB _ C9
        ret                                             ; 12EC _ C3
; paint_block End of function

init_fifo_buf:; Function begin
        push    ebp                                     ; 12ED _ 55
        mov     ebp, esp                                ; 12EE _ 89. E5
        sub     esp, 24                                 ; 12F0 _ 83. EC, 18
        mov     dword [esp+0CH], 0                      ; 12F3 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], mousebuf                ; 12FB _ C7. 44 24, 08, 00000000(d)
        mov     dword [esp+4H], 128                     ; 1303 _ C7. 44 24, 04, 00000080
        mov     dword [esp], mouseinfo                  ; 130B _ C7. 04 24, 00000000(d)
        call    fifo8_init                              ; 1312 _ E8, FFFFFFFC(rel)
        mov     dword [esp+0CH], 0                      ; 1317 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], keybuf                  ; 131F _ C7. 44 24, 08, 00000000(d)
        mov     dword [esp+4H], 32                      ; 1327 _ C7. 44 24, 04, 00000020
        mov     dword [esp], keyinfo                    ; 132F _ C7. 04 24, 00000000(d)
        call    fifo8_init                              ; 1336 _ E8, FFFFFFFC(rel)
        leave                                           ; 133B _ C9
        ret                                             ; 133C _ C3
; init_fifo_buf End of function

compute_mouse_position:; Function begin
        push    ebp                                     ; 133D _ 55
        mov     ebp, esp                                ; 133E _ 89. E5
        mov     eax, dword [ebp+10H]                    ; 1340 _ 8B. 45, 10
        mov     edx, dword [eax+4H]                     ; 1343 _ 8B. 50, 04
        mov     eax, dword [mouse_x]                    ; 1346 _ A1, 000001C8(d)
        add     eax, edx                                ; 134B _ 01. D0
        mov     dword [mouse_x], eax                    ; 134D _ A3, 000001C8(d)
        mov     eax, dword [ebp+10H]                    ; 1352 _ 8B. 45, 10
        mov     edx, dword [eax+8H]                     ; 1355 _ 8B. 50, 08
        mov     eax, dword [mouse_y]                    ; 1358 _ A1, 000001CC(d)
        add     eax, edx                                ; 135D _ 01. D0
        mov     dword [mouse_y], eax                    ; 135F _ A3, 000001CC(d)
        mov     eax, dword [mouse_x]                    ; 1364 _ A1, 000001C8(d)
        test    eax, eax                                ; 1369 _ 85. C0
        jns     ?_047                                   ; 136B _ 79, 0A
        mov     dword [mouse_x], 0                      ; 136D _ C7. 05, 000001C8(d), 00000000
?_047:  mov     eax, dword [mouse_y]                    ; 1377 _ A1, 000001CC(d)
        test    eax, eax                                ; 137C _ 85. C0
        jns     ?_048                                   ; 137E _ 79, 0A
        mov     dword [mouse_y], 0                      ; 1380 _ C7. 05, 000001CC(d), 00000000
?_048:  movzx   eax, word [?_302]                       ; 138A _ 0F B7. 05, 000000A4(d)
        cwde                                            ; 1391 _ 98
        lea     edx, [eax-10H]                          ; 1392 _ 8D. 50, F0
        mov     eax, dword [mouse_x]                    ; 1395 _ A1, 000001C8(d)
        cmp     edx, eax                                ; 139A _ 39. C2
        jge     ?_049                                   ; 139C _ 7D, 10
        movzx   eax, word [?_302]                       ; 139E _ 0F B7. 05, 000000A4(d)
        cwde                                            ; 13A5 _ 98
        sub     eax, 16                                 ; 13A6 _ 83. E8, 10
        mov     dword [mouse_x], eax                    ; 13A9 _ A3, 000001C8(d)
?_049:  movzx   eax, word [?_302]                       ; 13AE _ 0F B7. 05, 000000A4(d)
        cwde                                            ; 13B5 _ 98
        lea     edx, [eax-10H]                          ; 13B6 _ 8D. 50, F0
        mov     eax, dword [mouse_y]                    ; 13B9 _ A1, 000001CC(d)
        cmp     edx, eax                                ; 13BE _ 39. C2
        jge     ?_050                                   ; 13C0 _ 7D, 10
        movzx   eax, word [?_302]                       ; 13C2 _ 0F B7. 05, 000000A4(d)
        cwde                                            ; 13C9 _ 98
        sub     eax, 16                                 ; 13CA _ 83. E8, 10
        mov     dword [mouse_y], eax                    ; 13CD _ A3, 000001CC(d)
?_050:  pop     ebp                                     ; 13D2 _ 5D
        ret                                             ; 13D3 _ C3
; compute_mouse_position End of function

show_mouse_info:; Function begin
        push    ebp                                     ; 13D4 _ 55
        mov     ebp, esp                                ; 13D5 _ 89. E5
        sub     esp, 40                                 ; 13D7 _ 83. EC, 28
        mov     byte [ebp-9H], 0                        ; 13DA _ C6. 45, F7, 00
        call    io_sti                                  ; 13DE _ E8, FFFFFFFC(rel)
        mov     dword [esp], mouseinfo                  ; 13E3 _ C7. 04 24, 00000000(d)
        call    fifo8_get                               ; 13EA _ E8, FFFFFFFC(rel)
        mov     byte [ebp-9H], al                       ; 13EF _ 88. 45, F7
        movzx   eax, byte [ebp-9H]                      ; 13F2 _ 0F B6. 45, F7
        mov     dword [esp+4H], eax                     ; 13F6 _ 89. 44 24, 04
        mov     dword [esp], mouse_send_info            ; 13FA _ C7. 04 24, 00000000(d)
        call    mouse_decode                            ; 1401 _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 1406 _ 85. C0
        jz      ?_051                                   ; 1408 _ 74, 77
        mov     dword [esp+8H], mouse_send_info         ; 140A _ C7. 44 24, 08, 00000000(d)
        mov     eax, dword [ebp+0CH]                    ; 1412 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 1415 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1419 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 141C _ 89. 04 24
        call    compute_mouse_position                  ; 141F _ E8, FFFFFFFC(rel)
        mov     edx, dword [mouse_y]                    ; 1424 _ 8B. 15, 000001CC(d)
        mov     eax, dword [mouse_x]                    ; 142A _ A1, 000001C8(d)
        mov     dword [esp+0CH], edx                    ; 142F _ 89. 54 24, 0C
        mov     dword [esp+8H], eax                     ; 1433 _ 89. 44 24, 08
        mov     eax, dword [ebp+10H]                    ; 1437 _ 8B. 45, 10
        mov     dword [esp+4H], eax                     ; 143A _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 143E _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1441 _ 89. 04 24
        call    sheet_slide                             ; 1444 _ E8, FFFFFFFC(rel)
        mov     eax, dword [mouse_send_info+0CH]        ; 1449 _ A1, 0000000C(d)
        and     eax, 01H                                ; 144E _ 83. E0, 01
        test    eax, eax                                ; 1451 _ 85. C0
        jz      ?_051                                   ; 1453 _ 74, 2C
        mov     eax, dword [mouse_y]                    ; 1455 _ A1, 000001CC(d)
        lea     ecx, [eax-8H]                           ; 145A _ 8D. 48, F8
        mov     eax, dword [mouse_x]                    ; 145D _ A1, 000001C8(d)
        lea     edx, [eax-50H]                          ; 1462 _ 8D. 50, B0
        mov     eax, dword [sheet_win]                  ; 1465 _ A1, 000001C4(d)
        mov     dword [esp+0CH], ecx                    ; 146A _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 146E _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 1472 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1476 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1479 _ 89. 04 24
        call    sheet_slide                             ; 147C _ E8, FFFFFFFC(rel)
?_051:  leave                                           ; 1481 _ C9
        ret                                             ; 1482 _ C3
; show_mouse_info End of function

show_memory_info:; Function begin
        push    ebp                                     ; 1483 _ 55
        mov     ebp, esp                                ; 1484 _ 89. E5
        sub     esp, 88                                 ; 1486 _ 83. EC, 58
        mov     dword [ebp-38H], 0                      ; 1489 _ C7. 45, C8, 00000000
        mov     dword [ebp-34H], 0                      ; 1490 _ C7. 45, CC, 00000000
        mov     dword [ebp-30H], 104                    ; 1497 _ C7. 45, D0, 00000068
        mov     eax, dword [screen_info]                ; 149E _ A1, 000000A0(d)
        mov     dword [ebp-2CH], eax                    ; 14A3 _ 89. 45, D4
        movzx   eax, word [?_302]                       ; 14A6 _ 0F B7. 05, 000000A4(d)
        cwde                                            ; 14AD _ 98
        mov     dword [ebp-28H], eax                    ; 14AE _ 89. 45, D8
        movzx   eax, word [?_303]                       ; 14B1 _ 0F B7. 05, 000000A6(d)
        cwde                                            ; 14B8 _ 98
        mov     dword [ebp-24H], eax                    ; 14B9 _ 89. 45, DC
        mov     eax, dword [ebp+0CH]                    ; 14BC _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 14BF _ 8B. 00
        mov     edx, dword [ebp-24H]                    ; 14C1 _ 8B. 55, DC
        mov     dword [esp+8H], edx                     ; 14C4 _ 89. 54 24, 08
        mov     edx, dword [ebp-28H]                    ; 14C8 _ 8B. 55, D8
        mov     dword [esp+4H], edx                     ; 14CB _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 14CF _ 89. 04 24
        call    init_desktop                            ; 14D2 _ E8, FFFFFFFC(rel)
        mov     dword [esp+14H], 7                      ; 14D7 _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_287                  ; 14DF _ C7. 44 24, 10, 0000001E(d)
        mov     eax, dword [ebp-34H]                    ; 14E7 _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 14EA _ 89. 44 24, 0C
        mov     eax, dword [ebp-38H]                    ; 14EE _ 8B. 45, C8
        mov     dword [esp+8H], eax                     ; 14F1 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 14F5 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 14F8 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 14FC _ 8B. 45, 08
        mov     dword [esp], eax                        ; 14FF _ 89. 04 24
        call    paint_string                            ; 1502 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+14H]                    ; 1507 _ 8B. 45, 14
        mov     dword [esp], eax                        ; 150A _ 89. 04 24
        call    intToHexStr                             ; 150D _ E8, FFFFFFFC(rel)
        mov     dword [ebp-20H], eax                    ; 1512 _ 89. 45, E0
        mov     dword [esp+14H], 7                      ; 1515 _ C7. 44 24, 14, 00000007
        mov     eax, dword [ebp-20H]                    ; 151D _ 8B. 45, E0
        mov     dword [esp+10H], eax                    ; 1520 _ 89. 44 24, 10
        mov     eax, dword [ebp-34H]                    ; 1524 _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 1527 _ 89. 44 24, 0C
        mov     eax, dword [ebp-30H]                    ; 152B _ 8B. 45, D0
        mov     dword [esp+8H], eax                     ; 152E _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 1532 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 1535 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1539 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 153C _ 89. 04 24
        call    paint_string                            ; 153F _ E8, FFFFFFFC(rel)
        add     dword [ebp-34H], 16                     ; 1544 _ 83. 45, CC, 10
        mov     dword [esp+14H], 7                      ; 1548 _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_288                  ; 1550 _ C7. 44 24, 10, 00000028(d)
        mov     eax, dword [ebp-34H]                    ; 1558 _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 155B _ 89. 44 24, 0C
        mov     eax, dword [ebp-38H]                    ; 155F _ 8B. 45, C8
        mov     dword [esp+8H], eax                     ; 1562 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 1566 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 1569 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 156D _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1570 _ 89. 04 24
        call    paint_string                            ; 1573 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 1578 _ 8B. 45, 10
        mov     eax, dword [eax]                        ; 157B _ 8B. 00
        mov     dword [esp], eax                        ; 157D _ 89. 04 24
        call    intToHexStr                             ; 1580 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-1CH], eax                    ; 1585 _ 89. 45, E4
        mov     dword [esp+14H], 7                      ; 1588 _ C7. 44 24, 14, 00000007
        mov     eax, dword [ebp-1CH]                    ; 1590 _ 8B. 45, E4
        mov     dword [esp+10H], eax                    ; 1593 _ 89. 44 24, 10
        mov     eax, dword [ebp-34H]                    ; 1597 _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 159A _ 89. 44 24, 0C
        mov     eax, dword [ebp-30H]                    ; 159E _ 8B. 45, D0
        mov     dword [esp+8H], eax                     ; 15A1 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 15A5 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 15A8 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 15AC _ 8B. 45, 08
        mov     dword [esp], eax                        ; 15AF _ 89. 04 24
        call    paint_string                            ; 15B2 _ E8, FFFFFFFC(rel)
        add     dword [ebp-34H], 16                     ; 15B7 _ 83. 45, CC, 10
        mov     dword [esp+14H], 7                      ; 15BB _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_289                  ; 15C3 _ C7. 44 24, 10, 00000034(d)
        mov     eax, dword [ebp-34H]                    ; 15CB _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 15CE _ 89. 44 24, 0C
        mov     eax, dword [ebp-38H]                    ; 15D2 _ 8B. 45, C8
        mov     dword [esp+8H], eax                     ; 15D5 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 15D9 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 15DC _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 15E0 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 15E3 _ 89. 04 24
        call    paint_string                            ; 15E6 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 15EB _ 8B. 45, 10
        mov     eax, dword [eax+4H]                     ; 15EE _ 8B. 40, 04
        mov     dword [esp], eax                        ; 15F1 _ 89. 04 24
        call    intToHexStr                             ; 15F4 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-18H], eax                    ; 15F9 _ 89. 45, E8
        mov     dword [esp+14H], 7                      ; 15FC _ C7. 44 24, 14, 00000007
        mov     eax, dword [ebp-18H]                    ; 1604 _ 8B. 45, E8
        mov     dword [esp+10H], eax                    ; 1607 _ 89. 44 24, 10
        mov     eax, dword [ebp-34H]                    ; 160B _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 160E _ 89. 44 24, 0C
        mov     eax, dword [ebp-30H]                    ; 1612 _ 8B. 45, D0
        mov     dword [esp+8H], eax                     ; 1615 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 1619 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 161C _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1620 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1623 _ 89. 04 24
        call    paint_string                            ; 1626 _ E8, FFFFFFFC(rel)
        add     dword [ebp-34H], 16                     ; 162B _ 83. 45, CC, 10
        mov     dword [esp+14H], 7                      ; 162F _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_290                  ; 1637 _ C7. 44 24, 10, 00000040(d)
        mov     eax, dword [ebp-34H]                    ; 163F _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 1642 _ 89. 44 24, 0C
        mov     eax, dword [ebp-38H]                    ; 1646 _ 8B. 45, C8
        mov     dword [esp+8H], eax                     ; 1649 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 164D _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 1650 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1654 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1657 _ 89. 04 24
        call    paint_string                            ; 165A _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 165F _ 8B. 45, 10
        mov     eax, dword [eax+8H]                     ; 1662 _ 8B. 40, 08
        mov     dword [esp], eax                        ; 1665 _ 89. 04 24
        call    intToHexStr                             ; 1668 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-14H], eax                    ; 166D _ 89. 45, EC
        mov     dword [esp+14H], 7                      ; 1670 _ C7. 44 24, 14, 00000007
        mov     eax, dword [ebp-14H]                    ; 1678 _ 8B. 45, EC
        mov     dword [esp+10H], eax                    ; 167B _ 89. 44 24, 10
        mov     eax, dword [ebp-34H]                    ; 167F _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 1682 _ 89. 44 24, 0C
        mov     eax, dword [ebp-30H]                    ; 1686 _ 8B. 45, D0
        mov     dword [esp+8H], eax                     ; 1689 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 168D _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 1690 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1694 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1697 _ 89. 04 24
        call    paint_string                            ; 169A _ E8, FFFFFFFC(rel)
        add     dword [ebp-34H], 16                     ; 169F _ 83. 45, CC, 10
        mov     dword [esp+14H], 7                      ; 16A3 _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_291                  ; 16AB _ C7. 44 24, 10, 0000004C(d)
        mov     eax, dword [ebp-34H]                    ; 16B3 _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 16B6 _ 89. 44 24, 0C
        mov     eax, dword [ebp-38H]                    ; 16BA _ 8B. 45, C8
        mov     dword [esp+8H], eax                     ; 16BD _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 16C1 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 16C4 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 16C8 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 16CB _ 89. 04 24
        call    paint_string                            ; 16CE _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 16D3 _ 8B. 45, 10
        mov     eax, dword [eax+0CH]                    ; 16D6 _ 8B. 40, 0C
        mov     dword [esp], eax                        ; 16D9 _ 89. 04 24
        call    intToHexStr                             ; 16DC _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 16E1 _ 89. 45, F0
        mov     dword [esp+14H], 7                      ; 16E4 _ C7. 44 24, 14, 00000007
        mov     eax, dword [ebp-10H]                    ; 16EC _ 8B. 45, F0
        mov     dword [esp+10H], eax                    ; 16EF _ 89. 44 24, 10
        mov     eax, dword [ebp-34H]                    ; 16F3 _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 16F6 _ 89. 44 24, 0C
        mov     eax, dword [ebp-30H]                    ; 16FA _ 8B. 45, D0
        mov     dword [esp+8H], eax                     ; 16FD _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 1701 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 1704 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1708 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 170B _ 89. 04 24
        call    paint_string                            ; 170E _ E8, FFFFFFFC(rel)
        add     dword [ebp-34H], 16                     ; 1713 _ 83. 45, CC, 10
        mov     dword [esp+14H], 7                      ; 1717 _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_292                  ; 171F _ C7. 44 24, 10, 00000059(d)
        mov     eax, dword [ebp-34H]                    ; 1727 _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 172A _ 89. 44 24, 0C
        mov     eax, dword [ebp-38H]                    ; 172E _ 8B. 45, C8
        mov     dword [esp+8H], eax                     ; 1731 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 1735 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 1738 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 173C _ 8B. 45, 08
        mov     dword [esp], eax                        ; 173F _ 89. 04 24
        call    paint_string                            ; 1742 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 1747 _ 8B. 45, 10
        mov     eax, dword [eax+10H]                    ; 174A _ 8B. 40, 10
        mov     dword [esp], eax                        ; 174D _ 89. 04 24
        call    intToHexStr                             ; 1750 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 1755 _ 89. 45, F4
        mov     dword [esp+14H], 7                      ; 1758 _ C7. 44 24, 14, 00000007
        mov     eax, dword [ebp-0CH]                    ; 1760 _ 8B. 45, F4
        mov     dword [esp+10H], eax                    ; 1763 _ 89. 44 24, 10
        mov     eax, dword [ebp-34H]                    ; 1767 _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 176A _ 89. 44 24, 0C
        mov     eax, dword [ebp-30H]                    ; 176E _ 8B. 45, D0
        mov     dword [esp+8H], eax                     ; 1771 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 1775 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 1778 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 177C _ 8B. 45, 08
        mov     dword [esp], eax                        ; 177F _ 89. 04 24
        call    paint_string                            ; 1782 _ E8, FFFFFFFC(rel)
        add     dword [ebp-34H], 16                     ; 1787 _ 83. 45, CC, 10
        leave                                           ; 178B _ C9
        ret                                             ; 178C _ C3
; show_memory_info End of function

message_box:; Function begin
        push    ebp                                     ; 178D _ 55
        mov     ebp, esp                                ; 178E _ 89. E5
        sub     esp, 56                                 ; 1790 _ 83. EC, 38
        mov     eax, dword [ebp+8H]                     ; 1793 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1796 _ 89. 04 24
        call    sheet_alloc                             ; 1799 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 179E _ 89. 45, F0
        mov     eax, dword [memman]                     ; 17A1 _ A1, 00000000(d)
        mov     dword [esp+4H], 10880                   ; 17A6 _ C7. 44 24, 04, 00002A80
        mov     dword [esp], eax                        ; 17AE _ 89. 04 24
        call    memman_alloc_4k                         ; 17B1 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 17B6 _ 89. 45, F4
        mov     dword [esp+10H], 99                     ; 17B9 _ C7. 44 24, 10, 00000063
        mov     dword [esp+0CH], 68                     ; 17C1 _ C7. 44 24, 0C, 00000044
        mov     dword [esp+8H], 160                     ; 17C9 _ C7. 44 24, 08, 000000A0
        mov     eax, dword [ebp-0CH]                    ; 17D1 _ 8B. 45, F4
        mov     dword [esp+4H], eax                     ; 17D4 _ 89. 44 24, 04
        mov     eax, dword [ebp-10H]                    ; 17D8 _ 8B. 45, F0
        mov     dword [esp], eax                        ; 17DB _ 89. 04 24
        call    sheet_setbuf                            ; 17DE _ E8, FFFFFFFC(rel)
        mov     dword [esp+0CH], 1                      ; 17E3 _ C7. 44 24, 0C, 00000001
        mov     eax, dword [ebp+0CH]                    ; 17EB _ 8B. 45, 0C
        mov     dword [esp+8H], eax                     ; 17EE _ 89. 44 24, 08
        mov     eax, dword [ebp-10H]                    ; 17F2 _ 8B. 45, F0
        mov     dword [esp+4H], eax                     ; 17F5 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 17F9 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 17FC _ 89. 04 24
        call    make_windows                            ; 17FF _ E8, FFFFFFFC(rel)
        mov     dword [esp+14H], 7                      ; 1804 _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], 16                     ; 180C _ C7. 44 24, 10, 00000010
        mov     dword [esp+0CH], 144                    ; 1814 _ C7. 44 24, 0C, 00000090
        mov     dword [esp+8H], 28                      ; 181C _ C7. 44 24, 08, 0000001C
        mov     dword [esp+4H], 8                       ; 1824 _ C7. 44 24, 04, 00000008
        mov     eax, dword [ebp-10H]                    ; 182C _ 8B. 45, F0
        mov     dword [esp], eax                        ; 182F _ 89. 04 24
        call    make_textbox                            ; 1832 _ E8, FFFFFFFC(rel)
        mov     dword [esp+0CH], 172                    ; 1837 _ C7. 44 24, 0C, 000000AC
        mov     dword [esp+8H], 260                     ; 183F _ C7. 44 24, 08, 00000104
        mov     eax, dword [ebp-10H]                    ; 1847 _ 8B. 45, F0
        mov     dword [esp+4H], eax                     ; 184A _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 184E _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1851 _ 89. 04 24
        call    sheet_slide                             ; 1854 _ E8, FFFFFFFC(rel)
        mov     dword [esp+8H], 2                       ; 1859 _ C7. 44 24, 08, 00000002
        mov     eax, dword [ebp-10H]                    ; 1861 _ 8B. 45, F0
        mov     dword [esp+4H], eax                     ; 1864 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1868 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 186B _ 89. 04 24
        call    sheet_updown                            ; 186E _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 1873 _ 8B. 45, F0
        leave                                           ; 1876 _ C9
        ret                                             ; 1877 _ C3
; message_box End of function

make_textbox:; Function begin
        push    ebp                                     ; 1878 _ 55
        mov     ebp, esp                                ; 1879 _ 89. E5
        push    edi                                     ; 187B _ 57
        push    esi                                     ; 187C _ 56
        push    ebx                                     ; 187D _ 53
        sub     esp, 44                                 ; 187E _ 83. EC, 2C
        mov     eax, dword [ebp+14H]                    ; 1881 _ 8B. 45, 14
        mov     edx, dword [ebp+0CH]                    ; 1884 _ 8B. 55, 0C
        add     eax, edx                                ; 1887 _ 01. D0
        mov     dword [ebp-14H], eax                    ; 1889 _ 89. 45, EC
        mov     eax, dword [ebp+18H]                    ; 188C _ 8B. 45, 18
        mov     edx, dword [ebp+10H]                    ; 188F _ 8B. 55, 10
        add     eax, edx                                ; 1892 _ 01. D0
        mov     dword [ebp-10H], eax                    ; 1894 _ 89. 45, F0
        mov     eax, dword [ebp+10H]                    ; 1897 _ 8B. 45, 10
        lea     edi, [eax-3H]                           ; 189A _ 8D. 78, FD
        mov     eax, dword [ebp-14H]                    ; 189D _ 8B. 45, EC
        lea     esi, [eax+1H]                           ; 18A0 _ 8D. 70, 01
        mov     eax, dword [ebp+10H]                    ; 18A3 _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 18A6 _ 8D. 58, FD
        mov     eax, dword [ebp+0CH]                    ; 18A9 _ 8B. 45, 0C
        lea     ecx, [eax-2H]                           ; 18AC _ 8D. 48, FE
        mov     eax, dword [ebp+8H]                     ; 18AF _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 18B2 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 18B5 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 18B8 _ 8B. 00
        mov     dword [esp+18H], edi                    ; 18BA _ 89. 7C 24, 18
        mov     dword [esp+14H], esi                    ; 18BE _ 89. 74 24, 14
        mov     dword [esp+10H], ebx                    ; 18C2 _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 18C6 _ 89. 4C 24, 0C
        mov     dword [esp+8H], 15                      ; 18CA _ C7. 44 24, 08, 0000000F
        mov     dword [esp+4H], edx                     ; 18D2 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 18D6 _ 89. 04 24
        call    paint_rectangle                         ; 18D9 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 18DE _ 8B. 45, F0
        lea     edi, [eax+1H]                           ; 18E1 _ 8D. 78, 01
        mov     eax, dword [ebp+0CH]                    ; 18E4 _ 8B. 45, 0C
        lea     esi, [eax-3H]                           ; 18E7 _ 8D. 70, FD
        mov     eax, dword [ebp+10H]                    ; 18EA _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 18ED _ 8D. 58, FD
        mov     eax, dword [ebp+0CH]                    ; 18F0 _ 8B. 45, 0C
        lea     ecx, [eax-3H]                           ; 18F3 _ 8D. 48, FD
        mov     eax, dword [ebp+8H]                     ; 18F6 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 18F9 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 18FC _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 18FF _ 8B. 00
        mov     dword [esp+18H], edi                    ; 1901 _ 89. 7C 24, 18
        mov     dword [esp+14H], esi                    ; 1905 _ 89. 74 24, 14
        mov     dword [esp+10H], ebx                    ; 1909 _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 190D _ 89. 4C 24, 0C
        mov     dword [esp+8H], 15                      ; 1911 _ C7. 44 24, 08, 0000000F
        mov     dword [esp+4H], edx                     ; 1919 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 191D _ 89. 04 24
        call    paint_rectangle                         ; 1920 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 1925 _ 8B. 45, F0
        lea     edi, [eax+2H]                           ; 1928 _ 8D. 78, 02
        mov     eax, dword [ebp-14H]                    ; 192B _ 8B. 45, EC
        lea     esi, [eax+1H]                           ; 192E _ 8D. 70, 01
        mov     eax, dword [ebp-10H]                    ; 1931 _ 8B. 45, F0
        lea     ebx, [eax+2H]                           ; 1934 _ 8D. 58, 02
        mov     eax, dword [ebp+0CH]                    ; 1937 _ 8B. 45, 0C
        lea     ecx, [eax-3H]                           ; 193A _ 8D. 48, FD
        mov     eax, dword [ebp+8H]                     ; 193D _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 1940 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1943 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1946 _ 8B. 00
        mov     dword [esp+18H], edi                    ; 1948 _ 89. 7C 24, 18
        mov     dword [esp+14H], esi                    ; 194C _ 89. 74 24, 14
        mov     dword [esp+10H], ebx                    ; 1950 _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 1954 _ 89. 4C 24, 0C
        mov     dword [esp+8H], 7                       ; 1958 _ C7. 44 24, 08, 00000007
        mov     dword [esp+4H], edx                     ; 1960 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1964 _ 89. 04 24
        call    paint_rectangle                         ; 1967 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 196C _ 8B. 45, F0
        lea     edi, [eax+2H]                           ; 196F _ 8D. 78, 02
        mov     eax, dword [ebp-14H]                    ; 1972 _ 8B. 45, EC
        lea     esi, [eax+2H]                           ; 1975 _ 8D. 70, 02
        mov     eax, dword [ebp+10H]                    ; 1978 _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 197B _ 8D. 58, FD
        mov     eax, dword [ebp-14H]                    ; 197E _ 8B. 45, EC
        lea     ecx, [eax+2H]                           ; 1981 _ 8D. 48, 02
        mov     eax, dword [ebp+8H]                     ; 1984 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 1987 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 198A _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 198D _ 8B. 00
        mov     dword [esp+18H], edi                    ; 198F _ 89. 7C 24, 18
        mov     dword [esp+14H], esi                    ; 1993 _ 89. 74 24, 14
        mov     dword [esp+10H], ebx                    ; 1997 _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 199B _ 89. 4C 24, 0C
        mov     dword [esp+8H], 7                       ; 199F _ C7. 44 24, 08, 00000007
        mov     dword [esp+4H], edx                     ; 19A7 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 19AB _ 89. 04 24
        call    paint_rectangle                         ; 19AE _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 19B3 _ 8B. 45, 10
        lea     ecx, [eax-2H]                           ; 19B6 _ 8D. 48, FE
        mov     eax, dword [ebp+10H]                    ; 19B9 _ 8B. 45, 10
        lea     esi, [eax-2H]                           ; 19BC _ 8D. 70, FE
        mov     eax, dword [ebp+0CH]                    ; 19BF _ 8B. 45, 0C
        lea     ebx, [eax-1H]                           ; 19C2 _ 8D. 58, FF
        mov     eax, dword [ebp+8H]                     ; 19C5 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 19C8 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 19CB _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 19CE _ 8B. 00
        mov     dword [esp+18H], ecx                    ; 19D0 _ 89. 4C 24, 18
        mov     ecx, dword [ebp-14H]                    ; 19D4 _ 8B. 4D, EC
        mov     dword [esp+14H], ecx                    ; 19D7 _ 89. 4C 24, 14
        mov     dword [esp+10H], esi                    ; 19DB _ 89. 74 24, 10
        mov     dword [esp+0CH], ebx                    ; 19DF _ 89. 5C 24, 0C
        mov     dword [esp+8H], 0                       ; 19E3 _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], edx                     ; 19EB _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 19EF _ 89. 04 24
        call    paint_rectangle                         ; 19F2 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+0CH]                    ; 19F7 _ 8B. 45, 0C
        lea     edi, [eax-2H]                           ; 19FA _ 8D. 78, FE
        mov     eax, dword [ebp+10H]                    ; 19FD _ 8B. 45, 10
        lea     esi, [eax-2H]                           ; 1A00 _ 8D. 70, FE
        mov     eax, dword [ebp+0CH]                    ; 1A03 _ 8B. 45, 0C
        lea     ebx, [eax-2H]                           ; 1A06 _ 8D. 58, FE
        mov     eax, dword [ebp+8H]                     ; 1A09 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 1A0C _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1A0F _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1A12 _ 8B. 00
        mov     ecx, dword [ebp-10H]                    ; 1A14 _ 8B. 4D, F0
        mov     dword [esp+18H], ecx                    ; 1A17 _ 89. 4C 24, 18
        mov     dword [esp+14H], edi                    ; 1A1B _ 89. 7C 24, 14
        mov     dword [esp+10H], esi                    ; 1A1F _ 89. 74 24, 10
        mov     dword [esp+0CH], ebx                    ; 1A23 _ 89. 5C 24, 0C
        mov     dword [esp+8H], 0                       ; 1A27 _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], edx                     ; 1A2F _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1A33 _ 89. 04 24
        call    paint_rectangle                         ; 1A36 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 1A3B _ 8B. 45, F0
        lea     ecx, [eax+1H]                           ; 1A3E _ 8D. 48, 01
        mov     eax, dword [ebp-10H]                    ; 1A41 _ 8B. 45, F0
        lea     esi, [eax+1H]                           ; 1A44 _ 8D. 70, 01
        mov     eax, dword [ebp+0CH]                    ; 1A47 _ 8B. 45, 0C
        lea     ebx, [eax-2H]                           ; 1A4A _ 8D. 58, FE
        mov     eax, dword [ebp+8H]                     ; 1A4D _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 1A50 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1A53 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1A56 _ 8B. 00
        mov     dword [esp+18H], ecx                    ; 1A58 _ 89. 4C 24, 18
        mov     ecx, dword [ebp-14H]                    ; 1A5C _ 8B. 4D, EC
        mov     dword [esp+14H], ecx                    ; 1A5F _ 89. 4C 24, 14
        mov     dword [esp+10H], esi                    ; 1A63 _ 89. 74 24, 10
        mov     dword [esp+0CH], ebx                    ; 1A67 _ 89. 5C 24, 0C
        mov     dword [esp+8H], 8                       ; 1A6B _ C7. 44 24, 08, 00000008
        mov     dword [esp+4H], edx                     ; 1A73 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1A77 _ 89. 04 24
        call    paint_rectangle                         ; 1A7A _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 1A7F _ 8B. 45, F0
        lea     edi, [eax+1H]                           ; 1A82 _ 8D. 78, 01
        mov     eax, dword [ebp-14H]                    ; 1A85 _ 8B. 45, EC
        lea     esi, [eax+1H]                           ; 1A88 _ 8D. 70, 01
        mov     eax, dword [ebp+10H]                    ; 1A8B _ 8B. 45, 10
        lea     ebx, [eax-2H]                           ; 1A8E _ 8D. 58, FE
        mov     eax, dword [ebp-14H]                    ; 1A91 _ 8B. 45, EC
        lea     ecx, [eax+1H]                           ; 1A94 _ 8D. 48, 01
        mov     eax, dword [ebp+8H]                     ; 1A97 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 1A9A _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1A9D _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1AA0 _ 8B. 00
        mov     dword [esp+18H], edi                    ; 1AA2 _ 89. 7C 24, 18
        mov     dword [esp+14H], esi                    ; 1AA6 _ 89. 74 24, 14
        mov     dword [esp+10H], ebx                    ; 1AAA _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 1AAE _ 89. 4C 24, 0C
        mov     dword [esp+8H], 8                       ; 1AB2 _ C7. 44 24, 08, 00000008
        mov     dword [esp+4H], edx                     ; 1ABA _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1ABE _ 89. 04 24
        call    paint_rectangle                         ; 1AC1 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 1AC6 _ 8B. 45, 10
        lea     edi, [eax-1H]                           ; 1AC9 _ 8D. 78, FF
        mov     eax, dword [ebp+0CH]                    ; 1ACC _ 8B. 45, 0C
        lea     esi, [eax-1H]                           ; 1ACF _ 8D. 70, FF
        mov     eax, dword [ebp+1CH]                    ; 1AD2 _ 8B. 45, 1C
        movzx   ecx, al                                 ; 1AD5 _ 0F B6. C8
        mov     eax, dword [ebp+8H]                     ; 1AD8 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 1ADB _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1ADE _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1AE1 _ 8B. 00
        mov     ebx, dword [ebp-10H]                    ; 1AE3 _ 8B. 5D, F0
        mov     dword [esp+18H], ebx                    ; 1AE6 _ 89. 5C 24, 18
        mov     ebx, dword [ebp-14H]                    ; 1AEA _ 8B. 5D, EC
        mov     dword [esp+14H], ebx                    ; 1AED _ 89. 5C 24, 14
        mov     dword [esp+10H], edi                    ; 1AF1 _ 89. 7C 24, 10
        mov     dword [esp+0CH], esi                    ; 1AF5 _ 89. 74 24, 0C
        mov     dword [esp+8H], ecx                     ; 1AF9 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 1AFD _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1B01 _ 89. 04 24
        call    paint_rectangle                         ; 1B04 _ E8, FFFFFFFC(rel)
        add     esp, 44                                 ; 1B09 _ 83. C4, 2C
        pop     ebx                                     ; 1B0C _ 5B
        pop     esi                                     ; 1B0D _ 5E
        pop     edi                                     ; 1B0E _ 5F
        pop     ebp                                     ; 1B0F _ 5D
        ret                                             ; 1B10 _ C3
; make_textbox End of function

make_windows:; Function begin
        push    ebp                                     ; 1B11 _ 55
        mov     ebp, esp                                ; 1B12 _ 89. E5
        push    ebx                                     ; 1B14 _ 53
        sub     esp, 52                                 ; 1B15 _ 83. EC, 34
        mov     eax, dword [ebp+14H]                    ; 1B18 _ 8B. 45, 14
        mov     byte [ebp-1CH], al                      ; 1B1B _ 88. 45, E4
        mov     eax, dword [ebp+0CH]                    ; 1B1E _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 1B21 _ 8B. 40, 04
        mov     dword [ebp-10H], eax                    ; 1B24 _ 89. 45, F0
        mov     eax, dword [ebp+0CH]                    ; 1B27 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 1B2A _ 8B. 40, 08
        mov     dword [ebp-0CH], eax                    ; 1B2D _ 89. 45, F4
        mov     eax, dword [ebp-10H]                    ; 1B30 _ 8B. 45, F0
        lea     edx, [eax-1H]                           ; 1B33 _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 1B36 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1B39 _ 8B. 00
        mov     dword [esp+18H], 0                      ; 1B3B _ C7. 44 24, 18, 00000000
        mov     dword [esp+14H], edx                    ; 1B43 _ 89. 54 24, 14
        mov     dword [esp+10H], 0                      ; 1B47 _ C7. 44 24, 10, 00000000
        mov     dword [esp+0CH], 0                      ; 1B4F _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 8                       ; 1B57 _ C7. 44 24, 08, 00000008
        mov     edx, dword [ebp-10H]                    ; 1B5F _ 8B. 55, F0
        mov     dword [esp+4H], edx                     ; 1B62 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1B66 _ 89. 04 24
        call    paint_rectangle                         ; 1B69 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 1B6E _ 8B. 45, F0
        lea     edx, [eax-2H]                           ; 1B71 _ 8D. 50, FE
        mov     eax, dword [ebp+0CH]                    ; 1B74 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1B77 _ 8B. 00
        mov     dword [esp+18H], 1                      ; 1B79 _ C7. 44 24, 18, 00000001
        mov     dword [esp+14H], edx                    ; 1B81 _ 89. 54 24, 14
        mov     dword [esp+10H], 1                      ; 1B85 _ C7. 44 24, 10, 00000001
        mov     dword [esp+0CH], 1                      ; 1B8D _ C7. 44 24, 0C, 00000001
        mov     dword [esp+8H], 7                       ; 1B95 _ C7. 44 24, 08, 00000007
        mov     edx, dword [ebp-10H]                    ; 1B9D _ 8B. 55, F0
        mov     dword [esp+4H], edx                     ; 1BA0 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1BA4 _ 89. 04 24
        call    paint_rectangle                         ; 1BA7 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 1BAC _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 1BAF _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 1BB2 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1BB5 _ 8B. 00
        mov     dword [esp+18H], edx                    ; 1BB7 _ 89. 54 24, 18
        mov     dword [esp+14H], 0                      ; 1BBB _ C7. 44 24, 14, 00000000
        mov     dword [esp+10H], 0                      ; 1BC3 _ C7. 44 24, 10, 00000000
        mov     dword [esp+0CH], 0                      ; 1BCB _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 8                       ; 1BD3 _ C7. 44 24, 08, 00000008
        mov     edx, dword [ebp-10H]                    ; 1BDB _ 8B. 55, F0
        mov     dword [esp+4H], edx                     ; 1BDE _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1BE2 _ 89. 04 24
        call    paint_rectangle                         ; 1BE5 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 1BEA _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 1BED _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 1BF0 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1BF3 _ 8B. 00
        mov     dword [esp+18H], edx                    ; 1BF5 _ 89. 54 24, 18
        mov     dword [esp+14H], 1                      ; 1BF9 _ C7. 44 24, 14, 00000001
        mov     dword [esp+10H], 1                      ; 1C01 _ C7. 44 24, 10, 00000001
        mov     dword [esp+0CH], 1                      ; 1C09 _ C7. 44 24, 0C, 00000001
        mov     dword [esp+8H], 7                       ; 1C11 _ C7. 44 24, 08, 00000007
        mov     edx, dword [ebp-10H]                    ; 1C19 _ 8B. 55, F0
        mov     dword [esp+4H], edx                     ; 1C1C _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1C20 _ 89. 04 24
        call    paint_rectangle                         ; 1C23 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 1C28 _ 8B. 45, F4
        lea     ebx, [eax-2H]                           ; 1C2B _ 8D. 58, FE
        mov     eax, dword [ebp-10H]                    ; 1C2E _ 8B. 45, F0
        lea     ecx, [eax-2H]                           ; 1C31 _ 8D. 48, FE
        mov     eax, dword [ebp-10H]                    ; 1C34 _ 8B. 45, F0
        lea     edx, [eax-2H]                           ; 1C37 _ 8D. 50, FE
        mov     eax, dword [ebp+0CH]                    ; 1C3A _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1C3D _ 8B. 00
        mov     dword [esp+18H], ebx                    ; 1C3F _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 1C43 _ 89. 4C 24, 14
        mov     dword [esp+10H], 1                      ; 1C47 _ C7. 44 24, 10, 00000001
        mov     dword [esp+0CH], edx                    ; 1C4F _ 89. 54 24, 0C
        mov     dword [esp+8H], 15                      ; 1C53 _ C7. 44 24, 08, 0000000F
        mov     edx, dword [ebp-10H]                    ; 1C5B _ 8B. 55, F0
        mov     dword [esp+4H], edx                     ; 1C5E _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1C62 _ 89. 04 24
        call    paint_rectangle                         ; 1C65 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 1C6A _ 8B. 45, F4
        lea     ebx, [eax-1H]                           ; 1C6D _ 8D. 58, FF
        mov     eax, dword [ebp-10H]                    ; 1C70 _ 8B. 45, F0
        lea     ecx, [eax-1H]                           ; 1C73 _ 8D. 48, FF
        mov     eax, dword [ebp-10H]                    ; 1C76 _ 8B. 45, F0
        lea     edx, [eax-1H]                           ; 1C79 _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 1C7C _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1C7F _ 8B. 00
        mov     dword [esp+18H], ebx                    ; 1C81 _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 1C85 _ 89. 4C 24, 14
        mov     dword [esp+10H], 0                      ; 1C89 _ C7. 44 24, 10, 00000000
        mov     dword [esp+0CH], edx                    ; 1C91 _ 89. 54 24, 0C
        mov     dword [esp+8H], 0                       ; 1C95 _ C7. 44 24, 08, 00000000
        mov     edx, dword [ebp-10H]                    ; 1C9D _ 8B. 55, F0
        mov     dword [esp+4H], edx                     ; 1CA0 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1CA4 _ 89. 04 24
        call    paint_rectangle                         ; 1CA7 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 1CAC _ 8B. 45, F4
        lea     ecx, [eax-3H]                           ; 1CAF _ 8D. 48, FD
        mov     eax, dword [ebp-10H]                    ; 1CB2 _ 8B. 45, F0
        lea     edx, [eax-3H]                           ; 1CB5 _ 8D. 50, FD
        mov     eax, dword [ebp+0CH]                    ; 1CB8 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1CBB _ 8B. 00
        mov     dword [esp+18H], ecx                    ; 1CBD _ 89. 4C 24, 18
        mov     dword [esp+14H], edx                    ; 1CC1 _ 89. 54 24, 14
        mov     dword [esp+10H], 2                      ; 1CC5 _ C7. 44 24, 10, 00000002
        mov     dword [esp+0CH], 2                      ; 1CCD _ C7. 44 24, 0C, 00000002
        mov     dword [esp+8H], 8                       ; 1CD5 _ C7. 44 24, 08, 00000008
        mov     edx, dword [ebp-10H]                    ; 1CDD _ 8B. 55, F0
        mov     dword [esp+4H], edx                     ; 1CE0 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1CE4 _ 89. 04 24
        call    paint_rectangle                         ; 1CE7 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 1CEC _ 8B. 45, F0
        lea     edx, [eax-4H]                           ; 1CEF _ 8D. 50, FC
        mov     eax, dword [ebp+0CH]                    ; 1CF2 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1CF5 _ 8B. 00
        mov     dword [esp+18H], 20                     ; 1CF7 _ C7. 44 24, 18, 00000014
        mov     dword [esp+14H], edx                    ; 1CFF _ 89. 54 24, 14
        mov     dword [esp+10H], 3                      ; 1D03 _ C7. 44 24, 10, 00000003
        mov     dword [esp+0CH], 3                      ; 1D0B _ C7. 44 24, 0C, 00000003
        mov     dword [esp+8H], 12                      ; 1D13 _ C7. 44 24, 08, 0000000C
        mov     edx, dword [ebp-10H]                    ; 1D1B _ 8B. 55, F0
        mov     dword [esp+4H], edx                     ; 1D1E _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1D22 _ 89. 04 24
        call    paint_rectangle                         ; 1D25 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 1D2A _ 8B. 45, F4
        lea     ebx, [eax-2H]                           ; 1D2D _ 8D. 58, FE
        mov     eax, dword [ebp-10H]                    ; 1D30 _ 8B. 45, F0
        lea     ecx, [eax-2H]                           ; 1D33 _ 8D. 48, FE
        mov     eax, dword [ebp-0CH]                    ; 1D36 _ 8B. 45, F4
        lea     edx, [eax-2H]                           ; 1D39 _ 8D. 50, FE
        mov     eax, dword [ebp+0CH]                    ; 1D3C _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1D3F _ 8B. 00
        mov     dword [esp+18H], ebx                    ; 1D41 _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 1D45 _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 1D49 _ 89. 54 24, 10
        mov     dword [esp+0CH], 1                      ; 1D4D _ C7. 44 24, 0C, 00000001
        mov     dword [esp+8H], 15                      ; 1D55 _ C7. 44 24, 08, 0000000F
        mov     edx, dword [ebp-10H]                    ; 1D5D _ 8B. 55, F0
        mov     dword [esp+4H], edx                     ; 1D60 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1D64 _ 89. 04 24
        call    paint_rectangle                         ; 1D67 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 1D6C _ 8B. 45, F4
        lea     ebx, [eax-1H]                           ; 1D6F _ 8D. 58, FF
        mov     eax, dword [ebp-10H]                    ; 1D72 _ 8B. 45, F0
        lea     ecx, [eax-1H]                           ; 1D75 _ 8D. 48, FF
        mov     eax, dword [ebp-0CH]                    ; 1D78 _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 1D7B _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 1D7E _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1D81 _ 8B. 00
        mov     dword [esp+18H], ebx                    ; 1D83 _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 1D87 _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 1D8B _ 89. 54 24, 10
        mov     dword [esp+0CH], 0                      ; 1D8F _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 0                       ; 1D97 _ C7. 44 24, 08, 00000000
        mov     edx, dword [ebp-10H]                    ; 1D9F _ 8B. 55, F0
        mov     dword [esp+4H], edx                     ; 1DA2 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1DA6 _ 89. 04 24
        call    paint_rectangle                         ; 1DA9 _ E8, FFFFFFFC(rel)
        movsx   eax, byte [ebp-1CH]                     ; 1DAE _ 0F BE. 45, E4
        mov     dword [esp+0CH], eax                    ; 1DB2 _ 89. 44 24, 0C
        mov     eax, dword [ebp+10H]                    ; 1DB6 _ 8B. 45, 10
        mov     dword [esp+8H], eax                     ; 1DB9 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 1DBD _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 1DC0 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1DC4 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1DC7 _ 89. 04 24
        call    make_window_title                       ; 1DCA _ E8, FFFFFFFC(rel)
        add     esp, 52                                 ; 1DCF _ 83. C4, 34
        pop     ebx                                     ; 1DD2 _ 5B
        pop     ebp                                     ; 1DD3 _ 5D
        ret                                             ; 1DD4 _ C3
; make_windows End of function

make_window_title:; Function begin
        push    ebp                                     ; 1DD5 _ 55
        mov     ebp, esp                                ; 1DD6 _ 89. E5
        push    ebx                                     ; 1DD8 _ 53
        sub     esp, 52                                 ; 1DD9 _ 83. EC, 34
        mov     eax, dword [ebp+14H]                    ; 1DDC _ 8B. 45, 14
        mov     byte [ebp-1CH], al                      ; 1DDF _ 88. 45, E4
        cmp     byte [ebp-1CH], 0                       ; 1DE2 _ 80. 7D, E4, 00
        jz      ?_052                                   ; 1DE6 _ 74, 0A
        mov     byte [ebp-12H], 7                       ; 1DE8 _ C6. 45, EE, 07
        mov     byte [ebp-11H], 12                      ; 1DEC _ C6. 45, EF, 0C
        jmp     ?_053                                   ; 1DF0 _ EB, 08

?_052:  mov     byte [ebp-12H], 8                       ; 1DF2 _ C6. 45, EE, 08
        mov     byte [ebp-11H], 15                      ; 1DF6 _ C6. 45, EF, 0F
?_053:  mov     eax, dword [ebp+0CH]                    ; 1DFA _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 1DFD _ 8B. 40, 04
        lea     ebx, [eax-4H]                           ; 1E00 _ 8D. 58, FC
        movzx   eax, byte [ebp-11H]                     ; 1E03 _ 0F B6. 45, EF
        movzx   ecx, al                                 ; 1E07 _ 0F B6. C8
        mov     eax, dword [ebp+0CH]                    ; 1E0A _ 8B. 45, 0C
        mov     edx, dword [eax+4H]                     ; 1E0D _ 8B. 50, 04
        mov     eax, dword [ebp+0CH]                    ; 1E10 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1E13 _ 8B. 00
        mov     dword [esp+18H], 20                     ; 1E15 _ C7. 44 24, 18, 00000014
        mov     dword [esp+14H], ebx                    ; 1E1D _ 89. 5C 24, 14
        mov     dword [esp+10H], 3                      ; 1E21 _ C7. 44 24, 10, 00000003
        mov     dword [esp+0CH], 3                      ; 1E29 _ C7. 44 24, 0C, 00000003
        mov     dword [esp+8H], ecx                     ; 1E31 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 1E35 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1E39 _ 89. 04 24
        call    paint_rectangle                         ; 1E3C _ E8, FFFFFFFC(rel)
        movsx   eax, byte [ebp-12H]                     ; 1E41 _ 0F BE. 45, EE
        mov     dword [esp+14H], eax                    ; 1E45 _ 89. 44 24, 14
        mov     eax, dword [ebp+10H]                    ; 1E49 _ 8B. 45, 10
        mov     dword [esp+10H], eax                    ; 1E4C _ 89. 44 24, 10
        mov     dword [esp+0CH], 4                      ; 1E50 _ C7. 44 24, 0C, 00000004
        mov     dword [esp+8H], 24                      ; 1E58 _ C7. 44 24, 08, 00000018
        mov     eax, dword [ebp+0CH]                    ; 1E60 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 1E63 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1E67 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1E6A _ 89. 04 24
        call    paint_string                            ; 1E6D _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], 0                      ; 1E72 _ C7. 45, F4, 00000000
        jmp     ?_061                                   ; 1E79 _ E9, 00000083

?_054:  mov     dword [ebp-10H], 0                      ; 1E7E _ C7. 45, F0, 00000000
        jmp     ?_060                                   ; 1E85 _ EB, 70

?_055:  mov     eax, dword [ebp-0CH]                    ; 1E87 _ 8B. 45, F4
        shl     eax, 4                                  ; 1E8A _ C1. E0, 04
        mov     edx, eax                                ; 1E8D _ 89. C2
        mov     eax, dword [ebp-10H]                    ; 1E8F _ 8B. 45, F0
        add     eax, edx                                ; 1E92 _ 01. D0
        add     eax, closebtn.1930                      ; 1E94 _ 05, 00000260(d)
        movzx   eax, byte [eax]                         ; 1E99 _ 0F B6. 00
        mov     byte [ebp-13H], al                      ; 1E9C _ 88. 45, ED
        cmp     byte [ebp-13H], 64                      ; 1E9F _ 80. 7D, ED, 40
        jnz     ?_056                                   ; 1EA3 _ 75, 06
        mov     byte [ebp-13H], 0                       ; 1EA5 _ C6. 45, ED, 00
        jmp     ?_059                                   ; 1EA9 _ EB, 1C

?_056:  cmp     byte [ebp-13H], 36                      ; 1EAB _ 80. 7D, ED, 24
        jnz     ?_057                                   ; 1EAF _ 75, 06
        mov     byte [ebp-13H], 15                      ; 1EB1 _ C6. 45, ED, 0F
        jmp     ?_059                                   ; 1EB5 _ EB, 10

?_057:  cmp     byte [ebp-13H], 81                      ; 1EB7 _ 80. 7D, ED, 51
        jnz     ?_058                                   ; 1EBB _ 75, 06
        mov     byte [ebp-13H], 8                       ; 1EBD _ C6. 45, ED, 08
        jmp     ?_059                                   ; 1EC1 _ EB, 04

?_058:  mov     byte [ebp-13H], 7                       ; 1EC3 _ C6. 45, ED, 07
?_059:  mov     eax, dword [ebp+0CH]                    ; 1EC7 _ 8B. 45, 0C
        mov     edx, dword [eax]                        ; 1ECA _ 8B. 10
        mov     eax, dword [ebp-0CH]                    ; 1ECC _ 8B. 45, F4
        lea     ecx, [eax+5H]                           ; 1ECF _ 8D. 48, 05
        mov     eax, dword [ebp+0CH]                    ; 1ED2 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 1ED5 _ 8B. 40, 04
        imul    ecx, eax                                ; 1ED8 _ 0F AF. C8
        mov     eax, dword [ebp+0CH]                    ; 1EDB _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 1EDE _ 8B. 40, 04
        lea     ebx, [eax-15H]                          ; 1EE1 _ 8D. 58, EB
        mov     eax, dword [ebp-10H]                    ; 1EE4 _ 8B. 45, F0
        add     eax, ebx                                ; 1EE7 _ 01. D8
        add     eax, ecx                                ; 1EE9 _ 01. C8
        add     edx, eax                                ; 1EEB _ 01. C2
        movzx   eax, byte [ebp-13H]                     ; 1EED _ 0F B6. 45, ED
        mov     byte [edx], al                          ; 1EF1 _ 88. 02
        add     dword [ebp-10H], 1                      ; 1EF3 _ 83. 45, F0, 01
?_060:  cmp     dword [ebp-10H], 15                     ; 1EF7 _ 83. 7D, F0, 0F
        jle     ?_055                                   ; 1EFB _ 7E, 8A
        add     dword [ebp-0CH], 1                      ; 1EFD _ 83. 45, F4, 01
?_061:  cmp     dword [ebp-0CH], 13                     ; 1F01 _ 83. 7D, F4, 0D
        jle     ?_054                                   ; 1F05 _ 0F 8E, FFFFFF73
        add     esp, 52                                 ; 1F0B _ 83. C4, 34
        pop     ebx                                     ; 1F0E _ 5B
        pop     ebp                                     ; 1F0F _ 5D
        ret                                             ; 1F10 _ C3
; make_window_title End of function

transfer_scancode:; Function begin
        push    ebp                                     ; 1F11 _ 55
        mov     ebp, esp                                ; 1F12 _ 89. E5
        sub     esp, 16                                 ; 1F14 _ 83. EC, 10
        cmp     dword [ebp+8H], 42                      ; 1F17 _ 83. 7D, 08, 2A
        jnz     ?_062                                   ; 1F1B _ 75, 0D
        mov     eax, dword [key_shift]                  ; 1F1D _ A1, 000001D0(d)
        or      eax, 01H                                ; 1F22 _ 83. C8, 01
        mov     dword [key_shift], eax                  ; 1F25 _ A3, 000001D0(d)
?_062:  cmp     dword [ebp+8H], 54                      ; 1F2A _ 83. 7D, 08, 36
        jnz     ?_063                                   ; 1F2E _ 75, 0D
        mov     eax, dword [key_shift]                  ; 1F30 _ A1, 000001D0(d)
        or      eax, 02H                                ; 1F35 _ 83. C8, 02
        mov     dword [key_shift], eax                  ; 1F38 _ A3, 000001D0(d)
?_063:  cmp     dword [ebp+8H], 170                     ; 1F3D _ 81. 7D, 08, 000000AA
        jnz     ?_064                                   ; 1F44 _ 75, 0D
        mov     eax, dword [key_shift]                  ; 1F46 _ A1, 000001D0(d)
        and     eax, 0FFFFFFFEH                         ; 1F4B _ 83. E0, FE
        mov     dword [key_shift], eax                  ; 1F4E _ A3, 000001D0(d)
?_064:  cmp     dword [ebp+8H], 182                     ; 1F53 _ 81. 7D, 08, 000000B6
        jnz     ?_065                                   ; 1F5A _ 75, 0D
        mov     eax, dword [key_shift]                  ; 1F5C _ A1, 000001D0(d)
        and     eax, 0FFFFFFFDH                         ; 1F61 _ 83. E0, FD
        mov     dword [key_shift], eax                  ; 1F64 _ A3, 000001D0(d)
?_065:  cmp     dword [ebp+8H], 58                      ; 1F69 _ 83. 7D, 08, 3A
        jnz     ?_067                                   ; 1F6D _ 75, 1F
        mov     eax, dword [caps_lock]                  ; 1F6F _ A1, 000001D4(d)
        test    eax, eax                                ; 1F74 _ 85. C0
        jnz     ?_066                                   ; 1F76 _ 75, 0C
        mov     dword [caps_lock], 1                    ; 1F78 _ C7. 05, 000001D4(d), 00000001
        jmp     ?_067                                   ; 1F82 _ EB, 0A

?_066:  mov     dword [caps_lock], 0                    ; 1F84 _ C7. 05, 000001D4(d), 00000000
?_067:  cmp     dword [ebp+8H], 42                      ; 1F8E _ 83. 7D, 08, 2A
        jz      ?_068                                   ; 1F92 _ 74, 24
        cmp     dword [ebp+8H], 54                      ; 1F94 _ 83. 7D, 08, 36
        jz      ?_068                                   ; 1F98 _ 74, 1E
        cmp     dword [ebp+8H], 170                     ; 1F9A _ 81. 7D, 08, 000000AA
        jz      ?_068                                   ; 1FA1 _ 74, 15
        cmp     dword [ebp+8H], 182                     ; 1FA3 _ 81. 7D, 08, 000000B6
        jz      ?_068                                   ; 1FAA _ 74, 0C
        cmp     dword [ebp+8H], 127                     ; 1FAC _ 83. 7D, 08, 7F
        jg      ?_068                                   ; 1FB0 _ 7F, 06
        cmp     dword [ebp+8H], 58                      ; 1FB2 _ 83. 7D, 08, 3A
        jnz     ?_069                                   ; 1FB6 _ 75, 0A
?_068:  mov     eax, 0                                  ; 1FB8 _ B8, 00000000
        jmp     ?_074                                   ; 1FBD _ E9, 00000089

?_069:  mov     byte [ebp-1H], 0                        ; 1FC2 _ C6. 45, FF, 00
        mov     eax, dword [key_shift]                  ; 1FC6 _ A1, 000001D0(d)
        test    eax, eax                                ; 1FCB _ 85. C0
        jnz     ?_071                                   ; 1FCD _ 75, 46
        cmp     dword [ebp+8H], 127                     ; 1FCF _ 83. 7D, 08, 7F
        jg      ?_071                                   ; 1FD3 _ 7F, 40
        mov     eax, dword [ebp+8H]                     ; 1FD5 _ 8B. 45, 08
        add     eax, keytable                           ; 1FD8 _ 05, 00000020(d)
        movzx   eax, byte [eax]                         ; 1FDD _ 0F B6. 00
        test    al, al                                  ; 1FE0 _ 84. C0
        jz      ?_071                                   ; 1FE2 _ 74, 31
        mov     eax, dword [ebp+8H]                     ; 1FE4 _ 8B. 45, 08
        add     eax, keytable                           ; 1FE7 _ 05, 00000020(d)
        movzx   eax, byte [eax]                         ; 1FEC _ 0F B6. 00
        mov     byte [ebp-1H], al                       ; 1FEF _ 88. 45, FF
        cmp     byte [ebp-1H], 64                       ; 1FF2 _ 80. 7D, FF, 40
        jle     ?_070                                   ; 1FF6 _ 7E, 1B
        cmp     byte [ebp-1H], 90                       ; 1FF8 _ 80. 7D, FF, 5A
        jg      ?_070                                   ; 1FFC _ 7F, 15
        mov     eax, dword [caps_lock]                  ; 1FFE _ A1, 000001D4(d)
        test    eax, eax                                ; 2003 _ 85. C0
        jnz     ?_070                                   ; 2005 _ 75, 0C
        movzx   eax, byte [ebp-1H]                      ; 2007 _ 0F B6. 45, FF
        add     eax, 32                                 ; 200B _ 83. C0, 20
        mov     byte [ebp-1H], al                       ; 200E _ 88. 45, FF
        jmp     ?_073                                   ; 2011 _ EB, 34

?_070:  jmp     ?_073                                   ; 2013 _ EB, 32

?_071:  mov     eax, dword [key_shift]                  ; 2015 _ A1, 000001D0(d)
        test    eax, eax                                ; 201A _ 85. C0
        jz      ?_072                                   ; 201C _ 74, 25
        cmp     dword [ebp+8H], 83                      ; 201E _ 83. 7D, 08, 53
        jg      ?_072                                   ; 2022 _ 7F, 1F
        mov     eax, dword [ebp+8H]                     ; 2024 _ 8B. 45, 08
        add     eax, keytable_shift                     ; 2027 _ 05, 000000A0(d)
        movzx   eax, byte [eax]                         ; 202C _ 0F B6. 00
        test    al, al                                  ; 202F _ 84. C0
        jz      ?_072                                   ; 2031 _ 74, 10
        mov     eax, dword [ebp+8H]                     ; 2033 _ 8B. 45, 08
        add     eax, keytable_shift                     ; 2036 _ 05, 000000A0(d)
        movzx   eax, byte [eax]                         ; 203B _ 0F B6. 00
        mov     byte [ebp-1H], al                       ; 203E _ 88. 45, FF
        jmp     ?_073                                   ; 2041 _ EB, 04

?_072:  mov     byte [ebp-1H], 0                        ; 2043 _ C6. 45, FF, 00
?_073:  movzx   eax, byte [ebp-1H]                      ; 2047 _ 0F B6. 45, FF
?_074:  leave                                           ; 204B _ C9
        ret                                             ; 204C _ C3
; transfer_scancode End of function

is_special_key:; Function begin
        push    ebp                                     ; 204D _ 55
        mov     ebp, esp                                ; 204E _ 89. E5
        sub     esp, 4                                  ; 2050 _ 83. EC, 04
        mov     eax, dword [ebp+8H]                     ; 2053 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2056 _ 89. 04 24
        call    transfer_scancode                       ; 2059 _ E8, FFFFFFFC(rel)
        cmp     dword [ebp+8H], 42                      ; 205E _ 83. 7D, 08, 2A
        jz      ?_075                                   ; 2062 _ 74, 27
        cmp     dword [ebp+8H], 54                      ; 2064 _ 83. 7D, 08, 36
        jz      ?_075                                   ; 2068 _ 74, 21
        cmp     dword [ebp+8H], 170                     ; 206A _ 81. 7D, 08, 000000AA
        jz      ?_075                                   ; 2071 _ 74, 18
        cmp     dword [ebp+8H], 182                     ; 2073 _ 81. 7D, 08, 000000B6
        jz      ?_075                                   ; 207A _ 74, 0F
        cmp     dword [ebp+8H], 58                      ; 207C _ 83. 7D, 08, 3A
        jz      ?_075                                   ; 2080 _ 74, 09
        cmp     dword [ebp+8H], 186                     ; 2082 _ 81. 7D, 08, 000000BA
        jnz     ?_076                                   ; 2089 _ 75, 07
?_075:  mov     eax, 1                                  ; 208B _ B8, 00000001
        jmp     ?_077                                   ; 2090 _ EB, 05

?_076:  mov     eax, 0                                  ; 2092 _ B8, 00000000
?_077:  leave                                           ; 2097 _ C9
        ret                                             ; 2098 _ C3
; is_special_key End of function

console_task:; Function begin
        push    ebp                                     ; 2099 _ 55
        mov     ebp, esp                                ; 209A _ 89. E5
        sub     esp, 328                                ; 209C _ 81. EC, 00000148
        mov     eax, dword [ebp+8H]                     ; 20A2 _ 8B. 45, 08
        mov     dword [ebp-12CH], eax                   ; 20A5 _ 89. 85, FFFFFED4
; Note: Absolute memory address without relocation
        mov     eax, dword [gs:14H]                     ; 20AB _ 65: A1, 00000014
        mov     dword [ebp-0CH], eax                    ; 20B1 _ 89. 45, F4
        xor     eax, eax                                ; 20B4 _ 31. C0
        mov     dword [ebp-118H], 78848                 ; 20B6 _ C7. 85, FFFFFEE8, 00013400
        call    task_now                                ; 20C0 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0E4H], eax                   ; 20C5 _ 89. 85, FFFFFF1C
        mov     dword [ebp-114H], 16                    ; 20CB _ C7. 85, FFFFFEEC, 00000010
        mov     dword [ebp-110H], 28                    ; 20D5 _ C7. 85, FFFFFEF0, 0000001C
        mov     dword [ebp-10CH], 0                     ; 20DF _ C7. 85, FFFFFEF4, 00000000
        mov     dword [ebp-108H], 0                     ; 20E9 _ C7. 85, FFFFFEF8, 00000000
        mov     dword [ebp-104H], 0                     ; 20F3 _ C7. 85, FFFFFEFC, 00000000
        mov     eax, dword [ebp-0E4H]                   ; 20FD _ 8B. 85, FFFFFF1C
        lea     edx, [eax+10H]                          ; 2103 _ 8D. 50, 10
        mov     eax, dword [ebp-0E4H]                   ; 2106 _ 8B. 85, FFFFFF1C
        mov     dword [esp+0CH], eax                    ; 210C _ 89. 44 24, 0C
        lea     eax, [ebp-8CH]                          ; 2110 _ 8D. 85, FFFFFF74
        mov     dword [esp+8H], eax                     ; 2116 _ 89. 44 24, 08
        mov     dword [esp+4H], 128                     ; 211A _ C7. 44 24, 04, 00000080
        mov     dword [esp], edx                        ; 2122 _ 89. 14 24
        call    fifo8_init                              ; 2125 _ E8, FFFFFFFC(rel)
        call    timer_alloc                             ; 212A _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0E0H], eax                   ; 212F _ 89. 85, FFFFFF20
        mov     eax, dword [ebp-0E4H]                   ; 2135 _ 8B. 85, FFFFFF1C
        add     eax, 16                                 ; 213B _ 83. C0, 10
        mov     dword [esp+8H], 1                       ; 213E _ C7. 44 24, 08, 00000001
        mov     dword [esp+4H], eax                     ; 2146 _ 89. 44 24, 04
        mov     eax, dword [ebp-0E0H]                   ; 214A _ 8B. 85, FFFFFF20
        mov     dword [esp], eax                        ; 2150 _ 89. 04 24
        call    timer_init                              ; 2153 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 50                      ; 2158 _ C7. 44 24, 04, 00000032
        mov     eax, dword [ebp-0E0H]                   ; 2160 _ 8B. 85, FFFFFF20
        mov     dword [esp], eax                        ; 2166 _ 89. 04 24
        call    timer_settime                           ; 2169 _ E8, FFFFFFFC(rel)
        mov     eax, dword [sheet_control]              ; 216E _ A1, 00000000(d)
        mov     dword [esp+14H], 7                      ; 2173 _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_293                  ; 217B _ C7. 44 24, 10, 00000060(d)
        mov     dword [esp+0CH], 28                     ; 2183 _ C7. 44 24, 0C, 0000001C
        mov     dword [esp+8H], 8                       ; 218B _ C7. 44 24, 08, 00000008
        mov     edx, dword [ebp-12CH]                   ; 2193 _ 8B. 95, FFFFFED4
        mov     dword [esp+4H], edx                     ; 2199 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 219D _ 89. 04 24
        call    paint_string                            ; 21A0 _ E8, FFFFFFFC(rel)
?_078:  call    io_cli                                  ; 21A5 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0E4H]                   ; 21AA _ 8B. 85, FFFFFF1C
        add     eax, 16                                 ; 21B0 _ 83. C0, 10
        mov     dword [esp], eax                        ; 21B3 _ 89. 04 24
        call    fifo8_status                            ; 21B6 _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 21BB _ 85. C0
        jnz     ?_079                                   ; 21BD _ 75, 0A
        call    io_sti                                  ; 21BF _ E8, FFFFFFFC(rel)
        jmp     ?_121                                   ; 21C4 _ E9, 00000A73

?_079:  mov     eax, dword [ebp-0E4H]                   ; 21C9 _ 8B. 85, FFFFFF1C
        add     eax, 16                                 ; 21CF _ 83. C0, 10
        mov     dword [esp], eax                        ; 21D2 _ 89. 04 24
        call    fifo8_get                               ; 21D5 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0DCH], eax                   ; 21DA _ 89. 85, FFFFFF24
        call    io_sti                                  ; 21E0 _ E8, FFFFFFFC(rel)
        cmp     dword [ebp-0DCH], 1                     ; 21E5 _ 83. BD, FFFFFF24, 01
        jg      ?_082                                   ; 21EC _ 0F 8F, 0000008D
        cmp     dword [ebp-10CH], 0                     ; 21F2 _ 83. BD, FFFFFEF4, 00
        js      ?_082                                   ; 21F9 _ 0F 88, 00000080
        cmp     dword [ebp-0DCH], 0                     ; 21FF _ 83. BD, FFFFFF24, 00
        jz      ?_080                                   ; 2206 _ 74, 2F
        mov     eax, dword [ebp-0E4H]                   ; 2208 _ 8B. 85, FFFFFF1C
        add     eax, 16                                 ; 220E _ 83. C0, 10
        mov     dword [esp+8H], 0                       ; 2211 _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], eax                     ; 2219 _ 89. 44 24, 04
        mov     eax, dword [ebp-0E0H]                   ; 221D _ 8B. 85, FFFFFF20
        mov     dword [esp], eax                        ; 2223 _ 89. 04 24
        call    timer_init                              ; 2226 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10CH], 7                     ; 222B _ C7. 85, FFFFFEF4, 00000007
        jmp     ?_081                                   ; 2235 _ EB, 2D

?_080:  mov     eax, dword [ebp-0E4H]                   ; 2237 _ 8B. 85, FFFFFF1C
        add     eax, 16                                 ; 223D _ 83. C0, 10
        mov     dword [esp+8H], 1                       ; 2240 _ C7. 44 24, 08, 00000001
        mov     dword [esp+4H], eax                     ; 2248 _ 89. 44 24, 04
        mov     eax, dword [ebp-0E0H]                   ; 224C _ 8B. 85, FFFFFF20
        mov     dword [esp], eax                        ; 2252 _ 89. 04 24
        call    timer_init                              ; 2255 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10CH], 0                     ; 225A _ C7. 85, FFFFFEF4, 00000000
?_081:  mov     dword [esp+4H], 50                      ; 2264 _ C7. 44 24, 04, 00000032
        mov     eax, dword [ebp-0E0H]                   ; 226C _ 8B. 85, FFFFFF20
        mov     dword [esp], eax                        ; 2272 _ 89. 04 24
        call    timer_settime                           ; 2275 _ E8, FFFFFFFC(rel)
        jmp     ?_120                                   ; 227A _ E9, 0000097A

?_082:  cmp     dword [ebp-0DCH], 87                    ; 227F _ 83. BD, FFFFFF24, 57
        jnz     ?_083                                   ; 2286 _ 75, 48
        mov     dword [ebp-10CH], 7                     ; 2288 _ C7. 85, FFFFFEF4, 00000007
        mov     eax, dword [ebp-0E4H]                   ; 2292 _ 8B. 85, FFFFFF1C
        add     eax, 16                                 ; 2298 _ 83. C0, 10
        mov     dword [esp+8H], 0                       ; 229B _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], eax                     ; 22A3 _ 89. 44 24, 04
        mov     eax, dword [ebp-0E0H]                   ; 22A7 _ 8B. 85, FFFFFF20
        mov     dword [esp], eax                        ; 22AD _ 89. 04 24
        call    timer_init                              ; 22B0 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 50                      ; 22B5 _ C7. 44 24, 04, 00000032
        mov     eax, dword [ebp-0E0H]                   ; 22BD _ 8B. 85, FFFFFF20
        mov     dword [esp], eax                        ; 22C3 _ 89. 04 24
        call    timer_settime                           ; 22C6 _ E8, FFFFFFFC(rel)
        jmp     ?_120                                   ; 22CB _ E9, 00000929

?_083:  cmp     dword [ebp-0DCH], 88                    ; 22D0 _ 83. BD, FFFFFF24, 58
        jnz     ?_084                                   ; 22D7 _ 75, 5F
        mov     eax, dword [sheet_control]              ; 22D9 _ A1, 00000000(d)
        mov     dword [esp+10H], 0                      ; 22DE _ C7. 44 24, 10, 00000000
        mov     edx, dword [ebp-110H]                   ; 22E6 _ 8B. 95, FFFFFEF0
        mov     dword [esp+0CH], edx                    ; 22EC _ 89. 54 24, 0C
        mov     edx, dword [ebp-114H]                   ; 22F0 _ 8B. 95, FFFFFEEC
        mov     dword [esp+8H], edx                     ; 22F6 _ 89. 54 24, 08
        mov     edx, dword [ebp-12CH]                   ; 22FA _ 8B. 95, FFFFFED4
        mov     dword [esp+4H], edx                     ; 2300 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 2304 _ 89. 04 24
        call    set_cursor                              ; 2307 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10CH], -1                    ; 230C _ C7. 85, FFFFFEF4, FFFFFFFF
        mov     eax, dword [task_main]                  ; 2316 _ A1, 00000000(d)
        mov     dword [esp+8H], 0                       ; 231B _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], -1                      ; 2323 _ C7. 44 24, 04, FFFFFFFF
        mov     dword [esp], eax                        ; 232B _ 89. 04 24
        call    task_run                                ; 232E _ E8, FFFFFFFC(rel)
        jmp     ?_120                                   ; 2333 _ E9, 000008C1

?_084:  cmp     dword [ebp-0DCH], 28                    ; 2338 _ 83. BD, FFFFFF24, 1C
        jne     ?_118                                   ; 233F _ 0F 85, 00000752
        mov     eax, dword [sheet_control]              ; 2345 _ A1, 00000000(d)
        mov     dword [esp+10H], 0                      ; 234A _ C7. 44 24, 10, 00000000
        mov     edx, dword [ebp-110H]                   ; 2352 _ 8B. 95, FFFFFEF0
        mov     dword [esp+0CH], edx                    ; 2358 _ 89. 54 24, 0C
        mov     edx, dword [ebp-114H]                   ; 235C _ 8B. 95, FFFFFEEC
        mov     dword [esp+8H], edx                     ; 2362 _ 89. 54 24, 08
        mov     edx, dword [ebp-12CH]                   ; 2366 _ 8B. 95, FFFFFED4
        mov     dword [esp+4H], edx                     ; 236C _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 2370 _ 89. 04 24
        call    set_cursor                              ; 2373 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-114H]                   ; 2378 _ 8B. 85, FFFFFEEC
        lea     edx, [eax+7H]                           ; 237E _ 8D. 50, 07
        test    eax, eax                                ; 2381 _ 85. C0
        cmovs   eax, edx                                ; 2383 _ 0F 48. C2
        sar     eax, 3                                  ; 2386 _ C1. F8, 03
        sub     eax, 2                                  ; 2389 _ 83. E8, 02
        mov     byte [ebp+eax-0AAH], 0                  ; 238C _ C6. 84 05, FFFFFF56, 00
        mov     eax, dword [ebp-12CH]                   ; 2394 _ 8B. 85, FFFFFED4
        mov     dword [esp+4H], eax                     ; 239A _ 89. 44 24, 04
        mov     eax, dword [ebp-110H]                   ; 239E _ 8B. 85, FFFFFEF0
        mov     dword [esp], eax                        ; 23A4 _ 89. 04 24
        call    console_new_line                        ; 23A7 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-110H], eax                   ; 23AC _ 89. 85, FFFFFEF0
        mov     dword [esp+4H], ?_294                   ; 23B2 _ C7. 44 24, 04, 00000062(d)
        lea     eax, [ebp-0AAH]                         ; 23BA _ 8D. 85, FFFFFF56
        mov     dword [esp], eax                        ; 23C0 _ 89. 04 24
        call    strcmp                                  ; 23C3 _ E8, FFFFFFFC(rel)
        cmp     eax, 1                                  ; 23C8 _ 83. F8, 01
        jne     ?_085                                   ; 23CB _ 0F 85, 000000EF
        mov     eax, dword [ebp+0CH]                    ; 23D1 _ 8B. 45, 0C
        lea     edx, [eax+3FFH]                         ; 23D4 _ 8D. 90, 000003FF
        test    eax, eax                                ; 23DA _ 85. C0
        cmovs   eax, edx                                ; 23DC _ 0F 48. C2
        sar     eax, 10                                 ; 23DF _ C1. F8, 0A
        mov     dword [esp], eax                        ; 23E2 _ 89. 04 24
        call    intToHexStr                             ; 23E5 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0D8H], eax                   ; 23EA _ 89. 85, FFFFFF28
        mov     eax, dword [sheet_control]              ; 23F0 _ A1, 00000000(d)
        mov     dword [esp+14H], 7                      ; 23F5 _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_295                  ; 23FD _ C7. 44 24, 10, 00000066(d)
        mov     edx, dword [ebp-110H]                   ; 2405 _ 8B. 95, FFFFFEF0
        mov     dword [esp+0CH], edx                    ; 240B _ 89. 54 24, 0C
        mov     dword [esp+8H], 16                      ; 240F _ C7. 44 24, 08, 00000010
        mov     edx, dword [ebp-12CH]                   ; 2417 _ 8B. 95, FFFFFED4
        mov     dword [esp+4H], edx                     ; 241D _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 2421 _ 89. 04 24
        call    paint_string                            ; 2424 _ E8, FFFFFFFC(rel)
        mov     eax, dword [sheet_control]              ; 2429 _ A1, 00000000(d)
        mov     dword [esp+14H], 7                      ; 242E _ C7. 44 24, 14, 00000007
        mov     edx, dword [ebp-0D8H]                   ; 2436 _ 8B. 95, FFFFFF28
        mov     dword [esp+10H], edx                    ; 243C _ 89. 54 24, 10
        mov     edx, dword [ebp-110H]                   ; 2440 _ 8B. 95, FFFFFEF0
        mov     dword [esp+0CH], edx                    ; 2446 _ 89. 54 24, 0C
        mov     dword [esp+8H], 52                      ; 244A _ C7. 44 24, 08, 00000034
        mov     edx, dword [ebp-12CH]                   ; 2452 _ 8B. 95, FFFFFED4
        mov     dword [esp+4H], edx                     ; 2458 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 245C _ 89. 04 24
        call    paint_string                            ; 245F _ E8, FFFFFFFC(rel)
        mov     eax, dword [sheet_control]              ; 2464 _ A1, 00000000(d)
        mov     dword [esp+14H], 7                      ; 2469 _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_296                  ; 2471 _ C7. 44 24, 10, 0000006C(d)
        mov     edx, dword [ebp-110H]                   ; 2479 _ 8B. 95, FFFFFEF0
        mov     dword [esp+0CH], edx                    ; 247F _ 89. 54 24, 0C
        mov     dword [esp+8H], 126                     ; 2483 _ C7. 44 24, 08, 0000007E
        mov     edx, dword [ebp-12CH]                   ; 248B _ 8B. 95, FFFFFED4
        mov     dword [esp+4H], edx                     ; 2491 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 2495 _ 89. 04 24
        call    paint_string                            ; 2498 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-12CH]                   ; 249D _ 8B. 85, FFFFFED4
        mov     dword [esp+4H], eax                     ; 24A3 _ 89. 44 24, 04
        mov     eax, dword [ebp-110H]                   ; 24A7 _ 8B. 85, FFFFFEF0
        mov     dword [esp], eax                        ; 24AD _ 89. 04 24
        call    console_new_line                        ; 24B0 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-110H], eax                   ; 24B5 _ 89. 85, FFFFFEF0
        jmp     ?_117                                   ; 24BB _ E9, 000005C8

?_085:  mov     dword [esp+4H], ?_297                   ; 24C0 _ C7. 44 24, 04, 00000070(d)
        lea     eax, [ebp-0AAH]                         ; 24C8 _ 8D. 85, FFFFFF56
        mov     dword [esp], eax                        ; 24CE _ 89. 04 24
        call    strcmp                                  ; 24D1 _ E8, FFFFFFFC(rel)
        cmp     eax, 1                                  ; 24D6 _ 83. F8, 01
        jne     ?_090                                   ; 24D9 _ 0F 85, 000000E2
        mov     dword [ebp-104H], 28                    ; 24DF _ C7. 85, FFFFFEFC, 0000001C
        jmp     ?_089                                   ; 24E9 _ EB, 4D

?_086:  mov     dword [ebp-108H], 8                     ; 24EB _ C7. 85, FFFFFEF8, 00000008
        jmp     ?_088                                   ; 24F5 _ EB, 2E

?_087:  mov     eax, dword [ebp-12CH]                   ; 24F7 _ 8B. 85, FFFFFED4
        mov     edx, dword [eax]                        ; 24FD _ 8B. 10
        mov     eax, dword [ebp-12CH]                   ; 24FF _ 8B. 85, FFFFFED4
        mov     eax, dword [eax+4H]                     ; 2505 _ 8B. 40, 04
        imul    eax, dword [ebp-104H]                   ; 2508 _ 0F AF. 85, FFFFFEFC
        mov     ecx, eax                                ; 250F _ 89. C1
        mov     eax, dword [ebp-108H]                   ; 2511 _ 8B. 85, FFFFFEF8
        add     eax, ecx                                ; 2517 _ 01. C8
        add     eax, edx                                ; 2519 _ 01. D0
        mov     byte [eax], 0                           ; 251B _ C6. 00, 00
        add     dword [ebp-108H], 1                     ; 251E _ 83. 85, FFFFFEF8, 01
?_088:  cmp     dword [ebp-108H], 247                   ; 2525 _ 81. BD, FFFFFEF8, 000000F7
        jle     ?_087                                   ; 252F _ 7E, C6
        add     dword [ebp-104H], 1                     ; 2531 _ 83. 85, FFFFFEFC, 01
?_089:  cmp     dword [ebp-104H], 155                   ; 2538 _ 81. BD, FFFFFEFC, 0000009B
        jle     ?_086                                   ; 2542 _ 7E, A7
        mov     eax, dword [sheet_control]              ; 2544 _ A1, 00000000(d)
        mov     dword [esp+14H], 156                    ; 2549 _ C7. 44 24, 14, 0000009C
        mov     dword [esp+10H], 248                    ; 2551 _ C7. 44 24, 10, 000000F8
        mov     dword [esp+0CH], 28                     ; 2559 _ C7. 44 24, 0C, 0000001C
        mov     dword [esp+8H], 8                       ; 2561 _ C7. 44 24, 08, 00000008
        mov     edx, dword [ebp-12CH]                   ; 2569 _ 8B. 95, FFFFFED4
        mov     dword [esp+4H], edx                     ; 256F _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 2573 _ 89. 04 24
        call    sheet_refresh                           ; 2576 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-110H], 28                    ; 257B _ C7. 85, FFFFFEF0, 0000001C
        mov     eax, dword [sheet_control]              ; 2585 _ A1, 00000000(d)
        mov     dword [esp+14H], 7                      ; 258A _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_293                  ; 2592 _ C7. 44 24, 10, 00000060(d)
        mov     dword [esp+0CH], 28                     ; 259A _ C7. 44 24, 0C, 0000001C
        mov     dword [esp+8H], 8                       ; 25A2 _ C7. 44 24, 08, 00000008
        mov     edx, dword [ebp-12CH]                   ; 25AA _ 8B. 95, FFFFFED4
        mov     dword [esp+4H], edx                     ; 25B0 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 25B4 _ 89. 04 24
        call    paint_string                            ; 25B7 _ E8, FFFFFFFC(rel)
        jmp     ?_117                                   ; 25BC _ E9, 000004C7

?_090:  mov     dword [esp+4H], ?_298                   ; 25C1 _ C7. 44 24, 04, 00000074(d)
        lea     eax, [ebp-0AAH]                         ; 25C9 _ 8D. 85, FFFFFF56
        mov     dword [esp], eax                        ; 25CF _ 89. 04 24
        call    strcmp                                  ; 25D2 _ E8, FFFFFFFC(rel)
        cmp     eax, 1                                  ; 25D7 _ 83. F8, 01
        jne     ?_099                                   ; 25DA _ 0F 85, 000001AE
        jmp     ?_098                                   ; 25E0 _ E9, 00000189

?_091:  mov     byte [ebp-0ABH], 0                      ; 25E5 _ C6. 85, FFFFFF55, 00
        mov     dword [ebp-100H], 0                     ; 25EC _ C7. 85, FFFFFF00, 00000000
        jmp     ?_094                                   ; 25F6 _ EB, 41

?_092:  mov     edx, dword [ebp-118H]                   ; 25F8 _ 8B. 95, FFFFFEE8
        mov     eax, dword [ebp-100H]                   ; 25FE _ 8B. 85, FFFFFF00
        add     eax, edx                                ; 2604 _ 01. D0
        movzx   eax, byte [eax]                         ; 2606 _ 0F B6. 00
        test    al, al                                  ; 2609 _ 84. C0
        jz      ?_093                                   ; 260B _ 74, 2A
        mov     edx, dword [ebp-118H]                   ; 260D _ 8B. 95, FFFFFEE8
        mov     eax, dword [ebp-100H]                   ; 2613 _ 8B. 85, FFFFFF00
        add     eax, edx                                ; 2619 _ 01. D0
        movzx   eax, byte [eax]                         ; 261B _ 0F B6. 00
        lea     ecx, [ebp-0B7H]                         ; 261E _ 8D. 8D, FFFFFF49
        mov     edx, dword [ebp-100H]                   ; 2624 _ 8B. 95, FFFFFF00
        add     edx, ecx                                ; 262A _ 01. CA
        mov     byte [edx], al                          ; 262C _ 88. 02
        add     dword [ebp-100H], 1                     ; 262E _ 83. 85, FFFFFF00, 01
        jmp     ?_094                                   ; 2635 _ EB, 02

?_093:  jmp     ?_095                                   ; 2637 _ EB, 09

?_094:  cmp     dword [ebp-100H], 7                     ; 2639 _ 83. BD, FFFFFF00, 07
        jle     ?_092                                   ; 2640 _ 7E, B6
?_095:  lea     edx, [ebp-0B7H]                         ; 2642 _ 8D. 95, FFFFFF49
        mov     eax, dword [ebp-100H]                   ; 2648 _ 8B. 85, FFFFFF00
        add     eax, edx                                ; 264E _ 01. D0
        mov     byte [eax], 46                          ; 2650 _ C6. 00, 2E
        add     dword [ebp-100H], 1                     ; 2653 _ 83. 85, FFFFFF00, 01
        mov     dword [ebp-0FCH], 0                     ; 265A _ C7. 85, FFFFFF04, 00000000
        jmp     ?_097                                   ; 2664 _ EB, 30

?_096:  mov     edx, dword [ebp-118H]                   ; 2666 _ 8B. 95, FFFFFEE8
        mov     eax, dword [ebp-0FCH]                   ; 266C _ 8B. 85, FFFFFF04
        add     eax, edx                                ; 2672 _ 01. D0
        movzx   eax, byte [eax+8H]                      ; 2674 _ 0F B6. 40, 08
        lea     ecx, [ebp-0B7H]                         ; 2678 _ 8D. 8D, FFFFFF49
        mov     edx, dword [ebp-100H]                   ; 267E _ 8B. 95, FFFFFF00
        add     edx, ecx                                ; 2684 _ 01. CA
        mov     byte [edx], al                          ; 2686 _ 88. 02
        add     dword [ebp-100H], 1                     ; 2688 _ 83. 85, FFFFFF00, 01
        add     dword [ebp-0FCH], 1                     ; 268F _ 83. 85, FFFFFF04, 01
?_097:  cmp     dword [ebp-0FCH], 2                     ; 2696 _ 83. BD, FFFFFF04, 02
        jle     ?_096                                   ; 269D _ 7E, C7
        lea     edx, [ebp-0B7H]                         ; 269F _ 8D. 95, FFFFFF49
        mov     eax, dword [ebp-100H]                   ; 26A5 _ 8B. 85, FFFFFF00
        add     eax, edx                                ; 26AB _ 01. D0
        mov     byte [eax], 0                           ; 26AD _ C6. 00, 00
        mov     eax, dword [sheet_control]              ; 26B0 _ A1, 00000000(d)
        mov     dword [esp+14H], 7                      ; 26B5 _ C7. 44 24, 14, 00000007
        lea     edx, [ebp-0B7H]                         ; 26BD _ 8D. 95, FFFFFF49
        mov     dword [esp+10H], edx                    ; 26C3 _ 89. 54 24, 10
        mov     edx, dword [ebp-110H]                   ; 26C7 _ 8B. 95, FFFFFEF0
        mov     dword [esp+0CH], edx                    ; 26CD _ 89. 54 24, 0C
        mov     dword [esp+8H], 16                      ; 26D1 _ C7. 44 24, 08, 00000010
        mov     edx, dword [ebp-12CH]                   ; 26D9 _ 8B. 95, FFFFFED4
        mov     dword [esp+4H], edx                     ; 26DF _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 26E3 _ 89. 04 24
        call    paint_string                            ; 26E6 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0D4H], 136                   ; 26EB _ C7. 85, FFFFFF2C, 00000088
        mov     eax, dword [ebp-118H]                   ; 26F5 _ 8B. 85, FFFFFEE8
        mov     eax, dword [eax+1CH]                    ; 26FB _ 8B. 40, 1C
        mov     dword [esp], eax                        ; 26FE _ 89. 04 24
        call    intToHexStr                             ; 2701 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0D0H], eax                   ; 2706 _ 89. 85, FFFFFF30
        mov     eax, dword [sheet_control]              ; 270C _ A1, 00000000(d)
        mov     dword [esp+14H], 7                      ; 2711 _ C7. 44 24, 14, 00000007
        mov     edx, dword [ebp-0D0H]                   ; 2719 _ 8B. 95, FFFFFF30
        mov     dword [esp+10H], edx                    ; 271F _ 89. 54 24, 10
        mov     edx, dword [ebp-110H]                   ; 2723 _ 8B. 95, FFFFFEF0
        mov     dword [esp+0CH], edx                    ; 2729 _ 89. 54 24, 0C
        mov     edx, dword [ebp-0D4H]                   ; 272D _ 8B. 95, FFFFFF2C
        mov     dword [esp+8H], edx                     ; 2733 _ 89. 54 24, 08
        mov     edx, dword [ebp-12CH]                   ; 2737 _ 8B. 95, FFFFFED4
        mov     dword [esp+4H], edx                     ; 273D _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 2741 _ 89. 04 24
        call    paint_string                            ; 2744 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-12CH]                   ; 2749 _ 8B. 85, FFFFFED4
        mov     dword [esp+4H], eax                     ; 274F _ 89. 44 24, 04
        mov     eax, dword [ebp-110H]                   ; 2753 _ 8B. 85, FFFFFEF0
        mov     dword [esp], eax                        ; 2759 _ 89. 04 24
        call    console_new_line                        ; 275C _ E8, FFFFFFFC(rel)
        mov     dword [ebp-110H], eax                   ; 2761 _ 89. 85, FFFFFEF0
        add     dword [ebp-118H], 32                    ; 2767 _ 83. 85, FFFFFEE8, 20
?_098:  mov     eax, dword [ebp-118H]                   ; 276E _ 8B. 85, FFFFFEE8
        movzx   eax, byte [eax]                         ; 2774 _ 0F B6. 00
        test    al, al                                  ; 2777 _ 84. C0
        jne     ?_091                                   ; 2779 _ 0F 85, FFFFFE66
        mov     dword [ebp-118H], 78848                 ; 277F _ C7. 85, FFFFFEE8, 00013400
        jmp     ?_117                                   ; 2789 _ E9, 000002FA

?_099:  movzx   eax, byte [ebp-0AAH]                    ; 278E _ 0F B6. 85, FFFFFF56
        cmp     al, 116                                 ; 2795 _ 3C, 74
        jne     ?_117                                   ; 2797 _ 0F 85, 000002EB
        movzx   eax, byte [ebp-0A9H]                    ; 279D _ 0F B6. 85, FFFFFF57
        cmp     al, 121                                 ; 27A4 _ 3C, 79
        jne     ?_117                                   ; 27A6 _ 0F 85, 000002DC
        movzx   eax, byte [ebp-0A8H]                    ; 27AC _ 0F B6. 85, FFFFFF58
        cmp     al, 112                                 ; 27B3 _ 3C, 70
        jne     ?_117                                   ; 27B5 _ 0F 85, 000002CD
        movzx   eax, byte [ebp-0A7H]                    ; 27BB _ 0F B6. 85, FFFFFF59
        cmp     al, 101                                 ; 27C2 _ 3C, 65
        jne     ?_117                                   ; 27C4 _ 0F 85, 000002BE
        mov     byte [ebp-0B8H], 0                      ; 27CA _ C6. 85, FFFFFF48, 00
        mov     dword [ebp-0F8H], 0                     ; 27D1 _ C7. 85, FFFFFF08, 00000000
        mov     dword [ebp-0F4H], 5                     ; 27DB _ C7. 85, FFFFFF0C, 00000005
        jmp     ?_102                                   ; 27E5 _ EB, 48

?_100:  lea     edx, [ebp-0AAH]                         ; 27E7 _ 8D. 95, FFFFFF56
        mov     eax, dword [ebp-0F4H]                   ; 27ED _ 8B. 85, FFFFFF0C
        add     eax, edx                                ; 27F3 _ 01. D0
        movzx   eax, byte [eax]                         ; 27F5 _ 0F B6. 00
        test    al, al                                  ; 27F8 _ 84. C0
        jz      ?_101                                   ; 27FA _ 74, 31
        lea     edx, [ebp-0AAH]                         ; 27FC _ 8D. 95, FFFFFF56
        mov     eax, dword [ebp-0F4H]                   ; 2802 _ 8B. 85, FFFFFF0C
        add     eax, edx                                ; 2808 _ 01. D0
        movzx   eax, byte [eax]                         ; 280A _ 0F B6. 00
        lea     ecx, [ebp-0C4H]                         ; 280D _ 8D. 8D, FFFFFF3C
        mov     edx, dword [ebp-0F8H]                   ; 2813 _ 8B. 95, FFFFFF08
        add     edx, ecx                                ; 2819 _ 01. CA
        mov     byte [edx], al                          ; 281B _ 88. 02
        add     dword [ebp-0F8H], 1                     ; 281D _ 83. 85, FFFFFF08, 01
        add     dword [ebp-0F4H], 1                     ; 2824 _ 83. 85, FFFFFF0C, 01
        jmp     ?_102                                   ; 282B _ EB, 02

?_101:  jmp     ?_103                                   ; 282D _ EB, 09

?_102:  cmp     dword [ebp-0F4H], 16                    ; 282F _ 83. BD, FFFFFF0C, 10
        jle     ?_100                                   ; 2836 _ 7E, AF
?_103:  lea     edx, [ebp-0C4H]                         ; 2838 _ 8D. 95, FFFFFF3C
        mov     eax, dword [ebp-0F8H]                   ; 283E _ 8B. 85, FFFFFF08
        add     eax, edx                                ; 2844 _ 01. D0
        mov     byte [eax], 0                           ; 2846 _ C6. 00, 00
        jmp     ?_115                                   ; 2849 _ E9, 000001F7

?_104:  mov     byte [ebp-0ABH], 0                      ; 284E _ C6. 85, FFFFFF55, 00
        mov     dword [ebp-0F0H], 0                     ; 2855 _ C7. 85, FFFFFF10, 00000000
        jmp     ?_107                                   ; 285F _ EB, 41

?_105:  mov     edx, dword [ebp-118H]                   ; 2861 _ 8B. 95, FFFFFEE8
        mov     eax, dword [ebp-0F0H]                   ; 2867 _ 8B. 85, FFFFFF10
        add     eax, edx                                ; 286D _ 01. D0
        movzx   eax, byte [eax]                         ; 286F _ 0F B6. 00
        test    al, al                                  ; 2872 _ 84. C0
        jz      ?_106                                   ; 2874 _ 74, 2A
        mov     edx, dword [ebp-118H]                   ; 2876 _ 8B. 95, FFFFFEE8
        mov     eax, dword [ebp-0F0H]                   ; 287C _ 8B. 85, FFFFFF10
        add     eax, edx                                ; 2882 _ 01. D0
        movzx   eax, byte [eax]                         ; 2884 _ 0F B6. 00
        lea     ecx, [ebp-0B7H]                         ; 2887 _ 8D. 8D, FFFFFF49
        mov     edx, dword [ebp-0F0H]                   ; 288D _ 8B. 95, FFFFFF10
        add     edx, ecx                                ; 2893 _ 01. CA
        mov     byte [edx], al                          ; 2895 _ 88. 02
        add     dword [ebp-0F0H], 1                     ; 2897 _ 83. 85, FFFFFF10, 01
        jmp     ?_107                                   ; 289E _ EB, 02

?_106:  jmp     ?_108                                   ; 28A0 _ EB, 09

?_107:  cmp     dword [ebp-0F0H], 7                     ; 28A2 _ 83. BD, FFFFFF10, 07
        jle     ?_105                                   ; 28A9 _ 7E, B6
?_108:  lea     edx, [ebp-0B7H]                         ; 28AB _ 8D. 95, FFFFFF49
        mov     eax, dword [ebp-0F0H]                   ; 28B1 _ 8B. 85, FFFFFF10
        add     eax, edx                                ; 28B7 _ 01. D0
        mov     byte [eax], 46                          ; 28B9 _ C6. 00, 2E
        add     dword [ebp-0F0H], 1                     ; 28BC _ 83. 85, FFFFFF10, 01
        mov     dword [ebp-0ECH], 0                     ; 28C3 _ C7. 85, FFFFFF14, 00000000
        jmp     ?_110                                   ; 28CD _ EB, 30

?_109:  mov     edx, dword [ebp-118H]                   ; 28CF _ 8B. 95, FFFFFEE8
        mov     eax, dword [ebp-0ECH]                   ; 28D5 _ 8B. 85, FFFFFF14
        add     eax, edx                                ; 28DB _ 01. D0
        movzx   eax, byte [eax+8H]                      ; 28DD _ 0F B6. 40, 08
        lea     ecx, [ebp-0B7H]                         ; 28E1 _ 8D. 8D, FFFFFF49
        mov     edx, dword [ebp-0F0H]                   ; 28E7 _ 8B. 95, FFFFFF10
        add     edx, ecx                                ; 28ED _ 01. CA
        mov     byte [edx], al                          ; 28EF _ 88. 02
        add     dword [ebp-0F0H], 1                     ; 28F1 _ 83. 85, FFFFFF10, 01
        add     dword [ebp-0ECH], 1                     ; 28F8 _ 83. 85, FFFFFF14, 01
?_110:  cmp     dword [ebp-0ECH], 2                     ; 28FF _ 83. BD, FFFFFF14, 02
        jle     ?_109                                   ; 2906 _ 7E, C7
        lea     edx, [ebp-0B7H]                         ; 2908 _ 8D. 95, FFFFFF49
        mov     eax, dword [ebp-0F0H]                   ; 290E _ 8B. 85, FFFFFF10
        add     eax, edx                                ; 2914 _ 01. D0
        mov     byte [eax], 0                           ; 2916 _ C6. 00, 00
        lea     eax, [ebp-0B7H]                         ; 2919 _ 8D. 85, FFFFFF49
        mov     dword [esp+4H], eax                     ; 291F _ 89. 44 24, 04
        lea     eax, [ebp-0C4H]                         ; 2923 _ 8D. 85, FFFFFF3C
        mov     dword [esp], eax                        ; 2929 _ 89. 04 24
        call    strcmp                                  ; 292C _ E8, FFFFFFFC(rel)
        cmp     eax, 1                                  ; 2931 _ 83. F8, 01
        jne     ?_114                                   ; 2934 _ 0F 85, 00000104
        mov     dword [ebp-0CCH], 88064                 ; 293A _ C7. 85, FFFFFF34, 00015800
        mov     eax, dword [ebp-118H]                   ; 2944 _ 8B. 85, FFFFFEE8
        movzx   eax, word [eax+1AH]                     ; 294A _ 0F B7. 40, 1A
        movzx   eax, ax                                 ; 294E _ 0F B7. C0
        shl     eax, 9                                  ; 2951 _ C1. E0, 09
        add     dword [ebp-0CCH], eax                   ; 2954 _ 01. 85, FFFFFF34
        mov     eax, dword [ebp-118H]                   ; 295A _ 8B. 85, FFFFFEE8
        mov     eax, dword [eax+1CH]                    ; 2960 _ 8B. 40, 1C
        mov     dword [ebp-0C8H], eax                   ; 2963 _ 89. 85, FFFFFF38
        mov     dword [ebp-0E8H], 0                     ; 2969 _ C7. 85, FFFFFF18, 00000000
        mov     dword [ebp-114H], 16                    ; 2973 _ C7. 85, FFFFFEEC, 00000010
        mov     dword [ebp-0E8H], 0                     ; 297D _ C7. 85, FFFFFF18, 00000000
        jmp     ?_113                                   ; 2987 _ E9, 0000009D

?_111:  mov     edx, dword [ebp-0E8H]                   ; 298C _ 8B. 95, FFFFFF18
        mov     eax, dword [ebp-0CCH]                   ; 2992 _ 8B. 85, FFFFFF34
        add     eax, edx                                ; 2998 _ 01. D0
        movzx   eax, byte [eax]                         ; 299A _ 0F B6. 00
        mov     byte [ebp-11AH], al                     ; 299D _ 88. 85, FFFFFEE6
        mov     byte [ebp-119H], 0                      ; 29A3 _ C6. 85, FFFFFEE7, 00
        mov     eax, dword [sheet_control]              ; 29AA _ A1, 00000000(d)
        mov     dword [esp+14H], 7                      ; 29AF _ C7. 44 24, 14, 00000007
        lea     edx, [ebp-11AH]                         ; 29B7 _ 8D. 95, FFFFFEE6
        mov     dword [esp+10H], edx                    ; 29BD _ 89. 54 24, 10
        mov     edx, dword [ebp-110H]                   ; 29C1 _ 8B. 95, FFFFFEF0
        mov     dword [esp+0CH], edx                    ; 29C7 _ 89. 54 24, 0C
        mov     edx, dword [ebp-114H]                   ; 29CB _ 8B. 95, FFFFFEEC
        mov     dword [esp+8H], edx                     ; 29D1 _ 89. 54 24, 08
        mov     edx, dword [ebp-12CH]                   ; 29D5 _ 8B. 95, FFFFFED4
        mov     dword [esp+4H], edx                     ; 29DB _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 29DF _ 89. 04 24
        call    paint_string                            ; 29E2 _ E8, FFFFFFFC(rel)
        add     dword [ebp-114H], 8                     ; 29E7 _ 83. 85, FFFFFEEC, 08
        cmp     dword [ebp-114H], 248                   ; 29EE _ 81. BD, FFFFFEEC, 000000F8
        jnz     ?_112                                   ; 29F8 _ 75, 28
        mov     dword [ebp-114H], 16                    ; 29FA _ C7. 85, FFFFFEEC, 00000010
        mov     eax, dword [ebp-12CH]                   ; 2A04 _ 8B. 85, FFFFFED4
        mov     dword [esp+4H], eax                     ; 2A0A _ 89. 44 24, 04
        mov     eax, dword [ebp-110H]                   ; 2A0E _ 8B. 85, FFFFFEF0
        mov     dword [esp], eax                        ; 2A14 _ 89. 04 24
        call    console_new_line                        ; 2A17 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-110H], eax                   ; 2A1C _ 89. 85, FFFFFEF0
?_112:  add     dword [ebp-0E8H], 1                     ; 2A22 _ 83. 85, FFFFFF18, 01
?_113:  mov     eax, dword [ebp-0E8H]                   ; 2A29 _ 8B. 85, FFFFFF18
        cmp     eax, dword [ebp-0C8H]                   ; 2A2F _ 3B. 85, FFFFFF38
        jl      ?_111                                   ; 2A35 _ 0F 8C, FFFFFF51
        nop                                             ; 2A3B _ 90
        jmp     ?_116                                   ; 2A3C _ EB, 18

?_114:  add     dword [ebp-118H], 32                    ; 2A3E _ 83. 85, FFFFFEE8, 20
?_115:  mov     eax, dword [ebp-118H]                   ; 2A45 _ 8B. 85, FFFFFEE8
        movzx   eax, byte [eax]                         ; 2A4B _ 0F B6. 00
        test    al, al                                  ; 2A4E _ 84. C0
        jne     ?_104                                   ; 2A50 _ 0F 85, FFFFFDF8
?_116:  mov     eax, dword [ebp-12CH]                   ; 2A56 _ 8B. 85, FFFFFED4
        mov     dword [esp+4H], eax                     ; 2A5C _ 89. 44 24, 04
        mov     eax, dword [ebp-110H]                   ; 2A60 _ 8B. 85, FFFFFEF0
        mov     dword [esp], eax                        ; 2A66 _ 89. 04 24
        call    console_new_line                        ; 2A69 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-110H], eax                   ; 2A6E _ 89. 85, FFFFFEF0
        mov     dword [ebp-114H], 16                    ; 2A74 _ C7. 85, FFFFFEEC, 00000010
        mov     dword [ebp-118H], 78848                 ; 2A7E _ C7. 85, FFFFFEE8, 00013400
?_117:  mov     dword [ebp-114H], 16                    ; 2A88 _ C7. 85, FFFFFEEC, 00000010
        jmp     ?_120                                   ; 2A92 _ E9, 00000162

?_118:  cmp     dword [ebp-0DCH], 14                    ; 2A97 _ 83. BD, FFFFFF24, 0E
        jnz     ?_119                                   ; 2A9E _ 75, 7B
        cmp     dword [ebp-114H], 16                    ; 2AA0 _ 83. BD, FFFFFEEC, 10
        jle     ?_119                                   ; 2AA7 _ 7E, 72
        mov     eax, dword [sheet_control]              ; 2AA9 _ A1, 00000000(d)
        mov     dword [esp+10H], 0                      ; 2AAE _ C7. 44 24, 10, 00000000
        mov     edx, dword [ebp-110H]                   ; 2AB6 _ 8B. 95, FFFFFEF0
        mov     dword [esp+0CH], edx                    ; 2ABC _ 89. 54 24, 0C
        mov     edx, dword [ebp-114H]                   ; 2AC0 _ 8B. 95, FFFFFEEC
        mov     dword [esp+8H], edx                     ; 2AC6 _ 89. 54 24, 08
        mov     edx, dword [ebp-12CH]                   ; 2ACA _ 8B. 95, FFFFFED4
        mov     dword [esp+4H], edx                     ; 2AD0 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 2AD4 _ 89. 04 24
        call    set_cursor                              ; 2AD7 _ E8, FFFFFFFC(rel)
        sub     dword [ebp-114H], 8                     ; 2ADC _ 83. AD, FFFFFEEC, 08
        mov     eax, dword [sheet_control]              ; 2AE3 _ A1, 00000000(d)
        mov     dword [esp+10H], 0                      ; 2AE8 _ C7. 44 24, 10, 00000000
        mov     edx, dword [ebp-110H]                   ; 2AF0 _ 8B. 95, FFFFFEF0
        mov     dword [esp+0CH], edx                    ; 2AF6 _ 89. 54 24, 0C
        mov     edx, dword [ebp-114H]                   ; 2AFA _ 8B. 95, FFFFFEEC
        mov     dword [esp+8H], edx                     ; 2B00 _ 89. 54 24, 08
        mov     edx, dword [ebp-12CH]                   ; 2B04 _ 8B. 95, FFFFFED4
        mov     dword [esp+4H], edx                     ; 2B0A _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 2B0E _ 89. 04 24
        call    set_cursor                              ; 2B11 _ E8, FFFFFFFC(rel)
        jmp     ?_120                                   ; 2B16 _ E9, 000000DE

?_119:  mov     eax, dword [ebp-0DCH]                   ; 2B1B _ 8B. 85, FFFFFF24
        mov     dword [esp], eax                        ; 2B21 _ 89. 04 24
        call    transfer_scancode                       ; 2B24 _ E8, FFFFFFFC(rel)
        mov     byte [ebp-11BH], al                     ; 2B29 _ 88. 85, FFFFFEE5
        cmp     byte [ebp-11BH], 0                      ; 2B2F _ 80. BD, FFFFFEE5, 00
        je      ?_120                                   ; 2B36 _ 0F 84, 000000BD
        cmp     dword [ebp-114H], 239                   ; 2B3C _ 81. BD, FFFFFEEC, 000000EF
        jg      ?_120                                   ; 2B46 _ 0F 8F, 000000AD
        mov     eax, dword [sheet_control]              ; 2B4C _ A1, 00000000(d)
        mov     dword [esp+10H], 0                      ; 2B51 _ C7. 44 24, 10, 00000000
        mov     edx, dword [ebp-110H]                   ; 2B59 _ 8B. 95, FFFFFEF0
        mov     dword [esp+0CH], edx                    ; 2B5F _ 89. 54 24, 0C
        mov     edx, dword [ebp-114H]                   ; 2B63 _ 8B. 95, FFFFFEEC
        mov     dword [esp+8H], edx                     ; 2B69 _ 89. 54 24, 08
        mov     edx, dword [ebp-12CH]                   ; 2B6D _ 8B. 95, FFFFFED4
        mov     dword [esp+4H], edx                     ; 2B73 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 2B77 _ 89. 04 24
        call    set_cursor                              ; 2B7A _ E8, FFFFFFFC(rel)
        movzx   eax, byte [ebp-11BH]                    ; 2B7F _ 0F B6. 85, FFFFFEE5
        mov     byte [ebp-11AH], al                     ; 2B86 _ 88. 85, FFFFFEE6
        mov     byte [ebp-119H], 0                      ; 2B8C _ C6. 85, FFFFFEE7, 00
        mov     eax, dword [ebp-114H]                   ; 2B93 _ 8B. 85, FFFFFEEC
        lea     edx, [eax+7H]                           ; 2B99 _ 8D. 50, 07
        test    eax, eax                                ; 2B9C _ 85. C0
        cmovs   eax, edx                                ; 2B9E _ 0F 48. C2
        sar     eax, 3                                  ; 2BA1 _ C1. F8, 03
        lea     edx, [eax-2H]                           ; 2BA4 _ 8D. 50, FE
        movzx   eax, byte [ebp-11BH]                    ; 2BA7 _ 0F B6. 85, FFFFFEE5
        mov     byte [ebp+edx-0AAH], al                 ; 2BAE _ 88. 84 15, FFFFFF56
        mov     eax, dword [sheet_control]              ; 2BB5 _ A1, 00000000(d)
        mov     dword [esp+14H], 7                      ; 2BBA _ C7. 44 24, 14, 00000007
        lea     edx, [ebp-11AH]                         ; 2BC2 _ 8D. 95, FFFFFEE6
        mov     dword [esp+10H], edx                    ; 2BC8 _ 89. 54 24, 10
        mov     edx, dword [ebp-110H]                   ; 2BCC _ 8B. 95, FFFFFEF0
        mov     dword [esp+0CH], edx                    ; 2BD2 _ 89. 54 24, 0C
        mov     edx, dword [ebp-114H]                   ; 2BD6 _ 8B. 95, FFFFFEEC
        mov     dword [esp+8H], edx                     ; 2BDC _ 89. 54 24, 08
        mov     edx, dword [ebp-12CH]                   ; 2BE0 _ 8B. 95, FFFFFED4
        mov     dword [esp+4H], edx                     ; 2BE6 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 2BEA _ 89. 04 24
        call    paint_string                            ; 2BED _ E8, FFFFFFFC(rel)
        add     dword [ebp-114H], 8                     ; 2BF2 _ 83. 85, FFFFFEEC, 08
?_120:  cmp     dword [ebp-10CH], 0                     ; 2BF9 _ 83. BD, FFFFFEF4, 00
        js      ?_121                                   ; 2C00 _ 78, 3A
        mov     eax, dword [sheet_control]              ; 2C02 _ A1, 00000000(d)
        mov     edx, dword [ebp-10CH]                   ; 2C07 _ 8B. 95, FFFFFEF4
        mov     dword [esp+10H], edx                    ; 2C0D _ 89. 54 24, 10
        mov     edx, dword [ebp-110H]                   ; 2C11 _ 8B. 95, FFFFFEF0
        mov     dword [esp+0CH], edx                    ; 2C17 _ 89. 54 24, 0C
        mov     edx, dword [ebp-114H]                   ; 2C1B _ 8B. 95, FFFFFEEC
        mov     dword [esp+8H], edx                     ; 2C21 _ 89. 54 24, 08
        mov     edx, dword [ebp-12CH]                   ; 2C25 _ 8B. 95, FFFFFED4
        mov     dword [esp+4H], edx                     ; 2C2B _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 2C2F _ 89. 04 24
        call    set_cursor                              ; 2C32 _ E8, FFFFFFFC(rel)
        jmp     ?_078                                   ; 2C37 _ E9, FFFFF569

?_121:  jmp     ?_078                                   ; 2C3C _ E9, FFFFF564
; console_task End of function

launch_console:; Function begin
        push    ebp                                     ; 2C41 _ 55
        mov     ebp, esp                                ; 2C42 _ 89. E5
        push    ebx                                     ; 2C44 _ 53
        sub     esp, 52                                 ; 2C45 _ 83. EC, 34
        mov     eax, dword [sheet_control]              ; 2C48 _ A1, 00000000(d)
        mov     dword [esp], eax                        ; 2C4D _ 89. 04 24
        call    sheet_alloc                             ; 2C50 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-18H], eax                    ; 2C55 _ 89. 45, E8
        mov     eax, dword [memman]                     ; 2C58 _ A1, 00000000(d)
        mov     dword [esp+4H], 42240                   ; 2C5D _ C7. 44 24, 04, 0000A500
        mov     dword [esp], eax                        ; 2C65 _ 89. 04 24
        call    memman_alloc_4k                         ; 2C68 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-14H], eax                    ; 2C6D _ 89. 45, EC
        mov     dword [esp+10H], 99                     ; 2C70 _ C7. 44 24, 10, 00000063
        mov     dword [esp+0CH], 165                    ; 2C78 _ C7. 44 24, 0C, 000000A5
        mov     dword [esp+8H], 256                     ; 2C80 _ C7. 44 24, 08, 00000100
        mov     eax, dword [ebp-14H]                    ; 2C88 _ 8B. 45, EC
        mov     dword [esp+4H], eax                     ; 2C8B _ 89. 44 24, 04
        mov     eax, dword [ebp-18H]                    ; 2C8F _ 8B. 45, E8
        mov     dword [esp], eax                        ; 2C92 _ 89. 04 24
        call    sheet_setbuf                            ; 2C95 _ E8, FFFFFFFC(rel)
        mov     eax, dword [sheet_control]              ; 2C9A _ A1, 00000000(d)
        mov     dword [esp+0CH], 0                      ; 2C9F _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], ?_299                   ; 2CA7 _ C7. 44 24, 08, 00000078(d)
        mov     edx, dword [ebp-18H]                    ; 2CAF _ 8B. 55, E8
        mov     dword [esp+4H], edx                     ; 2CB2 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 2CB6 _ 89. 04 24
        call    make_windows                            ; 2CB9 _ E8, FFFFFFFC(rel)
        mov     dword [esp+14H], 0                      ; 2CBE _ C7. 44 24, 14, 00000000
        mov     dword [esp+10H], 128                    ; 2CC6 _ C7. 44 24, 10, 00000080
        mov     dword [esp+0CH], 240                    ; 2CCE _ C7. 44 24, 0C, 000000F0
        mov     dword [esp+8H], 28                      ; 2CD6 _ C7. 44 24, 08, 0000001C
        mov     dword [esp+4H], 8                       ; 2CDE _ C7. 44 24, 04, 00000008
        mov     eax, dword [ebp-18H]                    ; 2CE6 _ 8B. 45, E8
        mov     dword [esp], eax                        ; 2CE9 _ 89. 04 24
        call    make_textbox                            ; 2CEC _ E8, FFFFFFFC(rel)
        call    task_alloc                              ; 2CF1 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 2CF6 _ 89. 45, F0
        call    get_code32_addr                         ; 2CF9 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 2CFE _ 89. 45, F4
        mov     eax, dword [ebp-10H]                    ; 2D01 _ 8B. 45, F0
        mov     dword [eax+8CH], 0                      ; 2D04 _ C7. 80, 0000008C, 00000000
        mov     eax, dword [ebp-10H]                    ; 2D0E _ 8B. 45, F0
        mov     dword [eax+90H], 1073741824             ; 2D11 _ C7. 80, 00000090, 40000000
        mov     eax, console_task                       ; 2D1B _ B8, 00000000(d)
        sub     eax, dword [ebp-0CH]                    ; 2D20 _ 2B. 45, F4
        mov     edx, eax                                ; 2D23 _ 89. C2
        mov     eax, dword [ebp-10H]                    ; 2D25 _ 8B. 45, F0
        mov     dword [eax+4CH], edx                    ; 2D28 _ 89. 50, 4C
        mov     eax, dword [ebp-10H]                    ; 2D2B _ 8B. 45, F0
        mov     dword [eax+74H], 0                      ; 2D2E _ C7. 40, 74, 00000000
        mov     eax, dword [ebp-10H]                    ; 2D35 _ 8B. 45, F0
        mov     dword [eax+78H], 8                      ; 2D38 _ C7. 40, 78, 00000008
        mov     eax, dword [ebp-10H]                    ; 2D3F _ 8B. 45, F0
        mov     dword [eax+7CH], 48                     ; 2D42 _ C7. 40, 7C, 00000030
        mov     eax, dword [ebp-10H]                    ; 2D49 _ 8B. 45, F0
        mov     dword [eax+80H], 32                     ; 2D4C _ C7. 80, 00000080, 00000020
        mov     eax, dword [ebp-10H]                    ; 2D56 _ 8B. 45, F0
        mov     dword [eax+84H], 0                      ; 2D59 _ C7. 80, 00000084, 00000000
        mov     eax, dword [ebp-10H]                    ; 2D63 _ 8B. 45, F0
        mov     dword [eax+88H], 16                     ; 2D66 _ C7. 80, 00000088, 00000010
        mov     eax, dword [ebp-10H]                    ; 2D70 _ 8B. 45, F0
        mov     eax, dword [eax+64H]                    ; 2D73 _ 8B. 40, 64
        lea     edx, [eax-4H]                           ; 2D76 _ 8D. 50, FC
        mov     eax, dword [ebp-10H]                    ; 2D79 _ 8B. 45, F0
        mov     dword [eax+64H], edx                    ; 2D7C _ 89. 50, 64
        mov     eax, dword [ebp-10H]                    ; 2D7F _ 8B. 45, F0
        mov     eax, dword [eax+64H]                    ; 2D82 _ 8B. 40, 64
        add     eax, 4                                  ; 2D85 _ 83. C0, 04
        mov     edx, dword [ebp-18H]                    ; 2D88 _ 8B. 55, E8
        mov     dword [eax], edx                        ; 2D8B _ 89. 10
        mov     eax, dword [ebp-10H]                    ; 2D8D _ 8B. 45, F0
        mov     eax, dword [eax+64H]                    ; 2D90 _ 8B. 40, 64
        add     eax, 8                                  ; 2D93 _ 83. C0, 08
        mov     ebx, eax                                ; 2D96 _ 89. C3
        mov     eax, dword [memman]                     ; 2D98 _ A1, 00000000(d)
        mov     dword [esp], eax                        ; 2D9D _ 89. 04 24
        call    memman_total                            ; 2DA0 _ E8, FFFFFFFC(rel)
        mov     dword [ebx], eax                        ; 2DA5 _ 89. 03
        mov     dword [esp+8H], 5                       ; 2DA7 _ C7. 44 24, 08, 00000005
        mov     dword [esp+4H], 1                       ; 2DAF _ C7. 44 24, 04, 00000001
        mov     eax, dword [ebp-10H]                    ; 2DB7 _ 8B. 45, F0
        mov     dword [esp], eax                        ; 2DBA _ 89. 04 24
        call    task_run                                ; 2DBD _ E8, FFFFFFFC(rel)
        mov     eax, dword [sheet_control]              ; 2DC2 _ A1, 00000000(d)
        mov     dword [esp+0CH], 4                      ; 2DC7 _ C7. 44 24, 0C, 00000004
        mov     dword [esp+8H], 32                      ; 2DCF _ C7. 44 24, 08, 00000020
        mov     edx, dword [ebp-18H]                    ; 2DD7 _ 8B. 55, E8
        mov     dword [esp+4H], edx                     ; 2DDA _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 2DDE _ 89. 04 24
        call    sheet_slide                             ; 2DE1 _ E8, FFFFFFFC(rel)
        mov     eax, dword [sheet_control]              ; 2DE6 _ A1, 00000000(d)
        mov     dword [esp+8H], 1                       ; 2DEB _ C7. 44 24, 08, 00000001
        mov     edx, dword [ebp-18H]                    ; 2DF3 _ 8B. 55, E8
        mov     dword [esp+4H], edx                     ; 2DF6 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 2DFA _ 89. 04 24
        call    sheet_updown                            ; 2DFD _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 2E02 _ 8B. 45, F0
        mov     dword [task_console_g], eax             ; 2E05 _ A3, 00000000(d)
        mov     eax, dword [ebp-18H]                    ; 2E0A _ 8B. 45, E8
        add     esp, 52                                 ; 2E0D _ 83. C4, 34
        pop     ebx                                     ; 2E10 _ 5B
        pop     ebp                                     ; 2E11 _ 5D
        ret                                             ; 2E12 _ C3
; launch_console End of function

set_cursor:; Function begin
        push    ebp                                     ; 2E13 _ 55
        mov     ebp, esp                                ; 2E14 _ 89. E5
        push    esi                                     ; 2E16 _ 56
        push    ebx                                     ; 2E17 _ 53
        sub     esp, 32                                 ; 2E18 _ 83. EC, 20
        mov     eax, dword [ebp+14H]                    ; 2E1B _ 8B. 45, 14
        lea     esi, [eax+0FH]                          ; 2E1E _ 8D. 70, 0F
        mov     eax, dword [ebp+10H]                    ; 2E21 _ 8B. 45, 10
        lea     ebx, [eax+7H]                           ; 2E24 _ 8D. 58, 07
        mov     eax, dword [ebp+18H]                    ; 2E27 _ 8B. 45, 18
        movzx   ecx, al                                 ; 2E2A _ 0F B6. C8
        mov     eax, dword [ebp+0CH]                    ; 2E2D _ 8B. 45, 0C
        mov     edx, dword [eax+4H]                     ; 2E30 _ 8B. 50, 04
        mov     eax, dword [ebp+0CH]                    ; 2E33 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 2E36 _ 8B. 00
        mov     dword [esp+18H], esi                    ; 2E38 _ 89. 74 24, 18
        mov     dword [esp+14H], ebx                    ; 2E3C _ 89. 5C 24, 14
        mov     ebx, dword [ebp+14H]                    ; 2E40 _ 8B. 5D, 14
        mov     dword [esp+10H], ebx                    ; 2E43 _ 89. 5C 24, 10
        mov     ebx, dword [ebp+10H]                    ; 2E47 _ 8B. 5D, 10
        mov     dword [esp+0CH], ebx                    ; 2E4A _ 89. 5C 24, 0C
        mov     dword [esp+8H], ecx                     ; 2E4E _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 2E52 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 2E56 _ 89. 04 24
        call    paint_rectangle                         ; 2E59 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+14H]                    ; 2E5E _ 8B. 45, 14
        lea     edx, [eax+10H]                          ; 2E61 _ 8D. 50, 10
        mov     eax, dword [ebp+10H]                    ; 2E64 _ 8B. 45, 10
        add     eax, 8                                  ; 2E67 _ 83. C0, 08
        mov     dword [esp+14H], edx                    ; 2E6A _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 2E6E _ 89. 44 24, 10
        mov     eax, dword [ebp+14H]                    ; 2E72 _ 8B. 45, 14
        mov     dword [esp+0CH], eax                    ; 2E75 _ 89. 44 24, 0C
        mov     eax, dword [ebp+10H]                    ; 2E79 _ 8B. 45, 10
        mov     dword [esp+8H], eax                     ; 2E7C _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 2E80 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 2E83 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2E87 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2E8A _ 89. 04 24
        call    sheet_refresh                           ; 2E8D _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 2E92 _ 83. C4, 20
        pop     ebx                                     ; 2E95 _ 5B
        pop     esi                                     ; 2E96 _ 5E
        pop     ebp                                     ; 2E97 _ 5D
        ret                                             ; 2E98 _ C3
; set_cursor End of function

console_new_line:; Function begin
        push    ebp                                     ; 2E99 _ 55
        mov     ebp, esp                                ; 2E9A _ 89. E5
        push    ebx                                     ; 2E9C _ 53
        sub     esp, 52                                 ; 2E9D _ 83. EC, 34
        cmp     dword [ebp+8H], 139                     ; 2EA0 _ 81. 7D, 08, 0000008B
        jg      ?_122                                   ; 2EA7 _ 7F, 09
        add     dword [ebp+8H], 16                      ; 2EA9 _ 83. 45, 08, 10
        jmp     ?_131                                   ; 2EAD _ E9, 000000DF

?_122:  mov     dword [ebp-0CH], 28                     ; 2EB2 _ C7. 45, F4, 0000001C
        jmp     ?_126                                   ; 2EB9 _ EB, 52

?_123:  mov     dword [ebp-10H], 8                      ; 2EBB _ C7. 45, F0, 00000008
        jmp     ?_125                                   ; 2EC2 _ EB, 3C

?_124:  mov     eax, dword [ebp+0CH]                    ; 2EC4 _ 8B. 45, 0C
        mov     edx, dword [eax]                        ; 2EC7 _ 8B. 10
        mov     eax, dword [ebp+0CH]                    ; 2EC9 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 2ECC _ 8B. 40, 04
        imul    eax, dword [ebp-0CH]                    ; 2ECF _ 0F AF. 45, F4
        mov     ecx, eax                                ; 2ED3 _ 89. C1
        mov     eax, dword [ebp-10H]                    ; 2ED5 _ 8B. 45, F0
        add     eax, ecx                                ; 2ED8 _ 01. C8
        add     edx, eax                                ; 2EDA _ 01. C2
        mov     eax, dword [ebp+0CH]                    ; 2EDC _ 8B. 45, 0C
        mov     ecx, dword [eax]                        ; 2EDF _ 8B. 08
        mov     eax, dword [ebp-0CH]                    ; 2EE1 _ 8B. 45, F4
        lea     ebx, [eax+10H]                          ; 2EE4 _ 8D. 58, 10
        mov     eax, dword [ebp+0CH]                    ; 2EE7 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 2EEA _ 8B. 40, 04
        imul    ebx, eax                                ; 2EED _ 0F AF. D8
        mov     eax, dword [ebp-10H]                    ; 2EF0 _ 8B. 45, F0
        add     eax, ebx                                ; 2EF3 _ 01. D8
        add     eax, ecx                                ; 2EF5 _ 01. C8
        movzx   eax, byte [eax]                         ; 2EF7 _ 0F B6. 00
        mov     byte [edx], al                          ; 2EFA _ 88. 02
        add     dword [ebp-10H], 1                      ; 2EFC _ 83. 45, F0, 01
?_125:  cmp     dword [ebp-10H], 247                    ; 2F00 _ 81. 7D, F0, 000000F7
        jle     ?_124                                   ; 2F07 _ 7E, BB
        add     dword [ebp-0CH], 1                      ; 2F09 _ 83. 45, F4, 01
?_126:  cmp     dword [ebp-0CH], 139                    ; 2F0D _ 81. 7D, F4, 0000008B
        jle     ?_123                                   ; 2F14 _ 7E, A5
        mov     dword [ebp-0CH], 140                    ; 2F16 _ C7. 45, F4, 0000008C
        jmp     ?_130                                   ; 2F1D _ EB, 35

?_127:  mov     dword [ebp-10H], 8                      ; 2F1F _ C7. 45, F0, 00000008
        jmp     ?_129                                   ; 2F26 _ EB, 1F

?_128:  mov     eax, dword [ebp+0CH]                    ; 2F28 _ 8B. 45, 0C
        mov     edx, dword [eax]                        ; 2F2B _ 8B. 10
        mov     eax, dword [ebp+0CH]                    ; 2F2D _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 2F30 _ 8B. 40, 04
        imul    eax, dword [ebp-0CH]                    ; 2F33 _ 0F AF. 45, F4
        mov     ecx, eax                                ; 2F37 _ 89. C1
        mov     eax, dword [ebp-10H]                    ; 2F39 _ 8B. 45, F0
        add     eax, ecx                                ; 2F3C _ 01. C8
        add     eax, edx                                ; 2F3E _ 01. D0
        mov     byte [eax], 0                           ; 2F40 _ C6. 00, 00
        add     dword [ebp-10H], 1                      ; 2F43 _ 83. 45, F0, 01
?_129:  cmp     dword [ebp-10H], 247                    ; 2F47 _ 81. 7D, F0, 000000F7
        jle     ?_128                                   ; 2F4E _ 7E, D8
        add     dword [ebp-0CH], 1                      ; 2F50 _ 83. 45, F4, 01
?_130:  cmp     dword [ebp-0CH], 155                    ; 2F54 _ 81. 7D, F4, 0000009B
        jle     ?_127                                   ; 2F5B _ 7E, C2
        mov     eax, dword [sheet_control]              ; 2F5D _ A1, 00000000(d)
        mov     dword [esp+14H], 156                    ; 2F62 _ C7. 44 24, 14, 0000009C
        mov     dword [esp+10H], 248                    ; 2F6A _ C7. 44 24, 10, 000000F8
        mov     dword [esp+0CH], 28                     ; 2F72 _ C7. 44 24, 0C, 0000001C
        mov     dword [esp+8H], 8                       ; 2F7A _ C7. 44 24, 08, 00000008
        mov     edx, dword [ebp+0CH]                    ; 2F82 _ 8B. 55, 0C
        mov     dword [esp+4H], edx                     ; 2F85 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 2F89 _ 89. 04 24
        call    sheet_refresh                           ; 2F8C _ E8, FFFFFFFC(rel)
?_131:  mov     eax, dword [sheet_control]              ; 2F91 _ A1, 00000000(d)
        mov     dword [esp+14H], 7                      ; 2F96 _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_293                  ; 2F9E _ C7. 44 24, 10, 00000060(d)
        mov     edx, dword [ebp+8H]                     ; 2FA6 _ 8B. 55, 08
        mov     dword [esp+0CH], edx                    ; 2FA9 _ 89. 54 24, 0C
        mov     dword [esp+8H], 8                       ; 2FAD _ C7. 44 24, 08, 00000008
        mov     edx, dword [ebp+0CH]                    ; 2FB5 _ 8B. 55, 0C
        mov     dword [esp+4H], edx                     ; 2FB8 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 2FBC _ 89. 04 24
        call    paint_string                            ; 2FBF _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 2FC4 _ 8B. 45, 08
        add     esp, 52                                 ; 2FC7 _ 83. C4, 34
        pop     ebx                                     ; 2FCA _ 5B
        pop     ebp                                     ; 2FCB _ 5D
        ret                                             ; 2FCC _ C3
; console_new_line End of function

strcmp: ; Function begin
        push    ebp                                     ; 2FCD _ 55
        mov     ebp, esp                                ; 2FCE _ 89. E5
        sub     esp, 16                                 ; 2FD0 _ 83. EC, 10
        cmp     dword [ebp+8H], 0                       ; 2FD3 _ 83. 7D, 08, 00
        jz      ?_132                                   ; 2FD7 _ 74, 06
        cmp     dword [ebp+0CH], 0                      ; 2FD9 _ 83. 7D, 0C, 00
        jnz     ?_133                                   ; 2FDD _ 75, 0A
?_132:  mov     eax, 0                                  ; 2FDF _ B8, 00000000
        jmp     ?_140                                   ; 2FE4 _ E9, 00000092

?_133:  mov     dword [ebp-4H], 0                       ; 2FE9 _ C7. 45, FC, 00000000
        jmp     ?_136                                   ; 2FF0 _ EB, 25

?_134:  mov     edx, dword [ebp-4H]                     ; 2FF2 _ 8B. 55, FC
        mov     eax, dword [ebp+8H]                     ; 2FF5 _ 8B. 45, 08
        add     eax, edx                                ; 2FF8 _ 01. D0
        movzx   edx, byte [eax]                         ; 2FFA _ 0F B6. 10
        mov     ecx, dword [ebp-4H]                     ; 2FFD _ 8B. 4D, FC
        mov     eax, dword [ebp+0CH]                    ; 3000 _ 8B. 45, 0C
        add     eax, ecx                                ; 3003 _ 01. C8
        movzx   eax, byte [eax]                         ; 3005 _ 0F B6. 00
        cmp     dl, al                                  ; 3008 _ 38. C2
        jz      ?_135                                   ; 300A _ 74, 07
        mov     eax, 0                                  ; 300C _ B8, 00000000
        jmp     ?_140                                   ; 3011 _ EB, 68

?_135:  add     dword [ebp-4H], 1                       ; 3013 _ 83. 45, FC, 01
?_136:  mov     edx, dword [ebp-4H]                     ; 3017 _ 8B. 55, FC
        mov     eax, dword [ebp+8H]                     ; 301A _ 8B. 45, 08
        add     eax, edx                                ; 301D _ 01. D0
        movzx   eax, byte [eax]                         ; 301F _ 0F B6. 00
        test    al, al                                  ; 3022 _ 84. C0
        jz      ?_137                                   ; 3024 _ 74, 06
        cmp     dword [ebp+0CH], 0                      ; 3026 _ 83. 7D, 0C, 00
        jnz     ?_134                                   ; 302A _ 75, C6
?_137:  mov     edx, dword [ebp-4H]                     ; 302C _ 8B. 55, FC
        mov     eax, dword [ebp+8H]                     ; 302F _ 8B. 45, 08
        add     eax, edx                                ; 3032 _ 01. D0
        movzx   eax, byte [eax]                         ; 3034 _ 0F B6. 00
        test    al, al                                  ; 3037 _ 84. C0
        jnz     ?_138                                   ; 3039 _ 75, 16
        mov     edx, dword [ebp-4H]                     ; 303B _ 8B. 55, FC
        mov     eax, dword [ebp+0CH]                    ; 303E _ 8B. 45, 0C
        add     eax, edx                                ; 3041 _ 01. D0
        movzx   eax, byte [eax]                         ; 3043 _ 0F B6. 00
        test    al, al                                  ; 3046 _ 84. C0
        jz      ?_138                                   ; 3048 _ 74, 07
        mov     eax, 0                                  ; 304A _ B8, 00000000
        jmp     ?_140                                   ; 304F _ EB, 2A

?_138:  mov     edx, dword [ebp-4H]                     ; 3051 _ 8B. 55, FC
        mov     eax, dword [ebp+8H]                     ; 3054 _ 8B. 45, 08
        add     eax, edx                                ; 3057 _ 01. D0
        movzx   eax, byte [eax]                         ; 3059 _ 0F B6. 00
        test    al, al                                  ; 305C _ 84. C0
        jz      ?_139                                   ; 305E _ 74, 16
        mov     edx, dword [ebp-4H]                     ; 3060 _ 8B. 55, FC
        mov     eax, dword [ebp+0CH]                    ; 3063 _ 8B. 45, 0C
        add     eax, edx                                ; 3066 _ 01. D0
        movzx   eax, byte [eax]                         ; 3068 _ 0F B6. 00
        test    al, al                                  ; 306B _ 84. C0
        jz      ?_139                                   ; 306D _ 74, 07
        mov     eax, 0                                  ; 306F _ B8, 00000000
        jmp     ?_140                                   ; 3074 _ EB, 05

?_139:  mov     eax, 1                                  ; 3076 _ B8, 00000001
?_140:  leave                                           ; 307B _ C9
        ret                                             ; 307C _ C3
; strcmp End of function

wait_KBC_sendready:; Function begin
        push    ebp                                     ; 307D _ 55
        mov     ebp, esp                                ; 307E _ 89. E5
        sub     esp, 24                                 ; 3080 _ 83. EC, 18
?_141:  mov     dword [esp], 100                        ; 3083 _ C7. 04 24, 00000064
        call    io_in8                                  ; 308A _ E8, FFFFFFFC(rel)
        and     eax, 02H                                ; 308F _ 83. E0, 02
        test    eax, eax                                ; 3092 _ 85. C0
        jnz     ?_142                                   ; 3094 _ 75, 02
        jmp     ?_143                                   ; 3096 _ EB, 02

?_142:  jmp     ?_141                                   ; 3098 _ EB, E9

?_143:  leave                                           ; 309A _ C9
        ret                                             ; 309B _ C3
; wait_KBC_sendready End of function

init_keyboard:; Function begin
        push    ebp                                     ; 309C _ 55
        mov     ebp, esp                                ; 309D _ 89. E5
        sub     esp, 24                                 ; 309F _ 83. EC, 18
        call    wait_KBC_sendready                      ; 30A2 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 96                      ; 30A7 _ C7. 44 24, 04, 00000060
        mov     dword [esp], 100                        ; 30AF _ C7. 04 24, 00000064
        call    io_out8                                 ; 30B6 _ E8, FFFFFFFC(rel)
        call    wait_KBC_sendready                      ; 30BB _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 71                      ; 30C0 _ C7. 44 24, 04, 00000047
        mov     dword [esp], 96                         ; 30C8 _ C7. 04 24, 00000060
        call    io_out8                                 ; 30CF _ E8, FFFFFFFC(rel)
        leave                                           ; 30D4 _ C9
        ret                                             ; 30D5 _ C3
; init_keyboard End of function

enable_mouse:; Function begin
        push    ebp                                     ; 30D6 _ 55
        mov     ebp, esp                                ; 30D7 _ 89. E5
        sub     esp, 24                                 ; 30D9 _ 83. EC, 18
        call    wait_KBC_sendready                      ; 30DC _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 212                     ; 30E1 _ C7. 44 24, 04, 000000D4
        mov     dword [esp], 100                        ; 30E9 _ C7. 04 24, 00000064
        call    io_out8                                 ; 30F0 _ E8, FFFFFFFC(rel)
        call    wait_KBC_sendready                      ; 30F5 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 244                     ; 30FA _ C7. 44 24, 04, 000000F4
        mov     dword [esp], 96                         ; 3102 _ C7. 04 24, 00000060
        call    io_out8                                 ; 3109 _ E8, FFFFFFFC(rel)
        leave                                           ; 310E _ C9
        ret                                             ; 310F _ C3
; enable_mouse End of function

mouse_decode:; Function begin
        push    ebp                                     ; 3110 _ 55
        mov     ebp, esp                                ; 3111 _ 89. E5
        sub     esp, 4                                  ; 3113 _ 83. EC, 04
        mov     eax, dword [ebp+0CH]                    ; 3116 _ 8B. 45, 0C
        mov     byte [ebp-4H], al                       ; 3119 _ 88. 45, FC
        mov     eax, dword [ebp+8H]                     ; 311C _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 311F _ 0F B6. 40, 03
        test    al, al                                  ; 3123 _ 84. C0
        jnz     ?_145                                   ; 3125 _ 75, 17
        cmp     byte [ebp-4H], -6                       ; 3127 _ 80. 7D, FC, FA
        jnz     ?_144                                   ; 312B _ 75, 07
        mov     eax, dword [ebp+8H]                     ; 312D _ 8B. 45, 08
        mov     byte [eax+3H], 1                        ; 3130 _ C6. 40, 03, 01
?_144:  mov     eax, 0                                  ; 3134 _ B8, 00000000
        jmp     ?_152                                   ; 3139 _ E9, 0000010F

?_145:  mov     eax, dword [ebp+8H]                     ; 313E _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 3141 _ 0F B6. 40, 03
        cmp     al, 1                                   ; 3145 _ 3C, 01
        jnz     ?_147                                   ; 3147 _ 75, 28
        movzx   eax, byte [ebp-4H]                      ; 3149 _ 0F B6. 45, FC
        and     eax, 0C8H                               ; 314D _ 25, 000000C8
        cmp     eax, 8                                  ; 3152 _ 83. F8, 08
        jnz     ?_146                                   ; 3155 _ 75, 10
        mov     eax, dword [ebp+8H]                     ; 3157 _ 8B. 45, 08
        movzx   edx, byte [ebp-4H]                      ; 315A _ 0F B6. 55, FC
        mov     byte [eax], dl                          ; 315E _ 88. 10
        mov     eax, dword [ebp+8H]                     ; 3160 _ 8B. 45, 08
        mov     byte [eax+3H], 2                        ; 3163 _ C6. 40, 03, 02
?_146:  mov     eax, 0                                  ; 3167 _ B8, 00000000
        jmp     ?_152                                   ; 316C _ E9, 000000DC

?_147:  mov     eax, dword [ebp+8H]                     ; 3171 _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 3174 _ 0F B6. 40, 03
        cmp     al, 2                                   ; 3178 _ 3C, 02
        jnz     ?_148                                   ; 317A _ 75, 1B
        mov     eax, dword [ebp+8H]                     ; 317C _ 8B. 45, 08
        movzx   edx, byte [ebp-4H]                      ; 317F _ 0F B6. 55, FC
        mov     byte [eax+1H], dl                       ; 3183 _ 88. 50, 01
        mov     eax, dword [ebp+8H]                     ; 3186 _ 8B. 45, 08
        mov     byte [eax+3H], 3                        ; 3189 _ C6. 40, 03, 03
        mov     eax, 0                                  ; 318D _ B8, 00000000
        jmp     ?_152                                   ; 3192 _ E9, 000000B6

?_148:  mov     eax, dword [ebp+8H]                     ; 3197 _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 319A _ 0F B6. 40, 03
        cmp     al, 3                                   ; 319E _ 3C, 03
        jne     ?_151                                   ; 31A0 _ 0F 85, 000000A2
        mov     eax, dword [ebp+8H]                     ; 31A6 _ 8B. 45, 08
        movzx   edx, byte [ebp-4H]                      ; 31A9 _ 0F B6. 55, FC
        mov     byte [eax+2H], dl                       ; 31AD _ 88. 50, 02
        mov     eax, dword [ebp+8H]                     ; 31B0 _ 8B. 45, 08
        mov     byte [eax+3H], 1                        ; 31B3 _ C6. 40, 03, 01
        mov     eax, dword [ebp+8H]                     ; 31B7 _ 8B. 45, 08
        movzx   eax, byte [eax]                         ; 31BA _ 0F B6. 00
        movzx   eax, al                                 ; 31BD _ 0F B6. C0
        and     eax, 07H                                ; 31C0 _ 83. E0, 07
        mov     edx, eax                                ; 31C3 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 31C5 _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 31C8 _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 31CB _ 8B. 45, 08
        movzx   eax, byte [eax+1H]                      ; 31CE _ 0F B6. 40, 01
        movzx   edx, al                                 ; 31D2 _ 0F B6. D0
        mov     eax, dword [ebp+8H]                     ; 31D5 _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 31D8 _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 31DB _ 8B. 45, 08
        movzx   eax, byte [eax+2H]                      ; 31DE _ 0F B6. 40, 02
        movzx   edx, al                                 ; 31E2 _ 0F B6. D0
        mov     eax, dword [ebp+8H]                     ; 31E5 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 31E8 _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 31EB _ 8B. 45, 08
        movzx   eax, byte [eax]                         ; 31EE _ 0F B6. 00
        movzx   eax, al                                 ; 31F1 _ 0F B6. C0
        and     eax, 10H                                ; 31F4 _ 83. E0, 10
        test    eax, eax                                ; 31F7 _ 85. C0
        jz      ?_149                                   ; 31F9 _ 74, 13
        mov     eax, dword [ebp+8H]                     ; 31FB _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 31FE _ 8B. 40, 04
        or      eax, 0FFFFFF00H                         ; 3201 _ 0D, FFFFFF00
        mov     edx, eax                                ; 3206 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 3208 _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 320B _ 89. 50, 04
?_149:  mov     eax, dword [ebp+8H]                     ; 320E _ 8B. 45, 08
        movzx   eax, byte [eax]                         ; 3211 _ 0F B6. 00
        movzx   eax, al                                 ; 3214 _ 0F B6. C0
        and     eax, 20H                                ; 3217 _ 83. E0, 20
        test    eax, eax                                ; 321A _ 85. C0
        jz      ?_150                                   ; 321C _ 74, 13
        mov     eax, dword [ebp+8H]                     ; 321E _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 3221 _ 8B. 40, 08
        or      eax, 0FFFFFF00H                         ; 3224 _ 0D, FFFFFF00
        mov     edx, eax                                ; 3229 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 322B _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 322E _ 89. 50, 08
?_150:  mov     eax, dword [ebp+8H]                     ; 3231 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 3234 _ 8B. 40, 08
        neg     eax                                     ; 3237 _ F7. D8
        mov     edx, eax                                ; 3239 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 323B _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 323E _ 89. 50, 08
        mov     eax, 1                                  ; 3241 _ B8, 00000001
        jmp     ?_152                                   ; 3246 _ EB, 05

?_151:  mov     eax, 4294967295                         ; 3248 _ B8, FFFFFFFF
?_152:  leave                                           ; 324D _ C9
        ret                                             ; 324E _ C3
; mouse_decode End of function

intHandlerKeyboard:; Function begin
        push    ebp                                     ; 324F _ 55
        mov     ebp, esp                                ; 3250 _ 89. E5
        sub     esp, 40                                 ; 3252 _ 83. EC, 28
        mov     dword [esp+4H], 32                      ; 3255 _ C7. 44 24, 04, 00000020
        mov     dword [esp], 32                         ; 325D _ C7. 04 24, 00000020
        call    io_out8                                 ; 3264 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 32                      ; 3269 _ C7. 44 24, 04, 00000020
        mov     dword [esp], 160                        ; 3271 _ C7. 04 24, 000000A0
        call    io_out8                                 ; 3278 _ E8, FFFFFFFC(rel)
        mov     dword [esp], 96                         ; 327D _ C7. 04 24, 00000060
        call    io_in8                                  ; 3284 _ E8, FFFFFFFC(rel)
        mov     byte [ebp-9H], al                       ; 3289 _ 88. 45, F7
        movzx   eax, byte [ebp-9H]                      ; 328C _ 0F B6. 45, F7
        mov     dword [esp+4H], eax                     ; 3290 _ 89. 44 24, 04
        mov     dword [esp], keyinfo                    ; 3294 _ C7. 04 24, 00000000(d)
        call    fifo8_put                               ; 329B _ E8, FFFFFFFC(rel)
        leave                                           ; 32A0 _ C9
        ret                                             ; 32A1 _ C3
; intHandlerKeyboard End of function

intHandlerMouse:; Function begin
        push    ebp                                     ; 32A2 _ 55
        mov     ebp, esp                                ; 32A3 _ 89. E5
        sub     esp, 40                                 ; 32A5 _ 83. EC, 28
        mov     dword [esp+4H], 32                      ; 32A8 _ C7. 44 24, 04, 00000020
        mov     dword [esp], 32                         ; 32B0 _ C7. 04 24, 00000020
        call    io_out8                                 ; 32B7 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 32                      ; 32BC _ C7. 44 24, 04, 00000020
        mov     dword [esp], 160                        ; 32C4 _ C7. 04 24, 000000A0
        call    io_out8                                 ; 32CB _ E8, FFFFFFFC(rel)
        mov     dword [esp], 96                         ; 32D0 _ C7. 04 24, 00000060
        call    io_in8                                  ; 32D7 _ E8, FFFFFFFC(rel)
        mov     byte [ebp-9H], al                       ; 32DC _ 88. 45, F7
        movzx   eax, byte [ebp-9H]                      ; 32DF _ 0F B6. 45, F7
        mov     dword [esp+4H], eax                     ; 32E3 _ 89. 44 24, 04
        mov     dword [esp], mouseinfo                  ; 32E7 _ C7. 04 24, 00000000(d)
        call    fifo8_put                               ; 32EE _ E8, FFFFFFFC(rel)
        leave                                           ; 32F3 _ C9
        ret                                             ; 32F4 _ C3
; intHandlerMouse End of function

fifo8_init:; Function begin
        push    ebp                                     ; 32F5 _ 55
        mov     ebp, esp                                ; 32F6 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 32F8 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 32FB _ 8B. 55, 10
        mov     dword [eax], edx                        ; 32FE _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 3300 _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 3303 _ C7. 40, 04, 00000000
        mov     eax, dword [ebp+8H]                     ; 330A _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 330D _ C7. 40, 08, 00000000
        mov     eax, dword [ebp+8H]                     ; 3314 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 3317 _ 8B. 55, 0C
        mov     dword [eax+0CH], edx                    ; 331A _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 331D _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 3320 _ 8B. 55, 0C
        mov     dword [eax+10H], edx                    ; 3323 _ 89. 50, 10
        mov     eax, dword [ebp+8H]                     ; 3326 _ 8B. 45, 08
        mov     dword [eax+14H], 0                      ; 3329 _ C7. 40, 14, 00000000
        mov     eax, dword [ebp+8H]                     ; 3330 _ 8B. 45, 08
        mov     edx, dword [ebp+14H]                    ; 3333 _ 8B. 55, 14
        mov     dword [eax+18H], edx                    ; 3336 _ 89. 50, 18
        pop     ebp                                     ; 3339 _ 5D
        ret                                             ; 333A _ C3
; fifo8_init End of function

fifo8_put:; Function begin
        push    ebp                                     ; 333B _ 55
        mov     ebp, esp                                ; 333C _ 89. E5
        sub     esp, 40                                 ; 333E _ 83. EC, 28
        mov     eax, dword [ebp+0CH]                    ; 3341 _ 8B. 45, 0C
        mov     byte [ebp-1CH], al                      ; 3344 _ 88. 45, E4
        cmp     dword [ebp+8H], 0                       ; 3347 _ 83. 7D, 08, 00
        jnz     ?_153                                   ; 334B _ 75, 0A
        mov     eax, 4294967295                         ; 334D _ B8, FFFFFFFF
        jmp     ?_157                                   ; 3352 _ E9, 000000B1

?_153:  mov     eax, dword [ebp+8H]                     ; 3357 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 335A _ 8B. 40, 10
        test    eax, eax                                ; 335D _ 85. C0
        jnz     ?_154                                   ; 335F _ 75, 1B
        mov     eax, dword [ebp+8H]                     ; 3361 _ 8B. 45, 08
        mov     eax, dword [eax+14H]                    ; 3364 _ 8B. 40, 14
        or      eax, 01H                                ; 3367 _ 83. C8, 01
        mov     edx, eax                                ; 336A _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 336C _ 8B. 45, 08
        mov     dword [eax+14H], edx                    ; 336F _ 89. 50, 14
        mov     eax, 4294967295                         ; 3372 _ B8, FFFFFFFF
        jmp     ?_157                                   ; 3377 _ E9, 0000008C

?_154:  mov     eax, dword [ebp+8H]                     ; 337C _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 337F _ 8B. 40, 04
        mov     dword [ebp-0CH], eax                    ; 3382 _ 89. 45, F4
        mov     eax, dword [ebp+8H]                     ; 3385 _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 3388 _ 8B. 10
        mov     eax, dword [ebp-0CH]                    ; 338A _ 8B. 45, F4
        add     edx, eax                                ; 338D _ 01. C2
        movzx   eax, byte [ebp-1CH]                     ; 338F _ 0F B6. 45, E4
        mov     byte [edx], al                          ; 3393 _ 88. 02
        mov     eax, dword [ebp+8H]                     ; 3395 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 3398 _ 8B. 40, 04
        lea     edx, [eax+1H]                           ; 339B _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 339E _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 33A1 _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 33A4 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 33A7 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 33AA _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 33AD _ 8B. 40, 0C
        cmp     edx, eax                                ; 33B0 _ 39. C2
        jnz     ?_155                                   ; 33B2 _ 75, 0A
        mov     eax, dword [ebp+8H]                     ; 33B4 _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 33B7 _ C7. 40, 04, 00000000
?_155:  mov     eax, dword [ebp+8H]                     ; 33BE _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 33C1 _ 8B. 40, 10
        lea     edx, [eax-1H]                           ; 33C4 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 33C7 _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 33CA _ 89. 50, 10
        mov     eax, dword [ebp+8H]                     ; 33CD _ 8B. 45, 08
        mov     eax, dword [eax+18H]                    ; 33D0 _ 8B. 40, 18
        test    eax, eax                                ; 33D3 _ 85. C0
        jz      ?_156                                   ; 33D5 _ 74, 2C
        mov     eax, dword [ebp+8H]                     ; 33D7 _ 8B. 45, 08
        mov     eax, dword [eax+18H]                    ; 33DA _ 8B. 40, 18
        mov     eax, dword [eax+4H]                     ; 33DD _ 8B. 40, 04
        cmp     eax, 2                                  ; 33E0 _ 83. F8, 02
        jz      ?_156                                   ; 33E3 _ 74, 1E
        mov     eax, dword [ebp+8H]                     ; 33E5 _ 8B. 45, 08
        mov     eax, dword [eax+18H]                    ; 33E8 _ 8B. 40, 18
        mov     dword [esp+8H], 0                       ; 33EB _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], -1                      ; 33F3 _ C7. 44 24, 04, FFFFFFFF
        mov     dword [esp], eax                        ; 33FB _ 89. 04 24
        call    task_run                                ; 33FE _ E8, FFFFFFFC(rel)
?_156:  mov     eax, 0                                  ; 3403 _ B8, 00000000
?_157:  leave                                           ; 3408 _ C9
        ret                                             ; 3409 _ C3
; fifo8_put End of function

fifo8_get:; Function begin
        push    ebp                                     ; 340A _ 55
        mov     ebp, esp                                ; 340B _ 89. E5
        sub     esp, 16                                 ; 340D _ 83. EC, 10
        mov     eax, dword [ebp+8H]                     ; 3410 _ 8B. 45, 08
        mov     edx, dword [eax+10H]                    ; 3413 _ 8B. 50, 10
        mov     eax, dword [ebp+8H]                     ; 3416 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 3419 _ 8B. 40, 0C
        cmp     edx, eax                                ; 341C _ 39. C2
        jnz     ?_158                                   ; 341E _ 75, 11
        mov     eax, dword [ebp+8H]                     ; 3420 _ 8B. 45, 08
        mov     dword [eax+14H], 0                      ; 3423 _ C7. 40, 14, 00000000
        mov     eax, 4294967295                         ; 342A _ B8, FFFFFFFF
        jmp     ?_160                                   ; 342F _ EB, 57

?_158:  mov     eax, dword [ebp+8H]                     ; 3431 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 3434 _ 8B. 40, 08
        mov     dword [ebp-8H], eax                     ; 3437 _ 89. 45, F8
        mov     eax, dword [ebp+8H]                     ; 343A _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 343D _ 8B. 10
        mov     eax, dword [ebp-8H]                     ; 343F _ 8B. 45, F8
        add     eax, edx                                ; 3442 _ 01. D0
        movzx   eax, byte [eax]                         ; 3444 _ 0F B6. 00
        movzx   eax, al                                 ; 3447 _ 0F B6. C0
        mov     dword [ebp-4H], eax                     ; 344A _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 344D _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 3450 _ 8B. 40, 08
        lea     edx, [eax+1H]                           ; 3453 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 3456 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 3459 _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 345C _ 8B. 45, 08
        mov     edx, dword [eax+8H]                     ; 345F _ 8B. 50, 08
        mov     eax, dword [ebp+8H]                     ; 3462 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 3465 _ 8B. 40, 0C
        cmp     edx, eax                                ; 3468 _ 39. C2
        jnz     ?_159                                   ; 346A _ 75, 0A
        mov     eax, dword [ebp+8H]                     ; 346C _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 346F _ C7. 40, 08, 00000000
?_159:  mov     eax, dword [ebp+8H]                     ; 3476 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 3479 _ 8B. 40, 10
        lea     edx, [eax+1H]                           ; 347C _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 347F _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 3482 _ 89. 50, 10
        mov     eax, dword [ebp-4H]                     ; 3485 _ 8B. 45, FC
?_160:  leave                                           ; 3488 _ C9
        ret                                             ; 3489 _ C3
; fifo8_get End of function

fifo8_status:; Function begin
        push    ebp                                     ; 348A _ 55
        mov     ebp, esp                                ; 348B _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 348D _ 8B. 45, 08
        mov     edx, dword [eax+0CH]                    ; 3490 _ 8B. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 3493 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 3496 _ 8B. 40, 10
        sub     edx, eax                                ; 3499 _ 29. C2
        mov     eax, edx                                ; 349B _ 89. D0
        pop     ebp                                     ; 349D _ 5D
        ret                                             ; 349E _ C3
; fifo8_status End of function

charToHexVal:; Function begin
        push    ebp                                     ; 349F _ 55
        mov     ebp, esp                                ; 34A0 _ 89. E5
        sub     esp, 4                                  ; 34A2 _ 83. EC, 04
        mov     eax, dword [ebp+8H]                     ; 34A5 _ 8B. 45, 08
        mov     byte [ebp-4H], al                       ; 34A8 _ 88. 45, FC
        cmp     byte [ebp-4H], 9                        ; 34AB _ 80. 7D, FC, 09
        jle     ?_161                                   ; 34AF _ 7E, 09
        movzx   eax, byte [ebp-4H]                      ; 34B1 _ 0F B6. 45, FC
        add     eax, 55                                 ; 34B5 _ 83. C0, 37
        jmp     ?_162                                   ; 34B8 _ EB, 07

?_161:  movzx   eax, byte [ebp-4H]                      ; 34BA _ 0F B6. 45, FC
        add     eax, 48                                 ; 34BE _ 83. C0, 30
?_162:  leave                                           ; 34C1 _ C9
        ret                                             ; 34C2 _ C3
; charToHexVal End of function

charToHexStr:; Function begin
        push    ebp                                     ; 34C3 _ 55
        mov     ebp, esp                                ; 34C4 _ 89. E5
        sub     esp, 24                                 ; 34C6 _ 83. EC, 18
        mov     eax, dword [ebp+8H]                     ; 34C9 _ 8B. 45, 08
        mov     byte [ebp-14H], al                      ; 34CC _ 88. 45, EC
        mov     dword [ebp-4H], 0                       ; 34CF _ C7. 45, FC, 00000000
        movzx   eax, byte [ebp-14H]                     ; 34D6 _ 0F B6. 45, EC
        and     eax, 0FH                                ; 34DA _ 83. E0, 0F
        mov     byte [ebp-5H], al                       ; 34DD _ 88. 45, FB
        movsx   eax, byte [ebp-5H]                      ; 34E0 _ 0F BE. 45, FB
        mov     dword [esp], eax                        ; 34E4 _ 89. 04 24
        call    charToHexVal                            ; 34E7 _ E8, FFFFFFFC(rel)
        mov     byte [?_301], al                        ; 34EC _ A2, 00000343(d)
        movzx   eax, byte [ebp-14H]                     ; 34F1 _ 0F B6. 45, EC
        shr     al, 4                                   ; 34F5 _ C0. E8, 04
        mov     byte [ebp-14H], al                      ; 34F8 _ 88. 45, EC
        movzx   eax, byte [ebp-14H]                     ; 34FB _ 0F B6. 45, EC
        movsx   eax, al                                 ; 34FF _ 0F BE. C0
        mov     dword [esp], eax                        ; 3502 _ 89. 04 24
        call    charToHexVal                            ; 3505 _ E8, FFFFFFFC(rel)
        mov     byte [?_300], al                        ; 350A _ A2, 00000342(d)
        mov     eax, keyval                             ; 350F _ B8, 00000340(d)
        leave                                           ; 3514 _ C9
        ret                                             ; 3515 _ C3
; charToHexStr End of function

intToHexStr:; Function begin
        push    ebp                                     ; 3516 _ 55
        mov     ebp, esp                                ; 3517 _ 89. E5
        sub     esp, 16                                 ; 3519 _ 83. EC, 10
        mov     byte [str.1386], 48                     ; 351C _ C6. 05, 000002E0(d), 30
        mov     byte [?_304], 88                        ; 3523 _ C6. 05, 000002E1(d), 58
        mov     byte [?_305], 0                         ; 352A _ C6. 05, 000002EA(d), 00
        mov     dword [ebp-0CH], 2                      ; 3531 _ C7. 45, F4, 00000002
        jmp     ?_164                                   ; 3538 _ EB, 0F

?_163:  mov     eax, dword [ebp-0CH]                    ; 353A _ 8B. 45, F4
        add     eax, str.1386                           ; 353D _ 05, 000002E0(d)
        mov     byte [eax], 48                          ; 3542 _ C6. 00, 30
        add     dword [ebp-0CH], 1                      ; 3545 _ 83. 45, F4, 01
?_164:  cmp     dword [ebp-0CH], 9                      ; 3549 _ 83. 7D, F4, 09
        jle     ?_163                                   ; 354D _ 7E, EB
        mov     dword [ebp-8H], 9                       ; 354F _ C7. 45, F8, 00000009
        jmp     ?_168                                   ; 3556 _ EB, 40

?_165:  mov     eax, dword [ebp+8H]                     ; 3558 _ 8B. 45, 08
        and     eax, 0FH                                ; 355B _ 83. E0, 0F
        mov     dword [ebp-4H], eax                     ; 355E _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 3561 _ 8B. 45, 08
        shr     eax, 4                                  ; 3564 _ C1. E8, 04
        mov     dword [ebp+8H], eax                     ; 3567 _ 89. 45, 08
        cmp     dword [ebp-4H], 9                       ; 356A _ 83. 7D, FC, 09
        jle     ?_166                                   ; 356E _ 7E, 13
        mov     eax, dword [ebp-4H]                     ; 3570 _ 8B. 45, FC
        add     eax, 55                                 ; 3573 _ 83. C0, 37
        mov     edx, dword [ebp-8H]                     ; 3576 _ 8B. 55, F8
        add     edx, str.1386                           ; 3579 _ 81. C2, 000002E0(d)
        mov     byte [edx], al                          ; 357F _ 88. 02
        jmp     ?_167                                   ; 3581 _ EB, 11

?_166:  mov     eax, dword [ebp-4H]                     ; 3583 _ 8B. 45, FC
        add     eax, 48                                 ; 3586 _ 83. C0, 30
        mov     edx, dword [ebp-8H]                     ; 3589 _ 8B. 55, F8
        add     edx, str.1386                           ; 358C _ 81. C2, 000002E0(d)
        mov     byte [edx], al                          ; 3592 _ 88. 02
?_167:  sub     dword [ebp-8H], 1                       ; 3594 _ 83. 6D, F8, 01
?_168:  cmp     dword [ebp-8H], 1                       ; 3598 _ 83. 7D, F8, 01
        jle     ?_169                                   ; 359C _ 7E, 06
        cmp     dword [ebp+8H], 0                       ; 359E _ 83. 7D, 08, 00
        jnz     ?_165                                   ; 35A2 _ 75, B4
?_169:  mov     eax, str.1386                           ; 35A4 _ B8, 000002E0(d)
        leave                                           ; 35A9 _ C9
        ret                                             ; 35AA _ C3
; intToHexStr End of function

memman_init:; Function begin
        push    ebp                                     ; 35AB _ 55
        mov     ebp, esp                                ; 35AC _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 35AE _ 8B. 45, 08
        mov     dword [eax], 0                          ; 35B1 _ C7. 00, 00000000
        mov     eax, dword [ebp+8H]                     ; 35B7 _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 35BA _ C7. 40, 04, 00000000
        mov     eax, dword [ebp+8H]                     ; 35C1 _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 35C4 _ C7. 40, 08, 00000000
        mov     eax, dword [ebp+8H]                     ; 35CB _ 8B. 45, 08
        mov     dword [eax+0CH], 0                      ; 35CE _ C7. 40, 0C, 00000000
        pop     ebp                                     ; 35D5 _ 5D
        ret                                             ; 35D6 _ C3
; memman_init End of function

memman_total:; Function begin
        push    ebp                                     ; 35D7 _ 55
        mov     ebp, esp                                ; 35D8 _ 89. E5
        sub     esp, 16                                 ; 35DA _ 83. EC, 10
        mov     dword [ebp-4H], 0                       ; 35DD _ C7. 45, FC, 00000000
        mov     dword [ebp-8H], 0                       ; 35E4 _ C7. 45, F8, 00000000
        jmp     ?_171                                   ; 35EB _ EB, 14

?_170:  mov     eax, dword [ebp+8H]                     ; 35ED _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 35F0 _ 8B. 55, F8
        add     edx, 2                                  ; 35F3 _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 35F6 _ 8B. 44 D0, 04
        add     dword [ebp-4H], eax                     ; 35FA _ 01. 45, FC
        add     dword [ebp-8H], 1                       ; 35FD _ 83. 45, F8, 01
?_171:  mov     eax, dword [ebp+8H]                     ; 3601 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 3604 _ 8B. 00
        cmp     eax, dword [ebp-8H]                     ; 3606 _ 3B. 45, F8
        ja      ?_170                                   ; 3609 _ 77, E2
        mov     eax, dword [ebp-4H]                     ; 360B _ 8B. 45, FC
        leave                                           ; 360E _ C9
        ret                                             ; 360F _ C3
; memman_total End of function

memman_alloc:; Function begin
        push    ebp                                     ; 3610 _ 55
        mov     ebp, esp                                ; 3611 _ 89. E5
        sub     esp, 16                                 ; 3613 _ 83. EC, 10
        mov     dword [ebp-8H], 0                       ; 3616 _ C7. 45, F8, 00000000
        jmp     ?_175                                   ; 361D _ E9, 00000085

?_172:  mov     eax, dword [ebp+8H]                     ; 3622 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 3625 _ 8B. 55, F8
        add     edx, 2                                  ; 3628 _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 362B _ 8B. 44 D0, 04
        cmp     eax, dword [ebp+0CH]                    ; 362F _ 3B. 45, 0C
        jc      ?_174                                   ; 3632 _ 72, 6F
        mov     eax, dword [ebp+8H]                     ; 3634 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 3637 _ 8B. 55, F8
        add     edx, 2                                  ; 363A _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 363D _ 8B. 04 D0
        mov     dword [ebp-4H], eax                     ; 3640 _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 3643 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 3646 _ 8B. 55, F8
        add     edx, 2                                  ; 3649 _ 83. C2, 02
        mov     edx, dword [eax+edx*8]                  ; 364C _ 8B. 14 D0
        mov     eax, dword [ebp+0CH]                    ; 364F _ 8B. 45, 0C
        lea     ecx, [edx+eax]                          ; 3652 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 3655 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 3658 _ 8B. 55, F8
        add     edx, 2                                  ; 365B _ 83. C2, 02
        mov     dword [eax+edx*8], ecx                  ; 365E _ 89. 0C D0
        mov     eax, dword [ebp+8H]                     ; 3661 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 3664 _ 8B. 55, F8
        add     edx, 2                                  ; 3667 _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 366A _ 8B. 44 D0, 04
        sub     eax, dword [ebp+0CH]                    ; 366E _ 2B. 45, 0C
        mov     edx, eax                                ; 3671 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 3673 _ 8B. 45, 08
        mov     ecx, dword [ebp-8H]                     ; 3676 _ 8B. 4D, F8
        add     ecx, 2                                  ; 3679 _ 83. C1, 02
        mov     dword [eax+ecx*8+4H], edx               ; 367C _ 89. 54 C8, 04
        mov     eax, dword [ebp+8H]                     ; 3680 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 3683 _ 8B. 55, F8
        add     edx, 2                                  ; 3686 _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 3689 _ 8B. 44 D0, 04
        test    eax, eax                                ; 368D _ 85. C0
        jnz     ?_173                                   ; 368F _ 75, 0D
        mov     eax, dword [ebp+8H]                     ; 3691 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 3694 _ 8B. 00
        lea     edx, [eax-1H]                           ; 3696 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 3699 _ 8B. 45, 08
        mov     dword [eax], edx                        ; 369C _ 89. 10
?_173:  mov     eax, dword [ebp-4H]                     ; 369E _ 8B. 45, FC
        jmp     ?_176                                   ; 36A1 _ EB, 17

?_174:  add     dword [ebp-8H], 1                       ; 36A3 _ 83. 45, F8, 01
?_175:  mov     eax, dword [ebp+8H]                     ; 36A7 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 36AA _ 8B. 00
        cmp     eax, dword [ebp-8H]                     ; 36AC _ 3B. 45, F8
        ja      ?_172                                   ; 36AF _ 0F 87, FFFFFF6D
        mov     eax, 0                                  ; 36B5 _ B8, 00000000
?_176:  leave                                           ; 36BA _ C9
        ret                                             ; 36BB _ C3
; memman_alloc End of function

memman_free:; Function begin
        push    ebp                                     ; 36BC _ 55
        mov     ebp, esp                                ; 36BD _ 89. E5
        push    ebx                                     ; 36BF _ 53
        sub     esp, 16                                 ; 36C0 _ 83. EC, 10
        mov     dword [ebp-0CH], 0                      ; 36C3 _ C7. 45, F4, 00000000
        jmp     ?_179                                   ; 36CA _ EB, 17

?_177:  mov     eax, dword [ebp+8H]                     ; 36CC _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 36CF _ 8B. 55, F4
        add     edx, 2                                  ; 36D2 _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 36D5 _ 8B. 04 D0
        cmp     eax, dword [ebp+0CH]                    ; 36D8 _ 3B. 45, 0C
        jbe     ?_178                                   ; 36DB _ 76, 02
        jmp     ?_180                                   ; 36DD _ EB, 0E

?_178:  add     dword [ebp-0CH], 1                      ; 36DF _ 83. 45, F4, 01
?_179:  mov     eax, dword [ebp+8H]                     ; 36E3 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 36E6 _ 8B. 00
        cmp     eax, dword [ebp-0CH]                    ; 36E8 _ 3B. 45, F4
        jg      ?_177                                   ; 36EB _ 7F, DF
?_180:  cmp     dword [ebp-0CH], 0                      ; 36ED _ 83. 7D, F4, 00
        jle     ?_182                                   ; 36F1 _ 0F 8E, 000000BA
        mov     eax, dword [ebp-0CH]                    ; 36F7 _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 36FA _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 36FD _ 8B. 45, 08
        add     edx, 2                                  ; 3700 _ 83. C2, 02
        mov     edx, dword [eax+edx*8]                  ; 3703 _ 8B. 14 D0
        mov     eax, dword [ebp-0CH]                    ; 3706 _ 8B. 45, F4
        lea     ecx, [eax-1H]                           ; 3709 _ 8D. 48, FF
        mov     eax, dword [ebp+8H]                     ; 370C _ 8B. 45, 08
        add     ecx, 2                                  ; 370F _ 83. C1, 02
        mov     eax, dword [eax+ecx*8+4H]               ; 3712 _ 8B. 44 C8, 04
        add     eax, edx                                ; 3716 _ 01. D0
        cmp     eax, dword [ebp+0CH]                    ; 3718 _ 3B. 45, 0C
        jne     ?_182                                   ; 371B _ 0F 85, 00000090
        mov     eax, dword [ebp-0CH]                    ; 3721 _ 8B. 45, F4
        lea     ebx, [eax-1H]                           ; 3724 _ 8D. 58, FF
        mov     eax, dword [ebp-0CH]                    ; 3727 _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 372A _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 372D _ 8B. 45, 08
        add     edx, 2                                  ; 3730 _ 83. C2, 02
        mov     edx, dword [eax+edx*8+4H]               ; 3733 _ 8B. 54 D0, 04
        mov     eax, dword [ebp+10H]                    ; 3737 _ 8B. 45, 10
        lea     ecx, [edx+eax]                          ; 373A _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 373D _ 8B. 45, 08
        lea     edx, [ebx+2H]                           ; 3740 _ 8D. 53, 02
        mov     dword [eax+edx*8+4H], ecx               ; 3743 _ 89. 4C D0, 04
        mov     eax, dword [ebp+8H]                     ; 3747 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 374A _ 8B. 00
        cmp     eax, dword [ebp-0CH]                    ; 374C _ 3B. 45, F4
        jle     ?_181                                   ; 374F _ 7E, 56
        mov     eax, dword [ebp+10H]                    ; 3751 _ 8B. 45, 10
        mov     edx, dword [ebp+0CH]                    ; 3754 _ 8B. 55, 0C
        lea     ecx, [edx+eax]                          ; 3757 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 375A _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 375D _ 8B. 55, F4
        add     edx, 2                                  ; 3760 _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 3763 _ 8B. 04 D0
        cmp     ecx, eax                                ; 3766 _ 39. C1
        jnz     ?_181                                   ; 3768 _ 75, 3D
        mov     eax, dword [ebp-0CH]                    ; 376A _ 8B. 45, F4
        lea     ebx, [eax-1H]                           ; 376D _ 8D. 58, FF
        mov     eax, dword [ebp-0CH]                    ; 3770 _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 3773 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 3776 _ 8B. 45, 08
        add     edx, 2                                  ; 3779 _ 83. C2, 02
        mov     edx, dword [eax+edx*8+4H]               ; 377C _ 8B. 54 D0, 04
        mov     eax, dword [ebp+8H]                     ; 3780 _ 8B. 45, 08
        mov     ecx, dword [ebp-0CH]                    ; 3783 _ 8B. 4D, F4
        add     ecx, 2                                  ; 3786 _ 83. C1, 02
        mov     eax, dword [eax+ecx*8+4H]               ; 3789 _ 8B. 44 C8, 04
        lea     ecx, [edx+eax]                          ; 378D _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 3790 _ 8B. 45, 08
        lea     edx, [ebx+2H]                           ; 3793 _ 8D. 53, 02
        mov     dword [eax+edx*8+4H], ecx               ; 3796 _ 89. 4C D0, 04
        mov     eax, dword [ebp+8H]                     ; 379A _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 379D _ 8B. 00
        lea     edx, [eax-1H]                           ; 379F _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 37A2 _ 8B. 45, 08
        mov     dword [eax], edx                        ; 37A5 _ 89. 10
?_181:  mov     eax, 0                                  ; 37A7 _ B8, 00000000
        jmp     ?_188                                   ; 37AC _ E9, 0000011C

?_182:  mov     eax, dword [ebp+8H]                     ; 37B1 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 37B4 _ 8B. 00
        cmp     eax, dword [ebp-0CH]                    ; 37B6 _ 3B. 45, F4
        jle     ?_183                                   ; 37B9 _ 7E, 52
        mov     eax, dword [ebp+10H]                    ; 37BB _ 8B. 45, 10
        mov     edx, dword [ebp+0CH]                    ; 37BE _ 8B. 55, 0C
        lea     ecx, [edx+eax]                          ; 37C1 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 37C4 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 37C7 _ 8B. 55, F4
        add     edx, 2                                  ; 37CA _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 37CD _ 8B. 04 D0
        cmp     ecx, eax                                ; 37D0 _ 39. C1
        jnz     ?_183                                   ; 37D2 _ 75, 39
        mov     eax, dword [ebp+8H]                     ; 37D4 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 37D7 _ 8B. 55, F4
        lea     ecx, [edx+2H]                           ; 37DA _ 8D. 4A, 02
        mov     edx, dword [ebp+0CH]                    ; 37DD _ 8B. 55, 0C
        mov     dword [eax+ecx*8], edx                  ; 37E0 _ 89. 14 C8
        mov     eax, dword [ebp+8H]                     ; 37E3 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 37E6 _ 8B. 55, F4
        add     edx, 2                                  ; 37E9 _ 83. C2, 02
        mov     edx, dword [eax+edx*8+4H]               ; 37EC _ 8B. 54 D0, 04
        mov     eax, dword [ebp+10H]                    ; 37F0 _ 8B. 45, 10
        lea     ecx, [edx+eax]                          ; 37F3 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 37F6 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 37F9 _ 8B. 55, F4
        add     edx, 2                                  ; 37FC _ 83. C2, 02
        mov     dword [eax+edx*8+4H], ecx               ; 37FF _ 89. 4C D0, 04
        mov     eax, 0                                  ; 3803 _ B8, 00000000
        jmp     ?_188                                   ; 3808 _ E9, 000000C0

?_183:  mov     eax, dword [ebp+8H]                     ; 380D _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 3810 _ 8B. 00
        cmp     eax, 4095                               ; 3812 _ 3D, 00000FFF
        jg      ?_187                                   ; 3817 _ 0F 8F, 00000087
        mov     eax, dword [ebp+8H]                     ; 381D _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 3820 _ 8B. 00
        mov     dword [ebp-8H], eax                     ; 3822 _ 89. 45, F8
        jmp     ?_185                                   ; 3825 _ EB, 28

?_184:  mov     eax, dword [ebp-8H]                     ; 3827 _ 8B. 45, F8
        lea     edx, [eax-1H]                           ; 382A _ 8D. 50, FF
        mov     ecx, dword [ebp+8H]                     ; 382D _ 8B. 4D, 08
        mov     eax, dword [ebp-8H]                     ; 3830 _ 8B. 45, F8
        lea     ebx, [eax+2H]                           ; 3833 _ 8D. 58, 02
        mov     eax, dword [ebp+8H]                     ; 3836 _ 8B. 45, 08
        add     edx, 2                                  ; 3839 _ 83. C2, 02
        lea     edx, [eax+edx*8]                        ; 383C _ 8D. 14 D0
        mov     eax, dword [edx]                        ; 383F _ 8B. 02
        mov     edx, dword [edx+4H]                     ; 3841 _ 8B. 52, 04
        mov     dword [ecx+ebx*8], eax                  ; 3844 _ 89. 04 D9
        mov     dword [ecx+ebx*8+4H], edx               ; 3847 _ 89. 54 D9, 04
        sub     dword [ebp-8H], 1                       ; 384B _ 83. 6D, F8, 01
?_185:  mov     eax, dword [ebp-8H]                     ; 384F _ 8B. 45, F8
        cmp     eax, dword [ebp-0CH]                    ; 3852 _ 3B. 45, F4
        jg      ?_184                                   ; 3855 _ 7F, D0
        mov     eax, dword [ebp+8H]                     ; 3857 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 385A _ 8B. 00
        lea     edx, [eax+1H]                           ; 385C _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 385F _ 8B. 45, 08
        mov     dword [eax], edx                        ; 3862 _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 3864 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 3867 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 386A _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 386D _ 8B. 00
        cmp     edx, eax                                ; 386F _ 39. C2
        jge     ?_186                                   ; 3871 _ 7D, 0B
        mov     eax, dword [ebp+8H]                     ; 3873 _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 3876 _ 8B. 10
        mov     eax, dword [ebp+8H]                     ; 3878 _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 387B _ 89. 50, 04
?_186:  mov     eax, dword [ebp+8H]                     ; 387E _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 3881 _ 8B. 55, F4
        lea     ecx, [edx+2H]                           ; 3884 _ 8D. 4A, 02
        mov     edx, dword [ebp+0CH]                    ; 3887 _ 8B. 55, 0C
        mov     dword [eax+ecx*8], edx                  ; 388A _ 89. 14 C8
        mov     eax, dword [ebp+8H]                     ; 388D _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 3890 _ 8B. 55, F4
        lea     ecx, [edx+2H]                           ; 3893 _ 8D. 4A, 02
        mov     edx, dword [ebp+10H]                    ; 3896 _ 8B. 55, 10
        mov     dword [eax+ecx*8+4H], edx               ; 3899 _ 89. 54 C8, 04
        mov     eax, 0                                  ; 389D _ B8, 00000000
        jmp     ?_188                                   ; 38A2 _ EB, 29

?_187:  mov     eax, dword [ebp+8H]                     ; 38A4 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 38A7 _ 8B. 40, 0C
        lea     edx, [eax+1H]                           ; 38AA _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 38AD _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 38B0 _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 38B3 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 38B6 _ 8B. 40, 08
        mov     edx, eax                                ; 38B9 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 38BB _ 8B. 45, 10
        add     eax, edx                                ; 38BE _ 01. D0
        mov     edx, eax                                ; 38C0 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 38C2 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 38C5 _ 89. 50, 08
        mov     eax, 4294967295                         ; 38C8 _ B8, FFFFFFFF
?_188:  add     esp, 16                                 ; 38CD _ 83. C4, 10
        pop     ebx                                     ; 38D0 _ 5B
        pop     ebp                                     ; 38D1 _ 5D
        ret                                             ; 38D2 _ C3
; memman_free End of function

memman_alloc_4k:; Function begin
        push    ebp                                     ; 38D3 _ 55
        mov     ebp, esp                                ; 38D4 _ 89. E5
        sub     esp, 24                                 ; 38D6 _ 83. EC, 18
        mov     eax, dword [ebp+0CH]                    ; 38D9 _ 8B. 45, 0C
        add     eax, 4095                               ; 38DC _ 05, 00000FFF
        and     eax, 0FFFFF000H                         ; 38E1 _ 25, FFFFF000
        mov     dword [ebp+0CH], eax                    ; 38E6 _ 89. 45, 0C
        mov     eax, dword [ebp+0CH]                    ; 38E9 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 38EC _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 38F0 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 38F3 _ 89. 04 24
        call    memman_alloc                            ; 38F6 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-4H], eax                     ; 38FB _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 38FE _ 8B. 45, FC
        leave                                           ; 3901 _ C9
        ret                                             ; 3902 _ C3
; memman_alloc_4k End of function

memman_free_4k:; Function begin
        push    ebp                                     ; 3903 _ 55
        mov     ebp, esp                                ; 3904 _ 89. E5
        sub     esp, 28                                 ; 3906 _ 83. EC, 1C
        mov     eax, dword [ebp+10H]                    ; 3909 _ 8B. 45, 10
        add     eax, 4095                               ; 390C _ 05, 00000FFF
        and     eax, 0FFFFF000H                         ; 3911 _ 25, FFFFF000
        mov     dword [ebp+10H], eax                    ; 3916 _ 89. 45, 10
        mov     eax, dword [ebp+10H]                    ; 3919 _ 8B. 45, 10
        mov     dword [esp+8H], eax                     ; 391C _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 3920 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 3923 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 3927 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 392A _ 89. 04 24
        call    memman_free                             ; 392D _ E8, FFFFFFFC(rel)
        mov     dword [ebp-4H], eax                     ; 3932 _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 3935 _ 8B. 45, FC
        leave                                           ; 3938 _ C9
        ret                                             ; 3939 _ C3
; memman_free_4k End of function

sheet_control_init:; Function begin
        push    ebp                                     ; 393A _ 55
        mov     ebp, esp                                ; 393B _ 89. E5
        sub     esp, 40                                 ; 393D _ 83. EC, 28
        mov     dword [esp+4H], 9236                    ; 3940 _ C7. 44 24, 04, 00002414
        mov     eax, dword [ebp+8H]                     ; 3948 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 394B _ 89. 04 24
        call    memman_alloc_4k                         ; 394E _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 3953 _ 89. 45, F4
        cmp     dword [ebp-0CH], 0                      ; 3956 _ 83. 7D, F4, 00
        jnz     ?_189                                   ; 395A _ 75, 24
        mov     eax, dword [ebp-0CH]                    ; 395C _ 8B. 45, F4
        mov     dword [esp+8H], 9236                    ; 395F _ C7. 44 24, 08, 00002414
        mov     dword [esp+4H], eax                     ; 3967 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 396B _ 8B. 45, 08
        mov     dword [esp], eax                        ; 396E _ 89. 04 24
        call    memman_free_4k                          ; 3971 _ E8, FFFFFFFC(rel)
        mov     eax, 0                                  ; 3976 _ B8, 00000000
        jmp     ?_193                                   ; 397B _ E9, 0000009D

?_189:  mov     eax, dword [ebp-0CH]                    ; 3980 _ 8B. 45, F4
        mov     edx, dword [ebp+0CH]                    ; 3983 _ 8B. 55, 0C
        mov     dword [eax], edx                        ; 3986 _ 89. 10
        mov     eax, dword [ebp-0CH]                    ; 3988 _ 8B. 45, F4
        mov     edx, dword [ebp+10H]                    ; 398B _ 8B. 55, 10
        mov     dword [eax+4H], edx                     ; 398E _ 89. 50, 04
        mov     eax, dword [ebp-0CH]                    ; 3991 _ 8B. 45, F4
        mov     edx, dword [ebp+14H]                    ; 3994 _ 8B. 55, 14
        mov     dword [eax+8H], edx                     ; 3997 _ 89. 50, 08
        mov     eax, dword [ebp-0CH]                    ; 399A _ 8B. 45, F4
        mov     dword [eax+0CH], -1                     ; 399D _ C7. 40, 0C, FFFFFFFF
        mov     dword [ebp-10H], 0                      ; 39A4 _ C7. 45, F0, 00000000
        jmp     ?_191                                   ; 39AB _ EB, 1B

?_190:  mov     eax, dword [ebp-0CH]                    ; 39AD _ 8B. 45, F4
        mov     edx, dword [ebp-10H]                    ; 39B0 _ 8B. 55, F0
        add     edx, 33                                 ; 39B3 _ 83. C2, 21
        shl     edx, 5                                  ; 39B6 _ C1. E2, 05
        add     eax, edx                                ; 39B9 _ 01. D0
        add     eax, 16                                 ; 39BB _ 83. C0, 10
        mov     dword [eax], 0                          ; 39BE _ C7. 00, 00000000
        add     dword [ebp-10H], 1                      ; 39C4 _ 83. 45, F0, 01
?_191:  cmp     dword [ebp-10H], 255                    ; 39C8 _ 81. 7D, F0, 000000FF
        jle     ?_190                                   ; 39CF _ 7E, DC
        mov     eax, dword [ebp+10H]                    ; 39D1 _ 8B. 45, 10
        imul    eax, dword [ebp+14H]                    ; 39D4 _ 0F AF. 45, 14
        mov     dword [esp+4H], eax                     ; 39D8 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 39DC _ 8B. 45, 08
        mov     dword [esp], eax                        ; 39DF _ 89. 04 24
        call    memman_alloc_4k                         ; 39E2 _ E8, FFFFFFFC(rel)
        mov     edx, eax                                ; 39E7 _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 39E9 _ 8B. 45, F4
        mov     dword [eax+10H], edx                    ; 39EC _ 89. 50, 10
        mov     eax, dword [ebp-0CH]                    ; 39EF _ 8B. 45, F4
        mov     eax, dword [eax+10H]                    ; 39F2 _ 8B. 40, 10
        test    eax, eax                                ; 39F5 _ 85. C0
        jnz     ?_192                                   ; 39F7 _ 75, 21
        mov     eax, dword [ebp-0CH]                    ; 39F9 _ 8B. 45, F4
        mov     dword [esp+8H], 9236                    ; 39FC _ C7. 44 24, 08, 00002414
        mov     dword [esp+4H], eax                     ; 3A04 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 3A08 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3A0B _ 89. 04 24
        call    memman_free_4k                          ; 3A0E _ E8, FFFFFFFC(rel)
        mov     eax, 0                                  ; 3A13 _ B8, 00000000
        jmp     ?_193                                   ; 3A18 _ EB, 03

?_192:  mov     eax, dword [ebp-0CH]                    ; 3A1A _ 8B. 45, F4
?_193:  leave                                           ; 3A1D _ C9
        ret                                             ; 3A1E _ C3
; sheet_control_init End of function

sheet_alloc:; Function begin
        push    ebp                                     ; 3A1F _ 55
        mov     ebp, esp                                ; 3A20 _ 89. E5
        sub     esp, 16                                 ; 3A22 _ 83. EC, 10
        mov     dword [ebp-8H], 0                       ; 3A25 _ C7. 45, F8, 00000000
        jmp     ?_196                                   ; 3A2C _ EB, 5B

?_194:  mov     eax, dword [ebp+8H]                     ; 3A2E _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 3A31 _ 8B. 55, F8
        add     edx, 33                                 ; 3A34 _ 83. C2, 21
        shl     edx, 5                                  ; 3A37 _ C1. E2, 05
        add     eax, edx                                ; 3A3A _ 01. D0
        add     eax, 16                                 ; 3A3C _ 83. C0, 10
        mov     eax, dword [eax]                        ; 3A3F _ 8B. 00
        test    eax, eax                                ; 3A41 _ 85. C0
        jnz     ?_195                                   ; 3A43 _ 75, 40
        mov     eax, dword [ebp-8H]                     ; 3A45 _ 8B. 45, F8
        shl     eax, 5                                  ; 3A48 _ C1. E0, 05
        lea     edx, [eax+410H]                         ; 3A4B _ 8D. 90, 00000410
        mov     eax, dword [ebp+8H]                     ; 3A51 _ 8B. 45, 08
        add     eax, edx                                ; 3A54 _ 01. D0
        add     eax, 4                                  ; 3A56 _ 83. C0, 04
        mov     dword [ebp-4H], eax                     ; 3A59 _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 3A5C _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 3A5F _ 8B. 55, F8
        lea     ecx, [edx+4H]                           ; 3A62 _ 8D. 4A, 04
        mov     edx, dword [ebp-4H]                     ; 3A65 _ 8B. 55, FC
        mov     dword [eax+ecx*4+4H], edx               ; 3A68 _ 89. 54 88, 04
        mov     eax, dword [ebp-4H]                     ; 3A6C _ 8B. 45, FC
        mov     dword [eax+1CH], 1                      ; 3A6F _ C7. 40, 1C, 00000001
        mov     eax, dword [ebp-4H]                     ; 3A76 _ 8B. 45, FC
        mov     dword [eax+18H], -1                     ; 3A79 _ C7. 40, 18, FFFFFFFF
        mov     eax, dword [ebp-4H]                     ; 3A80 _ 8B. 45, FC
        jmp     ?_197                                   ; 3A83 _ EB, 12

?_195:  add     dword [ebp-8H], 1                       ; 3A85 _ 83. 45, F8, 01
?_196:  cmp     dword [ebp-8H], 255                     ; 3A89 _ 81. 7D, F8, 000000FF
        jle     ?_194                                   ; 3A90 _ 7E, 9C
        mov     eax, 0                                  ; 3A92 _ B8, 00000000
?_197:  leave                                           ; 3A97 _ C9
        ret                                             ; 3A98 _ C3
; sheet_alloc End of function

sheet_setbuf:; Function begin
        push    ebp                                     ; 3A99 _ 55
        mov     ebp, esp                                ; 3A9A _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 3A9C _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 3A9F _ 8B. 55, 0C
        mov     dword [eax], edx                        ; 3AA2 _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 3AA4 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 3AA7 _ 8B. 55, 10
        mov     dword [eax+4H], edx                     ; 3AAA _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 3AAD _ 8B. 45, 08
        mov     edx, dword [ebp+14H]                    ; 3AB0 _ 8B. 55, 14
        mov     dword [eax+8H], edx                     ; 3AB3 _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 3AB6 _ 8B. 45, 08
        mov     edx, dword [ebp+18H]                    ; 3AB9 _ 8B. 55, 18
        mov     dword [eax+14H], edx                    ; 3ABC _ 89. 50, 14
        pop     ebp                                     ; 3ABF _ 5D
        ret                                             ; 3AC0 _ C3
; sheet_setbuf End of function

sheet_updown:; Function begin
        push    ebp                                     ; 3AC1 _ 55
        mov     ebp, esp                                ; 3AC2 _ 89. E5
        push    esi                                     ; 3AC4 _ 56
        push    ebx                                     ; 3AC5 _ 53
        sub     esp, 48                                 ; 3AC6 _ 83. EC, 30
        mov     eax, dword [ebp+0CH]                    ; 3AC9 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 3ACC _ 8B. 40, 18
        mov     dword [ebp-0CH], eax                    ; 3ACF _ 89. 45, F4
        mov     eax, dword [ebp+8H]                     ; 3AD2 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 3AD5 _ 8B. 40, 0C
        add     eax, 1                                  ; 3AD8 _ 83. C0, 01
        cmp     eax, dword [ebp+10H]                    ; 3ADB _ 3B. 45, 10
        jge     ?_198                                   ; 3ADE _ 7D, 0C
        mov     eax, dword [ebp+8H]                     ; 3AE0 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 3AE3 _ 8B. 40, 0C
        add     eax, 1                                  ; 3AE6 _ 83. C0, 01
        mov     dword [ebp+10H], eax                    ; 3AE9 _ 89. 45, 10
?_198:  cmp     dword [ebp+10H], -1                     ; 3AEC _ 83. 7D, 10, FF
        jge     ?_199                                   ; 3AF0 _ 7D, 07
        mov     dword [ebp+10H], -1                     ; 3AF2 _ C7. 45, 10, FFFFFFFF
?_199:  mov     eax, dword [ebp+0CH]                    ; 3AF9 _ 8B. 45, 0C
        mov     edx, dword [ebp+10H]                    ; 3AFC _ 8B. 55, 10
        mov     dword [eax+18H], edx                    ; 3AFF _ 89. 50, 18
        mov     eax, dword [ebp-0CH]                    ; 3B02 _ 8B. 45, F4
        cmp     eax, dword [ebp+10H]                    ; 3B05 _ 3B. 45, 10
        jle     ?_206                                   ; 3B08 _ 0F 8E, 00000201
        cmp     dword [ebp+10H], 0                      ; 3B0E _ 83. 7D, 10, 00
        js      ?_202                                   ; 3B12 _ 0F 88, 000000F7
        mov     eax, dword [ebp-0CH]                    ; 3B18 _ 8B. 45, F4
        mov     dword [ebp-10H], eax                    ; 3B1B _ 89. 45, F0
        jmp     ?_201                                   ; 3B1E _ EB, 34

?_200:  mov     eax, dword [ebp-10H]                    ; 3B20 _ 8B. 45, F0
        lea     edx, [eax-1H]                           ; 3B23 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 3B26 _ 8B. 45, 08
        add     edx, 4                                  ; 3B29 _ 83. C2, 04
        mov     edx, dword [eax+edx*4+4H]               ; 3B2C _ 8B. 54 90, 04
        mov     eax, dword [ebp+8H]                     ; 3B30 _ 8B. 45, 08
        mov     ecx, dword [ebp-10H]                    ; 3B33 _ 8B. 4D, F0
        add     ecx, 4                                  ; 3B36 _ 83. C1, 04
        mov     dword [eax+ecx*4+4H], edx               ; 3B39 _ 89. 54 88, 04
        mov     eax, dword [ebp+8H]                     ; 3B3D _ 8B. 45, 08
        mov     edx, dword [ebp-10H]                    ; 3B40 _ 8B. 55, F0
        add     edx, 4                                  ; 3B43 _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 3B46 _ 8B. 44 90, 04
        mov     edx, dword [ebp-10H]                    ; 3B4A _ 8B. 55, F0
        mov     dword [eax+18H], edx                    ; 3B4D _ 89. 50, 18
        sub     dword [ebp-10H], 1                      ; 3B50 _ 83. 6D, F0, 01
?_201:  mov     eax, dword [ebp-10H]                    ; 3B54 _ 8B. 45, F0
        cmp     eax, dword [ebp+10H]                    ; 3B57 _ 3B. 45, 10
        jg      ?_200                                   ; 3B5A _ 7F, C4
        mov     eax, dword [ebp+8H]                     ; 3B5C _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 3B5F _ 8B. 55, 10
        lea     ecx, [edx+4H]                           ; 3B62 _ 8D. 4A, 04
        mov     edx, dword [ebp+0CH]                    ; 3B65 _ 8B. 55, 0C
        mov     dword [eax+ecx*4+4H], edx               ; 3B68 _ 89. 54 88, 04
        mov     eax, dword [ebp+10H]                    ; 3B6C _ 8B. 45, 10
        lea     esi, [eax+1H]                           ; 3B6F _ 8D. 70, 01
        mov     eax, dword [ebp+0CH]                    ; 3B72 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 3B75 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 3B78 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 3B7B _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 3B7E _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 3B81 _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 3B84 _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 3B87 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 3B8A _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 3B8D _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 3B90 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 3B93 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 3B96 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 3B99 _ 8B. 40, 0C
        mov     dword [esp+14H], esi                    ; 3B9C _ 89. 74 24, 14
        mov     dword [esp+10H], ebx                    ; 3BA0 _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 3BA4 _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 3BA8 _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 3BAC _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 3BB0 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3BB3 _ 89. 04 24
        call    sheet_refresh_map                       ; 3BB6 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 3BBB _ 8B. 45, 10
        lea     esi, [eax+1H]                           ; 3BBE _ 8D. 70, 01
        mov     eax, dword [ebp+0CH]                    ; 3BC1 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 3BC4 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 3BC7 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 3BCA _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 3BCD _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 3BD0 _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 3BD3 _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 3BD6 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 3BD9 _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 3BDC _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 3BDF _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 3BE2 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 3BE5 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 3BE8 _ 8B. 40, 0C
        mov     dword [esp+14H], esi                    ; 3BEB _ 89. 74 24, 14
        mov     dword [esp+10H], ebx                    ; 3BEF _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 3BF3 _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 3BF7 _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 3BFB _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 3BFF _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3C02 _ 89. 04 24
        call    sheet_refresh_local                     ; 3C05 _ E8, FFFFFFFC(rel)
        jmp     ?_213                                   ; 3C0A _ E9, 0000026C

?_202:  mov     eax, dword [ebp+8H]                     ; 3C0F _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 3C12 _ 8B. 40, 0C
        cmp     eax, dword [ebp-0CH]                    ; 3C15 _ 3B. 45, F4
        jle     ?_205                                   ; 3C18 _ 7E, 47
        mov     eax, dword [ebp-0CH]                    ; 3C1A _ 8B. 45, F4
        mov     dword [ebp-10H], eax                    ; 3C1D _ 89. 45, F0
        jmp     ?_204                                   ; 3C20 _ EB, 34

?_203:  mov     eax, dword [ebp-10H]                    ; 3C22 _ 8B. 45, F0
        lea     edx, [eax+1H]                           ; 3C25 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 3C28 _ 8B. 45, 08
        add     edx, 4                                  ; 3C2B _ 83. C2, 04
        mov     edx, dword [eax+edx*4+4H]               ; 3C2E _ 8B. 54 90, 04
        mov     eax, dword [ebp+8H]                     ; 3C32 _ 8B. 45, 08
        mov     ecx, dword [ebp-10H]                    ; 3C35 _ 8B. 4D, F0
        add     ecx, 4                                  ; 3C38 _ 83. C1, 04
        mov     dword [eax+ecx*4+4H], edx               ; 3C3B _ 89. 54 88, 04
        mov     eax, dword [ebp+8H]                     ; 3C3F _ 8B. 45, 08
        mov     edx, dword [ebp-10H]                    ; 3C42 _ 8B. 55, F0
        add     edx, 4                                  ; 3C45 _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 3C48 _ 8B. 44 90, 04
        mov     edx, dword [ebp-10H]                    ; 3C4C _ 8B. 55, F0
        mov     dword [eax+18H], edx                    ; 3C4F _ 89. 50, 18
        add     dword [ebp-10H], 1                      ; 3C52 _ 83. 45, F0, 01
?_204:  mov     eax, dword [ebp+8H]                     ; 3C56 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 3C59 _ 8B. 40, 0C
        cmp     eax, dword [ebp-10H]                    ; 3C5C _ 3B. 45, F0
        jg      ?_203                                   ; 3C5F _ 7F, C1
?_205:  mov     eax, dword [ebp+8H]                     ; 3C61 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 3C64 _ 8B. 40, 0C
        lea     edx, [eax-1H]                           ; 3C67 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 3C6A _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 3C6D _ 89. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 3C70 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 3C73 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 3C76 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 3C79 _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 3C7C _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 3C7F _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 3C82 _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 3C85 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 3C88 _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 3C8B _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 3C8E _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 3C91 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 3C94 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 3C97 _ 8B. 40, 0C
        mov     dword [esp+14H], 0                      ; 3C9A _ C7. 44 24, 14, 00000000
        mov     dword [esp+10H], ebx                    ; 3CA2 _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 3CA6 _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 3CAA _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 3CAE _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 3CB2 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3CB5 _ 89. 04 24
        call    sheet_refresh_map                       ; 3CB8 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+0CH]                    ; 3CBD _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 3CC0 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 3CC3 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 3CC6 _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 3CC9 _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 3CCC _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 3CCF _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 3CD2 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 3CD5 _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 3CD8 _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 3CDB _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 3CDE _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 3CE1 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 3CE4 _ 8B. 40, 0C
        mov     dword [esp+14H], 0                      ; 3CE7 _ C7. 44 24, 14, 00000000
        mov     dword [esp+10H], ebx                    ; 3CEF _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 3CF3 _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 3CF7 _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 3CFB _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 3CFF _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3D02 _ 89. 04 24
        call    sheet_refresh_local                     ; 3D05 _ E8, FFFFFFFC(rel)
        jmp     ?_213                                   ; 3D0A _ E9, 0000016C

?_206:  mov     eax, dword [ebp-0CH]                    ; 3D0F _ 8B. 45, F4
        cmp     eax, dword [ebp+10H]                    ; 3D12 _ 3B. 45, 10
        jge     ?_213                                   ; 3D15 _ 0F 8D, 00000160
        cmp     dword [ebp-0CH], 0                      ; 3D1B _ 83. 7D, F4, 00
        js      ?_209                                   ; 3D1F _ 78, 56
        mov     eax, dword [ebp-0CH]                    ; 3D21 _ 8B. 45, F4
        mov     dword [ebp-10H], eax                    ; 3D24 _ 89. 45, F0
        jmp     ?_208                                   ; 3D27 _ EB, 34

?_207:  mov     eax, dword [ebp-10H]                    ; 3D29 _ 8B. 45, F0
        lea     edx, [eax+1H]                           ; 3D2C _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 3D2F _ 8B. 45, 08
        add     edx, 4                                  ; 3D32 _ 83. C2, 04
        mov     edx, dword [eax+edx*4+4H]               ; 3D35 _ 8B. 54 90, 04
        mov     eax, dword [ebp+8H]                     ; 3D39 _ 8B. 45, 08
        mov     ecx, dword [ebp-10H]                    ; 3D3C _ 8B. 4D, F0
        add     ecx, 4                                  ; 3D3F _ 83. C1, 04
        mov     dword [eax+ecx*4+4H], edx               ; 3D42 _ 89. 54 88, 04
        mov     eax, dword [ebp+8H]                     ; 3D46 _ 8B. 45, 08
        mov     edx, dword [ebp-10H]                    ; 3D49 _ 8B. 55, F0
        add     edx, 4                                  ; 3D4C _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 3D4F _ 8B. 44 90, 04
        mov     edx, dword [ebp-10H]                    ; 3D53 _ 8B. 55, F0
        mov     dword [eax+18H], edx                    ; 3D56 _ 89. 50, 18
        add     dword [ebp-10H], 1                      ; 3D59 _ 83. 45, F0, 01
?_208:  mov     eax, dword [ebp-10H]                    ; 3D5D _ 8B. 45, F0
        cmp     eax, dword [ebp+10H]                    ; 3D60 _ 3B. 45, 10
        jl      ?_207                                   ; 3D63 _ 7C, C4
        mov     eax, dword [ebp+8H]                     ; 3D65 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 3D68 _ 8B. 55, 10
        lea     ecx, [edx+4H]                           ; 3D6B _ 8D. 4A, 04
        mov     edx, dword [ebp+0CH]                    ; 3D6E _ 8B. 55, 0C
        mov     dword [eax+ecx*4+4H], edx               ; 3D71 _ 89. 54 88, 04
        jmp     ?_212                                   ; 3D75 _ EB, 6C

?_209:  mov     eax, dword [ebp+8H]                     ; 3D77 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 3D7A _ 8B. 40, 0C
        mov     dword [ebp-10H], eax                    ; 3D7D _ 89. 45, F0
        jmp     ?_211                                   ; 3D80 _ EB, 3A

?_210:  mov     eax, dword [ebp-10H]                    ; 3D82 _ 8B. 45, F0
        lea     ecx, [eax+1H]                           ; 3D85 _ 8D. 48, 01
        mov     eax, dword [ebp+8H]                     ; 3D88 _ 8B. 45, 08
        mov     edx, dword [ebp-10H]                    ; 3D8B _ 8B. 55, F0
        add     edx, 4                                  ; 3D8E _ 83. C2, 04
        mov     edx, dword [eax+edx*4+4H]               ; 3D91 _ 8B. 54 90, 04
        mov     eax, dword [ebp+8H]                     ; 3D95 _ 8B. 45, 08
        add     ecx, 4                                  ; 3D98 _ 83. C1, 04
        mov     dword [eax+ecx*4+4H], edx               ; 3D9B _ 89. 54 88, 04
        mov     eax, dword [ebp-10H]                    ; 3D9F _ 8B. 45, F0
        lea     edx, [eax+1H]                           ; 3DA2 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 3DA5 _ 8B. 45, 08
        add     edx, 4                                  ; 3DA8 _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 3DAB _ 8B. 44 90, 04
        mov     edx, dword [ebp-10H]                    ; 3DAF _ 8B. 55, F0
        add     edx, 1                                  ; 3DB2 _ 83. C2, 01
        mov     dword [eax+18H], edx                    ; 3DB5 _ 89. 50, 18
        sub     dword [ebp-10H], 1                      ; 3DB8 _ 83. 6D, F0, 01
?_211:  mov     eax, dword [ebp-10H]                    ; 3DBC _ 8B. 45, F0
        cmp     eax, dword [ebp+10H]                    ; 3DBF _ 3B. 45, 10
        jge     ?_210                                   ; 3DC2 _ 7D, BE
        mov     eax, dword [ebp+8H]                     ; 3DC4 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 3DC7 _ 8B. 55, 10
        lea     ecx, [edx+4H]                           ; 3DCA _ 8D. 4A, 04
        mov     edx, dword [ebp+0CH]                    ; 3DCD _ 8B. 55, 0C
        mov     dword [eax+ecx*4+4H], edx               ; 3DD0 _ 89. 54 88, 04
        mov     eax, dword [ebp+8H]                     ; 3DD4 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 3DD7 _ 8B. 40, 0C
        lea     edx, [eax+1H]                           ; 3DDA _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 3DDD _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 3DE0 _ 89. 50, 0C
?_212:  mov     eax, dword [ebp+0CH]                    ; 3DE3 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 3DE6 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 3DE9 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 3DEC _ 8B. 40, 08
        lea     esi, [edx+eax]                          ; 3DEF _ 8D. 34 02
        mov     eax, dword [ebp+0CH]                    ; 3DF2 _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 3DF5 _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 3DF8 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 3DFB _ 8B. 40, 04
        lea     ebx, [edx+eax]                          ; 3DFE _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 3E01 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 3E04 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 3E07 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 3E0A _ 8B. 40, 0C
        mov     ecx, dword [ebp+10H]                    ; 3E0D _ 8B. 4D, 10
        mov     dword [esp+14H], ecx                    ; 3E10 _ 89. 4C 24, 14
        mov     dword [esp+10H], esi                    ; 3E14 _ 89. 74 24, 10
        mov     dword [esp+0CH], ebx                    ; 3E18 _ 89. 5C 24, 0C
        mov     dword [esp+8H], edx                     ; 3E1C _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 3E20 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 3E24 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3E27 _ 89. 04 24
        call    sheet_refresh_map                       ; 3E2A _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+0CH]                    ; 3E2F _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 3E32 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 3E35 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 3E38 _ 8B. 40, 08
        lea     esi, [edx+eax]                          ; 3E3B _ 8D. 34 02
        mov     eax, dword [ebp+0CH]                    ; 3E3E _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 3E41 _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 3E44 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 3E47 _ 8B. 40, 04
        lea     ebx, [edx+eax]                          ; 3E4A _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 3E4D _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 3E50 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 3E53 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 3E56 _ 8B. 40, 0C
        mov     ecx, dword [ebp+10H]                    ; 3E59 _ 8B. 4D, 10
        mov     dword [esp+14H], ecx                    ; 3E5C _ 89. 4C 24, 14
        mov     dword [esp+10H], esi                    ; 3E60 _ 89. 74 24, 10
        mov     dword [esp+0CH], ebx                    ; 3E64 _ 89. 5C 24, 0C
        mov     dword [esp+8H], edx                     ; 3E68 _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 3E6C _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 3E70 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3E73 _ 89. 04 24
        call    sheet_refresh_local                     ; 3E76 _ E8, FFFFFFFC(rel)
?_213:  add     esp, 48                                 ; 3E7B _ 83. C4, 30
        pop     ebx                                     ; 3E7E _ 5B
        pop     esi                                     ; 3E7F _ 5E
        pop     ebp                                     ; 3E80 _ 5D
        ret                                             ; 3E81 _ C3
; sheet_updown End of function

sheet_refresh:; Function begin
        push    ebp                                     ; 3E82 _ 55
        mov     ebp, esp                                ; 3E83 _ 89. E5
        push    edi                                     ; 3E85 _ 57
        push    esi                                     ; 3E86 _ 56
        push    ebx                                     ; 3E87 _ 53
        sub     esp, 44                                 ; 3E88 _ 83. EC, 2C
        mov     eax, dword [ebp+0CH]                    ; 3E8B _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 3E8E _ 8B. 40, 18
        test    eax, eax                                ; 3E91 _ 85. C0
        js      ?_214                                   ; 3E93 _ 78, 53
        mov     eax, dword [ebp+0CH]                    ; 3E95 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 3E98 _ 8B. 40, 18
        mov     edx, dword [ebp+0CH]                    ; 3E9B _ 8B. 55, 0C
        mov     ecx, dword [edx+10H]                    ; 3E9E _ 8B. 4A, 10
        mov     edx, dword [ebp+1CH]                    ; 3EA1 _ 8B. 55, 1C
        lea     esi, [ecx+edx]                          ; 3EA4 _ 8D. 34 11
        mov     edx, dword [ebp+0CH]                    ; 3EA7 _ 8B. 55, 0C
        mov     ecx, dword [edx+0CH]                    ; 3EAA _ 8B. 4A, 0C
        mov     edx, dword [ebp+18H]                    ; 3EAD _ 8B. 55, 18
        lea     ebx, [ecx+edx]                          ; 3EB0 _ 8D. 1C 11
        mov     edx, dword [ebp+0CH]                    ; 3EB3 _ 8B. 55, 0C
        mov     ecx, dword [edx+10H]                    ; 3EB6 _ 8B. 4A, 10
        mov     edx, dword [ebp+14H]                    ; 3EB9 _ 8B. 55, 14
        add     ecx, edx                                ; 3EBC _ 01. D1
        mov     edx, dword [ebp+0CH]                    ; 3EBE _ 8B. 55, 0C
        mov     edi, dword [edx+0CH]                    ; 3EC1 _ 8B. 7A, 0C
        mov     edx, dword [ebp+10H]                    ; 3EC4 _ 8B. 55, 10
        add     edx, edi                                ; 3EC7 _ 01. FA
        mov     dword [esp+14H], eax                    ; 3EC9 _ 89. 44 24, 14
        mov     dword [esp+10H], esi                    ; 3ECD _ 89. 74 24, 10
        mov     dword [esp+0CH], ebx                    ; 3ED1 _ 89. 5C 24, 0C
        mov     dword [esp+8H], ecx                     ; 3ED5 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 3ED9 _ 89. 54 24, 04
        mov     eax, dword [ebp+8H]                     ; 3EDD _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3EE0 _ 89. 04 24
        call    sheet_refresh_local                     ; 3EE3 _ E8, FFFFFFFC(rel)
?_214:  mov     eax, 0                                  ; 3EE8 _ B8, 00000000
        add     esp, 44                                 ; 3EED _ 83. C4, 2C
        pop     ebx                                     ; 3EF0 _ 5B
        pop     esi                                     ; 3EF1 _ 5E
        pop     edi                                     ; 3EF2 _ 5F
        pop     ebp                                     ; 3EF3 _ 5D
        ret                                             ; 3EF4 _ C3
; sheet_refresh End of function

sheet_slide:; Function begin
        push    ebp                                     ; 3EF5 _ 55
        mov     ebp, esp                                ; 3EF6 _ 89. E5
        push    ebx                                     ; 3EF8 _ 53
        sub     esp, 52                                 ; 3EF9 _ 83. EC, 34
        mov     eax, dword [ebp+0CH]                    ; 3EFC _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 3EFF _ 8B. 40, 0C
        mov     dword [ebp-10H], eax                    ; 3F02 _ 89. 45, F0
        mov     eax, dword [ebp+0CH]                    ; 3F05 _ 8B. 45, 0C
        mov     eax, dword [eax+10H]                    ; 3F08 _ 8B. 40, 10
        mov     dword [ebp-0CH], eax                    ; 3F0B _ 89. 45, F4
        mov     eax, dword [ebp+0CH]                    ; 3F0E _ 8B. 45, 0C
        mov     edx, dword [ebp+10H]                    ; 3F11 _ 8B. 55, 10
        mov     dword [eax+0CH], edx                    ; 3F14 _ 89. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 3F17 _ 8B. 45, 0C
        mov     edx, dword [ebp+14H]                    ; 3F1A _ 8B. 55, 14
        mov     dword [eax+10H], edx                    ; 3F1D _ 89. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 3F20 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 3F23 _ 8B. 40, 18
        test    eax, eax                                ; 3F26 _ 85. C0
        js      ?_215                                   ; 3F28 _ 0F 88, 00000100
        mov     eax, dword [ebp+0CH]                    ; 3F2E _ 8B. 45, 0C
        mov     edx, dword [eax+8H]                     ; 3F31 _ 8B. 50, 08
        mov     eax, dword [ebp-0CH]                    ; 3F34 _ 8B. 45, F4
        add     edx, eax                                ; 3F37 _ 01. C2
        mov     eax, dword [ebp+0CH]                    ; 3F39 _ 8B. 45, 0C
        mov     ecx, dword [eax+4H]                     ; 3F3C _ 8B. 48, 04
        mov     eax, dword [ebp-10H]                    ; 3F3F _ 8B. 45, F0
        add     eax, ecx                                ; 3F42 _ 01. C8
        mov     dword [esp+14H], 0                      ; 3F44 _ C7. 44 24, 14, 00000000
        mov     dword [esp+10H], edx                    ; 3F4C _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 3F50 _ 89. 44 24, 0C
        mov     eax, dword [ebp-0CH]                    ; 3F54 _ 8B. 45, F4
        mov     dword [esp+8H], eax                     ; 3F57 _ 89. 44 24, 08
        mov     eax, dword [ebp-10H]                    ; 3F5B _ 8B. 45, F0
        mov     dword [esp+4H], eax                     ; 3F5E _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 3F62 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3F65 _ 89. 04 24
        call    sheet_refresh_map                       ; 3F68 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+0CH]                    ; 3F6D _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 3F70 _ 8B. 40, 18
        mov     edx, dword [ebp+0CH]                    ; 3F73 _ 8B. 55, 0C
        mov     ecx, dword [edx+8H]                     ; 3F76 _ 8B. 4A, 08
        mov     edx, dword [ebp+14H]                    ; 3F79 _ 8B. 55, 14
        add     ecx, edx                                ; 3F7C _ 01. D1
        mov     edx, dword [ebp+0CH]                    ; 3F7E _ 8B. 55, 0C
        mov     ebx, dword [edx+4H]                     ; 3F81 _ 8B. 5A, 04
        mov     edx, dword [ebp+10H]                    ; 3F84 _ 8B. 55, 10
        add     edx, ebx                                ; 3F87 _ 01. DA
        mov     dword [esp+14H], eax                    ; 3F89 _ 89. 44 24, 14
        mov     dword [esp+10H], ecx                    ; 3F8D _ 89. 4C 24, 10
        mov     dword [esp+0CH], edx                    ; 3F91 _ 89. 54 24, 0C
        mov     eax, dword [ebp+14H]                    ; 3F95 _ 8B. 45, 14
        mov     dword [esp+8H], eax                     ; 3F98 _ 89. 44 24, 08
        mov     eax, dword [ebp+10H]                    ; 3F9C _ 8B. 45, 10
        mov     dword [esp+4H], eax                     ; 3F9F _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 3FA3 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3FA6 _ 89. 04 24
        call    sheet_refresh_map                       ; 3FA9 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+0CH]                    ; 3FAE _ 8B. 45, 0C
        mov     edx, dword [eax+8H]                     ; 3FB1 _ 8B. 50, 08
        mov     eax, dword [ebp-0CH]                    ; 3FB4 _ 8B. 45, F4
        add     edx, eax                                ; 3FB7 _ 01. C2
        mov     eax, dword [ebp+0CH]                    ; 3FB9 _ 8B. 45, 0C
        mov     ecx, dword [eax+4H]                     ; 3FBC _ 8B. 48, 04
        mov     eax, dword [ebp-10H]                    ; 3FBF _ 8B. 45, F0
        add     eax, ecx                                ; 3FC2 _ 01. C8
        mov     dword [esp+14H], 0                      ; 3FC4 _ C7. 44 24, 14, 00000000
        mov     dword [esp+10H], edx                    ; 3FCC _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 3FD0 _ 89. 44 24, 0C
        mov     eax, dword [ebp-0CH]                    ; 3FD4 _ 8B. 45, F4
        mov     dword [esp+8H], eax                     ; 3FD7 _ 89. 44 24, 08
        mov     eax, dword [ebp-10H]                    ; 3FDB _ 8B. 45, F0
        mov     dword [esp+4H], eax                     ; 3FDE _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 3FE2 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3FE5 _ 89. 04 24
        call    sheet_refresh_local                     ; 3FE8 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+0CH]                    ; 3FED _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 3FF0 _ 8B. 40, 18
        mov     edx, dword [ebp+0CH]                    ; 3FF3 _ 8B. 55, 0C
        mov     ecx, dword [edx+8H]                     ; 3FF6 _ 8B. 4A, 08
        mov     edx, dword [ebp+14H]                    ; 3FF9 _ 8B. 55, 14
        add     ecx, edx                                ; 3FFC _ 01. D1
        mov     edx, dword [ebp+0CH]                    ; 3FFE _ 8B. 55, 0C
        mov     ebx, dword [edx+4H]                     ; 4001 _ 8B. 5A, 04
        mov     edx, dword [ebp+10H]                    ; 4004 _ 8B. 55, 10
        add     edx, ebx                                ; 4007 _ 01. DA
        mov     dword [esp+14H], eax                    ; 4009 _ 89. 44 24, 14
        mov     dword [esp+10H], ecx                    ; 400D _ 89. 4C 24, 10
        mov     dword [esp+0CH], edx                    ; 4011 _ 89. 54 24, 0C
        mov     eax, dword [ebp+14H]                    ; 4015 _ 8B. 45, 14
        mov     dword [esp+8H], eax                     ; 4018 _ 89. 44 24, 08
        mov     eax, dword [ebp+10H]                    ; 401C _ 8B. 45, 10
        mov     dword [esp+4H], eax                     ; 401F _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 4023 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 4026 _ 89. 04 24
        call    sheet_refresh_local                     ; 4029 _ E8, FFFFFFFC(rel)
?_215:  add     esp, 52                                 ; 402E _ 83. C4, 34
        pop     ebx                                     ; 4031 _ 5B
        pop     ebp                                     ; 4032 _ 5D
        ret                                             ; 4033 _ C3
; sheet_slide End of function

sheet_refresh_local:; Function begin
        push    ebp                                     ; 4034 _ 55
        mov     ebp, esp                                ; 4035 _ 89. E5
        sub     esp, 48                                 ; 4037 _ 83. EC, 30
        mov     eax, dword [ebp+8H]                     ; 403A _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 403D _ 8B. 00
        mov     dword [ebp-18H], eax                    ; 403F _ 89. 45, E8
        mov     eax, dword [ebp+8H]                     ; 4042 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 4045 _ 8B. 40, 10
        mov     dword [ebp-14H], eax                    ; 4048 _ 89. 45, EC
        cmp     dword [ebp+0CH], 0                      ; 404B _ 83. 7D, 0C, 00
        jns     ?_216                                   ; 404F _ 79, 07
        mov     dword [ebp+0CH], 0                      ; 4051 _ C7. 45, 0C, 00000000
?_216:  cmp     dword [ebp+10H], 0                      ; 4058 _ 83. 7D, 10, 00
        jns     ?_217                                   ; 405C _ 79, 07
        mov     dword [ebp+10H], 0                      ; 405E _ C7. 45, 10, 00000000
?_217:  mov     eax, dword [ebp+8H]                     ; 4065 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 4068 _ 8B. 40, 04
        cmp     eax, dword [ebp+14H]                    ; 406B _ 3B. 45, 14
        jge     ?_218                                   ; 406E _ 7D, 09
        mov     eax, dword [ebp+8H]                     ; 4070 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 4073 _ 8B. 40, 04
        mov     dword [ebp+14H], eax                    ; 4076 _ 89. 45, 14
?_218:  mov     eax, dword [ebp+8H]                     ; 4079 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 407C _ 8B. 40, 08
        cmp     eax, dword [ebp+18H]                    ; 407F _ 3B. 45, 18
        jge     ?_219                                   ; 4082 _ 7D, 09
        mov     eax, dword [ebp+8H]                     ; 4084 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 4087 _ 8B. 40, 08
        mov     dword [ebp+18H], eax                    ; 408A _ 89. 45, 18
?_219:  mov     eax, dword [ebp+1CH]                    ; 408D _ 8B. 45, 1C
        mov     dword [ebp-24H], eax                    ; 4090 _ 89. 45, DC
        jmp     ?_226                                   ; 4093 _ E9, 00000119

?_220:  mov     eax, dword [ebp+8H]                     ; 4098 _ 8B. 45, 08
        mov     edx, dword [ebp-24H]                    ; 409B _ 8B. 55, DC
        add     edx, 4                                  ; 409E _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 40A1 _ 8B. 44 90, 04
        mov     dword [ebp-10H], eax                    ; 40A5 _ 89. 45, F0
        mov     eax, dword [ebp-10H]                    ; 40A8 _ 8B. 45, F0
        mov     eax, dword [eax]                        ; 40AB _ 8B. 00
        mov     dword [ebp-0CH], eax                    ; 40AD _ 89. 45, F4
        mov     edx, dword [ebp-10H]                    ; 40B0 _ 8B. 55, F0
        mov     eax, dword [ebp+8H]                     ; 40B3 _ 8B. 45, 08
        add     eax, 1044                               ; 40B6 _ 05, 00000414
        sub     edx, eax                                ; 40BB _ 29. C2
        mov     eax, edx                                ; 40BD _ 89. D0
        sar     eax, 5                                  ; 40BF _ C1. F8, 05
        mov     byte [ebp-26H], al                      ; 40C2 _ 88. 45, DA
        mov     dword [ebp-1CH], 0                      ; 40C5 _ C7. 45, E4, 00000000
        jmp     ?_225                                   ; 40CC _ E9, 000000CD

?_221:  mov     eax, dword [ebp-10H]                    ; 40D1 _ 8B. 45, F0
        mov     edx, dword [eax+10H]                    ; 40D4 _ 8B. 50, 10
        mov     eax, dword [ebp-1CH]                    ; 40D7 _ 8B. 45, E4
        add     eax, edx                                ; 40DA _ 01. D0
        mov     dword [ebp-8H], eax                     ; 40DC _ 89. 45, F8
        mov     dword [ebp-20H], 0                      ; 40DF _ C7. 45, E0, 00000000
        jmp     ?_224                                   ; 40E6 _ E9, 000000A0

?_222:  mov     eax, dword [ebp-10H]                    ; 40EB _ 8B. 45, F0
        mov     edx, dword [eax+0CH]                    ; 40EE _ 8B. 50, 0C
        mov     eax, dword [ebp-20H]                    ; 40F1 _ 8B. 45, E0
        add     eax, edx                                ; 40F4 _ 01. D0
        mov     dword [ebp-4H], eax                     ; 40F6 _ 89. 45, FC
        mov     eax, dword [ebp+0CH]                    ; 40F9 _ 8B. 45, 0C
        cmp     eax, dword [ebp-4H]                     ; 40FC _ 3B. 45, FC
        jg      ?_223                                   ; 40FF _ 0F 8F, 00000082
        mov     eax, dword [ebp-4H]                     ; 4105 _ 8B. 45, FC
        cmp     eax, dword [ebp+14H]                    ; 4108 _ 3B. 45, 14
        jge     ?_223                                   ; 410B _ 7D, 7A
        mov     eax, dword [ebp+10H]                    ; 410D _ 8B. 45, 10
        cmp     eax, dword [ebp-8H]                     ; 4110 _ 3B. 45, F8
        jg      ?_223                                   ; 4113 _ 7F, 72
        mov     eax, dword [ebp-8H]                     ; 4115 _ 8B. 45, F8
        cmp     eax, dword [ebp+18H]                    ; 4118 _ 3B. 45, 18
        jge     ?_223                                   ; 411B _ 7D, 6A
        mov     eax, dword [ebp-10H]                    ; 411D _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 4120 _ 8B. 40, 04
        imul    eax, dword [ebp-1CH]                    ; 4123 _ 0F AF. 45, E4
        mov     edx, eax                                ; 4127 _ 89. C2
        mov     eax, dword [ebp-20H]                    ; 4129 _ 8B. 45, E0
        add     eax, edx                                ; 412C _ 01. D0
        mov     edx, eax                                ; 412E _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 4130 _ 8B. 45, F4
        add     eax, edx                                ; 4133 _ 01. D0
        movzx   eax, byte [eax]                         ; 4135 _ 0F B6. 00
        mov     byte [ebp-25H], al                      ; 4138 _ 88. 45, DB
        movzx   edx, byte [ebp-25H]                     ; 413B _ 0F B6. 55, DB
        mov     eax, dword [ebp-10H]                    ; 413F _ 8B. 45, F0
        mov     eax, dword [eax+14H]                    ; 4142 _ 8B. 40, 14
        cmp     edx, eax                                ; 4145 _ 39. C2
        jz      ?_223                                   ; 4147 _ 74, 3E
        mov     eax, dword [ebp+8H]                     ; 4149 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 414C _ 8B. 40, 04
        imul    eax, dword [ebp-8H]                     ; 414F _ 0F AF. 45, F8
        mov     edx, eax                                ; 4153 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 4155 _ 8B. 45, FC
        add     eax, edx                                ; 4158 _ 01. D0
        mov     edx, eax                                ; 415A _ 89. C2
        mov     eax, dword [ebp-14H]                    ; 415C _ 8B. 45, EC
        add     eax, edx                                ; 415F _ 01. D0
        movzx   eax, byte [eax]                         ; 4161 _ 0F B6. 00
        cmp     al, byte [ebp-26H]                      ; 4164 _ 3A. 45, DA
        jnz     ?_223                                   ; 4167 _ 75, 1E
        mov     eax, dword [ebp+8H]                     ; 4169 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 416C _ 8B. 40, 04
        imul    eax, dword [ebp-8H]                     ; 416F _ 0F AF. 45, F8
        mov     edx, eax                                ; 4173 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 4175 _ 8B. 45, FC
        add     eax, edx                                ; 4178 _ 01. D0
        mov     edx, eax                                ; 417A _ 89. C2
        mov     eax, dword [ebp-18H]                    ; 417C _ 8B. 45, E8
        add     edx, eax                                ; 417F _ 01. C2
        movzx   eax, byte [ebp-25H]                     ; 4181 _ 0F B6. 45, DB
        mov     byte [edx], al                          ; 4185 _ 88. 02
?_223:  add     dword [ebp-20H], 1                      ; 4187 _ 83. 45, E0, 01
?_224:  mov     eax, dword [ebp-10H]                    ; 418B _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 418E _ 8B. 40, 04
        cmp     eax, dword [ebp-20H]                    ; 4191 _ 3B. 45, E0
        jg      ?_222                                   ; 4194 _ 0F 8F, FFFFFF51
        add     dword [ebp-1CH], 1                      ; 419A _ 83. 45, E4, 01
?_225:  mov     eax, dword [ebp-10H]                    ; 419E _ 8B. 45, F0
        mov     eax, dword [eax+8H]                     ; 41A1 _ 8B. 40, 08
        cmp     eax, dword [ebp-1CH]                    ; 41A4 _ 3B. 45, E4
        jg      ?_221                                   ; 41A7 _ 0F 8F, FFFFFF24
        add     dword [ebp-24H], 1                      ; 41AD _ 83. 45, DC, 01
?_226:  mov     eax, dword [ebp+8H]                     ; 41B1 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 41B4 _ 8B. 40, 0C
        cmp     eax, dword [ebp-24H]                    ; 41B7 _ 3B. 45, DC
        jge     ?_220                                   ; 41BA _ 0F 8D, FFFFFED8
        leave                                           ; 41C0 _ C9
        ret                                             ; 41C1 _ C3
; sheet_refresh_local End of function

sheet_refresh_map:; Function begin
        push    ebp                                     ; 41C2 _ 55
        mov     ebp, esp                                ; 41C3 _ 89. E5
        sub     esp, 64                                 ; 41C5 _ 83. EC, 40
        mov     eax, dword [ebp+8H]                     ; 41C8 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 41CB _ 8B. 00
        mov     dword [ebp-18H], eax                    ; 41CD _ 89. 45, E8
        mov     eax, dword [ebp+8H]                     ; 41D0 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 41D3 _ 8B. 40, 10
        mov     dword [ebp-14H], eax                    ; 41D6 _ 89. 45, EC
        cmp     dword [ebp+0CH], 0                      ; 41D9 _ 83. 7D, 0C, 00
        jns     ?_227                                   ; 41DD _ 79, 07
        mov     dword [ebp+0CH], 0                      ; 41DF _ C7. 45, 0C, 00000000
?_227:  cmp     dword [ebp+10H], 0                      ; 41E6 _ 83. 7D, 10, 00
        jns     ?_228                                   ; 41EA _ 79, 07
        mov     dword [ebp+10H], 0                      ; 41EC _ C7. 45, 10, 00000000
?_228:  mov     eax, dword [ebp+8H]                     ; 41F3 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 41F6 _ 8B. 40, 04
        cmp     eax, dword [ebp+14H]                    ; 41F9 _ 3B. 45, 14
        jge     ?_229                                   ; 41FC _ 7D, 09
        mov     eax, dword [ebp+8H]                     ; 41FE _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 4201 _ 8B. 40, 04
        mov     dword [ebp+14H], eax                    ; 4204 _ 89. 45, 14
?_229:  mov     eax, dword [ebp+8H]                     ; 4207 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 420A _ 8B. 40, 08
        cmp     eax, dword [ebp+18H]                    ; 420D _ 3B. 45, 18
        jge     ?_230                                   ; 4210 _ 7D, 09
        mov     eax, dword [ebp+8H]                     ; 4212 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 4215 _ 8B. 40, 08
        mov     dword [ebp+18H], eax                    ; 4218 _ 89. 45, 18
?_230:  mov     eax, dword [ebp+1CH]                    ; 421B _ 8B. 45, 1C
        mov     dword [ebp-34H], eax                    ; 421E _ 89. 45, CC
        jmp     ?_241                                   ; 4221 _ E9, 00000141

?_231:  mov     eax, dword [ebp+8H]                     ; 4226 _ 8B. 45, 08
        mov     edx, dword [ebp-34H]                    ; 4229 _ 8B. 55, CC
        add     edx, 4                                  ; 422C _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 422F _ 8B. 44 90, 04
        mov     dword [ebp-10H], eax                    ; 4233 _ 89. 45, F0
        mov     edx, dword [ebp-10H]                    ; 4236 _ 8B. 55, F0
        mov     eax, dword [ebp+8H]                     ; 4239 _ 8B. 45, 08
        add     eax, 1044                               ; 423C _ 05, 00000414
        sub     edx, eax                                ; 4241 _ 29. C2
        mov     eax, edx                                ; 4243 _ 89. D0
        sar     eax, 5                                  ; 4245 _ C1. F8, 05
        mov     byte [ebp-35H], al                      ; 4248 _ 88. 45, CB
        mov     eax, dword [ebp-10H]                    ; 424B _ 8B. 45, F0
        mov     eax, dword [eax]                        ; 424E _ 8B. 00
        mov     dword [ebp-0CH], eax                    ; 4250 _ 89. 45, F4
        mov     eax, dword [ebp-10H]                    ; 4253 _ 8B. 45, F0
        mov     eax, dword [eax+0CH]                    ; 4256 _ 8B. 40, 0C
        mov     edx, dword [ebp+0CH]                    ; 4259 _ 8B. 55, 0C
        sub     edx, eax                                ; 425C _ 29. C2
        mov     eax, edx                                ; 425E _ 89. D0
        mov     dword [ebp-30H], eax                    ; 4260 _ 89. 45, D0
        mov     eax, dword [ebp-10H]                    ; 4263 _ 8B. 45, F0
        mov     eax, dword [eax+10H]                    ; 4266 _ 8B. 40, 10
        mov     edx, dword [ebp+10H]                    ; 4269 _ 8B. 55, 10
        sub     edx, eax                                ; 426C _ 29. C2
        mov     eax, edx                                ; 426E _ 89. D0
        mov     dword [ebp-2CH], eax                    ; 4270 _ 89. 45, D4
        mov     eax, dword [ebp-10H]                    ; 4273 _ 8B. 45, F0
        mov     eax, dword [eax+0CH]                    ; 4276 _ 8B. 40, 0C
        mov     edx, dword [ebp+14H]                    ; 4279 _ 8B. 55, 14
        sub     edx, eax                                ; 427C _ 29. C2
        mov     eax, edx                                ; 427E _ 89. D0
        mov     dword [ebp-28H], eax                    ; 4280 _ 89. 45, D8
        mov     eax, dword [ebp-10H]                    ; 4283 _ 8B. 45, F0
        mov     eax, dword [eax+10H]                    ; 4286 _ 8B. 40, 10
        mov     edx, dword [ebp+18H]                    ; 4289 _ 8B. 55, 18
        sub     edx, eax                                ; 428C _ 29. C2
        mov     eax, edx                                ; 428E _ 89. D0
        mov     dword [ebp-24H], eax                    ; 4290 _ 89. 45, DC
        cmp     dword [ebp-30H], 0                      ; 4293 _ 83. 7D, D0, 00
        jns     ?_232                                   ; 4297 _ 79, 07
        mov     dword [ebp-30H], 0                      ; 4299 _ C7. 45, D0, 00000000
?_232:  cmp     dword [ebp-2CH], 0                      ; 42A0 _ 83. 7D, D4, 00
        jns     ?_233                                   ; 42A4 _ 79, 07
        mov     dword [ebp-2CH], 0                      ; 42A6 _ C7. 45, D4, 00000000
?_233:  mov     eax, dword [ebp-10H]                    ; 42AD _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 42B0 _ 8B. 40, 04
        cmp     eax, dword [ebp-28H]                    ; 42B3 _ 3B. 45, D8
        jge     ?_234                                   ; 42B6 _ 7D, 09
        mov     eax, dword [ebp-10H]                    ; 42B8 _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 42BB _ 8B. 40, 04
        mov     dword [ebp-28H], eax                    ; 42BE _ 89. 45, D8
?_234:  mov     eax, dword [ebp-10H]                    ; 42C1 _ 8B. 45, F0
        mov     eax, dword [eax+8H]                     ; 42C4 _ 8B. 40, 08
        cmp     eax, dword [ebp-24H]                    ; 42C7 _ 3B. 45, DC
        jge     ?_235                                   ; 42CA _ 7D, 09
        mov     eax, dword [ebp-10H]                    ; 42CC _ 8B. 45, F0
        mov     eax, dword [eax+8H]                     ; 42CF _ 8B. 40, 08
        mov     dword [ebp-24H], eax                    ; 42D2 _ 89. 45, DC
?_235:  mov     eax, dword [ebp-2CH]                    ; 42D5 _ 8B. 45, D4
        mov     dword [ebp-1CH], eax                    ; 42D8 _ 89. 45, E4
        jmp     ?_240                                   ; 42DB _ EB, 7A

?_236:  mov     eax, dword [ebp-10H]                    ; 42DD _ 8B. 45, F0
        mov     edx, dword [eax+10H]                    ; 42E0 _ 8B. 50, 10
        mov     eax, dword [ebp-1CH]                    ; 42E3 _ 8B. 45, E4
        add     eax, edx                                ; 42E6 _ 01. D0
        mov     dword [ebp-8H], eax                     ; 42E8 _ 89. 45, F8
        mov     eax, dword [ebp-30H]                    ; 42EB _ 8B. 45, D0
        mov     dword [ebp-20H], eax                    ; 42EE _ 89. 45, E0
        jmp     ?_239                                   ; 42F1 _ EB, 58

?_237:  mov     eax, dword [ebp-10H]                    ; 42F3 _ 8B. 45, F0
        mov     edx, dword [eax+0CH]                    ; 42F6 _ 8B. 50, 0C
        mov     eax, dword [ebp-20H]                    ; 42F9 _ 8B. 45, E0
        add     eax, edx                                ; 42FC _ 01. D0
        mov     dword [ebp-4H], eax                     ; 42FE _ 89. 45, FC
        mov     eax, dword [ebp-10H]                    ; 4301 _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 4304 _ 8B. 40, 04
        imul    eax, dword [ebp-1CH]                    ; 4307 _ 0F AF. 45, E4
        mov     edx, eax                                ; 430B _ 89. C2
        mov     eax, dword [ebp-20H]                    ; 430D _ 8B. 45, E0
        add     eax, edx                                ; 4310 _ 01. D0
        mov     edx, eax                                ; 4312 _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 4314 _ 8B. 45, F4
        add     eax, edx                                ; 4317 _ 01. D0
        movzx   eax, byte [eax]                         ; 4319 _ 0F B6. 00
        movzx   edx, al                                 ; 431C _ 0F B6. D0
        mov     eax, dword [ebp-10H]                    ; 431F _ 8B. 45, F0
        mov     eax, dword [eax+14H]                    ; 4322 _ 8B. 40, 14
        cmp     edx, eax                                ; 4325 _ 39. C2
        jz      ?_238                                   ; 4327 _ 74, 1E
        mov     eax, dword [ebp+8H]                     ; 4329 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 432C _ 8B. 40, 04
        imul    eax, dword [ebp-8H]                     ; 432F _ 0F AF. 45, F8
        mov     edx, eax                                ; 4333 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 4335 _ 8B. 45, FC
        add     eax, edx                                ; 4338 _ 01. D0
        mov     edx, eax                                ; 433A _ 89. C2
        mov     eax, dword [ebp-14H]                    ; 433C _ 8B. 45, EC
        add     edx, eax                                ; 433F _ 01. C2
        movzx   eax, byte [ebp-35H]                     ; 4341 _ 0F B6. 45, CB
        mov     byte [edx], al                          ; 4345 _ 88. 02
?_238:  add     dword [ebp-20H], 1                      ; 4347 _ 83. 45, E0, 01
?_239:  mov     eax, dword [ebp-20H]                    ; 434B _ 8B. 45, E0
        cmp     eax, dword [ebp-28H]                    ; 434E _ 3B. 45, D8
        jl      ?_237                                   ; 4351 _ 7C, A0
        add     dword [ebp-1CH], 1                      ; 4353 _ 83. 45, E4, 01
?_240:  mov     eax, dword [ebp-1CH]                    ; 4357 _ 8B. 45, E4
        cmp     eax, dword [ebp-24H]                    ; 435A _ 3B. 45, DC
        jl      ?_236                                   ; 435D _ 0F 8C, FFFFFF7A
        add     dword [ebp-34H], 1                      ; 4363 _ 83. 45, CC, 01
?_241:  mov     eax, dword [ebp+8H]                     ; 4367 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 436A _ 8B. 40, 0C
        cmp     eax, dword [ebp-34H]                    ; 436D _ 3B. 45, CC
        jge     ?_231                                   ; 4370 _ 0F 8D, FFFFFEB0
        leave                                           ; 4376 _ C9
        ret                                             ; 4377 _ C3
; sheet_refresh_map End of function

init_time_port:; Function begin
        push    ebp                                     ; 4378 _ 55
        mov     ebp, esp                                ; 4379 _ 89. E5
        sub     esp, 40                                 ; 437B _ 83. EC, 28
        mov     dword [esp+4H], 52                      ; 437E _ C7. 44 24, 04, 00000034
        mov     dword [esp], 67                         ; 4386 _ C7. 04 24, 00000043
        call    io_out8                                 ; 438D _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 156                     ; 4392 _ C7. 44 24, 04, 0000009C
        mov     dword [esp], 64                         ; 439A _ C7. 04 24, 00000040
        call    io_out8                                 ; 43A1 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 46                      ; 43A6 _ C7. 44 24, 04, 0000002E
        mov     dword [esp], 64                         ; 43AE _ C7. 04 24, 00000040
        call    io_out8                                 ; 43B5 _ E8, FFFFFFFC(rel)
        mov     dword [timer_control], 0                ; 43BA _ C7. 05, 00000300(d), 00000000
        mov     dword [ebp-0CH], 0                      ; 43C4 _ C7. 45, F4, 00000000
        jmp     ?_243                                   ; 43CB _ EB, 28

?_242:  mov     eax, dword [ebp-0CH]                    ; 43CD _ 8B. 45, F4
        shl     eax, 4                                  ; 43D0 _ C1. E0, 04
        add     eax, timer_control                      ; 43D3 _ 05, 00000300(d)
        mov     dword [eax+8H], 0                       ; 43D8 _ C7. 40, 08, 00000000
        mov     eax, dword [ebp-0CH]                    ; 43DF _ 8B. 45, F4
        shl     eax, 4                                  ; 43E2 _ C1. E0, 04
        add     eax, timer_control                      ; 43E5 _ 05, 00000300(d)
        mov     dword [eax+0CH], 0                      ; 43EA _ C7. 40, 0C, 00000000
        add     dword [ebp-0CH], 1                      ; 43F1 _ 83. 45, F4, 01
?_243:  cmp     dword [ebp-0CH], 499                    ; 43F5 _ 81. 7D, F4, 000001F3
        jle     ?_242                                   ; 43FC _ 7E, CF
        leave                                           ; 43FE _ C9
        ret                                             ; 43FF _ C3
; init_time_port End of function

get_timer_control:; Function begin
        push    ebp                                     ; 4400 _ 55
        mov     ebp, esp                                ; 4401 _ 89. E5
        mov     eax, timer_control                      ; 4403 _ B8, 00000300(d)
        pop     ebp                                     ; 4408 _ 5D
        ret                                             ; 4409 _ C3
; get_timer_control End of function

timer_alloc:; Function begin
        push    ebp                                     ; 440A _ 55
        mov     ebp, esp                                ; 440B _ 89. E5
        sub     esp, 16                                 ; 440D _ 83. EC, 10
        mov     dword [ebp-4H], 0                       ; 4410 _ C7. 45, FC, 00000000
        jmp     ?_246                                   ; 4417 _ EB, 26

?_244:  mov     eax, dword [ebp-4H]                     ; 4419 _ 8B. 45, FC
        shl     eax, 4                                  ; 441C _ C1. E0, 04
        add     eax, timer_control                      ; 441F _ 05, 00000300(d)
        mov     eax, dword [eax+8H]                     ; 4424 _ 8B. 40, 08
        test    eax, eax                                ; 4427 _ 85. C0
        jnz     ?_245                                   ; 4429 _ 75, 10
        mov     eax, dword [ebp-4H]                     ; 442B _ 8B. 45, FC
        shl     eax, 4                                  ; 442E _ C1. E0, 04
        add     eax, timer_control                      ; 4431 _ 05, 00000300(d)
        add     eax, 4                                  ; 4436 _ 83. C0, 04
        jmp     ?_247                                   ; 4439 _ EB, 0D

?_245:  add     dword [ebp-4H], 1                       ; 443B _ 83. 45, FC, 01
?_246:  cmp     dword [ebp-4H], 499                     ; 443F _ 81. 7D, FC, 000001F3
        jle     ?_244                                   ; 4446 _ 7E, D1
?_247:  leave                                           ; 4448 _ C9
        ret                                             ; 4449 _ C3
; timer_alloc End of function

timer_free:; Function begin
        push    ebp                                     ; 444A _ 55
        mov     ebp, esp                                ; 444B _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 444D _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 4450 _ C7. 40, 04, 00000000
        pop     ebp                                     ; 4457 _ 5D
        ret                                             ; 4458 _ C3
; timer_free End of function

timer_init:; Function begin
        push    ebp                                     ; 4459 _ 55
        mov     ebp, esp                                ; 445A _ 89. E5
        sub     esp, 4                                  ; 445C _ 83. EC, 04
        mov     eax, dword [ebp+10H]                    ; 445F _ 8B. 45, 10
        mov     byte [ebp-4H], al                       ; 4462 _ 88. 45, FC
        mov     eax, dword [ebp+8H]                     ; 4465 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 4468 _ 8B. 55, 0C
        mov     dword [eax+8H], edx                     ; 446B _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 446E _ 8B. 45, 08
        movzx   edx, byte [ebp-4H]                      ; 4471 _ 0F B6. 55, FC
        mov     byte [eax+0CH], dl                      ; 4475 _ 88. 50, 0C
        leave                                           ; 4478 _ C9
        ret                                             ; 4479 _ C3
; timer_init End of function

timer_settime:; Function begin
        push    ebp                                     ; 447A _ 55
        mov     ebp, esp                                ; 447B _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 447D _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 4480 _ 8B. 55, 0C
        mov     dword [eax], edx                        ; 4483 _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 4485 _ 8B. 45, 08
        mov     dword [eax+4H], 2                       ; 4488 _ C7. 40, 04, 00000002
        pop     ebp                                     ; 448F _ 5D
        ret                                             ; 4490 _ C3
; timer_settime End of function

intHandlerTimer:; Function begin
        push    ebp                                     ; 4491 _ 55
        mov     ebp, esp                                ; 4492 _ 89. E5
        sub     esp, 40                                 ; 4494 _ 83. EC, 28
        mov     dword [esp+4H], 32                      ; 4497 _ C7. 44 24, 04, 00000020
        mov     dword [esp], 32                         ; 449F _ C7. 04 24, 00000020
        call    io_out8                                 ; 44A6 _ E8, FFFFFFFC(rel)
        mov     eax, dword [timer_control]              ; 44AB _ A1, 00000300(d)
        add     eax, 1                                  ; 44B0 _ 83. C0, 01
        mov     dword [timer_control], eax              ; 44B3 _ A3, 00000300(d)
        mov     byte [ebp-0DH], 0                       ; 44B8 _ C6. 45, F3, 00
        mov     dword [ebp-0CH], 0                      ; 44BC _ C7. 45, F4, 00000000
        jmp     ?_251                                   ; 44C3 _ E9, 000000B0

?_248:  mov     eax, dword [ebp-0CH]                    ; 44C8 _ 8B. 45, F4
        shl     eax, 4                                  ; 44CB _ C1. E0, 04
        add     eax, timer_control                      ; 44CE _ 05, 00000300(d)
        mov     eax, dword [eax+8H]                     ; 44D3 _ 8B. 40, 08
        cmp     eax, 2                                  ; 44D6 _ 83. F8, 02
        jne     ?_249                                   ; 44D9 _ 0F 85, 0000008A
        mov     eax, dword [ebp-0CH]                    ; 44DF _ 8B. 45, F4
        shl     eax, 4                                  ; 44E2 _ C1. E0, 04
        add     eax, timer_control                      ; 44E5 _ 05, 00000300(d)
        mov     eax, dword [eax+4H]                     ; 44EA _ 8B. 40, 04
        lea     edx, [eax-1H]                           ; 44ED _ 8D. 50, FF
        mov     eax, dword [ebp-0CH]                    ; 44F0 _ 8B. 45, F4
        shl     eax, 4                                  ; 44F3 _ C1. E0, 04
        add     eax, timer_control                      ; 44F6 _ 05, 00000300(d)
        mov     dword [eax+4H], edx                     ; 44FB _ 89. 50, 04
        mov     eax, dword [ebp-0CH]                    ; 44FE _ 8B. 45, F4
        shl     eax, 4                                  ; 4501 _ C1. E0, 04
        add     eax, timer_control                      ; 4504 _ 05, 00000300(d)
        mov     eax, dword [eax+4H]                     ; 4509 _ 8B. 40, 04
        test    eax, eax                                ; 450C _ 85. C0
        jnz     ?_249                                   ; 450E _ 75, 59
        mov     eax, dword [ebp-0CH]                    ; 4510 _ 8B. 45, F4
        shl     eax, 4                                  ; 4513 _ C1. E0, 04
        add     eax, timer_control                      ; 4516 _ 05, 00000300(d)
        mov     dword [eax+8H], 1                       ; 451B _ C7. 40, 08, 00000001
        mov     eax, dword [ebp-0CH]                    ; 4522 _ 8B. 45, F4
        shl     eax, 4                                  ; 4525 _ C1. E0, 04
        add     eax, timer_control                      ; 4528 _ 05, 00000300(d)
        movzx   eax, byte [eax+10H]                     ; 452D _ 0F B6. 40, 10
        movzx   edx, al                                 ; 4531 _ 0F B6. D0
        mov     eax, dword [ebp-0CH]                    ; 4534 _ 8B. 45, F4
        shl     eax, 4                                  ; 4537 _ C1. E0, 04
        add     eax, timer_control                      ; 453A _ 05, 00000300(d)
        mov     eax, dword [eax+0CH]                    ; 453F _ 8B. 40, 0C
        mov     dword [esp+4H], edx                     ; 4542 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 4546 _ 89. 04 24
        call    fifo8_put                               ; 4549 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 454E _ 8B. 45, F4
        shl     eax, 4                                  ; 4551 _ C1. E0, 04
        add     eax, timer_control                      ; 4554 _ 05, 00000300(d)
        lea     edx, [eax+4H]                           ; 4559 _ 8D. 50, 04
        mov     eax, dword [task_timer]                 ; 455C _ A1, 00000000(d)
        cmp     edx, eax                                ; 4561 _ 39. C2
        jnz     ?_249                                   ; 4563 _ 75, 04
        mov     byte [ebp-0DH], 1                       ; 4565 _ C6. 45, F3, 01
?_249:  cmp     byte [ebp-0DH], 0                       ; 4569 _ 80. 7D, F3, 00
        jz      ?_250                                   ; 456D _ 74, 05
        call    task_switch                             ; 456F _ E8, FFFFFFFC(rel)
?_250:  add     dword [ebp-0CH], 1                      ; 4574 _ 83. 45, F4, 01
?_251:  cmp     dword [ebp-0CH], 499                    ; 4578 _ 81. 7D, F4, 000001F3
        jle     ?_248                                   ; 457F _ 0F 8E, FFFFFF43
        leave                                           ; 4585 _ C9
        ret                                             ; 4586 _ C3
; intHandlerTimer End of function

segment_descriptor:; Function begin
        push    ebp                                     ; 4587 _ 55
        mov     ebp, esp                                ; 4588 _ 89. E5
        cmp     dword [ebp+0CH], 1048575                ; 458A _ 81. 7D, 0C, 000FFFFF
        jbe     ?_252                                   ; 4591 _ 76, 10
        or      dword [ebp+14H], 8000H                  ; 4593 _ 81. 4D, 14, 00008000
        mov     eax, dword [ebp+0CH]                    ; 459A _ 8B. 45, 0C
        shr     eax, 12                                 ; 459D _ C1. E8, 0C
        mov     dword [ebp+0CH], eax                    ; 45A0 _ 89. 45, 0C
?_252:  mov     eax, dword [ebp+0CH]                    ; 45A3 _ 8B. 45, 0C
        mov     edx, eax                                ; 45A6 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 45A8 _ 8B. 45, 08
        mov     word [eax], dx                          ; 45AB _ 66: 89. 10
        mov     eax, dword [ebp+10H]                    ; 45AE _ 8B. 45, 10
        mov     edx, eax                                ; 45B1 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 45B3 _ 8B. 45, 08
        mov     word [eax+2H], dx                       ; 45B6 _ 66: 89. 50, 02
        mov     eax, dword [ebp+10H]                    ; 45BA _ 8B. 45, 10
        sar     eax, 16                                 ; 45BD _ C1. F8, 10
        mov     edx, eax                                ; 45C0 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 45C2 _ 8B. 45, 08
        mov     byte [eax+4H], dl                       ; 45C5 _ 88. 50, 04
        mov     eax, dword [ebp+14H]                    ; 45C8 _ 8B. 45, 14
        mov     edx, eax                                ; 45CB _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 45CD _ 8B. 45, 08
        mov     byte [eax+5H], dl                       ; 45D0 _ 88. 50, 05
        mov     eax, dword [ebp+0CH]                    ; 45D3 _ 8B. 45, 0C
        shr     eax, 16                                 ; 45D6 _ C1. E8, 10
        and     eax, 0FH                                ; 45D9 _ 83. E0, 0F
        mov     edx, eax                                ; 45DC _ 89. C2
        mov     eax, dword [ebp+14H]                    ; 45DE _ 8B. 45, 14
        sar     eax, 8                                  ; 45E1 _ C1. F8, 08
        and     eax, 0FFFFFFF0H                         ; 45E4 _ 83. E0, F0
        or      eax, edx                                ; 45E7 _ 09. D0
        mov     edx, eax                                ; 45E9 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 45EB _ 8B. 45, 08
        mov     byte [eax+6H], dl                       ; 45EE _ 88. 50, 06
        mov     eax, dword [ebp+10H]                    ; 45F1 _ 8B. 45, 10
        shr     eax, 24                                 ; 45F4 _ C1. E8, 18
        mov     edx, eax                                ; 45F7 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 45F9 _ 8B. 45, 08
        mov     byte [eax+7H], dl                       ; 45FC _ 88. 50, 07
        pop     ebp                                     ; 45FF _ 5D
        ret                                             ; 4600 _ C3
; segment_descriptor End of function

init_task_level:; Function begin
        push    ebp                                     ; 4601 _ 55
        mov     ebp, esp                                ; 4602 _ 89. E5
        sub     esp, 16                                 ; 4604 _ 83. EC, 10
        mov     ecx, dword [task_control]               ; 4607 _ 8B. 0D, 00002248(d)
        mov     edx, dword [ebp+8H]                     ; 460D _ 8B. 55, 08
        mov     eax, edx                                ; 4610 _ 89. D0
        shl     eax, 2                                  ; 4612 _ C1. E0, 02
        add     eax, edx                                ; 4615 _ 01. D0
        shl     eax, 2                                  ; 4617 _ C1. E0, 02
        add     eax, ecx                                ; 461A _ 01. C8
        add     eax, 8                                  ; 461C _ 83. C0, 08
        mov     dword [eax], 0                          ; 461F _ C7. 00, 00000000
        mov     ecx, dword [task_control]               ; 4625 _ 8B. 0D, 00002248(d)
        mov     edx, dword [ebp+8H]                     ; 462B _ 8B. 55, 08
        mov     eax, edx                                ; 462E _ 89. D0
        shl     eax, 2                                  ; 4630 _ C1. E0, 02
        add     eax, edx                                ; 4633 _ 01. D0
        shl     eax, 2                                  ; 4635 _ C1. E0, 02
        add     eax, ecx                                ; 4638 _ 01. C8
        add     eax, 12                                 ; 463A _ 83. C0, 0C
        mov     dword [eax], 0                          ; 463D _ C7. 00, 00000000
        mov     dword [ebp-4H], 0                       ; 4643 _ C7. 45, FC, 00000000
        jmp     ?_254                                   ; 464A _ EB, 21

?_253:  mov     ecx, dword [task_control]               ; 464C _ 8B. 0D, 00002248(d)
        mov     edx, dword [ebp-4H]                     ; 4652 _ 8B. 55, FC
        mov     eax, edx                                ; 4655 _ 89. D0
        add     eax, eax                                ; 4657 _ 01. C0
        add     eax, edx                                ; 4659 _ 01. D0
        shl     eax, 3                                  ; 465B _ C1. E0, 03
        add     eax, ecx                                ; 465E _ 01. C8
        add     eax, 16                                 ; 4660 _ 83. C0, 10
        mov     dword [eax], 0                          ; 4663 _ C7. 00, 00000000
        add     dword [ebp-4H], 1                       ; 4669 _ 83. 45, FC, 01
?_254:  cmp     dword [ebp-4H], 2                       ; 466D _ 83. 7D, FC, 02
        jle     ?_253                                   ; 4671 _ 7E, D9
        leave                                           ; 4673 _ C9
        ret                                             ; 4674 _ C3
; init_task_level End of function

task_init:; Function begin
        push    ebp                                     ; 4675 _ 55
        mov     ebp, esp                                ; 4676 _ 89. E5
        sub     esp, 40                                 ; 4678 _ 83. EC, 28
        call    get_addr_gdt                            ; 467B _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 4680 _ 89. 45, F0
        mov     dword [esp+4H], 668                     ; 4683 _ C7. 44 24, 04, 0000029C
        mov     eax, dword [ebp+8H]                     ; 468B _ 8B. 45, 08
        mov     dword [esp], eax                        ; 468E _ 89. 04 24
        call    memman_alloc_4k                         ; 4691 _ E8, FFFFFFFC(rel)
        mov     dword [task_control], eax               ; 4696 _ A3, 00002248(d)
        mov     dword [ebp-14H], 0                      ; 469B _ C7. 45, EC, 00000000
        jmp     ?_256                                   ; 46A2 _ E9, 00000085

?_255:  mov     edx, dword [task_control]               ; 46A7 _ 8B. 15, 00002248(d)
        mov     eax, dword [ebp-14H]                    ; 46AD _ 8B. 45, EC
        imul    eax, eax, 148                           ; 46B0 _ 69. C0, 00000094
        add     eax, edx                                ; 46B6 _ 01. D0
        add     eax, 72                                 ; 46B8 _ 83. C0, 48
        mov     dword [eax], 0                          ; 46BB _ C7. 00, 00000000
        mov     ecx, dword [task_control]               ; 46C1 _ 8B. 0D, 00002248(d)
        mov     eax, dword [ebp-14H]                    ; 46C7 _ 8B. 45, EC
        add     eax, 8                                  ; 46CA _ 83. C0, 08
        lea     edx, [eax*8]                            ; 46CD _ 8D. 14 C5, 00000000
        mov     eax, dword [ebp-14H]                    ; 46D4 _ 8B. 45, EC
        imul    eax, eax, 148                           ; 46D7 _ 69. C0, 00000094
        add     eax, ecx                                ; 46DD _ 01. C8
        add     eax, 68                                 ; 46DF _ 83. C0, 44
        mov     dword [eax], edx                        ; 46E2 _ 89. 10
        mov     eax, dword [task_control]               ; 46E4 _ A1, 00002248(d)
        mov     edx, dword [ebp-14H]                    ; 46E9 _ 8B. 55, EC
        imul    edx, edx, 148                           ; 46EC _ 69. D2, 00000094
        add     edx, 96                                 ; 46F2 _ 83. C2, 60
        add     eax, edx                                ; 46F5 _ 01. D0
        add     eax, 16                                 ; 46F7 _ 83. C0, 10
        mov     edx, dword [ebp-14H]                    ; 46FA _ 8B. 55, EC
        add     edx, 8                                  ; 46FD _ 83. C2, 08
        lea     ecx, [edx*8]                            ; 4700 _ 8D. 0C D5, 00000000
        mov     edx, dword [ebp-10H]                    ; 4707 _ 8B. 55, F0
        add     edx, ecx                                ; 470A _ 01. CA
        mov     dword [esp+0CH], 137                    ; 470C _ C7. 44 24, 0C, 00000089
        mov     dword [esp+8H], eax                     ; 4714 _ 89. 44 24, 08
        mov     dword [esp+4H], 103                     ; 4718 _ C7. 44 24, 04, 00000067
        mov     dword [esp], edx                        ; 4720 _ 89. 14 24
        call    segment_descriptor                      ; 4723 _ E8, FFFFFFFC(rel)
        add     dword [ebp-14H], 1                      ; 4728 _ 83. 45, EC, 01
?_256:  cmp     dword [ebp-14H], 4                      ; 472C _ 83. 7D, EC, 04
        jle     ?_255                                   ; 4730 _ 0F 8E, FFFFFF71
        mov     dword [ebp-14H], 0                      ; 4736 _ C7. 45, EC, 00000000
        jmp     ?_258                                   ; 473D _ EB, 0F

?_257:  mov     eax, dword [ebp-14H]                    ; 473F _ 8B. 45, EC
        mov     dword [esp], eax                        ; 4742 _ 89. 04 24
        call    init_task_level                         ; 4745 _ E8, FFFFFFFC(rel)
        add     dword [ebp-14H], 1                      ; 474A _ 83. 45, EC, 01
?_258:  cmp     dword [ebp-14H], 2                      ; 474E _ 83. 7D, EC, 02
        jle     ?_257                                   ; 4752 _ 7E, EB
        call    task_alloc                              ; 4754 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 4759 _ 89. 45, F4
        mov     eax, dword [ebp-0CH]                    ; 475C _ 8B. 45, F4
        mov     dword [eax+4H], 2                       ; 475F _ C7. 40, 04, 00000002
        mov     eax, dword [ebp-0CH]                    ; 4766 _ 8B. 45, F4
        mov     dword [eax+8H], 100                     ; 4769 _ C7. 40, 08, 00000064
        mov     eax, dword [ebp-0CH]                    ; 4770 _ 8B. 45, F4
        mov     dword [eax+0CH], 0                      ; 4773 _ C7. 40, 0C, 00000000
        mov     eax, dword [ebp-0CH]                    ; 477A _ 8B. 45, F4
        mov     dword [esp], eax                        ; 477D _ 89. 04 24
        call    task_add                                ; 4780 _ E8, FFFFFFFC(rel)
        call    task_switch_sub                         ; 4785 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 478A _ 8B. 45, F4
        mov     eax, dword [eax]                        ; 478D _ 8B. 00
        mov     dword [esp], eax                        ; 478F _ 89. 04 24
        call    load_tr                                 ; 4792 _ E8, FFFFFFFC(rel)
        call    timer_alloc                             ; 4797 _ E8, FFFFFFFC(rel)
        mov     dword [task_timer], eax                 ; 479C _ A3, 00002244(d)
        mov     eax, dword [ebp-0CH]                    ; 47A1 _ 8B. 45, F4
        mov     eax, dword [eax+8H]                     ; 47A4 _ 8B. 40, 08
        mov     edx, eax                                ; 47A7 _ 89. C2
        mov     eax, dword [task_timer]                 ; 47A9 _ A1, 00002244(d)
        mov     dword [esp+4H], edx                     ; 47AE _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 47B2 _ 89. 04 24
        call    timer_settime                           ; 47B5 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 47BA _ 8B. 45, F4
        leave                                           ; 47BD _ C9
        ret                                             ; 47BE _ C3
; task_init End of function

task_alloc:; Function begin
        push    ebp                                     ; 47BF _ 55
        mov     ebp, esp                                ; 47C0 _ 89. E5
        sub     esp, 16                                 ; 47C2 _ 83. EC, 10
        mov     dword [ebp-8H], 0                       ; 47C5 _ C7. 45, F8, 00000000
        jmp     ?_261                                   ; 47CC _ E9, 000000F6

?_259:  mov     edx, dword [task_control]               ; 47D1 _ 8B. 15, 00002248(d)
        mov     eax, dword [ebp-8H]                     ; 47D7 _ 8B. 45, F8
        imul    eax, eax, 148                           ; 47DA _ 69. C0, 00000094
        add     eax, edx                                ; 47E0 _ 01. D0
        add     eax, 72                                 ; 47E2 _ 83. C0, 48
        mov     eax, dword [eax]                        ; 47E5 _ 8B. 00
        test    eax, eax                                ; 47E7 _ 85. C0
        jne     ?_260                                   ; 47E9 _ 0F 85, 000000D4
        mov     eax, dword [task_control]               ; 47EF _ A1, 00002248(d)
        mov     edx, dword [ebp-8H]                     ; 47F4 _ 8B. 55, F8
        imul    edx, edx, 148                           ; 47F7 _ 69. D2, 00000094
        add     edx, 64                                 ; 47FD _ 83. C2, 40
        add     eax, edx                                ; 4800 _ 01. D0
        add     eax, 4                                  ; 4802 _ 83. C0, 04
        mov     dword [ebp-4H], eax                     ; 4805 _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 4808 _ 8B. 45, FC
        mov     dword [eax+4H], 1                       ; 480B _ C7. 40, 04, 00000001
        mov     eax, dword [ebp-4H]                     ; 4812 _ 8B. 45, FC
        mov     dword [eax+50H], 514                    ; 4815 _ C7. 40, 50, 00000202
        mov     eax, dword [ebp-4H]                     ; 481C _ 8B. 45, FC
        mov     dword [eax+54H], 0                      ; 481F _ C7. 40, 54, 00000000
        mov     eax, dword [ebp-4H]                     ; 4826 _ 8B. 45, FC
        mov     dword [eax+58H], 0                      ; 4829 _ C7. 40, 58, 00000000
        mov     eax, dword [ebp-4H]                     ; 4830 _ 8B. 45, FC
        mov     dword [eax+5CH], 0                      ; 4833 _ C7. 40, 5C, 00000000
        mov     eax, dword [ebp-4H]                     ; 483A _ 8B. 45, FC
        mov     dword [eax+60H], 0                      ; 483D _ C7. 40, 60, 00000000
        mov     eax, dword [ebp-8H]                     ; 4844 _ 8B. 45, F8
        add     eax, 1                                  ; 4847 _ 83. C0, 01
        shl     eax, 9                                  ; 484A _ C1. E0, 09
        mov     edx, eax                                ; 484D _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 484F _ 8B. 45, FC
        mov     dword [eax+64H], edx                    ; 4852 _ 89. 50, 64
        mov     eax, dword [ebp-4H]                     ; 4855 _ 8B. 45, FC
        mov     dword [eax+68H], 0                      ; 4858 _ C7. 40, 68, 00000000
        mov     eax, dword [ebp-4H]                     ; 485F _ 8B. 45, FC
        mov     dword [eax+6CH], 0                      ; 4862 _ C7. 40, 6C, 00000000
        mov     eax, dword [ebp-4H]                     ; 4869 _ 8B. 45, FC
        mov     dword [eax+70H], 0                      ; 486C _ C7. 40, 70, 00000000
        mov     eax, dword [ebp-4H]                     ; 4873 _ 8B. 45, FC
        mov     dword [eax+74H], 0                      ; 4876 _ C7. 40, 74, 00000000
        mov     eax, dword [ebp-4H]                     ; 487D _ 8B. 45, FC
        mov     dword [eax+80H], 0                      ; 4880 _ C7. 80, 00000080, 00000000
        mov     eax, dword [ebp-4H]                     ; 488A _ 8B. 45, FC
        mov     dword [eax+84H], 0                      ; 488D _ C7. 80, 00000084, 00000000
        mov     eax, dword [ebp-4H]                     ; 4897 _ 8B. 45, FC
        mov     dword [eax+88H], 0                      ; 489A _ C7. 80, 00000088, 00000000
        mov     eax, dword [ebp-4H]                     ; 48A4 _ 8B. 45, FC
        mov     dword [eax+8CH], 0                      ; 48A7 _ C7. 80, 0000008C, 00000000
        mov     eax, dword [ebp-4H]                     ; 48B1 _ 8B. 45, FC
        mov     dword [eax+90H], 1073741824             ; 48B4 _ C7. 80, 00000090, 40000000
        mov     eax, dword [ebp-4H]                     ; 48BE _ 8B. 45, FC
        jmp     ?_262                                   ; 48C1 _ EB, 13

?_260:  add     dword [ebp-8H], 1                       ; 48C3 _ 83. 45, F8, 01
?_261:  cmp     dword [ebp-8H], 4                       ; 48C7 _ 83. 7D, F8, 04
        jle     ?_259                                   ; 48CB _ 0F 8E, FFFFFF00
        mov     eax, 0                                  ; 48D1 _ B8, 00000000
?_262:  leave                                           ; 48D6 _ C9
        ret                                             ; 48D7 _ C3
; task_alloc End of function

task_run:; Function begin
        push    ebp                                     ; 48D8 _ 55
        mov     ebp, esp                                ; 48D9 _ 89. E5
        sub     esp, 24                                 ; 48DB _ 83. EC, 18
        cmp     dword [ebp+0CH], 0                      ; 48DE _ 83. 7D, 0C, 00
        jns     ?_263                                   ; 48E2 _ 79, 09
        mov     eax, dword [ebp+8H]                     ; 48E4 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 48E7 _ 8B. 40, 0C
        mov     dword [ebp+0CH], eax                    ; 48EA _ 89. 45, 0C
?_263:  cmp     dword [ebp+10H], 0                      ; 48ED _ 83. 7D, 10, 00
        jle     ?_264                                   ; 48F1 _ 7E, 09
        mov     eax, dword [ebp+8H]                     ; 48F3 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 48F6 _ 8B. 55, 10
        mov     dword [eax+8H], edx                     ; 48F9 _ 89. 50, 08
?_264:  mov     eax, dword [ebp+8H]                     ; 48FC _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 48FF _ 8B. 40, 04
        cmp     eax, 2                                  ; 4902 _ 83. F8, 02
        jnz     ?_265                                   ; 4905 _ 75, 16
        mov     eax, dword [ebp+8H]                     ; 4907 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 490A _ 8B. 40, 0C
        cmp     eax, dword [ebp+0CH]                    ; 490D _ 3B. 45, 0C
        jz      ?_265                                   ; 4910 _ 74, 0B
        mov     eax, dword [ebp+8H]                     ; 4912 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 4915 _ 89. 04 24
        call    task_remove                             ; 4918 _ E8, FFFFFFFC(rel)
?_265:  mov     eax, dword [ebp+8H]                     ; 491D _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 4920 _ 8B. 40, 04
        cmp     eax, 2                                  ; 4923 _ 83. F8, 02
        jz      ?_266                                   ; 4926 _ 74, 14
        mov     eax, dword [ebp+8H]                     ; 4928 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 492B _ 8B. 55, 0C
        mov     dword [eax+0CH], edx                    ; 492E _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 4931 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 4934 _ 89. 04 24
        call    task_add                                ; 4937 _ E8, FFFFFFFC(rel)
?_266:  mov     eax, dword [task_control]               ; 493C _ A1, 00002248(d)
        mov     dword [eax+4H], 1                       ; 4941 _ C7. 40, 04, 00000001
        leave                                           ; 4948 _ C9
        ret                                             ; 4949 _ C3
; task_run End of function

task_switch:; Function begin
        push    ebp                                     ; 494A _ 55
        mov     ebp, esp                                ; 494B _ 89. E5
        sub     esp, 40                                 ; 494D _ 83. EC, 28
        mov     ecx, dword [task_control]               ; 4950 _ 8B. 0D, 00002248(d)
        mov     eax, dword [task_control]               ; 4956 _ A1, 00002248(d)
        mov     edx, dword [eax]                        ; 495B _ 8B. 10
        mov     eax, edx                                ; 495D _ 89. D0
        shl     eax, 2                                  ; 495F _ C1. E0, 02
        add     eax, edx                                ; 4962 _ 01. D0
        shl     eax, 2                                  ; 4964 _ C1. E0, 02
        add     eax, ecx                                ; 4967 _ 01. C8
        add     eax, 8                                  ; 4969 _ 83. C0, 08
        mov     dword [ebp-14H], eax                    ; 496C _ 89. 45, EC
        mov     eax, dword [ebp-14H]                    ; 496F _ 8B. 45, EC
        mov     edx, dword [eax+4H]                     ; 4972 _ 8B. 50, 04
        mov     eax, dword [ebp-14H]                    ; 4975 _ 8B. 45, EC
        mov     eax, dword [eax+edx*4+8H]               ; 4978 _ 8B. 44 90, 08
        mov     dword [ebp-10H], eax                    ; 497C _ 89. 45, F0
        mov     eax, dword [ebp-14H]                    ; 497F _ 8B. 45, EC
        mov     eax, dword [eax+4H]                     ; 4982 _ 8B. 40, 04
        lea     edx, [eax+1H]                           ; 4985 _ 8D. 50, 01
        mov     eax, dword [ebp-14H]                    ; 4988 _ 8B. 45, EC
        mov     dword [eax+4H], edx                     ; 498B _ 89. 50, 04
        mov     eax, dword [ebp-14H]                    ; 498E _ 8B. 45, EC
        mov     edx, dword [eax+4H]                     ; 4991 _ 8B. 50, 04
        mov     eax, dword [ebp-14H]                    ; 4994 _ 8B. 45, EC
        mov     eax, dword [eax]                        ; 4997 _ 8B. 00
        cmp     edx, eax                                ; 4999 _ 39. C2
        jnz     ?_267                                   ; 499B _ 75, 0A
        mov     eax, dword [ebp-14H]                    ; 499D _ 8B. 45, EC
        mov     dword [eax+4H], 0                       ; 49A0 _ C7. 40, 04, 00000000
?_267:  mov     eax, dword [task_control]               ; 49A7 _ A1, 00002248(d)
        mov     eax, dword [eax+4H]                     ; 49AC _ 8B. 40, 04
        test    eax, eax                                ; 49AF _ 85. C0
        jz      ?_268                                   ; 49B1 _ 74, 24
        call    task_switch_sub                         ; 49B3 _ E8, FFFFFFFC(rel)
        mov     ecx, dword [task_control]               ; 49B8 _ 8B. 0D, 00002248(d)
        mov     eax, dword [task_control]               ; 49BE _ A1, 00002248(d)
        mov     edx, dword [eax]                        ; 49C3 _ 8B. 10
        mov     eax, edx                                ; 49C5 _ 89. D0
        shl     eax, 2                                  ; 49C7 _ C1. E0, 02
        add     eax, edx                                ; 49CA _ 01. D0
        shl     eax, 2                                  ; 49CC _ C1. E0, 02
        add     eax, ecx                                ; 49CF _ 01. C8
        add     eax, 8                                  ; 49D1 _ 83. C0, 08
        mov     dword [ebp-14H], eax                    ; 49D4 _ 89. 45, EC
?_268:  mov     eax, dword [ebp-14H]                    ; 49D7 _ 8B. 45, EC
        mov     edx, dword [eax+4H]                     ; 49DA _ 8B. 50, 04
        mov     eax, dword [ebp-14H]                    ; 49DD _ 8B. 45, EC
        mov     eax, dword [eax+edx*4+8H]               ; 49E0 _ 8B. 44 90, 08
        mov     dword [ebp-0CH], eax                    ; 49E4 _ 89. 45, F4
        mov     eax, dword [ebp-0CH]                    ; 49E7 _ 8B. 45, F4
        mov     eax, dword [eax+8H]                     ; 49EA _ 8B. 40, 08
        mov     edx, eax                                ; 49ED _ 89. C2
        mov     eax, dword [task_timer]                 ; 49EF _ A1, 00002244(d)
        mov     dword [esp+4H], edx                     ; 49F4 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 49F8 _ 89. 04 24
        call    timer_settime                           ; 49FB _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 4A00 _ 8B. 45, F4
        cmp     eax, dword [ebp-10H]                    ; 4A03 _ 3B. 45, F0
        jz      ?_269                                   ; 4A06 _ 74, 1B
        cmp     dword [ebp-0CH], 0                      ; 4A08 _ 83. 7D, F4, 00
        jz      ?_269                                   ; 4A0C _ 74, 15
        mov     eax, dword [ebp-0CH]                    ; 4A0E _ 8B. 45, F4
        mov     eax, dword [eax]                        ; 4A11 _ 8B. 00
        mov     dword [esp+4H], eax                     ; 4A13 _ 89. 44 24, 04
        mov     dword [esp], 0                          ; 4A17 _ C7. 04 24, 00000000
        call    farjmp                                  ; 4A1E _ E8, FFFFFFFC(rel)
?_269:  leave                                           ; 4A23 _ C9
        ret                                             ; 4A24 _ C3
; task_switch End of function

task_sleep:; Function begin
        push    ebp                                     ; 4A25 _ 55
        mov     ebp, esp                                ; 4A26 _ 89. E5
        sub     esp, 40                                 ; 4A28 _ 83. EC, 28
        mov     dword [ebp-0CH], 0                      ; 4A2B _ C7. 45, F4, 00000000
        mov     dword [ebp-10H], 0                      ; 4A32 _ C7. 45, F0, 00000000
        mov     eax, dword [ebp+8H]                     ; 4A39 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 4A3C _ 8B. 40, 04
        cmp     eax, 2                                  ; 4A3F _ 83. F8, 02
        jnz     ?_270                                   ; 4A42 _ 75, 51
        call    task_now                                ; 4A44 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 4A49 _ 89. 45, F4
        mov     eax, dword [ebp+8H]                     ; 4A4C _ 8B. 45, 08
        mov     dword [esp], eax                        ; 4A4F _ 89. 04 24
        call    task_remove                             ; 4A52 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], 1                      ; 4A57 _ C7. 45, F0, 00000001
        mov     eax, dword [ebp+8H]                     ; 4A5E _ 8B. 45, 08
        cmp     eax, dword [ebp-0CH]                    ; 4A61 _ 3B. 45, F4
        jnz     ?_270                                   ; 4A64 _ 75, 2F
        call    task_switch_sub                         ; 4A66 _ E8, FFFFFFFC(rel)
        call    task_now                                ; 4A6B _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 4A70 _ 89. 45, F4
        mov     dword [ebp-10H], 2                      ; 4A73 _ C7. 45, F0, 00000002
        cmp     dword [ebp-0CH], 0                      ; 4A7A _ 83. 7D, F4, 00
        jz      ?_270                                   ; 4A7E _ 74, 15
        mov     eax, dword [ebp-0CH]                    ; 4A80 _ 8B. 45, F4
        mov     eax, dword [eax]                        ; 4A83 _ 8B. 00
        mov     dword [esp+4H], eax                     ; 4A85 _ 89. 44 24, 04
        mov     dword [esp], 0                          ; 4A89 _ C7. 04 24, 00000000
        call    farjmp                                  ; 4A90 _ E8, FFFFFFFC(rel)
?_270:  mov     eax, dword [ebp-10H]                    ; 4A95 _ 8B. 45, F0
        leave                                           ; 4A98 _ C9
        ret                                             ; 4A99 _ C3
; task_sleep End of function

task_now:; Function begin
        push    ebp                                     ; 4A9A _ 55
        mov     ebp, esp                                ; 4A9B _ 89. E5
        sub     esp, 16                                 ; 4A9D _ 83. EC, 10
        mov     ecx, dword [task_control]               ; 4AA0 _ 8B. 0D, 00002248(d)
        mov     eax, dword [task_control]               ; 4AA6 _ A1, 00002248(d)
        mov     edx, dword [eax]                        ; 4AAB _ 8B. 10
        mov     eax, edx                                ; 4AAD _ 89. D0
        shl     eax, 2                                  ; 4AAF _ C1. E0, 02
        add     eax, edx                                ; 4AB2 _ 01. D0
        shl     eax, 2                                  ; 4AB4 _ C1. E0, 02
        add     eax, ecx                                ; 4AB7 _ 01. C8
        add     eax, 8                                  ; 4AB9 _ 83. C0, 08
        mov     dword [ebp-4H], eax                     ; 4ABC _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 4ABF _ 8B. 45, FC
        mov     edx, dword [eax+4H]                     ; 4AC2 _ 8B. 50, 04
        mov     eax, dword [ebp-4H]                     ; 4AC5 _ 8B. 45, FC
        mov     eax, dword [eax+edx*4+8H]               ; 4AC8 _ 8B. 44 90, 08
        leave                                           ; 4ACC _ C9
        ret                                             ; 4ACD _ C3
; task_now End of function

task_add:; Function begin
        push    ebp                                     ; 4ACE _ 55
        mov     ebp, esp                                ; 4ACF _ 89. E5
        sub     esp, 16                                 ; 4AD1 _ 83. EC, 10
        mov     ecx, dword [task_control]               ; 4AD4 _ 8B. 0D, 00002248(d)
        mov     eax, dword [ebp+8H]                     ; 4ADA _ 8B. 45, 08
        mov     edx, dword [eax+0CH]                    ; 4ADD _ 8B. 50, 0C
        mov     eax, edx                                ; 4AE0 _ 89. D0
        shl     eax, 2                                  ; 4AE2 _ C1. E0, 02
        add     eax, edx                                ; 4AE5 _ 01. D0
        shl     eax, 2                                  ; 4AE7 _ C1. E0, 02
        add     eax, ecx                                ; 4AEA _ 01. C8
        add     eax, 8                                  ; 4AEC _ 83. C0, 08
        mov     dword [ebp-4H], eax                     ; 4AEF _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 4AF2 _ 8B. 45, FC
        mov     edx, dword [eax]                        ; 4AF5 _ 8B. 10
        mov     eax, dword [ebp-4H]                     ; 4AF7 _ 8B. 45, FC
        mov     ecx, dword [ebp+8H]                     ; 4AFA _ 8B. 4D, 08
        mov     dword [eax+edx*4+8H], ecx               ; 4AFD _ 89. 4C 90, 08
        mov     eax, dword [ebp-4H]                     ; 4B01 _ 8B. 45, FC
        mov     eax, dword [eax]                        ; 4B04 _ 8B. 00
        lea     edx, [eax+1H]                           ; 4B06 _ 8D. 50, 01
        mov     eax, dword [ebp-4H]                     ; 4B09 _ 8B. 45, FC
        mov     dword [eax], edx                        ; 4B0C _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 4B0E _ 8B. 45, 08
        mov     dword [eax+4H], 2                       ; 4B11 _ C7. 40, 04, 00000002
        leave                                           ; 4B18 _ C9
        ret                                             ; 4B19 _ C3
; task_add End of function

task_remove:; Function begin
        push    ebp                                     ; 4B1A _ 55
        mov     ebp, esp                                ; 4B1B _ 89. E5
        sub     esp, 16                                 ; 4B1D _ 83. EC, 10
        mov     ecx, dword [task_control]               ; 4B20 _ 8B. 0D, 00002248(d)
        mov     eax, dword [ebp+8H]                     ; 4B26 _ 8B. 45, 08
        mov     edx, dword [eax+0CH]                    ; 4B29 _ 8B. 50, 0C
        mov     eax, edx                                ; 4B2C _ 89. D0
        shl     eax, 2                                  ; 4B2E _ C1. E0, 02
        add     eax, edx                                ; 4B31 _ 01. D0
        shl     eax, 2                                  ; 4B33 _ C1. E0, 02
        add     eax, ecx                                ; 4B36 _ 01. C8
        add     eax, 8                                  ; 4B38 _ 83. C0, 08
        mov     dword [ebp-4H], eax                     ; 4B3B _ 89. 45, FC
        mov     dword [ebp-8H], 0                       ; 4B3E _ C7. 45, F8, 00000000
        jmp     ?_273                                   ; 4B45 _ EB, 23

?_271:  mov     eax, dword [ebp-4H]                     ; 4B47 _ 8B. 45, FC
        mov     edx, dword [ebp-8H]                     ; 4B4A _ 8B. 55, F8
        mov     eax, dword [eax+edx*4+8H]               ; 4B4D _ 8B. 44 90, 08
        cmp     eax, dword [ebp+8H]                     ; 4B51 _ 3B. 45, 08
        jnz     ?_272                                   ; 4B54 _ 75, 10
        mov     eax, dword [ebp-4H]                     ; 4B56 _ 8B. 45, FC
        mov     edx, dword [ebp-8H]                     ; 4B59 _ 8B. 55, F8
        mov     dword [eax+edx*4+8H], 0                 ; 4B5C _ C7. 44 90, 08, 00000000
        jmp     ?_274                                   ; 4B64 _ EB, 0E

?_272:  add     dword [ebp-8H], 1                       ; 4B66 _ 83. 45, F8, 01
?_273:  mov     eax, dword [ebp-4H]                     ; 4B6A _ 8B. 45, FC
        mov     eax, dword [eax]                        ; 4B6D _ 8B. 00
        cmp     eax, dword [ebp-8H]                     ; 4B6F _ 3B. 45, F8
        jg      ?_271                                   ; 4B72 _ 7F, D3
?_274:  mov     eax, dword [ebp-4H]                     ; 4B74 _ 8B. 45, FC
        mov     eax, dword [eax]                        ; 4B77 _ 8B. 00
        lea     edx, [eax-1H]                           ; 4B79 _ 8D. 50, FF
        mov     eax, dword [ebp-4H]                     ; 4B7C _ 8B. 45, FC
        mov     dword [eax], edx                        ; 4B7F _ 89. 10
        mov     eax, dword [ebp-4H]                     ; 4B81 _ 8B. 45, FC
        mov     eax, dword [eax+4H]                     ; 4B84 _ 8B. 40, 04
        cmp     eax, dword [ebp-8H]                     ; 4B87 _ 3B. 45, F8
        jle     ?_275                                   ; 4B8A _ 7E, 0F
        mov     eax, dword [ebp-4H]                     ; 4B8C _ 8B. 45, FC
        mov     eax, dword [eax+4H]                     ; 4B8F _ 8B. 40, 04
        lea     edx, [eax-1H]                           ; 4B92 _ 8D. 50, FF
        mov     eax, dword [ebp-4H]                     ; 4B95 _ 8B. 45, FC
        mov     dword [eax+4H], edx                     ; 4B98 _ 89. 50, 04
?_275:  mov     eax, dword [ebp-4H]                     ; 4B9B _ 8B. 45, FC
        mov     edx, dword [eax+4H]                     ; 4B9E _ 8B. 50, 04
        mov     eax, dword [ebp-4H]                     ; 4BA1 _ 8B. 45, FC
        mov     eax, dword [eax]                        ; 4BA4 _ 8B. 00
        cmp     edx, eax                                ; 4BA6 _ 39. C2
        jl      ?_276                                   ; 4BA8 _ 7C, 0A
        mov     eax, dword [ebp-4H]                     ; 4BAA _ 8B. 45, FC
        mov     dword [eax+4H], 0                       ; 4BAD _ C7. 40, 04, 00000000
?_276:  mov     eax, dword [ebp+8H]                     ; 4BB4 _ 8B. 45, 08
        mov     dword [eax+4H], 1                       ; 4BB7 _ C7. 40, 04, 00000001
        jmp     ?_278                                   ; 4BBE _ EB, 1B

?_277:  mov     eax, dword [ebp-8H]                     ; 4BC0 _ 8B. 45, F8
        lea     edx, [eax+1H]                           ; 4BC3 _ 8D. 50, 01
        mov     eax, dword [ebp-4H]                     ; 4BC6 _ 8B. 45, FC
        mov     ecx, dword [eax+edx*4+8H]               ; 4BC9 _ 8B. 4C 90, 08
        mov     eax, dword [ebp-4H]                     ; 4BCD _ 8B. 45, FC
        mov     edx, dword [ebp-8H]                     ; 4BD0 _ 8B. 55, F8
        mov     dword [eax+edx*4+8H], ecx               ; 4BD3 _ 89. 4C 90, 08
        add     dword [ebp-8H], 1                       ; 4BD7 _ 83. 45, F8, 01
?_278:  mov     eax, dword [ebp-4H]                     ; 4BDB _ 8B. 45, FC
        mov     eax, dword [eax]                        ; 4BDE _ 8B. 00
        cmp     eax, dword [ebp-8H]                     ; 4BE0 _ 3B. 45, F8
        jg      ?_277                                   ; 4BE3 _ 7F, DB
        leave                                           ; 4BE5 _ C9
        ret                                             ; 4BE6 _ C3
; task_remove End of function

task_switch_sub:; Function begin
        push    ebp                                     ; 4BE7 _ 55
        mov     ebp, esp                                ; 4BE8 _ 89. E5
        sub     esp, 16                                 ; 4BEA _ 83. EC, 10
        mov     dword [ebp-4H], 0                       ; 4BED _ C7. 45, FC, 00000000
        jmp     ?_281                                   ; 4BF4 _ EB, 24

?_279:  mov     ecx, dword [task_control]               ; 4BF6 _ 8B. 0D, 00002248(d)
        mov     edx, dword [ebp-4H]                     ; 4BFC _ 8B. 55, FC
        mov     eax, edx                                ; 4BFF _ 89. D0
        shl     eax, 2                                  ; 4C01 _ C1. E0, 02
        add     eax, edx                                ; 4C04 _ 01. D0
        shl     eax, 2                                  ; 4C06 _ C1. E0, 02
        add     eax, ecx                                ; 4C09 _ 01. C8
        add     eax, 8                                  ; 4C0B _ 83. C0, 08
        mov     eax, dword [eax]                        ; 4C0E _ 8B. 00
        test    eax, eax                                ; 4C10 _ 85. C0
        jle     ?_280                                   ; 4C12 _ 7E, 02
        jmp     ?_282                                   ; 4C14 _ EB, 0A

?_280:  add     dword [ebp-4H], 1                       ; 4C16 _ 83. 45, FC, 01
?_281:  cmp     dword [ebp-4H], 2                       ; 4C1A _ 83. 7D, FC, 02
        jle     ?_279                                   ; 4C1E _ 7E, D6
?_282:  mov     eax, dword [task_control]               ; 4C20 _ A1, 00002248(d)
        mov     edx, dword [ebp-4H]                     ; 4C25 _ 8B. 55, FC
        mov     dword [eax], edx                        ; 4C28 _ 89. 10
        mov     eax, dword [task_control]               ; 4C2A _ A1, 00002248(d)
        mov     dword [eax+4H], 0                       ; 4C2F _ C7. 40, 04, 00000000
        leave                                           ; 4C36 _ C9
        ret                                             ; 4C37 _ C3
; task_switch_sub End of function

task_send_message:; Function begin
        push    ebp                                     ; 4C38 _ 55
        mov     ebp, esp                                ; 4C39 _ 89. E5
        sub     esp, 24                                 ; 4C3B _ 83. EC, 18
        mov     eax, dword [ebp+10H]                    ; 4C3E _ 8B. 45, 10
        movzx   eax, al                                 ; 4C41 _ 0F B6. C0
        mov     edx, dword [ebp+0CH]                    ; 4C44 _ 8B. 55, 0C
        add     edx, 16                                 ; 4C47 _ 83. C2, 10
        mov     dword [esp+4H], eax                     ; 4C4A _ 89. 44 24, 04
        mov     dword [esp], edx                        ; 4C4E _ 89. 14 24
        call    fifo8_put                               ; 4C51 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 4C56 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 4C59 _ 89. 04 24
        call    task_sleep                              ; 4C5C _ E8, FFFFFFFC(rel)
        leave                                           ; 4C61 _ C9
        ret                                             ; 4C62 _ C3
; task_send_message End of function



?_283:                                                  ; byte
        db 77H, 69H, 6EH, 64H, 6FH, 77H, 00H            ; 0000 _ window.

?_284:                                                  ; byte
        db 63H, 6FH, 6EH, 73H, 6FH, 6CH, 65H, 00H       ; 0007 _ console.

?_285:                                                  ; byte
        db 65H, 6EH, 74H, 65H, 72H, 20H, 74H, 61H       ; 000F _ enter ta
        db 73H, 6BH, 20H, 62H, 00H                      ; 0017 _ sk b.

?_286:                                                  ; byte
        db 42H, 00H                                     ; 001C _ B.

?_287:                                                  ; byte
        db 70H, 61H, 67H, 65H, 20H, 69H, 73H, 3AH       ; 001E _ page is:
        db 20H, 00H                                     ; 0026 _  .

?_288:                                                  ; byte
        db 42H, 61H, 73H, 65H, 41H, 64H, 64H, 72H       ; 0028 _ BaseAddr
        db 4CH, 3AH, 20H, 00H                           ; 0030 _ L: .

?_289:                                                  ; byte
        db 42H, 61H, 73H, 65H, 41H, 64H, 64H, 72H       ; 0034 _ BaseAddr
        db 48H, 3AH, 20H, 00H                           ; 003C _ H: .

?_290:                                                  ; byte
        db 6CH, 65H, 6EH, 67H, 74H, 68H, 4CH, 6FH       ; 0040 _ lengthLo
        db 77H, 3AH, 20H, 00H                           ; 0048 _ w: .

?_291:                                                  ; byte
        db 6CH, 65H, 6EH, 67H, 74H, 68H, 48H, 69H       ; 004C _ lengthHi
        db 67H, 68H, 3AH, 20H, 00H                      ; 0054 _ gh: .

?_292:                                                  ; byte
        db 74H, 79H, 70H, 65H, 3AH, 20H, 00H            ; 0059 _ type: .

?_293:                                                  ; byte
        db 3EH, 00H                                     ; 0060 _ >.

?_294:                                                  ; byte
        db 6DH, 65H, 6DH, 00H                           ; 0062 _ mem.

?_295:                                                  ; byte
        db 66H, 72H, 65H, 65H, 20H, 00H                 ; 0066 _ free .

?_296:                                                  ; byte
        db 20H, 4BH, 42H, 00H                           ; 006C _  KB.

?_297:                                                  ; byte
        db 63H, 6CH, 73H, 00H                           ; 0070 _ cls.

?_298:                                                  ; byte
        db 64H, 69H, 72H, 00H                           ; 0074 _ dir.

?_299:                                                  ; byte
        db 63H, 6FH, 6EH, 73H, 6FH, 6CH, 65H, 00H       ; 0078 _ console.



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
        db 00H, 20H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0058 _ . ......
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

table_rgb.1775:                                         ; byte
        db 00H, 00H, 00H, 0FFH, 00H, 00H, 44H, 8CH      ; 0120 _ ......D.
        db 0BBH, 0FFH, 0FFH, 00H, 00H, 00H, 0FFH, 0FFH  ; 0128 _ ........
        db 00H, 0FFH, 00H, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH ; 0130 _ ........
        db 0C6H, 0C6H, 0C6H, 84H, 00H, 00H, 00H, 84H    ; 0138 _ ........
        db 00H, 84H, 84H, 00H, 00H, 00H, 84H, 84H       ; 0140 _ ........
        db 00H, 84H, 00H, 84H, 84H, 84H, 84H, 84H       ; 0148 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0150 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0158 _ ........

cursor.1843:                                            ; byte
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

closebtn.1930:                                          ; byte
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

?_300:  db 00H                                          ; 0342 _ .

?_301:  db 00H, 00H                                     ; 0343 _ ..



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

timerinfo1.1766:                                        ; byte
        resb    28                                      ; 0018

timerbuf1.1769:                                         ; qword
        resq    1                                       ; 0034

timerinfo2.1767:                                        ; byte
        resb    28                                      ; 003C

timerbuf2.1770:                                         ; qword
        resq    1                                       ; 0058

timerinfo3.1768:                                        ; byte
        resb    28                                      ; 0060

timerbuf3.1771:                                         ; qword
        resq    4                                       ; 007C
        resb    4                                       ; 009C

screen_info:                                            ; qword
        resb    4                                       ; 00A0

?_302:  resw    1                                       ; 00A4

?_303:  resw    13                                      ; 00A6

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

?_304:  resb    9                                       ; 02E1

?_305:  resb    22                                      ; 02EA

timer_control:                                          ; byte
        resd    2001                                    ; 0300

task_timer:                                             ; dword
        resd    1                                       ; 2244

task_control:                                           ; dword
        resd    1                                       ; 2248


