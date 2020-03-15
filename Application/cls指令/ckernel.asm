; Disassembly of file: ckernel.o
; Sun Mar 15 10:48:38 2020
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
        mov     dword [esp+4H], ?_256                   ; 02DC _ C7. 44 24, 04, 00000000(d)
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
        mov     dword [esp+8H], ?_256                   ; 047D _ C7. 44 24, 08, 00000000(d)
        mov     dword [esp+4H], edx                     ; 0485 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0489 _ 89. 04 24
        call    make_window_title                       ; 048C _ E8, FFFFFFFC(rel)
        mov     eax, dword [sheet_control]              ; 0491 _ A1, 0000000C(d)
        mov     dword [esp+0CH], 1                      ; 0496 _ C7. 44 24, 0C, 00000001
        mov     dword [esp+8H], ?_257                   ; 049E _ C7. 44 24, 08, 00000007(d)
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
        mov     dword [esp+8H], ?_256                   ; 0506 _ C7. 44 24, 08, 00000000(d)
        mov     dword [esp+4H], edx                     ; 050E _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0512 _ 89. 04 24
        call    make_window_title                       ; 0515 _ E8, FFFFFFFC(rel)
        mov     eax, dword [sheet_control]              ; 051A _ A1, 0000000C(d)
        mov     dword [esp+0CH], 0                      ; 051F _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], ?_257                   ; 0527 _ C7. 44 24, 08, 00000007(d)
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
        mov     dword [esp+10H], ?_258                  ; 095F _ C7. 44 24, 10, 0000000F(d)
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
        mov     dword [esp+10H], ?_259                  ; 0A41 _ C7. 44 24, 10, 0000001C(d)
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
        mov     dword [esp+8H], table_rgb.1765          ; 0AAE _ C7. 44 24, 08, 00000120(d)
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
        movzx   eax, word [?_274]                       ; 0F51 _ 0F B7. 05, 000000A4(d)
        cwde                                            ; 0F58 _ 98
        mov     dword [ebp-8H], eax                     ; 0F59 _ 89. 45, F8
        movzx   eax, word [?_275]                       ; 0F5C _ 0F B7. 05, 000000A6(d)
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
        add     eax, cursor.1833                        ; 11F5 _ 05, 00000160(d)
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
        add     eax, cursor.1833                        ; 1227 _ 05, 00000160(d)
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
?_048:  movzx   eax, word [?_274]                       ; 138A _ 0F B7. 05, 000000A4(d)
        cwde                                            ; 1391 _ 98
        lea     edx, [eax-10H]                          ; 1392 _ 8D. 50, F0
        mov     eax, dword [mouse_x]                    ; 1395 _ A1, 000001C8(d)
        cmp     edx, eax                                ; 139A _ 39. C2
        jge     ?_049                                   ; 139C _ 7D, 10
        movzx   eax, word [?_274]                       ; 139E _ 0F B7. 05, 000000A4(d)
        cwde                                            ; 13A5 _ 98
        sub     eax, 16                                 ; 13A6 _ 83. E8, 10
        mov     dword [mouse_x], eax                    ; 13A9 _ A3, 000001C8(d)
?_049:  movzx   eax, word [?_274]                       ; 13AE _ 0F B7. 05, 000000A4(d)
        cwde                                            ; 13B5 _ 98
        lea     edx, [eax-10H]                          ; 13B6 _ 8D. 50, F0
        mov     eax, dword [mouse_y]                    ; 13B9 _ A1, 000001CC(d)
        cmp     edx, eax                                ; 13BE _ 39. C2
        jge     ?_050                                   ; 13C0 _ 7D, 10
        movzx   eax, word [?_274]                       ; 13C2 _ 0F B7. 05, 000000A4(d)
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
        movzx   eax, word [?_274]                       ; 14A6 _ 0F B7. 05, 000000A4(d)
        cwde                                            ; 14AD _ 98
        mov     dword [ebp-28H], eax                    ; 14AE _ 89. 45, D8
        movzx   eax, word [?_275]                       ; 14B1 _ 0F B7. 05, 000000A6(d)
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
        mov     dword [esp+10H], ?_260                  ; 14DF _ C7. 44 24, 10, 0000001E(d)
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
        mov     dword [esp+10H], ?_261                  ; 1550 _ C7. 44 24, 10, 00000028(d)
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
        mov     dword [esp+10H], ?_262                  ; 15C3 _ C7. 44 24, 10, 00000034(d)
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
        mov     dword [esp+10H], ?_263                  ; 1637 _ C7. 44 24, 10, 00000040(d)
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
        mov     dword [esp+10H], ?_264                  ; 16AB _ C7. 44 24, 10, 0000004C(d)
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
        mov     dword [esp+10H], ?_265                  ; 171F _ C7. 44 24, 10, 00000059(d)
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
        add     eax, closebtn.1920                      ; 1E94 _ 05, 00000260(d)
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
        sub     esp, 248                                ; 209C _ 81. EC, 000000F8
        mov     eax, dword [ebp+8H]                     ; 20A2 _ 8B. 45, 08
        mov     dword [ebp-0DCH], eax                   ; 20A5 _ 89. 85, FFFFFF24
; Note: Absolute memory address without relocation
        mov     eax, dword [gs:14H]                     ; 20AB _ 65: A1, 00000014
        mov     dword [ebp-0CH], eax                    ; 20B1 _ 89. 45, F4
        xor     eax, eax                                ; 20B4 _ 31. C0
        call    task_now                                ; 20B6 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0BCH], eax                   ; 20BB _ 89. 85, FFFFFF44
        mov     dword [ebp-0D0H], 16                    ; 20C1 _ C7. 85, FFFFFF30, 00000010
        mov     dword [ebp-0CCH], 28                    ; 20CB _ C7. 85, FFFFFF34, 0000001C
        mov     dword [ebp-0C8H], 0                     ; 20D5 _ C7. 85, FFFFFF38, 00000000
        mov     dword [ebp-0C4H], 0                     ; 20DF _ C7. 85, FFFFFF3C, 00000000
        mov     dword [ebp-0C0H], 0                     ; 20E9 _ C7. 85, FFFFFF40, 00000000
        mov     eax, dword [ebp-0BCH]                   ; 20F3 _ 8B. 85, FFFFFF44
        lea     edx, [eax+10H]                          ; 20F9 _ 8D. 50, 10
        mov     eax, dword [ebp-0BCH]                   ; 20FC _ 8B. 85, FFFFFF44
        mov     dword [esp+0CH], eax                    ; 2102 _ 89. 44 24, 0C
        lea     eax, [ebp-8CH]                          ; 2106 _ 8D. 85, FFFFFF74
        mov     dword [esp+8H], eax                     ; 210C _ 89. 44 24, 08
        mov     dword [esp+4H], 128                     ; 2110 _ C7. 44 24, 04, 00000080
        mov     dword [esp], edx                        ; 2118 _ 89. 14 24
        call    fifo8_init                              ; 211B _ E8, FFFFFFFC(rel)
        call    timer_alloc                             ; 2120 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0B8H], eax                   ; 2125 _ 89. 85, FFFFFF48
        mov     eax, dword [ebp-0BCH]                   ; 212B _ 8B. 85, FFFFFF44
        add     eax, 16                                 ; 2131 _ 83. C0, 10
        mov     dword [esp+8H], 1                       ; 2134 _ C7. 44 24, 08, 00000001
        mov     dword [esp+4H], eax                     ; 213C _ 89. 44 24, 04
        mov     eax, dword [ebp-0B8H]                   ; 2140 _ 8B. 85, FFFFFF48
        mov     dword [esp], eax                        ; 2146 _ 89. 04 24
        call    timer_init                              ; 2149 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 50                      ; 214E _ C7. 44 24, 04, 00000032
        mov     eax, dword [ebp-0B8H]                   ; 2156 _ 8B. 85, FFFFFF48
        mov     dword [esp], eax                        ; 215C _ 89. 04 24
        call    timer_settime                           ; 215F _ E8, FFFFFFFC(rel)
        mov     eax, dword [sheet_control]              ; 2164 _ A1, 00000000(d)
        mov     dword [esp+14H], 7                      ; 2169 _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_266                  ; 2171 _ C7. 44 24, 10, 00000060(d)
        mov     dword [esp+0CH], 28                     ; 2179 _ C7. 44 24, 0C, 0000001C
        mov     dword [esp+8H], 8                       ; 2181 _ C7. 44 24, 08, 00000008
        mov     edx, dword [ebp-0DCH]                   ; 2189 _ 8B. 95, FFFFFF24
        mov     dword [esp+4H], edx                     ; 218F _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 2193 _ 89. 04 24
        call    paint_string                            ; 2196 _ E8, FFFFFFFC(rel)
?_078:  call    io_cli                                  ; 219B _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0BCH]                   ; 21A0 _ 8B. 85, FFFFFF44
        add     eax, 16                                 ; 21A6 _ 83. C0, 10
        mov     dword [esp], eax                        ; 21A9 _ 89. 04 24
        call    fifo8_status                            ; 21AC _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 21B1 _ 85. C0
        jnz     ?_079                                   ; 21B3 _ 75, 0A
        call    io_sti                                  ; 21B5 _ E8, FFFFFFFC(rel)
        jmp     ?_094                                   ; 21BA _ E9, 000005A7

?_079:  mov     eax, dword [ebp-0BCH]                   ; 21BF _ 8B. 85, FFFFFF44
        add     eax, 16                                 ; 21C5 _ 83. C0, 10
        mov     dword [esp], eax                        ; 21C8 _ 89. 04 24
        call    fifo8_get                               ; 21CB _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0B4H], eax                   ; 21D0 _ 89. 85, FFFFFF4C
        call    io_sti                                  ; 21D6 _ E8, FFFFFFFC(rel)
        cmp     dword [ebp-0B4H], 1                     ; 21DB _ 83. BD, FFFFFF4C, 01
        jg      ?_082                                   ; 21E2 _ 0F 8F, 0000008D
        cmp     dword [ebp-0C8H], 0                     ; 21E8 _ 83. BD, FFFFFF38, 00
        js      ?_082                                   ; 21EF _ 0F 88, 00000080
        cmp     dword [ebp-0B4H], 0                     ; 21F5 _ 83. BD, FFFFFF4C, 00
        jz      ?_080                                   ; 21FC _ 74, 2F
        mov     eax, dword [ebp-0BCH]                   ; 21FE _ 8B. 85, FFFFFF44
        add     eax, 16                                 ; 2204 _ 83. C0, 10
        mov     dword [esp+8H], 0                       ; 2207 _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], eax                     ; 220F _ 89. 44 24, 04
        mov     eax, dword [ebp-0B8H]                   ; 2213 _ 8B. 85, FFFFFF48
        mov     dword [esp], eax                        ; 2219 _ 89. 04 24
        call    timer_init                              ; 221C _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0C8H], 7                     ; 2221 _ C7. 85, FFFFFF38, 00000007
        jmp     ?_081                                   ; 222B _ EB, 2D

?_080:  mov     eax, dword [ebp-0BCH]                   ; 222D _ 8B. 85, FFFFFF44
        add     eax, 16                                 ; 2233 _ 83. C0, 10
        mov     dword [esp+8H], 1                       ; 2236 _ C7. 44 24, 08, 00000001
        mov     dword [esp+4H], eax                     ; 223E _ 89. 44 24, 04
        mov     eax, dword [ebp-0B8H]                   ; 2242 _ 8B. 85, FFFFFF48
        mov     dword [esp], eax                        ; 2248 _ 89. 04 24
        call    timer_init                              ; 224B _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0C8H], 0                     ; 2250 _ C7. 85, FFFFFF38, 00000000
?_081:  mov     dword [esp+4H], 50                      ; 225A _ C7. 44 24, 04, 00000032
        mov     eax, dword [ebp-0B8H]                   ; 2262 _ 8B. 85, FFFFFF48
        mov     dword [esp], eax                        ; 2268 _ 89. 04 24
        call    timer_settime                           ; 226B _ E8, FFFFFFFC(rel)
        jmp     ?_093                                   ; 2270 _ E9, 000004AE

?_082:  cmp     dword [ebp-0B4H], 87                    ; 2275 _ 83. BD, FFFFFF4C, 57
        jnz     ?_083                                   ; 227C _ 75, 48
        mov     dword [ebp-0C8H], 7                     ; 227E _ C7. 85, FFFFFF38, 00000007
        mov     eax, dword [ebp-0BCH]                   ; 2288 _ 8B. 85, FFFFFF44
        add     eax, 16                                 ; 228E _ 83. C0, 10
        mov     dword [esp+8H], 0                       ; 2291 _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], eax                     ; 2299 _ 89. 44 24, 04
        mov     eax, dword [ebp-0B8H]                   ; 229D _ 8B. 85, FFFFFF48
        mov     dword [esp], eax                        ; 22A3 _ 89. 04 24
        call    timer_init                              ; 22A6 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 50                      ; 22AB _ C7. 44 24, 04, 00000032
        mov     eax, dword [ebp-0B8H]                   ; 22B3 _ 8B. 85, FFFFFF48
        mov     dword [esp], eax                        ; 22B9 _ 89. 04 24
        call    timer_settime                           ; 22BC _ E8, FFFFFFFC(rel)
        jmp     ?_093                                   ; 22C1 _ E9, 0000045D

?_083:  cmp     dword [ebp-0B4H], 88                    ; 22C6 _ 83. BD, FFFFFF4C, 58
        jnz     ?_084                                   ; 22CD _ 75, 5F
        mov     eax, dword [sheet_control]              ; 22CF _ A1, 00000000(d)
        mov     dword [esp+10H], 0                      ; 22D4 _ C7. 44 24, 10, 00000000
        mov     edx, dword [ebp-0CCH]                   ; 22DC _ 8B. 95, FFFFFF34
        mov     dword [esp+0CH], edx                    ; 22E2 _ 89. 54 24, 0C
        mov     edx, dword [ebp-0D0H]                   ; 22E6 _ 8B. 95, FFFFFF30
        mov     dword [esp+8H], edx                     ; 22EC _ 89. 54 24, 08
        mov     edx, dword [ebp-0DCH]                   ; 22F0 _ 8B. 95, FFFFFF24
        mov     dword [esp+4H], edx                     ; 22F6 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 22FA _ 89. 04 24
        call    set_cursor                              ; 22FD _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0C8H], -1                    ; 2302 _ C7. 85, FFFFFF38, FFFFFFFF
        mov     eax, dword [task_main]                  ; 230C _ A1, 00000000(d)
        mov     dword [esp+8H], 0                       ; 2311 _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], -1                      ; 2319 _ C7. 44 24, 04, FFFFFFFF
        mov     dword [esp], eax                        ; 2321 _ 89. 04 24
        call    task_run                                ; 2324 _ E8, FFFFFFFC(rel)
        jmp     ?_093                                   ; 2329 _ E9, 000003F5

?_084:  cmp     dword [ebp-0B4H], 28                    ; 232E _ 83. BD, FFFFFF4C, 1C
        jne     ?_091                                   ; 2335 _ 0F 85, 00000286
        mov     eax, dword [sheet_control]              ; 233B _ A1, 00000000(d)
        mov     dword [esp+10H], 0                      ; 2340 _ C7. 44 24, 10, 00000000
        mov     edx, dword [ebp-0CCH]                   ; 2348 _ 8B. 95, FFFFFF34
        mov     dword [esp+0CH], edx                    ; 234E _ 89. 54 24, 0C
        mov     edx, dword [ebp-0D0H]                   ; 2352 _ 8B. 95, FFFFFF30
        mov     dword [esp+8H], edx                     ; 2358 _ 89. 54 24, 08
        mov     edx, dword [ebp-0DCH]                   ; 235C _ 8B. 95, FFFFFF24
        mov     dword [esp+4H], edx                     ; 2362 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 2366 _ 89. 04 24
        call    set_cursor                              ; 2369 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0D0H]                   ; 236E _ 8B. 85, FFFFFF30
        lea     edx, [eax+7H]                           ; 2374 _ 8D. 50, 07
        test    eax, eax                                ; 2377 _ 85. C0
        cmovs   eax, edx                                ; 2379 _ 0F 48. C2
        sar     eax, 3                                  ; 237C _ C1. F8, 03
        sub     eax, 2                                  ; 237F _ 83. E8, 02
        mov     byte [ebp+eax-0AAH], 0                  ; 2382 _ C6. 84 05, FFFFFF56, 00
        mov     eax, dword [ebp-0DCH]                   ; 238A _ 8B. 85, FFFFFF24
        mov     dword [esp+4H], eax                     ; 2390 _ 89. 44 24, 04
        mov     eax, dword [ebp-0CCH]                   ; 2394 _ 8B. 85, FFFFFF34
        mov     dword [esp], eax                        ; 239A _ 89. 04 24
        call    console_new_line                        ; 239D _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CCH], eax                   ; 23A2 _ 89. 85, FFFFFF34
        mov     dword [esp+4H], ?_267                   ; 23A8 _ C7. 44 24, 04, 00000062(d)
        lea     eax, [ebp-0AAH]                         ; 23B0 _ 8D. 85, FFFFFF56
        mov     dword [esp], eax                        ; 23B6 _ 89. 04 24
        call    strcmp                                  ; 23B9 _ E8, FFFFFFFC(rel)
        cmp     eax, 1                                  ; 23BE _ 83. F8, 01
        jne     ?_085                                   ; 23C1 _ 0F 85, 000000EF
        mov     eax, dword [ebp+0CH]                    ; 23C7 _ 8B. 45, 0C
        lea     edx, [eax+3FFH]                         ; 23CA _ 8D. 90, 000003FF
        test    eax, eax                                ; 23D0 _ 85. C0
        cmovs   eax, edx                                ; 23D2 _ 0F 48. C2
        sar     eax, 10                                 ; 23D5 _ C1. F8, 0A
        mov     dword [esp], eax                        ; 23D8 _ 89. 04 24
        call    intToHexStr                             ; 23DB _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0B0H], eax                   ; 23E0 _ 89. 85, FFFFFF50
        mov     eax, dword [sheet_control]              ; 23E6 _ A1, 00000000(d)
        mov     dword [esp+14H], 7                      ; 23EB _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_268                  ; 23F3 _ C7. 44 24, 10, 00000066(d)
        mov     edx, dword [ebp-0CCH]                   ; 23FB _ 8B. 95, FFFFFF34
        mov     dword [esp+0CH], edx                    ; 2401 _ 89. 54 24, 0C
        mov     dword [esp+8H], 16                      ; 2405 _ C7. 44 24, 08, 00000010
        mov     edx, dword [ebp-0DCH]                   ; 240D _ 8B. 95, FFFFFF24
        mov     dword [esp+4H], edx                     ; 2413 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 2417 _ 89. 04 24
        call    paint_string                            ; 241A _ E8, FFFFFFFC(rel)
        mov     eax, dword [sheet_control]              ; 241F _ A1, 00000000(d)
        mov     dword [esp+14H], 7                      ; 2424 _ C7. 44 24, 14, 00000007
        mov     edx, dword [ebp-0B0H]                   ; 242C _ 8B. 95, FFFFFF50
        mov     dword [esp+10H], edx                    ; 2432 _ 89. 54 24, 10
        mov     edx, dword [ebp-0CCH]                   ; 2436 _ 8B. 95, FFFFFF34
        mov     dword [esp+0CH], edx                    ; 243C _ 89. 54 24, 0C
        mov     dword [esp+8H], 52                      ; 2440 _ C7. 44 24, 08, 00000034
        mov     edx, dword [ebp-0DCH]                   ; 2448 _ 8B. 95, FFFFFF24
        mov     dword [esp+4H], edx                     ; 244E _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 2452 _ 89. 04 24
        call    paint_string                            ; 2455 _ E8, FFFFFFFC(rel)
        mov     eax, dword [sheet_control]              ; 245A _ A1, 00000000(d)
        mov     dword [esp+14H], 7                      ; 245F _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_269                  ; 2467 _ C7. 44 24, 10, 0000006C(d)
        mov     edx, dword [ebp-0CCH]                   ; 246F _ 8B. 95, FFFFFF34
        mov     dword [esp+0CH], edx                    ; 2475 _ 89. 54 24, 0C
        mov     dword [esp+8H], 126                     ; 2479 _ C7. 44 24, 08, 0000007E
        mov     edx, dword [ebp-0DCH]                   ; 2481 _ 8B. 95, FFFFFF24
        mov     dword [esp+4H], edx                     ; 2487 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 248B _ 89. 04 24
        call    paint_string                            ; 248E _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0DCH]                   ; 2493 _ 8B. 85, FFFFFF24
        mov     dword [esp+4H], eax                     ; 2499 _ 89. 44 24, 04
        mov     eax, dword [ebp-0CCH]                   ; 249D _ 8B. 85, FFFFFF34
        mov     dword [esp], eax                        ; 24A3 _ 89. 04 24
        call    console_new_line                        ; 24A6 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CCH], eax                   ; 24AB _ 89. 85, FFFFFF34
        jmp     ?_090                                   ; 24B1 _ E9, 000000FC

?_085:  mov     dword [esp+4H], ?_270                   ; 24B6 _ C7. 44 24, 04, 00000070(d)
        lea     eax, [ebp-0AAH]                         ; 24BE _ 8D. 85, FFFFFF56
        mov     dword [esp], eax                        ; 24C4 _ 89. 04 24
        call    strcmp                                  ; 24C7 _ E8, FFFFFFFC(rel)
        cmp     eax, 1                                  ; 24CC _ 83. F8, 01
        jne     ?_090                                   ; 24CF _ 0F 85, 000000DD
        mov     dword [ebp-0C0H], 28                    ; 24D5 _ C7. 85, FFFFFF40, 0000001C
        jmp     ?_089                                   ; 24DF _ EB, 4D

?_086:  mov     dword [ebp-0C4H], 8                     ; 24E1 _ C7. 85, FFFFFF3C, 00000008
        jmp     ?_088                                   ; 24EB _ EB, 2E

?_087:  mov     eax, dword [ebp-0DCH]                   ; 24ED _ 8B. 85, FFFFFF24
        mov     edx, dword [eax]                        ; 24F3 _ 8B. 10
        mov     eax, dword [ebp-0DCH]                   ; 24F5 _ 8B. 85, FFFFFF24
        mov     eax, dword [eax+4H]                     ; 24FB _ 8B. 40, 04
        imul    eax, dword [ebp-0C0H]                   ; 24FE _ 0F AF. 85, FFFFFF40
        mov     ecx, eax                                ; 2505 _ 89. C1
        mov     eax, dword [ebp-0C4H]                   ; 2507 _ 8B. 85, FFFFFF3C
        add     eax, ecx                                ; 250D _ 01. C8
        add     eax, edx                                ; 250F _ 01. D0
        mov     byte [eax], 0                           ; 2511 _ C6. 00, 00
        add     dword [ebp-0C4H], 1                     ; 2514 _ 83. 85, FFFFFF3C, 01
?_088:  cmp     dword [ebp-0C4H], 247                   ; 251B _ 81. BD, FFFFFF3C, 000000F7
        jle     ?_087                                   ; 2525 _ 7E, C6
        add     dword [ebp-0C0H], 1                     ; 2527 _ 83. 85, FFFFFF40, 01
?_089:  cmp     dword [ebp-0C0H], 155                   ; 252E _ 81. BD, FFFFFF40, 0000009B
        jle     ?_086                                   ; 2538 _ 7E, A7
        mov     eax, dword [sheet_control]              ; 253A _ A1, 00000000(d)
        mov     dword [esp+14H], 156                    ; 253F _ C7. 44 24, 14, 0000009C
        mov     dword [esp+10H], 248                    ; 2547 _ C7. 44 24, 10, 000000F8
        mov     dword [esp+0CH], 28                     ; 254F _ C7. 44 24, 0C, 0000001C
        mov     dword [esp+8H], 8                       ; 2557 _ C7. 44 24, 08, 00000008
        mov     edx, dword [ebp-0DCH]                   ; 255F _ 8B. 95, FFFFFF24
        mov     dword [esp+4H], edx                     ; 2565 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 2569 _ 89. 04 24
        call    sheet_refresh                           ; 256C _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CCH], 28                    ; 2571 _ C7. 85, FFFFFF34, 0000001C
        mov     eax, dword [sheet_control]              ; 257B _ A1, 00000000(d)
        mov     dword [esp+14H], 7                      ; 2580 _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_266                  ; 2588 _ C7. 44 24, 10, 00000060(d)
        mov     dword [esp+0CH], 28                     ; 2590 _ C7. 44 24, 0C, 0000001C
        mov     dword [esp+8H], 8                       ; 2598 _ C7. 44 24, 08, 00000008
        mov     edx, dword [ebp-0DCH]                   ; 25A0 _ 8B. 95, FFFFFF24
        mov     dword [esp+4H], edx                     ; 25A6 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 25AA _ 89. 04 24
        call    paint_string                            ; 25AD _ E8, FFFFFFFC(rel)
?_090:  mov     dword [ebp-0D0H], 16                    ; 25B2 _ C7. 85, FFFFFF30, 00000010
        jmp     ?_093                                   ; 25BC _ E9, 00000162

?_091:  cmp     dword [ebp-0B4H], 14                    ; 25C1 _ 83. BD, FFFFFF4C, 0E
        jnz     ?_092                                   ; 25C8 _ 75, 7B
        cmp     dword [ebp-0D0H], 16                    ; 25CA _ 83. BD, FFFFFF30, 10
        jle     ?_092                                   ; 25D1 _ 7E, 72
        mov     eax, dword [sheet_control]              ; 25D3 _ A1, 00000000(d)
        mov     dword [esp+10H], 0                      ; 25D8 _ C7. 44 24, 10, 00000000
        mov     edx, dword [ebp-0CCH]                   ; 25E0 _ 8B. 95, FFFFFF34
        mov     dword [esp+0CH], edx                    ; 25E6 _ 89. 54 24, 0C
        mov     edx, dword [ebp-0D0H]                   ; 25EA _ 8B. 95, FFFFFF30
        mov     dword [esp+8H], edx                     ; 25F0 _ 89. 54 24, 08
        mov     edx, dword [ebp-0DCH]                   ; 25F4 _ 8B. 95, FFFFFF24
        mov     dword [esp+4H], edx                     ; 25FA _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 25FE _ 89. 04 24
        call    set_cursor                              ; 2601 _ E8, FFFFFFFC(rel)
        sub     dword [ebp-0D0H], 8                     ; 2606 _ 83. AD, FFFFFF30, 08
        mov     eax, dword [sheet_control]              ; 260D _ A1, 00000000(d)
        mov     dword [esp+10H], 0                      ; 2612 _ C7. 44 24, 10, 00000000
        mov     edx, dword [ebp-0CCH]                   ; 261A _ 8B. 95, FFFFFF34
        mov     dword [esp+0CH], edx                    ; 2620 _ 89. 54 24, 0C
        mov     edx, dword [ebp-0D0H]                   ; 2624 _ 8B. 95, FFFFFF30
        mov     dword [esp+8H], edx                     ; 262A _ 89. 54 24, 08
        mov     edx, dword [ebp-0DCH]                   ; 262E _ 8B. 95, FFFFFF24
        mov     dword [esp+4H], edx                     ; 2634 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 2638 _ 89. 04 24
        call    set_cursor                              ; 263B _ E8, FFFFFFFC(rel)
        jmp     ?_093                                   ; 2640 _ E9, 000000DE

?_092:  mov     eax, dword [ebp-0B4H]                   ; 2645 _ 8B. 85, FFFFFF4C
        mov     dword [esp], eax                        ; 264B _ 89. 04 24
        call    transfer_scancode                       ; 264E _ E8, FFFFFFFC(rel)
        mov     byte [ebp-0D3H], al                     ; 2653 _ 88. 85, FFFFFF2D
        cmp     byte [ebp-0D3H], 0                      ; 2659 _ 80. BD, FFFFFF2D, 00
        je      ?_093                                   ; 2660 _ 0F 84, 000000BD
        cmp     dword [ebp-0D0H], 239                   ; 2666 _ 81. BD, FFFFFF30, 000000EF
        jg      ?_093                                   ; 2670 _ 0F 8F, 000000AD
        mov     eax, dword [sheet_control]              ; 2676 _ A1, 00000000(d)
        mov     dword [esp+10H], 0                      ; 267B _ C7. 44 24, 10, 00000000
        mov     edx, dword [ebp-0CCH]                   ; 2683 _ 8B. 95, FFFFFF34
        mov     dword [esp+0CH], edx                    ; 2689 _ 89. 54 24, 0C
        mov     edx, dword [ebp-0D0H]                   ; 268D _ 8B. 95, FFFFFF30
        mov     dword [esp+8H], edx                     ; 2693 _ 89. 54 24, 08
        mov     edx, dword [ebp-0DCH]                   ; 2697 _ 8B. 95, FFFFFF24
        mov     dword [esp+4H], edx                     ; 269D _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 26A1 _ 89. 04 24
        call    set_cursor                              ; 26A4 _ E8, FFFFFFFC(rel)
        movzx   eax, byte [ebp-0D3H]                    ; 26A9 _ 0F B6. 85, FFFFFF2D
        mov     byte [ebp-0D2H], al                     ; 26B0 _ 88. 85, FFFFFF2E
        mov     byte [ebp-0D1H], 0                      ; 26B6 _ C6. 85, FFFFFF2F, 00
        mov     eax, dword [ebp-0D0H]                   ; 26BD _ 8B. 85, FFFFFF30
        lea     edx, [eax+7H]                           ; 26C3 _ 8D. 50, 07
        test    eax, eax                                ; 26C6 _ 85. C0
        cmovs   eax, edx                                ; 26C8 _ 0F 48. C2
        sar     eax, 3                                  ; 26CB _ C1. F8, 03
        lea     edx, [eax-2H]                           ; 26CE _ 8D. 50, FE
        movzx   eax, byte [ebp-0D3H]                    ; 26D1 _ 0F B6. 85, FFFFFF2D
        mov     byte [ebp+edx-0AAH], al                 ; 26D8 _ 88. 84 15, FFFFFF56
        mov     eax, dword [sheet_control]              ; 26DF _ A1, 00000000(d)
        mov     dword [esp+14H], 7                      ; 26E4 _ C7. 44 24, 14, 00000007
        lea     edx, [ebp-0D2H]                         ; 26EC _ 8D. 95, FFFFFF2E
        mov     dword [esp+10H], edx                    ; 26F2 _ 89. 54 24, 10
        mov     edx, dword [ebp-0CCH]                   ; 26F6 _ 8B. 95, FFFFFF34
        mov     dword [esp+0CH], edx                    ; 26FC _ 89. 54 24, 0C
        mov     edx, dword [ebp-0D0H]                   ; 2700 _ 8B. 95, FFFFFF30
        mov     dword [esp+8H], edx                     ; 2706 _ 89. 54 24, 08
        mov     edx, dword [ebp-0DCH]                   ; 270A _ 8B. 95, FFFFFF24
        mov     dword [esp+4H], edx                     ; 2710 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 2714 _ 89. 04 24
        call    paint_string                            ; 2717 _ E8, FFFFFFFC(rel)
        add     dword [ebp-0D0H], 8                     ; 271C _ 83. 85, FFFFFF30, 08
?_093:  cmp     dword [ebp-0C8H], 0                     ; 2723 _ 83. BD, FFFFFF38, 00
        js      ?_094                                   ; 272A _ 78, 3A
        mov     eax, dword [sheet_control]              ; 272C _ A1, 00000000(d)
        mov     edx, dword [ebp-0C8H]                   ; 2731 _ 8B. 95, FFFFFF38
        mov     dword [esp+10H], edx                    ; 2737 _ 89. 54 24, 10
        mov     edx, dword [ebp-0CCH]                   ; 273B _ 8B. 95, FFFFFF34
        mov     dword [esp+0CH], edx                    ; 2741 _ 89. 54 24, 0C
        mov     edx, dword [ebp-0D0H]                   ; 2745 _ 8B. 95, FFFFFF30
        mov     dword [esp+8H], edx                     ; 274B _ 89. 54 24, 08
        mov     edx, dword [ebp-0DCH]                   ; 274F _ 8B. 95, FFFFFF24
        mov     dword [esp+4H], edx                     ; 2755 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 2759 _ 89. 04 24
        call    set_cursor                              ; 275C _ E8, FFFFFFFC(rel)
        jmp     ?_078                                   ; 2761 _ E9, FFFFFA35

?_094:  jmp     ?_078                                   ; 2766 _ E9, FFFFFA30
; console_task End of function

launch_console:; Function begin
        push    ebp                                     ; 276B _ 55
        mov     ebp, esp                                ; 276C _ 89. E5
        push    ebx                                     ; 276E _ 53
        sub     esp, 52                                 ; 276F _ 83. EC, 34
        mov     eax, dword [sheet_control]              ; 2772 _ A1, 00000000(d)
        mov     dword [esp], eax                        ; 2777 _ 89. 04 24
        call    sheet_alloc                             ; 277A _ E8, FFFFFFFC(rel)
        mov     dword [ebp-18H], eax                    ; 277F _ 89. 45, E8
        mov     eax, dword [memman]                     ; 2782 _ A1, 00000000(d)
        mov     dword [esp+4H], 42240                   ; 2787 _ C7. 44 24, 04, 0000A500
        mov     dword [esp], eax                        ; 278F _ 89. 04 24
        call    memman_alloc_4k                         ; 2792 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-14H], eax                    ; 2797 _ 89. 45, EC
        mov     dword [esp+10H], 99                     ; 279A _ C7. 44 24, 10, 00000063
        mov     dword [esp+0CH], 165                    ; 27A2 _ C7. 44 24, 0C, 000000A5
        mov     dword [esp+8H], 256                     ; 27AA _ C7. 44 24, 08, 00000100
        mov     eax, dword [ebp-14H]                    ; 27B2 _ 8B. 45, EC
        mov     dword [esp+4H], eax                     ; 27B5 _ 89. 44 24, 04
        mov     eax, dword [ebp-18H]                    ; 27B9 _ 8B. 45, E8
        mov     dword [esp], eax                        ; 27BC _ 89. 04 24
        call    sheet_setbuf                            ; 27BF _ E8, FFFFFFFC(rel)
        mov     eax, dword [sheet_control]              ; 27C4 _ A1, 00000000(d)
        mov     dword [esp+0CH], 0                      ; 27C9 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], ?_271                   ; 27D1 _ C7. 44 24, 08, 00000074(d)
        mov     edx, dword [ebp-18H]                    ; 27D9 _ 8B. 55, E8
        mov     dword [esp+4H], edx                     ; 27DC _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 27E0 _ 89. 04 24
        call    make_windows                            ; 27E3 _ E8, FFFFFFFC(rel)
        mov     dword [esp+14H], 0                      ; 27E8 _ C7. 44 24, 14, 00000000
        mov     dword [esp+10H], 128                    ; 27F0 _ C7. 44 24, 10, 00000080
        mov     dword [esp+0CH], 240                    ; 27F8 _ C7. 44 24, 0C, 000000F0
        mov     dword [esp+8H], 28                      ; 2800 _ C7. 44 24, 08, 0000001C
        mov     dword [esp+4H], 8                       ; 2808 _ C7. 44 24, 04, 00000008
        mov     eax, dword [ebp-18H]                    ; 2810 _ 8B. 45, E8
        mov     dword [esp], eax                        ; 2813 _ 89. 04 24
        call    make_textbox                            ; 2816 _ E8, FFFFFFFC(rel)
        call    task_alloc                              ; 281B _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 2820 _ 89. 45, F0
        call    get_code32_addr                         ; 2823 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 2828 _ 89. 45, F4
        mov     eax, dword [ebp-10H]                    ; 282B _ 8B. 45, F0
        mov     dword [eax+8CH], 0                      ; 282E _ C7. 80, 0000008C, 00000000
        mov     eax, dword [ebp-10H]                    ; 2838 _ 8B. 45, F0
        mov     dword [eax+90H], 1073741824             ; 283B _ C7. 80, 00000090, 40000000
        mov     eax, console_task                       ; 2845 _ B8, 00000000(d)
        sub     eax, dword [ebp-0CH]                    ; 284A _ 2B. 45, F4
        mov     edx, eax                                ; 284D _ 89. C2
        mov     eax, dword [ebp-10H]                    ; 284F _ 8B. 45, F0
        mov     dword [eax+4CH], edx                    ; 2852 _ 89. 50, 4C
        mov     eax, dword [ebp-10H]                    ; 2855 _ 8B. 45, F0
        mov     dword [eax+74H], 0                      ; 2858 _ C7. 40, 74, 00000000
        mov     eax, dword [ebp-10H]                    ; 285F _ 8B. 45, F0
        mov     dword [eax+78H], 8                      ; 2862 _ C7. 40, 78, 00000008
        mov     eax, dword [ebp-10H]                    ; 2869 _ 8B. 45, F0
        mov     dword [eax+7CH], 48                     ; 286C _ C7. 40, 7C, 00000030
        mov     eax, dword [ebp-10H]                    ; 2873 _ 8B. 45, F0
        mov     dword [eax+80H], 32                     ; 2876 _ C7. 80, 00000080, 00000020
        mov     eax, dword [ebp-10H]                    ; 2880 _ 8B. 45, F0
        mov     dword [eax+84H], 0                      ; 2883 _ C7. 80, 00000084, 00000000
        mov     eax, dword [ebp-10H]                    ; 288D _ 8B. 45, F0
        mov     dword [eax+88H], 16                     ; 2890 _ C7. 80, 00000088, 00000010
        mov     eax, dword [ebp-10H]                    ; 289A _ 8B. 45, F0
        mov     eax, dword [eax+64H]                    ; 289D _ 8B. 40, 64
        lea     edx, [eax-4H]                           ; 28A0 _ 8D. 50, FC
        mov     eax, dword [ebp-10H]                    ; 28A3 _ 8B. 45, F0
        mov     dword [eax+64H], edx                    ; 28A6 _ 89. 50, 64
        mov     eax, dword [ebp-10H]                    ; 28A9 _ 8B. 45, F0
        mov     eax, dword [eax+64H]                    ; 28AC _ 8B. 40, 64
        add     eax, 4                                  ; 28AF _ 83. C0, 04
        mov     edx, dword [ebp-18H]                    ; 28B2 _ 8B. 55, E8
        mov     dword [eax], edx                        ; 28B5 _ 89. 10
        mov     eax, dword [ebp-10H]                    ; 28B7 _ 8B. 45, F0
        mov     eax, dword [eax+64H]                    ; 28BA _ 8B. 40, 64
        add     eax, 8                                  ; 28BD _ 83. C0, 08
        mov     ebx, eax                                ; 28C0 _ 89. C3
        mov     eax, dword [memman]                     ; 28C2 _ A1, 00000000(d)
        mov     dword [esp], eax                        ; 28C7 _ 89. 04 24
        call    memman_total                            ; 28CA _ E8, FFFFFFFC(rel)
        mov     dword [ebx], eax                        ; 28CF _ 89. 03
        mov     dword [esp+8H], 5                       ; 28D1 _ C7. 44 24, 08, 00000005
        mov     dword [esp+4H], 1                       ; 28D9 _ C7. 44 24, 04, 00000001
        mov     eax, dword [ebp-10H]                    ; 28E1 _ 8B. 45, F0
        mov     dword [esp], eax                        ; 28E4 _ 89. 04 24
        call    task_run                                ; 28E7 _ E8, FFFFFFFC(rel)
        mov     eax, dword [sheet_control]              ; 28EC _ A1, 00000000(d)
        mov     dword [esp+0CH], 4                      ; 28F1 _ C7. 44 24, 0C, 00000004
        mov     dword [esp+8H], 32                      ; 28F9 _ C7. 44 24, 08, 00000020
        mov     edx, dword [ebp-18H]                    ; 2901 _ 8B. 55, E8
        mov     dword [esp+4H], edx                     ; 2904 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 2908 _ 89. 04 24
        call    sheet_slide                             ; 290B _ E8, FFFFFFFC(rel)
        mov     eax, dword [sheet_control]              ; 2910 _ A1, 00000000(d)
        mov     dword [esp+8H], 1                       ; 2915 _ C7. 44 24, 08, 00000001
        mov     edx, dword [ebp-18H]                    ; 291D _ 8B. 55, E8
        mov     dword [esp+4H], edx                     ; 2920 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 2924 _ 89. 04 24
        call    sheet_updown                            ; 2927 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 292C _ 8B. 45, F0
        mov     dword [task_console_g], eax             ; 292F _ A3, 00000000(d)
        mov     eax, dword [ebp-18H]                    ; 2934 _ 8B. 45, E8
        add     esp, 52                                 ; 2937 _ 83. C4, 34
        pop     ebx                                     ; 293A _ 5B
        pop     ebp                                     ; 293B _ 5D
        ret                                             ; 293C _ C3
; launch_console End of function

set_cursor:; Function begin
        push    ebp                                     ; 293D _ 55
        mov     ebp, esp                                ; 293E _ 89. E5
        push    esi                                     ; 2940 _ 56
        push    ebx                                     ; 2941 _ 53
        sub     esp, 32                                 ; 2942 _ 83. EC, 20
        mov     eax, dword [ebp+14H]                    ; 2945 _ 8B. 45, 14
        lea     esi, [eax+0FH]                          ; 2948 _ 8D. 70, 0F
        mov     eax, dword [ebp+10H]                    ; 294B _ 8B. 45, 10
        lea     ebx, [eax+7H]                           ; 294E _ 8D. 58, 07
        mov     eax, dword [ebp+18H]                    ; 2951 _ 8B. 45, 18
        movzx   ecx, al                                 ; 2954 _ 0F B6. C8
        mov     eax, dword [ebp+0CH]                    ; 2957 _ 8B. 45, 0C
        mov     edx, dword [eax+4H]                     ; 295A _ 8B. 50, 04
        mov     eax, dword [ebp+0CH]                    ; 295D _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 2960 _ 8B. 00
        mov     dword [esp+18H], esi                    ; 2962 _ 89. 74 24, 18
        mov     dword [esp+14H], ebx                    ; 2966 _ 89. 5C 24, 14
        mov     ebx, dword [ebp+14H]                    ; 296A _ 8B. 5D, 14
        mov     dword [esp+10H], ebx                    ; 296D _ 89. 5C 24, 10
        mov     ebx, dword [ebp+10H]                    ; 2971 _ 8B. 5D, 10
        mov     dword [esp+0CH], ebx                    ; 2974 _ 89. 5C 24, 0C
        mov     dword [esp+8H], ecx                     ; 2978 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 297C _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 2980 _ 89. 04 24
        call    paint_rectangle                         ; 2983 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+14H]                    ; 2988 _ 8B. 45, 14
        lea     edx, [eax+10H]                          ; 298B _ 8D. 50, 10
        mov     eax, dword [ebp+10H]                    ; 298E _ 8B. 45, 10
        add     eax, 8                                  ; 2991 _ 83. C0, 08
        mov     dword [esp+14H], edx                    ; 2994 _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 2998 _ 89. 44 24, 10
        mov     eax, dword [ebp+14H]                    ; 299C _ 8B. 45, 14
        mov     dword [esp+0CH], eax                    ; 299F _ 89. 44 24, 0C
        mov     eax, dword [ebp+10H]                    ; 29A3 _ 8B. 45, 10
        mov     dword [esp+8H], eax                     ; 29A6 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 29AA _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 29AD _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 29B1 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 29B4 _ 89. 04 24
        call    sheet_refresh                           ; 29B7 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 29BC _ 83. C4, 20
        pop     ebx                                     ; 29BF _ 5B
        pop     esi                                     ; 29C0 _ 5E
        pop     ebp                                     ; 29C1 _ 5D
        ret                                             ; 29C2 _ C3
; set_cursor End of function

console_new_line:; Function begin
        push    ebp                                     ; 29C3 _ 55
        mov     ebp, esp                                ; 29C4 _ 89. E5
        push    ebx                                     ; 29C6 _ 53
        sub     esp, 52                                 ; 29C7 _ 83. EC, 34
        cmp     dword [ebp+8H], 139                     ; 29CA _ 81. 7D, 08, 0000008B
        jg      ?_095                                   ; 29D1 _ 7F, 09
        add     dword [ebp+8H], 16                      ; 29D3 _ 83. 45, 08, 10
        jmp     ?_104                                   ; 29D7 _ E9, 000000DF

?_095:  mov     dword [ebp-0CH], 28                     ; 29DC _ C7. 45, F4, 0000001C
        jmp     ?_099                                   ; 29E3 _ EB, 52

?_096:  mov     dword [ebp-10H], 8                      ; 29E5 _ C7. 45, F0, 00000008
        jmp     ?_098                                   ; 29EC _ EB, 3C

?_097:  mov     eax, dword [ebp+0CH]                    ; 29EE _ 8B. 45, 0C
        mov     edx, dword [eax]                        ; 29F1 _ 8B. 10
        mov     eax, dword [ebp+0CH]                    ; 29F3 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 29F6 _ 8B. 40, 04
        imul    eax, dword [ebp-0CH]                    ; 29F9 _ 0F AF. 45, F4
        mov     ecx, eax                                ; 29FD _ 89. C1
        mov     eax, dword [ebp-10H]                    ; 29FF _ 8B. 45, F0
        add     eax, ecx                                ; 2A02 _ 01. C8
        add     edx, eax                                ; 2A04 _ 01. C2
        mov     eax, dword [ebp+0CH]                    ; 2A06 _ 8B. 45, 0C
        mov     ecx, dword [eax]                        ; 2A09 _ 8B. 08
        mov     eax, dword [ebp-0CH]                    ; 2A0B _ 8B. 45, F4
        lea     ebx, [eax+10H]                          ; 2A0E _ 8D. 58, 10
        mov     eax, dword [ebp+0CH]                    ; 2A11 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 2A14 _ 8B. 40, 04
        imul    ebx, eax                                ; 2A17 _ 0F AF. D8
        mov     eax, dword [ebp-10H]                    ; 2A1A _ 8B. 45, F0
        add     eax, ebx                                ; 2A1D _ 01. D8
        add     eax, ecx                                ; 2A1F _ 01. C8
        movzx   eax, byte [eax]                         ; 2A21 _ 0F B6. 00
        mov     byte [edx], al                          ; 2A24 _ 88. 02
        add     dword [ebp-10H], 1                      ; 2A26 _ 83. 45, F0, 01
?_098:  cmp     dword [ebp-10H], 247                    ; 2A2A _ 81. 7D, F0, 000000F7
        jle     ?_097                                   ; 2A31 _ 7E, BB
        add     dword [ebp-0CH], 1                      ; 2A33 _ 83. 45, F4, 01
?_099:  cmp     dword [ebp-0CH], 139                    ; 2A37 _ 81. 7D, F4, 0000008B
        jle     ?_096                                   ; 2A3E _ 7E, A5
        mov     dword [ebp-0CH], 140                    ; 2A40 _ C7. 45, F4, 0000008C
        jmp     ?_103                                   ; 2A47 _ EB, 35

?_100:  mov     dword [ebp-10H], 8                      ; 2A49 _ C7. 45, F0, 00000008
        jmp     ?_102                                   ; 2A50 _ EB, 1F

?_101:  mov     eax, dword [ebp+0CH]                    ; 2A52 _ 8B. 45, 0C
        mov     edx, dword [eax]                        ; 2A55 _ 8B. 10
        mov     eax, dword [ebp+0CH]                    ; 2A57 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 2A5A _ 8B. 40, 04
        imul    eax, dword [ebp-0CH]                    ; 2A5D _ 0F AF. 45, F4
        mov     ecx, eax                                ; 2A61 _ 89. C1
        mov     eax, dword [ebp-10H]                    ; 2A63 _ 8B. 45, F0
        add     eax, ecx                                ; 2A66 _ 01. C8
        add     eax, edx                                ; 2A68 _ 01. D0
        mov     byte [eax], 0                           ; 2A6A _ C6. 00, 00
        add     dword [ebp-10H], 1                      ; 2A6D _ 83. 45, F0, 01
?_102:  cmp     dword [ebp-10H], 247                    ; 2A71 _ 81. 7D, F0, 000000F7
        jle     ?_101                                   ; 2A78 _ 7E, D8
        add     dword [ebp-0CH], 1                      ; 2A7A _ 83. 45, F4, 01
?_103:  cmp     dword [ebp-0CH], 155                    ; 2A7E _ 81. 7D, F4, 0000009B
        jle     ?_100                                   ; 2A85 _ 7E, C2
        mov     eax, dword [sheet_control]              ; 2A87 _ A1, 00000000(d)
        mov     dword [esp+14H], 156                    ; 2A8C _ C7. 44 24, 14, 0000009C
        mov     dword [esp+10H], 248                    ; 2A94 _ C7. 44 24, 10, 000000F8
        mov     dword [esp+0CH], 28                     ; 2A9C _ C7. 44 24, 0C, 0000001C
        mov     dword [esp+8H], 8                       ; 2AA4 _ C7. 44 24, 08, 00000008
        mov     edx, dword [ebp+0CH]                    ; 2AAC _ 8B. 55, 0C
        mov     dword [esp+4H], edx                     ; 2AAF _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 2AB3 _ 89. 04 24
        call    sheet_refresh                           ; 2AB6 _ E8, FFFFFFFC(rel)
?_104:  mov     eax, dword [sheet_control]              ; 2ABB _ A1, 00000000(d)
        mov     dword [esp+14H], 7                      ; 2AC0 _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_266                  ; 2AC8 _ C7. 44 24, 10, 00000060(d)
        mov     edx, dword [ebp+8H]                     ; 2AD0 _ 8B. 55, 08
        mov     dword [esp+0CH], edx                    ; 2AD3 _ 89. 54 24, 0C
        mov     dword [esp+8H], 8                       ; 2AD7 _ C7. 44 24, 08, 00000008
        mov     edx, dword [ebp+0CH]                    ; 2ADF _ 8B. 55, 0C
        mov     dword [esp+4H], edx                     ; 2AE2 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 2AE6 _ 89. 04 24
        call    paint_string                            ; 2AE9 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 2AEE _ 8B. 45, 08
        add     esp, 52                                 ; 2AF1 _ 83. C4, 34
        pop     ebx                                     ; 2AF4 _ 5B
        pop     ebp                                     ; 2AF5 _ 5D
        ret                                             ; 2AF6 _ C3
; console_new_line End of function

strcmp: ; Function begin
        push    ebp                                     ; 2AF7 _ 55
        mov     ebp, esp                                ; 2AF8 _ 89. E5
        sub     esp, 16                                 ; 2AFA _ 83. EC, 10
        cmp     dword [ebp+8H], 0                       ; 2AFD _ 83. 7D, 08, 00
        jz      ?_105                                   ; 2B01 _ 74, 06
        cmp     dword [ebp+0CH], 0                      ; 2B03 _ 83. 7D, 0C, 00
        jnz     ?_106                                   ; 2B07 _ 75, 0A
?_105:  mov     eax, 0                                  ; 2B09 _ B8, 00000000
        jmp     ?_113                                   ; 2B0E _ E9, 00000092

?_106:  mov     dword [ebp-4H], 0                       ; 2B13 _ C7. 45, FC, 00000000
        jmp     ?_109                                   ; 2B1A _ EB, 25

?_107:  mov     edx, dword [ebp-4H]                     ; 2B1C _ 8B. 55, FC
        mov     eax, dword [ebp+8H]                     ; 2B1F _ 8B. 45, 08
        add     eax, edx                                ; 2B22 _ 01. D0
        movzx   edx, byte [eax]                         ; 2B24 _ 0F B6. 10
        mov     ecx, dword [ebp-4H]                     ; 2B27 _ 8B. 4D, FC
        mov     eax, dword [ebp+0CH]                    ; 2B2A _ 8B. 45, 0C
        add     eax, ecx                                ; 2B2D _ 01. C8
        movzx   eax, byte [eax]                         ; 2B2F _ 0F B6. 00
        cmp     dl, al                                  ; 2B32 _ 38. C2
        jz      ?_108                                   ; 2B34 _ 74, 07
        mov     eax, 0                                  ; 2B36 _ B8, 00000000
        jmp     ?_113                                   ; 2B3B _ EB, 68

?_108:  add     dword [ebp-4H], 1                       ; 2B3D _ 83. 45, FC, 01
?_109:  mov     edx, dword [ebp-4H]                     ; 2B41 _ 8B. 55, FC
        mov     eax, dword [ebp+8H]                     ; 2B44 _ 8B. 45, 08
        add     eax, edx                                ; 2B47 _ 01. D0
        movzx   eax, byte [eax]                         ; 2B49 _ 0F B6. 00
        test    al, al                                  ; 2B4C _ 84. C0
        jz      ?_110                                   ; 2B4E _ 74, 06
        cmp     dword [ebp+0CH], 0                      ; 2B50 _ 83. 7D, 0C, 00
        jnz     ?_107                                   ; 2B54 _ 75, C6
?_110:  mov     edx, dword [ebp-4H]                     ; 2B56 _ 8B. 55, FC
        mov     eax, dword [ebp+8H]                     ; 2B59 _ 8B. 45, 08
        add     eax, edx                                ; 2B5C _ 01. D0
        movzx   eax, byte [eax]                         ; 2B5E _ 0F B6. 00
        test    al, al                                  ; 2B61 _ 84. C0
        jnz     ?_111                                   ; 2B63 _ 75, 16
        mov     edx, dword [ebp-4H]                     ; 2B65 _ 8B. 55, FC
        mov     eax, dword [ebp+0CH]                    ; 2B68 _ 8B. 45, 0C
        add     eax, edx                                ; 2B6B _ 01. D0
        movzx   eax, byte [eax]                         ; 2B6D _ 0F B6. 00
        test    al, al                                  ; 2B70 _ 84. C0
        jz      ?_111                                   ; 2B72 _ 74, 07
        mov     eax, 0                                  ; 2B74 _ B8, 00000000
        jmp     ?_113                                   ; 2B79 _ EB, 2A

?_111:  mov     edx, dword [ebp-4H]                     ; 2B7B _ 8B. 55, FC
        mov     eax, dword [ebp+8H]                     ; 2B7E _ 8B. 45, 08
        add     eax, edx                                ; 2B81 _ 01. D0
        movzx   eax, byte [eax]                         ; 2B83 _ 0F B6. 00
        test    al, al                                  ; 2B86 _ 84. C0
        jz      ?_112                                   ; 2B88 _ 74, 16
        mov     edx, dword [ebp-4H]                     ; 2B8A _ 8B. 55, FC
        mov     eax, dword [ebp+0CH]                    ; 2B8D _ 8B. 45, 0C
        add     eax, edx                                ; 2B90 _ 01. D0
        movzx   eax, byte [eax]                         ; 2B92 _ 0F B6. 00
        test    al, al                                  ; 2B95 _ 84. C0
        jz      ?_112                                   ; 2B97 _ 74, 07
        mov     eax, 0                                  ; 2B99 _ B8, 00000000
        jmp     ?_113                                   ; 2B9E _ EB, 05

?_112:  mov     eax, 1                                  ; 2BA0 _ B8, 00000001
?_113:  leave                                           ; 2BA5 _ C9
        ret                                             ; 2BA6 _ C3
; strcmp End of function

wait_KBC_sendready:; Function begin
        push    ebp                                     ; 2BA7 _ 55
        mov     ebp, esp                                ; 2BA8 _ 89. E5
        sub     esp, 24                                 ; 2BAA _ 83. EC, 18
?_114:  mov     dword [esp], 100                        ; 2BAD _ C7. 04 24, 00000064
        call    io_in8                                  ; 2BB4 _ E8, FFFFFFFC(rel)
        and     eax, 02H                                ; 2BB9 _ 83. E0, 02
        test    eax, eax                                ; 2BBC _ 85. C0
        jnz     ?_115                                   ; 2BBE _ 75, 02
        jmp     ?_116                                   ; 2BC0 _ EB, 02

?_115:  jmp     ?_114                                   ; 2BC2 _ EB, E9

?_116:  leave                                           ; 2BC4 _ C9
        ret                                             ; 2BC5 _ C3
; wait_KBC_sendready End of function

init_keyboard:; Function begin
        push    ebp                                     ; 2BC6 _ 55
        mov     ebp, esp                                ; 2BC7 _ 89. E5
        sub     esp, 24                                 ; 2BC9 _ 83. EC, 18
        call    wait_KBC_sendready                      ; 2BCC _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 96                      ; 2BD1 _ C7. 44 24, 04, 00000060
        mov     dword [esp], 100                        ; 2BD9 _ C7. 04 24, 00000064
        call    io_out8                                 ; 2BE0 _ E8, FFFFFFFC(rel)
        call    wait_KBC_sendready                      ; 2BE5 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 71                      ; 2BEA _ C7. 44 24, 04, 00000047
        mov     dword [esp], 96                         ; 2BF2 _ C7. 04 24, 00000060
        call    io_out8                                 ; 2BF9 _ E8, FFFFFFFC(rel)
        leave                                           ; 2BFE _ C9
        ret                                             ; 2BFF _ C3
; init_keyboard End of function

enable_mouse:; Function begin
        push    ebp                                     ; 2C00 _ 55
        mov     ebp, esp                                ; 2C01 _ 89. E5
        sub     esp, 24                                 ; 2C03 _ 83. EC, 18
        call    wait_KBC_sendready                      ; 2C06 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 212                     ; 2C0B _ C7. 44 24, 04, 000000D4
        mov     dword [esp], 100                        ; 2C13 _ C7. 04 24, 00000064
        call    io_out8                                 ; 2C1A _ E8, FFFFFFFC(rel)
        call    wait_KBC_sendready                      ; 2C1F _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 244                     ; 2C24 _ C7. 44 24, 04, 000000F4
        mov     dword [esp], 96                         ; 2C2C _ C7. 04 24, 00000060
        call    io_out8                                 ; 2C33 _ E8, FFFFFFFC(rel)
        leave                                           ; 2C38 _ C9
        ret                                             ; 2C39 _ C3
; enable_mouse End of function

mouse_decode:; Function begin
        push    ebp                                     ; 2C3A _ 55
        mov     ebp, esp                                ; 2C3B _ 89. E5
        sub     esp, 4                                  ; 2C3D _ 83. EC, 04
        mov     eax, dword [ebp+0CH]                    ; 2C40 _ 8B. 45, 0C
        mov     byte [ebp-4H], al                       ; 2C43 _ 88. 45, FC
        mov     eax, dword [ebp+8H]                     ; 2C46 _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 2C49 _ 0F B6. 40, 03
        test    al, al                                  ; 2C4D _ 84. C0
        jnz     ?_118                                   ; 2C4F _ 75, 17
        cmp     byte [ebp-4H], -6                       ; 2C51 _ 80. 7D, FC, FA
        jnz     ?_117                                   ; 2C55 _ 75, 07
        mov     eax, dword [ebp+8H]                     ; 2C57 _ 8B. 45, 08
        mov     byte [eax+3H], 1                        ; 2C5A _ C6. 40, 03, 01
?_117:  mov     eax, 0                                  ; 2C5E _ B8, 00000000
        jmp     ?_125                                   ; 2C63 _ E9, 0000010F

?_118:  mov     eax, dword [ebp+8H]                     ; 2C68 _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 2C6B _ 0F B6. 40, 03
        cmp     al, 1                                   ; 2C6F _ 3C, 01
        jnz     ?_120                                   ; 2C71 _ 75, 28
        movzx   eax, byte [ebp-4H]                      ; 2C73 _ 0F B6. 45, FC
        and     eax, 0C8H                               ; 2C77 _ 25, 000000C8
        cmp     eax, 8                                  ; 2C7C _ 83. F8, 08
        jnz     ?_119                                   ; 2C7F _ 75, 10
        mov     eax, dword [ebp+8H]                     ; 2C81 _ 8B. 45, 08
        movzx   edx, byte [ebp-4H]                      ; 2C84 _ 0F B6. 55, FC
        mov     byte [eax], dl                          ; 2C88 _ 88. 10
        mov     eax, dword [ebp+8H]                     ; 2C8A _ 8B. 45, 08
        mov     byte [eax+3H], 2                        ; 2C8D _ C6. 40, 03, 02
?_119:  mov     eax, 0                                  ; 2C91 _ B8, 00000000
        jmp     ?_125                                   ; 2C96 _ E9, 000000DC

?_120:  mov     eax, dword [ebp+8H]                     ; 2C9B _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 2C9E _ 0F B6. 40, 03
        cmp     al, 2                                   ; 2CA2 _ 3C, 02
        jnz     ?_121                                   ; 2CA4 _ 75, 1B
        mov     eax, dword [ebp+8H]                     ; 2CA6 _ 8B. 45, 08
        movzx   edx, byte [ebp-4H]                      ; 2CA9 _ 0F B6. 55, FC
        mov     byte [eax+1H], dl                       ; 2CAD _ 88. 50, 01
        mov     eax, dword [ebp+8H]                     ; 2CB0 _ 8B. 45, 08
        mov     byte [eax+3H], 3                        ; 2CB3 _ C6. 40, 03, 03
        mov     eax, 0                                  ; 2CB7 _ B8, 00000000
        jmp     ?_125                                   ; 2CBC _ E9, 000000B6

?_121:  mov     eax, dword [ebp+8H]                     ; 2CC1 _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 2CC4 _ 0F B6. 40, 03
        cmp     al, 3                                   ; 2CC8 _ 3C, 03
        jne     ?_124                                   ; 2CCA _ 0F 85, 000000A2
        mov     eax, dword [ebp+8H]                     ; 2CD0 _ 8B. 45, 08
        movzx   edx, byte [ebp-4H]                      ; 2CD3 _ 0F B6. 55, FC
        mov     byte [eax+2H], dl                       ; 2CD7 _ 88. 50, 02
        mov     eax, dword [ebp+8H]                     ; 2CDA _ 8B. 45, 08
        mov     byte [eax+3H], 1                        ; 2CDD _ C6. 40, 03, 01
        mov     eax, dword [ebp+8H]                     ; 2CE1 _ 8B. 45, 08
        movzx   eax, byte [eax]                         ; 2CE4 _ 0F B6. 00
        movzx   eax, al                                 ; 2CE7 _ 0F B6. C0
        and     eax, 07H                                ; 2CEA _ 83. E0, 07
        mov     edx, eax                                ; 2CED _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 2CEF _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 2CF2 _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 2CF5 _ 8B. 45, 08
        movzx   eax, byte [eax+1H]                      ; 2CF8 _ 0F B6. 40, 01
        movzx   edx, al                                 ; 2CFC _ 0F B6. D0
        mov     eax, dword [ebp+8H]                     ; 2CFF _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 2D02 _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 2D05 _ 8B. 45, 08
        movzx   eax, byte [eax+2H]                      ; 2D08 _ 0F B6. 40, 02
        movzx   edx, al                                 ; 2D0C _ 0F B6. D0
        mov     eax, dword [ebp+8H]                     ; 2D0F _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 2D12 _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 2D15 _ 8B. 45, 08
        movzx   eax, byte [eax]                         ; 2D18 _ 0F B6. 00
        movzx   eax, al                                 ; 2D1B _ 0F B6. C0
        and     eax, 10H                                ; 2D1E _ 83. E0, 10
        test    eax, eax                                ; 2D21 _ 85. C0
        jz      ?_122                                   ; 2D23 _ 74, 13
        mov     eax, dword [ebp+8H]                     ; 2D25 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 2D28 _ 8B. 40, 04
        or      eax, 0FFFFFF00H                         ; 2D2B _ 0D, FFFFFF00
        mov     edx, eax                                ; 2D30 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 2D32 _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 2D35 _ 89. 50, 04
?_122:  mov     eax, dword [ebp+8H]                     ; 2D38 _ 8B. 45, 08
        movzx   eax, byte [eax]                         ; 2D3B _ 0F B6. 00
        movzx   eax, al                                 ; 2D3E _ 0F B6. C0
        and     eax, 20H                                ; 2D41 _ 83. E0, 20
        test    eax, eax                                ; 2D44 _ 85. C0
        jz      ?_123                                   ; 2D46 _ 74, 13
        mov     eax, dword [ebp+8H]                     ; 2D48 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 2D4B _ 8B. 40, 08
        or      eax, 0FFFFFF00H                         ; 2D4E _ 0D, FFFFFF00
        mov     edx, eax                                ; 2D53 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 2D55 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 2D58 _ 89. 50, 08
?_123:  mov     eax, dword [ebp+8H]                     ; 2D5B _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 2D5E _ 8B. 40, 08
        neg     eax                                     ; 2D61 _ F7. D8
        mov     edx, eax                                ; 2D63 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 2D65 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 2D68 _ 89. 50, 08
        mov     eax, 1                                  ; 2D6B _ B8, 00000001
        jmp     ?_125                                   ; 2D70 _ EB, 05

?_124:  mov     eax, 4294967295                         ; 2D72 _ B8, FFFFFFFF
?_125:  leave                                           ; 2D77 _ C9
        ret                                             ; 2D78 _ C3
; mouse_decode End of function

intHandlerKeyboard:; Function begin
        push    ebp                                     ; 2D79 _ 55
        mov     ebp, esp                                ; 2D7A _ 89. E5
        sub     esp, 40                                 ; 2D7C _ 83. EC, 28
        mov     dword [esp+4H], 32                      ; 2D7F _ C7. 44 24, 04, 00000020
        mov     dword [esp], 32                         ; 2D87 _ C7. 04 24, 00000020
        call    io_out8                                 ; 2D8E _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 32                      ; 2D93 _ C7. 44 24, 04, 00000020
        mov     dword [esp], 160                        ; 2D9B _ C7. 04 24, 000000A0
        call    io_out8                                 ; 2DA2 _ E8, FFFFFFFC(rel)
        mov     dword [esp], 96                         ; 2DA7 _ C7. 04 24, 00000060
        call    io_in8                                  ; 2DAE _ E8, FFFFFFFC(rel)
        mov     byte [ebp-9H], al                       ; 2DB3 _ 88. 45, F7
        movzx   eax, byte [ebp-9H]                      ; 2DB6 _ 0F B6. 45, F7
        mov     dword [esp+4H], eax                     ; 2DBA _ 89. 44 24, 04
        mov     dword [esp], keyinfo                    ; 2DBE _ C7. 04 24, 00000000(d)
        call    fifo8_put                               ; 2DC5 _ E8, FFFFFFFC(rel)
        leave                                           ; 2DCA _ C9
        ret                                             ; 2DCB _ C3
; intHandlerKeyboard End of function

intHandlerMouse:; Function begin
        push    ebp                                     ; 2DCC _ 55
        mov     ebp, esp                                ; 2DCD _ 89. E5
        sub     esp, 40                                 ; 2DCF _ 83. EC, 28
        mov     dword [esp+4H], 32                      ; 2DD2 _ C7. 44 24, 04, 00000020
        mov     dword [esp], 32                         ; 2DDA _ C7. 04 24, 00000020
        call    io_out8                                 ; 2DE1 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 32                      ; 2DE6 _ C7. 44 24, 04, 00000020
        mov     dword [esp], 160                        ; 2DEE _ C7. 04 24, 000000A0
        call    io_out8                                 ; 2DF5 _ E8, FFFFFFFC(rel)
        mov     dword [esp], 96                         ; 2DFA _ C7. 04 24, 00000060
        call    io_in8                                  ; 2E01 _ E8, FFFFFFFC(rel)
        mov     byte [ebp-9H], al                       ; 2E06 _ 88. 45, F7
        movzx   eax, byte [ebp-9H]                      ; 2E09 _ 0F B6. 45, F7
        mov     dword [esp+4H], eax                     ; 2E0D _ 89. 44 24, 04
        mov     dword [esp], mouseinfo                  ; 2E11 _ C7. 04 24, 00000000(d)
        call    fifo8_put                               ; 2E18 _ E8, FFFFFFFC(rel)
        leave                                           ; 2E1D _ C9
        ret                                             ; 2E1E _ C3
; intHandlerMouse End of function

fifo8_init:; Function begin
        push    ebp                                     ; 2E1F _ 55
        mov     ebp, esp                                ; 2E20 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 2E22 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 2E25 _ 8B. 55, 10
        mov     dword [eax], edx                        ; 2E28 _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 2E2A _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 2E2D _ C7. 40, 04, 00000000
        mov     eax, dword [ebp+8H]                     ; 2E34 _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 2E37 _ C7. 40, 08, 00000000
        mov     eax, dword [ebp+8H]                     ; 2E3E _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 2E41 _ 8B. 55, 0C
        mov     dword [eax+0CH], edx                    ; 2E44 _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 2E47 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 2E4A _ 8B. 55, 0C
        mov     dword [eax+10H], edx                    ; 2E4D _ 89. 50, 10
        mov     eax, dword [ebp+8H]                     ; 2E50 _ 8B. 45, 08
        mov     dword [eax+14H], 0                      ; 2E53 _ C7. 40, 14, 00000000
        mov     eax, dword [ebp+8H]                     ; 2E5A _ 8B. 45, 08
        mov     edx, dword [ebp+14H]                    ; 2E5D _ 8B. 55, 14
        mov     dword [eax+18H], edx                    ; 2E60 _ 89. 50, 18
        pop     ebp                                     ; 2E63 _ 5D
        ret                                             ; 2E64 _ C3
; fifo8_init End of function

fifo8_put:; Function begin
        push    ebp                                     ; 2E65 _ 55
        mov     ebp, esp                                ; 2E66 _ 89. E5
        sub     esp, 40                                 ; 2E68 _ 83. EC, 28
        mov     eax, dword [ebp+0CH]                    ; 2E6B _ 8B. 45, 0C
        mov     byte [ebp-1CH], al                      ; 2E6E _ 88. 45, E4
        cmp     dword [ebp+8H], 0                       ; 2E71 _ 83. 7D, 08, 00
        jnz     ?_126                                   ; 2E75 _ 75, 0A
        mov     eax, 4294967295                         ; 2E77 _ B8, FFFFFFFF
        jmp     ?_130                                   ; 2E7C _ E9, 000000B1

?_126:  mov     eax, dword [ebp+8H]                     ; 2E81 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 2E84 _ 8B. 40, 10
        test    eax, eax                                ; 2E87 _ 85. C0
        jnz     ?_127                                   ; 2E89 _ 75, 1B
        mov     eax, dword [ebp+8H]                     ; 2E8B _ 8B. 45, 08
        mov     eax, dword [eax+14H]                    ; 2E8E _ 8B. 40, 14
        or      eax, 01H                                ; 2E91 _ 83. C8, 01
        mov     edx, eax                                ; 2E94 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 2E96 _ 8B. 45, 08
        mov     dword [eax+14H], edx                    ; 2E99 _ 89. 50, 14
        mov     eax, 4294967295                         ; 2E9C _ B8, FFFFFFFF
        jmp     ?_130                                   ; 2EA1 _ E9, 0000008C

?_127:  mov     eax, dword [ebp+8H]                     ; 2EA6 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 2EA9 _ 8B. 40, 04
        mov     dword [ebp-0CH], eax                    ; 2EAC _ 89. 45, F4
        mov     eax, dword [ebp+8H]                     ; 2EAF _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 2EB2 _ 8B. 10
        mov     eax, dword [ebp-0CH]                    ; 2EB4 _ 8B. 45, F4
        add     edx, eax                                ; 2EB7 _ 01. C2
        movzx   eax, byte [ebp-1CH]                     ; 2EB9 _ 0F B6. 45, E4
        mov     byte [edx], al                          ; 2EBD _ 88. 02
        mov     eax, dword [ebp+8H]                     ; 2EBF _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 2EC2 _ 8B. 40, 04
        lea     edx, [eax+1H]                           ; 2EC5 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 2EC8 _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 2ECB _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 2ECE _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 2ED1 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 2ED4 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 2ED7 _ 8B. 40, 0C
        cmp     edx, eax                                ; 2EDA _ 39. C2
        jnz     ?_128                                   ; 2EDC _ 75, 0A
        mov     eax, dword [ebp+8H]                     ; 2EDE _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 2EE1 _ C7. 40, 04, 00000000
?_128:  mov     eax, dword [ebp+8H]                     ; 2EE8 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 2EEB _ 8B. 40, 10
        lea     edx, [eax-1H]                           ; 2EEE _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 2EF1 _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 2EF4 _ 89. 50, 10
        mov     eax, dword [ebp+8H]                     ; 2EF7 _ 8B. 45, 08
        mov     eax, dword [eax+18H]                    ; 2EFA _ 8B. 40, 18
        test    eax, eax                                ; 2EFD _ 85. C0
        jz      ?_129                                   ; 2EFF _ 74, 2C
        mov     eax, dword [ebp+8H]                     ; 2F01 _ 8B. 45, 08
        mov     eax, dword [eax+18H]                    ; 2F04 _ 8B. 40, 18
        mov     eax, dword [eax+4H]                     ; 2F07 _ 8B. 40, 04
        cmp     eax, 2                                  ; 2F0A _ 83. F8, 02
        jz      ?_129                                   ; 2F0D _ 74, 1E
        mov     eax, dword [ebp+8H]                     ; 2F0F _ 8B. 45, 08
        mov     eax, dword [eax+18H]                    ; 2F12 _ 8B. 40, 18
        mov     dword [esp+8H], 0                       ; 2F15 _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], -1                      ; 2F1D _ C7. 44 24, 04, FFFFFFFF
        mov     dword [esp], eax                        ; 2F25 _ 89. 04 24
        call    task_run                                ; 2F28 _ E8, FFFFFFFC(rel)
?_129:  mov     eax, 0                                  ; 2F2D _ B8, 00000000
?_130:  leave                                           ; 2F32 _ C9
        ret                                             ; 2F33 _ C3
; fifo8_put End of function

fifo8_get:; Function begin
        push    ebp                                     ; 2F34 _ 55
        mov     ebp, esp                                ; 2F35 _ 89. E5
        sub     esp, 16                                 ; 2F37 _ 83. EC, 10
        mov     eax, dword [ebp+8H]                     ; 2F3A _ 8B. 45, 08
        mov     edx, dword [eax+10H]                    ; 2F3D _ 8B. 50, 10
        mov     eax, dword [ebp+8H]                     ; 2F40 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 2F43 _ 8B. 40, 0C
        cmp     edx, eax                                ; 2F46 _ 39. C2
        jnz     ?_131                                   ; 2F48 _ 75, 11
        mov     eax, dword [ebp+8H]                     ; 2F4A _ 8B. 45, 08
        mov     dword [eax+14H], 0                      ; 2F4D _ C7. 40, 14, 00000000
        mov     eax, 4294967295                         ; 2F54 _ B8, FFFFFFFF
        jmp     ?_133                                   ; 2F59 _ EB, 57

?_131:  mov     eax, dword [ebp+8H]                     ; 2F5B _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 2F5E _ 8B. 40, 08
        mov     dword [ebp-8H], eax                     ; 2F61 _ 89. 45, F8
        mov     eax, dword [ebp+8H]                     ; 2F64 _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 2F67 _ 8B. 10
        mov     eax, dword [ebp-8H]                     ; 2F69 _ 8B. 45, F8
        add     eax, edx                                ; 2F6C _ 01. D0
        movzx   eax, byte [eax]                         ; 2F6E _ 0F B6. 00
        movzx   eax, al                                 ; 2F71 _ 0F B6. C0
        mov     dword [ebp-4H], eax                     ; 2F74 _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 2F77 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 2F7A _ 8B. 40, 08
        lea     edx, [eax+1H]                           ; 2F7D _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 2F80 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 2F83 _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 2F86 _ 8B. 45, 08
        mov     edx, dword [eax+8H]                     ; 2F89 _ 8B. 50, 08
        mov     eax, dword [ebp+8H]                     ; 2F8C _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 2F8F _ 8B. 40, 0C
        cmp     edx, eax                                ; 2F92 _ 39. C2
        jnz     ?_132                                   ; 2F94 _ 75, 0A
        mov     eax, dword [ebp+8H]                     ; 2F96 _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 2F99 _ C7. 40, 08, 00000000
?_132:  mov     eax, dword [ebp+8H]                     ; 2FA0 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 2FA3 _ 8B. 40, 10
        lea     edx, [eax+1H]                           ; 2FA6 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 2FA9 _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 2FAC _ 89. 50, 10
        mov     eax, dword [ebp-4H]                     ; 2FAF _ 8B. 45, FC
?_133:  leave                                           ; 2FB2 _ C9
        ret                                             ; 2FB3 _ C3
; fifo8_get End of function

fifo8_status:; Function begin
        push    ebp                                     ; 2FB4 _ 55
        mov     ebp, esp                                ; 2FB5 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 2FB7 _ 8B. 45, 08
        mov     edx, dword [eax+0CH]                    ; 2FBA _ 8B. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 2FBD _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 2FC0 _ 8B. 40, 10
        sub     edx, eax                                ; 2FC3 _ 29. C2
        mov     eax, edx                                ; 2FC5 _ 89. D0
        pop     ebp                                     ; 2FC7 _ 5D
        ret                                             ; 2FC8 _ C3
; fifo8_status End of function

charToHexVal:; Function begin
        push    ebp                                     ; 2FC9 _ 55
        mov     ebp, esp                                ; 2FCA _ 89. E5
        sub     esp, 4                                  ; 2FCC _ 83. EC, 04
        mov     eax, dword [ebp+8H]                     ; 2FCF _ 8B. 45, 08
        mov     byte [ebp-4H], al                       ; 2FD2 _ 88. 45, FC
        cmp     byte [ebp-4H], 9                        ; 2FD5 _ 80. 7D, FC, 09
        jle     ?_134                                   ; 2FD9 _ 7E, 09
        movzx   eax, byte [ebp-4H]                      ; 2FDB _ 0F B6. 45, FC
        add     eax, 55                                 ; 2FDF _ 83. C0, 37
        jmp     ?_135                                   ; 2FE2 _ EB, 07

?_134:  movzx   eax, byte [ebp-4H]                      ; 2FE4 _ 0F B6. 45, FC
        add     eax, 48                                 ; 2FE8 _ 83. C0, 30
?_135:  leave                                           ; 2FEB _ C9
        ret                                             ; 2FEC _ C3
; charToHexVal End of function

charToHexStr:; Function begin
        push    ebp                                     ; 2FED _ 55
        mov     ebp, esp                                ; 2FEE _ 89. E5
        sub     esp, 24                                 ; 2FF0 _ 83. EC, 18
        mov     eax, dword [ebp+8H]                     ; 2FF3 _ 8B. 45, 08
        mov     byte [ebp-14H], al                      ; 2FF6 _ 88. 45, EC
        mov     dword [ebp-4H], 0                       ; 2FF9 _ C7. 45, FC, 00000000
        movzx   eax, byte [ebp-14H]                     ; 3000 _ 0F B6. 45, EC
        and     eax, 0FH                                ; 3004 _ 83. E0, 0F
        mov     byte [ebp-5H], al                       ; 3007 _ 88. 45, FB
        movsx   eax, byte [ebp-5H]                      ; 300A _ 0F BE. 45, FB
        mov     dword [esp], eax                        ; 300E _ 89. 04 24
        call    charToHexVal                            ; 3011 _ E8, FFFFFFFC(rel)
        mov     byte [?_273], al                        ; 3016 _ A2, 00000343(d)
        movzx   eax, byte [ebp-14H]                     ; 301B _ 0F B6. 45, EC
        shr     al, 4                                   ; 301F _ C0. E8, 04
        mov     byte [ebp-14H], al                      ; 3022 _ 88. 45, EC
        movzx   eax, byte [ebp-14H]                     ; 3025 _ 0F B6. 45, EC
        movsx   eax, al                                 ; 3029 _ 0F BE. C0
        mov     dword [esp], eax                        ; 302C _ 89. 04 24
        call    charToHexVal                            ; 302F _ E8, FFFFFFFC(rel)
        mov     byte [?_272], al                        ; 3034 _ A2, 00000342(d)
        mov     eax, keyval                             ; 3039 _ B8, 00000340(d)
        leave                                           ; 303E _ C9
        ret                                             ; 303F _ C3
; charToHexStr End of function

intToHexStr:; Function begin
        push    ebp                                     ; 3040 _ 55
        mov     ebp, esp                                ; 3041 _ 89. E5
        sub     esp, 16                                 ; 3043 _ 83. EC, 10
        mov     byte [str.1386], 48                     ; 3046 _ C6. 05, 000002E0(d), 30
        mov     byte [?_276], 88                        ; 304D _ C6. 05, 000002E1(d), 58
        mov     byte [?_277], 0                         ; 3054 _ C6. 05, 000002EA(d), 00
        mov     dword [ebp-0CH], 2                      ; 305B _ C7. 45, F4, 00000002
        jmp     ?_137                                   ; 3062 _ EB, 0F

?_136:  mov     eax, dword [ebp-0CH]                    ; 3064 _ 8B. 45, F4
        add     eax, str.1386                           ; 3067 _ 05, 000002E0(d)
        mov     byte [eax], 48                          ; 306C _ C6. 00, 30
        add     dword [ebp-0CH], 1                      ; 306F _ 83. 45, F4, 01
?_137:  cmp     dword [ebp-0CH], 9                      ; 3073 _ 83. 7D, F4, 09
        jle     ?_136                                   ; 3077 _ 7E, EB
        mov     dword [ebp-8H], 9                       ; 3079 _ C7. 45, F8, 00000009
        jmp     ?_141                                   ; 3080 _ EB, 40

?_138:  mov     eax, dword [ebp+8H]                     ; 3082 _ 8B. 45, 08
        and     eax, 0FH                                ; 3085 _ 83. E0, 0F
        mov     dword [ebp-4H], eax                     ; 3088 _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 308B _ 8B. 45, 08
        shr     eax, 4                                  ; 308E _ C1. E8, 04
        mov     dword [ebp+8H], eax                     ; 3091 _ 89. 45, 08
        cmp     dword [ebp-4H], 9                       ; 3094 _ 83. 7D, FC, 09
        jle     ?_139                                   ; 3098 _ 7E, 13
        mov     eax, dword [ebp-4H]                     ; 309A _ 8B. 45, FC
        add     eax, 55                                 ; 309D _ 83. C0, 37
        mov     edx, dword [ebp-8H]                     ; 30A0 _ 8B. 55, F8
        add     edx, str.1386                           ; 30A3 _ 81. C2, 000002E0(d)
        mov     byte [edx], al                          ; 30A9 _ 88. 02
        jmp     ?_140                                   ; 30AB _ EB, 11

?_139:  mov     eax, dword [ebp-4H]                     ; 30AD _ 8B. 45, FC
        add     eax, 48                                 ; 30B0 _ 83. C0, 30
        mov     edx, dword [ebp-8H]                     ; 30B3 _ 8B. 55, F8
        add     edx, str.1386                           ; 30B6 _ 81. C2, 000002E0(d)
        mov     byte [edx], al                          ; 30BC _ 88. 02
?_140:  sub     dword [ebp-8H], 1                       ; 30BE _ 83. 6D, F8, 01
?_141:  cmp     dword [ebp-8H], 1                       ; 30C2 _ 83. 7D, F8, 01
        jle     ?_142                                   ; 30C6 _ 7E, 06
        cmp     dword [ebp+8H], 0                       ; 30C8 _ 83. 7D, 08, 00
        jnz     ?_138                                   ; 30CC _ 75, B4
?_142:  mov     eax, str.1386                           ; 30CE _ B8, 000002E0(d)
        leave                                           ; 30D3 _ C9
        ret                                             ; 30D4 _ C3
; intToHexStr End of function

memman_init:; Function begin
        push    ebp                                     ; 30D5 _ 55
        mov     ebp, esp                                ; 30D6 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 30D8 _ 8B. 45, 08
        mov     dword [eax], 0                          ; 30DB _ C7. 00, 00000000
        mov     eax, dword [ebp+8H]                     ; 30E1 _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 30E4 _ C7. 40, 04, 00000000
        mov     eax, dword [ebp+8H]                     ; 30EB _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 30EE _ C7. 40, 08, 00000000
        mov     eax, dword [ebp+8H]                     ; 30F5 _ 8B. 45, 08
        mov     dword [eax+0CH], 0                      ; 30F8 _ C7. 40, 0C, 00000000
        pop     ebp                                     ; 30FF _ 5D
        ret                                             ; 3100 _ C3
; memman_init End of function

memman_total:; Function begin
        push    ebp                                     ; 3101 _ 55
        mov     ebp, esp                                ; 3102 _ 89. E5
        sub     esp, 16                                 ; 3104 _ 83. EC, 10
        mov     dword [ebp-4H], 0                       ; 3107 _ C7. 45, FC, 00000000
        mov     dword [ebp-8H], 0                       ; 310E _ C7. 45, F8, 00000000
        jmp     ?_144                                   ; 3115 _ EB, 14

?_143:  mov     eax, dword [ebp+8H]                     ; 3117 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 311A _ 8B. 55, F8
        add     edx, 2                                  ; 311D _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 3120 _ 8B. 44 D0, 04
        add     dword [ebp-4H], eax                     ; 3124 _ 01. 45, FC
        add     dword [ebp-8H], 1                       ; 3127 _ 83. 45, F8, 01
?_144:  mov     eax, dword [ebp+8H]                     ; 312B _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 312E _ 8B. 00
        cmp     eax, dword [ebp-8H]                     ; 3130 _ 3B. 45, F8
        ja      ?_143                                   ; 3133 _ 77, E2
        mov     eax, dword [ebp-4H]                     ; 3135 _ 8B. 45, FC
        leave                                           ; 3138 _ C9
        ret                                             ; 3139 _ C3
; memman_total End of function

memman_alloc:; Function begin
        push    ebp                                     ; 313A _ 55
        mov     ebp, esp                                ; 313B _ 89. E5
        sub     esp, 16                                 ; 313D _ 83. EC, 10
        mov     dword [ebp-8H], 0                       ; 3140 _ C7. 45, F8, 00000000
        jmp     ?_148                                   ; 3147 _ E9, 00000085

?_145:  mov     eax, dword [ebp+8H]                     ; 314C _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 314F _ 8B. 55, F8
        add     edx, 2                                  ; 3152 _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 3155 _ 8B. 44 D0, 04
        cmp     eax, dword [ebp+0CH]                    ; 3159 _ 3B. 45, 0C
        jc      ?_147                                   ; 315C _ 72, 6F
        mov     eax, dword [ebp+8H]                     ; 315E _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 3161 _ 8B. 55, F8
        add     edx, 2                                  ; 3164 _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 3167 _ 8B. 04 D0
        mov     dword [ebp-4H], eax                     ; 316A _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 316D _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 3170 _ 8B. 55, F8
        add     edx, 2                                  ; 3173 _ 83. C2, 02
        mov     edx, dword [eax+edx*8]                  ; 3176 _ 8B. 14 D0
        mov     eax, dword [ebp+0CH]                    ; 3179 _ 8B. 45, 0C
        lea     ecx, [edx+eax]                          ; 317C _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 317F _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 3182 _ 8B. 55, F8
        add     edx, 2                                  ; 3185 _ 83. C2, 02
        mov     dword [eax+edx*8], ecx                  ; 3188 _ 89. 0C D0
        mov     eax, dword [ebp+8H]                     ; 318B _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 318E _ 8B. 55, F8
        add     edx, 2                                  ; 3191 _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 3194 _ 8B. 44 D0, 04
        sub     eax, dword [ebp+0CH]                    ; 3198 _ 2B. 45, 0C
        mov     edx, eax                                ; 319B _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 319D _ 8B. 45, 08
        mov     ecx, dword [ebp-8H]                     ; 31A0 _ 8B. 4D, F8
        add     ecx, 2                                  ; 31A3 _ 83. C1, 02
        mov     dword [eax+ecx*8+4H], edx               ; 31A6 _ 89. 54 C8, 04
        mov     eax, dword [ebp+8H]                     ; 31AA _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 31AD _ 8B. 55, F8
        add     edx, 2                                  ; 31B0 _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 31B3 _ 8B. 44 D0, 04
        test    eax, eax                                ; 31B7 _ 85. C0
        jnz     ?_146                                   ; 31B9 _ 75, 0D
        mov     eax, dword [ebp+8H]                     ; 31BB _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 31BE _ 8B. 00
        lea     edx, [eax-1H]                           ; 31C0 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 31C3 _ 8B. 45, 08
        mov     dword [eax], edx                        ; 31C6 _ 89. 10
?_146:  mov     eax, dword [ebp-4H]                     ; 31C8 _ 8B. 45, FC
        jmp     ?_149                                   ; 31CB _ EB, 17

?_147:  add     dword [ebp-8H], 1                       ; 31CD _ 83. 45, F8, 01
?_148:  mov     eax, dword [ebp+8H]                     ; 31D1 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 31D4 _ 8B. 00
        cmp     eax, dword [ebp-8H]                     ; 31D6 _ 3B. 45, F8
        ja      ?_145                                   ; 31D9 _ 0F 87, FFFFFF6D
        mov     eax, 0                                  ; 31DF _ B8, 00000000
?_149:  leave                                           ; 31E4 _ C9
        ret                                             ; 31E5 _ C3
; memman_alloc End of function

memman_free:; Function begin
        push    ebp                                     ; 31E6 _ 55
        mov     ebp, esp                                ; 31E7 _ 89. E5
        push    ebx                                     ; 31E9 _ 53
        sub     esp, 16                                 ; 31EA _ 83. EC, 10
        mov     dword [ebp-0CH], 0                      ; 31ED _ C7. 45, F4, 00000000
        jmp     ?_152                                   ; 31F4 _ EB, 17

?_150:  mov     eax, dword [ebp+8H]                     ; 31F6 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 31F9 _ 8B. 55, F4
        add     edx, 2                                  ; 31FC _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 31FF _ 8B. 04 D0
        cmp     eax, dword [ebp+0CH]                    ; 3202 _ 3B. 45, 0C
        jbe     ?_151                                   ; 3205 _ 76, 02
        jmp     ?_153                                   ; 3207 _ EB, 0E

?_151:  add     dword [ebp-0CH], 1                      ; 3209 _ 83. 45, F4, 01
?_152:  mov     eax, dword [ebp+8H]                     ; 320D _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 3210 _ 8B. 00
        cmp     eax, dword [ebp-0CH]                    ; 3212 _ 3B. 45, F4
        jg      ?_150                                   ; 3215 _ 7F, DF
?_153:  cmp     dword [ebp-0CH], 0                      ; 3217 _ 83. 7D, F4, 00
        jle     ?_155                                   ; 321B _ 0F 8E, 000000BA
        mov     eax, dword [ebp-0CH]                    ; 3221 _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 3224 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 3227 _ 8B. 45, 08
        add     edx, 2                                  ; 322A _ 83. C2, 02
        mov     edx, dword [eax+edx*8]                  ; 322D _ 8B. 14 D0
        mov     eax, dword [ebp-0CH]                    ; 3230 _ 8B. 45, F4
        lea     ecx, [eax-1H]                           ; 3233 _ 8D. 48, FF
        mov     eax, dword [ebp+8H]                     ; 3236 _ 8B. 45, 08
        add     ecx, 2                                  ; 3239 _ 83. C1, 02
        mov     eax, dword [eax+ecx*8+4H]               ; 323C _ 8B. 44 C8, 04
        add     eax, edx                                ; 3240 _ 01. D0
        cmp     eax, dword [ebp+0CH]                    ; 3242 _ 3B. 45, 0C
        jne     ?_155                                   ; 3245 _ 0F 85, 00000090
        mov     eax, dword [ebp-0CH]                    ; 324B _ 8B. 45, F4
        lea     ebx, [eax-1H]                           ; 324E _ 8D. 58, FF
        mov     eax, dword [ebp-0CH]                    ; 3251 _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 3254 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 3257 _ 8B. 45, 08
        add     edx, 2                                  ; 325A _ 83. C2, 02
        mov     edx, dword [eax+edx*8+4H]               ; 325D _ 8B. 54 D0, 04
        mov     eax, dword [ebp+10H]                    ; 3261 _ 8B. 45, 10
        lea     ecx, [edx+eax]                          ; 3264 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 3267 _ 8B. 45, 08
        lea     edx, [ebx+2H]                           ; 326A _ 8D. 53, 02
        mov     dword [eax+edx*8+4H], ecx               ; 326D _ 89. 4C D0, 04
        mov     eax, dword [ebp+8H]                     ; 3271 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 3274 _ 8B. 00
        cmp     eax, dword [ebp-0CH]                    ; 3276 _ 3B. 45, F4
        jle     ?_154                                   ; 3279 _ 7E, 56
        mov     eax, dword [ebp+10H]                    ; 327B _ 8B. 45, 10
        mov     edx, dword [ebp+0CH]                    ; 327E _ 8B. 55, 0C
        lea     ecx, [edx+eax]                          ; 3281 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 3284 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 3287 _ 8B. 55, F4
        add     edx, 2                                  ; 328A _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 328D _ 8B. 04 D0
        cmp     ecx, eax                                ; 3290 _ 39. C1
        jnz     ?_154                                   ; 3292 _ 75, 3D
        mov     eax, dword [ebp-0CH]                    ; 3294 _ 8B. 45, F4
        lea     ebx, [eax-1H]                           ; 3297 _ 8D. 58, FF
        mov     eax, dword [ebp-0CH]                    ; 329A _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 329D _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 32A0 _ 8B. 45, 08
        add     edx, 2                                  ; 32A3 _ 83. C2, 02
        mov     edx, dword [eax+edx*8+4H]               ; 32A6 _ 8B. 54 D0, 04
        mov     eax, dword [ebp+8H]                     ; 32AA _ 8B. 45, 08
        mov     ecx, dword [ebp-0CH]                    ; 32AD _ 8B. 4D, F4
        add     ecx, 2                                  ; 32B0 _ 83. C1, 02
        mov     eax, dword [eax+ecx*8+4H]               ; 32B3 _ 8B. 44 C8, 04
        lea     ecx, [edx+eax]                          ; 32B7 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 32BA _ 8B. 45, 08
        lea     edx, [ebx+2H]                           ; 32BD _ 8D. 53, 02
        mov     dword [eax+edx*8+4H], ecx               ; 32C0 _ 89. 4C D0, 04
        mov     eax, dword [ebp+8H]                     ; 32C4 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 32C7 _ 8B. 00
        lea     edx, [eax-1H]                           ; 32C9 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 32CC _ 8B. 45, 08
        mov     dword [eax], edx                        ; 32CF _ 89. 10
?_154:  mov     eax, 0                                  ; 32D1 _ B8, 00000000
        jmp     ?_161                                   ; 32D6 _ E9, 0000011C

?_155:  mov     eax, dword [ebp+8H]                     ; 32DB _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 32DE _ 8B. 00
        cmp     eax, dword [ebp-0CH]                    ; 32E0 _ 3B. 45, F4
        jle     ?_156                                   ; 32E3 _ 7E, 52
        mov     eax, dword [ebp+10H]                    ; 32E5 _ 8B. 45, 10
        mov     edx, dword [ebp+0CH]                    ; 32E8 _ 8B. 55, 0C
        lea     ecx, [edx+eax]                          ; 32EB _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 32EE _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 32F1 _ 8B. 55, F4
        add     edx, 2                                  ; 32F4 _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 32F7 _ 8B. 04 D0
        cmp     ecx, eax                                ; 32FA _ 39. C1
        jnz     ?_156                                   ; 32FC _ 75, 39
        mov     eax, dword [ebp+8H]                     ; 32FE _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 3301 _ 8B. 55, F4
        lea     ecx, [edx+2H]                           ; 3304 _ 8D. 4A, 02
        mov     edx, dword [ebp+0CH]                    ; 3307 _ 8B. 55, 0C
        mov     dword [eax+ecx*8], edx                  ; 330A _ 89. 14 C8
        mov     eax, dword [ebp+8H]                     ; 330D _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 3310 _ 8B. 55, F4
        add     edx, 2                                  ; 3313 _ 83. C2, 02
        mov     edx, dword [eax+edx*8+4H]               ; 3316 _ 8B. 54 D0, 04
        mov     eax, dword [ebp+10H]                    ; 331A _ 8B. 45, 10
        lea     ecx, [edx+eax]                          ; 331D _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 3320 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 3323 _ 8B. 55, F4
        add     edx, 2                                  ; 3326 _ 83. C2, 02
        mov     dword [eax+edx*8+4H], ecx               ; 3329 _ 89. 4C D0, 04
        mov     eax, 0                                  ; 332D _ B8, 00000000
        jmp     ?_161                                   ; 3332 _ E9, 000000C0

?_156:  mov     eax, dword [ebp+8H]                     ; 3337 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 333A _ 8B. 00
        cmp     eax, 4095                               ; 333C _ 3D, 00000FFF
        jg      ?_160                                   ; 3341 _ 0F 8F, 00000087
        mov     eax, dword [ebp+8H]                     ; 3347 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 334A _ 8B. 00
        mov     dword [ebp-8H], eax                     ; 334C _ 89. 45, F8
        jmp     ?_158                                   ; 334F _ EB, 28

?_157:  mov     eax, dword [ebp-8H]                     ; 3351 _ 8B. 45, F8
        lea     edx, [eax-1H]                           ; 3354 _ 8D. 50, FF
        mov     ecx, dword [ebp+8H]                     ; 3357 _ 8B. 4D, 08
        mov     eax, dword [ebp-8H]                     ; 335A _ 8B. 45, F8
        lea     ebx, [eax+2H]                           ; 335D _ 8D. 58, 02
        mov     eax, dword [ebp+8H]                     ; 3360 _ 8B. 45, 08
        add     edx, 2                                  ; 3363 _ 83. C2, 02
        lea     edx, [eax+edx*8]                        ; 3366 _ 8D. 14 D0
        mov     eax, dword [edx]                        ; 3369 _ 8B. 02
        mov     edx, dword [edx+4H]                     ; 336B _ 8B. 52, 04
        mov     dword [ecx+ebx*8], eax                  ; 336E _ 89. 04 D9
        mov     dword [ecx+ebx*8+4H], edx               ; 3371 _ 89. 54 D9, 04
        sub     dword [ebp-8H], 1                       ; 3375 _ 83. 6D, F8, 01
?_158:  mov     eax, dword [ebp-8H]                     ; 3379 _ 8B. 45, F8
        cmp     eax, dword [ebp-0CH]                    ; 337C _ 3B. 45, F4
        jg      ?_157                                   ; 337F _ 7F, D0
        mov     eax, dword [ebp+8H]                     ; 3381 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 3384 _ 8B. 00
        lea     edx, [eax+1H]                           ; 3386 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 3389 _ 8B. 45, 08
        mov     dword [eax], edx                        ; 338C _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 338E _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 3391 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 3394 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 3397 _ 8B. 00
        cmp     edx, eax                                ; 3399 _ 39. C2
        jge     ?_159                                   ; 339B _ 7D, 0B
        mov     eax, dword [ebp+8H]                     ; 339D _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 33A0 _ 8B. 10
        mov     eax, dword [ebp+8H]                     ; 33A2 _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 33A5 _ 89. 50, 04
?_159:  mov     eax, dword [ebp+8H]                     ; 33A8 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 33AB _ 8B. 55, F4
        lea     ecx, [edx+2H]                           ; 33AE _ 8D. 4A, 02
        mov     edx, dword [ebp+0CH]                    ; 33B1 _ 8B. 55, 0C
        mov     dword [eax+ecx*8], edx                  ; 33B4 _ 89. 14 C8
        mov     eax, dword [ebp+8H]                     ; 33B7 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 33BA _ 8B. 55, F4
        lea     ecx, [edx+2H]                           ; 33BD _ 8D. 4A, 02
        mov     edx, dword [ebp+10H]                    ; 33C0 _ 8B. 55, 10
        mov     dword [eax+ecx*8+4H], edx               ; 33C3 _ 89. 54 C8, 04
        mov     eax, 0                                  ; 33C7 _ B8, 00000000
        jmp     ?_161                                   ; 33CC _ EB, 29

?_160:  mov     eax, dword [ebp+8H]                     ; 33CE _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 33D1 _ 8B. 40, 0C
        lea     edx, [eax+1H]                           ; 33D4 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 33D7 _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 33DA _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 33DD _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 33E0 _ 8B. 40, 08
        mov     edx, eax                                ; 33E3 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 33E5 _ 8B. 45, 10
        add     eax, edx                                ; 33E8 _ 01. D0
        mov     edx, eax                                ; 33EA _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 33EC _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 33EF _ 89. 50, 08
        mov     eax, 4294967295                         ; 33F2 _ B8, FFFFFFFF
?_161:  add     esp, 16                                 ; 33F7 _ 83. C4, 10
        pop     ebx                                     ; 33FA _ 5B
        pop     ebp                                     ; 33FB _ 5D
        ret                                             ; 33FC _ C3
; memman_free End of function

memman_alloc_4k:; Function begin
        push    ebp                                     ; 33FD _ 55
        mov     ebp, esp                                ; 33FE _ 89. E5
        sub     esp, 24                                 ; 3400 _ 83. EC, 18
        mov     eax, dword [ebp+0CH]                    ; 3403 _ 8B. 45, 0C
        add     eax, 4095                               ; 3406 _ 05, 00000FFF
        and     eax, 0FFFFF000H                         ; 340B _ 25, FFFFF000
        mov     dword [ebp+0CH], eax                    ; 3410 _ 89. 45, 0C
        mov     eax, dword [ebp+0CH]                    ; 3413 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 3416 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 341A _ 8B. 45, 08
        mov     dword [esp], eax                        ; 341D _ 89. 04 24
        call    memman_alloc                            ; 3420 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-4H], eax                     ; 3425 _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 3428 _ 8B. 45, FC
        leave                                           ; 342B _ C9
        ret                                             ; 342C _ C3
; memman_alloc_4k End of function

memman_free_4k:; Function begin
        push    ebp                                     ; 342D _ 55
        mov     ebp, esp                                ; 342E _ 89. E5
        sub     esp, 28                                 ; 3430 _ 83. EC, 1C
        mov     eax, dword [ebp+10H]                    ; 3433 _ 8B. 45, 10
        add     eax, 4095                               ; 3436 _ 05, 00000FFF
        and     eax, 0FFFFF000H                         ; 343B _ 25, FFFFF000
        mov     dword [ebp+10H], eax                    ; 3440 _ 89. 45, 10
        mov     eax, dword [ebp+10H]                    ; 3443 _ 8B. 45, 10
        mov     dword [esp+8H], eax                     ; 3446 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 344A _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 344D _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 3451 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3454 _ 89. 04 24
        call    memman_free                             ; 3457 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-4H], eax                     ; 345C _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 345F _ 8B. 45, FC
        leave                                           ; 3462 _ C9
        ret                                             ; 3463 _ C3
; memman_free_4k End of function

sheet_control_init:; Function begin
        push    ebp                                     ; 3464 _ 55
        mov     ebp, esp                                ; 3465 _ 89. E5
        sub     esp, 40                                 ; 3467 _ 83. EC, 28
        mov     dword [esp+4H], 9236                    ; 346A _ C7. 44 24, 04, 00002414
        mov     eax, dword [ebp+8H]                     ; 3472 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3475 _ 89. 04 24
        call    memman_alloc_4k                         ; 3478 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 347D _ 89. 45, F4
        cmp     dword [ebp-0CH], 0                      ; 3480 _ 83. 7D, F4, 00
        jnz     ?_162                                   ; 3484 _ 75, 24
        mov     eax, dword [ebp-0CH]                    ; 3486 _ 8B. 45, F4
        mov     dword [esp+8H], 9236                    ; 3489 _ C7. 44 24, 08, 00002414
        mov     dword [esp+4H], eax                     ; 3491 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 3495 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3498 _ 89. 04 24
        call    memman_free_4k                          ; 349B _ E8, FFFFFFFC(rel)
        mov     eax, 0                                  ; 34A0 _ B8, 00000000
        jmp     ?_166                                   ; 34A5 _ E9, 0000009D

?_162:  mov     eax, dword [ebp-0CH]                    ; 34AA _ 8B. 45, F4
        mov     edx, dword [ebp+0CH]                    ; 34AD _ 8B. 55, 0C
        mov     dword [eax], edx                        ; 34B0 _ 89. 10
        mov     eax, dword [ebp-0CH]                    ; 34B2 _ 8B. 45, F4
        mov     edx, dword [ebp+10H]                    ; 34B5 _ 8B. 55, 10
        mov     dword [eax+4H], edx                     ; 34B8 _ 89. 50, 04
        mov     eax, dword [ebp-0CH]                    ; 34BB _ 8B. 45, F4
        mov     edx, dword [ebp+14H]                    ; 34BE _ 8B. 55, 14
        mov     dword [eax+8H], edx                     ; 34C1 _ 89. 50, 08
        mov     eax, dword [ebp-0CH]                    ; 34C4 _ 8B. 45, F4
        mov     dword [eax+0CH], -1                     ; 34C7 _ C7. 40, 0C, FFFFFFFF
        mov     dword [ebp-10H], 0                      ; 34CE _ C7. 45, F0, 00000000
        jmp     ?_164                                   ; 34D5 _ EB, 1B

?_163:  mov     eax, dword [ebp-0CH]                    ; 34D7 _ 8B. 45, F4
        mov     edx, dword [ebp-10H]                    ; 34DA _ 8B. 55, F0
        add     edx, 33                                 ; 34DD _ 83. C2, 21
        shl     edx, 5                                  ; 34E0 _ C1. E2, 05
        add     eax, edx                                ; 34E3 _ 01. D0
        add     eax, 16                                 ; 34E5 _ 83. C0, 10
        mov     dword [eax], 0                          ; 34E8 _ C7. 00, 00000000
        add     dword [ebp-10H], 1                      ; 34EE _ 83. 45, F0, 01
?_164:  cmp     dword [ebp-10H], 255                    ; 34F2 _ 81. 7D, F0, 000000FF
        jle     ?_163                                   ; 34F9 _ 7E, DC
        mov     eax, dword [ebp+10H]                    ; 34FB _ 8B. 45, 10
        imul    eax, dword [ebp+14H]                    ; 34FE _ 0F AF. 45, 14
        mov     dword [esp+4H], eax                     ; 3502 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 3506 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3509 _ 89. 04 24
        call    memman_alloc_4k                         ; 350C _ E8, FFFFFFFC(rel)
        mov     edx, eax                                ; 3511 _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 3513 _ 8B. 45, F4
        mov     dword [eax+10H], edx                    ; 3516 _ 89. 50, 10
        mov     eax, dword [ebp-0CH]                    ; 3519 _ 8B. 45, F4
        mov     eax, dword [eax+10H]                    ; 351C _ 8B. 40, 10
        test    eax, eax                                ; 351F _ 85. C0
        jnz     ?_165                                   ; 3521 _ 75, 21
        mov     eax, dword [ebp-0CH]                    ; 3523 _ 8B. 45, F4
        mov     dword [esp+8H], 9236                    ; 3526 _ C7. 44 24, 08, 00002414
        mov     dword [esp+4H], eax                     ; 352E _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 3532 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3535 _ 89. 04 24
        call    memman_free_4k                          ; 3538 _ E8, FFFFFFFC(rel)
        mov     eax, 0                                  ; 353D _ B8, 00000000
        jmp     ?_166                                   ; 3542 _ EB, 03

?_165:  mov     eax, dword [ebp-0CH]                    ; 3544 _ 8B. 45, F4
?_166:  leave                                           ; 3547 _ C9
        ret                                             ; 3548 _ C3
; sheet_control_init End of function

sheet_alloc:; Function begin
        push    ebp                                     ; 3549 _ 55
        mov     ebp, esp                                ; 354A _ 89. E5
        sub     esp, 16                                 ; 354C _ 83. EC, 10
        mov     dword [ebp-8H], 0                       ; 354F _ C7. 45, F8, 00000000
        jmp     ?_169                                   ; 3556 _ EB, 5B

?_167:  mov     eax, dword [ebp+8H]                     ; 3558 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 355B _ 8B. 55, F8
        add     edx, 33                                 ; 355E _ 83. C2, 21
        shl     edx, 5                                  ; 3561 _ C1. E2, 05
        add     eax, edx                                ; 3564 _ 01. D0
        add     eax, 16                                 ; 3566 _ 83. C0, 10
        mov     eax, dword [eax]                        ; 3569 _ 8B. 00
        test    eax, eax                                ; 356B _ 85. C0
        jnz     ?_168                                   ; 356D _ 75, 40
        mov     eax, dword [ebp-8H]                     ; 356F _ 8B. 45, F8
        shl     eax, 5                                  ; 3572 _ C1. E0, 05
        lea     edx, [eax+410H]                         ; 3575 _ 8D. 90, 00000410
        mov     eax, dword [ebp+8H]                     ; 357B _ 8B. 45, 08
        add     eax, edx                                ; 357E _ 01. D0
        add     eax, 4                                  ; 3580 _ 83. C0, 04
        mov     dword [ebp-4H], eax                     ; 3583 _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 3586 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 3589 _ 8B. 55, F8
        lea     ecx, [edx+4H]                           ; 358C _ 8D. 4A, 04
        mov     edx, dword [ebp-4H]                     ; 358F _ 8B. 55, FC
        mov     dword [eax+ecx*4+4H], edx               ; 3592 _ 89. 54 88, 04
        mov     eax, dword [ebp-4H]                     ; 3596 _ 8B. 45, FC
        mov     dword [eax+1CH], 1                      ; 3599 _ C7. 40, 1C, 00000001
        mov     eax, dword [ebp-4H]                     ; 35A0 _ 8B. 45, FC
        mov     dword [eax+18H], -1                     ; 35A3 _ C7. 40, 18, FFFFFFFF
        mov     eax, dword [ebp-4H]                     ; 35AA _ 8B. 45, FC
        jmp     ?_170                                   ; 35AD _ EB, 12

?_168:  add     dword [ebp-8H], 1                       ; 35AF _ 83. 45, F8, 01
?_169:  cmp     dword [ebp-8H], 255                     ; 35B3 _ 81. 7D, F8, 000000FF
        jle     ?_167                                   ; 35BA _ 7E, 9C
        mov     eax, 0                                  ; 35BC _ B8, 00000000
?_170:  leave                                           ; 35C1 _ C9
        ret                                             ; 35C2 _ C3
; sheet_alloc End of function

sheet_setbuf:; Function begin
        push    ebp                                     ; 35C3 _ 55
        mov     ebp, esp                                ; 35C4 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 35C6 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 35C9 _ 8B. 55, 0C
        mov     dword [eax], edx                        ; 35CC _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 35CE _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 35D1 _ 8B. 55, 10
        mov     dword [eax+4H], edx                     ; 35D4 _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 35D7 _ 8B. 45, 08
        mov     edx, dword [ebp+14H]                    ; 35DA _ 8B. 55, 14
        mov     dword [eax+8H], edx                     ; 35DD _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 35E0 _ 8B. 45, 08
        mov     edx, dword [ebp+18H]                    ; 35E3 _ 8B. 55, 18
        mov     dword [eax+14H], edx                    ; 35E6 _ 89. 50, 14
        pop     ebp                                     ; 35E9 _ 5D
        ret                                             ; 35EA _ C3
; sheet_setbuf End of function

sheet_updown:; Function begin
        push    ebp                                     ; 35EB _ 55
        mov     ebp, esp                                ; 35EC _ 89. E5
        push    esi                                     ; 35EE _ 56
        push    ebx                                     ; 35EF _ 53
        sub     esp, 48                                 ; 35F0 _ 83. EC, 30
        mov     eax, dword [ebp+0CH]                    ; 35F3 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 35F6 _ 8B. 40, 18
        mov     dword [ebp-0CH], eax                    ; 35F9 _ 89. 45, F4
        mov     eax, dword [ebp+8H]                     ; 35FC _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 35FF _ 8B. 40, 0C
        add     eax, 1                                  ; 3602 _ 83. C0, 01
        cmp     eax, dword [ebp+10H]                    ; 3605 _ 3B. 45, 10
        jge     ?_171                                   ; 3608 _ 7D, 0C
        mov     eax, dword [ebp+8H]                     ; 360A _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 360D _ 8B. 40, 0C
        add     eax, 1                                  ; 3610 _ 83. C0, 01
        mov     dword [ebp+10H], eax                    ; 3613 _ 89. 45, 10
?_171:  cmp     dword [ebp+10H], -1                     ; 3616 _ 83. 7D, 10, FF
        jge     ?_172                                   ; 361A _ 7D, 07
        mov     dword [ebp+10H], -1                     ; 361C _ C7. 45, 10, FFFFFFFF
?_172:  mov     eax, dword [ebp+0CH]                    ; 3623 _ 8B. 45, 0C
        mov     edx, dword [ebp+10H]                    ; 3626 _ 8B. 55, 10
        mov     dword [eax+18H], edx                    ; 3629 _ 89. 50, 18
        mov     eax, dword [ebp-0CH]                    ; 362C _ 8B. 45, F4
        cmp     eax, dword [ebp+10H]                    ; 362F _ 3B. 45, 10
        jle     ?_179                                   ; 3632 _ 0F 8E, 00000201
        cmp     dword [ebp+10H], 0                      ; 3638 _ 83. 7D, 10, 00
        js      ?_175                                   ; 363C _ 0F 88, 000000F7
        mov     eax, dword [ebp-0CH]                    ; 3642 _ 8B. 45, F4
        mov     dword [ebp-10H], eax                    ; 3645 _ 89. 45, F0
        jmp     ?_174                                   ; 3648 _ EB, 34

?_173:  mov     eax, dword [ebp-10H]                    ; 364A _ 8B. 45, F0
        lea     edx, [eax-1H]                           ; 364D _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 3650 _ 8B. 45, 08
        add     edx, 4                                  ; 3653 _ 83. C2, 04
        mov     edx, dword [eax+edx*4+4H]               ; 3656 _ 8B. 54 90, 04
        mov     eax, dword [ebp+8H]                     ; 365A _ 8B. 45, 08
        mov     ecx, dword [ebp-10H]                    ; 365D _ 8B. 4D, F0
        add     ecx, 4                                  ; 3660 _ 83. C1, 04
        mov     dword [eax+ecx*4+4H], edx               ; 3663 _ 89. 54 88, 04
        mov     eax, dword [ebp+8H]                     ; 3667 _ 8B. 45, 08
        mov     edx, dword [ebp-10H]                    ; 366A _ 8B. 55, F0
        add     edx, 4                                  ; 366D _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 3670 _ 8B. 44 90, 04
        mov     edx, dword [ebp-10H]                    ; 3674 _ 8B. 55, F0
        mov     dword [eax+18H], edx                    ; 3677 _ 89. 50, 18
        sub     dword [ebp-10H], 1                      ; 367A _ 83. 6D, F0, 01
?_174:  mov     eax, dword [ebp-10H]                    ; 367E _ 8B. 45, F0
        cmp     eax, dword [ebp+10H]                    ; 3681 _ 3B. 45, 10
        jg      ?_173                                   ; 3684 _ 7F, C4
        mov     eax, dword [ebp+8H]                     ; 3686 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 3689 _ 8B. 55, 10
        lea     ecx, [edx+4H]                           ; 368C _ 8D. 4A, 04
        mov     edx, dword [ebp+0CH]                    ; 368F _ 8B. 55, 0C
        mov     dword [eax+ecx*4+4H], edx               ; 3692 _ 89. 54 88, 04
        mov     eax, dword [ebp+10H]                    ; 3696 _ 8B. 45, 10
        lea     esi, [eax+1H]                           ; 3699 _ 8D. 70, 01
        mov     eax, dword [ebp+0CH]                    ; 369C _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 369F _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 36A2 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 36A5 _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 36A8 _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 36AB _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 36AE _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 36B1 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 36B4 _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 36B7 _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 36BA _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 36BD _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 36C0 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 36C3 _ 8B. 40, 0C
        mov     dword [esp+14H], esi                    ; 36C6 _ 89. 74 24, 14
        mov     dword [esp+10H], ebx                    ; 36CA _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 36CE _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 36D2 _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 36D6 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 36DA _ 8B. 45, 08
        mov     dword [esp], eax                        ; 36DD _ 89. 04 24
        call    sheet_refresh_map                       ; 36E0 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 36E5 _ 8B. 45, 10
        lea     esi, [eax+1H]                           ; 36E8 _ 8D. 70, 01
        mov     eax, dword [ebp+0CH]                    ; 36EB _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 36EE _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 36F1 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 36F4 _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 36F7 _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 36FA _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 36FD _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 3700 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 3703 _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 3706 _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 3709 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 370C _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 370F _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 3712 _ 8B. 40, 0C
        mov     dword [esp+14H], esi                    ; 3715 _ 89. 74 24, 14
        mov     dword [esp+10H], ebx                    ; 3719 _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 371D _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 3721 _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 3725 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 3729 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 372C _ 89. 04 24
        call    sheet_refresh_local                     ; 372F _ E8, FFFFFFFC(rel)
        jmp     ?_186                                   ; 3734 _ E9, 0000026C

?_175:  mov     eax, dword [ebp+8H]                     ; 3739 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 373C _ 8B. 40, 0C
        cmp     eax, dword [ebp-0CH]                    ; 373F _ 3B. 45, F4
        jle     ?_178                                   ; 3742 _ 7E, 47
        mov     eax, dword [ebp-0CH]                    ; 3744 _ 8B. 45, F4
        mov     dword [ebp-10H], eax                    ; 3747 _ 89. 45, F0
        jmp     ?_177                                   ; 374A _ EB, 34

?_176:  mov     eax, dword [ebp-10H]                    ; 374C _ 8B. 45, F0
        lea     edx, [eax+1H]                           ; 374F _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 3752 _ 8B. 45, 08
        add     edx, 4                                  ; 3755 _ 83. C2, 04
        mov     edx, dword [eax+edx*4+4H]               ; 3758 _ 8B. 54 90, 04
        mov     eax, dword [ebp+8H]                     ; 375C _ 8B. 45, 08
        mov     ecx, dword [ebp-10H]                    ; 375F _ 8B. 4D, F0
        add     ecx, 4                                  ; 3762 _ 83. C1, 04
        mov     dword [eax+ecx*4+4H], edx               ; 3765 _ 89. 54 88, 04
        mov     eax, dword [ebp+8H]                     ; 3769 _ 8B. 45, 08
        mov     edx, dword [ebp-10H]                    ; 376C _ 8B. 55, F0
        add     edx, 4                                  ; 376F _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 3772 _ 8B. 44 90, 04
        mov     edx, dword [ebp-10H]                    ; 3776 _ 8B. 55, F0
        mov     dword [eax+18H], edx                    ; 3779 _ 89. 50, 18
        add     dword [ebp-10H], 1                      ; 377C _ 83. 45, F0, 01
?_177:  mov     eax, dword [ebp+8H]                     ; 3780 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 3783 _ 8B. 40, 0C
        cmp     eax, dword [ebp-10H]                    ; 3786 _ 3B. 45, F0
        jg      ?_176                                   ; 3789 _ 7F, C1
?_178:  mov     eax, dword [ebp+8H]                     ; 378B _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 378E _ 8B. 40, 0C
        lea     edx, [eax-1H]                           ; 3791 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 3794 _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 3797 _ 89. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 379A _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 379D _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 37A0 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 37A3 _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 37A6 _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 37A9 _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 37AC _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 37AF _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 37B2 _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 37B5 _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 37B8 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 37BB _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 37BE _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 37C1 _ 8B. 40, 0C
        mov     dword [esp+14H], 0                      ; 37C4 _ C7. 44 24, 14, 00000000
        mov     dword [esp+10H], ebx                    ; 37CC _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 37D0 _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 37D4 _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 37D8 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 37DC _ 8B. 45, 08
        mov     dword [esp], eax                        ; 37DF _ 89. 04 24
        call    sheet_refresh_map                       ; 37E2 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+0CH]                    ; 37E7 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 37EA _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 37ED _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 37F0 _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 37F3 _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 37F6 _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 37F9 _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 37FC _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 37FF _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 3802 _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 3805 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 3808 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 380B _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 380E _ 8B. 40, 0C
        mov     dword [esp+14H], 0                      ; 3811 _ C7. 44 24, 14, 00000000
        mov     dword [esp+10H], ebx                    ; 3819 _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 381D _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 3821 _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 3825 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 3829 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 382C _ 89. 04 24
        call    sheet_refresh_local                     ; 382F _ E8, FFFFFFFC(rel)
        jmp     ?_186                                   ; 3834 _ E9, 0000016C

?_179:  mov     eax, dword [ebp-0CH]                    ; 3839 _ 8B. 45, F4
        cmp     eax, dword [ebp+10H]                    ; 383C _ 3B. 45, 10
        jge     ?_186                                   ; 383F _ 0F 8D, 00000160
        cmp     dword [ebp-0CH], 0                      ; 3845 _ 83. 7D, F4, 00
        js      ?_182                                   ; 3849 _ 78, 56
        mov     eax, dword [ebp-0CH]                    ; 384B _ 8B. 45, F4
        mov     dword [ebp-10H], eax                    ; 384E _ 89. 45, F0
        jmp     ?_181                                   ; 3851 _ EB, 34

?_180:  mov     eax, dword [ebp-10H]                    ; 3853 _ 8B. 45, F0
        lea     edx, [eax+1H]                           ; 3856 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 3859 _ 8B. 45, 08
        add     edx, 4                                  ; 385C _ 83. C2, 04
        mov     edx, dword [eax+edx*4+4H]               ; 385F _ 8B. 54 90, 04
        mov     eax, dword [ebp+8H]                     ; 3863 _ 8B. 45, 08
        mov     ecx, dword [ebp-10H]                    ; 3866 _ 8B. 4D, F0
        add     ecx, 4                                  ; 3869 _ 83. C1, 04
        mov     dword [eax+ecx*4+4H], edx               ; 386C _ 89. 54 88, 04
        mov     eax, dword [ebp+8H]                     ; 3870 _ 8B. 45, 08
        mov     edx, dword [ebp-10H]                    ; 3873 _ 8B. 55, F0
        add     edx, 4                                  ; 3876 _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 3879 _ 8B. 44 90, 04
        mov     edx, dword [ebp-10H]                    ; 387D _ 8B. 55, F0
        mov     dword [eax+18H], edx                    ; 3880 _ 89. 50, 18
        add     dword [ebp-10H], 1                      ; 3883 _ 83. 45, F0, 01
?_181:  mov     eax, dword [ebp-10H]                    ; 3887 _ 8B. 45, F0
        cmp     eax, dword [ebp+10H]                    ; 388A _ 3B. 45, 10
        jl      ?_180                                   ; 388D _ 7C, C4
        mov     eax, dword [ebp+8H]                     ; 388F _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 3892 _ 8B. 55, 10
        lea     ecx, [edx+4H]                           ; 3895 _ 8D. 4A, 04
        mov     edx, dword [ebp+0CH]                    ; 3898 _ 8B. 55, 0C
        mov     dword [eax+ecx*4+4H], edx               ; 389B _ 89. 54 88, 04
        jmp     ?_185                                   ; 389F _ EB, 6C

?_182:  mov     eax, dword [ebp+8H]                     ; 38A1 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 38A4 _ 8B. 40, 0C
        mov     dword [ebp-10H], eax                    ; 38A7 _ 89. 45, F0
        jmp     ?_184                                   ; 38AA _ EB, 3A

?_183:  mov     eax, dword [ebp-10H]                    ; 38AC _ 8B. 45, F0
        lea     ecx, [eax+1H]                           ; 38AF _ 8D. 48, 01
        mov     eax, dword [ebp+8H]                     ; 38B2 _ 8B. 45, 08
        mov     edx, dword [ebp-10H]                    ; 38B5 _ 8B. 55, F0
        add     edx, 4                                  ; 38B8 _ 83. C2, 04
        mov     edx, dword [eax+edx*4+4H]               ; 38BB _ 8B. 54 90, 04
        mov     eax, dword [ebp+8H]                     ; 38BF _ 8B. 45, 08
        add     ecx, 4                                  ; 38C2 _ 83. C1, 04
        mov     dword [eax+ecx*4+4H], edx               ; 38C5 _ 89. 54 88, 04
        mov     eax, dword [ebp-10H]                    ; 38C9 _ 8B. 45, F0
        lea     edx, [eax+1H]                           ; 38CC _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 38CF _ 8B. 45, 08
        add     edx, 4                                  ; 38D2 _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 38D5 _ 8B. 44 90, 04
        mov     edx, dword [ebp-10H]                    ; 38D9 _ 8B. 55, F0
        add     edx, 1                                  ; 38DC _ 83. C2, 01
        mov     dword [eax+18H], edx                    ; 38DF _ 89. 50, 18
        sub     dword [ebp-10H], 1                      ; 38E2 _ 83. 6D, F0, 01
?_184:  mov     eax, dword [ebp-10H]                    ; 38E6 _ 8B. 45, F0
        cmp     eax, dword [ebp+10H]                    ; 38E9 _ 3B. 45, 10
        jge     ?_183                                   ; 38EC _ 7D, BE
        mov     eax, dword [ebp+8H]                     ; 38EE _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 38F1 _ 8B. 55, 10
        lea     ecx, [edx+4H]                           ; 38F4 _ 8D. 4A, 04
        mov     edx, dword [ebp+0CH]                    ; 38F7 _ 8B. 55, 0C
        mov     dword [eax+ecx*4+4H], edx               ; 38FA _ 89. 54 88, 04
        mov     eax, dword [ebp+8H]                     ; 38FE _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 3901 _ 8B. 40, 0C
        lea     edx, [eax+1H]                           ; 3904 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 3907 _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 390A _ 89. 50, 0C
?_185:  mov     eax, dword [ebp+0CH]                    ; 390D _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 3910 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 3913 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 3916 _ 8B. 40, 08
        lea     esi, [edx+eax]                          ; 3919 _ 8D. 34 02
        mov     eax, dword [ebp+0CH]                    ; 391C _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 391F _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 3922 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 3925 _ 8B. 40, 04
        lea     ebx, [edx+eax]                          ; 3928 _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 392B _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 392E _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 3931 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 3934 _ 8B. 40, 0C
        mov     ecx, dword [ebp+10H]                    ; 3937 _ 8B. 4D, 10
        mov     dword [esp+14H], ecx                    ; 393A _ 89. 4C 24, 14
        mov     dword [esp+10H], esi                    ; 393E _ 89. 74 24, 10
        mov     dword [esp+0CH], ebx                    ; 3942 _ 89. 5C 24, 0C
        mov     dword [esp+8H], edx                     ; 3946 _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 394A _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 394E _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3951 _ 89. 04 24
        call    sheet_refresh_map                       ; 3954 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+0CH]                    ; 3959 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 395C _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 395F _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 3962 _ 8B. 40, 08
        lea     esi, [edx+eax]                          ; 3965 _ 8D. 34 02
        mov     eax, dword [ebp+0CH]                    ; 3968 _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 396B _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 396E _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 3971 _ 8B. 40, 04
        lea     ebx, [edx+eax]                          ; 3974 _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 3977 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 397A _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 397D _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 3980 _ 8B. 40, 0C
        mov     ecx, dword [ebp+10H]                    ; 3983 _ 8B. 4D, 10
        mov     dword [esp+14H], ecx                    ; 3986 _ 89. 4C 24, 14
        mov     dword [esp+10H], esi                    ; 398A _ 89. 74 24, 10
        mov     dword [esp+0CH], ebx                    ; 398E _ 89. 5C 24, 0C
        mov     dword [esp+8H], edx                     ; 3992 _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 3996 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 399A _ 8B. 45, 08
        mov     dword [esp], eax                        ; 399D _ 89. 04 24
        call    sheet_refresh_local                     ; 39A0 _ E8, FFFFFFFC(rel)
?_186:  add     esp, 48                                 ; 39A5 _ 83. C4, 30
        pop     ebx                                     ; 39A8 _ 5B
        pop     esi                                     ; 39A9 _ 5E
        pop     ebp                                     ; 39AA _ 5D
        ret                                             ; 39AB _ C3
; sheet_updown End of function

sheet_refresh:; Function begin
        push    ebp                                     ; 39AC _ 55
        mov     ebp, esp                                ; 39AD _ 89. E5
        push    edi                                     ; 39AF _ 57
        push    esi                                     ; 39B0 _ 56
        push    ebx                                     ; 39B1 _ 53
        sub     esp, 44                                 ; 39B2 _ 83. EC, 2C
        mov     eax, dword [ebp+0CH]                    ; 39B5 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 39B8 _ 8B. 40, 18
        test    eax, eax                                ; 39BB _ 85. C0
        js      ?_187                                   ; 39BD _ 78, 53
        mov     eax, dword [ebp+0CH]                    ; 39BF _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 39C2 _ 8B. 40, 18
        mov     edx, dword [ebp+0CH]                    ; 39C5 _ 8B. 55, 0C
        mov     ecx, dword [edx+10H]                    ; 39C8 _ 8B. 4A, 10
        mov     edx, dword [ebp+1CH]                    ; 39CB _ 8B. 55, 1C
        lea     esi, [ecx+edx]                          ; 39CE _ 8D. 34 11
        mov     edx, dword [ebp+0CH]                    ; 39D1 _ 8B. 55, 0C
        mov     ecx, dword [edx+0CH]                    ; 39D4 _ 8B. 4A, 0C
        mov     edx, dword [ebp+18H]                    ; 39D7 _ 8B. 55, 18
        lea     ebx, [ecx+edx]                          ; 39DA _ 8D. 1C 11
        mov     edx, dword [ebp+0CH]                    ; 39DD _ 8B. 55, 0C
        mov     ecx, dword [edx+10H]                    ; 39E0 _ 8B. 4A, 10
        mov     edx, dword [ebp+14H]                    ; 39E3 _ 8B. 55, 14
        add     ecx, edx                                ; 39E6 _ 01. D1
        mov     edx, dword [ebp+0CH]                    ; 39E8 _ 8B. 55, 0C
        mov     edi, dword [edx+0CH]                    ; 39EB _ 8B. 7A, 0C
        mov     edx, dword [ebp+10H]                    ; 39EE _ 8B. 55, 10
        add     edx, edi                                ; 39F1 _ 01. FA
        mov     dword [esp+14H], eax                    ; 39F3 _ 89. 44 24, 14
        mov     dword [esp+10H], esi                    ; 39F7 _ 89. 74 24, 10
        mov     dword [esp+0CH], ebx                    ; 39FB _ 89. 5C 24, 0C
        mov     dword [esp+8H], ecx                     ; 39FF _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 3A03 _ 89. 54 24, 04
        mov     eax, dword [ebp+8H]                     ; 3A07 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3A0A _ 89. 04 24
        call    sheet_refresh_local                     ; 3A0D _ E8, FFFFFFFC(rel)
?_187:  mov     eax, 0                                  ; 3A12 _ B8, 00000000
        add     esp, 44                                 ; 3A17 _ 83. C4, 2C
        pop     ebx                                     ; 3A1A _ 5B
        pop     esi                                     ; 3A1B _ 5E
        pop     edi                                     ; 3A1C _ 5F
        pop     ebp                                     ; 3A1D _ 5D
        ret                                             ; 3A1E _ C3
; sheet_refresh End of function

sheet_slide:; Function begin
        push    ebp                                     ; 3A1F _ 55
        mov     ebp, esp                                ; 3A20 _ 89. E5
        push    ebx                                     ; 3A22 _ 53
        sub     esp, 52                                 ; 3A23 _ 83. EC, 34
        mov     eax, dword [ebp+0CH]                    ; 3A26 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 3A29 _ 8B. 40, 0C
        mov     dword [ebp-10H], eax                    ; 3A2C _ 89. 45, F0
        mov     eax, dword [ebp+0CH]                    ; 3A2F _ 8B. 45, 0C
        mov     eax, dword [eax+10H]                    ; 3A32 _ 8B. 40, 10
        mov     dword [ebp-0CH], eax                    ; 3A35 _ 89. 45, F4
        mov     eax, dword [ebp+0CH]                    ; 3A38 _ 8B. 45, 0C
        mov     edx, dword [ebp+10H]                    ; 3A3B _ 8B. 55, 10
        mov     dword [eax+0CH], edx                    ; 3A3E _ 89. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 3A41 _ 8B. 45, 0C
        mov     edx, dword [ebp+14H]                    ; 3A44 _ 8B. 55, 14
        mov     dword [eax+10H], edx                    ; 3A47 _ 89. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 3A4A _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 3A4D _ 8B. 40, 18
        test    eax, eax                                ; 3A50 _ 85. C0
        js      ?_188                                   ; 3A52 _ 0F 88, 00000100
        mov     eax, dword [ebp+0CH]                    ; 3A58 _ 8B. 45, 0C
        mov     edx, dword [eax+8H]                     ; 3A5B _ 8B. 50, 08
        mov     eax, dword [ebp-0CH]                    ; 3A5E _ 8B. 45, F4
        add     edx, eax                                ; 3A61 _ 01. C2
        mov     eax, dword [ebp+0CH]                    ; 3A63 _ 8B. 45, 0C
        mov     ecx, dword [eax+4H]                     ; 3A66 _ 8B. 48, 04
        mov     eax, dword [ebp-10H]                    ; 3A69 _ 8B. 45, F0
        add     eax, ecx                                ; 3A6C _ 01. C8
        mov     dword [esp+14H], 0                      ; 3A6E _ C7. 44 24, 14, 00000000
        mov     dword [esp+10H], edx                    ; 3A76 _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 3A7A _ 89. 44 24, 0C
        mov     eax, dword [ebp-0CH]                    ; 3A7E _ 8B. 45, F4
        mov     dword [esp+8H], eax                     ; 3A81 _ 89. 44 24, 08
        mov     eax, dword [ebp-10H]                    ; 3A85 _ 8B. 45, F0
        mov     dword [esp+4H], eax                     ; 3A88 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 3A8C _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3A8F _ 89. 04 24
        call    sheet_refresh_map                       ; 3A92 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+0CH]                    ; 3A97 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 3A9A _ 8B. 40, 18
        mov     edx, dword [ebp+0CH]                    ; 3A9D _ 8B. 55, 0C
        mov     ecx, dword [edx+8H]                     ; 3AA0 _ 8B. 4A, 08
        mov     edx, dword [ebp+14H]                    ; 3AA3 _ 8B. 55, 14
        add     ecx, edx                                ; 3AA6 _ 01. D1
        mov     edx, dword [ebp+0CH]                    ; 3AA8 _ 8B. 55, 0C
        mov     ebx, dword [edx+4H]                     ; 3AAB _ 8B. 5A, 04
        mov     edx, dword [ebp+10H]                    ; 3AAE _ 8B. 55, 10
        add     edx, ebx                                ; 3AB1 _ 01. DA
        mov     dword [esp+14H], eax                    ; 3AB3 _ 89. 44 24, 14
        mov     dword [esp+10H], ecx                    ; 3AB7 _ 89. 4C 24, 10
        mov     dword [esp+0CH], edx                    ; 3ABB _ 89. 54 24, 0C
        mov     eax, dword [ebp+14H]                    ; 3ABF _ 8B. 45, 14
        mov     dword [esp+8H], eax                     ; 3AC2 _ 89. 44 24, 08
        mov     eax, dword [ebp+10H]                    ; 3AC6 _ 8B. 45, 10
        mov     dword [esp+4H], eax                     ; 3AC9 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 3ACD _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3AD0 _ 89. 04 24
        call    sheet_refresh_map                       ; 3AD3 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+0CH]                    ; 3AD8 _ 8B. 45, 0C
        mov     edx, dword [eax+8H]                     ; 3ADB _ 8B. 50, 08
        mov     eax, dword [ebp-0CH]                    ; 3ADE _ 8B. 45, F4
        add     edx, eax                                ; 3AE1 _ 01. C2
        mov     eax, dword [ebp+0CH]                    ; 3AE3 _ 8B. 45, 0C
        mov     ecx, dword [eax+4H]                     ; 3AE6 _ 8B. 48, 04
        mov     eax, dword [ebp-10H]                    ; 3AE9 _ 8B. 45, F0
        add     eax, ecx                                ; 3AEC _ 01. C8
        mov     dword [esp+14H], 0                      ; 3AEE _ C7. 44 24, 14, 00000000
        mov     dword [esp+10H], edx                    ; 3AF6 _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 3AFA _ 89. 44 24, 0C
        mov     eax, dword [ebp-0CH]                    ; 3AFE _ 8B. 45, F4
        mov     dword [esp+8H], eax                     ; 3B01 _ 89. 44 24, 08
        mov     eax, dword [ebp-10H]                    ; 3B05 _ 8B. 45, F0
        mov     dword [esp+4H], eax                     ; 3B08 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 3B0C _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3B0F _ 89. 04 24
        call    sheet_refresh_local                     ; 3B12 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+0CH]                    ; 3B17 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 3B1A _ 8B. 40, 18
        mov     edx, dword [ebp+0CH]                    ; 3B1D _ 8B. 55, 0C
        mov     ecx, dword [edx+8H]                     ; 3B20 _ 8B. 4A, 08
        mov     edx, dword [ebp+14H]                    ; 3B23 _ 8B. 55, 14
        add     ecx, edx                                ; 3B26 _ 01. D1
        mov     edx, dword [ebp+0CH]                    ; 3B28 _ 8B. 55, 0C
        mov     ebx, dword [edx+4H]                     ; 3B2B _ 8B. 5A, 04
        mov     edx, dword [ebp+10H]                    ; 3B2E _ 8B. 55, 10
        add     edx, ebx                                ; 3B31 _ 01. DA
        mov     dword [esp+14H], eax                    ; 3B33 _ 89. 44 24, 14
        mov     dword [esp+10H], ecx                    ; 3B37 _ 89. 4C 24, 10
        mov     dword [esp+0CH], edx                    ; 3B3B _ 89. 54 24, 0C
        mov     eax, dword [ebp+14H]                    ; 3B3F _ 8B. 45, 14
        mov     dword [esp+8H], eax                     ; 3B42 _ 89. 44 24, 08
        mov     eax, dword [ebp+10H]                    ; 3B46 _ 8B. 45, 10
        mov     dword [esp+4H], eax                     ; 3B49 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 3B4D _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3B50 _ 89. 04 24
        call    sheet_refresh_local                     ; 3B53 _ E8, FFFFFFFC(rel)
?_188:  add     esp, 52                                 ; 3B58 _ 83. C4, 34
        pop     ebx                                     ; 3B5B _ 5B
        pop     ebp                                     ; 3B5C _ 5D
        ret                                             ; 3B5D _ C3
; sheet_slide End of function

sheet_refresh_local:; Function begin
        push    ebp                                     ; 3B5E _ 55
        mov     ebp, esp                                ; 3B5F _ 89. E5
        sub     esp, 48                                 ; 3B61 _ 83. EC, 30
        mov     eax, dword [ebp+8H]                     ; 3B64 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 3B67 _ 8B. 00
        mov     dword [ebp-18H], eax                    ; 3B69 _ 89. 45, E8
        mov     eax, dword [ebp+8H]                     ; 3B6C _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 3B6F _ 8B. 40, 10
        mov     dword [ebp-14H], eax                    ; 3B72 _ 89. 45, EC
        cmp     dword [ebp+0CH], 0                      ; 3B75 _ 83. 7D, 0C, 00
        jns     ?_189                                   ; 3B79 _ 79, 07
        mov     dword [ebp+0CH], 0                      ; 3B7B _ C7. 45, 0C, 00000000
?_189:  cmp     dword [ebp+10H], 0                      ; 3B82 _ 83. 7D, 10, 00
        jns     ?_190                                   ; 3B86 _ 79, 07
        mov     dword [ebp+10H], 0                      ; 3B88 _ C7. 45, 10, 00000000
?_190:  mov     eax, dword [ebp+8H]                     ; 3B8F _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 3B92 _ 8B. 40, 04
        cmp     eax, dword [ebp+14H]                    ; 3B95 _ 3B. 45, 14
        jge     ?_191                                   ; 3B98 _ 7D, 09
        mov     eax, dword [ebp+8H]                     ; 3B9A _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 3B9D _ 8B. 40, 04
        mov     dword [ebp+14H], eax                    ; 3BA0 _ 89. 45, 14
?_191:  mov     eax, dword [ebp+8H]                     ; 3BA3 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 3BA6 _ 8B. 40, 08
        cmp     eax, dword [ebp+18H]                    ; 3BA9 _ 3B. 45, 18
        jge     ?_192                                   ; 3BAC _ 7D, 09
        mov     eax, dword [ebp+8H]                     ; 3BAE _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 3BB1 _ 8B. 40, 08
        mov     dword [ebp+18H], eax                    ; 3BB4 _ 89. 45, 18
?_192:  mov     eax, dword [ebp+1CH]                    ; 3BB7 _ 8B. 45, 1C
        mov     dword [ebp-24H], eax                    ; 3BBA _ 89. 45, DC
        jmp     ?_199                                   ; 3BBD _ E9, 00000119

?_193:  mov     eax, dword [ebp+8H]                     ; 3BC2 _ 8B. 45, 08
        mov     edx, dword [ebp-24H]                    ; 3BC5 _ 8B. 55, DC
        add     edx, 4                                  ; 3BC8 _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 3BCB _ 8B. 44 90, 04
        mov     dword [ebp-10H], eax                    ; 3BCF _ 89. 45, F0
        mov     eax, dword [ebp-10H]                    ; 3BD2 _ 8B. 45, F0
        mov     eax, dword [eax]                        ; 3BD5 _ 8B. 00
        mov     dword [ebp-0CH], eax                    ; 3BD7 _ 89. 45, F4
        mov     edx, dword [ebp-10H]                    ; 3BDA _ 8B. 55, F0
        mov     eax, dword [ebp+8H]                     ; 3BDD _ 8B. 45, 08
        add     eax, 1044                               ; 3BE0 _ 05, 00000414
        sub     edx, eax                                ; 3BE5 _ 29. C2
        mov     eax, edx                                ; 3BE7 _ 89. D0
        sar     eax, 5                                  ; 3BE9 _ C1. F8, 05
        mov     byte [ebp-26H], al                      ; 3BEC _ 88. 45, DA
        mov     dword [ebp-1CH], 0                      ; 3BEF _ C7. 45, E4, 00000000
        jmp     ?_198                                   ; 3BF6 _ E9, 000000CD

?_194:  mov     eax, dword [ebp-10H]                    ; 3BFB _ 8B. 45, F0
        mov     edx, dword [eax+10H]                    ; 3BFE _ 8B. 50, 10
        mov     eax, dword [ebp-1CH]                    ; 3C01 _ 8B. 45, E4
        add     eax, edx                                ; 3C04 _ 01. D0
        mov     dword [ebp-8H], eax                     ; 3C06 _ 89. 45, F8
        mov     dword [ebp-20H], 0                      ; 3C09 _ C7. 45, E0, 00000000
        jmp     ?_197                                   ; 3C10 _ E9, 000000A0

?_195:  mov     eax, dword [ebp-10H]                    ; 3C15 _ 8B. 45, F0
        mov     edx, dword [eax+0CH]                    ; 3C18 _ 8B. 50, 0C
        mov     eax, dword [ebp-20H]                    ; 3C1B _ 8B. 45, E0
        add     eax, edx                                ; 3C1E _ 01. D0
        mov     dword [ebp-4H], eax                     ; 3C20 _ 89. 45, FC
        mov     eax, dword [ebp+0CH]                    ; 3C23 _ 8B. 45, 0C
        cmp     eax, dword [ebp-4H]                     ; 3C26 _ 3B. 45, FC
        jg      ?_196                                   ; 3C29 _ 0F 8F, 00000082
        mov     eax, dword [ebp-4H]                     ; 3C2F _ 8B. 45, FC
        cmp     eax, dword [ebp+14H]                    ; 3C32 _ 3B. 45, 14
        jge     ?_196                                   ; 3C35 _ 7D, 7A
        mov     eax, dword [ebp+10H]                    ; 3C37 _ 8B. 45, 10
        cmp     eax, dword [ebp-8H]                     ; 3C3A _ 3B. 45, F8
        jg      ?_196                                   ; 3C3D _ 7F, 72
        mov     eax, dword [ebp-8H]                     ; 3C3F _ 8B. 45, F8
        cmp     eax, dword [ebp+18H]                    ; 3C42 _ 3B. 45, 18
        jge     ?_196                                   ; 3C45 _ 7D, 6A
        mov     eax, dword [ebp-10H]                    ; 3C47 _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 3C4A _ 8B. 40, 04
        imul    eax, dword [ebp-1CH]                    ; 3C4D _ 0F AF. 45, E4
        mov     edx, eax                                ; 3C51 _ 89. C2
        mov     eax, dword [ebp-20H]                    ; 3C53 _ 8B. 45, E0
        add     eax, edx                                ; 3C56 _ 01. D0
        mov     edx, eax                                ; 3C58 _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 3C5A _ 8B. 45, F4
        add     eax, edx                                ; 3C5D _ 01. D0
        movzx   eax, byte [eax]                         ; 3C5F _ 0F B6. 00
        mov     byte [ebp-25H], al                      ; 3C62 _ 88. 45, DB
        movzx   edx, byte [ebp-25H]                     ; 3C65 _ 0F B6. 55, DB
        mov     eax, dword [ebp-10H]                    ; 3C69 _ 8B. 45, F0
        mov     eax, dword [eax+14H]                    ; 3C6C _ 8B. 40, 14
        cmp     edx, eax                                ; 3C6F _ 39. C2
        jz      ?_196                                   ; 3C71 _ 74, 3E
        mov     eax, dword [ebp+8H]                     ; 3C73 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 3C76 _ 8B. 40, 04
        imul    eax, dword [ebp-8H]                     ; 3C79 _ 0F AF. 45, F8
        mov     edx, eax                                ; 3C7D _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 3C7F _ 8B. 45, FC
        add     eax, edx                                ; 3C82 _ 01. D0
        mov     edx, eax                                ; 3C84 _ 89. C2
        mov     eax, dword [ebp-14H]                    ; 3C86 _ 8B. 45, EC
        add     eax, edx                                ; 3C89 _ 01. D0
        movzx   eax, byte [eax]                         ; 3C8B _ 0F B6. 00
        cmp     al, byte [ebp-26H]                      ; 3C8E _ 3A. 45, DA
        jnz     ?_196                                   ; 3C91 _ 75, 1E
        mov     eax, dword [ebp+8H]                     ; 3C93 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 3C96 _ 8B. 40, 04
        imul    eax, dword [ebp-8H]                     ; 3C99 _ 0F AF. 45, F8
        mov     edx, eax                                ; 3C9D _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 3C9F _ 8B. 45, FC
        add     eax, edx                                ; 3CA2 _ 01. D0
        mov     edx, eax                                ; 3CA4 _ 89. C2
        mov     eax, dword [ebp-18H]                    ; 3CA6 _ 8B. 45, E8
        add     edx, eax                                ; 3CA9 _ 01. C2
        movzx   eax, byte [ebp-25H]                     ; 3CAB _ 0F B6. 45, DB
        mov     byte [edx], al                          ; 3CAF _ 88. 02
?_196:  add     dword [ebp-20H], 1                      ; 3CB1 _ 83. 45, E0, 01
?_197:  mov     eax, dword [ebp-10H]                    ; 3CB5 _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 3CB8 _ 8B. 40, 04
        cmp     eax, dword [ebp-20H]                    ; 3CBB _ 3B. 45, E0
        jg      ?_195                                   ; 3CBE _ 0F 8F, FFFFFF51
        add     dword [ebp-1CH], 1                      ; 3CC4 _ 83. 45, E4, 01
?_198:  mov     eax, dword [ebp-10H]                    ; 3CC8 _ 8B. 45, F0
        mov     eax, dword [eax+8H]                     ; 3CCB _ 8B. 40, 08
        cmp     eax, dword [ebp-1CH]                    ; 3CCE _ 3B. 45, E4
        jg      ?_194                                   ; 3CD1 _ 0F 8F, FFFFFF24
        add     dword [ebp-24H], 1                      ; 3CD7 _ 83. 45, DC, 01
?_199:  mov     eax, dword [ebp+8H]                     ; 3CDB _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 3CDE _ 8B. 40, 0C
        cmp     eax, dword [ebp-24H]                    ; 3CE1 _ 3B. 45, DC
        jge     ?_193                                   ; 3CE4 _ 0F 8D, FFFFFED8
        leave                                           ; 3CEA _ C9
        ret                                             ; 3CEB _ C3
; sheet_refresh_local End of function

sheet_refresh_map:; Function begin
        push    ebp                                     ; 3CEC _ 55
        mov     ebp, esp                                ; 3CED _ 89. E5
        sub     esp, 64                                 ; 3CEF _ 83. EC, 40
        mov     eax, dword [ebp+8H]                     ; 3CF2 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 3CF5 _ 8B. 00
        mov     dword [ebp-18H], eax                    ; 3CF7 _ 89. 45, E8
        mov     eax, dword [ebp+8H]                     ; 3CFA _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 3CFD _ 8B. 40, 10
        mov     dword [ebp-14H], eax                    ; 3D00 _ 89. 45, EC
        cmp     dword [ebp+0CH], 0                      ; 3D03 _ 83. 7D, 0C, 00
        jns     ?_200                                   ; 3D07 _ 79, 07
        mov     dword [ebp+0CH], 0                      ; 3D09 _ C7. 45, 0C, 00000000
?_200:  cmp     dword [ebp+10H], 0                      ; 3D10 _ 83. 7D, 10, 00
        jns     ?_201                                   ; 3D14 _ 79, 07
        mov     dword [ebp+10H], 0                      ; 3D16 _ C7. 45, 10, 00000000
?_201:  mov     eax, dword [ebp+8H]                     ; 3D1D _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 3D20 _ 8B. 40, 04
        cmp     eax, dword [ebp+14H]                    ; 3D23 _ 3B. 45, 14
        jge     ?_202                                   ; 3D26 _ 7D, 09
        mov     eax, dword [ebp+8H]                     ; 3D28 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 3D2B _ 8B. 40, 04
        mov     dword [ebp+14H], eax                    ; 3D2E _ 89. 45, 14
?_202:  mov     eax, dword [ebp+8H]                     ; 3D31 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 3D34 _ 8B. 40, 08
        cmp     eax, dword [ebp+18H]                    ; 3D37 _ 3B. 45, 18
        jge     ?_203                                   ; 3D3A _ 7D, 09
        mov     eax, dword [ebp+8H]                     ; 3D3C _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 3D3F _ 8B. 40, 08
        mov     dword [ebp+18H], eax                    ; 3D42 _ 89. 45, 18
?_203:  mov     eax, dword [ebp+1CH]                    ; 3D45 _ 8B. 45, 1C
        mov     dword [ebp-34H], eax                    ; 3D48 _ 89. 45, CC
        jmp     ?_214                                   ; 3D4B _ E9, 00000141

?_204:  mov     eax, dword [ebp+8H]                     ; 3D50 _ 8B. 45, 08
        mov     edx, dword [ebp-34H]                    ; 3D53 _ 8B. 55, CC
        add     edx, 4                                  ; 3D56 _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 3D59 _ 8B. 44 90, 04
        mov     dword [ebp-10H], eax                    ; 3D5D _ 89. 45, F0
        mov     edx, dword [ebp-10H]                    ; 3D60 _ 8B. 55, F0
        mov     eax, dword [ebp+8H]                     ; 3D63 _ 8B. 45, 08
        add     eax, 1044                               ; 3D66 _ 05, 00000414
        sub     edx, eax                                ; 3D6B _ 29. C2
        mov     eax, edx                                ; 3D6D _ 89. D0
        sar     eax, 5                                  ; 3D6F _ C1. F8, 05
        mov     byte [ebp-35H], al                      ; 3D72 _ 88. 45, CB
        mov     eax, dword [ebp-10H]                    ; 3D75 _ 8B. 45, F0
        mov     eax, dword [eax]                        ; 3D78 _ 8B. 00
        mov     dword [ebp-0CH], eax                    ; 3D7A _ 89. 45, F4
        mov     eax, dword [ebp-10H]                    ; 3D7D _ 8B. 45, F0
        mov     eax, dword [eax+0CH]                    ; 3D80 _ 8B. 40, 0C
        mov     edx, dword [ebp+0CH]                    ; 3D83 _ 8B. 55, 0C
        sub     edx, eax                                ; 3D86 _ 29. C2
        mov     eax, edx                                ; 3D88 _ 89. D0
        mov     dword [ebp-30H], eax                    ; 3D8A _ 89. 45, D0
        mov     eax, dword [ebp-10H]                    ; 3D8D _ 8B. 45, F0
        mov     eax, dword [eax+10H]                    ; 3D90 _ 8B. 40, 10
        mov     edx, dword [ebp+10H]                    ; 3D93 _ 8B. 55, 10
        sub     edx, eax                                ; 3D96 _ 29. C2
        mov     eax, edx                                ; 3D98 _ 89. D0
        mov     dword [ebp-2CH], eax                    ; 3D9A _ 89. 45, D4
        mov     eax, dword [ebp-10H]                    ; 3D9D _ 8B. 45, F0
        mov     eax, dword [eax+0CH]                    ; 3DA0 _ 8B. 40, 0C
        mov     edx, dword [ebp+14H]                    ; 3DA3 _ 8B. 55, 14
        sub     edx, eax                                ; 3DA6 _ 29. C2
        mov     eax, edx                                ; 3DA8 _ 89. D0
        mov     dword [ebp-28H], eax                    ; 3DAA _ 89. 45, D8
        mov     eax, dword [ebp-10H]                    ; 3DAD _ 8B. 45, F0
        mov     eax, dword [eax+10H]                    ; 3DB0 _ 8B. 40, 10
        mov     edx, dword [ebp+18H]                    ; 3DB3 _ 8B. 55, 18
        sub     edx, eax                                ; 3DB6 _ 29. C2
        mov     eax, edx                                ; 3DB8 _ 89. D0
        mov     dword [ebp-24H], eax                    ; 3DBA _ 89. 45, DC
        cmp     dword [ebp-30H], 0                      ; 3DBD _ 83. 7D, D0, 00
        jns     ?_205                                   ; 3DC1 _ 79, 07
        mov     dword [ebp-30H], 0                      ; 3DC3 _ C7. 45, D0, 00000000
?_205:  cmp     dword [ebp-2CH], 0                      ; 3DCA _ 83. 7D, D4, 00
        jns     ?_206                                   ; 3DCE _ 79, 07
        mov     dword [ebp-2CH], 0                      ; 3DD0 _ C7. 45, D4, 00000000
?_206:  mov     eax, dword [ebp-10H]                    ; 3DD7 _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 3DDA _ 8B. 40, 04
        cmp     eax, dword [ebp-28H]                    ; 3DDD _ 3B. 45, D8
        jge     ?_207                                   ; 3DE0 _ 7D, 09
        mov     eax, dword [ebp-10H]                    ; 3DE2 _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 3DE5 _ 8B. 40, 04
        mov     dword [ebp-28H], eax                    ; 3DE8 _ 89. 45, D8
?_207:  mov     eax, dword [ebp-10H]                    ; 3DEB _ 8B. 45, F0
        mov     eax, dword [eax+8H]                     ; 3DEE _ 8B. 40, 08
        cmp     eax, dword [ebp-24H]                    ; 3DF1 _ 3B. 45, DC
        jge     ?_208                                   ; 3DF4 _ 7D, 09
        mov     eax, dword [ebp-10H]                    ; 3DF6 _ 8B. 45, F0
        mov     eax, dword [eax+8H]                     ; 3DF9 _ 8B. 40, 08
        mov     dword [ebp-24H], eax                    ; 3DFC _ 89. 45, DC
?_208:  mov     eax, dword [ebp-2CH]                    ; 3DFF _ 8B. 45, D4
        mov     dword [ebp-1CH], eax                    ; 3E02 _ 89. 45, E4
        jmp     ?_213                                   ; 3E05 _ EB, 7A

?_209:  mov     eax, dword [ebp-10H]                    ; 3E07 _ 8B. 45, F0
        mov     edx, dword [eax+10H]                    ; 3E0A _ 8B. 50, 10
        mov     eax, dword [ebp-1CH]                    ; 3E0D _ 8B. 45, E4
        add     eax, edx                                ; 3E10 _ 01. D0
        mov     dword [ebp-8H], eax                     ; 3E12 _ 89. 45, F8
        mov     eax, dword [ebp-30H]                    ; 3E15 _ 8B. 45, D0
        mov     dword [ebp-20H], eax                    ; 3E18 _ 89. 45, E0
        jmp     ?_212                                   ; 3E1B _ EB, 58

?_210:  mov     eax, dword [ebp-10H]                    ; 3E1D _ 8B. 45, F0
        mov     edx, dword [eax+0CH]                    ; 3E20 _ 8B. 50, 0C
        mov     eax, dword [ebp-20H]                    ; 3E23 _ 8B. 45, E0
        add     eax, edx                                ; 3E26 _ 01. D0
        mov     dword [ebp-4H], eax                     ; 3E28 _ 89. 45, FC
        mov     eax, dword [ebp-10H]                    ; 3E2B _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 3E2E _ 8B. 40, 04
        imul    eax, dword [ebp-1CH]                    ; 3E31 _ 0F AF. 45, E4
        mov     edx, eax                                ; 3E35 _ 89. C2
        mov     eax, dword [ebp-20H]                    ; 3E37 _ 8B. 45, E0
        add     eax, edx                                ; 3E3A _ 01. D0
        mov     edx, eax                                ; 3E3C _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 3E3E _ 8B. 45, F4
        add     eax, edx                                ; 3E41 _ 01. D0
        movzx   eax, byte [eax]                         ; 3E43 _ 0F B6. 00
        movzx   edx, al                                 ; 3E46 _ 0F B6. D0
        mov     eax, dword [ebp-10H]                    ; 3E49 _ 8B. 45, F0
        mov     eax, dword [eax+14H]                    ; 3E4C _ 8B. 40, 14
        cmp     edx, eax                                ; 3E4F _ 39. C2
        jz      ?_211                                   ; 3E51 _ 74, 1E
        mov     eax, dword [ebp+8H]                     ; 3E53 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 3E56 _ 8B. 40, 04
        imul    eax, dword [ebp-8H]                     ; 3E59 _ 0F AF. 45, F8
        mov     edx, eax                                ; 3E5D _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 3E5F _ 8B. 45, FC
        add     eax, edx                                ; 3E62 _ 01. D0
        mov     edx, eax                                ; 3E64 _ 89. C2
        mov     eax, dword [ebp-14H]                    ; 3E66 _ 8B. 45, EC
        add     edx, eax                                ; 3E69 _ 01. C2
        movzx   eax, byte [ebp-35H]                     ; 3E6B _ 0F B6. 45, CB
        mov     byte [edx], al                          ; 3E6F _ 88. 02
?_211:  add     dword [ebp-20H], 1                      ; 3E71 _ 83. 45, E0, 01
?_212:  mov     eax, dword [ebp-20H]                    ; 3E75 _ 8B. 45, E0
        cmp     eax, dword [ebp-28H]                    ; 3E78 _ 3B. 45, D8
        jl      ?_210                                   ; 3E7B _ 7C, A0
        add     dword [ebp-1CH], 1                      ; 3E7D _ 83. 45, E4, 01
?_213:  mov     eax, dword [ebp-1CH]                    ; 3E81 _ 8B. 45, E4
        cmp     eax, dword [ebp-24H]                    ; 3E84 _ 3B. 45, DC
        jl      ?_209                                   ; 3E87 _ 0F 8C, FFFFFF7A
        add     dword [ebp-34H], 1                      ; 3E8D _ 83. 45, CC, 01
?_214:  mov     eax, dword [ebp+8H]                     ; 3E91 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 3E94 _ 8B. 40, 0C
        cmp     eax, dword [ebp-34H]                    ; 3E97 _ 3B. 45, CC
        jge     ?_204                                   ; 3E9A _ 0F 8D, FFFFFEB0
        leave                                           ; 3EA0 _ C9
        ret                                             ; 3EA1 _ C3
; sheet_refresh_map End of function

init_time_port:; Function begin
        push    ebp                                     ; 3EA2 _ 55
        mov     ebp, esp                                ; 3EA3 _ 89. E5
        sub     esp, 40                                 ; 3EA5 _ 83. EC, 28
        mov     dword [esp+4H], 52                      ; 3EA8 _ C7. 44 24, 04, 00000034
        mov     dword [esp], 67                         ; 3EB0 _ C7. 04 24, 00000043
        call    io_out8                                 ; 3EB7 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 156                     ; 3EBC _ C7. 44 24, 04, 0000009C
        mov     dword [esp], 64                         ; 3EC4 _ C7. 04 24, 00000040
        call    io_out8                                 ; 3ECB _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 46                      ; 3ED0 _ C7. 44 24, 04, 0000002E
        mov     dword [esp], 64                         ; 3ED8 _ C7. 04 24, 00000040
        call    io_out8                                 ; 3EDF _ E8, FFFFFFFC(rel)
        mov     dword [timer_control], 0                ; 3EE4 _ C7. 05, 00000300(d), 00000000
        mov     dword [ebp-0CH], 0                      ; 3EEE _ C7. 45, F4, 00000000
        jmp     ?_216                                   ; 3EF5 _ EB, 28

?_215:  mov     eax, dword [ebp-0CH]                    ; 3EF7 _ 8B. 45, F4
        shl     eax, 4                                  ; 3EFA _ C1. E0, 04
        add     eax, timer_control                      ; 3EFD _ 05, 00000300(d)
        mov     dword [eax+8H], 0                       ; 3F02 _ C7. 40, 08, 00000000
        mov     eax, dword [ebp-0CH]                    ; 3F09 _ 8B. 45, F4
        shl     eax, 4                                  ; 3F0C _ C1. E0, 04
        add     eax, timer_control                      ; 3F0F _ 05, 00000300(d)
        mov     dword [eax+0CH], 0                      ; 3F14 _ C7. 40, 0C, 00000000
        add     dword [ebp-0CH], 1                      ; 3F1B _ 83. 45, F4, 01
?_216:  cmp     dword [ebp-0CH], 499                    ; 3F1F _ 81. 7D, F4, 000001F3
        jle     ?_215                                   ; 3F26 _ 7E, CF
        leave                                           ; 3F28 _ C9
        ret                                             ; 3F29 _ C3
; init_time_port End of function

get_timer_control:; Function begin
        push    ebp                                     ; 3F2A _ 55
        mov     ebp, esp                                ; 3F2B _ 89. E5
        mov     eax, timer_control                      ; 3F2D _ B8, 00000300(d)
        pop     ebp                                     ; 3F32 _ 5D
        ret                                             ; 3F33 _ C3
; get_timer_control End of function

timer_alloc:; Function begin
        push    ebp                                     ; 3F34 _ 55
        mov     ebp, esp                                ; 3F35 _ 89. E5
        sub     esp, 16                                 ; 3F37 _ 83. EC, 10
        mov     dword [ebp-4H], 0                       ; 3F3A _ C7. 45, FC, 00000000
        jmp     ?_219                                   ; 3F41 _ EB, 26

?_217:  mov     eax, dword [ebp-4H]                     ; 3F43 _ 8B. 45, FC
        shl     eax, 4                                  ; 3F46 _ C1. E0, 04
        add     eax, timer_control                      ; 3F49 _ 05, 00000300(d)
        mov     eax, dword [eax+8H]                     ; 3F4E _ 8B. 40, 08
        test    eax, eax                                ; 3F51 _ 85. C0
        jnz     ?_218                                   ; 3F53 _ 75, 10
        mov     eax, dword [ebp-4H]                     ; 3F55 _ 8B. 45, FC
        shl     eax, 4                                  ; 3F58 _ C1. E0, 04
        add     eax, timer_control                      ; 3F5B _ 05, 00000300(d)
        add     eax, 4                                  ; 3F60 _ 83. C0, 04
        jmp     ?_220                                   ; 3F63 _ EB, 0D

?_218:  add     dword [ebp-4H], 1                       ; 3F65 _ 83. 45, FC, 01
?_219:  cmp     dword [ebp-4H], 499                     ; 3F69 _ 81. 7D, FC, 000001F3
        jle     ?_217                                   ; 3F70 _ 7E, D1
?_220:  leave                                           ; 3F72 _ C9
        ret                                             ; 3F73 _ C3
; timer_alloc End of function

timer_free:; Function begin
        push    ebp                                     ; 3F74 _ 55
        mov     ebp, esp                                ; 3F75 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 3F77 _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 3F7A _ C7. 40, 04, 00000000
        pop     ebp                                     ; 3F81 _ 5D
        ret                                             ; 3F82 _ C3
; timer_free End of function

timer_init:; Function begin
        push    ebp                                     ; 3F83 _ 55
        mov     ebp, esp                                ; 3F84 _ 89. E5
        sub     esp, 4                                  ; 3F86 _ 83. EC, 04
        mov     eax, dword [ebp+10H]                    ; 3F89 _ 8B. 45, 10
        mov     byte [ebp-4H], al                       ; 3F8C _ 88. 45, FC
        mov     eax, dword [ebp+8H]                     ; 3F8F _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 3F92 _ 8B. 55, 0C
        mov     dword [eax+8H], edx                     ; 3F95 _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 3F98 _ 8B. 45, 08
        movzx   edx, byte [ebp-4H]                      ; 3F9B _ 0F B6. 55, FC
        mov     byte [eax+0CH], dl                      ; 3F9F _ 88. 50, 0C
        leave                                           ; 3FA2 _ C9
        ret                                             ; 3FA3 _ C3
; timer_init End of function

timer_settime:; Function begin
        push    ebp                                     ; 3FA4 _ 55
        mov     ebp, esp                                ; 3FA5 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 3FA7 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 3FAA _ 8B. 55, 0C
        mov     dword [eax], edx                        ; 3FAD _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 3FAF _ 8B. 45, 08
        mov     dword [eax+4H], 2                       ; 3FB2 _ C7. 40, 04, 00000002
        pop     ebp                                     ; 3FB9 _ 5D
        ret                                             ; 3FBA _ C3
; timer_settime End of function

intHandlerTimer:; Function begin
        push    ebp                                     ; 3FBB _ 55
        mov     ebp, esp                                ; 3FBC _ 89. E5
        sub     esp, 40                                 ; 3FBE _ 83. EC, 28
        mov     dword [esp+4H], 32                      ; 3FC1 _ C7. 44 24, 04, 00000020
        mov     dword [esp], 32                         ; 3FC9 _ C7. 04 24, 00000020
        call    io_out8                                 ; 3FD0 _ E8, FFFFFFFC(rel)
        mov     eax, dword [timer_control]              ; 3FD5 _ A1, 00000300(d)
        add     eax, 1                                  ; 3FDA _ 83. C0, 01
        mov     dword [timer_control], eax              ; 3FDD _ A3, 00000300(d)
        mov     byte [ebp-0DH], 0                       ; 3FE2 _ C6. 45, F3, 00
        mov     dword [ebp-0CH], 0                      ; 3FE6 _ C7. 45, F4, 00000000
        jmp     ?_224                                   ; 3FED _ E9, 000000B0

?_221:  mov     eax, dword [ebp-0CH]                    ; 3FF2 _ 8B. 45, F4
        shl     eax, 4                                  ; 3FF5 _ C1. E0, 04
        add     eax, timer_control                      ; 3FF8 _ 05, 00000300(d)
        mov     eax, dword [eax+8H]                     ; 3FFD _ 8B. 40, 08
        cmp     eax, 2                                  ; 4000 _ 83. F8, 02
        jne     ?_222                                   ; 4003 _ 0F 85, 0000008A
        mov     eax, dword [ebp-0CH]                    ; 4009 _ 8B. 45, F4
        shl     eax, 4                                  ; 400C _ C1. E0, 04
        add     eax, timer_control                      ; 400F _ 05, 00000300(d)
        mov     eax, dword [eax+4H]                     ; 4014 _ 8B. 40, 04
        lea     edx, [eax-1H]                           ; 4017 _ 8D. 50, FF
        mov     eax, dword [ebp-0CH]                    ; 401A _ 8B. 45, F4
        shl     eax, 4                                  ; 401D _ C1. E0, 04
        add     eax, timer_control                      ; 4020 _ 05, 00000300(d)
        mov     dword [eax+4H], edx                     ; 4025 _ 89. 50, 04
        mov     eax, dword [ebp-0CH]                    ; 4028 _ 8B. 45, F4
        shl     eax, 4                                  ; 402B _ C1. E0, 04
        add     eax, timer_control                      ; 402E _ 05, 00000300(d)
        mov     eax, dword [eax+4H]                     ; 4033 _ 8B. 40, 04
        test    eax, eax                                ; 4036 _ 85. C0
        jnz     ?_222                                   ; 4038 _ 75, 59
        mov     eax, dword [ebp-0CH]                    ; 403A _ 8B. 45, F4
        shl     eax, 4                                  ; 403D _ C1. E0, 04
        add     eax, timer_control                      ; 4040 _ 05, 00000300(d)
        mov     dword [eax+8H], 1                       ; 4045 _ C7. 40, 08, 00000001
        mov     eax, dword [ebp-0CH]                    ; 404C _ 8B. 45, F4
        shl     eax, 4                                  ; 404F _ C1. E0, 04
        add     eax, timer_control                      ; 4052 _ 05, 00000300(d)
        movzx   eax, byte [eax+10H]                     ; 4057 _ 0F B6. 40, 10
        movzx   edx, al                                 ; 405B _ 0F B6. D0
        mov     eax, dword [ebp-0CH]                    ; 405E _ 8B. 45, F4
        shl     eax, 4                                  ; 4061 _ C1. E0, 04
        add     eax, timer_control                      ; 4064 _ 05, 00000300(d)
        mov     eax, dword [eax+0CH]                    ; 4069 _ 8B. 40, 0C
        mov     dword [esp+4H], edx                     ; 406C _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 4070 _ 89. 04 24
        call    fifo8_put                               ; 4073 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 4078 _ 8B. 45, F4
        shl     eax, 4                                  ; 407B _ C1. E0, 04
        add     eax, timer_control                      ; 407E _ 05, 00000300(d)
        lea     edx, [eax+4H]                           ; 4083 _ 8D. 50, 04
        mov     eax, dword [task_timer]                 ; 4086 _ A1, 00000000(d)
        cmp     edx, eax                                ; 408B _ 39. C2
        jnz     ?_222                                   ; 408D _ 75, 04
        mov     byte [ebp-0DH], 1                       ; 408F _ C6. 45, F3, 01
?_222:  cmp     byte [ebp-0DH], 0                       ; 4093 _ 80. 7D, F3, 00
        jz      ?_223                                   ; 4097 _ 74, 05
        call    task_switch                             ; 4099 _ E8, FFFFFFFC(rel)
?_223:  add     dword [ebp-0CH], 1                      ; 409E _ 83. 45, F4, 01
?_224:  cmp     dword [ebp-0CH], 499                    ; 40A2 _ 81. 7D, F4, 000001F3
        jle     ?_221                                   ; 40A9 _ 0F 8E, FFFFFF43
        leave                                           ; 40AF _ C9
        ret                                             ; 40B0 _ C3
; intHandlerTimer End of function

segment_descriptor:; Function begin
        push    ebp                                     ; 40B1 _ 55
        mov     ebp, esp                                ; 40B2 _ 89. E5
        cmp     dword [ebp+0CH], 1048575                ; 40B4 _ 81. 7D, 0C, 000FFFFF
        jbe     ?_225                                   ; 40BB _ 76, 10
        or      dword [ebp+14H], 8000H                  ; 40BD _ 81. 4D, 14, 00008000
        mov     eax, dword [ebp+0CH]                    ; 40C4 _ 8B. 45, 0C
        shr     eax, 12                                 ; 40C7 _ C1. E8, 0C
        mov     dword [ebp+0CH], eax                    ; 40CA _ 89. 45, 0C
?_225:  mov     eax, dword [ebp+0CH]                    ; 40CD _ 8B. 45, 0C
        mov     edx, eax                                ; 40D0 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 40D2 _ 8B. 45, 08
        mov     word [eax], dx                          ; 40D5 _ 66: 89. 10
        mov     eax, dword [ebp+10H]                    ; 40D8 _ 8B. 45, 10
        mov     edx, eax                                ; 40DB _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 40DD _ 8B. 45, 08
        mov     word [eax+2H], dx                       ; 40E0 _ 66: 89. 50, 02
        mov     eax, dword [ebp+10H]                    ; 40E4 _ 8B. 45, 10
        sar     eax, 16                                 ; 40E7 _ C1. F8, 10
        mov     edx, eax                                ; 40EA _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 40EC _ 8B. 45, 08
        mov     byte [eax+4H], dl                       ; 40EF _ 88. 50, 04
        mov     eax, dword [ebp+14H]                    ; 40F2 _ 8B. 45, 14
        mov     edx, eax                                ; 40F5 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 40F7 _ 8B. 45, 08
        mov     byte [eax+5H], dl                       ; 40FA _ 88. 50, 05
        mov     eax, dword [ebp+0CH]                    ; 40FD _ 8B. 45, 0C
        shr     eax, 16                                 ; 4100 _ C1. E8, 10
        and     eax, 0FH                                ; 4103 _ 83. E0, 0F
        mov     edx, eax                                ; 4106 _ 89. C2
        mov     eax, dword [ebp+14H]                    ; 4108 _ 8B. 45, 14
        sar     eax, 8                                  ; 410B _ C1. F8, 08
        and     eax, 0FFFFFFF0H                         ; 410E _ 83. E0, F0
        or      eax, edx                                ; 4111 _ 09. D0
        mov     edx, eax                                ; 4113 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 4115 _ 8B. 45, 08
        mov     byte [eax+6H], dl                       ; 4118 _ 88. 50, 06
        mov     eax, dword [ebp+10H]                    ; 411B _ 8B. 45, 10
        shr     eax, 24                                 ; 411E _ C1. E8, 18
        mov     edx, eax                                ; 4121 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 4123 _ 8B. 45, 08
        mov     byte [eax+7H], dl                       ; 4126 _ 88. 50, 07
        pop     ebp                                     ; 4129 _ 5D
        ret                                             ; 412A _ C3
; segment_descriptor End of function

init_task_level:; Function begin
        push    ebp                                     ; 412B _ 55
        mov     ebp, esp                                ; 412C _ 89. E5
        sub     esp, 16                                 ; 412E _ 83. EC, 10
        mov     ecx, dword [task_control]               ; 4131 _ 8B. 0D, 00002248(d)
        mov     edx, dword [ebp+8H]                     ; 4137 _ 8B. 55, 08
        mov     eax, edx                                ; 413A _ 89. D0
        shl     eax, 2                                  ; 413C _ C1. E0, 02
        add     eax, edx                                ; 413F _ 01. D0
        shl     eax, 2                                  ; 4141 _ C1. E0, 02
        add     eax, ecx                                ; 4144 _ 01. C8
        add     eax, 8                                  ; 4146 _ 83. C0, 08
        mov     dword [eax], 0                          ; 4149 _ C7. 00, 00000000
        mov     ecx, dword [task_control]               ; 414F _ 8B. 0D, 00002248(d)
        mov     edx, dword [ebp+8H]                     ; 4155 _ 8B. 55, 08
        mov     eax, edx                                ; 4158 _ 89. D0
        shl     eax, 2                                  ; 415A _ C1. E0, 02
        add     eax, edx                                ; 415D _ 01. D0
        shl     eax, 2                                  ; 415F _ C1. E0, 02
        add     eax, ecx                                ; 4162 _ 01. C8
        add     eax, 12                                 ; 4164 _ 83. C0, 0C
        mov     dword [eax], 0                          ; 4167 _ C7. 00, 00000000
        mov     dword [ebp-4H], 0                       ; 416D _ C7. 45, FC, 00000000
        jmp     ?_227                                   ; 4174 _ EB, 21

?_226:  mov     ecx, dword [task_control]               ; 4176 _ 8B. 0D, 00002248(d)
        mov     edx, dword [ebp-4H]                     ; 417C _ 8B. 55, FC
        mov     eax, edx                                ; 417F _ 89. D0
        add     eax, eax                                ; 4181 _ 01. C0
        add     eax, edx                                ; 4183 _ 01. D0
        shl     eax, 3                                  ; 4185 _ C1. E0, 03
        add     eax, ecx                                ; 4188 _ 01. C8
        add     eax, 16                                 ; 418A _ 83. C0, 10
        mov     dword [eax], 0                          ; 418D _ C7. 00, 00000000
        add     dword [ebp-4H], 1                       ; 4193 _ 83. 45, FC, 01
?_227:  cmp     dword [ebp-4H], 2                       ; 4197 _ 83. 7D, FC, 02
        jle     ?_226                                   ; 419B _ 7E, D9
        leave                                           ; 419D _ C9
        ret                                             ; 419E _ C3
; init_task_level End of function

task_init:; Function begin
        push    ebp                                     ; 419F _ 55
        mov     ebp, esp                                ; 41A0 _ 89. E5
        sub     esp, 40                                 ; 41A2 _ 83. EC, 28
        call    get_addr_gdt                            ; 41A5 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 41AA _ 89. 45, F0
        mov     dword [esp+4H], 668                     ; 41AD _ C7. 44 24, 04, 0000029C
        mov     eax, dword [ebp+8H]                     ; 41B5 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 41B8 _ 89. 04 24
        call    memman_alloc_4k                         ; 41BB _ E8, FFFFFFFC(rel)
        mov     dword [task_control], eax               ; 41C0 _ A3, 00002248(d)
        mov     dword [ebp-14H], 0                      ; 41C5 _ C7. 45, EC, 00000000
        jmp     ?_229                                   ; 41CC _ E9, 00000085

?_228:  mov     edx, dword [task_control]               ; 41D1 _ 8B. 15, 00002248(d)
        mov     eax, dword [ebp-14H]                    ; 41D7 _ 8B. 45, EC
        imul    eax, eax, 148                           ; 41DA _ 69. C0, 00000094
        add     eax, edx                                ; 41E0 _ 01. D0
        add     eax, 72                                 ; 41E2 _ 83. C0, 48
        mov     dword [eax], 0                          ; 41E5 _ C7. 00, 00000000
        mov     ecx, dword [task_control]               ; 41EB _ 8B. 0D, 00002248(d)
        mov     eax, dword [ebp-14H]                    ; 41F1 _ 8B. 45, EC
        add     eax, 8                                  ; 41F4 _ 83. C0, 08
        lea     edx, [eax*8]                            ; 41F7 _ 8D. 14 C5, 00000000
        mov     eax, dword [ebp-14H]                    ; 41FE _ 8B. 45, EC
        imul    eax, eax, 148                           ; 4201 _ 69. C0, 00000094
        add     eax, ecx                                ; 4207 _ 01. C8
        add     eax, 68                                 ; 4209 _ 83. C0, 44
        mov     dword [eax], edx                        ; 420C _ 89. 10
        mov     eax, dword [task_control]               ; 420E _ A1, 00002248(d)
        mov     edx, dword [ebp-14H]                    ; 4213 _ 8B. 55, EC
        imul    edx, edx, 148                           ; 4216 _ 69. D2, 00000094
        add     edx, 96                                 ; 421C _ 83. C2, 60
        add     eax, edx                                ; 421F _ 01. D0
        add     eax, 16                                 ; 4221 _ 83. C0, 10
        mov     edx, dword [ebp-14H]                    ; 4224 _ 8B. 55, EC
        add     edx, 8                                  ; 4227 _ 83. C2, 08
        lea     ecx, [edx*8]                            ; 422A _ 8D. 0C D5, 00000000
        mov     edx, dword [ebp-10H]                    ; 4231 _ 8B. 55, F0
        add     edx, ecx                                ; 4234 _ 01. CA
        mov     dword [esp+0CH], 137                    ; 4236 _ C7. 44 24, 0C, 00000089
        mov     dword [esp+8H], eax                     ; 423E _ 89. 44 24, 08
        mov     dword [esp+4H], 103                     ; 4242 _ C7. 44 24, 04, 00000067
        mov     dword [esp], edx                        ; 424A _ 89. 14 24
        call    segment_descriptor                      ; 424D _ E8, FFFFFFFC(rel)
        add     dword [ebp-14H], 1                      ; 4252 _ 83. 45, EC, 01
?_229:  cmp     dword [ebp-14H], 4                      ; 4256 _ 83. 7D, EC, 04
        jle     ?_228                                   ; 425A _ 0F 8E, FFFFFF71
        mov     dword [ebp-14H], 0                      ; 4260 _ C7. 45, EC, 00000000
        jmp     ?_231                                   ; 4267 _ EB, 0F

?_230:  mov     eax, dword [ebp-14H]                    ; 4269 _ 8B. 45, EC
        mov     dword [esp], eax                        ; 426C _ 89. 04 24
        call    init_task_level                         ; 426F _ E8, FFFFFFFC(rel)
        add     dword [ebp-14H], 1                      ; 4274 _ 83. 45, EC, 01
?_231:  cmp     dword [ebp-14H], 2                      ; 4278 _ 83. 7D, EC, 02
        jle     ?_230                                   ; 427C _ 7E, EB
        call    task_alloc                              ; 427E _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 4283 _ 89. 45, F4
        mov     eax, dword [ebp-0CH]                    ; 4286 _ 8B. 45, F4
        mov     dword [eax+4H], 2                       ; 4289 _ C7. 40, 04, 00000002
        mov     eax, dword [ebp-0CH]                    ; 4290 _ 8B. 45, F4
        mov     dword [eax+8H], 100                     ; 4293 _ C7. 40, 08, 00000064
        mov     eax, dword [ebp-0CH]                    ; 429A _ 8B. 45, F4
        mov     dword [eax+0CH], 0                      ; 429D _ C7. 40, 0C, 00000000
        mov     eax, dword [ebp-0CH]                    ; 42A4 _ 8B. 45, F4
        mov     dword [esp], eax                        ; 42A7 _ 89. 04 24
        call    task_add                                ; 42AA _ E8, FFFFFFFC(rel)
        call    task_switch_sub                         ; 42AF _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 42B4 _ 8B. 45, F4
        mov     eax, dword [eax]                        ; 42B7 _ 8B. 00
        mov     dword [esp], eax                        ; 42B9 _ 89. 04 24
        call    load_tr                                 ; 42BC _ E8, FFFFFFFC(rel)
        call    timer_alloc                             ; 42C1 _ E8, FFFFFFFC(rel)
        mov     dword [task_timer], eax                 ; 42C6 _ A3, 00002244(d)
        mov     eax, dword [ebp-0CH]                    ; 42CB _ 8B. 45, F4
        mov     eax, dword [eax+8H]                     ; 42CE _ 8B. 40, 08
        mov     edx, eax                                ; 42D1 _ 89. C2
        mov     eax, dword [task_timer]                 ; 42D3 _ A1, 00002244(d)
        mov     dword [esp+4H], edx                     ; 42D8 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 42DC _ 89. 04 24
        call    timer_settime                           ; 42DF _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 42E4 _ 8B. 45, F4
        leave                                           ; 42E7 _ C9
        ret                                             ; 42E8 _ C3
; task_init End of function

task_alloc:; Function begin
        push    ebp                                     ; 42E9 _ 55
        mov     ebp, esp                                ; 42EA _ 89. E5
        sub     esp, 16                                 ; 42EC _ 83. EC, 10
        mov     dword [ebp-8H], 0                       ; 42EF _ C7. 45, F8, 00000000
        jmp     ?_234                                   ; 42F6 _ E9, 000000F6

?_232:  mov     edx, dword [task_control]               ; 42FB _ 8B. 15, 00002248(d)
        mov     eax, dword [ebp-8H]                     ; 4301 _ 8B. 45, F8
        imul    eax, eax, 148                           ; 4304 _ 69. C0, 00000094
        add     eax, edx                                ; 430A _ 01. D0
        add     eax, 72                                 ; 430C _ 83. C0, 48
        mov     eax, dword [eax]                        ; 430F _ 8B. 00
        test    eax, eax                                ; 4311 _ 85. C0
        jne     ?_233                                   ; 4313 _ 0F 85, 000000D4
        mov     eax, dword [task_control]               ; 4319 _ A1, 00002248(d)
        mov     edx, dword [ebp-8H]                     ; 431E _ 8B. 55, F8
        imul    edx, edx, 148                           ; 4321 _ 69. D2, 00000094
        add     edx, 64                                 ; 4327 _ 83. C2, 40
        add     eax, edx                                ; 432A _ 01. D0
        add     eax, 4                                  ; 432C _ 83. C0, 04
        mov     dword [ebp-4H], eax                     ; 432F _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 4332 _ 8B. 45, FC
        mov     dword [eax+4H], 1                       ; 4335 _ C7. 40, 04, 00000001
        mov     eax, dword [ebp-4H]                     ; 433C _ 8B. 45, FC
        mov     dword [eax+50H], 514                    ; 433F _ C7. 40, 50, 00000202
        mov     eax, dword [ebp-4H]                     ; 4346 _ 8B. 45, FC
        mov     dword [eax+54H], 0                      ; 4349 _ C7. 40, 54, 00000000
        mov     eax, dword [ebp-4H]                     ; 4350 _ 8B. 45, FC
        mov     dword [eax+58H], 0                      ; 4353 _ C7. 40, 58, 00000000
        mov     eax, dword [ebp-4H]                     ; 435A _ 8B. 45, FC
        mov     dword [eax+5CH], 0                      ; 435D _ C7. 40, 5C, 00000000
        mov     eax, dword [ebp-4H]                     ; 4364 _ 8B. 45, FC
        mov     dword [eax+60H], 0                      ; 4367 _ C7. 40, 60, 00000000
        mov     eax, dword [ebp-8H]                     ; 436E _ 8B. 45, F8
        add     eax, 1                                  ; 4371 _ 83. C0, 01
        shl     eax, 9                                  ; 4374 _ C1. E0, 09
        mov     edx, eax                                ; 4377 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 4379 _ 8B. 45, FC
        mov     dword [eax+64H], edx                    ; 437C _ 89. 50, 64
        mov     eax, dword [ebp-4H]                     ; 437F _ 8B. 45, FC
        mov     dword [eax+68H], 0                      ; 4382 _ C7. 40, 68, 00000000
        mov     eax, dword [ebp-4H]                     ; 4389 _ 8B. 45, FC
        mov     dword [eax+6CH], 0                      ; 438C _ C7. 40, 6C, 00000000
        mov     eax, dword [ebp-4H]                     ; 4393 _ 8B. 45, FC
        mov     dword [eax+70H], 0                      ; 4396 _ C7. 40, 70, 00000000
        mov     eax, dword [ebp-4H]                     ; 439D _ 8B. 45, FC
        mov     dword [eax+74H], 0                      ; 43A0 _ C7. 40, 74, 00000000
        mov     eax, dword [ebp-4H]                     ; 43A7 _ 8B. 45, FC
        mov     dword [eax+80H], 0                      ; 43AA _ C7. 80, 00000080, 00000000
        mov     eax, dword [ebp-4H]                     ; 43B4 _ 8B. 45, FC
        mov     dword [eax+84H], 0                      ; 43B7 _ C7. 80, 00000084, 00000000
        mov     eax, dword [ebp-4H]                     ; 43C1 _ 8B. 45, FC
        mov     dword [eax+88H], 0                      ; 43C4 _ C7. 80, 00000088, 00000000
        mov     eax, dword [ebp-4H]                     ; 43CE _ 8B. 45, FC
        mov     dword [eax+8CH], 0                      ; 43D1 _ C7. 80, 0000008C, 00000000
        mov     eax, dword [ebp-4H]                     ; 43DB _ 8B. 45, FC
        mov     dword [eax+90H], 1073741824             ; 43DE _ C7. 80, 00000090, 40000000
        mov     eax, dword [ebp-4H]                     ; 43E8 _ 8B. 45, FC
        jmp     ?_235                                   ; 43EB _ EB, 13

?_233:  add     dword [ebp-8H], 1                       ; 43ED _ 83. 45, F8, 01
?_234:  cmp     dword [ebp-8H], 4                       ; 43F1 _ 83. 7D, F8, 04
        jle     ?_232                                   ; 43F5 _ 0F 8E, FFFFFF00
        mov     eax, 0                                  ; 43FB _ B8, 00000000
?_235:  leave                                           ; 4400 _ C9
        ret                                             ; 4401 _ C3
; task_alloc End of function

task_run:; Function begin
        push    ebp                                     ; 4402 _ 55
        mov     ebp, esp                                ; 4403 _ 89. E5
        sub     esp, 24                                 ; 4405 _ 83. EC, 18
        cmp     dword [ebp+0CH], 0                      ; 4408 _ 83. 7D, 0C, 00
        jns     ?_236                                   ; 440C _ 79, 09
        mov     eax, dword [ebp+8H]                     ; 440E _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 4411 _ 8B. 40, 0C
        mov     dword [ebp+0CH], eax                    ; 4414 _ 89. 45, 0C
?_236:  cmp     dword [ebp+10H], 0                      ; 4417 _ 83. 7D, 10, 00
        jle     ?_237                                   ; 441B _ 7E, 09
        mov     eax, dword [ebp+8H]                     ; 441D _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 4420 _ 8B. 55, 10
        mov     dword [eax+8H], edx                     ; 4423 _ 89. 50, 08
?_237:  mov     eax, dword [ebp+8H]                     ; 4426 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 4429 _ 8B. 40, 04
        cmp     eax, 2                                  ; 442C _ 83. F8, 02
        jnz     ?_238                                   ; 442F _ 75, 16
        mov     eax, dword [ebp+8H]                     ; 4431 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 4434 _ 8B. 40, 0C
        cmp     eax, dword [ebp+0CH]                    ; 4437 _ 3B. 45, 0C
        jz      ?_238                                   ; 443A _ 74, 0B
        mov     eax, dword [ebp+8H]                     ; 443C _ 8B. 45, 08
        mov     dword [esp], eax                        ; 443F _ 89. 04 24
        call    task_remove                             ; 4442 _ E8, FFFFFFFC(rel)
?_238:  mov     eax, dword [ebp+8H]                     ; 4447 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 444A _ 8B. 40, 04
        cmp     eax, 2                                  ; 444D _ 83. F8, 02
        jz      ?_239                                   ; 4450 _ 74, 14
        mov     eax, dword [ebp+8H]                     ; 4452 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 4455 _ 8B. 55, 0C
        mov     dword [eax+0CH], edx                    ; 4458 _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 445B _ 8B. 45, 08
        mov     dword [esp], eax                        ; 445E _ 89. 04 24
        call    task_add                                ; 4461 _ E8, FFFFFFFC(rel)
?_239:  mov     eax, dword [task_control]               ; 4466 _ A1, 00002248(d)
        mov     dword [eax+4H], 1                       ; 446B _ C7. 40, 04, 00000001
        leave                                           ; 4472 _ C9
        ret                                             ; 4473 _ C3
; task_run End of function

task_switch:; Function begin
        push    ebp                                     ; 4474 _ 55
        mov     ebp, esp                                ; 4475 _ 89. E5
        sub     esp, 40                                 ; 4477 _ 83. EC, 28
        mov     ecx, dword [task_control]               ; 447A _ 8B. 0D, 00002248(d)
        mov     eax, dword [task_control]               ; 4480 _ A1, 00002248(d)
        mov     edx, dword [eax]                        ; 4485 _ 8B. 10
        mov     eax, edx                                ; 4487 _ 89. D0
        shl     eax, 2                                  ; 4489 _ C1. E0, 02
        add     eax, edx                                ; 448C _ 01. D0
        shl     eax, 2                                  ; 448E _ C1. E0, 02
        add     eax, ecx                                ; 4491 _ 01. C8
        add     eax, 8                                  ; 4493 _ 83. C0, 08
        mov     dword [ebp-14H], eax                    ; 4496 _ 89. 45, EC
        mov     eax, dword [ebp-14H]                    ; 4499 _ 8B. 45, EC
        mov     edx, dword [eax+4H]                     ; 449C _ 8B. 50, 04
        mov     eax, dword [ebp-14H]                    ; 449F _ 8B. 45, EC
        mov     eax, dword [eax+edx*4+8H]               ; 44A2 _ 8B. 44 90, 08
        mov     dword [ebp-10H], eax                    ; 44A6 _ 89. 45, F0
        mov     eax, dword [ebp-14H]                    ; 44A9 _ 8B. 45, EC
        mov     eax, dword [eax+4H]                     ; 44AC _ 8B. 40, 04
        lea     edx, [eax+1H]                           ; 44AF _ 8D. 50, 01
        mov     eax, dword [ebp-14H]                    ; 44B2 _ 8B. 45, EC
        mov     dword [eax+4H], edx                     ; 44B5 _ 89. 50, 04
        mov     eax, dword [ebp-14H]                    ; 44B8 _ 8B. 45, EC
        mov     edx, dword [eax+4H]                     ; 44BB _ 8B. 50, 04
        mov     eax, dword [ebp-14H]                    ; 44BE _ 8B. 45, EC
        mov     eax, dword [eax]                        ; 44C1 _ 8B. 00
        cmp     edx, eax                                ; 44C3 _ 39. C2
        jnz     ?_240                                   ; 44C5 _ 75, 0A
        mov     eax, dword [ebp-14H]                    ; 44C7 _ 8B. 45, EC
        mov     dword [eax+4H], 0                       ; 44CA _ C7. 40, 04, 00000000
?_240:  mov     eax, dword [task_control]               ; 44D1 _ A1, 00002248(d)
        mov     eax, dword [eax+4H]                     ; 44D6 _ 8B. 40, 04
        test    eax, eax                                ; 44D9 _ 85. C0
        jz      ?_241                                   ; 44DB _ 74, 24
        call    task_switch_sub                         ; 44DD _ E8, FFFFFFFC(rel)
        mov     ecx, dword [task_control]               ; 44E2 _ 8B. 0D, 00002248(d)
        mov     eax, dword [task_control]               ; 44E8 _ A1, 00002248(d)
        mov     edx, dword [eax]                        ; 44ED _ 8B. 10
        mov     eax, edx                                ; 44EF _ 89. D0
        shl     eax, 2                                  ; 44F1 _ C1. E0, 02
        add     eax, edx                                ; 44F4 _ 01. D0
        shl     eax, 2                                  ; 44F6 _ C1. E0, 02
        add     eax, ecx                                ; 44F9 _ 01. C8
        add     eax, 8                                  ; 44FB _ 83. C0, 08
        mov     dword [ebp-14H], eax                    ; 44FE _ 89. 45, EC
?_241:  mov     eax, dword [ebp-14H]                    ; 4501 _ 8B. 45, EC
        mov     edx, dword [eax+4H]                     ; 4504 _ 8B. 50, 04
        mov     eax, dword [ebp-14H]                    ; 4507 _ 8B. 45, EC
        mov     eax, dword [eax+edx*4+8H]               ; 450A _ 8B. 44 90, 08
        mov     dword [ebp-0CH], eax                    ; 450E _ 89. 45, F4
        mov     eax, dword [ebp-0CH]                    ; 4511 _ 8B. 45, F4
        mov     eax, dword [eax+8H]                     ; 4514 _ 8B. 40, 08
        mov     edx, eax                                ; 4517 _ 89. C2
        mov     eax, dword [task_timer]                 ; 4519 _ A1, 00002244(d)
        mov     dword [esp+4H], edx                     ; 451E _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 4522 _ 89. 04 24
        call    timer_settime                           ; 4525 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 452A _ 8B. 45, F4
        cmp     eax, dword [ebp-10H]                    ; 452D _ 3B. 45, F0
        jz      ?_242                                   ; 4530 _ 74, 1B
        cmp     dword [ebp-0CH], 0                      ; 4532 _ 83. 7D, F4, 00
        jz      ?_242                                   ; 4536 _ 74, 15
        mov     eax, dword [ebp-0CH]                    ; 4538 _ 8B. 45, F4
        mov     eax, dword [eax]                        ; 453B _ 8B. 00
        mov     dword [esp+4H], eax                     ; 453D _ 89. 44 24, 04
        mov     dword [esp], 0                          ; 4541 _ C7. 04 24, 00000000
        call    farjmp                                  ; 4548 _ E8, FFFFFFFC(rel)
?_242:  leave                                           ; 454D _ C9
        ret                                             ; 454E _ C3
; task_switch End of function

task_sleep:; Function begin
        push    ebp                                     ; 454F _ 55
        mov     ebp, esp                                ; 4550 _ 89. E5
        sub     esp, 40                                 ; 4552 _ 83. EC, 28
        mov     dword [ebp-0CH], 0                      ; 4555 _ C7. 45, F4, 00000000
        mov     dword [ebp-10H], 0                      ; 455C _ C7. 45, F0, 00000000
        mov     eax, dword [ebp+8H]                     ; 4563 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 4566 _ 8B. 40, 04
        cmp     eax, 2                                  ; 4569 _ 83. F8, 02
        jnz     ?_243                                   ; 456C _ 75, 51
        call    task_now                                ; 456E _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 4573 _ 89. 45, F4
        mov     eax, dword [ebp+8H]                     ; 4576 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 4579 _ 89. 04 24
        call    task_remove                             ; 457C _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], 1                      ; 4581 _ C7. 45, F0, 00000001
        mov     eax, dword [ebp+8H]                     ; 4588 _ 8B. 45, 08
        cmp     eax, dword [ebp-0CH]                    ; 458B _ 3B. 45, F4
        jnz     ?_243                                   ; 458E _ 75, 2F
        call    task_switch_sub                         ; 4590 _ E8, FFFFFFFC(rel)
        call    task_now                                ; 4595 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 459A _ 89. 45, F4
        mov     dword [ebp-10H], 2                      ; 459D _ C7. 45, F0, 00000002
        cmp     dword [ebp-0CH], 0                      ; 45A4 _ 83. 7D, F4, 00
        jz      ?_243                                   ; 45A8 _ 74, 15
        mov     eax, dword [ebp-0CH]                    ; 45AA _ 8B. 45, F4
        mov     eax, dword [eax]                        ; 45AD _ 8B. 00
        mov     dword [esp+4H], eax                     ; 45AF _ 89. 44 24, 04
        mov     dword [esp], 0                          ; 45B3 _ C7. 04 24, 00000000
        call    farjmp                                  ; 45BA _ E8, FFFFFFFC(rel)
?_243:  mov     eax, dword [ebp-10H]                    ; 45BF _ 8B. 45, F0
        leave                                           ; 45C2 _ C9
        ret                                             ; 45C3 _ C3
; task_sleep End of function

task_now:; Function begin
        push    ebp                                     ; 45C4 _ 55
        mov     ebp, esp                                ; 45C5 _ 89. E5
        sub     esp, 16                                 ; 45C7 _ 83. EC, 10
        mov     ecx, dword [task_control]               ; 45CA _ 8B. 0D, 00002248(d)
        mov     eax, dword [task_control]               ; 45D0 _ A1, 00002248(d)
        mov     edx, dword [eax]                        ; 45D5 _ 8B. 10
        mov     eax, edx                                ; 45D7 _ 89. D0
        shl     eax, 2                                  ; 45D9 _ C1. E0, 02
        add     eax, edx                                ; 45DC _ 01. D0
        shl     eax, 2                                  ; 45DE _ C1. E0, 02
        add     eax, ecx                                ; 45E1 _ 01. C8
        add     eax, 8                                  ; 45E3 _ 83. C0, 08
        mov     dword [ebp-4H], eax                     ; 45E6 _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 45E9 _ 8B. 45, FC
        mov     edx, dword [eax+4H]                     ; 45EC _ 8B. 50, 04
        mov     eax, dword [ebp-4H]                     ; 45EF _ 8B. 45, FC
        mov     eax, dword [eax+edx*4+8H]               ; 45F2 _ 8B. 44 90, 08
        leave                                           ; 45F6 _ C9
        ret                                             ; 45F7 _ C3
; task_now End of function

task_add:; Function begin
        push    ebp                                     ; 45F8 _ 55
        mov     ebp, esp                                ; 45F9 _ 89. E5
        sub     esp, 16                                 ; 45FB _ 83. EC, 10
        mov     ecx, dword [task_control]               ; 45FE _ 8B. 0D, 00002248(d)
        mov     eax, dword [ebp+8H]                     ; 4604 _ 8B. 45, 08
        mov     edx, dword [eax+0CH]                    ; 4607 _ 8B. 50, 0C
        mov     eax, edx                                ; 460A _ 89. D0
        shl     eax, 2                                  ; 460C _ C1. E0, 02
        add     eax, edx                                ; 460F _ 01. D0
        shl     eax, 2                                  ; 4611 _ C1. E0, 02
        add     eax, ecx                                ; 4614 _ 01. C8
        add     eax, 8                                  ; 4616 _ 83. C0, 08
        mov     dword [ebp-4H], eax                     ; 4619 _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 461C _ 8B. 45, FC
        mov     edx, dword [eax]                        ; 461F _ 8B. 10
        mov     eax, dword [ebp-4H]                     ; 4621 _ 8B. 45, FC
        mov     ecx, dword [ebp+8H]                     ; 4624 _ 8B. 4D, 08
        mov     dword [eax+edx*4+8H], ecx               ; 4627 _ 89. 4C 90, 08
        mov     eax, dword [ebp-4H]                     ; 462B _ 8B. 45, FC
        mov     eax, dword [eax]                        ; 462E _ 8B. 00
        lea     edx, [eax+1H]                           ; 4630 _ 8D. 50, 01
        mov     eax, dword [ebp-4H]                     ; 4633 _ 8B. 45, FC
        mov     dword [eax], edx                        ; 4636 _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 4638 _ 8B. 45, 08
        mov     dword [eax+4H], 2                       ; 463B _ C7. 40, 04, 00000002
        leave                                           ; 4642 _ C9
        ret                                             ; 4643 _ C3
; task_add End of function

task_remove:; Function begin
        push    ebp                                     ; 4644 _ 55
        mov     ebp, esp                                ; 4645 _ 89. E5
        sub     esp, 16                                 ; 4647 _ 83. EC, 10
        mov     ecx, dword [task_control]               ; 464A _ 8B. 0D, 00002248(d)
        mov     eax, dword [ebp+8H]                     ; 4650 _ 8B. 45, 08
        mov     edx, dword [eax+0CH]                    ; 4653 _ 8B. 50, 0C
        mov     eax, edx                                ; 4656 _ 89. D0
        shl     eax, 2                                  ; 4658 _ C1. E0, 02
        add     eax, edx                                ; 465B _ 01. D0
        shl     eax, 2                                  ; 465D _ C1. E0, 02
        add     eax, ecx                                ; 4660 _ 01. C8
        add     eax, 8                                  ; 4662 _ 83. C0, 08
        mov     dword [ebp-4H], eax                     ; 4665 _ 89. 45, FC
        mov     dword [ebp-8H], 0                       ; 4668 _ C7. 45, F8, 00000000
        jmp     ?_246                                   ; 466F _ EB, 23

?_244:  mov     eax, dword [ebp-4H]                     ; 4671 _ 8B. 45, FC
        mov     edx, dword [ebp-8H]                     ; 4674 _ 8B. 55, F8
        mov     eax, dword [eax+edx*4+8H]               ; 4677 _ 8B. 44 90, 08
        cmp     eax, dword [ebp+8H]                     ; 467B _ 3B. 45, 08
        jnz     ?_245                                   ; 467E _ 75, 10
        mov     eax, dword [ebp-4H]                     ; 4680 _ 8B. 45, FC
        mov     edx, dword [ebp-8H]                     ; 4683 _ 8B. 55, F8
        mov     dword [eax+edx*4+8H], 0                 ; 4686 _ C7. 44 90, 08, 00000000
        jmp     ?_247                                   ; 468E _ EB, 0E

?_245:  add     dword [ebp-8H], 1                       ; 4690 _ 83. 45, F8, 01
?_246:  mov     eax, dword [ebp-4H]                     ; 4694 _ 8B. 45, FC
        mov     eax, dword [eax]                        ; 4697 _ 8B. 00
        cmp     eax, dword [ebp-8H]                     ; 4699 _ 3B. 45, F8
        jg      ?_244                                   ; 469C _ 7F, D3
?_247:  mov     eax, dword [ebp-4H]                     ; 469E _ 8B. 45, FC
        mov     eax, dword [eax]                        ; 46A1 _ 8B. 00
        lea     edx, [eax-1H]                           ; 46A3 _ 8D. 50, FF
        mov     eax, dword [ebp-4H]                     ; 46A6 _ 8B. 45, FC
        mov     dword [eax], edx                        ; 46A9 _ 89. 10
        mov     eax, dword [ebp-4H]                     ; 46AB _ 8B. 45, FC
        mov     eax, dword [eax+4H]                     ; 46AE _ 8B. 40, 04
        cmp     eax, dword [ebp-8H]                     ; 46B1 _ 3B. 45, F8
        jle     ?_248                                   ; 46B4 _ 7E, 0F
        mov     eax, dword [ebp-4H]                     ; 46B6 _ 8B. 45, FC
        mov     eax, dword [eax+4H]                     ; 46B9 _ 8B. 40, 04
        lea     edx, [eax-1H]                           ; 46BC _ 8D. 50, FF
        mov     eax, dword [ebp-4H]                     ; 46BF _ 8B. 45, FC
        mov     dword [eax+4H], edx                     ; 46C2 _ 89. 50, 04
?_248:  mov     eax, dword [ebp-4H]                     ; 46C5 _ 8B. 45, FC
        mov     edx, dword [eax+4H]                     ; 46C8 _ 8B. 50, 04
        mov     eax, dword [ebp-4H]                     ; 46CB _ 8B. 45, FC
        mov     eax, dword [eax]                        ; 46CE _ 8B. 00
        cmp     edx, eax                                ; 46D0 _ 39. C2
        jl      ?_249                                   ; 46D2 _ 7C, 0A
        mov     eax, dword [ebp-4H]                     ; 46D4 _ 8B. 45, FC
        mov     dword [eax+4H], 0                       ; 46D7 _ C7. 40, 04, 00000000
?_249:  mov     eax, dword [ebp+8H]                     ; 46DE _ 8B. 45, 08
        mov     dword [eax+4H], 1                       ; 46E1 _ C7. 40, 04, 00000001
        jmp     ?_251                                   ; 46E8 _ EB, 1B

?_250:  mov     eax, dword [ebp-8H]                     ; 46EA _ 8B. 45, F8
        lea     edx, [eax+1H]                           ; 46ED _ 8D. 50, 01
        mov     eax, dword [ebp-4H]                     ; 46F0 _ 8B. 45, FC
        mov     ecx, dword [eax+edx*4+8H]               ; 46F3 _ 8B. 4C 90, 08
        mov     eax, dword [ebp-4H]                     ; 46F7 _ 8B. 45, FC
        mov     edx, dword [ebp-8H]                     ; 46FA _ 8B. 55, F8
        mov     dword [eax+edx*4+8H], ecx               ; 46FD _ 89. 4C 90, 08
        add     dword [ebp-8H], 1                       ; 4701 _ 83. 45, F8, 01
?_251:  mov     eax, dword [ebp-4H]                     ; 4705 _ 8B. 45, FC
        mov     eax, dword [eax]                        ; 4708 _ 8B. 00
        cmp     eax, dword [ebp-8H]                     ; 470A _ 3B. 45, F8
        jg      ?_250                                   ; 470D _ 7F, DB
        leave                                           ; 470F _ C9
        ret                                             ; 4710 _ C3
; task_remove End of function

task_switch_sub:; Function begin
        push    ebp                                     ; 4711 _ 55
        mov     ebp, esp                                ; 4712 _ 89. E5
        sub     esp, 16                                 ; 4714 _ 83. EC, 10
        mov     dword [ebp-4H], 0                       ; 4717 _ C7. 45, FC, 00000000
        jmp     ?_254                                   ; 471E _ EB, 24

?_252:  mov     ecx, dword [task_control]               ; 4720 _ 8B. 0D, 00002248(d)
        mov     edx, dword [ebp-4H]                     ; 4726 _ 8B. 55, FC
        mov     eax, edx                                ; 4729 _ 89. D0
        shl     eax, 2                                  ; 472B _ C1. E0, 02
        add     eax, edx                                ; 472E _ 01. D0
        shl     eax, 2                                  ; 4730 _ C1. E0, 02
        add     eax, ecx                                ; 4733 _ 01. C8
        add     eax, 8                                  ; 4735 _ 83. C0, 08
        mov     eax, dword [eax]                        ; 4738 _ 8B. 00
        test    eax, eax                                ; 473A _ 85. C0
        jle     ?_253                                   ; 473C _ 7E, 02
        jmp     ?_255                                   ; 473E _ EB, 0A

?_253:  add     dword [ebp-4H], 1                       ; 4740 _ 83. 45, FC, 01
?_254:  cmp     dword [ebp-4H], 2                       ; 4744 _ 83. 7D, FC, 02
        jle     ?_252                                   ; 4748 _ 7E, D6
?_255:  mov     eax, dword [task_control]               ; 474A _ A1, 00002248(d)
        mov     edx, dword [ebp-4H]                     ; 474F _ 8B. 55, FC
        mov     dword [eax], edx                        ; 4752 _ 89. 10
        mov     eax, dword [task_control]               ; 4754 _ A1, 00002248(d)
        mov     dword [eax+4H], 0                       ; 4759 _ C7. 40, 04, 00000000
        leave                                           ; 4760 _ C9
        ret                                             ; 4761 _ C3
; task_switch_sub End of function

task_send_message:; Function begin
        push    ebp                                     ; 4762 _ 55
        mov     ebp, esp                                ; 4763 _ 89. E5
        sub     esp, 24                                 ; 4765 _ 83. EC, 18
        mov     eax, dword [ebp+10H]                    ; 4768 _ 8B. 45, 10
        movzx   eax, al                                 ; 476B _ 0F B6. C0
        mov     edx, dword [ebp+0CH]                    ; 476E _ 8B. 55, 0C
        add     edx, 16                                 ; 4771 _ 83. C2, 10
        mov     dword [esp+4H], eax                     ; 4774 _ 89. 44 24, 04
        mov     dword [esp], edx                        ; 4778 _ 89. 14 24
        call    fifo8_put                               ; 477B _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 4780 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 4783 _ 89. 04 24
        call    task_sleep                              ; 4786 _ E8, FFFFFFFC(rel)
        leave                                           ; 478B _ C9
        ret                                             ; 478C _ C3
; task_send_message End of function



?_256:                                                  ; byte
        db 77H, 69H, 6EH, 64H, 6FH, 77H, 00H            ; 0000 _ window.

?_257:                                                  ; byte
        db 63H, 6FH, 6EH, 73H, 6FH, 6CH, 65H, 00H       ; 0007 _ console.

?_258:                                                  ; byte
        db 65H, 6EH, 74H, 65H, 72H, 20H, 74H, 61H       ; 000F _ enter ta
        db 73H, 6BH, 20H, 62H, 00H                      ; 0017 _ sk b.

?_259:                                                  ; byte
        db 42H, 00H                                     ; 001C _ B.

?_260:                                                  ; byte
        db 70H, 61H, 67H, 65H, 20H, 69H, 73H, 3AH       ; 001E _ page is:
        db 20H, 00H                                     ; 0026 _  .

?_261:                                                  ; byte
        db 42H, 61H, 73H, 65H, 41H, 64H, 64H, 72H       ; 0028 _ BaseAddr
        db 4CH, 3AH, 20H, 00H                           ; 0030 _ L: .

?_262:                                                  ; byte
        db 42H, 61H, 73H, 65H, 41H, 64H, 64H, 72H       ; 0034 _ BaseAddr
        db 48H, 3AH, 20H, 00H                           ; 003C _ H: .

?_263:                                                  ; byte
        db 6CH, 65H, 6EH, 67H, 74H, 68H, 4CH, 6FH       ; 0040 _ lengthLo
        db 77H, 3AH, 20H, 00H                           ; 0048 _ w: .

?_264:                                                  ; byte
        db 6CH, 65H, 6EH, 67H, 74H, 68H, 48H, 69H       ; 004C _ lengthHi
        db 67H, 68H, 3AH, 20H, 00H                      ; 0054 _ gh: .

?_265:                                                  ; byte
        db 74H, 79H, 70H, 65H, 3AH, 20H, 00H            ; 0059 _ type: .

?_266:                                                  ; byte
        db 3EH, 00H                                     ; 0060 _ >.

?_267:                                                  ; byte
        db 6DH, 65H, 6DH, 00H                           ; 0062 _ mem.

?_268:                                                  ; byte
        db 66H, 72H, 65H, 65H, 20H, 00H                 ; 0066 _ free .

?_269:                                                  ; byte
        db 20H, 4BH, 42H, 00H                           ; 006C _  KB.

?_270:                                                  ; byte
        db 63H, 6CH, 73H, 00H                           ; 0070 _ cls.

?_271:                                                  ; byte
        db 63H, 6FH, 6EH, 73H, 6FH, 6CH, 65H, 00H       ; 0074 _ console.



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

table_rgb.1765:                                         ; byte
        db 00H, 00H, 00H, 0FFH, 00H, 00H, 44H, 8CH      ; 0120 _ ......D.
        db 0BBH, 0FFH, 0FFH, 00H, 00H, 00H, 0FFH, 0FFH  ; 0128 _ ........
        db 00H, 0FFH, 00H, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH ; 0130 _ ........
        db 0C6H, 0C6H, 0C6H, 84H, 00H, 00H, 00H, 84H    ; 0138 _ ........
        db 00H, 84H, 84H, 00H, 00H, 00H, 84H, 84H       ; 0140 _ ........
        db 00H, 84H, 00H, 84H, 84H, 84H, 84H, 84H       ; 0148 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0150 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0158 _ ........

cursor.1833:                                            ; byte
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

closebtn.1920:                                          ; byte
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

?_272:  db 00H                                          ; 0342 _ .

?_273:  db 00H, 00H                                     ; 0343 _ ..



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

?_274:  resw    1                                       ; 00A4

?_275:  resw    13                                      ; 00A6

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

?_276:  resb    9                                       ; 02E1

?_277:  resb    22                                      ; 02EA

timer_control:                                          ; byte
        resd    2001                                    ; 0300

task_timer:                                             ; dword
        resd    1                                       ; 2244

task_control:                                           ; dword
        resd    1                                       ; 2248


