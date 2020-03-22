; Disassembly of file: ckernel.o
; Sun Mar 22 15:43:38 2020
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
        mov     dword [esp+8H], timerbuf1.1799          ; 014B _ C7. 44 24, 08, 00000034(d)
        mov     dword [esp+4H], 8                       ; 0153 _ C7. 44 24, 04, 00000008
        mov     dword [esp], timerinfo1.1796            ; 015B _ C7. 04 24, 00000018(d)
        call    fifo8_init                              ; 0162 _ E8, FFFFFFFC(rel)
        call    timer_alloc                             ; 0167 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-38H], eax                    ; 016C _ 89. 45, C8
        mov     dword [esp+8H], 1                       ; 016F _ C7. 44 24, 08, 00000001
        mov     dword [esp+4H], timerinfo1.1796         ; 0177 _ C7. 44 24, 04, 00000018(d)
        mov     eax, dword [ebp-38H]                    ; 017F _ 8B. 45, C8
        mov     dword [esp], eax                        ; 0182 _ 89. 04 24
        call    timer_init                              ; 0185 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 100                     ; 018A _ C7. 44 24, 04, 00000064
        mov     eax, dword [ebp-38H]                    ; 0192 _ 8B. 45, C8
        mov     dword [esp], eax                        ; 0195 _ 89. 04 24
        call    timer_settime                           ; 0198 _ E8, FFFFFFFC(rel)
        mov     dword [esp+0CH], 0                      ; 019D _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], timerbuf2.1800          ; 01A5 _ C7. 44 24, 08, 00000058(d)
        mov     dword [esp+4H], 8                       ; 01AD _ C7. 44 24, 04, 00000008
        mov     dword [esp], timerinfo2.1797            ; 01B5 _ C7. 04 24, 0000003C(d)
        call    fifo8_init                              ; 01BC _ E8, FFFFFFFC(rel)
        call    timer_alloc                             ; 01C1 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-34H], eax                    ; 01C6 _ 89. 45, CC
        mov     dword [esp+8H], 1                       ; 01C9 _ C7. 44 24, 08, 00000001
        mov     dword [esp+4H], timerinfo2.1797         ; 01D1 _ C7. 44 24, 04, 0000003C(d)
        mov     eax, dword [ebp-34H]                    ; 01D9 _ 8B. 45, CC
        mov     dword [esp], eax                        ; 01DC _ 89. 04 24
        call    timer_init                              ; 01DF _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 300                     ; 01E4 _ C7. 44 24, 04, 0000012C
        mov     eax, dword [ebp-34H]                    ; 01EC _ 8B. 45, CC
        mov     dword [esp], eax                        ; 01EF _ 89. 04 24
        call    timer_settime                           ; 01F2 _ E8, FFFFFFFC(rel)
        mov     dword [esp+0CH], 0                      ; 01F7 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], timerbuf3.1801          ; 01FF _ C7. 44 24, 08, 0000007C(d)
        mov     dword [esp+4H], 8                       ; 0207 _ C7. 44 24, 04, 00000008
        mov     dword [esp], timerinfo3.1798            ; 020F _ C7. 04 24, 00000060(d)
        call    fifo8_init                              ; 0216 _ E8, FFFFFFFC(rel)
        call    timer_alloc                             ; 021B _ E8, FFFFFFFC(rel)
        mov     dword [ebp-30H], eax                    ; 0220 _ 89. 45, D0
        mov     dword [esp+8H], 1                       ; 0223 _ C7. 44 24, 08, 00000001
        mov     dword [esp+4H], timerinfo3.1798         ; 022B _ C7. 44 24, 04, 00000060(d)
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
        mov     dword [esp+4H], ?_305                   ; 02DC _ C7. 44 24, 04, 00000000(d)
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
        mov     dword [esp], timerinfo1.1796            ; 03E8 _ C7. 04 24, 00000018(d)
        call    fifo8_status                            ; 03EF _ E8, FFFFFFFC(rel)
        add     ebx, eax                                ; 03F4 _ 01. C3
        mov     dword [esp], timerinfo2.1797            ; 03F6 _ C7. 04 24, 0000003C(d)
        call    fifo8_status                            ; 03FD _ E8, FFFFFFFC(rel)
        add     ebx, eax                                ; 0402 _ 01. C3
        mov     dword [esp], timerinfo3.1798            ; 0404 _ C7. 04 24, 00000060(d)
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
        mov     dword [esp+8H], ?_305                   ; 047D _ C7. 44 24, 08, 00000000(d)
        mov     dword [esp+4H], edx                     ; 0485 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0489 _ 89. 04 24
        call    make_window_title                       ; 048C _ E8, FFFFFFFC(rel)
        mov     eax, dword [sheet_control]              ; 0491 _ A1, 0000000C(d)
        mov     dword [esp+0CH], 1                      ; 0496 _ C7. 44 24, 0C, 00000001
        mov     dword [esp+8H], ?_306                   ; 049E _ C7. 44 24, 08, 00000007(d)
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
        mov     dword [esp+8H], ?_305                   ; 0506 _ C7. 44 24, 08, 00000000(d)
        mov     dword [esp+4H], edx                     ; 050E _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0512 _ 89. 04 24
        call    make_window_title                       ; 0515 _ E8, FFFFFFFC(rel)
        mov     eax, dword [sheet_control]              ; 051A _ A1, 0000000C(d)
        mov     dword [esp+0CH], 0                      ; 051F _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], ?_306                   ; 0527 _ C7. 44 24, 08, 00000007(d)
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

?_008:  mov     dword [esp], timerinfo1.1796            ; 07FD _ C7. 04 24, 00000018(d)
        call    fifo8_status                            ; 0804 _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 0809 _ 85. C0
        jz      ?_009                                   ; 080B _ 74, 13
        call    io_sti                                  ; 080D _ E8, FFFFFFFC(rel)
        mov     dword [esp], timerinfo1.1796            ; 0812 _ C7. 04 24, 00000018(d)
        call    fifo8_get                               ; 0819 _ E8, FFFFFFFC(rel)
        jmp     ?_010                                   ; 081E _ EB, 21

?_009:  mov     dword [esp], timerinfo2.1797            ; 0820 _ C7. 04 24, 0000003C(d)
        call    fifo8_status                            ; 0827 _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 082C _ 85. C0
        jz      ?_010                                   ; 082E _ 74, 11
        call    io_sti                                  ; 0830 _ E8, FFFFFFFC(rel)
        mov     dword [esp], timerinfo2.1797            ; 0835 _ C7. 04 24, 0000003C(d)
        call    fifo8_get                               ; 083C _ E8, FFFFFFFC(rel)
?_010:  mov     dword [esp], timerinfo3.1798            ; 0841 _ C7. 04 24, 00000060(d)
        call    fifo8_status                            ; 0848 _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 084D _ 85. C0
        je      ?_014                                   ; 084F _ 0F 84, 000000DB
        mov     dword [esp], timerinfo3.1798            ; 0855 _ C7. 04 24, 00000060(d)
        call    fifo8_get                               ; 085C _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 0861 _ 89. 45, F4
        call    io_sti                                  ; 0864 _ E8, FFFFFFFC(rel)
        cmp     dword [ebp-0CH], 0                      ; 0869 _ 83. 7D, F4, 00
        jz      ?_011                                   ; 086D _ 74, 24
        mov     dword [esp+8H], 0                       ; 086F _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], timerinfo3.1798         ; 0877 _ C7. 44 24, 04, 00000060(d)
        mov     eax, dword [ebp-30H]                    ; 087F _ 8B. 45, D0
        mov     dword [esp], eax                        ; 0882 _ 89. 04 24
        call    timer_init                              ; 0885 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-54H], 0                      ; 088A _ C7. 45, AC, 00000000
        jmp     ?_012                                   ; 0891 _ EB, 22

?_011:  mov     dword [esp+8H], 1                       ; 0893 _ C7. 44 24, 08, 00000001
        mov     dword [esp+4H], timerinfo3.1798         ; 089B _ C7. 44 24, 04, 00000060(d)
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
        mov     dword [esp+10H], ?_307                  ; 095F _ C7. 44 24, 10, 0000000F(d)
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
        mov     dword [esp+10H], ?_308                  ; 0A41 _ C7. 44 24, 10, 0000001C(d)
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
        mov     dword [esp+8H], table_rgb.1814          ; 0AAE _ C7. 44 24, 08, 00000120(d)
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
        mov     dword [ebp-10H], eax                    ; 0AD8 _ 89. 45, F0
        call    io_cli                                  ; 0ADB _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 0AE0 _ 8B. 45, 08
        mov     dword [esp+4H], eax                     ; 0AE3 _ 89. 44 24, 04
        mov     dword [esp], 968                        ; 0AE7 _ C7. 04 24, 000003C8
        call    io_out8                                 ; 0AEE _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 0AF3 _ 8B. 45, 08
        mov     dword [ebp-0CH], eax                    ; 0AF6 _ 89. 45, F4
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
        add     dword [ebp-0CH], 1                      ; 0B59 _ 83. 45, F4, 01
?_019:  mov     eax, dword [ebp-0CH]                    ; 0B5D _ 8B. 45, F4
        cmp     eax, dword [ebp+0CH]                    ; 0B60 _ 3B. 45, 0C
        jle     ?_018                                   ; 0B63 _ 7E, 96
        mov     eax, dword [ebp-10H]                    ; 0B65 _ 8B. 45, F0
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
        mov     dword [ebp-8H], eax                     ; 0B82 _ 89. 45, F8
        jmp     ?_023                                   ; 0B85 _ EB, 33

?_020:  mov     eax, dword [ebp+14H]                    ; 0B87 _ 8B. 45, 14
        mov     dword [ebp-4H], eax                     ; 0B8A _ 89. 45, FC
        jmp     ?_022                                   ; 0B8D _ EB, 1F

?_021:  mov     eax, dword [ebp-8H]                     ; 0B8F _ 8B. 45, F8
        imul    eax, dword [ebp+0CH]                    ; 0B92 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0B96 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 0B98 _ 8B. 45, FC
        add     eax, edx                                ; 0B9B _ 01. D0
        mov     edx, eax                                ; 0B9D _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0B9F _ 8B. 45, 08
        add     edx, eax                                ; 0BA2 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0BA4 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0BA8 _ 88. 02
        add     dword [ebp-4H], 1                       ; 0BAA _ 83. 45, FC, 01
?_022:  mov     eax, dword [ebp-4H]                     ; 0BAE _ 8B. 45, FC
        cmp     eax, dword [ebp+1CH]                    ; 0BB1 _ 3B. 45, 1C
        jle     ?_021                                   ; 0BB4 _ 7E, D9
        add     dword [ebp-8H], 1                       ; 0BB6 _ 83. 45, F8, 01
?_023:  mov     eax, dword [ebp-8H]                     ; 0BBA _ 8B. 45, F8
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
        movzx   eax, word [?_329]                       ; 0F51 _ 0F B7. 05, 000000A4(d)
        cwde                                            ; 0F58 _ 98
        mov     dword [ebp-4H], eax                     ; 0F59 _ 89. 45, FC
        movzx   eax, word [?_330]                       ; 0F5C _ 0F B7. 05, 000000A6(d)
        cwde                                            ; 0F63 _ 98
        mov     dword [ebp-8H], eax                     ; 0F64 _ 89. 45, F8
        mov     eax, dword [ebp-4H]                     ; 0F67 _ 8B. 45, FC
        sub     eax, 16                                 ; 0F6A _ 83. E8, 10
        mov     edx, eax                                ; 0F6D _ 89. C2
        shr     edx, 31                                 ; 0F6F _ C1. EA, 1F
        add     eax, edx                                ; 0F72 _ 01. D0
        sar     eax, 1                                  ; 0F74 _ D1. F8
        mov     dword [mouse_x], eax                    ; 0F76 _ A3, 000001C8(d)
        mov     eax, dword [ebp-8H]                     ; 0F7B _ 8B. 45, F8
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
        mov     dword [ebp-4H], 0                       ; 11D0 _ C7. 45, FC, 00000000
        jmp     ?_042                                   ; 11D7 _ E9, 0000009C

?_036:  mov     dword [ebp-8H], 0                       ; 11DC _ C7. 45, F8, 00000000
        jmp     ?_041                                   ; 11E3 _ E9, 00000082

?_037:  mov     eax, dword [ebp-4H]                     ; 11E8 _ 8B. 45, FC
        shl     eax, 4                                  ; 11EB _ C1. E0, 04
        mov     edx, eax                                ; 11EE _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 11F0 _ 8B. 45, F8
        add     eax, edx                                ; 11F3 _ 01. D0
        add     eax, cursor.1882                        ; 11F5 _ 05, 00000160(d)
        movzx   eax, byte [eax]                         ; 11FA _ 0F B6. 00
        cmp     al, 42                                  ; 11FD _ 3C, 2A
        jnz     ?_038                                   ; 11FF _ 75, 19
        mov     eax, dword [ebp-4H]                     ; 1201 _ 8B. 45, FC
        shl     eax, 4                                  ; 1204 _ C1. E0, 04
        mov     edx, eax                                ; 1207 _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 1209 _ 8B. 45, F8
        add     eax, edx                                ; 120C _ 01. D0
        mov     edx, eax                                ; 120E _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 1210 _ 8B. 45, 08
        add     eax, edx                                ; 1213 _ 01. D0
        mov     byte [eax], 0                           ; 1215 _ C6. 00, 00
        jmp     ?_040                                   ; 1218 _ EB, 4C

?_038:  mov     eax, dword [ebp-4H]                     ; 121A _ 8B. 45, FC
        shl     eax, 4                                  ; 121D _ C1. E0, 04
        mov     edx, eax                                ; 1220 _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 1222 _ 8B. 45, F8
        add     eax, edx                                ; 1225 _ 01. D0
        add     eax, cursor.1882                        ; 1227 _ 05, 00000160(d)
        movzx   eax, byte [eax]                         ; 122C _ 0F B6. 00
        cmp     al, 79                                  ; 122F _ 3C, 4F
        jnz     ?_039                                   ; 1231 _ 75, 19
        mov     eax, dword [ebp-4H]                     ; 1233 _ 8B. 45, FC
        shl     eax, 4                                  ; 1236 _ C1. E0, 04
        mov     edx, eax                                ; 1239 _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 123B _ 8B. 45, F8
        add     eax, edx                                ; 123E _ 01. D0
        mov     edx, eax                                ; 1240 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 1242 _ 8B. 45, 08
        add     eax, edx                                ; 1245 _ 01. D0
        mov     byte [eax], 7                           ; 1247 _ C6. 00, 07
        jmp     ?_040                                   ; 124A _ EB, 1A

?_039:  mov     eax, dword [ebp-4H]                     ; 124C _ 8B. 45, FC
        shl     eax, 4                                  ; 124F _ C1. E0, 04
        mov     edx, eax                                ; 1252 _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 1254 _ 8B. 45, F8
        add     eax, edx                                ; 1257 _ 01. D0
        mov     edx, eax                                ; 1259 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 125B _ 8B. 45, 08
        add     edx, eax                                ; 125E _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 1260 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 1264 _ 88. 02
?_040:  add     dword [ebp-8H], 1                       ; 1266 _ 83. 45, F8, 01
?_041:  cmp     dword [ebp-8H], 15                      ; 126A _ 83. 7D, F8, 0F
        jle     ?_037                                   ; 126E _ 0F 8E, FFFFFF74
        add     dword [ebp-4H], 1                       ; 1274 _ 83. 45, FC, 01
?_042:  cmp     dword [ebp-4H], 15                      ; 1278 _ 83. 7D, FC, 0F
        jle     ?_036                                   ; 127C _ 0F 8E, FFFFFF5A
        leave                                           ; 1282 _ C9
        ret                                             ; 1283 _ C3
; init_mouse_cursor End of function

paint_block:; Function begin
        push    ebp                                     ; 1284 _ 55
        mov     ebp, esp                                ; 1285 _ 89. E5
        sub     esp, 16                                 ; 1287 _ 83. EC, 10
        mov     dword [ebp-4H], 0                       ; 128A _ C7. 45, FC, 00000000
        jmp     ?_046                                   ; 1291 _ EB, 50

?_043:  mov     dword [ebp-8H], 0                       ; 1293 _ C7. 45, F8, 00000000
        jmp     ?_045                                   ; 129A _ EB, 3B

?_044:  mov     eax, dword [ebp-4H]                     ; 129C _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 129F _ 8B. 55, 14
        add     eax, edx                                ; 12A2 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 12A4 _ 0F AF. 45, 0C
        mov     edx, dword [ebp-8H]                     ; 12A8 _ 8B. 55, F8
        mov     ecx, dword [ebp+10H]                    ; 12AB _ 8B. 4D, 10
        add     edx, ecx                                ; 12AE _ 01. CA
        add     eax, edx                                ; 12B0 _ 01. D0
        mov     edx, eax                                ; 12B2 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 12B4 _ 8B. 45, 08
        add     edx, eax                                ; 12B7 _ 01. C2
        mov     eax, dword [ebp-4H]                     ; 12B9 _ 8B. 45, FC
        imul    eax, dword [ebp+18H]                    ; 12BC _ 0F AF. 45, 18
        mov     ecx, eax                                ; 12C0 _ 89. C1
        mov     eax, dword [ebp-8H]                     ; 12C2 _ 8B. 45, F8
        add     eax, ecx                                ; 12C5 _ 01. C8
        mov     ecx, eax                                ; 12C7 _ 89. C1
        mov     eax, dword [ebp+20H]                    ; 12C9 _ 8B. 45, 20
        add     eax, ecx                                ; 12CC _ 01. C8
        movzx   eax, byte [eax]                         ; 12CE _ 0F B6. 00
        mov     byte [edx], al                          ; 12D1 _ 88. 02
        add     dword [ebp-8H], 1                       ; 12D3 _ 83. 45, F8, 01
?_045:  mov     eax, dword [ebp-8H]                     ; 12D7 _ 8B. 45, F8
        cmp     eax, dword [ebp+18H]                    ; 12DA _ 3B. 45, 18
        jl      ?_044                                   ; 12DD _ 7C, BD
        add     dword [ebp-4H], 1                       ; 12DF _ 83. 45, FC, 01
?_046:  mov     eax, dword [ebp-4H]                     ; 12E3 _ 8B. 45, FC
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
?_048:  movzx   eax, word [?_329]                       ; 138A _ 0F B7. 05, 000000A4(d)
        cwde                                            ; 1391 _ 98
        lea     edx, [eax-10H]                          ; 1392 _ 8D. 50, F0
        mov     eax, dword [mouse_x]                    ; 1395 _ A1, 000001C8(d)
        cmp     edx, eax                                ; 139A _ 39. C2
        jge     ?_049                                   ; 139C _ 7D, 10
        movzx   eax, word [?_329]                       ; 139E _ 0F B7. 05, 000000A4(d)
        cwde                                            ; 13A5 _ 98
        sub     eax, 16                                 ; 13A6 _ 83. E8, 10
        mov     dword [mouse_x], eax                    ; 13A9 _ A3, 000001C8(d)
?_049:  movzx   eax, word [?_329]                       ; 13AE _ 0F B7. 05, 000000A4(d)
        cwde                                            ; 13B5 _ 98
        lea     edx, [eax-10H]                          ; 13B6 _ 8D. 50, F0
        mov     eax, dword [mouse_y]                    ; 13B9 _ A1, 000001CC(d)
        cmp     edx, eax                                ; 13BE _ 39. C2
        jge     ?_050                                   ; 13C0 _ 7D, 10
        movzx   eax, word [?_329]                       ; 13C2 _ 0F B7. 05, 000000A4(d)
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
        mov     dword [ebp-0CH], 0                      ; 1489 _ C7. 45, F4, 00000000
        mov     dword [ebp-10H], 0                      ; 1490 _ C7. 45, F0, 00000000
        mov     dword [ebp-14H], 104                    ; 1497 _ C7. 45, EC, 00000068
        mov     eax, dword [screen_info]                ; 149E _ A1, 000000A0(d)
        mov     dword [ebp-18H], eax                    ; 14A3 _ 89. 45, E8
        movzx   eax, word [?_329]                       ; 14A6 _ 0F B7. 05, 000000A4(d)
        cwde                                            ; 14AD _ 98
        mov     dword [ebp-1CH], eax                    ; 14AE _ 89. 45, E4
        movzx   eax, word [?_330]                       ; 14B1 _ 0F B7. 05, 000000A6(d)
        cwde                                            ; 14B8 _ 98
        mov     dword [ebp-20H], eax                    ; 14B9 _ 89. 45, E0
        mov     eax, dword [ebp+0CH]                    ; 14BC _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 14BF _ 8B. 00
        mov     edx, dword [ebp-20H]                    ; 14C1 _ 8B. 55, E0
        mov     dword [esp+8H], edx                     ; 14C4 _ 89. 54 24, 08
        mov     edx, dword [ebp-1CH]                    ; 14C8 _ 8B. 55, E4
        mov     dword [esp+4H], edx                     ; 14CB _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 14CF _ 89. 04 24
        call    init_desktop                            ; 14D2 _ E8, FFFFFFFC(rel)
        mov     dword [esp+14H], 7                      ; 14D7 _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_309                  ; 14DF _ C7. 44 24, 10, 0000001E(d)
        mov     eax, dword [ebp-10H]                    ; 14E7 _ 8B. 45, F0
        mov     dword [esp+0CH], eax                    ; 14EA _ 89. 44 24, 0C
        mov     eax, dword [ebp-0CH]                    ; 14EE _ 8B. 45, F4
        mov     dword [esp+8H], eax                     ; 14F1 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 14F5 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 14F8 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 14FC _ 8B. 45, 08
        mov     dword [esp], eax                        ; 14FF _ 89. 04 24
        call    paint_string                            ; 1502 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+14H]                    ; 1507 _ 8B. 45, 14
        mov     dword [esp], eax                        ; 150A _ 89. 04 24
        call    intToHexStr                             ; 150D _ E8, FFFFFFFC(rel)
        mov     dword [ebp-24H], eax                    ; 1512 _ 89. 45, DC
        mov     dword [esp+14H], 7                      ; 1515 _ C7. 44 24, 14, 00000007
        mov     eax, dword [ebp-24H]                    ; 151D _ 8B. 45, DC
        mov     dword [esp+10H], eax                    ; 1520 _ 89. 44 24, 10
        mov     eax, dword [ebp-10H]                    ; 1524 _ 8B. 45, F0
        mov     dword [esp+0CH], eax                    ; 1527 _ 89. 44 24, 0C
        mov     eax, dword [ebp-14H]                    ; 152B _ 8B. 45, EC
        mov     dword [esp+8H], eax                     ; 152E _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 1532 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 1535 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1539 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 153C _ 89. 04 24
        call    paint_string                            ; 153F _ E8, FFFFFFFC(rel)
        add     dword [ebp-10H], 16                     ; 1544 _ 83. 45, F0, 10
        mov     dword [esp+14H], 7                      ; 1548 _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_310                  ; 1550 _ C7. 44 24, 10, 00000028(d)
        mov     eax, dword [ebp-10H]                    ; 1558 _ 8B. 45, F0
        mov     dword [esp+0CH], eax                    ; 155B _ 89. 44 24, 0C
        mov     eax, dword [ebp-0CH]                    ; 155F _ 8B. 45, F4
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
        mov     dword [ebp-28H], eax                    ; 1585 _ 89. 45, D8
        mov     dword [esp+14H], 7                      ; 1588 _ C7. 44 24, 14, 00000007
        mov     eax, dword [ebp-28H]                    ; 1590 _ 8B. 45, D8
        mov     dword [esp+10H], eax                    ; 1593 _ 89. 44 24, 10
        mov     eax, dword [ebp-10H]                    ; 1597 _ 8B. 45, F0
        mov     dword [esp+0CH], eax                    ; 159A _ 89. 44 24, 0C
        mov     eax, dword [ebp-14H]                    ; 159E _ 8B. 45, EC
        mov     dword [esp+8H], eax                     ; 15A1 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 15A5 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 15A8 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 15AC _ 8B. 45, 08
        mov     dword [esp], eax                        ; 15AF _ 89. 04 24
        call    paint_string                            ; 15B2 _ E8, FFFFFFFC(rel)
        add     dword [ebp-10H], 16                     ; 15B7 _ 83. 45, F0, 10
        mov     dword [esp+14H], 7                      ; 15BB _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_311                  ; 15C3 _ C7. 44 24, 10, 00000034(d)
        mov     eax, dword [ebp-10H]                    ; 15CB _ 8B. 45, F0
        mov     dword [esp+0CH], eax                    ; 15CE _ 89. 44 24, 0C
        mov     eax, dword [ebp-0CH]                    ; 15D2 _ 8B. 45, F4
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
        mov     dword [ebp-2CH], eax                    ; 15F9 _ 89. 45, D4
        mov     dword [esp+14H], 7                      ; 15FC _ C7. 44 24, 14, 00000007
        mov     eax, dword [ebp-2CH]                    ; 1604 _ 8B. 45, D4
        mov     dword [esp+10H], eax                    ; 1607 _ 89. 44 24, 10
        mov     eax, dword [ebp-10H]                    ; 160B _ 8B. 45, F0
        mov     dword [esp+0CH], eax                    ; 160E _ 89. 44 24, 0C
        mov     eax, dword [ebp-14H]                    ; 1612 _ 8B. 45, EC
        mov     dword [esp+8H], eax                     ; 1615 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 1619 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 161C _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1620 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1623 _ 89. 04 24
        call    paint_string                            ; 1626 _ E8, FFFFFFFC(rel)
        add     dword [ebp-10H], 16                     ; 162B _ 83. 45, F0, 10
        mov     dword [esp+14H], 7                      ; 162F _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_312                  ; 1637 _ C7. 44 24, 10, 00000040(d)
        mov     eax, dword [ebp-10H]                    ; 163F _ 8B. 45, F0
        mov     dword [esp+0CH], eax                    ; 1642 _ 89. 44 24, 0C
        mov     eax, dword [ebp-0CH]                    ; 1646 _ 8B. 45, F4
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
        mov     dword [ebp-30H], eax                    ; 166D _ 89. 45, D0
        mov     dword [esp+14H], 7                      ; 1670 _ C7. 44 24, 14, 00000007
        mov     eax, dword [ebp-30H]                    ; 1678 _ 8B. 45, D0
        mov     dword [esp+10H], eax                    ; 167B _ 89. 44 24, 10
        mov     eax, dword [ebp-10H]                    ; 167F _ 8B. 45, F0
        mov     dword [esp+0CH], eax                    ; 1682 _ 89. 44 24, 0C
        mov     eax, dword [ebp-14H]                    ; 1686 _ 8B. 45, EC
        mov     dword [esp+8H], eax                     ; 1689 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 168D _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 1690 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1694 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1697 _ 89. 04 24
        call    paint_string                            ; 169A _ E8, FFFFFFFC(rel)
        add     dword [ebp-10H], 16                     ; 169F _ 83. 45, F0, 10
        mov     dword [esp+14H], 7                      ; 16A3 _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_313                  ; 16AB _ C7. 44 24, 10, 0000004C(d)
        mov     eax, dword [ebp-10H]                    ; 16B3 _ 8B. 45, F0
        mov     dword [esp+0CH], eax                    ; 16B6 _ 89. 44 24, 0C
        mov     eax, dword [ebp-0CH]                    ; 16BA _ 8B. 45, F4
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
        mov     dword [ebp-34H], eax                    ; 16E1 _ 89. 45, CC
        mov     dword [esp+14H], 7                      ; 16E4 _ C7. 44 24, 14, 00000007
        mov     eax, dword [ebp-34H]                    ; 16EC _ 8B. 45, CC
        mov     dword [esp+10H], eax                    ; 16EF _ 89. 44 24, 10
        mov     eax, dword [ebp-10H]                    ; 16F3 _ 8B. 45, F0
        mov     dword [esp+0CH], eax                    ; 16F6 _ 89. 44 24, 0C
        mov     eax, dword [ebp-14H]                    ; 16FA _ 8B. 45, EC
        mov     dword [esp+8H], eax                     ; 16FD _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 1701 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 1704 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1708 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 170B _ 89. 04 24
        call    paint_string                            ; 170E _ E8, FFFFFFFC(rel)
        add     dword [ebp-10H], 16                     ; 1713 _ 83. 45, F0, 10
        mov     dword [esp+14H], 7                      ; 1717 _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_314                  ; 171F _ C7. 44 24, 10, 00000059(d)
        mov     eax, dword [ebp-10H]                    ; 1727 _ 8B. 45, F0
        mov     dword [esp+0CH], eax                    ; 172A _ 89. 44 24, 0C
        mov     eax, dword [ebp-0CH]                    ; 172E _ 8B. 45, F4
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
        mov     dword [ebp-38H], eax                    ; 1755 _ 89. 45, C8
        mov     dword [esp+14H], 7                      ; 1758 _ C7. 44 24, 14, 00000007
        mov     eax, dword [ebp-38H]                    ; 1760 _ 8B. 45, C8
        mov     dword [esp+10H], eax                    ; 1763 _ 89. 44 24, 10
        mov     eax, dword [ebp-10H]                    ; 1767 _ 8B. 45, F0
        mov     dword [esp+0CH], eax                    ; 176A _ 89. 44 24, 0C
        mov     eax, dword [ebp-14H]                    ; 176E _ 8B. 45, EC
        mov     dword [esp+8H], eax                     ; 1771 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 1775 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 1778 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 177C _ 8B. 45, 08
        mov     dword [esp], eax                        ; 177F _ 89. 04 24
        call    paint_string                            ; 1782 _ E8, FFFFFFFC(rel)
        add     dword [ebp-10H], 16                     ; 1787 _ 83. 45, F0, 10
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
        mov     dword [ebp-0CH], eax                    ; 179E _ 89. 45, F4
        mov     eax, dword [memman]                     ; 17A1 _ A1, 00000000(d)
        mov     dword [esp+4H], 10880                   ; 17A6 _ C7. 44 24, 04, 00002A80
        mov     dword [esp], eax                        ; 17AE _ 89. 04 24
        call    memman_alloc_4k                         ; 17B1 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 17B6 _ 89. 45, F0
        mov     dword [esp+10H], 99                     ; 17B9 _ C7. 44 24, 10, 00000063
        mov     dword [esp+0CH], 68                     ; 17C1 _ C7. 44 24, 0C, 00000044
        mov     dword [esp+8H], 160                     ; 17C9 _ C7. 44 24, 08, 000000A0
        mov     eax, dword [ebp-10H]                    ; 17D1 _ 8B. 45, F0
        mov     dword [esp+4H], eax                     ; 17D4 _ 89. 44 24, 04
        mov     eax, dword [ebp-0CH]                    ; 17D8 _ 8B. 45, F4
        mov     dword [esp], eax                        ; 17DB _ 89. 04 24
        call    sheet_setbuf                            ; 17DE _ E8, FFFFFFFC(rel)
        mov     dword [esp+0CH], 1                      ; 17E3 _ C7. 44 24, 0C, 00000001
        mov     eax, dword [ebp+0CH]                    ; 17EB _ 8B. 45, 0C
        mov     dword [esp+8H], eax                     ; 17EE _ 89. 44 24, 08
        mov     eax, dword [ebp-0CH]                    ; 17F2 _ 8B. 45, F4
        mov     dword [esp+4H], eax                     ; 17F5 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 17F9 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 17FC _ 89. 04 24
        call    make_windows                            ; 17FF _ E8, FFFFFFFC(rel)
        mov     dword [esp+14H], 7                      ; 1804 _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], 16                     ; 180C _ C7. 44 24, 10, 00000010
        mov     dword [esp+0CH], 144                    ; 1814 _ C7. 44 24, 0C, 00000090
        mov     dword [esp+8H], 28                      ; 181C _ C7. 44 24, 08, 0000001C
        mov     dword [esp+4H], 8                       ; 1824 _ C7. 44 24, 04, 00000008
        mov     eax, dword [ebp-0CH]                    ; 182C _ 8B. 45, F4
        mov     dword [esp], eax                        ; 182F _ 89. 04 24
        call    make_textbox                            ; 1832 _ E8, FFFFFFFC(rel)
        mov     dword [esp+0CH], 172                    ; 1837 _ C7. 44 24, 0C, 000000AC
        mov     dword [esp+8H], 260                     ; 183F _ C7. 44 24, 08, 00000104
        mov     eax, dword [ebp-0CH]                    ; 1847 _ 8B. 45, F4
        mov     dword [esp+4H], eax                     ; 184A _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 184E _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1851 _ 89. 04 24
        call    sheet_slide                             ; 1854 _ E8, FFFFFFFC(rel)
        mov     dword [esp+8H], 2                       ; 1859 _ C7. 44 24, 08, 00000002
        mov     eax, dword [ebp-0CH]                    ; 1861 _ 8B. 45, F4
        mov     dword [esp+4H], eax                     ; 1864 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1868 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 186B _ 89. 04 24
        call    sheet_updown                            ; 186E _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 1873 _ 8B. 45, F4
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
        mov     dword [ebp-10H], eax                    ; 1889 _ 89. 45, F0
        mov     eax, dword [ebp+18H]                    ; 188C _ 8B. 45, 18
        mov     edx, dword [ebp+10H]                    ; 188F _ 8B. 55, 10
        add     eax, edx                                ; 1892 _ 01. D0
        mov     dword [ebp-14H], eax                    ; 1894 _ 89. 45, EC
        mov     eax, dword [ebp+10H]                    ; 1897 _ 8B. 45, 10
        lea     edi, [eax-3H]                           ; 189A _ 8D. 78, FD
        mov     eax, dword [ebp-10H]                    ; 189D _ 8B. 45, F0
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
        mov     eax, dword [ebp-14H]                    ; 18DE _ 8B. 45, EC
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
        mov     eax, dword [ebp-14H]                    ; 1925 _ 8B. 45, EC
        lea     edi, [eax+2H]                           ; 1928 _ 8D. 78, 02
        mov     eax, dword [ebp-10H]                    ; 192B _ 8B. 45, F0
        lea     esi, [eax+1H]                           ; 192E _ 8D. 70, 01
        mov     eax, dword [ebp-14H]                    ; 1931 _ 8B. 45, EC
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
        mov     eax, dword [ebp-14H]                    ; 196C _ 8B. 45, EC
        lea     edi, [eax+2H]                           ; 196F _ 8D. 78, 02
        mov     eax, dword [ebp-10H]                    ; 1972 _ 8B. 45, F0
        lea     esi, [eax+2H]                           ; 1975 _ 8D. 70, 02
        mov     eax, dword [ebp+10H]                    ; 1978 _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 197B _ 8D. 58, FD
        mov     eax, dword [ebp-10H]                    ; 197E _ 8B. 45, F0
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
        mov     ecx, dword [ebp-10H]                    ; 19D4 _ 8B. 4D, F0
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
        mov     ecx, dword [ebp-14H]                    ; 1A14 _ 8B. 4D, EC
        mov     dword [esp+18H], ecx                    ; 1A17 _ 89. 4C 24, 18
        mov     dword [esp+14H], edi                    ; 1A1B _ 89. 7C 24, 14
        mov     dword [esp+10H], esi                    ; 1A1F _ 89. 74 24, 10
        mov     dword [esp+0CH], ebx                    ; 1A23 _ 89. 5C 24, 0C
        mov     dword [esp+8H], 0                       ; 1A27 _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], edx                     ; 1A2F _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1A33 _ 89. 04 24
        call    paint_rectangle                         ; 1A36 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-14H]                    ; 1A3B _ 8B. 45, EC
        lea     ecx, [eax+1H]                           ; 1A3E _ 8D. 48, 01
        mov     eax, dword [ebp-14H]                    ; 1A41 _ 8B. 45, EC
        lea     esi, [eax+1H]                           ; 1A44 _ 8D. 70, 01
        mov     eax, dword [ebp+0CH]                    ; 1A47 _ 8B. 45, 0C
        lea     ebx, [eax-2H]                           ; 1A4A _ 8D. 58, FE
        mov     eax, dword [ebp+8H]                     ; 1A4D _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 1A50 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1A53 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1A56 _ 8B. 00
        mov     dword [esp+18H], ecx                    ; 1A58 _ 89. 4C 24, 18
        mov     ecx, dword [ebp-10H]                    ; 1A5C _ 8B. 4D, F0
        mov     dword [esp+14H], ecx                    ; 1A5F _ 89. 4C 24, 14
        mov     dword [esp+10H], esi                    ; 1A63 _ 89. 74 24, 10
        mov     dword [esp+0CH], ebx                    ; 1A67 _ 89. 5C 24, 0C
        mov     dword [esp+8H], 8                       ; 1A6B _ C7. 44 24, 08, 00000008
        mov     dword [esp+4H], edx                     ; 1A73 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1A77 _ 89. 04 24
        call    paint_rectangle                         ; 1A7A _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-14H]                    ; 1A7F _ 8B. 45, EC
        lea     edi, [eax+1H]                           ; 1A82 _ 8D. 78, 01
        mov     eax, dword [ebp-10H]                    ; 1A85 _ 8B. 45, F0
        lea     esi, [eax+1H]                           ; 1A88 _ 8D. 70, 01
        mov     eax, dword [ebp+10H]                    ; 1A8B _ 8B. 45, 10
        lea     ebx, [eax-2H]                           ; 1A8E _ 8D. 58, FE
        mov     eax, dword [ebp-10H]                    ; 1A91 _ 8B. 45, F0
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
        mov     ebx, dword [ebp-14H]                    ; 1AE3 _ 8B. 5D, EC
        mov     dword [esp+18H], ebx                    ; 1AE6 _ 89. 5C 24, 18
        mov     ebx, dword [ebp-10H]                    ; 1AEA _ 8B. 5D, F0
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
        mov     dword [ebp-0CH], eax                    ; 1B24 _ 89. 45, F4
        mov     eax, dword [ebp+0CH]                    ; 1B27 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 1B2A _ 8B. 40, 08
        mov     dword [ebp-10H], eax                    ; 1B2D _ 89. 45, F0
        mov     eax, dword [ebp-0CH]                    ; 1B30 _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 1B33 _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 1B36 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1B39 _ 8B. 00
        mov     dword [esp+18H], 0                      ; 1B3B _ C7. 44 24, 18, 00000000
        mov     dword [esp+14H], edx                    ; 1B43 _ 89. 54 24, 14
        mov     dword [esp+10H], 0                      ; 1B47 _ C7. 44 24, 10, 00000000
        mov     dword [esp+0CH], 0                      ; 1B4F _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 8                       ; 1B57 _ C7. 44 24, 08, 00000008
        mov     edx, dword [ebp-0CH]                    ; 1B5F _ 8B. 55, F4
        mov     dword [esp+4H], edx                     ; 1B62 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1B66 _ 89. 04 24
        call    paint_rectangle                         ; 1B69 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 1B6E _ 8B. 45, F4
        lea     edx, [eax-2H]                           ; 1B71 _ 8D. 50, FE
        mov     eax, dword [ebp+0CH]                    ; 1B74 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1B77 _ 8B. 00
        mov     dword [esp+18H], 1                      ; 1B79 _ C7. 44 24, 18, 00000001
        mov     dword [esp+14H], edx                    ; 1B81 _ 89. 54 24, 14
        mov     dword [esp+10H], 1                      ; 1B85 _ C7. 44 24, 10, 00000001
        mov     dword [esp+0CH], 1                      ; 1B8D _ C7. 44 24, 0C, 00000001
        mov     dword [esp+8H], 7                       ; 1B95 _ C7. 44 24, 08, 00000007
        mov     edx, dword [ebp-0CH]                    ; 1B9D _ 8B. 55, F4
        mov     dword [esp+4H], edx                     ; 1BA0 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1BA4 _ 89. 04 24
        call    paint_rectangle                         ; 1BA7 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 1BAC _ 8B. 45, F0
        lea     edx, [eax-1H]                           ; 1BAF _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 1BB2 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1BB5 _ 8B. 00
        mov     dword [esp+18H], edx                    ; 1BB7 _ 89. 54 24, 18
        mov     dword [esp+14H], 0                      ; 1BBB _ C7. 44 24, 14, 00000000
        mov     dword [esp+10H], 0                      ; 1BC3 _ C7. 44 24, 10, 00000000
        mov     dword [esp+0CH], 0                      ; 1BCB _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 8                       ; 1BD3 _ C7. 44 24, 08, 00000008
        mov     edx, dword [ebp-0CH]                    ; 1BDB _ 8B. 55, F4
        mov     dword [esp+4H], edx                     ; 1BDE _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1BE2 _ 89. 04 24
        call    paint_rectangle                         ; 1BE5 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 1BEA _ 8B. 45, F0
        lea     edx, [eax-1H]                           ; 1BED _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 1BF0 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1BF3 _ 8B. 00
        mov     dword [esp+18H], edx                    ; 1BF5 _ 89. 54 24, 18
        mov     dword [esp+14H], 1                      ; 1BF9 _ C7. 44 24, 14, 00000001
        mov     dword [esp+10H], 1                      ; 1C01 _ C7. 44 24, 10, 00000001
        mov     dword [esp+0CH], 1                      ; 1C09 _ C7. 44 24, 0C, 00000001
        mov     dword [esp+8H], 7                       ; 1C11 _ C7. 44 24, 08, 00000007
        mov     edx, dword [ebp-0CH]                    ; 1C19 _ 8B. 55, F4
        mov     dword [esp+4H], edx                     ; 1C1C _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1C20 _ 89. 04 24
        call    paint_rectangle                         ; 1C23 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 1C28 _ 8B. 45, F0
        lea     ebx, [eax-2H]                           ; 1C2B _ 8D. 58, FE
        mov     eax, dword [ebp-0CH]                    ; 1C2E _ 8B. 45, F4
        lea     ecx, [eax-2H]                           ; 1C31 _ 8D. 48, FE
        mov     eax, dword [ebp-0CH]                    ; 1C34 _ 8B. 45, F4
        lea     edx, [eax-2H]                           ; 1C37 _ 8D. 50, FE
        mov     eax, dword [ebp+0CH]                    ; 1C3A _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1C3D _ 8B. 00
        mov     dword [esp+18H], ebx                    ; 1C3F _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 1C43 _ 89. 4C 24, 14
        mov     dword [esp+10H], 1                      ; 1C47 _ C7. 44 24, 10, 00000001
        mov     dword [esp+0CH], edx                    ; 1C4F _ 89. 54 24, 0C
        mov     dword [esp+8H], 15                      ; 1C53 _ C7. 44 24, 08, 0000000F
        mov     edx, dword [ebp-0CH]                    ; 1C5B _ 8B. 55, F4
        mov     dword [esp+4H], edx                     ; 1C5E _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1C62 _ 89. 04 24
        call    paint_rectangle                         ; 1C65 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 1C6A _ 8B. 45, F0
        lea     ebx, [eax-1H]                           ; 1C6D _ 8D. 58, FF
        mov     eax, dword [ebp-0CH]                    ; 1C70 _ 8B. 45, F4
        lea     ecx, [eax-1H]                           ; 1C73 _ 8D. 48, FF
        mov     eax, dword [ebp-0CH]                    ; 1C76 _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 1C79 _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 1C7C _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1C7F _ 8B. 00
        mov     dword [esp+18H], ebx                    ; 1C81 _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 1C85 _ 89. 4C 24, 14
        mov     dword [esp+10H], 0                      ; 1C89 _ C7. 44 24, 10, 00000000
        mov     dword [esp+0CH], edx                    ; 1C91 _ 89. 54 24, 0C
        mov     dword [esp+8H], 0                       ; 1C95 _ C7. 44 24, 08, 00000000
        mov     edx, dword [ebp-0CH]                    ; 1C9D _ 8B. 55, F4
        mov     dword [esp+4H], edx                     ; 1CA0 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1CA4 _ 89. 04 24
        call    paint_rectangle                         ; 1CA7 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 1CAC _ 8B. 45, F0
        lea     ecx, [eax-3H]                           ; 1CAF _ 8D. 48, FD
        mov     eax, dword [ebp-0CH]                    ; 1CB2 _ 8B. 45, F4
        lea     edx, [eax-3H]                           ; 1CB5 _ 8D. 50, FD
        mov     eax, dword [ebp+0CH]                    ; 1CB8 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1CBB _ 8B. 00
        mov     dword [esp+18H], ecx                    ; 1CBD _ 89. 4C 24, 18
        mov     dword [esp+14H], edx                    ; 1CC1 _ 89. 54 24, 14
        mov     dword [esp+10H], 2                      ; 1CC5 _ C7. 44 24, 10, 00000002
        mov     dword [esp+0CH], 2                      ; 1CCD _ C7. 44 24, 0C, 00000002
        mov     dword [esp+8H], 8                       ; 1CD5 _ C7. 44 24, 08, 00000008
        mov     edx, dword [ebp-0CH]                    ; 1CDD _ 8B. 55, F4
        mov     dword [esp+4H], edx                     ; 1CE0 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1CE4 _ 89. 04 24
        call    paint_rectangle                         ; 1CE7 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 1CEC _ 8B. 45, F4
        lea     edx, [eax-4H]                           ; 1CEF _ 8D. 50, FC
        mov     eax, dword [ebp+0CH]                    ; 1CF2 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1CF5 _ 8B. 00
        mov     dword [esp+18H], 20                     ; 1CF7 _ C7. 44 24, 18, 00000014
        mov     dword [esp+14H], edx                    ; 1CFF _ 89. 54 24, 14
        mov     dword [esp+10H], 3                      ; 1D03 _ C7. 44 24, 10, 00000003
        mov     dword [esp+0CH], 3                      ; 1D0B _ C7. 44 24, 0C, 00000003
        mov     dword [esp+8H], 12                      ; 1D13 _ C7. 44 24, 08, 0000000C
        mov     edx, dword [ebp-0CH]                    ; 1D1B _ 8B. 55, F4
        mov     dword [esp+4H], edx                     ; 1D1E _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1D22 _ 89. 04 24
        call    paint_rectangle                         ; 1D25 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 1D2A _ 8B. 45, F0
        lea     ebx, [eax-2H]                           ; 1D2D _ 8D. 58, FE
        mov     eax, dword [ebp-0CH]                    ; 1D30 _ 8B. 45, F4
        lea     ecx, [eax-2H]                           ; 1D33 _ 8D. 48, FE
        mov     eax, dword [ebp-10H]                    ; 1D36 _ 8B. 45, F0
        lea     edx, [eax-2H]                           ; 1D39 _ 8D. 50, FE
        mov     eax, dword [ebp+0CH]                    ; 1D3C _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1D3F _ 8B. 00
        mov     dword [esp+18H], ebx                    ; 1D41 _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 1D45 _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 1D49 _ 89. 54 24, 10
        mov     dword [esp+0CH], 1                      ; 1D4D _ C7. 44 24, 0C, 00000001
        mov     dword [esp+8H], 15                      ; 1D55 _ C7. 44 24, 08, 0000000F
        mov     edx, dword [ebp-0CH]                    ; 1D5D _ 8B. 55, F4
        mov     dword [esp+4H], edx                     ; 1D60 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1D64 _ 89. 04 24
        call    paint_rectangle                         ; 1D67 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 1D6C _ 8B. 45, F0
        lea     ebx, [eax-1H]                           ; 1D6F _ 8D. 58, FF
        mov     eax, dword [ebp-0CH]                    ; 1D72 _ 8B. 45, F4
        lea     ecx, [eax-1H]                           ; 1D75 _ 8D. 48, FF
        mov     eax, dword [ebp-10H]                    ; 1D78 _ 8B. 45, F0
        lea     edx, [eax-1H]                           ; 1D7B _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 1D7E _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1D81 _ 8B. 00
        mov     dword [esp+18H], ebx                    ; 1D83 _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 1D87 _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 1D8B _ 89. 54 24, 10
        mov     dword [esp+0CH], 0                      ; 1D8F _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 0                       ; 1D97 _ C7. 44 24, 08, 00000000
        mov     edx, dword [ebp-0CH]                    ; 1D9F _ 8B. 55, F4
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
        mov     byte [ebp-13H], 12                      ; 1DEC _ C6. 45, ED, 0C
        jmp     ?_053                                   ; 1DF0 _ EB, 08

?_052:  mov     byte [ebp-12H], 8                       ; 1DF2 _ C6. 45, EE, 08
        mov     byte [ebp-13H], 15                      ; 1DF6 _ C6. 45, ED, 0F
?_053:  mov     eax, dword [ebp+0CH]                    ; 1DFA _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 1DFD _ 8B. 40, 04
        lea     ebx, [eax-4H]                           ; 1E00 _ 8D. 58, FC
        movzx   eax, byte [ebp-13H]                     ; 1E03 _ 0F B6. 45, ED
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
        mov     dword [ebp-10H], 0                      ; 1E72 _ C7. 45, F0, 00000000
        jmp     ?_061                                   ; 1E79 _ E9, 00000083

?_054:  mov     dword [ebp-0CH], 0                      ; 1E7E _ C7. 45, F4, 00000000
        jmp     ?_060                                   ; 1E85 _ EB, 70

?_055:  mov     eax, dword [ebp-10H]                    ; 1E87 _ 8B. 45, F0
        shl     eax, 4                                  ; 1E8A _ C1. E0, 04
        mov     edx, eax                                ; 1E8D _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 1E8F _ 8B. 45, F4
        add     eax, edx                                ; 1E92 _ 01. D0
        add     eax, closebtn.1969                      ; 1E94 _ 05, 00000260(d)
        movzx   eax, byte [eax]                         ; 1E99 _ 0F B6. 00
        mov     byte [ebp-11H], al                      ; 1E9C _ 88. 45, EF
        cmp     byte [ebp-11H], 64                      ; 1E9F _ 80. 7D, EF, 40
        jnz     ?_056                                   ; 1EA3 _ 75, 06
        mov     byte [ebp-11H], 0                       ; 1EA5 _ C6. 45, EF, 00
        jmp     ?_059                                   ; 1EA9 _ EB, 1C

?_056:  cmp     byte [ebp-11H], 36                      ; 1EAB _ 80. 7D, EF, 24
        jnz     ?_057                                   ; 1EAF _ 75, 06
        mov     byte [ebp-11H], 15                      ; 1EB1 _ C6. 45, EF, 0F
        jmp     ?_059                                   ; 1EB5 _ EB, 10

?_057:  cmp     byte [ebp-11H], 81                      ; 1EB7 _ 80. 7D, EF, 51
        jnz     ?_058                                   ; 1EBB _ 75, 06
        mov     byte [ebp-11H], 8                       ; 1EBD _ C6. 45, EF, 08
        jmp     ?_059                                   ; 1EC1 _ EB, 04

?_058:  mov     byte [ebp-11H], 7                       ; 1EC3 _ C6. 45, EF, 07
?_059:  mov     eax, dword [ebp+0CH]                    ; 1EC7 _ 8B. 45, 0C
        mov     edx, dword [eax]                        ; 1ECA _ 8B. 10
        mov     eax, dword [ebp-10H]                    ; 1ECC _ 8B. 45, F0
        lea     ecx, [eax+5H]                           ; 1ECF _ 8D. 48, 05
        mov     eax, dword [ebp+0CH]                    ; 1ED2 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 1ED5 _ 8B. 40, 04
        imul    ecx, eax                                ; 1ED8 _ 0F AF. C8
        mov     eax, dword [ebp+0CH]                    ; 1EDB _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 1EDE _ 8B. 40, 04
        lea     ebx, [eax-15H]                          ; 1EE1 _ 8D. 58, EB
        mov     eax, dword [ebp-0CH]                    ; 1EE4 _ 8B. 45, F4
        add     eax, ebx                                ; 1EE7 _ 01. D8
        add     eax, ecx                                ; 1EE9 _ 01. C8
        add     edx, eax                                ; 1EEB _ 01. C2
        movzx   eax, byte [ebp-11H]                     ; 1EED _ 0F B6. 45, EF
        mov     byte [edx], al                          ; 1EF1 _ 88. 02
        add     dword [ebp-0CH], 1                      ; 1EF3 _ 83. 45, F4, 01
?_060:  cmp     dword [ebp-0CH], 15                     ; 1EF7 _ 83. 7D, F4, 0F
        jle     ?_055                                   ; 1EFB _ 7E, 8A
        add     dword [ebp-10H], 1                      ; 1EFD _ 83. 45, F0, 01
?_061:  cmp     dword [ebp-10H], 13                     ; 1F01 _ 83. 7D, F0, 0D
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
        push    ebx                                     ; 209C _ 53
        sub     esp, 84                                 ; 209D _ 83. EC, 54
        mov     dword [ebp-10H], 78848                  ; 20A0 _ C7. 45, F0, 00013400
        call    task_now                                ; 20A7 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-14H], eax                    ; 20AC _ 89. 45, EC
        mov     dword [ebp-18H], 16                     ; 20AF _ C7. 45, E8, 00000010
        mov     dword [ebp-1CH], 28                     ; 20B6 _ C7. 45, E4, 0000001C
        mov     dword [ebp-0CH], 0                      ; 20BD _ C7. 45, F4, 00000000
        mov     dword [ebp-20H], 0                      ; 20C4 _ C7. 45, E0, 00000000
        mov     dword [ebp-24H], 0                      ; 20CB _ C7. 45, DC, 00000000
        mov     eax, dword [ebp+8H]                     ; 20D2 _ 8B. 45, 08
        mov     dword [g_Console], eax                  ; 20D5 _ A3, 000000A8(d)
        mov     dword [?_331], 16                       ; 20DA _ C7. 05, 000000AC(d), 00000010
        mov     dword [?_332], 28                       ; 20E4 _ C7. 05, 000000B0(d), 0000001C
        mov     dword [?_333], -1                       ; 20EE _ C7. 05, 000000B4(d), FFFFFFFF
        mov     eax, dword [memman]                     ; 20F8 _ A1, 00000000(d)
        mov     dword [esp+4H], 128                     ; 20FD _ C7. 44 24, 04, 00000080
        mov     dword [esp], eax                        ; 2105 _ 89. 04 24
        call    memman_alloc                            ; 2108 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-28H], eax                    ; 210D _ 89. 45, D8
        mov     eax, dword [memman]                     ; 2110 _ A1, 00000000(d)
        mov     dword [esp+4H], 30                      ; 2115 _ C7. 44 24, 04, 0000001E
        mov     dword [esp], eax                        ; 211D _ 89. 04 24
        call    memman_alloc                            ; 2120 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-2CH], eax                    ; 2125 _ 89. 45, D4
        mov     eax, dword [ebp-14H]                    ; 2128 _ 8B. 45, EC
        lea     edx, [eax+10H]                          ; 212B _ 8D. 50, 10
        mov     eax, dword [ebp-14H]                    ; 212E _ 8B. 45, EC
        mov     dword [esp+0CH], eax                    ; 2131 _ 89. 44 24, 0C
        mov     eax, dword [ebp-28H]                    ; 2135 _ 8B. 45, D8
        mov     dword [esp+8H], eax                     ; 2138 _ 89. 44 24, 08
        mov     dword [esp+4H], 128                     ; 213C _ C7. 44 24, 04, 00000080
        mov     dword [esp], edx                        ; 2144 _ 89. 14 24
        call    fifo8_init                              ; 2147 _ E8, FFFFFFFC(rel)
        call    timer_alloc                             ; 214C _ E8, FFFFFFFC(rel)
        mov     dword [ebp-30H], eax                    ; 2151 _ 89. 45, D0
        mov     eax, dword [ebp-14H]                    ; 2154 _ 8B. 45, EC
        add     eax, 16                                 ; 2157 _ 83. C0, 10
        mov     dword [esp+8H], 1                       ; 215A _ C7. 44 24, 08, 00000001
        mov     dword [esp+4H], eax                     ; 2162 _ 89. 44 24, 04
        mov     eax, dword [ebp-30H]                    ; 2166 _ 8B. 45, D0
        mov     dword [esp], eax                        ; 2169 _ 89. 04 24
        call    timer_init                              ; 216C _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 50                      ; 2171 _ C7. 44 24, 04, 00000032
        mov     eax, dword [ebp-30H]                    ; 2179 _ 8B. 45, D0
        mov     dword [esp], eax                        ; 217C _ 89. 04 24
        call    timer_settime                           ; 217F _ E8, FFFFFFFC(rel)
        mov     eax, dword [sheet_control]              ; 2184 _ A1, 00000000(d)
        mov     dword [esp+14H], 7                      ; 2189 _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_315                  ; 2191 _ C7. 44 24, 10, 00000060(d)
        mov     dword [esp+0CH], 28                     ; 2199 _ C7. 44 24, 0C, 0000001C
        mov     dword [esp+8H], 8                       ; 21A1 _ C7. 44 24, 08, 00000008
        mov     edx, dword [ebp+8H]                     ; 21A9 _ 8B. 55, 08
        mov     dword [esp+4H], edx                     ; 21AC _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 21B0 _ 89. 04 24
        call    paint_string                            ; 21B3 _ E8, FFFFFFFC(rel)
?_078:  call    io_cli                                  ; 21B8 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-14H]                    ; 21BD _ 8B. 45, EC
        add     eax, 16                                 ; 21C0 _ 83. C0, 10
        mov     dword [esp], eax                        ; 21C3 _ 89. 04 24
        call    fifo8_status                            ; 21C6 _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 21CB _ 85. C0
        jnz     ?_079                                   ; 21CD _ 75, 0A
        call    io_sti                                  ; 21CF _ E8, FFFFFFFC(rel)
        jmp     ?_092                                   ; 21D4 _ E9, 000003A2

?_079:  mov     eax, dword [ebp-14H]                    ; 21D9 _ 8B. 45, EC
        add     eax, 16                                 ; 21DC _ 83. C0, 10
        mov     dword [esp], eax                        ; 21DF _ 89. 04 24
        call    fifo8_get                               ; 21E2 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-34H], eax                    ; 21E7 _ 89. 45, CC
        call    io_sti                                  ; 21EA _ E8, FFFFFFFC(rel)
        cmp     dword [ebp-34H], 1                      ; 21EF _ 83. 7D, CC, 01
        jg      ?_082                                   ; 21F3 _ 7F, 6E
        cmp     dword [ebp-0CH], 0                      ; 21F5 _ 83. 7D, F4, 00
        js      ?_082                                   ; 21F9 _ 78, 68
        cmp     dword [ebp-34H], 0                      ; 21FB _ 83. 7D, CC, 00
        jz      ?_080                                   ; 21FF _ 74, 26
        mov     eax, dword [ebp-14H]                    ; 2201 _ 8B. 45, EC
        add     eax, 16                                 ; 2204 _ 83. C0, 10
        mov     dword [esp+8H], 0                       ; 2207 _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], eax                     ; 220F _ 89. 44 24, 04
        mov     eax, dword [ebp-30H]                    ; 2213 _ 8B. 45, D0
        mov     dword [esp], eax                        ; 2216 _ 89. 04 24
        call    timer_init                              ; 2219 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], 7                      ; 221E _ C7. 45, F4, 00000007
        jmp     ?_081                                   ; 2225 _ EB, 24

?_080:  mov     eax, dword [ebp-14H]                    ; 2227 _ 8B. 45, EC
        add     eax, 16                                 ; 222A _ 83. C0, 10
        mov     dword [esp+8H], 1                       ; 222D _ C7. 44 24, 08, 00000001
        mov     dword [esp+4H], eax                     ; 2235 _ 89. 44 24, 04
        mov     eax, dword [ebp-30H]                    ; 2239 _ 8B. 45, D0
        mov     dword [esp], eax                        ; 223C _ 89. 04 24
        call    timer_init                              ; 223F _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], 0                      ; 2244 _ C7. 45, F4, 00000000
?_081:  mov     dword [esp+4H], 50                      ; 224B _ C7. 44 24, 04, 00000032
        mov     eax, dword [ebp-30H]                    ; 2253 _ 8B. 45, D0
        mov     dword [esp], eax                        ; 2256 _ 89. 04 24
        call    timer_settime                           ; 2259 _ E8, FFFFFFFC(rel)
        jmp     ?_091                                   ; 225E _ E9, 000002DE

?_082:  cmp     dword [ebp-34H], 87                     ; 2263 _ 83. 7D, CC, 57
        jnz     ?_083                                   ; 2267 _ 75, 3C
        mov     dword [ebp-0CH], 7                      ; 2269 _ C7. 45, F4, 00000007
        mov     eax, dword [ebp-14H]                    ; 2270 _ 8B. 45, EC
        add     eax, 16                                 ; 2273 _ 83. C0, 10
        mov     dword [esp+8H], 0                       ; 2276 _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], eax                     ; 227E _ 89. 44 24, 04
        mov     eax, dword [ebp-30H]                    ; 2282 _ 8B. 45, D0
        mov     dword [esp], eax                        ; 2285 _ 89. 04 24
        call    timer_init                              ; 2288 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 50                      ; 228D _ C7. 44 24, 04, 00000032
        mov     eax, dword [ebp-30H]                    ; 2295 _ 8B. 45, D0
        mov     dword [esp], eax                        ; 2298 _ 89. 04 24
        call    timer_settime                           ; 229B _ E8, FFFFFFFC(rel)
        jmp     ?_091                                   ; 22A0 _ E9, 0000029C

?_083:  cmp     dword [ebp-34H], 88                     ; 22A5 _ 83. 7D, CC, 58
        jnz     ?_084                                   ; 22A9 _ 75, 59
        mov     ecx, dword [?_332]                      ; 22AB _ 8B. 0D, 000000B0(d)
        mov     edx, dword [?_331]                      ; 22B1 _ 8B. 15, 000000AC(d)
        mov     eax, dword [sheet_control]              ; 22B7 _ A1, 00000000(d)
        mov     dword [esp+10H], 0                      ; 22BC _ C7. 44 24, 10, 00000000
        mov     dword [esp+0CH], ecx                    ; 22C4 _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 22C8 _ 89. 54 24, 08
        mov     edx, dword [ebp+8H]                     ; 22CC _ 8B. 55, 08
        mov     dword [esp+4H], edx                     ; 22CF _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 22D3 _ 89. 04 24
        call    set_cursor                              ; 22D6 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], -1                     ; 22DB _ C7. 45, F4, FFFFFFFF
        mov     eax, dword [task_main]                  ; 22E2 _ A1, 00000000(d)
        mov     dword [esp+8H], 0                       ; 22E7 _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], -1                      ; 22EF _ C7. 44 24, 04, FFFFFFFF
        mov     dword [esp], eax                        ; 22F7 _ 89. 04 24
        call    task_run                                ; 22FA _ E8, FFFFFFFC(rel)
        jmp     ?_091                                   ; 22FF _ E9, 0000023D

?_084:  cmp     dword [ebp-34H], 14                     ; 2304 _ 83. 7D, CC, 0E
        jne     ?_085                                   ; 2308 _ 0F 85, 00000082
        mov     eax, dword [?_331]                      ; 230E _ A1, 000000AC(d)
        cmp     eax, 16                                 ; 2313 _ 83. F8, 10
        jle     ?_085                                   ; 2316 _ 7E, 78
        mov     ebx, dword [?_332]                      ; 2318 _ 8B. 1D, 000000B0(d)
        mov     ecx, dword [?_331]                      ; 231E _ 8B. 0D, 000000AC(d)
        mov     edx, dword [g_Console]                  ; 2324 _ 8B. 15, 000000A8(d)
        mov     eax, dword [sheet_control]              ; 232A _ A1, 00000000(d)
        mov     dword [esp+10H], 0                      ; 232F _ C7. 44 24, 10, 00000000
        mov     dword [esp+0CH], ebx                    ; 2337 _ 89. 5C 24, 0C
        mov     dword [esp+8H], ecx                     ; 233B _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 233F _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 2343 _ 89. 04 24
        call    set_cursor                              ; 2346 _ E8, FFFFFFFC(rel)
        mov     eax, dword [?_331]                      ; 234B _ A1, 000000AC(d)
        sub     eax, 8                                  ; 2350 _ 83. E8, 08
        mov     dword [?_331], eax                      ; 2353 _ A3, 000000AC(d)
        mov     ebx, dword [?_332]                      ; 2358 _ 8B. 1D, 000000B0(d)
        mov     ecx, dword [?_331]                      ; 235E _ 8B. 0D, 000000AC(d)
        mov     edx, dword [g_Console]                  ; 2364 _ 8B. 15, 000000A8(d)
        mov     eax, dword [sheet_control]              ; 236A _ A1, 00000000(d)
        mov     dword [esp+10H], 0                      ; 236F _ C7. 44 24, 10, 00000000
        mov     dword [esp+0CH], ebx                    ; 2377 _ 89. 5C 24, 0C
        mov     dword [esp+8H], ecx                     ; 237B _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 237F _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 2383 _ 89. 04 24
        call    set_cursor                              ; 2386 _ E8, FFFFFFFC(rel)
        jmp     ?_091                                   ; 238B _ E9, 000001B1

?_085:  cmp     dword [ebp-34H], 28                     ; 2390 _ 83. 7D, CC, 1C
        jne     ?_090                                   ; 2394 _ 0F 85, 0000013A
        mov     ecx, dword [?_332]                      ; 239A _ 8B. 0D, 000000B0(d)
        mov     edx, dword [?_331]                      ; 23A0 _ 8B. 15, 000000AC(d)
        mov     eax, dword [sheet_control]              ; 23A6 _ A1, 00000000(d)
        mov     dword [esp+10H], 0                      ; 23AB _ C7. 44 24, 10, 00000000
        mov     dword [esp+0CH], ecx                    ; 23B3 _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 23B7 _ 89. 54 24, 08
        mov     edx, dword [ebp+8H]                     ; 23BB _ 8B. 55, 08
        mov     dword [esp+4H], edx                     ; 23BE _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 23C2 _ 89. 04 24
        call    set_cursor                              ; 23C5 _ E8, FFFFFFFC(rel)
        mov     eax, dword [?_331]                      ; 23CA _ A1, 000000AC(d)
        lea     edx, [eax+7H]                           ; 23CF _ 8D. 50, 07
        test    eax, eax                                ; 23D2 _ 85. C0
        cmovs   eax, edx                                ; 23D4 _ 0F 48. C2
        sar     eax, 3                                  ; 23D7 _ C1. F8, 03
        lea     edx, [eax-2H]                           ; 23DA _ 8D. 50, FE
        mov     eax, dword [ebp-2CH]                    ; 23DD _ 8B. 45, D4
        add     eax, edx                                ; 23E0 _ 01. D0
        mov     byte [eax], 0                           ; 23E2 _ C6. 00, 00
        mov     eax, dword [?_332]                      ; 23E5 _ A1, 000000B0(d)
        mov     edx, dword [ebp+8H]                     ; 23EA _ 8B. 55, 08
        mov     dword [esp+4H], edx                     ; 23ED _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 23F1 _ 89. 04 24
        call    console_new_line                        ; 23F4 _ E8, FFFFFFFC(rel)
        mov     dword [?_332], eax                      ; 23F9 _ A3, 000000B0(d)
        mov     dword [?_331], 16                       ; 23FE _ C7. 05, 000000AC(d), 00000010
        mov     dword [esp+4H], ?_316                   ; 2408 _ C7. 44 24, 04, 00000062(d)
        mov     eax, dword [ebp-2CH]                    ; 2410 _ 8B. 45, D4
        mov     dword [esp], eax                        ; 2413 _ 89. 04 24
        call    strcmp                                  ; 2416 _ E8, FFFFFFFC(rel)
        cmp     eax, 1                                  ; 241B _ 83. F8, 01
        jnz     ?_086                                   ; 241E _ 75, 10
        mov     eax, dword [ebp+0CH]                    ; 2420 _ 8B. 45, 0C
        mov     dword [esp], eax                        ; 2423 _ 89. 04 24
        call    command_mem                             ; 2426 _ E8, FFFFFFFC(rel)
        jmp     ?_091                                   ; 242B _ E9, 00000111

?_086:  mov     dword [esp+4H], ?_317                   ; 2430 _ C7. 44 24, 04, 00000066(d)
        mov     eax, dword [ebp-2CH]                    ; 2438 _ 8B. 45, D4
        mov     dword [esp], eax                        ; 243B _ 89. 04 24
        call    strcmp                                  ; 243E _ E8, FFFFFFFC(rel)
        cmp     eax, 1                                  ; 2443 _ 83. F8, 01
        jnz     ?_087                                   ; 2446 _ 75, 0A
        call    command_cls                             ; 2448 _ E8, FFFFFFFC(rel)
        jmp     ?_091                                   ; 244D _ E9, 000000EF

?_087:  mov     dword [esp+4H], ?_318                   ; 2452 _ C7. 44 24, 04, 0000006A(d)
        mov     eax, dword [ebp-2CH]                    ; 245A _ 8B. 45, D4
        mov     dword [esp], eax                        ; 245D _ 89. 04 24
        call    strcmp                                  ; 2460 _ E8, FFFFFFFC(rel)
        cmp     eax, 1                                  ; 2465 _ 83. F8, 01
        jnz     ?_088                                   ; 2468 _ 75, 0A
        call    command_dir                             ; 246A _ E8, FFFFFFFC(rel)
        jmp     ?_091                                   ; 246F _ E9, 000000CD

?_088:  mov     eax, dword [ebp-2CH]                    ; 2474 _ 8B. 45, D4
        movzx   eax, byte [eax]                         ; 2477 _ 0F B6. 00
        cmp     al, 116                                 ; 247A _ 3C, 74
        jnz     ?_089                                   ; 247C _ 75, 37
        mov     eax, dword [ebp-2CH]                    ; 247E _ 8B. 45, D4
        add     eax, 1                                  ; 2481 _ 83. C0, 01
        movzx   eax, byte [eax]                         ; 2484 _ 0F B6. 00
        cmp     al, 121                                 ; 2487 _ 3C, 79
        jnz     ?_089                                   ; 2489 _ 75, 2A
        mov     eax, dword [ebp-2CH]                    ; 248B _ 8B. 45, D4
        add     eax, 2                                  ; 248E _ 83. C0, 02
        movzx   eax, byte [eax]                         ; 2491 _ 0F B6. 00
        cmp     al, 112                                 ; 2494 _ 3C, 70
        jnz     ?_089                                   ; 2496 _ 75, 1D
        mov     eax, dword [ebp-2CH]                    ; 2498 _ 8B. 45, D4
        add     eax, 3                                  ; 249B _ 83. C0, 03
        movzx   eax, byte [eax]                         ; 249E _ 0F B6. 00
        cmp     al, 101                                 ; 24A1 _ 3C, 65
        jnz     ?_089                                   ; 24A3 _ 75, 10
        mov     eax, dword [ebp-2CH]                    ; 24A5 _ 8B. 45, D4
        mov     dword [esp], eax                        ; 24A8 _ 89. 04 24
        call    command_type                            ; 24AB _ E8, FFFFFFFC(rel)
        jmp     ?_091                                   ; 24B0 _ E9, 0000008C

?_089:  mov     dword [esp+4H], ?_319                   ; 24B5 _ C7. 44 24, 04, 0000006E(d)
        mov     eax, dword [ebp-2CH]                    ; 24BD _ 8B. 45, D4
        mov     dword [esp], eax                        ; 24C0 _ 89. 04 24
        call    strcmp                                  ; 24C3 _ E8, FFFFFFFC(rel)
        cmp     eax, 1                                  ; 24C8 _ 83. F8, 01
        jnz     ?_091                                   ; 24CB _ 75, 74
        call    command_hlt                             ; 24CD _ E8, FFFFFFFC(rel)
        jmp     ?_091                                   ; 24D2 _ EB, 6D

?_090:  mov     eax, dword [ebp-34H]                    ; 24D4 _ 8B. 45, CC
        mov     dword [esp], eax                        ; 24D7 _ 89. 04 24
        call    transfer_scancode                       ; 24DA _ E8, FFFFFFFC(rel)
        mov     byte [ebp-35H], al                      ; 24DF _ 88. 45, CB
        cmp     byte [ebp-35H], 0                       ; 24E2 _ 80. 7D, CB, 00
        jz      ?_091                                   ; 24E6 _ 74, 59
        mov     eax, dword [?_331]                      ; 24E8 _ A1, 000000AC(d)
        cmp     eax, 239                                ; 24ED _ 3D, 000000EF
        jg      ?_091                                   ; 24F2 _ 7F, 4D
        mov     eax, dword [?_331]                      ; 24F4 _ A1, 000000AC(d)
        lea     edx, [eax+7H]                           ; 24F9 _ 8D. 50, 07
        test    eax, eax                                ; 24FC _ 85. C0
        cmovs   eax, edx                                ; 24FE _ 0F 48. C2
        sar     eax, 3                                  ; 2501 _ C1. F8, 03
        lea     edx, [eax-2H]                           ; 2504 _ 8D. 50, FE
        mov     eax, dword [ebp-2CH]                    ; 2507 _ 8B. 45, D4
        add     edx, eax                                ; 250A _ 01. C2
        movzx   eax, byte [ebp-35H]                     ; 250C _ 0F B6. 45, CB
        mov     byte [edx], al                          ; 2510 _ 88. 02
        mov     eax, dword [?_331]                      ; 2512 _ A1, 000000AC(d)
        lea     edx, [eax+7H]                           ; 2517 _ 8D. 50, 07
        test    eax, eax                                ; 251A _ 85. C0
        cmovs   eax, edx                                ; 251C _ 0F 48. C2
        sar     eax, 3                                  ; 251F _ C1. F8, 03
        lea     edx, [eax-1H]                           ; 2522 _ 8D. 50, FF
        mov     eax, dword [ebp-2CH]                    ; 2525 _ 8B. 45, D4
        add     eax, edx                                ; 2528 _ 01. D0
        mov     byte [eax], 0                           ; 252A _ C6. 00, 00
        movsx   eax, byte [ebp-35H]                     ; 252D _ 0F BE. 45, CB
        mov     dword [esp+4H], 1                       ; 2531 _ C7. 44 24, 04, 00000001
        mov     dword [esp], eax                        ; 2539 _ 89. 04 24
        call    c_console_putchar                       ; 253C _ E8, FFFFFFFC(rel)
?_091:  cmp     dword [ebp-0CH], 0                      ; 2541 _ 83. 7D, F4, 00
        js      ?_092                                   ; 2545 _ 78, 34
        mov     ecx, dword [?_332]                      ; 2547 _ 8B. 0D, 000000B0(d)
        mov     edx, dword [?_331]                      ; 254D _ 8B. 15, 000000AC(d)
        mov     eax, dword [sheet_control]              ; 2553 _ A1, 00000000(d)
        mov     ebx, dword [ebp-0CH]                    ; 2558 _ 8B. 5D, F4
        mov     dword [esp+10H], ebx                    ; 255B _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 255F _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 2563 _ 89. 54 24, 08
        mov     edx, dword [ebp+8H]                     ; 2567 _ 8B. 55, 08
        mov     dword [esp+4H], edx                     ; 256A _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 256E _ 89. 04 24
        call    set_cursor                              ; 2571 _ E8, FFFFFFFC(rel)
        jmp     ?_078                                   ; 2576 _ E9, FFFFFC3D

?_092:  jmp     ?_078                                   ; 257B _ E9, FFFFFC38
; console_task End of function

command_mem:; Function begin
        push    ebp                                     ; 2580 _ 55
        mov     ebp, esp                                ; 2581 _ 89. E5
        push    ebx                                     ; 2583 _ 53
        sub     esp, 52                                 ; 2584 _ 83. EC, 34
        mov     eax, dword [ebp+8H]                     ; 2587 _ 8B. 45, 08
        lea     edx, [eax+3FFH]                         ; 258A _ 8D. 90, 000003FF
        test    eax, eax                                ; 2590 _ 85. C0
        cmovs   eax, edx                                ; 2592 _ 0F 48. C2
        sar     eax, 10                                 ; 2595 _ C1. F8, 0A
        mov     dword [esp], eax                        ; 2598 _ 89. 04 24
        call    intToHexStr                             ; 259B _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 25A0 _ 89. 45, F4
        mov     ecx, dword [?_332]                      ; 25A3 _ 8B. 0D, 000000B0(d)
        mov     edx, dword [g_Console]                  ; 25A9 _ 8B. 15, 000000A8(d)
        mov     eax, dword [sheet_control]              ; 25AF _ A1, 00000000(d)
        mov     dword [esp+14H], 7                      ; 25B4 _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_320                  ; 25BC _ C7. 44 24, 10, 00000072(d)
        mov     dword [esp+0CH], ecx                    ; 25C4 _ 89. 4C 24, 0C
        mov     dword [esp+8H], 16                      ; 25C8 _ C7. 44 24, 08, 00000010
        mov     dword [esp+4H], edx                     ; 25D0 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 25D4 _ 89. 04 24
        call    paint_string                            ; 25D7 _ E8, FFFFFFFC(rel)
        mov     ecx, dword [?_332]                      ; 25DC _ 8B. 0D, 000000B0(d)
        mov     edx, dword [g_Console]                  ; 25E2 _ 8B. 15, 000000A8(d)
        mov     eax, dword [sheet_control]              ; 25E8 _ A1, 00000000(d)
        mov     dword [esp+14H], 7                      ; 25ED _ C7. 44 24, 14, 00000007
        mov     ebx, dword [ebp-0CH]                    ; 25F5 _ 8B. 5D, F4
        mov     dword [esp+10H], ebx                    ; 25F8 _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 25FC _ 89. 4C 24, 0C
        mov     dword [esp+8H], 52                      ; 2600 _ C7. 44 24, 08, 00000034
        mov     dword [esp+4H], edx                     ; 2608 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 260C _ 89. 04 24
        call    paint_string                            ; 260F _ E8, FFFFFFFC(rel)
        mov     ecx, dword [?_332]                      ; 2614 _ 8B. 0D, 000000B0(d)
        mov     edx, dword [g_Console]                  ; 261A _ 8B. 15, 000000A8(d)
        mov     eax, dword [sheet_control]              ; 2620 _ A1, 00000000(d)
        mov     dword [esp+14H], 7                      ; 2625 _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_321                  ; 262D _ C7. 44 24, 10, 00000078(d)
        mov     dword [esp+0CH], ecx                    ; 2635 _ 89. 4C 24, 0C
        mov     dword [esp+8H], 126                     ; 2639 _ C7. 44 24, 08, 0000007E
        mov     dword [esp+4H], edx                     ; 2641 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 2645 _ 89. 04 24
        call    paint_string                            ; 2648 _ E8, FFFFFFFC(rel)
        mov     edx, dword [g_Console]                  ; 264D _ 8B. 15, 000000A8(d)
        mov     eax, dword [?_332]                      ; 2653 _ A1, 000000B0(d)
        mov     dword [esp+4H], edx                     ; 2658 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 265C _ 89. 04 24
        call    console_new_line                        ; 265F _ E8, FFFFFFFC(rel)
        mov     dword [?_332], eax                      ; 2664 _ A3, 000000B0(d)
        add     esp, 52                                 ; 2669 _ 83. C4, 34
        pop     ebx                                     ; 266C _ 5B
        pop     ebp                                     ; 266D _ 5D
        ret                                             ; 266E _ C3
; command_mem End of function

command_cls:; Function begin
        push    ebp                                     ; 266F _ 55
        mov     ebp, esp                                ; 2670 _ 89. E5
        sub     esp, 56                                 ; 2672 _ 83. EC, 38
        mov     dword [ebp-0CH], 8                      ; 2675 _ C7. 45, F4, 00000008
        mov     dword [ebp-10H], 28                     ; 267C _ C7. 45, F0, 0000001C
        mov     dword [ebp-10H], 28                     ; 2683 _ C7. 45, F0, 0000001C
        jmp     ?_096                                   ; 268A _ EB, 39

?_093:  mov     dword [ebp-0CH], 8                      ; 268C _ C7. 45, F4, 00000008
        jmp     ?_095                                   ; 2693 _ EB, 23

?_094:  mov     eax, dword [g_Console]                  ; 2695 _ A1, 000000A8(d)
        mov     edx, dword [eax]                        ; 269A _ 8B. 10
        mov     eax, dword [g_Console]                  ; 269C _ A1, 000000A8(d)
        mov     eax, dword [eax+4H]                     ; 26A1 _ 8B. 40, 04
        imul    eax, dword [ebp-10H]                    ; 26A4 _ 0F AF. 45, F0
        mov     ecx, eax                                ; 26A8 _ 89. C1
        mov     eax, dword [ebp-0CH]                    ; 26AA _ 8B. 45, F4
        add     eax, ecx                                ; 26AD _ 01. C8
        add     eax, edx                                ; 26AF _ 01. D0
        mov     byte [eax], 0                           ; 26B1 _ C6. 00, 00
        add     dword [ebp-0CH], 1                      ; 26B4 _ 83. 45, F4, 01
?_095:  cmp     dword [ebp-0CH], 247                    ; 26B8 _ 81. 7D, F4, 000000F7
        jle     ?_094                                   ; 26BF _ 7E, D4
        add     dword [ebp-10H], 1                      ; 26C1 _ 83. 45, F0, 01
?_096:  cmp     dword [ebp-10H], 155                    ; 26C5 _ 81. 7D, F0, 0000009B
        jle     ?_093                                   ; 26CC _ 7E, BE
        mov     edx, dword [g_Console]                  ; 26CE _ 8B. 15, 000000A8(d)
        mov     eax, dword [sheet_control]              ; 26D4 _ A1, 00000000(d)
        mov     dword [esp+14H], 156                    ; 26D9 _ C7. 44 24, 14, 0000009C
        mov     dword [esp+10H], 248                    ; 26E1 _ C7. 44 24, 10, 000000F8
        mov     dword [esp+0CH], 28                     ; 26E9 _ C7. 44 24, 0C, 0000001C
        mov     dword [esp+8H], 8                       ; 26F1 _ C7. 44 24, 08, 00000008
        mov     dword [esp+4H], edx                     ; 26F9 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 26FD _ 89. 04 24
        call    sheet_refresh                           ; 2700 _ E8, FFFFFFFC(rel)
        mov     dword [?_332], 28                       ; 2705 _ C7. 05, 000000B0(d), 0000001C
        mov     edx, dword [g_Console]                  ; 270F _ 8B. 15, 000000A8(d)
        mov     eax, dword [sheet_control]              ; 2715 _ A1, 00000000(d)
        mov     dword [esp+14H], 7                      ; 271A _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_315                  ; 2722 _ C7. 44 24, 10, 00000060(d)
        mov     dword [esp+0CH], 28                     ; 272A _ C7. 44 24, 0C, 0000001C
        mov     dword [esp+8H], 8                       ; 2732 _ C7. 44 24, 08, 00000008
        mov     dword [esp+4H], edx                     ; 273A _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 273E _ 89. 04 24
        call    paint_string                            ; 2741 _ E8, FFFFFFFC(rel)
        leave                                           ; 2746 _ C9
        ret                                             ; 2747 _ C3
; command_cls End of function

command_dir:; Function begin
        push    ebp                                     ; 2748 _ 55
        mov     ebp, esp                                ; 2749 _ 89. E5
        push    ebx                                     ; 274B _ 53
        sub     esp, 68                                 ; 274C _ 83. EC, 44
        mov     dword [ebp-0CH], 78848                  ; 274F _ C7. 45, F4, 00013400
        mov     eax, dword [memman]                     ; 2756 _ A1, 00000000(d)
        mov     dword [esp+4H], 13                      ; 275B _ C7. 44 24, 04, 0000000D
        mov     dword [esp], eax                        ; 2763 _ 89. 04 24
        call    memman_alloc                            ; 2766 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-18H], eax                    ; 276B _ 89. 45, E8
        mov     eax, dword [ebp-18H]                    ; 276E _ 8B. 45, E8
        add     eax, 12                                 ; 2771 _ 83. C0, 0C
        mov     byte [eax], 0                           ; 2774 _ C6. 00, 00
        jmp     ?_104                                   ; 2777 _ E9, 00000129

?_097:  mov     dword [ebp-10H], 0                      ; 277C _ C7. 45, F0, 00000000
        jmp     ?_100                                   ; 2783 _ EB, 2C

?_098:  mov     edx, dword [ebp-0CH]                    ; 2785 _ 8B. 55, F4
        mov     eax, dword [ebp-10H]                    ; 2788 _ 8B. 45, F0
        add     eax, edx                                ; 278B _ 01. D0
        movzx   eax, byte [eax]                         ; 278D _ 0F B6. 00
        test    al, al                                  ; 2790 _ 84. C0
        jz      ?_099                                   ; 2792 _ 74, 1B
        mov     edx, dword [ebp-10H]                    ; 2794 _ 8B. 55, F0
        mov     eax, dword [ebp-18H]                    ; 2797 _ 8B. 45, E8
        add     edx, eax                                ; 279A _ 01. C2
        mov     ecx, dword [ebp-0CH]                    ; 279C _ 8B. 4D, F4
        mov     eax, dword [ebp-10H]                    ; 279F _ 8B. 45, F0
        add     eax, ecx                                ; 27A2 _ 01. C8
        movzx   eax, byte [eax]                         ; 27A4 _ 0F B6. 00
        mov     byte [edx], al                          ; 27A7 _ 88. 02
        add     dword [ebp-10H], 1                      ; 27A9 _ 83. 45, F0, 01
        jmp     ?_100                                   ; 27AD _ EB, 02

?_099:  jmp     ?_101                                   ; 27AF _ EB, 06

?_100:  cmp     dword [ebp-10H], 7                      ; 27B1 _ 83. 7D, F0, 07
        jle     ?_098                                   ; 27B5 _ 7E, CE
?_101:  mov     edx, dword [ebp-10H]                    ; 27B7 _ 8B. 55, F0
        mov     eax, dword [ebp-18H]                    ; 27BA _ 8B. 45, E8
        add     eax, edx                                ; 27BD _ 01. D0
        mov     byte [eax], 46                          ; 27BF _ C6. 00, 2E
        add     dword [ebp-10H], 1                      ; 27C2 _ 83. 45, F0, 01
        mov     dword [ebp-14H], 0                      ; 27C6 _ C7. 45, EC, 00000000
        jmp     ?_103                                   ; 27CD _ EB, 1E

?_102:  mov     edx, dword [ebp-10H]                    ; 27CF _ 8B. 55, F0
        mov     eax, dword [ebp-18H]                    ; 27D2 _ 8B. 45, E8
        add     edx, eax                                ; 27D5 _ 01. C2
        mov     ecx, dword [ebp-0CH]                    ; 27D7 _ 8B. 4D, F4
        mov     eax, dword [ebp-14H]                    ; 27DA _ 8B. 45, EC
        add     eax, ecx                                ; 27DD _ 01. C8
        movzx   eax, byte [eax+8H]                      ; 27DF _ 0F B6. 40, 08
        mov     byte [edx], al                          ; 27E3 _ 88. 02
        add     dword [ebp-10H], 1                      ; 27E5 _ 83. 45, F0, 01
        add     dword [ebp-14H], 1                      ; 27E9 _ 83. 45, EC, 01
?_103:  cmp     dword [ebp-14H], 2                      ; 27ED _ 83. 7D, EC, 02
        jle     ?_102                                   ; 27F1 _ 7E, DC
        mov     edx, dword [ebp-10H]                    ; 27F3 _ 8B. 55, F0
        mov     eax, dword [ebp-18H]                    ; 27F6 _ 8B. 45, E8
        add     eax, edx                                ; 27F9 _ 01. D0
        mov     byte [eax], 0                           ; 27FB _ C6. 00, 00
        mov     ecx, dword [?_332]                      ; 27FE _ 8B. 0D, 000000B0(d)
        mov     edx, dword [g_Console]                  ; 2804 _ 8B. 15, 000000A8(d)
        mov     eax, dword [sheet_control]              ; 280A _ A1, 00000000(d)
        mov     dword [esp+14H], 7                      ; 280F _ C7. 44 24, 14, 00000007
        mov     ebx, dword [ebp-18H]                    ; 2817 _ 8B. 5D, E8
        mov     dword [esp+10H], ebx                    ; 281A _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 281E _ 89. 4C 24, 0C
        mov     dword [esp+8H], 16                      ; 2822 _ C7. 44 24, 08, 00000010
        mov     dword [esp+4H], edx                     ; 282A _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 282E _ 89. 04 24
        call    paint_string                            ; 2831 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-1CH], 136                    ; 2836 _ C7. 45, E4, 00000088
        mov     eax, dword [ebp-0CH]                    ; 283D _ 8B. 45, F4
        mov     eax, dword [eax+1CH]                    ; 2840 _ 8B. 40, 1C
        mov     dword [esp], eax                        ; 2843 _ 89. 04 24
        call    intToHexStr                             ; 2846 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-20H], eax                    ; 284B _ 89. 45, E0
        mov     ecx, dword [?_332]                      ; 284E _ 8B. 0D, 000000B0(d)
        mov     edx, dword [g_Console]                  ; 2854 _ 8B. 15, 000000A8(d)
        mov     eax, dword [sheet_control]              ; 285A _ A1, 00000000(d)
        mov     dword [esp+14H], 7                      ; 285F _ C7. 44 24, 14, 00000007
        mov     ebx, dword [ebp-20H]                    ; 2867 _ 8B. 5D, E0
        mov     dword [esp+10H], ebx                    ; 286A _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 286E _ 89. 4C 24, 0C
        mov     ecx, dword [ebp-1CH]                    ; 2872 _ 8B. 4D, E4
        mov     dword [esp+8H], ecx                     ; 2875 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 2879 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 287D _ 89. 04 24
        call    paint_string                            ; 2880 _ E8, FFFFFFFC(rel)
        mov     edx, dword [g_Console]                  ; 2885 _ 8B. 15, 000000A8(d)
        mov     eax, dword [?_332]                      ; 288B _ A1, 000000B0(d)
        mov     dword [esp+4H], edx                     ; 2890 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 2894 _ 89. 04 24
        call    console_new_line                        ; 2897 _ E8, FFFFFFFC(rel)
        mov     dword [?_332], eax                      ; 289C _ A3, 000000B0(d)
        add     dword [ebp-0CH], 32                     ; 28A1 _ 83. 45, F4, 20
?_104:  mov     eax, dword [ebp-0CH]                    ; 28A5 _ 8B. 45, F4
        movzx   eax, byte [eax]                         ; 28A8 _ 0F B6. 00
        test    al, al                                  ; 28AB _ 84. C0
        jne     ?_097                                   ; 28AD _ 0F 85, FFFFFEC9
        mov     edx, dword [ebp-18H]                    ; 28B3 _ 8B. 55, E8
        mov     eax, dword [memman]                     ; 28B6 _ A1, 00000000(d)
        mov     dword [esp+8H], 13                      ; 28BB _ C7. 44 24, 08, 0000000D
        mov     dword [esp+4H], edx                     ; 28C3 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 28C7 _ 89. 04 24
        call    memman_free                             ; 28CA _ E8, FFFFFFFC(rel)
        add     esp, 68                                 ; 28CF _ 83. C4, 44
        pop     ebx                                     ; 28D2 _ 5B
        pop     ebp                                     ; 28D3 _ 5D
        ret                                             ; 28D4 _ C3
; command_dir End of function

command_type:; Function begin
        push    ebp                                     ; 28D5 _ 55
        mov     ebp, esp                                ; 28D6 _ 89. E5
        push    esi                                     ; 28D8 _ 56
        push    ebx                                     ; 28D9 _ 53
        sub     esp, 96                                 ; 28DA _ 83. EC, 60
        mov     dword [ebp-0CH], 78848                  ; 28DD _ C7. 45, F4, 00013400
        mov     eax, dword [memman]                     ; 28E4 _ A1, 00000000(d)
        mov     dword [esp+4H], 13                      ; 28E9 _ C7. 44 24, 04, 0000000D
        mov     dword [esp], eax                        ; 28F1 _ 89. 04 24
        call    memman_alloc                            ; 28F4 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-24H], eax                    ; 28F9 _ 89. 45, DC
        mov     eax, dword [ebp-24H]                    ; 28FC _ 8B. 45, DC
        add     eax, 12                                 ; 28FF _ 83. C0, 0C
        mov     byte [eax], 0                           ; 2902 _ C6. 00, 00
        mov     dword [ebp-10H], 0                      ; 2905 _ C7. 45, F0, 00000000
        mov     dword [ebp-14H], 5                      ; 290C _ C7. 45, EC, 00000005
        mov     dword [ebp-14H], 5                      ; 2913 _ C7. 45, EC, 00000005
        jmp     ?_107                                   ; 291A _ EB, 30

?_105:  mov     edx, dword [ebp-14H]                    ; 291C _ 8B. 55, EC
        mov     eax, dword [ebp+8H]                     ; 291F _ 8B. 45, 08
        add     eax, edx                                ; 2922 _ 01. D0
        movzx   eax, byte [eax]                         ; 2924 _ 0F B6. 00
        test    al, al                                  ; 2927 _ 84. C0
        jz      ?_106                                   ; 2929 _ 74, 1F
        mov     edx, dword [ebp-10H]                    ; 292B _ 8B. 55, F0
        mov     eax, dword [ebp-24H]                    ; 292E _ 8B. 45, DC
        add     edx, eax                                ; 2931 _ 01. C2
        mov     ecx, dword [ebp-14H]                    ; 2933 _ 8B. 4D, EC
        mov     eax, dword [ebp+8H]                     ; 2936 _ 8B. 45, 08
        add     eax, ecx                                ; 2939 _ 01. C8
        movzx   eax, byte [eax]                         ; 293B _ 0F B6. 00
        mov     byte [edx], al                          ; 293E _ 88. 02
        add     dword [ebp-10H], 1                      ; 2940 _ 83. 45, F0, 01
        add     dword [ebp-14H], 1                      ; 2944 _ 83. 45, EC, 01
        jmp     ?_107                                   ; 2948 _ EB, 02

?_106:  jmp     ?_108                                   ; 294A _ EB, 06

?_107:  cmp     dword [ebp-14H], 16                     ; 294C _ 83. 7D, EC, 10
        jle     ?_105                                   ; 2950 _ 7E, CA
?_108:  mov     edx, dword [ebp-10H]                    ; 2952 _ 8B. 55, F0
        mov     eax, dword [ebp-24H]                    ; 2955 _ 8B. 45, DC
        add     eax, edx                                ; 2958 _ 01. D0
        mov     byte [eax], 0                           ; 295A _ C6. 00, 00
        jmp     ?_124                                   ; 295D _ E9, 00000241

?_109:  mov     byte [ebp-2DH], 0                       ; 2962 _ C6. 45, D3, 00
        mov     dword [ebp-18H], 0                      ; 2966 _ C7. 45, E8, 00000000
        jmp     ?_112                                   ; 296D _ EB, 2C

?_110:  mov     edx, dword [ebp-0CH]                    ; 296F _ 8B. 55, F4
        mov     eax, dword [ebp-18H]                    ; 2972 _ 8B. 45, E8
        add     eax, edx                                ; 2975 _ 01. D0
        movzx   eax, byte [eax]                         ; 2977 _ 0F B6. 00
        test    al, al                                  ; 297A _ 84. C0
        jz      ?_111                                   ; 297C _ 74, 1B
        mov     edx, dword [ebp-0CH]                    ; 297E _ 8B. 55, F4
        mov     eax, dword [ebp-18H]                    ; 2981 _ 8B. 45, E8
        add     eax, edx                                ; 2984 _ 01. D0
        movzx   eax, byte [eax]                         ; 2986 _ 0F B6. 00
        lea     ecx, [ebp-39H]                          ; 2989 _ 8D. 4D, C7
        mov     edx, dword [ebp-18H]                    ; 298C _ 8B. 55, E8
        add     edx, ecx                                ; 298F _ 01. CA
        mov     byte [edx], al                          ; 2991 _ 88. 02
        add     dword [ebp-18H], 1                      ; 2993 _ 83. 45, E8, 01
        jmp     ?_112                                   ; 2997 _ EB, 02

?_111:  jmp     ?_113                                   ; 2999 _ EB, 06

?_112:  cmp     dword [ebp-18H], 7                      ; 299B _ 83. 7D, E8, 07
        jle     ?_110                                   ; 299F _ 7E, CE
?_113:  lea     edx, [ebp-39H]                          ; 29A1 _ 8D. 55, C7
        mov     eax, dword [ebp-18H]                    ; 29A4 _ 8B. 45, E8
        add     eax, edx                                ; 29A7 _ 01. D0
        mov     byte [eax], 46                          ; 29A9 _ C6. 00, 2E
        add     dword [ebp-18H], 1                      ; 29AC _ 83. 45, E8, 01
        mov     dword [ebp-1CH], 0                      ; 29B0 _ C7. 45, E4, 00000000
        jmp     ?_115                                   ; 29B7 _ EB, 1E

?_114:  mov     edx, dword [ebp-0CH]                    ; 29B9 _ 8B. 55, F4
        mov     eax, dword [ebp-1CH]                    ; 29BC _ 8B. 45, E4
        add     eax, edx                                ; 29BF _ 01. D0
        movzx   eax, byte [eax+8H]                      ; 29C1 _ 0F B6. 40, 08
        lea     ecx, [ebp-39H]                          ; 29C5 _ 8D. 4D, C7
        mov     edx, dword [ebp-18H]                    ; 29C8 _ 8B. 55, E8
        add     edx, ecx                                ; 29CB _ 01. CA
        mov     byte [edx], al                          ; 29CD _ 88. 02
        add     dword [ebp-18H], 1                      ; 29CF _ 83. 45, E8, 01
        add     dword [ebp-1CH], 1                      ; 29D3 _ 83. 45, E4, 01
?_115:  cmp     dword [ebp-1CH], 2                      ; 29D7 _ 83. 7D, E4, 02
        jle     ?_114                                   ; 29DB _ 7E, DC
        lea     edx, [ebp-39H]                          ; 29DD _ 8D. 55, C7
        mov     eax, dword [ebp-18H]                    ; 29E0 _ 8B. 45, E8
        add     eax, edx                                ; 29E3 _ 01. D0
        mov     byte [eax], 0                           ; 29E5 _ C6. 00, 00
        lea     eax, [ebp-39H]                          ; 29E8 _ 8D. 45, C7
        mov     dword [esp+4H], eax                     ; 29EB _ 89. 44 24, 04
        mov     eax, dword [ebp-24H]                    ; 29EF _ 8B. 45, DC
        mov     dword [esp], eax                        ; 29F2 _ 89. 04 24
        call    strcmp                                  ; 29F5 _ E8, FFFFFFFC(rel)
        cmp     eax, 1                                  ; 29FA _ 83. F8, 01
        jne     ?_123                                   ; 29FD _ 0F 85, 0000019C
        mov     dword [ebp-28H], 88064                  ; 2A03 _ C7. 45, D8, 00015800
        mov     eax, dword [ebp-0CH]                    ; 2A0A _ 8B. 45, F4
        movzx   eax, word [eax+1AH]                     ; 2A0D _ 0F B7. 40, 1A
        movzx   eax, ax                                 ; 2A11 _ 0F B7. C0
        shl     eax, 9                                  ; 2A14 _ C1. E0, 09
        add     dword [ebp-28H], eax                    ; 2A17 _ 01. 45, D8
        mov     eax, dword [ebp-0CH]                    ; 2A1A _ 8B. 45, F4
        mov     eax, dword [eax+1CH]                    ; 2A1D _ 8B. 40, 1C
        mov     dword [ebp-2CH], eax                    ; 2A20 _ 89. 45, D4
        mov     dword [ebp-20H], 0                      ; 2A23 _ C7. 45, E0, 00000000
        mov     dword [?_331], 16                       ; 2A2A _ C7. 05, 000000AC(d), 00000010
        mov     dword [ebp-20H], 0                      ; 2A34 _ C7. 45, E0, 00000000
        jmp     ?_122                                   ; 2A3B _ E9, 00000150

?_116:  mov     edx, dword [ebp-20H]                    ; 2A40 _ 8B. 55, E0
        mov     eax, dword [ebp-28H]                    ; 2A43 _ 8B. 45, D8
        add     eax, edx                                ; 2A46 _ 01. D0
        movzx   eax, byte [eax]                         ; 2A48 _ 0F B6. 00
        mov     byte [ebp-3BH], al                      ; 2A4B _ 88. 45, C5
        mov     byte [ebp-3AH], 0                       ; 2A4E _ C6. 45, C6, 00
        movzx   eax, byte [ebp-3BH]                     ; 2A52 _ 0F B6. 45, C5
        cmp     al, 9                                   ; 2A56 _ 3C, 09
        jnz     ?_119                                   ; 2A58 _ 75, 7E
?_117:  mov     ebx, dword [?_332]                      ; 2A5A _ 8B. 1D, 000000B0(d)
        mov     ecx, dword [?_331]                      ; 2A60 _ 8B. 0D, 000000AC(d)
        mov     edx, dword [g_Console]                  ; 2A66 _ 8B. 15, 000000A8(d)
        mov     eax, dword [sheet_control]              ; 2A6C _ A1, 00000000(d)
        mov     dword [esp+14H], 7                      ; 2A71 _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_322                  ; 2A79 _ C7. 44 24, 10, 0000007C(d)
        mov     dword [esp+0CH], ebx                    ; 2A81 _ 89. 5C 24, 0C
        mov     dword [esp+8H], ecx                     ; 2A85 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 2A89 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 2A8D _ 89. 04 24
        call    paint_string                            ; 2A90 _ E8, FFFFFFFC(rel)
        mov     eax, dword [?_331]                      ; 2A95 _ A1, 000000AC(d)
        add     eax, 8                                  ; 2A9A _ 83. C0, 08
        mov     dword [?_331], eax                      ; 2A9D _ A3, 000000AC(d)
        mov     eax, dword [?_331]                      ; 2AA2 _ A1, 000000AC(d)
        cmp     eax, 248                                ; 2AA7 _ 3D, 000000F8
        jnz     ?_118                                   ; 2AAC _ 75, 28
        mov     dword [?_331], 8                        ; 2AAE _ C7. 05, 000000AC(d), 00000008
        mov     edx, dword [g_Console]                  ; 2AB8 _ 8B. 15, 000000A8(d)
        mov     eax, dword [?_332]                      ; 2ABE _ A1, 000000B0(d)
        mov     dword [esp+4H], edx                     ; 2AC3 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 2AC7 _ 89. 04 24
        call    console_new_line                        ; 2ACA _ E8, FFFFFFFC(rel)
        mov     dword [?_332], eax                      ; 2ACF _ A3, 000000B0(d)
        jmp     ?_117                                   ; 2AD4 _ EB, 84

?_118:  jmp     ?_117                                   ; 2AD6 _ EB, 82

?_119:  movzx   eax, byte [ebp-3BH]                     ; 2AD8 _ 0F B6. 45, C5
        cmp     al, 10                                  ; 2ADC _ 3C, 0A
        jnz     ?_120                                   ; 2ADE _ 75, 2B
        mov     dword [?_331], 8                        ; 2AE0 _ C7. 05, 000000AC(d), 00000008
        mov     edx, dword [g_Console]                  ; 2AEA _ 8B. 15, 000000A8(d)
        mov     eax, dword [?_332]                      ; 2AF0 _ A1, 000000B0(d)
        mov     dword [esp+4H], edx                     ; 2AF5 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 2AF9 _ 89. 04 24
        call    console_new_line                        ; 2AFC _ E8, FFFFFFFC(rel)
        mov     dword [?_332], eax                      ; 2B01 _ A3, 000000B0(d)
        jmp     ?_121                                   ; 2B06 _ E9, 00000081

?_120:  movzx   eax, byte [ebp-3BH]                     ; 2B0B _ 0F B6. 45, C5
        cmp     al, 13                                  ; 2B0F _ 3C, 0D
        jz      ?_121                                   ; 2B11 _ 74, 79
        mov     ebx, dword [?_332]                      ; 2B13 _ 8B. 1D, 000000B0(d)
        mov     ecx, dword [?_331]                      ; 2B19 _ 8B. 0D, 000000AC(d)
        mov     edx, dword [g_Console]                  ; 2B1F _ 8B. 15, 000000A8(d)
        mov     eax, dword [sheet_control]              ; 2B25 _ A1, 00000000(d)
        mov     dword [esp+14H], 7                      ; 2B2A _ C7. 44 24, 14, 00000007
        lea     esi, [ebp-3BH]                          ; 2B32 _ 8D. 75, C5
        mov     dword [esp+10H], esi                    ; 2B35 _ 89. 74 24, 10
        mov     dword [esp+0CH], ebx                    ; 2B39 _ 89. 5C 24, 0C
        mov     dword [esp+8H], ecx                     ; 2B3D _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 2B41 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 2B45 _ 89. 04 24
        call    paint_string                            ; 2B48 _ E8, FFFFFFFC(rel)
        mov     eax, dword [?_331]                      ; 2B4D _ A1, 000000AC(d)
        add     eax, 8                                  ; 2B52 _ 83. C0, 08
        mov     dword [?_331], eax                      ; 2B55 _ A3, 000000AC(d)
        mov     eax, dword [?_331]                      ; 2B5A _ A1, 000000AC(d)
        cmp     eax, 248                                ; 2B5F _ 3D, 000000F8
        jnz     ?_121                                   ; 2B64 _ 75, 26
        mov     dword [?_331], 16                       ; 2B66 _ C7. 05, 000000AC(d), 00000010
        mov     edx, dword [g_Console]                  ; 2B70 _ 8B. 15, 000000A8(d)
        mov     eax, dword [?_332]                      ; 2B76 _ A1, 000000B0(d)
        mov     dword [esp+4H], edx                     ; 2B7B _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 2B7F _ 89. 04 24
        call    console_new_line                        ; 2B82 _ E8, FFFFFFFC(rel)
        mov     dword [?_332], eax                      ; 2B87 _ A3, 000000B0(d)
?_121:  add     dword [ebp-20H], 1                      ; 2B8C _ 83. 45, E0, 01
?_122:  mov     eax, dword [ebp-20H]                    ; 2B90 _ 8B. 45, E0
        cmp     eax, dword [ebp-2CH]                    ; 2B93 _ 3B. 45, D4
        jl      ?_116                                   ; 2B96 _ 0F 8C, FFFFFEA4
        nop                                             ; 2B9C _ 90
        jmp     ?_125                                   ; 2B9D _ EB, 12

?_123:  add     dword [ebp-0CH], 32                     ; 2B9F _ 83. 45, F4, 20
?_124:  mov     eax, dword [ebp-0CH]                    ; 2BA3 _ 8B. 45, F4
        movzx   eax, byte [eax]                         ; 2BA6 _ 0F B6. 00
        test    al, al                                  ; 2BA9 _ 84. C0
        jne     ?_109                                   ; 2BAB _ 0F 85, FFFFFDB1
?_125:  mov     edx, dword [g_Console]                  ; 2BB1 _ 8B. 15, 000000A8(d)
        mov     eax, dword [?_332]                      ; 2BB7 _ A1, 000000B0(d)
        mov     dword [esp+4H], edx                     ; 2BBC _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 2BC0 _ 89. 04 24
        call    console_new_line                        ; 2BC3 _ E8, FFFFFFFC(rel)
        mov     dword [?_332], eax                      ; 2BC8 _ A3, 000000B0(d)
        mov     dword [?_331], 16                       ; 2BCD _ C7. 05, 000000AC(d), 00000010
        mov     edx, dword [ebp-24H]                    ; 2BD7 _ 8B. 55, DC
        mov     eax, dword [memman]                     ; 2BDA _ A1, 00000000(d)
        mov     dword [esp+8H], 13                      ; 2BDF _ C7. 44 24, 08, 0000000D
        mov     dword [esp+4H], edx                     ; 2BE7 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 2BEB _ 89. 04 24
        call    memman_free                             ; 2BEE _ E8, FFFFFFFC(rel)
        add     esp, 96                                 ; 2BF3 _ 83. C4, 60
        pop     ebx                                     ; 2BF6 _ 5B
        pop     esi                                     ; 2BF7 _ 5E
        pop     ebp                                     ; 2BF8 _ 5D
        ret                                             ; 2BF9 _ C3
; command_type End of function

command_hlt:; Function begin
        push    ebp                                     ; 2BFA _ 55
        mov     ebp, esp                                ; 2BFB _ 89. E5
        sub     esp, 56                                 ; 2BFD _ 83. EC, 38
        mov     dword [esp+4H], buffer                  ; 2C00 _ C7. 44 24, 04, 000001D8(d)
        mov     dword [esp], ?_323                      ; 2C08 _ C7. 04 24, 0000007E(d)
        call    file_load_content                       ; 2C0F _ E8, FFFFFFFC(rel)
        call    get_addr_gdt                            ; 2C14 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 2C19 _ 89. 45, F4
        mov     eax, dword [buffer]                     ; 2C1C _ A1, 000001D8(d)
        mov     edx, dword [ebp-0CH]                    ; 2C21 _ 8B. 55, F4
        add     edx, 88                                 ; 2C24 _ 83. C2, 58
        mov     dword [esp+0CH], 16634                  ; 2C27 _ C7. 44 24, 0C, 000040FA
        mov     dword [esp+8H], eax                     ; 2C2F _ 89. 44 24, 08
        mov     dword [esp+4H], 1048575                 ; 2C33 _ C7. 44 24, 04, 000FFFFF
        mov     dword [esp], edx                        ; 2C3B _ 89. 14 24
        call    segment_descriptor                      ; 2C3E _ E8, FFFFFFFC(rel)
        mov     eax, dword [memman]                     ; 2C43 _ A1, 00000000(d)
        mov     dword [esp+4H], 65536                   ; 2C48 _ C7. 44 24, 04, 00010000
        mov     dword [esp], eax                        ; 2C50 _ 89. 04 24
        call    memman_alloc_4k                         ; 2C53 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 2C58 _ 89. 45, F0
        mov     eax, dword [ebp-10H]                    ; 2C5B _ 8B. 45, F0
        mov     edx, dword [ebp-0CH]                    ; 2C5E _ 8B. 55, F4
        add     edx, 96                                 ; 2C61 _ 83. C2, 60
        mov     dword [esp+0CH], 16626                  ; 2C64 _ C7. 44 24, 0C, 000040F2
        mov     dword [esp+8H], eax                     ; 2C6C _ 89. 44 24, 08
        mov     dword [esp+4H], 65535                   ; 2C70 _ C7. 44 24, 04, 0000FFFF
        mov     dword [esp], edx                        ; 2C78 _ 89. 14 24
        call    segment_descriptor                      ; 2C7B _ E8, FFFFFFFC(rel)
        call    task_now                                ; 2C80 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-14H], eax                    ; 2C85 _ 89. 45, EC
        mov     eax, dword [ebp-14H]                    ; 2C88 _ 8B. 45, EC
        add     eax, 48                                 ; 2C8B _ 83. C0, 30
        mov     dword [esp+10H], eax                    ; 2C8E _ 89. 44 24, 10
        mov     dword [esp+0CH], 96                     ; 2C92 _ C7. 44 24, 0C, 00000060
        mov     dword [esp+8H], 65536                   ; 2C9A _ C7. 44 24, 08, 00010000
        mov     dword [esp+4H], 88                      ; 2CA2 _ C7. 44 24, 04, 00000058
        mov     dword [esp], 0                          ; 2CAA _ C7. 04 24, 00000000
        call    start_app                               ; 2CB1 _ E8, FFFFFFFC(rel)
        mov     eax, dword [?_336]                      ; 2CB6 _ A1, 000001DC(d)
        mov     ecx, eax                                ; 2CBB _ 89. C1
        mov     eax, dword [buffer]                     ; 2CBD _ A1, 000001D8(d)
        mov     edx, eax                                ; 2CC2 _ 89. C2
        mov     eax, dword [memman]                     ; 2CC4 _ A1, 00000000(d)
        mov     dword [esp+8H], ecx                     ; 2CC9 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 2CCD _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 2CD1 _ 89. 04 24
        call    memman_free_4k                          ; 2CD4 _ E8, FFFFFFFC(rel)
        mov     edx, dword [ebp-10H]                    ; 2CD9 _ 8B. 55, F0
        mov     eax, dword [memman]                     ; 2CDC _ A1, 00000000(d)
        mov     dword [esp+8H], 65536                   ; 2CE1 _ C7. 44 24, 08, 00010000
        mov     dword [esp+4H], edx                     ; 2CE9 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 2CED _ 89. 04 24
        call    memman_free_4k                          ; 2CF0 _ E8, FFFFFFFC(rel)
        leave                                           ; 2CF5 _ C9
        ret                                             ; 2CF6 _ C3
; command_hlt End of function

launch_console:; Function begin
        push    ebp                                     ; 2CF7 _ 55
        mov     ebp, esp                                ; 2CF8 _ 89. E5
        push    ebx                                     ; 2CFA _ 53
        sub     esp, 52                                 ; 2CFB _ 83. EC, 34
        mov     eax, dword [sheet_control]              ; 2CFE _ A1, 00000000(d)
        mov     dword [esp], eax                        ; 2D03 _ 89. 04 24
        call    sheet_alloc                             ; 2D06 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 2D0B _ 89. 45, F4
        mov     eax, dword [memman]                     ; 2D0E _ A1, 00000000(d)
        mov     dword [esp+4H], 42240                   ; 2D13 _ C7. 44 24, 04, 0000A500
        mov     dword [esp], eax                        ; 2D1B _ 89. 04 24
        call    memman_alloc_4k                         ; 2D1E _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 2D23 _ 89. 45, F0
        mov     dword [esp+10H], 99                     ; 2D26 _ C7. 44 24, 10, 00000063
        mov     dword [esp+0CH], 165                    ; 2D2E _ C7. 44 24, 0C, 000000A5
        mov     dword [esp+8H], 256                     ; 2D36 _ C7. 44 24, 08, 00000100
        mov     eax, dword [ebp-10H]                    ; 2D3E _ 8B. 45, F0
        mov     dword [esp+4H], eax                     ; 2D41 _ 89. 44 24, 04
        mov     eax, dword [ebp-0CH]                    ; 2D45 _ 8B. 45, F4
        mov     dword [esp], eax                        ; 2D48 _ 89. 04 24
        call    sheet_setbuf                            ; 2D4B _ E8, FFFFFFFC(rel)
        mov     eax, dword [sheet_control]              ; 2D50 _ A1, 00000000(d)
        mov     dword [esp+0CH], 0                      ; 2D55 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], ?_324                   ; 2D5D _ C7. 44 24, 08, 00000086(d)
        mov     edx, dword [ebp-0CH]                    ; 2D65 _ 8B. 55, F4
        mov     dword [esp+4H], edx                     ; 2D68 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 2D6C _ 89. 04 24
        call    make_windows                            ; 2D6F _ E8, FFFFFFFC(rel)
        mov     dword [esp+14H], 0                      ; 2D74 _ C7. 44 24, 14, 00000000
        mov     dword [esp+10H], 128                    ; 2D7C _ C7. 44 24, 10, 00000080
        mov     dword [esp+0CH], 240                    ; 2D84 _ C7. 44 24, 0C, 000000F0
        mov     dword [esp+8H], 28                      ; 2D8C _ C7. 44 24, 08, 0000001C
        mov     dword [esp+4H], 8                       ; 2D94 _ C7. 44 24, 04, 00000008
        mov     eax, dword [ebp-0CH]                    ; 2D9C _ 8B. 45, F4
        mov     dword [esp], eax                        ; 2D9F _ 89. 04 24
        call    make_textbox                            ; 2DA2 _ E8, FFFFFFFC(rel)
        call    task_alloc                              ; 2DA7 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-14H], eax                    ; 2DAC _ 89. 45, EC
        call    get_code32_addr                         ; 2DAF _ E8, FFFFFFFC(rel)
        mov     dword [ebp-18H], eax                    ; 2DB4 _ 89. 45, E8
        mov     eax, dword [ebp-14H]                    ; 2DB7 _ 8B. 45, EC
        mov     dword [eax+8CH], 0                      ; 2DBA _ C7. 80, 0000008C, 00000000
        mov     eax, dword [ebp-14H]                    ; 2DC4 _ 8B. 45, EC
        mov     dword [eax+90H], 1073741824             ; 2DC7 _ C7. 80, 00000090, 40000000
        mov     eax, console_task                       ; 2DD1 _ B8, 00000000(d)
        sub     eax, dword [ebp-18H]                    ; 2DD6 _ 2B. 45, E8
        mov     edx, eax                                ; 2DD9 _ 89. C2
        mov     eax, dword [ebp-14H]                    ; 2DDB _ 8B. 45, EC
        mov     dword [eax+4CH], edx                    ; 2DDE _ 89. 50, 4C
        mov     eax, dword [ebp-14H]                    ; 2DE1 _ 8B. 45, EC
        mov     dword [eax+74H], 0                      ; 2DE4 _ C7. 40, 74, 00000000
        mov     eax, dword [ebp-14H]                    ; 2DEB _ 8B. 45, EC
        mov     dword [eax+78H], 8                      ; 2DEE _ C7. 40, 78, 00000008
        mov     eax, dword [ebp-14H]                    ; 2DF5 _ 8B. 45, EC
        mov     dword [eax+7CH], 48                     ; 2DF8 _ C7. 40, 7C, 00000030
        mov     eax, dword [ebp-14H]                    ; 2DFF _ 8B. 45, EC
        mov     dword [eax+80H], 32                     ; 2E02 _ C7. 80, 00000080, 00000020
        mov     eax, dword [ebp-14H]                    ; 2E0C _ 8B. 45, EC
        mov     dword [eax+84H], 0                      ; 2E0F _ C7. 80, 00000084, 00000000
        mov     eax, dword [ebp-14H]                    ; 2E19 _ 8B. 45, EC
        mov     dword [eax+88H], 16                     ; 2E1C _ C7. 80, 00000088, 00000010
        mov     eax, dword [ebp-14H]                    ; 2E26 _ 8B. 45, EC
        mov     eax, dword [eax+64H]                    ; 2E29 _ 8B. 40, 64
        lea     edx, [eax-8H]                           ; 2E2C _ 8D. 50, F8
        mov     eax, dword [ebp-14H]                    ; 2E2F _ 8B. 45, EC
        mov     dword [eax+64H], edx                    ; 2E32 _ 89. 50, 64
        mov     eax, dword [ebp-14H]                    ; 2E35 _ 8B. 45, EC
        mov     eax, dword [eax+64H]                    ; 2E38 _ 8B. 40, 64
        add     eax, 4                                  ; 2E3B _ 83. C0, 04
        mov     edx, dword [ebp-0CH]                    ; 2E3E _ 8B. 55, F4
        mov     dword [eax], edx                        ; 2E41 _ 89. 10
        mov     eax, dword [ebp-14H]                    ; 2E43 _ 8B. 45, EC
        mov     eax, dword [eax+64H]                    ; 2E46 _ 8B. 40, 64
        add     eax, 8                                  ; 2E49 _ 83. C0, 08
        mov     ebx, eax                                ; 2E4C _ 89. C3
        mov     eax, dword [memman]                     ; 2E4E _ A1, 00000000(d)
        mov     dword [esp], eax                        ; 2E53 _ 89. 04 24
        call    memman_total                            ; 2E56 _ E8, FFFFFFFC(rel)
        mov     dword [ebx], eax                        ; 2E5B _ 89. 03
        mov     dword [esp+8H], 5                       ; 2E5D _ C7. 44 24, 08, 00000005
        mov     dword [esp+4H], 1                       ; 2E65 _ C7. 44 24, 04, 00000001
        mov     eax, dword [ebp-14H]                    ; 2E6D _ 8B. 45, EC
        mov     dword [esp], eax                        ; 2E70 _ 89. 04 24
        call    task_run                                ; 2E73 _ E8, FFFFFFFC(rel)
        mov     eax, dword [sheet_control]              ; 2E78 _ A1, 00000000(d)
        mov     dword [esp+0CH], 4                      ; 2E7D _ C7. 44 24, 0C, 00000004
        mov     dword [esp+8H], 32                      ; 2E85 _ C7. 44 24, 08, 00000020
        mov     edx, dword [ebp-0CH]                    ; 2E8D _ 8B. 55, F4
        mov     dword [esp+4H], edx                     ; 2E90 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 2E94 _ 89. 04 24
        call    sheet_slide                             ; 2E97 _ E8, FFFFFFFC(rel)
        mov     eax, dword [sheet_control]              ; 2E9C _ A1, 00000000(d)
        mov     dword [esp+8H], 1                       ; 2EA1 _ C7. 44 24, 08, 00000001
        mov     edx, dword [ebp-0CH]                    ; 2EA9 _ 8B. 55, F4
        mov     dword [esp+4H], edx                     ; 2EAC _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 2EB0 _ 89. 04 24
        call    sheet_updown                            ; 2EB3 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-14H]                    ; 2EB8 _ 8B. 45, EC
        mov     dword [task_console_g], eax             ; 2EBB _ A3, 00000000(d)
        mov     eax, dword [ebp-0CH]                    ; 2EC0 _ 8B. 45, F4
        add     esp, 52                                 ; 2EC3 _ 83. C4, 34
        pop     ebx                                     ; 2EC6 _ 5B
        pop     ebp                                     ; 2EC7 _ 5D
        ret                                             ; 2EC8 _ C3
; launch_console End of function

set_cursor:; Function begin
        push    ebp                                     ; 2EC9 _ 55
        mov     ebp, esp                                ; 2ECA _ 89. E5
        push    esi                                     ; 2ECC _ 56
        push    ebx                                     ; 2ECD _ 53
        sub     esp, 32                                 ; 2ECE _ 83. EC, 20
        mov     eax, dword [ebp+14H]                    ; 2ED1 _ 8B. 45, 14
        lea     esi, [eax+0FH]                          ; 2ED4 _ 8D. 70, 0F
        mov     eax, dword [ebp+10H]                    ; 2ED7 _ 8B. 45, 10
        lea     ebx, [eax+7H]                           ; 2EDA _ 8D. 58, 07
        mov     eax, dword [ebp+18H]                    ; 2EDD _ 8B. 45, 18
        movzx   ecx, al                                 ; 2EE0 _ 0F B6. C8
        mov     eax, dword [ebp+0CH]                    ; 2EE3 _ 8B. 45, 0C
        mov     edx, dword [eax+4H]                     ; 2EE6 _ 8B. 50, 04
        mov     eax, dword [ebp+0CH]                    ; 2EE9 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 2EEC _ 8B. 00
        mov     dword [esp+18H], esi                    ; 2EEE _ 89. 74 24, 18
        mov     dword [esp+14H], ebx                    ; 2EF2 _ 89. 5C 24, 14
        mov     ebx, dword [ebp+14H]                    ; 2EF6 _ 8B. 5D, 14
        mov     dword [esp+10H], ebx                    ; 2EF9 _ 89. 5C 24, 10
        mov     ebx, dword [ebp+10H]                    ; 2EFD _ 8B. 5D, 10
        mov     dword [esp+0CH], ebx                    ; 2F00 _ 89. 5C 24, 0C
        mov     dword [esp+8H], ecx                     ; 2F04 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 2F08 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 2F0C _ 89. 04 24
        call    paint_rectangle                         ; 2F0F _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+14H]                    ; 2F14 _ 8B. 45, 14
        lea     edx, [eax+10H]                          ; 2F17 _ 8D. 50, 10
        mov     eax, dword [ebp+10H]                    ; 2F1A _ 8B. 45, 10
        add     eax, 8                                  ; 2F1D _ 83. C0, 08
        mov     dword [esp+14H], edx                    ; 2F20 _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 2F24 _ 89. 44 24, 10
        mov     eax, dword [ebp+14H]                    ; 2F28 _ 8B. 45, 14
        mov     dword [esp+0CH], eax                    ; 2F2B _ 89. 44 24, 0C
        mov     eax, dword [ebp+10H]                    ; 2F2F _ 8B. 45, 10
        mov     dword [esp+8H], eax                     ; 2F32 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 2F36 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 2F39 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2F3D _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2F40 _ 89. 04 24
        call    sheet_refresh                           ; 2F43 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 2F48 _ 83. C4, 20
        pop     ebx                                     ; 2F4B _ 5B
        pop     esi                                     ; 2F4C _ 5E
        pop     ebp                                     ; 2F4D _ 5D
        ret                                             ; 2F4E _ C3
; set_cursor End of function

console_new_line:; Function begin
        push    ebp                                     ; 2F4F _ 55
        mov     ebp, esp                                ; 2F50 _ 89. E5
        push    ebx                                     ; 2F52 _ 53
        sub     esp, 52                                 ; 2F53 _ 83. EC, 34
        cmp     dword [ebp+8H], 139                     ; 2F56 _ 81. 7D, 08, 0000008B
        jg      ?_126                                   ; 2F5D _ 7F, 09
        add     dword [ebp+8H], 16                      ; 2F5F _ 83. 45, 08, 10
        jmp     ?_135                                   ; 2F63 _ E9, 000000DF

?_126:  mov     dword [ebp-10H], 28                     ; 2F68 _ C7. 45, F0, 0000001C
        jmp     ?_130                                   ; 2F6F _ EB, 52

?_127:  mov     dword [ebp-0CH], 8                      ; 2F71 _ C7. 45, F4, 00000008
        jmp     ?_129                                   ; 2F78 _ EB, 3C

?_128:  mov     eax, dword [ebp+0CH]                    ; 2F7A _ 8B. 45, 0C
        mov     edx, dword [eax]                        ; 2F7D _ 8B. 10
        mov     eax, dword [ebp+0CH]                    ; 2F7F _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 2F82 _ 8B. 40, 04
        imul    eax, dword [ebp-10H]                    ; 2F85 _ 0F AF. 45, F0
        mov     ecx, eax                                ; 2F89 _ 89. C1
        mov     eax, dword [ebp-0CH]                    ; 2F8B _ 8B. 45, F4
        add     eax, ecx                                ; 2F8E _ 01. C8
        add     edx, eax                                ; 2F90 _ 01. C2
        mov     eax, dword [ebp+0CH]                    ; 2F92 _ 8B. 45, 0C
        mov     ecx, dword [eax]                        ; 2F95 _ 8B. 08
        mov     eax, dword [ebp-10H]                    ; 2F97 _ 8B. 45, F0
        lea     ebx, [eax+10H]                          ; 2F9A _ 8D. 58, 10
        mov     eax, dword [ebp+0CH]                    ; 2F9D _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 2FA0 _ 8B. 40, 04
        imul    ebx, eax                                ; 2FA3 _ 0F AF. D8
        mov     eax, dword [ebp-0CH]                    ; 2FA6 _ 8B. 45, F4
        add     eax, ebx                                ; 2FA9 _ 01. D8
        add     eax, ecx                                ; 2FAB _ 01. C8
        movzx   eax, byte [eax]                         ; 2FAD _ 0F B6. 00
        mov     byte [edx], al                          ; 2FB0 _ 88. 02
        add     dword [ebp-0CH], 1                      ; 2FB2 _ 83. 45, F4, 01
?_129:  cmp     dword [ebp-0CH], 247                    ; 2FB6 _ 81. 7D, F4, 000000F7
        jle     ?_128                                   ; 2FBD _ 7E, BB
        add     dword [ebp-10H], 1                      ; 2FBF _ 83. 45, F0, 01
?_130:  cmp     dword [ebp-10H], 139                    ; 2FC3 _ 81. 7D, F0, 0000008B
        jle     ?_127                                   ; 2FCA _ 7E, A5
        mov     dword [ebp-10H], 140                    ; 2FCC _ C7. 45, F0, 0000008C
        jmp     ?_134                                   ; 2FD3 _ EB, 35

?_131:  mov     dword [ebp-0CH], 8                      ; 2FD5 _ C7. 45, F4, 00000008
        jmp     ?_133                                   ; 2FDC _ EB, 1F

?_132:  mov     eax, dword [ebp+0CH]                    ; 2FDE _ 8B. 45, 0C
        mov     edx, dword [eax]                        ; 2FE1 _ 8B. 10
        mov     eax, dword [ebp+0CH]                    ; 2FE3 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 2FE6 _ 8B. 40, 04
        imul    eax, dword [ebp-10H]                    ; 2FE9 _ 0F AF. 45, F0
        mov     ecx, eax                                ; 2FED _ 89. C1
        mov     eax, dword [ebp-0CH]                    ; 2FEF _ 8B. 45, F4
        add     eax, ecx                                ; 2FF2 _ 01. C8
        add     eax, edx                                ; 2FF4 _ 01. D0
        mov     byte [eax], 0                           ; 2FF6 _ C6. 00, 00
        add     dword [ebp-0CH], 1                      ; 2FF9 _ 83. 45, F4, 01
?_133:  cmp     dword [ebp-0CH], 247                    ; 2FFD _ 81. 7D, F4, 000000F7
        jle     ?_132                                   ; 3004 _ 7E, D8
        add     dword [ebp-10H], 1                      ; 3006 _ 83. 45, F0, 01
?_134:  cmp     dword [ebp-10H], 155                    ; 300A _ 81. 7D, F0, 0000009B
        jle     ?_131                                   ; 3011 _ 7E, C2
        mov     eax, dword [sheet_control]              ; 3013 _ A1, 00000000(d)
        mov     dword [esp+14H], 156                    ; 3018 _ C7. 44 24, 14, 0000009C
        mov     dword [esp+10H], 248                    ; 3020 _ C7. 44 24, 10, 000000F8
        mov     dword [esp+0CH], 28                     ; 3028 _ C7. 44 24, 0C, 0000001C
        mov     dword [esp+8H], 8                       ; 3030 _ C7. 44 24, 08, 00000008
        mov     edx, dword [ebp+0CH]                    ; 3038 _ 8B. 55, 0C
        mov     dword [esp+4H], edx                     ; 303B _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 303F _ 89. 04 24
        call    sheet_refresh                           ; 3042 _ E8, FFFFFFFC(rel)
?_135:  mov     eax, dword [sheet_control]              ; 3047 _ A1, 00000000(d)
        mov     dword [esp+14H], 7                      ; 304C _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_315                  ; 3054 _ C7. 44 24, 10, 00000060(d)
        mov     edx, dword [ebp+8H]                     ; 305C _ 8B. 55, 08
        mov     dword [esp+0CH], edx                    ; 305F _ 89. 54 24, 0C
        mov     dword [esp+8H], 8                       ; 3063 _ C7. 44 24, 08, 00000008
        mov     edx, dword [ebp+0CH]                    ; 306B _ 8B. 55, 0C
        mov     dword [esp+4H], edx                     ; 306E _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 3072 _ 89. 04 24
        call    paint_string                            ; 3075 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 307A _ 8B. 45, 08
        add     esp, 52                                 ; 307D _ 83. C4, 34
        pop     ebx                                     ; 3080 _ 5B
        pop     ebp                                     ; 3081 _ 5D
        ret                                             ; 3082 _ C3
; console_new_line End of function

strcmp: ; Function begin
        push    ebp                                     ; 3083 _ 55
        mov     ebp, esp                                ; 3084 _ 89. E5
        sub     esp, 16                                 ; 3086 _ 83. EC, 10
        cmp     dword [ebp+8H], 0                       ; 3089 _ 83. 7D, 08, 00
        jz      ?_136                                   ; 308D _ 74, 06
        cmp     dword [ebp+0CH], 0                      ; 308F _ 83. 7D, 0C, 00
        jnz     ?_137                                   ; 3093 _ 75, 0A
?_136:  mov     eax, 0                                  ; 3095 _ B8, 00000000
        jmp     ?_144                                   ; 309A _ E9, 00000092

?_137:  mov     dword [ebp-4H], 0                       ; 309F _ C7. 45, FC, 00000000
        jmp     ?_140                                   ; 30A6 _ EB, 25

?_138:  mov     edx, dword [ebp-4H]                     ; 30A8 _ 8B. 55, FC
        mov     eax, dword [ebp+8H]                     ; 30AB _ 8B. 45, 08
        add     eax, edx                                ; 30AE _ 01. D0
        movzx   edx, byte [eax]                         ; 30B0 _ 0F B6. 10
        mov     ecx, dword [ebp-4H]                     ; 30B3 _ 8B. 4D, FC
        mov     eax, dword [ebp+0CH]                    ; 30B6 _ 8B. 45, 0C
        add     eax, ecx                                ; 30B9 _ 01. C8
        movzx   eax, byte [eax]                         ; 30BB _ 0F B6. 00
        cmp     dl, al                                  ; 30BE _ 38. C2
        jz      ?_139                                   ; 30C0 _ 74, 07
        mov     eax, 0                                  ; 30C2 _ B8, 00000000
        jmp     ?_144                                   ; 30C7 _ EB, 68

?_139:  add     dword [ebp-4H], 1                       ; 30C9 _ 83. 45, FC, 01
?_140:  mov     edx, dword [ebp-4H]                     ; 30CD _ 8B. 55, FC
        mov     eax, dword [ebp+8H]                     ; 30D0 _ 8B. 45, 08
        add     eax, edx                                ; 30D3 _ 01. D0
        movzx   eax, byte [eax]                         ; 30D5 _ 0F B6. 00
        test    al, al                                  ; 30D8 _ 84. C0
        jz      ?_141                                   ; 30DA _ 74, 06
        cmp     dword [ebp+0CH], 0                      ; 30DC _ 83. 7D, 0C, 00
        jnz     ?_138                                   ; 30E0 _ 75, C6
?_141:  mov     edx, dword [ebp-4H]                     ; 30E2 _ 8B. 55, FC
        mov     eax, dword [ebp+8H]                     ; 30E5 _ 8B. 45, 08
        add     eax, edx                                ; 30E8 _ 01. D0
        movzx   eax, byte [eax]                         ; 30EA _ 0F B6. 00
        test    al, al                                  ; 30ED _ 84. C0
        jnz     ?_142                                   ; 30EF _ 75, 16
        mov     edx, dword [ebp-4H]                     ; 30F1 _ 8B. 55, FC
        mov     eax, dword [ebp+0CH]                    ; 30F4 _ 8B. 45, 0C
        add     eax, edx                                ; 30F7 _ 01. D0
        movzx   eax, byte [eax]                         ; 30F9 _ 0F B6. 00
        test    al, al                                  ; 30FC _ 84. C0
        jz      ?_142                                   ; 30FE _ 74, 07
        mov     eax, 0                                  ; 3100 _ B8, 00000000
        jmp     ?_144                                   ; 3105 _ EB, 2A

?_142:  mov     edx, dword [ebp-4H]                     ; 3107 _ 8B. 55, FC
        mov     eax, dword [ebp+8H]                     ; 310A _ 8B. 45, 08
        add     eax, edx                                ; 310D _ 01. D0
        movzx   eax, byte [eax]                         ; 310F _ 0F B6. 00
        test    al, al                                  ; 3112 _ 84. C0
        jz      ?_143                                   ; 3114 _ 74, 16
        mov     edx, dword [ebp-4H]                     ; 3116 _ 8B. 55, FC
        mov     eax, dword [ebp+0CH]                    ; 3119 _ 8B. 45, 0C
        add     eax, edx                                ; 311C _ 01. D0
        movzx   eax, byte [eax]                         ; 311E _ 0F B6. 00
        test    al, al                                  ; 3121 _ 84. C0
        jz      ?_143                                   ; 3123 _ 74, 07
        mov     eax, 0                                  ; 3125 _ B8, 00000000
        jmp     ?_144                                   ; 312A _ EB, 05

?_143:  mov     eax, 1                                  ; 312C _ B8, 00000001
?_144:  leave                                           ; 3131 _ C9
        ret                                             ; 3132 _ C3
; strcmp End of function

c_console_putchar:; Function begin
        push    ebp                                     ; 3133 _ 55
        mov     ebp, esp                                ; 3134 _ 89. E5
        push    ebx                                     ; 3136 _ 53
        sub     esp, 36                                 ; 3137 _ 83. EC, 24
        mov     edx, dword [ebp+8H]                     ; 313A _ 8B. 55, 08
        mov     eax, dword [ebp+0CH]                    ; 313D _ 8B. 45, 0C
        mov     byte [ebp-0CH], dl                      ; 3140 _ 88. 55, F4
        mov     byte [ebp-10H], al                      ; 3143 _ 88. 45, F0
        mov     ebx, dword [?_332]                      ; 3146 _ 8B. 1D, 000000B0(d)
        mov     ecx, dword [?_331]                      ; 314C _ 8B. 0D, 000000AC(d)
        mov     edx, dword [g_Console]                  ; 3152 _ 8B. 15, 000000A8(d)
        mov     eax, dword [sheet_control]              ; 3158 _ A1, 00000000(d)
        mov     dword [esp+10H], 0                      ; 315D _ C7. 44 24, 10, 00000000
        mov     dword [esp+0CH], ebx                    ; 3165 _ 89. 5C 24, 0C
        mov     dword [esp+8H], ecx                     ; 3169 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 316D _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 3171 _ 89. 04 24
        call    set_cursor                              ; 3174 _ E8, FFFFFFFC(rel)
        movzx   eax, byte [ebp-0CH]                     ; 3179 _ 0F B6. 45, F4
        mov     byte [?_334], al                        ; 317D _ A2, 000000B8(d)
        mov     byte [?_335], 0                         ; 3182 _ C6. 05, 000000B9(d), 00
        mov     ebx, dword [?_332]                      ; 3189 _ 8B. 1D, 000000B0(d)
        mov     ecx, dword [?_331]                      ; 318F _ 8B. 0D, 000000AC(d)
        mov     edx, dword [g_Console]                  ; 3195 _ 8B. 15, 000000A8(d)
        mov     eax, dword [sheet_control]              ; 319B _ A1, 00000000(d)
        mov     dword [esp+14H], 7                      ; 31A0 _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_334                  ; 31A8 _ C7. 44 24, 10, 000000B8(d)
        mov     dword [esp+0CH], ebx                    ; 31B0 _ 89. 5C 24, 0C
        mov     dword [esp+8H], ecx                     ; 31B4 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 31B8 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 31BC _ 89. 04 24
        call    paint_string                            ; 31BF _ E8, FFFFFFFC(rel)
        mov     eax, dword [?_331]                      ; 31C4 _ A1, 000000AC(d)
        add     eax, 8                                  ; 31C9 _ 83. C0, 08
        mov     dword [?_331], eax                      ; 31CC _ A3, 000000AC(d)
        add     esp, 36                                 ; 31D1 _ 83. C4, 24
        pop     ebx                                     ; 31D4 _ 5B
        pop     ebp                                     ; 31D5 _ 5D
        ret                                             ; 31D6 _ C3
; c_console_putchar End of function

c_console_putstr:; Function begin
        push    ebp                                     ; 31D7 _ 55
        mov     ebp, esp                                ; 31D8 _ 89. E5
        sub     esp, 24                                 ; 31DA _ 83. EC, 18
        jmp     ?_146                                   ; 31DD _ EB, 1D

?_145:  mov     eax, dword [ebp+8H]                     ; 31DF _ 8B. 45, 08
        movzx   eax, byte [eax]                         ; 31E2 _ 0F B6. 00
        movsx   eax, al                                 ; 31E5 _ 0F BE. C0
        mov     dword [esp+4H], 1                       ; 31E8 _ C7. 44 24, 04, 00000001
        mov     dword [esp], eax                        ; 31F0 _ 89. 04 24
        call    c_console_putchar                       ; 31F3 _ E8, FFFFFFFC(rel)
        add     dword [ebp+8H], 1                       ; 31F8 _ 83. 45, 08, 01
?_146:  mov     eax, dword [ebp+8H]                     ; 31FC _ 8B. 45, 08
        movzx   eax, byte [eax]                         ; 31FF _ 0F B6. 00
        test    al, al                                  ; 3202 _ 84. C0
        jnz     ?_145                                   ; 3204 _ 75, D9
        leave                                           ; 3206 _ C9
        ret                                             ; 3207 _ C3
; c_console_putstr End of function

kernel_api:; Function begin
        push    ebp                                     ; 3208 _ 55
        mov     ebp, esp                                ; 3209 _ 89. E5
        sub     esp, 40                                 ; 320B _ 83. EC, 28
        call    task_now                                ; 320E _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 3213 _ 89. 45, F4
        cmp     dword [ebp+1CH], 1                      ; 3216 _ 83. 7D, 1C, 01
        jnz     ?_147                                   ; 321A _ 75, 18
        mov     eax, dword [ebp+24H]                    ; 321C _ 8B. 45, 24
        movsx   eax, al                                 ; 321F _ 0F BE. C0
        mov     dword [esp+4H], 1                       ; 3222 _ C7. 44 24, 04, 00000001
        mov     dword [esp], eax                        ; 322A _ 89. 04 24
        call    c_console_putchar                       ; 322D _ E8, FFFFFFFC(rel)
        jmp     ?_149                                   ; 3232 _ EB, 29

?_147:  cmp     dword [ebp+1CH], 2                      ; 3234 _ 83. 7D, 1C, 02
        jnz     ?_148                                   ; 3238 _ 75, 15
        mov     edx, dword [buffer]                     ; 323A _ 8B. 15, 000001D8(d)
        mov     eax, dword [ebp+18H]                    ; 3240 _ 8B. 45, 18
        add     eax, edx                                ; 3243 _ 01. D0
        mov     dword [esp], eax                        ; 3245 _ 89. 04 24
        call    c_console_putstr                        ; 3248 _ E8, FFFFFFFC(rel)
        jmp     ?_149                                   ; 324D _ EB, 0E

?_148:  cmp     dword [ebp+1CH], 4                      ; 324F _ 83. 7D, 1C, 04
        jnz     ?_149                                   ; 3253 _ 75, 08
        mov     eax, dword [ebp-0CH]                    ; 3255 _ 8B. 45, F4
        add     eax, 48                                 ; 3258 _ 83. C0, 30
        jmp     ?_150                                   ; 325B _ EB, 05

?_149:  mov     eax, 0                                  ; 325D _ B8, 00000000
?_150:  leave                                           ; 3262 _ C9
        ret                                             ; 3263 _ C3
; kernel_api End of function

intHandlerException:; Function begin
        push    ebp                                     ; 3264 _ 55
        mov     ebp, esp                                ; 3265 _ 89. E5
        sub     esp, 24                                 ; 3267 _ 83. EC, 18
        mov     dword [?_331], 8                        ; 326A _ C7. 05, 000000AC(d), 00000008
        mov     dword [esp], ?_325                      ; 3274 _ C7. 04 24, 0000008E(d)
        call    c_console_putstr                        ; 327B _ E8, FFFFFFFC(rel)
        mov     dword [?_331], 8                        ; 3280 _ C7. 05, 000000AC(d), 00000008
        mov     eax, dword [?_332]                      ; 328A _ A1, 000000B0(d)
        add     eax, 16                                 ; 328F _ 83. C0, 10
        mov     dword [?_332], eax                      ; 3292 _ A3, 000000B0(d)
        mov     dword [esp], ?_326                      ; 3297 _ C7. 04 24, 00000096(d)
        call    c_console_putstr                        ; 329E _ E8, FFFFFFFC(rel)
        mov     eax, dword [?_332]                      ; 32A3 _ A1, 000000B0(d)
        add     eax, 16                                 ; 32A8 _ 83. C0, 10
        mov     dword [?_332], eax                      ; 32AB _ A3, 000000B0(d)
        mov     dword [?_331], 8                        ; 32B0 _ C7. 05, 000000AC(d), 00000008
        nop                                             ; 32BA _ 90
        leave                                           ; 32BB _ C9
        ret                                             ; 32BC _ C3
; intHandlerException End of function

wait_KBC_sendready:; Function begin
        push    ebp                                     ; 32BD _ 55
        mov     ebp, esp                                ; 32BE _ 89. E5
        sub     esp, 24                                 ; 32C0 _ 83. EC, 18
?_151:  mov     dword [esp], 100                        ; 32C3 _ C7. 04 24, 00000064
        call    io_in8                                  ; 32CA _ E8, FFFFFFFC(rel)
        and     eax, 02H                                ; 32CF _ 83. E0, 02
        test    eax, eax                                ; 32D2 _ 85. C0
        jnz     ?_152                                   ; 32D4 _ 75, 02
        jmp     ?_153                                   ; 32D6 _ EB, 02

?_152:  jmp     ?_151                                   ; 32D8 _ EB, E9

?_153:  leave                                           ; 32DA _ C9
        ret                                             ; 32DB _ C3
; wait_KBC_sendready End of function

init_keyboard:; Function begin
        push    ebp                                     ; 32DC _ 55
        mov     ebp, esp                                ; 32DD _ 89. E5
        sub     esp, 24                                 ; 32DF _ 83. EC, 18
        call    wait_KBC_sendready                      ; 32E2 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 96                      ; 32E7 _ C7. 44 24, 04, 00000060
        mov     dword [esp], 100                        ; 32EF _ C7. 04 24, 00000064
        call    io_out8                                 ; 32F6 _ E8, FFFFFFFC(rel)
        call    wait_KBC_sendready                      ; 32FB _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 71                      ; 3300 _ C7. 44 24, 04, 00000047
        mov     dword [esp], 96                         ; 3308 _ C7. 04 24, 00000060
        call    io_out8                                 ; 330F _ E8, FFFFFFFC(rel)
        leave                                           ; 3314 _ C9
        ret                                             ; 3315 _ C3
; init_keyboard End of function

enable_mouse:; Function begin
        push    ebp                                     ; 3316 _ 55
        mov     ebp, esp                                ; 3317 _ 89. E5
        sub     esp, 24                                 ; 3319 _ 83. EC, 18
        call    wait_KBC_sendready                      ; 331C _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 212                     ; 3321 _ C7. 44 24, 04, 000000D4
        mov     dword [esp], 100                        ; 3329 _ C7. 04 24, 00000064
        call    io_out8                                 ; 3330 _ E8, FFFFFFFC(rel)
        call    wait_KBC_sendready                      ; 3335 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 244                     ; 333A _ C7. 44 24, 04, 000000F4
        mov     dword [esp], 96                         ; 3342 _ C7. 04 24, 00000060
        call    io_out8                                 ; 3349 _ E8, FFFFFFFC(rel)
        leave                                           ; 334E _ C9
        ret                                             ; 334F _ C3
; enable_mouse End of function

mouse_decode:; Function begin
        push    ebp                                     ; 3350 _ 55
        mov     ebp, esp                                ; 3351 _ 89. E5
        sub     esp, 4                                  ; 3353 _ 83. EC, 04
        mov     eax, dword [ebp+0CH]                    ; 3356 _ 8B. 45, 0C
        mov     byte [ebp-4H], al                       ; 3359 _ 88. 45, FC
        mov     eax, dword [ebp+8H]                     ; 335C _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 335F _ 0F B6. 40, 03
        test    al, al                                  ; 3363 _ 84. C0
        jnz     ?_155                                   ; 3365 _ 75, 17
        cmp     byte [ebp-4H], -6                       ; 3367 _ 80. 7D, FC, FA
        jnz     ?_154                                   ; 336B _ 75, 07
        mov     eax, dword [ebp+8H]                     ; 336D _ 8B. 45, 08
        mov     byte [eax+3H], 1                        ; 3370 _ C6. 40, 03, 01
?_154:  mov     eax, 0                                  ; 3374 _ B8, 00000000
        jmp     ?_162                                   ; 3379 _ E9, 0000010F

?_155:  mov     eax, dword [ebp+8H]                     ; 337E _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 3381 _ 0F B6. 40, 03
        cmp     al, 1                                   ; 3385 _ 3C, 01
        jnz     ?_157                                   ; 3387 _ 75, 28
        movzx   eax, byte [ebp-4H]                      ; 3389 _ 0F B6. 45, FC
        and     eax, 0C8H                               ; 338D _ 25, 000000C8
        cmp     eax, 8                                  ; 3392 _ 83. F8, 08
        jnz     ?_156                                   ; 3395 _ 75, 10
        mov     eax, dword [ebp+8H]                     ; 3397 _ 8B. 45, 08
        movzx   edx, byte [ebp-4H]                      ; 339A _ 0F B6. 55, FC
        mov     byte [eax], dl                          ; 339E _ 88. 10
        mov     eax, dword [ebp+8H]                     ; 33A0 _ 8B. 45, 08
        mov     byte [eax+3H], 2                        ; 33A3 _ C6. 40, 03, 02
?_156:  mov     eax, 0                                  ; 33A7 _ B8, 00000000
        jmp     ?_162                                   ; 33AC _ E9, 000000DC

?_157:  mov     eax, dword [ebp+8H]                     ; 33B1 _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 33B4 _ 0F B6. 40, 03
        cmp     al, 2                                   ; 33B8 _ 3C, 02
        jnz     ?_158                                   ; 33BA _ 75, 1B
        mov     eax, dword [ebp+8H]                     ; 33BC _ 8B. 45, 08
        movzx   edx, byte [ebp-4H]                      ; 33BF _ 0F B6. 55, FC
        mov     byte [eax+1H], dl                       ; 33C3 _ 88. 50, 01
        mov     eax, dword [ebp+8H]                     ; 33C6 _ 8B. 45, 08
        mov     byte [eax+3H], 3                        ; 33C9 _ C6. 40, 03, 03
        mov     eax, 0                                  ; 33CD _ B8, 00000000
        jmp     ?_162                                   ; 33D2 _ E9, 000000B6

?_158:  mov     eax, dword [ebp+8H]                     ; 33D7 _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 33DA _ 0F B6. 40, 03
        cmp     al, 3                                   ; 33DE _ 3C, 03
        jne     ?_161                                   ; 33E0 _ 0F 85, 000000A2
        mov     eax, dword [ebp+8H]                     ; 33E6 _ 8B. 45, 08
        movzx   edx, byte [ebp-4H]                      ; 33E9 _ 0F B6. 55, FC
        mov     byte [eax+2H], dl                       ; 33ED _ 88. 50, 02
        mov     eax, dword [ebp+8H]                     ; 33F0 _ 8B. 45, 08
        mov     byte [eax+3H], 1                        ; 33F3 _ C6. 40, 03, 01
        mov     eax, dword [ebp+8H]                     ; 33F7 _ 8B. 45, 08
        movzx   eax, byte [eax]                         ; 33FA _ 0F B6. 00
        movzx   eax, al                                 ; 33FD _ 0F B6. C0
        and     eax, 07H                                ; 3400 _ 83. E0, 07
        mov     edx, eax                                ; 3403 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 3405 _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 3408 _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 340B _ 8B. 45, 08
        movzx   eax, byte [eax+1H]                      ; 340E _ 0F B6. 40, 01
        movzx   edx, al                                 ; 3412 _ 0F B6. D0
        mov     eax, dword [ebp+8H]                     ; 3415 _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 3418 _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 341B _ 8B. 45, 08
        movzx   eax, byte [eax+2H]                      ; 341E _ 0F B6. 40, 02
        movzx   edx, al                                 ; 3422 _ 0F B6. D0
        mov     eax, dword [ebp+8H]                     ; 3425 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 3428 _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 342B _ 8B. 45, 08
        movzx   eax, byte [eax]                         ; 342E _ 0F B6. 00
        movzx   eax, al                                 ; 3431 _ 0F B6. C0
        and     eax, 10H                                ; 3434 _ 83. E0, 10
        test    eax, eax                                ; 3437 _ 85. C0
        jz      ?_159                                   ; 3439 _ 74, 13
        mov     eax, dword [ebp+8H]                     ; 343B _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 343E _ 8B. 40, 04
        or      eax, 0FFFFFF00H                         ; 3441 _ 0D, FFFFFF00
        mov     edx, eax                                ; 3446 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 3448 _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 344B _ 89. 50, 04
?_159:  mov     eax, dword [ebp+8H]                     ; 344E _ 8B. 45, 08
        movzx   eax, byte [eax]                         ; 3451 _ 0F B6. 00
        movzx   eax, al                                 ; 3454 _ 0F B6. C0
        and     eax, 20H                                ; 3457 _ 83. E0, 20
        test    eax, eax                                ; 345A _ 85. C0
        jz      ?_160                                   ; 345C _ 74, 13
        mov     eax, dword [ebp+8H]                     ; 345E _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 3461 _ 8B. 40, 08
        or      eax, 0FFFFFF00H                         ; 3464 _ 0D, FFFFFF00
        mov     edx, eax                                ; 3469 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 346B _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 346E _ 89. 50, 08
?_160:  mov     eax, dword [ebp+8H]                     ; 3471 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 3474 _ 8B. 40, 08
        neg     eax                                     ; 3477 _ F7. D8
        mov     edx, eax                                ; 3479 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 347B _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 347E _ 89. 50, 08
        mov     eax, 1                                  ; 3481 _ B8, 00000001
        jmp     ?_162                                   ; 3486 _ EB, 05

?_161:  mov     eax, 4294967295                         ; 3488 _ B8, FFFFFFFF
?_162:  leave                                           ; 348D _ C9
        ret                                             ; 348E _ C3
; mouse_decode End of function

intHandlerKeyboard:; Function begin
        push    ebp                                     ; 348F _ 55
        mov     ebp, esp                                ; 3490 _ 89. E5
        sub     esp, 40                                 ; 3492 _ 83. EC, 28
        mov     dword [esp+4H], 32                      ; 3495 _ C7. 44 24, 04, 00000020
        mov     dword [esp], 32                         ; 349D _ C7. 04 24, 00000020
        call    io_out8                                 ; 34A4 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 32                      ; 34A9 _ C7. 44 24, 04, 00000020
        mov     dword [esp], 160                        ; 34B1 _ C7. 04 24, 000000A0
        call    io_out8                                 ; 34B8 _ E8, FFFFFFFC(rel)
        mov     dword [esp], 96                         ; 34BD _ C7. 04 24, 00000060
        call    io_in8                                  ; 34C4 _ E8, FFFFFFFC(rel)
        mov     byte [ebp-9H], al                       ; 34C9 _ 88. 45, F7
        movzx   eax, byte [ebp-9H]                      ; 34CC _ 0F B6. 45, F7
        mov     dword [esp+4H], eax                     ; 34D0 _ 89. 44 24, 04
        mov     dword [esp], keyinfo                    ; 34D4 _ C7. 04 24, 00000000(d)
        call    fifo8_put                               ; 34DB _ E8, FFFFFFFC(rel)
        leave                                           ; 34E0 _ C9
        ret                                             ; 34E1 _ C3
; intHandlerKeyboard End of function

intHandlerMouse:; Function begin
        push    ebp                                     ; 34E2 _ 55
        mov     ebp, esp                                ; 34E3 _ 89. E5
        sub     esp, 40                                 ; 34E5 _ 83. EC, 28
        mov     dword [esp+4H], 32                      ; 34E8 _ C7. 44 24, 04, 00000020
        mov     dword [esp], 32                         ; 34F0 _ C7. 04 24, 00000020
        call    io_out8                                 ; 34F7 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 32                      ; 34FC _ C7. 44 24, 04, 00000020
        mov     dword [esp], 160                        ; 3504 _ C7. 04 24, 000000A0
        call    io_out8                                 ; 350B _ E8, FFFFFFFC(rel)
        mov     dword [esp], 96                         ; 3510 _ C7. 04 24, 00000060
        call    io_in8                                  ; 3517 _ E8, FFFFFFFC(rel)
        mov     byte [ebp-9H], al                       ; 351C _ 88. 45, F7
        movzx   eax, byte [ebp-9H]                      ; 351F _ 0F B6. 45, F7
        mov     dword [esp+4H], eax                     ; 3523 _ 89. 44 24, 04
        mov     dword [esp], mouseinfo                  ; 3527 _ C7. 04 24, 00000000(d)
        call    fifo8_put                               ; 352E _ E8, FFFFFFFC(rel)
        leave                                           ; 3533 _ C9
        ret                                             ; 3534 _ C3
; intHandlerMouse End of function

fifo8_init:; Function begin
        push    ebp                                     ; 3535 _ 55
        mov     ebp, esp                                ; 3536 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 3538 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 353B _ 8B. 55, 10
        mov     dword [eax], edx                        ; 353E _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 3540 _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 3543 _ C7. 40, 04, 00000000
        mov     eax, dword [ebp+8H]                     ; 354A _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 354D _ C7. 40, 08, 00000000
        mov     eax, dword [ebp+8H]                     ; 3554 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 3557 _ 8B. 55, 0C
        mov     dword [eax+0CH], edx                    ; 355A _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 355D _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 3560 _ 8B. 55, 0C
        mov     dword [eax+10H], edx                    ; 3563 _ 89. 50, 10
        mov     eax, dword [ebp+8H]                     ; 3566 _ 8B. 45, 08
        mov     dword [eax+14H], 0                      ; 3569 _ C7. 40, 14, 00000000
        mov     eax, dword [ebp+8H]                     ; 3570 _ 8B. 45, 08
        mov     edx, dword [ebp+14H]                    ; 3573 _ 8B. 55, 14
        mov     dword [eax+18H], edx                    ; 3576 _ 89. 50, 18
        pop     ebp                                     ; 3579 _ 5D
        ret                                             ; 357A _ C3
; fifo8_init End of function

fifo8_put:; Function begin
        push    ebp                                     ; 357B _ 55
        mov     ebp, esp                                ; 357C _ 89. E5
        sub     esp, 40                                 ; 357E _ 83. EC, 28
        mov     eax, dword [ebp+0CH]                    ; 3581 _ 8B. 45, 0C
        mov     byte [ebp-1CH], al                      ; 3584 _ 88. 45, E4
        cmp     dword [ebp+8H], 0                       ; 3587 _ 83. 7D, 08, 00
        jnz     ?_163                                   ; 358B _ 75, 0A
        mov     eax, 4294967295                         ; 358D _ B8, FFFFFFFF
        jmp     ?_167                                   ; 3592 _ E9, 000000B1

?_163:  mov     eax, dword [ebp+8H]                     ; 3597 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 359A _ 8B. 40, 10
        test    eax, eax                                ; 359D _ 85. C0
        jnz     ?_164                                   ; 359F _ 75, 1B
        mov     eax, dword [ebp+8H]                     ; 35A1 _ 8B. 45, 08
        mov     eax, dword [eax+14H]                    ; 35A4 _ 8B. 40, 14
        or      eax, 01H                                ; 35A7 _ 83. C8, 01
        mov     edx, eax                                ; 35AA _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 35AC _ 8B. 45, 08
        mov     dword [eax+14H], edx                    ; 35AF _ 89. 50, 14
        mov     eax, 4294967295                         ; 35B2 _ B8, FFFFFFFF
        jmp     ?_167                                   ; 35B7 _ E9, 0000008C

?_164:  mov     eax, dword [ebp+8H]                     ; 35BC _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 35BF _ 8B. 40, 04
        mov     dword [ebp-0CH], eax                    ; 35C2 _ 89. 45, F4
        mov     eax, dword [ebp+8H]                     ; 35C5 _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 35C8 _ 8B. 10
        mov     eax, dword [ebp-0CH]                    ; 35CA _ 8B. 45, F4
        add     edx, eax                                ; 35CD _ 01. C2
        movzx   eax, byte [ebp-1CH]                     ; 35CF _ 0F B6. 45, E4
        mov     byte [edx], al                          ; 35D3 _ 88. 02
        mov     eax, dword [ebp+8H]                     ; 35D5 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 35D8 _ 8B. 40, 04
        lea     edx, [eax+1H]                           ; 35DB _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 35DE _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 35E1 _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 35E4 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 35E7 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 35EA _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 35ED _ 8B. 40, 0C
        cmp     edx, eax                                ; 35F0 _ 39. C2
        jnz     ?_165                                   ; 35F2 _ 75, 0A
        mov     eax, dword [ebp+8H]                     ; 35F4 _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 35F7 _ C7. 40, 04, 00000000
?_165:  mov     eax, dword [ebp+8H]                     ; 35FE _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 3601 _ 8B. 40, 10
        lea     edx, [eax-1H]                           ; 3604 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 3607 _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 360A _ 89. 50, 10
        mov     eax, dword [ebp+8H]                     ; 360D _ 8B. 45, 08
        mov     eax, dword [eax+18H]                    ; 3610 _ 8B. 40, 18
        test    eax, eax                                ; 3613 _ 85. C0
        jz      ?_166                                   ; 3615 _ 74, 2C
        mov     eax, dword [ebp+8H]                     ; 3617 _ 8B. 45, 08
        mov     eax, dword [eax+18H]                    ; 361A _ 8B. 40, 18
        mov     eax, dword [eax+4H]                     ; 361D _ 8B. 40, 04
        cmp     eax, 2                                  ; 3620 _ 83. F8, 02
        jz      ?_166                                   ; 3623 _ 74, 1E
        mov     eax, dword [ebp+8H]                     ; 3625 _ 8B. 45, 08
        mov     eax, dword [eax+18H]                    ; 3628 _ 8B. 40, 18
        mov     dword [esp+8H], 0                       ; 362B _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], -1                      ; 3633 _ C7. 44 24, 04, FFFFFFFF
        mov     dword [esp], eax                        ; 363B _ 89. 04 24
        call    task_run                                ; 363E _ E8, FFFFFFFC(rel)
?_166:  mov     eax, 0                                  ; 3643 _ B8, 00000000
?_167:  leave                                           ; 3648 _ C9
        ret                                             ; 3649 _ C3
; fifo8_put End of function

fifo8_get:; Function begin
        push    ebp                                     ; 364A _ 55
        mov     ebp, esp                                ; 364B _ 89. E5
        sub     esp, 16                                 ; 364D _ 83. EC, 10
        mov     eax, dword [ebp+8H]                     ; 3650 _ 8B. 45, 08
        mov     edx, dword [eax+10H]                    ; 3653 _ 8B. 50, 10
        mov     eax, dword [ebp+8H]                     ; 3656 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 3659 _ 8B. 40, 0C
        cmp     edx, eax                                ; 365C _ 39. C2
        jnz     ?_168                                   ; 365E _ 75, 11
        mov     eax, dword [ebp+8H]                     ; 3660 _ 8B. 45, 08
        mov     dword [eax+14H], 0                      ; 3663 _ C7. 40, 14, 00000000
        mov     eax, 4294967295                         ; 366A _ B8, FFFFFFFF
        jmp     ?_170                                   ; 366F _ EB, 57

?_168:  mov     eax, dword [ebp+8H]                     ; 3671 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 3674 _ 8B. 40, 08
        mov     dword [ebp-8H], eax                     ; 3677 _ 89. 45, F8
        mov     eax, dword [ebp+8H]                     ; 367A _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 367D _ 8B. 10
        mov     eax, dword [ebp-8H]                     ; 367F _ 8B. 45, F8
        add     eax, edx                                ; 3682 _ 01. D0
        movzx   eax, byte [eax]                         ; 3684 _ 0F B6. 00
        movzx   eax, al                                 ; 3687 _ 0F B6. C0
        mov     dword [ebp-4H], eax                     ; 368A _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 368D _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 3690 _ 8B. 40, 08
        lea     edx, [eax+1H]                           ; 3693 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 3696 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 3699 _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 369C _ 8B. 45, 08
        mov     edx, dword [eax+8H]                     ; 369F _ 8B. 50, 08
        mov     eax, dword [ebp+8H]                     ; 36A2 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 36A5 _ 8B. 40, 0C
        cmp     edx, eax                                ; 36A8 _ 39. C2
        jnz     ?_169                                   ; 36AA _ 75, 0A
        mov     eax, dword [ebp+8H]                     ; 36AC _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 36AF _ C7. 40, 08, 00000000
?_169:  mov     eax, dword [ebp+8H]                     ; 36B6 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 36B9 _ 8B. 40, 10
        lea     edx, [eax+1H]                           ; 36BC _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 36BF _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 36C2 _ 89. 50, 10
        mov     eax, dword [ebp-4H]                     ; 36C5 _ 8B. 45, FC
?_170:  leave                                           ; 36C8 _ C9
        ret                                             ; 36C9 _ C3
; fifo8_get End of function

fifo8_status:; Function begin
        push    ebp                                     ; 36CA _ 55
        mov     ebp, esp                                ; 36CB _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 36CD _ 8B. 45, 08
        mov     edx, dword [eax+0CH]                    ; 36D0 _ 8B. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 36D3 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 36D6 _ 8B. 40, 10
        sub     edx, eax                                ; 36D9 _ 29. C2
        mov     eax, edx                                ; 36DB _ 89. D0
        pop     ebp                                     ; 36DD _ 5D
        ret                                             ; 36DE _ C3
; fifo8_status End of function

charToHexVal:; Function begin
        push    ebp                                     ; 36DF _ 55
        mov     ebp, esp                                ; 36E0 _ 89. E5
        sub     esp, 4                                  ; 36E2 _ 83. EC, 04
        mov     eax, dword [ebp+8H]                     ; 36E5 _ 8B. 45, 08
        mov     byte [ebp-4H], al                       ; 36E8 _ 88. 45, FC
        cmp     byte [ebp-4H], 9                        ; 36EB _ 80. 7D, FC, 09
        jle     ?_171                                   ; 36EF _ 7E, 09
        movzx   eax, byte [ebp-4H]                      ; 36F1 _ 0F B6. 45, FC
        add     eax, 55                                 ; 36F5 _ 83. C0, 37
        jmp     ?_172                                   ; 36F8 _ EB, 07

?_171:  movzx   eax, byte [ebp-4H]                      ; 36FA _ 0F B6. 45, FC
        add     eax, 48                                 ; 36FE _ 83. C0, 30
?_172:  leave                                           ; 3701 _ C9
        ret                                             ; 3702 _ C3
; charToHexVal End of function

charToHexStr:; Function begin
        push    ebp                                     ; 3703 _ 55
        mov     ebp, esp                                ; 3704 _ 89. E5
        sub     esp, 24                                 ; 3706 _ 83. EC, 18
        mov     eax, dword [ebp+8H]                     ; 3709 _ 8B. 45, 08
        mov     byte [ebp-14H], al                      ; 370C _ 88. 45, EC
        mov     dword [ebp-4H], 0                       ; 370F _ C7. 45, FC, 00000000
        movzx   eax, byte [ebp-14H]                     ; 3716 _ 0F B6. 45, EC
        and     eax, 0FH                                ; 371A _ 83. E0, 0F
        mov     byte [ebp-5H], al                       ; 371D _ 88. 45, FB
        movsx   eax, byte [ebp-5H]                      ; 3720 _ 0F BE. 45, FB
        mov     dword [esp], eax                        ; 3724 _ 89. 04 24
        call    charToHexVal                            ; 3727 _ E8, FFFFFFFC(rel)
        mov     byte [?_328], al                        ; 372C _ A2, 00000343(d)
        movzx   eax, byte [ebp-14H]                     ; 3731 _ 0F B6. 45, EC
        shr     al, 4                                   ; 3735 _ C0. E8, 04
        mov     byte [ebp-14H], al                      ; 3738 _ 88. 45, EC
        movzx   eax, byte [ebp-14H]                     ; 373B _ 0F B6. 45, EC
        movsx   eax, al                                 ; 373F _ 0F BE. C0
        mov     dword [esp], eax                        ; 3742 _ 89. 04 24
        call    charToHexVal                            ; 3745 _ E8, FFFFFFFC(rel)
        mov     byte [?_327], al                        ; 374A _ A2, 00000342(d)
        mov     eax, keyval                             ; 374F _ B8, 00000340(d)
        leave                                           ; 3754 _ C9
        ret                                             ; 3755 _ C3
; charToHexStr End of function

intToHexStr:; Function begin
        push    ebp                                     ; 3756 _ 55
        mov     ebp, esp                                ; 3757 _ 89. E5
        sub     esp, 16                                 ; 3759 _ 83. EC, 10
        mov     byte [str.1386], 48                     ; 375C _ C6. 05, 000002E0(d), 30
        mov     byte [?_337], 88                        ; 3763 _ C6. 05, 000002E1(d), 58
        mov     byte [?_338], 0                         ; 376A _ C6. 05, 000002EA(d), 00
        mov     dword [ebp-0CH], 2                      ; 3771 _ C7. 45, F4, 00000002
        jmp     ?_174                                   ; 3778 _ EB, 0F

?_173:  mov     eax, dword [ebp-0CH]                    ; 377A _ 8B. 45, F4
        add     eax, str.1386                           ; 377D _ 05, 000002E0(d)
        mov     byte [eax], 48                          ; 3782 _ C6. 00, 30
        add     dword [ebp-0CH], 1                      ; 3785 _ 83. 45, F4, 01
?_174:  cmp     dword [ebp-0CH], 9                      ; 3789 _ 83. 7D, F4, 09
        jle     ?_173                                   ; 378D _ 7E, EB
        mov     dword [ebp-8H], 9                       ; 378F _ C7. 45, F8, 00000009
        jmp     ?_178                                   ; 3796 _ EB, 40

?_175:  mov     eax, dword [ebp+8H]                     ; 3798 _ 8B. 45, 08
        and     eax, 0FH                                ; 379B _ 83. E0, 0F
        mov     dword [ebp-4H], eax                     ; 379E _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 37A1 _ 8B. 45, 08
        shr     eax, 4                                  ; 37A4 _ C1. E8, 04
        mov     dword [ebp+8H], eax                     ; 37A7 _ 89. 45, 08
        cmp     dword [ebp-4H], 9                       ; 37AA _ 83. 7D, FC, 09
        jle     ?_176                                   ; 37AE _ 7E, 13
        mov     eax, dword [ebp-4H]                     ; 37B0 _ 8B. 45, FC
        add     eax, 55                                 ; 37B3 _ 83. C0, 37
        mov     edx, dword [ebp-8H]                     ; 37B6 _ 8B. 55, F8
        add     edx, str.1386                           ; 37B9 _ 81. C2, 000002E0(d)
        mov     byte [edx], al                          ; 37BF _ 88. 02
        jmp     ?_177                                   ; 37C1 _ EB, 11

?_176:  mov     eax, dword [ebp-4H]                     ; 37C3 _ 8B. 45, FC
        add     eax, 48                                 ; 37C6 _ 83. C0, 30
        mov     edx, dword [ebp-8H]                     ; 37C9 _ 8B. 55, F8
        add     edx, str.1386                           ; 37CC _ 81. C2, 000002E0(d)
        mov     byte [edx], al                          ; 37D2 _ 88. 02
?_177:  sub     dword [ebp-8H], 1                       ; 37D4 _ 83. 6D, F8, 01
?_178:  cmp     dword [ebp-8H], 1                       ; 37D8 _ 83. 7D, F8, 01
        jle     ?_179                                   ; 37DC _ 7E, 06
        cmp     dword [ebp+8H], 0                       ; 37DE _ 83. 7D, 08, 00
        jnz     ?_175                                   ; 37E2 _ 75, B4
?_179:  mov     eax, str.1386                           ; 37E4 _ B8, 000002E0(d)
        leave                                           ; 37E9 _ C9
        ret                                             ; 37EA _ C3
; intToHexStr End of function

memman_init:; Function begin
        push    ebp                                     ; 37EB _ 55
        mov     ebp, esp                                ; 37EC _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 37EE _ 8B. 45, 08
        mov     dword [eax], 0                          ; 37F1 _ C7. 00, 00000000
        mov     eax, dword [ebp+8H]                     ; 37F7 _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 37FA _ C7. 40, 04, 00000000
        mov     eax, dword [ebp+8H]                     ; 3801 _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 3804 _ C7. 40, 08, 00000000
        mov     eax, dword [ebp+8H]                     ; 380B _ 8B. 45, 08
        mov     dword [eax+0CH], 0                      ; 380E _ C7. 40, 0C, 00000000
        pop     ebp                                     ; 3815 _ 5D
        ret                                             ; 3816 _ C3
; memman_init End of function

memman_total:; Function begin
        push    ebp                                     ; 3817 _ 55
        mov     ebp, esp                                ; 3818 _ 89. E5
        sub     esp, 16                                 ; 381A _ 83. EC, 10
        mov     dword [ebp-4H], 0                       ; 381D _ C7. 45, FC, 00000000
        mov     dword [ebp-8H], 0                       ; 3824 _ C7. 45, F8, 00000000
        jmp     ?_181                                   ; 382B _ EB, 14

?_180:  mov     eax, dword [ebp+8H]                     ; 382D _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 3830 _ 8B. 55, F8
        add     edx, 2                                  ; 3833 _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 3836 _ 8B. 44 D0, 04
        add     dword [ebp-4H], eax                     ; 383A _ 01. 45, FC
        add     dword [ebp-8H], 1                       ; 383D _ 83. 45, F8, 01
?_181:  mov     eax, dword [ebp+8H]                     ; 3841 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 3844 _ 8B. 00
        cmp     eax, dword [ebp-8H]                     ; 3846 _ 3B. 45, F8
        ja      ?_180                                   ; 3849 _ 77, E2
        mov     eax, dword [ebp-4H]                     ; 384B _ 8B. 45, FC
        leave                                           ; 384E _ C9
        ret                                             ; 384F _ C3
; memman_total End of function

memman_alloc:; Function begin
        push    ebp                                     ; 3850 _ 55
        mov     ebp, esp                                ; 3851 _ 89. E5
        sub     esp, 16                                 ; 3853 _ 83. EC, 10
        mov     dword [ebp-8H], 0                       ; 3856 _ C7. 45, F8, 00000000
        jmp     ?_185                                   ; 385D _ E9, 00000085

?_182:  mov     eax, dword [ebp+8H]                     ; 3862 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 3865 _ 8B. 55, F8
        add     edx, 2                                  ; 3868 _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 386B _ 8B. 44 D0, 04
        cmp     eax, dword [ebp+0CH]                    ; 386F _ 3B. 45, 0C
        jc      ?_184                                   ; 3872 _ 72, 6F
        mov     eax, dword [ebp+8H]                     ; 3874 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 3877 _ 8B. 55, F8
        add     edx, 2                                  ; 387A _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 387D _ 8B. 04 D0
        mov     dword [ebp-4H], eax                     ; 3880 _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 3883 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 3886 _ 8B. 55, F8
        add     edx, 2                                  ; 3889 _ 83. C2, 02
        mov     edx, dword [eax+edx*8]                  ; 388C _ 8B. 14 D0
        mov     eax, dword [ebp+0CH]                    ; 388F _ 8B. 45, 0C
        lea     ecx, [edx+eax]                          ; 3892 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 3895 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 3898 _ 8B. 55, F8
        add     edx, 2                                  ; 389B _ 83. C2, 02
        mov     dword [eax+edx*8], ecx                  ; 389E _ 89. 0C D0
        mov     eax, dword [ebp+8H]                     ; 38A1 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 38A4 _ 8B. 55, F8
        add     edx, 2                                  ; 38A7 _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 38AA _ 8B. 44 D0, 04
        sub     eax, dword [ebp+0CH]                    ; 38AE _ 2B. 45, 0C
        mov     edx, eax                                ; 38B1 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 38B3 _ 8B. 45, 08
        mov     ecx, dword [ebp-8H]                     ; 38B6 _ 8B. 4D, F8
        add     ecx, 2                                  ; 38B9 _ 83. C1, 02
        mov     dword [eax+ecx*8+4H], edx               ; 38BC _ 89. 54 C8, 04
        mov     eax, dword [ebp+8H]                     ; 38C0 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 38C3 _ 8B. 55, F8
        add     edx, 2                                  ; 38C6 _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 38C9 _ 8B. 44 D0, 04
        test    eax, eax                                ; 38CD _ 85. C0
        jnz     ?_183                                   ; 38CF _ 75, 0D
        mov     eax, dword [ebp+8H]                     ; 38D1 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 38D4 _ 8B. 00
        lea     edx, [eax-1H]                           ; 38D6 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 38D9 _ 8B. 45, 08
        mov     dword [eax], edx                        ; 38DC _ 89. 10
?_183:  mov     eax, dword [ebp-4H]                     ; 38DE _ 8B. 45, FC
        jmp     ?_186                                   ; 38E1 _ EB, 17

?_184:  add     dword [ebp-8H], 1                       ; 38E3 _ 83. 45, F8, 01
?_185:  mov     eax, dword [ebp+8H]                     ; 38E7 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 38EA _ 8B. 00
        cmp     eax, dword [ebp-8H]                     ; 38EC _ 3B. 45, F8
        ja      ?_182                                   ; 38EF _ 0F 87, FFFFFF6D
        mov     eax, 0                                  ; 38F5 _ B8, 00000000
?_186:  leave                                           ; 38FA _ C9
        ret                                             ; 38FB _ C3
; memman_alloc End of function

memman_free:; Function begin
        push    ebp                                     ; 38FC _ 55
        mov     ebp, esp                                ; 38FD _ 89. E5
        push    ebx                                     ; 38FF _ 53
        sub     esp, 16                                 ; 3900 _ 83. EC, 10
        mov     dword [ebp-0CH], 0                      ; 3903 _ C7. 45, F4, 00000000
        jmp     ?_189                                   ; 390A _ EB, 17

?_187:  mov     eax, dword [ebp+8H]                     ; 390C _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 390F _ 8B. 55, F4
        add     edx, 2                                  ; 3912 _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 3915 _ 8B. 04 D0
        cmp     eax, dword [ebp+0CH]                    ; 3918 _ 3B. 45, 0C
        jbe     ?_188                                   ; 391B _ 76, 02
        jmp     ?_190                                   ; 391D _ EB, 0E

?_188:  add     dword [ebp-0CH], 1                      ; 391F _ 83. 45, F4, 01
?_189:  mov     eax, dword [ebp+8H]                     ; 3923 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 3926 _ 8B. 00
        cmp     eax, dword [ebp-0CH]                    ; 3928 _ 3B. 45, F4
        jg      ?_187                                   ; 392B _ 7F, DF
?_190:  cmp     dword [ebp-0CH], 0                      ; 392D _ 83. 7D, F4, 00
        jle     ?_192                                   ; 3931 _ 0F 8E, 000000BA
        mov     eax, dword [ebp-0CH]                    ; 3937 _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 393A _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 393D _ 8B. 45, 08
        add     edx, 2                                  ; 3940 _ 83. C2, 02
        mov     edx, dword [eax+edx*8]                  ; 3943 _ 8B. 14 D0
        mov     eax, dword [ebp-0CH]                    ; 3946 _ 8B. 45, F4
        lea     ecx, [eax-1H]                           ; 3949 _ 8D. 48, FF
        mov     eax, dword [ebp+8H]                     ; 394C _ 8B. 45, 08
        add     ecx, 2                                  ; 394F _ 83. C1, 02
        mov     eax, dword [eax+ecx*8+4H]               ; 3952 _ 8B. 44 C8, 04
        add     eax, edx                                ; 3956 _ 01. D0
        cmp     eax, dword [ebp+0CH]                    ; 3958 _ 3B. 45, 0C
        jne     ?_192                                   ; 395B _ 0F 85, 00000090
        mov     eax, dword [ebp-0CH]                    ; 3961 _ 8B. 45, F4
        lea     ebx, [eax-1H]                           ; 3964 _ 8D. 58, FF
        mov     eax, dword [ebp-0CH]                    ; 3967 _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 396A _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 396D _ 8B. 45, 08
        add     edx, 2                                  ; 3970 _ 83. C2, 02
        mov     edx, dword [eax+edx*8+4H]               ; 3973 _ 8B. 54 D0, 04
        mov     eax, dword [ebp+10H]                    ; 3977 _ 8B. 45, 10
        lea     ecx, [edx+eax]                          ; 397A _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 397D _ 8B. 45, 08
        lea     edx, [ebx+2H]                           ; 3980 _ 8D. 53, 02
        mov     dword [eax+edx*8+4H], ecx               ; 3983 _ 89. 4C D0, 04
        mov     eax, dword [ebp+8H]                     ; 3987 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 398A _ 8B. 00
        cmp     eax, dword [ebp-0CH]                    ; 398C _ 3B. 45, F4
        jle     ?_191                                   ; 398F _ 7E, 56
        mov     eax, dword [ebp+10H]                    ; 3991 _ 8B. 45, 10
        mov     edx, dword [ebp+0CH]                    ; 3994 _ 8B. 55, 0C
        lea     ecx, [edx+eax]                          ; 3997 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 399A _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 399D _ 8B. 55, F4
        add     edx, 2                                  ; 39A0 _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 39A3 _ 8B. 04 D0
        cmp     ecx, eax                                ; 39A6 _ 39. C1
        jnz     ?_191                                   ; 39A8 _ 75, 3D
        mov     eax, dword [ebp-0CH]                    ; 39AA _ 8B. 45, F4
        lea     ebx, [eax-1H]                           ; 39AD _ 8D. 58, FF
        mov     eax, dword [ebp-0CH]                    ; 39B0 _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 39B3 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 39B6 _ 8B. 45, 08
        add     edx, 2                                  ; 39B9 _ 83. C2, 02
        mov     edx, dword [eax+edx*8+4H]               ; 39BC _ 8B. 54 D0, 04
        mov     eax, dword [ebp+8H]                     ; 39C0 _ 8B. 45, 08
        mov     ecx, dword [ebp-0CH]                    ; 39C3 _ 8B. 4D, F4
        add     ecx, 2                                  ; 39C6 _ 83. C1, 02
        mov     eax, dword [eax+ecx*8+4H]               ; 39C9 _ 8B. 44 C8, 04
        lea     ecx, [edx+eax]                          ; 39CD _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 39D0 _ 8B. 45, 08
        lea     edx, [ebx+2H]                           ; 39D3 _ 8D. 53, 02
        mov     dword [eax+edx*8+4H], ecx               ; 39D6 _ 89. 4C D0, 04
        mov     eax, dword [ebp+8H]                     ; 39DA _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 39DD _ 8B. 00
        lea     edx, [eax-1H]                           ; 39DF _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 39E2 _ 8B. 45, 08
        mov     dword [eax], edx                        ; 39E5 _ 89. 10
?_191:  mov     eax, 0                                  ; 39E7 _ B8, 00000000
        jmp     ?_198                                   ; 39EC _ E9, 0000011C

?_192:  mov     eax, dword [ebp+8H]                     ; 39F1 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 39F4 _ 8B. 00
        cmp     eax, dword [ebp-0CH]                    ; 39F6 _ 3B. 45, F4
        jle     ?_193                                   ; 39F9 _ 7E, 52
        mov     eax, dword [ebp+10H]                    ; 39FB _ 8B. 45, 10
        mov     edx, dword [ebp+0CH]                    ; 39FE _ 8B. 55, 0C
        lea     ecx, [edx+eax]                          ; 3A01 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 3A04 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 3A07 _ 8B. 55, F4
        add     edx, 2                                  ; 3A0A _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 3A0D _ 8B. 04 D0
        cmp     ecx, eax                                ; 3A10 _ 39. C1
        jnz     ?_193                                   ; 3A12 _ 75, 39
        mov     eax, dword [ebp+8H]                     ; 3A14 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 3A17 _ 8B. 55, F4
        lea     ecx, [edx+2H]                           ; 3A1A _ 8D. 4A, 02
        mov     edx, dword [ebp+0CH]                    ; 3A1D _ 8B. 55, 0C
        mov     dword [eax+ecx*8], edx                  ; 3A20 _ 89. 14 C8
        mov     eax, dword [ebp+8H]                     ; 3A23 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 3A26 _ 8B. 55, F4
        add     edx, 2                                  ; 3A29 _ 83. C2, 02
        mov     edx, dword [eax+edx*8+4H]               ; 3A2C _ 8B. 54 D0, 04
        mov     eax, dword [ebp+10H]                    ; 3A30 _ 8B. 45, 10
        lea     ecx, [edx+eax]                          ; 3A33 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 3A36 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 3A39 _ 8B. 55, F4
        add     edx, 2                                  ; 3A3C _ 83. C2, 02
        mov     dword [eax+edx*8+4H], ecx               ; 3A3F _ 89. 4C D0, 04
        mov     eax, 0                                  ; 3A43 _ B8, 00000000
        jmp     ?_198                                   ; 3A48 _ E9, 000000C0

?_193:  mov     eax, dword [ebp+8H]                     ; 3A4D _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 3A50 _ 8B. 00
        cmp     eax, 4095                               ; 3A52 _ 3D, 00000FFF
        jg      ?_197                                   ; 3A57 _ 0F 8F, 00000087
        mov     eax, dword [ebp+8H]                     ; 3A5D _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 3A60 _ 8B. 00
        mov     dword [ebp-8H], eax                     ; 3A62 _ 89. 45, F8
        jmp     ?_195                                   ; 3A65 _ EB, 28

?_194:  mov     eax, dword [ebp-8H]                     ; 3A67 _ 8B. 45, F8
        lea     edx, [eax-1H]                           ; 3A6A _ 8D. 50, FF
        mov     ecx, dword [ebp+8H]                     ; 3A6D _ 8B. 4D, 08
        mov     eax, dword [ebp-8H]                     ; 3A70 _ 8B. 45, F8
        lea     ebx, [eax+2H]                           ; 3A73 _ 8D. 58, 02
        mov     eax, dword [ebp+8H]                     ; 3A76 _ 8B. 45, 08
        add     edx, 2                                  ; 3A79 _ 83. C2, 02
        lea     edx, [eax+edx*8]                        ; 3A7C _ 8D. 14 D0
        mov     eax, dword [edx]                        ; 3A7F _ 8B. 02
        mov     edx, dword [edx+4H]                     ; 3A81 _ 8B. 52, 04
        mov     dword [ecx+ebx*8], eax                  ; 3A84 _ 89. 04 D9
        mov     dword [ecx+ebx*8+4H], edx               ; 3A87 _ 89. 54 D9, 04
        sub     dword [ebp-8H], 1                       ; 3A8B _ 83. 6D, F8, 01
?_195:  mov     eax, dword [ebp-8H]                     ; 3A8F _ 8B. 45, F8
        cmp     eax, dword [ebp-0CH]                    ; 3A92 _ 3B. 45, F4
        jg      ?_194                                   ; 3A95 _ 7F, D0
        mov     eax, dword [ebp+8H]                     ; 3A97 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 3A9A _ 8B. 00
        lea     edx, [eax+1H]                           ; 3A9C _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 3A9F _ 8B. 45, 08
        mov     dword [eax], edx                        ; 3AA2 _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 3AA4 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 3AA7 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 3AAA _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 3AAD _ 8B. 00
        cmp     edx, eax                                ; 3AAF _ 39. C2
        jge     ?_196                                   ; 3AB1 _ 7D, 0B
        mov     eax, dword [ebp+8H]                     ; 3AB3 _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 3AB6 _ 8B. 10
        mov     eax, dword [ebp+8H]                     ; 3AB8 _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 3ABB _ 89. 50, 04
?_196:  mov     eax, dword [ebp+8H]                     ; 3ABE _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 3AC1 _ 8B. 55, F4
        lea     ecx, [edx+2H]                           ; 3AC4 _ 8D. 4A, 02
        mov     edx, dword [ebp+0CH]                    ; 3AC7 _ 8B. 55, 0C
        mov     dword [eax+ecx*8], edx                  ; 3ACA _ 89. 14 C8
        mov     eax, dword [ebp+8H]                     ; 3ACD _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 3AD0 _ 8B. 55, F4
        lea     ecx, [edx+2H]                           ; 3AD3 _ 8D. 4A, 02
        mov     edx, dword [ebp+10H]                    ; 3AD6 _ 8B. 55, 10
        mov     dword [eax+ecx*8+4H], edx               ; 3AD9 _ 89. 54 C8, 04
        mov     eax, 0                                  ; 3ADD _ B8, 00000000
        jmp     ?_198                                   ; 3AE2 _ EB, 29

?_197:  mov     eax, dword [ebp+8H]                     ; 3AE4 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 3AE7 _ 8B. 40, 0C
        lea     edx, [eax+1H]                           ; 3AEA _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 3AED _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 3AF0 _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 3AF3 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 3AF6 _ 8B. 40, 08
        mov     edx, eax                                ; 3AF9 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 3AFB _ 8B. 45, 10
        add     eax, edx                                ; 3AFE _ 01. D0
        mov     edx, eax                                ; 3B00 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 3B02 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 3B05 _ 89. 50, 08
        mov     eax, 4294967295                         ; 3B08 _ B8, FFFFFFFF
?_198:  add     esp, 16                                 ; 3B0D _ 83. C4, 10
        pop     ebx                                     ; 3B10 _ 5B
        pop     ebp                                     ; 3B11 _ 5D
        ret                                             ; 3B12 _ C3
; memman_free End of function

memman_alloc_4k:; Function begin
        push    ebp                                     ; 3B13 _ 55
        mov     ebp, esp                                ; 3B14 _ 89. E5
        sub     esp, 24                                 ; 3B16 _ 83. EC, 18
        mov     eax, dword [ebp+0CH]                    ; 3B19 _ 8B. 45, 0C
        add     eax, 4095                               ; 3B1C _ 05, 00000FFF
        and     eax, 0FFFFF000H                         ; 3B21 _ 25, FFFFF000
        mov     dword [ebp+0CH], eax                    ; 3B26 _ 89. 45, 0C
        mov     eax, dword [ebp+0CH]                    ; 3B29 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 3B2C _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 3B30 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3B33 _ 89. 04 24
        call    memman_alloc                            ; 3B36 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-4H], eax                     ; 3B3B _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 3B3E _ 8B. 45, FC
        leave                                           ; 3B41 _ C9
        ret                                             ; 3B42 _ C3
; memman_alloc_4k End of function

memman_free_4k:; Function begin
        push    ebp                                     ; 3B43 _ 55
        mov     ebp, esp                                ; 3B44 _ 89. E5
        sub     esp, 28                                 ; 3B46 _ 83. EC, 1C
        mov     eax, dword [ebp+10H]                    ; 3B49 _ 8B. 45, 10
        add     eax, 4095                               ; 3B4C _ 05, 00000FFF
        and     eax, 0FFFFF000H                         ; 3B51 _ 25, FFFFF000
        mov     dword [ebp+10H], eax                    ; 3B56 _ 89. 45, 10
        mov     eax, dword [ebp+10H]                    ; 3B59 _ 8B. 45, 10
        mov     dword [esp+8H], eax                     ; 3B5C _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 3B60 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 3B63 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 3B67 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3B6A _ 89. 04 24
        call    memman_free                             ; 3B6D _ E8, FFFFFFFC(rel)
        mov     dword [ebp-4H], eax                     ; 3B72 _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 3B75 _ 8B. 45, FC
        leave                                           ; 3B78 _ C9
        ret                                             ; 3B79 _ C3
; memman_free_4k End of function

sheet_control_init:; Function begin
        push    ebp                                     ; 3B7A _ 55
        mov     ebp, esp                                ; 3B7B _ 89. E5
        sub     esp, 40                                 ; 3B7D _ 83. EC, 28
        mov     dword [esp+4H], 9236                    ; 3B80 _ C7. 44 24, 04, 00002414
        mov     eax, dword [ebp+8H]                     ; 3B88 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3B8B _ 89. 04 24
        call    memman_alloc_4k                         ; 3B8E _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 3B93 _ 89. 45, F4
        cmp     dword [ebp-0CH], 0                      ; 3B96 _ 83. 7D, F4, 00
        jnz     ?_199                                   ; 3B9A _ 75, 24
        mov     eax, dword [ebp-0CH]                    ; 3B9C _ 8B. 45, F4
        mov     dword [esp+8H], 9236                    ; 3B9F _ C7. 44 24, 08, 00002414
        mov     dword [esp+4H], eax                     ; 3BA7 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 3BAB _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3BAE _ 89. 04 24
        call    memman_free_4k                          ; 3BB1 _ E8, FFFFFFFC(rel)
        mov     eax, 0                                  ; 3BB6 _ B8, 00000000
        jmp     ?_203                                   ; 3BBB _ E9, 0000009D

?_199:  mov     eax, dword [ebp-0CH]                    ; 3BC0 _ 8B. 45, F4
        mov     edx, dword [ebp+0CH]                    ; 3BC3 _ 8B. 55, 0C
        mov     dword [eax], edx                        ; 3BC6 _ 89. 10
        mov     eax, dword [ebp-0CH]                    ; 3BC8 _ 8B. 45, F4
        mov     edx, dword [ebp+10H]                    ; 3BCB _ 8B. 55, 10
        mov     dword [eax+4H], edx                     ; 3BCE _ 89. 50, 04
        mov     eax, dword [ebp-0CH]                    ; 3BD1 _ 8B. 45, F4
        mov     edx, dword [ebp+14H]                    ; 3BD4 _ 8B. 55, 14
        mov     dword [eax+8H], edx                     ; 3BD7 _ 89. 50, 08
        mov     eax, dword [ebp-0CH]                    ; 3BDA _ 8B. 45, F4
        mov     dword [eax+0CH], -1                     ; 3BDD _ C7. 40, 0C, FFFFFFFF
        mov     dword [ebp-10H], 0                      ; 3BE4 _ C7. 45, F0, 00000000
        jmp     ?_201                                   ; 3BEB _ EB, 1B

?_200:  mov     eax, dword [ebp-0CH]                    ; 3BED _ 8B. 45, F4
        mov     edx, dword [ebp-10H]                    ; 3BF0 _ 8B. 55, F0
        add     edx, 33                                 ; 3BF3 _ 83. C2, 21
        shl     edx, 5                                  ; 3BF6 _ C1. E2, 05
        add     eax, edx                                ; 3BF9 _ 01. D0
        add     eax, 16                                 ; 3BFB _ 83. C0, 10
        mov     dword [eax], 0                          ; 3BFE _ C7. 00, 00000000
        add     dword [ebp-10H], 1                      ; 3C04 _ 83. 45, F0, 01
?_201:  cmp     dword [ebp-10H], 255                    ; 3C08 _ 81. 7D, F0, 000000FF
        jle     ?_200                                   ; 3C0F _ 7E, DC
        mov     eax, dword [ebp+10H]                    ; 3C11 _ 8B. 45, 10
        imul    eax, dword [ebp+14H]                    ; 3C14 _ 0F AF. 45, 14
        mov     dword [esp+4H], eax                     ; 3C18 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 3C1C _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3C1F _ 89. 04 24
        call    memman_alloc_4k                         ; 3C22 _ E8, FFFFFFFC(rel)
        mov     edx, eax                                ; 3C27 _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 3C29 _ 8B. 45, F4
        mov     dword [eax+10H], edx                    ; 3C2C _ 89. 50, 10
        mov     eax, dword [ebp-0CH]                    ; 3C2F _ 8B. 45, F4
        mov     eax, dword [eax+10H]                    ; 3C32 _ 8B. 40, 10
        test    eax, eax                                ; 3C35 _ 85. C0
        jnz     ?_202                                   ; 3C37 _ 75, 21
        mov     eax, dword [ebp-0CH]                    ; 3C39 _ 8B. 45, F4
        mov     dword [esp+8H], 9236                    ; 3C3C _ C7. 44 24, 08, 00002414
        mov     dword [esp+4H], eax                     ; 3C44 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 3C48 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3C4B _ 89. 04 24
        call    memman_free_4k                          ; 3C4E _ E8, FFFFFFFC(rel)
        mov     eax, 0                                  ; 3C53 _ B8, 00000000
        jmp     ?_203                                   ; 3C58 _ EB, 03

?_202:  mov     eax, dword [ebp-0CH]                    ; 3C5A _ 8B. 45, F4
?_203:  leave                                           ; 3C5D _ C9
        ret                                             ; 3C5E _ C3
; sheet_control_init End of function

sheet_alloc:; Function begin
        push    ebp                                     ; 3C5F _ 55
        mov     ebp, esp                                ; 3C60 _ 89. E5
        sub     esp, 16                                 ; 3C62 _ 83. EC, 10
        mov     dword [ebp-8H], 0                       ; 3C65 _ C7. 45, F8, 00000000
        jmp     ?_206                                   ; 3C6C _ EB, 5B

?_204:  mov     eax, dword [ebp+8H]                     ; 3C6E _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 3C71 _ 8B. 55, F8
        add     edx, 33                                 ; 3C74 _ 83. C2, 21
        shl     edx, 5                                  ; 3C77 _ C1. E2, 05
        add     eax, edx                                ; 3C7A _ 01. D0
        add     eax, 16                                 ; 3C7C _ 83. C0, 10
        mov     eax, dword [eax]                        ; 3C7F _ 8B. 00
        test    eax, eax                                ; 3C81 _ 85. C0
        jnz     ?_205                                   ; 3C83 _ 75, 40
        mov     eax, dword [ebp-8H]                     ; 3C85 _ 8B. 45, F8
        shl     eax, 5                                  ; 3C88 _ C1. E0, 05
        lea     edx, [eax+410H]                         ; 3C8B _ 8D. 90, 00000410
        mov     eax, dword [ebp+8H]                     ; 3C91 _ 8B. 45, 08
        add     eax, edx                                ; 3C94 _ 01. D0
        add     eax, 4                                  ; 3C96 _ 83. C0, 04
        mov     dword [ebp-4H], eax                     ; 3C99 _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 3C9C _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 3C9F _ 8B. 55, F8
        lea     ecx, [edx+4H]                           ; 3CA2 _ 8D. 4A, 04
        mov     edx, dword [ebp-4H]                     ; 3CA5 _ 8B. 55, FC
        mov     dword [eax+ecx*4+4H], edx               ; 3CA8 _ 89. 54 88, 04
        mov     eax, dword [ebp-4H]                     ; 3CAC _ 8B. 45, FC
        mov     dword [eax+1CH], 1                      ; 3CAF _ C7. 40, 1C, 00000001
        mov     eax, dword [ebp-4H]                     ; 3CB6 _ 8B. 45, FC
        mov     dword [eax+18H], -1                     ; 3CB9 _ C7. 40, 18, FFFFFFFF
        mov     eax, dword [ebp-4H]                     ; 3CC0 _ 8B. 45, FC
        jmp     ?_207                                   ; 3CC3 _ EB, 12

?_205:  add     dword [ebp-8H], 1                       ; 3CC5 _ 83. 45, F8, 01
?_206:  cmp     dword [ebp-8H], 255                     ; 3CC9 _ 81. 7D, F8, 000000FF
        jle     ?_204                                   ; 3CD0 _ 7E, 9C
        mov     eax, 0                                  ; 3CD2 _ B8, 00000000
?_207:  leave                                           ; 3CD7 _ C9
        ret                                             ; 3CD8 _ C3
; sheet_alloc End of function

sheet_setbuf:; Function begin
        push    ebp                                     ; 3CD9 _ 55
        mov     ebp, esp                                ; 3CDA _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 3CDC _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 3CDF _ 8B. 55, 0C
        mov     dword [eax], edx                        ; 3CE2 _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 3CE4 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 3CE7 _ 8B. 55, 10
        mov     dword [eax+4H], edx                     ; 3CEA _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 3CED _ 8B. 45, 08
        mov     edx, dword [ebp+14H]                    ; 3CF0 _ 8B. 55, 14
        mov     dword [eax+8H], edx                     ; 3CF3 _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 3CF6 _ 8B. 45, 08
        mov     edx, dword [ebp+18H]                    ; 3CF9 _ 8B. 55, 18
        mov     dword [eax+14H], edx                    ; 3CFC _ 89. 50, 14
        pop     ebp                                     ; 3CFF _ 5D
        ret                                             ; 3D00 _ C3
; sheet_setbuf End of function

sheet_updown:; Function begin
        push    ebp                                     ; 3D01 _ 55
        mov     ebp, esp                                ; 3D02 _ 89. E5
        push    esi                                     ; 3D04 _ 56
        push    ebx                                     ; 3D05 _ 53
        sub     esp, 48                                 ; 3D06 _ 83. EC, 30
        mov     eax, dword [ebp+0CH]                    ; 3D09 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 3D0C _ 8B. 40, 18
        mov     dword [ebp-0CH], eax                    ; 3D0F _ 89. 45, F4
        mov     eax, dword [ebp+8H]                     ; 3D12 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 3D15 _ 8B. 40, 0C
        add     eax, 1                                  ; 3D18 _ 83. C0, 01
        cmp     eax, dword [ebp+10H]                    ; 3D1B _ 3B. 45, 10
        jge     ?_208                                   ; 3D1E _ 7D, 0C
        mov     eax, dword [ebp+8H]                     ; 3D20 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 3D23 _ 8B. 40, 0C
        add     eax, 1                                  ; 3D26 _ 83. C0, 01
        mov     dword [ebp+10H], eax                    ; 3D29 _ 89. 45, 10
?_208:  cmp     dword [ebp+10H], -1                     ; 3D2C _ 83. 7D, 10, FF
        jge     ?_209                                   ; 3D30 _ 7D, 07
        mov     dword [ebp+10H], -1                     ; 3D32 _ C7. 45, 10, FFFFFFFF
?_209:  mov     eax, dword [ebp+0CH]                    ; 3D39 _ 8B. 45, 0C
        mov     edx, dword [ebp+10H]                    ; 3D3C _ 8B. 55, 10
        mov     dword [eax+18H], edx                    ; 3D3F _ 89. 50, 18
        mov     eax, dword [ebp-0CH]                    ; 3D42 _ 8B. 45, F4
        cmp     eax, dword [ebp+10H]                    ; 3D45 _ 3B. 45, 10
        jle     ?_216                                   ; 3D48 _ 0F 8E, 00000201
        cmp     dword [ebp+10H], 0                      ; 3D4E _ 83. 7D, 10, 00
        js      ?_212                                   ; 3D52 _ 0F 88, 000000F7
        mov     eax, dword [ebp-0CH]                    ; 3D58 _ 8B. 45, F4
        mov     dword [ebp-10H], eax                    ; 3D5B _ 89. 45, F0
        jmp     ?_211                                   ; 3D5E _ EB, 34

?_210:  mov     eax, dword [ebp-10H]                    ; 3D60 _ 8B. 45, F0
        lea     edx, [eax-1H]                           ; 3D63 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 3D66 _ 8B. 45, 08
        add     edx, 4                                  ; 3D69 _ 83. C2, 04
        mov     edx, dword [eax+edx*4+4H]               ; 3D6C _ 8B. 54 90, 04
        mov     eax, dword [ebp+8H]                     ; 3D70 _ 8B. 45, 08
        mov     ecx, dword [ebp-10H]                    ; 3D73 _ 8B. 4D, F0
        add     ecx, 4                                  ; 3D76 _ 83. C1, 04
        mov     dword [eax+ecx*4+4H], edx               ; 3D79 _ 89. 54 88, 04
        mov     eax, dword [ebp+8H]                     ; 3D7D _ 8B. 45, 08
        mov     edx, dword [ebp-10H]                    ; 3D80 _ 8B. 55, F0
        add     edx, 4                                  ; 3D83 _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 3D86 _ 8B. 44 90, 04
        mov     edx, dword [ebp-10H]                    ; 3D8A _ 8B. 55, F0
        mov     dword [eax+18H], edx                    ; 3D8D _ 89. 50, 18
        sub     dword [ebp-10H], 1                      ; 3D90 _ 83. 6D, F0, 01
?_211:  mov     eax, dword [ebp-10H]                    ; 3D94 _ 8B. 45, F0
        cmp     eax, dword [ebp+10H]                    ; 3D97 _ 3B. 45, 10
        jg      ?_210                                   ; 3D9A _ 7F, C4
        mov     eax, dword [ebp+8H]                     ; 3D9C _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 3D9F _ 8B. 55, 10
        lea     ecx, [edx+4H]                           ; 3DA2 _ 8D. 4A, 04
        mov     edx, dword [ebp+0CH]                    ; 3DA5 _ 8B. 55, 0C
        mov     dword [eax+ecx*4+4H], edx               ; 3DA8 _ 89. 54 88, 04
        mov     eax, dword [ebp+10H]                    ; 3DAC _ 8B. 45, 10
        lea     esi, [eax+1H]                           ; 3DAF _ 8D. 70, 01
        mov     eax, dword [ebp+0CH]                    ; 3DB2 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 3DB5 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 3DB8 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 3DBB _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 3DBE _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 3DC1 _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 3DC4 _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 3DC7 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 3DCA _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 3DCD _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 3DD0 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 3DD3 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 3DD6 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 3DD9 _ 8B. 40, 0C
        mov     dword [esp+14H], esi                    ; 3DDC _ 89. 74 24, 14
        mov     dword [esp+10H], ebx                    ; 3DE0 _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 3DE4 _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 3DE8 _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 3DEC _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 3DF0 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3DF3 _ 89. 04 24
        call    sheet_refresh_map                       ; 3DF6 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 3DFB _ 8B. 45, 10
        lea     esi, [eax+1H]                           ; 3DFE _ 8D. 70, 01
        mov     eax, dword [ebp+0CH]                    ; 3E01 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 3E04 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 3E07 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 3E0A _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 3E0D _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 3E10 _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 3E13 _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 3E16 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 3E19 _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 3E1C _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 3E1F _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 3E22 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 3E25 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 3E28 _ 8B. 40, 0C
        mov     dword [esp+14H], esi                    ; 3E2B _ 89. 74 24, 14
        mov     dword [esp+10H], ebx                    ; 3E2F _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 3E33 _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 3E37 _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 3E3B _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 3E3F _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3E42 _ 89. 04 24
        call    sheet_refresh_local                     ; 3E45 _ E8, FFFFFFFC(rel)
        jmp     ?_223                                   ; 3E4A _ E9, 0000026C

?_212:  mov     eax, dword [ebp+8H]                     ; 3E4F _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 3E52 _ 8B. 40, 0C
        cmp     eax, dword [ebp-0CH]                    ; 3E55 _ 3B. 45, F4
        jle     ?_215                                   ; 3E58 _ 7E, 47
        mov     eax, dword [ebp-0CH]                    ; 3E5A _ 8B. 45, F4
        mov     dword [ebp-10H], eax                    ; 3E5D _ 89. 45, F0
        jmp     ?_214                                   ; 3E60 _ EB, 34

?_213:  mov     eax, dword [ebp-10H]                    ; 3E62 _ 8B. 45, F0
        lea     edx, [eax+1H]                           ; 3E65 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 3E68 _ 8B. 45, 08
        add     edx, 4                                  ; 3E6B _ 83. C2, 04
        mov     edx, dword [eax+edx*4+4H]               ; 3E6E _ 8B. 54 90, 04
        mov     eax, dword [ebp+8H]                     ; 3E72 _ 8B. 45, 08
        mov     ecx, dword [ebp-10H]                    ; 3E75 _ 8B. 4D, F0
        add     ecx, 4                                  ; 3E78 _ 83. C1, 04
        mov     dword [eax+ecx*4+4H], edx               ; 3E7B _ 89. 54 88, 04
        mov     eax, dword [ebp+8H]                     ; 3E7F _ 8B. 45, 08
        mov     edx, dword [ebp-10H]                    ; 3E82 _ 8B. 55, F0
        add     edx, 4                                  ; 3E85 _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 3E88 _ 8B. 44 90, 04
        mov     edx, dword [ebp-10H]                    ; 3E8C _ 8B. 55, F0
        mov     dword [eax+18H], edx                    ; 3E8F _ 89. 50, 18
        add     dword [ebp-10H], 1                      ; 3E92 _ 83. 45, F0, 01
?_214:  mov     eax, dword [ebp+8H]                     ; 3E96 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 3E99 _ 8B. 40, 0C
        cmp     eax, dword [ebp-10H]                    ; 3E9C _ 3B. 45, F0
        jg      ?_213                                   ; 3E9F _ 7F, C1
?_215:  mov     eax, dword [ebp+8H]                     ; 3EA1 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 3EA4 _ 8B. 40, 0C
        lea     edx, [eax-1H]                           ; 3EA7 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 3EAA _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 3EAD _ 89. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 3EB0 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 3EB3 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 3EB6 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 3EB9 _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 3EBC _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 3EBF _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 3EC2 _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 3EC5 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 3EC8 _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 3ECB _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 3ECE _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 3ED1 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 3ED4 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 3ED7 _ 8B. 40, 0C
        mov     dword [esp+14H], 0                      ; 3EDA _ C7. 44 24, 14, 00000000
        mov     dword [esp+10H], ebx                    ; 3EE2 _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 3EE6 _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 3EEA _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 3EEE _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 3EF2 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3EF5 _ 89. 04 24
        call    sheet_refresh_map                       ; 3EF8 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+0CH]                    ; 3EFD _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 3F00 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 3F03 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 3F06 _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 3F09 _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 3F0C _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 3F0F _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 3F12 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 3F15 _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 3F18 _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 3F1B _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 3F1E _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 3F21 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 3F24 _ 8B. 40, 0C
        mov     dword [esp+14H], 0                      ; 3F27 _ C7. 44 24, 14, 00000000
        mov     dword [esp+10H], ebx                    ; 3F2F _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 3F33 _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 3F37 _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 3F3B _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 3F3F _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3F42 _ 89. 04 24
        call    sheet_refresh_local                     ; 3F45 _ E8, FFFFFFFC(rel)
        jmp     ?_223                                   ; 3F4A _ E9, 0000016C

?_216:  mov     eax, dword [ebp-0CH]                    ; 3F4F _ 8B. 45, F4
        cmp     eax, dword [ebp+10H]                    ; 3F52 _ 3B. 45, 10
        jge     ?_223                                   ; 3F55 _ 0F 8D, 00000160
        cmp     dword [ebp-0CH], 0                      ; 3F5B _ 83. 7D, F4, 00
        js      ?_219                                   ; 3F5F _ 78, 56
        mov     eax, dword [ebp-0CH]                    ; 3F61 _ 8B. 45, F4
        mov     dword [ebp-10H], eax                    ; 3F64 _ 89. 45, F0
        jmp     ?_218                                   ; 3F67 _ EB, 34

?_217:  mov     eax, dword [ebp-10H]                    ; 3F69 _ 8B. 45, F0
        lea     edx, [eax+1H]                           ; 3F6C _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 3F6F _ 8B. 45, 08
        add     edx, 4                                  ; 3F72 _ 83. C2, 04
        mov     edx, dword [eax+edx*4+4H]               ; 3F75 _ 8B. 54 90, 04
        mov     eax, dword [ebp+8H]                     ; 3F79 _ 8B. 45, 08
        mov     ecx, dword [ebp-10H]                    ; 3F7C _ 8B. 4D, F0
        add     ecx, 4                                  ; 3F7F _ 83. C1, 04
        mov     dword [eax+ecx*4+4H], edx               ; 3F82 _ 89. 54 88, 04
        mov     eax, dword [ebp+8H]                     ; 3F86 _ 8B. 45, 08
        mov     edx, dword [ebp-10H]                    ; 3F89 _ 8B. 55, F0
        add     edx, 4                                  ; 3F8C _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 3F8F _ 8B. 44 90, 04
        mov     edx, dword [ebp-10H]                    ; 3F93 _ 8B. 55, F0
        mov     dword [eax+18H], edx                    ; 3F96 _ 89. 50, 18
        add     dword [ebp-10H], 1                      ; 3F99 _ 83. 45, F0, 01
?_218:  mov     eax, dword [ebp-10H]                    ; 3F9D _ 8B. 45, F0
        cmp     eax, dword [ebp+10H]                    ; 3FA0 _ 3B. 45, 10
        jl      ?_217                                   ; 3FA3 _ 7C, C4
        mov     eax, dword [ebp+8H]                     ; 3FA5 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 3FA8 _ 8B. 55, 10
        lea     ecx, [edx+4H]                           ; 3FAB _ 8D. 4A, 04
        mov     edx, dword [ebp+0CH]                    ; 3FAE _ 8B. 55, 0C
        mov     dword [eax+ecx*4+4H], edx               ; 3FB1 _ 89. 54 88, 04
        jmp     ?_222                                   ; 3FB5 _ EB, 6C

?_219:  mov     eax, dword [ebp+8H]                     ; 3FB7 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 3FBA _ 8B. 40, 0C
        mov     dword [ebp-10H], eax                    ; 3FBD _ 89. 45, F0
        jmp     ?_221                                   ; 3FC0 _ EB, 3A

?_220:  mov     eax, dword [ebp-10H]                    ; 3FC2 _ 8B. 45, F0
        lea     ecx, [eax+1H]                           ; 3FC5 _ 8D. 48, 01
        mov     eax, dword [ebp+8H]                     ; 3FC8 _ 8B. 45, 08
        mov     edx, dword [ebp-10H]                    ; 3FCB _ 8B. 55, F0
        add     edx, 4                                  ; 3FCE _ 83. C2, 04
        mov     edx, dword [eax+edx*4+4H]               ; 3FD1 _ 8B. 54 90, 04
        mov     eax, dword [ebp+8H]                     ; 3FD5 _ 8B. 45, 08
        add     ecx, 4                                  ; 3FD8 _ 83. C1, 04
        mov     dword [eax+ecx*4+4H], edx               ; 3FDB _ 89. 54 88, 04
        mov     eax, dword [ebp-10H]                    ; 3FDF _ 8B. 45, F0
        lea     edx, [eax+1H]                           ; 3FE2 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 3FE5 _ 8B. 45, 08
        add     edx, 4                                  ; 3FE8 _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 3FEB _ 8B. 44 90, 04
        mov     edx, dword [ebp-10H]                    ; 3FEF _ 8B. 55, F0
        add     edx, 1                                  ; 3FF2 _ 83. C2, 01
        mov     dword [eax+18H], edx                    ; 3FF5 _ 89. 50, 18
        sub     dword [ebp-10H], 1                      ; 3FF8 _ 83. 6D, F0, 01
?_221:  mov     eax, dword [ebp-10H]                    ; 3FFC _ 8B. 45, F0
        cmp     eax, dword [ebp+10H]                    ; 3FFF _ 3B. 45, 10
        jge     ?_220                                   ; 4002 _ 7D, BE
        mov     eax, dword [ebp+8H]                     ; 4004 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 4007 _ 8B. 55, 10
        lea     ecx, [edx+4H]                           ; 400A _ 8D. 4A, 04
        mov     edx, dword [ebp+0CH]                    ; 400D _ 8B. 55, 0C
        mov     dword [eax+ecx*4+4H], edx               ; 4010 _ 89. 54 88, 04
        mov     eax, dword [ebp+8H]                     ; 4014 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 4017 _ 8B. 40, 0C
        lea     edx, [eax+1H]                           ; 401A _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 401D _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 4020 _ 89. 50, 0C
?_222:  mov     eax, dword [ebp+0CH]                    ; 4023 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 4026 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 4029 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 402C _ 8B. 40, 08
        lea     esi, [edx+eax]                          ; 402F _ 8D. 34 02
        mov     eax, dword [ebp+0CH]                    ; 4032 _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 4035 _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 4038 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 403B _ 8B. 40, 04
        lea     ebx, [edx+eax]                          ; 403E _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 4041 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 4044 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 4047 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 404A _ 8B. 40, 0C
        mov     ecx, dword [ebp+10H]                    ; 404D _ 8B. 4D, 10
        mov     dword [esp+14H], ecx                    ; 4050 _ 89. 4C 24, 14
        mov     dword [esp+10H], esi                    ; 4054 _ 89. 74 24, 10
        mov     dword [esp+0CH], ebx                    ; 4058 _ 89. 5C 24, 0C
        mov     dword [esp+8H], edx                     ; 405C _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 4060 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 4064 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 4067 _ 89. 04 24
        call    sheet_refresh_map                       ; 406A _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+0CH]                    ; 406F _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 4072 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 4075 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 4078 _ 8B. 40, 08
        lea     esi, [edx+eax]                          ; 407B _ 8D. 34 02
        mov     eax, dword [ebp+0CH]                    ; 407E _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 4081 _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 4084 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 4087 _ 8B. 40, 04
        lea     ebx, [edx+eax]                          ; 408A _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 408D _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 4090 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 4093 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 4096 _ 8B. 40, 0C
        mov     ecx, dword [ebp+10H]                    ; 4099 _ 8B. 4D, 10
        mov     dword [esp+14H], ecx                    ; 409C _ 89. 4C 24, 14
        mov     dword [esp+10H], esi                    ; 40A0 _ 89. 74 24, 10
        mov     dword [esp+0CH], ebx                    ; 40A4 _ 89. 5C 24, 0C
        mov     dword [esp+8H], edx                     ; 40A8 _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 40AC _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 40B0 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 40B3 _ 89. 04 24
        call    sheet_refresh_local                     ; 40B6 _ E8, FFFFFFFC(rel)
?_223:  add     esp, 48                                 ; 40BB _ 83. C4, 30
        pop     ebx                                     ; 40BE _ 5B
        pop     esi                                     ; 40BF _ 5E
        pop     ebp                                     ; 40C0 _ 5D
        ret                                             ; 40C1 _ C3
; sheet_updown End of function

sheet_refresh:; Function begin
        push    ebp                                     ; 40C2 _ 55
        mov     ebp, esp                                ; 40C3 _ 89. E5
        push    edi                                     ; 40C5 _ 57
        push    esi                                     ; 40C6 _ 56
        push    ebx                                     ; 40C7 _ 53
        sub     esp, 44                                 ; 40C8 _ 83. EC, 2C
        mov     eax, dword [ebp+0CH]                    ; 40CB _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 40CE _ 8B. 40, 18
        test    eax, eax                                ; 40D1 _ 85. C0
        js      ?_224                                   ; 40D3 _ 78, 53
        mov     eax, dword [ebp+0CH]                    ; 40D5 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 40D8 _ 8B. 40, 18
        mov     edx, dword [ebp+0CH]                    ; 40DB _ 8B. 55, 0C
        mov     ecx, dword [edx+10H]                    ; 40DE _ 8B. 4A, 10
        mov     edx, dword [ebp+1CH]                    ; 40E1 _ 8B. 55, 1C
        lea     esi, [ecx+edx]                          ; 40E4 _ 8D. 34 11
        mov     edx, dword [ebp+0CH]                    ; 40E7 _ 8B. 55, 0C
        mov     ecx, dword [edx+0CH]                    ; 40EA _ 8B. 4A, 0C
        mov     edx, dword [ebp+18H]                    ; 40ED _ 8B. 55, 18
        lea     ebx, [ecx+edx]                          ; 40F0 _ 8D. 1C 11
        mov     edx, dword [ebp+0CH]                    ; 40F3 _ 8B. 55, 0C
        mov     ecx, dword [edx+10H]                    ; 40F6 _ 8B. 4A, 10
        mov     edx, dword [ebp+14H]                    ; 40F9 _ 8B. 55, 14
        add     ecx, edx                                ; 40FC _ 01. D1
        mov     edx, dword [ebp+0CH]                    ; 40FE _ 8B. 55, 0C
        mov     edi, dword [edx+0CH]                    ; 4101 _ 8B. 7A, 0C
        mov     edx, dword [ebp+10H]                    ; 4104 _ 8B. 55, 10
        add     edx, edi                                ; 4107 _ 01. FA
        mov     dword [esp+14H], eax                    ; 4109 _ 89. 44 24, 14
        mov     dword [esp+10H], esi                    ; 410D _ 89. 74 24, 10
        mov     dword [esp+0CH], ebx                    ; 4111 _ 89. 5C 24, 0C
        mov     dword [esp+8H], ecx                     ; 4115 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 4119 _ 89. 54 24, 04
        mov     eax, dword [ebp+8H]                     ; 411D _ 8B. 45, 08
        mov     dword [esp], eax                        ; 4120 _ 89. 04 24
        call    sheet_refresh_local                     ; 4123 _ E8, FFFFFFFC(rel)
?_224:  mov     eax, 0                                  ; 4128 _ B8, 00000000
        add     esp, 44                                 ; 412D _ 83. C4, 2C
        pop     ebx                                     ; 4130 _ 5B
        pop     esi                                     ; 4131 _ 5E
        pop     edi                                     ; 4132 _ 5F
        pop     ebp                                     ; 4133 _ 5D
        ret                                             ; 4134 _ C3
; sheet_refresh End of function

sheet_slide:; Function begin
        push    ebp                                     ; 4135 _ 55
        mov     ebp, esp                                ; 4136 _ 89. E5
        push    ebx                                     ; 4138 _ 53
        sub     esp, 52                                 ; 4139 _ 83. EC, 34
        mov     eax, dword [ebp+0CH]                    ; 413C _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 413F _ 8B. 40, 0C
        mov     dword [ebp-10H], eax                    ; 4142 _ 89. 45, F0
        mov     eax, dword [ebp+0CH]                    ; 4145 _ 8B. 45, 0C
        mov     eax, dword [eax+10H]                    ; 4148 _ 8B. 40, 10
        mov     dword [ebp-0CH], eax                    ; 414B _ 89. 45, F4
        mov     eax, dword [ebp+0CH]                    ; 414E _ 8B. 45, 0C
        mov     edx, dword [ebp+10H]                    ; 4151 _ 8B. 55, 10
        mov     dword [eax+0CH], edx                    ; 4154 _ 89. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 4157 _ 8B. 45, 0C
        mov     edx, dword [ebp+14H]                    ; 415A _ 8B. 55, 14
        mov     dword [eax+10H], edx                    ; 415D _ 89. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 4160 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 4163 _ 8B. 40, 18
        test    eax, eax                                ; 4166 _ 85. C0
        js      ?_225                                   ; 4168 _ 0F 88, 00000100
        mov     eax, dword [ebp+0CH]                    ; 416E _ 8B. 45, 0C
        mov     edx, dword [eax+8H]                     ; 4171 _ 8B. 50, 08
        mov     eax, dword [ebp-0CH]                    ; 4174 _ 8B. 45, F4
        add     edx, eax                                ; 4177 _ 01. C2
        mov     eax, dword [ebp+0CH]                    ; 4179 _ 8B. 45, 0C
        mov     ecx, dword [eax+4H]                     ; 417C _ 8B. 48, 04
        mov     eax, dword [ebp-10H]                    ; 417F _ 8B. 45, F0
        add     eax, ecx                                ; 4182 _ 01. C8
        mov     dword [esp+14H], 0                      ; 4184 _ C7. 44 24, 14, 00000000
        mov     dword [esp+10H], edx                    ; 418C _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 4190 _ 89. 44 24, 0C
        mov     eax, dword [ebp-0CH]                    ; 4194 _ 8B. 45, F4
        mov     dword [esp+8H], eax                     ; 4197 _ 89. 44 24, 08
        mov     eax, dword [ebp-10H]                    ; 419B _ 8B. 45, F0
        mov     dword [esp+4H], eax                     ; 419E _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 41A2 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 41A5 _ 89. 04 24
        call    sheet_refresh_map                       ; 41A8 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+0CH]                    ; 41AD _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 41B0 _ 8B. 40, 18
        mov     edx, dword [ebp+0CH]                    ; 41B3 _ 8B. 55, 0C
        mov     ecx, dword [edx+8H]                     ; 41B6 _ 8B. 4A, 08
        mov     edx, dword [ebp+14H]                    ; 41B9 _ 8B. 55, 14
        add     ecx, edx                                ; 41BC _ 01. D1
        mov     edx, dword [ebp+0CH]                    ; 41BE _ 8B. 55, 0C
        mov     ebx, dword [edx+4H]                     ; 41C1 _ 8B. 5A, 04
        mov     edx, dword [ebp+10H]                    ; 41C4 _ 8B. 55, 10
        add     edx, ebx                                ; 41C7 _ 01. DA
        mov     dword [esp+14H], eax                    ; 41C9 _ 89. 44 24, 14
        mov     dword [esp+10H], ecx                    ; 41CD _ 89. 4C 24, 10
        mov     dword [esp+0CH], edx                    ; 41D1 _ 89. 54 24, 0C
        mov     eax, dword [ebp+14H]                    ; 41D5 _ 8B. 45, 14
        mov     dword [esp+8H], eax                     ; 41D8 _ 89. 44 24, 08
        mov     eax, dword [ebp+10H]                    ; 41DC _ 8B. 45, 10
        mov     dword [esp+4H], eax                     ; 41DF _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 41E3 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 41E6 _ 89. 04 24
        call    sheet_refresh_map                       ; 41E9 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+0CH]                    ; 41EE _ 8B. 45, 0C
        mov     edx, dword [eax+8H]                     ; 41F1 _ 8B. 50, 08
        mov     eax, dword [ebp-0CH]                    ; 41F4 _ 8B. 45, F4
        add     edx, eax                                ; 41F7 _ 01. C2
        mov     eax, dword [ebp+0CH]                    ; 41F9 _ 8B. 45, 0C
        mov     ecx, dword [eax+4H]                     ; 41FC _ 8B. 48, 04
        mov     eax, dword [ebp-10H]                    ; 41FF _ 8B. 45, F0
        add     eax, ecx                                ; 4202 _ 01. C8
        mov     dword [esp+14H], 0                      ; 4204 _ C7. 44 24, 14, 00000000
        mov     dword [esp+10H], edx                    ; 420C _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 4210 _ 89. 44 24, 0C
        mov     eax, dword [ebp-0CH]                    ; 4214 _ 8B. 45, F4
        mov     dword [esp+8H], eax                     ; 4217 _ 89. 44 24, 08
        mov     eax, dword [ebp-10H]                    ; 421B _ 8B. 45, F0
        mov     dword [esp+4H], eax                     ; 421E _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 4222 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 4225 _ 89. 04 24
        call    sheet_refresh_local                     ; 4228 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+0CH]                    ; 422D _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 4230 _ 8B. 40, 18
        mov     edx, dword [ebp+0CH]                    ; 4233 _ 8B. 55, 0C
        mov     ecx, dword [edx+8H]                     ; 4236 _ 8B. 4A, 08
        mov     edx, dword [ebp+14H]                    ; 4239 _ 8B. 55, 14
        add     ecx, edx                                ; 423C _ 01. D1
        mov     edx, dword [ebp+0CH]                    ; 423E _ 8B. 55, 0C
        mov     ebx, dword [edx+4H]                     ; 4241 _ 8B. 5A, 04
        mov     edx, dword [ebp+10H]                    ; 4244 _ 8B. 55, 10
        add     edx, ebx                                ; 4247 _ 01. DA
        mov     dword [esp+14H], eax                    ; 4249 _ 89. 44 24, 14
        mov     dword [esp+10H], ecx                    ; 424D _ 89. 4C 24, 10
        mov     dword [esp+0CH], edx                    ; 4251 _ 89. 54 24, 0C
        mov     eax, dword [ebp+14H]                    ; 4255 _ 8B. 45, 14
        mov     dword [esp+8H], eax                     ; 4258 _ 89. 44 24, 08
        mov     eax, dword [ebp+10H]                    ; 425C _ 8B. 45, 10
        mov     dword [esp+4H], eax                     ; 425F _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 4263 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 4266 _ 89. 04 24
        call    sheet_refresh_local                     ; 4269 _ E8, FFFFFFFC(rel)
?_225:  add     esp, 52                                 ; 426E _ 83. C4, 34
        pop     ebx                                     ; 4271 _ 5B
        pop     ebp                                     ; 4272 _ 5D
        ret                                             ; 4273 _ C3
; sheet_slide End of function

sheet_refresh_local:; Function begin
        push    ebp                                     ; 4274 _ 55
        mov     ebp, esp                                ; 4275 _ 89. E5
        sub     esp, 48                                 ; 4277 _ 83. EC, 30
        mov     eax, dword [ebp+8H]                     ; 427A _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 427D _ 8B. 00
        mov     dword [ebp-18H], eax                    ; 427F _ 89. 45, E8
        mov     eax, dword [ebp+8H]                     ; 4282 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 4285 _ 8B. 40, 10
        mov     dword [ebp-14H], eax                    ; 4288 _ 89. 45, EC
        cmp     dword [ebp+0CH], 0                      ; 428B _ 83. 7D, 0C, 00
        jns     ?_226                                   ; 428F _ 79, 07
        mov     dword [ebp+0CH], 0                      ; 4291 _ C7. 45, 0C, 00000000
?_226:  cmp     dword [ebp+10H], 0                      ; 4298 _ 83. 7D, 10, 00
        jns     ?_227                                   ; 429C _ 79, 07
        mov     dword [ebp+10H], 0                      ; 429E _ C7. 45, 10, 00000000
?_227:  mov     eax, dword [ebp+8H]                     ; 42A5 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 42A8 _ 8B. 40, 04
        cmp     eax, dword [ebp+14H]                    ; 42AB _ 3B. 45, 14
        jge     ?_228                                   ; 42AE _ 7D, 09
        mov     eax, dword [ebp+8H]                     ; 42B0 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 42B3 _ 8B. 40, 04
        mov     dword [ebp+14H], eax                    ; 42B6 _ 89. 45, 14
?_228:  mov     eax, dword [ebp+8H]                     ; 42B9 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 42BC _ 8B. 40, 08
        cmp     eax, dword [ebp+18H]                    ; 42BF _ 3B. 45, 18
        jge     ?_229                                   ; 42C2 _ 7D, 09
        mov     eax, dword [ebp+8H]                     ; 42C4 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 42C7 _ 8B. 40, 08
        mov     dword [ebp+18H], eax                    ; 42CA _ 89. 45, 18
?_229:  mov     eax, dword [ebp+1CH]                    ; 42CD _ 8B. 45, 1C
        mov     dword [ebp-24H], eax                    ; 42D0 _ 89. 45, DC
        jmp     ?_236                                   ; 42D3 _ E9, 00000119

?_230:  mov     eax, dword [ebp+8H]                     ; 42D8 _ 8B. 45, 08
        mov     edx, dword [ebp-24H]                    ; 42DB _ 8B. 55, DC
        add     edx, 4                                  ; 42DE _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 42E1 _ 8B. 44 90, 04
        mov     dword [ebp-10H], eax                    ; 42E5 _ 89. 45, F0
        mov     eax, dword [ebp-10H]                    ; 42E8 _ 8B. 45, F0
        mov     eax, dword [eax]                        ; 42EB _ 8B. 00
        mov     dword [ebp-0CH], eax                    ; 42ED _ 89. 45, F4
        mov     edx, dword [ebp-10H]                    ; 42F0 _ 8B. 55, F0
        mov     eax, dword [ebp+8H]                     ; 42F3 _ 8B. 45, 08
        add     eax, 1044                               ; 42F6 _ 05, 00000414
        sub     edx, eax                                ; 42FB _ 29. C2
        mov     eax, edx                                ; 42FD _ 89. D0
        sar     eax, 5                                  ; 42FF _ C1. F8, 05
        mov     byte [ebp-26H], al                      ; 4302 _ 88. 45, DA
        mov     dword [ebp-1CH], 0                      ; 4305 _ C7. 45, E4, 00000000
        jmp     ?_235                                   ; 430C _ E9, 000000CD

?_231:  mov     eax, dword [ebp-10H]                    ; 4311 _ 8B. 45, F0
        mov     edx, dword [eax+10H]                    ; 4314 _ 8B. 50, 10
        mov     eax, dword [ebp-1CH]                    ; 4317 _ 8B. 45, E4
        add     eax, edx                                ; 431A _ 01. D0
        mov     dword [ebp-8H], eax                     ; 431C _ 89. 45, F8
        mov     dword [ebp-20H], 0                      ; 431F _ C7. 45, E0, 00000000
        jmp     ?_234                                   ; 4326 _ E9, 000000A0

?_232:  mov     eax, dword [ebp-10H]                    ; 432B _ 8B. 45, F0
        mov     edx, dword [eax+0CH]                    ; 432E _ 8B. 50, 0C
        mov     eax, dword [ebp-20H]                    ; 4331 _ 8B. 45, E0
        add     eax, edx                                ; 4334 _ 01. D0
        mov     dword [ebp-4H], eax                     ; 4336 _ 89. 45, FC
        mov     eax, dword [ebp+0CH]                    ; 4339 _ 8B. 45, 0C
        cmp     eax, dword [ebp-4H]                     ; 433C _ 3B. 45, FC
        jg      ?_233                                   ; 433F _ 0F 8F, 00000082
        mov     eax, dword [ebp-4H]                     ; 4345 _ 8B. 45, FC
        cmp     eax, dword [ebp+14H]                    ; 4348 _ 3B. 45, 14
        jge     ?_233                                   ; 434B _ 7D, 7A
        mov     eax, dword [ebp+10H]                    ; 434D _ 8B. 45, 10
        cmp     eax, dword [ebp-8H]                     ; 4350 _ 3B. 45, F8
        jg      ?_233                                   ; 4353 _ 7F, 72
        mov     eax, dword [ebp-8H]                     ; 4355 _ 8B. 45, F8
        cmp     eax, dword [ebp+18H]                    ; 4358 _ 3B. 45, 18
        jge     ?_233                                   ; 435B _ 7D, 6A
        mov     eax, dword [ebp-10H]                    ; 435D _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 4360 _ 8B. 40, 04
        imul    eax, dword [ebp-1CH]                    ; 4363 _ 0F AF. 45, E4
        mov     edx, eax                                ; 4367 _ 89. C2
        mov     eax, dword [ebp-20H]                    ; 4369 _ 8B. 45, E0
        add     eax, edx                                ; 436C _ 01. D0
        mov     edx, eax                                ; 436E _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 4370 _ 8B. 45, F4
        add     eax, edx                                ; 4373 _ 01. D0
        movzx   eax, byte [eax]                         ; 4375 _ 0F B6. 00
        mov     byte [ebp-25H], al                      ; 4378 _ 88. 45, DB
        movzx   edx, byte [ebp-25H]                     ; 437B _ 0F B6. 55, DB
        mov     eax, dword [ebp-10H]                    ; 437F _ 8B. 45, F0
        mov     eax, dword [eax+14H]                    ; 4382 _ 8B. 40, 14
        cmp     edx, eax                                ; 4385 _ 39. C2
        jz      ?_233                                   ; 4387 _ 74, 3E
        mov     eax, dword [ebp+8H]                     ; 4389 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 438C _ 8B. 40, 04
        imul    eax, dword [ebp-8H]                     ; 438F _ 0F AF. 45, F8
        mov     edx, eax                                ; 4393 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 4395 _ 8B. 45, FC
        add     eax, edx                                ; 4398 _ 01. D0
        mov     edx, eax                                ; 439A _ 89. C2
        mov     eax, dword [ebp-14H]                    ; 439C _ 8B. 45, EC
        add     eax, edx                                ; 439F _ 01. D0
        movzx   eax, byte [eax]                         ; 43A1 _ 0F B6. 00
        cmp     al, byte [ebp-26H]                      ; 43A4 _ 3A. 45, DA
        jnz     ?_233                                   ; 43A7 _ 75, 1E
        mov     eax, dword [ebp+8H]                     ; 43A9 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 43AC _ 8B. 40, 04
        imul    eax, dword [ebp-8H]                     ; 43AF _ 0F AF. 45, F8
        mov     edx, eax                                ; 43B3 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 43B5 _ 8B. 45, FC
        add     eax, edx                                ; 43B8 _ 01. D0
        mov     edx, eax                                ; 43BA _ 89. C2
        mov     eax, dword [ebp-18H]                    ; 43BC _ 8B. 45, E8
        add     edx, eax                                ; 43BF _ 01. C2
        movzx   eax, byte [ebp-25H]                     ; 43C1 _ 0F B6. 45, DB
        mov     byte [edx], al                          ; 43C5 _ 88. 02
?_233:  add     dword [ebp-20H], 1                      ; 43C7 _ 83. 45, E0, 01
?_234:  mov     eax, dword [ebp-10H]                    ; 43CB _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 43CE _ 8B. 40, 04
        cmp     eax, dword [ebp-20H]                    ; 43D1 _ 3B. 45, E0
        jg      ?_232                                   ; 43D4 _ 0F 8F, FFFFFF51
        add     dword [ebp-1CH], 1                      ; 43DA _ 83. 45, E4, 01
?_235:  mov     eax, dword [ebp-10H]                    ; 43DE _ 8B. 45, F0
        mov     eax, dword [eax+8H]                     ; 43E1 _ 8B. 40, 08
        cmp     eax, dword [ebp-1CH]                    ; 43E4 _ 3B. 45, E4
        jg      ?_231                                   ; 43E7 _ 0F 8F, FFFFFF24
        add     dword [ebp-24H], 1                      ; 43ED _ 83. 45, DC, 01
?_236:  mov     eax, dword [ebp+8H]                     ; 43F1 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 43F4 _ 8B. 40, 0C
        cmp     eax, dword [ebp-24H]                    ; 43F7 _ 3B. 45, DC
        jge     ?_230                                   ; 43FA _ 0F 8D, FFFFFED8
        leave                                           ; 4400 _ C9
        ret                                             ; 4401 _ C3
; sheet_refresh_local End of function

sheet_refresh_map:; Function begin
        push    ebp                                     ; 4402 _ 55
        mov     ebp, esp                                ; 4403 _ 89. E5
        sub     esp, 64                                 ; 4405 _ 83. EC, 40
        mov     eax, dword [ebp+8H]                     ; 4408 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 440B _ 8B. 00
        mov     dword [ebp-18H], eax                    ; 440D _ 89. 45, E8
        mov     eax, dword [ebp+8H]                     ; 4410 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 4413 _ 8B. 40, 10
        mov     dword [ebp-14H], eax                    ; 4416 _ 89. 45, EC
        cmp     dword [ebp+0CH], 0                      ; 4419 _ 83. 7D, 0C, 00
        jns     ?_237                                   ; 441D _ 79, 07
        mov     dword [ebp+0CH], 0                      ; 441F _ C7. 45, 0C, 00000000
?_237:  cmp     dword [ebp+10H], 0                      ; 4426 _ 83. 7D, 10, 00
        jns     ?_238                                   ; 442A _ 79, 07
        mov     dword [ebp+10H], 0                      ; 442C _ C7. 45, 10, 00000000
?_238:  mov     eax, dword [ebp+8H]                     ; 4433 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 4436 _ 8B. 40, 04
        cmp     eax, dword [ebp+14H]                    ; 4439 _ 3B. 45, 14
        jge     ?_239                                   ; 443C _ 7D, 09
        mov     eax, dword [ebp+8H]                     ; 443E _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 4441 _ 8B. 40, 04
        mov     dword [ebp+14H], eax                    ; 4444 _ 89. 45, 14
?_239:  mov     eax, dword [ebp+8H]                     ; 4447 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 444A _ 8B. 40, 08
        cmp     eax, dword [ebp+18H]                    ; 444D _ 3B. 45, 18
        jge     ?_240                                   ; 4450 _ 7D, 09
        mov     eax, dword [ebp+8H]                     ; 4452 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 4455 _ 8B. 40, 08
        mov     dword [ebp+18H], eax                    ; 4458 _ 89. 45, 18
?_240:  mov     eax, dword [ebp+1CH]                    ; 445B _ 8B. 45, 1C
        mov     dword [ebp-34H], eax                    ; 445E _ 89. 45, CC
        jmp     ?_251                                   ; 4461 _ E9, 00000141

?_241:  mov     eax, dword [ebp+8H]                     ; 4466 _ 8B. 45, 08
        mov     edx, dword [ebp-34H]                    ; 4469 _ 8B. 55, CC
        add     edx, 4                                  ; 446C _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 446F _ 8B. 44 90, 04
        mov     dword [ebp-10H], eax                    ; 4473 _ 89. 45, F0
        mov     edx, dword [ebp-10H]                    ; 4476 _ 8B. 55, F0
        mov     eax, dword [ebp+8H]                     ; 4479 _ 8B. 45, 08
        add     eax, 1044                               ; 447C _ 05, 00000414
        sub     edx, eax                                ; 4481 _ 29. C2
        mov     eax, edx                                ; 4483 _ 89. D0
        sar     eax, 5                                  ; 4485 _ C1. F8, 05
        mov     byte [ebp-35H], al                      ; 4488 _ 88. 45, CB
        mov     eax, dword [ebp-10H]                    ; 448B _ 8B. 45, F0
        mov     eax, dword [eax]                        ; 448E _ 8B. 00
        mov     dword [ebp-0CH], eax                    ; 4490 _ 89. 45, F4
        mov     eax, dword [ebp-10H]                    ; 4493 _ 8B. 45, F0
        mov     eax, dword [eax+0CH]                    ; 4496 _ 8B. 40, 0C
        mov     edx, dword [ebp+0CH]                    ; 4499 _ 8B. 55, 0C
        sub     edx, eax                                ; 449C _ 29. C2
        mov     eax, edx                                ; 449E _ 89. D0
        mov     dword [ebp-30H], eax                    ; 44A0 _ 89. 45, D0
        mov     eax, dword [ebp-10H]                    ; 44A3 _ 8B. 45, F0
        mov     eax, dword [eax+10H]                    ; 44A6 _ 8B. 40, 10
        mov     edx, dword [ebp+10H]                    ; 44A9 _ 8B. 55, 10
        sub     edx, eax                                ; 44AC _ 29. C2
        mov     eax, edx                                ; 44AE _ 89. D0
        mov     dword [ebp-2CH], eax                    ; 44B0 _ 89. 45, D4
        mov     eax, dword [ebp-10H]                    ; 44B3 _ 8B. 45, F0
        mov     eax, dword [eax+0CH]                    ; 44B6 _ 8B. 40, 0C
        mov     edx, dword [ebp+14H]                    ; 44B9 _ 8B. 55, 14
        sub     edx, eax                                ; 44BC _ 29. C2
        mov     eax, edx                                ; 44BE _ 89. D0
        mov     dword [ebp-28H], eax                    ; 44C0 _ 89. 45, D8
        mov     eax, dword [ebp-10H]                    ; 44C3 _ 8B. 45, F0
        mov     eax, dword [eax+10H]                    ; 44C6 _ 8B. 40, 10
        mov     edx, dword [ebp+18H]                    ; 44C9 _ 8B. 55, 18
        sub     edx, eax                                ; 44CC _ 29. C2
        mov     eax, edx                                ; 44CE _ 89. D0
        mov     dword [ebp-24H], eax                    ; 44D0 _ 89. 45, DC
        cmp     dword [ebp-30H], 0                      ; 44D3 _ 83. 7D, D0, 00
        jns     ?_242                                   ; 44D7 _ 79, 07
        mov     dword [ebp-30H], 0                      ; 44D9 _ C7. 45, D0, 00000000
?_242:  cmp     dword [ebp-2CH], 0                      ; 44E0 _ 83. 7D, D4, 00
        jns     ?_243                                   ; 44E4 _ 79, 07
        mov     dword [ebp-2CH], 0                      ; 44E6 _ C7. 45, D4, 00000000
?_243:  mov     eax, dword [ebp-10H]                    ; 44ED _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 44F0 _ 8B. 40, 04
        cmp     eax, dword [ebp-28H]                    ; 44F3 _ 3B. 45, D8
        jge     ?_244                                   ; 44F6 _ 7D, 09
        mov     eax, dword [ebp-10H]                    ; 44F8 _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 44FB _ 8B. 40, 04
        mov     dword [ebp-28H], eax                    ; 44FE _ 89. 45, D8
?_244:  mov     eax, dword [ebp-10H]                    ; 4501 _ 8B. 45, F0
        mov     eax, dword [eax+8H]                     ; 4504 _ 8B. 40, 08
        cmp     eax, dword [ebp-24H]                    ; 4507 _ 3B. 45, DC
        jge     ?_245                                   ; 450A _ 7D, 09
        mov     eax, dword [ebp-10H]                    ; 450C _ 8B. 45, F0
        mov     eax, dword [eax+8H]                     ; 450F _ 8B. 40, 08
        mov     dword [ebp-24H], eax                    ; 4512 _ 89. 45, DC
?_245:  mov     eax, dword [ebp-2CH]                    ; 4515 _ 8B. 45, D4
        mov     dword [ebp-1CH], eax                    ; 4518 _ 89. 45, E4
        jmp     ?_250                                   ; 451B _ EB, 7A

?_246:  mov     eax, dword [ebp-10H]                    ; 451D _ 8B. 45, F0
        mov     edx, dword [eax+10H]                    ; 4520 _ 8B. 50, 10
        mov     eax, dword [ebp-1CH]                    ; 4523 _ 8B. 45, E4
        add     eax, edx                                ; 4526 _ 01. D0
        mov     dword [ebp-8H], eax                     ; 4528 _ 89. 45, F8
        mov     eax, dword [ebp-30H]                    ; 452B _ 8B. 45, D0
        mov     dword [ebp-20H], eax                    ; 452E _ 89. 45, E0
        jmp     ?_249                                   ; 4531 _ EB, 58

?_247:  mov     eax, dword [ebp-10H]                    ; 4533 _ 8B. 45, F0
        mov     edx, dword [eax+0CH]                    ; 4536 _ 8B. 50, 0C
        mov     eax, dword [ebp-20H]                    ; 4539 _ 8B. 45, E0
        add     eax, edx                                ; 453C _ 01. D0
        mov     dword [ebp-4H], eax                     ; 453E _ 89. 45, FC
        mov     eax, dword [ebp-10H]                    ; 4541 _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 4544 _ 8B. 40, 04
        imul    eax, dword [ebp-1CH]                    ; 4547 _ 0F AF. 45, E4
        mov     edx, eax                                ; 454B _ 89. C2
        mov     eax, dword [ebp-20H]                    ; 454D _ 8B. 45, E0
        add     eax, edx                                ; 4550 _ 01. D0
        mov     edx, eax                                ; 4552 _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 4554 _ 8B. 45, F4
        add     eax, edx                                ; 4557 _ 01. D0
        movzx   eax, byte [eax]                         ; 4559 _ 0F B6. 00
        movzx   edx, al                                 ; 455C _ 0F B6. D0
        mov     eax, dword [ebp-10H]                    ; 455F _ 8B. 45, F0
        mov     eax, dword [eax+14H]                    ; 4562 _ 8B. 40, 14
        cmp     edx, eax                                ; 4565 _ 39. C2
        jz      ?_248                                   ; 4567 _ 74, 1E
        mov     eax, dword [ebp+8H]                     ; 4569 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 456C _ 8B. 40, 04
        imul    eax, dword [ebp-8H]                     ; 456F _ 0F AF. 45, F8
        mov     edx, eax                                ; 4573 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 4575 _ 8B. 45, FC
        add     eax, edx                                ; 4578 _ 01. D0
        mov     edx, eax                                ; 457A _ 89. C2
        mov     eax, dword [ebp-14H]                    ; 457C _ 8B. 45, EC
        add     edx, eax                                ; 457F _ 01. C2
        movzx   eax, byte [ebp-35H]                     ; 4581 _ 0F B6. 45, CB
        mov     byte [edx], al                          ; 4585 _ 88. 02
?_248:  add     dword [ebp-20H], 1                      ; 4587 _ 83. 45, E0, 01
?_249:  mov     eax, dword [ebp-20H]                    ; 458B _ 8B. 45, E0
        cmp     eax, dword [ebp-28H]                    ; 458E _ 3B. 45, D8
        jl      ?_247                                   ; 4591 _ 7C, A0
        add     dword [ebp-1CH], 1                      ; 4593 _ 83. 45, E4, 01
?_250:  mov     eax, dword [ebp-1CH]                    ; 4597 _ 8B. 45, E4
        cmp     eax, dword [ebp-24H]                    ; 459A _ 3B. 45, DC
        jl      ?_246                                   ; 459D _ 0F 8C, FFFFFF7A
        add     dword [ebp-34H], 1                      ; 45A3 _ 83. 45, CC, 01
?_251:  mov     eax, dword [ebp+8H]                     ; 45A7 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 45AA _ 8B. 40, 0C
        cmp     eax, dword [ebp-34H]                    ; 45AD _ 3B. 45, CC
        jge     ?_241                                   ; 45B0 _ 0F 8D, FFFFFEB0
        leave                                           ; 45B6 _ C9
        ret                                             ; 45B7 _ C3
; sheet_refresh_map End of function

init_time_port:; Function begin
        push    ebp                                     ; 45B8 _ 55
        mov     ebp, esp                                ; 45B9 _ 89. E5
        sub     esp, 40                                 ; 45BB _ 83. EC, 28
        mov     dword [esp+4H], 52                      ; 45BE _ C7. 44 24, 04, 00000034
        mov     dword [esp], 67                         ; 45C6 _ C7. 04 24, 00000043
        call    io_out8                                 ; 45CD _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 156                     ; 45D2 _ C7. 44 24, 04, 0000009C
        mov     dword [esp], 64                         ; 45DA _ C7. 04 24, 00000040
        call    io_out8                                 ; 45E1 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 46                      ; 45E6 _ C7. 44 24, 04, 0000002E
        mov     dword [esp], 64                         ; 45EE _ C7. 04 24, 00000040
        call    io_out8                                 ; 45F5 _ E8, FFFFFFFC(rel)
        mov     dword [timer_control], 0                ; 45FA _ C7. 05, 00000300(d), 00000000
        mov     dword [ebp-0CH], 0                      ; 4604 _ C7. 45, F4, 00000000
        jmp     ?_253                                   ; 460B _ EB, 28

?_252:  mov     eax, dword [ebp-0CH]                    ; 460D _ 8B. 45, F4
        shl     eax, 4                                  ; 4610 _ C1. E0, 04
        add     eax, timer_control                      ; 4613 _ 05, 00000300(d)
        mov     dword [eax+8H], 0                       ; 4618 _ C7. 40, 08, 00000000
        mov     eax, dword [ebp-0CH]                    ; 461F _ 8B. 45, F4
        shl     eax, 4                                  ; 4622 _ C1. E0, 04
        add     eax, timer_control                      ; 4625 _ 05, 00000300(d)
        mov     dword [eax+0CH], 0                      ; 462A _ C7. 40, 0C, 00000000
        add     dword [ebp-0CH], 1                      ; 4631 _ 83. 45, F4, 01
?_253:  cmp     dword [ebp-0CH], 499                    ; 4635 _ 81. 7D, F4, 000001F3
        jle     ?_252                                   ; 463C _ 7E, CF
        leave                                           ; 463E _ C9
        ret                                             ; 463F _ C3
; init_time_port End of function

get_timer_control:; Function begin
        push    ebp                                     ; 4640 _ 55
        mov     ebp, esp                                ; 4641 _ 89. E5
        mov     eax, timer_control                      ; 4643 _ B8, 00000300(d)
        pop     ebp                                     ; 4648 _ 5D
        ret                                             ; 4649 _ C3
; get_timer_control End of function

timer_alloc:; Function begin
        push    ebp                                     ; 464A _ 55
        mov     ebp, esp                                ; 464B _ 89. E5
        sub     esp, 16                                 ; 464D _ 83. EC, 10
        mov     dword [ebp-4H], 0                       ; 4650 _ C7. 45, FC, 00000000
        jmp     ?_256                                   ; 4657 _ EB, 26

?_254:  mov     eax, dword [ebp-4H]                     ; 4659 _ 8B. 45, FC
        shl     eax, 4                                  ; 465C _ C1. E0, 04
        add     eax, timer_control                      ; 465F _ 05, 00000300(d)
        mov     eax, dword [eax+8H]                     ; 4664 _ 8B. 40, 08
        test    eax, eax                                ; 4667 _ 85. C0
        jnz     ?_255                                   ; 4669 _ 75, 10
        mov     eax, dword [ebp-4H]                     ; 466B _ 8B. 45, FC
        shl     eax, 4                                  ; 466E _ C1. E0, 04
        add     eax, timer_control                      ; 4671 _ 05, 00000300(d)
        add     eax, 4                                  ; 4676 _ 83. C0, 04
        jmp     ?_257                                   ; 4679 _ EB, 0D

?_255:  add     dword [ebp-4H], 1                       ; 467B _ 83. 45, FC, 01
?_256:  cmp     dword [ebp-4H], 499                     ; 467F _ 81. 7D, FC, 000001F3
        jle     ?_254                                   ; 4686 _ 7E, D1
?_257:  leave                                           ; 4688 _ C9
        ret                                             ; 4689 _ C3
; timer_alloc End of function

timer_free:; Function begin
        push    ebp                                     ; 468A _ 55
        mov     ebp, esp                                ; 468B _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 468D _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 4690 _ C7. 40, 04, 00000000
        pop     ebp                                     ; 4697 _ 5D
        ret                                             ; 4698 _ C3
; timer_free End of function

timer_init:; Function begin
        push    ebp                                     ; 4699 _ 55
        mov     ebp, esp                                ; 469A _ 89. E5
        sub     esp, 4                                  ; 469C _ 83. EC, 04
        mov     eax, dword [ebp+10H]                    ; 469F _ 8B. 45, 10
        mov     byte [ebp-4H], al                       ; 46A2 _ 88. 45, FC
        mov     eax, dword [ebp+8H]                     ; 46A5 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 46A8 _ 8B. 55, 0C
        mov     dword [eax+8H], edx                     ; 46AB _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 46AE _ 8B. 45, 08
        movzx   edx, byte [ebp-4H]                      ; 46B1 _ 0F B6. 55, FC
        mov     byte [eax+0CH], dl                      ; 46B5 _ 88. 50, 0C
        leave                                           ; 46B8 _ C9
        ret                                             ; 46B9 _ C3
; timer_init End of function

timer_settime:; Function begin
        push    ebp                                     ; 46BA _ 55
        mov     ebp, esp                                ; 46BB _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 46BD _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 46C0 _ 8B. 55, 0C
        mov     dword [eax], edx                        ; 46C3 _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 46C5 _ 8B. 45, 08
        mov     dword [eax+4H], 2                       ; 46C8 _ C7. 40, 04, 00000002
        pop     ebp                                     ; 46CF _ 5D
        ret                                             ; 46D0 _ C3
; timer_settime End of function

intHandlerTimer:; Function begin
        push    ebp                                     ; 46D1 _ 55
        mov     ebp, esp                                ; 46D2 _ 89. E5
        sub     esp, 40                                 ; 46D4 _ 83. EC, 28
        mov     dword [esp+4H], 32                      ; 46D7 _ C7. 44 24, 04, 00000020
        mov     dword [esp], 32                         ; 46DF _ C7. 04 24, 00000020
        call    io_out8                                 ; 46E6 _ E8, FFFFFFFC(rel)
        mov     eax, dword [timer_control]              ; 46EB _ A1, 00000300(d)
        add     eax, 1                                  ; 46F0 _ 83. C0, 01
        mov     dword [timer_control], eax              ; 46F3 _ A3, 00000300(d)
        mov     byte [ebp-0DH], 0                       ; 46F8 _ C6. 45, F3, 00
        mov     dword [ebp-0CH], 0                      ; 46FC _ C7. 45, F4, 00000000
        jmp     ?_261                                   ; 4703 _ E9, 000000B0

?_258:  mov     eax, dword [ebp-0CH]                    ; 4708 _ 8B. 45, F4
        shl     eax, 4                                  ; 470B _ C1. E0, 04
        add     eax, timer_control                      ; 470E _ 05, 00000300(d)
        mov     eax, dword [eax+8H]                     ; 4713 _ 8B. 40, 08
        cmp     eax, 2                                  ; 4716 _ 83. F8, 02
        jne     ?_259                                   ; 4719 _ 0F 85, 0000008A
        mov     eax, dword [ebp-0CH]                    ; 471F _ 8B. 45, F4
        shl     eax, 4                                  ; 4722 _ C1. E0, 04
        add     eax, timer_control                      ; 4725 _ 05, 00000300(d)
        mov     eax, dword [eax+4H]                     ; 472A _ 8B. 40, 04
        lea     edx, [eax-1H]                           ; 472D _ 8D. 50, FF
        mov     eax, dword [ebp-0CH]                    ; 4730 _ 8B. 45, F4
        shl     eax, 4                                  ; 4733 _ C1. E0, 04
        add     eax, timer_control                      ; 4736 _ 05, 00000300(d)
        mov     dword [eax+4H], edx                     ; 473B _ 89. 50, 04
        mov     eax, dword [ebp-0CH]                    ; 473E _ 8B. 45, F4
        shl     eax, 4                                  ; 4741 _ C1. E0, 04
        add     eax, timer_control                      ; 4744 _ 05, 00000300(d)
        mov     eax, dword [eax+4H]                     ; 4749 _ 8B. 40, 04
        test    eax, eax                                ; 474C _ 85. C0
        jnz     ?_259                                   ; 474E _ 75, 59
        mov     eax, dword [ebp-0CH]                    ; 4750 _ 8B. 45, F4
        shl     eax, 4                                  ; 4753 _ C1. E0, 04
        add     eax, timer_control                      ; 4756 _ 05, 00000300(d)
        mov     dword [eax+8H], 1                       ; 475B _ C7. 40, 08, 00000001
        mov     eax, dword [ebp-0CH]                    ; 4762 _ 8B. 45, F4
        shl     eax, 4                                  ; 4765 _ C1. E0, 04
        add     eax, timer_control                      ; 4768 _ 05, 00000300(d)
        movzx   eax, byte [eax+10H]                     ; 476D _ 0F B6. 40, 10
        movzx   edx, al                                 ; 4771 _ 0F B6. D0
        mov     eax, dword [ebp-0CH]                    ; 4774 _ 8B. 45, F4
        shl     eax, 4                                  ; 4777 _ C1. E0, 04
        add     eax, timer_control                      ; 477A _ 05, 00000300(d)
        mov     eax, dword [eax+0CH]                    ; 477F _ 8B. 40, 0C
        mov     dword [esp+4H], edx                     ; 4782 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 4786 _ 89. 04 24
        call    fifo8_put                               ; 4789 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 478E _ 8B. 45, F4
        shl     eax, 4                                  ; 4791 _ C1. E0, 04
        add     eax, timer_control                      ; 4794 _ 05, 00000300(d)
        lea     edx, [eax+4H]                           ; 4799 _ 8D. 50, 04
        mov     eax, dword [task_timer]                 ; 479C _ A1, 00000000(d)
        cmp     edx, eax                                ; 47A1 _ 39. C2
        jnz     ?_259                                   ; 47A3 _ 75, 04
        mov     byte [ebp-0DH], 1                       ; 47A5 _ C6. 45, F3, 01
?_259:  cmp     byte [ebp-0DH], 0                       ; 47A9 _ 80. 7D, F3, 00
        jz      ?_260                                   ; 47AD _ 74, 05
        call    task_switch                             ; 47AF _ E8, FFFFFFFC(rel)
?_260:  add     dword [ebp-0CH], 1                      ; 47B4 _ 83. 45, F4, 01
?_261:  cmp     dword [ebp-0CH], 499                    ; 47B8 _ 81. 7D, F4, 000001F3
        jle     ?_258                                   ; 47BF _ 0F 8E, FFFFFF43
        leave                                           ; 47C5 _ C9
        ret                                             ; 47C6 _ C3
; intHandlerTimer End of function

segment_descriptor:; Function begin
        push    ebp                                     ; 47C7 _ 55
        mov     ebp, esp                                ; 47C8 _ 89. E5
        cmp     dword [ebp+0CH], 1048575                ; 47CA _ 81. 7D, 0C, 000FFFFF
        jbe     ?_262                                   ; 47D1 _ 76, 10
        or      dword [ebp+14H], 8000H                  ; 47D3 _ 81. 4D, 14, 00008000
        mov     eax, dword [ebp+0CH]                    ; 47DA _ 8B. 45, 0C
        shr     eax, 12                                 ; 47DD _ C1. E8, 0C
        mov     dword [ebp+0CH], eax                    ; 47E0 _ 89. 45, 0C
?_262:  mov     eax, dword [ebp+0CH]                    ; 47E3 _ 8B. 45, 0C
        mov     edx, eax                                ; 47E6 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 47E8 _ 8B. 45, 08
        mov     word [eax], dx                          ; 47EB _ 66: 89. 10
        mov     eax, dword [ebp+10H]                    ; 47EE _ 8B. 45, 10
        mov     edx, eax                                ; 47F1 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 47F3 _ 8B. 45, 08
        mov     word [eax+2H], dx                       ; 47F6 _ 66: 89. 50, 02
        mov     eax, dword [ebp+10H]                    ; 47FA _ 8B. 45, 10
        sar     eax, 16                                 ; 47FD _ C1. F8, 10
        mov     edx, eax                                ; 4800 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 4802 _ 8B. 45, 08
        mov     byte [eax+4H], dl                       ; 4805 _ 88. 50, 04
        mov     eax, dword [ebp+14H]                    ; 4808 _ 8B. 45, 14
        mov     edx, eax                                ; 480B _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 480D _ 8B. 45, 08
        mov     byte [eax+5H], dl                       ; 4810 _ 88. 50, 05
        mov     eax, dword [ebp+0CH]                    ; 4813 _ 8B. 45, 0C
        shr     eax, 16                                 ; 4816 _ C1. E8, 10
        and     eax, 0FH                                ; 4819 _ 83. E0, 0F
        mov     edx, eax                                ; 481C _ 89. C2
        mov     eax, dword [ebp+14H]                    ; 481E _ 8B. 45, 14
        sar     eax, 8                                  ; 4821 _ C1. F8, 08
        and     eax, 0FFFFFFF0H                         ; 4824 _ 83. E0, F0
        or      eax, edx                                ; 4827 _ 09. D0
        mov     edx, eax                                ; 4829 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 482B _ 8B. 45, 08
        mov     byte [eax+6H], dl                       ; 482E _ 88. 50, 06
        mov     eax, dword [ebp+10H]                    ; 4831 _ 8B. 45, 10
        shr     eax, 24                                 ; 4834 _ C1. E8, 18
        mov     edx, eax                                ; 4837 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 4839 _ 8B. 45, 08
        mov     byte [eax+7H], dl                       ; 483C _ 88. 50, 07
        pop     ebp                                     ; 483F _ 5D
        ret                                             ; 4840 _ C3
; segment_descriptor End of function

init_task_level:; Function begin
        push    ebp                                     ; 4841 _ 55
        mov     ebp, esp                                ; 4842 _ 89. E5
        sub     esp, 16                                 ; 4844 _ 83. EC, 10
        mov     ecx, dword [task_control]               ; 4847 _ 8B. 0D, 00002248(d)
        mov     edx, dword [ebp+8H]                     ; 484D _ 8B. 55, 08
        mov     eax, edx                                ; 4850 _ 89. D0
        shl     eax, 2                                  ; 4852 _ C1. E0, 02
        add     eax, edx                                ; 4855 _ 01. D0
        shl     eax, 2                                  ; 4857 _ C1. E0, 02
        add     eax, ecx                                ; 485A _ 01. C8
        add     eax, 8                                  ; 485C _ 83. C0, 08
        mov     dword [eax], 0                          ; 485F _ C7. 00, 00000000
        mov     ecx, dword [task_control]               ; 4865 _ 8B. 0D, 00002248(d)
        mov     edx, dword [ebp+8H]                     ; 486B _ 8B. 55, 08
        mov     eax, edx                                ; 486E _ 89. D0
        shl     eax, 2                                  ; 4870 _ C1. E0, 02
        add     eax, edx                                ; 4873 _ 01. D0
        shl     eax, 2                                  ; 4875 _ C1. E0, 02
        add     eax, ecx                                ; 4878 _ 01. C8
        add     eax, 12                                 ; 487A _ 83. C0, 0C
        mov     dword [eax], 0                          ; 487D _ C7. 00, 00000000
        mov     dword [ebp-4H], 0                       ; 4883 _ C7. 45, FC, 00000000
        jmp     ?_264                                   ; 488A _ EB, 21

?_263:  mov     ecx, dword [task_control]               ; 488C _ 8B. 0D, 00002248(d)
        mov     edx, dword [ebp-4H]                     ; 4892 _ 8B. 55, FC
        mov     eax, edx                                ; 4895 _ 89. D0
        add     eax, eax                                ; 4897 _ 01. C0
        add     eax, edx                                ; 4899 _ 01. D0
        shl     eax, 3                                  ; 489B _ C1. E0, 03
        add     eax, ecx                                ; 489E _ 01. C8
        add     eax, 16                                 ; 48A0 _ 83. C0, 10
        mov     dword [eax], 0                          ; 48A3 _ C7. 00, 00000000
        add     dword [ebp-4H], 1                       ; 48A9 _ 83. 45, FC, 01
?_264:  cmp     dword [ebp-4H], 2                       ; 48AD _ 83. 7D, FC, 02
        jle     ?_263                                   ; 48B1 _ 7E, D9
        leave                                           ; 48B3 _ C9
        ret                                             ; 48B4 _ C3
; init_task_level End of function

task_init:; Function begin
        push    ebp                                     ; 48B5 _ 55
        mov     ebp, esp                                ; 48B6 _ 89. E5
        sub     esp, 40                                 ; 48B8 _ 83. EC, 28
        call    get_addr_gdt                            ; 48BB _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 48C0 _ 89. 45, F0
        mov     dword [esp+4H], 808                     ; 48C3 _ C7. 44 24, 04, 00000328
        mov     eax, dword [ebp+8H]                     ; 48CB _ 8B. 45, 08
        mov     dword [esp], eax                        ; 48CE _ 89. 04 24
        call    memman_alloc_4k                         ; 48D1 _ E8, FFFFFFFC(rel)
        mov     dword [task_control], eax               ; 48D6 _ A3, 00002248(d)
        mov     dword [ebp-14H], 0                      ; 48DB _ C7. 45, EC, 00000000
        jmp     ?_266                                   ; 48E2 _ E9, 00000085

?_265:  mov     edx, dword [task_control]               ; 48E7 _ 8B. 15, 00002248(d)
        mov     eax, dword [ebp-14H]                    ; 48ED _ 8B. 45, EC
        imul    eax, eax, 148                           ; 48F0 _ 69. C0, 00000094
        add     eax, edx                                ; 48F6 _ 01. D0
        add     eax, 72                                 ; 48F8 _ 83. C0, 48
        mov     dword [eax], 0                          ; 48FB _ C7. 00, 00000000
        mov     ecx, dword [task_control]               ; 4901 _ 8B. 0D, 00002248(d)
        mov     eax, dword [ebp-14H]                    ; 4907 _ 8B. 45, EC
        add     eax, 8                                  ; 490A _ 83. C0, 08
        lea     edx, [eax*8]                            ; 490D _ 8D. 14 C5, 00000000
        mov     eax, dword [ebp-14H]                    ; 4914 _ 8B. 45, EC
        imul    eax, eax, 148                           ; 4917 _ 69. C0, 00000094
        add     eax, ecx                                ; 491D _ 01. C8
        add     eax, 68                                 ; 491F _ 83. C0, 44
        mov     dword [eax], edx                        ; 4922 _ 89. 10
        mov     eax, dword [task_control]               ; 4924 _ A1, 00002248(d)
        mov     edx, dword [ebp-14H]                    ; 4929 _ 8B. 55, EC
        imul    edx, edx, 148                           ; 492C _ 69. D2, 00000094
        add     edx, 96                                 ; 4932 _ 83. C2, 60
        add     eax, edx                                ; 4935 _ 01. D0
        add     eax, 16                                 ; 4937 _ 83. C0, 10
        mov     edx, dword [ebp-14H]                    ; 493A _ 8B. 55, EC
        add     edx, 8                                  ; 493D _ 83. C2, 08
        lea     ecx, [edx*8]                            ; 4940 _ 8D. 0C D5, 00000000
        mov     edx, dword [ebp-10H]                    ; 4947 _ 8B. 55, F0
        add     edx, ecx                                ; 494A _ 01. CA
        mov     dword [esp+0CH], 137                    ; 494C _ C7. 44 24, 0C, 00000089
        mov     dword [esp+8H], eax                     ; 4954 _ 89. 44 24, 08
        mov     dword [esp+4H], 103                     ; 4958 _ C7. 44 24, 04, 00000067
        mov     dword [esp], edx                        ; 4960 _ 89. 14 24
        call    segment_descriptor                      ; 4963 _ E8, FFFFFFFC(rel)
        add     dword [ebp-14H], 1                      ; 4968 _ 83. 45, EC, 01
?_266:  cmp     dword [ebp-14H], 4                      ; 496C _ 83. 7D, EC, 04
        jle     ?_265                                   ; 4970 _ 0F 8E, FFFFFF71
        mov     dword [ebp-14H], 0                      ; 4976 _ C7. 45, EC, 00000000
        jmp     ?_268                                   ; 497D _ EB, 0F

?_267:  mov     eax, dword [ebp-14H]                    ; 497F _ 8B. 45, EC
        mov     dword [esp], eax                        ; 4982 _ 89. 04 24
        call    init_task_level                         ; 4985 _ E8, FFFFFFFC(rel)
        add     dword [ebp-14H], 1                      ; 498A _ 83. 45, EC, 01
?_268:  cmp     dword [ebp-14H], 2                      ; 498E _ 83. 7D, EC, 02
        jle     ?_267                                   ; 4992 _ 7E, EB
        call    task_alloc                              ; 4994 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 4999 _ 89. 45, F4
        mov     eax, dword [ebp-0CH]                    ; 499C _ 8B. 45, F4
        mov     dword [eax+4H], 2                       ; 499F _ C7. 40, 04, 00000002
        mov     eax, dword [ebp-0CH]                    ; 49A6 _ 8B. 45, F4
        mov     dword [eax+8H], 100                     ; 49A9 _ C7. 40, 08, 00000064
        mov     eax, dword [ebp-0CH]                    ; 49B0 _ 8B. 45, F4
        mov     dword [eax+0CH], 0                      ; 49B3 _ C7. 40, 0C, 00000000
        mov     eax, dword [ebp-0CH]                    ; 49BA _ 8B. 45, F4
        mov     dword [esp], eax                        ; 49BD _ 89. 04 24
        call    task_add                                ; 49C0 _ E8, FFFFFFFC(rel)
        call    task_switch_sub                         ; 49C5 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 49CA _ 8B. 45, F4
        mov     eax, dword [eax]                        ; 49CD _ 8B. 00
        mov     dword [esp], eax                        ; 49CF _ 89. 04 24
        call    load_tr                                 ; 49D2 _ E8, FFFFFFFC(rel)
        call    timer_alloc                             ; 49D7 _ E8, FFFFFFFC(rel)
        mov     dword [task_timer], eax                 ; 49DC _ A3, 00002244(d)
        mov     eax, dword [ebp-0CH]                    ; 49E1 _ 8B. 45, F4
        mov     eax, dword [eax+8H]                     ; 49E4 _ 8B. 40, 08
        mov     edx, eax                                ; 49E7 _ 89. C2
        mov     eax, dword [task_timer]                 ; 49E9 _ A1, 00002244(d)
        mov     dword [esp+4H], edx                     ; 49EE _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 49F2 _ 89. 04 24
        call    timer_settime                           ; 49F5 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 49FA _ 8B. 45, F4
        leave                                           ; 49FD _ C9
        ret                                             ; 49FE _ C3
; task_init End of function

task_alloc:; Function begin
        push    ebp                                     ; 49FF _ 55
        mov     ebp, esp                                ; 4A00 _ 89. E5
        sub     esp, 16                                 ; 4A02 _ 83. EC, 10
        mov     dword [ebp-8H], 0                       ; 4A05 _ C7. 45, F8, 00000000
        jmp     ?_271                                   ; 4A0C _ E9, 000000F6

?_269:  mov     edx, dword [task_control]               ; 4A11 _ 8B. 15, 00002248(d)
        mov     eax, dword [ebp-8H]                     ; 4A17 _ 8B. 45, F8
        imul    eax, eax, 148                           ; 4A1A _ 69. C0, 00000094
        add     eax, edx                                ; 4A20 _ 01. D0
        add     eax, 72                                 ; 4A22 _ 83. C0, 48
        mov     eax, dword [eax]                        ; 4A25 _ 8B. 00
        test    eax, eax                                ; 4A27 _ 85. C0
        jne     ?_270                                   ; 4A29 _ 0F 85, 000000D4
        mov     eax, dword [task_control]               ; 4A2F _ A1, 00002248(d)
        mov     edx, dword [ebp-8H]                     ; 4A34 _ 8B. 55, F8
        imul    edx, edx, 148                           ; 4A37 _ 69. D2, 00000094
        add     edx, 64                                 ; 4A3D _ 83. C2, 40
        add     eax, edx                                ; 4A40 _ 01. D0
        add     eax, 4                                  ; 4A42 _ 83. C0, 04
        mov     dword [ebp-4H], eax                     ; 4A45 _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 4A48 _ 8B. 45, FC
        mov     dword [eax+4H], 1                       ; 4A4B _ C7. 40, 04, 00000001
        mov     eax, dword [ebp-4H]                     ; 4A52 _ 8B. 45, FC
        mov     dword [eax+50H], 514                    ; 4A55 _ C7. 40, 50, 00000202
        mov     eax, dword [ebp-4H]                     ; 4A5C _ 8B. 45, FC
        mov     dword [eax+54H], 0                      ; 4A5F _ C7. 40, 54, 00000000
        mov     eax, dword [ebp-4H]                     ; 4A66 _ 8B. 45, FC
        mov     dword [eax+58H], 0                      ; 4A69 _ C7. 40, 58, 00000000
        mov     eax, dword [ebp-4H]                     ; 4A70 _ 8B. 45, FC
        mov     dword [eax+5CH], 0                      ; 4A73 _ C7. 40, 5C, 00000000
        mov     eax, dword [ebp-4H]                     ; 4A7A _ 8B. 45, FC
        mov     dword [eax+60H], 0                      ; 4A7D _ C7. 40, 60, 00000000
        mov     eax, dword [ebp-8H]                     ; 4A84 _ 8B. 45, F8
        add     eax, 1                                  ; 4A87 _ 83. C0, 01
        shl     eax, 9                                  ; 4A8A _ C1. E0, 09
        mov     edx, eax                                ; 4A8D _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 4A8F _ 8B. 45, FC
        mov     dword [eax+64H], edx                    ; 4A92 _ 89. 50, 64
        mov     eax, dword [ebp-4H]                     ; 4A95 _ 8B. 45, FC
        mov     dword [eax+68H], 0                      ; 4A98 _ C7. 40, 68, 00000000
        mov     eax, dword [ebp-4H]                     ; 4A9F _ 8B. 45, FC
        mov     dword [eax+6CH], 0                      ; 4AA2 _ C7. 40, 6C, 00000000
        mov     eax, dword [ebp-4H]                     ; 4AA9 _ 8B. 45, FC
        mov     dword [eax+70H], 0                      ; 4AAC _ C7. 40, 70, 00000000
        mov     eax, dword [ebp-4H]                     ; 4AB3 _ 8B. 45, FC
        mov     dword [eax+74H], 0                      ; 4AB6 _ C7. 40, 74, 00000000
        mov     eax, dword [ebp-4H]                     ; 4ABD _ 8B. 45, FC
        mov     dword [eax+80H], 0                      ; 4AC0 _ C7. 80, 00000080, 00000000
        mov     eax, dword [ebp-4H]                     ; 4ACA _ 8B. 45, FC
        mov     dword [eax+84H], 0                      ; 4ACD _ C7. 80, 00000084, 00000000
        mov     eax, dword [ebp-4H]                     ; 4AD7 _ 8B. 45, FC
        mov     dword [eax+88H], 0                      ; 4ADA _ C7. 80, 00000088, 00000000
        mov     eax, dword [ebp-4H]                     ; 4AE4 _ 8B. 45, FC
        mov     dword [eax+8CH], 0                      ; 4AE7 _ C7. 80, 0000008C, 00000000
        mov     eax, dword [ebp-4H]                     ; 4AF1 _ 8B. 45, FC
        mov     dword [eax+90H], 1073741824             ; 4AF4 _ C7. 80, 00000090, 40000000
        mov     eax, dword [ebp-4H]                     ; 4AFE _ 8B. 45, FC
        jmp     ?_272                                   ; 4B01 _ EB, 13

?_270:  add     dword [ebp-8H], 1                       ; 4B03 _ 83. 45, F8, 01
?_271:  cmp     dword [ebp-8H], 4                       ; 4B07 _ 83. 7D, F8, 04
        jle     ?_269                                   ; 4B0B _ 0F 8E, FFFFFF00
        mov     eax, 0                                  ; 4B11 _ B8, 00000000
?_272:  leave                                           ; 4B16 _ C9
        ret                                             ; 4B17 _ C3
; task_alloc End of function

task_run:; Function begin
        push    ebp                                     ; 4B18 _ 55
        mov     ebp, esp                                ; 4B19 _ 89. E5
        sub     esp, 24                                 ; 4B1B _ 83. EC, 18
        cmp     dword [ebp+0CH], 0                      ; 4B1E _ 83. 7D, 0C, 00
        jns     ?_273                                   ; 4B22 _ 79, 09
        mov     eax, dword [ebp+8H]                     ; 4B24 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 4B27 _ 8B. 40, 0C
        mov     dword [ebp+0CH], eax                    ; 4B2A _ 89. 45, 0C
?_273:  cmp     dword [ebp+10H], 0                      ; 4B2D _ 83. 7D, 10, 00
        jle     ?_274                                   ; 4B31 _ 7E, 09
        mov     eax, dword [ebp+8H]                     ; 4B33 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 4B36 _ 8B. 55, 10
        mov     dword [eax+8H], edx                     ; 4B39 _ 89. 50, 08
?_274:  mov     eax, dword [ebp+8H]                     ; 4B3C _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 4B3F _ 8B. 40, 04
        cmp     eax, 2                                  ; 4B42 _ 83. F8, 02
        jnz     ?_275                                   ; 4B45 _ 75, 16
        mov     eax, dword [ebp+8H]                     ; 4B47 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 4B4A _ 8B. 40, 0C
        cmp     eax, dword [ebp+0CH]                    ; 4B4D _ 3B. 45, 0C
        jz      ?_275                                   ; 4B50 _ 74, 0B
        mov     eax, dword [ebp+8H]                     ; 4B52 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 4B55 _ 89. 04 24
        call    task_remove                             ; 4B58 _ E8, FFFFFFFC(rel)
?_275:  mov     eax, dword [ebp+8H]                     ; 4B5D _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 4B60 _ 8B. 40, 04
        cmp     eax, 2                                  ; 4B63 _ 83. F8, 02
        jz      ?_276                                   ; 4B66 _ 74, 14
        mov     eax, dword [ebp+8H]                     ; 4B68 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 4B6B _ 8B. 55, 0C
        mov     dword [eax+0CH], edx                    ; 4B6E _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 4B71 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 4B74 _ 89. 04 24
        call    task_add                                ; 4B77 _ E8, FFFFFFFC(rel)
?_276:  mov     eax, dword [task_control]               ; 4B7C _ A1, 00002248(d)
        mov     dword [eax+4H], 1                       ; 4B81 _ C7. 40, 04, 00000001
        leave                                           ; 4B88 _ C9
        ret                                             ; 4B89 _ C3
; task_run End of function

task_switch:; Function begin
        push    ebp                                     ; 4B8A _ 55
        mov     ebp, esp                                ; 4B8B _ 89. E5
        sub     esp, 40                                 ; 4B8D _ 83. EC, 28
        mov     ecx, dword [task_control]               ; 4B90 _ 8B. 0D, 00002248(d)
        mov     eax, dword [task_control]               ; 4B96 _ A1, 00002248(d)
        mov     edx, dword [eax]                        ; 4B9B _ 8B. 10
        mov     eax, edx                                ; 4B9D _ 89. D0
        shl     eax, 2                                  ; 4B9F _ C1. E0, 02
        add     eax, edx                                ; 4BA2 _ 01. D0
        shl     eax, 2                                  ; 4BA4 _ C1. E0, 02
        add     eax, ecx                                ; 4BA7 _ 01. C8
        add     eax, 8                                  ; 4BA9 _ 83. C0, 08
        mov     dword [ebp-14H], eax                    ; 4BAC _ 89. 45, EC
        mov     eax, dword [ebp-14H]                    ; 4BAF _ 8B. 45, EC
        mov     edx, dword [eax+4H]                     ; 4BB2 _ 8B. 50, 04
        mov     eax, dword [ebp-14H]                    ; 4BB5 _ 8B. 45, EC
        mov     eax, dword [eax+edx*4+8H]               ; 4BB8 _ 8B. 44 90, 08
        mov     dword [ebp-10H], eax                    ; 4BBC _ 89. 45, F0
        mov     eax, dword [ebp-14H]                    ; 4BBF _ 8B. 45, EC
        mov     eax, dword [eax+4H]                     ; 4BC2 _ 8B. 40, 04
        lea     edx, [eax+1H]                           ; 4BC5 _ 8D. 50, 01
        mov     eax, dword [ebp-14H]                    ; 4BC8 _ 8B. 45, EC
        mov     dword [eax+4H], edx                     ; 4BCB _ 89. 50, 04
        mov     eax, dword [ebp-14H]                    ; 4BCE _ 8B. 45, EC
        mov     edx, dword [eax+4H]                     ; 4BD1 _ 8B. 50, 04
        mov     eax, dword [ebp-14H]                    ; 4BD4 _ 8B. 45, EC
        mov     eax, dword [eax]                        ; 4BD7 _ 8B. 00
        cmp     edx, eax                                ; 4BD9 _ 39. C2
        jnz     ?_277                                   ; 4BDB _ 75, 0A
        mov     eax, dword [ebp-14H]                    ; 4BDD _ 8B. 45, EC
        mov     dword [eax+4H], 0                       ; 4BE0 _ C7. 40, 04, 00000000
?_277:  mov     eax, dword [task_control]               ; 4BE7 _ A1, 00002248(d)
        mov     eax, dword [eax+4H]                     ; 4BEC _ 8B. 40, 04
        test    eax, eax                                ; 4BEF _ 85. C0
        jz      ?_278                                   ; 4BF1 _ 74, 24
        call    task_switch_sub                         ; 4BF3 _ E8, FFFFFFFC(rel)
        mov     ecx, dword [task_control]               ; 4BF8 _ 8B. 0D, 00002248(d)
        mov     eax, dword [task_control]               ; 4BFE _ A1, 00002248(d)
        mov     edx, dword [eax]                        ; 4C03 _ 8B. 10
        mov     eax, edx                                ; 4C05 _ 89. D0
        shl     eax, 2                                  ; 4C07 _ C1. E0, 02
        add     eax, edx                                ; 4C0A _ 01. D0
        shl     eax, 2                                  ; 4C0C _ C1. E0, 02
        add     eax, ecx                                ; 4C0F _ 01. C8
        add     eax, 8                                  ; 4C11 _ 83. C0, 08
        mov     dword [ebp-14H], eax                    ; 4C14 _ 89. 45, EC
?_278:  mov     eax, dword [ebp-14H]                    ; 4C17 _ 8B. 45, EC
        mov     edx, dword [eax+4H]                     ; 4C1A _ 8B. 50, 04
        mov     eax, dword [ebp-14H]                    ; 4C1D _ 8B. 45, EC
        mov     eax, dword [eax+edx*4+8H]               ; 4C20 _ 8B. 44 90, 08
        mov     dword [ebp-0CH], eax                    ; 4C24 _ 89. 45, F4
        mov     eax, dword [ebp-0CH]                    ; 4C27 _ 8B. 45, F4
        mov     eax, dword [eax+8H]                     ; 4C2A _ 8B. 40, 08
        mov     edx, eax                                ; 4C2D _ 89. C2
        mov     eax, dword [task_timer]                 ; 4C2F _ A1, 00002244(d)
        mov     dword [esp+4H], edx                     ; 4C34 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 4C38 _ 89. 04 24
        call    timer_settime                           ; 4C3B _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 4C40 _ 8B. 45, F4
        cmp     eax, dword [ebp-10H]                    ; 4C43 _ 3B. 45, F0
        jz      ?_279                                   ; 4C46 _ 74, 1B
        cmp     dword [ebp-0CH], 0                      ; 4C48 _ 83. 7D, F4, 00
        jz      ?_279                                   ; 4C4C _ 74, 15
        mov     eax, dword [ebp-0CH]                    ; 4C4E _ 8B. 45, F4
        mov     eax, dword [eax]                        ; 4C51 _ 8B. 00
        mov     dword [esp+4H], eax                     ; 4C53 _ 89. 44 24, 04
        mov     dword [esp], 0                          ; 4C57 _ C7. 04 24, 00000000
        call    farjmp                                  ; 4C5E _ E8, FFFFFFFC(rel)
?_279:  leave                                           ; 4C63 _ C9
        ret                                             ; 4C64 _ C3
; task_switch End of function

task_sleep:; Function begin
        push    ebp                                     ; 4C65 _ 55
        mov     ebp, esp                                ; 4C66 _ 89. E5
        sub     esp, 40                                 ; 4C68 _ 83. EC, 28
        mov     dword [ebp-0CH], 0                      ; 4C6B _ C7. 45, F4, 00000000
        mov     dword [ebp-10H], 0                      ; 4C72 _ C7. 45, F0, 00000000
        mov     eax, dword [ebp+8H]                     ; 4C79 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 4C7C _ 8B. 40, 04
        cmp     eax, 2                                  ; 4C7F _ 83. F8, 02
        jnz     ?_280                                   ; 4C82 _ 75, 51
        call    task_now                                ; 4C84 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 4C89 _ 89. 45, F4
        mov     eax, dword [ebp+8H]                     ; 4C8C _ 8B. 45, 08
        mov     dword [esp], eax                        ; 4C8F _ 89. 04 24
        call    task_remove                             ; 4C92 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], 1                      ; 4C97 _ C7. 45, F0, 00000001
        mov     eax, dword [ebp+8H]                     ; 4C9E _ 8B. 45, 08
        cmp     eax, dword [ebp-0CH]                    ; 4CA1 _ 3B. 45, F4
        jnz     ?_280                                   ; 4CA4 _ 75, 2F
        call    task_switch_sub                         ; 4CA6 _ E8, FFFFFFFC(rel)
        call    task_now                                ; 4CAB _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 4CB0 _ 89. 45, F4
        mov     dword [ebp-10H], 2                      ; 4CB3 _ C7. 45, F0, 00000002
        cmp     dword [ebp-0CH], 0                      ; 4CBA _ 83. 7D, F4, 00
        jz      ?_280                                   ; 4CBE _ 74, 15
        mov     eax, dword [ebp-0CH]                    ; 4CC0 _ 8B. 45, F4
        mov     eax, dword [eax]                        ; 4CC3 _ 8B. 00
        mov     dword [esp+4H], eax                     ; 4CC5 _ 89. 44 24, 04
        mov     dword [esp], 0                          ; 4CC9 _ C7. 04 24, 00000000
        call    farjmp                                  ; 4CD0 _ E8, FFFFFFFC(rel)
?_280:  mov     eax, dword [ebp-10H]                    ; 4CD5 _ 8B. 45, F0
        leave                                           ; 4CD8 _ C9
        ret                                             ; 4CD9 _ C3
; task_sleep End of function

task_now:; Function begin
        push    ebp                                     ; 4CDA _ 55
        mov     ebp, esp                                ; 4CDB _ 89. E5
        sub     esp, 16                                 ; 4CDD _ 83. EC, 10
        mov     ecx, dword [task_control]               ; 4CE0 _ 8B. 0D, 00002248(d)
        mov     eax, dword [task_control]               ; 4CE6 _ A1, 00002248(d)
        mov     edx, dword [eax]                        ; 4CEB _ 8B. 10
        mov     eax, edx                                ; 4CED _ 89. D0
        shl     eax, 2                                  ; 4CEF _ C1. E0, 02
        add     eax, edx                                ; 4CF2 _ 01. D0
        shl     eax, 2                                  ; 4CF4 _ C1. E0, 02
        add     eax, ecx                                ; 4CF7 _ 01. C8
        add     eax, 8                                  ; 4CF9 _ 83. C0, 08
        mov     dword [ebp-4H], eax                     ; 4CFC _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 4CFF _ 8B. 45, FC
        mov     edx, dword [eax+4H]                     ; 4D02 _ 8B. 50, 04
        mov     eax, dword [ebp-4H]                     ; 4D05 _ 8B. 45, FC
        mov     eax, dword [eax+edx*4+8H]               ; 4D08 _ 8B. 44 90, 08
        leave                                           ; 4D0C _ C9
        ret                                             ; 4D0D _ C3
; task_now End of function

task_add:; Function begin
        push    ebp                                     ; 4D0E _ 55
        mov     ebp, esp                                ; 4D0F _ 89. E5
        sub     esp, 16                                 ; 4D11 _ 83. EC, 10
        mov     ecx, dword [task_control]               ; 4D14 _ 8B. 0D, 00002248(d)
        mov     eax, dword [ebp+8H]                     ; 4D1A _ 8B. 45, 08
        mov     edx, dword [eax+0CH]                    ; 4D1D _ 8B. 50, 0C
        mov     eax, edx                                ; 4D20 _ 89. D0
        shl     eax, 2                                  ; 4D22 _ C1. E0, 02
        add     eax, edx                                ; 4D25 _ 01. D0
        shl     eax, 2                                  ; 4D27 _ C1. E0, 02
        add     eax, ecx                                ; 4D2A _ 01. C8
        add     eax, 8                                  ; 4D2C _ 83. C0, 08
        mov     dword [ebp-4H], eax                     ; 4D2F _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 4D32 _ 8B. 45, FC
        mov     edx, dword [eax]                        ; 4D35 _ 8B. 10
        mov     eax, dword [ebp-4H]                     ; 4D37 _ 8B. 45, FC
        mov     ecx, dword [ebp+8H]                     ; 4D3A _ 8B. 4D, 08
        mov     dword [eax+edx*4+8H], ecx               ; 4D3D _ 89. 4C 90, 08
        mov     eax, dword [ebp-4H]                     ; 4D41 _ 8B. 45, FC
        mov     eax, dword [eax]                        ; 4D44 _ 8B. 00
        lea     edx, [eax+1H]                           ; 4D46 _ 8D. 50, 01
        mov     eax, dword [ebp-4H]                     ; 4D49 _ 8B. 45, FC
        mov     dword [eax], edx                        ; 4D4C _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 4D4E _ 8B. 45, 08
        mov     dword [eax+4H], 2                       ; 4D51 _ C7. 40, 04, 00000002
        leave                                           ; 4D58 _ C9
        ret                                             ; 4D59 _ C3
; task_add End of function

task_remove:; Function begin
        push    ebp                                     ; 4D5A _ 55
        mov     ebp, esp                                ; 4D5B _ 89. E5
        sub     esp, 16                                 ; 4D5D _ 83. EC, 10
        mov     ecx, dword [task_control]               ; 4D60 _ 8B. 0D, 00002248(d)
        mov     eax, dword [ebp+8H]                     ; 4D66 _ 8B. 45, 08
        mov     edx, dword [eax+0CH]                    ; 4D69 _ 8B. 50, 0C
        mov     eax, edx                                ; 4D6C _ 89. D0
        shl     eax, 2                                  ; 4D6E _ C1. E0, 02
        add     eax, edx                                ; 4D71 _ 01. D0
        shl     eax, 2                                  ; 4D73 _ C1. E0, 02
        add     eax, ecx                                ; 4D76 _ 01. C8
        add     eax, 8                                  ; 4D78 _ 83. C0, 08
        mov     dword [ebp-4H], eax                     ; 4D7B _ 89. 45, FC
        mov     dword [ebp-8H], 0                       ; 4D7E _ C7. 45, F8, 00000000
        jmp     ?_283                                   ; 4D85 _ EB, 23

?_281:  mov     eax, dword [ebp-4H]                     ; 4D87 _ 8B. 45, FC
        mov     edx, dword [ebp-8H]                     ; 4D8A _ 8B. 55, F8
        mov     eax, dword [eax+edx*4+8H]               ; 4D8D _ 8B. 44 90, 08
        cmp     eax, dword [ebp+8H]                     ; 4D91 _ 3B. 45, 08
        jnz     ?_282                                   ; 4D94 _ 75, 10
        mov     eax, dword [ebp-4H]                     ; 4D96 _ 8B. 45, FC
        mov     edx, dword [ebp-8H]                     ; 4D99 _ 8B. 55, F8
        mov     dword [eax+edx*4+8H], 0                 ; 4D9C _ C7. 44 90, 08, 00000000
        jmp     ?_284                                   ; 4DA4 _ EB, 0E

?_282:  add     dword [ebp-8H], 1                       ; 4DA6 _ 83. 45, F8, 01
?_283:  mov     eax, dword [ebp-4H]                     ; 4DAA _ 8B. 45, FC
        mov     eax, dword [eax]                        ; 4DAD _ 8B. 00
        cmp     eax, dword [ebp-8H]                     ; 4DAF _ 3B. 45, F8
        jg      ?_281                                   ; 4DB2 _ 7F, D3
?_284:  mov     eax, dword [ebp-4H]                     ; 4DB4 _ 8B. 45, FC
        mov     eax, dword [eax]                        ; 4DB7 _ 8B. 00
        lea     edx, [eax-1H]                           ; 4DB9 _ 8D. 50, FF
        mov     eax, dword [ebp-4H]                     ; 4DBC _ 8B. 45, FC
        mov     dword [eax], edx                        ; 4DBF _ 89. 10
        mov     eax, dword [ebp-4H]                     ; 4DC1 _ 8B. 45, FC
        mov     eax, dword [eax+4H]                     ; 4DC4 _ 8B. 40, 04
        cmp     eax, dword [ebp-8H]                     ; 4DC7 _ 3B. 45, F8
        jle     ?_285                                   ; 4DCA _ 7E, 0F
        mov     eax, dword [ebp-4H]                     ; 4DCC _ 8B. 45, FC
        mov     eax, dword [eax+4H]                     ; 4DCF _ 8B. 40, 04
        lea     edx, [eax-1H]                           ; 4DD2 _ 8D. 50, FF
        mov     eax, dword [ebp-4H]                     ; 4DD5 _ 8B. 45, FC
        mov     dword [eax+4H], edx                     ; 4DD8 _ 89. 50, 04
?_285:  mov     eax, dword [ebp-4H]                     ; 4DDB _ 8B. 45, FC
        mov     edx, dword [eax+4H]                     ; 4DDE _ 8B. 50, 04
        mov     eax, dword [ebp-4H]                     ; 4DE1 _ 8B. 45, FC
        mov     eax, dword [eax]                        ; 4DE4 _ 8B. 00
        cmp     edx, eax                                ; 4DE6 _ 39. C2
        jl      ?_286                                   ; 4DE8 _ 7C, 0A
        mov     eax, dword [ebp-4H]                     ; 4DEA _ 8B. 45, FC
        mov     dword [eax+4H], 0                       ; 4DED _ C7. 40, 04, 00000000
?_286:  mov     eax, dword [ebp+8H]                     ; 4DF4 _ 8B. 45, 08
        mov     dword [eax+4H], 1                       ; 4DF7 _ C7. 40, 04, 00000001
        jmp     ?_288                                   ; 4DFE _ EB, 1B

?_287:  mov     eax, dword [ebp-8H]                     ; 4E00 _ 8B. 45, F8
        lea     edx, [eax+1H]                           ; 4E03 _ 8D. 50, 01
        mov     eax, dword [ebp-4H]                     ; 4E06 _ 8B. 45, FC
        mov     ecx, dword [eax+edx*4+8H]               ; 4E09 _ 8B. 4C 90, 08
        mov     eax, dword [ebp-4H]                     ; 4E0D _ 8B. 45, FC
        mov     edx, dword [ebp-8H]                     ; 4E10 _ 8B. 55, F8
        mov     dword [eax+edx*4+8H], ecx               ; 4E13 _ 89. 4C 90, 08
        add     dword [ebp-8H], 1                       ; 4E17 _ 83. 45, F8, 01
?_288:  mov     eax, dword [ebp-4H]                     ; 4E1B _ 8B. 45, FC
        mov     eax, dword [eax]                        ; 4E1E _ 8B. 00
        cmp     eax, dword [ebp-8H]                     ; 4E20 _ 3B. 45, F8
        jg      ?_287                                   ; 4E23 _ 7F, DB
        leave                                           ; 4E25 _ C9
        ret                                             ; 4E26 _ C3
; task_remove End of function

task_switch_sub:; Function begin
        push    ebp                                     ; 4E27 _ 55
        mov     ebp, esp                                ; 4E28 _ 89. E5
        sub     esp, 16                                 ; 4E2A _ 83. EC, 10
        mov     dword [ebp-4H], 0                       ; 4E2D _ C7. 45, FC, 00000000
        jmp     ?_291                                   ; 4E34 _ EB, 24

?_289:  mov     ecx, dword [task_control]               ; 4E36 _ 8B. 0D, 00002248(d)
        mov     edx, dword [ebp-4H]                     ; 4E3C _ 8B. 55, FC
        mov     eax, edx                                ; 4E3F _ 89. D0
        shl     eax, 2                                  ; 4E41 _ C1. E0, 02
        add     eax, edx                                ; 4E44 _ 01. D0
        shl     eax, 2                                  ; 4E46 _ C1. E0, 02
        add     eax, ecx                                ; 4E49 _ 01. C8
        add     eax, 8                                  ; 4E4B _ 83. C0, 08
        mov     eax, dword [eax]                        ; 4E4E _ 8B. 00
        test    eax, eax                                ; 4E50 _ 85. C0
        jle     ?_290                                   ; 4E52 _ 7E, 02
        jmp     ?_292                                   ; 4E54 _ EB, 0A

?_290:  add     dword [ebp-4H], 1                       ; 4E56 _ 83. 45, FC, 01
?_291:  cmp     dword [ebp-4H], 2                       ; 4E5A _ 83. 7D, FC, 02
        jle     ?_289                                   ; 4E5E _ 7E, D6
?_292:  mov     eax, dword [task_control]               ; 4E60 _ A1, 00002248(d)
        mov     edx, dword [ebp-4H]                     ; 4E65 _ 8B. 55, FC
        mov     dword [eax], edx                        ; 4E68 _ 89. 10
        mov     eax, dword [task_control]               ; 4E6A _ A1, 00002248(d)
        mov     dword [eax+4H], 0                       ; 4E6F _ C7. 40, 04, 00000000
        leave                                           ; 4E76 _ C9
        ret                                             ; 4E77 _ C3
; task_switch_sub End of function

task_send_message:; Function begin
        push    ebp                                     ; 4E78 _ 55
        mov     ebp, esp                                ; 4E79 _ 89. E5
        sub     esp, 24                                 ; 4E7B _ 83. EC, 18
        mov     eax, dword [ebp+10H]                    ; 4E7E _ 8B. 45, 10
        movzx   eax, al                                 ; 4E81 _ 0F B6. C0
        mov     edx, dword [ebp+0CH]                    ; 4E84 _ 8B. 55, 0C
        add     edx, 16                                 ; 4E87 _ 83. C2, 10
        mov     dword [esp+4H], eax                     ; 4E8A _ 89. 44 24, 04
        mov     dword [esp], edx                        ; 4E8E _ 89. 14 24
        call    fifo8_put                               ; 4E91 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 4E96 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 4E99 _ 89. 04 24
        call    task_sleep                              ; 4E9C _ E8, FFFFFFFC(rel)
        leave                                           ; 4EA1 _ C9
        ret                                             ; 4EA2 _ C3
; task_send_message End of function

file_load_content:; Function begin
        push    ebp                                     ; 4EA3 _ 55
        mov     ebp, esp                                ; 4EA4 _ 89. E5
        sub     esp, 56                                 ; 4EA6 _ 83. EC, 38
        mov     dword [ebp-24H], 78848                  ; 4EA9 _ C7. 45, DC, 00013400
        mov     eax, dword [memman]                     ; 4EB0 _ A1, 00000000(d)
        mov     dword [esp+4H], 13                      ; 4EB5 _ C7. 44 24, 04, 0000000D
        mov     dword [esp], eax                        ; 4EBD _ 89. 04 24
        call    memman_alloc                            ; 4EC0 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-14H], eax                    ; 4EC5 _ 89. 45, EC
        mov     eax, dword [ebp-14H]                    ; 4EC8 _ 8B. 45, EC
        add     eax, 12                                 ; 4ECB _ 83. C0, 0C
        mov     byte [eax], 0                           ; 4ECE _ C6. 00, 00
        jmp     ?_303                                   ; 4ED1 _ E9, 00000129

?_293:  mov     dword [ebp-20H], 0                      ; 4ED6 _ C7. 45, E0, 00000000
        jmp     ?_296                                   ; 4EDD _ EB, 2C

?_294:  mov     edx, dword [ebp-24H]                    ; 4EDF _ 8B. 55, DC
        mov     eax, dword [ebp-20H]                    ; 4EE2 _ 8B. 45, E0
        add     eax, edx                                ; 4EE5 _ 01. D0
        movzx   eax, byte [eax]                         ; 4EE7 _ 0F B6. 00
        test    al, al                                  ; 4EEA _ 84. C0
        jz      ?_295                                   ; 4EEC _ 74, 1B
        mov     edx, dword [ebp-20H]                    ; 4EEE _ 8B. 55, E0
        mov     eax, dword [ebp-14H]                    ; 4EF1 _ 8B. 45, EC
        add     edx, eax                                ; 4EF4 _ 01. C2
        mov     ecx, dword [ebp-24H]                    ; 4EF6 _ 8B. 4D, DC
        mov     eax, dword [ebp-20H]                    ; 4EF9 _ 8B. 45, E0
        add     eax, ecx                                ; 4EFC _ 01. C8
        movzx   eax, byte [eax]                         ; 4EFE _ 0F B6. 00
        mov     byte [edx], al                          ; 4F01 _ 88. 02
        add     dword [ebp-20H], 1                      ; 4F03 _ 83. 45, E0, 01
        jmp     ?_296                                   ; 4F07 _ EB, 02

?_295:  jmp     ?_297                                   ; 4F09 _ EB, 06

?_296:  cmp     dword [ebp-20H], 7                      ; 4F0B _ 83. 7D, E0, 07
        jle     ?_294                                   ; 4F0F _ 7E, CE
?_297:  mov     dword [ebp-1CH], 0                      ; 4F11 _ C7. 45, E4, 00000000
        mov     edx, dword [ebp-20H]                    ; 4F18 _ 8B. 55, E0
        mov     eax, dword [ebp-14H]                    ; 4F1B _ 8B. 45, EC
        add     eax, edx                                ; 4F1E _ 01. D0
        mov     byte [eax], 46                          ; 4F20 _ C6. 00, 2E
        add     dword [ebp-20H], 1                      ; 4F23 _ 83. 45, E0, 01
        mov     dword [ebp-1CH], 0                      ; 4F27 _ C7. 45, E4, 00000000
        jmp     ?_299                                   ; 4F2E _ EB, 1E

?_298:  mov     edx, dword [ebp-20H]                    ; 4F30 _ 8B. 55, E0
        mov     eax, dword [ebp-14H]                    ; 4F33 _ 8B. 45, EC
        add     edx, eax                                ; 4F36 _ 01. C2
        mov     ecx, dword [ebp-24H]                    ; 4F38 _ 8B. 4D, DC
        mov     eax, dword [ebp-1CH]                    ; 4F3B _ 8B. 45, E4
        add     eax, ecx                                ; 4F3E _ 01. C8
        movzx   eax, byte [eax+8H]                      ; 4F40 _ 0F B6. 40, 08
        mov     byte [edx], al                          ; 4F44 _ 88. 02
        add     dword [ebp-20H], 1                      ; 4F46 _ 83. 45, E0, 01
        add     dword [ebp-1CH], 1                      ; 4F4A _ 83. 45, E4, 01
?_299:  cmp     dword [ebp-1CH], 2                      ; 4F4E _ 83. 7D, E4, 02
        jle     ?_298                                   ; 4F52 _ 7E, DC
        mov     edx, dword [ebp-20H]                    ; 4F54 _ 8B. 55, E0
        mov     eax, dword [ebp-14H]                    ; 4F57 _ 8B. 45, EC
        add     eax, edx                                ; 4F5A _ 01. D0
        mov     byte [eax], 0                           ; 4F5C _ C6. 00, 00
        mov     eax, dword [ebp-14H]                    ; 4F5F _ 8B. 45, EC
        mov     dword [esp+4H], eax                     ; 4F62 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 4F66 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 4F69 _ 89. 04 24
        call    strcmp                                  ; 4F6C _ E8, FFFFFFFC(rel)
        cmp     eax, 1                                  ; 4F71 _ 83. F8, 01
        jne     ?_302                                   ; 4F74 _ 0F 85, 00000081
        mov     eax, dword [ebp-24H]                    ; 4F7A _ 8B. 45, DC
        mov     edx, dword [eax+1CH]                    ; 4F7D _ 8B. 50, 1C
        mov     eax, dword [memman]                     ; 4F80 _ A1, 00000000(d)
        mov     dword [esp+4H], edx                     ; 4F85 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 4F89 _ 89. 04 24
        call    memman_alloc_4k                         ; 4F8C _ E8, FFFFFFFC(rel)
        mov     edx, eax                                ; 4F91 _ 89. C2
        mov     eax, dword [ebp+0CH]                    ; 4F93 _ 8B. 45, 0C
        mov     dword [eax], edx                        ; 4F96 _ 89. 10
        mov     eax, dword [ebp-24H]                    ; 4F98 _ 8B. 45, DC
        mov     eax, dword [eax+1CH]                    ; 4F9B _ 8B. 40, 1C
        mov     edx, eax                                ; 4F9E _ 89. C2
        mov     eax, dword [ebp+0CH]                    ; 4FA0 _ 8B. 45, 0C
        mov     dword [eax+4H], edx                     ; 4FA3 _ 89. 50, 04
        mov     dword [ebp-10H], 88064                  ; 4FA6 _ C7. 45, F0, 00015800
        mov     eax, dword [ebp-24H]                    ; 4FAD _ 8B. 45, DC
        movzx   eax, word [eax+1AH]                     ; 4FB0 _ 0F B7. 40, 1A
        movzx   eax, ax                                 ; 4FB4 _ 0F B7. C0
        shl     eax, 9                                  ; 4FB7 _ C1. E0, 09
        add     dword [ebp-10H], eax                    ; 4FBA _ 01. 45, F0
        mov     eax, dword [ebp-24H]                    ; 4FBD _ 8B. 45, DC
        mov     eax, dword [eax+1CH]                    ; 4FC0 _ 8B. 40, 1C
        mov     dword [ebp-0CH], eax                    ; 4FC3 _ 89. 45, F4
        mov     dword [ebp-18H], 0                      ; 4FC6 _ C7. 45, E8, 00000000
        mov     dword [ebp-18H], 0                      ; 4FCD _ C7. 45, E8, 00000000
        jmp     ?_301                                   ; 4FD4 _ EB, 1B

?_300:  mov     eax, dword [ebp+0CH]                    ; 4FD6 _ 8B. 45, 0C
        mov     edx, dword [eax]                        ; 4FD9 _ 8B. 10
        mov     eax, dword [ebp-18H]                    ; 4FDB _ 8B. 45, E8
        add     edx, eax                                ; 4FDE _ 01. C2
        mov     ecx, dword [ebp-18H]                    ; 4FE0 _ 8B. 4D, E8
        mov     eax, dword [ebp-10H]                    ; 4FE3 _ 8B. 45, F0
        add     eax, ecx                                ; 4FE6 _ 01. C8
        movzx   eax, byte [eax]                         ; 4FE8 _ 0F B6. 00
        mov     byte [edx], al                          ; 4FEB _ 88. 02
        add     dword [ebp-18H], 1                      ; 4FED _ 83. 45, E8, 01
?_301:  mov     eax, dword [ebp-18H]                    ; 4FF1 _ 8B. 45, E8
        cmp     eax, dword [ebp-0CH]                    ; 4FF4 _ 3B. 45, F4
        jl      ?_300                                   ; 4FF7 _ 7C, DD
        jmp     ?_304                                   ; 4FF9 _ EB, 12

?_302:  add     dword [ebp-24H], 32                     ; 4FFB _ 83. 45, DC, 20
?_303:  mov     eax, dword [ebp-24H]                    ; 4FFF _ 8B. 45, DC
        movzx   eax, byte [eax]                         ; 5002 _ 0F B6. 00
        test    al, al                                  ; 5005 _ 84. C0
        jne     ?_293                                   ; 5007 _ 0F 85, FFFFFEC9
?_304:  mov     edx, dword [ebp-14H]                    ; 500D _ 8B. 55, EC
        mov     eax, dword [memman]                     ; 5010 _ A1, 00000000(d)
        mov     dword [esp+8H], 13                      ; 5015 _ C7. 44 24, 08, 0000000D
        mov     dword [esp+4H], edx                     ; 501D _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 5021 _ 89. 04 24
        call    memman_free                             ; 5024 _ E8, FFFFFFFC(rel)
        leave                                           ; 5029 _ C9
        ret                                             ; 502A _ C3
; file_load_content End of function



?_305:                                                  ; byte
        db 77H, 69H, 6EH, 64H, 6FH, 77H, 00H            ; 0000 _ window.

?_306:                                                  ; byte
        db 63H, 6FH, 6EH, 73H, 6FH, 6CH, 65H, 00H       ; 0007 _ console.

?_307:                                                  ; byte
        db 65H, 6EH, 74H, 65H, 72H, 20H, 74H, 61H       ; 000F _ enter ta
        db 73H, 6BH, 20H, 62H, 00H                      ; 0017 _ sk b.

?_308:                                                  ; byte
        db 42H, 00H                                     ; 001C _ B.

?_309:                                                  ; byte
        db 70H, 61H, 67H, 65H, 20H, 69H, 73H, 3AH       ; 001E _ page is:
        db 20H, 00H                                     ; 0026 _  .

?_310:                                                  ; byte
        db 42H, 61H, 73H, 65H, 41H, 64H, 64H, 72H       ; 0028 _ BaseAddr
        db 4CH, 3AH, 20H, 00H                           ; 0030 _ L: .

?_311:                                                  ; byte
        db 42H, 61H, 73H, 65H, 41H, 64H, 64H, 72H       ; 0034 _ BaseAddr
        db 48H, 3AH, 20H, 00H                           ; 003C _ H: .

?_312:                                                  ; byte
        db 6CH, 65H, 6EH, 67H, 74H, 68H, 4CH, 6FH       ; 0040 _ lengthLo
        db 77H, 3AH, 20H, 00H                           ; 0048 _ w: .

?_313:                                                  ; byte
        db 6CH, 65H, 6EH, 67H, 74H, 68H, 48H, 69H       ; 004C _ lengthHi
        db 67H, 68H, 3AH, 20H, 00H                      ; 0054 _ gh: .

?_314:                                                  ; byte
        db 74H, 79H, 70H, 65H, 3AH, 20H, 00H            ; 0059 _ type: .

?_315:                                                  ; byte
        db 3EH, 00H                                     ; 0060 _ >.

?_316:                                                  ; byte
        db 6DH, 65H, 6DH, 00H                           ; 0062 _ mem.

?_317:                                                  ; byte
        db 63H, 6CH, 73H, 00H                           ; 0066 _ cls.

?_318:                                                  ; byte
        db 64H, 69H, 72H, 00H                           ; 006A _ dir.

?_319:                                                  ; byte
        db 68H, 6CH, 74H, 00H                           ; 006E _ hlt.

?_320:                                                  ; byte
        db 66H, 72H, 65H, 65H, 20H, 00H                 ; 0072 _ free .

?_321:                                                  ; byte
        db 20H, 4BH, 42H, 00H                           ; 0078 _  KB.

?_322:                                                  ; byte
        db 20H, 00H                                     ; 007C _  .

?_323:                                                  ; byte
        db 68H, 6CH, 74H, 2EH, 65H, 78H, 65H, 00H       ; 007E _ hlt.exe.

?_324:                                                  ; byte
        db 63H, 6FH, 6EH, 73H, 6FH, 6CH, 65H, 00H       ; 0086 _ console.

?_325:                                                  ; byte
        db 49H, 4EH, 54H, 20H, 30H, 44H, 20H, 00H       ; 008E _ INT 0D .

?_326:                                                  ; byte
        db 47H, 65H, 6EH, 65H, 72H, 61H, 6CH, 20H       ; 0096 _ General 
        db 50H, 72H, 6FH, 74H, 65H, 63H, 74H, 65H       ; 009E _ Protecte
        db 64H, 20H, 45H, 78H, 63H, 65H, 70H, 74H       ; 00A6 _ d Except
        db 69H, 6FH, 6EH, 00H                           ; 00AE _ ion.



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

table_rgb.1814:                                         ; byte
        db 00H, 00H, 00H, 0FFH, 00H, 00H, 44H, 8CH      ; 0120 _ ......D.
        db 0BBH, 0FFH, 0FFH, 00H, 00H, 00H, 0FFH, 0FFH  ; 0128 _ ........
        db 00H, 0FFH, 00H, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH ; 0130 _ ........
        db 0C6H, 0C6H, 0C6H, 84H, 00H, 00H, 00H, 84H    ; 0138 _ ........
        db 00H, 84H, 84H, 00H, 00H, 00H, 84H, 84H       ; 0140 _ ........
        db 00H, 84H, 00H, 84H, 84H, 84H, 84H, 84H       ; 0148 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0150 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0158 _ ........

cursor.1882:                                            ; byte
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

closebtn.1969:                                          ; byte
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

?_327:  db 00H                                          ; 0342 _ .

?_328:  db 00H, 00H                                     ; 0343 _ ..



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

timerinfo1.1796:                                        ; byte
        resb    28                                      ; 0018

timerbuf1.1799:                                         ; qword
        resq    1                                       ; 0034

timerinfo2.1797:                                        ; byte
        resb    28                                      ; 003C

timerbuf2.1800:                                         ; qword
        resq    1                                       ; 0058

timerinfo3.1798:                                        ; byte
        resb    28                                      ; 0060

timerbuf3.1801:                                         ; qword
        resq    4                                       ; 007C
        resb    4                                       ; 009C

screen_info:                                            ; qword
        resb    4                                       ; 00A0

?_329:  resw    1                                       ; 00A4

?_330:  resw    1                                       ; 00A6

g_Console:                                              ; byte
        resd    1                                       ; 00A8

?_331:  resd    1                                       ; 00AC

?_332:  resd    1                                       ; 00B0

?_333:  resd    1                                       ; 00B4

?_334:  resb    1                                       ; 00B8

?_335:  resb    7                                       ; 00B9

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

buffer:                                                 ; qword
        resb    4                                       ; 01D8

?_336:  resd    1                                       ; 01DC

mouse_send_info:                                        ; oword
        resb    32                                      ; 01E0

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

?_337:  resb    9                                       ; 02E1

?_338:  resb    22                                      ; 02EA

timer_control:                                          ; byte
        resd    2001                                    ; 0300

task_timer:                                             ; dword
        resd    1                                       ; 2244

task_control:                                           ; dword
        resd    1                                       ; 2248


