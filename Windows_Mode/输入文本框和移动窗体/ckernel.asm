; Disassembly of file: ckernel.o
; Thu Feb 20 11:04:53 2020
; Mode: 32 bits
; Syntax: YASM/NASM
; Instruction set: 80386






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
        mov     dword [esp+8H], timerbuf1.1651          ; 013F _ C7. 44 24, 08, 00000018(d)
        mov     dword [esp+4H], 8                       ; 0147 _ C7. 44 24, 04, 00000008
        mov     dword [esp], timerinfo1.1648            ; 014F _ C7. 04 24, 00000000(d)
        call    fifo8_init                              ; 0156 _ E8, FFFFFFFC(rel)
        call    timer_alloc                             ; 015B _ E8, FFFFFFFC(rel)
        mov     dword [ebp-28H], eax                    ; 0160 _ 89. 45, D8
        mov     dword [esp+8H], 1                       ; 0163 _ C7. 44 24, 08, 00000001
        mov     dword [esp+4H], timerinfo1.1648         ; 016B _ C7. 44 24, 04, 00000000(d)
        mov     eax, dword [ebp-28H]                    ; 0173 _ 8B. 45, D8
        mov     dword [esp], eax                        ; 0176 _ 89. 04 24
        call    timer_init                              ; 0179 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 500                     ; 017E _ C7. 44 24, 04, 000001F4
        mov     eax, dword [ebp-28H]                    ; 0186 _ 8B. 45, D8
        mov     dword [esp], eax                        ; 0189 _ 89. 04 24
        call    timer_settime                           ; 018C _ E8, FFFFFFFC(rel)
        mov     dword [esp+8H], timerbuf2.1652          ; 0191 _ C7. 44 24, 08, 00000038(d)
        mov     dword [esp+4H], 8                       ; 0199 _ C7. 44 24, 04, 00000008
        mov     dword [esp], timerinfo2.1649            ; 01A1 _ C7. 04 24, 00000020(d)
        call    fifo8_init                              ; 01A8 _ E8, FFFFFFFC(rel)
        call    timer_alloc                             ; 01AD _ E8, FFFFFFFC(rel)
        mov     dword [ebp-24H], eax                    ; 01B2 _ 89. 45, DC
        mov     dword [esp+8H], 1                       ; 01B5 _ C7. 44 24, 08, 00000001
        mov     dword [esp+4H], timerinfo2.1649         ; 01BD _ C7. 44 24, 04, 00000020(d)
        mov     eax, dword [ebp-24H]                    ; 01C5 _ 8B. 45, DC
        mov     dword [esp], eax                        ; 01C8 _ 89. 04 24
        call    timer_init                              ; 01CB _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 300                     ; 01D0 _ C7. 44 24, 04, 0000012C
        mov     eax, dword [ebp-24H]                    ; 01D8 _ 8B. 45, DC
        mov     dword [esp], eax                        ; 01DB _ 89. 04 24
        call    timer_settime                           ; 01DE _ E8, FFFFFFFC(rel)
        mov     dword [esp+8H], timerbuf3.1653          ; 01E3 _ C7. 44 24, 08, 00000058(d)
        mov     dword [esp+4H], 8                       ; 01EB _ C7. 44 24, 04, 00000008
        mov     dword [esp], timerinfo3.1650            ; 01F3 _ C7. 04 24, 00000040(d)
        call    fifo8_init                              ; 01FA _ E8, FFFFFFFC(rel)
        call    timer_alloc                             ; 01FF _ E8, FFFFFFFC(rel)
        mov     dword [ebp-20H], eax                    ; 0204 _ 89. 45, E0
        mov     dword [esp+8H], 1                       ; 0207 _ C7. 44 24, 08, 00000001
        mov     dword [esp+4H], timerinfo3.1650         ; 020F _ C7. 44 24, 04, 00000040(d)
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
        mov     dword [esp+4H], ?_159                   ; 02B0 _ C7. 44 24, 04, 00000000(d)
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
        mov     dword [ebp-4CH], 8                      ; 0314 _ C7. 45, B4, 00000008
        mov     dword [ebp-48H], 7                      ; 031B _ C7. 45, B8, 00000007
?_001:  call    io_cli                                  ; 0322 _ E8, FFFFFFFC(rel)
        mov     dword [esp], keyinfo                    ; 0327 _ C7. 04 24, 00000000(d)
        call    fifo8_status                            ; 032E _ E8, FFFFFFFC(rel)
        mov     ebx, eax                                ; 0333 _ 89. C3
        mov     dword [esp], mouseinfo                  ; 0335 _ C7. 04 24, 00000000(d)
        call    fifo8_status                            ; 033C _ E8, FFFFFFFC(rel)
        add     ebx, eax                                ; 0341 _ 01. C3
        mov     dword [esp], timerinfo1.1648            ; 0343 _ C7. 04 24, 00000000(d)
        call    fifo8_status                            ; 034A _ E8, FFFFFFFC(rel)
        add     ebx, eax                                ; 034F _ 01. C3
        mov     dword [esp], timerinfo2.1649            ; 0351 _ C7. 04 24, 00000020(d)
        call    fifo8_status                            ; 0358 _ E8, FFFFFFFC(rel)
        add     ebx, eax                                ; 035D _ 01. C3
        mov     dword [esp], timerinfo3.1650            ; 035F _ C7. 04 24, 00000040(d)
        call    fifo8_status                            ; 0366 _ E8, FFFFFFFC(rel)
        add     eax, ebx                                ; 036B _ 01. D8
        test    eax, eax                                ; 036D _ 85. C0
        jnz     ?_002                                   ; 036F _ 75, 0A
        call    io_sti                                  ; 0371 _ E8, FFFFFFFC(rel)
        jmp     ?_010                                   ; 0376 _ E9, 00000372

?_002:  mov     dword [esp], keyinfo                    ; 037B _ C7. 04 24, 00000000(d)
        call    fifo8_status                            ; 0382 _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 0387 _ 85. C0
        je      ?_004                                   ; 0389 _ 0F 84, 0000017F
        call    io_sti                                  ; 038F _ E8, FFFFFFFC(rel)
        mov     dword [esp], keyinfo                    ; 0394 _ C7. 04 24, 00000000(d)
        call    fifo8_get                               ; 039B _ E8, FFFFFFFC(rel)
        mov     dword [ebp-18H], eax                    ; 03A0 _ 89. 45, E8
        cmp     dword [ebp-18H], 128                    ; 03A3 _ 81. 7D, E8, 00000080
        jle     ?_003                                   ; 03AA _ 7E, 05
        jmp     ?_010                                   ; 03AC _ E9, 0000033C

?_003:  cmp     dword [ebp-18H], 28                     ; 03B1 _ 83. 7D, E8, 1C
        je      ?_010                                   ; 03B5 _ 0F 84, 00000332
        mov     eax, dword [ebp-18H]                    ; 03BB _ 8B. 45, E8
        add     eax, keytable                           ; 03BE _ 05, 00000000(d)
        movzx   eax, byte [eax]                         ; 03C3 _ 0F B6. 00
        test    al, al                                  ; 03C6 _ 84. C0
        je      ?_010                                   ; 03C8 _ 0F 84, 0000031F
        cmp     dword [ebp-4CH], 143                    ; 03CE _ 81. 7D, B4, 0000008F
        jg      ?_010                                   ; 03D5 _ 0F 8F, 00000312
        mov     eax, dword [ebp-4CH]                    ; 03DB _ 8B. 45, B4
        lea     ecx, [eax+7H]                           ; 03DE _ 8D. 48, 07
        mov     eax, dword [ebp-1CH]                    ; 03E1 _ 8B. 45, E4
        mov     edx, dword [eax+4H]                     ; 03E4 _ 8B. 50, 04
        mov     eax, dword [ebp-1CH]                    ; 03E7 _ 8B. 45, E4
        mov     eax, dword [eax]                        ; 03EA _ 8B. 00
        mov     dword [esp+18H], 43                     ; 03EC _ C7. 44 24, 18, 0000002B
        mov     dword [esp+14H], ecx                    ; 03F4 _ 89. 4C 24, 14
        mov     dword [esp+10H], 28                     ; 03F8 _ C7. 44 24, 10, 0000001C
        mov     ecx, dword [ebp-4CH]                    ; 0400 _ 8B. 4D, B4
        mov     dword [esp+0CH], ecx                    ; 0403 _ 89. 4C 24, 0C
        mov     dword [esp+8H], 7                       ; 0407 _ C7. 44 24, 08, 00000007
        mov     dword [esp+4H], edx                     ; 040F _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0413 _ 89. 04 24
        call    paint_rectangle                         ; 0416 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-4CH]                    ; 041B _ 8B. 45, B4
        add     eax, 8                                  ; 041E _ 83. C0, 08
        mov     dword [esp+14H], 44                     ; 0421 _ C7. 44 24, 14, 0000002C
        mov     dword [esp+10H], eax                    ; 0429 _ 89. 44 24, 10
        mov     dword [esp+0CH], 28                     ; 042D _ C7. 44 24, 0C, 0000001C
        mov     eax, dword [ebp-4CH]                    ; 0435 _ 8B. 45, B4
        mov     dword [esp+8H], eax                     ; 0438 _ 89. 44 24, 08
        mov     eax, dword [ebp-1CH]                    ; 043C _ 8B. 45, E4
        mov     dword [esp+4H], eax                     ; 043F _ 89. 44 24, 04
        mov     eax, dword [ebp-30H]                    ; 0443 _ 8B. 45, D0
        mov     dword [esp], eax                        ; 0446 _ 89. 04 24
        call    sheet_refresh                           ; 0449 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-18H]                    ; 044E _ 8B. 45, E8
        add     eax, keytable                           ; 0451 _ 05, 00000000(d)
        movzx   eax, byte [eax]                         ; 0456 _ 0F B6. 00
        mov     byte [ebp-4EH], al                      ; 0459 _ 88. 45, B2
        mov     byte [ebp-4DH], 0                       ; 045C _ C6. 45, B3, 00
        mov     dword [esp+14H], 0                      ; 0460 _ C7. 44 24, 14, 00000000
        lea     eax, [ebp-4EH]                          ; 0468 _ 8D. 45, B2
        mov     dword [esp+10H], eax                    ; 046B _ 89. 44 24, 10
        mov     dword [esp+0CH], 28                     ; 046F _ C7. 44 24, 0C, 0000001C
        mov     eax, dword [ebp-4CH]                    ; 0477 _ 8B. 45, B4
        mov     dword [esp+8H], eax                     ; 047A _ 89. 44 24, 08
        mov     eax, dword [ebp-1CH]                    ; 047E _ 8B. 45, E4
        mov     dword [esp+4H], eax                     ; 0481 _ 89. 44 24, 04
        mov     eax, dword [ebp-30H]                    ; 0485 _ 8B. 45, D0
        mov     dword [esp], eax                        ; 0488 _ 89. 04 24
        call    paint_string                            ; 048B _ E8, FFFFFFFC(rel)
        add     dword [ebp-4CH], 8                      ; 0490 _ 83. 45, B4, 08
        mov     eax, dword [ebp-4CH]                    ; 0494 _ 8B. 45, B4
        lea     ebx, [eax+7H]                           ; 0497 _ 8D. 58, 07
        mov     eax, dword [ebp-48H]                    ; 049A _ 8B. 45, B8
        movzx   ecx, al                                 ; 049D _ 0F B6. C8
        mov     eax, dword [ebp-1CH]                    ; 04A0 _ 8B. 45, E4
        mov     edx, dword [eax+4H]                     ; 04A3 _ 8B. 50, 04
        mov     eax, dword [ebp-1CH]                    ; 04A6 _ 8B. 45, E4
        mov     eax, dword [eax]                        ; 04A9 _ 8B. 00
        mov     dword [esp+18H], 43                     ; 04AB _ C7. 44 24, 18, 0000002B
        mov     dword [esp+14H], ebx                    ; 04B3 _ 89. 5C 24, 14
        mov     dword [esp+10H], 28                     ; 04B7 _ C7. 44 24, 10, 0000001C
        mov     ebx, dword [ebp-4CH]                    ; 04BF _ 8B. 5D, B4
        mov     dword [esp+0CH], ebx                    ; 04C2 _ 89. 5C 24, 0C
        mov     dword [esp+8H], ecx                     ; 04C6 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 04CA _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 04CE _ 89. 04 24
        call    paint_rectangle                         ; 04D1 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-4CH]                    ; 04D6 _ 8B. 45, B4
        add     eax, 8                                  ; 04D9 _ 83. C0, 08
        mov     dword [esp+14H], 44                     ; 04DC _ C7. 44 24, 14, 0000002C
        mov     dword [esp+10H], eax                    ; 04E4 _ 89. 44 24, 10
        mov     dword [esp+0CH], 28                     ; 04E8 _ C7. 44 24, 0C, 0000001C
        mov     eax, dword [ebp-4CH]                    ; 04F0 _ 8B. 45, B4
        mov     dword [esp+8H], eax                     ; 04F3 _ 89. 44 24, 08
        mov     eax, dword [ebp-1CH]                    ; 04F7 _ 8B. 45, E4
        mov     dword [esp+4H], eax                     ; 04FA _ 89. 44 24, 04
        mov     eax, dword [ebp-30H]                    ; 04FE _ 8B. 45, D0
        mov     dword [esp], eax                        ; 0501 _ 89. 04 24
        call    sheet_refresh                           ; 0504 _ E8, FFFFFFFC(rel)
        jmp     ?_001                                   ; 0509 _ E9, FFFFFE14

?_004:  mov     dword [esp], mouseinfo                  ; 050E _ C7. 04 24, 00000000(d)
        call    fifo8_status                            ; 0515 _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 051A _ 85. C0
        jz      ?_005                                   ; 051C _ 74, 1E
        mov     eax, dword [ebp-34H]                    ; 051E _ 8B. 45, CC
        mov     dword [esp+8H], eax                     ; 0521 _ 89. 44 24, 08
        mov     eax, dword [ebp-38H]                    ; 0525 _ 8B. 45, C8
        mov     dword [esp+4H], eax                     ; 0528 _ 89. 44 24, 04
        mov     eax, dword [ebp-30H]                    ; 052C _ 8B. 45, D0
        mov     dword [esp], eax                        ; 052F _ 89. 04 24
        call    show_mouse_info                         ; 0532 _ E8, FFFFFFFC(rel)
        jmp     ?_010                                   ; 0537 _ E9, 000001B1

?_005:  mov     dword [esp], timerinfo1.1648            ; 053C _ C7. 04 24, 00000000(d)
        call    fifo8_status                            ; 0543 _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 0548 _ 85. C0
        jz      ?_006                                   ; 054A _ 74, 48
        call    io_sti                                  ; 054C _ E8, FFFFFFFC(rel)
        mov     dword [esp], timerinfo1.1648            ; 0551 _ C7. 04 24, 00000000(d)
        call    fifo8_get                               ; 0558 _ E8, FFFFFFFC(rel)
        mov     dword [esp+14H], 7                      ; 055D _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_160                  ; 0565 _ C7. 44 24, 10, 00000007(d)
        mov     dword [esp+0CH], 0                      ; 056D _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 0                       ; 0575 _ C7. 44 24, 08, 00000000
        mov     eax, dword [ebp-38H]                    ; 057D _ 8B. 45, C8
        mov     dword [esp+4H], eax                     ; 0580 _ 89. 44 24, 04
        mov     eax, dword [ebp-30H]                    ; 0584 _ 8B. 45, D0
        mov     dword [esp], eax                        ; 0587 _ 89. 04 24
        call    paint_string                            ; 058A _ E8, FFFFFFFC(rel)
        jmp     ?_010                                   ; 058F _ E9, 00000159

?_006:  mov     dword [esp], timerinfo2.1649            ; 0594 _ C7. 04 24, 00000020(d)
        call    fifo8_status                            ; 059B _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 05A0 _ 85. C0
        jz      ?_007                                   ; 05A2 _ 74, 48
        call    io_sti                                  ; 05A4 _ E8, FFFFFFFC(rel)
        mov     dword [esp], timerinfo2.1649            ; 05A9 _ C7. 04 24, 00000020(d)
        call    fifo8_get                               ; 05B0 _ E8, FFFFFFFC(rel)
        mov     dword [esp+14H], 7                      ; 05B5 _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_161                  ; 05BD _ C7. 44 24, 10, 0000000F(d)
        mov     dword [esp+0CH], 32                     ; 05C5 _ C7. 44 24, 0C, 00000020
        mov     dword [esp+8H], 0                       ; 05CD _ C7. 44 24, 08, 00000000
        mov     eax, dword [ebp-38H]                    ; 05D5 _ 8B. 45, C8
        mov     dword [esp+4H], eax                     ; 05D8 _ 89. 44 24, 04
        mov     eax, dword [ebp-30H]                    ; 05DC _ 8B. 45, D0
        mov     dword [esp], eax                        ; 05DF _ 89. 04 24
        call    paint_string                            ; 05E2 _ E8, FFFFFFFC(rel)
        jmp     ?_010                                   ; 05E7 _ E9, 00000101

?_007:  mov     dword [esp], timerinfo3.1650            ; 05EC _ C7. 04 24, 00000040(d)
        call    fifo8_status                            ; 05F3 _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 05F8 _ 85. C0
        je      ?_010                                   ; 05FA _ 0F 84, 000000ED
        mov     dword [esp], timerinfo3.1650            ; 0600 _ C7. 04 24, 00000040(d)
        call    fifo8_get                               ; 0607 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 060C _ 89. 45, F4
        call    io_sti                                  ; 060F _ E8, FFFFFFFC(rel)
        cmp     dword [ebp-0CH], 0                      ; 0614 _ 83. 7D, F4, 00
        jz      ?_008                                   ; 0618 _ 74, 24
        mov     dword [esp+8H], 0                       ; 061A _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], timerinfo3.1650         ; 0622 _ C7. 44 24, 04, 00000040(d)
        mov     eax, dword [ebp-20H]                    ; 062A _ 8B. 45, E0
        mov     dword [esp], eax                        ; 062D _ 89. 04 24
        call    timer_init                              ; 0630 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-48H], 0                      ; 0635 _ C7. 45, B8, 00000000
        jmp     ?_009                                   ; 063C _ EB, 22

?_008:  mov     dword [esp+8H], 1                       ; 063E _ C7. 44 24, 08, 00000001
        mov     dword [esp+4H], timerinfo3.1650         ; 0646 _ C7. 44 24, 04, 00000040(d)
        mov     eax, dword [ebp-20H]                    ; 064E _ 8B. 45, E0
        mov     dword [esp], eax                        ; 0651 _ 89. 04 24
        call    timer_init                              ; 0654 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-48H], 7                      ; 0659 _ C7. 45, B8, 00000007
?_009:  mov     dword [esp+4H], 50                      ; 0660 _ C7. 44 24, 04, 00000032
        mov     eax, dword [ebp-20H]                    ; 0668 _ 8B. 45, E0
        mov     dword [esp], eax                        ; 066B _ 89. 04 24
        call    timer_settime                           ; 066E _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-4CH]                    ; 0673 _ 8B. 45, B4
        lea     ebx, [eax+7H]                           ; 0676 _ 8D. 58, 07
        mov     eax, dword [ebp-48H]                    ; 0679 _ 8B. 45, B8
        movzx   ecx, al                                 ; 067C _ 0F B6. C8
        mov     eax, dword [ebp-1CH]                    ; 067F _ 8B. 45, E4
        mov     edx, dword [eax+4H]                     ; 0682 _ 8B. 50, 04
        mov     eax, dword [ebp-1CH]                    ; 0685 _ 8B. 45, E4
        mov     eax, dword [eax]                        ; 0688 _ 8B. 00
        mov     dword [esp+18H], 43                     ; 068A _ C7. 44 24, 18, 0000002B
        mov     dword [esp+14H], ebx                    ; 0692 _ 89. 5C 24, 14
        mov     dword [esp+10H], 28                     ; 0696 _ C7. 44 24, 10, 0000001C
        mov     ebx, dword [ebp-4CH]                    ; 069E _ 8B. 5D, B4
        mov     dword [esp+0CH], ebx                    ; 06A1 _ 89. 5C 24, 0C
        mov     dword [esp+8H], ecx                     ; 06A5 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 06A9 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 06AD _ 89. 04 24
        call    paint_rectangle                         ; 06B0 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-4CH]                    ; 06B5 _ 8B. 45, B4
        add     eax, 8                                  ; 06B8 _ 83. C0, 08
        mov     dword [esp+14H], 44                     ; 06BB _ C7. 44 24, 14, 0000002C
        mov     dword [esp+10H], eax                    ; 06C3 _ 89. 44 24, 10
        mov     dword [esp+0CH], 28                     ; 06C7 _ C7. 44 24, 0C, 0000001C
        mov     eax, dword [ebp-4CH]                    ; 06CF _ 8B. 45, B4
        mov     dword [esp+8H], eax                     ; 06D2 _ 89. 44 24, 08
        mov     eax, dword [ebp-1CH]                    ; 06D6 _ 8B. 45, E4
        mov     dword [esp+4H], eax                     ; 06D9 _ 89. 44 24, 04
        mov     eax, dword [ebp-30H]                    ; 06DD _ 8B. 45, D0
        mov     dword [esp], eax                        ; 06E0 _ 89. 04 24
        call    sheet_refresh                           ; 06E3 _ E8, FFFFFFFC(rel)
        jmp     ?_001                                   ; 06E8 _ E9, FFFFFC35

?_010:  jmp     ?_001                                   ; 06ED _ E9, FFFFFC30
; CMain End of function

init_screeninfo:; Function begin
        push    ebp                                     ; 06F2 _ 55
        mov     ebp, esp                                ; 06F3 _ 89. E5
        mov     eax, dword [VRAM_ADDRESS]               ; 06F5 _ A1, 00000000(d)
        mov     edx, eax                                ; 06FA _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 06FC _ 8B. 45, 08
        mov     dword [eax], edx                        ; 06FF _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 0701 _ 8B. 45, 08
; Note: Length-changing prefix causes delay on Intel processors
        mov     word [eax+4H], 640                      ; 0704 _ 66: C7. 40, 04, 0280
        mov     eax, dword [ebp+8H]                     ; 070A _ 8B. 45, 08
; Note: Length-changing prefix causes delay on Intel processors
        mov     word [eax+6H], 480                      ; 070D _ 66: C7. 40, 06, 01E0
        pop     ebp                                     ; 0713 _ 5D
        ret                                             ; 0714 _ C3
; init_screeninfo End of function

init_palette:; Function begin
        push    ebp                                     ; 0715 _ 55
        mov     ebp, esp                                ; 0716 _ 89. E5
        sub     esp, 24                                 ; 0718 _ 83. EC, 18
        mov     dword [esp+8H], table_rgb.1621          ; 071B _ C7. 44 24, 08, 00000080(d)
        mov     dword [esp+4H], 15                      ; 0723 _ C7. 44 24, 04, 0000000F
        mov     dword [esp], 0                          ; 072B _ C7. 04 24, 00000000
        call    set_palette                             ; 0732 _ E8, FFFFFFFC(rel)
        nop                                             ; 0737 _ 90
        leave                                           ; 0738 _ C9
        ret                                             ; 0739 _ C3
; init_palette End of function

set_palette:; Function begin
        push    ebp                                     ; 073A _ 55
        mov     ebp, esp                                ; 073B _ 89. E5
        sub     esp, 40                                 ; 073D _ 83. EC, 28
        call    io_load_eflags                          ; 0740 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 0745 _ 89. 45, F4
        call    io_cli                                  ; 0748 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 074D _ 8B. 45, 08
        mov     dword [esp+4H], eax                     ; 0750 _ 89. 44 24, 04
        mov     dword [esp], 968                        ; 0754 _ C7. 04 24, 000003C8
        call    io_out8                                 ; 075B _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 0760 _ 8B. 45, 08
        mov     dword [ebp-10H], eax                    ; 0763 _ 89. 45, F0
        jmp     ?_012                                   ; 0766 _ EB, 62

?_011:  mov     eax, dword [ebp+10H]                    ; 0768 _ 8B. 45, 10
        movzx   eax, byte [eax]                         ; 076B _ 0F B6. 00
        shr     al, 2                                   ; 076E _ C0. E8, 02
        movzx   eax, al                                 ; 0771 _ 0F B6. C0
        mov     dword [esp+4H], eax                     ; 0774 _ 89. 44 24, 04
        mov     dword [esp], 969                        ; 0778 _ C7. 04 24, 000003C9
        call    io_out8                                 ; 077F _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0784 _ 8B. 45, 10
        add     eax, 1                                  ; 0787 _ 83. C0, 01
        movzx   eax, byte [eax]                         ; 078A _ 0F B6. 00
        shr     al, 2                                   ; 078D _ C0. E8, 02
        movzx   eax, al                                 ; 0790 _ 0F B6. C0
        mov     dword [esp+4H], eax                     ; 0793 _ 89. 44 24, 04
        mov     dword [esp], 969                        ; 0797 _ C7. 04 24, 000003C9
        call    io_out8                                 ; 079E _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 07A3 _ 8B. 45, 10
        add     eax, 2                                  ; 07A6 _ 83. C0, 02
        movzx   eax, byte [eax]                         ; 07A9 _ 0F B6. 00
        shr     al, 2                                   ; 07AC _ C0. E8, 02
        movzx   eax, al                                 ; 07AF _ 0F B6. C0
        mov     dword [esp+4H], eax                     ; 07B2 _ 89. 44 24, 04
        mov     dword [esp], 969                        ; 07B6 _ C7. 04 24, 000003C9
        call    io_out8                                 ; 07BD _ E8, FFFFFFFC(rel)
        add     dword [ebp+10H], 3                      ; 07C2 _ 83. 45, 10, 03
        add     dword [ebp-10H], 1                      ; 07C6 _ 83. 45, F0, 01
?_012:  mov     eax, dword [ebp-10H]                    ; 07CA _ 8B. 45, F0
        cmp     eax, dword [ebp+0CH]                    ; 07CD _ 3B. 45, 0C
        jle     ?_011                                   ; 07D0 _ 7E, 96
        mov     eax, dword [ebp-0CH]                    ; 07D2 _ 8B. 45, F4
        mov     dword [esp], eax                        ; 07D5 _ 89. 04 24
        call    io_store_eflags                         ; 07D8 _ E8, FFFFFFFC(rel)
        nop                                             ; 07DD _ 90
        leave                                           ; 07DE _ C9
        ret                                             ; 07DF _ C3
; set_palette End of function

paint_rectangle:; Function begin
        push    ebp                                     ; 07E0 _ 55
        mov     ebp, esp                                ; 07E1 _ 89. E5
        sub     esp, 20                                 ; 07E3 _ 83. EC, 14
        mov     eax, dword [ebp+10H]                    ; 07E6 _ 8B. 45, 10
        mov     byte [ebp-14H], al                      ; 07E9 _ 88. 45, EC
        mov     eax, dword [ebp+18H]                    ; 07EC _ 8B. 45, 18
        mov     dword [ebp-4H], eax                     ; 07EF _ 89. 45, FC
        jmp     ?_016                                   ; 07F2 _ EB, 33

?_013:  mov     eax, dword [ebp+14H]                    ; 07F4 _ 8B. 45, 14
        mov     dword [ebp-8H], eax                     ; 07F7 _ 89. 45, F8
        jmp     ?_015                                   ; 07FA _ EB, 1F

?_014:  mov     eax, dword [ebp-4H]                     ; 07FC _ 8B. 45, FC
        imul    eax, dword [ebp+0CH]                    ; 07FF _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0803 _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 0805 _ 8B. 45, F8
        add     eax, edx                                ; 0808 _ 01. D0
        mov     edx, eax                                ; 080A _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 080C _ 8B. 45, 08
        add     edx, eax                                ; 080F _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0811 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0815 _ 88. 02
        add     dword [ebp-8H], 1                       ; 0817 _ 83. 45, F8, 01
?_015:  mov     eax, dword [ebp-8H]                     ; 081B _ 8B. 45, F8
        cmp     eax, dword [ebp+1CH]                    ; 081E _ 3B. 45, 1C
        jle     ?_014                                   ; 0821 _ 7E, D9
        add     dword [ebp-4H], 1                       ; 0823 _ 83. 45, FC, 01
?_016:  mov     eax, dword [ebp-4H]                     ; 0827 _ 8B. 45, FC
        cmp     eax, dword [ebp+20H]                    ; 082A _ 3B. 45, 20
        jle     ?_013                                   ; 082D _ 7E, C5
        leave                                           ; 082F _ C9
        ret                                             ; 0830 _ C3
; paint_rectangle End of function

init_desktop:; Function begin
        push    ebp                                     ; 0831 _ 55
        mov     ebp, esp                                ; 0832 _ 89. E5
        push    ebx                                     ; 0834 _ 53
        sub     esp, 28                                 ; 0835 _ 83. EC, 1C
        mov     eax, dword [ebp+10H]                    ; 0838 _ 8B. 45, 10
        lea     edx, [eax-1DH]                          ; 083B _ 8D. 50, E3
        mov     eax, dword [ebp+0CH]                    ; 083E _ 8B. 45, 0C
        sub     eax, 1                                  ; 0841 _ 83. E8, 01
        mov     dword [esp+18H], edx                    ; 0844 _ 89. 54 24, 18
        mov     dword [esp+14H], eax                    ; 0848 _ 89. 44 24, 14
        mov     dword [esp+10H], 0                      ; 084C _ C7. 44 24, 10, 00000000
        mov     dword [esp+0CH], 0                      ; 0854 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 2                       ; 085C _ C7. 44 24, 08, 00000002
        mov     eax, dword [ebp+0CH]                    ; 0864 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0867 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 086B _ 8B. 45, 08
        mov     dword [esp], eax                        ; 086E _ 89. 04 24
        call    paint_rectangle                         ; 0871 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0876 _ 8B. 45, 10
        lea     ecx, [eax-1CH]                          ; 0879 _ 8D. 48, E4
        mov     eax, dword [ebp+0CH]                    ; 087C _ 8B. 45, 0C
        lea     edx, [eax-1H]                           ; 087F _ 8D. 50, FF
        mov     eax, dword [ebp+10H]                    ; 0882 _ 8B. 45, 10
        sub     eax, 28                                 ; 0885 _ 83. E8, 1C
        mov     dword [esp+18H], ecx                    ; 0888 _ 89. 4C 24, 18
        mov     dword [esp+14H], edx                    ; 088C _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 0890 _ 89. 44 24, 10
        mov     dword [esp+0CH], 0                      ; 0894 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 8                       ; 089C _ C7. 44 24, 08, 00000008
        mov     eax, dword [ebp+0CH]                    ; 08A4 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 08A7 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 08AB _ 8B. 45, 08
        mov     dword [esp], eax                        ; 08AE _ 89. 04 24
        call    paint_rectangle                         ; 08B1 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 08B6 _ 8B. 45, 10
        lea     ecx, [eax-1BH]                          ; 08B9 _ 8D. 48, E5
        mov     eax, dword [ebp+0CH]                    ; 08BC _ 8B. 45, 0C
        lea     edx, [eax-1H]                           ; 08BF _ 8D. 50, FF
        mov     eax, dword [ebp+10H]                    ; 08C2 _ 8B. 45, 10
        sub     eax, 27                                 ; 08C5 _ 83. E8, 1B
        mov     dword [esp+18H], ecx                    ; 08C8 _ 89. 4C 24, 18
        mov     dword [esp+14H], edx                    ; 08CC _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 08D0 _ 89. 44 24, 10
        mov     dword [esp+0CH], 0                      ; 08D4 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 7                       ; 08DC _ C7. 44 24, 08, 00000007
        mov     eax, dword [ebp+0CH]                    ; 08E4 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 08E7 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 08EB _ 8B. 45, 08
        mov     dword [esp], eax                        ; 08EE _ 89. 04 24
        call    paint_rectangle                         ; 08F1 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 08F6 _ 8B. 45, 10
        lea     ecx, [eax-1H]                           ; 08F9 _ 8D. 48, FF
        mov     eax, dword [ebp+0CH]                    ; 08FC _ 8B. 45, 0C
        lea     edx, [eax-1H]                           ; 08FF _ 8D. 50, FF
        mov     eax, dword [ebp+10H]                    ; 0902 _ 8B. 45, 10
        sub     eax, 26                                 ; 0905 _ 83. E8, 1A
        mov     dword [esp+18H], ecx                    ; 0908 _ 89. 4C 24, 18
        mov     dword [esp+14H], edx                    ; 090C _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 0910 _ 89. 44 24, 10
        mov     dword [esp+0CH], 0                      ; 0914 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 8                       ; 091C _ C7. 44 24, 08, 00000008
        mov     eax, dword [ebp+0CH]                    ; 0924 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0927 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 092B _ 8B. 45, 08
        mov     dword [esp], eax                        ; 092E _ 89. 04 24
        call    paint_rectangle                         ; 0931 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0936 _ 8B. 45, 10
        lea     edx, [eax-18H]                          ; 0939 _ 8D. 50, E8
        mov     eax, dword [ebp+10H]                    ; 093C _ 8B. 45, 10
        sub     eax, 24                                 ; 093F _ 83. E8, 18
        mov     dword [esp+18H], edx                    ; 0942 _ 89. 54 24, 18
        mov     dword [esp+14H], 59                     ; 0946 _ C7. 44 24, 14, 0000003B
        mov     dword [esp+10H], eax                    ; 094E _ 89. 44 24, 10
        mov     dword [esp+0CH], 3                      ; 0952 _ C7. 44 24, 0C, 00000003
        mov     dword [esp+8H], 7                       ; 095A _ C7. 44 24, 08, 00000007
        mov     eax, dword [ebp+0CH]                    ; 0962 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0965 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0969 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 096C _ 89. 04 24
        call    paint_rectangle                         ; 096F _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0974 _ 8B. 45, 10
        lea     edx, [eax-4H]                           ; 0977 _ 8D. 50, FC
        mov     eax, dword [ebp+10H]                    ; 097A _ 8B. 45, 10
        sub     eax, 24                                 ; 097D _ 83. E8, 18
        mov     dword [esp+18H], edx                    ; 0980 _ 89. 54 24, 18
        mov     dword [esp+14H], 2                      ; 0984 _ C7. 44 24, 14, 00000002
        mov     dword [esp+10H], eax                    ; 098C _ 89. 44 24, 10
        mov     dword [esp+0CH], 2                      ; 0990 _ C7. 44 24, 0C, 00000002
        mov     dword [esp+8H], 7                       ; 0998 _ C7. 44 24, 08, 00000007
        mov     eax, dword [ebp+0CH]                    ; 09A0 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 09A3 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 09A7 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 09AA _ 89. 04 24
        call    paint_rectangle                         ; 09AD _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 09B2 _ 8B. 45, 10
        lea     edx, [eax-4H]                           ; 09B5 _ 8D. 50, FC
        mov     eax, dword [ebp+10H]                    ; 09B8 _ 8B. 45, 10
        sub     eax, 4                                  ; 09BB _ 83. E8, 04
        mov     dword [esp+18H], edx                    ; 09BE _ 89. 54 24, 18
        mov     dword [esp+14H], 59                     ; 09C2 _ C7. 44 24, 14, 0000003B
        mov     dword [esp+10H], eax                    ; 09CA _ 89. 44 24, 10
        mov     dword [esp+0CH], 3                      ; 09CE _ C7. 44 24, 0C, 00000003
        mov     dword [esp+8H], 2                       ; 09D6 _ C7. 44 24, 08, 00000002
        mov     eax, dword [ebp+0CH]                    ; 09DE _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 09E1 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 09E5 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 09E8 _ 89. 04 24
        call    paint_rectangle                         ; 09EB _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 09F0 _ 8B. 45, 10
        lea     edx, [eax-5H]                           ; 09F3 _ 8D. 50, FB
        mov     eax, dword [ebp+10H]                    ; 09F6 _ 8B. 45, 10
        sub     eax, 23                                 ; 09F9 _ 83. E8, 17
        mov     dword [esp+18H], edx                    ; 09FC _ 89. 54 24, 18
        mov     dword [esp+14H], 59                     ; 0A00 _ C7. 44 24, 14, 0000003B
        mov     dword [esp+10H], eax                    ; 0A08 _ 89. 44 24, 10
        mov     dword [esp+0CH], 59                     ; 0A0C _ C7. 44 24, 0C, 0000003B
        mov     dword [esp+8H], 2                       ; 0A14 _ C7. 44 24, 08, 00000002
        mov     eax, dword [ebp+0CH]                    ; 0A1C _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0A1F _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0A23 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0A26 _ 89. 04 24
        call    paint_rectangle                         ; 0A29 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0A2E _ 8B. 45, 10
        lea     edx, [eax-3H]                           ; 0A31 _ 8D. 50, FD
        mov     eax, dword [ebp+10H]                    ; 0A34 _ 8B. 45, 10
        sub     eax, 3                                  ; 0A37 _ 83. E8, 03
        mov     dword [esp+18H], edx                    ; 0A3A _ 89. 54 24, 18
        mov     dword [esp+14H], 59                     ; 0A3E _ C7. 44 24, 14, 0000003B
        mov     dword [esp+10H], eax                    ; 0A46 _ 89. 44 24, 10
        mov     dword [esp+0CH], 2                      ; 0A4A _ C7. 44 24, 0C, 00000002
        mov     dword [esp+8H], 0                       ; 0A52 _ C7. 44 24, 08, 00000000
        mov     eax, dword [ebp+0CH]                    ; 0A5A _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0A5D _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0A61 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0A64 _ 89. 04 24
        call    paint_rectangle                         ; 0A67 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0A6C _ 8B. 45, 10
        lea     edx, [eax-3H]                           ; 0A6F _ 8D. 50, FD
        mov     eax, dword [ebp+10H]                    ; 0A72 _ 8B. 45, 10
        sub     eax, 24                                 ; 0A75 _ 83. E8, 18
        mov     dword [esp+18H], edx                    ; 0A78 _ 89. 54 24, 18
        mov     dword [esp+14H], 60                     ; 0A7C _ C7. 44 24, 14, 0000003C
        mov     dword [esp+10H], eax                    ; 0A84 _ 89. 44 24, 10
        mov     dword [esp+0CH], 60                     ; 0A88 _ C7. 44 24, 0C, 0000003C
        mov     dword [esp+8H], 0                       ; 0A90 _ C7. 44 24, 08, 00000000
        mov     eax, dword [ebp+0CH]                    ; 0A98 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0A9B _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0A9F _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0AA2 _ 89. 04 24
        call    paint_rectangle                         ; 0AA5 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0AAA _ 8B. 45, 10
        lea     ebx, [eax-18H]                          ; 0AAD _ 8D. 58, E8
        mov     eax, dword [ebp+0CH]                    ; 0AB0 _ 8B. 45, 0C
        lea     ecx, [eax-4H]                           ; 0AB3 _ 8D. 48, FC
        mov     eax, dword [ebp+10H]                    ; 0AB6 _ 8B. 45, 10
        lea     edx, [eax-18H]                          ; 0AB9 _ 8D. 50, E8
        mov     eax, dword [ebp+0CH]                    ; 0ABC _ 8B. 45, 0C
        sub     eax, 47                                 ; 0ABF _ 83. E8, 2F
        mov     dword [esp+18H], ebx                    ; 0AC2 _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 0AC6 _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 0ACA _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 0ACE _ 89. 44 24, 0C
        mov     dword [esp+8H], 2                       ; 0AD2 _ C7. 44 24, 08, 00000002
        mov     eax, dword [ebp+0CH]                    ; 0ADA _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0ADD _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0AE1 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0AE4 _ 89. 04 24
        call    paint_rectangle                         ; 0AE7 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0AEC _ 8B. 45, 10
        lea     ebx, [eax-4H]                           ; 0AEF _ 8D. 58, FC
        mov     eax, dword [ebp+0CH]                    ; 0AF2 _ 8B. 45, 0C
        lea     ecx, [eax-2FH]                          ; 0AF5 _ 8D. 48, D1
        mov     eax, dword [ebp+10H]                    ; 0AF8 _ 8B. 45, 10
        lea     edx, [eax-17H]                          ; 0AFB _ 8D. 50, E9
        mov     eax, dword [ebp+0CH]                    ; 0AFE _ 8B. 45, 0C
        sub     eax, 47                                 ; 0B01 _ 83. E8, 2F
        mov     dword [esp+18H], ebx                    ; 0B04 _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 0B08 _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 0B0C _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 0B10 _ 89. 44 24, 0C
        mov     dword [esp+8H], 2                       ; 0B14 _ C7. 44 24, 08, 00000002
        mov     eax, dword [ebp+0CH]                    ; 0B1C _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0B1F _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0B23 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0B26 _ 89. 04 24
        call    paint_rectangle                         ; 0B29 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0B2E _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 0B31 _ 8D. 58, FD
        mov     eax, dword [ebp+0CH]                    ; 0B34 _ 8B. 45, 0C
        lea     ecx, [eax-4H]                           ; 0B37 _ 8D. 48, FC
        mov     eax, dword [ebp+10H]                    ; 0B3A _ 8B. 45, 10
        lea     edx, [eax-3H]                           ; 0B3D _ 8D. 50, FD
        mov     eax, dword [ebp+0CH]                    ; 0B40 _ 8B. 45, 0C
        sub     eax, 47                                 ; 0B43 _ 83. E8, 2F
        mov     dword [esp+18H], ebx                    ; 0B46 _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 0B4A _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 0B4E _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 0B52 _ 89. 44 24, 0C
        mov     dword [esp+8H], 7                       ; 0B56 _ C7. 44 24, 08, 00000007
        mov     eax, dword [ebp+0CH]                    ; 0B5E _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0B61 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0B65 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0B68 _ 89. 04 24
        call    paint_rectangle                         ; 0B6B _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0B70 _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 0B73 _ 8D. 58, FD
        mov     eax, dword [ebp+0CH]                    ; 0B76 _ 8B. 45, 0C
        lea     ecx, [eax-3H]                           ; 0B79 _ 8D. 48, FD
        mov     eax, dword [ebp+10H]                    ; 0B7C _ 8B. 45, 10
        lea     edx, [eax-18H]                          ; 0B7F _ 8D. 50, E8
        mov     eax, dword [ebp+0CH]                    ; 0B82 _ 8B. 45, 0C
        sub     eax, 3                                  ; 0B85 _ 83. E8, 03
        mov     dword [esp+18H], ebx                    ; 0B88 _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 0B8C _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 0B90 _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 0B94 _ 89. 44 24, 0C
        mov     dword [esp+8H], 7                       ; 0B98 _ C7. 44 24, 08, 00000007
        mov     eax, dword [ebp+0CH]                    ; 0BA0 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0BA3 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0BA7 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0BAA _ 89. 04 24
        call    paint_rectangle                         ; 0BAD _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 0BB2 _ 83. C4, 1C
        pop     ebx                                     ; 0BB5 _ 5B
        pop     ebp                                     ; 0BB6 _ 5D
        ret                                             ; 0BB7 _ C3
; init_desktop End of function

init_mouse_position:; Function begin
        push    ebp                                     ; 0BB8 _ 55
        mov     ebp, esp                                ; 0BB9 _ 89. E5
        sub     esp, 16                                 ; 0BBB _ 83. EC, 10
        movzx   eax, word [?_171]                       ; 0BBE _ 0F B7. 05, 00000064(d)
        cwde                                            ; 0BC5 _ 98
        mov     dword [ebp-8H], eax                     ; 0BC6 _ 89. 45, F8
        movzx   eax, word [?_172]                       ; 0BC9 _ 0F B7. 05, 00000066(d)
        cwde                                            ; 0BD0 _ 98
        mov     dword [ebp-4H], eax                     ; 0BD1 _ 89. 45, FC
        mov     eax, dword [ebp-8H]                     ; 0BD4 _ 8B. 45, F8
        sub     eax, 16                                 ; 0BD7 _ 83. E8, 10
        mov     edx, eax                                ; 0BDA _ 89. C2
        shr     edx, 31                                 ; 0BDC _ C1. EA, 1F
        add     eax, edx                                ; 0BDF _ 01. D0
        sar     eax, 1                                  ; 0BE1 _ D1. F8
        mov     dword [mouse_x], eax                    ; 0BE3 _ A3, 00000184(d)
        mov     eax, dword [ebp-4H]                     ; 0BE8 _ 8B. 45, FC
        sub     eax, 44                                 ; 0BEB _ 83. E8, 2C
        mov     edx, eax                                ; 0BEE _ 89. C2
        shr     edx, 31                                 ; 0BF0 _ C1. EA, 1F
        add     eax, edx                                ; 0BF3 _ 01. D0
        sar     eax, 1                                  ; 0BF5 _ D1. F8
        mov     dword [mouse_y], eax                    ; 0BF7 _ A3, 00000188(d)
        leave                                           ; 0BFC _ C9
        ret                                             ; 0BFD _ C3
; init_mouse_position End of function

paint_font:; Function begin
        push    ebp                                     ; 0BFE _ 55
        mov     ebp, esp                                ; 0BFF _ 89. E5
        sub     esp, 20                                 ; 0C01 _ 83. EC, 14
        mov     eax, dword [ebp+1CH]                    ; 0C04 _ 8B. 45, 1C
        mov     byte [ebp-14H], al                      ; 0C07 _ 88. 45, EC
        mov     dword [ebp-4H], 0                       ; 0C0A _ C7. 45, FC, 00000000
        jmp     ?_026                                   ; 0C11 _ E9, 0000016E

?_017:  mov     edx, dword [ebp-4H]                     ; 0C16 _ 8B. 55, FC
        mov     eax, dword [ebp+18H]                    ; 0C19 _ 8B. 45, 18
        add     eax, edx                                ; 0C1C _ 01. D0
        movzx   eax, byte [eax]                         ; 0C1E _ 0F B6. 00
        mov     byte [ebp-5H], al                       ; 0C21 _ 88. 45, FB
        movzx   eax, byte [ebp-5H]                      ; 0C24 _ 0F B6. 45, FB
        test    al, al                                  ; 0C28 _ 84. C0
        jns     ?_018                                   ; 0C2A _ 79, 20
        mov     eax, dword [ebp-4H]                     ; 0C2C _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 0C2F _ 8B. 55, 14
        add     eax, edx                                ; 0C32 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0C34 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0C38 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0C3A _ 8B. 45, 10
        add     eax, edx                                ; 0C3D _ 01. D0
        mov     edx, eax                                ; 0C3F _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0C41 _ 8B. 45, 08
        add     edx, eax                                ; 0C44 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0C46 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0C4A _ 88. 02
?_018:  movzx   eax, byte [ebp-5H]                      ; 0C4C _ 0F B6. 45, FB
        and     eax, 40H                                ; 0C50 _ 83. E0, 40
        test    eax, eax                                ; 0C53 _ 85. C0
        jz      ?_019                                   ; 0C55 _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 0C57 _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 0C5A _ 8B. 55, 14
        add     eax, edx                                ; 0C5D _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0C5F _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0C63 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0C65 _ 8B. 45, 10
        add     eax, edx                                ; 0C68 _ 01. D0
        lea     edx, [eax+1H]                           ; 0C6A _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 0C6D _ 8B. 45, 08
        add     edx, eax                                ; 0C70 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0C72 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0C76 _ 88. 02
?_019:  movzx   eax, byte [ebp-5H]                      ; 0C78 _ 0F B6. 45, FB
        and     eax, 20H                                ; 0C7C _ 83. E0, 20
        test    eax, eax                                ; 0C7F _ 85. C0
        jz      ?_020                                   ; 0C81 _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 0C83 _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 0C86 _ 8B. 55, 14
        add     eax, edx                                ; 0C89 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0C8B _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0C8F _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0C91 _ 8B. 45, 10
        add     eax, edx                                ; 0C94 _ 01. D0
        lea     edx, [eax+2H]                           ; 0C96 _ 8D. 50, 02
        mov     eax, dword [ebp+8H]                     ; 0C99 _ 8B. 45, 08
        add     edx, eax                                ; 0C9C _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0C9E _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0CA2 _ 88. 02
?_020:  movzx   eax, byte [ebp-5H]                      ; 0CA4 _ 0F B6. 45, FB
        and     eax, 10H                                ; 0CA8 _ 83. E0, 10
        test    eax, eax                                ; 0CAB _ 85. C0
        jz      ?_021                                   ; 0CAD _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 0CAF _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 0CB2 _ 8B. 55, 14
        add     eax, edx                                ; 0CB5 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0CB7 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0CBB _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0CBD _ 8B. 45, 10
        add     eax, edx                                ; 0CC0 _ 01. D0
        lea     edx, [eax+3H]                           ; 0CC2 _ 8D. 50, 03
        mov     eax, dword [ebp+8H]                     ; 0CC5 _ 8B. 45, 08
        add     edx, eax                                ; 0CC8 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0CCA _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0CCE _ 88. 02
?_021:  movzx   eax, byte [ebp-5H]                      ; 0CD0 _ 0F B6. 45, FB
        and     eax, 08H                                ; 0CD4 _ 83. E0, 08
        test    eax, eax                                ; 0CD7 _ 85. C0
        jz      ?_022                                   ; 0CD9 _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 0CDB _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 0CDE _ 8B. 55, 14
        add     eax, edx                                ; 0CE1 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0CE3 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0CE7 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0CE9 _ 8B. 45, 10
        add     eax, edx                                ; 0CEC _ 01. D0
        lea     edx, [eax+4H]                           ; 0CEE _ 8D. 50, 04
        mov     eax, dword [ebp+8H]                     ; 0CF1 _ 8B. 45, 08
        add     edx, eax                                ; 0CF4 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0CF6 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0CFA _ 88. 02
?_022:  movzx   eax, byte [ebp-5H]                      ; 0CFC _ 0F B6. 45, FB
        and     eax, 04H                                ; 0D00 _ 83. E0, 04
        test    eax, eax                                ; 0D03 _ 85. C0
        jz      ?_023                                   ; 0D05 _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 0D07 _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 0D0A _ 8B. 55, 14
        add     eax, edx                                ; 0D0D _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0D0F _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0D13 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0D15 _ 8B. 45, 10
        add     eax, edx                                ; 0D18 _ 01. D0
        lea     edx, [eax+5H]                           ; 0D1A _ 8D. 50, 05
        mov     eax, dword [ebp+8H]                     ; 0D1D _ 8B. 45, 08
        add     edx, eax                                ; 0D20 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0D22 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0D26 _ 88. 02
?_023:  movzx   eax, byte [ebp-5H]                      ; 0D28 _ 0F B6. 45, FB
        and     eax, 02H                                ; 0D2C _ 83. E0, 02
        test    eax, eax                                ; 0D2F _ 85. C0
        jz      ?_024                                   ; 0D31 _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 0D33 _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 0D36 _ 8B. 55, 14
        add     eax, edx                                ; 0D39 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0D3B _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0D3F _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0D41 _ 8B. 45, 10
        add     eax, edx                                ; 0D44 _ 01. D0
        lea     edx, [eax+6H]                           ; 0D46 _ 8D. 50, 06
        mov     eax, dword [ebp+8H]                     ; 0D49 _ 8B. 45, 08
        add     edx, eax                                ; 0D4C _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0D4E _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0D52 _ 88. 02
?_024:  movzx   eax, byte [ebp-5H]                      ; 0D54 _ 0F B6. 45, FB
        and     eax, 01H                                ; 0D58 _ 83. E0, 01
        test    eax, eax                                ; 0D5B _ 85. C0
        jz      ?_025                                   ; 0D5D _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 0D5F _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 0D62 _ 8B. 55, 14
        add     eax, edx                                ; 0D65 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0D67 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0D6B _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0D6D _ 8B. 45, 10
        add     eax, edx                                ; 0D70 _ 01. D0
        lea     edx, [eax+7H]                           ; 0D72 _ 8D. 50, 07
        mov     eax, dword [ebp+8H]                     ; 0D75 _ 8B. 45, 08
        add     edx, eax                                ; 0D78 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0D7A _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0D7E _ 88. 02
?_025:  add     dword [ebp-4H], 1                       ; 0D80 _ 83. 45, FC, 01
?_026:  cmp     dword [ebp-4H], 15                      ; 0D84 _ 83. 7D, FC, 0F
        jle     ?_017                                   ; 0D88 _ 0F 8E, FFFFFE88
        leave                                           ; 0D8E _ C9
        ret                                             ; 0D8F _ C3
; paint_font End of function

paint_string:; Function begin
        push    ebp                                     ; 0D90 _ 55
        mov     ebp, esp                                ; 0D91 _ 89. E5
        push    ebx                                     ; 0D93 _ 53
        sub     esp, 52                                 ; 0D94 _ 83. EC, 34
        mov     eax, dword [ebp+1CH]                    ; 0D97 _ 8B. 45, 1C
        mov     byte [ebp-1CH], al                      ; 0D9A _ 88. 45, E4
        mov     eax, dword [ebp+10H]                    ; 0D9D _ 8B. 45, 10
        mov     dword [ebp-0CH], eax                    ; 0DA0 _ 89. 45, F4
        jmp     ?_028                                   ; 0DA3 _ EB, 4B

?_027:  movsx   ecx, byte [ebp-1CH]                     ; 0DA5 _ 0F BE. 4D, E4
        mov     eax, dword [ebp+18H]                    ; 0DA9 _ 8B. 45, 18
        movzx   eax, byte [eax]                         ; 0DAC _ 0F B6. 00
        movsx   eax, al                                 ; 0DAF _ 0F BE. C0
        shl     eax, 4                                  ; 0DB2 _ C1. E0, 04
        lea     ebx, [systemFont+eax]                   ; 0DB5 _ 8D. 98, 00000000(d)
        mov     eax, dword [ebp+0CH]                    ; 0DBB _ 8B. 45, 0C
        mov     edx, dword [eax+4H]                     ; 0DBE _ 8B. 50, 04
        mov     eax, dword [ebp+0CH]                    ; 0DC1 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 0DC4 _ 8B. 00
        mov     dword [esp+14H], ecx                    ; 0DC6 _ 89. 4C 24, 14
        mov     dword [esp+10H], ebx                    ; 0DCA _ 89. 5C 24, 10
        mov     ecx, dword [ebp+14H]                    ; 0DCE _ 8B. 4D, 14
        mov     dword [esp+0CH], ecx                    ; 0DD1 _ 89. 4C 24, 0C
        mov     ecx, dword [ebp+10H]                    ; 0DD5 _ 8B. 4D, 10
        mov     dword [esp+8H], ecx                     ; 0DD8 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 0DDC _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0DE0 _ 89. 04 24
        call    paint_font                              ; 0DE3 _ E8, FFFFFFFC(rel)
        add     dword [ebp+10H], 8                      ; 0DE8 _ 83. 45, 10, 08
        add     dword [ebp+18H], 1                      ; 0DEC _ 83. 45, 18, 01
?_028:  mov     eax, dword [ebp+18H]                    ; 0DF0 _ 8B. 45, 18
        movzx   eax, byte [eax]                         ; 0DF3 _ 0F B6. 00
        test    al, al                                  ; 0DF6 _ 84. C0
        jnz     ?_027                                   ; 0DF8 _ 75, AB
        mov     eax, dword [ebp+14H]                    ; 0DFA _ 8B. 45, 14
        add     eax, 16                                 ; 0DFD _ 83. C0, 10
        mov     dword [esp+14H], eax                    ; 0E00 _ 89. 44 24, 14
        mov     eax, dword [ebp+10H]                    ; 0E04 _ 8B. 45, 10
        mov     dword [esp+10H], eax                    ; 0E07 _ 89. 44 24, 10
        mov     eax, dword [ebp+14H]                    ; 0E0B _ 8B. 45, 14
        mov     dword [esp+0CH], eax                    ; 0E0E _ 89. 44 24, 0C
        mov     eax, dword [ebp-0CH]                    ; 0E12 _ 8B. 45, F4
        mov     dword [esp+8H], eax                     ; 0E15 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 0E19 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0E1C _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0E20 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0E23 _ 89. 04 24
        call    sheet_refresh                           ; 0E26 _ E8, FFFFFFFC(rel)
        add     esp, 52                                 ; 0E2B _ 83. C4, 34
        pop     ebx                                     ; 0E2E _ 5B
        pop     ebp                                     ; 0E2F _ 5D
        ret                                             ; 0E30 _ C3
; paint_string End of function

init_mouse_cursor:; Function begin
        push    ebp                                     ; 0E31 _ 55
        mov     ebp, esp                                ; 0E32 _ 89. E5
        sub     esp, 20                                 ; 0E34 _ 83. EC, 14
        mov     eax, dword [ebp+0CH]                    ; 0E37 _ 8B. 45, 0C
        mov     byte [ebp-14H], al                      ; 0E3A _ 88. 45, EC
        mov     dword [ebp-8H], 0                       ; 0E3D _ C7. 45, F8, 00000000
        jmp     ?_035                                   ; 0E44 _ E9, 0000009C

?_029:  mov     dword [ebp-4H], 0                       ; 0E49 _ C7. 45, FC, 00000000
        jmp     ?_034                                   ; 0E50 _ E9, 00000082

?_030:  mov     eax, dword [ebp-8H]                     ; 0E55 _ 8B. 45, F8
        shl     eax, 4                                  ; 0E58 _ C1. E0, 04
        mov     edx, eax                                ; 0E5B _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 0E5D _ 8B. 45, FC
        add     eax, edx                                ; 0E60 _ 01. D0
        add     eax, cursor.1689                        ; 0E62 _ 05, 000000C0(d)
        movzx   eax, byte [eax]                         ; 0E67 _ 0F B6. 00
        cmp     al, 42                                  ; 0E6A _ 3C, 2A
        jnz     ?_031                                   ; 0E6C _ 75, 19
        mov     eax, dword [ebp-8H]                     ; 0E6E _ 8B. 45, F8
        shl     eax, 4                                  ; 0E71 _ C1. E0, 04
        mov     edx, eax                                ; 0E74 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 0E76 _ 8B. 45, FC
        add     eax, edx                                ; 0E79 _ 01. D0
        mov     edx, eax                                ; 0E7B _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0E7D _ 8B. 45, 08
        add     eax, edx                                ; 0E80 _ 01. D0
        mov     byte [eax], 0                           ; 0E82 _ C6. 00, 00
        jmp     ?_033                                   ; 0E85 _ EB, 4C

?_031:  mov     eax, dword [ebp-8H]                     ; 0E87 _ 8B. 45, F8
        shl     eax, 4                                  ; 0E8A _ C1. E0, 04
        mov     edx, eax                                ; 0E8D _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 0E8F _ 8B. 45, FC
        add     eax, edx                                ; 0E92 _ 01. D0
        add     eax, cursor.1689                        ; 0E94 _ 05, 000000C0(d)
        movzx   eax, byte [eax]                         ; 0E99 _ 0F B6. 00
        cmp     al, 79                                  ; 0E9C _ 3C, 4F
        jnz     ?_032                                   ; 0E9E _ 75, 19
        mov     eax, dword [ebp-8H]                     ; 0EA0 _ 8B. 45, F8
        shl     eax, 4                                  ; 0EA3 _ C1. E0, 04
        mov     edx, eax                                ; 0EA6 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 0EA8 _ 8B. 45, FC
        add     eax, edx                                ; 0EAB _ 01. D0
        mov     edx, eax                                ; 0EAD _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0EAF _ 8B. 45, 08
        add     eax, edx                                ; 0EB2 _ 01. D0
        mov     byte [eax], 7                           ; 0EB4 _ C6. 00, 07
        jmp     ?_033                                   ; 0EB7 _ EB, 1A

?_032:  mov     eax, dword [ebp-8H]                     ; 0EB9 _ 8B. 45, F8
        shl     eax, 4                                  ; 0EBC _ C1. E0, 04
        mov     edx, eax                                ; 0EBF _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 0EC1 _ 8B. 45, FC
        add     eax, edx                                ; 0EC4 _ 01. D0
        mov     edx, eax                                ; 0EC6 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0EC8 _ 8B. 45, 08
        add     edx, eax                                ; 0ECB _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0ECD _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0ED1 _ 88. 02
?_033:  add     dword [ebp-4H], 1                       ; 0ED3 _ 83. 45, FC, 01
?_034:  cmp     dword [ebp-4H], 15                      ; 0ED7 _ 83. 7D, FC, 0F
        jle     ?_030                                   ; 0EDB _ 0F 8E, FFFFFF74
        add     dword [ebp-8H], 1                       ; 0EE1 _ 83. 45, F8, 01
?_035:  cmp     dword [ebp-8H], 15                      ; 0EE5 _ 83. 7D, F8, 0F
        jle     ?_029                                   ; 0EE9 _ 0F 8E, FFFFFF5A
        leave                                           ; 0EEF _ C9
        ret                                             ; 0EF0 _ C3
; init_mouse_cursor End of function

paint_block:; Function begin
        push    ebp                                     ; 0EF1 _ 55
        mov     ebp, esp                                ; 0EF2 _ 89. E5
        sub     esp, 16                                 ; 0EF4 _ 83. EC, 10
        mov     dword [ebp-8H], 0                       ; 0EF7 _ C7. 45, F8, 00000000
        jmp     ?_039                                   ; 0EFE _ EB, 50

?_036:  mov     dword [ebp-4H], 0                       ; 0F00 _ C7. 45, FC, 00000000
        jmp     ?_038                                   ; 0F07 _ EB, 3B

?_037:  mov     eax, dword [ebp-8H]                     ; 0F09 _ 8B. 45, F8
        mov     edx, dword [ebp+14H]                    ; 0F0C _ 8B. 55, 14
        add     eax, edx                                ; 0F0F _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0F11 _ 0F AF. 45, 0C
        mov     edx, dword [ebp-4H]                     ; 0F15 _ 8B. 55, FC
        mov     ecx, dword [ebp+10H]                    ; 0F18 _ 8B. 4D, 10
        add     edx, ecx                                ; 0F1B _ 01. CA
        add     eax, edx                                ; 0F1D _ 01. D0
        mov     edx, eax                                ; 0F1F _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0F21 _ 8B. 45, 08
        add     edx, eax                                ; 0F24 _ 01. C2
        mov     eax, dword [ebp-8H]                     ; 0F26 _ 8B. 45, F8
        imul    eax, dword [ebp+18H]                    ; 0F29 _ 0F AF. 45, 18
        mov     ecx, eax                                ; 0F2D _ 89. C1
        mov     eax, dword [ebp-4H]                     ; 0F2F _ 8B. 45, FC
        add     eax, ecx                                ; 0F32 _ 01. C8
        mov     ecx, eax                                ; 0F34 _ 89. C1
        mov     eax, dword [ebp+20H]                    ; 0F36 _ 8B. 45, 20
        add     eax, ecx                                ; 0F39 _ 01. C8
        movzx   eax, byte [eax]                         ; 0F3B _ 0F B6. 00
        mov     byte [edx], al                          ; 0F3E _ 88. 02
        add     dword [ebp-4H], 1                       ; 0F40 _ 83. 45, FC, 01
?_038:  mov     eax, dword [ebp-4H]                     ; 0F44 _ 8B. 45, FC
        cmp     eax, dword [ebp+18H]                    ; 0F47 _ 3B. 45, 18
        jl      ?_037                                   ; 0F4A _ 7C, BD
        add     dword [ebp-8H], 1                       ; 0F4C _ 83. 45, F8, 01
?_039:  mov     eax, dword [ebp-8H]                     ; 0F50 _ 8B. 45, F8
        cmp     eax, dword [ebp+1CH]                    ; 0F53 _ 3B. 45, 1C
        jl      ?_036                                   ; 0F56 _ 7C, A8
        leave                                           ; 0F58 _ C9
        ret                                             ; 0F59 _ C3
; paint_block End of function

init_fifo_buf:; Function begin
        push    ebp                                     ; 0F5A _ 55
        mov     ebp, esp                                ; 0F5B _ 89. E5
        sub     esp, 24                                 ; 0F5D _ 83. EC, 18
        mov     dword [esp+8H], mousebuf                ; 0F60 _ C7. 44 24, 08, 00000000(d)
        mov     dword [esp+4H], 128                     ; 0F68 _ C7. 44 24, 04, 00000080
        mov     dword [esp], mouseinfo                  ; 0F70 _ C7. 04 24, 00000000(d)
        call    fifo8_init                              ; 0F77 _ E8, FFFFFFFC(rel)
        mov     dword [esp+8H], keybuf                  ; 0F7C _ C7. 44 24, 08, 00000000(d)
        mov     dword [esp+4H], 32                      ; 0F84 _ C7. 44 24, 04, 00000020
        mov     dword [esp], keyinfo                    ; 0F8C _ C7. 04 24, 00000000(d)
        call    fifo8_init                              ; 0F93 _ E8, FFFFFFFC(rel)
        leave                                           ; 0F98 _ C9
        ret                                             ; 0F99 _ C3
; init_fifo_buf End of function

compute_mouse_position:; Function begin
        push    ebp                                     ; 0F9A _ 55
        mov     ebp, esp                                ; 0F9B _ 89. E5
        sub     esp, 40                                 ; 0F9D _ 83. EC, 28
        mov     eax, dword [ebp+10H]                    ; 0FA0 _ 8B. 45, 10
        mov     edx, dword [eax+4H]                     ; 0FA3 _ 8B. 50, 04
        mov     eax, dword [mouse_x]                    ; 0FA6 _ A1, 00000184(d)
        add     eax, edx                                ; 0FAB _ 01. D0
        mov     dword [mouse_x], eax                    ; 0FAD _ A3, 00000184(d)
        mov     eax, dword [ebp+10H]                    ; 0FB2 _ 8B. 45, 10
        mov     edx, dword [eax+8H]                     ; 0FB5 _ 8B. 50, 08
        mov     eax, dword [mouse_y]                    ; 0FB8 _ A1, 00000188(d)
        add     eax, edx                                ; 0FBD _ 01. D0
        mov     dword [mouse_y], eax                    ; 0FBF _ A3, 00000188(d)
        mov     eax, dword [mouse_x]                    ; 0FC4 _ A1, 00000184(d)
        test    eax, eax                                ; 0FC9 _ 85. C0
        jns     ?_040                                   ; 0FCB _ 79, 0A
        mov     dword [mouse_x], 0                      ; 0FCD _ C7. 05, 00000184(d), 00000000
?_040:  mov     eax, dword [mouse_y]                    ; 0FD7 _ A1, 00000188(d)
        test    eax, eax                                ; 0FDC _ 85. C0
        jns     ?_041                                   ; 0FDE _ 79, 0A
        mov     dword [mouse_y], 0                      ; 0FE0 _ C7. 05, 00000188(d), 00000000
?_041:  movzx   eax, word [?_171]                       ; 0FEA _ 0F B7. 05, 00000064(d)
        cwde                                            ; 0FF1 _ 98
        lea     edx, [eax-10H]                          ; 0FF2 _ 8D. 50, F0
        mov     eax, dword [mouse_x]                    ; 0FF5 _ A1, 00000184(d)
        cmp     edx, eax                                ; 0FFA _ 39. C2
        jge     ?_042                                   ; 0FFC _ 7D, 10
        movzx   eax, word [?_171]                       ; 0FFE _ 0F B7. 05, 00000064(d)
        cwde                                            ; 1005 _ 98
        sub     eax, 16                                 ; 1006 _ 83. E8, 10
        mov     dword [mouse_x], eax                    ; 1009 _ A3, 00000184(d)
?_042:  movzx   eax, word [?_171]                       ; 100E _ 0F B7. 05, 00000064(d)
        cwde                                            ; 1015 _ 98
        lea     edx, [eax-10H]                          ; 1016 _ 8D. 50, F0
        mov     eax, dword [mouse_y]                    ; 1019 _ A1, 00000188(d)
        cmp     edx, eax                                ; 101E _ 39. C2
        jge     ?_043                                   ; 1020 _ 7D, 10
        movzx   eax, word [?_171]                       ; 1022 _ 0F B7. 05, 00000064(d)
        cwde                                            ; 1029 _ 98
        sub     eax, 16                                 ; 102A _ 83. E8, 10
        mov     dword [mouse_y], eax                    ; 102D _ A3, 00000188(d)
?_043:  mov     dword [esp+14H], 7                      ; 1032 _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_162                  ; 103A _ C7. 44 24, 10, 00000017(d)
        mov     dword [esp+0CH], 0                      ; 1042 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 0                       ; 104A _ C7. 44 24, 08, 00000000
        mov     eax, dword [ebp+0CH]                    ; 1052 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 1055 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1059 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 105C _ 89. 04 24
        call    paint_string                            ; 105F _ E8, FFFFFFFC(rel)
        leave                                           ; 1064 _ C9
        ret                                             ; 1065 _ C3
; compute_mouse_position End of function

show_mouse_info:; Function begin
        push    ebp                                     ; 1066 _ 55
        mov     ebp, esp                                ; 1067 _ 89. E5
        sub     esp, 40                                 ; 1069 _ 83. EC, 28
        mov     byte [ebp-9H], 0                        ; 106C _ C6. 45, F7, 00
        call    io_sti                                  ; 1070 _ E8, FFFFFFFC(rel)
        mov     dword [esp], mouseinfo                  ; 1075 _ C7. 04 24, 00000000(d)
        call    fifo8_get                               ; 107C _ E8, FFFFFFFC(rel)
        mov     byte [ebp-9H], al                       ; 1081 _ 88. 45, F7
        movzx   eax, byte [ebp-9H]                      ; 1084 _ 0F B6. 45, F7
        mov     dword [esp+4H], eax                     ; 1088 _ 89. 44 24, 04
        mov     dword [esp], mouse_send_info            ; 108C _ C7. 04 24, 00000000(d)
        call    mouse_decode                            ; 1093 _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 1098 _ 85. C0
        jz      ?_044                                   ; 109A _ 74, 3F
        mov     dword [esp+8H], mouse_send_info         ; 109C _ C7. 44 24, 08, 00000000(d)
        mov     eax, dword [ebp+0CH]                    ; 10A4 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 10A7 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 10AB _ 8B. 45, 08
        mov     dword [esp], eax                        ; 10AE _ 89. 04 24
        call    compute_mouse_position                  ; 10B1 _ E8, FFFFFFFC(rel)
        mov     edx, dword [mouse_y]                    ; 10B6 _ 8B. 15, 00000188(d)
        mov     eax, dword [mouse_x]                    ; 10BC _ A1, 00000184(d)
        mov     dword [esp+0CH], edx                    ; 10C1 _ 89. 54 24, 0C
        mov     dword [esp+8H], eax                     ; 10C5 _ 89. 44 24, 08
        mov     eax, dword [ebp+10H]                    ; 10C9 _ 8B. 45, 10
        mov     dword [esp+4H], eax                     ; 10CC _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 10D0 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 10D3 _ 89. 04 24
        call    sheet_slide                             ; 10D6 _ E8, FFFFFFFC(rel)
?_044:  leave                                           ; 10DB _ C9
        ret                                             ; 10DC _ C3
; show_mouse_info End of function

show_memory_info:; Function begin
        push    ebp                                     ; 10DD _ 55
        mov     ebp, esp                                ; 10DE _ 89. E5
        sub     esp, 88                                 ; 10E0 _ 83. EC, 58
        mov     dword [ebp-38H], 0                      ; 10E3 _ C7. 45, C8, 00000000
        mov     dword [ebp-34H], 0                      ; 10EA _ C7. 45, CC, 00000000
        mov     dword [ebp-30H], 104                    ; 10F1 _ C7. 45, D0, 00000068
        mov     eax, dword [screen_info]                ; 10F8 _ A1, 00000060(d)
        mov     dword [ebp-2CH], eax                    ; 10FD _ 89. 45, D4
        movzx   eax, word [?_171]                       ; 1100 _ 0F B7. 05, 00000064(d)
        cwde                                            ; 1107 _ 98
        mov     dword [ebp-28H], eax                    ; 1108 _ 89. 45, D8
        movzx   eax, word [?_172]                       ; 110B _ 0F B7. 05, 00000066(d)
        cwde                                            ; 1112 _ 98
        mov     dword [ebp-24H], eax                    ; 1113 _ 89. 45, DC
        mov     eax, dword [ebp+0CH]                    ; 1116 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1119 _ 8B. 00
        mov     edx, dword [ebp-24H]                    ; 111B _ 8B. 55, DC
        mov     dword [esp+8H], edx                     ; 111E _ 89. 54 24, 08
        mov     edx, dword [ebp-28H]                    ; 1122 _ 8B. 55, D8
        mov     dword [esp+4H], edx                     ; 1125 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1129 _ 89. 04 24
        call    init_desktop                            ; 112C _ E8, FFFFFFFC(rel)
        mov     dword [esp+14H], 7                      ; 1131 _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_163                  ; 1139 _ C7. 44 24, 10, 0000002E(d)
        mov     eax, dword [ebp-34H]                    ; 1141 _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 1144 _ 89. 44 24, 0C
        mov     eax, dword [ebp-38H]                    ; 1148 _ 8B. 45, C8
        mov     dword [esp+8H], eax                     ; 114B _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 114F _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 1152 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1156 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1159 _ 89. 04 24
        call    paint_string                            ; 115C _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+14H]                    ; 1161 _ 8B. 45, 14
        mov     dword [esp], eax                        ; 1164 _ 89. 04 24
        call    intToHexStr                             ; 1167 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-20H], eax                    ; 116C _ 89. 45, E0
        mov     dword [esp+14H], 7                      ; 116F _ C7. 44 24, 14, 00000007
        mov     eax, dword [ebp-20H]                    ; 1177 _ 8B. 45, E0
        mov     dword [esp+10H], eax                    ; 117A _ 89. 44 24, 10
        mov     eax, dword [ebp-34H]                    ; 117E _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 1181 _ 89. 44 24, 0C
        mov     eax, dword [ebp-30H]                    ; 1185 _ 8B. 45, D0
        mov     dword [esp+8H], eax                     ; 1188 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 118C _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 118F _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1193 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1196 _ 89. 04 24
        call    paint_string                            ; 1199 _ E8, FFFFFFFC(rel)
        add     dword [ebp-34H], 16                     ; 119E _ 83. 45, CC, 10
        mov     dword [esp+14H], 7                      ; 11A2 _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_164                  ; 11AA _ C7. 44 24, 10, 00000038(d)
        mov     eax, dword [ebp-34H]                    ; 11B2 _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 11B5 _ 89. 44 24, 0C
        mov     eax, dword [ebp-38H]                    ; 11B9 _ 8B. 45, C8
        mov     dword [esp+8H], eax                     ; 11BC _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 11C0 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 11C3 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 11C7 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 11CA _ 89. 04 24
        call    paint_string                            ; 11CD _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 11D2 _ 8B. 45, 10
        mov     eax, dword [eax]                        ; 11D5 _ 8B. 00
        mov     dword [esp], eax                        ; 11D7 _ 89. 04 24
        call    intToHexStr                             ; 11DA _ E8, FFFFFFFC(rel)
        mov     dword [ebp-1CH], eax                    ; 11DF _ 89. 45, E4
        mov     dword [esp+14H], 7                      ; 11E2 _ C7. 44 24, 14, 00000007
        mov     eax, dword [ebp-1CH]                    ; 11EA _ 8B. 45, E4
        mov     dword [esp+10H], eax                    ; 11ED _ 89. 44 24, 10
        mov     eax, dword [ebp-34H]                    ; 11F1 _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 11F4 _ 89. 44 24, 0C
        mov     eax, dword [ebp-30H]                    ; 11F8 _ 8B. 45, D0
        mov     dword [esp+8H], eax                     ; 11FB _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 11FF _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 1202 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1206 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1209 _ 89. 04 24
        call    paint_string                            ; 120C _ E8, FFFFFFFC(rel)
        add     dword [ebp-34H], 16                     ; 1211 _ 83. 45, CC, 10
        mov     dword [esp+14H], 7                      ; 1215 _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_165                  ; 121D _ C7. 44 24, 10, 00000044(d)
        mov     eax, dword [ebp-34H]                    ; 1225 _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 1228 _ 89. 44 24, 0C
        mov     eax, dword [ebp-38H]                    ; 122C _ 8B. 45, C8
        mov     dword [esp+8H], eax                     ; 122F _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 1233 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 1236 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 123A _ 8B. 45, 08
        mov     dword [esp], eax                        ; 123D _ 89. 04 24
        call    paint_string                            ; 1240 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 1245 _ 8B. 45, 10
        mov     eax, dword [eax+4H]                     ; 1248 _ 8B. 40, 04
        mov     dword [esp], eax                        ; 124B _ 89. 04 24
        call    intToHexStr                             ; 124E _ E8, FFFFFFFC(rel)
        mov     dword [ebp-18H], eax                    ; 1253 _ 89. 45, E8
        mov     dword [esp+14H], 7                      ; 1256 _ C7. 44 24, 14, 00000007
        mov     eax, dword [ebp-18H]                    ; 125E _ 8B. 45, E8
        mov     dword [esp+10H], eax                    ; 1261 _ 89. 44 24, 10
        mov     eax, dword [ebp-34H]                    ; 1265 _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 1268 _ 89. 44 24, 0C
        mov     eax, dword [ebp-30H]                    ; 126C _ 8B. 45, D0
        mov     dword [esp+8H], eax                     ; 126F _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 1273 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 1276 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 127A _ 8B. 45, 08
        mov     dword [esp], eax                        ; 127D _ 89. 04 24
        call    paint_string                            ; 1280 _ E8, FFFFFFFC(rel)
        add     dword [ebp-34H], 16                     ; 1285 _ 83. 45, CC, 10
        mov     dword [esp+14H], 7                      ; 1289 _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_166                  ; 1291 _ C7. 44 24, 10, 00000050(d)
        mov     eax, dword [ebp-34H]                    ; 1299 _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 129C _ 89. 44 24, 0C
        mov     eax, dword [ebp-38H]                    ; 12A0 _ 8B. 45, C8
        mov     dword [esp+8H], eax                     ; 12A3 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 12A7 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 12AA _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 12AE _ 8B. 45, 08
        mov     dword [esp], eax                        ; 12B1 _ 89. 04 24
        call    paint_string                            ; 12B4 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 12B9 _ 8B. 45, 10
        mov     eax, dword [eax+8H]                     ; 12BC _ 8B. 40, 08
        mov     dword [esp], eax                        ; 12BF _ 89. 04 24
        call    intToHexStr                             ; 12C2 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-14H], eax                    ; 12C7 _ 89. 45, EC
        mov     dword [esp+14H], 7                      ; 12CA _ C7. 44 24, 14, 00000007
        mov     eax, dword [ebp-14H]                    ; 12D2 _ 8B. 45, EC
        mov     dword [esp+10H], eax                    ; 12D5 _ 89. 44 24, 10
        mov     eax, dword [ebp-34H]                    ; 12D9 _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 12DC _ 89. 44 24, 0C
        mov     eax, dword [ebp-30H]                    ; 12E0 _ 8B. 45, D0
        mov     dword [esp+8H], eax                     ; 12E3 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 12E7 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 12EA _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 12EE _ 8B. 45, 08
        mov     dword [esp], eax                        ; 12F1 _ 89. 04 24
        call    paint_string                            ; 12F4 _ E8, FFFFFFFC(rel)
        add     dword [ebp-34H], 16                     ; 12F9 _ 83. 45, CC, 10
        mov     dword [esp+14H], 7                      ; 12FD _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_167                  ; 1305 _ C7. 44 24, 10, 0000005C(d)
        mov     eax, dword [ebp-34H]                    ; 130D _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 1310 _ 89. 44 24, 0C
        mov     eax, dword [ebp-38H]                    ; 1314 _ 8B. 45, C8
        mov     dword [esp+8H], eax                     ; 1317 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 131B _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 131E _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1322 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1325 _ 89. 04 24
        call    paint_string                            ; 1328 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 132D _ 8B. 45, 10
        mov     eax, dword [eax+0CH]                    ; 1330 _ 8B. 40, 0C
        mov     dword [esp], eax                        ; 1333 _ 89. 04 24
        call    intToHexStr                             ; 1336 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 133B _ 89. 45, F0
        mov     dword [esp+14H], 7                      ; 133E _ C7. 44 24, 14, 00000007
        mov     eax, dword [ebp-10H]                    ; 1346 _ 8B. 45, F0
        mov     dword [esp+10H], eax                    ; 1349 _ 89. 44 24, 10
        mov     eax, dword [ebp-34H]                    ; 134D _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 1350 _ 89. 44 24, 0C
        mov     eax, dword [ebp-30H]                    ; 1354 _ 8B. 45, D0
        mov     dword [esp+8H], eax                     ; 1357 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 135B _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 135E _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1362 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1365 _ 89. 04 24
        call    paint_string                            ; 1368 _ E8, FFFFFFFC(rel)
        add     dword [ebp-34H], 16                     ; 136D _ 83. 45, CC, 10
        mov     dword [esp+14H], 7                      ; 1371 _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_168                  ; 1379 _ C7. 44 24, 10, 00000069(d)
        mov     eax, dword [ebp-34H]                    ; 1381 _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 1384 _ 89. 44 24, 0C
        mov     eax, dword [ebp-38H]                    ; 1388 _ 8B. 45, C8
        mov     dword [esp+8H], eax                     ; 138B _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 138F _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 1392 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1396 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1399 _ 89. 04 24
        call    paint_string                            ; 139C _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 13A1 _ 8B. 45, 10
        mov     eax, dword [eax+10H]                    ; 13A4 _ 8B. 40, 10
        mov     dword [esp], eax                        ; 13A7 _ 89. 04 24
        call    intToHexStr                             ; 13AA _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 13AF _ 89. 45, F4
        mov     dword [esp+14H], 7                      ; 13B2 _ C7. 44 24, 14, 00000007
        mov     eax, dword [ebp-0CH]                    ; 13BA _ 8B. 45, F4
        mov     dword [esp+10H], eax                    ; 13BD _ 89. 44 24, 10
        mov     eax, dword [ebp-34H]                    ; 13C1 _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 13C4 _ 89. 44 24, 0C
        mov     eax, dword [ebp-30H]                    ; 13C8 _ 8B. 45, D0
        mov     dword [esp+8H], eax                     ; 13CB _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 13CF _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 13D2 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 13D6 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 13D9 _ 89. 04 24
        call    paint_string                            ; 13DC _ E8, FFFFFFFC(rel)
        add     dword [ebp-34H], 16                     ; 13E1 _ 83. 45, CC, 10
        leave                                           ; 13E5 _ C9
        ret                                             ; 13E6 _ C3
; show_memory_info End of function

message_box:; Function begin
        push    ebp                                     ; 13E7 _ 55
        mov     ebp, esp                                ; 13E8 _ 89. E5
        sub     esp, 56                                 ; 13EA _ 83. EC, 38
        mov     eax, dword [ebp+8H]                     ; 13ED _ 8B. 45, 08
        mov     dword [esp], eax                        ; 13F0 _ 89. 04 24
        call    sheet_alloc                             ; 13F3 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 13F8 _ 89. 45, F0
        mov     eax, dword [memman]                     ; 13FB _ A1, 00000000(d)
        mov     dword [esp+4H], 10880                   ; 1400 _ C7. 44 24, 04, 00002A80
        mov     dword [esp], eax                        ; 1408 _ 89. 04 24
        call    memman_alloc_4k                         ; 140B _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 1410 _ 89. 45, F4
        mov     dword [esp+10H], 99                     ; 1413 _ C7. 44 24, 10, 00000063
        mov     dword [esp+0CH], 68                     ; 141B _ C7. 44 24, 0C, 00000044
        mov     dword [esp+8H], 160                     ; 1423 _ C7. 44 24, 08, 000000A0
        mov     eax, dword [ebp-0CH]                    ; 142B _ 8B. 45, F4
        mov     dword [esp+4H], eax                     ; 142E _ 89. 44 24, 04
        mov     eax, dword [ebp-10H]                    ; 1432 _ 8B. 45, F0
        mov     dword [esp], eax                        ; 1435 _ 89. 04 24
        call    sheet_setbuf                            ; 1438 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+0CH]                    ; 143D _ 8B. 45, 0C
        mov     dword [esp+8H], eax                     ; 1440 _ 89. 44 24, 08
        mov     eax, dword [ebp-10H]                    ; 1444 _ 8B. 45, F0
        mov     dword [esp+4H], eax                     ; 1447 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 144B _ 8B. 45, 08
        mov     dword [esp], eax                        ; 144E _ 89. 04 24
        call    make_windows                            ; 1451 _ E8, FFFFFFFC(rel)
        mov     dword [esp+14H], 7                      ; 1456 _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], 16                     ; 145E _ C7. 44 24, 10, 00000010
        mov     dword [esp+0CH], 144                    ; 1466 _ C7. 44 24, 0C, 00000090
        mov     dword [esp+8H], 28                      ; 146E _ C7. 44 24, 08, 0000001C
        mov     dword [esp+4H], 8                       ; 1476 _ C7. 44 24, 04, 00000008
        mov     eax, dword [ebp-10H]                    ; 147E _ 8B. 45, F0
        mov     dword [esp], eax                        ; 1481 _ 89. 04 24
        call    make_textbox                            ; 1484 _ E8, FFFFFFFC(rel)
        mov     dword [esp+0CH], 72                     ; 1489 _ C7. 44 24, 0C, 00000048
        mov     dword [esp+8H], 80                      ; 1491 _ C7. 44 24, 08, 00000050
        mov     eax, dword [ebp-10H]                    ; 1499 _ 8B. 45, F0
        mov     dword [esp+4H], eax                     ; 149C _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 14A0 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 14A3 _ 89. 04 24
        call    sheet_slide                             ; 14A6 _ E8, FFFFFFFC(rel)
        mov     dword [esp+8H], 2                       ; 14AB _ C7. 44 24, 08, 00000002
        mov     eax, dword [ebp-10H]                    ; 14B3 _ 8B. 45, F0
        mov     dword [esp+4H], eax                     ; 14B6 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 14BA _ 8B. 45, 08
        mov     dword [esp], eax                        ; 14BD _ 89. 04 24
        call    sheet_updown                            ; 14C0 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 14C5 _ 8B. 45, F0
        leave                                           ; 14C8 _ C9
        ret                                             ; 14C9 _ C3
; message_box End of function

make_textbox:; Function begin
        push    ebp                                     ; 14CA _ 55
        mov     ebp, esp                                ; 14CB _ 89. E5
        push    edi                                     ; 14CD _ 57
        push    esi                                     ; 14CE _ 56
        push    ebx                                     ; 14CF _ 53
        sub     esp, 44                                 ; 14D0 _ 83. EC, 2C
        mov     eax, dword [ebp+14H]                    ; 14D3 _ 8B. 45, 14
        mov     edx, dword [ebp+0CH]                    ; 14D6 _ 8B. 55, 0C
        add     eax, edx                                ; 14D9 _ 01. D0
        mov     dword [ebp-14H], eax                    ; 14DB _ 89. 45, EC
        mov     eax, dword [ebp+18H]                    ; 14DE _ 8B. 45, 18
        mov     edx, dword [ebp+10H]                    ; 14E1 _ 8B. 55, 10
        add     eax, edx                                ; 14E4 _ 01. D0
        mov     dword [ebp-10H], eax                    ; 14E6 _ 89. 45, F0
        mov     eax, dword [ebp+10H]                    ; 14E9 _ 8B. 45, 10
        lea     edi, [eax-3H]                           ; 14EC _ 8D. 78, FD
        mov     eax, dword [ebp-14H]                    ; 14EF _ 8B. 45, EC
        lea     esi, [eax+1H]                           ; 14F2 _ 8D. 70, 01
        mov     eax, dword [ebp+10H]                    ; 14F5 _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 14F8 _ 8D. 58, FD
        mov     eax, dword [ebp+0CH]                    ; 14FB _ 8B. 45, 0C
        lea     ecx, [eax-2H]                           ; 14FE _ 8D. 48, FE
        mov     eax, dword [ebp+8H]                     ; 1501 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 1504 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1507 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 150A _ 8B. 00
        mov     dword [esp+18H], edi                    ; 150C _ 89. 7C 24, 18
        mov     dword [esp+14H], esi                    ; 1510 _ 89. 74 24, 14
        mov     dword [esp+10H], ebx                    ; 1514 _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 1518 _ 89. 4C 24, 0C
        mov     dword [esp+8H], 15                      ; 151C _ C7. 44 24, 08, 0000000F
        mov     dword [esp+4H], edx                     ; 1524 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1528 _ 89. 04 24
        call    paint_rectangle                         ; 152B _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 1530 _ 8B. 45, F0
        lea     edi, [eax+1H]                           ; 1533 _ 8D. 78, 01
        mov     eax, dword [ebp+0CH]                    ; 1536 _ 8B. 45, 0C
        lea     esi, [eax-3H]                           ; 1539 _ 8D. 70, FD
        mov     eax, dword [ebp+10H]                    ; 153C _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 153F _ 8D. 58, FD
        mov     eax, dword [ebp+0CH]                    ; 1542 _ 8B. 45, 0C
        lea     ecx, [eax-3H]                           ; 1545 _ 8D. 48, FD
        mov     eax, dword [ebp+8H]                     ; 1548 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 154B _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 154E _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1551 _ 8B. 00
        mov     dword [esp+18H], edi                    ; 1553 _ 89. 7C 24, 18
        mov     dword [esp+14H], esi                    ; 1557 _ 89. 74 24, 14
        mov     dword [esp+10H], ebx                    ; 155B _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 155F _ 89. 4C 24, 0C
        mov     dword [esp+8H], 15                      ; 1563 _ C7. 44 24, 08, 0000000F
        mov     dword [esp+4H], edx                     ; 156B _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 156F _ 89. 04 24
        call    paint_rectangle                         ; 1572 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 1577 _ 8B. 45, F0
        lea     edi, [eax+2H]                           ; 157A _ 8D. 78, 02
        mov     eax, dword [ebp-14H]                    ; 157D _ 8B. 45, EC
        lea     esi, [eax+1H]                           ; 1580 _ 8D. 70, 01
        mov     eax, dword [ebp-10H]                    ; 1583 _ 8B. 45, F0
        lea     ebx, [eax+2H]                           ; 1586 _ 8D. 58, 02
        mov     eax, dword [ebp+0CH]                    ; 1589 _ 8B. 45, 0C
        lea     ecx, [eax-3H]                           ; 158C _ 8D. 48, FD
        mov     eax, dword [ebp+8H]                     ; 158F _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 1592 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1595 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1598 _ 8B. 00
        mov     dword [esp+18H], edi                    ; 159A _ 89. 7C 24, 18
        mov     dword [esp+14H], esi                    ; 159E _ 89. 74 24, 14
        mov     dword [esp+10H], ebx                    ; 15A2 _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 15A6 _ 89. 4C 24, 0C
        mov     dword [esp+8H], 7                       ; 15AA _ C7. 44 24, 08, 00000007
        mov     dword [esp+4H], edx                     ; 15B2 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 15B6 _ 89. 04 24
        call    paint_rectangle                         ; 15B9 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 15BE _ 8B. 45, F0
        lea     edi, [eax+2H]                           ; 15C1 _ 8D. 78, 02
        mov     eax, dword [ebp-14H]                    ; 15C4 _ 8B. 45, EC
        lea     esi, [eax+2H]                           ; 15C7 _ 8D. 70, 02
        mov     eax, dword [ebp+10H]                    ; 15CA _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 15CD _ 8D. 58, FD
        mov     eax, dword [ebp-14H]                    ; 15D0 _ 8B. 45, EC
        lea     ecx, [eax+2H]                           ; 15D3 _ 8D. 48, 02
        mov     eax, dword [ebp+8H]                     ; 15D6 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 15D9 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 15DC _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 15DF _ 8B. 00
        mov     dword [esp+18H], edi                    ; 15E1 _ 89. 7C 24, 18
        mov     dword [esp+14H], esi                    ; 15E5 _ 89. 74 24, 14
        mov     dword [esp+10H], ebx                    ; 15E9 _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 15ED _ 89. 4C 24, 0C
        mov     dword [esp+8H], 7                       ; 15F1 _ C7. 44 24, 08, 00000007
        mov     dword [esp+4H], edx                     ; 15F9 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 15FD _ 89. 04 24
        call    paint_rectangle                         ; 1600 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 1605 _ 8B. 45, 10
        lea     ecx, [eax-2H]                           ; 1608 _ 8D. 48, FE
        mov     eax, dword [ebp+10H]                    ; 160B _ 8B. 45, 10
        lea     esi, [eax-2H]                           ; 160E _ 8D. 70, FE
        mov     eax, dword [ebp+0CH]                    ; 1611 _ 8B. 45, 0C
        lea     ebx, [eax-1H]                           ; 1614 _ 8D. 58, FF
        mov     eax, dword [ebp+8H]                     ; 1617 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 161A _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 161D _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1620 _ 8B. 00
        mov     dword [esp+18H], ecx                    ; 1622 _ 89. 4C 24, 18
        mov     ecx, dword [ebp-14H]                    ; 1626 _ 8B. 4D, EC
        mov     dword [esp+14H], ecx                    ; 1629 _ 89. 4C 24, 14
        mov     dword [esp+10H], esi                    ; 162D _ 89. 74 24, 10
        mov     dword [esp+0CH], ebx                    ; 1631 _ 89. 5C 24, 0C
        mov     dword [esp+8H], 0                       ; 1635 _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], edx                     ; 163D _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1641 _ 89. 04 24
        call    paint_rectangle                         ; 1644 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+0CH]                    ; 1649 _ 8B. 45, 0C
        lea     edi, [eax-2H]                           ; 164C _ 8D. 78, FE
        mov     eax, dword [ebp+10H]                    ; 164F _ 8B. 45, 10
        lea     esi, [eax-2H]                           ; 1652 _ 8D. 70, FE
        mov     eax, dword [ebp+0CH]                    ; 1655 _ 8B. 45, 0C
        lea     ebx, [eax-2H]                           ; 1658 _ 8D. 58, FE
        mov     eax, dword [ebp+8H]                     ; 165B _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 165E _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1661 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1664 _ 8B. 00
        mov     ecx, dword [ebp-10H]                    ; 1666 _ 8B. 4D, F0
        mov     dword [esp+18H], ecx                    ; 1669 _ 89. 4C 24, 18
        mov     dword [esp+14H], edi                    ; 166D _ 89. 7C 24, 14
        mov     dword [esp+10H], esi                    ; 1671 _ 89. 74 24, 10
        mov     dword [esp+0CH], ebx                    ; 1675 _ 89. 5C 24, 0C
        mov     dword [esp+8H], 0                       ; 1679 _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], edx                     ; 1681 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1685 _ 89. 04 24
        call    paint_rectangle                         ; 1688 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 168D _ 8B. 45, F0
        lea     ecx, [eax+1H]                           ; 1690 _ 8D. 48, 01
        mov     eax, dword [ebp-10H]                    ; 1693 _ 8B. 45, F0
        lea     esi, [eax+1H]                           ; 1696 _ 8D. 70, 01
        mov     eax, dword [ebp+0CH]                    ; 1699 _ 8B. 45, 0C
        lea     ebx, [eax-2H]                           ; 169C _ 8D. 58, FE
        mov     eax, dword [ebp+8H]                     ; 169F _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 16A2 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 16A5 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 16A8 _ 8B. 00
        mov     dword [esp+18H], ecx                    ; 16AA _ 89. 4C 24, 18
        mov     ecx, dword [ebp-14H]                    ; 16AE _ 8B. 4D, EC
        mov     dword [esp+14H], ecx                    ; 16B1 _ 89. 4C 24, 14
        mov     dword [esp+10H], esi                    ; 16B5 _ 89. 74 24, 10
        mov     dword [esp+0CH], ebx                    ; 16B9 _ 89. 5C 24, 0C
        mov     dword [esp+8H], 8                       ; 16BD _ C7. 44 24, 08, 00000008
        mov     dword [esp+4H], edx                     ; 16C5 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 16C9 _ 89. 04 24
        call    paint_rectangle                         ; 16CC _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 16D1 _ 8B. 45, F0
        lea     edi, [eax+1H]                           ; 16D4 _ 8D. 78, 01
        mov     eax, dword [ebp-14H]                    ; 16D7 _ 8B. 45, EC
        lea     esi, [eax+1H]                           ; 16DA _ 8D. 70, 01
        mov     eax, dword [ebp+10H]                    ; 16DD _ 8B. 45, 10
        lea     ebx, [eax-2H]                           ; 16E0 _ 8D. 58, FE
        mov     eax, dword [ebp-14H]                    ; 16E3 _ 8B. 45, EC
        lea     ecx, [eax+1H]                           ; 16E6 _ 8D. 48, 01
        mov     eax, dword [ebp+8H]                     ; 16E9 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 16EC _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 16EF _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 16F2 _ 8B. 00
        mov     dword [esp+18H], edi                    ; 16F4 _ 89. 7C 24, 18
        mov     dword [esp+14H], esi                    ; 16F8 _ 89. 74 24, 14
        mov     dword [esp+10H], ebx                    ; 16FC _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 1700 _ 89. 4C 24, 0C
        mov     dword [esp+8H], 8                       ; 1704 _ C7. 44 24, 08, 00000008
        mov     dword [esp+4H], edx                     ; 170C _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1710 _ 89. 04 24
        call    paint_rectangle                         ; 1713 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 1718 _ 8B. 45, 10
        lea     edi, [eax-1H]                           ; 171B _ 8D. 78, FF
        mov     eax, dword [ebp+0CH]                    ; 171E _ 8B. 45, 0C
        lea     esi, [eax-1H]                           ; 1721 _ 8D. 70, FF
        mov     eax, dword [ebp+1CH]                    ; 1724 _ 8B. 45, 1C
        movzx   ecx, al                                 ; 1727 _ 0F B6. C8
        mov     eax, dword [ebp+8H]                     ; 172A _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 172D _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1730 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1733 _ 8B. 00
        mov     ebx, dword [ebp-10H]                    ; 1735 _ 8B. 5D, F0
        mov     dword [esp+18H], ebx                    ; 1738 _ 89. 5C 24, 18
        mov     ebx, dword [ebp-14H]                    ; 173C _ 8B. 5D, EC
        mov     dword [esp+14H], ebx                    ; 173F _ 89. 5C 24, 14
        mov     dword [esp+10H], edi                    ; 1743 _ 89. 7C 24, 10
        mov     dword [esp+0CH], esi                    ; 1747 _ 89. 74 24, 0C
        mov     dword [esp+8H], ecx                     ; 174B _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 174F _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1753 _ 89. 04 24
        call    paint_rectangle                         ; 1756 _ E8, FFFFFFFC(rel)
        add     esp, 44                                 ; 175B _ 83. C4, 2C
        pop     ebx                                     ; 175E _ 5B
        pop     esi                                     ; 175F _ 5E
        pop     edi                                     ; 1760 _ 5F
        pop     ebp                                     ; 1761 _ 5D
        ret                                             ; 1762 _ C3
; make_textbox End of function

make_windows:; Function begin
        push    ebp                                     ; 1763 _ 55
        mov     ebp, esp                                ; 1764 _ 89. E5
        push    ebx                                     ; 1766 _ 53
        sub     esp, 68                                 ; 1767 _ 83. EC, 44
        mov     eax, dword [ebp+0CH]                    ; 176A _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 176D _ 8B. 40, 04
        mov     dword [ebp-10H], eax                    ; 1770 _ 89. 45, F0
        mov     eax, dword [ebp+0CH]                    ; 1773 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 1776 _ 8B. 40, 08
        mov     dword [ebp-0CH], eax                    ; 1779 _ 89. 45, F4
        mov     eax, dword [ebp-10H]                    ; 177C _ 8B. 45, F0
        lea     edx, [eax-1H]                           ; 177F _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 1782 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1785 _ 8B. 00
        mov     dword [esp+18H], 0                      ; 1787 _ C7. 44 24, 18, 00000000
        mov     dword [esp+14H], edx                    ; 178F _ 89. 54 24, 14
        mov     dword [esp+10H], 0                      ; 1793 _ C7. 44 24, 10, 00000000
        mov     dword [esp+0CH], 0                      ; 179B _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 8                       ; 17A3 _ C7. 44 24, 08, 00000008
        mov     edx, dword [ebp-10H]                    ; 17AB _ 8B. 55, F0
        mov     dword [esp+4H], edx                     ; 17AE _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 17B2 _ 89. 04 24
        call    paint_rectangle                         ; 17B5 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 17BA _ 8B. 45, F0
        lea     edx, [eax-2H]                           ; 17BD _ 8D. 50, FE
        mov     eax, dword [ebp+0CH]                    ; 17C0 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 17C3 _ 8B. 00
        mov     dword [esp+18H], 1                      ; 17C5 _ C7. 44 24, 18, 00000001
        mov     dword [esp+14H], edx                    ; 17CD _ 89. 54 24, 14
        mov     dword [esp+10H], 1                      ; 17D1 _ C7. 44 24, 10, 00000001
        mov     dword [esp+0CH], 1                      ; 17D9 _ C7. 44 24, 0C, 00000001
        mov     dword [esp+8H], 7                       ; 17E1 _ C7. 44 24, 08, 00000007
        mov     edx, dword [ebp-10H]                    ; 17E9 _ 8B. 55, F0
        mov     dword [esp+4H], edx                     ; 17EC _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 17F0 _ 89. 04 24
        call    paint_rectangle                         ; 17F3 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 17F8 _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 17FB _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 17FE _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1801 _ 8B. 00
        mov     dword [esp+18H], edx                    ; 1803 _ 89. 54 24, 18
        mov     dword [esp+14H], 0                      ; 1807 _ C7. 44 24, 14, 00000000
        mov     dword [esp+10H], 0                      ; 180F _ C7. 44 24, 10, 00000000
        mov     dword [esp+0CH], 0                      ; 1817 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 8                       ; 181F _ C7. 44 24, 08, 00000008
        mov     edx, dword [ebp-10H]                    ; 1827 _ 8B. 55, F0
        mov     dword [esp+4H], edx                     ; 182A _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 182E _ 89. 04 24
        call    paint_rectangle                         ; 1831 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 1836 _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 1839 _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 183C _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 183F _ 8B. 00
        mov     dword [esp+18H], edx                    ; 1841 _ 89. 54 24, 18
        mov     dword [esp+14H], 1                      ; 1845 _ C7. 44 24, 14, 00000001
        mov     dword [esp+10H], 1                      ; 184D _ C7. 44 24, 10, 00000001
        mov     dword [esp+0CH], 1                      ; 1855 _ C7. 44 24, 0C, 00000001
        mov     dword [esp+8H], 7                       ; 185D _ C7. 44 24, 08, 00000007
        mov     edx, dword [ebp-10H]                    ; 1865 _ 8B. 55, F0
        mov     dword [esp+4H], edx                     ; 1868 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 186C _ 89. 04 24
        call    paint_rectangle                         ; 186F _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 1874 _ 8B. 45, F4
        lea     ebx, [eax-2H]                           ; 1877 _ 8D. 58, FE
        mov     eax, dword [ebp-10H]                    ; 187A _ 8B. 45, F0
        lea     ecx, [eax-2H]                           ; 187D _ 8D. 48, FE
        mov     eax, dword [ebp-10H]                    ; 1880 _ 8B. 45, F0
        lea     edx, [eax-2H]                           ; 1883 _ 8D. 50, FE
        mov     eax, dword [ebp+0CH]                    ; 1886 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1889 _ 8B. 00
        mov     dword [esp+18H], ebx                    ; 188B _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 188F _ 89. 4C 24, 14
        mov     dword [esp+10H], 1                      ; 1893 _ C7. 44 24, 10, 00000001
        mov     dword [esp+0CH], edx                    ; 189B _ 89. 54 24, 0C
        mov     dword [esp+8H], 15                      ; 189F _ C7. 44 24, 08, 0000000F
        mov     edx, dword [ebp-10H]                    ; 18A7 _ 8B. 55, F0
        mov     dword [esp+4H], edx                     ; 18AA _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 18AE _ 89. 04 24
        call    paint_rectangle                         ; 18B1 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 18B6 _ 8B. 45, F4
        lea     ebx, [eax-1H]                           ; 18B9 _ 8D. 58, FF
        mov     eax, dword [ebp-10H]                    ; 18BC _ 8B. 45, F0
        lea     ecx, [eax-1H]                           ; 18BF _ 8D. 48, FF
        mov     eax, dword [ebp-10H]                    ; 18C2 _ 8B. 45, F0
        lea     edx, [eax-1H]                           ; 18C5 _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 18C8 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 18CB _ 8B. 00
        mov     dword [esp+18H], ebx                    ; 18CD _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 18D1 _ 89. 4C 24, 14
        mov     dword [esp+10H], 0                      ; 18D5 _ C7. 44 24, 10, 00000000
        mov     dword [esp+0CH], edx                    ; 18DD _ 89. 54 24, 0C
        mov     dword [esp+8H], 0                       ; 18E1 _ C7. 44 24, 08, 00000000
        mov     edx, dword [ebp-10H]                    ; 18E9 _ 8B. 55, F0
        mov     dword [esp+4H], edx                     ; 18EC _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 18F0 _ 89. 04 24
        call    paint_rectangle                         ; 18F3 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 18F8 _ 8B. 45, F4
        lea     ecx, [eax-3H]                           ; 18FB _ 8D. 48, FD
        mov     eax, dword [ebp-10H]                    ; 18FE _ 8B. 45, F0
        lea     edx, [eax-3H]                           ; 1901 _ 8D. 50, FD
        mov     eax, dword [ebp+0CH]                    ; 1904 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1907 _ 8B. 00
        mov     dword [esp+18H], ecx                    ; 1909 _ 89. 4C 24, 18
        mov     dword [esp+14H], edx                    ; 190D _ 89. 54 24, 14
        mov     dword [esp+10H], 2                      ; 1911 _ C7. 44 24, 10, 00000002
        mov     dword [esp+0CH], 2                      ; 1919 _ C7. 44 24, 0C, 00000002
        mov     dword [esp+8H], 8                       ; 1921 _ C7. 44 24, 08, 00000008
        mov     edx, dword [ebp-10H]                    ; 1929 _ 8B. 55, F0
        mov     dword [esp+4H], edx                     ; 192C _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1930 _ 89. 04 24
        call    paint_rectangle                         ; 1933 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 1938 _ 8B. 45, F0
        lea     edx, [eax-4H]                           ; 193B _ 8D. 50, FC
        mov     eax, dword [ebp+0CH]                    ; 193E _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1941 _ 8B. 00
        mov     dword [esp+18H], 20                     ; 1943 _ C7. 44 24, 18, 00000014
        mov     dword [esp+14H], edx                    ; 194B _ 89. 54 24, 14
        mov     dword [esp+10H], 3                      ; 194F _ C7. 44 24, 10, 00000003
        mov     dword [esp+0CH], 3                      ; 1957 _ C7. 44 24, 0C, 00000003
        mov     dword [esp+8H], 12                      ; 195F _ C7. 44 24, 08, 0000000C
        mov     edx, dword [ebp-10H]                    ; 1967 _ 8B. 55, F0
        mov     dword [esp+4H], edx                     ; 196A _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 196E _ 89. 04 24
        call    paint_rectangle                         ; 1971 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 1976 _ 8B. 45, F4
        lea     ebx, [eax-2H]                           ; 1979 _ 8D. 58, FE
        mov     eax, dword [ebp-10H]                    ; 197C _ 8B. 45, F0
        lea     ecx, [eax-2H]                           ; 197F _ 8D. 48, FE
        mov     eax, dword [ebp-0CH]                    ; 1982 _ 8B. 45, F4
        lea     edx, [eax-2H]                           ; 1985 _ 8D. 50, FE
        mov     eax, dword [ebp+0CH]                    ; 1988 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 198B _ 8B. 00
        mov     dword [esp+18H], ebx                    ; 198D _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 1991 _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 1995 _ 89. 54 24, 10
        mov     dword [esp+0CH], 1                      ; 1999 _ C7. 44 24, 0C, 00000001
        mov     dword [esp+8H], 15                      ; 19A1 _ C7. 44 24, 08, 0000000F
        mov     edx, dword [ebp-10H]                    ; 19A9 _ 8B. 55, F0
        mov     dword [esp+4H], edx                     ; 19AC _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 19B0 _ 89. 04 24
        call    paint_rectangle                         ; 19B3 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 19B8 _ 8B. 45, F4
        lea     ebx, [eax-1H]                           ; 19BB _ 8D. 58, FF
        mov     eax, dword [ebp-10H]                    ; 19BE _ 8B. 45, F0
        lea     ecx, [eax-1H]                           ; 19C1 _ 8D. 48, FF
        mov     eax, dword [ebp-0CH]                    ; 19C4 _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 19C7 _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 19CA _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 19CD _ 8B. 00
        mov     dword [esp+18H], ebx                    ; 19CF _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 19D3 _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 19D7 _ 89. 54 24, 10
        mov     dword [esp+0CH], 0                      ; 19DB _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 0                       ; 19E3 _ C7. 44 24, 08, 00000000
        mov     edx, dword [ebp-10H]                    ; 19EB _ 8B. 55, F0
        mov     dword [esp+4H], edx                     ; 19EE _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 19F2 _ 89. 04 24
        call    paint_rectangle                         ; 19F5 _ E8, FFFFFFFC(rel)
        mov     dword [esp+14H], 7                      ; 19FA _ C7. 44 24, 14, 00000007
        mov     eax, dword [ebp+10H]                    ; 1A02 _ 8B. 45, 10
        mov     dword [esp+10H], eax                    ; 1A05 _ 89. 44 24, 10
        mov     dword [esp+0CH], 4                      ; 1A09 _ C7. 44 24, 0C, 00000004
        mov     dword [esp+8H], 24                      ; 1A11 _ C7. 44 24, 08, 00000018
        mov     eax, dword [ebp+0CH]                    ; 1A19 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 1A1C _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1A20 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1A23 _ 89. 04 24
        call    paint_string                            ; 1A26 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-14H], 0                      ; 1A2B _ C7. 45, EC, 00000000
        jmp     ?_052                                   ; 1A32 _ E9, 00000083

?_045:  mov     dword [ebp-18H], 0                      ; 1A37 _ C7. 45, E8, 00000000
        jmp     ?_051                                   ; 1A3E _ EB, 70

?_046:  mov     eax, dword [ebp-14H]                    ; 1A40 _ 8B. 45, EC
        shl     eax, 4                                  ; 1A43 _ C1. E0, 04
        mov     edx, eax                                ; 1A46 _ 89. C2
        mov     eax, dword [ebp-18H]                    ; 1A48 _ 8B. 45, E8
        add     eax, edx                                ; 1A4B _ 01. D0
        add     eax, closebtn.1767                      ; 1A4D _ 05, 000001C0(d)
        movzx   eax, byte [eax]                         ; 1A52 _ 0F B6. 00
        mov     byte [ebp-19H], al                      ; 1A55 _ 88. 45, E7
        cmp     byte [ebp-19H], 64                      ; 1A58 _ 80. 7D, E7, 40
        jnz     ?_047                                   ; 1A5C _ 75, 06
        mov     byte [ebp-19H], 0                       ; 1A5E _ C6. 45, E7, 00
        jmp     ?_050                                   ; 1A62 _ EB, 1C

?_047:  cmp     byte [ebp-19H], 36                      ; 1A64 _ 80. 7D, E7, 24
        jnz     ?_048                                   ; 1A68 _ 75, 06
        mov     byte [ebp-19H], 15                      ; 1A6A _ C6. 45, E7, 0F
        jmp     ?_050                                   ; 1A6E _ EB, 10

?_048:  cmp     byte [ebp-19H], 81                      ; 1A70 _ 80. 7D, E7, 51
        jnz     ?_049                                   ; 1A74 _ 75, 06
        mov     byte [ebp-19H], 8                       ; 1A76 _ C6. 45, E7, 08
        jmp     ?_050                                   ; 1A7A _ EB, 04

?_049:  mov     byte [ebp-19H], 7                       ; 1A7C _ C6. 45, E7, 07
?_050:  mov     eax, dword [ebp+0CH]                    ; 1A80 _ 8B. 45, 0C
        mov     edx, dword [eax]                        ; 1A83 _ 8B. 10
        mov     eax, dword [ebp-14H]                    ; 1A85 _ 8B. 45, EC
        lea     ecx, [eax+5H]                           ; 1A88 _ 8D. 48, 05
        mov     eax, dword [ebp+0CH]                    ; 1A8B _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 1A8E _ 8B. 40, 04
        imul    ecx, eax                                ; 1A91 _ 0F AF. C8
        mov     eax, dword [ebp+0CH]                    ; 1A94 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 1A97 _ 8B. 40, 04
        lea     ebx, [eax-15H]                          ; 1A9A _ 8D. 58, EB
        mov     eax, dword [ebp-18H]                    ; 1A9D _ 8B. 45, E8
        add     eax, ebx                                ; 1AA0 _ 01. D8
        add     eax, ecx                                ; 1AA2 _ 01. C8
        add     edx, eax                                ; 1AA4 _ 01. C2
        movzx   eax, byte [ebp-19H]                     ; 1AA6 _ 0F B6. 45, E7
        mov     byte [edx], al                          ; 1AAA _ 88. 02
        add     dword [ebp-18H], 1                      ; 1AAC _ 83. 45, E8, 01
?_051:  cmp     dword [ebp-18H], 15                     ; 1AB0 _ 83. 7D, E8, 0F
        jle     ?_046                                   ; 1AB4 _ 7E, 8A
        add     dword [ebp-14H], 1                      ; 1AB6 _ 83. 45, EC, 01
?_052:  cmp     dword [ebp-14H], 13                     ; 1ABA _ 83. 7D, EC, 0D
        jle     ?_045                                   ; 1ABE _ 0F 8E, FFFFFF73
        add     esp, 68                                 ; 1AC4 _ 83. C4, 44
        pop     ebx                                     ; 1AC7 _ 5B
        pop     ebp                                     ; 1AC8 _ 5D
        ret                                             ; 1AC9 _ C3
; make_windows End of function

wait_KBC_sendready:; Function begin
        push    ebp                                     ; 1ACA _ 55
        mov     ebp, esp                                ; 1ACB _ 89. E5
        sub     esp, 24                                 ; 1ACD _ 83. EC, 18
?_053:  mov     dword [esp], 100                        ; 1AD0 _ C7. 04 24, 00000064
        call    io_in8                                  ; 1AD7 _ E8, FFFFFFFC(rel)
        and     eax, 02H                                ; 1ADC _ 83. E0, 02
        test    eax, eax                                ; 1ADF _ 85. C0
        jnz     ?_054                                   ; 1AE1 _ 75, 02
        jmp     ?_055                                   ; 1AE3 _ EB, 02

?_054:  jmp     ?_053                                   ; 1AE5 _ EB, E9

?_055:  leave                                           ; 1AE7 _ C9
        ret                                             ; 1AE8 _ C3
; wait_KBC_sendready End of function

init_keyboard:; Function begin
        push    ebp                                     ; 1AE9 _ 55
        mov     ebp, esp                                ; 1AEA _ 89. E5
        sub     esp, 24                                 ; 1AEC _ 83. EC, 18
        call    wait_KBC_sendready                      ; 1AEF _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 96                      ; 1AF4 _ C7. 44 24, 04, 00000060
        mov     dword [esp], 100                        ; 1AFC _ C7. 04 24, 00000064
        call    io_out8                                 ; 1B03 _ E8, FFFFFFFC(rel)
        call    wait_KBC_sendready                      ; 1B08 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 71                      ; 1B0D _ C7. 44 24, 04, 00000047
        mov     dword [esp], 96                         ; 1B15 _ C7. 04 24, 00000060
        call    io_out8                                 ; 1B1C _ E8, FFFFFFFC(rel)
        leave                                           ; 1B21 _ C9
        ret                                             ; 1B22 _ C3
; init_keyboard End of function

enable_mouse:; Function begin
        push    ebp                                     ; 1B23 _ 55
        mov     ebp, esp                                ; 1B24 _ 89. E5
        sub     esp, 24                                 ; 1B26 _ 83. EC, 18
        call    wait_KBC_sendready                      ; 1B29 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 212                     ; 1B2E _ C7. 44 24, 04, 000000D4
        mov     dword [esp], 100                        ; 1B36 _ C7. 04 24, 00000064
        call    io_out8                                 ; 1B3D _ E8, FFFFFFFC(rel)
        call    wait_KBC_sendready                      ; 1B42 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 244                     ; 1B47 _ C7. 44 24, 04, 000000F4
        mov     dword [esp], 96                         ; 1B4F _ C7. 04 24, 00000060
        call    io_out8                                 ; 1B56 _ E8, FFFFFFFC(rel)
        leave                                           ; 1B5B _ C9
        ret                                             ; 1B5C _ C3
; enable_mouse End of function

mouse_decode:; Function begin
        push    ebp                                     ; 1B5D _ 55
        mov     ebp, esp                                ; 1B5E _ 89. E5
        sub     esp, 4                                  ; 1B60 _ 83. EC, 04
        mov     eax, dword [ebp+0CH]                    ; 1B63 _ 8B. 45, 0C
        mov     byte [ebp-4H], al                       ; 1B66 _ 88. 45, FC
        mov     eax, dword [ebp+8H]                     ; 1B69 _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 1B6C _ 0F B6. 40, 03
        test    al, al                                  ; 1B70 _ 84. C0
        jnz     ?_057                                   ; 1B72 _ 75, 17
        cmp     byte [ebp-4H], -6                       ; 1B74 _ 80. 7D, FC, FA
        jnz     ?_056                                   ; 1B78 _ 75, 07
        mov     eax, dword [ebp+8H]                     ; 1B7A _ 8B. 45, 08
        mov     byte [eax+3H], 1                        ; 1B7D _ C6. 40, 03, 01
?_056:  mov     eax, 0                                  ; 1B81 _ B8, 00000000
        jmp     ?_064                                   ; 1B86 _ E9, 0000010F

?_057:  mov     eax, dword [ebp+8H]                     ; 1B8B _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 1B8E _ 0F B6. 40, 03
        cmp     al, 1                                   ; 1B92 _ 3C, 01
        jnz     ?_059                                   ; 1B94 _ 75, 28
        movzx   eax, byte [ebp-4H]                      ; 1B96 _ 0F B6. 45, FC
        and     eax, 0C8H                               ; 1B9A _ 25, 000000C8
        cmp     eax, 8                                  ; 1B9F _ 83. F8, 08
        jnz     ?_058                                   ; 1BA2 _ 75, 10
        mov     eax, dword [ebp+8H]                     ; 1BA4 _ 8B. 45, 08
        movzx   edx, byte [ebp-4H]                      ; 1BA7 _ 0F B6. 55, FC
        mov     byte [eax], dl                          ; 1BAB _ 88. 10
        mov     eax, dword [ebp+8H]                     ; 1BAD _ 8B. 45, 08
        mov     byte [eax+3H], 2                        ; 1BB0 _ C6. 40, 03, 02
?_058:  mov     eax, 0                                  ; 1BB4 _ B8, 00000000
        jmp     ?_064                                   ; 1BB9 _ E9, 000000DC

?_059:  mov     eax, dword [ebp+8H]                     ; 1BBE _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 1BC1 _ 0F B6. 40, 03
        cmp     al, 2                                   ; 1BC5 _ 3C, 02
        jnz     ?_060                                   ; 1BC7 _ 75, 1B
        mov     eax, dword [ebp+8H]                     ; 1BC9 _ 8B. 45, 08
        movzx   edx, byte [ebp-4H]                      ; 1BCC _ 0F B6. 55, FC
        mov     byte [eax+1H], dl                       ; 1BD0 _ 88. 50, 01
        mov     eax, dword [ebp+8H]                     ; 1BD3 _ 8B. 45, 08
        mov     byte [eax+3H], 3                        ; 1BD6 _ C6. 40, 03, 03
        mov     eax, 0                                  ; 1BDA _ B8, 00000000
        jmp     ?_064                                   ; 1BDF _ E9, 000000B6

?_060:  mov     eax, dword [ebp+8H]                     ; 1BE4 _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 1BE7 _ 0F B6. 40, 03
        cmp     al, 3                                   ; 1BEB _ 3C, 03
        jne     ?_063                                   ; 1BED _ 0F 85, 000000A2
        mov     eax, dword [ebp+8H]                     ; 1BF3 _ 8B. 45, 08
        movzx   edx, byte [ebp-4H]                      ; 1BF6 _ 0F B6. 55, FC
        mov     byte [eax+2H], dl                       ; 1BFA _ 88. 50, 02
        mov     eax, dword [ebp+8H]                     ; 1BFD _ 8B. 45, 08
        mov     byte [eax+3H], 1                        ; 1C00 _ C6. 40, 03, 01
        mov     eax, dword [ebp+8H]                     ; 1C04 _ 8B. 45, 08
        movzx   eax, byte [eax]                         ; 1C07 _ 0F B6. 00
        movzx   eax, al                                 ; 1C0A _ 0F B6. C0
        and     eax, 07H                                ; 1C0D _ 83. E0, 07
        mov     edx, eax                                ; 1C10 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 1C12 _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 1C15 _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 1C18 _ 8B. 45, 08
        movzx   eax, byte [eax+1H]                      ; 1C1B _ 0F B6. 40, 01
        movzx   edx, al                                 ; 1C1F _ 0F B6. D0
        mov     eax, dword [ebp+8H]                     ; 1C22 _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 1C25 _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1C28 _ 8B. 45, 08
        movzx   eax, byte [eax+2H]                      ; 1C2B _ 0F B6. 40, 02
        movzx   edx, al                                 ; 1C2F _ 0F B6. D0
        mov     eax, dword [ebp+8H]                     ; 1C32 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 1C35 _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 1C38 _ 8B. 45, 08
        movzx   eax, byte [eax]                         ; 1C3B _ 0F B6. 00
        movzx   eax, al                                 ; 1C3E _ 0F B6. C0
        and     eax, 10H                                ; 1C41 _ 83. E0, 10
        test    eax, eax                                ; 1C44 _ 85. C0
        jz      ?_061                                   ; 1C46 _ 74, 13
        mov     eax, dword [ebp+8H]                     ; 1C48 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 1C4B _ 8B. 40, 04
        or      eax, 0FFFFFF00H                         ; 1C4E _ 0D, FFFFFF00
        mov     edx, eax                                ; 1C53 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 1C55 _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 1C58 _ 89. 50, 04
?_061:  mov     eax, dword [ebp+8H]                     ; 1C5B _ 8B. 45, 08
        movzx   eax, byte [eax]                         ; 1C5E _ 0F B6. 00
        movzx   eax, al                                 ; 1C61 _ 0F B6. C0
        and     eax, 20H                                ; 1C64 _ 83. E0, 20
        test    eax, eax                                ; 1C67 _ 85. C0
        jz      ?_062                                   ; 1C69 _ 74, 13
        mov     eax, dword [ebp+8H]                     ; 1C6B _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 1C6E _ 8B. 40, 08
        or      eax, 0FFFFFF00H                         ; 1C71 _ 0D, FFFFFF00
        mov     edx, eax                                ; 1C76 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 1C78 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 1C7B _ 89. 50, 08
?_062:  mov     eax, dword [ebp+8H]                     ; 1C7E _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 1C81 _ 8B. 40, 08
        neg     eax                                     ; 1C84 _ F7. D8
        mov     edx, eax                                ; 1C86 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 1C88 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 1C8B _ 89. 50, 08
        mov     eax, 1                                  ; 1C8E _ B8, 00000001
        jmp     ?_064                                   ; 1C93 _ EB, 05

?_063:  mov     eax, 4294967295                         ; 1C95 _ B8, FFFFFFFF
?_064:  leave                                           ; 1C9A _ C9
        ret                                             ; 1C9B _ C3
; mouse_decode End of function

intHandlerKeyboard:; Function begin
        push    ebp                                     ; 1C9C _ 55
        mov     ebp, esp                                ; 1C9D _ 89. E5
        sub     esp, 40                                 ; 1C9F _ 83. EC, 28
        mov     dword [esp+4H], 32                      ; 1CA2 _ C7. 44 24, 04, 00000020
        mov     dword [esp], 32                         ; 1CAA _ C7. 04 24, 00000020
        call    io_out8                                 ; 1CB1 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 32                      ; 1CB6 _ C7. 44 24, 04, 00000020
        mov     dword [esp], 160                        ; 1CBE _ C7. 04 24, 000000A0
        call    io_out8                                 ; 1CC5 _ E8, FFFFFFFC(rel)
        mov     dword [esp], 96                         ; 1CCA _ C7. 04 24, 00000060
        call    io_in8                                  ; 1CD1 _ E8, FFFFFFFC(rel)
        mov     byte [ebp-9H], al                       ; 1CD6 _ 88. 45, F7
        movzx   eax, byte [ebp-9H]                      ; 1CD9 _ 0F B6. 45, F7
        mov     dword [esp+4H], eax                     ; 1CDD _ 89. 44 24, 04
        mov     dword [esp], keyinfo                    ; 1CE1 _ C7. 04 24, 00000000(d)
        call    fifo8_put                               ; 1CE8 _ E8, FFFFFFFC(rel)
        leave                                           ; 1CED _ C9
        ret                                             ; 1CEE _ C3
; intHandlerKeyboard End of function

intHandlerMouse:; Function begin
        push    ebp                                     ; 1CEF _ 55
        mov     ebp, esp                                ; 1CF0 _ 89. E5
        sub     esp, 40                                 ; 1CF2 _ 83. EC, 28
        mov     dword [esp+4H], 32                      ; 1CF5 _ C7. 44 24, 04, 00000020
        mov     dword [esp], 32                         ; 1CFD _ C7. 04 24, 00000020
        call    io_out8                                 ; 1D04 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 32                      ; 1D09 _ C7. 44 24, 04, 00000020
        mov     dword [esp], 160                        ; 1D11 _ C7. 04 24, 000000A0
        call    io_out8                                 ; 1D18 _ E8, FFFFFFFC(rel)
        mov     dword [esp], 96                         ; 1D1D _ C7. 04 24, 00000060
        call    io_in8                                  ; 1D24 _ E8, FFFFFFFC(rel)
        mov     byte [ebp-9H], al                       ; 1D29 _ 88. 45, F7
        movzx   eax, byte [ebp-9H]                      ; 1D2C _ 0F B6. 45, F7
        mov     dword [esp+4H], eax                     ; 1D30 _ 89. 44 24, 04
        mov     dword [esp], mouseinfo                  ; 1D34 _ C7. 04 24, 00000000(d)
        call    fifo8_put                               ; 1D3B _ E8, FFFFFFFC(rel)
        leave                                           ; 1D40 _ C9
        ret                                             ; 1D41 _ C3
; intHandlerMouse End of function

fifo8_init:; Function begin
        push    ebp                                     ; 1D42 _ 55
        mov     ebp, esp                                ; 1D43 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 1D45 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 1D48 _ 8B. 55, 10
        mov     dword [eax], edx                        ; 1D4B _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 1D4D _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 1D50 _ C7. 40, 04, 00000000
        mov     eax, dword [ebp+8H]                     ; 1D57 _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 1D5A _ C7. 40, 08, 00000000
        mov     eax, dword [ebp+8H]                     ; 1D61 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 1D64 _ 8B. 55, 0C
        mov     dword [eax+0CH], edx                    ; 1D67 _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 1D6A _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 1D6D _ 8B. 55, 0C
        mov     dword [eax+10H], edx                    ; 1D70 _ 89. 50, 10
        mov     eax, dword [ebp+8H]                     ; 1D73 _ 8B. 45, 08
        mov     dword [eax+14H], 0                      ; 1D76 _ C7. 40, 14, 00000000
        pop     ebp                                     ; 1D7D _ 5D
        ret                                             ; 1D7E _ C3
; fifo8_init End of function

fifo8_put:; Function begin
        push    ebp                                     ; 1D7F _ 55
        mov     ebp, esp                                ; 1D80 _ 89. E5
        sub     esp, 20                                 ; 1D82 _ 83. EC, 14
        mov     eax, dword [ebp+0CH]                    ; 1D85 _ 8B. 45, 0C
        mov     byte [ebp-14H], al                      ; 1D88 _ 88. 45, EC
        mov     eax, dword [ebp+8H]                     ; 1D8B _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 1D8E _ 8B. 40, 10
        test    eax, eax                                ; 1D91 _ 85. C0
        jnz     ?_065                                   ; 1D93 _ 75, 18
        mov     eax, dword [ebp+8H]                     ; 1D95 _ 8B. 45, 08
        mov     eax, dword [eax+14H]                    ; 1D98 _ 8B. 40, 14
        or      eax, 01H                                ; 1D9B _ 83. C8, 01
        mov     edx, eax                                ; 1D9E _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 1DA0 _ 8B. 45, 08
        mov     dword [eax+14H], edx                    ; 1DA3 _ 89. 50, 14
        mov     eax, 4294967295                         ; 1DA6 _ B8, FFFFFFFF
        jmp     ?_067                                   ; 1DAB _ EB, 56

?_065:  mov     eax, dword [ebp+8H]                     ; 1DAD _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 1DB0 _ 8B. 40, 04
        mov     dword [ebp-4H], eax                     ; 1DB3 _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 1DB6 _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 1DB9 _ 8B. 10
        mov     eax, dword [ebp-4H]                     ; 1DBB _ 8B. 45, FC
        add     edx, eax                                ; 1DBE _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 1DC0 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 1DC4 _ 88. 02
        mov     eax, dword [ebp+8H]                     ; 1DC6 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 1DC9 _ 8B. 40, 04
        lea     edx, [eax+1H]                           ; 1DCC _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 1DCF _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 1DD2 _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1DD5 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 1DD8 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1DDB _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 1DDE _ 8B. 40, 0C
        cmp     edx, eax                                ; 1DE1 _ 39. C2
        jnz     ?_066                                   ; 1DE3 _ 75, 0A
        mov     eax, dword [ebp+8H]                     ; 1DE5 _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 1DE8 _ C7. 40, 04, 00000000
?_066:  mov     eax, dword [ebp+8H]                     ; 1DEF _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 1DF2 _ 8B. 40, 10
        lea     edx, [eax-1H]                           ; 1DF5 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 1DF8 _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 1DFB _ 89. 50, 10
        mov     eax, 0                                  ; 1DFE _ B8, 00000000
?_067:  leave                                           ; 1E03 _ C9
        ret                                             ; 1E04 _ C3
; fifo8_put End of function

fifo8_get:; Function begin
        push    ebp                                     ; 1E05 _ 55
        mov     ebp, esp                                ; 1E06 _ 89. E5
        sub     esp, 16                                 ; 1E08 _ 83. EC, 10
        mov     eax, dword [ebp+8H]                     ; 1E0B _ 8B. 45, 08
        mov     edx, dword [eax+10H]                    ; 1E0E _ 8B. 50, 10
        mov     eax, dword [ebp+8H]                     ; 1E11 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 1E14 _ 8B. 40, 0C
        cmp     edx, eax                                ; 1E17 _ 39. C2
        jnz     ?_068                                   ; 1E19 _ 75, 11
        mov     eax, dword [ebp+8H]                     ; 1E1B _ 8B. 45, 08
        mov     dword [eax+14H], 0                      ; 1E1E _ C7. 40, 14, 00000000
        mov     eax, 4294967295                         ; 1E25 _ B8, FFFFFFFF
        jmp     ?_070                                   ; 1E2A _ EB, 57

?_068:  mov     eax, dword [ebp+8H]                     ; 1E2C _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 1E2F _ 8B. 40, 08
        mov     dword [ebp-8H], eax                     ; 1E32 _ 89. 45, F8
        mov     eax, dword [ebp+8H]                     ; 1E35 _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 1E38 _ 8B. 10
        mov     eax, dword [ebp-8H]                     ; 1E3A _ 8B. 45, F8
        add     eax, edx                                ; 1E3D _ 01. D0
        movzx   eax, byte [eax]                         ; 1E3F _ 0F B6. 00
        movzx   eax, al                                 ; 1E42 _ 0F B6. C0
        mov     dword [ebp-4H], eax                     ; 1E45 _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 1E48 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 1E4B _ 8B. 40, 08
        lea     edx, [eax+1H]                           ; 1E4E _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 1E51 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 1E54 _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 1E57 _ 8B. 45, 08
        mov     edx, dword [eax+8H]                     ; 1E5A _ 8B. 50, 08
        mov     eax, dword [ebp+8H]                     ; 1E5D _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 1E60 _ 8B. 40, 0C
        cmp     edx, eax                                ; 1E63 _ 39. C2
        jnz     ?_069                                   ; 1E65 _ 75, 0A
        mov     eax, dword [ebp+8H]                     ; 1E67 _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 1E6A _ C7. 40, 08, 00000000
?_069:  mov     eax, dword [ebp+8H]                     ; 1E71 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 1E74 _ 8B. 40, 10
        lea     edx, [eax+1H]                           ; 1E77 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 1E7A _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 1E7D _ 89. 50, 10
        mov     eax, dword [ebp-4H]                     ; 1E80 _ 8B. 45, FC
?_070:  leave                                           ; 1E83 _ C9
        ret                                             ; 1E84 _ C3
; fifo8_get End of function

fifo8_status:; Function begin
        push    ebp                                     ; 1E85 _ 55
        mov     ebp, esp                                ; 1E86 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 1E88 _ 8B. 45, 08
        mov     edx, dword [eax+0CH]                    ; 1E8B _ 8B. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 1E8E _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 1E91 _ 8B. 40, 10
        sub     edx, eax                                ; 1E94 _ 29. C2
        mov     eax, edx                                ; 1E96 _ 89. D0
        pop     ebp                                     ; 1E98 _ 5D
        ret                                             ; 1E99 _ C3
; fifo8_status End of function

charToHexVal:; Function begin
        push    ebp                                     ; 1E9A _ 55
        mov     ebp, esp                                ; 1E9B _ 89. E5
        sub     esp, 4                                  ; 1E9D _ 83. EC, 04
        mov     eax, dword [ebp+8H]                     ; 1EA0 _ 8B. 45, 08
        mov     byte [ebp-4H], al                       ; 1EA3 _ 88. 45, FC
        cmp     byte [ebp-4H], 9                        ; 1EA6 _ 80. 7D, FC, 09
        jle     ?_071                                   ; 1EAA _ 7E, 09
        movzx   eax, byte [ebp-4H]                      ; 1EAC _ 0F B6. 45, FC
        add     eax, 55                                 ; 1EB0 _ 83. C0, 37
        jmp     ?_072                                   ; 1EB3 _ EB, 07

?_071:  movzx   eax, byte [ebp-4H]                      ; 1EB5 _ 0F B6. 45, FC
        add     eax, 48                                 ; 1EB9 _ 83. C0, 30
?_072:  leave                                           ; 1EBC _ C9
        ret                                             ; 1EBD _ C3
; charToHexVal End of function

charToHexStr:; Function begin
        push    ebp                                     ; 1EBE _ 55
        mov     ebp, esp                                ; 1EBF _ 89. E5
        sub     esp, 24                                 ; 1EC1 _ 83. EC, 18
        mov     eax, dword [ebp+8H]                     ; 1EC4 _ 8B. 45, 08
        mov     byte [ebp-14H], al                      ; 1EC7 _ 88. 45, EC
        mov     dword [ebp-4H], 0                       ; 1ECA _ C7. 45, FC, 00000000
        movzx   eax, byte [ebp-14H]                     ; 1ED1 _ 0F B6. 45, EC
        and     eax, 0FH                                ; 1ED5 _ 83. E0, 0F
        mov     byte [ebp-5H], al                       ; 1ED8 _ 88. 45, FB
        movsx   eax, byte [ebp-5H]                      ; 1EDB _ 0F BE. 45, FB
        mov     dword [esp], eax                        ; 1EDF _ 89. 04 24
        call    charToHexVal                            ; 1EE2 _ E8, FFFFFFFC(rel)
        mov     byte [?_170], al                        ; 1EE7 _ A2, 000002A3(d)
        movzx   eax, byte [ebp-14H]                     ; 1EEC _ 0F B6. 45, EC
        shr     al, 4                                   ; 1EF0 _ C0. E8, 04
        mov     byte [ebp-14H], al                      ; 1EF3 _ 88. 45, EC
        movzx   eax, byte [ebp-14H]                     ; 1EF6 _ 0F B6. 45, EC
        movsx   eax, al                                 ; 1EFA _ 0F BE. C0
        mov     dword [esp], eax                        ; 1EFD _ 89. 04 24
        call    charToHexVal                            ; 1F00 _ E8, FFFFFFFC(rel)
        mov     byte [?_169], al                        ; 1F05 _ A2, 000002A2(d)
        mov     eax, keyval                             ; 1F0A _ B8, 000002A0(d)
        leave                                           ; 1F0F _ C9
        ret                                             ; 1F10 _ C3
; charToHexStr End of function

intToHexStr:; Function begin
        push    ebp                                     ; 1F11 _ 55
        mov     ebp, esp                                ; 1F12 _ 89. E5
        sub     esp, 16                                 ; 1F14 _ 83. EC, 10
        mov     byte [str.1386], 48                     ; 1F17 _ C6. 05, 00000280(d), 30
        mov     byte [?_173], 88                        ; 1F1E _ C6. 05, 00000281(d), 58
        mov     byte [?_174], 0                         ; 1F25 _ C6. 05, 0000028A(d), 00
        mov     dword [ebp-0CH], 2                      ; 1F2C _ C7. 45, F4, 00000002
        jmp     ?_074                                   ; 1F33 _ EB, 0F

?_073:  mov     eax, dword [ebp-0CH]                    ; 1F35 _ 8B. 45, F4
        add     eax, str.1386                           ; 1F38 _ 05, 00000280(d)
        mov     byte [eax], 48                          ; 1F3D _ C6. 00, 30
        add     dword [ebp-0CH], 1                      ; 1F40 _ 83. 45, F4, 01
?_074:  cmp     dword [ebp-0CH], 9                      ; 1F44 _ 83. 7D, F4, 09
        jle     ?_073                                   ; 1F48 _ 7E, EB
        mov     dword [ebp-8H], 9                       ; 1F4A _ C7. 45, F8, 00000009
        jmp     ?_078                                   ; 1F51 _ EB, 40

?_075:  mov     eax, dword [ebp+8H]                     ; 1F53 _ 8B. 45, 08
        and     eax, 0FH                                ; 1F56 _ 83. E0, 0F
        mov     dword [ebp-4H], eax                     ; 1F59 _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 1F5C _ 8B. 45, 08
        shr     eax, 4                                  ; 1F5F _ C1. E8, 04
        mov     dword [ebp+8H], eax                     ; 1F62 _ 89. 45, 08
        cmp     dword [ebp-4H], 9                       ; 1F65 _ 83. 7D, FC, 09
        jle     ?_076                                   ; 1F69 _ 7E, 13
        mov     eax, dword [ebp-4H]                     ; 1F6B _ 8B. 45, FC
        add     eax, 55                                 ; 1F6E _ 83. C0, 37
        mov     edx, dword [ebp-8H]                     ; 1F71 _ 8B. 55, F8
        add     edx, str.1386                           ; 1F74 _ 81. C2, 00000280(d)
        mov     byte [edx], al                          ; 1F7A _ 88. 02
        jmp     ?_077                                   ; 1F7C _ EB, 11

?_076:  mov     eax, dword [ebp-4H]                     ; 1F7E _ 8B. 45, FC
        add     eax, 48                                 ; 1F81 _ 83. C0, 30
        mov     edx, dword [ebp-8H]                     ; 1F84 _ 8B. 55, F8
        add     edx, str.1386                           ; 1F87 _ 81. C2, 00000280(d)
        mov     byte [edx], al                          ; 1F8D _ 88. 02
?_077:  sub     dword [ebp-8H], 1                       ; 1F8F _ 83. 6D, F8, 01
?_078:  cmp     dword [ebp-8H], 1                       ; 1F93 _ 83. 7D, F8, 01
        jle     ?_079                                   ; 1F97 _ 7E, 06
        cmp     dword [ebp+8H], 0                       ; 1F99 _ 83. 7D, 08, 00
        jnz     ?_075                                   ; 1F9D _ 75, B4
?_079:  mov     eax, str.1386                           ; 1F9F _ B8, 00000280(d)
        leave                                           ; 1FA4 _ C9
        ret                                             ; 1FA5 _ C3
; intToHexStr End of function

memman_init:; Function begin
        push    ebp                                     ; 1FA6 _ 55
        mov     ebp, esp                                ; 1FA7 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 1FA9 _ 8B. 45, 08
        mov     dword [eax], 0                          ; 1FAC _ C7. 00, 00000000
        mov     eax, dword [ebp+8H]                     ; 1FB2 _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 1FB5 _ C7. 40, 04, 00000000
        mov     eax, dword [ebp+8H]                     ; 1FBC _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 1FBF _ C7. 40, 08, 00000000
        mov     eax, dword [ebp+8H]                     ; 1FC6 _ 8B. 45, 08
        mov     dword [eax+0CH], 0                      ; 1FC9 _ C7. 40, 0C, 00000000
        pop     ebp                                     ; 1FD0 _ 5D
        ret                                             ; 1FD1 _ C3
; memman_init End of function

memman_total:; Function begin
        push    ebp                                     ; 1FD2 _ 55
        mov     ebp, esp                                ; 1FD3 _ 89. E5
        sub     esp, 16                                 ; 1FD5 _ 83. EC, 10
        mov     dword [ebp-4H], 0                       ; 1FD8 _ C7. 45, FC, 00000000
        mov     dword [ebp-8H], 0                       ; 1FDF _ C7. 45, F8, 00000000
        jmp     ?_081                                   ; 1FE6 _ EB, 14

?_080:  mov     eax, dword [ebp+8H]                     ; 1FE8 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 1FEB _ 8B. 55, F8
        add     edx, 2                                  ; 1FEE _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 1FF1 _ 8B. 44 D0, 04
        add     dword [ebp-4H], eax                     ; 1FF5 _ 01. 45, FC
        add     dword [ebp-8H], 1                       ; 1FF8 _ 83. 45, F8, 01
?_081:  mov     eax, dword [ebp+8H]                     ; 1FFC _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1FFF _ 8B. 00
        cmp     eax, dword [ebp-8H]                     ; 2001 _ 3B. 45, F8
        ja      ?_080                                   ; 2004 _ 77, E2
        mov     eax, dword [ebp-4H]                     ; 2006 _ 8B. 45, FC
        leave                                           ; 2009 _ C9
        ret                                             ; 200A _ C3
; memman_total End of function

memman_alloc:; Function begin
        push    ebp                                     ; 200B _ 55
        mov     ebp, esp                                ; 200C _ 89. E5
        sub     esp, 16                                 ; 200E _ 83. EC, 10
        mov     dword [ebp-8H], 0                       ; 2011 _ C7. 45, F8, 00000000
        jmp     ?_085                                   ; 2018 _ E9, 00000085

?_082:  mov     eax, dword [ebp+8H]                     ; 201D _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 2020 _ 8B. 55, F8
        add     edx, 2                                  ; 2023 _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 2026 _ 8B. 44 D0, 04
        cmp     eax, dword [ebp+0CH]                    ; 202A _ 3B. 45, 0C
        jc      ?_084                                   ; 202D _ 72, 6F
        mov     eax, dword [ebp+8H]                     ; 202F _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 2032 _ 8B. 55, F8
        add     edx, 2                                  ; 2035 _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 2038 _ 8B. 04 D0
        mov     dword [ebp-4H], eax                     ; 203B _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 203E _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 2041 _ 8B. 55, F8
        add     edx, 2                                  ; 2044 _ 83. C2, 02
        mov     edx, dword [eax+edx*8]                  ; 2047 _ 8B. 14 D0
        mov     eax, dword [ebp+0CH]                    ; 204A _ 8B. 45, 0C
        lea     ecx, [edx+eax]                          ; 204D _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 2050 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 2053 _ 8B. 55, F8
        add     edx, 2                                  ; 2056 _ 83. C2, 02
        mov     dword [eax+edx*8], ecx                  ; 2059 _ 89. 0C D0
        mov     eax, dword [ebp+8H]                     ; 205C _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 205F _ 8B. 55, F8
        add     edx, 2                                  ; 2062 _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 2065 _ 8B. 44 D0, 04
        sub     eax, dword [ebp+0CH]                    ; 2069 _ 2B. 45, 0C
        mov     edx, eax                                ; 206C _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 206E _ 8B. 45, 08
        mov     ecx, dword [ebp-8H]                     ; 2071 _ 8B. 4D, F8
        add     ecx, 2                                  ; 2074 _ 83. C1, 02
        mov     dword [eax+ecx*8+4H], edx               ; 2077 _ 89. 54 C8, 04
        mov     eax, dword [ebp+8H]                     ; 207B _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 207E _ 8B. 55, F8
        add     edx, 2                                  ; 2081 _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 2084 _ 8B. 44 D0, 04
        test    eax, eax                                ; 2088 _ 85. C0
        jnz     ?_083                                   ; 208A _ 75, 0D
        mov     eax, dword [ebp+8H]                     ; 208C _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 208F _ 8B. 00
        lea     edx, [eax-1H]                           ; 2091 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 2094 _ 8B. 45, 08
        mov     dword [eax], edx                        ; 2097 _ 89. 10
?_083:  mov     eax, dword [ebp-4H]                     ; 2099 _ 8B. 45, FC
        jmp     ?_086                                   ; 209C _ EB, 17

?_084:  add     dword [ebp-8H], 1                       ; 209E _ 83. 45, F8, 01
?_085:  mov     eax, dword [ebp+8H]                     ; 20A2 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 20A5 _ 8B. 00
        cmp     eax, dword [ebp-8H]                     ; 20A7 _ 3B. 45, F8
        ja      ?_082                                   ; 20AA _ 0F 87, FFFFFF6D
        mov     eax, 0                                  ; 20B0 _ B8, 00000000
?_086:  leave                                           ; 20B5 _ C9
        ret                                             ; 20B6 _ C3
; memman_alloc End of function

memman_free:; Function begin
        push    ebp                                     ; 20B7 _ 55
        mov     ebp, esp                                ; 20B8 _ 89. E5
        push    ebx                                     ; 20BA _ 53
        sub     esp, 16                                 ; 20BB _ 83. EC, 10
        mov     dword [ebp-0CH], 0                      ; 20BE _ C7. 45, F4, 00000000
        jmp     ?_089                                   ; 20C5 _ EB, 17

?_087:  mov     eax, dword [ebp+8H]                     ; 20C7 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 20CA _ 8B. 55, F4
        add     edx, 2                                  ; 20CD _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 20D0 _ 8B. 04 D0
        cmp     eax, dword [ebp+0CH]                    ; 20D3 _ 3B. 45, 0C
        jbe     ?_088                                   ; 20D6 _ 76, 02
        jmp     ?_090                                   ; 20D8 _ EB, 0E

?_088:  add     dword [ebp-0CH], 1                      ; 20DA _ 83. 45, F4, 01
?_089:  mov     eax, dword [ebp+8H]                     ; 20DE _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 20E1 _ 8B. 00
        cmp     eax, dword [ebp-0CH]                    ; 20E3 _ 3B. 45, F4
        jg      ?_087                                   ; 20E6 _ 7F, DF
?_090:  cmp     dword [ebp-0CH], 0                      ; 20E8 _ 83. 7D, F4, 00
        jle     ?_092                                   ; 20EC _ 0F 8E, 000000BA
        mov     eax, dword [ebp-0CH]                    ; 20F2 _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 20F5 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 20F8 _ 8B. 45, 08
        add     edx, 2                                  ; 20FB _ 83. C2, 02
        mov     edx, dword [eax+edx*8]                  ; 20FE _ 8B. 14 D0
        mov     eax, dword [ebp-0CH]                    ; 2101 _ 8B. 45, F4
        lea     ecx, [eax-1H]                           ; 2104 _ 8D. 48, FF
        mov     eax, dword [ebp+8H]                     ; 2107 _ 8B. 45, 08
        add     ecx, 2                                  ; 210A _ 83. C1, 02
        mov     eax, dword [eax+ecx*8+4H]               ; 210D _ 8B. 44 C8, 04
        add     eax, edx                                ; 2111 _ 01. D0
        cmp     eax, dword [ebp+0CH]                    ; 2113 _ 3B. 45, 0C
        jne     ?_092                                   ; 2116 _ 0F 85, 00000090
        mov     eax, dword [ebp-0CH]                    ; 211C _ 8B. 45, F4
        lea     ebx, [eax-1H]                           ; 211F _ 8D. 58, FF
        mov     eax, dword [ebp-0CH]                    ; 2122 _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 2125 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 2128 _ 8B. 45, 08
        add     edx, 2                                  ; 212B _ 83. C2, 02
        mov     edx, dword [eax+edx*8+4H]               ; 212E _ 8B. 54 D0, 04
        mov     eax, dword [ebp+10H]                    ; 2132 _ 8B. 45, 10
        lea     ecx, [edx+eax]                          ; 2135 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 2138 _ 8B. 45, 08
        lea     edx, [ebx+2H]                           ; 213B _ 8D. 53, 02
        mov     dword [eax+edx*8+4H], ecx               ; 213E _ 89. 4C D0, 04
        mov     eax, dword [ebp+8H]                     ; 2142 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 2145 _ 8B. 00
        cmp     eax, dword [ebp-0CH]                    ; 2147 _ 3B. 45, F4
        jle     ?_091                                   ; 214A _ 7E, 56
        mov     eax, dword [ebp+10H]                    ; 214C _ 8B. 45, 10
        mov     edx, dword [ebp+0CH]                    ; 214F _ 8B. 55, 0C
        lea     ecx, [edx+eax]                          ; 2152 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 2155 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 2158 _ 8B. 55, F4
        add     edx, 2                                  ; 215B _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 215E _ 8B. 04 D0
        cmp     ecx, eax                                ; 2161 _ 39. C1
        jnz     ?_091                                   ; 2163 _ 75, 3D
        mov     eax, dword [ebp-0CH]                    ; 2165 _ 8B. 45, F4
        lea     ebx, [eax-1H]                           ; 2168 _ 8D. 58, FF
        mov     eax, dword [ebp-0CH]                    ; 216B _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 216E _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 2171 _ 8B. 45, 08
        add     edx, 2                                  ; 2174 _ 83. C2, 02
        mov     edx, dword [eax+edx*8+4H]               ; 2177 _ 8B. 54 D0, 04
        mov     eax, dword [ebp+8H]                     ; 217B _ 8B. 45, 08
        mov     ecx, dword [ebp-0CH]                    ; 217E _ 8B. 4D, F4
        add     ecx, 2                                  ; 2181 _ 83. C1, 02
        mov     eax, dword [eax+ecx*8+4H]               ; 2184 _ 8B. 44 C8, 04
        lea     ecx, [edx+eax]                          ; 2188 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 218B _ 8B. 45, 08
        lea     edx, [ebx+2H]                           ; 218E _ 8D. 53, 02
        mov     dword [eax+edx*8+4H], ecx               ; 2191 _ 89. 4C D0, 04
        mov     eax, dword [ebp+8H]                     ; 2195 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 2198 _ 8B. 00
        lea     edx, [eax-1H]                           ; 219A _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 219D _ 8B. 45, 08
        mov     dword [eax], edx                        ; 21A0 _ 89. 10
?_091:  mov     eax, 0                                  ; 21A2 _ B8, 00000000
        jmp     ?_098                                   ; 21A7 _ E9, 0000011C

?_092:  mov     eax, dword [ebp+8H]                     ; 21AC _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 21AF _ 8B. 00
        cmp     eax, dword [ebp-0CH]                    ; 21B1 _ 3B. 45, F4
        jle     ?_093                                   ; 21B4 _ 7E, 52
        mov     eax, dword [ebp+10H]                    ; 21B6 _ 8B. 45, 10
        mov     edx, dword [ebp+0CH]                    ; 21B9 _ 8B. 55, 0C
        lea     ecx, [edx+eax]                          ; 21BC _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 21BF _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 21C2 _ 8B. 55, F4
        add     edx, 2                                  ; 21C5 _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 21C8 _ 8B. 04 D0
        cmp     ecx, eax                                ; 21CB _ 39. C1
        jnz     ?_093                                   ; 21CD _ 75, 39
        mov     eax, dword [ebp+8H]                     ; 21CF _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 21D2 _ 8B. 55, F4
        lea     ecx, [edx+2H]                           ; 21D5 _ 8D. 4A, 02
        mov     edx, dword [ebp+0CH]                    ; 21D8 _ 8B. 55, 0C
        mov     dword [eax+ecx*8], edx                  ; 21DB _ 89. 14 C8
        mov     eax, dword [ebp+8H]                     ; 21DE _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 21E1 _ 8B. 55, F4
        add     edx, 2                                  ; 21E4 _ 83. C2, 02
        mov     edx, dword [eax+edx*8+4H]               ; 21E7 _ 8B. 54 D0, 04
        mov     eax, dword [ebp+10H]                    ; 21EB _ 8B. 45, 10
        lea     ecx, [edx+eax]                          ; 21EE _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 21F1 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 21F4 _ 8B. 55, F4
        add     edx, 2                                  ; 21F7 _ 83. C2, 02
        mov     dword [eax+edx*8+4H], ecx               ; 21FA _ 89. 4C D0, 04
        mov     eax, 0                                  ; 21FE _ B8, 00000000
        jmp     ?_098                                   ; 2203 _ E9, 000000C0

?_093:  mov     eax, dword [ebp+8H]                     ; 2208 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 220B _ 8B. 00
        cmp     eax, 4095                               ; 220D _ 3D, 00000FFF
        jg      ?_097                                   ; 2212 _ 0F 8F, 00000087
        mov     eax, dword [ebp+8H]                     ; 2218 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 221B _ 8B. 00
        mov     dword [ebp-8H], eax                     ; 221D _ 89. 45, F8
        jmp     ?_095                                   ; 2220 _ EB, 28

?_094:  mov     eax, dword [ebp-8H]                     ; 2222 _ 8B. 45, F8
        lea     edx, [eax-1H]                           ; 2225 _ 8D. 50, FF
        mov     ecx, dword [ebp+8H]                     ; 2228 _ 8B. 4D, 08
        mov     eax, dword [ebp-8H]                     ; 222B _ 8B. 45, F8
        lea     ebx, [eax+2H]                           ; 222E _ 8D. 58, 02
        mov     eax, dword [ebp+8H]                     ; 2231 _ 8B. 45, 08
        add     edx, 2                                  ; 2234 _ 83. C2, 02
        lea     edx, [eax+edx*8]                        ; 2237 _ 8D. 14 D0
        mov     eax, dword [edx]                        ; 223A _ 8B. 02
        mov     edx, dword [edx+4H]                     ; 223C _ 8B. 52, 04
        mov     dword [ecx+ebx*8], eax                  ; 223F _ 89. 04 D9
        mov     dword [ecx+ebx*8+4H], edx               ; 2242 _ 89. 54 D9, 04
        sub     dword [ebp-8H], 1                       ; 2246 _ 83. 6D, F8, 01
?_095:  mov     eax, dword [ebp-8H]                     ; 224A _ 8B. 45, F8
        cmp     eax, dword [ebp-0CH]                    ; 224D _ 3B. 45, F4
        jg      ?_094                                   ; 2250 _ 7F, D0
        mov     eax, dword [ebp+8H]                     ; 2252 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 2255 _ 8B. 00
        lea     edx, [eax+1H]                           ; 2257 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 225A _ 8B. 45, 08
        mov     dword [eax], edx                        ; 225D _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 225F _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 2262 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 2265 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 2268 _ 8B. 00
        cmp     edx, eax                                ; 226A _ 39. C2
        jge     ?_096                                   ; 226C _ 7D, 0B
        mov     eax, dword [ebp+8H]                     ; 226E _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 2271 _ 8B. 10
        mov     eax, dword [ebp+8H]                     ; 2273 _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 2276 _ 89. 50, 04
?_096:  mov     eax, dword [ebp+8H]                     ; 2279 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 227C _ 8B. 55, F4
        lea     ecx, [edx+2H]                           ; 227F _ 8D. 4A, 02
        mov     edx, dword [ebp+0CH]                    ; 2282 _ 8B. 55, 0C
        mov     dword [eax+ecx*8], edx                  ; 2285 _ 89. 14 C8
        mov     eax, dword [ebp+8H]                     ; 2288 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 228B _ 8B. 55, F4
        lea     ecx, [edx+2H]                           ; 228E _ 8D. 4A, 02
        mov     edx, dword [ebp+10H]                    ; 2291 _ 8B. 55, 10
        mov     dword [eax+ecx*8+4H], edx               ; 2294 _ 89. 54 C8, 04
        mov     eax, 0                                  ; 2298 _ B8, 00000000
        jmp     ?_098                                   ; 229D _ EB, 29

?_097:  mov     eax, dword [ebp+8H]                     ; 229F _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 22A2 _ 8B. 40, 0C
        lea     edx, [eax+1H]                           ; 22A5 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 22A8 _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 22AB _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 22AE _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 22B1 _ 8B. 40, 08
        mov     edx, eax                                ; 22B4 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 22B6 _ 8B. 45, 10
        add     eax, edx                                ; 22B9 _ 01. D0
        mov     edx, eax                                ; 22BB _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 22BD _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 22C0 _ 89. 50, 08
        mov     eax, 4294967295                         ; 22C3 _ B8, FFFFFFFF
?_098:  add     esp, 16                                 ; 22C8 _ 83. C4, 10
        pop     ebx                                     ; 22CB _ 5B
        pop     ebp                                     ; 22CC _ 5D
        ret                                             ; 22CD _ C3
; memman_free End of function

memman_alloc_4k:; Function begin
        push    ebp                                     ; 22CE _ 55
        mov     ebp, esp                                ; 22CF _ 89. E5
        sub     esp, 24                                 ; 22D1 _ 83. EC, 18
        mov     eax, dword [ebp+0CH]                    ; 22D4 _ 8B. 45, 0C
        add     eax, 4095                               ; 22D7 _ 05, 00000FFF
        and     eax, 0FFFFF000H                         ; 22DC _ 25, FFFFF000
        mov     dword [ebp+0CH], eax                    ; 22E1 _ 89. 45, 0C
        mov     eax, dword [ebp+0CH]                    ; 22E4 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 22E7 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 22EB _ 8B. 45, 08
        mov     dword [esp], eax                        ; 22EE _ 89. 04 24
        call    memman_alloc                            ; 22F1 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-4H], eax                     ; 22F6 _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 22F9 _ 8B. 45, FC
        leave                                           ; 22FC _ C9
        ret                                             ; 22FD _ C3
; memman_alloc_4k End of function

memman_free_4k:; Function begin
        push    ebp                                     ; 22FE _ 55
        mov     ebp, esp                                ; 22FF _ 89. E5
        sub     esp, 28                                 ; 2301 _ 83. EC, 1C
        mov     eax, dword [ebp+10H]                    ; 2304 _ 8B. 45, 10
        add     eax, 4095                               ; 2307 _ 05, 00000FFF
        and     eax, 0FFFFF000H                         ; 230C _ 25, FFFFF000
        mov     dword [ebp+10H], eax                    ; 2311 _ 89. 45, 10
        mov     eax, dword [ebp+10H]                    ; 2314 _ 8B. 45, 10
        mov     dword [esp+8H], eax                     ; 2317 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 231B _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 231E _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2322 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2325 _ 89. 04 24
        call    memman_free                             ; 2328 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-4H], eax                     ; 232D _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 2330 _ 8B. 45, FC
        leave                                           ; 2333 _ C9
        ret                                             ; 2334 _ C3
; memman_free_4k End of function

sheet_control_init:; Function begin
        push    ebp                                     ; 2335 _ 55
        mov     ebp, esp                                ; 2336 _ 89. E5
        sub     esp, 40                                 ; 2338 _ 83. EC, 28
        mov     dword [esp+4H], 9236                    ; 233B _ C7. 44 24, 04, 00002414
        mov     eax, dword [ebp+8H]                     ; 2343 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2346 _ 89. 04 24
        call    memman_alloc_4k                         ; 2349 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 234E _ 89. 45, F4
        cmp     dword [ebp-0CH], 0                      ; 2351 _ 83. 7D, F4, 00
        jnz     ?_099                                   ; 2355 _ 75, 24
        mov     eax, dword [ebp-0CH]                    ; 2357 _ 8B. 45, F4
        mov     dword [esp+8H], 9236                    ; 235A _ C7. 44 24, 08, 00002414
        mov     dword [esp+4H], eax                     ; 2362 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2366 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2369 _ 89. 04 24
        call    memman_free_4k                          ; 236C _ E8, FFFFFFFC(rel)
        mov     eax, 0                                  ; 2371 _ B8, 00000000
        jmp     ?_103                                   ; 2376 _ E9, 0000009D

?_099:  mov     eax, dword [ebp-0CH]                    ; 237B _ 8B. 45, F4
        mov     edx, dword [ebp+0CH]                    ; 237E _ 8B. 55, 0C
        mov     dword [eax], edx                        ; 2381 _ 89. 10
        mov     eax, dword [ebp-0CH]                    ; 2383 _ 8B. 45, F4
        mov     edx, dword [ebp+10H]                    ; 2386 _ 8B. 55, 10
        mov     dword [eax+4H], edx                     ; 2389 _ 89. 50, 04
        mov     eax, dword [ebp-0CH]                    ; 238C _ 8B. 45, F4
        mov     edx, dword [ebp+14H]                    ; 238F _ 8B. 55, 14
        mov     dword [eax+8H], edx                     ; 2392 _ 89. 50, 08
        mov     eax, dword [ebp-0CH]                    ; 2395 _ 8B. 45, F4
        mov     dword [eax+0CH], -1                     ; 2398 _ C7. 40, 0C, FFFFFFFF
        mov     dword [ebp-10H], 0                      ; 239F _ C7. 45, F0, 00000000
        jmp     ?_101                                   ; 23A6 _ EB, 1B

?_100:  mov     eax, dword [ebp-0CH]                    ; 23A8 _ 8B. 45, F4
        mov     edx, dword [ebp-10H]                    ; 23AB _ 8B. 55, F0
        add     edx, 33                                 ; 23AE _ 83. C2, 21
        shl     edx, 5                                  ; 23B1 _ C1. E2, 05
        add     eax, edx                                ; 23B4 _ 01. D0
        add     eax, 16                                 ; 23B6 _ 83. C0, 10
        mov     dword [eax], 0                          ; 23B9 _ C7. 00, 00000000
        add     dword [ebp-10H], 1                      ; 23BF _ 83. 45, F0, 01
?_101:  cmp     dword [ebp-10H], 255                    ; 23C3 _ 81. 7D, F0, 000000FF
        jle     ?_100                                   ; 23CA _ 7E, DC
        mov     eax, dword [ebp+10H]                    ; 23CC _ 8B. 45, 10
        imul    eax, dword [ebp+14H]                    ; 23CF _ 0F AF. 45, 14
        mov     dword [esp+4H], eax                     ; 23D3 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 23D7 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 23DA _ 89. 04 24
        call    memman_alloc_4k                         ; 23DD _ E8, FFFFFFFC(rel)
        mov     edx, eax                                ; 23E2 _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 23E4 _ 8B. 45, F4
        mov     dword [eax+10H], edx                    ; 23E7 _ 89. 50, 10
        mov     eax, dword [ebp-0CH]                    ; 23EA _ 8B. 45, F4
        mov     eax, dword [eax+10H]                    ; 23ED _ 8B. 40, 10
        test    eax, eax                                ; 23F0 _ 85. C0
        jnz     ?_102                                   ; 23F2 _ 75, 21
        mov     eax, dword [ebp-0CH]                    ; 23F4 _ 8B. 45, F4
        mov     dword [esp+8H], 9236                    ; 23F7 _ C7. 44 24, 08, 00002414
        mov     dword [esp+4H], eax                     ; 23FF _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2403 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2406 _ 89. 04 24
        call    memman_free_4k                          ; 2409 _ E8, FFFFFFFC(rel)
        mov     eax, 0                                  ; 240E _ B8, 00000000
        jmp     ?_103                                   ; 2413 _ EB, 03

?_102:  mov     eax, dword [ebp-0CH]                    ; 2415 _ 8B. 45, F4
?_103:  leave                                           ; 2418 _ C9
        ret                                             ; 2419 _ C3
; sheet_control_init End of function

sheet_alloc:; Function begin
        push    ebp                                     ; 241A _ 55
        mov     ebp, esp                                ; 241B _ 89. E5
        sub     esp, 16                                 ; 241D _ 83. EC, 10
        mov     dword [ebp-8H], 0                       ; 2420 _ C7. 45, F8, 00000000
        jmp     ?_106                                   ; 2427 _ EB, 5B

?_104:  mov     eax, dword [ebp+8H]                     ; 2429 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 242C _ 8B. 55, F8
        add     edx, 33                                 ; 242F _ 83. C2, 21
        shl     edx, 5                                  ; 2432 _ C1. E2, 05
        add     eax, edx                                ; 2435 _ 01. D0
        add     eax, 16                                 ; 2437 _ 83. C0, 10
        mov     eax, dword [eax]                        ; 243A _ 8B. 00
        test    eax, eax                                ; 243C _ 85. C0
        jnz     ?_105                                   ; 243E _ 75, 40
        mov     eax, dword [ebp-8H]                     ; 2440 _ 8B. 45, F8
        shl     eax, 5                                  ; 2443 _ C1. E0, 05
        lea     edx, [eax+410H]                         ; 2446 _ 8D. 90, 00000410
        mov     eax, dword [ebp+8H]                     ; 244C _ 8B. 45, 08
        add     eax, edx                                ; 244F _ 01. D0
        add     eax, 4                                  ; 2451 _ 83. C0, 04
        mov     dword [ebp-4H], eax                     ; 2454 _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 2457 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 245A _ 8B. 55, F8
        lea     ecx, [edx+4H]                           ; 245D _ 8D. 4A, 04
        mov     edx, dword [ebp-4H]                     ; 2460 _ 8B. 55, FC
        mov     dword [eax+ecx*4+4H], edx               ; 2463 _ 89. 54 88, 04
        mov     eax, dword [ebp-4H]                     ; 2467 _ 8B. 45, FC
        mov     dword [eax+1CH], 1                      ; 246A _ C7. 40, 1C, 00000001
        mov     eax, dword [ebp-4H]                     ; 2471 _ 8B. 45, FC
        mov     dword [eax+18H], -1                     ; 2474 _ C7. 40, 18, FFFFFFFF
        mov     eax, dword [ebp-4H]                     ; 247B _ 8B. 45, FC
        jmp     ?_107                                   ; 247E _ EB, 12

?_105:  add     dword [ebp-8H], 1                       ; 2480 _ 83. 45, F8, 01
?_106:  cmp     dword [ebp-8H], 255                     ; 2484 _ 81. 7D, F8, 000000FF
        jle     ?_104                                   ; 248B _ 7E, 9C
        mov     eax, 0                                  ; 248D _ B8, 00000000
?_107:  leave                                           ; 2492 _ C9
        ret                                             ; 2493 _ C3
; sheet_alloc End of function

sheet_setbuf:; Function begin
        push    ebp                                     ; 2494 _ 55
        mov     ebp, esp                                ; 2495 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 2497 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 249A _ 8B. 55, 0C
        mov     dword [eax], edx                        ; 249D _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 249F _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 24A2 _ 8B. 55, 10
        mov     dword [eax+4H], edx                     ; 24A5 _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 24A8 _ 8B. 45, 08
        mov     edx, dword [ebp+14H]                    ; 24AB _ 8B. 55, 14
        mov     dword [eax+8H], edx                     ; 24AE _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 24B1 _ 8B. 45, 08
        mov     edx, dword [ebp+18H]                    ; 24B4 _ 8B. 55, 18
        mov     dword [eax+14H], edx                    ; 24B7 _ 89. 50, 14
        pop     ebp                                     ; 24BA _ 5D
        ret                                             ; 24BB _ C3
; sheet_setbuf End of function

sheet_updown:; Function begin
        push    ebp                                     ; 24BC _ 55
        mov     ebp, esp                                ; 24BD _ 89. E5
        push    esi                                     ; 24BF _ 56
        push    ebx                                     ; 24C0 _ 53
        sub     esp, 48                                 ; 24C1 _ 83. EC, 30
        mov     eax, dword [ebp+0CH]                    ; 24C4 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 24C7 _ 8B. 40, 18
        mov     dword [ebp-0CH], eax                    ; 24CA _ 89. 45, F4
        mov     eax, dword [ebp+8H]                     ; 24CD _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 24D0 _ 8B. 40, 0C
        add     eax, 1                                  ; 24D3 _ 83. C0, 01
        cmp     eax, dword [ebp+10H]                    ; 24D6 _ 3B. 45, 10
        jge     ?_108                                   ; 24D9 _ 7D, 0C
        mov     eax, dword [ebp+8H]                     ; 24DB _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 24DE _ 8B. 40, 0C
        add     eax, 1                                  ; 24E1 _ 83. C0, 01
        mov     dword [ebp+10H], eax                    ; 24E4 _ 89. 45, 10
?_108:  cmp     dword [ebp+10H], -1                     ; 24E7 _ 83. 7D, 10, FF
        jge     ?_109                                   ; 24EB _ 7D, 07
        mov     dword [ebp+10H], -1                     ; 24ED _ C7. 45, 10, FFFFFFFF
?_109:  mov     eax, dword [ebp+0CH]                    ; 24F4 _ 8B. 45, 0C
        mov     edx, dword [ebp+10H]                    ; 24F7 _ 8B. 55, 10
        mov     dword [eax+18H], edx                    ; 24FA _ 89. 50, 18
        mov     eax, dword [ebp-0CH]                    ; 24FD _ 8B. 45, F4
        cmp     eax, dword [ebp+10H]                    ; 2500 _ 3B. 45, 10
        jle     ?_116                                   ; 2503 _ 0F 8E, 00000201
        cmp     dword [ebp+10H], 0                      ; 2509 _ 83. 7D, 10, 00
        js      ?_112                                   ; 250D _ 0F 88, 000000F7
        mov     eax, dword [ebp-0CH]                    ; 2513 _ 8B. 45, F4
        mov     dword [ebp-10H], eax                    ; 2516 _ 89. 45, F0
        jmp     ?_111                                   ; 2519 _ EB, 34

?_110:  mov     eax, dword [ebp-10H]                    ; 251B _ 8B. 45, F0
        lea     edx, [eax-1H]                           ; 251E _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 2521 _ 8B. 45, 08
        add     edx, 4                                  ; 2524 _ 83. C2, 04
        mov     edx, dword [eax+edx*4+4H]               ; 2527 _ 8B. 54 90, 04
        mov     eax, dword [ebp+8H]                     ; 252B _ 8B. 45, 08
        mov     ecx, dword [ebp-10H]                    ; 252E _ 8B. 4D, F0
        add     ecx, 4                                  ; 2531 _ 83. C1, 04
        mov     dword [eax+ecx*4+4H], edx               ; 2534 _ 89. 54 88, 04
        mov     eax, dword [ebp+8H]                     ; 2538 _ 8B. 45, 08
        mov     edx, dword [ebp-10H]                    ; 253B _ 8B. 55, F0
        add     edx, 4                                  ; 253E _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 2541 _ 8B. 44 90, 04
        mov     edx, dword [ebp-10H]                    ; 2545 _ 8B. 55, F0
        mov     dword [eax+18H], edx                    ; 2548 _ 89. 50, 18
        sub     dword [ebp-10H], 1                      ; 254B _ 83. 6D, F0, 01
?_111:  mov     eax, dword [ebp-10H]                    ; 254F _ 8B. 45, F0
        cmp     eax, dword [ebp+10H]                    ; 2552 _ 3B. 45, 10
        jg      ?_110                                   ; 2555 _ 7F, C4
        mov     eax, dword [ebp+8H]                     ; 2557 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 255A _ 8B. 55, 10
        lea     ecx, [edx+4H]                           ; 255D _ 8D. 4A, 04
        mov     edx, dword [ebp+0CH]                    ; 2560 _ 8B. 55, 0C
        mov     dword [eax+ecx*4+4H], edx               ; 2563 _ 89. 54 88, 04
        mov     eax, dword [ebp+10H]                    ; 2567 _ 8B. 45, 10
        lea     esi, [eax+1H]                           ; 256A _ 8D. 70, 01
        mov     eax, dword [ebp+0CH]                    ; 256D _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 2570 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 2573 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 2576 _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 2579 _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 257C _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 257F _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 2582 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 2585 _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 2588 _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 258B _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 258E _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 2591 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 2594 _ 8B. 40, 0C
        mov     dword [esp+14H], esi                    ; 2597 _ 89. 74 24, 14
        mov     dword [esp+10H], ebx                    ; 259B _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 259F _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 25A3 _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 25A7 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 25AB _ 8B. 45, 08
        mov     dword [esp], eax                        ; 25AE _ 89. 04 24
        call    sheet_refresh_map                       ; 25B1 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 25B6 _ 8B. 45, 10
        lea     esi, [eax+1H]                           ; 25B9 _ 8D. 70, 01
        mov     eax, dword [ebp+0CH]                    ; 25BC _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 25BF _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 25C2 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 25C5 _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 25C8 _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 25CB _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 25CE _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 25D1 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 25D4 _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 25D7 _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 25DA _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 25DD _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 25E0 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 25E3 _ 8B. 40, 0C
        mov     dword [esp+14H], esi                    ; 25E6 _ 89. 74 24, 14
        mov     dword [esp+10H], ebx                    ; 25EA _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 25EE _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 25F2 _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 25F6 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 25FA _ 8B. 45, 08
        mov     dword [esp], eax                        ; 25FD _ 89. 04 24
        call    sheet_refresh_local                     ; 2600 _ E8, FFFFFFFC(rel)
        jmp     ?_123                                   ; 2605 _ E9, 0000026C

?_112:  mov     eax, dword [ebp+8H]                     ; 260A _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 260D _ 8B. 40, 0C
        cmp     eax, dword [ebp-0CH]                    ; 2610 _ 3B. 45, F4
        jle     ?_115                                   ; 2613 _ 7E, 47
        mov     eax, dword [ebp-0CH]                    ; 2615 _ 8B. 45, F4
        mov     dword [ebp-10H], eax                    ; 2618 _ 89. 45, F0
        jmp     ?_114                                   ; 261B _ EB, 34

?_113:  mov     eax, dword [ebp-10H]                    ; 261D _ 8B. 45, F0
        lea     edx, [eax+1H]                           ; 2620 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 2623 _ 8B. 45, 08
        add     edx, 4                                  ; 2626 _ 83. C2, 04
        mov     edx, dword [eax+edx*4+4H]               ; 2629 _ 8B. 54 90, 04
        mov     eax, dword [ebp+8H]                     ; 262D _ 8B. 45, 08
        mov     ecx, dword [ebp-10H]                    ; 2630 _ 8B. 4D, F0
        add     ecx, 4                                  ; 2633 _ 83. C1, 04
        mov     dword [eax+ecx*4+4H], edx               ; 2636 _ 89. 54 88, 04
        mov     eax, dword [ebp+8H]                     ; 263A _ 8B. 45, 08
        mov     edx, dword [ebp-10H]                    ; 263D _ 8B. 55, F0
        add     edx, 4                                  ; 2640 _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 2643 _ 8B. 44 90, 04
        mov     edx, dword [ebp-10H]                    ; 2647 _ 8B. 55, F0
        mov     dword [eax+18H], edx                    ; 264A _ 89. 50, 18
        add     dword [ebp-10H], 1                      ; 264D _ 83. 45, F0, 01
?_114:  mov     eax, dword [ebp+8H]                     ; 2651 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 2654 _ 8B. 40, 0C
        cmp     eax, dword [ebp-10H]                    ; 2657 _ 3B. 45, F0
        jg      ?_113                                   ; 265A _ 7F, C1
?_115:  mov     eax, dword [ebp+8H]                     ; 265C _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 265F _ 8B. 40, 0C
        lea     edx, [eax-1H]                           ; 2662 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 2665 _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 2668 _ 89. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 266B _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 266E _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 2671 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 2674 _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 2677 _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 267A _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 267D _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 2680 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 2683 _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 2686 _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 2689 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 268C _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 268F _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 2692 _ 8B. 40, 0C
        mov     dword [esp+14H], 0                      ; 2695 _ C7. 44 24, 14, 00000000
        mov     dword [esp+10H], ebx                    ; 269D _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 26A1 _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 26A5 _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 26A9 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 26AD _ 8B. 45, 08
        mov     dword [esp], eax                        ; 26B0 _ 89. 04 24
        call    sheet_refresh_map                       ; 26B3 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+0CH]                    ; 26B8 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 26BB _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 26BE _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 26C1 _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 26C4 _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 26C7 _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 26CA _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 26CD _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 26D0 _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 26D3 _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 26D6 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 26D9 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 26DC _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 26DF _ 8B. 40, 0C
        mov     dword [esp+14H], 0                      ; 26E2 _ C7. 44 24, 14, 00000000
        mov     dword [esp+10H], ebx                    ; 26EA _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 26EE _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 26F2 _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 26F6 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 26FA _ 8B. 45, 08
        mov     dword [esp], eax                        ; 26FD _ 89. 04 24
        call    sheet_refresh_local                     ; 2700 _ E8, FFFFFFFC(rel)
        jmp     ?_123                                   ; 2705 _ E9, 0000016C

?_116:  mov     eax, dword [ebp-0CH]                    ; 270A _ 8B. 45, F4
        cmp     eax, dword [ebp+10H]                    ; 270D _ 3B. 45, 10
        jge     ?_123                                   ; 2710 _ 0F 8D, 00000160
        cmp     dword [ebp-0CH], 0                      ; 2716 _ 83. 7D, F4, 00
        js      ?_119                                   ; 271A _ 78, 56
        mov     eax, dword [ebp-0CH]                    ; 271C _ 8B. 45, F4
        mov     dword [ebp-10H], eax                    ; 271F _ 89. 45, F0
        jmp     ?_118                                   ; 2722 _ EB, 34

?_117:  mov     eax, dword [ebp-10H]                    ; 2724 _ 8B. 45, F0
        lea     edx, [eax+1H]                           ; 2727 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 272A _ 8B. 45, 08
        add     edx, 4                                  ; 272D _ 83. C2, 04
        mov     edx, dword [eax+edx*4+4H]               ; 2730 _ 8B. 54 90, 04
        mov     eax, dword [ebp+8H]                     ; 2734 _ 8B. 45, 08
        mov     ecx, dword [ebp-10H]                    ; 2737 _ 8B. 4D, F0
        add     ecx, 4                                  ; 273A _ 83. C1, 04
        mov     dword [eax+ecx*4+4H], edx               ; 273D _ 89. 54 88, 04
        mov     eax, dword [ebp+8H]                     ; 2741 _ 8B. 45, 08
        mov     edx, dword [ebp-10H]                    ; 2744 _ 8B. 55, F0
        add     edx, 4                                  ; 2747 _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 274A _ 8B. 44 90, 04
        mov     edx, dword [ebp-10H]                    ; 274E _ 8B. 55, F0
        mov     dword [eax+18H], edx                    ; 2751 _ 89. 50, 18
        add     dword [ebp-10H], 1                      ; 2754 _ 83. 45, F0, 01
?_118:  mov     eax, dword [ebp-10H]                    ; 2758 _ 8B. 45, F0
        cmp     eax, dword [ebp+10H]                    ; 275B _ 3B. 45, 10
        jl      ?_117                                   ; 275E _ 7C, C4
        mov     eax, dword [ebp+8H]                     ; 2760 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 2763 _ 8B. 55, 10
        lea     ecx, [edx+4H]                           ; 2766 _ 8D. 4A, 04
        mov     edx, dword [ebp+0CH]                    ; 2769 _ 8B. 55, 0C
        mov     dword [eax+ecx*4+4H], edx               ; 276C _ 89. 54 88, 04
        jmp     ?_122                                   ; 2770 _ EB, 6C

?_119:  mov     eax, dword [ebp+8H]                     ; 2772 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 2775 _ 8B. 40, 0C
        mov     dword [ebp-10H], eax                    ; 2778 _ 89. 45, F0
        jmp     ?_121                                   ; 277B _ EB, 3A

?_120:  mov     eax, dword [ebp-10H]                    ; 277D _ 8B. 45, F0
        lea     ecx, [eax+1H]                           ; 2780 _ 8D. 48, 01
        mov     eax, dword [ebp+8H]                     ; 2783 _ 8B. 45, 08
        mov     edx, dword [ebp-10H]                    ; 2786 _ 8B. 55, F0
        add     edx, 4                                  ; 2789 _ 83. C2, 04
        mov     edx, dword [eax+edx*4+4H]               ; 278C _ 8B. 54 90, 04
        mov     eax, dword [ebp+8H]                     ; 2790 _ 8B. 45, 08
        add     ecx, 4                                  ; 2793 _ 83. C1, 04
        mov     dword [eax+ecx*4+4H], edx               ; 2796 _ 89. 54 88, 04
        mov     eax, dword [ebp-10H]                    ; 279A _ 8B. 45, F0
        lea     edx, [eax+1H]                           ; 279D _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 27A0 _ 8B. 45, 08
        add     edx, 4                                  ; 27A3 _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 27A6 _ 8B. 44 90, 04
        mov     edx, dword [ebp-10H]                    ; 27AA _ 8B. 55, F0
        add     edx, 1                                  ; 27AD _ 83. C2, 01
        mov     dword [eax+18H], edx                    ; 27B0 _ 89. 50, 18
        sub     dword [ebp-10H], 1                      ; 27B3 _ 83. 6D, F0, 01
?_121:  mov     eax, dword [ebp-10H]                    ; 27B7 _ 8B. 45, F0
        cmp     eax, dword [ebp+10H]                    ; 27BA _ 3B. 45, 10
        jge     ?_120                                   ; 27BD _ 7D, BE
        mov     eax, dword [ebp+8H]                     ; 27BF _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 27C2 _ 8B. 55, 10
        lea     ecx, [edx+4H]                           ; 27C5 _ 8D. 4A, 04
        mov     edx, dword [ebp+0CH]                    ; 27C8 _ 8B. 55, 0C
        mov     dword [eax+ecx*4+4H], edx               ; 27CB _ 89. 54 88, 04
        mov     eax, dword [ebp+8H]                     ; 27CF _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 27D2 _ 8B. 40, 0C
        lea     edx, [eax+1H]                           ; 27D5 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 27D8 _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 27DB _ 89. 50, 0C
?_122:  mov     eax, dword [ebp+0CH]                    ; 27DE _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 27E1 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 27E4 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 27E7 _ 8B. 40, 08
        lea     esi, [edx+eax]                          ; 27EA _ 8D. 34 02
        mov     eax, dword [ebp+0CH]                    ; 27ED _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 27F0 _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 27F3 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 27F6 _ 8B. 40, 04
        lea     ebx, [edx+eax]                          ; 27F9 _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 27FC _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 27FF _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 2802 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 2805 _ 8B. 40, 0C
        mov     ecx, dword [ebp+10H]                    ; 2808 _ 8B. 4D, 10
        mov     dword [esp+14H], ecx                    ; 280B _ 89. 4C 24, 14
        mov     dword [esp+10H], esi                    ; 280F _ 89. 74 24, 10
        mov     dword [esp+0CH], ebx                    ; 2813 _ 89. 5C 24, 0C
        mov     dword [esp+8H], edx                     ; 2817 _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 281B _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 281F _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2822 _ 89. 04 24
        call    sheet_refresh_map                       ; 2825 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+0CH]                    ; 282A _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 282D _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 2830 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 2833 _ 8B. 40, 08
        lea     esi, [edx+eax]                          ; 2836 _ 8D. 34 02
        mov     eax, dword [ebp+0CH]                    ; 2839 _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 283C _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 283F _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 2842 _ 8B. 40, 04
        lea     ebx, [edx+eax]                          ; 2845 _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 2848 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 284B _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 284E _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 2851 _ 8B. 40, 0C
        mov     ecx, dword [ebp+10H]                    ; 2854 _ 8B. 4D, 10
        mov     dword [esp+14H], ecx                    ; 2857 _ 89. 4C 24, 14
        mov     dword [esp+10H], esi                    ; 285B _ 89. 74 24, 10
        mov     dword [esp+0CH], ebx                    ; 285F _ 89. 5C 24, 0C
        mov     dword [esp+8H], edx                     ; 2863 _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 2867 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 286B _ 8B. 45, 08
        mov     dword [esp], eax                        ; 286E _ 89. 04 24
        call    sheet_refresh_local                     ; 2871 _ E8, FFFFFFFC(rel)
?_123:  add     esp, 48                                 ; 2876 _ 83. C4, 30
        pop     ebx                                     ; 2879 _ 5B
        pop     esi                                     ; 287A _ 5E
        pop     ebp                                     ; 287B _ 5D
        ret                                             ; 287C _ C3
; sheet_updown End of function

sheet_refresh:; Function begin
        push    ebp                                     ; 287D _ 55
        mov     ebp, esp                                ; 287E _ 89. E5
        push    edi                                     ; 2880 _ 57
        push    esi                                     ; 2881 _ 56
        push    ebx                                     ; 2882 _ 53
        sub     esp, 44                                 ; 2883 _ 83. EC, 2C
        mov     eax, dword [ebp+0CH]                    ; 2886 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 2889 _ 8B. 40, 18
        test    eax, eax                                ; 288C _ 85. C0
        js      ?_124                                   ; 288E _ 78, 53
        mov     eax, dword [ebp+0CH]                    ; 2890 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 2893 _ 8B. 40, 18
        mov     edx, dword [ebp+0CH]                    ; 2896 _ 8B. 55, 0C
        mov     ecx, dword [edx+10H]                    ; 2899 _ 8B. 4A, 10
        mov     edx, dword [ebp+1CH]                    ; 289C _ 8B. 55, 1C
        lea     esi, [ecx+edx]                          ; 289F _ 8D. 34 11
        mov     edx, dword [ebp+0CH]                    ; 28A2 _ 8B. 55, 0C
        mov     ecx, dword [edx+0CH]                    ; 28A5 _ 8B. 4A, 0C
        mov     edx, dword [ebp+18H]                    ; 28A8 _ 8B. 55, 18
        lea     ebx, [ecx+edx]                          ; 28AB _ 8D. 1C 11
        mov     edx, dword [ebp+0CH]                    ; 28AE _ 8B. 55, 0C
        mov     ecx, dword [edx+10H]                    ; 28B1 _ 8B. 4A, 10
        mov     edx, dword [ebp+14H]                    ; 28B4 _ 8B. 55, 14
        add     ecx, edx                                ; 28B7 _ 01. D1
        mov     edx, dword [ebp+0CH]                    ; 28B9 _ 8B. 55, 0C
        mov     edi, dword [edx+0CH]                    ; 28BC _ 8B. 7A, 0C
        mov     edx, dword [ebp+10H]                    ; 28BF _ 8B. 55, 10
        add     edx, edi                                ; 28C2 _ 01. FA
        mov     dword [esp+14H], eax                    ; 28C4 _ 89. 44 24, 14
        mov     dword [esp+10H], esi                    ; 28C8 _ 89. 74 24, 10
        mov     dword [esp+0CH], ebx                    ; 28CC _ 89. 5C 24, 0C
        mov     dword [esp+8H], ecx                     ; 28D0 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 28D4 _ 89. 54 24, 04
        mov     eax, dword [ebp+8H]                     ; 28D8 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 28DB _ 89. 04 24
        call    sheet_refresh_local                     ; 28DE _ E8, FFFFFFFC(rel)
?_124:  mov     eax, 0                                  ; 28E3 _ B8, 00000000
        add     esp, 44                                 ; 28E8 _ 83. C4, 2C
        pop     ebx                                     ; 28EB _ 5B
        pop     esi                                     ; 28EC _ 5E
        pop     edi                                     ; 28ED _ 5F
        pop     ebp                                     ; 28EE _ 5D
        ret                                             ; 28EF _ C3
; sheet_refresh End of function

sheet_slide:; Function begin
        push    ebp                                     ; 28F0 _ 55
        mov     ebp, esp                                ; 28F1 _ 89. E5
        push    ebx                                     ; 28F3 _ 53
        sub     esp, 52                                 ; 28F4 _ 83. EC, 34
        mov     eax, dword [ebp+0CH]                    ; 28F7 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 28FA _ 8B. 40, 0C
        mov     dword [ebp-10H], eax                    ; 28FD _ 89. 45, F0
        mov     eax, dword [ebp+0CH]                    ; 2900 _ 8B. 45, 0C
        mov     eax, dword [eax+10H]                    ; 2903 _ 8B. 40, 10
        mov     dword [ebp-0CH], eax                    ; 2906 _ 89. 45, F4
        mov     eax, dword [ebp+0CH]                    ; 2909 _ 8B. 45, 0C
        mov     edx, dword [ebp+10H]                    ; 290C _ 8B. 55, 10
        mov     dword [eax+0CH], edx                    ; 290F _ 89. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 2912 _ 8B. 45, 0C
        mov     edx, dword [ebp+14H]                    ; 2915 _ 8B. 55, 14
        mov     dword [eax+10H], edx                    ; 2918 _ 89. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 291B _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 291E _ 8B. 40, 18
        test    eax, eax                                ; 2921 _ 85. C0
        js      ?_125                                   ; 2923 _ 0F 88, 00000100
        mov     eax, dword [ebp+0CH]                    ; 2929 _ 8B. 45, 0C
        mov     edx, dword [eax+8H]                     ; 292C _ 8B. 50, 08
        mov     eax, dword [ebp-0CH]                    ; 292F _ 8B. 45, F4
        add     edx, eax                                ; 2932 _ 01. C2
        mov     eax, dword [ebp+0CH]                    ; 2934 _ 8B. 45, 0C
        mov     ecx, dword [eax+4H]                     ; 2937 _ 8B. 48, 04
        mov     eax, dword [ebp-10H]                    ; 293A _ 8B. 45, F0
        add     eax, ecx                                ; 293D _ 01. C8
        mov     dword [esp+14H], 0                      ; 293F _ C7. 44 24, 14, 00000000
        mov     dword [esp+10H], edx                    ; 2947 _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 294B _ 89. 44 24, 0C
        mov     eax, dword [ebp-0CH]                    ; 294F _ 8B. 45, F4
        mov     dword [esp+8H], eax                     ; 2952 _ 89. 44 24, 08
        mov     eax, dword [ebp-10H]                    ; 2956 _ 8B. 45, F0
        mov     dword [esp+4H], eax                     ; 2959 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 295D _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2960 _ 89. 04 24
        call    sheet_refresh_map                       ; 2963 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+0CH]                    ; 2968 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 296B _ 8B. 40, 18
        mov     edx, dword [ebp+0CH]                    ; 296E _ 8B. 55, 0C
        mov     ecx, dword [edx+8H]                     ; 2971 _ 8B. 4A, 08
        mov     edx, dword [ebp+14H]                    ; 2974 _ 8B. 55, 14
        add     ecx, edx                                ; 2977 _ 01. D1
        mov     edx, dword [ebp+0CH]                    ; 2979 _ 8B. 55, 0C
        mov     ebx, dword [edx+4H]                     ; 297C _ 8B. 5A, 04
        mov     edx, dword [ebp+10H]                    ; 297F _ 8B. 55, 10
        add     edx, ebx                                ; 2982 _ 01. DA
        mov     dword [esp+14H], eax                    ; 2984 _ 89. 44 24, 14
        mov     dword [esp+10H], ecx                    ; 2988 _ 89. 4C 24, 10
        mov     dword [esp+0CH], edx                    ; 298C _ 89. 54 24, 0C
        mov     eax, dword [ebp+14H]                    ; 2990 _ 8B. 45, 14
        mov     dword [esp+8H], eax                     ; 2993 _ 89. 44 24, 08
        mov     eax, dword [ebp+10H]                    ; 2997 _ 8B. 45, 10
        mov     dword [esp+4H], eax                     ; 299A _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 299E _ 8B. 45, 08
        mov     dword [esp], eax                        ; 29A1 _ 89. 04 24
        call    sheet_refresh_map                       ; 29A4 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+0CH]                    ; 29A9 _ 8B. 45, 0C
        mov     edx, dword [eax+8H]                     ; 29AC _ 8B. 50, 08
        mov     eax, dword [ebp-0CH]                    ; 29AF _ 8B. 45, F4
        add     edx, eax                                ; 29B2 _ 01. C2
        mov     eax, dword [ebp+0CH]                    ; 29B4 _ 8B. 45, 0C
        mov     ecx, dword [eax+4H]                     ; 29B7 _ 8B. 48, 04
        mov     eax, dword [ebp-10H]                    ; 29BA _ 8B. 45, F0
        add     eax, ecx                                ; 29BD _ 01. C8
        mov     dword [esp+14H], 0                      ; 29BF _ C7. 44 24, 14, 00000000
        mov     dword [esp+10H], edx                    ; 29C7 _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 29CB _ 89. 44 24, 0C
        mov     eax, dword [ebp-0CH]                    ; 29CF _ 8B. 45, F4
        mov     dword [esp+8H], eax                     ; 29D2 _ 89. 44 24, 08
        mov     eax, dword [ebp-10H]                    ; 29D6 _ 8B. 45, F0
        mov     dword [esp+4H], eax                     ; 29D9 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 29DD _ 8B. 45, 08
        mov     dword [esp], eax                        ; 29E0 _ 89. 04 24
        call    sheet_refresh_local                     ; 29E3 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+0CH]                    ; 29E8 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 29EB _ 8B. 40, 18
        mov     edx, dword [ebp+0CH]                    ; 29EE _ 8B. 55, 0C
        mov     ecx, dword [edx+8H]                     ; 29F1 _ 8B. 4A, 08
        mov     edx, dword [ebp+14H]                    ; 29F4 _ 8B. 55, 14
        add     ecx, edx                                ; 29F7 _ 01. D1
        mov     edx, dword [ebp+0CH]                    ; 29F9 _ 8B. 55, 0C
        mov     ebx, dword [edx+4H]                     ; 29FC _ 8B. 5A, 04
        mov     edx, dword [ebp+10H]                    ; 29FF _ 8B. 55, 10
        add     edx, ebx                                ; 2A02 _ 01. DA
        mov     dword [esp+14H], eax                    ; 2A04 _ 89. 44 24, 14
        mov     dword [esp+10H], ecx                    ; 2A08 _ 89. 4C 24, 10
        mov     dword [esp+0CH], edx                    ; 2A0C _ 89. 54 24, 0C
        mov     eax, dword [ebp+14H]                    ; 2A10 _ 8B. 45, 14
        mov     dword [esp+8H], eax                     ; 2A13 _ 89. 44 24, 08
        mov     eax, dword [ebp+10H]                    ; 2A17 _ 8B. 45, 10
        mov     dword [esp+4H], eax                     ; 2A1A _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2A1E _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2A21 _ 89. 04 24
        call    sheet_refresh_local                     ; 2A24 _ E8, FFFFFFFC(rel)
?_125:  add     esp, 52                                 ; 2A29 _ 83. C4, 34
        pop     ebx                                     ; 2A2C _ 5B
        pop     ebp                                     ; 2A2D _ 5D
        ret                                             ; 2A2E _ C3
; sheet_slide End of function

sheet_refresh_local:; Function begin
        push    ebp                                     ; 2A2F _ 55
        mov     ebp, esp                                ; 2A30 _ 89. E5
        sub     esp, 48                                 ; 2A32 _ 83. EC, 30
        mov     eax, dword [ebp+8H]                     ; 2A35 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 2A38 _ 8B. 00
        mov     dword [ebp-18H], eax                    ; 2A3A _ 89. 45, E8
        mov     eax, dword [ebp+8H]                     ; 2A3D _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 2A40 _ 8B. 40, 10
        mov     dword [ebp-14H], eax                    ; 2A43 _ 89. 45, EC
        cmp     dword [ebp+0CH], 0                      ; 2A46 _ 83. 7D, 0C, 00
        jns     ?_126                                   ; 2A4A _ 79, 07
        mov     dword [ebp+0CH], 0                      ; 2A4C _ C7. 45, 0C, 00000000
?_126:  cmp     dword [ebp+10H], 0                      ; 2A53 _ 83. 7D, 10, 00
        jns     ?_127                                   ; 2A57 _ 79, 07
        mov     dword [ebp+10H], 0                      ; 2A59 _ C7. 45, 10, 00000000
?_127:  mov     eax, dword [ebp+8H]                     ; 2A60 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 2A63 _ 8B. 40, 04
        cmp     eax, dword [ebp+14H]                    ; 2A66 _ 3B. 45, 14
        jge     ?_128                                   ; 2A69 _ 7D, 09
        mov     eax, dword [ebp+8H]                     ; 2A6B _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 2A6E _ 8B. 40, 04
        mov     dword [ebp+14H], eax                    ; 2A71 _ 89. 45, 14
?_128:  mov     eax, dword [ebp+8H]                     ; 2A74 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 2A77 _ 8B. 40, 08
        cmp     eax, dword [ebp+18H]                    ; 2A7A _ 3B. 45, 18
        jge     ?_129                                   ; 2A7D _ 7D, 09
        mov     eax, dword [ebp+8H]                     ; 2A7F _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 2A82 _ 8B. 40, 08
        mov     dword [ebp+18H], eax                    ; 2A85 _ 89. 45, 18
?_129:  mov     eax, dword [ebp+1CH]                    ; 2A88 _ 8B. 45, 1C
        mov     dword [ebp-24H], eax                    ; 2A8B _ 89. 45, DC
        jmp     ?_136                                   ; 2A8E _ E9, 00000119

?_130:  mov     eax, dword [ebp+8H]                     ; 2A93 _ 8B. 45, 08
        mov     edx, dword [ebp-24H]                    ; 2A96 _ 8B. 55, DC
        add     edx, 4                                  ; 2A99 _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 2A9C _ 8B. 44 90, 04
        mov     dword [ebp-10H], eax                    ; 2AA0 _ 89. 45, F0
        mov     eax, dword [ebp-10H]                    ; 2AA3 _ 8B. 45, F0
        mov     eax, dword [eax]                        ; 2AA6 _ 8B. 00
        mov     dword [ebp-0CH], eax                    ; 2AA8 _ 89. 45, F4
        mov     edx, dword [ebp-10H]                    ; 2AAB _ 8B. 55, F0
        mov     eax, dword [ebp+8H]                     ; 2AAE _ 8B. 45, 08
        add     eax, 1044                               ; 2AB1 _ 05, 00000414
        sub     edx, eax                                ; 2AB6 _ 29. C2
        mov     eax, edx                                ; 2AB8 _ 89. D0
        sar     eax, 5                                  ; 2ABA _ C1. F8, 05
        mov     byte [ebp-26H], al                      ; 2ABD _ 88. 45, DA
        mov     dword [ebp-1CH], 0                      ; 2AC0 _ C7. 45, E4, 00000000
        jmp     ?_135                                   ; 2AC7 _ E9, 000000CD

?_131:  mov     eax, dword [ebp-10H]                    ; 2ACC _ 8B. 45, F0
        mov     edx, dword [eax+10H]                    ; 2ACF _ 8B. 50, 10
        mov     eax, dword [ebp-1CH]                    ; 2AD2 _ 8B. 45, E4
        add     eax, edx                                ; 2AD5 _ 01. D0
        mov     dword [ebp-8H], eax                     ; 2AD7 _ 89. 45, F8
        mov     dword [ebp-20H], 0                      ; 2ADA _ C7. 45, E0, 00000000
        jmp     ?_134                                   ; 2AE1 _ E9, 000000A0

?_132:  mov     eax, dword [ebp-10H]                    ; 2AE6 _ 8B. 45, F0
        mov     edx, dword [eax+0CH]                    ; 2AE9 _ 8B. 50, 0C
        mov     eax, dword [ebp-20H]                    ; 2AEC _ 8B. 45, E0
        add     eax, edx                                ; 2AEF _ 01. D0
        mov     dword [ebp-4H], eax                     ; 2AF1 _ 89. 45, FC
        mov     eax, dword [ebp+0CH]                    ; 2AF4 _ 8B. 45, 0C
        cmp     eax, dword [ebp-4H]                     ; 2AF7 _ 3B. 45, FC
        jg      ?_133                                   ; 2AFA _ 0F 8F, 00000082
        mov     eax, dword [ebp-4H]                     ; 2B00 _ 8B. 45, FC
        cmp     eax, dword [ebp+14H]                    ; 2B03 _ 3B. 45, 14
        jge     ?_133                                   ; 2B06 _ 7D, 7A
        mov     eax, dword [ebp+10H]                    ; 2B08 _ 8B. 45, 10
        cmp     eax, dword [ebp-8H]                     ; 2B0B _ 3B. 45, F8
        jg      ?_133                                   ; 2B0E _ 7F, 72
        mov     eax, dword [ebp-8H]                     ; 2B10 _ 8B. 45, F8
        cmp     eax, dword [ebp+18H]                    ; 2B13 _ 3B. 45, 18
        jge     ?_133                                   ; 2B16 _ 7D, 6A
        mov     eax, dword [ebp-10H]                    ; 2B18 _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 2B1B _ 8B. 40, 04
        imul    eax, dword [ebp-1CH]                    ; 2B1E _ 0F AF. 45, E4
        mov     edx, eax                                ; 2B22 _ 89. C2
        mov     eax, dword [ebp-20H]                    ; 2B24 _ 8B. 45, E0
        add     eax, edx                                ; 2B27 _ 01. D0
        mov     edx, eax                                ; 2B29 _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 2B2B _ 8B. 45, F4
        add     eax, edx                                ; 2B2E _ 01. D0
        movzx   eax, byte [eax]                         ; 2B30 _ 0F B6. 00
        mov     byte [ebp-25H], al                      ; 2B33 _ 88. 45, DB
        movzx   edx, byte [ebp-25H]                     ; 2B36 _ 0F B6. 55, DB
        mov     eax, dword [ebp-10H]                    ; 2B3A _ 8B. 45, F0
        mov     eax, dword [eax+14H]                    ; 2B3D _ 8B. 40, 14
        cmp     edx, eax                                ; 2B40 _ 39. C2
        jz      ?_133                                   ; 2B42 _ 74, 3E
        mov     eax, dword [ebp+8H]                     ; 2B44 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 2B47 _ 8B. 40, 04
        imul    eax, dword [ebp-8H]                     ; 2B4A _ 0F AF. 45, F8
        mov     edx, eax                                ; 2B4E _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 2B50 _ 8B. 45, FC
        add     eax, edx                                ; 2B53 _ 01. D0
        mov     edx, eax                                ; 2B55 _ 89. C2
        mov     eax, dword [ebp-14H]                    ; 2B57 _ 8B. 45, EC
        add     eax, edx                                ; 2B5A _ 01. D0
        movzx   eax, byte [eax]                         ; 2B5C _ 0F B6. 00
        cmp     al, byte [ebp-26H]                      ; 2B5F _ 3A. 45, DA
        jnz     ?_133                                   ; 2B62 _ 75, 1E
        mov     eax, dword [ebp+8H]                     ; 2B64 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 2B67 _ 8B. 40, 04
        imul    eax, dword [ebp-8H]                     ; 2B6A _ 0F AF. 45, F8
        mov     edx, eax                                ; 2B6E _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 2B70 _ 8B. 45, FC
        add     eax, edx                                ; 2B73 _ 01. D0
        mov     edx, eax                                ; 2B75 _ 89. C2
        mov     eax, dword [ebp-18H]                    ; 2B77 _ 8B. 45, E8
        add     edx, eax                                ; 2B7A _ 01. C2
        movzx   eax, byte [ebp-25H]                     ; 2B7C _ 0F B6. 45, DB
        mov     byte [edx], al                          ; 2B80 _ 88. 02
?_133:  add     dword [ebp-20H], 1                      ; 2B82 _ 83. 45, E0, 01
?_134:  mov     eax, dword [ebp-10H]                    ; 2B86 _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 2B89 _ 8B. 40, 04
        cmp     eax, dword [ebp-20H]                    ; 2B8C _ 3B. 45, E0
        jg      ?_132                                   ; 2B8F _ 0F 8F, FFFFFF51
        add     dword [ebp-1CH], 1                      ; 2B95 _ 83. 45, E4, 01
?_135:  mov     eax, dword [ebp-10H]                    ; 2B99 _ 8B. 45, F0
        mov     eax, dword [eax+8H]                     ; 2B9C _ 8B. 40, 08
        cmp     eax, dword [ebp-1CH]                    ; 2B9F _ 3B. 45, E4
        jg      ?_131                                   ; 2BA2 _ 0F 8F, FFFFFF24
        add     dword [ebp-24H], 1                      ; 2BA8 _ 83. 45, DC, 01
?_136:  mov     eax, dword [ebp+8H]                     ; 2BAC _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 2BAF _ 8B. 40, 0C
        cmp     eax, dword [ebp-24H]                    ; 2BB2 _ 3B. 45, DC
        jge     ?_130                                   ; 2BB5 _ 0F 8D, FFFFFED8
        leave                                           ; 2BBB _ C9
        ret                                             ; 2BBC _ C3
; sheet_refresh_local End of function

sheet_refresh_map:; Function begin
        push    ebp                                     ; 2BBD _ 55
        mov     ebp, esp                                ; 2BBE _ 89. E5
        sub     esp, 64                                 ; 2BC0 _ 83. EC, 40
        mov     eax, dword [ebp+8H]                     ; 2BC3 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 2BC6 _ 8B. 00
        mov     dword [ebp-18H], eax                    ; 2BC8 _ 89. 45, E8
        mov     eax, dword [ebp+8H]                     ; 2BCB _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 2BCE _ 8B. 40, 10
        mov     dword [ebp-14H], eax                    ; 2BD1 _ 89. 45, EC
        cmp     dword [ebp+0CH], 0                      ; 2BD4 _ 83. 7D, 0C, 00
        jns     ?_137                                   ; 2BD8 _ 79, 07
        mov     dword [ebp+0CH], 0                      ; 2BDA _ C7. 45, 0C, 00000000
?_137:  cmp     dword [ebp+10H], 0                      ; 2BE1 _ 83. 7D, 10, 00
        jns     ?_138                                   ; 2BE5 _ 79, 07
        mov     dword [ebp+10H], 0                      ; 2BE7 _ C7. 45, 10, 00000000
?_138:  mov     eax, dword [ebp+8H]                     ; 2BEE _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 2BF1 _ 8B. 40, 04
        cmp     eax, dword [ebp+14H]                    ; 2BF4 _ 3B. 45, 14
        jge     ?_139                                   ; 2BF7 _ 7D, 09
        mov     eax, dword [ebp+8H]                     ; 2BF9 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 2BFC _ 8B. 40, 04
        mov     dword [ebp+14H], eax                    ; 2BFF _ 89. 45, 14
?_139:  mov     eax, dword [ebp+8H]                     ; 2C02 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 2C05 _ 8B. 40, 08
        cmp     eax, dword [ebp+18H]                    ; 2C08 _ 3B. 45, 18
        jge     ?_140                                   ; 2C0B _ 7D, 09
        mov     eax, dword [ebp+8H]                     ; 2C0D _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 2C10 _ 8B. 40, 08
        mov     dword [ebp+18H], eax                    ; 2C13 _ 89. 45, 18
?_140:  mov     eax, dword [ebp+1CH]                    ; 2C16 _ 8B. 45, 1C
        mov     dword [ebp-34H], eax                    ; 2C19 _ 89. 45, CC
        jmp     ?_151                                   ; 2C1C _ E9, 00000141

?_141:  mov     eax, dword [ebp+8H]                     ; 2C21 _ 8B. 45, 08
        mov     edx, dword [ebp-34H]                    ; 2C24 _ 8B. 55, CC
        add     edx, 4                                  ; 2C27 _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 2C2A _ 8B. 44 90, 04
        mov     dword [ebp-10H], eax                    ; 2C2E _ 89. 45, F0
        mov     edx, dword [ebp-10H]                    ; 2C31 _ 8B. 55, F0
        mov     eax, dword [ebp+8H]                     ; 2C34 _ 8B. 45, 08
        add     eax, 1044                               ; 2C37 _ 05, 00000414
        sub     edx, eax                                ; 2C3C _ 29. C2
        mov     eax, edx                                ; 2C3E _ 89. D0
        sar     eax, 5                                  ; 2C40 _ C1. F8, 05
        mov     byte [ebp-35H], al                      ; 2C43 _ 88. 45, CB
        mov     eax, dword [ebp-10H]                    ; 2C46 _ 8B. 45, F0
        mov     eax, dword [eax]                        ; 2C49 _ 8B. 00
        mov     dword [ebp-0CH], eax                    ; 2C4B _ 89. 45, F4
        mov     eax, dword [ebp-10H]                    ; 2C4E _ 8B. 45, F0
        mov     eax, dword [eax+0CH]                    ; 2C51 _ 8B. 40, 0C
        mov     edx, dword [ebp+0CH]                    ; 2C54 _ 8B. 55, 0C
        sub     edx, eax                                ; 2C57 _ 29. C2
        mov     eax, edx                                ; 2C59 _ 89. D0
        mov     dword [ebp-30H], eax                    ; 2C5B _ 89. 45, D0
        mov     eax, dword [ebp-10H]                    ; 2C5E _ 8B. 45, F0
        mov     eax, dword [eax+10H]                    ; 2C61 _ 8B. 40, 10
        mov     edx, dword [ebp+10H]                    ; 2C64 _ 8B. 55, 10
        sub     edx, eax                                ; 2C67 _ 29. C2
        mov     eax, edx                                ; 2C69 _ 89. D0
        mov     dword [ebp-2CH], eax                    ; 2C6B _ 89. 45, D4
        mov     eax, dword [ebp-10H]                    ; 2C6E _ 8B. 45, F0
        mov     eax, dword [eax+0CH]                    ; 2C71 _ 8B. 40, 0C
        mov     edx, dword [ebp+14H]                    ; 2C74 _ 8B. 55, 14
        sub     edx, eax                                ; 2C77 _ 29. C2
        mov     eax, edx                                ; 2C79 _ 89. D0
        mov     dword [ebp-28H], eax                    ; 2C7B _ 89. 45, D8
        mov     eax, dword [ebp-10H]                    ; 2C7E _ 8B. 45, F0
        mov     eax, dword [eax+10H]                    ; 2C81 _ 8B. 40, 10
        mov     edx, dword [ebp+18H]                    ; 2C84 _ 8B. 55, 18
        sub     edx, eax                                ; 2C87 _ 29. C2
        mov     eax, edx                                ; 2C89 _ 89. D0
        mov     dword [ebp-24H], eax                    ; 2C8B _ 89. 45, DC
        cmp     dword [ebp-30H], 0                      ; 2C8E _ 83. 7D, D0, 00
        jns     ?_142                                   ; 2C92 _ 79, 07
        mov     dword [ebp-30H], 0                      ; 2C94 _ C7. 45, D0, 00000000
?_142:  cmp     dword [ebp-2CH], 0                      ; 2C9B _ 83. 7D, D4, 00
        jns     ?_143                                   ; 2C9F _ 79, 07
        mov     dword [ebp-2CH], 0                      ; 2CA1 _ C7. 45, D4, 00000000
?_143:  mov     eax, dword [ebp-10H]                    ; 2CA8 _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 2CAB _ 8B. 40, 04
        cmp     eax, dword [ebp-28H]                    ; 2CAE _ 3B. 45, D8
        jge     ?_144                                   ; 2CB1 _ 7D, 09
        mov     eax, dword [ebp-10H]                    ; 2CB3 _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 2CB6 _ 8B. 40, 04
        mov     dword [ebp-28H], eax                    ; 2CB9 _ 89. 45, D8
?_144:  mov     eax, dword [ebp-10H]                    ; 2CBC _ 8B. 45, F0
        mov     eax, dword [eax+8H]                     ; 2CBF _ 8B. 40, 08
        cmp     eax, dword [ebp-24H]                    ; 2CC2 _ 3B. 45, DC
        jge     ?_145                                   ; 2CC5 _ 7D, 09
        mov     eax, dword [ebp-10H]                    ; 2CC7 _ 8B. 45, F0
        mov     eax, dword [eax+8H]                     ; 2CCA _ 8B. 40, 08
        mov     dword [ebp-24H], eax                    ; 2CCD _ 89. 45, DC
?_145:  mov     eax, dword [ebp-2CH]                    ; 2CD0 _ 8B. 45, D4
        mov     dword [ebp-1CH], eax                    ; 2CD3 _ 89. 45, E4
        jmp     ?_150                                   ; 2CD6 _ EB, 7A

?_146:  mov     eax, dword [ebp-10H]                    ; 2CD8 _ 8B. 45, F0
        mov     edx, dword [eax+10H]                    ; 2CDB _ 8B. 50, 10
        mov     eax, dword [ebp-1CH]                    ; 2CDE _ 8B. 45, E4
        add     eax, edx                                ; 2CE1 _ 01. D0
        mov     dword [ebp-8H], eax                     ; 2CE3 _ 89. 45, F8
        mov     eax, dword [ebp-30H]                    ; 2CE6 _ 8B. 45, D0
        mov     dword [ebp-20H], eax                    ; 2CE9 _ 89. 45, E0
        jmp     ?_149                                   ; 2CEC _ EB, 58

?_147:  mov     eax, dword [ebp-10H]                    ; 2CEE _ 8B. 45, F0
        mov     edx, dword [eax+0CH]                    ; 2CF1 _ 8B. 50, 0C
        mov     eax, dword [ebp-20H]                    ; 2CF4 _ 8B. 45, E0
        add     eax, edx                                ; 2CF7 _ 01. D0
        mov     dword [ebp-4H], eax                     ; 2CF9 _ 89. 45, FC
        mov     eax, dword [ebp-10H]                    ; 2CFC _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 2CFF _ 8B. 40, 04
        imul    eax, dword [ebp-1CH]                    ; 2D02 _ 0F AF. 45, E4
        mov     edx, eax                                ; 2D06 _ 89. C2
        mov     eax, dword [ebp-20H]                    ; 2D08 _ 8B. 45, E0
        add     eax, edx                                ; 2D0B _ 01. D0
        mov     edx, eax                                ; 2D0D _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 2D0F _ 8B. 45, F4
        add     eax, edx                                ; 2D12 _ 01. D0
        movzx   eax, byte [eax]                         ; 2D14 _ 0F B6. 00
        movzx   edx, al                                 ; 2D17 _ 0F B6. D0
        mov     eax, dword [ebp-10H]                    ; 2D1A _ 8B. 45, F0
        mov     eax, dword [eax+14H]                    ; 2D1D _ 8B. 40, 14
        cmp     edx, eax                                ; 2D20 _ 39. C2
        jz      ?_148                                   ; 2D22 _ 74, 1E
        mov     eax, dword [ebp+8H]                     ; 2D24 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 2D27 _ 8B. 40, 04
        imul    eax, dword [ebp-8H]                     ; 2D2A _ 0F AF. 45, F8
        mov     edx, eax                                ; 2D2E _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 2D30 _ 8B. 45, FC
        add     eax, edx                                ; 2D33 _ 01. D0
        mov     edx, eax                                ; 2D35 _ 89. C2
        mov     eax, dword [ebp-14H]                    ; 2D37 _ 8B. 45, EC
        add     edx, eax                                ; 2D3A _ 01. C2
        movzx   eax, byte [ebp-35H]                     ; 2D3C _ 0F B6. 45, CB
        mov     byte [edx], al                          ; 2D40 _ 88. 02
?_148:  add     dword [ebp-20H], 1                      ; 2D42 _ 83. 45, E0, 01
?_149:  mov     eax, dword [ebp-20H]                    ; 2D46 _ 8B. 45, E0
        cmp     eax, dword [ebp-28H]                    ; 2D49 _ 3B. 45, D8
        jl      ?_147                                   ; 2D4C _ 7C, A0
        add     dword [ebp-1CH], 1                      ; 2D4E _ 83. 45, E4, 01
?_150:  mov     eax, dword [ebp-1CH]                    ; 2D52 _ 8B. 45, E4
        cmp     eax, dword [ebp-24H]                    ; 2D55 _ 3B. 45, DC
        jl      ?_146                                   ; 2D58 _ 0F 8C, FFFFFF7A
        add     dword [ebp-34H], 1                      ; 2D5E _ 83. 45, CC, 01
?_151:  mov     eax, dword [ebp+8H]                     ; 2D62 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 2D65 _ 8B. 40, 0C
        cmp     eax, dword [ebp-34H]                    ; 2D68 _ 3B. 45, CC
        jge     ?_141                                   ; 2D6B _ 0F 8D, FFFFFEB0
        leave                                           ; 2D71 _ C9
        ret                                             ; 2D72 _ C3
; sheet_refresh_map End of function

init_time_port:; Function begin
        push    ebp                                     ; 2D73 _ 55
        mov     ebp, esp                                ; 2D74 _ 89. E5
        sub     esp, 24                                 ; 2D76 _ 83. EC, 18
        mov     dword [esp+4H], 52                      ; 2D79 _ C7. 44 24, 04, 00000034
        mov     dword [esp], 67                         ; 2D81 _ C7. 04 24, 00000043
        call    io_out8                                 ; 2D88 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 156                     ; 2D8D _ C7. 44 24, 04, 0000009C
        mov     dword [esp], 64                         ; 2D95 _ C7. 04 24, 00000040
        call    io_out8                                 ; 2D9C _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 46                      ; 2DA1 _ C7. 44 24, 04, 0000002E
        mov     dword [esp], 64                         ; 2DA9 _ C7. 04 24, 00000040
        call    io_out8                                 ; 2DB0 _ E8, FFFFFFFC(rel)
        mov     dword [timer_control], 0                ; 2DB5 _ C7. 05, 000002A0(d), 00000000
        leave                                           ; 2DBF _ C9
        ret                                             ; 2DC0 _ C3
; init_time_port End of function

get_timer_control:; Function begin
        push    ebp                                     ; 2DC1 _ 55
        mov     ebp, esp                                ; 2DC2 _ 89. E5
        mov     eax, timer_control                      ; 2DC4 _ B8, 000002A0(d)
        pop     ebp                                     ; 2DC9 _ 5D
        ret                                             ; 2DCA _ C3
; get_timer_control End of function

timer_alloc:; Function begin
        push    ebp                                     ; 2DCB _ 55
        mov     ebp, esp                                ; 2DCC _ 89. E5
        sub     esp, 16                                 ; 2DCE _ 83. EC, 10
        mov     dword [ebp-4H], 0                       ; 2DD1 _ C7. 45, FC, 00000000
        jmp     ?_154                                   ; 2DD8 _ EB, 26

?_152:  mov     eax, dword [ebp-4H]                     ; 2DDA _ 8B. 45, FC
        shl     eax, 4                                  ; 2DDD _ C1. E0, 04
        add     eax, timer_control                      ; 2DE0 _ 05, 000002A0(d)
        mov     eax, dword [eax+8H]                     ; 2DE5 _ 8B. 40, 08
        test    eax, eax                                ; 2DE8 _ 85. C0
        jnz     ?_153                                   ; 2DEA _ 75, 10
        mov     eax, dword [ebp-4H]                     ; 2DEC _ 8B. 45, FC
        shl     eax, 4                                  ; 2DEF _ C1. E0, 04
        add     eax, timer_control                      ; 2DF2 _ 05, 000002A0(d)
        add     eax, 4                                  ; 2DF7 _ 83. C0, 04
        jmp     ?_155                                   ; 2DFA _ EB, 0D

?_153:  add     dword [ebp-4H], 1                       ; 2DFC _ 83. 45, FC, 01
?_154:  cmp     dword [ebp-4H], 499                     ; 2E00 _ 81. 7D, FC, 000001F3
        jle     ?_152                                   ; 2E07 _ 7E, D1
?_155:  leave                                           ; 2E09 _ C9
        ret                                             ; 2E0A _ C3
; timer_alloc End of function

timer_free:; Function begin
        push    ebp                                     ; 2E0B _ 55
        mov     ebp, esp                                ; 2E0C _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 2E0E _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 2E11 _ C7. 40, 04, 00000000
        pop     ebp                                     ; 2E18 _ 5D
        ret                                             ; 2E19 _ C3
; timer_free End of function

timer_init:; Function begin
        push    ebp                                     ; 2E1A _ 55
        mov     ebp, esp                                ; 2E1B _ 89. E5
        sub     esp, 4                                  ; 2E1D _ 83. EC, 04
        mov     eax, dword [ebp+10H]                    ; 2E20 _ 8B. 45, 10
        mov     byte [ebp-4H], al                       ; 2E23 _ 88. 45, FC
        mov     eax, dword [ebp+8H]                     ; 2E26 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 2E29 _ 8B. 55, 0C
        mov     dword [eax+8H], edx                     ; 2E2C _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 2E2F _ 8B. 45, 08
        movzx   edx, byte [ebp-4H]                      ; 2E32 _ 0F B6. 55, FC
        mov     byte [eax+0CH], dl                      ; 2E36 _ 88. 50, 0C
        leave                                           ; 2E39 _ C9
        ret                                             ; 2E3A _ C3
; timer_init End of function

timer_settime:; Function begin
        push    ebp                                     ; 2E3B _ 55
        mov     ebp, esp                                ; 2E3C _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 2E3E _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 2E41 _ 8B. 55, 0C
        mov     dword [eax], edx                        ; 2E44 _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 2E46 _ 8B. 45, 08
        mov     dword [eax+4H], 2                       ; 2E49 _ C7. 40, 04, 00000002
        pop     ebp                                     ; 2E50 _ 5D
        ret                                             ; 2E51 _ C3
; timer_settime End of function

intHandlerTimer:; Function begin
        push    ebp                                     ; 2E52 _ 55
        mov     ebp, esp                                ; 2E53 _ 89. E5
        sub     esp, 40                                 ; 2E55 _ 83. EC, 28
        mov     dword [esp+4H], 96                      ; 2E58 _ C7. 44 24, 04, 00000060
        mov     dword [esp], 32                         ; 2E60 _ C7. 04 24, 00000020
        call    io_out8                                 ; 2E67 _ E8, FFFFFFFC(rel)
        mov     eax, dword [timer_control]              ; 2E6C _ A1, 000002A0(d)
        add     eax, 1                                  ; 2E71 _ 83. C0, 01
        mov     dword [timer_control], eax              ; 2E74 _ A3, 000002A0(d)
        mov     dword [ebp-0CH], 0                      ; 2E79 _ C7. 45, F4, 00000000
        jmp     ?_158                                   ; 2E80 _ E9, 00000086

?_156:  mov     eax, dword [ebp-0CH]                    ; 2E85 _ 8B. 45, F4
        shl     eax, 4                                  ; 2E88 _ C1. E0, 04
        add     eax, timer_control                      ; 2E8B _ 05, 000002A0(d)
        mov     eax, dword [eax+8H]                     ; 2E90 _ 8B. 40, 08
        cmp     eax, 2                                  ; 2E93 _ 83. F8, 02
        jnz     ?_157                                   ; 2E96 _ 75, 6F
        mov     eax, dword [ebp-0CH]                    ; 2E98 _ 8B. 45, F4
        shl     eax, 4                                  ; 2E9B _ C1. E0, 04
        add     eax, timer_control                      ; 2E9E _ 05, 000002A0(d)
        mov     eax, dword [eax+4H]                     ; 2EA3 _ 8B. 40, 04
        lea     edx, [eax-1H]                           ; 2EA6 _ 8D. 50, FF
        mov     eax, dword [ebp-0CH]                    ; 2EA9 _ 8B. 45, F4
        shl     eax, 4                                  ; 2EAC _ C1. E0, 04
        add     eax, timer_control                      ; 2EAF _ 05, 000002A0(d)
        mov     dword [eax+4H], edx                     ; 2EB4 _ 89. 50, 04
        mov     eax, dword [ebp-0CH]                    ; 2EB7 _ 8B. 45, F4
        shl     eax, 4                                  ; 2EBA _ C1. E0, 04
        add     eax, timer_control                      ; 2EBD _ 05, 000002A0(d)
        mov     eax, dword [eax+4H]                     ; 2EC2 _ 8B. 40, 04
        test    eax, eax                                ; 2EC5 _ 85. C0
        jnz     ?_157                                   ; 2EC7 _ 75, 3E
        mov     eax, dword [ebp-0CH]                    ; 2EC9 _ 8B. 45, F4
        shl     eax, 4                                  ; 2ECC _ C1. E0, 04
        add     eax, timer_control                      ; 2ECF _ 05, 000002A0(d)
        mov     dword [eax+8H], 1                       ; 2ED4 _ C7. 40, 08, 00000001
        mov     eax, dword [ebp-0CH]                    ; 2EDB _ 8B. 45, F4
        shl     eax, 4                                  ; 2EDE _ C1. E0, 04
        add     eax, timer_control                      ; 2EE1 _ 05, 000002A0(d)
        movzx   eax, byte [eax+10H]                     ; 2EE6 _ 0F B6. 40, 10
        movzx   edx, al                                 ; 2EEA _ 0F B6. D0
        mov     eax, dword [ebp-0CH]                    ; 2EED _ 8B. 45, F4
        shl     eax, 4                                  ; 2EF0 _ C1. E0, 04
        add     eax, timer_control                      ; 2EF3 _ 05, 000002A0(d)
        mov     eax, dword [eax+0CH]                    ; 2EF8 _ 8B. 40, 0C
        mov     dword [esp+4H], edx                     ; 2EFB _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 2EFF _ 89. 04 24
        call    fifo8_put                               ; 2F02 _ E8, FFFFFFFC(rel)
?_157:  add     dword [ebp-0CH], 1                      ; 2F07 _ 83. 45, F4, 01
?_158:  cmp     dword [ebp-0CH], 499                    ; 2F0B _ 81. 7D, F4, 000001F3
        jle     ?_156                                   ; 2F12 _ 0F 8E, FFFFFF6D
        leave                                           ; 2F18 _ C9
        ret                                             ; 2F19 _ C3
; intHandlerTimer End of function



?_159:                                                  ; byte
        db 77H, 69H, 6EH, 64H, 6FH, 77H, 00H            ; 0000 _ window.

?_160:                                                  ; byte
        db 5BH, 35H, 20H, 73H, 65H, 63H, 5DH, 00H       ; 0007 _ [5 sec].

?_161:                                                  ; byte
        db 5BH, 33H, 20H, 73H, 65H, 63H, 5DH, 00H       ; 000F _ [3 sec].

?_162:                                                  ; byte
        db 69H, 6DH, 70H, 72H, 6FH, 76H, 65H, 20H       ; 0017 _ improve 
        db 73H, 74H, 72H, 69H, 6EH, 67H, 20H, 73H       ; 001F _ string s
        db 68H, 6FH, 77H, 69H, 6EH, 67H, 00H            ; 0027 _ howing.

?_163:                                                  ; byte
        db 70H, 61H, 67H, 65H, 20H, 69H, 73H, 3AH       ; 002E _ page is:
        db 20H, 00H                                     ; 0036 _  .

?_164:                                                  ; byte
        db 42H, 61H, 73H, 65H, 41H, 64H, 64H, 72H       ; 0038 _ BaseAddr
        db 4CH, 3AH, 20H, 00H                           ; 0040 _ L: .

?_165:                                                  ; byte
        db 42H, 61H, 73H, 65H, 41H, 64H, 64H, 72H       ; 0044 _ BaseAddr
        db 48H, 3AH, 20H, 00H                           ; 004C _ H: .

?_166:                                                  ; byte
        db 6CH, 65H, 6EH, 67H, 74H, 68H, 4CH, 6FH       ; 0050 _ lengthLo
        db 77H, 3AH, 20H, 00H                           ; 0058 _ w: .

?_167:                                                  ; byte
        db 6CH, 65H, 6EH, 67H, 74H, 68H, 48H, 69H       ; 005C _ lengthHi
        db 67H, 68H, 3AH, 20H, 00H                      ; 0064 _ gh: .

?_168:                                                  ; byte
        db 74H, 79H, 70H, 65H, 3AH, 20H, 00H            ; 0069 _ type: .



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

table_rgb.1621:                                         ; byte
        db 00H, 00H, 00H, 0FFH, 00H, 00H, 44H, 8CH      ; 0080 _ ......D.
        db 0BBH, 0FFH, 0FFH, 00H, 00H, 00H, 0FFH, 0FFH  ; 0088 _ ........
        db 00H, 0FFH, 00H, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH ; 0090 _ ........
        db 0C6H, 0C6H, 0C6H, 84H, 00H, 00H, 00H, 84H    ; 0098 _ ........
        db 00H, 84H, 84H, 00H, 00H, 00H, 84H, 84H       ; 00A0 _ ........
        db 00H, 84H, 00H, 84H, 84H, 84H, 84H, 84H       ; 00A8 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 00B0 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 00B8 _ ........

cursor.1689:                                            ; byte
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

closebtn.1767:                                          ; byte
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

?_169:  db 00H                                          ; 02A2 _ .

?_170:  db 00H, 00H                                     ; 02A3 _ ..



timerinfo1.1648:                                        ; byte
        resb    24                                      ; 0000

timerbuf1.1651:                                         ; qword
        resq    1                                       ; 0018

timerinfo2.1649:                                        ; byte
        resb    24                                      ; 0020

timerbuf2.1652:                                         ; qword
        resq    1                                       ; 0038

timerinfo3.1650:                                        ; byte
        resb    24                                      ; 0040

timerbuf3.1653:                                         ; qword
        resq    1                                       ; 0058

screen_info:                                            ; qword
        resb    4                                       ; 0060

?_171:  resw    1                                       ; 0064

?_172:  resw    13                                      ; 0066

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

?_173:  resb    9                                       ; 0281

?_174:  resb    22                                      ; 028A

timer_control:                                          ; byte
        resd    2001                                    ; 02A0


