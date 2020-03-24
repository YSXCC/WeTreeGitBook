; Disassembly of file: ckernel.o
; Fri Jan 12 16:26:09 2018
; Mode: 32 bits
; Syntax: YASM/NASM
; Instruction set: Pentium Pro






CMain:  ; Function begin
        push    ebp                                     ; 0000 _ 55
        mov     ebp, esp                                ; 0001 _ 89. E5
        push    ebx                                     ; 0003 _ 53
        sub     esp, 100                                ; 0004 _ 83. EC, 64
        sub     esp, 12                                 ; 0007 _ 83. EC, 0C
        push    bootInfo                                ; 000A _ 68, 00000014(d)
        call    initBootInfo                            ; 000F _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0014 _ 83. C4, 10
        mov     eax, dword [bootInfo]                   ; 0017 _ A1, 00000014(d)
        mov     dword [ebp-18H], eax                    ; 001C _ 89. 45, E8
        movzx   eax, word [?_452]                       ; 001F _ 0F B7. 05, 00000018(d)
        cwde                                            ; 0026 _ 98
        mov     dword [xsize], eax                      ; 0027 _ A3, 0000013C(d)
        movzx   eax, word [?_453]                       ; 002C _ 0F B7. 05, 0000001A(d)
        cwde                                            ; 0033 _ 98
        mov     dword [ysize], eax                      ; 0034 _ A3, 00000140(d)
        call    init_pit                                ; 0039 _ E8, FFFFFFFC(rel)
        push    0                                       ; 003E _ 6A, 00
        push    timerbuf                                ; 0040 _ 68, 0000012C(d)
        push    8                                       ; 0045 _ 6A, 08
        push    timerinfo                               ; 0047 _ 68, 00000110(d)
        call    fifo8_init                              ; 004C _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0051 _ 83. C4, 10
        call    timer_alloc                             ; 0054 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-1CH], eax                    ; 0059 _ 89. 45, E4
        sub     esp, 4                                  ; 005C _ 83. EC, 04
        push    10                                      ; 005F _ 6A, 0A
        push    timerinfo                               ; 0061 _ 68, 00000110(d)
        push    dword [ebp-1CH]                         ; 0066 _ FF. 75, E4
        call    timer_init                              ; 0069 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 006E _ 83. C4, 10
        sub     esp, 8                                  ; 0071 _ 83. EC, 08
        push    100                                     ; 0074 _ 6A, 64
        push    dword [ebp-1CH]                         ; 0076 _ FF. 75, E4
        call    timer_settime                           ; 0079 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 007E _ 83. C4, 10
        call    timer_alloc                             ; 0081 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-20H], eax                    ; 0086 _ 89. 45, E0
        sub     esp, 4                                  ; 0089 _ 83. EC, 04
        push    2                                       ; 008C _ 6A, 02
        push    timerinfo                               ; 008E _ 68, 00000110(d)
        push    dword [ebp-20H]                         ; 0093 _ FF. 75, E0
        call    timer_init                              ; 0096 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 009B _ 83. C4, 10
        sub     esp, 8                                  ; 009E _ 83. EC, 08
        push    300                                     ; 00A1 _ 68, 0000012C
        push    dword [ebp-20H]                         ; 00A6 _ FF. 75, E0
        call    timer_settime                           ; 00A9 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 00AE _ 83. C4, 10
        call    timer_alloc                             ; 00B1 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-24H], eax                    ; 00B6 _ 89. 45, DC
        sub     esp, 4                                  ; 00B9 _ 83. EC, 04
        push    1                                       ; 00BC _ 6A, 01
        push    timerinfo                               ; 00BE _ 68, 00000110(d)
        push    dword [ebp-24H]                         ; 00C3 _ FF. 75, DC
        call    timer_init                              ; 00C6 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 00CB _ 83. C4, 10
        sub     esp, 8                                  ; 00CE _ 83. EC, 08
        push    50                                      ; 00D1 _ 6A, 32
        push    dword [ebp-24H]                         ; 00D3 _ FF. 75, DC
        call    timer_settime                           ; 00D6 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 00DB _ 83. C4, 10
        push    0                                       ; 00DE _ 6A, 00
        push    keybuf                                  ; 00E0 _ 68, 00000060(d)
        push    32                                      ; 00E5 _ 6A, 20
        push    keyinfo                                 ; 00E7 _ 68, 0000001C(d)
        call    fifo8_init                              ; 00EC _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 00F1 _ 83. C4, 10
        push    0                                       ; 00F4 _ 6A, 00
        push    mousebuf                                ; 00F6 _ 68, 00000080(d)
        push    128                                     ; 00FB _ 68, 00000080
        push    mouseinfo                               ; 0100 _ 68, 00000038(d)
        call    fifo8_init                              ; 0105 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 010A _ 83. C4, 10
        call    init_palette                            ; 010D _ E8, FFFFFFFC(rel)
        call    init_keyboard                           ; 0112 _ E8, FFFFFFFC(rel)
        call    get_memory_block_count                  ; 0117 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-28H], eax                    ; 011C _ 89. 45, D8
        call    get_adr_buffer                          ; 011F _ E8, FFFFFFFC(rel)
        mov     dword [ebp-2CH], eax                    ; 0124 _ 89. 45, D4
        mov     eax, dword [memman]                     ; 0127 _ A1, 00000000(d)
        sub     esp, 12                                 ; 012C _ 83. EC, 0C
        push    eax                                     ; 012F _ 50
        call    memman_init                             ; 0130 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0135 _ 83. C4, 10
        mov     eax, dword [memman]                     ; 0138 _ A1, 00000000(d)
        sub     esp, 4                                  ; 013D _ 83. EC, 04
        push    1072594944                              ; 0140 _ 68, 3FEE8000
        push    16809984                                ; 0145 _ 68, 01008000
        push    eax                                     ; 014A _ 50
        call    memman_free                             ; 014B _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0150 _ 83. C4, 10
        mov     ecx, dword [ysize]                      ; 0153 _ 8B. 0D, 00000140(d)
        mov     edx, dword [xsize]                      ; 0159 _ 8B. 15, 0000013C(d)
        mov     eax, dword [memman]                     ; 015F _ A1, 00000000(d)
        push    ecx                                     ; 0164 _ 51
        push    edx                                     ; 0165 _ 52
        push    dword [ebp-18H]                         ; 0166 _ FF. 75, E8
        push    eax                                     ; 0169 _ 50
        call    shtctl_init                             ; 016A _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 016F _ 83. C4, 10
        mov     dword [shtctl], eax                     ; 0172 _ A3, 00000284(d)
        mov     eax, dword [shtctl]                     ; 0177 _ A1, 00000284(d)
        sub     esp, 12                                 ; 017C _ 83. EC, 0C
        push    eax                                     ; 017F _ 50
        call    sheet_alloc                             ; 0180 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0185 _ 83. C4, 10
        mov     dword [sht_back], eax                   ; 0188 _ A3, 00000288(d)
        mov     eax, dword [shtctl]                     ; 018D _ A1, 00000284(d)
        sub     esp, 12                                 ; 0192 _ 83. EC, 0C
        push    eax                                     ; 0195 _ 50
        call    sheet_alloc                             ; 0196 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 019B _ 83. C4, 10
        mov     dword [sht_mouse], eax                  ; 019E _ A3, 0000028C(d)
        mov     edx, dword [xsize]                      ; 01A3 _ 8B. 15, 0000013C(d)
        mov     eax, dword [ysize]                      ; 01A9 _ A1, 00000140(d)
        imul    edx, eax                                ; 01AE _ 0F AF. D0
        mov     eax, dword [memman]                     ; 01B1 _ A1, 00000000(d)
        sub     esp, 8                                  ; 01B6 _ 83. EC, 08
        push    edx                                     ; 01B9 _ 52
        push    eax                                     ; 01BA _ 50
        call    memman_alloc_4k                         ; 01BB _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 01C0 _ 83. C4, 10
        mov     dword [buf_back], eax                   ; 01C3 _ A3, 00000144(d)
        mov     ebx, dword [ysize]                      ; 01C8 _ 8B. 1D, 00000140(d)
        mov     ecx, dword [xsize]                      ; 01CE _ 8B. 0D, 0000013C(d)
        mov     edx, dword [buf_back]                   ; 01D4 _ 8B. 15, 00000144(d)
        mov     eax, dword [sht_back]                   ; 01DA _ A1, 00000288(d)
        sub     esp, 12                                 ; 01DF _ 83. EC, 0C
        push    99                                      ; 01E2 _ 6A, 63
        push    ebx                                     ; 01E4 _ 53
        push    ecx                                     ; 01E5 _ 51
        push    edx                                     ; 01E6 _ 52
        push    eax                                     ; 01E7 _ 50
        call    sheet_setbuf                            ; 01E8 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 01ED _ 83. C4, 20
        mov     eax, dword [sht_mouse]                  ; 01F0 _ A1, 0000028C(d)
        sub     esp, 12                                 ; 01F5 _ 83. EC, 0C
        push    99                                      ; 01F8 _ 6A, 63
        push    16                                      ; 01FA _ 6A, 10
        push    16                                      ; 01FC _ 6A, 10
        push    buf_mouse                               ; 01FE _ 68, 00000180(d)
        push    eax                                     ; 0203 _ 50
        call    sheet_setbuf                            ; 0204 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0209 _ 83. C4, 20
        mov     ecx, dword [ysize]                      ; 020C _ 8B. 0D, 00000140(d)
        mov     edx, dword [xsize]                      ; 0212 _ 8B. 15, 0000013C(d)
        mov     eax, dword [buf_back]                   ; 0218 _ A1, 00000144(d)
        sub     esp, 4                                  ; 021D _ 83. EC, 04
        push    ecx                                     ; 0220 _ 51
        push    edx                                     ; 0221 _ 52
        push    eax                                     ; 0222 _ 50
        call    init_screen8                            ; 0223 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0228 _ 83. C4, 10
        sub     esp, 8                                  ; 022B _ 83. EC, 08
        push    99                                      ; 022E _ 6A, 63
        push    buf_mouse                               ; 0230 _ 68, 00000180(d)
        call    init_mouse_cursor                       ; 0235 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 023A _ 83. C4, 10
        mov     edx, dword [sht_back]                   ; 023D _ 8B. 15, 00000288(d)
        mov     eax, dword [shtctl]                     ; 0243 _ A1, 00000284(d)
        push    0                                       ; 0248 _ 6A, 00
        push    0                                       ; 024A _ 6A, 00
        push    edx                                     ; 024C _ 52
        push    eax                                     ; 024D _ 50
        call    sheet_slide                             ; 024E _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0253 _ 83. C4, 10
        mov     eax, dword [xsize]                      ; 0256 _ A1, 0000013C(d)
        sub     eax, 16                                 ; 025B _ 83. E8, 10
        mov     edx, eax                                ; 025E _ 89. C2
        shr     edx, 31                                 ; 0260 _ C1. EA, 1F
        add     eax, edx                                ; 0263 _ 01. D0
        sar     eax, 1                                  ; 0265 _ D1. F8
        mov     dword [mx], eax                         ; 0267 _ A3, 00000134(d)
        mov     eax, dword [ysize]                      ; 026C _ A1, 00000140(d)
        sub     eax, 44                                 ; 0271 _ 83. E8, 2C
        mov     edx, eax                                ; 0274 _ 89. C2
        shr     edx, 31                                 ; 0276 _ C1. EA, 1F
        add     eax, edx                                ; 0279 _ 01. D0
        sar     eax, 1                                  ; 027B _ D1. F8
        mov     dword [my], eax                         ; 027D _ A3, 00000138(d)
        mov     ebx, dword [my]                         ; 0282 _ 8B. 1D, 00000138(d)
        mov     ecx, dword [mx]                         ; 0288 _ 8B. 0D, 00000134(d)
        mov     edx, dword [sht_mouse]                  ; 028E _ 8B. 15, 0000028C(d)
        mov     eax, dword [shtctl]                     ; 0294 _ A1, 00000284(d)
        push    ebx                                     ; 0299 _ 53
        push    ecx                                     ; 029A _ 51
        push    edx                                     ; 029B _ 52
        push    eax                                     ; 029C _ 50
        call    sheet_slide                             ; 029D _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 02A2 _ 83. C4, 10
        mov     dword [ebp-0CH], 8                      ; 02A5 _ C7. 45, F4, 00000008
        mov     dword [ebp-10H], 7                      ; 02AC _ C7. 45, F0, 00000007
        mov     eax, dword [shtctl]                     ; 02B3 _ A1, 00000284(d)
        sub     esp, 8                                  ; 02B8 _ 83. EC, 08
        push    ?_422                                   ; 02BB _ 68, 00000000(d)
        push    eax                                     ; 02C0 _ 50
        call    message_box                             ; 02C1 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 02C6 _ 83. C4, 10
        mov     dword [shtMsgBox], eax                  ; 02C9 _ A3, 00000280(d)
        mov     edx, dword [sht_back]                   ; 02CE _ 8B. 15, 00000288(d)
        mov     eax, dword [shtctl]                     ; 02D4 _ A1, 00000284(d)
        sub     esp, 4                                  ; 02D9 _ 83. EC, 04
        push    0                                       ; 02DC _ 6A, 00
        push    edx                                     ; 02DE _ 52
        push    eax                                     ; 02DF _ 50
        call    sheet_updown                            ; 02E0 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 02E5 _ 83. C4, 10
        mov     edx, dword [sht_mouse]                  ; 02E8 _ 8B. 15, 0000028C(d)
        mov     eax, dword [shtctl]                     ; 02EE _ A1, 00000284(d)
        sub     esp, 4                                  ; 02F3 _ 83. EC, 04
        push    4                                       ; 02F6 _ 6A, 04
        push    edx                                     ; 02F8 _ 52
        push    eax                                     ; 02F9 _ 50
        call    sheet_updown                            ; 02FA _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 02FF _ 83. C4, 10
        call    io_sti                                  ; 0302 _ E8, FFFFFFFC(rel)
        sub     esp, 12                                 ; 0307 _ 83. EC, 0C
        push    mdec                                    ; 030A _ 68, 00000100(d)
        call    enable_mouse                            ; 030F _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0314 _ 83. C4, 10
        mov     eax, dword [memman]                     ; 0317 _ A1, 00000000(d)
        sub     esp, 12                                 ; 031C _ 83. EC, 0C
        push    eax                                     ; 031F _ 50
        call    task_init                               ; 0320 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0325 _ 83. C4, 10
        mov     dword [task_a.1848], eax                ; 0328 _ A3, 0000029C(d)
        mov     eax, dword [task_a.1848]                ; 032D _ A1, 0000029C(d)
        mov     dword [?_454], eax                      ; 0332 _ A3, 00000034(d)
        mov     eax, dword [task_a.1848]                ; 0337 _ A1, 0000029C(d)
        mov     dword [task_main], eax                  ; 033C _ A3, 00000294(d)
        mov     eax, dword [task_a.1848]                ; 0341 _ A1, 0000029C(d)
        sub     esp, 4                                  ; 0346 _ 83. EC, 04
        push    0                                       ; 0349 _ 6A, 00
        push    0                                       ; 034B _ 6A, 00
        push    eax                                     ; 034D _ 50
        call    task_run                                ; 034E _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0353 _ 83. C4, 10
        sub     esp, 12                                 ; 0356 _ 83. EC, 0C
        push    0                                       ; 0359 _ 6A, 00
        call    launch_console                          ; 035B _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0360 _ 83. C4, 10
        mov     dword [ebp-30H], eax                    ; 0363 _ 89. 45, D0
        mov     eax, dword [console_count]              ; 0366 _ A1, 00000000(d)
        add     eax, 1                                  ; 036B _ 83. C0, 01
        mov     dword [console_count], eax              ; 036E _ A3, 00000000(d)
        mov     eax, dword [shtctl]                     ; 0373 _ A1, 00000284(d)
        push    2                                       ; 0378 _ 6A, 02
        push    8                                       ; 037A _ 6A, 08
        push    dword [ebp-30H]                         ; 037C _ FF. 75, D0
        push    eax                                     ; 037F _ 50
        call    sheet_slide                             ; 0380 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0385 _ 83. C4, 10
        mov     eax, dword [shtctl]                     ; 0388 _ A1, 00000284(d)
        sub     esp, 4                                  ; 038D _ 83. EC, 04
        push    2                                       ; 0390 _ 6A, 02
        push    dword [ebp-30H]                         ; 0392 _ FF. 75, D0
        push    eax                                     ; 0395 _ 50
        call    sheet_updown                            ; 0396 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 039B _ 83. C4, 10
        mov     dword [ebp-34H], 0                      ; 039E _ C7. 45, CC, 00000000
        mov     dword [ebp-38H], 0                      ; 03A5 _ C7. 45, C8, 00000000
        mov     dword [ebp-3CH], 0                      ; 03AC _ C7. 45, C4, 00000000
        mov     dword [ebp-40H], 0                      ; 03B3 _ C7. 45, C0, 00000000
        mov     dword [ebp-44H], 0                      ; 03BA _ C7. 45, BC, 00000000
        mov     dword [ebp-14H], 0                      ; 03C1 _ C7. 45, EC, 00000000
        mov     dword [ebp-48H], 0                      ; 03C8 _ C7. 45, B8, 00000000
        mov     dword [ebp-4CH], 0                      ; 03CF _ C7. 45, B4, 00000000
?_001:  sub     esp, 12                                 ; 03D6 _ 83. EC, 0C
        push    keyinfo                                 ; 03D9 _ 68, 0000001C(d)
        call    fifo8_status                            ; 03DE _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 03E3 _ 83. C4, 10
        mov     ebx, eax                                ; 03E6 _ 89. C3
        sub     esp, 12                                 ; 03E8 _ 83. EC, 0C
        push    mouseinfo                               ; 03EB _ 68, 00000038(d)
        call    fifo8_status                            ; 03F0 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 03F5 _ 83. C4, 10
        add     ebx, eax                                ; 03F8 _ 01. C3
        sub     esp, 12                                 ; 03FA _ 83. EC, 0C
        push    timerinfo                               ; 03FD _ 68, 00000110(d)
        call    fifo8_status                            ; 0402 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0407 _ 83. C4, 10
        add     eax, ebx                                ; 040A _ 01. D8
        test    eax, eax                                ; 040C _ 85. C0
        jnz near      ?_002                                   ; 040e _ 75, 0a
        call    io_sti                                  ; 0410 _ E8, FFFFFFFC(rel)
        jmp     ?_014                                   ; 0415 _ E9, 00000397

?_002:  sub     esp, 12                                 ; 041A _ 83. EC, 0C
        push    keyinfo                                 ; 041D _ 68, 0000001C(d)
        call    fifo8_status                            ; 0422 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0427 _ 83. C4, 10
        test    eax, eax                                ; 042A _ 85. C0
        je near       ?_013                                   ; 042c _ 0f 84, 0000034c
        call    io_sti                                  ; 0432 _ E8, FFFFFFFC(rel)
        sub     esp, 12                                 ; 0437 _ 83. EC, 0C
        push    keyinfo                                 ; 043A _ 68, 0000001C(d)
        call    fifo8_get                               ; 043F _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0444 _ 83. C4, 10
        mov     dword [ebp-34H], eax                    ; 0447 _ 89. 45, CC
        mov     eax, dword [key_shift]                  ; 044A _ A1, 00000000(d)
        test    eax, eax                                ; 044F _ 85. C0
        jz near       ?_003                                   ; 0451 _ 74, 58
        cmp     dword [ebp-34H], 17                     ; 0453 _ 83. 7D, CC, 11
        jnz near      ?_003                                   ; 0457 _ 75, 52
        mov     eax, dword [console_count]              ; 0459 _ A1, 00000000(d)
        sub     esp, 12                                 ; 045E _ 83. EC, 0C
        push    eax                                     ; 0461 _ 50
        call    launch_console                          ; 0462 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0467 _ 83. C4, 10
        mov     dword [ebp-30H], eax                    ; 046A _ 89. 45, D0
        mov     eax, dword [shtctl]                     ; 046D _ A1, 00000284(d)
        push    176                                     ; 0472 _ 68, 000000B0
        push    156                                     ; 0477 _ 68, 0000009C
        push    dword [ebp-30H]                         ; 047C _ FF. 75, D0
        push    eax                                     ; 047F _ 50
        call    sheet_slide                             ; 0480 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0485 _ 83. C4, 10
        mov     eax, dword [shtctl]                     ; 0488 _ A1, 00000284(d)
        sub     esp, 4                                  ; 048D _ 83. EC, 04
        push    1                                       ; 0490 _ 6A, 01
        push    dword [ebp-30H]                         ; 0492 _ FF. 75, D0
        push    eax                                     ; 0495 _ 50
        call    sheet_updown                            ; 0496 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 049B _ 83. C4, 10
        mov     eax, dword [console_count]              ; 049E _ A1, 00000000(d)
        add     eax, 1                                  ; 04A3 _ 83. C0, 01
        mov     dword [console_count], eax              ; 04A6 _ A3, 00000000(d)
?_003:  cmp     dword [ebp-34H], 255                    ; 04AB _ 81. 7D, CC, 000000FF
        jnz near      ?_004                                   ; 04b2 _ 75, 1f
        mov     eax, dword [current_console_task]       ; 04B4 _ A1, 00000298(d)
        test    eax, eax                                ; 04B9 _ 85. C0
        jz near       ?_004                                   ; 04bb _ 74, 16
        mov     eax, dword [current_console_task]       ; 04BD _ A1, 00000298(d)
        sub     esp, 12                                 ; 04C2 _ 83. EC, 0C
        push    eax                                     ; 04C5 _ 50
        call    close_console                           ; 04C6 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 04CB _ 83. C4, 10
        jmp     ?_018                                   ; 04CE _ E9, 000003A5

?_004:  sub     esp, 12                                 ; 04D3 _ 83. EC, 0C
        push    dword [ebp-34H]                         ; 04D6 _ FF. 75, CC
        call    transferScanCode                        ; 04D9 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 04DE _ 83. C4, 10
        cmp     dword [ebp-34H], 16                     ; 04E1 _ 83. 7D, CC, 10
        jnz near      ?_005                                   ; 04e5 _ 75, 26
        mov     eax, dword [shtctl]                     ; 04E7 _ A1, 00000284(d)
        mov     eax, dword [eax+10H]                    ; 04EC _ 8B. 40, 10
        lea     ecx, [eax-1H]                           ; 04EF _ 8D. 48, FF
        mov     eax, dword [shtctl]                     ; 04F2 _ A1, 00000284(d)
        mov     edx, dword [eax+18H]                    ; 04F7 _ 8B. 50, 18
        mov     eax, dword [shtctl]                     ; 04FA _ A1, 00000284(d)
        sub     esp, 4                                  ; 04FF _ 83. EC, 04
        push    ecx                                     ; 0502 _ 51
        push    edx                                     ; 0503 _ 52
        push    eax                                     ; 0504 _ 50
        call    sheet_updown                            ; 0505 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 050A _ 83. C4, 10
?_005:  cmp     dword [ebp-34H], 15                     ; 050D _ 83. 7D, CC, 0F
        jne near      ?_011                                   ; 0511 _ 0f 85, 0000014e
        mov     dword [ebp-50H], -1                     ; 0517 _ C7. 45, B0, FFFFFFFF
        cmp     dword [ebp-14H], 0                      ; 051E _ 83. 7D, EC, 00
        jne near      ?_009                                   ; 0522 _ 0f 85, 0000008e
        mov     dword [ebp-14H], 1                      ; 0528 _ C7. 45, EC, 00000001
        mov     eax, dword [current_console]            ; 052F _ A1, 00000000(d)
        cmp     eax, 1                                  ; 0534 _ 83. F8, 01
        jnz near      ?_006                                   ; 0537 _ 75, 0c
        mov     dword [current_console], 0              ; 0539 _ C7. 05, 00000000(d), 00000000
        jmp     ?_007                                   ; 0543 _ EB, 0A

?_006:  mov     dword [current_console], 1              ; 0545 _ C7. 05, 00000000(d), 00000001
?_007:  mov     edx, dword [shtMsgBox]                  ; 054F _ 8B. 15, 00000280(d)
        mov     eax, dword [shtctl]                     ; 0555 _ A1, 00000284(d)
        push    0                                       ; 055A _ 6A, 00
        push    ?_423                                   ; 055C _ 68, 00000008(d)
        push    edx                                     ; 0561 _ 52
        push    eax                                     ; 0562 _ 50
        call    make_wtitle8                            ; 0563 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0568 _ 83. C4, 10
        mov     eax, dword [current_console_task]       ; 056B _ A1, 00000298(d)
        test    eax, eax                                ; 0570 _ 85. C0
        jz near       ?_008                                   ; 0572 _ 74, 21
        mov     eax, dword [current_console_task]       ; 0574 _ A1, 00000298(d)
        mov     edx, dword [eax+0B4H]                   ; 0579 _ 8B. 90, 000000B4
        mov     eax, dword [shtctl]                     ; 057F _ A1, 00000284(d)
        push    1                                       ; 0584 _ 6A, 01
        push    ?_424                                   ; 0586 _ 68, 0000000F(d)
        push    edx                                     ; 058B _ 52
        push    eax                                     ; 058C _ 50
        call    make_wtitle8                            ; 058D _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0592 _ 83. C4, 10
?_008:  mov     edx, dword [shtMsgBox]                  ; 0595 _ 8B. 15, 00000280(d)
        mov     eax, dword [shtctl]                     ; 059B _ A1, 00000284(d)
        sub     esp, 12                                 ; 05A0 _ 83. EC, 0C
        push    7                                       ; 05A3 _ 6A, 07
        push    28                                      ; 05A5 _ 6A, 1C
        push    dword [ebp-0CH]                         ; 05A7 _ FF. 75, F4
        push    edx                                     ; 05AA _ 52
        push    eax                                     ; 05AB _ 50
        call    set_cursor                              ; 05AC _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 05B1 _ 83. C4, 20
        jmp     ?_010                                   ; 05B4 _ EB, 4D

?_009:  mov     dword [ebp-14H], 0                      ; 05B6 _ C7. 45, EC, 00000000
        mov     edx, dword [shtMsgBox]                  ; 05BD _ 8B. 15, 00000280(d)
        mov     eax, dword [shtctl]                     ; 05C3 _ A1, 00000284(d)
        push    1                                       ; 05C8 _ 6A, 01
        push    ?_423                                   ; 05CA _ 68, 00000008(d)
        push    edx                                     ; 05CF _ 52
        push    eax                                     ; 05D0 _ 50
        call    make_wtitle8                            ; 05D1 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 05D6 _ 83. C4, 10
        mov     eax, dword [current_console_task]       ; 05D9 _ A1, 00000298(d)
        test    eax, eax                                ; 05DE _ 85. C0
        jz near       ?_010                                   ; 05e0 _ 74, 21
        mov     eax, dword [current_console_task]       ; 05E2 _ A1, 00000298(d)
        mov     edx, dword [eax+0B4H]                   ; 05E7 _ 8B. 90, 000000B4
        mov     eax, dword [shtctl]                     ; 05ED _ A1, 00000284(d)
        push    0                                       ; 05F2 _ 6A, 00
        push    ?_424                                   ; 05F4 _ 68, 0000000F(d)
        push    edx                                     ; 05F9 _ 52
        push    eax                                     ; 05FA _ 50
        call    make_wtitle8                            ; 05FB _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0600 _ 83. C4, 10
?_010:  mov     eax, dword [shtMsgBox]                  ; 0603 _ A1, 00000280(d)
        mov     ecx, dword [eax+4H]                     ; 0608 _ 8B. 48, 04
        mov     edx, dword [shtMsgBox]                  ; 060B _ 8B. 15, 00000280(d)
        mov     eax, dword [shtctl]                     ; 0611 _ A1, 00000284(d)
        sub     esp, 8                                  ; 0616 _ 83. EC, 08
        push    21                                      ; 0619 _ 6A, 15
        push    ecx                                     ; 061B _ 51
        push    0                                       ; 061C _ 6A, 00
        push    0                                       ; 061E _ 6A, 00
        push    edx                                     ; 0620 _ 52
        push    eax                                     ; 0621 _ 50
        call    sheet_refresh                           ; 0622 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0627 _ 83. C4, 20
        mov     eax, dword [current_console_task]       ; 062A _ A1, 00000298(d)
        test    eax, eax                                ; 062F _ 85. C0
        jz near       ?_011                                   ; 0631 _ 74, 32
        mov     eax, dword [current_console_task]       ; 0633 _ A1, 00000298(d)
        mov     eax, dword [eax+0B4H]                   ; 0638 _ 8B. 80, 000000B4
        mov     ecx, dword [eax+4H]                     ; 063E _ 8B. 48, 04
        mov     eax, dword [current_console_task]       ; 0641 _ A1, 00000298(d)
        mov     edx, dword [eax+0B4H]                   ; 0646 _ 8B. 90, 000000B4
        mov     eax, dword [shtctl]                     ; 064C _ A1, 00000284(d)
        sub     esp, 8                                  ; 0651 _ 83. EC, 08
        push    21                                      ; 0654 _ 6A, 15
        push    ecx                                     ; 0656 _ 51
        push    0                                       ; 0657 _ 6A, 00
        push    0                                       ; 0659 _ 6A, 00
        push    edx                                     ; 065B _ 52
        push    eax                                     ; 065C _ 50
        call    sheet_refresh                           ; 065D _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0662 _ 83. C4, 20
?_011:  cmp     dword [ebp-14H], 0                      ; 0665 _ 83. 7D, EC, 00
        jne near      ?_012                                   ; 0669 _ 0f 85, 000000b1
        sub     esp, 12                                 ; 066F _ 83. EC, 0C
        push    dword [ebp-34H]                         ; 0672 _ FF. 75, CC
        call    transferScanCode                        ; 0675 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 067A _ 83. C4, 10
        test    al, al                                  ; 067D _ 84. C0
        je near       ?_014                                   ; 067f _ 0f 84, 0000012c
        cmp     dword [ebp-0CH], 143                    ; 0685 _ 81. 7D, F4, 0000008F
        jg  near      ?_014                                   ; 068c _ 0f 8f, 0000011f
        mov     edx, dword [shtMsgBox]                  ; 0692 _ 8B. 15, 00000280(d)
        mov     eax, dword [shtctl]                     ; 0698 _ A1, 00000284(d)
        sub     esp, 12                                 ; 069D _ 83. EC, 0C
        push    7                                       ; 06A0 _ 6A, 07
        push    28                                      ; 06A2 _ 6A, 1C
        push    dword [ebp-0CH]                         ; 06A4 _ FF. 75, F4
        push    edx                                     ; 06A7 _ 52
        push    eax                                     ; 06A8 _ 50
        call    set_cursor                              ; 06A9 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 06AE _ 83. C4, 20
        sub     esp, 12                                 ; 06B1 _ 83. EC, 0C
        push    dword [ebp-34H]                         ; 06B4 _ FF. 75, CC
        call    transferScanCode                        ; 06B7 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 06BC _ 83. C4, 10
        mov     byte [ebp-51H], al                      ; 06BF _ 88. 45, AF
        movzx   eax, byte [ebp-51H]                     ; 06C2 _ 0F B6. 45, AF
        mov     byte [ebp-66H], al                      ; 06C6 _ 88. 45, 9A
        mov     byte [ebp-65H], 0                       ; 06C9 _ C6. 45, 9B, 00
        mov     edx, dword [shtMsgBox]                  ; 06CD _ 8B. 15, 00000280(d)
        mov     eax, dword [shtctl]                     ; 06D3 _ A1, 00000284(d)
        sub     esp, 8                                  ; 06D8 _ 83. EC, 08
        lea     ecx, [ebp-66H]                          ; 06DB _ 8D. 4D, 9A
        push    ecx                                     ; 06DE _ 51
        push    0                                       ; 06DF _ 6A, 00
        push    28                                      ; 06E1 _ 6A, 1C
        push    dword [ebp-0CH]                         ; 06E3 _ FF. 75, F4
        push    edx                                     ; 06E6 _ 52
        push    eax                                     ; 06E7 _ 50
        call    showString                              ; 06E8 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 06ED _ 83. C4, 20
        add     dword [ebp-0CH], 8                      ; 06F0 _ 83. 45, F4, 08
        mov     dword [ebp-44H], 1                      ; 06F4 _ C7. 45, BC, 00000001
        mov     edx, dword [shtMsgBox]                  ; 06FB _ 8B. 15, 00000280(d)
        mov     eax, dword [shtctl]                     ; 0701 _ A1, 00000284(d)
        sub     esp, 12                                 ; 0706 _ 83. EC, 0C
        push    dword [ebp-10H]                         ; 0709 _ FF. 75, F0
        push    28                                      ; 070C _ 6A, 1C
        push    dword [ebp-0CH]                         ; 070E _ FF. 75, F4
        push    edx                                     ; 0711 _ 52
        push    eax                                     ; 0712 _ 50
        call    set_cursor                              ; 0713 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0718 _ 83. C4, 20
        jmp     ?_014                                   ; 071B _ E9, 00000091

?_012:  sub     esp, 12                                 ; 0720 _ 83. EC, 0C
        push    dword [ebp-34H]                         ; 0723 _ FF. 75, CC
        call    isSpecialKey                            ; 0726 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 072B _ 83. C4, 10
        test    eax, eax                                ; 072E _ 85. C0
        jnz near      ?_014                                   ; 0730 _ 75, 7f
        mov     eax, dword [current_console_task]       ; 0732 _ A1, 00000298(d)
        test    eax, eax                                ; 0737 _ 85. C0
        jz near       ?_014                                   ; 0739 _ 74, 76
        mov     eax, dword [ebp-34H]                    ; 073B _ 8B. 45, CC
        movzx   eax, al                                 ; 073E _ 0F B6. C0
        mov     edx, dword [current_console_task]       ; 0741 _ 8B. 15, 00000298(d)
        add     edx, 16                                 ; 0747 _ 83. C2, 10
        sub     esp, 8                                  ; 074A _ 83. EC, 08
        push    eax                                     ; 074D _ 50
        push    edx                                     ; 074E _ 52
        call    fifo8_put                               ; 074F _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0754 _ 83. C4, 10
        sub     esp, 12                                 ; 0757 _ 83. EC, 0C
        push    keyinfo                                 ; 075A _ 68, 0000001C(d)
        call    fifo8_status                            ; 075F _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0764 _ 83. C4, 10
        test    eax, eax                                ; 0767 _ 85. C0
        jnz near      ?_014                                   ; 0769 _ 75, 46
        mov     eax, dword [task_a.1848]                ; 076B _ A1, 0000029C(d)
        sub     esp, 12                                 ; 0770 _ 83. EC, 0C
        push    eax                                     ; 0773 _ 50
        call    task_sleep                              ; 0774 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0779 _ 83. C4, 10
        jmp     ?_014                                   ; 077C _ EB, 33

?_013:  sub     esp, 12                                 ; 077E _ 83. EC, 0C
        push    mouseinfo                               ; 0781 _ 68, 00000038(d)
        call    fifo8_status                            ; 0786 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 078B _ 83. C4, 10
        test    eax, eax                                ; 078E _ 85. C0
        jz near       ?_014                                   ; 0790 _ 74, 1f
        mov     ecx, dword [sht_mouse]                  ; 0792 _ 8B. 0D, 0000028C(d)
        mov     edx, dword [sht_back]                   ; 0798 _ 8B. 15, 00000288(d)
        mov     eax, dword [shtctl]                     ; 079E _ A1, 00000284(d)
        sub     esp, 4                                  ; 07A3 _ 83. EC, 04
        push    ecx                                     ; 07A6 _ 51
        push    edx                                     ; 07A7 _ 52
        push    eax                                     ; 07A8 _ 50
        call    show_mouse_info                         ; 07A9 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 07AE _ 83. C4, 10
?_014:  sub     esp, 12                                 ; 07B1 _ 83. EC, 0C
        push    timerinfo                               ; 07B4 _ 68, 00000110(d)
        call    fifo8_status                            ; 07B9 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 07BE _ 83. C4, 10
        test    eax, eax                                ; 07C1 _ 85. C0
        je near       ?_018                                   ; 07c3 _ 0f 84, 000000af
        call    io_sti                                  ; 07C9 _ E8, FFFFFFFC(rel)
        sub     esp, 12                                 ; 07CE _ 83. EC, 0C
        push    timerinfo                               ; 07D1 _ 68, 00000110(d)
        call    fifo8_get                               ; 07D6 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 07DB _ 83. C4, 10
        mov     dword [ebp-58H], eax                    ; 07DE _ 89. 45, A8
        cmp     dword [ebp-58H], 0                      ; 07E1 _ 83. 7D, A8, 00
        jz near       ?_015                                   ; 07e5 _ 74, 1e
        sub     esp, 4                                  ; 07E7 _ 83. EC, 04
        push    0                                       ; 07EA _ 6A, 00
        push    timerinfo                               ; 07EC _ 68, 00000110(d)
        push    dword [ebp-24H]                         ; 07F1 _ FF. 75, DC
        call    timer_init                              ; 07F4 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 07F9 _ 83. C4, 10
        mov     dword [ebp-10H], 0                      ; 07FC _ C7. 45, F0, 00000000
        jmp     ?_016                                   ; 0803 _ EB, 1C

?_015:  sub     esp, 4                                  ; 0805 _ 83. EC, 04
        push    1                                       ; 0808 _ 6A, 01
        push    timerinfo                               ; 080A _ 68, 00000110(d)
        push    dword [ebp-24H]                         ; 080F _ FF. 75, DC
        call    timer_init                              ; 0812 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0817 _ 83. C4, 10
        mov     dword [ebp-10H], 7                      ; 081A _ C7. 45, F0, 00000007
?_016:  sub     esp, 8                                  ; 0821 _ 83. EC, 08
        push    50                                      ; 0824 _ 6A, 32
        push    dword [ebp-24H]                         ; 0826 _ FF. 75, DC
        call    timer_settime                           ; 0829 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 082E _ 83. C4, 10
        cmp     dword [ebp-14H], 0                      ; 0831 _ 83. 7D, EC, 00
        jnz near      ?_017                                   ; 0835 _ 75, 22
        mov     edx, dword [shtMsgBox]                  ; 0837 _ 8B. 15, 00000280(d)
        mov     eax, dword [shtctl]                     ; 083D _ A1, 00000284(d)
        sub     esp, 12                                 ; 0842 _ 83. EC, 0C
        push    dword [ebp-10H]                         ; 0845 _ FF. 75, F0
        push    28                                      ; 0848 _ 6A, 1C
        push    dword [ebp-0CH]                         ; 084A _ FF. 75, F4
        push    edx                                     ; 084D _ 52
        push    eax                                     ; 084E _ 50
        call    set_cursor                              ; 084F _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0854 _ 83. C4, 20
        jmp     ?_018                                   ; 0857 _ EB, 1F

?_017:  mov     edx, dword [shtMsgBox]                  ; 0859 _ 8B. 15, 00000280(d)
        mov     eax, dword [shtctl]                     ; 085F _ A1, 00000284(d)
        sub     esp, 12                                 ; 0864 _ 83. EC, 0C
        push    7                                       ; 0867 _ 6A, 07
        push    28                                      ; 0869 _ 6A, 1C
        push    dword [ebp-0CH]                         ; 086B _ FF. 75, F4
        push    edx                                     ; 086E _ 52
        push    eax                                     ; 086F _ 50
        call    set_cursor                              ; 0870 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0875 _ 83. C4, 20
?_018:  jmp     ?_001                                   ; 0878 _ E9, FFFFFB59
; CMain End of function

set_cursor:; Function begin
        push    ebp                                     ; 087D _ 55
        mov     ebp, esp                                ; 087E _ 89. E5
        push    esi                                     ; 0880 _ 56
        push    ebx                                     ; 0881 _ 53
        cmp     dword [ebp+0CH], 0                      ; 0882 _ 83. 7D, 0C, 00
        jnz near      ?_019                                   ; 0886 _ 75, 02
        jmp     ?_020                                   ; 0888 _ EB, 58

?_019:  mov     eax, dword [ebp+14H]                    ; 088A _ 8B. 45, 14
        lea     esi, [eax+0FH]                          ; 088D _ 8D. 70, 0F
        mov     eax, dword [ebp+10H]                    ; 0890 _ 8B. 45, 10
        lea     ebx, [eax+7H]                           ; 0893 _ 8D. 58, 07
        mov     eax, dword [ebp+18H]                    ; 0896 _ 8B. 45, 18
        movzx   ecx, al                                 ; 0899 _ 0F B6. C8
        mov     eax, dword [ebp+0CH]                    ; 089C _ 8B. 45, 0C
        mov     edx, dword [eax+4H]                     ; 089F _ 8B. 50, 04
        mov     eax, dword [ebp+0CH]                    ; 08A2 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 08A5 _ 8B. 00
        sub     esp, 4                                  ; 08A7 _ 83. EC, 04
        push    esi                                     ; 08AA _ 56
        push    ebx                                     ; 08AB _ 53
        push    dword [ebp+14H]                         ; 08AC _ FF. 75, 14
        push    dword [ebp+10H]                         ; 08AF _ FF. 75, 10
        push    ecx                                     ; 08B2 _ 51
        push    edx                                     ; 08B3 _ 52
        push    eax                                     ; 08B4 _ 50
        call    boxfill8                                ; 08B5 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 08BA _ 83. C4, 20
        mov     eax, dword [ebp+14H]                    ; 08BD _ 8B. 45, 14
        lea     edx, [eax+10H]                          ; 08C0 _ 8D. 50, 10
        mov     eax, dword [ebp+10H]                    ; 08C3 _ 8B. 45, 10
        add     eax, 8                                  ; 08C6 _ 83. C0, 08
        sub     esp, 8                                  ; 08C9 _ 83. EC, 08
        push    edx                                     ; 08CC _ 52
        push    eax                                     ; 08CD _ 50
        push    dword [ebp+14H]                         ; 08CE _ FF. 75, 14
        push    dword [ebp+10H]                         ; 08D1 _ FF. 75, 10
        push    dword [ebp+0CH]                         ; 08D4 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 08D7 _ FF. 75, 08
        call    sheet_refresh                           ; 08DA _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 08DF _ 83. C4, 20
?_020:  lea     esp, [ebp-8H]                           ; 08E2 _ 8D. 65, F8
        pop     ebx                                     ; 08E5 _ 5B
        pop     esi                                     ; 08E6 _ 5E
        pop     ebp                                     ; 08E7 _ 5D
        ret                                             ; 08E8 _ C3
; set_cursor End of function

isSpecialKey:; Function begin
        push    ebp                                     ; 08E9 _ 55
        mov     ebp, esp                                ; 08EA _ 89. E5
        sub     esp, 8                                  ; 08EC _ 83. EC, 08
        sub     esp, 12                                 ; 08EF _ 83. EC, 0C
        push    dword [ebp+8H]                          ; 08F2 _ FF. 75, 08
        call    transferScanCode                        ; 08F5 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 08FA _ 83. C4, 10
        cmp     dword [ebp+8H], 58                      ; 08FD _ 83. 7D, 08, 3A
        jz near       ?_021                                   ; 0901 _ 74, 2d
        cmp     dword [ebp+8H], 29                      ; 0903 _ 83. 7D, 08, 1D
        jz near       ?_021                                   ; 0907 _ 74, 27
        cmp     dword [ebp+8H], 186                     ; 0909 _ 81. 7D, 08, 000000BA
        jz near       ?_021                                   ; 0910 _ 74, 1e
        cmp     dword [ebp+8H], 42                      ; 0912 _ 83. 7D, 08, 2A
        jz near       ?_021                                   ; 0916 _ 74, 18
        cmp     dword [ebp+8H], 54                      ; 0918 _ 83. 7D, 08, 36
        jz near       ?_021                                   ; 091c _ 74, 12
        cmp     dword [ebp+8H], 170                     ; 091E _ 81. 7D, 08, 000000AA
        jz near       ?_021                                   ; 0925 _ 74, 09
        cmp     dword [ebp+8H], 182                     ; 0927 _ 81. 7D, 08, 000000B6
        jnz near      ?_022                                   ; 092e _ 75, 07
?_021:  mov     eax, 1                                  ; 0930 _ B8, 00000001
        jmp     ?_023                                   ; 0935 _ EB, 05

?_022:  mov     eax, 0                                  ; 0937 _ B8, 00000000
?_023:  leave                                           ; 093C _ C9
        ret                                             ; 093D _ C3
; isSpecialKey End of function

transferScanCode:; Function begin
        push    ebp                                     ; 093E _ 55
        mov     ebp, esp                                ; 093F _ 89. E5
        sub     esp, 16                                 ; 0941 _ 83. EC, 10
        cmp     dword [ebp+8H], 42                      ; 0944 _ 83. 7D, 08, 2A
        jnz near      ?_024                                   ; 0948 _ 75, 0d
        mov     eax, dword [key_shift]                  ; 094A _ A1, 00000000(d)
        or      eax, 01H                                ; 094F _ 83. C8, 01
        mov     dword [key_shift], eax                  ; 0952 _ A3, 00000000(d)
?_024:  cmp     dword [ebp+8H], 54                      ; 0957 _ 83. 7D, 08, 36
        jnz near      ?_025                                   ; 095b _ 75, 0d
        mov     eax, dword [key_shift]                  ; 095D _ A1, 00000000(d)
        or      eax, 02H                                ; 0962 _ 83. C8, 02
        mov     dword [key_shift], eax                  ; 0965 _ A3, 00000000(d)
?_025:  cmp     dword [ebp+8H], 170                     ; 096A _ 81. 7D, 08, 000000AA
        jnz near      ?_026                                   ; 0971 _ 75, 0d
        mov     eax, dword [key_shift]                  ; 0973 _ A1, 00000000(d)
        and     eax, 0FFFFFFFEH                         ; 0978 _ 83. E0, FE
        mov     dword [key_shift], eax                  ; 097B _ A3, 00000000(d)
?_026:  cmp     dword [ebp+8H], 182                     ; 0980 _ 81. 7D, 08, 000000B6
        jnz near      ?_027                                   ; 0987 _ 75, 0d
        mov     eax, dword [key_shift]                  ; 0989 _ A1, 00000000(d)
        and     eax, 0FFFFFFFDH                         ; 098E _ 83. E0, FD
        mov     dword [key_shift], eax                  ; 0991 _ A3, 00000000(d)
?_027:  cmp     dword [ebp+8H], 58                      ; 0996 _ 83. 7D, 08, 3A
        jnz near      ?_029                                   ; 099a _ 75, 1f
        mov     eax, dword [caps_lock]                  ; 099C _ A1, 00000000(d)
        test    eax, eax                                ; 09A1 _ 85. C0
        jnz near      ?_028                                   ; 09a3 _ 75, 0c
        mov     dword [caps_lock], 1                    ; 09A5 _ C7. 05, 00000000(d), 00000001
        jmp     ?_029                                   ; 09AF _ EB, 0A

?_028:  mov     dword [caps_lock], 0                    ; 09B1 _ C7. 05, 00000000(d), 00000000
?_029:  cmp     dword [ebp+8H], 42                      ; 09BB _ 83. 7D, 08, 2A
        jz near       ?_030                                   ; 09bf _ 74, 24
        cmp     dword [ebp+8H], 54                      ; 09C1 _ 83. 7D, 08, 36
        jz near       ?_030                                   ; 09c5 _ 74, 1e
        cmp     dword [ebp+8H], 170                     ; 09C7 _ 81. 7D, 08, 000000AA
        jz near       ?_030                                   ; 09ce _ 74, 15
        cmp     dword [ebp+8H], 182                     ; 09D0 _ 81. 7D, 08, 000000B6
        jz near       ?_030                                   ; 09d7 _ 74, 0c
        cmp     dword [ebp+8H], 83                      ; 09D9 _ 83. 7D, 08, 53
        jg  near      ?_030                                   ; 09dd _ 7f, 06
        cmp     dword [ebp+8H], 58                      ; 09DF _ 83. 7D, 08, 3A
        jnz near      ?_031                                   ; 09e3 _ 75, 0a
?_030:  mov     eax, 0                                  ; 09E5 _ B8, 00000000
        jmp     ?_036                                   ; 09EA _ E9, 00000089

?_031:  mov     byte [ebp-1H], 0                        ; 09EF _ C6. 45, FF, 00
        mov     eax, dword [key_shift]                  ; 09F3 _ A1, 00000000(d)
        test    eax, eax                                ; 09F8 _ 85. C0
        jnz near      ?_033                                   ; 09fa _ 75, 46
        cmp     dword [ebp+8H], 83                      ; 09FC _ 83. 7D, 08, 53
        jg  near      ?_033                                   ; 0a00 _ 7f, 40
        mov     eax, dword [ebp+8H]                     ; 0A02 _ 8B. 45, 08
        add     eax, keytable                           ; 0A05 _ 05, 00000040(d)
        movzx   eax, byte [eax]                         ; 0A0A _ 0F B6. 00
        test    al, al                                  ; 0A0D _ 84. C0
        jz near       ?_033                                   ; 0a0f _ 74, 31
        mov     eax, dword [ebp+8H]                     ; 0A11 _ 8B. 45, 08
        add     eax, keytable                           ; 0A14 _ 05, 00000040(d)
        movzx   eax, byte [eax]                         ; 0A19 _ 0F B6. 00
        mov     byte [ebp-1H], al                       ; 0A1C _ 88. 45, FF
        cmp     byte [ebp-1H], 64                       ; 0A1F _ 80. 7D, FF, 40
        jle near      ?_032                                   ; 0a23 _ 7e, 1b
        cmp     byte [ebp-1H], 90                       ; 0A25 _ 80. 7D, FF, 5A
        jg  near      ?_032                                   ; 0a29 _ 7f, 15
        mov     eax, dword [caps_lock]                  ; 0A2B _ A1, 00000000(d)
        test    eax, eax                                ; 0A30 _ 85. C0
        jnz near      ?_032                                   ; 0a32 _ 75, 0c
        movzx   eax, byte [ebp-1H]                      ; 0A34 _ 0F B6. 45, FF
        add     eax, 32                                 ; 0A38 _ 83. C0, 20
        mov     byte [ebp-1H], al                       ; 0A3B _ 88. 45, FF
        jmp     ?_035                                   ; 0A3E _ EB, 34

?_032:  jmp     ?_035                                   ; 0A40 _ EB, 32

?_033:  mov     eax, dword [key_shift]                  ; 0A42 _ A1, 00000000(d)
        test    eax, eax                                ; 0A47 _ 85. C0
        jz near       ?_034                                   ; 0a49 _ 74, 25
        cmp     dword [ebp+8H], 127                     ; 0A4B _ 83. 7D, 08, 7F
        jg  near      ?_034                                   ; 0a4f _ 7f, 1f
        mov     eax, dword [ebp+8H]                     ; 0A51 _ 8B. 45, 08
        add     eax, keytable1                          ; 0A54 _ 05, 000000C0(d)
        movzx   eax, byte [eax]                         ; 0A59 _ 0F B6. 00
        test    al, al                                  ; 0A5C _ 84. C0
        jz near       ?_034                                   ; 0a5e _ 74, 10
        mov     eax, dword [ebp+8H]                     ; 0A60 _ 8B. 45, 08
        add     eax, keytable1                          ; 0A63 _ 05, 000000C0(d)
        movzx   eax, byte [eax]                         ; 0A68 _ 0F B6. 00
        mov     byte [ebp-1H], al                       ; 0A6B _ 88. 45, FF
        jmp     ?_035                                   ; 0A6E _ EB, 04

?_034:  mov     byte [ebp-1H], 0                        ; 0A70 _ C6. 45, FF, 00
?_035:  movzx   eax, byte [ebp-1H]                      ; 0A74 _ 0F B6. 45, FF
?_036:  leave                                           ; 0A78 _ C9
        ret                                             ; 0A79 _ C3
; transferScanCode End of function

launch_console:; Function begin
        push    ebp                                     ; 0A7A _ 55
        mov     ebp, esp                                ; 0A7B _ 89. E5
        push    ebx                                     ; 0A7D _ 53
        sub     esp, 132                                ; 0A7E _ 81. EC, 00000084
        mov     dword [ebp-0CH], 0                      ; 0A84 _ C7. 45, F4, 00000000
        mov     eax, dword [shtctl]                     ; 0A8B _ A1, 00000284(d)
        sub     esp, 12                                 ; 0A90 _ 83. EC, 0C
        push    eax                                     ; 0A93 _ 50
        call    sheet_alloc                             ; 0A94 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0A99 _ 83. C4, 10
        mov     dword [ebp-0CH], eax                    ; 0A9C _ 89. 45, F4
        mov     eax, dword [memman]                     ; 0A9F _ A1, 00000000(d)
        sub     esp, 8                                  ; 0AA4 _ 83. EC, 08
        push    42240                                   ; 0AA7 _ 68, 0000A500
        push    eax                                     ; 0AAC _ 50
        call    memman_alloc_4k                         ; 0AAD _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0AB2 _ 83. C4, 10
        mov     dword [ebp-10H], eax                    ; 0AB5 _ 89. 45, F0
        sub     esp, 12                                 ; 0AB8 _ 83. EC, 0C
        push    99                                      ; 0ABB _ 6A, 63
        push    165                                     ; 0ABD _ 68, 000000A5
        push    256                                     ; 0AC2 _ 68, 00000100
        push    dword [ebp-10H]                         ; 0AC7 _ FF. 75, F0
        push    dword [ebp-0CH]                         ; 0ACA _ FF. 75, F4
        call    sheet_setbuf                            ; 0ACD _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0AD2 _ 83. C4, 20
        cmp     dword [ebp+8H], 0                       ; 0AD5 _ 83. 7D, 08, 00
        jle near      ?_037                                   ; 0ad9 _ 7e, 1a
        mov     eax, dword [shtctl]                     ; 0ADB _ A1, 00000284(d)
        push    1                                       ; 0AE0 _ 6A, 01
        push    ?_424                                   ; 0AE2 _ 68, 0000000F(d)
        push    dword [ebp-0CH]                         ; 0AE7 _ FF. 75, F4
        push    eax                                     ; 0AEA _ 50
        call    make_window8                            ; 0AEB _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0AF0 _ 83. C4, 10
        jmp     ?_038                                   ; 0AF3 _ EB, 18

?_037:  mov     eax, dword [shtctl]                     ; 0AF5 _ A1, 00000284(d)
        push    0                                       ; 0AFA _ 6A, 00
        push    ?_424                                   ; 0AFC _ 68, 0000000F(d)
        push    dword [ebp-0CH]                         ; 0B01 _ FF. 75, F4
        push    eax                                     ; 0B04 _ 50
        call    make_window8                            ; 0B05 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0B0A _ 83. C4, 10
?_038:  mov     eax, dword [ebp-0CH]                    ; 0B0D _ 8B. 45, F4
        mov     ecx, dword [eax+8H]                     ; 0B10 _ 8B. 48, 08
        mov     eax, dword [ebp-0CH]                    ; 0B13 _ 8B. 45, F4
        mov     edx, dword [eax+4H]                     ; 0B16 _ 8B. 50, 04
        mov     eax, dword [shtctl]                     ; 0B19 _ A1, 00000284(d)
        sub     esp, 8                                  ; 0B1E _ 83. EC, 08
        push    ecx                                     ; 0B21 _ 51
        push    edx                                     ; 0B22 _ 52
        push    0                                       ; 0B23 _ 6A, 00
        push    0                                       ; 0B25 _ 6A, 00
        push    dword [ebp-0CH]                         ; 0B27 _ FF. 75, F4
        push    eax                                     ; 0B2A _ 50
        call    sheet_refresh                           ; 0B2B _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0B30 _ 83. C4, 20
        sub     esp, 8                                  ; 0B33 _ 83. EC, 08
        push    0                                       ; 0B36 _ 6A, 00
        push    128                                     ; 0B38 _ 68, 00000080
        push    240                                     ; 0B3D _ 68, 000000F0
        push    28                                      ; 0B42 _ 6A, 1C
        push    8                                       ; 0B44 _ 6A, 08
        push    dword [ebp-0CH]                         ; 0B46 _ FF. 75, F4
        call    make_textbox8                           ; 0B49 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0B4E _ 83. C4, 20
        call    task_alloc                              ; 0B51 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-14H], eax                    ; 0B56 _ 89. 45, EC
        mov     eax, dword [ebp-14H]                    ; 0B59 _ 8B. 45, EC
        mov     edx, dword [ebp-0CH]                    ; 0B5C _ 8B. 55, F4
        mov     dword [eax+0B4H], edx                   ; 0B5F _ 89. 90, 000000B4
        mov     eax, dword [ebp-0CH]                    ; 0B65 _ 8B. 45, F4
        mov     edx, dword [ebp-14H]                    ; 0B68 _ 8B. 55, EC
        mov     dword [eax+20H], edx                    ; 0B6B _ 89. 50, 20
        mov     eax, dword [current_console_task]       ; 0B6E _ A1, 00000298(d)
        test    eax, eax                                ; 0B73 _ 85. C0
        jz near       ?_039                                   ; 0b75 _ 74, 60
        mov     eax, dword [current_console_task]       ; 0B77 _ A1, 00000298(d)
        mov     edx, dword [eax+0B4H]                   ; 0B7C _ 8B. 90, 000000B4
        mov     eax, dword [shtctl]                     ; 0B82 _ A1, 00000284(d)
        push    0                                       ; 0B87 _ 6A, 00
        push    ?_424                                   ; 0B89 _ 68, 0000000F(d)
        push    edx                                     ; 0B8E _ 52
        push    eax                                     ; 0B8F _ 50
        call    make_wtitle8                            ; 0B90 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0B95 _ 83. C4, 10
        mov     eax, dword [current_console_task]       ; 0B98 _ A1, 00000298(d)
        mov     eax, dword [eax+0B4H]                   ; 0B9D _ 8B. 80, 000000B4
        mov     ebx, dword [eax+8H]                     ; 0BA3 _ 8B. 58, 08
        mov     eax, dword [current_console_task]       ; 0BA6 _ A1, 00000298(d)
        mov     eax, dword [eax+0B4H]                   ; 0BAB _ 8B. 80, 000000B4
        mov     ecx, dword [eax+4H]                     ; 0BB1 _ 8B. 48, 04
        mov     eax, dword [current_console_task]       ; 0BB4 _ A1, 00000298(d)
        mov     edx, dword [eax+0B4H]                   ; 0BB9 _ 8B. 90, 000000B4
        mov     eax, dword [shtctl]                     ; 0BBF _ A1, 00000284(d)
        sub     esp, 8                                  ; 0BC4 _ 83. EC, 08
        push    ebx                                     ; 0BC7 _ 53
        push    ecx                                     ; 0BC8 _ 51
        push    0                                       ; 0BC9 _ 6A, 00
        push    0                                       ; 0BCB _ 6A, 00
        push    edx                                     ; 0BCD _ 52
        push    eax                                     ; 0BCE _ 50
        call    sheet_refresh                           ; 0BCF _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0BD4 _ 83. C4, 20
?_039:  mov     eax, dword [ebp-14H]                    ; 0BD7 _ 8B. 45, EC
        mov     dword [current_console_task], eax       ; 0BDA _ A3, 00000298(d)
        call    get_code32_addr                         ; 0BDF _ E8, FFFFFFFC(rel)
        mov     dword [ebp-18H], eax                    ; 0BE4 _ 89. 45, E8
        mov     eax, dword [ebp-18H]                    ; 0BE7 _ 8B. 45, E8
        neg     eax                                     ; 0BEA _ F7. D8
        add     eax, console_task                       ; 0BEC _ 05, 00000000(d)
        mov     edx, eax                                ; 0BF1 _ 89. C2
        mov     eax, dword [ebp-14H]                    ; 0BF3 _ 8B. 45, EC
        mov     dword [eax+4CH], edx                    ; 0BF6 _ 89. 50, 4C
        mov     eax, dword [ebp-14H]                    ; 0BF9 _ 8B. 45, EC
        mov     dword [eax+74H], 0                      ; 0BFC _ C7. 40, 74, 00000000
        mov     eax, dword [ebp-14H]                    ; 0C03 _ 8B. 45, EC
        mov     dword [eax+78H], 8                      ; 0C06 _ C7. 40, 78, 00000008
        mov     eax, dword [ebp-14H]                    ; 0C0D _ 8B. 45, EC
        mov     dword [eax+7CH], 32                     ; 0C10 _ C7. 40, 7C, 00000020
        mov     eax, dword [ebp-14H]                    ; 0C17 _ 8B. 45, EC
        mov     dword [eax+80H], 24                     ; 0C1A _ C7. 80, 00000080, 00000018
        mov     eax, dword [ebp-14H]                    ; 0C24 _ 8B. 45, EC
        mov     dword [eax+84H], 0                      ; 0C27 _ C7. 80, 00000084, 00000000
        mov     eax, dword [ebp-14H]                    ; 0C31 _ 8B. 45, EC
        mov     dword [eax+88H], 16                     ; 0C34 _ C7. 80, 00000088, 00000010
        mov     eax, dword [memman]                     ; 0C3E _ A1, 00000000(d)
        sub     esp, 8                                  ; 0C43 _ 83. EC, 08
        push    65536                                   ; 0C46 _ 68, 00010000
        push    eax                                     ; 0C4B _ 50
        call    memman_alloc_4k                         ; 0C4C _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0C51 _ 83. C4, 10
        mov     edx, eax                                ; 0C54 _ 89. C2
        mov     eax, dword [ebp-14H]                    ; 0C56 _ 8B. 45, EC
        mov     dword [eax+0B8H], edx                   ; 0C59 _ 89. 90, 000000B8
        mov     eax, dword [ebp-14H]                    ; 0C5F _ 8B. 45, EC
        mov     eax, dword [eax+0B8H]                   ; 0C62 _ 8B. 80, 000000B8
        lea     edx, [eax+0FFF4H]                       ; 0C68 _ 8D. 90, 0000FFF4
        mov     eax, dword [ebp-14H]                    ; 0C6E _ 8B. 45, EC
        mov     dword [eax+64H], edx                    ; 0C71 _ 89. 50, 64
        mov     eax, dword [ebp-14H]                    ; 0C74 _ 8B. 45, EC
        mov     eax, dword [eax+64H]                    ; 0C77 _ 8B. 40, 64
        add     eax, 4                                  ; 0C7A _ 83. C0, 04
        mov     edx, eax                                ; 0C7D _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 0C7F _ 8B. 45, F4
        mov     dword [edx], eax                        ; 0C82 _ 89. 02
        mov     eax, dword [ebp-14H]                    ; 0C84 _ 8B. 45, EC
        mov     eax, dword [eax+64H]                    ; 0C87 _ 8B. 40, 64
        add     eax, 8                                  ; 0C8A _ 83. C0, 08
        mov     ebx, eax                                ; 0C8D _ 89. C3
        mov     eax, dword [memman]                     ; 0C8F _ A1, 00000000(d)
        sub     esp, 12                                 ; 0C94 _ 83. EC, 0C
        push    eax                                     ; 0C97 _ 50
        call    memman_total                            ; 0C98 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0C9D _ 83. C4, 10
        mov     dword [ebx], eax                        ; 0CA0 _ 89. 03
        mov     eax, dword [memman]                     ; 0CA2 _ A1, 00000000(d)
        sub     esp, 8                                  ; 0CA7 _ 83. EC, 08
        push    128                                     ; 0CAA _ 68, 00000080
        push    eax                                     ; 0CAF _ 50
        call    memman_alloc                            ; 0CB0 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0CB5 _ 83. C4, 10
        mov     dword [ebp-1CH], eax                    ; 0CB8 _ 89. 45, E4
        mov     eax, dword [ebp-14H]                    ; 0CBB _ 8B. 45, EC
        add     eax, 16                                 ; 0CBE _ 83. C0, 10
        push    dword [ebp-14H]                         ; 0CC1 _ FF. 75, EC
        push    dword [ebp-1CH]                         ; 0CC4 _ FF. 75, E4
        push    128                                     ; 0CC7 _ 68, 00000080
        push    eax                                     ; 0CCC _ 50
        call    fifo8_init                              ; 0CCD _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0CD2 _ 83. C4, 10
        mov     dword [ebp+8H], 0                       ; 0CD5 _ C7. 45, 08, 00000000
        jmp     ?_041                                   ; 0CDC _ EB, 1E

?_040:  mov     edx, dword [ebp+8H]                     ; 0CDE _ 8B. 55, 08
        mov     eax, edx                                ; 0CE1 _ 89. D0
        add     eax, eax                                ; 0CE3 _ 01. C0
        add     eax, edx                                ; 0CE5 _ 01. D0
        shl     eax, 2                                  ; 0CE7 _ C1. E0, 02
        lea     ecx, [ebp-8H]                           ; 0CEA _ 8D. 4D, F8
        add     eax, ecx                                ; 0CED _ 01. C8
        sub     eax, 116                                ; 0CEF _ 83. E8, 74
        mov     dword [eax], 0                          ; 0CF2 _ C7. 00, 00000000
        add     dword [ebp+8H], 1                       ; 0CF8 _ 83. 45, 08, 01
?_041:  cmp     dword [ebp+8H], 7                       ; 0CFC _ 83. 7D, 08, 07
        jle near      ?_040                                   ; 0d00 _ 7e, dc
        mov     eax, dword [ebp-14H]                    ; 0D02 _ 8B. 45, EC
        lea     edx, [ebp-7CH]                          ; 0D05 _ 8D. 55, 84
        mov     dword [eax+0CCH], edx                   ; 0D08 _ 89. 90, 000000CC
        sub     esp, 4                                  ; 0D0E _ 83. EC, 04
        push    5                                       ; 0D11 _ 6A, 05
        push    1                                       ; 0D13 _ 6A, 01
        push    dword [ebp-14H]                         ; 0D15 _ FF. 75, EC
        call    task_run                                ; 0D18 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0D1D _ 83. C4, 10
        cmp     dword [ebp+8H], 0                       ; 0D20 _ 83. 7D, 08, 00
        jnz near      ?_042                                   ; 0d24 _ 75, 0a
        mov     eax, dword [ebp-14H]                    ; 0D26 _ 8B. 45, EC
        mov     eax, dword [eax]                        ; 0D29 _ 8B. 00
        mov     dword [first_task_cons_selector], eax   ; 0D2B _ A3, 00000000(d)
?_042:  mov     eax, dword [ebp-0CH]                    ; 0D30 _ 8B. 45, F4
        mov     ebx, dword [ebp-4H]                     ; 0D33 _ 8B. 5D, FC
        leave                                           ; 0D36 _ C9
        ret                                             ; 0D37 _ C3
; launch_console End of function

kill_process:; Function begin
        push    ebp                                     ; 0D38 _ 55
        mov     ebp, esp                                ; 0D39 _ 89. E5
        sub     esp, 24                                 ; 0D3B _ 83. EC, 18
        call    task_now                                ; 0D3E _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 0D43 _ 89. 45, F4
        mov     eax, dword [ebp-0CH]                    ; 0D46 _ 8B. 45, F4
        mov     edx, dword [eax+94H]                    ; 0D49 _ 8B. 90, 00000094
        mov     eax, dword [ebp-0CH]                    ; 0D4F _ 8B. 45, F4
        mov     eax, dword [eax+9CH]                    ; 0D52 _ 8B. 80, 0000009C
        sub     esp, 8                                  ; 0D58 _ 83. EC, 08
        push    edx                                     ; 0D5B _ 52
        push    eax                                     ; 0D5C _ 50
        call    cons_newline                            ; 0D5D _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0D62 _ 83. C4, 10
        mov     eax, dword [ebp-0CH]                    ; 0D65 _ 8B. 45, F4
        mov     eax, dword [eax+9CH]                    ; 0D68 _ 8B. 80, 0000009C
        lea     edx, [eax+10H]                          ; 0D6E _ 8D. 50, 10
        mov     eax, dword [ebp-0CH]                    ; 0D71 _ 8B. 45, F4
        mov     dword [eax+9CH], edx                    ; 0D74 _ 89. 90, 0000009C
        mov     eax, dword [ebp-0CH]                    ; 0D7A _ 8B. 45, F4
        add     eax, 48                                 ; 0D7D _ 83. C0, 30
        sub     esp, 12                                 ; 0D80 _ 83. EC, 0C
        push    eax                                     ; 0D83 _ 50
        call    asm_end_app                             ; 0D84 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0D89 _ 83. C4, 10
        leave                                           ; 0D8C _ C9
        ret                                             ; 0D8D _ C3
; kill_process End of function

cmd_dir:; Function begin
        push    ebp                                     ; 0D8E _ 55
        mov     ebp, esp                                ; 0D8F _ 89. E5
        sub     esp, 40                                 ; 0D91 _ 83. EC, 28
        call    task_now                                ; 0D94 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-18H], eax                    ; 0D99 _ 89. 45, E8
        mov     dword [ebp-0CH], 88064                  ; 0D9C _ C7. 45, F4, 00015800
        mov     eax, dword [memman]                     ; 0DA3 _ A1, 00000000(d)
        sub     esp, 8                                  ; 0DA8 _ 83. EC, 08
        push    13                                      ; 0DAB _ 6A, 0D
        push    eax                                     ; 0DAD _ 50
        call    memman_alloc                            ; 0DAE _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0DB3 _ 83. C4, 10
        mov     dword [ebp-1CH], eax                    ; 0DB6 _ 89. 45, E4
        mov     eax, dword [ebp-1CH]                    ; 0DB9 _ 8B. 45, E4
        add     eax, 12                                 ; 0DBC _ 83. C0, 0C
        mov     byte [eax], 0                           ; 0DBF _ C6. 00, 00
        jmp     ?_051                                   ; 0DC2 _ E9, 00000121

?_043:  mov     dword [ebp-10H], 0                      ; 0DC7 _ C7. 45, F0, 00000000
        jmp     ?_047                                   ; 0DCE _ EB, 2C

?_044:  mov     edx, dword [ebp-0CH]                    ; 0DD0 _ 8B. 55, F4
        mov     eax, dword [ebp-10H]                    ; 0DD3 _ 8B. 45, F0
        add     eax, edx                                ; 0DD6 _ 01. D0
        movzx   eax, byte [eax]                         ; 0DD8 _ 0F B6. 00
        test    al, al                                  ; 0DDB _ 84. C0
        jz near       ?_045                                   ; 0ddd _ 74, 17
        mov     edx, dword [ebp-10H]                    ; 0DDF _ 8B. 55, F0
        mov     eax, dword [ebp-1CH]                    ; 0DE2 _ 8B. 45, E4
        add     eax, edx                                ; 0DE5 _ 01. D0
        mov     ecx, dword [ebp-0CH]                    ; 0DE7 _ 8B. 4D, F4
        mov     edx, dword [ebp-10H]                    ; 0DEA _ 8B. 55, F0
        add     edx, ecx                                ; 0DED _ 01. CA
        movzx   edx, byte [edx]                         ; 0DEF _ 0F B6. 12
        mov     byte [eax], dl                          ; 0DF2 _ 88. 10
        jmp     ?_046                                   ; 0DF4 _ EB, 02

?_045:  jmp     ?_048                                   ; 0DF6 _ EB, 0A

?_046:  add     dword [ebp-10H], 1                      ; 0DF8 _ 83. 45, F0, 01
?_047:  cmp     dword [ebp-10H], 7                      ; 0DFC _ 83. 7D, F0, 07
        jle near      ?_044                                   ; 0e00 _ 7e, ce
?_048:  mov     dword [ebp-14H], 0                      ; 0E02 _ C7. 45, EC, 00000000
        mov     edx, dword [ebp-10H]                    ; 0E09 _ 8B. 55, F0
        mov     eax, dword [ebp-1CH]                    ; 0E0C _ 8B. 45, E4
        add     eax, edx                                ; 0E0F _ 01. D0
        mov     byte [eax], 46                          ; 0E11 _ C6. 00, 2E
        add     dword [ebp-10H], 1                      ; 0E14 _ 83. 45, F0, 01
        mov     dword [ebp-14H], 0                      ; 0E18 _ C7. 45, EC, 00000000
        jmp     ?_050                                   ; 0E1F _ EB, 1E

?_049:  mov     edx, dword [ebp-10H]                    ; 0E21 _ 8B. 55, F0
        mov     eax, dword [ebp-1CH]                    ; 0E24 _ 8B. 45, E4
        add     eax, edx                                ; 0E27 _ 01. D0
        mov     ecx, dword [ebp-0CH]                    ; 0E29 _ 8B. 4D, F4
        mov     edx, dword [ebp-14H]                    ; 0E2C _ 8B. 55, EC
        add     edx, ecx                                ; 0E2F _ 01. CA
        movzx   edx, byte [edx+8H]                      ; 0E31 _ 0F B6. 52, 08
        mov     byte [eax], dl                          ; 0E35 _ 88. 10
        add     dword [ebp-10H], 1                      ; 0E37 _ 83. 45, F0, 01
        add     dword [ebp-14H], 1                      ; 0E3B _ 83. 45, EC, 01
?_050:  cmp     dword [ebp-14H], 2                      ; 0E3F _ 83. 7D, EC, 02
        jle near      ?_049                                   ; 0e43 _ 7e, dc
        mov     eax, dword [ebp-18H]                    ; 0E45 _ 8B. 45, E8
        mov     ecx, dword [eax+9CH]                    ; 0E48 _ 8B. 88, 0000009C
        mov     eax, dword [ebp-18H]                    ; 0E4E _ 8B. 45, E8
        mov     edx, dword [eax+94H]                    ; 0E51 _ 8B. 90, 00000094
        mov     eax, dword [shtctl]                     ; 0E57 _ A1, 00000284(d)
        sub     esp, 8                                  ; 0E5C _ 83. EC, 08
        push    dword [ebp-1CH]                         ; 0E5F _ FF. 75, E4
        push    7                                       ; 0E62 _ 6A, 07
        push    ecx                                     ; 0E64 _ 51
        push    16                                      ; 0E65 _ 6A, 10
        push    edx                                     ; 0E67 _ 52
        push    eax                                     ; 0E68 _ 50
        call    showString                              ; 0E69 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0E6E _ 83. C4, 20
        mov     dword [ebp-20H], 136                    ; 0E71 _ C7. 45, E0, 00000088
        mov     eax, dword [ebp-0CH]                    ; 0E78 _ 8B. 45, F4
        mov     eax, dword [eax+1CH]                    ; 0E7B _ 8B. 40, 1C
        sub     esp, 12                                 ; 0E7E _ 83. EC, 0C
        push    eax                                     ; 0E81 _ 50
        call    intToHexStr                             ; 0E82 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0E87 _ 83. C4, 10
        mov     dword [ebp-24H], eax                    ; 0E8A _ 89. 45, DC
        mov     eax, dword [ebp-18H]                    ; 0E8D _ 8B. 45, E8
        mov     ecx, dword [eax+9CH]                    ; 0E90 _ 8B. 88, 0000009C
        mov     eax, dword [ebp-18H]                    ; 0E96 _ 8B. 45, E8
        mov     edx, dword [eax+94H]                    ; 0E99 _ 8B. 90, 00000094
        mov     eax, dword [shtctl]                     ; 0E9F _ A1, 00000284(d)
        sub     esp, 8                                  ; 0EA4 _ 83. EC, 08
        push    dword [ebp-24H]                         ; 0EA7 _ FF. 75, DC
        push    7                                       ; 0EAA _ 6A, 07
        push    ecx                                     ; 0EAC _ 51
        push    dword [ebp-20H]                         ; 0EAD _ FF. 75, E0
        push    edx                                     ; 0EB0 _ 52
        push    eax                                     ; 0EB1 _ 50
        call    showString                              ; 0EB2 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0EB7 _ 83. C4, 20
        mov     eax, dword [ebp-18H]                    ; 0EBA _ 8B. 45, E8
        mov     edx, dword [eax+94H]                    ; 0EBD _ 8B. 90, 00000094
        mov     eax, dword [ebp-18H]                    ; 0EC3 _ 8B. 45, E8
        mov     eax, dword [eax+9CH]                    ; 0EC6 _ 8B. 80, 0000009C
        sub     esp, 8                                  ; 0ECC _ 83. EC, 08
        push    edx                                     ; 0ECF _ 52
        push    eax                                     ; 0ED0 _ 50
        call    cons_newline                            ; 0ED1 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0ED6 _ 83. C4, 10
        mov     edx, eax                                ; 0ED9 _ 89. C2
        mov     eax, dword [ebp-18H]                    ; 0EDB _ 8B. 45, E8
        mov     dword [eax+9CH], edx                    ; 0EDE _ 89. 90, 0000009C
        add     dword [ebp-0CH], 32                     ; 0EE4 _ 83. 45, F4, 20
?_051:  mov     eax, dword [ebp-0CH]                    ; 0EE8 _ 8B. 45, F4
        movzx   eax, byte [eax]                         ; 0EEB _ 0F B6. 00
        test    al, al                                  ; 0EEE _ 84. C0
        jne near      ?_043                                   ; 0ef0 _ 0f 85, fffffed1
        mov     edx, dword [ebp-1CH]                    ; 0EF6 _ 8B. 55, E4
        mov     eax, dword [memman]                     ; 0EF9 _ A1, 00000000(d)
        sub     esp, 4                                  ; 0EFE _ 83. EC, 04
        push    13                                      ; 0F01 _ 6A, 0D
        push    edx                                     ; 0F03 _ 52
        push    eax                                     ; 0F04 _ 50
        call    memman_free                             ; 0F05 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0F0A _ 83. C4, 10
        leave                                           ; 0F0D _ C9
        ret                                             ; 0F0E _ C3
; cmd_dir End of function

cmd_type:; Function begin
        push    ebp                                     ; 0F0F _ 55
        mov     ebp, esp                                ; 0F10 _ 89. E5
        push    esi                                     ; 0F12 _ 56
        push    ebx                                     ; 0F13 _ 53
        sub     esp, 64                                 ; 0F14 _ 83. EC, 40
        call    task_now                                ; 0F17 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-24H], eax                    ; 0F1C _ 89. 45, DC
        mov     eax, dword [ebp-24H]                    ; 0F1F _ 8B. 45, DC
        mov     eax, dword [eax+94H]                    ; 0F22 _ 8B. 80, 00000094
        test    eax, eax                                ; 0F28 _ 85. C0
        jnz near      ?_052                                   ; 0f2a _ 75, 05
        jmp     ?_076                                   ; 0F2C _ E9, 0000036D

?_052:  mov     eax, dword [memman]                     ; 0F31 _ A1, 00000000(d)
        sub     esp, 8                                  ; 0F36 _ 83. EC, 08
        push    13                                      ; 0F39 _ 6A, 0D
        push    eax                                     ; 0F3B _ 50
        call    memman_alloc                            ; 0F3C _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0F41 _ 83. C4, 10
        mov     dword [ebp-28H], eax                    ; 0F44 _ 89. 45, D8
        mov     eax, dword [ebp-28H]                    ; 0F47 _ 8B. 45, D8
        add     eax, 12                                 ; 0F4A _ 83. C0, 0C
        mov     byte [eax], 0                           ; 0F4D _ C6. 00, 00
        mov     dword [ebp-0CH], 0                      ; 0F50 _ C7. 45, F4, 00000000
        mov     dword [ebp-10H], 5                      ; 0F57 _ C7. 45, F0, 00000005
        mov     dword [ebp-10H], 5                      ; 0F5E _ C7. 45, F0, 00000005
        jmp     ?_056                                   ; 0F65 _ EB, 30

?_053:  mov     edx, dword [ebp-10H]                    ; 0F67 _ 8B. 55, F0
        mov     eax, dword [ebp+8H]                     ; 0F6A _ 8B. 45, 08
        add     eax, edx                                ; 0F6D _ 01. D0
        movzx   eax, byte [eax]                         ; 0F6F _ 0F B6. 00
        test    al, al                                  ; 0F72 _ 84. C0
        jz near       ?_054                                   ; 0f74 _ 74, 1b
        mov     edx, dword [ebp-0CH]                    ; 0F76 _ 8B. 55, F4
        mov     eax, dword [ebp-28H]                    ; 0F79 _ 8B. 45, D8
        add     edx, eax                                ; 0F7C _ 01. C2
        mov     ecx, dword [ebp-10H]                    ; 0F7E _ 8B. 4D, F0
        mov     eax, dword [ebp+8H]                     ; 0F81 _ 8B. 45, 08
        add     eax, ecx                                ; 0F84 _ 01. C8
        movzx   eax, byte [eax]                         ; 0F86 _ 0F B6. 00
        mov     byte [edx], al                          ; 0F89 _ 88. 02
        add     dword [ebp-0CH], 1                      ; 0F8B _ 83. 45, F4, 01
        jmp     ?_055                                   ; 0F8F _ EB, 02

?_054:  jmp     ?_057                                   ; 0F91 _ EB, 0A

?_055:  add     dword [ebp-10H], 1                      ; 0F93 _ 83. 45, F0, 01
?_056:  cmp     dword [ebp-10H], 16                     ; 0F97 _ 83. 7D, F0, 10
        jle near      ?_053                                   ; 0f9b _ 7e, ca
?_057:  mov     edx, dword [ebp-0CH]                    ; 0F9D _ 8B. 55, F4
        mov     eax, dword [ebp-28H]                    ; 0FA0 _ 8B. 45, D8
        add     eax, edx                                ; 0FA3 _ 01. D0
        mov     byte [eax], 0                           ; 0FA5 _ C6. 00, 00
        mov     dword [ebp-14H], 88064                  ; 0FA8 _ C7. 45, EC, 00015800
        jmp     ?_074                                   ; 0FAF _ E9, 0000028E

?_058:  mov     byte [ebp-31H], 0                       ; 0FB4 _ C6. 45, CF, 00
        mov     dword [ebp-18H], 0                      ; 0FB8 _ C7. 45, E8, 00000000
        jmp     ?_062                                   ; 0FBF _ EB, 2E

?_059:  mov     edx, dword [ebp-14H]                    ; 0FC1 _ 8B. 55, EC
        mov     eax, dword [ebp-18H]                    ; 0FC4 _ 8B. 45, E8
        add     eax, edx                                ; 0FC7 _ 01. D0
        movzx   eax, byte [eax]                         ; 0FC9 _ 0F B6. 00
        test    al, al                                  ; 0FCC _ 84. C0
        jz near       ?_060                                   ; 0fce _ 74, 19
        mov     edx, dword [ebp-14H]                    ; 0FD0 _ 8B. 55, EC
        mov     eax, dword [ebp-18H]                    ; 0FD3 _ 8B. 45, E8
        add     eax, edx                                ; 0FD6 _ 01. D0
        movzx   eax, byte [eax]                         ; 0FD8 _ 0F B6. 00
        mov     ecx, eax                                ; 0FDB _ 89. C1
        lea     edx, [ebp-3DH]                          ; 0FDD _ 8D. 55, C3
        mov     eax, dword [ebp-18H]                    ; 0FE0 _ 8B. 45, E8
        add     eax, edx                                ; 0FE3 _ 01. D0
        mov     byte [eax], cl                          ; 0FE5 _ 88. 08
        jmp     ?_061                                   ; 0FE7 _ EB, 02

?_060:  jmp     ?_063                                   ; 0FE9 _ EB, 0A

?_061:  add     dword [ebp-18H], 1                      ; 0FEB _ 83. 45, E8, 01
?_062:  cmp     dword [ebp-18H], 7                      ; 0FEF _ 83. 7D, E8, 07
        jle near      ?_059                                   ; 0ff3 _ 7e, cc
?_063:  mov     dword [ebp-1CH], 0                      ; 0FF5 _ C7. 45, E4, 00000000
        lea     edx, [ebp-3DH]                          ; 0FFC _ 8D. 55, C3
        mov     eax, dword [ebp-18H]                    ; 0FFF _ 8B. 45, E8
        add     eax, edx                                ; 1002 _ 01. D0
        mov     byte [eax], 46                          ; 1004 _ C6. 00, 2E
        add     dword [ebp-18H], 1                      ; 1007 _ 83. 45, E8, 01
        mov     dword [ebp-1CH], 0                      ; 100B _ C7. 45, E4, 00000000
        jmp     ?_065                                   ; 1012 _ EB, 20

?_064:  mov     edx, dword [ebp-14H]                    ; 1014 _ 8B. 55, EC
        mov     eax, dword [ebp-1CH]                    ; 1017 _ 8B. 45, E4
        add     eax, edx                                ; 101A _ 01. D0
        movzx   eax, byte [eax+8H]                      ; 101C _ 0F B6. 40, 08
        mov     ecx, eax                                ; 1020 _ 89. C1
        lea     edx, [ebp-3DH]                          ; 1022 _ 8D. 55, C3
        mov     eax, dword [ebp-18H]                    ; 1025 _ 8B. 45, E8
        add     eax, edx                                ; 1028 _ 01. D0
        mov     byte [eax], cl                          ; 102A _ 88. 08
        add     dword [ebp-18H], 1                      ; 102C _ 83. 45, E8, 01
        add     dword [ebp-1CH], 1                      ; 1030 _ 83. 45, E4, 01
?_065:  cmp     dword [ebp-1CH], 2                      ; 1034 _ 83. 7D, E4, 02
        jle near      ?_064                                   ; 1038 _ 7e, da
        sub     esp, 8                                  ; 103A _ 83. EC, 08
        lea     eax, [ebp-3DH]                          ; 103D _ 8D. 45, C3
        push    eax                                     ; 1040 _ 50
        push    dword [ebp-28H]                         ; 1041 _ FF. 75, D8
        call    strcmp                                  ; 1044 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1049 _ 83. C4, 10
        cmp     eax, 1                                  ; 104C _ 83. F8, 01
        jne near      ?_073                                   ; 104f _ 0f 85, 000001e9
        mov     dword [ebp-2CH], 97280                  ; 1055 _ C7. 45, D4, 00017C00
        mov     eax, dword [ebp-14H]                    ; 105C _ 8B. 45, EC
        movzx   eax, word [eax+1AH]                     ; 105F _ 0F B7. 40, 1A
        movzx   eax, ax                                 ; 1063 _ 0F B7. C0
        shl     eax, 9                                  ; 1066 _ C1. E0, 09
        add     dword [ebp-2CH], eax                    ; 1069 _ 01. 45, D4
        mov     eax, dword [ebp-14H]                    ; 106C _ 8B. 45, EC
        mov     eax, dword [eax+1CH]                    ; 106F _ 8B. 40, 1C
        mov     dword [ebp-30H], eax                    ; 1072 _ 89. 45, D0
        mov     dword [ebp-20H], 0                      ; 1075 _ C7. 45, E0, 00000000
        mov     eax, dword [ebp-24H]                    ; 107C _ 8B. 45, DC
        mov     dword [eax+98H], 16                     ; 107F _ C7. 80, 00000098, 00000010
        mov     dword [ebp-20H], 0                      ; 1089 _ C7. 45, E0, 00000000
        jmp     ?_072                                   ; 1090 _ E9, 0000019A

?_066:  mov     edx, dword [ebp-20H]                    ; 1095 _ 8B. 55, E0
        mov     eax, dword [ebp-2CH]                    ; 1098 _ 8B. 45, D4
        add     eax, edx                                ; 109B _ 01. D0
        movzx   eax, byte [eax]                         ; 109D _ 0F B6. 00
        mov     byte [ebp-3FH], al                      ; 10A0 _ 88. 45, C1
        mov     byte [ebp-3EH], 0                       ; 10A3 _ C6. 45, C2, 00
        movzx   eax, byte [ebp-3FH]                     ; 10A7 _ 0F B6. 45, C1
        cmp     al, 9                                   ; 10AB _ 3C, 09
        jne near      ?_069                                   ; 10ad _ 0f 85, 00000097
?_067:  mov     eax, dword [ebp-24H]                    ; 10B3 _ 8B. 45, DC
        mov     ebx, dword [eax+9CH]                    ; 10B6 _ 8B. 98, 0000009C
        mov     eax, dword [ebp-24H]                    ; 10BC _ 8B. 45, DC
        mov     ecx, dword [eax+98H]                    ; 10BF _ 8B. 88, 00000098
        mov     eax, dword [ebp-24H]                    ; 10C5 _ 8B. 45, DC
        mov     edx, dword [eax+94H]                    ; 10C8 _ 8B. 90, 00000094
        mov     eax, dword [shtctl]                     ; 10CE _ A1, 00000284(d)
        sub     esp, 8                                  ; 10D3 _ 83. EC, 08
        push    ?_425                                   ; 10D6 _ 68, 00000017(d)
        push    7                                       ; 10DB _ 6A, 07
        push    ebx                                     ; 10DD _ 53
        push    ecx                                     ; 10DE _ 51
        push    edx                                     ; 10DF _ 52
        push    eax                                     ; 10E0 _ 50
        call    showString                              ; 10E1 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 10E6 _ 83. C4, 20
        mov     eax, dword [ebp-24H]                    ; 10E9 _ 8B. 45, DC
        mov     eax, dword [eax+98H]                    ; 10EC _ 8B. 80, 00000098
        lea     edx, [eax+8H]                           ; 10F2 _ 8D. 50, 08
        mov     eax, dword [ebp-24H]                    ; 10F5 _ 8B. 45, DC
        mov     dword [eax+98H], edx                    ; 10F8 _ 89. 90, 00000098
        mov     eax, dword [ebp-24H]                    ; 10FE _ 8B. 45, DC
        mov     eax, dword [eax+98H]                    ; 1101 _ 8B. 80, 00000098
        cmp     eax, 248                                ; 1107 _ 3D, 000000F8
        jnz near      ?_068                                   ; 110c _ 75, 37
        mov     eax, dword [ebp-24H]                    ; 110E _ 8B. 45, DC
        mov     dword [eax+98H], 8                      ; 1111 _ C7. 80, 00000098, 00000008
        mov     eax, dword [ebp-24H]                    ; 111B _ 8B. 45, DC
        mov     edx, dword [eax+94H]                    ; 111E _ 8B. 90, 00000094
        mov     eax, dword [ebp-24H]                    ; 1124 _ 8B. 45, DC
        mov     eax, dword [eax+9CH]                    ; 1127 _ 8B. 80, 0000009C
        sub     esp, 8                                  ; 112D _ 83. EC, 08
        push    edx                                     ; 1130 _ 52
        push    eax                                     ; 1131 _ 50
        call    cons_newline                            ; 1132 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1137 _ 83. C4, 10
        mov     edx, eax                                ; 113A _ 89. C2
        mov     eax, dword [ebp-24H]                    ; 113C _ 8B. 45, DC
        mov     dword [eax+9CH], edx                    ; 113F _ 89. 90, 0000009C
?_068:  jmp     ?_067                                   ; 1145 _ E9, FFFFFF69

?_069:  movzx   eax, byte [ebp-3FH]                     ; 114A _ 0F B6. 45, C1
        cmp     al, 10                                  ; 114E _ 3C, 0A
        jnz near      ?_070                                   ; 1150 _ 75, 3c
        mov     eax, dword [ebp-24H]                    ; 1152 _ 8B. 45, DC
        mov     dword [eax+98H], 8                      ; 1155 _ C7. 80, 00000098, 00000008
        mov     eax, dword [ebp-24H]                    ; 115F _ 8B. 45, DC
        mov     edx, dword [eax+94H]                    ; 1162 _ 8B. 90, 00000094
        mov     eax, dword [ebp-24H]                    ; 1168 _ 8B. 45, DC
        mov     eax, dword [eax+9CH]                    ; 116B _ 8B. 80, 0000009C
        sub     esp, 8                                  ; 1171 _ 83. EC, 08
        push    edx                                     ; 1174 _ 52
        push    eax                                     ; 1175 _ 50
        call    cons_newline                            ; 1176 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 117B _ 83. C4, 10
        mov     edx, eax                                ; 117E _ 89. C2
        mov     eax, dword [ebp-24H]                    ; 1180 _ 8B. 45, DC
        mov     dword [eax+9CH], edx                    ; 1183 _ 89. 90, 0000009C
        jmp     ?_071                                   ; 1189 _ E9, 0000009D

?_070:  movzx   eax, byte [ebp-3FH]                     ; 118E _ 0F B6. 45, C1
        cmp     al, 13                                  ; 1192 _ 3C, 0D
        je near       ?_071                                   ; 1194 _ 0f 84, 00000091
        mov     eax, dword [ebp-24H]                    ; 119A _ 8B. 45, DC
        mov     ebx, dword [eax+9CH]                    ; 119D _ 8B. 98, 0000009C
        mov     eax, dword [ebp-24H]                    ; 11A3 _ 8B. 45, DC
        mov     ecx, dword [eax+98H]                    ; 11A6 _ 8B. 88, 00000098
        mov     eax, dword [ebp-24H]                    ; 11AC _ 8B. 45, DC
        mov     edx, dword [eax+94H]                    ; 11AF _ 8B. 90, 00000094
        mov     eax, dword [shtctl]                     ; 11B5 _ A1, 00000284(d)
        sub     esp, 8                                  ; 11BA _ 83. EC, 08
        lea     esi, [ebp-3FH]                          ; 11BD _ 8D. 75, C1
        push    esi                                     ; 11C0 _ 56
        push    7                                       ; 11C1 _ 6A, 07
        push    ebx                                     ; 11C3 _ 53
        push    ecx                                     ; 11C4 _ 51
        push    edx                                     ; 11C5 _ 52
        push    eax                                     ; 11C6 _ 50
        call    showString                              ; 11C7 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 11CC _ 83. C4, 20
        mov     eax, dword [ebp-24H]                    ; 11CF _ 8B. 45, DC
        mov     eax, dword [eax+98H]                    ; 11D2 _ 8B. 80, 00000098
        lea     edx, [eax+8H]                           ; 11D8 _ 8D. 50, 08
        mov     eax, dword [ebp-24H]                    ; 11DB _ 8B. 45, DC
        mov     dword [eax+98H], edx                    ; 11DE _ 89. 90, 00000098
        mov     eax, dword [ebp-24H]                    ; 11E4 _ 8B. 45, DC
        mov     eax, dword [eax+98H]                    ; 11E7 _ 8B. 80, 00000098
        cmp     eax, 248                                ; 11ED _ 3D, 000000F8
        jnz near      ?_071                                   ; 11f2 _ 75, 37
        mov     eax, dword [ebp-24H]                    ; 11F4 _ 8B. 45, DC
        mov     dword [eax+98H], 16                     ; 11F7 _ C7. 80, 00000098, 00000010
        mov     eax, dword [ebp-24H]                    ; 1201 _ 8B. 45, DC
        mov     edx, dword [eax+94H]                    ; 1204 _ 8B. 90, 00000094
        mov     eax, dword [ebp-24H]                    ; 120A _ 8B. 45, DC
        mov     eax, dword [eax+9CH]                    ; 120D _ 8B. 80, 0000009C
        sub     esp, 8                                  ; 1213 _ 83. EC, 08
        push    edx                                     ; 1216 _ 52
        push    eax                                     ; 1217 _ 50
        call    cons_newline                            ; 1218 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 121D _ 83. C4, 10
        mov     edx, eax                                ; 1220 _ 89. C2
        mov     eax, dword [ebp-24H]                    ; 1222 _ 8B. 45, DC
        mov     dword [eax+9CH], edx                    ; 1225 _ 89. 90, 0000009C
?_071:  add     dword [ebp-20H], 1                      ; 122B _ 83. 45, E0, 01
?_072:  mov     eax, dword [ebp-20H]                    ; 122F _ 8B. 45, E0
        cmp     eax, dword [ebp-30H]                    ; 1232 _ 3B. 45, D0
        jl      ?_066                                   ; 1235 _ 0F 8C, FFFFFE5A
        nop                                             ; 123B _ 90
        jmp     ?_075                                   ; 123C _ EB, 12

?_073:  add     dword [ebp-14H], 32                     ; 123E _ 83. 45, EC, 20
?_074:  mov     eax, dword [ebp-14H]                    ; 1242 _ 8B. 45, EC
        movzx   eax, byte [eax]                         ; 1245 _ 0F B6. 00
        test    al, al                                  ; 1248 _ 84. C0
        jne near      ?_058                                   ; 124a _ 0f 85, fffffd64
?_075:  mov     eax, dword [ebp-24H]                    ; 1250 _ 8B. 45, DC
        mov     edx, dword [eax+94H]                    ; 1253 _ 8B. 90, 00000094
        mov     eax, dword [ebp-24H]                    ; 1259 _ 8B. 45, DC
        mov     eax, dword [eax+9CH]                    ; 125C _ 8B. 80, 0000009C
        sub     esp, 8                                  ; 1262 _ 83. EC, 08
        push    edx                                     ; 1265 _ 52
        push    eax                                     ; 1266 _ 50
        call    cons_newline                            ; 1267 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 126C _ 83. C4, 10
        mov     edx, eax                                ; 126F _ 89. C2
        mov     eax, dword [ebp-24H]                    ; 1271 _ 8B. 45, DC
        mov     dword [eax+9CH], edx                    ; 1274 _ 89. 90, 0000009C
        mov     edx, dword [ebp-28H]                    ; 127A _ 8B. 55, D8
        mov     eax, dword [memman]                     ; 127D _ A1, 00000000(d)
        sub     esp, 4                                  ; 1282 _ 83. EC, 04
        push    13                                      ; 1285 _ 6A, 0D
        push    edx                                     ; 1287 _ 52
        push    eax                                     ; 1288 _ 50
        call    memman_free                             ; 1289 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 128E _ 83. C4, 10
        mov     eax, dword [ebp-24H]                    ; 1291 _ 8B. 45, DC
        mov     dword [eax+98H], 16                     ; 1294 _ C7. 80, 00000098, 00000010
?_076:  lea     esp, [ebp-8H]                           ; 129E _ 8D. 65, F8
        pop     ebx                                     ; 12A1 _ 5B
        pop     esi                                     ; 12A2 _ 5E
        pop     ebp                                     ; 12A3 _ 5D
        ret                                             ; 12A4 _ C3
; cmd_type End of function

cmd_mem:; Function begin
        push    ebp                                     ; 12A5 _ 55
        mov     ebp, esp                                ; 12A6 _ 89. E5
        sub     esp, 24                                 ; 12A8 _ 83. EC, 18
        call    task_now                                ; 12AB _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 12B0 _ 89. 45, F4
        mov     eax, dword [ebp-0CH]                    ; 12B3 _ 8B. 45, F4
        mov     eax, dword [eax+94H]                    ; 12B6 _ 8B. 80, 00000094
        test    eax, eax                                ; 12BC _ 85. C0
        jnz near      ?_077                                   ; 12be _ 75, 05
        jmp     ?_078                                   ; 12C0 _ E9, 000000D2

?_077:  mov     eax, dword [ebp+8H]                     ; 12C5 _ 8B. 45, 08
        lea     edx, [eax+3FFH]                         ; 12C8 _ 8D. 90, 000003FF
        test    eax, eax                                ; 12CE _ 85. C0
        cmovs   eax, edx                                ; 12D0 _ 0F 48. C2
        sar     eax, 10                                 ; 12D3 _ C1. F8, 0A
        sub     esp, 12                                 ; 12D6 _ 83. EC, 0C
        push    eax                                     ; 12D9 _ 50
        call    intToHexStr                             ; 12DA _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 12DF _ 83. C4, 10
        mov     dword [ebp-10H], eax                    ; 12E2 _ 89. 45, F0
        mov     eax, dword [ebp-0CH]                    ; 12E5 _ 8B. 45, F4
        mov     ecx, dword [eax+9CH]                    ; 12E8 _ 8B. 88, 0000009C
        mov     eax, dword [ebp-0CH]                    ; 12EE _ 8B. 45, F4
        mov     edx, dword [eax+94H]                    ; 12F1 _ 8B. 90, 00000094
        mov     eax, dword [shtctl]                     ; 12F7 _ A1, 00000284(d)
        sub     esp, 8                                  ; 12FC _ 83. EC, 08
        push    ?_426                                   ; 12FF _ 68, 00000019(d)
        push    7                                       ; 1304 _ 6A, 07
        push    ecx                                     ; 1306 _ 51
        push    16                                      ; 1307 _ 6A, 10
        push    edx                                     ; 1309 _ 52
        push    eax                                     ; 130A _ 50
        call    showString                              ; 130B _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1310 _ 83. C4, 20
        mov     eax, dword [ebp-0CH]                    ; 1313 _ 8B. 45, F4
        mov     ecx, dword [eax+9CH]                    ; 1316 _ 8B. 88, 0000009C
        mov     eax, dword [ebp-0CH]                    ; 131C _ 8B. 45, F4
        mov     edx, dword [eax+94H]                    ; 131F _ 8B. 90, 00000094
        mov     eax, dword [shtctl]                     ; 1325 _ A1, 00000284(d)
        sub     esp, 8                                  ; 132A _ 83. EC, 08
        push    dword [ebp-10H]                         ; 132D _ FF. 75, F0
        push    7                                       ; 1330 _ 6A, 07
        push    ecx                                     ; 1332 _ 51
        push    52                                      ; 1333 _ 6A, 34
        push    edx                                     ; 1335 _ 52
        push    eax                                     ; 1336 _ 50
        call    showString                              ; 1337 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 133C _ 83. C4, 20
        mov     eax, dword [ebp-0CH]                    ; 133F _ 8B. 45, F4
        mov     ecx, dword [eax+9CH]                    ; 1342 _ 8B. 88, 0000009C
        mov     eax, dword [ebp-0CH]                    ; 1348 _ 8B. 45, F4
        mov     edx, dword [eax+94H]                    ; 134B _ 8B. 90, 00000094
        mov     eax, dword [shtctl]                     ; 1351 _ A1, 00000284(d)
        sub     esp, 8                                  ; 1356 _ 83. EC, 08
        push    ?_427                                   ; 1359 _ 68, 0000001F(d)
        push    7                                       ; 135E _ 6A, 07
        push    ecx                                     ; 1360 _ 51
        push    126                                     ; 1361 _ 6A, 7E
        push    edx                                     ; 1363 _ 52
        push    eax                                     ; 1364 _ 50
        call    showString                              ; 1365 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 136A _ 83. C4, 20
        mov     eax, dword [ebp-0CH]                    ; 136D _ 8B. 45, F4
        mov     edx, dword [eax+94H]                    ; 1370 _ 8B. 90, 00000094
        mov     eax, dword [ebp-0CH]                    ; 1376 _ 8B. 45, F4
        mov     eax, dword [eax+9CH]                    ; 1379 _ 8B. 80, 0000009C
        sub     esp, 8                                  ; 137F _ 83. EC, 08
        push    edx                                     ; 1382 _ 52
        push    eax                                     ; 1383 _ 50
        call    cons_newline                            ; 1384 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1389 _ 83. C4, 10
        mov     edx, eax                                ; 138C _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 138E _ 8B. 45, F4
        mov     dword [eax+9CH], edx                    ; 1391 _ 89. 90, 0000009C
?_078:  leave                                           ; 1397 _ C9
        ret                                             ; 1398 _ C3
; cmd_mem End of function

cmd_cls:; Function begin
        push    ebp                                     ; 1399 _ 55
        mov     ebp, esp                                ; 139A _ 89. E5
        sub     esp, 24                                 ; 139C _ 83. EC, 18
        call    task_now                                ; 139F _ E8, FFFFFFFC(rel)
        mov     dword [ebp-14H], eax                    ; 13A4 _ 89. 45, EC
        mov     eax, dword [ebp-14H]                    ; 13A7 _ 8B. 45, EC
        mov     eax, dword [eax+94H]                    ; 13AA _ 8B. 80, 00000094
        test    eax, eax                                ; 13B0 _ 85. C0
        jnz near      ?_079                                   ; 13b2 _ 75, 05
        jmp     ?_084                                   ; 13B4 _ E9, 000000BD

?_079:  mov     dword [ebp-0CH], 8                      ; 13B9 _ C7. 45, F4, 00000008
        mov     dword [ebp-10H], 28                     ; 13C0 _ C7. 45, F0, 0000001C
        mov     dword [ebp-10H], 28                     ; 13C7 _ C7. 45, F0, 0000001C
        jmp     ?_083                                   ; 13CE _ EB, 41

?_080:  mov     dword [ebp-0CH], 8                      ; 13D0 _ C7. 45, F4, 00000008
        jmp     ?_082                                   ; 13D7 _ EB, 2B

?_081:  mov     eax, dword [ebp-14H]                    ; 13D9 _ 8B. 45, EC
        mov     eax, dword [eax+94H]                    ; 13DC _ 8B. 80, 00000094
        mov     edx, dword [eax]                        ; 13E2 _ 8B. 10
        mov     eax, dword [ebp-14H]                    ; 13E4 _ 8B. 45, EC
        mov     eax, dword [eax+94H]                    ; 13E7 _ 8B. 80, 00000094
        mov     eax, dword [eax+4H]                     ; 13ED _ 8B. 40, 04
        imul    eax, dword [ebp-10H]                    ; 13F0 _ 0F AF. 45, F0
        mov     ecx, eax                                ; 13F4 _ 89. C1
        mov     eax, dword [ebp-0CH]                    ; 13F6 _ 8B. 45, F4
        add     eax, ecx                                ; 13F9 _ 01. C8
        add     eax, edx                                ; 13FB _ 01. D0
        mov     byte [eax], 0                           ; 13FD _ C6. 00, 00
        add     dword [ebp-0CH], 1                      ; 1400 _ 83. 45, F4, 01
?_082:  cmp     dword [ebp-0CH], 247                    ; 1404 _ 81. 7D, F4, 000000F7
        jle near      ?_081                                   ; 140b _ 7e, cc
        add     dword [ebp-10H], 1                      ; 140D _ 83. 45, F0, 01
?_083:  cmp     dword [ebp-10H], 155                    ; 1411 _ 81. 7D, F0, 0000009B
        jle near      ?_080                                   ; 1418 _ 7e, b6
        mov     eax, dword [ebp-14H]                    ; 141A _ 8B. 45, EC
        mov     edx, dword [eax+94H]                    ; 141D _ 8B. 90, 00000094
        mov     eax, dword [shtctl]                     ; 1423 _ A1, 00000284(d)
        sub     esp, 8                                  ; 1428 _ 83. EC, 08
        push    156                                     ; 142B _ 68, 0000009C
        push    248                                     ; 1430 _ 68, 000000F8
        push    28                                      ; 1435 _ 6A, 1C
        push    8                                       ; 1437 _ 6A, 08
        push    edx                                     ; 1439 _ 52
        push    eax                                     ; 143A _ 50
        call    sheet_refresh                           ; 143B _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1440 _ 83. C4, 20
        mov     eax, dword [ebp-14H]                    ; 1443 _ 8B. 45, EC
        mov     dword [eax+9CH], 28                     ; 1446 _ C7. 80, 0000009C, 0000001C
        mov     eax, dword [ebp-14H]                    ; 1450 _ 8B. 45, EC
        mov     edx, dword [eax+94H]                    ; 1453 _ 8B. 90, 00000094
        mov     eax, dword [shtctl]                     ; 1459 _ A1, 00000284(d)
        sub     esp, 8                                  ; 145E _ 83. EC, 08
        push    ?_428                                   ; 1461 _ 68, 00000023(d)
        push    7                                       ; 1466 _ 6A, 07
        push    28                                      ; 1468 _ 6A, 1C
        push    8                                       ; 146A _ 6A, 08
        push    edx                                     ; 146C _ 52
        push    eax                                     ; 146D _ 50
        call    showString                              ; 146E _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1473 _ 83. C4, 20
?_084:  leave                                           ; 1476 _ C9
        ret                                             ; 1477 _ C3
; cmd_cls End of function

cmd_execute_program:; Function begin
        push    ebp                                     ; 1478 _ 55
        mov     ebp, esp                                ; 1479 _ 89. E5
        push    ebx                                     ; 147B _ 53
        sub     esp, 36                                 ; 147C _ 83. EC, 24
        call    io_cli                                  ; 147F _ E8, FFFFFFFC(rel)
        mov     eax, dword [memman]                     ; 1484 _ A1, 00000000(d)
        sub     esp, 8                                  ; 1489 _ 83. EC, 08
        push    16                                      ; 148C _ 6A, 10
        push    eax                                     ; 148E _ 50
        call    memman_alloc                            ; 148F _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1494 _ 83. C4, 10
        mov     dword [ebp-10H], eax                    ; 1497 _ 89. 45, F0
        call    task_now                                ; 149A _ E8, FFFFFFFC(rel)
        mov     dword [ebp-14H], eax                    ; 149F _ 89. 45, EC
        mov     eax, dword [ebp-14H]                    ; 14A2 _ 8B. 45, EC
        mov     edx, dword [ebp-10H]                    ; 14A5 _ 8B. 55, F0
        mov     dword [eax+0B0H], edx                   ; 14A8 _ 89. 90, 000000B0
        sub     esp, 8                                  ; 14AE _ 83. EC, 08
        push    dword [ebp-10H]                         ; 14B1 _ FF. 75, F0
        push    dword [ebp+8H]                          ; 14B4 _ FF. 75, 08
        call    file_loadfile                           ; 14B7 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 14BC _ 83. C4, 10
        call    get_addr_gdt                            ; 14BF _ E8, FFFFFFFC(rel)
        mov     dword [ebp-18H], eax                    ; 14C4 _ 89. 45, E8
        mov     eax, dword [ebp-14H]                    ; 14C7 _ 8B. 45, EC
        mov     edx, dword [eax]                        ; 14CA _ 8B. 10
        mov     eax, dword [first_task_cons_selector]   ; 14CC _ A1, 00000000(d)
        sub     edx, eax                                ; 14D1 _ 29. C2
        mov     eax, edx                                ; 14D3 _ 89. D0
        lea     edx, [eax+7H]                           ; 14D5 _ 8D. 50, 07
        test    eax, eax                                ; 14D8 _ 85. C0
        cmovs   eax, edx                                ; 14DA _ 0F 48. C2
        sar     eax, 3                                  ; 14DD _ C1. F8, 03
        add     eax, 21                                 ; 14E0 _ 83. C0, 15
        mov     dword [ebp-1CH], eax                    ; 14E3 _ 89. 45, E4
        mov     eax, dword [ebp-14H]                    ; 14E6 _ 8B. 45, EC
        mov     edx, dword [eax]                        ; 14E9 _ 8B. 10
        mov     eax, dword [first_task_cons_selector]   ; 14EB _ A1, 00000000(d)
        sub     edx, eax                                ; 14F0 _ 29. C2
        mov     eax, edx                                ; 14F2 _ 89. D0
        lea     edx, [eax+7H]                           ; 14F4 _ 8D. 50, 07
        test    eax, eax                                ; 14F7 _ 85. C0
        cmovs   eax, edx                                ; 14F9 _ 0F 48. C2
        sar     eax, 3                                  ; 14FC _ C1. F8, 03
        add     eax, 30                                 ; 14FF _ 83. C0, 1E
        mov     dword [ebp-20H], eax                    ; 1502 _ 89. 45, E0
        mov     eax, dword [ebp-10H]                    ; 1505 _ 8B. 45, F0
        mov     eax, dword [eax]                        ; 1508 _ 8B. 00
        mov     edx, eax                                ; 150A _ 89. C2
        mov     eax, dword [ebp-14H]                    ; 150C _ 8B. 45, EC
        add     eax, 188                                ; 150F _ 05, 000000BC
        push    16634                                   ; 1514 _ 68, 000040FA
        push    edx                                     ; 1519 _ 52
        push    1048575                                 ; 151A _ 68, 000FFFFF
        push    eax                                     ; 151F _ 50
        call    set_segmdesc                            ; 1520 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1525 _ 83. C4, 10
        mov     eax, dword [memman]                     ; 1528 _ A1, 00000000(d)
        sub     esp, 8                                  ; 152D _ 83. EC, 08
        push    65536                                   ; 1530 _ 68, 00010000
        push    eax                                     ; 1535 _ 50
        call    memman_alloc_4k                         ; 1536 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 153B _ 83. C4, 10
        mov     dword [ebp-24H], eax                    ; 153E _ 89. 45, DC
        mov     eax, dword [ebp-10H]                    ; 1541 _ 8B. 45, F0
        mov     edx, dword [ebp-24H]                    ; 1544 _ 8B. 55, DC
        mov     dword [eax+4H], edx                     ; 1547 _ 89. 50, 04
        mov     eax, dword [ebp-24H]                    ; 154A _ 8B. 45, DC
        mov     edx, dword [ebp-14H]                    ; 154D _ 8B. 55, EC
        add     edx, 196                                ; 1550 _ 81. C2, 000000C4
        push    16626                                   ; 1556 _ 68, 000040F2
        push    eax                                     ; 155B _ 50
        push    1048575                                 ; 155C _ 68, 000FFFFF
        push    edx                                     ; 1561 _ 52
        call    set_segmdesc                            ; 1562 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1567 _ 83. C4, 10
        mov     eax, dword [ebp-14H]                    ; 156A _ 8B. 45, EC
        mov     dword [eax+30H], 0                      ; 156D _ C7. 40, 30, 00000000
        call    io_sti                                  ; 1574 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-14H]                    ; 1579 _ 8B. 45, EC
        add     eax, 48                                 ; 157C _ 83. C0, 30
        sub     esp, 12                                 ; 157F _ 83. EC, 0C
        push    eax                                     ; 1582 _ 50
        push    12                                      ; 1583 _ 6A, 0C
        push    65536                                   ; 1585 _ 68, 00010000
        push    4                                       ; 158A _ 6A, 04
        push    0                                       ; 158C _ 6A, 00
        call    start_app                               ; 158E _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1593 _ 83. C4, 20
        call    io_cli                                  ; 1596 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], 0                      ; 159B _ C7. 45, F4, 00000000
        mov     dword [ebp-0CH], 0                      ; 15A2 _ C7. 45, F4, 00000000
        jmp     ?_087                                   ; 15A9 _ E9, 00000088

?_085:  mov     eax, dword [ebp-14H]                    ; 15AE _ 8B. 45, EC
        mov     ecx, dword [eax+0CCH]                   ; 15B1 _ 8B. 88, 000000CC
        mov     edx, dword [ebp-0CH]                    ; 15B7 _ 8B. 55, F4
        mov     eax, edx                                ; 15BA _ 89. D0
        add     eax, eax                                ; 15BC _ 01. C0
        add     eax, edx                                ; 15BE _ 01. D0
        shl     eax, 2                                  ; 15C0 _ C1. E0, 02
        add     eax, ecx                                ; 15C3 _ 01. C8
        mov     eax, dword [eax]                        ; 15C5 _ 8B. 00
        test    eax, eax                                ; 15C7 _ 85. C0
        jz near       ?_086                                   ; 15c9 _ 74, 67
        mov     eax, dword [ebp-14H]                    ; 15CB _ 8B. 45, EC
        mov     ecx, dword [eax+0CCH]                   ; 15CE _ 8B. 88, 000000CC
        mov     edx, dword [ebp-0CH]                    ; 15D4 _ 8B. 55, F4
        mov     eax, edx                                ; 15D7 _ 89. D0
        add     eax, eax                                ; 15D9 _ 01. C0
        add     eax, edx                                ; 15DB _ 01. D0
        shl     eax, 2                                  ; 15DD _ C1. E0, 02
        add     eax, ecx                                ; 15E0 _ 01. C8
        mov     eax, dword [eax+4H]                     ; 15E2 _ 8B. 40, 04
        mov     ebx, eax                                ; 15E5 _ 89. C3
        mov     eax, dword [ebp-14H]                    ; 15E7 _ 8B. 45, EC
        mov     ecx, dword [eax+0CCH]                   ; 15EA _ 8B. 88, 000000CC
        mov     edx, dword [ebp-0CH]                    ; 15F0 _ 8B. 55, F4
        mov     eax, edx                                ; 15F3 _ 89. D0
        add     eax, eax                                ; 15F5 _ 01. C0
        add     eax, edx                                ; 15F7 _ 01. D0
        shl     eax, 2                                  ; 15F9 _ C1. E0, 02
        add     eax, ecx                                ; 15FC _ 01. C8
        mov     eax, dword [eax]                        ; 15FE _ 8B. 00
        mov     edx, eax                                ; 1600 _ 89. C2
        mov     eax, dword [memman]                     ; 1602 _ A1, 00000000(d)
        sub     esp, 4                                  ; 1607 _ 83. EC, 04
        push    ebx                                     ; 160A _ 53
        push    edx                                     ; 160B _ 52
        push    eax                                     ; 160C _ 50
        call    memman_free_4k                          ; 160D _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1612 _ 83. C4, 10
        mov     eax, dword [ebp-14H]                    ; 1615 _ 8B. 45, EC
        mov     ecx, dword [eax+0CCH]                   ; 1618 _ 8B. 88, 000000CC
        mov     edx, dword [ebp-0CH]                    ; 161E _ 8B. 55, F4
        mov     eax, edx                                ; 1621 _ 89. D0
        add     eax, eax                                ; 1623 _ 01. C0
        add     eax, edx                                ; 1625 _ 01. D0
        shl     eax, 2                                  ; 1627 _ C1. E0, 02
        add     eax, ecx                                ; 162A _ 01. C8
        mov     dword [eax], 0                          ; 162C _ C7. 00, 00000000
?_086:  add     dword [ebp-0CH], 1                      ; 1632 _ 83. 45, F4, 01
?_087:  cmp     dword [ebp-0CH], 7                      ; 1636 _ 83. 7D, F4, 07
        jle near      ?_085                                   ; 163a _ 0f 8e, ffffff6e
        mov     eax, dword [ebp-10H]                    ; 1640 _ 8B. 45, F0
        mov     eax, dword [eax+8H]                     ; 1643 _ 8B. 40, 08
        mov     ecx, eax                                ; 1646 _ 89. C1
        mov     eax, dword [ebp-10H]                    ; 1648 _ 8B. 45, F0
        mov     eax, dword [eax]                        ; 164B _ 8B. 00
        mov     edx, eax                                ; 164D _ 89. C2
        mov     eax, dword [memman]                     ; 164F _ A1, 00000000(d)
        sub     esp, 4                                  ; 1654 _ 83. EC, 04
        push    ecx                                     ; 1657 _ 51
        push    edx                                     ; 1658 _ 52
        push    eax                                     ; 1659 _ 50
        call    memman_free_4k                          ; 165A _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 165F _ 83. C4, 10
        mov     edx, dword [ebp-24H]                    ; 1662 _ 8B. 55, DC
        mov     eax, dword [memman]                     ; 1665 _ A1, 00000000(d)
        sub     esp, 4                                  ; 166A _ 83. EC, 04
        push    65536                                   ; 166D _ 68, 00010000
        push    edx                                     ; 1672 _ 52
        push    eax                                     ; 1673 _ 50
        call    memman_free_4k                          ; 1674 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1679 _ 83. C4, 10
        mov     edx, dword [ebp-10H]                    ; 167C _ 8B. 55, F0
        mov     eax, dword [memman]                     ; 167F _ A1, 00000000(d)
        sub     esp, 4                                  ; 1684 _ 83. EC, 04
        push    16                                      ; 1687 _ 6A, 10
        push    edx                                     ; 1689 _ 52
        push    eax                                     ; 168A _ 50
        call    memman_free                             ; 168B _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1690 _ 83. C4, 10
        mov     eax, dword [ebp-14H]                    ; 1693 _ 8B. 45, EC
        mov     dword [eax+0B0H], 0                     ; 1696 _ C7. 80, 000000B0, 00000000
        call    io_sti                                  ; 16A0 _ E8, FFFFFFFC(rel)
        mov     ebx, dword [ebp-4H]                     ; 16A5 _ 8B. 5D, FC
        leave                                           ; 16A8 _ C9
        ret                                             ; 16A9 _ C3
; cmd_execute_program End of function

cmd_start:; Function begin
        push    ebp                                     ; 16AA _ 55
        mov     ebp, esp                                ; 16AB _ 89. E5
        sub     esp, 24                                 ; 16AD _ 83. EC, 18
        mov     eax, dword [console_count]              ; 16B0 _ A1, 00000000(d)
        sub     esp, 12                                 ; 16B5 _ 83. EC, 0C
        push    eax                                     ; 16B8 _ 50
        call    launch_console                          ; 16B9 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 16BE _ 83. C4, 10
        mov     dword [ebp-10H], eax                    ; 16C1 _ 89. 45, F0
        mov     eax, dword [shtctl]                     ; 16C4 _ A1, 00000284(d)
        push    176                                     ; 16C9 _ 68, 000000B0
        push    156                                     ; 16CE _ 68, 0000009C
        push    dword [ebp-10H]                         ; 16D3 _ FF. 75, F0
        push    eax                                     ; 16D6 _ 50
        call    sheet_slide                             ; 16D7 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 16DC _ 83. C4, 10
        mov     eax, dword [shtctl]                     ; 16DF _ A1, 00000284(d)
        sub     esp, 4                                  ; 16E4 _ 83. EC, 04
        push    1                                       ; 16E7 _ 6A, 01
        push    dword [ebp-10H]                         ; 16E9 _ FF. 75, F0
        push    eax                                     ; 16EC _ 50
        call    sheet_updown                            ; 16ED _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 16F2 _ 83. C4, 10
        mov     eax, dword [console_count]              ; 16F5 _ A1, 00000000(d)
        add     eax, 1                                  ; 16FA _ 83. C0, 01
        mov     dword [console_count], eax              ; 16FD _ A3, 00000000(d)
        mov     eax, dword [ebp-10H]                    ; 1702 _ 8B. 45, F0
        mov     eax, dword [eax+20H]                    ; 1705 _ 8B. 40, 20
        mov     dword [ebp-14H], eax                    ; 1708 _ 89. 45, EC
        mov     eax, dword [ebp-14H]                    ; 170B _ 8B. 45, EC
        mov     dword [eax+28H], 0                      ; 170E _ C7. 40, 28, 00000000
        mov     dword [ebp-0CH], 6                      ; 1715 _ C7. 45, F4, 00000006
        jmp     ?_089                                   ; 171C _ EB, 25

?_088:  mov     edx, dword [ebp-0CH]                    ; 171E _ 8B. 55, F4
        mov     eax, dword [ebp+8H]                     ; 1721 _ 8B. 45, 08
        add     eax, edx                                ; 1724 _ 01. D0
        movzx   eax, byte [eax]                         ; 1726 _ 0F B6. 00
        movzx   eax, al                                 ; 1729 _ 0F B6. C0
        mov     edx, dword [ebp-14H]                    ; 172C _ 8B. 55, EC
        add     edx, 16                                 ; 172F _ 83. C2, 10
        sub     esp, 8                                  ; 1732 _ 83. EC, 08
        push    eax                                     ; 1735 _ 50
        push    edx                                     ; 1736 _ 52
        call    fifo8_put                               ; 1737 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 173C _ 83. C4, 10
        add     dword [ebp-0CH], 1                      ; 173F _ 83. 45, F4, 01
?_089:  mov     edx, dword [ebp-0CH]                    ; 1743 _ 8B. 55, F4
        mov     eax, dword [ebp+8H]                     ; 1746 _ 8B. 45, 08
        add     eax, edx                                ; 1749 _ 01. D0
        movzx   eax, byte [eax]                         ; 174B _ 0F B6. 00
        test    al, al                                  ; 174E _ 84. C0
        jnz near      ?_088                                   ; 1750 _ 75, cc
        mov     eax, dword [ebp-14H]                    ; 1752 _ 8B. 45, EC
        mov     edx, dword [ebp-14H]                    ; 1755 _ 8B. 55, EC
        mov     dword [eax+28H], edx                    ; 1758 _ 89. 50, 28
        mov     eax, dword [ebp-14H]                    ; 175B _ 8B. 45, EC
        add     eax, 16                                 ; 175E _ 83. C0, 10
        sub     esp, 8                                  ; 1761 _ 83. EC, 08
        push    28                                      ; 1764 _ 6A, 1C
        push    eax                                     ; 1766 _ 50
        call    fifo8_put                               ; 1767 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 176C _ 83. C4, 10
        leave                                           ; 176F _ C9
        ret                                             ; 1770 _ C3
; cmd_start End of function

cmd_ncst:; Function begin
        push    ebp                                     ; 1771 _ 55
        mov     ebp, esp                                ; 1772 _ 89. E5
        sub     esp, 24                                 ; 1774 _ 83. EC, 18
        mov     eax, dword [console_count]              ; 1777 _ A1, 00000000(d)
        sub     esp, 12                                 ; 177C _ 83. EC, 0C
        push    eax                                     ; 177F _ 50
        call    launch_console                          ; 1780 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1785 _ 83. C4, 10
        mov     eax, dword [console_count]              ; 1788 _ A1, 00000000(d)
        add     eax, 1                                  ; 178D _ 83. C0, 01
        mov     dword [console_count], eax              ; 1790 _ A3, 00000000(d)
        mov     eax, dword [current_console_task]       ; 1795 _ A1, 00000298(d)
        mov     dword [ebp-10H], eax                    ; 179A _ 89. 45, F0
        mov     eax, dword [ebp-10H]                    ; 179D _ 8B. 45, F0
        mov     dword [eax+28H], 0                      ; 17A0 _ C7. 40, 28, 00000000
        mov     dword [ebp-0CH], 5                      ; 17A7 _ C7. 45, F4, 00000005
        mov     dword [ebp-14H], 0                      ; 17AE _ C7. 45, EC, 00000000
        jmp     ?_091                                   ; 17B5 _ EB, 25

?_090:  mov     edx, dword [ebp-0CH]                    ; 17B7 _ 8B. 55, F4
        mov     eax, dword [ebp+8H]                     ; 17BA _ 8B. 45, 08
        add     eax, edx                                ; 17BD _ 01. D0
        movzx   eax, byte [eax]                         ; 17BF _ 0F B6. 00
        movzx   eax, al                                 ; 17C2 _ 0F B6. C0
        mov     edx, dword [ebp-10H]                    ; 17C5 _ 8B. 55, F0
        add     edx, 16                                 ; 17C8 _ 83. C2, 10
        sub     esp, 8                                  ; 17CB _ 83. EC, 08
        push    eax                                     ; 17CE _ 50
        push    edx                                     ; 17CF _ 52
        call    fifo8_put                               ; 17D0 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 17D5 _ 83. C4, 10
        add     dword [ebp-0CH], 1                      ; 17D8 _ 83. 45, F4, 01
?_091:  mov     edx, dword [ebp-0CH]                    ; 17DC _ 8B. 55, F4
        mov     eax, dword [ebp+8H]                     ; 17DF _ 8B. 45, 08
        add     eax, edx                                ; 17E2 _ 01. D0
        movzx   eax, byte [eax]                         ; 17E4 _ 0F B6. 00
        test    al, al                                  ; 17E7 _ 84. C0
        jnz near      ?_090                                   ; 17e9 _ 75, cc
        mov     eax, dword [ebp-10H]                    ; 17EB _ 8B. 45, F0
        mov     edx, dword [ebp-10H]                    ; 17EE _ 8B. 55, F0
        mov     dword [eax+28H], edx                    ; 17F1 _ 89. 50, 28
        mov     eax, dword [ebp-10H]                    ; 17F4 _ 8B. 45, F0
        add     eax, 16                                 ; 17F7 _ 83. C0, 10
        sub     esp, 8                                  ; 17FA _ 83. EC, 08
        push    28                                      ; 17FD _ 6A, 1C
        push    eax                                     ; 17FF _ 50
        call    fifo8_put                               ; 1800 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1805 _ 83. C4, 10
        leave                                           ; 1808 _ C9
        ret                                             ; 1809 _ C3
; cmd_ncst End of function

console_task:; Function begin
        push    ebp                                     ; 180A _ 55
        mov     ebp, esp                                ; 180B _ 89. E5
        push    ebx                                     ; 180D _ 53
        sub     esp, 84                                 ; 180E _ 83. EC, 54
        call    task_now                                ; 1811 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 1816 _ 89. 45, F0
        mov     dword [ebp-0CH], 0                      ; 1819 _ C7. 45, F4, 00000000
        mov     dword [ebp-14H], 0                      ; 1820 _ C7. 45, EC, 00000000
        mov     dword [ebp-18H], 0                      ; 1827 _ C7. 45, E8, 00000000
        mov     eax, dword [memman]                     ; 182E _ A1, 00000000(d)
        sub     esp, 8                                  ; 1833 _ 83. EC, 08
        push    30                                      ; 1836 _ 6A, 1E
        push    eax                                     ; 1838 _ 50
        call    memman_alloc                            ; 1839 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 183E _ 83. C4, 10
        mov     dword [ebp-1CH], eax                    ; 1841 _ 89. 45, E4
        mov     dword [ebp-20H], 96                     ; 1844 _ C7. 45, E0, 00000060
        mov     dword [ebp-24H], 176                    ; 184B _ C7. 45, DC, 000000B0
        mov     eax, dword [ebp-10H]                    ; 1852 _ 8B. 45, F0
        mov     edx, dword [ebp+8H]                     ; 1855 _ 8B. 55, 08
        mov     dword [eax+94H], edx                    ; 1858 _ 89. 90, 00000094
        mov     eax, dword [ebp-10H]                    ; 185E _ 8B. 45, F0
        mov     dword [eax+98H], 16                     ; 1861 _ C7. 80, 00000098, 00000010
        mov     eax, dword [ebp-10H]                    ; 186B _ 8B. 45, F0
        mov     dword [eax+9CH], 28                     ; 186E _ C7. 80, 0000009C, 0000001C
        mov     eax, dword [ebp-10H]                    ; 1878 _ 8B. 45, F0
        mov     dword [eax+0A0H], -1                    ; 187B _ C7. 80, 000000A0, FFFFFFFF
        call    timer_alloc                             ; 1885 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-28H], eax                    ; 188A _ 89. 45, D8
        mov     eax, dword [ebp-10H]                    ; 188D _ 8B. 45, F0
        add     eax, 16                                 ; 1890 _ 83. C0, 10
        sub     esp, 4                                  ; 1893 _ 83. EC, 04
        push    1                                       ; 1896 _ 6A, 01
        push    eax                                     ; 1898 _ 50
        push    dword [ebp-28H]                         ; 1899 _ FF. 75, D8
        call    timer_init                              ; 189C _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 18A1 _ 83. C4, 10
        sub     esp, 8                                  ; 18A4 _ 83. EC, 08
        push    50                                      ; 18A7 _ 6A, 32
        push    dword [ebp-28H]                         ; 18A9 _ FF. 75, D8
        call    timer_settime                           ; 18AC _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 18B1 _ 83. C4, 10
        mov     eax, dword [ebp-10H]                    ; 18B4 _ 8B. 45, F0
        mov     edx, dword [ebp-28H]                    ; 18B7 _ 8B. 55, D8
        mov     dword [eax+0A8H], edx                   ; 18BA _ 89. 90, 000000A8
        mov     eax, dword [ebp-10H]                    ; 18C0 _ 8B. 45, F0
        mov     edx, dword [ebp-1CH]                    ; 18C3 _ 8B. 55, E4
        mov     dword [eax+0ACH], edx                   ; 18C6 _ 89. 90, 000000AC
        mov     eax, dword [shtctl]                     ; 18CC _ A1, 00000284(d)
        sub     esp, 8                                  ; 18D1 _ 83. EC, 08
        push    ?_428                                   ; 18D4 _ 68, 00000023(d)
        push    7                                       ; 18D9 _ 6A, 07
        push    28                                      ; 18DB _ 6A, 1C
        push    8                                       ; 18DD _ 6A, 08
        push    dword [ebp+8H]                          ; 18DF _ FF. 75, 08
        push    eax                                     ; 18E2 _ 50
        call    showString                              ; 18E3 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 18E8 _ 83. C4, 20
        mov     dword [ebp-2CH], 88064                  ; 18EB _ C7. 45, D4, 00015800
        mov     dword [ebp-30H], 0                      ; 18F2 _ C7. 45, D0, 00000000
?_092:  call    io_cli                                  ; 18F9 _ E8, FFFFFFFC(rel)
        call    task_now                                ; 18FE _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 1903 _ 89. 45, F0
        mov     eax, dword [ebp-10H]                    ; 1906 _ 8B. 45, F0
        add     eax, 16                                 ; 1909 _ 83. C0, 10
        sub     esp, 12                                 ; 190C _ 83. EC, 0C
        push    eax                                     ; 190F _ 50
        call    fifo8_status                            ; 1910 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1915 _ 83. C4, 10
        test    eax, eax                                ; 1918 _ 85. C0
        jnz near      ?_093                                   ; 191a _ 75, 0a
        call    io_sti                                  ; 191C _ E8, FFFFFFFC(rel)
        jmp     ?_111                                   ; 1921 _ E9, 000004BB

?_093:  mov     eax, dword [ebp-10H]                    ; 1926 _ 8B. 45, F0
        add     eax, 16                                 ; 1929 _ 83. C0, 10
        sub     esp, 12                                 ; 192C _ 83. EC, 0C
        push    eax                                     ; 192F _ 50
        call    fifo8_get                               ; 1930 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1935 _ 83. C4, 10
        mov     dword [ebp-34H], eax                    ; 1938 _ 89. 45, CC
        cmp     dword [ebp-34H], 1                      ; 193B _ 83. 7D, CC, 01
        jg  near      ?_096                                   ; 193f _ 7f, 5f
        cmp     dword [ebp-0CH], 0                      ; 1941 _ 83. 7D, F4, 00
        js near       ?_096                                   ; 1945 _ 78, 59
        cmp     dword [ebp-34H], 0                      ; 1947 _ 83. 7D, CC, 00
        jz near       ?_094                                   ; 194b _ 74, 20
        mov     eax, dword [ebp-10H]                    ; 194D _ 8B. 45, F0
        add     eax, 16                                 ; 1950 _ 83. C0, 10
        sub     esp, 4                                  ; 1953 _ 83. EC, 04
        push    0                                       ; 1956 _ 6A, 00
        push    eax                                     ; 1958 _ 50
        push    dword [ebp-28H]                         ; 1959 _ FF. 75, D8
        call    timer_init                              ; 195C _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1961 _ 83. C4, 10
        mov     dword [ebp-0CH], 7                      ; 1964 _ C7. 45, F4, 00000007
        jmp     ?_095                                   ; 196B _ EB, 1E

?_094:  mov     eax, dword [ebp-10H]                    ; 196D _ 8B. 45, F0
        add     eax, 16                                 ; 1970 _ 83. C0, 10
        sub     esp, 4                                  ; 1973 _ 83. EC, 04
        push    1                                       ; 1976 _ 6A, 01
        push    eax                                     ; 1978 _ 50
        push    dword [ebp-28H]                         ; 1979 _ FF. 75, D8
        call    timer_init                              ; 197C _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1981 _ 83. C4, 10
        mov     dword [ebp-0CH], 0                      ; 1984 _ C7. 45, F4, 00000000
?_095:  sub     esp, 8                                  ; 198B _ 83. EC, 08
        push    50                                      ; 198E _ 6A, 32
        push    dword [ebp-28H]                         ; 1990 _ FF. 75, D8
        call    timer_settime                           ; 1993 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1998 _ 83. C4, 10
        jmp     ?_110                                   ; 199B _ E9, 000003FC

?_096:  cmp     dword [ebp-34H], 87                     ; 19A0 _ 83. 7D, CC, 57
        jnz near      ?_097                                   ; 19a4 _ 75, 33
        mov     dword [ebp-0CH], 7                      ; 19A6 _ C7. 45, F4, 00000007
        mov     eax, dword [ebp-10H]                    ; 19AD _ 8B. 45, F0
        add     eax, 16                                 ; 19B0 _ 83. C0, 10
        sub     esp, 4                                  ; 19B3 _ 83. EC, 04
        push    0                                       ; 19B6 _ 6A, 00
        push    eax                                     ; 19B8 _ 50
        push    dword [ebp-28H]                         ; 19B9 _ FF. 75, D8
        call    timer_init                              ; 19BC _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 19C1 _ 83. C4, 10
        sub     esp, 8                                  ; 19C4 _ 83. EC, 08
        push    50                                      ; 19C7 _ 6A, 32
        push    dword [ebp-28H]                         ; 19C9 _ FF. 75, D8
        call    timer_settime                           ; 19CC _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 19D1 _ 83. C4, 10
        jmp     ?_110                                   ; 19D4 _ E9, 000003C3

?_097:  cmp     dword [ebp-34H], 88                     ; 19D9 _ 83. 7D, CC, 58
        jnz near      ?_098                                   ; 19dd _ 75, 59
        mov     eax, dword [ebp-10H]                    ; 19DF _ 8B. 45, F0
        mov     ecx, dword [eax+9CH]                    ; 19E2 _ 8B. 88, 0000009C
        mov     eax, dword [ebp-10H]                    ; 19E8 _ 8B. 45, F0
        mov     edx, dword [eax+98H]                    ; 19EB _ 8B. 90, 00000098
        mov     eax, dword [shtctl]                     ; 19F1 _ A1, 00000284(d)
        sub     esp, 12                                 ; 19F6 _ 83. EC, 0C
        push    0                                       ; 19F9 _ 6A, 00
        push    ecx                                     ; 19FB _ 51
        push    edx                                     ; 19FC _ 52
        push    dword [ebp+8H]                          ; 19FD _ FF. 75, 08
        push    eax                                     ; 1A00 _ 50
        call    set_cursor                              ; 1A01 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1A06 _ 83. C4, 20
        mov     dword [ebp-0CH], -1                     ; 1A09 _ C7. 45, F4, FFFFFFFF
        mov     eax, dword [task_main]                  ; 1A10 _ A1, 00000294(d)
        sub     esp, 4                                  ; 1A15 _ 83. EC, 04
        push    0                                       ; 1A18 _ 6A, 00
        push    -1                                      ; 1A1A _ 6A, FF
        push    eax                                     ; 1A1C _ 50
        call    task_run                                ; 1A1D _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1A22 _ 83. C4, 10
        sub     esp, 12                                 ; 1A25 _ 83. EC, 0C
        push    dword [ebp-10H]                         ; 1A28 _ FF. 75, F0
        call    task_sleep                              ; 1A2B _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1A30 _ 83. C4, 10
        jmp     ?_110                                   ; 1A33 _ E9, 00000364

?_098:  cmp     dword [ebp-34H], 28                     ; 1A38 _ 83. 7D, CC, 1C
        jne near      ?_108                                   ; 1a3c _ 0f 85, 0000021c
        mov     eax, dword [ebp-10H]                    ; 1A42 _ 8B. 45, F0
        mov     ecx, dword [eax+9CH]                    ; 1A45 _ 8B. 88, 0000009C
        mov     eax, dword [ebp-10H]                    ; 1A4B _ 8B. 45, F0
        mov     edx, dword [eax+98H]                    ; 1A4E _ 8B. 90, 00000098
        mov     eax, dword [shtctl]                     ; 1A54 _ A1, 00000284(d)
        sub     esp, 12                                 ; 1A59 _ 83. EC, 0C
        push    0                                       ; 1A5C _ 6A, 00
        push    ecx                                     ; 1A5E _ 51
        push    edx                                     ; 1A5F _ 52
        push    dword [ebp+8H]                          ; 1A60 _ FF. 75, 08
        push    eax                                     ; 1A63 _ 50
        call    set_cursor                              ; 1A64 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1A69 _ 83. C4, 20
        mov     eax, dword [ebp-10H]                    ; 1A6C _ 8B. 45, F0
        mov     eax, dword [eax+98H]                    ; 1A6F _ 8B. 80, 00000098
        lea     edx, [eax+7H]                           ; 1A75 _ 8D. 50, 07
        test    eax, eax                                ; 1A78 _ 85. C0
        cmovs   eax, edx                                ; 1A7A _ 0F 48. C2
        sar     eax, 3                                  ; 1A7D _ C1. F8, 03
        lea     edx, [eax-2H]                           ; 1A80 _ 8D. 50, FE
        mov     eax, dword [ebp-1CH]                    ; 1A83 _ 8B. 45, E4
        add     eax, edx                                ; 1A86 _ 01. D0
        mov     byte [eax], 0                           ; 1A88 _ C6. 00, 00
        mov     eax, dword [ebp-10H]                    ; 1A8B _ 8B. 45, F0
        mov     eax, dword [eax+98H]                    ; 1A8E _ 8B. 80, 00000098
        lea     edx, [eax+7H]                           ; 1A94 _ 8D. 50, 07
        test    eax, eax                                ; 1A97 _ 85. C0
        cmovs   eax, edx                                ; 1A99 _ 0F 48. C2
        sar     eax, 3                                  ; 1A9C _ C1. F8, 03
        sub     eax, 2                                  ; 1A9F _ 83. E8, 02
        mov     byte [ebp+eax-55H], 0                   ; 1AA2 _ C6. 44 05, AB, 00
        mov     eax, dword [ebp-10H]                    ; 1AA7 _ 8B. 45, F0
        mov     eax, dword [eax+9CH]                    ; 1AAA _ 8B. 80, 0000009C
        sub     esp, 8                                  ; 1AB0 _ 83. EC, 08
        push    dword [ebp+8H]                          ; 1AB3 _ FF. 75, 08
        push    eax                                     ; 1AB6 _ 50
        call    cons_newline                            ; 1AB7 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1ABC _ 83. C4, 10
        mov     edx, eax                                ; 1ABF _ 89. C2
        mov     eax, dword [ebp-10H]                    ; 1AC1 _ 8B. 45, F0
        mov     dword [eax+9CH], edx                    ; 1AC4 _ 89. 90, 0000009C
        sub     esp, 8                                  ; 1ACA _ 83. EC, 08
        push    ?_429                                   ; 1ACD _ 68, 00000025(d)
        push    dword [ebp-1CH]                         ; 1AD2 _ FF. 75, E4
        call    strcmp                                  ; 1AD5 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1ADA _ 83. C4, 10
        cmp     eax, 1                                  ; 1ADD _ 83. F8, 01
        jnz near      ?_099                                   ; 1ae0 _ 75, 13
        sub     esp, 12                                 ; 1AE2 _ 83. EC, 0C
        push    dword [ebp+0CH]                         ; 1AE5 _ FF. 75, 0C
        call    cmd_mem                                 ; 1AE8 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1AED _ 83. C4, 10
        jmp     ?_107                                   ; 1AF0 _ E9, 00000157

?_099:  sub     esp, 8                                  ; 1AF5 _ 83. EC, 08
        push    ?_430                                   ; 1AF8 _ 68, 00000029(d)
        push    dword [ebp-1CH]                         ; 1AFD _ FF. 75, E4
        call    strcmp                                  ; 1B00 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1B05 _ 83. C4, 10
        cmp     eax, 1                                  ; 1B08 _ 83. F8, 01
        jnz near      ?_100                                   ; 1b0b _ 75, 0a
        call    cmd_cls                                 ; 1B0D _ E8, FFFFFFFC(rel)
        jmp     ?_107                                   ; 1B12 _ E9, 00000135

?_100:  sub     esp, 8                                  ; 1B17 _ 83. EC, 08
        push    ?_431                                   ; 1B1A _ 68, 0000002D(d)
        push    dword [ebp-1CH]                         ; 1B1F _ FF. 75, E4
        call    strcmp                                  ; 1B22 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1B27 _ 83. C4, 10
        cmp     eax, 1                                  ; 1B2A _ 83. F8, 01
        jnz near      ?_101                                   ; 1b2d _ 75, 15
        sub     esp, 12                                 ; 1B2F _ 83. EC, 0C
        push    ?_432                                   ; 1B32 _ 68, 00000031(d)
        call    cmd_execute_program                     ; 1B37 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1B3C _ 83. C4, 10
        jmp     ?_107                                   ; 1B3F _ E9, 00000108

?_101:  sub     esp, 8                                  ; 1B44 _ 83. EC, 08
        push    ?_433                                   ; 1B47 _ 68, 00000039(d)
        push    dword [ebp-1CH]                         ; 1B4C _ FF. 75, E4
        call    strcmp                                  ; 1B4F _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1B54 _ 83. C4, 10
        cmp     eax, 1                                  ; 1B57 _ 83. F8, 01
        jnz near      ?_102                                   ; 1b5a _ 75, 0a
        call    cmd_dir                                 ; 1B5C _ E8, FFFFFFFC(rel)
        jmp     ?_107                                   ; 1B61 _ E9, 000000E6

?_102:  sub     esp, 8                                  ; 1B66 _ 83. EC, 08
        push    ?_434                                   ; 1B69 _ 68, 0000003D(d)
        push    dword [ebp-1CH]                         ; 1B6E _ FF. 75, E4
        call    strcmp                                  ; 1B71 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1B76 _ 83. C4, 10
        cmp     eax, 1                                  ; 1B79 _ 83. F8, 01
        jnz near      ?_103                                   ; 1b7c _ 75, 13
        sub     esp, 12                                 ; 1B7E _ 83. EC, 0C
        push    dword [ebp-10H]                         ; 1B81 _ FF. 75, F0
        call    cmd_exit                                ; 1B84 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1B89 _ 83. C4, 10
        jmp     ?_107                                   ; 1B8C _ E9, 000000BB

?_103:  mov     eax, dword [ebp-1CH]                    ; 1B91 _ 8B. 45, E4
        movzx   eax, byte [eax]                         ; 1B94 _ 0F B6. 00
        cmp     al, 116                                 ; 1B97 _ 3C, 74
        jnz near      ?_104                                   ; 1b99 _ 75, 37
        mov     eax, dword [ebp-1CH]                    ; 1B9B _ 8B. 45, E4
        add     eax, 1                                  ; 1B9E _ 83. C0, 01
        movzx   eax, byte [eax]                         ; 1BA1 _ 0F B6. 00
        cmp     al, 121                                 ; 1BA4 _ 3C, 79
        jnz near      ?_104                                   ; 1ba6 _ 75, 2a
        mov     eax, dword [ebp-1CH]                    ; 1BA8 _ 8B. 45, E4
        add     eax, 2                                  ; 1BAB _ 83. C0, 02
        movzx   eax, byte [eax]                         ; 1BAE _ 0F B6. 00
        cmp     al, 112                                 ; 1BB1 _ 3C, 70
        jnz near      ?_104                                   ; 1bb3 _ 75, 1d
        mov     eax, dword [ebp-1CH]                    ; 1BB5 _ 8B. 45, E4
        add     eax, 3                                  ; 1BB8 _ 83. C0, 03
        movzx   eax, byte [eax]                         ; 1BBB _ 0F B6. 00
        cmp     al, 101                                 ; 1BBE _ 3C, 65
        jnz near      ?_104                                   ; 1bc0 _ 75, 10
        sub     esp, 12                                 ; 1BC2 _ 83. EC, 0C
        push    dword [ebp-1CH]                         ; 1BC5 _ FF. 75, E4
        call    cmd_type                                ; 1BC8 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1BCD _ 83. C4, 10
        jmp     ?_107                                   ; 1BD0 _ EB, 7A

?_104:  sub     esp, 8                                  ; 1BD2 _ 83. EC, 08
        push    ?_435                                   ; 1BD5 _ 68, 00000042(d)
        push    dword [ebp-1CH]                         ; 1BDA _ FF. 75, E4
        call    strcmp                                  ; 1BDD _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1BE2 _ 83. C4, 10
        cmp     eax, 1                                  ; 1BE5 _ 83. F8, 01
        jnz near      ?_105                                   ; 1be8 _ 75, 11
        sub     esp, 12                                 ; 1BEA _ 83. EC, 0C
        lea     eax, [ebp-55H]                          ; 1BED _ 8D. 45, AB
        push    eax                                     ; 1BF0 _ 50
        call    cmd_start                               ; 1BF1 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1BF6 _ 83. C4, 10
        jmp     ?_107                                   ; 1BF9 _ EB, 51

?_105:  sub     esp, 8                                  ; 1BFB _ 83. EC, 08
        push    ?_436                                   ; 1BFE _ 68, 00000048(d)
        push    dword [ebp-1CH]                         ; 1C03 _ FF. 75, E4
        call    strcmp                                  ; 1C06 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1C0B _ 83. C4, 10
        cmp     eax, 1                                  ; 1C0E _ 83. F8, 01
        jnz near      ?_106                                   ; 1c11 _ 75, 11
        sub     esp, 12                                 ; 1C13 _ 83. EC, 0C
        lea     eax, [ebp-55H]                          ; 1C16 _ 8D. 45, AB
        push    eax                                     ; 1C19 _ 50
        call    cmd_ncst                                ; 1C1A _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1C1F _ 83. C4, 10
        jmp     ?_107                                   ; 1C22 _ EB, 28

?_106:  sub     esp, 8                                  ; 1C24 _ 83. EC, 08
        push    ?_437                                   ; 1C27 _ 68, 0000004D(d)
        push    dword [ebp-1CH]                         ; 1C2C _ FF. 75, E4
        call    strcmp                                  ; 1C2F _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1C34 _ 83. C4, 10
        cmp     eax, 1                                  ; 1C37 _ 83. F8, 01
        jnz near      ?_107                                   ; 1c3a _ 75, 10
        sub     esp, 12                                 ; 1C3C _ 83. EC, 0C
        push    ?_438                                   ; 1C3F _ 68, 00000053(d)
        call    cmd_execute_program                     ; 1C44 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1C49 _ 83. C4, 10
?_107:  mov     eax, dword [ebp-10H]                    ; 1C4C _ 8B. 45, F0
        mov     dword [eax+98H], 16                     ; 1C4F _ C7. 80, 00000098, 00000010
        jmp     ?_110                                   ; 1C59 _ E9, 0000013E

?_108:  cmp     dword [ebp-34H], 14                     ; 1C5E _ 83. 7D, CC, 0E
        jnz near      ?_109                                   ; 1c62 _ 75, 7c
        mov     eax, dword [ebp-10H]                    ; 1C64 _ 8B. 45, F0
        mov     eax, dword [eax+98H]                    ; 1C67 _ 8B. 80, 00000098
        cmp     eax, 8                                  ; 1C6D _ 83. F8, 08
        jle near      ?_109                                   ; 1c70 _ 7e, 6e
        mov     eax, dword [ebp-10H]                    ; 1C72 _ 8B. 45, F0
        mov     ecx, dword [eax+9CH]                    ; 1C75 _ 8B. 88, 0000009C
        mov     eax, dword [ebp-10H]                    ; 1C7B _ 8B. 45, F0
        mov     edx, dword [eax+98H]                    ; 1C7E _ 8B. 90, 00000098
        mov     eax, dword [shtctl]                     ; 1C84 _ A1, 00000284(d)
        sub     esp, 12                                 ; 1C89 _ 83. EC, 0C
        push    0                                       ; 1C8C _ 6A, 00
        push    ecx                                     ; 1C8E _ 51
        push    edx                                     ; 1C8F _ 52
        push    dword [ebp+8H]                          ; 1C90 _ FF. 75, 08
        push    eax                                     ; 1C93 _ 50
        call    set_cursor                              ; 1C94 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1C99 _ 83. C4, 20
        mov     eax, dword [ebp-10H]                    ; 1C9C _ 8B. 45, F0
        mov     eax, dword [eax+98H]                    ; 1C9F _ 8B. 80, 00000098
        lea     edx, [eax-8H]                           ; 1CA5 _ 8D. 50, F8
        mov     eax, dword [ebp-10H]                    ; 1CA8 _ 8B. 45, F0
        mov     dword [eax+98H], edx                    ; 1CAB _ 89. 90, 00000098
        mov     eax, dword [ebp-10H]                    ; 1CB1 _ 8B. 45, F0
        mov     ecx, dword [eax+9CH]                    ; 1CB4 _ 8B. 88, 0000009C
        mov     eax, dword [ebp-10H]                    ; 1CBA _ 8B. 45, F0
        mov     edx, dword [eax+98H]                    ; 1CBD _ 8B. 90, 00000098
        mov     eax, dword [shtctl]                     ; 1CC3 _ A1, 00000284(d)
        sub     esp, 12                                 ; 1CC8 _ 83. EC, 0C
        push    0                                       ; 1CCB _ 6A, 00
        push    ecx                                     ; 1CCD _ 51
        push    edx                                     ; 1CCE _ 52
        push    dword [ebp+8H]                          ; 1CCF _ FF. 75, 08
        push    eax                                     ; 1CD2 _ 50
        call    set_cursor                              ; 1CD3 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1CD8 _ 83. C4, 20
        jmp     ?_110                                   ; 1CDB _ E9, 000000BC

?_109:  sub     esp, 12                                 ; 1CE0 _ 83. EC, 0C
        push    dword [ebp-34H]                         ; 1CE3 _ FF. 75, CC
        call    transferScanCode                        ; 1CE6 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1CEB _ 83. C4, 10
        mov     byte [ebp-35H], al                      ; 1CEE _ 88. 45, CB
        mov     eax, dword [ebp-10H]                    ; 1CF1 _ 8B. 45, F0
        mov     eax, dword [eax+98H]                    ; 1CF4 _ 8B. 80, 00000098
        cmp     eax, 239                                ; 1CFA _ 3D, 000000EF
        jg  near      ?_110                                   ; 1cff _ 0f 8f, 00000097
        cmp     byte [ebp-35H], 0                       ; 1D05 _ 80. 7D, CB, 00
        je near       ?_110                                   ; 1d09 _ 0f 84, 0000008d
        mov     eax, dword [ebp-10H]                    ; 1D0F _ 8B. 45, F0
        mov     eax, dword [eax+98H]                    ; 1D12 _ 8B. 80, 00000098
        lea     edx, [eax+7H]                           ; 1D18 _ 8D. 50, 07
        test    eax, eax                                ; 1D1B _ 85. C0
        cmovs   eax, edx                                ; 1D1D _ 0F 48. C2
        sar     eax, 3                                  ; 1D20 _ C1. F8, 03
        lea     edx, [eax-2H]                           ; 1D23 _ 8D. 50, FE
        mov     eax, dword [ebp-1CH]                    ; 1D26 _ 8B. 45, E4
        add     edx, eax                                ; 1D29 _ 01. C2
        movzx   eax, byte [ebp-35H]                     ; 1D2B _ 0F B6. 45, CB
        mov     byte [edx], al                          ; 1D2F _ 88. 02
        mov     eax, dword [ebp-10H]                    ; 1D31 _ 8B. 45, F0
        mov     eax, dword [eax+98H]                    ; 1D34 _ 8B. 80, 00000098
        lea     edx, [eax+7H]                           ; 1D3A _ 8D. 50, 07
        test    eax, eax                                ; 1D3D _ 85. C0
        cmovs   eax, edx                                ; 1D3F _ 0F 48. C2
        sar     eax, 3                                  ; 1D42 _ C1. F8, 03
        lea     edx, [eax-1H]                           ; 1D45 _ 8D. 50, FF
        mov     eax, dword [ebp-1CH]                    ; 1D48 _ 8B. 45, E4
        add     eax, edx                                ; 1D4B _ 01. D0
        mov     byte [eax], 0                           ; 1D4D _ C6. 00, 00
        mov     eax, dword [ebp-10H]                    ; 1D50 _ 8B. 45, F0
        mov     eax, dword [eax+98H]                    ; 1D53 _ 8B. 80, 00000098
        lea     edx, [eax+7H]                           ; 1D59 _ 8D. 50, 07
        test    eax, eax                                ; 1D5C _ 85. C0
        cmovs   eax, edx                                ; 1D5E _ 0F 48. C2
        sar     eax, 3                                  ; 1D61 _ C1. F8, 03
        sub     eax, 2                                  ; 1D64 _ 83. E8, 02
        mov     edx, dword [ebp-34H]                    ; 1D67 _ 8B. 55, CC
        mov     byte [ebp+eax-55H], dl                  ; 1D6A _ 88. 54 05, AB
        mov     eax, dword [ebp-10H]                    ; 1D6E _ 8B. 45, F0
        mov     eax, dword [eax+98H]                    ; 1D71 _ 8B. 80, 00000098
        lea     edx, [eax+7H]                           ; 1D77 _ 8D. 50, 07
        test    eax, eax                                ; 1D7A _ 85. C0
        cmovs   eax, edx                                ; 1D7C _ 0F 48. C2
        sar     eax, 3                                  ; 1D7F _ C1. F8, 03
        sub     eax, 1                                  ; 1D82 _ 83. E8, 01
        mov     byte [ebp+eax-55H], 0                   ; 1D85 _ C6. 44 05, AB, 00
        movsx   eax, byte [ebp-35H]                     ; 1D8A _ 0F BE. 45, CB
        sub     esp, 8                                  ; 1D8E _ 83. EC, 08
        push    1                                       ; 1D91 _ 6A, 01
        push    eax                                     ; 1D93 _ 50
        call    cons_putchar                            ; 1D94 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1D99 _ 83. C4, 10
?_110:  cmp     dword [ebp-0CH], 0                      ; 1D9C _ 83. 7D, F4, 00
        js near       ?_111                                   ; 1da0 _ 78, 3f
        mov     eax, dword [ebp-10H]                    ; 1DA2 _ 8B. 45, F0
        mov     eax, dword [eax+94H]                    ; 1DA5 _ 8B. 80, 00000094
        test    eax, eax                                ; 1DAB _ 85. C0
        jz near       ?_111                                   ; 1dad _ 74, 32
        mov     eax, dword [ebp-10H]                    ; 1DAF _ 8B. 45, F0
        mov     ebx, dword [eax+9CH]                    ; 1DB2 _ 8B. 98, 0000009C
        mov     eax, dword [ebp-10H]                    ; 1DB8 _ 8B. 45, F0
        mov     ecx, dword [eax+98H]                    ; 1DBB _ 8B. 88, 00000098
        mov     eax, dword [ebp-10H]                    ; 1DC1 _ 8B. 45, F0
        mov     edx, dword [eax+94H]                    ; 1DC4 _ 8B. 90, 00000094
        mov     eax, dword [shtctl]                     ; 1DCA _ A1, 00000284(d)
        sub     esp, 12                                 ; 1DCF _ 83. EC, 0C
        push    dword [ebp-0CH]                         ; 1DD2 _ FF. 75, F4
        push    ebx                                     ; 1DD5 _ 53
        push    ecx                                     ; 1DD6 _ 51
        push    edx                                     ; 1DD7 _ 52
        push    eax                                     ; 1DD8 _ 50
        call    set_cursor                              ; 1DD9 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1DDE _ 83. C4, 20
?_111:  call    io_sti                                  ; 1DE1 _ E8, FFFFFFFC(rel)
        jmp     ?_092                                   ; 1DE6 _ E9, FFFFFB0E
; console_task End of function

cons_putstr:; Function begin
        push    ebp                                     ; 1DEB _ 55
        mov     ebp, esp                                ; 1DEC _ 89. E5
        sub     esp, 8                                  ; 1DEE _ 83. EC, 08
        jmp     ?_113                                   ; 1DF1 _ EB, 1B

?_112:  mov     eax, dword [ebp+8H]                     ; 1DF3 _ 8B. 45, 08
        movzx   eax, byte [eax]                         ; 1DF6 _ 0F B6. 00
        movsx   eax, al                                 ; 1DF9 _ 0F BE. C0
        sub     esp, 8                                  ; 1DFC _ 83. EC, 08
        push    1                                       ; 1DFF _ 6A, 01
        push    eax                                     ; 1E01 _ 50
        call    cons_putchar                            ; 1E02 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1E07 _ 83. C4, 10
        add     dword [ebp+8H], 1                       ; 1E0A _ 83. 45, 08, 01
?_113:  mov     eax, dword [ebp+8H]                     ; 1E0E _ 8B. 45, 08
        movzx   eax, byte [eax]                         ; 1E11 _ 0F B6. 00
        test    al, al                                  ; 1E14 _ 84. C0
        jnz near      ?_112                                   ; 1e16 _ 75, db
        nop                                             ; 1E18 _ 90
        leave                                           ; 1E19 _ C9
        ret                                             ; 1E1A _ C3
; cons_putstr End of function

api_linewin:; Function begin
        push    ebp                                     ; 1E1B _ 55
        mov     ebp, esp                                ; 1E1C _ 89. E5
        sub     esp, 32                                 ; 1E1E _ 83. EC, 20
        mov     eax, dword [ebp+14H]                    ; 1E21 _ 8B. 45, 14
        sub     eax, dword [ebp+0CH]                    ; 1E24 _ 2B. 45, 0C
        mov     dword [ebp-14H], eax                    ; 1E27 _ 89. 45, EC
        mov     eax, dword [ebp+18H]                    ; 1E2A _ 8B. 45, 18
        sub     eax, dword [ebp+10H]                    ; 1E2D _ 2B. 45, 10
        mov     dword [ebp-18H], eax                    ; 1E30 _ 89. 45, E8
        mov     eax, dword [ebp+0CH]                    ; 1E33 _ 8B. 45, 0C
        shl     eax, 10                                 ; 1E36 _ C1. E0, 0A
        mov     dword [ebp-8H], eax                     ; 1E39 _ 89. 45, F8
        mov     eax, dword [ebp+10H]                    ; 1E3C _ 8B. 45, 10
        shl     eax, 10                                 ; 1E3F _ C1. E0, 0A
        mov     dword [ebp-0CH], eax                    ; 1E42 _ 89. 45, F4
        cmp     dword [ebp-14H], 0                      ; 1E45 _ 83. 7D, EC, 00
        jns near      ?_114                                   ; 1e49 _ 79, 03
        neg     dword [ebp-14H]                         ; 1E4B _ F7. 5D, EC
?_114:  cmp     dword [ebp-18H], 0                      ; 1E4E _ 83. 7D, E8, 00
        jns near      ?_115                                   ; 1e52 _ 79, 03
        neg     dword [ebp-18H]                         ; 1E54 _ F7. 5D, E8
?_115:  mov     eax, dword [ebp-14H]                    ; 1E57 _ 8B. 45, EC
        cmp     eax, dword [ebp-18H]                    ; 1E5A _ 3B. 45, E8
        jl      ?_119                                   ; 1E5D _ 7C, 53
        mov     eax, dword [ebp-14H]                    ; 1E5F _ 8B. 45, EC
        add     eax, 1                                  ; 1E62 _ 83. C0, 01
        mov     dword [ebp-10H], eax                    ; 1E65 _ 89. 45, F0
        mov     eax, dword [ebp+0CH]                    ; 1E68 _ 8B. 45, 0C
        cmp     eax, dword [ebp+14H]                    ; 1E6B _ 3B. 45, 14
        jle near      ?_116                                   ; 1e6e _ 7e, 09
        mov     dword [ebp-14H], -1024                  ; 1E70 _ C7. 45, EC, FFFFFC00
        jmp     ?_117                                   ; 1E77 _ EB, 07

?_116:  mov     dword [ebp-14H], 1024                   ; 1E79 _ C7. 45, EC, 00000400
?_117:  mov     eax, dword [ebp+10H]                    ; 1E80 _ 8B. 45, 10
        cmp     eax, dword [ebp+18H]                    ; 1E83 _ 3B. 45, 18
        jg  near      ?_118                                   ; 1e86 _ 7f, 15
        mov     eax, dword [ebp+18H]                    ; 1E88 _ 8B. 45, 18
        sub     eax, dword [ebp+10H]                    ; 1E8B _ 2B. 45, 10
        add     eax, 1                                  ; 1E8E _ 83. C0, 01
        shl     eax, 10                                 ; 1E91 _ C1. E0, 0A
        cdq                                             ; 1E94 _ 99
        idiv    dword [ebp-10H]                         ; 1E95 _ F7. 7D, F0
        mov     dword [ebp-18H], eax                    ; 1E98 _ 89. 45, E8
        jmp     ?_123                                   ; 1E9B _ EB, 66

?_118:  mov     eax, dword [ebp+18H]                    ; 1E9D _ 8B. 45, 18
        sub     eax, dword [ebp+10H]                    ; 1EA0 _ 2B. 45, 10
        sub     eax, 1                                  ; 1EA3 _ 83. E8, 01
        shl     eax, 10                                 ; 1EA6 _ C1. E0, 0A
        cdq                                             ; 1EA9 _ 99
        idiv    dword [ebp-10H]                         ; 1EAA _ F7. 7D, F0
        mov     dword [ebp-18H], eax                    ; 1EAD _ 89. 45, E8
        jmp     ?_123                                   ; 1EB0 _ EB, 51

?_119:  mov     eax, dword [ebp-18H]                    ; 1EB2 _ 8B. 45, E8
        add     eax, 1                                  ; 1EB5 _ 83. C0, 01
        mov     dword [ebp-10H], eax                    ; 1EB8 _ 89. 45, F0
        mov     eax, dword [ebp+10H]                    ; 1EBB _ 8B. 45, 10
        cmp     eax, dword [ebp+18H]                    ; 1EBE _ 3B. 45, 18
        jle near      ?_120                                   ; 1ec1 _ 7e, 09
        mov     dword [ebp-18H], -1024                  ; 1EC3 _ C7. 45, E8, FFFFFC00
        jmp     ?_121                                   ; 1ECA _ EB, 07

?_120:  mov     dword [ebp-18H], 1024                   ; 1ECC _ C7. 45, E8, 00000400
?_121:  mov     eax, dword [ebp+0CH]                    ; 1ED3 _ 8B. 45, 0C
        cmp     eax, dword [ebp+14H]                    ; 1ED6 _ 3B. 45, 14
        jg  near      ?_122                                   ; 1ed9 _ 7f, 15
        mov     eax, dword [ebp+14H]                    ; 1EDB _ 8B. 45, 14
        sub     eax, dword [ebp+0CH]                    ; 1EDE _ 2B. 45, 0C
        add     eax, 1                                  ; 1EE1 _ 83. C0, 01
        shl     eax, 10                                 ; 1EE4 _ C1. E0, 0A
        cdq                                             ; 1EE7 _ 99
        idiv    dword [ebp-10H]                         ; 1EE8 _ F7. 7D, F0
        mov     dword [ebp-14H], eax                    ; 1EEB _ 89. 45, EC
        jmp     ?_123                                   ; 1EEE _ EB, 13

?_122:  mov     eax, dword [ebp+14H]                    ; 1EF0 _ 8B. 45, 14
        sub     eax, dword [ebp+0CH]                    ; 1EF3 _ 2B. 45, 0C
        sub     eax, 1                                  ; 1EF6 _ 83. E8, 01
        shl     eax, 10                                 ; 1EF9 _ C1. E0, 0A
        cdq                                             ; 1EFC _ 99
        idiv    dword [ebp-10H]                         ; 1EFD _ F7. 7D, F0
        mov     dword [ebp-14H], eax                    ; 1F00 _ 89. 45, EC
?_123:  mov     dword [ebp-4H], 0                       ; 1F03 _ C7. 45, FC, 00000000
        jmp     ?_125                                   ; 1F0A _ EB, 35

?_124:  mov     eax, dword [ebp+8H]                     ; 1F0C _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 1F0F _ 8B. 10
        mov     eax, dword [ebp-0CH]                    ; 1F11 _ 8B. 45, F4
        sar     eax, 10                                 ; 1F14 _ C1. F8, 0A
        mov     ecx, eax                                ; 1F17 _ 89. C1
        mov     eax, dword [ebp+8H]                     ; 1F19 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 1F1C _ 8B. 40, 04
        imul    eax, ecx                                ; 1F1F _ 0F AF. C1
        mov     ecx, dword [ebp-8H]                     ; 1F22 _ 8B. 4D, F8
        sar     ecx, 10                                 ; 1F25 _ C1. F9, 0A
        add     eax, ecx                                ; 1F28 _ 01. C8
        add     eax, edx                                ; 1F2A _ 01. D0
        mov     edx, dword [ebp+1CH]                    ; 1F2C _ 8B. 55, 1C
        mov     byte [eax], dl                          ; 1F2F _ 88. 10
        mov     eax, dword [ebp-14H]                    ; 1F31 _ 8B. 45, EC
        add     dword [ebp-8H], eax                     ; 1F34 _ 01. 45, F8
        mov     eax, dword [ebp-18H]                    ; 1F37 _ 8B. 45, E8
        add     dword [ebp-0CH], eax                    ; 1F3A _ 01. 45, F4
        add     dword [ebp-4H], 1                       ; 1F3D _ 83. 45, FC, 01
?_125:  mov     eax, dword [ebp-4H]                     ; 1F41 _ 8B. 45, FC
        cmp     eax, dword [ebp-10H]                    ; 1F44 _ 3B. 45, F0
        jl      ?_124                                   ; 1F47 _ 7C, C3
        leave                                           ; 1F49 _ C9
        ret                                             ; 1F4A _ C3
; api_linewin End of function

handle_keyboard:; Function begin
        push    ebp                                     ; 1F4B _ 55
        mov     ebp, esp                                ; 1F4C _ 89. E5
        sub     esp, 24                                 ; 1F4E _ 83. EC, 18
?_126:  call    io_cli                                  ; 1F51 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 1F56 _ 8B. 45, 08
        add     eax, 16                                 ; 1F59 _ 83. C0, 10
        sub     esp, 12                                 ; 1F5C _ 83. EC, 0C
        push    eax                                     ; 1F5F _ 50
        call    fifo8_status                            ; 1F60 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1F65 _ 83. C4, 10
        test    eax, eax                                ; 1F68 _ 85. C0
        jnz near      ?_128                                   ; 1f6a _ 75, 2b
        call    io_sti                                  ; 1F6C _ E8, FFFFFFFC(rel)
        cmp     dword [ebp+0CH], 0                      ; 1F71 _ 83. 7D, 0C, 00
        jz near       ?_127                                   ; 1f75 _ 74, 05
        jmp     ?_132                                   ; 1F77 _ E9, 000000C8

?_127:  call    io_sti                                  ; 1F7C _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 1F81 _ 8B. 45, 10
        add     eax, 28                                 ; 1F84 _ 83. C0, 1C
        mov     dword [eax], -1                         ; 1F87 _ C7. 00, FFFFFFFF
        mov     eax, 0                                  ; 1F8D _ B8, 00000000
        jmp     ?_133                                   ; 1F92 _ E9, 000000B2

?_128:  mov     eax, dword [ebp+8H]                     ; 1F97 _ 8B. 45, 08
        add     eax, 16                                 ; 1F9A _ 83. C0, 10
        sub     esp, 12                                 ; 1F9D _ 83. EC, 0C
        push    eax                                     ; 1FA0 _ 50
        call    fifo8_get                               ; 1FA1 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1FA6 _ 83. C4, 10
        mov     dword [ebp-0CH], eax                    ; 1FA9 _ 89. 45, F4
        call    io_sti                                  ; 1FAC _ E8, FFFFFFFC(rel)
        cmp     dword [ebp-0CH], 255                    ; 1FB1 _ 81. 7D, F4, 000000FF
        jle near      ?_129                                   ; 1fb8 _ 7e, 26
        mov     edx, dword [sht_back]                   ; 1FBA _ 8B. 15, 00000288(d)
        mov     eax, dword [shtctl]                     ; 1FC0 _ A1, 00000284(d)
        sub     esp, 8                                  ; 1FC5 _ 83. EC, 08
        push    ?_439                                   ; 1FC8 _ 68, 0000005D(d)
        push    7                                       ; 1FCD _ 6A, 07
        push    176                                     ; 1FCF _ 68, 000000B0
        push    0                                       ; 1FD4 _ 6A, 00
        push    edx                                     ; 1FD6 _ 52
        push    eax                                     ; 1FD7 _ 50
        call    showString                              ; 1FD8 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1FDD _ 83. C4, 20
?_129:  cmp     dword [ebp-0CH], 1                      ; 1FE0 _ 83. 7D, F4, 01
        jg  near      ?_130                                   ; 1fe4 _ 7f, 37
        mov     eax, dword [ebp+8H]                     ; 1FE6 _ 8B. 45, 08
        lea     edx, [eax+10H]                          ; 1FE9 _ 8D. 50, 10
        mov     eax, dword [ebp+8H]                     ; 1FEC _ 8B. 45, 08
        mov     eax, dword [eax+0A8H]                   ; 1FEF _ 8B. 80, 000000A8
        sub     esp, 4                                  ; 1FF5 _ 83. EC, 04
        push    1                                       ; 1FF8 _ 6A, 01
        push    edx                                     ; 1FFA _ 52
        push    eax                                     ; 1FFB _ 50
        call    timer_init                              ; 1FFC _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 2001 _ 83. C4, 10
        mov     eax, dword [ebp+8H]                     ; 2004 _ 8B. 45, 08
        mov     eax, dword [eax+0A8H]                   ; 2007 _ 8B. 80, 000000A8
        sub     esp, 8                                  ; 200D _ 83. EC, 08
        push    50                                      ; 2010 _ 6A, 32
        push    eax                                     ; 2012 _ 50
        call    timer_settime                           ; 2013 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 2018 _ 83. C4, 10
        jmp     ?_132                                   ; 201B _ EB, 27

?_130:  cmp     dword [ebp-0CH], 2                      ; 201D _ 83. 7D, F4, 02
        jnz near      ?_131                                   ; 2021 _ 75, 0f
        mov     eax, dword [ebp+8H]                     ; 2023 _ 8B. 45, 08
        mov     dword [eax+0A0H], 7                     ; 2026 _ C7. 80, 000000A0, 00000007
        jmp     ?_132                                   ; 2030 _ EB, 12

?_131:  mov     eax, dword [ebp+10H]                    ; 2032 _ 8B. 45, 10
        lea     edx, [eax+1CH]                          ; 2035 _ 8D. 50, 1C
        mov     eax, dword [ebp-0CH]                    ; 2038 _ 8B. 45, F4
        mov     dword [edx], eax                        ; 203B _ 89. 02
        mov     eax, 0                                  ; 203D _ B8, 00000000
        jmp     ?_133                                   ; 2042 _ EB, 05

?_132:  jmp     ?_126                                   ; 2044 _ E9, FFFFFF08

?_133:  leave                                           ; 2049 _ C9
        ret                                             ; 204A _ C3
; handle_keyboard End of function

close_constask:; Function begin
        push    ebp                                     ; 204B _ 55
        mov     ebp, esp                                ; 204C _ 89. E5
        sub     esp, 8                                  ; 204E _ 83. EC, 08
        sub     esp, 12                                 ; 2051 _ 83. EC, 0C
        push    dword [ebp+8H]                          ; 2054 _ FF. 75, 08
        call    task_sleep                              ; 2057 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 205C _ 83. C4, 10
        mov     eax, dword [ebp+8H]                     ; 205F _ 8B. 45, 08
        mov     eax, dword [eax+0B8H]                   ; 2062 _ 8B. 80, 000000B8
        mov     edx, eax                                ; 2068 _ 89. C2
        mov     eax, dword [memman]                     ; 206A _ A1, 00000000(d)
        sub     esp, 4                                  ; 206F _ 83. EC, 04
        push    65536                                   ; 2072 _ 68, 00010000
        push    edx                                     ; 2077 _ 52
        push    eax                                     ; 2078 _ 50
        call    memman_free_4k                          ; 2079 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 207E _ 83. C4, 10
        mov     eax, dword [ebp+8H]                     ; 2081 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 2084 _ 8B. 40, 10
        mov     edx, eax                                ; 2087 _ 89. C2
        mov     eax, dword [memman]                     ; 2089 _ A1, 00000000(d)
        sub     esp, 4                                  ; 208E _ 83. EC, 04
        push    128                                     ; 2091 _ 68, 00000080
        push    edx                                     ; 2096 _ 52
        push    eax                                     ; 2097 _ 50
        call    memman_free                             ; 2098 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 209D _ 83. C4, 10
        mov     eax, dword [ebp+8H]                     ; 20A0 _ 8B. 45, 08
        mov     eax, dword [eax+0ACH]                   ; 20A3 _ 8B. 80, 000000AC
        mov     edx, eax                                ; 20A9 _ 89. C2
        mov     eax, dword [memman]                     ; 20AB _ A1, 00000000(d)
        sub     esp, 4                                  ; 20B0 _ 83. EC, 04
        push    30                                      ; 20B3 _ 6A, 1E
        push    edx                                     ; 20B5 _ 52
        push    eax                                     ; 20B6 _ 50
        call    memman_free                             ; 20B7 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 20BC _ 83. C4, 10
        mov     eax, dword [ebp+8H]                     ; 20BF _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 20C2 _ C7. 40, 04, 00000000
        mov     dword [current_console_task], 0         ; 20C9 _ C7. 05, 00000298(d), 00000000
        leave                                           ; 20D3 _ C9
        ret                                             ; 20D4 _ C3
; close_constask End of function

close_console:; Function begin
        push    ebp                                     ; 20D5 _ 55
        mov     ebp, esp                                ; 20D6 _ 89. E5
        sub     esp, 24                                 ; 20D8 _ 83. EC, 18
        mov     eax, dword [ebp+8H]                     ; 20DB _ 8B. 45, 08
        mov     eax, dword [eax+0A8H]                   ; 20DE _ 8B. 80, 000000A8
        sub     esp, 12                                 ; 20E4 _ 83. EC, 0C
        push    eax                                     ; 20E7 _ 50
        call    timer_free                              ; 20E8 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 20ED _ 83. C4, 10
        mov     eax, dword [ebp+8H]                     ; 20F0 _ 8B. 45, 08
        mov     eax, dword [eax+0B4H]                   ; 20F3 _ 8B. 80, 000000B4
        test    eax, eax                                ; 20F9 _ 85. C0
        jz near       ?_134                                   ; 20fb _ 74, 3e
        mov     eax, dword [ebp+8H]                     ; 20FD _ 8B. 45, 08
        mov     eax, dword [eax+0B4H]                   ; 2100 _ 8B. 80, 000000B4
        mov     dword [ebp-0CH], eax                    ; 2106 _ 89. 45, F4
        mov     eax, dword [ebp-0CH]                    ; 2109 _ 8B. 45, F4
        mov     eax, dword [eax]                        ; 210C _ 8B. 00
        mov     edx, eax                                ; 210E _ 89. C2
        mov     eax, dword [memman]                     ; 2110 _ A1, 00000000(d)
        sub     esp, 4                                  ; 2115 _ 83. EC, 04
        push    42240                                   ; 2118 _ 68, 0000A500
        push    edx                                     ; 211D _ 52
        push    eax                                     ; 211E _ 50
        call    memman_free_4k                          ; 211F _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 2124 _ 83. C4, 10
        mov     eax, dword [shtctl]                     ; 2127 _ A1, 00000284(d)
        sub     esp, 8                                  ; 212C _ 83. EC, 08
        push    dword [ebp-0CH]                         ; 212F _ FF. 75, F4
        push    eax                                     ; 2132 _ 50
        call    sheet_free                              ; 2133 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 2138 _ 83. C4, 10
?_134:  sub     esp, 12                                 ; 213B _ 83. EC, 0C
        push    dword [ebp+8H]                          ; 213E _ FF. 75, 08
        call    close_constask                          ; 2141 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 2146 _ 83. C4, 10
        leave                                           ; 2149 _ C9
        ret                                             ; 214A _ C3
; close_console End of function

cmd_exit:; Function begin
        push    ebp                                     ; 214B _ 55
        mov     ebp, esp                                ; 214C _ 89. E5
        sub     esp, 8                                  ; 214E _ 83. EC, 08
        call    io_cli                                  ; 2151 _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 2156 _ 83. EC, 08
        push    255                                     ; 2159 _ 68, 000000FF
        push    keyinfo                                 ; 215E _ 68, 0000001C(d)
        call    fifo8_put                               ; 2163 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 2168 _ 83. C4, 10
        call    io_sti                                  ; 216B _ E8, FFFFFFFC(rel)
        leave                                           ; 2170 _ C9
        ret                                             ; 2171 _ C3
; cmd_exit End of function

kernel_api:; Function begin
        push    ebp                                     ; 2172 _ 55
        mov     ebp, esp                                ; 2173 _ 89. E5
        push    ebx                                     ; 2175 _ 53
        sub     esp, 52                                 ; 2176 _ 83. EC, 34
        call    task_now                                ; 2179 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 217E _ 89. 45, F0
        mov     dword [ebp-14H], 0                      ; 2181 _ C7. 45, EC, 00000000
        lea     eax, [ebp+24H]                          ; 2188 _ 8D. 45, 24
        add     eax, 4                                  ; 218B _ 83. C0, 04
        mov     dword [ebp-18H], eax                    ; 218E _ 89. 45, E8
        mov     dword [ebp-0CH], 0                      ; 2191 _ C7. 45, F4, 00000000
        mov     dword [ebp-1CH], 0                      ; 2198 _ C7. 45, E4, 00000000
        cmp     dword [ebp+1CH], 1                      ; 219F _ 83. 7D, 1C, 01
        jnz near      ?_135                                   ; 21a3 _ 75, 19
        mov     eax, dword [ebp+24H]                    ; 21A5 _ 8B. 45, 24
        movsx   eax, al                                 ; 21A8 _ 0F BE. C0
        sub     esp, 8                                  ; 21AB _ 83. EC, 08
        push    1                                       ; 21AE _ 6A, 01
        push    eax                                     ; 21B0 _ 50
        call    cons_putchar                            ; 21B1 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 21B6 _ 83. C4, 10
        jmp     ?_169                                   ; 21B9 _ E9, 00000600

?_135:  cmp     dword [ebp+1CH], 2                      ; 21BE _ 83. 7D, 1C, 02
        jnz near      ?_136                                   ; 21c2 _ 75, 21
        mov     eax, dword [ebp-10H]                    ; 21C4 _ 8B. 45, F0
        mov     eax, dword [eax+0B0H]                   ; 21C7 _ 8B. 80, 000000B0
        mov     edx, dword [eax]                        ; 21CD _ 8B. 10
        mov     eax, dword [ebp+18H]                    ; 21CF _ 8B. 45, 18
        add     eax, edx                                ; 21D2 _ 01. D0
        sub     esp, 12                                 ; 21D4 _ 83. EC, 0C
        push    eax                                     ; 21D7 _ 50
        call    cons_putstr                             ; 21D8 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 21DD _ 83. C4, 10
        jmp     ?_169                                   ; 21E0 _ E9, 000005D9

?_136:  cmp     dword [ebp+1CH], 4                      ; 21E5 _ 83. 7D, 1C, 04
        jnz near      ?_137                                   ; 21e9 _ 75, 15
        mov     eax, dword [ebp-10H]                    ; 21EB _ 8B. 45, F0
        mov     dword [eax+34H], 0                      ; 21EE _ C7. 40, 34, 00000000
        mov     eax, dword [ebp-10H]                    ; 21F5 _ 8B. 45, F0
        add     eax, 48                                 ; 21F8 _ 83. C0, 30
        jmp     ?_170                                   ; 21FB _ E9, 000005C3

?_137:  cmp     dword [ebp+1CH], 5                      ; 2200 _ 83. 7D, 1C, 05
        jne near      ?_138                                   ; 2204 _ 0f 85, 00000106
        mov     eax, dword [shtctl]                     ; 220A _ A1, 00000284(d)
        sub     esp, 12                                 ; 220F _ 83. EC, 0C
        push    eax                                     ; 2212 _ 50
        call    sheet_alloc                             ; 2213 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 2218 _ 83. C4, 10
        mov     dword [ebp-14H], eax                    ; 221B _ 89. 45, EC
        mov     eax, dword [ebp-14H]                    ; 221E _ 8B. 45, EC
        mov     edx, dword [ebp-10H]                    ; 2221 _ 8B. 55, F0
        mov     dword [eax+20H], edx                    ; 2224 _ 89. 50, 20
        mov     eax, dword [ebp-14H]                    ; 2227 _ 8B. 45, EC
        mov     eax, dword [eax+1CH]                    ; 222A _ 8B. 40, 1C
        or      eax, 10H                                ; 222D _ 83. C8, 10
        mov     edx, eax                                ; 2230 _ 89. C2
        mov     eax, dword [ebp-14H]                    ; 2232 _ 8B. 45, EC
        mov     dword [eax+1CH], edx                    ; 2235 _ 89. 50, 1C
        mov     eax, dword [ebp+0CH]                    ; 2238 _ 8B. 45, 0C
        imul    eax, dword [ebp+8H]                     ; 223B _ 0F AF. 45, 08
        mov     edx, eax                                ; 223F _ 89. C2
        mov     eax, dword [memman]                     ; 2241 _ A1, 00000000(d)
        sub     esp, 8                                  ; 2246 _ 83. EC, 08
        push    edx                                     ; 2249 _ 52
        push    eax                                     ; 224A _ 50
        call    memman_alloc                            ; 224B _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 2250 _ 83. C4, 10
        mov     dword [ebp-20H], eax                    ; 2253 _ 89. 45, E0
        mov     eax, dword [ebp+24H]                    ; 2256 _ 8B. 45, 24
        mov     edx, dword [ebp-10H]                    ; 2259 _ 8B. 55, F0
        mov     edx, dword [edx+0B0H]                   ; 225C _ 8B. 92, 000000B0
        mov     ecx, dword [edx+4H]                     ; 2262 _ 8B. 4A, 04
        mov     edx, dword [ebp+18H]                    ; 2265 _ 8B. 55, 18
        add     edx, ecx                                ; 2268 _ 01. CA
        sub     esp, 12                                 ; 226A _ 83. EC, 0C
        push    eax                                     ; 226D _ 50
        push    dword [ebp+8H]                          ; 226E _ FF. 75, 08
        push    dword [ebp+0CH]                         ; 2271 _ FF. 75, 0C
        push    edx                                     ; 2274 _ 52
        push    dword [ebp-14H]                         ; 2275 _ FF. 75, EC
        call    sheet_setbuf                            ; 2278 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 227D _ 83. C4, 20
        mov     eax, dword [ebp-10H]                    ; 2280 _ 8B. 45, F0
        mov     eax, dword [eax+0B0H]                   ; 2283 _ 8B. 80, 000000B0
        mov     edx, dword [eax]                        ; 2289 _ 8B. 10
        mov     eax, dword [ebp+20H]                    ; 228B _ 8B. 45, 20
        add     edx, eax                                ; 228E _ 01. C2
        mov     eax, dword [shtctl]                     ; 2290 _ A1, 00000284(d)
        push    0                                       ; 2295 _ 6A, 00
        push    edx                                     ; 2297 _ 52
        push    dword [ebp-14H]                         ; 2298 _ FF. 75, EC
        push    eax                                     ; 229B _ 50
        call    make_window8                            ; 229C _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 22A1 _ 83. C4, 10
        mov     eax, dword [shtctl]                     ; 22A4 _ A1, 00000284(d)
        mov     eax, dword [eax+0CH]                    ; 22A9 _ 8B. 40, 0C
        sub     eax, dword [ebp+8H]                     ; 22AC _ 2B. 45, 08
        mov     edx, eax                                ; 22AF _ 89. C2
        shr     edx, 31                                 ; 22B1 _ C1. EA, 1F
        add     eax, edx                                ; 22B4 _ 01. D0
        sar     eax, 1                                  ; 22B6 _ D1. F8
        mov     ecx, eax                                ; 22B8 _ 89. C1
        mov     eax, dword [shtctl]                     ; 22BA _ A1, 00000284(d)
        mov     eax, dword [eax+8H]                     ; 22BF _ 8B. 40, 08
        sub     eax, dword [ebp+0CH]                    ; 22C2 _ 2B. 45, 0C
        mov     edx, eax                                ; 22C5 _ 89. C2
        shr     edx, 31                                 ; 22C7 _ C1. EA, 1F
        add     eax, edx                                ; 22CA _ 01. D0
        sar     eax, 1                                  ; 22CC _ D1. F8
        mov     edx, eax                                ; 22CE _ 89. C2
        mov     eax, dword [shtctl]                     ; 22D0 _ A1, 00000284(d)
        push    ecx                                     ; 22D5 _ 51
        push    edx                                     ; 22D6 _ 52
        push    dword [ebp-14H]                         ; 22D7 _ FF. 75, EC
        push    eax                                     ; 22DA _ 50
        call    sheet_slide                             ; 22DB _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 22E0 _ 83. C4, 10
        mov     eax, dword [shtctl]                     ; 22E3 _ A1, 00000284(d)
        mov     edx, dword [eax+10H]                    ; 22E8 _ 8B. 50, 10
        mov     eax, dword [shtctl]                     ; 22EB _ A1, 00000284(d)
        sub     esp, 4                                  ; 22F0 _ 83. EC, 04
        push    edx                                     ; 22F3 _ 52
        push    dword [ebp-14H]                         ; 22F4 _ FF. 75, EC
        push    eax                                     ; 22F7 _ 50
        call    sheet_updown                            ; 22F8 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 22FD _ 83. C4, 10
        mov     eax, dword [ebp-18H]                    ; 2300 _ 8B. 45, E8
        lea     edx, [eax+1CH]                          ; 2303 _ 8D. 50, 1C
        mov     eax, dword [ebp-14H]                    ; 2306 _ 8B. 45, EC
        mov     dword [edx], eax                        ; 2309 _ 89. 02
        jmp     ?_169                                   ; 230B _ E9, 000004AE

?_138:  cmp     dword [ebp+1CH], 6                      ; 2310 _ 83. 7D, 1C, 06
        jnz near      ?_139                                   ; 2314 _ 75, 70
        mov     eax, dword [ebp+18H]                    ; 2316 _ 8B. 45, 18
        mov     dword [ebp-14H], eax                    ; 2319 _ 89. 45, EC
        mov     eax, dword [ebp-10H]                    ; 231C _ 8B. 45, F0
        mov     eax, dword [eax+0B0H]                   ; 231F _ 8B. 80, 000000B0
        mov     edx, dword [eax+4H]                     ; 2325 _ 8B. 50, 04
        mov     eax, dword [ebp+10H]                    ; 2328 _ 8B. 45, 10
        lea     ecx, [edx+eax]                          ; 232B _ 8D. 0C 02
        mov     eax, dword [ebp+24H]                    ; 232E _ 8B. 45, 24
        movsx   edx, al                                 ; 2331 _ 0F BE. D0
        mov     eax, dword [shtctl]                     ; 2334 _ A1, 00000284(d)
        sub     esp, 8                                  ; 2339 _ 83. EC, 08
        push    ecx                                     ; 233C _ 51
        push    edx                                     ; 233D _ 52
        push    dword [ebp+8H]                          ; 233E _ FF. 75, 08
        push    dword [ebp+0CH]                         ; 2341 _ FF. 75, 0C
        push    dword [ebp-14H]                         ; 2344 _ FF. 75, EC
        push    eax                                     ; 2347 _ 50
        call    showString                              ; 2348 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 234D _ 83. C4, 20
        mov     eax, dword [ebp+8H]                     ; 2350 _ 8B. 45, 08
        lea     ecx, [eax+10H]                          ; 2353 _ 8D. 48, 10
        mov     eax, dword [ebp+20H]                    ; 2356 _ 8B. 45, 20
        lea     edx, [eax*8]                            ; 2359 _ 8D. 14 C5, 00000000
        mov     eax, dword [ebp+0CH]                    ; 2360 _ 8B. 45, 0C
        add     edx, eax                                ; 2363 _ 01. C2
        mov     eax, dword [shtctl]                     ; 2365 _ A1, 00000284(d)
        sub     esp, 8                                  ; 236A _ 83. EC, 08
        push    ecx                                     ; 236D _ 51
        push    edx                                     ; 236E _ 52
        push    dword [ebp+8H]                          ; 236F _ FF. 75, 08
        push    dword [ebp+0CH]                         ; 2372 _ FF. 75, 0C
        push    dword [ebp-14H]                         ; 2375 _ FF. 75, EC
        push    eax                                     ; 2378 _ 50
        call    sheet_refresh                           ; 2379 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 237E _ 83. C4, 20
        jmp     ?_169                                   ; 2381 _ E9, 00000438

?_139:  cmp     dword [ebp+1CH], 7                      ; 2386 _ 83. 7D, 1C, 07
        jnz near      ?_140                                   ; 238a _ 75, 60
        mov     eax, dword [ebp+18H]                    ; 238C _ 8B. 45, 18
        mov     dword [ebp-14H], eax                    ; 238F _ 89. 45, EC
        mov     ebx, dword [ebp+24H]                    ; 2392 _ 8B. 5D, 24
        mov     eax, dword [ebp+10H]                    ; 2395 _ 8B. 45, 10
        movzx   ecx, al                                 ; 2398 _ 0F B6. C8
        mov     eax, dword [ebp-14H]                    ; 239B _ 8B. 45, EC
        mov     edx, dword [eax+4H]                     ; 239E _ 8B. 50, 04
        mov     eax, dword [ebp-14H]                    ; 23A1 _ 8B. 45, EC
        mov     eax, dword [eax]                        ; 23A4 _ 8B. 00
        sub     esp, 4                                  ; 23A6 _ 83. EC, 04
        push    dword [ebp+8H]                          ; 23A9 _ FF. 75, 08
        push    dword [ebp+0CH]                         ; 23AC _ FF. 75, 0C
        push    dword [ebp+20H]                         ; 23AF _ FF. 75, 20
        push    ebx                                     ; 23B2 _ 53
        push    ecx                                     ; 23B3 _ 51
        push    edx                                     ; 23B4 _ 52
        push    eax                                     ; 23B5 _ 50
        call    boxfill8                                ; 23B6 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 23BB _ 83. C4, 20
        mov     eax, dword [ebp+8H]                     ; 23BE _ 8B. 45, 08
        lea     ebx, [eax+1H]                           ; 23C1 _ 8D. 58, 01
        mov     eax, dword [ebp+0CH]                    ; 23C4 _ 8B. 45, 0C
        lea     ecx, [eax+1H]                           ; 23C7 _ 8D. 48, 01
        mov     edx, dword [ebp+24H]                    ; 23CA _ 8B. 55, 24
        mov     eax, dword [shtctl]                     ; 23CD _ A1, 00000284(d)
        sub     esp, 8                                  ; 23D2 _ 83. EC, 08
        push    ebx                                     ; 23D5 _ 53
        push    ecx                                     ; 23D6 _ 51
        push    dword [ebp+20H]                         ; 23D7 _ FF. 75, 20
        push    edx                                     ; 23DA _ 52
        push    dword [ebp-14H]                         ; 23DB _ FF. 75, EC
        push    eax                                     ; 23DE _ 50
        call    sheet_refresh                           ; 23DF _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 23E4 _ 83. C4, 20
        jmp     ?_169                                   ; 23E7 _ E9, 000003D2

?_140:  cmp     dword [ebp+1CH], 11                     ; 23EC _ 83. 7D, 1C, 0B
        jnz near      ?_141                                   ; 23f0 _ 75, 28
        mov     eax, dword [ebp+18H]                    ; 23F2 _ 8B. 45, 18
        mov     dword [ebp-14H], eax                    ; 23F5 _ 89. 45, EC
        mov     eax, dword [ebp-14H]                    ; 23F8 _ 8B. 45, EC
        mov     edx, dword [eax]                        ; 23FB _ 8B. 10
        mov     eax, dword [ebp-14H]                    ; 23FD _ 8B. 45, EC
        mov     eax, dword [eax+4H]                     ; 2400 _ 8B. 40, 04
        imul    eax, dword [ebp+8H]                     ; 2403 _ 0F AF. 45, 08
        mov     ecx, eax                                ; 2407 _ 89. C1
        mov     eax, dword [ebp+0CH]                    ; 2409 _ 8B. 45, 0C
        add     eax, ecx                                ; 240C _ 01. C8
        add     eax, edx                                ; 240E _ 01. D0
        mov     edx, dword [ebp+24H]                    ; 2410 _ 8B. 55, 24
        mov     byte [eax], dl                          ; 2413 _ 88. 10
        jmp     ?_169                                   ; 2415 _ E9, 000003A4

?_141:  cmp     dword [ebp+1CH], 12                     ; 241A _ 83. 7D, 1C, 0C
        jnz near      ?_142                                   ; 241e _ 75, 2c
        mov     eax, dword [ebp+18H]                    ; 2420 _ 8B. 45, 18
        mov     dword [ebp-14H], eax                    ; 2423 _ 89. 45, EC
        mov     edx, dword [ebp+24H]                    ; 2426 _ 8B. 55, 24
        mov     eax, dword [shtctl]                     ; 2429 _ A1, 00000284(d)
        sub     esp, 8                                  ; 242E _ 83. EC, 08
        push    dword [ebp+8H]                          ; 2431 _ FF. 75, 08
        push    dword [ebp+0CH]                         ; 2434 _ FF. 75, 0C
        push    dword [ebp+20H]                         ; 2437 _ FF. 75, 20
        push    edx                                     ; 243A _ 52
        push    dword [ebp-14H]                         ; 243B _ FF. 75, EC
        push    eax                                     ; 243E _ 50
        call    sheet_refresh                           ; 243F _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 2444 _ 83. C4, 20
        jmp     ?_169                                   ; 2447 _ E9, 00000372

?_142:  cmp     dword [ebp+1CH], 13                     ; 244C _ 83. 7D, 1C, 0D
        jnz near      ?_143                                   ; 2450 _ 75, 29
        mov     eax, dword [ebp+18H]                    ; 2452 _ 8B. 45, 18
        mov     dword [ebp-14H], eax                    ; 2455 _ 89. 45, EC
        mov     eax, dword [ebp+24H]                    ; 2458 _ 8B. 45, 24
        sub     esp, 8                                  ; 245B _ 83. EC, 08
        push    dword [ebp+10H]                         ; 245E _ FF. 75, 10
        push    dword [ebp+8H]                          ; 2461 _ FF. 75, 08
        push    dword [ebp+0CH]                         ; 2464 _ FF. 75, 0C
        push    dword [ebp+20H]                         ; 2467 _ FF. 75, 20
        push    eax                                     ; 246A _ 50
        push    dword [ebp-14H]                         ; 246B _ FF. 75, EC
        call    api_linewin                             ; 246E _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 2473 _ 83. C4, 20
        jmp     ?_169                                   ; 2476 _ E9, 00000343

?_143:  cmp     dword [ebp+1CH], 14                     ; 247B _ 83. 7D, 1C, 0E
        jnz near      ?_144                                   ; 247f _ 75, 37
        mov     edx, dword [ebp+18H]                    ; 2481 _ 8B. 55, 18
        mov     eax, dword [shtctl]                     ; 2484 _ A1, 00000284(d)
        sub     esp, 8                                  ; 2489 _ 83. EC, 08
        push    edx                                     ; 248C _ 52
        push    eax                                     ; 248D _ 50
        call    sheet_free                              ; 248E _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 2493 _ 83. C4, 10
        mov     eax, dword [ebp-10H]                    ; 2496 _ 8B. 45, F0
        mov     eax, dword [eax+0B0H]                   ; 2499 _ 8B. 80, 000000B0
        mov     eax, dword [eax+4H]                     ; 249F _ 8B. 40, 04
        add     eax, 291                                ; 24A2 _ 05, 00000123
        sub     esp, 12                                 ; 24A7 _ 83. EC, 0C
        push    eax                                     ; 24AA _ 50
        call    cons_putstr                             ; 24AB _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 24B0 _ 83. C4, 10
        jmp     ?_169                                   ; 24B3 _ E9, 00000306

?_144:  cmp     dword [ebp+1CH], 15                     ; 24B8 _ 83. 7D, 1C, 0F
        jnz near      ?_145                                   ; 24bc _ 75, 1a
        mov     eax, dword [ebp+24H]                    ; 24BE _ 8B. 45, 24
        sub     esp, 4                                  ; 24C1 _ 83. EC, 04
        push    dword [ebp-18H]                         ; 24C4 _ FF. 75, E8
        push    eax                                     ; 24C7 _ 50
        push    dword [ebp-10H]                         ; 24C8 _ FF. 75, F0
        call    handle_keyboard                         ; 24CB _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 24D0 _ 83. C4, 10
        jmp     ?_169                                   ; 24D3 _ E9, 000002E6

?_145:  cmp     dword [ebp+1CH], 16                     ; 24D8 _ 83. 7D, 1C, 10
        jnz near      ?_146                                   ; 24dc _ 75, 12
        mov     eax, dword [ebp-18H]                    ; 24DE _ 8B. 45, E8
        lea     ebx, [eax+1CH]                          ; 24E1 _ 8D. 58, 1C
        call    timer_alloc                             ; 24E4 _ E8, FFFFFFFC(rel)
        mov     dword [ebx], eax                        ; 24E9 _ 89. 03
        jmp     ?_169                                   ; 24EB _ E9, 000002CE

?_146:  cmp     dword [ebp+1CH], 17                     ; 24F0 _ 83. 7D, 1C, 11
        jnz near      ?_147                                   ; 24f4 _ 75, 22
        mov     eax, dword [ebp+24H]                    ; 24F6 _ 8B. 45, 24
        movzx   edx, al                                 ; 24F9 _ 0F B6. D0
        mov     eax, dword [ebp-10H]                    ; 24FC _ 8B. 45, F0
        lea     ecx, [eax+10H]                          ; 24FF _ 8D. 48, 10
        mov     eax, dword [ebp+18H]                    ; 2502 _ 8B. 45, 18
        sub     esp, 4                                  ; 2505 _ 83. EC, 04
        push    edx                                     ; 2508 _ 52
        push    ecx                                     ; 2509 _ 51
        push    eax                                     ; 250A _ 50
        call    timer_init                              ; 250B _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 2510 _ 83. C4, 10
        jmp     ?_169                                   ; 2513 _ E9, 000002A6

?_147:  cmp     dword [ebp+1CH], 18                     ; 2518 _ 83. 7D, 1C, 12
        jnz near      ?_148                                   ; 251c _ 75, 1a
        mov     eax, dword [ebp+24H]                    ; 251E _ 8B. 45, 24
        mov     edx, eax                                ; 2521 _ 89. C2
        mov     eax, dword [ebp+18H]                    ; 2523 _ 8B. 45, 18
        sub     esp, 8                                  ; 2526 _ 83. EC, 08
        push    edx                                     ; 2529 _ 52
        push    eax                                     ; 252A _ 50
        call    timer_settime                           ; 252B _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 2530 _ 83. C4, 10
        jmp     ?_169                                   ; 2533 _ E9, 00000286

?_148:  cmp     dword [ebp+1CH], 19                     ; 2538 _ 83. 7D, 1C, 13
        jnz near      ?_149                                   ; 253c _ 75, 14
        mov     eax, dword [ebp+18H]                    ; 253E _ 8B. 45, 18
        sub     esp, 12                                 ; 2541 _ 83. EC, 0C
        push    eax                                     ; 2544 _ 50
        call    timer_free                              ; 2545 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 254A _ 83. C4, 10
        jmp     ?_169                                   ; 254D _ E9, 0000026C

?_149:  cmp     dword [ebp+1CH], 21                     ; 2552 _ 83. 7D, 1C, 15
        jne near      ?_155                                   ; 2556 _ 0f 85, 000000c5
        mov     dword [ebp-0CH], 0                      ; 255C _ C7. 45, F4, 00000000
        jmp     ?_152                                   ; 2563 _ EB, 23

?_150:  mov     eax, dword [ebp-10H]                    ; 2565 _ 8B. 45, F0
        mov     ecx, dword [eax+0CCH]                   ; 2568 _ 8B. 88, 000000CC
        mov     edx, dword [ebp-0CH]                    ; 256E _ 8B. 55, F4
        mov     eax, edx                                ; 2571 _ 89. D0
        add     eax, eax                                ; 2573 _ 01. C0
        add     eax, edx                                ; 2575 _ 01. D0
        shl     eax, 2                                  ; 2577 _ C1. E0, 02
        add     eax, ecx                                ; 257A _ 01. C8
        mov     eax, dword [eax]                        ; 257C _ 8B. 00
        test    eax, eax                                ; 257E _ 85. C0
        jnz near      ?_151                                   ; 2580 _ 75, 02
        jmp     ?_153                                   ; 2582 _ EB, 0A

?_151:  add     dword [ebp-0CH], 1                      ; 2584 _ 83. 45, F4, 01
?_152:  cmp     dword [ebp-0CH], 7                      ; 2588 _ 83. 7D, F4, 07
        jle near      ?_150                                   ; 258c _ 7e, d7
?_153:  mov     eax, dword [ebp-10H]                    ; 258E _ 8B. 45, F0
        mov     ecx, dword [eax+0CCH]                   ; 2591 _ 8B. 88, 000000CC
        mov     edx, dword [ebp-0CH]                    ; 2597 _ 8B. 55, F4
        mov     eax, edx                                ; 259A _ 89. D0
        add     eax, eax                                ; 259C _ 01. C0
        add     eax, edx                                ; 259E _ 01. D0
        shl     eax, 2                                  ; 25A0 _ C1. E0, 02
        add     eax, ecx                                ; 25A3 _ 01. C8
        mov     dword [ebp-1CH], eax                    ; 25A5 _ 89. 45, E4
        mov     eax, dword [ebp-18H]                    ; 25A8 _ 8B. 45, E8
        add     eax, 28                                 ; 25AB _ 83. C0, 1C
        mov     dword [eax], 0                          ; 25AE _ C7. 00, 00000000
        cmp     dword [ebp-0CH], 7                      ; 25B4 _ 83. 7D, F4, 07
        jg  near      ?_169                                   ; 25b8 _ 0f 8f, 00000200
        mov     dword [ebp-30H], 0                      ; 25BE _ C7. 45, D0, 00000000
        mov     eax, dword [ebp-10H]                    ; 25C5 _ 8B. 45, F0
        mov     eax, dword [eax+0B0H]                   ; 25C8 _ 8B. 80, 000000B0
        mov     edx, dword [eax]                        ; 25CE _ 8B. 10
        mov     eax, dword [ebp+18H]                    ; 25D0 _ 8B. 45, 18
        add     eax, edx                                ; 25D3 _ 01. D0
        mov     dword [ebp-24H], eax                    ; 25D5 _ 89. 45, DC
        sub     esp, 8                                  ; 25D8 _ 83. EC, 08
        lea     eax, [ebp-30H]                          ; 25DB _ 8D. 45, D0
        push    eax                                     ; 25DE _ 50
        push    dword [ebp-24H]                         ; 25DF _ FF. 75, DC
        call    file_loadfile                           ; 25E2 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 25E7 _ 83. C4, 10
        mov     eax, dword [ebp-30H]                    ; 25EA _ 8B. 45, D0
        test    eax, eax                                ; 25ED _ 85. C0
        jz near       ?_154                                   ; 25ef _ 74, 2b
        mov     eax, dword [ebp-18H]                    ; 25F1 _ 8B. 45, E8
        lea     edx, [eax+1CH]                          ; 25F4 _ 8D. 50, 1C
        mov     eax, dword [ebp-1CH]                    ; 25F7 _ 8B. 45, E4
        mov     dword [edx], eax                        ; 25FA _ 89. 02
        mov     edx, dword [ebp-30H]                    ; 25FC _ 8B. 55, D0
        mov     eax, dword [ebp-1CH]                    ; 25FF _ 8B. 45, E4
        mov     dword [eax], edx                        ; 2602 _ 89. 10
        mov     edx, dword [ebp-28H]                    ; 2604 _ 8B. 55, D8
        mov     eax, dword [ebp-1CH]                    ; 2607 _ 8B. 45, E4
        mov     dword [eax+4H], edx                     ; 260A _ 89. 50, 04
        mov     eax, dword [ebp-1CH]                    ; 260D _ 8B. 45, E4
        mov     dword [eax+8H], 0                       ; 2610 _ C7. 40, 08, 00000000
        jmp     ?_169                                   ; 2617 _ E9, 000001A2

?_154:  jmp     ?_169                                   ; 261C _ E9, 0000019D

?_155:  cmp     dword [ebp+1CH], 22                     ; 2621 _ 83. 7D, 1C, 16
        jnz near      ?_156                                   ; 2625 _ 75, 36
        mov     eax, dword [ebp+24H]                    ; 2627 _ 8B. 45, 24
        mov     dword [ebp-1CH], eax                    ; 262A _ 89. 45, E4
        mov     eax, dword [ebp-1CH]                    ; 262D _ 8B. 45, E4
        mov     eax, dword [eax+4H]                     ; 2630 _ 8B. 40, 04
        mov     ecx, eax                                ; 2633 _ 89. C1
        mov     eax, dword [ebp-1CH]                    ; 2635 _ 8B. 45, E4
        mov     eax, dword [eax]                        ; 2638 _ 8B. 00
        mov     edx, eax                                ; 263A _ 89. C2
        mov     eax, dword [memman]                     ; 263C _ A1, 00000000(d)
        sub     esp, 4                                  ; 2641 _ 83. EC, 04
        push    ecx                                     ; 2644 _ 51
        push    edx                                     ; 2645 _ 52
        push    eax                                     ; 2646 _ 50
        call    memman_free_4k                          ; 2647 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 264C _ 83. C4, 10
        mov     eax, dword [ebp-1CH]                    ; 264F _ 8B. 45, E4
        mov     dword [eax], 0                          ; 2652 _ C7. 00, 00000000
        jmp     ?_169                                   ; 2658 _ E9, 00000161

?_156:  cmp     dword [ebp+1CH], 23                     ; 265D _ 83. 7D, 1C, 17
        jne near      ?_161                                   ; 2661 _ 0f 85, 00000080
        mov     eax, dword [ebp+24H]                    ; 2667 _ 8B. 45, 24
        mov     dword [ebp-1CH], eax                    ; 266A _ 89. 45, E4
        cmp     dword [ebp+20H], 0                      ; 266D _ 83. 7D, 20, 00
        jnz near      ?_157                                   ; 2671 _ 75, 0b
        mov     eax, dword [ebp-1CH]                    ; 2673 _ 8B. 45, E4
        mov     edx, dword [ebp+18H]                    ; 2676 _ 8B. 55, 18
        mov     dword [eax+8H], edx                     ; 2679 _ 89. 50, 08
        jmp     ?_159                                   ; 267C _ EB, 30

?_157:  cmp     dword [ebp+20H], 1                      ; 267E _ 83. 7D, 20, 01
        jnz near      ?_158                                   ; 2682 _ 75, 13
        mov     eax, dword [ebp-1CH]                    ; 2684 _ 8B. 45, E4
        mov     edx, dword [eax+8H]                     ; 2687 _ 8B. 50, 08
        mov     eax, dword [ebp+18H]                    ; 268A _ 8B. 45, 18
        add     edx, eax                                ; 268D _ 01. C2
        mov     eax, dword [ebp-1CH]                    ; 268F _ 8B. 45, E4
        mov     dword [eax+8H], edx                     ; 2692 _ 89. 50, 08
        jmp     ?_159                                   ; 2695 _ EB, 17

?_158:  cmp     dword [ebp+20H], 2                      ; 2697 _ 83. 7D, 20, 02
        jnz near      ?_159                                   ; 269b _ 75, 11
        mov     eax, dword [ebp-1CH]                    ; 269D _ 8B. 45, E4
        mov     edx, dword [eax+4H]                     ; 26A0 _ 8B. 50, 04
        mov     eax, dword [ebp+18H]                    ; 26A3 _ 8B. 45, 18
        add     edx, eax                                ; 26A6 _ 01. C2
        mov     eax, dword [ebp-1CH]                    ; 26A8 _ 8B. 45, E4
        mov     dword [eax+8H], edx                     ; 26AB _ 89. 50, 08
?_159:  mov     eax, dword [ebp-1CH]                    ; 26AE _ 8B. 45, E4
        mov     eax, dword [eax+8H]                     ; 26B1 _ 8B. 40, 08
        test    eax, eax                                ; 26B4 _ 85. C0
        jns near      ?_160                                   ; 26b6 _ 79, 0a
        mov     eax, dword [ebp-1CH]                    ; 26B8 _ 8B. 45, E4
        mov     dword [eax+8H], 0                       ; 26BB _ C7. 40, 08, 00000000
?_160:  mov     eax, dword [ebp-1CH]                    ; 26C2 _ 8B. 45, E4
        mov     edx, dword [eax+8H]                     ; 26C5 _ 8B. 50, 08
        mov     eax, dword [ebp-1CH]                    ; 26C8 _ 8B. 45, E4
        mov     eax, dword [eax+4H]                     ; 26CB _ 8B. 40, 04
        cmp     edx, eax                                ; 26CE _ 39. C2
        jle near      ?_169                                   ; 26d0 _ 0f 8e, 000000e8
        mov     eax, dword [ebp-1CH]                    ; 26D6 _ 8B. 45, E4
        mov     edx, dword [eax+4H]                     ; 26D9 _ 8B. 50, 04
        mov     eax, dword [ebp-1CH]                    ; 26DC _ 8B. 45, E4
        mov     dword [eax+8H], edx                     ; 26DF _ 89. 50, 08
        jmp     ?_169                                   ; 26E2 _ E9, 000000D7

?_161:  cmp     dword [ebp+1CH], 24                     ; 26E7 _ 83. 7D, 1C, 18
        jnz near      ?_164                                   ; 26eb _ 75, 5c
        mov     eax, dword [ebp+24H]                    ; 26ED _ 8B. 45, 24
        mov     dword [ebp-1CH], eax                    ; 26F0 _ 89. 45, E4
        cmp     dword [ebp+20H], 0                      ; 26F3 _ 83. 7D, 20, 00
        jnz near      ?_162                                   ; 26f7 _ 75, 13
        mov     eax, dword [ebp-18H]                    ; 26F9 _ 8B. 45, E8
        lea     edx, [eax+1CH]                          ; 26FC _ 8D. 50, 1C
        mov     eax, dword [ebp-1CH]                    ; 26FF _ 8B. 45, E4
        mov     eax, dword [eax+4H]                     ; 2702 _ 8B. 40, 04
        mov     dword [edx], eax                        ; 2705 _ 89. 02
        jmp     ?_169                                   ; 2707 _ E9, 000000B2

?_162:  cmp     dword [ebp+20H], 1                      ; 270C _ 83. 7D, 20, 01
        jnz near      ?_163                                   ; 2710 _ 75, 13
        mov     eax, dword [ebp-18H]                    ; 2712 _ 8B. 45, E8
        lea     edx, [eax+1CH]                          ; 2715 _ 8D. 50, 1C
        mov     eax, dword [ebp-1CH]                    ; 2718 _ 8B. 45, E4
        mov     eax, dword [eax+8H]                     ; 271B _ 8B. 40, 08
        mov     dword [edx], eax                        ; 271E _ 89. 02
        jmp     ?_169                                   ; 2720 _ E9, 00000099

?_163:  cmp     dword [ebp+20H], 2                      ; 2725 _ 83. 7D, 20, 02
        jne near      ?_169                                   ; 2729 _ 0f 85, 0000008f
        mov     eax, dword [ebp-18H]                    ; 272F _ 8B. 45, E8
        lea     edx, [eax+1CH]                          ; 2732 _ 8D. 50, 1C
        mov     eax, dword [ebp-1CH]                    ; 2735 _ 8B. 45, E4
        mov     ecx, dword [eax+8H]                     ; 2738 _ 8B. 48, 08
        mov     eax, dword [ebp-1CH]                    ; 273B _ 8B. 45, E4
        mov     eax, dword [eax+4H]                     ; 273E _ 8B. 40, 04
        sub     ecx, eax                                ; 2741 _ 29. C1
        mov     eax, ecx                                ; 2743 _ 89. C8
        mov     dword [edx], eax                        ; 2745 _ 89. 02
        jmp     ?_169                                   ; 2747 _ EB, 75

?_164:  cmp     dword [ebp+1CH], 25                     ; 2749 _ 83. 7D, 1C, 19
        jnz near      ?_169                                   ; 274d _ 75, 6f
        mov     eax, dword [ebp+24H]                    ; 274F _ 8B. 45, 24
        mov     dword [ebp-1CH], eax                    ; 2752 _ 89. 45, E4
        mov     dword [ebp-0CH], 0                      ; 2755 _ C7. 45, F4, 00000000
        jmp     ?_167                                   ; 275C _ EB, 4D

?_165:  mov     eax, dword [ebp-1CH]                    ; 275E _ 8B. 45, E4
        mov     edx, dword [eax+8H]                     ; 2761 _ 8B. 50, 08
        mov     eax, dword [ebp-1CH]                    ; 2764 _ 8B. 45, E4
        mov     eax, dword [eax+4H]                     ; 2767 _ 8B. 40, 04
        cmp     edx, eax                                ; 276A _ 39. C2
        jnz near      ?_166                                   ; 276c _ 75, 02
        jmp     ?_168                                   ; 276E _ EB, 43

?_166:  mov     eax, dword [ebp-10H]                    ; 2770 _ 8B. 45, F0
        mov     eax, dword [eax+0B0H]                   ; 2773 _ 8B. 80, 000000B0
        mov     eax, dword [eax+4H]                     ; 2779 _ 8B. 40, 04
        mov     ecx, dword [ebp+18H]                    ; 277C _ 8B. 4D, 18
        mov     edx, dword [ebp-0CH]                    ; 277F _ 8B. 55, F4
        add     edx, ecx                                ; 2782 _ 01. CA
        add     edx, eax                                ; 2784 _ 01. C2
        mov     eax, dword [ebp-1CH]                    ; 2786 _ 8B. 45, E4
        mov     ecx, dword [eax]                        ; 2789 _ 8B. 08
        mov     eax, dword [ebp-1CH]                    ; 278B _ 8B. 45, E4
        mov     eax, dword [eax+8H]                     ; 278E _ 8B. 40, 08
        add     eax, ecx                                ; 2791 _ 01. C8
        movzx   eax, byte [eax]                         ; 2793 _ 0F B6. 00
        mov     byte [edx], al                          ; 2796 _ 88. 02
        mov     eax, dword [ebp-1CH]                    ; 2798 _ 8B. 45, E4
        mov     eax, dword [eax+8H]                     ; 279B _ 8B. 40, 08
        lea     edx, [eax+1H]                           ; 279E _ 8D. 50, 01
        mov     eax, dword [ebp-1CH]                    ; 27A1 _ 8B. 45, E4
        mov     dword [eax+8H], edx                     ; 27A4 _ 89. 50, 08
        add     dword [ebp-0CH], 1                      ; 27A7 _ 83. 45, F4, 01
?_167:  mov     eax, dword [ebp-0CH]                    ; 27AB _ 8B. 45, F4
        cmp     eax, dword [ebp+20H]                    ; 27AE _ 3B. 45, 20
        jl      ?_165                                   ; 27B1 _ 7C, AB
?_168:  mov     eax, dword [ebp-18H]                    ; 27B3 _ 8B. 45, E8
        lea     edx, [eax+1CH]                          ; 27B6 _ 8D. 50, 1C
        mov     eax, dword [ebp-0CH]                    ; 27B9 _ 8B. 45, F4
        mov     dword [edx], eax                        ; 27BC _ 89. 02
?_169:  mov     eax, 0                                  ; 27BE _ B8, 00000000
?_170:  mov     ebx, dword [ebp-4H]                     ; 27C3 _ 8B. 5D, FC
        leave                                           ; 27C6 _ C9
        ret                                             ; 27C7 _ C3
; kernel_api End of function

cons_putchar:; Function begin
        push    ebp                                     ; 27C8 _ 55
        mov     ebp, esp                                ; 27C9 _ 89. E5
        push    esi                                     ; 27CB _ 56
        push    ebx                                     ; 27CC _ 53
        sub     esp, 32                                 ; 27CD _ 83. EC, 20
        mov     edx, dword [ebp+8H]                     ; 27D0 _ 8B. 55, 08
        mov     eax, dword [ebp+0CH]                    ; 27D3 _ 8B. 45, 0C
        mov     byte [ebp-1CH], dl                      ; 27D6 _ 88. 55, E4
        mov     byte [ebp-20H], al                      ; 27D9 _ 88. 45, E0
        call    task_now                                ; 27DC _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 27E1 _ 89. 45, F4
        mov     eax, dword [ebp-0CH]                    ; 27E4 _ 8B. 45, F4
        mov     ebx, dword [eax+9CH]                    ; 27E7 _ 8B. 98, 0000009C
        mov     eax, dword [ebp-0CH]                    ; 27ED _ 8B. 45, F4
        mov     ecx, dword [eax+98H]                    ; 27F0 _ 8B. 88, 00000098
        mov     eax, dword [ebp-0CH]                    ; 27F6 _ 8B. 45, F4
        mov     edx, dword [eax+94H]                    ; 27F9 _ 8B. 90, 00000094
        mov     eax, dword [shtctl]                     ; 27FF _ A1, 00000284(d)
        sub     esp, 12                                 ; 2804 _ 83. EC, 0C
        push    0                                       ; 2807 _ 6A, 00
        push    ebx                                     ; 2809 _ 53
        push    ecx                                     ; 280A _ 51
        push    edx                                     ; 280B _ 52
        push    eax                                     ; 280C _ 50
        call    set_cursor                              ; 280D _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 2812 _ 83. C4, 20
        mov     eax, dword [ebp-0CH]                    ; 2815 _ 8B. 45, F4
        movzx   edx, byte [ebp-1CH]                     ; 2818 _ 0F B6. 55, E4
        mov     byte [eax+0A4H], dl                     ; 281C _ 88. 90, 000000A4
        mov     eax, dword [ebp-0CH]                    ; 2822 _ 8B. 45, F4
        mov     byte [eax+0A5H], 0                      ; 2825 _ C6. 80, 000000A5, 00
        mov     eax, dword [ebp-0CH]                    ; 282C _ 8B. 45, F4
        lea     esi, [eax+0A4H]                         ; 282F _ 8D. B0, 000000A4
        mov     eax, dword [ebp-0CH]                    ; 2835 _ 8B. 45, F4
        mov     ebx, dword [eax+9CH]                    ; 2838 _ 8B. 98, 0000009C
        mov     eax, dword [ebp-0CH]                    ; 283E _ 8B. 45, F4
        mov     ecx, dword [eax+98H]                    ; 2841 _ 8B. 88, 00000098
        mov     eax, dword [ebp-0CH]                    ; 2847 _ 8B. 45, F4
        mov     edx, dword [eax+94H]                    ; 284A _ 8B. 90, 00000094
        mov     eax, dword [shtctl]                     ; 2850 _ A1, 00000284(d)
        sub     esp, 8                                  ; 2855 _ 83. EC, 08
        push    esi                                     ; 2858 _ 56
        push    7                                       ; 2859 _ 6A, 07
        push    ebx                                     ; 285B _ 53
        push    ecx                                     ; 285C _ 51
        push    edx                                     ; 285D _ 52
        push    eax                                     ; 285E _ 50
        call    showString                              ; 285F _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 2864 _ 83. C4, 20
        mov     eax, dword [ebp-0CH]                    ; 2867 _ 8B. 45, F4
        mov     eax, dword [eax+98H]                    ; 286A _ 8B. 80, 00000098
        lea     edx, [eax+8H]                           ; 2870 _ 8D. 50, 08
        mov     eax, dword [ebp-0CH]                    ; 2873 _ 8B. 45, F4
        mov     dword [eax+98H], edx                    ; 2876 _ 89. 90, 00000098
        lea     esp, [ebp-8H]                           ; 287C _ 8D. 65, F8
        pop     ebx                                     ; 287F _ 5B
        pop     esi                                     ; 2880 _ 5E
        pop     ebp                                     ; 2881 _ 5D
        ret                                             ; 2882 _ C3
; cons_putchar End of function

cons_newline:; Function begin
        push    ebp                                     ; 2883 _ 55
        mov     ebp, esp                                ; 2884 _ 89. E5
        push    ebx                                     ; 2886 _ 53
        sub     esp, 20                                 ; 2887 _ 83. EC, 14
        cmp     dword [ebp+0CH], 0                      ; 288A _ 83. 7D, 0C, 00
        jnz near      ?_171                                   ; 288e _ 75, 06
        nop                                             ; 2890 _ 90
        jmp     ?_182                                   ; 2891 _ E9, 00000102

?_171:  cmp     dword [ebp+8H], 139                     ; 2896 _ 81. 7D, 08, 0000008B
        jg  near      ?_172                                   ; 289d _ 7f, 09
        add     dword [ebp+8H], 16                      ; 289F _ 83. 45, 08, 10
        jmp     ?_181                                   ; 28A3 _ E9, 000000CD

?_172:  mov     dword [ebp-10H], 28                     ; 28A8 _ C7. 45, F0, 0000001C
        jmp     ?_176                                   ; 28AF _ EB, 52

?_173:  mov     dword [ebp-0CH], 8                      ; 28B1 _ C7. 45, F4, 00000008
        jmp     ?_175                                   ; 28B8 _ EB, 3C

?_174:  mov     eax, dword [ebp+0CH]                    ; 28BA _ 8B. 45, 0C
        mov     edx, dword [eax]                        ; 28BD _ 8B. 10
        mov     eax, dword [ebp+0CH]                    ; 28BF _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 28C2 _ 8B. 40, 04
        imul    eax, dword [ebp-10H]                    ; 28C5 _ 0F AF. 45, F0
        mov     ecx, eax                                ; 28C9 _ 89. C1
        mov     eax, dword [ebp-0CH]                    ; 28CB _ 8B. 45, F4
        add     eax, ecx                                ; 28CE _ 01. C8
        add     edx, eax                                ; 28D0 _ 01. C2
        mov     eax, dword [ebp+0CH]                    ; 28D2 _ 8B. 45, 0C
        mov     ecx, dword [eax]                        ; 28D5 _ 8B. 08
        mov     eax, dword [ebp-10H]                    ; 28D7 _ 8B. 45, F0
        lea     ebx, [eax+10H]                          ; 28DA _ 8D. 58, 10
        mov     eax, dword [ebp+0CH]                    ; 28DD _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 28E0 _ 8B. 40, 04
        imul    ebx, eax                                ; 28E3 _ 0F AF. D8
        mov     eax, dword [ebp-0CH]                    ; 28E6 _ 8B. 45, F4
        add     eax, ebx                                ; 28E9 _ 01. D8
        add     eax, ecx                                ; 28EB _ 01. C8
        movzx   eax, byte [eax]                         ; 28ED _ 0F B6. 00
        mov     byte [edx], al                          ; 28F0 _ 88. 02
        add     dword [ebp-0CH], 1                      ; 28F2 _ 83. 45, F4, 01
?_175:  cmp     dword [ebp-0CH], 247                    ; 28F6 _ 81. 7D, F4, 000000F7
        jle near      ?_174                                   ; 28fd _ 7e, bb
        add     dword [ebp-10H], 1                      ; 28FF _ 83. 45, F0, 01
?_176:  cmp     dword [ebp-10H], 139                    ; 2903 _ 81. 7D, F0, 0000008B
        jle near      ?_173                                   ; 290a _ 7e, a5
        mov     dword [ebp-10H], 140                    ; 290C _ C7. 45, F0, 0000008C
        jmp     ?_180                                   ; 2913 _ EB, 35

?_177:  mov     dword [ebp-0CH], 8                      ; 2915 _ C7. 45, F4, 00000008
        jmp     ?_179                                   ; 291C _ EB, 1F

?_178:  mov     eax, dword [ebp+0CH]                    ; 291E _ 8B. 45, 0C
        mov     edx, dword [eax]                        ; 2921 _ 8B. 10
        mov     eax, dword [ebp+0CH]                    ; 2923 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 2926 _ 8B. 40, 04
        imul    eax, dword [ebp-10H]                    ; 2929 _ 0F AF. 45, F0
        mov     ecx, eax                                ; 292D _ 89. C1
        mov     eax, dword [ebp-0CH]                    ; 292F _ 8B. 45, F4
        add     eax, ecx                                ; 2932 _ 01. C8
        add     eax, edx                                ; 2934 _ 01. D0
        mov     byte [eax], 0                           ; 2936 _ C6. 00, 00
        add     dword [ebp-0CH], 1                      ; 2939 _ 83. 45, F4, 01
?_179:  cmp     dword [ebp-0CH], 247                    ; 293D _ 81. 7D, F4, 000000F7
        jle near      ?_178                                   ; 2944 _ 7e, d8
        add     dword [ebp-10H], 1                      ; 2946 _ 83. 45, F0, 01
?_180:  cmp     dword [ebp-10H], 155                    ; 294A _ 81. 7D, F0, 0000009B
        jle near      ?_177                                   ; 2951 _ 7e, c2
        mov     eax, dword [shtctl]                     ; 2953 _ A1, 00000284(d)
        sub     esp, 8                                  ; 2958 _ 83. EC, 08
        push    156                                     ; 295B _ 68, 0000009C
        push    248                                     ; 2960 _ 68, 000000F8
        push    28                                      ; 2965 _ 6A, 1C
        push    8                                       ; 2967 _ 6A, 08
        push    dword [ebp+0CH]                         ; 2969 _ FF. 75, 0C
        push    eax                                     ; 296C _ 50
        call    sheet_refresh                           ; 296D _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 2972 _ 83. C4, 20
?_181:  mov     eax, dword [shtctl]                     ; 2975 _ A1, 00000284(d)
        sub     esp, 8                                  ; 297A _ 83. EC, 08
        push    ?_428                                   ; 297D _ 68, 00000023(d)
        push    7                                       ; 2982 _ 6A, 07
        push    dword [ebp+8H]                          ; 2984 _ FF. 75, 08
        push    8                                       ; 2987 _ 6A, 08
        push    dword [ebp+0CH]                         ; 2989 _ FF. 75, 0C
        push    eax                                     ; 298C _ 50
        call    showString                              ; 298D _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 2992 _ 83. C4, 20
        mov     eax, dword [ebp+8H]                     ; 2995 _ 8B. 45, 08
?_182:  mov     ebx, dword [ebp-4H]                     ; 2998 _ 8B. 5D, FC
        leave                                           ; 299B _ C9
        ret                                             ; 299C _ C3
; cons_newline End of function

init_screen8:; Function begin
        push    ebp                                     ; 299D _ 55
        mov     ebp, esp                                ; 299E _ 89. E5
        push    ebx                                     ; 29A0 _ 53
        sub     esp, 4                                  ; 29A1 _ 83. EC, 04
        mov     eax, dword [ebp+10H]                    ; 29A4 _ 8B. 45, 10
        lea     edx, [eax-1DH]                          ; 29A7 _ 8D. 50, E3
        mov     eax, dword [ebp+0CH]                    ; 29AA _ 8B. 45, 0C
        sub     eax, 1                                  ; 29AD _ 83. E8, 01
        sub     esp, 4                                  ; 29B0 _ 83. EC, 04
        push    edx                                     ; 29B3 _ 52
        push    eax                                     ; 29B4 _ 50
        push    0                                       ; 29B5 _ 6A, 00
        push    0                                       ; 29B7 _ 6A, 00
        push    14                                      ; 29B9 _ 6A, 0E
        push    dword [ebp+0CH]                         ; 29BB _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 29BE _ FF. 75, 08
        call    boxfill8                                ; 29C1 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 29C6 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 29C9 _ 8B. 45, 10
        lea     ecx, [eax-1CH]                          ; 29CC _ 8D. 48, E4
        mov     eax, dword [ebp+0CH]                    ; 29CF _ 8B. 45, 0C
        lea     edx, [eax-1H]                           ; 29D2 _ 8D. 50, FF
        mov     eax, dword [ebp+10H]                    ; 29D5 _ 8B. 45, 10
        sub     eax, 28                                 ; 29D8 _ 83. E8, 1C
        sub     esp, 4                                  ; 29DB _ 83. EC, 04
        push    ecx                                     ; 29DE _ 51
        push    edx                                     ; 29DF _ 52
        push    eax                                     ; 29E0 _ 50
        push    0                                       ; 29E1 _ 6A, 00
        push    8                                       ; 29E3 _ 6A, 08
        push    dword [ebp+0CH]                         ; 29E5 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 29E8 _ FF. 75, 08
        call    boxfill8                                ; 29EB _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 29F0 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 29F3 _ 8B. 45, 10
        lea     ecx, [eax-1BH]                          ; 29F6 _ 8D. 48, E5
        mov     eax, dword [ebp+0CH]                    ; 29F9 _ 8B. 45, 0C
        lea     edx, [eax-1H]                           ; 29FC _ 8D. 50, FF
        mov     eax, dword [ebp+10H]                    ; 29FF _ 8B. 45, 10
        sub     eax, 27                                 ; 2A02 _ 83. E8, 1B
        sub     esp, 4                                  ; 2A05 _ 83. EC, 04
        push    ecx                                     ; 2A08 _ 51
        push    edx                                     ; 2A09 _ 52
        push    eax                                     ; 2A0A _ 50
        push    0                                       ; 2A0B _ 6A, 00
        push    7                                       ; 2A0D _ 6A, 07
        push    dword [ebp+0CH]                         ; 2A0F _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 2A12 _ FF. 75, 08
        call    boxfill8                                ; 2A15 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 2A1A _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 2A1D _ 8B. 45, 10
        lea     ecx, [eax-1H]                           ; 2A20 _ 8D. 48, FF
        mov     eax, dword [ebp+0CH]                    ; 2A23 _ 8B. 45, 0C
        lea     edx, [eax-1H]                           ; 2A26 _ 8D. 50, FF
        mov     eax, dword [ebp+10H]                    ; 2A29 _ 8B. 45, 10
        sub     eax, 26                                 ; 2A2C _ 83. E8, 1A
        sub     esp, 4                                  ; 2A2F _ 83. EC, 04
        push    ecx                                     ; 2A32 _ 51
        push    edx                                     ; 2A33 _ 52
        push    eax                                     ; 2A34 _ 50
        push    0                                       ; 2A35 _ 6A, 00
        push    8                                       ; 2A37 _ 6A, 08
        push    dword [ebp+0CH]                         ; 2A39 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 2A3C _ FF. 75, 08
        call    boxfill8                                ; 2A3F _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 2A44 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 2A47 _ 8B. 45, 10
        lea     edx, [eax-18H]                          ; 2A4A _ 8D. 50, E8
        mov     eax, dword [ebp+10H]                    ; 2A4D _ 8B. 45, 10
        sub     eax, 24                                 ; 2A50 _ 83. E8, 18
        sub     esp, 4                                  ; 2A53 _ 83. EC, 04
        push    edx                                     ; 2A56 _ 52
        push    59                                      ; 2A57 _ 6A, 3B
        push    eax                                     ; 2A59 _ 50
        push    3                                       ; 2A5A _ 6A, 03
        push    7                                       ; 2A5C _ 6A, 07
        push    dword [ebp+0CH]                         ; 2A5E _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 2A61 _ FF. 75, 08
        call    boxfill8                                ; 2A64 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 2A69 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 2A6C _ 8B. 45, 10
        lea     edx, [eax-4H]                           ; 2A6F _ 8D. 50, FC
        mov     eax, dword [ebp+10H]                    ; 2A72 _ 8B. 45, 10
        sub     eax, 24                                 ; 2A75 _ 83. E8, 18
        sub     esp, 4                                  ; 2A78 _ 83. EC, 04
        push    edx                                     ; 2A7B _ 52
        push    2                                       ; 2A7C _ 6A, 02
        push    eax                                     ; 2A7E _ 50
        push    2                                       ; 2A7F _ 6A, 02
        push    7                                       ; 2A81 _ 6A, 07
        push    dword [ebp+0CH]                         ; 2A83 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 2A86 _ FF. 75, 08
        call    boxfill8                                ; 2A89 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 2A8E _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 2A91 _ 8B. 45, 10
        lea     edx, [eax-4H]                           ; 2A94 _ 8D. 50, FC
        mov     eax, dword [ebp+10H]                    ; 2A97 _ 8B. 45, 10
        sub     eax, 4                                  ; 2A9A _ 83. E8, 04
        sub     esp, 4                                  ; 2A9D _ 83. EC, 04
        push    edx                                     ; 2AA0 _ 52
        push    59                                      ; 2AA1 _ 6A, 3B
        push    eax                                     ; 2AA3 _ 50
        push    3                                       ; 2AA4 _ 6A, 03
        push    15                                      ; 2AA6 _ 6A, 0F
        push    dword [ebp+0CH]                         ; 2AA8 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 2AAB _ FF. 75, 08
        call    boxfill8                                ; 2AAE _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 2AB3 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 2AB6 _ 8B. 45, 10
        lea     edx, [eax-5H]                           ; 2AB9 _ 8D. 50, FB
        mov     eax, dword [ebp+10H]                    ; 2ABC _ 8B. 45, 10
        sub     eax, 23                                 ; 2ABF _ 83. E8, 17
        sub     esp, 4                                  ; 2AC2 _ 83. EC, 04
        push    edx                                     ; 2AC5 _ 52
        push    59                                      ; 2AC6 _ 6A, 3B
        push    eax                                     ; 2AC8 _ 50
        push    59                                      ; 2AC9 _ 6A, 3B
        push    15                                      ; 2ACB _ 6A, 0F
        push    dword [ebp+0CH]                         ; 2ACD _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 2AD0 _ FF. 75, 08
        call    boxfill8                                ; 2AD3 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 2AD8 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 2ADB _ 8B. 45, 10
        lea     edx, [eax-3H]                           ; 2ADE _ 8D. 50, FD
        mov     eax, dword [ebp+10H]                    ; 2AE1 _ 8B. 45, 10
        sub     eax, 3                                  ; 2AE4 _ 83. E8, 03
        sub     esp, 4                                  ; 2AE7 _ 83. EC, 04
        push    edx                                     ; 2AEA _ 52
        push    59                                      ; 2AEB _ 6A, 3B
        push    eax                                     ; 2AED _ 50
        push    2                                       ; 2AEE _ 6A, 02
        push    0                                       ; 2AF0 _ 6A, 00
        push    dword [ebp+0CH]                         ; 2AF2 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 2AF5 _ FF. 75, 08
        call    boxfill8                                ; 2AF8 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 2AFD _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 2B00 _ 8B. 45, 10
        lea     edx, [eax-3H]                           ; 2B03 _ 8D. 50, FD
        mov     eax, dword [ebp+10H]                    ; 2B06 _ 8B. 45, 10
        sub     eax, 24                                 ; 2B09 _ 83. E8, 18
        sub     esp, 4                                  ; 2B0C _ 83. EC, 04
        push    edx                                     ; 2B0F _ 52
        push    60                                      ; 2B10 _ 6A, 3C
        push    eax                                     ; 2B12 _ 50
        push    60                                      ; 2B13 _ 6A, 3C
        push    0                                       ; 2B15 _ 6A, 00
        push    dword [ebp+0CH]                         ; 2B17 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 2B1A _ FF. 75, 08
        call    boxfill8                                ; 2B1D _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 2B22 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 2B25 _ 8B. 45, 10
        lea     ebx, [eax-18H]                          ; 2B28 _ 8D. 58, E8
        mov     eax, dword [ebp+0CH]                    ; 2B2B _ 8B. 45, 0C
        lea     ecx, [eax-4H]                           ; 2B2E _ 8D. 48, FC
        mov     eax, dword [ebp+10H]                    ; 2B31 _ 8B. 45, 10
        lea     edx, [eax-18H]                          ; 2B34 _ 8D. 50, E8
        mov     eax, dword [ebp+0CH]                    ; 2B37 _ 8B. 45, 0C
        sub     eax, 47                                 ; 2B3A _ 83. E8, 2F
        sub     esp, 4                                  ; 2B3D _ 83. EC, 04
        push    ebx                                     ; 2B40 _ 53
        push    ecx                                     ; 2B41 _ 51
        push    edx                                     ; 2B42 _ 52
        push    eax                                     ; 2B43 _ 50
        push    15                                      ; 2B44 _ 6A, 0F
        push    dword [ebp+0CH]                         ; 2B46 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 2B49 _ FF. 75, 08
        call    boxfill8                                ; 2B4C _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 2B51 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 2B54 _ 8B. 45, 10
        lea     ebx, [eax-4H]                           ; 2B57 _ 8D. 58, FC
        mov     eax, dword [ebp+0CH]                    ; 2B5A _ 8B. 45, 0C
        lea     ecx, [eax-2FH]                          ; 2B5D _ 8D. 48, D1
        mov     eax, dword [ebp+10H]                    ; 2B60 _ 8B. 45, 10
        lea     edx, [eax-17H]                          ; 2B63 _ 8D. 50, E9
        mov     eax, dword [ebp+0CH]                    ; 2B66 _ 8B. 45, 0C
        sub     eax, 47                                 ; 2B69 _ 83. E8, 2F
        sub     esp, 4                                  ; 2B6C _ 83. EC, 04
        push    ebx                                     ; 2B6F _ 53
        push    ecx                                     ; 2B70 _ 51
        push    edx                                     ; 2B71 _ 52
        push    eax                                     ; 2B72 _ 50
        push    15                                      ; 2B73 _ 6A, 0F
        push    dword [ebp+0CH]                         ; 2B75 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 2B78 _ FF. 75, 08
        call    boxfill8                                ; 2B7B _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 2B80 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 2B83 _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 2B86 _ 8D. 58, FD
        mov     eax, dword [ebp+0CH]                    ; 2B89 _ 8B. 45, 0C
        lea     ecx, [eax-4H]                           ; 2B8C _ 8D. 48, FC
        mov     eax, dword [ebp+10H]                    ; 2B8F _ 8B. 45, 10
        lea     edx, [eax-3H]                           ; 2B92 _ 8D. 50, FD
        mov     eax, dword [ebp+0CH]                    ; 2B95 _ 8B. 45, 0C
        sub     eax, 47                                 ; 2B98 _ 83. E8, 2F
        sub     esp, 4                                  ; 2B9B _ 83. EC, 04
        push    ebx                                     ; 2B9E _ 53
        push    ecx                                     ; 2B9F _ 51
        push    edx                                     ; 2BA0 _ 52
        push    eax                                     ; 2BA1 _ 50
        push    7                                       ; 2BA2 _ 6A, 07
        push    dword [ebp+0CH]                         ; 2BA4 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 2BA7 _ FF. 75, 08
        call    boxfill8                                ; 2BAA _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 2BAF _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 2BB2 _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 2BB5 _ 8D. 58, FD
        mov     eax, dword [ebp+0CH]                    ; 2BB8 _ 8B. 45, 0C
        lea     ecx, [eax-3H]                           ; 2BBB _ 8D. 48, FD
        mov     eax, dword [ebp+10H]                    ; 2BBE _ 8B. 45, 10
        lea     edx, [eax-18H]                          ; 2BC1 _ 8D. 50, E8
        mov     eax, dword [ebp+0CH]                    ; 2BC4 _ 8B. 45, 0C
        sub     eax, 3                                  ; 2BC7 _ 83. E8, 03
        sub     esp, 4                                  ; 2BCA _ 83. EC, 04
        push    ebx                                     ; 2BCD _ 53
        push    ecx                                     ; 2BCE _ 51
        push    edx                                     ; 2BCF _ 52
        push    eax                                     ; 2BD0 _ 50
        push    7                                       ; 2BD1 _ 6A, 07
        push    dword [ebp+0CH]                         ; 2BD3 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 2BD6 _ FF. 75, 08
        call    boxfill8                                ; 2BD9 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 2BDE _ 83. C4, 20
        mov     ebx, dword [ebp-4H]                     ; 2BE1 _ 8B. 5D, FC
        leave                                           ; 2BE4 _ C9
        ret                                             ; 2BE5 _ C3
; init_screen8 End of function

computeMousePosition:; Function begin
        push    ebp                                     ; 2BE6 _ 55
        mov     ebp, esp                                ; 2BE7 _ 89. E5
        mov     eax, dword [ebp+10H]                    ; 2BE9 _ 8B. 45, 10
        mov     edx, dword [eax+4H]                     ; 2BEC _ 8B. 50, 04
        mov     eax, dword [mx]                         ; 2BEF _ A1, 00000134(d)
        add     eax, edx                                ; 2BF4 _ 01. D0
        mov     dword [mx], eax                         ; 2BF6 _ A3, 00000134(d)
        mov     eax, dword [ebp+10H]                    ; 2BFB _ 8B. 45, 10
        mov     edx, dword [eax+8H]                     ; 2BFE _ 8B. 50, 08
        mov     eax, dword [my]                         ; 2C01 _ A1, 00000138(d)
        add     eax, edx                                ; 2C06 _ 01. D0
        mov     dword [my], eax                         ; 2C08 _ A3, 00000138(d)
        mov     eax, dword [mx]                         ; 2C0D _ A1, 00000134(d)
        test    eax, eax                                ; 2C12 _ 85. C0
        jns near      ?_183                                   ; 2c14 _ 79, 0a
        mov     dword [mx], 0                           ; 2C16 _ C7. 05, 00000134(d), 00000000
?_183:  mov     eax, dword [my]                         ; 2C20 _ A1, 00000138(d)
        test    eax, eax                                ; 2C25 _ 85. C0
        jns near      ?_184                                   ; 2c27 _ 79, 0a
        mov     dword [my], 0                           ; 2C29 _ C7. 05, 00000138(d), 00000000
?_184:  mov     eax, dword [xsize]                      ; 2C33 _ A1, 0000013C(d)
        lea     edx, [eax-1H]                           ; 2C38 _ 8D. 50, FF
        mov     eax, dword [mx]                         ; 2C3B _ A1, 00000134(d)
        cmp     edx, eax                                ; 2C40 _ 39. C2
        jge near      ?_185                                   ; 2c42 _ 7d, 0d
        mov     eax, dword [xsize]                      ; 2C44 _ A1, 0000013C(d)
        sub     eax, 1                                  ; 2C49 _ 83. E8, 01
        mov     dword [mx], eax                         ; 2C4C _ A3, 00000134(d)
?_185:  mov     eax, dword [ysize]                      ; 2C51 _ A1, 00000140(d)
        lea     edx, [eax-1H]                           ; 2C56 _ 8D. 50, FF
        mov     eax, dword [my]                         ; 2C59 _ A1, 00000138(d)
        cmp     edx, eax                                ; 2C5E _ 39. C2
        jge near      ?_186                                   ; 2c60 _ 7d, 0d
        mov     eax, dword [ysize]                      ; 2C62 _ A1, 00000140(d)
        sub     eax, 1                                  ; 2C67 _ 83. E8, 01
        mov     dword [my], eax                         ; 2C6A _ A3, 00000138(d)
?_186:  pop     ebp                                     ; 2C6F _ 5D
        ret                                             ; 2C70 _ C3
; computeMousePosition End of function

showString:; Function begin
        push    ebp                                     ; 2C71 _ 55
        mov     ebp, esp                                ; 2C72 _ 89. E5
        push    ebx                                     ; 2C74 _ 53
        sub     esp, 36                                 ; 2C75 _ 83. EC, 24
        mov     eax, dword [ebp+18H]                    ; 2C78 _ 8B. 45, 18
        mov     byte [ebp-1CH], al                      ; 2C7B _ 88. 45, E4
        cmp     dword [ebp+8H], 0                       ; 2C7E _ 83. 7D, 08, 00
        jz near       ?_187                                   ; 2c82 _ 74, 06
        cmp     dword [ebp+0CH], 0                      ; 2C84 _ 83. 7D, 0C, 00
        jnz near      ?_188                                   ; 2c88 _ 75, 02
?_187:  jmp     ?_191                                   ; 2C8A _ EB, 78

?_188:  mov     eax, dword [ebp+10H]                    ; 2C8C _ 8B. 45, 10
        mov     dword [ebp-0CH], eax                    ; 2C8F _ 89. 45, F4
        mov     dword [ebp-10H], 0                      ; 2C92 _ C7. 45, F0, 00000000
        jmp     ?_190                                   ; 2C99 _ EB, 3E

?_189:  mov     eax, dword [ebp+1CH]                    ; 2C9B _ 8B. 45, 1C
        movzx   eax, byte [eax]                         ; 2C9E _ 0F B6. 00
        movzx   eax, al                                 ; 2CA1 _ 0F B6. C0
        shl     eax, 4                                  ; 2CA4 _ C1. E0, 04
        lea     ebx, [systemFont+eax]                   ; 2CA7 _ 8D. 98, 00000000(d)
        movsx   ecx, byte [ebp-1CH]                     ; 2CAD _ 0F BE. 4D, E4
        mov     eax, dword [ebp+0CH]                    ; 2CB1 _ 8B. 45, 0C
        mov     edx, dword [eax+4H]                     ; 2CB4 _ 8B. 50, 04
        mov     eax, dword [ebp+0CH]                    ; 2CB7 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 2CBA _ 8B. 00
        sub     esp, 8                                  ; 2CBC _ 83. EC, 08
        push    ebx                                     ; 2CBF _ 53
        push    ecx                                     ; 2CC0 _ 51
        push    dword [ebp+14H]                         ; 2CC1 _ FF. 75, 14
        push    dword [ebp+10H]                         ; 2CC4 _ FF. 75, 10
        push    edx                                     ; 2CC7 _ 52
        push    eax                                     ; 2CC8 _ 50
        call    showFont8                               ; 2CC9 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 2CCE _ 83. C4, 20
        add     dword [ebp+10H], 8                      ; 2CD1 _ 83. 45, 10, 08
        add     dword [ebp+1CH], 1                      ; 2CD5 _ 83. 45, 1C, 01
?_190:  mov     eax, dword [ebp+1CH]                    ; 2CD9 _ 8B. 45, 1C
        movzx   eax, byte [eax]                         ; 2CDC _ 0F B6. 00
        test    al, al                                  ; 2CDF _ 84. C0
        jnz near      ?_189                                   ; 2ce1 _ 75, b8
        mov     eax, dword [ebp+14H]                    ; 2CE3 _ 8B. 45, 14
        add     eax, 16                                 ; 2CE6 _ 83. C0, 10
        sub     esp, 8                                  ; 2CE9 _ 83. EC, 08
        push    eax                                     ; 2CEC _ 50
        push    dword [ebp+10H]                         ; 2CED _ FF. 75, 10
        push    dword [ebp+14H]                         ; 2CF0 _ FF. 75, 14
        push    dword [ebp-0CH]                         ; 2CF3 _ FF. 75, F4
        push    dword [ebp+0CH]                         ; 2CF6 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 2CF9 _ FF. 75, 08
        call    sheet_refresh                           ; 2CFC _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 2D01 _ 83. C4, 20
?_191:  mov     ebx, dword [ebp-4H]                     ; 2D04 _ 8B. 5D, FC
        leave                                           ; 2D07 _ C9
        ret                                             ; 2D08 _ C3
; showString End of function

show_mouse_info:; Function begin
        push    ebp                                     ; 2D09 _ 55
        mov     ebp, esp                                ; 2D0A _ 89. E5
        sub     esp, 40                                 ; 2D0C _ 83. EC, 28
        mov     eax, dword [buf_back]                   ; 2D0F _ A1, 00000144(d)
        mov     dword [ebp-10H], eax                    ; 2D14 _ 89. 45, F0
        mov     byte [ebp-11H], 0                       ; 2D17 _ C6. 45, EF, 00
        mov     dword [ebp-18H], 0                      ; 2D1B _ C7. 45, E8, 00000000
        call    io_sti                                  ; 2D22 _ E8, FFFFFFFC(rel)
        sub     esp, 12                                 ; 2D27 _ 83. EC, 0C
        push    mouseinfo                               ; 2D2A _ 68, 00000038(d)
        call    fifo8_get                               ; 2D2F _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 2D34 _ 83. C4, 10
        mov     byte [ebp-11H], al                      ; 2D37 _ 88. 45, EF
        movzx   eax, byte [ebp-11H]                     ; 2D3A _ 0F B6. 45, EF
        sub     esp, 8                                  ; 2D3E _ 83. EC, 08
        push    eax                                     ; 2D41 _ 50
        push    mdec                                    ; 2D42 _ 68, 00000100(d)
        call    mouse_decode                            ; 2D47 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 2D4C _ 83. C4, 10
        test    eax, eax                                ; 2D4F _ 85. C0
        je near       ?_203                                   ; 2d51 _ 0f 84, 00000317
        sub     esp, 4                                  ; 2D57 _ 83. EC, 04
        push    mdec                                    ; 2D5A _ 68, 00000100(d)
        push    dword [ebp+0CH]                         ; 2D5F _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 2D62 _ FF. 75, 08
        call    computeMousePosition                    ; 2D65 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 2D6A _ 83. C4, 10
        mov     edx, dword [my]                         ; 2D6D _ 8B. 15, 00000138(d)
        mov     eax, dword [mx]                         ; 2D73 _ A1, 00000134(d)
        push    edx                                     ; 2D78 _ 52
        push    eax                                     ; 2D79 _ 50
        push    dword [ebp+10H]                         ; 2D7A _ FF. 75, 10
        push    dword [ebp+8H]                          ; 2D7D _ FF. 75, 08
        call    sheet_slide                             ; 2D80 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 2D85 _ 83. C4, 10
        mov     eax, dword [?_455]                      ; 2D88 _ A1, 0000010C(d)
        and     eax, 01H                                ; 2D8D _ 83. E0, 01
        test    eax, eax                                ; 2D90 _ 85. C0
        je near       ?_202                                   ; 2d92 _ 0f 84, 000002cc
        mov     eax, dword [mmx]                        ; 2D98 _ A1, 00000158(d)
        test    eax, eax                                ; 2D9D _ 85. C0
        jns near      ?_201                                   ; 2d9f _ 0f 89, 00000257
        mov     eax, dword [ebp+8H]                     ; 2DA5 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 2DA8 _ 8B. 40, 10
        sub     eax, 1                                  ; 2DAB _ 83. E8, 01
        mov     dword [ebp-0CH], eax                    ; 2DAE _ 89. 45, F4
        jmp     ?_199                                   ; 2DB1 _ E9, 00000238

?_192:  mov     eax, dword [ebp+8H]                     ; 2DB6 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 2DB9 _ 8B. 55, F4
        add     edx, 4                                  ; 2DBC _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 2DBF _ 8B. 44 90, 04
        mov     dword [ebp-18H], eax                    ; 2DC3 _ 89. 45, E8
        mov     edx, dword [mx]                         ; 2DC6 _ 8B. 15, 00000134(d)
        mov     eax, dword [ebp-18H]                    ; 2DCC _ 8B. 45, E8
        mov     eax, dword [eax+0CH]                    ; 2DCF _ 8B. 40, 0C
        sub     edx, eax                                ; 2DD2 _ 29. C2
        mov     eax, edx                                ; 2DD4 _ 89. D0
        mov     dword [ebp-1CH], eax                    ; 2DD6 _ 89. 45, E4
        mov     edx, dword [my]                         ; 2DD9 _ 8B. 15, 00000138(d)
        mov     eax, dword [ebp-18H]                    ; 2DDF _ 8B. 45, E8
        mov     eax, dword [eax+10H]                    ; 2DE2 _ 8B. 40, 10
        sub     edx, eax                                ; 2DE5 _ 29. C2
        mov     eax, edx                                ; 2DE7 _ 89. D0
        mov     dword [ebp-20H], eax                    ; 2DE9 _ 89. 45, E0
        cmp     dword [ebp-1CH], 0                      ; 2DEC _ 83. 7D, E4, 00
        js near       ?_198                                   ; 2df0 _ 0f 88, 000001f4
        mov     eax, dword [ebp-18H]                    ; 2DF6 _ 8B. 45, E8
        mov     eax, dword [eax+4H]                     ; 2DF9 _ 8B. 40, 04
        cmp     eax, dword [ebp-1CH]                    ; 2DFC _ 3B. 45, E4
        jle near      ?_198                                   ; 2dff _ 0f 8e, 000001e5
        cmp     dword [ebp-20H], 0                      ; 2E05 _ 83. 7D, E0, 00
        js near       ?_198                                   ; 2e09 _ 0f 88, 000001db
        mov     eax, dword [ebp-18H]                    ; 2E0F _ 8B. 45, E8
        mov     eax, dword [eax+8H]                     ; 2E12 _ 8B. 40, 08
        cmp     eax, dword [ebp-20H]                    ; 2E15 _ 3B. 45, E0
        jle near      ?_198                                   ; 2e18 _ 0f 8e, 000001cc
        mov     eax, dword [ebp-18H]                    ; 2E1E _ 8B. 45, E8
        mov     edx, dword [eax]                        ; 2E21 _ 8B. 10
        mov     eax, dword [ebp-18H]                    ; 2E23 _ 8B. 45, E8
        mov     eax, dword [eax+4H]                     ; 2E26 _ 8B. 40, 04
        imul    eax, dword [ebp-20H]                    ; 2E29 _ 0F AF. 45, E0
        mov     ecx, eax                                ; 2E2D _ 89. C1
        mov     eax, dword [ebp-1CH]                    ; 2E2F _ 8B. 45, E4
        add     eax, ecx                                ; 2E32 _ 01. C8
        add     eax, edx                                ; 2E34 _ 01. D0
        movzx   eax, byte [eax]                         ; 2E36 _ 0F B6. 00
        movzx   edx, al                                 ; 2E39 _ 0F B6. D0
        mov     eax, dword [ebp-18H]                    ; 2E3C _ 8B. 45, E8
        mov     eax, dword [eax+14H]                    ; 2E3F _ 8B. 40, 14
        cmp     edx, eax                                ; 2E42 _ 39. C2
        je near       ?_198                                   ; 2e44 _ 0f 84, 000001a0
        mov     eax, dword [current_console_task]       ; 2E4A _ A1, 00000298(d)
        mov     eax, dword [eax+0B4H]                   ; 2E4F _ 8B. 80, 000000B4
        test    eax, eax                                ; 2E55 _ 85. C0
        jz near       ?_193                                   ; 2e57 _ 74, 4a
        mov     eax, dword [current_console_task]       ; 2E59 _ A1, 00000298(d)
        mov     eax, dword [eax+0B4H]                   ; 2E5E _ 8B. 80, 000000B4
        push    0                                       ; 2E64 _ 6A, 00
        push    ?_424                                   ; 2E66 _ 68, 0000000F(d)
        push    eax                                     ; 2E6B _ 50
        push    dword [ebp+8H]                          ; 2E6C _ FF. 75, 08
        call    make_wtitle8                            ; 2E6F _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 2E74 _ 83. C4, 10
        mov     eax, dword [ebp-18H]                    ; 2E77 _ 8B. 45, E8
        mov     ecx, dword [eax+8H]                     ; 2E7A _ 8B. 48, 08
        mov     eax, dword [ebp-18H]                    ; 2E7D _ 8B. 45, E8
        mov     edx, dword [eax+4H]                     ; 2E80 _ 8B. 50, 04
        mov     eax, dword [current_console_task]       ; 2E83 _ A1, 00000298(d)
        mov     eax, dword [eax+0B4H]                   ; 2E88 _ 8B. 80, 000000B4
        sub     esp, 8                                  ; 2E8E _ 83. EC, 08
        push    ecx                                     ; 2E91 _ 51
        push    edx                                     ; 2E92 _ 52
        push    0                                       ; 2E93 _ 6A, 00
        push    0                                       ; 2E95 _ 6A, 00
        push    eax                                     ; 2E97 _ 50
        push    dword [ebp+8H]                          ; 2E98 _ FF. 75, 08
        call    sheet_refresh                           ; 2E9B _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 2EA0 _ 83. C4, 20
?_193:  mov     eax, dword [ebp-18H]                    ; 2EA3 _ 8B. 45, E8
        mov     eax, dword [eax+20H]                    ; 2EA6 _ 8B. 40, 20
        mov     dword [current_console_task], eax       ; 2EA9 _ A3, 00000298(d)
        mov     eax, dword [current_console_task]       ; 2EAE _ A1, 00000298(d)
        mov     eax, dword [eax+0B4H]                   ; 2EB3 _ 8B. 80, 000000B4
        test    eax, eax                                ; 2EB9 _ 85. C0
        jnz near      ?_194                                   ; 2ebb _ 75, 1c
        sub     esp, 8                                  ; 2EBD _ 83. EC, 08
        push    ?_440                                   ; 2EC0 _ 68, 00000066(d)
        push    7                                       ; 2EC5 _ 6A, 07
        push    96                                      ; 2EC7 _ 6A, 60
        push    0                                       ; 2EC9 _ 6A, 00
        push    dword [ebp+0CH]                         ; 2ECB _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 2ECE _ FF. 75, 08
        call    showString                              ; 2ED1 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 2ED6 _ 83. C4, 20
?_194:  mov     eax, dword [current_console_task]       ; 2ED9 _ A1, 00000298(d)
        mov     eax, dword [eax+0B4H]                   ; 2EDE _ 8B. 80, 000000B4
        test    eax, eax                                ; 2EE4 _ 85. C0
        jz near       ?_195                                   ; 2ee6 _ 74, 41
        mov     eax, dword [current_console_task]       ; 2EE8 _ A1, 00000298(d)
        mov     eax, dword [eax+0B4H]                   ; 2EED _ 8B. 80, 000000B4
        push    1                                       ; 2EF3 _ 6A, 01
        push    ?_424                                   ; 2EF5 _ 68, 0000000F(d)
        push    eax                                     ; 2EFA _ 50
        push    dword [ebp+8H]                          ; 2EFB _ FF. 75, 08
        call    make_wtitle8                            ; 2EFE _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 2F03 _ 83. C4, 10
        mov     eax, dword [ebp-18H]                    ; 2F06 _ 8B. 45, E8
        mov     edx, dword [eax+8H]                     ; 2F09 _ 8B. 50, 08
        mov     eax, dword [ebp-18H]                    ; 2F0C _ 8B. 45, E8
        mov     eax, dword [eax+4H]                     ; 2F0F _ 8B. 40, 04
        sub     esp, 8                                  ; 2F12 _ 83. EC, 08
        push    edx                                     ; 2F15 _ 52
        push    eax                                     ; 2F16 _ 50
        push    0                                       ; 2F17 _ 6A, 00
        push    0                                       ; 2F19 _ 6A, 00
        push    dword [ebp-18H]                         ; 2F1B _ FF. 75, E8
        push    dword [ebp+8H]                          ; 2F1E _ FF. 75, 08
        call    sheet_refresh                           ; 2F21 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 2F26 _ 83. C4, 20
?_195:  mov     eax, dword [ebp+8H]                     ; 2F29 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 2F2C _ 8B. 40, 10
        sub     eax, 1                                  ; 2F2F _ 83. E8, 01
        sub     esp, 4                                  ; 2F32 _ 83. EC, 04
        push    eax                                     ; 2F35 _ 50
        push    dword [ebp-18H]                         ; 2F36 _ FF. 75, E8
        push    dword [ebp+8H]                          ; 2F39 _ FF. 75, 08
        call    sheet_updown                            ; 2F3C _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 2F41 _ 83. C4, 10
        cmp     dword [ebp-1CH], 2                      ; 2F44 _ 83. 7D, E4, 02
        jle near      ?_196                                   ; 2f48 _ 7e, 36
        mov     eax, dword [ebp-18H]                    ; 2F4A _ 8B. 45, E8
        mov     eax, dword [eax+4H]                     ; 2F4D _ 8B. 40, 04
        sub     eax, 3                                  ; 2F50 _ 83. E8, 03
        cmp     eax, dword [ebp-1CH]                    ; 2F53 _ 3B. 45, E4
        jle near      ?_196                                   ; 2f56 _ 7e, 28
        cmp     dword [ebp-20H], 2                      ; 2F58 _ 83. 7D, E0, 02
        jle near      ?_196                                   ; 2f5c _ 7e, 22
        cmp     dword [ebp-20H], 20                     ; 2F5E _ 83. 7D, E0, 14
        jg  near      ?_196                                   ; 2f62 _ 7f, 1c
        mov     eax, dword [mx]                         ; 2F64 _ A1, 00000134(d)
        mov     dword [mmx], eax                        ; 2F69 _ A3, 00000158(d)
        mov     eax, dword [my]                         ; 2F6E _ A1, 00000138(d)
        mov     dword [mmy], eax                        ; 2F73 _ A3, 0000015C(d)
        mov     eax, dword [ebp-18H]                    ; 2F78 _ 8B. 45, E8
        mov     dword [mouse_clicked_sht], eax          ; 2F7B _ A3, 00000290(d)
?_196:  mov     eax, dword [ebp-18H]                    ; 2F80 _ 8B. 45, E8
        mov     eax, dword [eax+4H]                     ; 2F83 _ 8B. 40, 04
        sub     eax, 21                                 ; 2F86 _ 83. E8, 15
        cmp     eax, dword [ebp-1CH]                    ; 2F89 _ 3B. 45, E4
        jg  near      ?_197                                   ; 2f8c _ 7f, 5a
        mov     eax, dword [ebp-18H]                    ; 2F8E _ 8B. 45, E8
        mov     eax, dword [eax+4H]                     ; 2F91 _ 8B. 40, 04
        sub     eax, 5                                  ; 2F94 _ 83. E8, 05
        cmp     eax, dword [ebp-1CH]                    ; 2F97 _ 3B. 45, E4
        jle near      ?_197                                   ; 2f9a _ 7e, 4c
        cmp     dword [ebp-20H], 4                      ; 2F9C _ 83. 7D, E0, 04
        jle near      ?_197                                   ; 2fa0 _ 7e, 46
        cmp     dword [ebp-20H], 18                     ; 2FA2 _ 83. 7D, E0, 12
        jg  near      ?_197                                   ; 2fa6 _ 7f, 40
        mov     eax, dword [ebp-18H]                    ; 2FA8 _ 8B. 45, E8
        mov     eax, dword [eax+20H]                    ; 2FAB _ 8B. 40, 20
        test    eax, eax                                ; 2FAE _ 85. C0
        jz near       ?_197                                   ; 2fb0 _ 74, 36
        call    io_cli                                  ; 2FB2 _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 2FB7 _ 83. EC, 08
        push    dword [ebp-18H]                         ; 2FBA _ FF. 75, E8
        push    dword [ebp+8H]                          ; 2FBD _ FF. 75, 08
        call    sheet_free                              ; 2FC0 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 2FC5 _ 83. C4, 10
        call    get_code32_addr                         ; 2FC8 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-24H], eax                    ; 2FCD _ 89. 45, DC
        mov     eax, dword [ebp-18H]                    ; 2FD0 _ 8B. 45, E8
        mov     eax, dword [eax+20H]                    ; 2FD3 _ 8B. 40, 20
        mov     edx, kill_process                       ; 2FD6 _ BA, 00000000(d)
        sub     edx, dword [ebp-24H]                    ; 2FDB _ 2B. 55, DC
        mov     dword [eax+4CH], edx                    ; 2FDE _ 89. 50, 4C
        call    io_sti                                  ; 2FE1 _ E8, FFFFFFFC(rel)
        jmp     ?_200                                   ; 2FE6 _ EB, 12

?_197:  jmp     ?_200                                   ; 2FE8 _ EB, 10

?_198:  sub     dword [ebp-0CH], 1                      ; 2FEA _ 83. 6D, F4, 01
?_199:  cmp     dword [ebp-0CH], 0                      ; 2FEE _ 83. 7D, F4, 00
        jg  near      ?_192                                   ; 2ff2 _ 0f 8f, fffffdbe
        jmp     ?_203                                   ; 2FF8 _ EB, 74

?_200:  jmp     ?_203                                   ; 2FFA _ EB, 72

?_201:  mov     edx, dword [mx]                         ; 2FFC _ 8B. 15, 00000134(d)
        mov     eax, dword [mmx]                        ; 3002 _ A1, 00000158(d)
        sub     edx, eax                                ; 3007 _ 29. C2
        mov     eax, edx                                ; 3009 _ 89. D0
        mov     dword [ebp-1CH], eax                    ; 300B _ 89. 45, E4
        mov     edx, dword [my]                         ; 300E _ 8B. 15, 00000138(d)
        mov     eax, dword [mmy]                        ; 3014 _ A1, 0000015C(d)
        sub     edx, eax                                ; 3019 _ 29. C2
        mov     eax, edx                                ; 301B _ 89. D0
        mov     dword [ebp-20H], eax                    ; 301D _ 89. 45, E0
        mov     eax, dword [mouse_clicked_sht]          ; 3020 _ A1, 00000290(d)
        mov     edx, dword [eax+10H]                    ; 3025 _ 8B. 50, 10
        mov     eax, dword [ebp-20H]                    ; 3028 _ 8B. 45, E0
        lea     ecx, [edx+eax]                          ; 302B _ 8D. 0C 02
        mov     eax, dword [mouse_clicked_sht]          ; 302E _ A1, 00000290(d)
        mov     edx, dword [eax+0CH]                    ; 3033 _ 8B. 50, 0C
        mov     eax, dword [ebp-1CH]                    ; 3036 _ 8B. 45, E4
        add     edx, eax                                ; 3039 _ 01. C2
        mov     eax, dword [mouse_clicked_sht]          ; 303B _ A1, 00000290(d)
        push    ecx                                     ; 3040 _ 51
        push    edx                                     ; 3041 _ 52
        push    eax                                     ; 3042 _ 50
        push    dword [ebp+8H]                          ; 3043 _ FF. 75, 08
        call    sheet_slide                             ; 3046 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 304B _ 83. C4, 10
        mov     eax, dword [mx]                         ; 304E _ A1, 00000134(d)
        mov     dword [mmx], eax                        ; 3053 _ A3, 00000158(d)
        mov     eax, dword [my]                         ; 3058 _ A1, 00000138(d)
        mov     dword [mmy], eax                        ; 305D _ A3, 0000015C(d)
        jmp     ?_203                                   ; 3062 _ EB, 0A

?_202:  mov     dword [mmx], -1                         ; 3064 _ C7. 05, 00000158(d), FFFFFFFF
?_203:  leave                                           ; 306E _ C9
        ret                                             ; 306F _ C3
; show_mouse_info End of function

initBootInfo:; Function begin
        push    ebp                                     ; 3070 _ 55
        mov     ebp, esp                                ; 3071 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 3073 _ 8B. 45, 08
        mov     dword [eax], -536870912                 ; 3076 _ C7. 00, E0000000
        mov     eax, dword [ebp+8H]                     ; 307C _ 8B. 45, 08
; Note: Length-changing prefix causes delay on Intel processors
        mov     word [eax+4H], 640                      ; 307F _ 66: C7. 40, 04, 0280
        mov     eax, dword [ebp+8H]                     ; 3085 _ 8B. 45, 08
; Note: Length-changing prefix causes delay on Intel processors
        mov     word [eax+6H], 480                      ; 3088 _ 66: C7. 40, 06, 01E0
        pop     ebp                                     ; 308E _ 5D
        ret                                             ; 308F _ C3
; initBootInfo End of function

init_palette:; Function begin
        push    ebp                                     ; 3090 _ 55
        mov     ebp, esp                                ; 3091 _ 89. E5
        sub     esp, 680                                ; 3093 _ 81. EC, 000002A8
        sub     esp, 4                                  ; 3099 _ 83. EC, 04
        push    table_rgb.2153                          ; 309C _ 68, 00000180(d)
        push    15                                      ; 30A1 _ 6A, 0F
        push    0                                       ; 30A3 _ 6A, 00
        call    set_palette                             ; 30A5 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 30AA _ 83. C4, 10
        mov     dword [ebp-14H], 0                      ; 30AD _ C7. 45, EC, 00000000
        jmp     ?_209                                   ; 30B4 _ E9, 000000EF

?_204:  mov     dword [ebp-10H], 0                      ; 30B9 _ C7. 45, F0, 00000000
        jmp     ?_208                                   ; 30C0 _ E9, 000000D5

?_205:  mov     dword [ebp-0CH], 0                      ; 30C5 _ C7. 45, F4, 00000000
        jmp     ?_207                                   ; 30CC _ E9, 000000BB

?_206:  mov     edx, dword [ebp-10H]                    ; 30D1 _ 8B. 55, F0
        mov     eax, edx                                ; 30D4 _ 89. D0
        add     eax, eax                                ; 30D6 _ 01. C0
        add     eax, edx                                ; 30D8 _ 01. D0
        add     eax, eax                                ; 30DA _ 01. C0
        mov     edx, eax                                ; 30DC _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 30DE _ 8B. 45, F4
        lea     ecx, [edx+eax]                          ; 30E1 _ 8D. 0C 02
        mov     edx, dword [ebp-14H]                    ; 30E4 _ 8B. 55, EC
        mov     eax, edx                                ; 30E7 _ 89. D0
        shl     eax, 3                                  ; 30E9 _ C1. E0, 03
        add     eax, edx                                ; 30EC _ 01. D0
        shl     eax, 2                                  ; 30EE _ C1. E0, 02
        lea     edx, [ecx+eax]                          ; 30F1 _ 8D. 14 01
        mov     eax, edx                                ; 30F4 _ 89. D0
        add     eax, eax                                ; 30F6 _ 01. C0
        add     edx, eax                                ; 30F8 _ 01. C2
        mov     eax, dword [ebp-0CH]                    ; 30FA _ 8B. 45, F4
        mov     ecx, 51                                 ; 30FD _ B9, 00000033
        imul    eax, ecx                                ; 3102 _ 0F AF. C1
        mov     byte [ebp+edx-29CH], al                 ; 3105 _ 88. 84 15, FFFFFD64
        mov     edx, dword [ebp-10H]                    ; 310C _ 8B. 55, F0
        mov     eax, edx                                ; 310F _ 89. D0
        add     eax, eax                                ; 3111 _ 01. C0
        add     eax, edx                                ; 3113 _ 01. D0
        add     eax, eax                                ; 3115 _ 01. C0
        mov     edx, eax                                ; 3117 _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 3119 _ 8B. 45, F4
        lea     ecx, [edx+eax]                          ; 311C _ 8D. 0C 02
        mov     edx, dword [ebp-14H]                    ; 311F _ 8B. 55, EC
        mov     eax, edx                                ; 3122 _ 89. D0
        shl     eax, 3                                  ; 3124 _ C1. E0, 03
        add     eax, edx                                ; 3127 _ 01. D0
        shl     eax, 2                                  ; 3129 _ C1. E0, 02
        lea     edx, [ecx+eax]                          ; 312C _ 8D. 14 01
        mov     eax, edx                                ; 312F _ 89. D0
        add     eax, eax                                ; 3131 _ 01. C0
        add     eax, edx                                ; 3133 _ 01. D0
        lea     edx, [eax+1H]                           ; 3135 _ 8D. 50, 01
        mov     eax, dword [ebp-10H]                    ; 3138 _ 8B. 45, F0
        mov     ecx, 51                                 ; 313B _ B9, 00000033
        imul    eax, ecx                                ; 3140 _ 0F AF. C1
        mov     byte [ebp+edx-29CH], al                 ; 3143 _ 88. 84 15, FFFFFD64
        mov     edx, dword [ebp-10H]                    ; 314A _ 8B. 55, F0
        mov     eax, edx                                ; 314D _ 89. D0
        add     eax, eax                                ; 314F _ 01. C0
        add     eax, edx                                ; 3151 _ 01. D0
        add     eax, eax                                ; 3153 _ 01. C0
        mov     edx, eax                                ; 3155 _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 3157 _ 8B. 45, F4
        lea     ecx, [edx+eax]                          ; 315A _ 8D. 0C 02
        mov     edx, dword [ebp-14H]                    ; 315D _ 8B. 55, EC
        mov     eax, edx                                ; 3160 _ 89. D0
        shl     eax, 3                                  ; 3162 _ C1. E0, 03
        add     eax, edx                                ; 3165 _ 01. D0
        shl     eax, 2                                  ; 3167 _ C1. E0, 02
        lea     edx, [ecx+eax]                          ; 316A _ 8D. 14 01
        mov     eax, edx                                ; 316D _ 89. D0
        add     eax, eax                                ; 316F _ 01. C0
        add     eax, edx                                ; 3171 _ 01. D0
        lea     edx, [eax+2H]                           ; 3173 _ 8D. 50, 02
        mov     eax, dword [ebp-14H]                    ; 3176 _ 8B. 45, EC
        mov     ecx, 51                                 ; 3179 _ B9, 00000033
        imul    eax, ecx                                ; 317E _ 0F AF. C1
        mov     byte [ebp+edx-29CH], al                 ; 3181 _ 88. 84 15, FFFFFD64
        add     dword [ebp-0CH], 1                      ; 3188 _ 83. 45, F4, 01
?_207:  cmp     dword [ebp-0CH], 5                      ; 318C _ 83. 7D, F4, 05
        jle near      ?_206                                   ; 3190 _ 0f 8e, ffffff3b
        add     dword [ebp-10H], 1                      ; 3196 _ 83. 45, F0, 01
?_208:  cmp     dword [ebp-10H], 5                      ; 319A _ 83. 7D, F0, 05
        jle near      ?_205                                   ; 319e _ 0f 8e, ffffff21
        add     dword [ebp-14H], 1                      ; 31A4 _ 83. 45, EC, 01
?_209:  cmp     dword [ebp-14H], 5                      ; 31A8 _ 83. 7D, EC, 05
        jle near      ?_204                                   ; 31ac _ 0f 8e, ffffff07
        sub     esp, 4                                  ; 31B2 _ 83. EC, 04
        lea     eax, [ebp-29CH]                         ; 31B5 _ 8D. 85, FFFFFD64
        push    eax                                     ; 31BB _ 50
        push    231                                     ; 31BC _ 68, 000000E7
        push    16                                      ; 31C1 _ 6A, 10
        call    set_palette                             ; 31C3 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 31C8 _ 83. C4, 10
        nop                                             ; 31CB _ 90
        leave                                           ; 31CC _ C9
        ret                                             ; 31CD _ C3
; init_palette End of function

set_palette:; Function begin
        push    ebp                                     ; 31CE _ 55
        mov     ebp, esp                                ; 31CF _ 89. E5
        sub     esp, 24                                 ; 31D1 _ 83. EC, 18
        call    io_load_eflags                          ; 31D4 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 31D9 _ 89. 45, F0
        call    io_cli                                  ; 31DC _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 31E1 _ 83. EC, 08
        push    dword [ebp+8H]                          ; 31E4 _ FF. 75, 08
        push    968                                     ; 31E7 _ 68, 000003C8
        call    io_out8                                 ; 31EC _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 31F1 _ 83. C4, 10
        mov     eax, dword [ebp+8H]                     ; 31F4 _ 8B. 45, 08
        mov     dword [ebp-0CH], eax                    ; 31F7 _ 89. 45, F4
        jmp     ?_211                                   ; 31FA _ EB, 65

?_210:  mov     eax, dword [ebp+10H]                    ; 31FC _ 8B. 45, 10
        movzx   eax, byte [eax]                         ; 31FF _ 0F B6. 00
        shr     al, 2                                   ; 3202 _ C0. E8, 02
        movzx   eax, al                                 ; 3205 _ 0F B6. C0
        sub     esp, 8                                  ; 3208 _ 83. EC, 08
        push    eax                                     ; 320B _ 50
        push    969                                     ; 320C _ 68, 000003C9
        call    io_out8                                 ; 3211 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 3216 _ 83. C4, 10
        mov     eax, dword [ebp+10H]                    ; 3219 _ 8B. 45, 10
        add     eax, 1                                  ; 321C _ 83. C0, 01
        movzx   eax, byte [eax]                         ; 321F _ 0F B6. 00
        shr     al, 2                                   ; 3222 _ C0. E8, 02
        movzx   eax, al                                 ; 3225 _ 0F B6. C0
        sub     esp, 8                                  ; 3228 _ 83. EC, 08
        push    eax                                     ; 322B _ 50
        push    969                                     ; 322C _ 68, 000003C9
        call    io_out8                                 ; 3231 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 3236 _ 83. C4, 10
        mov     eax, dword [ebp+10H]                    ; 3239 _ 8B. 45, 10
        add     eax, 2                                  ; 323C _ 83. C0, 02
        movzx   eax, byte [eax]                         ; 323F _ 0F B6. 00
        shr     al, 2                                   ; 3242 _ C0. E8, 02
        movzx   eax, al                                 ; 3245 _ 0F B6. C0
        sub     esp, 8                                  ; 3248 _ 83. EC, 08
        push    eax                                     ; 324B _ 50
        push    969                                     ; 324C _ 68, 000003C9
        call    io_out8                                 ; 3251 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 3256 _ 83. C4, 10
        add     dword [ebp+10H], 3                      ; 3259 _ 83. 45, 10, 03
        add     dword [ebp-0CH], 1                      ; 325D _ 83. 45, F4, 01
?_211:  mov     eax, dword [ebp-0CH]                    ; 3261 _ 8B. 45, F4
        cmp     eax, dword [ebp+0CH]                    ; 3264 _ 3B. 45, 0C
        jle near      ?_210                                   ; 3267 _ 7e, 93
        sub     esp, 12                                 ; 3269 _ 83. EC, 0C
        push    dword [ebp-10H]                         ; 326C _ FF. 75, F0
        call    io_store_eflags                         ; 326F _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 3274 _ 83. C4, 10
        nop                                             ; 3277 _ 90
        leave                                           ; 3278 _ C9
        ret                                             ; 3279 _ C3
; set_palette End of function

boxfill8:; Function begin
        push    ebp                                     ; 327A _ 55
        mov     ebp, esp                                ; 327B _ 89. E5
        sub     esp, 20                                 ; 327D _ 83. EC, 14
        mov     eax, dword [ebp+10H]                    ; 3280 _ 8B. 45, 10
        mov     byte [ebp-14H], al                      ; 3283 _ 88. 45, EC
        mov     eax, dword [ebp+18H]                    ; 3286 _ 8B. 45, 18
        mov     dword [ebp-8H], eax                     ; 3289 _ 89. 45, F8
        jmp     ?_215                                   ; 328C _ EB, 33

?_212:  mov     eax, dword [ebp+14H]                    ; 328E _ 8B. 45, 14
        mov     dword [ebp-4H], eax                     ; 3291 _ 89. 45, FC
        jmp     ?_214                                   ; 3294 _ EB, 1F

?_213:  mov     eax, dword [ebp-8H]                     ; 3296 _ 8B. 45, F8
        imul    eax, dword [ebp+0CH]                    ; 3299 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 329D _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 329F _ 8B. 45, FC
        add     eax, edx                                ; 32A2 _ 01. D0
        mov     edx, eax                                ; 32A4 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 32A6 _ 8B. 45, 08
        add     edx, eax                                ; 32A9 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 32AB _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 32AF _ 88. 02
        add     dword [ebp-4H], 1                       ; 32B1 _ 83. 45, FC, 01
?_214:  mov     eax, dword [ebp-4H]                     ; 32B5 _ 8B. 45, FC
        cmp     eax, dword [ebp+1CH]                    ; 32B8 _ 3B. 45, 1C
        jle near      ?_213                                   ; 32bb _ 7e, d9
        add     dword [ebp-8H], 1                       ; 32BD _ 83. 45, F8, 01
?_215:  mov     eax, dword [ebp-8H]                     ; 32C1 _ 8B. 45, F8
        cmp     eax, dword [ebp+20H]                    ; 32C4 _ 3B. 45, 20
        jle near      ?_212                                   ; 32c7 _ 7e, c5
        leave                                           ; 32C9 _ C9
        ret                                             ; 32CA _ C3
; boxfill8 End of function

showFont8:; Function begin
        push    ebp                                     ; 32CB _ 55
        mov     ebp, esp                                ; 32CC _ 89. E5
        sub     esp, 20                                 ; 32CE _ 83. EC, 14
        mov     eax, dword [ebp+18H]                    ; 32D1 _ 8B. 45, 18
        mov     byte [ebp-14H], al                      ; 32D4 _ 88. 45, EC
        mov     dword [ebp-4H], 0                       ; 32D7 _ C7. 45, FC, 00000000
        jmp     ?_225                                   ; 32DE _ E9, 0000016C

?_216:  mov     edx, dword [ebp-4H]                     ; 32E3 _ 8B. 55, FC
        mov     eax, dword [ebp+1CH]                    ; 32E6 _ 8B. 45, 1C
        add     eax, edx                                ; 32E9 _ 01. D0
        movzx   eax, byte [eax]                         ; 32EB _ 0F B6. 00
        mov     byte [ebp-5H], al                       ; 32EE _ 88. 45, FB
        cmp     byte [ebp-5H], 0                        ; 32F1 _ 80. 7D, FB, 00
        jns near      ?_217                                   ; 32f5 _ 79, 20
        mov     edx, dword [ebp+14H]                    ; 32F7 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 32FA _ 8B. 45, FC
        add     eax, edx                                ; 32FD _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 32FF _ 0F AF. 45, 0C
        mov     edx, eax                                ; 3303 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 3305 _ 8B. 45, 10
        add     eax, edx                                ; 3308 _ 01. D0
        mov     edx, eax                                ; 330A _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 330C _ 8B. 45, 08
        add     edx, eax                                ; 330F _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 3311 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 3315 _ 88. 02
?_217:  movsx   eax, byte [ebp-5H]                      ; 3317 _ 0F BE. 45, FB
        and     eax, 40H                                ; 331B _ 83. E0, 40
        test    eax, eax                                ; 331E _ 85. C0
        jz near       ?_218                                   ; 3320 _ 74, 21
        mov     edx, dword [ebp+14H]                    ; 3322 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 3325 _ 8B. 45, FC
        add     eax, edx                                ; 3328 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 332A _ 0F AF. 45, 0C
        mov     edx, eax                                ; 332E _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 3330 _ 8B. 45, 10
        add     eax, edx                                ; 3333 _ 01. D0
        lea     edx, [eax+1H]                           ; 3335 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 3338 _ 8B. 45, 08
        add     edx, eax                                ; 333B _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 333D _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 3341 _ 88. 02
?_218:  movsx   eax, byte [ebp-5H]                      ; 3343 _ 0F BE. 45, FB
        and     eax, 20H                                ; 3347 _ 83. E0, 20
        test    eax, eax                                ; 334A _ 85. C0
        jz near       ?_219                                   ; 334c _ 74, 21
        mov     edx, dword [ebp+14H]                    ; 334E _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 3351 _ 8B. 45, FC
        add     eax, edx                                ; 3354 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 3356 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 335A _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 335C _ 8B. 45, 10
        add     eax, edx                                ; 335F _ 01. D0
        lea     edx, [eax+2H]                           ; 3361 _ 8D. 50, 02
        mov     eax, dword [ebp+8H]                     ; 3364 _ 8B. 45, 08
        add     edx, eax                                ; 3367 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 3369 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 336D _ 88. 02
?_219:  movsx   eax, byte [ebp-5H]                      ; 336F _ 0F BE. 45, FB
        and     eax, 10H                                ; 3373 _ 83. E0, 10
        test    eax, eax                                ; 3376 _ 85. C0
        jz near       ?_220                                   ; 3378 _ 74, 21
        mov     edx, dword [ebp+14H]                    ; 337A _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 337D _ 8B. 45, FC
        add     eax, edx                                ; 3380 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 3382 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 3386 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 3388 _ 8B. 45, 10
        add     eax, edx                                ; 338B _ 01. D0
        lea     edx, [eax+3H]                           ; 338D _ 8D. 50, 03
        mov     eax, dword [ebp+8H]                     ; 3390 _ 8B. 45, 08
        add     edx, eax                                ; 3393 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 3395 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 3399 _ 88. 02
?_220:  movsx   eax, byte [ebp-5H]                      ; 339B _ 0F BE. 45, FB
        and     eax, 08H                                ; 339F _ 83. E0, 08
        test    eax, eax                                ; 33A2 _ 85. C0
        jz near       ?_221                                   ; 33a4 _ 74, 21
        mov     edx, dword [ebp+14H]                    ; 33A6 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 33A9 _ 8B. 45, FC
        add     eax, edx                                ; 33AC _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 33AE _ 0F AF. 45, 0C
        mov     edx, eax                                ; 33B2 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 33B4 _ 8B. 45, 10
        add     eax, edx                                ; 33B7 _ 01. D0
        lea     edx, [eax+4H]                           ; 33B9 _ 8D. 50, 04
        mov     eax, dword [ebp+8H]                     ; 33BC _ 8B. 45, 08
        add     edx, eax                                ; 33BF _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 33C1 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 33C5 _ 88. 02
?_221:  movsx   eax, byte [ebp-5H]                      ; 33C7 _ 0F BE. 45, FB
        and     eax, 04H                                ; 33CB _ 83. E0, 04
        test    eax, eax                                ; 33CE _ 85. C0
        jz near       ?_222                                   ; 33d0 _ 74, 21
        mov     edx, dword [ebp+14H]                    ; 33D2 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 33D5 _ 8B. 45, FC
        add     eax, edx                                ; 33D8 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 33DA _ 0F AF. 45, 0C
        mov     edx, eax                                ; 33DE _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 33E0 _ 8B. 45, 10
        add     eax, edx                                ; 33E3 _ 01. D0
        lea     edx, [eax+5H]                           ; 33E5 _ 8D. 50, 05
        mov     eax, dword [ebp+8H]                     ; 33E8 _ 8B. 45, 08
        add     edx, eax                                ; 33EB _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 33ED _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 33F1 _ 88. 02
?_222:  movsx   eax, byte [ebp-5H]                      ; 33F3 _ 0F BE. 45, FB
        and     eax, 02H                                ; 33F7 _ 83. E0, 02
        test    eax, eax                                ; 33FA _ 85. C0
        jz near       ?_223                                   ; 33fc _ 74, 21
        mov     edx, dword [ebp+14H]                    ; 33FE _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 3401 _ 8B. 45, FC
        add     eax, edx                                ; 3404 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 3406 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 340A _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 340C _ 8B. 45, 10
        add     eax, edx                                ; 340F _ 01. D0
        lea     edx, [eax+6H]                           ; 3411 _ 8D. 50, 06
        mov     eax, dword [ebp+8H]                     ; 3414 _ 8B. 45, 08
        add     edx, eax                                ; 3417 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 3419 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 341D _ 88. 02
?_223:  movsx   eax, byte [ebp-5H]                      ; 341F _ 0F BE. 45, FB
        and     eax, 01H                                ; 3423 _ 83. E0, 01
        test    eax, eax                                ; 3426 _ 85. C0
        jz near       ?_224                                   ; 3428 _ 74, 21
        mov     edx, dword [ebp+14H]                    ; 342A _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 342D _ 8B. 45, FC
        add     eax, edx                                ; 3430 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 3432 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 3436 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 3438 _ 8B. 45, 10
        add     eax, edx                                ; 343B _ 01. D0
        lea     edx, [eax+7H]                           ; 343D _ 8D. 50, 07
        mov     eax, dword [ebp+8H]                     ; 3440 _ 8B. 45, 08
        add     edx, eax                                ; 3443 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 3445 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 3449 _ 88. 02
?_224:  add     dword [ebp-4H], 1                       ; 344B _ 83. 45, FC, 01
?_225:  cmp     dword [ebp-4H], 15                      ; 344F _ 83. 7D, FC, 0F
        jle near      ?_216                                   ; 3453 _ 0f 8e, fffffe8a
        leave                                           ; 3459 _ C9
        ret                                             ; 345A _ C3
; showFont8 End of function

init_mouse_cursor:; Function begin
        push    ebp                                     ; 345B _ 55
        mov     ebp, esp                                ; 345C _ 89. E5
        sub     esp, 20                                 ; 345E _ 83. EC, 14
        mov     eax, dword [ebp+0CH]                    ; 3461 _ 8B. 45, 0C
        mov     byte [ebp-14H], al                      ; 3464 _ 88. 45, EC
        mov     dword [ebp-8H], 0                       ; 3467 _ C7. 45, F8, 00000000
        jmp     ?_232                                   ; 346E _ E9, 000000B1

?_226:  mov     dword [ebp-4H], 0                       ; 3473 _ C7. 45, FC, 00000000
        jmp     ?_231                                   ; 347A _ E9, 00000097

?_227:  mov     eax, dword [ebp-8H]                     ; 347F _ 8B. 45, F8
        shl     eax, 4                                  ; 3482 _ C1. E0, 04
        mov     edx, eax                                ; 3485 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 3487 _ 8B. 45, FC
        add     eax, edx                                ; 348A _ 01. D0
        add     eax, cursor.2213                        ; 348C _ 05, 000001C0(d)
        movzx   eax, byte [eax]                         ; 3491 _ 0F B6. 00
        cmp     al, 42                                  ; 3494 _ 3C, 2A
        jnz near      ?_228                                   ; 3496 _ 75, 17
        mov     eax, dword [ebp-8H]                     ; 3498 _ 8B. 45, F8
        shl     eax, 4                                  ; 349B _ C1. E0, 04
        mov     edx, eax                                ; 349E _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 34A0 _ 8B. 45, FC
        add     eax, edx                                ; 34A3 _ 01. D0
        mov     edx, eax                                ; 34A5 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 34A7 _ 8B. 45, 08
        add     eax, edx                                ; 34AA _ 01. D0
        mov     byte [eax], 0                           ; 34AC _ C6. 00, 00
?_228:  mov     eax, dword [ebp-8H]                     ; 34AF _ 8B. 45, F8
        shl     eax, 4                                  ; 34B2 _ C1. E0, 04
        mov     edx, eax                                ; 34B5 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 34B7 _ 8B. 45, FC
        add     eax, edx                                ; 34BA _ 01. D0
        add     eax, cursor.2213                        ; 34BC _ 05, 000001C0(d)
        movzx   eax, byte [eax]                         ; 34C1 _ 0F B6. 00
        cmp     al, 79                                  ; 34C4 _ 3C, 4F
        jnz near      ?_229                                   ; 34c6 _ 75, 17
        mov     eax, dword [ebp-8H]                     ; 34C8 _ 8B. 45, F8
        shl     eax, 4                                  ; 34CB _ C1. E0, 04
        mov     edx, eax                                ; 34CE _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 34D0 _ 8B. 45, FC
        add     eax, edx                                ; 34D3 _ 01. D0
        mov     edx, eax                                ; 34D5 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 34D7 _ 8B. 45, 08
        add     eax, edx                                ; 34DA _ 01. D0
        mov     byte [eax], 7                           ; 34DC _ C6. 00, 07
?_229:  mov     eax, dword [ebp-8H]                     ; 34DF _ 8B. 45, F8
        shl     eax, 4                                  ; 34E2 _ C1. E0, 04
        mov     edx, eax                                ; 34E5 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 34E7 _ 8B. 45, FC
        add     eax, edx                                ; 34EA _ 01. D0
        add     eax, cursor.2213                        ; 34EC _ 05, 000001C0(d)
        movzx   eax, byte [eax]                         ; 34F1 _ 0F B6. 00
        cmp     al, 46                                  ; 34F4 _ 3C, 2E
        jnz near      ?_230                                   ; 34f6 _ 75, 1a
        mov     eax, dword [ebp-8H]                     ; 34F8 _ 8B. 45, F8
        shl     eax, 4                                  ; 34FB _ C1. E0, 04
        mov     edx, eax                                ; 34FE _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 3500 _ 8B. 45, FC
        add     eax, edx                                ; 3503 _ 01. D0
        mov     edx, eax                                ; 3505 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 3507 _ 8B. 45, 08
        add     edx, eax                                ; 350A _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 350C _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 3510 _ 88. 02
?_230:  add     dword [ebp-4H], 1                       ; 3512 _ 83. 45, FC, 01
?_231:  cmp     dword [ebp-4H], 15                      ; 3516 _ 83. 7D, FC, 0F
        jle near      ?_227                                   ; 351a _ 0f 8e, ffffff5f
        add     dword [ebp-8H], 1                       ; 3520 _ 83. 45, F8, 01
?_232:  cmp     dword [ebp-8H], 15                      ; 3524 _ 83. 7D, F8, 0F
        jle near      ?_226                                   ; 3528 _ 0f 8e, ffffff45
        leave                                           ; 352E _ C9
        ret                                             ; 352F _ C3
; init_mouse_cursor End of function

putblock:; Function begin
        push    ebp                                     ; 3530 _ 55
        mov     ebp, esp                                ; 3531 _ 89. E5
        sub     esp, 16                                 ; 3533 _ 83. EC, 10
        mov     dword [ebp-8H], 0                       ; 3536 _ C7. 45, F8, 00000000
        jmp     ?_236                                   ; 353D _ EB, 50

?_233:  mov     dword [ebp-4H], 0                       ; 353F _ C7. 45, FC, 00000000
        jmp     ?_235                                   ; 3546 _ EB, 3B

?_234:  mov     edx, dword [ebp+1CH]                    ; 3548 _ 8B. 55, 1C
        mov     eax, dword [ebp-8H]                     ; 354B _ 8B. 45, F8
        add     eax, edx                                ; 354E _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 3550 _ 0F AF. 45, 0C
        mov     ecx, dword [ebp+18H]                    ; 3554 _ 8B. 4D, 18
        mov     edx, dword [ebp-4H]                     ; 3557 _ 8B. 55, FC
        add     edx, ecx                                ; 355A _ 01. CA
        add     eax, edx                                ; 355C _ 01. D0
        mov     edx, eax                                ; 355E _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 3560 _ 8B. 45, 08
        add     edx, eax                                ; 3563 _ 01. C2
        mov     eax, dword [ebp-8H]                     ; 3565 _ 8B. 45, F8
        imul    eax, dword [ebp+24H]                    ; 3568 _ 0F AF. 45, 24
        mov     ecx, eax                                ; 356C _ 89. C1
        mov     eax, dword [ebp-4H]                     ; 356E _ 8B. 45, FC
        add     eax, ecx                                ; 3571 _ 01. C8
        mov     ecx, eax                                ; 3573 _ 89. C1
        mov     eax, dword [ebp+20H]                    ; 3575 _ 8B. 45, 20
        add     eax, ecx                                ; 3578 _ 01. C8
        movzx   eax, byte [eax]                         ; 357A _ 0F B6. 00
        mov     byte [edx], al                          ; 357D _ 88. 02
        add     dword [ebp-4H], 1                       ; 357F _ 83. 45, FC, 01
?_235:  mov     eax, dword [ebp-4H]                     ; 3583 _ 8B. 45, FC
        cmp     eax, dword [ebp+10H]                    ; 3586 _ 3B. 45, 10
        jl      ?_234                                   ; 3589 _ 7C, BD
        add     dword [ebp-8H], 1                       ; 358B _ 83. 45, F8, 01
?_236:  mov     eax, dword [ebp-8H]                     ; 358F _ 8B. 45, F8
        cmp     eax, dword [ebp+14H]                    ; 3592 _ 3B. 45, 14
        jl      ?_233                                   ; 3595 _ 7C, A8
        leave                                           ; 3597 _ C9
        ret                                             ; 3598 _ C3
; putblock End of function

intHandlerFromC:; Function begin
        push    ebp                                     ; 3599 _ 55
        mov     ebp, esp                                ; 359A _ 89. E5
        sub     esp, 24                                 ; 359C _ 83. EC, 18
        mov     eax, dword [bootInfo]                   ; 359F _ A1, 00000014(d)
        mov     dword [ebp-0CH], eax                    ; 35A4 _ 89. 45, F4
        movzx   eax, word [?_452]                       ; 35A7 _ 0F B7. 05, 00000018(d)
        cwde                                            ; 35AE _ 98
        mov     dword [ebp-10H], eax                    ; 35AF _ 89. 45, F0
        movzx   eax, word [?_453]                       ; 35B2 _ 0F B7. 05, 0000001A(d)
        cwde                                            ; 35B9 _ 98
        mov     dword [ebp-14H], eax                    ; 35BA _ 89. 45, EC
        sub     esp, 8                                  ; 35BD _ 83. EC, 08
        push    32                                      ; 35C0 _ 6A, 20
        push    32                                      ; 35C2 _ 6A, 20
        call    io_out8                                 ; 35C4 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 35C9 _ 83. C4, 10
        mov     byte [ebp-15H], 0                       ; 35CC _ C6. 45, EB, 00
        sub     esp, 12                                 ; 35D0 _ 83. EC, 0C
        push    96                                      ; 35D3 _ 6A, 60
        call    io_in8                                  ; 35D5 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 35DA _ 83. C4, 10
        mov     byte [ebp-15H], al                      ; 35DD _ 88. 45, EB
        movzx   eax, byte [ebp-15H]                     ; 35E0 _ 0F B6. 45, EB
        sub     esp, 8                                  ; 35E4 _ 83. EC, 08
        push    eax                                     ; 35E7 _ 50
        push    keyinfo                                 ; 35E8 _ 68, 0000001C(d)
        call    fifo8_put                               ; 35ED _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 35F2 _ 83. C4, 10
        nop                                             ; 35F5 _ 90
        leave                                           ; 35F6 _ C9
        ret                                             ; 35F7 _ C3
; intHandlerFromC End of function

charToHexVal:; Function begin
        push    ebp                                     ; 35F8 _ 55
        mov     ebp, esp                                ; 35F9 _ 89. E5
        sub     esp, 4                                  ; 35FB _ 83. EC, 04
        mov     eax, dword [ebp+8H]                     ; 35FE _ 8B. 45, 08
        mov     byte [ebp-4H], al                       ; 3601 _ 88. 45, FC
        cmp     byte [ebp-4H], 9                        ; 3604 _ 80. 7D, FC, 09
        jle near      ?_237                                   ; 3608 _ 7e, 09
        movzx   eax, byte [ebp-4H]                      ; 360A _ 0F B6. 45, FC
        add     eax, 55                                 ; 360E _ 83. C0, 37
        jmp     ?_238                                   ; 3611 _ EB, 07

?_237:  movzx   eax, byte [ebp-4H]                      ; 3613 _ 0F B6. 45, FC
        add     eax, 48                                 ; 3617 _ 83. C0, 30
?_238:  leave                                           ; 361A _ C9
        ret                                             ; 361B _ C3
; charToHexVal End of function

charToHexStr:; Function begin
        push    ebp                                     ; 361C _ 55
        mov     ebp, esp                                ; 361D _ 89. E5
        sub     esp, 20                                 ; 361F _ 83. EC, 14
        mov     eax, dword [ebp+8H]                     ; 3622 _ 8B. 45, 08
        mov     byte [ebp-14H], al                      ; 3625 _ 88. 45, EC
        mov     dword [ebp-4H], 0                       ; 3628 _ C7. 45, FC, 00000000
        movzx   eax, byte [ebp-14H]                     ; 362F _ 0F B6. 45, EC
        and     eax, 0FH                                ; 3633 _ 83. E0, 0F
        mov     byte [ebp-5H], al                       ; 3636 _ 88. 45, FB
        movsx   eax, byte [ebp-5H]                      ; 3639 _ 0F BE. 45, FB
        push    eax                                     ; 363D _ 50
        call    charToHexVal                            ; 363E _ E8, FFFFFFFC(rel)
        add     esp, 4                                  ; 3643 _ 83. C4, 04
        mov     byte [?_451], al                        ; 3646 _ A2, 00000153(d)
        movzx   eax, byte [ebp-14H]                     ; 364B _ 0F B6. 45, EC
        shr     al, 4                                   ; 364F _ C0. E8, 04
        mov     byte [ebp-14H], al                      ; 3652 _ 88. 45, EC
        movzx   eax, byte [ebp-14H]                     ; 3655 _ 0F B6. 45, EC
        movsx   eax, al                                 ; 3659 _ 0F BE. C0
        push    eax                                     ; 365C _ 50
        call    charToHexVal                            ; 365D _ E8, FFFFFFFC(rel)
        add     esp, 4                                  ; 3662 _ 83. C4, 04
        mov     byte [?_450], al                        ; 3665 _ A2, 00000152(d)
        mov     eax, keyval                             ; 366A _ B8, 00000150(d)
        leave                                           ; 366F _ C9
        ret                                             ; 3670 _ C3
; charToHexStr End of function

intToHexStr:; Function begin
        push    ebp                                     ; 3671 _ 55
        mov     ebp, esp                                ; 3672 _ 89. E5
        sub     esp, 16                                 ; 3674 _ 83. EC, 10
        mov     byte [str.2261], 48                     ; 3677 _ C6. 05, 000003B4(d), 30
        mov     byte [?_456], 88                        ; 367E _ C6. 05, 000003B5(d), 58
        mov     byte [?_457], 0                         ; 3685 _ C6. 05, 000003BE(d), 00
        mov     dword [ebp-4H], 2                       ; 368C _ C7. 45, FC, 00000002
        jmp     ?_240                                   ; 3693 _ EB, 0F

?_239:  mov     eax, dword [ebp-4H]                     ; 3695 _ 8B. 45, FC
        add     eax, str.2261                           ; 3698 _ 05, 000003B4(d)
        mov     byte [eax], 48                          ; 369D _ C6. 00, 30
        add     dword [ebp-4H], 1                       ; 36A0 _ 83. 45, FC, 01
?_240:  cmp     dword [ebp-4H], 9                       ; 36A4 _ 83. 7D, FC, 09
        jle near      ?_239                                   ; 36a8 _ 7e, eb
        mov     dword [ebp-8H], 9                       ; 36AA _ C7. 45, F8, 00000009
        jmp     ?_244                                   ; 36B1 _ EB, 42

?_241:  mov     eax, dword [ebp+8H]                     ; 36B3 _ 8B. 45, 08
        and     eax, 0FH                                ; 36B6 _ 83. E0, 0F
        mov     dword [ebp-0CH], eax                    ; 36B9 _ 89. 45, F4
        mov     eax, dword [ebp+8H]                     ; 36BC _ 8B. 45, 08
        shr     eax, 4                                  ; 36BF _ C1. E8, 04
        mov     dword [ebp+8H], eax                     ; 36C2 _ 89. 45, 08
        cmp     dword [ebp-0CH], 9                      ; 36C5 _ 83. 7D, F4, 09
        jle near      ?_242                                   ; 36c9 _ 7e, 14
        mov     eax, dword [ebp-0CH]                    ; 36CB _ 8B. 45, F4
        add     eax, 55                                 ; 36CE _ 83. C0, 37
        mov     edx, eax                                ; 36D1 _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 36D3 _ 8B. 45, F8
        add     eax, str.2261                           ; 36D6 _ 05, 000003B4(d)
        mov     byte [eax], dl                          ; 36DB _ 88. 10
        jmp     ?_243                                   ; 36DD _ EB, 12

?_242:  mov     eax, dword [ebp-0CH]                    ; 36DF _ 8B. 45, F4
        add     eax, 48                                 ; 36E2 _ 83. C0, 30
        mov     edx, eax                                ; 36E5 _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 36E7 _ 8B. 45, F8
        add     eax, str.2261                           ; 36EA _ 05, 000003B4(d)
        mov     byte [eax], dl                          ; 36EF _ 88. 10
?_243:  sub     dword [ebp-8H], 1                       ; 36F1 _ 83. 6D, F8, 01
?_244:  cmp     dword [ebp-8H], 1                       ; 36F5 _ 83. 7D, F8, 01
        jle near      ?_245                                   ; 36f9 _ 7e, 06
        cmp     dword [ebp+8H], 0                       ; 36FB _ 83. 7D, 08, 00
        jnz near      ?_241                                   ; 36ff _ 75, b2
?_245:  mov     eax, str.2261                           ; 3701 _ B8, 000003B4(d)
        leave                                           ; 3706 _ C9
        ret                                             ; 3707 _ C3
; intToHexStr End of function

wait_KBC_sendready:; Function begin
        push    ebp                                     ; 3708 _ 55
        mov     ebp, esp                                ; 3709 _ 89. E5
        sub     esp, 8                                  ; 370B _ 83. EC, 08
?_246:  sub     esp, 12                                 ; 370E _ 83. EC, 0C
        push    100                                     ; 3711 _ 6A, 64
        call    io_in8                                  ; 3713 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 3718 _ 83. C4, 10
        and     eax, 02H                                ; 371B _ 83. E0, 02
        test    eax, eax                                ; 371E _ 85. C0
        jnz near      ?_247                                   ; 3720 _ 75, 02
        jmp     ?_248                                   ; 3722 _ EB, 02

?_247:  jmp     ?_246                                   ; 3724 _ EB, E8

?_248:  leave                                           ; 3726 _ C9
        ret                                             ; 3727 _ C3
; wait_KBC_sendready End of function

init_keyboard:; Function begin
        push    ebp                                     ; 3728 _ 55
        mov     ebp, esp                                ; 3729 _ 89. E5
        sub     esp, 8                                  ; 372B _ 83. EC, 08
        call    wait_KBC_sendready                      ; 372E _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 3733 _ 83. EC, 08
        push    96                                      ; 3736 _ 6A, 60
        push    100                                     ; 3738 _ 6A, 64
        call    io_out8                                 ; 373A _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 373F _ 83. C4, 10
        call    wait_KBC_sendready                      ; 3742 _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 3747 _ 83. EC, 08
        push    71                                      ; 374A _ 6A, 47
        push    96                                      ; 374C _ 6A, 60
        call    io_out8                                 ; 374E _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 3753 _ 83. C4, 10
        nop                                             ; 3756 _ 90
        leave                                           ; 3757 _ C9
        ret                                             ; 3758 _ C3
; init_keyboard End of function

enable_mouse:; Function begin
        push    ebp                                     ; 3759 _ 55
        mov     ebp, esp                                ; 375A _ 89. E5
        sub     esp, 8                                  ; 375C _ 83. EC, 08
        call    wait_KBC_sendready                      ; 375F _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 3764 _ 83. EC, 08
        push    212                                     ; 3767 _ 68, 000000D4
        push    100                                     ; 376C _ 6A, 64
        call    io_out8                                 ; 376E _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 3773 _ 83. C4, 10
        call    wait_KBC_sendready                      ; 3776 _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 377B _ 83. EC, 08
        push    244                                     ; 377E _ 68, 000000F4
        push    96                                      ; 3783 _ 6A, 60
        call    io_out8                                 ; 3785 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 378A _ 83. C4, 10
        mov     eax, dword [ebp+8H]                     ; 378D _ 8B. 45, 08
        mov     byte [eax+3H], 0                        ; 3790 _ C6. 40, 03, 00
        nop                                             ; 3794 _ 90
        leave                                           ; 3795 _ C9
        ret                                             ; 3796 _ C3
; enable_mouse End of function

intHandlerForMouse:; Function begin
        push    ebp                                     ; 3797 _ 55
        mov     ebp, esp                                ; 3798 _ 89. E5
        sub     esp, 24                                 ; 379A _ 83. EC, 18
        sub     esp, 8                                  ; 379D _ 83. EC, 08
        push    32                                      ; 37A0 _ 6A, 20
        push    160                                     ; 37A2 _ 68, 000000A0
        call    io_out8                                 ; 37A7 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 37AC _ 83. C4, 10
        sub     esp, 8                                  ; 37AF _ 83. EC, 08
        push    32                                      ; 37B2 _ 6A, 20
        push    32                                      ; 37B4 _ 6A, 20
        call    io_out8                                 ; 37B6 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 37BB _ 83. C4, 10
        sub     esp, 12                                 ; 37BE _ 83. EC, 0C
        push    96                                      ; 37C1 _ 6A, 60
        call    io_in8                                  ; 37C3 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 37C8 _ 83. C4, 10
        mov     byte [ebp-9H], al                       ; 37CB _ 88. 45, F7
        movzx   eax, byte [ebp-9H]                      ; 37CE _ 0F B6. 45, F7
        sub     esp, 8                                  ; 37D2 _ 83. EC, 08
        push    eax                                     ; 37D5 _ 50
        push    mouseinfo                               ; 37D6 _ 68, 00000038(d)
        call    fifo8_put                               ; 37DB _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 37E0 _ 83. C4, 10
        leave                                           ; 37E3 _ C9
        ret                                             ; 37E4 _ C3
; intHandlerForMouse End of function

mouse_decode:; Function begin
        push    ebp                                     ; 37E5 _ 55
        mov     ebp, esp                                ; 37E6 _ 89. E5
        sub     esp, 4                                  ; 37E8 _ 83. EC, 04
        mov     eax, dword [ebp+0CH]                    ; 37EB _ 8B. 45, 0C
        mov     byte [ebp-4H], al                       ; 37EE _ 88. 45, FC
        mov     eax, dword [ebp+8H]                     ; 37F1 _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 37F4 _ 0F B6. 40, 03
        test    al, al                                  ; 37F8 _ 84. C0
        jnz near      ?_250                                   ; 37fa _ 75, 17
        cmp     byte [ebp-4H], -6                       ; 37FC _ 80. 7D, FC, FA
        jnz near      ?_249                                   ; 3800 _ 75, 07
        mov     eax, dword [ebp+8H]                     ; 3802 _ 8B. 45, 08
        mov     byte [eax+3H], 1                        ; 3805 _ C6. 40, 03, 01
?_249:  mov     eax, 0                                  ; 3809 _ B8, 00000000
        jmp     ?_257                                   ; 380E _ E9, 0000010F

?_250:  mov     eax, dword [ebp+8H]                     ; 3813 _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 3816 _ 0F B6. 40, 03
        cmp     al, 1                                   ; 381A _ 3C, 01
        jnz near      ?_252                                   ; 381c _ 75, 28
        movzx   eax, byte [ebp-4H]                      ; 381E _ 0F B6. 45, FC
        and     eax, 0C8H                               ; 3822 _ 25, 000000C8
        cmp     eax, 8                                  ; 3827 _ 83. F8, 08
        jnz near      ?_251                                   ; 382a _ 75, 10
        mov     eax, dword [ebp+8H]                     ; 382C _ 8B. 45, 08
        movzx   edx, byte [ebp-4H]                      ; 382F _ 0F B6. 55, FC
        mov     byte [eax], dl                          ; 3833 _ 88. 10
        mov     eax, dword [ebp+8H]                     ; 3835 _ 8B. 45, 08
        mov     byte [eax+3H], 2                        ; 3838 _ C6. 40, 03, 02
?_251:  mov     eax, 0                                  ; 383C _ B8, 00000000
        jmp     ?_257                                   ; 3841 _ E9, 000000DC

?_252:  mov     eax, dword [ebp+8H]                     ; 3846 _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 3849 _ 0F B6. 40, 03
        cmp     al, 2                                   ; 384D _ 3C, 02
        jnz near      ?_253                                   ; 384f _ 75, 1b
        mov     eax, dword [ebp+8H]                     ; 3851 _ 8B. 45, 08
        movzx   edx, byte [ebp-4H]                      ; 3854 _ 0F B6. 55, FC
        mov     byte [eax+1H], dl                       ; 3858 _ 88. 50, 01
        mov     eax, dword [ebp+8H]                     ; 385B _ 8B. 45, 08
        mov     byte [eax+3H], 3                        ; 385E _ C6. 40, 03, 03
        mov     eax, 0                                  ; 3862 _ B8, 00000000
        jmp     ?_257                                   ; 3867 _ E9, 000000B6

?_253:  mov     eax, dword [ebp+8H]                     ; 386C _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 386F _ 0F B6. 40, 03
        cmp     al, 3                                   ; 3873 _ 3C, 03
        jne near      ?_256                                   ; 3875 _ 0f 85, 000000a2
        mov     eax, dword [ebp+8H]                     ; 387B _ 8B. 45, 08
        movzx   edx, byte [ebp-4H]                      ; 387E _ 0F B6. 55, FC
        mov     byte [eax+2H], dl                       ; 3882 _ 88. 50, 02
        mov     eax, dword [ebp+8H]                     ; 3885 _ 8B. 45, 08
        mov     byte [eax+3H], 1                        ; 3888 _ C6. 40, 03, 01
        mov     eax, dword [ebp+8H]                     ; 388C _ 8B. 45, 08
        movzx   eax, byte [eax]                         ; 388F _ 0F B6. 00
        movzx   eax, al                                 ; 3892 _ 0F B6. C0
        and     eax, 07H                                ; 3895 _ 83. E0, 07
        mov     edx, eax                                ; 3898 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 389A _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 389D _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 38A0 _ 8B. 45, 08
        movzx   eax, byte [eax+1H]                      ; 38A3 _ 0F B6. 40, 01
        movzx   edx, al                                 ; 38A7 _ 0F B6. D0
        mov     eax, dword [ebp+8H]                     ; 38AA _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 38AD _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 38B0 _ 8B. 45, 08
        movzx   eax, byte [eax+2H]                      ; 38B3 _ 0F B6. 40, 02
        movzx   edx, al                                 ; 38B7 _ 0F B6. D0
        mov     eax, dword [ebp+8H]                     ; 38BA _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 38BD _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 38C0 _ 8B. 45, 08
        movzx   eax, byte [eax]                         ; 38C3 _ 0F B6. 00
        movzx   eax, al                                 ; 38C6 _ 0F B6. C0
        and     eax, 10H                                ; 38C9 _ 83. E0, 10
        test    eax, eax                                ; 38CC _ 85. C0
        jz near       ?_254                                   ; 38ce _ 74, 13
        mov     eax, dword [ebp+8H]                     ; 38D0 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 38D3 _ 8B. 40, 04
        or      eax, 0FFFFFF00H                         ; 38D6 _ 0D, FFFFFF00
        mov     edx, eax                                ; 38DB _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 38DD _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 38E0 _ 89. 50, 04
?_254:  mov     eax, dword [ebp+8H]                     ; 38E3 _ 8B. 45, 08
        movzx   eax, byte [eax]                         ; 38E6 _ 0F B6. 00
        movzx   eax, al                                 ; 38E9 _ 0F B6. C0
        and     eax, 20H                                ; 38EC _ 83. E0, 20
        test    eax, eax                                ; 38EF _ 85. C0
        jz near       ?_255                                   ; 38f1 _ 74, 13
        mov     eax, dword [ebp+8H]                     ; 38F3 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 38F6 _ 8B. 40, 08
        or      eax, 0FFFFFF00H                         ; 38F9 _ 0D, FFFFFF00
        mov     edx, eax                                ; 38FE _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 3900 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 3903 _ 89. 50, 08
?_255:  mov     eax, dword [ebp+8H]                     ; 3906 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 3909 _ 8B. 40, 08
        neg     eax                                     ; 390C _ F7. D8
        mov     edx, eax                                ; 390E _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 3910 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 3913 _ 89. 50, 08
        mov     eax, 1                                  ; 3916 _ B8, 00000001
        jmp     ?_257                                   ; 391B _ EB, 05

?_256:  mov     eax, 4294967295                         ; 391D _ B8, FFFFFFFF
?_257:  leave                                           ; 3922 _ C9
        ret                                             ; 3923 _ C3
; mouse_decode End of function

showMemoryInfo:; Function begin
        push    ebp                                     ; 3924 _ 55
        mov     ebp, esp                                ; 3925 _ 89. E5
        sub     esp, 40                                 ; 3927 _ 83. EC, 28
        mov     dword [ebp-0CH], 0                      ; 392A _ C7. 45, F4, 00000000
        mov     dword [ebp-10H], 0                      ; 3931 _ C7. 45, F0, 00000000
        mov     dword [ebp-14H], 104                    ; 3938 _ C7. 45, EC, 00000068
        mov     dword [ebp-18H], 80                     ; 393F _ C7. 45, E8, 00000050
        mov     edx, dword [ysize]                      ; 3946 _ 8B. 15, 00000140(d)
        mov     eax, dword [ebp+0CH]                    ; 394C _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 394F _ 8B. 00
        sub     esp, 4                                  ; 3951 _ 83. EC, 04
        push    edx                                     ; 3954 _ 52
        push    dword [ebp+1CH]                         ; 3955 _ FF. 75, 1C
        push    eax                                     ; 3958 _ 50
        call    init_screen8                            ; 3959 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 395E _ 83. C4, 10
        mov     eax, dword [ebp+20H]                    ; 3961 _ 8B. 45, 20
        movsx   eax, al                                 ; 3964 _ 0F BE. C0
        sub     esp, 8                                  ; 3967 _ 83. EC, 08
        push    ?_441                                   ; 396A _ 68, 00000070(d)
        push    eax                                     ; 396F _ 50
        push    dword [ebp-10H]                         ; 3970 _ FF. 75, F0
        push    dword [ebp-0CH]                         ; 3973 _ FF. 75, F4
        push    dword [ebp+0CH]                         ; 3976 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 3979 _ FF. 75, 08
        call    showString                              ; 397C _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 3981 _ 83. C4, 20
        mov     eax, dword [ebp+18H]                    ; 3984 _ 8B. 45, 18
        sub     esp, 12                                 ; 3987 _ 83. EC, 0C
        push    eax                                     ; 398A _ 50
        call    intToHexStr                             ; 398B _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 3990 _ 83. C4, 10
        mov     dword [ebp-1CH], eax                    ; 3993 _ 89. 45, E4
        mov     eax, dword [ebp+20H]                    ; 3996 _ 8B. 45, 20
        movsx   eax, al                                 ; 3999 _ 0F BE. C0
        sub     esp, 8                                  ; 399C _ 83. EC, 08
        push    dword [ebp-1CH]                         ; 399F _ FF. 75, E4
        push    eax                                     ; 39A2 _ 50
        push    dword [ebp-10H]                         ; 39A3 _ FF. 75, F0
        push    dword [ebp-14H]                         ; 39A6 _ FF. 75, EC
        push    dword [ebp+0CH]                         ; 39A9 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 39AC _ FF. 75, 08
        call    showString                              ; 39AF _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 39B4 _ 83. C4, 20
        add     dword [ebp-10H], 16                     ; 39B7 _ 83. 45, F0, 10
        mov     eax, dword [ebp+20H]                    ; 39BB _ 8B. 45, 20
        movsx   eax, al                                 ; 39BE _ 0F BE. C0
        sub     esp, 8                                  ; 39C1 _ 83. EC, 08
        push    ?_442                                   ; 39C4 _ 68, 0000007A(d)
        push    eax                                     ; 39C9 _ 50
        push    dword [ebp-10H]                         ; 39CA _ FF. 75, F0
        push    dword [ebp-0CH]                         ; 39CD _ FF. 75, F4
        push    dword [ebp+0CH]                         ; 39D0 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 39D3 _ FF. 75, 08
        call    showString                              ; 39D6 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 39DB _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 39DE _ 8B. 45, 10
        mov     eax, dword [eax]                        ; 39E1 _ 8B. 00
        sub     esp, 12                                 ; 39E3 _ 83. EC, 0C
        push    eax                                     ; 39E6 _ 50
        call    intToHexStr                             ; 39E7 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 39EC _ 83. C4, 10
        mov     dword [ebp-20H], eax                    ; 39EF _ 89. 45, E0
        mov     eax, dword [ebp+20H]                    ; 39F2 _ 8B. 45, 20
        movsx   eax, al                                 ; 39F5 _ 0F BE. C0
        sub     esp, 8                                  ; 39F8 _ 83. EC, 08
        push    dword [ebp-20H]                         ; 39FB _ FF. 75, E0
        push    eax                                     ; 39FE _ 50
        push    dword [ebp-10H]                         ; 39FF _ FF. 75, F0
        push    dword [ebp-14H]                         ; 3A02 _ FF. 75, EC
        push    dword [ebp+0CH]                         ; 3A05 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 3A08 _ FF. 75, 08
        call    showString                              ; 3A0B _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 3A10 _ 83. C4, 20
        add     dword [ebp-10H], 16                     ; 3A13 _ 83. 45, F0, 10
        mov     eax, dword [ebp+20H]                    ; 3A17 _ 8B. 45, 20
        movsx   eax, al                                 ; 3A1A _ 0F BE. C0
        sub     esp, 8                                  ; 3A1D _ 83. EC, 08
        push    ?_443                                   ; 3A20 _ 68, 00000086(d)
        push    eax                                     ; 3A25 _ 50
        push    dword [ebp-10H]                         ; 3A26 _ FF. 75, F0
        push    dword [ebp-0CH]                         ; 3A29 _ FF. 75, F4
        push    dword [ebp+0CH]                         ; 3A2C _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 3A2F _ FF. 75, 08
        call    showString                              ; 3A32 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 3A37 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 3A3A _ 8B. 45, 10
        mov     eax, dword [eax+4H]                     ; 3A3D _ 8B. 40, 04
        sub     esp, 12                                 ; 3A40 _ 83. EC, 0C
        push    eax                                     ; 3A43 _ 50
        call    intToHexStr                             ; 3A44 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 3A49 _ 83. C4, 10
        mov     dword [ebp-24H], eax                    ; 3A4C _ 89. 45, DC
        mov     eax, dword [ebp+20H]                    ; 3A4F _ 8B. 45, 20
        movsx   eax, al                                 ; 3A52 _ 0F BE. C0
        sub     esp, 8                                  ; 3A55 _ 83. EC, 08
        push    dword [ebp-24H]                         ; 3A58 _ FF. 75, DC
        push    eax                                     ; 3A5B _ 50
        push    dword [ebp-10H]                         ; 3A5C _ FF. 75, F0
        push    dword [ebp-14H]                         ; 3A5F _ FF. 75, EC
        push    dword [ebp+0CH]                         ; 3A62 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 3A65 _ FF. 75, 08
        call    showString                              ; 3A68 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 3A6D _ 83. C4, 20
        add     dword [ebp-10H], 16                     ; 3A70 _ 83. 45, F0, 10
        mov     eax, dword [ebp+20H]                    ; 3A74 _ 8B. 45, 20
        movsx   eax, al                                 ; 3A77 _ 0F BE. C0
        sub     esp, 8                                  ; 3A7A _ 83. EC, 08
        push    ?_444                                   ; 3A7D _ 68, 00000092(d)
        push    eax                                     ; 3A82 _ 50
        push    dword [ebp-10H]                         ; 3A83 _ FF. 75, F0
        push    dword [ebp-0CH]                         ; 3A86 _ FF. 75, F4
        push    dword [ebp+0CH]                         ; 3A89 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 3A8C _ FF. 75, 08
        call    showString                              ; 3A8F _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 3A94 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 3A97 _ 8B. 45, 10
        mov     eax, dword [eax+8H]                     ; 3A9A _ 8B. 40, 08
        sub     esp, 12                                 ; 3A9D _ 83. EC, 0C
        push    eax                                     ; 3AA0 _ 50
        call    intToHexStr                             ; 3AA1 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 3AA6 _ 83. C4, 10
        mov     dword [ebp-28H], eax                    ; 3AA9 _ 89. 45, D8
        mov     eax, dword [ebp+20H]                    ; 3AAC _ 8B. 45, 20
        movsx   eax, al                                 ; 3AAF _ 0F BE. C0
        sub     esp, 8                                  ; 3AB2 _ 83. EC, 08
        push    dword [ebp-28H]                         ; 3AB5 _ FF. 75, D8
        push    eax                                     ; 3AB8 _ 50
        push    dword [ebp-10H]                         ; 3AB9 _ FF. 75, F0
        push    dword [ebp-14H]                         ; 3ABC _ FF. 75, EC
        push    dword [ebp+0CH]                         ; 3ABF _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 3AC2 _ FF. 75, 08
        call    showString                              ; 3AC5 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 3ACA _ 83. C4, 20
        leave                                           ; 3ACD _ C9
        ret                                             ; 3ACE _ C3
; showMemoryInfo End of function

message_box:; Function begin
        push    ebp                                     ; 3ACF _ 55
        mov     ebp, esp                                ; 3AD0 _ 89. E5
        sub     esp, 24                                 ; 3AD2 _ 83. EC, 18
        sub     esp, 12                                 ; 3AD5 _ 83. EC, 0C
        push    dword [ebp+8H]                          ; 3AD8 _ FF. 75, 08
        call    sheet_alloc                             ; 3ADB _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 3AE0 _ 83. C4, 10
        mov     dword [ebp-0CH], eax                    ; 3AE3 _ 89. 45, F4
        mov     eax, dword [memman]                     ; 3AE6 _ A1, 00000000(d)
        sub     esp, 8                                  ; 3AEB _ 83. EC, 08
        push    10880                                   ; 3AEE _ 68, 00002A80
        push    eax                                     ; 3AF3 _ 50
        call    memman_alloc_4k                         ; 3AF4 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 3AF9 _ 83. C4, 10
        mov     dword [ebp-10H], eax                    ; 3AFC _ 89. 45, F0
        sub     esp, 12                                 ; 3AFF _ 83. EC, 0C
        push    -1                                      ; 3B02 _ 6A, FF
        push    68                                      ; 3B04 _ 6A, 44
        push    160                                     ; 3B06 _ 68, 000000A0
        push    dword [ebp-10H]                         ; 3B0B _ FF. 75, F0
        push    dword [ebp-0CH]                         ; 3B0E _ FF. 75, F4
        call    sheet_setbuf                            ; 3B11 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 3B16 _ 83. C4, 20
        push    1                                       ; 3B19 _ 6A, 01
        push    dword [ebp+0CH]                         ; 3B1B _ FF. 75, 0C
        push    dword [ebp-0CH]                         ; 3B1E _ FF. 75, F4
        push    dword [ebp+8H]                          ; 3B21 _ FF. 75, 08
        call    make_window8                            ; 3B24 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 3B29 _ 83. C4, 10
        sub     esp, 8                                  ; 3B2C _ 83. EC, 08
        push    7                                       ; 3B2F _ 6A, 07
        push    16                                      ; 3B31 _ 6A, 10
        push    144                                     ; 3B33 _ 68, 00000090
        push    28                                      ; 3B38 _ 6A, 1C
        push    8                                       ; 3B3A _ 6A, 08
        push    dword [ebp-0CH]                         ; 3B3C _ FF. 75, F4
        call    make_textbox8                           ; 3B3F _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 3B44 _ 83. C4, 20
        push    172                                     ; 3B47 _ 68, 000000AC
        push    260                                     ; 3B4C _ 68, 00000104
        push    dword [ebp-0CH]                         ; 3B51 _ FF. 75, F4
        push    dword [ebp+8H]                          ; 3B54 _ FF. 75, 08
        call    sheet_slide                             ; 3B57 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 3B5C _ 83. C4, 10
        sub     esp, 4                                  ; 3B5F _ 83. EC, 04
        push    2                                       ; 3B62 _ 6A, 02
        push    dword [ebp-0CH]                         ; 3B64 _ FF. 75, F4
        push    dword [ebp+8H]                          ; 3B67 _ FF. 75, 08
        call    sheet_updown                            ; 3B6A _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 3B6F _ 83. C4, 10
        mov     eax, dword [ebp-0CH]                    ; 3B72 _ 8B. 45, F4
        leave                                           ; 3B75 _ C9
        ret                                             ; 3B76 _ C3
; message_box End of function

make_window8:; Function begin
        push    ebp                                     ; 3B77 _ 55
        mov     ebp, esp                                ; 3B78 _ 89. E5
        push    ebx                                     ; 3B7A _ 53
        sub     esp, 36                                 ; 3B7B _ 83. EC, 24
        mov     eax, dword [ebp+14H]                    ; 3B7E _ 8B. 45, 14
        mov     byte [ebp-1CH], al                      ; 3B81 _ 88. 45, E4
        mov     eax, dword [ebp+0CH]                    ; 3B84 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 3B87 _ 8B. 40, 04
        mov     dword [ebp-0CH], eax                    ; 3B8A _ 89. 45, F4
        mov     eax, dword [ebp+0CH]                    ; 3B8D _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 3B90 _ 8B. 40, 08
        mov     dword [ebp-10H], eax                    ; 3B93 _ 89. 45, F0
        mov     eax, dword [ebp-0CH]                    ; 3B96 _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 3B99 _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 3B9C _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 3B9F _ 8B. 00
        push    0                                       ; 3BA1 _ 6A, 00
        push    edx                                     ; 3BA3 _ 52
        push    0                                       ; 3BA4 _ 6A, 00
        push    0                                       ; 3BA6 _ 6A, 00
        push    8                                       ; 3BA8 _ 6A, 08
        push    dword [ebp-0CH]                         ; 3BAA _ FF. 75, F4
        push    eax                                     ; 3BAD _ 50
        call    boxfill8                                ; 3BAE _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 3BB3 _ 83. C4, 1C
        mov     eax, dword [ebp-0CH]                    ; 3BB6 _ 8B. 45, F4
        lea     edx, [eax-2H]                           ; 3BB9 _ 8D. 50, FE
        mov     eax, dword [ebp+0CH]                    ; 3BBC _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 3BBF _ 8B. 00
        push    1                                       ; 3BC1 _ 6A, 01
        push    edx                                     ; 3BC3 _ 52
        push    1                                       ; 3BC4 _ 6A, 01
        push    1                                       ; 3BC6 _ 6A, 01
        push    7                                       ; 3BC8 _ 6A, 07
        push    dword [ebp-0CH]                         ; 3BCA _ FF. 75, F4
        push    eax                                     ; 3BCD _ 50
        call    boxfill8                                ; 3BCE _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 3BD3 _ 83. C4, 1C
        mov     eax, dword [ebp-10H]                    ; 3BD6 _ 8B. 45, F0
        lea     edx, [eax-1H]                           ; 3BD9 _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 3BDC _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 3BDF _ 8B. 00
        push    edx                                     ; 3BE1 _ 52
        push    0                                       ; 3BE2 _ 6A, 00
        push    0                                       ; 3BE4 _ 6A, 00
        push    0                                       ; 3BE6 _ 6A, 00
        push    8                                       ; 3BE8 _ 6A, 08
        push    dword [ebp-0CH]                         ; 3BEA _ FF. 75, F4
        push    eax                                     ; 3BED _ 50
        call    boxfill8                                ; 3BEE _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 3BF3 _ 83. C4, 1C
        mov     eax, dword [ebp-10H]                    ; 3BF6 _ 8B. 45, F0
        lea     edx, [eax-1H]                           ; 3BF9 _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 3BFC _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 3BFF _ 8B. 00
        push    edx                                     ; 3C01 _ 52
        push    1                                       ; 3C02 _ 6A, 01
        push    1                                       ; 3C04 _ 6A, 01
        push    1                                       ; 3C06 _ 6A, 01
        push    7                                       ; 3C08 _ 6A, 07
        push    dword [ebp-0CH]                         ; 3C0A _ FF. 75, F4
        push    eax                                     ; 3C0D _ 50
        call    boxfill8                                ; 3C0E _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 3C13 _ 83. C4, 1C
        mov     eax, dword [ebp-10H]                    ; 3C16 _ 8B. 45, F0
        lea     ebx, [eax-2H]                           ; 3C19 _ 8D. 58, FE
        mov     eax, dword [ebp-0CH]                    ; 3C1C _ 8B. 45, F4
        lea     ecx, [eax-2H]                           ; 3C1F _ 8D. 48, FE
        mov     eax, dword [ebp-0CH]                    ; 3C22 _ 8B. 45, F4
        lea     edx, [eax-2H]                           ; 3C25 _ 8D. 50, FE
        mov     eax, dword [ebp+0CH]                    ; 3C28 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 3C2B _ 8B. 00
        push    ebx                                     ; 3C2D _ 53
        push    ecx                                     ; 3C2E _ 51
        push    1                                       ; 3C2F _ 6A, 01
        push    edx                                     ; 3C31 _ 52
        push    15                                      ; 3C32 _ 6A, 0F
        push    dword [ebp-0CH]                         ; 3C34 _ FF. 75, F4
        push    eax                                     ; 3C37 _ 50
        call    boxfill8                                ; 3C38 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 3C3D _ 83. C4, 1C
        mov     eax, dword [ebp-10H]                    ; 3C40 _ 8B. 45, F0
        lea     ebx, [eax-1H]                           ; 3C43 _ 8D. 58, FF
        mov     eax, dword [ebp-0CH]                    ; 3C46 _ 8B. 45, F4
        lea     ecx, [eax-1H]                           ; 3C49 _ 8D. 48, FF
        mov     eax, dword [ebp-0CH]                    ; 3C4C _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 3C4F _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 3C52 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 3C55 _ 8B. 00
        push    ebx                                     ; 3C57 _ 53
        push    ecx                                     ; 3C58 _ 51
        push    0                                       ; 3C59 _ 6A, 00
        push    edx                                     ; 3C5B _ 52
        push    0                                       ; 3C5C _ 6A, 00
        push    dword [ebp-0CH]                         ; 3C5E _ FF. 75, F4
        push    eax                                     ; 3C61 _ 50
        call    boxfill8                                ; 3C62 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 3C67 _ 83. C4, 1C
        mov     eax, dword [ebp-10H]                    ; 3C6A _ 8B. 45, F0
        lea     ecx, [eax-3H]                           ; 3C6D _ 8D. 48, FD
        mov     eax, dword [ebp-0CH]                    ; 3C70 _ 8B. 45, F4
        lea     edx, [eax-3H]                           ; 3C73 _ 8D. 50, FD
        mov     eax, dword [ebp+0CH]                    ; 3C76 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 3C79 _ 8B. 00
        push    ecx                                     ; 3C7B _ 51
        push    edx                                     ; 3C7C _ 52
        push    2                                       ; 3C7D _ 6A, 02
        push    2                                       ; 3C7F _ 6A, 02
        push    8                                       ; 3C81 _ 6A, 08
        push    dword [ebp-0CH]                         ; 3C83 _ FF. 75, F4
        push    eax                                     ; 3C86 _ 50
        call    boxfill8                                ; 3C87 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 3C8C _ 83. C4, 1C
        mov     eax, dword [ebp-0CH]                    ; 3C8F _ 8B. 45, F4
        lea     edx, [eax-4H]                           ; 3C92 _ 8D. 50, FC
        mov     eax, dword [ebp+0CH]                    ; 3C95 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 3C98 _ 8B. 00
        push    20                                      ; 3C9A _ 6A, 14
        push    edx                                     ; 3C9C _ 52
        push    3                                       ; 3C9D _ 6A, 03
        push    3                                       ; 3C9F _ 6A, 03
        push    12                                      ; 3CA1 _ 6A, 0C
        push    dword [ebp-0CH]                         ; 3CA3 _ FF. 75, F4
        push    eax                                     ; 3CA6 _ 50
        call    boxfill8                                ; 3CA7 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 3CAC _ 83. C4, 1C
        mov     eax, dword [ebp-10H]                    ; 3CAF _ 8B. 45, F0
        lea     ebx, [eax-2H]                           ; 3CB2 _ 8D. 58, FE
        mov     eax, dword [ebp-0CH]                    ; 3CB5 _ 8B. 45, F4
        lea     ecx, [eax-2H]                           ; 3CB8 _ 8D. 48, FE
        mov     eax, dword [ebp-10H]                    ; 3CBB _ 8B. 45, F0
        lea     edx, [eax-2H]                           ; 3CBE _ 8D. 50, FE
        mov     eax, dword [ebp+0CH]                    ; 3CC1 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 3CC4 _ 8B. 00
        push    ebx                                     ; 3CC6 _ 53
        push    ecx                                     ; 3CC7 _ 51
        push    edx                                     ; 3CC8 _ 52
        push    1                                       ; 3CC9 _ 6A, 01
        push    15                                      ; 3CCB _ 6A, 0F
        push    dword [ebp-0CH]                         ; 3CCD _ FF. 75, F4
        push    eax                                     ; 3CD0 _ 50
        call    boxfill8                                ; 3CD1 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 3CD6 _ 83. C4, 1C
        mov     eax, dword [ebp-10H]                    ; 3CD9 _ 8B. 45, F0
        lea     ebx, [eax-1H]                           ; 3CDC _ 8D. 58, FF
        mov     eax, dword [ebp-0CH]                    ; 3CDF _ 8B. 45, F4
        lea     ecx, [eax-1H]                           ; 3CE2 _ 8D. 48, FF
        mov     eax, dword [ebp-10H]                    ; 3CE5 _ 8B. 45, F0
        lea     edx, [eax-1H]                           ; 3CE8 _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 3CEB _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 3CEE _ 8B. 00
        push    ebx                                     ; 3CF0 _ 53
        push    ecx                                     ; 3CF1 _ 51
        push    edx                                     ; 3CF2 _ 52
        push    0                                       ; 3CF3 _ 6A, 00
        push    0                                       ; 3CF5 _ 6A, 00
        push    dword [ebp-0CH]                         ; 3CF7 _ FF. 75, F4
        push    eax                                     ; 3CFA _ 50
        call    boxfill8                                ; 3CFB _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 3D00 _ 83. C4, 1C
        movsx   eax, byte [ebp-1CH]                     ; 3D03 _ 0F BE. 45, E4
        push    eax                                     ; 3D07 _ 50
        push    dword [ebp+10H]                         ; 3D08 _ FF. 75, 10
        push    dword [ebp+0CH]                         ; 3D0B _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 3D0E _ FF. 75, 08
        call    make_wtitle8                            ; 3D11 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 3D16 _ 83. C4, 10
        nop                                             ; 3D19 _ 90
        mov     ebx, dword [ebp-4H]                     ; 3D1A _ 8B. 5D, FC
        leave                                           ; 3D1D _ C9
        ret                                             ; 3D1E _ C3
; make_window8 End of function

make_wtitle8:; Function begin
        push    ebp                                     ; 3D1F _ 55
        mov     ebp, esp                                ; 3D20 _ 89. E5
        push    ebx                                     ; 3D22 _ 53
        sub     esp, 36                                 ; 3D23 _ 83. EC, 24
        mov     eax, dword [ebp+14H]                    ; 3D26 _ 8B. 45, 14
        mov     byte [ebp-1CH], al                      ; 3D29 _ 88. 45, E4
        cmp     byte [ebp-1CH], 0                       ; 3D2C _ 80. 7D, E4, 00
        jz near       ?_258                                   ; 3d30 _ 74, 0a
        mov     byte [ebp-12H], 7                       ; 3D32 _ C6. 45, EE, 07
        mov     byte [ebp-13H], 12                      ; 3D36 _ C6. 45, ED, 0C
        jmp     ?_259                                   ; 3D3A _ EB, 08

?_258:  mov     byte [ebp-12H], 8                       ; 3D3C _ C6. 45, EE, 08
        mov     byte [ebp-13H], 15                      ; 3D40 _ C6. 45, ED, 0F
?_259:  mov     eax, dword [ebp+0CH]                    ; 3D44 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 3D47 _ 8B. 40, 04
        lea     ebx, [eax-4H]                           ; 3D4A _ 8D. 58, FC
        movzx   eax, byte [ebp-13H]                     ; 3D4D _ 0F B6. 45, ED
        movzx   ecx, al                                 ; 3D51 _ 0F B6. C8
        mov     eax, dword [ebp+0CH]                    ; 3D54 _ 8B. 45, 0C
        mov     edx, dword [eax+4H]                     ; 3D57 _ 8B. 50, 04
        mov     eax, dword [ebp+0CH]                    ; 3D5A _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 3D5D _ 8B. 00
        push    20                                      ; 3D5F _ 6A, 14
        push    ebx                                     ; 3D61 _ 53
        push    3                                       ; 3D62 _ 6A, 03
        push    3                                       ; 3D64 _ 6A, 03
        push    ecx                                     ; 3D66 _ 51
        push    edx                                     ; 3D67 _ 52
        push    eax                                     ; 3D68 _ 50
        call    boxfill8                                ; 3D69 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 3D6E _ 83. C4, 1C
        movsx   eax, byte [ebp-12H]                     ; 3D71 _ 0F BE. 45, EE
        sub     esp, 8                                  ; 3D75 _ 83. EC, 08
        push    dword [ebp+10H]                         ; 3D78 _ FF. 75, 10
        push    eax                                     ; 3D7B _ 50
        push    4                                       ; 3D7C _ 6A, 04
        push    24                                      ; 3D7E _ 6A, 18
        push    dword [ebp+0CH]                         ; 3D80 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 3D83 _ FF. 75, 08
        call    showString                              ; 3D86 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 3D8B _ 83. C4, 20
        mov     dword [ebp-10H], 0                      ; 3D8E _ C7. 45, F0, 00000000
        jmp     ?_267                                   ; 3D95 _ E9, 00000083

?_260:  mov     dword [ebp-0CH], 0                      ; 3D9A _ C7. 45, F4, 00000000
        jmp     ?_266                                   ; 3DA1 _ EB, 70

?_261:  mov     eax, dword [ebp-10H]                    ; 3DA3 _ 8B. 45, F0
        shl     eax, 4                                  ; 3DA6 _ C1. E0, 04
        mov     edx, eax                                ; 3DA9 _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 3DAB _ 8B. 45, F4
        add     eax, edx                                ; 3DAE _ 01. D0
        add     eax, closebtn.2332                      ; 3DB0 _ 05, 000002C0(d)
        movzx   eax, byte [eax]                         ; 3DB5 _ 0F B6. 00
        mov     byte [ebp-11H], al                      ; 3DB8 _ 88. 45, EF
        cmp     byte [ebp-11H], 64                      ; 3DBB _ 80. 7D, EF, 40
        jnz near      ?_262                                   ; 3dbf _ 75, 06
        mov     byte [ebp-11H], 0                       ; 3DC1 _ C6. 45, EF, 00
        jmp     ?_265                                   ; 3DC5 _ EB, 1C

?_262:  cmp     byte [ebp-11H], 36                      ; 3DC7 _ 80. 7D, EF, 24
        jnz near      ?_263                                   ; 3dcb _ 75, 06
        mov     byte [ebp-11H], 15                      ; 3DCD _ C6. 45, EF, 0F
        jmp     ?_265                                   ; 3DD1 _ EB, 10

?_263:  cmp     byte [ebp-11H], 81                      ; 3DD3 _ 80. 7D, EF, 51
        jnz near      ?_264                                   ; 3dd7 _ 75, 06
        mov     byte [ebp-11H], 8                       ; 3DD9 _ C6. 45, EF, 08
        jmp     ?_265                                   ; 3DDD _ EB, 04

?_264:  mov     byte [ebp-11H], 7                       ; 3DDF _ C6. 45, EF, 07
?_265:  mov     eax, dword [ebp+0CH]                    ; 3DE3 _ 8B. 45, 0C
        mov     edx, dword [eax]                        ; 3DE6 _ 8B. 10
        mov     eax, dword [ebp-10H]                    ; 3DE8 _ 8B. 45, F0
        lea     ecx, [eax+5H]                           ; 3DEB _ 8D. 48, 05
        mov     eax, dword [ebp+0CH]                    ; 3DEE _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 3DF1 _ 8B. 40, 04
        imul    ecx, eax                                ; 3DF4 _ 0F AF. C8
        mov     eax, dword [ebp+0CH]                    ; 3DF7 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 3DFA _ 8B. 40, 04
        lea     ebx, [eax-15H]                          ; 3DFD _ 8D. 58, EB
        mov     eax, dword [ebp-0CH]                    ; 3E00 _ 8B. 45, F4
        add     eax, ebx                                ; 3E03 _ 01. D8
        add     eax, ecx                                ; 3E05 _ 01. C8
        add     edx, eax                                ; 3E07 _ 01. C2
        movzx   eax, byte [ebp-11H]                     ; 3E09 _ 0F B6. 45, EF
        mov     byte [edx], al                          ; 3E0D _ 88. 02
        add     dword [ebp-0CH], 1                      ; 3E0F _ 83. 45, F4, 01
?_266:  cmp     dword [ebp-0CH], 15                     ; 3E13 _ 83. 7D, F4, 0F
        jle near      ?_261                                   ; 3e17 _ 7e, 8a
        add     dword [ebp-10H], 1                      ; 3E19 _ 83. 45, F0, 01
?_267:  cmp     dword [ebp-10H], 13                     ; 3E1D _ 83. 7D, F0, 0D
        jle near      ?_260                                   ; 3e21 _ 0f 8e, ffffff73
        mov     ebx, dword [ebp-4H]                     ; 3E27 _ 8B. 5D, FC
        leave                                           ; 3E2A _ C9
        ret                                             ; 3E2B _ C3
; make_wtitle8 End of function

make_textbox8:; Function begin
        push    ebp                                     ; 3E2C _ 55
        mov     ebp, esp                                ; 3E2D _ 89. E5
        push    edi                                     ; 3E2F _ 57
        push    esi                                     ; 3E30 _ 56
        push    ebx                                     ; 3E31 _ 53
        sub     esp, 16                                 ; 3E32 _ 83. EC, 10
        mov     edx, dword [ebp+0CH]                    ; 3E35 _ 8B. 55, 0C
        mov     eax, dword [ebp+14H]                    ; 3E38 _ 8B. 45, 14
        add     eax, edx                                ; 3E3B _ 01. D0
        mov     dword [ebp-10H], eax                    ; 3E3D _ 89. 45, F0
        mov     edx, dword [ebp+10H]                    ; 3E40 _ 8B. 55, 10
        mov     eax, dword [ebp+18H]                    ; 3E43 _ 8B. 45, 18
        add     eax, edx                                ; 3E46 _ 01. D0
        mov     dword [ebp-14H], eax                    ; 3E48 _ 89. 45, EC
        mov     eax, dword [ebp+10H]                    ; 3E4B _ 8B. 45, 10
        lea     edi, [eax-3H]                           ; 3E4E _ 8D. 78, FD
        mov     eax, dword [ebp-10H]                    ; 3E51 _ 8B. 45, F0
        lea     esi, [eax+1H]                           ; 3E54 _ 8D. 70, 01
        mov     eax, dword [ebp+10H]                    ; 3E57 _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 3E5A _ 8D. 58, FD
        mov     eax, dword [ebp+0CH]                    ; 3E5D _ 8B. 45, 0C
        lea     ecx, [eax-2H]                           ; 3E60 _ 8D. 48, FE
        mov     eax, dword [ebp+8H]                     ; 3E63 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 3E66 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 3E69 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 3E6C _ 8B. 00
        push    edi                                     ; 3E6E _ 57
        push    esi                                     ; 3E6F _ 56
        push    ebx                                     ; 3E70 _ 53
        push    ecx                                     ; 3E71 _ 51
        push    15                                      ; 3E72 _ 6A, 0F
        push    edx                                     ; 3E74 _ 52
        push    eax                                     ; 3E75 _ 50
        call    boxfill8                                ; 3E76 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 3E7B _ 83. C4, 1C
        mov     eax, dword [ebp-14H]                    ; 3E7E _ 8B. 45, EC
        lea     edi, [eax+1H]                           ; 3E81 _ 8D. 78, 01
        mov     eax, dword [ebp+0CH]                    ; 3E84 _ 8B. 45, 0C
        lea     esi, [eax-3H]                           ; 3E87 _ 8D. 70, FD
        mov     eax, dword [ebp+10H]                    ; 3E8A _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 3E8D _ 8D. 58, FD
        mov     eax, dword [ebp+0CH]                    ; 3E90 _ 8B. 45, 0C
        lea     ecx, [eax-3H]                           ; 3E93 _ 8D. 48, FD
        mov     eax, dword [ebp+8H]                     ; 3E96 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 3E99 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 3E9C _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 3E9F _ 8B. 00
        push    edi                                     ; 3EA1 _ 57
        push    esi                                     ; 3EA2 _ 56
        push    ebx                                     ; 3EA3 _ 53
        push    ecx                                     ; 3EA4 _ 51
        push    15                                      ; 3EA5 _ 6A, 0F
        push    edx                                     ; 3EA7 _ 52
        push    eax                                     ; 3EA8 _ 50
        call    boxfill8                                ; 3EA9 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 3EAE _ 83. C4, 1C
        mov     eax, dword [ebp-14H]                    ; 3EB1 _ 8B. 45, EC
        lea     edi, [eax+2H]                           ; 3EB4 _ 8D. 78, 02
        mov     eax, dword [ebp-10H]                    ; 3EB7 _ 8B. 45, F0
        lea     esi, [eax+1H]                           ; 3EBA _ 8D. 70, 01
        mov     eax, dword [ebp-14H]                    ; 3EBD _ 8B. 45, EC
        lea     ebx, [eax+2H]                           ; 3EC0 _ 8D. 58, 02
        mov     eax, dword [ebp+0CH]                    ; 3EC3 _ 8B. 45, 0C
        lea     ecx, [eax-3H]                           ; 3EC6 _ 8D. 48, FD
        mov     eax, dword [ebp+8H]                     ; 3EC9 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 3ECC _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 3ECF _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 3ED2 _ 8B. 00
        push    edi                                     ; 3ED4 _ 57
        push    esi                                     ; 3ED5 _ 56
        push    ebx                                     ; 3ED6 _ 53
        push    ecx                                     ; 3ED7 _ 51
        push    7                                       ; 3ED8 _ 6A, 07
        push    edx                                     ; 3EDA _ 52
        push    eax                                     ; 3EDB _ 50
        call    boxfill8                                ; 3EDC _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 3EE1 _ 83. C4, 1C
        mov     eax, dword [ebp-14H]                    ; 3EE4 _ 8B. 45, EC
        lea     edi, [eax+2H]                           ; 3EE7 _ 8D. 78, 02
        mov     eax, dword [ebp-10H]                    ; 3EEA _ 8B. 45, F0
        lea     esi, [eax+2H]                           ; 3EED _ 8D. 70, 02
        mov     eax, dword [ebp+10H]                    ; 3EF0 _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 3EF3 _ 8D. 58, FD
        mov     eax, dword [ebp-10H]                    ; 3EF6 _ 8B. 45, F0
        lea     ecx, [eax+2H]                           ; 3EF9 _ 8D. 48, 02
        mov     eax, dword [ebp+8H]                     ; 3EFC _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 3EFF _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 3F02 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 3F05 _ 8B. 00
        push    edi                                     ; 3F07 _ 57
        push    esi                                     ; 3F08 _ 56
        push    ebx                                     ; 3F09 _ 53
        push    ecx                                     ; 3F0A _ 51
        push    7                                       ; 3F0B _ 6A, 07
        push    edx                                     ; 3F0D _ 52
        push    eax                                     ; 3F0E _ 50
        call    boxfill8                                ; 3F0F _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 3F14 _ 83. C4, 1C
        mov     eax, dword [ebp+10H]                    ; 3F17 _ 8B. 45, 10
        lea     esi, [eax-2H]                           ; 3F1A _ 8D. 70, FE
        mov     eax, dword [ebp+10H]                    ; 3F1D _ 8B. 45, 10
        lea     ebx, [eax-2H]                           ; 3F20 _ 8D. 58, FE
        mov     eax, dword [ebp+0CH]                    ; 3F23 _ 8B. 45, 0C
        lea     ecx, [eax-1H]                           ; 3F26 _ 8D. 48, FF
        mov     eax, dword [ebp+8H]                     ; 3F29 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 3F2C _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 3F2F _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 3F32 _ 8B. 00
        push    esi                                     ; 3F34 _ 56
        push    dword [ebp-10H]                         ; 3F35 _ FF. 75, F0
        push    ebx                                     ; 3F38 _ 53
        push    ecx                                     ; 3F39 _ 51
        push    0                                       ; 3F3A _ 6A, 00
        push    edx                                     ; 3F3C _ 52
        push    eax                                     ; 3F3D _ 50
        call    boxfill8                                ; 3F3E _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 3F43 _ 83. C4, 1C
        mov     eax, dword [ebp+0CH]                    ; 3F46 _ 8B. 45, 0C
        lea     esi, [eax-2H]                           ; 3F49 _ 8D. 70, FE
        mov     eax, dword [ebp+10H]                    ; 3F4C _ 8B. 45, 10
        lea     ebx, [eax-2H]                           ; 3F4F _ 8D. 58, FE
        mov     eax, dword [ebp+0CH]                    ; 3F52 _ 8B. 45, 0C
        lea     ecx, [eax-2H]                           ; 3F55 _ 8D. 48, FE
        mov     eax, dword [ebp+8H]                     ; 3F58 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 3F5B _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 3F5E _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 3F61 _ 8B. 00
        push    dword [ebp-14H]                         ; 3F63 _ FF. 75, EC
        push    esi                                     ; 3F66 _ 56
        push    ebx                                     ; 3F67 _ 53
        push    ecx                                     ; 3F68 _ 51
        push    0                                       ; 3F69 _ 6A, 00
        push    edx                                     ; 3F6B _ 52
        push    eax                                     ; 3F6C _ 50
        call    boxfill8                                ; 3F6D _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 3F72 _ 83. C4, 1C
        mov     eax, dword [ebp-14H]                    ; 3F75 _ 8B. 45, EC
        lea     esi, [eax+1H]                           ; 3F78 _ 8D. 70, 01
        mov     eax, dword [ebp-14H]                    ; 3F7B _ 8B. 45, EC
        lea     ebx, [eax+1H]                           ; 3F7E _ 8D. 58, 01
        mov     eax, dword [ebp+0CH]                    ; 3F81 _ 8B. 45, 0C
        lea     ecx, [eax-2H]                           ; 3F84 _ 8D. 48, FE
        mov     eax, dword [ebp+8H]                     ; 3F87 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 3F8A _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 3F8D _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 3F90 _ 8B. 00
        push    esi                                     ; 3F92 _ 56
        push    dword [ebp-10H]                         ; 3F93 _ FF. 75, F0
        push    ebx                                     ; 3F96 _ 53
        push    ecx                                     ; 3F97 _ 51
        push    8                                       ; 3F98 _ 6A, 08
        push    edx                                     ; 3F9A _ 52
        push    eax                                     ; 3F9B _ 50
        call    boxfill8                                ; 3F9C _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 3FA1 _ 83. C4, 1C
        mov     eax, dword [ebp-14H]                    ; 3FA4 _ 8B. 45, EC
        lea     edi, [eax+1H]                           ; 3FA7 _ 8D. 78, 01
        mov     eax, dword [ebp-10H]                    ; 3FAA _ 8B. 45, F0
        lea     esi, [eax+1H]                           ; 3FAD _ 8D. 70, 01
        mov     eax, dword [ebp+10H]                    ; 3FB0 _ 8B. 45, 10
        lea     ebx, [eax-2H]                           ; 3FB3 _ 8D. 58, FE
        mov     eax, dword [ebp-10H]                    ; 3FB6 _ 8B. 45, F0
        lea     ecx, [eax+1H]                           ; 3FB9 _ 8D. 48, 01
        mov     eax, dword [ebp+8H]                     ; 3FBC _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 3FBF _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 3FC2 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 3FC5 _ 8B. 00
        push    edi                                     ; 3FC7 _ 57
        push    esi                                     ; 3FC8 _ 56
        push    ebx                                     ; 3FC9 _ 53
        push    ecx                                     ; 3FCA _ 51
        push    8                                       ; 3FCB _ 6A, 08
        push    edx                                     ; 3FCD _ 52
        push    eax                                     ; 3FCE _ 50
        call    boxfill8                                ; 3FCF _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 3FD4 _ 83. C4, 1C
        mov     eax, dword [ebp+10H]                    ; 3FD7 _ 8B. 45, 10
        lea     esi, [eax-1H]                           ; 3FDA _ 8D. 70, FF
        mov     eax, dword [ebp+0CH]                    ; 3FDD _ 8B. 45, 0C
        lea     ebx, [eax-1H]                           ; 3FE0 _ 8D. 58, FF
        mov     eax, dword [ebp+1CH]                    ; 3FE3 _ 8B. 45, 1C
        movzx   ecx, al                                 ; 3FE6 _ 0F B6. C8
        mov     eax, dword [ebp+8H]                     ; 3FE9 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 3FEC _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 3FEF _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 3FF2 _ 8B. 00
        push    dword [ebp-14H]                         ; 3FF4 _ FF. 75, EC
        push    dword [ebp-10H]                         ; 3FF7 _ FF. 75, F0
        push    esi                                     ; 3FFA _ 56
        push    ebx                                     ; 3FFB _ 53
        push    ecx                                     ; 3FFC _ 51
        push    edx                                     ; 3FFD _ 52
        push    eax                                     ; 3FFE _ 50
        call    boxfill8                                ; 3FFF _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 4004 _ 83. C4, 1C
        lea     esp, [ebp-0CH]                          ; 4007 _ 8D. 65, F4
        pop     ebx                                     ; 400A _ 5B
        pop     esi                                     ; 400B _ 5E
        pop     edi                                     ; 400C _ 5F
        pop     ebp                                     ; 400D _ 5D
        ret                                             ; 400E _ C3
; make_textbox8 End of function

file_loadfile:; Function begin
        push    ebp                                     ; 400F _ 55
        mov     ebp, esp                                ; 4010 _ 89. E5
        sub     esp, 40                                 ; 4012 _ 83. EC, 28
        mov     dword [ebp-0CH], 88064                  ; 4015 _ C7. 45, F4, 00015800
        mov     eax, dword [memman]                     ; 401C _ A1, 00000000(d)
        sub     esp, 8                                  ; 4021 _ 83. EC, 08
        push    13                                      ; 4024 _ 6A, 0D
        push    eax                                     ; 4026 _ 50
        call    memman_alloc                            ; 4027 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 402C _ 83. C4, 10
        mov     dword [ebp-1CH], eax                    ; 402F _ 89. 45, E4
        jmp     ?_281                                   ; 4032 _ E9, 0000013C

?_268:  mov     dword [ebp-10H], 0                      ; 4037 _ C7. 45, F0, 00000000
        jmp     ?_270                                   ; 403E _ EB, 0F

?_269:  mov     edx, dword [ebp-10H]                    ; 4040 _ 8B. 55, F0
        mov     eax, dword [ebp-1CH]                    ; 4043 _ 8B. 45, E4
        add     eax, edx                                ; 4046 _ 01. D0
        mov     byte [eax], 0                           ; 4048 _ C6. 00, 00
        add     dword [ebp-10H], 1                      ; 404B _ 83. 45, F0, 01
?_270:  cmp     dword [ebp-10H], 11                     ; 404F _ 83. 7D, F0, 0B
        jle near      ?_269                                   ; 4053 _ 7e, eb
        mov     dword [ebp-10H], 0                      ; 4055 _ C7. 45, F0, 00000000
        jmp     ?_274                                   ; 405C _ EB, 2C

?_271:  mov     edx, dword [ebp-0CH]                    ; 405E _ 8B. 55, F4
        mov     eax, dword [ebp-10H]                    ; 4061 _ 8B. 45, F0
        add     eax, edx                                ; 4064 _ 01. D0
        movzx   eax, byte [eax]                         ; 4066 _ 0F B6. 00
        test    al, al                                  ; 4069 _ 84. C0
        jz near       ?_272                                   ; 406b _ 74, 17
        mov     edx, dword [ebp-10H]                    ; 406D _ 8B. 55, F0
        mov     eax, dword [ebp-1CH]                    ; 4070 _ 8B. 45, E4
        add     eax, edx                                ; 4073 _ 01. D0
        mov     ecx, dword [ebp-0CH]                    ; 4075 _ 8B. 4D, F4
        mov     edx, dword [ebp-10H]                    ; 4078 _ 8B. 55, F0
        add     edx, ecx                                ; 407B _ 01. CA
        movzx   edx, byte [edx]                         ; 407D _ 0F B6. 12
        mov     byte [eax], dl                          ; 4080 _ 88. 10
        jmp     ?_273                                   ; 4082 _ EB, 02

?_272:  jmp     ?_275                                   ; 4084 _ EB, 0A

?_273:  add     dword [ebp-10H], 1                      ; 4086 _ 83. 45, F0, 01
?_274:  cmp     dword [ebp-10H], 7                      ; 408A _ 83. 7D, F0, 07
        jle near      ?_271                                   ; 408e _ 7e, ce
?_275:  mov     dword [ebp-14H], 0                      ; 4090 _ C7. 45, EC, 00000000
        mov     edx, dword [ebp-10H]                    ; 4097 _ 8B. 55, F0
        mov     eax, dword [ebp-1CH]                    ; 409A _ 8B. 45, E4
        add     eax, edx                                ; 409D _ 01. D0
        mov     byte [eax], 46                          ; 409F _ C6. 00, 2E
        add     dword [ebp-10H], 1                      ; 40A2 _ 83. 45, F0, 01
        mov     dword [ebp-14H], 0                      ; 40A6 _ C7. 45, EC, 00000000
        jmp     ?_277                                   ; 40AD _ EB, 1E

?_276:  mov     edx, dword [ebp-10H]                    ; 40AF _ 8B. 55, F0
        mov     eax, dword [ebp-1CH]                    ; 40B2 _ 8B. 45, E4
        add     eax, edx                                ; 40B5 _ 01. D0
        mov     ecx, dword [ebp-0CH]                    ; 40B7 _ 8B. 4D, F4
        mov     edx, dword [ebp-14H]                    ; 40BA _ 8B. 55, EC
        add     edx, ecx                                ; 40BD _ 01. CA
        movzx   edx, byte [edx+8H]                      ; 40BF _ 0F B6. 52, 08
        mov     byte [eax], dl                          ; 40C3 _ 88. 10
        add     dword [ebp-10H], 1                      ; 40C5 _ 83. 45, F0, 01
        add     dword [ebp-14H], 1                      ; 40C9 _ 83. 45, EC, 01
?_277:  cmp     dword [ebp-14H], 2                      ; 40CD _ 83. 7D, EC, 02
        jle near      ?_276                                   ; 40d1 _ 7e, dc
        sub     esp, 8                                  ; 40D3 _ 83. EC, 08
        push    dword [ebp-1CH]                         ; 40D6 _ FF. 75, E4
        push    dword [ebp+8H]                          ; 40D9 _ FF. 75, 08
        call    strcmp                                  ; 40DC _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 40E1 _ 83. C4, 10
        cmp     eax, 1                                  ; 40E4 _ 83. F8, 01
        jne near      ?_280                                   ; 40e7 _ 0f 85, 00000082
        mov     eax, dword [ebp-0CH]                    ; 40ED _ 8B. 45, F4
        mov     edx, dword [eax+1CH]                    ; 40F0 _ 8B. 50, 1C
        mov     eax, dword [memman]                     ; 40F3 _ A1, 00000000(d)
        sub     esp, 8                                  ; 40F8 _ 83. EC, 08
        push    edx                                     ; 40FB _ 52
        push    eax                                     ; 40FC _ 50
        call    memman_alloc_4k                         ; 40FD _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 4102 _ 83. C4, 10
        mov     edx, eax                                ; 4105 _ 89. C2
        mov     eax, dword [ebp+0CH]                    ; 4107 _ 8B. 45, 0C
        mov     dword [eax], edx                        ; 410A _ 89. 10
        mov     eax, dword [ebp-0CH]                    ; 410C _ 8B. 45, F4
        mov     eax, dword [eax+1CH]                    ; 410F _ 8B. 40, 1C
        mov     edx, eax                                ; 4112 _ 89. C2
        mov     eax, dword [ebp+0CH]                    ; 4114 _ 8B. 45, 0C
        mov     dword [eax+8H], edx                     ; 4117 _ 89. 50, 08
        mov     dword [ebp-20H], 97280                  ; 411A _ C7. 45, E0, 00017C00
        mov     eax, dword [ebp-0CH]                    ; 4121 _ 8B. 45, F4
        movzx   eax, word [eax+1AH]                     ; 4124 _ 0F B7. 40, 1A
        movzx   eax, ax                                 ; 4128 _ 0F B7. C0
        shl     eax, 9                                  ; 412B _ C1. E0, 09
        add     dword [ebp-20H], eax                    ; 412E _ 01. 45, E0
        mov     eax, dword [ebp-0CH]                    ; 4131 _ 8B. 45, F4
        mov     eax, dword [eax+1CH]                    ; 4134 _ 8B. 40, 1C
        mov     dword [ebp-24H], eax                    ; 4137 _ 89. 45, DC
        mov     dword [ebp-18H], 0                      ; 413A _ C7. 45, E8, 00000000
        mov     dword [ebp-18H], 0                      ; 4141 _ C7. 45, E8, 00000000
        jmp     ?_279                                   ; 4148 _ EB, 1B

?_278:  mov     eax, dword [ebp+0CH]                    ; 414A _ 8B. 45, 0C
        mov     edx, dword [eax]                        ; 414D _ 8B. 10
        mov     eax, dword [ebp-18H]                    ; 414F _ 8B. 45, E8
        add     eax, edx                                ; 4152 _ 01. D0
        mov     ecx, dword [ebp-18H]                    ; 4154 _ 8B. 4D, E8
        mov     edx, dword [ebp-20H]                    ; 4157 _ 8B. 55, E0
        add     edx, ecx                                ; 415A _ 01. CA
        movzx   edx, byte [edx]                         ; 415C _ 0F B6. 12
        mov     byte [eax], dl                          ; 415F _ 88. 10
        add     dword [ebp-18H], 1                      ; 4161 _ 83. 45, E8, 01
?_279:  mov     eax, dword [ebp-18H]                    ; 4165 _ 8B. 45, E8
        cmp     eax, dword [ebp-24H]                    ; 4168 _ 3B. 45, DC
        jl      ?_278                                   ; 416B _ 7C, DD
        jmp     ?_282                                   ; 416D _ EB, 12

?_280:  add     dword [ebp-0CH], 32                     ; 416F _ 83. 45, F4, 20
?_281:  mov     eax, dword [ebp-0CH]                    ; 4173 _ 8B. 45, F4
        movzx   eax, byte [eax]                         ; 4176 _ 0F B6. 00
        test    al, al                                  ; 4179 _ 84. C0
        jne near      ?_268                                   ; 417b _ 0f 85, fffffeb6
?_282:  mov     edx, dword [ebp-1CH]                    ; 4181 _ 8B. 55, E4
        mov     eax, dword [memman]                     ; 4184 _ A1, 00000000(d)
        sub     esp, 4                                  ; 4189 _ 83. EC, 04
        push    13                                      ; 418C _ 6A, 0D
        push    edx                                     ; 418E _ 52
        push    eax                                     ; 418F _ 50
        call    memman_free                             ; 4190 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 4195 _ 83. C4, 10
        leave                                           ; 4198 _ C9
        ret                                             ; 4199 _ C3
; file_loadfile End of function

intHandlerForStackOverFlow:; Function begin
        push    ebp                                     ; 419A _ 55
        mov     ebp, esp                                ; 419B _ 89. E5
        sub     esp, 24                                 ; 419D _ 83. EC, 18
        call    task_now                                ; 41A0 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 41A5 _ 89. 45, F4
        mov     eax, dword [ebp-0CH]                    ; 41A8 _ 8B. 45, F4
        mov     dword [eax+98H], 8                      ; 41AB _ C7. 80, 00000098, 00000008
        sub     esp, 12                                 ; 41B5 _ 83. EC, 0C
        push    ?_445                                   ; 41B8 _ 68, 0000009E(d)
        call    cons_putstr                             ; 41BD _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 41C2 _ 83. C4, 10
        mov     eax, dword [ebp-0CH]                    ; 41C5 _ 8B. 45, F4
        mov     dword [eax+98H], 8                      ; 41C8 _ C7. 80, 00000098, 00000008
        mov     eax, dword [ebp-0CH]                    ; 41D2 _ 8B. 45, F4
        mov     eax, dword [eax+9CH]                    ; 41D5 _ 8B. 80, 0000009C
        lea     edx, [eax+10H]                          ; 41DB _ 8D. 50, 10
        mov     eax, dword [ebp-0CH]                    ; 41DE _ 8B. 45, F4
        mov     dword [eax+9CH], edx                    ; 41E1 _ 89. 90, 0000009C
        sub     esp, 12                                 ; 41E7 _ 83. EC, 0C
        push    ?_446                                   ; 41EA _ 68, 000000A5(d)
        call    cons_putstr                             ; 41EF _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 41F4 _ 83. C4, 10
        mov     eax, dword [ebp-0CH]                    ; 41F7 _ 8B. 45, F4
        mov     dword [eax+98H], 8                      ; 41FA _ C7. 80, 00000098, 00000008
        mov     eax, dword [ebp-0CH]                    ; 4204 _ 8B. 45, F4
        mov     eax, dword [eax+9CH]                    ; 4207 _ 8B. 80, 0000009C
        lea     edx, [eax+10H]                          ; 420D _ 8D. 50, 10
        mov     eax, dword [ebp-0CH]                    ; 4210 _ 8B. 45, F4
        mov     dword [eax+9CH], edx                    ; 4213 _ 89. 90, 0000009C
        mov     eax, dword [ebp+8H]                     ; 4219 _ 8B. 45, 08
        add     eax, 44                                 ; 421C _ 83. C0, 2C
        mov     eax, dword [eax]                        ; 421F _ 8B. 00
        sub     esp, 12                                 ; 4221 _ 83. EC, 0C
        push    eax                                     ; 4224 _ 50
        call    intToHexStr                             ; 4225 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 422A _ 83. C4, 10
        mov     dword [ebp-10H], eax                    ; 422D _ 89. 45, F0
        sub     esp, 12                                 ; 4230 _ 83. EC, 0C
        push    ?_447                                   ; 4233 _ 68, 000000B5(d)
        call    cons_putstr                             ; 4238 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 423D _ 83. C4, 10
        sub     esp, 12                                 ; 4240 _ 83. EC, 0C
        push    dword [ebp-10H]                         ; 4243 _ FF. 75, F0
        call    cons_putstr                             ; 4246 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 424B _ 83. C4, 10
        mov     eax, dword [ebp-0CH]                    ; 424E _ 8B. 45, F4
        mov     dword [eax+98H], 8                      ; 4251 _ C7. 80, 00000098, 00000008
        mov     eax, dword [ebp-0CH]                    ; 425B _ 8B. 45, F4
        mov     eax, dword [eax+9CH]                    ; 425E _ 8B. 80, 0000009C
        lea     edx, [eax+10H]                          ; 4264 _ 8D. 50, 10
        mov     eax, dword [ebp-0CH]                    ; 4267 _ 8B. 45, F4
        mov     dword [eax+9CH], edx                    ; 426A _ 89. 90, 0000009C
        mov     eax, dword [ebp-0CH]                    ; 4270 _ 8B. 45, F4
        add     eax, 48                                 ; 4273 _ 83. C0, 30
        leave                                           ; 4276 _ C9
        ret                                             ; 4277 _ C3
; intHandlerForStackOverFlow End of function

intHandlerForException:; Function begin
        push    ebp                                     ; 4278 _ 55
        mov     ebp, esp                                ; 4279 _ 89. E5
        sub     esp, 24                                 ; 427B _ 83. EC, 18
        call    task_now                                ; 427E _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 4283 _ 89. 45, F4
        mov     eax, dword [ebp-0CH]                    ; 4286 _ 8B. 45, F4
        mov     dword [eax+98H], 8                      ; 4289 _ C7. 80, 00000098, 00000008
        sub     esp, 12                                 ; 4293 _ 83. EC, 0C
        push    ?_448                                   ; 4296 _ 68, 000000BC(d)
        call    cons_putstr                             ; 429B _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 42A0 _ 83. C4, 10
        mov     eax, dword [ebp-0CH]                    ; 42A3 _ 8B. 45, F4
        mov     dword [eax+98H], 8                      ; 42A6 _ C7. 80, 00000098, 00000008
        mov     eax, dword [ebp-0CH]                    ; 42B0 _ 8B. 45, F4
        mov     eax, dword [eax+9CH]                    ; 42B3 _ 8B. 80, 0000009C
        lea     edx, [eax+10H]                          ; 42B9 _ 8D. 50, 10
        mov     eax, dword [ebp-0CH]                    ; 42BC _ 8B. 45, F4
        mov     dword [eax+9CH], edx                    ; 42BF _ 89. 90, 0000009C
        sub     esp, 12                                 ; 42C5 _ 83. EC, 0C
        push    ?_449                                   ; 42C8 _ 68, 000000C4(d)
        call    cons_putstr                             ; 42CD _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 42D2 _ 83. C4, 10
        mov     eax, dword [ebp-0CH]                    ; 42D5 _ 8B. 45, F4
        mov     eax, dword [eax+9CH]                    ; 42D8 _ 8B. 80, 0000009C
        lea     edx, [eax+10H]                          ; 42DE _ 8D. 50, 10
        mov     eax, dword [ebp-0CH]                    ; 42E1 _ 8B. 45, F4
        mov     dword [eax+9CH], edx                    ; 42E4 _ 89. 90, 0000009C
        mov     eax, dword [ebp-0CH]                    ; 42EA _ 8B. 45, F4
        mov     dword [eax+98H], 8                      ; 42ED _ C7. 80, 00000098, 00000008
        mov     eax, dword [ebp-0CH]                    ; 42F7 _ 8B. 45, F4
        add     eax, 48                                 ; 42FA _ 83. C0, 30
        leave                                           ; 42FD _ C9
        ret                                             ; 42FE _ C3
; intHandlerForException End of function

memman_init:; Function begin
        push    ebp                                     ; 42FF _ 55
        mov     ebp, esp                                ; 4300 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 4302 _ 8B. 45, 08
        mov     dword [eax], 0                          ; 4305 _ C7. 00, 00000000
        mov     eax, dword [ebp+8H]                     ; 430B _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 430E _ C7. 40, 04, 00000000
        mov     eax, dword [ebp+8H]                     ; 4315 _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 4318 _ C7. 40, 08, 00000000
        mov     eax, dword [ebp+8H]                     ; 431F _ 8B. 45, 08
        mov     dword [eax+0CH], 0                      ; 4322 _ C7. 40, 0C, 00000000
        pop     ebp                                     ; 4329 _ 5D
        ret                                             ; 432A _ C3
; memman_init End of function

memman_total:; Function begin
        push    ebp                                     ; 432B _ 55
        mov     ebp, esp                                ; 432C _ 89. E5
        sub     esp, 16                                 ; 432E _ 83. EC, 10
        mov     dword [ebp-4H], 0                       ; 4331 _ C7. 45, FC, 00000000
        mov     dword [ebp-8H], 0                       ; 4338 _ C7. 45, F8, 00000000
        jmp     ?_284                                   ; 433F _ EB, 14

?_283:  mov     eax, dword [ebp+8H]                     ; 4341 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 4344 _ 8B. 55, F8
        add     edx, 2                                  ; 4347 _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 434A _ 8B. 44 D0, 04
        add     dword [ebp-4H], eax                     ; 434E _ 01. 45, FC
        add     dword [ebp-8H], 1                       ; 4351 _ 83. 45, F8, 01
?_284:  mov     eax, dword [ebp+8H]                     ; 4355 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 4358 _ 8B. 00
        cmp     eax, dword [ebp-8H]                     ; 435A _ 3B. 45, F8
        ja      ?_283                                   ; 435D _ 77, E2
        mov     eax, dword [ebp-4H]                     ; 435F _ 8B. 45, FC
        leave                                           ; 4362 _ C9
        ret                                             ; 4363 _ C3
; memman_total End of function

memman_alloc:; Function begin
        push    ebp                                     ; 4364 _ 55
        mov     ebp, esp                                ; 4365 _ 89. E5
        push    ebx                                     ; 4367 _ 53
        sub     esp, 16                                 ; 4368 _ 83. EC, 10
        mov     dword [ebp-0CH], 0                      ; 436B _ C7. 45, F4, 00000000
        jmp     ?_290                                   ; 4372 _ E9, 000000BD

?_285:  mov     eax, dword [ebp+8H]                     ; 4377 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 437A _ 8B. 55, F4
        add     edx, 2                                  ; 437D _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 4380 _ 8B. 44 D0, 04
        cmp     eax, dword [ebp+0CH]                    ; 4384 _ 3B. 45, 0C
        jc near       ?_289                                   ; 4387 _ 0f 82, 000000a3
        mov     eax, dword [ebp+8H]                     ; 438D _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 4390 _ 8B. 55, F4
        add     edx, 2                                  ; 4393 _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 4396 _ 8B. 04 D0
        mov     dword [ebp-8H], eax                     ; 4399 _ 89. 45, F8
        mov     eax, dword [ebp+8H]                     ; 439C _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 439F _ 8B. 55, F4
        add     edx, 2                                  ; 43A2 _ 83. C2, 02
        mov     edx, dword [eax+edx*8]                  ; 43A5 _ 8B. 14 D0
        mov     eax, dword [ebp+0CH]                    ; 43A8 _ 8B. 45, 0C
        lea     ecx, [edx+eax]                          ; 43AB _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 43AE _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 43B1 _ 8B. 55, F4
        add     edx, 2                                  ; 43B4 _ 83. C2, 02
        mov     dword [eax+edx*8], ecx                  ; 43B7 _ 89. 0C D0
        mov     eax, dword [ebp+8H]                     ; 43BA _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 43BD _ 8B. 55, F4
        add     edx, 2                                  ; 43C0 _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 43C3 _ 8B. 44 D0, 04
        sub     eax, dword [ebp+0CH]                    ; 43C7 _ 2B. 45, 0C
        mov     edx, eax                                ; 43CA _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 43CC _ 8B. 45, 08
        mov     ecx, dword [ebp-0CH]                    ; 43CF _ 8B. 4D, F4
        add     ecx, 2                                  ; 43D2 _ 83. C1, 02
        mov     dword [eax+ecx*8+4H], edx               ; 43D5 _ 89. 54 C8, 04
        mov     eax, dword [ebp+8H]                     ; 43D9 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 43DC _ 8B. 55, F4
        add     edx, 2                                  ; 43DF _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 43E2 _ 8B. 44 D0, 04
        test    eax, eax                                ; 43E6 _ 85. C0
        jnz near      ?_288                                   ; 43e8 _ 75, 41
        mov     eax, dword [ebp+8H]                     ; 43EA _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 43ED _ 8B. 00
        lea     edx, [eax-1H]                           ; 43EF _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 43F2 _ 8B. 45, 08
        mov     dword [eax], edx                        ; 43F5 _ 89. 10
        jmp     ?_287                                   ; 43F7 _ EB, 28

?_286:  mov     eax, dword [ebp-0CH]                    ; 43F9 _ 8B. 45, F4
        lea     edx, [eax+1H]                           ; 43FC _ 8D. 50, 01
        mov     ecx, dword [ebp+8H]                     ; 43FF _ 8B. 4D, 08
        mov     eax, dword [ebp-0CH]                    ; 4402 _ 8B. 45, F4
        lea     ebx, [eax+2H]                           ; 4405 _ 8D. 58, 02
        mov     eax, dword [ebp+8H]                     ; 4408 _ 8B. 45, 08
        add     edx, 2                                  ; 440B _ 83. C2, 02
        lea     edx, [eax+edx*8]                        ; 440E _ 8D. 14 D0
        mov     eax, dword [edx]                        ; 4411 _ 8B. 02
        mov     edx, dword [edx+4H]                     ; 4413 _ 8B. 52, 04
        mov     dword [ecx+ebx*8], eax                  ; 4416 _ 89. 04 D9
        mov     dword [ecx+ebx*8+4H], edx               ; 4419 _ 89. 54 D9, 04
        add     dword [ebp-0CH], 1                      ; 441D _ 83. 45, F4, 01
?_287:  mov     eax, dword [ebp+8H]                     ; 4421 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 4424 _ 8B. 00
        cmp     eax, dword [ebp-0CH]                    ; 4426 _ 3B. 45, F4
        ja      ?_286                                   ; 4429 _ 77, CE
?_288:  mov     eax, dword [ebp-8H]                     ; 442B _ 8B. 45, F8
        jmp     ?_291                                   ; 442E _ EB, 17

?_289:  add     dword [ebp-0CH], 1                      ; 4430 _ 83. 45, F4, 01
?_290:  mov     eax, dword [ebp+8H]                     ; 4434 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 4437 _ 8B. 00
        cmp     eax, dword [ebp-0CH]                    ; 4439 _ 3B. 45, F4
        ja      ?_285                                   ; 443C _ 0F 87, FFFFFF35
        mov     eax, 0                                  ; 4442 _ B8, 00000000
?_291:  add     esp, 16                                 ; 4447 _ 83. C4, 10
        pop     ebx                                     ; 444A _ 5B
        pop     ebp                                     ; 444B _ 5D
        ret                                             ; 444C _ C3
; memman_alloc End of function

memman_free:; Function begin
        push    ebp                                     ; 444D _ 55
        mov     ebp, esp                                ; 444E _ 89. E5
        push    ebx                                     ; 4450 _ 53
        sub     esp, 16                                 ; 4451 _ 83. EC, 10
        mov     dword [ebp-0CH], 0                      ; 4454 _ C7. 45, F4, 00000000
        jmp     ?_294                                   ; 445B _ EB, 17

?_292:  mov     eax, dword [ebp+8H]                     ; 445D _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 4460 _ 8B. 55, F4
        add     edx, 2                                  ; 4463 _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 4466 _ 8B. 04 D0
        cmp     eax, dword [ebp+0CH]                    ; 4469 _ 3B. 45, 0C
        jbe     ?_293                                   ; 446C _ 76, 02
        jmp     ?_295                                   ; 446E _ EB, 0E

?_293:  add     dword [ebp-0CH], 1                      ; 4470 _ 83. 45, F4, 01
?_294:  mov     eax, dword [ebp+8H]                     ; 4474 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 4477 _ 8B. 00
        cmp     eax, dword [ebp-0CH]                    ; 4479 _ 3B. 45, F4
        jg  near      ?_292                                   ; 447c _ 7f, df
?_295:  cmp     dword [ebp-0CH], 0                      ; 447E _ 83. 7D, F4, 00
        jle near      ?_299                                   ; 4482 _ 0f 8e, 000000f2
        mov     eax, dword [ebp-0CH]                    ; 4488 _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 448B _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 448E _ 8B. 45, 08
        add     edx, 2                                  ; 4491 _ 83. C2, 02
        mov     edx, dword [eax+edx*8]                  ; 4494 _ 8B. 14 D0
        mov     eax, dword [ebp-0CH]                    ; 4497 _ 8B. 45, F4
        lea     ecx, [eax-1H]                           ; 449A _ 8D. 48, FF
        mov     eax, dword [ebp+8H]                     ; 449D _ 8B. 45, 08
        add     ecx, 2                                  ; 44A0 _ 83. C1, 02
        mov     eax, dword [eax+ecx*8+4H]               ; 44A3 _ 8B. 44 C8, 04
        add     eax, edx                                ; 44A7 _ 01. D0
        cmp     eax, dword [ebp+0CH]                    ; 44A9 _ 3B. 45, 0C
        jne near      ?_299                                   ; 44ac _ 0f 85, 000000c8
        mov     eax, dword [ebp-0CH]                    ; 44B2 _ 8B. 45, F4
        lea     ebx, [eax-1H]                           ; 44B5 _ 8D. 58, FF
        mov     eax, dword [ebp-0CH]                    ; 44B8 _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 44BB _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 44BE _ 8B. 45, 08
        add     edx, 2                                  ; 44C1 _ 83. C2, 02
        mov     edx, dword [eax+edx*8+4H]               ; 44C4 _ 8B. 54 D0, 04
        mov     eax, dword [ebp+10H]                    ; 44C8 _ 8B. 45, 10
        lea     ecx, [edx+eax]                          ; 44CB _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 44CE _ 8B. 45, 08
        lea     edx, [ebx+2H]                           ; 44D1 _ 8D. 53, 02
        mov     dword [eax+edx*8+4H], ecx               ; 44D4 _ 89. 4C D0, 04
        mov     eax, dword [ebp+8H]                     ; 44D8 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 44DB _ 8B. 00
        cmp     eax, dword [ebp-0CH]                    ; 44DD _ 3B. 45, F4
        jle near      ?_298                                   ; 44e0 _ 0f 8e, 0000008a
        mov     edx, dword [ebp+0CH]                    ; 44E6 _ 8B. 55, 0C
        mov     eax, dword [ebp+10H]                    ; 44E9 _ 8B. 45, 10
        lea     ecx, [edx+eax]                          ; 44EC _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 44EF _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 44F2 _ 8B. 55, F4
        add     edx, 2                                  ; 44F5 _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 44F8 _ 8B. 04 D0
        cmp     ecx, eax                                ; 44FB _ 39. C1
        jnz near      ?_298                                   ; 44fd _ 75, 71
        mov     eax, dword [ebp-0CH]                    ; 44FF _ 8B. 45, F4
        lea     ebx, [eax-1H]                           ; 4502 _ 8D. 58, FF
        mov     eax, dword [ebp-0CH]                    ; 4505 _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 4508 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 450B _ 8B. 45, 08
        add     edx, 2                                  ; 450E _ 83. C2, 02
        mov     edx, dword [eax+edx*8+4H]               ; 4511 _ 8B. 54 D0, 04
        mov     eax, dword [ebp+8H]                     ; 4515 _ 8B. 45, 08
        mov     ecx, dword [ebp-0CH]                    ; 4518 _ 8B. 4D, F4
        add     ecx, 2                                  ; 451B _ 83. C1, 02
        mov     eax, dword [eax+ecx*8+4H]               ; 451E _ 8B. 44 C8, 04
        lea     ecx, [edx+eax]                          ; 4522 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 4525 _ 8B. 45, 08
        lea     edx, [ebx+2H]                           ; 4528 _ 8D. 53, 02
        mov     dword [eax+edx*8+4H], ecx               ; 452B _ 89. 4C D0, 04
        mov     eax, dword [ebp+8H]                     ; 452F _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 4532 _ 8B. 00
        lea     edx, [eax-1H]                           ; 4534 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 4537 _ 8B. 45, 08
        mov     dword [eax], edx                        ; 453A _ 89. 10
        jmp     ?_297                                   ; 453C _ EB, 28

?_296:  mov     eax, dword [ebp-0CH]                    ; 453E _ 8B. 45, F4
        lea     edx, [eax+1H]                           ; 4541 _ 8D. 50, 01
        mov     ecx, dword [ebp+8H]                     ; 4544 _ 8B. 4D, 08
        mov     eax, dword [ebp-0CH]                    ; 4547 _ 8B. 45, F4
        lea     ebx, [eax+2H]                           ; 454A _ 8D. 58, 02
        mov     eax, dword [ebp+8H]                     ; 454D _ 8B. 45, 08
        add     edx, 2                                  ; 4550 _ 83. C2, 02
        lea     edx, [eax+edx*8]                        ; 4553 _ 8D. 14 D0
        mov     eax, dword [edx]                        ; 4556 _ 8B. 02
        mov     edx, dword [edx+4H]                     ; 4558 _ 8B. 52, 04
        mov     dword [ecx+ebx*8], eax                  ; 455B _ 89. 04 D9
        mov     dword [ecx+ebx*8+4H], edx               ; 455E _ 89. 54 D9, 04
        add     dword [ebp-0CH], 1                      ; 4562 _ 83. 45, F4, 01
?_297:  mov     eax, dword [ebp+8H]                     ; 4566 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 4569 _ 8B. 00
        cmp     eax, dword [ebp-0CH]                    ; 456B _ 3B. 45, F4
        jg  near      ?_296                                   ; 456e _ 7f, ce
?_298:  mov     eax, 0                                  ; 4570 _ B8, 00000000
        jmp     ?_305                                   ; 4575 _ E9, 0000011C

?_299:  mov     eax, dword [ebp+8H]                     ; 457A _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 457D _ 8B. 00
        cmp     eax, dword [ebp-0CH]                    ; 457F _ 3B. 45, F4
        jle near      ?_300                                   ; 4582 _ 7e, 52
        mov     edx, dword [ebp+0CH]                    ; 4584 _ 8B. 55, 0C
        mov     eax, dword [ebp+10H]                    ; 4587 _ 8B. 45, 10
        lea     ecx, [edx+eax]                          ; 458A _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 458D _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 4590 _ 8B. 55, F4
        add     edx, 2                                  ; 4593 _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 4596 _ 8B. 04 D0
        cmp     ecx, eax                                ; 4599 _ 39. C1
        jnz near      ?_300                                   ; 459b _ 75, 39
        mov     eax, dword [ebp+8H]                     ; 459D _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 45A0 _ 8B. 55, F4
        lea     ecx, [edx+2H]                           ; 45A3 _ 8D. 4A, 02
        mov     edx, dword [ebp+0CH]                    ; 45A6 _ 8B. 55, 0C
        mov     dword [eax+ecx*8], edx                  ; 45A9 _ 89. 14 C8
        mov     eax, dword [ebp+8H]                     ; 45AC _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 45AF _ 8B. 55, F4
        add     edx, 2                                  ; 45B2 _ 83. C2, 02
        mov     edx, dword [eax+edx*8+4H]               ; 45B5 _ 8B. 54 D0, 04
        mov     eax, dword [ebp+10H]                    ; 45B9 _ 8B. 45, 10
        lea     ecx, [edx+eax]                          ; 45BC _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 45BF _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 45C2 _ 8B. 55, F4
        add     edx, 2                                  ; 45C5 _ 83. C2, 02
        mov     dword [eax+edx*8+4H], ecx               ; 45C8 _ 89. 4C D0, 04
        mov     eax, 0                                  ; 45CC _ B8, 00000000
        jmp     ?_305                                   ; 45D1 _ E9, 000000C0

?_300:  mov     eax, dword [ebp+8H]                     ; 45D6 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 45D9 _ 8B. 00
        cmp     eax, 4095                               ; 45DB _ 3D, 00000FFF
        jg  near      ?_304                                   ; 45e0 _ 0f 8f, 00000087
        mov     eax, dword [ebp+8H]                     ; 45E6 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 45E9 _ 8B. 00
        mov     dword [ebp-8H], eax                     ; 45EB _ 89. 45, F8
        jmp     ?_302                                   ; 45EE _ EB, 28

?_301:  mov     eax, dword [ebp-8H]                     ; 45F0 _ 8B. 45, F8
        lea     edx, [eax-1H]                           ; 45F3 _ 8D. 50, FF
        mov     ecx, dword [ebp+8H]                     ; 45F6 _ 8B. 4D, 08
        mov     eax, dword [ebp-8H]                     ; 45F9 _ 8B. 45, F8
        lea     ebx, [eax+2H]                           ; 45FC _ 8D. 58, 02
        mov     eax, dword [ebp+8H]                     ; 45FF _ 8B. 45, 08
        add     edx, 2                                  ; 4602 _ 83. C2, 02
        lea     edx, [eax+edx*8]                        ; 4605 _ 8D. 14 D0
        mov     eax, dword [edx]                        ; 4608 _ 8B. 02
        mov     edx, dword [edx+4H]                     ; 460A _ 8B. 52, 04
        mov     dword [ecx+ebx*8], eax                  ; 460D _ 89. 04 D9
        mov     dword [ecx+ebx*8+4H], edx               ; 4610 _ 89. 54 D9, 04
        sub     dword [ebp-8H], 1                       ; 4614 _ 83. 6D, F8, 01
?_302:  mov     eax, dword [ebp-8H]                     ; 4618 _ 8B. 45, F8
        cmp     eax, dword [ebp-0CH]                    ; 461B _ 3B. 45, F4
        jg  near      ?_301                                   ; 461e _ 7f, d0
        mov     eax, dword [ebp+8H]                     ; 4620 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 4623 _ 8B. 00
        lea     edx, [eax+1H]                           ; 4625 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 4628 _ 8B. 45, 08
        mov     dword [eax], edx                        ; 462B _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 462D _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 4630 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 4633 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 4636 _ 8B. 00
        cmp     edx, eax                                ; 4638 _ 39. C2
        jge near      ?_303                                   ; 463a _ 7d, 0b
        mov     eax, dword [ebp+8H]                     ; 463C _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 463F _ 8B. 10
        mov     eax, dword [ebp+8H]                     ; 4641 _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 4644 _ 89. 50, 04
?_303:  mov     eax, dword [ebp+8H]                     ; 4647 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 464A _ 8B. 55, F4
        lea     ecx, [edx+2H]                           ; 464D _ 8D. 4A, 02
        mov     edx, dword [ebp+0CH]                    ; 4650 _ 8B. 55, 0C
        mov     dword [eax+ecx*8], edx                  ; 4653 _ 89. 14 C8
        mov     eax, dword [ebp+8H]                     ; 4656 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 4659 _ 8B. 55, F4
        lea     ecx, [edx+2H]                           ; 465C _ 8D. 4A, 02
        mov     edx, dword [ebp+10H]                    ; 465F _ 8B. 55, 10
        mov     dword [eax+ecx*8+4H], edx               ; 4662 _ 89. 54 C8, 04
        mov     eax, 0                                  ; 4666 _ B8, 00000000
        jmp     ?_305                                   ; 466B _ EB, 29

?_304:  mov     eax, dword [ebp+8H]                     ; 466D _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 4670 _ 8B. 40, 0C
        lea     edx, [eax+1H]                           ; 4673 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 4676 _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 4679 _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 467C _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 467F _ 8B. 40, 08
        mov     edx, eax                                ; 4682 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 4684 _ 8B. 45, 10
        add     eax, edx                                ; 4687 _ 01. D0
        mov     edx, eax                                ; 4689 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 468B _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 468E _ 89. 50, 08
        mov     eax, 4294967295                         ; 4691 _ B8, FFFFFFFF
?_305:  add     esp, 16                                 ; 4696 _ 83. C4, 10
        pop     ebx                                     ; 4699 _ 5B
        pop     ebp                                     ; 469A _ 5D
        ret                                             ; 469B _ C3
; memman_free End of function

memman_alloc_4k:; Function begin
        push    ebp                                     ; 469C _ 55
        mov     ebp, esp                                ; 469D _ 89. E5
        sub     esp, 16                                 ; 469F _ 83. EC, 10
        mov     eax, dword [ebp+0CH]                    ; 46A2 _ 8B. 45, 0C
        add     eax, 4095                               ; 46A5 _ 05, 00000FFF
        and     eax, 0FFFFF000H                         ; 46AA _ 25, FFFFF000
        mov     dword [ebp+0CH], eax                    ; 46AF _ 89. 45, 0C
        push    dword [ebp+0CH]                         ; 46B2 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 46B5 _ FF. 75, 08
        call    memman_alloc                            ; 46B8 _ E8, FFFFFFFC(rel)
        add     esp, 8                                  ; 46BD _ 83. C4, 08
        mov     dword [ebp-4H], eax                     ; 46C0 _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 46C3 _ 8B. 45, FC
        leave                                           ; 46C6 _ C9
        ret                                             ; 46C7 _ C3
; memman_alloc_4k End of function

memman_free_4k:; Function begin
        push    ebp                                     ; 46C8 _ 55
        mov     ebp, esp                                ; 46C9 _ 89. E5
        sub     esp, 16                                 ; 46CB _ 83. EC, 10
        mov     eax, dword [ebp+10H]                    ; 46CE _ 8B. 45, 10
        add     eax, 4095                               ; 46D1 _ 05, 00000FFF
        and     eax, 0FFFFF000H                         ; 46D6 _ 25, FFFFF000
        mov     dword [ebp+10H], eax                    ; 46DB _ 89. 45, 10
        push    dword [ebp+10H]                         ; 46DE _ FF. 75, 10
        push    dword [ebp+0CH]                         ; 46E1 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 46E4 _ FF. 75, 08
        call    memman_free                             ; 46E7 _ E8, FFFFFFFC(rel)
        add     esp, 12                                 ; 46EC _ 83. C4, 0C
        mov     dword [ebp-4H], eax                     ; 46EF _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 46F2 _ 8B. 45, FC
        leave                                           ; 46F5 _ C9
        ret                                             ; 46F6 _ C3
; memman_free_4k End of function

shtctl_init:; Function begin
        push    ebp                                     ; 46F7 _ 55
        mov     ebp, esp                                ; 46F8 _ 89. E5
        sub     esp, 24                                 ; 46FA _ 83. EC, 18
        sub     esp, 8                                  ; 46FD _ 83. EC, 08
        push    9232                                    ; 4700 _ 68, 00002410
        push    dword [ebp+8H]                          ; 4705 _ FF. 75, 08
        call    memman_alloc_4k                         ; 4708 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 470D _ 83. C4, 10
        mov     dword [ebp-0CH], eax                    ; 4710 _ 89. 45, F4
        cmp     dword [ebp-0CH], 0                      ; 4713 _ 83. 7D, F4, 00
        jnz near      ?_306                                   ; 4717 _ 75, 0a
        mov     eax, 0                                  ; 4719 _ B8, 00000000
        jmp     ?_310                                   ; 471E _ E9, 000000BF

?_306:  mov     eax, dword [ebp+10H]                    ; 4723 _ 8B. 45, 10
        imul    eax, dword [ebp+14H]                    ; 4726 _ 0F AF. 45, 14
        sub     esp, 8                                  ; 472A _ 83. EC, 08
        push    eax                                     ; 472D _ 50
        push    dword [ebp+8H]                          ; 472E _ FF. 75, 08
        call    memman_alloc_4k                         ; 4731 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 4736 _ 83. C4, 10
        mov     edx, eax                                ; 4739 _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 473B _ 8B. 45, F4
        mov     dword [eax+4H], edx                     ; 473E _ 89. 50, 04
        mov     eax, dword [ebp-0CH]                    ; 4741 _ 8B. 45, F4
        mov     eax, dword [eax+4H]                     ; 4744 _ 8B. 40, 04
        test    eax, eax                                ; 4747 _ 85. C0
        jnz near      ?_307                                   ; 4749 _ 75, 1e
        mov     eax, dword [ebp-0CH]                    ; 474B _ 8B. 45, F4
        sub     esp, 4                                  ; 474E _ 83. EC, 04
        push    9232                                    ; 4751 _ 68, 00002410
        push    eax                                     ; 4756 _ 50
        push    dword [ebp+8H]                          ; 4757 _ FF. 75, 08
        call    memman_free_4k                          ; 475A _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 475F _ 83. C4, 10
        mov     eax, 0                                  ; 4762 _ B8, 00000000
        jmp     ?_310                                   ; 4767 _ EB, 79

?_307:  mov     eax, dword [ebp-0CH]                    ; 4769 _ 8B. 45, F4
        mov     edx, dword [ebp+0CH]                    ; 476C _ 8B. 55, 0C
        mov     dword [eax], edx                        ; 476F _ 89. 10
        mov     eax, dword [ebp-0CH]                    ; 4771 _ 8B. 45, F4
        mov     edx, dword [ebp+10H]                    ; 4774 _ 8B. 55, 10
        mov     dword [eax+8H], edx                     ; 4777 _ 89. 50, 08
        mov     eax, dword [ebp-0CH]                    ; 477A _ 8B. 45, F4
        mov     edx, dword [ebp+14H]                    ; 477D _ 8B. 55, 14
        mov     dword [eax+0CH], edx                    ; 4780 _ 89. 50, 0C
        mov     eax, dword [ebp-0CH]                    ; 4783 _ 8B. 45, F4
        mov     dword [eax+10H], -1                     ; 4786 _ C7. 40, 10, FFFFFFFF
        mov     dword [ebp-10H], 0                      ; 478D _ C7. 45, F0, 00000000
        jmp     ?_309                                   ; 4794 _ EB, 40

?_308:  mov     ecx, dword [ebp-0CH]                    ; 4796 _ 8B. 4D, F4
        mov     edx, dword [ebp-10H]                    ; 4799 _ 8B. 55, F0
        mov     eax, edx                                ; 479C _ 89. D0
        shl     eax, 3                                  ; 479E _ C1. E0, 03
        add     eax, edx                                ; 47A1 _ 01. D0
        shl     eax, 2                                  ; 47A3 _ C1. E0, 02
        add     eax, ecx                                ; 47A6 _ 01. C8
        add     eax, 1056                               ; 47A8 _ 05, 00000420
        mov     dword [eax+10H], 0                      ; 47AD _ C7. 40, 10, 00000000
        mov     ecx, dword [ebp-0CH]                    ; 47B4 _ 8B. 4D, F4
        mov     edx, dword [ebp-10H]                    ; 47B7 _ 8B. 55, F0
        mov     eax, edx                                ; 47BA _ 89. D0
        shl     eax, 3                                  ; 47BC _ C1. E0, 03
        add     eax, edx                                ; 47BF _ 01. D0
        shl     eax, 2                                  ; 47C1 _ C1. E0, 02
        add     eax, ecx                                ; 47C4 _ 01. C8
        add     eax, 1072                               ; 47C6 _ 05, 00000430
        mov     dword [eax+4H], 0                       ; 47CB _ C7. 40, 04, 00000000
        add     dword [ebp-10H], 1                      ; 47D2 _ 83. 45, F0, 01
?_309:  cmp     dword [ebp-10H], 255                    ; 47D6 _ 81. 7D, F0, 000000FF
        jle near      ?_308                                   ; 47dd _ 7e, b7
        mov     eax, dword [ebp-0CH]                    ; 47DF _ 8B. 45, F4
?_310:  leave                                           ; 47E2 _ C9
        ret                                             ; 47E3 _ C3
; shtctl_init End of function

sheet_alloc:; Function begin
        push    ebp                                     ; 47E4 _ 55
        mov     ebp, esp                                ; 47E5 _ 89. E5
        sub     esp, 24                                 ; 47E7 _ 83. EC, 18
        mov     dword [ebp-10H], 0                      ; 47EA _ C7. 45, F0, 00000000
        jmp     ?_313                                   ; 47F1 _ EB, 66

?_311:  mov     ecx, dword [ebp+8H]                     ; 47F3 _ 8B. 4D, 08
        mov     edx, dword [ebp-10H]                    ; 47F6 _ 8B. 55, F0
        mov     eax, edx                                ; 47F9 _ 89. D0
        shl     eax, 3                                  ; 47FB _ C1. E0, 03
        add     eax, edx                                ; 47FE _ 01. D0
        shl     eax, 2                                  ; 4800 _ C1. E0, 02
        add     eax, ecx                                ; 4803 _ 01. C8
        add     eax, 1056                               ; 4805 _ 05, 00000420
        mov     eax, dword [eax+10H]                    ; 480A _ 8B. 40, 10
        test    eax, eax                                ; 480D _ 85. C0
        jnz near      ?_312                                   ; 480f _ 75, 44
        mov     edx, dword [ebp-10H]                    ; 4811 _ 8B. 55, F0
        mov     eax, edx                                ; 4814 _ 89. D0
        shl     eax, 3                                  ; 4816 _ C1. E0, 03
        add     eax, edx                                ; 4819 _ 01. D0
        shl     eax, 2                                  ; 481B _ C1. E0, 02
        lea     edx, [eax+410H]                         ; 481E _ 8D. 90, 00000410
        mov     eax, dword [ebp+8H]                     ; 4824 _ 8B. 45, 08
        add     eax, edx                                ; 4827 _ 01. D0
        add     eax, 4                                  ; 4829 _ 83. C0, 04
        mov     dword [ebp-0CH], eax                    ; 482C _ 89. 45, F4
        mov     eax, dword [ebp-0CH]                    ; 482F _ 8B. 45, F4
        mov     dword [eax+1CH], 1                      ; 4832 _ C7. 40, 1C, 00000001
        mov     eax, dword [ebp-0CH]                    ; 4839 _ 8B. 45, F4
        mov     dword [eax+18H], -1                     ; 483C _ C7. 40, 18, FFFFFFFF
        call    task_now                                ; 4843 _ E8, FFFFFFFC(rel)
        mov     edx, eax                                ; 4848 _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 484A _ 8B. 45, F4
        mov     dword [eax+20H], edx                    ; 484D _ 89. 50, 20
        mov     eax, dword [ebp-0CH]                    ; 4850 _ 8B. 45, F4
        jmp     ?_314                                   ; 4853 _ EB, 12

?_312:  add     dword [ebp-10H], 1                      ; 4855 _ 83. 45, F0, 01
?_313:  cmp     dword [ebp-10H], 255                    ; 4859 _ 81. 7D, F0, 000000FF
        jle near      ?_311                                   ; 4860 _ 7e, 91
        mov     eax, 0                                  ; 4862 _ B8, 00000000
?_314:  leave                                           ; 4867 _ C9
        ret                                             ; 4868 _ C3
; sheet_alloc End of function

sheet_setbuf:; Function begin
        push    ebp                                     ; 4869 _ 55
        mov     ebp, esp                                ; 486A _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 486C _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 486F _ 8B. 55, 0C
        mov     dword [eax], edx                        ; 4872 _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 4874 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 4877 _ 8B. 55, 10
        mov     dword [eax+4H], edx                     ; 487A _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 487D _ 8B. 45, 08
        mov     edx, dword [ebp+14H]                    ; 4880 _ 8B. 55, 14
        mov     dword [eax+8H], edx                     ; 4883 _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 4886 _ 8B. 45, 08
        mov     edx, dword [ebp+18H]                    ; 4889 _ 8B. 55, 18
        mov     dword [eax+14H], edx                    ; 488C _ 89. 50, 14
        nop                                             ; 488F _ 90
        pop     ebp                                     ; 4890 _ 5D
        ret                                             ; 4891 _ C3
; sheet_setbuf End of function

sheet_updown:; Function begin
        push    ebp                                     ; 4892 _ 55
        mov     ebp, esp                                ; 4893 _ 89. E5
        push    esi                                     ; 4895 _ 56
        push    ebx                                     ; 4896 _ 53
        sub     esp, 16                                 ; 4897 _ 83. EC, 10
        mov     eax, dword [ebp+0CH]                    ; 489A _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 489D _ 8B. 40, 18
        mov     dword [ebp-0CH], eax                    ; 48A0 _ 89. 45, F4
        mov     eax, dword [ebp+8H]                     ; 48A3 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 48A6 _ 8B. 40, 10
        add     eax, 1                                  ; 48A9 _ 83. C0, 01
        cmp     eax, dword [ebp+10H]                    ; 48AC _ 3B. 45, 10
        jge near      ?_315                                   ; 48af _ 7d, 0c
        mov     eax, dword [ebp+8H]                     ; 48B1 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 48B4 _ 8B. 40, 10
        add     eax, 1                                  ; 48B7 _ 83. C0, 01
        mov     dword [ebp+10H], eax                    ; 48BA _ 89. 45, 10
?_315:  cmp     dword [ebp+10H], -1                     ; 48BD _ 83. 7D, 10, FF
        jge near      ?_316                                   ; 48c1 _ 7d, 07
        mov     dword [ebp+10H], -1                     ; 48C3 _ C7. 45, 10, FFFFFFFF
?_316:  mov     eax, dword [ebp+0CH]                    ; 48CA _ 8B. 45, 0C
        mov     edx, dword [ebp+10H]                    ; 48CD _ 8B. 55, 10
        mov     dword [eax+18H], edx                    ; 48D0 _ 89. 50, 18
        mov     eax, dword [ebp-0CH]                    ; 48D3 _ 8B. 45, F4
        cmp     eax, dword [ebp+10H]                    ; 48D6 _ 3B. 45, 10
        jle near      ?_323                                   ; 48d9 _ 0f 8e, 000001d5
        cmp     dword [ebp+10H], 0                      ; 48DF _ 83. 7D, 10, 00
        js near       ?_319                                   ; 48e3 _ 0f 88, 000000e2
        mov     eax, dword [ebp-0CH]                    ; 48E9 _ 8B. 45, F4
        mov     dword [ebp-10H], eax                    ; 48EC _ 89. 45, F0
        jmp     ?_318                                   ; 48EF _ EB, 34

?_317:  mov     eax, dword [ebp-10H]                    ; 48F1 _ 8B. 45, F0
        lea     edx, [eax-1H]                           ; 48F4 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 48F7 _ 8B. 45, 08
        add     edx, 4                                  ; 48FA _ 83. C2, 04
        mov     edx, dword [eax+edx*4+4H]               ; 48FD _ 8B. 54 90, 04
        mov     eax, dword [ebp+8H]                     ; 4901 _ 8B. 45, 08
        mov     ecx, dword [ebp-10H]                    ; 4904 _ 8B. 4D, F0
        add     ecx, 4                                  ; 4907 _ 83. C1, 04
        mov     dword [eax+ecx*4+4H], edx               ; 490A _ 89. 54 88, 04
        mov     eax, dword [ebp+8H]                     ; 490E _ 8B. 45, 08
        mov     edx, dword [ebp-10H]                    ; 4911 _ 8B. 55, F0
        add     edx, 4                                  ; 4914 _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 4917 _ 8B. 44 90, 04
        mov     edx, dword [ebp-10H]                    ; 491B _ 8B. 55, F0
        mov     dword [eax+18H], edx                    ; 491E _ 89. 50, 18
        sub     dword [ebp-10H], 1                      ; 4921 _ 83. 6D, F0, 01
?_318:  mov     eax, dword [ebp-10H]                    ; 4925 _ 8B. 45, F0
        cmp     eax, dword [ebp+10H]                    ; 4928 _ 3B. 45, 10
        jg  near      ?_317                                   ; 492b _ 7f, c4
        mov     eax, dword [ebp+8H]                     ; 492D _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 4930 _ 8B. 55, 10
        lea     ecx, [edx+4H]                           ; 4933 _ 8D. 4A, 04
        mov     edx, dword [ebp+0CH]                    ; 4936 _ 8B. 55, 0C
        mov     dword [eax+ecx*4+4H], edx               ; 4939 _ 89. 54 88, 04
        mov     eax, dword [ebp+10H]                    ; 493D _ 8B. 45, 10
        lea     esi, [eax+1H]                           ; 4940 _ 8D. 70, 01
        mov     eax, dword [ebp+0CH]                    ; 4943 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 4946 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 4949 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 494C _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 494F _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 4952 _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 4955 _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 4958 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 495B _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 495E _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 4961 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 4964 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 4967 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 496A _ 8B. 40, 0C
        sub     esp, 8                                  ; 496D _ 83. EC, 08
        push    esi                                     ; 4970 _ 56
        push    ebx                                     ; 4971 _ 53
        push    ecx                                     ; 4972 _ 51
        push    edx                                     ; 4973 _ 52
        push    eax                                     ; 4974 _ 50
        push    dword [ebp+8H]                          ; 4975 _ FF. 75, 08
        call    sheet_refreshmap                        ; 4978 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 497D _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 4980 _ 8B. 45, 10
        lea     esi, [eax+1H]                           ; 4983 _ 8D. 70, 01
        mov     eax, dword [ebp+0CH]                    ; 4986 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 4989 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 498C _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 498F _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 4992 _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 4995 _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 4998 _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 499B _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 499E _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 49A1 _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 49A4 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 49A7 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 49AA _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 49AD _ 8B. 40, 0C
        sub     esp, 4                                  ; 49B0 _ 83. EC, 04
        push    dword [ebp-0CH]                         ; 49B3 _ FF. 75, F4
        push    esi                                     ; 49B6 _ 56
        push    ebx                                     ; 49B7 _ 53
        push    ecx                                     ; 49B8 _ 51
        push    edx                                     ; 49B9 _ 52
        push    eax                                     ; 49BA _ 50
        push    dword [ebp+8H]                          ; 49BB _ FF. 75, 08
        call    sheet_refreshsub                        ; 49BE _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 49C3 _ 83. C4, 20
        jmp     ?_330                                   ; 49C6 _ E9, 0000023E

?_319:  mov     eax, dword [ebp+8H]                     ; 49CB _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 49CE _ 8B. 40, 10
        cmp     eax, dword [ebp-0CH]                    ; 49D1 _ 3B. 45, F4
        jle near      ?_322                                   ; 49d4 _ 7e, 47
        mov     eax, dword [ebp-0CH]                    ; 49D6 _ 8B. 45, F4
        mov     dword [ebp-10H], eax                    ; 49D9 _ 89. 45, F0
        jmp     ?_321                                   ; 49DC _ EB, 34

?_320:  mov     eax, dword [ebp-10H]                    ; 49DE _ 8B. 45, F0
        lea     edx, [eax+1H]                           ; 49E1 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 49E4 _ 8B. 45, 08
        add     edx, 4                                  ; 49E7 _ 83. C2, 04
        mov     edx, dword [eax+edx*4+4H]               ; 49EA _ 8B. 54 90, 04
        mov     eax, dword [ebp+8H]                     ; 49EE _ 8B. 45, 08
        mov     ecx, dword [ebp-10H]                    ; 49F1 _ 8B. 4D, F0
        add     ecx, 4                                  ; 49F4 _ 83. C1, 04
        mov     dword [eax+ecx*4+4H], edx               ; 49F7 _ 89. 54 88, 04
        mov     eax, dword [ebp+8H]                     ; 49FB _ 8B. 45, 08
        mov     edx, dword [ebp-10H]                    ; 49FE _ 8B. 55, F0
        add     edx, 4                                  ; 4A01 _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 4A04 _ 8B. 44 90, 04
        mov     edx, dword [ebp-10H]                    ; 4A08 _ 8B. 55, F0
        mov     dword [eax+18H], edx                    ; 4A0B _ 89. 50, 18
        add     dword [ebp-10H], 1                      ; 4A0E _ 83. 45, F0, 01
?_321:  mov     eax, dword [ebp+8H]                     ; 4A12 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 4A15 _ 8B. 40, 10
        cmp     eax, dword [ebp-10H]                    ; 4A18 _ 3B. 45, F0
        jg  near      ?_320                                   ; 4a1b _ 7f, c1
?_322:  mov     eax, dword [ebp+8H]                     ; 4A1D _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 4A20 _ 8B. 40, 10
        lea     edx, [eax-1H]                           ; 4A23 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 4A26 _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 4A29 _ 89. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 4A2C _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 4A2F _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 4A32 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 4A35 _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 4A38 _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 4A3B _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 4A3E _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 4A41 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 4A44 _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 4A47 _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 4A4A _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 4A4D _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 4A50 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 4A53 _ 8B. 40, 0C
        sub     esp, 8                                  ; 4A56 _ 83. EC, 08
        push    0                                       ; 4A59 _ 6A, 00
        push    ebx                                     ; 4A5B _ 53
        push    ecx                                     ; 4A5C _ 51
        push    edx                                     ; 4A5D _ 52
        push    eax                                     ; 4A5E _ 50
        push    dword [ebp+8H]                          ; 4A5F _ FF. 75, 08
        call    sheet_refreshmap                        ; 4A62 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 4A67 _ 83. C4, 20
        mov     eax, dword [ebp-0CH]                    ; 4A6A _ 8B. 45, F4
        lea     esi, [eax-1H]                           ; 4A6D _ 8D. 70, FF
        mov     eax, dword [ebp+0CH]                    ; 4A70 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 4A73 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 4A76 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 4A79 _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 4A7C _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 4A7F _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 4A82 _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 4A85 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 4A88 _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 4A8B _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 4A8E _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 4A91 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 4A94 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 4A97 _ 8B. 40, 0C
        sub     esp, 4                                  ; 4A9A _ 83. EC, 04
        push    esi                                     ; 4A9D _ 56
        push    0                                       ; 4A9E _ 6A, 00
        push    ebx                                     ; 4AA0 _ 53
        push    ecx                                     ; 4AA1 _ 51
        push    edx                                     ; 4AA2 _ 52
        push    eax                                     ; 4AA3 _ 50
        push    dword [ebp+8H]                          ; 4AA4 _ FF. 75, 08
        call    sheet_refreshsub                        ; 4AA7 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 4AAC _ 83. C4, 20
        jmp     ?_330                                   ; 4AAF _ E9, 00000155

?_323:  mov     eax, dword [ebp-0CH]                    ; 4AB4 _ 8B. 45, F4
        cmp     eax, dword [ebp+10H]                    ; 4AB7 _ 3B. 45, 10
        jge near      ?_330                                   ; 4aba _ 0f 8d, 00000149
        cmp     dword [ebp-0CH], 0                      ; 4AC0 _ 83. 7D, F4, 00
        js near       ?_326                                   ; 4ac4 _ 78, 56
        mov     eax, dword [ebp-0CH]                    ; 4AC6 _ 8B. 45, F4
        mov     dword [ebp-10H], eax                    ; 4AC9 _ 89. 45, F0
        jmp     ?_325                                   ; 4ACC _ EB, 34

?_324:  mov     eax, dword [ebp-10H]                    ; 4ACE _ 8B. 45, F0
        lea     edx, [eax+1H]                           ; 4AD1 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 4AD4 _ 8B. 45, 08
        add     edx, 4                                  ; 4AD7 _ 83. C2, 04
        mov     edx, dword [eax+edx*4+4H]               ; 4ADA _ 8B. 54 90, 04
        mov     eax, dword [ebp+8H]                     ; 4ADE _ 8B. 45, 08
        mov     ecx, dword [ebp-10H]                    ; 4AE1 _ 8B. 4D, F0
        add     ecx, 4                                  ; 4AE4 _ 83. C1, 04
        mov     dword [eax+ecx*4+4H], edx               ; 4AE7 _ 89. 54 88, 04
        mov     eax, dword [ebp+8H]                     ; 4AEB _ 8B. 45, 08
        mov     edx, dword [ebp-10H]                    ; 4AEE _ 8B. 55, F0
        add     edx, 4                                  ; 4AF1 _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 4AF4 _ 8B. 44 90, 04
        mov     edx, dword [ebp-10H]                    ; 4AF8 _ 8B. 55, F0
        mov     dword [eax+18H], edx                    ; 4AFB _ 89. 50, 18
        add     dword [ebp-10H], 1                      ; 4AFE _ 83. 45, F0, 01
?_325:  mov     eax, dword [ebp-10H]                    ; 4B02 _ 8B. 45, F0
        cmp     eax, dword [ebp+10H]                    ; 4B05 _ 3B. 45, 10
        jl      ?_324                                   ; 4B08 _ 7C, C4
        mov     eax, dword [ebp+8H]                     ; 4B0A _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 4B0D _ 8B. 55, 10
        lea     ecx, [edx+4H]                           ; 4B10 _ 8D. 4A, 04
        mov     edx, dword [ebp+0CH]                    ; 4B13 _ 8B. 55, 0C
        mov     dword [eax+ecx*4+4H], edx               ; 4B16 _ 89. 54 88, 04
        jmp     ?_329                                   ; 4B1A _ EB, 6C

?_326:  mov     eax, dword [ebp+8H]                     ; 4B1C _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 4B1F _ 8B. 40, 10
        mov     dword [ebp-10H], eax                    ; 4B22 _ 89. 45, F0
        jmp     ?_328                                   ; 4B25 _ EB, 3A

?_327:  mov     eax, dword [ebp-10H]                    ; 4B27 _ 8B. 45, F0
        lea     ecx, [eax+1H]                           ; 4B2A _ 8D. 48, 01
        mov     eax, dword [ebp+8H]                     ; 4B2D _ 8B. 45, 08
        mov     edx, dword [ebp-10H]                    ; 4B30 _ 8B. 55, F0
        add     edx, 4                                  ; 4B33 _ 83. C2, 04
        mov     edx, dword [eax+edx*4+4H]               ; 4B36 _ 8B. 54 90, 04
        mov     eax, dword [ebp+8H]                     ; 4B3A _ 8B. 45, 08
        add     ecx, 4                                  ; 4B3D _ 83. C1, 04
        mov     dword [eax+ecx*4+4H], edx               ; 4B40 _ 89. 54 88, 04
        mov     eax, dword [ebp-10H]                    ; 4B44 _ 8B. 45, F0
        lea     edx, [eax+1H]                           ; 4B47 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 4B4A _ 8B. 45, 08
        add     edx, 4                                  ; 4B4D _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 4B50 _ 8B. 44 90, 04
        mov     edx, dword [ebp-10H]                    ; 4B54 _ 8B. 55, F0
        add     edx, 1                                  ; 4B57 _ 83. C2, 01
        mov     dword [eax+18H], edx                    ; 4B5A _ 89. 50, 18
        sub     dword [ebp-10H], 1                      ; 4B5D _ 83. 6D, F0, 01
?_328:  mov     eax, dword [ebp-10H]                    ; 4B61 _ 8B. 45, F0
        cmp     eax, dword [ebp+10H]                    ; 4B64 _ 3B. 45, 10
        jge near      ?_327                                   ; 4b67 _ 7d, be
        mov     eax, dword [ebp+8H]                     ; 4B69 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 4B6C _ 8B. 55, 10
        lea     ecx, [edx+4H]                           ; 4B6F _ 8D. 4A, 04
        mov     edx, dword [ebp+0CH]                    ; 4B72 _ 8B. 55, 0C
        mov     dword [eax+ecx*4+4H], edx               ; 4B75 _ 89. 54 88, 04
        mov     eax, dword [ebp+8H]                     ; 4B79 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 4B7C _ 8B. 40, 10
        lea     edx, [eax+1H]                           ; 4B7F _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 4B82 _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 4B85 _ 89. 50, 10
?_329:  mov     eax, dword [ebp+0CH]                    ; 4B88 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 4B8B _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 4B8E _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 4B91 _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 4B94 _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 4B97 _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 4B9A _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 4B9D _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 4BA0 _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 4BA3 _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 4BA6 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 4BA9 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 4BAC _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 4BAF _ 8B. 40, 0C
        sub     esp, 8                                  ; 4BB2 _ 83. EC, 08
        push    dword [ebp+10H]                         ; 4BB5 _ FF. 75, 10
        push    ebx                                     ; 4BB8 _ 53
        push    ecx                                     ; 4BB9 _ 51
        push    edx                                     ; 4BBA _ 52
        push    eax                                     ; 4BBB _ 50
        push    dword [ebp+8H]                          ; 4BBC _ FF. 75, 08
        call    sheet_refreshmap                        ; 4BBF _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 4BC4 _ 83. C4, 20
        mov     eax, dword [ebp+0CH]                    ; 4BC7 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 4BCA _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 4BCD _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 4BD0 _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 4BD3 _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 4BD6 _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 4BD9 _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 4BDC _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 4BDF _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 4BE2 _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 4BE5 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 4BE8 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 4BEB _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 4BEE _ 8B. 40, 0C
        sub     esp, 4                                  ; 4BF1 _ 83. EC, 04
        push    dword [ebp+10H]                         ; 4BF4 _ FF. 75, 10
        push    dword [ebp+10H]                         ; 4BF7 _ FF. 75, 10
        push    ebx                                     ; 4BFA _ 53
        push    ecx                                     ; 4BFB _ 51
        push    edx                                     ; 4BFC _ 52
        push    eax                                     ; 4BFD _ 50
        push    dword [ebp+8H]                          ; 4BFE _ FF. 75, 08
        call    sheet_refreshsub                        ; 4C01 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 4C06 _ 83. C4, 20
?_330:  lea     esp, [ebp-8H]                           ; 4C09 _ 8D. 65, F8
        pop     ebx                                     ; 4C0C _ 5B
        pop     esi                                     ; 4C0D _ 5E
        pop     ebp                                     ; 4C0E _ 5D
        ret                                             ; 4C0F _ C3
; sheet_updown End of function

sheet_refresh:; Function begin
        push    ebp                                     ; 4C10 _ 55
        mov     ebp, esp                                ; 4C11 _ 89. E5
        push    edi                                     ; 4C13 _ 57
        push    esi                                     ; 4C14 _ 56
        push    ebx                                     ; 4C15 _ 53
        sub     esp, 28                                 ; 4C16 _ 83. EC, 1C
        mov     eax, dword [ebp+0CH]                    ; 4C19 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 4C1C _ 8B. 40, 18
        test    eax, eax                                ; 4C1F _ 85. C0
        js near       ?_331                                   ; 4c21 _ 78, 52
        mov     eax, dword [ebp+0CH]                    ; 4C23 _ 8B. 45, 0C
        mov     ebx, dword [eax+18H]                    ; 4C26 _ 8B. 58, 18
        mov     eax, dword [ebp+0CH]                    ; 4C29 _ 8B. 45, 0C
        mov     ecx, dword [eax+18H]                    ; 4C2C _ 8B. 48, 18
        mov     eax, dword [ebp+0CH]                    ; 4C2F _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 4C32 _ 8B. 50, 10
        mov     eax, dword [ebp+1CH]                    ; 4C35 _ 8B. 45, 1C
        lea     edi, [edx+eax]                          ; 4C38 _ 8D. 3C 02
        mov     eax, dword [ebp+0CH]                    ; 4C3B _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 4C3E _ 8B. 50, 0C
        mov     eax, dword [ebp+18H]                    ; 4C41 _ 8B. 45, 18
        lea     esi, [edx+eax]                          ; 4C44 _ 8D. 34 02
        mov     eax, dword [ebp+0CH]                    ; 4C47 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 4C4A _ 8B. 50, 10
        mov     eax, dword [ebp+14H]                    ; 4C4D _ 8B. 45, 14
        add     edx, eax                                ; 4C50 _ 01. C2
        mov     eax, dword [ebp+0CH]                    ; 4C52 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 4C55 _ 8B. 40, 0C
        mov     dword [ebp-1CH], eax                    ; 4C58 _ 89. 45, E4
        mov     eax, dword [ebp+10H]                    ; 4C5B _ 8B. 45, 10
        add     eax, dword [ebp-1CH]                    ; 4C5E _ 03. 45, E4
        sub     esp, 4                                  ; 4C61 _ 83. EC, 04
        push    ebx                                     ; 4C64 _ 53
        push    ecx                                     ; 4C65 _ 51
        push    edi                                     ; 4C66 _ 57
        push    esi                                     ; 4C67 _ 56
        push    edx                                     ; 4C68 _ 52
        push    eax                                     ; 4C69 _ 50
        push    dword [ebp+8H]                          ; 4C6A _ FF. 75, 08
        call    sheet_refreshsub                        ; 4C6D _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 4C72 _ 83. C4, 20
?_331:  mov     eax, 0                                  ; 4C75 _ B8, 00000000
        lea     esp, [ebp-0CH]                          ; 4C7A _ 8D. 65, F4
        pop     ebx                                     ; 4C7D _ 5B
        pop     esi                                     ; 4C7E _ 5E
        pop     edi                                     ; 4C7F _ 5F
        pop     ebp                                     ; 4C80 _ 5D
        ret                                             ; 4C81 _ C3
; sheet_refresh End of function

sheet_slide:; Function begin
        push    ebp                                     ; 4C82 _ 55
        mov     ebp, esp                                ; 4C83 _ 89. E5
        push    esi                                     ; 4C85 _ 56
        push    ebx                                     ; 4C86 _ 53
        sub     esp, 16                                 ; 4C87 _ 83. EC, 10
        mov     eax, dword [ebp+0CH]                    ; 4C8A _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 4C8D _ 8B. 40, 0C
        mov     dword [ebp-10H], eax                    ; 4C90 _ 89. 45, F0
        mov     eax, dword [ebp+0CH]                    ; 4C93 _ 8B. 45, 0C
        mov     eax, dword [eax+10H]                    ; 4C96 _ 8B. 40, 10
        mov     dword [ebp-0CH], eax                    ; 4C99 _ 89. 45, F4
        mov     eax, dword [ebp+0CH]                    ; 4C9C _ 8B. 45, 0C
        mov     edx, dword [ebp+10H]                    ; 4C9F _ 8B. 55, 10
        mov     dword [eax+0CH], edx                    ; 4CA2 _ 89. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 4CA5 _ 8B. 45, 0C
        mov     edx, dword [ebp+14H]                    ; 4CA8 _ 8B. 55, 14
        mov     dword [eax+10H], edx                    ; 4CAB _ 89. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 4CAE _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 4CB1 _ 8B. 40, 18
        test    eax, eax                                ; 4CB4 _ 85. C0
        js near       ?_332                                   ; 4cb6 _ 0f 88, 000000d3
        mov     eax, dword [ebp+0CH]                    ; 4CBC _ 8B. 45, 0C
        mov     edx, dword [eax+8H]                     ; 4CBF _ 8B. 50, 08
        mov     eax, dword [ebp-0CH]                    ; 4CC2 _ 8B. 45, F4
        add     edx, eax                                ; 4CC5 _ 01. C2
        mov     eax, dword [ebp+0CH]                    ; 4CC7 _ 8B. 45, 0C
        mov     ecx, dword [eax+4H]                     ; 4CCA _ 8B. 48, 04
        mov     eax, dword [ebp-10H]                    ; 4CCD _ 8B. 45, F0
        add     eax, ecx                                ; 4CD0 _ 01. C8
        sub     esp, 8                                  ; 4CD2 _ 83. EC, 08
        push    0                                       ; 4CD5 _ 6A, 00
        push    edx                                     ; 4CD7 _ 52
        push    eax                                     ; 4CD8 _ 50
        push    dword [ebp-0CH]                         ; 4CD9 _ FF. 75, F4
        push    dword [ebp-10H]                         ; 4CDC _ FF. 75, F0
        push    dword [ebp+8H]                          ; 4CDF _ FF. 75, 08
        call    sheet_refreshmap                        ; 4CE2 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 4CE7 _ 83. C4, 20
        mov     eax, dword [ebp+0CH]                    ; 4CEA _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 4CED _ 8B. 40, 18
        mov     edx, dword [ebp+0CH]                    ; 4CF0 _ 8B. 55, 0C
        mov     ecx, dword [edx+8H]                     ; 4CF3 _ 8B. 4A, 08
        mov     edx, dword [ebp+14H]                    ; 4CF6 _ 8B. 55, 14
        add     ecx, edx                                ; 4CF9 _ 01. D1
        mov     edx, dword [ebp+0CH]                    ; 4CFB _ 8B. 55, 0C
        mov     ebx, dword [edx+4H]                     ; 4CFE _ 8B. 5A, 04
        mov     edx, dword [ebp+10H]                    ; 4D01 _ 8B. 55, 10
        add     edx, ebx                                ; 4D04 _ 01. DA
        sub     esp, 8                                  ; 4D06 _ 83. EC, 08
        push    eax                                     ; 4D09 _ 50
        push    ecx                                     ; 4D0A _ 51
        push    edx                                     ; 4D0B _ 52
        push    dword [ebp+14H]                         ; 4D0C _ FF. 75, 14
        push    dword [ebp+10H]                         ; 4D0F _ FF. 75, 10
        push    dword [ebp+8H]                          ; 4D12 _ FF. 75, 08
        call    sheet_refreshmap                        ; 4D15 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 4D1A _ 83. C4, 20
        mov     eax, dword [ebp+0CH]                    ; 4D1D _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 4D20 _ 8B. 40, 18
        lea     ecx, [eax-1H]                           ; 4D23 _ 8D. 48, FF
        mov     eax, dword [ebp+0CH]                    ; 4D26 _ 8B. 45, 0C
        mov     edx, dword [eax+8H]                     ; 4D29 _ 8B. 50, 08
        mov     eax, dword [ebp-0CH]                    ; 4D2C _ 8B. 45, F4
        add     edx, eax                                ; 4D2F _ 01. C2
        mov     eax, dword [ebp+0CH]                    ; 4D31 _ 8B. 45, 0C
        mov     ebx, dword [eax+4H]                     ; 4D34 _ 8B. 58, 04
        mov     eax, dword [ebp-10H]                    ; 4D37 _ 8B. 45, F0
        add     eax, ebx                                ; 4D3A _ 01. D8
        sub     esp, 4                                  ; 4D3C _ 83. EC, 04
        push    ecx                                     ; 4D3F _ 51
        push    0                                       ; 4D40 _ 6A, 00
        push    edx                                     ; 4D42 _ 52
        push    eax                                     ; 4D43 _ 50
        push    dword [ebp-0CH]                         ; 4D44 _ FF. 75, F4
        push    dword [ebp-10H]                         ; 4D47 _ FF. 75, F0
        push    dword [ebp+8H]                          ; 4D4A _ FF. 75, 08
        call    sheet_refreshsub                        ; 4D4D _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 4D52 _ 83. C4, 20
        mov     eax, dword [ebp+0CH]                    ; 4D55 _ 8B. 45, 0C
        mov     edx, dword [eax+18H]                    ; 4D58 _ 8B. 50, 18
        mov     eax, dword [ebp+0CH]                    ; 4D5B _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 4D5E _ 8B. 40, 18
        mov     ecx, dword [ebp+0CH]                    ; 4D61 _ 8B. 4D, 0C
        mov     ebx, dword [ecx+8H]                     ; 4D64 _ 8B. 59, 08
        mov     ecx, dword [ebp+14H]                    ; 4D67 _ 8B. 4D, 14
        add     ebx, ecx                                ; 4D6A _ 01. CB
        mov     ecx, dword [ebp+0CH]                    ; 4D6C _ 8B. 4D, 0C
        mov     esi, dword [ecx+4H]                     ; 4D6F _ 8B. 71, 04
        mov     ecx, dword [ebp+10H]                    ; 4D72 _ 8B. 4D, 10
        add     ecx, esi                                ; 4D75 _ 01. F1
        sub     esp, 4                                  ; 4D77 _ 83. EC, 04
        push    edx                                     ; 4D7A _ 52
        push    eax                                     ; 4D7B _ 50
        push    ebx                                     ; 4D7C _ 53
        push    ecx                                     ; 4D7D _ 51
        push    dword [ebp+14H]                         ; 4D7E _ FF. 75, 14
        push    dword [ebp+10H]                         ; 4D81 _ FF. 75, 10
        push    dword [ebp+8H]                          ; 4D84 _ FF. 75, 08
        call    sheet_refreshsub                        ; 4D87 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 4D8C _ 83. C4, 20
?_332:  lea     esp, [ebp-8H]                           ; 4D8F _ 8D. 65, F8
        pop     ebx                                     ; 4D92 _ 5B
        pop     esi                                     ; 4D93 _ 5E
        pop     ebp                                     ; 4D94 _ 5D
        ret                                             ; 4D95 _ C3
; sheet_slide End of function

sheet_refreshsub:; Function begin
        push    ebp                                     ; 4D96 _ 55
        mov     ebp, esp                                ; 4D97 _ 89. E5
        sub     esp, 64                                 ; 4D99 _ 83. EC, 40
        mov     eax, dword [ebp+8H]                     ; 4D9C _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 4D9F _ 8B. 00
        mov     dword [ebp-20H], eax                    ; 4DA1 _ 89. 45, E0
        mov     eax, dword [ebp+8H]                     ; 4DA4 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 4DA7 _ 8B. 40, 04
        mov     dword [ebp-1CH], eax                    ; 4DAA _ 89. 45, E4
        cmp     dword [ebp+0CH], 0                      ; 4DAD _ 83. 7D, 0C, 00
        jns near      ?_333                                   ; 4db1 _ 79, 07
        mov     dword [ebp+0CH], 0                      ; 4DB3 _ C7. 45, 0C, 00000000
?_333:  cmp     dword [ebp+10H], 8                      ; 4DBA _ 83. 7D, 10, 08
        jg  near      ?_334                                   ; 4dbe _ 7f, 07
        mov     dword [ebp+10H], 0                      ; 4DC0 _ C7. 45, 10, 00000000
?_334:  mov     eax, dword [ebp+8H]                     ; 4DC7 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 4DCA _ 8B. 40, 08
        cmp     eax, dword [ebp+14H]                    ; 4DCD _ 3B. 45, 14
        jge near      ?_335                                   ; 4dd0 _ 7d, 09
        mov     eax, dword [ebp+8H]                     ; 4DD2 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 4DD5 _ 8B. 40, 08
        mov     dword [ebp+14H], eax                    ; 4DD8 _ 89. 45, 14
?_335:  mov     eax, dword [ebp+8H]                     ; 4DDB _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 4DDE _ 8B. 40, 0C
        cmp     eax, dword [ebp+18H]                    ; 4DE1 _ 3B. 45, 18
        jge near      ?_336                                   ; 4de4 _ 7d, 09
        mov     eax, dword [ebp+8H]                     ; 4DE6 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 4DE9 _ 8B. 40, 0C
        mov     dword [ebp+18H], eax                    ; 4DEC _ 89. 45, 18
?_336:  mov     eax, dword [ebp+1CH]                    ; 4DEF _ 8B. 45, 1C
        mov     dword [ebp-34H], eax                    ; 4DF2 _ 89. 45, CC
        jmp     ?_347                                   ; 4DF5 _ E9, 0000015A

?_337:  mov     eax, dword [ebp+8H]                     ; 4DFA _ 8B. 45, 08
        mov     edx, dword [ebp-34H]                    ; 4DFD _ 8B. 55, CC
        add     edx, 4                                  ; 4E00 _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 4E03 _ 8B. 44 90, 04
        mov     dword [ebp-18H], eax                    ; 4E07 _ 89. 45, E8
        mov     eax, dword [ebp-18H]                    ; 4E0A _ 8B. 45, E8
        mov     eax, dword [eax]                        ; 4E0D _ 8B. 00
        mov     dword [ebp-14H], eax                    ; 4E0F _ 89. 45, EC
        mov     eax, dword [ebp-18H]                    ; 4E12 _ 8B. 45, E8
        mov     edx, dword [ebp+8H]                     ; 4E15 _ 8B. 55, 08
        add     edx, 1044                               ; 4E18 _ 81. C2, 00000414
        sub     eax, edx                                ; 4E1E _ 29. D0
        sar     eax, 2                                  ; 4E20 _ C1. F8, 02
        imul    eax, eax, 954437177                     ; 4E23 _ 69. C0, 38E38E39
        mov     byte [ebp-35H], al                      ; 4E29 _ 88. 45, CB
        mov     eax, dword [ebp-18H]                    ; 4E2C _ 8B. 45, E8
        mov     eax, dword [eax+0CH]                    ; 4E2F _ 8B. 40, 0C
        mov     edx, dword [ebp+0CH]                    ; 4E32 _ 8B. 55, 0C
        sub     edx, eax                                ; 4E35 _ 29. C2
        mov     eax, edx                                ; 4E37 _ 89. D0
        mov     dword [ebp-10H], eax                    ; 4E39 _ 89. 45, F0
        mov     eax, dword [ebp-18H]                    ; 4E3C _ 8B. 45, E8
        mov     eax, dword [eax+10H]                    ; 4E3F _ 8B. 40, 10
        mov     edx, dword [ebp+10H]                    ; 4E42 _ 8B. 55, 10
        sub     edx, eax                                ; 4E45 _ 29. C2
        mov     eax, edx                                ; 4E47 _ 89. D0
        mov     dword [ebp-0CH], eax                    ; 4E49 _ 89. 45, F4
        mov     eax, dword [ebp-18H]                    ; 4E4C _ 8B. 45, E8
        mov     eax, dword [eax+0CH]                    ; 4E4F _ 8B. 40, 0C
        mov     edx, dword [ebp+14H]                    ; 4E52 _ 8B. 55, 14
        sub     edx, eax                                ; 4E55 _ 29. C2
        mov     eax, edx                                ; 4E57 _ 89. D0
        mov     dword [ebp-28H], eax                    ; 4E59 _ 89. 45, D8
        mov     eax, dword [ebp-18H]                    ; 4E5C _ 8B. 45, E8
        mov     eax, dword [eax+10H]                    ; 4E5F _ 8B. 40, 10
        mov     edx, dword [ebp+18H]                    ; 4E62 _ 8B. 55, 18
        sub     edx, eax                                ; 4E65 _ 29. C2
        mov     eax, edx                                ; 4E67 _ 89. D0
        mov     dword [ebp-24H], eax                    ; 4E69 _ 89. 45, DC
        cmp     dword [ebp-10H], 0                      ; 4E6C _ 83. 7D, F0, 00
        jns near      ?_338                                   ; 4e70 _ 79, 07
        mov     dword [ebp-10H], 0                      ; 4E72 _ C7. 45, F0, 00000000
?_338:  cmp     dword [ebp-0CH], 0                      ; 4E79 _ 83. 7D, F4, 00
        jns near      ?_339                                   ; 4e7d _ 79, 07
        mov     dword [ebp-0CH], 0                      ; 4E7F _ C7. 45, F4, 00000000
?_339:  mov     eax, dword [ebp-18H]                    ; 4E86 _ 8B. 45, E8
        mov     eax, dword [eax+4H]                     ; 4E89 _ 8B. 40, 04
        cmp     eax, dword [ebp-28H]                    ; 4E8C _ 3B. 45, D8
        jge near      ?_340                                   ; 4e8f _ 7d, 09
        mov     eax, dword [ebp-18H]                    ; 4E91 _ 8B. 45, E8
        mov     eax, dword [eax+4H]                     ; 4E94 _ 8B. 40, 04
        mov     dword [ebp-28H], eax                    ; 4E97 _ 89. 45, D8
?_340:  mov     eax, dword [ebp-18H]                    ; 4E9A _ 8B. 45, E8
        mov     eax, dword [eax+8H]                     ; 4E9D _ 8B. 40, 08
        cmp     eax, dword [ebp-24H]                    ; 4EA0 _ 3B. 45, DC
        jge near      ?_341                                   ; 4ea3 _ 7d, 09
        mov     eax, dword [ebp-18H]                    ; 4EA5 _ 8B. 45, E8
        mov     eax, dword [eax+8H]                     ; 4EA8 _ 8B. 40, 08
        mov     dword [ebp-24H], eax                    ; 4EAB _ 89. 45, DC
?_341:  mov     dword [ebp-2CH], 0                      ; 4EAE _ C7. 45, D4, 00000000
        jmp     ?_346                                   ; 4EB5 _ E9, 0000008A

?_342:  mov     eax, dword [ebp-18H]                    ; 4EBA _ 8B. 45, E8
        mov     edx, dword [eax+10H]                    ; 4EBD _ 8B. 50, 10
        mov     eax, dword [ebp-2CH]                    ; 4EC0 _ 8B. 45, D4
        add     eax, edx                                ; 4EC3 _ 01. D0
        mov     dword [ebp-8H], eax                     ; 4EC5 _ 89. 45, F8
        mov     dword [ebp-30H], 0                      ; 4EC8 _ C7. 45, D0, 00000000
        jmp     ?_345                                   ; 4ECF _ EB, 67

?_343:  mov     eax, dword [ebp-18H]                    ; 4ED1 _ 8B. 45, E8
        mov     edx, dword [eax+0CH]                    ; 4ED4 _ 8B. 50, 0C
        mov     eax, dword [ebp-30H]                    ; 4ED7 _ 8B. 45, D0
        add     eax, edx                                ; 4EDA _ 01. D0
        mov     dword [ebp-4H], eax                     ; 4EDC _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 4EDF _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 4EE2 _ 8B. 40, 08
        imul    eax, dword [ebp-8H]                     ; 4EE5 _ 0F AF. 45, F8
        mov     edx, eax                                ; 4EE9 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 4EEB _ 8B. 45, FC
        add     eax, edx                                ; 4EEE _ 01. D0
        mov     edx, eax                                ; 4EF0 _ 89. C2
        mov     eax, dword [ebp-1CH]                    ; 4EF2 _ 8B. 45, E4
        add     eax, edx                                ; 4EF5 _ 01. D0
        movzx   eax, byte [eax]                         ; 4EF7 _ 0F B6. 00
        cmp     al, byte [ebp-35H]                      ; 4EFA _ 3A. 45, CB
        jnz near      ?_344                                   ; 4efd _ 75, 35
        mov     eax, dword [ebp+8H]                     ; 4EFF _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 4F02 _ 8B. 40, 08
        imul    eax, dword [ebp-8H]                     ; 4F05 _ 0F AF. 45, F8
        mov     edx, eax                                ; 4F09 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 4F0B _ 8B. 45, FC
        add     eax, edx                                ; 4F0E _ 01. D0
        mov     edx, eax                                ; 4F10 _ 89. C2
        mov     eax, dword [ebp-20H]                    ; 4F12 _ 8B. 45, E0
        add     edx, eax                                ; 4F15 _ 01. C2
        mov     eax, dword [ebp-18H]                    ; 4F17 _ 8B. 45, E8
        mov     eax, dword [eax+4H]                     ; 4F1A _ 8B. 40, 04
        imul    eax, dword [ebp-2CH]                    ; 4F1D _ 0F AF. 45, D4
        mov     ecx, eax                                ; 4F21 _ 89. C1
        mov     eax, dword [ebp-30H]                    ; 4F23 _ 8B. 45, D0
        add     eax, ecx                                ; 4F26 _ 01. C8
        mov     ecx, eax                                ; 4F28 _ 89. C1
        mov     eax, dword [ebp-14H]                    ; 4F2A _ 8B. 45, EC
        add     eax, ecx                                ; 4F2D _ 01. C8
        movzx   eax, byte [eax]                         ; 4F2F _ 0F B6. 00
        mov     byte [edx], al                          ; 4F32 _ 88. 02
?_344:  add     dword [ebp-30H], 1                      ; 4F34 _ 83. 45, D0, 01
?_345:  mov     eax, dword [ebp-30H]                    ; 4F38 _ 8B. 45, D0
        cmp     eax, dword [ebp-28H]                    ; 4F3B _ 3B. 45, D8
        jl      ?_343                                   ; 4F3E _ 7C, 91
        add     dword [ebp-2CH], 1                      ; 4F40 _ 83. 45, D4, 01
?_346:  mov     eax, dword [ebp-2CH]                    ; 4F44 _ 8B. 45, D4
        cmp     eax, dword [ebp-24H]                    ; 4F47 _ 3B. 45, DC
        jl      ?_342                                   ; 4F4A _ 0F 8C, FFFFFF6A
        add     dword [ebp-34H], 1                      ; 4F50 _ 83. 45, CC, 01
?_347:  mov     eax, dword [ebp-34H]                    ; 4F54 _ 8B. 45, CC
        cmp     eax, dword [ebp+20H]                    ; 4F57 _ 3B. 45, 20
        jle near      ?_337                                   ; 4f5a _ 0f 8e, fffffe9a
        leave                                           ; 4F60 _ C9
        ret                                             ; 4F61 _ C3
; sheet_refreshsub End of function

sheet_refreshmap:; Function begin
        push    ebp                                     ; 4F62 _ 55
        mov     ebp, esp                                ; 4F63 _ 89. E5
        sub     esp, 64                                 ; 4F65 _ 83. EC, 40
        mov     eax, dword [ebp+8H]                     ; 4F68 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 4F6B _ 8B. 40, 04
        mov     dword [ebp-14H], eax                    ; 4F6E _ 89. 45, EC
        cmp     dword [ebp+0CH], 0                      ; 4F71 _ 83. 7D, 0C, 00
        jns near      ?_348                                   ; 4f75 _ 79, 07
        mov     dword [ebp+0CH], 0                      ; 4F77 _ C7. 45, 0C, 00000000
?_348:  cmp     dword [ebp+10H], 0                      ; 4F7E _ 83. 7D, 10, 00
        jns near      ?_349                                   ; 4f82 _ 79, 07
        mov     dword [ebp+10H], 0                      ; 4F84 _ C7. 45, 10, 00000000
?_349:  mov     eax, dword [ebp+8H]                     ; 4F8B _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 4F8E _ 8B. 40, 08
        cmp     eax, dword [ebp+14H]                    ; 4F91 _ 3B. 45, 14
        jge near      ?_350                                   ; 4f94 _ 7d, 09
        mov     eax, dword [ebp+8H]                     ; 4F96 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 4F99 _ 8B. 40, 08
        mov     dword [ebp+14H], eax                    ; 4F9C _ 89. 45, 14
?_350:  mov     eax, dword [ebp+8H]                     ; 4F9F _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 4FA2 _ 8B. 40, 0C
        cmp     eax, dword [ebp+18H]                    ; 4FA5 _ 3B. 45, 18
        jge near      ?_351                                   ; 4fa8 _ 7d, 09
        mov     eax, dword [ebp+8H]                     ; 4FAA _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 4FAD _ 8B. 40, 0C
        mov     dword [ebp+18H], eax                    ; 4FB0 _ 89. 45, 18
?_351:  mov     eax, dword [ebp+1CH]                    ; 4FB3 _ 8B. 45, 1C
        mov     dword [ebp-30H], eax                    ; 4FB6 _ 89. 45, D0
        jmp     ?_362                                   ; 4FB9 _ E9, 00000146

?_352:  mov     eax, dword [ebp+8H]                     ; 4FBE _ 8B. 45, 08
        mov     edx, dword [ebp-30H]                    ; 4FC1 _ 8B. 55, D0
        add     edx, 4                                  ; 4FC4 _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 4FC7 _ 8B. 44 90, 04
        mov     dword [ebp-10H], eax                    ; 4FCB _ 89. 45, F0
        mov     eax, dword [ebp-10H]                    ; 4FCE _ 8B. 45, F0
        mov     edx, dword [ebp+8H]                     ; 4FD1 _ 8B. 55, 08
        add     edx, 1044                               ; 4FD4 _ 81. C2, 00000414
        sub     eax, edx                                ; 4FDA _ 29. D0
        sar     eax, 2                                  ; 4FDC _ C1. F8, 02
        imul    eax, eax, 954437177                     ; 4FDF _ 69. C0, 38E38E39
        mov     byte [ebp-31H], al                      ; 4FE5 _ 88. 45, CF
        mov     eax, dword [ebp-10H]                    ; 4FE8 _ 8B. 45, F0
        mov     eax, dword [eax]                        ; 4FEB _ 8B. 00
        mov     dword [ebp-0CH], eax                    ; 4FED _ 89. 45, F4
        mov     eax, dword [ebp-10H]                    ; 4FF0 _ 8B. 45, F0
        mov     eax, dword [eax+0CH]                    ; 4FF3 _ 8B. 40, 0C
        mov     edx, dword [ebp+0CH]                    ; 4FF6 _ 8B. 55, 0C
        sub     edx, eax                                ; 4FF9 _ 29. C2
        mov     eax, edx                                ; 4FFB _ 89. D0
        mov     dword [ebp-24H], eax                    ; 4FFD _ 89. 45, DC
        mov     eax, dword [ebp-10H]                    ; 5000 _ 8B. 45, F0
        mov     eax, dword [eax+10H]                    ; 5003 _ 8B. 40, 10
        mov     edx, dword [ebp+10H]                    ; 5006 _ 8B. 55, 10
        sub     edx, eax                                ; 5009 _ 29. C2
        mov     eax, edx                                ; 500B _ 89. D0
        mov     dword [ebp-20H], eax                    ; 500D _ 89. 45, E0
        mov     eax, dword [ebp-10H]                    ; 5010 _ 8B. 45, F0
        mov     eax, dword [eax+0CH]                    ; 5013 _ 8B. 40, 0C
        mov     edx, dword [ebp+14H]                    ; 5016 _ 8B. 55, 14
        sub     edx, eax                                ; 5019 _ 29. C2
        mov     eax, edx                                ; 501B _ 89. D0
        mov     dword [ebp-1CH], eax                    ; 501D _ 89. 45, E4
        mov     eax, dword [ebp-10H]                    ; 5020 _ 8B. 45, F0
        mov     eax, dword [eax+10H]                    ; 5023 _ 8B. 40, 10
        mov     edx, dword [ebp+18H]                    ; 5026 _ 8B. 55, 18
        sub     edx, eax                                ; 5029 _ 29. C2
        mov     eax, edx                                ; 502B _ 89. D0
        mov     dword [ebp-18H], eax                    ; 502D _ 89. 45, E8
        cmp     dword [ebp-24H], 0                      ; 5030 _ 83. 7D, DC, 00
        jns near      ?_353                                   ; 5034 _ 79, 07
        mov     dword [ebp-24H], 0                      ; 5036 _ C7. 45, DC, 00000000
?_353:  cmp     dword [ebp-20H], 0                      ; 503D _ 83. 7D, E0, 00
        jns near      ?_354                                   ; 5041 _ 79, 07
        mov     dword [ebp-20H], 0                      ; 5043 _ C7. 45, E0, 00000000
?_354:  mov     eax, dword [ebp-10H]                    ; 504A _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 504D _ 8B. 40, 04
        cmp     eax, dword [ebp-1CH]                    ; 5050 _ 3B. 45, E4
        jge near      ?_355                                   ; 5053 _ 7d, 09
        mov     eax, dword [ebp-10H]                    ; 5055 _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 5058 _ 8B. 40, 04
        mov     dword [ebp-1CH], eax                    ; 505B _ 89. 45, E4
?_355:  mov     eax, dword [ebp-10H]                    ; 505E _ 8B. 45, F0
        mov     eax, dword [eax+8H]                     ; 5061 _ 8B. 40, 08
        cmp     eax, dword [ebp-18H]                    ; 5064 _ 3B. 45, E8
        jge near      ?_356                                   ; 5067 _ 7d, 09
        mov     eax, dword [ebp-10H]                    ; 5069 _ 8B. 45, F0
        mov     eax, dword [eax+8H]                     ; 506C _ 8B. 40, 08
        mov     dword [ebp-18H], eax                    ; 506F _ 89. 45, E8
?_356:  mov     eax, dword [ebp-20H]                    ; 5072 _ 8B. 45, E0
        mov     dword [ebp-28H], eax                    ; 5075 _ 89. 45, D8
        jmp     ?_361                                   ; 5078 _ EB, 7A

?_357:  mov     eax, dword [ebp-10H]                    ; 507A _ 8B. 45, F0
        mov     edx, dword [eax+10H]                    ; 507D _ 8B. 50, 10
        mov     eax, dword [ebp-28H]                    ; 5080 _ 8B. 45, D8
        add     eax, edx                                ; 5083 _ 01. D0
        mov     dword [ebp-8H], eax                     ; 5085 _ 89. 45, F8
        mov     eax, dword [ebp-24H]                    ; 5088 _ 8B. 45, DC
        mov     dword [ebp-2CH], eax                    ; 508B _ 89. 45, D4
        jmp     ?_360                                   ; 508E _ EB, 58

?_358:  mov     eax, dword [ebp-10H]                    ; 5090 _ 8B. 45, F0
        mov     edx, dword [eax+0CH]                    ; 5093 _ 8B. 50, 0C
        mov     eax, dword [ebp-2CH]                    ; 5096 _ 8B. 45, D4
        add     eax, edx                                ; 5099 _ 01. D0
        mov     dword [ebp-4H], eax                     ; 509B _ 89. 45, FC
        mov     eax, dword [ebp-10H]                    ; 509E _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 50A1 _ 8B. 40, 04
        imul    eax, dword [ebp-28H]                    ; 50A4 _ 0F AF. 45, D8
        mov     edx, eax                                ; 50A8 _ 89. C2
        mov     eax, dword [ebp-2CH]                    ; 50AA _ 8B. 45, D4
        add     eax, edx                                ; 50AD _ 01. D0
        mov     edx, eax                                ; 50AF _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 50B1 _ 8B. 45, F4
        add     eax, edx                                ; 50B4 _ 01. D0
        movzx   eax, byte [eax]                         ; 50B6 _ 0F B6. 00
        movzx   edx, al                                 ; 50B9 _ 0F B6. D0
        mov     eax, dword [ebp-10H]                    ; 50BC _ 8B. 45, F0
        mov     eax, dword [eax+14H]                    ; 50BF _ 8B. 40, 14
        cmp     edx, eax                                ; 50C2 _ 39. C2
        jz near       ?_359                                   ; 50c4 _ 74, 1e
        mov     eax, dword [ebp+8H]                     ; 50C6 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 50C9 _ 8B. 40, 08
        imul    eax, dword [ebp-8H]                     ; 50CC _ 0F AF. 45, F8
        mov     edx, eax                                ; 50D0 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 50D2 _ 8B. 45, FC
        add     eax, edx                                ; 50D5 _ 01. D0
        mov     edx, eax                                ; 50D7 _ 89. C2
        mov     eax, dword [ebp-14H]                    ; 50D9 _ 8B. 45, EC
        add     edx, eax                                ; 50DC _ 01. C2
        movzx   eax, byte [ebp-31H]                     ; 50DE _ 0F B6. 45, CF
        mov     byte [edx], al                          ; 50E2 _ 88. 02
?_359:  add     dword [ebp-2CH], 1                      ; 50E4 _ 83. 45, D4, 01
?_360:  mov     eax, dword [ebp-2CH]                    ; 50E8 _ 8B. 45, D4
        cmp     eax, dword [ebp-1CH]                    ; 50EB _ 3B. 45, E4
        jl      ?_358                                   ; 50EE _ 7C, A0
        add     dword [ebp-28H], 1                      ; 50F0 _ 83. 45, D8, 01
?_361:  mov     eax, dword [ebp-28H]                    ; 50F4 _ 8B. 45, D8
        cmp     eax, dword [ebp-18H]                    ; 50F7 _ 3B. 45, E8
        jl      ?_357                                   ; 50FA _ 0F 8C, FFFFFF7A
        add     dword [ebp-30H], 1                      ; 5100 _ 83. 45, D0, 01
?_362:  mov     eax, dword [ebp+8H]                     ; 5104 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 5107 _ 8B. 40, 10
        cmp     eax, dword [ebp-30H]                    ; 510A _ 3B. 45, D0
        jge near      ?_352                                   ; 510d _ 0f 8d, fffffeab
        nop                                             ; 5113 _ 90
        leave                                           ; 5114 _ C9
        ret                                             ; 5115 _ C3
; sheet_refreshmap End of function

sheet_free:; Function begin
        push    ebp                                     ; 5116 _ 55
        mov     ebp, esp                                ; 5117 _ 89. E5
        sub     esp, 8                                  ; 5119 _ 83. EC, 08
        mov     eax, dword [ebp+0CH]                    ; 511C _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 511F _ 8B. 40, 18
        test    eax, eax                                ; 5122 _ 85. C0
        js near       ?_363                                   ; 5124 _ 78, 13
        sub     esp, 4                                  ; 5126 _ 83. EC, 04
        push    -1                                      ; 5129 _ 6A, FF
        push    dword [ebp+0CH]                         ; 512B _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 512E _ FF. 75, 08
        call    sheet_updown                            ; 5131 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 5136 _ 83. C4, 10
?_363:  mov     eax, dword [ebp+0CH]                    ; 5139 _ 8B. 45, 0C
        mov     dword [eax+1CH], 0                      ; 513C _ C7. 40, 1C, 00000000
        nop                                             ; 5143 _ 90
        leave                                           ; 5144 _ C9
        ret                                             ; 5145 _ C3
; sheet_free End of function

init_pit:; Function begin
        push    ebp                                     ; 5146 _ 55
        mov     ebp, esp                                ; 5147 _ 89. E5
        sub     esp, 24                                 ; 5149 _ 83. EC, 18
        sub     esp, 8                                  ; 514C _ 83. EC, 08
        push    52                                      ; 514F _ 6A, 34
        push    67                                      ; 5151 _ 6A, 43
        call    io_out8                                 ; 5153 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 5158 _ 83. C4, 10
        sub     esp, 8                                  ; 515B _ 83. EC, 08
        push    156                                     ; 515E _ 68, 0000009C
        push    64                                      ; 5163 _ 6A, 40
        call    io_out8                                 ; 5165 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 516A _ 83. C4, 10
        sub     esp, 8                                  ; 516D _ 83. EC, 08
        push    46                                      ; 5170 _ 6A, 2E
        push    64                                      ; 5172 _ 6A, 40
        call    io_out8                                 ; 5174 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 5179 _ 83. C4, 10
        mov     dword [timerctl], 0                     ; 517C _ C7. 05, 000003C0(d), 00000000
        mov     dword [ebp-0CH], 0                      ; 5186 _ C7. 45, F4, 00000000
        jmp     ?_365                                   ; 518D _ EB, 28

?_364:  mov     eax, dword [ebp-0CH]                    ; 518F _ 8B. 45, F4
        shl     eax, 4                                  ; 5192 _ C1. E0, 04
        add     eax, timerctl                           ; 5195 _ 05, 000003C0(d)
        mov     dword [eax+8H], 0                       ; 519A _ C7. 40, 08, 00000000
        mov     eax, dword [ebp-0CH]                    ; 51A1 _ 8B. 45, F4
        shl     eax, 4                                  ; 51A4 _ C1. E0, 04
        add     eax, timerctl                           ; 51A7 _ 05, 000003C0(d)
        mov     dword [eax+0CH], 0                      ; 51AC _ C7. 40, 0C, 00000000
        add     dword [ebp-0CH], 1                      ; 51B3 _ 83. 45, F4, 01
?_365:  cmp     dword [ebp-0CH], 499                    ; 51B7 _ 81. 7D, F4, 000001F3
        jle near      ?_364                                   ; 51be _ 7e, cf
        leave                                           ; 51C0 _ C9
        ret                                             ; 51C1 _ C3
; init_pit End of function

timer_alloc:; Function begin
        push    ebp                                     ; 51C2 _ 55
        mov     ebp, esp                                ; 51C3 _ 89. E5
        sub     esp, 16                                 ; 51C5 _ 83. EC, 10
        mov     dword [ebp-4H], 0                       ; 51C8 _ C7. 45, FC, 00000000
        jmp     ?_368                                   ; 51CF _ EB, 38

?_366:  mov     eax, dword [ebp-4H]                     ; 51D1 _ 8B. 45, FC
        shl     eax, 4                                  ; 51D4 _ C1. E0, 04
        add     eax, timerctl                           ; 51D7 _ 05, 000003C0(d)
        mov     eax, dword [eax+8H]                     ; 51DC _ 8B. 40, 08
        test    eax, eax                                ; 51DF _ 85. C0
        jnz near      ?_367                                   ; 51e1 _ 75, 22
        mov     eax, dword [ebp-4H]                     ; 51E3 _ 8B. 45, FC
        shl     eax, 4                                  ; 51E6 _ C1. E0, 04
        add     eax, timerctl                           ; 51E9 _ 05, 000003C0(d)
        mov     dword [eax+8H], 1                       ; 51EE _ C7. 40, 08, 00000001
        mov     eax, dword [ebp-4H]                     ; 51F5 _ 8B. 45, FC
        shl     eax, 4                                  ; 51F8 _ C1. E0, 04
        add     eax, timerctl                           ; 51FB _ 05, 000003C0(d)
        add     eax, 4                                  ; 5200 _ 83. C0, 04
        jmp     ?_369                                   ; 5203 _ EB, 12

?_367:  add     dword [ebp-4H], 1                       ; 5205 _ 83. 45, FC, 01
?_368:  cmp     dword [ebp-4H], 499                     ; 5209 _ 81. 7D, FC, 000001F3
        jle near      ?_366                                   ; 5210 _ 7e, bf
        mov     eax, 0                                  ; 5212 _ B8, 00000000
?_369:  leave                                           ; 5217 _ C9
        ret                                             ; 5218 _ C3
; timer_alloc End of function

timer_free:; Function begin
        push    ebp                                     ; 5219 _ 55
        mov     ebp, esp                                ; 521A _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 521C _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 521F _ C7. 40, 04, 00000000
        nop                                             ; 5226 _ 90
        pop     ebp                                     ; 5227 _ 5D
        ret                                             ; 5228 _ C3
; timer_free End of function

timer_init:; Function begin
        push    ebp                                     ; 5229 _ 55
        mov     ebp, esp                                ; 522A _ 89. E5
        sub     esp, 4                                  ; 522C _ 83. EC, 04
        mov     eax, dword [ebp+10H]                    ; 522F _ 8B. 45, 10
        mov     byte [ebp-4H], al                       ; 5232 _ 88. 45, FC
        mov     eax, dword [ebp+8H]                     ; 5235 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 5238 _ 8B. 55, 0C
        mov     dword [eax+8H], edx                     ; 523B _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 523E _ 8B. 45, 08
        movzx   edx, byte [ebp-4H]                      ; 5241 _ 0F B6. 55, FC
        mov     byte [eax+0CH], dl                      ; 5245 _ 88. 50, 0C
        nop                                             ; 5248 _ 90
        leave                                           ; 5249 _ C9
        ret                                             ; 524A _ C3
; timer_init End of function

timer_settime:; Function begin
        push    ebp                                     ; 524B _ 55
        mov     ebp, esp                                ; 524C _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 524E _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 5251 _ 8B. 55, 0C
        mov     dword [eax], edx                        ; 5254 _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 5256 _ 8B. 45, 08
        mov     dword [eax+4H], 2                       ; 5259 _ C7. 40, 04, 00000002
        nop                                             ; 5260 _ 90
        pop     ebp                                     ; 5261 _ 5D
        ret                                             ; 5262 _ C3
; timer_settime End of function

intHandlerForTimer:; Function begin
        push    ebp                                     ; 5263 _ 55
        mov     ebp, esp                                ; 5264 _ 89. E5
        sub     esp, 24                                 ; 5266 _ 83. EC, 18
        sub     esp, 8                                  ; 5269 _ 83. EC, 08
        push    32                                      ; 526C _ 6A, 20
        push    32                                      ; 526E _ 6A, 20
        call    io_out8                                 ; 5270 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 5275 _ 83. C4, 10
        mov     eax, dword [timerctl]                   ; 5278 _ A1, 000003C0(d)
        add     eax, 1                                  ; 527D _ 83. C0, 01
        mov     dword [timerctl], eax                   ; 5280 _ A3, 000003C0(d)
        mov     byte [ebp-0DH], 0                       ; 5285 _ C6. 45, F3, 00
        mov     dword [ebp-0CH], 0                      ; 5289 _ C7. 45, F4, 00000000
        jmp     ?_373                                   ; 5290 _ E9, 000000B1

?_370:  mov     eax, dword [ebp-0CH]                    ; 5295 _ 8B. 45, F4
        shl     eax, 4                                  ; 5298 _ C1. E0, 04
        add     eax, timerctl                           ; 529B _ 05, 000003C0(d)
        mov     eax, dword [eax+8H]                     ; 52A0 _ 8B. 40, 08
        cmp     eax, 2                                  ; 52A3 _ 83. F8, 02
        jne near      ?_371                                   ; 52a6 _ 0f 85, 0000008b
        mov     eax, dword [ebp-0CH]                    ; 52AC _ 8B. 45, F4
        shl     eax, 4                                  ; 52AF _ C1. E0, 04
        add     eax, timerctl                           ; 52B2 _ 05, 000003C0(d)
        mov     eax, dword [eax+4H]                     ; 52B7 _ 8B. 40, 04
        lea     edx, [eax-1H]                           ; 52BA _ 8D. 50, FF
        mov     eax, dword [ebp-0CH]                    ; 52BD _ 8B. 45, F4
        shl     eax, 4                                  ; 52C0 _ C1. E0, 04
        add     eax, timerctl                           ; 52C3 _ 05, 000003C0(d)
        mov     dword [eax+4H], edx                     ; 52C8 _ 89. 50, 04
        mov     eax, dword [ebp-0CH]                    ; 52CB _ 8B. 45, F4
        shl     eax, 4                                  ; 52CE _ C1. E0, 04
        add     eax, timerctl                           ; 52D1 _ 05, 000003C0(d)
        mov     eax, dword [eax+4H]                     ; 52D6 _ 8B. 40, 04
        test    eax, eax                                ; 52D9 _ 85. C0
        jnz near      ?_371                                   ; 52db _ 75, 5a
        mov     eax, dword [ebp-0CH]                    ; 52DD _ 8B. 45, F4
        shl     eax, 4                                  ; 52E0 _ C1. E0, 04
        add     eax, timerctl                           ; 52E3 _ 05, 000003C0(d)
        mov     dword [eax+8H], 1                       ; 52E8 _ C7. 40, 08, 00000001
        mov     eax, dword [ebp-0CH]                    ; 52EF _ 8B. 45, F4
        shl     eax, 4                                  ; 52F2 _ C1. E0, 04
        add     eax, timerctl                           ; 52F5 _ 05, 000003C0(d)
        movzx   eax, byte [eax+10H]                     ; 52FA _ 0F B6. 40, 10
        movzx   edx, al                                 ; 52FE _ 0F B6. D0
        mov     eax, dword [ebp-0CH]                    ; 5301 _ 8B. 45, F4
        shl     eax, 4                                  ; 5304 _ C1. E0, 04
        add     eax, timerctl                           ; 5307 _ 05, 000003C0(d)
        mov     eax, dword [eax+0CH]                    ; 530C _ 8B. 40, 0C
        sub     esp, 8                                  ; 530F _ 83. EC, 08
        push    edx                                     ; 5312 _ 52
        push    eax                                     ; 5313 _ 50
        call    fifo8_put                               ; 5314 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 5319 _ 83. C4, 10
        mov     eax, dword [ebp-0CH]                    ; 531C _ 8B. 45, F4
        shl     eax, 4                                  ; 531F _ C1. E0, 04
        add     eax, timerctl                           ; 5322 _ 05, 000003C0(d)
        lea     edx, [eax+4H]                           ; 5327 _ 8D. 50, 04
        mov     eax, dword [task_timer]                 ; 532A _ A1, 00000000(d)
        cmp     edx, eax                                ; 532F _ 39. C2
        jnz near      ?_371                                   ; 5331 _ 75, 04
        mov     byte [ebp-0DH], 1                       ; 5333 _ C6. 45, F3, 01
?_371:  cmp     byte [ebp-0DH], 0                       ; 5337 _ 80. 7D, F3, 00
        jz near       ?_372                                   ; 533b _ 74, 05
        call    task_switch                             ; 533D _ E8, FFFFFFFC(rel)
?_372:  add     dword [ebp-0CH], 1                      ; 5342 _ 83. 45, F4, 01
?_373:  cmp     dword [ebp-0CH], 499                    ; 5346 _ 81. 7D, F4, 000001F3
        jle near      ?_370                                   ; 534d _ 0f 8e, ffffff42
        nop                                             ; 5353 _ 90
        leave                                           ; 5354 _ C9
        ret                                             ; 5355 _ C3
; intHandlerForTimer End of function

getTimerController:; Function begin
        push    ebp                                     ; 5356 _ 55
        mov     ebp, esp                                ; 5357 _ 89. E5
        mov     eax, timerctl                           ; 5359 _ B8, 000003C0(d)
        pop     ebp                                     ; 535E _ 5D
        ret                                             ; 535F _ C3
; getTimerController End of function

fifo8_init:; Function begin
        push    ebp                                     ; 5360 _ 55
        mov     ebp, esp                                ; 5361 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 5363 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 5366 _ 8B. 55, 0C
        mov     dword [eax+0CH], edx                    ; 5369 _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 536C _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 536F _ 8B. 55, 10
        mov     dword [eax], edx                        ; 5372 _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 5374 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 5377 _ 8B. 55, 0C
        mov     dword [eax+10H], edx                    ; 537A _ 89. 50, 10
        mov     eax, dword [ebp+8H]                     ; 537D _ 8B. 45, 08
        mov     dword [eax+14H], 0                      ; 5380 _ C7. 40, 14, 00000000
        mov     eax, dword [ebp+8H]                     ; 5387 _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 538A _ C7. 40, 04, 00000000
        mov     eax, dword [ebp+8H]                     ; 5391 _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 5394 _ C7. 40, 08, 00000000
        mov     eax, dword [ebp+8H]                     ; 539B _ 8B. 45, 08
        mov     edx, dword [ebp+14H]                    ; 539E _ 8B. 55, 14
        mov     dword [eax+18H], edx                    ; 53A1 _ 89. 50, 18
        nop                                             ; 53A4 _ 90
        pop     ebp                                     ; 53A5 _ 5D
        ret                                             ; 53A6 _ C3
; fifo8_init End of function

fifo8_put:; Function begin
        push    ebp                                     ; 53A7 _ 55
        mov     ebp, esp                                ; 53A8 _ 89. E5
        sub     esp, 24                                 ; 53AA _ 83. EC, 18
        mov     eax, dword [ebp+0CH]                    ; 53AD _ 8B. 45, 0C
        mov     byte [ebp-0CH], al                      ; 53B0 _ 88. 45, F4
        cmp     dword [ebp+8H], 0                       ; 53B3 _ 83. 7D, 08, 00
        jnz near      ?_374                                   ; 53b7 _ 75, 0a
        mov     eax, 4294967295                         ; 53B9 _ B8, FFFFFFFF
        jmp     ?_378                                   ; 53BE _ E9, 000000AA

?_374:  mov     eax, dword [ebp+8H]                     ; 53C3 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 53C6 _ 8B. 40, 10
        test    eax, eax                                ; 53C9 _ 85. C0
        jnz near      ?_375                                   ; 53cb _ 75, 1b
        mov     eax, dword [ebp+8H]                     ; 53CD _ 8B. 45, 08
        mov     eax, dword [eax+14H]                    ; 53D0 _ 8B. 40, 14
        or      eax, 01H                                ; 53D3 _ 83. C8, 01
        mov     edx, eax                                ; 53D6 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 53D8 _ 8B. 45, 08
        mov     dword [eax+14H], edx                    ; 53DB _ 89. 50, 14
        mov     eax, 4294967294                         ; 53DE _ B8, FFFFFFFE
        jmp     ?_378                                   ; 53E3 _ E9, 00000085

?_375:  mov     eax, dword [ebp+8H]                     ; 53E8 _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 53EB _ 8B. 10
        mov     eax, dword [ebp+8H]                     ; 53ED _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 53F0 _ 8B. 40, 04
        add     edx, eax                                ; 53F3 _ 01. C2
        movzx   eax, byte [ebp-0CH]                     ; 53F5 _ 0F B6. 45, F4
        mov     byte [edx], al                          ; 53F9 _ 88. 02
        mov     eax, dword [ebp+8H]                     ; 53FB _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 53FE _ 8B. 40, 04
        lea     edx, [eax+1H]                           ; 5401 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 5404 _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 5407 _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 540A _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 540D _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 5410 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 5413 _ 8B. 40, 0C
        cmp     edx, eax                                ; 5416 _ 39. C2
        jnz near      ?_376                                   ; 5418 _ 75, 0a
        mov     eax, dword [ebp+8H]                     ; 541A _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 541D _ C7. 40, 04, 00000000
?_376:  mov     eax, dword [ebp+8H]                     ; 5424 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 5427 _ 8B. 40, 10
        lea     edx, [eax-1H]                           ; 542A _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 542D _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 5430 _ 89. 50, 10
        mov     eax, dword [ebp+8H]                     ; 5433 _ 8B. 45, 08
        mov     eax, dword [eax+18H]                    ; 5436 _ 8B. 40, 18
        test    eax, eax                                ; 5439 _ 85. C0
        jz near       ?_377                                   ; 543b _ 74, 2b
        mov     eax, dword [ebp+8H]                     ; 543D _ 8B. 45, 08
        mov     eax, dword [eax+18H]                    ; 5440 _ 8B. 40, 18
        mov     eax, dword [eax+4H]                     ; 5443 _ 8B. 40, 04
        cmp     eax, 2                                  ; 5446 _ 83. F8, 02
        jz near       ?_377                                   ; 5449 _ 74, 1d
        mov     eax, dword [ebp+8H]                     ; 544B _ 8B. 45, 08
        mov     eax, dword [eax+18H]                    ; 544E _ 8B. 40, 18
        sub     esp, 4                                  ; 5451 _ 83. EC, 04
        push    0                                       ; 5454 _ 6A, 00
        push    -1                                      ; 5456 _ 6A, FF
        push    eax                                     ; 5458 _ 50
        call    task_run                                ; 5459 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 545E _ 83. C4, 10
        mov     eax, 1                                  ; 5461 _ B8, 00000001
        jmp     ?_378                                   ; 5466 _ EB, 05

?_377:  mov     eax, 0                                  ; 5468 _ B8, 00000000
?_378:  leave                                           ; 546D _ C9
        ret                                             ; 546E _ C3
; fifo8_put End of function

fifo8_get:; Function begin
        push    ebp                                     ; 546F _ 55
        mov     ebp, esp                                ; 5470 _ 89. E5
        sub     esp, 16                                 ; 5472 _ 83. EC, 10
        mov     eax, dword [ebp+8H]                     ; 5475 _ 8B. 45, 08
        mov     edx, dword [eax+10H]                    ; 5478 _ 8B. 50, 10
        mov     eax, dword [ebp+8H]                     ; 547B _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 547E _ 8B. 40, 0C
        cmp     edx, eax                                ; 5481 _ 39. C2
        jnz near      ?_379                                   ; 5483 _ 75, 07
        mov     eax, 4294967295                         ; 5485 _ B8, FFFFFFFF
        jmp     ?_381                                   ; 548A _ EB, 51

?_379:  mov     eax, dword [ebp+8H]                     ; 548C _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 548F _ 8B. 10
        mov     eax, dword [ebp+8H]                     ; 5491 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 5494 _ 8B. 40, 08
        add     eax, edx                                ; 5497 _ 01. D0
        movzx   eax, byte [eax]                         ; 5499 _ 0F B6. 00
        movzx   eax, al                                 ; 549C _ 0F B6. C0
        mov     dword [ebp-4H], eax                     ; 549F _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 54A2 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 54A5 _ 8B. 40, 08
        lea     edx, [eax+1H]                           ; 54A8 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 54AB _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 54AE _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 54B1 _ 8B. 45, 08
        mov     edx, dword [eax+8H]                     ; 54B4 _ 8B. 50, 08
        mov     eax, dword [ebp+8H]                     ; 54B7 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 54BA _ 8B. 40, 0C
        cmp     edx, eax                                ; 54BD _ 39. C2
        jnz near      ?_380                                   ; 54bf _ 75, 0a
        mov     eax, dword [ebp+8H]                     ; 54C1 _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 54C4 _ C7. 40, 08, 00000000
?_380:  mov     eax, dword [ebp+8H]                     ; 54CB _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 54CE _ 8B. 40, 10
        lea     edx, [eax+1H]                           ; 54D1 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 54D4 _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 54D7 _ 89. 50, 10
        mov     eax, dword [ebp-4H]                     ; 54DA _ 8B. 45, FC
?_381:  leave                                           ; 54DD _ C9
        ret                                             ; 54DE _ C3
; fifo8_get End of function

fifo8_status:; Function begin
        push    ebp                                     ; 54DF _ 55
        mov     ebp, esp                                ; 54E0 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 54E2 _ 8B. 45, 08
        mov     edx, dword [eax+0CH]                    ; 54E5 _ 8B. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 54E8 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 54EB _ 8B. 40, 10
        sub     edx, eax                                ; 54EE _ 29. C2
        mov     eax, edx                                ; 54F0 _ 89. D0
        pop     ebp                                     ; 54F2 _ 5D
        ret                                             ; 54F3 _ C3
; fifo8_status End of function

strcmp: ; Function begin
        push    ebp                                     ; 54F4 _ 55
        mov     ebp, esp                                ; 54F5 _ 89. E5
        sub     esp, 16                                 ; 54F7 _ 83. EC, 10
        cmp     dword [ebp+8H], 0                       ; 54FA _ 83. 7D, 08, 00
        jz near       ?_382                                   ; 54fe _ 74, 06
        cmp     dword [ebp+0CH], 0                      ; 5500 _ 83. 7D, 0C, 00
        jnz near      ?_383                                   ; 5504 _ 75, 0a
?_382:  mov     eax, 0                                  ; 5506 _ B8, 00000000
        jmp     ?_390                                   ; 550B _ E9, 0000009B

?_383:  mov     dword [ebp-4H], 0                       ; 5510 _ C7. 45, FC, 00000000
        jmp     ?_386                                   ; 5517 _ EB, 25

?_384:  mov     edx, dword [ebp-4H]                     ; 5519 _ 8B. 55, FC
        mov     eax, dword [ebp+8H]                     ; 551C _ 8B. 45, 08
        add     eax, edx                                ; 551F _ 01. D0
        movzx   edx, byte [eax]                         ; 5521 _ 0F B6. 10
        mov     ecx, dword [ebp-4H]                     ; 5524 _ 8B. 4D, FC
        mov     eax, dword [ebp+0CH]                    ; 5527 _ 8B. 45, 0C
        add     eax, ecx                                ; 552A _ 01. C8
        movzx   eax, byte [eax]                         ; 552C _ 0F B6. 00
        cmp     dl, al                                  ; 552F _ 38. C2
        jz near       ?_385                                   ; 5531 _ 74, 07
        mov     eax, 0                                  ; 5533 _ B8, 00000000
        jmp     ?_390                                   ; 5538 _ EB, 71

?_385:  add     dword [ebp-4H], 1                       ; 553A _ 83. 45, FC, 01
?_386:  mov     edx, dword [ebp-4H]                     ; 553E _ 8B. 55, FC
        mov     eax, dword [ebp+8H]                     ; 5541 _ 8B. 45, 08
        add     eax, edx                                ; 5544 _ 01. D0
        movzx   eax, byte [eax]                         ; 5546 _ 0F B6. 00
        test    al, al                                  ; 5549 _ 84. C0
        jz near       ?_387                                   ; 554b _ 74, 0f
        mov     edx, dword [ebp-4H]                     ; 554D _ 8B. 55, FC
        mov     eax, dword [ebp+0CH]                    ; 5550 _ 8B. 45, 0C
        add     eax, edx                                ; 5553 _ 01. D0
        movzx   eax, byte [eax]                         ; 5555 _ 0F B6. 00
        test    al, al                                  ; 5558 _ 84. C0
        jnz near      ?_384                                   ; 555a _ 75, bd
?_387:  mov     edx, dword [ebp-4H]                     ; 555C _ 8B. 55, FC
        mov     eax, dword [ebp+8H]                     ; 555F _ 8B. 45, 08
        add     eax, edx                                ; 5562 _ 01. D0
        movzx   eax, byte [eax]                         ; 5564 _ 0F B6. 00
        test    al, al                                  ; 5567 _ 84. C0
        jnz near      ?_388                                   ; 5569 _ 75, 16
        mov     edx, dword [ebp-4H]                     ; 556B _ 8B. 55, FC
        mov     eax, dword [ebp+0CH]                    ; 556E _ 8B. 45, 0C
        add     eax, edx                                ; 5571 _ 01. D0
        movzx   eax, byte [eax]                         ; 5573 _ 0F B6. 00
        test    al, al                                  ; 5576 _ 84. C0
        jz near       ?_388                                   ; 5578 _ 74, 07
        mov     eax, 0                                  ; 557A _ B8, 00000000
        jmp     ?_390                                   ; 557F _ EB, 2A

?_388:  mov     edx, dword [ebp-4H]                     ; 5581 _ 8B. 55, FC
        mov     eax, dword [ebp+8H]                     ; 5584 _ 8B. 45, 08
        add     eax, edx                                ; 5587 _ 01. D0
        movzx   eax, byte [eax]                         ; 5589 _ 0F B6. 00
        test    al, al                                  ; 558C _ 84. C0
        jz near       ?_389                                   ; 558e _ 74, 16
        mov     edx, dword [ebp-4H]                     ; 5590 _ 8B. 55, FC
        mov     eax, dword [ebp+0CH]                    ; 5593 _ 8B. 45, 0C
        add     eax, edx                                ; 5596 _ 01. D0
        movzx   eax, byte [eax]                         ; 5598 _ 0F B6. 00
        test    al, al                                  ; 559B _ 84. C0
        jz near       ?_389                                   ; 559d _ 74, 07
        mov     eax, 0                                  ; 559F _ B8, 00000000
        jmp     ?_390                                   ; 55A4 _ EB, 05

?_389:  mov     eax, 1                                  ; 55A6 _ B8, 00000001
?_390:  leave                                           ; 55AB _ C9
        ret                                             ; 55AC _ C3
; strcmp End of function

set_segmdesc:; Function begin
        push    ebp                                     ; 55AD _ 55
        mov     ebp, esp                                ; 55AE _ 89. E5
        cmp     dword [ebp+0CH], 1048575                ; 55B0 _ 81. 7D, 0C, 000FFFFF
        jbe     ?_391                                   ; 55B7 _ 76, 10
        or      dword [ebp+14H], 8000H                  ; 55B9 _ 81. 4D, 14, 00008000
        mov     eax, dword [ebp+0CH]                    ; 55C0 _ 8B. 45, 0C
        shr     eax, 12                                 ; 55C3 _ C1. E8, 0C
        mov     dword [ebp+0CH], eax                    ; 55C6 _ 89. 45, 0C
?_391:  mov     eax, dword [ebp+0CH]                    ; 55C9 _ 8B. 45, 0C
        mov     edx, eax                                ; 55CC _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 55CE _ 8B. 45, 08
        mov     word [eax], dx                          ; 55D1 _ 66: 89. 10
        mov     eax, dword [ebp+10H]                    ; 55D4 _ 8B. 45, 10
        mov     edx, eax                                ; 55D7 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 55D9 _ 8B. 45, 08
        mov     word [eax+2H], dx                       ; 55DC _ 66: 89. 50, 02
        mov     eax, dword [ebp+10H]                    ; 55E0 _ 8B. 45, 10
        sar     eax, 16                                 ; 55E3 _ C1. F8, 10
        mov     edx, eax                                ; 55E6 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 55E8 _ 8B. 45, 08
        mov     byte [eax+4H], dl                       ; 55EB _ 88. 50, 04
        mov     eax, dword [ebp+14H]                    ; 55EE _ 8B. 45, 14
        mov     edx, eax                                ; 55F1 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 55F3 _ 8B. 45, 08
        mov     byte [eax+5H], dl                       ; 55F6 _ 88. 50, 05
        mov     eax, dword [ebp+0CH]                    ; 55F9 _ 8B. 45, 0C
        shr     eax, 16                                 ; 55FC _ C1. E8, 10
        and     eax, 0FH                                ; 55FF _ 83. E0, 0F
        mov     edx, eax                                ; 5602 _ 89. C2
        mov     eax, dword [ebp+14H]                    ; 5604 _ 8B. 45, 14
        sar     eax, 8                                  ; 5607 _ C1. F8, 08
        and     eax, 0FFFFFFF0H                         ; 560A _ 83. E0, F0
        or      eax, edx                                ; 560D _ 09. D0
        mov     edx, eax                                ; 560F _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 5611 _ 8B. 45, 08
        mov     byte [eax+6H], dl                       ; 5614 _ 88. 50, 06
        mov     eax, dword [ebp+10H]                    ; 5617 _ 8B. 45, 10
        shr     eax, 24                                 ; 561A _ C1. E8, 18
        mov     edx, eax                                ; 561D _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 561F _ 8B. 45, 08
        mov     byte [eax+7H], dl                       ; 5622 _ 88. 50, 07
        nop                                             ; 5625 _ 90
        pop     ebp                                     ; 5626 _ 5D
        ret                                             ; 5627 _ C3
; set_segmdesc End of function

get_taskctl:; Function begin
        push    ebp                                     ; 5628 _ 55
        mov     ebp, esp                                ; 5629 _ 89. E5
        mov     eax, dword [taskctl]                    ; 562B _ A1, 00002308(d)
        pop     ebp                                     ; 5630 _ 5D
        ret                                             ; 5631 _ C3
; get_taskctl End of function

init_task_level:; Function begin
        push    ebp                                     ; 5632 _ 55
        mov     ebp, esp                                ; 5633 _ 89. E5
        sub     esp, 16                                 ; 5635 _ 83. EC, 10
        mov     ecx, dword [taskctl]                    ; 5638 _ 8B. 0D, 00002308(d)
        mov     edx, dword [ebp+8H]                     ; 563E _ 8B. 55, 08
        mov     eax, edx                                ; 5641 _ 89. D0
        add     eax, eax                                ; 5643 _ 01. C0
        add     eax, edx                                ; 5645 _ 01. D0
        shl     eax, 4                                  ; 5647 _ C1. E0, 04
        add     eax, ecx                                ; 564A _ 01. C8
        mov     dword [eax+8H], 0                       ; 564C _ C7. 40, 08, 00000000
        mov     ecx, dword [taskctl]                    ; 5653 _ 8B. 0D, 00002308(d)
        mov     edx, dword [ebp+8H]                     ; 5659 _ 8B. 55, 08
        mov     eax, edx                                ; 565C _ 89. D0
        add     eax, eax                                ; 565E _ 01. C0
        add     eax, edx                                ; 5660 _ 01. D0
        shl     eax, 4                                  ; 5662 _ C1. E0, 04
        add     eax, ecx                                ; 5665 _ 01. C8
        mov     dword [eax+0CH], 0                      ; 5667 _ C7. 40, 0C, 00000000
        mov     dword [ebp-4H], 0                       ; 566E _ C7. 45, FC, 00000000
        jmp     ?_393                                   ; 5675 _ EB, 19

?_392:  mov     edx, dword [taskctl]                    ; 5677 _ 8B. 15, 00002308(d)
        mov     eax, dword [ebp-4H]                     ; 567D _ 8B. 45, FC
        imul    eax, eax, 52                            ; 5680 _ 6B. C0, 34
        add     eax, edx                                ; 5683 _ 01. D0
        mov     dword [eax+10H], 0                      ; 5685 _ C7. 40, 10, 00000000
        add     dword [ebp-4H], 1                       ; 568C _ 83. 45, FC, 01
?_393:  cmp     dword [ebp-4H], 9                       ; 5690 _ 83. 7D, FC, 09
        jle near      ?_392                                   ; 5694 _ 7e, e1
        leave                                           ; 5696 _ C9
        ret                                             ; 5697 _ C3
; init_task_level End of function

task_init:; Function begin
        push    ebp                                     ; 5698 _ 55
        mov     ebp, esp                                ; 5699 _ 89. E5
        sub     esp, 24                                 ; 569B _ 83. EC, 18
        call    get_addr_gdt                            ; 569E _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 56A3 _ 89. 45, F0
        sub     esp, 8                                  ; 56A6 _ 83. EC, 08
        push    3128                                    ; 56A9 _ 68, 00000C38
        push    dword [ebp+8H]                          ; 56AE _ FF. 75, 08
        call    memman_alloc_4k                         ; 56B1 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 56B6 _ 83. C4, 10
        mov     dword [taskctl], eax                    ; 56B9 _ A3, 00002308(d)
        mov     dword [ebp-14H], 0                      ; 56BE _ C7. 45, EC, 00000000
        jmp     ?_395                                   ; 56C5 _ E9, 000000E9

?_394:  mov     edx, dword [taskctl]                    ; 56CA _ 8B. 15, 00002308(d)
        mov     eax, dword [ebp-14H]                    ; 56D0 _ 8B. 45, EC
        imul    eax, eax, 208                           ; 56D3 _ 69. C0, 000000D0
        add     eax, edx                                ; 56D9 _ 01. D0
        add     eax, 480                                ; 56DB _ 05, 000001E0
        mov     dword [eax+0CH], 0                      ; 56E0 _ C7. 40, 0C, 00000000
        mov     ecx, dword [taskctl]                    ; 56E7 _ 8B. 0D, 00002308(d)
        mov     eax, dword [ebp-14H]                    ; 56ED _ 8B. 45, EC
        add     eax, 7                                  ; 56F0 _ 83. C0, 07
        lea     edx, [eax*8]                            ; 56F3 _ 8D. 14 C5, 00000000
        mov     eax, dword [ebp-14H]                    ; 56FA _ 8B. 45, EC
        imul    eax, eax, 208                           ; 56FD _ 69. C0, 000000D0
        add     eax, ecx                                ; 5703 _ 01. C8
        add     eax, 480                                ; 5705 _ 05, 000001E0
        mov     dword [eax+8H], edx                     ; 570A _ 89. 50, 08
        mov     ecx, dword [taskctl]                    ; 570D _ 8B. 0D, 00002308(d)
        mov     eax, dword [ebp-14H]                    ; 5713 _ 8B. 45, EC
        add     eax, 17                                 ; 5716 _ 83. C0, 11
        lea     edx, [eax*8]                            ; 5719 _ 8D. 14 C5, 00000000
        mov     eax, dword [ebp-14H]                    ; 5720 _ 8B. 45, EC
        imul    eax, eax, 208                           ; 5723 _ 69. C0, 000000D0
        add     eax, ecx                                ; 5729 _ 01. C8
        add     eax, 608                                ; 572B _ 05, 00000260
        mov     dword [eax+14H], edx                    ; 5730 _ 89. 50, 14
        mov     eax, dword [taskctl]                    ; 5733 _ A1, 00002308(d)
        mov     edx, dword [ebp-14H]                    ; 5738 _ 8B. 55, EC
        imul    edx, edx, 208                           ; 573B _ 69. D2, 000000D0
        add     edx, 512                                ; 5741 _ 81. C2, 00000200
        add     eax, edx                                ; 5747 _ 01. D0
        add     eax, 20                                 ; 5749 _ 83. C0, 14
        mov     ecx, eax                                ; 574C _ 89. C1
        mov     eax, dword [ebp-14H]                    ; 574E _ 8B. 45, EC
        add     eax, 7                                  ; 5751 _ 83. C0, 07
        lea     edx, [eax*8]                            ; 5754 _ 8D. 14 C5, 00000000
        mov     eax, dword [ebp-10H]                    ; 575B _ 8B. 45, F0
        add     eax, edx                                ; 575E _ 01. D0
        push    137                                     ; 5760 _ 68, 00000089
        push    ecx                                     ; 5765 _ 51
        push    103                                     ; 5766 _ 6A, 67
        push    eax                                     ; 5768 _ 50
        call    set_segmdesc                            ; 5769 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 576E _ 83. C4, 10
        mov     eax, dword [taskctl]                    ; 5771 _ A1, 00002308(d)
        mov     edx, dword [ebp-14H]                    ; 5776 _ 8B. 55, EC
        imul    edx, edx, 208                           ; 5779 _ 69. D2, 000000D0
        add     edx, 656                                ; 577F _ 81. C2, 00000290
        add     eax, edx                                ; 5785 _ 01. D0
        add     eax, 20                                 ; 5787 _ 83. C0, 14
        mov     ecx, eax                                ; 578A _ 89. C1
        mov     eax, dword [ebp-14H]                    ; 578C _ 8B. 45, EC
        add     eax, 17                                 ; 578F _ 83. C0, 11
        lea     edx, [eax*8]                            ; 5792 _ 8D. 14 C5, 00000000
        mov     eax, dword [ebp-10H]                    ; 5799 _ 8B. 45, F0
        add     eax, edx                                ; 579C _ 01. D0
        push    130                                     ; 579E _ 68, 00000082
        push    ecx                                     ; 57A3 _ 51
        push    15                                      ; 57A4 _ 6A, 0F
        push    eax                                     ; 57A6 _ 50
        call    set_segmdesc                            ; 57A7 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 57AC _ 83. C4, 10
        add     dword [ebp-14H], 1                      ; 57AF _ 83. 45, EC, 01
?_395:  cmp     dword [ebp-14H], 9                      ; 57B3 _ 83. 7D, EC, 09
        jle near      ?_394                                   ; 57b7 _ 0f 8e, ffffff0d
        mov     dword [ebp-14H], 0                      ; 57BD _ C7. 45, EC, 00000000
        jmp     ?_397                                   ; 57C4 _ EB, 12

?_396:  sub     esp, 12                                 ; 57C6 _ 83. EC, 0C
        push    dword [ebp-14H]                         ; 57C9 _ FF. 75, EC
        call    init_task_level                         ; 57CC _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 57D1 _ 83. C4, 10
        add     dword [ebp-14H], 1                      ; 57D4 _ 83. 45, EC, 01
?_397:  cmp     dword [ebp-14H], 9                      ; 57D8 _ 83. 7D, EC, 09
        jle near      ?_396                                   ; 57dc _ 7e, e8
        call    task_alloc                              ; 57DE _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 57E3 _ 89. 45, F4
        mov     eax, dword [ebp-0CH]                    ; 57E6 _ 8B. 45, F4
        mov     dword [eax+4H], 2                       ; 57E9 _ C7. 40, 04, 00000002
        mov     eax, dword [ebp-0CH]                    ; 57F0 _ 8B. 45, F4
        mov     dword [eax+8H], 100                     ; 57F3 _ C7. 40, 08, 00000064
        mov     eax, dword [ebp-0CH]                    ; 57FA _ 8B. 45, F4
        mov     dword [eax+0CH], 0                      ; 57FD _ C7. 40, 0C, 00000000
        sub     esp, 12                                 ; 5804 _ 83. EC, 0C
        push    dword [ebp-0CH]                         ; 5807 _ FF. 75, F4
        call    task_add                                ; 580A _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 580F _ 83. C4, 10
        call    task_switchsub                          ; 5812 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 5817 _ 8B. 45, F4
        mov     eax, dword [eax]                        ; 581A _ 8B. 00
        sub     esp, 12                                 ; 581C _ 83. EC, 0C
        push    eax                                     ; 581F _ 50
        call    load_tr                                 ; 5820 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 5825 _ 83. C4, 10
        call    timer_alloc                             ; 5828 _ E8, FFFFFFFC(rel)
        mov     dword [task_timer], eax                 ; 582D _ A3, 00002304(d)
        mov     eax, dword [ebp-0CH]                    ; 5832 _ 8B. 45, F4
        mov     eax, dword [eax+8H]                     ; 5835 _ 8B. 40, 08
        mov     edx, eax                                ; 5838 _ 89. C2
        mov     eax, dword [task_timer]                 ; 583A _ A1, 00002304(d)
        sub     esp, 8                                  ; 583F _ 83. EC, 08
        push    edx                                     ; 5842 _ 52
        push    eax                                     ; 5843 _ 50
        call    timer_settime                           ; 5844 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 5849 _ 83. C4, 10
        mov     eax, dword [ebp-0CH]                    ; 584C _ 8B. 45, F4
        leave                                           ; 584F _ C9
        ret                                             ; 5850 _ C3
; task_init End of function

task_alloc:; Function begin
        push    ebp                                     ; 5851 _ 55
        mov     ebp, esp                                ; 5852 _ 89. E5
        sub     esp, 16                                 ; 5854 _ 83. EC, 10
        mov     dword [ebp-8H], 0                       ; 5857 _ C7. 45, F8, 00000000
        jmp     ?_400                                   ; 585E _ E9, 000000F9

?_398:  mov     edx, dword [taskctl]                    ; 5863 _ 8B. 15, 00002308(d)
        mov     eax, dword [ebp-8H]                     ; 5869 _ 8B. 45, F8
        imul    eax, eax, 208                           ; 586C _ 69. C0, 000000D0
        add     eax, edx                                ; 5872 _ 01. D0
        add     eax, 480                                ; 5874 _ 05, 000001E0
        mov     eax, dword [eax+0CH]                    ; 5879 _ 8B. 40, 0C
        test    eax, eax                                ; 587C _ 85. C0
        jne near      ?_399                                   ; 587e _ 0f 85, 000000d4
        mov     eax, dword [taskctl]                    ; 5884 _ A1, 00002308(d)
        mov     edx, dword [ebp-8H]                     ; 5889 _ 8B. 55, F8
        imul    edx, edx, 208                           ; 588C _ 69. D2, 000000D0
        add     edx, 480                                ; 5892 _ 81. C2, 000001E0
        add     eax, edx                                ; 5898 _ 01. D0
        add     eax, 8                                  ; 589A _ 83. C0, 08
        mov     dword [ebp-4H], eax                     ; 589D _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 58A0 _ 8B. 45, FC
        mov     dword [eax+4H], 1                       ; 58A3 _ C7. 40, 04, 00000001
        mov     eax, dword [ebp-4H]                     ; 58AA _ 8B. 45, FC
        mov     dword [eax+50H], 514                    ; 58AD _ C7. 40, 50, 00000202
        mov     eax, dword [ebp-4H]                     ; 58B4 _ 8B. 45, FC
        mov     dword [eax+54H], 0                      ; 58B7 _ C7. 40, 54, 00000000
        mov     eax, dword [ebp-4H]                     ; 58BE _ 8B. 45, FC
        mov     dword [eax+58H], 0                      ; 58C1 _ C7. 40, 58, 00000000
        mov     eax, dword [ebp-4H]                     ; 58C8 _ 8B. 45, FC
        mov     dword [eax+5CH], 0                      ; 58CB _ C7. 40, 5C, 00000000
        mov     eax, dword [ebp-4H]                     ; 58D2 _ 8B. 45, FC
        mov     dword [eax+60H], 0                      ; 58D5 _ C7. 40, 60, 00000000
        mov     eax, dword [ebp-4H]                     ; 58DC _ 8B. 45, FC
        mov     dword [eax+68H], 0                      ; 58DF _ C7. 40, 68, 00000000
        mov     eax, dword [ebp-8H]                     ; 58E6 _ 8B. 45, F8
        add     eax, 1                                  ; 58E9 _ 83. C0, 01
        shl     eax, 9                                  ; 58EC _ C1. E0, 09
        mov     edx, eax                                ; 58EF _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 58F1 _ 8B. 45, FC
        mov     dword [eax+64H], edx                    ; 58F4 _ 89. 50, 64
        mov     eax, dword [ebp-4H]                     ; 58F7 _ 8B. 45, FC
        mov     dword [eax+6CH], 0                      ; 58FA _ C7. 40, 6C, 00000000
        mov     eax, dword [ebp-4H]                     ; 5901 _ 8B. 45, FC
        mov     dword [eax+70H], 0                      ; 5904 _ C7. 40, 70, 00000000
        mov     eax, dword [ebp-4H]                     ; 590B _ 8B. 45, FC
        mov     dword [eax+74H], 0                      ; 590E _ C7. 40, 74, 00000000
        mov     eax, dword [ebp-4H]                     ; 5915 _ 8B. 45, FC
        mov     dword [eax+80H], 0                      ; 5918 _ C7. 80, 00000080, 00000000
        mov     eax, dword [ebp-4H]                     ; 5922 _ 8B. 45, FC
        mov     dword [eax+84H], 0                      ; 5925 _ C7. 80, 00000084, 00000000
        mov     eax, dword [ebp-4H]                     ; 592F _ 8B. 45, FC
        mov     dword [eax+88H], 0                      ; 5932 _ C7. 80, 00000088, 00000000
        mov     eax, dword [ebp-4H]                     ; 593C _ 8B. 45, FC
        mov     dword [eax+34H], 0                      ; 593F _ C7. 40, 34, 00000000
        mov     eax, dword [ebp-4H]                     ; 5946 _ 8B. 45, FC
        mov     dword [eax+90H], 1073741824             ; 5949 _ C7. 80, 00000090, 40000000
        mov     eax, dword [ebp-4H]                     ; 5953 _ 8B. 45, FC
        jmp     ?_401                                   ; 5956 _ EB, 13

?_399:  add     dword [ebp-8H], 1                       ; 5958 _ 83. 45, F8, 01
?_400:  cmp     dword [ebp-8H], 9                       ; 595C _ 83. 7D, F8, 09
        jle near      ?_398                                   ; 5960 _ 0f 8e, fffffefd
        mov     eax, 0                                  ; 5966 _ B8, 00000000
?_401:  leave                                           ; 596B _ C9
        ret                                             ; 596C _ C3
; task_alloc End of function

task_run:; Function begin
        push    ebp                                     ; 596D _ 55
        mov     ebp, esp                                ; 596E _ 89. E5
        sub     esp, 8                                  ; 5970 _ 83. EC, 08
        cmp     dword [ebp+0CH], 0                      ; 5973 _ 83. 7D, 0C, 00
        jns near      ?_402                                   ; 5977 _ 79, 09
        mov     eax, dword [ebp+8H]                     ; 5979 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 597C _ 8B. 40, 0C
        mov     dword [ebp+0CH], eax                    ; 597F _ 89. 45, 0C
?_402:  cmp     dword [ebp+10H], 0                      ; 5982 _ 83. 7D, 10, 00
        jle near      ?_403                                   ; 5986 _ 7e, 09
        mov     eax, dword [ebp+8H]                     ; 5988 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 598B _ 8B. 55, 10
        mov     dword [eax+8H], edx                     ; 598E _ 89. 50, 08
?_403:  mov     eax, dword [ebp+8H]                     ; 5991 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 5994 _ 8B. 40, 04
        cmp     eax, 2                                  ; 5997 _ 83. F8, 02
        jnz near      ?_404                                   ; 599a _ 75, 19
        mov     eax, dword [ebp+8H]                     ; 599C _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 599F _ 8B. 40, 0C
        cmp     eax, dword [ebp+0CH]                    ; 59A2 _ 3B. 45, 0C
        jz near       ?_404                                   ; 59a5 _ 74, 0e
        sub     esp, 12                                 ; 59A7 _ 83. EC, 0C
        push    dword [ebp+8H]                          ; 59AA _ FF. 75, 08
        call    task_remove                             ; 59AD _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 59B2 _ 83. C4, 10
?_404:  mov     eax, dword [ebp+8H]                     ; 59B5 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 59B8 _ 8B. 40, 04
        cmp     eax, 2                                  ; 59BB _ 83. F8, 02
        jz near       ?_405                                   ; 59be _ 74, 17
        mov     eax, dword [ebp+8H]                     ; 59C0 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 59C3 _ 8B. 55, 0C
        mov     dword [eax+0CH], edx                    ; 59C6 _ 89. 50, 0C
        sub     esp, 12                                 ; 59C9 _ 83. EC, 0C
        push    dword [ebp+8H]                          ; 59CC _ FF. 75, 08
        call    task_add                                ; 59CF _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 59D4 _ 83. C4, 10
?_405:  mov     eax, dword [taskctl]                    ; 59D7 _ A1, 00002308(d)
        mov     dword [eax+4H], 1                       ; 59DC _ C7. 40, 04, 00000001
        nop                                             ; 59E3 _ 90
        leave                                           ; 59E4 _ C9
        ret                                             ; 59E5 _ C3
; task_run End of function

task_switch:; Function begin
        push    ebp                                     ; 59E6 _ 55
        mov     ebp, esp                                ; 59E7 _ 89. E5
        sub     esp, 24                                 ; 59E9 _ 83. EC, 18
        mov     ecx, dword [taskctl]                    ; 59EC _ 8B. 0D, 00002308(d)
        mov     eax, dword [taskctl]                    ; 59F2 _ A1, 00002308(d)
        mov     edx, dword [eax]                        ; 59F7 _ 8B. 10
        mov     eax, edx                                ; 59F9 _ 89. D0
        add     eax, eax                                ; 59FB _ 01. C0
        add     eax, edx                                ; 59FD _ 01. D0
        shl     eax, 4                                  ; 59FF _ C1. E0, 04
        add     eax, ecx                                ; 5A02 _ 01. C8
        add     eax, 8                                  ; 5A04 _ 83. C0, 08
        mov     dword [ebp-14H], eax                    ; 5A07 _ 89. 45, EC
        mov     eax, dword [ebp-14H]                    ; 5A0A _ 8B. 45, EC
        mov     edx, dword [eax+4H]                     ; 5A0D _ 8B. 50, 04
        mov     eax, dword [ebp-14H]                    ; 5A10 _ 8B. 45, EC
        mov     eax, dword [eax+edx*4+8H]               ; 5A13 _ 8B. 44 90, 08
        mov     dword [ebp-10H], eax                    ; 5A17 _ 89. 45, F0
        mov     eax, dword [ebp-14H]                    ; 5A1A _ 8B. 45, EC
        mov     eax, dword [eax+4H]                     ; 5A1D _ 8B. 40, 04
        lea     edx, [eax+1H]                           ; 5A20 _ 8D. 50, 01
        mov     eax, dword [ebp-14H]                    ; 5A23 _ 8B. 45, EC
        mov     dword [eax+4H], edx                     ; 5A26 _ 89. 50, 04
        mov     eax, dword [ebp-14H]                    ; 5A29 _ 8B. 45, EC
        mov     edx, dword [eax+4H]                     ; 5A2C _ 8B. 50, 04
        mov     eax, dword [ebp-14H]                    ; 5A2F _ 8B. 45, EC
        mov     eax, dword [eax]                        ; 5A32 _ 8B. 00
        cmp     edx, eax                                ; 5A34 _ 39. C2
        jnz near      ?_406                                   ; 5a36 _ 75, 0a
        mov     eax, dword [ebp-14H]                    ; 5A38 _ 8B. 45, EC
        mov     dword [eax+4H], 0                       ; 5A3B _ C7. 40, 04, 00000000
?_406:  mov     eax, dword [taskctl]                    ; 5A42 _ A1, 00002308(d)
        mov     eax, dword [eax+4H]                     ; 5A47 _ 8B. 40, 04
        test    eax, eax                                ; 5A4A _ 85. C0
        jz near       ?_407                                   ; 5a4c _ 74, 23
        call    task_switchsub                          ; 5A4E _ E8, FFFFFFFC(rel)
        mov     ecx, dword [taskctl]                    ; 5A53 _ 8B. 0D, 00002308(d)
        mov     eax, dword [taskctl]                    ; 5A59 _ A1, 00002308(d)
        mov     edx, dword [eax]                        ; 5A5E _ 8B. 10
        mov     eax, edx                                ; 5A60 _ 89. D0
        add     eax, eax                                ; 5A62 _ 01. C0
        add     eax, edx                                ; 5A64 _ 01. D0
        shl     eax, 4                                  ; 5A66 _ C1. E0, 04
        add     eax, ecx                                ; 5A69 _ 01. C8
        add     eax, 8                                  ; 5A6B _ 83. C0, 08
        mov     dword [ebp-14H], eax                    ; 5A6E _ 89. 45, EC
?_407:  mov     eax, dword [ebp-14H]                    ; 5A71 _ 8B. 45, EC
        mov     edx, dword [eax+4H]                     ; 5A74 _ 8B. 50, 04
        mov     eax, dword [ebp-14H]                    ; 5A77 _ 8B. 45, EC
        mov     eax, dword [eax+edx*4+8H]               ; 5A7A _ 8B. 44 90, 08
        mov     dword [ebp-0CH], eax                    ; 5A7E _ 89. 45, F4
        mov     eax, dword [ebp-0CH]                    ; 5A81 _ 8B. 45, F4
        mov     eax, dword [eax+8H]                     ; 5A84 _ 8B. 40, 08
        mov     edx, eax                                ; 5A87 _ 89. C2
        mov     eax, dword [task_timer]                 ; 5A89 _ A1, 00002304(d)
        sub     esp, 8                                  ; 5A8E _ 83. EC, 08
        push    edx                                     ; 5A91 _ 52
        push    eax                                     ; 5A92 _ 50
        call    timer_settime                           ; 5A93 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 5A98 _ 83. C4, 10
        mov     eax, dword [ebp-0CH]                    ; 5A9B _ 8B. 45, F4
        cmp     eax, dword [ebp-10H]                    ; 5A9E _ 3B. 45, F0
        jz near       ?_408                                   ; 5aa1 _ 74, 19
        cmp     dword [ebp-0CH], 0                      ; 5AA3 _ 83. 7D, F4, 00
        jz near       ?_408                                   ; 5aa7 _ 74, 13
        mov     eax, dword [ebp-0CH]                    ; 5AA9 _ 8B. 45, F4
        mov     eax, dword [eax]                        ; 5AAC _ 8B. 00
        sub     esp, 8                                  ; 5AAE _ 83. EC, 08
        push    eax                                     ; 5AB1 _ 50
        push    0                                       ; 5AB2 _ 6A, 00
        call    farjmp                                  ; 5AB4 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 5AB9 _ 83. C4, 10
?_408:  nop                                             ; 5ABC _ 90
        leave                                           ; 5ABD _ C9
        ret                                             ; 5ABE _ C3
; task_switch End of function

task_sleep:; Function begin
        push    ebp                                     ; 5ABF _ 55
        mov     ebp, esp                                ; 5AC0 _ 89. E5
        sub     esp, 24                                 ; 5AC2 _ 83. EC, 18
        mov     dword [ebp-0CH], 0                      ; 5AC5 _ C7. 45, F4, 00000000
        mov     dword [ebp-10H], 0                      ; 5ACC _ C7. 45, F0, 00000000
        mov     eax, dword [ebp+8H]                     ; 5AD3 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 5AD6 _ 8B. 40, 04
        cmp     eax, 2                                  ; 5AD9 _ 83. F8, 02
        jnz near      ?_409                                   ; 5adc _ 75, 52
        call    task_now                                ; 5ADE _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 5AE3 _ 89. 45, F4
        sub     esp, 12                                 ; 5AE6 _ 83. EC, 0C
        push    dword [ebp+8H]                          ; 5AE9 _ FF. 75, 08
        call    task_remove                             ; 5AEC _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 5AF1 _ 83. C4, 10
        mov     dword [ebp-10H], 1                      ; 5AF4 _ C7. 45, F0, 00000001
        mov     eax, dword [ebp+8H]                     ; 5AFB _ 8B. 45, 08
        cmp     eax, dword [ebp-0CH]                    ; 5AFE _ 3B. 45, F4
        jnz near      ?_409                                   ; 5b01 _ 75, 2d
        call    task_switchsub                          ; 5B03 _ E8, FFFFFFFC(rel)
        call    task_now                                ; 5B08 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 5B0D _ 89. 45, F4
        mov     dword [ebp-10H], 2                      ; 5B10 _ C7. 45, F0, 00000002
        cmp     dword [ebp-0CH], 0                      ; 5B17 _ 83. 7D, F4, 00
        jz near       ?_409                                   ; 5b1b _ 74, 13
        mov     eax, dword [ebp-0CH]                    ; 5B1D _ 8B. 45, F4
        mov     eax, dword [eax]                        ; 5B20 _ 8B. 00
        sub     esp, 8                                  ; 5B22 _ 83. EC, 08
        push    eax                                     ; 5B25 _ 50
        push    0                                       ; 5B26 _ 6A, 00
        call    farjmp                                  ; 5B28 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 5B2D _ 83. C4, 10
?_409:  mov     eax, dword [ebp-10H]                    ; 5B30 _ 8B. 45, F0
        leave                                           ; 5B33 _ C9
        ret                                             ; 5B34 _ C3
; task_sleep End of function

task_now:; Function begin
        push    ebp                                     ; 5B35 _ 55
        mov     ebp, esp                                ; 5B36 _ 89. E5
        sub     esp, 16                                 ; 5B38 _ 83. EC, 10
        mov     ecx, dword [taskctl]                    ; 5B3B _ 8B. 0D, 00002308(d)
        mov     eax, dword [taskctl]                    ; 5B41 _ A1, 00002308(d)
        mov     edx, dword [eax]                        ; 5B46 _ 8B. 10
        mov     eax, edx                                ; 5B48 _ 89. D0
        add     eax, eax                                ; 5B4A _ 01. C0
        add     eax, edx                                ; 5B4C _ 01. D0
        shl     eax, 4                                  ; 5B4E _ C1. E0, 04
        add     eax, ecx                                ; 5B51 _ 01. C8
        add     eax, 8                                  ; 5B53 _ 83. C0, 08
        mov     dword [ebp-4H], eax                     ; 5B56 _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 5B59 _ 8B. 45, FC
        mov     edx, dword [eax+4H]                     ; 5B5C _ 8B. 50, 04
        mov     eax, dword [ebp-4H]                     ; 5B5F _ 8B. 45, FC
        mov     eax, dword [eax+edx*4+8H]               ; 5B62 _ 8B. 44 90, 08
        leave                                           ; 5B66 _ C9
        ret                                             ; 5B67 _ C3
; task_now End of function

task_add:; Function begin
        push    ebp                                     ; 5B68 _ 55
        mov     ebp, esp                                ; 5B69 _ 89. E5
        sub     esp, 16                                 ; 5B6B _ 83. EC, 10
        mov     ecx, dword [taskctl]                    ; 5B6E _ 8B. 0D, 00002308(d)
        mov     eax, dword [ebp+8H]                     ; 5B74 _ 8B. 45, 08
        mov     edx, dword [eax+0CH]                    ; 5B77 _ 8B. 50, 0C
        mov     eax, edx                                ; 5B7A _ 89. D0
        add     eax, eax                                ; 5B7C _ 01. C0
        add     eax, edx                                ; 5B7E _ 01. D0
        shl     eax, 4                                  ; 5B80 _ C1. E0, 04
        add     eax, ecx                                ; 5B83 _ 01. C8
        add     eax, 8                                  ; 5B85 _ 83. C0, 08
        mov     dword [ebp-4H], eax                     ; 5B88 _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 5B8B _ 8B. 45, FC
        mov     edx, dword [eax]                        ; 5B8E _ 8B. 10
        mov     eax, dword [ebp-4H]                     ; 5B90 _ 8B. 45, FC
        mov     ecx, dword [ebp+8H]                     ; 5B93 _ 8B. 4D, 08
        mov     dword [eax+edx*4+8H], ecx               ; 5B96 _ 89. 4C 90, 08
        mov     eax, dword [ebp-4H]                     ; 5B9A _ 8B. 45, FC
        mov     eax, dword [eax]                        ; 5B9D _ 8B. 00
        lea     edx, [eax+1H]                           ; 5B9F _ 8D. 50, 01
        mov     eax, dword [ebp-4H]                     ; 5BA2 _ 8B. 45, FC
        mov     dword [eax], edx                        ; 5BA5 _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 5BA7 _ 8B. 45, 08
        mov     dword [eax+4H], 2                       ; 5BAA _ C7. 40, 04, 00000002
        nop                                             ; 5BB1 _ 90
        leave                                           ; 5BB2 _ C9
        ret                                             ; 5BB3 _ C3
; task_add End of function

task_remove:; Function begin
        push    ebp                                     ; 5BB4 _ 55
        mov     ebp, esp                                ; 5BB5 _ 89. E5
        sub     esp, 16                                 ; 5BB7 _ 83. EC, 10
        mov     ecx, dword [taskctl]                    ; 5BBA _ 8B. 0D, 00002308(d)
        mov     eax, dword [ebp+8H]                     ; 5BC0 _ 8B. 45, 08
        mov     edx, dword [eax+0CH]                    ; 5BC3 _ 8B. 50, 0C
        mov     eax, edx                                ; 5BC6 _ 89. D0
        add     eax, eax                                ; 5BC8 _ 01. C0
        add     eax, edx                                ; 5BCA _ 01. D0
        shl     eax, 4                                  ; 5BCC _ C1. E0, 04
        add     eax, ecx                                ; 5BCF _ 01. C8
        add     eax, 8                                  ; 5BD1 _ 83. C0, 08
        mov     dword [ebp-4H], eax                     ; 5BD4 _ 89. 45, FC
        mov     dword [ebp-8H], 0                       ; 5BD7 _ C7. 45, F8, 00000000
        jmp     ?_412                                   ; 5BDE _ EB, 23

?_410:  mov     eax, dword [ebp-4H]                     ; 5BE0 _ 8B. 45, FC
        mov     edx, dword [ebp-8H]                     ; 5BE3 _ 8B. 55, F8
        mov     eax, dword [eax+edx*4+8H]               ; 5BE6 _ 8B. 44 90, 08
        cmp     eax, dword [ebp+8H]                     ; 5BEA _ 3B. 45, 08
        jnz near      ?_411                                   ; 5bed _ 75, 10
        mov     eax, dword [ebp-4H]                     ; 5BEF _ 8B. 45, FC
        mov     edx, dword [ebp-8H]                     ; 5BF2 _ 8B. 55, F8
        mov     dword [eax+edx*4+8H], 0                 ; 5BF5 _ C7. 44 90, 08, 00000000
        jmp     ?_413                                   ; 5BFD _ EB, 0E

?_411:  add     dword [ebp-8H], 1                       ; 5BFF _ 83. 45, F8, 01
?_412:  mov     eax, dword [ebp-4H]                     ; 5C03 _ 8B. 45, FC
        mov     eax, dword [eax]                        ; 5C06 _ 8B. 00
        cmp     eax, dword [ebp-8H]                     ; 5C08 _ 3B. 45, F8
        jg  near      ?_410                                   ; 5c0b _ 7f, d3
?_413:  mov     eax, dword [ebp-4H]                     ; 5C0D _ 8B. 45, FC
        mov     eax, dword [eax]                        ; 5C10 _ 8B. 00
        lea     edx, [eax-1H]                           ; 5C12 _ 8D. 50, FF
        mov     eax, dword [ebp-4H]                     ; 5C15 _ 8B. 45, FC
        mov     dword [eax], edx                        ; 5C18 _ 89. 10
        mov     eax, dword [ebp-4H]                     ; 5C1A _ 8B. 45, FC
        mov     eax, dword [eax+4H]                     ; 5C1D _ 8B. 40, 04
        cmp     eax, dword [ebp-8H]                     ; 5C20 _ 3B. 45, F8
        jle near      ?_414                                   ; 5c23 _ 7e, 0f
        mov     eax, dword [ebp-4H]                     ; 5C25 _ 8B. 45, FC
        mov     eax, dword [eax+4H]                     ; 5C28 _ 8B. 40, 04
        lea     edx, [eax-1H]                           ; 5C2B _ 8D. 50, FF
        mov     eax, dword [ebp-4H]                     ; 5C2E _ 8B. 45, FC
        mov     dword [eax+4H], edx                     ; 5C31 _ 89. 50, 04
?_414:  mov     eax, dword [ebp-4H]                     ; 5C34 _ 8B. 45, FC
        mov     edx, dword [eax+4H]                     ; 5C37 _ 8B. 50, 04
        mov     eax, dword [ebp-4H]                     ; 5C3A _ 8B. 45, FC
        mov     eax, dword [eax]                        ; 5C3D _ 8B. 00
        cmp     edx, eax                                ; 5C3F _ 39. C2
        jl      ?_415                                   ; 5C41 _ 7C, 0A
        mov     eax, dword [ebp-4H]                     ; 5C43 _ 8B. 45, FC
        mov     dword [eax+4H], 0                       ; 5C46 _ C7. 40, 04, 00000000
?_415:  mov     eax, dword [ebp+8H]                     ; 5C4D _ 8B. 45, 08
        mov     dword [eax+4H], 1                       ; 5C50 _ C7. 40, 04, 00000001
        jmp     ?_417                                   ; 5C57 _ EB, 1B

?_416:  mov     eax, dword [ebp-8H]                     ; 5C59 _ 8B. 45, F8
        lea     edx, [eax+1H]                           ; 5C5C _ 8D. 50, 01
        mov     eax, dword [ebp-4H]                     ; 5C5F _ 8B. 45, FC
        mov     ecx, dword [eax+edx*4+8H]               ; 5C62 _ 8B. 4C 90, 08
        mov     eax, dword [ebp-4H]                     ; 5C66 _ 8B. 45, FC
        mov     edx, dword [ebp-8H]                     ; 5C69 _ 8B. 55, F8
        mov     dword [eax+edx*4+8H], ecx               ; 5C6C _ 89. 4C 90, 08
        add     dword [ebp-8H], 1                       ; 5C70 _ 83. 45, F8, 01
?_417:  mov     eax, dword [ebp-4H]                     ; 5C74 _ 8B. 45, FC
        mov     eax, dword [eax]                        ; 5C77 _ 8B. 00
        cmp     eax, dword [ebp-8H]                     ; 5C79 _ 3B. 45, F8
        jg  near      ?_416                                   ; 5c7c _ 7f, db
        nop                                             ; 5C7E _ 90
        leave                                           ; 5C7F _ C9
        ret                                             ; 5C80 _ C3
; task_remove End of function

task_switchsub:; Function begin
        push    ebp                                     ; 5C81 _ 55
        mov     ebp, esp                                ; 5C82 _ 89. E5
        sub     esp, 16                                 ; 5C84 _ 83. EC, 10
        mov     dword [ebp-4H], 0                       ; 5C87 _ C7. 45, FC, 00000000
        jmp     ?_420                                   ; 5C8E _ EB, 21

?_418:  mov     ecx, dword [taskctl]                    ; 5C90 _ 8B. 0D, 00002308(d)
        mov     edx, dword [ebp-4H]                     ; 5C96 _ 8B. 55, FC
        mov     eax, edx                                ; 5C99 _ 89. D0
        add     eax, eax                                ; 5C9B _ 01. C0
        add     eax, edx                                ; 5C9D _ 01. D0
        shl     eax, 4                                  ; 5C9F _ C1. E0, 04
        add     eax, ecx                                ; 5CA2 _ 01. C8
        mov     eax, dword [eax+8H]                     ; 5CA4 _ 8B. 40, 08
        test    eax, eax                                ; 5CA7 _ 85. C0
        jle near      ?_419                                   ; 5ca9 _ 7e, 02
        jmp     ?_421                                   ; 5CAB _ EB, 0A

?_419:  add     dword [ebp-4H], 1                       ; 5CAD _ 83. 45, FC, 01
?_420:  cmp     dword [ebp-4H], 9                       ; 5CB1 _ 83. 7D, FC, 09
        jle near      ?_418                                   ; 5cb5 _ 7e, d9
?_421:  mov     eax, dword [taskctl]                    ; 5CB7 _ A1, 00002308(d)
        mov     edx, dword [ebp-4H]                     ; 5CBC _ 8B. 55, FC
        mov     dword [eax], edx                        ; 5CBF _ 89. 10
        mov     eax, dword [taskctl]                    ; 5CC1 _ A1, 00002308(d)
        mov     dword [eax+4H], 0                       ; 5CC6 _ C7. 40, 04, 00000000
        leave                                           ; 5CCD _ C9
        ret                                             ; 5CCE _ C3
; task_switchsub End of function

send_message:; Function begin
        push    ebp                                     ; 5CCF _ 55
        mov     ebp, esp                                ; 5CD0 _ 89. E5
        sub     esp, 8                                  ; 5CD2 _ 83. EC, 08
        mov     eax, dword [ebp+10H]                    ; 5CD5 _ 8B. 45, 10
        movzx   eax, al                                 ; 5CD8 _ 0F B6. C0
        mov     edx, dword [ebp+0CH]                    ; 5CDB _ 8B. 55, 0C
        add     edx, 16                                 ; 5CDE _ 83. C2, 10
        sub     esp, 8                                  ; 5CE1 _ 83. EC, 08
        push    eax                                     ; 5CE4 _ 50
        push    edx                                     ; 5CE5 _ 52
        call    fifo8_put                               ; 5CE6 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 5CEB _ 83. C4, 10
        sub     esp, 12                                 ; 5CEE _ 83. EC, 0C
        push    dword [ebp+8H]                          ; 5CF1 _ FF. 75, 08
        call    task_sleep                              ; 5CF4 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 5CF9 _ 83. C4, 10
        leave                                           ; 5CFC _ C9
        ret                                             ; 5CFD _ C3
; send_message End of function



?_422:                                                  ; byte
        db 63H, 6FH, 75H, 6EH, 74H, 65H, 72H, 00H       ; 0000 _ counter.

?_423:                                                  ; byte
        db 74H, 61H, 73H, 6BH, 5FH, 61H, 00H            ; 0008 _ task_a.

?_424:                                                  ; byte
        db 63H, 6FH, 6EH, 73H, 6FH, 6CH, 65H, 00H       ; 000F _ console.

?_425:                                                  ; byte
        db 20H, 00H                                     ; 0017 _  .

?_426:                                                  ; byte
        db 66H, 72H, 65H, 65H, 20H, 00H                 ; 0019 _ free .

?_427:                                                  ; byte
        db 20H, 4BH, 42H, 00H                           ; 001F _  KB.

?_428:                                                  ; byte
        db 3EH, 00H                                     ; 0023 _ >.

?_429:                                                  ; byte
        db 6DH, 65H, 6DH, 00H                           ; 0025 _ mem.

?_430:                                                  ; byte
        db 63H, 6CH, 73H, 00H                           ; 0029 _ cls.

?_431:                                                  ; byte
        db 68H, 6CH, 74H, 00H                           ; 002D _ hlt.

?_432:                                                  ; byte
        db 61H, 62H, 63H, 2EH, 65H, 78H, 65H, 00H       ; 0031 _ abc.exe.

?_433:                                                  ; byte
        db 64H, 69H, 72H, 00H                           ; 0039 _ dir.

?_434:                                                  ; byte
        db 65H, 78H, 69H, 74H, 00H                      ; 003D _ exit.

?_435:                                                  ; byte
        db 73H, 74H, 61H, 72H, 74H, 00H                 ; 0042 _ start.

?_436:                                                  ; byte
        db 6EH, 63H, 73H, 74H, 00H                      ; 0048 _ ncst.

?_437:                                                  ; byte
        db 63H, 72H, 61H, 63H, 6BH, 00H                 ; 004D _ crack.

?_438:                                                  ; byte
        db 63H, 72H, 61H, 63H, 6BH, 2EH, 65H, 78H       ; 0053 _ crack.ex
        db 65H, 00H                                     ; 005B _ e.

?_439:                                                  ; byte
        db 6BH, 65H, 79H, 62H, 6FH, 61H, 72H, 64H       ; 005D _ keyboard
        db 00H                                          ; 0065 _ .

?_440:                                                  ; byte
        db 75H, 73H, 65H, 72H, 20H, 70H, 72H, 6FH       ; 0066 _ user pro
        db 63H, 00H                                     ; 006E _ c.

?_441:                                                  ; byte
        db 70H, 61H, 67H, 65H, 20H, 69H, 73H, 3AH       ; 0070 _ page is:
        db 20H, 00H                                     ; 0078 _  .

?_442:                                                  ; byte
        db 42H, 61H, 73H, 65H, 41H, 64H, 64H, 72H       ; 007A _ BaseAddr
        db 4CH, 3AH, 20H, 00H                           ; 0082 _ L: .

?_443:                                                  ; byte
        db 42H, 61H, 73H, 65H, 41H, 64H, 64H, 72H       ; 0086 _ BaseAddr
        db 48H, 3AH, 20H, 00H                           ; 008E _ H: .

?_444:                                                  ; byte
        db 6CH, 65H, 6EH, 67H, 74H, 68H, 4CH, 6FH       ; 0092 _ lengthLo
        db 77H, 3AH, 20H, 00H                           ; 009A _ w: .

?_445:                                                  ; byte
        db 49H, 4EH, 54H, 20H, 4FH, 43H, 00H            ; 009E _ INT OC.

?_446:                                                  ; byte
        db 53H, 74H, 61H, 63H, 6BH, 20H, 45H, 78H       ; 00A5 _ Stack Ex
        db 63H, 65H, 70H, 74H, 69H, 6FH, 6EH, 00H       ; 00AD _ ception.

?_447:                                                  ; byte
        db 45H, 49H, 50H, 20H, 3DH, 20H, 00H            ; 00B5 _ EIP = .

?_448:                                                  ; byte
        db 49H, 4EH, 54H, 20H, 30H, 44H, 20H, 00H       ; 00BC _ INT 0D .

?_449:                                                  ; byte
        db 47H, 65H, 6EH, 65H, 72H, 61H, 6CH, 20H       ; 00C4 _ General 
        db 50H, 72H, 6FH, 74H, 65H, 63H, 74H, 65H       ; 00CC _ Protecte
        db 64H, 20H, 45H, 78H, 63H, 65H, 70H, 74H       ; 00D4 _ d Except
        db 69H, 6FH, 6EH, 00H                           ; 00DC _ ion.



memman:                                                 ; dword
        dd 00100000H, 00000000H                         ; 0000 _ 1048576 0 
        dd 00000000H, 00000000H                         ; 0008 _ 0 0 
        dd 00000000H, 00000000H                         ; 0010 _ 0 0 
        dd 00000000H, 00000000H                         ; 0018 _ 0 0 
        dd 00000000H, 00000000H                         ; 0020 _ 0 0 
        dd 00000000H, 00000000H                         ; 0028 _ 0 0 
        dd 00000000H, 00000000H                         ; 0030 _ 0 0 
        dd 00000000H, 00000000H                         ; 0038 _ 0 0 

keytable:                                               ; byte
        db 00H, 00H, 31H, 32H, 33H, 34H, 35H, 36H       ; 0040 _ ..123456
        db 37H, 38H, 39H, 30H, 2DH, 5EH, 00H, 00H       ; 0048 _ 7890-^..
        db 51H, 57H, 45H, 52H, 54H, 59H, 55H, 49H       ; 0050 _ QWERTYUI
        db 4FH, 50H, 40H, 5BH, 00H, 00H, 41H, 53H       ; 0058 _ OP@[..AS
        db 44H, 46H, 47H, 48H, 4AH, 4BH, 4CH, 3BH       ; 0060 _ DFGHJKL;
        db 3AH, 00H, 00H, 5DH, 5AH, 58H, 43H, 56H       ; 0068 _ :..]ZXCV
        db 42H, 4EH, 4DH, 2CH, 2EH, 2FH, 00H, 2AH       ; 0070 _ BNM,./.*
        db 00H, 20H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0078 _ . ......
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 37H       ; 0080 _ .......7
        db 38H, 39H, 2DH, 34H, 35H, 36H, 2BH, 31H       ; 0088 _ 89-456+1
        db 32H, 33H, 30H, 2EH, 00H, 00H, 00H, 00H       ; 0090 _ 230.....
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0098 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 00A0 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 00A8 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 00B0 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 00B8 _ ........

keytable1:                                              ; byte
        db 00H, 00H, 21H, 40H, 23H, 24H, 25H, 5EH       ; 00C0 _ ..!@#$%^
        db 26H, 2AH, 28H, 29H, 2DH, 3DH, 7EH, 00H       ; 00C8 _ &*()-=~.
        db 00H, 51H, 57H, 45H, 52H, 54H, 59H, 55H       ; 00D0 _ .QWERTYU
        db 49H, 4FH, 50H, 60H, 7BH, 00H, 00H, 41H       ; 00D8 _ IOP`{..A
        db 53H, 44H, 46H, 47H, 48H, 4AH, 4BH, 4CH       ; 00E0 _ SDFGHJKL
        db 2BH, 2AH, 00H, 00H, 7DH, 5AH, 58H, 43H       ; 00E8 _ +*..}ZXC
        db 56H, 42H, 4EH, 4DH, 3CH, 3EH, 3FH, 00H       ; 00F0 _ VBNM<>?.
        db 2AH, 00H, 20H, 00H, 00H, 00H, 00H, 00H       ; 00F8 _ *. .....
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0100 _ ........
        db 37H, 38H, 39H, 2DH, 34H, 35H, 36H, 2BH       ; 0108 _ 789-456+
        db 31H, 32H, 33H, 30H, 2EH, 00H, 00H, 00H       ; 0110 _ 1230....
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0118 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0120 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0128 _ ........
        db 00H, 00H, 00H, 00H, 5FH, 00H, 00H, 00H       ; 0130 _ ...._...
        db 00H, 00H, 00H, 00H, 00H, 00H, 7CH, 00H       ; 0138 _ ......|.
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0140 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0148 _ ........

keyval:                                                 ; byte
        db 30H, 58H                                     ; 0150 _ 0X

?_450:  db 00H                                          ; 0152 _ .

?_451:  db 00H, 00H, 00H, 00H, 00H                      ; 0153 _ .....

mmx:    dd 0FFFFFFFFH                                   ; 0158 _ -1 

mmy:    dd 0FFFFFFFFH                                   ; 015C _ -1 

KEY_CONTROL:                                            ; dword
        dd 0000001DH                                    ; 0160 _ 29 

show_console_window:                                    ; dword
        dd 00000001H                                    ; 0164 _ 1 

console_pos:                                            ; dword
        dd 000000F0H, 00000000H                         ; 0168 _ 240 0 
        dd 00000000H, 00000000H                         ; 0170 _ 0 0 
        dd 00000000H, 00000000H                         ; 0178 _ 0 0 

table_rgb.2153:                                         ; byte
        db 00H, 00H, 00H, 0FFH, 00H, 00H, 00H, 0FFH     ; 0180 _ ........
        db 00H, 0FFH, 0FFH, 00H, 00H, 00H, 0FFH, 0FFH   ; 0188 _ ........
        db 00H, 0FFH, 00H, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH ; 0190 _ ........
        db 0C6H, 0C6H, 0C6H, 84H, 00H, 00H, 00H, 84H    ; 0198 _ ........
        db 00H, 84H, 84H, 00H, 00H, 00H, 84H, 84H       ; 01A0 _ ........
        db 00H, 84H, 00H, 84H, 84H, 84H, 84H, 84H       ; 01A8 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 01B0 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 01B8 _ ........

cursor.2213:                                            ; byte
        db 2AH, 2AH, 2AH, 2AH, 2AH, 2AH, 2AH, 2AH       ; 01C0 _ ********
        db 2AH, 2AH, 2AH, 2AH, 2AH, 2AH, 2EH, 2EH       ; 01C8 _ ******..
        db 2AH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH       ; 01D0 _ *OOOOOOO
        db 4FH, 4FH, 4FH, 4FH, 2AH, 2EH, 2EH, 2EH       ; 01D8 _ OOOO*...
        db 2AH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH       ; 01E0 _ *OOOOOOO
        db 4FH, 4FH, 4FH, 2AH, 2EH, 2EH, 2EH, 2EH       ; 01E8 _ OOO*....
        db 2AH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH       ; 01F0 _ *OOOOOOO
        db 4FH, 4FH, 2AH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 01F8 _ OO*.....
        db 2AH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH       ; 0200 _ *OOOOOOO
        db 4FH, 2AH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0208 _ O*......
        db 2AH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH       ; 0210 _ *OOOOOOO
        db 2AH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0218 _ *.......
        db 2AH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH       ; 0220 _ *OOOOOOO
        db 2AH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0228 _ *.......
        db 2AH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH       ; 0230 _ *OOOOOOO
        db 4FH, 2AH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0238 _ O*......
        db 2AH, 4FH, 4FH, 4FH, 4FH, 2AH, 2AH, 4FH       ; 0240 _ *OOOO**O
        db 4FH, 4FH, 2AH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0248 _ OO*.....
        db 2AH, 4FH, 4FH, 4FH, 2AH, 2EH, 2EH, 2AH       ; 0250 _ *OOO*..*
        db 4FH, 4FH, 4FH, 2AH, 2EH, 2EH, 2EH, 2EH       ; 0258 _ OOO*....
        db 2AH, 4FH, 4FH, 2AH, 2EH, 2EH, 2EH, 2EH       ; 0260 _ *OO*....
        db 2AH, 4FH, 4FH, 4FH, 2AH, 2EH, 2EH, 2EH       ; 0268 _ *OOO*...
        db 2AH, 4FH, 2AH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0270 _ *O*.....
        db 2EH, 2AH, 4FH, 4FH, 4FH, 2AH, 2EH, 2EH       ; 0278 _ .*OOO*..
        db 2AH, 2AH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0280 _ **......
        db 2EH, 2EH, 2AH, 4FH, 4FH, 4FH, 2AH, 2EH       ; 0288 _ ..*OOO*.
        db 2AH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0290 _ *.......
        db 2EH, 2EH, 2EH, 2AH, 4FH, 4FH, 4FH, 2AH       ; 0298 _ ...*OOO*
        db 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 02A0 _ ........
        db 2EH, 2EH, 2EH, 2EH, 2AH, 4FH, 4FH, 2AH       ; 02A8 _ ....*OO*
        db 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 02B0 _ ........
        db 2EH, 2EH, 2EH, 2EH, 2EH, 2AH, 2AH, 2AH       ; 02B8 _ .....***

closebtn.2332:                                          ; byte
        db 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH       ; 02C0 _ OOOOOOOO
        db 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 40H       ; 02C8 _ OOOOOOO@
        db 4FH, 51H, 51H, 51H, 51H, 51H, 51H, 51H       ; 02D0 _ OQQQQQQQ
        db 51H, 51H, 51H, 51H, 51H, 51H, 24H, 40H       ; 02D8 _ QQQQQQ$@
        db 4FH, 51H, 51H, 51H, 51H, 51H, 51H, 51H       ; 02E0 _ OQQQQQQQ
        db 51H, 51H, 51H, 51H, 51H, 51H, 24H, 40H       ; 02E8 _ QQQQQQ$@
        db 4FH, 51H, 51H, 51H, 40H, 40H, 51H, 51H       ; 02F0 _ OQQQ@@QQ
        db 51H, 51H, 40H, 40H, 51H, 51H, 24H, 40H       ; 02F8 _ QQ@@QQ$@
        db 4FH, 51H, 51H, 51H, 51H, 40H, 40H, 51H       ; 0300 _ OQQQQ@@Q
        db 51H, 40H, 40H, 51H, 51H, 51H, 24H, 40H       ; 0308 _ Q@@QQQ$@
        db 4FH, 51H, 51H, 51H, 51H, 51H, 40H, 40H       ; 0310 _ OQQQQQ@@
        db 40H, 40H, 51H, 51H, 51H, 51H, 24H, 40H       ; 0318 _ @@QQQQ$@
        db 4FH, 51H, 51H, 51H, 51H, 51H, 51H, 40H       ; 0320 _ OQQQQQQ@
        db 40H, 51H, 51H, 51H, 51H, 51H, 24H, 40H       ; 0328 _ @QQQQQ$@
        db 4FH, 51H, 51H, 51H, 51H, 51H, 40H, 40H       ; 0330 _ OQQQQQ@@
        db 40H, 40H, 51H, 51H, 51H, 51H, 24H, 40H       ; 0338 _ @@QQQQ$@
        db 4FH, 51H, 51H, 51H, 51H, 40H, 40H, 51H       ; 0340 _ OQQQQ@@Q
        db 51H, 40H, 40H, 51H, 51H, 51H, 24H, 40H       ; 0348 _ Q@@QQQ$@
        db 4FH, 51H, 51H, 51H, 40H, 40H, 51H, 51H       ; 0350 _ OQQQ@@QQ
        db 51H, 51H, 40H, 40H, 51H, 51H, 24H, 40H       ; 0358 _ QQ@@QQ$@
        db 4FH, 51H, 51H, 51H, 51H, 51H, 51H, 51H       ; 0360 _ OQQQQQQQ
        db 51H, 51H, 51H, 51H, 51H, 51H, 24H, 40H       ; 0368 _ QQQQQQ$@
        db 4FH, 51H, 51H, 51H, 51H, 51H, 51H, 51H       ; 0370 _ OQQQQQQQ
        db 51H, 51H, 51H, 51H, 51H, 51H, 24H, 40H       ; 0378 _ QQQQQQ$@
        db 4FH, 24H, 24H, 24H, 24H, 24H, 24H, 24H       ; 0380 _ O$$$$$$$
        db 24H, 24H, 24H, 24H, 24H, 24H, 24H, 40H       ; 0388 _ $$$$$$$@
        db 40H, 40H, 40H, 40H, 40H, 40H, 40H, 40H       ; 0390 _ @@@@@@@@
        db 40H, 40H, 40H, 40H, 40H, 40H, 40H, 40H       ; 0398 _ @@@@@@@@



key_shift:                                              ; dword
        resd    1                                       ; 0000

caps_lock:                                              ; dword
        resd    1                                       ; 0004

first_task_cons_selector:                               ; dword
        resd    1                                       ; 0008

current_console:                                        ; dword
        resd    1                                       ; 000C

console_count:                                          ; dword
        resd    1                                       ; 0010

bootInfo:                                               ; qword
        resb    4                                       ; 0014

?_452:  resw    1                                       ; 0018

?_453:  resw    1                                       ; 001A

keyinfo:                                                ; byte
        resb    24                                      ; 001C

?_454:  resd    1                                       ; 0034

mouseinfo:                                              ; byte
        resb    40                                      ; 0038

keybuf:                                                 ; yword
        resb    32                                      ; 0060

mousebuf:                                               ; byte
        resb    128                                     ; 0080

mdec:                                                   ; oword
        resb    12                                      ; 0100

?_455:  resd    1                                       ; 010C

timerinfo:                                              ; byte
        resb    28                                      ; 0110

timerbuf: resq  1                                       ; 012C

mx:     resd    1                                       ; 0134

my:     resd    1                                       ; 0138

xsize:  resd    1                                       ; 013C

ysize:  resd    1                                       ; 0140

buf_back: resd  15                                      ; 0144

buf_mouse:                                              ; byte
        resb    256                                     ; 0180

shtMsgBox:                                              ; dword
        resd    1                                       ; 0280

shtctl: resd    1                                       ; 0284

sht_back: resd  1                                       ; 0288

sht_mouse:                                              ; dword
        resd    1                                       ; 028C

mouse_clicked_sht:                                      ; dword
        resd    1                                       ; 0290

task_main:                                              ; dword
        resd    1                                       ; 0294

current_console_task:                                   ; dword
        resd    1                                       ; 0298

task_a.1848:                                            ; dword
        resd    9                                       ; 029C

tss_a.1847:                                             ; byte
        resb    128                                     ; 02C0

tss_b.1846:                                             ; byte
        resb    104                                     ; 0340

task_b.1836:                                            ; byte
        resb    12                                      ; 03A8

str.2261:                                               ; byte
        resb    1                                       ; 03B4

?_456:  resb    9                                       ; 03B5

?_457:  resb    2                                       ; 03BE

timerctl:                                               ; byte
        resd    2001                                    ; 03C0

task_timer:                                             ; dword
        resd    1                                       ; 2304

taskctl: resd   1                                       ; 2308


