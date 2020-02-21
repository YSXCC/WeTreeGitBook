; Disassembly of file: ckernel.o
; Fri Feb 21 10:45:38 2020
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
        mov     dword [esp+8H], timerbuf1.1697          ; 0140 _ C7. 44 24, 08, 00000024(d)
        mov     dword [esp+4H], 8                       ; 0148 _ C7. 44 24, 04, 00000008
        mov     dword [esp], timerinfo1.1694            ; 0150 _ C7. 04 24, 0000000C(d)
        call    fifo8_init                              ; 0157 _ E8, FFFFFFFC(rel)
        call    timer_alloc                             ; 015C _ E8, FFFFFFFC(rel)
        mov     dword [ebp-30H], eax                    ; 0161 _ 89. 45, D0
        mov     dword [esp+8H], 1                       ; 0164 _ C7. 44 24, 08, 00000001
        mov     dword [esp+4H], timerinfo1.1694         ; 016C _ C7. 44 24, 04, 0000000C(d)
        mov     eax, dword [ebp-30H]                    ; 0174 _ 8B. 45, D0
        mov     dword [esp], eax                        ; 0177 _ 89. 04 24
        call    timer_init                              ; 017A _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 100                     ; 017F _ C7. 44 24, 04, 00000064
        mov     eax, dword [ebp-30H]                    ; 0187 _ 8B. 45, D0
        mov     dword [esp], eax                        ; 018A _ 89. 04 24
        call    timer_settime                           ; 018D _ E8, FFFFFFFC(rel)
        mov     dword [esp+8H], timerbuf2.1698          ; 0192 _ C7. 44 24, 08, 00000044(d)
        mov     dword [esp+4H], 8                       ; 019A _ C7. 44 24, 04, 00000008
        mov     dword [esp], timerinfo2.1695            ; 01A2 _ C7. 04 24, 0000002C(d)
        call    fifo8_init                              ; 01A9 _ E8, FFFFFFFC(rel)
        call    timer_alloc                             ; 01AE _ E8, FFFFFFFC(rel)
        mov     dword [ebp-2CH], eax                    ; 01B3 _ 89. 45, D4
        mov     dword [esp+8H], 1                       ; 01B6 _ C7. 44 24, 08, 00000001
        mov     dword [esp+4H], timerinfo2.1695         ; 01BE _ C7. 44 24, 04, 0000002C(d)
        mov     eax, dword [ebp-2CH]                    ; 01C6 _ 8B. 45, D4
        mov     dword [esp], eax                        ; 01C9 _ 89. 04 24
        call    timer_init                              ; 01CC _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 300                     ; 01D1 _ C7. 44 24, 04, 0000012C
        mov     eax, dword [ebp-2CH]                    ; 01D9 _ 8B. 45, D4
        mov     dword [esp], eax                        ; 01DC _ 89. 04 24
        call    timer_settime                           ; 01DF _ E8, FFFFFFFC(rel)
        mov     dword [esp+8H], timerbuf3.1699          ; 01E4 _ C7. 44 24, 08, 00000064(d)
        mov     dword [esp+4H], 8                       ; 01EC _ C7. 44 24, 04, 00000008
        mov     dword [esp], timerinfo3.1696            ; 01F4 _ C7. 04 24, 0000004C(d)
        call    fifo8_init                              ; 01FB _ E8, FFFFFFFC(rel)
        call    timer_alloc                             ; 0200 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-28H], eax                    ; 0205 _ 89. 45, D8
        mov     dword [esp+8H], 1                       ; 0208 _ C7. 44 24, 08, 00000001
        mov     dword [esp+4H], timerinfo3.1696         ; 0210 _ C7. 44 24, 04, 0000004C(d)
        mov     eax, dword [ebp-28H]                    ; 0218 _ 8B. 45, D8
        mov     dword [esp], eax                        ; 021B _ 89. 04 24
        call    timer_init                              ; 021E _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 50                      ; 0223 _ C7. 44 24, 04, 00000032
        mov     eax, dword [ebp-28H]                    ; 022B _ 8B. 45, D8
        mov     dword [esp], eax                        ; 022E _ 89. 04 24
        call    timer_settime                           ; 0231 _ E8, FFFFFFFC(rel)
        call    io_sti                                  ; 0236 _ E8, FFFFFFFC(rel)
        mov     eax, dword [back_buf]                   ; 023B _ A1, 00000000(d)
        mov     edx, dword [ebp-38H]                    ; 0240 _ 8B. 55, C8
        mov     dword [esp+8H], edx                     ; 0243 _ 89. 54 24, 08
        mov     edx, dword [ebp-3CH]                    ; 0247 _ 8B. 55, C4
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
        mov     dword [esp+4H], ?_166                   ; 02C1 _ C7. 44 24, 04, 00000000(d)
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
        mov     dword [ebp-24H], eax                    ; 031E _ 89. 45, DC
        call    get_addr_gdt                            ; 0321 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-20H], eax                    ; 0326 _ 89. 45, E0
        mov     dword [?_184], 0                        ; 0329 _ C7. 05, 000000E0(d), 00000000
        mov     dword [?_185], 1073741824               ; 0333 _ C7. 05, 000000E4(d), 40000000
        mov     dword [?_202], 0                        ; 033D _ C7. 05, 00000160(d), 00000000
        mov     dword [?_203], 1073741824               ; 0347 _ C7. 05, 00000164(d), 40000000
        mov     eax, tss_a.1703                         ; 0351 _ B8, 00000080(d)
        mov     edx, dword [ebp-20H]                    ; 0356 _ 8B. 55, E0
        add     edx, 64                                 ; 0359 _ 83. C2, 40
        mov     dword [esp+0CH], 137                    ; 035C _ C7. 44 24, 0C, 00000089
        mov     dword [esp+8H], eax                     ; 0364 _ 89. 44 24, 08
        mov     dword [esp+4H], 103                     ; 0368 _ C7. 44 24, 04, 00000067
        mov     dword [esp], edx                        ; 0370 _ 89. 14 24
        call    segment_descriptor                      ; 0373 _ E8, FFFFFFFC(rel)
        mov     eax, tss_a.1703                         ; 0378 _ B8, 00000080(d)
        mov     edx, dword [ebp-20H]                    ; 037D _ 8B. 55, E0
        add     edx, 72                                 ; 0380 _ 83. C2, 48
        mov     dword [esp+0CH], 137                    ; 0383 _ C7. 44 24, 0C, 00000089
        mov     dword [esp+8H], eax                     ; 038B _ 89. 44 24, 08
        mov     dword [esp+4H], 103                     ; 038F _ C7. 44 24, 04, 00000067
        mov     dword [esp], edx                        ; 0397 _ 89. 14 24
        call    segment_descriptor                      ; 039A _ E8, FFFFFFFC(rel)
        mov     eax, tss_b.1704                         ; 039F _ B8, 00000100(d)
        mov     edx, dword [ebp-20H]                    ; 03A4 _ 8B. 55, E0
        add     edx, 80                                 ; 03A7 _ 83. C2, 50
        mov     dword [esp+0CH], 137                    ; 03AA _ C7. 44 24, 0C, 00000089
        mov     dword [esp+8H], eax                     ; 03B2 _ 89. 44 24, 08
        mov     dword [esp+4H], 103                     ; 03B6 _ C7. 44 24, 04, 00000067
        mov     dword [esp], edx                        ; 03BE _ 89. 14 24
        call    segment_descriptor                      ; 03C1 _ E8, FFFFFFFC(rel)
        mov     eax, task_b_main                        ; 03C6 _ B8, 00000000(d)
        mov     edx, dword [ebp-20H]                    ; 03CB _ 8B. 55, E0
        add     edx, 56                                 ; 03CE _ 83. C2, 38
        mov     dword [esp+0CH], 16538                  ; 03D1 _ C7. 44 24, 0C, 0000409A
        mov     dword [esp+8H], eax                     ; 03D9 _ 89. 44 24, 08
        mov     dword [esp+4H], 65535                   ; 03DD _ C7. 44 24, 04, 0000FFFF
        mov     dword [esp], edx                        ; 03E5 _ 89. 14 24
        call    segment_descriptor                      ; 03E8 _ E8, FFFFFFFC(rel)
        mov     dword [esp], 64                         ; 03ED _ C7. 04 24, 00000040
        call    load_tr                                 ; 03F4 _ E8, FFFFFFFC(rel)
        call    taskswitch9                             ; 03F9 _ E8, FFFFFFFC(rel)
        mov     eax, dword [memman]                     ; 03FE _ A1, 00000000(d)
        mov     dword [esp+4H], 65536                   ; 0403 _ C7. 44 24, 04, 00010000
        mov     dword [esp], eax                        ; 040B _ 89. 04 24
        call    memman_alloc_4k                         ; 040E _ E8, FFFFFFFC(rel)
        add     eax, 65536                              ; 0413 _ 05, 00010000
        mov     dword [ebp-1CH], eax                    ; 0418 _ 89. 45, E4
        mov     eax, task_b_main                        ; 041B _ B8, 00000000(d)
        sub     eax, dword [ebp-24H]                    ; 0420 _ 2B. 45, DC
        mov     dword [?_186], eax                      ; 0423 _ A3, 00000120(d)
        mov     dword [?_187], 514                      ; 0428 _ C7. 05, 00000124(d), 00000202
        mov     dword [?_188], 0                        ; 0432 _ C7. 05, 00000128(d), 00000000
        mov     dword [?_189], 0                        ; 043C _ C7. 05, 0000012C(d), 00000000
        mov     dword [?_190], 0                        ; 0446 _ C7. 05, 00000130(d), 00000000
        mov     dword [?_191], 0                        ; 0450 _ C7. 05, 00000134(d), 00000000
        mov     dword [?_192], 1024                     ; 045A _ C7. 05, 00000138(d), 00000400
        mov     dword [?_193], 0                        ; 0464 _ C7. 05, 0000013C(d), 00000000
        mov     dword [?_194], 0                        ; 046E _ C7. 05, 00000140(d), 00000000
        mov     dword [?_195], 0                        ; 0478 _ C7. 05, 00000144(d), 00000000
        mov     eax, dword [?_178]                      ; 0482 _ A1, 000000C8(d)
        mov     dword [?_196], eax                      ; 0487 _ A3, 00000148(d)
        mov     eax, dword [?_179]                      ; 048C _ A1, 000000CC(d)
        mov     dword [?_197], eax                      ; 0491 _ A3, 0000014C(d)
        mov     eax, dword [?_180]                      ; 0496 _ A1, 000000D0(d)
        mov     dword [?_198], eax                      ; 049B _ A3, 00000150(d)
        mov     eax, dword [?_181]                      ; 04A0 _ A1, 000000D4(d)
        mov     dword [?_199], eax                      ; 04A5 _ A3, 00000154(d)
        mov     eax, dword [?_182]                      ; 04AA _ A1, 000000D8(d)
        mov     dword [?_200], eax                      ; 04AF _ A3, 00000158(d)
        mov     eax, dword [?_183]                      ; 04B4 _ A1, 000000DC(d)
        mov     dword [?_201], eax                      ; 04B9 _ A3, 0000015C(d)
        mov     dword [ebp-18H], 0                      ; 04BE _ C7. 45, E8, 00000000
        mov     dword [ebp-14H], 0                      ; 04C5 _ C7. 45, EC, 00000000
        mov     dword [ebp-10H], 0                      ; 04CC _ C7. 45, F0, 00000000
        mov     dword [ebp-4CH], 8                      ; 04D3 _ C7. 45, B4, 00000008
        mov     dword [ebp-48H], 7                      ; 04DA _ C7. 45, B8, 00000007
        mov     dword [ebp-44H], 0                      ; 04E1 _ C7. 45, BC, 00000000
        call    multi_task_init                         ; 04E8 _ E8, FFFFFFFC(rel)
?_001:  call    io_cli                                  ; 04ED _ E8, FFFFFFFC(rel)
        mov     dword [esp], keyinfo                    ; 04F2 _ C7. 04 24, 00000000(d)
        call    fifo8_status                            ; 04F9 _ E8, FFFFFFFC(rel)
        mov     ebx, eax                                ; 04FE _ 89. C3
        mov     dword [esp], mouseinfo                  ; 0500 _ C7. 04 24, 00000000(d)
        call    fifo8_status                            ; 0507 _ E8, FFFFFFFC(rel)
        add     ebx, eax                                ; 050C _ 01. C3
        mov     dword [esp], timerinfo1.1694            ; 050E _ C7. 04 24, 0000000C(d)
        call    fifo8_status                            ; 0515 _ E8, FFFFFFFC(rel)
        add     ebx, eax                                ; 051A _ 01. C3
        mov     dword [esp], timerinfo2.1695            ; 051C _ C7. 04 24, 0000002C(d)
        call    fifo8_status                            ; 0523 _ E8, FFFFFFFC(rel)
        add     ebx, eax                                ; 0528 _ 01. C3
        mov     dword [esp], timerinfo3.1696            ; 052A _ C7. 04 24, 0000004C(d)
        call    fifo8_status                            ; 0531 _ E8, FFFFFFFC(rel)
        add     eax, ebx                                ; 0536 _ 01. D8
        test    eax, eax                                ; 0538 _ 85. C0
        jnz     ?_002                                   ; 053A _ 75, 0A
        call    io_sti                                  ; 053C _ E8, FFFFFFFC(rel)
        jmp     ?_010                                   ; 0541 _ E9, 00000383

?_002:  mov     dword [esp], keyinfo                    ; 0546 _ C7. 04 24, 00000000(d)
        call    fifo8_status                            ; 054D _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 0552 _ 85. C0
        je      ?_004                                   ; 0554 _ 0F 84, 00000196
        call    io_sti                                  ; 055A _ E8, FFFFFFFC(rel)
        mov     dword [esp], keyinfo                    ; 055F _ C7. 04 24, 00000000(d)
        call    fifo8_get                               ; 0566 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-18H], eax                    ; 056B _ 89. 45, E8
        cmp     dword [ebp-18H], 128                    ; 056E _ 81. 7D, E8, 00000080
        jle     ?_003                                   ; 0575 _ 7E, 05
        jmp     ?_010                                   ; 0577 _ E9, 0000034D

?_003:  cmp     dword [ebp-18H], 28                     ; 057C _ 83. 7D, E8, 1C
        je      ?_010                                   ; 0580 _ 0F 84, 00000343
        mov     eax, dword [ebp-18H]                    ; 0586 _ 8B. 45, E8
        add     eax, keytable                           ; 0589 _ 05, 00000000(d)
        movzx   eax, byte [eax]                         ; 058E _ 0F B6. 00
        test    al, al                                  ; 0591 _ 84. C0
        je      ?_010                                   ; 0593 _ 0F 84, 00000330
        cmp     dword [ebp-4CH], 143                    ; 0599 _ 81. 7D, B4, 0000008F
        jg      ?_010                                   ; 05A0 _ 0F 8F, 00000323
        mov     eax, dword [ebp-4CH]                    ; 05A6 _ 8B. 45, B4
        lea     ecx, [eax+7H]                           ; 05A9 _ 8D. 48, 07
        mov     eax, dword [sheet_win]                  ; 05AC _ A1, 00000000(d)
        mov     edx, dword [eax+4H]                     ; 05B1 _ 8B. 50, 04
        mov     eax, dword [sheet_win]                  ; 05B4 _ A1, 00000000(d)
        mov     eax, dword [eax]                        ; 05B9 _ 8B. 00
        mov     dword [esp+18H], 43                     ; 05BB _ C7. 44 24, 18, 0000002B
        mov     dword [esp+14H], ecx                    ; 05C3 _ 89. 4C 24, 14
        mov     dword [esp+10H], 28                     ; 05C7 _ C7. 44 24, 10, 0000001C
        mov     ecx, dword [ebp-4CH]                    ; 05CF _ 8B. 4D, B4
        mov     dword [esp+0CH], ecx                    ; 05D2 _ 89. 4C 24, 0C
        mov     dword [esp+8H], 7                       ; 05D6 _ C7. 44 24, 08, 00000007
        mov     dword [esp+4H], edx                     ; 05DE _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 05E2 _ 89. 04 24
        call    paint_rectangle                         ; 05E5 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-4CH]                    ; 05EA _ 8B. 45, B4
        lea     ecx, [eax+8H]                           ; 05ED _ 8D. 48, 08
        mov     edx, dword [sheet_win]                  ; 05F0 _ 8B. 15, 00000000(d)
        mov     eax, dword [sheet_control]              ; 05F6 _ A1, 00000000(d)
        mov     dword [esp+14H], 44                     ; 05FB _ C7. 44 24, 14, 0000002C
        mov     dword [esp+10H], ecx                    ; 0603 _ 89. 4C 24, 10
        mov     dword [esp+0CH], 28                     ; 0607 _ C7. 44 24, 0C, 0000001C
        mov     ecx, dword [ebp-4CH]                    ; 060F _ 8B. 4D, B4
        mov     dword [esp+8H], ecx                     ; 0612 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 0616 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 061A _ 89. 04 24
        call    sheet_refresh                           ; 061D _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-18H]                    ; 0622 _ 8B. 45, E8
        add     eax, keytable                           ; 0625 _ 05, 00000000(d)
        movzx   eax, byte [eax]                         ; 062A _ 0F B6. 00
        mov     byte [ebp-4EH], al                      ; 062D _ 88. 45, B2
        mov     byte [ebp-4DH], 0                       ; 0630 _ C6. 45, B3, 00
        mov     edx, dword [sheet_win]                  ; 0634 _ 8B. 15, 00000000(d)
        mov     eax, dword [sheet_control]              ; 063A _ A1, 00000000(d)
        mov     dword [esp+14H], 0                      ; 063F _ C7. 44 24, 14, 00000000
        lea     ecx, [ebp-4EH]                          ; 0647 _ 8D. 4D, B2
        mov     dword [esp+10H], ecx                    ; 064A _ 89. 4C 24, 10
        mov     dword [esp+0CH], 28                     ; 064E _ C7. 44 24, 0C, 0000001C
        mov     ecx, dword [ebp-4CH]                    ; 0656 _ 8B. 4D, B4
        mov     dword [esp+8H], ecx                     ; 0659 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 065D _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0661 _ 89. 04 24
        call    paint_string                            ; 0664 _ E8, FFFFFFFC(rel)
        add     dword [ebp-4CH], 8                      ; 0669 _ 83. 45, B4, 08
        mov     eax, dword [ebp-4CH]                    ; 066D _ 8B. 45, B4
        lea     ebx, [eax+7H]                           ; 0670 _ 8D. 58, 07
        mov     eax, dword [ebp-48H]                    ; 0673 _ 8B. 45, B8
        movzx   ecx, al                                 ; 0676 _ 0F B6. C8
        mov     eax, dword [sheet_win]                  ; 0679 _ A1, 00000000(d)
        mov     edx, dword [eax+4H]                     ; 067E _ 8B. 50, 04
        mov     eax, dword [sheet_win]                  ; 0681 _ A1, 00000000(d)
        mov     eax, dword [eax]                        ; 0686 _ 8B. 00
        mov     dword [esp+18H], 43                     ; 0688 _ C7. 44 24, 18, 0000002B
        mov     dword [esp+14H], ebx                    ; 0690 _ 89. 5C 24, 14
        mov     dword [esp+10H], 28                     ; 0694 _ C7. 44 24, 10, 0000001C
        mov     ebx, dword [ebp-4CH]                    ; 069C _ 8B. 5D, B4
        mov     dword [esp+0CH], ebx                    ; 069F _ 89. 5C 24, 0C
        mov     dword [esp+8H], ecx                     ; 06A3 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 06A7 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 06AB _ 89. 04 24
        call    paint_rectangle                         ; 06AE _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-4CH]                    ; 06B3 _ 8B. 45, B4
        lea     ecx, [eax+8H]                           ; 06B6 _ 8D. 48, 08
        mov     edx, dword [sheet_win]                  ; 06B9 _ 8B. 15, 00000000(d)
        mov     eax, dword [sheet_control]              ; 06BF _ A1, 00000000(d)
        mov     dword [esp+14H], 44                     ; 06C4 _ C7. 44 24, 14, 0000002C
        mov     dword [esp+10H], ecx                    ; 06CC _ 89. 4C 24, 10
        mov     dword [esp+0CH], 28                     ; 06D0 _ C7. 44 24, 0C, 0000001C
        mov     ecx, dword [ebp-4CH]                    ; 06D8 _ 8B. 4D, B4
        mov     dword [esp+8H], ecx                     ; 06DB _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 06DF _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 06E3 _ 89. 04 24
        call    sheet_refresh                           ; 06E6 _ E8, FFFFFFFC(rel)
        jmp     ?_001                                   ; 06EB _ E9, FFFFFDFD

?_004:  mov     dword [esp], mouseinfo                  ; 06F0 _ C7. 04 24, 00000000(d)
        call    fifo8_status                            ; 06F7 _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 06FC _ 85. C0
        jz      ?_005                                   ; 06FE _ 74, 26
        mov     ecx, dword [mouse_sheet]                ; 0700 _ 8B. 0D, 00000008(d)
        mov     edx, dword [back_sheet]                 ; 0706 _ 8B. 15, 00000004(d)
        mov     eax, dword [sheet_control]              ; 070C _ A1, 00000000(d)
        mov     dword [esp+8H], ecx                     ; 0711 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 0715 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0719 _ 89. 04 24
        call    show_mouse_info                         ; 071C _ E8, FFFFFFFC(rel)
        jmp     ?_010                                   ; 0721 _ E9, 000001A3

?_005:  mov     dword [esp], timerinfo1.1694            ; 0726 _ C7. 04 24, 0000000C(d)
        call    fifo8_status                            ; 072D _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 0732 _ 85. C0
        jz      ?_006                                   ; 0734 _ 74, 63
        call    io_sti                                  ; 0736 _ E8, FFFFFFFC(rel)
        mov     dword [esp], timerinfo1.1694            ; 073B _ C7. 04 24, 0000000C(d)
        call    fifo8_get                               ; 0742 _ E8, FFFFFFFC(rel)
        mov     edx, dword [back_sheet]                 ; 0747 _ 8B. 15, 00000004(d)
        mov     eax, dword [sheet_control]              ; 074D _ A1, 00000000(d)
        mov     dword [esp+14H], 7                      ; 0752 _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_167                  ; 075A _ C7. 44 24, 10, 00000007(d)
        mov     dword [esp+0CH], 144                    ; 0762 _ C7. 44 24, 0C, 00000090
        mov     ecx, dword [ebp-44H]                    ; 076A _ 8B. 4D, BC
        mov     dword [esp+8H], ecx                     ; 076D _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 0771 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0775 _ 89. 04 24
        call    paint_string                            ; 0778 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 100                     ; 077D _ C7. 44 24, 04, 00000064
        mov     eax, dword [ebp-30H]                    ; 0785 _ 8B. 45, D0
        mov     dword [esp], eax                        ; 0788 _ 89. 04 24
        call    timer_settime                           ; 078B _ E8, FFFFFFFC(rel)
        add     dword [ebp-44H], 8                      ; 0790 _ 83. 45, BC, 08
        jmp     ?_010                                   ; 0794 _ E9, 00000130

?_006:  mov     dword [esp], timerinfo2.1695            ; 0799 _ C7. 04 24, 0000002C(d)
        call    fifo8_status                            ; 07A0 _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 07A5 _ 85. C0
        jz      ?_007                                   ; 07A7 _ 74, 16
        call    io_sti                                  ; 07A9 _ E8, FFFFFFFC(rel)
        mov     dword [esp], timerinfo2.1695            ; 07AE _ C7. 04 24, 0000002C(d)
        call    fifo8_get                               ; 07B5 _ E8, FFFFFFFC(rel)
        jmp     ?_010                                   ; 07BA _ E9, 0000010A

?_007:  mov     dword [esp], timerinfo3.1696            ; 07BF _ C7. 04 24, 0000004C(d)
        call    fifo8_status                            ; 07C6 _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 07CB _ 85. C0
        je      ?_010                                   ; 07CD _ 0F 84, 000000F6
        mov     dword [esp], timerinfo3.1696            ; 07D3 _ C7. 04 24, 0000004C(d)
        call    fifo8_get                               ; 07DA _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 07DF _ 89. 45, F4
        call    io_sti                                  ; 07E2 _ E8, FFFFFFFC(rel)
        cmp     dword [ebp-0CH], 0                      ; 07E7 _ 83. 7D, F4, 00
        jz      ?_008                                   ; 07EB _ 74, 24
        mov     dword [esp+8H], 0                       ; 07ED _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], timerinfo3.1696         ; 07F5 _ C7. 44 24, 04, 0000004C(d)
        mov     eax, dword [ebp-28H]                    ; 07FD _ 8B. 45, D8
        mov     dword [esp], eax                        ; 0800 _ 89. 04 24
        call    timer_init                              ; 0803 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-48H], 0                      ; 0808 _ C7. 45, B8, 00000000
        jmp     ?_009                                   ; 080F _ EB, 22

?_008:  mov     dword [esp+8H], 1                       ; 0811 _ C7. 44 24, 08, 00000001
        mov     dword [esp+4H], timerinfo3.1696         ; 0819 _ C7. 44 24, 04, 0000004C(d)
        mov     eax, dword [ebp-28H]                    ; 0821 _ 8B. 45, D8
        mov     dword [esp], eax                        ; 0824 _ 89. 04 24
        call    timer_init                              ; 0827 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-48H], 7                      ; 082C _ C7. 45, B8, 00000007
?_009:  mov     dword [esp+4H], 50                      ; 0833 _ C7. 44 24, 04, 00000032
        mov     eax, dword [ebp-28H]                    ; 083B _ 8B. 45, D8
        mov     dword [esp], eax                        ; 083E _ 89. 04 24
        call    timer_settime                           ; 0841 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-4CH]                    ; 0846 _ 8B. 45, B4
        lea     ebx, [eax+7H]                           ; 0849 _ 8D. 58, 07
        mov     eax, dword [ebp-48H]                    ; 084C _ 8B. 45, B8
        movzx   ecx, al                                 ; 084F _ 0F B6. C8
        mov     eax, dword [sheet_win]                  ; 0852 _ A1, 00000000(d)
        mov     edx, dword [eax+4H]                     ; 0857 _ 8B. 50, 04
        mov     eax, dword [sheet_win]                  ; 085A _ A1, 00000000(d)
        mov     eax, dword [eax]                        ; 085F _ 8B. 00
        mov     dword [esp+18H], 43                     ; 0861 _ C7. 44 24, 18, 0000002B
        mov     dword [esp+14H], ebx                    ; 0869 _ 89. 5C 24, 14
        mov     dword [esp+10H], 28                     ; 086D _ C7. 44 24, 10, 0000001C
        mov     ebx, dword [ebp-4CH]                    ; 0875 _ 8B. 5D, B4
        mov     dword [esp+0CH], ebx                    ; 0878 _ 89. 5C 24, 0C
        mov     dword [esp+8H], ecx                     ; 087C _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 0880 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0884 _ 89. 04 24
        call    paint_rectangle                         ; 0887 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-4CH]                    ; 088C _ 8B. 45, B4
        lea     ecx, [eax+8H]                           ; 088F _ 8D. 48, 08
        mov     edx, dword [sheet_win]                  ; 0892 _ 8B. 15, 00000000(d)
        mov     eax, dword [sheet_control]              ; 0898 _ A1, 00000000(d)
        mov     dword [esp+14H], 44                     ; 089D _ C7. 44 24, 14, 0000002C
        mov     dword [esp+10H], ecx                    ; 08A5 _ 89. 4C 24, 10
        mov     dword [esp+0CH], 28                     ; 08A9 _ C7. 44 24, 0C, 0000001C
        mov     ecx, dword [ebp-4CH]                    ; 08B1 _ 8B. 4D, B4
        mov     dword [esp+8H], ecx                     ; 08B4 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 08B8 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 08BC _ 89. 04 24
        call    sheet_refresh                           ; 08BF _ E8, FFFFFFFC(rel)
        jmp     ?_001                                   ; 08C4 _ E9, FFFFFC24

?_010:  jmp     ?_001                                   ; 08C9 _ E9, FFFFFC1F
; CMain End of function

task_b_main:; Function begin
        push    ebp                                     ; 08CE _ 55
        mov     ebp, esp                                ; 08CF _ 89. E5
        sub     esp, 88                                 ; 08D1 _ 83. EC, 58
; Note: Absolute memory address without relocation
        mov     eax, dword [gs:14H]                     ; 08D4 _ 65: A1, 00000014
        mov     dword [ebp-0CH], eax                    ; 08DA _ 89. 45, F4
        xor     eax, eax                                ; 08DD _ 31. C0
        mov     edx, dword [back_sheet]                 ; 08DF _ 8B. 15, 00000004(d)
        mov     eax, dword [sheet_control]              ; 08E5 _ A1, 00000000(d)
        mov     dword [esp+14H], 7                      ; 08EA _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_168                  ; 08F2 _ C7. 44 24, 10, 00000009(d)
        mov     dword [esp+0CH], 160                    ; 08FA _ C7. 44 24, 0C, 000000A0
        mov     dword [esp+8H], 0                       ; 0902 _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], edx                     ; 090A _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 090E _ 89. 04 24
        call    paint_string                            ; 0911 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-34H], 0                      ; 0916 _ C7. 45, CC, 00000000
        mov     dword [ebp-30H], 0                      ; 091D _ C7. 45, D0, 00000000
        lea     eax, [ebp-14H]                          ; 0924 _ 8D. 45, EC
        mov     dword [esp+8H], eax                     ; 0927 _ 89. 44 24, 08
        mov     dword [esp+4H], 8                       ; 092B _ C7. 44 24, 04, 00000008
        lea     eax, [ebp-2CH]                          ; 0933 _ 8D. 45, D4
        mov     dword [esp], eax                        ; 0936 _ 89. 04 24
        call    fifo8_init                              ; 0939 _ E8, FFFFFFFC(rel)
        call    timer_alloc                             ; 093E _ E8, FFFFFFFC(rel)
        mov     dword [ebp-34H], eax                    ; 0943 _ 89. 45, CC
        mov     dword [esp+8H], 123                     ; 0946 _ C7. 44 24, 08, 0000007B
        lea     eax, [ebp-2CH]                          ; 094E _ 8D. 45, D4
        mov     dword [esp+4H], eax                     ; 0951 _ 89. 44 24, 04
        mov     eax, dword [ebp-34H]                    ; 0955 _ 8B. 45, CC
        mov     dword [esp], eax                        ; 0958 _ 89. 04 24
        call    timer_init                              ; 095B _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 100                     ; 0960 _ C7. 44 24, 04, 00000064
        mov     eax, dword [ebp-34H]                    ; 0968 _ 8B. 45, CC
        mov     dword [esp], eax                        ; 096B _ 89. 04 24
        call    timer_settime                           ; 096E _ E8, FFFFFFFC(rel)
        mov     dword [ebp-38H], 0                      ; 0973 _ C7. 45, C8, 00000000
?_011:  call    io_cli                                  ; 097A _ E8, FFFFFFFC(rel)
        lea     eax, [ebp-2CH]                          ; 097F _ 8D. 45, D4
        mov     dword [esp], eax                        ; 0982 _ 89. 04 24
        call    fifo8_status                            ; 0985 _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 098A _ 85. C0
        jnz     ?_012                                   ; 098C _ 75, 07
        call    io_sti                                  ; 098E _ E8, FFFFFFFC(rel)
        jmp     ?_013                                   ; 0993 _ EB, 6B

?_012:  lea     eax, [ebp-2CH]                          ; 0995 _ 8D. 45, D4
        mov     dword [esp], eax                        ; 0998 _ 89. 04 24
        call    fifo8_get                               ; 099B _ E8, FFFFFFFC(rel)
        mov     dword [ebp-30H], eax                    ; 09A0 _ 89. 45, D0
        call    io_sti                                  ; 09A3 _ E8, FFFFFFFC(rel)
        cmp     dword [ebp-30H], 123                    ; 09A8 _ 83. 7D, D0, 7B
        jnz     ?_013                                   ; 09AC _ 75, 52
        mov     edx, dword [back_sheet]                 ; 09AE _ 8B. 15, 00000004(d)
        mov     eax, dword [sheet_control]              ; 09B4 _ A1, 00000000(d)
        mov     dword [esp+14H], 7                      ; 09B9 _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_169                  ; 09C1 _ C7. 44 24, 10, 00000016(d)
        mov     dword [esp+0CH], 176                    ; 09C9 _ C7. 44 24, 0C, 000000B0
        mov     ecx, dword [ebp-38H]                    ; 09D1 _ 8B. 4D, C8
        mov     dword [esp+8H], ecx                     ; 09D4 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 09D8 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 09DC _ 89. 04 24
        call    paint_string                            ; 09DF _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 100                     ; 09E4 _ C7. 44 24, 04, 00000064
        mov     eax, dword [ebp-34H]                    ; 09EC _ 8B. 45, CC
        mov     dword [esp], eax                        ; 09EF _ 89. 04 24
        call    timer_settime                           ; 09F2 _ E8, FFFFFFFC(rel)
        add     dword [ebp-38H], 8                      ; 09F7 _ 83. 45, C8, 08
        jmp     ?_011                                   ; 09FB _ E9, FFFFFF7A

?_013:  jmp     ?_011                                   ; 0A00 _ E9, FFFFFF75
; task_b_main End of function

init_screeninfo:; Function begin
        push    ebp                                     ; 0A05 _ 55
        mov     ebp, esp                                ; 0A06 _ 89. E5
        mov     eax, dword [VRAM_ADDRESS]               ; 0A08 _ A1, 00000000(d)
        mov     edx, eax                                ; 0A0D _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0A0F _ 8B. 45, 08
        mov     dword [eax], edx                        ; 0A12 _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 0A14 _ 8B. 45, 08
; Note: Length-changing prefix causes delay on Intel processors
        mov     word [eax+4H], 640                      ; 0A17 _ 66: C7. 40, 04, 0280
        mov     eax, dword [ebp+8H]                     ; 0A1D _ 8B. 45, 08
; Note: Length-changing prefix causes delay on Intel processors
        mov     word [eax+6H], 480                      ; 0A20 _ 66: C7. 40, 06, 01E0
        pop     ebp                                     ; 0A26 _ 5D
        ret                                             ; 0A27 _ C3
; init_screeninfo End of function

init_palette:; Function begin
        push    ebp                                     ; 0A28 _ 55
        mov     ebp, esp                                ; 0A29 _ 89. E5
        sub     esp, 24                                 ; 0A2B _ 83. EC, 18
        mov     dword [esp+8H], table_rgb.1622          ; 0A2E _ C7. 44 24, 08, 00000080(d)
        mov     dword [esp+4H], 15                      ; 0A36 _ C7. 44 24, 04, 0000000F
        mov     dword [esp], 0                          ; 0A3E _ C7. 04 24, 00000000
        call    set_palette                             ; 0A45 _ E8, FFFFFFFC(rel)
        nop                                             ; 0A4A _ 90
        leave                                           ; 0A4B _ C9
        ret                                             ; 0A4C _ C3
; init_palette End of function

set_palette:; Function begin
        push    ebp                                     ; 0A4D _ 55
        mov     ebp, esp                                ; 0A4E _ 89. E5
        sub     esp, 40                                 ; 0A50 _ 83. EC, 28
        call    io_load_eflags                          ; 0A53 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 0A58 _ 89. 45, F4
        call    io_cli                                  ; 0A5B _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 0A60 _ 8B. 45, 08
        mov     dword [esp+4H], eax                     ; 0A63 _ 89. 44 24, 04
        mov     dword [esp], 968                        ; 0A67 _ C7. 04 24, 000003C8
        call    io_out8                                 ; 0A6E _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 0A73 _ 8B. 45, 08
        mov     dword [ebp-10H], eax                    ; 0A76 _ 89. 45, F0
        jmp     ?_015                                   ; 0A79 _ EB, 62

?_014:  mov     eax, dword [ebp+10H]                    ; 0A7B _ 8B. 45, 10
        movzx   eax, byte [eax]                         ; 0A7E _ 0F B6. 00
        shr     al, 2                                   ; 0A81 _ C0. E8, 02
        movzx   eax, al                                 ; 0A84 _ 0F B6. C0
        mov     dword [esp+4H], eax                     ; 0A87 _ 89. 44 24, 04
        mov     dword [esp], 969                        ; 0A8B _ C7. 04 24, 000003C9
        call    io_out8                                 ; 0A92 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0A97 _ 8B. 45, 10
        add     eax, 1                                  ; 0A9A _ 83. C0, 01
        movzx   eax, byte [eax]                         ; 0A9D _ 0F B6. 00
        shr     al, 2                                   ; 0AA0 _ C0. E8, 02
        movzx   eax, al                                 ; 0AA3 _ 0F B6. C0
        mov     dword [esp+4H], eax                     ; 0AA6 _ 89. 44 24, 04
        mov     dword [esp], 969                        ; 0AAA _ C7. 04 24, 000003C9
        call    io_out8                                 ; 0AB1 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0AB6 _ 8B. 45, 10
        add     eax, 2                                  ; 0AB9 _ 83. C0, 02
        movzx   eax, byte [eax]                         ; 0ABC _ 0F B6. 00
        shr     al, 2                                   ; 0ABF _ C0. E8, 02
        movzx   eax, al                                 ; 0AC2 _ 0F B6. C0
        mov     dword [esp+4H], eax                     ; 0AC5 _ 89. 44 24, 04
        mov     dword [esp], 969                        ; 0AC9 _ C7. 04 24, 000003C9
        call    io_out8                                 ; 0AD0 _ E8, FFFFFFFC(rel)
        add     dword [ebp+10H], 3                      ; 0AD5 _ 83. 45, 10, 03
        add     dword [ebp-10H], 1                      ; 0AD9 _ 83. 45, F0, 01
?_015:  mov     eax, dword [ebp-10H]                    ; 0ADD _ 8B. 45, F0
        cmp     eax, dword [ebp+0CH]                    ; 0AE0 _ 3B. 45, 0C
        jle     ?_014                                   ; 0AE3 _ 7E, 96
        mov     eax, dword [ebp-0CH]                    ; 0AE5 _ 8B. 45, F4
        mov     dword [esp], eax                        ; 0AE8 _ 89. 04 24
        call    io_store_eflags                         ; 0AEB _ E8, FFFFFFFC(rel)
        nop                                             ; 0AF0 _ 90
        leave                                           ; 0AF1 _ C9
        ret                                             ; 0AF2 _ C3
; set_palette End of function

paint_rectangle:; Function begin
        push    ebp                                     ; 0AF3 _ 55
        mov     ebp, esp                                ; 0AF4 _ 89. E5
        sub     esp, 20                                 ; 0AF6 _ 83. EC, 14
        mov     eax, dword [ebp+10H]                    ; 0AF9 _ 8B. 45, 10
        mov     byte [ebp-14H], al                      ; 0AFC _ 88. 45, EC
        mov     eax, dword [ebp+18H]                    ; 0AFF _ 8B. 45, 18
        mov     dword [ebp-4H], eax                     ; 0B02 _ 89. 45, FC
        jmp     ?_019                                   ; 0B05 _ EB, 33

?_016:  mov     eax, dword [ebp+14H]                    ; 0B07 _ 8B. 45, 14
        mov     dword [ebp-8H], eax                     ; 0B0A _ 89. 45, F8
        jmp     ?_018                                   ; 0B0D _ EB, 1F

?_017:  mov     eax, dword [ebp-4H]                     ; 0B0F _ 8B. 45, FC
        imul    eax, dword [ebp+0CH]                    ; 0B12 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0B16 _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 0B18 _ 8B. 45, F8
        add     eax, edx                                ; 0B1B _ 01. D0
        mov     edx, eax                                ; 0B1D _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0B1F _ 8B. 45, 08
        add     edx, eax                                ; 0B22 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0B24 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0B28 _ 88. 02
        add     dword [ebp-8H], 1                       ; 0B2A _ 83. 45, F8, 01
?_018:  mov     eax, dword [ebp-8H]                     ; 0B2E _ 8B. 45, F8
        cmp     eax, dword [ebp+1CH]                    ; 0B31 _ 3B. 45, 1C
        jle     ?_017                                   ; 0B34 _ 7E, D9
        add     dword [ebp-4H], 1                       ; 0B36 _ 83. 45, FC, 01
?_019:  mov     eax, dword [ebp-4H]                     ; 0B3A _ 8B. 45, FC
        cmp     eax, dword [ebp+20H]                    ; 0B3D _ 3B. 45, 20
        jle     ?_016                                   ; 0B40 _ 7E, C5
        leave                                           ; 0B42 _ C9
        ret                                             ; 0B43 _ C3
; paint_rectangle End of function

init_desktop:; Function begin
        push    ebp                                     ; 0B44 _ 55
        mov     ebp, esp                                ; 0B45 _ 89. E5
        push    ebx                                     ; 0B47 _ 53
        sub     esp, 28                                 ; 0B48 _ 83. EC, 1C
        mov     eax, dword [ebp+10H]                    ; 0B4B _ 8B. 45, 10
        lea     edx, [eax-1DH]                          ; 0B4E _ 8D. 50, E3
        mov     eax, dword [ebp+0CH]                    ; 0B51 _ 8B. 45, 0C
        sub     eax, 1                                  ; 0B54 _ 83. E8, 01
        mov     dword [esp+18H], edx                    ; 0B57 _ 89. 54 24, 18
        mov     dword [esp+14H], eax                    ; 0B5B _ 89. 44 24, 14
        mov     dword [esp+10H], 0                      ; 0B5F _ C7. 44 24, 10, 00000000
        mov     dword [esp+0CH], 0                      ; 0B67 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 2                       ; 0B6F _ C7. 44 24, 08, 00000002
        mov     eax, dword [ebp+0CH]                    ; 0B77 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0B7A _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0B7E _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0B81 _ 89. 04 24
        call    paint_rectangle                         ; 0B84 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0B89 _ 8B. 45, 10
        lea     ecx, [eax-1CH]                          ; 0B8C _ 8D. 48, E4
        mov     eax, dword [ebp+0CH]                    ; 0B8F _ 8B. 45, 0C
        lea     edx, [eax-1H]                           ; 0B92 _ 8D. 50, FF
        mov     eax, dword [ebp+10H]                    ; 0B95 _ 8B. 45, 10
        sub     eax, 28                                 ; 0B98 _ 83. E8, 1C
        mov     dword [esp+18H], ecx                    ; 0B9B _ 89. 4C 24, 18
        mov     dword [esp+14H], edx                    ; 0B9F _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 0BA3 _ 89. 44 24, 10
        mov     dword [esp+0CH], 0                      ; 0BA7 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 8                       ; 0BAF _ C7. 44 24, 08, 00000008
        mov     eax, dword [ebp+0CH]                    ; 0BB7 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0BBA _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0BBE _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0BC1 _ 89. 04 24
        call    paint_rectangle                         ; 0BC4 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0BC9 _ 8B. 45, 10
        lea     ecx, [eax-1BH]                          ; 0BCC _ 8D. 48, E5
        mov     eax, dword [ebp+0CH]                    ; 0BCF _ 8B. 45, 0C
        lea     edx, [eax-1H]                           ; 0BD2 _ 8D. 50, FF
        mov     eax, dword [ebp+10H]                    ; 0BD5 _ 8B. 45, 10
        sub     eax, 27                                 ; 0BD8 _ 83. E8, 1B
        mov     dword [esp+18H], ecx                    ; 0BDB _ 89. 4C 24, 18
        mov     dword [esp+14H], edx                    ; 0BDF _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 0BE3 _ 89. 44 24, 10
        mov     dword [esp+0CH], 0                      ; 0BE7 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 7                       ; 0BEF _ C7. 44 24, 08, 00000007
        mov     eax, dword [ebp+0CH]                    ; 0BF7 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0BFA _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0BFE _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0C01 _ 89. 04 24
        call    paint_rectangle                         ; 0C04 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0C09 _ 8B. 45, 10
        lea     ecx, [eax-1H]                           ; 0C0C _ 8D. 48, FF
        mov     eax, dword [ebp+0CH]                    ; 0C0F _ 8B. 45, 0C
        lea     edx, [eax-1H]                           ; 0C12 _ 8D. 50, FF
        mov     eax, dword [ebp+10H]                    ; 0C15 _ 8B. 45, 10
        sub     eax, 26                                 ; 0C18 _ 83. E8, 1A
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
        lea     edx, [eax-18H]                          ; 0C4C _ 8D. 50, E8
        mov     eax, dword [ebp+10H]                    ; 0C4F _ 8B. 45, 10
        sub     eax, 24                                 ; 0C52 _ 83. E8, 18
        mov     dword [esp+18H], edx                    ; 0C55 _ 89. 54 24, 18
        mov     dword [esp+14H], 59                     ; 0C59 _ C7. 44 24, 14, 0000003B
        mov     dword [esp+10H], eax                    ; 0C61 _ 89. 44 24, 10
        mov     dword [esp+0CH], 3                      ; 0C65 _ C7. 44 24, 0C, 00000003
        mov     dword [esp+8H], 7                       ; 0C6D _ C7. 44 24, 08, 00000007
        mov     eax, dword [ebp+0CH]                    ; 0C75 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0C78 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0C7C _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0C7F _ 89. 04 24
        call    paint_rectangle                         ; 0C82 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0C87 _ 8B. 45, 10
        lea     edx, [eax-4H]                           ; 0C8A _ 8D. 50, FC
        mov     eax, dword [ebp+10H]                    ; 0C8D _ 8B. 45, 10
        sub     eax, 24                                 ; 0C90 _ 83. E8, 18
        mov     dword [esp+18H], edx                    ; 0C93 _ 89. 54 24, 18
        mov     dword [esp+14H], 2                      ; 0C97 _ C7. 44 24, 14, 00000002
        mov     dword [esp+10H], eax                    ; 0C9F _ 89. 44 24, 10
        mov     dword [esp+0CH], 2                      ; 0CA3 _ C7. 44 24, 0C, 00000002
        mov     dword [esp+8H], 7                       ; 0CAB _ C7. 44 24, 08, 00000007
        mov     eax, dword [ebp+0CH]                    ; 0CB3 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0CB6 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0CBA _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0CBD _ 89. 04 24
        call    paint_rectangle                         ; 0CC0 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0CC5 _ 8B. 45, 10
        lea     edx, [eax-4H]                           ; 0CC8 _ 8D. 50, FC
        mov     eax, dword [ebp+10H]                    ; 0CCB _ 8B. 45, 10
        sub     eax, 4                                  ; 0CCE _ 83. E8, 04
        mov     dword [esp+18H], edx                    ; 0CD1 _ 89. 54 24, 18
        mov     dword [esp+14H], 59                     ; 0CD5 _ C7. 44 24, 14, 0000003B
        mov     dword [esp+10H], eax                    ; 0CDD _ 89. 44 24, 10
        mov     dword [esp+0CH], 3                      ; 0CE1 _ C7. 44 24, 0C, 00000003
        mov     dword [esp+8H], 2                       ; 0CE9 _ C7. 44 24, 08, 00000002
        mov     eax, dword [ebp+0CH]                    ; 0CF1 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0CF4 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0CF8 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0CFB _ 89. 04 24
        call    paint_rectangle                         ; 0CFE _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0D03 _ 8B. 45, 10
        lea     edx, [eax-5H]                           ; 0D06 _ 8D. 50, FB
        mov     eax, dword [ebp+10H]                    ; 0D09 _ 8B. 45, 10
        sub     eax, 23                                 ; 0D0C _ 83. E8, 17
        mov     dword [esp+18H], edx                    ; 0D0F _ 89. 54 24, 18
        mov     dword [esp+14H], 59                     ; 0D13 _ C7. 44 24, 14, 0000003B
        mov     dword [esp+10H], eax                    ; 0D1B _ 89. 44 24, 10
        mov     dword [esp+0CH], 59                     ; 0D1F _ C7. 44 24, 0C, 0000003B
        mov     dword [esp+8H], 2                       ; 0D27 _ C7. 44 24, 08, 00000002
        mov     eax, dword [ebp+0CH]                    ; 0D2F _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0D32 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0D36 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0D39 _ 89. 04 24
        call    paint_rectangle                         ; 0D3C _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0D41 _ 8B. 45, 10
        lea     edx, [eax-3H]                           ; 0D44 _ 8D. 50, FD
        mov     eax, dword [ebp+10H]                    ; 0D47 _ 8B. 45, 10
        sub     eax, 3                                  ; 0D4A _ 83. E8, 03
        mov     dword [esp+18H], edx                    ; 0D4D _ 89. 54 24, 18
        mov     dword [esp+14H], 59                     ; 0D51 _ C7. 44 24, 14, 0000003B
        mov     dword [esp+10H], eax                    ; 0D59 _ 89. 44 24, 10
        mov     dword [esp+0CH], 2                      ; 0D5D _ C7. 44 24, 0C, 00000002
        mov     dword [esp+8H], 0                       ; 0D65 _ C7. 44 24, 08, 00000000
        mov     eax, dword [ebp+0CH]                    ; 0D6D _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0D70 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0D74 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0D77 _ 89. 04 24
        call    paint_rectangle                         ; 0D7A _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0D7F _ 8B. 45, 10
        lea     edx, [eax-3H]                           ; 0D82 _ 8D. 50, FD
        mov     eax, dword [ebp+10H]                    ; 0D85 _ 8B. 45, 10
        sub     eax, 24                                 ; 0D88 _ 83. E8, 18
        mov     dword [esp+18H], edx                    ; 0D8B _ 89. 54 24, 18
        mov     dword [esp+14H], 60                     ; 0D8F _ C7. 44 24, 14, 0000003C
        mov     dword [esp+10H], eax                    ; 0D97 _ 89. 44 24, 10
        mov     dword [esp+0CH], 60                     ; 0D9B _ C7. 44 24, 0C, 0000003C
        mov     dword [esp+8H], 0                       ; 0DA3 _ C7. 44 24, 08, 00000000
        mov     eax, dword [ebp+0CH]                    ; 0DAB _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0DAE _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0DB2 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0DB5 _ 89. 04 24
        call    paint_rectangle                         ; 0DB8 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0DBD _ 8B. 45, 10
        lea     ebx, [eax-18H]                          ; 0DC0 _ 8D. 58, E8
        mov     eax, dword [ebp+0CH]                    ; 0DC3 _ 8B. 45, 0C
        lea     ecx, [eax-4H]                           ; 0DC6 _ 8D. 48, FC
        mov     eax, dword [ebp+10H]                    ; 0DC9 _ 8B. 45, 10
        lea     edx, [eax-18H]                          ; 0DCC _ 8D. 50, E8
        mov     eax, dword [ebp+0CH]                    ; 0DCF _ 8B. 45, 0C
        sub     eax, 47                                 ; 0DD2 _ 83. E8, 2F
        mov     dword [esp+18H], ebx                    ; 0DD5 _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 0DD9 _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 0DDD _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 0DE1 _ 89. 44 24, 0C
        mov     dword [esp+8H], 2                       ; 0DE5 _ C7. 44 24, 08, 00000002
        mov     eax, dword [ebp+0CH]                    ; 0DED _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0DF0 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0DF4 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0DF7 _ 89. 04 24
        call    paint_rectangle                         ; 0DFA _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0DFF _ 8B. 45, 10
        lea     ebx, [eax-4H]                           ; 0E02 _ 8D. 58, FC
        mov     eax, dword [ebp+0CH]                    ; 0E05 _ 8B. 45, 0C
        lea     ecx, [eax-2FH]                          ; 0E08 _ 8D. 48, D1
        mov     eax, dword [ebp+10H]                    ; 0E0B _ 8B. 45, 10
        lea     edx, [eax-17H]                          ; 0E0E _ 8D. 50, E9
        mov     eax, dword [ebp+0CH]                    ; 0E11 _ 8B. 45, 0C
        sub     eax, 47                                 ; 0E14 _ 83. E8, 2F
        mov     dword [esp+18H], ebx                    ; 0E17 _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 0E1B _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 0E1F _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 0E23 _ 89. 44 24, 0C
        mov     dword [esp+8H], 2                       ; 0E27 _ C7. 44 24, 08, 00000002
        mov     eax, dword [ebp+0CH]                    ; 0E2F _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0E32 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0E36 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0E39 _ 89. 04 24
        call    paint_rectangle                         ; 0E3C _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0E41 _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 0E44 _ 8D. 58, FD
        mov     eax, dword [ebp+0CH]                    ; 0E47 _ 8B. 45, 0C
        lea     ecx, [eax-4H]                           ; 0E4A _ 8D. 48, FC
        mov     eax, dword [ebp+10H]                    ; 0E4D _ 8B. 45, 10
        lea     edx, [eax-3H]                           ; 0E50 _ 8D. 50, FD
        mov     eax, dword [ebp+0CH]                    ; 0E53 _ 8B. 45, 0C
        sub     eax, 47                                 ; 0E56 _ 83. E8, 2F
        mov     dword [esp+18H], ebx                    ; 0E59 _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 0E5D _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 0E61 _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 0E65 _ 89. 44 24, 0C
        mov     dword [esp+8H], 7                       ; 0E69 _ C7. 44 24, 08, 00000007
        mov     eax, dword [ebp+0CH]                    ; 0E71 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0E74 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0E78 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0E7B _ 89. 04 24
        call    paint_rectangle                         ; 0E7E _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0E83 _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 0E86 _ 8D. 58, FD
        mov     eax, dword [ebp+0CH]                    ; 0E89 _ 8B. 45, 0C
        lea     ecx, [eax-3H]                           ; 0E8C _ 8D. 48, FD
        mov     eax, dword [ebp+10H]                    ; 0E8F _ 8B. 45, 10
        lea     edx, [eax-18H]                          ; 0E92 _ 8D. 50, E8
        mov     eax, dword [ebp+0CH]                    ; 0E95 _ 8B. 45, 0C
        sub     eax, 3                                  ; 0E98 _ 83. E8, 03
        mov     dword [esp+18H], ebx                    ; 0E9B _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 0E9F _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 0EA3 _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 0EA7 _ 89. 44 24, 0C
        mov     dword [esp+8H], 7                       ; 0EAB _ C7. 44 24, 08, 00000007
        mov     eax, dword [ebp+0CH]                    ; 0EB3 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0EB6 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0EBA _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0EBD _ 89. 04 24
        call    paint_rectangle                         ; 0EC0 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 0EC5 _ 83. C4, 1C
        pop     ebx                                     ; 0EC8 _ 5B
        pop     ebp                                     ; 0EC9 _ 5D
        ret                                             ; 0ECA _ C3
; init_desktop End of function

init_mouse_position:; Function begin
        push    ebp                                     ; 0ECB _ 55
        mov     ebp, esp                                ; 0ECC _ 89. E5
        sub     esp, 16                                 ; 0ECE _ 83. EC, 10
        movzx   eax, word [?_204]                       ; 0ED1 _ 0F B7. 05, 00000184(d)
        cwde                                            ; 0ED8 _ 98
        mov     dword [ebp-8H], eax                     ; 0ED9 _ 89. 45, F8
        movzx   eax, word [?_205]                       ; 0EDC _ 0F B7. 05, 00000186(d)
        cwde                                            ; 0EE3 _ 98
        mov     dword [ebp-4H], eax                     ; 0EE4 _ 89. 45, FC
        mov     eax, dword [ebp-8H]                     ; 0EE7 _ 8B. 45, F8
        sub     eax, 16                                 ; 0EEA _ 83. E8, 10
        mov     edx, eax                                ; 0EED _ 89. C2
        shr     edx, 31                                 ; 0EEF _ C1. EA, 1F
        add     eax, edx                                ; 0EF2 _ 01. D0
        sar     eax, 1                                  ; 0EF4 _ D1. F8
        mov     dword [mouse_x], eax                    ; 0EF6 _ A3, 000002A8(d)
        mov     eax, dword [ebp-4H]                     ; 0EFB _ 8B. 45, FC
        sub     eax, 44                                 ; 0EFE _ 83. E8, 2C
        mov     edx, eax                                ; 0F01 _ 89. C2
        shr     edx, 31                                 ; 0F03 _ C1. EA, 1F
        add     eax, edx                                ; 0F06 _ 01. D0
        sar     eax, 1                                  ; 0F08 _ D1. F8
        mov     dword [mouse_y], eax                    ; 0F0A _ A3, 000002AC(d)
        leave                                           ; 0F0F _ C9
        ret                                             ; 0F10 _ C3
; init_mouse_position End of function

paint_font:; Function begin
        push    ebp                                     ; 0F11 _ 55
        mov     ebp, esp                                ; 0F12 _ 89. E5
        sub     esp, 20                                 ; 0F14 _ 83. EC, 14
        mov     eax, dword [ebp+1CH]                    ; 0F17 _ 8B. 45, 1C
        mov     byte [ebp-14H], al                      ; 0F1A _ 88. 45, EC
        mov     dword [ebp-4H], 0                       ; 0F1D _ C7. 45, FC, 00000000
        jmp     ?_029                                   ; 0F24 _ E9, 0000016E

?_020:  mov     edx, dword [ebp-4H]                     ; 0F29 _ 8B. 55, FC
        mov     eax, dword [ebp+18H]                    ; 0F2C _ 8B. 45, 18
        add     eax, edx                                ; 0F2F _ 01. D0
        movzx   eax, byte [eax]                         ; 0F31 _ 0F B6. 00
        mov     byte [ebp-5H], al                       ; 0F34 _ 88. 45, FB
        movzx   eax, byte [ebp-5H]                      ; 0F37 _ 0F B6. 45, FB
        test    al, al                                  ; 0F3B _ 84. C0
        jns     ?_021                                   ; 0F3D _ 79, 20
        mov     eax, dword [ebp-4H]                     ; 0F3F _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 0F42 _ 8B. 55, 14
        add     eax, edx                                ; 0F45 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0F47 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0F4B _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0F4D _ 8B. 45, 10
        add     eax, edx                                ; 0F50 _ 01. D0
        mov     edx, eax                                ; 0F52 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0F54 _ 8B. 45, 08
        add     edx, eax                                ; 0F57 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0F59 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0F5D _ 88. 02
?_021:  movzx   eax, byte [ebp-5H]                      ; 0F5F _ 0F B6. 45, FB
        and     eax, 40H                                ; 0F63 _ 83. E0, 40
        test    eax, eax                                ; 0F66 _ 85. C0
        jz      ?_022                                   ; 0F68 _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 0F6A _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 0F6D _ 8B. 55, 14
        add     eax, edx                                ; 0F70 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0F72 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0F76 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0F78 _ 8B. 45, 10
        add     eax, edx                                ; 0F7B _ 01. D0
        lea     edx, [eax+1H]                           ; 0F7D _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 0F80 _ 8B. 45, 08
        add     edx, eax                                ; 0F83 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0F85 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0F89 _ 88. 02
?_022:  movzx   eax, byte [ebp-5H]                      ; 0F8B _ 0F B6. 45, FB
        and     eax, 20H                                ; 0F8F _ 83. E0, 20
        test    eax, eax                                ; 0F92 _ 85. C0
        jz      ?_023                                   ; 0F94 _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 0F96 _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 0F99 _ 8B. 55, 14
        add     eax, edx                                ; 0F9C _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0F9E _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0FA2 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0FA4 _ 8B. 45, 10
        add     eax, edx                                ; 0FA7 _ 01. D0
        lea     edx, [eax+2H]                           ; 0FA9 _ 8D. 50, 02
        mov     eax, dword [ebp+8H]                     ; 0FAC _ 8B. 45, 08
        add     edx, eax                                ; 0FAF _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0FB1 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0FB5 _ 88. 02
?_023:  movzx   eax, byte [ebp-5H]                      ; 0FB7 _ 0F B6. 45, FB
        and     eax, 10H                                ; 0FBB _ 83. E0, 10
        test    eax, eax                                ; 0FBE _ 85. C0
        jz      ?_024                                   ; 0FC0 _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 0FC2 _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 0FC5 _ 8B. 55, 14
        add     eax, edx                                ; 0FC8 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0FCA _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0FCE _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0FD0 _ 8B. 45, 10
        add     eax, edx                                ; 0FD3 _ 01. D0
        lea     edx, [eax+3H]                           ; 0FD5 _ 8D. 50, 03
        mov     eax, dword [ebp+8H]                     ; 0FD8 _ 8B. 45, 08
        add     edx, eax                                ; 0FDB _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0FDD _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0FE1 _ 88. 02
?_024:  movzx   eax, byte [ebp-5H]                      ; 0FE3 _ 0F B6. 45, FB
        and     eax, 08H                                ; 0FE7 _ 83. E0, 08
        test    eax, eax                                ; 0FEA _ 85. C0
        jz      ?_025                                   ; 0FEC _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 0FEE _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 0FF1 _ 8B. 55, 14
        add     eax, edx                                ; 0FF4 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0FF6 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0FFA _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0FFC _ 8B. 45, 10
        add     eax, edx                                ; 0FFF _ 01. D0
        lea     edx, [eax+4H]                           ; 1001 _ 8D. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1004 _ 8B. 45, 08
        add     edx, eax                                ; 1007 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 1009 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 100D _ 88. 02
?_025:  movzx   eax, byte [ebp-5H]                      ; 100F _ 0F B6. 45, FB
        and     eax, 04H                                ; 1013 _ 83. E0, 04
        test    eax, eax                                ; 1016 _ 85. C0
        jz      ?_026                                   ; 1018 _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 101A _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 101D _ 8B. 55, 14
        add     eax, edx                                ; 1020 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 1022 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 1026 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 1028 _ 8B. 45, 10
        add     eax, edx                                ; 102B _ 01. D0
        lea     edx, [eax+5H]                           ; 102D _ 8D. 50, 05
        mov     eax, dword [ebp+8H]                     ; 1030 _ 8B. 45, 08
        add     edx, eax                                ; 1033 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 1035 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 1039 _ 88. 02
?_026:  movzx   eax, byte [ebp-5H]                      ; 103B _ 0F B6. 45, FB
        and     eax, 02H                                ; 103F _ 83. E0, 02
        test    eax, eax                                ; 1042 _ 85. C0
        jz      ?_027                                   ; 1044 _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 1046 _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 1049 _ 8B. 55, 14
        add     eax, edx                                ; 104C _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 104E _ 0F AF. 45, 0C
        mov     edx, eax                                ; 1052 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 1054 _ 8B. 45, 10
        add     eax, edx                                ; 1057 _ 01. D0
        lea     edx, [eax+6H]                           ; 1059 _ 8D. 50, 06
        mov     eax, dword [ebp+8H]                     ; 105C _ 8B. 45, 08
        add     edx, eax                                ; 105F _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 1061 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 1065 _ 88. 02
?_027:  movzx   eax, byte [ebp-5H]                      ; 1067 _ 0F B6. 45, FB
        and     eax, 01H                                ; 106B _ 83. E0, 01
        test    eax, eax                                ; 106E _ 85. C0
        jz      ?_028                                   ; 1070 _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 1072 _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 1075 _ 8B. 55, 14
        add     eax, edx                                ; 1078 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 107A _ 0F AF. 45, 0C
        mov     edx, eax                                ; 107E _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 1080 _ 8B. 45, 10
        add     eax, edx                                ; 1083 _ 01. D0
        lea     edx, [eax+7H]                           ; 1085 _ 8D. 50, 07
        mov     eax, dword [ebp+8H]                     ; 1088 _ 8B. 45, 08
        add     edx, eax                                ; 108B _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 108D _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 1091 _ 88. 02
?_028:  add     dword [ebp-4H], 1                       ; 1093 _ 83. 45, FC, 01
?_029:  cmp     dword [ebp-4H], 15                      ; 1097 _ 83. 7D, FC, 0F
        jle     ?_020                                   ; 109B _ 0F 8E, FFFFFE88
        leave                                           ; 10A1 _ C9
        ret                                             ; 10A2 _ C3
; paint_font End of function

paint_string:; Function begin
        push    ebp                                     ; 10A3 _ 55
        mov     ebp, esp                                ; 10A4 _ 89. E5
        push    ebx                                     ; 10A6 _ 53
        sub     esp, 52                                 ; 10A7 _ 83. EC, 34
        mov     eax, dword [ebp+1CH]                    ; 10AA _ 8B. 45, 1C
        mov     byte [ebp-1CH], al                      ; 10AD _ 88. 45, E4
        mov     eax, dword [ebp+10H]                    ; 10B0 _ 8B. 45, 10
        mov     dword [ebp-0CH], eax                    ; 10B3 _ 89. 45, F4
        jmp     ?_031                                   ; 10B6 _ EB, 4B

?_030:  movsx   ecx, byte [ebp-1CH]                     ; 10B8 _ 0F BE. 4D, E4
        mov     eax, dword [ebp+18H]                    ; 10BC _ 8B. 45, 18
        movzx   eax, byte [eax]                         ; 10BF _ 0F B6. 00
        movsx   eax, al                                 ; 10C2 _ 0F BE. C0
        shl     eax, 4                                  ; 10C5 _ C1. E0, 04
        lea     ebx, [systemFont+eax]                   ; 10C8 _ 8D. 98, 00000000(d)
        mov     eax, dword [ebp+0CH]                    ; 10CE _ 8B. 45, 0C
        mov     edx, dword [eax+4H]                     ; 10D1 _ 8B. 50, 04
        mov     eax, dword [ebp+0CH]                    ; 10D4 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 10D7 _ 8B. 00
        mov     dword [esp+14H], ecx                    ; 10D9 _ 89. 4C 24, 14
        mov     dword [esp+10H], ebx                    ; 10DD _ 89. 5C 24, 10
        mov     ecx, dword [ebp+14H]                    ; 10E1 _ 8B. 4D, 14
        mov     dword [esp+0CH], ecx                    ; 10E4 _ 89. 4C 24, 0C
        mov     ecx, dword [ebp+10H]                    ; 10E8 _ 8B. 4D, 10
        mov     dword [esp+8H], ecx                     ; 10EB _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 10EF _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 10F3 _ 89. 04 24
        call    paint_font                              ; 10F6 _ E8, FFFFFFFC(rel)
        add     dword [ebp+10H], 8                      ; 10FB _ 83. 45, 10, 08
        add     dword [ebp+18H], 1                      ; 10FF _ 83. 45, 18, 01
?_031:  mov     eax, dword [ebp+18H]                    ; 1103 _ 8B. 45, 18
        movzx   eax, byte [eax]                         ; 1106 _ 0F B6. 00
        test    al, al                                  ; 1109 _ 84. C0
        jnz     ?_030                                   ; 110B _ 75, AB
        mov     eax, dword [ebp+14H]                    ; 110D _ 8B. 45, 14
        add     eax, 16                                 ; 1110 _ 83. C0, 10
        mov     dword [esp+14H], eax                    ; 1113 _ 89. 44 24, 14
        mov     eax, dword [ebp+10H]                    ; 1117 _ 8B. 45, 10
        mov     dword [esp+10H], eax                    ; 111A _ 89. 44 24, 10
        mov     eax, dword [ebp+14H]                    ; 111E _ 8B. 45, 14
        mov     dword [esp+0CH], eax                    ; 1121 _ 89. 44 24, 0C
        mov     eax, dword [ebp-0CH]                    ; 1125 _ 8B. 45, F4
        mov     dword [esp+8H], eax                     ; 1128 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 112C _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 112F _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1133 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1136 _ 89. 04 24
        call    sheet_refresh                           ; 1139 _ E8, FFFFFFFC(rel)
        add     esp, 52                                 ; 113E _ 83. C4, 34
        pop     ebx                                     ; 1141 _ 5B
        pop     ebp                                     ; 1142 _ 5D
        ret                                             ; 1143 _ C3
; paint_string End of function

init_mouse_cursor:; Function begin
        push    ebp                                     ; 1144 _ 55
        mov     ebp, esp                                ; 1145 _ 89. E5
        sub     esp, 20                                 ; 1147 _ 83. EC, 14
        mov     eax, dword [ebp+0CH]                    ; 114A _ 8B. 45, 0C
        mov     byte [ebp-14H], al                      ; 114D _ 88. 45, EC
        mov     dword [ebp-8H], 0                       ; 1150 _ C7. 45, F8, 00000000
        jmp     ?_038                                   ; 1157 _ E9, 0000009C

?_032:  mov     dword [ebp-4H], 0                       ; 115C _ C7. 45, FC, 00000000
        jmp     ?_037                                   ; 1163 _ E9, 00000082

?_033:  mov     eax, dword [ebp-8H]                     ; 1168 _ 8B. 45, F8
        shl     eax, 4                                  ; 116B _ C1. E0, 04
        mov     edx, eax                                ; 116E _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 1170 _ 8B. 45, FC
        add     eax, edx                                ; 1173 _ 01. D0
        add     eax, cursor.1690                        ; 1175 _ 05, 000000C0(d)
        movzx   eax, byte [eax]                         ; 117A _ 0F B6. 00
        cmp     al, 42                                  ; 117D _ 3C, 2A
        jnz     ?_034                                   ; 117F _ 75, 19
        mov     eax, dword [ebp-8H]                     ; 1181 _ 8B. 45, F8
        shl     eax, 4                                  ; 1184 _ C1. E0, 04
        mov     edx, eax                                ; 1187 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 1189 _ 8B. 45, FC
        add     eax, edx                                ; 118C _ 01. D0
        mov     edx, eax                                ; 118E _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 1190 _ 8B. 45, 08
        add     eax, edx                                ; 1193 _ 01. D0
        mov     byte [eax], 0                           ; 1195 _ C6. 00, 00
        jmp     ?_036                                   ; 1198 _ EB, 4C

?_034:  mov     eax, dword [ebp-8H]                     ; 119A _ 8B. 45, F8
        shl     eax, 4                                  ; 119D _ C1. E0, 04
        mov     edx, eax                                ; 11A0 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 11A2 _ 8B. 45, FC
        add     eax, edx                                ; 11A5 _ 01. D0
        add     eax, cursor.1690                        ; 11A7 _ 05, 000000C0(d)
        movzx   eax, byte [eax]                         ; 11AC _ 0F B6. 00
        cmp     al, 79                                  ; 11AF _ 3C, 4F
        jnz     ?_035                                   ; 11B1 _ 75, 19
        mov     eax, dword [ebp-8H]                     ; 11B3 _ 8B. 45, F8
        shl     eax, 4                                  ; 11B6 _ C1. E0, 04
        mov     edx, eax                                ; 11B9 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 11BB _ 8B. 45, FC
        add     eax, edx                                ; 11BE _ 01. D0
        mov     edx, eax                                ; 11C0 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 11C2 _ 8B. 45, 08
        add     eax, edx                                ; 11C5 _ 01. D0
        mov     byte [eax], 7                           ; 11C7 _ C6. 00, 07
        jmp     ?_036                                   ; 11CA _ EB, 1A

?_035:  mov     eax, dword [ebp-8H]                     ; 11CC _ 8B. 45, F8
        shl     eax, 4                                  ; 11CF _ C1. E0, 04
        mov     edx, eax                                ; 11D2 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 11D4 _ 8B. 45, FC
        add     eax, edx                                ; 11D7 _ 01. D0
        mov     edx, eax                                ; 11D9 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 11DB _ 8B. 45, 08
        add     edx, eax                                ; 11DE _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 11E0 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 11E4 _ 88. 02
?_036:  add     dword [ebp-4H], 1                       ; 11E6 _ 83. 45, FC, 01
?_037:  cmp     dword [ebp-4H], 15                      ; 11EA _ 83. 7D, FC, 0F
        jle     ?_033                                   ; 11EE _ 0F 8E, FFFFFF74
        add     dword [ebp-8H], 1                       ; 11F4 _ 83. 45, F8, 01
?_038:  cmp     dword [ebp-8H], 15                      ; 11F8 _ 83. 7D, F8, 0F
        jle     ?_032                                   ; 11FC _ 0F 8E, FFFFFF5A
        leave                                           ; 1202 _ C9
        ret                                             ; 1203 _ C3
; init_mouse_cursor End of function

paint_block:; Function begin
        push    ebp                                     ; 1204 _ 55
        mov     ebp, esp                                ; 1205 _ 89. E5
        sub     esp, 16                                 ; 1207 _ 83. EC, 10
        mov     dword [ebp-8H], 0                       ; 120A _ C7. 45, F8, 00000000
        jmp     ?_042                                   ; 1211 _ EB, 50

?_039:  mov     dword [ebp-4H], 0                       ; 1213 _ C7. 45, FC, 00000000
        jmp     ?_041                                   ; 121A _ EB, 3B

?_040:  mov     eax, dword [ebp-8H]                     ; 121C _ 8B. 45, F8
        mov     edx, dword [ebp+14H]                    ; 121F _ 8B. 55, 14
        add     eax, edx                                ; 1222 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 1224 _ 0F AF. 45, 0C
        mov     edx, dword [ebp-4H]                     ; 1228 _ 8B. 55, FC
        mov     ecx, dword [ebp+10H]                    ; 122B _ 8B. 4D, 10
        add     edx, ecx                                ; 122E _ 01. CA
        add     eax, edx                                ; 1230 _ 01. D0
        mov     edx, eax                                ; 1232 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 1234 _ 8B. 45, 08
        add     edx, eax                                ; 1237 _ 01. C2
        mov     eax, dword [ebp-8H]                     ; 1239 _ 8B. 45, F8
        imul    eax, dword [ebp+18H]                    ; 123C _ 0F AF. 45, 18
        mov     ecx, eax                                ; 1240 _ 89. C1
        mov     eax, dword [ebp-4H]                     ; 1242 _ 8B. 45, FC
        add     eax, ecx                                ; 1245 _ 01. C8
        mov     ecx, eax                                ; 1247 _ 89. C1
        mov     eax, dword [ebp+20H]                    ; 1249 _ 8B. 45, 20
        add     eax, ecx                                ; 124C _ 01. C8
        movzx   eax, byte [eax]                         ; 124E _ 0F B6. 00
        mov     byte [edx], al                          ; 1251 _ 88. 02
        add     dword [ebp-4H], 1                       ; 1253 _ 83. 45, FC, 01
?_041:  mov     eax, dword [ebp-4H]                     ; 1257 _ 8B. 45, FC
        cmp     eax, dword [ebp+18H]                    ; 125A _ 3B. 45, 18
        jl      ?_040                                   ; 125D _ 7C, BD
        add     dword [ebp-8H], 1                       ; 125F _ 83. 45, F8, 01
?_042:  mov     eax, dword [ebp-8H]                     ; 1263 _ 8B. 45, F8
        cmp     eax, dword [ebp+1CH]                    ; 1266 _ 3B. 45, 1C
        jl      ?_039                                   ; 1269 _ 7C, A8
        leave                                           ; 126B _ C9
        ret                                             ; 126C _ C3
; paint_block End of function

init_fifo_buf:; Function begin
        push    ebp                                     ; 126D _ 55
        mov     ebp, esp                                ; 126E _ 89. E5
        sub     esp, 24                                 ; 1270 _ 83. EC, 18
        mov     dword [esp+8H], mousebuf                ; 1273 _ C7. 44 24, 08, 00000000(d)
        mov     dword [esp+4H], 128                     ; 127B _ C7. 44 24, 04, 00000080
        mov     dword [esp], mouseinfo                  ; 1283 _ C7. 04 24, 00000000(d)
        call    fifo8_init                              ; 128A _ E8, FFFFFFFC(rel)
        mov     dword [esp+8H], keybuf                  ; 128F _ C7. 44 24, 08, 00000000(d)
        mov     dword [esp+4H], 32                      ; 1297 _ C7. 44 24, 04, 00000020
        mov     dword [esp], keyinfo                    ; 129F _ C7. 04 24, 00000000(d)
        call    fifo8_init                              ; 12A6 _ E8, FFFFFFFC(rel)
        leave                                           ; 12AB _ C9
        ret                                             ; 12AC _ C3
; init_fifo_buf End of function

compute_mouse_position:; Function begin
        push    ebp                                     ; 12AD _ 55
        mov     ebp, esp                                ; 12AE _ 89. E5
        mov     eax, dword [ebp+10H]                    ; 12B0 _ 8B. 45, 10
        mov     edx, dword [eax+4H]                     ; 12B3 _ 8B. 50, 04
        mov     eax, dword [mouse_x]                    ; 12B6 _ A1, 000002A8(d)
        add     eax, edx                                ; 12BB _ 01. D0
        mov     dword [mouse_x], eax                    ; 12BD _ A3, 000002A8(d)
        mov     eax, dword [ebp+10H]                    ; 12C2 _ 8B. 45, 10
        mov     edx, dword [eax+8H]                     ; 12C5 _ 8B. 50, 08
        mov     eax, dword [mouse_y]                    ; 12C8 _ A1, 000002AC(d)
        add     eax, edx                                ; 12CD _ 01. D0
        mov     dword [mouse_y], eax                    ; 12CF _ A3, 000002AC(d)
        mov     eax, dword [mouse_x]                    ; 12D4 _ A1, 000002A8(d)
        test    eax, eax                                ; 12D9 _ 85. C0
        jns     ?_043                                   ; 12DB _ 79, 0A
        mov     dword [mouse_x], 0                      ; 12DD _ C7. 05, 000002A8(d), 00000000
?_043:  mov     eax, dword [mouse_y]                    ; 12E7 _ A1, 000002AC(d)
        test    eax, eax                                ; 12EC _ 85. C0
        jns     ?_044                                   ; 12EE _ 79, 0A
        mov     dword [mouse_y], 0                      ; 12F0 _ C7. 05, 000002AC(d), 00000000
?_044:  movzx   eax, word [?_204]                       ; 12FA _ 0F B7. 05, 00000184(d)
        cwde                                            ; 1301 _ 98
        lea     edx, [eax-10H]                          ; 1302 _ 8D. 50, F0
        mov     eax, dword [mouse_x]                    ; 1305 _ A1, 000002A8(d)
        cmp     edx, eax                                ; 130A _ 39. C2
        jge     ?_045                                   ; 130C _ 7D, 10
        movzx   eax, word [?_204]                       ; 130E _ 0F B7. 05, 00000184(d)
        cwde                                            ; 1315 _ 98
        sub     eax, 16                                 ; 1316 _ 83. E8, 10
        mov     dword [mouse_x], eax                    ; 1319 _ A3, 000002A8(d)
?_045:  movzx   eax, word [?_204]                       ; 131E _ 0F B7. 05, 00000184(d)
        cwde                                            ; 1325 _ 98
        lea     edx, [eax-10H]                          ; 1326 _ 8D. 50, F0
        mov     eax, dword [mouse_y]                    ; 1329 _ A1, 000002AC(d)
        cmp     edx, eax                                ; 132E _ 39. C2
        jge     ?_046                                   ; 1330 _ 7D, 10
        movzx   eax, word [?_204]                       ; 1332 _ 0F B7. 05, 00000184(d)
        cwde                                            ; 1339 _ 98
        sub     eax, 16                                 ; 133A _ 83. E8, 10
        mov     dword [mouse_y], eax                    ; 133D _ A3, 000002AC(d)
?_046:  pop     ebp                                     ; 1342 _ 5D
        ret                                             ; 1343 _ C3
; compute_mouse_position End of function

show_mouse_info:; Function begin
        push    ebp                                     ; 1344 _ 55
        mov     ebp, esp                                ; 1345 _ 89. E5
        sub     esp, 40                                 ; 1347 _ 83. EC, 28
        mov     byte [ebp-9H], 0                        ; 134A _ C6. 45, F7, 00
        call    io_sti                                  ; 134E _ E8, FFFFFFFC(rel)
        mov     dword [esp], mouseinfo                  ; 1353 _ C7. 04 24, 00000000(d)
        call    fifo8_get                               ; 135A _ E8, FFFFFFFC(rel)
        mov     byte [ebp-9H], al                       ; 135F _ 88. 45, F7
        movzx   eax, byte [ebp-9H]                      ; 1362 _ 0F B6. 45, F7
        mov     dword [esp+4H], eax                     ; 1366 _ 89. 44 24, 04
        mov     dword [esp], mouse_send_info            ; 136A _ C7. 04 24, 00000000(d)
        call    mouse_decode                            ; 1371 _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 1376 _ 85. C0
        jz      ?_047                                   ; 1378 _ 74, 77
        mov     dword [esp+8H], mouse_send_info         ; 137A _ C7. 44 24, 08, 00000000(d)
        mov     eax, dword [ebp+0CH]                    ; 1382 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 1385 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1389 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 138C _ 89. 04 24
        call    compute_mouse_position                  ; 138F _ E8, FFFFFFFC(rel)
        mov     edx, dword [mouse_y]                    ; 1394 _ 8B. 15, 000002AC(d)
        mov     eax, dword [mouse_x]                    ; 139A _ A1, 000002A8(d)
        mov     dword [esp+0CH], edx                    ; 139F _ 89. 54 24, 0C
        mov     dword [esp+8H], eax                     ; 13A3 _ 89. 44 24, 08
        mov     eax, dword [ebp+10H]                    ; 13A7 _ 8B. 45, 10
        mov     dword [esp+4H], eax                     ; 13AA _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 13AE _ 8B. 45, 08
        mov     dword [esp], eax                        ; 13B1 _ 89. 04 24
        call    sheet_slide                             ; 13B4 _ E8, FFFFFFFC(rel)
        mov     eax, dword [mouse_send_info+0CH]        ; 13B9 _ A1, 0000000C(d)
        and     eax, 01H                                ; 13BE _ 83. E0, 01
        test    eax, eax                                ; 13C1 _ 85. C0
        jz      ?_047                                   ; 13C3 _ 74, 2C
        mov     eax, dword [mouse_y]                    ; 13C5 _ A1, 000002AC(d)
        lea     ecx, [eax-8H]                           ; 13CA _ 8D. 48, F8
        mov     eax, dword [mouse_x]                    ; 13CD _ A1, 000002A8(d)
        lea     edx, [eax-50H]                          ; 13D2 _ 8D. 50, B0
        mov     eax, dword [sheet_win]                  ; 13D5 _ A1, 000002A4(d)
        mov     dword [esp+0CH], ecx                    ; 13DA _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 13DE _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 13E2 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 13E6 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 13E9 _ 89. 04 24
        call    sheet_slide                             ; 13EC _ E8, FFFFFFFC(rel)
?_047:  leave                                           ; 13F1 _ C9
        ret                                             ; 13F2 _ C3
; show_mouse_info End of function

show_memory_info:; Function begin
        push    ebp                                     ; 13F3 _ 55
        mov     ebp, esp                                ; 13F4 _ 89. E5
        sub     esp, 88                                 ; 13F6 _ 83. EC, 58
        mov     dword [ebp-38H], 0                      ; 13F9 _ C7. 45, C8, 00000000
        mov     dword [ebp-34H], 0                      ; 1400 _ C7. 45, CC, 00000000
        mov     dword [ebp-30H], 104                    ; 1407 _ C7. 45, D0, 00000068
        mov     eax, dword [screen_info]                ; 140E _ A1, 00000180(d)
        mov     dword [ebp-2CH], eax                    ; 1413 _ 89. 45, D4
        movzx   eax, word [?_204]                       ; 1416 _ 0F B7. 05, 00000184(d)
        cwde                                            ; 141D _ 98
        mov     dword [ebp-28H], eax                    ; 141E _ 89. 45, D8
        movzx   eax, word [?_205]                       ; 1421 _ 0F B7. 05, 00000186(d)
        cwde                                            ; 1428 _ 98
        mov     dword [ebp-24H], eax                    ; 1429 _ 89. 45, DC
        mov     eax, dword [ebp+0CH]                    ; 142C _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 142F _ 8B. 00
        mov     edx, dword [ebp-24H]                    ; 1431 _ 8B. 55, DC
        mov     dword [esp+8H], edx                     ; 1434 _ 89. 54 24, 08
        mov     edx, dword [ebp-28H]                    ; 1438 _ 8B. 55, D8
        mov     dword [esp+4H], edx                     ; 143B _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 143F _ 89. 04 24
        call    init_desktop                            ; 1442 _ E8, FFFFFFFC(rel)
        mov     dword [esp+14H], 7                      ; 1447 _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_170                  ; 144F _ C7. 44 24, 10, 00000018(d)
        mov     eax, dword [ebp-34H]                    ; 1457 _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 145A _ 89. 44 24, 0C
        mov     eax, dword [ebp-38H]                    ; 145E _ 8B. 45, C8
        mov     dword [esp+8H], eax                     ; 1461 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 1465 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 1468 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 146C _ 8B. 45, 08
        mov     dword [esp], eax                        ; 146F _ 89. 04 24
        call    paint_string                            ; 1472 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+14H]                    ; 1477 _ 8B. 45, 14
        mov     dword [esp], eax                        ; 147A _ 89. 04 24
        call    intToHexStr                             ; 147D _ E8, FFFFFFFC(rel)
        mov     dword [ebp-20H], eax                    ; 1482 _ 89. 45, E0
        mov     dword [esp+14H], 7                      ; 1485 _ C7. 44 24, 14, 00000007
        mov     eax, dword [ebp-20H]                    ; 148D _ 8B. 45, E0
        mov     dword [esp+10H], eax                    ; 1490 _ 89. 44 24, 10
        mov     eax, dword [ebp-34H]                    ; 1494 _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 1497 _ 89. 44 24, 0C
        mov     eax, dword [ebp-30H]                    ; 149B _ 8B. 45, D0
        mov     dword [esp+8H], eax                     ; 149E _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 14A2 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 14A5 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 14A9 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 14AC _ 89. 04 24
        call    paint_string                            ; 14AF _ E8, FFFFFFFC(rel)
        add     dword [ebp-34H], 16                     ; 14B4 _ 83. 45, CC, 10
        mov     dword [esp+14H], 7                      ; 14B8 _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_171                  ; 14C0 _ C7. 44 24, 10, 00000022(d)
        mov     eax, dword [ebp-34H]                    ; 14C8 _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 14CB _ 89. 44 24, 0C
        mov     eax, dword [ebp-38H]                    ; 14CF _ 8B. 45, C8
        mov     dword [esp+8H], eax                     ; 14D2 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 14D6 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 14D9 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 14DD _ 8B. 45, 08
        mov     dword [esp], eax                        ; 14E0 _ 89. 04 24
        call    paint_string                            ; 14E3 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 14E8 _ 8B. 45, 10
        mov     eax, dword [eax]                        ; 14EB _ 8B. 00
        mov     dword [esp], eax                        ; 14ED _ 89. 04 24
        call    intToHexStr                             ; 14F0 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-1CH], eax                    ; 14F5 _ 89. 45, E4
        mov     dword [esp+14H], 7                      ; 14F8 _ C7. 44 24, 14, 00000007
        mov     eax, dword [ebp-1CH]                    ; 1500 _ 8B. 45, E4
        mov     dword [esp+10H], eax                    ; 1503 _ 89. 44 24, 10
        mov     eax, dword [ebp-34H]                    ; 1507 _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 150A _ 89. 44 24, 0C
        mov     eax, dword [ebp-30H]                    ; 150E _ 8B. 45, D0
        mov     dword [esp+8H], eax                     ; 1511 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 1515 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 1518 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 151C _ 8B. 45, 08
        mov     dword [esp], eax                        ; 151F _ 89. 04 24
        call    paint_string                            ; 1522 _ E8, FFFFFFFC(rel)
        add     dword [ebp-34H], 16                     ; 1527 _ 83. 45, CC, 10
        mov     dword [esp+14H], 7                      ; 152B _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_172                  ; 1533 _ C7. 44 24, 10, 0000002E(d)
        mov     eax, dword [ebp-34H]                    ; 153B _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 153E _ 89. 44 24, 0C
        mov     eax, dword [ebp-38H]                    ; 1542 _ 8B. 45, C8
        mov     dword [esp+8H], eax                     ; 1545 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 1549 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 154C _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1550 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1553 _ 89. 04 24
        call    paint_string                            ; 1556 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 155B _ 8B. 45, 10
        mov     eax, dword [eax+4H]                     ; 155E _ 8B. 40, 04
        mov     dword [esp], eax                        ; 1561 _ 89. 04 24
        call    intToHexStr                             ; 1564 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-18H], eax                    ; 1569 _ 89. 45, E8
        mov     dword [esp+14H], 7                      ; 156C _ C7. 44 24, 14, 00000007
        mov     eax, dword [ebp-18H]                    ; 1574 _ 8B. 45, E8
        mov     dword [esp+10H], eax                    ; 1577 _ 89. 44 24, 10
        mov     eax, dword [ebp-34H]                    ; 157B _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 157E _ 89. 44 24, 0C
        mov     eax, dword [ebp-30H]                    ; 1582 _ 8B. 45, D0
        mov     dword [esp+8H], eax                     ; 1585 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 1589 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 158C _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1590 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1593 _ 89. 04 24
        call    paint_string                            ; 1596 _ E8, FFFFFFFC(rel)
        add     dword [ebp-34H], 16                     ; 159B _ 83. 45, CC, 10
        mov     dword [esp+14H], 7                      ; 159F _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_173                  ; 15A7 _ C7. 44 24, 10, 0000003A(d)
        mov     eax, dword [ebp-34H]                    ; 15AF _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 15B2 _ 89. 44 24, 0C
        mov     eax, dword [ebp-38H]                    ; 15B6 _ 8B. 45, C8
        mov     dword [esp+8H], eax                     ; 15B9 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 15BD _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 15C0 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 15C4 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 15C7 _ 89. 04 24
        call    paint_string                            ; 15CA _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 15CF _ 8B. 45, 10
        mov     eax, dword [eax+8H]                     ; 15D2 _ 8B. 40, 08
        mov     dword [esp], eax                        ; 15D5 _ 89. 04 24
        call    intToHexStr                             ; 15D8 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-14H], eax                    ; 15DD _ 89. 45, EC
        mov     dword [esp+14H], 7                      ; 15E0 _ C7. 44 24, 14, 00000007
        mov     eax, dword [ebp-14H]                    ; 15E8 _ 8B. 45, EC
        mov     dword [esp+10H], eax                    ; 15EB _ 89. 44 24, 10
        mov     eax, dword [ebp-34H]                    ; 15EF _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 15F2 _ 89. 44 24, 0C
        mov     eax, dword [ebp-30H]                    ; 15F6 _ 8B. 45, D0
        mov     dword [esp+8H], eax                     ; 15F9 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 15FD _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 1600 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1604 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1607 _ 89. 04 24
        call    paint_string                            ; 160A _ E8, FFFFFFFC(rel)
        add     dword [ebp-34H], 16                     ; 160F _ 83. 45, CC, 10
        mov     dword [esp+14H], 7                      ; 1613 _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_174                  ; 161B _ C7. 44 24, 10, 00000046(d)
        mov     eax, dword [ebp-34H]                    ; 1623 _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 1626 _ 89. 44 24, 0C
        mov     eax, dword [ebp-38H]                    ; 162A _ 8B. 45, C8
        mov     dword [esp+8H], eax                     ; 162D _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 1631 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 1634 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1638 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 163B _ 89. 04 24
        call    paint_string                            ; 163E _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 1643 _ 8B. 45, 10
        mov     eax, dword [eax+0CH]                    ; 1646 _ 8B. 40, 0C
        mov     dword [esp], eax                        ; 1649 _ 89. 04 24
        call    intToHexStr                             ; 164C _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 1651 _ 89. 45, F0
        mov     dword [esp+14H], 7                      ; 1654 _ C7. 44 24, 14, 00000007
        mov     eax, dword [ebp-10H]                    ; 165C _ 8B. 45, F0
        mov     dword [esp+10H], eax                    ; 165F _ 89. 44 24, 10
        mov     eax, dword [ebp-34H]                    ; 1663 _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 1666 _ 89. 44 24, 0C
        mov     eax, dword [ebp-30H]                    ; 166A _ 8B. 45, D0
        mov     dword [esp+8H], eax                     ; 166D _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 1671 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 1674 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1678 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 167B _ 89. 04 24
        call    paint_string                            ; 167E _ E8, FFFFFFFC(rel)
        add     dword [ebp-34H], 16                     ; 1683 _ 83. 45, CC, 10
        mov     dword [esp+14H], 7                      ; 1687 _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_175                  ; 168F _ C7. 44 24, 10, 00000053(d)
        mov     eax, dword [ebp-34H]                    ; 1697 _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 169A _ 89. 44 24, 0C
        mov     eax, dword [ebp-38H]                    ; 169E _ 8B. 45, C8
        mov     dword [esp+8H], eax                     ; 16A1 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 16A5 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 16A8 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 16AC _ 8B. 45, 08
        mov     dword [esp], eax                        ; 16AF _ 89. 04 24
        call    paint_string                            ; 16B2 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 16B7 _ 8B. 45, 10
        mov     eax, dword [eax+10H]                    ; 16BA _ 8B. 40, 10
        mov     dword [esp], eax                        ; 16BD _ 89. 04 24
        call    intToHexStr                             ; 16C0 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 16C5 _ 89. 45, F4
        mov     dword [esp+14H], 7                      ; 16C8 _ C7. 44 24, 14, 00000007
        mov     eax, dword [ebp-0CH]                    ; 16D0 _ 8B. 45, F4
        mov     dword [esp+10H], eax                    ; 16D3 _ 89. 44 24, 10
        mov     eax, dword [ebp-34H]                    ; 16D7 _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 16DA _ 89. 44 24, 0C
        mov     eax, dword [ebp-30H]                    ; 16DE _ 8B. 45, D0
        mov     dword [esp+8H], eax                     ; 16E1 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 16E5 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 16E8 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 16EC _ 8B. 45, 08
        mov     dword [esp], eax                        ; 16EF _ 89. 04 24
        call    paint_string                            ; 16F2 _ E8, FFFFFFFC(rel)
        add     dword [ebp-34H], 16                     ; 16F7 _ 83. 45, CC, 10
        leave                                           ; 16FB _ C9
        ret                                             ; 16FC _ C3
; show_memory_info End of function

message_box:; Function begin
        push    ebp                                     ; 16FD _ 55
        mov     ebp, esp                                ; 16FE _ 89. E5
        sub     esp, 56                                 ; 1700 _ 83. EC, 38
        mov     eax, dword [ebp+8H]                     ; 1703 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1706 _ 89. 04 24
        call    sheet_alloc                             ; 1709 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 170E _ 89. 45, F0
        mov     eax, dword [memman]                     ; 1711 _ A1, 00000000(d)
        mov     dword [esp+4H], 10880                   ; 1716 _ C7. 44 24, 04, 00002A80
        mov     dword [esp], eax                        ; 171E _ 89. 04 24
        call    memman_alloc_4k                         ; 1721 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 1726 _ 89. 45, F4
        mov     dword [esp+10H], 99                     ; 1729 _ C7. 44 24, 10, 00000063
        mov     dword [esp+0CH], 68                     ; 1731 _ C7. 44 24, 0C, 00000044
        mov     dword [esp+8H], 160                     ; 1739 _ C7. 44 24, 08, 000000A0
        mov     eax, dword [ebp-0CH]                    ; 1741 _ 8B. 45, F4
        mov     dword [esp+4H], eax                     ; 1744 _ 89. 44 24, 04
        mov     eax, dword [ebp-10H]                    ; 1748 _ 8B. 45, F0
        mov     dword [esp], eax                        ; 174B _ 89. 04 24
        call    sheet_setbuf                            ; 174E _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+0CH]                    ; 1753 _ 8B. 45, 0C
        mov     dword [esp+8H], eax                     ; 1756 _ 89. 44 24, 08
        mov     eax, dword [ebp-10H]                    ; 175A _ 8B. 45, F0
        mov     dword [esp+4H], eax                     ; 175D _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1761 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1764 _ 89. 04 24
        call    make_windows                            ; 1767 _ E8, FFFFFFFC(rel)
        mov     dword [esp+14H], 7                      ; 176C _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], 16                     ; 1774 _ C7. 44 24, 10, 00000010
        mov     dword [esp+0CH], 144                    ; 177C _ C7. 44 24, 0C, 00000090
        mov     dword [esp+8H], 28                      ; 1784 _ C7. 44 24, 08, 0000001C
        mov     dword [esp+4H], 8                       ; 178C _ C7. 44 24, 04, 00000008
        mov     eax, dword [ebp-10H]                    ; 1794 _ 8B. 45, F0
        mov     dword [esp], eax                        ; 1797 _ 89. 04 24
        call    make_textbox                            ; 179A _ E8, FFFFFFFC(rel)
        mov     dword [esp+0CH], 72                     ; 179F _ C7. 44 24, 0C, 00000048
        mov     dword [esp+8H], 80                      ; 17A7 _ C7. 44 24, 08, 00000050
        mov     eax, dword [ebp-10H]                    ; 17AF _ 8B. 45, F0
        mov     dword [esp+4H], eax                     ; 17B2 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 17B6 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 17B9 _ 89. 04 24
        call    sheet_slide                             ; 17BC _ E8, FFFFFFFC(rel)
        mov     dword [esp+8H], 2                       ; 17C1 _ C7. 44 24, 08, 00000002
        mov     eax, dword [ebp-10H]                    ; 17C9 _ 8B. 45, F0
        mov     dword [esp+4H], eax                     ; 17CC _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 17D0 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 17D3 _ 89. 04 24
        call    sheet_updown                            ; 17D6 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 17DB _ 8B. 45, F0
        leave                                           ; 17DE _ C9
        ret                                             ; 17DF _ C3
; message_box End of function

make_textbox:; Function begin
        push    ebp                                     ; 17E0 _ 55
        mov     ebp, esp                                ; 17E1 _ 89. E5
        push    edi                                     ; 17E3 _ 57
        push    esi                                     ; 17E4 _ 56
        push    ebx                                     ; 17E5 _ 53
        sub     esp, 44                                 ; 17E6 _ 83. EC, 2C
        mov     eax, dword [ebp+14H]                    ; 17E9 _ 8B. 45, 14
        mov     edx, dword [ebp+0CH]                    ; 17EC _ 8B. 55, 0C
        add     eax, edx                                ; 17EF _ 01. D0
        mov     dword [ebp-14H], eax                    ; 17F1 _ 89. 45, EC
        mov     eax, dword [ebp+18H]                    ; 17F4 _ 8B. 45, 18
        mov     edx, dword [ebp+10H]                    ; 17F7 _ 8B. 55, 10
        add     eax, edx                                ; 17FA _ 01. D0
        mov     dword [ebp-10H], eax                    ; 17FC _ 89. 45, F0
        mov     eax, dword [ebp+10H]                    ; 17FF _ 8B. 45, 10
        lea     edi, [eax-3H]                           ; 1802 _ 8D. 78, FD
        mov     eax, dword [ebp-14H]                    ; 1805 _ 8B. 45, EC
        lea     esi, [eax+1H]                           ; 1808 _ 8D. 70, 01
        mov     eax, dword [ebp+10H]                    ; 180B _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 180E _ 8D. 58, FD
        mov     eax, dword [ebp+0CH]                    ; 1811 _ 8B. 45, 0C
        lea     ecx, [eax-2H]                           ; 1814 _ 8D. 48, FE
        mov     eax, dword [ebp+8H]                     ; 1817 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 181A _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 181D _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1820 _ 8B. 00
        mov     dword [esp+18H], edi                    ; 1822 _ 89. 7C 24, 18
        mov     dword [esp+14H], esi                    ; 1826 _ 89. 74 24, 14
        mov     dword [esp+10H], ebx                    ; 182A _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 182E _ 89. 4C 24, 0C
        mov     dword [esp+8H], 15                      ; 1832 _ C7. 44 24, 08, 0000000F
        mov     dword [esp+4H], edx                     ; 183A _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 183E _ 89. 04 24
        call    paint_rectangle                         ; 1841 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 1846 _ 8B. 45, F0
        lea     edi, [eax+1H]                           ; 1849 _ 8D. 78, 01
        mov     eax, dword [ebp+0CH]                    ; 184C _ 8B. 45, 0C
        lea     esi, [eax-3H]                           ; 184F _ 8D. 70, FD
        mov     eax, dword [ebp+10H]                    ; 1852 _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 1855 _ 8D. 58, FD
        mov     eax, dword [ebp+0CH]                    ; 1858 _ 8B. 45, 0C
        lea     ecx, [eax-3H]                           ; 185B _ 8D. 48, FD
        mov     eax, dword [ebp+8H]                     ; 185E _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 1861 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1864 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1867 _ 8B. 00
        mov     dword [esp+18H], edi                    ; 1869 _ 89. 7C 24, 18
        mov     dword [esp+14H], esi                    ; 186D _ 89. 74 24, 14
        mov     dword [esp+10H], ebx                    ; 1871 _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 1875 _ 89. 4C 24, 0C
        mov     dword [esp+8H], 15                      ; 1879 _ C7. 44 24, 08, 0000000F
        mov     dword [esp+4H], edx                     ; 1881 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1885 _ 89. 04 24
        call    paint_rectangle                         ; 1888 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 188D _ 8B. 45, F0
        lea     edi, [eax+2H]                           ; 1890 _ 8D. 78, 02
        mov     eax, dword [ebp-14H]                    ; 1893 _ 8B. 45, EC
        lea     esi, [eax+1H]                           ; 1896 _ 8D. 70, 01
        mov     eax, dword [ebp-10H]                    ; 1899 _ 8B. 45, F0
        lea     ebx, [eax+2H]                           ; 189C _ 8D. 58, 02
        mov     eax, dword [ebp+0CH]                    ; 189F _ 8B. 45, 0C
        lea     ecx, [eax-3H]                           ; 18A2 _ 8D. 48, FD
        mov     eax, dword [ebp+8H]                     ; 18A5 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 18A8 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 18AB _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 18AE _ 8B. 00
        mov     dword [esp+18H], edi                    ; 18B0 _ 89. 7C 24, 18
        mov     dword [esp+14H], esi                    ; 18B4 _ 89. 74 24, 14
        mov     dword [esp+10H], ebx                    ; 18B8 _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 18BC _ 89. 4C 24, 0C
        mov     dword [esp+8H], 7                       ; 18C0 _ C7. 44 24, 08, 00000007
        mov     dword [esp+4H], edx                     ; 18C8 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 18CC _ 89. 04 24
        call    paint_rectangle                         ; 18CF _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 18D4 _ 8B. 45, F0
        lea     edi, [eax+2H]                           ; 18D7 _ 8D. 78, 02
        mov     eax, dword [ebp-14H]                    ; 18DA _ 8B. 45, EC
        lea     esi, [eax+2H]                           ; 18DD _ 8D. 70, 02
        mov     eax, dword [ebp+10H]                    ; 18E0 _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 18E3 _ 8D. 58, FD
        mov     eax, dword [ebp-14H]                    ; 18E6 _ 8B. 45, EC
        lea     ecx, [eax+2H]                           ; 18E9 _ 8D. 48, 02
        mov     eax, dword [ebp+8H]                     ; 18EC _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 18EF _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 18F2 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 18F5 _ 8B. 00
        mov     dword [esp+18H], edi                    ; 18F7 _ 89. 7C 24, 18
        mov     dword [esp+14H], esi                    ; 18FB _ 89. 74 24, 14
        mov     dword [esp+10H], ebx                    ; 18FF _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 1903 _ 89. 4C 24, 0C
        mov     dword [esp+8H], 7                       ; 1907 _ C7. 44 24, 08, 00000007
        mov     dword [esp+4H], edx                     ; 190F _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1913 _ 89. 04 24
        call    paint_rectangle                         ; 1916 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 191B _ 8B. 45, 10
        lea     ecx, [eax-2H]                           ; 191E _ 8D. 48, FE
        mov     eax, dword [ebp+10H]                    ; 1921 _ 8B. 45, 10
        lea     esi, [eax-2H]                           ; 1924 _ 8D. 70, FE
        mov     eax, dword [ebp+0CH]                    ; 1927 _ 8B. 45, 0C
        lea     ebx, [eax-1H]                           ; 192A _ 8D. 58, FF
        mov     eax, dword [ebp+8H]                     ; 192D _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 1930 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1933 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1936 _ 8B. 00
        mov     dword [esp+18H], ecx                    ; 1938 _ 89. 4C 24, 18
        mov     ecx, dword [ebp-14H]                    ; 193C _ 8B. 4D, EC
        mov     dword [esp+14H], ecx                    ; 193F _ 89. 4C 24, 14
        mov     dword [esp+10H], esi                    ; 1943 _ 89. 74 24, 10
        mov     dword [esp+0CH], ebx                    ; 1947 _ 89. 5C 24, 0C
        mov     dword [esp+8H], 0                       ; 194B _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], edx                     ; 1953 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1957 _ 89. 04 24
        call    paint_rectangle                         ; 195A _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+0CH]                    ; 195F _ 8B. 45, 0C
        lea     edi, [eax-2H]                           ; 1962 _ 8D. 78, FE
        mov     eax, dword [ebp+10H]                    ; 1965 _ 8B. 45, 10
        lea     esi, [eax-2H]                           ; 1968 _ 8D. 70, FE
        mov     eax, dword [ebp+0CH]                    ; 196B _ 8B. 45, 0C
        lea     ebx, [eax-2H]                           ; 196E _ 8D. 58, FE
        mov     eax, dword [ebp+8H]                     ; 1971 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 1974 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1977 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 197A _ 8B. 00
        mov     ecx, dword [ebp-10H]                    ; 197C _ 8B. 4D, F0
        mov     dword [esp+18H], ecx                    ; 197F _ 89. 4C 24, 18
        mov     dword [esp+14H], edi                    ; 1983 _ 89. 7C 24, 14
        mov     dword [esp+10H], esi                    ; 1987 _ 89. 74 24, 10
        mov     dword [esp+0CH], ebx                    ; 198B _ 89. 5C 24, 0C
        mov     dword [esp+8H], 0                       ; 198F _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], edx                     ; 1997 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 199B _ 89. 04 24
        call    paint_rectangle                         ; 199E _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 19A3 _ 8B. 45, F0
        lea     ecx, [eax+1H]                           ; 19A6 _ 8D. 48, 01
        mov     eax, dword [ebp-10H]                    ; 19A9 _ 8B. 45, F0
        lea     esi, [eax+1H]                           ; 19AC _ 8D. 70, 01
        mov     eax, dword [ebp+0CH]                    ; 19AF _ 8B. 45, 0C
        lea     ebx, [eax-2H]                           ; 19B2 _ 8D. 58, FE
        mov     eax, dword [ebp+8H]                     ; 19B5 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 19B8 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 19BB _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 19BE _ 8B. 00
        mov     dword [esp+18H], ecx                    ; 19C0 _ 89. 4C 24, 18
        mov     ecx, dword [ebp-14H]                    ; 19C4 _ 8B. 4D, EC
        mov     dword [esp+14H], ecx                    ; 19C7 _ 89. 4C 24, 14
        mov     dword [esp+10H], esi                    ; 19CB _ 89. 74 24, 10
        mov     dword [esp+0CH], ebx                    ; 19CF _ 89. 5C 24, 0C
        mov     dword [esp+8H], 8                       ; 19D3 _ C7. 44 24, 08, 00000008
        mov     dword [esp+4H], edx                     ; 19DB _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 19DF _ 89. 04 24
        call    paint_rectangle                         ; 19E2 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 19E7 _ 8B. 45, F0
        lea     edi, [eax+1H]                           ; 19EA _ 8D. 78, 01
        mov     eax, dword [ebp-14H]                    ; 19ED _ 8B. 45, EC
        lea     esi, [eax+1H]                           ; 19F0 _ 8D. 70, 01
        mov     eax, dword [ebp+10H]                    ; 19F3 _ 8B. 45, 10
        lea     ebx, [eax-2H]                           ; 19F6 _ 8D. 58, FE
        mov     eax, dword [ebp-14H]                    ; 19F9 _ 8B. 45, EC
        lea     ecx, [eax+1H]                           ; 19FC _ 8D. 48, 01
        mov     eax, dword [ebp+8H]                     ; 19FF _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 1A02 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1A05 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1A08 _ 8B. 00
        mov     dword [esp+18H], edi                    ; 1A0A _ 89. 7C 24, 18
        mov     dword [esp+14H], esi                    ; 1A0E _ 89. 74 24, 14
        mov     dword [esp+10H], ebx                    ; 1A12 _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 1A16 _ 89. 4C 24, 0C
        mov     dword [esp+8H], 8                       ; 1A1A _ C7. 44 24, 08, 00000008
        mov     dword [esp+4H], edx                     ; 1A22 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1A26 _ 89. 04 24
        call    paint_rectangle                         ; 1A29 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 1A2E _ 8B. 45, 10
        lea     edi, [eax-1H]                           ; 1A31 _ 8D. 78, FF
        mov     eax, dword [ebp+0CH]                    ; 1A34 _ 8B. 45, 0C
        lea     esi, [eax-1H]                           ; 1A37 _ 8D. 70, FF
        mov     eax, dword [ebp+1CH]                    ; 1A3A _ 8B. 45, 1C
        movzx   ecx, al                                 ; 1A3D _ 0F B6. C8
        mov     eax, dword [ebp+8H]                     ; 1A40 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 1A43 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1A46 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1A49 _ 8B. 00
        mov     ebx, dword [ebp-10H]                    ; 1A4B _ 8B. 5D, F0
        mov     dword [esp+18H], ebx                    ; 1A4E _ 89. 5C 24, 18
        mov     ebx, dword [ebp-14H]                    ; 1A52 _ 8B. 5D, EC
        mov     dword [esp+14H], ebx                    ; 1A55 _ 89. 5C 24, 14
        mov     dword [esp+10H], edi                    ; 1A59 _ 89. 7C 24, 10
        mov     dword [esp+0CH], esi                    ; 1A5D _ 89. 74 24, 0C
        mov     dword [esp+8H], ecx                     ; 1A61 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 1A65 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1A69 _ 89. 04 24
        call    paint_rectangle                         ; 1A6C _ E8, FFFFFFFC(rel)
        add     esp, 44                                 ; 1A71 _ 83. C4, 2C
        pop     ebx                                     ; 1A74 _ 5B
        pop     esi                                     ; 1A75 _ 5E
        pop     edi                                     ; 1A76 _ 5F
        pop     ebp                                     ; 1A77 _ 5D
        ret                                             ; 1A78 _ C3
; make_textbox End of function

make_windows:; Function begin
        push    ebp                                     ; 1A79 _ 55
        mov     ebp, esp                                ; 1A7A _ 89. E5
        push    ebx                                     ; 1A7C _ 53
        sub     esp, 68                                 ; 1A7D _ 83. EC, 44
        mov     eax, dword [ebp+0CH]                    ; 1A80 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 1A83 _ 8B. 40, 04
        mov     dword [ebp-10H], eax                    ; 1A86 _ 89. 45, F0
        mov     eax, dword [ebp+0CH]                    ; 1A89 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 1A8C _ 8B. 40, 08
        mov     dword [ebp-0CH], eax                    ; 1A8F _ 89. 45, F4
        mov     eax, dword [ebp-10H]                    ; 1A92 _ 8B. 45, F0
        lea     edx, [eax-1H]                           ; 1A95 _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 1A98 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1A9B _ 8B. 00
        mov     dword [esp+18H], 0                      ; 1A9D _ C7. 44 24, 18, 00000000
        mov     dword [esp+14H], edx                    ; 1AA5 _ 89. 54 24, 14
        mov     dword [esp+10H], 0                      ; 1AA9 _ C7. 44 24, 10, 00000000
        mov     dword [esp+0CH], 0                      ; 1AB1 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 8                       ; 1AB9 _ C7. 44 24, 08, 00000008
        mov     edx, dword [ebp-10H]                    ; 1AC1 _ 8B. 55, F0
        mov     dword [esp+4H], edx                     ; 1AC4 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1AC8 _ 89. 04 24
        call    paint_rectangle                         ; 1ACB _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 1AD0 _ 8B. 45, F0
        lea     edx, [eax-2H]                           ; 1AD3 _ 8D. 50, FE
        mov     eax, dword [ebp+0CH]                    ; 1AD6 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1AD9 _ 8B. 00
        mov     dword [esp+18H], 1                      ; 1ADB _ C7. 44 24, 18, 00000001
        mov     dword [esp+14H], edx                    ; 1AE3 _ 89. 54 24, 14
        mov     dword [esp+10H], 1                      ; 1AE7 _ C7. 44 24, 10, 00000001
        mov     dword [esp+0CH], 1                      ; 1AEF _ C7. 44 24, 0C, 00000001
        mov     dword [esp+8H], 7                       ; 1AF7 _ C7. 44 24, 08, 00000007
        mov     edx, dword [ebp-10H]                    ; 1AFF _ 8B. 55, F0
        mov     dword [esp+4H], edx                     ; 1B02 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1B06 _ 89. 04 24
        call    paint_rectangle                         ; 1B09 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 1B0E _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 1B11 _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 1B14 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1B17 _ 8B. 00
        mov     dword [esp+18H], edx                    ; 1B19 _ 89. 54 24, 18
        mov     dword [esp+14H], 0                      ; 1B1D _ C7. 44 24, 14, 00000000
        mov     dword [esp+10H], 0                      ; 1B25 _ C7. 44 24, 10, 00000000
        mov     dword [esp+0CH], 0                      ; 1B2D _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 8                       ; 1B35 _ C7. 44 24, 08, 00000008
        mov     edx, dword [ebp-10H]                    ; 1B3D _ 8B. 55, F0
        mov     dword [esp+4H], edx                     ; 1B40 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1B44 _ 89. 04 24
        call    paint_rectangle                         ; 1B47 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 1B4C _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 1B4F _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 1B52 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1B55 _ 8B. 00
        mov     dword [esp+18H], edx                    ; 1B57 _ 89. 54 24, 18
        mov     dword [esp+14H], 1                      ; 1B5B _ C7. 44 24, 14, 00000001
        mov     dword [esp+10H], 1                      ; 1B63 _ C7. 44 24, 10, 00000001
        mov     dword [esp+0CH], 1                      ; 1B6B _ C7. 44 24, 0C, 00000001
        mov     dword [esp+8H], 7                       ; 1B73 _ C7. 44 24, 08, 00000007
        mov     edx, dword [ebp-10H]                    ; 1B7B _ 8B. 55, F0
        mov     dword [esp+4H], edx                     ; 1B7E _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1B82 _ 89. 04 24
        call    paint_rectangle                         ; 1B85 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 1B8A _ 8B. 45, F4
        lea     ebx, [eax-2H]                           ; 1B8D _ 8D. 58, FE
        mov     eax, dword [ebp-10H]                    ; 1B90 _ 8B. 45, F0
        lea     ecx, [eax-2H]                           ; 1B93 _ 8D. 48, FE
        mov     eax, dword [ebp-10H]                    ; 1B96 _ 8B. 45, F0
        lea     edx, [eax-2H]                           ; 1B99 _ 8D. 50, FE
        mov     eax, dword [ebp+0CH]                    ; 1B9C _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1B9F _ 8B. 00
        mov     dword [esp+18H], ebx                    ; 1BA1 _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 1BA5 _ 89. 4C 24, 14
        mov     dword [esp+10H], 1                      ; 1BA9 _ C7. 44 24, 10, 00000001
        mov     dword [esp+0CH], edx                    ; 1BB1 _ 89. 54 24, 0C
        mov     dword [esp+8H], 15                      ; 1BB5 _ C7. 44 24, 08, 0000000F
        mov     edx, dword [ebp-10H]                    ; 1BBD _ 8B. 55, F0
        mov     dword [esp+4H], edx                     ; 1BC0 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1BC4 _ 89. 04 24
        call    paint_rectangle                         ; 1BC7 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 1BCC _ 8B. 45, F4
        lea     ebx, [eax-1H]                           ; 1BCF _ 8D. 58, FF
        mov     eax, dword [ebp-10H]                    ; 1BD2 _ 8B. 45, F0
        lea     ecx, [eax-1H]                           ; 1BD5 _ 8D. 48, FF
        mov     eax, dword [ebp-10H]                    ; 1BD8 _ 8B. 45, F0
        lea     edx, [eax-1H]                           ; 1BDB _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 1BDE _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1BE1 _ 8B. 00
        mov     dword [esp+18H], ebx                    ; 1BE3 _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 1BE7 _ 89. 4C 24, 14
        mov     dword [esp+10H], 0                      ; 1BEB _ C7. 44 24, 10, 00000000
        mov     dword [esp+0CH], edx                    ; 1BF3 _ 89. 54 24, 0C
        mov     dword [esp+8H], 0                       ; 1BF7 _ C7. 44 24, 08, 00000000
        mov     edx, dword [ebp-10H]                    ; 1BFF _ 8B. 55, F0
        mov     dword [esp+4H], edx                     ; 1C02 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1C06 _ 89. 04 24
        call    paint_rectangle                         ; 1C09 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 1C0E _ 8B. 45, F4
        lea     ecx, [eax-3H]                           ; 1C11 _ 8D. 48, FD
        mov     eax, dword [ebp-10H]                    ; 1C14 _ 8B. 45, F0
        lea     edx, [eax-3H]                           ; 1C17 _ 8D. 50, FD
        mov     eax, dword [ebp+0CH]                    ; 1C1A _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1C1D _ 8B. 00
        mov     dword [esp+18H], ecx                    ; 1C1F _ 89. 4C 24, 18
        mov     dword [esp+14H], edx                    ; 1C23 _ 89. 54 24, 14
        mov     dword [esp+10H], 2                      ; 1C27 _ C7. 44 24, 10, 00000002
        mov     dword [esp+0CH], 2                      ; 1C2F _ C7. 44 24, 0C, 00000002
        mov     dword [esp+8H], 8                       ; 1C37 _ C7. 44 24, 08, 00000008
        mov     edx, dword [ebp-10H]                    ; 1C3F _ 8B. 55, F0
        mov     dword [esp+4H], edx                     ; 1C42 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1C46 _ 89. 04 24
        call    paint_rectangle                         ; 1C49 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 1C4E _ 8B. 45, F0
        lea     edx, [eax-4H]                           ; 1C51 _ 8D. 50, FC
        mov     eax, dword [ebp+0CH]                    ; 1C54 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1C57 _ 8B. 00
        mov     dword [esp+18H], 20                     ; 1C59 _ C7. 44 24, 18, 00000014
        mov     dword [esp+14H], edx                    ; 1C61 _ 89. 54 24, 14
        mov     dword [esp+10H], 3                      ; 1C65 _ C7. 44 24, 10, 00000003
        mov     dword [esp+0CH], 3                      ; 1C6D _ C7. 44 24, 0C, 00000003
        mov     dword [esp+8H], 12                      ; 1C75 _ C7. 44 24, 08, 0000000C
        mov     edx, dword [ebp-10H]                    ; 1C7D _ 8B. 55, F0
        mov     dword [esp+4H], edx                     ; 1C80 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1C84 _ 89. 04 24
        call    paint_rectangle                         ; 1C87 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 1C8C _ 8B. 45, F4
        lea     ebx, [eax-2H]                           ; 1C8F _ 8D. 58, FE
        mov     eax, dword [ebp-10H]                    ; 1C92 _ 8B. 45, F0
        lea     ecx, [eax-2H]                           ; 1C95 _ 8D. 48, FE
        mov     eax, dword [ebp-0CH]                    ; 1C98 _ 8B. 45, F4
        lea     edx, [eax-2H]                           ; 1C9B _ 8D. 50, FE
        mov     eax, dword [ebp+0CH]                    ; 1C9E _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1CA1 _ 8B. 00
        mov     dword [esp+18H], ebx                    ; 1CA3 _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 1CA7 _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 1CAB _ 89. 54 24, 10
        mov     dword [esp+0CH], 1                      ; 1CAF _ C7. 44 24, 0C, 00000001
        mov     dword [esp+8H], 15                      ; 1CB7 _ C7. 44 24, 08, 0000000F
        mov     edx, dword [ebp-10H]                    ; 1CBF _ 8B. 55, F0
        mov     dword [esp+4H], edx                     ; 1CC2 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1CC6 _ 89. 04 24
        call    paint_rectangle                         ; 1CC9 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 1CCE _ 8B. 45, F4
        lea     ebx, [eax-1H]                           ; 1CD1 _ 8D. 58, FF
        mov     eax, dword [ebp-10H]                    ; 1CD4 _ 8B. 45, F0
        lea     ecx, [eax-1H]                           ; 1CD7 _ 8D. 48, FF
        mov     eax, dword [ebp-0CH]                    ; 1CDA _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 1CDD _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 1CE0 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1CE3 _ 8B. 00
        mov     dword [esp+18H], ebx                    ; 1CE5 _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 1CE9 _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 1CED _ 89. 54 24, 10
        mov     dword [esp+0CH], 0                      ; 1CF1 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 0                       ; 1CF9 _ C7. 44 24, 08, 00000000
        mov     edx, dword [ebp-10H]                    ; 1D01 _ 8B. 55, F0
        mov     dword [esp+4H], edx                     ; 1D04 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1D08 _ 89. 04 24
        call    paint_rectangle                         ; 1D0B _ E8, FFFFFFFC(rel)
        mov     dword [esp+14H], 7                      ; 1D10 _ C7. 44 24, 14, 00000007
        mov     eax, dword [ebp+10H]                    ; 1D18 _ 8B. 45, 10
        mov     dword [esp+10H], eax                    ; 1D1B _ 89. 44 24, 10
        mov     dword [esp+0CH], 4                      ; 1D1F _ C7. 44 24, 0C, 00000004
        mov     dword [esp+8H], 24                      ; 1D27 _ C7. 44 24, 08, 00000018
        mov     eax, dword [ebp+0CH]                    ; 1D2F _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 1D32 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1D36 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1D39 _ 89. 04 24
        call    paint_string                            ; 1D3C _ E8, FFFFFFFC(rel)
        mov     dword [ebp-14H], 0                      ; 1D41 _ C7. 45, EC, 00000000
        jmp     ?_055                                   ; 1D48 _ E9, 00000083

?_048:  mov     dword [ebp-18H], 0                      ; 1D4D _ C7. 45, E8, 00000000
        jmp     ?_054                                   ; 1D54 _ EB, 70

?_049:  mov     eax, dword [ebp-14H]                    ; 1D56 _ 8B. 45, EC
        shl     eax, 4                                  ; 1D59 _ C1. E0, 04
        mov     edx, eax                                ; 1D5C _ 89. C2
        mov     eax, dword [ebp-18H]                    ; 1D5E _ 8B. 45, E8
        add     eax, edx                                ; 1D61 _ 01. D0
        add     eax, closebtn.1768                      ; 1D63 _ 05, 000001C0(d)
        movzx   eax, byte [eax]                         ; 1D68 _ 0F B6. 00
        mov     byte [ebp-19H], al                      ; 1D6B _ 88. 45, E7
        cmp     byte [ebp-19H], 64                      ; 1D6E _ 80. 7D, E7, 40
        jnz     ?_050                                   ; 1D72 _ 75, 06
        mov     byte [ebp-19H], 0                       ; 1D74 _ C6. 45, E7, 00
        jmp     ?_053                                   ; 1D78 _ EB, 1C

?_050:  cmp     byte [ebp-19H], 36                      ; 1D7A _ 80. 7D, E7, 24
        jnz     ?_051                                   ; 1D7E _ 75, 06
        mov     byte [ebp-19H], 15                      ; 1D80 _ C6. 45, E7, 0F
        jmp     ?_053                                   ; 1D84 _ EB, 10

?_051:  cmp     byte [ebp-19H], 81                      ; 1D86 _ 80. 7D, E7, 51
        jnz     ?_052                                   ; 1D8A _ 75, 06
        mov     byte [ebp-19H], 8                       ; 1D8C _ C6. 45, E7, 08
        jmp     ?_053                                   ; 1D90 _ EB, 04

?_052:  mov     byte [ebp-19H], 7                       ; 1D92 _ C6. 45, E7, 07
?_053:  mov     eax, dword [ebp+0CH]                    ; 1D96 _ 8B. 45, 0C
        mov     edx, dword [eax]                        ; 1D99 _ 8B. 10
        mov     eax, dword [ebp-14H]                    ; 1D9B _ 8B. 45, EC
        lea     ecx, [eax+5H]                           ; 1D9E _ 8D. 48, 05
        mov     eax, dword [ebp+0CH]                    ; 1DA1 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 1DA4 _ 8B. 40, 04
        imul    ecx, eax                                ; 1DA7 _ 0F AF. C8
        mov     eax, dword [ebp+0CH]                    ; 1DAA _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 1DAD _ 8B. 40, 04
        lea     ebx, [eax-15H]                          ; 1DB0 _ 8D. 58, EB
        mov     eax, dword [ebp-18H]                    ; 1DB3 _ 8B. 45, E8
        add     eax, ebx                                ; 1DB6 _ 01. D8
        add     eax, ecx                                ; 1DB8 _ 01. C8
        add     edx, eax                                ; 1DBA _ 01. C2
        movzx   eax, byte [ebp-19H]                     ; 1DBC _ 0F B6. 45, E7
        mov     byte [edx], al                          ; 1DC0 _ 88. 02
        add     dword [ebp-18H], 1                      ; 1DC2 _ 83. 45, E8, 01
?_054:  cmp     dword [ebp-18H], 15                     ; 1DC6 _ 83. 7D, E8, 0F
        jle     ?_049                                   ; 1DCA _ 7E, 8A
        add     dword [ebp-14H], 1                      ; 1DCC _ 83. 45, EC, 01
?_055:  cmp     dword [ebp-14H], 13                     ; 1DD0 _ 83. 7D, EC, 0D
        jle     ?_048                                   ; 1DD4 _ 0F 8E, FFFFFF73
        add     esp, 68                                 ; 1DDA _ 83. C4, 44
        pop     ebx                                     ; 1DDD _ 5B
        pop     ebp                                     ; 1DDE _ 5D
        ret                                             ; 1DDF _ C3
; make_windows End of function

wait_KBC_sendready:; Function begin
        push    ebp                                     ; 1DE0 _ 55
        mov     ebp, esp                                ; 1DE1 _ 89. E5
        sub     esp, 24                                 ; 1DE3 _ 83. EC, 18
?_056:  mov     dword [esp], 100                        ; 1DE6 _ C7. 04 24, 00000064
        call    io_in8                                  ; 1DED _ E8, FFFFFFFC(rel)
        and     eax, 02H                                ; 1DF2 _ 83. E0, 02
        test    eax, eax                                ; 1DF5 _ 85. C0
        jnz     ?_057                                   ; 1DF7 _ 75, 02
        jmp     ?_058                                   ; 1DF9 _ EB, 02

?_057:  jmp     ?_056                                   ; 1DFB _ EB, E9

?_058:  leave                                           ; 1DFD _ C9
        ret                                             ; 1DFE _ C3
; wait_KBC_sendready End of function

init_keyboard:; Function begin
        push    ebp                                     ; 1DFF _ 55
        mov     ebp, esp                                ; 1E00 _ 89. E5
        sub     esp, 24                                 ; 1E02 _ 83. EC, 18
        call    wait_KBC_sendready                      ; 1E05 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 96                      ; 1E0A _ C7. 44 24, 04, 00000060
        mov     dword [esp], 100                        ; 1E12 _ C7. 04 24, 00000064
        call    io_out8                                 ; 1E19 _ E8, FFFFFFFC(rel)
        call    wait_KBC_sendready                      ; 1E1E _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 71                      ; 1E23 _ C7. 44 24, 04, 00000047
        mov     dword [esp], 96                         ; 1E2B _ C7. 04 24, 00000060
        call    io_out8                                 ; 1E32 _ E8, FFFFFFFC(rel)
        leave                                           ; 1E37 _ C9
        ret                                             ; 1E38 _ C3
; init_keyboard End of function

enable_mouse:; Function begin
        push    ebp                                     ; 1E39 _ 55
        mov     ebp, esp                                ; 1E3A _ 89. E5
        sub     esp, 24                                 ; 1E3C _ 83. EC, 18
        call    wait_KBC_sendready                      ; 1E3F _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 212                     ; 1E44 _ C7. 44 24, 04, 000000D4
        mov     dword [esp], 100                        ; 1E4C _ C7. 04 24, 00000064
        call    io_out8                                 ; 1E53 _ E8, FFFFFFFC(rel)
        call    wait_KBC_sendready                      ; 1E58 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 244                     ; 1E5D _ C7. 44 24, 04, 000000F4
        mov     dword [esp], 96                         ; 1E65 _ C7. 04 24, 00000060
        call    io_out8                                 ; 1E6C _ E8, FFFFFFFC(rel)
        leave                                           ; 1E71 _ C9
        ret                                             ; 1E72 _ C3
; enable_mouse End of function

mouse_decode:; Function begin
        push    ebp                                     ; 1E73 _ 55
        mov     ebp, esp                                ; 1E74 _ 89. E5
        sub     esp, 4                                  ; 1E76 _ 83. EC, 04
        mov     eax, dword [ebp+0CH]                    ; 1E79 _ 8B. 45, 0C
        mov     byte [ebp-4H], al                       ; 1E7C _ 88. 45, FC
        mov     eax, dword [ebp+8H]                     ; 1E7F _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 1E82 _ 0F B6. 40, 03
        test    al, al                                  ; 1E86 _ 84. C0
        jnz     ?_060                                   ; 1E88 _ 75, 17
        cmp     byte [ebp-4H], -6                       ; 1E8A _ 80. 7D, FC, FA
        jnz     ?_059                                   ; 1E8E _ 75, 07
        mov     eax, dword [ebp+8H]                     ; 1E90 _ 8B. 45, 08
        mov     byte [eax+3H], 1                        ; 1E93 _ C6. 40, 03, 01
?_059:  mov     eax, 0                                  ; 1E97 _ B8, 00000000
        jmp     ?_067                                   ; 1E9C _ E9, 0000010F

?_060:  mov     eax, dword [ebp+8H]                     ; 1EA1 _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 1EA4 _ 0F B6. 40, 03
        cmp     al, 1                                   ; 1EA8 _ 3C, 01
        jnz     ?_062                                   ; 1EAA _ 75, 28
        movzx   eax, byte [ebp-4H]                      ; 1EAC _ 0F B6. 45, FC
        and     eax, 0C8H                               ; 1EB0 _ 25, 000000C8
        cmp     eax, 8                                  ; 1EB5 _ 83. F8, 08
        jnz     ?_061                                   ; 1EB8 _ 75, 10
        mov     eax, dword [ebp+8H]                     ; 1EBA _ 8B. 45, 08
        movzx   edx, byte [ebp-4H]                      ; 1EBD _ 0F B6. 55, FC
        mov     byte [eax], dl                          ; 1EC1 _ 88. 10
        mov     eax, dword [ebp+8H]                     ; 1EC3 _ 8B. 45, 08
        mov     byte [eax+3H], 2                        ; 1EC6 _ C6. 40, 03, 02
?_061:  mov     eax, 0                                  ; 1ECA _ B8, 00000000
        jmp     ?_067                                   ; 1ECF _ E9, 000000DC

?_062:  mov     eax, dword [ebp+8H]                     ; 1ED4 _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 1ED7 _ 0F B6. 40, 03
        cmp     al, 2                                   ; 1EDB _ 3C, 02
        jnz     ?_063                                   ; 1EDD _ 75, 1B
        mov     eax, dword [ebp+8H]                     ; 1EDF _ 8B. 45, 08
        movzx   edx, byte [ebp-4H]                      ; 1EE2 _ 0F B6. 55, FC
        mov     byte [eax+1H], dl                       ; 1EE6 _ 88. 50, 01
        mov     eax, dword [ebp+8H]                     ; 1EE9 _ 8B. 45, 08
        mov     byte [eax+3H], 3                        ; 1EEC _ C6. 40, 03, 03
        mov     eax, 0                                  ; 1EF0 _ B8, 00000000
        jmp     ?_067                                   ; 1EF5 _ E9, 000000B6

?_063:  mov     eax, dword [ebp+8H]                     ; 1EFA _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 1EFD _ 0F B6. 40, 03
        cmp     al, 3                                   ; 1F01 _ 3C, 03
        jne     ?_066                                   ; 1F03 _ 0F 85, 000000A2
        mov     eax, dword [ebp+8H]                     ; 1F09 _ 8B. 45, 08
        movzx   edx, byte [ebp-4H]                      ; 1F0C _ 0F B6. 55, FC
        mov     byte [eax+2H], dl                       ; 1F10 _ 88. 50, 02
        mov     eax, dword [ebp+8H]                     ; 1F13 _ 8B. 45, 08
        mov     byte [eax+3H], 1                        ; 1F16 _ C6. 40, 03, 01
        mov     eax, dword [ebp+8H]                     ; 1F1A _ 8B. 45, 08
        movzx   eax, byte [eax]                         ; 1F1D _ 0F B6. 00
        movzx   eax, al                                 ; 1F20 _ 0F B6. C0
        and     eax, 07H                                ; 1F23 _ 83. E0, 07
        mov     edx, eax                                ; 1F26 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 1F28 _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 1F2B _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 1F2E _ 8B. 45, 08
        movzx   eax, byte [eax+1H]                      ; 1F31 _ 0F B6. 40, 01
        movzx   edx, al                                 ; 1F35 _ 0F B6. D0
        mov     eax, dword [ebp+8H]                     ; 1F38 _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 1F3B _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1F3E _ 8B. 45, 08
        movzx   eax, byte [eax+2H]                      ; 1F41 _ 0F B6. 40, 02
        movzx   edx, al                                 ; 1F45 _ 0F B6. D0
        mov     eax, dword [ebp+8H]                     ; 1F48 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 1F4B _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 1F4E _ 8B. 45, 08
        movzx   eax, byte [eax]                         ; 1F51 _ 0F B6. 00
        movzx   eax, al                                 ; 1F54 _ 0F B6. C0
        and     eax, 10H                                ; 1F57 _ 83. E0, 10
        test    eax, eax                                ; 1F5A _ 85. C0
        jz      ?_064                                   ; 1F5C _ 74, 13
        mov     eax, dword [ebp+8H]                     ; 1F5E _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 1F61 _ 8B. 40, 04
        or      eax, 0FFFFFF00H                         ; 1F64 _ 0D, FFFFFF00
        mov     edx, eax                                ; 1F69 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 1F6B _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 1F6E _ 89. 50, 04
?_064:  mov     eax, dword [ebp+8H]                     ; 1F71 _ 8B. 45, 08
        movzx   eax, byte [eax]                         ; 1F74 _ 0F B6. 00
        movzx   eax, al                                 ; 1F77 _ 0F B6. C0
        and     eax, 20H                                ; 1F7A _ 83. E0, 20
        test    eax, eax                                ; 1F7D _ 85. C0
        jz      ?_065                                   ; 1F7F _ 74, 13
        mov     eax, dword [ebp+8H]                     ; 1F81 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 1F84 _ 8B. 40, 08
        or      eax, 0FFFFFF00H                         ; 1F87 _ 0D, FFFFFF00
        mov     edx, eax                                ; 1F8C _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 1F8E _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 1F91 _ 89. 50, 08
?_065:  mov     eax, dword [ebp+8H]                     ; 1F94 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 1F97 _ 8B. 40, 08
        neg     eax                                     ; 1F9A _ F7. D8
        mov     edx, eax                                ; 1F9C _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 1F9E _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 1FA1 _ 89. 50, 08
        mov     eax, 1                                  ; 1FA4 _ B8, 00000001
        jmp     ?_067                                   ; 1FA9 _ EB, 05

?_066:  mov     eax, 4294967295                         ; 1FAB _ B8, FFFFFFFF
?_067:  leave                                           ; 1FB0 _ C9
        ret                                             ; 1FB1 _ C3
; mouse_decode End of function

intHandlerKeyboard:; Function begin
        push    ebp                                     ; 1FB2 _ 55
        mov     ebp, esp                                ; 1FB3 _ 89. E5
        sub     esp, 40                                 ; 1FB5 _ 83. EC, 28
        mov     dword [esp+4H], 32                      ; 1FB8 _ C7. 44 24, 04, 00000020
        mov     dword [esp], 32                         ; 1FC0 _ C7. 04 24, 00000020
        call    io_out8                                 ; 1FC7 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 32                      ; 1FCC _ C7. 44 24, 04, 00000020
        mov     dword [esp], 160                        ; 1FD4 _ C7. 04 24, 000000A0
        call    io_out8                                 ; 1FDB _ E8, FFFFFFFC(rel)
        mov     dword [esp], 96                         ; 1FE0 _ C7. 04 24, 00000060
        call    io_in8                                  ; 1FE7 _ E8, FFFFFFFC(rel)
        mov     byte [ebp-9H], al                       ; 1FEC _ 88. 45, F7
        movzx   eax, byte [ebp-9H]                      ; 1FEF _ 0F B6. 45, F7
        mov     dword [esp+4H], eax                     ; 1FF3 _ 89. 44 24, 04
        mov     dword [esp], keyinfo                    ; 1FF7 _ C7. 04 24, 00000000(d)
        call    fifo8_put                               ; 1FFE _ E8, FFFFFFFC(rel)
        leave                                           ; 2003 _ C9
        ret                                             ; 2004 _ C3
; intHandlerKeyboard End of function

intHandlerMouse:; Function begin
        push    ebp                                     ; 2005 _ 55
        mov     ebp, esp                                ; 2006 _ 89. E5
        sub     esp, 40                                 ; 2008 _ 83. EC, 28
        mov     dword [esp+4H], 32                      ; 200B _ C7. 44 24, 04, 00000020
        mov     dword [esp], 32                         ; 2013 _ C7. 04 24, 00000020
        call    io_out8                                 ; 201A _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 32                      ; 201F _ C7. 44 24, 04, 00000020
        mov     dword [esp], 160                        ; 2027 _ C7. 04 24, 000000A0
        call    io_out8                                 ; 202E _ E8, FFFFFFFC(rel)
        mov     dword [esp], 96                         ; 2033 _ C7. 04 24, 00000060
        call    io_in8                                  ; 203A _ E8, FFFFFFFC(rel)
        mov     byte [ebp-9H], al                       ; 203F _ 88. 45, F7
        movzx   eax, byte [ebp-9H]                      ; 2042 _ 0F B6. 45, F7
        mov     dword [esp+4H], eax                     ; 2046 _ 89. 44 24, 04
        mov     dword [esp], mouseinfo                  ; 204A _ C7. 04 24, 00000000(d)
        call    fifo8_put                               ; 2051 _ E8, FFFFFFFC(rel)
        leave                                           ; 2056 _ C9
        ret                                             ; 2057 _ C3
; intHandlerMouse End of function

fifo8_init:; Function begin
        push    ebp                                     ; 2058 _ 55
        mov     ebp, esp                                ; 2059 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 205B _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 205E _ 8B. 55, 10
        mov     dword [eax], edx                        ; 2061 _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 2063 _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 2066 _ C7. 40, 04, 00000000
        mov     eax, dword [ebp+8H]                     ; 206D _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 2070 _ C7. 40, 08, 00000000
        mov     eax, dword [ebp+8H]                     ; 2077 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 207A _ 8B. 55, 0C
        mov     dword [eax+0CH], edx                    ; 207D _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 2080 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 2083 _ 8B. 55, 0C
        mov     dword [eax+10H], edx                    ; 2086 _ 89. 50, 10
        mov     eax, dword [ebp+8H]                     ; 2089 _ 8B. 45, 08
        mov     dword [eax+14H], 0                      ; 208C _ C7. 40, 14, 00000000
        pop     ebp                                     ; 2093 _ 5D
        ret                                             ; 2094 _ C3
; fifo8_init End of function

fifo8_put:; Function begin
        push    ebp                                     ; 2095 _ 55
        mov     ebp, esp                                ; 2096 _ 89. E5
        sub     esp, 20                                 ; 2098 _ 83. EC, 14
        mov     eax, dword [ebp+0CH]                    ; 209B _ 8B. 45, 0C
        mov     byte [ebp-14H], al                      ; 209E _ 88. 45, EC
        mov     eax, dword [ebp+8H]                     ; 20A1 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 20A4 _ 8B. 40, 10
        test    eax, eax                                ; 20A7 _ 85. C0
        jnz     ?_068                                   ; 20A9 _ 75, 18
        mov     eax, dword [ebp+8H]                     ; 20AB _ 8B. 45, 08
        mov     eax, dword [eax+14H]                    ; 20AE _ 8B. 40, 14
        or      eax, 01H                                ; 20B1 _ 83. C8, 01
        mov     edx, eax                                ; 20B4 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 20B6 _ 8B. 45, 08
        mov     dword [eax+14H], edx                    ; 20B9 _ 89. 50, 14
        mov     eax, 4294967295                         ; 20BC _ B8, FFFFFFFF
        jmp     ?_070                                   ; 20C1 _ EB, 56

?_068:  mov     eax, dword [ebp+8H]                     ; 20C3 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 20C6 _ 8B. 40, 04
        mov     dword [ebp-4H], eax                     ; 20C9 _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 20CC _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 20CF _ 8B. 10
        mov     eax, dword [ebp-4H]                     ; 20D1 _ 8B. 45, FC
        add     edx, eax                                ; 20D4 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 20D6 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 20DA _ 88. 02
        mov     eax, dword [ebp+8H]                     ; 20DC _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 20DF _ 8B. 40, 04
        lea     edx, [eax+1H]                           ; 20E2 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 20E5 _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 20E8 _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 20EB _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 20EE _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 20F1 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 20F4 _ 8B. 40, 0C
        cmp     edx, eax                                ; 20F7 _ 39. C2
        jnz     ?_069                                   ; 20F9 _ 75, 0A
        mov     eax, dword [ebp+8H]                     ; 20FB _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 20FE _ C7. 40, 04, 00000000
?_069:  mov     eax, dword [ebp+8H]                     ; 2105 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 2108 _ 8B. 40, 10
        lea     edx, [eax-1H]                           ; 210B _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 210E _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 2111 _ 89. 50, 10
        mov     eax, 0                                  ; 2114 _ B8, 00000000
?_070:  leave                                           ; 2119 _ C9
        ret                                             ; 211A _ C3
; fifo8_put End of function

fifo8_get:; Function begin
        push    ebp                                     ; 211B _ 55
        mov     ebp, esp                                ; 211C _ 89. E5
        sub     esp, 16                                 ; 211E _ 83. EC, 10
        mov     eax, dword [ebp+8H]                     ; 2121 _ 8B. 45, 08
        mov     edx, dword [eax+10H]                    ; 2124 _ 8B. 50, 10
        mov     eax, dword [ebp+8H]                     ; 2127 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 212A _ 8B. 40, 0C
        cmp     edx, eax                                ; 212D _ 39. C2
        jnz     ?_071                                   ; 212F _ 75, 11
        mov     eax, dword [ebp+8H]                     ; 2131 _ 8B. 45, 08
        mov     dword [eax+14H], 0                      ; 2134 _ C7. 40, 14, 00000000
        mov     eax, 4294967295                         ; 213B _ B8, FFFFFFFF
        jmp     ?_073                                   ; 2140 _ EB, 57

?_071:  mov     eax, dword [ebp+8H]                     ; 2142 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 2145 _ 8B. 40, 08
        mov     dword [ebp-8H], eax                     ; 2148 _ 89. 45, F8
        mov     eax, dword [ebp+8H]                     ; 214B _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 214E _ 8B. 10
        mov     eax, dword [ebp-8H]                     ; 2150 _ 8B. 45, F8
        add     eax, edx                                ; 2153 _ 01. D0
        movzx   eax, byte [eax]                         ; 2155 _ 0F B6. 00
        movzx   eax, al                                 ; 2158 _ 0F B6. C0
        mov     dword [ebp-4H], eax                     ; 215B _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 215E _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 2161 _ 8B. 40, 08
        lea     edx, [eax+1H]                           ; 2164 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 2167 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 216A _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 216D _ 8B. 45, 08
        mov     edx, dword [eax+8H]                     ; 2170 _ 8B. 50, 08
        mov     eax, dword [ebp+8H]                     ; 2173 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 2176 _ 8B. 40, 0C
        cmp     edx, eax                                ; 2179 _ 39. C2
        jnz     ?_072                                   ; 217B _ 75, 0A
        mov     eax, dword [ebp+8H]                     ; 217D _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 2180 _ C7. 40, 08, 00000000
?_072:  mov     eax, dword [ebp+8H]                     ; 2187 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 218A _ 8B. 40, 10
        lea     edx, [eax+1H]                           ; 218D _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 2190 _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 2193 _ 89. 50, 10
        mov     eax, dword [ebp-4H]                     ; 2196 _ 8B. 45, FC
?_073:  leave                                           ; 2199 _ C9
        ret                                             ; 219A _ C3
; fifo8_get End of function

fifo8_status:; Function begin
        push    ebp                                     ; 219B _ 55
        mov     ebp, esp                                ; 219C _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 219E _ 8B. 45, 08
        mov     edx, dword [eax+0CH]                    ; 21A1 _ 8B. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 21A4 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 21A7 _ 8B. 40, 10
        sub     edx, eax                                ; 21AA _ 29. C2
        mov     eax, edx                                ; 21AC _ 89. D0
        pop     ebp                                     ; 21AE _ 5D
        ret                                             ; 21AF _ C3
; fifo8_status End of function

charToHexVal:; Function begin
        push    ebp                                     ; 21B0 _ 55
        mov     ebp, esp                                ; 21B1 _ 89. E5
        sub     esp, 4                                  ; 21B3 _ 83. EC, 04
        mov     eax, dword [ebp+8H]                     ; 21B6 _ 8B. 45, 08
        mov     byte [ebp-4H], al                       ; 21B9 _ 88. 45, FC
        cmp     byte [ebp-4H], 9                        ; 21BC _ 80. 7D, FC, 09
        jle     ?_074                                   ; 21C0 _ 7E, 09
        movzx   eax, byte [ebp-4H]                      ; 21C2 _ 0F B6. 45, FC
        add     eax, 55                                 ; 21C6 _ 83. C0, 37
        jmp     ?_075                                   ; 21C9 _ EB, 07

?_074:  movzx   eax, byte [ebp-4H]                      ; 21CB _ 0F B6. 45, FC
        add     eax, 48                                 ; 21CF _ 83. C0, 30
?_075:  leave                                           ; 21D2 _ C9
        ret                                             ; 21D3 _ C3
; charToHexVal End of function

charToHexStr:; Function begin
        push    ebp                                     ; 21D4 _ 55
        mov     ebp, esp                                ; 21D5 _ 89. E5
        sub     esp, 24                                 ; 21D7 _ 83. EC, 18
        mov     eax, dword [ebp+8H]                     ; 21DA _ 8B. 45, 08
        mov     byte [ebp-14H], al                      ; 21DD _ 88. 45, EC
        mov     dword [ebp-4H], 0                       ; 21E0 _ C7. 45, FC, 00000000
        movzx   eax, byte [ebp-14H]                     ; 21E7 _ 0F B6. 45, EC
        and     eax, 0FH                                ; 21EB _ 83. E0, 0F
        mov     byte [ebp-5H], al                       ; 21EE _ 88. 45, FB
        movsx   eax, byte [ebp-5H]                      ; 21F1 _ 0F BE. 45, FB
        mov     dword [esp], eax                        ; 21F5 _ 89. 04 24
        call    charToHexVal                            ; 21F8 _ E8, FFFFFFFC(rel)
        mov     byte [?_177], al                        ; 21FD _ A2, 000002A3(d)
        movzx   eax, byte [ebp-14H]                     ; 2202 _ 0F B6. 45, EC
        shr     al, 4                                   ; 2206 _ C0. E8, 04
        mov     byte [ebp-14H], al                      ; 2209 _ 88. 45, EC
        movzx   eax, byte [ebp-14H]                     ; 220C _ 0F B6. 45, EC
        movsx   eax, al                                 ; 2210 _ 0F BE. C0
        mov     dword [esp], eax                        ; 2213 _ 89. 04 24
        call    charToHexVal                            ; 2216 _ E8, FFFFFFFC(rel)
        mov     byte [?_176], al                        ; 221B _ A2, 000002A2(d)
        mov     eax, keyval                             ; 2220 _ B8, 000002A0(d)
        leave                                           ; 2225 _ C9
        ret                                             ; 2226 _ C3
; charToHexStr End of function

intToHexStr:; Function begin
        push    ebp                                     ; 2227 _ 55
        mov     ebp, esp                                ; 2228 _ 89. E5
        sub     esp, 16                                 ; 222A _ 83. EC, 10
        mov     byte [str.1386], 48                     ; 222D _ C6. 05, 000003A0(d), 30
        mov     byte [?_206], 88                        ; 2234 _ C6. 05, 000003A1(d), 58
        mov     byte [?_207], 0                         ; 223B _ C6. 05, 000003AA(d), 00
        mov     dword [ebp-0CH], 2                      ; 2242 _ C7. 45, F4, 00000002
        jmp     ?_077                                   ; 2249 _ EB, 0F

?_076:  mov     eax, dword [ebp-0CH]                    ; 224B _ 8B. 45, F4
        add     eax, str.1386                           ; 224E _ 05, 000003A0(d)
        mov     byte [eax], 48                          ; 2253 _ C6. 00, 30
        add     dword [ebp-0CH], 1                      ; 2256 _ 83. 45, F4, 01
?_077:  cmp     dword [ebp-0CH], 9                      ; 225A _ 83. 7D, F4, 09
        jle     ?_076                                   ; 225E _ 7E, EB
        mov     dword [ebp-8H], 9                       ; 2260 _ C7. 45, F8, 00000009
        jmp     ?_081                                   ; 2267 _ EB, 40

?_078:  mov     eax, dword [ebp+8H]                     ; 2269 _ 8B. 45, 08
        and     eax, 0FH                                ; 226C _ 83. E0, 0F
        mov     dword [ebp-4H], eax                     ; 226F _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 2272 _ 8B. 45, 08
        shr     eax, 4                                  ; 2275 _ C1. E8, 04
        mov     dword [ebp+8H], eax                     ; 2278 _ 89. 45, 08
        cmp     dword [ebp-4H], 9                       ; 227B _ 83. 7D, FC, 09
        jle     ?_079                                   ; 227F _ 7E, 13
        mov     eax, dword [ebp-4H]                     ; 2281 _ 8B. 45, FC
        add     eax, 55                                 ; 2284 _ 83. C0, 37
        mov     edx, dword [ebp-8H]                     ; 2287 _ 8B. 55, F8
        add     edx, str.1386                           ; 228A _ 81. C2, 000003A0(d)
        mov     byte [edx], al                          ; 2290 _ 88. 02
        jmp     ?_080                                   ; 2292 _ EB, 11

?_079:  mov     eax, dword [ebp-4H]                     ; 2294 _ 8B. 45, FC
        add     eax, 48                                 ; 2297 _ 83. C0, 30
        mov     edx, dword [ebp-8H]                     ; 229A _ 8B. 55, F8
        add     edx, str.1386                           ; 229D _ 81. C2, 000003A0(d)
        mov     byte [edx], al                          ; 22A3 _ 88. 02
?_080:  sub     dword [ebp-8H], 1                       ; 22A5 _ 83. 6D, F8, 01
?_081:  cmp     dword [ebp-8H], 1                       ; 22A9 _ 83. 7D, F8, 01
        jle     ?_082                                   ; 22AD _ 7E, 06
        cmp     dword [ebp+8H], 0                       ; 22AF _ 83. 7D, 08, 00
        jnz     ?_078                                   ; 22B3 _ 75, B4
?_082:  mov     eax, str.1386                           ; 22B5 _ B8, 000003A0(d)
        leave                                           ; 22BA _ C9
        ret                                             ; 22BB _ C3
; intToHexStr End of function

memman_init:; Function begin
        push    ebp                                     ; 22BC _ 55
        mov     ebp, esp                                ; 22BD _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 22BF _ 8B. 45, 08
        mov     dword [eax], 0                          ; 22C2 _ C7. 00, 00000000
        mov     eax, dword [ebp+8H]                     ; 22C8 _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 22CB _ C7. 40, 04, 00000000
        mov     eax, dword [ebp+8H]                     ; 22D2 _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 22D5 _ C7. 40, 08, 00000000
        mov     eax, dword [ebp+8H]                     ; 22DC _ 8B. 45, 08
        mov     dword [eax+0CH], 0                      ; 22DF _ C7. 40, 0C, 00000000
        pop     ebp                                     ; 22E6 _ 5D
        ret                                             ; 22E7 _ C3
; memman_init End of function

memman_total:; Function begin
        push    ebp                                     ; 22E8 _ 55
        mov     ebp, esp                                ; 22E9 _ 89. E5
        sub     esp, 16                                 ; 22EB _ 83. EC, 10
        mov     dword [ebp-4H], 0                       ; 22EE _ C7. 45, FC, 00000000
        mov     dword [ebp-8H], 0                       ; 22F5 _ C7. 45, F8, 00000000
        jmp     ?_084                                   ; 22FC _ EB, 14

?_083:  mov     eax, dword [ebp+8H]                     ; 22FE _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 2301 _ 8B. 55, F8
        add     edx, 2                                  ; 2304 _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 2307 _ 8B. 44 D0, 04
        add     dword [ebp-4H], eax                     ; 230B _ 01. 45, FC
        add     dword [ebp-8H], 1                       ; 230E _ 83. 45, F8, 01
?_084:  mov     eax, dword [ebp+8H]                     ; 2312 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 2315 _ 8B. 00
        cmp     eax, dword [ebp-8H]                     ; 2317 _ 3B. 45, F8
        ja      ?_083                                   ; 231A _ 77, E2
        mov     eax, dword [ebp-4H]                     ; 231C _ 8B. 45, FC
        leave                                           ; 231F _ C9
        ret                                             ; 2320 _ C3
; memman_total End of function

memman_alloc:; Function begin
        push    ebp                                     ; 2321 _ 55
        mov     ebp, esp                                ; 2322 _ 89. E5
        sub     esp, 16                                 ; 2324 _ 83. EC, 10
        mov     dword [ebp-8H], 0                       ; 2327 _ C7. 45, F8, 00000000
        jmp     ?_088                                   ; 232E _ E9, 00000085

?_085:  mov     eax, dword [ebp+8H]                     ; 2333 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 2336 _ 8B. 55, F8
        add     edx, 2                                  ; 2339 _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 233C _ 8B. 44 D0, 04
        cmp     eax, dword [ebp+0CH]                    ; 2340 _ 3B. 45, 0C
        jc      ?_087                                   ; 2343 _ 72, 6F
        mov     eax, dword [ebp+8H]                     ; 2345 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 2348 _ 8B. 55, F8
        add     edx, 2                                  ; 234B _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 234E _ 8B. 04 D0
        mov     dword [ebp-4H], eax                     ; 2351 _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 2354 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 2357 _ 8B. 55, F8
        add     edx, 2                                  ; 235A _ 83. C2, 02
        mov     edx, dword [eax+edx*8]                  ; 235D _ 8B. 14 D0
        mov     eax, dword [ebp+0CH]                    ; 2360 _ 8B. 45, 0C
        lea     ecx, [edx+eax]                          ; 2363 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 2366 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 2369 _ 8B. 55, F8
        add     edx, 2                                  ; 236C _ 83. C2, 02
        mov     dword [eax+edx*8], ecx                  ; 236F _ 89. 0C D0
        mov     eax, dword [ebp+8H]                     ; 2372 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 2375 _ 8B. 55, F8
        add     edx, 2                                  ; 2378 _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 237B _ 8B. 44 D0, 04
        sub     eax, dword [ebp+0CH]                    ; 237F _ 2B. 45, 0C
        mov     edx, eax                                ; 2382 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 2384 _ 8B. 45, 08
        mov     ecx, dword [ebp-8H]                     ; 2387 _ 8B. 4D, F8
        add     ecx, 2                                  ; 238A _ 83. C1, 02
        mov     dword [eax+ecx*8+4H], edx               ; 238D _ 89. 54 C8, 04
        mov     eax, dword [ebp+8H]                     ; 2391 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 2394 _ 8B. 55, F8
        add     edx, 2                                  ; 2397 _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 239A _ 8B. 44 D0, 04
        test    eax, eax                                ; 239E _ 85. C0
        jnz     ?_086                                   ; 23A0 _ 75, 0D
        mov     eax, dword [ebp+8H]                     ; 23A2 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 23A5 _ 8B. 00
        lea     edx, [eax-1H]                           ; 23A7 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 23AA _ 8B. 45, 08
        mov     dword [eax], edx                        ; 23AD _ 89. 10
?_086:  mov     eax, dword [ebp-4H]                     ; 23AF _ 8B. 45, FC
        jmp     ?_089                                   ; 23B2 _ EB, 17

?_087:  add     dword [ebp-8H], 1                       ; 23B4 _ 83. 45, F8, 01
?_088:  mov     eax, dword [ebp+8H]                     ; 23B8 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 23BB _ 8B. 00
        cmp     eax, dword [ebp-8H]                     ; 23BD _ 3B. 45, F8
        ja      ?_085                                   ; 23C0 _ 0F 87, FFFFFF6D
        mov     eax, 0                                  ; 23C6 _ B8, 00000000
?_089:  leave                                           ; 23CB _ C9
        ret                                             ; 23CC _ C3
; memman_alloc End of function

memman_free:; Function begin
        push    ebp                                     ; 23CD _ 55
        mov     ebp, esp                                ; 23CE _ 89. E5
        push    ebx                                     ; 23D0 _ 53
        sub     esp, 16                                 ; 23D1 _ 83. EC, 10
        mov     dword [ebp-0CH], 0                      ; 23D4 _ C7. 45, F4, 00000000
        jmp     ?_092                                   ; 23DB _ EB, 17

?_090:  mov     eax, dword [ebp+8H]                     ; 23DD _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 23E0 _ 8B. 55, F4
        add     edx, 2                                  ; 23E3 _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 23E6 _ 8B. 04 D0
        cmp     eax, dword [ebp+0CH]                    ; 23E9 _ 3B. 45, 0C
        jbe     ?_091                                   ; 23EC _ 76, 02
        jmp     ?_093                                   ; 23EE _ EB, 0E

?_091:  add     dword [ebp-0CH], 1                      ; 23F0 _ 83. 45, F4, 01
?_092:  mov     eax, dword [ebp+8H]                     ; 23F4 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 23F7 _ 8B. 00
        cmp     eax, dword [ebp-0CH]                    ; 23F9 _ 3B. 45, F4
        jg      ?_090                                   ; 23FC _ 7F, DF
?_093:  cmp     dword [ebp-0CH], 0                      ; 23FE _ 83. 7D, F4, 00
        jle     ?_095                                   ; 2402 _ 0F 8E, 000000BA
        mov     eax, dword [ebp-0CH]                    ; 2408 _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 240B _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 240E _ 8B. 45, 08
        add     edx, 2                                  ; 2411 _ 83. C2, 02
        mov     edx, dword [eax+edx*8]                  ; 2414 _ 8B. 14 D0
        mov     eax, dword [ebp-0CH]                    ; 2417 _ 8B. 45, F4
        lea     ecx, [eax-1H]                           ; 241A _ 8D. 48, FF
        mov     eax, dword [ebp+8H]                     ; 241D _ 8B. 45, 08
        add     ecx, 2                                  ; 2420 _ 83. C1, 02
        mov     eax, dword [eax+ecx*8+4H]               ; 2423 _ 8B. 44 C8, 04
        add     eax, edx                                ; 2427 _ 01. D0
        cmp     eax, dword [ebp+0CH]                    ; 2429 _ 3B. 45, 0C
        jne     ?_095                                   ; 242C _ 0F 85, 00000090
        mov     eax, dword [ebp-0CH]                    ; 2432 _ 8B. 45, F4
        lea     ebx, [eax-1H]                           ; 2435 _ 8D. 58, FF
        mov     eax, dword [ebp-0CH]                    ; 2438 _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 243B _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 243E _ 8B. 45, 08
        add     edx, 2                                  ; 2441 _ 83. C2, 02
        mov     edx, dword [eax+edx*8+4H]               ; 2444 _ 8B. 54 D0, 04
        mov     eax, dword [ebp+10H]                    ; 2448 _ 8B. 45, 10
        lea     ecx, [edx+eax]                          ; 244B _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 244E _ 8B. 45, 08
        lea     edx, [ebx+2H]                           ; 2451 _ 8D. 53, 02
        mov     dword [eax+edx*8+4H], ecx               ; 2454 _ 89. 4C D0, 04
        mov     eax, dword [ebp+8H]                     ; 2458 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 245B _ 8B. 00
        cmp     eax, dword [ebp-0CH]                    ; 245D _ 3B. 45, F4
        jle     ?_094                                   ; 2460 _ 7E, 56
        mov     eax, dword [ebp+10H]                    ; 2462 _ 8B. 45, 10
        mov     edx, dword [ebp+0CH]                    ; 2465 _ 8B. 55, 0C
        lea     ecx, [edx+eax]                          ; 2468 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 246B _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 246E _ 8B. 55, F4
        add     edx, 2                                  ; 2471 _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 2474 _ 8B. 04 D0
        cmp     ecx, eax                                ; 2477 _ 39. C1
        jnz     ?_094                                   ; 2479 _ 75, 3D
        mov     eax, dword [ebp-0CH]                    ; 247B _ 8B. 45, F4
        lea     ebx, [eax-1H]                           ; 247E _ 8D. 58, FF
        mov     eax, dword [ebp-0CH]                    ; 2481 _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 2484 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 2487 _ 8B. 45, 08
        add     edx, 2                                  ; 248A _ 83. C2, 02
        mov     edx, dword [eax+edx*8+4H]               ; 248D _ 8B. 54 D0, 04
        mov     eax, dword [ebp+8H]                     ; 2491 _ 8B. 45, 08
        mov     ecx, dword [ebp-0CH]                    ; 2494 _ 8B. 4D, F4
        add     ecx, 2                                  ; 2497 _ 83. C1, 02
        mov     eax, dword [eax+ecx*8+4H]               ; 249A _ 8B. 44 C8, 04
        lea     ecx, [edx+eax]                          ; 249E _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 24A1 _ 8B. 45, 08
        lea     edx, [ebx+2H]                           ; 24A4 _ 8D. 53, 02
        mov     dword [eax+edx*8+4H], ecx               ; 24A7 _ 89. 4C D0, 04
        mov     eax, dword [ebp+8H]                     ; 24AB _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 24AE _ 8B. 00
        lea     edx, [eax-1H]                           ; 24B0 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 24B3 _ 8B. 45, 08
        mov     dword [eax], edx                        ; 24B6 _ 89. 10
?_094:  mov     eax, 0                                  ; 24B8 _ B8, 00000000
        jmp     ?_101                                   ; 24BD _ E9, 0000011C

?_095:  mov     eax, dword [ebp+8H]                     ; 24C2 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 24C5 _ 8B. 00
        cmp     eax, dword [ebp-0CH]                    ; 24C7 _ 3B. 45, F4
        jle     ?_096                                   ; 24CA _ 7E, 52
        mov     eax, dword [ebp+10H]                    ; 24CC _ 8B. 45, 10
        mov     edx, dword [ebp+0CH]                    ; 24CF _ 8B. 55, 0C
        lea     ecx, [edx+eax]                          ; 24D2 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 24D5 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 24D8 _ 8B. 55, F4
        add     edx, 2                                  ; 24DB _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 24DE _ 8B. 04 D0
        cmp     ecx, eax                                ; 24E1 _ 39. C1
        jnz     ?_096                                   ; 24E3 _ 75, 39
        mov     eax, dword [ebp+8H]                     ; 24E5 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 24E8 _ 8B. 55, F4
        lea     ecx, [edx+2H]                           ; 24EB _ 8D. 4A, 02
        mov     edx, dword [ebp+0CH]                    ; 24EE _ 8B. 55, 0C
        mov     dword [eax+ecx*8], edx                  ; 24F1 _ 89. 14 C8
        mov     eax, dword [ebp+8H]                     ; 24F4 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 24F7 _ 8B. 55, F4
        add     edx, 2                                  ; 24FA _ 83. C2, 02
        mov     edx, dword [eax+edx*8+4H]               ; 24FD _ 8B. 54 D0, 04
        mov     eax, dword [ebp+10H]                    ; 2501 _ 8B. 45, 10
        lea     ecx, [edx+eax]                          ; 2504 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 2507 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 250A _ 8B. 55, F4
        add     edx, 2                                  ; 250D _ 83. C2, 02
        mov     dword [eax+edx*8+4H], ecx               ; 2510 _ 89. 4C D0, 04
        mov     eax, 0                                  ; 2514 _ B8, 00000000
        jmp     ?_101                                   ; 2519 _ E9, 000000C0

?_096:  mov     eax, dword [ebp+8H]                     ; 251E _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 2521 _ 8B. 00
        cmp     eax, 4095                               ; 2523 _ 3D, 00000FFF
        jg      ?_100                                   ; 2528 _ 0F 8F, 00000087
        mov     eax, dword [ebp+8H]                     ; 252E _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 2531 _ 8B. 00
        mov     dword [ebp-8H], eax                     ; 2533 _ 89. 45, F8
        jmp     ?_098                                   ; 2536 _ EB, 28

?_097:  mov     eax, dword [ebp-8H]                     ; 2538 _ 8B. 45, F8
        lea     edx, [eax-1H]                           ; 253B _ 8D. 50, FF
        mov     ecx, dword [ebp+8H]                     ; 253E _ 8B. 4D, 08
        mov     eax, dword [ebp-8H]                     ; 2541 _ 8B. 45, F8
        lea     ebx, [eax+2H]                           ; 2544 _ 8D. 58, 02
        mov     eax, dword [ebp+8H]                     ; 2547 _ 8B. 45, 08
        add     edx, 2                                  ; 254A _ 83. C2, 02
        lea     edx, [eax+edx*8]                        ; 254D _ 8D. 14 D0
        mov     eax, dword [edx]                        ; 2550 _ 8B. 02
        mov     edx, dword [edx+4H]                     ; 2552 _ 8B. 52, 04
        mov     dword [ecx+ebx*8], eax                  ; 2555 _ 89. 04 D9
        mov     dword [ecx+ebx*8+4H], edx               ; 2558 _ 89. 54 D9, 04
        sub     dword [ebp-8H], 1                       ; 255C _ 83. 6D, F8, 01
?_098:  mov     eax, dword [ebp-8H]                     ; 2560 _ 8B. 45, F8
        cmp     eax, dword [ebp-0CH]                    ; 2563 _ 3B. 45, F4
        jg      ?_097                                   ; 2566 _ 7F, D0
        mov     eax, dword [ebp+8H]                     ; 2568 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 256B _ 8B. 00
        lea     edx, [eax+1H]                           ; 256D _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 2570 _ 8B. 45, 08
        mov     dword [eax], edx                        ; 2573 _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 2575 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 2578 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 257B _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 257E _ 8B. 00
        cmp     edx, eax                                ; 2580 _ 39. C2
        jge     ?_099                                   ; 2582 _ 7D, 0B
        mov     eax, dword [ebp+8H]                     ; 2584 _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 2587 _ 8B. 10
        mov     eax, dword [ebp+8H]                     ; 2589 _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 258C _ 89. 50, 04
?_099:  mov     eax, dword [ebp+8H]                     ; 258F _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 2592 _ 8B. 55, F4
        lea     ecx, [edx+2H]                           ; 2595 _ 8D. 4A, 02
        mov     edx, dword [ebp+0CH]                    ; 2598 _ 8B. 55, 0C
        mov     dword [eax+ecx*8], edx                  ; 259B _ 89. 14 C8
        mov     eax, dword [ebp+8H]                     ; 259E _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 25A1 _ 8B. 55, F4
        lea     ecx, [edx+2H]                           ; 25A4 _ 8D. 4A, 02
        mov     edx, dword [ebp+10H]                    ; 25A7 _ 8B. 55, 10
        mov     dword [eax+ecx*8+4H], edx               ; 25AA _ 89. 54 C8, 04
        mov     eax, 0                                  ; 25AE _ B8, 00000000
        jmp     ?_101                                   ; 25B3 _ EB, 29

?_100:  mov     eax, dword [ebp+8H]                     ; 25B5 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 25B8 _ 8B. 40, 0C
        lea     edx, [eax+1H]                           ; 25BB _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 25BE _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 25C1 _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 25C4 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 25C7 _ 8B. 40, 08
        mov     edx, eax                                ; 25CA _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 25CC _ 8B. 45, 10
        add     eax, edx                                ; 25CF _ 01. D0
        mov     edx, eax                                ; 25D1 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 25D3 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 25D6 _ 89. 50, 08
        mov     eax, 4294967295                         ; 25D9 _ B8, FFFFFFFF
?_101:  add     esp, 16                                 ; 25DE _ 83. C4, 10
        pop     ebx                                     ; 25E1 _ 5B
        pop     ebp                                     ; 25E2 _ 5D
        ret                                             ; 25E3 _ C3
; memman_free End of function

memman_alloc_4k:; Function begin
        push    ebp                                     ; 25E4 _ 55
        mov     ebp, esp                                ; 25E5 _ 89. E5
        sub     esp, 24                                 ; 25E7 _ 83. EC, 18
        mov     eax, dword [ebp+0CH]                    ; 25EA _ 8B. 45, 0C
        add     eax, 4095                               ; 25ED _ 05, 00000FFF
        and     eax, 0FFFFF000H                         ; 25F2 _ 25, FFFFF000
        mov     dword [ebp+0CH], eax                    ; 25F7 _ 89. 45, 0C
        mov     eax, dword [ebp+0CH]                    ; 25FA _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 25FD _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2601 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2604 _ 89. 04 24
        call    memman_alloc                            ; 2607 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-4H], eax                     ; 260C _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 260F _ 8B. 45, FC
        leave                                           ; 2612 _ C9
        ret                                             ; 2613 _ C3
; memman_alloc_4k End of function

memman_free_4k:; Function begin
        push    ebp                                     ; 2614 _ 55
        mov     ebp, esp                                ; 2615 _ 89. E5
        sub     esp, 28                                 ; 2617 _ 83. EC, 1C
        mov     eax, dword [ebp+10H]                    ; 261A _ 8B. 45, 10
        add     eax, 4095                               ; 261D _ 05, 00000FFF
        and     eax, 0FFFFF000H                         ; 2622 _ 25, FFFFF000
        mov     dword [ebp+10H], eax                    ; 2627 _ 89. 45, 10
        mov     eax, dword [ebp+10H]                    ; 262A _ 8B. 45, 10
        mov     dword [esp+8H], eax                     ; 262D _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 2631 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 2634 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2638 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 263B _ 89. 04 24
        call    memman_free                             ; 263E _ E8, FFFFFFFC(rel)
        mov     dword [ebp-4H], eax                     ; 2643 _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 2646 _ 8B. 45, FC
        leave                                           ; 2649 _ C9
        ret                                             ; 264A _ C3
; memman_free_4k End of function

sheet_control_init:; Function begin
        push    ebp                                     ; 264B _ 55
        mov     ebp, esp                                ; 264C _ 89. E5
        sub     esp, 40                                 ; 264E _ 83. EC, 28
        mov     dword [esp+4H], 9236                    ; 2651 _ C7. 44 24, 04, 00002414
        mov     eax, dword [ebp+8H]                     ; 2659 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 265C _ 89. 04 24
        call    memman_alloc_4k                         ; 265F _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 2664 _ 89. 45, F4
        cmp     dword [ebp-0CH], 0                      ; 2667 _ 83. 7D, F4, 00
        jnz     ?_102                                   ; 266B _ 75, 24
        mov     eax, dword [ebp-0CH]                    ; 266D _ 8B. 45, F4
        mov     dword [esp+8H], 9236                    ; 2670 _ C7. 44 24, 08, 00002414
        mov     dword [esp+4H], eax                     ; 2678 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 267C _ 8B. 45, 08
        mov     dword [esp], eax                        ; 267F _ 89. 04 24
        call    memman_free_4k                          ; 2682 _ E8, FFFFFFFC(rel)
        mov     eax, 0                                  ; 2687 _ B8, 00000000
        jmp     ?_106                                   ; 268C _ E9, 0000009D

?_102:  mov     eax, dword [ebp-0CH]                    ; 2691 _ 8B. 45, F4
        mov     edx, dword [ebp+0CH]                    ; 2694 _ 8B. 55, 0C
        mov     dword [eax], edx                        ; 2697 _ 89. 10
        mov     eax, dword [ebp-0CH]                    ; 2699 _ 8B. 45, F4
        mov     edx, dword [ebp+10H]                    ; 269C _ 8B. 55, 10
        mov     dword [eax+4H], edx                     ; 269F _ 89. 50, 04
        mov     eax, dword [ebp-0CH]                    ; 26A2 _ 8B. 45, F4
        mov     edx, dword [ebp+14H]                    ; 26A5 _ 8B. 55, 14
        mov     dword [eax+8H], edx                     ; 26A8 _ 89. 50, 08
        mov     eax, dword [ebp-0CH]                    ; 26AB _ 8B. 45, F4
        mov     dword [eax+0CH], -1                     ; 26AE _ C7. 40, 0C, FFFFFFFF
        mov     dword [ebp-10H], 0                      ; 26B5 _ C7. 45, F0, 00000000
        jmp     ?_104                                   ; 26BC _ EB, 1B

?_103:  mov     eax, dword [ebp-0CH]                    ; 26BE _ 8B. 45, F4
        mov     edx, dword [ebp-10H]                    ; 26C1 _ 8B. 55, F0
        add     edx, 33                                 ; 26C4 _ 83. C2, 21
        shl     edx, 5                                  ; 26C7 _ C1. E2, 05
        add     eax, edx                                ; 26CA _ 01. D0
        add     eax, 16                                 ; 26CC _ 83. C0, 10
        mov     dword [eax], 0                          ; 26CF _ C7. 00, 00000000
        add     dword [ebp-10H], 1                      ; 26D5 _ 83. 45, F0, 01
?_104:  cmp     dword [ebp-10H], 255                    ; 26D9 _ 81. 7D, F0, 000000FF
        jle     ?_103                                   ; 26E0 _ 7E, DC
        mov     eax, dword [ebp+10H]                    ; 26E2 _ 8B. 45, 10
        imul    eax, dword [ebp+14H]                    ; 26E5 _ 0F AF. 45, 14
        mov     dword [esp+4H], eax                     ; 26E9 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 26ED _ 8B. 45, 08
        mov     dword [esp], eax                        ; 26F0 _ 89. 04 24
        call    memman_alloc_4k                         ; 26F3 _ E8, FFFFFFFC(rel)
        mov     edx, eax                                ; 26F8 _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 26FA _ 8B. 45, F4
        mov     dword [eax+10H], edx                    ; 26FD _ 89. 50, 10
        mov     eax, dword [ebp-0CH]                    ; 2700 _ 8B. 45, F4
        mov     eax, dword [eax+10H]                    ; 2703 _ 8B. 40, 10
        test    eax, eax                                ; 2706 _ 85. C0
        jnz     ?_105                                   ; 2708 _ 75, 21
        mov     eax, dword [ebp-0CH]                    ; 270A _ 8B. 45, F4
        mov     dword [esp+8H], 9236                    ; 270D _ C7. 44 24, 08, 00002414
        mov     dword [esp+4H], eax                     ; 2715 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2719 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 271C _ 89. 04 24
        call    memman_free_4k                          ; 271F _ E8, FFFFFFFC(rel)
        mov     eax, 0                                  ; 2724 _ B8, 00000000
        jmp     ?_106                                   ; 2729 _ EB, 03

?_105:  mov     eax, dword [ebp-0CH]                    ; 272B _ 8B. 45, F4
?_106:  leave                                           ; 272E _ C9
        ret                                             ; 272F _ C3
; sheet_control_init End of function

sheet_alloc:; Function begin
        push    ebp                                     ; 2730 _ 55
        mov     ebp, esp                                ; 2731 _ 89. E5
        sub     esp, 16                                 ; 2733 _ 83. EC, 10
        mov     dword [ebp-8H], 0                       ; 2736 _ C7. 45, F8, 00000000
        jmp     ?_109                                   ; 273D _ EB, 5B

?_107:  mov     eax, dword [ebp+8H]                     ; 273F _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 2742 _ 8B. 55, F8
        add     edx, 33                                 ; 2745 _ 83. C2, 21
        shl     edx, 5                                  ; 2748 _ C1. E2, 05
        add     eax, edx                                ; 274B _ 01. D0
        add     eax, 16                                 ; 274D _ 83. C0, 10
        mov     eax, dword [eax]                        ; 2750 _ 8B. 00
        test    eax, eax                                ; 2752 _ 85. C0
        jnz     ?_108                                   ; 2754 _ 75, 40
        mov     eax, dword [ebp-8H]                     ; 2756 _ 8B. 45, F8
        shl     eax, 5                                  ; 2759 _ C1. E0, 05
        lea     edx, [eax+410H]                         ; 275C _ 8D. 90, 00000410
        mov     eax, dword [ebp+8H]                     ; 2762 _ 8B. 45, 08
        add     eax, edx                                ; 2765 _ 01. D0
        add     eax, 4                                  ; 2767 _ 83. C0, 04
        mov     dword [ebp-4H], eax                     ; 276A _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 276D _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 2770 _ 8B. 55, F8
        lea     ecx, [edx+4H]                           ; 2773 _ 8D. 4A, 04
        mov     edx, dword [ebp-4H]                     ; 2776 _ 8B. 55, FC
        mov     dword [eax+ecx*4+4H], edx               ; 2779 _ 89. 54 88, 04
        mov     eax, dword [ebp-4H]                     ; 277D _ 8B. 45, FC
        mov     dword [eax+1CH], 1                      ; 2780 _ C7. 40, 1C, 00000001
        mov     eax, dword [ebp-4H]                     ; 2787 _ 8B. 45, FC
        mov     dword [eax+18H], -1                     ; 278A _ C7. 40, 18, FFFFFFFF
        mov     eax, dword [ebp-4H]                     ; 2791 _ 8B. 45, FC
        jmp     ?_110                                   ; 2794 _ EB, 12

?_108:  add     dword [ebp-8H], 1                       ; 2796 _ 83. 45, F8, 01
?_109:  cmp     dword [ebp-8H], 255                     ; 279A _ 81. 7D, F8, 000000FF
        jle     ?_107                                   ; 27A1 _ 7E, 9C
        mov     eax, 0                                  ; 27A3 _ B8, 00000000
?_110:  leave                                           ; 27A8 _ C9
        ret                                             ; 27A9 _ C3
; sheet_alloc End of function

sheet_setbuf:; Function begin
        push    ebp                                     ; 27AA _ 55
        mov     ebp, esp                                ; 27AB _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 27AD _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 27B0 _ 8B. 55, 0C
        mov     dword [eax], edx                        ; 27B3 _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 27B5 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 27B8 _ 8B. 55, 10
        mov     dword [eax+4H], edx                     ; 27BB _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 27BE _ 8B. 45, 08
        mov     edx, dword [ebp+14H]                    ; 27C1 _ 8B. 55, 14
        mov     dword [eax+8H], edx                     ; 27C4 _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 27C7 _ 8B. 45, 08
        mov     edx, dword [ebp+18H]                    ; 27CA _ 8B. 55, 18
        mov     dword [eax+14H], edx                    ; 27CD _ 89. 50, 14
        pop     ebp                                     ; 27D0 _ 5D
        ret                                             ; 27D1 _ C3
; sheet_setbuf End of function

sheet_updown:; Function begin
        push    ebp                                     ; 27D2 _ 55
        mov     ebp, esp                                ; 27D3 _ 89. E5
        push    esi                                     ; 27D5 _ 56
        push    ebx                                     ; 27D6 _ 53
        sub     esp, 48                                 ; 27D7 _ 83. EC, 30
        mov     eax, dword [ebp+0CH]                    ; 27DA _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 27DD _ 8B. 40, 18
        mov     dword [ebp-0CH], eax                    ; 27E0 _ 89. 45, F4
        mov     eax, dword [ebp+8H]                     ; 27E3 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 27E6 _ 8B. 40, 0C
        add     eax, 1                                  ; 27E9 _ 83. C0, 01
        cmp     eax, dword [ebp+10H]                    ; 27EC _ 3B. 45, 10
        jge     ?_111                                   ; 27EF _ 7D, 0C
        mov     eax, dword [ebp+8H]                     ; 27F1 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 27F4 _ 8B. 40, 0C
        add     eax, 1                                  ; 27F7 _ 83. C0, 01
        mov     dword [ebp+10H], eax                    ; 27FA _ 89. 45, 10
?_111:  cmp     dword [ebp+10H], -1                     ; 27FD _ 83. 7D, 10, FF
        jge     ?_112                                   ; 2801 _ 7D, 07
        mov     dword [ebp+10H], -1                     ; 2803 _ C7. 45, 10, FFFFFFFF
?_112:  mov     eax, dword [ebp+0CH]                    ; 280A _ 8B. 45, 0C
        mov     edx, dword [ebp+10H]                    ; 280D _ 8B. 55, 10
        mov     dword [eax+18H], edx                    ; 2810 _ 89. 50, 18
        mov     eax, dword [ebp-0CH]                    ; 2813 _ 8B. 45, F4
        cmp     eax, dword [ebp+10H]                    ; 2816 _ 3B. 45, 10
        jle     ?_119                                   ; 2819 _ 0F 8E, 00000201
        cmp     dword [ebp+10H], 0                      ; 281F _ 83. 7D, 10, 00
        js      ?_115                                   ; 2823 _ 0F 88, 000000F7
        mov     eax, dword [ebp-0CH]                    ; 2829 _ 8B. 45, F4
        mov     dword [ebp-10H], eax                    ; 282C _ 89. 45, F0
        jmp     ?_114                                   ; 282F _ EB, 34

?_113:  mov     eax, dword [ebp-10H]                    ; 2831 _ 8B. 45, F0
        lea     edx, [eax-1H]                           ; 2834 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 2837 _ 8B. 45, 08
        add     edx, 4                                  ; 283A _ 83. C2, 04
        mov     edx, dword [eax+edx*4+4H]               ; 283D _ 8B. 54 90, 04
        mov     eax, dword [ebp+8H]                     ; 2841 _ 8B. 45, 08
        mov     ecx, dword [ebp-10H]                    ; 2844 _ 8B. 4D, F0
        add     ecx, 4                                  ; 2847 _ 83. C1, 04
        mov     dword [eax+ecx*4+4H], edx               ; 284A _ 89. 54 88, 04
        mov     eax, dword [ebp+8H]                     ; 284E _ 8B. 45, 08
        mov     edx, dword [ebp-10H]                    ; 2851 _ 8B. 55, F0
        add     edx, 4                                  ; 2854 _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 2857 _ 8B. 44 90, 04
        mov     edx, dword [ebp-10H]                    ; 285B _ 8B. 55, F0
        mov     dword [eax+18H], edx                    ; 285E _ 89. 50, 18
        sub     dword [ebp-10H], 1                      ; 2861 _ 83. 6D, F0, 01
?_114:  mov     eax, dword [ebp-10H]                    ; 2865 _ 8B. 45, F0
        cmp     eax, dword [ebp+10H]                    ; 2868 _ 3B. 45, 10
        jg      ?_113                                   ; 286B _ 7F, C4
        mov     eax, dword [ebp+8H]                     ; 286D _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 2870 _ 8B. 55, 10
        lea     ecx, [edx+4H]                           ; 2873 _ 8D. 4A, 04
        mov     edx, dword [ebp+0CH]                    ; 2876 _ 8B. 55, 0C
        mov     dword [eax+ecx*4+4H], edx               ; 2879 _ 89. 54 88, 04
        mov     eax, dword [ebp+10H]                    ; 287D _ 8B. 45, 10
        lea     esi, [eax+1H]                           ; 2880 _ 8D. 70, 01
        mov     eax, dword [ebp+0CH]                    ; 2883 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 2886 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 2889 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 288C _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 288F _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 2892 _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 2895 _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 2898 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 289B _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 289E _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 28A1 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 28A4 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 28A7 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 28AA _ 8B. 40, 0C
        mov     dword [esp+14H], esi                    ; 28AD _ 89. 74 24, 14
        mov     dword [esp+10H], ebx                    ; 28B1 _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 28B5 _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 28B9 _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 28BD _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 28C1 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 28C4 _ 89. 04 24
        call    sheet_refresh_map                       ; 28C7 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 28CC _ 8B. 45, 10
        lea     esi, [eax+1H]                           ; 28CF _ 8D. 70, 01
        mov     eax, dword [ebp+0CH]                    ; 28D2 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 28D5 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 28D8 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 28DB _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 28DE _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 28E1 _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 28E4 _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 28E7 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 28EA _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 28ED _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 28F0 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 28F3 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 28F6 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 28F9 _ 8B. 40, 0C
        mov     dword [esp+14H], esi                    ; 28FC _ 89. 74 24, 14
        mov     dword [esp+10H], ebx                    ; 2900 _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 2904 _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 2908 _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 290C _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2910 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2913 _ 89. 04 24
        call    sheet_refresh_local                     ; 2916 _ E8, FFFFFFFC(rel)
        jmp     ?_126                                   ; 291B _ E9, 0000026C

?_115:  mov     eax, dword [ebp+8H]                     ; 2920 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 2923 _ 8B. 40, 0C
        cmp     eax, dword [ebp-0CH]                    ; 2926 _ 3B. 45, F4
        jle     ?_118                                   ; 2929 _ 7E, 47
        mov     eax, dword [ebp-0CH]                    ; 292B _ 8B. 45, F4
        mov     dword [ebp-10H], eax                    ; 292E _ 89. 45, F0
        jmp     ?_117                                   ; 2931 _ EB, 34

?_116:  mov     eax, dword [ebp-10H]                    ; 2933 _ 8B. 45, F0
        lea     edx, [eax+1H]                           ; 2936 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 2939 _ 8B. 45, 08
        add     edx, 4                                  ; 293C _ 83. C2, 04
        mov     edx, dword [eax+edx*4+4H]               ; 293F _ 8B. 54 90, 04
        mov     eax, dword [ebp+8H]                     ; 2943 _ 8B. 45, 08
        mov     ecx, dword [ebp-10H]                    ; 2946 _ 8B. 4D, F0
        add     ecx, 4                                  ; 2949 _ 83. C1, 04
        mov     dword [eax+ecx*4+4H], edx               ; 294C _ 89. 54 88, 04
        mov     eax, dword [ebp+8H]                     ; 2950 _ 8B. 45, 08
        mov     edx, dword [ebp-10H]                    ; 2953 _ 8B. 55, F0
        add     edx, 4                                  ; 2956 _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 2959 _ 8B. 44 90, 04
        mov     edx, dword [ebp-10H]                    ; 295D _ 8B. 55, F0
        mov     dword [eax+18H], edx                    ; 2960 _ 89. 50, 18
        add     dword [ebp-10H], 1                      ; 2963 _ 83. 45, F0, 01
?_117:  mov     eax, dword [ebp+8H]                     ; 2967 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 296A _ 8B. 40, 0C
        cmp     eax, dword [ebp-10H]                    ; 296D _ 3B. 45, F0
        jg      ?_116                                   ; 2970 _ 7F, C1
?_118:  mov     eax, dword [ebp+8H]                     ; 2972 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 2975 _ 8B. 40, 0C
        lea     edx, [eax-1H]                           ; 2978 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 297B _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 297E _ 89. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 2981 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 2984 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 2987 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 298A _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 298D _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 2990 _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 2993 _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 2996 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 2999 _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 299C _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 299F _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 29A2 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 29A5 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 29A8 _ 8B. 40, 0C
        mov     dword [esp+14H], 0                      ; 29AB _ C7. 44 24, 14, 00000000
        mov     dword [esp+10H], ebx                    ; 29B3 _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 29B7 _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 29BB _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 29BF _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 29C3 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 29C6 _ 89. 04 24
        call    sheet_refresh_map                       ; 29C9 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+0CH]                    ; 29CE _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 29D1 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 29D4 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 29D7 _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 29DA _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 29DD _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 29E0 _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 29E3 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 29E6 _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 29E9 _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 29EC _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 29EF _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 29F2 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 29F5 _ 8B. 40, 0C
        mov     dword [esp+14H], 0                      ; 29F8 _ C7. 44 24, 14, 00000000
        mov     dword [esp+10H], ebx                    ; 2A00 _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 2A04 _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 2A08 _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 2A0C _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2A10 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2A13 _ 89. 04 24
        call    sheet_refresh_local                     ; 2A16 _ E8, FFFFFFFC(rel)
        jmp     ?_126                                   ; 2A1B _ E9, 0000016C

?_119:  mov     eax, dword [ebp-0CH]                    ; 2A20 _ 8B. 45, F4
        cmp     eax, dword [ebp+10H]                    ; 2A23 _ 3B. 45, 10
        jge     ?_126                                   ; 2A26 _ 0F 8D, 00000160
        cmp     dword [ebp-0CH], 0                      ; 2A2C _ 83. 7D, F4, 00
        js      ?_122                                   ; 2A30 _ 78, 56
        mov     eax, dword [ebp-0CH]                    ; 2A32 _ 8B. 45, F4
        mov     dword [ebp-10H], eax                    ; 2A35 _ 89. 45, F0
        jmp     ?_121                                   ; 2A38 _ EB, 34

?_120:  mov     eax, dword [ebp-10H]                    ; 2A3A _ 8B. 45, F0
        lea     edx, [eax+1H]                           ; 2A3D _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 2A40 _ 8B. 45, 08
        add     edx, 4                                  ; 2A43 _ 83. C2, 04
        mov     edx, dword [eax+edx*4+4H]               ; 2A46 _ 8B. 54 90, 04
        mov     eax, dword [ebp+8H]                     ; 2A4A _ 8B. 45, 08
        mov     ecx, dword [ebp-10H]                    ; 2A4D _ 8B. 4D, F0
        add     ecx, 4                                  ; 2A50 _ 83. C1, 04
        mov     dword [eax+ecx*4+4H], edx               ; 2A53 _ 89. 54 88, 04
        mov     eax, dword [ebp+8H]                     ; 2A57 _ 8B. 45, 08
        mov     edx, dword [ebp-10H]                    ; 2A5A _ 8B. 55, F0
        add     edx, 4                                  ; 2A5D _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 2A60 _ 8B. 44 90, 04
        mov     edx, dword [ebp-10H]                    ; 2A64 _ 8B. 55, F0
        mov     dword [eax+18H], edx                    ; 2A67 _ 89. 50, 18
        add     dword [ebp-10H], 1                      ; 2A6A _ 83. 45, F0, 01
?_121:  mov     eax, dword [ebp-10H]                    ; 2A6E _ 8B. 45, F0
        cmp     eax, dword [ebp+10H]                    ; 2A71 _ 3B. 45, 10
        jl      ?_120                                   ; 2A74 _ 7C, C4
        mov     eax, dword [ebp+8H]                     ; 2A76 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 2A79 _ 8B. 55, 10
        lea     ecx, [edx+4H]                           ; 2A7C _ 8D. 4A, 04
        mov     edx, dword [ebp+0CH]                    ; 2A7F _ 8B. 55, 0C
        mov     dword [eax+ecx*4+4H], edx               ; 2A82 _ 89. 54 88, 04
        jmp     ?_125                                   ; 2A86 _ EB, 6C

?_122:  mov     eax, dword [ebp+8H]                     ; 2A88 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 2A8B _ 8B. 40, 0C
        mov     dword [ebp-10H], eax                    ; 2A8E _ 89. 45, F0
        jmp     ?_124                                   ; 2A91 _ EB, 3A

?_123:  mov     eax, dword [ebp-10H]                    ; 2A93 _ 8B. 45, F0
        lea     ecx, [eax+1H]                           ; 2A96 _ 8D. 48, 01
        mov     eax, dword [ebp+8H]                     ; 2A99 _ 8B. 45, 08
        mov     edx, dword [ebp-10H]                    ; 2A9C _ 8B. 55, F0
        add     edx, 4                                  ; 2A9F _ 83. C2, 04
        mov     edx, dword [eax+edx*4+4H]               ; 2AA2 _ 8B. 54 90, 04
        mov     eax, dword [ebp+8H]                     ; 2AA6 _ 8B. 45, 08
        add     ecx, 4                                  ; 2AA9 _ 83. C1, 04
        mov     dword [eax+ecx*4+4H], edx               ; 2AAC _ 89. 54 88, 04
        mov     eax, dword [ebp-10H]                    ; 2AB0 _ 8B. 45, F0
        lea     edx, [eax+1H]                           ; 2AB3 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 2AB6 _ 8B. 45, 08
        add     edx, 4                                  ; 2AB9 _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 2ABC _ 8B. 44 90, 04
        mov     edx, dword [ebp-10H]                    ; 2AC0 _ 8B. 55, F0
        add     edx, 1                                  ; 2AC3 _ 83. C2, 01
        mov     dword [eax+18H], edx                    ; 2AC6 _ 89. 50, 18
        sub     dword [ebp-10H], 1                      ; 2AC9 _ 83. 6D, F0, 01
?_124:  mov     eax, dword [ebp-10H]                    ; 2ACD _ 8B. 45, F0
        cmp     eax, dword [ebp+10H]                    ; 2AD0 _ 3B. 45, 10
        jge     ?_123                                   ; 2AD3 _ 7D, BE
        mov     eax, dword [ebp+8H]                     ; 2AD5 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 2AD8 _ 8B. 55, 10
        lea     ecx, [edx+4H]                           ; 2ADB _ 8D. 4A, 04
        mov     edx, dword [ebp+0CH]                    ; 2ADE _ 8B. 55, 0C
        mov     dword [eax+ecx*4+4H], edx               ; 2AE1 _ 89. 54 88, 04
        mov     eax, dword [ebp+8H]                     ; 2AE5 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 2AE8 _ 8B. 40, 0C
        lea     edx, [eax+1H]                           ; 2AEB _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 2AEE _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 2AF1 _ 89. 50, 0C
?_125:  mov     eax, dword [ebp+0CH]                    ; 2AF4 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 2AF7 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 2AFA _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 2AFD _ 8B. 40, 08
        lea     esi, [edx+eax]                          ; 2B00 _ 8D. 34 02
        mov     eax, dword [ebp+0CH]                    ; 2B03 _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 2B06 _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 2B09 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 2B0C _ 8B. 40, 04
        lea     ebx, [edx+eax]                          ; 2B0F _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 2B12 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 2B15 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 2B18 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 2B1B _ 8B. 40, 0C
        mov     ecx, dword [ebp+10H]                    ; 2B1E _ 8B. 4D, 10
        mov     dword [esp+14H], ecx                    ; 2B21 _ 89. 4C 24, 14
        mov     dword [esp+10H], esi                    ; 2B25 _ 89. 74 24, 10
        mov     dword [esp+0CH], ebx                    ; 2B29 _ 89. 5C 24, 0C
        mov     dword [esp+8H], edx                     ; 2B2D _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 2B31 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2B35 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2B38 _ 89. 04 24
        call    sheet_refresh_map                       ; 2B3B _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+0CH]                    ; 2B40 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 2B43 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 2B46 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 2B49 _ 8B. 40, 08
        lea     esi, [edx+eax]                          ; 2B4C _ 8D. 34 02
        mov     eax, dword [ebp+0CH]                    ; 2B4F _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 2B52 _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 2B55 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 2B58 _ 8B. 40, 04
        lea     ebx, [edx+eax]                          ; 2B5B _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 2B5E _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 2B61 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 2B64 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 2B67 _ 8B. 40, 0C
        mov     ecx, dword [ebp+10H]                    ; 2B6A _ 8B. 4D, 10
        mov     dword [esp+14H], ecx                    ; 2B6D _ 89. 4C 24, 14
        mov     dword [esp+10H], esi                    ; 2B71 _ 89. 74 24, 10
        mov     dword [esp+0CH], ebx                    ; 2B75 _ 89. 5C 24, 0C
        mov     dword [esp+8H], edx                     ; 2B79 _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 2B7D _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2B81 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2B84 _ 89. 04 24
        call    sheet_refresh_local                     ; 2B87 _ E8, FFFFFFFC(rel)
?_126:  add     esp, 48                                 ; 2B8C _ 83. C4, 30
        pop     ebx                                     ; 2B8F _ 5B
        pop     esi                                     ; 2B90 _ 5E
        pop     ebp                                     ; 2B91 _ 5D
        ret                                             ; 2B92 _ C3
; sheet_updown End of function

sheet_refresh:; Function begin
        push    ebp                                     ; 2B93 _ 55
        mov     ebp, esp                                ; 2B94 _ 89. E5
        push    edi                                     ; 2B96 _ 57
        push    esi                                     ; 2B97 _ 56
        push    ebx                                     ; 2B98 _ 53
        sub     esp, 44                                 ; 2B99 _ 83. EC, 2C
        mov     eax, dword [ebp+0CH]                    ; 2B9C _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 2B9F _ 8B. 40, 18
        test    eax, eax                                ; 2BA2 _ 85. C0
        js      ?_127                                   ; 2BA4 _ 78, 53
        mov     eax, dword [ebp+0CH]                    ; 2BA6 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 2BA9 _ 8B. 40, 18
        mov     edx, dword [ebp+0CH]                    ; 2BAC _ 8B. 55, 0C
        mov     ecx, dword [edx+10H]                    ; 2BAF _ 8B. 4A, 10
        mov     edx, dword [ebp+1CH]                    ; 2BB2 _ 8B. 55, 1C
        lea     esi, [ecx+edx]                          ; 2BB5 _ 8D. 34 11
        mov     edx, dword [ebp+0CH]                    ; 2BB8 _ 8B. 55, 0C
        mov     ecx, dword [edx+0CH]                    ; 2BBB _ 8B. 4A, 0C
        mov     edx, dword [ebp+18H]                    ; 2BBE _ 8B. 55, 18
        lea     ebx, [ecx+edx]                          ; 2BC1 _ 8D. 1C 11
        mov     edx, dword [ebp+0CH]                    ; 2BC4 _ 8B. 55, 0C
        mov     ecx, dword [edx+10H]                    ; 2BC7 _ 8B. 4A, 10
        mov     edx, dword [ebp+14H]                    ; 2BCA _ 8B. 55, 14
        add     ecx, edx                                ; 2BCD _ 01. D1
        mov     edx, dword [ebp+0CH]                    ; 2BCF _ 8B. 55, 0C
        mov     edi, dword [edx+0CH]                    ; 2BD2 _ 8B. 7A, 0C
        mov     edx, dword [ebp+10H]                    ; 2BD5 _ 8B. 55, 10
        add     edx, edi                                ; 2BD8 _ 01. FA
        mov     dword [esp+14H], eax                    ; 2BDA _ 89. 44 24, 14
        mov     dword [esp+10H], esi                    ; 2BDE _ 89. 74 24, 10
        mov     dword [esp+0CH], ebx                    ; 2BE2 _ 89. 5C 24, 0C
        mov     dword [esp+8H], ecx                     ; 2BE6 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 2BEA _ 89. 54 24, 04
        mov     eax, dword [ebp+8H]                     ; 2BEE _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2BF1 _ 89. 04 24
        call    sheet_refresh_local                     ; 2BF4 _ E8, FFFFFFFC(rel)
?_127:  mov     eax, 0                                  ; 2BF9 _ B8, 00000000
        add     esp, 44                                 ; 2BFE _ 83. C4, 2C
        pop     ebx                                     ; 2C01 _ 5B
        pop     esi                                     ; 2C02 _ 5E
        pop     edi                                     ; 2C03 _ 5F
        pop     ebp                                     ; 2C04 _ 5D
        ret                                             ; 2C05 _ C3
; sheet_refresh End of function

sheet_slide:; Function begin
        push    ebp                                     ; 2C06 _ 55
        mov     ebp, esp                                ; 2C07 _ 89. E5
        push    ebx                                     ; 2C09 _ 53
        sub     esp, 52                                 ; 2C0A _ 83. EC, 34
        mov     eax, dword [ebp+0CH]                    ; 2C0D _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 2C10 _ 8B. 40, 0C
        mov     dword [ebp-10H], eax                    ; 2C13 _ 89. 45, F0
        mov     eax, dword [ebp+0CH]                    ; 2C16 _ 8B. 45, 0C
        mov     eax, dword [eax+10H]                    ; 2C19 _ 8B. 40, 10
        mov     dword [ebp-0CH], eax                    ; 2C1C _ 89. 45, F4
        mov     eax, dword [ebp+0CH]                    ; 2C1F _ 8B. 45, 0C
        mov     edx, dword [ebp+10H]                    ; 2C22 _ 8B. 55, 10
        mov     dword [eax+0CH], edx                    ; 2C25 _ 89. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 2C28 _ 8B. 45, 0C
        mov     edx, dword [ebp+14H]                    ; 2C2B _ 8B. 55, 14
        mov     dword [eax+10H], edx                    ; 2C2E _ 89. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 2C31 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 2C34 _ 8B. 40, 18
        test    eax, eax                                ; 2C37 _ 85. C0
        js      ?_128                                   ; 2C39 _ 0F 88, 00000100
        mov     eax, dword [ebp+0CH]                    ; 2C3F _ 8B. 45, 0C
        mov     edx, dword [eax+8H]                     ; 2C42 _ 8B. 50, 08
        mov     eax, dword [ebp-0CH]                    ; 2C45 _ 8B. 45, F4
        add     edx, eax                                ; 2C48 _ 01. C2
        mov     eax, dword [ebp+0CH]                    ; 2C4A _ 8B. 45, 0C
        mov     ecx, dword [eax+4H]                     ; 2C4D _ 8B. 48, 04
        mov     eax, dword [ebp-10H]                    ; 2C50 _ 8B. 45, F0
        add     eax, ecx                                ; 2C53 _ 01. C8
        mov     dword [esp+14H], 0                      ; 2C55 _ C7. 44 24, 14, 00000000
        mov     dword [esp+10H], edx                    ; 2C5D _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 2C61 _ 89. 44 24, 0C
        mov     eax, dword [ebp-0CH]                    ; 2C65 _ 8B. 45, F4
        mov     dword [esp+8H], eax                     ; 2C68 _ 89. 44 24, 08
        mov     eax, dword [ebp-10H]                    ; 2C6C _ 8B. 45, F0
        mov     dword [esp+4H], eax                     ; 2C6F _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2C73 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2C76 _ 89. 04 24
        call    sheet_refresh_map                       ; 2C79 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+0CH]                    ; 2C7E _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 2C81 _ 8B. 40, 18
        mov     edx, dword [ebp+0CH]                    ; 2C84 _ 8B. 55, 0C
        mov     ecx, dword [edx+8H]                     ; 2C87 _ 8B. 4A, 08
        mov     edx, dword [ebp+14H]                    ; 2C8A _ 8B. 55, 14
        add     ecx, edx                                ; 2C8D _ 01. D1
        mov     edx, dword [ebp+0CH]                    ; 2C8F _ 8B. 55, 0C
        mov     ebx, dword [edx+4H]                     ; 2C92 _ 8B. 5A, 04
        mov     edx, dword [ebp+10H]                    ; 2C95 _ 8B. 55, 10
        add     edx, ebx                                ; 2C98 _ 01. DA
        mov     dword [esp+14H], eax                    ; 2C9A _ 89. 44 24, 14
        mov     dword [esp+10H], ecx                    ; 2C9E _ 89. 4C 24, 10
        mov     dword [esp+0CH], edx                    ; 2CA2 _ 89. 54 24, 0C
        mov     eax, dword [ebp+14H]                    ; 2CA6 _ 8B. 45, 14
        mov     dword [esp+8H], eax                     ; 2CA9 _ 89. 44 24, 08
        mov     eax, dword [ebp+10H]                    ; 2CAD _ 8B. 45, 10
        mov     dword [esp+4H], eax                     ; 2CB0 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2CB4 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2CB7 _ 89. 04 24
        call    sheet_refresh_map                       ; 2CBA _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+0CH]                    ; 2CBF _ 8B. 45, 0C
        mov     edx, dword [eax+8H]                     ; 2CC2 _ 8B. 50, 08
        mov     eax, dword [ebp-0CH]                    ; 2CC5 _ 8B. 45, F4
        add     edx, eax                                ; 2CC8 _ 01. C2
        mov     eax, dword [ebp+0CH]                    ; 2CCA _ 8B. 45, 0C
        mov     ecx, dword [eax+4H]                     ; 2CCD _ 8B. 48, 04
        mov     eax, dword [ebp-10H]                    ; 2CD0 _ 8B. 45, F0
        add     eax, ecx                                ; 2CD3 _ 01. C8
        mov     dword [esp+14H], 0                      ; 2CD5 _ C7. 44 24, 14, 00000000
        mov     dword [esp+10H], edx                    ; 2CDD _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 2CE1 _ 89. 44 24, 0C
        mov     eax, dword [ebp-0CH]                    ; 2CE5 _ 8B. 45, F4
        mov     dword [esp+8H], eax                     ; 2CE8 _ 89. 44 24, 08
        mov     eax, dword [ebp-10H]                    ; 2CEC _ 8B. 45, F0
        mov     dword [esp+4H], eax                     ; 2CEF _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2CF3 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2CF6 _ 89. 04 24
        call    sheet_refresh_local                     ; 2CF9 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+0CH]                    ; 2CFE _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 2D01 _ 8B. 40, 18
        mov     edx, dword [ebp+0CH]                    ; 2D04 _ 8B. 55, 0C
        mov     ecx, dword [edx+8H]                     ; 2D07 _ 8B. 4A, 08
        mov     edx, dword [ebp+14H]                    ; 2D0A _ 8B. 55, 14
        add     ecx, edx                                ; 2D0D _ 01. D1
        mov     edx, dword [ebp+0CH]                    ; 2D0F _ 8B. 55, 0C
        mov     ebx, dword [edx+4H]                     ; 2D12 _ 8B. 5A, 04
        mov     edx, dword [ebp+10H]                    ; 2D15 _ 8B. 55, 10
        add     edx, ebx                                ; 2D18 _ 01. DA
        mov     dword [esp+14H], eax                    ; 2D1A _ 89. 44 24, 14
        mov     dword [esp+10H], ecx                    ; 2D1E _ 89. 4C 24, 10
        mov     dword [esp+0CH], edx                    ; 2D22 _ 89. 54 24, 0C
        mov     eax, dword [ebp+14H]                    ; 2D26 _ 8B. 45, 14
        mov     dword [esp+8H], eax                     ; 2D29 _ 89. 44 24, 08
        mov     eax, dword [ebp+10H]                    ; 2D2D _ 8B. 45, 10
        mov     dword [esp+4H], eax                     ; 2D30 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2D34 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2D37 _ 89. 04 24
        call    sheet_refresh_local                     ; 2D3A _ E8, FFFFFFFC(rel)
?_128:  add     esp, 52                                 ; 2D3F _ 83. C4, 34
        pop     ebx                                     ; 2D42 _ 5B
        pop     ebp                                     ; 2D43 _ 5D
        ret                                             ; 2D44 _ C3
; sheet_slide End of function

sheet_refresh_local:; Function begin
        push    ebp                                     ; 2D45 _ 55
        mov     ebp, esp                                ; 2D46 _ 89. E5
        sub     esp, 48                                 ; 2D48 _ 83. EC, 30
        mov     eax, dword [ebp+8H]                     ; 2D4B _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 2D4E _ 8B. 00
        mov     dword [ebp-18H], eax                    ; 2D50 _ 89. 45, E8
        mov     eax, dword [ebp+8H]                     ; 2D53 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 2D56 _ 8B. 40, 10
        mov     dword [ebp-14H], eax                    ; 2D59 _ 89. 45, EC
        cmp     dword [ebp+0CH], 0                      ; 2D5C _ 83. 7D, 0C, 00
        jns     ?_129                                   ; 2D60 _ 79, 07
        mov     dword [ebp+0CH], 0                      ; 2D62 _ C7. 45, 0C, 00000000
?_129:  cmp     dword [ebp+10H], 0                      ; 2D69 _ 83. 7D, 10, 00
        jns     ?_130                                   ; 2D6D _ 79, 07
        mov     dword [ebp+10H], 0                      ; 2D6F _ C7. 45, 10, 00000000
?_130:  mov     eax, dword [ebp+8H]                     ; 2D76 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 2D79 _ 8B. 40, 04
        cmp     eax, dword [ebp+14H]                    ; 2D7C _ 3B. 45, 14
        jge     ?_131                                   ; 2D7F _ 7D, 09
        mov     eax, dword [ebp+8H]                     ; 2D81 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 2D84 _ 8B. 40, 04
        mov     dword [ebp+14H], eax                    ; 2D87 _ 89. 45, 14
?_131:  mov     eax, dword [ebp+8H]                     ; 2D8A _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 2D8D _ 8B. 40, 08
        cmp     eax, dword [ebp+18H]                    ; 2D90 _ 3B. 45, 18
        jge     ?_132                                   ; 2D93 _ 7D, 09
        mov     eax, dword [ebp+8H]                     ; 2D95 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 2D98 _ 8B. 40, 08
        mov     dword [ebp+18H], eax                    ; 2D9B _ 89. 45, 18
?_132:  mov     eax, dword [ebp+1CH]                    ; 2D9E _ 8B. 45, 1C
        mov     dword [ebp-24H], eax                    ; 2DA1 _ 89. 45, DC
        jmp     ?_139                                   ; 2DA4 _ E9, 00000119

?_133:  mov     eax, dword [ebp+8H]                     ; 2DA9 _ 8B. 45, 08
        mov     edx, dword [ebp-24H]                    ; 2DAC _ 8B. 55, DC
        add     edx, 4                                  ; 2DAF _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 2DB2 _ 8B. 44 90, 04
        mov     dword [ebp-10H], eax                    ; 2DB6 _ 89. 45, F0
        mov     eax, dword [ebp-10H]                    ; 2DB9 _ 8B. 45, F0
        mov     eax, dword [eax]                        ; 2DBC _ 8B. 00
        mov     dword [ebp-0CH], eax                    ; 2DBE _ 89. 45, F4
        mov     edx, dword [ebp-10H]                    ; 2DC1 _ 8B. 55, F0
        mov     eax, dword [ebp+8H]                     ; 2DC4 _ 8B. 45, 08
        add     eax, 1044                               ; 2DC7 _ 05, 00000414
        sub     edx, eax                                ; 2DCC _ 29. C2
        mov     eax, edx                                ; 2DCE _ 89. D0
        sar     eax, 5                                  ; 2DD0 _ C1. F8, 05
        mov     byte [ebp-26H], al                      ; 2DD3 _ 88. 45, DA
        mov     dword [ebp-1CH], 0                      ; 2DD6 _ C7. 45, E4, 00000000
        jmp     ?_138                                   ; 2DDD _ E9, 000000CD

?_134:  mov     eax, dword [ebp-10H]                    ; 2DE2 _ 8B. 45, F0
        mov     edx, dword [eax+10H]                    ; 2DE5 _ 8B. 50, 10
        mov     eax, dword [ebp-1CH]                    ; 2DE8 _ 8B. 45, E4
        add     eax, edx                                ; 2DEB _ 01. D0
        mov     dword [ebp-8H], eax                     ; 2DED _ 89. 45, F8
        mov     dword [ebp-20H], 0                      ; 2DF0 _ C7. 45, E0, 00000000
        jmp     ?_137                                   ; 2DF7 _ E9, 000000A0

?_135:  mov     eax, dword [ebp-10H]                    ; 2DFC _ 8B. 45, F0
        mov     edx, dword [eax+0CH]                    ; 2DFF _ 8B. 50, 0C
        mov     eax, dword [ebp-20H]                    ; 2E02 _ 8B. 45, E0
        add     eax, edx                                ; 2E05 _ 01. D0
        mov     dword [ebp-4H], eax                     ; 2E07 _ 89. 45, FC
        mov     eax, dword [ebp+0CH]                    ; 2E0A _ 8B. 45, 0C
        cmp     eax, dword [ebp-4H]                     ; 2E0D _ 3B. 45, FC
        jg      ?_136                                   ; 2E10 _ 0F 8F, 00000082
        mov     eax, dword [ebp-4H]                     ; 2E16 _ 8B. 45, FC
        cmp     eax, dword [ebp+14H]                    ; 2E19 _ 3B. 45, 14
        jge     ?_136                                   ; 2E1C _ 7D, 7A
        mov     eax, dword [ebp+10H]                    ; 2E1E _ 8B. 45, 10
        cmp     eax, dword [ebp-8H]                     ; 2E21 _ 3B. 45, F8
        jg      ?_136                                   ; 2E24 _ 7F, 72
        mov     eax, dword [ebp-8H]                     ; 2E26 _ 8B. 45, F8
        cmp     eax, dword [ebp+18H]                    ; 2E29 _ 3B. 45, 18
        jge     ?_136                                   ; 2E2C _ 7D, 6A
        mov     eax, dword [ebp-10H]                    ; 2E2E _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 2E31 _ 8B. 40, 04
        imul    eax, dword [ebp-1CH]                    ; 2E34 _ 0F AF. 45, E4
        mov     edx, eax                                ; 2E38 _ 89. C2
        mov     eax, dword [ebp-20H]                    ; 2E3A _ 8B. 45, E0
        add     eax, edx                                ; 2E3D _ 01. D0
        mov     edx, eax                                ; 2E3F _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 2E41 _ 8B. 45, F4
        add     eax, edx                                ; 2E44 _ 01. D0
        movzx   eax, byte [eax]                         ; 2E46 _ 0F B6. 00
        mov     byte [ebp-25H], al                      ; 2E49 _ 88. 45, DB
        movzx   edx, byte [ebp-25H]                     ; 2E4C _ 0F B6. 55, DB
        mov     eax, dword [ebp-10H]                    ; 2E50 _ 8B. 45, F0
        mov     eax, dword [eax+14H]                    ; 2E53 _ 8B. 40, 14
        cmp     edx, eax                                ; 2E56 _ 39. C2
        jz      ?_136                                   ; 2E58 _ 74, 3E
        mov     eax, dword [ebp+8H]                     ; 2E5A _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 2E5D _ 8B. 40, 04
        imul    eax, dword [ebp-8H]                     ; 2E60 _ 0F AF. 45, F8
        mov     edx, eax                                ; 2E64 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 2E66 _ 8B. 45, FC
        add     eax, edx                                ; 2E69 _ 01. D0
        mov     edx, eax                                ; 2E6B _ 89. C2
        mov     eax, dword [ebp-14H]                    ; 2E6D _ 8B. 45, EC
        add     eax, edx                                ; 2E70 _ 01. D0
        movzx   eax, byte [eax]                         ; 2E72 _ 0F B6. 00
        cmp     al, byte [ebp-26H]                      ; 2E75 _ 3A. 45, DA
        jnz     ?_136                                   ; 2E78 _ 75, 1E
        mov     eax, dword [ebp+8H]                     ; 2E7A _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 2E7D _ 8B. 40, 04
        imul    eax, dword [ebp-8H]                     ; 2E80 _ 0F AF. 45, F8
        mov     edx, eax                                ; 2E84 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 2E86 _ 8B. 45, FC
        add     eax, edx                                ; 2E89 _ 01. D0
        mov     edx, eax                                ; 2E8B _ 89. C2
        mov     eax, dword [ebp-18H]                    ; 2E8D _ 8B. 45, E8
        add     edx, eax                                ; 2E90 _ 01. C2
        movzx   eax, byte [ebp-25H]                     ; 2E92 _ 0F B6. 45, DB
        mov     byte [edx], al                          ; 2E96 _ 88. 02
?_136:  add     dword [ebp-20H], 1                      ; 2E98 _ 83. 45, E0, 01
?_137:  mov     eax, dword [ebp-10H]                    ; 2E9C _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 2E9F _ 8B. 40, 04
        cmp     eax, dword [ebp-20H]                    ; 2EA2 _ 3B. 45, E0
        jg      ?_135                                   ; 2EA5 _ 0F 8F, FFFFFF51
        add     dword [ebp-1CH], 1                      ; 2EAB _ 83. 45, E4, 01
?_138:  mov     eax, dword [ebp-10H]                    ; 2EAF _ 8B. 45, F0
        mov     eax, dword [eax+8H]                     ; 2EB2 _ 8B. 40, 08
        cmp     eax, dword [ebp-1CH]                    ; 2EB5 _ 3B. 45, E4
        jg      ?_134                                   ; 2EB8 _ 0F 8F, FFFFFF24
        add     dword [ebp-24H], 1                      ; 2EBE _ 83. 45, DC, 01
?_139:  mov     eax, dword [ebp+8H]                     ; 2EC2 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 2EC5 _ 8B. 40, 0C
        cmp     eax, dword [ebp-24H]                    ; 2EC8 _ 3B. 45, DC
        jge     ?_133                                   ; 2ECB _ 0F 8D, FFFFFED8
        leave                                           ; 2ED1 _ C9
        ret                                             ; 2ED2 _ C3
; sheet_refresh_local End of function

sheet_refresh_map:; Function begin
        push    ebp                                     ; 2ED3 _ 55
        mov     ebp, esp                                ; 2ED4 _ 89. E5
        sub     esp, 64                                 ; 2ED6 _ 83. EC, 40
        mov     eax, dword [ebp+8H]                     ; 2ED9 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 2EDC _ 8B. 00
        mov     dword [ebp-18H], eax                    ; 2EDE _ 89. 45, E8
        mov     eax, dword [ebp+8H]                     ; 2EE1 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 2EE4 _ 8B. 40, 10
        mov     dword [ebp-14H], eax                    ; 2EE7 _ 89. 45, EC
        cmp     dword [ebp+0CH], 0                      ; 2EEA _ 83. 7D, 0C, 00
        jns     ?_140                                   ; 2EEE _ 79, 07
        mov     dword [ebp+0CH], 0                      ; 2EF0 _ C7. 45, 0C, 00000000
?_140:  cmp     dword [ebp+10H], 0                      ; 2EF7 _ 83. 7D, 10, 00
        jns     ?_141                                   ; 2EFB _ 79, 07
        mov     dword [ebp+10H], 0                      ; 2EFD _ C7. 45, 10, 00000000
?_141:  mov     eax, dword [ebp+8H]                     ; 2F04 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 2F07 _ 8B. 40, 04
        cmp     eax, dword [ebp+14H]                    ; 2F0A _ 3B. 45, 14
        jge     ?_142                                   ; 2F0D _ 7D, 09
        mov     eax, dword [ebp+8H]                     ; 2F0F _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 2F12 _ 8B. 40, 04
        mov     dword [ebp+14H], eax                    ; 2F15 _ 89. 45, 14
?_142:  mov     eax, dword [ebp+8H]                     ; 2F18 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 2F1B _ 8B. 40, 08
        cmp     eax, dword [ebp+18H]                    ; 2F1E _ 3B. 45, 18
        jge     ?_143                                   ; 2F21 _ 7D, 09
        mov     eax, dword [ebp+8H]                     ; 2F23 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 2F26 _ 8B. 40, 08
        mov     dword [ebp+18H], eax                    ; 2F29 _ 89. 45, 18
?_143:  mov     eax, dword [ebp+1CH]                    ; 2F2C _ 8B. 45, 1C
        mov     dword [ebp-34H], eax                    ; 2F2F _ 89. 45, CC
        jmp     ?_154                                   ; 2F32 _ E9, 00000141

?_144:  mov     eax, dword [ebp+8H]                     ; 2F37 _ 8B. 45, 08
        mov     edx, dword [ebp-34H]                    ; 2F3A _ 8B. 55, CC
        add     edx, 4                                  ; 2F3D _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 2F40 _ 8B. 44 90, 04
        mov     dword [ebp-10H], eax                    ; 2F44 _ 89. 45, F0
        mov     edx, dword [ebp-10H]                    ; 2F47 _ 8B. 55, F0
        mov     eax, dword [ebp+8H]                     ; 2F4A _ 8B. 45, 08
        add     eax, 1044                               ; 2F4D _ 05, 00000414
        sub     edx, eax                                ; 2F52 _ 29. C2
        mov     eax, edx                                ; 2F54 _ 89. D0
        sar     eax, 5                                  ; 2F56 _ C1. F8, 05
        mov     byte [ebp-35H], al                      ; 2F59 _ 88. 45, CB
        mov     eax, dword [ebp-10H]                    ; 2F5C _ 8B. 45, F0
        mov     eax, dword [eax]                        ; 2F5F _ 8B. 00
        mov     dword [ebp-0CH], eax                    ; 2F61 _ 89. 45, F4
        mov     eax, dword [ebp-10H]                    ; 2F64 _ 8B. 45, F0
        mov     eax, dword [eax+0CH]                    ; 2F67 _ 8B. 40, 0C
        mov     edx, dword [ebp+0CH]                    ; 2F6A _ 8B. 55, 0C
        sub     edx, eax                                ; 2F6D _ 29. C2
        mov     eax, edx                                ; 2F6F _ 89. D0
        mov     dword [ebp-30H], eax                    ; 2F71 _ 89. 45, D0
        mov     eax, dword [ebp-10H]                    ; 2F74 _ 8B. 45, F0
        mov     eax, dword [eax+10H]                    ; 2F77 _ 8B. 40, 10
        mov     edx, dword [ebp+10H]                    ; 2F7A _ 8B. 55, 10
        sub     edx, eax                                ; 2F7D _ 29. C2
        mov     eax, edx                                ; 2F7F _ 89. D0
        mov     dword [ebp-2CH], eax                    ; 2F81 _ 89. 45, D4
        mov     eax, dword [ebp-10H]                    ; 2F84 _ 8B. 45, F0
        mov     eax, dword [eax+0CH]                    ; 2F87 _ 8B. 40, 0C
        mov     edx, dword [ebp+14H]                    ; 2F8A _ 8B. 55, 14
        sub     edx, eax                                ; 2F8D _ 29. C2
        mov     eax, edx                                ; 2F8F _ 89. D0
        mov     dword [ebp-28H], eax                    ; 2F91 _ 89. 45, D8
        mov     eax, dword [ebp-10H]                    ; 2F94 _ 8B. 45, F0
        mov     eax, dword [eax+10H]                    ; 2F97 _ 8B. 40, 10
        mov     edx, dword [ebp+18H]                    ; 2F9A _ 8B. 55, 18
        sub     edx, eax                                ; 2F9D _ 29. C2
        mov     eax, edx                                ; 2F9F _ 89. D0
        mov     dword [ebp-24H], eax                    ; 2FA1 _ 89. 45, DC
        cmp     dword [ebp-30H], 0                      ; 2FA4 _ 83. 7D, D0, 00
        jns     ?_145                                   ; 2FA8 _ 79, 07
        mov     dword [ebp-30H], 0                      ; 2FAA _ C7. 45, D0, 00000000
?_145:  cmp     dword [ebp-2CH], 0                      ; 2FB1 _ 83. 7D, D4, 00
        jns     ?_146                                   ; 2FB5 _ 79, 07
        mov     dword [ebp-2CH], 0                      ; 2FB7 _ C7. 45, D4, 00000000
?_146:  mov     eax, dword [ebp-10H]                    ; 2FBE _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 2FC1 _ 8B. 40, 04
        cmp     eax, dword [ebp-28H]                    ; 2FC4 _ 3B. 45, D8
        jge     ?_147                                   ; 2FC7 _ 7D, 09
        mov     eax, dword [ebp-10H]                    ; 2FC9 _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 2FCC _ 8B. 40, 04
        mov     dword [ebp-28H], eax                    ; 2FCF _ 89. 45, D8
?_147:  mov     eax, dword [ebp-10H]                    ; 2FD2 _ 8B. 45, F0
        mov     eax, dword [eax+8H]                     ; 2FD5 _ 8B. 40, 08
        cmp     eax, dword [ebp-24H]                    ; 2FD8 _ 3B. 45, DC
        jge     ?_148                                   ; 2FDB _ 7D, 09
        mov     eax, dword [ebp-10H]                    ; 2FDD _ 8B. 45, F0
        mov     eax, dword [eax+8H]                     ; 2FE0 _ 8B. 40, 08
        mov     dword [ebp-24H], eax                    ; 2FE3 _ 89. 45, DC
?_148:  mov     eax, dword [ebp-2CH]                    ; 2FE6 _ 8B. 45, D4
        mov     dword [ebp-1CH], eax                    ; 2FE9 _ 89. 45, E4
        jmp     ?_153                                   ; 2FEC _ EB, 7A

?_149:  mov     eax, dword [ebp-10H]                    ; 2FEE _ 8B. 45, F0
        mov     edx, dword [eax+10H]                    ; 2FF1 _ 8B. 50, 10
        mov     eax, dword [ebp-1CH]                    ; 2FF4 _ 8B. 45, E4
        add     eax, edx                                ; 2FF7 _ 01. D0
        mov     dword [ebp-8H], eax                     ; 2FF9 _ 89. 45, F8
        mov     eax, dword [ebp-30H]                    ; 2FFC _ 8B. 45, D0
        mov     dword [ebp-20H], eax                    ; 2FFF _ 89. 45, E0
        jmp     ?_152                                   ; 3002 _ EB, 58

?_150:  mov     eax, dword [ebp-10H]                    ; 3004 _ 8B. 45, F0
        mov     edx, dword [eax+0CH]                    ; 3007 _ 8B. 50, 0C
        mov     eax, dword [ebp-20H]                    ; 300A _ 8B. 45, E0
        add     eax, edx                                ; 300D _ 01. D0
        mov     dword [ebp-4H], eax                     ; 300F _ 89. 45, FC
        mov     eax, dword [ebp-10H]                    ; 3012 _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 3015 _ 8B. 40, 04
        imul    eax, dword [ebp-1CH]                    ; 3018 _ 0F AF. 45, E4
        mov     edx, eax                                ; 301C _ 89. C2
        mov     eax, dword [ebp-20H]                    ; 301E _ 8B. 45, E0
        add     eax, edx                                ; 3021 _ 01. D0
        mov     edx, eax                                ; 3023 _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 3025 _ 8B. 45, F4
        add     eax, edx                                ; 3028 _ 01. D0
        movzx   eax, byte [eax]                         ; 302A _ 0F B6. 00
        movzx   edx, al                                 ; 302D _ 0F B6. D0
        mov     eax, dword [ebp-10H]                    ; 3030 _ 8B. 45, F0
        mov     eax, dword [eax+14H]                    ; 3033 _ 8B. 40, 14
        cmp     edx, eax                                ; 3036 _ 39. C2
        jz      ?_151                                   ; 3038 _ 74, 1E
        mov     eax, dword [ebp+8H]                     ; 303A _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 303D _ 8B. 40, 04
        imul    eax, dword [ebp-8H]                     ; 3040 _ 0F AF. 45, F8
        mov     edx, eax                                ; 3044 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 3046 _ 8B. 45, FC
        add     eax, edx                                ; 3049 _ 01. D0
        mov     edx, eax                                ; 304B _ 89. C2
        mov     eax, dword [ebp-14H]                    ; 304D _ 8B. 45, EC
        add     edx, eax                                ; 3050 _ 01. C2
        movzx   eax, byte [ebp-35H]                     ; 3052 _ 0F B6. 45, CB
        mov     byte [edx], al                          ; 3056 _ 88. 02
?_151:  add     dword [ebp-20H], 1                      ; 3058 _ 83. 45, E0, 01
?_152:  mov     eax, dword [ebp-20H]                    ; 305C _ 8B. 45, E0
        cmp     eax, dword [ebp-28H]                    ; 305F _ 3B. 45, D8
        jl      ?_150                                   ; 3062 _ 7C, A0
        add     dword [ebp-1CH], 1                      ; 3064 _ 83. 45, E4, 01
?_153:  mov     eax, dword [ebp-1CH]                    ; 3068 _ 8B. 45, E4
        cmp     eax, dword [ebp-24H]                    ; 306B _ 3B. 45, DC
        jl      ?_149                                   ; 306E _ 0F 8C, FFFFFF7A
        add     dword [ebp-34H], 1                      ; 3074 _ 83. 45, CC, 01
?_154:  mov     eax, dword [ebp+8H]                     ; 3078 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 307B _ 8B. 40, 0C
        cmp     eax, dword [ebp-34H]                    ; 307E _ 3B. 45, CC
        jge     ?_144                                   ; 3081 _ 0F 8D, FFFFFEB0
        leave                                           ; 3087 _ C9
        ret                                             ; 3088 _ C3
; sheet_refresh_map End of function

init_time_port:; Function begin
        push    ebp                                     ; 3089 _ 55
        mov     ebp, esp                                ; 308A _ 89. E5
        sub     esp, 24                                 ; 308C _ 83. EC, 18
        mov     dword [esp+4H], 52                      ; 308F _ C7. 44 24, 04, 00000034
        mov     dword [esp], 67                         ; 3097 _ C7. 04 24, 00000043
        call    io_out8                                 ; 309E _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 156                     ; 30A3 _ C7. 44 24, 04, 0000009C
        mov     dword [esp], 64                         ; 30AB _ C7. 04 24, 00000040
        call    io_out8                                 ; 30B2 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 46                      ; 30B7 _ C7. 44 24, 04, 0000002E
        mov     dword [esp], 64                         ; 30BF _ C7. 04 24, 00000040
        call    io_out8                                 ; 30C6 _ E8, FFFFFFFC(rel)
        mov     dword [timer_control], 0                ; 30CB _ C7. 05, 000003C0(d), 00000000
        leave                                           ; 30D5 _ C9
        ret                                             ; 30D6 _ C3
; init_time_port End of function

get_timer_control:; Function begin
        push    ebp                                     ; 30D7 _ 55
        mov     ebp, esp                                ; 30D8 _ 89. E5
        mov     eax, timer_control                      ; 30DA _ B8, 000003C0(d)
        pop     ebp                                     ; 30DF _ 5D
        ret                                             ; 30E0 _ C3
; get_timer_control End of function

timer_alloc:; Function begin
        push    ebp                                     ; 30E1 _ 55
        mov     ebp, esp                                ; 30E2 _ 89. E5
        sub     esp, 16                                 ; 30E4 _ 83. EC, 10
        mov     dword [ebp-4H], 0                       ; 30E7 _ C7. 45, FC, 00000000
        jmp     ?_157                                   ; 30EE _ EB, 26

?_155:  mov     eax, dword [ebp-4H]                     ; 30F0 _ 8B. 45, FC
        shl     eax, 4                                  ; 30F3 _ C1. E0, 04
        add     eax, timer_control                      ; 30F6 _ 05, 000003C0(d)
        mov     eax, dword [eax+8H]                     ; 30FB _ 8B. 40, 08
        test    eax, eax                                ; 30FE _ 85. C0
        jnz     ?_156                                   ; 3100 _ 75, 10
        mov     eax, dword [ebp-4H]                     ; 3102 _ 8B. 45, FC
        shl     eax, 4                                  ; 3105 _ C1. E0, 04
        add     eax, timer_control                      ; 3108 _ 05, 000003C0(d)
        add     eax, 4                                  ; 310D _ 83. C0, 04
        jmp     ?_158                                   ; 3110 _ EB, 0D

?_156:  add     dword [ebp-4H], 1                       ; 3112 _ 83. 45, FC, 01
?_157:  cmp     dword [ebp-4H], 499                     ; 3116 _ 81. 7D, FC, 000001F3
        jle     ?_155                                   ; 311D _ 7E, D1
?_158:  leave                                           ; 311F _ C9
        ret                                             ; 3120 _ C3
; timer_alloc End of function

timer_free:; Function begin
        push    ebp                                     ; 3121 _ 55
        mov     ebp, esp                                ; 3122 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 3124 _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 3127 _ C7. 40, 04, 00000000
        pop     ebp                                     ; 312E _ 5D
        ret                                             ; 312F _ C3
; timer_free End of function

timer_init:; Function begin
        push    ebp                                     ; 3130 _ 55
        mov     ebp, esp                                ; 3131 _ 89. E5
        sub     esp, 4                                  ; 3133 _ 83. EC, 04
        mov     eax, dword [ebp+10H]                    ; 3136 _ 8B. 45, 10
        mov     byte [ebp-4H], al                       ; 3139 _ 88. 45, FC
        mov     eax, dword [ebp+8H]                     ; 313C _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 313F _ 8B. 55, 0C
        mov     dword [eax+8H], edx                     ; 3142 _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 3145 _ 8B. 45, 08
        movzx   edx, byte [ebp-4H]                      ; 3148 _ 0F B6. 55, FC
        mov     byte [eax+0CH], dl                      ; 314C _ 88. 50, 0C
        leave                                           ; 314F _ C9
        ret                                             ; 3150 _ C3
; timer_init End of function

timer_settime:; Function begin
        push    ebp                                     ; 3151 _ 55
        mov     ebp, esp                                ; 3152 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 3154 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 3157 _ 8B. 55, 0C
        mov     dword [eax], edx                        ; 315A _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 315C _ 8B. 45, 08
        mov     dword [eax+4H], 2                       ; 315F _ C7. 40, 04, 00000002
        pop     ebp                                     ; 3166 _ 5D
        ret                                             ; 3167 _ C3
; timer_settime End of function

intHandlerTimer:; Function begin
        push    ebp                                     ; 3168 _ 55
        mov     ebp, esp                                ; 3169 _ 89. E5
        sub     esp, 40                                 ; 316B _ 83. EC, 28
        mov     dword [esp+4H], 96                      ; 316E _ C7. 44 24, 04, 00000060
        mov     dword [esp], 32                         ; 3176 _ C7. 04 24, 00000020
        call    io_out8                                 ; 317D _ E8, FFFFFFFC(rel)
        mov     eax, dword [timer_control]              ; 3182 _ A1, 000003C0(d)
        add     eax, 1                                  ; 3187 _ 83. C0, 01
        mov     dword [timer_control], eax              ; 318A _ A3, 000003C0(d)
        mov     byte [ebp-0DH], 0                       ; 318F _ C6. 45, F3, 00
        mov     dword [ebp-0CH], 0                      ; 3193 _ C7. 45, F4, 00000000
        jmp     ?_162                                   ; 319A _ E9, 000000B0

?_159:  mov     eax, dword [ebp-0CH]                    ; 319F _ 8B. 45, F4
        shl     eax, 4                                  ; 31A2 _ C1. E0, 04
        add     eax, timer_control                      ; 31A5 _ 05, 000003C0(d)
        mov     eax, dword [eax+8H]                     ; 31AA _ 8B. 40, 08
        cmp     eax, 2                                  ; 31AD _ 83. F8, 02
        jne     ?_160                                   ; 31B0 _ 0F 85, 0000008A
        mov     eax, dword [ebp-0CH]                    ; 31B6 _ 8B. 45, F4
        shl     eax, 4                                  ; 31B9 _ C1. E0, 04
        add     eax, timer_control                      ; 31BC _ 05, 000003C0(d)
        mov     eax, dword [eax+4H]                     ; 31C1 _ 8B. 40, 04
        lea     edx, [eax-1H]                           ; 31C4 _ 8D. 50, FF
        mov     eax, dword [ebp-0CH]                    ; 31C7 _ 8B. 45, F4
        shl     eax, 4                                  ; 31CA _ C1. E0, 04
        add     eax, timer_control                      ; 31CD _ 05, 000003C0(d)
        mov     dword [eax+4H], edx                     ; 31D2 _ 89. 50, 04
        mov     eax, dword [ebp-0CH]                    ; 31D5 _ 8B. 45, F4
        shl     eax, 4                                  ; 31D8 _ C1. E0, 04
        add     eax, timer_control                      ; 31DB _ 05, 000003C0(d)
        mov     eax, dword [eax+4H]                     ; 31E0 _ 8B. 40, 04
        test    eax, eax                                ; 31E3 _ 85. C0
        jnz     ?_160                                   ; 31E5 _ 75, 59
        mov     eax, dword [ebp-0CH]                    ; 31E7 _ 8B. 45, F4
        shl     eax, 4                                  ; 31EA _ C1. E0, 04
        add     eax, timer_control                      ; 31ED _ 05, 000003C0(d)
        mov     dword [eax+8H], 1                       ; 31F2 _ C7. 40, 08, 00000001
        mov     eax, dword [ebp-0CH]                    ; 31F9 _ 8B. 45, F4
        shl     eax, 4                                  ; 31FC _ C1. E0, 04
        add     eax, timer_control                      ; 31FF _ 05, 000003C0(d)
        movzx   eax, byte [eax+10H]                     ; 3204 _ 0F B6. 40, 10
        movzx   edx, al                                 ; 3208 _ 0F B6. D0
        mov     eax, dword [ebp-0CH]                    ; 320B _ 8B. 45, F4
        shl     eax, 4                                  ; 320E _ C1. E0, 04
        add     eax, timer_control                      ; 3211 _ 05, 000003C0(d)
        mov     eax, dword [eax+0CH]                    ; 3216 _ 8B. 40, 0C
        mov     dword [esp+4H], edx                     ; 3219 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 321D _ 89. 04 24
        call    fifo8_put                               ; 3220 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 3225 _ 8B. 45, F4
        shl     eax, 4                                  ; 3228 _ C1. E0, 04
        add     eax, timer_control                      ; 322B _ 05, 000003C0(d)
        lea     edx, [eax+4H]                           ; 3230 _ 8D. 50, 04
        mov     eax, dword [multi_timer]                ; 3233 _ A1, 00000000(d)
        cmp     edx, eax                                ; 3238 _ 39. C2
        jnz     ?_160                                   ; 323A _ 75, 04
        mov     byte [ebp-0DH], 1                       ; 323C _ C6. 45, F3, 01
?_160:  cmp     byte [ebp-0DH], 0                       ; 3240 _ 80. 7D, F3, 00
        jz      ?_161                                   ; 3244 _ 74, 05
        call    multi_task_switch                       ; 3246 _ E8, FFFFFFFC(rel)
?_161:  add     dword [ebp-0CH], 1                      ; 324B _ 83. 45, F4, 01
?_162:  cmp     dword [ebp-0CH], 499                    ; 324F _ 81. 7D, F4, 000001F3
        jle     ?_159                                   ; 3256 _ 0F 8E, FFFFFF43
        leave                                           ; 325C _ C9
        ret                                             ; 325D _ C3
; intHandlerTimer End of function

segment_descriptor:; Function begin
        push    ebp                                     ; 325E _ 55
        mov     ebp, esp                                ; 325F _ 89. E5
        cmp     dword [ebp+0CH], 1048575                ; 3261 _ 81. 7D, 0C, 000FFFFF
        jbe     ?_163                                   ; 3268 _ 76, 10
        or      dword [ebp+14H], 8000H                  ; 326A _ 81. 4D, 14, 00008000
        mov     eax, dword [ebp+0CH]                    ; 3271 _ 8B. 45, 0C
        shr     eax, 12                                 ; 3274 _ C1. E8, 0C
        mov     dword [ebp+0CH], eax                    ; 3277 _ 89. 45, 0C
?_163:  mov     eax, dword [ebp+0CH]                    ; 327A _ 8B. 45, 0C
        mov     edx, eax                                ; 327D _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 327F _ 8B. 45, 08
        mov     word [eax], dx                          ; 3282 _ 66: 89. 10
        mov     eax, dword [ebp+10H]                    ; 3285 _ 8B. 45, 10
        mov     edx, eax                                ; 3288 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 328A _ 8B. 45, 08
        mov     word [eax+2H], dx                       ; 328D _ 66: 89. 50, 02
        mov     eax, dword [ebp+10H]                    ; 3291 _ 8B. 45, 10
        sar     eax, 16                                 ; 3294 _ C1. F8, 10
        mov     edx, eax                                ; 3297 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 3299 _ 8B. 45, 08
        mov     byte [eax+4H], dl                       ; 329C _ 88. 50, 04
        mov     eax, dword [ebp+14H]                    ; 329F _ 8B. 45, 14
        mov     edx, eax                                ; 32A2 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 32A4 _ 8B. 45, 08
        mov     byte [eax+5H], dl                       ; 32A7 _ 88. 50, 05
        mov     eax, dword [ebp+0CH]                    ; 32AA _ 8B. 45, 0C
        shr     eax, 16                                 ; 32AD _ C1. E8, 10
        and     eax, 0FH                                ; 32B0 _ 83. E0, 0F
        mov     edx, eax                                ; 32B3 _ 89. C2
        mov     eax, dword [ebp+14H]                    ; 32B5 _ 8B. 45, 14
        sar     eax, 8                                  ; 32B8 _ C1. F8, 08
        and     eax, 0FFFFFFF0H                         ; 32BB _ 83. E0, F0
        or      eax, edx                                ; 32BE _ 09. D0
        mov     edx, eax                                ; 32C0 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 32C2 _ 8B. 45, 08
        mov     byte [eax+6H], dl                       ; 32C5 _ 88. 50, 06
        mov     eax, dword [ebp+10H]                    ; 32C8 _ 8B. 45, 10
        shr     eax, 24                                 ; 32CB _ C1. E8, 18
        mov     edx, eax                                ; 32CE _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 32D0 _ 8B. 45, 08
        mov     byte [eax+7H], dl                       ; 32D3 _ 88. 50, 07
        pop     ebp                                     ; 32D6 _ 5D
        ret                                             ; 32D7 _ C3
; segment_descriptor End of function

multi_task_init:; Function begin
        push    ebp                                     ; 32D8 _ 55
        mov     ebp, esp                                ; 32D9 _ 89. E5
        sub     esp, 24                                 ; 32DB _ 83. EC, 18
        call    timer_alloc                             ; 32DE _ E8, FFFFFFFC(rel)
        mov     dword [multi_timer], eax                ; 32E3 _ A3, 00002304(d)
        mov     eax, dword [multi_timer]                ; 32E8 _ A1, 00002304(d)
        mov     dword [esp+4H], 100                     ; 32ED _ C7. 44 24, 04, 00000064
        mov     dword [esp], eax                        ; 32F5 _ 89. 04 24
        call    timer_settime                           ; 32F8 _ E8, FFFFFFFC(rel)
        mov     dword [multi_task_address], 64          ; 32FD _ C7. 05, 00002308(d), 00000040
        leave                                           ; 3307 _ C9
        ret                                             ; 3308 _ C3
; multi_task_init End of function

multi_task_switch:; Function begin
        push    ebp                                     ; 3309 _ 55
        mov     ebp, esp                                ; 330A _ 89. E5
        sub     esp, 24                                 ; 330C _ 83. EC, 18
        mov     eax, dword [multi_task_address]         ; 330F _ A1, 00002308(d)
        cmp     eax, 64                                 ; 3314 _ 83. F8, 40
        jnz     ?_164                                   ; 3317 _ 75, 0C
        mov     dword [multi_task_address], 80          ; 3319 _ C7. 05, 00002308(d), 00000050
        jmp     ?_165                                   ; 3323 _ EB, 0A

?_164:  mov     dword [multi_task_address], 64          ; 3325 _ C7. 05, 00002308(d), 00000040
?_165:  mov     eax, dword [multi_timer]                ; 332F _ A1, 00002304(d)
        mov     dword [esp+4H], 100                     ; 3334 _ C7. 44 24, 04, 00000064
        mov     dword [esp], eax                        ; 333C _ 89. 04 24
        call    timer_settime                           ; 333F _ E8, FFFFFFFC(rel)
        mov     eax, dword [multi_task_address]         ; 3344 _ A1, 00002308(d)
        mov     dword [esp+4H], eax                     ; 3349 _ 89. 44 24, 04
        mov     dword [esp], 0                          ; 334D _ C7. 04 24, 00000000
        call    farjmp                                  ; 3354 _ E8, FFFFFFFC(rel)
        leave                                           ; 3359 _ C9
        ret                                             ; 335A _ C3
; multi_task_switch End of function



?_166:                                                  ; byte
        db 77H, 69H, 6EH, 64H, 6FH, 77H, 00H            ; 0000 _ window.

?_167:                                                  ; byte
        db 41H, 00H                                     ; 0007 _ A.

?_168:                                                  ; byte
        db 65H, 6EH, 74H, 65H, 72H, 20H, 74H, 61H       ; 0009 _ enter ta
        db 73H, 6BH, 20H, 62H, 00H                      ; 0011 _ sk b.

?_169:                                                  ; byte
        db 42H, 00H                                     ; 0016 _ B.

?_170:                                                  ; byte
        db 70H, 61H, 67H, 65H, 20H, 69H, 73H, 3AH       ; 0018 _ page is:
        db 20H, 00H                                     ; 0020 _  .

?_171:                                                  ; byte
        db 42H, 61H, 73H, 65H, 41H, 64H, 64H, 72H       ; 0022 _ BaseAddr
        db 4CH, 3AH, 20H, 00H                           ; 002A _ L: .

?_172:                                                  ; byte
        db 42H, 61H, 73H, 65H, 41H, 64H, 64H, 72H       ; 002E _ BaseAddr
        db 48H, 3AH, 20H, 00H                           ; 0036 _ H: .

?_173:                                                  ; byte
        db 6CH, 65H, 6EH, 67H, 74H, 68H, 4CH, 6FH       ; 003A _ lengthLo
        db 77H, 3AH, 20H, 00H                           ; 0042 _ w: .

?_174:                                                  ; byte
        db 6CH, 65H, 6EH, 67H, 74H, 68H, 48H, 69H       ; 0046 _ lengthHi
        db 67H, 68H, 3AH, 20H, 00H                      ; 004E _ gh: .

?_175:                                                  ; byte
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

?_176:  db 00H                                          ; 02A2 _ .

?_177:  db 00H, 00H                                     ; 02A3 _ ..



sheet_control:                                          ; dword
        resd    1                                       ; 0000

back_sheet:                                             ; dword
        resd    1                                       ; 0004

mouse_sheet:                                            ; dword
        resd    1                                       ; 0008

timerinfo1.1694:                                        ; byte
        resb    24                                      ; 000C

timerbuf1.1697:                                         ; qword
        resq    1                                       ; 0024

timerinfo2.1695:                                        ; byte
        resb    24                                      ; 002C

timerbuf2.1698:                                         ; qword
        resq    1                                       ; 0044

timerinfo3.1696:                                        ; byte
        resb    24                                      ; 004C

timerbuf3.1699:                                         ; qword
        resq    3                                       ; 0064
        resb    4                                       ; 007C

tss_a.1703:                                             ; byte
        resb    72                                      ; 0080

?_178:  resd    1                                       ; 00C8

?_179:  resd    1                                       ; 00CC

?_180:  resd    1                                       ; 00D0

?_181:  resd    1                                       ; 00D4

?_182:  resd    1                                       ; 00D8

?_183:  resd    1                                       ; 00DC

?_184:  resd    1                                       ; 00E0

?_185:  resd    7                                       ; 00E4

tss_b.1704:                                             ; byte
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

multi_timer:                                            ; dword
        resd    1                                       ; 2304

multi_task_address:                                     ; dword
        resd    1                                       ; 2308


