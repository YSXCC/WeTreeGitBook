; Disassembly of file: ckernel.o
; Mon Mar 16 11:27:35 2020
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
        mov     dword [esp+4H], ?_265                   ; 02DC _ C7. 44 24, 04, 00000000(d)
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
        mov     dword [esp+8H], ?_265                   ; 047D _ C7. 44 24, 08, 00000000(d)
        mov     dword [esp+4H], edx                     ; 0485 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0489 _ 89. 04 24
        call    make_window_title                       ; 048C _ E8, FFFFFFFC(rel)
        mov     eax, dword [sheet_control]              ; 0491 _ A1, 0000000C(d)
        mov     dword [esp+0CH], 1                      ; 0496 _ C7. 44 24, 0C, 00000001
        mov     dword [esp+8H], ?_266                   ; 049E _ C7. 44 24, 08, 00000007(d)
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
        mov     dword [esp+8H], ?_265                   ; 0506 _ C7. 44 24, 08, 00000000(d)
        mov     dword [esp+4H], edx                     ; 050E _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0512 _ 89. 04 24
        call    make_window_title                       ; 0515 _ E8, FFFFFFFC(rel)
        mov     eax, dword [sheet_control]              ; 051A _ A1, 0000000C(d)
        mov     dword [esp+0CH], 0                      ; 051F _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], ?_266                   ; 0527 _ C7. 44 24, 08, 00000007(d)
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
        mov     dword [esp+10H], ?_267                  ; 095F _ C7. 44 24, 10, 0000000F(d)
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
        mov     dword [esp+10H], ?_268                  ; 0A41 _ C7. 44 24, 10, 0000001C(d)
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
        movzx   eax, word [?_284]                       ; 0F51 _ 0F B7. 05, 000000A4(d)
        cwde                                            ; 0F58 _ 98
        mov     dword [ebp-8H], eax                     ; 0F59 _ 89. 45, F8
        movzx   eax, word [?_285]                       ; 0F5C _ 0F B7. 05, 000000A6(d)
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
?_048:  movzx   eax, word [?_284]                       ; 138A _ 0F B7. 05, 000000A4(d)
        cwde                                            ; 1391 _ 98
        lea     edx, [eax-10H]                          ; 1392 _ 8D. 50, F0
        mov     eax, dword [mouse_x]                    ; 1395 _ A1, 000001C8(d)
        cmp     edx, eax                                ; 139A _ 39. C2
        jge     ?_049                                   ; 139C _ 7D, 10
        movzx   eax, word [?_284]                       ; 139E _ 0F B7. 05, 000000A4(d)
        cwde                                            ; 13A5 _ 98
        sub     eax, 16                                 ; 13A6 _ 83. E8, 10
        mov     dword [mouse_x], eax                    ; 13A9 _ A3, 000001C8(d)
?_049:  movzx   eax, word [?_284]                       ; 13AE _ 0F B7. 05, 000000A4(d)
        cwde                                            ; 13B5 _ 98
        lea     edx, [eax-10H]                          ; 13B6 _ 8D. 50, F0
        mov     eax, dword [mouse_y]                    ; 13B9 _ A1, 000001CC(d)
        cmp     edx, eax                                ; 13BE _ 39. C2
        jge     ?_050                                   ; 13C0 _ 7D, 10
        movzx   eax, word [?_284]                       ; 13C2 _ 0F B7. 05, 000000A4(d)
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
        movzx   eax, word [?_284]                       ; 14A6 _ 0F B7. 05, 000000A4(d)
        cwde                                            ; 14AD _ 98
        mov     dword [ebp-28H], eax                    ; 14AE _ 89. 45, D8
        movzx   eax, word [?_285]                       ; 14B1 _ 0F B7. 05, 000000A6(d)
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
        mov     dword [esp+10H], ?_269                  ; 14DF _ C7. 44 24, 10, 0000001E(d)
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
        mov     dword [esp+10H], ?_270                  ; 1550 _ C7. 44 24, 10, 00000028(d)
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
        mov     dword [esp+10H], ?_271                  ; 15C3 _ C7. 44 24, 10, 00000034(d)
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
        mov     dword [esp+10H], ?_272                  ; 1637 _ C7. 44 24, 10, 00000040(d)
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
        mov     dword [esp+10H], ?_273                  ; 16AB _ C7. 44 24, 10, 0000004C(d)
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
        mov     dword [esp+10H], ?_274                  ; 171F _ C7. 44 24, 10, 00000059(d)
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
        sub     esp, 280                                ; 209C _ 81. EC, 00000118
        mov     eax, dword [ebp+8H]                     ; 20A2 _ 8B. 45, 08
        mov     dword [ebp-0FCH], eax                   ; 20A5 _ 89. 85, FFFFFF04
; Note: Absolute memory address without relocation
        mov     eax, dword [gs:14H]                     ; 20AB _ 65: A1, 00000014
        mov     dword [ebp-0CH], eax                    ; 20B1 _ 89. 45, F4
        xor     eax, eax                                ; 20B4 _ 31. C0
        mov     dword [ebp-0F0H], 70144                 ; 20B6 _ C7. 85, FFFFFF10, 00011200
        call    task_now                                ; 20C0 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0D0H], eax                   ; 20C5 _ 89. 85, FFFFFF30
        mov     dword [ebp-0ECH], 16                    ; 20CB _ C7. 85, FFFFFF14, 00000010
        mov     dword [ebp-0E8H], 28                    ; 20D5 _ C7. 85, FFFFFF18, 0000001C
        mov     dword [ebp-0E4H], 0                     ; 20DF _ C7. 85, FFFFFF1C, 00000000
        mov     dword [ebp-0E0H], 0                     ; 20E9 _ C7. 85, FFFFFF20, 00000000
        mov     dword [ebp-0DCH], 0                     ; 20F3 _ C7. 85, FFFFFF24, 00000000
        mov     eax, dword [ebp-0D0H]                   ; 20FD _ 8B. 85, FFFFFF30
        lea     edx, [eax+10H]                          ; 2103 _ 8D. 50, 10
        mov     eax, dword [ebp-0D0H]                   ; 2106 _ 8B. 85, FFFFFF30
        mov     dword [esp+0CH], eax                    ; 210C _ 89. 44 24, 0C
        lea     eax, [ebp-8CH]                          ; 2110 _ 8D. 85, FFFFFF74
        mov     dword [esp+8H], eax                     ; 2116 _ 89. 44 24, 08
        mov     dword [esp+4H], 128                     ; 211A _ C7. 44 24, 04, 00000080
        mov     dword [esp], edx                        ; 2122 _ 89. 14 24
        call    fifo8_init                              ; 2125 _ E8, FFFFFFFC(rel)
        call    timer_alloc                             ; 212A _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CCH], eax                   ; 212F _ 89. 85, FFFFFF34
        mov     eax, dword [ebp-0D0H]                   ; 2135 _ 8B. 85, FFFFFF30
        add     eax, 16                                 ; 213B _ 83. C0, 10
        mov     dword [esp+8H], 1                       ; 213E _ C7. 44 24, 08, 00000001
        mov     dword [esp+4H], eax                     ; 2146 _ 89. 44 24, 04
        mov     eax, dword [ebp-0CCH]                   ; 214A _ 8B. 85, FFFFFF34
        mov     dword [esp], eax                        ; 2150 _ 89. 04 24
        call    timer_init                              ; 2153 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 50                      ; 2158 _ C7. 44 24, 04, 00000032
        mov     eax, dword [ebp-0CCH]                   ; 2160 _ 8B. 85, FFFFFF34
        mov     dword [esp], eax                        ; 2166 _ 89. 04 24
        call    timer_settime                           ; 2169 _ E8, FFFFFFFC(rel)
        mov     eax, dword [sheet_control]              ; 216E _ A1, 00000000(d)
        mov     dword [esp+14H], 7                      ; 2173 _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_275                  ; 217B _ C7. 44 24, 10, 00000060(d)
        mov     dword [esp+0CH], 28                     ; 2183 _ C7. 44 24, 0C, 0000001C
        mov     dword [esp+8H], 8                       ; 218B _ C7. 44 24, 08, 00000008
        mov     edx, dword [ebp-0FCH]                   ; 2193 _ 8B. 95, FFFFFF04
        mov     dword [esp+4H], edx                     ; 2199 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 219D _ 89. 04 24
        call    paint_string                            ; 21A0 _ E8, FFFFFFFC(rel)
?_078:  call    io_cli                                  ; 21A5 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0D0H]                   ; 21AA _ 8B. 85, FFFFFF30
        add     eax, 16                                 ; 21B0 _ 83. C0, 10
        mov     dword [esp], eax                        ; 21B3 _ 89. 04 24
        call    fifo8_status                            ; 21B6 _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 21BB _ 85. C0
        jnz     ?_079                                   ; 21BD _ 75, 0A
        call    io_sti                                  ; 21BF _ E8, FFFFFFFC(rel)
        jmp     ?_103                                   ; 21C4 _ E9, 00000774

?_079:  mov     eax, dword [ebp-0D0H]                   ; 21C9 _ 8B. 85, FFFFFF30
        add     eax, 16                                 ; 21CF _ 83. C0, 10
        mov     dword [esp], eax                        ; 21D2 _ 89. 04 24
        call    fifo8_get                               ; 21D5 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0C8H], eax                   ; 21DA _ 89. 85, FFFFFF38
        call    io_sti                                  ; 21E0 _ E8, FFFFFFFC(rel)
        cmp     dword [ebp-0C8H], 1                     ; 21E5 _ 83. BD, FFFFFF38, 01
        jg      ?_082                                   ; 21EC _ 0F 8F, 0000008D
        cmp     dword [ebp-0E4H], 0                     ; 21F2 _ 83. BD, FFFFFF1C, 00
        js      ?_082                                   ; 21F9 _ 0F 88, 00000080
        cmp     dword [ebp-0C8H], 0                     ; 21FF _ 83. BD, FFFFFF38, 00
        jz      ?_080                                   ; 2206 _ 74, 2F
        mov     eax, dword [ebp-0D0H]                   ; 2208 _ 8B. 85, FFFFFF30
        add     eax, 16                                 ; 220E _ 83. C0, 10
        mov     dword [esp+8H], 0                       ; 2211 _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], eax                     ; 2219 _ 89. 44 24, 04
        mov     eax, dword [ebp-0CCH]                   ; 221D _ 8B. 85, FFFFFF34
        mov     dword [esp], eax                        ; 2223 _ 89. 04 24
        call    timer_init                              ; 2226 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0E4H], 7                     ; 222B _ C7. 85, FFFFFF1C, 00000007
        jmp     ?_081                                   ; 2235 _ EB, 2D

?_080:  mov     eax, dword [ebp-0D0H]                   ; 2237 _ 8B. 85, FFFFFF30
        add     eax, 16                                 ; 223D _ 83. C0, 10
        mov     dword [esp+8H], 1                       ; 2240 _ C7. 44 24, 08, 00000001
        mov     dword [esp+4H], eax                     ; 2248 _ 89. 44 24, 04
        mov     eax, dword [ebp-0CCH]                   ; 224C _ 8B. 85, FFFFFF34
        mov     dword [esp], eax                        ; 2252 _ 89. 04 24
        call    timer_init                              ; 2255 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0E4H], 0                     ; 225A _ C7. 85, FFFFFF1C, 00000000
?_081:  mov     dword [esp+4H], 50                      ; 2264 _ C7. 44 24, 04, 00000032
        mov     eax, dword [ebp-0CCH]                   ; 226C _ 8B. 85, FFFFFF34
        mov     dword [esp], eax                        ; 2272 _ 89. 04 24
        call    timer_settime                           ; 2275 _ E8, FFFFFFFC(rel)
        jmp     ?_102                                   ; 227A _ E9, 0000067B

?_082:  cmp     dword [ebp-0C8H], 87                    ; 227F _ 83. BD, FFFFFF38, 57
        jnz     ?_083                                   ; 2286 _ 75, 48
        mov     dword [ebp-0E4H], 7                     ; 2288 _ C7. 85, FFFFFF1C, 00000007
        mov     eax, dword [ebp-0D0H]                   ; 2292 _ 8B. 85, FFFFFF30
        add     eax, 16                                 ; 2298 _ 83. C0, 10
        mov     dword [esp+8H], 0                       ; 229B _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], eax                     ; 22A3 _ 89. 44 24, 04
        mov     eax, dword [ebp-0CCH]                   ; 22A7 _ 8B. 85, FFFFFF34
        mov     dword [esp], eax                        ; 22AD _ 89. 04 24
        call    timer_init                              ; 22B0 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 50                      ; 22B5 _ C7. 44 24, 04, 00000032
        mov     eax, dword [ebp-0CCH]                   ; 22BD _ 8B. 85, FFFFFF34
        mov     dword [esp], eax                        ; 22C3 _ 89. 04 24
        call    timer_settime                           ; 22C6 _ E8, FFFFFFFC(rel)
        jmp     ?_102                                   ; 22CB _ E9, 0000062A

?_083:  cmp     dword [ebp-0C8H], 88                    ; 22D0 _ 83. BD, FFFFFF38, 58
        jnz     ?_084                                   ; 22D7 _ 75, 5F
        mov     eax, dword [sheet_control]              ; 22D9 _ A1, 00000000(d)
        mov     dword [esp+10H], 0                      ; 22DE _ C7. 44 24, 10, 00000000
        mov     edx, dword [ebp-0E8H]                   ; 22E6 _ 8B. 95, FFFFFF18
        mov     dword [esp+0CH], edx                    ; 22EC _ 89. 54 24, 0C
        mov     edx, dword [ebp-0ECH]                   ; 22F0 _ 8B. 95, FFFFFF14
        mov     dword [esp+8H], edx                     ; 22F6 _ 89. 54 24, 08
        mov     edx, dword [ebp-0FCH]                   ; 22FA _ 8B. 95, FFFFFF04
        mov     dword [esp+4H], edx                     ; 2300 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 2304 _ 89. 04 24
        call    set_cursor                              ; 2307 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0E4H], -1                    ; 230C _ C7. 85, FFFFFF1C, FFFFFFFF
        mov     eax, dword [task_main]                  ; 2316 _ A1, 00000000(d)
        mov     dword [esp+8H], 0                       ; 231B _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], -1                      ; 2323 _ C7. 44 24, 04, FFFFFFFF
        mov     dword [esp], eax                        ; 232B _ 89. 04 24
        call    task_run                                ; 232E _ E8, FFFFFFFC(rel)
        jmp     ?_102                                   ; 2333 _ E9, 000005C2

?_084:  cmp     dword [ebp-0C8H], 28                    ; 2338 _ 83. BD, FFFFFF38, 1C
        jne     ?_100                                   ; 233F _ 0F 85, 00000453
        mov     eax, dword [sheet_control]              ; 2345 _ A1, 00000000(d)
        mov     dword [esp+10H], 0                      ; 234A _ C7. 44 24, 10, 00000000
        mov     edx, dword [ebp-0E8H]                   ; 2352 _ 8B. 95, FFFFFF18
        mov     dword [esp+0CH], edx                    ; 2358 _ 89. 54 24, 0C
        mov     edx, dword [ebp-0ECH]                   ; 235C _ 8B. 95, FFFFFF14
        mov     dword [esp+8H], edx                     ; 2362 _ 89. 54 24, 08
        mov     edx, dword [ebp-0FCH]                   ; 2366 _ 8B. 95, FFFFFF04
        mov     dword [esp+4H], edx                     ; 236C _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 2370 _ 89. 04 24
        call    set_cursor                              ; 2373 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0ECH]                   ; 2378 _ 8B. 85, FFFFFF14
        lea     edx, [eax+7H]                           ; 237E _ 8D. 50, 07
        test    eax, eax                                ; 2381 _ 85. C0
        cmovs   eax, edx                                ; 2383 _ 0F 48. C2
        sar     eax, 3                                  ; 2386 _ C1. F8, 03
        sub     eax, 2                                  ; 2389 _ 83. E8, 02
        mov     byte [ebp+eax-0AAH], 0                  ; 238C _ C6. 84 05, FFFFFF56, 00
        mov     eax, dword [ebp-0FCH]                   ; 2394 _ 8B. 85, FFFFFF04
        mov     dword [esp+4H], eax                     ; 239A _ 89. 44 24, 04
        mov     eax, dword [ebp-0E8H]                   ; 239E _ 8B. 85, FFFFFF18
        mov     dword [esp], eax                        ; 23A4 _ 89. 04 24
        call    console_new_line                        ; 23A7 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0E8H], eax                   ; 23AC _ 89. 85, FFFFFF18
        mov     dword [esp+4H], ?_276                   ; 23B2 _ C7. 44 24, 04, 00000062(d)
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
        mov     dword [ebp-0C4H], eax                   ; 23EA _ 89. 85, FFFFFF3C
        mov     eax, dword [sheet_control]              ; 23F0 _ A1, 00000000(d)
        mov     dword [esp+14H], 7                      ; 23F5 _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_277                  ; 23FD _ C7. 44 24, 10, 00000066(d)
        mov     edx, dword [ebp-0E8H]                   ; 2405 _ 8B. 95, FFFFFF18
        mov     dword [esp+0CH], edx                    ; 240B _ 89. 54 24, 0C
        mov     dword [esp+8H], 16                      ; 240F _ C7. 44 24, 08, 00000010
        mov     edx, dword [ebp-0FCH]                   ; 2417 _ 8B. 95, FFFFFF04
        mov     dword [esp+4H], edx                     ; 241D _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 2421 _ 89. 04 24
        call    paint_string                            ; 2424 _ E8, FFFFFFFC(rel)
        mov     eax, dword [sheet_control]              ; 2429 _ A1, 00000000(d)
        mov     dword [esp+14H], 7                      ; 242E _ C7. 44 24, 14, 00000007
        mov     edx, dword [ebp-0C4H]                   ; 2436 _ 8B. 95, FFFFFF3C
        mov     dword [esp+10H], edx                    ; 243C _ 89. 54 24, 10
        mov     edx, dword [ebp-0E8H]                   ; 2440 _ 8B. 95, FFFFFF18
        mov     dword [esp+0CH], edx                    ; 2446 _ 89. 54 24, 0C
        mov     dword [esp+8H], 52                      ; 244A _ C7. 44 24, 08, 00000034
        mov     edx, dword [ebp-0FCH]                   ; 2452 _ 8B. 95, FFFFFF04
        mov     dword [esp+4H], edx                     ; 2458 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 245C _ 89. 04 24
        call    paint_string                            ; 245F _ E8, FFFFFFFC(rel)
        mov     eax, dword [sheet_control]              ; 2464 _ A1, 00000000(d)
        mov     dword [esp+14H], 7                      ; 2469 _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_278                  ; 2471 _ C7. 44 24, 10, 0000006C(d)
        mov     edx, dword [ebp-0E8H]                   ; 2479 _ 8B. 95, FFFFFF18
        mov     dword [esp+0CH], edx                    ; 247F _ 89. 54 24, 0C
        mov     dword [esp+8H], 126                     ; 2483 _ C7. 44 24, 08, 0000007E
        mov     edx, dword [ebp-0FCH]                   ; 248B _ 8B. 95, FFFFFF04
        mov     dword [esp+4H], edx                     ; 2491 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 2495 _ 89. 04 24
        call    paint_string                            ; 2498 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0FCH]                   ; 249D _ 8B. 85, FFFFFF04
        mov     dword [esp+4H], eax                     ; 24A3 _ 89. 44 24, 04
        mov     eax, dword [ebp-0E8H]                   ; 24A7 _ 8B. 85, FFFFFF18
        mov     dword [esp], eax                        ; 24AD _ 89. 04 24
        call    console_new_line                        ; 24B0 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0E8H], eax                   ; 24B5 _ 89. 85, FFFFFF18
        jmp     ?_099                                   ; 24BB _ E9, 000002C9

?_085:  mov     dword [esp+4H], ?_279                   ; 24C0 _ C7. 44 24, 04, 00000070(d)
        lea     eax, [ebp-0AAH]                         ; 24C8 _ 8D. 85, FFFFFF56
        mov     dword [esp], eax                        ; 24CE _ 89. 04 24
        call    strcmp                                  ; 24D1 _ E8, FFFFFFFC(rel)
        cmp     eax, 1                                  ; 24D6 _ 83. F8, 01
        jne     ?_090                                   ; 24D9 _ 0F 85, 000000E2
        mov     dword [ebp-0DCH], 28                    ; 24DF _ C7. 85, FFFFFF24, 0000001C
        jmp     ?_089                                   ; 24E9 _ EB, 4D

?_086:  mov     dword [ebp-0E0H], 8                     ; 24EB _ C7. 85, FFFFFF20, 00000008
        jmp     ?_088                                   ; 24F5 _ EB, 2E

?_087:  mov     eax, dword [ebp-0FCH]                   ; 24F7 _ 8B. 85, FFFFFF04
        mov     edx, dword [eax]                        ; 24FD _ 8B. 10
        mov     eax, dword [ebp-0FCH]                   ; 24FF _ 8B. 85, FFFFFF04
        mov     eax, dword [eax+4H]                     ; 2505 _ 8B. 40, 04
        imul    eax, dword [ebp-0DCH]                   ; 2508 _ 0F AF. 85, FFFFFF24
        mov     ecx, eax                                ; 250F _ 89. C1
        mov     eax, dword [ebp-0E0H]                   ; 2511 _ 8B. 85, FFFFFF20
        add     eax, ecx                                ; 2517 _ 01. C8
        add     eax, edx                                ; 2519 _ 01. D0
        mov     byte [eax], 0                           ; 251B _ C6. 00, 00
        add     dword [ebp-0E0H], 1                     ; 251E _ 83. 85, FFFFFF20, 01
?_088:  cmp     dword [ebp-0E0H], 247                   ; 2525 _ 81. BD, FFFFFF20, 000000F7
        jle     ?_087                                   ; 252F _ 7E, C6
        add     dword [ebp-0DCH], 1                     ; 2531 _ 83. 85, FFFFFF24, 01
?_089:  cmp     dword [ebp-0DCH], 155                   ; 2538 _ 81. BD, FFFFFF24, 0000009B
        jle     ?_086                                   ; 2542 _ 7E, A7
        mov     eax, dword [sheet_control]              ; 2544 _ A1, 00000000(d)
        mov     dword [esp+14H], 156                    ; 2549 _ C7. 44 24, 14, 0000009C
        mov     dword [esp+10H], 248                    ; 2551 _ C7. 44 24, 10, 000000F8
        mov     dword [esp+0CH], 28                     ; 2559 _ C7. 44 24, 0C, 0000001C
        mov     dword [esp+8H], 8                       ; 2561 _ C7. 44 24, 08, 00000008
        mov     edx, dword [ebp-0FCH]                   ; 2569 _ 8B. 95, FFFFFF04
        mov     dword [esp+4H], edx                     ; 256F _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 2573 _ 89. 04 24
        call    sheet_refresh                           ; 2576 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0E8H], 28                    ; 257B _ C7. 85, FFFFFF18, 0000001C
        mov     eax, dword [sheet_control]              ; 2585 _ A1, 00000000(d)
        mov     dword [esp+14H], 7                      ; 258A _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_275                  ; 2592 _ C7. 44 24, 10, 00000060(d)
        mov     dword [esp+0CH], 28                     ; 259A _ C7. 44 24, 0C, 0000001C
        mov     dword [esp+8H], 8                       ; 25A2 _ C7. 44 24, 08, 00000008
        mov     edx, dword [ebp-0FCH]                   ; 25AA _ 8B. 95, FFFFFF04
        mov     dword [esp+4H], edx                     ; 25B0 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 25B4 _ 89. 04 24
        call    paint_string                            ; 25B7 _ E8, FFFFFFFC(rel)
        jmp     ?_099                                   ; 25BC _ E9, 000001C8

?_090:  mov     dword [esp+4H], ?_280                   ; 25C1 _ C7. 44 24, 04, 00000074(d)
        lea     eax, [ebp-0AAH]                         ; 25C9 _ 8D. 85, FFFFFF56
        mov     dword [esp], eax                        ; 25CF _ 89. 04 24
        call    strcmp                                  ; 25D2 _ E8, FFFFFFFC(rel)
        cmp     eax, 1                                  ; 25D7 _ 83. F8, 01
        jne     ?_099                                   ; 25DA _ 0F 85, 000001A9
        jmp     ?_098                                   ; 25E0 _ E9, 00000189

?_091:  mov     byte [ebp-0ABH], 0                      ; 25E5 _ C6. 85, FFFFFF55, 00
        mov     dword [ebp-0D8H], 0                     ; 25EC _ C7. 85, FFFFFF28, 00000000
        jmp     ?_094                                   ; 25F6 _ EB, 41

?_092:  mov     edx, dword [ebp-0F0H]                   ; 25F8 _ 8B. 95, FFFFFF10
        mov     eax, dword [ebp-0D8H]                   ; 25FE _ 8B. 85, FFFFFF28
        add     eax, edx                                ; 2604 _ 01. D0
        movzx   eax, byte [eax]                         ; 2606 _ 0F B6. 00
        test    al, al                                  ; 2609 _ 84. C0
        jz      ?_093                                   ; 260B _ 74, 2A
        mov     edx, dword [ebp-0F0H]                   ; 260D _ 8B. 95, FFFFFF10
        mov     eax, dword [ebp-0D8H]                   ; 2613 _ 8B. 85, FFFFFF28
        add     eax, edx                                ; 2619 _ 01. D0
        movzx   eax, byte [eax]                         ; 261B _ 0F B6. 00
        lea     ecx, [ebp-0B7H]                         ; 261E _ 8D. 8D, FFFFFF49
        mov     edx, dword [ebp-0D8H]                   ; 2624 _ 8B. 95, FFFFFF28
        add     edx, ecx                                ; 262A _ 01. CA
        mov     byte [edx], al                          ; 262C _ 88. 02
        add     dword [ebp-0D8H], 1                     ; 262E _ 83. 85, FFFFFF28, 01
        jmp     ?_094                                   ; 2635 _ EB, 02

?_093:  jmp     ?_095                                   ; 2637 _ EB, 09

?_094:  cmp     dword [ebp-0D8H], 7                     ; 2639 _ 83. BD, FFFFFF28, 07
        jle     ?_092                                   ; 2640 _ 7E, B6
?_095:  lea     edx, [ebp-0B7H]                         ; 2642 _ 8D. 95, FFFFFF49
        mov     eax, dword [ebp-0D8H]                   ; 2648 _ 8B. 85, FFFFFF28
        add     eax, edx                                ; 264E _ 01. D0
        mov     byte [eax], 46                          ; 2650 _ C6. 00, 2E
        add     dword [ebp-0D8H], 1                     ; 2653 _ 83. 85, FFFFFF28, 01
        mov     dword [ebp-0D4H], 0                     ; 265A _ C7. 85, FFFFFF2C, 00000000
        jmp     ?_097                                   ; 2664 _ EB, 30

?_096:  mov     edx, dword [ebp-0F0H]                   ; 2666 _ 8B. 95, FFFFFF10
        mov     eax, dword [ebp-0D4H]                   ; 266C _ 8B. 85, FFFFFF2C
        add     eax, edx                                ; 2672 _ 01. D0
        movzx   eax, byte [eax+8H]                      ; 2674 _ 0F B6. 40, 08
        lea     ecx, [ebp-0B7H]                         ; 2678 _ 8D. 8D, FFFFFF49
        mov     edx, dword [ebp-0D8H]                   ; 267E _ 8B. 95, FFFFFF28
        add     edx, ecx                                ; 2684 _ 01. CA
        mov     byte [edx], al                          ; 2686 _ 88. 02
        add     dword [ebp-0D8H], 1                     ; 2688 _ 83. 85, FFFFFF28, 01
        add     dword [ebp-0D4H], 1                     ; 268F _ 83. 85, FFFFFF2C, 01
?_097:  cmp     dword [ebp-0D4H], 2                     ; 2696 _ 83. BD, FFFFFF2C, 02
        jle     ?_096                                   ; 269D _ 7E, C7
        lea     edx, [ebp-0B7H]                         ; 269F _ 8D. 95, FFFFFF49
        mov     eax, dword [ebp-0D8H]                   ; 26A5 _ 8B. 85, FFFFFF28
        add     eax, edx                                ; 26AB _ 01. D0
        mov     byte [eax], 0                           ; 26AD _ C6. 00, 00
        mov     eax, dword [sheet_control]              ; 26B0 _ A1, 00000000(d)
        mov     dword [esp+14H], 7                      ; 26B5 _ C7. 44 24, 14, 00000007
        lea     edx, [ebp-0B7H]                         ; 26BD _ 8D. 95, FFFFFF49
        mov     dword [esp+10H], edx                    ; 26C3 _ 89. 54 24, 10
        mov     edx, dword [ebp-0E8H]                   ; 26C7 _ 8B. 95, FFFFFF18
        mov     dword [esp+0CH], edx                    ; 26CD _ 89. 54 24, 0C
        mov     dword [esp+8H], 16                      ; 26D1 _ C7. 44 24, 08, 00000010
        mov     edx, dword [ebp-0FCH]                   ; 26D9 _ 8B. 95, FFFFFF04
        mov     dword [esp+4H], edx                     ; 26DF _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 26E3 _ 89. 04 24
        call    paint_string                            ; 26E6 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0C0H], 136                   ; 26EB _ C7. 85, FFFFFF40, 00000088
        mov     eax, dword [ebp-0F0H]                   ; 26F5 _ 8B. 85, FFFFFF10
        mov     eax, dword [eax+1CH]                    ; 26FB _ 8B. 40, 1C
        mov     dword [esp], eax                        ; 26FE _ 89. 04 24
        call    intToHexStr                             ; 2701 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0BCH], eax                   ; 2706 _ 89. 85, FFFFFF44
        mov     eax, dword [sheet_control]              ; 270C _ A1, 00000000(d)
        mov     dword [esp+14H], 7                      ; 2711 _ C7. 44 24, 14, 00000007
        mov     edx, dword [ebp-0BCH]                   ; 2719 _ 8B. 95, FFFFFF44
        mov     dword [esp+10H], edx                    ; 271F _ 89. 54 24, 10
        mov     edx, dword [ebp-0E8H]                   ; 2723 _ 8B. 95, FFFFFF18
        mov     dword [esp+0CH], edx                    ; 2729 _ 89. 54 24, 0C
        mov     edx, dword [ebp-0C0H]                   ; 272D _ 8B. 95, FFFFFF40
        mov     dword [esp+8H], edx                     ; 2733 _ 89. 54 24, 08
        mov     edx, dword [ebp-0FCH]                   ; 2737 _ 8B. 95, FFFFFF04
        mov     dword [esp+4H], edx                     ; 273D _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 2741 _ 89. 04 24
        call    paint_string                            ; 2744 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0FCH]                   ; 2749 _ 8B. 85, FFFFFF04
        mov     dword [esp+4H], eax                     ; 274F _ 89. 44 24, 04
        mov     eax, dword [ebp-0E8H]                   ; 2753 _ 8B. 85, FFFFFF18
        mov     dword [esp], eax                        ; 2759 _ 89. 04 24
        call    console_new_line                        ; 275C _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0E8H], eax                   ; 2761 _ 89. 85, FFFFFF18
        add     dword [ebp-0F0H], 32                    ; 2767 _ 83. 85, FFFFFF10, 20
?_098:  mov     eax, dword [ebp-0F0H]                   ; 276E _ 8B. 85, FFFFFF10
        movzx   eax, byte [eax]                         ; 2774 _ 0F B6. 00
        test    al, al                                  ; 2777 _ 84. C0
        jne     ?_091                                   ; 2779 _ 0F 85, FFFFFE66
        mov     dword [ebp-0F0H], 70144                 ; 277F _ C7. 85, FFFFFF10, 00011200
?_099:  mov     dword [ebp-0ECH], 16                    ; 2789 _ C7. 85, FFFFFF14, 00000010
        jmp     ?_102                                   ; 2793 _ E9, 00000162

?_100:  cmp     dword [ebp-0C8H], 14                    ; 2798 _ 83. BD, FFFFFF38, 0E
        jnz     ?_101                                   ; 279F _ 75, 7B
        cmp     dword [ebp-0ECH], 16                    ; 27A1 _ 83. BD, FFFFFF14, 10
        jle     ?_101                                   ; 27A8 _ 7E, 72
        mov     eax, dword [sheet_control]              ; 27AA _ A1, 00000000(d)
        mov     dword [esp+10H], 0                      ; 27AF _ C7. 44 24, 10, 00000000
        mov     edx, dword [ebp-0E8H]                   ; 27B7 _ 8B. 95, FFFFFF18
        mov     dword [esp+0CH], edx                    ; 27BD _ 89. 54 24, 0C
        mov     edx, dword [ebp-0ECH]                   ; 27C1 _ 8B. 95, FFFFFF14
        mov     dword [esp+8H], edx                     ; 27C7 _ 89. 54 24, 08
        mov     edx, dword [ebp-0FCH]                   ; 27CB _ 8B. 95, FFFFFF04
        mov     dword [esp+4H], edx                     ; 27D1 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 27D5 _ 89. 04 24
        call    set_cursor                              ; 27D8 _ E8, FFFFFFFC(rel)
        sub     dword [ebp-0ECH], 8                     ; 27DD _ 83. AD, FFFFFF14, 08
        mov     eax, dword [sheet_control]              ; 27E4 _ A1, 00000000(d)
        mov     dword [esp+10H], 0                      ; 27E9 _ C7. 44 24, 10, 00000000
        mov     edx, dword [ebp-0E8H]                   ; 27F1 _ 8B. 95, FFFFFF18
        mov     dword [esp+0CH], edx                    ; 27F7 _ 89. 54 24, 0C
        mov     edx, dword [ebp-0ECH]                   ; 27FB _ 8B. 95, FFFFFF14
        mov     dword [esp+8H], edx                     ; 2801 _ 89. 54 24, 08
        mov     edx, dword [ebp-0FCH]                   ; 2805 _ 8B. 95, FFFFFF04
        mov     dword [esp+4H], edx                     ; 280B _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 280F _ 89. 04 24
        call    set_cursor                              ; 2812 _ E8, FFFFFFFC(rel)
        jmp     ?_102                                   ; 2817 _ E9, 000000DE

?_101:  mov     eax, dword [ebp-0C8H]                   ; 281C _ 8B. 85, FFFFFF38
        mov     dword [esp], eax                        ; 2822 _ 89. 04 24
        call    transfer_scancode                       ; 2825 _ E8, FFFFFFFC(rel)
        mov     byte [ebp-0F3H], al                     ; 282A _ 88. 85, FFFFFF0D
        cmp     byte [ebp-0F3H], 0                      ; 2830 _ 80. BD, FFFFFF0D, 00
        je      ?_102                                   ; 2837 _ 0F 84, 000000BD
        cmp     dword [ebp-0ECH], 239                   ; 283D _ 81. BD, FFFFFF14, 000000EF
        jg      ?_102                                   ; 2847 _ 0F 8F, 000000AD
        mov     eax, dword [sheet_control]              ; 284D _ A1, 00000000(d)
        mov     dword [esp+10H], 0                      ; 2852 _ C7. 44 24, 10, 00000000
        mov     edx, dword [ebp-0E8H]                   ; 285A _ 8B. 95, FFFFFF18
        mov     dword [esp+0CH], edx                    ; 2860 _ 89. 54 24, 0C
        mov     edx, dword [ebp-0ECH]                   ; 2864 _ 8B. 95, FFFFFF14
        mov     dword [esp+8H], edx                     ; 286A _ 89. 54 24, 08
        mov     edx, dword [ebp-0FCH]                   ; 286E _ 8B. 95, FFFFFF04
        mov     dword [esp+4H], edx                     ; 2874 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 2878 _ 89. 04 24
        call    set_cursor                              ; 287B _ E8, FFFFFFFC(rel)
        movzx   eax, byte [ebp-0F3H]                    ; 2880 _ 0F B6. 85, FFFFFF0D
        mov     byte [ebp-0F2H], al                     ; 2887 _ 88. 85, FFFFFF0E
        mov     byte [ebp-0F1H], 0                      ; 288D _ C6. 85, FFFFFF0F, 00
        mov     eax, dword [ebp-0ECH]                   ; 2894 _ 8B. 85, FFFFFF14
        lea     edx, [eax+7H]                           ; 289A _ 8D. 50, 07
        test    eax, eax                                ; 289D _ 85. C0
        cmovs   eax, edx                                ; 289F _ 0F 48. C2
        sar     eax, 3                                  ; 28A2 _ C1. F8, 03
        lea     edx, [eax-2H]                           ; 28A5 _ 8D. 50, FE
        movzx   eax, byte [ebp-0F3H]                    ; 28A8 _ 0F B6. 85, FFFFFF0D
        mov     byte [ebp+edx-0AAH], al                 ; 28AF _ 88. 84 15, FFFFFF56
        mov     eax, dword [sheet_control]              ; 28B6 _ A1, 00000000(d)
        mov     dword [esp+14H], 7                      ; 28BB _ C7. 44 24, 14, 00000007
        lea     edx, [ebp-0F2H]                         ; 28C3 _ 8D. 95, FFFFFF0E
        mov     dword [esp+10H], edx                    ; 28C9 _ 89. 54 24, 10
        mov     edx, dword [ebp-0E8H]                   ; 28CD _ 8B. 95, FFFFFF18
        mov     dword [esp+0CH], edx                    ; 28D3 _ 89. 54 24, 0C
        mov     edx, dword [ebp-0ECH]                   ; 28D7 _ 8B. 95, FFFFFF14
        mov     dword [esp+8H], edx                     ; 28DD _ 89. 54 24, 08
        mov     edx, dword [ebp-0FCH]                   ; 28E1 _ 8B. 95, FFFFFF04
        mov     dword [esp+4H], edx                     ; 28E7 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 28EB _ 89. 04 24
        call    paint_string                            ; 28EE _ E8, FFFFFFFC(rel)
        add     dword [ebp-0ECH], 8                     ; 28F3 _ 83. 85, FFFFFF14, 08
?_102:  cmp     dword [ebp-0E4H], 0                     ; 28FA _ 83. BD, FFFFFF1C, 00
        js      ?_103                                   ; 2901 _ 78, 3A
        mov     eax, dword [sheet_control]              ; 2903 _ A1, 00000000(d)
        mov     edx, dword [ebp-0E4H]                   ; 2908 _ 8B. 95, FFFFFF1C
        mov     dword [esp+10H], edx                    ; 290E _ 89. 54 24, 10
        mov     edx, dword [ebp-0E8H]                   ; 2912 _ 8B. 95, FFFFFF18
        mov     dword [esp+0CH], edx                    ; 2918 _ 89. 54 24, 0C
        mov     edx, dword [ebp-0ECH]                   ; 291C _ 8B. 95, FFFFFF14
        mov     dword [esp+8H], edx                     ; 2922 _ 89. 54 24, 08
        mov     edx, dword [ebp-0FCH]                   ; 2926 _ 8B. 95, FFFFFF04
        mov     dword [esp+4H], edx                     ; 292C _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 2930 _ 89. 04 24
        call    set_cursor                              ; 2933 _ E8, FFFFFFFC(rel)
        jmp     ?_078                                   ; 2938 _ E9, FFFFF868

?_103:  jmp     ?_078                                   ; 293D _ E9, FFFFF863
; console_task End of function

launch_console:; Function begin
        push    ebp                                     ; 2942 _ 55
        mov     ebp, esp                                ; 2943 _ 89. E5
        push    ebx                                     ; 2945 _ 53
        sub     esp, 52                                 ; 2946 _ 83. EC, 34
        mov     eax, dword [sheet_control]              ; 2949 _ A1, 00000000(d)
        mov     dword [esp], eax                        ; 294E _ 89. 04 24
        call    sheet_alloc                             ; 2951 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-18H], eax                    ; 2956 _ 89. 45, E8
        mov     eax, dword [memman]                     ; 2959 _ A1, 00000000(d)
        mov     dword [esp+4H], 42240                   ; 295E _ C7. 44 24, 04, 0000A500
        mov     dword [esp], eax                        ; 2966 _ 89. 04 24
        call    memman_alloc_4k                         ; 2969 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-14H], eax                    ; 296E _ 89. 45, EC
        mov     dword [esp+10H], 99                     ; 2971 _ C7. 44 24, 10, 00000063
        mov     dword [esp+0CH], 165                    ; 2979 _ C7. 44 24, 0C, 000000A5
        mov     dword [esp+8H], 256                     ; 2981 _ C7. 44 24, 08, 00000100
        mov     eax, dword [ebp-14H]                    ; 2989 _ 8B. 45, EC
        mov     dword [esp+4H], eax                     ; 298C _ 89. 44 24, 04
        mov     eax, dword [ebp-18H]                    ; 2990 _ 8B. 45, E8
        mov     dword [esp], eax                        ; 2993 _ 89. 04 24
        call    sheet_setbuf                            ; 2996 _ E8, FFFFFFFC(rel)
        mov     eax, dword [sheet_control]              ; 299B _ A1, 00000000(d)
        mov     dword [esp+0CH], 0                      ; 29A0 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], ?_281                   ; 29A8 _ C7. 44 24, 08, 00000078(d)
        mov     edx, dword [ebp-18H]                    ; 29B0 _ 8B. 55, E8
        mov     dword [esp+4H], edx                     ; 29B3 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 29B7 _ 89. 04 24
        call    make_windows                            ; 29BA _ E8, FFFFFFFC(rel)
        mov     dword [esp+14H], 0                      ; 29BF _ C7. 44 24, 14, 00000000
        mov     dword [esp+10H], 128                    ; 29C7 _ C7. 44 24, 10, 00000080
        mov     dword [esp+0CH], 240                    ; 29CF _ C7. 44 24, 0C, 000000F0
        mov     dword [esp+8H], 28                      ; 29D7 _ C7. 44 24, 08, 0000001C
        mov     dword [esp+4H], 8                       ; 29DF _ C7. 44 24, 04, 00000008
        mov     eax, dword [ebp-18H]                    ; 29E7 _ 8B. 45, E8
        mov     dword [esp], eax                        ; 29EA _ 89. 04 24
        call    make_textbox                            ; 29ED _ E8, FFFFFFFC(rel)
        call    task_alloc                              ; 29F2 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 29F7 _ 89. 45, F0
        call    get_code32_addr                         ; 29FA _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 29FF _ 89. 45, F4
        mov     eax, dword [ebp-10H]                    ; 2A02 _ 8B. 45, F0
        mov     dword [eax+8CH], 0                      ; 2A05 _ C7. 80, 0000008C, 00000000
        mov     eax, dword [ebp-10H]                    ; 2A0F _ 8B. 45, F0
        mov     dword [eax+90H], 1073741824             ; 2A12 _ C7. 80, 00000090, 40000000
        mov     eax, console_task                       ; 2A1C _ B8, 00000000(d)
        sub     eax, dword [ebp-0CH]                    ; 2A21 _ 2B. 45, F4
        mov     edx, eax                                ; 2A24 _ 89. C2
        mov     eax, dword [ebp-10H]                    ; 2A26 _ 8B. 45, F0
        mov     dword [eax+4CH], edx                    ; 2A29 _ 89. 50, 4C
        mov     eax, dword [ebp-10H]                    ; 2A2C _ 8B. 45, F0
        mov     dword [eax+74H], 0                      ; 2A2F _ C7. 40, 74, 00000000
        mov     eax, dword [ebp-10H]                    ; 2A36 _ 8B. 45, F0
        mov     dword [eax+78H], 8                      ; 2A39 _ C7. 40, 78, 00000008
        mov     eax, dword [ebp-10H]                    ; 2A40 _ 8B. 45, F0
        mov     dword [eax+7CH], 48                     ; 2A43 _ C7. 40, 7C, 00000030
        mov     eax, dword [ebp-10H]                    ; 2A4A _ 8B. 45, F0
        mov     dword [eax+80H], 32                     ; 2A4D _ C7. 80, 00000080, 00000020
        mov     eax, dword [ebp-10H]                    ; 2A57 _ 8B. 45, F0
        mov     dword [eax+84H], 0                      ; 2A5A _ C7. 80, 00000084, 00000000
        mov     eax, dword [ebp-10H]                    ; 2A64 _ 8B. 45, F0
        mov     dword [eax+88H], 16                     ; 2A67 _ C7. 80, 00000088, 00000010
        mov     eax, dword [ebp-10H]                    ; 2A71 _ 8B. 45, F0
        mov     eax, dword [eax+64H]                    ; 2A74 _ 8B. 40, 64
        lea     edx, [eax-4H]                           ; 2A77 _ 8D. 50, FC
        mov     eax, dword [ebp-10H]                    ; 2A7A _ 8B. 45, F0
        mov     dword [eax+64H], edx                    ; 2A7D _ 89. 50, 64
        mov     eax, dword [ebp-10H]                    ; 2A80 _ 8B. 45, F0
        mov     eax, dword [eax+64H]                    ; 2A83 _ 8B. 40, 64
        add     eax, 4                                  ; 2A86 _ 83. C0, 04
        mov     edx, dword [ebp-18H]                    ; 2A89 _ 8B. 55, E8
        mov     dword [eax], edx                        ; 2A8C _ 89. 10
        mov     eax, dword [ebp-10H]                    ; 2A8E _ 8B. 45, F0
        mov     eax, dword [eax+64H]                    ; 2A91 _ 8B. 40, 64
        add     eax, 8                                  ; 2A94 _ 83. C0, 08
        mov     ebx, eax                                ; 2A97 _ 89. C3
        mov     eax, dword [memman]                     ; 2A99 _ A1, 00000000(d)
        mov     dword [esp], eax                        ; 2A9E _ 89. 04 24
        call    memman_total                            ; 2AA1 _ E8, FFFFFFFC(rel)
        mov     dword [ebx], eax                        ; 2AA6 _ 89. 03
        mov     dword [esp+8H], 5                       ; 2AA8 _ C7. 44 24, 08, 00000005
        mov     dword [esp+4H], 1                       ; 2AB0 _ C7. 44 24, 04, 00000001
        mov     eax, dword [ebp-10H]                    ; 2AB8 _ 8B. 45, F0
        mov     dword [esp], eax                        ; 2ABB _ 89. 04 24
        call    task_run                                ; 2ABE _ E8, FFFFFFFC(rel)
        mov     eax, dword [sheet_control]              ; 2AC3 _ A1, 00000000(d)
        mov     dword [esp+0CH], 4                      ; 2AC8 _ C7. 44 24, 0C, 00000004
        mov     dword [esp+8H], 32                      ; 2AD0 _ C7. 44 24, 08, 00000020
        mov     edx, dword [ebp-18H]                    ; 2AD8 _ 8B. 55, E8
        mov     dword [esp+4H], edx                     ; 2ADB _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 2ADF _ 89. 04 24
        call    sheet_slide                             ; 2AE2 _ E8, FFFFFFFC(rel)
        mov     eax, dword [sheet_control]              ; 2AE7 _ A1, 00000000(d)
        mov     dword [esp+8H], 1                       ; 2AEC _ C7. 44 24, 08, 00000001
        mov     edx, dword [ebp-18H]                    ; 2AF4 _ 8B. 55, E8
        mov     dword [esp+4H], edx                     ; 2AF7 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 2AFB _ 89. 04 24
        call    sheet_updown                            ; 2AFE _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 2B03 _ 8B. 45, F0
        mov     dword [task_console_g], eax             ; 2B06 _ A3, 00000000(d)
        mov     eax, dword [ebp-18H]                    ; 2B0B _ 8B. 45, E8
        add     esp, 52                                 ; 2B0E _ 83. C4, 34
        pop     ebx                                     ; 2B11 _ 5B
        pop     ebp                                     ; 2B12 _ 5D
        ret                                             ; 2B13 _ C3
; launch_console End of function

set_cursor:; Function begin
        push    ebp                                     ; 2B14 _ 55
        mov     ebp, esp                                ; 2B15 _ 89. E5
        push    esi                                     ; 2B17 _ 56
        push    ebx                                     ; 2B18 _ 53
        sub     esp, 32                                 ; 2B19 _ 83. EC, 20
        mov     eax, dword [ebp+14H]                    ; 2B1C _ 8B. 45, 14
        lea     esi, [eax+0FH]                          ; 2B1F _ 8D. 70, 0F
        mov     eax, dword [ebp+10H]                    ; 2B22 _ 8B. 45, 10
        lea     ebx, [eax+7H]                           ; 2B25 _ 8D. 58, 07
        mov     eax, dword [ebp+18H]                    ; 2B28 _ 8B. 45, 18
        movzx   ecx, al                                 ; 2B2B _ 0F B6. C8
        mov     eax, dword [ebp+0CH]                    ; 2B2E _ 8B. 45, 0C
        mov     edx, dword [eax+4H]                     ; 2B31 _ 8B. 50, 04
        mov     eax, dword [ebp+0CH]                    ; 2B34 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 2B37 _ 8B. 00
        mov     dword [esp+18H], esi                    ; 2B39 _ 89. 74 24, 18
        mov     dword [esp+14H], ebx                    ; 2B3D _ 89. 5C 24, 14
        mov     ebx, dword [ebp+14H]                    ; 2B41 _ 8B. 5D, 14
        mov     dword [esp+10H], ebx                    ; 2B44 _ 89. 5C 24, 10
        mov     ebx, dword [ebp+10H]                    ; 2B48 _ 8B. 5D, 10
        mov     dword [esp+0CH], ebx                    ; 2B4B _ 89. 5C 24, 0C
        mov     dword [esp+8H], ecx                     ; 2B4F _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 2B53 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 2B57 _ 89. 04 24
        call    paint_rectangle                         ; 2B5A _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+14H]                    ; 2B5F _ 8B. 45, 14
        lea     edx, [eax+10H]                          ; 2B62 _ 8D. 50, 10
        mov     eax, dword [ebp+10H]                    ; 2B65 _ 8B. 45, 10
        add     eax, 8                                  ; 2B68 _ 83. C0, 08
        mov     dword [esp+14H], edx                    ; 2B6B _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 2B6F _ 89. 44 24, 10
        mov     eax, dword [ebp+14H]                    ; 2B73 _ 8B. 45, 14
        mov     dword [esp+0CH], eax                    ; 2B76 _ 89. 44 24, 0C
        mov     eax, dword [ebp+10H]                    ; 2B7A _ 8B. 45, 10
        mov     dword [esp+8H], eax                     ; 2B7D _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 2B81 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 2B84 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2B88 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2B8B _ 89. 04 24
        call    sheet_refresh                           ; 2B8E _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 2B93 _ 83. C4, 20
        pop     ebx                                     ; 2B96 _ 5B
        pop     esi                                     ; 2B97 _ 5E
        pop     ebp                                     ; 2B98 _ 5D
        ret                                             ; 2B99 _ C3
; set_cursor End of function

console_new_line:; Function begin
        push    ebp                                     ; 2B9A _ 55
        mov     ebp, esp                                ; 2B9B _ 89. E5
        push    ebx                                     ; 2B9D _ 53
        sub     esp, 52                                 ; 2B9E _ 83. EC, 34
        cmp     dword [ebp+8H], 139                     ; 2BA1 _ 81. 7D, 08, 0000008B
        jg      ?_104                                   ; 2BA8 _ 7F, 09
        add     dword [ebp+8H], 16                      ; 2BAA _ 83. 45, 08, 10
        jmp     ?_113                                   ; 2BAE _ E9, 000000DF

?_104:  mov     dword [ebp-0CH], 28                     ; 2BB3 _ C7. 45, F4, 0000001C
        jmp     ?_108                                   ; 2BBA _ EB, 52

?_105:  mov     dword [ebp-10H], 8                      ; 2BBC _ C7. 45, F0, 00000008
        jmp     ?_107                                   ; 2BC3 _ EB, 3C

?_106:  mov     eax, dword [ebp+0CH]                    ; 2BC5 _ 8B. 45, 0C
        mov     edx, dword [eax]                        ; 2BC8 _ 8B. 10
        mov     eax, dword [ebp+0CH]                    ; 2BCA _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 2BCD _ 8B. 40, 04
        imul    eax, dword [ebp-0CH]                    ; 2BD0 _ 0F AF. 45, F4
        mov     ecx, eax                                ; 2BD4 _ 89. C1
        mov     eax, dword [ebp-10H]                    ; 2BD6 _ 8B. 45, F0
        add     eax, ecx                                ; 2BD9 _ 01. C8
        add     edx, eax                                ; 2BDB _ 01. C2
        mov     eax, dword [ebp+0CH]                    ; 2BDD _ 8B. 45, 0C
        mov     ecx, dword [eax]                        ; 2BE0 _ 8B. 08
        mov     eax, dword [ebp-0CH]                    ; 2BE2 _ 8B. 45, F4
        lea     ebx, [eax+10H]                          ; 2BE5 _ 8D. 58, 10
        mov     eax, dword [ebp+0CH]                    ; 2BE8 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 2BEB _ 8B. 40, 04
        imul    ebx, eax                                ; 2BEE _ 0F AF. D8
        mov     eax, dword [ebp-10H]                    ; 2BF1 _ 8B. 45, F0
        add     eax, ebx                                ; 2BF4 _ 01. D8
        add     eax, ecx                                ; 2BF6 _ 01. C8
        movzx   eax, byte [eax]                         ; 2BF8 _ 0F B6. 00
        mov     byte [edx], al                          ; 2BFB _ 88. 02
        add     dword [ebp-10H], 1                      ; 2BFD _ 83. 45, F0, 01
?_107:  cmp     dword [ebp-10H], 247                    ; 2C01 _ 81. 7D, F0, 000000F7
        jle     ?_106                                   ; 2C08 _ 7E, BB
        add     dword [ebp-0CH], 1                      ; 2C0A _ 83. 45, F4, 01
?_108:  cmp     dword [ebp-0CH], 139                    ; 2C0E _ 81. 7D, F4, 0000008B
        jle     ?_105                                   ; 2C15 _ 7E, A5
        mov     dword [ebp-0CH], 140                    ; 2C17 _ C7. 45, F4, 0000008C
        jmp     ?_112                                   ; 2C1E _ EB, 35

?_109:  mov     dword [ebp-10H], 8                      ; 2C20 _ C7. 45, F0, 00000008
        jmp     ?_111                                   ; 2C27 _ EB, 1F

?_110:  mov     eax, dword [ebp+0CH]                    ; 2C29 _ 8B. 45, 0C
        mov     edx, dword [eax]                        ; 2C2C _ 8B. 10
        mov     eax, dword [ebp+0CH]                    ; 2C2E _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 2C31 _ 8B. 40, 04
        imul    eax, dword [ebp-0CH]                    ; 2C34 _ 0F AF. 45, F4
        mov     ecx, eax                                ; 2C38 _ 89. C1
        mov     eax, dword [ebp-10H]                    ; 2C3A _ 8B. 45, F0
        add     eax, ecx                                ; 2C3D _ 01. C8
        add     eax, edx                                ; 2C3F _ 01. D0
        mov     byte [eax], 0                           ; 2C41 _ C6. 00, 00
        add     dword [ebp-10H], 1                      ; 2C44 _ 83. 45, F0, 01
?_111:  cmp     dword [ebp-10H], 247                    ; 2C48 _ 81. 7D, F0, 000000F7
        jle     ?_110                                   ; 2C4F _ 7E, D8
        add     dword [ebp-0CH], 1                      ; 2C51 _ 83. 45, F4, 01
?_112:  cmp     dword [ebp-0CH], 155                    ; 2C55 _ 81. 7D, F4, 0000009B
        jle     ?_109                                   ; 2C5C _ 7E, C2
        mov     eax, dword [sheet_control]              ; 2C5E _ A1, 00000000(d)
        mov     dword [esp+14H], 156                    ; 2C63 _ C7. 44 24, 14, 0000009C
        mov     dword [esp+10H], 248                    ; 2C6B _ C7. 44 24, 10, 000000F8
        mov     dword [esp+0CH], 28                     ; 2C73 _ C7. 44 24, 0C, 0000001C
        mov     dword [esp+8H], 8                       ; 2C7B _ C7. 44 24, 08, 00000008
        mov     edx, dword [ebp+0CH]                    ; 2C83 _ 8B. 55, 0C
        mov     dword [esp+4H], edx                     ; 2C86 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 2C8A _ 89. 04 24
        call    sheet_refresh                           ; 2C8D _ E8, FFFFFFFC(rel)
?_113:  mov     eax, dword [sheet_control]              ; 2C92 _ A1, 00000000(d)
        mov     dword [esp+14H], 7                      ; 2C97 _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_275                  ; 2C9F _ C7. 44 24, 10, 00000060(d)
        mov     edx, dword [ebp+8H]                     ; 2CA7 _ 8B. 55, 08
        mov     dword [esp+0CH], edx                    ; 2CAA _ 89. 54 24, 0C
        mov     dword [esp+8H], 8                       ; 2CAE _ C7. 44 24, 08, 00000008
        mov     edx, dword [ebp+0CH]                    ; 2CB6 _ 8B. 55, 0C
        mov     dword [esp+4H], edx                     ; 2CB9 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 2CBD _ 89. 04 24
        call    paint_string                            ; 2CC0 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 2CC5 _ 8B. 45, 08
        add     esp, 52                                 ; 2CC8 _ 83. C4, 34
        pop     ebx                                     ; 2CCB _ 5B
        pop     ebp                                     ; 2CCC _ 5D
        ret                                             ; 2CCD _ C3
; console_new_line End of function

strcmp: ; Function begin
        push    ebp                                     ; 2CCE _ 55
        mov     ebp, esp                                ; 2CCF _ 89. E5
        sub     esp, 16                                 ; 2CD1 _ 83. EC, 10
        cmp     dword [ebp+8H], 0                       ; 2CD4 _ 83. 7D, 08, 00
        jz      ?_114                                   ; 2CD8 _ 74, 06
        cmp     dword [ebp+0CH], 0                      ; 2CDA _ 83. 7D, 0C, 00
        jnz     ?_115                                   ; 2CDE _ 75, 0A
?_114:  mov     eax, 0                                  ; 2CE0 _ B8, 00000000
        jmp     ?_122                                   ; 2CE5 _ E9, 00000092

?_115:  mov     dword [ebp-4H], 0                       ; 2CEA _ C7. 45, FC, 00000000
        jmp     ?_118                                   ; 2CF1 _ EB, 25

?_116:  mov     edx, dword [ebp-4H]                     ; 2CF3 _ 8B. 55, FC
        mov     eax, dword [ebp+8H]                     ; 2CF6 _ 8B. 45, 08
        add     eax, edx                                ; 2CF9 _ 01. D0
        movzx   edx, byte [eax]                         ; 2CFB _ 0F B6. 10
        mov     ecx, dword [ebp-4H]                     ; 2CFE _ 8B. 4D, FC
        mov     eax, dword [ebp+0CH]                    ; 2D01 _ 8B. 45, 0C
        add     eax, ecx                                ; 2D04 _ 01. C8
        movzx   eax, byte [eax]                         ; 2D06 _ 0F B6. 00
        cmp     dl, al                                  ; 2D09 _ 38. C2
        jz      ?_117                                   ; 2D0B _ 74, 07
        mov     eax, 0                                  ; 2D0D _ B8, 00000000
        jmp     ?_122                                   ; 2D12 _ EB, 68

?_117:  add     dword [ebp-4H], 1                       ; 2D14 _ 83. 45, FC, 01
?_118:  mov     edx, dword [ebp-4H]                     ; 2D18 _ 8B. 55, FC
        mov     eax, dword [ebp+8H]                     ; 2D1B _ 8B. 45, 08
        add     eax, edx                                ; 2D1E _ 01. D0
        movzx   eax, byte [eax]                         ; 2D20 _ 0F B6. 00
        test    al, al                                  ; 2D23 _ 84. C0
        jz      ?_119                                   ; 2D25 _ 74, 06
        cmp     dword [ebp+0CH], 0                      ; 2D27 _ 83. 7D, 0C, 00
        jnz     ?_116                                   ; 2D2B _ 75, C6
?_119:  mov     edx, dword [ebp-4H]                     ; 2D2D _ 8B. 55, FC
        mov     eax, dword [ebp+8H]                     ; 2D30 _ 8B. 45, 08
        add     eax, edx                                ; 2D33 _ 01. D0
        movzx   eax, byte [eax]                         ; 2D35 _ 0F B6. 00
        test    al, al                                  ; 2D38 _ 84. C0
        jnz     ?_120                                   ; 2D3A _ 75, 16
        mov     edx, dword [ebp-4H]                     ; 2D3C _ 8B. 55, FC
        mov     eax, dword [ebp+0CH]                    ; 2D3F _ 8B. 45, 0C
        add     eax, edx                                ; 2D42 _ 01. D0
        movzx   eax, byte [eax]                         ; 2D44 _ 0F B6. 00
        test    al, al                                  ; 2D47 _ 84. C0
        jz      ?_120                                   ; 2D49 _ 74, 07
        mov     eax, 0                                  ; 2D4B _ B8, 00000000
        jmp     ?_122                                   ; 2D50 _ EB, 2A

?_120:  mov     edx, dword [ebp-4H]                     ; 2D52 _ 8B. 55, FC
        mov     eax, dword [ebp+8H]                     ; 2D55 _ 8B. 45, 08
        add     eax, edx                                ; 2D58 _ 01. D0
        movzx   eax, byte [eax]                         ; 2D5A _ 0F B6. 00
        test    al, al                                  ; 2D5D _ 84. C0
        jz      ?_121                                   ; 2D5F _ 74, 16
        mov     edx, dword [ebp-4H]                     ; 2D61 _ 8B. 55, FC
        mov     eax, dword [ebp+0CH]                    ; 2D64 _ 8B. 45, 0C
        add     eax, edx                                ; 2D67 _ 01. D0
        movzx   eax, byte [eax]                         ; 2D69 _ 0F B6. 00
        test    al, al                                  ; 2D6C _ 84. C0
        jz      ?_121                                   ; 2D6E _ 74, 07
        mov     eax, 0                                  ; 2D70 _ B8, 00000000
        jmp     ?_122                                   ; 2D75 _ EB, 05

?_121:  mov     eax, 1                                  ; 2D77 _ B8, 00000001
?_122:  leave                                           ; 2D7C _ C9
        ret                                             ; 2D7D _ C3
; strcmp End of function

wait_KBC_sendready:; Function begin
        push    ebp                                     ; 2D7E _ 55
        mov     ebp, esp                                ; 2D7F _ 89. E5
        sub     esp, 24                                 ; 2D81 _ 83. EC, 18
?_123:  mov     dword [esp], 100                        ; 2D84 _ C7. 04 24, 00000064
        call    io_in8                                  ; 2D8B _ E8, FFFFFFFC(rel)
        and     eax, 02H                                ; 2D90 _ 83. E0, 02
        test    eax, eax                                ; 2D93 _ 85. C0
        jnz     ?_124                                   ; 2D95 _ 75, 02
        jmp     ?_125                                   ; 2D97 _ EB, 02

?_124:  jmp     ?_123                                   ; 2D99 _ EB, E9

?_125:  leave                                           ; 2D9B _ C9
        ret                                             ; 2D9C _ C3
; wait_KBC_sendready End of function

init_keyboard:; Function begin
        push    ebp                                     ; 2D9D _ 55
        mov     ebp, esp                                ; 2D9E _ 89. E5
        sub     esp, 24                                 ; 2DA0 _ 83. EC, 18
        call    wait_KBC_sendready                      ; 2DA3 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 96                      ; 2DA8 _ C7. 44 24, 04, 00000060
        mov     dword [esp], 100                        ; 2DB0 _ C7. 04 24, 00000064
        call    io_out8                                 ; 2DB7 _ E8, FFFFFFFC(rel)
        call    wait_KBC_sendready                      ; 2DBC _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 71                      ; 2DC1 _ C7. 44 24, 04, 00000047
        mov     dword [esp], 96                         ; 2DC9 _ C7. 04 24, 00000060
        call    io_out8                                 ; 2DD0 _ E8, FFFFFFFC(rel)
        leave                                           ; 2DD5 _ C9
        ret                                             ; 2DD6 _ C3
; init_keyboard End of function

enable_mouse:; Function begin
        push    ebp                                     ; 2DD7 _ 55
        mov     ebp, esp                                ; 2DD8 _ 89. E5
        sub     esp, 24                                 ; 2DDA _ 83. EC, 18
        call    wait_KBC_sendready                      ; 2DDD _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 212                     ; 2DE2 _ C7. 44 24, 04, 000000D4
        mov     dword [esp], 100                        ; 2DEA _ C7. 04 24, 00000064
        call    io_out8                                 ; 2DF1 _ E8, FFFFFFFC(rel)
        call    wait_KBC_sendready                      ; 2DF6 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 244                     ; 2DFB _ C7. 44 24, 04, 000000F4
        mov     dword [esp], 96                         ; 2E03 _ C7. 04 24, 00000060
        call    io_out8                                 ; 2E0A _ E8, FFFFFFFC(rel)
        leave                                           ; 2E0F _ C9
        ret                                             ; 2E10 _ C3
; enable_mouse End of function

mouse_decode:; Function begin
        push    ebp                                     ; 2E11 _ 55
        mov     ebp, esp                                ; 2E12 _ 89. E5
        sub     esp, 4                                  ; 2E14 _ 83. EC, 04
        mov     eax, dword [ebp+0CH]                    ; 2E17 _ 8B. 45, 0C
        mov     byte [ebp-4H], al                       ; 2E1A _ 88. 45, FC
        mov     eax, dword [ebp+8H]                     ; 2E1D _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 2E20 _ 0F B6. 40, 03
        test    al, al                                  ; 2E24 _ 84. C0
        jnz     ?_127                                   ; 2E26 _ 75, 17
        cmp     byte [ebp-4H], -6                       ; 2E28 _ 80. 7D, FC, FA
        jnz     ?_126                                   ; 2E2C _ 75, 07
        mov     eax, dword [ebp+8H]                     ; 2E2E _ 8B. 45, 08
        mov     byte [eax+3H], 1                        ; 2E31 _ C6. 40, 03, 01
?_126:  mov     eax, 0                                  ; 2E35 _ B8, 00000000
        jmp     ?_134                                   ; 2E3A _ E9, 0000010F

?_127:  mov     eax, dword [ebp+8H]                     ; 2E3F _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 2E42 _ 0F B6. 40, 03
        cmp     al, 1                                   ; 2E46 _ 3C, 01
        jnz     ?_129                                   ; 2E48 _ 75, 28
        movzx   eax, byte [ebp-4H]                      ; 2E4A _ 0F B6. 45, FC
        and     eax, 0C8H                               ; 2E4E _ 25, 000000C8
        cmp     eax, 8                                  ; 2E53 _ 83. F8, 08
        jnz     ?_128                                   ; 2E56 _ 75, 10
        mov     eax, dword [ebp+8H]                     ; 2E58 _ 8B. 45, 08
        movzx   edx, byte [ebp-4H]                      ; 2E5B _ 0F B6. 55, FC
        mov     byte [eax], dl                          ; 2E5F _ 88. 10
        mov     eax, dword [ebp+8H]                     ; 2E61 _ 8B. 45, 08
        mov     byte [eax+3H], 2                        ; 2E64 _ C6. 40, 03, 02
?_128:  mov     eax, 0                                  ; 2E68 _ B8, 00000000
        jmp     ?_134                                   ; 2E6D _ E9, 000000DC

?_129:  mov     eax, dword [ebp+8H]                     ; 2E72 _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 2E75 _ 0F B6. 40, 03
        cmp     al, 2                                   ; 2E79 _ 3C, 02
        jnz     ?_130                                   ; 2E7B _ 75, 1B
        mov     eax, dword [ebp+8H]                     ; 2E7D _ 8B. 45, 08
        movzx   edx, byte [ebp-4H]                      ; 2E80 _ 0F B6. 55, FC
        mov     byte [eax+1H], dl                       ; 2E84 _ 88. 50, 01
        mov     eax, dword [ebp+8H]                     ; 2E87 _ 8B. 45, 08
        mov     byte [eax+3H], 3                        ; 2E8A _ C6. 40, 03, 03
        mov     eax, 0                                  ; 2E8E _ B8, 00000000
        jmp     ?_134                                   ; 2E93 _ E9, 000000B6

?_130:  mov     eax, dword [ebp+8H]                     ; 2E98 _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 2E9B _ 0F B6. 40, 03
        cmp     al, 3                                   ; 2E9F _ 3C, 03
        jne     ?_133                                   ; 2EA1 _ 0F 85, 000000A2
        mov     eax, dword [ebp+8H]                     ; 2EA7 _ 8B. 45, 08
        movzx   edx, byte [ebp-4H]                      ; 2EAA _ 0F B6. 55, FC
        mov     byte [eax+2H], dl                       ; 2EAE _ 88. 50, 02
        mov     eax, dword [ebp+8H]                     ; 2EB1 _ 8B. 45, 08
        mov     byte [eax+3H], 1                        ; 2EB4 _ C6. 40, 03, 01
        mov     eax, dword [ebp+8H]                     ; 2EB8 _ 8B. 45, 08
        movzx   eax, byte [eax]                         ; 2EBB _ 0F B6. 00
        movzx   eax, al                                 ; 2EBE _ 0F B6. C0
        and     eax, 07H                                ; 2EC1 _ 83. E0, 07
        mov     edx, eax                                ; 2EC4 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 2EC6 _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 2EC9 _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 2ECC _ 8B. 45, 08
        movzx   eax, byte [eax+1H]                      ; 2ECF _ 0F B6. 40, 01
        movzx   edx, al                                 ; 2ED3 _ 0F B6. D0
        mov     eax, dword [ebp+8H]                     ; 2ED6 _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 2ED9 _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 2EDC _ 8B. 45, 08
        movzx   eax, byte [eax+2H]                      ; 2EDF _ 0F B6. 40, 02
        movzx   edx, al                                 ; 2EE3 _ 0F B6. D0
        mov     eax, dword [ebp+8H]                     ; 2EE6 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 2EE9 _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 2EEC _ 8B. 45, 08
        movzx   eax, byte [eax]                         ; 2EEF _ 0F B6. 00
        movzx   eax, al                                 ; 2EF2 _ 0F B6. C0
        and     eax, 10H                                ; 2EF5 _ 83. E0, 10
        test    eax, eax                                ; 2EF8 _ 85. C0
        jz      ?_131                                   ; 2EFA _ 74, 13
        mov     eax, dword [ebp+8H]                     ; 2EFC _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 2EFF _ 8B. 40, 04
        or      eax, 0FFFFFF00H                         ; 2F02 _ 0D, FFFFFF00
        mov     edx, eax                                ; 2F07 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 2F09 _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 2F0C _ 89. 50, 04
?_131:  mov     eax, dword [ebp+8H]                     ; 2F0F _ 8B. 45, 08
        movzx   eax, byte [eax]                         ; 2F12 _ 0F B6. 00
        movzx   eax, al                                 ; 2F15 _ 0F B6. C0
        and     eax, 20H                                ; 2F18 _ 83. E0, 20
        test    eax, eax                                ; 2F1B _ 85. C0
        jz      ?_132                                   ; 2F1D _ 74, 13
        mov     eax, dword [ebp+8H]                     ; 2F1F _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 2F22 _ 8B. 40, 08
        or      eax, 0FFFFFF00H                         ; 2F25 _ 0D, FFFFFF00
        mov     edx, eax                                ; 2F2A _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 2F2C _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 2F2F _ 89. 50, 08
?_132:  mov     eax, dword [ebp+8H]                     ; 2F32 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 2F35 _ 8B. 40, 08
        neg     eax                                     ; 2F38 _ F7. D8
        mov     edx, eax                                ; 2F3A _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 2F3C _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 2F3F _ 89. 50, 08
        mov     eax, 1                                  ; 2F42 _ B8, 00000001
        jmp     ?_134                                   ; 2F47 _ EB, 05

?_133:  mov     eax, 4294967295                         ; 2F49 _ B8, FFFFFFFF
?_134:  leave                                           ; 2F4E _ C9
        ret                                             ; 2F4F _ C3
; mouse_decode End of function

intHandlerKeyboard:; Function begin
        push    ebp                                     ; 2F50 _ 55
        mov     ebp, esp                                ; 2F51 _ 89. E5
        sub     esp, 40                                 ; 2F53 _ 83. EC, 28
        mov     dword [esp+4H], 32                      ; 2F56 _ C7. 44 24, 04, 00000020
        mov     dword [esp], 32                         ; 2F5E _ C7. 04 24, 00000020
        call    io_out8                                 ; 2F65 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 32                      ; 2F6A _ C7. 44 24, 04, 00000020
        mov     dword [esp], 160                        ; 2F72 _ C7. 04 24, 000000A0
        call    io_out8                                 ; 2F79 _ E8, FFFFFFFC(rel)
        mov     dword [esp], 96                         ; 2F7E _ C7. 04 24, 00000060
        call    io_in8                                  ; 2F85 _ E8, FFFFFFFC(rel)
        mov     byte [ebp-9H], al                       ; 2F8A _ 88. 45, F7
        movzx   eax, byte [ebp-9H]                      ; 2F8D _ 0F B6. 45, F7
        mov     dword [esp+4H], eax                     ; 2F91 _ 89. 44 24, 04
        mov     dword [esp], keyinfo                    ; 2F95 _ C7. 04 24, 00000000(d)
        call    fifo8_put                               ; 2F9C _ E8, FFFFFFFC(rel)
        leave                                           ; 2FA1 _ C9
        ret                                             ; 2FA2 _ C3
; intHandlerKeyboard End of function

intHandlerMouse:; Function begin
        push    ebp                                     ; 2FA3 _ 55
        mov     ebp, esp                                ; 2FA4 _ 89. E5
        sub     esp, 40                                 ; 2FA6 _ 83. EC, 28
        mov     dword [esp+4H], 32                      ; 2FA9 _ C7. 44 24, 04, 00000020
        mov     dword [esp], 32                         ; 2FB1 _ C7. 04 24, 00000020
        call    io_out8                                 ; 2FB8 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 32                      ; 2FBD _ C7. 44 24, 04, 00000020
        mov     dword [esp], 160                        ; 2FC5 _ C7. 04 24, 000000A0
        call    io_out8                                 ; 2FCC _ E8, FFFFFFFC(rel)
        mov     dword [esp], 96                         ; 2FD1 _ C7. 04 24, 00000060
        call    io_in8                                  ; 2FD8 _ E8, FFFFFFFC(rel)
        mov     byte [ebp-9H], al                       ; 2FDD _ 88. 45, F7
        movzx   eax, byte [ebp-9H]                      ; 2FE0 _ 0F B6. 45, F7
        mov     dword [esp+4H], eax                     ; 2FE4 _ 89. 44 24, 04
        mov     dword [esp], mouseinfo                  ; 2FE8 _ C7. 04 24, 00000000(d)
        call    fifo8_put                               ; 2FEF _ E8, FFFFFFFC(rel)
        leave                                           ; 2FF4 _ C9
        ret                                             ; 2FF5 _ C3
; intHandlerMouse End of function

fifo8_init:; Function begin
        push    ebp                                     ; 2FF6 _ 55
        mov     ebp, esp                                ; 2FF7 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 2FF9 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 2FFC _ 8B. 55, 10
        mov     dword [eax], edx                        ; 2FFF _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 3001 _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 3004 _ C7. 40, 04, 00000000
        mov     eax, dword [ebp+8H]                     ; 300B _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 300E _ C7. 40, 08, 00000000
        mov     eax, dword [ebp+8H]                     ; 3015 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 3018 _ 8B. 55, 0C
        mov     dword [eax+0CH], edx                    ; 301B _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 301E _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 3021 _ 8B. 55, 0C
        mov     dword [eax+10H], edx                    ; 3024 _ 89. 50, 10
        mov     eax, dword [ebp+8H]                     ; 3027 _ 8B. 45, 08
        mov     dword [eax+14H], 0                      ; 302A _ C7. 40, 14, 00000000
        mov     eax, dword [ebp+8H]                     ; 3031 _ 8B. 45, 08
        mov     edx, dword [ebp+14H]                    ; 3034 _ 8B. 55, 14
        mov     dword [eax+18H], edx                    ; 3037 _ 89. 50, 18
        pop     ebp                                     ; 303A _ 5D
        ret                                             ; 303B _ C3
; fifo8_init End of function

fifo8_put:; Function begin
        push    ebp                                     ; 303C _ 55
        mov     ebp, esp                                ; 303D _ 89. E5
        sub     esp, 40                                 ; 303F _ 83. EC, 28
        mov     eax, dword [ebp+0CH]                    ; 3042 _ 8B. 45, 0C
        mov     byte [ebp-1CH], al                      ; 3045 _ 88. 45, E4
        cmp     dword [ebp+8H], 0                       ; 3048 _ 83. 7D, 08, 00
        jnz     ?_135                                   ; 304C _ 75, 0A
        mov     eax, 4294967295                         ; 304E _ B8, FFFFFFFF
        jmp     ?_139                                   ; 3053 _ E9, 000000B1

?_135:  mov     eax, dword [ebp+8H]                     ; 3058 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 305B _ 8B. 40, 10
        test    eax, eax                                ; 305E _ 85. C0
        jnz     ?_136                                   ; 3060 _ 75, 1B
        mov     eax, dword [ebp+8H]                     ; 3062 _ 8B. 45, 08
        mov     eax, dword [eax+14H]                    ; 3065 _ 8B. 40, 14
        or      eax, 01H                                ; 3068 _ 83. C8, 01
        mov     edx, eax                                ; 306B _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 306D _ 8B. 45, 08
        mov     dword [eax+14H], edx                    ; 3070 _ 89. 50, 14
        mov     eax, 4294967295                         ; 3073 _ B8, FFFFFFFF
        jmp     ?_139                                   ; 3078 _ E9, 0000008C

?_136:  mov     eax, dword [ebp+8H]                     ; 307D _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 3080 _ 8B. 40, 04
        mov     dword [ebp-0CH], eax                    ; 3083 _ 89. 45, F4
        mov     eax, dword [ebp+8H]                     ; 3086 _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 3089 _ 8B. 10
        mov     eax, dword [ebp-0CH]                    ; 308B _ 8B. 45, F4
        add     edx, eax                                ; 308E _ 01. C2
        movzx   eax, byte [ebp-1CH]                     ; 3090 _ 0F B6. 45, E4
        mov     byte [edx], al                          ; 3094 _ 88. 02
        mov     eax, dword [ebp+8H]                     ; 3096 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 3099 _ 8B. 40, 04
        lea     edx, [eax+1H]                           ; 309C _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 309F _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 30A2 _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 30A5 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 30A8 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 30AB _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 30AE _ 8B. 40, 0C
        cmp     edx, eax                                ; 30B1 _ 39. C2
        jnz     ?_137                                   ; 30B3 _ 75, 0A
        mov     eax, dword [ebp+8H]                     ; 30B5 _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 30B8 _ C7. 40, 04, 00000000
?_137:  mov     eax, dword [ebp+8H]                     ; 30BF _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 30C2 _ 8B. 40, 10
        lea     edx, [eax-1H]                           ; 30C5 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 30C8 _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 30CB _ 89. 50, 10
        mov     eax, dword [ebp+8H]                     ; 30CE _ 8B. 45, 08
        mov     eax, dword [eax+18H]                    ; 30D1 _ 8B. 40, 18
        test    eax, eax                                ; 30D4 _ 85. C0
        jz      ?_138                                   ; 30D6 _ 74, 2C
        mov     eax, dword [ebp+8H]                     ; 30D8 _ 8B. 45, 08
        mov     eax, dword [eax+18H]                    ; 30DB _ 8B. 40, 18
        mov     eax, dword [eax+4H]                     ; 30DE _ 8B. 40, 04
        cmp     eax, 2                                  ; 30E1 _ 83. F8, 02
        jz      ?_138                                   ; 30E4 _ 74, 1E
        mov     eax, dword [ebp+8H]                     ; 30E6 _ 8B. 45, 08
        mov     eax, dword [eax+18H]                    ; 30E9 _ 8B. 40, 18
        mov     dword [esp+8H], 0                       ; 30EC _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], -1                      ; 30F4 _ C7. 44 24, 04, FFFFFFFF
        mov     dword [esp], eax                        ; 30FC _ 89. 04 24
        call    task_run                                ; 30FF _ E8, FFFFFFFC(rel)
?_138:  mov     eax, 0                                  ; 3104 _ B8, 00000000
?_139:  leave                                           ; 3109 _ C9
        ret                                             ; 310A _ C3
; fifo8_put End of function

fifo8_get:; Function begin
        push    ebp                                     ; 310B _ 55
        mov     ebp, esp                                ; 310C _ 89. E5
        sub     esp, 16                                 ; 310E _ 83. EC, 10
        mov     eax, dword [ebp+8H]                     ; 3111 _ 8B. 45, 08
        mov     edx, dword [eax+10H]                    ; 3114 _ 8B. 50, 10
        mov     eax, dword [ebp+8H]                     ; 3117 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 311A _ 8B. 40, 0C
        cmp     edx, eax                                ; 311D _ 39. C2
        jnz     ?_140                                   ; 311F _ 75, 11
        mov     eax, dword [ebp+8H]                     ; 3121 _ 8B. 45, 08
        mov     dword [eax+14H], 0                      ; 3124 _ C7. 40, 14, 00000000
        mov     eax, 4294967295                         ; 312B _ B8, FFFFFFFF
        jmp     ?_142                                   ; 3130 _ EB, 57

?_140:  mov     eax, dword [ebp+8H]                     ; 3132 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 3135 _ 8B. 40, 08
        mov     dword [ebp-8H], eax                     ; 3138 _ 89. 45, F8
        mov     eax, dword [ebp+8H]                     ; 313B _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 313E _ 8B. 10
        mov     eax, dword [ebp-8H]                     ; 3140 _ 8B. 45, F8
        add     eax, edx                                ; 3143 _ 01. D0
        movzx   eax, byte [eax]                         ; 3145 _ 0F B6. 00
        movzx   eax, al                                 ; 3148 _ 0F B6. C0
        mov     dword [ebp-4H], eax                     ; 314B _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 314E _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 3151 _ 8B. 40, 08
        lea     edx, [eax+1H]                           ; 3154 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 3157 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 315A _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 315D _ 8B. 45, 08
        mov     edx, dword [eax+8H]                     ; 3160 _ 8B. 50, 08
        mov     eax, dword [ebp+8H]                     ; 3163 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 3166 _ 8B. 40, 0C
        cmp     edx, eax                                ; 3169 _ 39. C2
        jnz     ?_141                                   ; 316B _ 75, 0A
        mov     eax, dword [ebp+8H]                     ; 316D _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 3170 _ C7. 40, 08, 00000000
?_141:  mov     eax, dword [ebp+8H]                     ; 3177 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 317A _ 8B. 40, 10
        lea     edx, [eax+1H]                           ; 317D _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 3180 _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 3183 _ 89. 50, 10
        mov     eax, dword [ebp-4H]                     ; 3186 _ 8B. 45, FC
?_142:  leave                                           ; 3189 _ C9
        ret                                             ; 318A _ C3
; fifo8_get End of function

fifo8_status:; Function begin
        push    ebp                                     ; 318B _ 55
        mov     ebp, esp                                ; 318C _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 318E _ 8B. 45, 08
        mov     edx, dword [eax+0CH]                    ; 3191 _ 8B. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 3194 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 3197 _ 8B. 40, 10
        sub     edx, eax                                ; 319A _ 29. C2
        mov     eax, edx                                ; 319C _ 89. D0
        pop     ebp                                     ; 319E _ 5D
        ret                                             ; 319F _ C3
; fifo8_status End of function

charToHexVal:; Function begin
        push    ebp                                     ; 31A0 _ 55
        mov     ebp, esp                                ; 31A1 _ 89. E5
        sub     esp, 4                                  ; 31A3 _ 83. EC, 04
        mov     eax, dword [ebp+8H]                     ; 31A6 _ 8B. 45, 08
        mov     byte [ebp-4H], al                       ; 31A9 _ 88. 45, FC
        cmp     byte [ebp-4H], 9                        ; 31AC _ 80. 7D, FC, 09
        jle     ?_143                                   ; 31B0 _ 7E, 09
        movzx   eax, byte [ebp-4H]                      ; 31B2 _ 0F B6. 45, FC
        add     eax, 55                                 ; 31B6 _ 83. C0, 37
        jmp     ?_144                                   ; 31B9 _ EB, 07

?_143:  movzx   eax, byte [ebp-4H]                      ; 31BB _ 0F B6. 45, FC
        add     eax, 48                                 ; 31BF _ 83. C0, 30
?_144:  leave                                           ; 31C2 _ C9
        ret                                             ; 31C3 _ C3
; charToHexVal End of function

charToHexStr:; Function begin
        push    ebp                                     ; 31C4 _ 55
        mov     ebp, esp                                ; 31C5 _ 89. E5
        sub     esp, 24                                 ; 31C7 _ 83. EC, 18
        mov     eax, dword [ebp+8H]                     ; 31CA _ 8B. 45, 08
        mov     byte [ebp-14H], al                      ; 31CD _ 88. 45, EC
        mov     dword [ebp-4H], 0                       ; 31D0 _ C7. 45, FC, 00000000
        movzx   eax, byte [ebp-14H]                     ; 31D7 _ 0F B6. 45, EC
        and     eax, 0FH                                ; 31DB _ 83. E0, 0F
        mov     byte [ebp-5H], al                       ; 31DE _ 88. 45, FB
        movsx   eax, byte [ebp-5H]                      ; 31E1 _ 0F BE. 45, FB
        mov     dword [esp], eax                        ; 31E5 _ 89. 04 24
        call    charToHexVal                            ; 31E8 _ E8, FFFFFFFC(rel)
        mov     byte [?_283], al                        ; 31ED _ A2, 00000343(d)
        movzx   eax, byte [ebp-14H]                     ; 31F2 _ 0F B6. 45, EC
        shr     al, 4                                   ; 31F6 _ C0. E8, 04
        mov     byte [ebp-14H], al                      ; 31F9 _ 88. 45, EC
        movzx   eax, byte [ebp-14H]                     ; 31FC _ 0F B6. 45, EC
        movsx   eax, al                                 ; 3200 _ 0F BE. C0
        mov     dword [esp], eax                        ; 3203 _ 89. 04 24
        call    charToHexVal                            ; 3206 _ E8, FFFFFFFC(rel)
        mov     byte [?_282], al                        ; 320B _ A2, 00000342(d)
        mov     eax, keyval                             ; 3210 _ B8, 00000340(d)
        leave                                           ; 3215 _ C9
        ret                                             ; 3216 _ C3
; charToHexStr End of function

intToHexStr:; Function begin
        push    ebp                                     ; 3217 _ 55
        mov     ebp, esp                                ; 3218 _ 89. E5
        sub     esp, 16                                 ; 321A _ 83. EC, 10
        mov     byte [str.1386], 48                     ; 321D _ C6. 05, 000002E0(d), 30
        mov     byte [?_286], 88                        ; 3224 _ C6. 05, 000002E1(d), 58
        mov     byte [?_287], 0                         ; 322B _ C6. 05, 000002EA(d), 00
        mov     dword [ebp-0CH], 2                      ; 3232 _ C7. 45, F4, 00000002
        jmp     ?_146                                   ; 3239 _ EB, 0F

?_145:  mov     eax, dword [ebp-0CH]                    ; 323B _ 8B. 45, F4
        add     eax, str.1386                           ; 323E _ 05, 000002E0(d)
        mov     byte [eax], 48                          ; 3243 _ C6. 00, 30
        add     dword [ebp-0CH], 1                      ; 3246 _ 83. 45, F4, 01
?_146:  cmp     dword [ebp-0CH], 9                      ; 324A _ 83. 7D, F4, 09
        jle     ?_145                                   ; 324E _ 7E, EB
        mov     dword [ebp-8H], 9                       ; 3250 _ C7. 45, F8, 00000009
        jmp     ?_150                                   ; 3257 _ EB, 40

?_147:  mov     eax, dword [ebp+8H]                     ; 3259 _ 8B. 45, 08
        and     eax, 0FH                                ; 325C _ 83. E0, 0F
        mov     dword [ebp-4H], eax                     ; 325F _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 3262 _ 8B. 45, 08
        shr     eax, 4                                  ; 3265 _ C1. E8, 04
        mov     dword [ebp+8H], eax                     ; 3268 _ 89. 45, 08
        cmp     dword [ebp-4H], 9                       ; 326B _ 83. 7D, FC, 09
        jle     ?_148                                   ; 326F _ 7E, 13
        mov     eax, dword [ebp-4H]                     ; 3271 _ 8B. 45, FC
        add     eax, 55                                 ; 3274 _ 83. C0, 37
        mov     edx, dword [ebp-8H]                     ; 3277 _ 8B. 55, F8
        add     edx, str.1386                           ; 327A _ 81. C2, 000002E0(d)
        mov     byte [edx], al                          ; 3280 _ 88. 02
        jmp     ?_149                                   ; 3282 _ EB, 11

?_148:  mov     eax, dword [ebp-4H]                     ; 3284 _ 8B. 45, FC
        add     eax, 48                                 ; 3287 _ 83. C0, 30
        mov     edx, dword [ebp-8H]                     ; 328A _ 8B. 55, F8
        add     edx, str.1386                           ; 328D _ 81. C2, 000002E0(d)
        mov     byte [edx], al                          ; 3293 _ 88. 02
?_149:  sub     dword [ebp-8H], 1                       ; 3295 _ 83. 6D, F8, 01
?_150:  cmp     dword [ebp-8H], 1                       ; 3299 _ 83. 7D, F8, 01
        jle     ?_151                                   ; 329D _ 7E, 06
        cmp     dword [ebp+8H], 0                       ; 329F _ 83. 7D, 08, 00
        jnz     ?_147                                   ; 32A3 _ 75, B4
?_151:  mov     eax, str.1386                           ; 32A5 _ B8, 000002E0(d)
        leave                                           ; 32AA _ C9
        ret                                             ; 32AB _ C3
; intToHexStr End of function

memman_init:; Function begin
        push    ebp                                     ; 32AC _ 55
        mov     ebp, esp                                ; 32AD _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 32AF _ 8B. 45, 08
        mov     dword [eax], 0                          ; 32B2 _ C7. 00, 00000000
        mov     eax, dword [ebp+8H]                     ; 32B8 _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 32BB _ C7. 40, 04, 00000000
        mov     eax, dword [ebp+8H]                     ; 32C2 _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 32C5 _ C7. 40, 08, 00000000
        mov     eax, dword [ebp+8H]                     ; 32CC _ 8B. 45, 08
        mov     dword [eax+0CH], 0                      ; 32CF _ C7. 40, 0C, 00000000
        pop     ebp                                     ; 32D6 _ 5D
        ret                                             ; 32D7 _ C3
; memman_init End of function

memman_total:; Function begin
        push    ebp                                     ; 32D8 _ 55
        mov     ebp, esp                                ; 32D9 _ 89. E5
        sub     esp, 16                                 ; 32DB _ 83. EC, 10
        mov     dword [ebp-4H], 0                       ; 32DE _ C7. 45, FC, 00000000
        mov     dword [ebp-8H], 0                       ; 32E5 _ C7. 45, F8, 00000000
        jmp     ?_153                                   ; 32EC _ EB, 14

?_152:  mov     eax, dword [ebp+8H]                     ; 32EE _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 32F1 _ 8B. 55, F8
        add     edx, 2                                  ; 32F4 _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 32F7 _ 8B. 44 D0, 04
        add     dword [ebp-4H], eax                     ; 32FB _ 01. 45, FC
        add     dword [ebp-8H], 1                       ; 32FE _ 83. 45, F8, 01
?_153:  mov     eax, dword [ebp+8H]                     ; 3302 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 3305 _ 8B. 00
        cmp     eax, dword [ebp-8H]                     ; 3307 _ 3B. 45, F8
        ja      ?_152                                   ; 330A _ 77, E2
        mov     eax, dword [ebp-4H]                     ; 330C _ 8B. 45, FC
        leave                                           ; 330F _ C9
        ret                                             ; 3310 _ C3
; memman_total End of function

memman_alloc:; Function begin
        push    ebp                                     ; 3311 _ 55
        mov     ebp, esp                                ; 3312 _ 89. E5
        sub     esp, 16                                 ; 3314 _ 83. EC, 10
        mov     dword [ebp-8H], 0                       ; 3317 _ C7. 45, F8, 00000000
        jmp     ?_157                                   ; 331E _ E9, 00000085

?_154:  mov     eax, dword [ebp+8H]                     ; 3323 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 3326 _ 8B. 55, F8
        add     edx, 2                                  ; 3329 _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 332C _ 8B. 44 D0, 04
        cmp     eax, dword [ebp+0CH]                    ; 3330 _ 3B. 45, 0C
        jc      ?_156                                   ; 3333 _ 72, 6F
        mov     eax, dword [ebp+8H]                     ; 3335 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 3338 _ 8B. 55, F8
        add     edx, 2                                  ; 333B _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 333E _ 8B. 04 D0
        mov     dword [ebp-4H], eax                     ; 3341 _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 3344 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 3347 _ 8B. 55, F8
        add     edx, 2                                  ; 334A _ 83. C2, 02
        mov     edx, dword [eax+edx*8]                  ; 334D _ 8B. 14 D0
        mov     eax, dword [ebp+0CH]                    ; 3350 _ 8B. 45, 0C
        lea     ecx, [edx+eax]                          ; 3353 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 3356 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 3359 _ 8B. 55, F8
        add     edx, 2                                  ; 335C _ 83. C2, 02
        mov     dword [eax+edx*8], ecx                  ; 335F _ 89. 0C D0
        mov     eax, dword [ebp+8H]                     ; 3362 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 3365 _ 8B. 55, F8
        add     edx, 2                                  ; 3368 _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 336B _ 8B. 44 D0, 04
        sub     eax, dword [ebp+0CH]                    ; 336F _ 2B. 45, 0C
        mov     edx, eax                                ; 3372 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 3374 _ 8B. 45, 08
        mov     ecx, dword [ebp-8H]                     ; 3377 _ 8B. 4D, F8
        add     ecx, 2                                  ; 337A _ 83. C1, 02
        mov     dword [eax+ecx*8+4H], edx               ; 337D _ 89. 54 C8, 04
        mov     eax, dword [ebp+8H]                     ; 3381 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 3384 _ 8B. 55, F8
        add     edx, 2                                  ; 3387 _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 338A _ 8B. 44 D0, 04
        test    eax, eax                                ; 338E _ 85. C0
        jnz     ?_155                                   ; 3390 _ 75, 0D
        mov     eax, dword [ebp+8H]                     ; 3392 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 3395 _ 8B. 00
        lea     edx, [eax-1H]                           ; 3397 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 339A _ 8B. 45, 08
        mov     dword [eax], edx                        ; 339D _ 89. 10
?_155:  mov     eax, dword [ebp-4H]                     ; 339F _ 8B. 45, FC
        jmp     ?_158                                   ; 33A2 _ EB, 17

?_156:  add     dword [ebp-8H], 1                       ; 33A4 _ 83. 45, F8, 01
?_157:  mov     eax, dword [ebp+8H]                     ; 33A8 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 33AB _ 8B. 00
        cmp     eax, dword [ebp-8H]                     ; 33AD _ 3B. 45, F8
        ja      ?_154                                   ; 33B0 _ 0F 87, FFFFFF6D
        mov     eax, 0                                  ; 33B6 _ B8, 00000000
?_158:  leave                                           ; 33BB _ C9
        ret                                             ; 33BC _ C3
; memman_alloc End of function

memman_free:; Function begin
        push    ebp                                     ; 33BD _ 55
        mov     ebp, esp                                ; 33BE _ 89. E5
        push    ebx                                     ; 33C0 _ 53
        sub     esp, 16                                 ; 33C1 _ 83. EC, 10
        mov     dword [ebp-0CH], 0                      ; 33C4 _ C7. 45, F4, 00000000
        jmp     ?_161                                   ; 33CB _ EB, 17

?_159:  mov     eax, dword [ebp+8H]                     ; 33CD _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 33D0 _ 8B. 55, F4
        add     edx, 2                                  ; 33D3 _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 33D6 _ 8B. 04 D0
        cmp     eax, dword [ebp+0CH]                    ; 33D9 _ 3B. 45, 0C
        jbe     ?_160                                   ; 33DC _ 76, 02
        jmp     ?_162                                   ; 33DE _ EB, 0E

?_160:  add     dword [ebp-0CH], 1                      ; 33E0 _ 83. 45, F4, 01
?_161:  mov     eax, dword [ebp+8H]                     ; 33E4 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 33E7 _ 8B. 00
        cmp     eax, dword [ebp-0CH]                    ; 33E9 _ 3B. 45, F4
        jg      ?_159                                   ; 33EC _ 7F, DF
?_162:  cmp     dword [ebp-0CH], 0                      ; 33EE _ 83. 7D, F4, 00
        jle     ?_164                                   ; 33F2 _ 0F 8E, 000000BA
        mov     eax, dword [ebp-0CH]                    ; 33F8 _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 33FB _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 33FE _ 8B. 45, 08
        add     edx, 2                                  ; 3401 _ 83. C2, 02
        mov     edx, dword [eax+edx*8]                  ; 3404 _ 8B. 14 D0
        mov     eax, dword [ebp-0CH]                    ; 3407 _ 8B. 45, F4
        lea     ecx, [eax-1H]                           ; 340A _ 8D. 48, FF
        mov     eax, dword [ebp+8H]                     ; 340D _ 8B. 45, 08
        add     ecx, 2                                  ; 3410 _ 83. C1, 02
        mov     eax, dword [eax+ecx*8+4H]               ; 3413 _ 8B. 44 C8, 04
        add     eax, edx                                ; 3417 _ 01. D0
        cmp     eax, dword [ebp+0CH]                    ; 3419 _ 3B. 45, 0C
        jne     ?_164                                   ; 341C _ 0F 85, 00000090
        mov     eax, dword [ebp-0CH]                    ; 3422 _ 8B. 45, F4
        lea     ebx, [eax-1H]                           ; 3425 _ 8D. 58, FF
        mov     eax, dword [ebp-0CH]                    ; 3428 _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 342B _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 342E _ 8B. 45, 08
        add     edx, 2                                  ; 3431 _ 83. C2, 02
        mov     edx, dword [eax+edx*8+4H]               ; 3434 _ 8B. 54 D0, 04
        mov     eax, dword [ebp+10H]                    ; 3438 _ 8B. 45, 10
        lea     ecx, [edx+eax]                          ; 343B _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 343E _ 8B. 45, 08
        lea     edx, [ebx+2H]                           ; 3441 _ 8D. 53, 02
        mov     dword [eax+edx*8+4H], ecx               ; 3444 _ 89. 4C D0, 04
        mov     eax, dword [ebp+8H]                     ; 3448 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 344B _ 8B. 00
        cmp     eax, dword [ebp-0CH]                    ; 344D _ 3B. 45, F4
        jle     ?_163                                   ; 3450 _ 7E, 56
        mov     eax, dword [ebp+10H]                    ; 3452 _ 8B. 45, 10
        mov     edx, dword [ebp+0CH]                    ; 3455 _ 8B. 55, 0C
        lea     ecx, [edx+eax]                          ; 3458 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 345B _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 345E _ 8B. 55, F4
        add     edx, 2                                  ; 3461 _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 3464 _ 8B. 04 D0
        cmp     ecx, eax                                ; 3467 _ 39. C1
        jnz     ?_163                                   ; 3469 _ 75, 3D
        mov     eax, dword [ebp-0CH]                    ; 346B _ 8B. 45, F4
        lea     ebx, [eax-1H]                           ; 346E _ 8D. 58, FF
        mov     eax, dword [ebp-0CH]                    ; 3471 _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 3474 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 3477 _ 8B. 45, 08
        add     edx, 2                                  ; 347A _ 83. C2, 02
        mov     edx, dword [eax+edx*8+4H]               ; 347D _ 8B. 54 D0, 04
        mov     eax, dword [ebp+8H]                     ; 3481 _ 8B. 45, 08
        mov     ecx, dword [ebp-0CH]                    ; 3484 _ 8B. 4D, F4
        add     ecx, 2                                  ; 3487 _ 83. C1, 02
        mov     eax, dword [eax+ecx*8+4H]               ; 348A _ 8B. 44 C8, 04
        lea     ecx, [edx+eax]                          ; 348E _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 3491 _ 8B. 45, 08
        lea     edx, [ebx+2H]                           ; 3494 _ 8D. 53, 02
        mov     dword [eax+edx*8+4H], ecx               ; 3497 _ 89. 4C D0, 04
        mov     eax, dword [ebp+8H]                     ; 349B _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 349E _ 8B. 00
        lea     edx, [eax-1H]                           ; 34A0 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 34A3 _ 8B. 45, 08
        mov     dword [eax], edx                        ; 34A6 _ 89. 10
?_163:  mov     eax, 0                                  ; 34A8 _ B8, 00000000
        jmp     ?_170                                   ; 34AD _ E9, 0000011C

?_164:  mov     eax, dword [ebp+8H]                     ; 34B2 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 34B5 _ 8B. 00
        cmp     eax, dword [ebp-0CH]                    ; 34B7 _ 3B. 45, F4
        jle     ?_165                                   ; 34BA _ 7E, 52
        mov     eax, dword [ebp+10H]                    ; 34BC _ 8B. 45, 10
        mov     edx, dword [ebp+0CH]                    ; 34BF _ 8B. 55, 0C
        lea     ecx, [edx+eax]                          ; 34C2 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 34C5 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 34C8 _ 8B. 55, F4
        add     edx, 2                                  ; 34CB _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 34CE _ 8B. 04 D0
        cmp     ecx, eax                                ; 34D1 _ 39. C1
        jnz     ?_165                                   ; 34D3 _ 75, 39
        mov     eax, dword [ebp+8H]                     ; 34D5 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 34D8 _ 8B. 55, F4
        lea     ecx, [edx+2H]                           ; 34DB _ 8D. 4A, 02
        mov     edx, dword [ebp+0CH]                    ; 34DE _ 8B. 55, 0C
        mov     dword [eax+ecx*8], edx                  ; 34E1 _ 89. 14 C8
        mov     eax, dword [ebp+8H]                     ; 34E4 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 34E7 _ 8B. 55, F4
        add     edx, 2                                  ; 34EA _ 83. C2, 02
        mov     edx, dword [eax+edx*8+4H]               ; 34ED _ 8B. 54 D0, 04
        mov     eax, dword [ebp+10H]                    ; 34F1 _ 8B. 45, 10
        lea     ecx, [edx+eax]                          ; 34F4 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 34F7 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 34FA _ 8B. 55, F4
        add     edx, 2                                  ; 34FD _ 83. C2, 02
        mov     dword [eax+edx*8+4H], ecx               ; 3500 _ 89. 4C D0, 04
        mov     eax, 0                                  ; 3504 _ B8, 00000000
        jmp     ?_170                                   ; 3509 _ E9, 000000C0

?_165:  mov     eax, dword [ebp+8H]                     ; 350E _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 3511 _ 8B. 00
        cmp     eax, 4095                               ; 3513 _ 3D, 00000FFF
        jg      ?_169                                   ; 3518 _ 0F 8F, 00000087
        mov     eax, dword [ebp+8H]                     ; 351E _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 3521 _ 8B. 00
        mov     dword [ebp-8H], eax                     ; 3523 _ 89. 45, F8
        jmp     ?_167                                   ; 3526 _ EB, 28

?_166:  mov     eax, dword [ebp-8H]                     ; 3528 _ 8B. 45, F8
        lea     edx, [eax-1H]                           ; 352B _ 8D. 50, FF
        mov     ecx, dword [ebp+8H]                     ; 352E _ 8B. 4D, 08
        mov     eax, dword [ebp-8H]                     ; 3531 _ 8B. 45, F8
        lea     ebx, [eax+2H]                           ; 3534 _ 8D. 58, 02
        mov     eax, dword [ebp+8H]                     ; 3537 _ 8B. 45, 08
        add     edx, 2                                  ; 353A _ 83. C2, 02
        lea     edx, [eax+edx*8]                        ; 353D _ 8D. 14 D0
        mov     eax, dword [edx]                        ; 3540 _ 8B. 02
        mov     edx, dword [edx+4H]                     ; 3542 _ 8B. 52, 04
        mov     dword [ecx+ebx*8], eax                  ; 3545 _ 89. 04 D9
        mov     dword [ecx+ebx*8+4H], edx               ; 3548 _ 89. 54 D9, 04
        sub     dword [ebp-8H], 1                       ; 354C _ 83. 6D, F8, 01
?_167:  mov     eax, dword [ebp-8H]                     ; 3550 _ 8B. 45, F8
        cmp     eax, dword [ebp-0CH]                    ; 3553 _ 3B. 45, F4
        jg      ?_166                                   ; 3556 _ 7F, D0
        mov     eax, dword [ebp+8H]                     ; 3558 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 355B _ 8B. 00
        lea     edx, [eax+1H]                           ; 355D _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 3560 _ 8B. 45, 08
        mov     dword [eax], edx                        ; 3563 _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 3565 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 3568 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 356B _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 356E _ 8B. 00
        cmp     edx, eax                                ; 3570 _ 39. C2
        jge     ?_168                                   ; 3572 _ 7D, 0B
        mov     eax, dword [ebp+8H]                     ; 3574 _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 3577 _ 8B. 10
        mov     eax, dword [ebp+8H]                     ; 3579 _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 357C _ 89. 50, 04
?_168:  mov     eax, dword [ebp+8H]                     ; 357F _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 3582 _ 8B. 55, F4
        lea     ecx, [edx+2H]                           ; 3585 _ 8D. 4A, 02
        mov     edx, dword [ebp+0CH]                    ; 3588 _ 8B. 55, 0C
        mov     dword [eax+ecx*8], edx                  ; 358B _ 89. 14 C8
        mov     eax, dword [ebp+8H]                     ; 358E _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 3591 _ 8B. 55, F4
        lea     ecx, [edx+2H]                           ; 3594 _ 8D. 4A, 02
        mov     edx, dword [ebp+10H]                    ; 3597 _ 8B. 55, 10
        mov     dword [eax+ecx*8+4H], edx               ; 359A _ 89. 54 C8, 04
        mov     eax, 0                                  ; 359E _ B8, 00000000
        jmp     ?_170                                   ; 35A3 _ EB, 29

?_169:  mov     eax, dword [ebp+8H]                     ; 35A5 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 35A8 _ 8B. 40, 0C
        lea     edx, [eax+1H]                           ; 35AB _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 35AE _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 35B1 _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 35B4 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 35B7 _ 8B. 40, 08
        mov     edx, eax                                ; 35BA _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 35BC _ 8B. 45, 10
        add     eax, edx                                ; 35BF _ 01. D0
        mov     edx, eax                                ; 35C1 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 35C3 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 35C6 _ 89. 50, 08
        mov     eax, 4294967295                         ; 35C9 _ B8, FFFFFFFF
?_170:  add     esp, 16                                 ; 35CE _ 83. C4, 10
        pop     ebx                                     ; 35D1 _ 5B
        pop     ebp                                     ; 35D2 _ 5D
        ret                                             ; 35D3 _ C3
; memman_free End of function

memman_alloc_4k:; Function begin
        push    ebp                                     ; 35D4 _ 55
        mov     ebp, esp                                ; 35D5 _ 89. E5
        sub     esp, 24                                 ; 35D7 _ 83. EC, 18
        mov     eax, dword [ebp+0CH]                    ; 35DA _ 8B. 45, 0C
        add     eax, 4095                               ; 35DD _ 05, 00000FFF
        and     eax, 0FFFFF000H                         ; 35E2 _ 25, FFFFF000
        mov     dword [ebp+0CH], eax                    ; 35E7 _ 89. 45, 0C
        mov     eax, dword [ebp+0CH]                    ; 35EA _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 35ED _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 35F1 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 35F4 _ 89. 04 24
        call    memman_alloc                            ; 35F7 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-4H], eax                     ; 35FC _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 35FF _ 8B. 45, FC
        leave                                           ; 3602 _ C9
        ret                                             ; 3603 _ C3
; memman_alloc_4k End of function

memman_free_4k:; Function begin
        push    ebp                                     ; 3604 _ 55
        mov     ebp, esp                                ; 3605 _ 89. E5
        sub     esp, 28                                 ; 3607 _ 83. EC, 1C
        mov     eax, dword [ebp+10H]                    ; 360A _ 8B. 45, 10
        add     eax, 4095                               ; 360D _ 05, 00000FFF
        and     eax, 0FFFFF000H                         ; 3612 _ 25, FFFFF000
        mov     dword [ebp+10H], eax                    ; 3617 _ 89. 45, 10
        mov     eax, dword [ebp+10H]                    ; 361A _ 8B. 45, 10
        mov     dword [esp+8H], eax                     ; 361D _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 3621 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 3624 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 3628 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 362B _ 89. 04 24
        call    memman_free                             ; 362E _ E8, FFFFFFFC(rel)
        mov     dword [ebp-4H], eax                     ; 3633 _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 3636 _ 8B. 45, FC
        leave                                           ; 3639 _ C9
        ret                                             ; 363A _ C3
; memman_free_4k End of function

sheet_control_init:; Function begin
        push    ebp                                     ; 363B _ 55
        mov     ebp, esp                                ; 363C _ 89. E5
        sub     esp, 40                                 ; 363E _ 83. EC, 28
        mov     dword [esp+4H], 9236                    ; 3641 _ C7. 44 24, 04, 00002414
        mov     eax, dword [ebp+8H]                     ; 3649 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 364C _ 89. 04 24
        call    memman_alloc_4k                         ; 364F _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 3654 _ 89. 45, F4
        cmp     dword [ebp-0CH], 0                      ; 3657 _ 83. 7D, F4, 00
        jnz     ?_171                                   ; 365B _ 75, 24
        mov     eax, dword [ebp-0CH]                    ; 365D _ 8B. 45, F4
        mov     dword [esp+8H], 9236                    ; 3660 _ C7. 44 24, 08, 00002414
        mov     dword [esp+4H], eax                     ; 3668 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 366C _ 8B. 45, 08
        mov     dword [esp], eax                        ; 366F _ 89. 04 24
        call    memman_free_4k                          ; 3672 _ E8, FFFFFFFC(rel)
        mov     eax, 0                                  ; 3677 _ B8, 00000000
        jmp     ?_175                                   ; 367C _ E9, 0000009D

?_171:  mov     eax, dword [ebp-0CH]                    ; 3681 _ 8B. 45, F4
        mov     edx, dword [ebp+0CH]                    ; 3684 _ 8B. 55, 0C
        mov     dword [eax], edx                        ; 3687 _ 89. 10
        mov     eax, dword [ebp-0CH]                    ; 3689 _ 8B. 45, F4
        mov     edx, dword [ebp+10H]                    ; 368C _ 8B. 55, 10
        mov     dword [eax+4H], edx                     ; 368F _ 89. 50, 04
        mov     eax, dword [ebp-0CH]                    ; 3692 _ 8B. 45, F4
        mov     edx, dword [ebp+14H]                    ; 3695 _ 8B. 55, 14
        mov     dword [eax+8H], edx                     ; 3698 _ 89. 50, 08
        mov     eax, dword [ebp-0CH]                    ; 369B _ 8B. 45, F4
        mov     dword [eax+0CH], -1                     ; 369E _ C7. 40, 0C, FFFFFFFF
        mov     dword [ebp-10H], 0                      ; 36A5 _ C7. 45, F0, 00000000
        jmp     ?_173                                   ; 36AC _ EB, 1B

?_172:  mov     eax, dword [ebp-0CH]                    ; 36AE _ 8B. 45, F4
        mov     edx, dword [ebp-10H]                    ; 36B1 _ 8B. 55, F0
        add     edx, 33                                 ; 36B4 _ 83. C2, 21
        shl     edx, 5                                  ; 36B7 _ C1. E2, 05
        add     eax, edx                                ; 36BA _ 01. D0
        add     eax, 16                                 ; 36BC _ 83. C0, 10
        mov     dword [eax], 0                          ; 36BF _ C7. 00, 00000000
        add     dword [ebp-10H], 1                      ; 36C5 _ 83. 45, F0, 01
?_173:  cmp     dword [ebp-10H], 255                    ; 36C9 _ 81. 7D, F0, 000000FF
        jle     ?_172                                   ; 36D0 _ 7E, DC
        mov     eax, dword [ebp+10H]                    ; 36D2 _ 8B. 45, 10
        imul    eax, dword [ebp+14H]                    ; 36D5 _ 0F AF. 45, 14
        mov     dword [esp+4H], eax                     ; 36D9 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 36DD _ 8B. 45, 08
        mov     dword [esp], eax                        ; 36E0 _ 89. 04 24
        call    memman_alloc_4k                         ; 36E3 _ E8, FFFFFFFC(rel)
        mov     edx, eax                                ; 36E8 _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 36EA _ 8B. 45, F4
        mov     dword [eax+10H], edx                    ; 36ED _ 89. 50, 10
        mov     eax, dword [ebp-0CH]                    ; 36F0 _ 8B. 45, F4
        mov     eax, dword [eax+10H]                    ; 36F3 _ 8B. 40, 10
        test    eax, eax                                ; 36F6 _ 85. C0
        jnz     ?_174                                   ; 36F8 _ 75, 21
        mov     eax, dword [ebp-0CH]                    ; 36FA _ 8B. 45, F4
        mov     dword [esp+8H], 9236                    ; 36FD _ C7. 44 24, 08, 00002414
        mov     dword [esp+4H], eax                     ; 3705 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 3709 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 370C _ 89. 04 24
        call    memman_free_4k                          ; 370F _ E8, FFFFFFFC(rel)
        mov     eax, 0                                  ; 3714 _ B8, 00000000
        jmp     ?_175                                   ; 3719 _ EB, 03

?_174:  mov     eax, dword [ebp-0CH]                    ; 371B _ 8B. 45, F4
?_175:  leave                                           ; 371E _ C9
        ret                                             ; 371F _ C3
; sheet_control_init End of function

sheet_alloc:; Function begin
        push    ebp                                     ; 3720 _ 55
        mov     ebp, esp                                ; 3721 _ 89. E5
        sub     esp, 16                                 ; 3723 _ 83. EC, 10
        mov     dword [ebp-8H], 0                       ; 3726 _ C7. 45, F8, 00000000
        jmp     ?_178                                   ; 372D _ EB, 5B

?_176:  mov     eax, dword [ebp+8H]                     ; 372F _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 3732 _ 8B. 55, F8
        add     edx, 33                                 ; 3735 _ 83. C2, 21
        shl     edx, 5                                  ; 3738 _ C1. E2, 05
        add     eax, edx                                ; 373B _ 01. D0
        add     eax, 16                                 ; 373D _ 83. C0, 10
        mov     eax, dword [eax]                        ; 3740 _ 8B. 00
        test    eax, eax                                ; 3742 _ 85. C0
        jnz     ?_177                                   ; 3744 _ 75, 40
        mov     eax, dword [ebp-8H]                     ; 3746 _ 8B. 45, F8
        shl     eax, 5                                  ; 3749 _ C1. E0, 05
        lea     edx, [eax+410H]                         ; 374C _ 8D. 90, 00000410
        mov     eax, dword [ebp+8H]                     ; 3752 _ 8B. 45, 08
        add     eax, edx                                ; 3755 _ 01. D0
        add     eax, 4                                  ; 3757 _ 83. C0, 04
        mov     dword [ebp-4H], eax                     ; 375A _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 375D _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 3760 _ 8B. 55, F8
        lea     ecx, [edx+4H]                           ; 3763 _ 8D. 4A, 04
        mov     edx, dword [ebp-4H]                     ; 3766 _ 8B. 55, FC
        mov     dword [eax+ecx*4+4H], edx               ; 3769 _ 89. 54 88, 04
        mov     eax, dword [ebp-4H]                     ; 376D _ 8B. 45, FC
        mov     dword [eax+1CH], 1                      ; 3770 _ C7. 40, 1C, 00000001
        mov     eax, dword [ebp-4H]                     ; 3777 _ 8B. 45, FC
        mov     dword [eax+18H], -1                     ; 377A _ C7. 40, 18, FFFFFFFF
        mov     eax, dword [ebp-4H]                     ; 3781 _ 8B. 45, FC
        jmp     ?_179                                   ; 3784 _ EB, 12

?_177:  add     dword [ebp-8H], 1                       ; 3786 _ 83. 45, F8, 01
?_178:  cmp     dword [ebp-8H], 255                     ; 378A _ 81. 7D, F8, 000000FF
        jle     ?_176                                   ; 3791 _ 7E, 9C
        mov     eax, 0                                  ; 3793 _ B8, 00000000
?_179:  leave                                           ; 3798 _ C9
        ret                                             ; 3799 _ C3
; sheet_alloc End of function

sheet_setbuf:; Function begin
        push    ebp                                     ; 379A _ 55
        mov     ebp, esp                                ; 379B _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 379D _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 37A0 _ 8B. 55, 0C
        mov     dword [eax], edx                        ; 37A3 _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 37A5 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 37A8 _ 8B. 55, 10
        mov     dword [eax+4H], edx                     ; 37AB _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 37AE _ 8B. 45, 08
        mov     edx, dword [ebp+14H]                    ; 37B1 _ 8B. 55, 14
        mov     dword [eax+8H], edx                     ; 37B4 _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 37B7 _ 8B. 45, 08
        mov     edx, dword [ebp+18H]                    ; 37BA _ 8B. 55, 18
        mov     dword [eax+14H], edx                    ; 37BD _ 89. 50, 14
        pop     ebp                                     ; 37C0 _ 5D
        ret                                             ; 37C1 _ C3
; sheet_setbuf End of function

sheet_updown:; Function begin
        push    ebp                                     ; 37C2 _ 55
        mov     ebp, esp                                ; 37C3 _ 89. E5
        push    esi                                     ; 37C5 _ 56
        push    ebx                                     ; 37C6 _ 53
        sub     esp, 48                                 ; 37C7 _ 83. EC, 30
        mov     eax, dword [ebp+0CH]                    ; 37CA _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 37CD _ 8B. 40, 18
        mov     dword [ebp-0CH], eax                    ; 37D0 _ 89. 45, F4
        mov     eax, dword [ebp+8H]                     ; 37D3 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 37D6 _ 8B. 40, 0C
        add     eax, 1                                  ; 37D9 _ 83. C0, 01
        cmp     eax, dword [ebp+10H]                    ; 37DC _ 3B. 45, 10
        jge     ?_180                                   ; 37DF _ 7D, 0C
        mov     eax, dword [ebp+8H]                     ; 37E1 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 37E4 _ 8B. 40, 0C
        add     eax, 1                                  ; 37E7 _ 83. C0, 01
        mov     dword [ebp+10H], eax                    ; 37EA _ 89. 45, 10
?_180:  cmp     dword [ebp+10H], -1                     ; 37ED _ 83. 7D, 10, FF
        jge     ?_181                                   ; 37F1 _ 7D, 07
        mov     dword [ebp+10H], -1                     ; 37F3 _ C7. 45, 10, FFFFFFFF
?_181:  mov     eax, dword [ebp+0CH]                    ; 37FA _ 8B. 45, 0C
        mov     edx, dword [ebp+10H]                    ; 37FD _ 8B. 55, 10
        mov     dword [eax+18H], edx                    ; 3800 _ 89. 50, 18
        mov     eax, dword [ebp-0CH]                    ; 3803 _ 8B. 45, F4
        cmp     eax, dword [ebp+10H]                    ; 3806 _ 3B. 45, 10
        jle     ?_188                                   ; 3809 _ 0F 8E, 00000201
        cmp     dword [ebp+10H], 0                      ; 380F _ 83. 7D, 10, 00
        js      ?_184                                   ; 3813 _ 0F 88, 000000F7
        mov     eax, dword [ebp-0CH]                    ; 3819 _ 8B. 45, F4
        mov     dword [ebp-10H], eax                    ; 381C _ 89. 45, F0
        jmp     ?_183                                   ; 381F _ EB, 34

?_182:  mov     eax, dword [ebp-10H]                    ; 3821 _ 8B. 45, F0
        lea     edx, [eax-1H]                           ; 3824 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 3827 _ 8B. 45, 08
        add     edx, 4                                  ; 382A _ 83. C2, 04
        mov     edx, dword [eax+edx*4+4H]               ; 382D _ 8B. 54 90, 04
        mov     eax, dword [ebp+8H]                     ; 3831 _ 8B. 45, 08
        mov     ecx, dword [ebp-10H]                    ; 3834 _ 8B. 4D, F0
        add     ecx, 4                                  ; 3837 _ 83. C1, 04
        mov     dword [eax+ecx*4+4H], edx               ; 383A _ 89. 54 88, 04
        mov     eax, dword [ebp+8H]                     ; 383E _ 8B. 45, 08
        mov     edx, dword [ebp-10H]                    ; 3841 _ 8B. 55, F0
        add     edx, 4                                  ; 3844 _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 3847 _ 8B. 44 90, 04
        mov     edx, dword [ebp-10H]                    ; 384B _ 8B. 55, F0
        mov     dword [eax+18H], edx                    ; 384E _ 89. 50, 18
        sub     dword [ebp-10H], 1                      ; 3851 _ 83. 6D, F0, 01
?_183:  mov     eax, dword [ebp-10H]                    ; 3855 _ 8B. 45, F0
        cmp     eax, dword [ebp+10H]                    ; 3858 _ 3B. 45, 10
        jg      ?_182                                   ; 385B _ 7F, C4
        mov     eax, dword [ebp+8H]                     ; 385D _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 3860 _ 8B. 55, 10
        lea     ecx, [edx+4H]                           ; 3863 _ 8D. 4A, 04
        mov     edx, dword [ebp+0CH]                    ; 3866 _ 8B. 55, 0C
        mov     dword [eax+ecx*4+4H], edx               ; 3869 _ 89. 54 88, 04
        mov     eax, dword [ebp+10H]                    ; 386D _ 8B. 45, 10
        lea     esi, [eax+1H]                           ; 3870 _ 8D. 70, 01
        mov     eax, dword [ebp+0CH]                    ; 3873 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 3876 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 3879 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 387C _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 387F _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 3882 _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 3885 _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 3888 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 388B _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 388E _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 3891 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 3894 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 3897 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 389A _ 8B. 40, 0C
        mov     dword [esp+14H], esi                    ; 389D _ 89. 74 24, 14
        mov     dword [esp+10H], ebx                    ; 38A1 _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 38A5 _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 38A9 _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 38AD _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 38B1 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 38B4 _ 89. 04 24
        call    sheet_refresh_map                       ; 38B7 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 38BC _ 8B. 45, 10
        lea     esi, [eax+1H]                           ; 38BF _ 8D. 70, 01
        mov     eax, dword [ebp+0CH]                    ; 38C2 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 38C5 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 38C8 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 38CB _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 38CE _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 38D1 _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 38D4 _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 38D7 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 38DA _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 38DD _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 38E0 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 38E3 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 38E6 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 38E9 _ 8B. 40, 0C
        mov     dword [esp+14H], esi                    ; 38EC _ 89. 74 24, 14
        mov     dword [esp+10H], ebx                    ; 38F0 _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 38F4 _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 38F8 _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 38FC _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 3900 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3903 _ 89. 04 24
        call    sheet_refresh_local                     ; 3906 _ E8, FFFFFFFC(rel)
        jmp     ?_195                                   ; 390B _ E9, 0000026C

?_184:  mov     eax, dword [ebp+8H]                     ; 3910 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 3913 _ 8B. 40, 0C
        cmp     eax, dword [ebp-0CH]                    ; 3916 _ 3B. 45, F4
        jle     ?_187                                   ; 3919 _ 7E, 47
        mov     eax, dword [ebp-0CH]                    ; 391B _ 8B. 45, F4
        mov     dword [ebp-10H], eax                    ; 391E _ 89. 45, F0
        jmp     ?_186                                   ; 3921 _ EB, 34

?_185:  mov     eax, dword [ebp-10H]                    ; 3923 _ 8B. 45, F0
        lea     edx, [eax+1H]                           ; 3926 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 3929 _ 8B. 45, 08
        add     edx, 4                                  ; 392C _ 83. C2, 04
        mov     edx, dword [eax+edx*4+4H]               ; 392F _ 8B. 54 90, 04
        mov     eax, dword [ebp+8H]                     ; 3933 _ 8B. 45, 08
        mov     ecx, dword [ebp-10H]                    ; 3936 _ 8B. 4D, F0
        add     ecx, 4                                  ; 3939 _ 83. C1, 04
        mov     dword [eax+ecx*4+4H], edx               ; 393C _ 89. 54 88, 04
        mov     eax, dword [ebp+8H]                     ; 3940 _ 8B. 45, 08
        mov     edx, dword [ebp-10H]                    ; 3943 _ 8B. 55, F0
        add     edx, 4                                  ; 3946 _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 3949 _ 8B. 44 90, 04
        mov     edx, dword [ebp-10H]                    ; 394D _ 8B. 55, F0
        mov     dword [eax+18H], edx                    ; 3950 _ 89. 50, 18
        add     dword [ebp-10H], 1                      ; 3953 _ 83. 45, F0, 01
?_186:  mov     eax, dword [ebp+8H]                     ; 3957 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 395A _ 8B. 40, 0C
        cmp     eax, dword [ebp-10H]                    ; 395D _ 3B. 45, F0
        jg      ?_185                                   ; 3960 _ 7F, C1
?_187:  mov     eax, dword [ebp+8H]                     ; 3962 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 3965 _ 8B. 40, 0C
        lea     edx, [eax-1H]                           ; 3968 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 396B _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 396E _ 89. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 3971 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 3974 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 3977 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 397A _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 397D _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 3980 _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 3983 _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 3986 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 3989 _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 398C _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 398F _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 3992 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 3995 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 3998 _ 8B. 40, 0C
        mov     dword [esp+14H], 0                      ; 399B _ C7. 44 24, 14, 00000000
        mov     dword [esp+10H], ebx                    ; 39A3 _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 39A7 _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 39AB _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 39AF _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 39B3 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 39B6 _ 89. 04 24
        call    sheet_refresh_map                       ; 39B9 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+0CH]                    ; 39BE _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 39C1 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 39C4 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 39C7 _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 39CA _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 39CD _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 39D0 _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 39D3 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 39D6 _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 39D9 _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 39DC _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 39DF _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 39E2 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 39E5 _ 8B. 40, 0C
        mov     dword [esp+14H], 0                      ; 39E8 _ C7. 44 24, 14, 00000000
        mov     dword [esp+10H], ebx                    ; 39F0 _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 39F4 _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 39F8 _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 39FC _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 3A00 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3A03 _ 89. 04 24
        call    sheet_refresh_local                     ; 3A06 _ E8, FFFFFFFC(rel)
        jmp     ?_195                                   ; 3A0B _ E9, 0000016C

?_188:  mov     eax, dword [ebp-0CH]                    ; 3A10 _ 8B. 45, F4
        cmp     eax, dword [ebp+10H]                    ; 3A13 _ 3B. 45, 10
        jge     ?_195                                   ; 3A16 _ 0F 8D, 00000160
        cmp     dword [ebp-0CH], 0                      ; 3A1C _ 83. 7D, F4, 00
        js      ?_191                                   ; 3A20 _ 78, 56
        mov     eax, dword [ebp-0CH]                    ; 3A22 _ 8B. 45, F4
        mov     dword [ebp-10H], eax                    ; 3A25 _ 89. 45, F0
        jmp     ?_190                                   ; 3A28 _ EB, 34

?_189:  mov     eax, dword [ebp-10H]                    ; 3A2A _ 8B. 45, F0
        lea     edx, [eax+1H]                           ; 3A2D _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 3A30 _ 8B. 45, 08
        add     edx, 4                                  ; 3A33 _ 83. C2, 04
        mov     edx, dword [eax+edx*4+4H]               ; 3A36 _ 8B. 54 90, 04
        mov     eax, dword [ebp+8H]                     ; 3A3A _ 8B. 45, 08
        mov     ecx, dword [ebp-10H]                    ; 3A3D _ 8B. 4D, F0
        add     ecx, 4                                  ; 3A40 _ 83. C1, 04
        mov     dword [eax+ecx*4+4H], edx               ; 3A43 _ 89. 54 88, 04
        mov     eax, dword [ebp+8H]                     ; 3A47 _ 8B. 45, 08
        mov     edx, dword [ebp-10H]                    ; 3A4A _ 8B. 55, F0
        add     edx, 4                                  ; 3A4D _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 3A50 _ 8B. 44 90, 04
        mov     edx, dword [ebp-10H]                    ; 3A54 _ 8B. 55, F0
        mov     dword [eax+18H], edx                    ; 3A57 _ 89. 50, 18
        add     dword [ebp-10H], 1                      ; 3A5A _ 83. 45, F0, 01
?_190:  mov     eax, dword [ebp-10H]                    ; 3A5E _ 8B. 45, F0
        cmp     eax, dword [ebp+10H]                    ; 3A61 _ 3B. 45, 10
        jl      ?_189                                   ; 3A64 _ 7C, C4
        mov     eax, dword [ebp+8H]                     ; 3A66 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 3A69 _ 8B. 55, 10
        lea     ecx, [edx+4H]                           ; 3A6C _ 8D. 4A, 04
        mov     edx, dword [ebp+0CH]                    ; 3A6F _ 8B. 55, 0C
        mov     dword [eax+ecx*4+4H], edx               ; 3A72 _ 89. 54 88, 04
        jmp     ?_194                                   ; 3A76 _ EB, 6C

?_191:  mov     eax, dword [ebp+8H]                     ; 3A78 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 3A7B _ 8B. 40, 0C
        mov     dword [ebp-10H], eax                    ; 3A7E _ 89. 45, F0
        jmp     ?_193                                   ; 3A81 _ EB, 3A

?_192:  mov     eax, dword [ebp-10H]                    ; 3A83 _ 8B. 45, F0
        lea     ecx, [eax+1H]                           ; 3A86 _ 8D. 48, 01
        mov     eax, dword [ebp+8H]                     ; 3A89 _ 8B. 45, 08
        mov     edx, dword [ebp-10H]                    ; 3A8C _ 8B. 55, F0
        add     edx, 4                                  ; 3A8F _ 83. C2, 04
        mov     edx, dword [eax+edx*4+4H]               ; 3A92 _ 8B. 54 90, 04
        mov     eax, dword [ebp+8H]                     ; 3A96 _ 8B. 45, 08
        add     ecx, 4                                  ; 3A99 _ 83. C1, 04
        mov     dword [eax+ecx*4+4H], edx               ; 3A9C _ 89. 54 88, 04
        mov     eax, dword [ebp-10H]                    ; 3AA0 _ 8B. 45, F0
        lea     edx, [eax+1H]                           ; 3AA3 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 3AA6 _ 8B. 45, 08
        add     edx, 4                                  ; 3AA9 _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 3AAC _ 8B. 44 90, 04
        mov     edx, dword [ebp-10H]                    ; 3AB0 _ 8B. 55, F0
        add     edx, 1                                  ; 3AB3 _ 83. C2, 01
        mov     dword [eax+18H], edx                    ; 3AB6 _ 89. 50, 18
        sub     dword [ebp-10H], 1                      ; 3AB9 _ 83. 6D, F0, 01
?_193:  mov     eax, dword [ebp-10H]                    ; 3ABD _ 8B. 45, F0
        cmp     eax, dword [ebp+10H]                    ; 3AC0 _ 3B. 45, 10
        jge     ?_192                                   ; 3AC3 _ 7D, BE
        mov     eax, dword [ebp+8H]                     ; 3AC5 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 3AC8 _ 8B. 55, 10
        lea     ecx, [edx+4H]                           ; 3ACB _ 8D. 4A, 04
        mov     edx, dword [ebp+0CH]                    ; 3ACE _ 8B. 55, 0C
        mov     dword [eax+ecx*4+4H], edx               ; 3AD1 _ 89. 54 88, 04
        mov     eax, dword [ebp+8H]                     ; 3AD5 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 3AD8 _ 8B. 40, 0C
        lea     edx, [eax+1H]                           ; 3ADB _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 3ADE _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 3AE1 _ 89. 50, 0C
?_194:  mov     eax, dword [ebp+0CH]                    ; 3AE4 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 3AE7 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 3AEA _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 3AED _ 8B. 40, 08
        lea     esi, [edx+eax]                          ; 3AF0 _ 8D. 34 02
        mov     eax, dword [ebp+0CH]                    ; 3AF3 _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 3AF6 _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 3AF9 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 3AFC _ 8B. 40, 04
        lea     ebx, [edx+eax]                          ; 3AFF _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 3B02 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 3B05 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 3B08 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 3B0B _ 8B. 40, 0C
        mov     ecx, dword [ebp+10H]                    ; 3B0E _ 8B. 4D, 10
        mov     dword [esp+14H], ecx                    ; 3B11 _ 89. 4C 24, 14
        mov     dword [esp+10H], esi                    ; 3B15 _ 89. 74 24, 10
        mov     dword [esp+0CH], ebx                    ; 3B19 _ 89. 5C 24, 0C
        mov     dword [esp+8H], edx                     ; 3B1D _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 3B21 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 3B25 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3B28 _ 89. 04 24
        call    sheet_refresh_map                       ; 3B2B _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+0CH]                    ; 3B30 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 3B33 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 3B36 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 3B39 _ 8B. 40, 08
        lea     esi, [edx+eax]                          ; 3B3C _ 8D. 34 02
        mov     eax, dword [ebp+0CH]                    ; 3B3F _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 3B42 _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 3B45 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 3B48 _ 8B. 40, 04
        lea     ebx, [edx+eax]                          ; 3B4B _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 3B4E _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 3B51 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 3B54 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 3B57 _ 8B. 40, 0C
        mov     ecx, dword [ebp+10H]                    ; 3B5A _ 8B. 4D, 10
        mov     dword [esp+14H], ecx                    ; 3B5D _ 89. 4C 24, 14
        mov     dword [esp+10H], esi                    ; 3B61 _ 89. 74 24, 10
        mov     dword [esp+0CH], ebx                    ; 3B65 _ 89. 5C 24, 0C
        mov     dword [esp+8H], edx                     ; 3B69 _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 3B6D _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 3B71 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3B74 _ 89. 04 24
        call    sheet_refresh_local                     ; 3B77 _ E8, FFFFFFFC(rel)
?_195:  add     esp, 48                                 ; 3B7C _ 83. C4, 30
        pop     ebx                                     ; 3B7F _ 5B
        pop     esi                                     ; 3B80 _ 5E
        pop     ebp                                     ; 3B81 _ 5D
        ret                                             ; 3B82 _ C3
; sheet_updown End of function

sheet_refresh:; Function begin
        push    ebp                                     ; 3B83 _ 55
        mov     ebp, esp                                ; 3B84 _ 89. E5
        push    edi                                     ; 3B86 _ 57
        push    esi                                     ; 3B87 _ 56
        push    ebx                                     ; 3B88 _ 53
        sub     esp, 44                                 ; 3B89 _ 83. EC, 2C
        mov     eax, dword [ebp+0CH]                    ; 3B8C _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 3B8F _ 8B. 40, 18
        test    eax, eax                                ; 3B92 _ 85. C0
        js      ?_196                                   ; 3B94 _ 78, 53
        mov     eax, dword [ebp+0CH]                    ; 3B96 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 3B99 _ 8B. 40, 18
        mov     edx, dword [ebp+0CH]                    ; 3B9C _ 8B. 55, 0C
        mov     ecx, dword [edx+10H]                    ; 3B9F _ 8B. 4A, 10
        mov     edx, dword [ebp+1CH]                    ; 3BA2 _ 8B. 55, 1C
        lea     esi, [ecx+edx]                          ; 3BA5 _ 8D. 34 11
        mov     edx, dword [ebp+0CH]                    ; 3BA8 _ 8B. 55, 0C
        mov     ecx, dword [edx+0CH]                    ; 3BAB _ 8B. 4A, 0C
        mov     edx, dword [ebp+18H]                    ; 3BAE _ 8B. 55, 18
        lea     ebx, [ecx+edx]                          ; 3BB1 _ 8D. 1C 11
        mov     edx, dword [ebp+0CH]                    ; 3BB4 _ 8B. 55, 0C
        mov     ecx, dword [edx+10H]                    ; 3BB7 _ 8B. 4A, 10
        mov     edx, dword [ebp+14H]                    ; 3BBA _ 8B. 55, 14
        add     ecx, edx                                ; 3BBD _ 01. D1
        mov     edx, dword [ebp+0CH]                    ; 3BBF _ 8B. 55, 0C
        mov     edi, dword [edx+0CH]                    ; 3BC2 _ 8B. 7A, 0C
        mov     edx, dword [ebp+10H]                    ; 3BC5 _ 8B. 55, 10
        add     edx, edi                                ; 3BC8 _ 01. FA
        mov     dword [esp+14H], eax                    ; 3BCA _ 89. 44 24, 14
        mov     dword [esp+10H], esi                    ; 3BCE _ 89. 74 24, 10
        mov     dword [esp+0CH], ebx                    ; 3BD2 _ 89. 5C 24, 0C
        mov     dword [esp+8H], ecx                     ; 3BD6 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 3BDA _ 89. 54 24, 04
        mov     eax, dword [ebp+8H]                     ; 3BDE _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3BE1 _ 89. 04 24
        call    sheet_refresh_local                     ; 3BE4 _ E8, FFFFFFFC(rel)
?_196:  mov     eax, 0                                  ; 3BE9 _ B8, 00000000
        add     esp, 44                                 ; 3BEE _ 83. C4, 2C
        pop     ebx                                     ; 3BF1 _ 5B
        pop     esi                                     ; 3BF2 _ 5E
        pop     edi                                     ; 3BF3 _ 5F
        pop     ebp                                     ; 3BF4 _ 5D
        ret                                             ; 3BF5 _ C3
; sheet_refresh End of function

sheet_slide:; Function begin
        push    ebp                                     ; 3BF6 _ 55
        mov     ebp, esp                                ; 3BF7 _ 89. E5
        push    ebx                                     ; 3BF9 _ 53
        sub     esp, 52                                 ; 3BFA _ 83. EC, 34
        mov     eax, dword [ebp+0CH]                    ; 3BFD _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 3C00 _ 8B. 40, 0C
        mov     dword [ebp-10H], eax                    ; 3C03 _ 89. 45, F0
        mov     eax, dword [ebp+0CH]                    ; 3C06 _ 8B. 45, 0C
        mov     eax, dword [eax+10H]                    ; 3C09 _ 8B. 40, 10
        mov     dword [ebp-0CH], eax                    ; 3C0C _ 89. 45, F4
        mov     eax, dword [ebp+0CH]                    ; 3C0F _ 8B. 45, 0C
        mov     edx, dword [ebp+10H]                    ; 3C12 _ 8B. 55, 10
        mov     dword [eax+0CH], edx                    ; 3C15 _ 89. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 3C18 _ 8B. 45, 0C
        mov     edx, dword [ebp+14H]                    ; 3C1B _ 8B. 55, 14
        mov     dword [eax+10H], edx                    ; 3C1E _ 89. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 3C21 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 3C24 _ 8B. 40, 18
        test    eax, eax                                ; 3C27 _ 85. C0
        js      ?_197                                   ; 3C29 _ 0F 88, 00000100
        mov     eax, dword [ebp+0CH]                    ; 3C2F _ 8B. 45, 0C
        mov     edx, dword [eax+8H]                     ; 3C32 _ 8B. 50, 08
        mov     eax, dword [ebp-0CH]                    ; 3C35 _ 8B. 45, F4
        add     edx, eax                                ; 3C38 _ 01. C2
        mov     eax, dword [ebp+0CH]                    ; 3C3A _ 8B. 45, 0C
        mov     ecx, dword [eax+4H]                     ; 3C3D _ 8B. 48, 04
        mov     eax, dword [ebp-10H]                    ; 3C40 _ 8B. 45, F0
        add     eax, ecx                                ; 3C43 _ 01. C8
        mov     dword [esp+14H], 0                      ; 3C45 _ C7. 44 24, 14, 00000000
        mov     dword [esp+10H], edx                    ; 3C4D _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 3C51 _ 89. 44 24, 0C
        mov     eax, dword [ebp-0CH]                    ; 3C55 _ 8B. 45, F4
        mov     dword [esp+8H], eax                     ; 3C58 _ 89. 44 24, 08
        mov     eax, dword [ebp-10H]                    ; 3C5C _ 8B. 45, F0
        mov     dword [esp+4H], eax                     ; 3C5F _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 3C63 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3C66 _ 89. 04 24
        call    sheet_refresh_map                       ; 3C69 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+0CH]                    ; 3C6E _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 3C71 _ 8B. 40, 18
        mov     edx, dword [ebp+0CH]                    ; 3C74 _ 8B. 55, 0C
        mov     ecx, dword [edx+8H]                     ; 3C77 _ 8B. 4A, 08
        mov     edx, dword [ebp+14H]                    ; 3C7A _ 8B. 55, 14
        add     ecx, edx                                ; 3C7D _ 01. D1
        mov     edx, dword [ebp+0CH]                    ; 3C7F _ 8B. 55, 0C
        mov     ebx, dword [edx+4H]                     ; 3C82 _ 8B. 5A, 04
        mov     edx, dword [ebp+10H]                    ; 3C85 _ 8B. 55, 10
        add     edx, ebx                                ; 3C88 _ 01. DA
        mov     dword [esp+14H], eax                    ; 3C8A _ 89. 44 24, 14
        mov     dword [esp+10H], ecx                    ; 3C8E _ 89. 4C 24, 10
        mov     dword [esp+0CH], edx                    ; 3C92 _ 89. 54 24, 0C
        mov     eax, dword [ebp+14H]                    ; 3C96 _ 8B. 45, 14
        mov     dword [esp+8H], eax                     ; 3C99 _ 89. 44 24, 08
        mov     eax, dword [ebp+10H]                    ; 3C9D _ 8B. 45, 10
        mov     dword [esp+4H], eax                     ; 3CA0 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 3CA4 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3CA7 _ 89. 04 24
        call    sheet_refresh_map                       ; 3CAA _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+0CH]                    ; 3CAF _ 8B. 45, 0C
        mov     edx, dword [eax+8H]                     ; 3CB2 _ 8B. 50, 08
        mov     eax, dword [ebp-0CH]                    ; 3CB5 _ 8B. 45, F4
        add     edx, eax                                ; 3CB8 _ 01. C2
        mov     eax, dword [ebp+0CH]                    ; 3CBA _ 8B. 45, 0C
        mov     ecx, dword [eax+4H]                     ; 3CBD _ 8B. 48, 04
        mov     eax, dword [ebp-10H]                    ; 3CC0 _ 8B. 45, F0
        add     eax, ecx                                ; 3CC3 _ 01. C8
        mov     dword [esp+14H], 0                      ; 3CC5 _ C7. 44 24, 14, 00000000
        mov     dword [esp+10H], edx                    ; 3CCD _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 3CD1 _ 89. 44 24, 0C
        mov     eax, dword [ebp-0CH]                    ; 3CD5 _ 8B. 45, F4
        mov     dword [esp+8H], eax                     ; 3CD8 _ 89. 44 24, 08
        mov     eax, dword [ebp-10H]                    ; 3CDC _ 8B. 45, F0
        mov     dword [esp+4H], eax                     ; 3CDF _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 3CE3 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3CE6 _ 89. 04 24
        call    sheet_refresh_local                     ; 3CE9 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+0CH]                    ; 3CEE _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 3CF1 _ 8B. 40, 18
        mov     edx, dword [ebp+0CH]                    ; 3CF4 _ 8B. 55, 0C
        mov     ecx, dword [edx+8H]                     ; 3CF7 _ 8B. 4A, 08
        mov     edx, dword [ebp+14H]                    ; 3CFA _ 8B. 55, 14
        add     ecx, edx                                ; 3CFD _ 01. D1
        mov     edx, dword [ebp+0CH]                    ; 3CFF _ 8B. 55, 0C
        mov     ebx, dword [edx+4H]                     ; 3D02 _ 8B. 5A, 04
        mov     edx, dword [ebp+10H]                    ; 3D05 _ 8B. 55, 10
        add     edx, ebx                                ; 3D08 _ 01. DA
        mov     dword [esp+14H], eax                    ; 3D0A _ 89. 44 24, 14
        mov     dword [esp+10H], ecx                    ; 3D0E _ 89. 4C 24, 10
        mov     dword [esp+0CH], edx                    ; 3D12 _ 89. 54 24, 0C
        mov     eax, dword [ebp+14H]                    ; 3D16 _ 8B. 45, 14
        mov     dword [esp+8H], eax                     ; 3D19 _ 89. 44 24, 08
        mov     eax, dword [ebp+10H]                    ; 3D1D _ 8B. 45, 10
        mov     dword [esp+4H], eax                     ; 3D20 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 3D24 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3D27 _ 89. 04 24
        call    sheet_refresh_local                     ; 3D2A _ E8, FFFFFFFC(rel)
?_197:  add     esp, 52                                 ; 3D2F _ 83. C4, 34
        pop     ebx                                     ; 3D32 _ 5B
        pop     ebp                                     ; 3D33 _ 5D
        ret                                             ; 3D34 _ C3
; sheet_slide End of function

sheet_refresh_local:; Function begin
        push    ebp                                     ; 3D35 _ 55
        mov     ebp, esp                                ; 3D36 _ 89. E5
        sub     esp, 48                                 ; 3D38 _ 83. EC, 30
        mov     eax, dword [ebp+8H]                     ; 3D3B _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 3D3E _ 8B. 00
        mov     dword [ebp-18H], eax                    ; 3D40 _ 89. 45, E8
        mov     eax, dword [ebp+8H]                     ; 3D43 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 3D46 _ 8B. 40, 10
        mov     dword [ebp-14H], eax                    ; 3D49 _ 89. 45, EC
        cmp     dword [ebp+0CH], 0                      ; 3D4C _ 83. 7D, 0C, 00
        jns     ?_198                                   ; 3D50 _ 79, 07
        mov     dword [ebp+0CH], 0                      ; 3D52 _ C7. 45, 0C, 00000000
?_198:  cmp     dword [ebp+10H], 0                      ; 3D59 _ 83. 7D, 10, 00
        jns     ?_199                                   ; 3D5D _ 79, 07
        mov     dword [ebp+10H], 0                      ; 3D5F _ C7. 45, 10, 00000000
?_199:  mov     eax, dword [ebp+8H]                     ; 3D66 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 3D69 _ 8B. 40, 04
        cmp     eax, dword [ebp+14H]                    ; 3D6C _ 3B. 45, 14
        jge     ?_200                                   ; 3D6F _ 7D, 09
        mov     eax, dword [ebp+8H]                     ; 3D71 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 3D74 _ 8B. 40, 04
        mov     dword [ebp+14H], eax                    ; 3D77 _ 89. 45, 14
?_200:  mov     eax, dword [ebp+8H]                     ; 3D7A _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 3D7D _ 8B. 40, 08
        cmp     eax, dword [ebp+18H]                    ; 3D80 _ 3B. 45, 18
        jge     ?_201                                   ; 3D83 _ 7D, 09
        mov     eax, dword [ebp+8H]                     ; 3D85 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 3D88 _ 8B. 40, 08
        mov     dword [ebp+18H], eax                    ; 3D8B _ 89. 45, 18
?_201:  mov     eax, dword [ebp+1CH]                    ; 3D8E _ 8B. 45, 1C
        mov     dword [ebp-24H], eax                    ; 3D91 _ 89. 45, DC
        jmp     ?_208                                   ; 3D94 _ E9, 00000119

?_202:  mov     eax, dword [ebp+8H]                     ; 3D99 _ 8B. 45, 08
        mov     edx, dword [ebp-24H]                    ; 3D9C _ 8B. 55, DC
        add     edx, 4                                  ; 3D9F _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 3DA2 _ 8B. 44 90, 04
        mov     dword [ebp-10H], eax                    ; 3DA6 _ 89. 45, F0
        mov     eax, dword [ebp-10H]                    ; 3DA9 _ 8B. 45, F0
        mov     eax, dword [eax]                        ; 3DAC _ 8B. 00
        mov     dword [ebp-0CH], eax                    ; 3DAE _ 89. 45, F4
        mov     edx, dword [ebp-10H]                    ; 3DB1 _ 8B. 55, F0
        mov     eax, dword [ebp+8H]                     ; 3DB4 _ 8B. 45, 08
        add     eax, 1044                               ; 3DB7 _ 05, 00000414
        sub     edx, eax                                ; 3DBC _ 29. C2
        mov     eax, edx                                ; 3DBE _ 89. D0
        sar     eax, 5                                  ; 3DC0 _ C1. F8, 05
        mov     byte [ebp-26H], al                      ; 3DC3 _ 88. 45, DA
        mov     dword [ebp-1CH], 0                      ; 3DC6 _ C7. 45, E4, 00000000
        jmp     ?_207                                   ; 3DCD _ E9, 000000CD

?_203:  mov     eax, dword [ebp-10H]                    ; 3DD2 _ 8B. 45, F0
        mov     edx, dword [eax+10H]                    ; 3DD5 _ 8B. 50, 10
        mov     eax, dword [ebp-1CH]                    ; 3DD8 _ 8B. 45, E4
        add     eax, edx                                ; 3DDB _ 01. D0
        mov     dword [ebp-8H], eax                     ; 3DDD _ 89. 45, F8
        mov     dword [ebp-20H], 0                      ; 3DE0 _ C7. 45, E0, 00000000
        jmp     ?_206                                   ; 3DE7 _ E9, 000000A0

?_204:  mov     eax, dword [ebp-10H]                    ; 3DEC _ 8B. 45, F0
        mov     edx, dword [eax+0CH]                    ; 3DEF _ 8B. 50, 0C
        mov     eax, dword [ebp-20H]                    ; 3DF2 _ 8B. 45, E0
        add     eax, edx                                ; 3DF5 _ 01. D0
        mov     dword [ebp-4H], eax                     ; 3DF7 _ 89. 45, FC
        mov     eax, dword [ebp+0CH]                    ; 3DFA _ 8B. 45, 0C
        cmp     eax, dword [ebp-4H]                     ; 3DFD _ 3B. 45, FC
        jg      ?_205                                   ; 3E00 _ 0F 8F, 00000082
        mov     eax, dword [ebp-4H]                     ; 3E06 _ 8B. 45, FC
        cmp     eax, dword [ebp+14H]                    ; 3E09 _ 3B. 45, 14
        jge     ?_205                                   ; 3E0C _ 7D, 7A
        mov     eax, dword [ebp+10H]                    ; 3E0E _ 8B. 45, 10
        cmp     eax, dword [ebp-8H]                     ; 3E11 _ 3B. 45, F8
        jg      ?_205                                   ; 3E14 _ 7F, 72
        mov     eax, dword [ebp-8H]                     ; 3E16 _ 8B. 45, F8
        cmp     eax, dword [ebp+18H]                    ; 3E19 _ 3B. 45, 18
        jge     ?_205                                   ; 3E1C _ 7D, 6A
        mov     eax, dword [ebp-10H]                    ; 3E1E _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 3E21 _ 8B. 40, 04
        imul    eax, dword [ebp-1CH]                    ; 3E24 _ 0F AF. 45, E4
        mov     edx, eax                                ; 3E28 _ 89. C2
        mov     eax, dword [ebp-20H]                    ; 3E2A _ 8B. 45, E0
        add     eax, edx                                ; 3E2D _ 01. D0
        mov     edx, eax                                ; 3E2F _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 3E31 _ 8B. 45, F4
        add     eax, edx                                ; 3E34 _ 01. D0
        movzx   eax, byte [eax]                         ; 3E36 _ 0F B6. 00
        mov     byte [ebp-25H], al                      ; 3E39 _ 88. 45, DB
        movzx   edx, byte [ebp-25H]                     ; 3E3C _ 0F B6. 55, DB
        mov     eax, dword [ebp-10H]                    ; 3E40 _ 8B. 45, F0
        mov     eax, dword [eax+14H]                    ; 3E43 _ 8B. 40, 14
        cmp     edx, eax                                ; 3E46 _ 39. C2
        jz      ?_205                                   ; 3E48 _ 74, 3E
        mov     eax, dword [ebp+8H]                     ; 3E4A _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 3E4D _ 8B. 40, 04
        imul    eax, dword [ebp-8H]                     ; 3E50 _ 0F AF. 45, F8
        mov     edx, eax                                ; 3E54 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 3E56 _ 8B. 45, FC
        add     eax, edx                                ; 3E59 _ 01. D0
        mov     edx, eax                                ; 3E5B _ 89. C2
        mov     eax, dword [ebp-14H]                    ; 3E5D _ 8B. 45, EC
        add     eax, edx                                ; 3E60 _ 01. D0
        movzx   eax, byte [eax]                         ; 3E62 _ 0F B6. 00
        cmp     al, byte [ebp-26H]                      ; 3E65 _ 3A. 45, DA
        jnz     ?_205                                   ; 3E68 _ 75, 1E
        mov     eax, dword [ebp+8H]                     ; 3E6A _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 3E6D _ 8B. 40, 04
        imul    eax, dword [ebp-8H]                     ; 3E70 _ 0F AF. 45, F8
        mov     edx, eax                                ; 3E74 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 3E76 _ 8B. 45, FC
        add     eax, edx                                ; 3E79 _ 01. D0
        mov     edx, eax                                ; 3E7B _ 89. C2
        mov     eax, dword [ebp-18H]                    ; 3E7D _ 8B. 45, E8
        add     edx, eax                                ; 3E80 _ 01. C2
        movzx   eax, byte [ebp-25H]                     ; 3E82 _ 0F B6. 45, DB
        mov     byte [edx], al                          ; 3E86 _ 88. 02
?_205:  add     dword [ebp-20H], 1                      ; 3E88 _ 83. 45, E0, 01
?_206:  mov     eax, dword [ebp-10H]                    ; 3E8C _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 3E8F _ 8B. 40, 04
        cmp     eax, dword [ebp-20H]                    ; 3E92 _ 3B. 45, E0
        jg      ?_204                                   ; 3E95 _ 0F 8F, FFFFFF51
        add     dword [ebp-1CH], 1                      ; 3E9B _ 83. 45, E4, 01
?_207:  mov     eax, dword [ebp-10H]                    ; 3E9F _ 8B. 45, F0
        mov     eax, dword [eax+8H]                     ; 3EA2 _ 8B. 40, 08
        cmp     eax, dword [ebp-1CH]                    ; 3EA5 _ 3B. 45, E4
        jg      ?_203                                   ; 3EA8 _ 0F 8F, FFFFFF24
        add     dword [ebp-24H], 1                      ; 3EAE _ 83. 45, DC, 01
?_208:  mov     eax, dword [ebp+8H]                     ; 3EB2 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 3EB5 _ 8B. 40, 0C
        cmp     eax, dword [ebp-24H]                    ; 3EB8 _ 3B. 45, DC
        jge     ?_202                                   ; 3EBB _ 0F 8D, FFFFFED8
        leave                                           ; 3EC1 _ C9
        ret                                             ; 3EC2 _ C3
; sheet_refresh_local End of function

sheet_refresh_map:; Function begin
        push    ebp                                     ; 3EC3 _ 55
        mov     ebp, esp                                ; 3EC4 _ 89. E5
        sub     esp, 64                                 ; 3EC6 _ 83. EC, 40
        mov     eax, dword [ebp+8H]                     ; 3EC9 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 3ECC _ 8B. 00
        mov     dword [ebp-18H], eax                    ; 3ECE _ 89. 45, E8
        mov     eax, dword [ebp+8H]                     ; 3ED1 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 3ED4 _ 8B. 40, 10
        mov     dword [ebp-14H], eax                    ; 3ED7 _ 89. 45, EC
        cmp     dword [ebp+0CH], 0                      ; 3EDA _ 83. 7D, 0C, 00
        jns     ?_209                                   ; 3EDE _ 79, 07
        mov     dword [ebp+0CH], 0                      ; 3EE0 _ C7. 45, 0C, 00000000
?_209:  cmp     dword [ebp+10H], 0                      ; 3EE7 _ 83. 7D, 10, 00
        jns     ?_210                                   ; 3EEB _ 79, 07
        mov     dword [ebp+10H], 0                      ; 3EED _ C7. 45, 10, 00000000
?_210:  mov     eax, dword [ebp+8H]                     ; 3EF4 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 3EF7 _ 8B. 40, 04
        cmp     eax, dword [ebp+14H]                    ; 3EFA _ 3B. 45, 14
        jge     ?_211                                   ; 3EFD _ 7D, 09
        mov     eax, dword [ebp+8H]                     ; 3EFF _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 3F02 _ 8B. 40, 04
        mov     dword [ebp+14H], eax                    ; 3F05 _ 89. 45, 14
?_211:  mov     eax, dword [ebp+8H]                     ; 3F08 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 3F0B _ 8B. 40, 08
        cmp     eax, dword [ebp+18H]                    ; 3F0E _ 3B. 45, 18
        jge     ?_212                                   ; 3F11 _ 7D, 09
        mov     eax, dword [ebp+8H]                     ; 3F13 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 3F16 _ 8B. 40, 08
        mov     dword [ebp+18H], eax                    ; 3F19 _ 89. 45, 18
?_212:  mov     eax, dword [ebp+1CH]                    ; 3F1C _ 8B. 45, 1C
        mov     dword [ebp-34H], eax                    ; 3F1F _ 89. 45, CC
        jmp     ?_223                                   ; 3F22 _ E9, 00000141

?_213:  mov     eax, dword [ebp+8H]                     ; 3F27 _ 8B. 45, 08
        mov     edx, dword [ebp-34H]                    ; 3F2A _ 8B. 55, CC
        add     edx, 4                                  ; 3F2D _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 3F30 _ 8B. 44 90, 04
        mov     dword [ebp-10H], eax                    ; 3F34 _ 89. 45, F0
        mov     edx, dword [ebp-10H]                    ; 3F37 _ 8B. 55, F0
        mov     eax, dword [ebp+8H]                     ; 3F3A _ 8B. 45, 08
        add     eax, 1044                               ; 3F3D _ 05, 00000414
        sub     edx, eax                                ; 3F42 _ 29. C2
        mov     eax, edx                                ; 3F44 _ 89. D0
        sar     eax, 5                                  ; 3F46 _ C1. F8, 05
        mov     byte [ebp-35H], al                      ; 3F49 _ 88. 45, CB
        mov     eax, dword [ebp-10H]                    ; 3F4C _ 8B. 45, F0
        mov     eax, dword [eax]                        ; 3F4F _ 8B. 00
        mov     dword [ebp-0CH], eax                    ; 3F51 _ 89. 45, F4
        mov     eax, dword [ebp-10H]                    ; 3F54 _ 8B. 45, F0
        mov     eax, dword [eax+0CH]                    ; 3F57 _ 8B. 40, 0C
        mov     edx, dword [ebp+0CH]                    ; 3F5A _ 8B. 55, 0C
        sub     edx, eax                                ; 3F5D _ 29. C2
        mov     eax, edx                                ; 3F5F _ 89. D0
        mov     dword [ebp-30H], eax                    ; 3F61 _ 89. 45, D0
        mov     eax, dword [ebp-10H]                    ; 3F64 _ 8B. 45, F0
        mov     eax, dword [eax+10H]                    ; 3F67 _ 8B. 40, 10
        mov     edx, dword [ebp+10H]                    ; 3F6A _ 8B. 55, 10
        sub     edx, eax                                ; 3F6D _ 29. C2
        mov     eax, edx                                ; 3F6F _ 89. D0
        mov     dword [ebp-2CH], eax                    ; 3F71 _ 89. 45, D4
        mov     eax, dword [ebp-10H]                    ; 3F74 _ 8B. 45, F0
        mov     eax, dword [eax+0CH]                    ; 3F77 _ 8B. 40, 0C
        mov     edx, dword [ebp+14H]                    ; 3F7A _ 8B. 55, 14
        sub     edx, eax                                ; 3F7D _ 29. C2
        mov     eax, edx                                ; 3F7F _ 89. D0
        mov     dword [ebp-28H], eax                    ; 3F81 _ 89. 45, D8
        mov     eax, dword [ebp-10H]                    ; 3F84 _ 8B. 45, F0
        mov     eax, dword [eax+10H]                    ; 3F87 _ 8B. 40, 10
        mov     edx, dword [ebp+18H]                    ; 3F8A _ 8B. 55, 18
        sub     edx, eax                                ; 3F8D _ 29. C2
        mov     eax, edx                                ; 3F8F _ 89. D0
        mov     dword [ebp-24H], eax                    ; 3F91 _ 89. 45, DC
        cmp     dword [ebp-30H], 0                      ; 3F94 _ 83. 7D, D0, 00
        jns     ?_214                                   ; 3F98 _ 79, 07
        mov     dword [ebp-30H], 0                      ; 3F9A _ C7. 45, D0, 00000000
?_214:  cmp     dword [ebp-2CH], 0                      ; 3FA1 _ 83. 7D, D4, 00
        jns     ?_215                                   ; 3FA5 _ 79, 07
        mov     dword [ebp-2CH], 0                      ; 3FA7 _ C7. 45, D4, 00000000
?_215:  mov     eax, dword [ebp-10H]                    ; 3FAE _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 3FB1 _ 8B. 40, 04
        cmp     eax, dword [ebp-28H]                    ; 3FB4 _ 3B. 45, D8
        jge     ?_216                                   ; 3FB7 _ 7D, 09
        mov     eax, dword [ebp-10H]                    ; 3FB9 _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 3FBC _ 8B. 40, 04
        mov     dword [ebp-28H], eax                    ; 3FBF _ 89. 45, D8
?_216:  mov     eax, dword [ebp-10H]                    ; 3FC2 _ 8B. 45, F0
        mov     eax, dword [eax+8H]                     ; 3FC5 _ 8B. 40, 08
        cmp     eax, dword [ebp-24H]                    ; 3FC8 _ 3B. 45, DC
        jge     ?_217                                   ; 3FCB _ 7D, 09
        mov     eax, dword [ebp-10H]                    ; 3FCD _ 8B. 45, F0
        mov     eax, dword [eax+8H]                     ; 3FD0 _ 8B. 40, 08
        mov     dword [ebp-24H], eax                    ; 3FD3 _ 89. 45, DC
?_217:  mov     eax, dword [ebp-2CH]                    ; 3FD6 _ 8B. 45, D4
        mov     dword [ebp-1CH], eax                    ; 3FD9 _ 89. 45, E4
        jmp     ?_222                                   ; 3FDC _ EB, 7A

?_218:  mov     eax, dword [ebp-10H]                    ; 3FDE _ 8B. 45, F0
        mov     edx, dword [eax+10H]                    ; 3FE1 _ 8B. 50, 10
        mov     eax, dword [ebp-1CH]                    ; 3FE4 _ 8B. 45, E4
        add     eax, edx                                ; 3FE7 _ 01. D0
        mov     dword [ebp-8H], eax                     ; 3FE9 _ 89. 45, F8
        mov     eax, dword [ebp-30H]                    ; 3FEC _ 8B. 45, D0
        mov     dword [ebp-20H], eax                    ; 3FEF _ 89. 45, E0
        jmp     ?_221                                   ; 3FF2 _ EB, 58

?_219:  mov     eax, dword [ebp-10H]                    ; 3FF4 _ 8B. 45, F0
        mov     edx, dword [eax+0CH]                    ; 3FF7 _ 8B. 50, 0C
        mov     eax, dword [ebp-20H]                    ; 3FFA _ 8B. 45, E0
        add     eax, edx                                ; 3FFD _ 01. D0
        mov     dword [ebp-4H], eax                     ; 3FFF _ 89. 45, FC
        mov     eax, dword [ebp-10H]                    ; 4002 _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 4005 _ 8B. 40, 04
        imul    eax, dword [ebp-1CH]                    ; 4008 _ 0F AF. 45, E4
        mov     edx, eax                                ; 400C _ 89. C2
        mov     eax, dword [ebp-20H]                    ; 400E _ 8B. 45, E0
        add     eax, edx                                ; 4011 _ 01. D0
        mov     edx, eax                                ; 4013 _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 4015 _ 8B. 45, F4
        add     eax, edx                                ; 4018 _ 01. D0
        movzx   eax, byte [eax]                         ; 401A _ 0F B6. 00
        movzx   edx, al                                 ; 401D _ 0F B6. D0
        mov     eax, dword [ebp-10H]                    ; 4020 _ 8B. 45, F0
        mov     eax, dword [eax+14H]                    ; 4023 _ 8B. 40, 14
        cmp     edx, eax                                ; 4026 _ 39. C2
        jz      ?_220                                   ; 4028 _ 74, 1E
        mov     eax, dword [ebp+8H]                     ; 402A _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 402D _ 8B. 40, 04
        imul    eax, dword [ebp-8H]                     ; 4030 _ 0F AF. 45, F8
        mov     edx, eax                                ; 4034 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 4036 _ 8B. 45, FC
        add     eax, edx                                ; 4039 _ 01. D0
        mov     edx, eax                                ; 403B _ 89. C2
        mov     eax, dword [ebp-14H]                    ; 403D _ 8B. 45, EC
        add     edx, eax                                ; 4040 _ 01. C2
        movzx   eax, byte [ebp-35H]                     ; 4042 _ 0F B6. 45, CB
        mov     byte [edx], al                          ; 4046 _ 88. 02
?_220:  add     dword [ebp-20H], 1                      ; 4048 _ 83. 45, E0, 01
?_221:  mov     eax, dword [ebp-20H]                    ; 404C _ 8B. 45, E0
        cmp     eax, dword [ebp-28H]                    ; 404F _ 3B. 45, D8
        jl      ?_219                                   ; 4052 _ 7C, A0
        add     dword [ebp-1CH], 1                      ; 4054 _ 83. 45, E4, 01
?_222:  mov     eax, dword [ebp-1CH]                    ; 4058 _ 8B. 45, E4
        cmp     eax, dword [ebp-24H]                    ; 405B _ 3B. 45, DC
        jl      ?_218                                   ; 405E _ 0F 8C, FFFFFF7A
        add     dword [ebp-34H], 1                      ; 4064 _ 83. 45, CC, 01
?_223:  mov     eax, dword [ebp+8H]                     ; 4068 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 406B _ 8B. 40, 0C
        cmp     eax, dword [ebp-34H]                    ; 406E _ 3B. 45, CC
        jge     ?_213                                   ; 4071 _ 0F 8D, FFFFFEB0
        leave                                           ; 4077 _ C9
        ret                                             ; 4078 _ C3
; sheet_refresh_map End of function

init_time_port:; Function begin
        push    ebp                                     ; 4079 _ 55
        mov     ebp, esp                                ; 407A _ 89. E5
        sub     esp, 40                                 ; 407C _ 83. EC, 28
        mov     dword [esp+4H], 52                      ; 407F _ C7. 44 24, 04, 00000034
        mov     dword [esp], 67                         ; 4087 _ C7. 04 24, 00000043
        call    io_out8                                 ; 408E _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 156                     ; 4093 _ C7. 44 24, 04, 0000009C
        mov     dword [esp], 64                         ; 409B _ C7. 04 24, 00000040
        call    io_out8                                 ; 40A2 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 46                      ; 40A7 _ C7. 44 24, 04, 0000002E
        mov     dword [esp], 64                         ; 40AF _ C7. 04 24, 00000040
        call    io_out8                                 ; 40B6 _ E8, FFFFFFFC(rel)
        mov     dword [timer_control], 0                ; 40BB _ C7. 05, 00000300(d), 00000000
        mov     dword [ebp-0CH], 0                      ; 40C5 _ C7. 45, F4, 00000000
        jmp     ?_225                                   ; 40CC _ EB, 28

?_224:  mov     eax, dword [ebp-0CH]                    ; 40CE _ 8B. 45, F4
        shl     eax, 4                                  ; 40D1 _ C1. E0, 04
        add     eax, timer_control                      ; 40D4 _ 05, 00000300(d)
        mov     dword [eax+8H], 0                       ; 40D9 _ C7. 40, 08, 00000000
        mov     eax, dword [ebp-0CH]                    ; 40E0 _ 8B. 45, F4
        shl     eax, 4                                  ; 40E3 _ C1. E0, 04
        add     eax, timer_control                      ; 40E6 _ 05, 00000300(d)
        mov     dword [eax+0CH], 0                      ; 40EB _ C7. 40, 0C, 00000000
        add     dword [ebp-0CH], 1                      ; 40F2 _ 83. 45, F4, 01
?_225:  cmp     dword [ebp-0CH], 499                    ; 40F6 _ 81. 7D, F4, 000001F3
        jle     ?_224                                   ; 40FD _ 7E, CF
        leave                                           ; 40FF _ C9
        ret                                             ; 4100 _ C3
; init_time_port End of function

get_timer_control:; Function begin
        push    ebp                                     ; 4101 _ 55
        mov     ebp, esp                                ; 4102 _ 89. E5
        mov     eax, timer_control                      ; 4104 _ B8, 00000300(d)
        pop     ebp                                     ; 4109 _ 5D
        ret                                             ; 410A _ C3
; get_timer_control End of function

timer_alloc:; Function begin
        push    ebp                                     ; 410B _ 55
        mov     ebp, esp                                ; 410C _ 89. E5
        sub     esp, 16                                 ; 410E _ 83. EC, 10
        mov     dword [ebp-4H], 0                       ; 4111 _ C7. 45, FC, 00000000
        jmp     ?_228                                   ; 4118 _ EB, 26

?_226:  mov     eax, dword [ebp-4H]                     ; 411A _ 8B. 45, FC
        shl     eax, 4                                  ; 411D _ C1. E0, 04
        add     eax, timer_control                      ; 4120 _ 05, 00000300(d)
        mov     eax, dword [eax+8H]                     ; 4125 _ 8B. 40, 08
        test    eax, eax                                ; 4128 _ 85. C0
        jnz     ?_227                                   ; 412A _ 75, 10
        mov     eax, dword [ebp-4H]                     ; 412C _ 8B. 45, FC
        shl     eax, 4                                  ; 412F _ C1. E0, 04
        add     eax, timer_control                      ; 4132 _ 05, 00000300(d)
        add     eax, 4                                  ; 4137 _ 83. C0, 04
        jmp     ?_229                                   ; 413A _ EB, 0D

?_227:  add     dword [ebp-4H], 1                       ; 413C _ 83. 45, FC, 01
?_228:  cmp     dword [ebp-4H], 499                     ; 4140 _ 81. 7D, FC, 000001F3
        jle     ?_226                                   ; 4147 _ 7E, D1
?_229:  leave                                           ; 4149 _ C9
        ret                                             ; 414A _ C3
; timer_alloc End of function

timer_free:; Function begin
        push    ebp                                     ; 414B _ 55
        mov     ebp, esp                                ; 414C _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 414E _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 4151 _ C7. 40, 04, 00000000
        pop     ebp                                     ; 4158 _ 5D
        ret                                             ; 4159 _ C3
; timer_free End of function

timer_init:; Function begin
        push    ebp                                     ; 415A _ 55
        mov     ebp, esp                                ; 415B _ 89. E5
        sub     esp, 4                                  ; 415D _ 83. EC, 04
        mov     eax, dword [ebp+10H]                    ; 4160 _ 8B. 45, 10
        mov     byte [ebp-4H], al                       ; 4163 _ 88. 45, FC
        mov     eax, dword [ebp+8H]                     ; 4166 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 4169 _ 8B. 55, 0C
        mov     dword [eax+8H], edx                     ; 416C _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 416F _ 8B. 45, 08
        movzx   edx, byte [ebp-4H]                      ; 4172 _ 0F B6. 55, FC
        mov     byte [eax+0CH], dl                      ; 4176 _ 88. 50, 0C
        leave                                           ; 4179 _ C9
        ret                                             ; 417A _ C3
; timer_init End of function

timer_settime:; Function begin
        push    ebp                                     ; 417B _ 55
        mov     ebp, esp                                ; 417C _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 417E _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 4181 _ 8B. 55, 0C
        mov     dword [eax], edx                        ; 4184 _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 4186 _ 8B. 45, 08
        mov     dword [eax+4H], 2                       ; 4189 _ C7. 40, 04, 00000002
        pop     ebp                                     ; 4190 _ 5D
        ret                                             ; 4191 _ C3
; timer_settime End of function

intHandlerTimer:; Function begin
        push    ebp                                     ; 4192 _ 55
        mov     ebp, esp                                ; 4193 _ 89. E5
        sub     esp, 40                                 ; 4195 _ 83. EC, 28
        mov     dword [esp+4H], 32                      ; 4198 _ C7. 44 24, 04, 00000020
        mov     dword [esp], 32                         ; 41A0 _ C7. 04 24, 00000020
        call    io_out8                                 ; 41A7 _ E8, FFFFFFFC(rel)
        mov     eax, dword [timer_control]              ; 41AC _ A1, 00000300(d)
        add     eax, 1                                  ; 41B1 _ 83. C0, 01
        mov     dword [timer_control], eax              ; 41B4 _ A3, 00000300(d)
        mov     byte [ebp-0DH], 0                       ; 41B9 _ C6. 45, F3, 00
        mov     dword [ebp-0CH], 0                      ; 41BD _ C7. 45, F4, 00000000
        jmp     ?_233                                   ; 41C4 _ E9, 000000B0

?_230:  mov     eax, dword [ebp-0CH]                    ; 41C9 _ 8B. 45, F4
        shl     eax, 4                                  ; 41CC _ C1. E0, 04
        add     eax, timer_control                      ; 41CF _ 05, 00000300(d)
        mov     eax, dword [eax+8H]                     ; 41D4 _ 8B. 40, 08
        cmp     eax, 2                                  ; 41D7 _ 83. F8, 02
        jne     ?_231                                   ; 41DA _ 0F 85, 0000008A
        mov     eax, dword [ebp-0CH]                    ; 41E0 _ 8B. 45, F4
        shl     eax, 4                                  ; 41E3 _ C1. E0, 04
        add     eax, timer_control                      ; 41E6 _ 05, 00000300(d)
        mov     eax, dword [eax+4H]                     ; 41EB _ 8B. 40, 04
        lea     edx, [eax-1H]                           ; 41EE _ 8D. 50, FF
        mov     eax, dword [ebp-0CH]                    ; 41F1 _ 8B. 45, F4
        shl     eax, 4                                  ; 41F4 _ C1. E0, 04
        add     eax, timer_control                      ; 41F7 _ 05, 00000300(d)
        mov     dword [eax+4H], edx                     ; 41FC _ 89. 50, 04
        mov     eax, dword [ebp-0CH]                    ; 41FF _ 8B. 45, F4
        shl     eax, 4                                  ; 4202 _ C1. E0, 04
        add     eax, timer_control                      ; 4205 _ 05, 00000300(d)
        mov     eax, dword [eax+4H]                     ; 420A _ 8B. 40, 04
        test    eax, eax                                ; 420D _ 85. C0
        jnz     ?_231                                   ; 420F _ 75, 59
        mov     eax, dword [ebp-0CH]                    ; 4211 _ 8B. 45, F4
        shl     eax, 4                                  ; 4214 _ C1. E0, 04
        add     eax, timer_control                      ; 4217 _ 05, 00000300(d)
        mov     dword [eax+8H], 1                       ; 421C _ C7. 40, 08, 00000001
        mov     eax, dword [ebp-0CH]                    ; 4223 _ 8B. 45, F4
        shl     eax, 4                                  ; 4226 _ C1. E0, 04
        add     eax, timer_control                      ; 4229 _ 05, 00000300(d)
        movzx   eax, byte [eax+10H]                     ; 422E _ 0F B6. 40, 10
        movzx   edx, al                                 ; 4232 _ 0F B6. D0
        mov     eax, dword [ebp-0CH]                    ; 4235 _ 8B. 45, F4
        shl     eax, 4                                  ; 4238 _ C1. E0, 04
        add     eax, timer_control                      ; 423B _ 05, 00000300(d)
        mov     eax, dword [eax+0CH]                    ; 4240 _ 8B. 40, 0C
        mov     dword [esp+4H], edx                     ; 4243 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 4247 _ 89. 04 24
        call    fifo8_put                               ; 424A _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 424F _ 8B. 45, F4
        shl     eax, 4                                  ; 4252 _ C1. E0, 04
        add     eax, timer_control                      ; 4255 _ 05, 00000300(d)
        lea     edx, [eax+4H]                           ; 425A _ 8D. 50, 04
        mov     eax, dword [task_timer]                 ; 425D _ A1, 00000000(d)
        cmp     edx, eax                                ; 4262 _ 39. C2
        jnz     ?_231                                   ; 4264 _ 75, 04
        mov     byte [ebp-0DH], 1                       ; 4266 _ C6. 45, F3, 01
?_231:  cmp     byte [ebp-0DH], 0                       ; 426A _ 80. 7D, F3, 00
        jz      ?_232                                   ; 426E _ 74, 05
        call    task_switch                             ; 4270 _ E8, FFFFFFFC(rel)
?_232:  add     dword [ebp-0CH], 1                      ; 4275 _ 83. 45, F4, 01
?_233:  cmp     dword [ebp-0CH], 499                    ; 4279 _ 81. 7D, F4, 000001F3
        jle     ?_230                                   ; 4280 _ 0F 8E, FFFFFF43
        leave                                           ; 4286 _ C9
        ret                                             ; 4287 _ C3
; intHandlerTimer End of function

segment_descriptor:; Function begin
        push    ebp                                     ; 4288 _ 55
        mov     ebp, esp                                ; 4289 _ 89. E5
        cmp     dword [ebp+0CH], 1048575                ; 428B _ 81. 7D, 0C, 000FFFFF
        jbe     ?_234                                   ; 4292 _ 76, 10
        or      dword [ebp+14H], 8000H                  ; 4294 _ 81. 4D, 14, 00008000
        mov     eax, dword [ebp+0CH]                    ; 429B _ 8B. 45, 0C
        shr     eax, 12                                 ; 429E _ C1. E8, 0C
        mov     dword [ebp+0CH], eax                    ; 42A1 _ 89. 45, 0C
?_234:  mov     eax, dword [ebp+0CH]                    ; 42A4 _ 8B. 45, 0C
        mov     edx, eax                                ; 42A7 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 42A9 _ 8B. 45, 08
        mov     word [eax], dx                          ; 42AC _ 66: 89. 10
        mov     eax, dword [ebp+10H]                    ; 42AF _ 8B. 45, 10
        mov     edx, eax                                ; 42B2 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 42B4 _ 8B. 45, 08
        mov     word [eax+2H], dx                       ; 42B7 _ 66: 89. 50, 02
        mov     eax, dword [ebp+10H]                    ; 42BB _ 8B. 45, 10
        sar     eax, 16                                 ; 42BE _ C1. F8, 10
        mov     edx, eax                                ; 42C1 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 42C3 _ 8B. 45, 08
        mov     byte [eax+4H], dl                       ; 42C6 _ 88. 50, 04
        mov     eax, dword [ebp+14H]                    ; 42C9 _ 8B. 45, 14
        mov     edx, eax                                ; 42CC _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 42CE _ 8B. 45, 08
        mov     byte [eax+5H], dl                       ; 42D1 _ 88. 50, 05
        mov     eax, dword [ebp+0CH]                    ; 42D4 _ 8B. 45, 0C
        shr     eax, 16                                 ; 42D7 _ C1. E8, 10
        and     eax, 0FH                                ; 42DA _ 83. E0, 0F
        mov     edx, eax                                ; 42DD _ 89. C2
        mov     eax, dword [ebp+14H]                    ; 42DF _ 8B. 45, 14
        sar     eax, 8                                  ; 42E2 _ C1. F8, 08
        and     eax, 0FFFFFFF0H                         ; 42E5 _ 83. E0, F0
        or      eax, edx                                ; 42E8 _ 09. D0
        mov     edx, eax                                ; 42EA _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 42EC _ 8B. 45, 08
        mov     byte [eax+6H], dl                       ; 42EF _ 88. 50, 06
        mov     eax, dword [ebp+10H]                    ; 42F2 _ 8B. 45, 10
        shr     eax, 24                                 ; 42F5 _ C1. E8, 18
        mov     edx, eax                                ; 42F8 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 42FA _ 8B. 45, 08
        mov     byte [eax+7H], dl                       ; 42FD _ 88. 50, 07
        pop     ebp                                     ; 4300 _ 5D
        ret                                             ; 4301 _ C3
; segment_descriptor End of function

init_task_level:; Function begin
        push    ebp                                     ; 4302 _ 55
        mov     ebp, esp                                ; 4303 _ 89. E5
        sub     esp, 16                                 ; 4305 _ 83. EC, 10
        mov     ecx, dword [task_control]               ; 4308 _ 8B. 0D, 00002248(d)
        mov     edx, dword [ebp+8H]                     ; 430E _ 8B. 55, 08
        mov     eax, edx                                ; 4311 _ 89. D0
        shl     eax, 2                                  ; 4313 _ C1. E0, 02
        add     eax, edx                                ; 4316 _ 01. D0
        shl     eax, 2                                  ; 4318 _ C1. E0, 02
        add     eax, ecx                                ; 431B _ 01. C8
        add     eax, 8                                  ; 431D _ 83. C0, 08
        mov     dword [eax], 0                          ; 4320 _ C7. 00, 00000000
        mov     ecx, dword [task_control]               ; 4326 _ 8B. 0D, 00002248(d)
        mov     edx, dword [ebp+8H]                     ; 432C _ 8B. 55, 08
        mov     eax, edx                                ; 432F _ 89. D0
        shl     eax, 2                                  ; 4331 _ C1. E0, 02
        add     eax, edx                                ; 4334 _ 01. D0
        shl     eax, 2                                  ; 4336 _ C1. E0, 02
        add     eax, ecx                                ; 4339 _ 01. C8
        add     eax, 12                                 ; 433B _ 83. C0, 0C
        mov     dword [eax], 0                          ; 433E _ C7. 00, 00000000
        mov     dword [ebp-4H], 0                       ; 4344 _ C7. 45, FC, 00000000
        jmp     ?_236                                   ; 434B _ EB, 21

?_235:  mov     ecx, dword [task_control]               ; 434D _ 8B. 0D, 00002248(d)
        mov     edx, dword [ebp-4H]                     ; 4353 _ 8B. 55, FC
        mov     eax, edx                                ; 4356 _ 89. D0
        add     eax, eax                                ; 4358 _ 01. C0
        add     eax, edx                                ; 435A _ 01. D0
        shl     eax, 3                                  ; 435C _ C1. E0, 03
        add     eax, ecx                                ; 435F _ 01. C8
        add     eax, 16                                 ; 4361 _ 83. C0, 10
        mov     dword [eax], 0                          ; 4364 _ C7. 00, 00000000
        add     dword [ebp-4H], 1                       ; 436A _ 83. 45, FC, 01
?_236:  cmp     dword [ebp-4H], 2                       ; 436E _ 83. 7D, FC, 02
        jle     ?_235                                   ; 4372 _ 7E, D9
        leave                                           ; 4374 _ C9
        ret                                             ; 4375 _ C3
; init_task_level End of function

task_init:; Function begin
        push    ebp                                     ; 4376 _ 55
        mov     ebp, esp                                ; 4377 _ 89. E5
        sub     esp, 40                                 ; 4379 _ 83. EC, 28
        call    get_addr_gdt                            ; 437C _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 4381 _ 89. 45, F0
        mov     dword [esp+4H], 668                     ; 4384 _ C7. 44 24, 04, 0000029C
        mov     eax, dword [ebp+8H]                     ; 438C _ 8B. 45, 08
        mov     dword [esp], eax                        ; 438F _ 89. 04 24
        call    memman_alloc_4k                         ; 4392 _ E8, FFFFFFFC(rel)
        mov     dword [task_control], eax               ; 4397 _ A3, 00002248(d)
        mov     dword [ebp-14H], 0                      ; 439C _ C7. 45, EC, 00000000
        jmp     ?_238                                   ; 43A3 _ E9, 00000085

?_237:  mov     edx, dword [task_control]               ; 43A8 _ 8B. 15, 00002248(d)
        mov     eax, dword [ebp-14H]                    ; 43AE _ 8B. 45, EC
        imul    eax, eax, 148                           ; 43B1 _ 69. C0, 00000094
        add     eax, edx                                ; 43B7 _ 01. D0
        add     eax, 72                                 ; 43B9 _ 83. C0, 48
        mov     dword [eax], 0                          ; 43BC _ C7. 00, 00000000
        mov     ecx, dword [task_control]               ; 43C2 _ 8B. 0D, 00002248(d)
        mov     eax, dword [ebp-14H]                    ; 43C8 _ 8B. 45, EC
        add     eax, 8                                  ; 43CB _ 83. C0, 08
        lea     edx, [eax*8]                            ; 43CE _ 8D. 14 C5, 00000000
        mov     eax, dword [ebp-14H]                    ; 43D5 _ 8B. 45, EC
        imul    eax, eax, 148                           ; 43D8 _ 69. C0, 00000094
        add     eax, ecx                                ; 43DE _ 01. C8
        add     eax, 68                                 ; 43E0 _ 83. C0, 44
        mov     dword [eax], edx                        ; 43E3 _ 89. 10
        mov     eax, dword [task_control]               ; 43E5 _ A1, 00002248(d)
        mov     edx, dword [ebp-14H]                    ; 43EA _ 8B. 55, EC
        imul    edx, edx, 148                           ; 43ED _ 69. D2, 00000094
        add     edx, 96                                 ; 43F3 _ 83. C2, 60
        add     eax, edx                                ; 43F6 _ 01. D0
        add     eax, 16                                 ; 43F8 _ 83. C0, 10
        mov     edx, dword [ebp-14H]                    ; 43FB _ 8B. 55, EC
        add     edx, 8                                  ; 43FE _ 83. C2, 08
        lea     ecx, [edx*8]                            ; 4401 _ 8D. 0C D5, 00000000
        mov     edx, dword [ebp-10H]                    ; 4408 _ 8B. 55, F0
        add     edx, ecx                                ; 440B _ 01. CA
        mov     dword [esp+0CH], 137                    ; 440D _ C7. 44 24, 0C, 00000089
        mov     dword [esp+8H], eax                     ; 4415 _ 89. 44 24, 08
        mov     dword [esp+4H], 103                     ; 4419 _ C7. 44 24, 04, 00000067
        mov     dword [esp], edx                        ; 4421 _ 89. 14 24
        call    segment_descriptor                      ; 4424 _ E8, FFFFFFFC(rel)
        add     dword [ebp-14H], 1                      ; 4429 _ 83. 45, EC, 01
?_238:  cmp     dword [ebp-14H], 4                      ; 442D _ 83. 7D, EC, 04
        jle     ?_237                                   ; 4431 _ 0F 8E, FFFFFF71
        mov     dword [ebp-14H], 0                      ; 4437 _ C7. 45, EC, 00000000
        jmp     ?_240                                   ; 443E _ EB, 0F

?_239:  mov     eax, dword [ebp-14H]                    ; 4440 _ 8B. 45, EC
        mov     dword [esp], eax                        ; 4443 _ 89. 04 24
        call    init_task_level                         ; 4446 _ E8, FFFFFFFC(rel)
        add     dword [ebp-14H], 1                      ; 444B _ 83. 45, EC, 01
?_240:  cmp     dword [ebp-14H], 2                      ; 444F _ 83. 7D, EC, 02
        jle     ?_239                                   ; 4453 _ 7E, EB
        call    task_alloc                              ; 4455 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 445A _ 89. 45, F4
        mov     eax, dword [ebp-0CH]                    ; 445D _ 8B. 45, F4
        mov     dword [eax+4H], 2                       ; 4460 _ C7. 40, 04, 00000002
        mov     eax, dword [ebp-0CH]                    ; 4467 _ 8B. 45, F4
        mov     dword [eax+8H], 100                     ; 446A _ C7. 40, 08, 00000064
        mov     eax, dword [ebp-0CH]                    ; 4471 _ 8B. 45, F4
        mov     dword [eax+0CH], 0                      ; 4474 _ C7. 40, 0C, 00000000
        mov     eax, dword [ebp-0CH]                    ; 447B _ 8B. 45, F4
        mov     dword [esp], eax                        ; 447E _ 89. 04 24
        call    task_add                                ; 4481 _ E8, FFFFFFFC(rel)
        call    task_switch_sub                         ; 4486 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 448B _ 8B. 45, F4
        mov     eax, dword [eax]                        ; 448E _ 8B. 00
        mov     dword [esp], eax                        ; 4490 _ 89. 04 24
        call    load_tr                                 ; 4493 _ E8, FFFFFFFC(rel)
        call    timer_alloc                             ; 4498 _ E8, FFFFFFFC(rel)
        mov     dword [task_timer], eax                 ; 449D _ A3, 00002244(d)
        mov     eax, dword [ebp-0CH]                    ; 44A2 _ 8B. 45, F4
        mov     eax, dword [eax+8H]                     ; 44A5 _ 8B. 40, 08
        mov     edx, eax                                ; 44A8 _ 89. C2
        mov     eax, dword [task_timer]                 ; 44AA _ A1, 00002244(d)
        mov     dword [esp+4H], edx                     ; 44AF _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 44B3 _ 89. 04 24
        call    timer_settime                           ; 44B6 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 44BB _ 8B. 45, F4
        leave                                           ; 44BE _ C9
        ret                                             ; 44BF _ C3
; task_init End of function

task_alloc:; Function begin
        push    ebp                                     ; 44C0 _ 55
        mov     ebp, esp                                ; 44C1 _ 89. E5
        sub     esp, 16                                 ; 44C3 _ 83. EC, 10
        mov     dword [ebp-8H], 0                       ; 44C6 _ C7. 45, F8, 00000000
        jmp     ?_243                                   ; 44CD _ E9, 000000F6

?_241:  mov     edx, dword [task_control]               ; 44D2 _ 8B. 15, 00002248(d)
        mov     eax, dword [ebp-8H]                     ; 44D8 _ 8B. 45, F8
        imul    eax, eax, 148                           ; 44DB _ 69. C0, 00000094
        add     eax, edx                                ; 44E1 _ 01. D0
        add     eax, 72                                 ; 44E3 _ 83. C0, 48
        mov     eax, dword [eax]                        ; 44E6 _ 8B. 00
        test    eax, eax                                ; 44E8 _ 85. C0
        jne     ?_242                                   ; 44EA _ 0F 85, 000000D4
        mov     eax, dword [task_control]               ; 44F0 _ A1, 00002248(d)
        mov     edx, dword [ebp-8H]                     ; 44F5 _ 8B. 55, F8
        imul    edx, edx, 148                           ; 44F8 _ 69. D2, 00000094
        add     edx, 64                                 ; 44FE _ 83. C2, 40
        add     eax, edx                                ; 4501 _ 01. D0
        add     eax, 4                                  ; 4503 _ 83. C0, 04
        mov     dword [ebp-4H], eax                     ; 4506 _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 4509 _ 8B. 45, FC
        mov     dword [eax+4H], 1                       ; 450C _ C7. 40, 04, 00000001
        mov     eax, dword [ebp-4H]                     ; 4513 _ 8B. 45, FC
        mov     dword [eax+50H], 514                    ; 4516 _ C7. 40, 50, 00000202
        mov     eax, dword [ebp-4H]                     ; 451D _ 8B. 45, FC
        mov     dword [eax+54H], 0                      ; 4520 _ C7. 40, 54, 00000000
        mov     eax, dword [ebp-4H]                     ; 4527 _ 8B. 45, FC
        mov     dword [eax+58H], 0                      ; 452A _ C7. 40, 58, 00000000
        mov     eax, dword [ebp-4H]                     ; 4531 _ 8B. 45, FC
        mov     dword [eax+5CH], 0                      ; 4534 _ C7. 40, 5C, 00000000
        mov     eax, dword [ebp-4H]                     ; 453B _ 8B. 45, FC
        mov     dword [eax+60H], 0                      ; 453E _ C7. 40, 60, 00000000
        mov     eax, dword [ebp-8H]                     ; 4545 _ 8B. 45, F8
        add     eax, 1                                  ; 4548 _ 83. C0, 01
        shl     eax, 9                                  ; 454B _ C1. E0, 09
        mov     edx, eax                                ; 454E _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 4550 _ 8B. 45, FC
        mov     dword [eax+64H], edx                    ; 4553 _ 89. 50, 64
        mov     eax, dword [ebp-4H]                     ; 4556 _ 8B. 45, FC
        mov     dword [eax+68H], 0                      ; 4559 _ C7. 40, 68, 00000000
        mov     eax, dword [ebp-4H]                     ; 4560 _ 8B. 45, FC
        mov     dword [eax+6CH], 0                      ; 4563 _ C7. 40, 6C, 00000000
        mov     eax, dword [ebp-4H]                     ; 456A _ 8B. 45, FC
        mov     dword [eax+70H], 0                      ; 456D _ C7. 40, 70, 00000000
        mov     eax, dword [ebp-4H]                     ; 4574 _ 8B. 45, FC
        mov     dword [eax+74H], 0                      ; 4577 _ C7. 40, 74, 00000000
        mov     eax, dword [ebp-4H]                     ; 457E _ 8B. 45, FC
        mov     dword [eax+80H], 0                      ; 4581 _ C7. 80, 00000080, 00000000
        mov     eax, dword [ebp-4H]                     ; 458B _ 8B. 45, FC
        mov     dword [eax+84H], 0                      ; 458E _ C7. 80, 00000084, 00000000
        mov     eax, dword [ebp-4H]                     ; 4598 _ 8B. 45, FC
        mov     dword [eax+88H], 0                      ; 459B _ C7. 80, 00000088, 00000000
        mov     eax, dword [ebp-4H]                     ; 45A5 _ 8B. 45, FC
        mov     dword [eax+8CH], 0                      ; 45A8 _ C7. 80, 0000008C, 00000000
        mov     eax, dword [ebp-4H]                     ; 45B2 _ 8B. 45, FC
        mov     dword [eax+90H], 1073741824             ; 45B5 _ C7. 80, 00000090, 40000000
        mov     eax, dword [ebp-4H]                     ; 45BF _ 8B. 45, FC
        jmp     ?_244                                   ; 45C2 _ EB, 13

?_242:  add     dword [ebp-8H], 1                       ; 45C4 _ 83. 45, F8, 01
?_243:  cmp     dword [ebp-8H], 4                       ; 45C8 _ 83. 7D, F8, 04
        jle     ?_241                                   ; 45CC _ 0F 8E, FFFFFF00
        mov     eax, 0                                  ; 45D2 _ B8, 00000000
?_244:  leave                                           ; 45D7 _ C9
        ret                                             ; 45D8 _ C3
; task_alloc End of function

task_run:; Function begin
        push    ebp                                     ; 45D9 _ 55
        mov     ebp, esp                                ; 45DA _ 89. E5
        sub     esp, 24                                 ; 45DC _ 83. EC, 18
        cmp     dword [ebp+0CH], 0                      ; 45DF _ 83. 7D, 0C, 00
        jns     ?_245                                   ; 45E3 _ 79, 09
        mov     eax, dword [ebp+8H]                     ; 45E5 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 45E8 _ 8B. 40, 0C
        mov     dword [ebp+0CH], eax                    ; 45EB _ 89. 45, 0C
?_245:  cmp     dword [ebp+10H], 0                      ; 45EE _ 83. 7D, 10, 00
        jle     ?_246                                   ; 45F2 _ 7E, 09
        mov     eax, dword [ebp+8H]                     ; 45F4 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 45F7 _ 8B. 55, 10
        mov     dword [eax+8H], edx                     ; 45FA _ 89. 50, 08
?_246:  mov     eax, dword [ebp+8H]                     ; 45FD _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 4600 _ 8B. 40, 04
        cmp     eax, 2                                  ; 4603 _ 83. F8, 02
        jnz     ?_247                                   ; 4606 _ 75, 16
        mov     eax, dword [ebp+8H]                     ; 4608 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 460B _ 8B. 40, 0C
        cmp     eax, dword [ebp+0CH]                    ; 460E _ 3B. 45, 0C
        jz      ?_247                                   ; 4611 _ 74, 0B
        mov     eax, dword [ebp+8H]                     ; 4613 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 4616 _ 89. 04 24
        call    task_remove                             ; 4619 _ E8, FFFFFFFC(rel)
?_247:  mov     eax, dword [ebp+8H]                     ; 461E _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 4621 _ 8B. 40, 04
        cmp     eax, 2                                  ; 4624 _ 83. F8, 02
        jz      ?_248                                   ; 4627 _ 74, 14
        mov     eax, dword [ebp+8H]                     ; 4629 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 462C _ 8B. 55, 0C
        mov     dword [eax+0CH], edx                    ; 462F _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 4632 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 4635 _ 89. 04 24
        call    task_add                                ; 4638 _ E8, FFFFFFFC(rel)
?_248:  mov     eax, dword [task_control]               ; 463D _ A1, 00002248(d)
        mov     dword [eax+4H], 1                       ; 4642 _ C7. 40, 04, 00000001
        leave                                           ; 4649 _ C9
        ret                                             ; 464A _ C3
; task_run End of function

task_switch:; Function begin
        push    ebp                                     ; 464B _ 55
        mov     ebp, esp                                ; 464C _ 89. E5
        sub     esp, 40                                 ; 464E _ 83. EC, 28
        mov     ecx, dword [task_control]               ; 4651 _ 8B. 0D, 00002248(d)
        mov     eax, dword [task_control]               ; 4657 _ A1, 00002248(d)
        mov     edx, dword [eax]                        ; 465C _ 8B. 10
        mov     eax, edx                                ; 465E _ 89. D0
        shl     eax, 2                                  ; 4660 _ C1. E0, 02
        add     eax, edx                                ; 4663 _ 01. D0
        shl     eax, 2                                  ; 4665 _ C1. E0, 02
        add     eax, ecx                                ; 4668 _ 01. C8
        add     eax, 8                                  ; 466A _ 83. C0, 08
        mov     dword [ebp-14H], eax                    ; 466D _ 89. 45, EC
        mov     eax, dword [ebp-14H]                    ; 4670 _ 8B. 45, EC
        mov     edx, dword [eax+4H]                     ; 4673 _ 8B. 50, 04
        mov     eax, dword [ebp-14H]                    ; 4676 _ 8B. 45, EC
        mov     eax, dword [eax+edx*4+8H]               ; 4679 _ 8B. 44 90, 08
        mov     dword [ebp-10H], eax                    ; 467D _ 89. 45, F0
        mov     eax, dword [ebp-14H]                    ; 4680 _ 8B. 45, EC
        mov     eax, dword [eax+4H]                     ; 4683 _ 8B. 40, 04
        lea     edx, [eax+1H]                           ; 4686 _ 8D. 50, 01
        mov     eax, dword [ebp-14H]                    ; 4689 _ 8B. 45, EC
        mov     dword [eax+4H], edx                     ; 468C _ 89. 50, 04
        mov     eax, dword [ebp-14H]                    ; 468F _ 8B. 45, EC
        mov     edx, dword [eax+4H]                     ; 4692 _ 8B. 50, 04
        mov     eax, dword [ebp-14H]                    ; 4695 _ 8B. 45, EC
        mov     eax, dword [eax]                        ; 4698 _ 8B. 00
        cmp     edx, eax                                ; 469A _ 39. C2
        jnz     ?_249                                   ; 469C _ 75, 0A
        mov     eax, dword [ebp-14H]                    ; 469E _ 8B. 45, EC
        mov     dword [eax+4H], 0                       ; 46A1 _ C7. 40, 04, 00000000
?_249:  mov     eax, dword [task_control]               ; 46A8 _ A1, 00002248(d)
        mov     eax, dword [eax+4H]                     ; 46AD _ 8B. 40, 04
        test    eax, eax                                ; 46B0 _ 85. C0
        jz      ?_250                                   ; 46B2 _ 74, 24
        call    task_switch_sub                         ; 46B4 _ E8, FFFFFFFC(rel)
        mov     ecx, dword [task_control]               ; 46B9 _ 8B. 0D, 00002248(d)
        mov     eax, dword [task_control]               ; 46BF _ A1, 00002248(d)
        mov     edx, dword [eax]                        ; 46C4 _ 8B. 10
        mov     eax, edx                                ; 46C6 _ 89. D0
        shl     eax, 2                                  ; 46C8 _ C1. E0, 02
        add     eax, edx                                ; 46CB _ 01. D0
        shl     eax, 2                                  ; 46CD _ C1. E0, 02
        add     eax, ecx                                ; 46D0 _ 01. C8
        add     eax, 8                                  ; 46D2 _ 83. C0, 08
        mov     dword [ebp-14H], eax                    ; 46D5 _ 89. 45, EC
?_250:  mov     eax, dword [ebp-14H]                    ; 46D8 _ 8B. 45, EC
        mov     edx, dword [eax+4H]                     ; 46DB _ 8B. 50, 04
        mov     eax, dword [ebp-14H]                    ; 46DE _ 8B. 45, EC
        mov     eax, dword [eax+edx*4+8H]               ; 46E1 _ 8B. 44 90, 08
        mov     dword [ebp-0CH], eax                    ; 46E5 _ 89. 45, F4
        mov     eax, dword [ebp-0CH]                    ; 46E8 _ 8B. 45, F4
        mov     eax, dword [eax+8H]                     ; 46EB _ 8B. 40, 08
        mov     edx, eax                                ; 46EE _ 89. C2
        mov     eax, dword [task_timer]                 ; 46F0 _ A1, 00002244(d)
        mov     dword [esp+4H], edx                     ; 46F5 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 46F9 _ 89. 04 24
        call    timer_settime                           ; 46FC _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 4701 _ 8B. 45, F4
        cmp     eax, dword [ebp-10H]                    ; 4704 _ 3B. 45, F0
        jz      ?_251                                   ; 4707 _ 74, 1B
        cmp     dword [ebp-0CH], 0                      ; 4709 _ 83. 7D, F4, 00
        jz      ?_251                                   ; 470D _ 74, 15
        mov     eax, dword [ebp-0CH]                    ; 470F _ 8B. 45, F4
        mov     eax, dword [eax]                        ; 4712 _ 8B. 00
        mov     dword [esp+4H], eax                     ; 4714 _ 89. 44 24, 04
        mov     dword [esp], 0                          ; 4718 _ C7. 04 24, 00000000
        call    farjmp                                  ; 471F _ E8, FFFFFFFC(rel)
?_251:  leave                                           ; 4724 _ C9
        ret                                             ; 4725 _ C3
; task_switch End of function

task_sleep:; Function begin
        push    ebp                                     ; 4726 _ 55
        mov     ebp, esp                                ; 4727 _ 89. E5
        sub     esp, 40                                 ; 4729 _ 83. EC, 28
        mov     dword [ebp-0CH], 0                      ; 472C _ C7. 45, F4, 00000000
        mov     dword [ebp-10H], 0                      ; 4733 _ C7. 45, F0, 00000000
        mov     eax, dword [ebp+8H]                     ; 473A _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 473D _ 8B. 40, 04
        cmp     eax, 2                                  ; 4740 _ 83. F8, 02
        jnz     ?_252                                   ; 4743 _ 75, 51
        call    task_now                                ; 4745 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 474A _ 89. 45, F4
        mov     eax, dword [ebp+8H]                     ; 474D _ 8B. 45, 08
        mov     dword [esp], eax                        ; 4750 _ 89. 04 24
        call    task_remove                             ; 4753 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], 1                      ; 4758 _ C7. 45, F0, 00000001
        mov     eax, dword [ebp+8H]                     ; 475F _ 8B. 45, 08
        cmp     eax, dword [ebp-0CH]                    ; 4762 _ 3B. 45, F4
        jnz     ?_252                                   ; 4765 _ 75, 2F
        call    task_switch_sub                         ; 4767 _ E8, FFFFFFFC(rel)
        call    task_now                                ; 476C _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 4771 _ 89. 45, F4
        mov     dword [ebp-10H], 2                      ; 4774 _ C7. 45, F0, 00000002
        cmp     dword [ebp-0CH], 0                      ; 477B _ 83. 7D, F4, 00
        jz      ?_252                                   ; 477F _ 74, 15
        mov     eax, dword [ebp-0CH]                    ; 4781 _ 8B. 45, F4
        mov     eax, dword [eax]                        ; 4784 _ 8B. 00
        mov     dword [esp+4H], eax                     ; 4786 _ 89. 44 24, 04
        mov     dword [esp], 0                          ; 478A _ C7. 04 24, 00000000
        call    farjmp                                  ; 4791 _ E8, FFFFFFFC(rel)
?_252:  mov     eax, dword [ebp-10H]                    ; 4796 _ 8B. 45, F0
        leave                                           ; 4799 _ C9
        ret                                             ; 479A _ C3
; task_sleep End of function

task_now:; Function begin
        push    ebp                                     ; 479B _ 55
        mov     ebp, esp                                ; 479C _ 89. E5
        sub     esp, 16                                 ; 479E _ 83. EC, 10
        mov     ecx, dword [task_control]               ; 47A1 _ 8B. 0D, 00002248(d)
        mov     eax, dword [task_control]               ; 47A7 _ A1, 00002248(d)
        mov     edx, dword [eax]                        ; 47AC _ 8B. 10
        mov     eax, edx                                ; 47AE _ 89. D0
        shl     eax, 2                                  ; 47B0 _ C1. E0, 02
        add     eax, edx                                ; 47B3 _ 01. D0
        shl     eax, 2                                  ; 47B5 _ C1. E0, 02
        add     eax, ecx                                ; 47B8 _ 01. C8
        add     eax, 8                                  ; 47BA _ 83. C0, 08
        mov     dword [ebp-4H], eax                     ; 47BD _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 47C0 _ 8B. 45, FC
        mov     edx, dword [eax+4H]                     ; 47C3 _ 8B. 50, 04
        mov     eax, dword [ebp-4H]                     ; 47C6 _ 8B. 45, FC
        mov     eax, dword [eax+edx*4+8H]               ; 47C9 _ 8B. 44 90, 08
        leave                                           ; 47CD _ C9
        ret                                             ; 47CE _ C3
; task_now End of function

task_add:; Function begin
        push    ebp                                     ; 47CF _ 55
        mov     ebp, esp                                ; 47D0 _ 89. E5
        sub     esp, 16                                 ; 47D2 _ 83. EC, 10
        mov     ecx, dword [task_control]               ; 47D5 _ 8B. 0D, 00002248(d)
        mov     eax, dword [ebp+8H]                     ; 47DB _ 8B. 45, 08
        mov     edx, dword [eax+0CH]                    ; 47DE _ 8B. 50, 0C
        mov     eax, edx                                ; 47E1 _ 89. D0
        shl     eax, 2                                  ; 47E3 _ C1. E0, 02
        add     eax, edx                                ; 47E6 _ 01. D0
        shl     eax, 2                                  ; 47E8 _ C1. E0, 02
        add     eax, ecx                                ; 47EB _ 01. C8
        add     eax, 8                                  ; 47ED _ 83. C0, 08
        mov     dword [ebp-4H], eax                     ; 47F0 _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 47F3 _ 8B. 45, FC
        mov     edx, dword [eax]                        ; 47F6 _ 8B. 10
        mov     eax, dword [ebp-4H]                     ; 47F8 _ 8B. 45, FC
        mov     ecx, dword [ebp+8H]                     ; 47FB _ 8B. 4D, 08
        mov     dword [eax+edx*4+8H], ecx               ; 47FE _ 89. 4C 90, 08
        mov     eax, dword [ebp-4H]                     ; 4802 _ 8B. 45, FC
        mov     eax, dword [eax]                        ; 4805 _ 8B. 00
        lea     edx, [eax+1H]                           ; 4807 _ 8D. 50, 01
        mov     eax, dword [ebp-4H]                     ; 480A _ 8B. 45, FC
        mov     dword [eax], edx                        ; 480D _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 480F _ 8B. 45, 08
        mov     dword [eax+4H], 2                       ; 4812 _ C7. 40, 04, 00000002
        leave                                           ; 4819 _ C9
        ret                                             ; 481A _ C3
; task_add End of function

task_remove:; Function begin
        push    ebp                                     ; 481B _ 55
        mov     ebp, esp                                ; 481C _ 89. E5
        sub     esp, 16                                 ; 481E _ 83. EC, 10
        mov     ecx, dword [task_control]               ; 4821 _ 8B. 0D, 00002248(d)
        mov     eax, dword [ebp+8H]                     ; 4827 _ 8B. 45, 08
        mov     edx, dword [eax+0CH]                    ; 482A _ 8B. 50, 0C
        mov     eax, edx                                ; 482D _ 89. D0
        shl     eax, 2                                  ; 482F _ C1. E0, 02
        add     eax, edx                                ; 4832 _ 01. D0
        shl     eax, 2                                  ; 4834 _ C1. E0, 02
        add     eax, ecx                                ; 4837 _ 01. C8
        add     eax, 8                                  ; 4839 _ 83. C0, 08
        mov     dword [ebp-4H], eax                     ; 483C _ 89. 45, FC
        mov     dword [ebp-8H], 0                       ; 483F _ C7. 45, F8, 00000000
        jmp     ?_255                                   ; 4846 _ EB, 23

?_253:  mov     eax, dword [ebp-4H]                     ; 4848 _ 8B. 45, FC
        mov     edx, dword [ebp-8H]                     ; 484B _ 8B. 55, F8
        mov     eax, dword [eax+edx*4+8H]               ; 484E _ 8B. 44 90, 08
        cmp     eax, dword [ebp+8H]                     ; 4852 _ 3B. 45, 08
        jnz     ?_254                                   ; 4855 _ 75, 10
        mov     eax, dword [ebp-4H]                     ; 4857 _ 8B. 45, FC
        mov     edx, dword [ebp-8H]                     ; 485A _ 8B. 55, F8
        mov     dword [eax+edx*4+8H], 0                 ; 485D _ C7. 44 90, 08, 00000000
        jmp     ?_256                                   ; 4865 _ EB, 0E

?_254:  add     dword [ebp-8H], 1                       ; 4867 _ 83. 45, F8, 01
?_255:  mov     eax, dword [ebp-4H]                     ; 486B _ 8B. 45, FC
        mov     eax, dword [eax]                        ; 486E _ 8B. 00
        cmp     eax, dword [ebp-8H]                     ; 4870 _ 3B. 45, F8
        jg      ?_253                                   ; 4873 _ 7F, D3
?_256:  mov     eax, dword [ebp-4H]                     ; 4875 _ 8B. 45, FC
        mov     eax, dword [eax]                        ; 4878 _ 8B. 00
        lea     edx, [eax-1H]                           ; 487A _ 8D. 50, FF
        mov     eax, dword [ebp-4H]                     ; 487D _ 8B. 45, FC
        mov     dword [eax], edx                        ; 4880 _ 89. 10
        mov     eax, dword [ebp-4H]                     ; 4882 _ 8B. 45, FC
        mov     eax, dword [eax+4H]                     ; 4885 _ 8B. 40, 04
        cmp     eax, dword [ebp-8H]                     ; 4888 _ 3B. 45, F8
        jle     ?_257                                   ; 488B _ 7E, 0F
        mov     eax, dword [ebp-4H]                     ; 488D _ 8B. 45, FC
        mov     eax, dword [eax+4H]                     ; 4890 _ 8B. 40, 04
        lea     edx, [eax-1H]                           ; 4893 _ 8D. 50, FF
        mov     eax, dword [ebp-4H]                     ; 4896 _ 8B. 45, FC
        mov     dword [eax+4H], edx                     ; 4899 _ 89. 50, 04
?_257:  mov     eax, dword [ebp-4H]                     ; 489C _ 8B. 45, FC
        mov     edx, dword [eax+4H]                     ; 489F _ 8B. 50, 04
        mov     eax, dword [ebp-4H]                     ; 48A2 _ 8B. 45, FC
        mov     eax, dword [eax]                        ; 48A5 _ 8B. 00
        cmp     edx, eax                                ; 48A7 _ 39. C2
        jl      ?_258                                   ; 48A9 _ 7C, 0A
        mov     eax, dword [ebp-4H]                     ; 48AB _ 8B. 45, FC
        mov     dword [eax+4H], 0                       ; 48AE _ C7. 40, 04, 00000000
?_258:  mov     eax, dword [ebp+8H]                     ; 48B5 _ 8B. 45, 08
        mov     dword [eax+4H], 1                       ; 48B8 _ C7. 40, 04, 00000001
        jmp     ?_260                                   ; 48BF _ EB, 1B

?_259:  mov     eax, dword [ebp-8H]                     ; 48C1 _ 8B. 45, F8
        lea     edx, [eax+1H]                           ; 48C4 _ 8D. 50, 01
        mov     eax, dword [ebp-4H]                     ; 48C7 _ 8B. 45, FC
        mov     ecx, dword [eax+edx*4+8H]               ; 48CA _ 8B. 4C 90, 08
        mov     eax, dword [ebp-4H]                     ; 48CE _ 8B. 45, FC
        mov     edx, dword [ebp-8H]                     ; 48D1 _ 8B. 55, F8
        mov     dword [eax+edx*4+8H], ecx               ; 48D4 _ 89. 4C 90, 08
        add     dword [ebp-8H], 1                       ; 48D8 _ 83. 45, F8, 01
?_260:  mov     eax, dword [ebp-4H]                     ; 48DC _ 8B. 45, FC
        mov     eax, dword [eax]                        ; 48DF _ 8B. 00
        cmp     eax, dword [ebp-8H]                     ; 48E1 _ 3B. 45, F8
        jg      ?_259                                   ; 48E4 _ 7F, DB
        leave                                           ; 48E6 _ C9
        ret                                             ; 48E7 _ C3
; task_remove End of function

task_switch_sub:; Function begin
        push    ebp                                     ; 48E8 _ 55
        mov     ebp, esp                                ; 48E9 _ 89. E5
        sub     esp, 16                                 ; 48EB _ 83. EC, 10
        mov     dword [ebp-4H], 0                       ; 48EE _ C7. 45, FC, 00000000
        jmp     ?_263                                   ; 48F5 _ EB, 24

?_261:  mov     ecx, dword [task_control]               ; 48F7 _ 8B. 0D, 00002248(d)
        mov     edx, dword [ebp-4H]                     ; 48FD _ 8B. 55, FC
        mov     eax, edx                                ; 4900 _ 89. D0
        shl     eax, 2                                  ; 4902 _ C1. E0, 02
        add     eax, edx                                ; 4905 _ 01. D0
        shl     eax, 2                                  ; 4907 _ C1. E0, 02
        add     eax, ecx                                ; 490A _ 01. C8
        add     eax, 8                                  ; 490C _ 83. C0, 08
        mov     eax, dword [eax]                        ; 490F _ 8B. 00
        test    eax, eax                                ; 4911 _ 85. C0
        jle     ?_262                                   ; 4913 _ 7E, 02
        jmp     ?_264                                   ; 4915 _ EB, 0A

?_262:  add     dword [ebp-4H], 1                       ; 4917 _ 83. 45, FC, 01
?_263:  cmp     dword [ebp-4H], 2                       ; 491B _ 83. 7D, FC, 02
        jle     ?_261                                   ; 491F _ 7E, D6
?_264:  mov     eax, dword [task_control]               ; 4921 _ A1, 00002248(d)
        mov     edx, dword [ebp-4H]                     ; 4926 _ 8B. 55, FC
        mov     dword [eax], edx                        ; 4929 _ 89. 10
        mov     eax, dword [task_control]               ; 492B _ A1, 00002248(d)
        mov     dword [eax+4H], 0                       ; 4930 _ C7. 40, 04, 00000000
        leave                                           ; 4937 _ C9
        ret                                             ; 4938 _ C3
; task_switch_sub End of function

task_send_message:; Function begin
        push    ebp                                     ; 4939 _ 55
        mov     ebp, esp                                ; 493A _ 89. E5
        sub     esp, 24                                 ; 493C _ 83. EC, 18
        mov     eax, dword [ebp+10H]                    ; 493F _ 8B. 45, 10
        movzx   eax, al                                 ; 4942 _ 0F B6. C0
        mov     edx, dword [ebp+0CH]                    ; 4945 _ 8B. 55, 0C
        add     edx, 16                                 ; 4948 _ 83. C2, 10
        mov     dword [esp+4H], eax                     ; 494B _ 89. 44 24, 04
        mov     dword [esp], edx                        ; 494F _ 89. 14 24
        call    fifo8_put                               ; 4952 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 4957 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 495A _ 89. 04 24
        call    task_sleep                              ; 495D _ E8, FFFFFFFC(rel)
        leave                                           ; 4962 _ C9
        ret                                             ; 4963 _ C3
; task_send_message End of function



?_265:                                                  ; byte
        db 77H, 69H, 6EH, 64H, 6FH, 77H, 00H            ; 0000 _ window.

?_266:                                                  ; byte
        db 63H, 6FH, 6EH, 73H, 6FH, 6CH, 65H, 00H       ; 0007 _ console.

?_267:                                                  ; byte
        db 65H, 6EH, 74H, 65H, 72H, 20H, 74H, 61H       ; 000F _ enter ta
        db 73H, 6BH, 20H, 62H, 00H                      ; 0017 _ sk b.

?_268:                                                  ; byte
        db 42H, 00H                                     ; 001C _ B.

?_269:                                                  ; byte
        db 70H, 61H, 67H, 65H, 20H, 69H, 73H, 3AH       ; 001E _ page is:
        db 20H, 00H                                     ; 0026 _  .

?_270:                                                  ; byte
        db 42H, 61H, 73H, 65H, 41H, 64H, 64H, 72H       ; 0028 _ BaseAddr
        db 4CH, 3AH, 20H, 00H                           ; 0030 _ L: .

?_271:                                                  ; byte
        db 42H, 61H, 73H, 65H, 41H, 64H, 64H, 72H       ; 0034 _ BaseAddr
        db 48H, 3AH, 20H, 00H                           ; 003C _ H: .

?_272:                                                  ; byte
        db 6CH, 65H, 6EH, 67H, 74H, 68H, 4CH, 6FH       ; 0040 _ lengthLo
        db 77H, 3AH, 20H, 00H                           ; 0048 _ w: .

?_273:                                                  ; byte
        db 6CH, 65H, 6EH, 67H, 74H, 68H, 48H, 69H       ; 004C _ lengthHi
        db 67H, 68H, 3AH, 20H, 00H                      ; 0054 _ gh: .

?_274:                                                  ; byte
        db 74H, 79H, 70H, 65H, 3AH, 20H, 00H            ; 0059 _ type: .

?_275:                                                  ; byte
        db 3EH, 00H                                     ; 0060 _ >.

?_276:                                                  ; byte
        db 6DH, 65H, 6DH, 00H                           ; 0062 _ mem.

?_277:                                                  ; byte
        db 66H, 72H, 65H, 65H, 20H, 00H                 ; 0066 _ free .

?_278:                                                  ; byte
        db 20H, 4BH, 42H, 00H                           ; 006C _  KB.

?_279:                                                  ; byte
        db 63H, 6CH, 73H, 00H                           ; 0070 _ cls.

?_280:                                                  ; byte
        db 64H, 69H, 72H, 00H                           ; 0074 _ dir.

?_281:                                                  ; byte
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

?_282:  db 00H                                          ; 0342 _ .

?_283:  db 00H, 00H                                     ; 0343 _ ..



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

?_284:  resw    1                                       ; 00A4

?_285:  resw    13                                      ; 00A6

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

?_286:  resb    9                                       ; 02E1

?_287:  resb    22                                      ; 02EA

timer_control:                                          ; byte
        resd    2001                                    ; 0300

task_timer:                                             ; dword
        resd    1                                       ; 2244

task_control:                                           ; dword
        resd    1                                       ; 2248


