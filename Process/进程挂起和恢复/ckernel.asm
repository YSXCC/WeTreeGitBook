; Disassembly of file: ckernel.o
; Fri Feb 21 14:27:11 2020
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
        mov     dword [ebp-40H], eax                    ; 0018 _ 89. 45, C0
        movzx   eax, word [screen_info+4H]              ; 001B _ 0F B7. 05, 00000004(d)
        cwde                                            ; 0022 _ 98
        mov     dword [ebp-3CH], eax                    ; 0023 _ 89. 45, C4
        movzx   eax, word [screen_info+6H]              ; 0026 _ 0F B7. 05, 00000006(d)
        cwde                                            ; 002D _ 98
        mov     dword [ebp-38H], eax                    ; 002E _ 89. 45, C8
        mov     eax, dword [memman]                     ; 0031 _ A1, 00000000(d)
        mov     dword [esp], eax                        ; 0036 _ 89. 04 24
        call    memman_init                             ; 0039 _ E8, FFFFFFFC(rel)
        mov     eax, dword [memman]                     ; 003E _ A1, 00000000(d)
        mov     dword [esp+8H], 1072594944              ; 0043 _ C7. 44 24, 08, 3FEE8000
        mov     dword [esp+4H], 17301504                ; 004B _ C7. 44 24, 04, 01080000
        mov     dword [esp], eax                        ; 0053 _ 89. 04 24
        call    memman_free                             ; 0056 _ E8, FFFFFFFC(rel)
        mov     eax, dword [memman]                     ; 005B _ A1, 00000000(d)
        mov     edx, dword [ebp-38H]                    ; 0060 _ 8B. 55, C8
        mov     dword [esp+0CH], edx                    ; 0063 _ 89. 54 24, 0C
        mov     edx, dword [ebp-3CH]                    ; 0067 _ 8B. 55, C4
        mov     dword [esp+8H], edx                     ; 006A _ 89. 54 24, 08
        mov     edx, dword [ebp-40H]                    ; 006E _ 8B. 55, C0
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
        mov     eax, dword [ebp-3CH]                    ; 00A6 _ 8B. 45, C4
        imul    eax, dword [ebp-38H]                    ; 00A9 _ 0F AF. 45, C8
        mov     edx, eax                                ; 00AD _ 89. C2
        mov     eax, dword [memman]                     ; 00AF _ A1, 00000000(d)
        mov     dword [esp+4H], edx                     ; 00B4 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 00B8 _ 89. 04 24
        call    memman_alloc_4k                         ; 00BB _ E8, FFFFFFFC(rel)
        mov     dword [back_buf], eax                   ; 00C0 _ A3, 00000000(d)
        mov     edx, dword [back_buf]                   ; 00C5 _ 8B. 15, 00000000(d)
        mov     eax, dword [back_sheet]                 ; 00CB _ A1, 00000004(d)
        mov     dword [esp+10H], 99                     ; 00D0 _ C7. 44 24, 10, 00000063
        mov     ecx, dword [ebp-38H]                    ; 00D8 _ 8B. 4D, C8
        mov     dword [esp+0CH], ecx                    ; 00DB _ 89. 4C 24, 0C
        mov     ecx, dword [ebp-3CH]                    ; 00DF _ 8B. 4D, C4
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
        mov     dword [ebp-34H], eax                    ; 0138 _ 89. 45, CC
        call    init_time_port                          ; 013B _ E8, FFFFFFFC(rel)
        mov     dword [esp+0CH], 0                      ; 0140 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], timerbuf1.1716          ; 0148 _ C7. 44 24, 08, 00000028(d)
        mov     dword [esp+4H], 8                       ; 0150 _ C7. 44 24, 04, 00000008
        mov     dword [esp], timerinfo1.1713            ; 0158 _ C7. 04 24, 0000000C(d)
        call    fifo8_init                              ; 015F _ E8, FFFFFFFC(rel)
        call    timer_alloc                             ; 0164 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-30H], eax                    ; 0169 _ 89. 45, D0
        mov     dword [esp+8H], 1                       ; 016C _ C7. 44 24, 08, 00000001
        mov     dword [esp+4H], timerinfo1.1713         ; 0174 _ C7. 44 24, 04, 0000000C(d)
        mov     eax, dword [ebp-30H]                    ; 017C _ 8B. 45, D0
        mov     dword [esp], eax                        ; 017F _ 89. 04 24
        call    timer_init                              ; 0182 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 100                     ; 0187 _ C7. 44 24, 04, 00000064
        mov     eax, dword [ebp-30H]                    ; 018F _ 8B. 45, D0
        mov     dword [esp], eax                        ; 0192 _ 89. 04 24
        call    timer_settime                           ; 0195 _ E8, FFFFFFFC(rel)
        mov     dword [esp+0CH], 0                      ; 019A _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], timerbuf2.1717          ; 01A2 _ C7. 44 24, 08, 0000004C(d)
        mov     dword [esp+4H], 8                       ; 01AA _ C7. 44 24, 04, 00000008
        mov     dword [esp], timerinfo2.1714            ; 01B2 _ C7. 04 24, 00000030(d)
        call    fifo8_init                              ; 01B9 _ E8, FFFFFFFC(rel)
        call    timer_alloc                             ; 01BE _ E8, FFFFFFFC(rel)
        mov     dword [ebp-2CH], eax                    ; 01C3 _ 89. 45, D4
        mov     dword [esp+8H], 1                       ; 01C6 _ C7. 44 24, 08, 00000001
        mov     dword [esp+4H], timerinfo2.1714         ; 01CE _ C7. 44 24, 04, 00000030(d)
        mov     eax, dword [ebp-2CH]                    ; 01D6 _ 8B. 45, D4
        mov     dword [esp], eax                        ; 01D9 _ 89. 04 24
        call    timer_init                              ; 01DC _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 300                     ; 01E1 _ C7. 44 24, 04, 0000012C
        mov     eax, dword [ebp-2CH]                    ; 01E9 _ 8B. 45, D4
        mov     dword [esp], eax                        ; 01EC _ 89. 04 24
        call    timer_settime                           ; 01EF _ E8, FFFFFFFC(rel)
        mov     dword [esp+0CH], 0                      ; 01F4 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], timerbuf3.1718          ; 01FC _ C7. 44 24, 08, 00000070(d)
        mov     dword [esp+4H], 8                       ; 0204 _ C7. 44 24, 04, 00000008
        mov     dword [esp], timerinfo3.1715            ; 020C _ C7. 04 24, 00000054(d)
        call    fifo8_init                              ; 0213 _ E8, FFFFFFFC(rel)
        call    timer_alloc                             ; 0218 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-28H], eax                    ; 021D _ 89. 45, D8
        mov     dword [esp+8H], 1                       ; 0220 _ C7. 44 24, 08, 00000001
        mov     dword [esp+4H], timerinfo3.1715         ; 0228 _ C7. 44 24, 04, 00000054(d)
        mov     eax, dword [ebp-28H]                    ; 0230 _ 8B. 45, D8
        mov     dword [esp], eax                        ; 0233 _ 89. 04 24
        call    timer_init                              ; 0236 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 50                      ; 023B _ C7. 44 24, 04, 00000032
        mov     eax, dword [ebp-28H]                    ; 0243 _ 8B. 45, D8
        mov     dword [esp], eax                        ; 0246 _ 89. 04 24
        call    timer_settime                           ; 0249 _ E8, FFFFFFFC(rel)
        call    io_sti                                  ; 024E _ E8, FFFFFFFC(rel)
        mov     eax, dword [back_buf]                   ; 0253 _ A1, 00000000(d)
        mov     edx, dword [ebp-38H]                    ; 0258 _ 8B. 55, C8
        mov     dword [esp+8H], edx                     ; 025B _ 89. 54 24, 08
        mov     edx, dword [ebp-3CH]                    ; 025F _ 8B. 55, C4
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
        mov     dword [esp+4H], ?_186                   ; 02D9 _ C7. 44 24, 04, 00000000(d)
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
        mov     dword [ebp-24H], eax                    ; 0336 _ 89. 45, DC
        call    get_addr_gdt                            ; 0339 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-20H], eax                    ; 033E _ 89. 45, E0
        mov     eax, dword [memman]                     ; 0341 _ A1, 00000000(d)
        mov     dword [esp+4H], 103                     ; 0346 _ C7. 44 24, 04, 00000067
        mov     dword [esp], eax                        ; 034E _ 89. 04 24
        call    memman_alloc_4k                         ; 0351 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-1CH], eax                    ; 0356 _ 89. 45, E4
        mov     eax, dword [memman]                     ; 0359 _ A1, 00000000(d)
        mov     dword [esp], eax                        ; 035E _ 89. 04 24
        call    task_init                               ; 0361 _ E8, FFFFFFFC(rel)
        mov     dword [task_a.1723], eax                ; 0366 _ A3, 00000078(d)
        call    task_alloc                              ; 036B _ E8, FFFFFFFC(rel)
        mov     dword [task_b.1724], eax                ; 0370 _ A3, 0000007C(d)
        mov     eax, dword [task_b.1724]                ; 0375 _ A1, 0000007C(d)
        mov     dword [eax+68H], 0                      ; 037A _ C7. 40, 68, 00000000
        mov     eax, dword [task_b.1724]                ; 0381 _ A1, 0000007C(d)
        mov     dword [eax+6CH], 1073741824             ; 0386 _ C7. 40, 6C, 40000000
        mov     eax, dword [task_b.1724]                ; 038D _ A1, 0000007C(d)
        mov     edx, task_b_main                        ; 0392 _ BA, 00000000(d)
        sub     edx, dword [ebp-24H]                    ; 0397 _ 2B. 55, DC
        mov     dword [eax+28H], edx                    ; 039A _ 89. 50, 28
        mov     eax, dword [task_b.1724]                ; 039D _ A1, 0000007C(d)
        mov     dword [eax+50H], 0                      ; 03A2 _ C7. 40, 50, 00000000
        mov     eax, dword [task_b.1724]                ; 03A9 _ A1, 0000007C(d)
        mov     dword [eax+54H], 8                      ; 03AE _ C7. 40, 54, 00000008
        mov     eax, dword [task_b.1724]                ; 03B5 _ A1, 0000007C(d)
        mov     dword [eax+58H], 48                     ; 03BA _ C7. 40, 58, 00000030
        mov     eax, dword [task_b.1724]                ; 03C1 _ A1, 0000007C(d)
        mov     dword [eax+5CH], 32                     ; 03C6 _ C7. 40, 5C, 00000020
        mov     eax, dword [task_b.1724]                ; 03CD _ A1, 0000007C(d)
        mov     dword [eax+60H], 0                      ; 03D2 _ C7. 40, 60, 00000000
        mov     eax, dword [task_b.1724]                ; 03D9 _ A1, 0000007C(d)
        mov     dword [eax+64H], 16                     ; 03DE _ C7. 40, 64, 00000010
        mov     eax, dword [task_b.1724]                ; 03E5 _ A1, 0000007C(d)
        mov     dword [esp], eax                        ; 03EA _ 89. 04 24
        call    task_run                                ; 03ED _ E8, FFFFFFFC(rel)
        mov     dword [ebp-18H], 0                      ; 03F2 _ C7. 45, E8, 00000000
        mov     dword [ebp-14H], 0                      ; 03F9 _ C7. 45, EC, 00000000
        mov     dword [ebp-10H], 0                      ; 0400 _ C7. 45, F0, 00000000
        mov     dword [ebp-50H], 8                      ; 0407 _ C7. 45, B0, 00000008
        mov     dword [ebp-4CH], 7                      ; 040E _ C7. 45, B4, 00000007
        mov     dword [ebp-48H], 0                      ; 0415 _ C7. 45, B8, 00000000
        mov     eax, dword [task_a.1723]                ; 041C _ A1, 00000078(d)
        mov     dword [keyinfo+18H], eax                ; 0421 _ A3, 00000018(d)
        mov     dword [ebp-44H], 0                      ; 0426 _ C7. 45, BC, 00000000
?_001:  call    io_cli                                  ; 042D _ E8, FFFFFFFC(rel)
        mov     dword [esp], keyinfo                    ; 0432 _ C7. 04 24, 00000000(d)
        call    fifo8_status                            ; 0439 _ E8, FFFFFFFC(rel)
        mov     ebx, eax                                ; 043E _ 89. C3
        mov     dword [esp], mouseinfo                  ; 0440 _ C7. 04 24, 00000000(d)
        call    fifo8_status                            ; 0447 _ E8, FFFFFFFC(rel)
        add     ebx, eax                                ; 044C _ 01. C3
        mov     dword [esp], timerinfo1.1713            ; 044E _ C7. 04 24, 0000000C(d)
        call    fifo8_status                            ; 0455 _ E8, FFFFFFFC(rel)
        add     ebx, eax                                ; 045A _ 01. C3
        mov     dword [esp], timerinfo2.1714            ; 045C _ C7. 04 24, 00000030(d)
        call    fifo8_status                            ; 0463 _ E8, FFFFFFFC(rel)
        add     ebx, eax                                ; 0468 _ 01. C3
        mov     dword [esp], timerinfo3.1715            ; 046A _ C7. 04 24, 00000054(d)
        call    fifo8_status                            ; 0471 _ E8, FFFFFFFC(rel)
        add     eax, ebx                                ; 0476 _ 01. D8
        test    eax, eax                                ; 0478 _ 85. C0
        jnz     ?_002                                   ; 047A _ 75, 0A
        call    io_sti                                  ; 047C _ E8, FFFFFFFC(rel)
        jmp     ?_010                                   ; 0481 _ E9, 000003B9

?_002:  mov     dword [esp], keyinfo                    ; 0486 _ C7. 04 24, 00000000(d)
        call    fifo8_status                            ; 048D _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 0492 _ 85. C0
        je      ?_004                                   ; 0494 _ 0F 84, 0000019D
        call    io_sti                                  ; 049A _ E8, FFFFFFFC(rel)
        mov     dword [esp], keyinfo                    ; 049F _ C7. 04 24, 00000000(d)
        call    fifo8_get                               ; 04A6 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-18H], eax                    ; 04AB _ 89. 45, E8
        cmp     dword [ebp-18H], 128                    ; 04AE _ 81. 7D, E8, 00000080
        jle     ?_003                                   ; 04B5 _ 7E, 05
        jmp     ?_010                                   ; 04B7 _ E9, 00000383

?_003:  cmp     dword [ebp-18H], 28                     ; 04BC _ 83. 7D, E8, 1C
        je      ?_010                                   ; 04C0 _ 0F 84, 00000379
        mov     eax, dword [ebp-18H]                    ; 04C6 _ 8B. 45, E8
        add     eax, keytable                           ; 04C9 _ 05, 00000000(d)
        movzx   eax, byte [eax]                         ; 04CE _ 0F B6. 00
        test    al, al                                  ; 04D1 _ 84. C0
        je      ?_010                                   ; 04D3 _ 0F 84, 00000366
        cmp     dword [ebp-50H], 143                    ; 04D9 _ 81. 7D, B0, 0000008F
        jg      ?_010                                   ; 04E0 _ 0F 8F, 00000359
        mov     eax, dword [ebp-50H]                    ; 04E6 _ 8B. 45, B0
        lea     ecx, [eax+7H]                           ; 04E9 _ 8D. 48, 07
        mov     eax, dword [sheet_win]                  ; 04EC _ A1, 00000000(d)
        mov     edx, dword [eax+4H]                     ; 04F1 _ 8B. 50, 04
        mov     eax, dword [sheet_win]                  ; 04F4 _ A1, 00000000(d)
        mov     eax, dword [eax]                        ; 04F9 _ 8B. 00
        mov     dword [esp+18H], 43                     ; 04FB _ C7. 44 24, 18, 0000002B
        mov     dword [esp+14H], ecx                    ; 0503 _ 89. 4C 24, 14
        mov     dword [esp+10H], 28                     ; 0507 _ C7. 44 24, 10, 0000001C
        mov     ecx, dword [ebp-50H]                    ; 050F _ 8B. 4D, B0
        mov     dword [esp+0CH], ecx                    ; 0512 _ 89. 4C 24, 0C
        mov     dword [esp+8H], 7                       ; 0516 _ C7. 44 24, 08, 00000007
        mov     dword [esp+4H], edx                     ; 051E _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0522 _ 89. 04 24
        call    paint_rectangle                         ; 0525 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-50H]                    ; 052A _ 8B. 45, B0
        lea     ecx, [eax+8H]                           ; 052D _ 8D. 48, 08
        mov     edx, dword [sheet_win]                  ; 0530 _ 8B. 15, 00000000(d)
        mov     eax, dword [sheet_control]              ; 0536 _ A1, 00000000(d)
        mov     dword [esp+14H], 44                     ; 053B _ C7. 44 24, 14, 0000002C
        mov     dword [esp+10H], ecx                    ; 0543 _ 89. 4C 24, 10
        mov     dword [esp+0CH], 28                     ; 0547 _ C7. 44 24, 0C, 0000001C
        mov     ecx, dword [ebp-50H]                    ; 054F _ 8B. 4D, B0
        mov     dword [esp+8H], ecx                     ; 0552 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 0556 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 055A _ 89. 04 24
        call    sheet_refresh                           ; 055D _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-18H]                    ; 0562 _ 8B. 45, E8
        add     eax, keytable                           ; 0565 _ 05, 00000000(d)
        movzx   eax, byte [eax]                         ; 056A _ 0F B6. 00
        mov     byte [ebp-52H], al                      ; 056D _ 88. 45, AE
        mov     byte [ebp-51H], 0                       ; 0570 _ C6. 45, AF, 00
        mov     edx, dword [sheet_win]                  ; 0574 _ 8B. 15, 00000000(d)
        mov     eax, dword [sheet_control]              ; 057A _ A1, 00000000(d)
        mov     dword [esp+14H], 0                      ; 057F _ C7. 44 24, 14, 00000000
        lea     ecx, [ebp-52H]                          ; 0587 _ 8D. 4D, AE
        mov     dword [esp+10H], ecx                    ; 058A _ 89. 4C 24, 10
        mov     dword [esp+0CH], 28                     ; 058E _ C7. 44 24, 0C, 0000001C
        mov     ecx, dword [ebp-50H]                    ; 0596 _ 8B. 4D, B0
        mov     dword [esp+8H], ecx                     ; 0599 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 059D _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 05A1 _ 89. 04 24
        call    paint_string                            ; 05A4 _ E8, FFFFFFFC(rel)
        add     dword [ebp-50H], 8                      ; 05A9 _ 83. 45, B0, 08
        mov     dword [ebp-44H], 1                      ; 05AD _ C7. 45, BC, 00000001
        mov     eax, dword [ebp-50H]                    ; 05B4 _ 8B. 45, B0
        lea     ebx, [eax+7H]                           ; 05B7 _ 8D. 58, 07
        mov     eax, dword [ebp-4CH]                    ; 05BA _ 8B. 45, B4
        movzx   ecx, al                                 ; 05BD _ 0F B6. C8
        mov     eax, dword [sheet_win]                  ; 05C0 _ A1, 00000000(d)
        mov     edx, dword [eax+4H]                     ; 05C5 _ 8B. 50, 04
        mov     eax, dword [sheet_win]                  ; 05C8 _ A1, 00000000(d)
        mov     eax, dword [eax]                        ; 05CD _ 8B. 00
        mov     dword [esp+18H], 43                     ; 05CF _ C7. 44 24, 18, 0000002B
        mov     dword [esp+14H], ebx                    ; 05D7 _ 89. 5C 24, 14
        mov     dword [esp+10H], 28                     ; 05DB _ C7. 44 24, 10, 0000001C
        mov     ebx, dword [ebp-50H]                    ; 05E3 _ 8B. 5D, B0
        mov     dword [esp+0CH], ebx                    ; 05E6 _ 89. 5C 24, 0C
        mov     dword [esp+8H], ecx                     ; 05EA _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 05EE _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 05F2 _ 89. 04 24
        call    paint_rectangle                         ; 05F5 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-50H]                    ; 05FA _ 8B. 45, B0
        lea     ecx, [eax+8H]                           ; 05FD _ 8D. 48, 08
        mov     edx, dword [sheet_win]                  ; 0600 _ 8B. 15, 00000000(d)
        mov     eax, dword [sheet_control]              ; 0606 _ A1, 00000000(d)
        mov     dword [esp+14H], 44                     ; 060B _ C7. 44 24, 14, 0000002C
        mov     dword [esp+10H], ecx                    ; 0613 _ 89. 4C 24, 10
        mov     dword [esp+0CH], 28                     ; 0617 _ C7. 44 24, 0C, 0000001C
        mov     ecx, dword [ebp-50H]                    ; 061F _ 8B. 4D, B0
        mov     dword [esp+8H], ecx                     ; 0622 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 0626 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 062A _ 89. 04 24
        call    sheet_refresh                           ; 062D _ E8, FFFFFFFC(rel)
        jmp     ?_001                                   ; 0632 _ E9, FFFFFDF6

?_004:  mov     dword [esp], mouseinfo                  ; 0637 _ C7. 04 24, 00000000(d)
        call    fifo8_status                            ; 063E _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 0643 _ 85. C0
        jz      ?_005                                   ; 0645 _ 74, 26
        mov     ecx, dword [mouse_sheet]                ; 0647 _ 8B. 0D, 00000008(d)
        mov     edx, dword [back_sheet]                 ; 064D _ 8B. 15, 00000004(d)
        mov     eax, dword [sheet_control]              ; 0653 _ A1, 00000000(d)
        mov     dword [esp+8H], ecx                     ; 0658 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 065C _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0660 _ 89. 04 24
        call    show_mouse_info                         ; 0663 _ E8, FFFFFFFC(rel)
        jmp     ?_010                                   ; 0668 _ E9, 000001D2

?_005:  mov     dword [esp], timerinfo1.1713            ; 066D _ C7. 04 24, 0000000C(d)
        call    fifo8_status                            ; 0674 _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 0679 _ 85. C0
        je      ?_006                                   ; 067B _ 0F 84, 0000008E
        call    io_sti                                  ; 0681 _ E8, FFFFFFFC(rel)
        mov     dword [esp], timerinfo1.1713            ; 0686 _ C7. 04 24, 0000000C(d)
        call    fifo8_get                               ; 068D _ E8, FFFFFFFC(rel)
        mov     edx, dword [back_sheet]                 ; 0692 _ 8B. 15, 00000004(d)
        mov     eax, dword [sheet_control]              ; 0698 _ A1, 00000000(d)
        mov     dword [esp+14H], 7                      ; 069D _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_187                  ; 06A5 _ C7. 44 24, 10, 00000007(d)
        mov     dword [esp+0CH], 144                    ; 06AD _ C7. 44 24, 0C, 00000090
        mov     ecx, dword [ebp-48H]                    ; 06B5 _ 8B. 4D, B8
        mov     dword [esp+8H], ecx                     ; 06B8 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 06BC _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 06C0 _ 89. 04 24
        call    paint_string                            ; 06C3 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 100                     ; 06C8 _ C7. 44 24, 04, 00000064
        mov     eax, dword [ebp-30H]                    ; 06D0 _ 8B. 45, D0
        mov     dword [esp], eax                        ; 06D3 _ 89. 04 24
        call    timer_settime                           ; 06D6 _ E8, FFFFFFFC(rel)
        add     dword [ebp-48H], 8                      ; 06DB _ 83. 45, B8, 08
        cmp     dword [ebp-48H], 40                     ; 06DF _ 83. 7D, B8, 28
        jle     ?_010                                   ; 06E3 _ 0F 8E, 00000156
        cmp     dword [ebp-44H], 0                      ; 06E9 _ 83. 7D, BC, 00
        jne     ?_010                                   ; 06ED _ 0F 85, 0000014C
        call    io_cli                                  ; 06F3 _ E8, FFFFFFFC(rel)
        mov     eax, dword [task_a.1723]                ; 06F8 _ A1, 00000078(d)
        mov     dword [esp], eax                        ; 06FD _ 89. 04 24
        call    task_sleep                              ; 0700 _ E8, FFFFFFFC(rel)
        call    io_sti                                  ; 0705 _ E8, FFFFFFFC(rel)
        jmp     ?_001                                   ; 070A _ E9, FFFFFD1E

?_006:  mov     dword [esp], timerinfo2.1714            ; 070F _ C7. 04 24, 00000030(d)
        call    fifo8_status                            ; 0716 _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 071B _ 85. C0
        jz      ?_007                                   ; 071D _ 74, 16
        call    io_sti                                  ; 071F _ E8, FFFFFFFC(rel)
        mov     dword [esp], timerinfo2.1714            ; 0724 _ C7. 04 24, 00000030(d)
        call    fifo8_get                               ; 072B _ E8, FFFFFFFC(rel)
        jmp     ?_010                                   ; 0730 _ E9, 0000010A

?_007:  mov     dword [esp], timerinfo3.1715            ; 0735 _ C7. 04 24, 00000054(d)
        call    fifo8_status                            ; 073C _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 0741 _ 85. C0
        je      ?_010                                   ; 0743 _ 0F 84, 000000F6
        mov     dword [esp], timerinfo3.1715            ; 0749 _ C7. 04 24, 00000054(d)
        call    fifo8_get                               ; 0750 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 0755 _ 89. 45, F4
        call    io_sti                                  ; 0758 _ E8, FFFFFFFC(rel)
        cmp     dword [ebp-0CH], 0                      ; 075D _ 83. 7D, F4, 00
        jz      ?_008                                   ; 0761 _ 74, 24
        mov     dword [esp+8H], 0                       ; 0763 _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], timerinfo3.1715         ; 076B _ C7. 44 24, 04, 00000054(d)
        mov     eax, dword [ebp-28H]                    ; 0773 _ 8B. 45, D8
        mov     dword [esp], eax                        ; 0776 _ 89. 04 24
        call    timer_init                              ; 0779 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-4CH], 0                      ; 077E _ C7. 45, B4, 00000000
        jmp     ?_009                                   ; 0785 _ EB, 22

?_008:  mov     dword [esp+8H], 1                       ; 0787 _ C7. 44 24, 08, 00000001
        mov     dword [esp+4H], timerinfo3.1715         ; 078F _ C7. 44 24, 04, 00000054(d)
        mov     eax, dword [ebp-28H]                    ; 0797 _ 8B. 45, D8
        mov     dword [esp], eax                        ; 079A _ 89. 04 24
        call    timer_init                              ; 079D _ E8, FFFFFFFC(rel)
        mov     dword [ebp-4CH], 7                      ; 07A2 _ C7. 45, B4, 00000007
?_009:  mov     dword [esp+4H], 50                      ; 07A9 _ C7. 44 24, 04, 00000032
        mov     eax, dword [ebp-28H]                    ; 07B1 _ 8B. 45, D8
        mov     dword [esp], eax                        ; 07B4 _ 89. 04 24
        call    timer_settime                           ; 07B7 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-50H]                    ; 07BC _ 8B. 45, B0
        lea     ebx, [eax+7H]                           ; 07BF _ 8D. 58, 07
        mov     eax, dword [ebp-4CH]                    ; 07C2 _ 8B. 45, B4
        movzx   ecx, al                                 ; 07C5 _ 0F B6. C8
        mov     eax, dword [sheet_win]                  ; 07C8 _ A1, 00000000(d)
        mov     edx, dword [eax+4H]                     ; 07CD _ 8B. 50, 04
        mov     eax, dword [sheet_win]                  ; 07D0 _ A1, 00000000(d)
        mov     eax, dword [eax]                        ; 07D5 _ 8B. 00
        mov     dword [esp+18H], 43                     ; 07D7 _ C7. 44 24, 18, 0000002B
        mov     dword [esp+14H], ebx                    ; 07DF _ 89. 5C 24, 14
        mov     dword [esp+10H], 28                     ; 07E3 _ C7. 44 24, 10, 0000001C
        mov     ebx, dword [ebp-50H]                    ; 07EB _ 8B. 5D, B0
        mov     dword [esp+0CH], ebx                    ; 07EE _ 89. 5C 24, 0C
        mov     dword [esp+8H], ecx                     ; 07F2 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 07F6 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 07FA _ 89. 04 24
        call    paint_rectangle                         ; 07FD _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-50H]                    ; 0802 _ 8B. 45, B0
        lea     ecx, [eax+8H]                           ; 0805 _ 8D. 48, 08
        mov     edx, dword [sheet_win]                  ; 0808 _ 8B. 15, 00000000(d)
        mov     eax, dword [sheet_control]              ; 080E _ A1, 00000000(d)
        mov     dword [esp+14H], 44                     ; 0813 _ C7. 44 24, 14, 0000002C
        mov     dword [esp+10H], ecx                    ; 081B _ 89. 4C 24, 10
        mov     dword [esp+0CH], 28                     ; 081F _ C7. 44 24, 0C, 0000001C
        mov     ecx, dword [ebp-50H]                    ; 0827 _ 8B. 4D, B0
        mov     dword [esp+8H], ecx                     ; 082A _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 082E _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0832 _ 89. 04 24
        call    sheet_refresh                           ; 0835 _ E8, FFFFFFFC(rel)
        jmp     ?_001                                   ; 083A _ E9, FFFFFBEE

?_010:  jmp     ?_001                                   ; 083F _ E9, FFFFFBE9
; CMain End of function

task_b_main:; Function begin
        push    ebp                                     ; 0844 _ 55
        mov     ebp, esp                                ; 0845 _ 89. E5
        sub     esp, 104                                ; 0847 _ 83. EC, 68
; Note: Absolute memory address without relocation
        mov     eax, dword [gs:14H]                     ; 084A _ 65: A1, 00000014
        mov     dword [ebp-0CH], eax                    ; 0850 _ 89. 45, F4
        xor     eax, eax                                ; 0853 _ 31. C0
        mov     edx, dword [back_sheet]                 ; 0855 _ 8B. 15, 00000004(d)
        mov     eax, dword [sheet_control]              ; 085B _ A1, 00000000(d)
        mov     dword [esp+14H], 7                      ; 0860 _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_188                  ; 0868 _ C7. 44 24, 10, 00000009(d)
        mov     dword [esp+0CH], 160                    ; 0870 _ C7. 44 24, 0C, 000000A0
        mov     dword [esp+8H], 0                       ; 0878 _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], edx                     ; 0880 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0884 _ 89. 04 24
        call    paint_string                            ; 0887 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-38H], 0                      ; 088C _ C7. 45, C8, 00000000
        mov     dword [ebp-34H], 0                      ; 0893 _ C7. 45, CC, 00000000
        mov     dword [esp+0CH], 0                      ; 089A _ C7. 44 24, 0C, 00000000
        lea     eax, [ebp-14H]                          ; 08A2 _ 8D. 45, EC
        mov     dword [esp+8H], eax                     ; 08A5 _ 89. 44 24, 08
        mov     dword [esp+4H], 8                       ; 08A9 _ C7. 44 24, 04, 00000008
        lea     eax, [ebp-30H]                          ; 08B1 _ 8D. 45, D0
        mov     dword [esp], eax                        ; 08B4 _ 89. 04 24
        call    fifo8_init                              ; 08B7 _ E8, FFFFFFFC(rel)
        call    timer_alloc                             ; 08BC _ E8, FFFFFFFC(rel)
        mov     dword [ebp-38H], eax                    ; 08C1 _ 89. 45, C8
        mov     dword [esp+8H], 123                     ; 08C4 _ C7. 44 24, 08, 0000007B
        lea     eax, [ebp-30H]                          ; 08CC _ 8D. 45, D0
        mov     dword [esp+4H], eax                     ; 08CF _ 89. 44 24, 04
        mov     eax, dword [ebp-38H]                    ; 08D3 _ 8B. 45, C8
        mov     dword [esp], eax                        ; 08D6 _ 89. 04 24
        call    timer_init                              ; 08D9 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 100                     ; 08DE _ C7. 44 24, 04, 00000064
        mov     eax, dword [ebp-38H]                    ; 08E6 _ 8B. 45, C8
        mov     dword [esp], eax                        ; 08E9 _ 89. 04 24
        call    timer_settime                           ; 08EC _ E8, FFFFFFFC(rel)
        mov     dword [ebp-3CH], 0                      ; 08F1 _ C7. 45, C4, 00000000
?_011:  call    io_cli                                  ; 08F8 _ E8, FFFFFFFC(rel)
        lea     eax, [ebp-30H]                          ; 08FD _ 8D. 45, D0
        mov     dword [esp], eax                        ; 0900 _ 89. 04 24
        call    fifo8_status                            ; 0903 _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 0908 _ 85. C0
        jnz     ?_012                                   ; 090A _ 75, 07
        call    io_sti                                  ; 090C _ E8, FFFFFFFC(rel)
        jmp     ?_013                                   ; 0911 _ EB, 6B

?_012:  lea     eax, [ebp-30H]                          ; 0913 _ 8D. 45, D0
        mov     dword [esp], eax                        ; 0916 _ 89. 04 24
        call    fifo8_get                               ; 0919 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-34H], eax                    ; 091E _ 89. 45, CC
        call    io_sti                                  ; 0921 _ E8, FFFFFFFC(rel)
        cmp     dword [ebp-34H], 123                    ; 0926 _ 83. 7D, CC, 7B
        jnz     ?_013                                   ; 092A _ 75, 52
        mov     edx, dword [back_sheet]                 ; 092C _ 8B. 15, 00000004(d)
        mov     eax, dword [sheet_control]              ; 0932 _ A1, 00000000(d)
        mov     dword [esp+14H], 7                      ; 0937 _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_189                  ; 093F _ C7. 44 24, 10, 00000016(d)
        mov     dword [esp+0CH], 176                    ; 0947 _ C7. 44 24, 0C, 000000B0
        mov     ecx, dword [ebp-3CH]                    ; 094F _ 8B. 4D, C4
        mov     dword [esp+8H], ecx                     ; 0952 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 0956 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 095A _ 89. 04 24
        call    paint_string                            ; 095D _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 100                     ; 0962 _ C7. 44 24, 04, 00000064
        mov     eax, dword [ebp-38H]                    ; 096A _ 8B. 45, C8
        mov     dword [esp], eax                        ; 096D _ 89. 04 24
        call    timer_settime                           ; 0970 _ E8, FFFFFFFC(rel)
        add     dword [ebp-3CH], 8                      ; 0975 _ 83. 45, C4, 08
        jmp     ?_011                                   ; 0979 _ E9, FFFFFF7A

?_013:  jmp     ?_011                                   ; 097E _ E9, FFFFFF75
; task_b_main End of function

init_screeninfo:; Function begin
        push    ebp                                     ; 0983 _ 55
        mov     ebp, esp                                ; 0984 _ 89. E5
        mov     eax, dword [VRAM_ADDRESS]               ; 0986 _ A1, 00000000(d)
        mov     edx, eax                                ; 098B _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 098D _ 8B. 45, 08
        mov     dword [eax], edx                        ; 0990 _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 0992 _ 8B. 45, 08
; Note: Length-changing prefix causes delay on Intel processors
        mov     word [eax+4H], 640                      ; 0995 _ 66: C7. 40, 04, 0280
        mov     eax, dword [ebp+8H]                     ; 099B _ 8B. 45, 08
; Note: Length-changing prefix causes delay on Intel processors
        mov     word [eax+6H], 480                      ; 099E _ 66: C7. 40, 06, 01E0
        pop     ebp                                     ; 09A4 _ 5D
        ret                                             ; 09A5 _ C3
; init_screeninfo End of function

init_palette:; Function begin
        push    ebp                                     ; 09A6 _ 55
        mov     ebp, esp                                ; 09A7 _ 89. E5
        sub     esp, 24                                 ; 09A9 _ 83. EC, 18
        mov     dword [esp+8H], table_rgb.1684          ; 09AC _ C7. 44 24, 08, 00000080(d)
        mov     dword [esp+4H], 15                      ; 09B4 _ C7. 44 24, 04, 0000000F
        mov     dword [esp], 0                          ; 09BC _ C7. 04 24, 00000000
        call    set_palette                             ; 09C3 _ E8, FFFFFFFC(rel)
        nop                                             ; 09C8 _ 90
        leave                                           ; 09C9 _ C9
        ret                                             ; 09CA _ C3
; init_palette End of function

set_palette:; Function begin
        push    ebp                                     ; 09CB _ 55
        mov     ebp, esp                                ; 09CC _ 89. E5
        sub     esp, 40                                 ; 09CE _ 83. EC, 28
        call    io_load_eflags                          ; 09D1 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 09D6 _ 89. 45, F4
        call    io_cli                                  ; 09D9 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 09DE _ 8B. 45, 08
        mov     dword [esp+4H], eax                     ; 09E1 _ 89. 44 24, 04
        mov     dword [esp], 968                        ; 09E5 _ C7. 04 24, 000003C8
        call    io_out8                                 ; 09EC _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 09F1 _ 8B. 45, 08
        mov     dword [ebp-10H], eax                    ; 09F4 _ 89. 45, F0
        jmp     ?_015                                   ; 09F7 _ EB, 62

?_014:  mov     eax, dword [ebp+10H]                    ; 09F9 _ 8B. 45, 10
        movzx   eax, byte [eax]                         ; 09FC _ 0F B6. 00
        shr     al, 2                                   ; 09FF _ C0. E8, 02
        movzx   eax, al                                 ; 0A02 _ 0F B6. C0
        mov     dword [esp+4H], eax                     ; 0A05 _ 89. 44 24, 04
        mov     dword [esp], 969                        ; 0A09 _ C7. 04 24, 000003C9
        call    io_out8                                 ; 0A10 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0A15 _ 8B. 45, 10
        add     eax, 1                                  ; 0A18 _ 83. C0, 01
        movzx   eax, byte [eax]                         ; 0A1B _ 0F B6. 00
        shr     al, 2                                   ; 0A1E _ C0. E8, 02
        movzx   eax, al                                 ; 0A21 _ 0F B6. C0
        mov     dword [esp+4H], eax                     ; 0A24 _ 89. 44 24, 04
        mov     dword [esp], 969                        ; 0A28 _ C7. 04 24, 000003C9
        call    io_out8                                 ; 0A2F _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0A34 _ 8B. 45, 10
        add     eax, 2                                  ; 0A37 _ 83. C0, 02
        movzx   eax, byte [eax]                         ; 0A3A _ 0F B6. 00
        shr     al, 2                                   ; 0A3D _ C0. E8, 02
        movzx   eax, al                                 ; 0A40 _ 0F B6. C0
        mov     dword [esp+4H], eax                     ; 0A43 _ 89. 44 24, 04
        mov     dword [esp], 969                        ; 0A47 _ C7. 04 24, 000003C9
        call    io_out8                                 ; 0A4E _ E8, FFFFFFFC(rel)
        add     dword [ebp+10H], 3                      ; 0A53 _ 83. 45, 10, 03
        add     dword [ebp-10H], 1                      ; 0A57 _ 83. 45, F0, 01
?_015:  mov     eax, dword [ebp-10H]                    ; 0A5B _ 8B. 45, F0
        cmp     eax, dword [ebp+0CH]                    ; 0A5E _ 3B. 45, 0C
        jle     ?_014                                   ; 0A61 _ 7E, 96
        mov     eax, dword [ebp-0CH]                    ; 0A63 _ 8B. 45, F4
        mov     dword [esp], eax                        ; 0A66 _ 89. 04 24
        call    io_store_eflags                         ; 0A69 _ E8, FFFFFFFC(rel)
        nop                                             ; 0A6E _ 90
        leave                                           ; 0A6F _ C9
        ret                                             ; 0A70 _ C3
; set_palette End of function

paint_rectangle:; Function begin
        push    ebp                                     ; 0A71 _ 55
        mov     ebp, esp                                ; 0A72 _ 89. E5
        sub     esp, 20                                 ; 0A74 _ 83. EC, 14
        mov     eax, dword [ebp+10H]                    ; 0A77 _ 8B. 45, 10
        mov     byte [ebp-14H], al                      ; 0A7A _ 88. 45, EC
        mov     eax, dword [ebp+18H]                    ; 0A7D _ 8B. 45, 18
        mov     dword [ebp-4H], eax                     ; 0A80 _ 89. 45, FC
        jmp     ?_019                                   ; 0A83 _ EB, 33

?_016:  mov     eax, dword [ebp+14H]                    ; 0A85 _ 8B. 45, 14
        mov     dword [ebp-8H], eax                     ; 0A88 _ 89. 45, F8
        jmp     ?_018                                   ; 0A8B _ EB, 1F

?_017:  mov     eax, dword [ebp-4H]                     ; 0A8D _ 8B. 45, FC
        imul    eax, dword [ebp+0CH]                    ; 0A90 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0A94 _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 0A96 _ 8B. 45, F8
        add     eax, edx                                ; 0A99 _ 01. D0
        mov     edx, eax                                ; 0A9B _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0A9D _ 8B. 45, 08
        add     edx, eax                                ; 0AA0 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0AA2 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0AA6 _ 88. 02
        add     dword [ebp-8H], 1                       ; 0AA8 _ 83. 45, F8, 01
?_018:  mov     eax, dword [ebp-8H]                     ; 0AAC _ 8B. 45, F8
        cmp     eax, dword [ebp+1CH]                    ; 0AAF _ 3B. 45, 1C
        jle     ?_017                                   ; 0AB2 _ 7E, D9
        add     dword [ebp-4H], 1                       ; 0AB4 _ 83. 45, FC, 01
?_019:  mov     eax, dword [ebp-4H]                     ; 0AB8 _ 8B. 45, FC
        cmp     eax, dword [ebp+20H]                    ; 0ABB _ 3B. 45, 20
        jle     ?_016                                   ; 0ABE _ 7E, C5
        leave                                           ; 0AC0 _ C9
        ret                                             ; 0AC1 _ C3
; paint_rectangle End of function

init_desktop:; Function begin
        push    ebp                                     ; 0AC2 _ 55
        mov     ebp, esp                                ; 0AC3 _ 89. E5
        push    ebx                                     ; 0AC5 _ 53
        sub     esp, 28                                 ; 0AC6 _ 83. EC, 1C
        mov     eax, dword [ebp+10H]                    ; 0AC9 _ 8B. 45, 10
        lea     edx, [eax-1DH]                          ; 0ACC _ 8D. 50, E3
        mov     eax, dword [ebp+0CH]                    ; 0ACF _ 8B. 45, 0C
        sub     eax, 1                                  ; 0AD2 _ 83. E8, 01
        mov     dword [esp+18H], edx                    ; 0AD5 _ 89. 54 24, 18
        mov     dword [esp+14H], eax                    ; 0AD9 _ 89. 44 24, 14
        mov     dword [esp+10H], 0                      ; 0ADD _ C7. 44 24, 10, 00000000
        mov     dword [esp+0CH], 0                      ; 0AE5 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 2                       ; 0AED _ C7. 44 24, 08, 00000002
        mov     eax, dword [ebp+0CH]                    ; 0AF5 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0AF8 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0AFC _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0AFF _ 89. 04 24
        call    paint_rectangle                         ; 0B02 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0B07 _ 8B. 45, 10
        lea     ecx, [eax-1CH]                          ; 0B0A _ 8D. 48, E4
        mov     eax, dword [ebp+0CH]                    ; 0B0D _ 8B. 45, 0C
        lea     edx, [eax-1H]                           ; 0B10 _ 8D. 50, FF
        mov     eax, dword [ebp+10H]                    ; 0B13 _ 8B. 45, 10
        sub     eax, 28                                 ; 0B16 _ 83. E8, 1C
        mov     dword [esp+18H], ecx                    ; 0B19 _ 89. 4C 24, 18
        mov     dword [esp+14H], edx                    ; 0B1D _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 0B21 _ 89. 44 24, 10
        mov     dword [esp+0CH], 0                      ; 0B25 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 8                       ; 0B2D _ C7. 44 24, 08, 00000008
        mov     eax, dword [ebp+0CH]                    ; 0B35 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0B38 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0B3C _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0B3F _ 89. 04 24
        call    paint_rectangle                         ; 0B42 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0B47 _ 8B. 45, 10
        lea     ecx, [eax-1BH]                          ; 0B4A _ 8D. 48, E5
        mov     eax, dword [ebp+0CH]                    ; 0B4D _ 8B. 45, 0C
        lea     edx, [eax-1H]                           ; 0B50 _ 8D. 50, FF
        mov     eax, dword [ebp+10H]                    ; 0B53 _ 8B. 45, 10
        sub     eax, 27                                 ; 0B56 _ 83. E8, 1B
        mov     dword [esp+18H], ecx                    ; 0B59 _ 89. 4C 24, 18
        mov     dword [esp+14H], edx                    ; 0B5D _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 0B61 _ 89. 44 24, 10
        mov     dword [esp+0CH], 0                      ; 0B65 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 7                       ; 0B6D _ C7. 44 24, 08, 00000007
        mov     eax, dword [ebp+0CH]                    ; 0B75 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0B78 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0B7C _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0B7F _ 89. 04 24
        call    paint_rectangle                         ; 0B82 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0B87 _ 8B. 45, 10
        lea     ecx, [eax-1H]                           ; 0B8A _ 8D. 48, FF
        mov     eax, dword [ebp+0CH]                    ; 0B8D _ 8B. 45, 0C
        lea     edx, [eax-1H]                           ; 0B90 _ 8D. 50, FF
        mov     eax, dword [ebp+10H]                    ; 0B93 _ 8B. 45, 10
        sub     eax, 26                                 ; 0B96 _ 83. E8, 1A
        mov     dword [esp+18H], ecx                    ; 0B99 _ 89. 4C 24, 18
        mov     dword [esp+14H], edx                    ; 0B9D _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 0BA1 _ 89. 44 24, 10
        mov     dword [esp+0CH], 0                      ; 0BA5 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 8                       ; 0BAD _ C7. 44 24, 08, 00000008
        mov     eax, dword [ebp+0CH]                    ; 0BB5 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0BB8 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0BBC _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0BBF _ 89. 04 24
        call    paint_rectangle                         ; 0BC2 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0BC7 _ 8B. 45, 10
        lea     edx, [eax-18H]                          ; 0BCA _ 8D. 50, E8
        mov     eax, dword [ebp+10H]                    ; 0BCD _ 8B. 45, 10
        sub     eax, 24                                 ; 0BD0 _ 83. E8, 18
        mov     dword [esp+18H], edx                    ; 0BD3 _ 89. 54 24, 18
        mov     dword [esp+14H], 59                     ; 0BD7 _ C7. 44 24, 14, 0000003B
        mov     dword [esp+10H], eax                    ; 0BDF _ 89. 44 24, 10
        mov     dword [esp+0CH], 3                      ; 0BE3 _ C7. 44 24, 0C, 00000003
        mov     dword [esp+8H], 7                       ; 0BEB _ C7. 44 24, 08, 00000007
        mov     eax, dword [ebp+0CH]                    ; 0BF3 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0BF6 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0BFA _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0BFD _ 89. 04 24
        call    paint_rectangle                         ; 0C00 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0C05 _ 8B. 45, 10
        lea     edx, [eax-4H]                           ; 0C08 _ 8D. 50, FC
        mov     eax, dword [ebp+10H]                    ; 0C0B _ 8B. 45, 10
        sub     eax, 24                                 ; 0C0E _ 83. E8, 18
        mov     dword [esp+18H], edx                    ; 0C11 _ 89. 54 24, 18
        mov     dword [esp+14H], 2                      ; 0C15 _ C7. 44 24, 14, 00000002
        mov     dword [esp+10H], eax                    ; 0C1D _ 89. 44 24, 10
        mov     dword [esp+0CH], 2                      ; 0C21 _ C7. 44 24, 0C, 00000002
        mov     dword [esp+8H], 7                       ; 0C29 _ C7. 44 24, 08, 00000007
        mov     eax, dword [ebp+0CH]                    ; 0C31 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0C34 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0C38 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0C3B _ 89. 04 24
        call    paint_rectangle                         ; 0C3E _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0C43 _ 8B. 45, 10
        lea     edx, [eax-4H]                           ; 0C46 _ 8D. 50, FC
        mov     eax, dword [ebp+10H]                    ; 0C49 _ 8B. 45, 10
        sub     eax, 4                                  ; 0C4C _ 83. E8, 04
        mov     dword [esp+18H], edx                    ; 0C4F _ 89. 54 24, 18
        mov     dword [esp+14H], 59                     ; 0C53 _ C7. 44 24, 14, 0000003B
        mov     dword [esp+10H], eax                    ; 0C5B _ 89. 44 24, 10
        mov     dword [esp+0CH], 3                      ; 0C5F _ C7. 44 24, 0C, 00000003
        mov     dword [esp+8H], 2                       ; 0C67 _ C7. 44 24, 08, 00000002
        mov     eax, dword [ebp+0CH]                    ; 0C6F _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0C72 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0C76 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0C79 _ 89. 04 24
        call    paint_rectangle                         ; 0C7C _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0C81 _ 8B. 45, 10
        lea     edx, [eax-5H]                           ; 0C84 _ 8D. 50, FB
        mov     eax, dword [ebp+10H]                    ; 0C87 _ 8B. 45, 10
        sub     eax, 23                                 ; 0C8A _ 83. E8, 17
        mov     dword [esp+18H], edx                    ; 0C8D _ 89. 54 24, 18
        mov     dword [esp+14H], 59                     ; 0C91 _ C7. 44 24, 14, 0000003B
        mov     dword [esp+10H], eax                    ; 0C99 _ 89. 44 24, 10
        mov     dword [esp+0CH], 59                     ; 0C9D _ C7. 44 24, 0C, 0000003B
        mov     dword [esp+8H], 2                       ; 0CA5 _ C7. 44 24, 08, 00000002
        mov     eax, dword [ebp+0CH]                    ; 0CAD _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0CB0 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0CB4 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0CB7 _ 89. 04 24
        call    paint_rectangle                         ; 0CBA _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0CBF _ 8B. 45, 10
        lea     edx, [eax-3H]                           ; 0CC2 _ 8D. 50, FD
        mov     eax, dword [ebp+10H]                    ; 0CC5 _ 8B. 45, 10
        sub     eax, 3                                  ; 0CC8 _ 83. E8, 03
        mov     dword [esp+18H], edx                    ; 0CCB _ 89. 54 24, 18
        mov     dword [esp+14H], 59                     ; 0CCF _ C7. 44 24, 14, 0000003B
        mov     dword [esp+10H], eax                    ; 0CD7 _ 89. 44 24, 10
        mov     dword [esp+0CH], 2                      ; 0CDB _ C7. 44 24, 0C, 00000002
        mov     dword [esp+8H], 0                       ; 0CE3 _ C7. 44 24, 08, 00000000
        mov     eax, dword [ebp+0CH]                    ; 0CEB _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0CEE _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0CF2 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0CF5 _ 89. 04 24
        call    paint_rectangle                         ; 0CF8 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0CFD _ 8B. 45, 10
        lea     edx, [eax-3H]                           ; 0D00 _ 8D. 50, FD
        mov     eax, dword [ebp+10H]                    ; 0D03 _ 8B. 45, 10
        sub     eax, 24                                 ; 0D06 _ 83. E8, 18
        mov     dword [esp+18H], edx                    ; 0D09 _ 89. 54 24, 18
        mov     dword [esp+14H], 60                     ; 0D0D _ C7. 44 24, 14, 0000003C
        mov     dword [esp+10H], eax                    ; 0D15 _ 89. 44 24, 10
        mov     dword [esp+0CH], 60                     ; 0D19 _ C7. 44 24, 0C, 0000003C
        mov     dword [esp+8H], 0                       ; 0D21 _ C7. 44 24, 08, 00000000
        mov     eax, dword [ebp+0CH]                    ; 0D29 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0D2C _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0D30 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0D33 _ 89. 04 24
        call    paint_rectangle                         ; 0D36 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0D3B _ 8B. 45, 10
        lea     ebx, [eax-18H]                          ; 0D3E _ 8D. 58, E8
        mov     eax, dword [ebp+0CH]                    ; 0D41 _ 8B. 45, 0C
        lea     ecx, [eax-4H]                           ; 0D44 _ 8D. 48, FC
        mov     eax, dword [ebp+10H]                    ; 0D47 _ 8B. 45, 10
        lea     edx, [eax-18H]                          ; 0D4A _ 8D. 50, E8
        mov     eax, dword [ebp+0CH]                    ; 0D4D _ 8B. 45, 0C
        sub     eax, 47                                 ; 0D50 _ 83. E8, 2F
        mov     dword [esp+18H], ebx                    ; 0D53 _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 0D57 _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 0D5B _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 0D5F _ 89. 44 24, 0C
        mov     dword [esp+8H], 2                       ; 0D63 _ C7. 44 24, 08, 00000002
        mov     eax, dword [ebp+0CH]                    ; 0D6B _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0D6E _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0D72 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0D75 _ 89. 04 24
        call    paint_rectangle                         ; 0D78 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0D7D _ 8B. 45, 10
        lea     ebx, [eax-4H]                           ; 0D80 _ 8D. 58, FC
        mov     eax, dword [ebp+0CH]                    ; 0D83 _ 8B. 45, 0C
        lea     ecx, [eax-2FH]                          ; 0D86 _ 8D. 48, D1
        mov     eax, dword [ebp+10H]                    ; 0D89 _ 8B. 45, 10
        lea     edx, [eax-17H]                          ; 0D8C _ 8D. 50, E9
        mov     eax, dword [ebp+0CH]                    ; 0D8F _ 8B. 45, 0C
        sub     eax, 47                                 ; 0D92 _ 83. E8, 2F
        mov     dword [esp+18H], ebx                    ; 0D95 _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 0D99 _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 0D9D _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 0DA1 _ 89. 44 24, 0C
        mov     dword [esp+8H], 2                       ; 0DA5 _ C7. 44 24, 08, 00000002
        mov     eax, dword [ebp+0CH]                    ; 0DAD _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0DB0 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0DB4 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0DB7 _ 89. 04 24
        call    paint_rectangle                         ; 0DBA _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0DBF _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 0DC2 _ 8D. 58, FD
        mov     eax, dword [ebp+0CH]                    ; 0DC5 _ 8B. 45, 0C
        lea     ecx, [eax-4H]                           ; 0DC8 _ 8D. 48, FC
        mov     eax, dword [ebp+10H]                    ; 0DCB _ 8B. 45, 10
        lea     edx, [eax-3H]                           ; 0DCE _ 8D. 50, FD
        mov     eax, dword [ebp+0CH]                    ; 0DD1 _ 8B. 45, 0C
        sub     eax, 47                                 ; 0DD4 _ 83. E8, 2F
        mov     dword [esp+18H], ebx                    ; 0DD7 _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 0DDB _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 0DDF _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 0DE3 _ 89. 44 24, 0C
        mov     dword [esp+8H], 7                       ; 0DE7 _ C7. 44 24, 08, 00000007
        mov     eax, dword [ebp+0CH]                    ; 0DEF _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0DF2 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0DF6 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0DF9 _ 89. 04 24
        call    paint_rectangle                         ; 0DFC _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0E01 _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 0E04 _ 8D. 58, FD
        mov     eax, dword [ebp+0CH]                    ; 0E07 _ 8B. 45, 0C
        lea     ecx, [eax-3H]                           ; 0E0A _ 8D. 48, FD
        mov     eax, dword [ebp+10H]                    ; 0E0D _ 8B. 45, 10
        lea     edx, [eax-18H]                          ; 0E10 _ 8D. 50, E8
        mov     eax, dword [ebp+0CH]                    ; 0E13 _ 8B. 45, 0C
        sub     eax, 3                                  ; 0E16 _ 83. E8, 03
        mov     dword [esp+18H], ebx                    ; 0E19 _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 0E1D _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 0E21 _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 0E25 _ 89. 44 24, 0C
        mov     dword [esp+8H], 7                       ; 0E29 _ C7. 44 24, 08, 00000007
        mov     eax, dword [ebp+0CH]                    ; 0E31 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0E34 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0E38 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0E3B _ 89. 04 24
        call    paint_rectangle                         ; 0E3E _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 0E43 _ 83. C4, 1C
        pop     ebx                                     ; 0E46 _ 5B
        pop     ebp                                     ; 0E47 _ 5D
        ret                                             ; 0E48 _ C3
; init_desktop End of function

init_mouse_position:; Function begin
        push    ebp                                     ; 0E49 _ 55
        mov     ebp, esp                                ; 0E4A _ 89. E5
        sub     esp, 16                                 ; 0E4C _ 83. EC, 10
        movzx   eax, word [?_198]                       ; 0E4F _ 0F B7. 05, 00000104(d)
        cwde                                            ; 0E56 _ 98
        mov     dword [ebp-8H], eax                     ; 0E57 _ 89. 45, F8
        movzx   eax, word [?_199]                       ; 0E5A _ 0F B7. 05, 00000106(d)
        cwde                                            ; 0E61 _ 98
        mov     dword [ebp-4H], eax                     ; 0E62 _ 89. 45, FC
        mov     eax, dword [ebp-8H]                     ; 0E65 _ 8B. 45, F8
        sub     eax, 16                                 ; 0E68 _ 83. E8, 10
        mov     edx, eax                                ; 0E6B _ 89. C2
        shr     edx, 31                                 ; 0E6D _ C1. EA, 1F
        add     eax, edx                                ; 0E70 _ 01. D0
        sar     eax, 1                                  ; 0E72 _ D1. F8
        mov     dword [mouse_x], eax                    ; 0E74 _ A3, 00000228(d)
        mov     eax, dword [ebp-4H]                     ; 0E79 _ 8B. 45, FC
        sub     eax, 44                                 ; 0E7C _ 83. E8, 2C
        mov     edx, eax                                ; 0E7F _ 89. C2
        shr     edx, 31                                 ; 0E81 _ C1. EA, 1F
        add     eax, edx                                ; 0E84 _ 01. D0
        sar     eax, 1                                  ; 0E86 _ D1. F8
        mov     dword [mouse_y], eax                    ; 0E88 _ A3, 0000022C(d)
        leave                                           ; 0E8D _ C9
        ret                                             ; 0E8E _ C3
; init_mouse_position End of function

paint_font:; Function begin
        push    ebp                                     ; 0E8F _ 55
        mov     ebp, esp                                ; 0E90 _ 89. E5
        sub     esp, 20                                 ; 0E92 _ 83. EC, 14
        mov     eax, dword [ebp+1CH]                    ; 0E95 _ 8B. 45, 1C
        mov     byte [ebp-14H], al                      ; 0E98 _ 88. 45, EC
        mov     dword [ebp-4H], 0                       ; 0E9B _ C7. 45, FC, 00000000
        jmp     ?_029                                   ; 0EA2 _ E9, 0000016E

?_020:  mov     edx, dword [ebp-4H]                     ; 0EA7 _ 8B. 55, FC
        mov     eax, dword [ebp+18H]                    ; 0EAA _ 8B. 45, 18
        add     eax, edx                                ; 0EAD _ 01. D0
        movzx   eax, byte [eax]                         ; 0EAF _ 0F B6. 00
        mov     byte [ebp-5H], al                       ; 0EB2 _ 88. 45, FB
        movzx   eax, byte [ebp-5H]                      ; 0EB5 _ 0F B6. 45, FB
        test    al, al                                  ; 0EB9 _ 84. C0
        jns     ?_021                                   ; 0EBB _ 79, 20
        mov     eax, dword [ebp-4H]                     ; 0EBD _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 0EC0 _ 8B. 55, 14
        add     eax, edx                                ; 0EC3 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0EC5 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0EC9 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0ECB _ 8B. 45, 10
        add     eax, edx                                ; 0ECE _ 01. D0
        mov     edx, eax                                ; 0ED0 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0ED2 _ 8B. 45, 08
        add     edx, eax                                ; 0ED5 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0ED7 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0EDB _ 88. 02
?_021:  movzx   eax, byte [ebp-5H]                      ; 0EDD _ 0F B6. 45, FB
        and     eax, 40H                                ; 0EE1 _ 83. E0, 40
        test    eax, eax                                ; 0EE4 _ 85. C0
        jz      ?_022                                   ; 0EE6 _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 0EE8 _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 0EEB _ 8B. 55, 14
        add     eax, edx                                ; 0EEE _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0EF0 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0EF4 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0EF6 _ 8B. 45, 10
        add     eax, edx                                ; 0EF9 _ 01. D0
        lea     edx, [eax+1H]                           ; 0EFB _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 0EFE _ 8B. 45, 08
        add     edx, eax                                ; 0F01 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0F03 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0F07 _ 88. 02
?_022:  movzx   eax, byte [ebp-5H]                      ; 0F09 _ 0F B6. 45, FB
        and     eax, 20H                                ; 0F0D _ 83. E0, 20
        test    eax, eax                                ; 0F10 _ 85. C0
        jz      ?_023                                   ; 0F12 _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 0F14 _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 0F17 _ 8B. 55, 14
        add     eax, edx                                ; 0F1A _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0F1C _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0F20 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0F22 _ 8B. 45, 10
        add     eax, edx                                ; 0F25 _ 01. D0
        lea     edx, [eax+2H]                           ; 0F27 _ 8D. 50, 02
        mov     eax, dword [ebp+8H]                     ; 0F2A _ 8B. 45, 08
        add     edx, eax                                ; 0F2D _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0F2F _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0F33 _ 88. 02
?_023:  movzx   eax, byte [ebp-5H]                      ; 0F35 _ 0F B6. 45, FB
        and     eax, 10H                                ; 0F39 _ 83. E0, 10
        test    eax, eax                                ; 0F3C _ 85. C0
        jz      ?_024                                   ; 0F3E _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 0F40 _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 0F43 _ 8B. 55, 14
        add     eax, edx                                ; 0F46 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0F48 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0F4C _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0F4E _ 8B. 45, 10
        add     eax, edx                                ; 0F51 _ 01. D0
        lea     edx, [eax+3H]                           ; 0F53 _ 8D. 50, 03
        mov     eax, dword [ebp+8H]                     ; 0F56 _ 8B. 45, 08
        add     edx, eax                                ; 0F59 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0F5B _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0F5F _ 88. 02
?_024:  movzx   eax, byte [ebp-5H]                      ; 0F61 _ 0F B6. 45, FB
        and     eax, 08H                                ; 0F65 _ 83. E0, 08
        test    eax, eax                                ; 0F68 _ 85. C0
        jz      ?_025                                   ; 0F6A _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 0F6C _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 0F6F _ 8B. 55, 14
        add     eax, edx                                ; 0F72 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0F74 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0F78 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0F7A _ 8B. 45, 10
        add     eax, edx                                ; 0F7D _ 01. D0
        lea     edx, [eax+4H]                           ; 0F7F _ 8D. 50, 04
        mov     eax, dword [ebp+8H]                     ; 0F82 _ 8B. 45, 08
        add     edx, eax                                ; 0F85 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0F87 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0F8B _ 88. 02
?_025:  movzx   eax, byte [ebp-5H]                      ; 0F8D _ 0F B6. 45, FB
        and     eax, 04H                                ; 0F91 _ 83. E0, 04
        test    eax, eax                                ; 0F94 _ 85. C0
        jz      ?_026                                   ; 0F96 _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 0F98 _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 0F9B _ 8B. 55, 14
        add     eax, edx                                ; 0F9E _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0FA0 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0FA4 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0FA6 _ 8B. 45, 10
        add     eax, edx                                ; 0FA9 _ 01. D0
        lea     edx, [eax+5H]                           ; 0FAB _ 8D. 50, 05
        mov     eax, dword [ebp+8H]                     ; 0FAE _ 8B. 45, 08
        add     edx, eax                                ; 0FB1 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0FB3 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0FB7 _ 88. 02
?_026:  movzx   eax, byte [ebp-5H]                      ; 0FB9 _ 0F B6. 45, FB
        and     eax, 02H                                ; 0FBD _ 83. E0, 02
        test    eax, eax                                ; 0FC0 _ 85. C0
        jz      ?_027                                   ; 0FC2 _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 0FC4 _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 0FC7 _ 8B. 55, 14
        add     eax, edx                                ; 0FCA _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0FCC _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0FD0 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0FD2 _ 8B. 45, 10
        add     eax, edx                                ; 0FD5 _ 01. D0
        lea     edx, [eax+6H]                           ; 0FD7 _ 8D. 50, 06
        mov     eax, dword [ebp+8H]                     ; 0FDA _ 8B. 45, 08
        add     edx, eax                                ; 0FDD _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0FDF _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0FE3 _ 88. 02
?_027:  movzx   eax, byte [ebp-5H]                      ; 0FE5 _ 0F B6. 45, FB
        and     eax, 01H                                ; 0FE9 _ 83. E0, 01
        test    eax, eax                                ; 0FEC _ 85. C0
        jz      ?_028                                   ; 0FEE _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 0FF0 _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 0FF3 _ 8B. 55, 14
        add     eax, edx                                ; 0FF6 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0FF8 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0FFC _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0FFE _ 8B. 45, 10
        add     eax, edx                                ; 1001 _ 01. D0
        lea     edx, [eax+7H]                           ; 1003 _ 8D. 50, 07
        mov     eax, dword [ebp+8H]                     ; 1006 _ 8B. 45, 08
        add     edx, eax                                ; 1009 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 100B _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 100F _ 88. 02
?_028:  add     dword [ebp-4H], 1                       ; 1011 _ 83. 45, FC, 01
?_029:  cmp     dword [ebp-4H], 15                      ; 1015 _ 83. 7D, FC, 0F
        jle     ?_020                                   ; 1019 _ 0F 8E, FFFFFE88
        leave                                           ; 101F _ C9
        ret                                             ; 1020 _ C3
; paint_font End of function

paint_string:; Function begin
        push    ebp                                     ; 1021 _ 55
        mov     ebp, esp                                ; 1022 _ 89. E5
        push    ebx                                     ; 1024 _ 53
        sub     esp, 52                                 ; 1025 _ 83. EC, 34
        mov     eax, dword [ebp+1CH]                    ; 1028 _ 8B. 45, 1C
        mov     byte [ebp-1CH], al                      ; 102B _ 88. 45, E4
        mov     eax, dword [ebp+10H]                    ; 102E _ 8B. 45, 10
        mov     dword [ebp-0CH], eax                    ; 1031 _ 89. 45, F4
        jmp     ?_031                                   ; 1034 _ EB, 4B

?_030:  movsx   ecx, byte [ebp-1CH]                     ; 1036 _ 0F BE. 4D, E4
        mov     eax, dword [ebp+18H]                    ; 103A _ 8B. 45, 18
        movzx   eax, byte [eax]                         ; 103D _ 0F B6. 00
        movsx   eax, al                                 ; 1040 _ 0F BE. C0
        shl     eax, 4                                  ; 1043 _ C1. E0, 04
        lea     ebx, [systemFont+eax]                   ; 1046 _ 8D. 98, 00000000(d)
        mov     eax, dword [ebp+0CH]                    ; 104C _ 8B. 45, 0C
        mov     edx, dword [eax+4H]                     ; 104F _ 8B. 50, 04
        mov     eax, dword [ebp+0CH]                    ; 1052 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1055 _ 8B. 00
        mov     dword [esp+14H], ecx                    ; 1057 _ 89. 4C 24, 14
        mov     dword [esp+10H], ebx                    ; 105B _ 89. 5C 24, 10
        mov     ecx, dword [ebp+14H]                    ; 105F _ 8B. 4D, 14
        mov     dword [esp+0CH], ecx                    ; 1062 _ 89. 4C 24, 0C
        mov     ecx, dword [ebp+10H]                    ; 1066 _ 8B. 4D, 10
        mov     dword [esp+8H], ecx                     ; 1069 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 106D _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1071 _ 89. 04 24
        call    paint_font                              ; 1074 _ E8, FFFFFFFC(rel)
        add     dword [ebp+10H], 8                      ; 1079 _ 83. 45, 10, 08
        add     dword [ebp+18H], 1                      ; 107D _ 83. 45, 18, 01
?_031:  mov     eax, dword [ebp+18H]                    ; 1081 _ 8B. 45, 18
        movzx   eax, byte [eax]                         ; 1084 _ 0F B6. 00
        test    al, al                                  ; 1087 _ 84. C0
        jnz     ?_030                                   ; 1089 _ 75, AB
        mov     eax, dword [ebp+14H]                    ; 108B _ 8B. 45, 14
        add     eax, 16                                 ; 108E _ 83. C0, 10
        mov     dword [esp+14H], eax                    ; 1091 _ 89. 44 24, 14
        mov     eax, dword [ebp+10H]                    ; 1095 _ 8B. 45, 10
        mov     dword [esp+10H], eax                    ; 1098 _ 89. 44 24, 10
        mov     eax, dword [ebp+14H]                    ; 109C _ 8B. 45, 14
        mov     dword [esp+0CH], eax                    ; 109F _ 89. 44 24, 0C
        mov     eax, dword [ebp-0CH]                    ; 10A3 _ 8B. 45, F4
        mov     dword [esp+8H], eax                     ; 10A6 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 10AA _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 10AD _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 10B1 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 10B4 _ 89. 04 24
        call    sheet_refresh                           ; 10B7 _ E8, FFFFFFFC(rel)
        add     esp, 52                                 ; 10BC _ 83. C4, 34
        pop     ebx                                     ; 10BF _ 5B
        pop     ebp                                     ; 10C0 _ 5D
        ret                                             ; 10C1 _ C3
; paint_string End of function

init_mouse_cursor:; Function begin
        push    ebp                                     ; 10C2 _ 55
        mov     ebp, esp                                ; 10C3 _ 89. E5
        sub     esp, 20                                 ; 10C5 _ 83. EC, 14
        mov     eax, dword [ebp+0CH]                    ; 10C8 _ 8B. 45, 0C
        mov     byte [ebp-14H], al                      ; 10CB _ 88. 45, EC
        mov     dword [ebp-8H], 0                       ; 10CE _ C7. 45, F8, 00000000
        jmp     ?_038                                   ; 10D5 _ E9, 0000009C

?_032:  mov     dword [ebp-4H], 0                       ; 10DA _ C7. 45, FC, 00000000
        jmp     ?_037                                   ; 10E1 _ E9, 00000082

?_033:  mov     eax, dword [ebp-8H]                     ; 10E6 _ 8B. 45, F8
        shl     eax, 4                                  ; 10E9 _ C1. E0, 04
        mov     edx, eax                                ; 10EC _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 10EE _ 8B. 45, FC
        add     eax, edx                                ; 10F1 _ 01. D0
        add     eax, cursor.1752                        ; 10F3 _ 05, 000000C0(d)
        movzx   eax, byte [eax]                         ; 10F8 _ 0F B6. 00
        cmp     al, 42                                  ; 10FB _ 3C, 2A
        jnz     ?_034                                   ; 10FD _ 75, 19
        mov     eax, dword [ebp-8H]                     ; 10FF _ 8B. 45, F8
        shl     eax, 4                                  ; 1102 _ C1. E0, 04
        mov     edx, eax                                ; 1105 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 1107 _ 8B. 45, FC
        add     eax, edx                                ; 110A _ 01. D0
        mov     edx, eax                                ; 110C _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 110E _ 8B. 45, 08
        add     eax, edx                                ; 1111 _ 01. D0
        mov     byte [eax], 0                           ; 1113 _ C6. 00, 00
        jmp     ?_036                                   ; 1116 _ EB, 4C

?_034:  mov     eax, dword [ebp-8H]                     ; 1118 _ 8B. 45, F8
        shl     eax, 4                                  ; 111B _ C1. E0, 04
        mov     edx, eax                                ; 111E _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 1120 _ 8B. 45, FC
        add     eax, edx                                ; 1123 _ 01. D0
        add     eax, cursor.1752                        ; 1125 _ 05, 000000C0(d)
        movzx   eax, byte [eax]                         ; 112A _ 0F B6. 00
        cmp     al, 79                                  ; 112D _ 3C, 4F
        jnz     ?_035                                   ; 112F _ 75, 19
        mov     eax, dword [ebp-8H]                     ; 1131 _ 8B. 45, F8
        shl     eax, 4                                  ; 1134 _ C1. E0, 04
        mov     edx, eax                                ; 1137 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 1139 _ 8B. 45, FC
        add     eax, edx                                ; 113C _ 01. D0
        mov     edx, eax                                ; 113E _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 1140 _ 8B. 45, 08
        add     eax, edx                                ; 1143 _ 01. D0
        mov     byte [eax], 7                           ; 1145 _ C6. 00, 07
        jmp     ?_036                                   ; 1148 _ EB, 1A

?_035:  mov     eax, dword [ebp-8H]                     ; 114A _ 8B. 45, F8
        shl     eax, 4                                  ; 114D _ C1. E0, 04
        mov     edx, eax                                ; 1150 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 1152 _ 8B. 45, FC
        add     eax, edx                                ; 1155 _ 01. D0
        mov     edx, eax                                ; 1157 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 1159 _ 8B. 45, 08
        add     edx, eax                                ; 115C _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 115E _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 1162 _ 88. 02
?_036:  add     dword [ebp-4H], 1                       ; 1164 _ 83. 45, FC, 01
?_037:  cmp     dword [ebp-4H], 15                      ; 1168 _ 83. 7D, FC, 0F
        jle     ?_033                                   ; 116C _ 0F 8E, FFFFFF74
        add     dword [ebp-8H], 1                       ; 1172 _ 83. 45, F8, 01
?_038:  cmp     dword [ebp-8H], 15                      ; 1176 _ 83. 7D, F8, 0F
        jle     ?_032                                   ; 117A _ 0F 8E, FFFFFF5A
        leave                                           ; 1180 _ C9
        ret                                             ; 1181 _ C3
; init_mouse_cursor End of function

paint_block:; Function begin
        push    ebp                                     ; 1182 _ 55
        mov     ebp, esp                                ; 1183 _ 89. E5
        sub     esp, 16                                 ; 1185 _ 83. EC, 10
        mov     dword [ebp-8H], 0                       ; 1188 _ C7. 45, F8, 00000000
        jmp     ?_042                                   ; 118F _ EB, 50

?_039:  mov     dword [ebp-4H], 0                       ; 1191 _ C7. 45, FC, 00000000
        jmp     ?_041                                   ; 1198 _ EB, 3B

?_040:  mov     eax, dword [ebp-8H]                     ; 119A _ 8B. 45, F8
        mov     edx, dword [ebp+14H]                    ; 119D _ 8B. 55, 14
        add     eax, edx                                ; 11A0 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 11A2 _ 0F AF. 45, 0C
        mov     edx, dword [ebp-4H]                     ; 11A6 _ 8B. 55, FC
        mov     ecx, dword [ebp+10H]                    ; 11A9 _ 8B. 4D, 10
        add     edx, ecx                                ; 11AC _ 01. CA
        add     eax, edx                                ; 11AE _ 01. D0
        mov     edx, eax                                ; 11B0 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 11B2 _ 8B. 45, 08
        add     edx, eax                                ; 11B5 _ 01. C2
        mov     eax, dword [ebp-8H]                     ; 11B7 _ 8B. 45, F8
        imul    eax, dword [ebp+18H]                    ; 11BA _ 0F AF. 45, 18
        mov     ecx, eax                                ; 11BE _ 89. C1
        mov     eax, dword [ebp-4H]                     ; 11C0 _ 8B. 45, FC
        add     eax, ecx                                ; 11C3 _ 01. C8
        mov     ecx, eax                                ; 11C5 _ 89. C1
        mov     eax, dword [ebp+20H]                    ; 11C7 _ 8B. 45, 20
        add     eax, ecx                                ; 11CA _ 01. C8
        movzx   eax, byte [eax]                         ; 11CC _ 0F B6. 00
        mov     byte [edx], al                          ; 11CF _ 88. 02
        add     dword [ebp-4H], 1                       ; 11D1 _ 83. 45, FC, 01
?_041:  mov     eax, dword [ebp-4H]                     ; 11D5 _ 8B. 45, FC
        cmp     eax, dword [ebp+18H]                    ; 11D8 _ 3B. 45, 18
        jl      ?_040                                   ; 11DB _ 7C, BD
        add     dword [ebp-8H], 1                       ; 11DD _ 83. 45, F8, 01
?_042:  mov     eax, dword [ebp-8H]                     ; 11E1 _ 8B. 45, F8
        cmp     eax, dword [ebp+1CH]                    ; 11E4 _ 3B. 45, 1C
        jl      ?_039                                   ; 11E7 _ 7C, A8
        leave                                           ; 11E9 _ C9
        ret                                             ; 11EA _ C3
; paint_block End of function

init_fifo_buf:; Function begin
        push    ebp                                     ; 11EB _ 55
        mov     ebp, esp                                ; 11EC _ 89. E5
        sub     esp, 24                                 ; 11EE _ 83. EC, 18
        mov     dword [esp+0CH], 0                      ; 11F1 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], mousebuf                ; 11F9 _ C7. 44 24, 08, 00000000(d)
        mov     dword [esp+4H], 128                     ; 1201 _ C7. 44 24, 04, 00000080
        mov     dword [esp], mouseinfo                  ; 1209 _ C7. 04 24, 00000000(d)
        call    fifo8_init                              ; 1210 _ E8, FFFFFFFC(rel)
        mov     dword [esp+0CH], 0                      ; 1215 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], keybuf                  ; 121D _ C7. 44 24, 08, 00000000(d)
        mov     dword [esp+4H], 32                      ; 1225 _ C7. 44 24, 04, 00000020
        mov     dword [esp], keyinfo                    ; 122D _ C7. 04 24, 00000000(d)
        call    fifo8_init                              ; 1234 _ E8, FFFFFFFC(rel)
        leave                                           ; 1239 _ C9
        ret                                             ; 123A _ C3
; init_fifo_buf End of function

compute_mouse_position:; Function begin
        push    ebp                                     ; 123B _ 55
        mov     ebp, esp                                ; 123C _ 89. E5
        mov     eax, dword [ebp+10H]                    ; 123E _ 8B. 45, 10
        mov     edx, dword [eax+4H]                     ; 1241 _ 8B. 50, 04
        mov     eax, dword [mouse_x]                    ; 1244 _ A1, 00000228(d)
        add     eax, edx                                ; 1249 _ 01. D0
        mov     dword [mouse_x], eax                    ; 124B _ A3, 00000228(d)
        mov     eax, dword [ebp+10H]                    ; 1250 _ 8B. 45, 10
        mov     edx, dword [eax+8H]                     ; 1253 _ 8B. 50, 08
        mov     eax, dword [mouse_y]                    ; 1256 _ A1, 0000022C(d)
        add     eax, edx                                ; 125B _ 01. D0
        mov     dword [mouse_y], eax                    ; 125D _ A3, 0000022C(d)
        mov     eax, dword [mouse_x]                    ; 1262 _ A1, 00000228(d)
        test    eax, eax                                ; 1267 _ 85. C0
        jns     ?_043                                   ; 1269 _ 79, 0A
        mov     dword [mouse_x], 0                      ; 126B _ C7. 05, 00000228(d), 00000000
?_043:  mov     eax, dword [mouse_y]                    ; 1275 _ A1, 0000022C(d)
        test    eax, eax                                ; 127A _ 85. C0
        jns     ?_044                                   ; 127C _ 79, 0A
        mov     dword [mouse_y], 0                      ; 127E _ C7. 05, 0000022C(d), 00000000
?_044:  movzx   eax, word [?_198]                       ; 1288 _ 0F B7. 05, 00000104(d)
        cwde                                            ; 128F _ 98
        lea     edx, [eax-10H]                          ; 1290 _ 8D. 50, F0
        mov     eax, dword [mouse_x]                    ; 1293 _ A1, 00000228(d)
        cmp     edx, eax                                ; 1298 _ 39. C2
        jge     ?_045                                   ; 129A _ 7D, 10
        movzx   eax, word [?_198]                       ; 129C _ 0F B7. 05, 00000104(d)
        cwde                                            ; 12A3 _ 98
        sub     eax, 16                                 ; 12A4 _ 83. E8, 10
        mov     dword [mouse_x], eax                    ; 12A7 _ A3, 00000228(d)
?_045:  movzx   eax, word [?_198]                       ; 12AC _ 0F B7. 05, 00000104(d)
        cwde                                            ; 12B3 _ 98
        lea     edx, [eax-10H]                          ; 12B4 _ 8D. 50, F0
        mov     eax, dword [mouse_y]                    ; 12B7 _ A1, 0000022C(d)
        cmp     edx, eax                                ; 12BC _ 39. C2
        jge     ?_046                                   ; 12BE _ 7D, 10
        movzx   eax, word [?_198]                       ; 12C0 _ 0F B7. 05, 00000104(d)
        cwde                                            ; 12C7 _ 98
        sub     eax, 16                                 ; 12C8 _ 83. E8, 10
        mov     dword [mouse_y], eax                    ; 12CB _ A3, 0000022C(d)
?_046:  pop     ebp                                     ; 12D0 _ 5D
        ret                                             ; 12D1 _ C3
; compute_mouse_position End of function

show_mouse_info:; Function begin
        push    ebp                                     ; 12D2 _ 55
        mov     ebp, esp                                ; 12D3 _ 89. E5
        sub     esp, 40                                 ; 12D5 _ 83. EC, 28
        mov     byte [ebp-9H], 0                        ; 12D8 _ C6. 45, F7, 00
        call    io_sti                                  ; 12DC _ E8, FFFFFFFC(rel)
        mov     dword [esp], mouseinfo                  ; 12E1 _ C7. 04 24, 00000000(d)
        call    fifo8_get                               ; 12E8 _ E8, FFFFFFFC(rel)
        mov     byte [ebp-9H], al                       ; 12ED _ 88. 45, F7
        movzx   eax, byte [ebp-9H]                      ; 12F0 _ 0F B6. 45, F7
        mov     dword [esp+4H], eax                     ; 12F4 _ 89. 44 24, 04
        mov     dword [esp], mouse_send_info            ; 12F8 _ C7. 04 24, 00000000(d)
        call    mouse_decode                            ; 12FF _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 1304 _ 85. C0
        jz      ?_047                                   ; 1306 _ 74, 77
        mov     dword [esp+8H], mouse_send_info         ; 1308 _ C7. 44 24, 08, 00000000(d)
        mov     eax, dword [ebp+0CH]                    ; 1310 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 1313 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1317 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 131A _ 89. 04 24
        call    compute_mouse_position                  ; 131D _ E8, FFFFFFFC(rel)
        mov     edx, dword [mouse_y]                    ; 1322 _ 8B. 15, 0000022C(d)
        mov     eax, dword [mouse_x]                    ; 1328 _ A1, 00000228(d)
        mov     dword [esp+0CH], edx                    ; 132D _ 89. 54 24, 0C
        mov     dword [esp+8H], eax                     ; 1331 _ 89. 44 24, 08
        mov     eax, dword [ebp+10H]                    ; 1335 _ 8B. 45, 10
        mov     dword [esp+4H], eax                     ; 1338 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 133C _ 8B. 45, 08
        mov     dword [esp], eax                        ; 133F _ 89. 04 24
        call    sheet_slide                             ; 1342 _ E8, FFFFFFFC(rel)
        mov     eax, dword [mouse_send_info+0CH]        ; 1347 _ A1, 0000000C(d)
        and     eax, 01H                                ; 134C _ 83. E0, 01
        test    eax, eax                                ; 134F _ 85. C0
        jz      ?_047                                   ; 1351 _ 74, 2C
        mov     eax, dword [mouse_y]                    ; 1353 _ A1, 0000022C(d)
        lea     ecx, [eax-8H]                           ; 1358 _ 8D. 48, F8
        mov     eax, dword [mouse_x]                    ; 135B _ A1, 00000228(d)
        lea     edx, [eax-50H]                          ; 1360 _ 8D. 50, B0
        mov     eax, dword [sheet_win]                  ; 1363 _ A1, 00000224(d)
        mov     dword [esp+0CH], ecx                    ; 1368 _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 136C _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 1370 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1374 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1377 _ 89. 04 24
        call    sheet_slide                             ; 137A _ E8, FFFFFFFC(rel)
?_047:  leave                                           ; 137F _ C9
        ret                                             ; 1380 _ C3
; show_mouse_info End of function

show_memory_info:; Function begin
        push    ebp                                     ; 1381 _ 55
        mov     ebp, esp                                ; 1382 _ 89. E5
        sub     esp, 88                                 ; 1384 _ 83. EC, 58
        mov     dword [ebp-38H], 0                      ; 1387 _ C7. 45, C8, 00000000
        mov     dword [ebp-34H], 0                      ; 138E _ C7. 45, CC, 00000000
        mov     dword [ebp-30H], 104                    ; 1395 _ C7. 45, D0, 00000068
        mov     eax, dword [screen_info]                ; 139C _ A1, 00000100(d)
        mov     dword [ebp-2CH], eax                    ; 13A1 _ 89. 45, D4
        movzx   eax, word [?_198]                       ; 13A4 _ 0F B7. 05, 00000104(d)
        cwde                                            ; 13AB _ 98
        mov     dword [ebp-28H], eax                    ; 13AC _ 89. 45, D8
        movzx   eax, word [?_199]                       ; 13AF _ 0F B7. 05, 00000106(d)
        cwde                                            ; 13B6 _ 98
        mov     dword [ebp-24H], eax                    ; 13B7 _ 89. 45, DC
        mov     eax, dword [ebp+0CH]                    ; 13BA _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 13BD _ 8B. 00
        mov     edx, dword [ebp-24H]                    ; 13BF _ 8B. 55, DC
        mov     dword [esp+8H], edx                     ; 13C2 _ 89. 54 24, 08
        mov     edx, dword [ebp-28H]                    ; 13C6 _ 8B. 55, D8
        mov     dword [esp+4H], edx                     ; 13C9 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 13CD _ 89. 04 24
        call    init_desktop                            ; 13D0 _ E8, FFFFFFFC(rel)
        mov     dword [esp+14H], 7                      ; 13D5 _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_190                  ; 13DD _ C7. 44 24, 10, 00000018(d)
        mov     eax, dword [ebp-34H]                    ; 13E5 _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 13E8 _ 89. 44 24, 0C
        mov     eax, dword [ebp-38H]                    ; 13EC _ 8B. 45, C8
        mov     dword [esp+8H], eax                     ; 13EF _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 13F3 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 13F6 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 13FA _ 8B. 45, 08
        mov     dword [esp], eax                        ; 13FD _ 89. 04 24
        call    paint_string                            ; 1400 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+14H]                    ; 1405 _ 8B. 45, 14
        mov     dword [esp], eax                        ; 1408 _ 89. 04 24
        call    intToHexStr                             ; 140B _ E8, FFFFFFFC(rel)
        mov     dword [ebp-20H], eax                    ; 1410 _ 89. 45, E0
        mov     dword [esp+14H], 7                      ; 1413 _ C7. 44 24, 14, 00000007
        mov     eax, dword [ebp-20H]                    ; 141B _ 8B. 45, E0
        mov     dword [esp+10H], eax                    ; 141E _ 89. 44 24, 10
        mov     eax, dword [ebp-34H]                    ; 1422 _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 1425 _ 89. 44 24, 0C
        mov     eax, dword [ebp-30H]                    ; 1429 _ 8B. 45, D0
        mov     dword [esp+8H], eax                     ; 142C _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 1430 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 1433 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1437 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 143A _ 89. 04 24
        call    paint_string                            ; 143D _ E8, FFFFFFFC(rel)
        add     dword [ebp-34H], 16                     ; 1442 _ 83. 45, CC, 10
        mov     dword [esp+14H], 7                      ; 1446 _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_191                  ; 144E _ C7. 44 24, 10, 00000022(d)
        mov     eax, dword [ebp-34H]                    ; 1456 _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 1459 _ 89. 44 24, 0C
        mov     eax, dword [ebp-38H]                    ; 145D _ 8B. 45, C8
        mov     dword [esp+8H], eax                     ; 1460 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 1464 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 1467 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 146B _ 8B. 45, 08
        mov     dword [esp], eax                        ; 146E _ 89. 04 24
        call    paint_string                            ; 1471 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 1476 _ 8B. 45, 10
        mov     eax, dword [eax]                        ; 1479 _ 8B. 00
        mov     dword [esp], eax                        ; 147B _ 89. 04 24
        call    intToHexStr                             ; 147E _ E8, FFFFFFFC(rel)
        mov     dword [ebp-1CH], eax                    ; 1483 _ 89. 45, E4
        mov     dword [esp+14H], 7                      ; 1486 _ C7. 44 24, 14, 00000007
        mov     eax, dword [ebp-1CH]                    ; 148E _ 8B. 45, E4
        mov     dword [esp+10H], eax                    ; 1491 _ 89. 44 24, 10
        mov     eax, dword [ebp-34H]                    ; 1495 _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 1498 _ 89. 44 24, 0C
        mov     eax, dword [ebp-30H]                    ; 149C _ 8B. 45, D0
        mov     dword [esp+8H], eax                     ; 149F _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 14A3 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 14A6 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 14AA _ 8B. 45, 08
        mov     dword [esp], eax                        ; 14AD _ 89. 04 24
        call    paint_string                            ; 14B0 _ E8, FFFFFFFC(rel)
        add     dword [ebp-34H], 16                     ; 14B5 _ 83. 45, CC, 10
        mov     dword [esp+14H], 7                      ; 14B9 _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_192                  ; 14C1 _ C7. 44 24, 10, 0000002E(d)
        mov     eax, dword [ebp-34H]                    ; 14C9 _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 14CC _ 89. 44 24, 0C
        mov     eax, dword [ebp-38H]                    ; 14D0 _ 8B. 45, C8
        mov     dword [esp+8H], eax                     ; 14D3 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 14D7 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 14DA _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 14DE _ 8B. 45, 08
        mov     dword [esp], eax                        ; 14E1 _ 89. 04 24
        call    paint_string                            ; 14E4 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 14E9 _ 8B. 45, 10
        mov     eax, dword [eax+4H]                     ; 14EC _ 8B. 40, 04
        mov     dword [esp], eax                        ; 14EF _ 89. 04 24
        call    intToHexStr                             ; 14F2 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-18H], eax                    ; 14F7 _ 89. 45, E8
        mov     dword [esp+14H], 7                      ; 14FA _ C7. 44 24, 14, 00000007
        mov     eax, dword [ebp-18H]                    ; 1502 _ 8B. 45, E8
        mov     dword [esp+10H], eax                    ; 1505 _ 89. 44 24, 10
        mov     eax, dword [ebp-34H]                    ; 1509 _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 150C _ 89. 44 24, 0C
        mov     eax, dword [ebp-30H]                    ; 1510 _ 8B. 45, D0
        mov     dword [esp+8H], eax                     ; 1513 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 1517 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 151A _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 151E _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1521 _ 89. 04 24
        call    paint_string                            ; 1524 _ E8, FFFFFFFC(rel)
        add     dword [ebp-34H], 16                     ; 1529 _ 83. 45, CC, 10
        mov     dword [esp+14H], 7                      ; 152D _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_193                  ; 1535 _ C7. 44 24, 10, 0000003A(d)
        mov     eax, dword [ebp-34H]                    ; 153D _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 1540 _ 89. 44 24, 0C
        mov     eax, dword [ebp-38H]                    ; 1544 _ 8B. 45, C8
        mov     dword [esp+8H], eax                     ; 1547 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 154B _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 154E _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1552 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1555 _ 89. 04 24
        call    paint_string                            ; 1558 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 155D _ 8B. 45, 10
        mov     eax, dword [eax+8H]                     ; 1560 _ 8B. 40, 08
        mov     dword [esp], eax                        ; 1563 _ 89. 04 24
        call    intToHexStr                             ; 1566 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-14H], eax                    ; 156B _ 89. 45, EC
        mov     dword [esp+14H], 7                      ; 156E _ C7. 44 24, 14, 00000007
        mov     eax, dword [ebp-14H]                    ; 1576 _ 8B. 45, EC
        mov     dword [esp+10H], eax                    ; 1579 _ 89. 44 24, 10
        mov     eax, dword [ebp-34H]                    ; 157D _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 1580 _ 89. 44 24, 0C
        mov     eax, dword [ebp-30H]                    ; 1584 _ 8B. 45, D0
        mov     dword [esp+8H], eax                     ; 1587 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 158B _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 158E _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1592 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1595 _ 89. 04 24
        call    paint_string                            ; 1598 _ E8, FFFFFFFC(rel)
        add     dword [ebp-34H], 16                     ; 159D _ 83. 45, CC, 10
        mov     dword [esp+14H], 7                      ; 15A1 _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_194                  ; 15A9 _ C7. 44 24, 10, 00000046(d)
        mov     eax, dword [ebp-34H]                    ; 15B1 _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 15B4 _ 89. 44 24, 0C
        mov     eax, dword [ebp-38H]                    ; 15B8 _ 8B. 45, C8
        mov     dword [esp+8H], eax                     ; 15BB _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 15BF _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 15C2 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 15C6 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 15C9 _ 89. 04 24
        call    paint_string                            ; 15CC _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 15D1 _ 8B. 45, 10
        mov     eax, dword [eax+0CH]                    ; 15D4 _ 8B. 40, 0C
        mov     dword [esp], eax                        ; 15D7 _ 89. 04 24
        call    intToHexStr                             ; 15DA _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 15DF _ 89. 45, F0
        mov     dword [esp+14H], 7                      ; 15E2 _ C7. 44 24, 14, 00000007
        mov     eax, dword [ebp-10H]                    ; 15EA _ 8B. 45, F0
        mov     dword [esp+10H], eax                    ; 15ED _ 89. 44 24, 10
        mov     eax, dword [ebp-34H]                    ; 15F1 _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 15F4 _ 89. 44 24, 0C
        mov     eax, dword [ebp-30H]                    ; 15F8 _ 8B. 45, D0
        mov     dword [esp+8H], eax                     ; 15FB _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 15FF _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 1602 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1606 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1609 _ 89. 04 24
        call    paint_string                            ; 160C _ E8, FFFFFFFC(rel)
        add     dword [ebp-34H], 16                     ; 1611 _ 83. 45, CC, 10
        mov     dword [esp+14H], 7                      ; 1615 _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_195                  ; 161D _ C7. 44 24, 10, 00000053(d)
        mov     eax, dword [ebp-34H]                    ; 1625 _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 1628 _ 89. 44 24, 0C
        mov     eax, dword [ebp-38H]                    ; 162C _ 8B. 45, C8
        mov     dword [esp+8H], eax                     ; 162F _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 1633 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 1636 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 163A _ 8B. 45, 08
        mov     dword [esp], eax                        ; 163D _ 89. 04 24
        call    paint_string                            ; 1640 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 1645 _ 8B. 45, 10
        mov     eax, dword [eax+10H]                    ; 1648 _ 8B. 40, 10
        mov     dword [esp], eax                        ; 164B _ 89. 04 24
        call    intToHexStr                             ; 164E _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 1653 _ 89. 45, F4
        mov     dword [esp+14H], 7                      ; 1656 _ C7. 44 24, 14, 00000007
        mov     eax, dword [ebp-0CH]                    ; 165E _ 8B. 45, F4
        mov     dword [esp+10H], eax                    ; 1661 _ 89. 44 24, 10
        mov     eax, dword [ebp-34H]                    ; 1665 _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 1668 _ 89. 44 24, 0C
        mov     eax, dword [ebp-30H]                    ; 166C _ 8B. 45, D0
        mov     dword [esp+8H], eax                     ; 166F _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 1673 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 1676 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 167A _ 8B. 45, 08
        mov     dword [esp], eax                        ; 167D _ 89. 04 24
        call    paint_string                            ; 1680 _ E8, FFFFFFFC(rel)
        add     dword [ebp-34H], 16                     ; 1685 _ 83. 45, CC, 10
        leave                                           ; 1689 _ C9
        ret                                             ; 168A _ C3
; show_memory_info End of function

message_box:; Function begin
        push    ebp                                     ; 168B _ 55
        mov     ebp, esp                                ; 168C _ 89. E5
        sub     esp, 56                                 ; 168E _ 83. EC, 38
        mov     eax, dword [ebp+8H]                     ; 1691 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1694 _ 89. 04 24
        call    sheet_alloc                             ; 1697 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 169C _ 89. 45, F0
        mov     eax, dword [memman]                     ; 169F _ A1, 00000000(d)
        mov     dword [esp+4H], 10880                   ; 16A4 _ C7. 44 24, 04, 00002A80
        mov     dword [esp], eax                        ; 16AC _ 89. 04 24
        call    memman_alloc_4k                         ; 16AF _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 16B4 _ 89. 45, F4
        mov     dword [esp+10H], 99                     ; 16B7 _ C7. 44 24, 10, 00000063
        mov     dword [esp+0CH], 68                     ; 16BF _ C7. 44 24, 0C, 00000044
        mov     dword [esp+8H], 160                     ; 16C7 _ C7. 44 24, 08, 000000A0
        mov     eax, dword [ebp-0CH]                    ; 16CF _ 8B. 45, F4
        mov     dword [esp+4H], eax                     ; 16D2 _ 89. 44 24, 04
        mov     eax, dword [ebp-10H]                    ; 16D6 _ 8B. 45, F0
        mov     dword [esp], eax                        ; 16D9 _ 89. 04 24
        call    sheet_setbuf                            ; 16DC _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+0CH]                    ; 16E1 _ 8B. 45, 0C
        mov     dword [esp+8H], eax                     ; 16E4 _ 89. 44 24, 08
        mov     eax, dword [ebp-10H]                    ; 16E8 _ 8B. 45, F0
        mov     dword [esp+4H], eax                     ; 16EB _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 16EF _ 8B. 45, 08
        mov     dword [esp], eax                        ; 16F2 _ 89. 04 24
        call    make_windows                            ; 16F5 _ E8, FFFFFFFC(rel)
        mov     dword [esp+14H], 7                      ; 16FA _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], 16                     ; 1702 _ C7. 44 24, 10, 00000010
        mov     dword [esp+0CH], 144                    ; 170A _ C7. 44 24, 0C, 00000090
        mov     dword [esp+8H], 28                      ; 1712 _ C7. 44 24, 08, 0000001C
        mov     dword [esp+4H], 8                       ; 171A _ C7. 44 24, 04, 00000008
        mov     eax, dword [ebp-10H]                    ; 1722 _ 8B. 45, F0
        mov     dword [esp], eax                        ; 1725 _ 89. 04 24
        call    make_textbox                            ; 1728 _ E8, FFFFFFFC(rel)
        mov     dword [esp+0CH], 72                     ; 172D _ C7. 44 24, 0C, 00000048
        mov     dword [esp+8H], 80                      ; 1735 _ C7. 44 24, 08, 00000050
        mov     eax, dword [ebp-10H]                    ; 173D _ 8B. 45, F0
        mov     dword [esp+4H], eax                     ; 1740 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1744 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1747 _ 89. 04 24
        call    sheet_slide                             ; 174A _ E8, FFFFFFFC(rel)
        mov     dword [esp+8H], 2                       ; 174F _ C7. 44 24, 08, 00000002
        mov     eax, dword [ebp-10H]                    ; 1757 _ 8B. 45, F0
        mov     dword [esp+4H], eax                     ; 175A _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 175E _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1761 _ 89. 04 24
        call    sheet_updown                            ; 1764 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 1769 _ 8B. 45, F0
        leave                                           ; 176C _ C9
        ret                                             ; 176D _ C3
; message_box End of function

make_textbox:; Function begin
        push    ebp                                     ; 176E _ 55
        mov     ebp, esp                                ; 176F _ 89. E5
        push    edi                                     ; 1771 _ 57
        push    esi                                     ; 1772 _ 56
        push    ebx                                     ; 1773 _ 53
        sub     esp, 44                                 ; 1774 _ 83. EC, 2C
        mov     eax, dword [ebp+14H]                    ; 1777 _ 8B. 45, 14
        mov     edx, dword [ebp+0CH]                    ; 177A _ 8B. 55, 0C
        add     eax, edx                                ; 177D _ 01. D0
        mov     dword [ebp-14H], eax                    ; 177F _ 89. 45, EC
        mov     eax, dword [ebp+18H]                    ; 1782 _ 8B. 45, 18
        mov     edx, dword [ebp+10H]                    ; 1785 _ 8B. 55, 10
        add     eax, edx                                ; 1788 _ 01. D0
        mov     dword [ebp-10H], eax                    ; 178A _ 89. 45, F0
        mov     eax, dword [ebp+10H]                    ; 178D _ 8B. 45, 10
        lea     edi, [eax-3H]                           ; 1790 _ 8D. 78, FD
        mov     eax, dword [ebp-14H]                    ; 1793 _ 8B. 45, EC
        lea     esi, [eax+1H]                           ; 1796 _ 8D. 70, 01
        mov     eax, dword [ebp+10H]                    ; 1799 _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 179C _ 8D. 58, FD
        mov     eax, dword [ebp+0CH]                    ; 179F _ 8B. 45, 0C
        lea     ecx, [eax-2H]                           ; 17A2 _ 8D. 48, FE
        mov     eax, dword [ebp+8H]                     ; 17A5 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 17A8 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 17AB _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 17AE _ 8B. 00
        mov     dword [esp+18H], edi                    ; 17B0 _ 89. 7C 24, 18
        mov     dword [esp+14H], esi                    ; 17B4 _ 89. 74 24, 14
        mov     dword [esp+10H], ebx                    ; 17B8 _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 17BC _ 89. 4C 24, 0C
        mov     dword [esp+8H], 15                      ; 17C0 _ C7. 44 24, 08, 0000000F
        mov     dword [esp+4H], edx                     ; 17C8 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 17CC _ 89. 04 24
        call    paint_rectangle                         ; 17CF _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 17D4 _ 8B. 45, F0
        lea     edi, [eax+1H]                           ; 17D7 _ 8D. 78, 01
        mov     eax, dword [ebp+0CH]                    ; 17DA _ 8B. 45, 0C
        lea     esi, [eax-3H]                           ; 17DD _ 8D. 70, FD
        mov     eax, dword [ebp+10H]                    ; 17E0 _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 17E3 _ 8D. 58, FD
        mov     eax, dword [ebp+0CH]                    ; 17E6 _ 8B. 45, 0C
        lea     ecx, [eax-3H]                           ; 17E9 _ 8D. 48, FD
        mov     eax, dword [ebp+8H]                     ; 17EC _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 17EF _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 17F2 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 17F5 _ 8B. 00
        mov     dword [esp+18H], edi                    ; 17F7 _ 89. 7C 24, 18
        mov     dword [esp+14H], esi                    ; 17FB _ 89. 74 24, 14
        mov     dword [esp+10H], ebx                    ; 17FF _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 1803 _ 89. 4C 24, 0C
        mov     dword [esp+8H], 15                      ; 1807 _ C7. 44 24, 08, 0000000F
        mov     dword [esp+4H], edx                     ; 180F _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1813 _ 89. 04 24
        call    paint_rectangle                         ; 1816 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 181B _ 8B. 45, F0
        lea     edi, [eax+2H]                           ; 181E _ 8D. 78, 02
        mov     eax, dword [ebp-14H]                    ; 1821 _ 8B. 45, EC
        lea     esi, [eax+1H]                           ; 1824 _ 8D. 70, 01
        mov     eax, dword [ebp-10H]                    ; 1827 _ 8B. 45, F0
        lea     ebx, [eax+2H]                           ; 182A _ 8D. 58, 02
        mov     eax, dword [ebp+0CH]                    ; 182D _ 8B. 45, 0C
        lea     ecx, [eax-3H]                           ; 1830 _ 8D. 48, FD
        mov     eax, dword [ebp+8H]                     ; 1833 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 1836 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1839 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 183C _ 8B. 00
        mov     dword [esp+18H], edi                    ; 183E _ 89. 7C 24, 18
        mov     dword [esp+14H], esi                    ; 1842 _ 89. 74 24, 14
        mov     dword [esp+10H], ebx                    ; 1846 _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 184A _ 89. 4C 24, 0C
        mov     dword [esp+8H], 7                       ; 184E _ C7. 44 24, 08, 00000007
        mov     dword [esp+4H], edx                     ; 1856 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 185A _ 89. 04 24
        call    paint_rectangle                         ; 185D _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 1862 _ 8B. 45, F0
        lea     edi, [eax+2H]                           ; 1865 _ 8D. 78, 02
        mov     eax, dword [ebp-14H]                    ; 1868 _ 8B. 45, EC
        lea     esi, [eax+2H]                           ; 186B _ 8D. 70, 02
        mov     eax, dword [ebp+10H]                    ; 186E _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 1871 _ 8D. 58, FD
        mov     eax, dword [ebp-14H]                    ; 1874 _ 8B. 45, EC
        lea     ecx, [eax+2H]                           ; 1877 _ 8D. 48, 02
        mov     eax, dword [ebp+8H]                     ; 187A _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 187D _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1880 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1883 _ 8B. 00
        mov     dword [esp+18H], edi                    ; 1885 _ 89. 7C 24, 18
        mov     dword [esp+14H], esi                    ; 1889 _ 89. 74 24, 14
        mov     dword [esp+10H], ebx                    ; 188D _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 1891 _ 89. 4C 24, 0C
        mov     dword [esp+8H], 7                       ; 1895 _ C7. 44 24, 08, 00000007
        mov     dword [esp+4H], edx                     ; 189D _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 18A1 _ 89. 04 24
        call    paint_rectangle                         ; 18A4 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 18A9 _ 8B. 45, 10
        lea     ecx, [eax-2H]                           ; 18AC _ 8D. 48, FE
        mov     eax, dword [ebp+10H]                    ; 18AF _ 8B. 45, 10
        lea     esi, [eax-2H]                           ; 18B2 _ 8D. 70, FE
        mov     eax, dword [ebp+0CH]                    ; 18B5 _ 8B. 45, 0C
        lea     ebx, [eax-1H]                           ; 18B8 _ 8D. 58, FF
        mov     eax, dword [ebp+8H]                     ; 18BB _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 18BE _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 18C1 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 18C4 _ 8B. 00
        mov     dword [esp+18H], ecx                    ; 18C6 _ 89. 4C 24, 18
        mov     ecx, dword [ebp-14H]                    ; 18CA _ 8B. 4D, EC
        mov     dword [esp+14H], ecx                    ; 18CD _ 89. 4C 24, 14
        mov     dword [esp+10H], esi                    ; 18D1 _ 89. 74 24, 10
        mov     dword [esp+0CH], ebx                    ; 18D5 _ 89. 5C 24, 0C
        mov     dword [esp+8H], 0                       ; 18D9 _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], edx                     ; 18E1 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 18E5 _ 89. 04 24
        call    paint_rectangle                         ; 18E8 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+0CH]                    ; 18ED _ 8B. 45, 0C
        lea     edi, [eax-2H]                           ; 18F0 _ 8D. 78, FE
        mov     eax, dword [ebp+10H]                    ; 18F3 _ 8B. 45, 10
        lea     esi, [eax-2H]                           ; 18F6 _ 8D. 70, FE
        mov     eax, dword [ebp+0CH]                    ; 18F9 _ 8B. 45, 0C
        lea     ebx, [eax-2H]                           ; 18FC _ 8D. 58, FE
        mov     eax, dword [ebp+8H]                     ; 18FF _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 1902 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1905 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1908 _ 8B. 00
        mov     ecx, dword [ebp-10H]                    ; 190A _ 8B. 4D, F0
        mov     dword [esp+18H], ecx                    ; 190D _ 89. 4C 24, 18
        mov     dword [esp+14H], edi                    ; 1911 _ 89. 7C 24, 14
        mov     dword [esp+10H], esi                    ; 1915 _ 89. 74 24, 10
        mov     dword [esp+0CH], ebx                    ; 1919 _ 89. 5C 24, 0C
        mov     dword [esp+8H], 0                       ; 191D _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], edx                     ; 1925 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1929 _ 89. 04 24
        call    paint_rectangle                         ; 192C _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 1931 _ 8B. 45, F0
        lea     ecx, [eax+1H]                           ; 1934 _ 8D. 48, 01
        mov     eax, dword [ebp-10H]                    ; 1937 _ 8B. 45, F0
        lea     esi, [eax+1H]                           ; 193A _ 8D. 70, 01
        mov     eax, dword [ebp+0CH]                    ; 193D _ 8B. 45, 0C
        lea     ebx, [eax-2H]                           ; 1940 _ 8D. 58, FE
        mov     eax, dword [ebp+8H]                     ; 1943 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 1946 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1949 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 194C _ 8B. 00
        mov     dword [esp+18H], ecx                    ; 194E _ 89. 4C 24, 18
        mov     ecx, dword [ebp-14H]                    ; 1952 _ 8B. 4D, EC
        mov     dword [esp+14H], ecx                    ; 1955 _ 89. 4C 24, 14
        mov     dword [esp+10H], esi                    ; 1959 _ 89. 74 24, 10
        mov     dword [esp+0CH], ebx                    ; 195D _ 89. 5C 24, 0C
        mov     dword [esp+8H], 8                       ; 1961 _ C7. 44 24, 08, 00000008
        mov     dword [esp+4H], edx                     ; 1969 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 196D _ 89. 04 24
        call    paint_rectangle                         ; 1970 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 1975 _ 8B. 45, F0
        lea     edi, [eax+1H]                           ; 1978 _ 8D. 78, 01
        mov     eax, dword [ebp-14H]                    ; 197B _ 8B. 45, EC
        lea     esi, [eax+1H]                           ; 197E _ 8D. 70, 01
        mov     eax, dword [ebp+10H]                    ; 1981 _ 8B. 45, 10
        lea     ebx, [eax-2H]                           ; 1984 _ 8D. 58, FE
        mov     eax, dword [ebp-14H]                    ; 1987 _ 8B. 45, EC
        lea     ecx, [eax+1H]                           ; 198A _ 8D. 48, 01
        mov     eax, dword [ebp+8H]                     ; 198D _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 1990 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1993 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1996 _ 8B. 00
        mov     dword [esp+18H], edi                    ; 1998 _ 89. 7C 24, 18
        mov     dword [esp+14H], esi                    ; 199C _ 89. 74 24, 14
        mov     dword [esp+10H], ebx                    ; 19A0 _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 19A4 _ 89. 4C 24, 0C
        mov     dword [esp+8H], 8                       ; 19A8 _ C7. 44 24, 08, 00000008
        mov     dword [esp+4H], edx                     ; 19B0 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 19B4 _ 89. 04 24
        call    paint_rectangle                         ; 19B7 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 19BC _ 8B. 45, 10
        lea     edi, [eax-1H]                           ; 19BF _ 8D. 78, FF
        mov     eax, dword [ebp+0CH]                    ; 19C2 _ 8B. 45, 0C
        lea     esi, [eax-1H]                           ; 19C5 _ 8D. 70, FF
        mov     eax, dword [ebp+1CH]                    ; 19C8 _ 8B. 45, 1C
        movzx   ecx, al                                 ; 19CB _ 0F B6. C8
        mov     eax, dword [ebp+8H]                     ; 19CE _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 19D1 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 19D4 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 19D7 _ 8B. 00
        mov     ebx, dword [ebp-10H]                    ; 19D9 _ 8B. 5D, F0
        mov     dword [esp+18H], ebx                    ; 19DC _ 89. 5C 24, 18
        mov     ebx, dword [ebp-14H]                    ; 19E0 _ 8B. 5D, EC
        mov     dword [esp+14H], ebx                    ; 19E3 _ 89. 5C 24, 14
        mov     dword [esp+10H], edi                    ; 19E7 _ 89. 7C 24, 10
        mov     dword [esp+0CH], esi                    ; 19EB _ 89. 74 24, 0C
        mov     dword [esp+8H], ecx                     ; 19EF _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 19F3 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 19F7 _ 89. 04 24
        call    paint_rectangle                         ; 19FA _ E8, FFFFFFFC(rel)
        add     esp, 44                                 ; 19FF _ 83. C4, 2C
        pop     ebx                                     ; 1A02 _ 5B
        pop     esi                                     ; 1A03 _ 5E
        pop     edi                                     ; 1A04 _ 5F
        pop     ebp                                     ; 1A05 _ 5D
        ret                                             ; 1A06 _ C3
; make_textbox End of function

make_windows:; Function begin
        push    ebp                                     ; 1A07 _ 55
        mov     ebp, esp                                ; 1A08 _ 89. E5
        push    ebx                                     ; 1A0A _ 53
        sub     esp, 68                                 ; 1A0B _ 83. EC, 44
        mov     eax, dword [ebp+0CH]                    ; 1A0E _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 1A11 _ 8B. 40, 04
        mov     dword [ebp-10H], eax                    ; 1A14 _ 89. 45, F0
        mov     eax, dword [ebp+0CH]                    ; 1A17 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 1A1A _ 8B. 40, 08
        mov     dword [ebp-0CH], eax                    ; 1A1D _ 89. 45, F4
        mov     eax, dword [ebp-10H]                    ; 1A20 _ 8B. 45, F0
        lea     edx, [eax-1H]                           ; 1A23 _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 1A26 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1A29 _ 8B. 00
        mov     dword [esp+18H], 0                      ; 1A2B _ C7. 44 24, 18, 00000000
        mov     dword [esp+14H], edx                    ; 1A33 _ 89. 54 24, 14
        mov     dword [esp+10H], 0                      ; 1A37 _ C7. 44 24, 10, 00000000
        mov     dword [esp+0CH], 0                      ; 1A3F _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 8                       ; 1A47 _ C7. 44 24, 08, 00000008
        mov     edx, dword [ebp-10H]                    ; 1A4F _ 8B. 55, F0
        mov     dword [esp+4H], edx                     ; 1A52 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1A56 _ 89. 04 24
        call    paint_rectangle                         ; 1A59 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 1A5E _ 8B. 45, F0
        lea     edx, [eax-2H]                           ; 1A61 _ 8D. 50, FE
        mov     eax, dword [ebp+0CH]                    ; 1A64 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1A67 _ 8B. 00
        mov     dword [esp+18H], 1                      ; 1A69 _ C7. 44 24, 18, 00000001
        mov     dword [esp+14H], edx                    ; 1A71 _ 89. 54 24, 14
        mov     dword [esp+10H], 1                      ; 1A75 _ C7. 44 24, 10, 00000001
        mov     dword [esp+0CH], 1                      ; 1A7D _ C7. 44 24, 0C, 00000001
        mov     dword [esp+8H], 7                       ; 1A85 _ C7. 44 24, 08, 00000007
        mov     edx, dword [ebp-10H]                    ; 1A8D _ 8B. 55, F0
        mov     dword [esp+4H], edx                     ; 1A90 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1A94 _ 89. 04 24
        call    paint_rectangle                         ; 1A97 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 1A9C _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 1A9F _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 1AA2 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1AA5 _ 8B. 00
        mov     dword [esp+18H], edx                    ; 1AA7 _ 89. 54 24, 18
        mov     dword [esp+14H], 0                      ; 1AAB _ C7. 44 24, 14, 00000000
        mov     dword [esp+10H], 0                      ; 1AB3 _ C7. 44 24, 10, 00000000
        mov     dword [esp+0CH], 0                      ; 1ABB _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 8                       ; 1AC3 _ C7. 44 24, 08, 00000008
        mov     edx, dword [ebp-10H]                    ; 1ACB _ 8B. 55, F0
        mov     dword [esp+4H], edx                     ; 1ACE _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1AD2 _ 89. 04 24
        call    paint_rectangle                         ; 1AD5 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 1ADA _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 1ADD _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 1AE0 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1AE3 _ 8B. 00
        mov     dword [esp+18H], edx                    ; 1AE5 _ 89. 54 24, 18
        mov     dword [esp+14H], 1                      ; 1AE9 _ C7. 44 24, 14, 00000001
        mov     dword [esp+10H], 1                      ; 1AF1 _ C7. 44 24, 10, 00000001
        mov     dword [esp+0CH], 1                      ; 1AF9 _ C7. 44 24, 0C, 00000001
        mov     dword [esp+8H], 7                       ; 1B01 _ C7. 44 24, 08, 00000007
        mov     edx, dword [ebp-10H]                    ; 1B09 _ 8B. 55, F0
        mov     dword [esp+4H], edx                     ; 1B0C _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1B10 _ 89. 04 24
        call    paint_rectangle                         ; 1B13 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 1B18 _ 8B. 45, F4
        lea     ebx, [eax-2H]                           ; 1B1B _ 8D. 58, FE
        mov     eax, dword [ebp-10H]                    ; 1B1E _ 8B. 45, F0
        lea     ecx, [eax-2H]                           ; 1B21 _ 8D. 48, FE
        mov     eax, dword [ebp-10H]                    ; 1B24 _ 8B. 45, F0
        lea     edx, [eax-2H]                           ; 1B27 _ 8D. 50, FE
        mov     eax, dword [ebp+0CH]                    ; 1B2A _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1B2D _ 8B. 00
        mov     dword [esp+18H], ebx                    ; 1B2F _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 1B33 _ 89. 4C 24, 14
        mov     dword [esp+10H], 1                      ; 1B37 _ C7. 44 24, 10, 00000001
        mov     dword [esp+0CH], edx                    ; 1B3F _ 89. 54 24, 0C
        mov     dword [esp+8H], 15                      ; 1B43 _ C7. 44 24, 08, 0000000F
        mov     edx, dword [ebp-10H]                    ; 1B4B _ 8B. 55, F0
        mov     dword [esp+4H], edx                     ; 1B4E _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1B52 _ 89. 04 24
        call    paint_rectangle                         ; 1B55 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 1B5A _ 8B. 45, F4
        lea     ebx, [eax-1H]                           ; 1B5D _ 8D. 58, FF
        mov     eax, dword [ebp-10H]                    ; 1B60 _ 8B. 45, F0
        lea     ecx, [eax-1H]                           ; 1B63 _ 8D. 48, FF
        mov     eax, dword [ebp-10H]                    ; 1B66 _ 8B. 45, F0
        lea     edx, [eax-1H]                           ; 1B69 _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 1B6C _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1B6F _ 8B. 00
        mov     dword [esp+18H], ebx                    ; 1B71 _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 1B75 _ 89. 4C 24, 14
        mov     dword [esp+10H], 0                      ; 1B79 _ C7. 44 24, 10, 00000000
        mov     dword [esp+0CH], edx                    ; 1B81 _ 89. 54 24, 0C
        mov     dword [esp+8H], 0                       ; 1B85 _ C7. 44 24, 08, 00000000
        mov     edx, dword [ebp-10H]                    ; 1B8D _ 8B. 55, F0
        mov     dword [esp+4H], edx                     ; 1B90 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1B94 _ 89. 04 24
        call    paint_rectangle                         ; 1B97 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 1B9C _ 8B. 45, F4
        lea     ecx, [eax-3H]                           ; 1B9F _ 8D. 48, FD
        mov     eax, dword [ebp-10H]                    ; 1BA2 _ 8B. 45, F0
        lea     edx, [eax-3H]                           ; 1BA5 _ 8D. 50, FD
        mov     eax, dword [ebp+0CH]                    ; 1BA8 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1BAB _ 8B. 00
        mov     dword [esp+18H], ecx                    ; 1BAD _ 89. 4C 24, 18
        mov     dword [esp+14H], edx                    ; 1BB1 _ 89. 54 24, 14
        mov     dword [esp+10H], 2                      ; 1BB5 _ C7. 44 24, 10, 00000002
        mov     dword [esp+0CH], 2                      ; 1BBD _ C7. 44 24, 0C, 00000002
        mov     dword [esp+8H], 8                       ; 1BC5 _ C7. 44 24, 08, 00000008
        mov     edx, dword [ebp-10H]                    ; 1BCD _ 8B. 55, F0
        mov     dword [esp+4H], edx                     ; 1BD0 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1BD4 _ 89. 04 24
        call    paint_rectangle                         ; 1BD7 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 1BDC _ 8B. 45, F0
        lea     edx, [eax-4H]                           ; 1BDF _ 8D. 50, FC
        mov     eax, dword [ebp+0CH]                    ; 1BE2 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1BE5 _ 8B. 00
        mov     dword [esp+18H], 20                     ; 1BE7 _ C7. 44 24, 18, 00000014
        mov     dword [esp+14H], edx                    ; 1BEF _ 89. 54 24, 14
        mov     dword [esp+10H], 3                      ; 1BF3 _ C7. 44 24, 10, 00000003
        mov     dword [esp+0CH], 3                      ; 1BFB _ C7. 44 24, 0C, 00000003
        mov     dword [esp+8H], 12                      ; 1C03 _ C7. 44 24, 08, 0000000C
        mov     edx, dword [ebp-10H]                    ; 1C0B _ 8B. 55, F0
        mov     dword [esp+4H], edx                     ; 1C0E _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1C12 _ 89. 04 24
        call    paint_rectangle                         ; 1C15 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 1C1A _ 8B. 45, F4
        lea     ebx, [eax-2H]                           ; 1C1D _ 8D. 58, FE
        mov     eax, dword [ebp-10H]                    ; 1C20 _ 8B. 45, F0
        lea     ecx, [eax-2H]                           ; 1C23 _ 8D. 48, FE
        mov     eax, dword [ebp-0CH]                    ; 1C26 _ 8B. 45, F4
        lea     edx, [eax-2H]                           ; 1C29 _ 8D. 50, FE
        mov     eax, dword [ebp+0CH]                    ; 1C2C _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1C2F _ 8B. 00
        mov     dword [esp+18H], ebx                    ; 1C31 _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 1C35 _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 1C39 _ 89. 54 24, 10
        mov     dword [esp+0CH], 1                      ; 1C3D _ C7. 44 24, 0C, 00000001
        mov     dword [esp+8H], 15                      ; 1C45 _ C7. 44 24, 08, 0000000F
        mov     edx, dword [ebp-10H]                    ; 1C4D _ 8B. 55, F0
        mov     dword [esp+4H], edx                     ; 1C50 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1C54 _ 89. 04 24
        call    paint_rectangle                         ; 1C57 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 1C5C _ 8B. 45, F4
        lea     ebx, [eax-1H]                           ; 1C5F _ 8D. 58, FF
        mov     eax, dword [ebp-10H]                    ; 1C62 _ 8B. 45, F0
        lea     ecx, [eax-1H]                           ; 1C65 _ 8D. 48, FF
        mov     eax, dword [ebp-0CH]                    ; 1C68 _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 1C6B _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 1C6E _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1C71 _ 8B. 00
        mov     dword [esp+18H], ebx                    ; 1C73 _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 1C77 _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 1C7B _ 89. 54 24, 10
        mov     dword [esp+0CH], 0                      ; 1C7F _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 0                       ; 1C87 _ C7. 44 24, 08, 00000000
        mov     edx, dword [ebp-10H]                    ; 1C8F _ 8B. 55, F0
        mov     dword [esp+4H], edx                     ; 1C92 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1C96 _ 89. 04 24
        call    paint_rectangle                         ; 1C99 _ E8, FFFFFFFC(rel)
        mov     dword [esp+14H], 7                      ; 1C9E _ C7. 44 24, 14, 00000007
        mov     eax, dword [ebp+10H]                    ; 1CA6 _ 8B. 45, 10
        mov     dword [esp+10H], eax                    ; 1CA9 _ 89. 44 24, 10
        mov     dword [esp+0CH], 4                      ; 1CAD _ C7. 44 24, 0C, 00000004
        mov     dword [esp+8H], 24                      ; 1CB5 _ C7. 44 24, 08, 00000018
        mov     eax, dword [ebp+0CH]                    ; 1CBD _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 1CC0 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1CC4 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1CC7 _ 89. 04 24
        call    paint_string                            ; 1CCA _ E8, FFFFFFFC(rel)
        mov     dword [ebp-14H], 0                      ; 1CCF _ C7. 45, EC, 00000000
        jmp     ?_055                                   ; 1CD6 _ E9, 00000083

?_048:  mov     dword [ebp-18H], 0                      ; 1CDB _ C7. 45, E8, 00000000
        jmp     ?_054                                   ; 1CE2 _ EB, 70

?_049:  mov     eax, dword [ebp-14H]                    ; 1CE4 _ 8B. 45, EC
        shl     eax, 4                                  ; 1CE7 _ C1. E0, 04
        mov     edx, eax                                ; 1CEA _ 89. C2
        mov     eax, dword [ebp-18H]                    ; 1CEC _ 8B. 45, E8
        add     eax, edx                                ; 1CEF _ 01. D0
        add     eax, closebtn.1830                      ; 1CF1 _ 05, 000001C0(d)
        movzx   eax, byte [eax]                         ; 1CF6 _ 0F B6. 00
        mov     byte [ebp-19H], al                      ; 1CF9 _ 88. 45, E7
        cmp     byte [ebp-19H], 64                      ; 1CFC _ 80. 7D, E7, 40
        jnz     ?_050                                   ; 1D00 _ 75, 06
        mov     byte [ebp-19H], 0                       ; 1D02 _ C6. 45, E7, 00
        jmp     ?_053                                   ; 1D06 _ EB, 1C

?_050:  cmp     byte [ebp-19H], 36                      ; 1D08 _ 80. 7D, E7, 24
        jnz     ?_051                                   ; 1D0C _ 75, 06
        mov     byte [ebp-19H], 15                      ; 1D0E _ C6. 45, E7, 0F
        jmp     ?_053                                   ; 1D12 _ EB, 10

?_051:  cmp     byte [ebp-19H], 81                      ; 1D14 _ 80. 7D, E7, 51
        jnz     ?_052                                   ; 1D18 _ 75, 06
        mov     byte [ebp-19H], 8                       ; 1D1A _ C6. 45, E7, 08
        jmp     ?_053                                   ; 1D1E _ EB, 04

?_052:  mov     byte [ebp-19H], 7                       ; 1D20 _ C6. 45, E7, 07
?_053:  mov     eax, dword [ebp+0CH]                    ; 1D24 _ 8B. 45, 0C
        mov     edx, dword [eax]                        ; 1D27 _ 8B. 10
        mov     eax, dword [ebp-14H]                    ; 1D29 _ 8B. 45, EC
        lea     ecx, [eax+5H]                           ; 1D2C _ 8D. 48, 05
        mov     eax, dword [ebp+0CH]                    ; 1D2F _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 1D32 _ 8B. 40, 04
        imul    ecx, eax                                ; 1D35 _ 0F AF. C8
        mov     eax, dword [ebp+0CH]                    ; 1D38 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 1D3B _ 8B. 40, 04
        lea     ebx, [eax-15H]                          ; 1D3E _ 8D. 58, EB
        mov     eax, dword [ebp-18H]                    ; 1D41 _ 8B. 45, E8
        add     eax, ebx                                ; 1D44 _ 01. D8
        add     eax, ecx                                ; 1D46 _ 01. C8
        add     edx, eax                                ; 1D48 _ 01. C2
        movzx   eax, byte [ebp-19H]                     ; 1D4A _ 0F B6. 45, E7
        mov     byte [edx], al                          ; 1D4E _ 88. 02
        add     dword [ebp-18H], 1                      ; 1D50 _ 83. 45, E8, 01
?_054:  cmp     dword [ebp-18H], 15                     ; 1D54 _ 83. 7D, E8, 0F
        jle     ?_049                                   ; 1D58 _ 7E, 8A
        add     dword [ebp-14H], 1                      ; 1D5A _ 83. 45, EC, 01
?_055:  cmp     dword [ebp-14H], 13                     ; 1D5E _ 83. 7D, EC, 0D
        jle     ?_048                                   ; 1D62 _ 0F 8E, FFFFFF73
        add     esp, 68                                 ; 1D68 _ 83. C4, 44
        pop     ebx                                     ; 1D6B _ 5B
        pop     ebp                                     ; 1D6C _ 5D
        ret                                             ; 1D6D _ C3
; make_windows End of function

wait_KBC_sendready:; Function begin
        push    ebp                                     ; 1D6E _ 55
        mov     ebp, esp                                ; 1D6F _ 89. E5
        sub     esp, 24                                 ; 1D71 _ 83. EC, 18
?_056:  mov     dword [esp], 100                        ; 1D74 _ C7. 04 24, 00000064
        call    io_in8                                  ; 1D7B _ E8, FFFFFFFC(rel)
        and     eax, 02H                                ; 1D80 _ 83. E0, 02
        test    eax, eax                                ; 1D83 _ 85. C0
        jnz     ?_057                                   ; 1D85 _ 75, 02
        jmp     ?_058                                   ; 1D87 _ EB, 02

?_057:  jmp     ?_056                                   ; 1D89 _ EB, E9

?_058:  leave                                           ; 1D8B _ C9
        ret                                             ; 1D8C _ C3
; wait_KBC_sendready End of function

init_keyboard:; Function begin
        push    ebp                                     ; 1D8D _ 55
        mov     ebp, esp                                ; 1D8E _ 89. E5
        sub     esp, 24                                 ; 1D90 _ 83. EC, 18
        call    wait_KBC_sendready                      ; 1D93 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 96                      ; 1D98 _ C7. 44 24, 04, 00000060
        mov     dword [esp], 100                        ; 1DA0 _ C7. 04 24, 00000064
        call    io_out8                                 ; 1DA7 _ E8, FFFFFFFC(rel)
        call    wait_KBC_sendready                      ; 1DAC _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 71                      ; 1DB1 _ C7. 44 24, 04, 00000047
        mov     dword [esp], 96                         ; 1DB9 _ C7. 04 24, 00000060
        call    io_out8                                 ; 1DC0 _ E8, FFFFFFFC(rel)
        leave                                           ; 1DC5 _ C9
        ret                                             ; 1DC6 _ C3
; init_keyboard End of function

enable_mouse:; Function begin
        push    ebp                                     ; 1DC7 _ 55
        mov     ebp, esp                                ; 1DC8 _ 89. E5
        sub     esp, 24                                 ; 1DCA _ 83. EC, 18
        call    wait_KBC_sendready                      ; 1DCD _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 212                     ; 1DD2 _ C7. 44 24, 04, 000000D4
        mov     dword [esp], 100                        ; 1DDA _ C7. 04 24, 00000064
        call    io_out8                                 ; 1DE1 _ E8, FFFFFFFC(rel)
        call    wait_KBC_sendready                      ; 1DE6 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 244                     ; 1DEB _ C7. 44 24, 04, 000000F4
        mov     dword [esp], 96                         ; 1DF3 _ C7. 04 24, 00000060
        call    io_out8                                 ; 1DFA _ E8, FFFFFFFC(rel)
        leave                                           ; 1DFF _ C9
        ret                                             ; 1E00 _ C3
; enable_mouse End of function

mouse_decode:; Function begin
        push    ebp                                     ; 1E01 _ 55
        mov     ebp, esp                                ; 1E02 _ 89. E5
        sub     esp, 4                                  ; 1E04 _ 83. EC, 04
        mov     eax, dword [ebp+0CH]                    ; 1E07 _ 8B. 45, 0C
        mov     byte [ebp-4H], al                       ; 1E0A _ 88. 45, FC
        mov     eax, dword [ebp+8H]                     ; 1E0D _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 1E10 _ 0F B6. 40, 03
        test    al, al                                  ; 1E14 _ 84. C0
        jnz     ?_060                                   ; 1E16 _ 75, 17
        cmp     byte [ebp-4H], -6                       ; 1E18 _ 80. 7D, FC, FA
        jnz     ?_059                                   ; 1E1C _ 75, 07
        mov     eax, dword [ebp+8H]                     ; 1E1E _ 8B. 45, 08
        mov     byte [eax+3H], 1                        ; 1E21 _ C6. 40, 03, 01
?_059:  mov     eax, 0                                  ; 1E25 _ B8, 00000000
        jmp     ?_067                                   ; 1E2A _ E9, 0000010F

?_060:  mov     eax, dword [ebp+8H]                     ; 1E2F _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 1E32 _ 0F B6. 40, 03
        cmp     al, 1                                   ; 1E36 _ 3C, 01
        jnz     ?_062                                   ; 1E38 _ 75, 28
        movzx   eax, byte [ebp-4H]                      ; 1E3A _ 0F B6. 45, FC
        and     eax, 0C8H                               ; 1E3E _ 25, 000000C8
        cmp     eax, 8                                  ; 1E43 _ 83. F8, 08
        jnz     ?_061                                   ; 1E46 _ 75, 10
        mov     eax, dword [ebp+8H]                     ; 1E48 _ 8B. 45, 08
        movzx   edx, byte [ebp-4H]                      ; 1E4B _ 0F B6. 55, FC
        mov     byte [eax], dl                          ; 1E4F _ 88. 10
        mov     eax, dword [ebp+8H]                     ; 1E51 _ 8B. 45, 08
        mov     byte [eax+3H], 2                        ; 1E54 _ C6. 40, 03, 02
?_061:  mov     eax, 0                                  ; 1E58 _ B8, 00000000
        jmp     ?_067                                   ; 1E5D _ E9, 000000DC

?_062:  mov     eax, dword [ebp+8H]                     ; 1E62 _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 1E65 _ 0F B6. 40, 03
        cmp     al, 2                                   ; 1E69 _ 3C, 02
        jnz     ?_063                                   ; 1E6B _ 75, 1B
        mov     eax, dword [ebp+8H]                     ; 1E6D _ 8B. 45, 08
        movzx   edx, byte [ebp-4H]                      ; 1E70 _ 0F B6. 55, FC
        mov     byte [eax+1H], dl                       ; 1E74 _ 88. 50, 01
        mov     eax, dword [ebp+8H]                     ; 1E77 _ 8B. 45, 08
        mov     byte [eax+3H], 3                        ; 1E7A _ C6. 40, 03, 03
        mov     eax, 0                                  ; 1E7E _ B8, 00000000
        jmp     ?_067                                   ; 1E83 _ E9, 000000B6

?_063:  mov     eax, dword [ebp+8H]                     ; 1E88 _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 1E8B _ 0F B6. 40, 03
        cmp     al, 3                                   ; 1E8F _ 3C, 03
        jne     ?_066                                   ; 1E91 _ 0F 85, 000000A2
        mov     eax, dword [ebp+8H]                     ; 1E97 _ 8B. 45, 08
        movzx   edx, byte [ebp-4H]                      ; 1E9A _ 0F B6. 55, FC
        mov     byte [eax+2H], dl                       ; 1E9E _ 88. 50, 02
        mov     eax, dword [ebp+8H]                     ; 1EA1 _ 8B. 45, 08
        mov     byte [eax+3H], 1                        ; 1EA4 _ C6. 40, 03, 01
        mov     eax, dword [ebp+8H]                     ; 1EA8 _ 8B. 45, 08
        movzx   eax, byte [eax]                         ; 1EAB _ 0F B6. 00
        movzx   eax, al                                 ; 1EAE _ 0F B6. C0
        and     eax, 07H                                ; 1EB1 _ 83. E0, 07
        mov     edx, eax                                ; 1EB4 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 1EB6 _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 1EB9 _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 1EBC _ 8B. 45, 08
        movzx   eax, byte [eax+1H]                      ; 1EBF _ 0F B6. 40, 01
        movzx   edx, al                                 ; 1EC3 _ 0F B6. D0
        mov     eax, dword [ebp+8H]                     ; 1EC6 _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 1EC9 _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1ECC _ 8B. 45, 08
        movzx   eax, byte [eax+2H]                      ; 1ECF _ 0F B6. 40, 02
        movzx   edx, al                                 ; 1ED3 _ 0F B6. D0
        mov     eax, dword [ebp+8H]                     ; 1ED6 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 1ED9 _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 1EDC _ 8B. 45, 08
        movzx   eax, byte [eax]                         ; 1EDF _ 0F B6. 00
        movzx   eax, al                                 ; 1EE2 _ 0F B6. C0
        and     eax, 10H                                ; 1EE5 _ 83. E0, 10
        test    eax, eax                                ; 1EE8 _ 85. C0
        jz      ?_064                                   ; 1EEA _ 74, 13
        mov     eax, dword [ebp+8H]                     ; 1EEC _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 1EEF _ 8B. 40, 04
        or      eax, 0FFFFFF00H                         ; 1EF2 _ 0D, FFFFFF00
        mov     edx, eax                                ; 1EF7 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 1EF9 _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 1EFC _ 89. 50, 04
?_064:  mov     eax, dword [ebp+8H]                     ; 1EFF _ 8B. 45, 08
        movzx   eax, byte [eax]                         ; 1F02 _ 0F B6. 00
        movzx   eax, al                                 ; 1F05 _ 0F B6. C0
        and     eax, 20H                                ; 1F08 _ 83. E0, 20
        test    eax, eax                                ; 1F0B _ 85. C0
        jz      ?_065                                   ; 1F0D _ 74, 13
        mov     eax, dword [ebp+8H]                     ; 1F0F _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 1F12 _ 8B. 40, 08
        or      eax, 0FFFFFF00H                         ; 1F15 _ 0D, FFFFFF00
        mov     edx, eax                                ; 1F1A _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 1F1C _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 1F1F _ 89. 50, 08
?_065:  mov     eax, dword [ebp+8H]                     ; 1F22 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 1F25 _ 8B. 40, 08
        neg     eax                                     ; 1F28 _ F7. D8
        mov     edx, eax                                ; 1F2A _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 1F2C _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 1F2F _ 89. 50, 08
        mov     eax, 1                                  ; 1F32 _ B8, 00000001
        jmp     ?_067                                   ; 1F37 _ EB, 05

?_066:  mov     eax, 4294967295                         ; 1F39 _ B8, FFFFFFFF
?_067:  leave                                           ; 1F3E _ C9
        ret                                             ; 1F3F _ C3
; mouse_decode End of function

intHandlerKeyboard:; Function begin
        push    ebp                                     ; 1F40 _ 55
        mov     ebp, esp                                ; 1F41 _ 89. E5
        sub     esp, 40                                 ; 1F43 _ 83. EC, 28
        mov     dword [esp+4H], 32                      ; 1F46 _ C7. 44 24, 04, 00000020
        mov     dword [esp], 32                         ; 1F4E _ C7. 04 24, 00000020
        call    io_out8                                 ; 1F55 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 32                      ; 1F5A _ C7. 44 24, 04, 00000020
        mov     dword [esp], 160                        ; 1F62 _ C7. 04 24, 000000A0
        call    io_out8                                 ; 1F69 _ E8, FFFFFFFC(rel)
        mov     dword [esp], 96                         ; 1F6E _ C7. 04 24, 00000060
        call    io_in8                                  ; 1F75 _ E8, FFFFFFFC(rel)
        mov     byte [ebp-9H], al                       ; 1F7A _ 88. 45, F7
        movzx   eax, byte [ebp-9H]                      ; 1F7D _ 0F B6. 45, F7
        mov     dword [esp+4H], eax                     ; 1F81 _ 89. 44 24, 04
        mov     dword [esp], keyinfo                    ; 1F85 _ C7. 04 24, 00000000(d)
        call    fifo8_put                               ; 1F8C _ E8, FFFFFFFC(rel)
        leave                                           ; 1F91 _ C9
        ret                                             ; 1F92 _ C3
; intHandlerKeyboard End of function

intHandlerMouse:; Function begin
        push    ebp                                     ; 1F93 _ 55
        mov     ebp, esp                                ; 1F94 _ 89. E5
        sub     esp, 40                                 ; 1F96 _ 83. EC, 28
        mov     dword [esp+4H], 32                      ; 1F99 _ C7. 44 24, 04, 00000020
        mov     dword [esp], 32                         ; 1FA1 _ C7. 04 24, 00000020
        call    io_out8                                 ; 1FA8 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 32                      ; 1FAD _ C7. 44 24, 04, 00000020
        mov     dword [esp], 160                        ; 1FB5 _ C7. 04 24, 000000A0
        call    io_out8                                 ; 1FBC _ E8, FFFFFFFC(rel)
        mov     dword [esp], 96                         ; 1FC1 _ C7. 04 24, 00000060
        call    io_in8                                  ; 1FC8 _ E8, FFFFFFFC(rel)
        mov     byte [ebp-9H], al                       ; 1FCD _ 88. 45, F7
        movzx   eax, byte [ebp-9H]                      ; 1FD0 _ 0F B6. 45, F7
        mov     dword [esp+4H], eax                     ; 1FD4 _ 89. 44 24, 04
        mov     dword [esp], mouseinfo                  ; 1FD8 _ C7. 04 24, 00000000(d)
        call    fifo8_put                               ; 1FDF _ E8, FFFFFFFC(rel)
        leave                                           ; 1FE4 _ C9
        ret                                             ; 1FE5 _ C3
; intHandlerMouse End of function

fifo8_init:; Function begin
        push    ebp                                     ; 1FE6 _ 55
        mov     ebp, esp                                ; 1FE7 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 1FE9 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 1FEC _ 8B. 55, 10
        mov     dword [eax], edx                        ; 1FEF _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 1FF1 _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 1FF4 _ C7. 40, 04, 00000000
        mov     eax, dword [ebp+8H]                     ; 1FFB _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 1FFE _ C7. 40, 08, 00000000
        mov     eax, dword [ebp+8H]                     ; 2005 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 2008 _ 8B. 55, 0C
        mov     dword [eax+0CH], edx                    ; 200B _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 200E _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 2011 _ 8B. 55, 0C
        mov     dword [eax+10H], edx                    ; 2014 _ 89. 50, 10
        mov     eax, dword [ebp+8H]                     ; 2017 _ 8B. 45, 08
        mov     dword [eax+14H], 0                      ; 201A _ C7. 40, 14, 00000000
        mov     eax, dword [ebp+8H]                     ; 2021 _ 8B. 45, 08
        mov     edx, dword [ebp+14H]                    ; 2024 _ 8B. 55, 14
        mov     dword [eax+18H], edx                    ; 2027 _ 89. 50, 18
        pop     ebp                                     ; 202A _ 5D
        ret                                             ; 202B _ C3
; fifo8_init End of function

fifo8_put:; Function begin
        push    ebp                                     ; 202C _ 55
        mov     ebp, esp                                ; 202D _ 89. E5
        sub     esp, 40                                 ; 202F _ 83. EC, 28
        mov     eax, dword [ebp+0CH]                    ; 2032 _ 8B. 45, 0C
        mov     byte [ebp-1CH], al                      ; 2035 _ 88. 45, E4
        cmp     dword [ebp+8H], 0                       ; 2038 _ 83. 7D, 08, 00
        jnz     ?_068                                   ; 203C _ 75, 0A
        mov     eax, 4294967295                         ; 203E _ B8, FFFFFFFF
        jmp     ?_072                                   ; 2043 _ E9, 0000009E

?_068:  mov     eax, dword [ebp+8H]                     ; 2048 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 204B _ 8B. 40, 10
        test    eax, eax                                ; 204E _ 85. C0
        jnz     ?_069                                   ; 2050 _ 75, 18
        mov     eax, dword [ebp+8H]                     ; 2052 _ 8B. 45, 08
        mov     eax, dword [eax+14H]                    ; 2055 _ 8B. 40, 14
        or      eax, 01H                                ; 2058 _ 83. C8, 01
        mov     edx, eax                                ; 205B _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 205D _ 8B. 45, 08
        mov     dword [eax+14H], edx                    ; 2060 _ 89. 50, 14
        mov     eax, 4294967295                         ; 2063 _ B8, FFFFFFFF
        jmp     ?_072                                   ; 2068 _ EB, 7C

?_069:  mov     eax, dword [ebp+8H]                     ; 206A _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 206D _ 8B. 40, 04
        mov     dword [ebp-0CH], eax                    ; 2070 _ 89. 45, F4
        mov     eax, dword [ebp+8H]                     ; 2073 _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 2076 _ 8B. 10
        mov     eax, dword [ebp-0CH]                    ; 2078 _ 8B. 45, F4
        add     edx, eax                                ; 207B _ 01. C2
        movzx   eax, byte [ebp-1CH]                     ; 207D _ 0F B6. 45, E4
        mov     byte [edx], al                          ; 2081 _ 88. 02
        mov     eax, dword [ebp+8H]                     ; 2083 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 2086 _ 8B. 40, 04
        lea     edx, [eax+1H]                           ; 2089 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 208C _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 208F _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 2092 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 2095 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 2098 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 209B _ 8B. 40, 0C
        cmp     edx, eax                                ; 209E _ 39. C2
        jnz     ?_070                                   ; 20A0 _ 75, 0A
        mov     eax, dword [ebp+8H]                     ; 20A2 _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 20A5 _ C7. 40, 04, 00000000
?_070:  mov     eax, dword [ebp+8H]                     ; 20AC _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 20AF _ 8B. 40, 10
        lea     edx, [eax-1H]                           ; 20B2 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 20B5 _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 20B8 _ 89. 50, 10
        mov     eax, dword [ebp+8H]                     ; 20BB _ 8B. 45, 08
        mov     eax, dword [eax+18H]                    ; 20BE _ 8B. 40, 18
        test    eax, eax                                ; 20C1 _ 85. C0
        jz      ?_071                                   ; 20C3 _ 74, 1C
        mov     eax, dword [ebp+8H]                     ; 20C5 _ 8B. 45, 08
        mov     eax, dword [eax+18H]                    ; 20C8 _ 8B. 40, 18
        mov     eax, dword [eax+4H]                     ; 20CB _ 8B. 40, 04
        cmp     eax, 2                                  ; 20CE _ 83. F8, 02
        jz      ?_071                                   ; 20D1 _ 74, 0E
        mov     eax, dword [ebp+8H]                     ; 20D3 _ 8B. 45, 08
        mov     eax, dword [eax+18H]                    ; 20D6 _ 8B. 40, 18
        mov     dword [esp], eax                        ; 20D9 _ 89. 04 24
        call    task_run                                ; 20DC _ E8, FFFFFFFC(rel)
?_071:  mov     eax, 0                                  ; 20E1 _ B8, 00000000
?_072:  leave                                           ; 20E6 _ C9
        ret                                             ; 20E7 _ C3
; fifo8_put End of function

fifo8_get:; Function begin
        push    ebp                                     ; 20E8 _ 55
        mov     ebp, esp                                ; 20E9 _ 89. E5
        sub     esp, 16                                 ; 20EB _ 83. EC, 10
        mov     eax, dword [ebp+8H]                     ; 20EE _ 8B. 45, 08
        mov     edx, dword [eax+10H]                    ; 20F1 _ 8B. 50, 10
        mov     eax, dword [ebp+8H]                     ; 20F4 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 20F7 _ 8B. 40, 0C
        cmp     edx, eax                                ; 20FA _ 39. C2
        jnz     ?_073                                   ; 20FC _ 75, 11
        mov     eax, dword [ebp+8H]                     ; 20FE _ 8B. 45, 08
        mov     dword [eax+14H], 0                      ; 2101 _ C7. 40, 14, 00000000
        mov     eax, 4294967295                         ; 2108 _ B8, FFFFFFFF
        jmp     ?_075                                   ; 210D _ EB, 57

?_073:  mov     eax, dword [ebp+8H]                     ; 210F _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 2112 _ 8B. 40, 08
        mov     dword [ebp-8H], eax                     ; 2115 _ 89. 45, F8
        mov     eax, dword [ebp+8H]                     ; 2118 _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 211B _ 8B. 10
        mov     eax, dword [ebp-8H]                     ; 211D _ 8B. 45, F8
        add     eax, edx                                ; 2120 _ 01. D0
        movzx   eax, byte [eax]                         ; 2122 _ 0F B6. 00
        movzx   eax, al                                 ; 2125 _ 0F B6. C0
        mov     dword [ebp-4H], eax                     ; 2128 _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 212B _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 212E _ 8B. 40, 08
        lea     edx, [eax+1H]                           ; 2131 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 2134 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 2137 _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 213A _ 8B. 45, 08
        mov     edx, dword [eax+8H]                     ; 213D _ 8B. 50, 08
        mov     eax, dword [ebp+8H]                     ; 2140 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 2143 _ 8B. 40, 0C
        cmp     edx, eax                                ; 2146 _ 39. C2
        jnz     ?_074                                   ; 2148 _ 75, 0A
        mov     eax, dword [ebp+8H]                     ; 214A _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 214D _ C7. 40, 08, 00000000
?_074:  mov     eax, dword [ebp+8H]                     ; 2154 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 2157 _ 8B. 40, 10
        lea     edx, [eax+1H]                           ; 215A _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 215D _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 2160 _ 89. 50, 10
        mov     eax, dword [ebp-4H]                     ; 2163 _ 8B. 45, FC
?_075:  leave                                           ; 2166 _ C9
        ret                                             ; 2167 _ C3
; fifo8_get End of function

fifo8_status:; Function begin
        push    ebp                                     ; 2168 _ 55
        mov     ebp, esp                                ; 2169 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 216B _ 8B. 45, 08
        mov     edx, dword [eax+0CH]                    ; 216E _ 8B. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 2171 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 2174 _ 8B. 40, 10
        sub     edx, eax                                ; 2177 _ 29. C2
        mov     eax, edx                                ; 2179 _ 89. D0
        pop     ebp                                     ; 217B _ 5D
        ret                                             ; 217C _ C3
; fifo8_status End of function

charToHexVal:; Function begin
        push    ebp                                     ; 217D _ 55
        mov     ebp, esp                                ; 217E _ 89. E5
        sub     esp, 4                                  ; 2180 _ 83. EC, 04
        mov     eax, dword [ebp+8H]                     ; 2183 _ 8B. 45, 08
        mov     byte [ebp-4H], al                       ; 2186 _ 88. 45, FC
        cmp     byte [ebp-4H], 9                        ; 2189 _ 80. 7D, FC, 09
        jle     ?_076                                   ; 218D _ 7E, 09
        movzx   eax, byte [ebp-4H]                      ; 218F _ 0F B6. 45, FC
        add     eax, 55                                 ; 2193 _ 83. C0, 37
        jmp     ?_077                                   ; 2196 _ EB, 07

?_076:  movzx   eax, byte [ebp-4H]                      ; 2198 _ 0F B6. 45, FC
        add     eax, 48                                 ; 219C _ 83. C0, 30
?_077:  leave                                           ; 219F _ C9
        ret                                             ; 21A0 _ C3
; charToHexVal End of function

charToHexStr:; Function begin
        push    ebp                                     ; 21A1 _ 55
        mov     ebp, esp                                ; 21A2 _ 89. E5
        sub     esp, 24                                 ; 21A4 _ 83. EC, 18
        mov     eax, dword [ebp+8H]                     ; 21A7 _ 8B. 45, 08
        mov     byte [ebp-14H], al                      ; 21AA _ 88. 45, EC
        mov     dword [ebp-4H], 0                       ; 21AD _ C7. 45, FC, 00000000
        movzx   eax, byte [ebp-14H]                     ; 21B4 _ 0F B6. 45, EC
        and     eax, 0FH                                ; 21B8 _ 83. E0, 0F
        mov     byte [ebp-5H], al                       ; 21BB _ 88. 45, FB
        movsx   eax, byte [ebp-5H]                      ; 21BE _ 0F BE. 45, FB
        mov     dword [esp], eax                        ; 21C2 _ 89. 04 24
        call    charToHexVal                            ; 21C5 _ E8, FFFFFFFC(rel)
        mov     byte [?_197], al                        ; 21CA _ A2, 000002A3(d)
        movzx   eax, byte [ebp-14H]                     ; 21CF _ 0F B6. 45, EC
        shr     al, 4                                   ; 21D3 _ C0. E8, 04
        mov     byte [ebp-14H], al                      ; 21D6 _ 88. 45, EC
        movzx   eax, byte [ebp-14H]                     ; 21D9 _ 0F B6. 45, EC
        movsx   eax, al                                 ; 21DD _ 0F BE. C0
        mov     dword [esp], eax                        ; 21E0 _ 89. 04 24
        call    charToHexVal                            ; 21E3 _ E8, FFFFFFFC(rel)
        mov     byte [?_196], al                        ; 21E8 _ A2, 000002A2(d)
        mov     eax, keyval                             ; 21ED _ B8, 000002A0(d)
        leave                                           ; 21F2 _ C9
        ret                                             ; 21F3 _ C3
; charToHexStr End of function

intToHexStr:; Function begin
        push    ebp                                     ; 21F4 _ 55
        mov     ebp, esp                                ; 21F5 _ 89. E5
        sub     esp, 16                                 ; 21F7 _ 83. EC, 10
        mov     byte [str.1386], 48                     ; 21FA _ C6. 05, 00000320(d), 30
        mov     byte [?_200], 88                        ; 2201 _ C6. 05, 00000321(d), 58
        mov     byte [?_201], 0                         ; 2208 _ C6. 05, 0000032A(d), 00
        mov     dword [ebp-0CH], 2                      ; 220F _ C7. 45, F4, 00000002
        jmp     ?_079                                   ; 2216 _ EB, 0F

?_078:  mov     eax, dword [ebp-0CH]                    ; 2218 _ 8B. 45, F4
        add     eax, str.1386                           ; 221B _ 05, 00000320(d)
        mov     byte [eax], 48                          ; 2220 _ C6. 00, 30
        add     dword [ebp-0CH], 1                      ; 2223 _ 83. 45, F4, 01
?_079:  cmp     dword [ebp-0CH], 9                      ; 2227 _ 83. 7D, F4, 09
        jle     ?_078                                   ; 222B _ 7E, EB
        mov     dword [ebp-8H], 9                       ; 222D _ C7. 45, F8, 00000009
        jmp     ?_083                                   ; 2234 _ EB, 40

?_080:  mov     eax, dword [ebp+8H]                     ; 2236 _ 8B. 45, 08
        and     eax, 0FH                                ; 2239 _ 83. E0, 0F
        mov     dword [ebp-4H], eax                     ; 223C _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 223F _ 8B. 45, 08
        shr     eax, 4                                  ; 2242 _ C1. E8, 04
        mov     dword [ebp+8H], eax                     ; 2245 _ 89. 45, 08
        cmp     dword [ebp-4H], 9                       ; 2248 _ 83. 7D, FC, 09
        jle     ?_081                                   ; 224C _ 7E, 13
        mov     eax, dword [ebp-4H]                     ; 224E _ 8B. 45, FC
        add     eax, 55                                 ; 2251 _ 83. C0, 37
        mov     edx, dword [ebp-8H]                     ; 2254 _ 8B. 55, F8
        add     edx, str.1386                           ; 2257 _ 81. C2, 00000320(d)
        mov     byte [edx], al                          ; 225D _ 88. 02
        jmp     ?_082                                   ; 225F _ EB, 11

?_081:  mov     eax, dword [ebp-4H]                     ; 2261 _ 8B. 45, FC
        add     eax, 48                                 ; 2264 _ 83. C0, 30
        mov     edx, dword [ebp-8H]                     ; 2267 _ 8B. 55, F8
        add     edx, str.1386                           ; 226A _ 81. C2, 00000320(d)
        mov     byte [edx], al                          ; 2270 _ 88. 02
?_082:  sub     dword [ebp-8H], 1                       ; 2272 _ 83. 6D, F8, 01
?_083:  cmp     dword [ebp-8H], 1                       ; 2276 _ 83. 7D, F8, 01
        jle     ?_084                                   ; 227A _ 7E, 06
        cmp     dword [ebp+8H], 0                       ; 227C _ 83. 7D, 08, 00
        jnz     ?_080                                   ; 2280 _ 75, B4
?_084:  mov     eax, str.1386                           ; 2282 _ B8, 00000320(d)
        leave                                           ; 2287 _ C9
        ret                                             ; 2288 _ C3
; intToHexStr End of function

memman_init:; Function begin
        push    ebp                                     ; 2289 _ 55
        mov     ebp, esp                                ; 228A _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 228C _ 8B. 45, 08
        mov     dword [eax], 0                          ; 228F _ C7. 00, 00000000
        mov     eax, dword [ebp+8H]                     ; 2295 _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 2298 _ C7. 40, 04, 00000000
        mov     eax, dword [ebp+8H]                     ; 229F _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 22A2 _ C7. 40, 08, 00000000
        mov     eax, dword [ebp+8H]                     ; 22A9 _ 8B. 45, 08
        mov     dword [eax+0CH], 0                      ; 22AC _ C7. 40, 0C, 00000000
        pop     ebp                                     ; 22B3 _ 5D
        ret                                             ; 22B4 _ C3
; memman_init End of function

memman_total:; Function begin
        push    ebp                                     ; 22B5 _ 55
        mov     ebp, esp                                ; 22B6 _ 89. E5
        sub     esp, 16                                 ; 22B8 _ 83. EC, 10
        mov     dword [ebp-4H], 0                       ; 22BB _ C7. 45, FC, 00000000
        mov     dword [ebp-8H], 0                       ; 22C2 _ C7. 45, F8, 00000000
        jmp     ?_086                                   ; 22C9 _ EB, 14

?_085:  mov     eax, dword [ebp+8H]                     ; 22CB _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 22CE _ 8B. 55, F8
        add     edx, 2                                  ; 22D1 _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 22D4 _ 8B. 44 D0, 04
        add     dword [ebp-4H], eax                     ; 22D8 _ 01. 45, FC
        add     dword [ebp-8H], 1                       ; 22DB _ 83. 45, F8, 01
?_086:  mov     eax, dword [ebp+8H]                     ; 22DF _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 22E2 _ 8B. 00
        cmp     eax, dword [ebp-8H]                     ; 22E4 _ 3B. 45, F8
        ja      ?_085                                   ; 22E7 _ 77, E2
        mov     eax, dword [ebp-4H]                     ; 22E9 _ 8B. 45, FC
        leave                                           ; 22EC _ C9
        ret                                             ; 22ED _ C3
; memman_total End of function

memman_alloc:; Function begin
        push    ebp                                     ; 22EE _ 55
        mov     ebp, esp                                ; 22EF _ 89. E5
        sub     esp, 16                                 ; 22F1 _ 83. EC, 10
        mov     dword [ebp-8H], 0                       ; 22F4 _ C7. 45, F8, 00000000
        jmp     ?_090                                   ; 22FB _ E9, 00000085

?_087:  mov     eax, dword [ebp+8H]                     ; 2300 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 2303 _ 8B. 55, F8
        add     edx, 2                                  ; 2306 _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 2309 _ 8B. 44 D0, 04
        cmp     eax, dword [ebp+0CH]                    ; 230D _ 3B. 45, 0C
        jc      ?_089                                   ; 2310 _ 72, 6F
        mov     eax, dword [ebp+8H]                     ; 2312 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 2315 _ 8B. 55, F8
        add     edx, 2                                  ; 2318 _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 231B _ 8B. 04 D0
        mov     dword [ebp-4H], eax                     ; 231E _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 2321 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 2324 _ 8B. 55, F8
        add     edx, 2                                  ; 2327 _ 83. C2, 02
        mov     edx, dword [eax+edx*8]                  ; 232A _ 8B. 14 D0
        mov     eax, dword [ebp+0CH]                    ; 232D _ 8B. 45, 0C
        lea     ecx, [edx+eax]                          ; 2330 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 2333 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 2336 _ 8B. 55, F8
        add     edx, 2                                  ; 2339 _ 83. C2, 02
        mov     dword [eax+edx*8], ecx                  ; 233C _ 89. 0C D0
        mov     eax, dword [ebp+8H]                     ; 233F _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 2342 _ 8B. 55, F8
        add     edx, 2                                  ; 2345 _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 2348 _ 8B. 44 D0, 04
        sub     eax, dword [ebp+0CH]                    ; 234C _ 2B. 45, 0C
        mov     edx, eax                                ; 234F _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 2351 _ 8B. 45, 08
        mov     ecx, dword [ebp-8H]                     ; 2354 _ 8B. 4D, F8
        add     ecx, 2                                  ; 2357 _ 83. C1, 02
        mov     dword [eax+ecx*8+4H], edx               ; 235A _ 89. 54 C8, 04
        mov     eax, dword [ebp+8H]                     ; 235E _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 2361 _ 8B. 55, F8
        add     edx, 2                                  ; 2364 _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 2367 _ 8B. 44 D0, 04
        test    eax, eax                                ; 236B _ 85. C0
        jnz     ?_088                                   ; 236D _ 75, 0D
        mov     eax, dword [ebp+8H]                     ; 236F _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 2372 _ 8B. 00
        lea     edx, [eax-1H]                           ; 2374 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 2377 _ 8B. 45, 08
        mov     dword [eax], edx                        ; 237A _ 89. 10
?_088:  mov     eax, dword [ebp-4H]                     ; 237C _ 8B. 45, FC
        jmp     ?_091                                   ; 237F _ EB, 17

?_089:  add     dword [ebp-8H], 1                       ; 2381 _ 83. 45, F8, 01
?_090:  mov     eax, dword [ebp+8H]                     ; 2385 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 2388 _ 8B. 00
        cmp     eax, dword [ebp-8H]                     ; 238A _ 3B. 45, F8
        ja      ?_087                                   ; 238D _ 0F 87, FFFFFF6D
        mov     eax, 0                                  ; 2393 _ B8, 00000000
?_091:  leave                                           ; 2398 _ C9
        ret                                             ; 2399 _ C3
; memman_alloc End of function

memman_free:; Function begin
        push    ebp                                     ; 239A _ 55
        mov     ebp, esp                                ; 239B _ 89. E5
        push    ebx                                     ; 239D _ 53
        sub     esp, 16                                 ; 239E _ 83. EC, 10
        mov     dword [ebp-0CH], 0                      ; 23A1 _ C7. 45, F4, 00000000
        jmp     ?_094                                   ; 23A8 _ EB, 17

?_092:  mov     eax, dword [ebp+8H]                     ; 23AA _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 23AD _ 8B. 55, F4
        add     edx, 2                                  ; 23B0 _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 23B3 _ 8B. 04 D0
        cmp     eax, dword [ebp+0CH]                    ; 23B6 _ 3B. 45, 0C
        jbe     ?_093                                   ; 23B9 _ 76, 02
        jmp     ?_095                                   ; 23BB _ EB, 0E

?_093:  add     dword [ebp-0CH], 1                      ; 23BD _ 83. 45, F4, 01
?_094:  mov     eax, dword [ebp+8H]                     ; 23C1 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 23C4 _ 8B. 00
        cmp     eax, dword [ebp-0CH]                    ; 23C6 _ 3B. 45, F4
        jg      ?_092                                   ; 23C9 _ 7F, DF
?_095:  cmp     dword [ebp-0CH], 0                      ; 23CB _ 83. 7D, F4, 00
        jle     ?_097                                   ; 23CF _ 0F 8E, 000000BA
        mov     eax, dword [ebp-0CH]                    ; 23D5 _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 23D8 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 23DB _ 8B. 45, 08
        add     edx, 2                                  ; 23DE _ 83. C2, 02
        mov     edx, dword [eax+edx*8]                  ; 23E1 _ 8B. 14 D0
        mov     eax, dword [ebp-0CH]                    ; 23E4 _ 8B. 45, F4
        lea     ecx, [eax-1H]                           ; 23E7 _ 8D. 48, FF
        mov     eax, dword [ebp+8H]                     ; 23EA _ 8B. 45, 08
        add     ecx, 2                                  ; 23ED _ 83. C1, 02
        mov     eax, dword [eax+ecx*8+4H]               ; 23F0 _ 8B. 44 C8, 04
        add     eax, edx                                ; 23F4 _ 01. D0
        cmp     eax, dword [ebp+0CH]                    ; 23F6 _ 3B. 45, 0C
        jne     ?_097                                   ; 23F9 _ 0F 85, 00000090
        mov     eax, dword [ebp-0CH]                    ; 23FF _ 8B. 45, F4
        lea     ebx, [eax-1H]                           ; 2402 _ 8D. 58, FF
        mov     eax, dword [ebp-0CH]                    ; 2405 _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 2408 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 240B _ 8B. 45, 08
        add     edx, 2                                  ; 240E _ 83. C2, 02
        mov     edx, dword [eax+edx*8+4H]               ; 2411 _ 8B. 54 D0, 04
        mov     eax, dword [ebp+10H]                    ; 2415 _ 8B. 45, 10
        lea     ecx, [edx+eax]                          ; 2418 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 241B _ 8B. 45, 08
        lea     edx, [ebx+2H]                           ; 241E _ 8D. 53, 02
        mov     dword [eax+edx*8+4H], ecx               ; 2421 _ 89. 4C D0, 04
        mov     eax, dword [ebp+8H]                     ; 2425 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 2428 _ 8B. 00
        cmp     eax, dword [ebp-0CH]                    ; 242A _ 3B. 45, F4
        jle     ?_096                                   ; 242D _ 7E, 56
        mov     eax, dword [ebp+10H]                    ; 242F _ 8B. 45, 10
        mov     edx, dword [ebp+0CH]                    ; 2432 _ 8B. 55, 0C
        lea     ecx, [edx+eax]                          ; 2435 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 2438 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 243B _ 8B. 55, F4
        add     edx, 2                                  ; 243E _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 2441 _ 8B. 04 D0
        cmp     ecx, eax                                ; 2444 _ 39. C1
        jnz     ?_096                                   ; 2446 _ 75, 3D
        mov     eax, dword [ebp-0CH]                    ; 2448 _ 8B. 45, F4
        lea     ebx, [eax-1H]                           ; 244B _ 8D. 58, FF
        mov     eax, dword [ebp-0CH]                    ; 244E _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 2451 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 2454 _ 8B. 45, 08
        add     edx, 2                                  ; 2457 _ 83. C2, 02
        mov     edx, dword [eax+edx*8+4H]               ; 245A _ 8B. 54 D0, 04
        mov     eax, dword [ebp+8H]                     ; 245E _ 8B. 45, 08
        mov     ecx, dword [ebp-0CH]                    ; 2461 _ 8B. 4D, F4
        add     ecx, 2                                  ; 2464 _ 83. C1, 02
        mov     eax, dword [eax+ecx*8+4H]               ; 2467 _ 8B. 44 C8, 04
        lea     ecx, [edx+eax]                          ; 246B _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 246E _ 8B. 45, 08
        lea     edx, [ebx+2H]                           ; 2471 _ 8D. 53, 02
        mov     dword [eax+edx*8+4H], ecx               ; 2474 _ 89. 4C D0, 04
        mov     eax, dword [ebp+8H]                     ; 2478 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 247B _ 8B. 00
        lea     edx, [eax-1H]                           ; 247D _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 2480 _ 8B. 45, 08
        mov     dword [eax], edx                        ; 2483 _ 89. 10
?_096:  mov     eax, 0                                  ; 2485 _ B8, 00000000
        jmp     ?_103                                   ; 248A _ E9, 0000011C

?_097:  mov     eax, dword [ebp+8H]                     ; 248F _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 2492 _ 8B. 00
        cmp     eax, dword [ebp-0CH]                    ; 2494 _ 3B. 45, F4
        jle     ?_098                                   ; 2497 _ 7E, 52
        mov     eax, dword [ebp+10H]                    ; 2499 _ 8B. 45, 10
        mov     edx, dword [ebp+0CH]                    ; 249C _ 8B. 55, 0C
        lea     ecx, [edx+eax]                          ; 249F _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 24A2 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 24A5 _ 8B. 55, F4
        add     edx, 2                                  ; 24A8 _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 24AB _ 8B. 04 D0
        cmp     ecx, eax                                ; 24AE _ 39. C1
        jnz     ?_098                                   ; 24B0 _ 75, 39
        mov     eax, dword [ebp+8H]                     ; 24B2 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 24B5 _ 8B. 55, F4
        lea     ecx, [edx+2H]                           ; 24B8 _ 8D. 4A, 02
        mov     edx, dword [ebp+0CH]                    ; 24BB _ 8B. 55, 0C
        mov     dword [eax+ecx*8], edx                  ; 24BE _ 89. 14 C8
        mov     eax, dword [ebp+8H]                     ; 24C1 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 24C4 _ 8B. 55, F4
        add     edx, 2                                  ; 24C7 _ 83. C2, 02
        mov     edx, dword [eax+edx*8+4H]               ; 24CA _ 8B. 54 D0, 04
        mov     eax, dword [ebp+10H]                    ; 24CE _ 8B. 45, 10
        lea     ecx, [edx+eax]                          ; 24D1 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 24D4 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 24D7 _ 8B. 55, F4
        add     edx, 2                                  ; 24DA _ 83. C2, 02
        mov     dword [eax+edx*8+4H], ecx               ; 24DD _ 89. 4C D0, 04
        mov     eax, 0                                  ; 24E1 _ B8, 00000000
        jmp     ?_103                                   ; 24E6 _ E9, 000000C0

?_098:  mov     eax, dword [ebp+8H]                     ; 24EB _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 24EE _ 8B. 00
        cmp     eax, 4095                               ; 24F0 _ 3D, 00000FFF
        jg      ?_102                                   ; 24F5 _ 0F 8F, 00000087
        mov     eax, dword [ebp+8H]                     ; 24FB _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 24FE _ 8B. 00
        mov     dword [ebp-8H], eax                     ; 2500 _ 89. 45, F8
        jmp     ?_100                                   ; 2503 _ EB, 28

?_099:  mov     eax, dword [ebp-8H]                     ; 2505 _ 8B. 45, F8
        lea     edx, [eax-1H]                           ; 2508 _ 8D. 50, FF
        mov     ecx, dword [ebp+8H]                     ; 250B _ 8B. 4D, 08
        mov     eax, dword [ebp-8H]                     ; 250E _ 8B. 45, F8
        lea     ebx, [eax+2H]                           ; 2511 _ 8D. 58, 02
        mov     eax, dword [ebp+8H]                     ; 2514 _ 8B. 45, 08
        add     edx, 2                                  ; 2517 _ 83. C2, 02
        lea     edx, [eax+edx*8]                        ; 251A _ 8D. 14 D0
        mov     eax, dword [edx]                        ; 251D _ 8B. 02
        mov     edx, dword [edx+4H]                     ; 251F _ 8B. 52, 04
        mov     dword [ecx+ebx*8], eax                  ; 2522 _ 89. 04 D9
        mov     dword [ecx+ebx*8+4H], edx               ; 2525 _ 89. 54 D9, 04
        sub     dword [ebp-8H], 1                       ; 2529 _ 83. 6D, F8, 01
?_100:  mov     eax, dword [ebp-8H]                     ; 252D _ 8B. 45, F8
        cmp     eax, dword [ebp-0CH]                    ; 2530 _ 3B. 45, F4
        jg      ?_099                                   ; 2533 _ 7F, D0
        mov     eax, dword [ebp+8H]                     ; 2535 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 2538 _ 8B. 00
        lea     edx, [eax+1H]                           ; 253A _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 253D _ 8B. 45, 08
        mov     dword [eax], edx                        ; 2540 _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 2542 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 2545 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 2548 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 254B _ 8B. 00
        cmp     edx, eax                                ; 254D _ 39. C2
        jge     ?_101                                   ; 254F _ 7D, 0B
        mov     eax, dword [ebp+8H]                     ; 2551 _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 2554 _ 8B. 10
        mov     eax, dword [ebp+8H]                     ; 2556 _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 2559 _ 89. 50, 04
?_101:  mov     eax, dword [ebp+8H]                     ; 255C _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 255F _ 8B. 55, F4
        lea     ecx, [edx+2H]                           ; 2562 _ 8D. 4A, 02
        mov     edx, dword [ebp+0CH]                    ; 2565 _ 8B. 55, 0C
        mov     dword [eax+ecx*8], edx                  ; 2568 _ 89. 14 C8
        mov     eax, dword [ebp+8H]                     ; 256B _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 256E _ 8B. 55, F4
        lea     ecx, [edx+2H]                           ; 2571 _ 8D. 4A, 02
        mov     edx, dword [ebp+10H]                    ; 2574 _ 8B. 55, 10
        mov     dword [eax+ecx*8+4H], edx               ; 2577 _ 89. 54 C8, 04
        mov     eax, 0                                  ; 257B _ B8, 00000000
        jmp     ?_103                                   ; 2580 _ EB, 29

?_102:  mov     eax, dword [ebp+8H]                     ; 2582 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 2585 _ 8B. 40, 0C
        lea     edx, [eax+1H]                           ; 2588 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 258B _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 258E _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 2591 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 2594 _ 8B. 40, 08
        mov     edx, eax                                ; 2597 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 2599 _ 8B. 45, 10
        add     eax, edx                                ; 259C _ 01. D0
        mov     edx, eax                                ; 259E _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 25A0 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 25A3 _ 89. 50, 08
        mov     eax, 4294967295                         ; 25A6 _ B8, FFFFFFFF
?_103:  add     esp, 16                                 ; 25AB _ 83. C4, 10
        pop     ebx                                     ; 25AE _ 5B
        pop     ebp                                     ; 25AF _ 5D
        ret                                             ; 25B0 _ C3
; memman_free End of function

memman_alloc_4k:; Function begin
        push    ebp                                     ; 25B1 _ 55
        mov     ebp, esp                                ; 25B2 _ 89. E5
        sub     esp, 24                                 ; 25B4 _ 83. EC, 18
        mov     eax, dword [ebp+0CH]                    ; 25B7 _ 8B. 45, 0C
        add     eax, 4095                               ; 25BA _ 05, 00000FFF
        and     eax, 0FFFFF000H                         ; 25BF _ 25, FFFFF000
        mov     dword [ebp+0CH], eax                    ; 25C4 _ 89. 45, 0C
        mov     eax, dword [ebp+0CH]                    ; 25C7 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 25CA _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 25CE _ 8B. 45, 08
        mov     dword [esp], eax                        ; 25D1 _ 89. 04 24
        call    memman_alloc                            ; 25D4 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-4H], eax                     ; 25D9 _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 25DC _ 8B. 45, FC
        leave                                           ; 25DF _ C9
        ret                                             ; 25E0 _ C3
; memman_alloc_4k End of function

memman_free_4k:; Function begin
        push    ebp                                     ; 25E1 _ 55
        mov     ebp, esp                                ; 25E2 _ 89. E5
        sub     esp, 28                                 ; 25E4 _ 83. EC, 1C
        mov     eax, dword [ebp+10H]                    ; 25E7 _ 8B. 45, 10
        add     eax, 4095                               ; 25EA _ 05, 00000FFF
        and     eax, 0FFFFF000H                         ; 25EF _ 25, FFFFF000
        mov     dword [ebp+10H], eax                    ; 25F4 _ 89. 45, 10
        mov     eax, dword [ebp+10H]                    ; 25F7 _ 8B. 45, 10
        mov     dword [esp+8H], eax                     ; 25FA _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 25FE _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 2601 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2605 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2608 _ 89. 04 24
        call    memman_free                             ; 260B _ E8, FFFFFFFC(rel)
        mov     dword [ebp-4H], eax                     ; 2610 _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 2613 _ 8B. 45, FC
        leave                                           ; 2616 _ C9
        ret                                             ; 2617 _ C3
; memman_free_4k End of function

sheet_control_init:; Function begin
        push    ebp                                     ; 2618 _ 55
        mov     ebp, esp                                ; 2619 _ 89. E5
        sub     esp, 40                                 ; 261B _ 83. EC, 28
        mov     dword [esp+4H], 9236                    ; 261E _ C7. 44 24, 04, 00002414
        mov     eax, dword [ebp+8H]                     ; 2626 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2629 _ 89. 04 24
        call    memman_alloc_4k                         ; 262C _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 2631 _ 89. 45, F4
        cmp     dword [ebp-0CH], 0                      ; 2634 _ 83. 7D, F4, 00
        jnz     ?_104                                   ; 2638 _ 75, 24
        mov     eax, dword [ebp-0CH]                    ; 263A _ 8B. 45, F4
        mov     dword [esp+8H], 9236                    ; 263D _ C7. 44 24, 08, 00002414
        mov     dword [esp+4H], eax                     ; 2645 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2649 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 264C _ 89. 04 24
        call    memman_free_4k                          ; 264F _ E8, FFFFFFFC(rel)
        mov     eax, 0                                  ; 2654 _ B8, 00000000
        jmp     ?_108                                   ; 2659 _ E9, 0000009D

?_104:  mov     eax, dword [ebp-0CH]                    ; 265E _ 8B. 45, F4
        mov     edx, dword [ebp+0CH]                    ; 2661 _ 8B. 55, 0C
        mov     dword [eax], edx                        ; 2664 _ 89. 10
        mov     eax, dword [ebp-0CH]                    ; 2666 _ 8B. 45, F4
        mov     edx, dword [ebp+10H]                    ; 2669 _ 8B. 55, 10
        mov     dword [eax+4H], edx                     ; 266C _ 89. 50, 04
        mov     eax, dword [ebp-0CH]                    ; 266F _ 8B. 45, F4
        mov     edx, dword [ebp+14H]                    ; 2672 _ 8B. 55, 14
        mov     dword [eax+8H], edx                     ; 2675 _ 89. 50, 08
        mov     eax, dword [ebp-0CH]                    ; 2678 _ 8B. 45, F4
        mov     dword [eax+0CH], -1                     ; 267B _ C7. 40, 0C, FFFFFFFF
        mov     dword [ebp-10H], 0                      ; 2682 _ C7. 45, F0, 00000000
        jmp     ?_106                                   ; 2689 _ EB, 1B

?_105:  mov     eax, dword [ebp-0CH]                    ; 268B _ 8B. 45, F4
        mov     edx, dword [ebp-10H]                    ; 268E _ 8B. 55, F0
        add     edx, 33                                 ; 2691 _ 83. C2, 21
        shl     edx, 5                                  ; 2694 _ C1. E2, 05
        add     eax, edx                                ; 2697 _ 01. D0
        add     eax, 16                                 ; 2699 _ 83. C0, 10
        mov     dword [eax], 0                          ; 269C _ C7. 00, 00000000
        add     dword [ebp-10H], 1                      ; 26A2 _ 83. 45, F0, 01
?_106:  cmp     dword [ebp-10H], 255                    ; 26A6 _ 81. 7D, F0, 000000FF
        jle     ?_105                                   ; 26AD _ 7E, DC
        mov     eax, dword [ebp+10H]                    ; 26AF _ 8B. 45, 10
        imul    eax, dword [ebp+14H]                    ; 26B2 _ 0F AF. 45, 14
        mov     dword [esp+4H], eax                     ; 26B6 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 26BA _ 8B. 45, 08
        mov     dword [esp], eax                        ; 26BD _ 89. 04 24
        call    memman_alloc_4k                         ; 26C0 _ E8, FFFFFFFC(rel)
        mov     edx, eax                                ; 26C5 _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 26C7 _ 8B. 45, F4
        mov     dword [eax+10H], edx                    ; 26CA _ 89. 50, 10
        mov     eax, dword [ebp-0CH]                    ; 26CD _ 8B. 45, F4
        mov     eax, dword [eax+10H]                    ; 26D0 _ 8B. 40, 10
        test    eax, eax                                ; 26D3 _ 85. C0
        jnz     ?_107                                   ; 26D5 _ 75, 21
        mov     eax, dword [ebp-0CH]                    ; 26D7 _ 8B. 45, F4
        mov     dword [esp+8H], 9236                    ; 26DA _ C7. 44 24, 08, 00002414
        mov     dword [esp+4H], eax                     ; 26E2 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 26E6 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 26E9 _ 89. 04 24
        call    memman_free_4k                          ; 26EC _ E8, FFFFFFFC(rel)
        mov     eax, 0                                  ; 26F1 _ B8, 00000000
        jmp     ?_108                                   ; 26F6 _ EB, 03

?_107:  mov     eax, dword [ebp-0CH]                    ; 26F8 _ 8B. 45, F4
?_108:  leave                                           ; 26FB _ C9
        ret                                             ; 26FC _ C3
; sheet_control_init End of function

sheet_alloc:; Function begin
        push    ebp                                     ; 26FD _ 55
        mov     ebp, esp                                ; 26FE _ 89. E5
        sub     esp, 16                                 ; 2700 _ 83. EC, 10
        mov     dword [ebp-8H], 0                       ; 2703 _ C7. 45, F8, 00000000
        jmp     ?_111                                   ; 270A _ EB, 5B

?_109:  mov     eax, dword [ebp+8H]                     ; 270C _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 270F _ 8B. 55, F8
        add     edx, 33                                 ; 2712 _ 83. C2, 21
        shl     edx, 5                                  ; 2715 _ C1. E2, 05
        add     eax, edx                                ; 2718 _ 01. D0
        add     eax, 16                                 ; 271A _ 83. C0, 10
        mov     eax, dword [eax]                        ; 271D _ 8B. 00
        test    eax, eax                                ; 271F _ 85. C0
        jnz     ?_110                                   ; 2721 _ 75, 40
        mov     eax, dword [ebp-8H]                     ; 2723 _ 8B. 45, F8
        shl     eax, 5                                  ; 2726 _ C1. E0, 05
        lea     edx, [eax+410H]                         ; 2729 _ 8D. 90, 00000410
        mov     eax, dword [ebp+8H]                     ; 272F _ 8B. 45, 08
        add     eax, edx                                ; 2732 _ 01. D0
        add     eax, 4                                  ; 2734 _ 83. C0, 04
        mov     dword [ebp-4H], eax                     ; 2737 _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 273A _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 273D _ 8B. 55, F8
        lea     ecx, [edx+4H]                           ; 2740 _ 8D. 4A, 04
        mov     edx, dword [ebp-4H]                     ; 2743 _ 8B. 55, FC
        mov     dword [eax+ecx*4+4H], edx               ; 2746 _ 89. 54 88, 04
        mov     eax, dword [ebp-4H]                     ; 274A _ 8B. 45, FC
        mov     dword [eax+1CH], 1                      ; 274D _ C7. 40, 1C, 00000001
        mov     eax, dword [ebp-4H]                     ; 2754 _ 8B. 45, FC
        mov     dword [eax+18H], -1                     ; 2757 _ C7. 40, 18, FFFFFFFF
        mov     eax, dword [ebp-4H]                     ; 275E _ 8B. 45, FC
        jmp     ?_112                                   ; 2761 _ EB, 12

?_110:  add     dword [ebp-8H], 1                       ; 2763 _ 83. 45, F8, 01
?_111:  cmp     dword [ebp-8H], 255                     ; 2767 _ 81. 7D, F8, 000000FF
        jle     ?_109                                   ; 276E _ 7E, 9C
        mov     eax, 0                                  ; 2770 _ B8, 00000000
?_112:  leave                                           ; 2775 _ C9
        ret                                             ; 2776 _ C3
; sheet_alloc End of function

sheet_setbuf:; Function begin
        push    ebp                                     ; 2777 _ 55
        mov     ebp, esp                                ; 2778 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 277A _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 277D _ 8B. 55, 0C
        mov     dword [eax], edx                        ; 2780 _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 2782 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 2785 _ 8B. 55, 10
        mov     dword [eax+4H], edx                     ; 2788 _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 278B _ 8B. 45, 08
        mov     edx, dword [ebp+14H]                    ; 278E _ 8B. 55, 14
        mov     dword [eax+8H], edx                     ; 2791 _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 2794 _ 8B. 45, 08
        mov     edx, dword [ebp+18H]                    ; 2797 _ 8B. 55, 18
        mov     dword [eax+14H], edx                    ; 279A _ 89. 50, 14
        pop     ebp                                     ; 279D _ 5D
        ret                                             ; 279E _ C3
; sheet_setbuf End of function

sheet_updown:; Function begin
        push    ebp                                     ; 279F _ 55
        mov     ebp, esp                                ; 27A0 _ 89. E5
        push    esi                                     ; 27A2 _ 56
        push    ebx                                     ; 27A3 _ 53
        sub     esp, 48                                 ; 27A4 _ 83. EC, 30
        mov     eax, dword [ebp+0CH]                    ; 27A7 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 27AA _ 8B. 40, 18
        mov     dword [ebp-0CH], eax                    ; 27AD _ 89. 45, F4
        mov     eax, dword [ebp+8H]                     ; 27B0 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 27B3 _ 8B. 40, 0C
        add     eax, 1                                  ; 27B6 _ 83. C0, 01
        cmp     eax, dword [ebp+10H]                    ; 27B9 _ 3B. 45, 10
        jge     ?_113                                   ; 27BC _ 7D, 0C
        mov     eax, dword [ebp+8H]                     ; 27BE _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 27C1 _ 8B. 40, 0C
        add     eax, 1                                  ; 27C4 _ 83. C0, 01
        mov     dword [ebp+10H], eax                    ; 27C7 _ 89. 45, 10
?_113:  cmp     dword [ebp+10H], -1                     ; 27CA _ 83. 7D, 10, FF
        jge     ?_114                                   ; 27CE _ 7D, 07
        mov     dword [ebp+10H], -1                     ; 27D0 _ C7. 45, 10, FFFFFFFF
?_114:  mov     eax, dword [ebp+0CH]                    ; 27D7 _ 8B. 45, 0C
        mov     edx, dword [ebp+10H]                    ; 27DA _ 8B. 55, 10
        mov     dword [eax+18H], edx                    ; 27DD _ 89. 50, 18
        mov     eax, dword [ebp-0CH]                    ; 27E0 _ 8B. 45, F4
        cmp     eax, dword [ebp+10H]                    ; 27E3 _ 3B. 45, 10
        jle     ?_121                                   ; 27E6 _ 0F 8E, 00000201
        cmp     dword [ebp+10H], 0                      ; 27EC _ 83. 7D, 10, 00
        js      ?_117                                   ; 27F0 _ 0F 88, 000000F7
        mov     eax, dword [ebp-0CH]                    ; 27F6 _ 8B. 45, F4
        mov     dword [ebp-10H], eax                    ; 27F9 _ 89. 45, F0
        jmp     ?_116                                   ; 27FC _ EB, 34

?_115:  mov     eax, dword [ebp-10H]                    ; 27FE _ 8B. 45, F0
        lea     edx, [eax-1H]                           ; 2801 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 2804 _ 8B. 45, 08
        add     edx, 4                                  ; 2807 _ 83. C2, 04
        mov     edx, dword [eax+edx*4+4H]               ; 280A _ 8B. 54 90, 04
        mov     eax, dword [ebp+8H]                     ; 280E _ 8B. 45, 08
        mov     ecx, dword [ebp-10H]                    ; 2811 _ 8B. 4D, F0
        add     ecx, 4                                  ; 2814 _ 83. C1, 04
        mov     dword [eax+ecx*4+4H], edx               ; 2817 _ 89. 54 88, 04
        mov     eax, dword [ebp+8H]                     ; 281B _ 8B. 45, 08
        mov     edx, dword [ebp-10H]                    ; 281E _ 8B. 55, F0
        add     edx, 4                                  ; 2821 _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 2824 _ 8B. 44 90, 04
        mov     edx, dword [ebp-10H]                    ; 2828 _ 8B. 55, F0
        mov     dword [eax+18H], edx                    ; 282B _ 89. 50, 18
        sub     dword [ebp-10H], 1                      ; 282E _ 83. 6D, F0, 01
?_116:  mov     eax, dword [ebp-10H]                    ; 2832 _ 8B. 45, F0
        cmp     eax, dword [ebp+10H]                    ; 2835 _ 3B. 45, 10
        jg      ?_115                                   ; 2838 _ 7F, C4
        mov     eax, dword [ebp+8H]                     ; 283A _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 283D _ 8B. 55, 10
        lea     ecx, [edx+4H]                           ; 2840 _ 8D. 4A, 04
        mov     edx, dword [ebp+0CH]                    ; 2843 _ 8B. 55, 0C
        mov     dword [eax+ecx*4+4H], edx               ; 2846 _ 89. 54 88, 04
        mov     eax, dword [ebp+10H]                    ; 284A _ 8B. 45, 10
        lea     esi, [eax+1H]                           ; 284D _ 8D. 70, 01
        mov     eax, dword [ebp+0CH]                    ; 2850 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 2853 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 2856 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 2859 _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 285C _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 285F _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 2862 _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 2865 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 2868 _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 286B _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 286E _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 2871 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 2874 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 2877 _ 8B. 40, 0C
        mov     dword [esp+14H], esi                    ; 287A _ 89. 74 24, 14
        mov     dword [esp+10H], ebx                    ; 287E _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 2882 _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 2886 _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 288A _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 288E _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2891 _ 89. 04 24
        call    sheet_refresh_map                       ; 2894 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 2899 _ 8B. 45, 10
        lea     esi, [eax+1H]                           ; 289C _ 8D. 70, 01
        mov     eax, dword [ebp+0CH]                    ; 289F _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 28A2 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 28A5 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 28A8 _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 28AB _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 28AE _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 28B1 _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 28B4 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 28B7 _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 28BA _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 28BD _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 28C0 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 28C3 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 28C6 _ 8B. 40, 0C
        mov     dword [esp+14H], esi                    ; 28C9 _ 89. 74 24, 14
        mov     dword [esp+10H], ebx                    ; 28CD _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 28D1 _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 28D5 _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 28D9 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 28DD _ 8B. 45, 08
        mov     dword [esp], eax                        ; 28E0 _ 89. 04 24
        call    sheet_refresh_local                     ; 28E3 _ E8, FFFFFFFC(rel)
        jmp     ?_128                                   ; 28E8 _ E9, 0000026C

?_117:  mov     eax, dword [ebp+8H]                     ; 28ED _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 28F0 _ 8B. 40, 0C
        cmp     eax, dword [ebp-0CH]                    ; 28F3 _ 3B. 45, F4
        jle     ?_120                                   ; 28F6 _ 7E, 47
        mov     eax, dword [ebp-0CH]                    ; 28F8 _ 8B. 45, F4
        mov     dword [ebp-10H], eax                    ; 28FB _ 89. 45, F0
        jmp     ?_119                                   ; 28FE _ EB, 34

?_118:  mov     eax, dword [ebp-10H]                    ; 2900 _ 8B. 45, F0
        lea     edx, [eax+1H]                           ; 2903 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 2906 _ 8B. 45, 08
        add     edx, 4                                  ; 2909 _ 83. C2, 04
        mov     edx, dword [eax+edx*4+4H]               ; 290C _ 8B. 54 90, 04
        mov     eax, dword [ebp+8H]                     ; 2910 _ 8B. 45, 08
        mov     ecx, dword [ebp-10H]                    ; 2913 _ 8B. 4D, F0
        add     ecx, 4                                  ; 2916 _ 83. C1, 04
        mov     dword [eax+ecx*4+4H], edx               ; 2919 _ 89. 54 88, 04
        mov     eax, dword [ebp+8H]                     ; 291D _ 8B. 45, 08
        mov     edx, dword [ebp-10H]                    ; 2920 _ 8B. 55, F0
        add     edx, 4                                  ; 2923 _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 2926 _ 8B. 44 90, 04
        mov     edx, dword [ebp-10H]                    ; 292A _ 8B. 55, F0
        mov     dword [eax+18H], edx                    ; 292D _ 89. 50, 18
        add     dword [ebp-10H], 1                      ; 2930 _ 83. 45, F0, 01
?_119:  mov     eax, dword [ebp+8H]                     ; 2934 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 2937 _ 8B. 40, 0C
        cmp     eax, dword [ebp-10H]                    ; 293A _ 3B. 45, F0
        jg      ?_118                                   ; 293D _ 7F, C1
?_120:  mov     eax, dword [ebp+8H]                     ; 293F _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 2942 _ 8B. 40, 0C
        lea     edx, [eax-1H]                           ; 2945 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 2948 _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 294B _ 89. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 294E _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 2951 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 2954 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 2957 _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 295A _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 295D _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 2960 _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 2963 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 2966 _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 2969 _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 296C _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 296F _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 2972 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 2975 _ 8B. 40, 0C
        mov     dword [esp+14H], 0                      ; 2978 _ C7. 44 24, 14, 00000000
        mov     dword [esp+10H], ebx                    ; 2980 _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 2984 _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 2988 _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 298C _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2990 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2993 _ 89. 04 24
        call    sheet_refresh_map                       ; 2996 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+0CH]                    ; 299B _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 299E _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 29A1 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 29A4 _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 29A7 _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 29AA _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 29AD _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 29B0 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 29B3 _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 29B6 _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 29B9 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 29BC _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 29BF _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 29C2 _ 8B. 40, 0C
        mov     dword [esp+14H], 0                      ; 29C5 _ C7. 44 24, 14, 00000000
        mov     dword [esp+10H], ebx                    ; 29CD _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 29D1 _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 29D5 _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 29D9 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 29DD _ 8B. 45, 08
        mov     dword [esp], eax                        ; 29E0 _ 89. 04 24
        call    sheet_refresh_local                     ; 29E3 _ E8, FFFFFFFC(rel)
        jmp     ?_128                                   ; 29E8 _ E9, 0000016C

?_121:  mov     eax, dword [ebp-0CH]                    ; 29ED _ 8B. 45, F4
        cmp     eax, dword [ebp+10H]                    ; 29F0 _ 3B. 45, 10
        jge     ?_128                                   ; 29F3 _ 0F 8D, 00000160
        cmp     dword [ebp-0CH], 0                      ; 29F9 _ 83. 7D, F4, 00
        js      ?_124                                   ; 29FD _ 78, 56
        mov     eax, dword [ebp-0CH]                    ; 29FF _ 8B. 45, F4
        mov     dword [ebp-10H], eax                    ; 2A02 _ 89. 45, F0
        jmp     ?_123                                   ; 2A05 _ EB, 34

?_122:  mov     eax, dword [ebp-10H]                    ; 2A07 _ 8B. 45, F0
        lea     edx, [eax+1H]                           ; 2A0A _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 2A0D _ 8B. 45, 08
        add     edx, 4                                  ; 2A10 _ 83. C2, 04
        mov     edx, dword [eax+edx*4+4H]               ; 2A13 _ 8B. 54 90, 04
        mov     eax, dword [ebp+8H]                     ; 2A17 _ 8B. 45, 08
        mov     ecx, dword [ebp-10H]                    ; 2A1A _ 8B. 4D, F0
        add     ecx, 4                                  ; 2A1D _ 83. C1, 04
        mov     dword [eax+ecx*4+4H], edx               ; 2A20 _ 89. 54 88, 04
        mov     eax, dword [ebp+8H]                     ; 2A24 _ 8B. 45, 08
        mov     edx, dword [ebp-10H]                    ; 2A27 _ 8B. 55, F0
        add     edx, 4                                  ; 2A2A _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 2A2D _ 8B. 44 90, 04
        mov     edx, dword [ebp-10H]                    ; 2A31 _ 8B. 55, F0
        mov     dword [eax+18H], edx                    ; 2A34 _ 89. 50, 18
        add     dword [ebp-10H], 1                      ; 2A37 _ 83. 45, F0, 01
?_123:  mov     eax, dword [ebp-10H]                    ; 2A3B _ 8B. 45, F0
        cmp     eax, dword [ebp+10H]                    ; 2A3E _ 3B. 45, 10
        jl      ?_122                                   ; 2A41 _ 7C, C4
        mov     eax, dword [ebp+8H]                     ; 2A43 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 2A46 _ 8B. 55, 10
        lea     ecx, [edx+4H]                           ; 2A49 _ 8D. 4A, 04
        mov     edx, dword [ebp+0CH]                    ; 2A4C _ 8B. 55, 0C
        mov     dword [eax+ecx*4+4H], edx               ; 2A4F _ 89. 54 88, 04
        jmp     ?_127                                   ; 2A53 _ EB, 6C

?_124:  mov     eax, dword [ebp+8H]                     ; 2A55 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 2A58 _ 8B. 40, 0C
        mov     dword [ebp-10H], eax                    ; 2A5B _ 89. 45, F0
        jmp     ?_126                                   ; 2A5E _ EB, 3A

?_125:  mov     eax, dword [ebp-10H]                    ; 2A60 _ 8B. 45, F0
        lea     ecx, [eax+1H]                           ; 2A63 _ 8D. 48, 01
        mov     eax, dword [ebp+8H]                     ; 2A66 _ 8B. 45, 08
        mov     edx, dword [ebp-10H]                    ; 2A69 _ 8B. 55, F0
        add     edx, 4                                  ; 2A6C _ 83. C2, 04
        mov     edx, dword [eax+edx*4+4H]               ; 2A6F _ 8B. 54 90, 04
        mov     eax, dword [ebp+8H]                     ; 2A73 _ 8B. 45, 08
        add     ecx, 4                                  ; 2A76 _ 83. C1, 04
        mov     dword [eax+ecx*4+4H], edx               ; 2A79 _ 89. 54 88, 04
        mov     eax, dword [ebp-10H]                    ; 2A7D _ 8B. 45, F0
        lea     edx, [eax+1H]                           ; 2A80 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 2A83 _ 8B. 45, 08
        add     edx, 4                                  ; 2A86 _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 2A89 _ 8B. 44 90, 04
        mov     edx, dword [ebp-10H]                    ; 2A8D _ 8B. 55, F0
        add     edx, 1                                  ; 2A90 _ 83. C2, 01
        mov     dword [eax+18H], edx                    ; 2A93 _ 89. 50, 18
        sub     dword [ebp-10H], 1                      ; 2A96 _ 83. 6D, F0, 01
?_126:  mov     eax, dword [ebp-10H]                    ; 2A9A _ 8B. 45, F0
        cmp     eax, dword [ebp+10H]                    ; 2A9D _ 3B. 45, 10
        jge     ?_125                                   ; 2AA0 _ 7D, BE
        mov     eax, dword [ebp+8H]                     ; 2AA2 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 2AA5 _ 8B. 55, 10
        lea     ecx, [edx+4H]                           ; 2AA8 _ 8D. 4A, 04
        mov     edx, dword [ebp+0CH]                    ; 2AAB _ 8B. 55, 0C
        mov     dword [eax+ecx*4+4H], edx               ; 2AAE _ 89. 54 88, 04
        mov     eax, dword [ebp+8H]                     ; 2AB2 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 2AB5 _ 8B. 40, 0C
        lea     edx, [eax+1H]                           ; 2AB8 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 2ABB _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 2ABE _ 89. 50, 0C
?_127:  mov     eax, dword [ebp+0CH]                    ; 2AC1 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 2AC4 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 2AC7 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 2ACA _ 8B. 40, 08
        lea     esi, [edx+eax]                          ; 2ACD _ 8D. 34 02
        mov     eax, dword [ebp+0CH]                    ; 2AD0 _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 2AD3 _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 2AD6 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 2AD9 _ 8B. 40, 04
        lea     ebx, [edx+eax]                          ; 2ADC _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 2ADF _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 2AE2 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 2AE5 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 2AE8 _ 8B. 40, 0C
        mov     ecx, dword [ebp+10H]                    ; 2AEB _ 8B. 4D, 10
        mov     dword [esp+14H], ecx                    ; 2AEE _ 89. 4C 24, 14
        mov     dword [esp+10H], esi                    ; 2AF2 _ 89. 74 24, 10
        mov     dword [esp+0CH], ebx                    ; 2AF6 _ 89. 5C 24, 0C
        mov     dword [esp+8H], edx                     ; 2AFA _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 2AFE _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2B02 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2B05 _ 89. 04 24
        call    sheet_refresh_map                       ; 2B08 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+0CH]                    ; 2B0D _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 2B10 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 2B13 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 2B16 _ 8B. 40, 08
        lea     esi, [edx+eax]                          ; 2B19 _ 8D. 34 02
        mov     eax, dword [ebp+0CH]                    ; 2B1C _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 2B1F _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 2B22 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 2B25 _ 8B. 40, 04
        lea     ebx, [edx+eax]                          ; 2B28 _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 2B2B _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 2B2E _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 2B31 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 2B34 _ 8B. 40, 0C
        mov     ecx, dword [ebp+10H]                    ; 2B37 _ 8B. 4D, 10
        mov     dword [esp+14H], ecx                    ; 2B3A _ 89. 4C 24, 14
        mov     dword [esp+10H], esi                    ; 2B3E _ 89. 74 24, 10
        mov     dword [esp+0CH], ebx                    ; 2B42 _ 89. 5C 24, 0C
        mov     dword [esp+8H], edx                     ; 2B46 _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 2B4A _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2B4E _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2B51 _ 89. 04 24
        call    sheet_refresh_local                     ; 2B54 _ E8, FFFFFFFC(rel)
?_128:  add     esp, 48                                 ; 2B59 _ 83. C4, 30
        pop     ebx                                     ; 2B5C _ 5B
        pop     esi                                     ; 2B5D _ 5E
        pop     ebp                                     ; 2B5E _ 5D
        ret                                             ; 2B5F _ C3
; sheet_updown End of function

sheet_refresh:; Function begin
        push    ebp                                     ; 2B60 _ 55
        mov     ebp, esp                                ; 2B61 _ 89. E5
        push    edi                                     ; 2B63 _ 57
        push    esi                                     ; 2B64 _ 56
        push    ebx                                     ; 2B65 _ 53
        sub     esp, 44                                 ; 2B66 _ 83. EC, 2C
        mov     eax, dword [ebp+0CH]                    ; 2B69 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 2B6C _ 8B. 40, 18
        test    eax, eax                                ; 2B6F _ 85. C0
        js      ?_129                                   ; 2B71 _ 78, 53
        mov     eax, dword [ebp+0CH]                    ; 2B73 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 2B76 _ 8B. 40, 18
        mov     edx, dword [ebp+0CH]                    ; 2B79 _ 8B. 55, 0C
        mov     ecx, dword [edx+10H]                    ; 2B7C _ 8B. 4A, 10
        mov     edx, dword [ebp+1CH]                    ; 2B7F _ 8B. 55, 1C
        lea     esi, [ecx+edx]                          ; 2B82 _ 8D. 34 11
        mov     edx, dword [ebp+0CH]                    ; 2B85 _ 8B. 55, 0C
        mov     ecx, dword [edx+0CH]                    ; 2B88 _ 8B. 4A, 0C
        mov     edx, dword [ebp+18H]                    ; 2B8B _ 8B. 55, 18
        lea     ebx, [ecx+edx]                          ; 2B8E _ 8D. 1C 11
        mov     edx, dword [ebp+0CH]                    ; 2B91 _ 8B. 55, 0C
        mov     ecx, dword [edx+10H]                    ; 2B94 _ 8B. 4A, 10
        mov     edx, dword [ebp+14H]                    ; 2B97 _ 8B. 55, 14
        add     ecx, edx                                ; 2B9A _ 01. D1
        mov     edx, dword [ebp+0CH]                    ; 2B9C _ 8B. 55, 0C
        mov     edi, dword [edx+0CH]                    ; 2B9F _ 8B. 7A, 0C
        mov     edx, dword [ebp+10H]                    ; 2BA2 _ 8B. 55, 10
        add     edx, edi                                ; 2BA5 _ 01. FA
        mov     dword [esp+14H], eax                    ; 2BA7 _ 89. 44 24, 14
        mov     dword [esp+10H], esi                    ; 2BAB _ 89. 74 24, 10
        mov     dword [esp+0CH], ebx                    ; 2BAF _ 89. 5C 24, 0C
        mov     dword [esp+8H], ecx                     ; 2BB3 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 2BB7 _ 89. 54 24, 04
        mov     eax, dword [ebp+8H]                     ; 2BBB _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2BBE _ 89. 04 24
        call    sheet_refresh_local                     ; 2BC1 _ E8, FFFFFFFC(rel)
?_129:  mov     eax, 0                                  ; 2BC6 _ B8, 00000000
        add     esp, 44                                 ; 2BCB _ 83. C4, 2C
        pop     ebx                                     ; 2BCE _ 5B
        pop     esi                                     ; 2BCF _ 5E
        pop     edi                                     ; 2BD0 _ 5F
        pop     ebp                                     ; 2BD1 _ 5D
        ret                                             ; 2BD2 _ C3
; sheet_refresh End of function

sheet_slide:; Function begin
        push    ebp                                     ; 2BD3 _ 55
        mov     ebp, esp                                ; 2BD4 _ 89. E5
        push    ebx                                     ; 2BD6 _ 53
        sub     esp, 52                                 ; 2BD7 _ 83. EC, 34
        mov     eax, dword [ebp+0CH]                    ; 2BDA _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 2BDD _ 8B. 40, 0C
        mov     dword [ebp-10H], eax                    ; 2BE0 _ 89. 45, F0
        mov     eax, dword [ebp+0CH]                    ; 2BE3 _ 8B. 45, 0C
        mov     eax, dword [eax+10H]                    ; 2BE6 _ 8B. 40, 10
        mov     dword [ebp-0CH], eax                    ; 2BE9 _ 89. 45, F4
        mov     eax, dword [ebp+0CH]                    ; 2BEC _ 8B. 45, 0C
        mov     edx, dword [ebp+10H]                    ; 2BEF _ 8B. 55, 10
        mov     dword [eax+0CH], edx                    ; 2BF2 _ 89. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 2BF5 _ 8B. 45, 0C
        mov     edx, dword [ebp+14H]                    ; 2BF8 _ 8B. 55, 14
        mov     dword [eax+10H], edx                    ; 2BFB _ 89. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 2BFE _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 2C01 _ 8B. 40, 18
        test    eax, eax                                ; 2C04 _ 85. C0
        js      ?_130                                   ; 2C06 _ 0F 88, 00000100
        mov     eax, dword [ebp+0CH]                    ; 2C0C _ 8B. 45, 0C
        mov     edx, dword [eax+8H]                     ; 2C0F _ 8B. 50, 08
        mov     eax, dword [ebp-0CH]                    ; 2C12 _ 8B. 45, F4
        add     edx, eax                                ; 2C15 _ 01. C2
        mov     eax, dword [ebp+0CH]                    ; 2C17 _ 8B. 45, 0C
        mov     ecx, dword [eax+4H]                     ; 2C1A _ 8B. 48, 04
        mov     eax, dword [ebp-10H]                    ; 2C1D _ 8B. 45, F0
        add     eax, ecx                                ; 2C20 _ 01. C8
        mov     dword [esp+14H], 0                      ; 2C22 _ C7. 44 24, 14, 00000000
        mov     dword [esp+10H], edx                    ; 2C2A _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 2C2E _ 89. 44 24, 0C
        mov     eax, dword [ebp-0CH]                    ; 2C32 _ 8B. 45, F4
        mov     dword [esp+8H], eax                     ; 2C35 _ 89. 44 24, 08
        mov     eax, dword [ebp-10H]                    ; 2C39 _ 8B. 45, F0
        mov     dword [esp+4H], eax                     ; 2C3C _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2C40 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2C43 _ 89. 04 24
        call    sheet_refresh_map                       ; 2C46 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+0CH]                    ; 2C4B _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 2C4E _ 8B. 40, 18
        mov     edx, dword [ebp+0CH]                    ; 2C51 _ 8B. 55, 0C
        mov     ecx, dword [edx+8H]                     ; 2C54 _ 8B. 4A, 08
        mov     edx, dword [ebp+14H]                    ; 2C57 _ 8B. 55, 14
        add     ecx, edx                                ; 2C5A _ 01. D1
        mov     edx, dword [ebp+0CH]                    ; 2C5C _ 8B. 55, 0C
        mov     ebx, dword [edx+4H]                     ; 2C5F _ 8B. 5A, 04
        mov     edx, dword [ebp+10H]                    ; 2C62 _ 8B. 55, 10
        add     edx, ebx                                ; 2C65 _ 01. DA
        mov     dword [esp+14H], eax                    ; 2C67 _ 89. 44 24, 14
        mov     dword [esp+10H], ecx                    ; 2C6B _ 89. 4C 24, 10
        mov     dword [esp+0CH], edx                    ; 2C6F _ 89. 54 24, 0C
        mov     eax, dword [ebp+14H]                    ; 2C73 _ 8B. 45, 14
        mov     dword [esp+8H], eax                     ; 2C76 _ 89. 44 24, 08
        mov     eax, dword [ebp+10H]                    ; 2C7A _ 8B. 45, 10
        mov     dword [esp+4H], eax                     ; 2C7D _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2C81 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2C84 _ 89. 04 24
        call    sheet_refresh_map                       ; 2C87 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+0CH]                    ; 2C8C _ 8B. 45, 0C
        mov     edx, dword [eax+8H]                     ; 2C8F _ 8B. 50, 08
        mov     eax, dword [ebp-0CH]                    ; 2C92 _ 8B. 45, F4
        add     edx, eax                                ; 2C95 _ 01. C2
        mov     eax, dword [ebp+0CH]                    ; 2C97 _ 8B. 45, 0C
        mov     ecx, dword [eax+4H]                     ; 2C9A _ 8B. 48, 04
        mov     eax, dword [ebp-10H]                    ; 2C9D _ 8B. 45, F0
        add     eax, ecx                                ; 2CA0 _ 01. C8
        mov     dword [esp+14H], 0                      ; 2CA2 _ C7. 44 24, 14, 00000000
        mov     dword [esp+10H], edx                    ; 2CAA _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 2CAE _ 89. 44 24, 0C
        mov     eax, dword [ebp-0CH]                    ; 2CB2 _ 8B. 45, F4
        mov     dword [esp+8H], eax                     ; 2CB5 _ 89. 44 24, 08
        mov     eax, dword [ebp-10H]                    ; 2CB9 _ 8B. 45, F0
        mov     dword [esp+4H], eax                     ; 2CBC _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2CC0 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2CC3 _ 89. 04 24
        call    sheet_refresh_local                     ; 2CC6 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+0CH]                    ; 2CCB _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 2CCE _ 8B. 40, 18
        mov     edx, dword [ebp+0CH]                    ; 2CD1 _ 8B. 55, 0C
        mov     ecx, dword [edx+8H]                     ; 2CD4 _ 8B. 4A, 08
        mov     edx, dword [ebp+14H]                    ; 2CD7 _ 8B. 55, 14
        add     ecx, edx                                ; 2CDA _ 01. D1
        mov     edx, dword [ebp+0CH]                    ; 2CDC _ 8B. 55, 0C
        mov     ebx, dword [edx+4H]                     ; 2CDF _ 8B. 5A, 04
        mov     edx, dword [ebp+10H]                    ; 2CE2 _ 8B. 55, 10
        add     edx, ebx                                ; 2CE5 _ 01. DA
        mov     dword [esp+14H], eax                    ; 2CE7 _ 89. 44 24, 14
        mov     dword [esp+10H], ecx                    ; 2CEB _ 89. 4C 24, 10
        mov     dword [esp+0CH], edx                    ; 2CEF _ 89. 54 24, 0C
        mov     eax, dword [ebp+14H]                    ; 2CF3 _ 8B. 45, 14
        mov     dword [esp+8H], eax                     ; 2CF6 _ 89. 44 24, 08
        mov     eax, dword [ebp+10H]                    ; 2CFA _ 8B. 45, 10
        mov     dword [esp+4H], eax                     ; 2CFD _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2D01 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2D04 _ 89. 04 24
        call    sheet_refresh_local                     ; 2D07 _ E8, FFFFFFFC(rel)
?_130:  add     esp, 52                                 ; 2D0C _ 83. C4, 34
        pop     ebx                                     ; 2D0F _ 5B
        pop     ebp                                     ; 2D10 _ 5D
        ret                                             ; 2D11 _ C3
; sheet_slide End of function

sheet_refresh_local:; Function begin
        push    ebp                                     ; 2D12 _ 55
        mov     ebp, esp                                ; 2D13 _ 89. E5
        sub     esp, 48                                 ; 2D15 _ 83. EC, 30
        mov     eax, dword [ebp+8H]                     ; 2D18 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 2D1B _ 8B. 00
        mov     dword [ebp-18H], eax                    ; 2D1D _ 89. 45, E8
        mov     eax, dword [ebp+8H]                     ; 2D20 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 2D23 _ 8B. 40, 10
        mov     dword [ebp-14H], eax                    ; 2D26 _ 89. 45, EC
        cmp     dword [ebp+0CH], 0                      ; 2D29 _ 83. 7D, 0C, 00
        jns     ?_131                                   ; 2D2D _ 79, 07
        mov     dword [ebp+0CH], 0                      ; 2D2F _ C7. 45, 0C, 00000000
?_131:  cmp     dword [ebp+10H], 0                      ; 2D36 _ 83. 7D, 10, 00
        jns     ?_132                                   ; 2D3A _ 79, 07
        mov     dword [ebp+10H], 0                      ; 2D3C _ C7. 45, 10, 00000000
?_132:  mov     eax, dword [ebp+8H]                     ; 2D43 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 2D46 _ 8B. 40, 04
        cmp     eax, dword [ebp+14H]                    ; 2D49 _ 3B. 45, 14
        jge     ?_133                                   ; 2D4C _ 7D, 09
        mov     eax, dword [ebp+8H]                     ; 2D4E _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 2D51 _ 8B. 40, 04
        mov     dword [ebp+14H], eax                    ; 2D54 _ 89. 45, 14
?_133:  mov     eax, dword [ebp+8H]                     ; 2D57 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 2D5A _ 8B. 40, 08
        cmp     eax, dword [ebp+18H]                    ; 2D5D _ 3B. 45, 18
        jge     ?_134                                   ; 2D60 _ 7D, 09
        mov     eax, dword [ebp+8H]                     ; 2D62 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 2D65 _ 8B. 40, 08
        mov     dword [ebp+18H], eax                    ; 2D68 _ 89. 45, 18
?_134:  mov     eax, dword [ebp+1CH]                    ; 2D6B _ 8B. 45, 1C
        mov     dword [ebp-24H], eax                    ; 2D6E _ 89. 45, DC
        jmp     ?_141                                   ; 2D71 _ E9, 00000119

?_135:  mov     eax, dword [ebp+8H]                     ; 2D76 _ 8B. 45, 08
        mov     edx, dword [ebp-24H]                    ; 2D79 _ 8B. 55, DC
        add     edx, 4                                  ; 2D7C _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 2D7F _ 8B. 44 90, 04
        mov     dword [ebp-10H], eax                    ; 2D83 _ 89. 45, F0
        mov     eax, dword [ebp-10H]                    ; 2D86 _ 8B. 45, F0
        mov     eax, dword [eax]                        ; 2D89 _ 8B. 00
        mov     dword [ebp-0CH], eax                    ; 2D8B _ 89. 45, F4
        mov     edx, dword [ebp-10H]                    ; 2D8E _ 8B. 55, F0
        mov     eax, dword [ebp+8H]                     ; 2D91 _ 8B. 45, 08
        add     eax, 1044                               ; 2D94 _ 05, 00000414
        sub     edx, eax                                ; 2D99 _ 29. C2
        mov     eax, edx                                ; 2D9B _ 89. D0
        sar     eax, 5                                  ; 2D9D _ C1. F8, 05
        mov     byte [ebp-26H], al                      ; 2DA0 _ 88. 45, DA
        mov     dword [ebp-1CH], 0                      ; 2DA3 _ C7. 45, E4, 00000000
        jmp     ?_140                                   ; 2DAA _ E9, 000000CD

?_136:  mov     eax, dword [ebp-10H]                    ; 2DAF _ 8B. 45, F0
        mov     edx, dword [eax+10H]                    ; 2DB2 _ 8B. 50, 10
        mov     eax, dword [ebp-1CH]                    ; 2DB5 _ 8B. 45, E4
        add     eax, edx                                ; 2DB8 _ 01. D0
        mov     dword [ebp-8H], eax                     ; 2DBA _ 89. 45, F8
        mov     dword [ebp-20H], 0                      ; 2DBD _ C7. 45, E0, 00000000
        jmp     ?_139                                   ; 2DC4 _ E9, 000000A0

?_137:  mov     eax, dword [ebp-10H]                    ; 2DC9 _ 8B. 45, F0
        mov     edx, dword [eax+0CH]                    ; 2DCC _ 8B. 50, 0C
        mov     eax, dword [ebp-20H]                    ; 2DCF _ 8B. 45, E0
        add     eax, edx                                ; 2DD2 _ 01. D0
        mov     dword [ebp-4H], eax                     ; 2DD4 _ 89. 45, FC
        mov     eax, dword [ebp+0CH]                    ; 2DD7 _ 8B. 45, 0C
        cmp     eax, dword [ebp-4H]                     ; 2DDA _ 3B. 45, FC
        jg      ?_138                                   ; 2DDD _ 0F 8F, 00000082
        mov     eax, dword [ebp-4H]                     ; 2DE3 _ 8B. 45, FC
        cmp     eax, dword [ebp+14H]                    ; 2DE6 _ 3B. 45, 14
        jge     ?_138                                   ; 2DE9 _ 7D, 7A
        mov     eax, dword [ebp+10H]                    ; 2DEB _ 8B. 45, 10
        cmp     eax, dword [ebp-8H]                     ; 2DEE _ 3B. 45, F8
        jg      ?_138                                   ; 2DF1 _ 7F, 72
        mov     eax, dword [ebp-8H]                     ; 2DF3 _ 8B. 45, F8
        cmp     eax, dword [ebp+18H]                    ; 2DF6 _ 3B. 45, 18
        jge     ?_138                                   ; 2DF9 _ 7D, 6A
        mov     eax, dword [ebp-10H]                    ; 2DFB _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 2DFE _ 8B. 40, 04
        imul    eax, dword [ebp-1CH]                    ; 2E01 _ 0F AF. 45, E4
        mov     edx, eax                                ; 2E05 _ 89. C2
        mov     eax, dword [ebp-20H]                    ; 2E07 _ 8B. 45, E0
        add     eax, edx                                ; 2E0A _ 01. D0
        mov     edx, eax                                ; 2E0C _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 2E0E _ 8B. 45, F4
        add     eax, edx                                ; 2E11 _ 01. D0
        movzx   eax, byte [eax]                         ; 2E13 _ 0F B6. 00
        mov     byte [ebp-25H], al                      ; 2E16 _ 88. 45, DB
        movzx   edx, byte [ebp-25H]                     ; 2E19 _ 0F B6. 55, DB
        mov     eax, dword [ebp-10H]                    ; 2E1D _ 8B. 45, F0
        mov     eax, dword [eax+14H]                    ; 2E20 _ 8B. 40, 14
        cmp     edx, eax                                ; 2E23 _ 39. C2
        jz      ?_138                                   ; 2E25 _ 74, 3E
        mov     eax, dword [ebp+8H]                     ; 2E27 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 2E2A _ 8B. 40, 04
        imul    eax, dword [ebp-8H]                     ; 2E2D _ 0F AF. 45, F8
        mov     edx, eax                                ; 2E31 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 2E33 _ 8B. 45, FC
        add     eax, edx                                ; 2E36 _ 01. D0
        mov     edx, eax                                ; 2E38 _ 89. C2
        mov     eax, dword [ebp-14H]                    ; 2E3A _ 8B. 45, EC
        add     eax, edx                                ; 2E3D _ 01. D0
        movzx   eax, byte [eax]                         ; 2E3F _ 0F B6. 00
        cmp     al, byte [ebp-26H]                      ; 2E42 _ 3A. 45, DA
        jnz     ?_138                                   ; 2E45 _ 75, 1E
        mov     eax, dword [ebp+8H]                     ; 2E47 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 2E4A _ 8B. 40, 04
        imul    eax, dword [ebp-8H]                     ; 2E4D _ 0F AF. 45, F8
        mov     edx, eax                                ; 2E51 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 2E53 _ 8B. 45, FC
        add     eax, edx                                ; 2E56 _ 01. D0
        mov     edx, eax                                ; 2E58 _ 89. C2
        mov     eax, dword [ebp-18H]                    ; 2E5A _ 8B. 45, E8
        add     edx, eax                                ; 2E5D _ 01. C2
        movzx   eax, byte [ebp-25H]                     ; 2E5F _ 0F B6. 45, DB
        mov     byte [edx], al                          ; 2E63 _ 88. 02
?_138:  add     dword [ebp-20H], 1                      ; 2E65 _ 83. 45, E0, 01
?_139:  mov     eax, dword [ebp-10H]                    ; 2E69 _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 2E6C _ 8B. 40, 04
        cmp     eax, dword [ebp-20H]                    ; 2E6F _ 3B. 45, E0
        jg      ?_137                                   ; 2E72 _ 0F 8F, FFFFFF51
        add     dword [ebp-1CH], 1                      ; 2E78 _ 83. 45, E4, 01
?_140:  mov     eax, dword [ebp-10H]                    ; 2E7C _ 8B. 45, F0
        mov     eax, dword [eax+8H]                     ; 2E7F _ 8B. 40, 08
        cmp     eax, dword [ebp-1CH]                    ; 2E82 _ 3B. 45, E4
        jg      ?_136                                   ; 2E85 _ 0F 8F, FFFFFF24
        add     dword [ebp-24H], 1                      ; 2E8B _ 83. 45, DC, 01
?_141:  mov     eax, dword [ebp+8H]                     ; 2E8F _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 2E92 _ 8B. 40, 0C
        cmp     eax, dword [ebp-24H]                    ; 2E95 _ 3B. 45, DC
        jge     ?_135                                   ; 2E98 _ 0F 8D, FFFFFED8
        leave                                           ; 2E9E _ C9
        ret                                             ; 2E9F _ C3
; sheet_refresh_local End of function

sheet_refresh_map:; Function begin
        push    ebp                                     ; 2EA0 _ 55
        mov     ebp, esp                                ; 2EA1 _ 89. E5
        sub     esp, 64                                 ; 2EA3 _ 83. EC, 40
        mov     eax, dword [ebp+8H]                     ; 2EA6 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 2EA9 _ 8B. 00
        mov     dword [ebp-18H], eax                    ; 2EAB _ 89. 45, E8
        mov     eax, dword [ebp+8H]                     ; 2EAE _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 2EB1 _ 8B. 40, 10
        mov     dword [ebp-14H], eax                    ; 2EB4 _ 89. 45, EC
        cmp     dword [ebp+0CH], 0                      ; 2EB7 _ 83. 7D, 0C, 00
        jns     ?_142                                   ; 2EBB _ 79, 07
        mov     dword [ebp+0CH], 0                      ; 2EBD _ C7. 45, 0C, 00000000
?_142:  cmp     dword [ebp+10H], 0                      ; 2EC4 _ 83. 7D, 10, 00
        jns     ?_143                                   ; 2EC8 _ 79, 07
        mov     dword [ebp+10H], 0                      ; 2ECA _ C7. 45, 10, 00000000
?_143:  mov     eax, dword [ebp+8H]                     ; 2ED1 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 2ED4 _ 8B. 40, 04
        cmp     eax, dword [ebp+14H]                    ; 2ED7 _ 3B. 45, 14
        jge     ?_144                                   ; 2EDA _ 7D, 09
        mov     eax, dword [ebp+8H]                     ; 2EDC _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 2EDF _ 8B. 40, 04
        mov     dword [ebp+14H], eax                    ; 2EE2 _ 89. 45, 14
?_144:  mov     eax, dword [ebp+8H]                     ; 2EE5 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 2EE8 _ 8B. 40, 08
        cmp     eax, dword [ebp+18H]                    ; 2EEB _ 3B. 45, 18
        jge     ?_145                                   ; 2EEE _ 7D, 09
        mov     eax, dword [ebp+8H]                     ; 2EF0 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 2EF3 _ 8B. 40, 08
        mov     dword [ebp+18H], eax                    ; 2EF6 _ 89. 45, 18
?_145:  mov     eax, dword [ebp+1CH]                    ; 2EF9 _ 8B. 45, 1C
        mov     dword [ebp-34H], eax                    ; 2EFC _ 89. 45, CC
        jmp     ?_156                                   ; 2EFF _ E9, 00000141

?_146:  mov     eax, dword [ebp+8H]                     ; 2F04 _ 8B. 45, 08
        mov     edx, dword [ebp-34H]                    ; 2F07 _ 8B. 55, CC
        add     edx, 4                                  ; 2F0A _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 2F0D _ 8B. 44 90, 04
        mov     dword [ebp-10H], eax                    ; 2F11 _ 89. 45, F0
        mov     edx, dword [ebp-10H]                    ; 2F14 _ 8B. 55, F0
        mov     eax, dword [ebp+8H]                     ; 2F17 _ 8B. 45, 08
        add     eax, 1044                               ; 2F1A _ 05, 00000414
        sub     edx, eax                                ; 2F1F _ 29. C2
        mov     eax, edx                                ; 2F21 _ 89. D0
        sar     eax, 5                                  ; 2F23 _ C1. F8, 05
        mov     byte [ebp-35H], al                      ; 2F26 _ 88. 45, CB
        mov     eax, dword [ebp-10H]                    ; 2F29 _ 8B. 45, F0
        mov     eax, dword [eax]                        ; 2F2C _ 8B. 00
        mov     dword [ebp-0CH], eax                    ; 2F2E _ 89. 45, F4
        mov     eax, dword [ebp-10H]                    ; 2F31 _ 8B. 45, F0
        mov     eax, dword [eax+0CH]                    ; 2F34 _ 8B. 40, 0C
        mov     edx, dword [ebp+0CH]                    ; 2F37 _ 8B. 55, 0C
        sub     edx, eax                                ; 2F3A _ 29. C2
        mov     eax, edx                                ; 2F3C _ 89. D0
        mov     dword [ebp-30H], eax                    ; 2F3E _ 89. 45, D0
        mov     eax, dword [ebp-10H]                    ; 2F41 _ 8B. 45, F0
        mov     eax, dword [eax+10H]                    ; 2F44 _ 8B. 40, 10
        mov     edx, dword [ebp+10H]                    ; 2F47 _ 8B. 55, 10
        sub     edx, eax                                ; 2F4A _ 29. C2
        mov     eax, edx                                ; 2F4C _ 89. D0
        mov     dword [ebp-2CH], eax                    ; 2F4E _ 89. 45, D4
        mov     eax, dword [ebp-10H]                    ; 2F51 _ 8B. 45, F0
        mov     eax, dword [eax+0CH]                    ; 2F54 _ 8B. 40, 0C
        mov     edx, dword [ebp+14H]                    ; 2F57 _ 8B. 55, 14
        sub     edx, eax                                ; 2F5A _ 29. C2
        mov     eax, edx                                ; 2F5C _ 89. D0
        mov     dword [ebp-28H], eax                    ; 2F5E _ 89. 45, D8
        mov     eax, dword [ebp-10H]                    ; 2F61 _ 8B. 45, F0
        mov     eax, dword [eax+10H]                    ; 2F64 _ 8B. 40, 10
        mov     edx, dword [ebp+18H]                    ; 2F67 _ 8B. 55, 18
        sub     edx, eax                                ; 2F6A _ 29. C2
        mov     eax, edx                                ; 2F6C _ 89. D0
        mov     dword [ebp-24H], eax                    ; 2F6E _ 89. 45, DC
        cmp     dword [ebp-30H], 0                      ; 2F71 _ 83. 7D, D0, 00
        jns     ?_147                                   ; 2F75 _ 79, 07
        mov     dword [ebp-30H], 0                      ; 2F77 _ C7. 45, D0, 00000000
?_147:  cmp     dword [ebp-2CH], 0                      ; 2F7E _ 83. 7D, D4, 00
        jns     ?_148                                   ; 2F82 _ 79, 07
        mov     dword [ebp-2CH], 0                      ; 2F84 _ C7. 45, D4, 00000000
?_148:  mov     eax, dword [ebp-10H]                    ; 2F8B _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 2F8E _ 8B. 40, 04
        cmp     eax, dword [ebp-28H]                    ; 2F91 _ 3B. 45, D8
        jge     ?_149                                   ; 2F94 _ 7D, 09
        mov     eax, dword [ebp-10H]                    ; 2F96 _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 2F99 _ 8B. 40, 04
        mov     dword [ebp-28H], eax                    ; 2F9C _ 89. 45, D8
?_149:  mov     eax, dword [ebp-10H]                    ; 2F9F _ 8B. 45, F0
        mov     eax, dword [eax+8H]                     ; 2FA2 _ 8B. 40, 08
        cmp     eax, dword [ebp-24H]                    ; 2FA5 _ 3B. 45, DC
        jge     ?_150                                   ; 2FA8 _ 7D, 09
        mov     eax, dword [ebp-10H]                    ; 2FAA _ 8B. 45, F0
        mov     eax, dword [eax+8H]                     ; 2FAD _ 8B. 40, 08
        mov     dword [ebp-24H], eax                    ; 2FB0 _ 89. 45, DC
?_150:  mov     eax, dword [ebp-2CH]                    ; 2FB3 _ 8B. 45, D4
        mov     dword [ebp-1CH], eax                    ; 2FB6 _ 89. 45, E4
        jmp     ?_155                                   ; 2FB9 _ EB, 7A

?_151:  mov     eax, dword [ebp-10H]                    ; 2FBB _ 8B. 45, F0
        mov     edx, dword [eax+10H]                    ; 2FBE _ 8B. 50, 10
        mov     eax, dword [ebp-1CH]                    ; 2FC1 _ 8B. 45, E4
        add     eax, edx                                ; 2FC4 _ 01. D0
        mov     dword [ebp-8H], eax                     ; 2FC6 _ 89. 45, F8
        mov     eax, dword [ebp-30H]                    ; 2FC9 _ 8B. 45, D0
        mov     dword [ebp-20H], eax                    ; 2FCC _ 89. 45, E0
        jmp     ?_154                                   ; 2FCF _ EB, 58

?_152:  mov     eax, dword [ebp-10H]                    ; 2FD1 _ 8B. 45, F0
        mov     edx, dword [eax+0CH]                    ; 2FD4 _ 8B. 50, 0C
        mov     eax, dword [ebp-20H]                    ; 2FD7 _ 8B. 45, E0
        add     eax, edx                                ; 2FDA _ 01. D0
        mov     dword [ebp-4H], eax                     ; 2FDC _ 89. 45, FC
        mov     eax, dword [ebp-10H]                    ; 2FDF _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 2FE2 _ 8B. 40, 04
        imul    eax, dword [ebp-1CH]                    ; 2FE5 _ 0F AF. 45, E4
        mov     edx, eax                                ; 2FE9 _ 89. C2
        mov     eax, dword [ebp-20H]                    ; 2FEB _ 8B. 45, E0
        add     eax, edx                                ; 2FEE _ 01. D0
        mov     edx, eax                                ; 2FF0 _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 2FF2 _ 8B. 45, F4
        add     eax, edx                                ; 2FF5 _ 01. D0
        movzx   eax, byte [eax]                         ; 2FF7 _ 0F B6. 00
        movzx   edx, al                                 ; 2FFA _ 0F B6. D0
        mov     eax, dword [ebp-10H]                    ; 2FFD _ 8B. 45, F0
        mov     eax, dword [eax+14H]                    ; 3000 _ 8B. 40, 14
        cmp     edx, eax                                ; 3003 _ 39. C2
        jz      ?_153                                   ; 3005 _ 74, 1E
        mov     eax, dword [ebp+8H]                     ; 3007 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 300A _ 8B. 40, 04
        imul    eax, dword [ebp-8H]                     ; 300D _ 0F AF. 45, F8
        mov     edx, eax                                ; 3011 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 3013 _ 8B. 45, FC
        add     eax, edx                                ; 3016 _ 01. D0
        mov     edx, eax                                ; 3018 _ 89. C2
        mov     eax, dword [ebp-14H]                    ; 301A _ 8B. 45, EC
        add     edx, eax                                ; 301D _ 01. C2
        movzx   eax, byte [ebp-35H]                     ; 301F _ 0F B6. 45, CB
        mov     byte [edx], al                          ; 3023 _ 88. 02
?_153:  add     dword [ebp-20H], 1                      ; 3025 _ 83. 45, E0, 01
?_154:  mov     eax, dword [ebp-20H]                    ; 3029 _ 8B. 45, E0
        cmp     eax, dword [ebp-28H]                    ; 302C _ 3B. 45, D8
        jl      ?_152                                   ; 302F _ 7C, A0
        add     dword [ebp-1CH], 1                      ; 3031 _ 83. 45, E4, 01
?_155:  mov     eax, dword [ebp-1CH]                    ; 3035 _ 8B. 45, E4
        cmp     eax, dword [ebp-24H]                    ; 3038 _ 3B. 45, DC
        jl      ?_151                                   ; 303B _ 0F 8C, FFFFFF7A
        add     dword [ebp-34H], 1                      ; 3041 _ 83. 45, CC, 01
?_156:  mov     eax, dword [ebp+8H]                     ; 3045 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 3048 _ 8B. 40, 0C
        cmp     eax, dword [ebp-34H]                    ; 304B _ 3B. 45, CC
        jge     ?_146                                   ; 304E _ 0F 8D, FFFFFEB0
        leave                                           ; 3054 _ C9
        ret                                             ; 3055 _ C3
; sheet_refresh_map End of function

init_time_port:; Function begin
        push    ebp                                     ; 3056 _ 55
        mov     ebp, esp                                ; 3057 _ 89. E5
        sub     esp, 40                                 ; 3059 _ 83. EC, 28
        mov     dword [esp+4H], 52                      ; 305C _ C7. 44 24, 04, 00000034
        mov     dword [esp], 67                         ; 3064 _ C7. 04 24, 00000043
        call    io_out8                                 ; 306B _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 156                     ; 3070 _ C7. 44 24, 04, 0000009C
        mov     dword [esp], 64                         ; 3078 _ C7. 04 24, 00000040
        call    io_out8                                 ; 307F _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 46                      ; 3084 _ C7. 44 24, 04, 0000002E
        mov     dword [esp], 64                         ; 308C _ C7. 04 24, 00000040
        call    io_out8                                 ; 3093 _ E8, FFFFFFFC(rel)
        mov     dword [timer_control], 0                ; 3098 _ C7. 05, 00000340(d), 00000000
        mov     dword [ebp-0CH], 0                      ; 30A2 _ C7. 45, F4, 00000000
        jmp     ?_158                                   ; 30A9 _ EB, 28

?_157:  mov     eax, dword [ebp-0CH]                    ; 30AB _ 8B. 45, F4
        shl     eax, 4                                  ; 30AE _ C1. E0, 04
        add     eax, timer_control                      ; 30B1 _ 05, 00000340(d)
        mov     dword [eax+8H], 0                       ; 30B6 _ C7. 40, 08, 00000000
        mov     eax, dword [ebp-0CH]                    ; 30BD _ 8B. 45, F4
        shl     eax, 4                                  ; 30C0 _ C1. E0, 04
        add     eax, timer_control                      ; 30C3 _ 05, 00000340(d)
        mov     dword [eax+0CH], 0                      ; 30C8 _ C7. 40, 0C, 00000000
        add     dword [ebp-0CH], 1                      ; 30CF _ 83. 45, F4, 01
?_158:  cmp     dword [ebp-0CH], 499                    ; 30D3 _ 81. 7D, F4, 000001F3
        jle     ?_157                                   ; 30DA _ 7E, CF
        leave                                           ; 30DC _ C9
        ret                                             ; 30DD _ C3
; init_time_port End of function

get_timer_control:; Function begin
        push    ebp                                     ; 30DE _ 55
        mov     ebp, esp                                ; 30DF _ 89. E5
        mov     eax, timer_control                      ; 30E1 _ B8, 00000340(d)
        pop     ebp                                     ; 30E6 _ 5D
        ret                                             ; 30E7 _ C3
; get_timer_control End of function

timer_alloc:; Function begin
        push    ebp                                     ; 30E8 _ 55
        mov     ebp, esp                                ; 30E9 _ 89. E5
        sub     esp, 16                                 ; 30EB _ 83. EC, 10
        mov     dword [ebp-4H], 0                       ; 30EE _ C7. 45, FC, 00000000
        jmp     ?_161                                   ; 30F5 _ EB, 26

?_159:  mov     eax, dword [ebp-4H]                     ; 30F7 _ 8B. 45, FC
        shl     eax, 4                                  ; 30FA _ C1. E0, 04
        add     eax, timer_control                      ; 30FD _ 05, 00000340(d)
        mov     eax, dword [eax+8H]                     ; 3102 _ 8B. 40, 08
        test    eax, eax                                ; 3105 _ 85. C0
        jnz     ?_160                                   ; 3107 _ 75, 10
        mov     eax, dword [ebp-4H]                     ; 3109 _ 8B. 45, FC
        shl     eax, 4                                  ; 310C _ C1. E0, 04
        add     eax, timer_control                      ; 310F _ 05, 00000340(d)
        add     eax, 4                                  ; 3114 _ 83. C0, 04
        jmp     ?_162                                   ; 3117 _ EB, 0D

?_160:  add     dword [ebp-4H], 1                       ; 3119 _ 83. 45, FC, 01
?_161:  cmp     dword [ebp-4H], 499                     ; 311D _ 81. 7D, FC, 000001F3
        jle     ?_159                                   ; 3124 _ 7E, D1
?_162:  leave                                           ; 3126 _ C9
        ret                                             ; 3127 _ C3
; timer_alloc End of function

timer_free:; Function begin
        push    ebp                                     ; 3128 _ 55
        mov     ebp, esp                                ; 3129 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 312B _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 312E _ C7. 40, 04, 00000000
        pop     ebp                                     ; 3135 _ 5D
        ret                                             ; 3136 _ C3
; timer_free End of function

timer_init:; Function begin
        push    ebp                                     ; 3137 _ 55
        mov     ebp, esp                                ; 3138 _ 89. E5
        sub     esp, 4                                  ; 313A _ 83. EC, 04
        mov     eax, dword [ebp+10H]                    ; 313D _ 8B. 45, 10
        mov     byte [ebp-4H], al                       ; 3140 _ 88. 45, FC
        mov     eax, dword [ebp+8H]                     ; 3143 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 3146 _ 8B. 55, 0C
        mov     dword [eax+8H], edx                     ; 3149 _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 314C _ 8B. 45, 08
        movzx   edx, byte [ebp-4H]                      ; 314F _ 0F B6. 55, FC
        mov     byte [eax+0CH], dl                      ; 3153 _ 88. 50, 0C
        leave                                           ; 3156 _ C9
        ret                                             ; 3157 _ C3
; timer_init End of function

timer_settime:; Function begin
        push    ebp                                     ; 3158 _ 55
        mov     ebp, esp                                ; 3159 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 315B _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 315E _ 8B. 55, 0C
        mov     dword [eax], edx                        ; 3161 _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 3163 _ 8B. 45, 08
        mov     dword [eax+4H], 2                       ; 3166 _ C7. 40, 04, 00000002
        pop     ebp                                     ; 316D _ 5D
        ret                                             ; 316E _ C3
; timer_settime End of function

intHandlerTimer:; Function begin
        push    ebp                                     ; 316F _ 55
        mov     ebp, esp                                ; 3170 _ 89. E5
        sub     esp, 40                                 ; 3172 _ 83. EC, 28
        mov     dword [esp+4H], 96                      ; 3175 _ C7. 44 24, 04, 00000060
        mov     dword [esp], 32                         ; 317D _ C7. 04 24, 00000020
        call    io_out8                                 ; 3184 _ E8, FFFFFFFC(rel)
        mov     eax, dword [timer_control]              ; 3189 _ A1, 00000340(d)
        add     eax, 1                                  ; 318E _ 83. C0, 01
        mov     dword [timer_control], eax              ; 3191 _ A3, 00000340(d)
        mov     byte [ebp-0DH], 0                       ; 3196 _ C6. 45, F3, 00
        mov     dword [ebp-0CH], 0                      ; 319A _ C7. 45, F4, 00000000
        jmp     ?_166                                   ; 31A1 _ E9, 000000B0

?_163:  mov     eax, dword [ebp-0CH]                    ; 31A6 _ 8B. 45, F4
        shl     eax, 4                                  ; 31A9 _ C1. E0, 04
        add     eax, timer_control                      ; 31AC _ 05, 00000340(d)
        mov     eax, dword [eax+8H]                     ; 31B1 _ 8B. 40, 08
        cmp     eax, 2                                  ; 31B4 _ 83. F8, 02
        jne     ?_164                                   ; 31B7 _ 0F 85, 0000008A
        mov     eax, dword [ebp-0CH]                    ; 31BD _ 8B. 45, F4
        shl     eax, 4                                  ; 31C0 _ C1. E0, 04
        add     eax, timer_control                      ; 31C3 _ 05, 00000340(d)
        mov     eax, dword [eax+4H]                     ; 31C8 _ 8B. 40, 04
        lea     edx, [eax-1H]                           ; 31CB _ 8D. 50, FF
        mov     eax, dword [ebp-0CH]                    ; 31CE _ 8B. 45, F4
        shl     eax, 4                                  ; 31D1 _ C1. E0, 04
        add     eax, timer_control                      ; 31D4 _ 05, 00000340(d)
        mov     dword [eax+4H], edx                     ; 31D9 _ 89. 50, 04
        mov     eax, dword [ebp-0CH]                    ; 31DC _ 8B. 45, F4
        shl     eax, 4                                  ; 31DF _ C1. E0, 04
        add     eax, timer_control                      ; 31E2 _ 05, 00000340(d)
        mov     eax, dword [eax+4H]                     ; 31E7 _ 8B. 40, 04
        test    eax, eax                                ; 31EA _ 85. C0
        jnz     ?_164                                   ; 31EC _ 75, 59
        mov     eax, dword [ebp-0CH]                    ; 31EE _ 8B. 45, F4
        shl     eax, 4                                  ; 31F1 _ C1. E0, 04
        add     eax, timer_control                      ; 31F4 _ 05, 00000340(d)
        mov     dword [eax+8H], 1                       ; 31F9 _ C7. 40, 08, 00000001
        mov     eax, dword [ebp-0CH]                    ; 3200 _ 8B. 45, F4
        shl     eax, 4                                  ; 3203 _ C1. E0, 04
        add     eax, timer_control                      ; 3206 _ 05, 00000340(d)
        movzx   eax, byte [eax+10H]                     ; 320B _ 0F B6. 40, 10
        movzx   edx, al                                 ; 320F _ 0F B6. D0
        mov     eax, dword [ebp-0CH]                    ; 3212 _ 8B. 45, F4
        shl     eax, 4                                  ; 3215 _ C1. E0, 04
        add     eax, timer_control                      ; 3218 _ 05, 00000340(d)
        mov     eax, dword [eax+0CH]                    ; 321D _ 8B. 40, 0C
        mov     dword [esp+4H], edx                     ; 3220 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 3224 _ 89. 04 24
        call    fifo8_put                               ; 3227 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 322C _ 8B. 45, F4
        shl     eax, 4                                  ; 322F _ C1. E0, 04
        add     eax, timer_control                      ; 3232 _ 05, 00000340(d)
        lea     edx, [eax+4H]                           ; 3237 _ 8D. 50, 04
        mov     eax, dword [task_timer]                 ; 323A _ A1, 00000000(d)
        cmp     edx, eax                                ; 323F _ 39. C2
        jnz     ?_164                                   ; 3241 _ 75, 04
        mov     byte [ebp-0DH], 1                       ; 3243 _ C6. 45, F3, 01
?_164:  cmp     byte [ebp-0DH], 0                       ; 3247 _ 80. 7D, F3, 00
        jz      ?_165                                   ; 324B _ 74, 05
        call    task_switch                             ; 324D _ E8, FFFFFFFC(rel)
?_165:  add     dword [ebp-0CH], 1                      ; 3252 _ 83. 45, F4, 01
?_166:  cmp     dword [ebp-0CH], 499                    ; 3256 _ 81. 7D, F4, 000001F3
        jle     ?_163                                   ; 325D _ 0F 8E, FFFFFF43
        leave                                           ; 3263 _ C9
        ret                                             ; 3264 _ C3
; intHandlerTimer End of function

segment_descriptor:; Function begin
        push    ebp                                     ; 3265 _ 55
        mov     ebp, esp                                ; 3266 _ 89. E5
        cmp     dword [ebp+0CH], 1048575                ; 3268 _ 81. 7D, 0C, 000FFFFF
        jbe     ?_167                                   ; 326F _ 76, 10
        or      dword [ebp+14H], 8000H                  ; 3271 _ 81. 4D, 14, 00008000
        mov     eax, dword [ebp+0CH]                    ; 3278 _ 8B. 45, 0C
        shr     eax, 12                                 ; 327B _ C1. E8, 0C
        mov     dword [ebp+0CH], eax                    ; 327E _ 89. 45, 0C
?_167:  mov     eax, dword [ebp+0CH]                    ; 3281 _ 8B. 45, 0C
        mov     edx, eax                                ; 3284 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 3286 _ 8B. 45, 08
        mov     word [eax], dx                          ; 3289 _ 66: 89. 10
        mov     eax, dword [ebp+10H]                    ; 328C _ 8B. 45, 10
        mov     edx, eax                                ; 328F _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 3291 _ 8B. 45, 08
        mov     word [eax+2H], dx                       ; 3294 _ 66: 89. 50, 02
        mov     eax, dword [ebp+10H]                    ; 3298 _ 8B. 45, 10
        sar     eax, 16                                 ; 329B _ C1. F8, 10
        mov     edx, eax                                ; 329E _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 32A0 _ 8B. 45, 08
        mov     byte [eax+4H], dl                       ; 32A3 _ 88. 50, 04
        mov     eax, dword [ebp+14H]                    ; 32A6 _ 8B. 45, 14
        mov     edx, eax                                ; 32A9 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 32AB _ 8B. 45, 08
        mov     byte [eax+5H], dl                       ; 32AE _ 88. 50, 05
        mov     eax, dword [ebp+0CH]                    ; 32B1 _ 8B. 45, 0C
        shr     eax, 16                                 ; 32B4 _ C1. E8, 10
        and     eax, 0FH                                ; 32B7 _ 83. E0, 0F
        mov     edx, eax                                ; 32BA _ 89. C2
        mov     eax, dword [ebp+14H]                    ; 32BC _ 8B. 45, 14
        sar     eax, 8                                  ; 32BF _ C1. F8, 08
        and     eax, 0FFFFFFF0H                         ; 32C2 _ 83. E0, F0
        or      eax, edx                                ; 32C5 _ 09. D0
        mov     edx, eax                                ; 32C7 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 32C9 _ 8B. 45, 08
        mov     byte [eax+6H], dl                       ; 32CC _ 88. 50, 06
        mov     eax, dword [ebp+10H]                    ; 32CF _ 8B. 45, 10
        shr     eax, 24                                 ; 32D2 _ C1. E8, 18
        mov     edx, eax                                ; 32D5 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 32D7 _ 8B. 45, 08
        mov     byte [eax+7H], dl                       ; 32DA _ 88. 50, 07
        pop     ebp                                     ; 32DD _ 5D
        ret                                             ; 32DE _ C3
; segment_descriptor End of function

task_init:; Function begin
        push    ebp                                     ; 32DF _ 55
        mov     ebp, esp                                ; 32E0 _ 89. E5
        push    ebx                                     ; 32E2 _ 53
        sub     esp, 36                                 ; 32E3 _ 83. EC, 24
        call    get_addr_gdt                            ; 32E6 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 32EB _ 89. 45, F0
        mov     dword [esp+4H], 1168                    ; 32EE _ C7. 44 24, 04, 00000490
        mov     eax, dword [ebp+8H]                     ; 32F6 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 32F9 _ 89. 04 24
        call    memman_alloc_4k                         ; 32FC _ E8, FFFFFFFC(rel)
        mov     dword [task_control], eax               ; 3301 _ A3, 00002288(d)
        mov     dword [ebp-14H], 0                      ; 3306 _ C7. 45, EC, 00000000
        jmp     ?_169                                   ; 330D _ E9, 0000009A

?_168:  mov     ecx, dword [task_control]               ; 3312 _ 8B. 0D, 00002288(d)
        mov     eax, dword [ebp-14H]                    ; 3318 _ 8B. 45, EC
        shl     eax, 4                                  ; 331B _ C1. E0, 04
        lea     edx, [eax*8]                            ; 331E _ 8D. 14 C5, 00000000
        sub     edx, eax                                ; 3325 _ 29. C2
        lea     eax, [ecx+edx]                          ; 3327 _ 8D. 04 11
        add     eax, 20                                 ; 332A _ 83. C0, 14
        mov     dword [eax], 0                          ; 332D _ C7. 00, 00000000
        mov     ebx, dword [task_control]               ; 3333 _ 8B. 1D, 00002288(d)
        mov     eax, dword [ebp-14H]                    ; 3339 _ 8B. 45, EC
        add     eax, 8                                  ; 333C _ 83. C0, 08
        lea     ecx, [eax*8]                            ; 333F _ 8D. 0C C5, 00000000
        mov     eax, dword [ebp-14H]                    ; 3346 _ 8B. 45, EC
        shl     eax, 4                                  ; 3349 _ C1. E0, 04
        lea     edx, [eax*8]                            ; 334C _ 8D. 14 C5, 00000000
        sub     edx, eax                                ; 3353 _ 29. C2
        lea     eax, [ebx+edx]                          ; 3355 _ 8D. 04 13
        add     eax, 16                                 ; 3358 _ 83. C0, 10
        mov     dword [eax], ecx                        ; 335B _ 89. 08
        mov     ecx, dword [task_control]               ; 335D _ 8B. 0D, 00002288(d)
        mov     eax, dword [ebp-14H]                    ; 3363 _ 8B. 45, EC
        shl     eax, 4                                  ; 3366 _ C1. E0, 04
        lea     edx, [eax*8]                            ; 3369 _ 8D. 14 C5, 00000000
        sub     edx, eax                                ; 3370 _ 29. C2
        lea     eax, [edx+10H]                          ; 3372 _ 8D. 42, 10
        add     eax, ecx                                ; 3375 _ 01. C8
        add     eax, 8                                  ; 3377 _ 83. C0, 08
        mov     edx, dword [ebp-14H]                    ; 337A _ 8B. 55, EC
        add     edx, 8                                  ; 337D _ 83. C2, 08
        lea     ecx, [edx*8]                            ; 3380 _ 8D. 0C D5, 00000000
        mov     edx, dword [ebp-10H]                    ; 3387 _ 8B. 55, F0
        add     edx, ecx                                ; 338A _ 01. CA
        mov     dword [esp+0CH], 137                    ; 338C _ C7. 44 24, 0C, 00000089
        mov     dword [esp+8H], eax                     ; 3394 _ 89. 44 24, 08
        mov     dword [esp+4H], 103                     ; 3398 _ C7. 44 24, 04, 00000067
        mov     dword [esp], edx                        ; 33A0 _ 89. 14 24
        call    segment_descriptor                      ; 33A3 _ E8, FFFFFFFC(rel)
        add     dword [ebp-14H], 1                      ; 33A8 _ 83. 45, EC, 01
?_169:  cmp     dword [ebp-14H], 1                      ; 33AC _ 83. 7D, EC, 01
        jle     ?_168                                   ; 33B0 _ 0F 8E, FFFFFF5C
        call    task_alloc                              ; 33B6 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 33BB _ 89. 45, F4
        mov     eax, dword [ebp-0CH]                    ; 33BE _ 8B. 45, F4
        mov     dword [eax+4H], 2                       ; 33C1 _ C7. 40, 04, 00000002
        mov     eax, dword [task_control]               ; 33C8 _ A1, 00002288(d)
        mov     dword [eax], 1                          ; 33CD _ C7. 00, 00000001
        mov     eax, dword [task_control]               ; 33D3 _ A1, 00002288(d)
        mov     dword [eax+4H], 0                       ; 33D8 _ C7. 40, 04, 00000000
        mov     eax, dword [task_control]               ; 33DF _ A1, 00002288(d)
        mov     edx, dword [ebp-0CH]                    ; 33E4 _ 8B. 55, F4
        mov     dword [eax+8H], edx                     ; 33E7 _ 89. 50, 08
        mov     eax, dword [ebp-0CH]                    ; 33EA _ 8B. 45, F4
        mov     eax, dword [eax]                        ; 33ED _ 8B. 00
        mov     dword [esp], eax                        ; 33EF _ 89. 04 24
        call    load_tr                                 ; 33F2 _ E8, FFFFFFFC(rel)
        call    timer_alloc                             ; 33F7 _ E8, FFFFFFFC(rel)
        mov     dword [task_timer], eax                 ; 33FC _ A3, 00002284(d)
        mov     eax, dword [task_timer]                 ; 3401 _ A1, 00002284(d)
        mov     dword [esp+4H], 100                     ; 3406 _ C7. 44 24, 04, 00000064
        mov     dword [esp], eax                        ; 340E _ 89. 04 24
        call    timer_settime                           ; 3411 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 3416 _ 8B. 45, F4
        add     esp, 36                                 ; 3419 _ 83. C4, 24
        pop     ebx                                     ; 341C _ 5B
        pop     ebp                                     ; 341D _ 5D
        ret                                             ; 341E _ C3
; task_init End of function

task_alloc:; Function begin
        push    ebp                                     ; 341F _ 55
        mov     ebp, esp                                ; 3420 _ 89. E5
        sub     esp, 16                                 ; 3422 _ 83. EC, 10
        mov     dword [ebp-8H], 0                       ; 3425 _ C7. 45, F8, 00000000
        jmp     ?_172                                   ; 342C _ E9, 000000F2

?_170:  mov     ecx, dword [task_control]               ; 3431 _ 8B. 0D, 00002288(d)
        mov     eax, dword [ebp-8H]                     ; 3437 _ 8B. 45, F8
        shl     eax, 4                                  ; 343A _ C1. E0, 04
        lea     edx, [eax*8]                            ; 343D _ 8D. 14 C5, 00000000
        sub     edx, eax                                ; 3444 _ 29. C2
        lea     eax, [ecx+edx]                          ; 3446 _ 8D. 04 11
        add     eax, 20                                 ; 3449 _ 83. C0, 14
        mov     eax, dword [eax]                        ; 344C _ 8B. 00
        test    eax, eax                                ; 344E _ 85. C0
        jne     ?_171                                   ; 3450 _ 0F 85, 000000C9
        mov     ecx, dword [task_control]               ; 3456 _ 8B. 0D, 00002288(d)
        mov     eax, dword [ebp-8H]                     ; 345C _ 8B. 45, F8
        shl     eax, 4                                  ; 345F _ C1. E0, 04
        lea     edx, [eax*8]                            ; 3462 _ 8D. 14 C5, 00000000
        sub     edx, eax                                ; 3469 _ 29. C2
        lea     eax, [edx+10H]                          ; 346B _ 8D. 42, 10
        add     eax, ecx                                ; 346E _ 01. C8
        mov     dword [ebp-4H], eax                     ; 3470 _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 3473 _ 8B. 45, FC
        mov     dword [eax+4H], 1                       ; 3476 _ C7. 40, 04, 00000001
        mov     eax, dword [ebp-4H]                     ; 347D _ 8B. 45, FC
        mov     dword [eax+2CH], 514                    ; 3480 _ C7. 40, 2C, 00000202
        mov     eax, dword [ebp-4H]                     ; 3487 _ 8B. 45, FC
        mov     dword [eax+30H], 0                      ; 348A _ C7. 40, 30, 00000000
        mov     eax, dword [ebp-4H]                     ; 3491 _ 8B. 45, FC
        mov     dword [eax+34H], 0                      ; 3494 _ C7. 40, 34, 00000000
        mov     eax, dword [ebp-4H]                     ; 349B _ 8B. 45, FC
        mov     dword [eax+38H], 0                      ; 349E _ C7. 40, 38, 00000000
        mov     eax, dword [ebp-4H]                     ; 34A5 _ 8B. 45, FC
        mov     dword [eax+3CH], 0                      ; 34A8 _ C7. 40, 3C, 00000000
        mov     eax, dword [ebp-8H]                     ; 34AF _ 8B. 45, F8
        add     eax, 1                                  ; 34B2 _ 83. C0, 01
        shl     eax, 9                                  ; 34B5 _ C1. E0, 09
        mov     edx, eax                                ; 34B8 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 34BA _ 8B. 45, FC
        mov     dword [eax+40H], edx                    ; 34BD _ 89. 50, 40
        mov     eax, dword [ebp-4H]                     ; 34C0 _ 8B. 45, FC
        mov     dword [eax+44H], 0                      ; 34C3 _ C7. 40, 44, 00000000
        mov     eax, dword [ebp-4H]                     ; 34CA _ 8B. 45, FC
        mov     dword [eax+48H], 0                      ; 34CD _ C7. 40, 48, 00000000
        mov     eax, dword [ebp-4H]                     ; 34D4 _ 8B. 45, FC
        mov     dword [eax+4CH], 0                      ; 34D7 _ C7. 40, 4C, 00000000
        mov     eax, dword [ebp-4H]                     ; 34DE _ 8B. 45, FC
        mov     dword [eax+50H], 0                      ; 34E1 _ C7. 40, 50, 00000000
        mov     eax, dword [ebp-4H]                     ; 34E8 _ 8B. 45, FC
        mov     dword [eax+5CH], 0                      ; 34EB _ C7. 40, 5C, 00000000
        mov     eax, dword [ebp-4H]                     ; 34F2 _ 8B. 45, FC
        mov     dword [eax+60H], 0                      ; 34F5 _ C7. 40, 60, 00000000
        mov     eax, dword [ebp-4H]                     ; 34FC _ 8B. 45, FC
        mov     dword [eax+64H], 0                      ; 34FF _ C7. 40, 64, 00000000
        mov     eax, dword [ebp-4H]                     ; 3506 _ 8B. 45, FC
        mov     dword [eax+68H], 0                      ; 3509 _ C7. 40, 68, 00000000
        mov     eax, dword [ebp-4H]                     ; 3510 _ 8B. 45, FC
        mov     dword [eax+6CH], 1073741824             ; 3513 _ C7. 40, 6C, 40000000
        mov     eax, dword [ebp-4H]                     ; 351A _ 8B. 45, FC
        jmp     ?_173                                   ; 351D _ EB, 13

?_171:  add     dword [ebp-8H], 1                       ; 351F _ 83. 45, F8, 01
?_172:  cmp     dword [ebp-8H], 1                       ; 3523 _ 83. 7D, F8, 01
        jle     ?_170                                   ; 3527 _ 0F 8E, FFFFFF04
        mov     eax, 0                                  ; 352D _ B8, 00000000
?_173:  leave                                           ; 3532 _ C9
        ret                                             ; 3533 _ C3
; task_alloc End of function

task_run:; Function begin
        push    ebp                                     ; 3534 _ 55
        mov     ebp, esp                                ; 3535 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 3537 _ 8B. 45, 08
        mov     dword [eax+4H], 2                       ; 353A _ C7. 40, 04, 00000002
        mov     eax, dword [task_control]               ; 3541 _ A1, 00002288(d)
        mov     edx, dword [task_control]               ; 3546 _ 8B. 15, 00002288(d)
        mov     edx, dword [edx]                        ; 354C _ 8B. 12
        mov     ecx, dword [ebp+8H]                     ; 354E _ 8B. 4D, 08
        mov     dword [eax+edx*4+8H], ecx               ; 3551 _ 89. 4C 90, 08
        mov     eax, dword [task_control]               ; 3555 _ A1, 00002288(d)
        mov     edx, dword [eax]                        ; 355A _ 8B. 10
        add     edx, 1                                  ; 355C _ 83. C2, 01
        mov     dword [eax], edx                        ; 355F _ 89. 10
        pop     ebp                                     ; 3561 _ 5D
        ret                                             ; 3562 _ C3
; task_run End of function

task_switch:; Function begin
        push    ebp                                     ; 3563 _ 55
        mov     ebp, esp                                ; 3564 _ 89. E5
        sub     esp, 24                                 ; 3566 _ 83. EC, 18
        mov     eax, dword [task_timer]                 ; 3569 _ A1, 00002284(d)
        mov     dword [esp+4H], 100                     ; 356E _ C7. 44 24, 04, 00000064
        mov     dword [esp], eax                        ; 3576 _ 89. 04 24
        call    timer_settime                           ; 3579 _ E8, FFFFFFFC(rel)
        mov     eax, dword [task_control]               ; 357E _ A1, 00002288(d)
        mov     eax, dword [eax]                        ; 3583 _ 8B. 00
        cmp     eax, 1                                  ; 3585 _ 83. F8, 01
        jle     ?_175                                   ; 3588 _ 7E, 51
        mov     eax, dword [task_control]               ; 358A _ A1, 00002288(d)
        mov     edx, dword [eax+4H]                     ; 358F _ 8B. 50, 04
        add     edx, 1                                  ; 3592 _ 83. C2, 01
        mov     dword [eax+4H], edx                     ; 3595 _ 89. 50, 04
        mov     eax, dword [task_control]               ; 3598 _ A1, 00002288(d)
        mov     edx, dword [eax+4H]                     ; 359D _ 8B. 50, 04
        mov     eax, dword [task_control]               ; 35A0 _ A1, 00002288(d)
        mov     eax, dword [eax]                        ; 35A5 _ 8B. 00
        cmp     edx, eax                                ; 35A7 _ 39. C2
        jnz     ?_174                                   ; 35A9 _ 75, 0C
        mov     eax, dword [task_control]               ; 35AB _ A1, 00002288(d)
        mov     dword [eax+4H], 0                       ; 35B0 _ C7. 40, 04, 00000000
?_174:  mov     eax, dword [task_control]               ; 35B7 _ A1, 00002288(d)
        mov     edx, dword [task_control]               ; 35BC _ 8B. 15, 00002288(d)
        mov     edx, dword [edx+4H]                     ; 35C2 _ 8B. 52, 04
        mov     eax, dword [eax+edx*4+8H]               ; 35C5 _ 8B. 44 90, 08
        mov     eax, dword [eax]                        ; 35C9 _ 8B. 00
        mov     dword [esp+4H], eax                     ; 35CB _ 89. 44 24, 04
        mov     dword [esp], 0                          ; 35CF _ C7. 04 24, 00000000
        call    farjmp                                  ; 35D6 _ E8, FFFFFFFC(rel)
?_175:  leave                                           ; 35DB _ C9
        ret                                             ; 35DC _ C3
; task_switch End of function

task_sleep:; Function begin
        push    ebp                                     ; 35DD _ 55
        mov     ebp, esp                                ; 35DE _ 89. E5
        sub     esp, 40                                 ; 35E0 _ 83. EC, 28
        mov     byte [ebp-0DH], 0                       ; 35E3 _ C6. 45, F3, 00
        mov     eax, dword [ebp+8H]                     ; 35E7 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 35EA _ 8B. 40, 04
        cmp     eax, 2                                  ; 35ED _ 83. F8, 02
        jne     ?_185                                   ; 35F0 _ 0F 85, 000000DE
        mov     eax, dword [task_control]               ; 35F6 _ A1, 00002288(d)
        mov     edx, dword [task_control]               ; 35FB _ 8B. 15, 00002288(d)
        mov     edx, dword [edx+4H]                     ; 3601 _ 8B. 52, 04
        mov     eax, dword [eax+edx*4+8H]               ; 3604 _ 8B. 44 90, 08
        cmp     eax, dword [ebp+8H]                     ; 3608 _ 3B. 45, 08
        jnz     ?_176                                   ; 360B _ 75, 04
        mov     byte [ebp-0DH], 1                       ; 360D _ C6. 45, F3, 01
?_176:  mov     dword [ebp-0CH], 0                      ; 3611 _ C7. 45, F4, 00000000
        jmp     ?_179                                   ; 3618 _ EB, 17

?_177:  mov     eax, dword [task_control]               ; 361A _ A1, 00002288(d)
        mov     edx, dword [ebp-0CH]                    ; 361F _ 8B. 55, F4
        mov     eax, dword [eax+edx*4+8H]               ; 3622 _ 8B. 44 90, 08
        cmp     eax, dword [ebp+8H]                     ; 3626 _ 3B. 45, 08
        jnz     ?_178                                   ; 3629 _ 75, 02
        jmp     ?_180                                   ; 362B _ EB, 10

?_178:  add     dword [ebp-0CH], 1                      ; 362D _ 83. 45, F4, 01
?_179:  mov     eax, dword [task_control]               ; 3631 _ A1, 00002288(d)
        mov     eax, dword [eax]                        ; 3636 _ 8B. 00
        cmp     eax, dword [ebp-0CH]                    ; 3638 _ 3B. 45, F4
        jg      ?_177                                   ; 363B _ 7F, DD
?_180:  mov     eax, dword [task_control]               ; 363D _ A1, 00002288(d)
        mov     edx, dword [eax]                        ; 3642 _ 8B. 10
        sub     edx, 1                                  ; 3644 _ 83. EA, 01
        mov     dword [eax], edx                        ; 3647 _ 89. 10
        mov     eax, dword [task_control]               ; 3649 _ A1, 00002288(d)
        mov     eax, dword [eax+4H]                     ; 364E _ 8B. 40, 04
        cmp     eax, dword [ebp-0CH]                    ; 3651 _ 3B. 45, F4
        jle     ?_181                                   ; 3654 _ 7E, 10
        mov     eax, dword [task_control]               ; 3656 _ A1, 00002288(d)
        mov     edx, dword [eax+4H]                     ; 365B _ 8B. 50, 04
        sub     edx, 1                                  ; 365E _ 83. EA, 01
        mov     dword [eax+4H], edx                     ; 3661 _ 89. 50, 04
        jmp     ?_183                                   ; 3664 _ EB, 22

?_181:  jmp     ?_183                                   ; 3666 _ EB, 20

?_182:  mov     eax, dword [task_control]               ; 3668 _ A1, 00002288(d)
        mov     edx, dword [task_control]               ; 366D _ 8B. 15, 00002288(d)
        mov     ecx, dword [ebp-0CH]                    ; 3673 _ 8B. 4D, F4
        add     ecx, 1                                  ; 3676 _ 83. C1, 01
        mov     ecx, dword [edx+ecx*4+8H]               ; 3679 _ 8B. 4C 8A, 08
        mov     edx, dword [ebp-0CH]                    ; 367D _ 8B. 55, F4
        mov     dword [eax+edx*4+8H], ecx               ; 3680 _ 89. 4C 90, 08
        add     dword [ebp-0CH], 1                      ; 3684 _ 83. 45, F4, 01
?_183:  mov     eax, dword [task_control]               ; 3688 _ A1, 00002288(d)
        mov     eax, dword [eax]                        ; 368D _ 8B. 00
        cmp     eax, dword [ebp-0CH]                    ; 368F _ 3B. 45, F4
        jg      ?_182                                   ; 3692 _ 7F, D4
        mov     eax, dword [ebp+8H]                     ; 3694 _ 8B. 45, 08
        mov     dword [eax+4H], 1                       ; 3697 _ C7. 40, 04, 00000001
        cmp     byte [ebp-0DH], 0                       ; 369E _ 80. 7D, F3, 00
        jz      ?_184                                   ; 36A2 _ 74, 0C
        mov     eax, dword [task_control]               ; 36A4 _ A1, 00002288(d)
        mov     dword [eax+4H], 0                       ; 36A9 _ C7. 40, 04, 00000000
?_184:  mov     eax, dword [task_control]               ; 36B0 _ A1, 00002288(d)
        mov     edx, dword [task_control]               ; 36B5 _ 8B. 15, 00002288(d)
        mov     edx, dword [edx+4H]                     ; 36BB _ 8B. 52, 04
        mov     eax, dword [eax+edx*4+8H]               ; 36BE _ 8B. 44 90, 08
        mov     eax, dword [eax]                        ; 36C2 _ 8B. 00
        mov     dword [esp+4H], eax                     ; 36C4 _ 89. 44 24, 04
        mov     dword [esp], 0                          ; 36C8 _ C7. 04 24, 00000000
        call    farjmp                                  ; 36CF _ E8, FFFFFFFC(rel)
?_185:  leave                                           ; 36D4 _ C9
        ret                                             ; 36D5 _ C3
; task_sleep End of function



?_186:                                                  ; byte
        db 77H, 69H, 6EH, 64H, 6FH, 77H, 00H            ; 0000 _ window.

?_187:                                                  ; byte
        db 41H, 00H                                     ; 0007 _ A.

?_188:                                                  ; byte
        db 65H, 6EH, 74H, 65H, 72H, 20H, 74H, 61H       ; 0009 _ enter ta
        db 73H, 6BH, 20H, 62H, 00H                      ; 0011 _ sk b.

?_189:                                                  ; byte
        db 42H, 00H                                     ; 0016 _ B.

?_190:                                                  ; byte
        db 70H, 61H, 67H, 65H, 20H, 69H, 73H, 3AH       ; 0018 _ page is:
        db 20H, 00H                                     ; 0020 _  .

?_191:                                                  ; byte
        db 42H, 61H, 73H, 65H, 41H, 64H, 64H, 72H       ; 0022 _ BaseAddr
        db 4CH, 3AH, 20H, 00H                           ; 002A _ L: .

?_192:                                                  ; byte
        db 42H, 61H, 73H, 65H, 41H, 64H, 64H, 72H       ; 002E _ BaseAddr
        db 48H, 3AH, 20H, 00H                           ; 0036 _ H: .

?_193:                                                  ; byte
        db 6CH, 65H, 6EH, 67H, 74H, 68H, 4CH, 6FH       ; 003A _ lengthLo
        db 77H, 3AH, 20H, 00H                           ; 0042 _ w: .

?_194:                                                  ; byte
        db 6CH, 65H, 6EH, 67H, 74H, 68H, 48H, 69H       ; 0046 _ lengthHi
        db 67H, 68H, 3AH, 20H, 00H                      ; 004E _ gh: .

?_195:                                                  ; byte
        db 74H, 79H, 70H, 65H, 3AH, 20H, 00H            ; 0053 _ type: .



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

?_196:  db 00H                                          ; 02A2 _ .

?_197:  db 00H, 00H                                     ; 02A3 _ ..



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

task_a.1723:                                            ; dword
        resd    1                                       ; 0078

task_b.1724:                                            ; dword
        resd    1                                       ; 007C

tss_a.1722:                                             ; byte
        resb    128                                     ; 0080

screen_info:                                            ; qword
        resb    4                                       ; 0100

?_198:  resw    1                                       ; 0104

?_199:  resw    13                                      ; 0106

mouse_cursor_buf:                                       ; byte
        resb    256                                     ; 0120

back_buf: resd  1                                       ; 0220

sheet_win:                                              ; dword
        resd    1                                       ; 0224

mouse_x: resd   1                                       ; 0228

mouse_y: resd   1                                       ; 022C

mouse_send_info:                                        ; oword
        resb    16                                      ; 0230

keyinfo:                                                ; byte
        resb    32                                      ; 0240

keybuf:                                                 ; yword
        resb    32                                      ; 0260

mouseinfo:                                              ; byte
        resb    32                                      ; 0280

mousebuf:                                               ; byte
        resb    128                                     ; 02A0

str.1386:                                               ; byte
        resb    1                                       ; 0320

?_200:  resb    9                                       ; 0321

?_201:  resb    22                                      ; 032A

timer_control:                                          ; byte
        resd    2001                                    ; 0340

task_timer:                                             ; dword
        resd    1                                       ; 2284

task_control:                                           ; dword
        resd    1                                       ; 2288


