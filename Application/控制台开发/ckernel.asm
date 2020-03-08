; Disassembly of file: ckernel.o
; Sun Mar  8 17:33:41 2020
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
        mov     dword [ebp-3CH], eax                    ; 0018 _ 89. 45, C4
        movzx   eax, word [screen_info+4H]              ; 001B _ 0F B7. 05, 00000004(d)
        cwde                                            ; 0022 _ 98
        mov     dword [ebp-38H], eax                    ; 0023 _ 89. 45, C8
        movzx   eax, word [screen_info+6H]              ; 0026 _ 0F B7. 05, 00000006(d)
        cwde                                            ; 002D _ 98
        mov     dword [ebp-34H], eax                    ; 002E _ 89. 45, CC
        mov     eax, dword [memman]                     ; 0031 _ A1, 00000000(d)
        mov     dword [esp], eax                        ; 0036 _ 89. 04 24
        call    memman_init                             ; 0039 _ E8, FFFFFFFC(rel)
        mov     eax, dword [memman]                     ; 003E _ A1, 00000000(d)
        mov     dword [esp+8H], 1072594944              ; 0043 _ C7. 44 24, 08, 3FEE8000
        mov     dword [esp+4H], 17301504                ; 004B _ C7. 44 24, 04, 01080000
        mov     dword [esp], eax                        ; 0053 _ 89. 04 24
        call    memman_free                             ; 0056 _ E8, FFFFFFFC(rel)
        mov     eax, dword [memman]                     ; 005B _ A1, 00000000(d)
        mov     edx, dword [ebp-34H]                    ; 0060 _ 8B. 55, CC
        mov     dword [esp+0CH], edx                    ; 0063 _ 89. 54 24, 0C
        mov     edx, dword [ebp-38H]                    ; 0067 _ 8B. 55, C8
        mov     dword [esp+8H], edx                     ; 006A _ 89. 54 24, 08
        mov     edx, dword [ebp-3CH]                    ; 006E _ 8B. 55, C4
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
        mov     eax, dword [ebp-38H]                    ; 00A6 _ 8B. 45, C8
        imul    eax, dword [ebp-34H]                    ; 00A9 _ 0F AF. 45, CC
        mov     edx, eax                                ; 00AD _ 89. C2
        mov     eax, dword [memman]                     ; 00AF _ A1, 00000000(d)
        mov     dword [esp+4H], edx                     ; 00B4 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 00B8 _ 89. 04 24
        call    memman_alloc_4k                         ; 00BB _ E8, FFFFFFFC(rel)
        mov     dword [back_buf], eax                   ; 00C0 _ A3, 00000000(d)
        mov     edx, dword [back_buf]                   ; 00C5 _ 8B. 15, 00000000(d)
        mov     eax, dword [back_sheet]                 ; 00CB _ A1, 00000004(d)
        mov     dword [esp+10H], 99                     ; 00D0 _ C7. 44 24, 10, 00000063
        mov     ecx, dword [ebp-34H]                    ; 00D8 _ 8B. 4D, CC
        mov     dword [esp+0CH], ecx                    ; 00DB _ 89. 4C 24, 0C
        mov     ecx, dword [ebp-38H]                    ; 00DF _ 8B. 4D, C8
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
        mov     dword [ebp-30H], eax                    ; 0138 _ 89. 45, D0
        call    init_time_port                          ; 013B _ E8, FFFFFFFC(rel)
        mov     dword [esp+0CH], 0                      ; 0140 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], timerbuf1.1736          ; 0148 _ C7. 44 24, 08, 00000028(d)
        mov     dword [esp+4H], 8                       ; 0150 _ C7. 44 24, 04, 00000008
        mov     dword [esp], timerinfo1.1733            ; 0158 _ C7. 04 24, 0000000C(d)
        call    fifo8_init                              ; 015F _ E8, FFFFFFFC(rel)
        call    timer_alloc                             ; 0164 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-2CH], eax                    ; 0169 _ 89. 45, D4
        mov     dword [esp+8H], 1                       ; 016C _ C7. 44 24, 08, 00000001
        mov     dword [esp+4H], timerinfo1.1733         ; 0174 _ C7. 44 24, 04, 0000000C(d)
        mov     eax, dword [ebp-2CH]                    ; 017C _ 8B. 45, D4
        mov     dword [esp], eax                        ; 017F _ 89. 04 24
        call    timer_init                              ; 0182 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 100                     ; 0187 _ C7. 44 24, 04, 00000064
        mov     eax, dword [ebp-2CH]                    ; 018F _ 8B. 45, D4
        mov     dword [esp], eax                        ; 0192 _ 89. 04 24
        call    timer_settime                           ; 0195 _ E8, FFFFFFFC(rel)
        mov     dword [esp+0CH], 0                      ; 019A _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], timerbuf2.1737          ; 01A2 _ C7. 44 24, 08, 0000004C(d)
        mov     dword [esp+4H], 8                       ; 01AA _ C7. 44 24, 04, 00000008
        mov     dword [esp], timerinfo2.1734            ; 01B2 _ C7. 04 24, 00000030(d)
        call    fifo8_init                              ; 01B9 _ E8, FFFFFFFC(rel)
        call    timer_alloc                             ; 01BE _ E8, FFFFFFFC(rel)
        mov     dword [ebp-28H], eax                    ; 01C3 _ 89. 45, D8
        mov     dword [esp+8H], 1                       ; 01C6 _ C7. 44 24, 08, 00000001
        mov     dword [esp+4H], timerinfo2.1734         ; 01CE _ C7. 44 24, 04, 00000030(d)
        mov     eax, dword [ebp-28H]                    ; 01D6 _ 8B. 45, D8
        mov     dword [esp], eax                        ; 01D9 _ 89. 04 24
        call    timer_init                              ; 01DC _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 300                     ; 01E1 _ C7. 44 24, 04, 0000012C
        mov     eax, dword [ebp-28H]                    ; 01E9 _ 8B. 45, D8
        mov     dword [esp], eax                        ; 01EC _ 89. 04 24
        call    timer_settime                           ; 01EF _ E8, FFFFFFFC(rel)
        mov     dword [esp+0CH], 0                      ; 01F4 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], timerbuf3.1738          ; 01FC _ C7. 44 24, 08, 00000070(d)
        mov     dword [esp+4H], 8                       ; 0204 _ C7. 44 24, 04, 00000008
        mov     dword [esp], timerinfo3.1735            ; 020C _ C7. 04 24, 00000054(d)
        call    fifo8_init                              ; 0213 _ E8, FFFFFFFC(rel)
        call    timer_alloc                             ; 0218 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-24H], eax                    ; 021D _ 89. 45, DC
        mov     dword [esp+8H], 1                       ; 0220 _ C7. 44 24, 08, 00000001
        mov     dword [esp+4H], timerinfo3.1735         ; 0228 _ C7. 44 24, 04, 00000054(d)
        mov     eax, dword [ebp-24H]                    ; 0230 _ 8B. 45, DC
        mov     dword [esp], eax                        ; 0233 _ 89. 04 24
        call    timer_init                              ; 0236 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 50                      ; 023B _ C7. 44 24, 04, 00000032
        mov     eax, dword [ebp-24H]                    ; 0243 _ 8B. 45, DC
        mov     dword [esp], eax                        ; 0246 _ 89. 04 24
        call    timer_settime                           ; 0249 _ E8, FFFFFFFC(rel)
        call    io_sti                                  ; 024E _ E8, FFFFFFFC(rel)
        mov     eax, dword [back_buf]                   ; 0253 _ A1, 00000000(d)
        mov     edx, dword [ebp-34H]                    ; 0258 _ 8B. 55, CC
        mov     dword [esp+8H], edx                     ; 025B _ 89. 54 24, 08
        mov     edx, dword [ebp-38H]                    ; 025F _ 8B. 55, C8
        mov     dword [esp+4H], edx                     ; 0262 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0266 _ 89. 04 24
        call    init_desktop                            ; 0269 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 99                      ; 026E _ C7. 44 24, 04, 00000063
        mov     dword [esp], mouse_cursor_buf           ; 0276 _ C7. 04 24, 00000000(d)
        call    init_mouse_cursor                       ; 027D _ E8, FFFFFFFC(rel)
        mov     edx, dword [back_sheet]                 ; 0282 _ 8B. 15, 00000004(d)
        mov     eax, dword [sheet_control]              ; 0288 _ A1, 00000000(d)
        mov     dword [esp+0CH], 0                      ; 028D _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 0                       ; 0295 _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], edx                     ; 029D _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 02A1 _ 89. 04 24
        call    sheet_slide                             ; 02A4 _ E8, FFFFFFFC(rel)
        mov     ebx, dword [mouse_y]                    ; 02A9 _ 8B. 1D, 00000000(d)
        mov     ecx, dword [mouse_x]                    ; 02AF _ 8B. 0D, 00000000(d)
        mov     edx, dword [mouse_sheet]                ; 02B5 _ 8B. 15, 00000008(d)
        mov     eax, dword [sheet_control]              ; 02BB _ A1, 00000000(d)
        mov     dword [esp+0CH], ebx                    ; 02C0 _ 89. 5C 24, 0C
        mov     dword [esp+8H], ecx                     ; 02C4 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 02C8 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 02CC _ 89. 04 24
        call    sheet_slide                             ; 02CF _ E8, FFFFFFFC(rel)
        mov     eax, dword [sheet_control]              ; 02D4 _ A1, 00000000(d)
        mov     dword [esp+4H], ?_203                   ; 02D9 _ C7. 44 24, 04, 00000000(d)
        mov     dword [esp], eax                        ; 02E1 _ 89. 04 24
        call    message_box                             ; 02E4 _ E8, FFFFFFFC(rel)
        mov     dword [sheet_win], eax                  ; 02E9 _ A3, 00000000(d)
        mov     edx, dword [back_sheet]                 ; 02EE _ 8B. 15, 00000004(d)
        mov     eax, dword [sheet_control]              ; 02F4 _ A1, 00000000(d)
        mov     dword [esp+8H], 0                       ; 02F9 _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], edx                     ; 0301 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0305 _ 89. 04 24
        call    sheet_updown                            ; 0308 _ E8, FFFFFFFC(rel)
        mov     edx, dword [mouse_sheet]                ; 030D _ 8B. 15, 00000008(d)
        mov     eax, dword [sheet_control]              ; 0313 _ A1, 00000000(d)
        mov     dword [esp+8H], 100                     ; 0318 _ C7. 44 24, 08, 00000064
        mov     dword [esp+4H], edx                     ; 0320 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0324 _ 89. 04 24
        call    sheet_updown                            ; 0327 _ E8, FFFFFFFC(rel)
        call    enable_mouse                            ; 032C _ E8, FFFFFFFC(rel)
        call    get_code32_addr                         ; 0331 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-20H], eax                    ; 0336 _ 89. 45, E0
        call    get_addr_gdt                            ; 0339 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-1CH], eax                    ; 033E _ 89. 45, E4
        mov     eax, dword [memman]                     ; 0341 _ A1, 00000000(d)
        mov     dword [esp], eax                        ; 0346 _ 89. 04 24
        call    task_init                               ; 0349 _ E8, FFFFFFFC(rel)
        mov     dword [task_a.1746], eax                ; 034E _ A3, 00000078(d)
        mov     eax, dword [task_a.1746]                ; 0353 _ A1, 00000078(d)
        mov     dword [keyinfo+18H], eax                ; 0358 _ A3, 00000018(d)
        mov     eax, dword [task_a.1746]                ; 035D _ A1, 00000078(d)
        mov     dword [esp+8H], 0                       ; 0362 _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], 0                       ; 036A _ C7. 44 24, 04, 00000000
        mov     dword [esp], eax                        ; 0372 _ 89. 04 24
        call    task_run                                ; 0375 _ E8, FFFFFFFC(rel)
        call    launch_console                          ; 037A _ E8, FFFFFFFC(rel)
        mov     dword [ebp-18H], 0                      ; 037F _ C7. 45, E8, 00000000
        mov     dword [ebp-14H], 0                      ; 0386 _ C7. 45, EC, 00000000
        mov     dword [ebp-10H], 0                      ; 038D _ C7. 45, F0, 00000000
        mov     dword [ebp-4CH], 8                      ; 0394 _ C7. 45, B4, 00000008
        mov     dword [ebp-48H], 7                      ; 039B _ C7. 45, B8, 00000007
        mov     dword [ebp-44H], 0                      ; 03A2 _ C7. 45, BC, 00000000
        mov     dword [ebp-40H], 0                      ; 03A9 _ C7. 45, C0, 00000000
?_001:  call    io_cli                                  ; 03B0 _ E8, FFFFFFFC(rel)
        mov     dword [esp], keyinfo                    ; 03B5 _ C7. 04 24, 00000000(d)
        call    fifo8_status                            ; 03BC _ E8, FFFFFFFC(rel)
        mov     ebx, eax                                ; 03C1 _ 89. C3
        mov     dword [esp], mouseinfo                  ; 03C3 _ C7. 04 24, 00000000(d)
        call    fifo8_status                            ; 03CA _ E8, FFFFFFFC(rel)
        add     ebx, eax                                ; 03CF _ 01. C3
        mov     dword [esp], timerinfo1.1733            ; 03D1 _ C7. 04 24, 0000000C(d)
        call    fifo8_status                            ; 03D8 _ E8, FFFFFFFC(rel)
        add     ebx, eax                                ; 03DD _ 01. C3
        mov     dword [esp], timerinfo2.1734            ; 03DF _ C7. 04 24, 00000030(d)
        call    fifo8_status                            ; 03E6 _ E8, FFFFFFFC(rel)
        add     ebx, eax                                ; 03EB _ 01. C3
        mov     dword [esp], timerinfo3.1735            ; 03ED _ C7. 04 24, 00000054(d)
        call    fifo8_status                            ; 03F4 _ E8, FFFFFFFC(rel)
        add     eax, ebx                                ; 03F9 _ 01. D8
        test    eax, eax                                ; 03FB _ 85. C0
        jnz     ?_002                                   ; 03FD _ 75, 0A
        call    io_sti                                  ; 03FF _ E8, FFFFFFFC(rel)
        jmp     ?_010                                   ; 0404 _ E9, 000003B4

?_002:  mov     dword [esp], keyinfo                    ; 0409 _ C7. 04 24, 00000000(d)
        call    fifo8_status                            ; 0410 _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 0415 _ 85. C0
        je      ?_004                                   ; 0417 _ 0F 84, 0000019D
        call    io_sti                                  ; 041D _ E8, FFFFFFFC(rel)
        mov     dword [esp], keyinfo                    ; 0422 _ C7. 04 24, 00000000(d)
        call    fifo8_get                               ; 0429 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-18H], eax                    ; 042E _ 89. 45, E8
        cmp     dword [ebp-18H], 128                    ; 0431 _ 81. 7D, E8, 00000080
        jle     ?_003                                   ; 0438 _ 7E, 05
        jmp     ?_010                                   ; 043A _ E9, 0000037E

?_003:  cmp     dword [ebp-18H], 28                     ; 043F _ 83. 7D, E8, 1C
        je      ?_010                                   ; 0443 _ 0F 84, 00000374
        mov     eax, dword [ebp-18H]                    ; 0449 _ 8B. 45, E8
        add     eax, keytable                           ; 044C _ 05, 00000000(d)
        movzx   eax, byte [eax]                         ; 0451 _ 0F B6. 00
        test    al, al                                  ; 0454 _ 84. C0
        je      ?_010                                   ; 0456 _ 0F 84, 00000361
        cmp     dword [ebp-4CH], 143                    ; 045C _ 81. 7D, B4, 0000008F
        jg      ?_010                                   ; 0463 _ 0F 8F, 00000354
        mov     eax, dword [ebp-4CH]                    ; 0469 _ 8B. 45, B4
        lea     ecx, [eax+7H]                           ; 046C _ 8D. 48, 07
        mov     eax, dword [sheet_win]                  ; 046F _ A1, 00000000(d)
        mov     edx, dword [eax+4H]                     ; 0474 _ 8B. 50, 04
        mov     eax, dword [sheet_win]                  ; 0477 _ A1, 00000000(d)
        mov     eax, dword [eax]                        ; 047C _ 8B. 00
        mov     dword [esp+18H], 43                     ; 047E _ C7. 44 24, 18, 0000002B
        mov     dword [esp+14H], ecx                    ; 0486 _ 89. 4C 24, 14
        mov     dword [esp+10H], 28                     ; 048A _ C7. 44 24, 10, 0000001C
        mov     ecx, dword [ebp-4CH]                    ; 0492 _ 8B. 4D, B4
        mov     dword [esp+0CH], ecx                    ; 0495 _ 89. 4C 24, 0C
        mov     dword [esp+8H], 7                       ; 0499 _ C7. 44 24, 08, 00000007
        mov     dword [esp+4H], edx                     ; 04A1 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 04A5 _ 89. 04 24
        call    paint_rectangle                         ; 04A8 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-4CH]                    ; 04AD _ 8B. 45, B4
        lea     ecx, [eax+8H]                           ; 04B0 _ 8D. 48, 08
        mov     edx, dword [sheet_win]                  ; 04B3 _ 8B. 15, 00000000(d)
        mov     eax, dword [sheet_control]              ; 04B9 _ A1, 00000000(d)
        mov     dword [esp+14H], 44                     ; 04BE _ C7. 44 24, 14, 0000002C
        mov     dword [esp+10H], ecx                    ; 04C6 _ 89. 4C 24, 10
        mov     dword [esp+0CH], 28                     ; 04CA _ C7. 44 24, 0C, 0000001C
        mov     ecx, dword [ebp-4CH]                    ; 04D2 _ 8B. 4D, B4
        mov     dword [esp+8H], ecx                     ; 04D5 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 04D9 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 04DD _ 89. 04 24
        call    sheet_refresh                           ; 04E0 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-18H]                    ; 04E5 _ 8B. 45, E8
        add     eax, keytable                           ; 04E8 _ 05, 00000000(d)
        movzx   eax, byte [eax]                         ; 04ED _ 0F B6. 00
        mov     byte [ebp-4EH], al                      ; 04F0 _ 88. 45, B2
        mov     byte [ebp-4DH], 0                       ; 04F3 _ C6. 45, B3, 00
        mov     edx, dword [sheet_win]                  ; 04F7 _ 8B. 15, 00000000(d)
        mov     eax, dword [sheet_control]              ; 04FD _ A1, 00000000(d)
        mov     dword [esp+14H], 0                      ; 0502 _ C7. 44 24, 14, 00000000
        lea     ecx, [ebp-4EH]                          ; 050A _ 8D. 4D, B2
        mov     dword [esp+10H], ecx                    ; 050D _ 89. 4C 24, 10
        mov     dword [esp+0CH], 28                     ; 0511 _ C7. 44 24, 0C, 0000001C
        mov     ecx, dword [ebp-4CH]                    ; 0519 _ 8B. 4D, B4
        mov     dword [esp+8H], ecx                     ; 051C _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 0520 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0524 _ 89. 04 24
        call    paint_string                            ; 0527 _ E8, FFFFFFFC(rel)
        add     dword [ebp-4CH], 8                      ; 052C _ 83. 45, B4, 08
        mov     dword [ebp-40H], 1                      ; 0530 _ C7. 45, C0, 00000001
        mov     eax, dword [ebp-4CH]                    ; 0537 _ 8B. 45, B4
        lea     ebx, [eax+7H]                           ; 053A _ 8D. 58, 07
        mov     eax, dword [ebp-48H]                    ; 053D _ 8B. 45, B8
        movzx   ecx, al                                 ; 0540 _ 0F B6. C8
        mov     eax, dword [sheet_win]                  ; 0543 _ A1, 00000000(d)
        mov     edx, dword [eax+4H]                     ; 0548 _ 8B. 50, 04
        mov     eax, dword [sheet_win]                  ; 054B _ A1, 00000000(d)
        mov     eax, dword [eax]                        ; 0550 _ 8B. 00
        mov     dword [esp+18H], 43                     ; 0552 _ C7. 44 24, 18, 0000002B
        mov     dword [esp+14H], ebx                    ; 055A _ 89. 5C 24, 14
        mov     dword [esp+10H], 28                     ; 055E _ C7. 44 24, 10, 0000001C
        mov     ebx, dword [ebp-4CH]                    ; 0566 _ 8B. 5D, B4
        mov     dword [esp+0CH], ebx                    ; 0569 _ 89. 5C 24, 0C
        mov     dword [esp+8H], ecx                     ; 056D _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 0571 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0575 _ 89. 04 24
        call    paint_rectangle                         ; 0578 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-4CH]                    ; 057D _ 8B. 45, B4
        lea     ecx, [eax+8H]                           ; 0580 _ 8D. 48, 08
        mov     edx, dword [sheet_win]                  ; 0583 _ 8B. 15, 00000000(d)
        mov     eax, dword [sheet_control]              ; 0589 _ A1, 00000000(d)
        mov     dword [esp+14H], 44                     ; 058E _ C7. 44 24, 14, 0000002C
        mov     dword [esp+10H], ecx                    ; 0596 _ 89. 4C 24, 10
        mov     dword [esp+0CH], 28                     ; 059A _ C7. 44 24, 0C, 0000001C
        mov     ecx, dword [ebp-4CH]                    ; 05A2 _ 8B. 4D, B4
        mov     dword [esp+8H], ecx                     ; 05A5 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 05A9 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 05AD _ 89. 04 24
        call    sheet_refresh                           ; 05B0 _ E8, FFFFFFFC(rel)
        jmp     ?_001                                   ; 05B5 _ E9, FFFFFDF6

?_004:  mov     dword [esp], mouseinfo                  ; 05BA _ C7. 04 24, 00000000(d)
        call    fifo8_status                            ; 05C1 _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 05C6 _ 85. C0
        jz      ?_005                                   ; 05C8 _ 74, 26
        mov     ecx, dword [mouse_sheet]                ; 05CA _ 8B. 0D, 00000008(d)
        mov     edx, dword [back_sheet]                 ; 05D0 _ 8B. 15, 00000004(d)
        mov     eax, dword [sheet_control]              ; 05D6 _ A1, 00000000(d)
        mov     dword [esp+8H], ecx                     ; 05DB _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 05DF _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 05E3 _ 89. 04 24
        call    show_mouse_info                         ; 05E6 _ E8, FFFFFFFC(rel)
        jmp     ?_010                                   ; 05EB _ E9, 000001CD

?_005:  mov     dword [esp], timerinfo1.1733            ; 05F0 _ C7. 04 24, 0000000C(d)
        call    fifo8_status                            ; 05F7 _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 05FC _ 85. C0
        je      ?_006                                   ; 05FE _ 0F 84, 00000089
        call    io_sti                                  ; 0604 _ E8, FFFFFFFC(rel)
        mov     dword [esp], timerinfo1.1733            ; 0609 _ C7. 04 24, 0000000C(d)
        call    fifo8_get                               ; 0610 _ E8, FFFFFFFC(rel)
        mov     edx, dword [back_sheet]                 ; 0615 _ 8B. 15, 00000004(d)
        mov     eax, dword [sheet_control]              ; 061B _ A1, 00000000(d)
        mov     dword [esp+14H], 7                      ; 0620 _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_204                  ; 0628 _ C7. 44 24, 10, 00000007(d)
        mov     dword [esp+0CH], 144                    ; 0630 _ C7. 44 24, 0C, 00000090
        mov     ecx, dword [ebp-44H]                    ; 0638 _ 8B. 4D, BC
        mov     dword [esp+8H], ecx                     ; 063B _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 063F _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0643 _ 89. 04 24
        call    paint_string                            ; 0646 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 100                     ; 064B _ C7. 44 24, 04, 00000064
        mov     eax, dword [ebp-2CH]                    ; 0653 _ 8B. 45, D4
        mov     dword [esp], eax                        ; 0656 _ 89. 04 24
        call    timer_settime                           ; 0659 _ E8, FFFFFFFC(rel)
        add     dword [ebp-44H], 8                      ; 065E _ 83. 45, BC, 08
        cmp     dword [ebp-44H], 40                     ; 0662 _ 83. 7D, BC, 28
        jle     ?_010                                   ; 0666 _ 0F 8E, 00000151
        cmp     dword [ebp-40H], 0                      ; 066C _ 83. 7D, C0, 00
        jne     ?_010                                   ; 0670 _ 0F 85, 00000147
        call    io_cli                                  ; 0676 _ E8, FFFFFFFC(rel)
        mov     eax, dword [task_a.1746]                ; 067B _ A1, 00000078(d)
        mov     dword [esp], eax                        ; 0680 _ 89. 04 24
        call    task_sleep                              ; 0683 _ E8, FFFFFFFC(rel)
        jmp     ?_001                                   ; 0688 _ E9, FFFFFD23

?_006:  mov     dword [esp], timerinfo2.1734            ; 068D _ C7. 04 24, 00000030(d)
        call    fifo8_status                            ; 0694 _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 0699 _ 85. C0
        jz      ?_007                                   ; 069B _ 74, 16
        call    io_sti                                  ; 069D _ E8, FFFFFFFC(rel)
        mov     dword [esp], timerinfo2.1734            ; 06A2 _ C7. 04 24, 00000030(d)
        call    fifo8_get                               ; 06A9 _ E8, FFFFFFFC(rel)
        jmp     ?_010                                   ; 06AE _ E9, 0000010A

?_007:  mov     dword [esp], timerinfo3.1735            ; 06B3 _ C7. 04 24, 00000054(d)
        call    fifo8_status                            ; 06BA _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 06BF _ 85. C0
        je      ?_010                                   ; 06C1 _ 0F 84, 000000F6
        mov     dword [esp], timerinfo3.1735            ; 06C7 _ C7. 04 24, 00000054(d)
        call    fifo8_get                               ; 06CE _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 06D3 _ 89. 45, F4
        call    io_sti                                  ; 06D6 _ E8, FFFFFFFC(rel)
        cmp     dword [ebp-0CH], 0                      ; 06DB _ 83. 7D, F4, 00
        jz      ?_008                                   ; 06DF _ 74, 24
        mov     dword [esp+8H], 0                       ; 06E1 _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], timerinfo3.1735         ; 06E9 _ C7. 44 24, 04, 00000054(d)
        mov     eax, dword [ebp-24H]                    ; 06F1 _ 8B. 45, DC
        mov     dword [esp], eax                        ; 06F4 _ 89. 04 24
        call    timer_init                              ; 06F7 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-48H], 0                      ; 06FC _ C7. 45, B8, 00000000
        jmp     ?_009                                   ; 0703 _ EB, 22

?_008:  mov     dword [esp+8H], 1                       ; 0705 _ C7. 44 24, 08, 00000001
        mov     dword [esp+4H], timerinfo3.1735         ; 070D _ C7. 44 24, 04, 00000054(d)
        mov     eax, dword [ebp-24H]                    ; 0715 _ 8B. 45, DC
        mov     dword [esp], eax                        ; 0718 _ 89. 04 24
        call    timer_init                              ; 071B _ E8, FFFFFFFC(rel)
        mov     dword [ebp-48H], 7                      ; 0720 _ C7. 45, B8, 00000007
?_009:  mov     dword [esp+4H], 50                      ; 0727 _ C7. 44 24, 04, 00000032
        mov     eax, dword [ebp-24H]                    ; 072F _ 8B. 45, DC
        mov     dword [esp], eax                        ; 0732 _ 89. 04 24
        call    timer_settime                           ; 0735 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-4CH]                    ; 073A _ 8B. 45, B4
        lea     ebx, [eax+7H]                           ; 073D _ 8D. 58, 07
        mov     eax, dword [ebp-48H]                    ; 0740 _ 8B. 45, B8
        movzx   ecx, al                                 ; 0743 _ 0F B6. C8
        mov     eax, dword [sheet_win]                  ; 0746 _ A1, 00000000(d)
        mov     edx, dword [eax+4H]                     ; 074B _ 8B. 50, 04
        mov     eax, dword [sheet_win]                  ; 074E _ A1, 00000000(d)
        mov     eax, dword [eax]                        ; 0753 _ 8B. 00
        mov     dword [esp+18H], 43                     ; 0755 _ C7. 44 24, 18, 0000002B
        mov     dword [esp+14H], ebx                    ; 075D _ 89. 5C 24, 14
        mov     dword [esp+10H], 28                     ; 0761 _ C7. 44 24, 10, 0000001C
        mov     ebx, dword [ebp-4CH]                    ; 0769 _ 8B. 5D, B4
        mov     dword [esp+0CH], ebx                    ; 076C _ 89. 5C 24, 0C
        mov     dword [esp+8H], ecx                     ; 0770 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 0774 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0778 _ 89. 04 24
        call    paint_rectangle                         ; 077B _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-4CH]                    ; 0780 _ 8B. 45, B4
        lea     ecx, [eax+8H]                           ; 0783 _ 8D. 48, 08
        mov     edx, dword [sheet_win]                  ; 0786 _ 8B. 15, 00000000(d)
        mov     eax, dword [sheet_control]              ; 078C _ A1, 00000000(d)
        mov     dword [esp+14H], 44                     ; 0791 _ C7. 44 24, 14, 0000002C
        mov     dword [esp+10H], ecx                    ; 0799 _ 89. 4C 24, 10
        mov     dword [esp+0CH], 28                     ; 079D _ C7. 44 24, 0C, 0000001C
        mov     ecx, dword [ebp-4CH]                    ; 07A5 _ 8B. 4D, B4
        mov     dword [esp+8H], ecx                     ; 07A8 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 07AC _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 07B0 _ 89. 04 24
        call    sheet_refresh                           ; 07B3 _ E8, FFFFFFFC(rel)
        jmp     ?_001                                   ; 07B8 _ E9, FFFFFBF3

?_010:  jmp     ?_001                                   ; 07BD _ E9, FFFFFBEE
; CMain End of function

task_b_main:; Function begin
        push    ebp                                     ; 07C2 _ 55
        mov     ebp, esp                                ; 07C3 _ 89. E5
        sub     esp, 104                                ; 07C5 _ 83. EC, 68
        mov     eax, dword [ebp+8H]                     ; 07C8 _ 8B. 45, 08
        mov     dword [ebp-4CH], eax                    ; 07CB _ 89. 45, B4
; Note: Absolute memory address without relocation
        mov     eax, dword [gs:14H]                     ; 07CE _ 65: A1, 00000014
        mov     dword [ebp-0CH], eax                    ; 07D4 _ 89. 45, F4
        xor     eax, eax                                ; 07D7 _ 31. C0
        mov     edx, dword [back_sheet]                 ; 07D9 _ 8B. 15, 00000004(d)
        mov     eax, dword [sheet_control]              ; 07DF _ A1, 00000000(d)
        mov     dword [esp+14H], 7                      ; 07E4 _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_205                  ; 07EC _ C7. 44 24, 10, 00000009(d)
        mov     dword [esp+0CH], 160                    ; 07F4 _ C7. 44 24, 0C, 000000A0
        mov     dword [esp+8H], 0                       ; 07FC _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], edx                     ; 0804 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0808 _ 89. 04 24
        call    paint_string                            ; 080B _ E8, FFFFFFFC(rel)
        mov     dword [ebp-38H], 0                      ; 0810 _ C7. 45, C8, 00000000
        mov     dword [ebp-34H], 0                      ; 0817 _ C7. 45, CC, 00000000
        mov     dword [esp+0CH], 0                      ; 081E _ C7. 44 24, 0C, 00000000
        lea     eax, [ebp-14H]                          ; 0826 _ 8D. 45, EC
        mov     dword [esp+8H], eax                     ; 0829 _ 89. 44 24, 08
        mov     dword [esp+4H], 8                       ; 082D _ C7. 44 24, 04, 00000008
        lea     eax, [ebp-30H]                          ; 0835 _ 8D. 45, D0
        mov     dword [esp], eax                        ; 0838 _ 89. 04 24
        call    fifo8_init                              ; 083B _ E8, FFFFFFFC(rel)
        call    timer_alloc                             ; 0840 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-38H], eax                    ; 0845 _ 89. 45, C8
        mov     dword [esp+8H], 123                     ; 0848 _ C7. 44 24, 08, 0000007B
        lea     eax, [ebp-30H]                          ; 0850 _ 8D. 45, D0
        mov     dword [esp+4H], eax                     ; 0853 _ 89. 44 24, 04
        mov     eax, dword [ebp-38H]                    ; 0857 _ 8B. 45, C8
        mov     dword [esp], eax                        ; 085A _ 89. 04 24
        call    timer_init                              ; 085D _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 100                     ; 0862 _ C7. 44 24, 04, 00000064
        mov     eax, dword [ebp-38H]                    ; 086A _ 8B. 45, C8
        mov     dword [esp], eax                        ; 086D _ 89. 04 24
        call    timer_settime                           ; 0870 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-40H], 0                      ; 0875 _ C7. 45, C0, 00000000
        mov     dword [ebp-3CH], 0                      ; 087C _ C7. 45, C4, 00000000
?_011:  add     dword [ebp-40H], 1                      ; 0883 _ 83. 45, C0, 01
        call    io_cli                                  ; 0887 _ E8, FFFFFFFC(rel)
        lea     eax, [ebp-30H]                          ; 088C _ 8D. 45, D0
        mov     dword [esp], eax                        ; 088F _ 89. 04 24
        call    fifo8_status                            ; 0892 _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 0897 _ 85. C0
        jnz     ?_012                                   ; 0899 _ 75, 07
        call    io_sti                                  ; 089B _ E8, FFFFFFFC(rel)
        jmp     ?_013                                   ; 08A0 _ EB, 6B

?_012:  lea     eax, [ebp-30H]                          ; 08A2 _ 8D. 45, D0
        mov     dword [esp], eax                        ; 08A5 _ 89. 04 24
        call    fifo8_get                               ; 08A8 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-34H], eax                    ; 08AD _ 89. 45, CC
        call    io_sti                                  ; 08B0 _ E8, FFFFFFFC(rel)
        cmp     dword [ebp-34H], 123                    ; 08B5 _ 83. 7D, CC, 7B
        jnz     ?_013                                   ; 08B9 _ 75, 52
        mov     edx, dword [back_sheet]                 ; 08BB _ 8B. 15, 00000004(d)
        mov     eax, dword [sheet_control]              ; 08C1 _ A1, 00000000(d)
        mov     dword [esp+14H], 7                      ; 08C6 _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_206                  ; 08CE _ C7. 44 24, 10, 00000016(d)
        mov     dword [esp+0CH], 176                    ; 08D6 _ C7. 44 24, 0C, 000000B0
        mov     ecx, dword [ebp-3CH]                    ; 08DE _ 8B. 4D, C4
        mov     dword [esp+8H], ecx                     ; 08E1 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 08E5 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 08E9 _ 89. 04 24
        call    paint_string                            ; 08EC _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 100                     ; 08F1 _ C7. 44 24, 04, 00000064
        mov     eax, dword [ebp-38H]                    ; 08F9 _ 8B. 45, C8
        mov     dword [esp], eax                        ; 08FC _ 89. 04 24
        call    timer_settime                           ; 08FF _ E8, FFFFFFFC(rel)
        add     dword [ebp-3CH], 8                      ; 0904 _ 83. 45, C4, 08
        jmp     ?_011                                   ; 0908 _ E9, FFFFFF76

?_013:  jmp     ?_011                                   ; 090D _ E9, FFFFFF71
; task_b_main End of function

init_screeninfo:; Function begin
        push    ebp                                     ; 0912 _ 55
        mov     ebp, esp                                ; 0913 _ 89. E5
        mov     eax, dword [VRAM_ADDRESS]               ; 0915 _ A1, 00000000(d)
        mov     edx, eax                                ; 091A _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 091C _ 8B. 45, 08
        mov     dword [eax], edx                        ; 091F _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 0921 _ 8B. 45, 08
; Note: Length-changing prefix causes delay on Intel processors
        mov     word [eax+4H], 640                      ; 0924 _ 66: C7. 40, 04, 0280
        mov     eax, dword [ebp+8H]                     ; 092A _ 8B. 45, 08
; Note: Length-changing prefix causes delay on Intel processors
        mov     word [eax+6H], 480                      ; 092D _ 66: C7. 40, 06, 01E0
        pop     ebp                                     ; 0933 _ 5D
        ret                                             ; 0934 _ C3
; init_screeninfo End of function

init_palette:; Function begin
        push    ebp                                     ; 0935 _ 55
        mov     ebp, esp                                ; 0936 _ 89. E5
        sub     esp, 24                                 ; 0938 _ 83. EC, 18
        mov     dword [esp+8H], table_rgb.1731          ; 093B _ C7. 44 24, 08, 00000080(d)
        mov     dword [esp+4H], 15                      ; 0943 _ C7. 44 24, 04, 0000000F
        mov     dword [esp], 0                          ; 094B _ C7. 04 24, 00000000
        call    set_palette                             ; 0952 _ E8, FFFFFFFC(rel)
        nop                                             ; 0957 _ 90
        leave                                           ; 0958 _ C9
        ret                                             ; 0959 _ C3
; init_palette End of function

set_palette:; Function begin
        push    ebp                                     ; 095A _ 55
        mov     ebp, esp                                ; 095B _ 89. E5
        sub     esp, 40                                 ; 095D _ 83. EC, 28
        call    io_load_eflags                          ; 0960 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 0965 _ 89. 45, F4
        call    io_cli                                  ; 0968 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 096D _ 8B. 45, 08
        mov     dword [esp+4H], eax                     ; 0970 _ 89. 44 24, 04
        mov     dword [esp], 968                        ; 0974 _ C7. 04 24, 000003C8
        call    io_out8                                 ; 097B _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 0980 _ 8B. 45, 08
        mov     dword [ebp-10H], eax                    ; 0983 _ 89. 45, F0
        jmp     ?_015                                   ; 0986 _ EB, 62

?_014:  mov     eax, dword [ebp+10H]                    ; 0988 _ 8B. 45, 10
        movzx   eax, byte [eax]                         ; 098B _ 0F B6. 00
        shr     al, 2                                   ; 098E _ C0. E8, 02
        movzx   eax, al                                 ; 0991 _ 0F B6. C0
        mov     dword [esp+4H], eax                     ; 0994 _ 89. 44 24, 04
        mov     dword [esp], 969                        ; 0998 _ C7. 04 24, 000003C9
        call    io_out8                                 ; 099F _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 09A4 _ 8B. 45, 10
        add     eax, 1                                  ; 09A7 _ 83. C0, 01
        movzx   eax, byte [eax]                         ; 09AA _ 0F B6. 00
        shr     al, 2                                   ; 09AD _ C0. E8, 02
        movzx   eax, al                                 ; 09B0 _ 0F B6. C0
        mov     dword [esp+4H], eax                     ; 09B3 _ 89. 44 24, 04
        mov     dword [esp], 969                        ; 09B7 _ C7. 04 24, 000003C9
        call    io_out8                                 ; 09BE _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 09C3 _ 8B. 45, 10
        add     eax, 2                                  ; 09C6 _ 83. C0, 02
        movzx   eax, byte [eax]                         ; 09C9 _ 0F B6. 00
        shr     al, 2                                   ; 09CC _ C0. E8, 02
        movzx   eax, al                                 ; 09CF _ 0F B6. C0
        mov     dword [esp+4H], eax                     ; 09D2 _ 89. 44 24, 04
        mov     dword [esp], 969                        ; 09D6 _ C7. 04 24, 000003C9
        call    io_out8                                 ; 09DD _ E8, FFFFFFFC(rel)
        add     dword [ebp+10H], 3                      ; 09E2 _ 83. 45, 10, 03
        add     dword [ebp-10H], 1                      ; 09E6 _ 83. 45, F0, 01
?_015:  mov     eax, dword [ebp-10H]                    ; 09EA _ 8B. 45, F0
        cmp     eax, dword [ebp+0CH]                    ; 09ED _ 3B. 45, 0C
        jle     ?_014                                   ; 09F0 _ 7E, 96
        mov     eax, dword [ebp-0CH]                    ; 09F2 _ 8B. 45, F4
        mov     dword [esp], eax                        ; 09F5 _ 89. 04 24
        call    io_store_eflags                         ; 09F8 _ E8, FFFFFFFC(rel)
        nop                                             ; 09FD _ 90
        leave                                           ; 09FE _ C9
        ret                                             ; 09FF _ C3
; set_palette End of function

paint_rectangle:; Function begin
        push    ebp                                     ; 0A00 _ 55
        mov     ebp, esp                                ; 0A01 _ 89. E5
        sub     esp, 20                                 ; 0A03 _ 83. EC, 14
        mov     eax, dword [ebp+10H]                    ; 0A06 _ 8B. 45, 10
        mov     byte [ebp-14H], al                      ; 0A09 _ 88. 45, EC
        mov     eax, dword [ebp+18H]                    ; 0A0C _ 8B. 45, 18
        mov     dword [ebp-4H], eax                     ; 0A0F _ 89. 45, FC
        jmp     ?_019                                   ; 0A12 _ EB, 33

?_016:  mov     eax, dword [ebp+14H]                    ; 0A14 _ 8B. 45, 14
        mov     dword [ebp-8H], eax                     ; 0A17 _ 89. 45, F8
        jmp     ?_018                                   ; 0A1A _ EB, 1F

?_017:  mov     eax, dword [ebp-4H]                     ; 0A1C _ 8B. 45, FC
        imul    eax, dword [ebp+0CH]                    ; 0A1F _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0A23 _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 0A25 _ 8B. 45, F8
        add     eax, edx                                ; 0A28 _ 01. D0
        mov     edx, eax                                ; 0A2A _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0A2C _ 8B. 45, 08
        add     edx, eax                                ; 0A2F _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0A31 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0A35 _ 88. 02
        add     dword [ebp-8H], 1                       ; 0A37 _ 83. 45, F8, 01
?_018:  mov     eax, dword [ebp-8H]                     ; 0A3B _ 8B. 45, F8
        cmp     eax, dword [ebp+1CH]                    ; 0A3E _ 3B. 45, 1C
        jle     ?_017                                   ; 0A41 _ 7E, D9
        add     dword [ebp-4H], 1                       ; 0A43 _ 83. 45, FC, 01
?_019:  mov     eax, dword [ebp-4H]                     ; 0A47 _ 8B. 45, FC
        cmp     eax, dword [ebp+20H]                    ; 0A4A _ 3B. 45, 20
        jle     ?_016                                   ; 0A4D _ 7E, C5
        leave                                           ; 0A4F _ C9
        ret                                             ; 0A50 _ C3
; paint_rectangle End of function

init_desktop:; Function begin
        push    ebp                                     ; 0A51 _ 55
        mov     ebp, esp                                ; 0A52 _ 89. E5
        push    ebx                                     ; 0A54 _ 53
        sub     esp, 28                                 ; 0A55 _ 83. EC, 1C
        mov     eax, dword [ebp+10H]                    ; 0A58 _ 8B. 45, 10
        lea     edx, [eax-1DH]                          ; 0A5B _ 8D. 50, E3
        mov     eax, dword [ebp+0CH]                    ; 0A5E _ 8B. 45, 0C
        sub     eax, 1                                  ; 0A61 _ 83. E8, 01
        mov     dword [esp+18H], edx                    ; 0A64 _ 89. 54 24, 18
        mov     dword [esp+14H], eax                    ; 0A68 _ 89. 44 24, 14
        mov     dword [esp+10H], 0                      ; 0A6C _ C7. 44 24, 10, 00000000
        mov     dword [esp+0CH], 0                      ; 0A74 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 2                       ; 0A7C _ C7. 44 24, 08, 00000002
        mov     eax, dword [ebp+0CH]                    ; 0A84 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0A87 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0A8B _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0A8E _ 89. 04 24
        call    paint_rectangle                         ; 0A91 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0A96 _ 8B. 45, 10
        lea     ecx, [eax-1CH]                          ; 0A99 _ 8D. 48, E4
        mov     eax, dword [ebp+0CH]                    ; 0A9C _ 8B. 45, 0C
        lea     edx, [eax-1H]                           ; 0A9F _ 8D. 50, FF
        mov     eax, dword [ebp+10H]                    ; 0AA2 _ 8B. 45, 10
        sub     eax, 28                                 ; 0AA5 _ 83. E8, 1C
        mov     dword [esp+18H], ecx                    ; 0AA8 _ 89. 4C 24, 18
        mov     dword [esp+14H], edx                    ; 0AAC _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 0AB0 _ 89. 44 24, 10
        mov     dword [esp+0CH], 0                      ; 0AB4 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 8                       ; 0ABC _ C7. 44 24, 08, 00000008
        mov     eax, dword [ebp+0CH]                    ; 0AC4 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0AC7 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0ACB _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0ACE _ 89. 04 24
        call    paint_rectangle                         ; 0AD1 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0AD6 _ 8B. 45, 10
        lea     ecx, [eax-1BH]                          ; 0AD9 _ 8D. 48, E5
        mov     eax, dword [ebp+0CH]                    ; 0ADC _ 8B. 45, 0C
        lea     edx, [eax-1H]                           ; 0ADF _ 8D. 50, FF
        mov     eax, dword [ebp+10H]                    ; 0AE2 _ 8B. 45, 10
        sub     eax, 27                                 ; 0AE5 _ 83. E8, 1B
        mov     dword [esp+18H], ecx                    ; 0AE8 _ 89. 4C 24, 18
        mov     dword [esp+14H], edx                    ; 0AEC _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 0AF0 _ 89. 44 24, 10
        mov     dword [esp+0CH], 0                      ; 0AF4 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 7                       ; 0AFC _ C7. 44 24, 08, 00000007
        mov     eax, dword [ebp+0CH]                    ; 0B04 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0B07 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0B0B _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0B0E _ 89. 04 24
        call    paint_rectangle                         ; 0B11 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0B16 _ 8B. 45, 10
        lea     ecx, [eax-1H]                           ; 0B19 _ 8D. 48, FF
        mov     eax, dword [ebp+0CH]                    ; 0B1C _ 8B. 45, 0C
        lea     edx, [eax-1H]                           ; 0B1F _ 8D. 50, FF
        mov     eax, dword [ebp+10H]                    ; 0B22 _ 8B. 45, 10
        sub     eax, 26                                 ; 0B25 _ 83. E8, 1A
        mov     dword [esp+18H], ecx                    ; 0B28 _ 89. 4C 24, 18
        mov     dword [esp+14H], edx                    ; 0B2C _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 0B30 _ 89. 44 24, 10
        mov     dword [esp+0CH], 0                      ; 0B34 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 8                       ; 0B3C _ C7. 44 24, 08, 00000008
        mov     eax, dword [ebp+0CH]                    ; 0B44 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0B47 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0B4B _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0B4E _ 89. 04 24
        call    paint_rectangle                         ; 0B51 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0B56 _ 8B. 45, 10
        lea     edx, [eax-18H]                          ; 0B59 _ 8D. 50, E8
        mov     eax, dword [ebp+10H]                    ; 0B5C _ 8B. 45, 10
        sub     eax, 24                                 ; 0B5F _ 83. E8, 18
        mov     dword [esp+18H], edx                    ; 0B62 _ 89. 54 24, 18
        mov     dword [esp+14H], 59                     ; 0B66 _ C7. 44 24, 14, 0000003B
        mov     dword [esp+10H], eax                    ; 0B6E _ 89. 44 24, 10
        mov     dword [esp+0CH], 3                      ; 0B72 _ C7. 44 24, 0C, 00000003
        mov     dword [esp+8H], 7                       ; 0B7A _ C7. 44 24, 08, 00000007
        mov     eax, dword [ebp+0CH]                    ; 0B82 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0B85 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0B89 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0B8C _ 89. 04 24
        call    paint_rectangle                         ; 0B8F _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0B94 _ 8B. 45, 10
        lea     edx, [eax-4H]                           ; 0B97 _ 8D. 50, FC
        mov     eax, dword [ebp+10H]                    ; 0B9A _ 8B. 45, 10
        sub     eax, 24                                 ; 0B9D _ 83. E8, 18
        mov     dword [esp+18H], edx                    ; 0BA0 _ 89. 54 24, 18
        mov     dword [esp+14H], 2                      ; 0BA4 _ C7. 44 24, 14, 00000002
        mov     dword [esp+10H], eax                    ; 0BAC _ 89. 44 24, 10
        mov     dword [esp+0CH], 2                      ; 0BB0 _ C7. 44 24, 0C, 00000002
        mov     dword [esp+8H], 7                       ; 0BB8 _ C7. 44 24, 08, 00000007
        mov     eax, dword [ebp+0CH]                    ; 0BC0 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0BC3 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0BC7 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0BCA _ 89. 04 24
        call    paint_rectangle                         ; 0BCD _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0BD2 _ 8B. 45, 10
        lea     edx, [eax-4H]                           ; 0BD5 _ 8D. 50, FC
        mov     eax, dword [ebp+10H]                    ; 0BD8 _ 8B. 45, 10
        sub     eax, 4                                  ; 0BDB _ 83. E8, 04
        mov     dword [esp+18H], edx                    ; 0BDE _ 89. 54 24, 18
        mov     dword [esp+14H], 59                     ; 0BE2 _ C7. 44 24, 14, 0000003B
        mov     dword [esp+10H], eax                    ; 0BEA _ 89. 44 24, 10
        mov     dword [esp+0CH], 3                      ; 0BEE _ C7. 44 24, 0C, 00000003
        mov     dword [esp+8H], 2                       ; 0BF6 _ C7. 44 24, 08, 00000002
        mov     eax, dword [ebp+0CH]                    ; 0BFE _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0C01 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0C05 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0C08 _ 89. 04 24
        call    paint_rectangle                         ; 0C0B _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0C10 _ 8B. 45, 10
        lea     edx, [eax-5H]                           ; 0C13 _ 8D. 50, FB
        mov     eax, dword [ebp+10H]                    ; 0C16 _ 8B. 45, 10
        sub     eax, 23                                 ; 0C19 _ 83. E8, 17
        mov     dword [esp+18H], edx                    ; 0C1C _ 89. 54 24, 18
        mov     dword [esp+14H], 59                     ; 0C20 _ C7. 44 24, 14, 0000003B
        mov     dword [esp+10H], eax                    ; 0C28 _ 89. 44 24, 10
        mov     dword [esp+0CH], 59                     ; 0C2C _ C7. 44 24, 0C, 0000003B
        mov     dword [esp+8H], 2                       ; 0C34 _ C7. 44 24, 08, 00000002
        mov     eax, dword [ebp+0CH]                    ; 0C3C _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0C3F _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0C43 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0C46 _ 89. 04 24
        call    paint_rectangle                         ; 0C49 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0C4E _ 8B. 45, 10
        lea     edx, [eax-3H]                           ; 0C51 _ 8D. 50, FD
        mov     eax, dword [ebp+10H]                    ; 0C54 _ 8B. 45, 10
        sub     eax, 3                                  ; 0C57 _ 83. E8, 03
        mov     dword [esp+18H], edx                    ; 0C5A _ 89. 54 24, 18
        mov     dword [esp+14H], 59                     ; 0C5E _ C7. 44 24, 14, 0000003B
        mov     dword [esp+10H], eax                    ; 0C66 _ 89. 44 24, 10
        mov     dword [esp+0CH], 2                      ; 0C6A _ C7. 44 24, 0C, 00000002
        mov     dword [esp+8H], 0                       ; 0C72 _ C7. 44 24, 08, 00000000
        mov     eax, dword [ebp+0CH]                    ; 0C7A _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0C7D _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0C81 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0C84 _ 89. 04 24
        call    paint_rectangle                         ; 0C87 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0C8C _ 8B. 45, 10
        lea     edx, [eax-3H]                           ; 0C8F _ 8D. 50, FD
        mov     eax, dword [ebp+10H]                    ; 0C92 _ 8B. 45, 10
        sub     eax, 24                                 ; 0C95 _ 83. E8, 18
        mov     dword [esp+18H], edx                    ; 0C98 _ 89. 54 24, 18
        mov     dword [esp+14H], 60                     ; 0C9C _ C7. 44 24, 14, 0000003C
        mov     dword [esp+10H], eax                    ; 0CA4 _ 89. 44 24, 10
        mov     dword [esp+0CH], 60                     ; 0CA8 _ C7. 44 24, 0C, 0000003C
        mov     dword [esp+8H], 0                       ; 0CB0 _ C7. 44 24, 08, 00000000
        mov     eax, dword [ebp+0CH]                    ; 0CB8 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0CBB _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0CBF _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0CC2 _ 89. 04 24
        call    paint_rectangle                         ; 0CC5 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0CCA _ 8B. 45, 10
        lea     ebx, [eax-18H]                          ; 0CCD _ 8D. 58, E8
        mov     eax, dword [ebp+0CH]                    ; 0CD0 _ 8B. 45, 0C
        lea     ecx, [eax-4H]                           ; 0CD3 _ 8D. 48, FC
        mov     eax, dword [ebp+10H]                    ; 0CD6 _ 8B. 45, 10
        lea     edx, [eax-18H]                          ; 0CD9 _ 8D. 50, E8
        mov     eax, dword [ebp+0CH]                    ; 0CDC _ 8B. 45, 0C
        sub     eax, 47                                 ; 0CDF _ 83. E8, 2F
        mov     dword [esp+18H], ebx                    ; 0CE2 _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 0CE6 _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 0CEA _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 0CEE _ 89. 44 24, 0C
        mov     dword [esp+8H], 2                       ; 0CF2 _ C7. 44 24, 08, 00000002
        mov     eax, dword [ebp+0CH]                    ; 0CFA _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0CFD _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0D01 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0D04 _ 89. 04 24
        call    paint_rectangle                         ; 0D07 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0D0C _ 8B. 45, 10
        lea     ebx, [eax-4H]                           ; 0D0F _ 8D. 58, FC
        mov     eax, dword [ebp+0CH]                    ; 0D12 _ 8B. 45, 0C
        lea     ecx, [eax-2FH]                          ; 0D15 _ 8D. 48, D1
        mov     eax, dword [ebp+10H]                    ; 0D18 _ 8B. 45, 10
        lea     edx, [eax-17H]                          ; 0D1B _ 8D. 50, E9
        mov     eax, dword [ebp+0CH]                    ; 0D1E _ 8B. 45, 0C
        sub     eax, 47                                 ; 0D21 _ 83. E8, 2F
        mov     dword [esp+18H], ebx                    ; 0D24 _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 0D28 _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 0D2C _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 0D30 _ 89. 44 24, 0C
        mov     dword [esp+8H], 2                       ; 0D34 _ C7. 44 24, 08, 00000002
        mov     eax, dword [ebp+0CH]                    ; 0D3C _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0D3F _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0D43 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0D46 _ 89. 04 24
        call    paint_rectangle                         ; 0D49 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0D4E _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 0D51 _ 8D. 58, FD
        mov     eax, dword [ebp+0CH]                    ; 0D54 _ 8B. 45, 0C
        lea     ecx, [eax-4H]                           ; 0D57 _ 8D. 48, FC
        mov     eax, dword [ebp+10H]                    ; 0D5A _ 8B. 45, 10
        lea     edx, [eax-3H]                           ; 0D5D _ 8D. 50, FD
        mov     eax, dword [ebp+0CH]                    ; 0D60 _ 8B. 45, 0C
        sub     eax, 47                                 ; 0D63 _ 83. E8, 2F
        mov     dword [esp+18H], ebx                    ; 0D66 _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 0D6A _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 0D6E _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 0D72 _ 89. 44 24, 0C
        mov     dword [esp+8H], 7                       ; 0D76 _ C7. 44 24, 08, 00000007
        mov     eax, dword [ebp+0CH]                    ; 0D7E _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0D81 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0D85 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0D88 _ 89. 04 24
        call    paint_rectangle                         ; 0D8B _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0D90 _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 0D93 _ 8D. 58, FD
        mov     eax, dword [ebp+0CH]                    ; 0D96 _ 8B. 45, 0C
        lea     ecx, [eax-3H]                           ; 0D99 _ 8D. 48, FD
        mov     eax, dword [ebp+10H]                    ; 0D9C _ 8B. 45, 10
        lea     edx, [eax-18H]                          ; 0D9F _ 8D. 50, E8
        mov     eax, dword [ebp+0CH]                    ; 0DA2 _ 8B. 45, 0C
        sub     eax, 3                                  ; 0DA5 _ 83. E8, 03
        mov     dword [esp+18H], ebx                    ; 0DA8 _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 0DAC _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 0DB0 _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 0DB4 _ 89. 44 24, 0C
        mov     dword [esp+8H], 7                       ; 0DB8 _ C7. 44 24, 08, 00000007
        mov     eax, dword [ebp+0CH]                    ; 0DC0 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0DC3 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0DC7 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0DCA _ 89. 04 24
        call    paint_rectangle                         ; 0DCD _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 0DD2 _ 83. C4, 1C
        pop     ebx                                     ; 0DD5 _ 5B
        pop     ebp                                     ; 0DD6 _ 5D
        ret                                             ; 0DD7 _ C3
; init_desktop End of function

init_mouse_position:; Function begin
        push    ebp                                     ; 0DD8 _ 55
        mov     ebp, esp                                ; 0DD9 _ 89. E5
        sub     esp, 16                                 ; 0DDB _ 83. EC, 10
        movzx   eax, word [?_216]                       ; 0DDE _ 0F B7. 05, 00000184(d)
        cwde                                            ; 0DE5 _ 98
        mov     dword [ebp-8H], eax                     ; 0DE6 _ 89. 45, F8
        movzx   eax, word [?_217]                       ; 0DE9 _ 0F B7. 05, 00000186(d)
        cwde                                            ; 0DF0 _ 98
        mov     dword [ebp-4H], eax                     ; 0DF1 _ 89. 45, FC
        mov     eax, dword [ebp-8H]                     ; 0DF4 _ 8B. 45, F8
        sub     eax, 16                                 ; 0DF7 _ 83. E8, 10
        mov     edx, eax                                ; 0DFA _ 89. C2
        shr     edx, 31                                 ; 0DFC _ C1. EA, 1F
        add     eax, edx                                ; 0DFF _ 01. D0
        sar     eax, 1                                  ; 0E01 _ D1. F8
        mov     dword [mouse_x], eax                    ; 0E03 _ A3, 000002A8(d)
        mov     eax, dword [ebp-4H]                     ; 0E08 _ 8B. 45, FC
        sub     eax, 44                                 ; 0E0B _ 83. E8, 2C
        mov     edx, eax                                ; 0E0E _ 89. C2
        shr     edx, 31                                 ; 0E10 _ C1. EA, 1F
        add     eax, edx                                ; 0E13 _ 01. D0
        sar     eax, 1                                  ; 0E15 _ D1. F8
        mov     dword [mouse_y], eax                    ; 0E17 _ A3, 000002AC(d)
        leave                                           ; 0E1C _ C9
        ret                                             ; 0E1D _ C3
; init_mouse_position End of function

paint_font:; Function begin
        push    ebp                                     ; 0E1E _ 55
        mov     ebp, esp                                ; 0E1F _ 89. E5
        sub     esp, 20                                 ; 0E21 _ 83. EC, 14
        mov     eax, dword [ebp+1CH]                    ; 0E24 _ 8B. 45, 1C
        mov     byte [ebp-14H], al                      ; 0E27 _ 88. 45, EC
        mov     dword [ebp-4H], 0                       ; 0E2A _ C7. 45, FC, 00000000
        jmp     ?_029                                   ; 0E31 _ E9, 0000016E

?_020:  mov     edx, dword [ebp-4H]                     ; 0E36 _ 8B. 55, FC
        mov     eax, dword [ebp+18H]                    ; 0E39 _ 8B. 45, 18
        add     eax, edx                                ; 0E3C _ 01. D0
        movzx   eax, byte [eax]                         ; 0E3E _ 0F B6. 00
        mov     byte [ebp-5H], al                       ; 0E41 _ 88. 45, FB
        movzx   eax, byte [ebp-5H]                      ; 0E44 _ 0F B6. 45, FB
        test    al, al                                  ; 0E48 _ 84. C0
        jns     ?_021                                   ; 0E4A _ 79, 20
        mov     eax, dword [ebp-4H]                     ; 0E4C _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 0E4F _ 8B. 55, 14
        add     eax, edx                                ; 0E52 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0E54 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0E58 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0E5A _ 8B. 45, 10
        add     eax, edx                                ; 0E5D _ 01. D0
        mov     edx, eax                                ; 0E5F _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0E61 _ 8B. 45, 08
        add     edx, eax                                ; 0E64 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0E66 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0E6A _ 88. 02
?_021:  movzx   eax, byte [ebp-5H]                      ; 0E6C _ 0F B6. 45, FB
        and     eax, 40H                                ; 0E70 _ 83. E0, 40
        test    eax, eax                                ; 0E73 _ 85. C0
        jz      ?_022                                   ; 0E75 _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 0E77 _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 0E7A _ 8B. 55, 14
        add     eax, edx                                ; 0E7D _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0E7F _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0E83 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0E85 _ 8B. 45, 10
        add     eax, edx                                ; 0E88 _ 01. D0
        lea     edx, [eax+1H]                           ; 0E8A _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 0E8D _ 8B. 45, 08
        add     edx, eax                                ; 0E90 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0E92 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0E96 _ 88. 02
?_022:  movzx   eax, byte [ebp-5H]                      ; 0E98 _ 0F B6. 45, FB
        and     eax, 20H                                ; 0E9C _ 83. E0, 20
        test    eax, eax                                ; 0E9F _ 85. C0
        jz      ?_023                                   ; 0EA1 _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 0EA3 _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 0EA6 _ 8B. 55, 14
        add     eax, edx                                ; 0EA9 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0EAB _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0EAF _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0EB1 _ 8B. 45, 10
        add     eax, edx                                ; 0EB4 _ 01. D0
        lea     edx, [eax+2H]                           ; 0EB6 _ 8D. 50, 02
        mov     eax, dword [ebp+8H]                     ; 0EB9 _ 8B. 45, 08
        add     edx, eax                                ; 0EBC _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0EBE _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0EC2 _ 88. 02
?_023:  movzx   eax, byte [ebp-5H]                      ; 0EC4 _ 0F B6. 45, FB
        and     eax, 10H                                ; 0EC8 _ 83. E0, 10
        test    eax, eax                                ; 0ECB _ 85. C0
        jz      ?_024                                   ; 0ECD _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 0ECF _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 0ED2 _ 8B. 55, 14
        add     eax, edx                                ; 0ED5 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0ED7 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0EDB _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0EDD _ 8B. 45, 10
        add     eax, edx                                ; 0EE0 _ 01. D0
        lea     edx, [eax+3H]                           ; 0EE2 _ 8D. 50, 03
        mov     eax, dword [ebp+8H]                     ; 0EE5 _ 8B. 45, 08
        add     edx, eax                                ; 0EE8 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0EEA _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0EEE _ 88. 02
?_024:  movzx   eax, byte [ebp-5H]                      ; 0EF0 _ 0F B6. 45, FB
        and     eax, 08H                                ; 0EF4 _ 83. E0, 08
        test    eax, eax                                ; 0EF7 _ 85. C0
        jz      ?_025                                   ; 0EF9 _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 0EFB _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 0EFE _ 8B. 55, 14
        add     eax, edx                                ; 0F01 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0F03 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0F07 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0F09 _ 8B. 45, 10
        add     eax, edx                                ; 0F0C _ 01. D0
        lea     edx, [eax+4H]                           ; 0F0E _ 8D. 50, 04
        mov     eax, dword [ebp+8H]                     ; 0F11 _ 8B. 45, 08
        add     edx, eax                                ; 0F14 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0F16 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0F1A _ 88. 02
?_025:  movzx   eax, byte [ebp-5H]                      ; 0F1C _ 0F B6. 45, FB
        and     eax, 04H                                ; 0F20 _ 83. E0, 04
        test    eax, eax                                ; 0F23 _ 85. C0
        jz      ?_026                                   ; 0F25 _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 0F27 _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 0F2A _ 8B. 55, 14
        add     eax, edx                                ; 0F2D _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0F2F _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0F33 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0F35 _ 8B. 45, 10
        add     eax, edx                                ; 0F38 _ 01. D0
        lea     edx, [eax+5H]                           ; 0F3A _ 8D. 50, 05
        mov     eax, dword [ebp+8H]                     ; 0F3D _ 8B. 45, 08
        add     edx, eax                                ; 0F40 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0F42 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0F46 _ 88. 02
?_026:  movzx   eax, byte [ebp-5H]                      ; 0F48 _ 0F B6. 45, FB
        and     eax, 02H                                ; 0F4C _ 83. E0, 02
        test    eax, eax                                ; 0F4F _ 85. C0
        jz      ?_027                                   ; 0F51 _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 0F53 _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 0F56 _ 8B. 55, 14
        add     eax, edx                                ; 0F59 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0F5B _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0F5F _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0F61 _ 8B. 45, 10
        add     eax, edx                                ; 0F64 _ 01. D0
        lea     edx, [eax+6H]                           ; 0F66 _ 8D. 50, 06
        mov     eax, dword [ebp+8H]                     ; 0F69 _ 8B. 45, 08
        add     edx, eax                                ; 0F6C _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0F6E _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0F72 _ 88. 02
?_027:  movzx   eax, byte [ebp-5H]                      ; 0F74 _ 0F B6. 45, FB
        and     eax, 01H                                ; 0F78 _ 83. E0, 01
        test    eax, eax                                ; 0F7B _ 85. C0
        jz      ?_028                                   ; 0F7D _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 0F7F _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 0F82 _ 8B. 55, 14
        add     eax, edx                                ; 0F85 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0F87 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0F8B _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0F8D _ 8B. 45, 10
        add     eax, edx                                ; 0F90 _ 01. D0
        lea     edx, [eax+7H]                           ; 0F92 _ 8D. 50, 07
        mov     eax, dword [ebp+8H]                     ; 0F95 _ 8B. 45, 08
        add     edx, eax                                ; 0F98 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0F9A _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0F9E _ 88. 02
?_028:  add     dword [ebp-4H], 1                       ; 0FA0 _ 83. 45, FC, 01
?_029:  cmp     dword [ebp-4H], 15                      ; 0FA4 _ 83. 7D, FC, 0F
        jle     ?_020                                   ; 0FA8 _ 0F 8E, FFFFFE88
        leave                                           ; 0FAE _ C9
        ret                                             ; 0FAF _ C3
; paint_font End of function

paint_string:; Function begin
        push    ebp                                     ; 0FB0 _ 55
        mov     ebp, esp                                ; 0FB1 _ 89. E5
        push    ebx                                     ; 0FB3 _ 53
        sub     esp, 52                                 ; 0FB4 _ 83. EC, 34
        mov     eax, dword [ebp+1CH]                    ; 0FB7 _ 8B. 45, 1C
        mov     byte [ebp-1CH], al                      ; 0FBA _ 88. 45, E4
        mov     eax, dword [ebp+10H]                    ; 0FBD _ 8B. 45, 10
        mov     dword [ebp-0CH], eax                    ; 0FC0 _ 89. 45, F4
        jmp     ?_031                                   ; 0FC3 _ EB, 4B

?_030:  movsx   ecx, byte [ebp-1CH]                     ; 0FC5 _ 0F BE. 4D, E4
        mov     eax, dword [ebp+18H]                    ; 0FC9 _ 8B. 45, 18
        movzx   eax, byte [eax]                         ; 0FCC _ 0F B6. 00
        movsx   eax, al                                 ; 0FCF _ 0F BE. C0
        shl     eax, 4                                  ; 0FD2 _ C1. E0, 04
        lea     ebx, [systemFont+eax]                   ; 0FD5 _ 8D. 98, 00000000(d)
        mov     eax, dword [ebp+0CH]                    ; 0FDB _ 8B. 45, 0C
        mov     edx, dword [eax+4H]                     ; 0FDE _ 8B. 50, 04
        mov     eax, dword [ebp+0CH]                    ; 0FE1 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 0FE4 _ 8B. 00
        mov     dword [esp+14H], ecx                    ; 0FE6 _ 89. 4C 24, 14
        mov     dword [esp+10H], ebx                    ; 0FEA _ 89. 5C 24, 10
        mov     ecx, dword [ebp+14H]                    ; 0FEE _ 8B. 4D, 14
        mov     dword [esp+0CH], ecx                    ; 0FF1 _ 89. 4C 24, 0C
        mov     ecx, dword [ebp+10H]                    ; 0FF5 _ 8B. 4D, 10
        mov     dword [esp+8H], ecx                     ; 0FF8 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 0FFC _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1000 _ 89. 04 24
        call    paint_font                              ; 1003 _ E8, FFFFFFFC(rel)
        add     dword [ebp+10H], 8                      ; 1008 _ 83. 45, 10, 08
        add     dword [ebp+18H], 1                      ; 100C _ 83. 45, 18, 01
?_031:  mov     eax, dword [ebp+18H]                    ; 1010 _ 8B. 45, 18
        movzx   eax, byte [eax]                         ; 1013 _ 0F B6. 00
        test    al, al                                  ; 1016 _ 84. C0
        jnz     ?_030                                   ; 1018 _ 75, AB
        mov     eax, dword [ebp+14H]                    ; 101A _ 8B. 45, 14
        add     eax, 16                                 ; 101D _ 83. C0, 10
        mov     dword [esp+14H], eax                    ; 1020 _ 89. 44 24, 14
        mov     eax, dword [ebp+10H]                    ; 1024 _ 8B. 45, 10
        mov     dword [esp+10H], eax                    ; 1027 _ 89. 44 24, 10
        mov     eax, dword [ebp+14H]                    ; 102B _ 8B. 45, 14
        mov     dword [esp+0CH], eax                    ; 102E _ 89. 44 24, 0C
        mov     eax, dword [ebp-0CH]                    ; 1032 _ 8B. 45, F4
        mov     dword [esp+8H], eax                     ; 1035 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 1039 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 103C _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1040 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1043 _ 89. 04 24
        call    sheet_refresh                           ; 1046 _ E8, FFFFFFFC(rel)
        add     esp, 52                                 ; 104B _ 83. C4, 34
        pop     ebx                                     ; 104E _ 5B
        pop     ebp                                     ; 104F _ 5D
        ret                                             ; 1050 _ C3
; paint_string End of function

init_mouse_cursor:; Function begin
        push    ebp                                     ; 1051 _ 55
        mov     ebp, esp                                ; 1052 _ 89. E5
        sub     esp, 20                                 ; 1054 _ 83. EC, 14
        mov     eax, dword [ebp+0CH]                    ; 1057 _ 8B. 45, 0C
        mov     byte [ebp-14H], al                      ; 105A _ 88. 45, EC
        mov     dword [ebp-8H], 0                       ; 105D _ C7. 45, F8, 00000000
        jmp     ?_038                                   ; 1064 _ E9, 0000009C

?_032:  mov     dword [ebp-4H], 0                       ; 1069 _ C7. 45, FC, 00000000
        jmp     ?_037                                   ; 1070 _ E9, 00000082

?_033:  mov     eax, dword [ebp-8H]                     ; 1075 _ 8B. 45, F8
        shl     eax, 4                                  ; 1078 _ C1. E0, 04
        mov     edx, eax                                ; 107B _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 107D _ 8B. 45, FC
        add     eax, edx                                ; 1080 _ 01. D0
        add     eax, cursor.1799                        ; 1082 _ 05, 000000C0(d)
        movzx   eax, byte [eax]                         ; 1087 _ 0F B6. 00
        cmp     al, 42                                  ; 108A _ 3C, 2A
        jnz     ?_034                                   ; 108C _ 75, 19
        mov     eax, dword [ebp-8H]                     ; 108E _ 8B. 45, F8
        shl     eax, 4                                  ; 1091 _ C1. E0, 04
        mov     edx, eax                                ; 1094 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 1096 _ 8B. 45, FC
        add     eax, edx                                ; 1099 _ 01. D0
        mov     edx, eax                                ; 109B _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 109D _ 8B. 45, 08
        add     eax, edx                                ; 10A0 _ 01. D0
        mov     byte [eax], 0                           ; 10A2 _ C6. 00, 00
        jmp     ?_036                                   ; 10A5 _ EB, 4C

?_034:  mov     eax, dword [ebp-8H]                     ; 10A7 _ 8B. 45, F8
        shl     eax, 4                                  ; 10AA _ C1. E0, 04
        mov     edx, eax                                ; 10AD _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 10AF _ 8B. 45, FC
        add     eax, edx                                ; 10B2 _ 01. D0
        add     eax, cursor.1799                        ; 10B4 _ 05, 000000C0(d)
        movzx   eax, byte [eax]                         ; 10B9 _ 0F B6. 00
        cmp     al, 79                                  ; 10BC _ 3C, 4F
        jnz     ?_035                                   ; 10BE _ 75, 19
        mov     eax, dword [ebp-8H]                     ; 10C0 _ 8B. 45, F8
        shl     eax, 4                                  ; 10C3 _ C1. E0, 04
        mov     edx, eax                                ; 10C6 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 10C8 _ 8B. 45, FC
        add     eax, edx                                ; 10CB _ 01. D0
        mov     edx, eax                                ; 10CD _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 10CF _ 8B. 45, 08
        add     eax, edx                                ; 10D2 _ 01. D0
        mov     byte [eax], 7                           ; 10D4 _ C6. 00, 07
        jmp     ?_036                                   ; 10D7 _ EB, 1A

?_035:  mov     eax, dword [ebp-8H]                     ; 10D9 _ 8B. 45, F8
        shl     eax, 4                                  ; 10DC _ C1. E0, 04
        mov     edx, eax                                ; 10DF _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 10E1 _ 8B. 45, FC
        add     eax, edx                                ; 10E4 _ 01. D0
        mov     edx, eax                                ; 10E6 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 10E8 _ 8B. 45, 08
        add     edx, eax                                ; 10EB _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 10ED _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 10F1 _ 88. 02
?_036:  add     dword [ebp-4H], 1                       ; 10F3 _ 83. 45, FC, 01
?_037:  cmp     dword [ebp-4H], 15                      ; 10F7 _ 83. 7D, FC, 0F
        jle     ?_033                                   ; 10FB _ 0F 8E, FFFFFF74
        add     dword [ebp-8H], 1                       ; 1101 _ 83. 45, F8, 01
?_038:  cmp     dword [ebp-8H], 15                      ; 1105 _ 83. 7D, F8, 0F
        jle     ?_032                                   ; 1109 _ 0F 8E, FFFFFF5A
        leave                                           ; 110F _ C9
        ret                                             ; 1110 _ C3
; init_mouse_cursor End of function

paint_block:; Function begin
        push    ebp                                     ; 1111 _ 55
        mov     ebp, esp                                ; 1112 _ 89. E5
        sub     esp, 16                                 ; 1114 _ 83. EC, 10
        mov     dword [ebp-8H], 0                       ; 1117 _ C7. 45, F8, 00000000
        jmp     ?_042                                   ; 111E _ EB, 50

?_039:  mov     dword [ebp-4H], 0                       ; 1120 _ C7. 45, FC, 00000000
        jmp     ?_041                                   ; 1127 _ EB, 3B

?_040:  mov     eax, dword [ebp-8H]                     ; 1129 _ 8B. 45, F8
        mov     edx, dword [ebp+14H]                    ; 112C _ 8B. 55, 14
        add     eax, edx                                ; 112F _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 1131 _ 0F AF. 45, 0C
        mov     edx, dword [ebp-4H]                     ; 1135 _ 8B. 55, FC
        mov     ecx, dword [ebp+10H]                    ; 1138 _ 8B. 4D, 10
        add     edx, ecx                                ; 113B _ 01. CA
        add     eax, edx                                ; 113D _ 01. D0
        mov     edx, eax                                ; 113F _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 1141 _ 8B. 45, 08
        add     edx, eax                                ; 1144 _ 01. C2
        mov     eax, dword [ebp-8H]                     ; 1146 _ 8B. 45, F8
        imul    eax, dword [ebp+18H]                    ; 1149 _ 0F AF. 45, 18
        mov     ecx, eax                                ; 114D _ 89. C1
        mov     eax, dword [ebp-4H]                     ; 114F _ 8B. 45, FC
        add     eax, ecx                                ; 1152 _ 01. C8
        mov     ecx, eax                                ; 1154 _ 89. C1
        mov     eax, dword [ebp+20H]                    ; 1156 _ 8B. 45, 20
        add     eax, ecx                                ; 1159 _ 01. C8
        movzx   eax, byte [eax]                         ; 115B _ 0F B6. 00
        mov     byte [edx], al                          ; 115E _ 88. 02
        add     dword [ebp-4H], 1                       ; 1160 _ 83. 45, FC, 01
?_041:  mov     eax, dword [ebp-4H]                     ; 1164 _ 8B. 45, FC
        cmp     eax, dword [ebp+18H]                    ; 1167 _ 3B. 45, 18
        jl      ?_040                                   ; 116A _ 7C, BD
        add     dword [ebp-8H], 1                       ; 116C _ 83. 45, F8, 01
?_042:  mov     eax, dword [ebp-8H]                     ; 1170 _ 8B. 45, F8
        cmp     eax, dword [ebp+1CH]                    ; 1173 _ 3B. 45, 1C
        jl      ?_039                                   ; 1176 _ 7C, A8
        leave                                           ; 1178 _ C9
        ret                                             ; 1179 _ C3
; paint_block End of function

init_fifo_buf:; Function begin
        push    ebp                                     ; 117A _ 55
        mov     ebp, esp                                ; 117B _ 89. E5
        sub     esp, 24                                 ; 117D _ 83. EC, 18
        mov     dword [esp+0CH], 0                      ; 1180 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], mousebuf                ; 1188 _ C7. 44 24, 08, 00000000(d)
        mov     dword [esp+4H], 128                     ; 1190 _ C7. 44 24, 04, 00000080
        mov     dword [esp], mouseinfo                  ; 1198 _ C7. 04 24, 00000000(d)
        call    fifo8_init                              ; 119F _ E8, FFFFFFFC(rel)
        mov     dword [esp+0CH], 0                      ; 11A4 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], keybuf                  ; 11AC _ C7. 44 24, 08, 00000000(d)
        mov     dword [esp+4H], 32                      ; 11B4 _ C7. 44 24, 04, 00000020
        mov     dword [esp], keyinfo                    ; 11BC _ C7. 04 24, 00000000(d)
        call    fifo8_init                              ; 11C3 _ E8, FFFFFFFC(rel)
        leave                                           ; 11C8 _ C9
        ret                                             ; 11C9 _ C3
; init_fifo_buf End of function

compute_mouse_position:; Function begin
        push    ebp                                     ; 11CA _ 55
        mov     ebp, esp                                ; 11CB _ 89. E5
        mov     eax, dword [ebp+10H]                    ; 11CD _ 8B. 45, 10
        mov     edx, dword [eax+4H]                     ; 11D0 _ 8B. 50, 04
        mov     eax, dword [mouse_x]                    ; 11D3 _ A1, 000002A8(d)
        add     eax, edx                                ; 11D8 _ 01. D0
        mov     dword [mouse_x], eax                    ; 11DA _ A3, 000002A8(d)
        mov     eax, dword [ebp+10H]                    ; 11DF _ 8B. 45, 10
        mov     edx, dword [eax+8H]                     ; 11E2 _ 8B. 50, 08
        mov     eax, dword [mouse_y]                    ; 11E5 _ A1, 000002AC(d)
        add     eax, edx                                ; 11EA _ 01. D0
        mov     dword [mouse_y], eax                    ; 11EC _ A3, 000002AC(d)
        mov     eax, dword [mouse_x]                    ; 11F1 _ A1, 000002A8(d)
        test    eax, eax                                ; 11F6 _ 85. C0
        jns     ?_043                                   ; 11F8 _ 79, 0A
        mov     dword [mouse_x], 0                      ; 11FA _ C7. 05, 000002A8(d), 00000000
?_043:  mov     eax, dword [mouse_y]                    ; 1204 _ A1, 000002AC(d)
        test    eax, eax                                ; 1209 _ 85. C0
        jns     ?_044                                   ; 120B _ 79, 0A
        mov     dword [mouse_y], 0                      ; 120D _ C7. 05, 000002AC(d), 00000000
?_044:  movzx   eax, word [?_216]                       ; 1217 _ 0F B7. 05, 00000184(d)
        cwde                                            ; 121E _ 98
        lea     edx, [eax-10H]                          ; 121F _ 8D. 50, F0
        mov     eax, dword [mouse_x]                    ; 1222 _ A1, 000002A8(d)
        cmp     edx, eax                                ; 1227 _ 39. C2
        jge     ?_045                                   ; 1229 _ 7D, 10
        movzx   eax, word [?_216]                       ; 122B _ 0F B7. 05, 00000184(d)
        cwde                                            ; 1232 _ 98
        sub     eax, 16                                 ; 1233 _ 83. E8, 10
        mov     dword [mouse_x], eax                    ; 1236 _ A3, 000002A8(d)
?_045:  movzx   eax, word [?_216]                       ; 123B _ 0F B7. 05, 00000184(d)
        cwde                                            ; 1242 _ 98
        lea     edx, [eax-10H]                          ; 1243 _ 8D. 50, F0
        mov     eax, dword [mouse_y]                    ; 1246 _ A1, 000002AC(d)
        cmp     edx, eax                                ; 124B _ 39. C2
        jge     ?_046                                   ; 124D _ 7D, 10
        movzx   eax, word [?_216]                       ; 124F _ 0F B7. 05, 00000184(d)
        cwde                                            ; 1256 _ 98
        sub     eax, 16                                 ; 1257 _ 83. E8, 10
        mov     dword [mouse_y], eax                    ; 125A _ A3, 000002AC(d)
?_046:  pop     ebp                                     ; 125F _ 5D
        ret                                             ; 1260 _ C3
; compute_mouse_position End of function

show_mouse_info:; Function begin
        push    ebp                                     ; 1261 _ 55
        mov     ebp, esp                                ; 1262 _ 89. E5
        sub     esp, 40                                 ; 1264 _ 83. EC, 28
        mov     byte [ebp-9H], 0                        ; 1267 _ C6. 45, F7, 00
        call    io_sti                                  ; 126B _ E8, FFFFFFFC(rel)
        mov     dword [esp], mouseinfo                  ; 1270 _ C7. 04 24, 00000000(d)
        call    fifo8_get                               ; 1277 _ E8, FFFFFFFC(rel)
        mov     byte [ebp-9H], al                       ; 127C _ 88. 45, F7
        movzx   eax, byte [ebp-9H]                      ; 127F _ 0F B6. 45, F7
        mov     dword [esp+4H], eax                     ; 1283 _ 89. 44 24, 04
        mov     dword [esp], mouse_send_info            ; 1287 _ C7. 04 24, 00000000(d)
        call    mouse_decode                            ; 128E _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 1293 _ 85. C0
        jz      ?_047                                   ; 1295 _ 74, 77
        mov     dword [esp+8H], mouse_send_info         ; 1297 _ C7. 44 24, 08, 00000000(d)
        mov     eax, dword [ebp+0CH]                    ; 129F _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 12A2 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 12A6 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 12A9 _ 89. 04 24
        call    compute_mouse_position                  ; 12AC _ E8, FFFFFFFC(rel)
        mov     edx, dword [mouse_y]                    ; 12B1 _ 8B. 15, 000002AC(d)
        mov     eax, dword [mouse_x]                    ; 12B7 _ A1, 000002A8(d)
        mov     dword [esp+0CH], edx                    ; 12BC _ 89. 54 24, 0C
        mov     dword [esp+8H], eax                     ; 12C0 _ 89. 44 24, 08
        mov     eax, dword [ebp+10H]                    ; 12C4 _ 8B. 45, 10
        mov     dword [esp+4H], eax                     ; 12C7 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 12CB _ 8B. 45, 08
        mov     dword [esp], eax                        ; 12CE _ 89. 04 24
        call    sheet_slide                             ; 12D1 _ E8, FFFFFFFC(rel)
        mov     eax, dword [mouse_send_info+0CH]        ; 12D6 _ A1, 0000000C(d)
        and     eax, 01H                                ; 12DB _ 83. E0, 01
        test    eax, eax                                ; 12DE _ 85. C0
        jz      ?_047                                   ; 12E0 _ 74, 2C
        mov     eax, dword [mouse_y]                    ; 12E2 _ A1, 000002AC(d)
        lea     ecx, [eax-8H]                           ; 12E7 _ 8D. 48, F8
        mov     eax, dword [mouse_x]                    ; 12EA _ A1, 000002A8(d)
        lea     edx, [eax-50H]                          ; 12EF _ 8D. 50, B0
        mov     eax, dword [sheet_win]                  ; 12F2 _ A1, 000002A4(d)
        mov     dword [esp+0CH], ecx                    ; 12F7 _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 12FB _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 12FF _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1303 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1306 _ 89. 04 24
        call    sheet_slide                             ; 1309 _ E8, FFFFFFFC(rel)
?_047:  leave                                           ; 130E _ C9
        ret                                             ; 130F _ C3
; show_mouse_info End of function

show_memory_info:; Function begin
        push    ebp                                     ; 1310 _ 55
        mov     ebp, esp                                ; 1311 _ 89. E5
        sub     esp, 88                                 ; 1313 _ 83. EC, 58
        mov     dword [ebp-38H], 0                      ; 1316 _ C7. 45, C8, 00000000
        mov     dword [ebp-34H], 0                      ; 131D _ C7. 45, CC, 00000000
        mov     dword [ebp-30H], 104                    ; 1324 _ C7. 45, D0, 00000068
        mov     eax, dword [screen_info]                ; 132B _ A1, 00000180(d)
        mov     dword [ebp-2CH], eax                    ; 1330 _ 89. 45, D4
        movzx   eax, word [?_216]                       ; 1333 _ 0F B7. 05, 00000184(d)
        cwde                                            ; 133A _ 98
        mov     dword [ebp-28H], eax                    ; 133B _ 89. 45, D8
        movzx   eax, word [?_217]                       ; 133E _ 0F B7. 05, 00000186(d)
        cwde                                            ; 1345 _ 98
        mov     dword [ebp-24H], eax                    ; 1346 _ 89. 45, DC
        mov     eax, dword [ebp+0CH]                    ; 1349 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 134C _ 8B. 00
        mov     edx, dword [ebp-24H]                    ; 134E _ 8B. 55, DC
        mov     dword [esp+8H], edx                     ; 1351 _ 89. 54 24, 08
        mov     edx, dword [ebp-28H]                    ; 1355 _ 8B. 55, D8
        mov     dword [esp+4H], edx                     ; 1358 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 135C _ 89. 04 24
        call    init_desktop                            ; 135F _ E8, FFFFFFFC(rel)
        mov     dword [esp+14H], 7                      ; 1364 _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_207                  ; 136C _ C7. 44 24, 10, 00000018(d)
        mov     eax, dword [ebp-34H]                    ; 1374 _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 1377 _ 89. 44 24, 0C
        mov     eax, dword [ebp-38H]                    ; 137B _ 8B. 45, C8
        mov     dword [esp+8H], eax                     ; 137E _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 1382 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 1385 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1389 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 138C _ 89. 04 24
        call    paint_string                            ; 138F _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+14H]                    ; 1394 _ 8B. 45, 14
        mov     dword [esp], eax                        ; 1397 _ 89. 04 24
        call    intToHexStr                             ; 139A _ E8, FFFFFFFC(rel)
        mov     dword [ebp-20H], eax                    ; 139F _ 89. 45, E0
        mov     dword [esp+14H], 7                      ; 13A2 _ C7. 44 24, 14, 00000007
        mov     eax, dword [ebp-20H]                    ; 13AA _ 8B. 45, E0
        mov     dword [esp+10H], eax                    ; 13AD _ 89. 44 24, 10
        mov     eax, dword [ebp-34H]                    ; 13B1 _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 13B4 _ 89. 44 24, 0C
        mov     eax, dword [ebp-30H]                    ; 13B8 _ 8B. 45, D0
        mov     dword [esp+8H], eax                     ; 13BB _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 13BF _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 13C2 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 13C6 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 13C9 _ 89. 04 24
        call    paint_string                            ; 13CC _ E8, FFFFFFFC(rel)
        add     dword [ebp-34H], 16                     ; 13D1 _ 83. 45, CC, 10
        mov     dword [esp+14H], 7                      ; 13D5 _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_208                  ; 13DD _ C7. 44 24, 10, 00000022(d)
        mov     eax, dword [ebp-34H]                    ; 13E5 _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 13E8 _ 89. 44 24, 0C
        mov     eax, dword [ebp-38H]                    ; 13EC _ 8B. 45, C8
        mov     dword [esp+8H], eax                     ; 13EF _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 13F3 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 13F6 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 13FA _ 8B. 45, 08
        mov     dword [esp], eax                        ; 13FD _ 89. 04 24
        call    paint_string                            ; 1400 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 1405 _ 8B. 45, 10
        mov     eax, dword [eax]                        ; 1408 _ 8B. 00
        mov     dword [esp], eax                        ; 140A _ 89. 04 24
        call    intToHexStr                             ; 140D _ E8, FFFFFFFC(rel)
        mov     dword [ebp-1CH], eax                    ; 1412 _ 89. 45, E4
        mov     dword [esp+14H], 7                      ; 1415 _ C7. 44 24, 14, 00000007
        mov     eax, dword [ebp-1CH]                    ; 141D _ 8B. 45, E4
        mov     dword [esp+10H], eax                    ; 1420 _ 89. 44 24, 10
        mov     eax, dword [ebp-34H]                    ; 1424 _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 1427 _ 89. 44 24, 0C
        mov     eax, dword [ebp-30H]                    ; 142B _ 8B. 45, D0
        mov     dword [esp+8H], eax                     ; 142E _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 1432 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 1435 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1439 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 143C _ 89. 04 24
        call    paint_string                            ; 143F _ E8, FFFFFFFC(rel)
        add     dword [ebp-34H], 16                     ; 1444 _ 83. 45, CC, 10
        mov     dword [esp+14H], 7                      ; 1448 _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_209                  ; 1450 _ C7. 44 24, 10, 0000002E(d)
        mov     eax, dword [ebp-34H]                    ; 1458 _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 145B _ 89. 44 24, 0C
        mov     eax, dword [ebp-38H]                    ; 145F _ 8B. 45, C8
        mov     dword [esp+8H], eax                     ; 1462 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 1466 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 1469 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 146D _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1470 _ 89. 04 24
        call    paint_string                            ; 1473 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 1478 _ 8B. 45, 10
        mov     eax, dword [eax+4H]                     ; 147B _ 8B. 40, 04
        mov     dword [esp], eax                        ; 147E _ 89. 04 24
        call    intToHexStr                             ; 1481 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-18H], eax                    ; 1486 _ 89. 45, E8
        mov     dword [esp+14H], 7                      ; 1489 _ C7. 44 24, 14, 00000007
        mov     eax, dword [ebp-18H]                    ; 1491 _ 8B. 45, E8
        mov     dword [esp+10H], eax                    ; 1494 _ 89. 44 24, 10
        mov     eax, dword [ebp-34H]                    ; 1498 _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 149B _ 89. 44 24, 0C
        mov     eax, dword [ebp-30H]                    ; 149F _ 8B. 45, D0
        mov     dword [esp+8H], eax                     ; 14A2 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 14A6 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 14A9 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 14AD _ 8B. 45, 08
        mov     dword [esp], eax                        ; 14B0 _ 89. 04 24
        call    paint_string                            ; 14B3 _ E8, FFFFFFFC(rel)
        add     dword [ebp-34H], 16                     ; 14B8 _ 83. 45, CC, 10
        mov     dword [esp+14H], 7                      ; 14BC _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_210                  ; 14C4 _ C7. 44 24, 10, 0000003A(d)
        mov     eax, dword [ebp-34H]                    ; 14CC _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 14CF _ 89. 44 24, 0C
        mov     eax, dword [ebp-38H]                    ; 14D3 _ 8B. 45, C8
        mov     dword [esp+8H], eax                     ; 14D6 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 14DA _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 14DD _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 14E1 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 14E4 _ 89. 04 24
        call    paint_string                            ; 14E7 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 14EC _ 8B. 45, 10
        mov     eax, dword [eax+8H]                     ; 14EF _ 8B. 40, 08
        mov     dword [esp], eax                        ; 14F2 _ 89. 04 24
        call    intToHexStr                             ; 14F5 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-14H], eax                    ; 14FA _ 89. 45, EC
        mov     dword [esp+14H], 7                      ; 14FD _ C7. 44 24, 14, 00000007
        mov     eax, dword [ebp-14H]                    ; 1505 _ 8B. 45, EC
        mov     dword [esp+10H], eax                    ; 1508 _ 89. 44 24, 10
        mov     eax, dword [ebp-34H]                    ; 150C _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 150F _ 89. 44 24, 0C
        mov     eax, dword [ebp-30H]                    ; 1513 _ 8B. 45, D0
        mov     dword [esp+8H], eax                     ; 1516 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 151A _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 151D _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1521 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1524 _ 89. 04 24
        call    paint_string                            ; 1527 _ E8, FFFFFFFC(rel)
        add     dword [ebp-34H], 16                     ; 152C _ 83. 45, CC, 10
        mov     dword [esp+14H], 7                      ; 1530 _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_211                  ; 1538 _ C7. 44 24, 10, 00000046(d)
        mov     eax, dword [ebp-34H]                    ; 1540 _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 1543 _ 89. 44 24, 0C
        mov     eax, dword [ebp-38H]                    ; 1547 _ 8B. 45, C8
        mov     dword [esp+8H], eax                     ; 154A _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 154E _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 1551 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1555 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1558 _ 89. 04 24
        call    paint_string                            ; 155B _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 1560 _ 8B. 45, 10
        mov     eax, dword [eax+0CH]                    ; 1563 _ 8B. 40, 0C
        mov     dword [esp], eax                        ; 1566 _ 89. 04 24
        call    intToHexStr                             ; 1569 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 156E _ 89. 45, F0
        mov     dword [esp+14H], 7                      ; 1571 _ C7. 44 24, 14, 00000007
        mov     eax, dword [ebp-10H]                    ; 1579 _ 8B. 45, F0
        mov     dword [esp+10H], eax                    ; 157C _ 89. 44 24, 10
        mov     eax, dword [ebp-34H]                    ; 1580 _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 1583 _ 89. 44 24, 0C
        mov     eax, dword [ebp-30H]                    ; 1587 _ 8B. 45, D0
        mov     dword [esp+8H], eax                     ; 158A _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 158E _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 1591 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1595 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1598 _ 89. 04 24
        call    paint_string                            ; 159B _ E8, FFFFFFFC(rel)
        add     dword [ebp-34H], 16                     ; 15A0 _ 83. 45, CC, 10
        mov     dword [esp+14H], 7                      ; 15A4 _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_212                  ; 15AC _ C7. 44 24, 10, 00000053(d)
        mov     eax, dword [ebp-34H]                    ; 15B4 _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 15B7 _ 89. 44 24, 0C
        mov     eax, dword [ebp-38H]                    ; 15BB _ 8B. 45, C8
        mov     dword [esp+8H], eax                     ; 15BE _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 15C2 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 15C5 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 15C9 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 15CC _ 89. 04 24
        call    paint_string                            ; 15CF _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 15D4 _ 8B. 45, 10
        mov     eax, dword [eax+10H]                    ; 15D7 _ 8B. 40, 10
        mov     dword [esp], eax                        ; 15DA _ 89. 04 24
        call    intToHexStr                             ; 15DD _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 15E2 _ 89. 45, F4
        mov     dword [esp+14H], 7                      ; 15E5 _ C7. 44 24, 14, 00000007
        mov     eax, dword [ebp-0CH]                    ; 15ED _ 8B. 45, F4
        mov     dword [esp+10H], eax                    ; 15F0 _ 89. 44 24, 10
        mov     eax, dword [ebp-34H]                    ; 15F4 _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 15F7 _ 89. 44 24, 0C
        mov     eax, dword [ebp-30H]                    ; 15FB _ 8B. 45, D0
        mov     dword [esp+8H], eax                     ; 15FE _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 1602 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 1605 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1609 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 160C _ 89. 04 24
        call    paint_string                            ; 160F _ E8, FFFFFFFC(rel)
        add     dword [ebp-34H], 16                     ; 1614 _ 83. 45, CC, 10
        leave                                           ; 1618 _ C9
        ret                                             ; 1619 _ C3
; show_memory_info End of function

message_box:; Function begin
        push    ebp                                     ; 161A _ 55
        mov     ebp, esp                                ; 161B _ 89. E5
        sub     esp, 56                                 ; 161D _ 83. EC, 38
        mov     eax, dword [ebp+8H]                     ; 1620 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1623 _ 89. 04 24
        call    sheet_alloc                             ; 1626 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 162B _ 89. 45, F0
        mov     eax, dword [memman]                     ; 162E _ A1, 00000000(d)
        mov     dword [esp+4H], 10880                   ; 1633 _ C7. 44 24, 04, 00002A80
        mov     dword [esp], eax                        ; 163B _ 89. 04 24
        call    memman_alloc_4k                         ; 163E _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 1643 _ 89. 45, F4
        mov     dword [esp+10H], 99                     ; 1646 _ C7. 44 24, 10, 00000063
        mov     dword [esp+0CH], 68                     ; 164E _ C7. 44 24, 0C, 00000044
        mov     dword [esp+8H], 160                     ; 1656 _ C7. 44 24, 08, 000000A0
        mov     eax, dword [ebp-0CH]                    ; 165E _ 8B. 45, F4
        mov     dword [esp+4H], eax                     ; 1661 _ 89. 44 24, 04
        mov     eax, dword [ebp-10H]                    ; 1665 _ 8B. 45, F0
        mov     dword [esp], eax                        ; 1668 _ 89. 04 24
        call    sheet_setbuf                            ; 166B _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+0CH]                    ; 1670 _ 8B. 45, 0C
        mov     dword [esp+8H], eax                     ; 1673 _ 89. 44 24, 08
        mov     eax, dword [ebp-10H]                    ; 1677 _ 8B. 45, F0
        mov     dword [esp+4H], eax                     ; 167A _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 167E _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1681 _ 89. 04 24
        call    make_windows                            ; 1684 _ E8, FFFFFFFC(rel)
        mov     dword [esp+14H], 7                      ; 1689 _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], 16                     ; 1691 _ C7. 44 24, 10, 00000010
        mov     dword [esp+0CH], 144                    ; 1699 _ C7. 44 24, 0C, 00000090
        mov     dword [esp+8H], 28                      ; 16A1 _ C7. 44 24, 08, 0000001C
        mov     dword [esp+4H], 8                       ; 16A9 _ C7. 44 24, 04, 00000008
        mov     eax, dword [ebp-10H]                    ; 16B1 _ 8B. 45, F0
        mov     dword [esp], eax                        ; 16B4 _ 89. 04 24
        call    make_textbox                            ; 16B7 _ E8, FFFFFFFC(rel)
        mov     dword [esp+0CH], 172                    ; 16BC _ C7. 44 24, 0C, 000000AC
        mov     dword [esp+8H], 260                     ; 16C4 _ C7. 44 24, 08, 00000104
        mov     eax, dword [ebp-10H]                    ; 16CC _ 8B. 45, F0
        mov     dword [esp+4H], eax                     ; 16CF _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 16D3 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 16D6 _ 89. 04 24
        call    sheet_slide                             ; 16D9 _ E8, FFFFFFFC(rel)
        mov     dword [esp+8H], 2                       ; 16DE _ C7. 44 24, 08, 00000002
        mov     eax, dword [ebp-10H]                    ; 16E6 _ 8B. 45, F0
        mov     dword [esp+4H], eax                     ; 16E9 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 16ED _ 8B. 45, 08
        mov     dword [esp], eax                        ; 16F0 _ 89. 04 24
        call    sheet_updown                            ; 16F3 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 16F8 _ 8B. 45, F0
        leave                                           ; 16FB _ C9
        ret                                             ; 16FC _ C3
; message_box End of function

make_textbox:; Function begin
        push    ebp                                     ; 16FD _ 55
        mov     ebp, esp                                ; 16FE _ 89. E5
        push    edi                                     ; 1700 _ 57
        push    esi                                     ; 1701 _ 56
        push    ebx                                     ; 1702 _ 53
        sub     esp, 44                                 ; 1703 _ 83. EC, 2C
        mov     eax, dword [ebp+14H]                    ; 1706 _ 8B. 45, 14
        mov     edx, dword [ebp+0CH]                    ; 1709 _ 8B. 55, 0C
        add     eax, edx                                ; 170C _ 01. D0
        mov     dword [ebp-14H], eax                    ; 170E _ 89. 45, EC
        mov     eax, dword [ebp+18H]                    ; 1711 _ 8B. 45, 18
        mov     edx, dword [ebp+10H]                    ; 1714 _ 8B. 55, 10
        add     eax, edx                                ; 1717 _ 01. D0
        mov     dword [ebp-10H], eax                    ; 1719 _ 89. 45, F0
        mov     eax, dword [ebp+10H]                    ; 171C _ 8B. 45, 10
        lea     edi, [eax-3H]                           ; 171F _ 8D. 78, FD
        mov     eax, dword [ebp-14H]                    ; 1722 _ 8B. 45, EC
        lea     esi, [eax+1H]                           ; 1725 _ 8D. 70, 01
        mov     eax, dword [ebp+10H]                    ; 1728 _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 172B _ 8D. 58, FD
        mov     eax, dword [ebp+0CH]                    ; 172E _ 8B. 45, 0C
        lea     ecx, [eax-2H]                           ; 1731 _ 8D. 48, FE
        mov     eax, dword [ebp+8H]                     ; 1734 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 1737 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 173A _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 173D _ 8B. 00
        mov     dword [esp+18H], edi                    ; 173F _ 89. 7C 24, 18
        mov     dword [esp+14H], esi                    ; 1743 _ 89. 74 24, 14
        mov     dword [esp+10H], ebx                    ; 1747 _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 174B _ 89. 4C 24, 0C
        mov     dword [esp+8H], 15                      ; 174F _ C7. 44 24, 08, 0000000F
        mov     dword [esp+4H], edx                     ; 1757 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 175B _ 89. 04 24
        call    paint_rectangle                         ; 175E _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 1763 _ 8B. 45, F0
        lea     edi, [eax+1H]                           ; 1766 _ 8D. 78, 01
        mov     eax, dword [ebp+0CH]                    ; 1769 _ 8B. 45, 0C
        lea     esi, [eax-3H]                           ; 176C _ 8D. 70, FD
        mov     eax, dword [ebp+10H]                    ; 176F _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 1772 _ 8D. 58, FD
        mov     eax, dword [ebp+0CH]                    ; 1775 _ 8B. 45, 0C
        lea     ecx, [eax-3H]                           ; 1778 _ 8D. 48, FD
        mov     eax, dword [ebp+8H]                     ; 177B _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 177E _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1781 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1784 _ 8B. 00
        mov     dword [esp+18H], edi                    ; 1786 _ 89. 7C 24, 18
        mov     dword [esp+14H], esi                    ; 178A _ 89. 74 24, 14
        mov     dword [esp+10H], ebx                    ; 178E _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 1792 _ 89. 4C 24, 0C
        mov     dword [esp+8H], 15                      ; 1796 _ C7. 44 24, 08, 0000000F
        mov     dword [esp+4H], edx                     ; 179E _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 17A2 _ 89. 04 24
        call    paint_rectangle                         ; 17A5 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 17AA _ 8B. 45, F0
        lea     edi, [eax+2H]                           ; 17AD _ 8D. 78, 02
        mov     eax, dword [ebp-14H]                    ; 17B0 _ 8B. 45, EC
        lea     esi, [eax+1H]                           ; 17B3 _ 8D. 70, 01
        mov     eax, dword [ebp-10H]                    ; 17B6 _ 8B. 45, F0
        lea     ebx, [eax+2H]                           ; 17B9 _ 8D. 58, 02
        mov     eax, dword [ebp+0CH]                    ; 17BC _ 8B. 45, 0C
        lea     ecx, [eax-3H]                           ; 17BF _ 8D. 48, FD
        mov     eax, dword [ebp+8H]                     ; 17C2 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 17C5 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 17C8 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 17CB _ 8B. 00
        mov     dword [esp+18H], edi                    ; 17CD _ 89. 7C 24, 18
        mov     dword [esp+14H], esi                    ; 17D1 _ 89. 74 24, 14
        mov     dword [esp+10H], ebx                    ; 17D5 _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 17D9 _ 89. 4C 24, 0C
        mov     dword [esp+8H], 7                       ; 17DD _ C7. 44 24, 08, 00000007
        mov     dword [esp+4H], edx                     ; 17E5 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 17E9 _ 89. 04 24
        call    paint_rectangle                         ; 17EC _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 17F1 _ 8B. 45, F0
        lea     edi, [eax+2H]                           ; 17F4 _ 8D. 78, 02
        mov     eax, dword [ebp-14H]                    ; 17F7 _ 8B. 45, EC
        lea     esi, [eax+2H]                           ; 17FA _ 8D. 70, 02
        mov     eax, dword [ebp+10H]                    ; 17FD _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 1800 _ 8D. 58, FD
        mov     eax, dword [ebp-14H]                    ; 1803 _ 8B. 45, EC
        lea     ecx, [eax+2H]                           ; 1806 _ 8D. 48, 02
        mov     eax, dword [ebp+8H]                     ; 1809 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 180C _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 180F _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1812 _ 8B. 00
        mov     dword [esp+18H], edi                    ; 1814 _ 89. 7C 24, 18
        mov     dword [esp+14H], esi                    ; 1818 _ 89. 74 24, 14
        mov     dword [esp+10H], ebx                    ; 181C _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 1820 _ 89. 4C 24, 0C
        mov     dword [esp+8H], 7                       ; 1824 _ C7. 44 24, 08, 00000007
        mov     dword [esp+4H], edx                     ; 182C _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1830 _ 89. 04 24
        call    paint_rectangle                         ; 1833 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 1838 _ 8B. 45, 10
        lea     ecx, [eax-2H]                           ; 183B _ 8D. 48, FE
        mov     eax, dword [ebp+10H]                    ; 183E _ 8B. 45, 10
        lea     esi, [eax-2H]                           ; 1841 _ 8D. 70, FE
        mov     eax, dword [ebp+0CH]                    ; 1844 _ 8B. 45, 0C
        lea     ebx, [eax-1H]                           ; 1847 _ 8D. 58, FF
        mov     eax, dword [ebp+8H]                     ; 184A _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 184D _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1850 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1853 _ 8B. 00
        mov     dword [esp+18H], ecx                    ; 1855 _ 89. 4C 24, 18
        mov     ecx, dword [ebp-14H]                    ; 1859 _ 8B. 4D, EC
        mov     dword [esp+14H], ecx                    ; 185C _ 89. 4C 24, 14
        mov     dword [esp+10H], esi                    ; 1860 _ 89. 74 24, 10
        mov     dword [esp+0CH], ebx                    ; 1864 _ 89. 5C 24, 0C
        mov     dword [esp+8H], 0                       ; 1868 _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], edx                     ; 1870 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1874 _ 89. 04 24
        call    paint_rectangle                         ; 1877 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+0CH]                    ; 187C _ 8B. 45, 0C
        lea     edi, [eax-2H]                           ; 187F _ 8D. 78, FE
        mov     eax, dword [ebp+10H]                    ; 1882 _ 8B. 45, 10
        lea     esi, [eax-2H]                           ; 1885 _ 8D. 70, FE
        mov     eax, dword [ebp+0CH]                    ; 1888 _ 8B. 45, 0C
        lea     ebx, [eax-2H]                           ; 188B _ 8D. 58, FE
        mov     eax, dword [ebp+8H]                     ; 188E _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 1891 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1894 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1897 _ 8B. 00
        mov     ecx, dword [ebp-10H]                    ; 1899 _ 8B. 4D, F0
        mov     dword [esp+18H], ecx                    ; 189C _ 89. 4C 24, 18
        mov     dword [esp+14H], edi                    ; 18A0 _ 89. 7C 24, 14
        mov     dword [esp+10H], esi                    ; 18A4 _ 89. 74 24, 10
        mov     dword [esp+0CH], ebx                    ; 18A8 _ 89. 5C 24, 0C
        mov     dword [esp+8H], 0                       ; 18AC _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], edx                     ; 18B4 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 18B8 _ 89. 04 24
        call    paint_rectangle                         ; 18BB _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 18C0 _ 8B. 45, F0
        lea     ecx, [eax+1H]                           ; 18C3 _ 8D. 48, 01
        mov     eax, dword [ebp-10H]                    ; 18C6 _ 8B. 45, F0
        lea     esi, [eax+1H]                           ; 18C9 _ 8D. 70, 01
        mov     eax, dword [ebp+0CH]                    ; 18CC _ 8B. 45, 0C
        lea     ebx, [eax-2H]                           ; 18CF _ 8D. 58, FE
        mov     eax, dword [ebp+8H]                     ; 18D2 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 18D5 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 18D8 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 18DB _ 8B. 00
        mov     dword [esp+18H], ecx                    ; 18DD _ 89. 4C 24, 18
        mov     ecx, dword [ebp-14H]                    ; 18E1 _ 8B. 4D, EC
        mov     dword [esp+14H], ecx                    ; 18E4 _ 89. 4C 24, 14
        mov     dword [esp+10H], esi                    ; 18E8 _ 89. 74 24, 10
        mov     dword [esp+0CH], ebx                    ; 18EC _ 89. 5C 24, 0C
        mov     dword [esp+8H], 8                       ; 18F0 _ C7. 44 24, 08, 00000008
        mov     dword [esp+4H], edx                     ; 18F8 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 18FC _ 89. 04 24
        call    paint_rectangle                         ; 18FF _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 1904 _ 8B. 45, F0
        lea     edi, [eax+1H]                           ; 1907 _ 8D. 78, 01
        mov     eax, dword [ebp-14H]                    ; 190A _ 8B. 45, EC
        lea     esi, [eax+1H]                           ; 190D _ 8D. 70, 01
        mov     eax, dword [ebp+10H]                    ; 1910 _ 8B. 45, 10
        lea     ebx, [eax-2H]                           ; 1913 _ 8D. 58, FE
        mov     eax, dword [ebp-14H]                    ; 1916 _ 8B. 45, EC
        lea     ecx, [eax+1H]                           ; 1919 _ 8D. 48, 01
        mov     eax, dword [ebp+8H]                     ; 191C _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 191F _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1922 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1925 _ 8B. 00
        mov     dword [esp+18H], edi                    ; 1927 _ 89. 7C 24, 18
        mov     dword [esp+14H], esi                    ; 192B _ 89. 74 24, 14
        mov     dword [esp+10H], ebx                    ; 192F _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 1933 _ 89. 4C 24, 0C
        mov     dword [esp+8H], 8                       ; 1937 _ C7. 44 24, 08, 00000008
        mov     dword [esp+4H], edx                     ; 193F _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1943 _ 89. 04 24
        call    paint_rectangle                         ; 1946 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 194B _ 8B. 45, 10
        lea     edi, [eax-1H]                           ; 194E _ 8D. 78, FF
        mov     eax, dword [ebp+0CH]                    ; 1951 _ 8B. 45, 0C
        lea     esi, [eax-1H]                           ; 1954 _ 8D. 70, FF
        mov     eax, dword [ebp+1CH]                    ; 1957 _ 8B. 45, 1C
        movzx   ecx, al                                 ; 195A _ 0F B6. C8
        mov     eax, dword [ebp+8H]                     ; 195D _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 1960 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1963 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1966 _ 8B. 00
        mov     ebx, dword [ebp-10H]                    ; 1968 _ 8B. 5D, F0
        mov     dword [esp+18H], ebx                    ; 196B _ 89. 5C 24, 18
        mov     ebx, dword [ebp-14H]                    ; 196F _ 8B. 5D, EC
        mov     dword [esp+14H], ebx                    ; 1972 _ 89. 5C 24, 14
        mov     dword [esp+10H], edi                    ; 1976 _ 89. 7C 24, 10
        mov     dword [esp+0CH], esi                    ; 197A _ 89. 74 24, 0C
        mov     dword [esp+8H], ecx                     ; 197E _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 1982 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1986 _ 89. 04 24
        call    paint_rectangle                         ; 1989 _ E8, FFFFFFFC(rel)
        add     esp, 44                                 ; 198E _ 83. C4, 2C
        pop     ebx                                     ; 1991 _ 5B
        pop     esi                                     ; 1992 _ 5E
        pop     edi                                     ; 1993 _ 5F
        pop     ebp                                     ; 1994 _ 5D
        ret                                             ; 1995 _ C3
; make_textbox End of function

make_windows:; Function begin
        push    ebp                                     ; 1996 _ 55
        mov     ebp, esp                                ; 1997 _ 89. E5
        push    ebx                                     ; 1999 _ 53
        sub     esp, 68                                 ; 199A _ 83. EC, 44
        mov     eax, dword [ebp+0CH]                    ; 199D _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 19A0 _ 8B. 40, 04
        mov     dword [ebp-10H], eax                    ; 19A3 _ 89. 45, F0
        mov     eax, dword [ebp+0CH]                    ; 19A6 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 19A9 _ 8B. 40, 08
        mov     dword [ebp-0CH], eax                    ; 19AC _ 89. 45, F4
        mov     eax, dword [ebp-10H]                    ; 19AF _ 8B. 45, F0
        lea     edx, [eax-1H]                           ; 19B2 _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 19B5 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 19B8 _ 8B. 00
        mov     dword [esp+18H], 0                      ; 19BA _ C7. 44 24, 18, 00000000
        mov     dword [esp+14H], edx                    ; 19C2 _ 89. 54 24, 14
        mov     dword [esp+10H], 0                      ; 19C6 _ C7. 44 24, 10, 00000000
        mov     dword [esp+0CH], 0                      ; 19CE _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 8                       ; 19D6 _ C7. 44 24, 08, 00000008
        mov     edx, dword [ebp-10H]                    ; 19DE _ 8B. 55, F0
        mov     dword [esp+4H], edx                     ; 19E1 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 19E5 _ 89. 04 24
        call    paint_rectangle                         ; 19E8 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 19ED _ 8B. 45, F0
        lea     edx, [eax-2H]                           ; 19F0 _ 8D. 50, FE
        mov     eax, dword [ebp+0CH]                    ; 19F3 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 19F6 _ 8B. 00
        mov     dword [esp+18H], 1                      ; 19F8 _ C7. 44 24, 18, 00000001
        mov     dword [esp+14H], edx                    ; 1A00 _ 89. 54 24, 14
        mov     dword [esp+10H], 1                      ; 1A04 _ C7. 44 24, 10, 00000001
        mov     dword [esp+0CH], 1                      ; 1A0C _ C7. 44 24, 0C, 00000001
        mov     dword [esp+8H], 7                       ; 1A14 _ C7. 44 24, 08, 00000007
        mov     edx, dword [ebp-10H]                    ; 1A1C _ 8B. 55, F0
        mov     dword [esp+4H], edx                     ; 1A1F _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1A23 _ 89. 04 24
        call    paint_rectangle                         ; 1A26 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 1A2B _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 1A2E _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 1A31 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1A34 _ 8B. 00
        mov     dword [esp+18H], edx                    ; 1A36 _ 89. 54 24, 18
        mov     dword [esp+14H], 0                      ; 1A3A _ C7. 44 24, 14, 00000000
        mov     dword [esp+10H], 0                      ; 1A42 _ C7. 44 24, 10, 00000000
        mov     dword [esp+0CH], 0                      ; 1A4A _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 8                       ; 1A52 _ C7. 44 24, 08, 00000008
        mov     edx, dword [ebp-10H]                    ; 1A5A _ 8B. 55, F0
        mov     dword [esp+4H], edx                     ; 1A5D _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1A61 _ 89. 04 24
        call    paint_rectangle                         ; 1A64 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 1A69 _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 1A6C _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 1A6F _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1A72 _ 8B. 00
        mov     dword [esp+18H], edx                    ; 1A74 _ 89. 54 24, 18
        mov     dword [esp+14H], 1                      ; 1A78 _ C7. 44 24, 14, 00000001
        mov     dword [esp+10H], 1                      ; 1A80 _ C7. 44 24, 10, 00000001
        mov     dword [esp+0CH], 1                      ; 1A88 _ C7. 44 24, 0C, 00000001
        mov     dword [esp+8H], 7                       ; 1A90 _ C7. 44 24, 08, 00000007
        mov     edx, dword [ebp-10H]                    ; 1A98 _ 8B. 55, F0
        mov     dword [esp+4H], edx                     ; 1A9B _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1A9F _ 89. 04 24
        call    paint_rectangle                         ; 1AA2 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 1AA7 _ 8B. 45, F4
        lea     ebx, [eax-2H]                           ; 1AAA _ 8D. 58, FE
        mov     eax, dword [ebp-10H]                    ; 1AAD _ 8B. 45, F0
        lea     ecx, [eax-2H]                           ; 1AB0 _ 8D. 48, FE
        mov     eax, dword [ebp-10H]                    ; 1AB3 _ 8B. 45, F0
        lea     edx, [eax-2H]                           ; 1AB6 _ 8D. 50, FE
        mov     eax, dword [ebp+0CH]                    ; 1AB9 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1ABC _ 8B. 00
        mov     dword [esp+18H], ebx                    ; 1ABE _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 1AC2 _ 89. 4C 24, 14
        mov     dword [esp+10H], 1                      ; 1AC6 _ C7. 44 24, 10, 00000001
        mov     dword [esp+0CH], edx                    ; 1ACE _ 89. 54 24, 0C
        mov     dword [esp+8H], 15                      ; 1AD2 _ C7. 44 24, 08, 0000000F
        mov     edx, dword [ebp-10H]                    ; 1ADA _ 8B. 55, F0
        mov     dword [esp+4H], edx                     ; 1ADD _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1AE1 _ 89. 04 24
        call    paint_rectangle                         ; 1AE4 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 1AE9 _ 8B. 45, F4
        lea     ebx, [eax-1H]                           ; 1AEC _ 8D. 58, FF
        mov     eax, dword [ebp-10H]                    ; 1AEF _ 8B. 45, F0
        lea     ecx, [eax-1H]                           ; 1AF2 _ 8D. 48, FF
        mov     eax, dword [ebp-10H]                    ; 1AF5 _ 8B. 45, F0
        lea     edx, [eax-1H]                           ; 1AF8 _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 1AFB _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1AFE _ 8B. 00
        mov     dword [esp+18H], ebx                    ; 1B00 _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 1B04 _ 89. 4C 24, 14
        mov     dword [esp+10H], 0                      ; 1B08 _ C7. 44 24, 10, 00000000
        mov     dword [esp+0CH], edx                    ; 1B10 _ 89. 54 24, 0C
        mov     dword [esp+8H], 0                       ; 1B14 _ C7. 44 24, 08, 00000000
        mov     edx, dword [ebp-10H]                    ; 1B1C _ 8B. 55, F0
        mov     dword [esp+4H], edx                     ; 1B1F _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1B23 _ 89. 04 24
        call    paint_rectangle                         ; 1B26 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 1B2B _ 8B. 45, F4
        lea     ecx, [eax-3H]                           ; 1B2E _ 8D. 48, FD
        mov     eax, dword [ebp-10H]                    ; 1B31 _ 8B. 45, F0
        lea     edx, [eax-3H]                           ; 1B34 _ 8D. 50, FD
        mov     eax, dword [ebp+0CH]                    ; 1B37 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1B3A _ 8B. 00
        mov     dword [esp+18H], ecx                    ; 1B3C _ 89. 4C 24, 18
        mov     dword [esp+14H], edx                    ; 1B40 _ 89. 54 24, 14
        mov     dword [esp+10H], 2                      ; 1B44 _ C7. 44 24, 10, 00000002
        mov     dword [esp+0CH], 2                      ; 1B4C _ C7. 44 24, 0C, 00000002
        mov     dword [esp+8H], 8                       ; 1B54 _ C7. 44 24, 08, 00000008
        mov     edx, dword [ebp-10H]                    ; 1B5C _ 8B. 55, F0
        mov     dword [esp+4H], edx                     ; 1B5F _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1B63 _ 89. 04 24
        call    paint_rectangle                         ; 1B66 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 1B6B _ 8B. 45, F0
        lea     edx, [eax-4H]                           ; 1B6E _ 8D. 50, FC
        mov     eax, dword [ebp+0CH]                    ; 1B71 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1B74 _ 8B. 00
        mov     dword [esp+18H], 20                     ; 1B76 _ C7. 44 24, 18, 00000014
        mov     dword [esp+14H], edx                    ; 1B7E _ 89. 54 24, 14
        mov     dword [esp+10H], 3                      ; 1B82 _ C7. 44 24, 10, 00000003
        mov     dword [esp+0CH], 3                      ; 1B8A _ C7. 44 24, 0C, 00000003
        mov     dword [esp+8H], 12                      ; 1B92 _ C7. 44 24, 08, 0000000C
        mov     edx, dword [ebp-10H]                    ; 1B9A _ 8B. 55, F0
        mov     dword [esp+4H], edx                     ; 1B9D _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1BA1 _ 89. 04 24
        call    paint_rectangle                         ; 1BA4 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 1BA9 _ 8B. 45, F4
        lea     ebx, [eax-2H]                           ; 1BAC _ 8D. 58, FE
        mov     eax, dword [ebp-10H]                    ; 1BAF _ 8B. 45, F0
        lea     ecx, [eax-2H]                           ; 1BB2 _ 8D. 48, FE
        mov     eax, dword [ebp-0CH]                    ; 1BB5 _ 8B. 45, F4
        lea     edx, [eax-2H]                           ; 1BB8 _ 8D. 50, FE
        mov     eax, dword [ebp+0CH]                    ; 1BBB _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1BBE _ 8B. 00
        mov     dword [esp+18H], ebx                    ; 1BC0 _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 1BC4 _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 1BC8 _ 89. 54 24, 10
        mov     dword [esp+0CH], 1                      ; 1BCC _ C7. 44 24, 0C, 00000001
        mov     dword [esp+8H], 15                      ; 1BD4 _ C7. 44 24, 08, 0000000F
        mov     edx, dword [ebp-10H]                    ; 1BDC _ 8B. 55, F0
        mov     dword [esp+4H], edx                     ; 1BDF _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1BE3 _ 89. 04 24
        call    paint_rectangle                         ; 1BE6 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 1BEB _ 8B. 45, F4
        lea     ebx, [eax-1H]                           ; 1BEE _ 8D. 58, FF
        mov     eax, dword [ebp-10H]                    ; 1BF1 _ 8B. 45, F0
        lea     ecx, [eax-1H]                           ; 1BF4 _ 8D. 48, FF
        mov     eax, dword [ebp-0CH]                    ; 1BF7 _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 1BFA _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 1BFD _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1C00 _ 8B. 00
        mov     dword [esp+18H], ebx                    ; 1C02 _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 1C06 _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 1C0A _ 89. 54 24, 10
        mov     dword [esp+0CH], 0                      ; 1C0E _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 0                       ; 1C16 _ C7. 44 24, 08, 00000000
        mov     edx, dword [ebp-10H]                    ; 1C1E _ 8B. 55, F0
        mov     dword [esp+4H], edx                     ; 1C21 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1C25 _ 89. 04 24
        call    paint_rectangle                         ; 1C28 _ E8, FFFFFFFC(rel)
        mov     dword [esp+14H], 7                      ; 1C2D _ C7. 44 24, 14, 00000007
        mov     eax, dword [ebp+10H]                    ; 1C35 _ 8B. 45, 10
        mov     dword [esp+10H], eax                    ; 1C38 _ 89. 44 24, 10
        mov     dword [esp+0CH], 4                      ; 1C3C _ C7. 44 24, 0C, 00000004
        mov     dword [esp+8H], 24                      ; 1C44 _ C7. 44 24, 08, 00000018
        mov     eax, dword [ebp+0CH]                    ; 1C4C _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 1C4F _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1C53 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1C56 _ 89. 04 24
        call    paint_string                            ; 1C59 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-14H], 0                      ; 1C5E _ C7. 45, EC, 00000000
        jmp     ?_055                                   ; 1C65 _ E9, 00000083

?_048:  mov     dword [ebp-18H], 0                      ; 1C6A _ C7. 45, E8, 00000000
        jmp     ?_054                                   ; 1C71 _ EB, 70

?_049:  mov     eax, dword [ebp-14H]                    ; 1C73 _ 8B. 45, EC
        shl     eax, 4                                  ; 1C76 _ C1. E0, 04
        mov     edx, eax                                ; 1C79 _ 89. C2
        mov     eax, dword [ebp-18H]                    ; 1C7B _ 8B. 45, E8
        add     eax, edx                                ; 1C7E _ 01. D0
        add     eax, closebtn.1877                      ; 1C80 _ 05, 000001C0(d)
        movzx   eax, byte [eax]                         ; 1C85 _ 0F B6. 00
        mov     byte [ebp-19H], al                      ; 1C88 _ 88. 45, E7
        cmp     byte [ebp-19H], 64                      ; 1C8B _ 80. 7D, E7, 40
        jnz     ?_050                                   ; 1C8F _ 75, 06
        mov     byte [ebp-19H], 0                       ; 1C91 _ C6. 45, E7, 00
        jmp     ?_053                                   ; 1C95 _ EB, 1C

?_050:  cmp     byte [ebp-19H], 36                      ; 1C97 _ 80. 7D, E7, 24
        jnz     ?_051                                   ; 1C9B _ 75, 06
        mov     byte [ebp-19H], 15                      ; 1C9D _ C6. 45, E7, 0F
        jmp     ?_053                                   ; 1CA1 _ EB, 10

?_051:  cmp     byte [ebp-19H], 81                      ; 1CA3 _ 80. 7D, E7, 51
        jnz     ?_052                                   ; 1CA7 _ 75, 06
        mov     byte [ebp-19H], 8                       ; 1CA9 _ C6. 45, E7, 08
        jmp     ?_053                                   ; 1CAD _ EB, 04

?_052:  mov     byte [ebp-19H], 7                       ; 1CAF _ C6. 45, E7, 07
?_053:  mov     eax, dword [ebp+0CH]                    ; 1CB3 _ 8B. 45, 0C
        mov     edx, dword [eax]                        ; 1CB6 _ 8B. 10
        mov     eax, dword [ebp-14H]                    ; 1CB8 _ 8B. 45, EC
        lea     ecx, [eax+5H]                           ; 1CBB _ 8D. 48, 05
        mov     eax, dword [ebp+0CH]                    ; 1CBE _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 1CC1 _ 8B. 40, 04
        imul    ecx, eax                                ; 1CC4 _ 0F AF. C8
        mov     eax, dword [ebp+0CH]                    ; 1CC7 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 1CCA _ 8B. 40, 04
        lea     ebx, [eax-15H]                          ; 1CCD _ 8D. 58, EB
        mov     eax, dword [ebp-18H]                    ; 1CD0 _ 8B. 45, E8
        add     eax, ebx                                ; 1CD3 _ 01. D8
        add     eax, ecx                                ; 1CD5 _ 01. C8
        add     edx, eax                                ; 1CD7 _ 01. C2
        movzx   eax, byte [ebp-19H]                     ; 1CD9 _ 0F B6. 45, E7
        mov     byte [edx], al                          ; 1CDD _ 88. 02
        add     dword [ebp-18H], 1                      ; 1CDF _ 83. 45, E8, 01
?_054:  cmp     dword [ebp-18H], 15                     ; 1CE3 _ 83. 7D, E8, 0F
        jle     ?_049                                   ; 1CE7 _ 7E, 8A
        add     dword [ebp-14H], 1                      ; 1CE9 _ 83. 45, EC, 01
?_055:  cmp     dword [ebp-14H], 13                     ; 1CED _ 83. 7D, EC, 0D
        jle     ?_048                                   ; 1CF1 _ 0F 8E, FFFFFF73
        add     esp, 68                                 ; 1CF7 _ 83. C4, 44
        pop     ebx                                     ; 1CFA _ 5B
        pop     ebp                                     ; 1CFB _ 5D
        ret                                             ; 1CFC _ C3
; make_windows End of function

console_task:; Function begin
        push    ebp                                     ; 1CFD _ 55
        mov     ebp, esp                                ; 1CFE _ 89. E5
        push    ebx                                     ; 1D00 _ 53
        sub     esp, 228                                ; 1D01 _ 81. EC, 000000E4
        mov     eax, dword [ebp+8H]                     ; 1D07 _ 8B. 45, 08
        mov     dword [ebp-0CCH], eax                   ; 1D0A _ 89. 85, FFFFFF34
; Note: Absolute memory address without relocation
        mov     eax, dword [gs:14H]                     ; 1D10 _ 65: A1, 00000014
        mov     dword [ebp-0CH], eax                    ; 1D16 _ 89. 45, F4
        xor     eax, eax                                ; 1D19 _ 31. C0
        call    task_now                                ; 1D1B _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0B8H], eax                   ; 1D20 _ 89. 85, FFFFFF48
        mov     dword [ebp-0B4H], 8                     ; 1D26 _ C7. 85, FFFFFF4C, 00000008
        mov     dword [ebp-0BCH], 0                     ; 1D30 _ C7. 85, FFFFFF44, 00000000
        mov     eax, dword [ebp-0B8H]                   ; 1D3A _ 8B. 85, FFFFFF48
        mov     dword [esp+0CH], eax                    ; 1D40 _ 89. 44 24, 0C
        lea     eax, [ebp-8CH]                          ; 1D44 _ 8D. 85, FFFFFF74
        mov     dword [esp+8H], eax                     ; 1D4A _ 89. 44 24, 08
        mov     dword [esp+4H], 128                     ; 1D4E _ C7. 44 24, 04, 00000080
        lea     eax, [ebp-0A8H]                         ; 1D56 _ 8D. 85, FFFFFF58
        mov     dword [esp], eax                        ; 1D5C _ 89. 04 24
        call    fifo8_init                              ; 1D5F _ E8, FFFFFFFC(rel)
        call    timer_alloc                             ; 1D64 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0B0H], eax                   ; 1D69 _ 89. 85, FFFFFF50
        mov     dword [esp+8H], 1                       ; 1D6F _ C7. 44 24, 08, 00000001
        lea     eax, [ebp-0A8H]                         ; 1D77 _ 8D. 85, FFFFFF58
        mov     dword [esp+4H], eax                     ; 1D7D _ 89. 44 24, 04
        mov     eax, dword [ebp-0B0H]                   ; 1D81 _ 8B. 85, FFFFFF50
        mov     dword [esp], eax                        ; 1D87 _ 89. 04 24
        call    timer_init                              ; 1D8A _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 50                      ; 1D8F _ C7. 44 24, 04, 00000032
        mov     eax, dword [ebp-0B0H]                   ; 1D97 _ 8B. 85, FFFFFF50
        mov     dword [esp], eax                        ; 1D9D _ 89. 04 24
        call    timer_settime                           ; 1DA0 _ E8, FFFFFFFC(rel)
?_056:  call    io_cli                                  ; 1DA5 _ E8, FFFFFFFC(rel)
        lea     eax, [ebp-0A8H]                         ; 1DAA _ 8D. 85, FFFFFF58
        mov     dword [esp], eax                        ; 1DB0 _ 89. 04 24
        call    fifo8_status                            ; 1DB3 _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 1DB8 _ 85. C0
        jnz     ?_057                                   ; 1DBA _ 75, 0A
        call    io_sti                                  ; 1DBC _ E8, FFFFFFFC(rel)
        jmp     ?_060                                   ; 1DC1 _ E9, 0000012F

?_057:  lea     eax, [ebp-0A8H]                         ; 1DC6 _ 8D. 85, FFFFFF58
        mov     dword [esp], eax                        ; 1DCC _ 89. 04 24
        call    fifo8_get                               ; 1DCF _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0ACH], eax                   ; 1DD4 _ 89. 85, FFFFFF54
        call    io_sti                                  ; 1DDA _ E8, FFFFFFFC(rel)
        cmp     dword [ebp-0ACH], 1                     ; 1DDF _ 83. BD, FFFFFF54, 01
        jg      ?_060                                   ; 1DE6 _ 0F 8F, 00000109
        cmp     dword [ebp-0ACH], 0                     ; 1DEC _ 83. BD, FFFFFF54, 00
        jz      ?_058                                   ; 1DF3 _ 74, 2C
        mov     dword [esp+8H], 0                       ; 1DF5 _ C7. 44 24, 08, 00000000
        lea     eax, [ebp-0A8H]                         ; 1DFD _ 8D. 85, FFFFFF58
        mov     dword [esp+4H], eax                     ; 1E03 _ 89. 44 24, 04
        mov     eax, dword [ebp-0B0H]                   ; 1E07 _ 8B. 85, FFFFFF50
        mov     dword [esp], eax                        ; 1E0D _ 89. 04 24
        call    timer_init                              ; 1E10 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0BCH], 7                     ; 1E15 _ C7. 85, FFFFFF44, 00000007
        jmp     ?_059                                   ; 1E1F _ EB, 2A

?_058:  mov     dword [esp+8H], 1                       ; 1E21 _ C7. 44 24, 08, 00000001
        lea     eax, [ebp-0A8H]                         ; 1E29 _ 8D. 85, FFFFFF58
        mov     dword [esp+4H], eax                     ; 1E2F _ 89. 44 24, 04
        mov     eax, dword [ebp-0B0H]                   ; 1E33 _ 8B. 85, FFFFFF50
        mov     dword [esp], eax                        ; 1E39 _ 89. 04 24
        call    timer_init                              ; 1E3C _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0BCH], 0                     ; 1E41 _ C7. 85, FFFFFF44, 00000000
?_059:  mov     dword [esp+4H], 50                      ; 1E4B _ C7. 44 24, 04, 00000032
        mov     eax, dword [ebp-0B0H]                   ; 1E53 _ 8B. 85, FFFFFF50
        mov     dword [esp], eax                        ; 1E59 _ 89. 04 24
        call    timer_settime                           ; 1E5C _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0B4H]                   ; 1E61 _ 8B. 85, FFFFFF4C
        lea     ebx, [eax+7H]                           ; 1E67 _ 8D. 58, 07
        mov     eax, dword [ebp-0BCH]                   ; 1E6A _ 8B. 85, FFFFFF44
        movzx   ecx, al                                 ; 1E70 _ 0F B6. C8
        mov     eax, dword [ebp-0CCH]                   ; 1E73 _ 8B. 85, FFFFFF34
        mov     edx, dword [eax+4H]                     ; 1E79 _ 8B. 50, 04
        mov     eax, dword [ebp-0CCH]                   ; 1E7C _ 8B. 85, FFFFFF34
        mov     eax, dword [eax]                        ; 1E82 _ 8B. 00
        mov     dword [esp+18H], 43                     ; 1E84 _ C7. 44 24, 18, 0000002B
        mov     dword [esp+14H], ebx                    ; 1E8C _ 89. 5C 24, 14
        mov     dword [esp+10H], 28                     ; 1E90 _ C7. 44 24, 10, 0000001C
        mov     ebx, dword [ebp-0B4H]                   ; 1E98 _ 8B. 9D, FFFFFF4C
        mov     dword [esp+0CH], ebx                    ; 1E9E _ 89. 5C 24, 0C
        mov     dword [esp+8H], ecx                     ; 1EA2 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 1EA6 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1EAA _ 89. 04 24
        call    paint_rectangle                         ; 1EAD _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0B4H]                   ; 1EB2 _ 8B. 85, FFFFFF4C
        lea     edx, [eax+8H]                           ; 1EB8 _ 8D. 50, 08
        mov     eax, dword [sheet_control]              ; 1EBB _ A1, 00000000(d)
        mov     dword [esp+14H], 44                     ; 1EC0 _ C7. 44 24, 14, 0000002C
        mov     dword [esp+10H], edx                    ; 1EC8 _ 89. 54 24, 10
        mov     dword [esp+0CH], 28                     ; 1ECC _ C7. 44 24, 0C, 0000001C
        mov     edx, dword [ebp-0B4H]                   ; 1ED4 _ 8B. 95, FFFFFF4C
        mov     dword [esp+8H], edx                     ; 1EDA _ 89. 54 24, 08
        mov     edx, dword [ebp-0CCH]                   ; 1EDE _ 8B. 95, FFFFFF34
        mov     dword [esp+4H], edx                     ; 1EE4 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1EE8 _ 89. 04 24
        call    sheet_refresh                           ; 1EEB _ E8, FFFFFFFC(rel)
        jmp     ?_056                                   ; 1EF0 _ E9, FFFFFEB0

?_060:  jmp     ?_056                                   ; 1EF5 _ E9, FFFFFEAB
; console_task End of function

launch_console:; Function begin
        push    ebp                                     ; 1EFA _ 55
        mov     ebp, esp                                ; 1EFB _ 89. E5
        sub     esp, 56                                 ; 1EFD _ 83. EC, 38
        mov     eax, dword [sheet_control]              ; 1F00 _ A1, 00000000(d)
        mov     dword [esp], eax                        ; 1F05 _ 89. 04 24
        call    sheet_alloc                             ; 1F08 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-18H], eax                    ; 1F0D _ 89. 45, E8
        mov     eax, dword [memman]                     ; 1F10 _ A1, 00000000(d)
        mov     dword [esp+4H], 42240                   ; 1F15 _ C7. 44 24, 04, 0000A500
        mov     dword [esp], eax                        ; 1F1D _ 89. 04 24
        call    memman_alloc_4k                         ; 1F20 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-14H], eax                    ; 1F25 _ 89. 45, EC
        mov     dword [esp+10H], 99                     ; 1F28 _ C7. 44 24, 10, 00000063
        mov     dword [esp+0CH], 165                    ; 1F30 _ C7. 44 24, 0C, 000000A5
        mov     dword [esp+8H], 256                     ; 1F38 _ C7. 44 24, 08, 00000100
        mov     eax, dword [ebp-14H]                    ; 1F40 _ 8B. 45, EC
        mov     dword [esp+4H], eax                     ; 1F43 _ 89. 44 24, 04
        mov     eax, dword [ebp-18H]                    ; 1F47 _ 8B. 45, E8
        mov     dword [esp], eax                        ; 1F4A _ 89. 04 24
        call    sheet_setbuf                            ; 1F4D _ E8, FFFFFFFC(rel)
        mov     eax, dword [sheet_control]              ; 1F52 _ A1, 00000000(d)
        mov     dword [esp+8H], ?_213                   ; 1F57 _ C7. 44 24, 08, 0000005A(d)
        mov     edx, dword [ebp-18H]                    ; 1F5F _ 8B. 55, E8
        mov     dword [esp+4H], edx                     ; 1F62 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1F66 _ 89. 04 24
        call    make_windows                            ; 1F69 _ E8, FFFFFFFC(rel)
        mov     dword [esp+14H], 0                      ; 1F6E _ C7. 44 24, 14, 00000000
        mov     dword [esp+10H], 128                    ; 1F76 _ C7. 44 24, 10, 00000080
        mov     dword [esp+0CH], 240                    ; 1F7E _ C7. 44 24, 0C, 000000F0
        mov     dword [esp+8H], 28                      ; 1F86 _ C7. 44 24, 08, 0000001C
        mov     dword [esp+4H], 8                       ; 1F8E _ C7. 44 24, 04, 00000008
        mov     eax, dword [ebp-18H]                    ; 1F96 _ 8B. 45, E8
        mov     dword [esp], eax                        ; 1F99 _ 89. 04 24
        call    make_textbox                            ; 1F9C _ E8, FFFFFFFC(rel)
        call    task_alloc                              ; 1FA1 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 1FA6 _ 89. 45, F0
        call    get_code32_addr                         ; 1FA9 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 1FAE _ 89. 45, F4
        mov     eax, dword [ebp-10H]                    ; 1FB1 _ 8B. 45, F0
        mov     dword [eax+70H], 0                      ; 1FB4 _ C7. 40, 70, 00000000
        mov     eax, dword [ebp-10H]                    ; 1FBB _ 8B. 45, F0
        mov     dword [eax+74H], 1073741824             ; 1FBE _ C7. 40, 74, 40000000
        mov     eax, console_task                       ; 1FC5 _ B8, 00000000(d)
        sub     eax, dword [ebp-0CH]                    ; 1FCA _ 2B. 45, F4
        mov     edx, eax                                ; 1FCD _ 89. C2
        mov     eax, dword [ebp-10H]                    ; 1FCF _ 8B. 45, F0
        mov     dword [eax+30H], edx                    ; 1FD2 _ 89. 50, 30
        mov     eax, dword [ebp-10H]                    ; 1FD5 _ 8B. 45, F0
        mov     dword [eax+58H], 0                      ; 1FD8 _ C7. 40, 58, 00000000
        mov     eax, dword [ebp-10H]                    ; 1FDF _ 8B. 45, F0
        mov     dword [eax+5CH], 8                      ; 1FE2 _ C7. 40, 5C, 00000008
        mov     eax, dword [ebp-10H]                    ; 1FE9 _ 8B. 45, F0
        mov     dword [eax+60H], 48                     ; 1FEC _ C7. 40, 60, 00000030
        mov     eax, dword [ebp-10H]                    ; 1FF3 _ 8B. 45, F0
        mov     dword [eax+64H], 32                     ; 1FF6 _ C7. 40, 64, 00000020
        mov     eax, dword [ebp-10H]                    ; 1FFD _ 8B. 45, F0
        mov     dword [eax+68H], 0                      ; 2000 _ C7. 40, 68, 00000000
        mov     eax, dword [ebp-10H]                    ; 2007 _ 8B. 45, F0
        mov     dword [eax+6CH], 16                     ; 200A _ C7. 40, 6C, 00000010
        mov     eax, dword [ebp-10H]                    ; 2011 _ 8B. 45, F0
        mov     eax, dword [eax+48H]                    ; 2014 _ 8B. 40, 48
        lea     edx, [eax-4H]                           ; 2017 _ 8D. 50, FC
        mov     eax, dword [ebp-10H]                    ; 201A _ 8B. 45, F0
        mov     dword [eax+48H], edx                    ; 201D _ 89. 50, 48
        mov     eax, dword [ebp-10H]                    ; 2020 _ 8B. 45, F0
        mov     eax, dword [eax+48H]                    ; 2023 _ 8B. 40, 48
        add     eax, 4                                  ; 2026 _ 83. C0, 04
        mov     edx, dword [ebp-18H]                    ; 2029 _ 8B. 55, E8
        mov     dword [eax], edx                        ; 202C _ 89. 10
        mov     dword [esp+8H], 5                       ; 202E _ C7. 44 24, 08, 00000005
        mov     dword [esp+4H], 1                       ; 2036 _ C7. 44 24, 04, 00000001
        mov     eax, dword [ebp-10H]                    ; 203E _ 8B. 45, F0
        mov     dword [esp], eax                        ; 2041 _ 89. 04 24
        call    task_run                                ; 2044 _ E8, FFFFFFFC(rel)
        mov     eax, dword [sheet_control]              ; 2049 _ A1, 00000000(d)
        mov     dword [esp+0CH], 4                      ; 204E _ C7. 44 24, 0C, 00000004
        mov     dword [esp+8H], 32                      ; 2056 _ C7. 44 24, 08, 00000020
        mov     edx, dword [ebp-18H]                    ; 205E _ 8B. 55, E8
        mov     dword [esp+4H], edx                     ; 2061 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 2065 _ 89. 04 24
        call    sheet_slide                             ; 2068 _ E8, FFFFFFFC(rel)
        mov     eax, dword [sheet_control]              ; 206D _ A1, 00000000(d)
        mov     dword [esp+8H], 1                       ; 2072 _ C7. 44 24, 08, 00000001
        mov     edx, dword [ebp-18H]                    ; 207A _ 8B. 55, E8
        mov     dword [esp+4H], edx                     ; 207D _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 2081 _ 89. 04 24
        call    sheet_updown                            ; 2084 _ E8, FFFFFFFC(rel)
        leave                                           ; 2089 _ C9
        ret                                             ; 208A _ C3
; launch_console End of function

wait_KBC_sendready:; Function begin
        push    ebp                                     ; 208B _ 55
        mov     ebp, esp                                ; 208C _ 89. E5
        sub     esp, 24                                 ; 208E _ 83. EC, 18
?_061:  mov     dword [esp], 100                        ; 2091 _ C7. 04 24, 00000064
        call    io_in8                                  ; 2098 _ E8, FFFFFFFC(rel)
        and     eax, 02H                                ; 209D _ 83. E0, 02
        test    eax, eax                                ; 20A0 _ 85. C0
        jnz     ?_062                                   ; 20A2 _ 75, 02
        jmp     ?_063                                   ; 20A4 _ EB, 02

?_062:  jmp     ?_061                                   ; 20A6 _ EB, E9

?_063:  leave                                           ; 20A8 _ C9
        ret                                             ; 20A9 _ C3
; wait_KBC_sendready End of function

init_keyboard:; Function begin
        push    ebp                                     ; 20AA _ 55
        mov     ebp, esp                                ; 20AB _ 89. E5
        sub     esp, 24                                 ; 20AD _ 83. EC, 18
        call    wait_KBC_sendready                      ; 20B0 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 96                      ; 20B5 _ C7. 44 24, 04, 00000060
        mov     dword [esp], 100                        ; 20BD _ C7. 04 24, 00000064
        call    io_out8                                 ; 20C4 _ E8, FFFFFFFC(rel)
        call    wait_KBC_sendready                      ; 20C9 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 71                      ; 20CE _ C7. 44 24, 04, 00000047
        mov     dword [esp], 96                         ; 20D6 _ C7. 04 24, 00000060
        call    io_out8                                 ; 20DD _ E8, FFFFFFFC(rel)
        leave                                           ; 20E2 _ C9
        ret                                             ; 20E3 _ C3
; init_keyboard End of function

enable_mouse:; Function begin
        push    ebp                                     ; 20E4 _ 55
        mov     ebp, esp                                ; 20E5 _ 89. E5
        sub     esp, 24                                 ; 20E7 _ 83. EC, 18
        call    wait_KBC_sendready                      ; 20EA _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 212                     ; 20EF _ C7. 44 24, 04, 000000D4
        mov     dword [esp], 100                        ; 20F7 _ C7. 04 24, 00000064
        call    io_out8                                 ; 20FE _ E8, FFFFFFFC(rel)
        call    wait_KBC_sendready                      ; 2103 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 244                     ; 2108 _ C7. 44 24, 04, 000000F4
        mov     dword [esp], 96                         ; 2110 _ C7. 04 24, 00000060
        call    io_out8                                 ; 2117 _ E8, FFFFFFFC(rel)
        leave                                           ; 211C _ C9
        ret                                             ; 211D _ C3
; enable_mouse End of function

mouse_decode:; Function begin
        push    ebp                                     ; 211E _ 55
        mov     ebp, esp                                ; 211F _ 89. E5
        sub     esp, 4                                  ; 2121 _ 83. EC, 04
        mov     eax, dword [ebp+0CH]                    ; 2124 _ 8B. 45, 0C
        mov     byte [ebp-4H], al                       ; 2127 _ 88. 45, FC
        mov     eax, dword [ebp+8H]                     ; 212A _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 212D _ 0F B6. 40, 03
        test    al, al                                  ; 2131 _ 84. C0
        jnz     ?_065                                   ; 2133 _ 75, 17
        cmp     byte [ebp-4H], -6                       ; 2135 _ 80. 7D, FC, FA
        jnz     ?_064                                   ; 2139 _ 75, 07
        mov     eax, dword [ebp+8H]                     ; 213B _ 8B. 45, 08
        mov     byte [eax+3H], 1                        ; 213E _ C6. 40, 03, 01
?_064:  mov     eax, 0                                  ; 2142 _ B8, 00000000
        jmp     ?_072                                   ; 2147 _ E9, 0000010F

?_065:  mov     eax, dword [ebp+8H]                     ; 214C _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 214F _ 0F B6. 40, 03
        cmp     al, 1                                   ; 2153 _ 3C, 01
        jnz     ?_067                                   ; 2155 _ 75, 28
        movzx   eax, byte [ebp-4H]                      ; 2157 _ 0F B6. 45, FC
        and     eax, 0C8H                               ; 215B _ 25, 000000C8
        cmp     eax, 8                                  ; 2160 _ 83. F8, 08
        jnz     ?_066                                   ; 2163 _ 75, 10
        mov     eax, dword [ebp+8H]                     ; 2165 _ 8B. 45, 08
        movzx   edx, byte [ebp-4H]                      ; 2168 _ 0F B6. 55, FC
        mov     byte [eax], dl                          ; 216C _ 88. 10
        mov     eax, dword [ebp+8H]                     ; 216E _ 8B. 45, 08
        mov     byte [eax+3H], 2                        ; 2171 _ C6. 40, 03, 02
?_066:  mov     eax, 0                                  ; 2175 _ B8, 00000000
        jmp     ?_072                                   ; 217A _ E9, 000000DC

?_067:  mov     eax, dword [ebp+8H]                     ; 217F _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 2182 _ 0F B6. 40, 03
        cmp     al, 2                                   ; 2186 _ 3C, 02
        jnz     ?_068                                   ; 2188 _ 75, 1B
        mov     eax, dword [ebp+8H]                     ; 218A _ 8B. 45, 08
        movzx   edx, byte [ebp-4H]                      ; 218D _ 0F B6. 55, FC
        mov     byte [eax+1H], dl                       ; 2191 _ 88. 50, 01
        mov     eax, dword [ebp+8H]                     ; 2194 _ 8B. 45, 08
        mov     byte [eax+3H], 3                        ; 2197 _ C6. 40, 03, 03
        mov     eax, 0                                  ; 219B _ B8, 00000000
        jmp     ?_072                                   ; 21A0 _ E9, 000000B6

?_068:  mov     eax, dword [ebp+8H]                     ; 21A5 _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 21A8 _ 0F B6. 40, 03
        cmp     al, 3                                   ; 21AC _ 3C, 03
        jne     ?_071                                   ; 21AE _ 0F 85, 000000A2
        mov     eax, dword [ebp+8H]                     ; 21B4 _ 8B. 45, 08
        movzx   edx, byte [ebp-4H]                      ; 21B7 _ 0F B6. 55, FC
        mov     byte [eax+2H], dl                       ; 21BB _ 88. 50, 02
        mov     eax, dword [ebp+8H]                     ; 21BE _ 8B. 45, 08
        mov     byte [eax+3H], 1                        ; 21C1 _ C6. 40, 03, 01
        mov     eax, dword [ebp+8H]                     ; 21C5 _ 8B. 45, 08
        movzx   eax, byte [eax]                         ; 21C8 _ 0F B6. 00
        movzx   eax, al                                 ; 21CB _ 0F B6. C0
        and     eax, 07H                                ; 21CE _ 83. E0, 07
        mov     edx, eax                                ; 21D1 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 21D3 _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 21D6 _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 21D9 _ 8B. 45, 08
        movzx   eax, byte [eax+1H]                      ; 21DC _ 0F B6. 40, 01
        movzx   edx, al                                 ; 21E0 _ 0F B6. D0
        mov     eax, dword [ebp+8H]                     ; 21E3 _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 21E6 _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 21E9 _ 8B. 45, 08
        movzx   eax, byte [eax+2H]                      ; 21EC _ 0F B6. 40, 02
        movzx   edx, al                                 ; 21F0 _ 0F B6. D0
        mov     eax, dword [ebp+8H]                     ; 21F3 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 21F6 _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 21F9 _ 8B. 45, 08
        movzx   eax, byte [eax]                         ; 21FC _ 0F B6. 00
        movzx   eax, al                                 ; 21FF _ 0F B6. C0
        and     eax, 10H                                ; 2202 _ 83. E0, 10
        test    eax, eax                                ; 2205 _ 85. C0
        jz      ?_069                                   ; 2207 _ 74, 13
        mov     eax, dword [ebp+8H]                     ; 2209 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 220C _ 8B. 40, 04
        or      eax, 0FFFFFF00H                         ; 220F _ 0D, FFFFFF00
        mov     edx, eax                                ; 2214 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 2216 _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 2219 _ 89. 50, 04
?_069:  mov     eax, dword [ebp+8H]                     ; 221C _ 8B. 45, 08
        movzx   eax, byte [eax]                         ; 221F _ 0F B6. 00
        movzx   eax, al                                 ; 2222 _ 0F B6. C0
        and     eax, 20H                                ; 2225 _ 83. E0, 20
        test    eax, eax                                ; 2228 _ 85. C0
        jz      ?_070                                   ; 222A _ 74, 13
        mov     eax, dword [ebp+8H]                     ; 222C _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 222F _ 8B. 40, 08
        or      eax, 0FFFFFF00H                         ; 2232 _ 0D, FFFFFF00
        mov     edx, eax                                ; 2237 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 2239 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 223C _ 89. 50, 08
?_070:  mov     eax, dword [ebp+8H]                     ; 223F _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 2242 _ 8B. 40, 08
        neg     eax                                     ; 2245 _ F7. D8
        mov     edx, eax                                ; 2247 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 2249 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 224C _ 89. 50, 08
        mov     eax, 1                                  ; 224F _ B8, 00000001
        jmp     ?_072                                   ; 2254 _ EB, 05

?_071:  mov     eax, 4294967295                         ; 2256 _ B8, FFFFFFFF
?_072:  leave                                           ; 225B _ C9
        ret                                             ; 225C _ C3
; mouse_decode End of function

intHandlerKeyboard:; Function begin
        push    ebp                                     ; 225D _ 55
        mov     ebp, esp                                ; 225E _ 89. E5
        sub     esp, 40                                 ; 2260 _ 83. EC, 28
        mov     dword [esp+4H], 32                      ; 2263 _ C7. 44 24, 04, 00000020
        mov     dword [esp], 32                         ; 226B _ C7. 04 24, 00000020
        call    io_out8                                 ; 2272 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 32                      ; 2277 _ C7. 44 24, 04, 00000020
        mov     dword [esp], 160                        ; 227F _ C7. 04 24, 000000A0
        call    io_out8                                 ; 2286 _ E8, FFFFFFFC(rel)
        mov     dword [esp], 96                         ; 228B _ C7. 04 24, 00000060
        call    io_in8                                  ; 2292 _ E8, FFFFFFFC(rel)
        mov     byte [ebp-9H], al                       ; 2297 _ 88. 45, F7
        movzx   eax, byte [ebp-9H]                      ; 229A _ 0F B6. 45, F7
        mov     dword [esp+4H], eax                     ; 229E _ 89. 44 24, 04
        mov     dword [esp], keyinfo                    ; 22A2 _ C7. 04 24, 00000000(d)
        call    fifo8_put                               ; 22A9 _ E8, FFFFFFFC(rel)
        leave                                           ; 22AE _ C9
        ret                                             ; 22AF _ C3
; intHandlerKeyboard End of function

intHandlerMouse:; Function begin
        push    ebp                                     ; 22B0 _ 55
        mov     ebp, esp                                ; 22B1 _ 89. E5
        sub     esp, 40                                 ; 22B3 _ 83. EC, 28
        mov     dword [esp+4H], 32                      ; 22B6 _ C7. 44 24, 04, 00000020
        mov     dword [esp], 32                         ; 22BE _ C7. 04 24, 00000020
        call    io_out8                                 ; 22C5 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 32                      ; 22CA _ C7. 44 24, 04, 00000020
        mov     dword [esp], 160                        ; 22D2 _ C7. 04 24, 000000A0
        call    io_out8                                 ; 22D9 _ E8, FFFFFFFC(rel)
        mov     dword [esp], 96                         ; 22DE _ C7. 04 24, 00000060
        call    io_in8                                  ; 22E5 _ E8, FFFFFFFC(rel)
        mov     byte [ebp-9H], al                       ; 22EA _ 88. 45, F7
        movzx   eax, byte [ebp-9H]                      ; 22ED _ 0F B6. 45, F7
        mov     dword [esp+4H], eax                     ; 22F1 _ 89. 44 24, 04
        mov     dword [esp], mouseinfo                  ; 22F5 _ C7. 04 24, 00000000(d)
        call    fifo8_put                               ; 22FC _ E8, FFFFFFFC(rel)
        leave                                           ; 2301 _ C9
        ret                                             ; 2302 _ C3
; intHandlerMouse End of function

fifo8_init:; Function begin
        push    ebp                                     ; 2303 _ 55
        mov     ebp, esp                                ; 2304 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 2306 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 2309 _ 8B. 55, 10
        mov     dword [eax], edx                        ; 230C _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 230E _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 2311 _ C7. 40, 04, 00000000
        mov     eax, dword [ebp+8H]                     ; 2318 _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 231B _ C7. 40, 08, 00000000
        mov     eax, dword [ebp+8H]                     ; 2322 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 2325 _ 8B. 55, 0C
        mov     dword [eax+0CH], edx                    ; 2328 _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 232B _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 232E _ 8B. 55, 0C
        mov     dword [eax+10H], edx                    ; 2331 _ 89. 50, 10
        mov     eax, dword [ebp+8H]                     ; 2334 _ 8B. 45, 08
        mov     dword [eax+14H], 0                      ; 2337 _ C7. 40, 14, 00000000
        mov     eax, dword [ebp+8H]                     ; 233E _ 8B. 45, 08
        mov     edx, dword [ebp+14H]                    ; 2341 _ 8B. 55, 14
        mov     dword [eax+18H], edx                    ; 2344 _ 89. 50, 18
        pop     ebp                                     ; 2347 _ 5D
        ret                                             ; 2348 _ C3
; fifo8_init End of function

fifo8_put:; Function begin
        push    ebp                                     ; 2349 _ 55
        mov     ebp, esp                                ; 234A _ 89. E5
        sub     esp, 40                                 ; 234C _ 83. EC, 28
        mov     eax, dword [ebp+0CH]                    ; 234F _ 8B. 45, 0C
        mov     byte [ebp-1CH], al                      ; 2352 _ 88. 45, E4
        cmp     dword [ebp+8H], 0                       ; 2355 _ 83. 7D, 08, 00
        jnz     ?_073                                   ; 2359 _ 75, 0A
        mov     eax, 4294967295                         ; 235B _ B8, FFFFFFFF
        jmp     ?_077                                   ; 2360 _ E9, 000000B1

?_073:  mov     eax, dword [ebp+8H]                     ; 2365 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 2368 _ 8B. 40, 10
        test    eax, eax                                ; 236B _ 85. C0
        jnz     ?_074                                   ; 236D _ 75, 1B
        mov     eax, dword [ebp+8H]                     ; 236F _ 8B. 45, 08
        mov     eax, dword [eax+14H]                    ; 2372 _ 8B. 40, 14
        or      eax, 01H                                ; 2375 _ 83. C8, 01
        mov     edx, eax                                ; 2378 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 237A _ 8B. 45, 08
        mov     dword [eax+14H], edx                    ; 237D _ 89. 50, 14
        mov     eax, 4294967295                         ; 2380 _ B8, FFFFFFFF
        jmp     ?_077                                   ; 2385 _ E9, 0000008C

?_074:  mov     eax, dword [ebp+8H]                     ; 238A _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 238D _ 8B. 40, 04
        mov     dword [ebp-0CH], eax                    ; 2390 _ 89. 45, F4
        mov     eax, dword [ebp+8H]                     ; 2393 _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 2396 _ 8B. 10
        mov     eax, dword [ebp-0CH]                    ; 2398 _ 8B. 45, F4
        add     edx, eax                                ; 239B _ 01. C2
        movzx   eax, byte [ebp-1CH]                     ; 239D _ 0F B6. 45, E4
        mov     byte [edx], al                          ; 23A1 _ 88. 02
        mov     eax, dword [ebp+8H]                     ; 23A3 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 23A6 _ 8B. 40, 04
        lea     edx, [eax+1H]                           ; 23A9 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 23AC _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 23AF _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 23B2 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 23B5 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 23B8 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 23BB _ 8B. 40, 0C
        cmp     edx, eax                                ; 23BE _ 39. C2
        jnz     ?_075                                   ; 23C0 _ 75, 0A
        mov     eax, dword [ebp+8H]                     ; 23C2 _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 23C5 _ C7. 40, 04, 00000000
?_075:  mov     eax, dword [ebp+8H]                     ; 23CC _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 23CF _ 8B. 40, 10
        lea     edx, [eax-1H]                           ; 23D2 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 23D5 _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 23D8 _ 89. 50, 10
        mov     eax, dword [ebp+8H]                     ; 23DB _ 8B. 45, 08
        mov     eax, dword [eax+18H]                    ; 23DE _ 8B. 40, 18
        test    eax, eax                                ; 23E1 _ 85. C0
        jz      ?_076                                   ; 23E3 _ 74, 2C
        mov     eax, dword [ebp+8H]                     ; 23E5 _ 8B. 45, 08
        mov     eax, dword [eax+18H]                    ; 23E8 _ 8B. 40, 18
        mov     eax, dword [eax+4H]                     ; 23EB _ 8B. 40, 04
        cmp     eax, 2                                  ; 23EE _ 83. F8, 02
        jz      ?_076                                   ; 23F1 _ 74, 1E
        mov     eax, dword [ebp+8H]                     ; 23F3 _ 8B. 45, 08
        mov     eax, dword [eax+18H]                    ; 23F6 _ 8B. 40, 18
        mov     dword [esp+8H], 0                       ; 23F9 _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], -1                      ; 2401 _ C7. 44 24, 04, FFFFFFFF
        mov     dword [esp], eax                        ; 2409 _ 89. 04 24
        call    task_run                                ; 240C _ E8, FFFFFFFC(rel)
?_076:  mov     eax, 0                                  ; 2411 _ B8, 00000000
?_077:  leave                                           ; 2416 _ C9
        ret                                             ; 2417 _ C3
; fifo8_put End of function

fifo8_get:; Function begin
        push    ebp                                     ; 2418 _ 55
        mov     ebp, esp                                ; 2419 _ 89. E5
        sub     esp, 16                                 ; 241B _ 83. EC, 10
        mov     eax, dword [ebp+8H]                     ; 241E _ 8B. 45, 08
        mov     edx, dword [eax+10H]                    ; 2421 _ 8B. 50, 10
        mov     eax, dword [ebp+8H]                     ; 2424 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 2427 _ 8B. 40, 0C
        cmp     edx, eax                                ; 242A _ 39. C2
        jnz     ?_078                                   ; 242C _ 75, 11
        mov     eax, dword [ebp+8H]                     ; 242E _ 8B. 45, 08
        mov     dword [eax+14H], 0                      ; 2431 _ C7. 40, 14, 00000000
        mov     eax, 4294967295                         ; 2438 _ B8, FFFFFFFF
        jmp     ?_080                                   ; 243D _ EB, 57

?_078:  mov     eax, dword [ebp+8H]                     ; 243F _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 2442 _ 8B. 40, 08
        mov     dword [ebp-8H], eax                     ; 2445 _ 89. 45, F8
        mov     eax, dword [ebp+8H]                     ; 2448 _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 244B _ 8B. 10
        mov     eax, dword [ebp-8H]                     ; 244D _ 8B. 45, F8
        add     eax, edx                                ; 2450 _ 01. D0
        movzx   eax, byte [eax]                         ; 2452 _ 0F B6. 00
        movzx   eax, al                                 ; 2455 _ 0F B6. C0
        mov     dword [ebp-4H], eax                     ; 2458 _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 245B _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 245E _ 8B. 40, 08
        lea     edx, [eax+1H]                           ; 2461 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 2464 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 2467 _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 246A _ 8B. 45, 08
        mov     edx, dword [eax+8H]                     ; 246D _ 8B. 50, 08
        mov     eax, dword [ebp+8H]                     ; 2470 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 2473 _ 8B. 40, 0C
        cmp     edx, eax                                ; 2476 _ 39. C2
        jnz     ?_079                                   ; 2478 _ 75, 0A
        mov     eax, dword [ebp+8H]                     ; 247A _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 247D _ C7. 40, 08, 00000000
?_079:  mov     eax, dword [ebp+8H]                     ; 2484 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 2487 _ 8B. 40, 10
        lea     edx, [eax+1H]                           ; 248A _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 248D _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 2490 _ 89. 50, 10
        mov     eax, dword [ebp-4H]                     ; 2493 _ 8B. 45, FC
?_080:  leave                                           ; 2496 _ C9
        ret                                             ; 2497 _ C3
; fifo8_get End of function

fifo8_status:; Function begin
        push    ebp                                     ; 2498 _ 55
        mov     ebp, esp                                ; 2499 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 249B _ 8B. 45, 08
        mov     edx, dword [eax+0CH]                    ; 249E _ 8B. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 24A1 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 24A4 _ 8B. 40, 10
        sub     edx, eax                                ; 24A7 _ 29. C2
        mov     eax, edx                                ; 24A9 _ 89. D0
        pop     ebp                                     ; 24AB _ 5D
        ret                                             ; 24AC _ C3
; fifo8_status End of function

charToHexVal:; Function begin
        push    ebp                                     ; 24AD _ 55
        mov     ebp, esp                                ; 24AE _ 89. E5
        sub     esp, 4                                  ; 24B0 _ 83. EC, 04
        mov     eax, dword [ebp+8H]                     ; 24B3 _ 8B. 45, 08
        mov     byte [ebp-4H], al                       ; 24B6 _ 88. 45, FC
        cmp     byte [ebp-4H], 9                        ; 24B9 _ 80. 7D, FC, 09
        jle     ?_081                                   ; 24BD _ 7E, 09
        movzx   eax, byte [ebp-4H]                      ; 24BF _ 0F B6. 45, FC
        add     eax, 55                                 ; 24C3 _ 83. C0, 37
        jmp     ?_082                                   ; 24C6 _ EB, 07

?_081:  movzx   eax, byte [ebp-4H]                      ; 24C8 _ 0F B6. 45, FC
        add     eax, 48                                 ; 24CC _ 83. C0, 30
?_082:  leave                                           ; 24CF _ C9
        ret                                             ; 24D0 _ C3
; charToHexVal End of function

charToHexStr:; Function begin
        push    ebp                                     ; 24D1 _ 55
        mov     ebp, esp                                ; 24D2 _ 89. E5
        sub     esp, 24                                 ; 24D4 _ 83. EC, 18
        mov     eax, dword [ebp+8H]                     ; 24D7 _ 8B. 45, 08
        mov     byte [ebp-14H], al                      ; 24DA _ 88. 45, EC
        mov     dword [ebp-4H], 0                       ; 24DD _ C7. 45, FC, 00000000
        movzx   eax, byte [ebp-14H]                     ; 24E4 _ 0F B6. 45, EC
        and     eax, 0FH                                ; 24E8 _ 83. E0, 0F
        mov     byte [ebp-5H], al                       ; 24EB _ 88. 45, FB
        movsx   eax, byte [ebp-5H]                      ; 24EE _ 0F BE. 45, FB
        mov     dword [esp], eax                        ; 24F2 _ 89. 04 24
        call    charToHexVal                            ; 24F5 _ E8, FFFFFFFC(rel)
        mov     byte [?_215], al                        ; 24FA _ A2, 000002A3(d)
        movzx   eax, byte [ebp-14H]                     ; 24FF _ 0F B6. 45, EC
        shr     al, 4                                   ; 2503 _ C0. E8, 04
        mov     byte [ebp-14H], al                      ; 2506 _ 88. 45, EC
        movzx   eax, byte [ebp-14H]                     ; 2509 _ 0F B6. 45, EC
        movsx   eax, al                                 ; 250D _ 0F BE. C0
        mov     dword [esp], eax                        ; 2510 _ 89. 04 24
        call    charToHexVal                            ; 2513 _ E8, FFFFFFFC(rel)
        mov     byte [?_214], al                        ; 2518 _ A2, 000002A2(d)
        mov     eax, keyval                             ; 251D _ B8, 000002A0(d)
        leave                                           ; 2522 _ C9
        ret                                             ; 2523 _ C3
; charToHexStr End of function

intToHexStr:; Function begin
        push    ebp                                     ; 2524 _ 55
        mov     ebp, esp                                ; 2525 _ 89. E5
        sub     esp, 16                                 ; 2527 _ 83. EC, 10
        mov     byte [str.1386], 48                     ; 252A _ C6. 05, 000003A0(d), 30
        mov     byte [?_218], 88                        ; 2531 _ C6. 05, 000003A1(d), 58
        mov     byte [?_219], 0                         ; 2538 _ C6. 05, 000003AA(d), 00
        mov     dword [ebp-0CH], 2                      ; 253F _ C7. 45, F4, 00000002
        jmp     ?_084                                   ; 2546 _ EB, 0F

?_083:  mov     eax, dword [ebp-0CH]                    ; 2548 _ 8B. 45, F4
        add     eax, str.1386                           ; 254B _ 05, 000003A0(d)
        mov     byte [eax], 48                          ; 2550 _ C6. 00, 30
        add     dword [ebp-0CH], 1                      ; 2553 _ 83. 45, F4, 01
?_084:  cmp     dword [ebp-0CH], 9                      ; 2557 _ 83. 7D, F4, 09
        jle     ?_083                                   ; 255B _ 7E, EB
        mov     dword [ebp-8H], 9                       ; 255D _ C7. 45, F8, 00000009
        jmp     ?_088                                   ; 2564 _ EB, 40

?_085:  mov     eax, dword [ebp+8H]                     ; 2566 _ 8B. 45, 08
        and     eax, 0FH                                ; 2569 _ 83. E0, 0F
        mov     dword [ebp-4H], eax                     ; 256C _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 256F _ 8B. 45, 08
        shr     eax, 4                                  ; 2572 _ C1. E8, 04
        mov     dword [ebp+8H], eax                     ; 2575 _ 89. 45, 08
        cmp     dword [ebp-4H], 9                       ; 2578 _ 83. 7D, FC, 09
        jle     ?_086                                   ; 257C _ 7E, 13
        mov     eax, dword [ebp-4H]                     ; 257E _ 8B. 45, FC
        add     eax, 55                                 ; 2581 _ 83. C0, 37
        mov     edx, dword [ebp-8H]                     ; 2584 _ 8B. 55, F8
        add     edx, str.1386                           ; 2587 _ 81. C2, 000003A0(d)
        mov     byte [edx], al                          ; 258D _ 88. 02
        jmp     ?_087                                   ; 258F _ EB, 11

?_086:  mov     eax, dword [ebp-4H]                     ; 2591 _ 8B. 45, FC
        add     eax, 48                                 ; 2594 _ 83. C0, 30
        mov     edx, dword [ebp-8H]                     ; 2597 _ 8B. 55, F8
        add     edx, str.1386                           ; 259A _ 81. C2, 000003A0(d)
        mov     byte [edx], al                          ; 25A0 _ 88. 02
?_087:  sub     dword [ebp-8H], 1                       ; 25A2 _ 83. 6D, F8, 01
?_088:  cmp     dword [ebp-8H], 1                       ; 25A6 _ 83. 7D, F8, 01
        jle     ?_089                                   ; 25AA _ 7E, 06
        cmp     dword [ebp+8H], 0                       ; 25AC _ 83. 7D, 08, 00
        jnz     ?_085                                   ; 25B0 _ 75, B4
?_089:  mov     eax, str.1386                           ; 25B2 _ B8, 000003A0(d)
        leave                                           ; 25B7 _ C9
        ret                                             ; 25B8 _ C3
; intToHexStr End of function

memman_init:; Function begin
        push    ebp                                     ; 25B9 _ 55
        mov     ebp, esp                                ; 25BA _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 25BC _ 8B. 45, 08
        mov     dword [eax], 0                          ; 25BF _ C7. 00, 00000000
        mov     eax, dword [ebp+8H]                     ; 25C5 _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 25C8 _ C7. 40, 04, 00000000
        mov     eax, dword [ebp+8H]                     ; 25CF _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 25D2 _ C7. 40, 08, 00000000
        mov     eax, dword [ebp+8H]                     ; 25D9 _ 8B. 45, 08
        mov     dword [eax+0CH], 0                      ; 25DC _ C7. 40, 0C, 00000000
        pop     ebp                                     ; 25E3 _ 5D
        ret                                             ; 25E4 _ C3
; memman_init End of function

memman_total:; Function begin
        push    ebp                                     ; 25E5 _ 55
        mov     ebp, esp                                ; 25E6 _ 89. E5
        sub     esp, 16                                 ; 25E8 _ 83. EC, 10
        mov     dword [ebp-4H], 0                       ; 25EB _ C7. 45, FC, 00000000
        mov     dword [ebp-8H], 0                       ; 25F2 _ C7. 45, F8, 00000000
        jmp     ?_091                                   ; 25F9 _ EB, 14

?_090:  mov     eax, dword [ebp+8H]                     ; 25FB _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 25FE _ 8B. 55, F8
        add     edx, 2                                  ; 2601 _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 2604 _ 8B. 44 D0, 04
        add     dword [ebp-4H], eax                     ; 2608 _ 01. 45, FC
        add     dword [ebp-8H], 1                       ; 260B _ 83. 45, F8, 01
?_091:  mov     eax, dword [ebp+8H]                     ; 260F _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 2612 _ 8B. 00
        cmp     eax, dword [ebp-8H]                     ; 2614 _ 3B. 45, F8
        ja      ?_090                                   ; 2617 _ 77, E2
        mov     eax, dword [ebp-4H]                     ; 2619 _ 8B. 45, FC
        leave                                           ; 261C _ C9
        ret                                             ; 261D _ C3
; memman_total End of function

memman_alloc:; Function begin
        push    ebp                                     ; 261E _ 55
        mov     ebp, esp                                ; 261F _ 89. E5
        sub     esp, 16                                 ; 2621 _ 83. EC, 10
        mov     dword [ebp-8H], 0                       ; 2624 _ C7. 45, F8, 00000000
        jmp     ?_095                                   ; 262B _ E9, 00000085

?_092:  mov     eax, dword [ebp+8H]                     ; 2630 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 2633 _ 8B. 55, F8
        add     edx, 2                                  ; 2636 _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 2639 _ 8B. 44 D0, 04
        cmp     eax, dword [ebp+0CH]                    ; 263D _ 3B. 45, 0C
        jc      ?_094                                   ; 2640 _ 72, 6F
        mov     eax, dword [ebp+8H]                     ; 2642 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 2645 _ 8B. 55, F8
        add     edx, 2                                  ; 2648 _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 264B _ 8B. 04 D0
        mov     dword [ebp-4H], eax                     ; 264E _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 2651 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 2654 _ 8B. 55, F8
        add     edx, 2                                  ; 2657 _ 83. C2, 02
        mov     edx, dword [eax+edx*8]                  ; 265A _ 8B. 14 D0
        mov     eax, dword [ebp+0CH]                    ; 265D _ 8B. 45, 0C
        lea     ecx, [edx+eax]                          ; 2660 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 2663 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 2666 _ 8B. 55, F8
        add     edx, 2                                  ; 2669 _ 83. C2, 02
        mov     dword [eax+edx*8], ecx                  ; 266C _ 89. 0C D0
        mov     eax, dword [ebp+8H]                     ; 266F _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 2672 _ 8B. 55, F8
        add     edx, 2                                  ; 2675 _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 2678 _ 8B. 44 D0, 04
        sub     eax, dword [ebp+0CH]                    ; 267C _ 2B. 45, 0C
        mov     edx, eax                                ; 267F _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 2681 _ 8B. 45, 08
        mov     ecx, dword [ebp-8H]                     ; 2684 _ 8B. 4D, F8
        add     ecx, 2                                  ; 2687 _ 83. C1, 02
        mov     dword [eax+ecx*8+4H], edx               ; 268A _ 89. 54 C8, 04
        mov     eax, dword [ebp+8H]                     ; 268E _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 2691 _ 8B. 55, F8
        add     edx, 2                                  ; 2694 _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 2697 _ 8B. 44 D0, 04
        test    eax, eax                                ; 269B _ 85. C0
        jnz     ?_093                                   ; 269D _ 75, 0D
        mov     eax, dword [ebp+8H]                     ; 269F _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 26A2 _ 8B. 00
        lea     edx, [eax-1H]                           ; 26A4 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 26A7 _ 8B. 45, 08
        mov     dword [eax], edx                        ; 26AA _ 89. 10
?_093:  mov     eax, dword [ebp-4H]                     ; 26AC _ 8B. 45, FC
        jmp     ?_096                                   ; 26AF _ EB, 17

?_094:  add     dword [ebp-8H], 1                       ; 26B1 _ 83. 45, F8, 01
?_095:  mov     eax, dword [ebp+8H]                     ; 26B5 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 26B8 _ 8B. 00
        cmp     eax, dword [ebp-8H]                     ; 26BA _ 3B. 45, F8
        ja      ?_092                                   ; 26BD _ 0F 87, FFFFFF6D
        mov     eax, 0                                  ; 26C3 _ B8, 00000000
?_096:  leave                                           ; 26C8 _ C9
        ret                                             ; 26C9 _ C3
; memman_alloc End of function

memman_free:; Function begin
        push    ebp                                     ; 26CA _ 55
        mov     ebp, esp                                ; 26CB _ 89. E5
        push    ebx                                     ; 26CD _ 53
        sub     esp, 16                                 ; 26CE _ 83. EC, 10
        mov     dword [ebp-0CH], 0                      ; 26D1 _ C7. 45, F4, 00000000
        jmp     ?_099                                   ; 26D8 _ EB, 17

?_097:  mov     eax, dword [ebp+8H]                     ; 26DA _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 26DD _ 8B. 55, F4
        add     edx, 2                                  ; 26E0 _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 26E3 _ 8B. 04 D0
        cmp     eax, dword [ebp+0CH]                    ; 26E6 _ 3B. 45, 0C
        jbe     ?_098                                   ; 26E9 _ 76, 02
        jmp     ?_100                                   ; 26EB _ EB, 0E

?_098:  add     dword [ebp-0CH], 1                      ; 26ED _ 83. 45, F4, 01
?_099:  mov     eax, dword [ebp+8H]                     ; 26F1 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 26F4 _ 8B. 00
        cmp     eax, dword [ebp-0CH]                    ; 26F6 _ 3B. 45, F4
        jg      ?_097                                   ; 26F9 _ 7F, DF
?_100:  cmp     dword [ebp-0CH], 0                      ; 26FB _ 83. 7D, F4, 00
        jle     ?_102                                   ; 26FF _ 0F 8E, 000000BA
        mov     eax, dword [ebp-0CH]                    ; 2705 _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 2708 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 270B _ 8B. 45, 08
        add     edx, 2                                  ; 270E _ 83. C2, 02
        mov     edx, dword [eax+edx*8]                  ; 2711 _ 8B. 14 D0
        mov     eax, dword [ebp-0CH]                    ; 2714 _ 8B. 45, F4
        lea     ecx, [eax-1H]                           ; 2717 _ 8D. 48, FF
        mov     eax, dword [ebp+8H]                     ; 271A _ 8B. 45, 08
        add     ecx, 2                                  ; 271D _ 83. C1, 02
        mov     eax, dword [eax+ecx*8+4H]               ; 2720 _ 8B. 44 C8, 04
        add     eax, edx                                ; 2724 _ 01. D0
        cmp     eax, dword [ebp+0CH]                    ; 2726 _ 3B. 45, 0C
        jne     ?_102                                   ; 2729 _ 0F 85, 00000090
        mov     eax, dword [ebp-0CH]                    ; 272F _ 8B. 45, F4
        lea     ebx, [eax-1H]                           ; 2732 _ 8D. 58, FF
        mov     eax, dword [ebp-0CH]                    ; 2735 _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 2738 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 273B _ 8B. 45, 08
        add     edx, 2                                  ; 273E _ 83. C2, 02
        mov     edx, dword [eax+edx*8+4H]               ; 2741 _ 8B. 54 D0, 04
        mov     eax, dword [ebp+10H]                    ; 2745 _ 8B. 45, 10
        lea     ecx, [edx+eax]                          ; 2748 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 274B _ 8B. 45, 08
        lea     edx, [ebx+2H]                           ; 274E _ 8D. 53, 02
        mov     dword [eax+edx*8+4H], ecx               ; 2751 _ 89. 4C D0, 04
        mov     eax, dword [ebp+8H]                     ; 2755 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 2758 _ 8B. 00
        cmp     eax, dword [ebp-0CH]                    ; 275A _ 3B. 45, F4
        jle     ?_101                                   ; 275D _ 7E, 56
        mov     eax, dword [ebp+10H]                    ; 275F _ 8B. 45, 10
        mov     edx, dword [ebp+0CH]                    ; 2762 _ 8B. 55, 0C
        lea     ecx, [edx+eax]                          ; 2765 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 2768 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 276B _ 8B. 55, F4
        add     edx, 2                                  ; 276E _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 2771 _ 8B. 04 D0
        cmp     ecx, eax                                ; 2774 _ 39. C1
        jnz     ?_101                                   ; 2776 _ 75, 3D
        mov     eax, dword [ebp-0CH]                    ; 2778 _ 8B. 45, F4
        lea     ebx, [eax-1H]                           ; 277B _ 8D. 58, FF
        mov     eax, dword [ebp-0CH]                    ; 277E _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 2781 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 2784 _ 8B. 45, 08
        add     edx, 2                                  ; 2787 _ 83. C2, 02
        mov     edx, dword [eax+edx*8+4H]               ; 278A _ 8B. 54 D0, 04
        mov     eax, dword [ebp+8H]                     ; 278E _ 8B. 45, 08
        mov     ecx, dword [ebp-0CH]                    ; 2791 _ 8B. 4D, F4
        add     ecx, 2                                  ; 2794 _ 83. C1, 02
        mov     eax, dword [eax+ecx*8+4H]               ; 2797 _ 8B. 44 C8, 04
        lea     ecx, [edx+eax]                          ; 279B _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 279E _ 8B. 45, 08
        lea     edx, [ebx+2H]                           ; 27A1 _ 8D. 53, 02
        mov     dword [eax+edx*8+4H], ecx               ; 27A4 _ 89. 4C D0, 04
        mov     eax, dword [ebp+8H]                     ; 27A8 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 27AB _ 8B. 00
        lea     edx, [eax-1H]                           ; 27AD _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 27B0 _ 8B. 45, 08
        mov     dword [eax], edx                        ; 27B3 _ 89. 10
?_101:  mov     eax, 0                                  ; 27B5 _ B8, 00000000
        jmp     ?_108                                   ; 27BA _ E9, 0000011C

?_102:  mov     eax, dword [ebp+8H]                     ; 27BF _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 27C2 _ 8B. 00
        cmp     eax, dword [ebp-0CH]                    ; 27C4 _ 3B. 45, F4
        jle     ?_103                                   ; 27C7 _ 7E, 52
        mov     eax, dword [ebp+10H]                    ; 27C9 _ 8B. 45, 10
        mov     edx, dword [ebp+0CH]                    ; 27CC _ 8B. 55, 0C
        lea     ecx, [edx+eax]                          ; 27CF _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 27D2 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 27D5 _ 8B. 55, F4
        add     edx, 2                                  ; 27D8 _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 27DB _ 8B. 04 D0
        cmp     ecx, eax                                ; 27DE _ 39. C1
        jnz     ?_103                                   ; 27E0 _ 75, 39
        mov     eax, dword [ebp+8H]                     ; 27E2 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 27E5 _ 8B. 55, F4
        lea     ecx, [edx+2H]                           ; 27E8 _ 8D. 4A, 02
        mov     edx, dword [ebp+0CH]                    ; 27EB _ 8B. 55, 0C
        mov     dword [eax+ecx*8], edx                  ; 27EE _ 89. 14 C8
        mov     eax, dword [ebp+8H]                     ; 27F1 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 27F4 _ 8B. 55, F4
        add     edx, 2                                  ; 27F7 _ 83. C2, 02
        mov     edx, dword [eax+edx*8+4H]               ; 27FA _ 8B. 54 D0, 04
        mov     eax, dword [ebp+10H]                    ; 27FE _ 8B. 45, 10
        lea     ecx, [edx+eax]                          ; 2801 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 2804 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 2807 _ 8B. 55, F4
        add     edx, 2                                  ; 280A _ 83. C2, 02
        mov     dword [eax+edx*8+4H], ecx               ; 280D _ 89. 4C D0, 04
        mov     eax, 0                                  ; 2811 _ B8, 00000000
        jmp     ?_108                                   ; 2816 _ E9, 000000C0

?_103:  mov     eax, dword [ebp+8H]                     ; 281B _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 281E _ 8B. 00
        cmp     eax, 4095                               ; 2820 _ 3D, 00000FFF
        jg      ?_107                                   ; 2825 _ 0F 8F, 00000087
        mov     eax, dword [ebp+8H]                     ; 282B _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 282E _ 8B. 00
        mov     dword [ebp-8H], eax                     ; 2830 _ 89. 45, F8
        jmp     ?_105                                   ; 2833 _ EB, 28

?_104:  mov     eax, dword [ebp-8H]                     ; 2835 _ 8B. 45, F8
        lea     edx, [eax-1H]                           ; 2838 _ 8D. 50, FF
        mov     ecx, dword [ebp+8H]                     ; 283B _ 8B. 4D, 08
        mov     eax, dword [ebp-8H]                     ; 283E _ 8B. 45, F8
        lea     ebx, [eax+2H]                           ; 2841 _ 8D. 58, 02
        mov     eax, dword [ebp+8H]                     ; 2844 _ 8B. 45, 08
        add     edx, 2                                  ; 2847 _ 83. C2, 02
        lea     edx, [eax+edx*8]                        ; 284A _ 8D. 14 D0
        mov     eax, dword [edx]                        ; 284D _ 8B. 02
        mov     edx, dword [edx+4H]                     ; 284F _ 8B. 52, 04
        mov     dword [ecx+ebx*8], eax                  ; 2852 _ 89. 04 D9
        mov     dword [ecx+ebx*8+4H], edx               ; 2855 _ 89. 54 D9, 04
        sub     dword [ebp-8H], 1                       ; 2859 _ 83. 6D, F8, 01
?_105:  mov     eax, dword [ebp-8H]                     ; 285D _ 8B. 45, F8
        cmp     eax, dword [ebp-0CH]                    ; 2860 _ 3B. 45, F4
        jg      ?_104                                   ; 2863 _ 7F, D0
        mov     eax, dword [ebp+8H]                     ; 2865 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 2868 _ 8B. 00
        lea     edx, [eax+1H]                           ; 286A _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 286D _ 8B. 45, 08
        mov     dword [eax], edx                        ; 2870 _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 2872 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 2875 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 2878 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 287B _ 8B. 00
        cmp     edx, eax                                ; 287D _ 39. C2
        jge     ?_106                                   ; 287F _ 7D, 0B
        mov     eax, dword [ebp+8H]                     ; 2881 _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 2884 _ 8B. 10
        mov     eax, dword [ebp+8H]                     ; 2886 _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 2889 _ 89. 50, 04
?_106:  mov     eax, dword [ebp+8H]                     ; 288C _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 288F _ 8B. 55, F4
        lea     ecx, [edx+2H]                           ; 2892 _ 8D. 4A, 02
        mov     edx, dword [ebp+0CH]                    ; 2895 _ 8B. 55, 0C
        mov     dword [eax+ecx*8], edx                  ; 2898 _ 89. 14 C8
        mov     eax, dword [ebp+8H]                     ; 289B _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 289E _ 8B. 55, F4
        lea     ecx, [edx+2H]                           ; 28A1 _ 8D. 4A, 02
        mov     edx, dword [ebp+10H]                    ; 28A4 _ 8B. 55, 10
        mov     dword [eax+ecx*8+4H], edx               ; 28A7 _ 89. 54 C8, 04
        mov     eax, 0                                  ; 28AB _ B8, 00000000
        jmp     ?_108                                   ; 28B0 _ EB, 29

?_107:  mov     eax, dword [ebp+8H]                     ; 28B2 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 28B5 _ 8B. 40, 0C
        lea     edx, [eax+1H]                           ; 28B8 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 28BB _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 28BE _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 28C1 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 28C4 _ 8B. 40, 08
        mov     edx, eax                                ; 28C7 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 28C9 _ 8B. 45, 10
        add     eax, edx                                ; 28CC _ 01. D0
        mov     edx, eax                                ; 28CE _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 28D0 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 28D3 _ 89. 50, 08
        mov     eax, 4294967295                         ; 28D6 _ B8, FFFFFFFF
?_108:  add     esp, 16                                 ; 28DB _ 83. C4, 10
        pop     ebx                                     ; 28DE _ 5B
        pop     ebp                                     ; 28DF _ 5D
        ret                                             ; 28E0 _ C3
; memman_free End of function

memman_alloc_4k:; Function begin
        push    ebp                                     ; 28E1 _ 55
        mov     ebp, esp                                ; 28E2 _ 89. E5
        sub     esp, 24                                 ; 28E4 _ 83. EC, 18
        mov     eax, dword [ebp+0CH]                    ; 28E7 _ 8B. 45, 0C
        add     eax, 4095                               ; 28EA _ 05, 00000FFF
        and     eax, 0FFFFF000H                         ; 28EF _ 25, FFFFF000
        mov     dword [ebp+0CH], eax                    ; 28F4 _ 89. 45, 0C
        mov     eax, dword [ebp+0CH]                    ; 28F7 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 28FA _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 28FE _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2901 _ 89. 04 24
        call    memman_alloc                            ; 2904 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-4H], eax                     ; 2909 _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 290C _ 8B. 45, FC
        leave                                           ; 290F _ C9
        ret                                             ; 2910 _ C3
; memman_alloc_4k End of function

memman_free_4k:; Function begin
        push    ebp                                     ; 2911 _ 55
        mov     ebp, esp                                ; 2912 _ 89. E5
        sub     esp, 28                                 ; 2914 _ 83. EC, 1C
        mov     eax, dword [ebp+10H]                    ; 2917 _ 8B. 45, 10
        add     eax, 4095                               ; 291A _ 05, 00000FFF
        and     eax, 0FFFFF000H                         ; 291F _ 25, FFFFF000
        mov     dword [ebp+10H], eax                    ; 2924 _ 89. 45, 10
        mov     eax, dword [ebp+10H]                    ; 2927 _ 8B. 45, 10
        mov     dword [esp+8H], eax                     ; 292A _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 292E _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 2931 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2935 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2938 _ 89. 04 24
        call    memman_free                             ; 293B _ E8, FFFFFFFC(rel)
        mov     dword [ebp-4H], eax                     ; 2940 _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 2943 _ 8B. 45, FC
        leave                                           ; 2946 _ C9
        ret                                             ; 2947 _ C3
; memman_free_4k End of function

sheet_control_init:; Function begin
        push    ebp                                     ; 2948 _ 55
        mov     ebp, esp                                ; 2949 _ 89. E5
        sub     esp, 40                                 ; 294B _ 83. EC, 28
        mov     dword [esp+4H], 9236                    ; 294E _ C7. 44 24, 04, 00002414
        mov     eax, dword [ebp+8H]                     ; 2956 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2959 _ 89. 04 24
        call    memman_alloc_4k                         ; 295C _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 2961 _ 89. 45, F4
        cmp     dword [ebp-0CH], 0                      ; 2964 _ 83. 7D, F4, 00
        jnz     ?_109                                   ; 2968 _ 75, 24
        mov     eax, dword [ebp-0CH]                    ; 296A _ 8B. 45, F4
        mov     dword [esp+8H], 9236                    ; 296D _ C7. 44 24, 08, 00002414
        mov     dword [esp+4H], eax                     ; 2975 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2979 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 297C _ 89. 04 24
        call    memman_free_4k                          ; 297F _ E8, FFFFFFFC(rel)
        mov     eax, 0                                  ; 2984 _ B8, 00000000
        jmp     ?_113                                   ; 2989 _ E9, 0000009D

?_109:  mov     eax, dword [ebp-0CH]                    ; 298E _ 8B. 45, F4
        mov     edx, dword [ebp+0CH]                    ; 2991 _ 8B. 55, 0C
        mov     dword [eax], edx                        ; 2994 _ 89. 10
        mov     eax, dword [ebp-0CH]                    ; 2996 _ 8B. 45, F4
        mov     edx, dword [ebp+10H]                    ; 2999 _ 8B. 55, 10
        mov     dword [eax+4H], edx                     ; 299C _ 89. 50, 04
        mov     eax, dword [ebp-0CH]                    ; 299F _ 8B. 45, F4
        mov     edx, dword [ebp+14H]                    ; 29A2 _ 8B. 55, 14
        mov     dword [eax+8H], edx                     ; 29A5 _ 89. 50, 08
        mov     eax, dword [ebp-0CH]                    ; 29A8 _ 8B. 45, F4
        mov     dword [eax+0CH], -1                     ; 29AB _ C7. 40, 0C, FFFFFFFF
        mov     dword [ebp-10H], 0                      ; 29B2 _ C7. 45, F0, 00000000
        jmp     ?_111                                   ; 29B9 _ EB, 1B

?_110:  mov     eax, dword [ebp-0CH]                    ; 29BB _ 8B. 45, F4
        mov     edx, dword [ebp-10H]                    ; 29BE _ 8B. 55, F0
        add     edx, 33                                 ; 29C1 _ 83. C2, 21
        shl     edx, 5                                  ; 29C4 _ C1. E2, 05
        add     eax, edx                                ; 29C7 _ 01. D0
        add     eax, 16                                 ; 29C9 _ 83. C0, 10
        mov     dword [eax], 0                          ; 29CC _ C7. 00, 00000000
        add     dword [ebp-10H], 1                      ; 29D2 _ 83. 45, F0, 01
?_111:  cmp     dword [ebp-10H], 255                    ; 29D6 _ 81. 7D, F0, 000000FF
        jle     ?_110                                   ; 29DD _ 7E, DC
        mov     eax, dword [ebp+10H]                    ; 29DF _ 8B. 45, 10
        imul    eax, dword [ebp+14H]                    ; 29E2 _ 0F AF. 45, 14
        mov     dword [esp+4H], eax                     ; 29E6 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 29EA _ 8B. 45, 08
        mov     dword [esp], eax                        ; 29ED _ 89. 04 24
        call    memman_alloc_4k                         ; 29F0 _ E8, FFFFFFFC(rel)
        mov     edx, eax                                ; 29F5 _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 29F7 _ 8B. 45, F4
        mov     dword [eax+10H], edx                    ; 29FA _ 89. 50, 10
        mov     eax, dword [ebp-0CH]                    ; 29FD _ 8B. 45, F4
        mov     eax, dword [eax+10H]                    ; 2A00 _ 8B. 40, 10
        test    eax, eax                                ; 2A03 _ 85. C0
        jnz     ?_112                                   ; 2A05 _ 75, 21
        mov     eax, dword [ebp-0CH]                    ; 2A07 _ 8B. 45, F4
        mov     dword [esp+8H], 9236                    ; 2A0A _ C7. 44 24, 08, 00002414
        mov     dword [esp+4H], eax                     ; 2A12 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2A16 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2A19 _ 89. 04 24
        call    memman_free_4k                          ; 2A1C _ E8, FFFFFFFC(rel)
        mov     eax, 0                                  ; 2A21 _ B8, 00000000
        jmp     ?_113                                   ; 2A26 _ EB, 03

?_112:  mov     eax, dword [ebp-0CH]                    ; 2A28 _ 8B. 45, F4
?_113:  leave                                           ; 2A2B _ C9
        ret                                             ; 2A2C _ C3
; sheet_control_init End of function

sheet_alloc:; Function begin
        push    ebp                                     ; 2A2D _ 55
        mov     ebp, esp                                ; 2A2E _ 89. E5
        sub     esp, 16                                 ; 2A30 _ 83. EC, 10
        mov     dword [ebp-8H], 0                       ; 2A33 _ C7. 45, F8, 00000000
        jmp     ?_116                                   ; 2A3A _ EB, 5B

?_114:  mov     eax, dword [ebp+8H]                     ; 2A3C _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 2A3F _ 8B. 55, F8
        add     edx, 33                                 ; 2A42 _ 83. C2, 21
        shl     edx, 5                                  ; 2A45 _ C1. E2, 05
        add     eax, edx                                ; 2A48 _ 01. D0
        add     eax, 16                                 ; 2A4A _ 83. C0, 10
        mov     eax, dword [eax]                        ; 2A4D _ 8B. 00
        test    eax, eax                                ; 2A4F _ 85. C0
        jnz     ?_115                                   ; 2A51 _ 75, 40
        mov     eax, dword [ebp-8H]                     ; 2A53 _ 8B. 45, F8
        shl     eax, 5                                  ; 2A56 _ C1. E0, 05
        lea     edx, [eax+410H]                         ; 2A59 _ 8D. 90, 00000410
        mov     eax, dword [ebp+8H]                     ; 2A5F _ 8B. 45, 08
        add     eax, edx                                ; 2A62 _ 01. D0
        add     eax, 4                                  ; 2A64 _ 83. C0, 04
        mov     dword [ebp-4H], eax                     ; 2A67 _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 2A6A _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 2A6D _ 8B. 55, F8
        lea     ecx, [edx+4H]                           ; 2A70 _ 8D. 4A, 04
        mov     edx, dword [ebp-4H]                     ; 2A73 _ 8B. 55, FC
        mov     dword [eax+ecx*4+4H], edx               ; 2A76 _ 89. 54 88, 04
        mov     eax, dword [ebp-4H]                     ; 2A7A _ 8B. 45, FC
        mov     dword [eax+1CH], 1                      ; 2A7D _ C7. 40, 1C, 00000001
        mov     eax, dword [ebp-4H]                     ; 2A84 _ 8B. 45, FC
        mov     dword [eax+18H], -1                     ; 2A87 _ C7. 40, 18, FFFFFFFF
        mov     eax, dword [ebp-4H]                     ; 2A8E _ 8B. 45, FC
        jmp     ?_117                                   ; 2A91 _ EB, 12

?_115:  add     dword [ebp-8H], 1                       ; 2A93 _ 83. 45, F8, 01
?_116:  cmp     dword [ebp-8H], 255                     ; 2A97 _ 81. 7D, F8, 000000FF
        jle     ?_114                                   ; 2A9E _ 7E, 9C
        mov     eax, 0                                  ; 2AA0 _ B8, 00000000
?_117:  leave                                           ; 2AA5 _ C9
        ret                                             ; 2AA6 _ C3
; sheet_alloc End of function

sheet_setbuf:; Function begin
        push    ebp                                     ; 2AA7 _ 55
        mov     ebp, esp                                ; 2AA8 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 2AAA _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 2AAD _ 8B. 55, 0C
        mov     dword [eax], edx                        ; 2AB0 _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 2AB2 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 2AB5 _ 8B. 55, 10
        mov     dword [eax+4H], edx                     ; 2AB8 _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 2ABB _ 8B. 45, 08
        mov     edx, dword [ebp+14H]                    ; 2ABE _ 8B. 55, 14
        mov     dword [eax+8H], edx                     ; 2AC1 _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 2AC4 _ 8B. 45, 08
        mov     edx, dword [ebp+18H]                    ; 2AC7 _ 8B. 55, 18
        mov     dword [eax+14H], edx                    ; 2ACA _ 89. 50, 14
        pop     ebp                                     ; 2ACD _ 5D
        ret                                             ; 2ACE _ C3
; sheet_setbuf End of function

sheet_updown:; Function begin
        push    ebp                                     ; 2ACF _ 55
        mov     ebp, esp                                ; 2AD0 _ 89. E5
        push    esi                                     ; 2AD2 _ 56
        push    ebx                                     ; 2AD3 _ 53
        sub     esp, 48                                 ; 2AD4 _ 83. EC, 30
        mov     eax, dword [ebp+0CH]                    ; 2AD7 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 2ADA _ 8B. 40, 18
        mov     dword [ebp-0CH], eax                    ; 2ADD _ 89. 45, F4
        mov     eax, dword [ebp+8H]                     ; 2AE0 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 2AE3 _ 8B. 40, 0C
        add     eax, 1                                  ; 2AE6 _ 83. C0, 01
        cmp     eax, dword [ebp+10H]                    ; 2AE9 _ 3B. 45, 10
        jge     ?_118                                   ; 2AEC _ 7D, 0C
        mov     eax, dword [ebp+8H]                     ; 2AEE _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 2AF1 _ 8B. 40, 0C
        add     eax, 1                                  ; 2AF4 _ 83. C0, 01
        mov     dword [ebp+10H], eax                    ; 2AF7 _ 89. 45, 10
?_118:  cmp     dword [ebp+10H], -1                     ; 2AFA _ 83. 7D, 10, FF
        jge     ?_119                                   ; 2AFE _ 7D, 07
        mov     dword [ebp+10H], -1                     ; 2B00 _ C7. 45, 10, FFFFFFFF
?_119:  mov     eax, dword [ebp+0CH]                    ; 2B07 _ 8B. 45, 0C
        mov     edx, dword [ebp+10H]                    ; 2B0A _ 8B. 55, 10
        mov     dword [eax+18H], edx                    ; 2B0D _ 89. 50, 18
        mov     eax, dword [ebp-0CH]                    ; 2B10 _ 8B. 45, F4
        cmp     eax, dword [ebp+10H]                    ; 2B13 _ 3B. 45, 10
        jle     ?_126                                   ; 2B16 _ 0F 8E, 00000201
        cmp     dword [ebp+10H], 0                      ; 2B1C _ 83. 7D, 10, 00
        js      ?_122                                   ; 2B20 _ 0F 88, 000000F7
        mov     eax, dword [ebp-0CH]                    ; 2B26 _ 8B. 45, F4
        mov     dword [ebp-10H], eax                    ; 2B29 _ 89. 45, F0
        jmp     ?_121                                   ; 2B2C _ EB, 34

?_120:  mov     eax, dword [ebp-10H]                    ; 2B2E _ 8B. 45, F0
        lea     edx, [eax-1H]                           ; 2B31 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 2B34 _ 8B. 45, 08
        add     edx, 4                                  ; 2B37 _ 83. C2, 04
        mov     edx, dword [eax+edx*4+4H]               ; 2B3A _ 8B. 54 90, 04
        mov     eax, dword [ebp+8H]                     ; 2B3E _ 8B. 45, 08
        mov     ecx, dword [ebp-10H]                    ; 2B41 _ 8B. 4D, F0
        add     ecx, 4                                  ; 2B44 _ 83. C1, 04
        mov     dword [eax+ecx*4+4H], edx               ; 2B47 _ 89. 54 88, 04
        mov     eax, dword [ebp+8H]                     ; 2B4B _ 8B. 45, 08
        mov     edx, dword [ebp-10H]                    ; 2B4E _ 8B. 55, F0
        add     edx, 4                                  ; 2B51 _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 2B54 _ 8B. 44 90, 04
        mov     edx, dword [ebp-10H]                    ; 2B58 _ 8B. 55, F0
        mov     dword [eax+18H], edx                    ; 2B5B _ 89. 50, 18
        sub     dword [ebp-10H], 1                      ; 2B5E _ 83. 6D, F0, 01
?_121:  mov     eax, dword [ebp-10H]                    ; 2B62 _ 8B. 45, F0
        cmp     eax, dword [ebp+10H]                    ; 2B65 _ 3B. 45, 10
        jg      ?_120                                   ; 2B68 _ 7F, C4
        mov     eax, dword [ebp+8H]                     ; 2B6A _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 2B6D _ 8B. 55, 10
        lea     ecx, [edx+4H]                           ; 2B70 _ 8D. 4A, 04
        mov     edx, dword [ebp+0CH]                    ; 2B73 _ 8B. 55, 0C
        mov     dword [eax+ecx*4+4H], edx               ; 2B76 _ 89. 54 88, 04
        mov     eax, dword [ebp+10H]                    ; 2B7A _ 8B. 45, 10
        lea     esi, [eax+1H]                           ; 2B7D _ 8D. 70, 01
        mov     eax, dword [ebp+0CH]                    ; 2B80 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 2B83 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 2B86 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 2B89 _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 2B8C _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 2B8F _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 2B92 _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 2B95 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 2B98 _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 2B9B _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 2B9E _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 2BA1 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 2BA4 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 2BA7 _ 8B. 40, 0C
        mov     dword [esp+14H], esi                    ; 2BAA _ 89. 74 24, 14
        mov     dword [esp+10H], ebx                    ; 2BAE _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 2BB2 _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 2BB6 _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 2BBA _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2BBE _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2BC1 _ 89. 04 24
        call    sheet_refresh_map                       ; 2BC4 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 2BC9 _ 8B. 45, 10
        lea     esi, [eax+1H]                           ; 2BCC _ 8D. 70, 01
        mov     eax, dword [ebp+0CH]                    ; 2BCF _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 2BD2 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 2BD5 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 2BD8 _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 2BDB _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 2BDE _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 2BE1 _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 2BE4 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 2BE7 _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 2BEA _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 2BED _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 2BF0 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 2BF3 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 2BF6 _ 8B. 40, 0C
        mov     dword [esp+14H], esi                    ; 2BF9 _ 89. 74 24, 14
        mov     dword [esp+10H], ebx                    ; 2BFD _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 2C01 _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 2C05 _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 2C09 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2C0D _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2C10 _ 89. 04 24
        call    sheet_refresh_local                     ; 2C13 _ E8, FFFFFFFC(rel)
        jmp     ?_133                                   ; 2C18 _ E9, 0000026C

?_122:  mov     eax, dword [ebp+8H]                     ; 2C1D _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 2C20 _ 8B. 40, 0C
        cmp     eax, dword [ebp-0CH]                    ; 2C23 _ 3B. 45, F4
        jle     ?_125                                   ; 2C26 _ 7E, 47
        mov     eax, dword [ebp-0CH]                    ; 2C28 _ 8B. 45, F4
        mov     dword [ebp-10H], eax                    ; 2C2B _ 89. 45, F0
        jmp     ?_124                                   ; 2C2E _ EB, 34

?_123:  mov     eax, dword [ebp-10H]                    ; 2C30 _ 8B. 45, F0
        lea     edx, [eax+1H]                           ; 2C33 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 2C36 _ 8B. 45, 08
        add     edx, 4                                  ; 2C39 _ 83. C2, 04
        mov     edx, dword [eax+edx*4+4H]               ; 2C3C _ 8B. 54 90, 04
        mov     eax, dword [ebp+8H]                     ; 2C40 _ 8B. 45, 08
        mov     ecx, dword [ebp-10H]                    ; 2C43 _ 8B. 4D, F0
        add     ecx, 4                                  ; 2C46 _ 83. C1, 04
        mov     dword [eax+ecx*4+4H], edx               ; 2C49 _ 89. 54 88, 04
        mov     eax, dword [ebp+8H]                     ; 2C4D _ 8B. 45, 08
        mov     edx, dword [ebp-10H]                    ; 2C50 _ 8B. 55, F0
        add     edx, 4                                  ; 2C53 _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 2C56 _ 8B. 44 90, 04
        mov     edx, dword [ebp-10H]                    ; 2C5A _ 8B. 55, F0
        mov     dword [eax+18H], edx                    ; 2C5D _ 89. 50, 18
        add     dword [ebp-10H], 1                      ; 2C60 _ 83. 45, F0, 01
?_124:  mov     eax, dword [ebp+8H]                     ; 2C64 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 2C67 _ 8B. 40, 0C
        cmp     eax, dword [ebp-10H]                    ; 2C6A _ 3B. 45, F0
        jg      ?_123                                   ; 2C6D _ 7F, C1
?_125:  mov     eax, dword [ebp+8H]                     ; 2C6F _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 2C72 _ 8B. 40, 0C
        lea     edx, [eax-1H]                           ; 2C75 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 2C78 _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 2C7B _ 89. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 2C7E _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 2C81 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 2C84 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 2C87 _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 2C8A _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 2C8D _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 2C90 _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 2C93 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 2C96 _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 2C99 _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 2C9C _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 2C9F _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 2CA2 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 2CA5 _ 8B. 40, 0C
        mov     dword [esp+14H], 0                      ; 2CA8 _ C7. 44 24, 14, 00000000
        mov     dword [esp+10H], ebx                    ; 2CB0 _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 2CB4 _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 2CB8 _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 2CBC _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2CC0 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2CC3 _ 89. 04 24
        call    sheet_refresh_map                       ; 2CC6 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+0CH]                    ; 2CCB _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 2CCE _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 2CD1 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 2CD4 _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 2CD7 _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 2CDA _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 2CDD _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 2CE0 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 2CE3 _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 2CE6 _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 2CE9 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 2CEC _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 2CEF _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 2CF2 _ 8B. 40, 0C
        mov     dword [esp+14H], 0                      ; 2CF5 _ C7. 44 24, 14, 00000000
        mov     dword [esp+10H], ebx                    ; 2CFD _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 2D01 _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 2D05 _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 2D09 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2D0D _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2D10 _ 89. 04 24
        call    sheet_refresh_local                     ; 2D13 _ E8, FFFFFFFC(rel)
        jmp     ?_133                                   ; 2D18 _ E9, 0000016C

?_126:  mov     eax, dword [ebp-0CH]                    ; 2D1D _ 8B. 45, F4
        cmp     eax, dword [ebp+10H]                    ; 2D20 _ 3B. 45, 10
        jge     ?_133                                   ; 2D23 _ 0F 8D, 00000160
        cmp     dword [ebp-0CH], 0                      ; 2D29 _ 83. 7D, F4, 00
        js      ?_129                                   ; 2D2D _ 78, 56
        mov     eax, dword [ebp-0CH]                    ; 2D2F _ 8B. 45, F4
        mov     dword [ebp-10H], eax                    ; 2D32 _ 89. 45, F0
        jmp     ?_128                                   ; 2D35 _ EB, 34

?_127:  mov     eax, dword [ebp-10H]                    ; 2D37 _ 8B. 45, F0
        lea     edx, [eax+1H]                           ; 2D3A _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 2D3D _ 8B. 45, 08
        add     edx, 4                                  ; 2D40 _ 83. C2, 04
        mov     edx, dword [eax+edx*4+4H]               ; 2D43 _ 8B. 54 90, 04
        mov     eax, dword [ebp+8H]                     ; 2D47 _ 8B. 45, 08
        mov     ecx, dword [ebp-10H]                    ; 2D4A _ 8B. 4D, F0
        add     ecx, 4                                  ; 2D4D _ 83. C1, 04
        mov     dword [eax+ecx*4+4H], edx               ; 2D50 _ 89. 54 88, 04
        mov     eax, dword [ebp+8H]                     ; 2D54 _ 8B. 45, 08
        mov     edx, dword [ebp-10H]                    ; 2D57 _ 8B. 55, F0
        add     edx, 4                                  ; 2D5A _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 2D5D _ 8B. 44 90, 04
        mov     edx, dword [ebp-10H]                    ; 2D61 _ 8B. 55, F0
        mov     dword [eax+18H], edx                    ; 2D64 _ 89. 50, 18
        add     dword [ebp-10H], 1                      ; 2D67 _ 83. 45, F0, 01
?_128:  mov     eax, dword [ebp-10H]                    ; 2D6B _ 8B. 45, F0
        cmp     eax, dword [ebp+10H]                    ; 2D6E _ 3B. 45, 10
        jl      ?_127                                   ; 2D71 _ 7C, C4
        mov     eax, dword [ebp+8H]                     ; 2D73 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 2D76 _ 8B. 55, 10
        lea     ecx, [edx+4H]                           ; 2D79 _ 8D. 4A, 04
        mov     edx, dword [ebp+0CH]                    ; 2D7C _ 8B. 55, 0C
        mov     dword [eax+ecx*4+4H], edx               ; 2D7F _ 89. 54 88, 04
        jmp     ?_132                                   ; 2D83 _ EB, 6C

?_129:  mov     eax, dword [ebp+8H]                     ; 2D85 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 2D88 _ 8B. 40, 0C
        mov     dword [ebp-10H], eax                    ; 2D8B _ 89. 45, F0
        jmp     ?_131                                   ; 2D8E _ EB, 3A

?_130:  mov     eax, dword [ebp-10H]                    ; 2D90 _ 8B. 45, F0
        lea     ecx, [eax+1H]                           ; 2D93 _ 8D. 48, 01
        mov     eax, dword [ebp+8H]                     ; 2D96 _ 8B. 45, 08
        mov     edx, dword [ebp-10H]                    ; 2D99 _ 8B. 55, F0
        add     edx, 4                                  ; 2D9C _ 83. C2, 04
        mov     edx, dword [eax+edx*4+4H]               ; 2D9F _ 8B. 54 90, 04
        mov     eax, dword [ebp+8H]                     ; 2DA3 _ 8B. 45, 08
        add     ecx, 4                                  ; 2DA6 _ 83. C1, 04
        mov     dword [eax+ecx*4+4H], edx               ; 2DA9 _ 89. 54 88, 04
        mov     eax, dword [ebp-10H]                    ; 2DAD _ 8B. 45, F0
        lea     edx, [eax+1H]                           ; 2DB0 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 2DB3 _ 8B. 45, 08
        add     edx, 4                                  ; 2DB6 _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 2DB9 _ 8B. 44 90, 04
        mov     edx, dword [ebp-10H]                    ; 2DBD _ 8B. 55, F0
        add     edx, 1                                  ; 2DC0 _ 83. C2, 01
        mov     dword [eax+18H], edx                    ; 2DC3 _ 89. 50, 18
        sub     dword [ebp-10H], 1                      ; 2DC6 _ 83. 6D, F0, 01
?_131:  mov     eax, dword [ebp-10H]                    ; 2DCA _ 8B. 45, F0
        cmp     eax, dword [ebp+10H]                    ; 2DCD _ 3B. 45, 10
        jge     ?_130                                   ; 2DD0 _ 7D, BE
        mov     eax, dword [ebp+8H]                     ; 2DD2 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 2DD5 _ 8B. 55, 10
        lea     ecx, [edx+4H]                           ; 2DD8 _ 8D. 4A, 04
        mov     edx, dword [ebp+0CH]                    ; 2DDB _ 8B. 55, 0C
        mov     dword [eax+ecx*4+4H], edx               ; 2DDE _ 89. 54 88, 04
        mov     eax, dword [ebp+8H]                     ; 2DE2 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 2DE5 _ 8B. 40, 0C
        lea     edx, [eax+1H]                           ; 2DE8 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 2DEB _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 2DEE _ 89. 50, 0C
?_132:  mov     eax, dword [ebp+0CH]                    ; 2DF1 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 2DF4 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 2DF7 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 2DFA _ 8B. 40, 08
        lea     esi, [edx+eax]                          ; 2DFD _ 8D. 34 02
        mov     eax, dword [ebp+0CH]                    ; 2E00 _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 2E03 _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 2E06 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 2E09 _ 8B. 40, 04
        lea     ebx, [edx+eax]                          ; 2E0C _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 2E0F _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 2E12 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 2E15 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 2E18 _ 8B. 40, 0C
        mov     ecx, dword [ebp+10H]                    ; 2E1B _ 8B. 4D, 10
        mov     dword [esp+14H], ecx                    ; 2E1E _ 89. 4C 24, 14
        mov     dword [esp+10H], esi                    ; 2E22 _ 89. 74 24, 10
        mov     dword [esp+0CH], ebx                    ; 2E26 _ 89. 5C 24, 0C
        mov     dword [esp+8H], edx                     ; 2E2A _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 2E2E _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2E32 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2E35 _ 89. 04 24
        call    sheet_refresh_map                       ; 2E38 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+0CH]                    ; 2E3D _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 2E40 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 2E43 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 2E46 _ 8B. 40, 08
        lea     esi, [edx+eax]                          ; 2E49 _ 8D. 34 02
        mov     eax, dword [ebp+0CH]                    ; 2E4C _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 2E4F _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 2E52 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 2E55 _ 8B. 40, 04
        lea     ebx, [edx+eax]                          ; 2E58 _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 2E5B _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 2E5E _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 2E61 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 2E64 _ 8B. 40, 0C
        mov     ecx, dword [ebp+10H]                    ; 2E67 _ 8B. 4D, 10
        mov     dword [esp+14H], ecx                    ; 2E6A _ 89. 4C 24, 14
        mov     dword [esp+10H], esi                    ; 2E6E _ 89. 74 24, 10
        mov     dword [esp+0CH], ebx                    ; 2E72 _ 89. 5C 24, 0C
        mov     dword [esp+8H], edx                     ; 2E76 _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 2E7A _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2E7E _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2E81 _ 89. 04 24
        call    sheet_refresh_local                     ; 2E84 _ E8, FFFFFFFC(rel)
?_133:  add     esp, 48                                 ; 2E89 _ 83. C4, 30
        pop     ebx                                     ; 2E8C _ 5B
        pop     esi                                     ; 2E8D _ 5E
        pop     ebp                                     ; 2E8E _ 5D
        ret                                             ; 2E8F _ C3
; sheet_updown End of function

sheet_refresh:; Function begin
        push    ebp                                     ; 2E90 _ 55
        mov     ebp, esp                                ; 2E91 _ 89. E5
        push    edi                                     ; 2E93 _ 57
        push    esi                                     ; 2E94 _ 56
        push    ebx                                     ; 2E95 _ 53
        sub     esp, 44                                 ; 2E96 _ 83. EC, 2C
        mov     eax, dword [ebp+0CH]                    ; 2E99 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 2E9C _ 8B. 40, 18
        test    eax, eax                                ; 2E9F _ 85. C0
        js      ?_134                                   ; 2EA1 _ 78, 53
        mov     eax, dword [ebp+0CH]                    ; 2EA3 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 2EA6 _ 8B. 40, 18
        mov     edx, dword [ebp+0CH]                    ; 2EA9 _ 8B. 55, 0C
        mov     ecx, dword [edx+10H]                    ; 2EAC _ 8B. 4A, 10
        mov     edx, dword [ebp+1CH]                    ; 2EAF _ 8B. 55, 1C
        lea     esi, [ecx+edx]                          ; 2EB2 _ 8D. 34 11
        mov     edx, dword [ebp+0CH]                    ; 2EB5 _ 8B. 55, 0C
        mov     ecx, dword [edx+0CH]                    ; 2EB8 _ 8B. 4A, 0C
        mov     edx, dword [ebp+18H]                    ; 2EBB _ 8B. 55, 18
        lea     ebx, [ecx+edx]                          ; 2EBE _ 8D. 1C 11
        mov     edx, dword [ebp+0CH]                    ; 2EC1 _ 8B. 55, 0C
        mov     ecx, dword [edx+10H]                    ; 2EC4 _ 8B. 4A, 10
        mov     edx, dword [ebp+14H]                    ; 2EC7 _ 8B. 55, 14
        add     ecx, edx                                ; 2ECA _ 01. D1
        mov     edx, dword [ebp+0CH]                    ; 2ECC _ 8B. 55, 0C
        mov     edi, dword [edx+0CH]                    ; 2ECF _ 8B. 7A, 0C
        mov     edx, dword [ebp+10H]                    ; 2ED2 _ 8B. 55, 10
        add     edx, edi                                ; 2ED5 _ 01. FA
        mov     dword [esp+14H], eax                    ; 2ED7 _ 89. 44 24, 14
        mov     dword [esp+10H], esi                    ; 2EDB _ 89. 74 24, 10
        mov     dword [esp+0CH], ebx                    ; 2EDF _ 89. 5C 24, 0C
        mov     dword [esp+8H], ecx                     ; 2EE3 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 2EE7 _ 89. 54 24, 04
        mov     eax, dword [ebp+8H]                     ; 2EEB _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2EEE _ 89. 04 24
        call    sheet_refresh_local                     ; 2EF1 _ E8, FFFFFFFC(rel)
?_134:  mov     eax, 0                                  ; 2EF6 _ B8, 00000000
        add     esp, 44                                 ; 2EFB _ 83. C4, 2C
        pop     ebx                                     ; 2EFE _ 5B
        pop     esi                                     ; 2EFF _ 5E
        pop     edi                                     ; 2F00 _ 5F
        pop     ebp                                     ; 2F01 _ 5D
        ret                                             ; 2F02 _ C3
; sheet_refresh End of function

sheet_slide:; Function begin
        push    ebp                                     ; 2F03 _ 55
        mov     ebp, esp                                ; 2F04 _ 89. E5
        push    ebx                                     ; 2F06 _ 53
        sub     esp, 52                                 ; 2F07 _ 83. EC, 34
        mov     eax, dword [ebp+0CH]                    ; 2F0A _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 2F0D _ 8B. 40, 0C
        mov     dword [ebp-10H], eax                    ; 2F10 _ 89. 45, F0
        mov     eax, dword [ebp+0CH]                    ; 2F13 _ 8B. 45, 0C
        mov     eax, dword [eax+10H]                    ; 2F16 _ 8B. 40, 10
        mov     dword [ebp-0CH], eax                    ; 2F19 _ 89. 45, F4
        mov     eax, dword [ebp+0CH]                    ; 2F1C _ 8B. 45, 0C
        mov     edx, dword [ebp+10H]                    ; 2F1F _ 8B. 55, 10
        mov     dword [eax+0CH], edx                    ; 2F22 _ 89. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 2F25 _ 8B. 45, 0C
        mov     edx, dword [ebp+14H]                    ; 2F28 _ 8B. 55, 14
        mov     dword [eax+10H], edx                    ; 2F2B _ 89. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 2F2E _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 2F31 _ 8B. 40, 18
        test    eax, eax                                ; 2F34 _ 85. C0
        js      ?_135                                   ; 2F36 _ 0F 88, 00000100
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
        call    sheet_refresh_map                       ; 2F76 _ E8, FFFFFFFC(rel)
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
        call    sheet_refresh_map                       ; 2FB7 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+0CH]                    ; 2FBC _ 8B. 45, 0C
        mov     edx, dword [eax+8H]                     ; 2FBF _ 8B. 50, 08
        mov     eax, dword [ebp-0CH]                    ; 2FC2 _ 8B. 45, F4
        add     edx, eax                                ; 2FC5 _ 01. C2
        mov     eax, dword [ebp+0CH]                    ; 2FC7 _ 8B. 45, 0C
        mov     ecx, dword [eax+4H]                     ; 2FCA _ 8B. 48, 04
        mov     eax, dword [ebp-10H]                    ; 2FCD _ 8B. 45, F0
        add     eax, ecx                                ; 2FD0 _ 01. C8
        mov     dword [esp+14H], 0                      ; 2FD2 _ C7. 44 24, 14, 00000000
        mov     dword [esp+10H], edx                    ; 2FDA _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 2FDE _ 89. 44 24, 0C
        mov     eax, dword [ebp-0CH]                    ; 2FE2 _ 8B. 45, F4
        mov     dword [esp+8H], eax                     ; 2FE5 _ 89. 44 24, 08
        mov     eax, dword [ebp-10H]                    ; 2FE9 _ 8B. 45, F0
        mov     dword [esp+4H], eax                     ; 2FEC _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2FF0 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2FF3 _ 89. 04 24
        call    sheet_refresh_local                     ; 2FF6 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+0CH]                    ; 2FFB _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 2FFE _ 8B. 40, 18
        mov     edx, dword [ebp+0CH]                    ; 3001 _ 8B. 55, 0C
        mov     ecx, dword [edx+8H]                     ; 3004 _ 8B. 4A, 08
        mov     edx, dword [ebp+14H]                    ; 3007 _ 8B. 55, 14
        add     ecx, edx                                ; 300A _ 01. D1
        mov     edx, dword [ebp+0CH]                    ; 300C _ 8B. 55, 0C
        mov     ebx, dword [edx+4H]                     ; 300F _ 8B. 5A, 04
        mov     edx, dword [ebp+10H]                    ; 3012 _ 8B. 55, 10
        add     edx, ebx                                ; 3015 _ 01. DA
        mov     dword [esp+14H], eax                    ; 3017 _ 89. 44 24, 14
        mov     dword [esp+10H], ecx                    ; 301B _ 89. 4C 24, 10
        mov     dword [esp+0CH], edx                    ; 301F _ 89. 54 24, 0C
        mov     eax, dword [ebp+14H]                    ; 3023 _ 8B. 45, 14
        mov     dword [esp+8H], eax                     ; 3026 _ 89. 44 24, 08
        mov     eax, dword [ebp+10H]                    ; 302A _ 8B. 45, 10
        mov     dword [esp+4H], eax                     ; 302D _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 3031 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3034 _ 89. 04 24
        call    sheet_refresh_local                     ; 3037 _ E8, FFFFFFFC(rel)
?_135:  add     esp, 52                                 ; 303C _ 83. C4, 34
        pop     ebx                                     ; 303F _ 5B
        pop     ebp                                     ; 3040 _ 5D
        ret                                             ; 3041 _ C3
; sheet_slide End of function

sheet_refresh_local:; Function begin
        push    ebp                                     ; 3042 _ 55
        mov     ebp, esp                                ; 3043 _ 89. E5
        sub     esp, 48                                 ; 3045 _ 83. EC, 30
        mov     eax, dword [ebp+8H]                     ; 3048 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 304B _ 8B. 00
        mov     dword [ebp-18H], eax                    ; 304D _ 89. 45, E8
        mov     eax, dword [ebp+8H]                     ; 3050 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 3053 _ 8B. 40, 10
        mov     dword [ebp-14H], eax                    ; 3056 _ 89. 45, EC
        cmp     dword [ebp+0CH], 0                      ; 3059 _ 83. 7D, 0C, 00
        jns     ?_136                                   ; 305D _ 79, 07
        mov     dword [ebp+0CH], 0                      ; 305F _ C7. 45, 0C, 00000000
?_136:  cmp     dword [ebp+10H], 0                      ; 3066 _ 83. 7D, 10, 00
        jns     ?_137                                   ; 306A _ 79, 07
        mov     dword [ebp+10H], 0                      ; 306C _ C7. 45, 10, 00000000
?_137:  mov     eax, dword [ebp+8H]                     ; 3073 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 3076 _ 8B. 40, 04
        cmp     eax, dword [ebp+14H]                    ; 3079 _ 3B. 45, 14
        jge     ?_138                                   ; 307C _ 7D, 09
        mov     eax, dword [ebp+8H]                     ; 307E _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 3081 _ 8B. 40, 04
        mov     dword [ebp+14H], eax                    ; 3084 _ 89. 45, 14
?_138:  mov     eax, dword [ebp+8H]                     ; 3087 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 308A _ 8B. 40, 08
        cmp     eax, dword [ebp+18H]                    ; 308D _ 3B. 45, 18
        jge     ?_139                                   ; 3090 _ 7D, 09
        mov     eax, dword [ebp+8H]                     ; 3092 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 3095 _ 8B. 40, 08
        mov     dword [ebp+18H], eax                    ; 3098 _ 89. 45, 18
?_139:  mov     eax, dword [ebp+1CH]                    ; 309B _ 8B. 45, 1C
        mov     dword [ebp-24H], eax                    ; 309E _ 89. 45, DC
        jmp     ?_146                                   ; 30A1 _ E9, 00000119

?_140:  mov     eax, dword [ebp+8H]                     ; 30A6 _ 8B. 45, 08
        mov     edx, dword [ebp-24H]                    ; 30A9 _ 8B. 55, DC
        add     edx, 4                                  ; 30AC _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 30AF _ 8B. 44 90, 04
        mov     dword [ebp-10H], eax                    ; 30B3 _ 89. 45, F0
        mov     eax, dword [ebp-10H]                    ; 30B6 _ 8B. 45, F0
        mov     eax, dword [eax]                        ; 30B9 _ 8B. 00
        mov     dword [ebp-0CH], eax                    ; 30BB _ 89. 45, F4
        mov     edx, dword [ebp-10H]                    ; 30BE _ 8B. 55, F0
        mov     eax, dword [ebp+8H]                     ; 30C1 _ 8B. 45, 08
        add     eax, 1044                               ; 30C4 _ 05, 00000414
        sub     edx, eax                                ; 30C9 _ 29. C2
        mov     eax, edx                                ; 30CB _ 89. D0
        sar     eax, 5                                  ; 30CD _ C1. F8, 05
        mov     byte [ebp-26H], al                      ; 30D0 _ 88. 45, DA
        mov     dword [ebp-1CH], 0                      ; 30D3 _ C7. 45, E4, 00000000
        jmp     ?_145                                   ; 30DA _ E9, 000000CD

?_141:  mov     eax, dword [ebp-10H]                    ; 30DF _ 8B. 45, F0
        mov     edx, dword [eax+10H]                    ; 30E2 _ 8B. 50, 10
        mov     eax, dword [ebp-1CH]                    ; 30E5 _ 8B. 45, E4
        add     eax, edx                                ; 30E8 _ 01. D0
        mov     dword [ebp-8H], eax                     ; 30EA _ 89. 45, F8
        mov     dword [ebp-20H], 0                      ; 30ED _ C7. 45, E0, 00000000
        jmp     ?_144                                   ; 30F4 _ E9, 000000A0

?_142:  mov     eax, dword [ebp-10H]                    ; 30F9 _ 8B. 45, F0
        mov     edx, dword [eax+0CH]                    ; 30FC _ 8B. 50, 0C
        mov     eax, dword [ebp-20H]                    ; 30FF _ 8B. 45, E0
        add     eax, edx                                ; 3102 _ 01. D0
        mov     dword [ebp-4H], eax                     ; 3104 _ 89. 45, FC
        mov     eax, dword [ebp+0CH]                    ; 3107 _ 8B. 45, 0C
        cmp     eax, dword [ebp-4H]                     ; 310A _ 3B. 45, FC
        jg      ?_143                                   ; 310D _ 0F 8F, 00000082
        mov     eax, dword [ebp-4H]                     ; 3113 _ 8B. 45, FC
        cmp     eax, dword [ebp+14H]                    ; 3116 _ 3B. 45, 14
        jge     ?_143                                   ; 3119 _ 7D, 7A
        mov     eax, dword [ebp+10H]                    ; 311B _ 8B. 45, 10
        cmp     eax, dword [ebp-8H]                     ; 311E _ 3B. 45, F8
        jg      ?_143                                   ; 3121 _ 7F, 72
        mov     eax, dword [ebp-8H]                     ; 3123 _ 8B. 45, F8
        cmp     eax, dword [ebp+18H]                    ; 3126 _ 3B. 45, 18
        jge     ?_143                                   ; 3129 _ 7D, 6A
        mov     eax, dword [ebp-10H]                    ; 312B _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 312E _ 8B. 40, 04
        imul    eax, dword [ebp-1CH]                    ; 3131 _ 0F AF. 45, E4
        mov     edx, eax                                ; 3135 _ 89. C2
        mov     eax, dword [ebp-20H]                    ; 3137 _ 8B. 45, E0
        add     eax, edx                                ; 313A _ 01. D0
        mov     edx, eax                                ; 313C _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 313E _ 8B. 45, F4
        add     eax, edx                                ; 3141 _ 01. D0
        movzx   eax, byte [eax]                         ; 3143 _ 0F B6. 00
        mov     byte [ebp-25H], al                      ; 3146 _ 88. 45, DB
        movzx   edx, byte [ebp-25H]                     ; 3149 _ 0F B6. 55, DB
        mov     eax, dword [ebp-10H]                    ; 314D _ 8B. 45, F0
        mov     eax, dword [eax+14H]                    ; 3150 _ 8B. 40, 14
        cmp     edx, eax                                ; 3153 _ 39. C2
        jz      ?_143                                   ; 3155 _ 74, 3E
        mov     eax, dword [ebp+8H]                     ; 3157 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 315A _ 8B. 40, 04
        imul    eax, dword [ebp-8H]                     ; 315D _ 0F AF. 45, F8
        mov     edx, eax                                ; 3161 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 3163 _ 8B. 45, FC
        add     eax, edx                                ; 3166 _ 01. D0
        mov     edx, eax                                ; 3168 _ 89. C2
        mov     eax, dword [ebp-14H]                    ; 316A _ 8B. 45, EC
        add     eax, edx                                ; 316D _ 01. D0
        movzx   eax, byte [eax]                         ; 316F _ 0F B6. 00
        cmp     al, byte [ebp-26H]                      ; 3172 _ 3A. 45, DA
        jnz     ?_143                                   ; 3175 _ 75, 1E
        mov     eax, dword [ebp+8H]                     ; 3177 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 317A _ 8B. 40, 04
        imul    eax, dword [ebp-8H]                     ; 317D _ 0F AF. 45, F8
        mov     edx, eax                                ; 3181 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 3183 _ 8B. 45, FC
        add     eax, edx                                ; 3186 _ 01. D0
        mov     edx, eax                                ; 3188 _ 89. C2
        mov     eax, dword [ebp-18H]                    ; 318A _ 8B. 45, E8
        add     edx, eax                                ; 318D _ 01. C2
        movzx   eax, byte [ebp-25H]                     ; 318F _ 0F B6. 45, DB
        mov     byte [edx], al                          ; 3193 _ 88. 02
?_143:  add     dword [ebp-20H], 1                      ; 3195 _ 83. 45, E0, 01
?_144:  mov     eax, dword [ebp-10H]                    ; 3199 _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 319C _ 8B. 40, 04
        cmp     eax, dword [ebp-20H]                    ; 319F _ 3B. 45, E0
        jg      ?_142                                   ; 31A2 _ 0F 8F, FFFFFF51
        add     dword [ebp-1CH], 1                      ; 31A8 _ 83. 45, E4, 01
?_145:  mov     eax, dword [ebp-10H]                    ; 31AC _ 8B. 45, F0
        mov     eax, dword [eax+8H]                     ; 31AF _ 8B. 40, 08
        cmp     eax, dword [ebp-1CH]                    ; 31B2 _ 3B. 45, E4
        jg      ?_141                                   ; 31B5 _ 0F 8F, FFFFFF24
        add     dword [ebp-24H], 1                      ; 31BB _ 83. 45, DC, 01
?_146:  mov     eax, dword [ebp+8H]                     ; 31BF _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 31C2 _ 8B. 40, 0C
        cmp     eax, dword [ebp-24H]                    ; 31C5 _ 3B. 45, DC
        jge     ?_140                                   ; 31C8 _ 0F 8D, FFFFFED8
        leave                                           ; 31CE _ C9
        ret                                             ; 31CF _ C3
; sheet_refresh_local End of function

sheet_refresh_map:; Function begin
        push    ebp                                     ; 31D0 _ 55
        mov     ebp, esp                                ; 31D1 _ 89. E5
        sub     esp, 64                                 ; 31D3 _ 83. EC, 40
        mov     eax, dword [ebp+8H]                     ; 31D6 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 31D9 _ 8B. 00
        mov     dword [ebp-18H], eax                    ; 31DB _ 89. 45, E8
        mov     eax, dword [ebp+8H]                     ; 31DE _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 31E1 _ 8B. 40, 10
        mov     dword [ebp-14H], eax                    ; 31E4 _ 89. 45, EC
        cmp     dword [ebp+0CH], 0                      ; 31E7 _ 83. 7D, 0C, 00
        jns     ?_147                                   ; 31EB _ 79, 07
        mov     dword [ebp+0CH], 0                      ; 31ED _ C7. 45, 0C, 00000000
?_147:  cmp     dword [ebp+10H], 0                      ; 31F4 _ 83. 7D, 10, 00
        jns     ?_148                                   ; 31F8 _ 79, 07
        mov     dword [ebp+10H], 0                      ; 31FA _ C7. 45, 10, 00000000
?_148:  mov     eax, dword [ebp+8H]                     ; 3201 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 3204 _ 8B. 40, 04
        cmp     eax, dword [ebp+14H]                    ; 3207 _ 3B. 45, 14
        jge     ?_149                                   ; 320A _ 7D, 09
        mov     eax, dword [ebp+8H]                     ; 320C _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 320F _ 8B. 40, 04
        mov     dword [ebp+14H], eax                    ; 3212 _ 89. 45, 14
?_149:  mov     eax, dword [ebp+8H]                     ; 3215 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 3218 _ 8B. 40, 08
        cmp     eax, dword [ebp+18H]                    ; 321B _ 3B. 45, 18
        jge     ?_150                                   ; 321E _ 7D, 09
        mov     eax, dword [ebp+8H]                     ; 3220 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 3223 _ 8B. 40, 08
        mov     dword [ebp+18H], eax                    ; 3226 _ 89. 45, 18
?_150:  mov     eax, dword [ebp+1CH]                    ; 3229 _ 8B. 45, 1C
        mov     dword [ebp-34H], eax                    ; 322C _ 89. 45, CC
        jmp     ?_161                                   ; 322F _ E9, 00000141

?_151:  mov     eax, dword [ebp+8H]                     ; 3234 _ 8B. 45, 08
        mov     edx, dword [ebp-34H]                    ; 3237 _ 8B. 55, CC
        add     edx, 4                                  ; 323A _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 323D _ 8B. 44 90, 04
        mov     dword [ebp-10H], eax                    ; 3241 _ 89. 45, F0
        mov     edx, dword [ebp-10H]                    ; 3244 _ 8B. 55, F0
        mov     eax, dword [ebp+8H]                     ; 3247 _ 8B. 45, 08
        add     eax, 1044                               ; 324A _ 05, 00000414
        sub     edx, eax                                ; 324F _ 29. C2
        mov     eax, edx                                ; 3251 _ 89. D0
        sar     eax, 5                                  ; 3253 _ C1. F8, 05
        mov     byte [ebp-35H], al                      ; 3256 _ 88. 45, CB
        mov     eax, dword [ebp-10H]                    ; 3259 _ 8B. 45, F0
        mov     eax, dword [eax]                        ; 325C _ 8B. 00
        mov     dword [ebp-0CH], eax                    ; 325E _ 89. 45, F4
        mov     eax, dword [ebp-10H]                    ; 3261 _ 8B. 45, F0
        mov     eax, dword [eax+0CH]                    ; 3264 _ 8B. 40, 0C
        mov     edx, dword [ebp+0CH]                    ; 3267 _ 8B. 55, 0C
        sub     edx, eax                                ; 326A _ 29. C2
        mov     eax, edx                                ; 326C _ 89. D0
        mov     dword [ebp-30H], eax                    ; 326E _ 89. 45, D0
        mov     eax, dword [ebp-10H]                    ; 3271 _ 8B. 45, F0
        mov     eax, dword [eax+10H]                    ; 3274 _ 8B. 40, 10
        mov     edx, dword [ebp+10H]                    ; 3277 _ 8B. 55, 10
        sub     edx, eax                                ; 327A _ 29. C2
        mov     eax, edx                                ; 327C _ 89. D0
        mov     dword [ebp-2CH], eax                    ; 327E _ 89. 45, D4
        mov     eax, dword [ebp-10H]                    ; 3281 _ 8B. 45, F0
        mov     eax, dword [eax+0CH]                    ; 3284 _ 8B. 40, 0C
        mov     edx, dword [ebp+14H]                    ; 3287 _ 8B. 55, 14
        sub     edx, eax                                ; 328A _ 29. C2
        mov     eax, edx                                ; 328C _ 89. D0
        mov     dword [ebp-28H], eax                    ; 328E _ 89. 45, D8
        mov     eax, dword [ebp-10H]                    ; 3291 _ 8B. 45, F0
        mov     eax, dword [eax+10H]                    ; 3294 _ 8B. 40, 10
        mov     edx, dword [ebp+18H]                    ; 3297 _ 8B. 55, 18
        sub     edx, eax                                ; 329A _ 29. C2
        mov     eax, edx                                ; 329C _ 89. D0
        mov     dword [ebp-24H], eax                    ; 329E _ 89. 45, DC
        cmp     dword [ebp-30H], 0                      ; 32A1 _ 83. 7D, D0, 00
        jns     ?_152                                   ; 32A5 _ 79, 07
        mov     dword [ebp-30H], 0                      ; 32A7 _ C7. 45, D0, 00000000
?_152:  cmp     dword [ebp-2CH], 0                      ; 32AE _ 83. 7D, D4, 00
        jns     ?_153                                   ; 32B2 _ 79, 07
        mov     dword [ebp-2CH], 0                      ; 32B4 _ C7. 45, D4, 00000000
?_153:  mov     eax, dword [ebp-10H]                    ; 32BB _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 32BE _ 8B. 40, 04
        cmp     eax, dword [ebp-28H]                    ; 32C1 _ 3B. 45, D8
        jge     ?_154                                   ; 32C4 _ 7D, 09
        mov     eax, dword [ebp-10H]                    ; 32C6 _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 32C9 _ 8B. 40, 04
        mov     dword [ebp-28H], eax                    ; 32CC _ 89. 45, D8
?_154:  mov     eax, dword [ebp-10H]                    ; 32CF _ 8B. 45, F0
        mov     eax, dword [eax+8H]                     ; 32D2 _ 8B. 40, 08
        cmp     eax, dword [ebp-24H]                    ; 32D5 _ 3B. 45, DC
        jge     ?_155                                   ; 32D8 _ 7D, 09
        mov     eax, dword [ebp-10H]                    ; 32DA _ 8B. 45, F0
        mov     eax, dword [eax+8H]                     ; 32DD _ 8B. 40, 08
        mov     dword [ebp-24H], eax                    ; 32E0 _ 89. 45, DC
?_155:  mov     eax, dword [ebp-2CH]                    ; 32E3 _ 8B. 45, D4
        mov     dword [ebp-1CH], eax                    ; 32E6 _ 89. 45, E4
        jmp     ?_160                                   ; 32E9 _ EB, 7A

?_156:  mov     eax, dword [ebp-10H]                    ; 32EB _ 8B. 45, F0
        mov     edx, dword [eax+10H]                    ; 32EE _ 8B. 50, 10
        mov     eax, dword [ebp-1CH]                    ; 32F1 _ 8B. 45, E4
        add     eax, edx                                ; 32F4 _ 01. D0
        mov     dword [ebp-8H], eax                     ; 32F6 _ 89. 45, F8
        mov     eax, dword [ebp-30H]                    ; 32F9 _ 8B. 45, D0
        mov     dword [ebp-20H], eax                    ; 32FC _ 89. 45, E0
        jmp     ?_159                                   ; 32FF _ EB, 58

?_157:  mov     eax, dword [ebp-10H]                    ; 3301 _ 8B. 45, F0
        mov     edx, dword [eax+0CH]                    ; 3304 _ 8B. 50, 0C
        mov     eax, dword [ebp-20H]                    ; 3307 _ 8B. 45, E0
        add     eax, edx                                ; 330A _ 01. D0
        mov     dword [ebp-4H], eax                     ; 330C _ 89. 45, FC
        mov     eax, dword [ebp-10H]                    ; 330F _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 3312 _ 8B. 40, 04
        imul    eax, dword [ebp-1CH]                    ; 3315 _ 0F AF. 45, E4
        mov     edx, eax                                ; 3319 _ 89. C2
        mov     eax, dword [ebp-20H]                    ; 331B _ 8B. 45, E0
        add     eax, edx                                ; 331E _ 01. D0
        mov     edx, eax                                ; 3320 _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 3322 _ 8B. 45, F4
        add     eax, edx                                ; 3325 _ 01. D0
        movzx   eax, byte [eax]                         ; 3327 _ 0F B6. 00
        movzx   edx, al                                 ; 332A _ 0F B6. D0
        mov     eax, dword [ebp-10H]                    ; 332D _ 8B. 45, F0
        mov     eax, dword [eax+14H]                    ; 3330 _ 8B. 40, 14
        cmp     edx, eax                                ; 3333 _ 39. C2
        jz      ?_158                                   ; 3335 _ 74, 1E
        mov     eax, dword [ebp+8H]                     ; 3337 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 333A _ 8B. 40, 04
        imul    eax, dword [ebp-8H]                     ; 333D _ 0F AF. 45, F8
        mov     edx, eax                                ; 3341 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 3343 _ 8B. 45, FC
        add     eax, edx                                ; 3346 _ 01. D0
        mov     edx, eax                                ; 3348 _ 89. C2
        mov     eax, dword [ebp-14H]                    ; 334A _ 8B. 45, EC
        add     edx, eax                                ; 334D _ 01. C2
        movzx   eax, byte [ebp-35H]                     ; 334F _ 0F B6. 45, CB
        mov     byte [edx], al                          ; 3353 _ 88. 02
?_158:  add     dword [ebp-20H], 1                      ; 3355 _ 83. 45, E0, 01
?_159:  mov     eax, dword [ebp-20H]                    ; 3359 _ 8B. 45, E0
        cmp     eax, dword [ebp-28H]                    ; 335C _ 3B. 45, D8
        jl      ?_157                                   ; 335F _ 7C, A0
        add     dword [ebp-1CH], 1                      ; 3361 _ 83. 45, E4, 01
?_160:  mov     eax, dword [ebp-1CH]                    ; 3365 _ 8B. 45, E4
        cmp     eax, dword [ebp-24H]                    ; 3368 _ 3B. 45, DC
        jl      ?_156                                   ; 336B _ 0F 8C, FFFFFF7A
        add     dword [ebp-34H], 1                      ; 3371 _ 83. 45, CC, 01
?_161:  mov     eax, dword [ebp+8H]                     ; 3375 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 3378 _ 8B. 40, 0C
        cmp     eax, dword [ebp-34H]                    ; 337B _ 3B. 45, CC
        jge     ?_151                                   ; 337E _ 0F 8D, FFFFFEB0
        leave                                           ; 3384 _ C9
        ret                                             ; 3385 _ C3
; sheet_refresh_map End of function

init_time_port:; Function begin
        push    ebp                                     ; 3386 _ 55
        mov     ebp, esp                                ; 3387 _ 89. E5
        sub     esp, 40                                 ; 3389 _ 83. EC, 28
        mov     dword [esp+4H], 52                      ; 338C _ C7. 44 24, 04, 00000034
        mov     dword [esp], 67                         ; 3394 _ C7. 04 24, 00000043
        call    io_out8                                 ; 339B _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 156                     ; 33A0 _ C7. 44 24, 04, 0000009C
        mov     dword [esp], 64                         ; 33A8 _ C7. 04 24, 00000040
        call    io_out8                                 ; 33AF _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 46                      ; 33B4 _ C7. 44 24, 04, 0000002E
        mov     dword [esp], 64                         ; 33BC _ C7. 04 24, 00000040
        call    io_out8                                 ; 33C3 _ E8, FFFFFFFC(rel)
        mov     dword [timer_control], 0                ; 33C8 _ C7. 05, 000003C0(d), 00000000
        mov     dword [ebp-0CH], 0                      ; 33D2 _ C7. 45, F4, 00000000
        jmp     ?_163                                   ; 33D9 _ EB, 28

?_162:  mov     eax, dword [ebp-0CH]                    ; 33DB _ 8B. 45, F4
        shl     eax, 4                                  ; 33DE _ C1. E0, 04
        add     eax, timer_control                      ; 33E1 _ 05, 000003C0(d)
        mov     dword [eax+8H], 0                       ; 33E6 _ C7. 40, 08, 00000000
        mov     eax, dword [ebp-0CH]                    ; 33ED _ 8B. 45, F4
        shl     eax, 4                                  ; 33F0 _ C1. E0, 04
        add     eax, timer_control                      ; 33F3 _ 05, 000003C0(d)
        mov     dword [eax+0CH], 0                      ; 33F8 _ C7. 40, 0C, 00000000
        add     dword [ebp-0CH], 1                      ; 33FF _ 83. 45, F4, 01
?_163:  cmp     dword [ebp-0CH], 499                    ; 3403 _ 81. 7D, F4, 000001F3
        jle     ?_162                                   ; 340A _ 7E, CF
        leave                                           ; 340C _ C9
        ret                                             ; 340D _ C3
; init_time_port End of function

get_timer_control:; Function begin
        push    ebp                                     ; 340E _ 55
        mov     ebp, esp                                ; 340F _ 89. E5
        mov     eax, timer_control                      ; 3411 _ B8, 000003C0(d)
        pop     ebp                                     ; 3416 _ 5D
        ret                                             ; 3417 _ C3
; get_timer_control End of function

timer_alloc:; Function begin
        push    ebp                                     ; 3418 _ 55
        mov     ebp, esp                                ; 3419 _ 89. E5
        sub     esp, 16                                 ; 341B _ 83. EC, 10
        mov     dword [ebp-4H], 0                       ; 341E _ C7. 45, FC, 00000000
        jmp     ?_166                                   ; 3425 _ EB, 26

?_164:  mov     eax, dword [ebp-4H]                     ; 3427 _ 8B. 45, FC
        shl     eax, 4                                  ; 342A _ C1. E0, 04
        add     eax, timer_control                      ; 342D _ 05, 000003C0(d)
        mov     eax, dword [eax+8H]                     ; 3432 _ 8B. 40, 08
        test    eax, eax                                ; 3435 _ 85. C0
        jnz     ?_165                                   ; 3437 _ 75, 10
        mov     eax, dword [ebp-4H]                     ; 3439 _ 8B. 45, FC
        shl     eax, 4                                  ; 343C _ C1. E0, 04
        add     eax, timer_control                      ; 343F _ 05, 000003C0(d)
        add     eax, 4                                  ; 3444 _ 83. C0, 04
        jmp     ?_167                                   ; 3447 _ EB, 0D

?_165:  add     dword [ebp-4H], 1                       ; 3449 _ 83. 45, FC, 01
?_166:  cmp     dword [ebp-4H], 499                     ; 344D _ 81. 7D, FC, 000001F3
        jle     ?_164                                   ; 3454 _ 7E, D1
?_167:  leave                                           ; 3456 _ C9
        ret                                             ; 3457 _ C3
; timer_alloc End of function

timer_free:; Function begin
        push    ebp                                     ; 3458 _ 55
        mov     ebp, esp                                ; 3459 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 345B _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 345E _ C7. 40, 04, 00000000
        pop     ebp                                     ; 3465 _ 5D
        ret                                             ; 3466 _ C3
; timer_free End of function

timer_init:; Function begin
        push    ebp                                     ; 3467 _ 55
        mov     ebp, esp                                ; 3468 _ 89. E5
        sub     esp, 4                                  ; 346A _ 83. EC, 04
        mov     eax, dword [ebp+10H]                    ; 346D _ 8B. 45, 10
        mov     byte [ebp-4H], al                       ; 3470 _ 88. 45, FC
        mov     eax, dword [ebp+8H]                     ; 3473 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 3476 _ 8B. 55, 0C
        mov     dword [eax+8H], edx                     ; 3479 _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 347C _ 8B. 45, 08
        movzx   edx, byte [ebp-4H]                      ; 347F _ 0F B6. 55, FC
        mov     byte [eax+0CH], dl                      ; 3483 _ 88. 50, 0C
        leave                                           ; 3486 _ C9
        ret                                             ; 3487 _ C3
; timer_init End of function

timer_settime:; Function begin
        push    ebp                                     ; 3488 _ 55
        mov     ebp, esp                                ; 3489 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 348B _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 348E _ 8B. 55, 0C
        mov     dword [eax], edx                        ; 3491 _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 3493 _ 8B. 45, 08
        mov     dword [eax+4H], 2                       ; 3496 _ C7. 40, 04, 00000002
        pop     ebp                                     ; 349D _ 5D
        ret                                             ; 349E _ C3
; timer_settime End of function

intHandlerTimer:; Function begin
        push    ebp                                     ; 349F _ 55
        mov     ebp, esp                                ; 34A0 _ 89. E5
        sub     esp, 40                                 ; 34A2 _ 83. EC, 28
        mov     dword [esp+4H], 32                      ; 34A5 _ C7. 44 24, 04, 00000020
        mov     dword [esp], 32                         ; 34AD _ C7. 04 24, 00000020
        call    io_out8                                 ; 34B4 _ E8, FFFFFFFC(rel)
        mov     eax, dword [timer_control]              ; 34B9 _ A1, 000003C0(d)
        add     eax, 1                                  ; 34BE _ 83. C0, 01
        mov     dword [timer_control], eax              ; 34C1 _ A3, 000003C0(d)
        mov     byte [ebp-0DH], 0                       ; 34C6 _ C6. 45, F3, 00
        mov     dword [ebp-0CH], 0                      ; 34CA _ C7. 45, F4, 00000000
        jmp     ?_171                                   ; 34D1 _ E9, 000000B0

?_168:  mov     eax, dword [ebp-0CH]                    ; 34D6 _ 8B. 45, F4
        shl     eax, 4                                  ; 34D9 _ C1. E0, 04
        add     eax, timer_control                      ; 34DC _ 05, 000003C0(d)
        mov     eax, dword [eax+8H]                     ; 34E1 _ 8B. 40, 08
        cmp     eax, 2                                  ; 34E4 _ 83. F8, 02
        jne     ?_169                                   ; 34E7 _ 0F 85, 0000008A
        mov     eax, dword [ebp-0CH]                    ; 34ED _ 8B. 45, F4
        shl     eax, 4                                  ; 34F0 _ C1. E0, 04
        add     eax, timer_control                      ; 34F3 _ 05, 000003C0(d)
        mov     eax, dword [eax+4H]                     ; 34F8 _ 8B. 40, 04
        lea     edx, [eax-1H]                           ; 34FB _ 8D. 50, FF
        mov     eax, dword [ebp-0CH]                    ; 34FE _ 8B. 45, F4
        shl     eax, 4                                  ; 3501 _ C1. E0, 04
        add     eax, timer_control                      ; 3504 _ 05, 000003C0(d)
        mov     dword [eax+4H], edx                     ; 3509 _ 89. 50, 04
        mov     eax, dword [ebp-0CH]                    ; 350C _ 8B. 45, F4
        shl     eax, 4                                  ; 350F _ C1. E0, 04
        add     eax, timer_control                      ; 3512 _ 05, 000003C0(d)
        mov     eax, dword [eax+4H]                     ; 3517 _ 8B. 40, 04
        test    eax, eax                                ; 351A _ 85. C0
        jnz     ?_169                                   ; 351C _ 75, 59
        mov     eax, dword [ebp-0CH]                    ; 351E _ 8B. 45, F4
        shl     eax, 4                                  ; 3521 _ C1. E0, 04
        add     eax, timer_control                      ; 3524 _ 05, 000003C0(d)
        mov     dword [eax+8H], 1                       ; 3529 _ C7. 40, 08, 00000001
        mov     eax, dword [ebp-0CH]                    ; 3530 _ 8B. 45, F4
        shl     eax, 4                                  ; 3533 _ C1. E0, 04
        add     eax, timer_control                      ; 3536 _ 05, 000003C0(d)
        movzx   eax, byte [eax+10H]                     ; 353B _ 0F B6. 40, 10
        movzx   edx, al                                 ; 353F _ 0F B6. D0
        mov     eax, dword [ebp-0CH]                    ; 3542 _ 8B. 45, F4
        shl     eax, 4                                  ; 3545 _ C1. E0, 04
        add     eax, timer_control                      ; 3548 _ 05, 000003C0(d)
        mov     eax, dword [eax+0CH]                    ; 354D _ 8B. 40, 0C
        mov     dword [esp+4H], edx                     ; 3550 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 3554 _ 89. 04 24
        call    fifo8_put                               ; 3557 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 355C _ 8B. 45, F4
        shl     eax, 4                                  ; 355F _ C1. E0, 04
        add     eax, timer_control                      ; 3562 _ 05, 000003C0(d)
        lea     edx, [eax+4H]                           ; 3567 _ 8D. 50, 04
        mov     eax, dword [task_timer]                 ; 356A _ A1, 00000000(d)
        cmp     edx, eax                                ; 356F _ 39. C2
        jnz     ?_169                                   ; 3571 _ 75, 04
        mov     byte [ebp-0DH], 1                       ; 3573 _ C6. 45, F3, 01
?_169:  cmp     byte [ebp-0DH], 0                       ; 3577 _ 80. 7D, F3, 00
        jz      ?_170                                   ; 357B _ 74, 05
        call    task_switch                             ; 357D _ E8, FFFFFFFC(rel)
?_170:  add     dword [ebp-0CH], 1                      ; 3582 _ 83. 45, F4, 01
?_171:  cmp     dword [ebp-0CH], 499                    ; 3586 _ 81. 7D, F4, 000001F3
        jle     ?_168                                   ; 358D _ 0F 8E, FFFFFF43
        leave                                           ; 3593 _ C9
        ret                                             ; 3594 _ C3
; intHandlerTimer End of function

segment_descriptor:; Function begin
        push    ebp                                     ; 3595 _ 55
        mov     ebp, esp                                ; 3596 _ 89. E5
        cmp     dword [ebp+0CH], 1048575                ; 3598 _ 81. 7D, 0C, 000FFFFF
        jbe     ?_172                                   ; 359F _ 76, 10
        or      dword [ebp+14H], 8000H                  ; 35A1 _ 81. 4D, 14, 00008000
        mov     eax, dword [ebp+0CH]                    ; 35A8 _ 8B. 45, 0C
        shr     eax, 12                                 ; 35AB _ C1. E8, 0C
        mov     dword [ebp+0CH], eax                    ; 35AE _ 89. 45, 0C
?_172:  mov     eax, dword [ebp+0CH]                    ; 35B1 _ 8B. 45, 0C
        mov     edx, eax                                ; 35B4 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 35B6 _ 8B. 45, 08
        mov     word [eax], dx                          ; 35B9 _ 66: 89. 10
        mov     eax, dword [ebp+10H]                    ; 35BC _ 8B. 45, 10
        mov     edx, eax                                ; 35BF _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 35C1 _ 8B. 45, 08
        mov     word [eax+2H], dx                       ; 35C4 _ 66: 89. 50, 02
        mov     eax, dword [ebp+10H]                    ; 35C8 _ 8B. 45, 10
        sar     eax, 16                                 ; 35CB _ C1. F8, 10
        mov     edx, eax                                ; 35CE _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 35D0 _ 8B. 45, 08
        mov     byte [eax+4H], dl                       ; 35D3 _ 88. 50, 04
        mov     eax, dword [ebp+14H]                    ; 35D6 _ 8B. 45, 14
        mov     edx, eax                                ; 35D9 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 35DB _ 8B. 45, 08
        mov     byte [eax+5H], dl                       ; 35DE _ 88. 50, 05
        mov     eax, dword [ebp+0CH]                    ; 35E1 _ 8B. 45, 0C
        shr     eax, 16                                 ; 35E4 _ C1. E8, 10
        and     eax, 0FH                                ; 35E7 _ 83. E0, 0F
        mov     edx, eax                                ; 35EA _ 89. C2
        mov     eax, dword [ebp+14H]                    ; 35EC _ 8B. 45, 14
        sar     eax, 8                                  ; 35EF _ C1. F8, 08
        and     eax, 0FFFFFFF0H                         ; 35F2 _ 83. E0, F0
        or      eax, edx                                ; 35F5 _ 09. D0
        mov     edx, eax                                ; 35F7 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 35F9 _ 8B. 45, 08
        mov     byte [eax+6H], dl                       ; 35FC _ 88. 50, 06
        mov     eax, dword [ebp+10H]                    ; 35FF _ 8B. 45, 10
        shr     eax, 24                                 ; 3602 _ C1. E8, 18
        mov     edx, eax                                ; 3605 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 3607 _ 8B. 45, 08
        mov     byte [eax+7H], dl                       ; 360A _ 88. 50, 07
        pop     ebp                                     ; 360D _ 5D
        ret                                             ; 360E _ C3
; segment_descriptor End of function

init_task_level:; Function begin
        push    ebp                                     ; 360F _ 55
        mov     ebp, esp                                ; 3610 _ 89. E5
        sub     esp, 16                                 ; 3612 _ 83. EC, 10
        mov     ecx, dword [task_control]               ; 3615 _ 8B. 0D, 00002308(d)
        mov     edx, dword [ebp+8H]                     ; 361B _ 8B. 55, 08
        mov     eax, edx                                ; 361E _ 89. D0
        shl     eax, 2                                  ; 3620 _ C1. E0, 02
        add     eax, edx                                ; 3623 _ 01. D0
        shl     eax, 2                                  ; 3625 _ C1. E0, 02
        add     eax, ecx                                ; 3628 _ 01. C8
        add     eax, 8                                  ; 362A _ 83. C0, 08
        mov     dword [eax], 0                          ; 362D _ C7. 00, 00000000
        mov     ecx, dword [task_control]               ; 3633 _ 8B. 0D, 00002308(d)
        mov     edx, dword [ebp+8H]                     ; 3639 _ 8B. 55, 08
        mov     eax, edx                                ; 363C _ 89. D0
        shl     eax, 2                                  ; 363E _ C1. E0, 02
        add     eax, edx                                ; 3641 _ 01. D0
        shl     eax, 2                                  ; 3643 _ C1. E0, 02
        add     eax, ecx                                ; 3646 _ 01. C8
        add     eax, 12                                 ; 3648 _ 83. C0, 0C
        mov     dword [eax], 0                          ; 364B _ C7. 00, 00000000
        mov     dword [ebp-4H], 0                       ; 3651 _ C7. 45, FC, 00000000
        jmp     ?_174                                   ; 3658 _ EB, 21

?_173:  mov     ecx, dword [task_control]               ; 365A _ 8B. 0D, 00002308(d)
        mov     edx, dword [ebp-4H]                     ; 3660 _ 8B. 55, FC
        mov     eax, edx                                ; 3663 _ 89. D0
        add     eax, eax                                ; 3665 _ 01. C0
        add     eax, edx                                ; 3667 _ 01. D0
        shl     eax, 3                                  ; 3669 _ C1. E0, 03
        add     eax, ecx                                ; 366C _ 01. C8
        add     eax, 16                                 ; 366E _ 83. C0, 10
        mov     dword [eax], 0                          ; 3671 _ C7. 00, 00000000
        add     dword [ebp-4H], 1                       ; 3677 _ 83. 45, FC, 01
?_174:  cmp     dword [ebp-4H], 2                       ; 367B _ 83. 7D, FC, 02
        jle     ?_173                                   ; 367F _ 7E, D9
        leave                                           ; 3681 _ C9
        ret                                             ; 3682 _ C3
; init_task_level End of function

task_init:; Function begin
        push    ebp                                     ; 3683 _ 55
        mov     ebp, esp                                ; 3684 _ 89. E5
        push    ebx                                     ; 3686 _ 53
        sub     esp, 36                                 ; 3687 _ 83. EC, 24
        call    get_addr_gdt                            ; 368A _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 368F _ 89. 45, F0
        mov     dword [esp+4H], 668                     ; 3692 _ C7. 44 24, 04, 0000029C
        mov     eax, dword [ebp+8H]                     ; 369A _ 8B. 45, 08
        mov     dword [esp], eax                        ; 369D _ 89. 04 24
        call    memman_alloc_4k                         ; 36A0 _ E8, FFFFFFFC(rel)
        mov     dword [task_control], eax               ; 36A5 _ A3, 00002308(d)
        mov     dword [ebp-14H], 0                      ; 36AA _ C7. 45, EC, 00000000
        jmp     ?_176                                   ; 36B1 _ E9, 00000094

?_175:  mov     ecx, dword [task_control]               ; 36B6 _ 8B. 0D, 00002308(d)
        mov     eax, dword [ebp-14H]                    ; 36BC _ 8B. 45, EC
        shl     eax, 3                                  ; 36BF _ C1. E0, 03
        mov     edx, eax                                ; 36C2 _ 89. C2
        shl     edx, 4                                  ; 36C4 _ C1. E2, 04
        sub     edx, eax                                ; 36C7 _ 29. C2
        lea     eax, [ecx+edx]                          ; 36C9 _ 8D. 04 11
        add     eax, 72                                 ; 36CC _ 83. C0, 48
        mov     dword [eax], 0                          ; 36CF _ C7. 00, 00000000
        mov     ebx, dword [task_control]               ; 36D5 _ 8B. 1D, 00002308(d)
        mov     eax, dword [ebp-14H]                    ; 36DB _ 8B. 45, EC
        add     eax, 8                                  ; 36DE _ 83. C0, 08
        lea     ecx, [eax*8]                            ; 36E1 _ 8D. 0C C5, 00000000
        mov     eax, dword [ebp-14H]                    ; 36E8 _ 8B. 45, EC
        shl     eax, 3                                  ; 36EB _ C1. E0, 03
        mov     edx, eax                                ; 36EE _ 89. C2
        shl     edx, 4                                  ; 36F0 _ C1. E2, 04
        sub     edx, eax                                ; 36F3 _ 29. C2
        lea     eax, [ebx+edx]                          ; 36F5 _ 8D. 04 13
        add     eax, 68                                 ; 36F8 _ 83. C0, 44
        mov     dword [eax], ecx                        ; 36FB _ 89. 08
        mov     ecx, dword [task_control]               ; 36FD _ 8B. 0D, 00002308(d)
        mov     eax, dword [ebp-14H]                    ; 3703 _ 8B. 45, EC
        shl     eax, 3                                  ; 3706 _ C1. E0, 03
        mov     edx, eax                                ; 3709 _ 89. C2
        shl     edx, 4                                  ; 370B _ C1. E2, 04
        sub     edx, eax                                ; 370E _ 29. C2
        lea     eax, [edx+50H]                          ; 3710 _ 8D. 42, 50
        add     eax, ecx                                ; 3713 _ 01. C8
        add     eax, 4                                  ; 3715 _ 83. C0, 04
        mov     edx, dword [ebp-14H]                    ; 3718 _ 8B. 55, EC
        add     edx, 8                                  ; 371B _ 83. C2, 08
        lea     ecx, [edx*8]                            ; 371E _ 8D. 0C D5, 00000000
        mov     edx, dword [ebp-10H]                    ; 3725 _ 8B. 55, F0
        add     edx, ecx                                ; 3728 _ 01. CA
        mov     dword [esp+0CH], 137                    ; 372A _ C7. 44 24, 0C, 00000089
        mov     dword [esp+8H], eax                     ; 3732 _ 89. 44 24, 08
        mov     dword [esp+4H], 103                     ; 3736 _ C7. 44 24, 04, 00000067
        mov     dword [esp], edx                        ; 373E _ 89. 14 24
        call    segment_descriptor                      ; 3741 _ E8, FFFFFFFC(rel)
        add     dword [ebp-14H], 1                      ; 3746 _ 83. 45, EC, 01
?_176:  cmp     dword [ebp-14H], 4                      ; 374A _ 83. 7D, EC, 04
        jle     ?_175                                   ; 374E _ 0F 8E, FFFFFF62
        mov     dword [ebp-14H], 0                      ; 3754 _ C7. 45, EC, 00000000
        jmp     ?_178                                   ; 375B _ EB, 0F

?_177:  mov     eax, dword [ebp-14H]                    ; 375D _ 8B. 45, EC
        mov     dword [esp], eax                        ; 3760 _ 89. 04 24
        call    init_task_level                         ; 3763 _ E8, FFFFFFFC(rel)
        add     dword [ebp-14H], 1                      ; 3768 _ 83. 45, EC, 01
?_178:  cmp     dword [ebp-14H], 2                      ; 376C _ 83. 7D, EC, 02
        jle     ?_177                                   ; 3770 _ 7E, EB
        call    task_alloc                              ; 3772 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 3777 _ 89. 45, F4
        mov     eax, dword [ebp-0CH]                    ; 377A _ 8B. 45, F4
        mov     dword [eax+4H], 2                       ; 377D _ C7. 40, 04, 00000002
        mov     eax, dword [ebp-0CH]                    ; 3784 _ 8B. 45, F4
        mov     dword [eax+8H], 100                     ; 3787 _ C7. 40, 08, 00000064
        mov     eax, dword [ebp-0CH]                    ; 378E _ 8B. 45, F4
        mov     dword [eax+0CH], 0                      ; 3791 _ C7. 40, 0C, 00000000
        mov     eax, dword [ebp-0CH]                    ; 3798 _ 8B. 45, F4
        mov     dword [esp], eax                        ; 379B _ 89. 04 24
        call    task_add                                ; 379E _ E8, FFFFFFFC(rel)
        call    task_switch_sub                         ; 37A3 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 37A8 _ 8B. 45, F4
        mov     eax, dword [eax]                        ; 37AB _ 8B. 00
        mov     dword [esp], eax                        ; 37AD _ 89. 04 24
        call    load_tr                                 ; 37B0 _ E8, FFFFFFFC(rel)
        call    timer_alloc                             ; 37B5 _ E8, FFFFFFFC(rel)
        mov     dword [task_timer], eax                 ; 37BA _ A3, 00002304(d)
        mov     eax, dword [ebp-0CH]                    ; 37BF _ 8B. 45, F4
        mov     eax, dword [eax+8H]                     ; 37C2 _ 8B. 40, 08
        mov     edx, eax                                ; 37C5 _ 89. C2
        mov     eax, dword [task_timer]                 ; 37C7 _ A1, 00002304(d)
        mov     dword [esp+4H], edx                     ; 37CC _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 37D0 _ 89. 04 24
        call    timer_settime                           ; 37D3 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 37D8 _ 8B. 45, F4
        add     esp, 36                                 ; 37DB _ 83. C4, 24
        pop     ebx                                     ; 37DE _ 5B
        pop     ebp                                     ; 37DF _ 5D
        ret                                             ; 37E0 _ C3
; task_init End of function

task_alloc:; Function begin
        push    ebp                                     ; 37E1 _ 55
        mov     ebp, esp                                ; 37E2 _ 89. E5
        sub     esp, 16                                 ; 37E4 _ 83. EC, 10
        mov     dword [ebp-8H], 0                       ; 37E7 _ C7. 45, F8, 00000000
        jmp     ?_181                                   ; 37EE _ E9, 000000F1

?_179:  mov     ecx, dword [task_control]               ; 37F3 _ 8B. 0D, 00002308(d)
        mov     eax, dword [ebp-8H]                     ; 37F9 _ 8B. 45, F8
        shl     eax, 3                                  ; 37FC _ C1. E0, 03
        mov     edx, eax                                ; 37FF _ 89. C2
        shl     edx, 4                                  ; 3801 _ C1. E2, 04
        sub     edx, eax                                ; 3804 _ 29. C2
        lea     eax, [ecx+edx]                          ; 3806 _ 8D. 04 11
        add     eax, 72                                 ; 3809 _ 83. C0, 48
        mov     eax, dword [eax]                        ; 380C _ 8B. 00
        test    eax, eax                                ; 380E _ 85. C0
        jne     ?_180                                   ; 3810 _ 0F 85, 000000CA
        mov     ecx, dword [task_control]               ; 3816 _ 8B. 0D, 00002308(d)
        mov     eax, dword [ebp-8H]                     ; 381C _ 8B. 45, F8
        shl     eax, 3                                  ; 381F _ C1. E0, 03
        mov     edx, eax                                ; 3822 _ 89. C2
        shl     edx, 4                                  ; 3824 _ C1. E2, 04
        sub     edx, eax                                ; 3827 _ 29. C2
        lea     eax, [edx+40H]                          ; 3829 _ 8D. 42, 40
        add     eax, ecx                                ; 382C _ 01. C8
        add     eax, 4                                  ; 382E _ 83. C0, 04
        mov     dword [ebp-4H], eax                     ; 3831 _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 3834 _ 8B. 45, FC
        mov     dword [eax+4H], 1                       ; 3837 _ C7. 40, 04, 00000001
        mov     eax, dword [ebp-4H]                     ; 383E _ 8B. 45, FC
        mov     dword [eax+34H], 514                    ; 3841 _ C7. 40, 34, 00000202
        mov     eax, dword [ebp-4H]                     ; 3848 _ 8B. 45, FC
        mov     dword [eax+38H], 0                      ; 384B _ C7. 40, 38, 00000000
        mov     eax, dword [ebp-4H]                     ; 3852 _ 8B. 45, FC
        mov     dword [eax+3CH], 0                      ; 3855 _ C7. 40, 3C, 00000000
        mov     eax, dword [ebp-4H]                     ; 385C _ 8B. 45, FC
        mov     dword [eax+40H], 0                      ; 385F _ C7. 40, 40, 00000000
        mov     eax, dword [ebp-4H]                     ; 3866 _ 8B. 45, FC
        mov     dword [eax+44H], 0                      ; 3869 _ C7. 40, 44, 00000000
        mov     eax, dword [ebp-8H]                     ; 3870 _ 8B. 45, F8
        add     eax, 1                                  ; 3873 _ 83. C0, 01
        shl     eax, 9                                  ; 3876 _ C1. E0, 09
        mov     edx, eax                                ; 3879 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 387B _ 8B. 45, FC
        mov     dword [eax+48H], edx                    ; 387E _ 89. 50, 48
        mov     eax, dword [ebp-4H]                     ; 3881 _ 8B. 45, FC
        mov     dword [eax+4CH], 0                      ; 3884 _ C7. 40, 4C, 00000000
        mov     eax, dword [ebp-4H]                     ; 388B _ 8B. 45, FC
        mov     dword [eax+50H], 0                      ; 388E _ C7. 40, 50, 00000000
        mov     eax, dword [ebp-4H]                     ; 3895 _ 8B. 45, FC
        mov     dword [eax+54H], 0                      ; 3898 _ C7. 40, 54, 00000000
        mov     eax, dword [ebp-4H]                     ; 389F _ 8B. 45, FC
        mov     dword [eax+58H], 0                      ; 38A2 _ C7. 40, 58, 00000000
        mov     eax, dword [ebp-4H]                     ; 38A9 _ 8B. 45, FC
        mov     dword [eax+64H], 0                      ; 38AC _ C7. 40, 64, 00000000
        mov     eax, dword [ebp-4H]                     ; 38B3 _ 8B. 45, FC
        mov     dword [eax+68H], 0                      ; 38B6 _ C7. 40, 68, 00000000
        mov     eax, dword [ebp-4H]                     ; 38BD _ 8B. 45, FC
        mov     dword [eax+6CH], 0                      ; 38C0 _ C7. 40, 6C, 00000000
        mov     eax, dword [ebp-4H]                     ; 38C7 _ 8B. 45, FC
        mov     dword [eax+70H], 0                      ; 38CA _ C7. 40, 70, 00000000
        mov     eax, dword [ebp-4H]                     ; 38D1 _ 8B. 45, FC
        mov     dword [eax+74H], 1073741824             ; 38D4 _ C7. 40, 74, 40000000
        mov     eax, dword [ebp-4H]                     ; 38DB _ 8B. 45, FC
        jmp     ?_182                                   ; 38DE _ EB, 13

?_180:  add     dword [ebp-8H], 1                       ; 38E0 _ 83. 45, F8, 01
?_181:  cmp     dword [ebp-8H], 4                       ; 38E4 _ 83. 7D, F8, 04
        jle     ?_179                                   ; 38E8 _ 0F 8E, FFFFFF05
        mov     eax, 0                                  ; 38EE _ B8, 00000000
?_182:  leave                                           ; 38F3 _ C9
        ret                                             ; 38F4 _ C3
; task_alloc End of function

task_run:; Function begin
        push    ebp                                     ; 38F5 _ 55
        mov     ebp, esp                                ; 38F6 _ 89. E5
        sub     esp, 24                                 ; 38F8 _ 83. EC, 18
        cmp     dword [ebp+0CH], 0                      ; 38FB _ 83. 7D, 0C, 00
        jns     ?_183                                   ; 38FF _ 79, 09
        mov     eax, dword [ebp+8H]                     ; 3901 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 3904 _ 8B. 40, 0C
        mov     dword [ebp+0CH], eax                    ; 3907 _ 89. 45, 0C
?_183:  cmp     dword [ebp+10H], 0                      ; 390A _ 83. 7D, 10, 00
        jle     ?_184                                   ; 390E _ 7E, 09
        mov     eax, dword [ebp+8H]                     ; 3910 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 3913 _ 8B. 55, 10
        mov     dword [eax+8H], edx                     ; 3916 _ 89. 50, 08
?_184:  mov     eax, dword [ebp+8H]                     ; 3919 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 391C _ 8B. 40, 04
        cmp     eax, 2                                  ; 391F _ 83. F8, 02
        jnz     ?_185                                   ; 3922 _ 75, 16
        mov     eax, dword [ebp+8H]                     ; 3924 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 3927 _ 8B. 40, 0C
        cmp     eax, dword [ebp+0CH]                    ; 392A _ 3B. 45, 0C
        jz      ?_185                                   ; 392D _ 74, 0B
        mov     eax, dword [ebp+8H]                     ; 392F _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3932 _ 89. 04 24
        call    task_remove                             ; 3935 _ E8, FFFFFFFC(rel)
?_185:  mov     eax, dword [ebp+8H]                     ; 393A _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 393D _ 8B. 40, 04
        cmp     eax, 2                                  ; 3940 _ 83. F8, 02
        jz      ?_186                                   ; 3943 _ 74, 14
        mov     eax, dword [ebp+8H]                     ; 3945 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 3948 _ 8B. 55, 0C
        mov     dword [eax+0CH], edx                    ; 394B _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 394E _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3951 _ 89. 04 24
        call    task_add                                ; 3954 _ E8, FFFFFFFC(rel)
?_186:  mov     eax, dword [task_control]               ; 3959 _ A1, 00002308(d)
        mov     dword [eax+4H], 1                       ; 395E _ C7. 40, 04, 00000001
        leave                                           ; 3965 _ C9
        ret                                             ; 3966 _ C3
; task_run End of function

task_switch:; Function begin
        push    ebp                                     ; 3967 _ 55
        mov     ebp, esp                                ; 3968 _ 89. E5
        sub     esp, 40                                 ; 396A _ 83. EC, 28
        mov     ecx, dword [task_control]               ; 396D _ 8B. 0D, 00002308(d)
        mov     eax, dword [task_control]               ; 3973 _ A1, 00002308(d)
        mov     edx, dword [eax]                        ; 3978 _ 8B. 10
        mov     eax, edx                                ; 397A _ 89. D0
        shl     eax, 2                                  ; 397C _ C1. E0, 02
        add     eax, edx                                ; 397F _ 01. D0
        shl     eax, 2                                  ; 3981 _ C1. E0, 02
        add     eax, ecx                                ; 3984 _ 01. C8
        add     eax, 8                                  ; 3986 _ 83. C0, 08
        mov     dword [ebp-14H], eax                    ; 3989 _ 89. 45, EC
        mov     eax, dword [ebp-14H]                    ; 398C _ 8B. 45, EC
        mov     edx, dword [eax+4H]                     ; 398F _ 8B. 50, 04
        mov     eax, dword [ebp-14H]                    ; 3992 _ 8B. 45, EC
        mov     eax, dword [eax+edx*4+8H]               ; 3995 _ 8B. 44 90, 08
        mov     dword [ebp-10H], eax                    ; 3999 _ 89. 45, F0
        mov     eax, dword [ebp-14H]                    ; 399C _ 8B. 45, EC
        mov     eax, dword [eax+4H]                     ; 399F _ 8B. 40, 04
        lea     edx, [eax+1H]                           ; 39A2 _ 8D. 50, 01
        mov     eax, dword [ebp-14H]                    ; 39A5 _ 8B. 45, EC
        mov     dword [eax+4H], edx                     ; 39A8 _ 89. 50, 04
        mov     eax, dword [ebp-14H]                    ; 39AB _ 8B. 45, EC
        mov     edx, dword [eax+4H]                     ; 39AE _ 8B. 50, 04
        mov     eax, dword [ebp-14H]                    ; 39B1 _ 8B. 45, EC
        mov     eax, dword [eax]                        ; 39B4 _ 8B. 00
        cmp     edx, eax                                ; 39B6 _ 39. C2
        jnz     ?_187                                   ; 39B8 _ 75, 0A
        mov     eax, dword [ebp-14H]                    ; 39BA _ 8B. 45, EC
        mov     dword [eax+4H], 0                       ; 39BD _ C7. 40, 04, 00000000
?_187:  mov     eax, dword [task_control]               ; 39C4 _ A1, 00002308(d)
        mov     eax, dword [eax+4H]                     ; 39C9 _ 8B. 40, 04
        test    eax, eax                                ; 39CC _ 85. C0
        jz      ?_188                                   ; 39CE _ 74, 24
        call    task_switch_sub                         ; 39D0 _ E8, FFFFFFFC(rel)
        mov     ecx, dword [task_control]               ; 39D5 _ 8B. 0D, 00002308(d)
        mov     eax, dword [task_control]               ; 39DB _ A1, 00002308(d)
        mov     edx, dword [eax]                        ; 39E0 _ 8B. 10
        mov     eax, edx                                ; 39E2 _ 89. D0
        shl     eax, 2                                  ; 39E4 _ C1. E0, 02
        add     eax, edx                                ; 39E7 _ 01. D0
        shl     eax, 2                                  ; 39E9 _ C1. E0, 02
        add     eax, ecx                                ; 39EC _ 01. C8
        add     eax, 8                                  ; 39EE _ 83. C0, 08
        mov     dword [ebp-14H], eax                    ; 39F1 _ 89. 45, EC
?_188:  mov     eax, dword [ebp-14H]                    ; 39F4 _ 8B. 45, EC
        mov     edx, dword [eax+4H]                     ; 39F7 _ 8B. 50, 04
        mov     eax, dword [ebp-14H]                    ; 39FA _ 8B. 45, EC
        mov     eax, dword [eax+edx*4+8H]               ; 39FD _ 8B. 44 90, 08
        mov     dword [ebp-0CH], eax                    ; 3A01 _ 89. 45, F4
        mov     eax, dword [ebp-0CH]                    ; 3A04 _ 8B. 45, F4
        mov     eax, dword [eax+8H]                     ; 3A07 _ 8B. 40, 08
        mov     edx, eax                                ; 3A0A _ 89. C2
        mov     eax, dword [task_timer]                 ; 3A0C _ A1, 00002304(d)
        mov     dword [esp+4H], edx                     ; 3A11 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 3A15 _ 89. 04 24
        call    timer_settime                           ; 3A18 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 3A1D _ 8B. 45, F4
        cmp     eax, dword [ebp-10H]                    ; 3A20 _ 3B. 45, F0
        jz      ?_189                                   ; 3A23 _ 74, 1B
        cmp     dword [ebp-0CH], 0                      ; 3A25 _ 83. 7D, F4, 00
        jz      ?_189                                   ; 3A29 _ 74, 15
        mov     eax, dword [ebp-0CH]                    ; 3A2B _ 8B. 45, F4
        mov     eax, dword [eax]                        ; 3A2E _ 8B. 00
        mov     dword [esp+4H], eax                     ; 3A30 _ 89. 44 24, 04
        mov     dword [esp], 0                          ; 3A34 _ C7. 04 24, 00000000
        call    farjmp                                  ; 3A3B _ E8, FFFFFFFC(rel)
?_189:  leave                                           ; 3A40 _ C9
        ret                                             ; 3A41 _ C3
; task_switch End of function

task_sleep:; Function begin
        push    ebp                                     ; 3A42 _ 55
        mov     ebp, esp                                ; 3A43 _ 89. E5
        sub     esp, 40                                 ; 3A45 _ 83. EC, 28
        mov     dword [ebp-0CH], 0                      ; 3A48 _ C7. 45, F4, 00000000
        mov     dword [ebp-10H], 0                      ; 3A4F _ C7. 45, F0, 00000000
        mov     eax, dword [ebp+8H]                     ; 3A56 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 3A59 _ 8B. 40, 04
        cmp     eax, 2                                  ; 3A5C _ 83. F8, 02
        jnz     ?_190                                   ; 3A5F _ 75, 51
        call    task_now                                ; 3A61 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 3A66 _ 89. 45, F4
        mov     eax, dword [ebp+8H]                     ; 3A69 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3A6C _ 89. 04 24
        call    task_remove                             ; 3A6F _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], 1                      ; 3A74 _ C7. 45, F0, 00000001
        mov     eax, dword [ebp+8H]                     ; 3A7B _ 8B. 45, 08
        cmp     eax, dword [ebp-0CH]                    ; 3A7E _ 3B. 45, F4
        jnz     ?_190                                   ; 3A81 _ 75, 2F
        call    task_switch_sub                         ; 3A83 _ E8, FFFFFFFC(rel)
        call    task_now                                ; 3A88 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 3A8D _ 89. 45, F4
        mov     dword [ebp-10H], 2                      ; 3A90 _ C7. 45, F0, 00000002
        cmp     dword [ebp-0CH], 0                      ; 3A97 _ 83. 7D, F4, 00
        jz      ?_190                                   ; 3A9B _ 74, 15
        mov     eax, dword [ebp-0CH]                    ; 3A9D _ 8B. 45, F4
        mov     eax, dword [eax]                        ; 3AA0 _ 8B. 00
        mov     dword [esp+4H], eax                     ; 3AA2 _ 89. 44 24, 04
        mov     dword [esp], 0                          ; 3AA6 _ C7. 04 24, 00000000
        call    farjmp                                  ; 3AAD _ E8, FFFFFFFC(rel)
?_190:  mov     eax, dword [ebp-10H]                    ; 3AB2 _ 8B. 45, F0
        leave                                           ; 3AB5 _ C9
        ret                                             ; 3AB6 _ C3
; task_sleep End of function

task_now:; Function begin
        push    ebp                                     ; 3AB7 _ 55
        mov     ebp, esp                                ; 3AB8 _ 89. E5
        sub     esp, 16                                 ; 3ABA _ 83. EC, 10
        mov     ecx, dword [task_control]               ; 3ABD _ 8B. 0D, 00002308(d)
        mov     eax, dword [task_control]               ; 3AC3 _ A1, 00002308(d)
        mov     edx, dword [eax]                        ; 3AC8 _ 8B. 10
        mov     eax, edx                                ; 3ACA _ 89. D0
        shl     eax, 2                                  ; 3ACC _ C1. E0, 02
        add     eax, edx                                ; 3ACF _ 01. D0
        shl     eax, 2                                  ; 3AD1 _ C1. E0, 02
        add     eax, ecx                                ; 3AD4 _ 01. C8
        add     eax, 8                                  ; 3AD6 _ 83. C0, 08
        mov     dword [ebp-4H], eax                     ; 3AD9 _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 3ADC _ 8B. 45, FC
        mov     edx, dword [eax+4H]                     ; 3ADF _ 8B. 50, 04
        mov     eax, dword [ebp-4H]                     ; 3AE2 _ 8B. 45, FC
        mov     eax, dword [eax+edx*4+8H]               ; 3AE5 _ 8B. 44 90, 08
        leave                                           ; 3AE9 _ C9
        ret                                             ; 3AEA _ C3
; task_now End of function

task_add:; Function begin
        push    ebp                                     ; 3AEB _ 55
        mov     ebp, esp                                ; 3AEC _ 89. E5
        sub     esp, 16                                 ; 3AEE _ 83. EC, 10
        mov     ecx, dword [task_control]               ; 3AF1 _ 8B. 0D, 00002308(d)
        mov     eax, dword [ebp+8H]                     ; 3AF7 _ 8B. 45, 08
        mov     edx, dword [eax+0CH]                    ; 3AFA _ 8B. 50, 0C
        mov     eax, edx                                ; 3AFD _ 89. D0
        shl     eax, 2                                  ; 3AFF _ C1. E0, 02
        add     eax, edx                                ; 3B02 _ 01. D0
        shl     eax, 2                                  ; 3B04 _ C1. E0, 02
        add     eax, ecx                                ; 3B07 _ 01. C8
        add     eax, 8                                  ; 3B09 _ 83. C0, 08
        mov     dword [ebp-4H], eax                     ; 3B0C _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 3B0F _ 8B. 45, FC
        mov     edx, dword [eax]                        ; 3B12 _ 8B. 10
        mov     eax, dword [ebp-4H]                     ; 3B14 _ 8B. 45, FC
        mov     ecx, dword [ebp+8H]                     ; 3B17 _ 8B. 4D, 08
        mov     dword [eax+edx*4+8H], ecx               ; 3B1A _ 89. 4C 90, 08
        mov     eax, dword [ebp-4H]                     ; 3B1E _ 8B. 45, FC
        mov     eax, dword [eax]                        ; 3B21 _ 8B. 00
        lea     edx, [eax+1H]                           ; 3B23 _ 8D. 50, 01
        mov     eax, dword [ebp-4H]                     ; 3B26 _ 8B. 45, FC
        mov     dword [eax], edx                        ; 3B29 _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 3B2B _ 8B. 45, 08
        mov     dword [eax+4H], 2                       ; 3B2E _ C7. 40, 04, 00000002
        leave                                           ; 3B35 _ C9
        ret                                             ; 3B36 _ C3
; task_add End of function

task_remove:; Function begin
        push    ebp                                     ; 3B37 _ 55
        mov     ebp, esp                                ; 3B38 _ 89. E5
        sub     esp, 16                                 ; 3B3A _ 83. EC, 10
        mov     ecx, dword [task_control]               ; 3B3D _ 8B. 0D, 00002308(d)
        mov     eax, dword [ebp+8H]                     ; 3B43 _ 8B. 45, 08
        mov     edx, dword [eax+0CH]                    ; 3B46 _ 8B. 50, 0C
        mov     eax, edx                                ; 3B49 _ 89. D0
        shl     eax, 2                                  ; 3B4B _ C1. E0, 02
        add     eax, edx                                ; 3B4E _ 01. D0
        shl     eax, 2                                  ; 3B50 _ C1. E0, 02
        add     eax, ecx                                ; 3B53 _ 01. C8
        add     eax, 8                                  ; 3B55 _ 83. C0, 08
        mov     dword [ebp-4H], eax                     ; 3B58 _ 89. 45, FC
        mov     dword [ebp-8H], 0                       ; 3B5B _ C7. 45, F8, 00000000
        jmp     ?_193                                   ; 3B62 _ EB, 23

?_191:  mov     eax, dword [ebp-4H]                     ; 3B64 _ 8B. 45, FC
        mov     edx, dword [ebp-8H]                     ; 3B67 _ 8B. 55, F8
        mov     eax, dword [eax+edx*4+8H]               ; 3B6A _ 8B. 44 90, 08
        cmp     eax, dword [ebp+8H]                     ; 3B6E _ 3B. 45, 08
        jnz     ?_192                                   ; 3B71 _ 75, 10
        mov     eax, dword [ebp-4H]                     ; 3B73 _ 8B. 45, FC
        mov     edx, dword [ebp-8H]                     ; 3B76 _ 8B. 55, F8
        mov     dword [eax+edx*4+8H], 0                 ; 3B79 _ C7. 44 90, 08, 00000000
        jmp     ?_194                                   ; 3B81 _ EB, 0E

?_192:  add     dword [ebp-8H], 1                       ; 3B83 _ 83. 45, F8, 01
?_193:  mov     eax, dword [ebp-4H]                     ; 3B87 _ 8B. 45, FC
        mov     eax, dword [eax]                        ; 3B8A _ 8B. 00
        cmp     eax, dword [ebp-8H]                     ; 3B8C _ 3B. 45, F8
        jg      ?_191                                   ; 3B8F _ 7F, D3
?_194:  mov     eax, dword [ebp-4H]                     ; 3B91 _ 8B. 45, FC
        mov     eax, dword [eax]                        ; 3B94 _ 8B. 00
        lea     edx, [eax-1H]                           ; 3B96 _ 8D. 50, FF
        mov     eax, dword [ebp-4H]                     ; 3B99 _ 8B. 45, FC
        mov     dword [eax], edx                        ; 3B9C _ 89. 10
        mov     eax, dword [ebp-4H]                     ; 3B9E _ 8B. 45, FC
        mov     eax, dword [eax+4H]                     ; 3BA1 _ 8B. 40, 04
        cmp     eax, dword [ebp-8H]                     ; 3BA4 _ 3B. 45, F8
        jle     ?_195                                   ; 3BA7 _ 7E, 0F
        mov     eax, dword [ebp-4H]                     ; 3BA9 _ 8B. 45, FC
        mov     eax, dword [eax+4H]                     ; 3BAC _ 8B. 40, 04
        lea     edx, [eax-1H]                           ; 3BAF _ 8D. 50, FF
        mov     eax, dword [ebp-4H]                     ; 3BB2 _ 8B. 45, FC
        mov     dword [eax+4H], edx                     ; 3BB5 _ 89. 50, 04
?_195:  mov     eax, dword [ebp-4H]                     ; 3BB8 _ 8B. 45, FC
        mov     edx, dword [eax+4H]                     ; 3BBB _ 8B. 50, 04
        mov     eax, dword [ebp-4H]                     ; 3BBE _ 8B. 45, FC
        mov     eax, dword [eax]                        ; 3BC1 _ 8B. 00
        cmp     edx, eax                                ; 3BC3 _ 39. C2
        jl      ?_196                                   ; 3BC5 _ 7C, 0A
        mov     eax, dword [ebp-4H]                     ; 3BC7 _ 8B. 45, FC
        mov     dword [eax+4H], 0                       ; 3BCA _ C7. 40, 04, 00000000
?_196:  mov     eax, dword [ebp+8H]                     ; 3BD1 _ 8B. 45, 08
        mov     dword [eax+4H], 1                       ; 3BD4 _ C7. 40, 04, 00000001
        jmp     ?_198                                   ; 3BDB _ EB, 1B

?_197:  mov     eax, dword [ebp-8H]                     ; 3BDD _ 8B. 45, F8
        lea     edx, [eax+1H]                           ; 3BE0 _ 8D. 50, 01
        mov     eax, dword [ebp-4H]                     ; 3BE3 _ 8B. 45, FC
        mov     ecx, dword [eax+edx*4+8H]               ; 3BE6 _ 8B. 4C 90, 08
        mov     eax, dword [ebp-4H]                     ; 3BEA _ 8B. 45, FC
        mov     edx, dword [ebp-8H]                     ; 3BED _ 8B. 55, F8
        mov     dword [eax+edx*4+8H], ecx               ; 3BF0 _ 89. 4C 90, 08
        add     dword [ebp-8H], 1                       ; 3BF4 _ 83. 45, F8, 01
?_198:  mov     eax, dword [ebp-4H]                     ; 3BF8 _ 8B. 45, FC
        mov     eax, dword [eax]                        ; 3BFB _ 8B. 00
        cmp     eax, dword [ebp-8H]                     ; 3BFD _ 3B. 45, F8
        jg      ?_197                                   ; 3C00 _ 7F, DB
        leave                                           ; 3C02 _ C9
        ret                                             ; 3C03 _ C3
; task_remove End of function

task_switch_sub:; Function begin
        push    ebp                                     ; 3C04 _ 55
        mov     ebp, esp                                ; 3C05 _ 89. E5
        sub     esp, 16                                 ; 3C07 _ 83. EC, 10
        mov     dword [ebp-4H], 0                       ; 3C0A _ C7. 45, FC, 00000000
        jmp     ?_201                                   ; 3C11 _ EB, 24

?_199:  mov     ecx, dword [task_control]               ; 3C13 _ 8B. 0D, 00002308(d)
        mov     edx, dword [ebp-4H]                     ; 3C19 _ 8B. 55, FC
        mov     eax, edx                                ; 3C1C _ 89. D0
        shl     eax, 2                                  ; 3C1E _ C1. E0, 02
        add     eax, edx                                ; 3C21 _ 01. D0
        shl     eax, 2                                  ; 3C23 _ C1. E0, 02
        add     eax, ecx                                ; 3C26 _ 01. C8
        add     eax, 8                                  ; 3C28 _ 83. C0, 08
        mov     eax, dword [eax]                        ; 3C2B _ 8B. 00
        test    eax, eax                                ; 3C2D _ 85. C0
        jle     ?_200                                   ; 3C2F _ 7E, 02
        jmp     ?_202                                   ; 3C31 _ EB, 0A

?_200:  add     dword [ebp-4H], 1                       ; 3C33 _ 83. 45, FC, 01
?_201:  cmp     dword [ebp-4H], 2                       ; 3C37 _ 83. 7D, FC, 02
        jle     ?_199                                   ; 3C3B _ 7E, D6
?_202:  mov     eax, dword [task_control]               ; 3C3D _ A1, 00002308(d)
        mov     edx, dword [ebp-4H]                     ; 3C42 _ 8B. 55, FC
        mov     dword [eax], edx                        ; 3C45 _ 89. 10
        mov     eax, dword [task_control]               ; 3C47 _ A1, 00002308(d)
        mov     dword [eax+4H], 0                       ; 3C4C _ C7. 40, 04, 00000000
        leave                                           ; 3C53 _ C9
        ret                                             ; 3C54 _ C3
; task_switch_sub End of function



?_203:                                                  ; byte
        db 77H, 69H, 6EH, 64H, 6FH, 77H, 00H            ; 0000 _ window.

?_204:                                                  ; byte
        db 41H, 00H                                     ; 0007 _ A.

?_205:                                                  ; byte
        db 65H, 6EH, 74H, 65H, 72H, 20H, 74H, 61H       ; 0009 _ enter ta
        db 73H, 6BH, 20H, 62H, 00H                      ; 0011 _ sk b.

?_206:                                                  ; byte
        db 42H, 00H                                     ; 0016 _ B.

?_207:                                                  ; byte
        db 70H, 61H, 67H, 65H, 20H, 69H, 73H, 3AH       ; 0018 _ page is:
        db 20H, 00H                                     ; 0020 _  .

?_208:                                                  ; byte
        db 42H, 61H, 73H, 65H, 41H, 64H, 64H, 72H       ; 0022 _ BaseAddr
        db 4CH, 3AH, 20H, 00H                           ; 002A _ L: .

?_209:                                                  ; byte
        db 42H, 61H, 73H, 65H, 41H, 64H, 64H, 72H       ; 002E _ BaseAddr
        db 48H, 3AH, 20H, 00H                           ; 0036 _ H: .

?_210:                                                  ; byte
        db 6CH, 65H, 6EH, 67H, 74H, 68H, 4CH, 6FH       ; 003A _ lengthLo
        db 77H, 3AH, 20H, 00H                           ; 0042 _ w: .

?_211:                                                  ; byte
        db 6CH, 65H, 6EH, 67H, 74H, 68H, 48H, 69H       ; 0046 _ lengthHi
        db 67H, 68H, 3AH, 20H, 00H                      ; 004E _ gh: .

?_212:                                                  ; byte
        db 74H, 79H, 70H, 65H, 3AH, 20H, 00H            ; 0053 _ type: .

?_213:                                                  ; byte
        db 63H, 6FH, 6EH, 73H, 6FH, 6CH, 65H, 00H       ; 005A _ console.



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

table_rgb.1731:                                         ; byte
        db 00H, 00H, 00H, 0FFH, 00H, 00H, 44H, 8CH      ; 0080 _ ......D.
        db 0BBH, 0FFH, 0FFH, 00H, 00H, 00H, 0FFH, 0FFH  ; 0088 _ ........
        db 00H, 0FFH, 00H, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH ; 0090 _ ........
        db 0C6H, 0C6H, 0C6H, 84H, 00H, 00H, 00H, 84H    ; 0098 _ ........
        db 00H, 84H, 84H, 00H, 00H, 00H, 84H, 84H       ; 00A0 _ ........
        db 00H, 84H, 00H, 84H, 84H, 84H, 84H, 84H       ; 00A8 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 00B0 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 00B8 _ ........

cursor.1799:                                            ; byte
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

closebtn.1877:                                          ; byte
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

?_214:  db 00H                                          ; 02A2 _ .

?_215:  db 00H, 00H                                     ; 02A3 _ ..



sheet_control:                                          ; dword
        resd    1                                       ; 0000

back_sheet:                                             ; dword
        resd    1                                       ; 0004

mouse_sheet:                                            ; dword
        resd    1                                       ; 0008

timerinfo1.1733:                                        ; byte
        resb    28                                      ; 000C

timerbuf1.1736:                                         ; qword
        resq    1                                       ; 0028

timerinfo2.1734:                                        ; byte
        resb    28                                      ; 0030

timerbuf2.1737:                                         ; qword
        resq    1                                       ; 004C

timerinfo3.1735:                                        ; byte
        resb    28                                      ; 0054

timerbuf3.1738:                                         ; qword
        resq    1                                       ; 0070

task_a.1746:                                            ; dword
        resd    2                                       ; 0078

tss_b.1745:                                             ; byte
        resb    128                                     ; 0080

tss_a.1744:                                             ; byte
        resb    128                                     ; 0100

screen_info:                                            ; qword
        resb    4                                       ; 0180

?_216:  resw    1                                       ; 0184

?_217:  resw    13                                      ; 0186

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

?_218:  resb    9                                       ; 03A1

?_219:  resb    22                                      ; 03AA

timer_control:                                          ; byte
        resd    2001                                    ; 03C0

task_timer:                                             ; dword
        resd    1                                       ; 2304

task_control:                                           ; dword
        resd    1                                       ; 2308


