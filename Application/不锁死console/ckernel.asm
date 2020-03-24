; Disassembly of file: ckernel.o
; Tue Mar 24 14:28:56 2020
; Mode: 32 bits
; Syntax: YASM/NASM
; Instruction set: Pentium Pro






CMain:  ; Function begin
        push    ebp                                     ; 0000 _ 55
        mov     ebp, esp                                ; 0001 _ 89. E5
        push    ebx                                     ; 0003 _ 53
        sub     esp, 132                                ; 0004 _ 81. EC, 00000084
        mov     dword [esp], bootInfo                   ; 000A _ C7. 04 24, 00000014(d)
        call    initBootInfo                            ; 0011 _ E8, FFFFFFFC(rel)
        mov     eax, dword [bootInfo]                   ; 0016 _ A1, 00000014(d)
        mov     dword [ebp-18H], eax                    ; 001B _ 89. 45, E8
        movzx   eax, word [?_417]                       ; 001E _ 0F B7. 05, 00000018(d)
        cwde                                            ; 0025 _ 98
        mov     dword [xsize], eax                      ; 0026 _ A3, 0000013C(d)
        movzx   eax, word [?_418]                       ; 002B _ 0F B7. 05, 0000001A(d)
        cwde                                            ; 0032 _ 98
        mov     dword [ysize], eax                      ; 0033 _ A3, 00000140(d)
        call    init_pit                                ; 0038 _ E8, FFFFFFFC(rel)
        mov     dword [esp+0CH], 0                      ; 003D _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], timerbuf                ; 0045 _ C7. 44 24, 08, 0000012C(d)
        mov     dword [esp+4H], 8                       ; 004D _ C7. 44 24, 04, 00000008
        mov     dword [esp], timerinfo                  ; 0055 _ C7. 04 24, 00000110(d)
        call    fifo8_init                              ; 005C _ E8, FFFFFFFC(rel)
        call    timer_alloc                             ; 0061 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-1CH], eax                    ; 0066 _ 89. 45, E4
        mov     dword [esp+8H], 10                      ; 0069 _ C7. 44 24, 08, 0000000A
        mov     dword [esp+4H], timerinfo               ; 0071 _ C7. 44 24, 04, 00000110(d)
        mov     eax, dword [ebp-1CH]                    ; 0079 _ 8B. 45, E4
        mov     dword [esp], eax                        ; 007C _ 89. 04 24
        call    timer_init                              ; 007F _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 100                     ; 0084 _ C7. 44 24, 04, 00000064
        mov     eax, dword [ebp-1CH]                    ; 008C _ 8B. 45, E4
        mov     dword [esp], eax                        ; 008F _ 89. 04 24
        call    timer_settime                           ; 0092 _ E8, FFFFFFFC(rel)
        call    timer_alloc                             ; 0097 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-20H], eax                    ; 009C _ 89. 45, E0
        mov     dword [esp+8H], 2                       ; 009F _ C7. 44 24, 08, 00000002
        mov     dword [esp+4H], timerinfo               ; 00A7 _ C7. 44 24, 04, 00000110(d)
        mov     eax, dword [ebp-20H]                    ; 00AF _ 8B. 45, E0
        mov     dword [esp], eax                        ; 00B2 _ 89. 04 24
        call    timer_init                              ; 00B5 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 300                     ; 00BA _ C7. 44 24, 04, 0000012C
        mov     eax, dword [ebp-20H]                    ; 00C2 _ 8B. 45, E0
        mov     dword [esp], eax                        ; 00C5 _ 89. 04 24
        call    timer_settime                           ; 00C8 _ E8, FFFFFFFC(rel)
        call    timer_alloc                             ; 00CD _ E8, FFFFFFFC(rel)
        mov     dword [ebp-24H], eax                    ; 00D2 _ 89. 45, DC
        mov     dword [esp+8H], 1                       ; 00D5 _ C7. 44 24, 08, 00000001
        mov     dword [esp+4H], timerinfo               ; 00DD _ C7. 44 24, 04, 00000110(d)
        mov     eax, dword [ebp-24H]                    ; 00E5 _ 8B. 45, DC
        mov     dword [esp], eax                        ; 00E8 _ 89. 04 24
        call    timer_init                              ; 00EB _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 50                      ; 00F0 _ C7. 44 24, 04, 00000032
        mov     eax, dword [ebp-24H]                    ; 00F8 _ 8B. 45, DC
        mov     dword [esp], eax                        ; 00FB _ 89. 04 24
        call    timer_settime                           ; 00FE _ E8, FFFFFFFC(rel)
        mov     dword [esp+0CH], 0                      ; 0103 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], keybuf                  ; 010B _ C7. 44 24, 08, 00000060(d)
        mov     dword [esp+4H], 32                      ; 0113 _ C7. 44 24, 04, 00000020
        mov     dword [esp], keyinfo                    ; 011B _ C7. 04 24, 0000001C(d)
        call    fifo8_init                              ; 0122 _ E8, FFFFFFFC(rel)
        mov     dword [esp+0CH], 0                      ; 0127 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], mousebuf                ; 012F _ C7. 44 24, 08, 00000080(d)
        mov     dword [esp+4H], 128                     ; 0137 _ C7. 44 24, 04, 00000080
        mov     dword [esp], mouseinfo                  ; 013F _ C7. 04 24, 00000038(d)
        call    fifo8_init                              ; 0146 _ E8, FFFFFFFC(rel)
        call    init_palette                            ; 014B _ E8, FFFFFFFC(rel)
        call    init_keyboard                           ; 0150 _ E8, FFFFFFFC(rel)
        call    get_memory_block_count                  ; 0155 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-28H], eax                    ; 015A _ 89. 45, D8
        call    get_adr_buffer                          ; 015D _ E8, FFFFFFFC(rel)
        mov     dword [ebp-2CH], eax                    ; 0162 _ 89. 45, D4
        mov     eax, dword [memman]                     ; 0165 _ A1, 00000000(d)
        mov     dword [esp], eax                        ; 016A _ 89. 04 24
        call    memman_init                             ; 016D _ E8, FFFFFFFC(rel)
        mov     eax, dword [memman]                     ; 0172 _ A1, 00000000(d)
        mov     dword [esp+8H], 1072594944              ; 0177 _ C7. 44 24, 08, 3FEE8000
        mov     dword [esp+4H], 16809984                ; 017F _ C7. 44 24, 04, 01008000
        mov     dword [esp], eax                        ; 0187 _ 89. 04 24
        call    memman_free                             ; 018A _ E8, FFFFFFFC(rel)
        mov     ecx, dword [ysize]                      ; 018F _ 8B. 0D, 00000140(d)
        mov     edx, dword [xsize]                      ; 0195 _ 8B. 15, 0000013C(d)
        mov     eax, dword [memman]                     ; 019B _ A1, 00000000(d)
        mov     dword [esp+0CH], ecx                    ; 01A0 _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 01A4 _ 89. 54 24, 08
        mov     edx, dword [ebp-18H]                    ; 01A8 _ 8B. 55, E8
        mov     dword [esp+4H], edx                     ; 01AB _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 01AF _ 89. 04 24
        call    shtctl_init                             ; 01B2 _ E8, FFFFFFFC(rel)
        mov     dword [shtctl], eax                     ; 01B7 _ A3, 00000264(d)
        mov     eax, dword [shtctl]                     ; 01BC _ A1, 00000264(d)
        mov     dword [esp], eax                        ; 01C1 _ 89. 04 24
        call    sheet_alloc                             ; 01C4 _ E8, FFFFFFFC(rel)
        mov     dword [sht_back], eax                   ; 01C9 _ A3, 00000268(d)
        mov     eax, dword [shtctl]                     ; 01CE _ A1, 00000264(d)
        mov     dword [esp], eax                        ; 01D3 _ 89. 04 24
        call    sheet_alloc                             ; 01D6 _ E8, FFFFFFFC(rel)
        mov     dword [sht_mouse], eax                  ; 01DB _ A3, 0000026C(d)
        mov     edx, dword [xsize]                      ; 01E0 _ 8B. 15, 0000013C(d)
        mov     eax, dword [ysize]                      ; 01E6 _ A1, 00000140(d)
        imul    edx, eax                                ; 01EB _ 0F AF. D0
        mov     eax, dword [memman]                     ; 01EE _ A1, 00000000(d)
        mov     dword [esp+4H], edx                     ; 01F3 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 01F7 _ 89. 04 24
        call    memman_alloc_4k                         ; 01FA _ E8, FFFFFFFC(rel)
        mov     dword [buf_back], eax                   ; 01FF _ A3, 00000144(d)
        mov     ebx, dword [ysize]                      ; 0204 _ 8B. 1D, 00000140(d)
        mov     ecx, dword [xsize]                      ; 020A _ 8B. 0D, 0000013C(d)
        mov     edx, dword [buf_back]                   ; 0210 _ 8B. 15, 00000144(d)
        mov     eax, dword [sht_back]                   ; 0216 _ A1, 00000268(d)
        mov     dword [esp+10H], 99                     ; 021B _ C7. 44 24, 10, 00000063
        mov     dword [esp+0CH], ebx                    ; 0223 _ 89. 5C 24, 0C
        mov     dword [esp+8H], ecx                     ; 0227 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 022B _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 022F _ 89. 04 24
        call    sheet_setbuf                            ; 0232 _ E8, FFFFFFFC(rel)
        mov     eax, dword [sht_mouse]                  ; 0237 _ A1, 0000026C(d)
        mov     dword [esp+10H], 99                     ; 023C _ C7. 44 24, 10, 00000063
        mov     dword [esp+0CH], 16                     ; 0244 _ C7. 44 24, 0C, 00000010
        mov     dword [esp+8H], 16                      ; 024C _ C7. 44 24, 08, 00000010
        mov     dword [esp+4H], buf_mouse               ; 0254 _ C7. 44 24, 04, 00000160(d)
        mov     dword [esp], eax                        ; 025C _ 89. 04 24
        call    sheet_setbuf                            ; 025F _ E8, FFFFFFFC(rel)
        mov     ecx, dword [ysize]                      ; 0264 _ 8B. 0D, 00000140(d)
        mov     edx, dword [xsize]                      ; 026A _ 8B. 15, 0000013C(d)
        mov     eax, dword [buf_back]                   ; 0270 _ A1, 00000144(d)
        mov     dword [esp+8H], ecx                     ; 0275 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 0279 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 027D _ 89. 04 24
        call    init_screen8                            ; 0280 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 99                      ; 0285 _ C7. 44 24, 04, 00000063
        mov     dword [esp], buf_mouse                  ; 028D _ C7. 04 24, 00000160(d)
        call    init_mouse_cursor                       ; 0294 _ E8, FFFFFFFC(rel)
        mov     edx, dword [sht_back]                   ; 0299 _ 8B. 15, 00000268(d)
        mov     eax, dword [shtctl]                     ; 029F _ A1, 00000264(d)
        mov     dword [esp+0CH], 0                      ; 02A4 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 0                       ; 02AC _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], edx                     ; 02B4 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 02B8 _ 89. 04 24
        call    sheet_slide                             ; 02BB _ E8, FFFFFFFC(rel)
        mov     eax, dword [xsize]                      ; 02C0 _ A1, 0000013C(d)
        sub     eax, 16                                 ; 02C5 _ 83. E8, 10
        mov     edx, eax                                ; 02C8 _ 89. C2
        shr     edx, 31                                 ; 02CA _ C1. EA, 1F
        add     eax, edx                                ; 02CD _ 01. D0
        sar     eax, 1                                  ; 02CF _ D1. F8
        mov     dword [mx], eax                         ; 02D1 _ A3, 00000134(d)
        mov     eax, dword [ysize]                      ; 02D6 _ A1, 00000140(d)
        sub     eax, 44                                 ; 02DB _ 83. E8, 2C
        mov     edx, eax                                ; 02DE _ 89. C2
        shr     edx, 31                                 ; 02E0 _ C1. EA, 1F
        add     eax, edx                                ; 02E3 _ 01. D0
        sar     eax, 1                                  ; 02E5 _ D1. F8
        mov     dword [my], eax                         ; 02E7 _ A3, 00000138(d)
        mov     ebx, dword [my]                         ; 02EC _ 8B. 1D, 00000138(d)
        mov     ecx, dword [mx]                         ; 02F2 _ 8B. 0D, 00000134(d)
        mov     edx, dword [sht_mouse]                  ; 02F8 _ 8B. 15, 0000026C(d)
        mov     eax, dword [shtctl]                     ; 02FE _ A1, 00000264(d)
        mov     dword [esp+0CH], ebx                    ; 0303 _ 89. 5C 24, 0C
        mov     dword [esp+8H], ecx                     ; 0307 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 030B _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 030F _ 89. 04 24
        call    sheet_slide                             ; 0312 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], 8                      ; 0317 _ C7. 45, F4, 00000008
        mov     dword [ebp-10H], 7                      ; 031E _ C7. 45, F0, 00000007
        mov     eax, dword [shtctl]                     ; 0325 _ A1, 00000264(d)
        mov     dword [esp+4H], ?_389                   ; 032A _ C7. 44 24, 04, 00000000(d)
        mov     dword [esp], eax                        ; 0332 _ 89. 04 24
        call    message_box                             ; 0335 _ E8, FFFFFFFC(rel)
        mov     dword [shtMsgBox], eax                  ; 033A _ A3, 00000260(d)
        mov     edx, dword [sht_back]                   ; 033F _ 8B. 15, 00000268(d)
        mov     eax, dword [shtctl]                     ; 0345 _ A1, 00000264(d)
        mov     dword [esp+8H], 0                       ; 034A _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], edx                     ; 0352 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0356 _ 89. 04 24
        call    sheet_updown                            ; 0359 _ E8, FFFFFFFC(rel)
        mov     edx, dword [sht_mouse]                  ; 035E _ 8B. 15, 0000026C(d)
        mov     eax, dword [shtctl]                     ; 0364 _ A1, 00000264(d)
        mov     dword [esp+8H], 4                       ; 0369 _ C7. 44 24, 08, 00000004
        mov     dword [esp+4H], edx                     ; 0371 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0375 _ 89. 04 24
        call    sheet_updown                            ; 0378 _ E8, FFFFFFFC(rel)
        call    io_sti                                  ; 037D _ E8, FFFFFFFC(rel)
        mov     dword [esp], mdec                       ; 0382 _ C7. 04 24, 00000100(d)
        call    enable_mouse                            ; 0389 _ E8, FFFFFFFC(rel)
        mov     eax, dword [memman]                     ; 038E _ A1, 00000000(d)
        mov     dword [esp], eax                        ; 0393 _ 89. 04 24
        call    task_init                               ; 0396 _ E8, FFFFFFFC(rel)
        mov     dword [task_a.1819], eax                ; 039B _ A3, 0000027C(d)
        mov     eax, dword [task_a.1819]                ; 03A0 _ A1, 0000027C(d)
        mov     dword [?_419], eax                      ; 03A5 _ A3, 00000034(d)
        mov     eax, dword [task_a.1819]                ; 03AA _ A1, 0000027C(d)
        mov     dword [task_main], eax                  ; 03AF _ A3, 00000274(d)
        mov     eax, dword [task_a.1819]                ; 03B4 _ A1, 0000027C(d)
        mov     dword [esp+8H], 0                       ; 03B9 _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], 0                       ; 03C1 _ C7. 44 24, 04, 00000000
        mov     dword [esp], eax                        ; 03C9 _ 89. 04 24
        call    task_run                                ; 03CC _ E8, FFFFFFFC(rel)
        mov     dword [esp], 0                          ; 03D1 _ C7. 04 24, 00000000
        call    launch_console                          ; 03D8 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-30H], eax                    ; 03DD _ 89. 45, D0
        mov     eax, dword [console_count]              ; 03E0 _ A1, 00000000(d)
        add     eax, 1                                  ; 03E5 _ 83. C0, 01
        mov     dword [console_count], eax              ; 03E8 _ A3, 00000000(d)
        mov     eax, dword [shtctl]                     ; 03ED _ A1, 00000264(d)
        mov     dword [esp+0CH], 2                      ; 03F2 _ C7. 44 24, 0C, 00000002
        mov     dword [esp+8H], 8                       ; 03FA _ C7. 44 24, 08, 00000008
        mov     edx, dword [ebp-30H]                    ; 0402 _ 8B. 55, D0
        mov     dword [esp+4H], edx                     ; 0405 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0409 _ 89. 04 24
        call    sheet_slide                             ; 040C _ E8, FFFFFFFC(rel)
        mov     eax, dword [shtctl]                     ; 0411 _ A1, 00000264(d)
        mov     dword [esp+8H], 2                       ; 0416 _ C7. 44 24, 08, 00000002
        mov     edx, dword [ebp-30H]                    ; 041E _ 8B. 55, D0
        mov     dword [esp+4H], edx                     ; 0421 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0425 _ 89. 04 24
        call    sheet_updown                            ; 0428 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-34H], 0                      ; 042D _ C7. 45, CC, 00000000
        mov     dword [ebp-38H], 0                      ; 0434 _ C7. 45, C8, 00000000
        mov     dword [ebp-3CH], 0                      ; 043B _ C7. 45, C4, 00000000
        mov     dword [ebp-40H], 0                      ; 0442 _ C7. 45, C0, 00000000
        mov     dword [ebp-44H], 0                      ; 0449 _ C7. 45, BC, 00000000
        mov     dword [ebp-14H], 0                      ; 0450 _ C7. 45, EC, 00000000
        mov     dword [ebp-48H], 0                      ; 0457 _ C7. 45, B8, 00000000
        mov     dword [ebp-4CH], 0                      ; 045E _ C7. 45, B4, 00000000
?_001:  mov     dword [esp], keyinfo                    ; 0465 _ C7. 04 24, 0000001C(d)
        call    fifo8_status                            ; 046C _ E8, FFFFFFFC(rel)
        mov     ebx, eax                                ; 0471 _ 89. C3
        mov     dword [esp], mouseinfo                  ; 0473 _ C7. 04 24, 00000038(d)
        call    fifo8_status                            ; 047A _ E8, FFFFFFFC(rel)
        add     ebx, eax                                ; 047F _ 01. C3
        mov     dword [esp], timerinfo                  ; 0481 _ C7. 04 24, 00000110(d)
        call    fifo8_status                            ; 0488 _ E8, FFFFFFFC(rel)
        add     eax, ebx                                ; 048D _ 01. D8
        test    eax, eax                                ; 048F _ 85. C0
        jnz     ?_002                                   ; 0491 _ 75, 0A
        call    io_sti                                  ; 0493 _ E8, FFFFFFFC(rel)
        jmp     ?_014                                   ; 0498 _ E9, 00000412

?_002:  mov     dword [esp], keyinfo                    ; 049D _ C7. 04 24, 0000001C(d)
        call    fifo8_status                            ; 04A4 _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 04A9 _ 85. C0
        je      ?_013                                   ; 04AB _ 0F 84, 000003CD
        call    io_sti                                  ; 04B1 _ E8, FFFFFFFC(rel)
        mov     dword [esp], keyinfo                    ; 04B6 _ C7. 04 24, 0000001C(d)
        call    fifo8_get                               ; 04BD _ E8, FFFFFFFC(rel)
        mov     dword [ebp-34H], eax                    ; 04C2 _ 89. 45, CC
        mov     eax, dword [key_shift]                  ; 04C5 _ A1, 00000000(d)
        test    eax, eax                                ; 04CA _ 85. C0
        jz      ?_003                                   ; 04CC _ 74, 63
        cmp     dword [ebp-34H], 17                     ; 04CE _ 83. 7D, CC, 11
        jnz     ?_003                                   ; 04D2 _ 75, 5D
        mov     eax, dword [console_count]              ; 04D4 _ A1, 00000000(d)
        mov     dword [esp], eax                        ; 04D9 _ 89. 04 24
        call    launch_console                          ; 04DC _ E8, FFFFFFFC(rel)
        mov     dword [ebp-30H], eax                    ; 04E1 _ 89. 45, D0
        mov     eax, dword [shtctl]                     ; 04E4 _ A1, 00000264(d)
        mov     dword [esp+0CH], 176                    ; 04E9 _ C7. 44 24, 0C, 000000B0
        mov     dword [esp+8H], 156                     ; 04F1 _ C7. 44 24, 08, 0000009C
        mov     edx, dword [ebp-30H]                    ; 04F9 _ 8B. 55, D0
        mov     dword [esp+4H], edx                     ; 04FC _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0500 _ 89. 04 24
        call    sheet_slide                             ; 0503 _ E8, FFFFFFFC(rel)
        mov     eax, dword [shtctl]                     ; 0508 _ A1, 00000264(d)
        mov     dword [esp+8H], 1                       ; 050D _ C7. 44 24, 08, 00000001
        mov     edx, dword [ebp-30H]                    ; 0515 _ 8B. 55, D0
        mov     dword [esp+4H], edx                     ; 0518 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 051C _ 89. 04 24
        call    sheet_updown                            ; 051F _ E8, FFFFFFFC(rel)
        mov     eax, dword [console_count]              ; 0524 _ A1, 00000000(d)
        add     eax, 1                                  ; 0529 _ 83. C0, 01
        mov     dword [console_count], eax              ; 052C _ A3, 00000000(d)
?_003:  cmp     dword [ebp-34H], 255                    ; 0531 _ 81. 7D, CC, 000000FF
        jnz     ?_004                                   ; 0538 _ 75, 1B
        mov     eax, dword [current_console_task]       ; 053A _ A1, 00000278(d)
        test    eax, eax                                ; 053F _ 85. C0
        jz      ?_004                                   ; 0541 _ 74, 12
        mov     eax, dword [current_console_task]       ; 0543 _ A1, 00000278(d)
        mov     dword [esp], eax                        ; 0548 _ 89. 04 24
        call    close_console                           ; 054B _ E8, FFFFFFFC(rel)
        jmp     ?_018                                   ; 0550 _ E9, 00000449

?_004:  mov     eax, dword [ebp-34H]                    ; 0555 _ 8B. 45, CC
        mov     dword [esp], eax                        ; 0558 _ 89. 04 24
        call    transferScanCode                        ; 055B _ E8, FFFFFFFC(rel)
        cmp     dword [ebp-34H], 16                     ; 0560 _ 83. 7D, CC, 10
        jnz     ?_005                                   ; 0564 _ 75, 28
        mov     eax, dword [shtctl]                     ; 0566 _ A1, 00000264(d)
        mov     eax, dword [eax+10H]                    ; 056B _ 8B. 40, 10
        lea     ecx, [eax-1H]                           ; 056E _ 8D. 48, FF
        mov     eax, dword [shtctl]                     ; 0571 _ A1, 00000264(d)
        mov     edx, dword [eax+18H]                    ; 0576 _ 8B. 50, 18
        mov     eax, dword [shtctl]                     ; 0579 _ A1, 00000264(d)
        mov     dword [esp+8H], ecx                     ; 057E _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 0582 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0586 _ 89. 04 24
        call    sheet_updown                            ; 0589 _ E8, FFFFFFFC(rel)
?_005:  cmp     dword [ebp-34H], 15                     ; 058E _ 83. 7D, CC, 0F
        jne     ?_011                                   ; 0592 _ 0F 85, 000001B1
        mov     dword [ebp-50H], -1                     ; 0598 _ C7. 45, B0, FFFFFFFF
        cmp     dword [ebp-14H], 0                      ; 059F _ 83. 7D, EC, 00
        jne     ?_009                                   ; 05A3 _ 0F 85, 000000B3
        mov     dword [ebp-14H], 1                      ; 05A9 _ C7. 45, EC, 00000001
        mov     eax, dword [current_console]            ; 05B0 _ A1, 00000000(d)
        cmp     eax, 1                                  ; 05B5 _ 83. F8, 01
        jnz     ?_006                                   ; 05B8 _ 75, 0C
        mov     dword [current_console], 0              ; 05BA _ C7. 05, 00000000(d), 00000000
        jmp     ?_007                                   ; 05C4 _ EB, 0A

?_006:  mov     dword [current_console], 1              ; 05C6 _ C7. 05, 00000000(d), 00000001
?_007:  mov     edx, dword [shtMsgBox]                  ; 05D0 _ 8B. 15, 00000260(d)
        mov     eax, dword [shtctl]                     ; 05D6 _ A1, 00000264(d)
        mov     dword [esp+0CH], 0                      ; 05DB _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], ?_390                   ; 05E3 _ C7. 44 24, 08, 00000008(d)
        mov     dword [esp+4H], edx                     ; 05EB _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 05EF _ 89. 04 24
        call    make_wtitle8                            ; 05F2 _ E8, FFFFFFFC(rel)
        mov     eax, dword [current_console_task]       ; 05F7 _ A1, 00000278(d)
        test    eax, eax                                ; 05FC _ 85. C0
        jz      ?_008                                   ; 05FE _ 74, 2C
        mov     eax, dword [current_console_task]       ; 0600 _ A1, 00000278(d)
        mov     edx, dword [eax+0B4H]                   ; 0605 _ 8B. 90, 000000B4
        mov     eax, dword [shtctl]                     ; 060B _ A1, 00000264(d)
        mov     dword [esp+0CH], 1                      ; 0610 _ C7. 44 24, 0C, 00000001
        mov     dword [esp+8H], ?_391                   ; 0618 _ C7. 44 24, 08, 0000000F(d)
        mov     dword [esp+4H], edx                     ; 0620 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0624 _ 89. 04 24
        call    make_wtitle8                            ; 0627 _ E8, FFFFFFFC(rel)
?_008:  mov     edx, dword [shtMsgBox]                  ; 062C _ 8B. 15, 00000260(d)
        mov     eax, dword [shtctl]                     ; 0632 _ A1, 00000264(d)
        mov     dword [esp+10H], 7                      ; 0637 _ C7. 44 24, 10, 00000007
        mov     dword [esp+0CH], 28                     ; 063F _ C7. 44 24, 0C, 0000001C
        mov     ecx, dword [ebp-0CH]                    ; 0647 _ 8B. 4D, F4
        mov     dword [esp+8H], ecx                     ; 064A _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 064E _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0652 _ 89. 04 24
        call    set_cursor                              ; 0655 _ E8, FFFFFFFC(rel)
        jmp     ?_010                                   ; 065A _ EB, 63

?_009:  mov     dword [ebp-14H], 0                      ; 065C _ C7. 45, EC, 00000000
        mov     edx, dword [shtMsgBox]                  ; 0663 _ 8B. 15, 00000260(d)
        mov     eax, dword [shtctl]                     ; 0669 _ A1, 00000264(d)
        mov     dword [esp+0CH], 1                      ; 066E _ C7. 44 24, 0C, 00000001
        mov     dword [esp+8H], ?_390                   ; 0676 _ C7. 44 24, 08, 00000008(d)
        mov     dword [esp+4H], edx                     ; 067E _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0682 _ 89. 04 24
        call    make_wtitle8                            ; 0685 _ E8, FFFFFFFC(rel)
        mov     eax, dword [current_console_task]       ; 068A _ A1, 00000278(d)
        test    eax, eax                                ; 068F _ 85. C0
        jz      ?_010                                   ; 0691 _ 74, 2C
        mov     eax, dword [current_console_task]       ; 0693 _ A1, 00000278(d)
        mov     edx, dword [eax+0B4H]                   ; 0698 _ 8B. 90, 000000B4
        mov     eax, dword [shtctl]                     ; 069E _ A1, 00000264(d)
        mov     dword [esp+0CH], 0                      ; 06A3 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], ?_391                   ; 06AB _ C7. 44 24, 08, 0000000F(d)
        mov     dword [esp+4H], edx                     ; 06B3 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 06B7 _ 89. 04 24
        call    make_wtitle8                            ; 06BA _ E8, FFFFFFFC(rel)
?_010:  mov     eax, dword [shtMsgBox]                  ; 06BF _ A1, 00000260(d)
        mov     ecx, dword [eax+4H]                     ; 06C4 _ 8B. 48, 04
        mov     edx, dword [shtMsgBox]                  ; 06C7 _ 8B. 15, 00000260(d)
        mov     eax, dword [shtctl]                     ; 06CD _ A1, 00000264(d)
        mov     dword [esp+14H], 21                     ; 06D2 _ C7. 44 24, 14, 00000015
        mov     dword [esp+10H], ecx                    ; 06DA _ 89. 4C 24, 10
        mov     dword [esp+0CH], 0                      ; 06DE _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 0                       ; 06E6 _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], edx                     ; 06EE _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 06F2 _ 89. 04 24
        call    sheet_refresh                           ; 06F5 _ E8, FFFFFFFC(rel)
        mov     eax, dword [current_console_task]       ; 06FA _ A1, 00000278(d)
        test    eax, eax                                ; 06FF _ 85. C0
        jz      ?_011                                   ; 0701 _ 74, 46
        mov     eax, dword [current_console_task]       ; 0703 _ A1, 00000278(d)
        mov     eax, dword [eax+0B4H]                   ; 0708 _ 8B. 80, 000000B4
        mov     ecx, dword [eax+4H]                     ; 070E _ 8B. 48, 04
        mov     eax, dword [current_console_task]       ; 0711 _ A1, 00000278(d)
        mov     edx, dword [eax+0B4H]                   ; 0716 _ 8B. 90, 000000B4
        mov     eax, dword [shtctl]                     ; 071C _ A1, 00000264(d)
        mov     dword [esp+14H], 21                     ; 0721 _ C7. 44 24, 14, 00000015
        mov     dword [esp+10H], ecx                    ; 0729 _ 89. 4C 24, 10
        mov     dword [esp+0CH], 0                      ; 072D _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 0                       ; 0735 _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], edx                     ; 073D _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0741 _ 89. 04 24
        call    sheet_refresh                           ; 0744 _ E8, FFFFFFFC(rel)
?_011:  cmp     dword [ebp-14H], 0                      ; 0749 _ 83. 7D, EC, 00
        jne     ?_012                                   ; 074D _ 0F 85, 000000D9
        mov     eax, dword [ebp-34H]                    ; 0753 _ 8B. 45, CC
        mov     dword [esp], eax                        ; 0756 _ 89. 04 24
        call    transferScanCode                        ; 0759 _ E8, FFFFFFFC(rel)
        test    al, al                                  ; 075E _ 84. C0
        je      ?_014                                   ; 0760 _ 0F 84, 00000149
        cmp     dword [ebp-0CH], 143                    ; 0766 _ 81. 7D, F4, 0000008F
        jg      ?_014                                   ; 076D _ 0F 8F, 0000013C
        mov     edx, dword [shtMsgBox]                  ; 0773 _ 8B. 15, 00000260(d)
        mov     eax, dword [shtctl]                     ; 0779 _ A1, 00000264(d)
        mov     dword [esp+10H], 7                      ; 077E _ C7. 44 24, 10, 00000007
        mov     dword [esp+0CH], 28                     ; 0786 _ C7. 44 24, 0C, 0000001C
        mov     ecx, dword [ebp-0CH]                    ; 078E _ 8B. 4D, F4
        mov     dword [esp+8H], ecx                     ; 0791 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 0795 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0799 _ 89. 04 24
        call    set_cursor                              ; 079C _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-34H]                    ; 07A1 _ 8B. 45, CC
        mov     dword [esp], eax                        ; 07A4 _ 89. 04 24
        call    transferScanCode                        ; 07A7 _ E8, FFFFFFFC(rel)
        mov     byte [ebp-51H], al                      ; 07AC _ 88. 45, AF
        movzx   eax, byte [ebp-51H]                     ; 07AF _ 0F B6. 45, AF
        mov     byte [ebp-66H], al                      ; 07B3 _ 88. 45, 9A
        mov     byte [ebp-65H], 0                       ; 07B6 _ C6. 45, 9B, 00
        mov     edx, dword [shtMsgBox]                  ; 07BA _ 8B. 15, 00000260(d)
        mov     eax, dword [shtctl]                     ; 07C0 _ A1, 00000264(d)
        lea     ecx, [ebp-66H]                          ; 07C5 _ 8D. 4D, 9A
        mov     dword [esp+14H], ecx                    ; 07C8 _ 89. 4C 24, 14
        mov     dword [esp+10H], 0                      ; 07CC _ C7. 44 24, 10, 00000000
        mov     dword [esp+0CH], 28                     ; 07D4 _ C7. 44 24, 0C, 0000001C
        mov     ecx, dword [ebp-0CH]                    ; 07DC _ 8B. 4D, F4
        mov     dword [esp+8H], ecx                     ; 07DF _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 07E3 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 07E7 _ 89. 04 24
        call    showString                              ; 07EA _ E8, FFFFFFFC(rel)
        add     dword [ebp-0CH], 8                      ; 07EF _ 83. 45, F4, 08
        mov     dword [ebp-44H], 1                      ; 07F3 _ C7. 45, BC, 00000001
        mov     edx, dword [shtMsgBox]                  ; 07FA _ 8B. 15, 00000260(d)
        mov     eax, dword [shtctl]                     ; 0800 _ A1, 00000264(d)
        mov     ecx, dword [ebp-10H]                    ; 0805 _ 8B. 4D, F0
        mov     dword [esp+10H], ecx                    ; 0808 _ 89. 4C 24, 10
        mov     dword [esp+0CH], 28                     ; 080C _ C7. 44 24, 0C, 0000001C
        mov     ecx, dword [ebp-0CH]                    ; 0814 _ 8B. 4D, F4
        mov     dword [esp+8H], ecx                     ; 0817 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 081B _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 081F _ 89. 04 24
        call    set_cursor                              ; 0822 _ E8, FFFFFFFC(rel)
        jmp     ?_014                                   ; 0827 _ E9, 00000083

?_012:  mov     eax, dword [ebp-34H]                    ; 082C _ 8B. 45, CC
        mov     dword [esp], eax                        ; 082F _ 89. 04 24
        call    isSpecialKey                            ; 0832 _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 0837 _ 85. C0
        jnz     ?_014                                   ; 0839 _ 75, 74
        mov     eax, dword [current_console_task]       ; 083B _ A1, 00000278(d)
        test    eax, eax                                ; 0840 _ 85. C0
        jz      ?_014                                   ; 0842 _ 74, 6B
        mov     eax, dword [ebp-34H]                    ; 0844 _ 8B. 45, CC
        movzx   eax, al                                 ; 0847 _ 0F B6. C0
        mov     edx, dword [current_console_task]       ; 084A _ 8B. 15, 00000278(d)
        add     edx, 16                                 ; 0850 _ 83. C2, 10
        mov     dword [esp+4H], eax                     ; 0853 _ 89. 44 24, 04
        mov     dword [esp], edx                        ; 0857 _ 89. 14 24
        call    fifo8_put                               ; 085A _ E8, FFFFFFFC(rel)
        mov     dword [esp], keyinfo                    ; 085F _ C7. 04 24, 0000001C(d)
        call    fifo8_status                            ; 0866 _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 086B _ 85. C0
        jnz     ?_014                                   ; 086D _ 75, 40
        mov     eax, dword [task_a.1819]                ; 086F _ A1, 0000027C(d)
        mov     dword [esp], eax                        ; 0874 _ 89. 04 24
        call    task_sleep                              ; 0877 _ E8, FFFFFFFC(rel)
        jmp     ?_014                                   ; 087C _ EB, 31

?_013:  mov     dword [esp], mouseinfo                  ; 087E _ C7. 04 24, 00000038(d)
        call    fifo8_status                            ; 0885 _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 088A _ 85. C0
        jz      ?_014                                   ; 088C _ 74, 21
        mov     ecx, dword [sht_mouse]                  ; 088E _ 8B. 0D, 0000026C(d)
        mov     edx, dword [sht_back]                   ; 0894 _ 8B. 15, 00000268(d)
        mov     eax, dword [shtctl]                     ; 089A _ A1, 00000264(d)
        mov     dword [esp+8H], ecx                     ; 089F _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 08A3 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 08A7 _ 89. 04 24
        call    show_mouse_info                         ; 08AA _ E8, FFFFFFFC(rel)
?_014:  mov     dword [esp], timerinfo                  ; 08AF _ C7. 04 24, 00000110(d)
        call    fifo8_status                            ; 08B6 _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 08BB _ 85. C0
        je      ?_018                                   ; 08BD _ 0F 84, 000000DB
        call    io_sti                                  ; 08C3 _ E8, FFFFFFFC(rel)
        mov     dword [esp], timerinfo                  ; 08C8 _ C7. 04 24, 00000110(d)
        call    fifo8_get                               ; 08CF _ E8, FFFFFFFC(rel)
        mov     dword [ebp-58H], eax                    ; 08D4 _ 89. 45, A8
        cmp     dword [ebp-58H], 0                      ; 08D7 _ 83. 7D, A8, 00
        jz      ?_015                                   ; 08DB _ 74, 24
        mov     dword [esp+8H], 0                       ; 08DD _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], timerinfo               ; 08E5 _ C7. 44 24, 04, 00000110(d)
        mov     eax, dword [ebp-24H]                    ; 08ED _ 8B. 45, DC
        mov     dword [esp], eax                        ; 08F0 _ 89. 04 24
        call    timer_init                              ; 08F3 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], 0                      ; 08F8 _ C7. 45, F0, 00000000
        jmp     ?_016                                   ; 08FF _ EB, 22

?_015:  mov     dword [esp+8H], 1                       ; 0901 _ C7. 44 24, 08, 00000001
        mov     dword [esp+4H], timerinfo               ; 0909 _ C7. 44 24, 04, 00000110(d)
        mov     eax, dword [ebp-24H]                    ; 0911 _ 8B. 45, DC
        mov     dword [esp], eax                        ; 0914 _ 89. 04 24
        call    timer_init                              ; 0917 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], 7                      ; 091C _ C7. 45, F0, 00000007
?_016:  mov     dword [esp+4H], 50                      ; 0923 _ C7. 44 24, 04, 00000032
        mov     eax, dword [ebp-24H]                    ; 092B _ 8B. 45, DC
        mov     dword [esp], eax                        ; 092E _ 89. 04 24
        call    timer_settime                           ; 0931 _ E8, FFFFFFFC(rel)
        cmp     dword [ebp-14H], 0                      ; 0936 _ 83. 7D, EC, 00
        jnz     ?_017                                   ; 093A _ 75, 2F
        mov     edx, dword [shtMsgBox]                  ; 093C _ 8B. 15, 00000260(d)
        mov     eax, dword [shtctl]                     ; 0942 _ A1, 00000264(d)
        mov     ecx, dword [ebp-10H]                    ; 0947 _ 8B. 4D, F0
        mov     dword [esp+10H], ecx                    ; 094A _ 89. 4C 24, 10
        mov     dword [esp+0CH], 28                     ; 094E _ C7. 44 24, 0C, 0000001C
        mov     ecx, dword [ebp-0CH]                    ; 0956 _ 8B. 4D, F4
        mov     dword [esp+8H], ecx                     ; 0959 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 095D _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0961 _ 89. 04 24
        call    set_cursor                              ; 0964 _ E8, FFFFFFFC(rel)
        jmp     ?_018                                   ; 0969 _ EB, 33

?_017:  mov     edx, dword [shtMsgBox]                  ; 096B _ 8B. 15, 00000260(d)
        mov     eax, dword [shtctl]                     ; 0971 _ A1, 00000264(d)
        mov     dword [esp+10H], 7                      ; 0976 _ C7. 44 24, 10, 00000007
        mov     dword [esp+0CH], 28                     ; 097E _ C7. 44 24, 0C, 0000001C
        mov     ecx, dword [ebp-0CH]                    ; 0986 _ 8B. 4D, F4
        mov     dword [esp+8H], ecx                     ; 0989 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 098D _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0991 _ 89. 04 24
        call    set_cursor                              ; 0994 _ E8, FFFFFFFC(rel)
        jmp     ?_001                                   ; 0999 _ E9, FFFFFAC7

?_018:  jmp     ?_001                                   ; 099E _ E9, FFFFFAC2
; CMain End of function

set_cursor:; Function begin
        push    ebp                                     ; 09A3 _ 55
        mov     ebp, esp                                ; 09A4 _ 89. E5
        push    esi                                     ; 09A6 _ 56
        push    ebx                                     ; 09A7 _ 53
        sub     esp, 32                                 ; 09A8 _ 83. EC, 20
        cmp     dword [ebp+0CH], 0                      ; 09AB _ 83. 7D, 0C, 00
        jnz     ?_019                                   ; 09AF _ 75, 02
        jmp     ?_020                                   ; 09B1 _ EB, 77

?_019:  mov     eax, dword [ebp+14H]                    ; 09B3 _ 8B. 45, 14
        lea     esi, [eax+0FH]                          ; 09B6 _ 8D. 70, 0F
        mov     eax, dword [ebp+10H]                    ; 09B9 _ 8B. 45, 10
        lea     ebx, [eax+7H]                           ; 09BC _ 8D. 58, 07
        mov     eax, dword [ebp+18H]                    ; 09BF _ 8B. 45, 18
        movzx   ecx, al                                 ; 09C2 _ 0F B6. C8
        mov     eax, dword [ebp+0CH]                    ; 09C5 _ 8B. 45, 0C
        mov     edx, dword [eax+4H]                     ; 09C8 _ 8B. 50, 04
        mov     eax, dword [ebp+0CH]                    ; 09CB _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 09CE _ 8B. 00
        mov     dword [esp+18H], esi                    ; 09D0 _ 89. 74 24, 18
        mov     dword [esp+14H], ebx                    ; 09D4 _ 89. 5C 24, 14
        mov     ebx, dword [ebp+14H]                    ; 09D8 _ 8B. 5D, 14
        mov     dword [esp+10H], ebx                    ; 09DB _ 89. 5C 24, 10
        mov     ebx, dword [ebp+10H]                    ; 09DF _ 8B. 5D, 10
        mov     dword [esp+0CH], ebx                    ; 09E2 _ 89. 5C 24, 0C
        mov     dword [esp+8H], ecx                     ; 09E6 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 09EA _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 09EE _ 89. 04 24
        call    boxfill8                                ; 09F1 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+14H]                    ; 09F6 _ 8B. 45, 14
        lea     edx, [eax+10H]                          ; 09F9 _ 8D. 50, 10
        mov     eax, dword [ebp+10H]                    ; 09FC _ 8B. 45, 10
        add     eax, 8                                  ; 09FF _ 83. C0, 08
        mov     dword [esp+14H], edx                    ; 0A02 _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 0A06 _ 89. 44 24, 10
        mov     eax, dword [ebp+14H]                    ; 0A0A _ 8B. 45, 14
        mov     dword [esp+0CH], eax                    ; 0A0D _ 89. 44 24, 0C
        mov     eax, dword [ebp+10H]                    ; 0A11 _ 8B. 45, 10
        mov     dword [esp+8H], eax                     ; 0A14 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 0A18 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0A1B _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0A1F _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0A22 _ 89. 04 24
        call    sheet_refresh                           ; 0A25 _ E8, FFFFFFFC(rel)
?_020:  add     esp, 32                                 ; 0A2A _ 83. C4, 20
        pop     ebx                                     ; 0A2D _ 5B
        pop     esi                                     ; 0A2E _ 5E
        pop     ebp                                     ; 0A2F _ 5D
        ret                                             ; 0A30 _ C3
; set_cursor End of function

isSpecialKey:; Function begin
        push    ebp                                     ; 0A31 _ 55
        mov     ebp, esp                                ; 0A32 _ 89. E5
        sub     esp, 24                                 ; 0A34 _ 83. EC, 18
        mov     eax, dword [ebp+8H]                     ; 0A37 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0A3A _ 89. 04 24
        call    transferScanCode                        ; 0A3D _ E8, FFFFFFFC(rel)
        cmp     dword [ebp+8H], 58                      ; 0A42 _ 83. 7D, 08, 3A
        jz      ?_021                                   ; 0A46 _ 74, 2D
        cmp     dword [ebp+8H], 29                      ; 0A48 _ 83. 7D, 08, 1D
        jz      ?_021                                   ; 0A4C _ 74, 27
        cmp     dword [ebp+8H], 186                     ; 0A4E _ 81. 7D, 08, 000000BA
        jz      ?_021                                   ; 0A55 _ 74, 1E
        cmp     dword [ebp+8H], 42                      ; 0A57 _ 83. 7D, 08, 2A
        jz      ?_021                                   ; 0A5B _ 74, 18
        cmp     dword [ebp+8H], 54                      ; 0A5D _ 83. 7D, 08, 36
        jz      ?_021                                   ; 0A61 _ 74, 12
        cmp     dword [ebp+8H], 170                     ; 0A63 _ 81. 7D, 08, 000000AA
        jz      ?_021                                   ; 0A6A _ 74, 09
        cmp     dword [ebp+8H], 182                     ; 0A6C _ 81. 7D, 08, 000000B6
        jnz     ?_022                                   ; 0A73 _ 75, 07
?_021:  mov     eax, 1                                  ; 0A75 _ B8, 00000001
        jmp     ?_023                                   ; 0A7A _ EB, 05

?_022:  mov     eax, 0                                  ; 0A7C _ B8, 00000000
?_023:  leave                                           ; 0A81 _ C9
        ret                                             ; 0A82 _ C3
; isSpecialKey End of function

transferScanCode:; Function begin
        push    ebp                                     ; 0A83 _ 55
        mov     ebp, esp                                ; 0A84 _ 89. E5
        sub     esp, 16                                 ; 0A86 _ 83. EC, 10
        cmp     dword [ebp+8H], 42                      ; 0A89 _ 83. 7D, 08, 2A
        jnz     ?_024                                   ; 0A8D _ 75, 0D
        mov     eax, dword [key_shift]                  ; 0A8F _ A1, 00000000(d)
        or      eax, 01H                                ; 0A94 _ 83. C8, 01
        mov     dword [key_shift], eax                  ; 0A97 _ A3, 00000000(d)
?_024:  cmp     dword [ebp+8H], 54                      ; 0A9C _ 83. 7D, 08, 36
        jnz     ?_025                                   ; 0AA0 _ 75, 0D
        mov     eax, dword [key_shift]                  ; 0AA2 _ A1, 00000000(d)
        or      eax, 02H                                ; 0AA7 _ 83. C8, 02
        mov     dword [key_shift], eax                  ; 0AAA _ A3, 00000000(d)
?_025:  cmp     dword [ebp+8H], 170                     ; 0AAF _ 81. 7D, 08, 000000AA
        jnz     ?_026                                   ; 0AB6 _ 75, 0D
        mov     eax, dword [key_shift]                  ; 0AB8 _ A1, 00000000(d)
        and     eax, 0FFFFFFFEH                         ; 0ABD _ 83. E0, FE
        mov     dword [key_shift], eax                  ; 0AC0 _ A3, 00000000(d)
?_026:  cmp     dword [ebp+8H], 182                     ; 0AC5 _ 81. 7D, 08, 000000B6
        jnz     ?_027                                   ; 0ACC _ 75, 0D
        mov     eax, dword [key_shift]                  ; 0ACE _ A1, 00000000(d)
        and     eax, 0FFFFFFFDH                         ; 0AD3 _ 83. E0, FD
        mov     dword [key_shift], eax                  ; 0AD6 _ A3, 00000000(d)
?_027:  cmp     dword [ebp+8H], 58                      ; 0ADB _ 83. 7D, 08, 3A
        jnz     ?_029                                   ; 0ADF _ 75, 1F
        mov     eax, dword [caps_lock]                  ; 0AE1 _ A1, 00000000(d)
        test    eax, eax                                ; 0AE6 _ 85. C0
        jnz     ?_028                                   ; 0AE8 _ 75, 0C
        mov     dword [caps_lock], 1                    ; 0AEA _ C7. 05, 00000000(d), 00000001
        jmp     ?_029                                   ; 0AF4 _ EB, 0A

?_028:  mov     dword [caps_lock], 0                    ; 0AF6 _ C7. 05, 00000000(d), 00000000
?_029:  cmp     dword [ebp+8H], 42                      ; 0B00 _ 83. 7D, 08, 2A
        jz      ?_030                                   ; 0B04 _ 74, 24
        cmp     dword [ebp+8H], 54                      ; 0B06 _ 83. 7D, 08, 36
        jz      ?_030                                   ; 0B0A _ 74, 1E
        cmp     dword [ebp+8H], 170                     ; 0B0C _ 81. 7D, 08, 000000AA
        jz      ?_030                                   ; 0B13 _ 74, 15
        cmp     dword [ebp+8H], 182                     ; 0B15 _ 81. 7D, 08, 000000B6
        jz      ?_030                                   ; 0B1C _ 74, 0C
        cmp     dword [ebp+8H], 83                      ; 0B1E _ 83. 7D, 08, 53
        jg      ?_030                                   ; 0B22 _ 7F, 06
        cmp     dword [ebp+8H], 58                      ; 0B24 _ 83. 7D, 08, 3A
        jnz     ?_031                                   ; 0B28 _ 75, 0A
?_030:  mov     eax, 0                                  ; 0B2A _ B8, 00000000
        jmp     ?_036                                   ; 0B2F _ E9, 00000089

?_031:  mov     byte [ebp-1H], 0                        ; 0B34 _ C6. 45, FF, 00
        mov     eax, dword [key_shift]                  ; 0B38 _ A1, 00000000(d)
        test    eax, eax                                ; 0B3D _ 85. C0
        jnz     ?_033                                   ; 0B3F _ 75, 46
        cmp     dword [ebp+8H], 83                      ; 0B41 _ 83. 7D, 08, 53
        jg      ?_033                                   ; 0B45 _ 7F, 40
        mov     eax, dword [ebp+8H]                     ; 0B47 _ 8B. 45, 08
        add     eax, keytable                           ; 0B4A _ 05, 00000020(d)
        movzx   eax, byte [eax]                         ; 0B4F _ 0F B6. 00
        test    al, al                                  ; 0B52 _ 84. C0
        jz      ?_033                                   ; 0B54 _ 74, 31
        mov     eax, dword [ebp+8H]                     ; 0B56 _ 8B. 45, 08
        add     eax, keytable                           ; 0B59 _ 05, 00000020(d)
        movzx   eax, byte [eax]                         ; 0B5E _ 0F B6. 00
        mov     byte [ebp-1H], al                       ; 0B61 _ 88. 45, FF
        cmp     byte [ebp-1H], 64                       ; 0B64 _ 80. 7D, FF, 40
        jle     ?_032                                   ; 0B68 _ 7E, 1B
        cmp     byte [ebp-1H], 90                       ; 0B6A _ 80. 7D, FF, 5A
        jg      ?_032                                   ; 0B6E _ 7F, 15
        mov     eax, dword [caps_lock]                  ; 0B70 _ A1, 00000000(d)
        test    eax, eax                                ; 0B75 _ 85. C0
        jnz     ?_032                                   ; 0B77 _ 75, 0C
        movzx   eax, byte [ebp-1H]                      ; 0B79 _ 0F B6. 45, FF
        add     eax, 32                                 ; 0B7D _ 83. C0, 20
        mov     byte [ebp-1H], al                       ; 0B80 _ 88. 45, FF
        jmp     ?_035                                   ; 0B83 _ EB, 34

?_032:  jmp     ?_035                                   ; 0B85 _ EB, 32

?_033:  mov     eax, dword [key_shift]                  ; 0B87 _ A1, 00000000(d)
        test    eax, eax                                ; 0B8C _ 85. C0
        jz      ?_034                                   ; 0B8E _ 74, 25
        cmp     dword [ebp+8H], 127                     ; 0B90 _ 83. 7D, 08, 7F
        jg      ?_034                                   ; 0B94 _ 7F, 1F
        mov     eax, dword [ebp+8H]                     ; 0B96 _ 8B. 45, 08
        add     eax, keytable1                          ; 0B99 _ 05, 00000080(d)
        movzx   eax, byte [eax]                         ; 0B9E _ 0F B6. 00
        test    al, al                                  ; 0BA1 _ 84. C0
        jz      ?_034                                   ; 0BA3 _ 74, 10
        mov     eax, dword [ebp+8H]                     ; 0BA5 _ 8B. 45, 08
        add     eax, keytable1                          ; 0BA8 _ 05, 00000080(d)
        movzx   eax, byte [eax]                         ; 0BAD _ 0F B6. 00
        mov     byte [ebp-1H], al                       ; 0BB0 _ 88. 45, FF
        jmp     ?_035                                   ; 0BB3 _ EB, 04

?_034:  mov     byte [ebp-1H], 0                        ; 0BB5 _ C6. 45, FF, 00
?_035:  movzx   eax, byte [ebp-1H]                      ; 0BB9 _ 0F B6. 45, FF
?_036:  leave                                           ; 0BBD _ C9
        ret                                             ; 0BBE _ C3
; transferScanCode End of function

launch_console:; Function begin
        push    ebp                                     ; 0BBF _ 55
        mov     ebp, esp                                ; 0BC0 _ 89. E5
        push    ebx                                     ; 0BC2 _ 53
        sub     esp, 68                                 ; 0BC3 _ 83. EC, 44
        mov     dword [ebp-0CH], 0                      ; 0BC6 _ C7. 45, F4, 00000000
        mov     eax, dword [show_console_window]        ; 0BCD _ A1, 00000000(d)
        test    eax, eax                                ; 0BD2 _ 85. C0
        je      ?_039                                   ; 0BD4 _ 0F 84, 0000010D
        mov     eax, dword [shtctl]                     ; 0BDA _ A1, 00000264(d)
        mov     dword [esp], eax                        ; 0BDF _ 89. 04 24
        call    sheet_alloc                             ; 0BE2 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 0BE7 _ 89. 45, F4
        mov     eax, dword [memman]                     ; 0BEA _ A1, 00000000(d)
        mov     dword [esp+4H], 42240                   ; 0BEF _ C7. 44 24, 04, 0000A500
        mov     dword [esp], eax                        ; 0BF7 _ 89. 04 24
        call    memman_alloc_4k                         ; 0BFA _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 0BFF _ 89. 45, F0
        mov     dword [esp+10H], 99                     ; 0C02 _ C7. 44 24, 10, 00000063
        mov     dword [esp+0CH], 165                    ; 0C0A _ C7. 44 24, 0C, 000000A5
        mov     dword [esp+8H], 256                     ; 0C12 _ C7. 44 24, 08, 00000100
        mov     eax, dword [ebp-10H]                    ; 0C1A _ 8B. 45, F0
        mov     dword [esp+4H], eax                     ; 0C1D _ 89. 44 24, 04
        mov     eax, dword [ebp-0CH]                    ; 0C21 _ 8B. 45, F4
        mov     dword [esp], eax                        ; 0C24 _ 89. 04 24
        call    sheet_setbuf                            ; 0C27 _ E8, FFFFFFFC(rel)
        cmp     dword [ebp+8H], 0                       ; 0C2C _ 83. 7D, 08, 00
        jle     ?_037                                   ; 0C30 _ 7E, 26
        mov     eax, dword [shtctl]                     ; 0C32 _ A1, 00000264(d)
        mov     dword [esp+0CH], 1                      ; 0C37 _ C7. 44 24, 0C, 00000001
        mov     dword [esp+8H], ?_391                   ; 0C3F _ C7. 44 24, 08, 0000000F(d)
        mov     edx, dword [ebp-0CH]                    ; 0C47 _ 8B. 55, F4
        mov     dword [esp+4H], edx                     ; 0C4A _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0C4E _ 89. 04 24
        call    make_window8                            ; 0C51 _ E8, FFFFFFFC(rel)
        jmp     ?_038                                   ; 0C56 _ EB, 24

?_037:  mov     eax, dword [shtctl]                     ; 0C58 _ A1, 00000264(d)
        mov     dword [esp+0CH], 0                      ; 0C5D _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], ?_391                   ; 0C65 _ C7. 44 24, 08, 0000000F(d)
        mov     edx, dword [ebp-0CH]                    ; 0C6D _ 8B. 55, F4
        mov     dword [esp+4H], edx                     ; 0C70 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0C74 _ 89. 04 24
        call    make_window8                            ; 0C77 _ E8, FFFFFFFC(rel)
?_038:  mov     eax, dword [ebp-0CH]                    ; 0C7C _ 8B. 45, F4
        mov     ecx, dword [eax+8H]                     ; 0C7F _ 8B. 48, 08
        mov     eax, dword [ebp-0CH]                    ; 0C82 _ 8B. 45, F4
        mov     edx, dword [eax+4H]                     ; 0C85 _ 8B. 50, 04
        mov     eax, dword [shtctl]                     ; 0C88 _ A1, 00000264(d)
        mov     dword [esp+14H], ecx                    ; 0C8D _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 0C91 _ 89. 54 24, 10
        mov     dword [esp+0CH], 0                      ; 0C95 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 0                       ; 0C9D _ C7. 44 24, 08, 00000000
        mov     edx, dword [ebp-0CH]                    ; 0CA5 _ 8B. 55, F4
        mov     dword [esp+4H], edx                     ; 0CA8 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0CAC _ 89. 04 24
        call    sheet_refresh                           ; 0CAF _ E8, FFFFFFFC(rel)
        mov     dword [esp+14H], 0                      ; 0CB4 _ C7. 44 24, 14, 00000000
        mov     dword [esp+10H], 128                    ; 0CBC _ C7. 44 24, 10, 00000080
        mov     dword [esp+0CH], 240                    ; 0CC4 _ C7. 44 24, 0C, 000000F0
        mov     dword [esp+8H], 28                      ; 0CCC _ C7. 44 24, 08, 0000001C
        mov     dword [esp+4H], 8                       ; 0CD4 _ C7. 44 24, 04, 00000008
        mov     eax, dword [ebp-0CH]                    ; 0CDC _ 8B. 45, F4
        mov     dword [esp], eax                        ; 0CDF _ 89. 04 24
        call    make_textbox8                           ; 0CE2 _ E8, FFFFFFFC(rel)
?_039:  call    task_alloc                              ; 0CE7 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-14H], eax                    ; 0CEC _ 89. 45, EC
        mov     eax, dword [ebp-14H]                    ; 0CEF _ 8B. 45, EC
        mov     edx, dword [ebp-0CH]                    ; 0CF2 _ 8B. 55, F4
        mov     dword [eax+0B4H], edx                   ; 0CF5 _ 89. 90, 000000B4
        cmp     dword [ebp-0CH], 0                      ; 0CFB _ 83. 7D, F4, 00
        jz      ?_040                                   ; 0CFF _ 74, 09
        mov     eax, dword [ebp-0CH]                    ; 0D01 _ 8B. 45, F4
        mov     edx, dword [ebp-14H]                    ; 0D04 _ 8B. 55, EC
        mov     dword [eax+20H], edx                    ; 0D07 _ 89. 50, 20
?_040:  mov     eax, dword [current_console_task]       ; 0D0A _ A1, 00000278(d)
        test    eax, eax                                ; 0D0F _ 85. C0
        je      ?_041                                   ; 0D11 _ 0F 84, 00000082
        cmp     dword [ebp-0CH], 0                      ; 0D17 _ 83. 7D, F4, 00
        jz      ?_041                                   ; 0D1B _ 74, 7C
        mov     eax, dword [current_console_task]       ; 0D1D _ A1, 00000278(d)
        mov     edx, dword [eax+0B4H]                   ; 0D22 _ 8B. 90, 000000B4
        mov     eax, dword [shtctl]                     ; 0D28 _ A1, 00000264(d)
        mov     dword [esp+0CH], 0                      ; 0D2D _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], ?_391                   ; 0D35 _ C7. 44 24, 08, 0000000F(d)
        mov     dword [esp+4H], edx                     ; 0D3D _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0D41 _ 89. 04 24
        call    make_wtitle8                            ; 0D44 _ E8, FFFFFFFC(rel)
        mov     eax, dword [current_console_task]       ; 0D49 _ A1, 00000278(d)
        mov     eax, dword [eax+0B4H]                   ; 0D4E _ 8B. 80, 000000B4
        mov     ebx, dword [eax+8H]                     ; 0D54 _ 8B. 58, 08
        mov     eax, dword [current_console_task]       ; 0D57 _ A1, 00000278(d)
        mov     eax, dword [eax+0B4H]                   ; 0D5C _ 8B. 80, 000000B4
        mov     ecx, dword [eax+4H]                     ; 0D62 _ 8B. 48, 04
        mov     eax, dword [current_console_task]       ; 0D65 _ A1, 00000278(d)
        mov     edx, dword [eax+0B4H]                   ; 0D6A _ 8B. 90, 000000B4
        mov     eax, dword [shtctl]                     ; 0D70 _ A1, 00000264(d)
        mov     dword [esp+14H], ebx                    ; 0D75 _ 89. 5C 24, 14
        mov     dword [esp+10H], ecx                    ; 0D79 _ 89. 4C 24, 10
        mov     dword [esp+0CH], 0                      ; 0D7D _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 0                       ; 0D85 _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], edx                     ; 0D8D _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0D91 _ 89. 04 24
        call    sheet_refresh                           ; 0D94 _ E8, FFFFFFFC(rel)
?_041:  mov     eax, dword [ebp-14H]                    ; 0D99 _ 8B. 45, EC
        mov     dword [current_console_task], eax       ; 0D9C _ A3, 00000278(d)
        call    get_code32_addr                         ; 0DA1 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-18H], eax                    ; 0DA6 _ 89. 45, E8
        mov     eax, dword [ebp-14H]                    ; 0DA9 _ 8B. 45, EC
        mov     dword [eax+8CH], 0                      ; 0DAC _ C7. 80, 0000008C, 00000000
        mov     eax, dword [ebp-14H]                    ; 0DB6 _ 8B. 45, EC
        mov     dword [eax+90H], 1073741824             ; 0DB9 _ C7. 80, 00000090, 40000000
        mov     eax, console_task                       ; 0DC3 _ B8, 00000000(d)
        sub     eax, dword [ebp-18H]                    ; 0DC8 _ 2B. 45, E8
        mov     edx, eax                                ; 0DCB _ 89. C2
        mov     eax, dword [ebp-14H]                    ; 0DCD _ 8B. 45, EC
        mov     dword [eax+4CH], edx                    ; 0DD0 _ 89. 50, 4C
        mov     eax, dword [ebp-14H]                    ; 0DD3 _ 8B. 45, EC
        mov     dword [eax+74H], 0                      ; 0DD6 _ C7. 40, 74, 00000000
        mov     eax, dword [ebp-14H]                    ; 0DDD _ 8B. 45, EC
        mov     dword [eax+78H], 8                      ; 0DE0 _ C7. 40, 78, 00000008
        mov     eax, dword [ebp-14H]                    ; 0DE7 _ 8B. 45, EC
        mov     dword [eax+7CH], 32                     ; 0DEA _ C7. 40, 7C, 00000020
        mov     eax, dword [ebp-14H]                    ; 0DF1 _ 8B. 45, EC
        mov     dword [eax+80H], 24                     ; 0DF4 _ C7. 80, 00000080, 00000018
        mov     eax, dword [ebp-14H]                    ; 0DFE _ 8B. 45, EC
        mov     dword [eax+84H], 0                      ; 0E01 _ C7. 80, 00000084, 00000000
        mov     eax, dword [ebp-14H]                    ; 0E0B _ 8B. 45, EC
        mov     dword [eax+88H], 16                     ; 0E0E _ C7. 80, 00000088, 00000010
        mov     eax, dword [memman]                     ; 0E18 _ A1, 00000000(d)
        mov     dword [esp+4H], 65536                   ; 0E1D _ C7. 44 24, 04, 00010000
        mov     dword [esp], eax                        ; 0E25 _ 89. 04 24
        call    memman_alloc_4k                         ; 0E28 _ E8, FFFFFFFC(rel)
        mov     edx, dword [ebp-14H]                    ; 0E2D _ 8B. 55, EC
        mov     dword [edx+0B8H], eax                   ; 0E30 _ 89. 82, 000000B8
        mov     eax, dword [ebp-14H]                    ; 0E36 _ 8B. 45, EC
        mov     eax, dword [eax+0B8H]                   ; 0E39 _ 8B. 80, 000000B8
        lea     edx, [eax+3F4H]                         ; 0E3F _ 8D. 90, 000003F4
        mov     eax, dword [ebp-14H]                    ; 0E45 _ 8B. 45, EC
        mov     dword [eax+64H], edx                    ; 0E48 _ 89. 50, 64
        mov     eax, dword [ebp-14H]                    ; 0E4B _ 8B. 45, EC
        mov     eax, dword [eax+64H]                    ; 0E4E _ 8B. 40, 64
        add     eax, 4                                  ; 0E51 _ 83. C0, 04
        mov     edx, dword [ebp-0CH]                    ; 0E54 _ 8B. 55, F4
        mov     dword [eax], edx                        ; 0E57 _ 89. 10
        mov     eax, dword [ebp-14H]                    ; 0E59 _ 8B. 45, EC
        mov     eax, dword [eax+64H]                    ; 0E5C _ 8B. 40, 64
        add     eax, 8                                  ; 0E5F _ 83. C0, 08
        mov     ebx, eax                                ; 0E62 _ 89. C3
        mov     eax, dword [memman]                     ; 0E64 _ A1, 00000000(d)
        mov     dword [esp], eax                        ; 0E69 _ 89. 04 24
        call    memman_total                            ; 0E6C _ E8, FFFFFFFC(rel)
        mov     dword [ebx], eax                        ; 0E71 _ 89. 03
        mov     eax, dword [memman]                     ; 0E73 _ A1, 00000000(d)
        mov     dword [esp+4H], 128                     ; 0E78 _ C7. 44 24, 04, 00000080
        mov     dword [esp], eax                        ; 0E80 _ 89. 04 24
        call    memman_alloc                            ; 0E83 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-1CH], eax                    ; 0E88 _ 89. 45, E4
        mov     eax, dword [ebp-14H]                    ; 0E8B _ 8B. 45, EC
        lea     edx, [eax+10H]                          ; 0E8E _ 8D. 50, 10
        mov     eax, dword [ebp-14H]                    ; 0E91 _ 8B. 45, EC
        mov     dword [esp+0CH], eax                    ; 0E94 _ 89. 44 24, 0C
        mov     eax, dword [ebp-1CH]                    ; 0E98 _ 8B. 45, E4
        mov     dword [esp+8H], eax                     ; 0E9B _ 89. 44 24, 08
        mov     dword [esp+4H], 128                     ; 0E9F _ C7. 44 24, 04, 00000080
        mov     dword [esp], edx                        ; 0EA7 _ 89. 14 24
        call    fifo8_init                              ; 0EAA _ E8, FFFFFFFC(rel)
        mov     dword [esp+8H], 5                       ; 0EAF _ C7. 44 24, 08, 00000005
        mov     dword [esp+4H], 1                       ; 0EB7 _ C7. 44 24, 04, 00000001
        mov     eax, dword [ebp-14H]                    ; 0EBF _ 8B. 45, EC
        mov     dword [esp], eax                        ; 0EC2 _ 89. 04 24
        call    task_run                                ; 0EC5 _ E8, FFFFFFFC(rel)
        cmp     dword [ebp+8H], 0                       ; 0ECA _ 83. 7D, 08, 00
        jnz     ?_042                                   ; 0ECE _ 75, 0A
        mov     eax, dword [ebp-14H]                    ; 0ED0 _ 8B. 45, EC
        mov     eax, dword [eax]                        ; 0ED3 _ 8B. 00
        mov     dword [first_task_cons_selector], eax   ; 0ED5 _ A3, 00000000(d)
?_042:  mov     eax, dword [ebp-0CH]                    ; 0EDA _ 8B. 45, F4
        add     esp, 68                                 ; 0EDD _ 83. C4, 44
        pop     ebx                                     ; 0EE0 _ 5B
        pop     ebp                                     ; 0EE1 _ 5D
        ret                                             ; 0EE2 _ C3
; launch_console End of function

kill_process:; Function begin
        push    ebp                                     ; 0EE3 _ 55
        mov     ebp, esp                                ; 0EE4 _ 89. E5
        sub     esp, 40                                 ; 0EE6 _ 83. EC, 28
        call    task_now                                ; 0EE9 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 0EEE _ 89. 45, F4
        mov     eax, dword [ebp-0CH]                    ; 0EF1 _ 8B. 45, F4
        mov     edx, dword [eax+94H]                    ; 0EF4 _ 8B. 90, 00000094
        mov     eax, dword [ebp-0CH]                    ; 0EFA _ 8B. 45, F4
        mov     eax, dword [eax+9CH]                    ; 0EFD _ 8B. 80, 0000009C
        mov     dword [esp+4H], edx                     ; 0F03 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0F07 _ 89. 04 24
        call    cons_newline                            ; 0F0A _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 0F0F _ 8B. 45, F4
        mov     eax, dword [eax+9CH]                    ; 0F12 _ 8B. 80, 0000009C
        lea     edx, [eax+10H]                          ; 0F18 _ 8D. 50, 10
        mov     eax, dword [ebp-0CH]                    ; 0F1B _ 8B. 45, F4
        mov     dword [eax+9CH], edx                    ; 0F1E _ 89. 90, 0000009C
        mov     eax, dword [ebp-0CH]                    ; 0F24 _ 8B. 45, F4
        add     eax, 48                                 ; 0F27 _ 83. C0, 30
        mov     dword [esp], eax                        ; 0F2A _ 89. 04 24
        call    asm_end_app                             ; 0F2D _ E8, FFFFFFFC(rel)
        leave                                           ; 0F32 _ C9
        ret                                             ; 0F33 _ C3
; kill_process End of function

cmd_dir:; Function begin
        push    ebp                                     ; 0F34 _ 55
        mov     ebp, esp                                ; 0F35 _ 89. E5
        push    ebx                                     ; 0F37 _ 53
        sub     esp, 68                                 ; 0F38 _ 83. EC, 44
        call    task_now                                ; 0F3B _ E8, FFFFFFFC(rel)
        mov     dword [ebp-18H], eax                    ; 0F40 _ 89. 45, E8
        mov     dword [ebp-0CH], 78848                  ; 0F43 _ C7. 45, F4, 00013400
        mov     eax, dword [memman]                     ; 0F4A _ A1, 00000000(d)
        mov     dword [esp+4H], 13                      ; 0F4F _ C7. 44 24, 04, 0000000D
        mov     dword [esp], eax                        ; 0F57 _ 89. 04 24
        call    memman_alloc                            ; 0F5A _ E8, FFFFFFFC(rel)
        mov     dword [ebp-1CH], eax                    ; 0F5F _ 89. 45, E4
        mov     eax, dword [ebp-1CH]                    ; 0F62 _ 8B. 45, E4
        add     eax, 12                                 ; 0F65 _ 83. C0, 0C
        mov     byte [eax], 0                           ; 0F68 _ C6. 00, 00
        jmp     ?_050                                   ; 0F6B _ E9, 0000013C

?_043:  mov     dword [ebp-10H], 0                      ; 0F70 _ C7. 45, F0, 00000000
        jmp     ?_046                                   ; 0F77 _ EB, 2C

?_044:  mov     edx, dword [ebp-0CH]                    ; 0F79 _ 8B. 55, F4
        mov     eax, dword [ebp-10H]                    ; 0F7C _ 8B. 45, F0
        add     eax, edx                                ; 0F7F _ 01. D0
        movzx   eax, byte [eax]                         ; 0F81 _ 0F B6. 00
        test    al, al                                  ; 0F84 _ 84. C0
        jz      ?_045                                   ; 0F86 _ 74, 1B
        mov     edx, dword [ebp-10H]                    ; 0F88 _ 8B. 55, F0
        mov     eax, dword [ebp-1CH]                    ; 0F8B _ 8B. 45, E4
        add     edx, eax                                ; 0F8E _ 01. C2
        mov     ecx, dword [ebp-0CH]                    ; 0F90 _ 8B. 4D, F4
        mov     eax, dword [ebp-10H]                    ; 0F93 _ 8B. 45, F0
        add     eax, ecx                                ; 0F96 _ 01. C8
        movzx   eax, byte [eax]                         ; 0F98 _ 0F B6. 00
        mov     byte [edx], al                          ; 0F9B _ 88. 02
        add     dword [ebp-10H], 1                      ; 0F9D _ 83. 45, F0, 01
        jmp     ?_046                                   ; 0FA1 _ EB, 02

?_045:  jmp     ?_047                                   ; 0FA3 _ EB, 06

?_046:  cmp     dword [ebp-10H], 7                      ; 0FA5 _ 83. 7D, F0, 07
        jle     ?_044                                   ; 0FA9 _ 7E, CE
?_047:  mov     dword [ebp-14H], 0                      ; 0FAB _ C7. 45, EC, 00000000
        mov     edx, dword [ebp-10H]                    ; 0FB2 _ 8B. 55, F0
        mov     eax, dword [ebp-1CH]                    ; 0FB5 _ 8B. 45, E4
        add     eax, edx                                ; 0FB8 _ 01. D0
        mov     byte [eax], 46                          ; 0FBA _ C6. 00, 2E
        add     dword [ebp-10H], 1                      ; 0FBD _ 83. 45, F0, 01
        mov     dword [ebp-14H], 0                      ; 0FC1 _ C7. 45, EC, 00000000
        jmp     ?_049                                   ; 0FC8 _ EB, 1E

?_048:  mov     edx, dword [ebp-10H]                    ; 0FCA _ 8B. 55, F0
        mov     eax, dword [ebp-1CH]                    ; 0FCD _ 8B. 45, E4
        add     edx, eax                                ; 0FD0 _ 01. C2
        mov     ecx, dword [ebp-0CH]                    ; 0FD2 _ 8B. 4D, F4
        mov     eax, dword [ebp-14H]                    ; 0FD5 _ 8B. 45, EC
        add     eax, ecx                                ; 0FD8 _ 01. C8
        movzx   eax, byte [eax+8H]                      ; 0FDA _ 0F B6. 40, 08
        mov     byte [edx], al                          ; 0FDE _ 88. 02
        add     dword [ebp-10H], 1                      ; 0FE0 _ 83. 45, F0, 01
        add     dword [ebp-14H], 1                      ; 0FE4 _ 83. 45, EC, 01
?_049:  cmp     dword [ebp-14H], 2                      ; 0FE8 _ 83. 7D, EC, 02
        jle     ?_048                                   ; 0FEC _ 7E, DC
        mov     eax, dword [ebp-18H]                    ; 0FEE _ 8B. 45, E8
        mov     ecx, dword [eax+9CH]                    ; 0FF1 _ 8B. 88, 0000009C
        mov     eax, dword [ebp-18H]                    ; 0FF7 _ 8B. 45, E8
        mov     edx, dword [eax+94H]                    ; 0FFA _ 8B. 90, 00000094
        mov     eax, dword [shtctl]                     ; 1000 _ A1, 00000264(d)
        mov     ebx, dword [ebp-1CH]                    ; 1005 _ 8B. 5D, E4
        mov     dword [esp+14H], ebx                    ; 1008 _ 89. 5C 24, 14
        mov     dword [esp+10H], 7                      ; 100C _ C7. 44 24, 10, 00000007
        mov     dword [esp+0CH], ecx                    ; 1014 _ 89. 4C 24, 0C
        mov     dword [esp+8H], 16                      ; 1018 _ C7. 44 24, 08, 00000010
        mov     dword [esp+4H], edx                     ; 1020 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1024 _ 89. 04 24
        call    showString                              ; 1027 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-20H], 136                    ; 102C _ C7. 45, E0, 00000088
        mov     eax, dword [ebp-0CH]                    ; 1033 _ 8B. 45, F4
        mov     eax, dword [eax+1CH]                    ; 1036 _ 8B. 40, 1C
        mov     dword [esp], eax                        ; 1039 _ 89. 04 24
        call    intToHexStr                             ; 103C _ E8, FFFFFFFC(rel)
        mov     dword [ebp-24H], eax                    ; 1041 _ 89. 45, DC
        mov     eax, dword [ebp-18H]                    ; 1044 _ 8B. 45, E8
        mov     ecx, dword [eax+9CH]                    ; 1047 _ 8B. 88, 0000009C
        mov     eax, dword [ebp-18H]                    ; 104D _ 8B. 45, E8
        mov     edx, dword [eax+94H]                    ; 1050 _ 8B. 90, 00000094
        mov     eax, dword [shtctl]                     ; 1056 _ A1, 00000264(d)
        mov     ebx, dword [ebp-24H]                    ; 105B _ 8B. 5D, DC
        mov     dword [esp+14H], ebx                    ; 105E _ 89. 5C 24, 14
        mov     dword [esp+10H], 7                      ; 1062 _ C7. 44 24, 10, 00000007
        mov     dword [esp+0CH], ecx                    ; 106A _ 89. 4C 24, 0C
        mov     ecx, dword [ebp-20H]                    ; 106E _ 8B. 4D, E0
        mov     dword [esp+8H], ecx                     ; 1071 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 1075 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1079 _ 89. 04 24
        call    showString                              ; 107C _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-18H]                    ; 1081 _ 8B. 45, E8
        mov     edx, dword [eax+94H]                    ; 1084 _ 8B. 90, 00000094
        mov     eax, dword [ebp-18H]                    ; 108A _ 8B. 45, E8
        mov     eax, dword [eax+9CH]                    ; 108D _ 8B. 80, 0000009C
        mov     dword [esp+4H], edx                     ; 1093 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1097 _ 89. 04 24
        call    cons_newline                            ; 109A _ E8, FFFFFFFC(rel)
        mov     edx, dword [ebp-18H]                    ; 109F _ 8B. 55, E8
        mov     dword [edx+9CH], eax                    ; 10A2 _ 89. 82, 0000009C
        add     dword [ebp-0CH], 32                     ; 10A8 _ 83. 45, F4, 20
?_050:  mov     eax, dword [ebp-0CH]                    ; 10AC _ 8B. 45, F4
        movzx   eax, byte [eax]                         ; 10AF _ 0F B6. 00
        test    al, al                                  ; 10B2 _ 84. C0
        jne     ?_043                                   ; 10B4 _ 0F 85, FFFFFEB6
        mov     edx, dword [ebp-1CH]                    ; 10BA _ 8B. 55, E4
        mov     eax, dword [memman]                     ; 10BD _ A1, 00000000(d)
        mov     dword [esp+8H], 13                      ; 10C2 _ C7. 44 24, 08, 0000000D
        mov     dword [esp+4H], edx                     ; 10CA _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 10CE _ 89. 04 24
        call    memman_free                             ; 10D1 _ E8, FFFFFFFC(rel)
        add     esp, 68                                 ; 10D6 _ 83. C4, 44
        pop     ebx                                     ; 10D9 _ 5B
        pop     ebp                                     ; 10DA _ 5D
        ret                                             ; 10DB _ C3
; cmd_dir End of function

cmd_type:; Function begin
        push    ebp                                     ; 10DC _ 55
        mov     ebp, esp                                ; 10DD _ 89. E5
        push    esi                                     ; 10DF _ 56
        push    ebx                                     ; 10E0 _ 53
        sub     esp, 96                                 ; 10E1 _ 83. EC, 60
        call    task_now                                ; 10E4 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-24H], eax                    ; 10E9 _ 89. 45, DC
        mov     eax, dword [ebp-24H]                    ; 10EC _ 8B. 45, DC
        mov     eax, dword [eax+94H]                    ; 10EF _ 8B. 80, 00000094
        test    eax, eax                                ; 10F5 _ 85. C0
        jnz     ?_051                                   ; 10F7 _ 75, 05
        jmp     ?_073                                   ; 10F9 _ E9, 00000385

?_051:  mov     eax, dword [memman]                     ; 10FE _ A1, 00000000(d)
        mov     dword [esp+4H], 13                      ; 1103 _ C7. 44 24, 04, 0000000D
        mov     dword [esp], eax                        ; 110B _ 89. 04 24
        call    memman_alloc                            ; 110E _ E8, FFFFFFFC(rel)
        mov     dword [ebp-28H], eax                    ; 1113 _ 89. 45, D8
        mov     eax, dword [ebp-28H]                    ; 1116 _ 8B. 45, D8
        add     eax, 12                                 ; 1119 _ 83. C0, 0C
        mov     byte [eax], 0                           ; 111C _ C6. 00, 00
        mov     dword [ebp-0CH], 0                      ; 111F _ C7. 45, F4, 00000000
        mov     dword [ebp-10H], 5                      ; 1126 _ C7. 45, F0, 00000005
        mov     dword [ebp-10H], 5                      ; 112D _ C7. 45, F0, 00000005
        jmp     ?_054                                   ; 1134 _ EB, 30

?_052:  mov     edx, dword [ebp-10H]                    ; 1136 _ 8B. 55, F0
        mov     eax, dword [ebp+8H]                     ; 1139 _ 8B. 45, 08
        add     eax, edx                                ; 113C _ 01. D0
        movzx   eax, byte [eax]                         ; 113E _ 0F B6. 00
        test    al, al                                  ; 1141 _ 84. C0
        jz      ?_053                                   ; 1143 _ 74, 1F
        mov     edx, dword [ebp-0CH]                    ; 1145 _ 8B. 55, F4
        mov     eax, dword [ebp-28H]                    ; 1148 _ 8B. 45, D8
        add     edx, eax                                ; 114B _ 01. C2
        mov     ecx, dword [ebp-10H]                    ; 114D _ 8B. 4D, F0
        mov     eax, dword [ebp+8H]                     ; 1150 _ 8B. 45, 08
        add     eax, ecx                                ; 1153 _ 01. C8
        movzx   eax, byte [eax]                         ; 1155 _ 0F B6. 00
        mov     byte [edx], al                          ; 1158 _ 88. 02
        add     dword [ebp-0CH], 1                      ; 115A _ 83. 45, F4, 01
        add     dword [ebp-10H], 1                      ; 115E _ 83. 45, F0, 01
        jmp     ?_054                                   ; 1162 _ EB, 02

?_053:  jmp     ?_055                                   ; 1164 _ EB, 06

?_054:  cmp     dword [ebp-10H], 16                     ; 1166 _ 83. 7D, F0, 10
        jle     ?_052                                   ; 116A _ 7E, CA
?_055:  mov     edx, dword [ebp-0CH]                    ; 116C _ 8B. 55, F4
        mov     eax, dword [ebp-28H]                    ; 116F _ 8B. 45, D8
        add     eax, edx                                ; 1172 _ 01. D0
        mov     byte [eax], 0                           ; 1174 _ C6. 00, 00
        mov     dword [ebp-14H], 78848                  ; 1177 _ C7. 45, EC, 00013400
        jmp     ?_071                                   ; 117E _ E9, 000002A2

?_056:  mov     byte [ebp-31H], 0                       ; 1183 _ C6. 45, CF, 00
        mov     dword [ebp-18H], 0                      ; 1187 _ C7. 45, E8, 00000000
        jmp     ?_059                                   ; 118E _ EB, 2C

?_057:  mov     edx, dword [ebp-14H]                    ; 1190 _ 8B. 55, EC
        mov     eax, dword [ebp-18H]                    ; 1193 _ 8B. 45, E8
        add     eax, edx                                ; 1196 _ 01. D0
        movzx   eax, byte [eax]                         ; 1198 _ 0F B6. 00
        test    al, al                                  ; 119B _ 84. C0
        jz      ?_058                                   ; 119D _ 74, 1B
        mov     edx, dword [ebp-14H]                    ; 119F _ 8B. 55, EC
        mov     eax, dword [ebp-18H]                    ; 11A2 _ 8B. 45, E8
        add     eax, edx                                ; 11A5 _ 01. D0
        movzx   eax, byte [eax]                         ; 11A7 _ 0F B6. 00
        lea     ecx, [ebp-3DH]                          ; 11AA _ 8D. 4D, C3
        mov     edx, dword [ebp-18H]                    ; 11AD _ 8B. 55, E8
        add     edx, ecx                                ; 11B0 _ 01. CA
        mov     byte [edx], al                          ; 11B2 _ 88. 02
        add     dword [ebp-18H], 1                      ; 11B4 _ 83. 45, E8, 01
        jmp     ?_059                                   ; 11B8 _ EB, 02

?_058:  jmp     ?_060                                   ; 11BA _ EB, 06

?_059:  cmp     dword [ebp-18H], 7                      ; 11BC _ 83. 7D, E8, 07
        jle     ?_057                                   ; 11C0 _ 7E, CE
?_060:  mov     dword [ebp-1CH], 0                      ; 11C2 _ C7. 45, E4, 00000000
        lea     edx, [ebp-3DH]                          ; 11C9 _ 8D. 55, C3
        mov     eax, dword [ebp-18H]                    ; 11CC _ 8B. 45, E8
        add     eax, edx                                ; 11CF _ 01. D0
        mov     byte [eax], 46                          ; 11D1 _ C6. 00, 2E
        add     dword [ebp-18H], 1                      ; 11D4 _ 83. 45, E8, 01
        mov     dword [ebp-1CH], 0                      ; 11D8 _ C7. 45, E4, 00000000
        jmp     ?_062                                   ; 11DF _ EB, 1E

?_061:  mov     edx, dword [ebp-14H]                    ; 11E1 _ 8B. 55, EC
        mov     eax, dword [ebp-1CH]                    ; 11E4 _ 8B. 45, E4
        add     eax, edx                                ; 11E7 _ 01. D0
        movzx   eax, byte [eax+8H]                      ; 11E9 _ 0F B6. 40, 08
        lea     ecx, [ebp-3DH]                          ; 11ED _ 8D. 4D, C3
        mov     edx, dword [ebp-18H]                    ; 11F0 _ 8B. 55, E8
        add     edx, ecx                                ; 11F3 _ 01. CA
        mov     byte [edx], al                          ; 11F5 _ 88. 02
        add     dword [ebp-18H], 1                      ; 11F7 _ 83. 45, E8, 01
        add     dword [ebp-1CH], 1                      ; 11FB _ 83. 45, E4, 01
?_062:  cmp     dword [ebp-1CH], 2                      ; 11FF _ 83. 7D, E4, 02
        jle     ?_061                                   ; 1203 _ 7E, DC
        lea     eax, [ebp-3DH]                          ; 1205 _ 8D. 45, C3
        mov     dword [esp+4H], eax                     ; 1208 _ 89. 44 24, 04
        mov     eax, dword [ebp-28H]                    ; 120C _ 8B. 45, D8
        mov     dword [esp], eax                        ; 120F _ 89. 04 24
        call    strcmp                                  ; 1212 _ E8, FFFFFFFC(rel)
        cmp     eax, 1                                  ; 1217 _ 83. F8, 01
        jne     ?_070                                   ; 121A _ 0F 85, 00000201
        mov     dword [ebp-2CH], 88064                  ; 1220 _ C7. 45, D4, 00015800
        mov     eax, dword [ebp-14H]                    ; 1227 _ 8B. 45, EC
        movzx   eax, word [eax+1AH]                     ; 122A _ 0F B7. 40, 1A
        movzx   eax, ax                                 ; 122E _ 0F B7. C0
        shl     eax, 9                                  ; 1231 _ C1. E0, 09
        add     dword [ebp-2CH], eax                    ; 1234 _ 01. 45, D4
        mov     eax, dword [ebp-14H]                    ; 1237 _ 8B. 45, EC
        mov     eax, dword [eax+1CH]                    ; 123A _ 8B. 40, 1C
        mov     dword [ebp-30H], eax                    ; 123D _ 89. 45, D0
        mov     dword [ebp-20H], 0                      ; 1240 _ C7. 45, E0, 00000000
        mov     eax, dword [ebp-24H]                    ; 1247 _ 8B. 45, DC
        mov     dword [eax+98H], 16                     ; 124A _ C7. 80, 00000098, 00000010
        mov     dword [ebp-20H], 0                      ; 1254 _ C7. 45, E0, 00000000
        jmp     ?_069                                   ; 125B _ E9, 000001B2

?_063:  mov     edx, dword [ebp-20H]                    ; 1260 _ 8B. 55, E0
        mov     eax, dword [ebp-2CH]                    ; 1263 _ 8B. 45, D4
        add     eax, edx                                ; 1266 _ 01. D0
        movzx   eax, byte [eax]                         ; 1268 _ 0F B6. 00
        mov     byte [ebp-3FH], al                      ; 126B _ 88. 45, C1
        mov     byte [ebp-3EH], 0                       ; 126E _ C6. 45, C2, 00
        movzx   eax, byte [ebp-3FH]                     ; 1272 _ 0F B6. 45, C1
        cmp     al, 9                                   ; 1276 _ 3C, 09
        jne     ?_066                                   ; 1278 _ 0F 85, 000000A7
?_064:  mov     eax, dword [ebp-24H]                    ; 127E _ 8B. 45, DC
        mov     ebx, dword [eax+9CH]                    ; 1281 _ 8B. 98, 0000009C
        mov     eax, dword [ebp-24H]                    ; 1287 _ 8B. 45, DC
        mov     ecx, dword [eax+98H]                    ; 128A _ 8B. 88, 00000098
        mov     eax, dword [ebp-24H]                    ; 1290 _ 8B. 45, DC
        mov     edx, dword [eax+94H]                    ; 1293 _ 8B. 90, 00000094
        mov     eax, dword [shtctl]                     ; 1299 _ A1, 00000264(d)
        mov     dword [esp+14H], ?_392                  ; 129E _ C7. 44 24, 14, 00000017(d)
        mov     dword [esp+10H], 7                      ; 12A6 _ C7. 44 24, 10, 00000007
        mov     dword [esp+0CH], ebx                    ; 12AE _ 89. 5C 24, 0C
        mov     dword [esp+8H], ecx                     ; 12B2 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 12B6 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 12BA _ 89. 04 24
        call    showString                              ; 12BD _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-24H]                    ; 12C2 _ 8B. 45, DC
        mov     eax, dword [eax+98H]                    ; 12C5 _ 8B. 80, 00000098
        lea     edx, [eax+8H]                           ; 12CB _ 8D. 50, 08
        mov     eax, dword [ebp-24H]                    ; 12CE _ 8B. 45, DC
        mov     dword [eax+98H], edx                    ; 12D1 _ 89. 90, 00000098
        mov     eax, dword [ebp-24H]                    ; 12D7 _ 8B. 45, DC
        mov     eax, dword [eax+98H]                    ; 12DA _ 8B. 80, 00000098
        cmp     eax, 248                                ; 12E0 _ 3D, 000000F8
        jnz     ?_065                                   ; 12E5 _ 75, 39
        mov     eax, dword [ebp-24H]                    ; 12E7 _ 8B. 45, DC
        mov     dword [eax+98H], 8                      ; 12EA _ C7. 80, 00000098, 00000008
        mov     eax, dword [ebp-24H]                    ; 12F4 _ 8B. 45, DC
        mov     edx, dword [eax+94H]                    ; 12F7 _ 8B. 90, 00000094
        mov     eax, dword [ebp-24H]                    ; 12FD _ 8B. 45, DC
        mov     eax, dword [eax+9CH]                    ; 1300 _ 8B. 80, 0000009C
        mov     dword [esp+4H], edx                     ; 1306 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 130A _ 89. 04 24
        call    cons_newline                            ; 130D _ E8, FFFFFFFC(rel)
        mov     edx, dword [ebp-24H]                    ; 1312 _ 8B. 55, DC
        mov     dword [edx+9CH], eax                    ; 1315 _ 89. 82, 0000009C
        jmp     ?_064                                   ; 131B _ E9, FFFFFF5E

?_065:  jmp     ?_064                                   ; 1320 _ E9, FFFFFF59

?_066:  movzx   eax, byte [ebp-3FH]                     ; 1325 _ 0F B6. 45, C1
        cmp     al, 10                                  ; 1329 _ 3C, 0A
        jnz     ?_067                                   ; 132B _ 75, 39
        mov     eax, dword [ebp-24H]                    ; 132D _ 8B. 45, DC
        mov     dword [eax+98H], 8                      ; 1330 _ C7. 80, 00000098, 00000008
        mov     eax, dword [ebp-24H]                    ; 133A _ 8B. 45, DC
        mov     edx, dword [eax+94H]                    ; 133D _ 8B. 90, 00000094
        mov     eax, dword [ebp-24H]                    ; 1343 _ 8B. 45, DC
        mov     eax, dword [eax+9CH]                    ; 1346 _ 8B. 80, 0000009C
        mov     dword [esp+4H], edx                     ; 134C _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1350 _ 89. 04 24
        call    cons_newline                            ; 1353 _ E8, FFFFFFFC(rel)
        mov     edx, dword [ebp-24H]                    ; 1358 _ 8B. 55, DC
        mov     dword [edx+9CH], eax                    ; 135B _ 89. 82, 0000009C
        jmp     ?_068                                   ; 1361 _ E9, 000000A8

?_067:  movzx   eax, byte [ebp-3FH]                     ; 1366 _ 0F B6. 45, C1
        cmp     al, 13                                  ; 136A _ 3C, 0D
        je      ?_068                                   ; 136C _ 0F 84, 0000009C
        mov     eax, dword [ebp-24H]                    ; 1372 _ 8B. 45, DC
        mov     ebx, dword [eax+9CH]                    ; 1375 _ 8B. 98, 0000009C
        mov     eax, dword [ebp-24H]                    ; 137B _ 8B. 45, DC
        mov     ecx, dword [eax+98H]                    ; 137E _ 8B. 88, 00000098
        mov     eax, dword [ebp-24H]                    ; 1384 _ 8B. 45, DC
        mov     edx, dword [eax+94H]                    ; 1387 _ 8B. 90, 00000094
        mov     eax, dword [shtctl]                     ; 138D _ A1, 00000264(d)
        lea     esi, [ebp-3FH]                          ; 1392 _ 8D. 75, C1
        mov     dword [esp+14H], esi                    ; 1395 _ 89. 74 24, 14
        mov     dword [esp+10H], 7                      ; 1399 _ C7. 44 24, 10, 00000007
        mov     dword [esp+0CH], ebx                    ; 13A1 _ 89. 5C 24, 0C
        mov     dword [esp+8H], ecx                     ; 13A5 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 13A9 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 13AD _ 89. 04 24
        call    showString                              ; 13B0 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-24H]                    ; 13B5 _ 8B. 45, DC
        mov     eax, dword [eax+98H]                    ; 13B8 _ 8B. 80, 00000098
        lea     edx, [eax+8H]                           ; 13BE _ 8D. 50, 08
        mov     eax, dword [ebp-24H]                    ; 13C1 _ 8B. 45, DC
        mov     dword [eax+98H], edx                    ; 13C4 _ 89. 90, 00000098
        mov     eax, dword [ebp-24H]                    ; 13CA _ 8B. 45, DC
        mov     eax, dword [eax+98H]                    ; 13CD _ 8B. 80, 00000098
        cmp     eax, 248                                ; 13D3 _ 3D, 000000F8
        jnz     ?_068                                   ; 13D8 _ 75, 34
        mov     eax, dword [ebp-24H]                    ; 13DA _ 8B. 45, DC
        mov     dword [eax+98H], 16                     ; 13DD _ C7. 80, 00000098, 00000010
        mov     eax, dword [ebp-24H]                    ; 13E7 _ 8B. 45, DC
        mov     edx, dword [eax+94H]                    ; 13EA _ 8B. 90, 00000094
        mov     eax, dword [ebp-24H]                    ; 13F0 _ 8B. 45, DC
        mov     eax, dword [eax+9CH]                    ; 13F3 _ 8B. 80, 0000009C
        mov     dword [esp+4H], edx                     ; 13F9 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 13FD _ 89. 04 24
        call    cons_newline                            ; 1400 _ E8, FFFFFFFC(rel)
        mov     edx, dword [ebp-24H]                    ; 1405 _ 8B. 55, DC
        mov     dword [edx+9CH], eax                    ; 1408 _ 89. 82, 0000009C
?_068:  add     dword [ebp-20H], 1                      ; 140E _ 83. 45, E0, 01
?_069:  mov     eax, dword [ebp-20H]                    ; 1412 _ 8B. 45, E0
        cmp     eax, dword [ebp-30H]                    ; 1415 _ 3B. 45, D0
        jl      ?_063                                   ; 1418 _ 0F 8C, FFFFFE42
        nop                                             ; 141E _ 90
        jmp     ?_072                                   ; 141F _ EB, 12

?_070:  add     dword [ebp-14H], 32                     ; 1421 _ 83. 45, EC, 20
?_071:  mov     eax, dword [ebp-14H]                    ; 1425 _ 8B. 45, EC
        movzx   eax, byte [eax]                         ; 1428 _ 0F B6. 00
        test    al, al                                  ; 142B _ 84. C0
        jne     ?_056                                   ; 142D _ 0F 85, FFFFFD50
?_072:  mov     eax, dword [ebp-24H]                    ; 1433 _ 8B. 45, DC
        mov     edx, dword [eax+94H]                    ; 1436 _ 8B. 90, 00000094
        mov     eax, dword [ebp-24H]                    ; 143C _ 8B. 45, DC
        mov     eax, dword [eax+9CH]                    ; 143F _ 8B. 80, 0000009C
        mov     dword [esp+4H], edx                     ; 1445 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1449 _ 89. 04 24
        call    cons_newline                            ; 144C _ E8, FFFFFFFC(rel)
        mov     edx, dword [ebp-24H]                    ; 1451 _ 8B. 55, DC
        mov     dword [edx+9CH], eax                    ; 1454 _ 89. 82, 0000009C
        mov     edx, dword [ebp-28H]                    ; 145A _ 8B. 55, D8
        mov     eax, dword [memman]                     ; 145D _ A1, 00000000(d)
        mov     dword [esp+8H], 13                      ; 1462 _ C7. 44 24, 08, 0000000D
        mov     dword [esp+4H], edx                     ; 146A _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 146E _ 89. 04 24
        call    memman_free                             ; 1471 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-24H]                    ; 1476 _ 8B. 45, DC
        mov     dword [eax+98H], 16                     ; 1479 _ C7. 80, 00000098, 00000010
?_073:  add     esp, 96                                 ; 1483 _ 83. C4, 60
        pop     ebx                                     ; 1486 _ 5B
        pop     esi                                     ; 1487 _ 5E
        pop     ebp                                     ; 1488 _ 5D
        ret                                             ; 1489 _ C3
; cmd_type End of function

cmd_mem:; Function begin
        push    ebp                                     ; 148A _ 55
        mov     ebp, esp                                ; 148B _ 89. E5
        push    ebx                                     ; 148D _ 53
        sub     esp, 52                                 ; 148E _ 83. EC, 34
        call    task_now                                ; 1491 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 1496 _ 89. 45, F4
        mov     eax, dword [ebp-0CH]                    ; 1499 _ 8B. 45, F4
        mov     eax, dword [eax+94H]                    ; 149C _ 8B. 80, 00000094
        test    eax, eax                                ; 14A2 _ 85. C0
        jnz     ?_074                                   ; 14A4 _ 75, 05
        jmp     ?_075                                   ; 14A6 _ E9, 000000FF

?_074:  mov     eax, dword [ebp+8H]                     ; 14AB _ 8B. 45, 08
        lea     edx, [eax+3FFH]                         ; 14AE _ 8D. 90, 000003FF
        test    eax, eax                                ; 14B4 _ 85. C0
        cmovs   eax, edx                                ; 14B6 _ 0F 48. C2
        sar     eax, 10                                 ; 14B9 _ C1. F8, 0A
        mov     dword [esp], eax                        ; 14BC _ 89. 04 24
        call    intToHexStr                             ; 14BF _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 14C4 _ 89. 45, F0
        mov     eax, dword [ebp-0CH]                    ; 14C7 _ 8B. 45, F4
        mov     ecx, dword [eax+9CH]                    ; 14CA _ 8B. 88, 0000009C
        mov     eax, dword [ebp-0CH]                    ; 14D0 _ 8B. 45, F4
        mov     edx, dword [eax+94H]                    ; 14D3 _ 8B. 90, 00000094
        mov     eax, dword [shtctl]                     ; 14D9 _ A1, 00000264(d)
        mov     dword [esp+14H], ?_393                  ; 14DE _ C7. 44 24, 14, 00000019(d)
        mov     dword [esp+10H], 7                      ; 14E6 _ C7. 44 24, 10, 00000007
        mov     dword [esp+0CH], ecx                    ; 14EE _ 89. 4C 24, 0C
        mov     dword [esp+8H], 16                      ; 14F2 _ C7. 44 24, 08, 00000010
        mov     dword [esp+4H], edx                     ; 14FA _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 14FE _ 89. 04 24
        call    showString                              ; 1501 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 1506 _ 8B. 45, F4
        mov     ecx, dword [eax+9CH]                    ; 1509 _ 8B. 88, 0000009C
        mov     eax, dword [ebp-0CH]                    ; 150F _ 8B. 45, F4
        mov     edx, dword [eax+94H]                    ; 1512 _ 8B. 90, 00000094
        mov     eax, dword [shtctl]                     ; 1518 _ A1, 00000264(d)
        mov     ebx, dword [ebp-10H]                    ; 151D _ 8B. 5D, F0
        mov     dword [esp+14H], ebx                    ; 1520 _ 89. 5C 24, 14
        mov     dword [esp+10H], 7                      ; 1524 _ C7. 44 24, 10, 00000007
        mov     dword [esp+0CH], ecx                    ; 152C _ 89. 4C 24, 0C
        mov     dword [esp+8H], 52                      ; 1530 _ C7. 44 24, 08, 00000034
        mov     dword [esp+4H], edx                     ; 1538 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 153C _ 89. 04 24
        call    showString                              ; 153F _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 1544 _ 8B. 45, F4
        mov     ecx, dword [eax+9CH]                    ; 1547 _ 8B. 88, 0000009C
        mov     eax, dword [ebp-0CH]                    ; 154D _ 8B. 45, F4
        mov     edx, dword [eax+94H]                    ; 1550 _ 8B. 90, 00000094
        mov     eax, dword [shtctl]                     ; 1556 _ A1, 00000264(d)
        mov     dword [esp+14H], ?_394                  ; 155B _ C7. 44 24, 14, 0000001F(d)
        mov     dword [esp+10H], 7                      ; 1563 _ C7. 44 24, 10, 00000007
        mov     dword [esp+0CH], ecx                    ; 156B _ 89. 4C 24, 0C
        mov     dword [esp+8H], 126                     ; 156F _ C7. 44 24, 08, 0000007E
        mov     dword [esp+4H], edx                     ; 1577 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 157B _ 89. 04 24
        call    showString                              ; 157E _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 1583 _ 8B. 45, F4
        mov     edx, dword [eax+94H]                    ; 1586 _ 8B. 90, 00000094
        mov     eax, dword [ebp-0CH]                    ; 158C _ 8B. 45, F4
        mov     eax, dword [eax+9CH]                    ; 158F _ 8B. 80, 0000009C
        mov     dword [esp+4H], edx                     ; 1595 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1599 _ 89. 04 24
        call    cons_newline                            ; 159C _ E8, FFFFFFFC(rel)
        mov     edx, dword [ebp-0CH]                    ; 15A1 _ 8B. 55, F4
        mov     dword [edx+9CH], eax                    ; 15A4 _ 89. 82, 0000009C
?_075:  add     esp, 52                                 ; 15AA _ 83. C4, 34
        pop     ebx                                     ; 15AD _ 5B
        pop     ebp                                     ; 15AE _ 5D
        ret                                             ; 15AF _ C3
; cmd_mem End of function

cmd_cls:; Function begin
        push    ebp                                     ; 15B0 _ 55
        mov     ebp, esp                                ; 15B1 _ 89. E5
        sub     esp, 56                                 ; 15B3 _ 83. EC, 38
        call    task_now                                ; 15B6 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-14H], eax                    ; 15BB _ 89. 45, EC
        mov     eax, dword [ebp-14H]                    ; 15BE _ 8B. 45, EC
        mov     eax, dword [eax+94H]                    ; 15C1 _ 8B. 80, 00000094
        test    eax, eax                                ; 15C7 _ 85. C0
        jnz     ?_076                                   ; 15C9 _ 75, 05
        jmp     ?_081                                   ; 15CB _ E9, 000000E2

?_076:  mov     dword [ebp-0CH], 8                      ; 15D0 _ C7. 45, F4, 00000008
        mov     dword [ebp-10H], 28                     ; 15D7 _ C7. 45, F0, 0000001C
        mov     dword [ebp-10H], 28                     ; 15DE _ C7. 45, F0, 0000001C
        jmp     ?_080                                   ; 15E5 _ EB, 41

?_077:  mov     dword [ebp-0CH], 8                      ; 15E7 _ C7. 45, F4, 00000008
        jmp     ?_079                                   ; 15EE _ EB, 2B

?_078:  mov     eax, dword [ebp-14H]                    ; 15F0 _ 8B. 45, EC
        mov     eax, dword [eax+94H]                    ; 15F3 _ 8B. 80, 00000094
        mov     edx, dword [eax]                        ; 15F9 _ 8B. 10
        mov     eax, dword [ebp-14H]                    ; 15FB _ 8B. 45, EC
        mov     eax, dword [eax+94H]                    ; 15FE _ 8B. 80, 00000094
        mov     eax, dword [eax+4H]                     ; 1604 _ 8B. 40, 04
        imul    eax, dword [ebp-10H]                    ; 1607 _ 0F AF. 45, F0
        mov     ecx, eax                                ; 160B _ 89. C1
        mov     eax, dword [ebp-0CH]                    ; 160D _ 8B. 45, F4
        add     eax, ecx                                ; 1610 _ 01. C8
        add     eax, edx                                ; 1612 _ 01. D0
        mov     byte [eax], 0                           ; 1614 _ C6. 00, 00
        add     dword [ebp-0CH], 1                      ; 1617 _ 83. 45, F4, 01
?_079:  cmp     dword [ebp-0CH], 247                    ; 161B _ 81. 7D, F4, 000000F7
        jle     ?_078                                   ; 1622 _ 7E, CC
        add     dword [ebp-10H], 1                      ; 1624 _ 83. 45, F0, 01
?_080:  cmp     dword [ebp-10H], 155                    ; 1628 _ 81. 7D, F0, 0000009B
        jle     ?_077                                   ; 162F _ 7E, B6
        mov     eax, dword [ebp-14H]                    ; 1631 _ 8B. 45, EC
        mov     edx, dword [eax+94H]                    ; 1634 _ 8B. 90, 00000094
        mov     eax, dword [shtctl]                     ; 163A _ A1, 00000264(d)
        mov     dword [esp+14H], 156                    ; 163F _ C7. 44 24, 14, 0000009C
        mov     dword [esp+10H], 248                    ; 1647 _ C7. 44 24, 10, 000000F8
        mov     dword [esp+0CH], 28                     ; 164F _ C7. 44 24, 0C, 0000001C
        mov     dword [esp+8H], 8                       ; 1657 _ C7. 44 24, 08, 00000008
        mov     dword [esp+4H], edx                     ; 165F _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1663 _ 89. 04 24
        call    sheet_refresh                           ; 1666 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-14H]                    ; 166B _ 8B. 45, EC
        mov     dword [eax+9CH], 28                     ; 166E _ C7. 80, 0000009C, 0000001C
        mov     eax, dword [ebp-14H]                    ; 1678 _ 8B. 45, EC
        mov     edx, dword [eax+94H]                    ; 167B _ 8B. 90, 00000094
        mov     eax, dword [shtctl]                     ; 1681 _ A1, 00000264(d)
        mov     dword [esp+14H], ?_395                  ; 1686 _ C7. 44 24, 14, 00000023(d)
        mov     dword [esp+10H], 7                      ; 168E _ C7. 44 24, 10, 00000007
        mov     dword [esp+0CH], 28                     ; 1696 _ C7. 44 24, 0C, 0000001C
        mov     dword [esp+8H], 8                       ; 169E _ C7. 44 24, 08, 00000008
        mov     dword [esp+4H], edx                     ; 16A6 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 16AA _ 89. 04 24
        call    showString                              ; 16AD _ E8, FFFFFFFC(rel)
?_081:  leave                                           ; 16B2 _ C9
        ret                                             ; 16B3 _ C3
; cmd_cls End of function

cmd_hlt:; Function begin
        push    ebp                                     ; 16B4 _ 55
        mov     ebp, esp                                ; 16B5 _ 89. E5
        sub     esp, 72                                 ; 16B7 _ 83. EC, 48
        call    io_cli                                  ; 16BA _ E8, FFFFFFFC(rel)
        mov     eax, dword [memman]                     ; 16BF _ A1, 00000000(d)
        mov     dword [esp+4H], 16                      ; 16C4 _ C7. 44 24, 04, 00000010
        mov     dword [esp], eax                        ; 16CC _ 89. 04 24
        call    memman_alloc                            ; 16CF _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 16D4 _ 89. 45, F4
        call    task_now                                ; 16D7 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 16DC _ 89. 45, F0
        mov     eax, dword [ebp-10H]                    ; 16DF _ 8B. 45, F0
        mov     edx, dword [ebp-0CH]                    ; 16E2 _ 8B. 55, F4
        mov     dword [eax+0B0H], edx                   ; 16E5 _ 89. 90, 000000B0
        mov     eax, dword [ebp-0CH]                    ; 16EB _ 8B. 45, F4
        mov     dword [esp+4H], eax                     ; 16EE _ 89. 44 24, 04
        mov     dword [esp], ?_396                      ; 16F2 _ C7. 04 24, 00000025(d)
        call    file_loadfile                           ; 16F9 _ E8, FFFFFFFC(rel)
        call    get_addr_gdt                            ; 16FE _ E8, FFFFFFFC(rel)
        mov     dword [ebp-14H], eax                    ; 1703 _ 89. 45, EC
        mov     eax, dword [ebp-10H]                    ; 1706 _ 8B. 45, F0
        mov     edx, dword [eax]                        ; 1709 _ 8B. 10
        mov     eax, dword [first_task_cons_selector]   ; 170B _ A1, 00000000(d)
        sub     edx, eax                                ; 1710 _ 29. C2
        mov     eax, edx                                ; 1712 _ 89. D0
        lea     edx, [eax+7H]                           ; 1714 _ 8D. 50, 07
        test    eax, eax                                ; 1717 _ 85. C0
        cmovs   eax, edx                                ; 1719 _ 0F 48. C2
        sar     eax, 3                                  ; 171C _ C1. F8, 03
        add     eax, 21                                 ; 171F _ 83. C0, 15
        mov     dword [ebp-18H], eax                    ; 1722 _ 89. 45, E8
        mov     eax, dword [ebp-10H]                    ; 1725 _ 8B. 45, F0
        mov     edx, dword [eax]                        ; 1728 _ 8B. 10
        mov     eax, dword [first_task_cons_selector]   ; 172A _ A1, 00000000(d)
        sub     edx, eax                                ; 172F _ 29. C2
        mov     eax, edx                                ; 1731 _ 89. D0
        lea     edx, [eax+7H]                           ; 1733 _ 8D. 50, 07
        test    eax, eax                                ; 1736 _ 85. C0
        cmovs   eax, edx                                ; 1738 _ 0F 48. C2
        sar     eax, 3                                  ; 173B _ C1. F8, 03
        add     eax, 30                                 ; 173E _ 83. C0, 1E
        mov     dword [ebp-1CH], eax                    ; 1741 _ 89. 45, E4
        mov     eax, dword [ebp-0CH]                    ; 1744 _ 8B. 45, F4
        mov     eax, dword [eax]                        ; 1747 _ 8B. 00
        mov     edx, dword [ebp-18H]                    ; 1749 _ 8B. 55, E8
        lea     ecx, [edx*8]                            ; 174C _ 8D. 0C D5, 00000000
        mov     edx, dword [ebp-14H]                    ; 1753 _ 8B. 55, EC
        add     edx, ecx                                ; 1756 _ 01. CA
        mov     dword [esp+0CH], 16634                  ; 1758 _ C7. 44 24, 0C, 000040FA
        mov     dword [esp+8H], eax                     ; 1760 _ 89. 44 24, 08
        mov     dword [esp+4H], 1048575                 ; 1764 _ C7. 44 24, 04, 000FFFFF
        mov     dword [esp], edx                        ; 176C _ 89. 14 24
        call    set_segmdesc                            ; 176F _ E8, FFFFFFFC(rel)
        mov     eax, dword [memman]                     ; 1774 _ A1, 00000000(d)
        mov     dword [esp+4H], 65536                   ; 1779 _ C7. 44 24, 04, 00010000
        mov     dword [esp], eax                        ; 1781 _ 89. 04 24
        call    memman_alloc_4k                         ; 1784 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-20H], eax                    ; 1789 _ 89. 45, E0
        mov     eax, dword [ebp-0CH]                    ; 178C _ 8B. 45, F4
        mov     edx, dword [ebp-20H]                    ; 178F _ 8B. 55, E0
        mov     dword [eax+4H], edx                     ; 1792 _ 89. 50, 04
        mov     eax, dword [ebp-20H]                    ; 1795 _ 8B. 45, E0
        mov     edx, dword [ebp-1CH]                    ; 1798 _ 8B. 55, E4
        lea     ecx, [edx*8]                            ; 179B _ 8D. 0C D5, 00000000
        mov     edx, dword [ebp-14H]                    ; 17A2 _ 8B. 55, EC
        add     edx, ecx                                ; 17A5 _ 01. CA
        mov     dword [esp+0CH], 16626                  ; 17A7 _ C7. 44 24, 0C, 000040F2
        mov     dword [esp+8H], eax                     ; 17AF _ 89. 44 24, 08
        mov     dword [esp+4H], 65535                   ; 17B3 _ C7. 44 24, 04, 0000FFFF
        mov     dword [esp], edx                        ; 17BB _ 89. 14 24
        call    set_segmdesc                            ; 17BE _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 17C3 _ 8B. 45, F0
        mov     dword [eax+30H], 0                      ; 17C6 _ C7. 40, 30, 00000000
        call    io_sti                                  ; 17CD _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 17D2 _ 8B. 45, F0
        lea     ecx, [eax+30H]                          ; 17D5 _ 8D. 48, 30
        mov     eax, dword [ebp-1CH]                    ; 17D8 _ 8B. 45, E4
        lea     edx, [eax*8]                            ; 17DB _ 8D. 14 C5, 00000000
        mov     eax, dword [ebp-18H]                    ; 17E2 _ 8B. 45, E8
        shl     eax, 3                                  ; 17E5 _ C1. E0, 03
        mov     dword [esp+10H], ecx                    ; 17E8 _ 89. 4C 24, 10
        mov     dword [esp+0CH], edx                    ; 17EC _ 89. 54 24, 0C
        mov     dword [esp+8H], 65536                   ; 17F0 _ C7. 44 24, 08, 00010000
        mov     dword [esp+4H], eax                     ; 17F8 _ 89. 44 24, 04
        mov     dword [esp], 0                          ; 17FC _ C7. 04 24, 00000000
        call    start_app                               ; 1803 _ E8, FFFFFFFC(rel)
        call    io_cli                                  ; 1808 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 180D _ 8B. 45, F4
        mov     eax, dword [eax+8H]                     ; 1810 _ 8B. 40, 08
        mov     ecx, eax                                ; 1813 _ 89. C1
        mov     eax, dword [ebp-0CH]                    ; 1815 _ 8B. 45, F4
        mov     eax, dword [eax]                        ; 1818 _ 8B. 00
        mov     edx, eax                                ; 181A _ 89. C2
        mov     eax, dword [memman]                     ; 181C _ A1, 00000000(d)
        mov     dword [esp+8H], ecx                     ; 1821 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 1825 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1829 _ 89. 04 24
        call    memman_free_4k                          ; 182C _ E8, FFFFFFFC(rel)
        mov     edx, dword [ebp-20H]                    ; 1831 _ 8B. 55, E0
        mov     eax, dword [memman]                     ; 1834 _ A1, 00000000(d)
        mov     dword [esp+8H], 65536                   ; 1839 _ C7. 44 24, 08, 00010000
        mov     dword [esp+4H], edx                     ; 1841 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1845 _ 89. 04 24
        call    memman_free_4k                          ; 1848 _ E8, FFFFFFFC(rel)
        mov     edx, dword [ebp-0CH]                    ; 184D _ 8B. 55, F4
        mov     eax, dword [memman]                     ; 1850 _ A1, 00000000(d)
        mov     dword [esp+8H], 16                      ; 1855 _ C7. 44 24, 08, 00000010
        mov     dword [esp+4H], edx                     ; 185D _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1861 _ 89. 04 24
        call    memman_free                             ; 1864 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 1869 _ 8B. 45, F0
        mov     dword [eax+0B0H], 0                     ; 186C _ C7. 80, 000000B0, 00000000
        call    io_sti                                  ; 1876 _ E8, FFFFFFFC(rel)
        leave                                           ; 187B _ C9
        ret                                             ; 187C _ C3
; cmd_hlt End of function

cmd_start:; Function begin
        push    ebp                                     ; 187D _ 55
        mov     ebp, esp                                ; 187E _ 89. E5
        sub     esp, 40                                 ; 1880 _ 83. EC, 28
        mov     eax, dword [console_count]              ; 1883 _ A1, 00000000(d)
        mov     dword [esp], eax                        ; 1888 _ 89. 04 24
        call    launch_console                          ; 188B _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 1890 _ 89. 45, F0
        mov     eax, dword [shtctl]                     ; 1893 _ A1, 00000264(d)
        mov     dword [esp+0CH], 176                    ; 1898 _ C7. 44 24, 0C, 000000B0
        mov     dword [esp+8H], 156                     ; 18A0 _ C7. 44 24, 08, 0000009C
        mov     edx, dword [ebp-10H]                    ; 18A8 _ 8B. 55, F0
        mov     dword [esp+4H], edx                     ; 18AB _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 18AF _ 89. 04 24
        call    sheet_slide                             ; 18B2 _ E8, FFFFFFFC(rel)
        mov     eax, dword [shtctl]                     ; 18B7 _ A1, 00000264(d)
        mov     dword [esp+8H], 1                       ; 18BC _ C7. 44 24, 08, 00000001
        mov     edx, dword [ebp-10H]                    ; 18C4 _ 8B. 55, F0
        mov     dword [esp+4H], edx                     ; 18C7 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 18CB _ 89. 04 24
        call    sheet_updown                            ; 18CE _ E8, FFFFFFFC(rel)
        mov     eax, dword [console_count]              ; 18D3 _ A1, 00000000(d)
        add     eax, 1                                  ; 18D8 _ 83. C0, 01
        mov     dword [console_count], eax              ; 18DB _ A3, 00000000(d)
        mov     eax, dword [ebp-10H]                    ; 18E0 _ 8B. 45, F0
        mov     eax, dword [eax+20H]                    ; 18E3 _ 8B. 40, 20
        mov     dword [ebp-14H], eax                    ; 18E6 _ 89. 45, EC
        mov     eax, dword [ebp-14H]                    ; 18E9 _ 8B. 45, EC
        mov     dword [eax+28H], 0                      ; 18EC _ C7. 40, 28, 00000000
        mov     dword [ebp-0CH], 6                      ; 18F3 _ C7. 45, F4, 00000006
        jmp     ?_083                                   ; 18FA _ EB, 24

?_082:  mov     edx, dword [ebp-0CH]                    ; 18FC _ 8B. 55, F4
        mov     eax, dword [ebp+8H]                     ; 18FF _ 8B. 45, 08
        add     eax, edx                                ; 1902 _ 01. D0
        movzx   eax, byte [eax]                         ; 1904 _ 0F B6. 00
        movzx   eax, al                                 ; 1907 _ 0F B6. C0
        mov     edx, dword [ebp-14H]                    ; 190A _ 8B. 55, EC
        add     edx, 16                                 ; 190D _ 83. C2, 10
        mov     dword [esp+4H], eax                     ; 1910 _ 89. 44 24, 04
        mov     dword [esp], edx                        ; 1914 _ 89. 14 24
        call    fifo8_put                               ; 1917 _ E8, FFFFFFFC(rel)
        add     dword [ebp-0CH], 1                      ; 191C _ 83. 45, F4, 01
?_083:  mov     edx, dword [ebp-0CH]                    ; 1920 _ 8B. 55, F4
        mov     eax, dword [ebp+8H]                     ; 1923 _ 8B. 45, 08
        add     eax, edx                                ; 1926 _ 01. D0
        movzx   eax, byte [eax]                         ; 1928 _ 0F B6. 00
        test    al, al                                  ; 192B _ 84. C0
        jnz     ?_082                                   ; 192D _ 75, CD
        mov     eax, dword [ebp-14H]                    ; 192F _ 8B. 45, EC
        mov     edx, dword [ebp-14H]                    ; 1932 _ 8B. 55, EC
        mov     dword [eax+28H], edx                    ; 1935 _ 89. 50, 28
        mov     eax, dword [ebp-14H]                    ; 1938 _ 8B. 45, EC
        add     eax, 16                                 ; 193B _ 83. C0, 10
        mov     dword [esp+4H], 28                      ; 193E _ C7. 44 24, 04, 0000001C
        mov     dword [esp], eax                        ; 1946 _ 89. 04 24
        call    fifo8_put                               ; 1949 _ E8, FFFFFFFC(rel)
        leave                                           ; 194E _ C9
        ret                                             ; 194F _ C3
; cmd_start End of function

cmd_ncst:; Function begin
        push    ebp                                     ; 1950 _ 55
        mov     ebp, esp                                ; 1951 _ 89. E5
        sub     esp, 40                                 ; 1953 _ 83. EC, 28
        mov     dword [show_console_window], 0          ; 1956 _ C7. 05, 00000000(d), 00000000
        mov     eax, dword [console_count]              ; 1960 _ A1, 00000000(d)
        mov     dword [esp], eax                        ; 1965 _ 89. 04 24
        call    launch_console                          ; 1968 _ E8, FFFFFFFC(rel)
        mov     dword [show_console_window], 1          ; 196D _ C7. 05, 00000000(d), 00000001
        mov     eax, dword [console_count]              ; 1977 _ A1, 00000000(d)
        add     eax, 1                                  ; 197C _ 83. C0, 01
        mov     dword [console_count], eax              ; 197F _ A3, 00000000(d)
        mov     eax, dword [current_console_task]       ; 1984 _ A1, 00000278(d)
        mov     dword [ebp-10H], eax                    ; 1989 _ 89. 45, F0
        mov     eax, dword [ebp-10H]                    ; 198C _ 8B. 45, F0
        mov     dword [eax+28H], 0                      ; 198F _ C7. 40, 28, 00000000
        mov     dword [ebp-0CH], 5                      ; 1996 _ C7. 45, F4, 00000005
        jmp     ?_085                                   ; 199D _ EB, 24

?_084:  mov     edx, dword [ebp-0CH]                    ; 199F _ 8B. 55, F4
        mov     eax, dword [ebp+8H]                     ; 19A2 _ 8B. 45, 08
        add     eax, edx                                ; 19A5 _ 01. D0
        movzx   eax, byte [eax]                         ; 19A7 _ 0F B6. 00
        movzx   eax, al                                 ; 19AA _ 0F B6. C0
        mov     edx, dword [ebp-10H]                    ; 19AD _ 8B. 55, F0
        add     edx, 16                                 ; 19B0 _ 83. C2, 10
        mov     dword [esp+4H], eax                     ; 19B3 _ 89. 44 24, 04
        mov     dword [esp], edx                        ; 19B7 _ 89. 14 24
        call    fifo8_put                               ; 19BA _ E8, FFFFFFFC(rel)
        add     dword [ebp-0CH], 1                      ; 19BF _ 83. 45, F4, 01
?_085:  mov     edx, dword [ebp-0CH]                    ; 19C3 _ 8B. 55, F4
        mov     eax, dword [ebp+8H]                     ; 19C6 _ 8B. 45, 08
        add     eax, edx                                ; 19C9 _ 01. D0
        movzx   eax, byte [eax]                         ; 19CB _ 0F B6. 00
        test    al, al                                  ; 19CE _ 84. C0
        jnz     ?_084                                   ; 19D0 _ 75, CD
        mov     eax, dword [ebp-10H]                    ; 19D2 _ 8B. 45, F0
        mov     edx, dword [ebp-10H]                    ; 19D5 _ 8B. 55, F0
        mov     dword [eax+28H], edx                    ; 19D8 _ 89. 50, 28
        mov     eax, dword [ebp-10H]                    ; 19DB _ 8B. 45, F0
        add     eax, 16                                 ; 19DE _ 83. C0, 10
        mov     dword [esp+4H], 28                      ; 19E1 _ C7. 44 24, 04, 0000001C
        mov     dword [esp], eax                        ; 19E9 _ 89. 04 24
        call    fifo8_put                               ; 19EC _ E8, FFFFFFFC(rel)
        leave                                           ; 19F1 _ C9
        ret                                             ; 19F2 _ C3
; cmd_ncst End of function

console_task:; Function begin
        push    ebp                                     ; 19F3 _ 55
        mov     ebp, esp                                ; 19F4 _ 89. E5
        push    esi                                     ; 19F6 _ 56
        push    ebx                                     ; 19F7 _ 53
        sub     esp, 112                                ; 19F8 _ 83. EC, 70
        call    task_now                                ; 19FB _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 1A00 _ 89. 45, F0
        mov     dword [ebp-0CH], 0                      ; 1A03 _ C7. 45, F4, 00000000
        mov     dword [ebp-14H], 0                      ; 1A0A _ C7. 45, EC, 00000000
        mov     dword [ebp-18H], 0                      ; 1A11 _ C7. 45, E8, 00000000
        mov     eax, dword [memman]                     ; 1A18 _ A1, 00000000(d)
        mov     dword [esp+4H], 30                      ; 1A1D _ C7. 44 24, 04, 0000001E
        mov     dword [esp], eax                        ; 1A25 _ 89. 04 24
        call    memman_alloc                            ; 1A28 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-1CH], eax                    ; 1A2D _ 89. 45, E4
        mov     dword [ebp-20H], 64                     ; 1A30 _ C7. 45, E0, 00000040
        mov     eax, dword [ebp-10H]                    ; 1A37 _ 8B. 45, F0
        mov     edx, dword [ebp+8H]                     ; 1A3A _ 8B. 55, 08
        mov     dword [eax+94H], edx                    ; 1A3D _ 89. 90, 00000094
        mov     eax, dword [ebp-10H]                    ; 1A43 _ 8B. 45, F0
        mov     dword [eax+98H], 16                     ; 1A46 _ C7. 80, 00000098, 00000010
        mov     eax, dword [ebp-10H]                    ; 1A50 _ 8B. 45, F0
        mov     dword [eax+9CH], 28                     ; 1A53 _ C7. 80, 0000009C, 0000001C
        mov     eax, dword [ebp-10H]                    ; 1A5D _ 8B. 45, F0
        mov     dword [eax+0A0H], -1                    ; 1A60 _ C7. 80, 000000A0, FFFFFFFF
        call    timer_alloc                             ; 1A6A _ E8, FFFFFFFC(rel)
        mov     dword [ebp-24H], eax                    ; 1A6F _ 89. 45, DC
        mov     eax, dword [ebp-10H]                    ; 1A72 _ 8B. 45, F0
        add     eax, 16                                 ; 1A75 _ 83. C0, 10
        mov     dword [esp+8H], 1                       ; 1A78 _ C7. 44 24, 08, 00000001
        mov     dword [esp+4H], eax                     ; 1A80 _ 89. 44 24, 04
        mov     eax, dword [ebp-24H]                    ; 1A84 _ 8B. 45, DC
        mov     dword [esp], eax                        ; 1A87 _ 89. 04 24
        call    timer_init                              ; 1A8A _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 50                      ; 1A8F _ C7. 44 24, 04, 00000032
        mov     eax, dword [ebp-24H]                    ; 1A97 _ 8B. 45, DC
        mov     dword [esp], eax                        ; 1A9A _ 89. 04 24
        call    timer_settime                           ; 1A9D _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 1AA2 _ 8B. 45, F0
        mov     edx, dword [ebp-24H]                    ; 1AA5 _ 8B. 55, DC
        mov     dword [eax+0A8H], edx                   ; 1AA8 _ 89. 90, 000000A8
        mov     eax, dword [ebp-10H]                    ; 1AAE _ 8B. 45, F0
        mov     edx, dword [ebp-1CH]                    ; 1AB1 _ 8B. 55, E4
        mov     dword [eax+0ACH], edx                   ; 1AB4 _ 89. 90, 000000AC
        mov     eax, dword [shtctl]                     ; 1ABA _ A1, 00000264(d)
        mov     dword [esp+14H], ?_395                  ; 1ABF _ C7. 44 24, 14, 00000023(d)
        mov     dword [esp+10H], 7                      ; 1AC7 _ C7. 44 24, 10, 00000007
        mov     dword [esp+0CH], 28                     ; 1ACF _ C7. 44 24, 0C, 0000001C
        mov     dword [esp+8H], 8                       ; 1AD7 _ C7. 44 24, 08, 00000008
        mov     edx, dword [ebp+8H]                     ; 1ADF _ 8B. 55, 08
        mov     dword [esp+4H], edx                     ; 1AE2 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1AE6 _ 89. 04 24
        call    showString                              ; 1AE9 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-28H], 78848                  ; 1AEE _ C7. 45, D8, 00013400
        mov     dword [ebp-2CH], 0                      ; 1AF5 _ C7. 45, D4, 00000000
?_086:  call    io_cli                                  ; 1AFC _ E8, FFFFFFFC(rel)
        call    task_now                                ; 1B01 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 1B06 _ 89. 45, F0
        mov     eax, dword [ebp-10H]                    ; 1B09 _ 8B. 45, F0
        add     eax, 16                                 ; 1B0C _ 83. C0, 10
        mov     dword [esp], eax                        ; 1B0F _ 89. 04 24
        call    fifo8_status                            ; 1B12 _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 1B17 _ 85. C0
        jnz     ?_087                                   ; 1B19 _ 75, 0A
        call    io_sti                                  ; 1B1B _ E8, FFFFFFFC(rel)
        jmp     ?_104                                   ; 1B20 _ E9, 000004A8

?_087:  mov     eax, dword [ebp-10H]                    ; 1B25 _ 8B. 45, F0
        add     eax, 16                                 ; 1B28 _ 83. C0, 10
        mov     dword [esp], eax                        ; 1B2B _ 89. 04 24
        call    fifo8_get                               ; 1B2E _ E8, FFFFFFFC(rel)
        mov     dword [ebp-30H], eax                    ; 1B33 _ 89. 45, D0
        cmp     dword [ebp-30H], 1                      ; 1B36 _ 83. 7D, D0, 01
        jg      ?_090                                   ; 1B3A _ 7F, 6E
        cmp     dword [ebp-0CH], 0                      ; 1B3C _ 83. 7D, F4, 00
        js      ?_090                                   ; 1B40 _ 78, 68
        cmp     dword [ebp-30H], 0                      ; 1B42 _ 83. 7D, D0, 00
        jz      ?_088                                   ; 1B46 _ 74, 26
        mov     eax, dword [ebp-10H]                    ; 1B48 _ 8B. 45, F0
        add     eax, 16                                 ; 1B4B _ 83. C0, 10
        mov     dword [esp+8H], 0                       ; 1B4E _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], eax                     ; 1B56 _ 89. 44 24, 04
        mov     eax, dword [ebp-24H]                    ; 1B5A _ 8B. 45, DC
        mov     dword [esp], eax                        ; 1B5D _ 89. 04 24
        call    timer_init                              ; 1B60 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], 7                      ; 1B65 _ C7. 45, F4, 00000007
        jmp     ?_089                                   ; 1B6C _ EB, 24

?_088:  mov     eax, dword [ebp-10H]                    ; 1B6E _ 8B. 45, F0
        add     eax, 16                                 ; 1B71 _ 83. C0, 10
        mov     dword [esp+8H], 1                       ; 1B74 _ C7. 44 24, 08, 00000001
        mov     dword [esp+4H], eax                     ; 1B7C _ 89. 44 24, 04
        mov     eax, dword [ebp-24H]                    ; 1B80 _ 8B. 45, DC
        mov     dword [esp], eax                        ; 1B83 _ 89. 04 24
        call    timer_init                              ; 1B86 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], 0                      ; 1B8B _ C7. 45, F4, 00000000
?_089:  mov     dword [esp+4H], 50                      ; 1B92 _ C7. 44 24, 04, 00000032
        mov     eax, dword [ebp-24H]                    ; 1B9A _ 8B. 45, DC
        mov     dword [esp], eax                        ; 1B9D _ 89. 04 24
        call    timer_settime                           ; 1BA0 _ E8, FFFFFFFC(rel)
        jmp     ?_103                                   ; 1BA5 _ E9, 000003D5

?_090:  cmp     dword [ebp-30H], 87                     ; 1BAA _ 83. 7D, D0, 57
        jnz     ?_091                                   ; 1BAE _ 75, 3C
        mov     dword [ebp-0CH], 7                      ; 1BB0 _ C7. 45, F4, 00000007
        mov     eax, dword [ebp-10H]                    ; 1BB7 _ 8B. 45, F0
        add     eax, 16                                 ; 1BBA _ 83. C0, 10
        mov     dword [esp+8H], 0                       ; 1BBD _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], eax                     ; 1BC5 _ 89. 44 24, 04
        mov     eax, dword [ebp-24H]                    ; 1BC9 _ 8B. 45, DC
        mov     dword [esp], eax                        ; 1BCC _ 89. 04 24
        call    timer_init                              ; 1BCF _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 50                      ; 1BD4 _ C7. 44 24, 04, 00000032
        mov     eax, dword [ebp-24H]                    ; 1BDC _ 8B. 45, DC
        mov     dword [esp], eax                        ; 1BDF _ 89. 04 24
        call    timer_settime                           ; 1BE2 _ E8, FFFFFFFC(rel)
        jmp     ?_103                                   ; 1BE7 _ E9, 00000393

?_091:  cmp     dword [ebp-30H], 88                     ; 1BEC _ 83. 7D, D0, 58
        jnz     ?_092                                   ; 1BF0 _ 75, 6A
        mov     eax, dword [ebp-10H]                    ; 1BF2 _ 8B. 45, F0
        mov     ecx, dword [eax+9CH]                    ; 1BF5 _ 8B. 88, 0000009C
        mov     eax, dword [ebp-10H]                    ; 1BFB _ 8B. 45, F0
        mov     edx, dword [eax+98H]                    ; 1BFE _ 8B. 90, 00000098
        mov     eax, dword [shtctl]                     ; 1C04 _ A1, 00000264(d)
        mov     dword [esp+10H], 0                      ; 1C09 _ C7. 44 24, 10, 00000000
        mov     dword [esp+0CH], ecx                    ; 1C11 _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 1C15 _ 89. 54 24, 08
        mov     edx, dword [ebp+8H]                     ; 1C19 _ 8B. 55, 08
        mov     dword [esp+4H], edx                     ; 1C1C _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1C20 _ 89. 04 24
        call    set_cursor                              ; 1C23 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], -1                     ; 1C28 _ C7. 45, F4, FFFFFFFF
        mov     eax, dword [task_main]                  ; 1C2F _ A1, 00000274(d)
        mov     dword [esp+8H], 0                       ; 1C34 _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], -1                      ; 1C3C _ C7. 44 24, 04, FFFFFFFF
        mov     dword [esp], eax                        ; 1C44 _ 89. 04 24
        call    task_run                                ; 1C47 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 1C4C _ 8B. 45, F0
        mov     dword [esp], eax                        ; 1C4F _ 89. 04 24
        call    task_sleep                              ; 1C52 _ E8, FFFFFFFC(rel)
        jmp     ?_103                                   ; 1C57 _ E9, 00000323

?_092:  cmp     dword [ebp-30H], 28                     ; 1C5C _ 83. 7D, D0, 1C
        jne     ?_101                                   ; 1C60 _ 0F 85, 000001E0
        mov     eax, dword [ebp-10H]                    ; 1C66 _ 8B. 45, F0
        mov     ecx, dword [eax+9CH]                    ; 1C69 _ 8B. 88, 0000009C
        mov     eax, dword [ebp-10H]                    ; 1C6F _ 8B. 45, F0
        mov     edx, dword [eax+98H]                    ; 1C72 _ 8B. 90, 00000098
        mov     eax, dword [shtctl]                     ; 1C78 _ A1, 00000264(d)
        mov     dword [esp+10H], 0                      ; 1C7D _ C7. 44 24, 10, 00000000
        mov     dword [esp+0CH], ecx                    ; 1C85 _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 1C89 _ 89. 54 24, 08
        mov     edx, dword [ebp+8H]                     ; 1C8D _ 8B. 55, 08
        mov     dword [esp+4H], edx                     ; 1C90 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1C94 _ 89. 04 24
        call    set_cursor                              ; 1C97 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 1C9C _ 8B. 45, F0
        mov     eax, dword [eax+98H]                    ; 1C9F _ 8B. 80, 00000098
        lea     edx, [eax+7H]                           ; 1CA5 _ 8D. 50, 07
        test    eax, eax                                ; 1CA8 _ 85. C0
        cmovs   eax, edx                                ; 1CAA _ 0F 48. C2
        sar     eax, 3                                  ; 1CAD _ C1. F8, 03
        lea     edx, [eax-2H]                           ; 1CB0 _ 8D. 50, FE
        mov     eax, dword [ebp-1CH]                    ; 1CB3 _ 8B. 45, E4
        add     eax, edx                                ; 1CB6 _ 01. D0
        mov     byte [eax], 0                           ; 1CB8 _ C6. 00, 00
        mov     eax, dword [ebp-10H]                    ; 1CBB _ 8B. 45, F0
        mov     eax, dword [eax+98H]                    ; 1CBE _ 8B. 80, 00000098
        lea     edx, [eax+7H]                           ; 1CC4 _ 8D. 50, 07
        test    eax, eax                                ; 1CC7 _ 85. C0
        cmovs   eax, edx                                ; 1CC9 _ 0F 48. C2
        sar     eax, 3                                  ; 1CCC _ C1. F8, 03
        sub     eax, 2                                  ; 1CCF _ 83. E8, 02
        mov     byte [ebp+eax-51H], 0                   ; 1CD2 _ C6. 44 05, AF, 00
        mov     eax, dword [ebp-10H]                    ; 1CD7 _ 8B. 45, F0
        mov     eax, dword [eax+9CH]                    ; 1CDA _ 8B. 80, 0000009C
        mov     edx, dword [ebp+8H]                     ; 1CE0 _ 8B. 55, 08
        mov     dword [esp+4H], edx                     ; 1CE3 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1CE7 _ 89. 04 24
        call    cons_newline                            ; 1CEA _ E8, FFFFFFFC(rel)
        mov     edx, dword [ebp-10H]                    ; 1CEF _ 8B. 55, F0
        mov     dword [edx+9CH], eax                    ; 1CF2 _ 89. 82, 0000009C
        mov     dword [esp+4H], ?_397                   ; 1CF8 _ C7. 44 24, 04, 0000002D(d)
        mov     eax, dword [ebp-1CH]                    ; 1D00 _ 8B. 45, E4
        mov     dword [esp], eax                        ; 1D03 _ 89. 04 24
        call    strcmp                                  ; 1D06 _ E8, FFFFFFFC(rel)
        cmp     eax, 1                                  ; 1D0B _ 83. F8, 01
        jnz     ?_093                                   ; 1D0E _ 75, 10
        mov     eax, dword [ebp+0CH]                    ; 1D10 _ 8B. 45, 0C
        mov     dword [esp], eax                        ; 1D13 _ 89. 04 24
        call    cmd_mem                                 ; 1D16 _ E8, FFFFFFFC(rel)
        jmp     ?_100                                   ; 1D1B _ E9, 00000114

?_093:  mov     dword [esp+4H], ?_398                   ; 1D20 _ C7. 44 24, 04, 00000031(d)
        mov     eax, dword [ebp-1CH]                    ; 1D28 _ 8B. 45, E4
        mov     dword [esp], eax                        ; 1D2B _ 89. 04 24
        call    strcmp                                  ; 1D2E _ E8, FFFFFFFC(rel)
        cmp     eax, 1                                  ; 1D33 _ 83. F8, 01
        jnz     ?_094                                   ; 1D36 _ 75, 0A
        call    cmd_cls                                 ; 1D38 _ E8, FFFFFFFC(rel)
        jmp     ?_100                                   ; 1D3D _ E9, 000000F2

?_094:  mov     dword [esp+4H], ?_399                   ; 1D42 _ C7. 44 24, 04, 00000035(d)
        mov     eax, dword [ebp-1CH]                    ; 1D4A _ 8B. 45, E4
        mov     dword [esp], eax                        ; 1D4D _ 89. 04 24
        call    strcmp                                  ; 1D50 _ E8, FFFFFFFC(rel)
        cmp     eax, 1                                  ; 1D55 _ 83. F8, 01
        jnz     ?_095                                   ; 1D58 _ 75, 0A
        call    cmd_hlt                                 ; 1D5A _ E8, FFFFFFFC(rel)
        jmp     ?_100                                   ; 1D5F _ E9, 000000D0

?_095:  mov     dword [esp+4H], ?_400                   ; 1D64 _ C7. 44 24, 04, 00000039(d)
        mov     eax, dword [ebp-1CH]                    ; 1D6C _ 8B. 45, E4
        mov     dword [esp], eax                        ; 1D6F _ 89. 04 24
        call    strcmp                                  ; 1D72 _ E8, FFFFFFFC(rel)
        cmp     eax, 1                                  ; 1D77 _ 83. F8, 01
        jnz     ?_096                                   ; 1D7A _ 75, 0A
        call    cmd_dir                                 ; 1D7C _ E8, FFFFFFFC(rel)
        jmp     ?_100                                   ; 1D81 _ E9, 000000AE

?_096:  mov     dword [esp+4H], ?_401                   ; 1D86 _ C7. 44 24, 04, 0000003D(d)
        mov     eax, dword [ebp-1CH]                    ; 1D8E _ 8B. 45, E4
        mov     dword [esp], eax                        ; 1D91 _ 89. 04 24
        call    strcmp                                  ; 1D94 _ E8, FFFFFFFC(rel)
        cmp     eax, 1                                  ; 1D99 _ 83. F8, 01
        jnz     ?_097                                   ; 1D9C _ 75, 10
        mov     eax, dword [ebp-10H]                    ; 1D9E _ 8B. 45, F0
        mov     dword [esp], eax                        ; 1DA1 _ 89. 04 24
        call    cmd_exit                                ; 1DA4 _ E8, FFFFFFFC(rel)
        jmp     ?_100                                   ; 1DA9 _ E9, 00000086

?_097:  mov     eax, dword [ebp-1CH]                    ; 1DAE _ 8B. 45, E4
        movzx   eax, byte [eax]                         ; 1DB1 _ 0F B6. 00
        cmp     al, 116                                 ; 1DB4 _ 3C, 74
        jnz     ?_098                                   ; 1DB6 _ 75, 34
        mov     eax, dword [ebp-1CH]                    ; 1DB8 _ 8B. 45, E4
        add     eax, 1                                  ; 1DBB _ 83. C0, 01
        movzx   eax, byte [eax]                         ; 1DBE _ 0F B6. 00
        cmp     al, 121                                 ; 1DC1 _ 3C, 79
        jnz     ?_098                                   ; 1DC3 _ 75, 27
        mov     eax, dword [ebp-1CH]                    ; 1DC5 _ 8B. 45, E4
        add     eax, 2                                  ; 1DC8 _ 83. C0, 02
        movzx   eax, byte [eax]                         ; 1DCB _ 0F B6. 00
        cmp     al, 112                                 ; 1DCE _ 3C, 70
        jnz     ?_098                                   ; 1DD0 _ 75, 1A
        mov     eax, dword [ebp-1CH]                    ; 1DD2 _ 8B. 45, E4
        add     eax, 3                                  ; 1DD5 _ 83. C0, 03
        movzx   eax, byte [eax]                         ; 1DD8 _ 0F B6. 00
        cmp     al, 101                                 ; 1DDB _ 3C, 65
        jnz     ?_098                                   ; 1DDD _ 75, 0D
        mov     eax, dword [ebp-1CH]                    ; 1DDF _ 8B. 45, E4
        mov     dword [esp], eax                        ; 1DE2 _ 89. 04 24
        call    cmd_type                                ; 1DE5 _ E8, FFFFFFFC(rel)
        jmp     ?_100                                   ; 1DEA _ EB, 48

?_098:  mov     dword [esp+4H], ?_402                   ; 1DEC _ C7. 44 24, 04, 00000042(d)
        mov     eax, dword [ebp-1CH]                    ; 1DF4 _ 8B. 45, E4
        mov     dword [esp], eax                        ; 1DF7 _ 89. 04 24
        call    strcmp                                  ; 1DFA _ E8, FFFFFFFC(rel)
        cmp     eax, 1                                  ; 1DFF _ 83. F8, 01
        jnz     ?_099                                   ; 1E02 _ 75, 0D
        lea     eax, [ebp-51H]                          ; 1E04 _ 8D. 45, AF
        mov     dword [esp], eax                        ; 1E07 _ 89. 04 24
        call    cmd_start                               ; 1E0A _ E8, FFFFFFFC(rel)
        jmp     ?_100                                   ; 1E0F _ EB, 23

?_099:  mov     dword [esp+4H], ?_403                   ; 1E11 _ C7. 44 24, 04, 00000048(d)
        mov     eax, dword [ebp-1CH]                    ; 1E19 _ 8B. 45, E4
        mov     dword [esp], eax                        ; 1E1C _ 89. 04 24
        call    strcmp                                  ; 1E1F _ E8, FFFFFFFC(rel)
        cmp     eax, 1                                  ; 1E24 _ 83. F8, 01
        jnz     ?_100                                   ; 1E27 _ 75, 0B
        lea     eax, [ebp-51H]                          ; 1E29 _ 8D. 45, AF
        mov     dword [esp], eax                        ; 1E2C _ 89. 04 24
        call    cmd_ncst                                ; 1E2F _ E8, FFFFFFFC(rel)
?_100:  mov     eax, dword [ebp-10H]                    ; 1E34 _ 8B. 45, F0
        mov     dword [eax+98H], 16                     ; 1E37 _ C7. 80, 00000098, 00000010
        jmp     ?_103                                   ; 1E41 _ E9, 00000139

?_101:  cmp     dword [ebp-30H], 14                     ; 1E46 _ 83. 7D, D0, 0E
        jne     ?_102                                   ; 1E4A _ 0F 85, 00000098
        mov     eax, dword [ebp-10H]                    ; 1E50 _ 8B. 45, F0
        mov     eax, dword [eax+98H]                    ; 1E53 _ 8B. 80, 00000098
        cmp     eax, 8                                  ; 1E59 _ 83. F8, 08
        jle     ?_102                                   ; 1E5C _ 0F 8E, 00000086
        mov     eax, dword [ebp-10H]                    ; 1E62 _ 8B. 45, F0
        mov     ecx, dword [eax+9CH]                    ; 1E65 _ 8B. 88, 0000009C
        mov     eax, dword [ebp-10H]                    ; 1E6B _ 8B. 45, F0
        mov     edx, dword [eax+98H]                    ; 1E6E _ 8B. 90, 00000098
        mov     eax, dword [shtctl]                     ; 1E74 _ A1, 00000264(d)
        mov     dword [esp+10H], 0                      ; 1E79 _ C7. 44 24, 10, 00000000
        mov     dword [esp+0CH], ecx                    ; 1E81 _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 1E85 _ 89. 54 24, 08
        mov     edx, dword [ebp+8H]                     ; 1E89 _ 8B. 55, 08
        mov     dword [esp+4H], edx                     ; 1E8C _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1E90 _ 89. 04 24
        call    set_cursor                              ; 1E93 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 1E98 _ 8B. 45, F0
        mov     eax, dword [eax+98H]                    ; 1E9B _ 8B. 80, 00000098
        lea     edx, [eax-8H]                           ; 1EA1 _ 8D. 50, F8
        mov     eax, dword [ebp-10H]                    ; 1EA4 _ 8B. 45, F0
        mov     dword [eax+98H], edx                    ; 1EA7 _ 89. 90, 00000098
        mov     eax, dword [ebp-10H]                    ; 1EAD _ 8B. 45, F0
        mov     ecx, dword [eax+9CH]                    ; 1EB0 _ 8B. 88, 0000009C
        mov     eax, dword [ebp-10H]                    ; 1EB6 _ 8B. 45, F0
        mov     edx, dword [eax+98H]                    ; 1EB9 _ 8B. 90, 00000098
        mov     eax, dword [shtctl]                     ; 1EBF _ A1, 00000264(d)
        mov     dword [esp+10H], 0                      ; 1EC4 _ C7. 44 24, 10, 00000000
        mov     dword [esp+0CH], ecx                    ; 1ECC _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 1ED0 _ 89. 54 24, 08
        mov     edx, dword [ebp+8H]                     ; 1ED4 _ 8B. 55, 08
        mov     dword [esp+4H], edx                     ; 1ED7 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1EDB _ 89. 04 24
        call    set_cursor                              ; 1EDE _ E8, FFFFFFFC(rel)
        jmp     ?_103                                   ; 1EE3 _ E9, 00000097

?_102:  mov     eax, dword [ebp-30H]                    ; 1EE8 _ 8B. 45, D0
        mov     dword [esp], eax                        ; 1EEB _ 89. 04 24
        call    transferScanCode                        ; 1EEE _ E8, FFFFFFFC(rel)
        mov     byte [ebp-31H], al                      ; 1EF3 _ 88. 45, CF
        mov     eax, dword [ebp-10H]                    ; 1EF6 _ 8B. 45, F0
        mov     eax, dword [eax+98H]                    ; 1EF9 _ 8B. 80, 00000098
        cmp     eax, 239                                ; 1EFF _ 3D, 000000EF
        jg      ?_103                                   ; 1F04 _ 7F, 79
        cmp     byte [ebp-31H], 0                       ; 1F06 _ 80. 7D, CF, 00
        jz      ?_103                                   ; 1F0A _ 74, 73
        mov     eax, dword [ebp-10H]                    ; 1F0C _ 8B. 45, F0
        mov     eax, dword [eax+98H]                    ; 1F0F _ 8B. 80, 00000098
        lea     edx, [eax+7H]                           ; 1F15 _ 8D. 50, 07
        test    eax, eax                                ; 1F18 _ 85. C0
        cmovs   eax, edx                                ; 1F1A _ 0F 48. C2
        sar     eax, 3                                  ; 1F1D _ C1. F8, 03
        lea     edx, [eax-2H]                           ; 1F20 _ 8D. 50, FE
        mov     eax, dword [ebp-1CH]                    ; 1F23 _ 8B. 45, E4
        add     edx, eax                                ; 1F26 _ 01. C2
        movzx   eax, byte [ebp-31H]                     ; 1F28 _ 0F B6. 45, CF
        mov     byte [edx], al                          ; 1F2C _ 88. 02
        mov     eax, dword [ebp-10H]                    ; 1F2E _ 8B. 45, F0
        mov     eax, dword [eax+98H]                    ; 1F31 _ 8B. 80, 00000098
        lea     edx, [eax+7H]                           ; 1F37 _ 8D. 50, 07
        test    eax, eax                                ; 1F3A _ 85. C0
        cmovs   eax, edx                                ; 1F3C _ 0F 48. C2
        sar     eax, 3                                  ; 1F3F _ C1. F8, 03
        lea     edx, [eax-1H]                           ; 1F42 _ 8D. 50, FF
        mov     eax, dword [ebp-1CH]                    ; 1F45 _ 8B. 45, E4
        add     eax, edx                                ; 1F48 _ 01. D0
        mov     byte [eax], 0                           ; 1F4A _ C6. 00, 00
        mov     eax, dword [ebp-10H]                    ; 1F4D _ 8B. 45, F0
        mov     eax, dword [eax+98H]                    ; 1F50 _ 8B. 80, 00000098
        lea     edx, [eax+7H]                           ; 1F56 _ 8D. 50, 07
        test    eax, eax                                ; 1F59 _ 85. C0
        cmovs   eax, edx                                ; 1F5B _ 0F 48. C2
        sar     eax, 3                                  ; 1F5E _ C1. F8, 03
        lea     edx, [eax-2H]                           ; 1F61 _ 8D. 50, FE
        mov     eax, dword [ebp-30H]                    ; 1F64 _ 8B. 45, D0
        mov     byte [ebp+edx-51H], al                  ; 1F67 _ 88. 44 15, AF
        movsx   eax, byte [ebp-31H]                     ; 1F6B _ 0F BE. 45, CF
        mov     dword [esp+4H], 1                       ; 1F6F _ C7. 44 24, 04, 00000001
        mov     dword [esp], eax                        ; 1F77 _ 89. 04 24
        call    cons_putchar                            ; 1F7A _ E8, FFFFFFFC(rel)
?_103:  cmp     dword [ebp-0CH], 0                      ; 1F7F _ 83. 7D, F4, 00
        js      ?_104                                   ; 1F83 _ 78, 48
        mov     eax, dword [ebp-10H]                    ; 1F85 _ 8B. 45, F0
        mov     eax, dword [eax+94H]                    ; 1F88 _ 8B. 80, 00000094
        test    eax, eax                                ; 1F8E _ 85. C0
        jz      ?_104                                   ; 1F90 _ 74, 3B
        mov     eax, dword [ebp-10H]                    ; 1F92 _ 8B. 45, F0
        mov     ebx, dword [eax+9CH]                    ; 1F95 _ 8B. 98, 0000009C
        mov     eax, dword [ebp-10H]                    ; 1F9B _ 8B. 45, F0
        mov     ecx, dword [eax+98H]                    ; 1F9E _ 8B. 88, 00000098
        mov     eax, dword [ebp-10H]                    ; 1FA4 _ 8B. 45, F0
        mov     edx, dword [eax+94H]                    ; 1FA7 _ 8B. 90, 00000094
        mov     eax, dword [shtctl]                     ; 1FAD _ A1, 00000264(d)
        mov     esi, dword [ebp-0CH]                    ; 1FB2 _ 8B. 75, F4
        mov     dword [esp+10H], esi                    ; 1FB5 _ 89. 74 24, 10
        mov     dword [esp+0CH], ebx                    ; 1FB9 _ 89. 5C 24, 0C
        mov     dword [esp+8H], ecx                     ; 1FBD _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 1FC1 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1FC5 _ 89. 04 24
        call    set_cursor                              ; 1FC8 _ E8, FFFFFFFC(rel)
?_104:  call    io_sti                                  ; 1FCD _ E8, FFFFFFFC(rel)
        jmp     ?_086                                   ; 1FD2 _ E9, FFFFFB25
; console_task End of function

cons_putstr:; Function begin
        push    ebp                                     ; 1FD7 _ 55
        mov     ebp, esp                                ; 1FD8 _ 89. E5
        sub     esp, 24                                 ; 1FDA _ 83. EC, 18
        jmp     ?_106                                   ; 1FDD _ EB, 1D

?_105:  mov     eax, dword [ebp+8H]                     ; 1FDF _ 8B. 45, 08
        movzx   eax, byte [eax]                         ; 1FE2 _ 0F B6. 00
        movsx   eax, al                                 ; 1FE5 _ 0F BE. C0
        mov     dword [esp+4H], 1                       ; 1FE8 _ C7. 44 24, 04, 00000001
        mov     dword [esp], eax                        ; 1FF0 _ 89. 04 24
        call    cons_putchar                            ; 1FF3 _ E8, FFFFFFFC(rel)
        add     dword [ebp+8H], 1                       ; 1FF8 _ 83. 45, 08, 01
?_106:  mov     eax, dword [ebp+8H]                     ; 1FFC _ 8B. 45, 08
        movzx   eax, byte [eax]                         ; 1FFF _ 0F B6. 00
        test    al, al                                  ; 2002 _ 84. C0
        jnz     ?_105                                   ; 2004 _ 75, D9
        nop                                             ; 2006 _ 90
        leave                                           ; 2007 _ C9
        ret                                             ; 2008 _ C3
; cons_putstr End of function

api_linewin:; Function begin
        push    ebp                                     ; 2009 _ 55
        mov     ebp, esp                                ; 200A _ 89. E5
        sub     esp, 32                                 ; 200C _ 83. EC, 20
        mov     eax, dword [ebp+0CH]                    ; 200F _ 8B. 45, 0C
        mov     edx, dword [ebp+14H]                    ; 2012 _ 8B. 55, 14
        sub     edx, eax                                ; 2015 _ 29. C2
        mov     eax, edx                                ; 2017 _ 89. D0
        mov     dword [ebp-14H], eax                    ; 2019 _ 89. 45, EC
        mov     eax, dword [ebp+10H]                    ; 201C _ 8B. 45, 10
        mov     edx, dword [ebp+18H]                    ; 201F _ 8B. 55, 18
        sub     edx, eax                                ; 2022 _ 29. C2
        mov     eax, edx                                ; 2024 _ 89. D0
        mov     dword [ebp-18H], eax                    ; 2026 _ 89. 45, E8
        mov     eax, dword [ebp+0CH]                    ; 2029 _ 8B. 45, 0C
        shl     eax, 10                                 ; 202C _ C1. E0, 0A
        mov     dword [ebp-8H], eax                     ; 202F _ 89. 45, F8
        mov     eax, dword [ebp+10H]                    ; 2032 _ 8B. 45, 10
        shl     eax, 10                                 ; 2035 _ C1. E0, 0A
        mov     dword [ebp-0CH], eax                    ; 2038 _ 89. 45, F4
        cmp     dword [ebp-14H], 0                      ; 203B _ 83. 7D, EC, 00
        jns     ?_107                                   ; 203F _ 79, 03
        neg     dword [ebp-14H]                         ; 2041 _ F7. 5D, EC
?_107:  cmp     dword [ebp-18H], 0                      ; 2044 _ 83. 7D, E8, 00
        jns     ?_108                                   ; 2048 _ 79, 03
        neg     dword [ebp-18H]                         ; 204A _ F7. 5D, E8
?_108:  mov     eax, dword [ebp-14H]                    ; 204D _ 8B. 45, EC
        cmp     eax, dword [ebp-18H]                    ; 2050 _ 3B. 45, E8
        jl      ?_112                                   ; 2053 _ 7C, 5B
        mov     eax, dword [ebp-14H]                    ; 2055 _ 8B. 45, EC
        add     eax, 1                                  ; 2058 _ 83. C0, 01
        mov     dword [ebp-10H], eax                    ; 205B _ 89. 45, F0
        mov     eax, dword [ebp+0CH]                    ; 205E _ 8B. 45, 0C
        cmp     eax, dword [ebp+14H]                    ; 2061 _ 3B. 45, 14
        jle     ?_109                                   ; 2064 _ 7E, 09
        mov     dword [ebp-14H], -1024                  ; 2066 _ C7. 45, EC, FFFFFC00
        jmp     ?_110                                   ; 206D _ EB, 07

?_109:  mov     dword [ebp-14H], 1024                   ; 206F _ C7. 45, EC, 00000400
?_110:  mov     eax, dword [ebp+10H]                    ; 2076 _ 8B. 45, 10
        cmp     eax, dword [ebp+18H]                    ; 2079 _ 3B. 45, 18
        jg      ?_111                                   ; 207C _ 7F, 19
        mov     eax, dword [ebp+10H]                    ; 207E _ 8B. 45, 10
        mov     edx, dword [ebp+18H]                    ; 2081 _ 8B. 55, 18
        sub     edx, eax                                ; 2084 _ 29. C2
        mov     eax, edx                                ; 2086 _ 89. D0
        add     eax, 1                                  ; 2088 _ 83. C0, 01
        shl     eax, 10                                 ; 208B _ C1. E0, 0A
        cdq                                             ; 208E _ 99
        idiv    dword [ebp-10H]                         ; 208F _ F7. 7D, F0
        mov     dword [ebp-18H], eax                    ; 2092 _ 89. 45, E8
        jmp     ?_116                                   ; 2095 _ EB, 72

?_111:  mov     eax, dword [ebp+10H]                    ; 2097 _ 8B. 45, 10
        mov     edx, dword [ebp+18H]                    ; 209A _ 8B. 55, 18
        sub     edx, eax                                ; 209D _ 29. C2
        mov     eax, edx                                ; 209F _ 89. D0
        sub     eax, 1                                  ; 20A1 _ 83. E8, 01
        shl     eax, 10                                 ; 20A4 _ C1. E0, 0A
        cdq                                             ; 20A7 _ 99
        idiv    dword [ebp-10H]                         ; 20A8 _ F7. 7D, F0
        mov     dword [ebp-18H], eax                    ; 20AB _ 89. 45, E8
        jmp     ?_116                                   ; 20AE _ EB, 59

?_112:  mov     eax, dword [ebp-18H]                    ; 20B0 _ 8B. 45, E8
        add     eax, 1                                  ; 20B3 _ 83. C0, 01
        mov     dword [ebp-10H], eax                    ; 20B6 _ 89. 45, F0
        mov     eax, dword [ebp+10H]                    ; 20B9 _ 8B. 45, 10
        cmp     eax, dword [ebp+18H]                    ; 20BC _ 3B. 45, 18
        jle     ?_113                                   ; 20BF _ 7E, 09
        mov     dword [ebp-18H], -1024                  ; 20C1 _ C7. 45, E8, FFFFFC00
        jmp     ?_114                                   ; 20C8 _ EB, 07

?_113:  mov     dword [ebp-18H], 1024                   ; 20CA _ C7. 45, E8, 00000400
?_114:  mov     eax, dword [ebp+0CH]                    ; 20D1 _ 8B. 45, 0C
        cmp     eax, dword [ebp+14H]                    ; 20D4 _ 3B. 45, 14
        jg      ?_115                                   ; 20D7 _ 7F, 19
        mov     eax, dword [ebp+0CH]                    ; 20D9 _ 8B. 45, 0C
        mov     edx, dword [ebp+14H]                    ; 20DC _ 8B. 55, 14
        sub     edx, eax                                ; 20DF _ 29. C2
        mov     eax, edx                                ; 20E1 _ 89. D0
        add     eax, 1                                  ; 20E3 _ 83. C0, 01
        shl     eax, 10                                 ; 20E6 _ C1. E0, 0A
        cdq                                             ; 20E9 _ 99
        idiv    dword [ebp-10H]                         ; 20EA _ F7. 7D, F0
        mov     dword [ebp-14H], eax                    ; 20ED _ 89. 45, EC
        jmp     ?_116                                   ; 20F0 _ EB, 17

?_115:  mov     eax, dword [ebp+0CH]                    ; 20F2 _ 8B. 45, 0C
        mov     edx, dword [ebp+14H]                    ; 20F5 _ 8B. 55, 14
        sub     edx, eax                                ; 20F8 _ 29. C2
        mov     eax, edx                                ; 20FA _ 89. D0
        sub     eax, 1                                  ; 20FC _ 83. E8, 01
        shl     eax, 10                                 ; 20FF _ C1. E0, 0A
        cdq                                             ; 2102 _ 99
        idiv    dword [ebp-10H]                         ; 2103 _ F7. 7D, F0
        mov     dword [ebp-14H], eax                    ; 2106 _ 89. 45, EC
?_116:  mov     dword [ebp-4H], 0                       ; 2109 _ C7. 45, FC, 00000000
        jmp     ?_118                                   ; 2110 _ EB, 35

?_117:  mov     eax, dword [ebp+8H]                     ; 2112 _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 2115 _ 8B. 10
        mov     eax, dword [ebp-0CH]                    ; 2117 _ 8B. 45, F4
        sar     eax, 10                                 ; 211A _ C1. F8, 0A
        mov     ecx, eax                                ; 211D _ 89. C1
        mov     eax, dword [ebp+8H]                     ; 211F _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 2122 _ 8B. 40, 04
        imul    eax, ecx                                ; 2125 _ 0F AF. C1
        mov     ecx, dword [ebp-8H]                     ; 2128 _ 8B. 4D, F8
        sar     ecx, 10                                 ; 212B _ C1. F9, 0A
        add     eax, ecx                                ; 212E _ 01. C8
        add     edx, eax                                ; 2130 _ 01. C2
        mov     eax, dword [ebp+1CH]                    ; 2132 _ 8B. 45, 1C
        mov     byte [edx], al                          ; 2135 _ 88. 02
        mov     eax, dword [ebp-14H]                    ; 2137 _ 8B. 45, EC
        add     dword [ebp-8H], eax                     ; 213A _ 01. 45, F8
        mov     eax, dword [ebp-18H]                    ; 213D _ 8B. 45, E8
        add     dword [ebp-0CH], eax                    ; 2140 _ 01. 45, F4
        add     dword [ebp-4H], 1                       ; 2143 _ 83. 45, FC, 01
?_118:  mov     eax, dword [ebp-4H]                     ; 2147 _ 8B. 45, FC
        cmp     eax, dword [ebp-10H]                    ; 214A _ 3B. 45, F0
        jl      ?_117                                   ; 214D _ 7C, C3
        leave                                           ; 214F _ C9
        ret                                             ; 2150 _ C3
; api_linewin End of function

handle_keyboard:; Function begin
        push    ebp                                     ; 2151 _ 55
        mov     ebp, esp                                ; 2152 _ 89. E5
        sub     esp, 56                                 ; 2154 _ 83. EC, 38
?_119:  call    io_cli                                  ; 2157 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 215C _ 8B. 45, 08
        add     eax, 16                                 ; 215F _ 83. C0, 10
        mov     dword [esp], eax                        ; 2162 _ 89. 04 24
        call    fifo8_status                            ; 2165 _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 216A _ 85. C0
        jnz     ?_121                                   ; 216C _ 75, 2B
        call    io_sti                                  ; 216E _ E8, FFFFFFFC(rel)
        cmp     dword [ebp+0CH], 0                      ; 2173 _ 83. 7D, 0C, 00
        jz      ?_120                                   ; 2177 _ 74, 05
        jmp     ?_125                                   ; 2179 _ E9, 000000DC

?_120:  call    io_sti                                  ; 217E _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 2183 _ 8B. 45, 10
        add     eax, 28                                 ; 2186 _ 83. C0, 1C
        mov     dword [eax], -1                         ; 2189 _ C7. 00, FFFFFFFF
        mov     eax, 0                                  ; 218F _ B8, 00000000
        jmp     ?_126                                   ; 2194 _ E9, 000000C6

?_121:  mov     eax, dword [ebp+8H]                     ; 2199 _ 8B. 45, 08
        add     eax, 16                                 ; 219C _ 83. C0, 10
        mov     dword [esp], eax                        ; 219F _ 89. 04 24
        call    fifo8_get                               ; 21A2 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 21A7 _ 89. 45, F4
        call    io_sti                                  ; 21AA _ E8, FFFFFFFC(rel)
        cmp     dword [ebp-0CH], 255                    ; 21AF _ 81. 7D, F4, 000000FF
        jle     ?_122                                   ; 21B6 _ 7E, 37
        mov     edx, dword [sht_back]                   ; 21B8 _ 8B. 15, 00000268(d)
        mov     eax, dword [shtctl]                     ; 21BE _ A1, 00000264(d)
        mov     dword [esp+14H], ?_404                  ; 21C3 _ C7. 44 24, 14, 0000004D(d)
        mov     dword [esp+10H], 7                      ; 21CB _ C7. 44 24, 10, 00000007
        mov     dword [esp+0CH], 176                    ; 21D3 _ C7. 44 24, 0C, 000000B0
        mov     dword [esp+8H], 0                       ; 21DB _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], edx                     ; 21E3 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 21E7 _ 89. 04 24
        call    showString                              ; 21EA _ E8, FFFFFFFC(rel)
?_122:  cmp     dword [ebp-0CH], 1                      ; 21EF _ 83. 7D, F4, 01
        jg      ?_123                                   ; 21F3 _ 7F, 3E
        mov     eax, dword [ebp+8H]                     ; 21F5 _ 8B. 45, 08
        lea     edx, [eax+10H]                          ; 21F8 _ 8D. 50, 10
        mov     eax, dword [ebp+8H]                     ; 21FB _ 8B. 45, 08
        mov     eax, dword [eax+0A8H]                   ; 21FE _ 8B. 80, 000000A8
        mov     dword [esp+8H], 1                       ; 2204 _ C7. 44 24, 08, 00000001
        mov     dword [esp+4H], edx                     ; 220C _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 2210 _ 89. 04 24
        call    timer_init                              ; 2213 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 2218 _ 8B. 45, 08
        mov     eax, dword [eax+0A8H]                   ; 221B _ 8B. 80, 000000A8
        mov     dword [esp+4H], 50                      ; 2221 _ C7. 44 24, 04, 00000032
        mov     dword [esp], eax                        ; 2229 _ 89. 04 24
        call    timer_settime                           ; 222C _ E8, FFFFFFFC(rel)
        jmp     ?_125                                   ; 2231 _ EB, 27

?_123:  cmp     dword [ebp-0CH], 2                      ; 2233 _ 83. 7D, F4, 02
        jnz     ?_124                                   ; 2237 _ 75, 0F
        mov     eax, dword [ebp+8H]                     ; 2239 _ 8B. 45, 08
        mov     dword [eax+0A0H], 7                     ; 223C _ C7. 80, 000000A0, 00000007
        jmp     ?_125                                   ; 2246 _ EB, 12

?_124:  mov     eax, dword [ebp+10H]                    ; 2248 _ 8B. 45, 10
        lea     edx, [eax+1CH]                          ; 224B _ 8D. 50, 1C
        mov     eax, dword [ebp-0CH]                    ; 224E _ 8B. 45, F4
        mov     dword [edx], eax                        ; 2251 _ 89. 02
        mov     eax, 0                                  ; 2253 _ B8, 00000000
        jmp     ?_126                                   ; 2258 _ EB, 05

?_125:  jmp     ?_119                                   ; 225A _ E9, FFFFFEF8

?_126:  leave                                           ; 225F _ C9
        ret                                             ; 2260 _ C3
; handle_keyboard End of function

close_constask:; Function begin
        push    ebp                                     ; 2261 _ 55
        mov     ebp, esp                                ; 2262 _ 89. E5
        sub     esp, 24                                 ; 2264 _ 83. EC, 18
        mov     eax, dword [ebp+8H]                     ; 2267 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 226A _ 89. 04 24
        call    task_sleep                              ; 226D _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 2272 _ 8B. 45, 08
        mov     eax, dword [eax+0B8H]                   ; 2275 _ 8B. 80, 000000B8
        mov     edx, eax                                ; 227B _ 89. C2
        mov     eax, dword [memman]                     ; 227D _ A1, 00000000(d)
        mov     dword [esp+8H], 65536                   ; 2282 _ C7. 44 24, 08, 00010000
        mov     dword [esp+4H], edx                     ; 228A _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 228E _ 89. 04 24
        call    memman_free_4k                          ; 2291 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 2296 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 2299 _ 8B. 40, 10
        mov     edx, eax                                ; 229C _ 89. C2
        mov     eax, dword [memman]                     ; 229E _ A1, 00000000(d)
        mov     dword [esp+8H], 128                     ; 22A3 _ C7. 44 24, 08, 00000080
        mov     dword [esp+4H], edx                     ; 22AB _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 22AF _ 89. 04 24
        call    memman_free                             ; 22B2 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 22B7 _ 8B. 45, 08
        mov     eax, dword [eax+0ACH]                   ; 22BA _ 8B. 80, 000000AC
        mov     edx, eax                                ; 22C0 _ 89. C2
        mov     eax, dword [memman]                     ; 22C2 _ A1, 00000000(d)
        mov     dword [esp+8H], 30                      ; 22C7 _ C7. 44 24, 08, 0000001E
        mov     dword [esp+4H], edx                     ; 22CF _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 22D3 _ 89. 04 24
        call    memman_free                             ; 22D6 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 22DB _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 22DE _ C7. 40, 04, 00000000
        mov     dword [current_console_task], 0         ; 22E5 _ C7. 05, 00000278(d), 00000000
        leave                                           ; 22EF _ C9
        ret                                             ; 22F0 _ C3
; close_constask End of function

close_console:; Function begin
        push    ebp                                     ; 22F1 _ 55
        mov     ebp, esp                                ; 22F2 _ 89. E5
        sub     esp, 40                                 ; 22F4 _ 83. EC, 28
        mov     eax, dword [ebp+8H]                     ; 22F7 _ 8B. 45, 08
        mov     eax, dword [eax+0A8H]                   ; 22FA _ 8B. 80, 000000A8
        mov     dword [esp], eax                        ; 2300 _ 89. 04 24
        call    timer_free                              ; 2303 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 2308 _ 8B. 45, 08
        mov     eax, dword [eax+0B4H]                   ; 230B _ 8B. 80, 000000B4
        test    eax, eax                                ; 2311 _ 85. C0
        jz      ?_127                                   ; 2313 _ 74, 40
        mov     eax, dword [ebp+8H]                     ; 2315 _ 8B. 45, 08
        mov     eax, dword [eax+0B4H]                   ; 2318 _ 8B. 80, 000000B4
        mov     dword [ebp-0CH], eax                    ; 231E _ 89. 45, F4
        mov     eax, dword [ebp-0CH]                    ; 2321 _ 8B. 45, F4
        mov     eax, dword [eax]                        ; 2324 _ 8B. 00
        mov     edx, eax                                ; 2326 _ 89. C2
        mov     eax, dword [memman]                     ; 2328 _ A1, 00000000(d)
        mov     dword [esp+8H], 42240                   ; 232D _ C7. 44 24, 08, 0000A500
        mov     dword [esp+4H], edx                     ; 2335 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 2339 _ 89. 04 24
        call    memman_free_4k                          ; 233C _ E8, FFFFFFFC(rel)
        mov     eax, dword [shtctl]                     ; 2341 _ A1, 00000264(d)
        mov     edx, dword [ebp-0CH]                    ; 2346 _ 8B. 55, F4
        mov     dword [esp+4H], edx                     ; 2349 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 234D _ 89. 04 24
        call    sheet_free                              ; 2350 _ E8, FFFFFFFC(rel)
?_127:  mov     eax, dword [ebp+8H]                     ; 2355 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2358 _ 89. 04 24
        call    close_constask                          ; 235B _ E8, FFFFFFFC(rel)
        leave                                           ; 2360 _ C9
        ret                                             ; 2361 _ C3
; close_console End of function

cmd_exit:; Function begin
        push    ebp                                     ; 2362 _ 55
        mov     ebp, esp                                ; 2363 _ 89. E5
        sub     esp, 24                                 ; 2365 _ 83. EC, 18
        call    io_cli                                  ; 2368 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 255                     ; 236D _ C7. 44 24, 04, 000000FF
        mov     dword [esp], keyinfo                    ; 2375 _ C7. 04 24, 0000001C(d)
        call    fifo8_put                               ; 237C _ E8, FFFFFFFC(rel)
        call    io_sti                                  ; 2381 _ E8, FFFFFFFC(rel)
        leave                                           ; 2386 _ C9
        ret                                             ; 2387 _ C3
; cmd_exit End of function

kernel_api:; Function begin
        push    ebp                                     ; 2388 _ 55
        mov     ebp, esp                                ; 2389 _ 89. E5
        push    esi                                     ; 238B _ 56
        push    ebx                                     ; 238C _ 53
        sub     esp, 48                                 ; 238D _ 83. EC, 30
        call    task_now                                ; 2390 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 2395 _ 89. 45, F4
        lea     eax, [ebp+24H]                          ; 2398 _ 8D. 45, 24
        add     eax, 4                                  ; 239B _ 83. C0, 04
        mov     dword [ebp-10H], eax                    ; 239E _ 89. 45, F0
        mov     dword [ebp-14H], 0                      ; 23A1 _ C7. 45, EC, 00000000
        cmp     dword [ebp+1CH], 1                      ; 23A8 _ 83. 7D, 1C, 01
        jnz     ?_128                                   ; 23AC _ 75, 1B
        mov     eax, dword [ebp+24H]                    ; 23AE _ 8B. 45, 24
        movsx   eax, al                                 ; 23B1 _ 0F BE. C0
        mov     dword [esp+4H], 1                       ; 23B4 _ C7. 44 24, 04, 00000001
        mov     dword [esp], eax                        ; 23BC _ 89. 04 24
        call    cons_putchar                            ; 23BF _ E8, FFFFFFFC(rel)
        jmp     ?_142                                   ; 23C4 _ E9, 000003C0

?_128:  cmp     dword [ebp+1CH], 2                      ; 23C9 _ 83. 7D, 1C, 02
        jnz     ?_129                                   ; 23CD _ 75, 1D
        mov     eax, dword [ebp-0CH]                    ; 23CF _ 8B. 45, F4
        mov     eax, dword [eax+0B0H]                   ; 23D2 _ 8B. 80, 000000B0
        mov     edx, dword [eax]                        ; 23D8 _ 8B. 10
        mov     eax, dword [ebp+18H]                    ; 23DA _ 8B. 45, 18
        add     eax, edx                                ; 23DD _ 01. D0
        mov     dword [esp], eax                        ; 23DF _ 89. 04 24
        call    cons_putstr                             ; 23E2 _ E8, FFFFFFFC(rel)
        jmp     ?_142                                   ; 23E7 _ E9, 0000039D

?_129:  cmp     dword [ebp+1CH], 4                      ; 23EC _ 83. 7D, 1C, 04
        jnz     ?_130                                   ; 23F0 _ 75, 15
        mov     eax, dword [ebp-0CH]                    ; 23F2 _ 8B. 45, F4
        mov     dword [eax+34H], 0                      ; 23F5 _ C7. 40, 34, 00000000
        mov     eax, dword [ebp-0CH]                    ; 23FC _ 8B. 45, F4
        add     eax, 48                                 ; 23FF _ 83. C0, 30
        jmp     ?_143                                   ; 2402 _ E9, 00000387

?_130:  cmp     dword [ebp+1CH], 5                      ; 2407 _ 83. 7D, 1C, 05
        jne     ?_131                                   ; 240B _ 0F 85, 00000107
        mov     eax, dword [shtctl]                     ; 2411 _ A1, 00000264(d)
        mov     dword [esp], eax                        ; 2416 _ 89. 04 24
        call    sheet_alloc                             ; 2419 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-18H], eax                    ; 241E _ 89. 45, E8
        mov     eax, dword [ebp-18H]                    ; 2421 _ 8B. 45, E8
        mov     edx, dword [ebp-0CH]                    ; 2424 _ 8B. 55, F4
        mov     dword [eax+20H], edx                    ; 2427 _ 89. 50, 20
        mov     eax, dword [ebp-18H]                    ; 242A _ 8B. 45, E8
        mov     eax, dword [eax+1CH]                    ; 242D _ 8B. 40, 1C
        or      eax, 10H                                ; 2430 _ 83. C8, 10
        mov     edx, eax                                ; 2433 _ 89. C2
        mov     eax, dword [ebp-18H]                    ; 2435 _ 8B. 45, E8
        mov     dword [eax+1CH], edx                    ; 2438 _ 89. 50, 1C
        mov     eax, dword [ebp+24H]                    ; 243B _ 8B. 45, 24
        mov     edx, dword [ebp-0CH]                    ; 243E _ 8B. 55, F4
        mov     edx, dword [edx+0B0H]                   ; 2441 _ 8B. 92, 000000B0
        mov     ecx, dword [edx+4H]                     ; 2447 _ 8B. 4A, 04
        mov     edx, dword [ebp+18H]                    ; 244A _ 8B. 55, 18
        add     edx, ecx                                ; 244D _ 01. CA
        mov     dword [esp+10H], eax                    ; 244F _ 89. 44 24, 10
        mov     eax, dword [ebp+8H]                     ; 2453 _ 8B. 45, 08
        mov     dword [esp+0CH], eax                    ; 2456 _ 89. 44 24, 0C
        mov     eax, dword [ebp+0CH]                    ; 245A _ 8B. 45, 0C
        mov     dword [esp+8H], eax                     ; 245D _ 89. 44 24, 08
        mov     dword [esp+4H], edx                     ; 2461 _ 89. 54 24, 04
        mov     eax, dword [ebp-18H]                    ; 2465 _ 8B. 45, E8
        mov     dword [esp], eax                        ; 2468 _ 89. 04 24
        call    sheet_setbuf                            ; 246B _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 2470 _ 8B. 45, F4
        mov     eax, dword [eax+0B0H]                   ; 2473 _ 8B. 80, 000000B0
        mov     edx, dword [eax]                        ; 2479 _ 8B. 10
        mov     eax, dword [ebp+20H]                    ; 247B _ 8B. 45, 20
        add     edx, eax                                ; 247E _ 01. C2
        mov     eax, dword [shtctl]                     ; 2480 _ A1, 00000264(d)
        mov     dword [esp+0CH], 0                      ; 2485 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], edx                     ; 248D _ 89. 54 24, 08
        mov     edx, dword [ebp-18H]                    ; 2491 _ 8B. 55, E8
        mov     dword [esp+4H], edx                     ; 2494 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 2498 _ 89. 04 24
        call    make_window8                            ; 249B _ E8, FFFFFFFC(rel)
        mov     eax, dword [shtctl]                     ; 24A0 _ A1, 00000264(d)
        mov     eax, dword [eax+0CH]                    ; 24A5 _ 8B. 40, 0C
        sub     eax, dword [ebp+8H]                     ; 24A8 _ 2B. 45, 08
        mov     edx, eax                                ; 24AB _ 89. C2
        shr     edx, 31                                 ; 24AD _ C1. EA, 1F
        add     eax, edx                                ; 24B0 _ 01. D0
        sar     eax, 1                                  ; 24B2 _ D1. F8
        mov     ecx, eax                                ; 24B4 _ 89. C1
        mov     eax, dword [shtctl]                     ; 24B6 _ A1, 00000264(d)
        mov     eax, dword [eax+8H]                     ; 24BB _ 8B. 40, 08
        sub     eax, dword [ebp+0CH]                    ; 24BE _ 2B. 45, 0C
        mov     edx, eax                                ; 24C1 _ 89. C2
        shr     edx, 31                                 ; 24C3 _ C1. EA, 1F
        add     eax, edx                                ; 24C6 _ 01. D0
        sar     eax, 1                                  ; 24C8 _ D1. F8
        mov     edx, eax                                ; 24CA _ 89. C2
        mov     eax, dword [shtctl]                     ; 24CC _ A1, 00000264(d)
        mov     dword [esp+0CH], ecx                    ; 24D1 _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 24D5 _ 89. 54 24, 08
        mov     edx, dword [ebp-18H]                    ; 24D9 _ 8B. 55, E8
        mov     dword [esp+4H], edx                     ; 24DC _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 24E0 _ 89. 04 24
        call    sheet_slide                             ; 24E3 _ E8, FFFFFFFC(rel)
        mov     eax, dword [shtctl]                     ; 24E8 _ A1, 00000264(d)
        mov     edx, dword [eax+10H]                    ; 24ED _ 8B. 50, 10
        mov     eax, dword [shtctl]                     ; 24F0 _ A1, 00000264(d)
        mov     dword [esp+8H], edx                     ; 24F5 _ 89. 54 24, 08
        mov     edx, dword [ebp-18H]                    ; 24F9 _ 8B. 55, E8
        mov     dword [esp+4H], edx                     ; 24FC _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 2500 _ 89. 04 24
        call    sheet_updown                            ; 2503 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 2508 _ 8B. 45, F0
        lea     edx, [eax+1CH]                          ; 250B _ 8D. 50, 1C
        mov     eax, dword [ebp-18H]                    ; 250E _ 8B. 45, E8
        mov     dword [edx], eax                        ; 2511 _ 89. 02
        jmp     ?_142                                   ; 2513 _ E9, 00000271

?_131:  cmp     dword [ebp+1CH], 6                      ; 2518 _ 83. 7D, 1C, 06
        jne     ?_132                                   ; 251C _ 0F 85, 0000008C
        mov     eax, dword [ebp+18H]                    ; 2522 _ 8B. 45, 18
        mov     dword [ebp-18H], eax                    ; 2525 _ 89. 45, E8
        mov     eax, dword [ebp-0CH]                    ; 2528 _ 8B. 45, F4
        mov     eax, dword [eax+0B0H]                   ; 252B _ 8B. 80, 000000B0
        mov     edx, dword [eax+4H]                     ; 2531 _ 8B. 50, 04
        mov     eax, dword [ebp+10H]                    ; 2534 _ 8B. 45, 10
        lea     ecx, [edx+eax]                          ; 2537 _ 8D. 0C 02
        mov     eax, dword [ebp+24H]                    ; 253A _ 8B. 45, 24
        movsx   edx, al                                 ; 253D _ 0F BE. D0
        mov     eax, dword [shtctl]                     ; 2540 _ A1, 00000264(d)
        mov     dword [esp+14H], ecx                    ; 2545 _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 2549 _ 89. 54 24, 10
        mov     edx, dword [ebp+8H]                     ; 254D _ 8B. 55, 08
        mov     dword [esp+0CH], edx                    ; 2550 _ 89. 54 24, 0C
        mov     edx, dword [ebp+0CH]                    ; 2554 _ 8B. 55, 0C
        mov     dword [esp+8H], edx                     ; 2557 _ 89. 54 24, 08
        mov     edx, dword [ebp-18H]                    ; 255B _ 8B. 55, E8
        mov     dword [esp+4H], edx                     ; 255E _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 2562 _ 89. 04 24
        call    showString                              ; 2565 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 256A _ 8B. 45, 08
        lea     ecx, [eax+10H]                          ; 256D _ 8D. 48, 10
        mov     eax, dword [ebp+20H]                    ; 2570 _ 8B. 45, 20
        lea     edx, [eax*8]                            ; 2573 _ 8D. 14 C5, 00000000
        mov     eax, dword [ebp+0CH]                    ; 257A _ 8B. 45, 0C
        add     edx, eax                                ; 257D _ 01. C2
        mov     eax, dword [shtctl]                     ; 257F _ A1, 00000264(d)
        mov     dword [esp+14H], ecx                    ; 2584 _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 2588 _ 89. 54 24, 10
        mov     edx, dword [ebp+8H]                     ; 258C _ 8B. 55, 08
        mov     dword [esp+0CH], edx                    ; 258F _ 89. 54 24, 0C
        mov     edx, dword [ebp+0CH]                    ; 2593 _ 8B. 55, 0C
        mov     dword [esp+8H], edx                     ; 2596 _ 89. 54 24, 08
        mov     edx, dword [ebp-18H]                    ; 259A _ 8B. 55, E8
        mov     dword [esp+4H], edx                     ; 259D _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 25A1 _ 89. 04 24
        call    sheet_refresh                           ; 25A4 _ E8, FFFFFFFC(rel)
        jmp     ?_142                                   ; 25A9 _ E9, 000001DB

?_132:  cmp     dword [ebp+1CH], 7                      ; 25AE _ 83. 7D, 1C, 07
        jnz     ?_133                                   ; 25B2 _ 75, 7E
        mov     eax, dword [ebp+18H]                    ; 25B4 _ 8B. 45, 18
        mov     dword [ebp-18H], eax                    ; 25B7 _ 89. 45, E8
        mov     ebx, dword [ebp+24H]                    ; 25BA _ 8B. 5D, 24
        mov     eax, dword [ebp+10H]                    ; 25BD _ 8B. 45, 10
        movzx   ecx, al                                 ; 25C0 _ 0F B6. C8
        mov     eax, dword [ebp-18H]                    ; 25C3 _ 8B. 45, E8
        mov     edx, dword [eax+4H]                     ; 25C6 _ 8B. 50, 04
        mov     eax, dword [ebp-18H]                    ; 25C9 _ 8B. 45, E8
        mov     eax, dword [eax]                        ; 25CC _ 8B. 00
        mov     esi, dword [ebp+8H]                     ; 25CE _ 8B. 75, 08
        mov     dword [esp+18H], esi                    ; 25D1 _ 89. 74 24, 18
        mov     esi, dword [ebp+0CH]                    ; 25D5 _ 8B. 75, 0C
        mov     dword [esp+14H], esi                    ; 25D8 _ 89. 74 24, 14
        mov     esi, dword [ebp+20H]                    ; 25DC _ 8B. 75, 20
        mov     dword [esp+10H], esi                    ; 25DF _ 89. 74 24, 10
        mov     dword [esp+0CH], ebx                    ; 25E3 _ 89. 5C 24, 0C
        mov     dword [esp+8H], ecx                     ; 25E7 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 25EB _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 25EF _ 89. 04 24
        call    boxfill8                                ; 25F2 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 25F7 _ 8B. 45, 08
        lea     ebx, [eax+1H]                           ; 25FA _ 8D. 58, 01
        mov     eax, dword [ebp+0CH]                    ; 25FD _ 8B. 45, 0C
        lea     ecx, [eax+1H]                           ; 2600 _ 8D. 48, 01
        mov     edx, dword [ebp+24H]                    ; 2603 _ 8B. 55, 24
        mov     eax, dword [shtctl]                     ; 2606 _ A1, 00000264(d)
        mov     dword [esp+14H], ebx                    ; 260B _ 89. 5C 24, 14
        mov     dword [esp+10H], ecx                    ; 260F _ 89. 4C 24, 10
        mov     ecx, dword [ebp+20H]                    ; 2613 _ 8B. 4D, 20
        mov     dword [esp+0CH], ecx                    ; 2616 _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 261A _ 89. 54 24, 08
        mov     edx, dword [ebp-18H]                    ; 261E _ 8B. 55, E8
        mov     dword [esp+4H], edx                     ; 2621 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 2625 _ 89. 04 24
        call    sheet_refresh                           ; 2628 _ E8, FFFFFFFC(rel)
        jmp     ?_142                                   ; 262D _ E9, 00000157

?_133:  cmp     dword [ebp+1CH], 11                     ; 2632 _ 83. 7D, 1C, 0B
        jnz     ?_134                                   ; 2636 _ 75, 28
        mov     eax, dword [ebp+18H]                    ; 2638 _ 8B. 45, 18
        mov     dword [ebp-18H], eax                    ; 263B _ 89. 45, E8
        mov     eax, dword [ebp-18H]                    ; 263E _ 8B. 45, E8
        mov     edx, dword [eax]                        ; 2641 _ 8B. 10
        mov     eax, dword [ebp-18H]                    ; 2643 _ 8B. 45, E8
        mov     eax, dword [eax+4H]                     ; 2646 _ 8B. 40, 04
        imul    eax, dword [ebp+8H]                     ; 2649 _ 0F AF. 45, 08
        mov     ecx, eax                                ; 264D _ 89. C1
        mov     eax, dword [ebp+0CH]                    ; 264F _ 8B. 45, 0C
        add     eax, ecx                                ; 2652 _ 01. C8
        add     edx, eax                                ; 2654 _ 01. C2
        mov     eax, dword [ebp+24H]                    ; 2656 _ 8B. 45, 24
        mov     byte [edx], al                          ; 2659 _ 88. 02
        jmp     ?_142                                   ; 265B _ E9, 00000129

?_134:  cmp     dword [ebp+1CH], 12                     ; 2660 _ 83. 7D, 1C, 0C
        jnz     ?_135                                   ; 2664 _ 75, 3B
        mov     eax, dword [ebp+18H]                    ; 2666 _ 8B. 45, 18
        mov     dword [ebp-18H], eax                    ; 2669 _ 89. 45, E8
        mov     edx, dword [ebp+24H]                    ; 266C _ 8B. 55, 24
        mov     eax, dword [shtctl]                     ; 266F _ A1, 00000264(d)
        mov     ecx, dword [ebp+8H]                     ; 2674 _ 8B. 4D, 08
        mov     dword [esp+14H], ecx                    ; 2677 _ 89. 4C 24, 14
        mov     ecx, dword [ebp+0CH]                    ; 267B _ 8B. 4D, 0C
        mov     dword [esp+10H], ecx                    ; 267E _ 89. 4C 24, 10
        mov     ecx, dword [ebp+20H]                    ; 2682 _ 8B. 4D, 20
        mov     dword [esp+0CH], ecx                    ; 2685 _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 2689 _ 89. 54 24, 08
        mov     edx, dword [ebp-18H]                    ; 268D _ 8B. 55, E8
        mov     dword [esp+4H], edx                     ; 2690 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 2694 _ 89. 04 24
        call    sheet_refresh                           ; 2697 _ E8, FFFFFFFC(rel)
        jmp     ?_142                                   ; 269C _ E9, 000000E8

?_135:  cmp     dword [ebp+1CH], 13                     ; 26A1 _ 83. 7D, 1C, 0D
        jnz     ?_136                                   ; 26A5 _ 75, 39
        mov     eax, dword [ebp+18H]                    ; 26A7 _ 8B. 45, 18
        mov     dword [ebp-18H], eax                    ; 26AA _ 89. 45, E8
        mov     eax, dword [ebp+24H]                    ; 26AD _ 8B. 45, 24
        mov     edx, dword [ebp+10H]                    ; 26B0 _ 8B. 55, 10
        mov     dword [esp+14H], edx                    ; 26B3 _ 89. 54 24, 14
        mov     edx, dword [ebp+8H]                     ; 26B7 _ 8B. 55, 08
        mov     dword [esp+10H], edx                    ; 26BA _ 89. 54 24, 10
        mov     edx, dword [ebp+0CH]                    ; 26BE _ 8B. 55, 0C
        mov     dword [esp+0CH], edx                    ; 26C1 _ 89. 54 24, 0C
        mov     edx, dword [ebp+20H]                    ; 26C5 _ 8B. 55, 20
        mov     dword [esp+8H], edx                     ; 26C8 _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 26CC _ 89. 44 24, 04
        mov     eax, dword [ebp-18H]                    ; 26D0 _ 8B. 45, E8
        mov     dword [esp], eax                        ; 26D3 _ 89. 04 24
        call    api_linewin                             ; 26D6 _ E8, FFFFFFFC(rel)
        jmp     ?_142                                   ; 26DB _ E9, 000000A9

?_136:  cmp     dword [ebp+1CH], 14                     ; 26E0 _ 83. 7D, 1C, 0E
        jnz     ?_137                                   ; 26E4 _ 75, 19
        mov     edx, dword [ebp+18H]                    ; 26E6 _ 8B. 55, 18
        mov     eax, dword [shtctl]                     ; 26E9 _ A1, 00000264(d)
        mov     dword [esp+4H], edx                     ; 26EE _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 26F2 _ 89. 04 24
        call    sheet_free                              ; 26F5 _ E8, FFFFFFFC(rel)
        jmp     ?_142                                   ; 26FA _ E9, 0000008A

?_137:  cmp     dword [ebp+1CH], 15                     ; 26FF _ 83. 7D, 1C, 0F
        jnz     ?_138                                   ; 2703 _ 75, 1B
        mov     eax, dword [ebp+24H]                    ; 2705 _ 8B. 45, 24
        mov     edx, dword [ebp-10H]                    ; 2708 _ 8B. 55, F0
        mov     dword [esp+8H], edx                     ; 270B _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 270F _ 89. 44 24, 04
        mov     eax, dword [ebp-0CH]                    ; 2713 _ 8B. 45, F4
        mov     dword [esp], eax                        ; 2716 _ 89. 04 24
        call    handle_keyboard                         ; 2719 _ E8, FFFFFFFC(rel)
        jmp     ?_142                                   ; 271E _ EB, 69

?_138:  cmp     dword [ebp+1CH], 16                     ; 2720 _ 83. 7D, 1C, 10
        jnz     ?_139                                   ; 2724 _ 75, 0F
        mov     eax, dword [ebp-10H]                    ; 2726 _ 8B. 45, F0
        lea     ebx, [eax+1CH]                          ; 2729 _ 8D. 58, 1C
        call    timer_alloc                             ; 272C _ E8, FFFFFFFC(rel)
        mov     dword [ebx], eax                        ; 2731 _ 89. 03
        jmp     ?_142                                   ; 2733 _ EB, 54

?_139:  cmp     dword [ebp+1CH], 17                     ; 2735 _ 83. 7D, 1C, 11
        jnz     ?_140                                   ; 2739 _ 75, 21
        mov     eax, dword [ebp+24H]                    ; 273B _ 8B. 45, 24
        movzx   edx, al                                 ; 273E _ 0F B6. D0
        mov     eax, dword [ebp-0CH]                    ; 2741 _ 8B. 45, F4
        lea     ecx, [eax+10H]                          ; 2744 _ 8D. 48, 10
        mov     eax, dword [ebp+18H]                    ; 2747 _ 8B. 45, 18
        mov     dword [esp+8H], edx                     ; 274A _ 89. 54 24, 08
        mov     dword [esp+4H], ecx                     ; 274E _ 89. 4C 24, 04
        mov     dword [esp], eax                        ; 2752 _ 89. 04 24
        call    timer_init                              ; 2755 _ E8, FFFFFFFC(rel)
        jmp     ?_142                                   ; 275A _ EB, 2D

?_140:  cmp     dword [ebp+1CH], 18                     ; 275C _ 83. 7D, 1C, 12
        jnz     ?_141                                   ; 2760 _ 75, 16
        mov     eax, dword [ebp+24H]                    ; 2762 _ 8B. 45, 24
        mov     edx, eax                                ; 2765 _ 89. C2
        mov     eax, dword [ebp+18H]                    ; 2767 _ 8B. 45, 18
        mov     dword [esp+4H], edx                     ; 276A _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 276E _ 89. 04 24
        call    timer_settime                           ; 2771 _ E8, FFFFFFFC(rel)
        jmp     ?_142                                   ; 2776 _ EB, 11

?_141:  cmp     dword [ebp+1CH], 19                     ; 2778 _ 83. 7D, 1C, 13
        jnz     ?_142                                   ; 277C _ 75, 0B
        mov     eax, dword [ebp+18H]                    ; 277E _ 8B. 45, 18
        mov     dword [esp], eax                        ; 2781 _ 89. 04 24
        call    timer_free                              ; 2784 _ E8, FFFFFFFC(rel)
?_142:  mov     eax, 0                                  ; 2789 _ B8, 00000000
?_143:  add     esp, 48                                 ; 278E _ 83. C4, 30
        pop     ebx                                     ; 2791 _ 5B
        pop     esi                                     ; 2792 _ 5E
        pop     ebp                                     ; 2793 _ 5D
        ret                                             ; 2794 _ C3
; kernel_api End of function

cons_putchar:; Function begin
        push    ebp                                     ; 2795 _ 55
        mov     ebp, esp                                ; 2796 _ 89. E5
        push    esi                                     ; 2798 _ 56
        push    ebx                                     ; 2799 _ 53
        sub     esp, 48                                 ; 279A _ 83. EC, 30
        mov     edx, dword [ebp+8H]                     ; 279D _ 8B. 55, 08
        mov     eax, dword [ebp+0CH]                    ; 27A0 _ 8B. 45, 0C
        mov     byte [ebp-1CH], dl                      ; 27A3 _ 88. 55, E4
        mov     byte [ebp-20H], al                      ; 27A6 _ 88. 45, E0
        call    task_now                                ; 27A9 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 27AE _ 89. 45, F4
        mov     eax, dword [ebp-0CH]                    ; 27B1 _ 8B. 45, F4
        mov     ebx, dword [eax+9CH]                    ; 27B4 _ 8B. 98, 0000009C
        mov     eax, dword [ebp-0CH]                    ; 27BA _ 8B. 45, F4
        mov     ecx, dword [eax+98H]                    ; 27BD _ 8B. 88, 00000098
        mov     eax, dword [ebp-0CH]                    ; 27C3 _ 8B. 45, F4
        mov     edx, dword [eax+94H]                    ; 27C6 _ 8B. 90, 00000094
        mov     eax, dword [shtctl]                     ; 27CC _ A1, 00000264(d)
        mov     dword [esp+10H], 0                      ; 27D1 _ C7. 44 24, 10, 00000000
        mov     dword [esp+0CH], ebx                    ; 27D9 _ 89. 5C 24, 0C
        mov     dword [esp+8H], ecx                     ; 27DD _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 27E1 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 27E5 _ 89. 04 24
        call    set_cursor                              ; 27E8 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 27ED _ 8B. 45, F4
        movzx   edx, byte [ebp-1CH]                     ; 27F0 _ 0F B6. 55, E4
        mov     byte [eax+0A4H], dl                     ; 27F4 _ 88. 90, 000000A4
        mov     eax, dword [ebp-0CH]                    ; 27FA _ 8B. 45, F4
        mov     byte [eax+0A5H], 0                      ; 27FD _ C6. 80, 000000A5, 00
        mov     eax, dword [ebp-0CH]                    ; 2804 _ 8B. 45, F4
        lea     esi, [eax+0A4H]                         ; 2807 _ 8D. B0, 000000A4
        mov     eax, dword [ebp-0CH]                    ; 280D _ 8B. 45, F4
        mov     ebx, dword [eax+9CH]                    ; 2810 _ 8B. 98, 0000009C
        mov     eax, dword [ebp-0CH]                    ; 2816 _ 8B. 45, F4
        mov     ecx, dword [eax+98H]                    ; 2819 _ 8B. 88, 00000098
        mov     eax, dword [ebp-0CH]                    ; 281F _ 8B. 45, F4
        mov     edx, dword [eax+94H]                    ; 2822 _ 8B. 90, 00000094
        mov     eax, dword [shtctl]                     ; 2828 _ A1, 00000264(d)
        mov     dword [esp+14H], esi                    ; 282D _ 89. 74 24, 14
        mov     dword [esp+10H], 7                      ; 2831 _ C7. 44 24, 10, 00000007
        mov     dword [esp+0CH], ebx                    ; 2839 _ 89. 5C 24, 0C
        mov     dword [esp+8H], ecx                     ; 283D _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 2841 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 2845 _ 89. 04 24
        call    showString                              ; 2848 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 284D _ 8B. 45, F4
        mov     eax, dword [eax+98H]                    ; 2850 _ 8B. 80, 00000098
        lea     edx, [eax+8H]                           ; 2856 _ 8D. 50, 08
        mov     eax, dword [ebp-0CH]                    ; 2859 _ 8B. 45, F4
        mov     dword [eax+98H], edx                    ; 285C _ 89. 90, 00000098
        add     esp, 48                                 ; 2862 _ 83. C4, 30
        pop     ebx                                     ; 2865 _ 5B
        pop     esi                                     ; 2866 _ 5E
        pop     ebp                                     ; 2867 _ 5D
        ret                                             ; 2868 _ C3
; cons_putchar End of function

cons_newline:; Function begin
        push    ebp                                     ; 2869 _ 55
        mov     ebp, esp                                ; 286A _ 89. E5
        push    ebx                                     ; 286C _ 53
        sub     esp, 52                                 ; 286D _ 83. EC, 34
        cmp     dword [ebp+0CH], 0                      ; 2870 _ 83. 7D, 0C, 00
        jnz     ?_144                                   ; 2874 _ 75, 06
        nop                                             ; 2876 _ 90
        jmp     ?_155                                   ; 2877 _ E9, 00000127

?_144:  cmp     dword [ebp+8H], 139                     ; 287C _ 81. 7D, 08, 0000008B
        jg      ?_145                                   ; 2883 _ 7F, 09
        add     dword [ebp+8H], 16                      ; 2885 _ 83. 45, 08, 10
        jmp     ?_154                                   ; 2889 _ E9, 000000DF

?_145:  mov     dword [ebp-10H], 28                     ; 288E _ C7. 45, F0, 0000001C
        jmp     ?_149                                   ; 2895 _ EB, 52

?_146:  mov     dword [ebp-0CH], 8                      ; 2897 _ C7. 45, F4, 00000008
        jmp     ?_148                                   ; 289E _ EB, 3C

?_147:  mov     eax, dword [ebp+0CH]                    ; 28A0 _ 8B. 45, 0C
        mov     edx, dword [eax]                        ; 28A3 _ 8B. 10
        mov     eax, dword [ebp+0CH]                    ; 28A5 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 28A8 _ 8B. 40, 04
        imul    eax, dword [ebp-10H]                    ; 28AB _ 0F AF. 45, F0
        mov     ecx, eax                                ; 28AF _ 89. C1
        mov     eax, dword [ebp-0CH]                    ; 28B1 _ 8B. 45, F4
        add     eax, ecx                                ; 28B4 _ 01. C8
        add     edx, eax                                ; 28B6 _ 01. C2
        mov     eax, dword [ebp+0CH]                    ; 28B8 _ 8B. 45, 0C
        mov     ecx, dword [eax]                        ; 28BB _ 8B. 08
        mov     eax, dword [ebp-10H]                    ; 28BD _ 8B. 45, F0
        lea     ebx, [eax+10H]                          ; 28C0 _ 8D. 58, 10
        mov     eax, dword [ebp+0CH]                    ; 28C3 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 28C6 _ 8B. 40, 04
        imul    ebx, eax                                ; 28C9 _ 0F AF. D8
        mov     eax, dword [ebp-0CH]                    ; 28CC _ 8B. 45, F4
        add     eax, ebx                                ; 28CF _ 01. D8
        add     eax, ecx                                ; 28D1 _ 01. C8
        movzx   eax, byte [eax]                         ; 28D3 _ 0F B6. 00
        mov     byte [edx], al                          ; 28D6 _ 88. 02
        add     dword [ebp-0CH], 1                      ; 28D8 _ 83. 45, F4, 01
?_148:  cmp     dword [ebp-0CH], 247                    ; 28DC _ 81. 7D, F4, 000000F7
        jle     ?_147                                   ; 28E3 _ 7E, BB
        add     dword [ebp-10H], 1                      ; 28E5 _ 83. 45, F0, 01
?_149:  cmp     dword [ebp-10H], 139                    ; 28E9 _ 81. 7D, F0, 0000008B
        jle     ?_146                                   ; 28F0 _ 7E, A5
        mov     dword [ebp-10H], 140                    ; 28F2 _ C7. 45, F0, 0000008C
        jmp     ?_153                                   ; 28F9 _ EB, 35

?_150:  mov     dword [ebp-0CH], 8                      ; 28FB _ C7. 45, F4, 00000008
        jmp     ?_152                                   ; 2902 _ EB, 1F

?_151:  mov     eax, dword [ebp+0CH]                    ; 2904 _ 8B. 45, 0C
        mov     edx, dword [eax]                        ; 2907 _ 8B. 10
        mov     eax, dword [ebp+0CH]                    ; 2909 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 290C _ 8B. 40, 04
        imul    eax, dword [ebp-10H]                    ; 290F _ 0F AF. 45, F0
        mov     ecx, eax                                ; 2913 _ 89. C1
        mov     eax, dword [ebp-0CH]                    ; 2915 _ 8B. 45, F4
        add     eax, ecx                                ; 2918 _ 01. C8
        add     eax, edx                                ; 291A _ 01. D0
        mov     byte [eax], 0                           ; 291C _ C6. 00, 00
        add     dword [ebp-0CH], 1                      ; 291F _ 83. 45, F4, 01
?_152:  cmp     dword [ebp-0CH], 247                    ; 2923 _ 81. 7D, F4, 000000F7
        jle     ?_151                                   ; 292A _ 7E, D8
        add     dword [ebp-10H], 1                      ; 292C _ 83. 45, F0, 01
?_153:  cmp     dword [ebp-10H], 155                    ; 2930 _ 81. 7D, F0, 0000009B
        jle     ?_150                                   ; 2937 _ 7E, C2
        mov     eax, dword [shtctl]                     ; 2939 _ A1, 00000264(d)
        mov     dword [esp+14H], 156                    ; 293E _ C7. 44 24, 14, 0000009C
        mov     dword [esp+10H], 248                    ; 2946 _ C7. 44 24, 10, 000000F8
        mov     dword [esp+0CH], 28                     ; 294E _ C7. 44 24, 0C, 0000001C
        mov     dword [esp+8H], 8                       ; 2956 _ C7. 44 24, 08, 00000008
        mov     edx, dword [ebp+0CH]                    ; 295E _ 8B. 55, 0C
        mov     dword [esp+4H], edx                     ; 2961 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 2965 _ 89. 04 24
        call    sheet_refresh                           ; 2968 _ E8, FFFFFFFC(rel)
?_154:  mov     eax, dword [shtctl]                     ; 296D _ A1, 00000264(d)
        mov     dword [esp+14H], ?_395                  ; 2972 _ C7. 44 24, 14, 00000023(d)
        mov     dword [esp+10H], 7                      ; 297A _ C7. 44 24, 10, 00000007
        mov     edx, dword [ebp+8H]                     ; 2982 _ 8B. 55, 08
        mov     dword [esp+0CH], edx                    ; 2985 _ 89. 54 24, 0C
        mov     dword [esp+8H], 8                       ; 2989 _ C7. 44 24, 08, 00000008
        mov     edx, dword [ebp+0CH]                    ; 2991 _ 8B. 55, 0C
        mov     dword [esp+4H], edx                     ; 2994 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 2998 _ 89. 04 24
        call    showString                              ; 299B _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 29A0 _ 8B. 45, 08
?_155:  add     esp, 52                                 ; 29A3 _ 83. C4, 34
        pop     ebx                                     ; 29A6 _ 5B
        pop     ebp                                     ; 29A7 _ 5D
        ret                                             ; 29A8 _ C3
; cons_newline End of function

init_screen8:; Function begin
        push    ebp                                     ; 29A9 _ 55
        mov     ebp, esp                                ; 29AA _ 89. E5
        push    ebx                                     ; 29AC _ 53
        sub     esp, 36                                 ; 29AD _ 83. EC, 24
        mov     eax, dword [ebp+10H]                    ; 29B0 _ 8B. 45, 10
        lea     edx, [eax-1DH]                          ; 29B3 _ 8D. 50, E3
        mov     eax, dword [ebp+0CH]                    ; 29B6 _ 8B. 45, 0C
        sub     eax, 1                                  ; 29B9 _ 83. E8, 01
        mov     dword [esp+18H], edx                    ; 29BC _ 89. 54 24, 18
        mov     dword [esp+14H], eax                    ; 29C0 _ 89. 44 24, 14
        mov     dword [esp+10H], 0                      ; 29C4 _ C7. 44 24, 10, 00000000
        mov     dword [esp+0CH], 0                      ; 29CC _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 2                       ; 29D4 _ C7. 44 24, 08, 00000002
        mov     eax, dword [ebp+0CH]                    ; 29DC _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 29DF _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 29E3 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 29E6 _ 89. 04 24
        call    boxfill8                                ; 29E9 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 29EE _ 8B. 45, 10
        lea     ecx, [eax-1CH]                          ; 29F1 _ 8D. 48, E4
        mov     eax, dword [ebp+0CH]                    ; 29F4 _ 8B. 45, 0C
        lea     edx, [eax-1H]                           ; 29F7 _ 8D. 50, FF
        mov     eax, dword [ebp+10H]                    ; 29FA _ 8B. 45, 10
        sub     eax, 28                                 ; 29FD _ 83. E8, 1C
        mov     dword [esp+18H], ecx                    ; 2A00 _ 89. 4C 24, 18
        mov     dword [esp+14H], edx                    ; 2A04 _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 2A08 _ 89. 44 24, 10
        mov     dword [esp+0CH], 0                      ; 2A0C _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 8                       ; 2A14 _ C7. 44 24, 08, 00000008
        mov     eax, dword [ebp+0CH]                    ; 2A1C _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 2A1F _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2A23 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2A26 _ 89. 04 24
        call    boxfill8                                ; 2A29 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 2A2E _ 8B. 45, 10
        lea     ecx, [eax-1BH]                          ; 2A31 _ 8D. 48, E5
        mov     eax, dword [ebp+0CH]                    ; 2A34 _ 8B. 45, 0C
        lea     edx, [eax-1H]                           ; 2A37 _ 8D. 50, FF
        mov     eax, dword [ebp+10H]                    ; 2A3A _ 8B. 45, 10
        sub     eax, 27                                 ; 2A3D _ 83. E8, 1B
        mov     dword [esp+18H], ecx                    ; 2A40 _ 89. 4C 24, 18
        mov     dword [esp+14H], edx                    ; 2A44 _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 2A48 _ 89. 44 24, 10
        mov     dword [esp+0CH], 0                      ; 2A4C _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 7                       ; 2A54 _ C7. 44 24, 08, 00000007
        mov     eax, dword [ebp+0CH]                    ; 2A5C _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 2A5F _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2A63 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2A66 _ 89. 04 24
        call    boxfill8                                ; 2A69 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 2A6E _ 8B. 45, 10
        lea     ecx, [eax-1H]                           ; 2A71 _ 8D. 48, FF
        mov     eax, dword [ebp+0CH]                    ; 2A74 _ 8B. 45, 0C
        lea     edx, [eax-1H]                           ; 2A77 _ 8D. 50, FF
        mov     eax, dword [ebp+10H]                    ; 2A7A _ 8B. 45, 10
        sub     eax, 26                                 ; 2A7D _ 83. E8, 1A
        mov     dword [esp+18H], ecx                    ; 2A80 _ 89. 4C 24, 18
        mov     dword [esp+14H], edx                    ; 2A84 _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 2A88 _ 89. 44 24, 10
        mov     dword [esp+0CH], 0                      ; 2A8C _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 8                       ; 2A94 _ C7. 44 24, 08, 00000008
        mov     eax, dword [ebp+0CH]                    ; 2A9C _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 2A9F _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2AA3 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2AA6 _ 89. 04 24
        call    boxfill8                                ; 2AA9 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 2AAE _ 8B. 45, 10
        lea     edx, [eax-18H]                          ; 2AB1 _ 8D. 50, E8
        mov     eax, dword [ebp+10H]                    ; 2AB4 _ 8B. 45, 10
        sub     eax, 24                                 ; 2AB7 _ 83. E8, 18
        mov     dword [esp+18H], edx                    ; 2ABA _ 89. 54 24, 18
        mov     dword [esp+14H], 59                     ; 2ABE _ C7. 44 24, 14, 0000003B
        mov     dword [esp+10H], eax                    ; 2AC6 _ 89. 44 24, 10
        mov     dword [esp+0CH], 3                      ; 2ACA _ C7. 44 24, 0C, 00000003
        mov     dword [esp+8H], 7                       ; 2AD2 _ C7. 44 24, 08, 00000007
        mov     eax, dword [ebp+0CH]                    ; 2ADA _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 2ADD _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2AE1 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2AE4 _ 89. 04 24
        call    boxfill8                                ; 2AE7 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 2AEC _ 8B. 45, 10
        lea     edx, [eax-4H]                           ; 2AEF _ 8D. 50, FC
        mov     eax, dword [ebp+10H]                    ; 2AF2 _ 8B. 45, 10
        sub     eax, 24                                 ; 2AF5 _ 83. E8, 18
        mov     dword [esp+18H], edx                    ; 2AF8 _ 89. 54 24, 18
        mov     dword [esp+14H], 2                      ; 2AFC _ C7. 44 24, 14, 00000002
        mov     dword [esp+10H], eax                    ; 2B04 _ 89. 44 24, 10
        mov     dword [esp+0CH], 2                      ; 2B08 _ C7. 44 24, 0C, 00000002
        mov     dword [esp+8H], 7                       ; 2B10 _ C7. 44 24, 08, 00000007
        mov     eax, dword [ebp+0CH]                    ; 2B18 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 2B1B _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2B1F _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2B22 _ 89. 04 24
        call    boxfill8                                ; 2B25 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 2B2A _ 8B. 45, 10
        lea     edx, [eax-4H]                           ; 2B2D _ 8D. 50, FC
        mov     eax, dword [ebp+10H]                    ; 2B30 _ 8B. 45, 10
        sub     eax, 4                                  ; 2B33 _ 83. E8, 04
        mov     dword [esp+18H], edx                    ; 2B36 _ 89. 54 24, 18
        mov     dword [esp+14H], 59                     ; 2B3A _ C7. 44 24, 14, 0000003B
        mov     dword [esp+10H], eax                    ; 2B42 _ 89. 44 24, 10
        mov     dword [esp+0CH], 3                      ; 2B46 _ C7. 44 24, 0C, 00000003
        mov     dword [esp+8H], 2                       ; 2B4E _ C7. 44 24, 08, 00000002
        mov     eax, dword [ebp+0CH]                    ; 2B56 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 2B59 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2B5D _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2B60 _ 89. 04 24
        call    boxfill8                                ; 2B63 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 2B68 _ 8B. 45, 10
        lea     edx, [eax-5H]                           ; 2B6B _ 8D. 50, FB
        mov     eax, dword [ebp+10H]                    ; 2B6E _ 8B. 45, 10
        sub     eax, 23                                 ; 2B71 _ 83. E8, 17
        mov     dword [esp+18H], edx                    ; 2B74 _ 89. 54 24, 18
        mov     dword [esp+14H], 59                     ; 2B78 _ C7. 44 24, 14, 0000003B
        mov     dword [esp+10H], eax                    ; 2B80 _ 89. 44 24, 10
        mov     dword [esp+0CH], 59                     ; 2B84 _ C7. 44 24, 0C, 0000003B
        mov     dword [esp+8H], 2                       ; 2B8C _ C7. 44 24, 08, 00000002
        mov     eax, dword [ebp+0CH]                    ; 2B94 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 2B97 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2B9B _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2B9E _ 89. 04 24
        call    boxfill8                                ; 2BA1 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 2BA6 _ 8B. 45, 10
        lea     edx, [eax-3H]                           ; 2BA9 _ 8D. 50, FD
        mov     eax, dword [ebp+10H]                    ; 2BAC _ 8B. 45, 10
        sub     eax, 3                                  ; 2BAF _ 83. E8, 03
        mov     dword [esp+18H], edx                    ; 2BB2 _ 89. 54 24, 18
        mov     dword [esp+14H], 59                     ; 2BB6 _ C7. 44 24, 14, 0000003B
        mov     dword [esp+10H], eax                    ; 2BBE _ 89. 44 24, 10
        mov     dword [esp+0CH], 2                      ; 2BC2 _ C7. 44 24, 0C, 00000002
        mov     dword [esp+8H], 0                       ; 2BCA _ C7. 44 24, 08, 00000000
        mov     eax, dword [ebp+0CH]                    ; 2BD2 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 2BD5 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2BD9 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2BDC _ 89. 04 24
        call    boxfill8                                ; 2BDF _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 2BE4 _ 8B. 45, 10
        lea     edx, [eax-3H]                           ; 2BE7 _ 8D. 50, FD
        mov     eax, dword [ebp+10H]                    ; 2BEA _ 8B. 45, 10
        sub     eax, 24                                 ; 2BED _ 83. E8, 18
        mov     dword [esp+18H], edx                    ; 2BF0 _ 89. 54 24, 18
        mov     dword [esp+14H], 60                     ; 2BF4 _ C7. 44 24, 14, 0000003C
        mov     dword [esp+10H], eax                    ; 2BFC _ 89. 44 24, 10
        mov     dword [esp+0CH], 60                     ; 2C00 _ C7. 44 24, 0C, 0000003C
        mov     dword [esp+8H], 0                       ; 2C08 _ C7. 44 24, 08, 00000000
        mov     eax, dword [ebp+0CH]                    ; 2C10 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 2C13 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2C17 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2C1A _ 89. 04 24
        call    boxfill8                                ; 2C1D _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 2C22 _ 8B. 45, 10
        lea     ebx, [eax-18H]                          ; 2C25 _ 8D. 58, E8
        mov     eax, dword [ebp+0CH]                    ; 2C28 _ 8B. 45, 0C
        lea     ecx, [eax-4H]                           ; 2C2B _ 8D. 48, FC
        mov     eax, dword [ebp+10H]                    ; 2C2E _ 8B. 45, 10
        lea     edx, [eax-18H]                          ; 2C31 _ 8D. 50, E8
        mov     eax, dword [ebp+0CH]                    ; 2C34 _ 8B. 45, 0C
        sub     eax, 47                                 ; 2C37 _ 83. E8, 2F
        mov     dword [esp+18H], ebx                    ; 2C3A _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 2C3E _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 2C42 _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 2C46 _ 89. 44 24, 0C
        mov     dword [esp+8H], 2                       ; 2C4A _ C7. 44 24, 08, 00000002
        mov     eax, dword [ebp+0CH]                    ; 2C52 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 2C55 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2C59 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2C5C _ 89. 04 24
        call    boxfill8                                ; 2C5F _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 2C64 _ 8B. 45, 10
        lea     ebx, [eax-4H]                           ; 2C67 _ 8D. 58, FC
        mov     eax, dword [ebp+0CH]                    ; 2C6A _ 8B. 45, 0C
        lea     ecx, [eax-2FH]                          ; 2C6D _ 8D. 48, D1
        mov     eax, dword [ebp+10H]                    ; 2C70 _ 8B. 45, 10
        lea     edx, [eax-17H]                          ; 2C73 _ 8D. 50, E9
        mov     eax, dword [ebp+0CH]                    ; 2C76 _ 8B. 45, 0C
        sub     eax, 47                                 ; 2C79 _ 83. E8, 2F
        mov     dword [esp+18H], ebx                    ; 2C7C _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 2C80 _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 2C84 _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 2C88 _ 89. 44 24, 0C
        mov     dword [esp+8H], 2                       ; 2C8C _ C7. 44 24, 08, 00000002
        mov     eax, dword [ebp+0CH]                    ; 2C94 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 2C97 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2C9B _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2C9E _ 89. 04 24
        call    boxfill8                                ; 2CA1 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 2CA6 _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 2CA9 _ 8D. 58, FD
        mov     eax, dword [ebp+0CH]                    ; 2CAC _ 8B. 45, 0C
        lea     ecx, [eax-4H]                           ; 2CAF _ 8D. 48, FC
        mov     eax, dword [ebp+10H]                    ; 2CB2 _ 8B. 45, 10
        lea     edx, [eax-3H]                           ; 2CB5 _ 8D. 50, FD
        mov     eax, dword [ebp+0CH]                    ; 2CB8 _ 8B. 45, 0C
        sub     eax, 47                                 ; 2CBB _ 83. E8, 2F
        mov     dword [esp+18H], ebx                    ; 2CBE _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 2CC2 _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 2CC6 _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 2CCA _ 89. 44 24, 0C
        mov     dword [esp+8H], 7                       ; 2CCE _ C7. 44 24, 08, 00000007
        mov     eax, dword [ebp+0CH]                    ; 2CD6 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 2CD9 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2CDD _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2CE0 _ 89. 04 24
        call    boxfill8                                ; 2CE3 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 2CE8 _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 2CEB _ 8D. 58, FD
        mov     eax, dword [ebp+0CH]                    ; 2CEE _ 8B. 45, 0C
        lea     ecx, [eax-3H]                           ; 2CF1 _ 8D. 48, FD
        mov     eax, dword [ebp+10H]                    ; 2CF4 _ 8B. 45, 10
        lea     edx, [eax-18H]                          ; 2CF7 _ 8D. 50, E8
        mov     eax, dword [ebp+0CH]                    ; 2CFA _ 8B. 45, 0C
        sub     eax, 3                                  ; 2CFD _ 83. E8, 03
        mov     dword [esp+18H], ebx                    ; 2D00 _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 2D04 _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 2D08 _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 2D0C _ 89. 44 24, 0C
        mov     dword [esp+8H], 7                       ; 2D10 _ C7. 44 24, 08, 00000007
        mov     eax, dword [ebp+0CH]                    ; 2D18 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 2D1B _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2D1F _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2D22 _ 89. 04 24
        call    boxfill8                                ; 2D25 _ E8, FFFFFFFC(rel)
        add     esp, 36                                 ; 2D2A _ 83. C4, 24
        pop     ebx                                     ; 2D2D _ 5B
        pop     ebp                                     ; 2D2E _ 5D
        ret                                             ; 2D2F _ C3
; init_screen8 End of function

computeMousePosition:; Function begin
        push    ebp                                     ; 2D30 _ 55
        mov     ebp, esp                                ; 2D31 _ 89. E5
        mov     eax, dword [ebp+10H]                    ; 2D33 _ 8B. 45, 10
        mov     edx, dword [eax+4H]                     ; 2D36 _ 8B. 50, 04
        mov     eax, dword [mx]                         ; 2D39 _ A1, 00000134(d)
        add     eax, edx                                ; 2D3E _ 01. D0
        mov     dword [mx], eax                         ; 2D40 _ A3, 00000134(d)
        mov     eax, dword [ebp+10H]                    ; 2D45 _ 8B. 45, 10
        mov     edx, dword [eax+8H]                     ; 2D48 _ 8B. 50, 08
        mov     eax, dword [my]                         ; 2D4B _ A1, 00000138(d)
        add     eax, edx                                ; 2D50 _ 01. D0
        mov     dword [my], eax                         ; 2D52 _ A3, 00000138(d)
        mov     eax, dword [mx]                         ; 2D57 _ A1, 00000134(d)
        test    eax, eax                                ; 2D5C _ 85. C0
        jns     ?_156                                   ; 2D5E _ 79, 0A
        mov     dword [mx], 0                           ; 2D60 _ C7. 05, 00000134(d), 00000000
?_156:  mov     eax, dword [my]                         ; 2D6A _ A1, 00000138(d)
        test    eax, eax                                ; 2D6F _ 85. C0
        jns     ?_157                                   ; 2D71 _ 79, 0A
        mov     dword [my], 0                           ; 2D73 _ C7. 05, 00000138(d), 00000000
?_157:  mov     eax, dword [xsize]                      ; 2D7D _ A1, 0000013C(d)
        lea     edx, [eax-1H]                           ; 2D82 _ 8D. 50, FF
        mov     eax, dword [mx]                         ; 2D85 _ A1, 00000134(d)
        cmp     edx, eax                                ; 2D8A _ 39. C2
        jge     ?_158                                   ; 2D8C _ 7D, 0D
        mov     eax, dword [xsize]                      ; 2D8E _ A1, 0000013C(d)
        sub     eax, 1                                  ; 2D93 _ 83. E8, 01
        mov     dword [mx], eax                         ; 2D96 _ A3, 00000134(d)
?_158:  mov     eax, dword [ysize]                      ; 2D9B _ A1, 00000140(d)
        lea     edx, [eax-1H]                           ; 2DA0 _ 8D. 50, FF
        mov     eax, dword [my]                         ; 2DA3 _ A1, 00000138(d)
        cmp     edx, eax                                ; 2DA8 _ 39. C2
        jge     ?_159                                   ; 2DAA _ 7D, 0D
        mov     eax, dword [ysize]                      ; 2DAC _ A1, 00000140(d)
        sub     eax, 1                                  ; 2DB1 _ 83. E8, 01
        mov     dword [my], eax                         ; 2DB4 _ A3, 00000138(d)
?_159:  pop     ebp                                     ; 2DB9 _ 5D
        ret                                             ; 2DBA _ C3
; computeMousePosition End of function

show_mouse_info:; Function begin
        push    ebp                                     ; 2DBB _ 55
        mov     ebp, esp                                ; 2DBC _ 89. E5
        sub     esp, 72                                 ; 2DBE _ 83. EC, 48
        mov     eax, dword [buf_back]                   ; 2DC1 _ A1, 00000144(d)
        mov     dword [ebp-10H], eax                    ; 2DC6 _ 89. 45, F0
        mov     byte [ebp-11H], 0                       ; 2DC9 _ C6. 45, EF, 00
        mov     dword [ebp-18H], 0                      ; 2DCD _ C7. 45, E8, 00000000
        call    io_sti                                  ; 2DD4 _ E8, FFFFFFFC(rel)
        mov     dword [esp], mouseinfo                  ; 2DD9 _ C7. 04 24, 00000038(d)
        call    fifo8_get                               ; 2DE0 _ E8, FFFFFFFC(rel)
        mov     byte [ebp-11H], al                      ; 2DE5 _ 88. 45, EF
        movzx   eax, byte [ebp-11H]                     ; 2DE8 _ 0F B6. 45, EF
        mov     dword [esp+4H], eax                     ; 2DEC _ 89. 44 24, 04
        mov     dword [esp], mdec                       ; 2DF0 _ C7. 04 24, 00000100(d)
        call    mouse_decode                            ; 2DF7 _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 2DFC _ 85. C0
        je      ?_171                                   ; 2DFE _ 0F 84, 0000035F
        mov     dword [esp+8H], mdec                    ; 2E04 _ C7. 44 24, 08, 00000100(d)
        mov     eax, dword [ebp+0CH]                    ; 2E0C _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 2E0F _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2E13 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2E16 _ 89. 04 24
        call    computeMousePosition                    ; 2E19 _ E8, FFFFFFFC(rel)
        mov     edx, dword [my]                         ; 2E1E _ 8B. 15, 00000138(d)
        mov     eax, dword [mx]                         ; 2E24 _ A1, 00000134(d)
        mov     dword [esp+0CH], edx                    ; 2E29 _ 89. 54 24, 0C
        mov     dword [esp+8H], eax                     ; 2E2D _ 89. 44 24, 08
        mov     eax, dword [ebp+10H]                    ; 2E31 _ 8B. 45, 10
        mov     dword [esp+4H], eax                     ; 2E34 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2E38 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2E3B _ 89. 04 24
        call    sheet_slide                             ; 2E3E _ E8, FFFFFFFC(rel)
        mov     eax, dword [?_420]                      ; 2E43 _ A1, 0000010C(d)
        and     eax, 01H                                ; 2E48 _ 83. E0, 01
        test    eax, eax                                ; 2E4B _ 85. C0
        je      ?_170                                   ; 2E4D _ 0F 84, 00000306
        mov     eax, dword [mmx]                        ; 2E53 _ A1, 00000118(d)
        test    eax, eax                                ; 2E58 _ 85. C0
        jns     ?_169                                   ; 2E5A _ 0F 89, 00000288
        mov     eax, dword [ebp+8H]                     ; 2E60 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 2E63 _ 8B. 40, 10
        sub     eax, 1                                  ; 2E66 _ 83. E8, 01
        mov     dword [ebp-0CH], eax                    ; 2E69 _ 89. 45, F4
        jmp     ?_167                                   ; 2E6C _ E9, 00000269

?_160:  mov     eax, dword [ebp+8H]                     ; 2E71 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 2E74 _ 8B. 55, F4
        add     edx, 4                                  ; 2E77 _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 2E7A _ 8B. 44 90, 04
        mov     dword [ebp-18H], eax                    ; 2E7E _ 89. 45, E8
        mov     edx, dword [mx]                         ; 2E81 _ 8B. 15, 00000134(d)
        mov     eax, dword [ebp-18H]                    ; 2E87 _ 8B. 45, E8
        mov     eax, dword [eax+0CH]                    ; 2E8A _ 8B. 40, 0C
        sub     edx, eax                                ; 2E8D _ 29. C2
        mov     eax, edx                                ; 2E8F _ 89. D0
        mov     dword [ebp-1CH], eax                    ; 2E91 _ 89. 45, E4
        mov     edx, dword [my]                         ; 2E94 _ 8B. 15, 00000138(d)
        mov     eax, dword [ebp-18H]                    ; 2E9A _ 8B. 45, E8
        mov     eax, dword [eax+10H]                    ; 2E9D _ 8B. 40, 10
        sub     edx, eax                                ; 2EA0 _ 29. C2
        mov     eax, edx                                ; 2EA2 _ 89. D0
        mov     dword [ebp-20H], eax                    ; 2EA4 _ 89. 45, E0
        cmp     dword [ebp-1CH], 0                      ; 2EA7 _ 83. 7D, E4, 00
        js      ?_166                                   ; 2EAB _ 0F 88, 00000225
        mov     eax, dword [ebp-18H]                    ; 2EB1 _ 8B. 45, E8
        mov     eax, dword [eax+4H]                     ; 2EB4 _ 8B. 40, 04
        cmp     eax, dword [ebp-1CH]                    ; 2EB7 _ 3B. 45, E4
        jle     ?_166                                   ; 2EBA _ 0F 8E, 00000216
        cmp     dword [ebp-20H], 0                      ; 2EC0 _ 83. 7D, E0, 00
        js      ?_166                                   ; 2EC4 _ 0F 88, 0000020C
        mov     eax, dword [ebp-18H]                    ; 2ECA _ 8B. 45, E8
        mov     eax, dword [eax+8H]                     ; 2ECD _ 8B. 40, 08
        cmp     eax, dword [ebp-20H]                    ; 2ED0 _ 3B. 45, E0
        jle     ?_166                                   ; 2ED3 _ 0F 8E, 000001FD
        mov     eax, dword [ebp-18H]                    ; 2ED9 _ 8B. 45, E8
        mov     edx, dword [eax]                        ; 2EDC _ 8B. 10
        mov     eax, dword [ebp-18H]                    ; 2EDE _ 8B. 45, E8
        mov     eax, dword [eax+4H]                     ; 2EE1 _ 8B. 40, 04
        imul    eax, dword [ebp-20H]                    ; 2EE4 _ 0F AF. 45, E0
        mov     ecx, eax                                ; 2EE8 _ 89. C1
        mov     eax, dword [ebp-1CH]                    ; 2EEA _ 8B. 45, E4
        add     eax, ecx                                ; 2EED _ 01. C8
        add     eax, edx                                ; 2EEF _ 01. D0
        movzx   eax, byte [eax]                         ; 2EF1 _ 0F B6. 00
        movzx   edx, al                                 ; 2EF4 _ 0F B6. D0
        mov     eax, dword [ebp-18H]                    ; 2EF7 _ 8B. 45, E8
        mov     eax, dword [eax+14H]                    ; 2EFA _ 8B. 40, 14
        cmp     edx, eax                                ; 2EFD _ 39. C2
        je      ?_166                                   ; 2EFF _ 0F 84, 000001D1
        mov     eax, dword [current_console_task]       ; 2F05 _ A1, 00000278(d)
        mov     eax, dword [eax+0B4H]                   ; 2F0A _ 8B. 80, 000000B4
        test    eax, eax                                ; 2F10 _ 85. C0
        jz      ?_161                                   ; 2F12 _ 74, 68
        mov     eax, dword [current_console_task]       ; 2F14 _ A1, 00000278(d)
        mov     eax, dword [eax+0B4H]                   ; 2F19 _ 8B. 80, 000000B4
        mov     dword [esp+0CH], 0                      ; 2F1F _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], ?_391                   ; 2F27 _ C7. 44 24, 08, 0000000F(d)
        mov     dword [esp+4H], eax                     ; 2F2F _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2F33 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2F36 _ 89. 04 24
        call    make_wtitle8                            ; 2F39 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-18H]                    ; 2F3E _ 8B. 45, E8
        mov     ecx, dword [eax+8H]                     ; 2F41 _ 8B. 48, 08
        mov     eax, dword [ebp-18H]                    ; 2F44 _ 8B. 45, E8
        mov     edx, dword [eax+4H]                     ; 2F47 _ 8B. 50, 04
        mov     eax, dword [current_console_task]       ; 2F4A _ A1, 00000278(d)
        mov     eax, dword [eax+0B4H]                   ; 2F4F _ 8B. 80, 000000B4
        mov     dword [esp+14H], ecx                    ; 2F55 _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 2F59 _ 89. 54 24, 10
        mov     dword [esp+0CH], 0                      ; 2F5D _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 0                       ; 2F65 _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], eax                     ; 2F6D _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2F71 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2F74 _ 89. 04 24
        call    sheet_refresh                           ; 2F77 _ E8, FFFFFFFC(rel)
?_161:  mov     eax, dword [ebp-18H]                    ; 2F7C _ 8B. 45, E8
        mov     eax, dword [eax+20H]                    ; 2F7F _ 8B. 40, 20
        mov     dword [current_console_task], eax       ; 2F82 _ A3, 00000278(d)
        mov     eax, dword [current_console_task]       ; 2F87 _ A1, 00000278(d)
        mov     eax, dword [eax+0B4H]                   ; 2F8C _ 8B. 80, 000000B4
        test    eax, eax                                ; 2F92 _ 85. C0
        jnz     ?_162                                   ; 2F94 _ 75, 32
        mov     dword [esp+14H], ?_405                  ; 2F96 _ C7. 44 24, 14, 00000056(d)
        mov     dword [esp+10H], 7                      ; 2F9E _ C7. 44 24, 10, 00000007
        mov     dword [esp+0CH], 96                     ; 2FA6 _ C7. 44 24, 0C, 00000060
        mov     dword [esp+8H], 0                       ; 2FAE _ C7. 44 24, 08, 00000000
        mov     eax, dword [ebp+0CH]                    ; 2FB6 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 2FB9 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2FBD _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2FC0 _ 89. 04 24
        call    showString                              ; 2FC3 _ E8, FFFFFFFC(rel)
?_162:  mov     eax, dword [current_console_task]       ; 2FC8 _ A1, 00000278(d)
        mov     eax, dword [eax+0B4H]                   ; 2FCD _ 8B. 80, 000000B4
        test    eax, eax                                ; 2FD3 _ 85. C0
        jz      ?_163                                   ; 2FD5 _ 74, 60
        mov     eax, dword [current_console_task]       ; 2FD7 _ A1, 00000278(d)
        mov     eax, dword [eax+0B4H]                   ; 2FDC _ 8B. 80, 000000B4
        mov     dword [esp+0CH], 1                      ; 2FE2 _ C7. 44 24, 0C, 00000001
        mov     dword [esp+8H], ?_391                   ; 2FEA _ C7. 44 24, 08, 0000000F(d)
        mov     dword [esp+4H], eax                     ; 2FF2 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2FF6 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2FF9 _ 89. 04 24
        call    make_wtitle8                            ; 2FFC _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-18H]                    ; 3001 _ 8B. 45, E8
        mov     edx, dword [eax+8H]                     ; 3004 _ 8B. 50, 08
        mov     eax, dword [ebp-18H]                    ; 3007 _ 8B. 45, E8
        mov     eax, dword [eax+4H]                     ; 300A _ 8B. 40, 04
        mov     dword [esp+14H], edx                    ; 300D _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 3011 _ 89. 44 24, 10
        mov     dword [esp+0CH], 0                      ; 3015 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 0                       ; 301D _ C7. 44 24, 08, 00000000
        mov     eax, dword [ebp-18H]                    ; 3025 _ 8B. 45, E8
        mov     dword [esp+4H], eax                     ; 3028 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 302C _ 8B. 45, 08
        mov     dword [esp], eax                        ; 302F _ 89. 04 24
        call    sheet_refresh                           ; 3032 _ E8, FFFFFFFC(rel)
?_163:  mov     eax, dword [ebp+8H]                     ; 3037 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 303A _ 8B. 40, 10
        sub     eax, 1                                  ; 303D _ 83. E8, 01
        mov     dword [esp+8H], eax                     ; 3040 _ 89. 44 24, 08
        mov     eax, dword [ebp-18H]                    ; 3044 _ 8B. 45, E8
        mov     dword [esp+4H], eax                     ; 3047 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 304B _ 8B. 45, 08
        mov     dword [esp], eax                        ; 304E _ 89. 04 24
        call    sheet_updown                            ; 3051 _ E8, FFFFFFFC(rel)
        cmp     dword [ebp-1CH], 2                      ; 3056 _ 83. 7D, E4, 02
        jle     ?_164                                   ; 305A _ 7E, 36
        mov     eax, dword [ebp-18H]                    ; 305C _ 8B. 45, E8
        mov     eax, dword [eax+4H]                     ; 305F _ 8B. 40, 04
        sub     eax, 3                                  ; 3062 _ 83. E8, 03
        cmp     eax, dword [ebp-1CH]                    ; 3065 _ 3B. 45, E4
        jle     ?_164                                   ; 3068 _ 7E, 28
        cmp     dword [ebp-20H], 2                      ; 306A _ 83. 7D, E0, 02
        jle     ?_164                                   ; 306E _ 7E, 22
        cmp     dword [ebp-20H], 20                     ; 3070 _ 83. 7D, E0, 14
        jg      ?_164                                   ; 3074 _ 7F, 1C
        mov     eax, dword [mx]                         ; 3076 _ A1, 00000134(d)
        mov     dword [mmx], eax                        ; 307B _ A3, 00000118(d)
        mov     eax, dword [my]                         ; 3080 _ A1, 00000138(d)
        mov     dword [mmy], eax                        ; 3085 _ A3, 0000011C(d)
        mov     eax, dword [ebp-18H]                    ; 308A _ 8B. 45, E8
        mov     dword [mouse_clicked_sht], eax          ; 308D _ A3, 00000270(d)
?_164:  mov     eax, dword [ebp-18H]                    ; 3092 _ 8B. 45, E8
        mov     eax, dword [eax+4H]                     ; 3095 _ 8B. 40, 04
        sub     eax, 21                                 ; 3098 _ 83. E8, 15
        cmp     eax, dword [ebp-1CH]                    ; 309B _ 3B. 45, E4
        jg      ?_165                                   ; 309E _ 7F, 34
        mov     eax, dword [ebp-18H]                    ; 30A0 _ 8B. 45, E8
        mov     eax, dword [eax+4H]                     ; 30A3 _ 8B. 40, 04
        sub     eax, 5                                  ; 30A6 _ 83. E8, 05
        cmp     eax, dword [ebp-1CH]                    ; 30A9 _ 3B. 45, E4
        jle     ?_165                                   ; 30AC _ 7E, 26
        cmp     dword [ebp-20H], 4                      ; 30AE _ 83. 7D, E0, 04
        jle     ?_165                                   ; 30B2 _ 7E, 20
        cmp     dword [ebp-20H], 18                     ; 30B4 _ 83. 7D, E0, 12
        jg      ?_165                                   ; 30B8 _ 7F, 1A
        mov     eax, dword [ebp-18H]                    ; 30BA _ 8B. 45, E8
        mov     eax, dword [eax+20H]                    ; 30BD _ 8B. 40, 20
        test    eax, eax                                ; 30C0 _ 85. C0
        jz      ?_165                                   ; 30C2 _ 74, 10
        mov     eax, dword [ebp-18H]                    ; 30C4 _ 8B. 45, E8
        mov     eax, dword [eax+20H]                    ; 30C7 _ 8B. 40, 20
        mov     dword [esp], eax                        ; 30CA _ 89. 04 24
        call    cmd_exit                                ; 30CD _ E8, FFFFFFFC(rel)
        jmp     ?_168                                   ; 30D2 _ EB, 12

?_165:  jmp     ?_168                                   ; 30D4 _ EB, 10

?_166:  sub     dword [ebp-0CH], 1                      ; 30D6 _ 83. 6D, F4, 01
?_167:  cmp     dword [ebp-0CH], 0                      ; 30DA _ 83. 7D, F4, 00
        jg      ?_160                                   ; 30DE _ 0F 8F, FFFFFD8D
        jmp     ?_171                                   ; 30E4 _ EB, 7D

?_168:  jmp     ?_171                                   ; 30E6 _ EB, 7B

?_169:  mov     edx, dword [mx]                         ; 30E8 _ 8B. 15, 00000134(d)
        mov     eax, dword [mmx]                        ; 30EE _ A1, 00000118(d)
        sub     edx, eax                                ; 30F3 _ 29. C2
        mov     eax, edx                                ; 30F5 _ 89. D0
        mov     dword [ebp-1CH], eax                    ; 30F7 _ 89. 45, E4
        mov     edx, dword [my]                         ; 30FA _ 8B. 15, 00000138(d)
        mov     eax, dword [mmy]                        ; 3100 _ A1, 0000011C(d)
        sub     edx, eax                                ; 3105 _ 29. C2
        mov     eax, edx                                ; 3107 _ 89. D0
        mov     dword [ebp-20H], eax                    ; 3109 _ 89. 45, E0
        mov     eax, dword [mouse_clicked_sht]          ; 310C _ A1, 00000270(d)
        mov     edx, dword [eax+10H]                    ; 3111 _ 8B. 50, 10
        mov     eax, dword [ebp-20H]                    ; 3114 _ 8B. 45, E0
        lea     ecx, [edx+eax]                          ; 3117 _ 8D. 0C 02
        mov     eax, dword [mouse_clicked_sht]          ; 311A _ A1, 00000270(d)
        mov     edx, dword [eax+0CH]                    ; 311F _ 8B. 50, 0C
        mov     eax, dword [ebp-1CH]                    ; 3122 _ 8B. 45, E4
        add     edx, eax                                ; 3125 _ 01. C2
        mov     eax, dword [mouse_clicked_sht]          ; 3127 _ A1, 00000270(d)
        mov     dword [esp+0CH], ecx                    ; 312C _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 3130 _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 3134 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 3138 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 313B _ 89. 04 24
        call    sheet_slide                             ; 313E _ E8, FFFFFFFC(rel)
        mov     eax, dword [mx]                         ; 3143 _ A1, 00000134(d)
        mov     dword [mmx], eax                        ; 3148 _ A3, 00000118(d)
        mov     eax, dword [my]                         ; 314D _ A1, 00000138(d)
        mov     dword [mmy], eax                        ; 3152 _ A3, 0000011C(d)
        jmp     ?_171                                   ; 3157 _ EB, 0A

?_170:  mov     dword [mmx], -1                         ; 3159 _ C7. 05, 00000118(d), FFFFFFFF
?_171:  leave                                           ; 3163 _ C9
        ret                                             ; 3164 _ C3
; show_mouse_info End of function

initBootInfo:; Function begin
        push    ebp                                     ; 3165 _ 55
        mov     ebp, esp                                ; 3166 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 3168 _ 8B. 45, 08
        mov     dword [eax], -536870912                 ; 316B _ C7. 00, E0000000
        mov     eax, dword [ebp+8H]                     ; 3171 _ 8B. 45, 08
; Note: Length-changing prefix causes delay on Intel processors
        mov     word [eax+4H], 640                      ; 3174 _ 66: C7. 40, 04, 0280
        mov     eax, dword [ebp+8H]                     ; 317A _ 8B. 45, 08
; Note: Length-changing prefix causes delay on Intel processors
        mov     word [eax+6H], 480                      ; 317D _ 66: C7. 40, 06, 01E0
        pop     ebp                                     ; 3183 _ 5D
        ret                                             ; 3184 _ C3
; initBootInfo End of function

showString:; Function begin
        push    ebp                                     ; 3185 _ 55
        mov     ebp, esp                                ; 3186 _ 89. E5
        push    ebx                                     ; 3188 _ 53
        sub     esp, 52                                 ; 3189 _ 83. EC, 34
        mov     eax, dword [ebp+18H]                    ; 318C _ 8B. 45, 18
        mov     byte [ebp-1CH], al                      ; 318F _ 88. 45, E4
        mov     eax, dword [ebp+10H]                    ; 3192 _ 8B. 45, 10
        mov     dword [ebp-0CH], eax                    ; 3195 _ 89. 45, F4
        mov     dword [ebp-10H], 0                      ; 3198 _ C7. 45, F0, 00000000
        jmp     ?_173                                   ; 319F _ EB, 4B

?_172:  mov     eax, dword [ebp+1CH]                    ; 31A1 _ 8B. 45, 1C
        movzx   eax, byte [eax]                         ; 31A4 _ 0F B6. 00
        movzx   eax, al                                 ; 31A7 _ 0F B6. C0
        shl     eax, 4                                  ; 31AA _ C1. E0, 04
        lea     ebx, [systemFont+eax]                   ; 31AD _ 8D. 98, 00000000(d)
        movsx   ecx, byte [ebp-1CH]                     ; 31B3 _ 0F BE. 4D, E4
        mov     eax, dword [ebp+0CH]                    ; 31B7 _ 8B. 45, 0C
        mov     edx, dword [eax+4H]                     ; 31BA _ 8B. 50, 04
        mov     eax, dword [ebp+0CH]                    ; 31BD _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 31C0 _ 8B. 00
        mov     dword [esp+14H], ebx                    ; 31C2 _ 89. 5C 24, 14
        mov     dword [esp+10H], ecx                    ; 31C6 _ 89. 4C 24, 10
        mov     ecx, dword [ebp+14H]                    ; 31CA _ 8B. 4D, 14
        mov     dword [esp+0CH], ecx                    ; 31CD _ 89. 4C 24, 0C
        mov     ecx, dword [ebp+10H]                    ; 31D1 _ 8B. 4D, 10
        mov     dword [esp+8H], ecx                     ; 31D4 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 31D8 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 31DC _ 89. 04 24
        call    showFont8                               ; 31DF _ E8, FFFFFFFC(rel)
        add     dword [ebp+10H], 8                      ; 31E4 _ 83. 45, 10, 08
        add     dword [ebp+1CH], 1                      ; 31E8 _ 83. 45, 1C, 01
?_173:  mov     eax, dword [ebp+1CH]                    ; 31EC _ 8B. 45, 1C
        movzx   eax, byte [eax]                         ; 31EF _ 0F B6. 00
        test    al, al                                  ; 31F2 _ 84. C0
        jnz     ?_172                                   ; 31F4 _ 75, AB
        mov     eax, dword [ebp+14H]                    ; 31F6 _ 8B. 45, 14
        add     eax, 16                                 ; 31F9 _ 83. C0, 10
        mov     dword [esp+14H], eax                    ; 31FC _ 89. 44 24, 14
        mov     eax, dword [ebp+10H]                    ; 3200 _ 8B. 45, 10
        mov     dword [esp+10H], eax                    ; 3203 _ 89. 44 24, 10
        mov     eax, dword [ebp+14H]                    ; 3207 _ 8B. 45, 14
        mov     dword [esp+0CH], eax                    ; 320A _ 89. 44 24, 0C
        mov     eax, dword [ebp-0CH]                    ; 320E _ 8B. 45, F4
        mov     dword [esp+8H], eax                     ; 3211 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 3215 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 3218 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 321C _ 8B. 45, 08
        mov     dword [esp], eax                        ; 321F _ 89. 04 24
        call    sheet_refresh                           ; 3222 _ E8, FFFFFFFC(rel)
        add     esp, 52                                 ; 3227 _ 83. C4, 34
        pop     ebx                                     ; 322A _ 5B
        pop     ebp                                     ; 322B _ 5D
        ret                                             ; 322C _ C3
; showString End of function

init_palette:; Function begin
        push    ebp                                     ; 322D _ 55
        mov     ebp, esp                                ; 322E _ 89. E5
        sub     esp, 696                                ; 3230 _ 81. EC, 000002B8
        mov     dword [esp+8H], table_rgb.2101          ; 3236 _ C7. 44 24, 08, 00000140(d)
        mov     dword [esp+4H], 15                      ; 323E _ C7. 44 24, 04, 0000000F
        mov     dword [esp], 0                          ; 3246 _ C7. 04 24, 00000000
        call    set_palette                             ; 324D _ E8, FFFFFFFC(rel)
        mov     dword [ebp-14H], 0                      ; 3252 _ C7. 45, EC, 00000000
        jmp     ?_179                                   ; 3259 _ E9, 000000EF

?_174:  mov     dword [ebp-10H], 0                      ; 325E _ C7. 45, F0, 00000000
        jmp     ?_178                                   ; 3265 _ E9, 000000D5

?_175:  mov     dword [ebp-0CH], 0                      ; 326A _ C7. 45, F4, 00000000
        jmp     ?_177                                   ; 3271 _ E9, 000000BB

?_176:  mov     edx, dword [ebp-10H]                    ; 3276 _ 8B. 55, F0
        mov     eax, edx                                ; 3279 _ 89. D0
        add     eax, eax                                ; 327B _ 01. C0
        add     eax, edx                                ; 327D _ 01. D0
        add     eax, eax                                ; 327F _ 01. C0
        mov     edx, eax                                ; 3281 _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 3283 _ 8B. 45, F4
        lea     ecx, [edx+eax]                          ; 3286 _ 8D. 0C 02
        mov     edx, dword [ebp-14H]                    ; 3289 _ 8B. 55, EC
        mov     eax, edx                                ; 328C _ 89. D0
        shl     eax, 3                                  ; 328E _ C1. E0, 03
        add     eax, edx                                ; 3291 _ 01. D0
        shl     eax, 2                                  ; 3293 _ C1. E0, 02
        lea     edx, [ecx+eax]                          ; 3296 _ 8D. 14 01
        mov     eax, edx                                ; 3299 _ 89. D0
        add     eax, eax                                ; 329B _ 01. C0
        add     edx, eax                                ; 329D _ 01. C2
        mov     eax, dword [ebp-0CH]                    ; 329F _ 8B. 45, F4
        mov     ecx, 51                                 ; 32A2 _ B9, 00000033
        imul    eax, ecx                                ; 32A7 _ 0F AF. C1
        mov     byte [ebp+edx-29CH], al                 ; 32AA _ 88. 84 15, FFFFFD64
        mov     edx, dword [ebp-10H]                    ; 32B1 _ 8B. 55, F0
        mov     eax, edx                                ; 32B4 _ 89. D0
        add     eax, eax                                ; 32B6 _ 01. C0
        add     eax, edx                                ; 32B8 _ 01. D0
        add     eax, eax                                ; 32BA _ 01. C0
        mov     edx, eax                                ; 32BC _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 32BE _ 8B. 45, F4
        lea     ecx, [edx+eax]                          ; 32C1 _ 8D. 0C 02
        mov     edx, dword [ebp-14H]                    ; 32C4 _ 8B. 55, EC
        mov     eax, edx                                ; 32C7 _ 89. D0
        shl     eax, 3                                  ; 32C9 _ C1. E0, 03
        add     eax, edx                                ; 32CC _ 01. D0
        shl     eax, 2                                  ; 32CE _ C1. E0, 02
        lea     edx, [ecx+eax]                          ; 32D1 _ 8D. 14 01
        mov     eax, edx                                ; 32D4 _ 89. D0
        add     eax, eax                                ; 32D6 _ 01. C0
        add     eax, edx                                ; 32D8 _ 01. D0
        lea     edx, [eax+1H]                           ; 32DA _ 8D. 50, 01
        mov     eax, dword [ebp-10H]                    ; 32DD _ 8B. 45, F0
        mov     ecx, 51                                 ; 32E0 _ B9, 00000033
        imul    eax, ecx                                ; 32E5 _ 0F AF. C1
        mov     byte [ebp+edx-29CH], al                 ; 32E8 _ 88. 84 15, FFFFFD64
        mov     edx, dword [ebp-10H]                    ; 32EF _ 8B. 55, F0
        mov     eax, edx                                ; 32F2 _ 89. D0
        add     eax, eax                                ; 32F4 _ 01. C0
        add     eax, edx                                ; 32F6 _ 01. D0
        add     eax, eax                                ; 32F8 _ 01. C0
        mov     edx, eax                                ; 32FA _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 32FC _ 8B. 45, F4
        lea     ecx, [edx+eax]                          ; 32FF _ 8D. 0C 02
        mov     edx, dword [ebp-14H]                    ; 3302 _ 8B. 55, EC
        mov     eax, edx                                ; 3305 _ 89. D0
        shl     eax, 3                                  ; 3307 _ C1. E0, 03
        add     eax, edx                                ; 330A _ 01. D0
        shl     eax, 2                                  ; 330C _ C1. E0, 02
        lea     edx, [ecx+eax]                          ; 330F _ 8D. 14 01
        mov     eax, edx                                ; 3312 _ 89. D0
        add     eax, eax                                ; 3314 _ 01. C0
        add     eax, edx                                ; 3316 _ 01. D0
        lea     edx, [eax+2H]                           ; 3318 _ 8D. 50, 02
        mov     eax, dword [ebp-14H]                    ; 331B _ 8B. 45, EC
        mov     ecx, 51                                 ; 331E _ B9, 00000033
        imul    eax, ecx                                ; 3323 _ 0F AF. C1
        mov     byte [ebp+edx-29CH], al                 ; 3326 _ 88. 84 15, FFFFFD64
        add     dword [ebp-0CH], 1                      ; 332D _ 83. 45, F4, 01
?_177:  cmp     dword [ebp-0CH], 5                      ; 3331 _ 83. 7D, F4, 05
        jle     ?_176                                   ; 3335 _ 0F 8E, FFFFFF3B
        add     dword [ebp-10H], 1                      ; 333B _ 83. 45, F0, 01
?_178:  cmp     dword [ebp-10H], 5                      ; 333F _ 83. 7D, F0, 05
        jle     ?_175                                   ; 3343 _ 0F 8E, FFFFFF21
        add     dword [ebp-14H], 1                      ; 3349 _ 83. 45, EC, 01
?_179:  cmp     dword [ebp-14H], 5                      ; 334D _ 83. 7D, EC, 05
        jle     ?_174                                   ; 3351 _ 0F 8E, FFFFFF07
        lea     eax, [ebp-29CH]                         ; 3357 _ 8D. 85, FFFFFD64
        mov     dword [esp+8H], eax                     ; 335D _ 89. 44 24, 08
        mov     dword [esp+4H], 231                     ; 3361 _ C7. 44 24, 04, 000000E7
        mov     dword [esp], 16                         ; 3369 _ C7. 04 24, 00000010
        call    set_palette                             ; 3370 _ E8, FFFFFFFC(rel)
        nop                                             ; 3375 _ 90
        leave                                           ; 3376 _ C9
        ret                                             ; 3377 _ C3
; init_palette End of function

set_palette:; Function begin
        push    ebp                                     ; 3378 _ 55
        mov     ebp, esp                                ; 3379 _ 89. E5
        sub     esp, 40                                 ; 337B _ 83. EC, 28
        call    io_load_eflags                          ; 337E _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 3383 _ 89. 45, F0
        call    io_cli                                  ; 3386 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 338B _ 8B. 45, 08
        mov     dword [esp+4H], eax                     ; 338E _ 89. 44 24, 04
        mov     dword [esp], 968                        ; 3392 _ C7. 04 24, 000003C8
        call    io_out8                                 ; 3399 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 339E _ 8B. 45, 08
        mov     dword [ebp-0CH], eax                    ; 33A1 _ 89. 45, F4
        jmp     ?_181                                   ; 33A4 _ EB, 62

?_180:  mov     eax, dword [ebp+10H]                    ; 33A6 _ 8B. 45, 10
        movzx   eax, byte [eax]                         ; 33A9 _ 0F B6. 00
        shr     al, 2                                   ; 33AC _ C0. E8, 02
        movzx   eax, al                                 ; 33AF _ 0F B6. C0
        mov     dword [esp+4H], eax                     ; 33B2 _ 89. 44 24, 04
        mov     dword [esp], 969                        ; 33B6 _ C7. 04 24, 000003C9
        call    io_out8                                 ; 33BD _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 33C2 _ 8B. 45, 10
        add     eax, 1                                  ; 33C5 _ 83. C0, 01
        movzx   eax, byte [eax]                         ; 33C8 _ 0F B6. 00
        shr     al, 2                                   ; 33CB _ C0. E8, 02
        movzx   eax, al                                 ; 33CE _ 0F B6. C0
        mov     dword [esp+4H], eax                     ; 33D1 _ 89. 44 24, 04
        mov     dword [esp], 969                        ; 33D5 _ C7. 04 24, 000003C9
        call    io_out8                                 ; 33DC _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 33E1 _ 8B. 45, 10
        add     eax, 2                                  ; 33E4 _ 83. C0, 02
        movzx   eax, byte [eax]                         ; 33E7 _ 0F B6. 00
        shr     al, 2                                   ; 33EA _ C0. E8, 02
        movzx   eax, al                                 ; 33ED _ 0F B6. C0
        mov     dword [esp+4H], eax                     ; 33F0 _ 89. 44 24, 04
        mov     dword [esp], 969                        ; 33F4 _ C7. 04 24, 000003C9
        call    io_out8                                 ; 33FB _ E8, FFFFFFFC(rel)
        add     dword [ebp+10H], 3                      ; 3400 _ 83. 45, 10, 03
        add     dword [ebp-0CH], 1                      ; 3404 _ 83. 45, F4, 01
?_181:  mov     eax, dword [ebp-0CH]                    ; 3408 _ 8B. 45, F4
        cmp     eax, dword [ebp+0CH]                    ; 340B _ 3B. 45, 0C
        jle     ?_180                                   ; 340E _ 7E, 96
        mov     eax, dword [ebp-10H]                    ; 3410 _ 8B. 45, F0
        mov     dword [esp], eax                        ; 3413 _ 89. 04 24
        call    io_store_eflags                         ; 3416 _ E8, FFFFFFFC(rel)
        nop                                             ; 341B _ 90
        leave                                           ; 341C _ C9
        ret                                             ; 341D _ C3
; set_palette End of function

boxfill8:; Function begin
        push    ebp                                     ; 341E _ 55
        mov     ebp, esp                                ; 341F _ 89. E5
        sub     esp, 20                                 ; 3421 _ 83. EC, 14
        mov     eax, dword [ebp+10H]                    ; 3424 _ 8B. 45, 10
        mov     byte [ebp-14H], al                      ; 3427 _ 88. 45, EC
        mov     eax, dword [ebp+18H]                    ; 342A _ 8B. 45, 18
        mov     dword [ebp-8H], eax                     ; 342D _ 89. 45, F8
        jmp     ?_185                                   ; 3430 _ EB, 33

?_182:  mov     eax, dword [ebp+14H]                    ; 3432 _ 8B. 45, 14
        mov     dword [ebp-4H], eax                     ; 3435 _ 89. 45, FC
        jmp     ?_184                                   ; 3438 _ EB, 1F

?_183:  mov     eax, dword [ebp-8H]                     ; 343A _ 8B. 45, F8
        imul    eax, dword [ebp+0CH]                    ; 343D _ 0F AF. 45, 0C
        mov     edx, eax                                ; 3441 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 3443 _ 8B. 45, FC
        add     eax, edx                                ; 3446 _ 01. D0
        mov     edx, eax                                ; 3448 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 344A _ 8B. 45, 08
        add     edx, eax                                ; 344D _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 344F _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 3453 _ 88. 02
        add     dword [ebp-4H], 1                       ; 3455 _ 83. 45, FC, 01
?_184:  mov     eax, dword [ebp-4H]                     ; 3459 _ 8B. 45, FC
        cmp     eax, dword [ebp+1CH]                    ; 345C _ 3B. 45, 1C
        jle     ?_183                                   ; 345F _ 7E, D9
        add     dword [ebp-8H], 1                       ; 3461 _ 83. 45, F8, 01
?_185:  mov     eax, dword [ebp-8H]                     ; 3465 _ 8B. 45, F8
        cmp     eax, dword [ebp+20H]                    ; 3468 _ 3B. 45, 20
        jle     ?_182                                   ; 346B _ 7E, C5
        leave                                           ; 346D _ C9
        ret                                             ; 346E _ C3
; boxfill8 End of function

showFont8:; Function begin
        push    ebp                                     ; 346F _ 55
        mov     ebp, esp                                ; 3470 _ 89. E5
        sub     esp, 20                                 ; 3472 _ 83. EC, 14
        mov     eax, dword [ebp+18H]                    ; 3475 _ 8B. 45, 18
        mov     byte [ebp-14H], al                      ; 3478 _ 88. 45, EC
        mov     dword [ebp-4H], 0                       ; 347B _ C7. 45, FC, 00000000
        jmp     ?_195                                   ; 3482 _ E9, 0000016C

?_186:  mov     edx, dword [ebp-4H]                     ; 3487 _ 8B. 55, FC
        mov     eax, dword [ebp+1CH]                    ; 348A _ 8B. 45, 1C
        add     eax, edx                                ; 348D _ 01. D0
        movzx   eax, byte [eax]                         ; 348F _ 0F B6. 00
        mov     byte [ebp-5H], al                       ; 3492 _ 88. 45, FB
        cmp     byte [ebp-5H], 0                        ; 3495 _ 80. 7D, FB, 00
        jns     ?_187                                   ; 3499 _ 79, 20
        mov     eax, dword [ebp-4H]                     ; 349B _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 349E _ 8B. 55, 14
        add     eax, edx                                ; 34A1 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 34A3 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 34A7 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 34A9 _ 8B. 45, 10
        add     eax, edx                                ; 34AC _ 01. D0
        mov     edx, eax                                ; 34AE _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 34B0 _ 8B. 45, 08
        add     edx, eax                                ; 34B3 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 34B5 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 34B9 _ 88. 02
?_187:  movsx   eax, byte [ebp-5H]                      ; 34BB _ 0F BE. 45, FB
        and     eax, 40H                                ; 34BF _ 83. E0, 40
        test    eax, eax                                ; 34C2 _ 85. C0
        jz      ?_188                                   ; 34C4 _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 34C6 _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 34C9 _ 8B. 55, 14
        add     eax, edx                                ; 34CC _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 34CE _ 0F AF. 45, 0C
        mov     edx, eax                                ; 34D2 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 34D4 _ 8B. 45, 10
        add     eax, edx                                ; 34D7 _ 01. D0
        lea     edx, [eax+1H]                           ; 34D9 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 34DC _ 8B. 45, 08
        add     edx, eax                                ; 34DF _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 34E1 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 34E5 _ 88. 02
?_188:  movsx   eax, byte [ebp-5H]                      ; 34E7 _ 0F BE. 45, FB
        and     eax, 20H                                ; 34EB _ 83. E0, 20
        test    eax, eax                                ; 34EE _ 85. C0
        jz      ?_189                                   ; 34F0 _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 34F2 _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 34F5 _ 8B. 55, 14
        add     eax, edx                                ; 34F8 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 34FA _ 0F AF. 45, 0C
        mov     edx, eax                                ; 34FE _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 3500 _ 8B. 45, 10
        add     eax, edx                                ; 3503 _ 01. D0
        lea     edx, [eax+2H]                           ; 3505 _ 8D. 50, 02
        mov     eax, dword [ebp+8H]                     ; 3508 _ 8B. 45, 08
        add     edx, eax                                ; 350B _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 350D _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 3511 _ 88. 02
?_189:  movsx   eax, byte [ebp-5H]                      ; 3513 _ 0F BE. 45, FB
        and     eax, 10H                                ; 3517 _ 83. E0, 10
        test    eax, eax                                ; 351A _ 85. C0
        jz      ?_190                                   ; 351C _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 351E _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 3521 _ 8B. 55, 14
        add     eax, edx                                ; 3524 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 3526 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 352A _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 352C _ 8B. 45, 10
        add     eax, edx                                ; 352F _ 01. D0
        lea     edx, [eax+3H]                           ; 3531 _ 8D. 50, 03
        mov     eax, dword [ebp+8H]                     ; 3534 _ 8B. 45, 08
        add     edx, eax                                ; 3537 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 3539 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 353D _ 88. 02
?_190:  movsx   eax, byte [ebp-5H]                      ; 353F _ 0F BE. 45, FB
        and     eax, 08H                                ; 3543 _ 83. E0, 08
        test    eax, eax                                ; 3546 _ 85. C0
        jz      ?_191                                   ; 3548 _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 354A _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 354D _ 8B. 55, 14
        add     eax, edx                                ; 3550 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 3552 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 3556 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 3558 _ 8B. 45, 10
        add     eax, edx                                ; 355B _ 01. D0
        lea     edx, [eax+4H]                           ; 355D _ 8D. 50, 04
        mov     eax, dword [ebp+8H]                     ; 3560 _ 8B. 45, 08
        add     edx, eax                                ; 3563 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 3565 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 3569 _ 88. 02
?_191:  movsx   eax, byte [ebp-5H]                      ; 356B _ 0F BE. 45, FB
        and     eax, 04H                                ; 356F _ 83. E0, 04
        test    eax, eax                                ; 3572 _ 85. C0
        jz      ?_192                                   ; 3574 _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 3576 _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 3579 _ 8B. 55, 14
        add     eax, edx                                ; 357C _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 357E _ 0F AF. 45, 0C
        mov     edx, eax                                ; 3582 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 3584 _ 8B. 45, 10
        add     eax, edx                                ; 3587 _ 01. D0
        lea     edx, [eax+5H]                           ; 3589 _ 8D. 50, 05
        mov     eax, dword [ebp+8H]                     ; 358C _ 8B. 45, 08
        add     edx, eax                                ; 358F _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 3591 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 3595 _ 88. 02
?_192:  movsx   eax, byte [ebp-5H]                      ; 3597 _ 0F BE. 45, FB
        and     eax, 02H                                ; 359B _ 83. E0, 02
        test    eax, eax                                ; 359E _ 85. C0
        jz      ?_193                                   ; 35A0 _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 35A2 _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 35A5 _ 8B. 55, 14
        add     eax, edx                                ; 35A8 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 35AA _ 0F AF. 45, 0C
        mov     edx, eax                                ; 35AE _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 35B0 _ 8B. 45, 10
        add     eax, edx                                ; 35B3 _ 01. D0
        lea     edx, [eax+6H]                           ; 35B5 _ 8D. 50, 06
        mov     eax, dword [ebp+8H]                     ; 35B8 _ 8B. 45, 08
        add     edx, eax                                ; 35BB _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 35BD _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 35C1 _ 88. 02
?_193:  movsx   eax, byte [ebp-5H]                      ; 35C3 _ 0F BE. 45, FB
        and     eax, 01H                                ; 35C7 _ 83. E0, 01
        test    eax, eax                                ; 35CA _ 85. C0
        jz      ?_194                                   ; 35CC _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 35CE _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 35D1 _ 8B. 55, 14
        add     eax, edx                                ; 35D4 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 35D6 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 35DA _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 35DC _ 8B. 45, 10
        add     eax, edx                                ; 35DF _ 01. D0
        lea     edx, [eax+7H]                           ; 35E1 _ 8D. 50, 07
        mov     eax, dword [ebp+8H]                     ; 35E4 _ 8B. 45, 08
        add     edx, eax                                ; 35E7 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 35E9 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 35ED _ 88. 02
?_194:  add     dword [ebp-4H], 1                       ; 35EF _ 83. 45, FC, 01
?_195:  cmp     dword [ebp-4H], 15                      ; 35F3 _ 83. 7D, FC, 0F
        jle     ?_186                                   ; 35F7 _ 0F 8E, FFFFFE8A
        leave                                           ; 35FD _ C9
        ret                                             ; 35FE _ C3
; showFont8 End of function

init_mouse_cursor:; Function begin
        push    ebp                                     ; 35FF _ 55
        mov     ebp, esp                                ; 3600 _ 89. E5
        sub     esp, 20                                 ; 3602 _ 83. EC, 14
        mov     eax, dword [ebp+0CH]                    ; 3605 _ 8B. 45, 0C
        mov     byte [ebp-14H], al                      ; 3608 _ 88. 45, EC
        mov     dword [ebp-8H], 0                       ; 360B _ C7. 45, F8, 00000000
        jmp     ?_202                                   ; 3612 _ E9, 000000B1

?_196:  mov     dword [ebp-4H], 0                       ; 3617 _ C7. 45, FC, 00000000
        jmp     ?_201                                   ; 361E _ E9, 00000097

?_197:  mov     eax, dword [ebp-8H]                     ; 3623 _ 8B. 45, F8
        shl     eax, 4                                  ; 3626 _ C1. E0, 04
        mov     edx, eax                                ; 3629 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 362B _ 8B. 45, FC
        add     eax, edx                                ; 362E _ 01. D0
        add     eax, cursor.2161                        ; 3630 _ 05, 00000180(d)
        movzx   eax, byte [eax]                         ; 3635 _ 0F B6. 00
        cmp     al, 42                                  ; 3638 _ 3C, 2A
        jnz     ?_198                                   ; 363A _ 75, 17
        mov     eax, dword [ebp-8H]                     ; 363C _ 8B. 45, F8
        shl     eax, 4                                  ; 363F _ C1. E0, 04
        mov     edx, eax                                ; 3642 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 3644 _ 8B. 45, FC
        add     eax, edx                                ; 3647 _ 01. D0
        mov     edx, eax                                ; 3649 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 364B _ 8B. 45, 08
        add     eax, edx                                ; 364E _ 01. D0
        mov     byte [eax], 0                           ; 3650 _ C6. 00, 00
?_198:  mov     eax, dword [ebp-8H]                     ; 3653 _ 8B. 45, F8
        shl     eax, 4                                  ; 3656 _ C1. E0, 04
        mov     edx, eax                                ; 3659 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 365B _ 8B. 45, FC
        add     eax, edx                                ; 365E _ 01. D0
        add     eax, cursor.2161                        ; 3660 _ 05, 00000180(d)
        movzx   eax, byte [eax]                         ; 3665 _ 0F B6. 00
        cmp     al, 79                                  ; 3668 _ 3C, 4F
        jnz     ?_199                                   ; 366A _ 75, 17
        mov     eax, dword [ebp-8H]                     ; 366C _ 8B. 45, F8
        shl     eax, 4                                  ; 366F _ C1. E0, 04
        mov     edx, eax                                ; 3672 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 3674 _ 8B. 45, FC
        add     eax, edx                                ; 3677 _ 01. D0
        mov     edx, eax                                ; 3679 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 367B _ 8B. 45, 08
        add     eax, edx                                ; 367E _ 01. D0
        mov     byte [eax], 7                           ; 3680 _ C6. 00, 07
?_199:  mov     eax, dword [ebp-8H]                     ; 3683 _ 8B. 45, F8
        shl     eax, 4                                  ; 3686 _ C1. E0, 04
        mov     edx, eax                                ; 3689 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 368B _ 8B. 45, FC
        add     eax, edx                                ; 368E _ 01. D0
        add     eax, cursor.2161                        ; 3690 _ 05, 00000180(d)
        movzx   eax, byte [eax]                         ; 3695 _ 0F B6. 00
        cmp     al, 46                                  ; 3698 _ 3C, 2E
        jnz     ?_200                                   ; 369A _ 75, 1A
        mov     eax, dword [ebp-8H]                     ; 369C _ 8B. 45, F8
        shl     eax, 4                                  ; 369F _ C1. E0, 04
        mov     edx, eax                                ; 36A2 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 36A4 _ 8B. 45, FC
        add     eax, edx                                ; 36A7 _ 01. D0
        mov     edx, eax                                ; 36A9 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 36AB _ 8B. 45, 08
        add     edx, eax                                ; 36AE _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 36B0 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 36B4 _ 88. 02
?_200:  add     dword [ebp-4H], 1                       ; 36B6 _ 83. 45, FC, 01
?_201:  cmp     dword [ebp-4H], 15                      ; 36BA _ 83. 7D, FC, 0F
        jle     ?_197                                   ; 36BE _ 0F 8E, FFFFFF5F
        add     dword [ebp-8H], 1                       ; 36C4 _ 83. 45, F8, 01
?_202:  cmp     dword [ebp-8H], 15                      ; 36C8 _ 83. 7D, F8, 0F
        jle     ?_196                                   ; 36CC _ 0F 8E, FFFFFF45
        leave                                           ; 36D2 _ C9
        ret                                             ; 36D3 _ C3
; init_mouse_cursor End of function

putblock:; Function begin
        push    ebp                                     ; 36D4 _ 55
        mov     ebp, esp                                ; 36D5 _ 89. E5
        sub     esp, 16                                 ; 36D7 _ 83. EC, 10
        mov     dword [ebp-8H], 0                       ; 36DA _ C7. 45, F8, 00000000
        jmp     ?_206                                   ; 36E1 _ EB, 50

?_203:  mov     dword [ebp-4H], 0                       ; 36E3 _ C7. 45, FC, 00000000
        jmp     ?_205                                   ; 36EA _ EB, 3B

?_204:  mov     eax, dword [ebp-8H]                     ; 36EC _ 8B. 45, F8
        mov     edx, dword [ebp+1CH]                    ; 36EF _ 8B. 55, 1C
        add     eax, edx                                ; 36F2 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 36F4 _ 0F AF. 45, 0C
        mov     edx, dword [ebp-4H]                     ; 36F8 _ 8B. 55, FC
        mov     ecx, dword [ebp+18H]                    ; 36FB _ 8B. 4D, 18
        add     edx, ecx                                ; 36FE _ 01. CA
        add     eax, edx                                ; 3700 _ 01. D0
        mov     edx, eax                                ; 3702 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 3704 _ 8B. 45, 08
        add     edx, eax                                ; 3707 _ 01. C2
        mov     eax, dword [ebp-8H]                     ; 3709 _ 8B. 45, F8
        imul    eax, dword [ebp+24H]                    ; 370C _ 0F AF. 45, 24
        mov     ecx, eax                                ; 3710 _ 89. C1
        mov     eax, dword [ebp-4H]                     ; 3712 _ 8B. 45, FC
        add     eax, ecx                                ; 3715 _ 01. C8
        mov     ecx, eax                                ; 3717 _ 89. C1
        mov     eax, dword [ebp+20H]                    ; 3719 _ 8B. 45, 20
        add     eax, ecx                                ; 371C _ 01. C8
        movzx   eax, byte [eax]                         ; 371E _ 0F B6. 00
        mov     byte [edx], al                          ; 3721 _ 88. 02
        add     dword [ebp-4H], 1                       ; 3723 _ 83. 45, FC, 01
?_205:  mov     eax, dword [ebp-4H]                     ; 3727 _ 8B. 45, FC
        cmp     eax, dword [ebp+10H]                    ; 372A _ 3B. 45, 10
        jl      ?_204                                   ; 372D _ 7C, BD
        add     dword [ebp-8H], 1                       ; 372F _ 83. 45, F8, 01
?_206:  mov     eax, dword [ebp-8H]                     ; 3733 _ 8B. 45, F8
        cmp     eax, dword [ebp+14H]                    ; 3736 _ 3B. 45, 14
        jl      ?_203                                   ; 3739 _ 7C, A8
        leave                                           ; 373B _ C9
        ret                                             ; 373C _ C3
; putblock End of function

intHandlerFromC:; Function begin
        push    ebp                                     ; 373D _ 55
        mov     ebp, esp                                ; 373E _ 89. E5
        sub     esp, 40                                 ; 3740 _ 83. EC, 28
        mov     eax, dword [bootInfo]                   ; 3743 _ A1, 00000014(d)
        mov     dword [ebp-0CH], eax                    ; 3748 _ 89. 45, F4
        movzx   eax, word [?_417]                       ; 374B _ 0F B7. 05, 00000018(d)
        cwde                                            ; 3752 _ 98
        mov     dword [ebp-10H], eax                    ; 3753 _ 89. 45, F0
        movzx   eax, word [?_418]                       ; 3756 _ 0F B7. 05, 0000001A(d)
        cwde                                            ; 375D _ 98
        mov     dword [ebp-14H], eax                    ; 375E _ 89. 45, EC
        mov     dword [esp+4H], 32                      ; 3761 _ C7. 44 24, 04, 00000020
        mov     dword [esp], 32                         ; 3769 _ C7. 04 24, 00000020
        call    io_out8                                 ; 3770 _ E8, FFFFFFFC(rel)
        mov     byte [ebp-15H], 0                       ; 3775 _ C6. 45, EB, 00
        mov     dword [esp], 96                         ; 3779 _ C7. 04 24, 00000060
        call    io_in8                                  ; 3780 _ E8, FFFFFFFC(rel)
        mov     byte [ebp-15H], al                      ; 3785 _ 88. 45, EB
        movzx   eax, byte [ebp-15H]                     ; 3788 _ 0F B6. 45, EB
        mov     dword [esp+4H], eax                     ; 378C _ 89. 44 24, 04
        mov     dword [esp], keyinfo                    ; 3790 _ C7. 04 24, 0000001C(d)
        call    fifo8_put                               ; 3797 _ E8, FFFFFFFC(rel)
        nop                                             ; 379C _ 90
        leave                                           ; 379D _ C9
        ret                                             ; 379E _ C3
; intHandlerFromC End of function

charToHexVal:; Function begin
        push    ebp                                     ; 379F _ 55
        mov     ebp, esp                                ; 37A0 _ 89. E5
        sub     esp, 4                                  ; 37A2 _ 83. EC, 04
        mov     eax, dword [ebp+8H]                     ; 37A5 _ 8B. 45, 08
        mov     byte [ebp-4H], al                       ; 37A8 _ 88. 45, FC
        cmp     byte [ebp-4H], 9                        ; 37AB _ 80. 7D, FC, 09
        jle     ?_207                                   ; 37AF _ 7E, 09
        movzx   eax, byte [ebp-4H]                      ; 37B1 _ 0F B6. 45, FC
        add     eax, 55                                 ; 37B5 _ 83. C0, 37
        jmp     ?_208                                   ; 37B8 _ EB, 07

?_207:  movzx   eax, byte [ebp-4H]                      ; 37BA _ 0F B6. 45, FC
        add     eax, 48                                 ; 37BE _ 83. C0, 30
?_208:  leave                                           ; 37C1 _ C9
        ret                                             ; 37C2 _ C3
; charToHexVal End of function

charToHexStr:; Function begin
        push    ebp                                     ; 37C3 _ 55
        mov     ebp, esp                                ; 37C4 _ 89. E5
        sub     esp, 24                                 ; 37C6 _ 83. EC, 18
        mov     eax, dword [ebp+8H]                     ; 37C9 _ 8B. 45, 08
        mov     byte [ebp-14H], al                      ; 37CC _ 88. 45, EC
        mov     dword [ebp-4H], 0                       ; 37CF _ C7. 45, FC, 00000000
        movzx   eax, byte [ebp-14H]                     ; 37D6 _ 0F B6. 45, EC
        and     eax, 0FH                                ; 37DA _ 83. E0, 0F
        mov     byte [ebp-5H], al                       ; 37DD _ 88. 45, FB
        movsx   eax, byte [ebp-5H]                      ; 37E0 _ 0F BE. 45, FB
        mov     dword [esp], eax                        ; 37E4 _ 89. 04 24
        call    charToHexVal                            ; 37E7 _ E8, FFFFFFFC(rel)
        mov     byte [?_416], al                        ; 37EC _ A2, 00000113(d)
        movzx   eax, byte [ebp-14H]                     ; 37F1 _ 0F B6. 45, EC
        shr     al, 4                                   ; 37F5 _ C0. E8, 04
        mov     byte [ebp-14H], al                      ; 37F8 _ 88. 45, EC
        movzx   eax, byte [ebp-14H]                     ; 37FB _ 0F B6. 45, EC
        movsx   eax, al                                 ; 37FF _ 0F BE. C0
        mov     dword [esp], eax                        ; 3802 _ 89. 04 24
        call    charToHexVal                            ; 3805 _ E8, FFFFFFFC(rel)
        mov     byte [?_415], al                        ; 380A _ A2, 00000112(d)
        mov     eax, keyval                             ; 380F _ B8, 00000110(d)
        leave                                           ; 3814 _ C9
        ret                                             ; 3815 _ C3
; charToHexStr End of function

intToHexStr:; Function begin
        push    ebp                                     ; 3816 _ 55
        mov     ebp, esp                                ; 3817 _ 89. E5
        sub     esp, 16                                 ; 3819 _ 83. EC, 10
        mov     byte [str.2209], 48                     ; 381C _ C6. 05, 00000374(d), 30
        mov     byte [?_421], 88                        ; 3823 _ C6. 05, 00000375(d), 58
        mov     byte [?_422], 0                         ; 382A _ C6. 05, 0000037E(d), 00
        mov     dword [ebp-4H], 2                       ; 3831 _ C7. 45, FC, 00000002
        jmp     ?_210                                   ; 3838 _ EB, 0F

?_209:  mov     eax, dword [ebp-4H]                     ; 383A _ 8B. 45, FC
        add     eax, str.2209                           ; 383D _ 05, 00000374(d)
        mov     byte [eax], 48                          ; 3842 _ C6. 00, 30
        add     dword [ebp-4H], 1                       ; 3845 _ 83. 45, FC, 01
?_210:  cmp     dword [ebp-4H], 9                       ; 3849 _ 83. 7D, FC, 09
        jle     ?_209                                   ; 384D _ 7E, EB
        mov     dword [ebp-8H], 9                       ; 384F _ C7. 45, F8, 00000009
        jmp     ?_214                                   ; 3856 _ EB, 40

?_211:  mov     eax, dword [ebp+8H]                     ; 3858 _ 8B. 45, 08
        and     eax, 0FH                                ; 385B _ 83. E0, 0F
        mov     dword [ebp-0CH], eax                    ; 385E _ 89. 45, F4
        mov     eax, dword [ebp+8H]                     ; 3861 _ 8B. 45, 08
        shr     eax, 4                                  ; 3864 _ C1. E8, 04
        mov     dword [ebp+8H], eax                     ; 3867 _ 89. 45, 08
        cmp     dword [ebp-0CH], 9                      ; 386A _ 83. 7D, F4, 09
        jle     ?_212                                   ; 386E _ 7E, 13
        mov     eax, dword [ebp-0CH]                    ; 3870 _ 8B. 45, F4
        add     eax, 55                                 ; 3873 _ 83. C0, 37
        mov     edx, dword [ebp-8H]                     ; 3876 _ 8B. 55, F8
        add     edx, str.2209                           ; 3879 _ 81. C2, 00000374(d)
        mov     byte [edx], al                          ; 387F _ 88. 02
        jmp     ?_213                                   ; 3881 _ EB, 11

?_212:  mov     eax, dword [ebp-0CH]                    ; 3883 _ 8B. 45, F4
        add     eax, 48                                 ; 3886 _ 83. C0, 30
        mov     edx, dword [ebp-8H]                     ; 3889 _ 8B. 55, F8
        add     edx, str.2209                           ; 388C _ 81. C2, 00000374(d)
        mov     byte [edx], al                          ; 3892 _ 88. 02
?_213:  sub     dword [ebp-8H], 1                       ; 3894 _ 83. 6D, F8, 01
?_214:  cmp     dword [ebp-8H], 1                       ; 3898 _ 83. 7D, F8, 01
        jle     ?_215                                   ; 389C _ 7E, 06
        cmp     dword [ebp+8H], 0                       ; 389E _ 83. 7D, 08, 00
        jnz     ?_211                                   ; 38A2 _ 75, B4
?_215:  mov     eax, str.2209                           ; 38A4 _ B8, 00000374(d)
        leave                                           ; 38A9 _ C9
        ret                                             ; 38AA _ C3
; intToHexStr End of function

wait_KBC_sendready:; Function begin
        push    ebp                                     ; 38AB _ 55
        mov     ebp, esp                                ; 38AC _ 89. E5
        sub     esp, 24                                 ; 38AE _ 83. EC, 18
?_216:  mov     dword [esp], 100                        ; 38B1 _ C7. 04 24, 00000064
        call    io_in8                                  ; 38B8 _ E8, FFFFFFFC(rel)
        and     eax, 02H                                ; 38BD _ 83. E0, 02
        test    eax, eax                                ; 38C0 _ 85. C0
        jnz     ?_217                                   ; 38C2 _ 75, 02
        jmp     ?_218                                   ; 38C4 _ EB, 02

?_217:  jmp     ?_216                                   ; 38C6 _ EB, E9

?_218:  leave                                           ; 38C8 _ C9
        ret                                             ; 38C9 _ C3
; wait_KBC_sendready End of function

init_keyboard:; Function begin
        push    ebp                                     ; 38CA _ 55
        mov     ebp, esp                                ; 38CB _ 89. E5
        sub     esp, 24                                 ; 38CD _ 83. EC, 18
        call    wait_KBC_sendready                      ; 38D0 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 96                      ; 38D5 _ C7. 44 24, 04, 00000060
        mov     dword [esp], 100                        ; 38DD _ C7. 04 24, 00000064
        call    io_out8                                 ; 38E4 _ E8, FFFFFFFC(rel)
        call    wait_KBC_sendready                      ; 38E9 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 71                      ; 38EE _ C7. 44 24, 04, 00000047
        mov     dword [esp], 96                         ; 38F6 _ C7. 04 24, 00000060
        call    io_out8                                 ; 38FD _ E8, FFFFFFFC(rel)
        nop                                             ; 3902 _ 90
        leave                                           ; 3903 _ C9
        ret                                             ; 3904 _ C3
; init_keyboard End of function

enable_mouse:; Function begin
        push    ebp                                     ; 3905 _ 55
        mov     ebp, esp                                ; 3906 _ 89. E5
        sub     esp, 24                                 ; 3908 _ 83. EC, 18
        call    wait_KBC_sendready                      ; 390B _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 212                     ; 3910 _ C7. 44 24, 04, 000000D4
        mov     dword [esp], 100                        ; 3918 _ C7. 04 24, 00000064
        call    io_out8                                 ; 391F _ E8, FFFFFFFC(rel)
        call    wait_KBC_sendready                      ; 3924 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 244                     ; 3929 _ C7. 44 24, 04, 000000F4
        mov     dword [esp], 96                         ; 3931 _ C7. 04 24, 00000060
        call    io_out8                                 ; 3938 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 393D _ 8B. 45, 08
        mov     byte [eax+3H], 0                        ; 3940 _ C6. 40, 03, 00
        nop                                             ; 3944 _ 90
        leave                                           ; 3945 _ C9
        ret                                             ; 3946 _ C3
; enable_mouse End of function

intHandlerForMouse:; Function begin
        push    ebp                                     ; 3947 _ 55
        mov     ebp, esp                                ; 3948 _ 89. E5
        sub     esp, 40                                 ; 394A _ 83. EC, 28
        mov     dword [esp+4H], 32                      ; 394D _ C7. 44 24, 04, 00000020
        mov     dword [esp], 160                        ; 3955 _ C7. 04 24, 000000A0
        call    io_out8                                 ; 395C _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 32                      ; 3961 _ C7. 44 24, 04, 00000020
        mov     dword [esp], 32                         ; 3969 _ C7. 04 24, 00000020
        call    io_out8                                 ; 3970 _ E8, FFFFFFFC(rel)
        mov     dword [esp], 96                         ; 3975 _ C7. 04 24, 00000060
        call    io_in8                                  ; 397C _ E8, FFFFFFFC(rel)
        mov     byte [ebp-9H], al                       ; 3981 _ 88. 45, F7
        movzx   eax, byte [ebp-9H]                      ; 3984 _ 0F B6. 45, F7
        mov     dword [esp+4H], eax                     ; 3988 _ 89. 44 24, 04
        mov     dword [esp], mouseinfo                  ; 398C _ C7. 04 24, 00000038(d)
        call    fifo8_put                               ; 3993 _ E8, FFFFFFFC(rel)
        leave                                           ; 3998 _ C9
        ret                                             ; 3999 _ C3
; intHandlerForMouse End of function

mouse_decode:; Function begin
        push    ebp                                     ; 399A _ 55
        mov     ebp, esp                                ; 399B _ 89. E5
        sub     esp, 4                                  ; 399D _ 83. EC, 04
        mov     eax, dword [ebp+0CH]                    ; 39A0 _ 8B. 45, 0C
        mov     byte [ebp-4H], al                       ; 39A3 _ 88. 45, FC
        mov     eax, dword [ebp+8H]                     ; 39A6 _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 39A9 _ 0F B6. 40, 03
        test    al, al                                  ; 39AD _ 84. C0
        jnz     ?_220                                   ; 39AF _ 75, 17
        cmp     byte [ebp-4H], -6                       ; 39B1 _ 80. 7D, FC, FA
        jnz     ?_219                                   ; 39B5 _ 75, 07
        mov     eax, dword [ebp+8H]                     ; 39B7 _ 8B. 45, 08
        mov     byte [eax+3H], 1                        ; 39BA _ C6. 40, 03, 01
?_219:  mov     eax, 0                                  ; 39BE _ B8, 00000000
        jmp     ?_227                                   ; 39C3 _ E9, 0000010F

?_220:  mov     eax, dword [ebp+8H]                     ; 39C8 _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 39CB _ 0F B6. 40, 03
        cmp     al, 1                                   ; 39CF _ 3C, 01
        jnz     ?_222                                   ; 39D1 _ 75, 28
        movzx   eax, byte [ebp-4H]                      ; 39D3 _ 0F B6. 45, FC
        and     eax, 0C8H                               ; 39D7 _ 25, 000000C8
        cmp     eax, 8                                  ; 39DC _ 83. F8, 08
        jnz     ?_221                                   ; 39DF _ 75, 10
        mov     eax, dword [ebp+8H]                     ; 39E1 _ 8B. 45, 08
        movzx   edx, byte [ebp-4H]                      ; 39E4 _ 0F B6. 55, FC
        mov     byte [eax], dl                          ; 39E8 _ 88. 10
        mov     eax, dword [ebp+8H]                     ; 39EA _ 8B. 45, 08
        mov     byte [eax+3H], 2                        ; 39ED _ C6. 40, 03, 02
?_221:  mov     eax, 0                                  ; 39F1 _ B8, 00000000
        jmp     ?_227                                   ; 39F6 _ E9, 000000DC

?_222:  mov     eax, dword [ebp+8H]                     ; 39FB _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 39FE _ 0F B6. 40, 03
        cmp     al, 2                                   ; 3A02 _ 3C, 02
        jnz     ?_223                                   ; 3A04 _ 75, 1B
        mov     eax, dword [ebp+8H]                     ; 3A06 _ 8B. 45, 08
        movzx   edx, byte [ebp-4H]                      ; 3A09 _ 0F B6. 55, FC
        mov     byte [eax+1H], dl                       ; 3A0D _ 88. 50, 01
        mov     eax, dword [ebp+8H]                     ; 3A10 _ 8B. 45, 08
        mov     byte [eax+3H], 3                        ; 3A13 _ C6. 40, 03, 03
        mov     eax, 0                                  ; 3A17 _ B8, 00000000
        jmp     ?_227                                   ; 3A1C _ E9, 000000B6

?_223:  mov     eax, dword [ebp+8H]                     ; 3A21 _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 3A24 _ 0F B6. 40, 03
        cmp     al, 3                                   ; 3A28 _ 3C, 03
        jne     ?_226                                   ; 3A2A _ 0F 85, 000000A2
        mov     eax, dword [ebp+8H]                     ; 3A30 _ 8B. 45, 08
        movzx   edx, byte [ebp-4H]                      ; 3A33 _ 0F B6. 55, FC
        mov     byte [eax+2H], dl                       ; 3A37 _ 88. 50, 02
        mov     eax, dword [ebp+8H]                     ; 3A3A _ 8B. 45, 08
        mov     byte [eax+3H], 1                        ; 3A3D _ C6. 40, 03, 01
        mov     eax, dword [ebp+8H]                     ; 3A41 _ 8B. 45, 08
        movzx   eax, byte [eax]                         ; 3A44 _ 0F B6. 00
        movzx   eax, al                                 ; 3A47 _ 0F B6. C0
        and     eax, 07H                                ; 3A4A _ 83. E0, 07
        mov     edx, eax                                ; 3A4D _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 3A4F _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 3A52 _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 3A55 _ 8B. 45, 08
        movzx   eax, byte [eax+1H]                      ; 3A58 _ 0F B6. 40, 01
        movzx   edx, al                                 ; 3A5C _ 0F B6. D0
        mov     eax, dword [ebp+8H]                     ; 3A5F _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 3A62 _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 3A65 _ 8B. 45, 08
        movzx   eax, byte [eax+2H]                      ; 3A68 _ 0F B6. 40, 02
        movzx   edx, al                                 ; 3A6C _ 0F B6. D0
        mov     eax, dword [ebp+8H]                     ; 3A6F _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 3A72 _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 3A75 _ 8B. 45, 08
        movzx   eax, byte [eax]                         ; 3A78 _ 0F B6. 00
        movzx   eax, al                                 ; 3A7B _ 0F B6. C0
        and     eax, 10H                                ; 3A7E _ 83. E0, 10
        test    eax, eax                                ; 3A81 _ 85. C0
        jz      ?_224                                   ; 3A83 _ 74, 13
        mov     eax, dword [ebp+8H]                     ; 3A85 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 3A88 _ 8B. 40, 04
        or      eax, 0FFFFFF00H                         ; 3A8B _ 0D, FFFFFF00
        mov     edx, eax                                ; 3A90 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 3A92 _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 3A95 _ 89. 50, 04
?_224:  mov     eax, dword [ebp+8H]                     ; 3A98 _ 8B. 45, 08
        movzx   eax, byte [eax]                         ; 3A9B _ 0F B6. 00
        movzx   eax, al                                 ; 3A9E _ 0F B6. C0
        and     eax, 20H                                ; 3AA1 _ 83. E0, 20
        test    eax, eax                                ; 3AA4 _ 85. C0
        jz      ?_225                                   ; 3AA6 _ 74, 13
        mov     eax, dword [ebp+8H]                     ; 3AA8 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 3AAB _ 8B. 40, 08
        or      eax, 0FFFFFF00H                         ; 3AAE _ 0D, FFFFFF00
        mov     edx, eax                                ; 3AB3 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 3AB5 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 3AB8 _ 89. 50, 08
?_225:  mov     eax, dword [ebp+8H]                     ; 3ABB _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 3ABE _ 8B. 40, 08
        neg     eax                                     ; 3AC1 _ F7. D8
        mov     edx, eax                                ; 3AC3 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 3AC5 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 3AC8 _ 89. 50, 08
        mov     eax, 1                                  ; 3ACB _ B8, 00000001
        jmp     ?_227                                   ; 3AD0 _ EB, 05

?_226:  mov     eax, 4294967295                         ; 3AD2 _ B8, FFFFFFFF
?_227:  leave                                           ; 3AD7 _ C9
        ret                                             ; 3AD8 _ C3
; mouse_decode End of function

showMemoryInfo:; Function begin
        push    ebp                                     ; 3AD9 _ 55
        mov     ebp, esp                                ; 3ADA _ 89. E5
        sub     esp, 72                                 ; 3ADC _ 83. EC, 48
        mov     dword [ebp-0CH], 0                      ; 3ADF _ C7. 45, F4, 00000000
        mov     dword [ebp-10H], 0                      ; 3AE6 _ C7. 45, F0, 00000000
        mov     dword [ebp-14H], 104                    ; 3AED _ C7. 45, EC, 00000068
        mov     dword [ebp-18H], 80                     ; 3AF4 _ C7. 45, E8, 00000050
        mov     edx, dword [ysize]                      ; 3AFB _ 8B. 15, 00000140(d)
        mov     eax, dword [ebp+0CH]                    ; 3B01 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 3B04 _ 8B. 00
        mov     dword [esp+8H], edx                     ; 3B06 _ 89. 54 24, 08
        mov     edx, dword [ebp+1CH]                    ; 3B0A _ 8B. 55, 1C
        mov     dword [esp+4H], edx                     ; 3B0D _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 3B11 _ 89. 04 24
        call    init_screen8                            ; 3B14 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+20H]                    ; 3B19 _ 8B. 45, 20
        movsx   eax, al                                 ; 3B1C _ 0F BE. C0
        mov     dword [esp+14H], ?_406                  ; 3B1F _ C7. 44 24, 14, 00000060(d)
        mov     dword [esp+10H], eax                    ; 3B27 _ 89. 44 24, 10
        mov     eax, dword [ebp-10H]                    ; 3B2B _ 8B. 45, F0
        mov     dword [esp+0CH], eax                    ; 3B2E _ 89. 44 24, 0C
        mov     eax, dword [ebp-0CH]                    ; 3B32 _ 8B. 45, F4
        mov     dword [esp+8H], eax                     ; 3B35 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 3B39 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 3B3C _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 3B40 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3B43 _ 89. 04 24
        call    showString                              ; 3B46 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+18H]                    ; 3B4B _ 8B. 45, 18
        mov     dword [esp], eax                        ; 3B4E _ 89. 04 24
        call    intToHexStr                             ; 3B51 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-1CH], eax                    ; 3B56 _ 89. 45, E4
        mov     eax, dword [ebp+20H]                    ; 3B59 _ 8B. 45, 20
        movsx   eax, al                                 ; 3B5C _ 0F BE. C0
        mov     edx, dword [ebp-1CH]                    ; 3B5F _ 8B. 55, E4
        mov     dword [esp+14H], edx                    ; 3B62 _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 3B66 _ 89. 44 24, 10
        mov     eax, dword [ebp-10H]                    ; 3B6A _ 8B. 45, F0
        mov     dword [esp+0CH], eax                    ; 3B6D _ 89. 44 24, 0C
        mov     eax, dword [ebp-14H]                    ; 3B71 _ 8B. 45, EC
        mov     dword [esp+8H], eax                     ; 3B74 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 3B78 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 3B7B _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 3B7F _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3B82 _ 89. 04 24
        call    showString                              ; 3B85 _ E8, FFFFFFFC(rel)
        add     dword [ebp-10H], 16                     ; 3B8A _ 83. 45, F0, 10
        mov     eax, dword [ebp+20H]                    ; 3B8E _ 8B. 45, 20
        movsx   eax, al                                 ; 3B91 _ 0F BE. C0
        mov     dword [esp+14H], ?_407                  ; 3B94 _ C7. 44 24, 14, 0000006A(d)
        mov     dword [esp+10H], eax                    ; 3B9C _ 89. 44 24, 10
        mov     eax, dword [ebp-10H]                    ; 3BA0 _ 8B. 45, F0
        mov     dword [esp+0CH], eax                    ; 3BA3 _ 89. 44 24, 0C
        mov     eax, dword [ebp-0CH]                    ; 3BA7 _ 8B. 45, F4
        mov     dword [esp+8H], eax                     ; 3BAA _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 3BAE _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 3BB1 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 3BB5 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3BB8 _ 89. 04 24
        call    showString                              ; 3BBB _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 3BC0 _ 8B. 45, 10
        mov     eax, dword [eax]                        ; 3BC3 _ 8B. 00
        mov     dword [esp], eax                        ; 3BC5 _ 89. 04 24
        call    intToHexStr                             ; 3BC8 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-20H], eax                    ; 3BCD _ 89. 45, E0
        mov     eax, dword [ebp+20H]                    ; 3BD0 _ 8B. 45, 20
        movsx   eax, al                                 ; 3BD3 _ 0F BE. C0
        mov     edx, dword [ebp-20H]                    ; 3BD6 _ 8B. 55, E0
        mov     dword [esp+14H], edx                    ; 3BD9 _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 3BDD _ 89. 44 24, 10
        mov     eax, dword [ebp-10H]                    ; 3BE1 _ 8B. 45, F0
        mov     dword [esp+0CH], eax                    ; 3BE4 _ 89. 44 24, 0C
        mov     eax, dword [ebp-14H]                    ; 3BE8 _ 8B. 45, EC
        mov     dword [esp+8H], eax                     ; 3BEB _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 3BEF _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 3BF2 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 3BF6 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3BF9 _ 89. 04 24
        call    showString                              ; 3BFC _ E8, FFFFFFFC(rel)
        add     dword [ebp-10H], 16                     ; 3C01 _ 83. 45, F0, 10
        mov     eax, dword [ebp+20H]                    ; 3C05 _ 8B. 45, 20
        movsx   eax, al                                 ; 3C08 _ 0F BE. C0
        mov     dword [esp+14H], ?_408                  ; 3C0B _ C7. 44 24, 14, 00000076(d)
        mov     dword [esp+10H], eax                    ; 3C13 _ 89. 44 24, 10
        mov     eax, dword [ebp-10H]                    ; 3C17 _ 8B. 45, F0
        mov     dword [esp+0CH], eax                    ; 3C1A _ 89. 44 24, 0C
        mov     eax, dword [ebp-0CH]                    ; 3C1E _ 8B. 45, F4
        mov     dword [esp+8H], eax                     ; 3C21 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 3C25 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 3C28 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 3C2C _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3C2F _ 89. 04 24
        call    showString                              ; 3C32 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 3C37 _ 8B. 45, 10
        mov     eax, dword [eax+4H]                     ; 3C3A _ 8B. 40, 04
        mov     dword [esp], eax                        ; 3C3D _ 89. 04 24
        call    intToHexStr                             ; 3C40 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-24H], eax                    ; 3C45 _ 89. 45, DC
        mov     eax, dword [ebp+20H]                    ; 3C48 _ 8B. 45, 20
        movsx   eax, al                                 ; 3C4B _ 0F BE. C0
        mov     edx, dword [ebp-24H]                    ; 3C4E _ 8B. 55, DC
        mov     dword [esp+14H], edx                    ; 3C51 _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 3C55 _ 89. 44 24, 10
        mov     eax, dword [ebp-10H]                    ; 3C59 _ 8B. 45, F0
        mov     dword [esp+0CH], eax                    ; 3C5C _ 89. 44 24, 0C
        mov     eax, dword [ebp-14H]                    ; 3C60 _ 8B. 45, EC
        mov     dword [esp+8H], eax                     ; 3C63 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 3C67 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 3C6A _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 3C6E _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3C71 _ 89. 04 24
        call    showString                              ; 3C74 _ E8, FFFFFFFC(rel)
        add     dword [ebp-10H], 16                     ; 3C79 _ 83. 45, F0, 10
        mov     eax, dword [ebp+20H]                    ; 3C7D _ 8B. 45, 20
        movsx   eax, al                                 ; 3C80 _ 0F BE. C0
        mov     dword [esp+14H], ?_409                  ; 3C83 _ C7. 44 24, 14, 00000082(d)
        mov     dword [esp+10H], eax                    ; 3C8B _ 89. 44 24, 10
        mov     eax, dword [ebp-10H]                    ; 3C8F _ 8B. 45, F0
        mov     dword [esp+0CH], eax                    ; 3C92 _ 89. 44 24, 0C
        mov     eax, dword [ebp-0CH]                    ; 3C96 _ 8B. 45, F4
        mov     dword [esp+8H], eax                     ; 3C99 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 3C9D _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 3CA0 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 3CA4 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3CA7 _ 89. 04 24
        call    showString                              ; 3CAA _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 3CAF _ 8B. 45, 10
        mov     eax, dword [eax+8H]                     ; 3CB2 _ 8B. 40, 08
        mov     dword [esp], eax                        ; 3CB5 _ 89. 04 24
        call    intToHexStr                             ; 3CB8 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-28H], eax                    ; 3CBD _ 89. 45, D8
        mov     eax, dword [ebp+20H]                    ; 3CC0 _ 8B. 45, 20
        movsx   eax, al                                 ; 3CC3 _ 0F BE. C0
        mov     edx, dword [ebp-28H]                    ; 3CC6 _ 8B. 55, D8
        mov     dword [esp+14H], edx                    ; 3CC9 _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 3CCD _ 89. 44 24, 10
        mov     eax, dword [ebp-10H]                    ; 3CD1 _ 8B. 45, F0
        mov     dword [esp+0CH], eax                    ; 3CD4 _ 89. 44 24, 0C
        mov     eax, dword [ebp-14H]                    ; 3CD8 _ 8B. 45, EC
        mov     dword [esp+8H], eax                     ; 3CDB _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 3CDF _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 3CE2 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 3CE6 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3CE9 _ 89. 04 24
        call    showString                              ; 3CEC _ E8, FFFFFFFC(rel)
        leave                                           ; 3CF1 _ C9
        ret                                             ; 3CF2 _ C3
; showMemoryInfo End of function

message_box:; Function begin
        push    ebp                                     ; 3CF3 _ 55
        mov     ebp, esp                                ; 3CF4 _ 89. E5
        sub     esp, 56                                 ; 3CF6 _ 83. EC, 38
        mov     eax, dword [ebp+8H]                     ; 3CF9 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3CFC _ 89. 04 24
        call    sheet_alloc                             ; 3CFF _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 3D04 _ 89. 45, F4
        mov     eax, dword [memman]                     ; 3D07 _ A1, 00000000(d)
        mov     dword [esp+4H], 10880                   ; 3D0C _ C7. 44 24, 04, 00002A80
        mov     dword [esp], eax                        ; 3D14 _ 89. 04 24
        call    memman_alloc_4k                         ; 3D17 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 3D1C _ 89. 45, F0
        mov     dword [esp+10H], -1                     ; 3D1F _ C7. 44 24, 10, FFFFFFFF
        mov     dword [esp+0CH], 68                     ; 3D27 _ C7. 44 24, 0C, 00000044
        mov     dword [esp+8H], 160                     ; 3D2F _ C7. 44 24, 08, 000000A0
        mov     eax, dword [ebp-10H]                    ; 3D37 _ 8B. 45, F0
        mov     dword [esp+4H], eax                     ; 3D3A _ 89. 44 24, 04
        mov     eax, dword [ebp-0CH]                    ; 3D3E _ 8B. 45, F4
        mov     dword [esp], eax                        ; 3D41 _ 89. 04 24
        call    sheet_setbuf                            ; 3D44 _ E8, FFFFFFFC(rel)
        mov     dword [esp+0CH], 1                      ; 3D49 _ C7. 44 24, 0C, 00000001
        mov     eax, dword [ebp+0CH]                    ; 3D51 _ 8B. 45, 0C
        mov     dword [esp+8H], eax                     ; 3D54 _ 89. 44 24, 08
        mov     eax, dword [ebp-0CH]                    ; 3D58 _ 8B. 45, F4
        mov     dword [esp+4H], eax                     ; 3D5B _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 3D5F _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3D62 _ 89. 04 24
        call    make_window8                            ; 3D65 _ E8, FFFFFFFC(rel)
        mov     dword [esp+14H], 7                      ; 3D6A _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], 16                     ; 3D72 _ C7. 44 24, 10, 00000010
        mov     dword [esp+0CH], 144                    ; 3D7A _ C7. 44 24, 0C, 00000090
        mov     dword [esp+8H], 28                      ; 3D82 _ C7. 44 24, 08, 0000001C
        mov     dword [esp+4H], 8                       ; 3D8A _ C7. 44 24, 04, 00000008
        mov     eax, dword [ebp-0CH]                    ; 3D92 _ 8B. 45, F4
        mov     dword [esp], eax                        ; 3D95 _ 89. 04 24
        call    make_textbox8                           ; 3D98 _ E8, FFFFFFFC(rel)
        mov     dword [esp+0CH], 172                    ; 3D9D _ C7. 44 24, 0C, 000000AC
        mov     dword [esp+8H], 260                     ; 3DA5 _ C7. 44 24, 08, 00000104
        mov     eax, dword [ebp-0CH]                    ; 3DAD _ 8B. 45, F4
        mov     dword [esp+4H], eax                     ; 3DB0 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 3DB4 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3DB7 _ 89. 04 24
        call    sheet_slide                             ; 3DBA _ E8, FFFFFFFC(rel)
        mov     dword [esp+8H], 2                       ; 3DBF _ C7. 44 24, 08, 00000002
        mov     eax, dword [ebp-0CH]                    ; 3DC7 _ 8B. 45, F4
        mov     dword [esp+4H], eax                     ; 3DCA _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 3DCE _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3DD1 _ 89. 04 24
        call    sheet_updown                            ; 3DD4 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 3DD9 _ 8B. 45, F4
        leave                                           ; 3DDC _ C9
        ret                                             ; 3DDD _ C3
; message_box End of function

make_window8:; Function begin
        push    ebp                                     ; 3DDE _ 55
        mov     ebp, esp                                ; 3DDF _ 89. E5
        push    ebx                                     ; 3DE1 _ 53
        sub     esp, 52                                 ; 3DE2 _ 83. EC, 34
        mov     eax, dword [ebp+14H]                    ; 3DE5 _ 8B. 45, 14
        mov     byte [ebp-1CH], al                      ; 3DE8 _ 88. 45, E4
        mov     eax, dword [ebp+0CH]                    ; 3DEB _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 3DEE _ 8B. 40, 04
        mov     dword [ebp-0CH], eax                    ; 3DF1 _ 89. 45, F4
        mov     eax, dword [ebp+0CH]                    ; 3DF4 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 3DF7 _ 8B. 40, 08
        mov     dword [ebp-10H], eax                    ; 3DFA _ 89. 45, F0
        mov     eax, dword [ebp-0CH]                    ; 3DFD _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 3E00 _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 3E03 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 3E06 _ 8B. 00
        mov     dword [esp+18H], 0                      ; 3E08 _ C7. 44 24, 18, 00000000
        mov     dword [esp+14H], edx                    ; 3E10 _ 89. 54 24, 14
        mov     dword [esp+10H], 0                      ; 3E14 _ C7. 44 24, 10, 00000000
        mov     dword [esp+0CH], 0                      ; 3E1C _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 8                       ; 3E24 _ C7. 44 24, 08, 00000008
        mov     edx, dword [ebp-0CH]                    ; 3E2C _ 8B. 55, F4
        mov     dword [esp+4H], edx                     ; 3E2F _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 3E33 _ 89. 04 24
        call    boxfill8                                ; 3E36 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 3E3B _ 8B. 45, F4
        lea     edx, [eax-2H]                           ; 3E3E _ 8D. 50, FE
        mov     eax, dword [ebp+0CH]                    ; 3E41 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 3E44 _ 8B. 00
        mov     dword [esp+18H], 1                      ; 3E46 _ C7. 44 24, 18, 00000001
        mov     dword [esp+14H], edx                    ; 3E4E _ 89. 54 24, 14
        mov     dword [esp+10H], 1                      ; 3E52 _ C7. 44 24, 10, 00000001
        mov     dword [esp+0CH], 1                      ; 3E5A _ C7. 44 24, 0C, 00000001
        mov     dword [esp+8H], 7                       ; 3E62 _ C7. 44 24, 08, 00000007
        mov     edx, dword [ebp-0CH]                    ; 3E6A _ 8B. 55, F4
        mov     dword [esp+4H], edx                     ; 3E6D _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 3E71 _ 89. 04 24
        call    boxfill8                                ; 3E74 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 3E79 _ 8B. 45, F0
        lea     edx, [eax-1H]                           ; 3E7C _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 3E7F _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 3E82 _ 8B. 00
        mov     dword [esp+18H], edx                    ; 3E84 _ 89. 54 24, 18
        mov     dword [esp+14H], 0                      ; 3E88 _ C7. 44 24, 14, 00000000
        mov     dword [esp+10H], 0                      ; 3E90 _ C7. 44 24, 10, 00000000
        mov     dword [esp+0CH], 0                      ; 3E98 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 8                       ; 3EA0 _ C7. 44 24, 08, 00000008
        mov     edx, dword [ebp-0CH]                    ; 3EA8 _ 8B. 55, F4
        mov     dword [esp+4H], edx                     ; 3EAB _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 3EAF _ 89. 04 24
        call    boxfill8                                ; 3EB2 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 3EB7 _ 8B. 45, F0
        lea     edx, [eax-1H]                           ; 3EBA _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 3EBD _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 3EC0 _ 8B. 00
        mov     dword [esp+18H], edx                    ; 3EC2 _ 89. 54 24, 18
        mov     dword [esp+14H], 1                      ; 3EC6 _ C7. 44 24, 14, 00000001
        mov     dword [esp+10H], 1                      ; 3ECE _ C7. 44 24, 10, 00000001
        mov     dword [esp+0CH], 1                      ; 3ED6 _ C7. 44 24, 0C, 00000001
        mov     dword [esp+8H], 7                       ; 3EDE _ C7. 44 24, 08, 00000007
        mov     edx, dword [ebp-0CH]                    ; 3EE6 _ 8B. 55, F4
        mov     dword [esp+4H], edx                     ; 3EE9 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 3EED _ 89. 04 24
        call    boxfill8                                ; 3EF0 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 3EF5 _ 8B. 45, F0
        lea     ebx, [eax-2H]                           ; 3EF8 _ 8D. 58, FE
        mov     eax, dword [ebp-0CH]                    ; 3EFB _ 8B. 45, F4
        lea     ecx, [eax-2H]                           ; 3EFE _ 8D. 48, FE
        mov     eax, dword [ebp-0CH]                    ; 3F01 _ 8B. 45, F4
        lea     edx, [eax-2H]                           ; 3F04 _ 8D. 50, FE
        mov     eax, dword [ebp+0CH]                    ; 3F07 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 3F0A _ 8B. 00
        mov     dword [esp+18H], ebx                    ; 3F0C _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 3F10 _ 89. 4C 24, 14
        mov     dword [esp+10H], 1                      ; 3F14 _ C7. 44 24, 10, 00000001
        mov     dword [esp+0CH], edx                    ; 3F1C _ 89. 54 24, 0C
        mov     dword [esp+8H], 15                      ; 3F20 _ C7. 44 24, 08, 0000000F
        mov     edx, dword [ebp-0CH]                    ; 3F28 _ 8B. 55, F4
        mov     dword [esp+4H], edx                     ; 3F2B _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 3F2F _ 89. 04 24
        call    boxfill8                                ; 3F32 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 3F37 _ 8B. 45, F0
        lea     ebx, [eax-1H]                           ; 3F3A _ 8D. 58, FF
        mov     eax, dword [ebp-0CH]                    ; 3F3D _ 8B. 45, F4
        lea     ecx, [eax-1H]                           ; 3F40 _ 8D. 48, FF
        mov     eax, dword [ebp-0CH]                    ; 3F43 _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 3F46 _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 3F49 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 3F4C _ 8B. 00
        mov     dword [esp+18H], ebx                    ; 3F4E _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 3F52 _ 89. 4C 24, 14
        mov     dword [esp+10H], 0                      ; 3F56 _ C7. 44 24, 10, 00000000
        mov     dword [esp+0CH], edx                    ; 3F5E _ 89. 54 24, 0C
        mov     dword [esp+8H], 0                       ; 3F62 _ C7. 44 24, 08, 00000000
        mov     edx, dword [ebp-0CH]                    ; 3F6A _ 8B. 55, F4
        mov     dword [esp+4H], edx                     ; 3F6D _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 3F71 _ 89. 04 24
        call    boxfill8                                ; 3F74 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 3F79 _ 8B. 45, F0
        lea     ecx, [eax-3H]                           ; 3F7C _ 8D. 48, FD
        mov     eax, dword [ebp-0CH]                    ; 3F7F _ 8B. 45, F4
        lea     edx, [eax-3H]                           ; 3F82 _ 8D. 50, FD
        mov     eax, dword [ebp+0CH]                    ; 3F85 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 3F88 _ 8B. 00
        mov     dword [esp+18H], ecx                    ; 3F8A _ 89. 4C 24, 18
        mov     dword [esp+14H], edx                    ; 3F8E _ 89. 54 24, 14
        mov     dword [esp+10H], 2                      ; 3F92 _ C7. 44 24, 10, 00000002
        mov     dword [esp+0CH], 2                      ; 3F9A _ C7. 44 24, 0C, 00000002
        mov     dword [esp+8H], 8                       ; 3FA2 _ C7. 44 24, 08, 00000008
        mov     edx, dword [ebp-0CH]                    ; 3FAA _ 8B. 55, F4
        mov     dword [esp+4H], edx                     ; 3FAD _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 3FB1 _ 89. 04 24
        call    boxfill8                                ; 3FB4 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 3FB9 _ 8B. 45, F4
        lea     edx, [eax-4H]                           ; 3FBC _ 8D. 50, FC
        mov     eax, dword [ebp+0CH]                    ; 3FBF _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 3FC2 _ 8B. 00
        mov     dword [esp+18H], 20                     ; 3FC4 _ C7. 44 24, 18, 00000014
        mov     dword [esp+14H], edx                    ; 3FCC _ 89. 54 24, 14
        mov     dword [esp+10H], 3                      ; 3FD0 _ C7. 44 24, 10, 00000003
        mov     dword [esp+0CH], 3                      ; 3FD8 _ C7. 44 24, 0C, 00000003
        mov     dword [esp+8H], 12                      ; 3FE0 _ C7. 44 24, 08, 0000000C
        mov     edx, dword [ebp-0CH]                    ; 3FE8 _ 8B. 55, F4
        mov     dword [esp+4H], edx                     ; 3FEB _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 3FEF _ 89. 04 24
        call    boxfill8                                ; 3FF2 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 3FF7 _ 8B. 45, F0
        lea     ebx, [eax-2H]                           ; 3FFA _ 8D. 58, FE
        mov     eax, dword [ebp-0CH]                    ; 3FFD _ 8B. 45, F4
        lea     ecx, [eax-2H]                           ; 4000 _ 8D. 48, FE
        mov     eax, dword [ebp-10H]                    ; 4003 _ 8B. 45, F0
        lea     edx, [eax-2H]                           ; 4006 _ 8D. 50, FE
        mov     eax, dword [ebp+0CH]                    ; 4009 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 400C _ 8B. 00
        mov     dword [esp+18H], ebx                    ; 400E _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 4012 _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 4016 _ 89. 54 24, 10
        mov     dword [esp+0CH], 1                      ; 401A _ C7. 44 24, 0C, 00000001
        mov     dword [esp+8H], 15                      ; 4022 _ C7. 44 24, 08, 0000000F
        mov     edx, dword [ebp-0CH]                    ; 402A _ 8B. 55, F4
        mov     dword [esp+4H], edx                     ; 402D _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 4031 _ 89. 04 24
        call    boxfill8                                ; 4034 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 4039 _ 8B. 45, F0
        lea     ebx, [eax-1H]                           ; 403C _ 8D. 58, FF
        mov     eax, dword [ebp-0CH]                    ; 403F _ 8B. 45, F4
        lea     ecx, [eax-1H]                           ; 4042 _ 8D. 48, FF
        mov     eax, dword [ebp-10H]                    ; 4045 _ 8B. 45, F0
        lea     edx, [eax-1H]                           ; 4048 _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 404B _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 404E _ 8B. 00
        mov     dword [esp+18H], ebx                    ; 4050 _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 4054 _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 4058 _ 89. 54 24, 10
        mov     dword [esp+0CH], 0                      ; 405C _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 0                       ; 4064 _ C7. 44 24, 08, 00000000
        mov     edx, dword [ebp-0CH]                    ; 406C _ 8B. 55, F4
        mov     dword [esp+4H], edx                     ; 406F _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 4073 _ 89. 04 24
        call    boxfill8                                ; 4076 _ E8, FFFFFFFC(rel)
        movsx   eax, byte [ebp-1CH]                     ; 407B _ 0F BE. 45, E4
        mov     dword [esp+0CH], eax                    ; 407F _ 89. 44 24, 0C
        mov     eax, dword [ebp+10H]                    ; 4083 _ 8B. 45, 10
        mov     dword [esp+8H], eax                     ; 4086 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 408A _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 408D _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 4091 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 4094 _ 89. 04 24
        call    make_wtitle8                            ; 4097 _ E8, FFFFFFFC(rel)
        nop                                             ; 409C _ 90
        add     esp, 52                                 ; 409D _ 83. C4, 34
        pop     ebx                                     ; 40A0 _ 5B
        pop     ebp                                     ; 40A1 _ 5D
        ret                                             ; 40A2 _ C3
; make_window8 End of function

make_wtitle8:; Function begin
        push    ebp                                     ; 40A3 _ 55
        mov     ebp, esp                                ; 40A4 _ 89. E5
        push    ebx                                     ; 40A6 _ 53
        sub     esp, 52                                 ; 40A7 _ 83. EC, 34
        mov     eax, dword [ebp+14H]                    ; 40AA _ 8B. 45, 14
        mov     byte [ebp-1CH], al                      ; 40AD _ 88. 45, E4
        cmp     byte [ebp-1CH], 0                       ; 40B0 _ 80. 7D, E4, 00
        jz      ?_228                                   ; 40B4 _ 74, 0A
        mov     byte [ebp-12H], 7                       ; 40B6 _ C6. 45, EE, 07
        mov     byte [ebp-13H], 12                      ; 40BA _ C6. 45, ED, 0C
        jmp     ?_229                                   ; 40BE _ EB, 08

?_228:  mov     byte [ebp-12H], 8                       ; 40C0 _ C6. 45, EE, 08
        mov     byte [ebp-13H], 15                      ; 40C4 _ C6. 45, ED, 0F
?_229:  mov     eax, dword [ebp+0CH]                    ; 40C8 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 40CB _ 8B. 40, 04
        lea     ebx, [eax-4H]                           ; 40CE _ 8D. 58, FC
        movzx   eax, byte [ebp-13H]                     ; 40D1 _ 0F B6. 45, ED
        movzx   ecx, al                                 ; 40D5 _ 0F B6. C8
        mov     eax, dword [ebp+0CH]                    ; 40D8 _ 8B. 45, 0C
        mov     edx, dword [eax+4H]                     ; 40DB _ 8B. 50, 04
        mov     eax, dword [ebp+0CH]                    ; 40DE _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 40E1 _ 8B. 00
        mov     dword [esp+18H], 20                     ; 40E3 _ C7. 44 24, 18, 00000014
        mov     dword [esp+14H], ebx                    ; 40EB _ 89. 5C 24, 14
        mov     dword [esp+10H], 3                      ; 40EF _ C7. 44 24, 10, 00000003
        mov     dword [esp+0CH], 3                      ; 40F7 _ C7. 44 24, 0C, 00000003
        mov     dword [esp+8H], ecx                     ; 40FF _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 4103 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 4107 _ 89. 04 24
        call    boxfill8                                ; 410A _ E8, FFFFFFFC(rel)
        movsx   eax, byte [ebp-12H]                     ; 410F _ 0F BE. 45, EE
        mov     edx, dword [ebp+10H]                    ; 4113 _ 8B. 55, 10
        mov     dword [esp+14H], edx                    ; 4116 _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 411A _ 89. 44 24, 10
        mov     dword [esp+0CH], 4                      ; 411E _ C7. 44 24, 0C, 00000004
        mov     dword [esp+8H], 24                      ; 4126 _ C7. 44 24, 08, 00000018
        mov     eax, dword [ebp+0CH]                    ; 412E _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 4131 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 4135 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 4138 _ 89. 04 24
        call    showString                              ; 413B _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], 0                      ; 4140 _ C7. 45, F0, 00000000
        jmp     ?_237                                   ; 4147 _ E9, 00000083

?_230:  mov     dword [ebp-0CH], 0                      ; 414C _ C7. 45, F4, 00000000
        jmp     ?_236                                   ; 4153 _ EB, 70

?_231:  mov     eax, dword [ebp-10H]                    ; 4155 _ 8B. 45, F0
        shl     eax, 4                                  ; 4158 _ C1. E0, 04
        mov     edx, eax                                ; 415B _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 415D _ 8B. 45, F4
        add     eax, edx                                ; 4160 _ 01. D0
        add     eax, closebtn.2280                      ; 4162 _ 05, 00000280(d)
        movzx   eax, byte [eax]                         ; 4167 _ 0F B6. 00
        mov     byte [ebp-11H], al                      ; 416A _ 88. 45, EF
        cmp     byte [ebp-11H], 64                      ; 416D _ 80. 7D, EF, 40
        jnz     ?_232                                   ; 4171 _ 75, 06
        mov     byte [ebp-11H], 0                       ; 4173 _ C6. 45, EF, 00
        jmp     ?_235                                   ; 4177 _ EB, 1C

?_232:  cmp     byte [ebp-11H], 36                      ; 4179 _ 80. 7D, EF, 24
        jnz     ?_233                                   ; 417D _ 75, 06
        mov     byte [ebp-11H], 15                      ; 417F _ C6. 45, EF, 0F
        jmp     ?_235                                   ; 4183 _ EB, 10

?_233:  cmp     byte [ebp-11H], 81                      ; 4185 _ 80. 7D, EF, 51
        jnz     ?_234                                   ; 4189 _ 75, 06
        mov     byte [ebp-11H], 8                       ; 418B _ C6. 45, EF, 08
        jmp     ?_235                                   ; 418F _ EB, 04

?_234:  mov     byte [ebp-11H], 7                       ; 4191 _ C6. 45, EF, 07
?_235:  mov     eax, dword [ebp+0CH]                    ; 4195 _ 8B. 45, 0C
        mov     edx, dword [eax]                        ; 4198 _ 8B. 10
        mov     eax, dword [ebp-10H]                    ; 419A _ 8B. 45, F0
        lea     ecx, [eax+5H]                           ; 419D _ 8D. 48, 05
        mov     eax, dword [ebp+0CH]                    ; 41A0 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 41A3 _ 8B. 40, 04
        imul    ecx, eax                                ; 41A6 _ 0F AF. C8
        mov     eax, dword [ebp+0CH]                    ; 41A9 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 41AC _ 8B. 40, 04
        lea     ebx, [eax-15H]                          ; 41AF _ 8D. 58, EB
        mov     eax, dword [ebp-0CH]                    ; 41B2 _ 8B. 45, F4
        add     eax, ebx                                ; 41B5 _ 01. D8
        add     eax, ecx                                ; 41B7 _ 01. C8
        add     edx, eax                                ; 41B9 _ 01. C2
        movzx   eax, byte [ebp-11H]                     ; 41BB _ 0F B6. 45, EF
        mov     byte [edx], al                          ; 41BF _ 88. 02
        add     dword [ebp-0CH], 1                      ; 41C1 _ 83. 45, F4, 01
?_236:  cmp     dword [ebp-0CH], 15                     ; 41C5 _ 83. 7D, F4, 0F
        jle     ?_231                                   ; 41C9 _ 7E, 8A
        add     dword [ebp-10H], 1                      ; 41CB _ 83. 45, F0, 01
?_237:  cmp     dword [ebp-10H], 13                     ; 41CF _ 83. 7D, F0, 0D
        jle     ?_230                                   ; 41D3 _ 0F 8E, FFFFFF73
        add     esp, 52                                 ; 41D9 _ 83. C4, 34
        pop     ebx                                     ; 41DC _ 5B
        pop     ebp                                     ; 41DD _ 5D
        ret                                             ; 41DE _ C3
; make_wtitle8 End of function

make_textbox8:; Function begin
        push    ebp                                     ; 41DF _ 55
        mov     ebp, esp                                ; 41E0 _ 89. E5
        push    edi                                     ; 41E2 _ 57
        push    esi                                     ; 41E3 _ 56
        push    ebx                                     ; 41E4 _ 53
        sub     esp, 44                                 ; 41E5 _ 83. EC, 2C
        mov     eax, dword [ebp+14H]                    ; 41E8 _ 8B. 45, 14
        mov     edx, dword [ebp+0CH]                    ; 41EB _ 8B. 55, 0C
        add     eax, edx                                ; 41EE _ 01. D0
        mov     dword [ebp-10H], eax                    ; 41F0 _ 89. 45, F0
        mov     eax, dword [ebp+18H]                    ; 41F3 _ 8B. 45, 18
        mov     edx, dword [ebp+10H]                    ; 41F6 _ 8B. 55, 10
        add     eax, edx                                ; 41F9 _ 01. D0
        mov     dword [ebp-14H], eax                    ; 41FB _ 89. 45, EC
        mov     eax, dword [ebp+10H]                    ; 41FE _ 8B. 45, 10
        lea     edi, [eax-3H]                           ; 4201 _ 8D. 78, FD
        mov     eax, dword [ebp-10H]                    ; 4204 _ 8B. 45, F0
        lea     esi, [eax+1H]                           ; 4207 _ 8D. 70, 01
        mov     eax, dword [ebp+10H]                    ; 420A _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 420D _ 8D. 58, FD
        mov     eax, dword [ebp+0CH]                    ; 4210 _ 8B. 45, 0C
        lea     ecx, [eax-2H]                           ; 4213 _ 8D. 48, FE
        mov     eax, dword [ebp+8H]                     ; 4216 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 4219 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 421C _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 421F _ 8B. 00
        mov     dword [esp+18H], edi                    ; 4221 _ 89. 7C 24, 18
        mov     dword [esp+14H], esi                    ; 4225 _ 89. 74 24, 14
        mov     dword [esp+10H], ebx                    ; 4229 _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 422D _ 89. 4C 24, 0C
        mov     dword [esp+8H], 15                      ; 4231 _ C7. 44 24, 08, 0000000F
        mov     dword [esp+4H], edx                     ; 4239 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 423D _ 89. 04 24
        call    boxfill8                                ; 4240 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-14H]                    ; 4245 _ 8B. 45, EC
        lea     edi, [eax+1H]                           ; 4248 _ 8D. 78, 01
        mov     eax, dword [ebp+0CH]                    ; 424B _ 8B. 45, 0C
        lea     esi, [eax-3H]                           ; 424E _ 8D. 70, FD
        mov     eax, dword [ebp+10H]                    ; 4251 _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 4254 _ 8D. 58, FD
        mov     eax, dword [ebp+0CH]                    ; 4257 _ 8B. 45, 0C
        lea     ecx, [eax-3H]                           ; 425A _ 8D. 48, FD
        mov     eax, dword [ebp+8H]                     ; 425D _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 4260 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 4263 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 4266 _ 8B. 00
        mov     dword [esp+18H], edi                    ; 4268 _ 89. 7C 24, 18
        mov     dword [esp+14H], esi                    ; 426C _ 89. 74 24, 14
        mov     dword [esp+10H], ebx                    ; 4270 _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 4274 _ 89. 4C 24, 0C
        mov     dword [esp+8H], 15                      ; 4278 _ C7. 44 24, 08, 0000000F
        mov     dword [esp+4H], edx                     ; 4280 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 4284 _ 89. 04 24
        call    boxfill8                                ; 4287 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-14H]                    ; 428C _ 8B. 45, EC
        lea     edi, [eax+2H]                           ; 428F _ 8D. 78, 02
        mov     eax, dword [ebp-10H]                    ; 4292 _ 8B. 45, F0
        lea     esi, [eax+1H]                           ; 4295 _ 8D. 70, 01
        mov     eax, dword [ebp-14H]                    ; 4298 _ 8B. 45, EC
        lea     ebx, [eax+2H]                           ; 429B _ 8D. 58, 02
        mov     eax, dword [ebp+0CH]                    ; 429E _ 8B. 45, 0C
        lea     ecx, [eax-3H]                           ; 42A1 _ 8D. 48, FD
        mov     eax, dword [ebp+8H]                     ; 42A4 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 42A7 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 42AA _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 42AD _ 8B. 00
        mov     dword [esp+18H], edi                    ; 42AF _ 89. 7C 24, 18
        mov     dword [esp+14H], esi                    ; 42B3 _ 89. 74 24, 14
        mov     dword [esp+10H], ebx                    ; 42B7 _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 42BB _ 89. 4C 24, 0C
        mov     dword [esp+8H], 7                       ; 42BF _ C7. 44 24, 08, 00000007
        mov     dword [esp+4H], edx                     ; 42C7 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 42CB _ 89. 04 24
        call    boxfill8                                ; 42CE _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-14H]                    ; 42D3 _ 8B. 45, EC
        lea     edi, [eax+2H]                           ; 42D6 _ 8D. 78, 02
        mov     eax, dword [ebp-10H]                    ; 42D9 _ 8B. 45, F0
        lea     esi, [eax+2H]                           ; 42DC _ 8D. 70, 02
        mov     eax, dword [ebp+10H]                    ; 42DF _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 42E2 _ 8D. 58, FD
        mov     eax, dword [ebp-10H]                    ; 42E5 _ 8B. 45, F0
        lea     ecx, [eax+2H]                           ; 42E8 _ 8D. 48, 02
        mov     eax, dword [ebp+8H]                     ; 42EB _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 42EE _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 42F1 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 42F4 _ 8B. 00
        mov     dword [esp+18H], edi                    ; 42F6 _ 89. 7C 24, 18
        mov     dword [esp+14H], esi                    ; 42FA _ 89. 74 24, 14
        mov     dword [esp+10H], ebx                    ; 42FE _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 4302 _ 89. 4C 24, 0C
        mov     dword [esp+8H], 7                       ; 4306 _ C7. 44 24, 08, 00000007
        mov     dword [esp+4H], edx                     ; 430E _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 4312 _ 89. 04 24
        call    boxfill8                                ; 4315 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 431A _ 8B. 45, 10
        lea     ecx, [eax-2H]                           ; 431D _ 8D. 48, FE
        mov     eax, dword [ebp+10H]                    ; 4320 _ 8B. 45, 10
        lea     esi, [eax-2H]                           ; 4323 _ 8D. 70, FE
        mov     eax, dword [ebp+0CH]                    ; 4326 _ 8B. 45, 0C
        lea     ebx, [eax-1H]                           ; 4329 _ 8D. 58, FF
        mov     eax, dword [ebp+8H]                     ; 432C _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 432F _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 4332 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 4335 _ 8B. 00
        mov     dword [esp+18H], ecx                    ; 4337 _ 89. 4C 24, 18
        mov     ecx, dword [ebp-10H]                    ; 433B _ 8B. 4D, F0
        mov     dword [esp+14H], ecx                    ; 433E _ 89. 4C 24, 14
        mov     dword [esp+10H], esi                    ; 4342 _ 89. 74 24, 10
        mov     dword [esp+0CH], ebx                    ; 4346 _ 89. 5C 24, 0C
        mov     dword [esp+8H], 0                       ; 434A _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], edx                     ; 4352 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 4356 _ 89. 04 24
        call    boxfill8                                ; 4359 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+0CH]                    ; 435E _ 8B. 45, 0C
        lea     edi, [eax-2H]                           ; 4361 _ 8D. 78, FE
        mov     eax, dword [ebp+10H]                    ; 4364 _ 8B. 45, 10
        lea     esi, [eax-2H]                           ; 4367 _ 8D. 70, FE
        mov     eax, dword [ebp+0CH]                    ; 436A _ 8B. 45, 0C
        lea     ebx, [eax-2H]                           ; 436D _ 8D. 58, FE
        mov     eax, dword [ebp+8H]                     ; 4370 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 4373 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 4376 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 4379 _ 8B. 00
        mov     ecx, dword [ebp-14H]                    ; 437B _ 8B. 4D, EC
        mov     dword [esp+18H], ecx                    ; 437E _ 89. 4C 24, 18
        mov     dword [esp+14H], edi                    ; 4382 _ 89. 7C 24, 14
        mov     dword [esp+10H], esi                    ; 4386 _ 89. 74 24, 10
        mov     dword [esp+0CH], ebx                    ; 438A _ 89. 5C 24, 0C
        mov     dword [esp+8H], 0                       ; 438E _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], edx                     ; 4396 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 439A _ 89. 04 24
        call    boxfill8                                ; 439D _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-14H]                    ; 43A2 _ 8B. 45, EC
        lea     ecx, [eax+1H]                           ; 43A5 _ 8D. 48, 01
        mov     eax, dword [ebp-14H]                    ; 43A8 _ 8B. 45, EC
        lea     esi, [eax+1H]                           ; 43AB _ 8D. 70, 01
        mov     eax, dword [ebp+0CH]                    ; 43AE _ 8B. 45, 0C
        lea     ebx, [eax-2H]                           ; 43B1 _ 8D. 58, FE
        mov     eax, dword [ebp+8H]                     ; 43B4 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 43B7 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 43BA _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 43BD _ 8B. 00
        mov     dword [esp+18H], ecx                    ; 43BF _ 89. 4C 24, 18
        mov     ecx, dword [ebp-10H]                    ; 43C3 _ 8B. 4D, F0
        mov     dword [esp+14H], ecx                    ; 43C6 _ 89. 4C 24, 14
        mov     dword [esp+10H], esi                    ; 43CA _ 89. 74 24, 10
        mov     dword [esp+0CH], ebx                    ; 43CE _ 89. 5C 24, 0C
        mov     dword [esp+8H], 8                       ; 43D2 _ C7. 44 24, 08, 00000008
        mov     dword [esp+4H], edx                     ; 43DA _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 43DE _ 89. 04 24
        call    boxfill8                                ; 43E1 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-14H]                    ; 43E6 _ 8B. 45, EC
        lea     edi, [eax+1H]                           ; 43E9 _ 8D. 78, 01
        mov     eax, dword [ebp-10H]                    ; 43EC _ 8B. 45, F0
        lea     esi, [eax+1H]                           ; 43EF _ 8D. 70, 01
        mov     eax, dword [ebp+10H]                    ; 43F2 _ 8B. 45, 10
        lea     ebx, [eax-2H]                           ; 43F5 _ 8D. 58, FE
        mov     eax, dword [ebp-10H]                    ; 43F8 _ 8B. 45, F0
        lea     ecx, [eax+1H]                           ; 43FB _ 8D. 48, 01
        mov     eax, dword [ebp+8H]                     ; 43FE _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 4401 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 4404 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 4407 _ 8B. 00
        mov     dword [esp+18H], edi                    ; 4409 _ 89. 7C 24, 18
        mov     dword [esp+14H], esi                    ; 440D _ 89. 74 24, 14
        mov     dword [esp+10H], ebx                    ; 4411 _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 4415 _ 89. 4C 24, 0C
        mov     dword [esp+8H], 8                       ; 4419 _ C7. 44 24, 08, 00000008
        mov     dword [esp+4H], edx                     ; 4421 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 4425 _ 89. 04 24
        call    boxfill8                                ; 4428 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 442D _ 8B. 45, 10
        lea     edi, [eax-1H]                           ; 4430 _ 8D. 78, FF
        mov     eax, dword [ebp+0CH]                    ; 4433 _ 8B. 45, 0C
        lea     esi, [eax-1H]                           ; 4436 _ 8D. 70, FF
        mov     eax, dword [ebp+1CH]                    ; 4439 _ 8B. 45, 1C
        movzx   ecx, al                                 ; 443C _ 0F B6. C8
        mov     eax, dword [ebp+8H]                     ; 443F _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 4442 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 4445 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 4448 _ 8B. 00
        mov     ebx, dword [ebp-14H]                    ; 444A _ 8B. 5D, EC
        mov     dword [esp+18H], ebx                    ; 444D _ 89. 5C 24, 18
        mov     ebx, dword [ebp-10H]                    ; 4451 _ 8B. 5D, F0
        mov     dword [esp+14H], ebx                    ; 4454 _ 89. 5C 24, 14
        mov     dword [esp+10H], edi                    ; 4458 _ 89. 7C 24, 10
        mov     dword [esp+0CH], esi                    ; 445C _ 89. 74 24, 0C
        mov     dword [esp+8H], ecx                     ; 4460 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 4464 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 4468 _ 89. 04 24
        call    boxfill8                                ; 446B _ E8, FFFFFFFC(rel)
        add     esp, 44                                 ; 4470 _ 83. C4, 2C
        pop     ebx                                     ; 4473 _ 5B
        pop     esi                                     ; 4474 _ 5E
        pop     edi                                     ; 4475 _ 5F
        pop     ebp                                     ; 4476 _ 5D
        ret                                             ; 4477 _ C3
; make_textbox8 End of function

file_loadfile:; Function begin
        push    ebp                                     ; 4478 _ 55
        mov     ebp, esp                                ; 4479 _ 89. E5
        sub     esp, 56                                 ; 447B _ 83. EC, 38
        mov     dword [ebp-0CH], 78848                  ; 447E _ C7. 45, F4, 00013400
        mov     eax, dword [memman]                     ; 4485 _ A1, 00000000(d)
        mov     dword [esp+4H], 13                      ; 448A _ C7. 44 24, 04, 0000000D
        mov     dword [esp], eax                        ; 4492 _ 89. 04 24
        call    memman_alloc                            ; 4495 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-1CH], eax                    ; 449A _ 89. 45, E4
        mov     eax, dword [ebp-1CH]                    ; 449D _ 8B. 45, E4
        add     eax, 12                                 ; 44A0 _ 83. C0, 0C
        mov     byte [eax], 0                           ; 44A3 _ C6. 00, 00
        jmp     ?_248                                   ; 44A6 _ E9, 0000011E

?_238:  mov     dword [ebp-10H], 0                      ; 44AB _ C7. 45, F0, 00000000
        jmp     ?_241                                   ; 44B2 _ EB, 2C

?_239:  mov     edx, dword [ebp-0CH]                    ; 44B4 _ 8B. 55, F4
        mov     eax, dword [ebp-10H]                    ; 44B7 _ 8B. 45, F0
        add     eax, edx                                ; 44BA _ 01. D0
        movzx   eax, byte [eax]                         ; 44BC _ 0F B6. 00
        test    al, al                                  ; 44BF _ 84. C0
        jz      ?_240                                   ; 44C1 _ 74, 1B
        mov     edx, dword [ebp-10H]                    ; 44C3 _ 8B. 55, F0
        mov     eax, dword [ebp-1CH]                    ; 44C6 _ 8B. 45, E4
        add     edx, eax                                ; 44C9 _ 01. C2
        mov     ecx, dword [ebp-0CH]                    ; 44CB _ 8B. 4D, F4
        mov     eax, dword [ebp-10H]                    ; 44CE _ 8B. 45, F0
        add     eax, ecx                                ; 44D1 _ 01. C8
        movzx   eax, byte [eax]                         ; 44D3 _ 0F B6. 00
        mov     byte [edx], al                          ; 44D6 _ 88. 02
        add     dword [ebp-10H], 1                      ; 44D8 _ 83. 45, F0, 01
        jmp     ?_241                                   ; 44DC _ EB, 02

?_240:  jmp     ?_242                                   ; 44DE _ EB, 06

?_241:  cmp     dword [ebp-10H], 7                      ; 44E0 _ 83. 7D, F0, 07
        jle     ?_239                                   ; 44E4 _ 7E, CE
?_242:  mov     dword [ebp-14H], 0                      ; 44E6 _ C7. 45, EC, 00000000
        mov     edx, dword [ebp-10H]                    ; 44ED _ 8B. 55, F0
        mov     eax, dword [ebp-1CH]                    ; 44F0 _ 8B. 45, E4
        add     eax, edx                                ; 44F3 _ 01. D0
        mov     byte [eax], 46                          ; 44F5 _ C6. 00, 2E
        add     dword [ebp-10H], 1                      ; 44F8 _ 83. 45, F0, 01
        mov     dword [ebp-14H], 0                      ; 44FC _ C7. 45, EC, 00000000
        jmp     ?_244                                   ; 4503 _ EB, 1E

?_243:  mov     edx, dword [ebp-10H]                    ; 4505 _ 8B. 55, F0
        mov     eax, dword [ebp-1CH]                    ; 4508 _ 8B. 45, E4
        add     edx, eax                                ; 450B _ 01. C2
        mov     ecx, dword [ebp-0CH]                    ; 450D _ 8B. 4D, F4
        mov     eax, dword [ebp-14H]                    ; 4510 _ 8B. 45, EC
        add     eax, ecx                                ; 4513 _ 01. C8
        movzx   eax, byte [eax+8H]                      ; 4515 _ 0F B6. 40, 08
        mov     byte [edx], al                          ; 4519 _ 88. 02
        add     dword [ebp-10H], 1                      ; 451B _ 83. 45, F0, 01
        add     dword [ebp-14H], 1                      ; 451F _ 83. 45, EC, 01
?_244:  cmp     dword [ebp-14H], 2                      ; 4523 _ 83. 7D, EC, 02
        jle     ?_243                                   ; 4527 _ 7E, DC
        mov     eax, dword [ebp-1CH]                    ; 4529 _ 8B. 45, E4
        mov     dword [esp+4H], eax                     ; 452C _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 4530 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 4533 _ 89. 04 24
        call    strcmp                                  ; 4536 _ E8, FFFFFFFC(rel)
        cmp     eax, 1                                  ; 453B _ 83. F8, 01
        jne     ?_247                                   ; 453E _ 0F 85, 00000081
        mov     eax, dword [ebp-0CH]                    ; 4544 _ 8B. 45, F4
        mov     edx, dword [eax+1CH]                    ; 4547 _ 8B. 50, 1C
        mov     eax, dword [memman]                     ; 454A _ A1, 00000000(d)
        mov     dword [esp+4H], edx                     ; 454F _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 4553 _ 89. 04 24
        call    memman_alloc_4k                         ; 4556 _ E8, FFFFFFFC(rel)
        mov     edx, eax                                ; 455B _ 89. C2
        mov     eax, dword [ebp+0CH]                    ; 455D _ 8B. 45, 0C
        mov     dword [eax], edx                        ; 4560 _ 89. 10
        mov     eax, dword [ebp-0CH]                    ; 4562 _ 8B. 45, F4
        mov     eax, dword [eax+1CH]                    ; 4565 _ 8B. 40, 1C
        mov     edx, eax                                ; 4568 _ 89. C2
        mov     eax, dword [ebp+0CH]                    ; 456A _ 8B. 45, 0C
        mov     dword [eax+8H], edx                     ; 456D _ 89. 50, 08
        mov     dword [ebp-20H], 88064                  ; 4570 _ C7. 45, E0, 00015800
        mov     eax, dword [ebp-0CH]                    ; 4577 _ 8B. 45, F4
        movzx   eax, word [eax+1AH]                     ; 457A _ 0F B7. 40, 1A
        movzx   eax, ax                                 ; 457E _ 0F B7. C0
        shl     eax, 9                                  ; 4581 _ C1. E0, 09
        add     dword [ebp-20H], eax                    ; 4584 _ 01. 45, E0
        mov     eax, dword [ebp-0CH]                    ; 4587 _ 8B. 45, F4
        mov     eax, dword [eax+1CH]                    ; 458A _ 8B. 40, 1C
        mov     dword [ebp-24H], eax                    ; 458D _ 89. 45, DC
        mov     dword [ebp-18H], 0                      ; 4590 _ C7. 45, E8, 00000000
        mov     dword [ebp-18H], 0                      ; 4597 _ C7. 45, E8, 00000000
        jmp     ?_246                                   ; 459E _ EB, 1B

?_245:  mov     eax, dword [ebp+0CH]                    ; 45A0 _ 8B. 45, 0C
        mov     edx, dword [eax]                        ; 45A3 _ 8B. 10
        mov     eax, dword [ebp-18H]                    ; 45A5 _ 8B. 45, E8
        add     edx, eax                                ; 45A8 _ 01. C2
        mov     ecx, dword [ebp-18H]                    ; 45AA _ 8B. 4D, E8
        mov     eax, dword [ebp-20H]                    ; 45AD _ 8B. 45, E0
        add     eax, ecx                                ; 45B0 _ 01. C8
        movzx   eax, byte [eax]                         ; 45B2 _ 0F B6. 00
        mov     byte [edx], al                          ; 45B5 _ 88. 02
        add     dword [ebp-18H], 1                      ; 45B7 _ 83. 45, E8, 01
?_246:  mov     eax, dword [ebp-18H]                    ; 45BB _ 8B. 45, E8
        cmp     eax, dword [ebp-24H]                    ; 45BE _ 3B. 45, DC
        jl      ?_245                                   ; 45C1 _ 7C, DD
        jmp     ?_249                                   ; 45C3 _ EB, 12

?_247:  add     dword [ebp-0CH], 32                     ; 45C5 _ 83. 45, F4, 20
?_248:  mov     eax, dword [ebp-0CH]                    ; 45C9 _ 8B. 45, F4
        movzx   eax, byte [eax]                         ; 45CC _ 0F B6. 00
        test    al, al                                  ; 45CF _ 84. C0
        jne     ?_238                                   ; 45D1 _ 0F 85, FFFFFED4
?_249:  mov     edx, dword [ebp-1CH]                    ; 45D7 _ 8B. 55, E4
        mov     eax, dword [memman]                     ; 45DA _ A1, 00000000(d)
        mov     dword [esp+8H], 13                      ; 45DF _ C7. 44 24, 08, 0000000D
        mov     dword [esp+4H], edx                     ; 45E7 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 45EB _ 89. 04 24
        call    memman_free                             ; 45EE _ E8, FFFFFFFC(rel)
        leave                                           ; 45F3 _ C9
        ret                                             ; 45F4 _ C3
; file_loadfile End of function

intHandlerForStackOverFlow:; Function begin
        push    ebp                                     ; 45F5 _ 55
        mov     ebp, esp                                ; 45F6 _ 89. E5
        sub     esp, 40                                 ; 45F8 _ 83. EC, 28
        call    task_now                                ; 45FB _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 4600 _ 89. 45, F4
        mov     eax, dword [ebp-0CH]                    ; 4603 _ 8B. 45, F4
        mov     dword [eax+98H], 8                      ; 4606 _ C7. 80, 00000098, 00000008
        mov     dword [esp], ?_410                      ; 4610 _ C7. 04 24, 0000008E(d)
        call    cons_putstr                             ; 4617 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 461C _ 8B. 45, F4
        mov     dword [eax+98H], 8                      ; 461F _ C7. 80, 00000098, 00000008
        mov     eax, dword [ebp-0CH]                    ; 4629 _ 8B. 45, F4
        mov     eax, dword [eax+9CH]                    ; 462C _ 8B. 80, 0000009C
        lea     edx, [eax+10H]                          ; 4632 _ 8D. 50, 10
        mov     eax, dword [ebp-0CH]                    ; 4635 _ 8B. 45, F4
        mov     dword [eax+9CH], edx                    ; 4638 _ 89. 90, 0000009C
        mov     dword [esp], ?_411                      ; 463E _ C7. 04 24, 00000095(d)
        call    cons_putstr                             ; 4645 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 464A _ 8B. 45, F4
        mov     dword [eax+98H], 8                      ; 464D _ C7. 80, 00000098, 00000008
        mov     eax, dword [ebp-0CH]                    ; 4657 _ 8B. 45, F4
        mov     eax, dword [eax+9CH]                    ; 465A _ 8B. 80, 0000009C
        lea     edx, [eax+10H]                          ; 4660 _ 8D. 50, 10
        mov     eax, dword [ebp-0CH]                    ; 4663 _ 8B. 45, F4
        mov     dword [eax+9CH], edx                    ; 4666 _ 89. 90, 0000009C
        mov     eax, dword [ebp+8H]                     ; 466C _ 8B. 45, 08
        add     eax, 44                                 ; 466F _ 83. C0, 2C
        mov     eax, dword [eax]                        ; 4672 _ 8B. 00
        mov     dword [esp], eax                        ; 4674 _ 89. 04 24
        call    intToHexStr                             ; 4677 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 467C _ 89. 45, F0
        mov     dword [esp], ?_412                      ; 467F _ C7. 04 24, 000000A5(d)
        call    cons_putstr                             ; 4686 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 468B _ 8B. 45, F0
        mov     dword [esp], eax                        ; 468E _ 89. 04 24
        call    cons_putstr                             ; 4691 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 4696 _ 8B. 45, F4
        mov     dword [eax+98H], 8                      ; 4699 _ C7. 80, 00000098, 00000008
        mov     eax, dword [ebp-0CH]                    ; 46A3 _ 8B. 45, F4
        mov     eax, dword [eax+9CH]                    ; 46A6 _ 8B. 80, 0000009C
        lea     edx, [eax+10H]                          ; 46AC _ 8D. 50, 10
        mov     eax, dword [ebp-0CH]                    ; 46AF _ 8B. 45, F4
        mov     dword [eax+9CH], edx                    ; 46B2 _ 89. 90, 0000009C
        mov     eax, dword [ebp-0CH]                    ; 46B8 _ 8B. 45, F4
        add     eax, 48                                 ; 46BB _ 83. C0, 30
        leave                                           ; 46BE _ C9
        ret                                             ; 46BF _ C3
; intHandlerForStackOverFlow End of function

intHandlerForException:; Function begin
        push    ebp                                     ; 46C0 _ 55
        mov     ebp, esp                                ; 46C1 _ 89. E5
        sub     esp, 40                                 ; 46C3 _ 83. EC, 28
        call    task_now                                ; 46C6 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 46CB _ 89. 45, F4
        mov     eax, dword [ebp-0CH]                    ; 46CE _ 8B. 45, F4
        mov     dword [eax+98H], 8                      ; 46D1 _ C7. 80, 00000098, 00000008
        mov     dword [esp], ?_413                      ; 46DB _ C7. 04 24, 000000AC(d)
        call    cons_putstr                             ; 46E2 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 46E7 _ 8B. 45, F4
        mov     dword [eax+98H], 8                      ; 46EA _ C7. 80, 00000098, 00000008
        mov     eax, dword [ebp-0CH]                    ; 46F4 _ 8B. 45, F4
        mov     eax, dword [eax+9CH]                    ; 46F7 _ 8B. 80, 0000009C
        lea     edx, [eax+10H]                          ; 46FD _ 8D. 50, 10
        mov     eax, dword [ebp-0CH]                    ; 4700 _ 8B. 45, F4
        mov     dword [eax+9CH], edx                    ; 4703 _ 89. 90, 0000009C
        mov     dword [esp], ?_414                      ; 4709 _ C7. 04 24, 000000B4(d)
        call    cons_putstr                             ; 4710 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 4715 _ 8B. 45, F4
        mov     eax, dword [eax+9CH]                    ; 4718 _ 8B. 80, 0000009C
        lea     edx, [eax+10H]                          ; 471E _ 8D. 50, 10
        mov     eax, dword [ebp-0CH]                    ; 4721 _ 8B. 45, F4
        mov     dword [eax+9CH], edx                    ; 4724 _ 89. 90, 0000009C
        mov     eax, dword [ebp-0CH]                    ; 472A _ 8B. 45, F4
        mov     dword [eax+98H], 8                      ; 472D _ C7. 80, 00000098, 00000008
        mov     eax, dword [ebp-0CH]                    ; 4737 _ 8B. 45, F4
        add     eax, 48                                 ; 473A _ 83. C0, 30
        leave                                           ; 473D _ C9
        ret                                             ; 473E _ C3
; intHandlerForException End of function

memman_init:; Function begin
        push    ebp                                     ; 473F _ 55
        mov     ebp, esp                                ; 4740 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 4742 _ 8B. 45, 08
        mov     dword [eax], 0                          ; 4745 _ C7. 00, 00000000
        mov     eax, dword [ebp+8H]                     ; 474B _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 474E _ C7. 40, 04, 00000000
        mov     eax, dword [ebp+8H]                     ; 4755 _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 4758 _ C7. 40, 08, 00000000
        mov     eax, dword [ebp+8H]                     ; 475F _ 8B. 45, 08
        mov     dword [eax+0CH], 0                      ; 4762 _ C7. 40, 0C, 00000000
        pop     ebp                                     ; 4769 _ 5D
        ret                                             ; 476A _ C3
; memman_init End of function

memman_total:; Function begin
        push    ebp                                     ; 476B _ 55
        mov     ebp, esp                                ; 476C _ 89. E5
        sub     esp, 16                                 ; 476E _ 83. EC, 10
        mov     dword [ebp-4H], 0                       ; 4771 _ C7. 45, FC, 00000000
        mov     dword [ebp-8H], 0                       ; 4778 _ C7. 45, F8, 00000000
        jmp     ?_251                                   ; 477F _ EB, 14

?_250:  mov     eax, dword [ebp+8H]                     ; 4781 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 4784 _ 8B. 55, F8
        add     edx, 2                                  ; 4787 _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 478A _ 8B. 44 D0, 04
        add     dword [ebp-4H], eax                     ; 478E _ 01. 45, FC
        add     dword [ebp-8H], 1                       ; 4791 _ 83. 45, F8, 01
?_251:  mov     eax, dword [ebp+8H]                     ; 4795 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 4798 _ 8B. 00
        cmp     eax, dword [ebp-8H]                     ; 479A _ 3B. 45, F8
        ja      ?_250                                   ; 479D _ 77, E2
        mov     eax, dword [ebp-4H]                     ; 479F _ 8B. 45, FC
        leave                                           ; 47A2 _ C9
        ret                                             ; 47A3 _ C3
; memman_total End of function

memman_alloc:; Function begin
        push    ebp                                     ; 47A4 _ 55
        mov     ebp, esp                                ; 47A5 _ 89. E5
        push    ebx                                     ; 47A7 _ 53
        sub     esp, 16                                 ; 47A8 _ 83. EC, 10
        mov     dword [ebp-0CH], 0                      ; 47AB _ C7. 45, F4, 00000000
        jmp     ?_257                                   ; 47B2 _ E9, 000000BD

?_252:  mov     eax, dword [ebp+8H]                     ; 47B7 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 47BA _ 8B. 55, F4
        add     edx, 2                                  ; 47BD _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 47C0 _ 8B. 44 D0, 04
        cmp     eax, dword [ebp+0CH]                    ; 47C4 _ 3B. 45, 0C
        jc      ?_256                                   ; 47C7 _ 0F 82, 000000A3
        mov     eax, dword [ebp+8H]                     ; 47CD _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 47D0 _ 8B. 55, F4
        add     edx, 2                                  ; 47D3 _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 47D6 _ 8B. 04 D0
        mov     dword [ebp-8H], eax                     ; 47D9 _ 89. 45, F8
        mov     eax, dword [ebp+8H]                     ; 47DC _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 47DF _ 8B. 55, F4
        add     edx, 2                                  ; 47E2 _ 83. C2, 02
        mov     edx, dword [eax+edx*8]                  ; 47E5 _ 8B. 14 D0
        mov     eax, dword [ebp+0CH]                    ; 47E8 _ 8B. 45, 0C
        lea     ecx, [edx+eax]                          ; 47EB _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 47EE _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 47F1 _ 8B. 55, F4
        add     edx, 2                                  ; 47F4 _ 83. C2, 02
        mov     dword [eax+edx*8], ecx                  ; 47F7 _ 89. 0C D0
        mov     eax, dword [ebp+8H]                     ; 47FA _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 47FD _ 8B. 55, F4
        add     edx, 2                                  ; 4800 _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 4803 _ 8B. 44 D0, 04
        sub     eax, dword [ebp+0CH]                    ; 4807 _ 2B. 45, 0C
        mov     edx, eax                                ; 480A _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 480C _ 8B. 45, 08
        mov     ecx, dword [ebp-0CH]                    ; 480F _ 8B. 4D, F4
        add     ecx, 2                                  ; 4812 _ 83. C1, 02
        mov     dword [eax+ecx*8+4H], edx               ; 4815 _ 89. 54 C8, 04
        mov     eax, dword [ebp+8H]                     ; 4819 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 481C _ 8B. 55, F4
        add     edx, 2                                  ; 481F _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 4822 _ 8B. 44 D0, 04
        test    eax, eax                                ; 4826 _ 85. C0
        jnz     ?_255                                   ; 4828 _ 75, 41
        mov     eax, dword [ebp+8H]                     ; 482A _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 482D _ 8B. 00
        lea     edx, [eax-1H]                           ; 482F _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 4832 _ 8B. 45, 08
        mov     dword [eax], edx                        ; 4835 _ 89. 10
        jmp     ?_254                                   ; 4837 _ EB, 28

?_253:  mov     eax, dword [ebp-0CH]                    ; 4839 _ 8B. 45, F4
        lea     edx, [eax+1H]                           ; 483C _ 8D. 50, 01
        mov     ecx, dword [ebp+8H]                     ; 483F _ 8B. 4D, 08
        mov     eax, dword [ebp-0CH]                    ; 4842 _ 8B. 45, F4
        lea     ebx, [eax+2H]                           ; 4845 _ 8D. 58, 02
        mov     eax, dword [ebp+8H]                     ; 4848 _ 8B. 45, 08
        add     edx, 2                                  ; 484B _ 83. C2, 02
        lea     edx, [eax+edx*8]                        ; 484E _ 8D. 14 D0
        mov     eax, dword [edx]                        ; 4851 _ 8B. 02
        mov     edx, dword [edx+4H]                     ; 4853 _ 8B. 52, 04
        mov     dword [ecx+ebx*8], eax                  ; 4856 _ 89. 04 D9
        mov     dword [ecx+ebx*8+4H], edx               ; 4859 _ 89. 54 D9, 04
        add     dword [ebp-0CH], 1                      ; 485D _ 83. 45, F4, 01
?_254:  mov     eax, dword [ebp+8H]                     ; 4861 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 4864 _ 8B. 00
        cmp     eax, dword [ebp-0CH]                    ; 4866 _ 3B. 45, F4
        ja      ?_253                                   ; 4869 _ 77, CE
?_255:  mov     eax, dword [ebp-8H]                     ; 486B _ 8B. 45, F8
        jmp     ?_258                                   ; 486E _ EB, 17

?_256:  add     dword [ebp-0CH], 1                      ; 4870 _ 83. 45, F4, 01
?_257:  mov     eax, dword [ebp+8H]                     ; 4874 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 4877 _ 8B. 00
        cmp     eax, dword [ebp-0CH]                    ; 4879 _ 3B. 45, F4
        ja      ?_252                                   ; 487C _ 0F 87, FFFFFF35
        mov     eax, 0                                  ; 4882 _ B8, 00000000
?_258:  add     esp, 16                                 ; 4887 _ 83. C4, 10
        pop     ebx                                     ; 488A _ 5B
        pop     ebp                                     ; 488B _ 5D
        ret                                             ; 488C _ C3
; memman_alloc End of function

memman_free:; Function begin
        push    ebp                                     ; 488D _ 55
        mov     ebp, esp                                ; 488E _ 89. E5
        push    ebx                                     ; 4890 _ 53
        sub     esp, 16                                 ; 4891 _ 83. EC, 10
        mov     dword [ebp-0CH], 0                      ; 4894 _ C7. 45, F4, 00000000
        jmp     ?_261                                   ; 489B _ EB, 17

?_259:  mov     eax, dword [ebp+8H]                     ; 489D _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 48A0 _ 8B. 55, F4
        add     edx, 2                                  ; 48A3 _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 48A6 _ 8B. 04 D0
        cmp     eax, dword [ebp+0CH]                    ; 48A9 _ 3B. 45, 0C
        jbe     ?_260                                   ; 48AC _ 76, 02
        jmp     ?_262                                   ; 48AE _ EB, 0E

?_260:  add     dword [ebp-0CH], 1                      ; 48B0 _ 83. 45, F4, 01
?_261:  mov     eax, dword [ebp+8H]                     ; 48B4 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 48B7 _ 8B. 00
        cmp     eax, dword [ebp-0CH]                    ; 48B9 _ 3B. 45, F4
        jg      ?_259                                   ; 48BC _ 7F, DF
?_262:  cmp     dword [ebp-0CH], 0                      ; 48BE _ 83. 7D, F4, 00
        jle     ?_266                                   ; 48C2 _ 0F 8E, 000000F2
        mov     eax, dword [ebp-0CH]                    ; 48C8 _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 48CB _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 48CE _ 8B. 45, 08
        add     edx, 2                                  ; 48D1 _ 83. C2, 02
        mov     edx, dword [eax+edx*8]                  ; 48D4 _ 8B. 14 D0
        mov     eax, dword [ebp-0CH]                    ; 48D7 _ 8B. 45, F4
        lea     ecx, [eax-1H]                           ; 48DA _ 8D. 48, FF
        mov     eax, dword [ebp+8H]                     ; 48DD _ 8B. 45, 08
        add     ecx, 2                                  ; 48E0 _ 83. C1, 02
        mov     eax, dword [eax+ecx*8+4H]               ; 48E3 _ 8B. 44 C8, 04
        add     eax, edx                                ; 48E7 _ 01. D0
        cmp     eax, dword [ebp+0CH]                    ; 48E9 _ 3B. 45, 0C
        jne     ?_266                                   ; 48EC _ 0F 85, 000000C8
        mov     eax, dword [ebp-0CH]                    ; 48F2 _ 8B. 45, F4
        lea     ebx, [eax-1H]                           ; 48F5 _ 8D. 58, FF
        mov     eax, dword [ebp-0CH]                    ; 48F8 _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 48FB _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 48FE _ 8B. 45, 08
        add     edx, 2                                  ; 4901 _ 83. C2, 02
        mov     edx, dword [eax+edx*8+4H]               ; 4904 _ 8B. 54 D0, 04
        mov     eax, dword [ebp+10H]                    ; 4908 _ 8B. 45, 10
        lea     ecx, [edx+eax]                          ; 490B _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 490E _ 8B. 45, 08
        lea     edx, [ebx+2H]                           ; 4911 _ 8D. 53, 02
        mov     dword [eax+edx*8+4H], ecx               ; 4914 _ 89. 4C D0, 04
        mov     eax, dword [ebp+8H]                     ; 4918 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 491B _ 8B. 00
        cmp     eax, dword [ebp-0CH]                    ; 491D _ 3B. 45, F4
        jle     ?_265                                   ; 4920 _ 0F 8E, 0000008A
        mov     eax, dword [ebp+10H]                    ; 4926 _ 8B. 45, 10
        mov     edx, dword [ebp+0CH]                    ; 4929 _ 8B. 55, 0C
        lea     ecx, [edx+eax]                          ; 492C _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 492F _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 4932 _ 8B. 55, F4
        add     edx, 2                                  ; 4935 _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 4938 _ 8B. 04 D0
        cmp     ecx, eax                                ; 493B _ 39. C1
        jnz     ?_265                                   ; 493D _ 75, 71
        mov     eax, dword [ebp-0CH]                    ; 493F _ 8B. 45, F4
        lea     ebx, [eax-1H]                           ; 4942 _ 8D. 58, FF
        mov     eax, dword [ebp-0CH]                    ; 4945 _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 4948 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 494B _ 8B. 45, 08
        add     edx, 2                                  ; 494E _ 83. C2, 02
        mov     edx, dword [eax+edx*8+4H]               ; 4951 _ 8B. 54 D0, 04
        mov     eax, dword [ebp+8H]                     ; 4955 _ 8B. 45, 08
        mov     ecx, dword [ebp-0CH]                    ; 4958 _ 8B. 4D, F4
        add     ecx, 2                                  ; 495B _ 83. C1, 02
        mov     eax, dword [eax+ecx*8+4H]               ; 495E _ 8B. 44 C8, 04
        lea     ecx, [edx+eax]                          ; 4962 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 4965 _ 8B. 45, 08
        lea     edx, [ebx+2H]                           ; 4968 _ 8D. 53, 02
        mov     dword [eax+edx*8+4H], ecx               ; 496B _ 89. 4C D0, 04
        mov     eax, dword [ebp+8H]                     ; 496F _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 4972 _ 8B. 00
        lea     edx, [eax-1H]                           ; 4974 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 4977 _ 8B. 45, 08
        mov     dword [eax], edx                        ; 497A _ 89. 10
        jmp     ?_264                                   ; 497C _ EB, 28

?_263:  mov     eax, dword [ebp-0CH]                    ; 497E _ 8B. 45, F4
        lea     edx, [eax+1H]                           ; 4981 _ 8D. 50, 01
        mov     ecx, dword [ebp+8H]                     ; 4984 _ 8B. 4D, 08
        mov     eax, dword [ebp-0CH]                    ; 4987 _ 8B. 45, F4
        lea     ebx, [eax+2H]                           ; 498A _ 8D. 58, 02
        mov     eax, dword [ebp+8H]                     ; 498D _ 8B. 45, 08
        add     edx, 2                                  ; 4990 _ 83. C2, 02
        lea     edx, [eax+edx*8]                        ; 4993 _ 8D. 14 D0
        mov     eax, dword [edx]                        ; 4996 _ 8B. 02
        mov     edx, dword [edx+4H]                     ; 4998 _ 8B. 52, 04
        mov     dword [ecx+ebx*8], eax                  ; 499B _ 89. 04 D9
        mov     dword [ecx+ebx*8+4H], edx               ; 499E _ 89. 54 D9, 04
        add     dword [ebp-0CH], 1                      ; 49A2 _ 83. 45, F4, 01
?_264:  mov     eax, dword [ebp+8H]                     ; 49A6 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 49A9 _ 8B. 00
        cmp     eax, dword [ebp-0CH]                    ; 49AB _ 3B. 45, F4
        jg      ?_263                                   ; 49AE _ 7F, CE
?_265:  mov     eax, 0                                  ; 49B0 _ B8, 00000000
        jmp     ?_272                                   ; 49B5 _ E9, 0000011C

?_266:  mov     eax, dword [ebp+8H]                     ; 49BA _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 49BD _ 8B. 00
        cmp     eax, dword [ebp-0CH]                    ; 49BF _ 3B. 45, F4
        jle     ?_267                                   ; 49C2 _ 7E, 52
        mov     eax, dword [ebp+10H]                    ; 49C4 _ 8B. 45, 10
        mov     edx, dword [ebp+0CH]                    ; 49C7 _ 8B. 55, 0C
        lea     ecx, [edx+eax]                          ; 49CA _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 49CD _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 49D0 _ 8B. 55, F4
        add     edx, 2                                  ; 49D3 _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 49D6 _ 8B. 04 D0
        cmp     ecx, eax                                ; 49D9 _ 39. C1
        jnz     ?_267                                   ; 49DB _ 75, 39
        mov     eax, dword [ebp+8H]                     ; 49DD _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 49E0 _ 8B. 55, F4
        lea     ecx, [edx+2H]                           ; 49E3 _ 8D. 4A, 02
        mov     edx, dword [ebp+0CH]                    ; 49E6 _ 8B. 55, 0C
        mov     dword [eax+ecx*8], edx                  ; 49E9 _ 89. 14 C8
        mov     eax, dword [ebp+8H]                     ; 49EC _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 49EF _ 8B. 55, F4
        add     edx, 2                                  ; 49F2 _ 83. C2, 02
        mov     edx, dword [eax+edx*8+4H]               ; 49F5 _ 8B. 54 D0, 04
        mov     eax, dword [ebp+10H]                    ; 49F9 _ 8B. 45, 10
        lea     ecx, [edx+eax]                          ; 49FC _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 49FF _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 4A02 _ 8B. 55, F4
        add     edx, 2                                  ; 4A05 _ 83. C2, 02
        mov     dword [eax+edx*8+4H], ecx               ; 4A08 _ 89. 4C D0, 04
        mov     eax, 0                                  ; 4A0C _ B8, 00000000
        jmp     ?_272                                   ; 4A11 _ E9, 000000C0

?_267:  mov     eax, dword [ebp+8H]                     ; 4A16 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 4A19 _ 8B. 00
        cmp     eax, 4095                               ; 4A1B _ 3D, 00000FFF
        jg      ?_271                                   ; 4A20 _ 0F 8F, 00000087
        mov     eax, dword [ebp+8H]                     ; 4A26 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 4A29 _ 8B. 00
        mov     dword [ebp-8H], eax                     ; 4A2B _ 89. 45, F8
        jmp     ?_269                                   ; 4A2E _ EB, 28

?_268:  mov     eax, dword [ebp-8H]                     ; 4A30 _ 8B. 45, F8
        lea     edx, [eax-1H]                           ; 4A33 _ 8D. 50, FF
        mov     ecx, dword [ebp+8H]                     ; 4A36 _ 8B. 4D, 08
        mov     eax, dword [ebp-8H]                     ; 4A39 _ 8B. 45, F8
        lea     ebx, [eax+2H]                           ; 4A3C _ 8D. 58, 02
        mov     eax, dword [ebp+8H]                     ; 4A3F _ 8B. 45, 08
        add     edx, 2                                  ; 4A42 _ 83. C2, 02
        lea     edx, [eax+edx*8]                        ; 4A45 _ 8D. 14 D0
        mov     eax, dword [edx]                        ; 4A48 _ 8B. 02
        mov     edx, dword [edx+4H]                     ; 4A4A _ 8B. 52, 04
        mov     dword [ecx+ebx*8], eax                  ; 4A4D _ 89. 04 D9
        mov     dword [ecx+ebx*8+4H], edx               ; 4A50 _ 89. 54 D9, 04
        sub     dword [ebp-8H], 1                       ; 4A54 _ 83. 6D, F8, 01
?_269:  mov     eax, dword [ebp-8H]                     ; 4A58 _ 8B. 45, F8
        cmp     eax, dword [ebp-0CH]                    ; 4A5B _ 3B. 45, F4
        jg      ?_268                                   ; 4A5E _ 7F, D0
        mov     eax, dword [ebp+8H]                     ; 4A60 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 4A63 _ 8B. 00
        lea     edx, [eax+1H]                           ; 4A65 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 4A68 _ 8B. 45, 08
        mov     dword [eax], edx                        ; 4A6B _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 4A6D _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 4A70 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 4A73 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 4A76 _ 8B. 00
        cmp     edx, eax                                ; 4A78 _ 39. C2
        jge     ?_270                                   ; 4A7A _ 7D, 0B
        mov     eax, dword [ebp+8H]                     ; 4A7C _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 4A7F _ 8B. 10
        mov     eax, dword [ebp+8H]                     ; 4A81 _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 4A84 _ 89. 50, 04
?_270:  mov     eax, dword [ebp+8H]                     ; 4A87 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 4A8A _ 8B. 55, F4
        lea     ecx, [edx+2H]                           ; 4A8D _ 8D. 4A, 02
        mov     edx, dword [ebp+0CH]                    ; 4A90 _ 8B. 55, 0C
        mov     dword [eax+ecx*8], edx                  ; 4A93 _ 89. 14 C8
        mov     eax, dword [ebp+8H]                     ; 4A96 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 4A99 _ 8B. 55, F4
        lea     ecx, [edx+2H]                           ; 4A9C _ 8D. 4A, 02
        mov     edx, dword [ebp+10H]                    ; 4A9F _ 8B. 55, 10
        mov     dword [eax+ecx*8+4H], edx               ; 4AA2 _ 89. 54 C8, 04
        mov     eax, 0                                  ; 4AA6 _ B8, 00000000
        jmp     ?_272                                   ; 4AAB _ EB, 29

?_271:  mov     eax, dword [ebp+8H]                     ; 4AAD _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 4AB0 _ 8B. 40, 0C
        lea     edx, [eax+1H]                           ; 4AB3 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 4AB6 _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 4AB9 _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 4ABC _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 4ABF _ 8B. 40, 08
        mov     edx, eax                                ; 4AC2 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 4AC4 _ 8B. 45, 10
        add     eax, edx                                ; 4AC7 _ 01. D0
        mov     edx, eax                                ; 4AC9 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 4ACB _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 4ACE _ 89. 50, 08
        mov     eax, 4294967295                         ; 4AD1 _ B8, FFFFFFFF
?_272:  add     esp, 16                                 ; 4AD6 _ 83. C4, 10
        pop     ebx                                     ; 4AD9 _ 5B
        pop     ebp                                     ; 4ADA _ 5D
        ret                                             ; 4ADB _ C3
; memman_free End of function

memman_alloc_4k:; Function begin
        push    ebp                                     ; 4ADC _ 55
        mov     ebp, esp                                ; 4ADD _ 89. E5
        sub     esp, 24                                 ; 4ADF _ 83. EC, 18
        mov     eax, dword [ebp+0CH]                    ; 4AE2 _ 8B. 45, 0C
        add     eax, 4095                               ; 4AE5 _ 05, 00000FFF
        and     eax, 0FFFFF000H                         ; 4AEA _ 25, FFFFF000
        mov     dword [ebp+0CH], eax                    ; 4AEF _ 89. 45, 0C
        mov     eax, dword [ebp+0CH]                    ; 4AF2 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 4AF5 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 4AF9 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 4AFC _ 89. 04 24
        call    memman_alloc                            ; 4AFF _ E8, FFFFFFFC(rel)
        mov     dword [ebp-4H], eax                     ; 4B04 _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 4B07 _ 8B. 45, FC
        leave                                           ; 4B0A _ C9
        ret                                             ; 4B0B _ C3
; memman_alloc_4k End of function

memman_free_4k:; Function begin
        push    ebp                                     ; 4B0C _ 55
        mov     ebp, esp                                ; 4B0D _ 89. E5
        sub     esp, 28                                 ; 4B0F _ 83. EC, 1C
        mov     eax, dword [ebp+10H]                    ; 4B12 _ 8B. 45, 10
        add     eax, 4095                               ; 4B15 _ 05, 00000FFF
        and     eax, 0FFFFF000H                         ; 4B1A _ 25, FFFFF000
        mov     dword [ebp+10H], eax                    ; 4B1F _ 89. 45, 10
        mov     eax, dword [ebp+10H]                    ; 4B22 _ 8B. 45, 10
        mov     dword [esp+8H], eax                     ; 4B25 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 4B29 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 4B2C _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 4B30 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 4B33 _ 89. 04 24
        call    memman_free                             ; 4B36 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-4H], eax                     ; 4B3B _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 4B3E _ 8B. 45, FC
        leave                                           ; 4B41 _ C9
        ret                                             ; 4B42 _ C3
; memman_free_4k End of function

shtctl_init:; Function begin
        push    ebp                                     ; 4B43 _ 55
        mov     ebp, esp                                ; 4B44 _ 89. E5
        sub     esp, 40                                 ; 4B46 _ 83. EC, 28
        mov     dword [esp+4H], 9232                    ; 4B49 _ C7. 44 24, 04, 00002410
        mov     eax, dword [ebp+8H]                     ; 4B51 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 4B54 _ 89. 04 24
        call    memman_alloc_4k                         ; 4B57 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 4B5C _ 89. 45, F4
        cmp     dword [ebp-0CH], 0                      ; 4B5F _ 83. 7D, F4, 00
        jnz     ?_273                                   ; 4B63 _ 75, 0A
        mov     eax, 0                                  ; 4B65 _ B8, 00000000
        jmp     ?_277                                   ; 4B6A _ E9, 000000C0

?_273:  mov     eax, dword [ebp+10H]                    ; 4B6F _ 8B. 45, 10
        imul    eax, dword [ebp+14H]                    ; 4B72 _ 0F AF. 45, 14
        mov     dword [esp+4H], eax                     ; 4B76 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 4B7A _ 8B. 45, 08
        mov     dword [esp], eax                        ; 4B7D _ 89. 04 24
        call    memman_alloc_4k                         ; 4B80 _ E8, FFFFFFFC(rel)
        mov     edx, eax                                ; 4B85 _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 4B87 _ 8B. 45, F4
        mov     dword [eax+4H], edx                     ; 4B8A _ 89. 50, 04
        mov     eax, dword [ebp-0CH]                    ; 4B8D _ 8B. 45, F4
        mov     eax, dword [eax+4H]                     ; 4B90 _ 8B. 40, 04
        test    eax, eax                                ; 4B93 _ 85. C0
        jnz     ?_274                                   ; 4B95 _ 75, 21
        mov     eax, dword [ebp-0CH]                    ; 4B97 _ 8B. 45, F4
        mov     dword [esp+8H], 9232                    ; 4B9A _ C7. 44 24, 08, 00002410
        mov     dword [esp+4H], eax                     ; 4BA2 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 4BA6 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 4BA9 _ 89. 04 24
        call    memman_free_4k                          ; 4BAC _ E8, FFFFFFFC(rel)
        mov     eax, 0                                  ; 4BB1 _ B8, 00000000
        jmp     ?_277                                   ; 4BB6 _ EB, 77

?_274:  mov     eax, dword [ebp-0CH]                    ; 4BB8 _ 8B. 45, F4
        mov     edx, dword [ebp+0CH]                    ; 4BBB _ 8B. 55, 0C
        mov     dword [eax], edx                        ; 4BBE _ 89. 10
        mov     eax, dword [ebp-0CH]                    ; 4BC0 _ 8B. 45, F4
        mov     edx, dword [ebp+10H]                    ; 4BC3 _ 8B. 55, 10
        mov     dword [eax+8H], edx                     ; 4BC6 _ 89. 50, 08
        mov     eax, dword [ebp-0CH]                    ; 4BC9 _ 8B. 45, F4
        mov     edx, dword [ebp+14H]                    ; 4BCC _ 8B. 55, 14
        mov     dword [eax+0CH], edx                    ; 4BCF _ 89. 50, 0C
        mov     eax, dword [ebp-0CH]                    ; 4BD2 _ 8B. 45, F4
        mov     dword [eax+10H], -1                     ; 4BD5 _ C7. 40, 10, FFFFFFFF
        mov     dword [ebp-10H], 0                      ; 4BDC _ C7. 45, F0, 00000000
        jmp     ?_276                                   ; 4BE3 _ EB, 3E

?_275:  mov     ecx, dword [ebp-0CH]                    ; 4BE5 _ 8B. 4D, F4
        mov     edx, dword [ebp-10H]                    ; 4BE8 _ 8B. 55, F0
        mov     eax, edx                                ; 4BEB _ 89. D0
        shl     eax, 3                                  ; 4BED _ C1. E0, 03
        add     eax, edx                                ; 4BF0 _ 01. D0
        shl     eax, 2                                  ; 4BF2 _ C1. E0, 02
        add     eax, ecx                                ; 4BF5 _ 01. C8
        add     eax, 1072                               ; 4BF7 _ 05, 00000430
        mov     dword [eax], 0                          ; 4BFC _ C7. 00, 00000000
        mov     ecx, dword [ebp-0CH]                    ; 4C02 _ 8B. 4D, F4
        mov     edx, dword [ebp-10H]                    ; 4C05 _ 8B. 55, F0
        mov     eax, edx                                ; 4C08 _ 89. D0
        shl     eax, 3                                  ; 4C0A _ C1. E0, 03
        add     eax, edx                                ; 4C0D _ 01. D0
        shl     eax, 2                                  ; 4C0F _ C1. E0, 02
        add     eax, ecx                                ; 4C12 _ 01. C8
        add     eax, 1076                               ; 4C14 _ 05, 00000434
        mov     dword [eax], 0                          ; 4C19 _ C7. 00, 00000000
        add     dword [ebp-10H], 1                      ; 4C1F _ 83. 45, F0, 01
?_276:  cmp     dword [ebp-10H], 255                    ; 4C23 _ 81. 7D, F0, 000000FF
        jle     ?_275                                   ; 4C2A _ 7E, B9
        mov     eax, dword [ebp-0CH]                    ; 4C2C _ 8B. 45, F4
?_277:  leave                                           ; 4C2F _ C9
        ret                                             ; 4C30 _ C3
; shtctl_init End of function

sheet_alloc:; Function begin
        push    ebp                                     ; 4C31 _ 55
        mov     ebp, esp                                ; 4C32 _ 89. E5
        sub     esp, 24                                 ; 4C34 _ 83. EC, 18
        mov     dword [ebp-10H], 0                      ; 4C37 _ C7. 45, F0, 00000000
        jmp     ?_280                                   ; 4C3E _ EB, 63

?_278:  mov     ecx, dword [ebp+8H]                     ; 4C40 _ 8B. 4D, 08
        mov     edx, dword [ebp-10H]                    ; 4C43 _ 8B. 55, F0
        mov     eax, edx                                ; 4C46 _ 89. D0
        shl     eax, 3                                  ; 4C48 _ C1. E0, 03
        add     eax, edx                                ; 4C4B _ 01. D0
        shl     eax, 2                                  ; 4C4D _ C1. E0, 02
        add     eax, ecx                                ; 4C50 _ 01. C8
        add     eax, 1072                               ; 4C52 _ 05, 00000430
        mov     eax, dword [eax]                        ; 4C57 _ 8B. 00
        test    eax, eax                                ; 4C59 _ 85. C0
        jnz     ?_279                                   ; 4C5B _ 75, 42
        mov     edx, dword [ebp-10H]                    ; 4C5D _ 8B. 55, F0
        mov     eax, edx                                ; 4C60 _ 89. D0
        shl     eax, 3                                  ; 4C62 _ C1. E0, 03
        add     eax, edx                                ; 4C65 _ 01. D0
        shl     eax, 2                                  ; 4C67 _ C1. E0, 02
        lea     edx, [eax+410H]                         ; 4C6A _ 8D. 90, 00000410
        mov     eax, dword [ebp+8H]                     ; 4C70 _ 8B. 45, 08
        add     eax, edx                                ; 4C73 _ 01. D0
        add     eax, 4                                  ; 4C75 _ 83. C0, 04
        mov     dword [ebp-0CH], eax                    ; 4C78 _ 89. 45, F4
        mov     eax, dword [ebp-0CH]                    ; 4C7B _ 8B. 45, F4
        mov     dword [eax+1CH], 1                      ; 4C7E _ C7. 40, 1C, 00000001
        mov     eax, dword [ebp-0CH]                    ; 4C85 _ 8B. 45, F4
        mov     dword [eax+18H], -1                     ; 4C88 _ C7. 40, 18, FFFFFFFF
        call    task_now                                ; 4C8F _ E8, FFFFFFFC(rel)
        mov     edx, dword [ebp-0CH]                    ; 4C94 _ 8B. 55, F4
        mov     dword [edx+20H], eax                    ; 4C97 _ 89. 42, 20
        mov     eax, dword [ebp-0CH]                    ; 4C9A _ 8B. 45, F4
        jmp     ?_281                                   ; 4C9D _ EB, 12

?_279:  add     dword [ebp-10H], 1                      ; 4C9F _ 83. 45, F0, 01
?_280:  cmp     dword [ebp-10H], 255                    ; 4CA3 _ 81. 7D, F0, 000000FF
        jle     ?_278                                   ; 4CAA _ 7E, 94
        mov     eax, 0                                  ; 4CAC _ B8, 00000000
?_281:  leave                                           ; 4CB1 _ C9
        ret                                             ; 4CB2 _ C3
; sheet_alloc End of function

sheet_setbuf:; Function begin
        push    ebp                                     ; 4CB3 _ 55
        mov     ebp, esp                                ; 4CB4 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 4CB6 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 4CB9 _ 8B. 55, 0C
        mov     dword [eax], edx                        ; 4CBC _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 4CBE _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 4CC1 _ 8B. 55, 10
        mov     dword [eax+4H], edx                     ; 4CC4 _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 4CC7 _ 8B. 45, 08
        mov     edx, dword [ebp+14H]                    ; 4CCA _ 8B. 55, 14
        mov     dword [eax+8H], edx                     ; 4CCD _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 4CD0 _ 8B. 45, 08
        mov     edx, dword [ebp+18H]                    ; 4CD3 _ 8B. 55, 18
        mov     dword [eax+14H], edx                    ; 4CD6 _ 89. 50, 14
        nop                                             ; 4CD9 _ 90
        pop     ebp                                     ; 4CDA _ 5D
        ret                                             ; 4CDB _ C3
; sheet_setbuf End of function

sheet_updown:; Function begin
        push    ebp                                     ; 4CDC _ 55
        mov     ebp, esp                                ; 4CDD _ 89. E5
        push    edi                                     ; 4CDF _ 57
        push    esi                                     ; 4CE0 _ 56
        push    ebx                                     ; 4CE1 _ 53
        sub     esp, 60                                 ; 4CE2 _ 83. EC, 3C
        mov     eax, dword [ebp+0CH]                    ; 4CE5 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 4CE8 _ 8B. 40, 18
        mov     dword [ebp-1CH], eax                    ; 4CEB _ 89. 45, E4
        mov     eax, dword [ebp+8H]                     ; 4CEE _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 4CF1 _ 8B. 40, 10
        add     eax, 1                                  ; 4CF4 _ 83. C0, 01
        cmp     eax, dword [ebp+10H]                    ; 4CF7 _ 3B. 45, 10
        jge     ?_282                                   ; 4CFA _ 7D, 0C
        mov     eax, dword [ebp+8H]                     ; 4CFC _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 4CFF _ 8B. 40, 10
        add     eax, 1                                  ; 4D02 _ 83. C0, 01
        mov     dword [ebp+10H], eax                    ; 4D05 _ 89. 45, 10
?_282:  cmp     dword [ebp+10H], -1                     ; 4D08 _ 83. 7D, 10, FF
        jge     ?_283                                   ; 4D0C _ 7D, 07
        mov     dword [ebp+10H], -1                     ; 4D0E _ C7. 45, 10, FFFFFFFF
?_283:  mov     eax, dword [ebp+0CH]                    ; 4D15 _ 8B. 45, 0C
        mov     edx, dword [ebp+10H]                    ; 4D18 _ 8B. 55, 10
        mov     dword [eax+18H], edx                    ; 4D1B _ 89. 50, 18
        mov     eax, dword [ebp-1CH]                    ; 4D1E _ 8B. 45, E4
        cmp     eax, dword [ebp+10H]                    ; 4D21 _ 3B. 45, 10
        jle     ?_290                                   ; 4D24 _ 0F 8E, 00000212
        cmp     dword [ebp+10H], 0                      ; 4D2A _ 83. 7D, 10, 00
        js      ?_286                                   ; 4D2E _ 0F 88, 000000FE
        mov     eax, dword [ebp-1CH]                    ; 4D34 _ 8B. 45, E4
        mov     dword [ebp-20H], eax                    ; 4D37 _ 89. 45, E0
        jmp     ?_285                                   ; 4D3A _ EB, 34

?_284:  mov     eax, dword [ebp-20H]                    ; 4D3C _ 8B. 45, E0
        lea     edx, [eax-1H]                           ; 4D3F _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 4D42 _ 8B. 45, 08
        add     edx, 4                                  ; 4D45 _ 83. C2, 04
        mov     edx, dword [eax+edx*4+4H]               ; 4D48 _ 8B. 54 90, 04
        mov     eax, dword [ebp+8H]                     ; 4D4C _ 8B. 45, 08
        mov     ecx, dword [ebp-20H]                    ; 4D4F _ 8B. 4D, E0
        add     ecx, 4                                  ; 4D52 _ 83. C1, 04
        mov     dword [eax+ecx*4+4H], edx               ; 4D55 _ 89. 54 88, 04
        mov     eax, dword [ebp+8H]                     ; 4D59 _ 8B. 45, 08
        mov     edx, dword [ebp-20H]                    ; 4D5C _ 8B. 55, E0
        add     edx, 4                                  ; 4D5F _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 4D62 _ 8B. 44 90, 04
        mov     edx, dword [ebp-20H]                    ; 4D66 _ 8B. 55, E0
        mov     dword [eax+18H], edx                    ; 4D69 _ 89. 50, 18
        sub     dword [ebp-20H], 1                      ; 4D6C _ 83. 6D, E0, 01
?_285:  mov     eax, dword [ebp-20H]                    ; 4D70 _ 8B. 45, E0
        cmp     eax, dword [ebp+10H]                    ; 4D73 _ 3B. 45, 10
        jg      ?_284                                   ; 4D76 _ 7F, C4
        mov     eax, dword [ebp+8H]                     ; 4D78 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 4D7B _ 8B. 55, 10
        lea     ecx, [edx+4H]                           ; 4D7E _ 8D. 4A, 04
        mov     edx, dword [ebp+0CH]                    ; 4D81 _ 8B. 55, 0C
        mov     dword [eax+ecx*4+4H], edx               ; 4D84 _ 89. 54 88, 04
        mov     eax, dword [ebp+10H]                    ; 4D88 _ 8B. 45, 10
        lea     esi, [eax+1H]                           ; 4D8B _ 8D. 70, 01
        mov     eax, dword [ebp+0CH]                    ; 4D8E _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 4D91 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 4D94 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 4D97 _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 4D9A _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 4D9D _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 4DA0 _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 4DA3 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 4DA6 _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 4DA9 _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 4DAC _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 4DAF _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 4DB2 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 4DB5 _ 8B. 40, 0C
        mov     dword [esp+14H], esi                    ; 4DB8 _ 89. 74 24, 14
        mov     dword [esp+10H], ebx                    ; 4DBC _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 4DC0 _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 4DC4 _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 4DC8 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 4DCC _ 8B. 45, 08
        mov     dword [esp], eax                        ; 4DCF _ 89. 04 24
        call    sheet_refreshmap                        ; 4DD2 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 4DD7 _ 8B. 45, 10
        lea     edi, [eax+1H]                           ; 4DDA _ 8D. 78, 01
        mov     eax, dword [ebp+0CH]                    ; 4DDD _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 4DE0 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 4DE3 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 4DE6 _ 8B. 40, 08
        lea     esi, [edx+eax]                          ; 4DE9 _ 8D. 34 02
        mov     eax, dword [ebp+0CH]                    ; 4DEC _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 4DEF _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 4DF2 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 4DF5 _ 8B. 40, 04
        lea     ebx, [edx+eax]                          ; 4DF8 _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 4DFB _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 4DFE _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 4E01 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 4E04 _ 8B. 40, 0C
        mov     ecx, dword [ebp-1CH]                    ; 4E07 _ 8B. 4D, E4
        mov     dword [esp+18H], ecx                    ; 4E0A _ 89. 4C 24, 18
        mov     dword [esp+14H], edi                    ; 4E0E _ 89. 7C 24, 14
        mov     dword [esp+10H], esi                    ; 4E12 _ 89. 74 24, 10
        mov     dword [esp+0CH], ebx                    ; 4E16 _ 89. 5C 24, 0C
        mov     dword [esp+8H], edx                     ; 4E1A _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 4E1E _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 4E22 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 4E25 _ 89. 04 24
        call    sheet_refreshsub                        ; 4E28 _ E8, FFFFFFFC(rel)
        jmp     ?_297                                   ; 4E2D _ E9, 0000027D

?_286:  mov     eax, dword [ebp+8H]                     ; 4E32 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 4E35 _ 8B. 40, 10
        cmp     eax, dword [ebp-1CH]                    ; 4E38 _ 3B. 45, E4
        jle     ?_289                                   ; 4E3B _ 7E, 47
        mov     eax, dword [ebp-1CH]                    ; 4E3D _ 8B. 45, E4
        mov     dword [ebp-20H], eax                    ; 4E40 _ 89. 45, E0
        jmp     ?_288                                   ; 4E43 _ EB, 34

?_287:  mov     eax, dword [ebp-20H]                    ; 4E45 _ 8B. 45, E0
        lea     edx, [eax+1H]                           ; 4E48 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 4E4B _ 8B. 45, 08
        add     edx, 4                                  ; 4E4E _ 83. C2, 04
        mov     edx, dword [eax+edx*4+4H]               ; 4E51 _ 8B. 54 90, 04
        mov     eax, dword [ebp+8H]                     ; 4E55 _ 8B. 45, 08
        mov     ecx, dword [ebp-20H]                    ; 4E58 _ 8B. 4D, E0
        add     ecx, 4                                  ; 4E5B _ 83. C1, 04
        mov     dword [eax+ecx*4+4H], edx               ; 4E5E _ 89. 54 88, 04
        mov     eax, dword [ebp+8H]                     ; 4E62 _ 8B. 45, 08
        mov     edx, dword [ebp-20H]                    ; 4E65 _ 8B. 55, E0
        add     edx, 4                                  ; 4E68 _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 4E6B _ 8B. 44 90, 04
        mov     edx, dword [ebp-20H]                    ; 4E6F _ 8B. 55, E0
        mov     dword [eax+18H], edx                    ; 4E72 _ 89. 50, 18
        add     dword [ebp-20H], 1                      ; 4E75 _ 83. 45, E0, 01
?_288:  mov     eax, dword [ebp+8H]                     ; 4E79 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 4E7C _ 8B. 40, 10
        cmp     eax, dword [ebp-20H]                    ; 4E7F _ 3B. 45, E0
        jg      ?_287                                   ; 4E82 _ 7F, C1
?_289:  mov     eax, dword [ebp+8H]                     ; 4E84 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 4E87 _ 8B. 40, 10
        lea     edx, [eax-1H]                           ; 4E8A _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 4E8D _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 4E90 _ 89. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 4E93 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 4E96 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 4E99 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 4E9C _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 4E9F _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 4EA2 _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 4EA5 _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 4EA8 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 4EAB _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 4EAE _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 4EB1 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 4EB4 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 4EB7 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 4EBA _ 8B. 40, 0C
        mov     dword [esp+14H], 0                      ; 4EBD _ C7. 44 24, 14, 00000000
        mov     dword [esp+10H], ebx                    ; 4EC5 _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 4EC9 _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 4ECD _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 4ED1 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 4ED5 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 4ED8 _ 89. 04 24
        call    sheet_refreshmap                        ; 4EDB _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-1CH]                    ; 4EE0 _ 8B. 45, E4
        lea     esi, [eax-1H]                           ; 4EE3 _ 8D. 70, FF
        mov     eax, dword [ebp+0CH]                    ; 4EE6 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 4EE9 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 4EEC _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 4EEF _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 4EF2 _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 4EF5 _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 4EF8 _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 4EFB _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 4EFE _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 4F01 _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 4F04 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 4F07 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 4F0A _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 4F0D _ 8B. 40, 0C
        mov     dword [esp+18H], esi                    ; 4F10 _ 89. 74 24, 18
        mov     dword [esp+14H], 0                      ; 4F14 _ C7. 44 24, 14, 00000000
        mov     dword [esp+10H], ebx                    ; 4F1C _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 4F20 _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 4F24 _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 4F28 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 4F2C _ 8B. 45, 08
        mov     dword [esp], eax                        ; 4F2F _ 89. 04 24
        call    sheet_refreshsub                        ; 4F32 _ E8, FFFFFFFC(rel)
        jmp     ?_297                                   ; 4F37 _ E9, 00000173

?_290:  mov     eax, dword [ebp-1CH]                    ; 4F3C _ 8B. 45, E4
        cmp     eax, dword [ebp+10H]                    ; 4F3F _ 3B. 45, 10
        jge     ?_297                                   ; 4F42 _ 0F 8D, 00000167
        cmp     dword [ebp-1CH], 0                      ; 4F48 _ 83. 7D, E4, 00
        js      ?_293                                   ; 4F4C _ 78, 56
        mov     eax, dword [ebp-1CH]                    ; 4F4E _ 8B. 45, E4
        mov     dword [ebp-20H], eax                    ; 4F51 _ 89. 45, E0
        jmp     ?_292                                   ; 4F54 _ EB, 34

?_291:  mov     eax, dword [ebp-20H]                    ; 4F56 _ 8B. 45, E0
        lea     edx, [eax+1H]                           ; 4F59 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 4F5C _ 8B. 45, 08
        add     edx, 4                                  ; 4F5F _ 83. C2, 04
        mov     edx, dword [eax+edx*4+4H]               ; 4F62 _ 8B. 54 90, 04
        mov     eax, dword [ebp+8H]                     ; 4F66 _ 8B. 45, 08
        mov     ecx, dword [ebp-20H]                    ; 4F69 _ 8B. 4D, E0
        add     ecx, 4                                  ; 4F6C _ 83. C1, 04
        mov     dword [eax+ecx*4+4H], edx               ; 4F6F _ 89. 54 88, 04
        mov     eax, dword [ebp+8H]                     ; 4F73 _ 8B. 45, 08
        mov     edx, dword [ebp-20H]                    ; 4F76 _ 8B. 55, E0
        add     edx, 4                                  ; 4F79 _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 4F7C _ 8B. 44 90, 04
        mov     edx, dword [ebp-20H]                    ; 4F80 _ 8B. 55, E0
        mov     dword [eax+18H], edx                    ; 4F83 _ 89. 50, 18
        add     dword [ebp-20H], 1                      ; 4F86 _ 83. 45, E0, 01
?_292:  mov     eax, dword [ebp-20H]                    ; 4F8A _ 8B. 45, E0
        cmp     eax, dword [ebp+10H]                    ; 4F8D _ 3B. 45, 10
        jl      ?_291                                   ; 4F90 _ 7C, C4
        mov     eax, dword [ebp+8H]                     ; 4F92 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 4F95 _ 8B. 55, 10
        lea     ecx, [edx+4H]                           ; 4F98 _ 8D. 4A, 04
        mov     edx, dword [ebp+0CH]                    ; 4F9B _ 8B. 55, 0C
        mov     dword [eax+ecx*4+4H], edx               ; 4F9E _ 89. 54 88, 04
        jmp     ?_296                                   ; 4FA2 _ EB, 6C

?_293:  mov     eax, dword [ebp+8H]                     ; 4FA4 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 4FA7 _ 8B. 40, 10
        mov     dword [ebp-20H], eax                    ; 4FAA _ 89. 45, E0
        jmp     ?_295                                   ; 4FAD _ EB, 3A

?_294:  mov     eax, dword [ebp-20H]                    ; 4FAF _ 8B. 45, E0
        lea     ecx, [eax+1H]                           ; 4FB2 _ 8D. 48, 01
        mov     eax, dword [ebp+8H]                     ; 4FB5 _ 8B. 45, 08
        mov     edx, dword [ebp-20H]                    ; 4FB8 _ 8B. 55, E0
        add     edx, 4                                  ; 4FBB _ 83. C2, 04
        mov     edx, dword [eax+edx*4+4H]               ; 4FBE _ 8B. 54 90, 04
        mov     eax, dword [ebp+8H]                     ; 4FC2 _ 8B. 45, 08
        add     ecx, 4                                  ; 4FC5 _ 83. C1, 04
        mov     dword [eax+ecx*4+4H], edx               ; 4FC8 _ 89. 54 88, 04
        mov     eax, dword [ebp-20H]                    ; 4FCC _ 8B. 45, E0
        lea     edx, [eax+1H]                           ; 4FCF _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 4FD2 _ 8B. 45, 08
        add     edx, 4                                  ; 4FD5 _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 4FD8 _ 8B. 44 90, 04
        mov     edx, dword [ebp-20H]                    ; 4FDC _ 8B. 55, E0
        add     edx, 1                                  ; 4FDF _ 83. C2, 01
        mov     dword [eax+18H], edx                    ; 4FE2 _ 89. 50, 18
        sub     dword [ebp-20H], 1                      ; 4FE5 _ 83. 6D, E0, 01
?_295:  mov     eax, dword [ebp-20H]                    ; 4FE9 _ 8B. 45, E0
        cmp     eax, dword [ebp+10H]                    ; 4FEC _ 3B. 45, 10
        jge     ?_294                                   ; 4FEF _ 7D, BE
        mov     eax, dword [ebp+8H]                     ; 4FF1 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 4FF4 _ 8B. 55, 10
        lea     ecx, [edx+4H]                           ; 4FF7 _ 8D. 4A, 04
        mov     edx, dword [ebp+0CH]                    ; 4FFA _ 8B. 55, 0C
        mov     dword [eax+ecx*4+4H], edx               ; 4FFD _ 89. 54 88, 04
        mov     eax, dword [ebp+8H]                     ; 5001 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 5004 _ 8B. 40, 10
        lea     edx, [eax+1H]                           ; 5007 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 500A _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 500D _ 89. 50, 10
?_296:  mov     eax, dword [ebp+0CH]                    ; 5010 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 5013 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 5016 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 5019 _ 8B. 40, 08
        lea     esi, [edx+eax]                          ; 501C _ 8D. 34 02
        mov     eax, dword [ebp+0CH]                    ; 501F _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 5022 _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 5025 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 5028 _ 8B. 40, 04
        lea     ebx, [edx+eax]                          ; 502B _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 502E _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 5031 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 5034 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 5037 _ 8B. 40, 0C
        mov     ecx, dword [ebp+10H]                    ; 503A _ 8B. 4D, 10
        mov     dword [esp+14H], ecx                    ; 503D _ 89. 4C 24, 14
        mov     dword [esp+10H], esi                    ; 5041 _ 89. 74 24, 10
        mov     dword [esp+0CH], ebx                    ; 5045 _ 89. 5C 24, 0C
        mov     dword [esp+8H], edx                     ; 5049 _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 504D _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 5051 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 5054 _ 89. 04 24
        call    sheet_refreshmap                        ; 5057 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+0CH]                    ; 505C _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 505F _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 5062 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 5065 _ 8B. 40, 08
        lea     esi, [edx+eax]                          ; 5068 _ 8D. 34 02
        mov     eax, dword [ebp+0CH]                    ; 506B _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 506E _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 5071 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 5074 _ 8B. 40, 04
        lea     ebx, [edx+eax]                          ; 5077 _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 507A _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 507D _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 5080 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 5083 _ 8B. 40, 0C
        mov     ecx, dword [ebp+10H]                    ; 5086 _ 8B. 4D, 10
        mov     dword [esp+18H], ecx                    ; 5089 _ 89. 4C 24, 18
        mov     ecx, dword [ebp+10H]                    ; 508D _ 8B. 4D, 10
        mov     dword [esp+14H], ecx                    ; 5090 _ 89. 4C 24, 14
        mov     dword [esp+10H], esi                    ; 5094 _ 89. 74 24, 10
        mov     dword [esp+0CH], ebx                    ; 5098 _ 89. 5C 24, 0C
        mov     dword [esp+8H], edx                     ; 509C _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 50A0 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 50A4 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 50A7 _ 89. 04 24
        call    sheet_refreshsub                        ; 50AA _ E8, FFFFFFFC(rel)
?_297:  add     esp, 60                                 ; 50AF _ 83. C4, 3C
        pop     ebx                                     ; 50B2 _ 5B
        pop     esi                                     ; 50B3 _ 5E
        pop     edi                                     ; 50B4 _ 5F
        pop     ebp                                     ; 50B5 _ 5D
        ret                                             ; 50B6 _ C3
; sheet_updown End of function

sheet_refresh:; Function begin
        push    ebp                                     ; 50B7 _ 55
        mov     ebp, esp                                ; 50B8 _ 89. E5
        push    edi                                     ; 50BA _ 57
        push    esi                                     ; 50BB _ 56
        push    ebx                                     ; 50BC _ 53
        sub     esp, 44                                 ; 50BD _ 83. EC, 2C
        mov     eax, dword [ebp+0CH]                    ; 50C0 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 50C3 _ 8B. 40, 18
        test    eax, eax                                ; 50C6 _ 85. C0
        js      ?_298                                   ; 50C8 _ 78, 61
        mov     eax, dword [ebp+0CH]                    ; 50CA _ 8B. 45, 0C
        mov     ebx, dword [eax+18H]                    ; 50CD _ 8B. 58, 18
        mov     eax, dword [ebp+0CH]                    ; 50D0 _ 8B. 45, 0C
        mov     ecx, dword [eax+18H]                    ; 50D3 _ 8B. 48, 18
        mov     eax, dword [ebp+0CH]                    ; 50D6 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 50D9 _ 8B. 50, 10
        mov     eax, dword [ebp+1CH]                    ; 50DC _ 8B. 45, 1C
        lea     edi, [edx+eax]                          ; 50DF _ 8D. 3C 02
        mov     eax, dword [ebp+0CH]                    ; 50E2 _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 50E5 _ 8B. 50, 0C
        mov     eax, dword [ebp+18H]                    ; 50E8 _ 8B. 45, 18
        lea     esi, [edx+eax]                          ; 50EB _ 8D. 34 02
        mov     eax, dword [ebp+0CH]                    ; 50EE _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 50F1 _ 8B. 50, 10
        mov     eax, dword [ebp+14H]                    ; 50F4 _ 8B. 45, 14
        add     edx, eax                                ; 50F7 _ 01. C2
        mov     eax, dword [ebp+0CH]                    ; 50F9 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 50FC _ 8B. 40, 0C
        mov     dword [ebp-1CH], eax                    ; 50FF _ 89. 45, E4
        mov     eax, dword [ebp+10H]                    ; 5102 _ 8B. 45, 10
        add     eax, dword [ebp-1CH]                    ; 5105 _ 03. 45, E4
        mov     dword [esp+18H], ebx                    ; 5108 _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 510C _ 89. 4C 24, 14
        mov     dword [esp+10H], edi                    ; 5110 _ 89. 7C 24, 10
        mov     dword [esp+0CH], esi                    ; 5114 _ 89. 74 24, 0C
        mov     dword [esp+8H], edx                     ; 5118 _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 511C _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 5120 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 5123 _ 89. 04 24
        call    sheet_refreshsub                        ; 5126 _ E8, FFFFFFFC(rel)
?_298:  mov     eax, 0                                  ; 512B _ B8, 00000000
        add     esp, 44                                 ; 5130 _ 83. C4, 2C
        pop     ebx                                     ; 5133 _ 5B
        pop     esi                                     ; 5134 _ 5E
        pop     edi                                     ; 5135 _ 5F
        pop     ebp                                     ; 5136 _ 5D
        ret                                             ; 5137 _ C3
; sheet_refresh End of function

sheet_slide:; Function begin
        push    ebp                                     ; 5138 _ 55
        mov     ebp, esp                                ; 5139 _ 89. E5
        push    esi                                     ; 513B _ 56
        push    ebx                                     ; 513C _ 53
        sub     esp, 48                                 ; 513D _ 83. EC, 30
        mov     eax, dword [ebp+0CH]                    ; 5140 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 5143 _ 8B. 40, 0C
        mov     dword [ebp-10H], eax                    ; 5146 _ 89. 45, F0
        mov     eax, dword [ebp+0CH]                    ; 5149 _ 8B. 45, 0C
        mov     eax, dword [eax+10H]                    ; 514C _ 8B. 40, 10
        mov     dword [ebp-0CH], eax                    ; 514F _ 89. 45, F4
        mov     eax, dword [ebp+0CH]                    ; 5152 _ 8B. 45, 0C
        mov     edx, dword [ebp+10H]                    ; 5155 _ 8B. 55, 10
        mov     dword [eax+0CH], edx                    ; 5158 _ 89. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 515B _ 8B. 45, 0C
        mov     edx, dword [ebp+14H]                    ; 515E _ 8B. 55, 14
        mov     dword [eax+10H], edx                    ; 5161 _ 89. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 5164 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 5167 _ 8B. 40, 18
        test    eax, eax                                ; 516A _ 85. C0
        js      ?_299                                   ; 516C _ 0F 88, 00000117
        mov     eax, dword [ebp+0CH]                    ; 5172 _ 8B. 45, 0C
        mov     edx, dword [eax+8H]                     ; 5175 _ 8B. 50, 08
        mov     eax, dword [ebp-0CH]                    ; 5178 _ 8B. 45, F4
        add     edx, eax                                ; 517B _ 01. C2
        mov     eax, dword [ebp+0CH]                    ; 517D _ 8B. 45, 0C
        mov     ecx, dword [eax+4H]                     ; 5180 _ 8B. 48, 04
        mov     eax, dword [ebp-10H]                    ; 5183 _ 8B. 45, F0
        add     eax, ecx                                ; 5186 _ 01. C8
        mov     dword [esp+14H], 0                      ; 5188 _ C7. 44 24, 14, 00000000
        mov     dword [esp+10H], edx                    ; 5190 _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 5194 _ 89. 44 24, 0C
        mov     eax, dword [ebp-0CH]                    ; 5198 _ 8B. 45, F4
        mov     dword [esp+8H], eax                     ; 519B _ 89. 44 24, 08
        mov     eax, dword [ebp-10H]                    ; 519F _ 8B. 45, F0
        mov     dword [esp+4H], eax                     ; 51A2 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 51A6 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 51A9 _ 89. 04 24
        call    sheet_refreshmap                        ; 51AC _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+0CH]                    ; 51B1 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 51B4 _ 8B. 40, 18
        mov     edx, dword [ebp+0CH]                    ; 51B7 _ 8B. 55, 0C
        mov     ecx, dword [edx+8H]                     ; 51BA _ 8B. 4A, 08
        mov     edx, dword [ebp+14H]                    ; 51BD _ 8B. 55, 14
        add     ecx, edx                                ; 51C0 _ 01. D1
        mov     edx, dword [ebp+0CH]                    ; 51C2 _ 8B. 55, 0C
        mov     ebx, dword [edx+4H]                     ; 51C5 _ 8B. 5A, 04
        mov     edx, dword [ebp+10H]                    ; 51C8 _ 8B. 55, 10
        add     edx, ebx                                ; 51CB _ 01. DA
        mov     dword [esp+14H], eax                    ; 51CD _ 89. 44 24, 14
        mov     dword [esp+10H], ecx                    ; 51D1 _ 89. 4C 24, 10
        mov     dword [esp+0CH], edx                    ; 51D5 _ 89. 54 24, 0C
        mov     eax, dword [ebp+14H]                    ; 51D9 _ 8B. 45, 14
        mov     dword [esp+8H], eax                     ; 51DC _ 89. 44 24, 08
        mov     eax, dword [ebp+10H]                    ; 51E0 _ 8B. 45, 10
        mov     dword [esp+4H], eax                     ; 51E3 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 51E7 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 51EA _ 89. 04 24
        call    sheet_refreshmap                        ; 51ED _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+0CH]                    ; 51F2 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 51F5 _ 8B. 40, 18
        lea     ecx, [eax-1H]                           ; 51F8 _ 8D. 48, FF
        mov     eax, dword [ebp+0CH]                    ; 51FB _ 8B. 45, 0C
        mov     edx, dword [eax+8H]                     ; 51FE _ 8B. 50, 08
        mov     eax, dword [ebp-0CH]                    ; 5201 _ 8B. 45, F4
        add     edx, eax                                ; 5204 _ 01. C2
        mov     eax, dword [ebp+0CH]                    ; 5206 _ 8B. 45, 0C
        mov     ebx, dword [eax+4H]                     ; 5209 _ 8B. 58, 04
        mov     eax, dword [ebp-10H]                    ; 520C _ 8B. 45, F0
        add     eax, ebx                                ; 520F _ 01. D8
        mov     dword [esp+18H], ecx                    ; 5211 _ 89. 4C 24, 18
        mov     dword [esp+14H], 0                      ; 5215 _ C7. 44 24, 14, 00000000
        mov     dword [esp+10H], edx                    ; 521D _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 5221 _ 89. 44 24, 0C
        mov     eax, dword [ebp-0CH]                    ; 5225 _ 8B. 45, F4
        mov     dword [esp+8H], eax                     ; 5228 _ 89. 44 24, 08
        mov     eax, dword [ebp-10H]                    ; 522C _ 8B. 45, F0
        mov     dword [esp+4H], eax                     ; 522F _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 5233 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 5236 _ 89. 04 24
        call    sheet_refreshsub                        ; 5239 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+0CH]                    ; 523E _ 8B. 45, 0C
        mov     edx, dword [eax+18H]                    ; 5241 _ 8B. 50, 18
        mov     eax, dword [ebp+0CH]                    ; 5244 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 5247 _ 8B. 40, 18
        mov     ecx, dword [ebp+0CH]                    ; 524A _ 8B. 4D, 0C
        mov     ebx, dword [ecx+8H]                     ; 524D _ 8B. 59, 08
        mov     ecx, dword [ebp+14H]                    ; 5250 _ 8B. 4D, 14
        add     ebx, ecx                                ; 5253 _ 01. CB
        mov     ecx, dword [ebp+0CH]                    ; 5255 _ 8B. 4D, 0C
        mov     esi, dword [ecx+4H]                     ; 5258 _ 8B. 71, 04
        mov     ecx, dword [ebp+10H]                    ; 525B _ 8B. 4D, 10
        add     ecx, esi                                ; 525E _ 01. F1
        mov     dword [esp+18H], edx                    ; 5260 _ 89. 54 24, 18
        mov     dword [esp+14H], eax                    ; 5264 _ 89. 44 24, 14
        mov     dword [esp+10H], ebx                    ; 5268 _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 526C _ 89. 4C 24, 0C
        mov     eax, dword [ebp+14H]                    ; 5270 _ 8B. 45, 14
        mov     dword [esp+8H], eax                     ; 5273 _ 89. 44 24, 08
        mov     eax, dword [ebp+10H]                    ; 5277 _ 8B. 45, 10
        mov     dword [esp+4H], eax                     ; 527A _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 527E _ 8B. 45, 08
        mov     dword [esp], eax                        ; 5281 _ 89. 04 24
        call    sheet_refreshsub                        ; 5284 _ E8, FFFFFFFC(rel)
?_299:  add     esp, 48                                 ; 5289 _ 83. C4, 30
        pop     ebx                                     ; 528C _ 5B
        pop     esi                                     ; 528D _ 5E
        pop     ebp                                     ; 528E _ 5D
        ret                                             ; 528F _ C3
; sheet_slide End of function

sheet_refreshsub:; Function begin
        push    ebp                                     ; 5290 _ 55
        mov     ebp, esp                                ; 5291 _ 89. E5
        sub     esp, 64                                 ; 5293 _ 83. EC, 40
        mov     eax, dword [ebp+8H]                     ; 5296 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 5299 _ 8B. 00
        mov     dword [ebp-20H], eax                    ; 529B _ 89. 45, E0
        mov     eax, dword [ebp+8H]                     ; 529E _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 52A1 _ 8B. 40, 04
        mov     dword [ebp-1CH], eax                    ; 52A4 _ 89. 45, E4
        cmp     dword [ebp+0CH], 0                      ; 52A7 _ 83. 7D, 0C, 00
        jns     ?_300                                   ; 52AB _ 79, 07
        mov     dword [ebp+0CH], 0                      ; 52AD _ C7. 45, 0C, 00000000
?_300:  cmp     dword [ebp+10H], 8                      ; 52B4 _ 83. 7D, 10, 08
        jg      ?_301                                   ; 52B8 _ 7F, 07
        mov     dword [ebp+10H], 0                      ; 52BA _ C7. 45, 10, 00000000
?_301:  mov     eax, dword [ebp+8H]                     ; 52C1 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 52C4 _ 8B. 40, 08
        cmp     eax, dword [ebp+14H]                    ; 52C7 _ 3B. 45, 14
        jge     ?_302                                   ; 52CA _ 7D, 09
        mov     eax, dword [ebp+8H]                     ; 52CC _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 52CF _ 8B. 40, 08
        mov     dword [ebp+14H], eax                    ; 52D2 _ 89. 45, 14
?_302:  mov     eax, dword [ebp+8H]                     ; 52D5 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 52D8 _ 8B. 40, 0C
        cmp     eax, dword [ebp+18H]                    ; 52DB _ 3B. 45, 18
        jge     ?_303                                   ; 52DE _ 7D, 09
        mov     eax, dword [ebp+8H]                     ; 52E0 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 52E3 _ 8B. 40, 0C
        mov     dword [ebp+18H], eax                    ; 52E6 _ 89. 45, 18
?_303:  mov     eax, dword [ebp+1CH]                    ; 52E9 _ 8B. 45, 1C
        mov     dword [ebp-34H], eax                    ; 52EC _ 89. 45, CC
        jmp     ?_314                                   ; 52EF _ E9, 0000015B

?_304:  mov     eax, dword [ebp+8H]                     ; 52F4 _ 8B. 45, 08
        mov     edx, dword [ebp-34H]                    ; 52F7 _ 8B. 55, CC
        add     edx, 4                                  ; 52FA _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 52FD _ 8B. 44 90, 04
        mov     dword [ebp-18H], eax                    ; 5301 _ 89. 45, E8
        mov     eax, dword [ebp-18H]                    ; 5304 _ 8B. 45, E8
        mov     eax, dword [eax]                        ; 5307 _ 8B. 00
        mov     dword [ebp-14H], eax                    ; 5309 _ 89. 45, EC
        mov     edx, dword [ebp-18H]                    ; 530C _ 8B. 55, E8
        mov     eax, dword [ebp+8H]                     ; 530F _ 8B. 45, 08
        add     eax, 1044                               ; 5312 _ 05, 00000414
        sub     edx, eax                                ; 5317 _ 29. C2
        mov     eax, edx                                ; 5319 _ 89. D0
        sar     eax, 2                                  ; 531B _ C1. F8, 02
        imul    eax, eax, 954437177                     ; 531E _ 69. C0, 38E38E39
        mov     byte [ebp-35H], al                      ; 5324 _ 88. 45, CB
        mov     eax, dword [ebp-18H]                    ; 5327 _ 8B. 45, E8
        mov     eax, dword [eax+0CH]                    ; 532A _ 8B. 40, 0C
        mov     edx, dword [ebp+0CH]                    ; 532D _ 8B. 55, 0C
        sub     edx, eax                                ; 5330 _ 29. C2
        mov     eax, edx                                ; 5332 _ 89. D0
        mov     dword [ebp-10H], eax                    ; 5334 _ 89. 45, F0
        mov     eax, dword [ebp-18H]                    ; 5337 _ 8B. 45, E8
        mov     eax, dword [eax+10H]                    ; 533A _ 8B. 40, 10
        mov     edx, dword [ebp+10H]                    ; 533D _ 8B. 55, 10
        sub     edx, eax                                ; 5340 _ 29. C2
        mov     eax, edx                                ; 5342 _ 89. D0
        mov     dword [ebp-0CH], eax                    ; 5344 _ 89. 45, F4
        mov     eax, dword [ebp-18H]                    ; 5347 _ 8B. 45, E8
        mov     eax, dword [eax+0CH]                    ; 534A _ 8B. 40, 0C
        mov     edx, dword [ebp+14H]                    ; 534D _ 8B. 55, 14
        sub     edx, eax                                ; 5350 _ 29. C2
        mov     eax, edx                                ; 5352 _ 89. D0
        mov     dword [ebp-28H], eax                    ; 5354 _ 89. 45, D8
        mov     eax, dword [ebp-18H]                    ; 5357 _ 8B. 45, E8
        mov     eax, dword [eax+10H]                    ; 535A _ 8B. 40, 10
        mov     edx, dword [ebp+18H]                    ; 535D _ 8B. 55, 18
        sub     edx, eax                                ; 5360 _ 29. C2
        mov     eax, edx                                ; 5362 _ 89. D0
        mov     dword [ebp-24H], eax                    ; 5364 _ 89. 45, DC
        cmp     dword [ebp-10H], 0                      ; 5367 _ 83. 7D, F0, 00
        jns     ?_305                                   ; 536B _ 79, 07
        mov     dword [ebp-10H], 0                      ; 536D _ C7. 45, F0, 00000000
?_305:  cmp     dword [ebp-0CH], 0                      ; 5374 _ 83. 7D, F4, 00
        jns     ?_306                                   ; 5378 _ 79, 07
        mov     dword [ebp-0CH], 0                      ; 537A _ C7. 45, F4, 00000000
?_306:  mov     eax, dword [ebp-18H]                    ; 5381 _ 8B. 45, E8
        mov     eax, dword [eax+4H]                     ; 5384 _ 8B. 40, 04
        cmp     eax, dword [ebp-28H]                    ; 5387 _ 3B. 45, D8
        jge     ?_307                                   ; 538A _ 7D, 09
        mov     eax, dword [ebp-18H]                    ; 538C _ 8B. 45, E8
        mov     eax, dword [eax+4H]                     ; 538F _ 8B. 40, 04
        mov     dword [ebp-28H], eax                    ; 5392 _ 89. 45, D8
?_307:  mov     eax, dword [ebp-18H]                    ; 5395 _ 8B. 45, E8
        mov     eax, dword [eax+8H]                     ; 5398 _ 8B. 40, 08
        cmp     eax, dword [ebp-24H]                    ; 539B _ 3B. 45, DC
        jge     ?_308                                   ; 539E _ 7D, 09
        mov     eax, dword [ebp-18H]                    ; 53A0 _ 8B. 45, E8
        mov     eax, dword [eax+8H]                     ; 53A3 _ 8B. 40, 08
        mov     dword [ebp-24H], eax                    ; 53A6 _ 89. 45, DC
?_308:  mov     dword [ebp-2CH], 0                      ; 53A9 _ C7. 45, D4, 00000000
        jmp     ?_313                                   ; 53B0 _ E9, 0000008A

?_309:  mov     eax, dword [ebp-18H]                    ; 53B5 _ 8B. 45, E8
        mov     edx, dword [eax+10H]                    ; 53B8 _ 8B. 50, 10
        mov     eax, dword [ebp-2CH]                    ; 53BB _ 8B. 45, D4
        add     eax, edx                                ; 53BE _ 01. D0
        mov     dword [ebp-8H], eax                     ; 53C0 _ 89. 45, F8
        mov     dword [ebp-30H], 0                      ; 53C3 _ C7. 45, D0, 00000000
        jmp     ?_312                                   ; 53CA _ EB, 67

?_310:  mov     eax, dword [ebp-18H]                    ; 53CC _ 8B. 45, E8
        mov     edx, dword [eax+0CH]                    ; 53CF _ 8B. 50, 0C
        mov     eax, dword [ebp-30H]                    ; 53D2 _ 8B. 45, D0
        add     eax, edx                                ; 53D5 _ 01. D0
        mov     dword [ebp-4H], eax                     ; 53D7 _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 53DA _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 53DD _ 8B. 40, 08
        imul    eax, dword [ebp-8H]                     ; 53E0 _ 0F AF. 45, F8
        mov     edx, eax                                ; 53E4 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 53E6 _ 8B. 45, FC
        add     eax, edx                                ; 53E9 _ 01. D0
        mov     edx, eax                                ; 53EB _ 89. C2
        mov     eax, dword [ebp-1CH]                    ; 53ED _ 8B. 45, E4
        add     eax, edx                                ; 53F0 _ 01. D0
        movzx   eax, byte [eax]                         ; 53F2 _ 0F B6. 00
        cmp     al, byte [ebp-35H]                      ; 53F5 _ 3A. 45, CB
        jnz     ?_311                                   ; 53F8 _ 75, 35
        mov     eax, dword [ebp+8H]                     ; 53FA _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 53FD _ 8B. 40, 08
        imul    eax, dword [ebp-8H]                     ; 5400 _ 0F AF. 45, F8
        mov     edx, eax                                ; 5404 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 5406 _ 8B. 45, FC
        add     eax, edx                                ; 5409 _ 01. D0
        mov     edx, eax                                ; 540B _ 89. C2
        mov     eax, dword [ebp-20H]                    ; 540D _ 8B. 45, E0
        add     edx, eax                                ; 5410 _ 01. C2
        mov     eax, dword [ebp-18H]                    ; 5412 _ 8B. 45, E8
        mov     eax, dword [eax+4H]                     ; 5415 _ 8B. 40, 04
        imul    eax, dword [ebp-2CH]                    ; 5418 _ 0F AF. 45, D4
        mov     ecx, eax                                ; 541C _ 89. C1
        mov     eax, dword [ebp-30H]                    ; 541E _ 8B. 45, D0
        add     eax, ecx                                ; 5421 _ 01. C8
        mov     ecx, eax                                ; 5423 _ 89. C1
        mov     eax, dword [ebp-14H]                    ; 5425 _ 8B. 45, EC
        add     eax, ecx                                ; 5428 _ 01. C8
        movzx   eax, byte [eax]                         ; 542A _ 0F B6. 00
        mov     byte [edx], al                          ; 542D _ 88. 02
?_311:  add     dword [ebp-30H], 1                      ; 542F _ 83. 45, D0, 01
?_312:  mov     eax, dword [ebp-30H]                    ; 5433 _ 8B. 45, D0
        cmp     eax, dword [ebp-28H]                    ; 5436 _ 3B. 45, D8
        jl      ?_310                                   ; 5439 _ 7C, 91
        add     dword [ebp-2CH], 1                      ; 543B _ 83. 45, D4, 01
?_313:  mov     eax, dword [ebp-2CH]                    ; 543F _ 8B. 45, D4
        cmp     eax, dword [ebp-24H]                    ; 5442 _ 3B. 45, DC
        jl      ?_309                                   ; 5445 _ 0F 8C, FFFFFF6A
        add     dword [ebp-34H], 1                      ; 544B _ 83. 45, CC, 01
?_314:  mov     eax, dword [ebp-34H]                    ; 544F _ 8B. 45, CC
        cmp     eax, dword [ebp+20H]                    ; 5452 _ 3B. 45, 20
        jle     ?_304                                   ; 5455 _ 0F 8E, FFFFFE99
        leave                                           ; 545B _ C9
        ret                                             ; 545C _ C3
; sheet_refreshsub End of function

sheet_refreshmap:; Function begin
        push    ebp                                     ; 545D _ 55
        mov     ebp, esp                                ; 545E _ 89. E5
        sub     esp, 64                                 ; 5460 _ 83. EC, 40
        mov     eax, dword [ebp+8H]                     ; 5463 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 5466 _ 8B. 40, 04
        mov     dword [ebp-14H], eax                    ; 5469 _ 89. 45, EC
        cmp     dword [ebp+0CH], 0                      ; 546C _ 83. 7D, 0C, 00
        jns     ?_315                                   ; 5470 _ 79, 07
        mov     dword [ebp+0CH], 0                      ; 5472 _ C7. 45, 0C, 00000000
?_315:  cmp     dword [ebp+10H], 0                      ; 5479 _ 83. 7D, 10, 00
        jns     ?_316                                   ; 547D _ 79, 07
        mov     dword [ebp+10H], 0                      ; 547F _ C7. 45, 10, 00000000
?_316:  mov     eax, dword [ebp+8H]                     ; 5486 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 5489 _ 8B. 40, 08
        cmp     eax, dword [ebp+14H]                    ; 548C _ 3B. 45, 14
        jge     ?_317                                   ; 548F _ 7D, 09
        mov     eax, dword [ebp+8H]                     ; 5491 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 5494 _ 8B. 40, 08
        mov     dword [ebp+14H], eax                    ; 5497 _ 89. 45, 14
?_317:  mov     eax, dword [ebp+8H]                     ; 549A _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 549D _ 8B. 40, 0C
        cmp     eax, dword [ebp+18H]                    ; 54A0 _ 3B. 45, 18
        jge     ?_318                                   ; 54A3 _ 7D, 09
        mov     eax, dword [ebp+8H]                     ; 54A5 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 54A8 _ 8B. 40, 0C
        mov     dword [ebp+18H], eax                    ; 54AB _ 89. 45, 18
?_318:  mov     eax, dword [ebp+1CH]                    ; 54AE _ 8B. 45, 1C
        mov     dword [ebp-30H], eax                    ; 54B1 _ 89. 45, D0
        jmp     ?_329                                   ; 54B4 _ E9, 00000147

?_319:  mov     eax, dword [ebp+8H]                     ; 54B9 _ 8B. 45, 08
        mov     edx, dword [ebp-30H]                    ; 54BC _ 8B. 55, D0
        add     edx, 4                                  ; 54BF _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 54C2 _ 8B. 44 90, 04
        mov     dword [ebp-10H], eax                    ; 54C6 _ 89. 45, F0
        mov     edx, dword [ebp-10H]                    ; 54C9 _ 8B. 55, F0
        mov     eax, dword [ebp+8H]                     ; 54CC _ 8B. 45, 08
        add     eax, 1044                               ; 54CF _ 05, 00000414
        sub     edx, eax                                ; 54D4 _ 29. C2
        mov     eax, edx                                ; 54D6 _ 89. D0
        sar     eax, 2                                  ; 54D8 _ C1. F8, 02
        imul    eax, eax, 954437177                     ; 54DB _ 69. C0, 38E38E39
        mov     byte [ebp-31H], al                      ; 54E1 _ 88. 45, CF
        mov     eax, dword [ebp-10H]                    ; 54E4 _ 8B. 45, F0
        mov     eax, dword [eax]                        ; 54E7 _ 8B. 00
        mov     dword [ebp-0CH], eax                    ; 54E9 _ 89. 45, F4
        mov     eax, dword [ebp-10H]                    ; 54EC _ 8B. 45, F0
        mov     eax, dword [eax+0CH]                    ; 54EF _ 8B. 40, 0C
        mov     edx, dword [ebp+0CH]                    ; 54F2 _ 8B. 55, 0C
        sub     edx, eax                                ; 54F5 _ 29. C2
        mov     eax, edx                                ; 54F7 _ 89. D0
        mov     dword [ebp-24H], eax                    ; 54F9 _ 89. 45, DC
        mov     eax, dword [ebp-10H]                    ; 54FC _ 8B. 45, F0
        mov     eax, dword [eax+10H]                    ; 54FF _ 8B. 40, 10
        mov     edx, dword [ebp+10H]                    ; 5502 _ 8B. 55, 10
        sub     edx, eax                                ; 5505 _ 29. C2
        mov     eax, edx                                ; 5507 _ 89. D0
        mov     dword [ebp-20H], eax                    ; 5509 _ 89. 45, E0
        mov     eax, dword [ebp-10H]                    ; 550C _ 8B. 45, F0
        mov     eax, dword [eax+0CH]                    ; 550F _ 8B. 40, 0C
        mov     edx, dword [ebp+14H]                    ; 5512 _ 8B. 55, 14
        sub     edx, eax                                ; 5515 _ 29. C2
        mov     eax, edx                                ; 5517 _ 89. D0
        mov     dword [ebp-1CH], eax                    ; 5519 _ 89. 45, E4
        mov     eax, dword [ebp-10H]                    ; 551C _ 8B. 45, F0
        mov     eax, dword [eax+10H]                    ; 551F _ 8B. 40, 10
        mov     edx, dword [ebp+18H]                    ; 5522 _ 8B. 55, 18
        sub     edx, eax                                ; 5525 _ 29. C2
        mov     eax, edx                                ; 5527 _ 89. D0
        mov     dword [ebp-18H], eax                    ; 5529 _ 89. 45, E8
        cmp     dword [ebp-24H], 0                      ; 552C _ 83. 7D, DC, 00
        jns     ?_320                                   ; 5530 _ 79, 07
        mov     dword [ebp-24H], 0                      ; 5532 _ C7. 45, DC, 00000000
?_320:  cmp     dword [ebp-20H], 0                      ; 5539 _ 83. 7D, E0, 00
        jns     ?_321                                   ; 553D _ 79, 07
        mov     dword [ebp-20H], 0                      ; 553F _ C7. 45, E0, 00000000
?_321:  mov     eax, dword [ebp-10H]                    ; 5546 _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 5549 _ 8B. 40, 04
        cmp     eax, dword [ebp-1CH]                    ; 554C _ 3B. 45, E4
        jge     ?_322                                   ; 554F _ 7D, 09
        mov     eax, dword [ebp-10H]                    ; 5551 _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 5554 _ 8B. 40, 04
        mov     dword [ebp-1CH], eax                    ; 5557 _ 89. 45, E4
?_322:  mov     eax, dword [ebp-10H]                    ; 555A _ 8B. 45, F0
        mov     eax, dword [eax+8H]                     ; 555D _ 8B. 40, 08
        cmp     eax, dword [ebp-18H]                    ; 5560 _ 3B. 45, E8
        jge     ?_323                                   ; 5563 _ 7D, 09
        mov     eax, dword [ebp-10H]                    ; 5565 _ 8B. 45, F0
        mov     eax, dword [eax+8H]                     ; 5568 _ 8B. 40, 08
        mov     dword [ebp-18H], eax                    ; 556B _ 89. 45, E8
?_323:  mov     eax, dword [ebp-20H]                    ; 556E _ 8B. 45, E0
        mov     dword [ebp-28H], eax                    ; 5571 _ 89. 45, D8
        jmp     ?_328                                   ; 5574 _ EB, 7A

?_324:  mov     eax, dword [ebp-10H]                    ; 5576 _ 8B. 45, F0
        mov     edx, dword [eax+10H]                    ; 5579 _ 8B. 50, 10
        mov     eax, dword [ebp-28H]                    ; 557C _ 8B. 45, D8
        add     eax, edx                                ; 557F _ 01. D0
        mov     dword [ebp-8H], eax                     ; 5581 _ 89. 45, F8
        mov     eax, dword [ebp-24H]                    ; 5584 _ 8B. 45, DC
        mov     dword [ebp-2CH], eax                    ; 5587 _ 89. 45, D4
        jmp     ?_327                                   ; 558A _ EB, 58

?_325:  mov     eax, dword [ebp-10H]                    ; 558C _ 8B. 45, F0
        mov     edx, dword [eax+0CH]                    ; 558F _ 8B. 50, 0C
        mov     eax, dword [ebp-2CH]                    ; 5592 _ 8B. 45, D4
        add     eax, edx                                ; 5595 _ 01. D0
        mov     dword [ebp-4H], eax                     ; 5597 _ 89. 45, FC
        mov     eax, dword [ebp-10H]                    ; 559A _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 559D _ 8B. 40, 04
        imul    eax, dword [ebp-28H]                    ; 55A0 _ 0F AF. 45, D8
        mov     edx, eax                                ; 55A4 _ 89. C2
        mov     eax, dword [ebp-2CH]                    ; 55A6 _ 8B. 45, D4
        add     eax, edx                                ; 55A9 _ 01. D0
        mov     edx, eax                                ; 55AB _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 55AD _ 8B. 45, F4
        add     eax, edx                                ; 55B0 _ 01. D0
        movzx   eax, byte [eax]                         ; 55B2 _ 0F B6. 00
        movzx   edx, al                                 ; 55B5 _ 0F B6. D0
        mov     eax, dword [ebp-10H]                    ; 55B8 _ 8B. 45, F0
        mov     eax, dword [eax+14H]                    ; 55BB _ 8B. 40, 14
        cmp     edx, eax                                ; 55BE _ 39. C2
        jz      ?_326                                   ; 55C0 _ 74, 1E
        mov     eax, dword [ebp+8H]                     ; 55C2 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 55C5 _ 8B. 40, 08
        imul    eax, dword [ebp-8H]                     ; 55C8 _ 0F AF. 45, F8
        mov     edx, eax                                ; 55CC _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 55CE _ 8B. 45, FC
        add     eax, edx                                ; 55D1 _ 01. D0
        mov     edx, eax                                ; 55D3 _ 89. C2
        mov     eax, dword [ebp-14H]                    ; 55D5 _ 8B. 45, EC
        add     edx, eax                                ; 55D8 _ 01. C2
        movzx   eax, byte [ebp-31H]                     ; 55DA _ 0F B6. 45, CF
        mov     byte [edx], al                          ; 55DE _ 88. 02
?_326:  add     dword [ebp-2CH], 1                      ; 55E0 _ 83. 45, D4, 01
?_327:  mov     eax, dword [ebp-2CH]                    ; 55E4 _ 8B. 45, D4
        cmp     eax, dword [ebp-1CH]                    ; 55E7 _ 3B. 45, E4
        jl      ?_325                                   ; 55EA _ 7C, A0
        add     dword [ebp-28H], 1                      ; 55EC _ 83. 45, D8, 01
?_328:  mov     eax, dword [ebp-28H]                    ; 55F0 _ 8B. 45, D8
        cmp     eax, dword [ebp-18H]                    ; 55F3 _ 3B. 45, E8
        jl      ?_324                                   ; 55F6 _ 0F 8C, FFFFFF7A
        add     dword [ebp-30H], 1                      ; 55FC _ 83. 45, D0, 01
?_329:  mov     eax, dword [ebp+8H]                     ; 5600 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 5603 _ 8B. 40, 10
        cmp     eax, dword [ebp-30H]                    ; 5606 _ 3B. 45, D0
        jge     ?_319                                   ; 5609 _ 0F 8D, FFFFFEAA
        nop                                             ; 560F _ 90
        leave                                           ; 5610 _ C9
        ret                                             ; 5611 _ C3
; sheet_refreshmap End of function

sheet_free:; Function begin
        push    ebp                                     ; 5612 _ 55
        mov     ebp, esp                                ; 5613 _ 89. E5
        sub     esp, 24                                 ; 5615 _ 83. EC, 18
        mov     eax, dword [ebp+0CH]                    ; 5618 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 561B _ 8B. 40, 18
        test    eax, eax                                ; 561E _ 85. C0
        js      ?_330                                   ; 5620 _ 78, 1A
        mov     dword [esp+8H], -1                      ; 5622 _ C7. 44 24, 08, FFFFFFFF
        mov     eax, dword [ebp+0CH]                    ; 562A _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 562D _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 5631 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 5634 _ 89. 04 24
        call    sheet_updown                            ; 5637 _ E8, FFFFFFFC(rel)
?_330:  mov     eax, dword [ebp+0CH]                    ; 563C _ 8B. 45, 0C
        mov     dword [eax+1CH], 0                      ; 563F _ C7. 40, 1C, 00000000
        nop                                             ; 5646 _ 90
        leave                                           ; 5647 _ C9
        ret                                             ; 5648 _ C3
; sheet_free End of function

init_pit:; Function begin
        push    ebp                                     ; 5649 _ 55
        mov     ebp, esp                                ; 564A _ 89. E5
        sub     esp, 40                                 ; 564C _ 83. EC, 28
        mov     dword [esp+4H], 52                      ; 564F _ C7. 44 24, 04, 00000034
        mov     dword [esp], 67                         ; 5657 _ C7. 04 24, 00000043
        call    io_out8                                 ; 565E _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 156                     ; 5663 _ C7. 44 24, 04, 0000009C
        mov     dword [esp], 64                         ; 566B _ C7. 04 24, 00000040
        call    io_out8                                 ; 5672 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 46                      ; 5677 _ C7. 44 24, 04, 0000002E
        mov     dword [esp], 64                         ; 567F _ C7. 04 24, 00000040
        call    io_out8                                 ; 5686 _ E8, FFFFFFFC(rel)
        mov     dword [timerctl], 0                     ; 568B _ C7. 05, 00000380(d), 00000000
        mov     dword [ebp-0CH], 0                      ; 5695 _ C7. 45, F4, 00000000
        jmp     ?_332                                   ; 569C _ EB, 28

?_331:  mov     eax, dword [ebp-0CH]                    ; 569E _ 8B. 45, F4
        shl     eax, 4                                  ; 56A1 _ C1. E0, 04
        add     eax, timerctl                           ; 56A4 _ 05, 00000380(d)
        mov     dword [eax+8H], 0                       ; 56A9 _ C7. 40, 08, 00000000
        mov     eax, dword [ebp-0CH]                    ; 56B0 _ 8B. 45, F4
        shl     eax, 4                                  ; 56B3 _ C1. E0, 04
        add     eax, timerctl                           ; 56B6 _ 05, 00000380(d)
        mov     dword [eax+0CH], 0                      ; 56BB _ C7. 40, 0C, 00000000
        add     dword [ebp-0CH], 1                      ; 56C2 _ 83. 45, F4, 01
?_332:  cmp     dword [ebp-0CH], 499                    ; 56C6 _ 81. 7D, F4, 000001F3
        jle     ?_331                                   ; 56CD _ 7E, CF
        leave                                           ; 56CF _ C9
        ret                                             ; 56D0 _ C3
; init_pit End of function

timer_alloc:; Function begin
        push    ebp                                     ; 56D1 _ 55
        mov     ebp, esp                                ; 56D2 _ 89. E5
        sub     esp, 16                                 ; 56D4 _ 83. EC, 10
        mov     dword [ebp-4H], 0                       ; 56D7 _ C7. 45, FC, 00000000
        jmp     ?_335                                   ; 56DE _ EB, 38

?_333:  mov     eax, dword [ebp-4H]                     ; 56E0 _ 8B. 45, FC
        shl     eax, 4                                  ; 56E3 _ C1. E0, 04
        add     eax, timerctl                           ; 56E6 _ 05, 00000380(d)
        mov     eax, dword [eax+8H]                     ; 56EB _ 8B. 40, 08
        test    eax, eax                                ; 56EE _ 85. C0
        jnz     ?_334                                   ; 56F0 _ 75, 22
        mov     eax, dword [ebp-4H]                     ; 56F2 _ 8B. 45, FC
        shl     eax, 4                                  ; 56F5 _ C1. E0, 04
        add     eax, timerctl                           ; 56F8 _ 05, 00000380(d)
        mov     dword [eax+8H], 1                       ; 56FD _ C7. 40, 08, 00000001
        mov     eax, dword [ebp-4H]                     ; 5704 _ 8B. 45, FC
        shl     eax, 4                                  ; 5707 _ C1. E0, 04
        add     eax, timerctl                           ; 570A _ 05, 00000380(d)
        add     eax, 4                                  ; 570F _ 83. C0, 04
        jmp     ?_336                                   ; 5712 _ EB, 12

?_334:  add     dword [ebp-4H], 1                       ; 5714 _ 83. 45, FC, 01
?_335:  cmp     dword [ebp-4H], 499                     ; 5718 _ 81. 7D, FC, 000001F3
        jle     ?_333                                   ; 571F _ 7E, BF
        mov     eax, 0                                  ; 5721 _ B8, 00000000
?_336:  leave                                           ; 5726 _ C9
        ret                                             ; 5727 _ C3
; timer_alloc End of function

timer_free:; Function begin
        push    ebp                                     ; 5728 _ 55
        mov     ebp, esp                                ; 5729 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 572B _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 572E _ C7. 40, 04, 00000000
        nop                                             ; 5735 _ 90
        pop     ebp                                     ; 5736 _ 5D
        ret                                             ; 5737 _ C3
; timer_free End of function

timer_init:; Function begin
        push    ebp                                     ; 5738 _ 55
        mov     ebp, esp                                ; 5739 _ 89. E5
        sub     esp, 4                                  ; 573B _ 83. EC, 04
        mov     eax, dword [ebp+10H]                    ; 573E _ 8B. 45, 10
        mov     byte [ebp-4H], al                       ; 5741 _ 88. 45, FC
        mov     eax, dword [ebp+8H]                     ; 5744 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 5747 _ 8B. 55, 0C
        mov     dword [eax+8H], edx                     ; 574A _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 574D _ 8B. 45, 08
        movzx   edx, byte [ebp-4H]                      ; 5750 _ 0F B6. 55, FC
        mov     byte [eax+0CH], dl                      ; 5754 _ 88. 50, 0C
        nop                                             ; 5757 _ 90
        leave                                           ; 5758 _ C9
        ret                                             ; 5759 _ C3
; timer_init End of function

timer_settime:; Function begin
        push    ebp                                     ; 575A _ 55
        mov     ebp, esp                                ; 575B _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 575D _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 5760 _ 8B. 55, 0C
        mov     dword [eax], edx                        ; 5763 _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 5765 _ 8B. 45, 08
        mov     dword [eax+4H], 2                       ; 5768 _ C7. 40, 04, 00000002
        nop                                             ; 576F _ 90
        pop     ebp                                     ; 5770 _ 5D
        ret                                             ; 5771 _ C3
; timer_settime End of function

intHandlerForTimer:; Function begin
        push    ebp                                     ; 5772 _ 55
        mov     ebp, esp                                ; 5773 _ 89. E5
        sub     esp, 40                                 ; 5775 _ 83. EC, 28
        mov     dword [esp+4H], 32                      ; 5778 _ C7. 44 24, 04, 00000020
        mov     dword [esp], 32                         ; 5780 _ C7. 04 24, 00000020
        call    io_out8                                 ; 5787 _ E8, FFFFFFFC(rel)
        mov     eax, dword [timerctl]                   ; 578C _ A1, 00000380(d)
        add     eax, 1                                  ; 5791 _ 83. C0, 01
        mov     dword [timerctl], eax                   ; 5794 _ A3, 00000380(d)
        mov     byte [ebp-0DH], 0                       ; 5799 _ C6. 45, F3, 00
        mov     dword [ebp-0CH], 0                      ; 579D _ C7. 45, F4, 00000000
        jmp     ?_340                                   ; 57A4 _ E9, 000000B0

?_337:  mov     eax, dword [ebp-0CH]                    ; 57A9 _ 8B. 45, F4
        shl     eax, 4                                  ; 57AC _ C1. E0, 04
        add     eax, timerctl                           ; 57AF _ 05, 00000380(d)
        mov     eax, dword [eax+8H]                     ; 57B4 _ 8B. 40, 08
        cmp     eax, 2                                  ; 57B7 _ 83. F8, 02
        jne     ?_338                                   ; 57BA _ 0F 85, 0000008A
        mov     eax, dword [ebp-0CH]                    ; 57C0 _ 8B. 45, F4
        shl     eax, 4                                  ; 57C3 _ C1. E0, 04
        add     eax, timerctl                           ; 57C6 _ 05, 00000380(d)
        mov     eax, dword [eax+4H]                     ; 57CB _ 8B. 40, 04
        lea     edx, [eax-1H]                           ; 57CE _ 8D. 50, FF
        mov     eax, dword [ebp-0CH]                    ; 57D1 _ 8B. 45, F4
        shl     eax, 4                                  ; 57D4 _ C1. E0, 04
        add     eax, timerctl                           ; 57D7 _ 05, 00000380(d)
        mov     dword [eax+4H], edx                     ; 57DC _ 89. 50, 04
        mov     eax, dword [ebp-0CH]                    ; 57DF _ 8B. 45, F4
        shl     eax, 4                                  ; 57E2 _ C1. E0, 04
        add     eax, timerctl                           ; 57E5 _ 05, 00000380(d)
        mov     eax, dword [eax+4H]                     ; 57EA _ 8B. 40, 04
        test    eax, eax                                ; 57ED _ 85. C0
        jnz     ?_338                                   ; 57EF _ 75, 59
        mov     eax, dword [ebp-0CH]                    ; 57F1 _ 8B. 45, F4
        shl     eax, 4                                  ; 57F4 _ C1. E0, 04
        add     eax, timerctl                           ; 57F7 _ 05, 00000380(d)
        mov     dword [eax+8H], 1                       ; 57FC _ C7. 40, 08, 00000001
        mov     eax, dword [ebp-0CH]                    ; 5803 _ 8B. 45, F4
        shl     eax, 4                                  ; 5806 _ C1. E0, 04
        add     eax, timerctl                           ; 5809 _ 05, 00000380(d)
        movzx   eax, byte [eax+10H]                     ; 580E _ 0F B6. 40, 10
        movzx   edx, al                                 ; 5812 _ 0F B6. D0
        mov     eax, dword [ebp-0CH]                    ; 5815 _ 8B. 45, F4
        shl     eax, 4                                  ; 5818 _ C1. E0, 04
        add     eax, timerctl                           ; 581B _ 05, 00000380(d)
        mov     eax, dword [eax+0CH]                    ; 5820 _ 8B. 40, 0C
        mov     dword [esp+4H], edx                     ; 5823 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 5827 _ 89. 04 24
        call    fifo8_put                               ; 582A _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 582F _ 8B. 45, F4
        shl     eax, 4                                  ; 5832 _ C1. E0, 04
        add     eax, timerctl                           ; 5835 _ 05, 00000380(d)
        lea     edx, [eax+4H]                           ; 583A _ 8D. 50, 04
        mov     eax, dword [task_timer]                 ; 583D _ A1, 00000000(d)
        cmp     edx, eax                                ; 5842 _ 39. C2
        jnz     ?_338                                   ; 5844 _ 75, 04
        mov     byte [ebp-0DH], 1                       ; 5846 _ C6. 45, F3, 01
?_338:  cmp     byte [ebp-0DH], 0                       ; 584A _ 80. 7D, F3, 00
        jz      ?_339                                   ; 584E _ 74, 05
        call    task_switch                             ; 5850 _ E8, FFFFFFFC(rel)
?_339:  add     dword [ebp-0CH], 1                      ; 5855 _ 83. 45, F4, 01
?_340:  cmp     dword [ebp-0CH], 499                    ; 5859 _ 81. 7D, F4, 000001F3
        jle     ?_337                                   ; 5860 _ 0F 8E, FFFFFF43
        nop                                             ; 5866 _ 90
        leave                                           ; 5867 _ C9
        ret                                             ; 5868 _ C3
; intHandlerForTimer End of function

getTimerController:; Function begin
        push    ebp                                     ; 5869 _ 55
        mov     ebp, esp                                ; 586A _ 89. E5
        mov     eax, timerctl                           ; 586C _ B8, 00000380(d)
        pop     ebp                                     ; 5871 _ 5D
        ret                                             ; 5872 _ C3
; getTimerController End of function

fifo8_init:; Function begin
        push    ebp                                     ; 5873 _ 55
        mov     ebp, esp                                ; 5874 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 5876 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 5879 _ 8B. 55, 0C
        mov     dword [eax+0CH], edx                    ; 587C _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 587F _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 5882 _ 8B. 55, 10
        mov     dword [eax], edx                        ; 5885 _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 5887 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 588A _ 8B. 55, 0C
        mov     dword [eax+10H], edx                    ; 588D _ 89. 50, 10
        mov     eax, dword [ebp+8H]                     ; 5890 _ 8B. 45, 08
        mov     dword [eax+14H], 0                      ; 5893 _ C7. 40, 14, 00000000
        mov     eax, dword [ebp+8H]                     ; 589A _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 589D _ C7. 40, 04, 00000000
        mov     eax, dword [ebp+8H]                     ; 58A4 _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 58A7 _ C7. 40, 08, 00000000
        mov     eax, dword [ebp+8H]                     ; 58AE _ 8B. 45, 08
        mov     edx, dword [ebp+14H]                    ; 58B1 _ 8B. 55, 14
        mov     dword [eax+18H], edx                    ; 58B4 _ 89. 50, 18
        nop                                             ; 58B7 _ 90
        pop     ebp                                     ; 58B8 _ 5D
        ret                                             ; 58B9 _ C3
; fifo8_init End of function

fifo8_put:; Function begin
        push    ebp                                     ; 58BA _ 55
        mov     ebp, esp                                ; 58BB _ 89. E5
        sub     esp, 24                                 ; 58BD _ 83. EC, 18
        mov     eax, dword [ebp+0CH]                    ; 58C0 _ 8B. 45, 0C
        mov     byte [ebp-0CH], al                      ; 58C3 _ 88. 45, F4
        cmp     dword [ebp+8H], 0                       ; 58C6 _ 83. 7D, 08, 00
        jnz     ?_341                                   ; 58CA _ 75, 0A
        mov     eax, 4294967295                         ; 58CC _ B8, FFFFFFFF
        jmp     ?_345                                   ; 58D1 _ E9, 000000B2

?_341:  mov     eax, dword [ebp+8H]                     ; 58D6 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 58D9 _ 8B. 40, 10
        test    eax, eax                                ; 58DC _ 85. C0
        jnz     ?_342                                   ; 58DE _ 75, 1B
        mov     eax, dword [ebp+8H]                     ; 58E0 _ 8B. 45, 08
        mov     eax, dword [eax+14H]                    ; 58E3 _ 8B. 40, 14
        or      eax, 01H                                ; 58E6 _ 83. C8, 01
        mov     edx, eax                                ; 58E9 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 58EB _ 8B. 45, 08
        mov     dword [eax+14H], edx                    ; 58EE _ 89. 50, 14
        mov     eax, 4294967294                         ; 58F1 _ B8, FFFFFFFE
        jmp     ?_345                                   ; 58F6 _ E9, 0000008D

?_342:  mov     eax, dword [ebp+8H]                     ; 58FB _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 58FE _ 8B. 10
        mov     eax, dword [ebp+8H]                     ; 5900 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 5903 _ 8B. 40, 04
        add     edx, eax                                ; 5906 _ 01. C2
        movzx   eax, byte [ebp-0CH]                     ; 5908 _ 0F B6. 45, F4
        mov     byte [edx], al                          ; 590C _ 88. 02
        mov     eax, dword [ebp+8H]                     ; 590E _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 5911 _ 8B. 40, 04
        lea     edx, [eax+1H]                           ; 5914 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 5917 _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 591A _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 591D _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 5920 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 5923 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 5926 _ 8B. 40, 0C
        cmp     edx, eax                                ; 5929 _ 39. C2
        jnz     ?_343                                   ; 592B _ 75, 0A
        mov     eax, dword [ebp+8H]                     ; 592D _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 5930 _ C7. 40, 04, 00000000
?_343:  mov     eax, dword [ebp+8H]                     ; 5937 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 593A _ 8B. 40, 10
        lea     edx, [eax-1H]                           ; 593D _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 5940 _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 5943 _ 89. 50, 10
        mov     eax, dword [ebp+8H]                     ; 5946 _ 8B. 45, 08
        mov     eax, dword [eax+18H]                    ; 5949 _ 8B. 40, 18
        test    eax, eax                                ; 594C _ 85. C0
        jz      ?_344                                   ; 594E _ 74, 33
        mov     eax, dword [ebp+8H]                     ; 5950 _ 8B. 45, 08
        mov     eax, dword [eax+18H]                    ; 5953 _ 8B. 40, 18
        mov     eax, dword [eax+4H]                     ; 5956 _ 8B. 40, 04
        cmp     eax, 2                                  ; 5959 _ 83. F8, 02
        jz      ?_344                                   ; 595C _ 74, 25
        mov     eax, dword [ebp+8H]                     ; 595E _ 8B. 45, 08
        mov     eax, dword [eax+18H]                    ; 5961 _ 8B. 40, 18
        mov     dword [esp+8H], 0                       ; 5964 _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], -1                      ; 596C _ C7. 44 24, 04, FFFFFFFF
        mov     dword [esp], eax                        ; 5974 _ 89. 04 24
        call    task_run                                ; 5977 _ E8, FFFFFFFC(rel)
        mov     eax, 1                                  ; 597C _ B8, 00000001
        jmp     ?_345                                   ; 5981 _ EB, 05

?_344:  mov     eax, 0                                  ; 5983 _ B8, 00000000
?_345:  leave                                           ; 5988 _ C9
        ret                                             ; 5989 _ C3
; fifo8_put End of function

fifo8_get:; Function begin
        push    ebp                                     ; 598A _ 55
        mov     ebp, esp                                ; 598B _ 89. E5
        sub     esp, 16                                 ; 598D _ 83. EC, 10
        mov     eax, dword [ebp+8H]                     ; 5990 _ 8B. 45, 08
        mov     edx, dword [eax+10H]                    ; 5993 _ 8B. 50, 10
        mov     eax, dword [ebp+8H]                     ; 5996 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 5999 _ 8B. 40, 0C
        cmp     edx, eax                                ; 599C _ 39. C2
        jnz     ?_346                                   ; 599E _ 75, 07
        mov     eax, 4294967295                         ; 59A0 _ B8, FFFFFFFF
        jmp     ?_348                                   ; 59A5 _ EB, 51

?_346:  mov     eax, dword [ebp+8H]                     ; 59A7 _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 59AA _ 8B. 10
        mov     eax, dword [ebp+8H]                     ; 59AC _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 59AF _ 8B. 40, 08
        add     eax, edx                                ; 59B2 _ 01. D0
        movzx   eax, byte [eax]                         ; 59B4 _ 0F B6. 00
        movzx   eax, al                                 ; 59B7 _ 0F B6. C0
        mov     dword [ebp-4H], eax                     ; 59BA _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 59BD _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 59C0 _ 8B. 40, 08
        lea     edx, [eax+1H]                           ; 59C3 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 59C6 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 59C9 _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 59CC _ 8B. 45, 08
        mov     edx, dword [eax+8H]                     ; 59CF _ 8B. 50, 08
        mov     eax, dword [ebp+8H]                     ; 59D2 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 59D5 _ 8B. 40, 0C
        cmp     edx, eax                                ; 59D8 _ 39. C2
        jnz     ?_347                                   ; 59DA _ 75, 0A
        mov     eax, dword [ebp+8H]                     ; 59DC _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 59DF _ C7. 40, 08, 00000000
?_347:  mov     eax, dword [ebp+8H]                     ; 59E6 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 59E9 _ 8B. 40, 10
        lea     edx, [eax+1H]                           ; 59EC _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 59EF _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 59F2 _ 89. 50, 10
        mov     eax, dword [ebp-4H]                     ; 59F5 _ 8B. 45, FC
?_348:  leave                                           ; 59F8 _ C9
        ret                                             ; 59F9 _ C3
; fifo8_get End of function

fifo8_status:; Function begin
        push    ebp                                     ; 59FA _ 55
        mov     ebp, esp                                ; 59FB _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 59FD _ 8B. 45, 08
        mov     edx, dword [eax+0CH]                    ; 5A00 _ 8B. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 5A03 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 5A06 _ 8B. 40, 10
        sub     edx, eax                                ; 5A09 _ 29. C2
        mov     eax, edx                                ; 5A0B _ 89. D0
        pop     ebp                                     ; 5A0D _ 5D
        ret                                             ; 5A0E _ C3
; fifo8_status End of function

strcmp: ; Function begin
        push    ebp                                     ; 5A0F _ 55
        mov     ebp, esp                                ; 5A10 _ 89. E5
        sub     esp, 16                                 ; 5A12 _ 83. EC, 10
        cmp     dword [ebp+8H], 0                       ; 5A15 _ 83. 7D, 08, 00
        jz      ?_349                                   ; 5A19 _ 74, 06
        cmp     dword [ebp+0CH], 0                      ; 5A1B _ 83. 7D, 0C, 00
        jnz     ?_350                                   ; 5A1F _ 75, 0A
?_349:  mov     eax, 0                                  ; 5A21 _ B8, 00000000
        jmp     ?_357                                   ; 5A26 _ E9, 0000009B

?_350:  mov     dword [ebp-4H], 0                       ; 5A2B _ C7. 45, FC, 00000000
        jmp     ?_353                                   ; 5A32 _ EB, 25

?_351:  mov     edx, dword [ebp-4H]                     ; 5A34 _ 8B. 55, FC
        mov     eax, dword [ebp+8H]                     ; 5A37 _ 8B. 45, 08
        add     eax, edx                                ; 5A3A _ 01. D0
        movzx   edx, byte [eax]                         ; 5A3C _ 0F B6. 10
        mov     ecx, dword [ebp-4H]                     ; 5A3F _ 8B. 4D, FC
        mov     eax, dword [ebp+0CH]                    ; 5A42 _ 8B. 45, 0C
        add     eax, ecx                                ; 5A45 _ 01. C8
        movzx   eax, byte [eax]                         ; 5A47 _ 0F B6. 00
        cmp     dl, al                                  ; 5A4A _ 38. C2
        jz      ?_352                                   ; 5A4C _ 74, 07
        mov     eax, 0                                  ; 5A4E _ B8, 00000000
        jmp     ?_357                                   ; 5A53 _ EB, 71

?_352:  add     dword [ebp-4H], 1                       ; 5A55 _ 83. 45, FC, 01
?_353:  mov     edx, dword [ebp-4H]                     ; 5A59 _ 8B. 55, FC
        mov     eax, dword [ebp+8H]                     ; 5A5C _ 8B. 45, 08
        add     eax, edx                                ; 5A5F _ 01. D0
        movzx   eax, byte [eax]                         ; 5A61 _ 0F B6. 00
        test    al, al                                  ; 5A64 _ 84. C0
        jz      ?_354                                   ; 5A66 _ 74, 0F
        mov     edx, dword [ebp-4H]                     ; 5A68 _ 8B. 55, FC
        mov     eax, dword [ebp+0CH]                    ; 5A6B _ 8B. 45, 0C
        add     eax, edx                                ; 5A6E _ 01. D0
        movzx   eax, byte [eax]                         ; 5A70 _ 0F B6. 00
        test    al, al                                  ; 5A73 _ 84. C0
        jnz     ?_351                                   ; 5A75 _ 75, BD
?_354:  mov     edx, dword [ebp-4H]                     ; 5A77 _ 8B. 55, FC
        mov     eax, dword [ebp+8H]                     ; 5A7A _ 8B. 45, 08
        add     eax, edx                                ; 5A7D _ 01. D0
        movzx   eax, byte [eax]                         ; 5A7F _ 0F B6. 00
        test    al, al                                  ; 5A82 _ 84. C0
        jnz     ?_355                                   ; 5A84 _ 75, 16
        mov     edx, dword [ebp-4H]                     ; 5A86 _ 8B. 55, FC
        mov     eax, dword [ebp+0CH]                    ; 5A89 _ 8B. 45, 0C
        add     eax, edx                                ; 5A8C _ 01. D0
        movzx   eax, byte [eax]                         ; 5A8E _ 0F B6. 00
        test    al, al                                  ; 5A91 _ 84. C0
        jz      ?_355                                   ; 5A93 _ 74, 07
        mov     eax, 0                                  ; 5A95 _ B8, 00000000
        jmp     ?_357                                   ; 5A9A _ EB, 2A

?_355:  mov     edx, dword [ebp-4H]                     ; 5A9C _ 8B. 55, FC
        mov     eax, dword [ebp+8H]                     ; 5A9F _ 8B. 45, 08
        add     eax, edx                                ; 5AA2 _ 01. D0
        movzx   eax, byte [eax]                         ; 5AA4 _ 0F B6. 00
        test    al, al                                  ; 5AA7 _ 84. C0
        jz      ?_356                                   ; 5AA9 _ 74, 16
        mov     edx, dword [ebp-4H]                     ; 5AAB _ 8B. 55, FC
        mov     eax, dword [ebp+0CH]                    ; 5AAE _ 8B. 45, 0C
        add     eax, edx                                ; 5AB1 _ 01. D0
        movzx   eax, byte [eax]                         ; 5AB3 _ 0F B6. 00
        test    al, al                                  ; 5AB6 _ 84. C0
        jz      ?_356                                   ; 5AB8 _ 74, 07
        mov     eax, 0                                  ; 5ABA _ B8, 00000000
        jmp     ?_357                                   ; 5ABF _ EB, 05

?_356:  mov     eax, 1                                  ; 5AC1 _ B8, 00000001
?_357:  leave                                           ; 5AC6 _ C9
        ret                                             ; 5AC7 _ C3
; strcmp End of function

set_segmdesc:; Function begin
        push    ebp                                     ; 5AC8 _ 55
        mov     ebp, esp                                ; 5AC9 _ 89. E5
        cmp     dword [ebp+0CH], 1048575                ; 5ACB _ 81. 7D, 0C, 000FFFFF
        jbe     ?_358                                   ; 5AD2 _ 76, 10
        or      dword [ebp+14H], 8000H                  ; 5AD4 _ 81. 4D, 14, 00008000
        mov     eax, dword [ebp+0CH]                    ; 5ADB _ 8B. 45, 0C
        shr     eax, 12                                 ; 5ADE _ C1. E8, 0C
        mov     dword [ebp+0CH], eax                    ; 5AE1 _ 89. 45, 0C
?_358:  mov     eax, dword [ebp+0CH]                    ; 5AE4 _ 8B. 45, 0C
        mov     edx, eax                                ; 5AE7 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 5AE9 _ 8B. 45, 08
        mov     word [eax], dx                          ; 5AEC _ 66: 89. 10
        mov     eax, dword [ebp+10H]                    ; 5AEF _ 8B. 45, 10
        mov     edx, eax                                ; 5AF2 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 5AF4 _ 8B. 45, 08
        mov     word [eax+2H], dx                       ; 5AF7 _ 66: 89. 50, 02
        mov     eax, dword [ebp+10H]                    ; 5AFB _ 8B. 45, 10
        sar     eax, 16                                 ; 5AFE _ C1. F8, 10
        mov     edx, eax                                ; 5B01 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 5B03 _ 8B. 45, 08
        mov     byte [eax+4H], dl                       ; 5B06 _ 88. 50, 04
        mov     eax, dword [ebp+14H]                    ; 5B09 _ 8B. 45, 14
        mov     edx, eax                                ; 5B0C _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 5B0E _ 8B. 45, 08
        mov     byte [eax+5H], dl                       ; 5B11 _ 88. 50, 05
        mov     eax, dword [ebp+0CH]                    ; 5B14 _ 8B. 45, 0C
        shr     eax, 16                                 ; 5B17 _ C1. E8, 10
        and     eax, 0FH                                ; 5B1A _ 83. E0, 0F
        mov     edx, eax                                ; 5B1D _ 89. C2
        mov     eax, dword [ebp+14H]                    ; 5B1F _ 8B. 45, 14
        sar     eax, 8                                  ; 5B22 _ C1. F8, 08
        and     eax, 0FFFFFFF0H                         ; 5B25 _ 83. E0, F0
        or      eax, edx                                ; 5B28 _ 09. D0
        mov     edx, eax                                ; 5B2A _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 5B2C _ 8B. 45, 08
        mov     byte [eax+6H], dl                       ; 5B2F _ 88. 50, 06
        mov     eax, dword [ebp+10H]                    ; 5B32 _ 8B. 45, 10
        shr     eax, 24                                 ; 5B35 _ C1. E8, 18
        mov     edx, eax                                ; 5B38 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 5B3A _ 8B. 45, 08
        mov     byte [eax+7H], dl                       ; 5B3D _ 88. 50, 07
        nop                                             ; 5B40 _ 90
        pop     ebp                                     ; 5B41 _ 5D
        ret                                             ; 5B42 _ C3
; set_segmdesc End of function

get_taskctl:; Function begin
        push    ebp                                     ; 5B43 _ 55
        mov     ebp, esp                                ; 5B44 _ 89. E5
        mov     eax, dword [taskctl]                    ; 5B46 _ A1, 000022C8(d)
        pop     ebp                                     ; 5B4B _ 5D
        ret                                             ; 5B4C _ C3
; get_taskctl End of function

init_task_level:; Function begin
        push    ebp                                     ; 5B4D _ 55
        mov     ebp, esp                                ; 5B4E _ 89. E5
        sub     esp, 16                                 ; 5B50 _ 83. EC, 10
        mov     ecx, dword [taskctl]                    ; 5B53 _ 8B. 0D, 000022C8(d)
        mov     edx, dword [ebp+8H]                     ; 5B59 _ 8B. 55, 08
        mov     eax, edx                                ; 5B5C _ 89. D0
        add     eax, eax                                ; 5B5E _ 01. C0
        add     eax, edx                                ; 5B60 _ 01. D0
        shl     eax, 4                                  ; 5B62 _ C1. E0, 04
        add     eax, ecx                                ; 5B65 _ 01. C8
        add     eax, 8                                  ; 5B67 _ 83. C0, 08
        mov     dword [eax], 0                          ; 5B6A _ C7. 00, 00000000
        mov     ecx, dword [taskctl]                    ; 5B70 _ 8B. 0D, 000022C8(d)
        mov     edx, dword [ebp+8H]                     ; 5B76 _ 8B. 55, 08
        mov     eax, edx                                ; 5B79 _ 89. D0
        add     eax, eax                                ; 5B7B _ 01. C0
        add     eax, edx                                ; 5B7D _ 01. D0
        shl     eax, 4                                  ; 5B7F _ C1. E0, 04
        add     eax, ecx                                ; 5B82 _ 01. C8
        add     eax, 12                                 ; 5B84 _ 83. C0, 0C
        mov     dword [eax], 0                          ; 5B87 _ C7. 00, 00000000
        mov     dword [ebp-4H], 0                       ; 5B8D _ C7. 45, FC, 00000000
        jmp     ?_360                                   ; 5B94 _ EB, 1B

?_359:  mov     edx, dword [taskctl]                    ; 5B96 _ 8B. 15, 000022C8(d)
        mov     eax, dword [ebp-4H]                     ; 5B9C _ 8B. 45, FC
        imul    eax, eax, 52                            ; 5B9F _ 6B. C0, 34
        add     eax, edx                                ; 5BA2 _ 01. D0
        add     eax, 16                                 ; 5BA4 _ 83. C0, 10
        mov     dword [eax], 0                          ; 5BA7 _ C7. 00, 00000000
        add     dword [ebp-4H], 1                       ; 5BAD _ 83. 45, FC, 01
?_360:  cmp     dword [ebp-4H], 9                       ; 5BB1 _ 83. 7D, FC, 09
        jle     ?_359                                   ; 5BB5 _ 7E, DF
        leave                                           ; 5BB7 _ C9
        ret                                             ; 5BB8 _ C3
; init_task_level End of function

task_init:; Function begin
        push    ebp                                     ; 5BB9 _ 55
        mov     ebp, esp                                ; 5BBA _ 89. E5
        sub     esp, 40                                 ; 5BBC _ 83. EC, 28
        call    get_addr_gdt                            ; 5BBF _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 5BC4 _ 89. 45, F0
        mov     dword [esp+4H], 3048                    ; 5BC7 _ C7. 44 24, 04, 00000BE8
        mov     eax, dword [ebp+8H]                     ; 5BCF _ 8B. 45, 08
        mov     dword [esp], eax                        ; 5BD2 _ 89. 04 24
        call    memman_alloc_4k                         ; 5BD5 _ E8, FFFFFFFC(rel)
        mov     dword [taskctl], eax                    ; 5BDA _ A3, 000022C8(d)
        mov     dword [ebp-14H], 0                      ; 5BDF _ C7. 45, EC, 00000000
        jmp     ?_362                                   ; 5BE6 _ E9, 0000008C

?_361:  mov     edx, dword [taskctl]                    ; 5BEB _ 8B. 15, 000022C8(d)
        mov     eax, dword [ebp-14H]                    ; 5BF1 _ 8B. 45, EC
        imul    eax, eax, 188                           ; 5BF4 _ 69. C0, 000000BC
        add     eax, edx                                ; 5BFA _ 01. D0
        add     eax, 492                                ; 5BFC _ 05, 000001EC
        mov     dword [eax], 0                          ; 5C01 _ C7. 00, 00000000
        mov     ecx, dword [taskctl]                    ; 5C07 _ 8B. 0D, 000022C8(d)
        mov     eax, dword [ebp-14H]                    ; 5C0D _ 8B. 45, EC
        add     eax, 7                                  ; 5C10 _ 83. C0, 07
        lea     edx, [eax*8]                            ; 5C13 _ 8D. 14 C5, 00000000
        mov     eax, dword [ebp-14H]                    ; 5C1A _ 8B. 45, EC
        imul    eax, eax, 188                           ; 5C1D _ 69. C0, 000000BC
        add     eax, ecx                                ; 5C23 _ 01. C8
        add     eax, 488                                ; 5C25 _ 05, 000001E8
        mov     dword [eax], edx                        ; 5C2A _ 89. 10
        mov     eax, dword [taskctl]                    ; 5C2C _ A1, 000022C8(d)
        mov     edx, dword [ebp-14H]                    ; 5C31 _ 8B. 55, EC
        imul    edx, edx, 188                           ; 5C34 _ 69. D2, 000000BC
        add     edx, 512                                ; 5C3A _ 81. C2, 00000200
        add     eax, edx                                ; 5C40 _ 01. D0
        add     eax, 20                                 ; 5C42 _ 83. C0, 14
        mov     edx, dword [ebp-14H]                    ; 5C45 _ 8B. 55, EC
        add     edx, 7                                  ; 5C48 _ 83. C2, 07
        lea     ecx, [edx*8]                            ; 5C4B _ 8D. 0C D5, 00000000
        mov     edx, dword [ebp-10H]                    ; 5C52 _ 8B. 55, F0
        add     edx, ecx                                ; 5C55 _ 01. CA
        mov     dword [esp+0CH], 137                    ; 5C57 _ C7. 44 24, 0C, 00000089
        mov     dword [esp+8H], eax                     ; 5C5F _ 89. 44 24, 08
        mov     dword [esp+4H], 103                     ; 5C63 _ C7. 44 24, 04, 00000067
        mov     dword [esp], edx                        ; 5C6B _ 89. 14 24
        call    set_segmdesc                            ; 5C6E _ E8, FFFFFFFC(rel)
        add     dword [ebp-14H], 1                      ; 5C73 _ 83. 45, EC, 01
?_362:  cmp     dword [ebp-14H], 9                      ; 5C77 _ 83. 7D, EC, 09
        jle     ?_361                                   ; 5C7B _ 0F 8E, FFFFFF6A
        mov     dword [ebp-14H], 0                      ; 5C81 _ C7. 45, EC, 00000000
        jmp     ?_364                                   ; 5C88 _ EB, 0F

?_363:  mov     eax, dword [ebp-14H]                    ; 5C8A _ 8B. 45, EC
        mov     dword [esp], eax                        ; 5C8D _ 89. 04 24
        call    init_task_level                         ; 5C90 _ E8, FFFFFFFC(rel)
        add     dword [ebp-14H], 1                      ; 5C95 _ 83. 45, EC, 01
?_364:  cmp     dword [ebp-14H], 9                      ; 5C99 _ 83. 7D, EC, 09
        jle     ?_363                                   ; 5C9D _ 7E, EB
        call    task_alloc                              ; 5C9F _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 5CA4 _ 89. 45, F4
        mov     eax, dword [ebp-0CH]                    ; 5CA7 _ 8B. 45, F4
        mov     dword [eax+4H], 2                       ; 5CAA _ C7. 40, 04, 00000002
        mov     eax, dword [ebp-0CH]                    ; 5CB1 _ 8B. 45, F4
        mov     dword [eax+8H], 100                     ; 5CB4 _ C7. 40, 08, 00000064
        mov     eax, dword [ebp-0CH]                    ; 5CBB _ 8B. 45, F4
        mov     dword [eax+0CH], 0                      ; 5CBE _ C7. 40, 0C, 00000000
        mov     eax, dword [ebp-0CH]                    ; 5CC5 _ 8B. 45, F4
        mov     dword [esp], eax                        ; 5CC8 _ 89. 04 24
        call    task_add                                ; 5CCB _ E8, FFFFFFFC(rel)
        call    task_switchsub                          ; 5CD0 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 5CD5 _ 8B. 45, F4
        mov     eax, dword [eax]                        ; 5CD8 _ 8B. 00
        mov     dword [esp], eax                        ; 5CDA _ 89. 04 24
        call    load_tr                                 ; 5CDD _ E8, FFFFFFFC(rel)
        call    timer_alloc                             ; 5CE2 _ E8, FFFFFFFC(rel)
        mov     dword [task_timer], eax                 ; 5CE7 _ A3, 000022C4(d)
        mov     eax, dword [ebp-0CH]                    ; 5CEC _ 8B. 45, F4
        mov     eax, dword [eax+8H]                     ; 5CEF _ 8B. 40, 08
        mov     edx, eax                                ; 5CF2 _ 89. C2
        mov     eax, dword [task_timer]                 ; 5CF4 _ A1, 000022C4(d)
        mov     dword [esp+4H], edx                     ; 5CF9 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 5CFD _ 89. 04 24
        call    timer_settime                           ; 5D00 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 5D05 _ 8B. 45, F4
        leave                                           ; 5D08 _ C9
        ret                                             ; 5D09 _ C3
; task_init End of function

task_alloc:; Function begin
        push    ebp                                     ; 5D0A _ 55
        mov     ebp, esp                                ; 5D0B _ 89. E5
        sub     esp, 16                                 ; 5D0D _ 83. EC, 10
        mov     dword [ebp-8H], 0                       ; 5D10 _ C7. 45, F8, 00000000
        jmp     ?_367                                   ; 5D17 _ E9, 00000105

?_365:  mov     edx, dword [taskctl]                    ; 5D1C _ 8B. 15, 000022C8(d)
        mov     eax, dword [ebp-8H]                     ; 5D22 _ 8B. 45, F8
        imul    eax, eax, 188                           ; 5D25 _ 69. C0, 000000BC
        add     eax, edx                                ; 5D2B _ 01. D0
        add     eax, 492                                ; 5D2D _ 05, 000001EC
        mov     eax, dword [eax]                        ; 5D32 _ 8B. 00
        test    eax, eax                                ; 5D34 _ 85. C0
        jne     ?_366                                   ; 5D36 _ 0F 85, 000000E1
        mov     eax, dword [taskctl]                    ; 5D3C _ A1, 000022C8(d)
        mov     edx, dword [ebp-8H]                     ; 5D41 _ 8B. 55, F8
        imul    edx, edx, 188                           ; 5D44 _ 69. D2, 000000BC
        add     edx, 480                                ; 5D4A _ 81. C2, 000001E0
        add     eax, edx                                ; 5D50 _ 01. D0
        add     eax, 8                                  ; 5D52 _ 83. C0, 08
        mov     dword [ebp-4H], eax                     ; 5D55 _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 5D58 _ 8B. 45, FC
        mov     dword [eax+4H], 1                       ; 5D5B _ C7. 40, 04, 00000001
        mov     eax, dword [ebp-4H]                     ; 5D62 _ 8B. 45, FC
        mov     dword [eax+50H], 514                    ; 5D65 _ C7. 40, 50, 00000202
        mov     eax, dword [ebp-4H]                     ; 5D6C _ 8B. 45, FC
        mov     dword [eax+54H], 0                      ; 5D6F _ C7. 40, 54, 00000000
        mov     eax, dword [ebp-4H]                     ; 5D76 _ 8B. 45, FC
        mov     dword [eax+58H], 0                      ; 5D79 _ C7. 40, 58, 00000000
        mov     eax, dword [ebp-4H]                     ; 5D80 _ 8B. 45, FC
        mov     dword [eax+5CH], 0                      ; 5D83 _ C7. 40, 5C, 00000000
        mov     eax, dword [ebp-4H]                     ; 5D8A _ 8B. 45, FC
        mov     dword [eax+60H], 0                      ; 5D8D _ C7. 40, 60, 00000000
        mov     eax, dword [ebp-4H]                     ; 5D94 _ 8B. 45, FC
        mov     dword [eax+68H], 0                      ; 5D97 _ C7. 40, 68, 00000000
        mov     eax, dword [ebp-8H]                     ; 5D9E _ 8B. 45, F8
        add     eax, 1                                  ; 5DA1 _ 83. C0, 01
        shl     eax, 9                                  ; 5DA4 _ C1. E0, 09
        mov     edx, eax                                ; 5DA7 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 5DA9 _ 8B. 45, FC
        mov     dword [eax+64H], edx                    ; 5DAC _ 89. 50, 64
        mov     eax, dword [ebp-4H]                     ; 5DAF _ 8B. 45, FC
        mov     dword [eax+6CH], 0                      ; 5DB2 _ C7. 40, 6C, 00000000
        mov     eax, dword [ebp-4H]                     ; 5DB9 _ 8B. 45, FC
        mov     dword [eax+70H], 0                      ; 5DBC _ C7. 40, 70, 00000000
        mov     eax, dword [ebp-4H]                     ; 5DC3 _ 8B. 45, FC
        mov     dword [eax+74H], 0                      ; 5DC6 _ C7. 40, 74, 00000000
        mov     eax, dword [ebp-4H]                     ; 5DCD _ 8B. 45, FC
        mov     dword [eax+80H], 0                      ; 5DD0 _ C7. 80, 00000080, 00000000
        mov     eax, dword [ebp-4H]                     ; 5DDA _ 8B. 45, FC
        mov     dword [eax+84H], 0                      ; 5DDD _ C7. 80, 00000084, 00000000
        mov     eax, dword [ebp-4H]                     ; 5DE7 _ 8B. 45, FC
        mov     dword [eax+88H], 0                      ; 5DEA _ C7. 80, 00000088, 00000000
        mov     eax, dword [ebp-4H]                     ; 5DF4 _ 8B. 45, FC
        mov     dword [eax+34H], 0                      ; 5DF7 _ C7. 40, 34, 00000000
        mov     eax, dword [ebp-4H]                     ; 5DFE _ 8B. 45, FC
        mov     dword [eax+8CH], 0                      ; 5E01 _ C7. 80, 0000008C, 00000000
        mov     eax, dword [ebp-4H]                     ; 5E0B _ 8B. 45, FC
        mov     dword [eax+90H], 1073741824             ; 5E0E _ C7. 80, 00000090, 40000000
        mov     eax, dword [ebp-4H]                     ; 5E18 _ 8B. 45, FC
        jmp     ?_368                                   ; 5E1B _ EB, 13

?_366:  add     dword [ebp-8H], 1                       ; 5E1D _ 83. 45, F8, 01
?_367:  cmp     dword [ebp-8H], 9                       ; 5E21 _ 83. 7D, F8, 09
        jle     ?_365                                   ; 5E25 _ 0F 8E, FFFFFEF1
        mov     eax, 0                                  ; 5E2B _ B8, 00000000
?_368:  leave                                           ; 5E30 _ C9
        ret                                             ; 5E31 _ C3
; task_alloc End of function

task_run:; Function begin
        push    ebp                                     ; 5E32 _ 55
        mov     ebp, esp                                ; 5E33 _ 89. E5
        sub     esp, 24                                 ; 5E35 _ 83. EC, 18
        cmp     dword [ebp+0CH], 0                      ; 5E38 _ 83. 7D, 0C, 00
        jns     ?_369                                   ; 5E3C _ 79, 09
        mov     eax, dword [ebp+8H]                     ; 5E3E _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 5E41 _ 8B. 40, 0C
        mov     dword [ebp+0CH], eax                    ; 5E44 _ 89. 45, 0C
?_369:  cmp     dword [ebp+10H], 0                      ; 5E47 _ 83. 7D, 10, 00
        jle     ?_370                                   ; 5E4B _ 7E, 09
        mov     eax, dword [ebp+8H]                     ; 5E4D _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 5E50 _ 8B. 55, 10
        mov     dword [eax+8H], edx                     ; 5E53 _ 89. 50, 08
?_370:  mov     eax, dword [ebp+8H]                     ; 5E56 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 5E59 _ 8B. 40, 04
        cmp     eax, 2                                  ; 5E5C _ 83. F8, 02
        jnz     ?_371                                   ; 5E5F _ 75, 16
        mov     eax, dword [ebp+8H]                     ; 5E61 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 5E64 _ 8B. 40, 0C
        cmp     eax, dword [ebp+0CH]                    ; 5E67 _ 3B. 45, 0C
        jz      ?_371                                   ; 5E6A _ 74, 0B
        mov     eax, dword [ebp+8H]                     ; 5E6C _ 8B. 45, 08
        mov     dword [esp], eax                        ; 5E6F _ 89. 04 24
        call    task_remove                             ; 5E72 _ E8, FFFFFFFC(rel)
?_371:  mov     eax, dword [ebp+8H]                     ; 5E77 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 5E7A _ 8B. 40, 04
        cmp     eax, 2                                  ; 5E7D _ 83. F8, 02
        jz      ?_372                                   ; 5E80 _ 74, 14
        mov     eax, dword [ebp+8H]                     ; 5E82 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 5E85 _ 8B. 55, 0C
        mov     dword [eax+0CH], edx                    ; 5E88 _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 5E8B _ 8B. 45, 08
        mov     dword [esp], eax                        ; 5E8E _ 89. 04 24
        call    task_add                                ; 5E91 _ E8, FFFFFFFC(rel)
?_372:  mov     eax, dword [taskctl]                    ; 5E96 _ A1, 000022C8(d)
        mov     dword [eax+4H], 1                       ; 5E9B _ C7. 40, 04, 00000001
        nop                                             ; 5EA2 _ 90
        leave                                           ; 5EA3 _ C9
        ret                                             ; 5EA4 _ C3
; task_run End of function

task_switch:; Function begin
        push    ebp                                     ; 5EA5 _ 55
        mov     ebp, esp                                ; 5EA6 _ 89. E5
        sub     esp, 40                                 ; 5EA8 _ 83. EC, 28
        mov     ecx, dword [taskctl]                    ; 5EAB _ 8B. 0D, 000022C8(d)
        mov     eax, dword [taskctl]                    ; 5EB1 _ A1, 000022C8(d)
        mov     edx, dword [eax]                        ; 5EB6 _ 8B. 10
        mov     eax, edx                                ; 5EB8 _ 89. D0
        add     eax, eax                                ; 5EBA _ 01. C0
        add     eax, edx                                ; 5EBC _ 01. D0
        shl     eax, 4                                  ; 5EBE _ C1. E0, 04
        add     eax, ecx                                ; 5EC1 _ 01. C8
        add     eax, 8                                  ; 5EC3 _ 83. C0, 08
        mov     dword [ebp-14H], eax                    ; 5EC6 _ 89. 45, EC
        mov     eax, dword [ebp-14H]                    ; 5EC9 _ 8B. 45, EC
        mov     edx, dword [eax+4H]                     ; 5ECC _ 8B. 50, 04
        mov     eax, dword [ebp-14H]                    ; 5ECF _ 8B. 45, EC
        mov     eax, dword [eax+edx*4+8H]               ; 5ED2 _ 8B. 44 90, 08
        mov     dword [ebp-10H], eax                    ; 5ED6 _ 89. 45, F0
        mov     eax, dword [ebp-14H]                    ; 5ED9 _ 8B. 45, EC
        mov     eax, dword [eax+4H]                     ; 5EDC _ 8B. 40, 04
        lea     edx, [eax+1H]                           ; 5EDF _ 8D. 50, 01
        mov     eax, dword [ebp-14H]                    ; 5EE2 _ 8B. 45, EC
        mov     dword [eax+4H], edx                     ; 5EE5 _ 89. 50, 04
        mov     eax, dword [ebp-14H]                    ; 5EE8 _ 8B. 45, EC
        mov     edx, dword [eax+4H]                     ; 5EEB _ 8B. 50, 04
        mov     eax, dword [ebp-14H]                    ; 5EEE _ 8B. 45, EC
        mov     eax, dword [eax]                        ; 5EF1 _ 8B. 00
        cmp     edx, eax                                ; 5EF3 _ 39. C2
        jnz     ?_373                                   ; 5EF5 _ 75, 0A
        mov     eax, dword [ebp-14H]                    ; 5EF7 _ 8B. 45, EC
        mov     dword [eax+4H], 0                       ; 5EFA _ C7. 40, 04, 00000000
?_373:  mov     eax, dword [taskctl]                    ; 5F01 _ A1, 000022C8(d)
        mov     eax, dword [eax+4H]                     ; 5F06 _ 8B. 40, 04
        test    eax, eax                                ; 5F09 _ 85. C0
        jz      ?_374                                   ; 5F0B _ 74, 23
        call    task_switchsub                          ; 5F0D _ E8, FFFFFFFC(rel)
        mov     ecx, dword [taskctl]                    ; 5F12 _ 8B. 0D, 000022C8(d)
        mov     eax, dword [taskctl]                    ; 5F18 _ A1, 000022C8(d)
        mov     edx, dword [eax]                        ; 5F1D _ 8B. 10
        mov     eax, edx                                ; 5F1F _ 89. D0
        add     eax, eax                                ; 5F21 _ 01. C0
        add     eax, edx                                ; 5F23 _ 01. D0
        shl     eax, 4                                  ; 5F25 _ C1. E0, 04
        add     eax, ecx                                ; 5F28 _ 01. C8
        add     eax, 8                                  ; 5F2A _ 83. C0, 08
        mov     dword [ebp-14H], eax                    ; 5F2D _ 89. 45, EC
?_374:  mov     eax, dword [ebp-14H]                    ; 5F30 _ 8B. 45, EC
        mov     edx, dword [eax+4H]                     ; 5F33 _ 8B. 50, 04
        mov     eax, dword [ebp-14H]                    ; 5F36 _ 8B. 45, EC
        mov     eax, dword [eax+edx*4+8H]               ; 5F39 _ 8B. 44 90, 08
        mov     dword [ebp-0CH], eax                    ; 5F3D _ 89. 45, F4
        mov     eax, dword [ebp-0CH]                    ; 5F40 _ 8B. 45, F4
        mov     eax, dword [eax+8H]                     ; 5F43 _ 8B. 40, 08
        mov     edx, eax                                ; 5F46 _ 89. C2
        mov     eax, dword [task_timer]                 ; 5F48 _ A1, 000022C4(d)
        mov     dword [esp+4H], edx                     ; 5F4D _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 5F51 _ 89. 04 24
        call    timer_settime                           ; 5F54 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 5F59 _ 8B. 45, F4
        cmp     eax, dword [ebp-10H]                    ; 5F5C _ 3B. 45, F0
        jz      ?_375                                   ; 5F5F _ 74, 1B
        cmp     dword [ebp-0CH], 0                      ; 5F61 _ 83. 7D, F4, 00
        jz      ?_375                                   ; 5F65 _ 74, 15
        mov     eax, dword [ebp-0CH]                    ; 5F67 _ 8B. 45, F4
        mov     eax, dword [eax]                        ; 5F6A _ 8B. 00
        mov     dword [esp+4H], eax                     ; 5F6C _ 89. 44 24, 04
        mov     dword [esp], 0                          ; 5F70 _ C7. 04 24, 00000000
        call    farjmp                                  ; 5F77 _ E8, FFFFFFFC(rel)
?_375:  nop                                             ; 5F7C _ 90
        leave                                           ; 5F7D _ C9
        ret                                             ; 5F7E _ C3
; task_switch End of function

task_sleep:; Function begin
        push    ebp                                     ; 5F7F _ 55
        mov     ebp, esp                                ; 5F80 _ 89. E5
        sub     esp, 40                                 ; 5F82 _ 83. EC, 28
        mov     dword [ebp-0CH], 0                      ; 5F85 _ C7. 45, F4, 00000000
        mov     dword [ebp-10H], 0                      ; 5F8C _ C7. 45, F0, 00000000
        mov     eax, dword [ebp+8H]                     ; 5F93 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 5F96 _ 8B. 40, 04
        cmp     eax, 2                                  ; 5F99 _ 83. F8, 02
        jnz     ?_376                                   ; 5F9C _ 75, 51
        call    task_now                                ; 5F9E _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 5FA3 _ 89. 45, F4
        mov     eax, dword [ebp+8H]                     ; 5FA6 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 5FA9 _ 89. 04 24
        call    task_remove                             ; 5FAC _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], 1                      ; 5FB1 _ C7. 45, F0, 00000001
        mov     eax, dword [ebp+8H]                     ; 5FB8 _ 8B. 45, 08
        cmp     eax, dword [ebp-0CH]                    ; 5FBB _ 3B. 45, F4
        jnz     ?_376                                   ; 5FBE _ 75, 2F
        call    task_switchsub                          ; 5FC0 _ E8, FFFFFFFC(rel)
        call    task_now                                ; 5FC5 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 5FCA _ 89. 45, F4
        mov     dword [ebp-10H], 2                      ; 5FCD _ C7. 45, F0, 00000002
        cmp     dword [ebp-0CH], 0                      ; 5FD4 _ 83. 7D, F4, 00
        jz      ?_376                                   ; 5FD8 _ 74, 15
        mov     eax, dword [ebp-0CH]                    ; 5FDA _ 8B. 45, F4
        mov     eax, dword [eax]                        ; 5FDD _ 8B. 00
        mov     dword [esp+4H], eax                     ; 5FDF _ 89. 44 24, 04
        mov     dword [esp], 0                          ; 5FE3 _ C7. 04 24, 00000000
        call    farjmp                                  ; 5FEA _ E8, FFFFFFFC(rel)
?_376:  mov     eax, dword [ebp-10H]                    ; 5FEF _ 8B. 45, F0
        leave                                           ; 5FF2 _ C9
        ret                                             ; 5FF3 _ C3
; task_sleep End of function

task_now:; Function begin
        push    ebp                                     ; 5FF4 _ 55
        mov     ebp, esp                                ; 5FF5 _ 89. E5
        sub     esp, 16                                 ; 5FF7 _ 83. EC, 10
        mov     ecx, dword [taskctl]                    ; 5FFA _ 8B. 0D, 000022C8(d)
        mov     eax, dword [taskctl]                    ; 6000 _ A1, 000022C8(d)
        mov     edx, dword [eax]                        ; 6005 _ 8B. 10
        mov     eax, edx                                ; 6007 _ 89. D0
        add     eax, eax                                ; 6009 _ 01. C0
        add     eax, edx                                ; 600B _ 01. D0
        shl     eax, 4                                  ; 600D _ C1. E0, 04
        add     eax, ecx                                ; 6010 _ 01. C8
        add     eax, 8                                  ; 6012 _ 83. C0, 08
        mov     dword [ebp-4H], eax                     ; 6015 _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 6018 _ 8B. 45, FC
        mov     edx, dword [eax+4H]                     ; 601B _ 8B. 50, 04
        mov     eax, dword [ebp-4H]                     ; 601E _ 8B. 45, FC
        mov     eax, dword [eax+edx*4+8H]               ; 6021 _ 8B. 44 90, 08
        leave                                           ; 6025 _ C9
        ret                                             ; 6026 _ C3
; task_now End of function

task_add:; Function begin
        push    ebp                                     ; 6027 _ 55
        mov     ebp, esp                                ; 6028 _ 89. E5
        sub     esp, 16                                 ; 602A _ 83. EC, 10
        mov     ecx, dword [taskctl]                    ; 602D _ 8B. 0D, 000022C8(d)
        mov     eax, dword [ebp+8H]                     ; 6033 _ 8B. 45, 08
        mov     edx, dword [eax+0CH]                    ; 6036 _ 8B. 50, 0C
        mov     eax, edx                                ; 6039 _ 89. D0
        add     eax, eax                                ; 603B _ 01. C0
        add     eax, edx                                ; 603D _ 01. D0
        shl     eax, 4                                  ; 603F _ C1. E0, 04
        add     eax, ecx                                ; 6042 _ 01. C8
        add     eax, 8                                  ; 6044 _ 83. C0, 08
        mov     dword [ebp-4H], eax                     ; 6047 _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 604A _ 8B. 45, FC
        mov     edx, dword [eax]                        ; 604D _ 8B. 10
        mov     eax, dword [ebp-4H]                     ; 604F _ 8B. 45, FC
        mov     ecx, dword [ebp+8H]                     ; 6052 _ 8B. 4D, 08
        mov     dword [eax+edx*4+8H], ecx               ; 6055 _ 89. 4C 90, 08
        mov     eax, dword [ebp-4H]                     ; 6059 _ 8B. 45, FC
        mov     eax, dword [eax]                        ; 605C _ 8B. 00
        lea     edx, [eax+1H]                           ; 605E _ 8D. 50, 01
        mov     eax, dword [ebp-4H]                     ; 6061 _ 8B. 45, FC
        mov     dword [eax], edx                        ; 6064 _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 6066 _ 8B. 45, 08
        mov     dword [eax+4H], 2                       ; 6069 _ C7. 40, 04, 00000002
        nop                                             ; 6070 _ 90
        leave                                           ; 6071 _ C9
        ret                                             ; 6072 _ C3
; task_add End of function

task_remove:; Function begin
        push    ebp                                     ; 6073 _ 55
        mov     ebp, esp                                ; 6074 _ 89. E5
        sub     esp, 16                                 ; 6076 _ 83. EC, 10
        mov     ecx, dword [taskctl]                    ; 6079 _ 8B. 0D, 000022C8(d)
        mov     eax, dword [ebp+8H]                     ; 607F _ 8B. 45, 08
        mov     edx, dword [eax+0CH]                    ; 6082 _ 8B. 50, 0C
        mov     eax, edx                                ; 6085 _ 89. D0
        add     eax, eax                                ; 6087 _ 01. C0
        add     eax, edx                                ; 6089 _ 01. D0
        shl     eax, 4                                  ; 608B _ C1. E0, 04
        add     eax, ecx                                ; 608E _ 01. C8
        add     eax, 8                                  ; 6090 _ 83. C0, 08
        mov     dword [ebp-4H], eax                     ; 6093 _ 89. 45, FC
        mov     dword [ebp-8H], 0                       ; 6096 _ C7. 45, F8, 00000000
        jmp     ?_379                                   ; 609D _ EB, 23

?_377:  mov     eax, dword [ebp-4H]                     ; 609F _ 8B. 45, FC
        mov     edx, dword [ebp-8H]                     ; 60A2 _ 8B. 55, F8
        mov     eax, dword [eax+edx*4+8H]               ; 60A5 _ 8B. 44 90, 08
        cmp     eax, dword [ebp+8H]                     ; 60A9 _ 3B. 45, 08
        jnz     ?_378                                   ; 60AC _ 75, 10
        mov     eax, dword [ebp-4H]                     ; 60AE _ 8B. 45, FC
        mov     edx, dword [ebp-8H]                     ; 60B1 _ 8B. 55, F8
        mov     dword [eax+edx*4+8H], 0                 ; 60B4 _ C7. 44 90, 08, 00000000
        jmp     ?_380                                   ; 60BC _ EB, 0E

?_378:  add     dword [ebp-8H], 1                       ; 60BE _ 83. 45, F8, 01
?_379:  mov     eax, dword [ebp-4H]                     ; 60C2 _ 8B. 45, FC
        mov     eax, dword [eax]                        ; 60C5 _ 8B. 00
        cmp     eax, dword [ebp-8H]                     ; 60C7 _ 3B. 45, F8
        jg      ?_377                                   ; 60CA _ 7F, D3
?_380:  mov     eax, dword [ebp-4H]                     ; 60CC _ 8B. 45, FC
        mov     eax, dword [eax]                        ; 60CF _ 8B. 00
        lea     edx, [eax-1H]                           ; 60D1 _ 8D. 50, FF
        mov     eax, dword [ebp-4H]                     ; 60D4 _ 8B. 45, FC
        mov     dword [eax], edx                        ; 60D7 _ 89. 10
        mov     eax, dword [ebp-4H]                     ; 60D9 _ 8B. 45, FC
        mov     eax, dword [eax+4H]                     ; 60DC _ 8B. 40, 04
        cmp     eax, dword [ebp-8H]                     ; 60DF _ 3B. 45, F8
        jle     ?_381                                   ; 60E2 _ 7E, 0F
        mov     eax, dword [ebp-4H]                     ; 60E4 _ 8B. 45, FC
        mov     eax, dword [eax+4H]                     ; 60E7 _ 8B. 40, 04
        lea     edx, [eax-1H]                           ; 60EA _ 8D. 50, FF
        mov     eax, dword [ebp-4H]                     ; 60ED _ 8B. 45, FC
        mov     dword [eax+4H], edx                     ; 60F0 _ 89. 50, 04
?_381:  mov     eax, dword [ebp-4H]                     ; 60F3 _ 8B. 45, FC
        mov     edx, dword [eax+4H]                     ; 60F6 _ 8B. 50, 04
        mov     eax, dword [ebp-4H]                     ; 60F9 _ 8B. 45, FC
        mov     eax, dword [eax]                        ; 60FC _ 8B. 00
        cmp     edx, eax                                ; 60FE _ 39. C2
        jl      ?_382                                   ; 6100 _ 7C, 0A
        mov     eax, dword [ebp-4H]                     ; 6102 _ 8B. 45, FC
        mov     dword [eax+4H], 0                       ; 6105 _ C7. 40, 04, 00000000
?_382:  mov     eax, dword [ebp+8H]                     ; 610C _ 8B. 45, 08
        mov     dword [eax+4H], 1                       ; 610F _ C7. 40, 04, 00000001
        jmp     ?_384                                   ; 6116 _ EB, 1B

?_383:  mov     eax, dword [ebp-8H]                     ; 6118 _ 8B. 45, F8
        lea     edx, [eax+1H]                           ; 611B _ 8D. 50, 01
        mov     eax, dword [ebp-4H]                     ; 611E _ 8B. 45, FC
        mov     ecx, dword [eax+edx*4+8H]               ; 6121 _ 8B. 4C 90, 08
        mov     eax, dword [ebp-4H]                     ; 6125 _ 8B. 45, FC
        mov     edx, dword [ebp-8H]                     ; 6128 _ 8B. 55, F8
        mov     dword [eax+edx*4+8H], ecx               ; 612B _ 89. 4C 90, 08
        add     dword [ebp-8H], 1                       ; 612F _ 83. 45, F8, 01
?_384:  mov     eax, dword [ebp-4H]                     ; 6133 _ 8B. 45, FC
        mov     eax, dword [eax]                        ; 6136 _ 8B. 00
        cmp     eax, dword [ebp-8H]                     ; 6138 _ 3B. 45, F8
        jg      ?_383                                   ; 613B _ 7F, DB
        nop                                             ; 613D _ 90
        leave                                           ; 613E _ C9
        ret                                             ; 613F _ C3
; task_remove End of function

task_switchsub:; Function begin
        push    ebp                                     ; 6140 _ 55
        mov     ebp, esp                                ; 6141 _ 89. E5
        sub     esp, 16                                 ; 6143 _ 83. EC, 10
        mov     dword [ebp-4H], 0                       ; 6146 _ C7. 45, FC, 00000000
        jmp     ?_387                                   ; 614D _ EB, 23

?_385:  mov     ecx, dword [taskctl]                    ; 614F _ 8B. 0D, 000022C8(d)
        mov     edx, dword [ebp-4H]                     ; 6155 _ 8B. 55, FC
        mov     eax, edx                                ; 6158 _ 89. D0
        add     eax, eax                                ; 615A _ 01. C0
        add     eax, edx                                ; 615C _ 01. D0
        shl     eax, 4                                  ; 615E _ C1. E0, 04
        add     eax, ecx                                ; 6161 _ 01. C8
        add     eax, 8                                  ; 6163 _ 83. C0, 08
        mov     eax, dword [eax]                        ; 6166 _ 8B. 00
        test    eax, eax                                ; 6168 _ 85. C0
        jle     ?_386                                   ; 616A _ 7E, 02
        jmp     ?_388                                   ; 616C _ EB, 0A

?_386:  add     dword [ebp-4H], 1                       ; 616E _ 83. 45, FC, 01
?_387:  cmp     dword [ebp-4H], 9                       ; 6172 _ 83. 7D, FC, 09
        jle     ?_385                                   ; 6176 _ 7E, D7
?_388:  mov     eax, dword [taskctl]                    ; 6178 _ A1, 000022C8(d)
        mov     edx, dword [ebp-4H]                     ; 617D _ 8B. 55, FC
        mov     dword [eax], edx                        ; 6180 _ 89. 10
        mov     eax, dword [taskctl]                    ; 6182 _ A1, 000022C8(d)
        mov     dword [eax+4H], 0                       ; 6187 _ C7. 40, 04, 00000000
        leave                                           ; 618E _ C9
        ret                                             ; 618F _ C3
; task_switchsub End of function

send_message:; Function begin
        push    ebp                                     ; 6190 _ 55
        mov     ebp, esp                                ; 6191 _ 89. E5
        sub     esp, 24                                 ; 6193 _ 83. EC, 18
        mov     eax, dword [ebp+10H]                    ; 6196 _ 8B. 45, 10
        movzx   eax, al                                 ; 6199 _ 0F B6. C0
        mov     edx, dword [ebp+0CH]                    ; 619C _ 8B. 55, 0C
        add     edx, 16                                 ; 619F _ 83. C2, 10
        mov     dword [esp+4H], eax                     ; 61A2 _ 89. 44 24, 04
        mov     dword [esp], edx                        ; 61A6 _ 89. 14 24
        call    fifo8_put                               ; 61A9 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 61AE _ 8B. 45, 08
        mov     dword [esp], eax                        ; 61B1 _ 89. 04 24
        call    task_sleep                              ; 61B4 _ E8, FFFFFFFC(rel)
        leave                                           ; 61B9 _ C9
        ret                                             ; 61BA _ C3
; send_message End of function



?_389:                                                  ; byte
        db 63H, 6FH, 75H, 6EH, 74H, 65H, 72H, 00H       ; 0000 _ counter.

?_390:                                                  ; byte
        db 74H, 61H, 73H, 6BH, 5FH, 61H, 00H            ; 0008 _ task_a.

?_391:                                                  ; byte
        db 63H, 6FH, 6EH, 73H, 6FH, 6CH, 65H, 00H       ; 000F _ console.

?_392:                                                  ; byte
        db 20H, 00H                                     ; 0017 _  .

?_393:                                                  ; byte
        db 66H, 72H, 65H, 65H, 20H, 00H                 ; 0019 _ free .

?_394:                                                  ; byte
        db 20H, 4BH, 42H, 00H                           ; 001F _  KB.

?_395:                                                  ; byte
        db 3EH, 00H                                     ; 0023 _ >.

?_396:                                                  ; byte
        db 68H, 6CH, 74H, 2EH, 65H, 78H, 65H, 00H       ; 0025 _ hlt.exe.

?_397:                                                  ; byte
        db 6DH, 65H, 6DH, 00H                           ; 002D _ mem.

?_398:                                                  ; byte
        db 63H, 6CH, 73H, 00H                           ; 0031 _ cls.

?_399:                                                  ; byte
        db 68H, 6CH, 74H, 00H                           ; 0035 _ hlt.

?_400:                                                  ; byte
        db 64H, 69H, 72H, 00H                           ; 0039 _ dir.

?_401:                                                  ; byte
        db 65H, 78H, 69H, 74H, 00H                      ; 003D _ exit.

?_402:                                                  ; byte
        db 73H, 74H, 61H, 72H, 74H, 00H                 ; 0042 _ start.

?_403:                                                  ; byte
        db 6EH, 63H, 73H, 74H, 00H                      ; 0048 _ ncst.

?_404:                                                  ; byte
        db 6BH, 65H, 79H, 62H, 6FH, 61H, 72H, 64H       ; 004D _ keyboard
        db 00H                                          ; 0055 _ .

?_405:                                                  ; byte
        db 75H, 73H, 65H, 72H, 20H, 70H, 72H, 6FH       ; 0056 _ user pro
        db 63H, 00H                                     ; 005E _ c.

?_406:                                                  ; byte
        db 70H, 61H, 67H, 65H, 20H, 69H, 73H, 3AH       ; 0060 _ page is:
        db 20H, 00H                                     ; 0068 _  .

?_407:                                                  ; byte
        db 42H, 61H, 73H, 65H, 41H, 64H, 64H, 72H       ; 006A _ BaseAddr
        db 4CH, 3AH, 20H, 00H                           ; 0072 _ L: .

?_408:                                                  ; byte
        db 42H, 61H, 73H, 65H, 41H, 64H, 64H, 72H       ; 0076 _ BaseAddr
        db 48H, 3AH, 20H, 00H                           ; 007E _ H: .

?_409:                                                  ; byte
        db 6CH, 65H, 6EH, 67H, 74H, 68H, 4CH, 6FH       ; 0082 _ lengthLo
        db 77H, 3AH, 20H, 00H                           ; 008A _ w: .

?_410:                                                  ; byte
        db 49H, 4EH, 54H, 20H, 4FH, 43H, 00H            ; 008E _ INT OC.

?_411:                                                  ; byte
        db 53H, 74H, 61H, 63H, 6BH, 20H, 45H, 78H       ; 0095 _ Stack Ex
        db 63H, 65H, 70H, 74H, 69H, 6FH, 6EH, 00H       ; 009D _ ception.

?_412:                                                  ; byte
        db 45H, 49H, 50H, 20H, 3DH, 20H, 00H            ; 00A5 _ EIP = .

?_413:                                                  ; byte
        db 49H, 4EH, 54H, 20H, 30H, 44H, 20H, 00H       ; 00AC _ INT 0D .

?_414:                                                  ; byte
        db 47H, 65H, 6EH, 65H, 72H, 61H, 6CH, 20H       ; 00B4 _ General 
        db 50H, 72H, 6FH, 74H, 65H, 63H, 74H, 65H       ; 00BC _ Protecte
        db 64H, 20H, 45H, 78H, 63H, 65H, 70H, 74H       ; 00C4 _ d Except
        db 69H, 6FH, 6EH, 00H                           ; 00CC _ ion.



memman:                                                 ; dword
        dd 00100000H, 00000000H                         ; 0000 _ 1048576 0 
        dd 00000000H, 00000000H                         ; 0008 _ 0 0 
        dd 00000000H, 00000000H                         ; 0010 _ 0 0 
        dd 00000000H, 00000000H                         ; 0018 _ 0 0 

keytable:                                               ; byte
        db 00H, 00H, 31H, 32H, 33H, 34H, 35H, 36H       ; 0020 _ ..123456
        db 37H, 38H, 39H, 30H, 2DH, 5EH, 00H, 00H       ; 0028 _ 7890-^..
        db 51H, 57H, 45H, 52H, 54H, 59H, 55H, 49H       ; 0030 _ QWERTYUI
        db 4FH, 50H, 40H, 5BH, 00H, 00H, 41H, 53H       ; 0038 _ OP@[..AS
        db 44H, 46H, 47H, 48H, 4AH, 4BH, 4CH, 3BH       ; 0040 _ DFGHJKL;
        db 3AH, 00H, 00H, 5DH, 5AH, 58H, 43H, 56H       ; 0048 _ :..]ZXCV
        db 42H, 4EH, 4DH, 2CH, 2EH, 2FH, 00H, 2AH       ; 0050 _ BNM,./.*
        db 00H, 20H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0058 _ . ......
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 37H       ; 0060 _ .......7
        db 38H, 39H, 2DH, 34H, 35H, 36H, 2BH, 31H       ; 0068 _ 89-456+1
        db 32H, 33H, 30H, 2EH, 00H, 00H, 00H, 00H       ; 0070 _ 230.....
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0078 _ ........

keytable1:                                              ; byte
        db 00H, 00H, 21H, 40H, 23H, 24H, 25H, 5EH       ; 0080 _ ..!@#$%^
        db 26H, 2AH, 28H, 29H, 2DH, 3DH, 7EH, 00H       ; 0088 _ &*()-=~.
        db 00H, 51H, 57H, 45H, 52H, 54H, 59H, 55H       ; 0090 _ .QWERTYU
        db 49H, 4FH, 50H, 60H, 7BH, 00H, 00H, 41H       ; 0098 _ IOP`{..A
        db 53H, 44H, 46H, 47H, 48H, 4AH, 4BH, 4CH       ; 00A0 _ SDFGHJKL
        db 2BH, 2AH, 00H, 00H, 7DH, 5AH, 58H, 43H       ; 00A8 _ +*..}ZXC
        db 56H, 42H, 4EH, 4DH, 3CH, 3EH, 3FH, 00H       ; 00B0 _ VBNM<>?.
        db 2AH, 00H, 20H, 00H, 00H, 00H, 00H, 00H       ; 00B8 _ *. .....
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 00C0 _ ........
        db 37H, 38H, 39H, 2DH, 34H, 35H, 36H, 2BH       ; 00C8 _ 789-456+
        db 31H, 32H, 33H, 30H, 2EH, 00H, 00H, 00H       ; 00D0 _ 1230....
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 00D8 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 00E0 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 00E8 _ ........
        db 00H, 00H, 00H, 00H, 5FH, 00H, 00H, 00H       ; 00F0 _ ...._...
        db 00H, 00H, 00H, 00H, 00H, 00H, 7CH, 00H       ; 00F8 _ ......|.
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0100 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0108 _ ........

keyval:                                                 ; byte
        db 30H, 58H                                     ; 0110 _ 0X

?_415:  db 00H                                          ; 0112 _ .

?_416:  db 00H, 00H, 00H, 00H, 00H                      ; 0113 _ .....

mmx:    dd 0FFFFFFFFH                                   ; 0118 _ -1 

mmy:    dd 0FFFFFFFFH                                   ; 011C _ -1 

KEY_CONTROL:                                            ; dword
        dd 0000001DH                                    ; 0120 _ 29 

show_console_window:                                    ; dword
        dd 00000001H, 00000000H                         ; 0124 _ 1 0 
        dd 00000000H, 00000000H                         ; 012C _ 0 0 
        dd 00000000H, 00000000H                         ; 0134 _ 0 0 
        dd 00000000H                                    ; 013C _ 0 

table_rgb.2101:                                         ; byte
        db 00H, 00H, 00H, 0FFH, 00H, 00H, 44H, 8CH      ; 0140 _ ......D.
        db 0BBH, 0FFH, 0FFH, 00H, 00H, 00H, 0FFH, 0FFH  ; 0148 _ ........
        db 00H, 0FFH, 00H, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH ; 0150 _ ........
        db 0C6H, 0C6H, 0C6H, 84H, 00H, 00H, 00H, 84H    ; 0158 _ ........
        db 00H, 84H, 84H, 00H, 00H, 00H, 84H, 84H       ; 0160 _ ........
        db 00H, 84H, 00H, 84H, 84H, 84H, 84H, 84H       ; 0168 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0170 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0178 _ ........

cursor.2161:                                            ; byte
        db 2AH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0180 _ *.......
        db 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0188 _ ........
        db 2AH, 2AH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0190 _ **......
        db 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0198 _ ........
        db 2AH, 4FH, 2AH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 01A0 _ *O*.....
        db 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 01A8 _ ........
        db 2AH, 4FH, 4FH, 2AH, 2EH, 2EH, 2EH, 2EH       ; 01B0 _ *OO*....
        db 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 01B8 _ ........
        db 2AH, 4FH, 4FH, 4FH, 2AH, 2EH, 2EH, 2EH       ; 01C0 _ *OOO*...
        db 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 01C8 _ ........
        db 2AH, 4FH, 4FH, 4FH, 4FH, 2AH, 2EH, 2EH       ; 01D0 _ *OOOO*..
        db 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 01D8 _ ........
        db 2AH, 4FH, 4FH, 4FH, 4FH, 4FH, 2AH, 2EH       ; 01E0 _ *OOOOO*.
        db 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 01E8 _ ........
        db 2AH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 2AH       ; 01F0 _ *OOOOOO*
        db 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 01F8 _ ........
        db 2AH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH       ; 0200 _ *OOOOOOO
        db 2AH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0208 _ *.......
        db 2AH, 4FH, 4FH, 4FH, 4FH, 2AH, 2AH, 2AH       ; 0210 _ *OOOO***
        db 2AH, 2AH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0218 _ **......
        db 2AH, 4FH, 4FH, 2AH, 4FH, 2AH, 2EH, 2EH       ; 0220 _ *OO*O*..
        db 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0228 _ ........
        db 2AH, 4FH, 2AH, 2EH, 2AH, 4FH, 2AH, 2EH       ; 0230 _ *O*.*O*.
        db 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0238 _ ........
        db 2AH, 2AH, 2EH, 2EH, 2AH, 4FH, 2AH, 2EH       ; 0240 _ **..*O*.
        db 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0248 _ ........
        db 2AH, 2EH, 2EH, 2EH, 2EH, 2AH, 4FH, 2AH       ; 0250 _ *....*O*
        db 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0258 _ ........
        db 2EH, 2EH, 2EH, 2EH, 2EH, 2AH, 4FH, 2AH       ; 0260 _ .....*O*
        db 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0268 _ ........
        db 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2AH, 2EH       ; 0270 _ ......*.
        db 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0278 _ ........

closebtn.2280:                                          ; byte
        db 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH       ; 0280 _ OOOOOOOO
        db 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 40H       ; 0288 _ OOOOOOO@
        db 4FH, 51H, 51H, 51H, 51H, 51H, 51H, 51H       ; 0290 _ OQQQQQQQ
        db 51H, 51H, 51H, 51H, 51H, 51H, 24H, 40H       ; 0298 _ QQQQQQ$@
        db 4FH, 51H, 51H, 51H, 51H, 51H, 51H, 51H       ; 02A0 _ OQQQQQQQ
        db 51H, 51H, 51H, 51H, 51H, 51H, 24H, 40H       ; 02A8 _ QQQQQQ$@
        db 4FH, 51H, 51H, 51H, 40H, 40H, 51H, 51H       ; 02B0 _ OQQQ@@QQ
        db 51H, 51H, 40H, 40H, 51H, 51H, 24H, 40H       ; 02B8 _ QQ@@QQ$@
        db 4FH, 51H, 51H, 51H, 51H, 40H, 40H, 51H       ; 02C0 _ OQQQQ@@Q
        db 51H, 40H, 40H, 51H, 51H, 51H, 24H, 40H       ; 02C8 _ Q@@QQQ$@
        db 4FH, 51H, 51H, 51H, 51H, 51H, 40H, 40H       ; 02D0 _ OQQQQQ@@
        db 40H, 40H, 51H, 51H, 51H, 51H, 24H, 40H       ; 02D8 _ @@QQQQ$@
        db 4FH, 51H, 51H, 51H, 51H, 51H, 51H, 40H       ; 02E0 _ OQQQQQQ@
        db 40H, 51H, 51H, 51H, 51H, 51H, 24H, 40H       ; 02E8 _ @QQQQQ$@
        db 4FH, 51H, 51H, 51H, 51H, 51H, 40H, 40H       ; 02F0 _ OQQQQQ@@
        db 40H, 40H, 51H, 51H, 51H, 51H, 24H, 40H       ; 02F8 _ @@QQQQ$@
        db 4FH, 51H, 51H, 51H, 51H, 40H, 40H, 51H       ; 0300 _ OQQQQ@@Q
        db 51H, 40H, 40H, 51H, 51H, 51H, 24H, 40H       ; 0308 _ Q@@QQQ$@
        db 4FH, 51H, 51H, 51H, 40H, 40H, 51H, 51H       ; 0310 _ OQQQ@@QQ
        db 51H, 51H, 40H, 40H, 51H, 51H, 24H, 40H       ; 0318 _ QQ@@QQ$@
        db 4FH, 51H, 51H, 51H, 51H, 51H, 51H, 51H       ; 0320 _ OQQQQQQQ
        db 51H, 51H, 51H, 51H, 51H, 51H, 24H, 40H       ; 0328 _ QQQQQQ$@
        db 4FH, 51H, 51H, 51H, 51H, 51H, 51H, 51H       ; 0330 _ OQQQQQQQ
        db 51H, 51H, 51H, 51H, 51H, 51H, 24H, 40H       ; 0338 _ QQQQQQ$@
        db 4FH, 24H, 24H, 24H, 24H, 24H, 24H, 24H       ; 0340 _ O$$$$$$$
        db 24H, 24H, 24H, 24H, 24H, 24H, 24H, 40H       ; 0348 _ $$$$$$$@
        db 40H, 40H, 40H, 40H, 40H, 40H, 40H, 40H       ; 0350 _ @@@@@@@@
        db 40H, 40H, 40H, 40H, 40H, 40H, 40H, 40H       ; 0358 _ @@@@@@@@



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

?_417:  resw    1                                       ; 0018

?_418:  resw    1                                       ; 001A

keyinfo:                                                ; byte
        resb    24                                      ; 001C

?_419:  resd    1                                       ; 0034

mouseinfo:                                              ; byte
        resb    40                                      ; 0038

keybuf:                                                 ; yword
        resb    32                                      ; 0060

mousebuf:                                               ; byte
        resb    128                                     ; 0080

mdec:                                                   ; oword
        resb    12                                      ; 0100

?_420:  resd    1                                       ; 010C

timerinfo:                                              ; byte
        resb    28                                      ; 0110

timerbuf: resq  1                                       ; 012C

mx:     resd    1                                       ; 0134

my:     resd    1                                       ; 0138

xsize:  resd    1                                       ; 013C

ysize:  resd    1                                       ; 0140

buf_back: resd  7                                       ; 0144

buf_mouse:                                              ; byte
        resb    256                                     ; 0160

shtMsgBox:                                              ; dword
        resd    1                                       ; 0260

shtctl: resd    1                                       ; 0264

sht_back: resd  1                                       ; 0268

sht_mouse:                                              ; dword
        resd    1                                       ; 026C

mouse_clicked_sht:                                      ; dword
        resd    1                                       ; 0270

task_main:                                              ; dword
        resd    1                                       ; 0274

current_console_task:                                   ; dword
        resd    1                                       ; 0278

task_a.1819:                                            ; dword
        resd    1                                       ; 027C

tss_a.1818:                                             ; byte
        resb    128                                     ; 0280

tss_b.1817:                                             ; byte
        resb    104                                     ; 0300

task_b.1807:                                            ; byte
        resb    12                                      ; 0368

str.2209:                                               ; byte
        resb    1                                       ; 0374

?_421:  resb    9                                       ; 0375

?_422:  resb    2                                       ; 037E

timerctl:                                               ; byte
        resd    2001                                    ; 0380

task_timer:                                             ; dword
        resd    1                                       ; 22C4

taskctl: resd   1                                       ; 22C8


