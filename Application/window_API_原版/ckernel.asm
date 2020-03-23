; Disassembly of file: ckernel.o
; Mon Mar 23 15:18:53 2020
; Mode: 32 bits
; Syntax: YASM/NASM
; Instruction set: Pentium Pro






CMain:  ; Function begin
        push    ebp                                     ; 0000 _ 55
        mov     ebp, esp                                ; 0001 _ 89. E5
        push    ebx                                     ; 0003 _ 53
        sub     esp, 132                                ; 0004 _ 81. EC, 00000084
        mov     dword [esp], bootInfo                   ; 000A _ C7. 04 24, 0000001C(d)
        call    initBootInfo                            ; 0011 _ E8, FFFFFFFC(rel)
        mov     eax, dword [bootInfo]                   ; 0016 _ A1, 0000001C(d)
        mov     dword [ebp-1CH], eax                    ; 001B _ 89. 45, E4
        movzx   eax, word [?_333]                       ; 001E _ 0F B7. 05, 00000020(d)
        cwde                                            ; 0025 _ 98
        mov     dword [xsize], eax                      ; 0026 _ A3, 0000013C(d)
        movzx   eax, word [?_334]                       ; 002B _ 0F B7. 05, 00000022(d)
        cwde                                            ; 0032 _ 98
        mov     dword [ysize], eax                      ; 0033 _ A3, 00000140(d)
        call    init_pit                                ; 0038 _ E8, FFFFFFFC(rel)
        mov     dword [esp+0CH], 0                      ; 003D _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], timerbuf                ; 0045 _ C7. 44 24, 08, 0000012C(d)
        mov     dword [esp+4H], 8                       ; 004D _ C7. 44 24, 04, 00000008
        mov     dword [esp], timerinfo                  ; 0055 _ C7. 04 24, 00000110(d)
        call    fifo8_init                              ; 005C _ E8, FFFFFFFC(rel)
        call    timer_alloc                             ; 0061 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-20H], eax                    ; 0066 _ 89. 45, E0
        mov     dword [esp+8H], 10                      ; 0069 _ C7. 44 24, 08, 0000000A
        mov     dword [esp+4H], timerinfo               ; 0071 _ C7. 44 24, 04, 00000110(d)
        mov     eax, dword [ebp-20H]                    ; 0079 _ 8B. 45, E0
        mov     dword [esp], eax                        ; 007C _ 89. 04 24
        call    timer_init                              ; 007F _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 100                     ; 0084 _ C7. 44 24, 04, 00000064
        mov     eax, dword [ebp-20H]                    ; 008C _ 8B. 45, E0
        mov     dword [esp], eax                        ; 008F _ 89. 04 24
        call    timer_settime                           ; 0092 _ E8, FFFFFFFC(rel)
        call    timer_alloc                             ; 0097 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-24H], eax                    ; 009C _ 89. 45, DC
        mov     dword [esp+8H], 2                       ; 009F _ C7. 44 24, 08, 00000002
        mov     dword [esp+4H], timerinfo               ; 00A7 _ C7. 44 24, 04, 00000110(d)
        mov     eax, dword [ebp-24H]                    ; 00AF _ 8B. 45, DC
        mov     dword [esp], eax                        ; 00B2 _ 89. 04 24
        call    timer_init                              ; 00B5 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 300                     ; 00BA _ C7. 44 24, 04, 0000012C
        mov     eax, dword [ebp-24H]                    ; 00C2 _ 8B. 45, DC
        mov     dword [esp], eax                        ; 00C5 _ 89. 04 24
        call    timer_settime                           ; 00C8 _ E8, FFFFFFFC(rel)
        call    timer_alloc                             ; 00CD _ E8, FFFFFFFC(rel)
        mov     dword [ebp-28H], eax                    ; 00D2 _ 89. 45, D8
        mov     dword [esp+8H], 1                       ; 00D5 _ C7. 44 24, 08, 00000001
        mov     dword [esp+4H], timerinfo               ; 00DD _ C7. 44 24, 04, 00000110(d)
        mov     eax, dword [ebp-28H]                    ; 00E5 _ 8B. 45, D8
        mov     dword [esp], eax                        ; 00E8 _ 89. 04 24
        call    timer_init                              ; 00EB _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 50                      ; 00F0 _ C7. 44 24, 04, 00000032
        mov     eax, dword [ebp-28H]                    ; 00F8 _ 8B. 45, D8
        mov     dword [esp], eax                        ; 00FB _ 89. 04 24
        call    timer_settime                           ; 00FE _ E8, FFFFFFFC(rel)
        mov     dword [esp+0CH], 0                      ; 0103 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], keybuf                  ; 010B _ C7. 44 24, 08, 00000060(d)
        mov     dword [esp+4H], 32                      ; 0113 _ C7. 44 24, 04, 00000020
        mov     dword [esp], keyinfo                    ; 011B _ C7. 04 24, 00000024(d)
        call    fifo8_init                              ; 0122 _ E8, FFFFFFFC(rel)
        mov     dword [esp+0CH], 0                      ; 0127 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], mousebuf                ; 012F _ C7. 44 24, 08, 00000080(d)
        mov     dword [esp+4H], 128                     ; 0137 _ C7. 44 24, 04, 00000080
        mov     dword [esp], mouseinfo                  ; 013F _ C7. 04 24, 00000040(d)
        call    fifo8_init                              ; 0146 _ E8, FFFFFFFC(rel)
        call    init_palette                            ; 014B _ E8, FFFFFFFC(rel)
        call    init_keyboard                           ; 0150 _ E8, FFFFFFFC(rel)
        call    get_memory_block_count                  ; 0155 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-2CH], eax                    ; 015A _ 89. 45, D4
        call    get_adr_buffer                          ; 015D _ E8, FFFFFFFC(rel)
        mov     dword [ebp-30H], eax                    ; 0162 _ 89. 45, D0
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
        mov     edx, dword [ebp-1CH]                    ; 01A8 _ 8B. 55, E4
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
        mov     dword [esp+4H], ?_304                   ; 032A _ C7. 44 24, 04, 00000000(d)
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
        mov     dword [esp+8H], 100                     ; 0369 _ C7. 44 24, 08, 00000064
        mov     dword [esp+4H], edx                     ; 0371 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0375 _ 89. 04 24
        call    sheet_updown                            ; 0378 _ E8, FFFFFFFC(rel)
        call    io_sti                                  ; 037D _ E8, FFFFFFFC(rel)
        mov     dword [esp], mdec                       ; 0382 _ C7. 04 24, 00000100(d)
        call    enable_mouse                            ; 0389 _ E8, FFFFFFFC(rel)
        mov     eax, dword [memman]                     ; 038E _ A1, 00000000(d)
        mov     dword [esp], eax                        ; 0393 _ 89. 04 24
        call    task_init                               ; 0396 _ E8, FFFFFFFC(rel)
        mov     dword [task_a.1797], eax                ; 039B _ A3, 00000284(d)
        mov     eax, dword [task_a.1797]                ; 03A0 _ A1, 00000284(d)
        mov     dword [?_335], eax                      ; 03A5 _ A3, 0000003C(d)
        mov     eax, dword [task_a.1797]                ; 03AA _ A1, 00000284(d)
        mov     dword [task_main], eax                  ; 03AF _ A3, 00000274(d)
        mov     eax, dword [task_a.1797]                ; 03B4 _ A1, 00000284(d)
        mov     dword [esp+8H], 0                       ; 03B9 _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], 0                       ; 03C1 _ C7. 44 24, 04, 00000000
        mov     dword [esp], eax                        ; 03C9 _ 89. 04 24
        call    task_run                                ; 03CC _ E8, FFFFFFFC(rel)
        call    launch_console                          ; 03D1 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-34H], eax                    ; 03D6 _ 89. 45, CC
        mov     dword [ebp-38H], 0                      ; 03D9 _ C7. 45, C8, 00000000
        mov     dword [ebp-3CH], 0                      ; 03E0 _ C7. 45, C4, 00000000
        mov     dword [ebp-40H], 0                      ; 03E7 _ C7. 45, C0, 00000000
        mov     dword [ebp-44H], 176                    ; 03EE _ C7. 45, BC, 000000B0
        mov     dword [ebp-48H], 0                      ; 03F5 _ C7. 45, B8, 00000000
        mov     dword [ebp-14H], 0                      ; 03FC _ C7. 45, EC, 00000000
        mov     dword [ebp-4CH], 0                      ; 0403 _ C7. 45, B4, 00000000
?_001:  mov     dword [esp], keyinfo                    ; 040A _ C7. 04 24, 00000024(d)
        call    fifo8_status                            ; 0411 _ E8, FFFFFFFC(rel)
        mov     ebx, eax                                ; 0416 _ 89. C3
        mov     dword [esp], mouseinfo                  ; 0418 _ C7. 04 24, 00000040(d)
        call    fifo8_status                            ; 041F _ E8, FFFFFFFC(rel)
        add     ebx, eax                                ; 0424 _ 01. C3
        mov     dword [esp], timerinfo                  ; 0426 _ C7. 04 24, 00000110(d)
        call    fifo8_status                            ; 042D _ E8, FFFFFFFC(rel)
        add     eax, ebx                                ; 0432 _ 01. D8
        test    eax, eax                                ; 0434 _ 85. C0
        jnz     ?_002                                   ; 0436 _ 75, 0A
        call    io_sti                                  ; 0438 _ E8, FFFFFFFC(rel)
        jmp     ?_009                                   ; 043D _ E9, 0000037E

?_002:  mov     dword [esp], keyinfo                    ; 0442 _ C7. 04 24, 00000024(d)
        call    fifo8_status                            ; 0449 _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 044E _ 85. C0
        je      ?_008                                   ; 0450 _ 0F 84, 00000339
        call    io_sti                                  ; 0456 _ E8, FFFFFFFC(rel)
        mov     dword [esp], keyinfo                    ; 045B _ C7. 04 24, 00000024(d)
        call    fifo8_get                               ; 0462 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-38H], eax                    ; 0467 _ 89. 45, C8
        mov     eax, dword [ebp-38H]                    ; 046A _ 8B. 45, C8
        mov     dword [esp], eax                        ; 046D _ 89. 04 24
        call    transferScanCode                        ; 0470 _ E8, FFFFFFFC(rel)
        mov     eax, dword [KEY_CONTROL]                ; 0475 _ A1, 00000000(d)
        cmp     dword [ebp-38H], eax                    ; 047A _ 39. 45, C8
        jnz     ?_003                                   ; 047D _ 75, 43
        mov     eax, dword [key_shift]                  ; 047F _ A1, 00000000(d)
        test    eax, eax                                ; 0484 _ 85. C0
        jz      ?_003                                   ; 0486 _ 74, 3A
        mov     eax, dword [task_cons]                  ; 0488 _ A1, 00000270(d)
        mov     eax, dword [eax+34H]                    ; 048D _ 8B. 40, 34
        test    eax, eax                                ; 0490 _ 85. C0
        jz      ?_003                                   ; 0492 _ 74, 2E
        mov     dword [esp], ?_305                      ; 0494 _ C7. 04 24, 00000008(d)
        call    cons_putstr                             ; 049B _ E8, FFFFFFFC(rel)
        call    io_cli                                  ; 04A0 _ E8, FFFFFFFC(rel)
        call    get_code32_addr                         ; 04A5 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-50H], eax                    ; 04AA _ 89. 45, B0
        mov     eax, dword [task_cons]                  ; 04AD _ A1, 00000270(d)
        mov     edx, kill_process                       ; 04B2 _ BA, 00000000(d)
        sub     edx, dword [ebp-50H]                    ; 04B7 _ 2B. 55, B0
        mov     dword [eax+4CH], edx                    ; 04BA _ 89. 50, 4C
        call    io_sti                                  ; 04BD _ E8, FFFFFFFC(rel)
?_003:  cmp     dword [ebp-38H], 15                     ; 04C2 _ 83. 7D, C8, 0F
        jne     ?_006                                   ; 04C6 _ 0F 85, 0000019A
        mov     dword [ebp-18H], -1                     ; 04CC _ C7. 45, E8, FFFFFFFF
        cmp     dword [ebp-14H], 0                      ; 04D3 _ 83. 7D, EC, 00
        jne     ?_004                                   ; 04D7 _ 0F 85, 00000089
        mov     dword [ebp-14H], 1                      ; 04DD _ C7. 45, EC, 00000001
        mov     edx, dword [shtMsgBox]                  ; 04E4 _ 8B. 15, 00000260(d)
        mov     eax, dword [shtctl]                     ; 04EA _ A1, 00000264(d)
        mov     dword [esp+0CH], 0                      ; 04EF _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], ?_306                   ; 04F7 _ C7. 44 24, 08, 00000015(d)
        mov     dword [esp+4H], edx                     ; 04FF _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0503 _ 89. 04 24
        call    make_wtitle8                            ; 0506 _ E8, FFFFFFFC(rel)
        mov     eax, dword [shtctl]                     ; 050B _ A1, 00000264(d)
        mov     dword [esp+0CH], 1                      ; 0510 _ C7. 44 24, 0C, 00000001
        mov     dword [esp+8H], ?_307                   ; 0518 _ C7. 44 24, 08, 0000001C(d)
        mov     edx, dword [ebp-34H]                    ; 0520 _ 8B. 55, CC
        mov     dword [esp+4H], edx                     ; 0523 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0527 _ 89. 04 24
        call    make_wtitle8                            ; 052A _ E8, FFFFFFFC(rel)
        mov     edx, dword [shtMsgBox]                  ; 052F _ 8B. 15, 00000260(d)
        mov     eax, dword [shtctl]                     ; 0535 _ A1, 00000264(d)
        mov     dword [esp+10H], 7                      ; 053A _ C7. 44 24, 10, 00000007
        mov     dword [esp+0CH], 28                     ; 0542 _ C7. 44 24, 0C, 0000001C
        mov     ecx, dword [ebp-0CH]                    ; 054A _ 8B. 4D, F4
        mov     dword [esp+8H], ecx                     ; 054D _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 0551 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0555 _ 89. 04 24
        call    set_cursor                              ; 0558 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-18H], 87                     ; 055D _ C7. 45, E8, 00000057
        jmp     ?_005                                   ; 0564 _ EB, 71

?_004:  mov     dword [ebp-14H], 0                      ; 0566 _ C7. 45, EC, 00000000
        mov     edx, dword [shtMsgBox]                  ; 056D _ 8B. 15, 00000260(d)
        mov     eax, dword [shtctl]                     ; 0573 _ A1, 00000264(d)
        mov     dword [esp+0CH], 1                      ; 0578 _ C7. 44 24, 0C, 00000001
        mov     dword [esp+8H], ?_306                   ; 0580 _ C7. 44 24, 08, 00000015(d)
        mov     dword [esp+4H], edx                     ; 0588 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 058C _ 89. 04 24
        call    make_wtitle8                            ; 058F _ E8, FFFFFFFC(rel)
        mov     eax, dword [shtctl]                     ; 0594 _ A1, 00000264(d)
        mov     dword [esp+0CH], 0                      ; 0599 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], ?_307                   ; 05A1 _ C7. 44 24, 08, 0000001C(d)
        mov     edx, dword [ebp-34H]                    ; 05A9 _ 8B. 55, CC
        mov     dword [esp+4H], edx                     ; 05AC _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 05B0 _ 89. 04 24
        call    make_wtitle8                            ; 05B3 _ E8, FFFFFFFC(rel)
        mov     eax, dword [task_cons]                  ; 05B8 _ A1, 00000270(d)
        add     eax, 16                                 ; 05BD _ 83. C0, 10
        mov     dword [esp+4H], 88                      ; 05C0 _ C7. 44 24, 04, 00000058
        mov     dword [esp], eax                        ; 05C8 _ 89. 04 24
        call    fifo8_put                               ; 05CB _ E8, FFFFFFFC(rel)
        mov     dword [ebp-18H], 88                     ; 05D0 _ C7. 45, E8, 00000058
?_005:  mov     eax, dword [shtMsgBox]                  ; 05D7 _ A1, 00000260(d)
        mov     ecx, dword [eax+4H]                     ; 05DC _ 8B. 48, 04
        mov     edx, dword [shtMsgBox]                  ; 05DF _ 8B. 15, 00000260(d)
        mov     eax, dword [shtctl]                     ; 05E5 _ A1, 00000264(d)
        mov     dword [esp+14H], 21                     ; 05EA _ C7. 44 24, 14, 00000015
        mov     dword [esp+10H], ecx                    ; 05F2 _ 89. 4C 24, 10
        mov     dword [esp+0CH], 0                      ; 05F6 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 0                       ; 05FE _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], edx                     ; 0606 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 060A _ 89. 04 24
        call    sheet_refresh                           ; 060D _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-34H]                    ; 0612 _ 8B. 45, CC
        mov     edx, dword [eax+4H]                     ; 0615 _ 8B. 50, 04
        mov     eax, dword [shtctl]                     ; 0618 _ A1, 00000264(d)
        mov     dword [esp+14H], 21                     ; 061D _ C7. 44 24, 14, 00000015
        mov     dword [esp+10H], edx                    ; 0625 _ 89. 54 24, 10
        mov     dword [esp+0CH], 0                      ; 0629 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 0                       ; 0631 _ C7. 44 24, 08, 00000000
        mov     edx, dword [ebp-34H]                    ; 0639 _ 8B. 55, CC
        mov     dword [esp+4H], edx                     ; 063C _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0640 _ 89. 04 24
        call    sheet_refresh                           ; 0643 _ E8, FFFFFFFC(rel)
        mov     edx, dword [task_cons]                  ; 0648 _ 8B. 15, 00000270(d)
        mov     eax, dword [task_a.1797]                ; 064E _ A1, 00000284(d)
        mov     ecx, dword [ebp-18H]                    ; 0653 _ 8B. 4D, E8
        mov     dword [esp+8H], ecx                     ; 0656 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 065A _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 065E _ 89. 04 24
        call    send_message                            ; 0661 _ E8, FFFFFFFC(rel)
?_006:  cmp     dword [ebp-14H], 0                      ; 0666 _ 83. 7D, EC, 00
        jne     ?_007                                   ; 066A _ 0F 85, 000000D6
        mov     eax, dword [ebp-38H]                    ; 0670 _ 8B. 45, C8
        mov     dword [esp], eax                        ; 0673 _ 89. 04 24
        call    transferScanCode                        ; 0676 _ E8, FFFFFFFC(rel)
        test    al, al                                  ; 067B _ 84. C0
        je      ?_009                                   ; 067D _ 0F 84, 0000013D
        cmp     dword [ebp-0CH], 143                    ; 0683 _ 81. 7D, F4, 0000008F
        jg      ?_009                                   ; 068A _ 0F 8F, 00000130
        mov     edx, dword [shtMsgBox]                  ; 0690 _ 8B. 15, 00000260(d)
        mov     eax, dword [shtctl]                     ; 0696 _ A1, 00000264(d)
        mov     dword [esp+10H], 7                      ; 069B _ C7. 44 24, 10, 00000007
        mov     dword [esp+0CH], 28                     ; 06A3 _ C7. 44 24, 0C, 0000001C
        mov     ecx, dword [ebp-0CH]                    ; 06AB _ 8B. 4D, F4
        mov     dword [esp+8H], ecx                     ; 06AE _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 06B2 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 06B6 _ 89. 04 24
        call    set_cursor                              ; 06B9 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-38H]                    ; 06BE _ 8B. 45, C8
        mov     dword [esp], eax                        ; 06C1 _ 89. 04 24
        call    transferScanCode                        ; 06C4 _ E8, FFFFFFFC(rel)
        mov     byte [ebp-51H], al                      ; 06C9 _ 88. 45, AF
        movzx   eax, byte [ebp-51H]                     ; 06CC _ 0F B6. 45, AF
        mov     byte [ebp-66H], al                      ; 06D0 _ 88. 45, 9A
        mov     byte [ebp-65H], 0                       ; 06D3 _ C6. 45, 9B, 00
        mov     edx, dword [shtMsgBox]                  ; 06D7 _ 8B. 15, 00000260(d)
        mov     eax, dword [shtctl]                     ; 06DD _ A1, 00000264(d)
        lea     ecx, [ebp-66H]                          ; 06E2 _ 8D. 4D, 9A
        mov     dword [esp+14H], ecx                    ; 06E5 _ 89. 4C 24, 14
        mov     dword [esp+10H], 0                      ; 06E9 _ C7. 44 24, 10, 00000000
        mov     dword [esp+0CH], 28                     ; 06F1 _ C7. 44 24, 0C, 0000001C
        mov     ecx, dword [ebp-0CH]                    ; 06F9 _ 8B. 4D, F4
        mov     dword [esp+8H], ecx                     ; 06FC _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 0700 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0704 _ 89. 04 24
        call    showString                              ; 0707 _ E8, FFFFFFFC(rel)
        add     dword [ebp-0CH], 8                      ; 070C _ 83. 45, F4, 08
        mov     dword [ebp-48H], 1                      ; 0710 _ C7. 45, B8, 00000001
        mov     edx, dword [shtMsgBox]                  ; 0717 _ 8B. 15, 00000260(d)
        mov     eax, dword [shtctl]                     ; 071D _ A1, 00000264(d)
        mov     ecx, dword [ebp-10H]                    ; 0722 _ 8B. 4D, F0
        mov     dword [esp+10H], ecx                    ; 0725 _ 89. 4C 24, 10
        mov     dword [esp+0CH], 28                     ; 0729 _ C7. 44 24, 0C, 0000001C
        mov     ecx, dword [ebp-0CH]                    ; 0731 _ 8B. 4D, F4
        mov     dword [esp+8H], ecx                     ; 0734 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 0738 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 073C _ 89. 04 24
        call    set_cursor                              ; 073F _ E8, FFFFFFFC(rel)
        jmp     ?_009                                   ; 0744 _ EB, 7A

?_007:  mov     eax, dword [ebp-38H]                    ; 0746 _ 8B. 45, C8
        mov     dword [esp], eax                        ; 0749 _ 89. 04 24
        call    isSpecialKey                            ; 074C _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 0751 _ 85. C0
        jnz     ?_009                                   ; 0753 _ 75, 6B
        mov     eax, dword [ebp-38H]                    ; 0755 _ 8B. 45, C8
        movzx   eax, al                                 ; 0758 _ 0F B6. C0
        mov     edx, dword [task_cons]                  ; 075B _ 8B. 15, 00000270(d)
        add     edx, 16                                 ; 0761 _ 83. C2, 10
        mov     dword [esp+4H], eax                     ; 0764 _ 89. 44 24, 04
        mov     dword [esp], edx                        ; 0768 _ 89. 14 24
        call    fifo8_put                               ; 076B _ E8, FFFFFFFC(rel)
        mov     dword [esp], keyinfo                    ; 0770 _ C7. 04 24, 00000024(d)
        call    fifo8_status                            ; 0777 _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 077C _ 85. C0
        jnz     ?_009                                   ; 077E _ 75, 40
        mov     eax, dword [task_a.1797]                ; 0780 _ A1, 00000284(d)
        mov     dword [esp], eax                        ; 0785 _ 89. 04 24
        call    task_sleep                              ; 0788 _ E8, FFFFFFFC(rel)
        jmp     ?_009                                   ; 078D _ EB, 31

?_008:  mov     dword [esp], mouseinfo                  ; 078F _ C7. 04 24, 00000040(d)
        call    fifo8_status                            ; 0796 _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 079B _ 85. C0
        jz      ?_009                                   ; 079D _ 74, 21
        mov     ecx, dword [sht_mouse]                  ; 079F _ 8B. 0D, 0000026C(d)
        mov     edx, dword [sht_back]                   ; 07A5 _ 8B. 15, 00000268(d)
        mov     eax, dword [shtctl]                     ; 07AB _ A1, 00000264(d)
        mov     dword [esp+8H], ecx                     ; 07B0 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 07B4 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 07B8 _ 89. 04 24
        call    show_mouse_info                         ; 07BB _ E8, FFFFFFFC(rel)
?_009:  mov     dword [esp], timerinfo                  ; 07C0 _ C7. 04 24, 00000110(d)
        call    fifo8_status                            ; 07C7 _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 07CC _ 85. C0
        je      ?_013                                   ; 07CE _ 0F 84, 000000DB
        call    io_sti                                  ; 07D4 _ E8, FFFFFFFC(rel)
        mov     dword [esp], timerinfo                  ; 07D9 _ C7. 04 24, 00000110(d)
        call    fifo8_get                               ; 07E0 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-58H], eax                    ; 07E5 _ 89. 45, A8
        cmp     dword [ebp-58H], 0                      ; 07E8 _ 83. 7D, A8, 00
        jz      ?_010                                   ; 07EC _ 74, 24
        mov     dword [esp+8H], 0                       ; 07EE _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], timerinfo               ; 07F6 _ C7. 44 24, 04, 00000110(d)
        mov     eax, dword [ebp-28H]                    ; 07FE _ 8B. 45, D8
        mov     dword [esp], eax                        ; 0801 _ 89. 04 24
        call    timer_init                              ; 0804 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], 0                      ; 0809 _ C7. 45, F0, 00000000
        jmp     ?_011                                   ; 0810 _ EB, 22

?_010:  mov     dword [esp+8H], 1                       ; 0812 _ C7. 44 24, 08, 00000001
        mov     dword [esp+4H], timerinfo               ; 081A _ C7. 44 24, 04, 00000110(d)
        mov     eax, dword [ebp-28H]                    ; 0822 _ 8B. 45, D8
        mov     dword [esp], eax                        ; 0825 _ 89. 04 24
        call    timer_init                              ; 0828 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], 7                      ; 082D _ C7. 45, F0, 00000007
?_011:  mov     dword [esp+4H], 50                      ; 0834 _ C7. 44 24, 04, 00000032
        mov     eax, dword [ebp-28H]                    ; 083C _ 8B. 45, D8
        mov     dword [esp], eax                        ; 083F _ 89. 04 24
        call    timer_settime                           ; 0842 _ E8, FFFFFFFC(rel)
        cmp     dword [ebp-14H], 0                      ; 0847 _ 83. 7D, EC, 00
        jnz     ?_012                                   ; 084B _ 75, 2F
        mov     edx, dword [shtMsgBox]                  ; 084D _ 8B. 15, 00000260(d)
        mov     eax, dword [shtctl]                     ; 0853 _ A1, 00000264(d)
        mov     ecx, dword [ebp-10H]                    ; 0858 _ 8B. 4D, F0
        mov     dword [esp+10H], ecx                    ; 085B _ 89. 4C 24, 10
        mov     dword [esp+0CH], 28                     ; 085F _ C7. 44 24, 0C, 0000001C
        mov     ecx, dword [ebp-0CH]                    ; 0867 _ 8B. 4D, F4
        mov     dword [esp+8H], ecx                     ; 086A _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 086E _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0872 _ 89. 04 24
        call    set_cursor                              ; 0875 _ E8, FFFFFFFC(rel)
        jmp     ?_013                                   ; 087A _ EB, 33

?_012:  mov     edx, dword [shtMsgBox]                  ; 087C _ 8B. 15, 00000260(d)
        mov     eax, dword [shtctl]                     ; 0882 _ A1, 00000264(d)
        mov     dword [esp+10H], 7                      ; 0887 _ C7. 44 24, 10, 00000007
        mov     dword [esp+0CH], 28                     ; 088F _ C7. 44 24, 0C, 0000001C
        mov     ecx, dword [ebp-0CH]                    ; 0897 _ 8B. 4D, F4
        mov     dword [esp+8H], ecx                     ; 089A _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 089E _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 08A2 _ 89. 04 24
        call    set_cursor                              ; 08A5 _ E8, FFFFFFFC(rel)
        jmp     ?_001                                   ; 08AA _ E9, FFFFFB5B

?_013:  jmp     ?_001                                   ; 08AF _ E9, FFFFFB56
; CMain End of function

set_cursor:; Function begin
        push    ebp                                     ; 08B4 _ 55
        mov     ebp, esp                                ; 08B5 _ 89. E5
        push    esi                                     ; 08B7 _ 56
        push    ebx                                     ; 08B8 _ 53
        sub     esp, 32                                 ; 08B9 _ 83. EC, 20
        mov     eax, dword [ebp+14H]                    ; 08BC _ 8B. 45, 14
        lea     esi, [eax+0FH]                          ; 08BF _ 8D. 70, 0F
        mov     eax, dword [ebp+10H]                    ; 08C2 _ 8B. 45, 10
        lea     ebx, [eax+7H]                           ; 08C5 _ 8D. 58, 07
        mov     eax, dword [ebp+18H]                    ; 08C8 _ 8B. 45, 18
        movzx   ecx, al                                 ; 08CB _ 0F B6. C8
        mov     eax, dword [ebp+0CH]                    ; 08CE _ 8B. 45, 0C
        mov     edx, dword [eax+4H]                     ; 08D1 _ 8B. 50, 04
        mov     eax, dword [ebp+0CH]                    ; 08D4 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 08D7 _ 8B. 00
        mov     dword [esp+18H], esi                    ; 08D9 _ 89. 74 24, 18
        mov     dword [esp+14H], ebx                    ; 08DD _ 89. 5C 24, 14
        mov     ebx, dword [ebp+14H]                    ; 08E1 _ 8B. 5D, 14
        mov     dword [esp+10H], ebx                    ; 08E4 _ 89. 5C 24, 10
        mov     ebx, dword [ebp+10H]                    ; 08E8 _ 8B. 5D, 10
        mov     dword [esp+0CH], ebx                    ; 08EB _ 89. 5C 24, 0C
        mov     dword [esp+8H], ecx                     ; 08EF _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 08F3 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 08F7 _ 89. 04 24
        call    boxfill8                                ; 08FA _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+14H]                    ; 08FF _ 8B. 45, 14
        lea     edx, [eax+10H]                          ; 0902 _ 8D. 50, 10
        mov     eax, dword [ebp+10H]                    ; 0905 _ 8B. 45, 10
        add     eax, 8                                  ; 0908 _ 83. C0, 08
        mov     dword [esp+14H], edx                    ; 090B _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 090F _ 89. 44 24, 10
        mov     eax, dword [ebp+14H]                    ; 0913 _ 8B. 45, 14
        mov     dword [esp+0CH], eax                    ; 0916 _ 89. 44 24, 0C
        mov     eax, dword [ebp+10H]                    ; 091A _ 8B. 45, 10
        mov     dword [esp+8H], eax                     ; 091D _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 0921 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0924 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0928 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 092B _ 89. 04 24
        call    sheet_refresh                           ; 092E _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0933 _ 83. C4, 20
        pop     ebx                                     ; 0936 _ 5B
        pop     esi                                     ; 0937 _ 5E
        pop     ebp                                     ; 0938 _ 5D
        ret                                             ; 0939 _ C3
; set_cursor End of function

isSpecialKey:; Function begin
        push    ebp                                     ; 093A _ 55
        mov     ebp, esp                                ; 093B _ 89. E5
        sub     esp, 24                                 ; 093D _ 83. EC, 18
        mov     eax, dword [ebp+8H]                     ; 0940 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0943 _ 89. 04 24
        call    transferScanCode                        ; 0946 _ E8, FFFFFFFC(rel)
        cmp     dword [ebp+8H], 58                      ; 094B _ 83. 7D, 08, 3A
        jz      ?_014                                   ; 094F _ 74, 2D
        cmp     dword [ebp+8H], 29                      ; 0951 _ 83. 7D, 08, 1D
        jz      ?_014                                   ; 0955 _ 74, 27
        cmp     dword [ebp+8H], 186                     ; 0957 _ 81. 7D, 08, 000000BA
        jz      ?_014                                   ; 095E _ 74, 1E
        cmp     dword [ebp+8H], 42                      ; 0960 _ 83. 7D, 08, 2A
        jz      ?_014                                   ; 0964 _ 74, 18
        cmp     dword [ebp+8H], 54                      ; 0966 _ 83. 7D, 08, 36
        jz      ?_014                                   ; 096A _ 74, 12
        cmp     dword [ebp+8H], 170                     ; 096C _ 81. 7D, 08, 000000AA
        jz      ?_014                                   ; 0973 _ 74, 09
        cmp     dword [ebp+8H], 182                     ; 0975 _ 81. 7D, 08, 000000B6
        jnz     ?_015                                   ; 097C _ 75, 07
?_014:  mov     eax, 1                                  ; 097E _ B8, 00000001
        jmp     ?_016                                   ; 0983 _ EB, 05

?_015:  mov     eax, 0                                  ; 0985 _ B8, 00000000
?_016:  leave                                           ; 098A _ C9
        ret                                             ; 098B _ C3
; isSpecialKey End of function

transferScanCode:; Function begin
        push    ebp                                     ; 098C _ 55
        mov     ebp, esp                                ; 098D _ 89. E5
        sub     esp, 16                                 ; 098F _ 83. EC, 10
        cmp     dword [ebp+8H], 42                      ; 0992 _ 83. 7D, 08, 2A
        jnz     ?_017                                   ; 0996 _ 75, 0D
        mov     eax, dword [key_shift]                  ; 0998 _ A1, 00000000(d)
        or      eax, 01H                                ; 099D _ 83. C8, 01
        mov     dword [key_shift], eax                  ; 09A0 _ A3, 00000000(d)
?_017:  cmp     dword [ebp+8H], 54                      ; 09A5 _ 83. 7D, 08, 36
        jnz     ?_018                                   ; 09A9 _ 75, 0D
        mov     eax, dword [key_shift]                  ; 09AB _ A1, 00000000(d)
        or      eax, 02H                                ; 09B0 _ 83. C8, 02
        mov     dword [key_shift], eax                  ; 09B3 _ A3, 00000000(d)
?_018:  cmp     dword [ebp+8H], 170                     ; 09B8 _ 81. 7D, 08, 000000AA
        jnz     ?_019                                   ; 09BF _ 75, 0D
        mov     eax, dword [key_shift]                  ; 09C1 _ A1, 00000000(d)
        and     eax, 0FFFFFFFEH                         ; 09C6 _ 83. E0, FE
        mov     dword [key_shift], eax                  ; 09C9 _ A3, 00000000(d)
?_019:  cmp     dword [ebp+8H], 182                     ; 09CE _ 81. 7D, 08, 000000B6
        jnz     ?_020                                   ; 09D5 _ 75, 0D
        mov     eax, dword [key_shift]                  ; 09D7 _ A1, 00000000(d)
        and     eax, 0FFFFFFFDH                         ; 09DC _ 83. E0, FD
        mov     dword [key_shift], eax                  ; 09DF _ A3, 00000000(d)
?_020:  cmp     dword [ebp+8H], 58                      ; 09E4 _ 83. 7D, 08, 3A
        jnz     ?_022                                   ; 09E8 _ 75, 1F
        mov     eax, dword [caps_lock]                  ; 09EA _ A1, 00000000(d)
        test    eax, eax                                ; 09EF _ 85. C0
        jnz     ?_021                                   ; 09F1 _ 75, 0C
        mov     dword [caps_lock], 1                    ; 09F3 _ C7. 05, 00000000(d), 00000001
        jmp     ?_022                                   ; 09FD _ EB, 0A

?_021:  mov     dword [caps_lock], 0                    ; 09FF _ C7. 05, 00000000(d), 00000000
?_022:  cmp     dword [ebp+8H], 42                      ; 0A09 _ 83. 7D, 08, 2A
        jz      ?_023                                   ; 0A0D _ 74, 24
        cmp     dword [ebp+8H], 54                      ; 0A0F _ 83. 7D, 08, 36
        jz      ?_023                                   ; 0A13 _ 74, 1E
        cmp     dword [ebp+8H], 170                     ; 0A15 _ 81. 7D, 08, 000000AA
        jz      ?_023                                   ; 0A1C _ 74, 15
        cmp     dword [ebp+8H], 182                     ; 0A1E _ 81. 7D, 08, 000000B6
        jz      ?_023                                   ; 0A25 _ 74, 0C
        cmp     dword [ebp+8H], 83                      ; 0A27 _ 83. 7D, 08, 53
        jg      ?_023                                   ; 0A2B _ 7F, 06
        cmp     dword [ebp+8H], 58                      ; 0A2D _ 83. 7D, 08, 3A
        jnz     ?_024                                   ; 0A31 _ 75, 0A
?_023:  mov     eax, 0                                  ; 0A33 _ B8, 00000000
        jmp     ?_029                                   ; 0A38 _ E9, 00000089

?_024:  mov     byte [ebp-1H], 0                        ; 0A3D _ C6. 45, FF, 00
        mov     eax, dword [key_shift]                  ; 0A41 _ A1, 00000000(d)
        test    eax, eax                                ; 0A46 _ 85. C0
        jnz     ?_026                                   ; 0A48 _ 75, 46
        cmp     dword [ebp+8H], 83                      ; 0A4A _ 83. 7D, 08, 53
        jg      ?_026                                   ; 0A4E _ 7F, 40
        mov     eax, dword [ebp+8H]                     ; 0A50 _ 8B. 45, 08
        add     eax, keytable                           ; 0A53 _ 05, 00000020(d)
        movzx   eax, byte [eax]                         ; 0A58 _ 0F B6. 00
        test    al, al                                  ; 0A5B _ 84. C0
        jz      ?_026                                   ; 0A5D _ 74, 31
        mov     eax, dword [ebp+8H]                     ; 0A5F _ 8B. 45, 08
        add     eax, keytable                           ; 0A62 _ 05, 00000020(d)
        movzx   eax, byte [eax]                         ; 0A67 _ 0F B6. 00
        mov     byte [ebp-1H], al                       ; 0A6A _ 88. 45, FF
        cmp     byte [ebp-1H], 64                       ; 0A6D _ 80. 7D, FF, 40
        jle     ?_025                                   ; 0A71 _ 7E, 1B
        cmp     byte [ebp-1H], 90                       ; 0A73 _ 80. 7D, FF, 5A
        jg      ?_025                                   ; 0A77 _ 7F, 15
        mov     eax, dword [caps_lock]                  ; 0A79 _ A1, 00000000(d)
        test    eax, eax                                ; 0A7E _ 85. C0
        jnz     ?_025                                   ; 0A80 _ 75, 0C
        movzx   eax, byte [ebp-1H]                      ; 0A82 _ 0F B6. 45, FF
        add     eax, 32                                 ; 0A86 _ 83. C0, 20
        mov     byte [ebp-1H], al                       ; 0A89 _ 88. 45, FF
        jmp     ?_028                                   ; 0A8C _ EB, 34

?_025:  jmp     ?_028                                   ; 0A8E _ EB, 32

?_026:  mov     eax, dword [key_shift]                  ; 0A90 _ A1, 00000000(d)
        test    eax, eax                                ; 0A95 _ 85. C0
        jz      ?_027                                   ; 0A97 _ 74, 25
        cmp     dword [ebp+8H], 127                     ; 0A99 _ 83. 7D, 08, 7F
        jg      ?_027                                   ; 0A9D _ 7F, 1F
        mov     eax, dword [ebp+8H]                     ; 0A9F _ 8B. 45, 08
        add     eax, keytable1                          ; 0AA2 _ 05, 00000080(d)
        movzx   eax, byte [eax]                         ; 0AA7 _ 0F B6. 00
        test    al, al                                  ; 0AAA _ 84. C0
        jz      ?_027                                   ; 0AAC _ 74, 10
        mov     eax, dword [ebp+8H]                     ; 0AAE _ 8B. 45, 08
        add     eax, keytable1                          ; 0AB1 _ 05, 00000080(d)
        movzx   eax, byte [eax]                         ; 0AB6 _ 0F B6. 00
        mov     byte [ebp-1H], al                       ; 0AB9 _ 88. 45, FF
        jmp     ?_028                                   ; 0ABC _ EB, 04

?_027:  mov     byte [ebp-1H], 0                        ; 0ABE _ C6. 45, FF, 00
?_028:  movzx   eax, byte [ebp-1H]                      ; 0AC2 _ 0F B6. 45, FF
?_029:  leave                                           ; 0AC6 _ C9
        ret                                             ; 0AC7 _ C3
; transferScanCode End of function

launch_console:; Function begin
        push    ebp                                     ; 0AC8 _ 55
        mov     ebp, esp                                ; 0AC9 _ 89. E5
        push    ebx                                     ; 0ACB _ 53
        sub     esp, 52                                 ; 0ACC _ 83. EC, 34
        mov     eax, dword [shtctl]                     ; 0ACF _ A1, 00000264(d)
        mov     dword [esp], eax                        ; 0AD4 _ 89. 04 24
        call    sheet_alloc                             ; 0AD7 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 0ADC _ 89. 45, F4
        mov     eax, dword [memman]                     ; 0ADF _ A1, 00000000(d)
        mov     dword [esp+4H], 42240                   ; 0AE4 _ C7. 44 24, 04, 0000A500
        mov     dword [esp], eax                        ; 0AEC _ 89. 04 24
        call    memman_alloc_4k                         ; 0AEF _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 0AF4 _ 89. 45, F0
        mov     dword [esp+10H], 99                     ; 0AF7 _ C7. 44 24, 10, 00000063
        mov     dword [esp+0CH], 165                    ; 0AFF _ C7. 44 24, 0C, 000000A5
        mov     dword [esp+8H], 256                     ; 0B07 _ C7. 44 24, 08, 00000100
        mov     eax, dword [ebp-10H]                    ; 0B0F _ 8B. 45, F0
        mov     dword [esp+4H], eax                     ; 0B12 _ 89. 44 24, 04
        mov     eax, dword [ebp-0CH]                    ; 0B16 _ 8B. 45, F4
        mov     dword [esp], eax                        ; 0B19 _ 89. 04 24
        call    sheet_setbuf                            ; 0B1C _ E8, FFFFFFFC(rel)
        mov     eax, dword [shtctl]                     ; 0B21 _ A1, 00000264(d)
        mov     dword [esp+0CH], 0                      ; 0B26 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], ?_307                   ; 0B2E _ C7. 44 24, 08, 0000001C(d)
        mov     edx, dword [ebp-0CH]                    ; 0B36 _ 8B. 55, F4
        mov     dword [esp+4H], edx                     ; 0B39 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0B3D _ 89. 04 24
        call    make_window8                            ; 0B40 _ E8, FFFFFFFC(rel)
        mov     dword [esp+14H], 0                      ; 0B45 _ C7. 44 24, 14, 00000000
        mov     dword [esp+10H], 128                    ; 0B4D _ C7. 44 24, 10, 00000080
        mov     dword [esp+0CH], 240                    ; 0B55 _ C7. 44 24, 0C, 000000F0
        mov     dword [esp+8H], 28                      ; 0B5D _ C7. 44 24, 08, 0000001C
        mov     dword [esp+4H], 8                       ; 0B65 _ C7. 44 24, 04, 00000008
        mov     eax, dword [ebp-0CH]                    ; 0B6D _ 8B. 45, F4
        mov     dword [esp], eax                        ; 0B70 _ 89. 04 24
        call    make_textbox8                           ; 0B73 _ E8, FFFFFFFC(rel)
        call    task_alloc                              ; 0B78 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-14H], eax                    ; 0B7D _ 89. 45, EC
        call    get_code32_addr                         ; 0B80 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-18H], eax                    ; 0B85 _ 89. 45, E8
        mov     eax, dword [ebp-14H]                    ; 0B88 _ 8B. 45, EC
        mov     dword [eax+8CH], 0                      ; 0B8B _ C7. 80, 0000008C, 00000000
        mov     eax, dword [ebp-14H]                    ; 0B95 _ 8B. 45, EC
        mov     dword [eax+90H], 1073741824             ; 0B98 _ C7. 80, 00000090, 40000000
        mov     eax, console_task                       ; 0BA2 _ B8, 00000000(d)
        sub     eax, dword [ebp-18H]                    ; 0BA7 _ 2B. 45, E8
        mov     edx, eax                                ; 0BAA _ 89. C2
        mov     eax, dword [ebp-14H]                    ; 0BAC _ 8B. 45, EC
        mov     dword [eax+4CH], edx                    ; 0BAF _ 89. 50, 4C
        mov     eax, dword [ebp-14H]                    ; 0BB2 _ 8B. 45, EC
        mov     dword [eax+74H], 0                      ; 0BB5 _ C7. 40, 74, 00000000
        mov     eax, dword [ebp-14H]                    ; 0BBC _ 8B. 45, EC
        mov     dword [eax+78H], 8                      ; 0BBF _ C7. 40, 78, 00000008
        mov     eax, dword [ebp-14H]                    ; 0BC6 _ 8B. 45, EC
        mov     dword [eax+7CH], 32                     ; 0BC9 _ C7. 40, 7C, 00000020
        mov     eax, dword [ebp-14H]                    ; 0BD0 _ 8B. 45, EC
        mov     dword [eax+80H], 24                     ; 0BD3 _ C7. 80, 00000080, 00000018
        mov     eax, dword [ebp-14H]                    ; 0BDD _ 8B. 45, EC
        mov     dword [eax+84H], 0                      ; 0BE0 _ C7. 80, 00000084, 00000000
        mov     eax, dword [ebp-14H]                    ; 0BEA _ 8B. 45, EC
        mov     dword [eax+88H], 16                     ; 0BED _ C7. 80, 00000088, 00000010
        mov     eax, dword [ebp-14H]                    ; 0BF7 _ 8B. 45, EC
        mov     eax, dword [eax+64H]                    ; 0BFA _ 8B. 40, 64
        lea     edx, [eax-8H]                           ; 0BFD _ 8D. 50, F8
        mov     eax, dword [ebp-14H]                    ; 0C00 _ 8B. 45, EC
        mov     dword [eax+64H], edx                    ; 0C03 _ 89. 50, 64
        mov     eax, dword [ebp-14H]                    ; 0C06 _ 8B. 45, EC
        mov     eax, dword [eax+64H]                    ; 0C09 _ 8B. 40, 64
        add     eax, 4                                  ; 0C0C _ 83. C0, 04
        mov     edx, dword [ebp-0CH]                    ; 0C0F _ 8B. 55, F4
        mov     dword [eax], edx                        ; 0C12 _ 89. 10
        mov     eax, dword [ebp-14H]                    ; 0C14 _ 8B. 45, EC
        mov     eax, dword [eax+64H]                    ; 0C17 _ 8B. 40, 64
        add     eax, 8                                  ; 0C1A _ 83. C0, 08
        mov     ebx, eax                                ; 0C1D _ 89. C3
        mov     eax, dword [memman]                     ; 0C1F _ A1, 00000000(d)
        mov     dword [esp], eax                        ; 0C24 _ 89. 04 24
        call    memman_total                            ; 0C27 _ E8, FFFFFFFC(rel)
        mov     dword [ebx], eax                        ; 0C2C _ 89. 03
        mov     dword [esp+8H], 5                       ; 0C2E _ C7. 44 24, 08, 00000005
        mov     dword [esp+4H], 1                       ; 0C36 _ C7. 44 24, 04, 00000001
        mov     eax, dword [ebp-14H]                    ; 0C3E _ 8B. 45, EC
        mov     dword [esp], eax                        ; 0C41 _ 89. 04 24
        call    task_run                                ; 0C44 _ E8, FFFFFFFC(rel)
        mov     eax, dword [shtctl]                     ; 0C49 _ A1, 00000264(d)
        mov     dword [esp+0CH], 4                      ; 0C4E _ C7. 44 24, 0C, 00000004
        mov     dword [esp+8H], 32                      ; 0C56 _ C7. 44 24, 08, 00000020
        mov     edx, dword [ebp-0CH]                    ; 0C5E _ 8B. 55, F4
        mov     dword [esp+4H], edx                     ; 0C61 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0C65 _ 89. 04 24
        call    sheet_slide                             ; 0C68 _ E8, FFFFFFFC(rel)
        mov     eax, dword [shtctl]                     ; 0C6D _ A1, 00000264(d)
        mov     dword [esp+8H], 1                       ; 0C72 _ C7. 44 24, 08, 00000001
        mov     edx, dword [ebp-0CH]                    ; 0C7A _ 8B. 55, F4
        mov     dword [esp+4H], edx                     ; 0C7D _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0C81 _ 89. 04 24
        call    sheet_updown                            ; 0C84 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-14H]                    ; 0C89 _ 8B. 45, EC
        mov     dword [task_cons], eax                  ; 0C8C _ A3, 00000270(d)
        mov     eax, dword [ebp-0CH]                    ; 0C91 _ 8B. 45, F4
        add     esp, 52                                 ; 0C94 _ 83. C4, 34
        pop     ebx                                     ; 0C97 _ 5B
        pop     ebp                                     ; 0C98 _ 5D
        ret                                             ; 0C99 _ C3
; launch_console End of function

kill_process:; Function begin
        push    ebp                                     ; 0C9A _ 55
        mov     ebp, esp                                ; 0C9B _ 89. E5
        sub     esp, 24                                 ; 0C9D _ 83. EC, 18
        mov     edx, dword [g_Console]                  ; 0CA0 _ 8B. 15, 00000008(d)
        mov     eax, dword [?_329]                      ; 0CA6 _ A1, 00000010(d)
        mov     dword [esp+4H], edx                     ; 0CAB _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0CAF _ 89. 04 24
        call    cons_newline                            ; 0CB2 _ E8, FFFFFFFC(rel)
        mov     eax, dword [?_329]                      ; 0CB7 _ A1, 00000010(d)
        add     eax, 16                                 ; 0CBC _ 83. C0, 10
        mov     dword [?_329], eax                      ; 0CBF _ A3, 00000010(d)
        mov     eax, dword [task_cons]                  ; 0CC4 _ A1, 00000270(d)
        add     eax, 48                                 ; 0CC9 _ 83. C0, 30
        mov     dword [esp], eax                        ; 0CCC _ 89. 04 24
        call    asm_end_app                             ; 0CCF _ E8, FFFFFFFC(rel)
        leave                                           ; 0CD4 _ C9
        ret                                             ; 0CD5 _ C3
; kill_process End of function

cmd_dir:; Function begin
        push    ebp                                     ; 0CD6 _ 55
        mov     ebp, esp                                ; 0CD7 _ 89. E5
        push    ebx                                     ; 0CD9 _ 53
        sub     esp, 68                                 ; 0CDA _ 83. EC, 44
        mov     dword [ebp-0CH], 78848                  ; 0CDD _ C7. 45, F4, 00013400
        mov     eax, dword [memman]                     ; 0CE4 _ A1, 00000000(d)
        mov     dword [esp+4H], 13                      ; 0CE9 _ C7. 44 24, 04, 0000000D
        mov     dword [esp], eax                        ; 0CF1 _ 89. 04 24
        call    memman_alloc                            ; 0CF4 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-18H], eax                    ; 0CF9 _ 89. 45, E8
        mov     eax, dword [ebp-18H]                    ; 0CFC _ 8B. 45, E8
        add     eax, 12                                 ; 0CFF _ 83. C0, 0C
        mov     byte [eax], 0                           ; 0D02 _ C6. 00, 00
        jmp     ?_037                                   ; 0D05 _ E9, 00000125

?_030:  mov     dword [ebp-10H], 0                      ; 0D0A _ C7. 45, F0, 00000000
        jmp     ?_033                                   ; 0D11 _ EB, 2C

?_031:  mov     edx, dword [ebp-0CH]                    ; 0D13 _ 8B. 55, F4
        mov     eax, dword [ebp-10H]                    ; 0D16 _ 8B. 45, F0
        add     eax, edx                                ; 0D19 _ 01. D0
        movzx   eax, byte [eax]                         ; 0D1B _ 0F B6. 00
        test    al, al                                  ; 0D1E _ 84. C0
        jz      ?_032                                   ; 0D20 _ 74, 1B
        mov     edx, dword [ebp-10H]                    ; 0D22 _ 8B. 55, F0
        mov     eax, dword [ebp-18H]                    ; 0D25 _ 8B. 45, E8
        add     edx, eax                                ; 0D28 _ 01. C2
        mov     ecx, dword [ebp-0CH]                    ; 0D2A _ 8B. 4D, F4
        mov     eax, dword [ebp-10H]                    ; 0D2D _ 8B. 45, F0
        add     eax, ecx                                ; 0D30 _ 01. C8
        movzx   eax, byte [eax]                         ; 0D32 _ 0F B6. 00
        mov     byte [edx], al                          ; 0D35 _ 88. 02
        add     dword [ebp-10H], 1                      ; 0D37 _ 83. 45, F0, 01
        jmp     ?_033                                   ; 0D3B _ EB, 02

?_032:  jmp     ?_034                                   ; 0D3D _ EB, 06

?_033:  cmp     dword [ebp-10H], 7                      ; 0D3F _ 83. 7D, F0, 07
        jle     ?_031                                   ; 0D43 _ 7E, CE
?_034:  mov     dword [ebp-14H], 0                      ; 0D45 _ C7. 45, EC, 00000000
        mov     edx, dword [ebp-10H]                    ; 0D4C _ 8B. 55, F0
        mov     eax, dword [ebp-18H]                    ; 0D4F _ 8B. 45, E8
        add     eax, edx                                ; 0D52 _ 01. D0
        mov     byte [eax], 46                          ; 0D54 _ C6. 00, 2E
        add     dword [ebp-10H], 1                      ; 0D57 _ 83. 45, F0, 01
        mov     dword [ebp-14H], 0                      ; 0D5B _ C7. 45, EC, 00000000
        jmp     ?_036                                   ; 0D62 _ EB, 1E

?_035:  mov     edx, dword [ebp-10H]                    ; 0D64 _ 8B. 55, F0
        mov     eax, dword [ebp-18H]                    ; 0D67 _ 8B. 45, E8
        add     edx, eax                                ; 0D6A _ 01. C2
        mov     ecx, dword [ebp-0CH]                    ; 0D6C _ 8B. 4D, F4
        mov     eax, dword [ebp-14H]                    ; 0D6F _ 8B. 45, EC
        add     eax, ecx                                ; 0D72 _ 01. C8
        movzx   eax, byte [eax+8H]                      ; 0D74 _ 0F B6. 40, 08
        mov     byte [edx], al                          ; 0D78 _ 88. 02
        add     dword [ebp-10H], 1                      ; 0D7A _ 83. 45, F0, 01
        add     dword [ebp-14H], 1                      ; 0D7E _ 83. 45, EC, 01
?_036:  cmp     dword [ebp-14H], 2                      ; 0D82 _ 83. 7D, EC, 02
        jle     ?_035                                   ; 0D86 _ 7E, DC
        mov     ecx, dword [?_329]                      ; 0D88 _ 8B. 0D, 00000010(d)
        mov     edx, dword [g_Console]                  ; 0D8E _ 8B. 15, 00000008(d)
        mov     eax, dword [shtctl]                     ; 0D94 _ A1, 00000264(d)
        mov     ebx, dword [ebp-18H]                    ; 0D99 _ 8B. 5D, E8
        mov     dword [esp+14H], ebx                    ; 0D9C _ 89. 5C 24, 14
        mov     dword [esp+10H], 7                      ; 0DA0 _ C7. 44 24, 10, 00000007
        mov     dword [esp+0CH], ecx                    ; 0DA8 _ 89. 4C 24, 0C
        mov     dword [esp+8H], 16                      ; 0DAC _ C7. 44 24, 08, 00000010
        mov     dword [esp+4H], edx                     ; 0DB4 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0DB8 _ 89. 04 24
        call    showString                              ; 0DBB _ E8, FFFFFFFC(rel)
        mov     dword [ebp-1CH], 136                    ; 0DC0 _ C7. 45, E4, 00000088
        mov     eax, dword [ebp-0CH]                    ; 0DC7 _ 8B. 45, F4
        mov     eax, dword [eax+1CH]                    ; 0DCA _ 8B. 40, 1C
        mov     dword [esp], eax                        ; 0DCD _ 89. 04 24
        call    intToHexStr                             ; 0DD0 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-20H], eax                    ; 0DD5 _ 89. 45, E0
        mov     ecx, dword [?_329]                      ; 0DD8 _ 8B. 0D, 00000010(d)
        mov     edx, dword [g_Console]                  ; 0DDE _ 8B. 15, 00000008(d)
        mov     eax, dword [shtctl]                     ; 0DE4 _ A1, 00000264(d)
        mov     ebx, dword [ebp-20H]                    ; 0DE9 _ 8B. 5D, E0
        mov     dword [esp+14H], ebx                    ; 0DEC _ 89. 5C 24, 14
        mov     dword [esp+10H], 7                      ; 0DF0 _ C7. 44 24, 10, 00000007
        mov     dword [esp+0CH], ecx                    ; 0DF8 _ 89. 4C 24, 0C
        mov     ecx, dword [ebp-1CH]                    ; 0DFC _ 8B. 4D, E4
        mov     dword [esp+8H], ecx                     ; 0DFF _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 0E03 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0E07 _ 89. 04 24
        call    showString                              ; 0E0A _ E8, FFFFFFFC(rel)
        mov     edx, dword [g_Console]                  ; 0E0F _ 8B. 15, 00000008(d)
        mov     eax, dword [?_329]                      ; 0E15 _ A1, 00000010(d)
        mov     dword [esp+4H], edx                     ; 0E1A _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0E1E _ 89. 04 24
        call    cons_newline                            ; 0E21 _ E8, FFFFFFFC(rel)
        mov     dword [?_329], eax                      ; 0E26 _ A3, 00000010(d)
        add     dword [ebp-0CH], 32                     ; 0E2B _ 83. 45, F4, 20
?_037:  mov     eax, dword [ebp-0CH]                    ; 0E2F _ 8B. 45, F4
        movzx   eax, byte [eax]                         ; 0E32 _ 0F B6. 00
        test    al, al                                  ; 0E35 _ 84. C0
        jne     ?_030                                   ; 0E37 _ 0F 85, FFFFFECD
        mov     edx, dword [ebp-18H]                    ; 0E3D _ 8B. 55, E8
        mov     eax, dword [memman]                     ; 0E40 _ A1, 00000000(d)
        mov     dword [esp+8H], 13                      ; 0E45 _ C7. 44 24, 08, 0000000D
        mov     dword [esp+4H], edx                     ; 0E4D _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0E51 _ 89. 04 24
        call    memman_free                             ; 0E54 _ E8, FFFFFFFC(rel)
        add     esp, 68                                 ; 0E59 _ 83. C4, 44
        pop     ebx                                     ; 0E5C _ 5B
        pop     ebp                                     ; 0E5D _ 5D
        ret                                             ; 0E5E _ C3
; cmd_dir End of function

cmd_type:; Function begin
        push    ebp                                     ; 0E5F _ 55
        mov     ebp, esp                                ; 0E60 _ 89. E5
        push    esi                                     ; 0E62 _ 56
        push    ebx                                     ; 0E63 _ 53
        sub     esp, 96                                 ; 0E64 _ 83. EC, 60
        mov     eax, dword [memman]                     ; 0E67 _ A1, 00000000(d)
        mov     dword [esp+4H], 13                      ; 0E6C _ C7. 44 24, 04, 0000000D
        mov     dword [esp], eax                        ; 0E74 _ 89. 04 24
        call    memman_alloc                            ; 0E77 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-24H], eax                    ; 0E7C _ 89. 45, DC
        mov     eax, dword [ebp-24H]                    ; 0E7F _ 8B. 45, DC
        add     eax, 12                                 ; 0E82 _ 83. C0, 0C
        mov     byte [eax], 0                           ; 0E85 _ C6. 00, 00
        mov     dword [ebp-0CH], 0                      ; 0E88 _ C7. 45, F4, 00000000
        mov     dword [ebp-10H], 5                      ; 0E8F _ C7. 45, F0, 00000005
        mov     dword [ebp-10H], 5                      ; 0E96 _ C7. 45, F0, 00000005
        jmp     ?_040                                   ; 0E9D _ EB, 30

?_038:  mov     edx, dword [ebp-10H]                    ; 0E9F _ 8B. 55, F0
        mov     eax, dword [ebp+8H]                     ; 0EA2 _ 8B. 45, 08
        add     eax, edx                                ; 0EA5 _ 01. D0
        movzx   eax, byte [eax]                         ; 0EA7 _ 0F B6. 00
        test    al, al                                  ; 0EAA _ 84. C0
        jz      ?_039                                   ; 0EAC _ 74, 1F
        mov     edx, dword [ebp-0CH]                    ; 0EAE _ 8B. 55, F4
        mov     eax, dword [ebp-24H]                    ; 0EB1 _ 8B. 45, DC
        add     edx, eax                                ; 0EB4 _ 01. C2
        mov     ecx, dword [ebp-10H]                    ; 0EB6 _ 8B. 4D, F0
        mov     eax, dword [ebp+8H]                     ; 0EB9 _ 8B. 45, 08
        add     eax, ecx                                ; 0EBC _ 01. C8
        movzx   eax, byte [eax]                         ; 0EBE _ 0F B6. 00
        mov     byte [edx], al                          ; 0EC1 _ 88. 02
        add     dword [ebp-0CH], 1                      ; 0EC3 _ 83. 45, F4, 01
        add     dword [ebp-10H], 1                      ; 0EC7 _ 83. 45, F0, 01
        jmp     ?_040                                   ; 0ECB _ EB, 02

?_039:  jmp     ?_041                                   ; 0ECD _ EB, 06

?_040:  cmp     dword [ebp-10H], 16                     ; 0ECF _ 83. 7D, F0, 10
        jle     ?_038                                   ; 0ED3 _ 7E, CA
?_041:  mov     edx, dword [ebp-0CH]                    ; 0ED5 _ 8B. 55, F4
        mov     eax, dword [ebp-24H]                    ; 0ED8 _ 8B. 45, DC
        add     eax, edx                                ; 0EDB _ 01. D0
        mov     byte [eax], 0                           ; 0EDD _ C6. 00, 00
        mov     dword [ebp-14H], 78848                  ; 0EE0 _ C7. 45, EC, 00013400
        jmp     ?_057                                   ; 0EE7 _ E9, 0000023D

?_042:  mov     byte [ebp-2DH], 0                       ; 0EEC _ C6. 45, D3, 00
        mov     dword [ebp-18H], 0                      ; 0EF0 _ C7. 45, E8, 00000000
        jmp     ?_045                                   ; 0EF7 _ EB, 2C

?_043:  mov     edx, dword [ebp-14H]                    ; 0EF9 _ 8B. 55, EC
        mov     eax, dword [ebp-18H]                    ; 0EFC _ 8B. 45, E8
        add     eax, edx                                ; 0EFF _ 01. D0
        movzx   eax, byte [eax]                         ; 0F01 _ 0F B6. 00
        test    al, al                                  ; 0F04 _ 84. C0
        jz      ?_044                                   ; 0F06 _ 74, 1B
        mov     edx, dword [ebp-14H]                    ; 0F08 _ 8B. 55, EC
        mov     eax, dword [ebp-18H]                    ; 0F0B _ 8B. 45, E8
        add     eax, edx                                ; 0F0E _ 01. D0
        movzx   eax, byte [eax]                         ; 0F10 _ 0F B6. 00
        lea     ecx, [ebp-39H]                          ; 0F13 _ 8D. 4D, C7
        mov     edx, dword [ebp-18H]                    ; 0F16 _ 8B. 55, E8
        add     edx, ecx                                ; 0F19 _ 01. CA
        mov     byte [edx], al                          ; 0F1B _ 88. 02
        add     dword [ebp-18H], 1                      ; 0F1D _ 83. 45, E8, 01
        jmp     ?_045                                   ; 0F21 _ EB, 02

?_044:  jmp     ?_046                                   ; 0F23 _ EB, 06

?_045:  cmp     dword [ebp-18H], 7                      ; 0F25 _ 83. 7D, E8, 07
        jle     ?_043                                   ; 0F29 _ 7E, CE
?_046:  mov     dword [ebp-1CH], 0                      ; 0F2B _ C7. 45, E4, 00000000
        lea     edx, [ebp-39H]                          ; 0F32 _ 8D. 55, C7
        mov     eax, dword [ebp-18H]                    ; 0F35 _ 8B. 45, E8
        add     eax, edx                                ; 0F38 _ 01. D0
        mov     byte [eax], 46                          ; 0F3A _ C6. 00, 2E
        add     dword [ebp-18H], 1                      ; 0F3D _ 83. 45, E8, 01
        mov     dword [ebp-1CH], 0                      ; 0F41 _ C7. 45, E4, 00000000
        jmp     ?_048                                   ; 0F48 _ EB, 1E

?_047:  mov     edx, dword [ebp-14H]                    ; 0F4A _ 8B. 55, EC
        mov     eax, dword [ebp-1CH]                    ; 0F4D _ 8B. 45, E4
        add     eax, edx                                ; 0F50 _ 01. D0
        movzx   eax, byte [eax+8H]                      ; 0F52 _ 0F B6. 40, 08
        lea     ecx, [ebp-39H]                          ; 0F56 _ 8D. 4D, C7
        mov     edx, dword [ebp-18H]                    ; 0F59 _ 8B. 55, E8
        add     edx, ecx                                ; 0F5C _ 01. CA
        mov     byte [edx], al                          ; 0F5E _ 88. 02
        add     dword [ebp-18H], 1                      ; 0F60 _ 83. 45, E8, 01
        add     dword [ebp-1CH], 1                      ; 0F64 _ 83. 45, E4, 01
?_048:  cmp     dword [ebp-1CH], 2                      ; 0F68 _ 83. 7D, E4, 02
        jle     ?_047                                   ; 0F6C _ 7E, DC
        lea     eax, [ebp-39H]                          ; 0F6E _ 8D. 45, C7
        mov     dword [esp+4H], eax                     ; 0F71 _ 89. 44 24, 04
        mov     eax, dword [ebp-24H]                    ; 0F75 _ 8B. 45, DC
        mov     dword [esp], eax                        ; 0F78 _ 89. 04 24
        call    strcmp                                  ; 0F7B _ E8, FFFFFFFC(rel)
        cmp     eax, 1                                  ; 0F80 _ 83. F8, 01
        jne     ?_056                                   ; 0F83 _ 0F 85, 0000019C
        mov     dword [ebp-28H], 88064                  ; 0F89 _ C7. 45, D8, 00015800
        mov     eax, dword [ebp-14H]                    ; 0F90 _ 8B. 45, EC
        movzx   eax, word [eax+1AH]                     ; 0F93 _ 0F B7. 40, 1A
        movzx   eax, ax                                 ; 0F97 _ 0F B7. C0
        shl     eax, 9                                  ; 0F9A _ C1. E0, 09
        add     dword [ebp-28H], eax                    ; 0F9D _ 01. 45, D8
        mov     eax, dword [ebp-14H]                    ; 0FA0 _ 8B. 45, EC
        mov     eax, dword [eax+1CH]                    ; 0FA3 _ 8B. 40, 1C
        mov     dword [ebp-2CH], eax                    ; 0FA6 _ 89. 45, D4
        mov     dword [ebp-20H], 0                      ; 0FA9 _ C7. 45, E0, 00000000
        mov     dword [?_328], 16                       ; 0FB0 _ C7. 05, 0000000C(d), 00000010
        mov     dword [ebp-20H], 0                      ; 0FBA _ C7. 45, E0, 00000000
        jmp     ?_055                                   ; 0FC1 _ E9, 00000150

?_049:  mov     edx, dword [ebp-20H]                    ; 0FC6 _ 8B. 55, E0
        mov     eax, dword [ebp-28H]                    ; 0FC9 _ 8B. 45, D8
        add     eax, edx                                ; 0FCC _ 01. D0
        movzx   eax, byte [eax]                         ; 0FCE _ 0F B6. 00
        mov     byte [ebp-3BH], al                      ; 0FD1 _ 88. 45, C5
        mov     byte [ebp-3AH], 0                       ; 0FD4 _ C6. 45, C6, 00
        movzx   eax, byte [ebp-3BH]                     ; 0FD8 _ 0F B6. 45, C5
        cmp     al, 9                                   ; 0FDC _ 3C, 09
        jnz     ?_052                                   ; 0FDE _ 75, 7E
?_050:  mov     ebx, dword [?_329]                      ; 0FE0 _ 8B. 1D, 00000010(d)
        mov     ecx, dword [?_328]                      ; 0FE6 _ 8B. 0D, 0000000C(d)
        mov     edx, dword [g_Console]                  ; 0FEC _ 8B. 15, 00000008(d)
        mov     eax, dword [shtctl]                     ; 0FF2 _ A1, 00000264(d)
        mov     dword [esp+14H], ?_308                  ; 0FF7 _ C7. 44 24, 14, 00000024(d)
        mov     dword [esp+10H], 7                      ; 0FFF _ C7. 44 24, 10, 00000007
        mov     dword [esp+0CH], ebx                    ; 1007 _ 89. 5C 24, 0C
        mov     dword [esp+8H], ecx                     ; 100B _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 100F _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1013 _ 89. 04 24
        call    showString                              ; 1016 _ E8, FFFFFFFC(rel)
        mov     eax, dword [?_328]                      ; 101B _ A1, 0000000C(d)
        add     eax, 8                                  ; 1020 _ 83. C0, 08
        mov     dword [?_328], eax                      ; 1023 _ A3, 0000000C(d)
        mov     eax, dword [?_328]                      ; 1028 _ A1, 0000000C(d)
        cmp     eax, 248                                ; 102D _ 3D, 000000F8
        jnz     ?_051                                   ; 1032 _ 75, 28
        mov     dword [?_328], 8                        ; 1034 _ C7. 05, 0000000C(d), 00000008
        mov     edx, dword [g_Console]                  ; 103E _ 8B. 15, 00000008(d)
        mov     eax, dword [?_329]                      ; 1044 _ A1, 00000010(d)
        mov     dword [esp+4H], edx                     ; 1049 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 104D _ 89. 04 24
        call    cons_newline                            ; 1050 _ E8, FFFFFFFC(rel)
        mov     dword [?_329], eax                      ; 1055 _ A3, 00000010(d)
        jmp     ?_050                                   ; 105A _ EB, 84

?_051:  jmp     ?_050                                   ; 105C _ EB, 82

?_052:  movzx   eax, byte [ebp-3BH]                     ; 105E _ 0F B6. 45, C5
        cmp     al, 10                                  ; 1062 _ 3C, 0A
        jnz     ?_053                                   ; 1064 _ 75, 2B
        mov     dword [?_328], 8                        ; 1066 _ C7. 05, 0000000C(d), 00000008
        mov     edx, dword [g_Console]                  ; 1070 _ 8B. 15, 00000008(d)
        mov     eax, dword [?_329]                      ; 1076 _ A1, 00000010(d)
        mov     dword [esp+4H], edx                     ; 107B _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 107F _ 89. 04 24
        call    cons_newline                            ; 1082 _ E8, FFFFFFFC(rel)
        mov     dword [?_329], eax                      ; 1087 _ A3, 00000010(d)
        jmp     ?_054                                   ; 108C _ E9, 00000081

?_053:  movzx   eax, byte [ebp-3BH]                     ; 1091 _ 0F B6. 45, C5
        cmp     al, 13                                  ; 1095 _ 3C, 0D
        jz      ?_054                                   ; 1097 _ 74, 79
        mov     ebx, dword [?_329]                      ; 1099 _ 8B. 1D, 00000010(d)
        mov     ecx, dword [?_328]                      ; 109F _ 8B. 0D, 0000000C(d)
        mov     edx, dword [g_Console]                  ; 10A5 _ 8B. 15, 00000008(d)
        mov     eax, dword [shtctl]                     ; 10AB _ A1, 00000264(d)
        lea     esi, [ebp-3BH]                          ; 10B0 _ 8D. 75, C5
        mov     dword [esp+14H], esi                    ; 10B3 _ 89. 74 24, 14
        mov     dword [esp+10H], 7                      ; 10B7 _ C7. 44 24, 10, 00000007
        mov     dword [esp+0CH], ebx                    ; 10BF _ 89. 5C 24, 0C
        mov     dword [esp+8H], ecx                     ; 10C3 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 10C7 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 10CB _ 89. 04 24
        call    showString                              ; 10CE _ E8, FFFFFFFC(rel)
        mov     eax, dword [?_328]                      ; 10D3 _ A1, 0000000C(d)
        add     eax, 8                                  ; 10D8 _ 83. C0, 08
        mov     dword [?_328], eax                      ; 10DB _ A3, 0000000C(d)
        mov     eax, dword [?_328]                      ; 10E0 _ A1, 0000000C(d)
        cmp     eax, 248                                ; 10E5 _ 3D, 000000F8
        jnz     ?_054                                   ; 10EA _ 75, 26
        mov     dword [?_328], 16                       ; 10EC _ C7. 05, 0000000C(d), 00000010
        mov     edx, dword [g_Console]                  ; 10F6 _ 8B. 15, 00000008(d)
        mov     eax, dword [?_329]                      ; 10FC _ A1, 00000010(d)
        mov     dword [esp+4H], edx                     ; 1101 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1105 _ 89. 04 24
        call    cons_newline                            ; 1108 _ E8, FFFFFFFC(rel)
        mov     dword [?_329], eax                      ; 110D _ A3, 00000010(d)
?_054:  add     dword [ebp-20H], 1                      ; 1112 _ 83. 45, E0, 01
?_055:  mov     eax, dword [ebp-20H]                    ; 1116 _ 8B. 45, E0
        cmp     eax, dword [ebp-2CH]                    ; 1119 _ 3B. 45, D4
        jl      ?_049                                   ; 111C _ 0F 8C, FFFFFEA4
        nop                                             ; 1122 _ 90
        jmp     ?_058                                   ; 1123 _ EB, 12

?_056:  add     dword [ebp-14H], 32                     ; 1125 _ 83. 45, EC, 20
?_057:  mov     eax, dword [ebp-14H]                    ; 1129 _ 8B. 45, EC
        movzx   eax, byte [eax]                         ; 112C _ 0F B6. 00
        test    al, al                                  ; 112F _ 84. C0
        jne     ?_042                                   ; 1131 _ 0F 85, FFFFFDB5
?_058:  mov     edx, dword [g_Console]                  ; 1137 _ 8B. 15, 00000008(d)
        mov     eax, dword [?_329]                      ; 113D _ A1, 00000010(d)
        mov     dword [esp+4H], edx                     ; 1142 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1146 _ 89. 04 24
        call    cons_newline                            ; 1149 _ E8, FFFFFFFC(rel)
        mov     dword [?_329], eax                      ; 114E _ A3, 00000010(d)
        mov     edx, dword [ebp-24H]                    ; 1153 _ 8B. 55, DC
        mov     eax, dword [memman]                     ; 1156 _ A1, 00000000(d)
        mov     dword [esp+8H], 13                      ; 115B _ C7. 44 24, 08, 0000000D
        mov     dword [esp+4H], edx                     ; 1163 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1167 _ 89. 04 24
        call    memman_free                             ; 116A _ E8, FFFFFFFC(rel)
        mov     dword [?_328], 16                       ; 116F _ C7. 05, 0000000C(d), 00000010
        add     esp, 96                                 ; 1179 _ 83. C4, 60
        pop     ebx                                     ; 117C _ 5B
        pop     esi                                     ; 117D _ 5E
        pop     ebp                                     ; 117E _ 5D
        ret                                             ; 117F _ C3
; cmd_type End of function

cmd_mem:; Function begin
        push    ebp                                     ; 1180 _ 55
        mov     ebp, esp                                ; 1181 _ 89. E5
        push    ebx                                     ; 1183 _ 53
        sub     esp, 52                                 ; 1184 _ 83. EC, 34
        mov     eax, dword [ebp+8H]                     ; 1187 _ 8B. 45, 08
        lea     edx, [eax+3FFH]                         ; 118A _ 8D. 90, 000003FF
        test    eax, eax                                ; 1190 _ 85. C0
        cmovs   eax, edx                                ; 1192 _ 0F 48. C2
        sar     eax, 10                                 ; 1195 _ C1. F8, 0A
        mov     dword [esp], eax                        ; 1198 _ 89. 04 24
        call    intToHexStr                             ; 119B _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 11A0 _ 89. 45, F4
        mov     ecx, dword [?_329]                      ; 11A3 _ 8B. 0D, 00000010(d)
        mov     edx, dword [g_Console]                  ; 11A9 _ 8B. 15, 00000008(d)
        mov     eax, dword [shtctl]                     ; 11AF _ A1, 00000264(d)
        mov     dword [esp+14H], ?_309                  ; 11B4 _ C7. 44 24, 14, 00000026(d)
        mov     dword [esp+10H], 7                      ; 11BC _ C7. 44 24, 10, 00000007
        mov     dword [esp+0CH], ecx                    ; 11C4 _ 89. 4C 24, 0C
        mov     dword [esp+8H], 16                      ; 11C8 _ C7. 44 24, 08, 00000010
        mov     dword [esp+4H], edx                     ; 11D0 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 11D4 _ 89. 04 24
        call    showString                              ; 11D7 _ E8, FFFFFFFC(rel)
        mov     ecx, dword [?_329]                      ; 11DC _ 8B. 0D, 00000010(d)
        mov     edx, dword [g_Console]                  ; 11E2 _ 8B. 15, 00000008(d)
        mov     eax, dword [shtctl]                     ; 11E8 _ A1, 00000264(d)
        mov     ebx, dword [ebp-0CH]                    ; 11ED _ 8B. 5D, F4
        mov     dword [esp+14H], ebx                    ; 11F0 _ 89. 5C 24, 14
        mov     dword [esp+10H], 7                      ; 11F4 _ C7. 44 24, 10, 00000007
        mov     dword [esp+0CH], ecx                    ; 11FC _ 89. 4C 24, 0C
        mov     dword [esp+8H], 52                      ; 1200 _ C7. 44 24, 08, 00000034
        mov     dword [esp+4H], edx                     ; 1208 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 120C _ 89. 04 24
        call    showString                              ; 120F _ E8, FFFFFFFC(rel)
        mov     ecx, dword [?_329]                      ; 1214 _ 8B. 0D, 00000010(d)
        mov     edx, dword [g_Console]                  ; 121A _ 8B. 15, 00000008(d)
        mov     eax, dword [shtctl]                     ; 1220 _ A1, 00000264(d)
        mov     dword [esp+14H], ?_310                  ; 1225 _ C7. 44 24, 14, 0000002C(d)
        mov     dword [esp+10H], 7                      ; 122D _ C7. 44 24, 10, 00000007
        mov     dword [esp+0CH], ecx                    ; 1235 _ 89. 4C 24, 0C
        mov     dword [esp+8H], 126                     ; 1239 _ C7. 44 24, 08, 0000007E
        mov     dword [esp+4H], edx                     ; 1241 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1245 _ 89. 04 24
        call    showString                              ; 1248 _ E8, FFFFFFFC(rel)
        mov     edx, dword [g_Console]                  ; 124D _ 8B. 15, 00000008(d)
        mov     eax, dword [?_329]                      ; 1253 _ A1, 00000010(d)
        mov     dword [esp+4H], edx                     ; 1258 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 125C _ 89. 04 24
        call    cons_newline                            ; 125F _ E8, FFFFFFFC(rel)
        mov     dword [?_329], eax                      ; 1264 _ A3, 00000010(d)
        add     esp, 52                                 ; 1269 _ 83. C4, 34
        pop     ebx                                     ; 126C _ 5B
        pop     ebp                                     ; 126D _ 5D
        ret                                             ; 126E _ C3
; cmd_mem End of function

cmd_cls:; Function begin
        push    ebp                                     ; 126F _ 55
        mov     ebp, esp                                ; 1270 _ 89. E5
        sub     esp, 56                                 ; 1272 _ 83. EC, 38
        mov     dword [ebp-0CH], 8                      ; 1275 _ C7. 45, F4, 00000008
        mov     dword [ebp-10H], 28                     ; 127C _ C7. 45, F0, 0000001C
        mov     dword [ebp-10H], 28                     ; 1283 _ C7. 45, F0, 0000001C
        jmp     ?_062                                   ; 128A _ EB, 39

?_059:  mov     dword [ebp-0CH], 8                      ; 128C _ C7. 45, F4, 00000008
        jmp     ?_061                                   ; 1293 _ EB, 23

?_060:  mov     eax, dword [g_Console]                  ; 1295 _ A1, 00000008(d)
        mov     edx, dword [eax]                        ; 129A _ 8B. 10
        mov     eax, dword [g_Console]                  ; 129C _ A1, 00000008(d)
        mov     eax, dword [eax+4H]                     ; 12A1 _ 8B. 40, 04
        imul    eax, dword [ebp-10H]                    ; 12A4 _ 0F AF. 45, F0
        mov     ecx, eax                                ; 12A8 _ 89. C1
        mov     eax, dword [ebp-0CH]                    ; 12AA _ 8B. 45, F4
        add     eax, ecx                                ; 12AD _ 01. C8
        add     eax, edx                                ; 12AF _ 01. D0
        mov     byte [eax], 0                           ; 12B1 _ C6. 00, 00
        add     dword [ebp-0CH], 1                      ; 12B4 _ 83. 45, F4, 01
?_061:  cmp     dword [ebp-0CH], 247                    ; 12B8 _ 81. 7D, F4, 000000F7
        jle     ?_060                                   ; 12BF _ 7E, D4
        add     dword [ebp-10H], 1                      ; 12C1 _ 83. 45, F0, 01
?_062:  cmp     dword [ebp-10H], 155                    ; 12C5 _ 81. 7D, F0, 0000009B
        jle     ?_059                                   ; 12CC _ 7E, BE
        mov     edx, dword [g_Console]                  ; 12CE _ 8B. 15, 00000008(d)
        mov     eax, dword [shtctl]                     ; 12D4 _ A1, 00000264(d)
        mov     dword [esp+14H], 156                    ; 12D9 _ C7. 44 24, 14, 0000009C
        mov     dword [esp+10H], 248                    ; 12E1 _ C7. 44 24, 10, 000000F8
        mov     dword [esp+0CH], 28                     ; 12E9 _ C7. 44 24, 0C, 0000001C
        mov     dword [esp+8H], 8                       ; 12F1 _ C7. 44 24, 08, 00000008
        mov     dword [esp+4H], edx                     ; 12F9 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 12FD _ 89. 04 24
        call    sheet_refresh                           ; 1300 _ E8, FFFFFFFC(rel)
        mov     dword [?_329], 28                       ; 1305 _ C7. 05, 00000010(d), 0000001C
        mov     edx, dword [g_Console]                  ; 130F _ 8B. 15, 00000008(d)
        mov     eax, dword [shtctl]                     ; 1315 _ A1, 00000264(d)
        mov     dword [esp+14H], ?_311                  ; 131A _ C7. 44 24, 14, 00000030(d)
        mov     dword [esp+10H], 7                      ; 1322 _ C7. 44 24, 10, 00000007
        mov     dword [esp+0CH], 28                     ; 132A _ C7. 44 24, 0C, 0000001C
        mov     dword [esp+8H], 8                       ; 1332 _ C7. 44 24, 08, 00000008
        mov     dword [esp+4H], edx                     ; 133A _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 133E _ 89. 04 24
        call    showString                              ; 1341 _ E8, FFFFFFFC(rel)
        leave                                           ; 1346 _ C9
        ret                                             ; 1347 _ C3
; cmd_cls End of function

cmd_hlt:; Function begin
        push    ebp                                     ; 1348 _ 55
        mov     ebp, esp                                ; 1349 _ 89. E5
        sub     esp, 56                                 ; 134B _ 83. EC, 38
        mov     dword [esp+4H], buffer                  ; 134E _ C7. 44 24, 04, 00000278(d)
        mov     dword [esp], ?_312                      ; 1356 _ C7. 04 24, 00000032(d)
        call    file_loadfile                           ; 135D _ E8, FFFFFFFC(rel)
        call    get_addr_gdt                            ; 1362 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 1367 _ 89. 45, F4
        mov     eax, dword [buffer]                     ; 136A _ A1, 00000278(d)
        mov     edx, dword [ebp-0CH]                    ; 136F _ 8B. 55, F4
        add     edx, 88                                 ; 1372 _ 83. C2, 58
        mov     dword [esp+0CH], 16634                  ; 1375 _ C7. 44 24, 0C, 000040FA
        mov     dword [esp+8H], eax                     ; 137D _ 89. 44 24, 08
        mov     dword [esp+4H], 1048575                 ; 1381 _ C7. 44 24, 04, 000FFFFF
        mov     dword [esp], edx                        ; 1389 _ 89. 14 24
        call    set_segmdesc                            ; 138C _ E8, FFFFFFFC(rel)
        mov     eax, dword [memman]                     ; 1391 _ A1, 00000000(d)
        mov     dword [esp+4H], 65536                   ; 1396 _ C7. 44 24, 04, 00010000
        mov     dword [esp], eax                        ; 139E _ 89. 04 24
        call    memman_alloc_4k                         ; 13A1 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 13A6 _ 89. 45, F0
        mov     eax, dword [ebp-10H]                    ; 13A9 _ 8B. 45, F0
        mov     dword [?_337], eax                      ; 13AC _ A3, 0000027C(d)
        mov     eax, dword [ebp-10H]                    ; 13B1 _ 8B. 45, F0
        mov     edx, dword [ebp-0CH]                    ; 13B4 _ 8B. 55, F4
        add     edx, 96                                 ; 13B7 _ 83. C2, 60
        mov     dword [esp+0CH], 16626                  ; 13BA _ C7. 44 24, 0C, 000040F2
        mov     dword [esp+8H], eax                     ; 13C2 _ 89. 44 24, 08
        mov     dword [esp+4H], 65535                   ; 13C6 _ C7. 44 24, 04, 0000FFFF
        mov     dword [esp], edx                        ; 13CE _ 89. 14 24
        call    set_segmdesc                            ; 13D1 _ E8, FFFFFFFC(rel)
        call    task_now                                ; 13D6 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-14H], eax                    ; 13DB _ 89. 45, EC
        mov     eax, dword [ebp-14H]                    ; 13DE _ 8B. 45, EC
        mov     dword [eax+30H], 0                      ; 13E1 _ C7. 40, 30, 00000000
        mov     eax, dword [ebp-14H]                    ; 13E8 _ 8B. 45, EC
        add     eax, 48                                 ; 13EB _ 83. C0, 30
        mov     dword [esp+10H], eax                    ; 13EE _ 89. 44 24, 10
        mov     dword [esp+0CH], 96                     ; 13F2 _ C7. 44 24, 0C, 00000060
        mov     dword [esp+8H], 65536                   ; 13FA _ C7. 44 24, 08, 00010000
        mov     dword [esp+4H], 88                      ; 1402 _ C7. 44 24, 04, 00000058
        mov     dword [esp], 0                          ; 140A _ C7. 04 24, 00000000
        call    start_app                               ; 1411 _ E8, FFFFFFFC(rel)
        mov     eax, dword [?_338]                      ; 1416 _ A1, 00000280(d)
        mov     ecx, eax                                ; 141B _ 89. C1
        mov     eax, dword [buffer]                     ; 141D _ A1, 00000278(d)
        mov     edx, eax                                ; 1422 _ 89. C2
        mov     eax, dword [memman]                     ; 1424 _ A1, 00000000(d)
        mov     dword [esp+8H], ecx                     ; 1429 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 142D _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1431 _ 89. 04 24
        call    memman_free_4k                          ; 1434 _ E8, FFFFFFFC(rel)
        mov     edx, dword [ebp-10H]                    ; 1439 _ 8B. 55, F0
        mov     eax, dword [memman]                     ; 143C _ A1, 00000000(d)
        mov     dword [esp+8H], 65536                   ; 1441 _ C7. 44 24, 08, 00010000
        mov     dword [esp+4H], edx                     ; 1449 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 144D _ 89. 04 24
        call    memman_free_4k                          ; 1450 _ E8, FFFFFFFC(rel)
        leave                                           ; 1455 _ C9
        ret                                             ; 1456 _ C3
; cmd_hlt End of function

console_task:; Function begin
        push    ebp                                     ; 1457 _ 55
        mov     ebp, esp                                ; 1458 _ 89. E5
        push    ebx                                     ; 145A _ 53
        sub     esp, 84                                 ; 145B _ 83. EC, 54
        call    task_now                                ; 145E _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 1463 _ 89. 45, F0
        mov     dword [ebp-0CH], 0                      ; 1466 _ C7. 45, F4, 00000000
        mov     dword [ebp-14H], 0                      ; 146D _ C7. 45, EC, 00000000
        mov     dword [ebp-18H], 0                      ; 1474 _ C7. 45, E8, 00000000
        mov     eax, dword [memman]                     ; 147B _ A1, 00000000(d)
        mov     dword [esp+4H], 128                     ; 1480 _ C7. 44 24, 04, 00000080
        mov     dword [esp], eax                        ; 1488 _ 89. 04 24
        call    memman_alloc                            ; 148B _ E8, FFFFFFFC(rel)
        mov     dword [ebp-1CH], eax                    ; 1490 _ 89. 45, E4
        mov     eax, dword [memman]                     ; 1493 _ A1, 00000000(d)
        mov     dword [esp+4H], 30                      ; 1498 _ C7. 44 24, 04, 0000001E
        mov     dword [esp], eax                        ; 14A0 _ 89. 04 24
        call    memman_alloc                            ; 14A3 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-20H], eax                    ; 14A8 _ 89. 45, E0
        mov     eax, dword [ebp+8H]                     ; 14AB _ 8B. 45, 08
        mov     dword [g_Console], eax                  ; 14AE _ A3, 00000008(d)
        mov     dword [?_328], 16                       ; 14B3 _ C7. 05, 0000000C(d), 00000010
        mov     dword [?_329], 28                       ; 14BD _ C7. 05, 00000010(d), 0000001C
        mov     dword [?_330], -1                       ; 14C7 _ C7. 05, 00000014(d), FFFFFFFF
        mov     eax, dword [ebp-10H]                    ; 14D1 _ 8B. 45, F0
        lea     edx, [eax+10H]                          ; 14D4 _ 8D. 50, 10
        mov     eax, dword [ebp-10H]                    ; 14D7 _ 8B. 45, F0
        mov     dword [esp+0CH], eax                    ; 14DA _ 89. 44 24, 0C
        mov     eax, dword [ebp-1CH]                    ; 14DE _ 8B. 45, E4
        mov     dword [esp+8H], eax                     ; 14E1 _ 89. 44 24, 08
        mov     dword [esp+4H], 128                     ; 14E5 _ C7. 44 24, 04, 00000080
        mov     dword [esp], edx                        ; 14ED _ 89. 14 24
        call    fifo8_init                              ; 14F0 _ E8, FFFFFFFC(rel)
        call    timer_alloc                             ; 14F5 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-24H], eax                    ; 14FA _ 89. 45, DC
        mov     eax, dword [ebp-10H]                    ; 14FD _ 8B. 45, F0
        add     eax, 16                                 ; 1500 _ 83. C0, 10
        mov     dword [esp+8H], 1                       ; 1503 _ C7. 44 24, 08, 00000001
        mov     dword [esp+4H], eax                     ; 150B _ 89. 44 24, 04
        mov     eax, dword [ebp-24H]                    ; 150F _ 8B. 45, DC
        mov     dword [esp], eax                        ; 1512 _ 89. 04 24
        call    timer_init                              ; 1515 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 50                      ; 151A _ C7. 44 24, 04, 00000032
        mov     eax, dword [ebp-24H]                    ; 1522 _ 8B. 45, DC
        mov     dword [esp], eax                        ; 1525 _ 89. 04 24
        call    timer_settime                           ; 1528 _ E8, FFFFFFFC(rel)
        mov     eax, dword [shtctl]                     ; 152D _ A1, 00000264(d)
        mov     dword [esp+14H], ?_311                  ; 1532 _ C7. 44 24, 14, 00000030(d)
        mov     dword [esp+10H], 7                      ; 153A _ C7. 44 24, 10, 00000007
        mov     dword [esp+0CH], 28                     ; 1542 _ C7. 44 24, 0C, 0000001C
        mov     dword [esp+8H], 8                       ; 154A _ C7. 44 24, 08, 00000008
        mov     edx, dword [ebp+8H]                     ; 1552 _ 8B. 55, 08
        mov     dword [esp+4H], edx                     ; 1555 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1559 _ 89. 04 24
        call    showString                              ; 155C _ E8, FFFFFFFC(rel)
        mov     dword [ebp-28H], 0                      ; 1561 _ C7. 45, D8, 00000000
        mov     dword [ebp-2CH], 78848                  ; 1568 _ C7. 45, D4, 00013400
        mov     dword [ebp-30H], 0                      ; 156F _ C7. 45, D0, 00000000
?_063:  call    io_cli                                  ; 1576 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 157B _ 8B. 45, F0
        add     eax, 16                                 ; 157E _ 83. C0, 10
        mov     dword [esp], eax                        ; 1581 _ 89. 04 24
        call    fifo8_status                            ; 1584 _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 1589 _ 85. C0
        jnz     ?_064                                   ; 158B _ 75, 0A
        call    io_sti                                  ; 158D _ E8, FFFFFFFC(rel)
        jmp     ?_077                                   ; 1592 _ E9, 000003AF

?_064:  call    io_sti                                  ; 1597 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 159C _ 8B. 45, F0
        add     eax, 16                                 ; 159F _ 83. C0, 10
        mov     dword [esp], eax                        ; 15A2 _ 89. 04 24
        call    fifo8_get                               ; 15A5 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-34H], eax                    ; 15AA _ 89. 45, CC
        cmp     dword [ebp-34H], 1                      ; 15AD _ 83. 7D, CC, 01
        jg      ?_067                                   ; 15B1 _ 7F, 6E
        cmp     dword [ebp-0CH], 0                      ; 15B3 _ 83. 7D, F4, 00
        js      ?_067                                   ; 15B7 _ 78, 68
        cmp     dword [ebp-34H], 0                      ; 15B9 _ 83. 7D, CC, 00
        jz      ?_065                                   ; 15BD _ 74, 26
        mov     eax, dword [ebp-10H]                    ; 15BF _ 8B. 45, F0
        add     eax, 16                                 ; 15C2 _ 83. C0, 10
        mov     dword [esp+8H], 0                       ; 15C5 _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], eax                     ; 15CD _ 89. 44 24, 04
        mov     eax, dword [ebp-24H]                    ; 15D1 _ 8B. 45, DC
        mov     dword [esp], eax                        ; 15D4 _ 89. 04 24
        call    timer_init                              ; 15D7 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], 7                      ; 15DC _ C7. 45, F4, 00000007
        jmp     ?_066                                   ; 15E3 _ EB, 24

?_065:  mov     eax, dword [ebp-10H]                    ; 15E5 _ 8B. 45, F0
        add     eax, 16                                 ; 15E8 _ 83. C0, 10
        mov     dword [esp+8H], 1                       ; 15EB _ C7. 44 24, 08, 00000001
        mov     dword [esp+4H], eax                     ; 15F3 _ 89. 44 24, 04
        mov     eax, dword [ebp-24H]                    ; 15F7 _ 8B. 45, DC
        mov     dword [esp], eax                        ; 15FA _ 89. 04 24
        call    timer_init                              ; 15FD _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], 0                      ; 1602 _ C7. 45, F4, 00000000
?_066:  mov     dword [esp+4H], 50                      ; 1609 _ C7. 44 24, 04, 00000032
        mov     eax, dword [ebp-24H]                    ; 1611 _ 8B. 45, DC
        mov     dword [esp], eax                        ; 1614 _ 89. 04 24
        call    timer_settime                           ; 1617 _ E8, FFFFFFFC(rel)
        jmp     ?_076                                   ; 161C _ E9, 000002EB

?_067:  cmp     dword [ebp-34H], 87                     ; 1621 _ 83. 7D, CC, 57
        jnz     ?_068                                   ; 1625 _ 75, 3C
        mov     dword [ebp-0CH], 7                      ; 1627 _ C7. 45, F4, 00000007
        mov     eax, dword [ebp-10H]                    ; 162E _ 8B. 45, F0
        add     eax, 16                                 ; 1631 _ 83. C0, 10
        mov     dword [esp+8H], 0                       ; 1634 _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], eax                     ; 163C _ 89. 44 24, 04
        mov     eax, dword [ebp-24H]                    ; 1640 _ 8B. 45, DC
        mov     dword [esp], eax                        ; 1643 _ 89. 04 24
        call    timer_init                              ; 1646 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 50                      ; 164B _ C7. 44 24, 04, 00000032
        mov     eax, dword [ebp-24H]                    ; 1653 _ 8B. 45, DC
        mov     dword [esp], eax                        ; 1656 _ 89. 04 24
        call    timer_settime                           ; 1659 _ E8, FFFFFFFC(rel)
        jmp     ?_076                                   ; 165E _ E9, 000002A9

?_068:  cmp     dword [ebp-34H], 88                     ; 1663 _ 83. 7D, CC, 58
        jnz     ?_069                                   ; 1667 _ 75, 59
        mov     ecx, dword [?_329]                      ; 1669 _ 8B. 0D, 00000010(d)
        mov     edx, dword [?_328]                      ; 166F _ 8B. 15, 0000000C(d)
        mov     eax, dword [shtctl]                     ; 1675 _ A1, 00000264(d)
        mov     dword [esp+10H], 0                      ; 167A _ C7. 44 24, 10, 00000000
        mov     dword [esp+0CH], ecx                    ; 1682 _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 1686 _ 89. 54 24, 08
        mov     edx, dword [ebp+8H]                     ; 168A _ 8B. 55, 08
        mov     dword [esp+4H], edx                     ; 168D _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1691 _ 89. 04 24
        call    set_cursor                              ; 1694 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], -1                     ; 1699 _ C7. 45, F4, FFFFFFFF
        mov     eax, dword [task_main]                  ; 16A0 _ A1, 00000274(d)
        mov     dword [esp+8H], 0                       ; 16A5 _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], -1                      ; 16AD _ C7. 44 24, 04, FFFFFFFF
        mov     dword [esp], eax                        ; 16B5 _ 89. 04 24
        call    task_run                                ; 16B8 _ E8, FFFFFFFC(rel)
        jmp     ?_076                                   ; 16BD _ E9, 0000024A

?_069:  cmp     dword [ebp-34H], 28                     ; 16C2 _ 83. 7D, CC, 1C
        jne     ?_074                                   ; 16C6 _ 0F 85, 00000154
        mov     ecx, dword [?_329]                      ; 16CC _ 8B. 0D, 00000010(d)
        mov     edx, dword [?_328]                      ; 16D2 _ 8B. 15, 0000000C(d)
        mov     eax, dword [shtctl]                     ; 16D8 _ A1, 00000264(d)
        mov     dword [esp+10H], 0                      ; 16DD _ C7. 44 24, 10, 00000000
        mov     dword [esp+0CH], ecx                    ; 16E5 _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 16E9 _ 89. 54 24, 08
        mov     edx, dword [ebp+8H]                     ; 16ED _ 8B. 55, 08
        mov     dword [esp+4H], edx                     ; 16F0 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 16F4 _ 89. 04 24
        call    set_cursor                              ; 16F7 _ E8, FFFFFFFC(rel)
        mov     eax, dword [?_328]                      ; 16FC _ A1, 0000000C(d)
        lea     edx, [eax+7H]                           ; 1701 _ 8D. 50, 07
        test    eax, eax                                ; 1704 _ 85. C0
        cmovs   eax, edx                                ; 1706 _ 0F 48. C2
        sar     eax, 3                                  ; 1709 _ C1. F8, 03
        lea     edx, [eax-2H]                           ; 170C _ 8D. 50, FE
        mov     eax, dword [ebp-20H]                    ; 170F _ 8B. 45, E0
        add     eax, edx                                ; 1712 _ 01. D0
        mov     byte [eax], 0                           ; 1714 _ C6. 00, 00
        mov     eax, dword [?_329]                      ; 1717 _ A1, 00000010(d)
        mov     edx, dword [ebp+8H]                     ; 171C _ 8B. 55, 08
        mov     dword [esp+4H], edx                     ; 171F _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1723 _ 89. 04 24
        call    cons_newline                            ; 1726 _ E8, FFFFFFFC(rel)
        mov     dword [?_329], eax                      ; 172B _ A3, 00000010(d)
        mov     dword [?_328], 16                       ; 1730 _ C7. 05, 0000000C(d), 00000010
        mov     dword [esp+4H], ?_313                   ; 173A _ C7. 44 24, 04, 0000003A(d)
        mov     eax, dword [ebp-20H]                    ; 1742 _ 8B. 45, E0
        mov     dword [esp], eax                        ; 1745 _ 89. 04 24
        call    strcmp                                  ; 1748 _ E8, FFFFFFFC(rel)
        cmp     eax, 1                                  ; 174D _ 83. F8, 01
        jnz     ?_070                                   ; 1750 _ 75, 10
        mov     eax, dword [ebp+0CH]                    ; 1752 _ 8B. 45, 0C
        mov     dword [esp], eax                        ; 1755 _ 89. 04 24
        call    cmd_mem                                 ; 1758 _ E8, FFFFFFFC(rel)
        jmp     ?_076                                   ; 175D _ E9, 000001AA

?_070:  mov     dword [esp+4H], ?_314                   ; 1762 _ C7. 44 24, 04, 0000003E(d)
        mov     eax, dword [ebp-20H]                    ; 176A _ 8B. 45, E0
        mov     dword [esp], eax                        ; 176D _ 89. 04 24
        call    strcmp                                  ; 1770 _ E8, FFFFFFFC(rel)
        cmp     eax, 1                                  ; 1775 _ 83. F8, 01
        jnz     ?_071                                   ; 1778 _ 75, 0A
        call    cmd_cls                                 ; 177A _ E8, FFFFFFFC(rel)
        jmp     ?_076                                   ; 177F _ E9, 00000188

?_071:  mov     dword [esp+4H], ?_315                   ; 1784 _ C7. 44 24, 04, 00000042(d)
        mov     eax, dword [ebp-20H]                    ; 178C _ 8B. 45, E0
        mov     dword [esp], eax                        ; 178F _ 89. 04 24
        call    strcmp                                  ; 1792 _ E8, FFFFFFFC(rel)
        cmp     eax, 1                                  ; 1797 _ 83. F8, 01
        jnz     ?_072                                   ; 179A _ 75, 11
        call    cmd_hlt                                 ; 179C _ E8, FFFFFFFC(rel)
        mov     dword [ebp-30H], 1                      ; 17A1 _ C7. 45, D0, 00000001
        jmp     ?_076                                   ; 17A8 _ E9, 0000015F

?_072:  mov     dword [esp+4H], ?_316                   ; 17AD _ C7. 44 24, 04, 00000046(d)
        mov     eax, dword [ebp-20H]                    ; 17B5 _ 8B. 45, E0
        mov     dword [esp], eax                        ; 17B8 _ 89. 04 24
        call    strcmp                                  ; 17BB _ E8, FFFFFFFC(rel)
        cmp     eax, 1                                  ; 17C0 _ 83. F8, 01
        jnz     ?_073                                   ; 17C3 _ 75, 0A
        call    cmd_dir                                 ; 17C5 _ E8, FFFFFFFC(rel)
        jmp     ?_076                                   ; 17CA _ E9, 0000013D

?_073:  mov     eax, dword [ebp-20H]                    ; 17CF _ 8B. 45, E0
        movzx   eax, byte [eax]                         ; 17D2 _ 0F B6. 00
        cmp     al, 116                                 ; 17D5 _ 3C, 74
        jne     ?_076                                   ; 17D7 _ 0F 85, 0000012F
        mov     eax, dword [ebp-20H]                    ; 17DD _ 8B. 45, E0
        add     eax, 1                                  ; 17E0 _ 83. C0, 01
        movzx   eax, byte [eax]                         ; 17E3 _ 0F B6. 00
        cmp     al, 121                                 ; 17E6 _ 3C, 79
        jne     ?_076                                   ; 17E8 _ 0F 85, 0000011E
        mov     eax, dword [ebp-20H]                    ; 17EE _ 8B. 45, E0
        add     eax, 2                                  ; 17F1 _ 83. C0, 02
        movzx   eax, byte [eax]                         ; 17F4 _ 0F B6. 00
        cmp     al, 112                                 ; 17F7 _ 3C, 70
        jne     ?_076                                   ; 17F9 _ 0F 85, 0000010D
        mov     eax, dword [ebp-20H]                    ; 17FF _ 8B. 45, E0
        add     eax, 3                                  ; 1802 _ 83. C0, 03
        movzx   eax, byte [eax]                         ; 1805 _ 0F B6. 00
        cmp     al, 101                                 ; 1808 _ 3C, 65
        jne     ?_076                                   ; 180A _ 0F 85, 000000FC
        mov     eax, dword [ebp-20H]                    ; 1810 _ 8B. 45, E0
        mov     dword [esp], eax                        ; 1813 _ 89. 04 24
        call    cmd_type                                ; 1816 _ E8, FFFFFFFC(rel)
        jmp     ?_076                                   ; 181B _ E9, 000000EC

?_074:  cmp     dword [ebp-34H], 14                     ; 1820 _ 83. 7D, CC, 0E
        jnz     ?_075                                   ; 1824 _ 75, 79
        mov     eax, dword [?_328]                      ; 1826 _ A1, 0000000C(d)
        cmp     eax, 8                                  ; 182B _ 83. F8, 08
        jle     ?_075                                   ; 182E _ 7E, 6F
        mov     ecx, dword [?_329]                      ; 1830 _ 8B. 0D, 00000010(d)
        mov     edx, dword [?_328]                      ; 1836 _ 8B. 15, 0000000C(d)
        mov     eax, dword [shtctl]                     ; 183C _ A1, 00000264(d)
        mov     dword [esp+10H], 0                      ; 1841 _ C7. 44 24, 10, 00000000
        mov     dword [esp+0CH], ecx                    ; 1849 _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 184D _ 89. 54 24, 08
        mov     edx, dword [ebp+8H]                     ; 1851 _ 8B. 55, 08
        mov     dword [esp+4H], edx                     ; 1854 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1858 _ 89. 04 24
        call    set_cursor                              ; 185B _ E8, FFFFFFFC(rel)
        mov     eax, dword [?_328]                      ; 1860 _ A1, 0000000C(d)
        sub     eax, 8                                  ; 1865 _ 83. E8, 08
        mov     dword [?_328], eax                      ; 1868 _ A3, 0000000C(d)
        mov     ecx, dword [?_329]                      ; 186D _ 8B. 0D, 00000010(d)
        mov     edx, dword [?_328]                      ; 1873 _ 8B. 15, 0000000C(d)
        mov     eax, dword [shtctl]                     ; 1879 _ A1, 00000264(d)
        mov     dword [esp+10H], 0                      ; 187E _ C7. 44 24, 10, 00000000
        mov     dword [esp+0CH], ecx                    ; 1886 _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 188A _ 89. 54 24, 08
        mov     edx, dword [ebp+8H]                     ; 188E _ 8B. 55, 08
        mov     dword [esp+4H], edx                     ; 1891 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1895 _ 89. 04 24
        call    set_cursor                              ; 1898 _ E8, FFFFFFFC(rel)
        jmp     ?_076                                   ; 189D _ EB, 6D

?_075:  mov     eax, dword [ebp-34H]                    ; 189F _ 8B. 45, CC
        mov     dword [esp], eax                        ; 18A2 _ 89. 04 24
        call    transferScanCode                        ; 18A5 _ E8, FFFFFFFC(rel)
        mov     byte [ebp-35H], al                      ; 18AA _ 88. 45, CB
        mov     eax, dword [?_328]                      ; 18AD _ A1, 0000000C(d)
        cmp     eax, 239                                ; 18B2 _ 3D, 000000EF
        jg      ?_076                                   ; 18B7 _ 7F, 53
        cmp     byte [ebp-35H], 0                       ; 18B9 _ 80. 7D, CB, 00
        jz      ?_076                                   ; 18BD _ 74, 4D
        mov     eax, dword [?_328]                      ; 18BF _ A1, 0000000C(d)
        lea     edx, [eax+7H]                           ; 18C4 _ 8D. 50, 07
        test    eax, eax                                ; 18C7 _ 85. C0
        cmovs   eax, edx                                ; 18C9 _ 0F 48. C2
        sar     eax, 3                                  ; 18CC _ C1. F8, 03
        lea     edx, [eax-2H]                           ; 18CF _ 8D. 50, FE
        mov     eax, dword [ebp-20H]                    ; 18D2 _ 8B. 45, E0
        add     edx, eax                                ; 18D5 _ 01. C2
        movzx   eax, byte [ebp-35H]                     ; 18D7 _ 0F B6. 45, CB
        mov     byte [edx], al                          ; 18DB _ 88. 02
        mov     eax, dword [?_328]                      ; 18DD _ A1, 0000000C(d)
        lea     edx, [eax+7H]                           ; 18E2 _ 8D. 50, 07
        test    eax, eax                                ; 18E5 _ 85. C0
        cmovs   eax, edx                                ; 18E7 _ 0F 48. C2
        sar     eax, 3                                  ; 18EA _ C1. F8, 03
        lea     edx, [eax-1H]                           ; 18ED _ 8D. 50, FF
        mov     eax, dword [ebp-20H]                    ; 18F0 _ 8B. 45, E0
        add     eax, edx                                ; 18F3 _ 01. D0
        mov     byte [eax], 0                           ; 18F5 _ C6. 00, 00
        movsx   eax, byte [ebp-35H]                     ; 18F8 _ 0F BE. 45, CB
        mov     dword [esp+4H], 1                       ; 18FC _ C7. 44 24, 04, 00000001
        mov     dword [esp], eax                        ; 1904 _ 89. 04 24
        call    cons_putchar                            ; 1907 _ E8, FFFFFFFC(rel)
?_076:  cmp     dword [ebp-0CH], 0                      ; 190C _ 83. 7D, F4, 00
        js      ?_077                                   ; 1910 _ 78, 34
        mov     ecx, dword [?_329]                      ; 1912 _ 8B. 0D, 00000010(d)
        mov     edx, dword [?_328]                      ; 1918 _ 8B. 15, 0000000C(d)
        mov     eax, dword [shtctl]                     ; 191E _ A1, 00000264(d)
        mov     ebx, dword [ebp-0CH]                    ; 1923 _ 8B. 5D, F4
        mov     dword [esp+10H], ebx                    ; 1926 _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 192A _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 192E _ 89. 54 24, 08
        mov     edx, dword [ebp+8H]                     ; 1932 _ 8B. 55, 08
        mov     dword [esp+4H], edx                     ; 1935 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1939 _ 89. 04 24
        call    set_cursor                              ; 193C _ E8, FFFFFFFC(rel)
        jmp     ?_063                                   ; 1941 _ E9, FFFFFC30

?_077:  jmp     ?_063                                   ; 1946 _ E9, FFFFFC2B
; console_task End of function

cons_putstr:; Function begin
        push    ebp                                     ; 194B _ 55
        mov     ebp, esp                                ; 194C _ 89. E5
        sub     esp, 24                                 ; 194E _ 83. EC, 18
        jmp     ?_079                                   ; 1951 _ EB, 1D

?_078:  mov     eax, dword [ebp+8H]                     ; 1953 _ 8B. 45, 08
        movzx   eax, byte [eax]                         ; 1956 _ 0F B6. 00
        movsx   eax, al                                 ; 1959 _ 0F BE. C0
        mov     dword [esp+4H], 1                       ; 195C _ C7. 44 24, 04, 00000001
        mov     dword [esp], eax                        ; 1964 _ 89. 04 24
        call    cons_putchar                            ; 1967 _ E8, FFFFFFFC(rel)
        add     dword [ebp+8H], 1                       ; 196C _ 83. 45, 08, 01
?_079:  mov     eax, dword [ebp+8H]                     ; 1970 _ 8B. 45, 08
        movzx   eax, byte [eax]                         ; 1973 _ 0F B6. 00
        test    al, al                                  ; 1976 _ 84. C0
        jnz     ?_078                                   ; 1978 _ 75, D9
        nop                                             ; 197A _ 90
        leave                                           ; 197B _ C9
        ret                                             ; 197C _ C3
; cons_putstr End of function

kernel_api:; Function begin
        push    ebp                                     ; 197D _ 55
        mov     ebp, esp                                ; 197E _ 89. E5
        push    esi                                     ; 1980 _ 56
        push    ebx                                     ; 1981 _ 53
        sub     esp, 48                                 ; 1982 _ 83. EC, 30
        call    task_now                                ; 1985 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 198A _ 89. 45, F4
        lea     eax, [ebp+24H]                          ; 198D _ 8D. 45, 24
        add     eax, 4                                  ; 1990 _ 83. C0, 04
        mov     dword [ebp-10H], eax                    ; 1993 _ 89. 45, F0
        cmp     dword [ebp+1CH], 1                      ; 1996 _ 83. 7D, 1C, 01
        jnz     ?_080                                   ; 199A _ 75, 1B
        mov     eax, dword [ebp+24H]                    ; 199C _ 8B. 45, 24
        movsx   eax, al                                 ; 199F _ 0F BE. C0
        mov     dword [esp+4H], 1                       ; 19A2 _ C7. 44 24, 04, 00000001
        mov     dword [esp], eax                        ; 19AA _ 89. 04 24
        call    cons_putchar                            ; 19AD _ E8, FFFFFFFC(rel)
        jmp     ?_085                                   ; 19B2 _ E9, 0000021C

?_080:  cmp     dword [ebp+1CH], 2                      ; 19B7 _ 83. 7D, 1C, 02
        jnz     ?_081                                   ; 19BB _ 75, 18
        mov     edx, dword [buffer]                     ; 19BD _ 8B. 15, 00000278(d)
        mov     eax, dword [ebp+18H]                    ; 19C3 _ 8B. 45, 18
        add     eax, edx                                ; 19C6 _ 01. D0
        mov     dword [esp], eax                        ; 19C8 _ 89. 04 24
        call    cons_putstr                             ; 19CB _ E8, FFFFFFFC(rel)
        jmp     ?_085                                   ; 19D0 _ E9, 000001FE

?_081:  cmp     dword [ebp+1CH], 4                      ; 19D5 _ 83. 7D, 1C, 04
        jnz     ?_082                                   ; 19D9 _ 75, 28
        mov     eax, dword [ebp-0CH]                    ; 19DB _ 8B. 45, F4
        mov     dword [eax+34H], 0                      ; 19DE _ C7. 40, 34, 00000000
        mov     eax, dword [ebp-0CH]                    ; 19E5 _ 8B. 45, F4
        mov     eax, dword [eax+30H]                    ; 19E8 _ 8B. 40, 30
        mov     dword [esp], eax                        ; 19EB _ 89. 04 24
        call    intToHexStr                             ; 19EE _ E8, FFFFFFFC(rel)
        mov     dword [ebp-14H], eax                    ; 19F3 _ 89. 45, EC
        mov     eax, dword [task_cons]                  ; 19F6 _ A1, 00000270(d)
        add     eax, 48                                 ; 19FB _ 83. C0, 30
        jmp     ?_086                                   ; 19FE _ E9, 000001D5

?_082:  cmp     dword [ebp+1CH], 5                      ; 1A03 _ 83. 7D, 1C, 05
        jne     ?_083                                   ; 1A07 _ 0F 85, 000000BA
        mov     eax, dword [shtctl]                     ; 1A0D _ A1, 00000264(d)
        mov     dword [esp], eax                        ; 1A12 _ 89. 04 24
        call    sheet_alloc                             ; 1A15 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-18H], eax                    ; 1A1A _ 89. 45, E8
        mov     eax, dword [ebp+24H]                    ; 1A1D _ 8B. 45, 24
        mov     ecx, dword [?_337]                      ; 1A20 _ 8B. 0D, 0000027C(d)
        mov     edx, dword [ebp+18H]                    ; 1A26 _ 8B. 55, 18
        add     edx, ecx                                ; 1A29 _ 01. CA
        mov     dword [esp+10H], eax                    ; 1A2B _ 89. 44 24, 10
        mov     eax, dword [ebp+8H]                     ; 1A2F _ 8B. 45, 08
        mov     dword [esp+0CH], eax                    ; 1A32 _ 89. 44 24, 0C
        mov     eax, dword [ebp+0CH]                    ; 1A36 _ 8B. 45, 0C
        mov     dword [esp+8H], eax                     ; 1A39 _ 89. 44 24, 08
        mov     dword [esp+4H], edx                     ; 1A3D _ 89. 54 24, 04
        mov     eax, dword [ebp-18H]                    ; 1A41 _ 8B. 45, E8
        mov     dword [esp], eax                        ; 1A44 _ 89. 04 24
        call    sheet_setbuf                            ; 1A47 _ E8, FFFFFFFC(rel)
        mov     edx, dword [buffer]                     ; 1A4C _ 8B. 15, 00000278(d)
        mov     eax, dword [ebp+20H]                    ; 1A52 _ 8B. 45, 20
        add     edx, eax                                ; 1A55 _ 01. C2
        mov     eax, dword [shtctl]                     ; 1A57 _ A1, 00000264(d)
        mov     dword [esp+0CH], 0                      ; 1A5C _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], edx                     ; 1A64 _ 89. 54 24, 08
        mov     edx, dword [ebp-18H]                    ; 1A68 _ 8B. 55, E8
        mov     dword [esp+4H], edx                     ; 1A6B _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1A6F _ 89. 04 24
        call    make_window8                            ; 1A72 _ E8, FFFFFFFC(rel)
        mov     eax, dword [shtctl]                     ; 1A77 _ A1, 00000264(d)
        mov     dword [esp+0CH], 50                     ; 1A7C _ C7. 44 24, 0C, 00000032
        mov     dword [esp+8H], 100                     ; 1A84 _ C7. 44 24, 08, 00000064
        mov     edx, dword [ebp-18H]                    ; 1A8C _ 8B. 55, E8
        mov     dword [esp+4H], edx                     ; 1A8F _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1A93 _ 89. 04 24
        call    sheet_slide                             ; 1A96 _ E8, FFFFFFFC(rel)
        mov     eax, dword [shtctl]                     ; 1A9B _ A1, 00000264(d)
        mov     dword [esp+8H], 3                       ; 1AA0 _ C7. 44 24, 08, 00000003
        mov     edx, dword [ebp-18H]                    ; 1AA8 _ 8B. 55, E8
        mov     dword [esp+4H], edx                     ; 1AAB _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1AAF _ 89. 04 24
        call    sheet_updown                            ; 1AB2 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 1AB7 _ 8B. 45, F0
        lea     edx, [eax+1CH]                          ; 1ABA _ 8D. 50, 1C
        mov     eax, dword [ebp-18H]                    ; 1ABD _ 8B. 45, E8
        mov     dword [edx], eax                        ; 1AC0 _ 89. 02
        jmp     ?_085                                   ; 1AC2 _ E9, 0000010C

?_083:  cmp     dword [ebp+1CH], 6                      ; 1AC7 _ 83. 7D, 1C, 06
        jne     ?_084                                   ; 1ACB _ 0F 85, 00000083
        mov     eax, dword [ebp+18H]                    ; 1AD1 _ 8B. 45, 18
        mov     dword [ebp-18H], eax                    ; 1AD4 _ 89. 45, E8
        mov     edx, dword [buffer]                     ; 1AD7 _ 8B. 15, 00000278(d)
        mov     eax, dword [ebp+10H]                    ; 1ADD _ 8B. 45, 10
        lea     ecx, [edx+eax]                          ; 1AE0 _ 8D. 0C 02
        mov     eax, dword [ebp+24H]                    ; 1AE3 _ 8B. 45, 24
        movsx   edx, al                                 ; 1AE6 _ 0F BE. D0
        mov     eax, dword [shtctl]                     ; 1AE9 _ A1, 00000264(d)
        mov     dword [esp+14H], ecx                    ; 1AEE _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 1AF2 _ 89. 54 24, 10
        mov     edx, dword [ebp+8H]                     ; 1AF6 _ 8B. 55, 08
        mov     dword [esp+0CH], edx                    ; 1AF9 _ 89. 54 24, 0C
        mov     edx, dword [ebp+0CH]                    ; 1AFD _ 8B. 55, 0C
        mov     dword [esp+8H], edx                     ; 1B00 _ 89. 54 24, 08
        mov     edx, dword [ebp-18H]                    ; 1B04 _ 8B. 55, E8
        mov     dword [esp+4H], edx                     ; 1B07 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1B0B _ 89. 04 24
        call    showString                              ; 1B0E _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 1B13 _ 8B. 45, 08
        lea     ecx, [eax+10H]                          ; 1B16 _ 8D. 48, 10
        mov     eax, dword [ebp+20H]                    ; 1B19 _ 8B. 45, 20
        lea     edx, [eax*8]                            ; 1B1C _ 8D. 14 C5, 00000000
        mov     eax, dword [ebp+0CH]                    ; 1B23 _ 8B. 45, 0C
        add     edx, eax                                ; 1B26 _ 01. C2
        mov     eax, dword [shtctl]                     ; 1B28 _ A1, 00000264(d)
        mov     dword [esp+14H], ecx                    ; 1B2D _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 1B31 _ 89. 54 24, 10
        mov     edx, dword [ebp+8H]                     ; 1B35 _ 8B. 55, 08
        mov     dword [esp+0CH], edx                    ; 1B38 _ 89. 54 24, 0C
        mov     edx, dword [ebp+0CH]                    ; 1B3C _ 8B. 55, 0C
        mov     dword [esp+8H], edx                     ; 1B3F _ 89. 54 24, 08
        mov     edx, dword [ebp-18H]                    ; 1B43 _ 8B. 55, E8
        mov     dword [esp+4H], edx                     ; 1B46 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1B4A _ 89. 04 24
        call    sheet_refresh                           ; 1B4D _ E8, FFFFFFFC(rel)
        jmp     ?_085                                   ; 1B52 _ EB, 7F

?_084:  cmp     dword [ebp+1CH], 7                      ; 1B54 _ 83. 7D, 1C, 07
        jnz     ?_085                                   ; 1B58 _ 75, 79
        mov     eax, dword [ebp+18H]                    ; 1B5A _ 8B. 45, 18
        mov     dword [ebp-18H], eax                    ; 1B5D _ 89. 45, E8
        mov     ebx, dword [ebp+24H]                    ; 1B60 _ 8B. 5D, 24
        mov     eax, dword [ebp+10H]                    ; 1B63 _ 8B. 45, 10
        movzx   ecx, al                                 ; 1B66 _ 0F B6. C8
        mov     eax, dword [ebp-18H]                    ; 1B69 _ 8B. 45, E8
        mov     edx, dword [eax+4H]                     ; 1B6C _ 8B. 50, 04
        mov     eax, dword [ebp-18H]                    ; 1B6F _ 8B. 45, E8
        mov     eax, dword [eax]                        ; 1B72 _ 8B. 00
        mov     esi, dword [ebp+8H]                     ; 1B74 _ 8B. 75, 08
        mov     dword [esp+18H], esi                    ; 1B77 _ 89. 74 24, 18
        mov     esi, dword [ebp+0CH]                    ; 1B7B _ 8B. 75, 0C
        mov     dword [esp+14H], esi                    ; 1B7E _ 89. 74 24, 14
        mov     esi, dword [ebp+20H]                    ; 1B82 _ 8B. 75, 20
        mov     dword [esp+10H], esi                    ; 1B85 _ 89. 74 24, 10
        mov     dword [esp+0CH], ebx                    ; 1B89 _ 89. 5C 24, 0C
        mov     dword [esp+8H], ecx                     ; 1B8D _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 1B91 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1B95 _ 89. 04 24
        call    boxfill8                                ; 1B98 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 1B9D _ 8B. 45, 08
        lea     ebx, [eax+1H]                           ; 1BA0 _ 8D. 58, 01
        mov     eax, dword [ebp+0CH]                    ; 1BA3 _ 8B. 45, 0C
        lea     ecx, [eax+1H]                           ; 1BA6 _ 8D. 48, 01
        mov     edx, dword [ebp+24H]                    ; 1BA9 _ 8B. 55, 24
        mov     eax, dword [shtctl]                     ; 1BAC _ A1, 00000264(d)
        mov     dword [esp+14H], ebx                    ; 1BB1 _ 89. 5C 24, 14
        mov     dword [esp+10H], ecx                    ; 1BB5 _ 89. 4C 24, 10
        mov     ecx, dword [ebp+20H]                    ; 1BB9 _ 8B. 4D, 20
        mov     dword [esp+0CH], ecx                    ; 1BBC _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 1BC0 _ 89. 54 24, 08
        mov     edx, dword [ebp-18H]                    ; 1BC4 _ 8B. 55, E8
        mov     dword [esp+4H], edx                     ; 1BC7 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1BCB _ 89. 04 24
        call    sheet_refresh                           ; 1BCE _ E8, FFFFFFFC(rel)
?_085:  mov     eax, 0                                  ; 1BD3 _ B8, 00000000
?_086:  add     esp, 48                                 ; 1BD8 _ 83. C4, 30
        pop     ebx                                     ; 1BDB _ 5B
        pop     esi                                     ; 1BDC _ 5E
        pop     ebp                                     ; 1BDD _ 5D
        ret                                             ; 1BDE _ C3
; kernel_api End of function

cons_putchar:; Function begin
        push    ebp                                     ; 1BDF _ 55
        mov     ebp, esp                                ; 1BE0 _ 89. E5
        push    ebx                                     ; 1BE2 _ 53
        sub     esp, 36                                 ; 1BE3 _ 83. EC, 24
        mov     edx, dword [ebp+8H]                     ; 1BE6 _ 8B. 55, 08
        mov     eax, dword [ebp+0CH]                    ; 1BE9 _ 8B. 45, 0C
        mov     byte [ebp-0CH], dl                      ; 1BEC _ 88. 55, F4
        mov     byte [ebp-10H], al                      ; 1BEF _ 88. 45, F0
        mov     ebx, dword [?_329]                      ; 1BF2 _ 8B. 1D, 00000010(d)
        mov     ecx, dword [?_328]                      ; 1BF8 _ 8B. 0D, 0000000C(d)
        mov     edx, dword [g_Console]                  ; 1BFE _ 8B. 15, 00000008(d)
        mov     eax, dword [shtctl]                     ; 1C04 _ A1, 00000264(d)
        mov     dword [esp+10H], 0                      ; 1C09 _ C7. 44 24, 10, 00000000
        mov     dword [esp+0CH], ebx                    ; 1C11 _ 89. 5C 24, 0C
        mov     dword [esp+8H], ecx                     ; 1C15 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 1C19 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1C1D _ 89. 04 24
        call    set_cursor                              ; 1C20 _ E8, FFFFFFFC(rel)
        movzx   eax, byte [ebp-0CH]                     ; 1C25 _ 0F B6. 45, F4
        mov     byte [?_331], al                        ; 1C29 _ A2, 00000018(d)
        mov     byte [?_332], 0                         ; 1C2E _ C6. 05, 00000019(d), 00
        mov     ebx, dword [?_329]                      ; 1C35 _ 8B. 1D, 00000010(d)
        mov     ecx, dword [?_328]                      ; 1C3B _ 8B. 0D, 0000000C(d)
        mov     edx, dword [g_Console]                  ; 1C41 _ 8B. 15, 00000008(d)
        mov     eax, dword [shtctl]                     ; 1C47 _ A1, 00000264(d)
        mov     dword [esp+14H], ?_331                  ; 1C4C _ C7. 44 24, 14, 00000018(d)
        mov     dword [esp+10H], 7                      ; 1C54 _ C7. 44 24, 10, 00000007
        mov     dword [esp+0CH], ebx                    ; 1C5C _ 89. 5C 24, 0C
        mov     dword [esp+8H], ecx                     ; 1C60 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 1C64 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1C68 _ 89. 04 24
        call    showString                              ; 1C6B _ E8, FFFFFFFC(rel)
        mov     eax, dword [?_328]                      ; 1C70 _ A1, 0000000C(d)
        add     eax, 8                                  ; 1C75 _ 83. C0, 08
        mov     dword [?_328], eax                      ; 1C78 _ A3, 0000000C(d)
        add     esp, 36                                 ; 1C7D _ 83. C4, 24
        pop     ebx                                     ; 1C80 _ 5B
        pop     ebp                                     ; 1C81 _ 5D
        ret                                             ; 1C82 _ C3
; cons_putchar End of function

cons_newline:; Function begin
        push    ebp                                     ; 1C83 _ 55
        mov     ebp, esp                                ; 1C84 _ 89. E5
        push    ebx                                     ; 1C86 _ 53
        sub     esp, 52                                 ; 1C87 _ 83. EC, 34
        cmp     dword [ebp+8H], 139                     ; 1C8A _ 81. 7D, 08, 0000008B
        jg      ?_087                                   ; 1C91 _ 7F, 09
        add     dword [ebp+8H], 16                      ; 1C93 _ 83. 45, 08, 10
        jmp     ?_096                                   ; 1C97 _ E9, 000000DF

?_087:  mov     dword [ebp-10H], 28                     ; 1C9C _ C7. 45, F0, 0000001C
        jmp     ?_091                                   ; 1CA3 _ EB, 52

?_088:  mov     dword [ebp-0CH], 8                      ; 1CA5 _ C7. 45, F4, 00000008
        jmp     ?_090                                   ; 1CAC _ EB, 3C

?_089:  mov     eax, dword [ebp+0CH]                    ; 1CAE _ 8B. 45, 0C
        mov     edx, dword [eax]                        ; 1CB1 _ 8B. 10
        mov     eax, dword [ebp+0CH]                    ; 1CB3 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 1CB6 _ 8B. 40, 04
        imul    eax, dword [ebp-10H]                    ; 1CB9 _ 0F AF. 45, F0
        mov     ecx, eax                                ; 1CBD _ 89. C1
        mov     eax, dword [ebp-0CH]                    ; 1CBF _ 8B. 45, F4
        add     eax, ecx                                ; 1CC2 _ 01. C8
        add     edx, eax                                ; 1CC4 _ 01. C2
        mov     eax, dword [ebp+0CH]                    ; 1CC6 _ 8B. 45, 0C
        mov     ecx, dword [eax]                        ; 1CC9 _ 8B. 08
        mov     eax, dword [ebp-10H]                    ; 1CCB _ 8B. 45, F0
        lea     ebx, [eax+10H]                          ; 1CCE _ 8D. 58, 10
        mov     eax, dword [ebp+0CH]                    ; 1CD1 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 1CD4 _ 8B. 40, 04
        imul    ebx, eax                                ; 1CD7 _ 0F AF. D8
        mov     eax, dword [ebp-0CH]                    ; 1CDA _ 8B. 45, F4
        add     eax, ebx                                ; 1CDD _ 01. D8
        add     eax, ecx                                ; 1CDF _ 01. C8
        movzx   eax, byte [eax]                         ; 1CE1 _ 0F B6. 00
        mov     byte [edx], al                          ; 1CE4 _ 88. 02
        add     dword [ebp-0CH], 1                      ; 1CE6 _ 83. 45, F4, 01
?_090:  cmp     dword [ebp-0CH], 247                    ; 1CEA _ 81. 7D, F4, 000000F7
        jle     ?_089                                   ; 1CF1 _ 7E, BB
        add     dword [ebp-10H], 1                      ; 1CF3 _ 83. 45, F0, 01
?_091:  cmp     dword [ebp-10H], 139                    ; 1CF7 _ 81. 7D, F0, 0000008B
        jle     ?_088                                   ; 1CFE _ 7E, A5
        mov     dword [ebp-10H], 140                    ; 1D00 _ C7. 45, F0, 0000008C
        jmp     ?_095                                   ; 1D07 _ EB, 35

?_092:  mov     dword [ebp-0CH], 8                      ; 1D09 _ C7. 45, F4, 00000008
        jmp     ?_094                                   ; 1D10 _ EB, 1F

?_093:  mov     eax, dword [ebp+0CH]                    ; 1D12 _ 8B. 45, 0C
        mov     edx, dword [eax]                        ; 1D15 _ 8B. 10
        mov     eax, dword [ebp+0CH]                    ; 1D17 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 1D1A _ 8B. 40, 04
        imul    eax, dword [ebp-10H]                    ; 1D1D _ 0F AF. 45, F0
        mov     ecx, eax                                ; 1D21 _ 89. C1
        mov     eax, dword [ebp-0CH]                    ; 1D23 _ 8B. 45, F4
        add     eax, ecx                                ; 1D26 _ 01. C8
        add     eax, edx                                ; 1D28 _ 01. D0
        mov     byte [eax], 0                           ; 1D2A _ C6. 00, 00
        add     dword [ebp-0CH], 1                      ; 1D2D _ 83. 45, F4, 01
?_094:  cmp     dword [ebp-0CH], 247                    ; 1D31 _ 81. 7D, F4, 000000F7
        jle     ?_093                                   ; 1D38 _ 7E, D8
        add     dword [ebp-10H], 1                      ; 1D3A _ 83. 45, F0, 01
?_095:  cmp     dword [ebp-10H], 155                    ; 1D3E _ 81. 7D, F0, 0000009B
        jle     ?_092                                   ; 1D45 _ 7E, C2
        mov     eax, dword [shtctl]                     ; 1D47 _ A1, 00000264(d)
        mov     dword [esp+14H], 156                    ; 1D4C _ C7. 44 24, 14, 0000009C
        mov     dword [esp+10H], 248                    ; 1D54 _ C7. 44 24, 10, 000000F8
        mov     dword [esp+0CH], 28                     ; 1D5C _ C7. 44 24, 0C, 0000001C
        mov     dword [esp+8H], 8                       ; 1D64 _ C7. 44 24, 08, 00000008
        mov     edx, dword [ebp+0CH]                    ; 1D6C _ 8B. 55, 0C
        mov     dword [esp+4H], edx                     ; 1D6F _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1D73 _ 89. 04 24
        call    sheet_refresh                           ; 1D76 _ E8, FFFFFFFC(rel)
?_096:  mov     eax, dword [shtctl]                     ; 1D7B _ A1, 00000264(d)
        mov     dword [esp+14H], ?_311                  ; 1D80 _ C7. 44 24, 14, 00000030(d)
        mov     dword [esp+10H], 7                      ; 1D88 _ C7. 44 24, 10, 00000007
        mov     edx, dword [ebp+8H]                     ; 1D90 _ 8B. 55, 08
        mov     dword [esp+0CH], edx                    ; 1D93 _ 89. 54 24, 0C
        mov     dword [esp+8H], 8                       ; 1D97 _ C7. 44 24, 08, 00000008
        mov     edx, dword [ebp+0CH]                    ; 1D9F _ 8B. 55, 0C
        mov     dword [esp+4H], edx                     ; 1DA2 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1DA6 _ 89. 04 24
        call    showString                              ; 1DA9 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 1DAE _ 8B. 45, 08
        add     esp, 52                                 ; 1DB1 _ 83. C4, 34
        pop     ebx                                     ; 1DB4 _ 5B
        pop     ebp                                     ; 1DB5 _ 5D
        ret                                             ; 1DB6 _ C3
; cons_newline End of function

init_screen8:; Function begin
        push    ebp                                     ; 1DB7 _ 55
        mov     ebp, esp                                ; 1DB8 _ 89. E5
        push    ebx                                     ; 1DBA _ 53
        sub     esp, 36                                 ; 1DBB _ 83. EC, 24
        mov     eax, dword [ebp+10H]                    ; 1DBE _ 8B. 45, 10
        lea     edx, [eax-1DH]                          ; 1DC1 _ 8D. 50, E3
        mov     eax, dword [ebp+0CH]                    ; 1DC4 _ 8B. 45, 0C
        sub     eax, 1                                  ; 1DC7 _ 83. E8, 01
        mov     dword [esp+18H], edx                    ; 1DCA _ 89. 54 24, 18
        mov     dword [esp+14H], eax                    ; 1DCE _ 89. 44 24, 14
        mov     dword [esp+10H], 0                      ; 1DD2 _ C7. 44 24, 10, 00000000
        mov     dword [esp+0CH], 0                      ; 1DDA _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 2                       ; 1DE2 _ C7. 44 24, 08, 00000002
        mov     eax, dword [ebp+0CH]                    ; 1DEA _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 1DED _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1DF1 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1DF4 _ 89. 04 24
        call    boxfill8                                ; 1DF7 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 1DFC _ 8B. 45, 10
        lea     ecx, [eax-1CH]                          ; 1DFF _ 8D. 48, E4
        mov     eax, dword [ebp+0CH]                    ; 1E02 _ 8B. 45, 0C
        lea     edx, [eax-1H]                           ; 1E05 _ 8D. 50, FF
        mov     eax, dword [ebp+10H]                    ; 1E08 _ 8B. 45, 10
        sub     eax, 28                                 ; 1E0B _ 83. E8, 1C
        mov     dword [esp+18H], ecx                    ; 1E0E _ 89. 4C 24, 18
        mov     dword [esp+14H], edx                    ; 1E12 _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 1E16 _ 89. 44 24, 10
        mov     dword [esp+0CH], 0                      ; 1E1A _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 8                       ; 1E22 _ C7. 44 24, 08, 00000008
        mov     eax, dword [ebp+0CH]                    ; 1E2A _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 1E2D _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1E31 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1E34 _ 89. 04 24
        call    boxfill8                                ; 1E37 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 1E3C _ 8B. 45, 10
        lea     ecx, [eax-1BH]                          ; 1E3F _ 8D. 48, E5
        mov     eax, dword [ebp+0CH]                    ; 1E42 _ 8B. 45, 0C
        lea     edx, [eax-1H]                           ; 1E45 _ 8D. 50, FF
        mov     eax, dword [ebp+10H]                    ; 1E48 _ 8B. 45, 10
        sub     eax, 27                                 ; 1E4B _ 83. E8, 1B
        mov     dword [esp+18H], ecx                    ; 1E4E _ 89. 4C 24, 18
        mov     dword [esp+14H], edx                    ; 1E52 _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 1E56 _ 89. 44 24, 10
        mov     dword [esp+0CH], 0                      ; 1E5A _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 7                       ; 1E62 _ C7. 44 24, 08, 00000007
        mov     eax, dword [ebp+0CH]                    ; 1E6A _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 1E6D _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1E71 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1E74 _ 89. 04 24
        call    boxfill8                                ; 1E77 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 1E7C _ 8B. 45, 10
        lea     ecx, [eax-1H]                           ; 1E7F _ 8D. 48, FF
        mov     eax, dword [ebp+0CH]                    ; 1E82 _ 8B. 45, 0C
        lea     edx, [eax-1H]                           ; 1E85 _ 8D. 50, FF
        mov     eax, dword [ebp+10H]                    ; 1E88 _ 8B. 45, 10
        sub     eax, 26                                 ; 1E8B _ 83. E8, 1A
        mov     dword [esp+18H], ecx                    ; 1E8E _ 89. 4C 24, 18
        mov     dword [esp+14H], edx                    ; 1E92 _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 1E96 _ 89. 44 24, 10
        mov     dword [esp+0CH], 0                      ; 1E9A _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 8                       ; 1EA2 _ C7. 44 24, 08, 00000008
        mov     eax, dword [ebp+0CH]                    ; 1EAA _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 1EAD _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1EB1 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1EB4 _ 89. 04 24
        call    boxfill8                                ; 1EB7 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 1EBC _ 8B. 45, 10
        lea     edx, [eax-18H]                          ; 1EBF _ 8D. 50, E8
        mov     eax, dword [ebp+10H]                    ; 1EC2 _ 8B. 45, 10
        sub     eax, 24                                 ; 1EC5 _ 83. E8, 18
        mov     dword [esp+18H], edx                    ; 1EC8 _ 89. 54 24, 18
        mov     dword [esp+14H], 59                     ; 1ECC _ C7. 44 24, 14, 0000003B
        mov     dword [esp+10H], eax                    ; 1ED4 _ 89. 44 24, 10
        mov     dword [esp+0CH], 3                      ; 1ED8 _ C7. 44 24, 0C, 00000003
        mov     dword [esp+8H], 7                       ; 1EE0 _ C7. 44 24, 08, 00000007
        mov     eax, dword [ebp+0CH]                    ; 1EE8 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 1EEB _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1EEF _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1EF2 _ 89. 04 24
        call    boxfill8                                ; 1EF5 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 1EFA _ 8B. 45, 10
        lea     edx, [eax-4H]                           ; 1EFD _ 8D. 50, FC
        mov     eax, dword [ebp+10H]                    ; 1F00 _ 8B. 45, 10
        sub     eax, 24                                 ; 1F03 _ 83. E8, 18
        mov     dword [esp+18H], edx                    ; 1F06 _ 89. 54 24, 18
        mov     dword [esp+14H], 2                      ; 1F0A _ C7. 44 24, 14, 00000002
        mov     dword [esp+10H], eax                    ; 1F12 _ 89. 44 24, 10
        mov     dword [esp+0CH], 2                      ; 1F16 _ C7. 44 24, 0C, 00000002
        mov     dword [esp+8H], 7                       ; 1F1E _ C7. 44 24, 08, 00000007
        mov     eax, dword [ebp+0CH]                    ; 1F26 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 1F29 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1F2D _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1F30 _ 89. 04 24
        call    boxfill8                                ; 1F33 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 1F38 _ 8B. 45, 10
        lea     edx, [eax-4H]                           ; 1F3B _ 8D. 50, FC
        mov     eax, dword [ebp+10H]                    ; 1F3E _ 8B. 45, 10
        sub     eax, 4                                  ; 1F41 _ 83. E8, 04
        mov     dword [esp+18H], edx                    ; 1F44 _ 89. 54 24, 18
        mov     dword [esp+14H], 59                     ; 1F48 _ C7. 44 24, 14, 0000003B
        mov     dword [esp+10H], eax                    ; 1F50 _ 89. 44 24, 10
        mov     dword [esp+0CH], 3                      ; 1F54 _ C7. 44 24, 0C, 00000003
        mov     dword [esp+8H], 2                       ; 1F5C _ C7. 44 24, 08, 00000002
        mov     eax, dword [ebp+0CH]                    ; 1F64 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 1F67 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1F6B _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1F6E _ 89. 04 24
        call    boxfill8                                ; 1F71 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 1F76 _ 8B. 45, 10
        lea     edx, [eax-5H]                           ; 1F79 _ 8D. 50, FB
        mov     eax, dword [ebp+10H]                    ; 1F7C _ 8B. 45, 10
        sub     eax, 23                                 ; 1F7F _ 83. E8, 17
        mov     dword [esp+18H], edx                    ; 1F82 _ 89. 54 24, 18
        mov     dword [esp+14H], 59                     ; 1F86 _ C7. 44 24, 14, 0000003B
        mov     dword [esp+10H], eax                    ; 1F8E _ 89. 44 24, 10
        mov     dword [esp+0CH], 59                     ; 1F92 _ C7. 44 24, 0C, 0000003B
        mov     dword [esp+8H], 2                       ; 1F9A _ C7. 44 24, 08, 00000002
        mov     eax, dword [ebp+0CH]                    ; 1FA2 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 1FA5 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1FA9 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1FAC _ 89. 04 24
        call    boxfill8                                ; 1FAF _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 1FB4 _ 8B. 45, 10
        lea     edx, [eax-3H]                           ; 1FB7 _ 8D. 50, FD
        mov     eax, dword [ebp+10H]                    ; 1FBA _ 8B. 45, 10
        sub     eax, 3                                  ; 1FBD _ 83. E8, 03
        mov     dword [esp+18H], edx                    ; 1FC0 _ 89. 54 24, 18
        mov     dword [esp+14H], 59                     ; 1FC4 _ C7. 44 24, 14, 0000003B
        mov     dword [esp+10H], eax                    ; 1FCC _ 89. 44 24, 10
        mov     dword [esp+0CH], 2                      ; 1FD0 _ C7. 44 24, 0C, 00000002
        mov     dword [esp+8H], 0                       ; 1FD8 _ C7. 44 24, 08, 00000000
        mov     eax, dword [ebp+0CH]                    ; 1FE0 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 1FE3 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1FE7 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1FEA _ 89. 04 24
        call    boxfill8                                ; 1FED _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 1FF2 _ 8B. 45, 10
        lea     edx, [eax-3H]                           ; 1FF5 _ 8D. 50, FD
        mov     eax, dword [ebp+10H]                    ; 1FF8 _ 8B. 45, 10
        sub     eax, 24                                 ; 1FFB _ 83. E8, 18
        mov     dword [esp+18H], edx                    ; 1FFE _ 89. 54 24, 18
        mov     dword [esp+14H], 60                     ; 2002 _ C7. 44 24, 14, 0000003C
        mov     dword [esp+10H], eax                    ; 200A _ 89. 44 24, 10
        mov     dword [esp+0CH], 60                     ; 200E _ C7. 44 24, 0C, 0000003C
        mov     dword [esp+8H], 0                       ; 2016 _ C7. 44 24, 08, 00000000
        mov     eax, dword [ebp+0CH]                    ; 201E _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 2021 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2025 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2028 _ 89. 04 24
        call    boxfill8                                ; 202B _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 2030 _ 8B. 45, 10
        lea     ebx, [eax-18H]                          ; 2033 _ 8D. 58, E8
        mov     eax, dword [ebp+0CH]                    ; 2036 _ 8B. 45, 0C
        lea     ecx, [eax-4H]                           ; 2039 _ 8D. 48, FC
        mov     eax, dword [ebp+10H]                    ; 203C _ 8B. 45, 10
        lea     edx, [eax-18H]                          ; 203F _ 8D. 50, E8
        mov     eax, dword [ebp+0CH]                    ; 2042 _ 8B. 45, 0C
        sub     eax, 47                                 ; 2045 _ 83. E8, 2F
        mov     dword [esp+18H], ebx                    ; 2048 _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 204C _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 2050 _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 2054 _ 89. 44 24, 0C
        mov     dword [esp+8H], 2                       ; 2058 _ C7. 44 24, 08, 00000002
        mov     eax, dword [ebp+0CH]                    ; 2060 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 2063 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2067 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 206A _ 89. 04 24
        call    boxfill8                                ; 206D _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 2072 _ 8B. 45, 10
        lea     ebx, [eax-4H]                           ; 2075 _ 8D. 58, FC
        mov     eax, dword [ebp+0CH]                    ; 2078 _ 8B. 45, 0C
        lea     ecx, [eax-2FH]                          ; 207B _ 8D. 48, D1
        mov     eax, dword [ebp+10H]                    ; 207E _ 8B. 45, 10
        lea     edx, [eax-17H]                          ; 2081 _ 8D. 50, E9
        mov     eax, dword [ebp+0CH]                    ; 2084 _ 8B. 45, 0C
        sub     eax, 47                                 ; 2087 _ 83. E8, 2F
        mov     dword [esp+18H], ebx                    ; 208A _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 208E _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 2092 _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 2096 _ 89. 44 24, 0C
        mov     dword [esp+8H], 2                       ; 209A _ C7. 44 24, 08, 00000002
        mov     eax, dword [ebp+0CH]                    ; 20A2 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 20A5 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 20A9 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 20AC _ 89. 04 24
        call    boxfill8                                ; 20AF _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 20B4 _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 20B7 _ 8D. 58, FD
        mov     eax, dword [ebp+0CH]                    ; 20BA _ 8B. 45, 0C
        lea     ecx, [eax-4H]                           ; 20BD _ 8D. 48, FC
        mov     eax, dword [ebp+10H]                    ; 20C0 _ 8B. 45, 10
        lea     edx, [eax-3H]                           ; 20C3 _ 8D. 50, FD
        mov     eax, dword [ebp+0CH]                    ; 20C6 _ 8B. 45, 0C
        sub     eax, 47                                 ; 20C9 _ 83. E8, 2F
        mov     dword [esp+18H], ebx                    ; 20CC _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 20D0 _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 20D4 _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 20D8 _ 89. 44 24, 0C
        mov     dword [esp+8H], 7                       ; 20DC _ C7. 44 24, 08, 00000007
        mov     eax, dword [ebp+0CH]                    ; 20E4 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 20E7 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 20EB _ 8B. 45, 08
        mov     dword [esp], eax                        ; 20EE _ 89. 04 24
        call    boxfill8                                ; 20F1 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 20F6 _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 20F9 _ 8D. 58, FD
        mov     eax, dword [ebp+0CH]                    ; 20FC _ 8B. 45, 0C
        lea     ecx, [eax-3H]                           ; 20FF _ 8D. 48, FD
        mov     eax, dword [ebp+10H]                    ; 2102 _ 8B. 45, 10
        lea     edx, [eax-18H]                          ; 2105 _ 8D. 50, E8
        mov     eax, dword [ebp+0CH]                    ; 2108 _ 8B. 45, 0C
        sub     eax, 3                                  ; 210B _ 83. E8, 03
        mov     dword [esp+18H], ebx                    ; 210E _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 2112 _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 2116 _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 211A _ 89. 44 24, 0C
        mov     dword [esp+8H], 7                       ; 211E _ C7. 44 24, 08, 00000007
        mov     eax, dword [ebp+0CH]                    ; 2126 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 2129 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 212D _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2130 _ 89. 04 24
        call    boxfill8                                ; 2133 _ E8, FFFFFFFC(rel)
        add     esp, 36                                 ; 2138 _ 83. C4, 24
        pop     ebx                                     ; 213B _ 5B
        pop     ebp                                     ; 213C _ 5D
        ret                                             ; 213D _ C3
; init_screen8 End of function

computeMousePosition:; Function begin
        push    ebp                                     ; 213E _ 55
        mov     ebp, esp                                ; 213F _ 89. E5
        mov     eax, dword [ebp+10H]                    ; 2141 _ 8B. 45, 10
        mov     edx, dword [eax+4H]                     ; 2144 _ 8B. 50, 04
        mov     eax, dword [mx]                         ; 2147 _ A1, 00000134(d)
        add     eax, edx                                ; 214C _ 01. D0
        mov     dword [mx], eax                         ; 214E _ A3, 00000134(d)
        mov     eax, dword [ebp+10H]                    ; 2153 _ 8B. 45, 10
        mov     edx, dword [eax+8H]                     ; 2156 _ 8B. 50, 08
        mov     eax, dword [my]                         ; 2159 _ A1, 00000138(d)
        add     eax, edx                                ; 215E _ 01. D0
        mov     dword [my], eax                         ; 2160 _ A3, 00000138(d)
        mov     eax, dword [mx]                         ; 2165 _ A1, 00000134(d)
        test    eax, eax                                ; 216A _ 85. C0
        jns     ?_097                                   ; 216C _ 79, 0A
        mov     dword [mx], 0                           ; 216E _ C7. 05, 00000134(d), 00000000
?_097:  mov     eax, dword [my]                         ; 2178 _ A1, 00000138(d)
        test    eax, eax                                ; 217D _ 85. C0
        jns     ?_098                                   ; 217F _ 79, 0A
        mov     dword [my], 0                           ; 2181 _ C7. 05, 00000138(d), 00000000
?_098:  mov     eax, dword [xsize]                      ; 218B _ A1, 0000013C(d)
        lea     edx, [eax-1H]                           ; 2190 _ 8D. 50, FF
        mov     eax, dword [mx]                         ; 2193 _ A1, 00000134(d)
        cmp     edx, eax                                ; 2198 _ 39. C2
        jge     ?_099                                   ; 219A _ 7D, 0D
        mov     eax, dword [xsize]                      ; 219C _ A1, 0000013C(d)
        sub     eax, 1                                  ; 21A1 _ 83. E8, 01
        mov     dword [mx], eax                         ; 21A4 _ A3, 00000134(d)
?_099:  mov     eax, dword [ysize]                      ; 21A9 _ A1, 00000140(d)
        lea     edx, [eax-1H]                           ; 21AE _ 8D. 50, FF
        mov     eax, dword [my]                         ; 21B1 _ A1, 00000138(d)
        cmp     edx, eax                                ; 21B6 _ 39. C2
        jge     ?_100                                   ; 21B8 _ 7D, 0D
        mov     eax, dword [ysize]                      ; 21BA _ A1, 00000140(d)
        sub     eax, 1                                  ; 21BF _ 83. E8, 01
        mov     dword [my], eax                         ; 21C2 _ A3, 00000138(d)
?_100:  pop     ebp                                     ; 21C7 _ 5D
        ret                                             ; 21C8 _ C3
; computeMousePosition End of function

show_mouse_info:; Function begin
        push    ebp                                     ; 21C9 _ 55
        mov     ebp, esp                                ; 21CA _ 89. E5
        sub     esp, 40                                 ; 21CC _ 83. EC, 28
        mov     eax, dword [buf_back]                   ; 21CF _ A1, 00000144(d)
        mov     dword [ebp-0CH], eax                    ; 21D4 _ 89. 45, F4
        mov     byte [ebp-0DH], 0                       ; 21D7 _ C6. 45, F3, 00
        call    io_sti                                  ; 21DB _ E8, FFFFFFFC(rel)
        mov     dword [esp], mouseinfo                  ; 21E0 _ C7. 04 24, 00000040(d)
        call    fifo8_get                               ; 21E7 _ E8, FFFFFFFC(rel)
        mov     byte [ebp-0DH], al                      ; 21EC _ 88. 45, F3
        movzx   eax, byte [ebp-0DH]                     ; 21EF _ 0F B6. 45, F3
        mov     dword [esp+4H], eax                     ; 21F3 _ 89. 44 24, 04
        mov     dword [esp], mdec                       ; 21F7 _ C7. 04 24, 00000100(d)
        call    mouse_decode                            ; 21FE _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 2203 _ 85. C0
        jz      ?_101                                   ; 2205 _ 74, 77
        mov     dword [esp+8H], mdec                    ; 2207 _ C7. 44 24, 08, 00000100(d)
        mov     eax, dword [ebp+0CH]                    ; 220F _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 2212 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2216 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2219 _ 89. 04 24
        call    computeMousePosition                    ; 221C _ E8, FFFFFFFC(rel)
        mov     edx, dword [my]                         ; 2221 _ 8B. 15, 00000138(d)
        mov     eax, dword [mx]                         ; 2227 _ A1, 00000134(d)
        mov     dword [esp+0CH], edx                    ; 222C _ 89. 54 24, 0C
        mov     dword [esp+8H], eax                     ; 2230 _ 89. 44 24, 08
        mov     eax, dword [ebp+10H]                    ; 2234 _ 8B. 45, 10
        mov     dword [esp+4H], eax                     ; 2237 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 223B _ 8B. 45, 08
        mov     dword [esp], eax                        ; 223E _ 89. 04 24
        call    sheet_slide                             ; 2241 _ E8, FFFFFFFC(rel)
        mov     eax, dword [?_336]                      ; 2246 _ A1, 0000010C(d)
        and     eax, 01H                                ; 224B _ 83. E0, 01
        test    eax, eax                                ; 224E _ 85. C0
        jz      ?_101                                   ; 2250 _ 74, 2C
        mov     eax, dword [my]                         ; 2252 _ A1, 00000138(d)
        lea     ecx, [eax-8H]                           ; 2257 _ 8D. 48, F8
        mov     eax, dword [mx]                         ; 225A _ A1, 00000134(d)
        lea     edx, [eax-50H]                          ; 225F _ 8D. 50, B0
        mov     eax, dword [shtMsgBox]                  ; 2262 _ A1, 00000260(d)
        mov     dword [esp+0CH], ecx                    ; 2267 _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 226B _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 226F _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2273 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2276 _ 89. 04 24
        call    sheet_slide                             ; 2279 _ E8, FFFFFFFC(rel)
?_101:  leave                                           ; 227E _ C9
        ret                                             ; 227F _ C3
; show_mouse_info End of function

initBootInfo:; Function begin
        push    ebp                                     ; 2280 _ 55
        mov     ebp, esp                                ; 2281 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 2283 _ 8B. 45, 08
        mov     dword [eax], -536870912                 ; 2286 _ C7. 00, E0000000
        mov     eax, dword [ebp+8H]                     ; 228C _ 8B. 45, 08
; Note: Length-changing prefix causes delay on Intel processors
        mov     word [eax+4H], 640                      ; 228F _ 66: C7. 40, 04, 0280
        mov     eax, dword [ebp+8H]                     ; 2295 _ 8B. 45, 08
; Note: Length-changing prefix causes delay on Intel processors
        mov     word [eax+6H], 480                      ; 2298 _ 66: C7. 40, 06, 01E0
        pop     ebp                                     ; 229E _ 5D
        ret                                             ; 229F _ C3
; initBootInfo End of function

showString:; Function begin
        push    ebp                                     ; 22A0 _ 55
        mov     ebp, esp                                ; 22A1 _ 89. E5
        push    ebx                                     ; 22A3 _ 53
        sub     esp, 52                                 ; 22A4 _ 83. EC, 34
        mov     eax, dword [ebp+18H]                    ; 22A7 _ 8B. 45, 18
        mov     byte [ebp-1CH], al                      ; 22AA _ 88. 45, E4
        mov     eax, dword [ebp+10H]                    ; 22AD _ 8B. 45, 10
        mov     dword [ebp-0CH], eax                    ; 22B0 _ 89. 45, F4
        mov     dword [ebp-10H], 0                      ; 22B3 _ C7. 45, F0, 00000000
        jmp     ?_103                                   ; 22BA _ EB, 4B

?_102:  mov     eax, dword [ebp+1CH]                    ; 22BC _ 8B. 45, 1C
        movzx   eax, byte [eax]                         ; 22BF _ 0F B6. 00
        movzx   eax, al                                 ; 22C2 _ 0F B6. C0
        shl     eax, 4                                  ; 22C5 _ C1. E0, 04
        lea     ebx, [systemFont+eax]                   ; 22C8 _ 8D. 98, 00000000(d)
        movsx   ecx, byte [ebp-1CH]                     ; 22CE _ 0F BE. 4D, E4
        mov     eax, dword [ebp+0CH]                    ; 22D2 _ 8B. 45, 0C
        mov     edx, dword [eax+4H]                     ; 22D5 _ 8B. 50, 04
        mov     eax, dword [ebp+0CH]                    ; 22D8 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 22DB _ 8B. 00
        mov     dword [esp+14H], ebx                    ; 22DD _ 89. 5C 24, 14
        mov     dword [esp+10H], ecx                    ; 22E1 _ 89. 4C 24, 10
        mov     ecx, dword [ebp+14H]                    ; 22E5 _ 8B. 4D, 14
        mov     dword [esp+0CH], ecx                    ; 22E8 _ 89. 4C 24, 0C
        mov     ecx, dword [ebp+10H]                    ; 22EC _ 8B. 4D, 10
        mov     dword [esp+8H], ecx                     ; 22EF _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 22F3 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 22F7 _ 89. 04 24
        call    showFont8                               ; 22FA _ E8, FFFFFFFC(rel)
        add     dword [ebp+10H], 8                      ; 22FF _ 83. 45, 10, 08
        add     dword [ebp+1CH], 1                      ; 2303 _ 83. 45, 1C, 01
?_103:  mov     eax, dword [ebp+1CH]                    ; 2307 _ 8B. 45, 1C
        movzx   eax, byte [eax]                         ; 230A _ 0F B6. 00
        test    al, al                                  ; 230D _ 84. C0
        jnz     ?_102                                   ; 230F _ 75, AB
        mov     eax, dword [ebp+14H]                    ; 2311 _ 8B. 45, 14
        add     eax, 16                                 ; 2314 _ 83. C0, 10
        mov     dword [esp+14H], eax                    ; 2317 _ 89. 44 24, 14
        mov     eax, dword [ebp+10H]                    ; 231B _ 8B. 45, 10
        mov     dword [esp+10H], eax                    ; 231E _ 89. 44 24, 10
        mov     eax, dword [ebp+14H]                    ; 2322 _ 8B. 45, 14
        mov     dword [esp+0CH], eax                    ; 2325 _ 89. 44 24, 0C
        mov     eax, dword [ebp-0CH]                    ; 2329 _ 8B. 45, F4
        mov     dword [esp+8H], eax                     ; 232C _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 2330 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 2333 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2337 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 233A _ 89. 04 24
        call    sheet_refresh                           ; 233D _ E8, FFFFFFFC(rel)
        add     esp, 52                                 ; 2342 _ 83. C4, 34
        pop     ebx                                     ; 2345 _ 5B
        pop     ebp                                     ; 2346 _ 5D
        ret                                             ; 2347 _ C3
; showString End of function

init_palette:; Function begin
        push    ebp                                     ; 2348 _ 55
        mov     ebp, esp                                ; 2349 _ 89. E5
        sub     esp, 24                                 ; 234B _ 83. EC, 18
        mov     dword [esp+8H], table_rgb.2009          ; 234E _ C7. 44 24, 08, 00000120(d)
        mov     dword [esp+4H], 15                      ; 2356 _ C7. 44 24, 04, 0000000F
        mov     dword [esp], 0                          ; 235E _ C7. 04 24, 00000000
        call    set_palette                             ; 2365 _ E8, FFFFFFFC(rel)
        nop                                             ; 236A _ 90
        leave                                           ; 236B _ C9
        ret                                             ; 236C _ C3
; init_palette End of function

set_palette:; Function begin
        push    ebp                                     ; 236D _ 55
        mov     ebp, esp                                ; 236E _ 89. E5
        sub     esp, 40                                 ; 2370 _ 83. EC, 28
        call    io_load_eflags                          ; 2373 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 2378 _ 89. 45, F0
        call    io_cli                                  ; 237B _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 2380 _ 8B. 45, 08
        mov     dword [esp+4H], eax                     ; 2383 _ 89. 44 24, 04
        mov     dword [esp], 968                        ; 2387 _ C7. 04 24, 000003C8
        call    io_out8                                 ; 238E _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 2393 _ 8B. 45, 08
        mov     dword [ebp-0CH], eax                    ; 2396 _ 89. 45, F4
        jmp     ?_105                                   ; 2399 _ EB, 62

?_104:  mov     eax, dword [ebp+10H]                    ; 239B _ 8B. 45, 10
        movzx   eax, byte [eax]                         ; 239E _ 0F B6. 00
        shr     al, 2                                   ; 23A1 _ C0. E8, 02
        movzx   eax, al                                 ; 23A4 _ 0F B6. C0
        mov     dword [esp+4H], eax                     ; 23A7 _ 89. 44 24, 04
        mov     dword [esp], 969                        ; 23AB _ C7. 04 24, 000003C9
        call    io_out8                                 ; 23B2 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 23B7 _ 8B. 45, 10
        add     eax, 1                                  ; 23BA _ 83. C0, 01
        movzx   eax, byte [eax]                         ; 23BD _ 0F B6. 00
        shr     al, 2                                   ; 23C0 _ C0. E8, 02
        movzx   eax, al                                 ; 23C3 _ 0F B6. C0
        mov     dword [esp+4H], eax                     ; 23C6 _ 89. 44 24, 04
        mov     dword [esp], 969                        ; 23CA _ C7. 04 24, 000003C9
        call    io_out8                                 ; 23D1 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 23D6 _ 8B. 45, 10
        add     eax, 2                                  ; 23D9 _ 83. C0, 02
        movzx   eax, byte [eax]                         ; 23DC _ 0F B6. 00
        shr     al, 2                                   ; 23DF _ C0. E8, 02
        movzx   eax, al                                 ; 23E2 _ 0F B6. C0
        mov     dword [esp+4H], eax                     ; 23E5 _ 89. 44 24, 04
        mov     dword [esp], 969                        ; 23E9 _ C7. 04 24, 000003C9
        call    io_out8                                 ; 23F0 _ E8, FFFFFFFC(rel)
        add     dword [ebp+10H], 3                      ; 23F5 _ 83. 45, 10, 03
        add     dword [ebp-0CH], 1                      ; 23F9 _ 83. 45, F4, 01
?_105:  mov     eax, dword [ebp-0CH]                    ; 23FD _ 8B. 45, F4
        cmp     eax, dword [ebp+0CH]                    ; 2400 _ 3B. 45, 0C
        jle     ?_104                                   ; 2403 _ 7E, 96
        mov     eax, dword [ebp-10H]                    ; 2405 _ 8B. 45, F0
        mov     dword [esp], eax                        ; 2408 _ 89. 04 24
        call    io_store_eflags                         ; 240B _ E8, FFFFFFFC(rel)
        nop                                             ; 2410 _ 90
        leave                                           ; 2411 _ C9
        ret                                             ; 2412 _ C3
; set_palette End of function

boxfill8:; Function begin
        push    ebp                                     ; 2413 _ 55
        mov     ebp, esp                                ; 2414 _ 89. E5
        sub     esp, 20                                 ; 2416 _ 83. EC, 14
        mov     eax, dword [ebp+10H]                    ; 2419 _ 8B. 45, 10
        mov     byte [ebp-14H], al                      ; 241C _ 88. 45, EC
        mov     eax, dword [ebp+18H]                    ; 241F _ 8B. 45, 18
        mov     dword [ebp-8H], eax                     ; 2422 _ 89. 45, F8
        jmp     ?_109                                   ; 2425 _ EB, 33

?_106:  mov     eax, dword [ebp+14H]                    ; 2427 _ 8B. 45, 14
        mov     dword [ebp-4H], eax                     ; 242A _ 89. 45, FC
        jmp     ?_108                                   ; 242D _ EB, 1F

?_107:  mov     eax, dword [ebp-8H]                     ; 242F _ 8B. 45, F8
        imul    eax, dword [ebp+0CH]                    ; 2432 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 2436 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 2438 _ 8B. 45, FC
        add     eax, edx                                ; 243B _ 01. D0
        mov     edx, eax                                ; 243D _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 243F _ 8B. 45, 08
        add     edx, eax                                ; 2442 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 2444 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 2448 _ 88. 02
        add     dword [ebp-4H], 1                       ; 244A _ 83. 45, FC, 01
?_108:  mov     eax, dword [ebp-4H]                     ; 244E _ 8B. 45, FC
        cmp     eax, dword [ebp+1CH]                    ; 2451 _ 3B. 45, 1C
        jle     ?_107                                   ; 2454 _ 7E, D9
        add     dword [ebp-8H], 1                       ; 2456 _ 83. 45, F8, 01
?_109:  mov     eax, dword [ebp-8H]                     ; 245A _ 8B. 45, F8
        cmp     eax, dword [ebp+20H]                    ; 245D _ 3B. 45, 20
        jle     ?_106                                   ; 2460 _ 7E, C5
        leave                                           ; 2462 _ C9
        ret                                             ; 2463 _ C3
; boxfill8 End of function

showFont8:; Function begin
        push    ebp                                     ; 2464 _ 55
        mov     ebp, esp                                ; 2465 _ 89. E5
        sub     esp, 20                                 ; 2467 _ 83. EC, 14
        mov     eax, dword [ebp+18H]                    ; 246A _ 8B. 45, 18
        mov     byte [ebp-14H], al                      ; 246D _ 88. 45, EC
        mov     dword [ebp-4H], 0                       ; 2470 _ C7. 45, FC, 00000000
        jmp     ?_119                                   ; 2477 _ E9, 0000016C

?_110:  mov     edx, dword [ebp-4H]                     ; 247C _ 8B. 55, FC
        mov     eax, dword [ebp+1CH]                    ; 247F _ 8B. 45, 1C
        add     eax, edx                                ; 2482 _ 01. D0
        movzx   eax, byte [eax]                         ; 2484 _ 0F B6. 00
        mov     byte [ebp-5H], al                       ; 2487 _ 88. 45, FB
        cmp     byte [ebp-5H], 0                        ; 248A _ 80. 7D, FB, 00
        jns     ?_111                                   ; 248E _ 79, 20
        mov     eax, dword [ebp-4H]                     ; 2490 _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 2493 _ 8B. 55, 14
        add     eax, edx                                ; 2496 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 2498 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 249C _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 249E _ 8B. 45, 10
        add     eax, edx                                ; 24A1 _ 01. D0
        mov     edx, eax                                ; 24A3 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 24A5 _ 8B. 45, 08
        add     edx, eax                                ; 24A8 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 24AA _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 24AE _ 88. 02
?_111:  movsx   eax, byte [ebp-5H]                      ; 24B0 _ 0F BE. 45, FB
        and     eax, 40H                                ; 24B4 _ 83. E0, 40
        test    eax, eax                                ; 24B7 _ 85. C0
        jz      ?_112                                   ; 24B9 _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 24BB _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 24BE _ 8B. 55, 14
        add     eax, edx                                ; 24C1 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 24C3 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 24C7 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 24C9 _ 8B. 45, 10
        add     eax, edx                                ; 24CC _ 01. D0
        lea     edx, [eax+1H]                           ; 24CE _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 24D1 _ 8B. 45, 08
        add     edx, eax                                ; 24D4 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 24D6 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 24DA _ 88. 02
?_112:  movsx   eax, byte [ebp-5H]                      ; 24DC _ 0F BE. 45, FB
        and     eax, 20H                                ; 24E0 _ 83. E0, 20
        test    eax, eax                                ; 24E3 _ 85. C0
        jz      ?_113                                   ; 24E5 _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 24E7 _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 24EA _ 8B. 55, 14
        add     eax, edx                                ; 24ED _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 24EF _ 0F AF. 45, 0C
        mov     edx, eax                                ; 24F3 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 24F5 _ 8B. 45, 10
        add     eax, edx                                ; 24F8 _ 01. D0
        lea     edx, [eax+2H]                           ; 24FA _ 8D. 50, 02
        mov     eax, dword [ebp+8H]                     ; 24FD _ 8B. 45, 08
        add     edx, eax                                ; 2500 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 2502 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 2506 _ 88. 02
?_113:  movsx   eax, byte [ebp-5H]                      ; 2508 _ 0F BE. 45, FB
        and     eax, 10H                                ; 250C _ 83. E0, 10
        test    eax, eax                                ; 250F _ 85. C0
        jz      ?_114                                   ; 2511 _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 2513 _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 2516 _ 8B. 55, 14
        add     eax, edx                                ; 2519 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 251B _ 0F AF. 45, 0C
        mov     edx, eax                                ; 251F _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 2521 _ 8B. 45, 10
        add     eax, edx                                ; 2524 _ 01. D0
        lea     edx, [eax+3H]                           ; 2526 _ 8D. 50, 03
        mov     eax, dword [ebp+8H]                     ; 2529 _ 8B. 45, 08
        add     edx, eax                                ; 252C _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 252E _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 2532 _ 88. 02
?_114:  movsx   eax, byte [ebp-5H]                      ; 2534 _ 0F BE. 45, FB
        and     eax, 08H                                ; 2538 _ 83. E0, 08
        test    eax, eax                                ; 253B _ 85. C0
        jz      ?_115                                   ; 253D _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 253F _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 2542 _ 8B. 55, 14
        add     eax, edx                                ; 2545 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 2547 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 254B _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 254D _ 8B. 45, 10
        add     eax, edx                                ; 2550 _ 01. D0
        lea     edx, [eax+4H]                           ; 2552 _ 8D. 50, 04
        mov     eax, dword [ebp+8H]                     ; 2555 _ 8B. 45, 08
        add     edx, eax                                ; 2558 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 255A _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 255E _ 88. 02
?_115:  movsx   eax, byte [ebp-5H]                      ; 2560 _ 0F BE. 45, FB
        and     eax, 04H                                ; 2564 _ 83. E0, 04
        test    eax, eax                                ; 2567 _ 85. C0
        jz      ?_116                                   ; 2569 _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 256B _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 256E _ 8B. 55, 14
        add     eax, edx                                ; 2571 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 2573 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 2577 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 2579 _ 8B. 45, 10
        add     eax, edx                                ; 257C _ 01. D0
        lea     edx, [eax+5H]                           ; 257E _ 8D. 50, 05
        mov     eax, dword [ebp+8H]                     ; 2581 _ 8B. 45, 08
        add     edx, eax                                ; 2584 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 2586 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 258A _ 88. 02
?_116:  movsx   eax, byte [ebp-5H]                      ; 258C _ 0F BE. 45, FB
        and     eax, 02H                                ; 2590 _ 83. E0, 02
        test    eax, eax                                ; 2593 _ 85. C0
        jz      ?_117                                   ; 2595 _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 2597 _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 259A _ 8B. 55, 14
        add     eax, edx                                ; 259D _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 259F _ 0F AF. 45, 0C
        mov     edx, eax                                ; 25A3 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 25A5 _ 8B. 45, 10
        add     eax, edx                                ; 25A8 _ 01. D0
        lea     edx, [eax+6H]                           ; 25AA _ 8D. 50, 06
        mov     eax, dword [ebp+8H]                     ; 25AD _ 8B. 45, 08
        add     edx, eax                                ; 25B0 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 25B2 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 25B6 _ 88. 02
?_117:  movsx   eax, byte [ebp-5H]                      ; 25B8 _ 0F BE. 45, FB
        and     eax, 01H                                ; 25BC _ 83. E0, 01
        test    eax, eax                                ; 25BF _ 85. C0
        jz      ?_118                                   ; 25C1 _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 25C3 _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 25C6 _ 8B. 55, 14
        add     eax, edx                                ; 25C9 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 25CB _ 0F AF. 45, 0C
        mov     edx, eax                                ; 25CF _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 25D1 _ 8B. 45, 10
        add     eax, edx                                ; 25D4 _ 01. D0
        lea     edx, [eax+7H]                           ; 25D6 _ 8D. 50, 07
        mov     eax, dword [ebp+8H]                     ; 25D9 _ 8B. 45, 08
        add     edx, eax                                ; 25DC _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 25DE _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 25E2 _ 88. 02
?_118:  add     dword [ebp-4H], 1                       ; 25E4 _ 83. 45, FC, 01
?_119:  cmp     dword [ebp-4H], 15                      ; 25E8 _ 83. 7D, FC, 0F
        jle     ?_110                                   ; 25EC _ 0F 8E, FFFFFE8A
        leave                                           ; 25F2 _ C9
        ret                                             ; 25F3 _ C3
; showFont8 End of function

init_mouse_cursor:; Function begin
        push    ebp                                     ; 25F4 _ 55
        mov     ebp, esp                                ; 25F5 _ 89. E5
        sub     esp, 20                                 ; 25F7 _ 83. EC, 14
        mov     eax, dword [ebp+0CH]                    ; 25FA _ 8B. 45, 0C
        mov     byte [ebp-14H], al                      ; 25FD _ 88. 45, EC
        mov     dword [ebp-8H], 0                       ; 2600 _ C7. 45, F8, 00000000
        jmp     ?_126                                   ; 2607 _ E9, 000000B1

?_120:  mov     dword [ebp-4H], 0                       ; 260C _ C7. 45, FC, 00000000
        jmp     ?_125                                   ; 2613 _ E9, 00000097

?_121:  mov     eax, dword [ebp-8H]                     ; 2618 _ 8B. 45, F8
        shl     eax, 4                                  ; 261B _ C1. E0, 04
        mov     edx, eax                                ; 261E _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 2620 _ 8B. 45, FC
        add     eax, edx                                ; 2623 _ 01. D0
        add     eax, cursor.2056                        ; 2625 _ 05, 00000160(d)
        movzx   eax, byte [eax]                         ; 262A _ 0F B6. 00
        cmp     al, 42                                  ; 262D _ 3C, 2A
        jnz     ?_122                                   ; 262F _ 75, 17
        mov     eax, dword [ebp-8H]                     ; 2631 _ 8B. 45, F8
        shl     eax, 4                                  ; 2634 _ C1. E0, 04
        mov     edx, eax                                ; 2637 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 2639 _ 8B. 45, FC
        add     eax, edx                                ; 263C _ 01. D0
        mov     edx, eax                                ; 263E _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 2640 _ 8B. 45, 08
        add     eax, edx                                ; 2643 _ 01. D0
        mov     byte [eax], 0                           ; 2645 _ C6. 00, 00
?_122:  mov     eax, dword [ebp-8H]                     ; 2648 _ 8B. 45, F8
        shl     eax, 4                                  ; 264B _ C1. E0, 04
        mov     edx, eax                                ; 264E _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 2650 _ 8B. 45, FC
        add     eax, edx                                ; 2653 _ 01. D0
        add     eax, cursor.2056                        ; 2655 _ 05, 00000160(d)
        movzx   eax, byte [eax]                         ; 265A _ 0F B6. 00
        cmp     al, 79                                  ; 265D _ 3C, 4F
        jnz     ?_123                                   ; 265F _ 75, 17
        mov     eax, dword [ebp-8H]                     ; 2661 _ 8B. 45, F8
        shl     eax, 4                                  ; 2664 _ C1. E0, 04
        mov     edx, eax                                ; 2667 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 2669 _ 8B. 45, FC
        add     eax, edx                                ; 266C _ 01. D0
        mov     edx, eax                                ; 266E _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 2670 _ 8B. 45, 08
        add     eax, edx                                ; 2673 _ 01. D0
        mov     byte [eax], 7                           ; 2675 _ C6. 00, 07
?_123:  mov     eax, dword [ebp-8H]                     ; 2678 _ 8B. 45, F8
        shl     eax, 4                                  ; 267B _ C1. E0, 04
        mov     edx, eax                                ; 267E _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 2680 _ 8B. 45, FC
        add     eax, edx                                ; 2683 _ 01. D0
        add     eax, cursor.2056                        ; 2685 _ 05, 00000160(d)
        movzx   eax, byte [eax]                         ; 268A _ 0F B6. 00
        cmp     al, 46                                  ; 268D _ 3C, 2E
        jnz     ?_124                                   ; 268F _ 75, 1A
        mov     eax, dword [ebp-8H]                     ; 2691 _ 8B. 45, F8
        shl     eax, 4                                  ; 2694 _ C1. E0, 04
        mov     edx, eax                                ; 2697 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 2699 _ 8B. 45, FC
        add     eax, edx                                ; 269C _ 01. D0
        mov     edx, eax                                ; 269E _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 26A0 _ 8B. 45, 08
        add     edx, eax                                ; 26A3 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 26A5 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 26A9 _ 88. 02
?_124:  add     dword [ebp-4H], 1                       ; 26AB _ 83. 45, FC, 01
?_125:  cmp     dword [ebp-4H], 15                      ; 26AF _ 83. 7D, FC, 0F
        jle     ?_121                                   ; 26B3 _ 0F 8E, FFFFFF5F
        add     dword [ebp-8H], 1                       ; 26B9 _ 83. 45, F8, 01
?_126:  cmp     dword [ebp-8H], 15                      ; 26BD _ 83. 7D, F8, 0F
        jle     ?_120                                   ; 26C1 _ 0F 8E, FFFFFF45
        leave                                           ; 26C7 _ C9
        ret                                             ; 26C8 _ C3
; init_mouse_cursor End of function

putblock:; Function begin
        push    ebp                                     ; 26C9 _ 55
        mov     ebp, esp                                ; 26CA _ 89. E5
        sub     esp, 16                                 ; 26CC _ 83. EC, 10
        mov     dword [ebp-8H], 0                       ; 26CF _ C7. 45, F8, 00000000
        jmp     ?_130                                   ; 26D6 _ EB, 50

?_127:  mov     dword [ebp-4H], 0                       ; 26D8 _ C7. 45, FC, 00000000
        jmp     ?_129                                   ; 26DF _ EB, 3B

?_128:  mov     eax, dword [ebp-8H]                     ; 26E1 _ 8B. 45, F8
        mov     edx, dword [ebp+1CH]                    ; 26E4 _ 8B. 55, 1C
        add     eax, edx                                ; 26E7 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 26E9 _ 0F AF. 45, 0C
        mov     edx, dword [ebp-4H]                     ; 26ED _ 8B. 55, FC
        mov     ecx, dword [ebp+18H]                    ; 26F0 _ 8B. 4D, 18
        add     edx, ecx                                ; 26F3 _ 01. CA
        add     eax, edx                                ; 26F5 _ 01. D0
        mov     edx, eax                                ; 26F7 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 26F9 _ 8B. 45, 08
        add     edx, eax                                ; 26FC _ 01. C2
        mov     eax, dword [ebp-8H]                     ; 26FE _ 8B. 45, F8
        imul    eax, dword [ebp+24H]                    ; 2701 _ 0F AF. 45, 24
        mov     ecx, eax                                ; 2705 _ 89. C1
        mov     eax, dword [ebp-4H]                     ; 2707 _ 8B. 45, FC
        add     eax, ecx                                ; 270A _ 01. C8
        mov     ecx, eax                                ; 270C _ 89. C1
        mov     eax, dword [ebp+20H]                    ; 270E _ 8B. 45, 20
        add     eax, ecx                                ; 2711 _ 01. C8
        movzx   eax, byte [eax]                         ; 2713 _ 0F B6. 00
        mov     byte [edx], al                          ; 2716 _ 88. 02
        add     dword [ebp-4H], 1                       ; 2718 _ 83. 45, FC, 01
?_129:  mov     eax, dword [ebp-4H]                     ; 271C _ 8B. 45, FC
        cmp     eax, dword [ebp+10H]                    ; 271F _ 3B. 45, 10
        jl      ?_128                                   ; 2722 _ 7C, BD
        add     dword [ebp-8H], 1                       ; 2724 _ 83. 45, F8, 01
?_130:  mov     eax, dword [ebp-8H]                     ; 2728 _ 8B. 45, F8
        cmp     eax, dword [ebp+14H]                    ; 272B _ 3B. 45, 14
        jl      ?_127                                   ; 272E _ 7C, A8
        leave                                           ; 2730 _ C9
        ret                                             ; 2731 _ C3
; putblock End of function

intHandlerFromC:; Function begin
        push    ebp                                     ; 2732 _ 55
        mov     ebp, esp                                ; 2733 _ 89. E5
        sub     esp, 40                                 ; 2735 _ 83. EC, 28
        mov     eax, dword [bootInfo]                   ; 2738 _ A1, 0000001C(d)
        mov     dword [ebp-0CH], eax                    ; 273D _ 89. 45, F4
        movzx   eax, word [?_333]                       ; 2740 _ 0F B7. 05, 00000020(d)
        cwde                                            ; 2747 _ 98
        mov     dword [ebp-10H], eax                    ; 2748 _ 89. 45, F0
        movzx   eax, word [?_334]                       ; 274B _ 0F B7. 05, 00000022(d)
        cwde                                            ; 2752 _ 98
        mov     dword [ebp-14H], eax                    ; 2753 _ 89. 45, EC
        mov     dword [esp+4H], 32                      ; 2756 _ C7. 44 24, 04, 00000020
        mov     dword [esp], 32                         ; 275E _ C7. 04 24, 00000020
        call    io_out8                                 ; 2765 _ E8, FFFFFFFC(rel)
        mov     byte [ebp-15H], 0                       ; 276A _ C6. 45, EB, 00
        mov     dword [esp], 96                         ; 276E _ C7. 04 24, 00000060
        call    io_in8                                  ; 2775 _ E8, FFFFFFFC(rel)
        mov     byte [ebp-15H], al                      ; 277A _ 88. 45, EB
        movzx   eax, byte [ebp-15H]                     ; 277D _ 0F B6. 45, EB
        mov     dword [esp+4H], eax                     ; 2781 _ 89. 44 24, 04
        mov     dword [esp], keyinfo                    ; 2785 _ C7. 04 24, 00000024(d)
        call    fifo8_put                               ; 278C _ E8, FFFFFFFC(rel)
        nop                                             ; 2791 _ 90
        leave                                           ; 2792 _ C9
        ret                                             ; 2793 _ C3
; intHandlerFromC End of function

charToHexVal:; Function begin
        push    ebp                                     ; 2794 _ 55
        mov     ebp, esp                                ; 2795 _ 89. E5
        sub     esp, 4                                  ; 2797 _ 83. EC, 04
        mov     eax, dword [ebp+8H]                     ; 279A _ 8B. 45, 08
        mov     byte [ebp-4H], al                       ; 279D _ 88. 45, FC
        cmp     byte [ebp-4H], 9                        ; 27A0 _ 80. 7D, FC, 09
        jle     ?_131                                   ; 27A4 _ 7E, 09
        movzx   eax, byte [ebp-4H]                      ; 27A6 _ 0F B6. 45, FC
        add     eax, 55                                 ; 27AA _ 83. C0, 37
        jmp     ?_132                                   ; 27AD _ EB, 07

?_131:  movzx   eax, byte [ebp-4H]                      ; 27AF _ 0F B6. 45, FC
        add     eax, 48                                 ; 27B3 _ 83. C0, 30
?_132:  leave                                           ; 27B6 _ C9
        ret                                             ; 27B7 _ C3
; charToHexVal End of function

charToHexStr:; Function begin
        push    ebp                                     ; 27B8 _ 55
        mov     ebp, esp                                ; 27B9 _ 89. E5
        sub     esp, 24                                 ; 27BB _ 83. EC, 18
        mov     eax, dword [ebp+8H]                     ; 27BE _ 8B. 45, 08
        mov     byte [ebp-14H], al                      ; 27C1 _ 88. 45, EC
        mov     dword [ebp-4H], 0                       ; 27C4 _ C7. 45, FC, 00000000
        movzx   eax, byte [ebp-14H]                     ; 27CB _ 0F B6. 45, EC
        and     eax, 0FH                                ; 27CF _ 83. E0, 0F
        mov     byte [ebp-5H], al                       ; 27D2 _ 88. 45, FB
        movsx   eax, byte [ebp-5H]                      ; 27D5 _ 0F BE. 45, FB
        mov     dword [esp], eax                        ; 27D9 _ 89. 04 24
        call    charToHexVal                            ; 27DC _ E8, FFFFFFFC(rel)
        mov     byte [?_327], al                        ; 27E1 _ A2, 00000113(d)
        movzx   eax, byte [ebp-14H]                     ; 27E6 _ 0F B6. 45, EC
        shr     al, 4                                   ; 27EA _ C0. E8, 04
        mov     byte [ebp-14H], al                      ; 27ED _ 88. 45, EC
        movzx   eax, byte [ebp-14H]                     ; 27F0 _ 0F B6. 45, EC
        movsx   eax, al                                 ; 27F4 _ 0F BE. C0
        mov     dword [esp], eax                        ; 27F7 _ 89. 04 24
        call    charToHexVal                            ; 27FA _ E8, FFFFFFFC(rel)
        mov     byte [?_326], al                        ; 27FF _ A2, 00000112(d)
        mov     eax, keyval                             ; 2804 _ B8, 00000110(d)
        leave                                           ; 2809 _ C9
        ret                                             ; 280A _ C3
; charToHexStr End of function

intToHexStr:; Function begin
        push    ebp                                     ; 280B _ 55
        mov     ebp, esp                                ; 280C _ 89. E5
        sub     esp, 16                                 ; 280E _ 83. EC, 10
        mov     byte [str.2104], 48                     ; 2811 _ C6. 05, 00000394(d), 30
        mov     byte [?_339], 88                        ; 2818 _ C6. 05, 00000395(d), 58
        mov     byte [?_340], 0                         ; 281F _ C6. 05, 0000039E(d), 00
        mov     dword [ebp-4H], 2                       ; 2826 _ C7. 45, FC, 00000002
        jmp     ?_134                                   ; 282D _ EB, 0F

?_133:  mov     eax, dword [ebp-4H]                     ; 282F _ 8B. 45, FC
        add     eax, str.2104                           ; 2832 _ 05, 00000394(d)
        mov     byte [eax], 48                          ; 2837 _ C6. 00, 30
        add     dword [ebp-4H], 1                       ; 283A _ 83. 45, FC, 01
?_134:  cmp     dword [ebp-4H], 9                       ; 283E _ 83. 7D, FC, 09
        jle     ?_133                                   ; 2842 _ 7E, EB
        mov     dword [ebp-8H], 9                       ; 2844 _ C7. 45, F8, 00000009
        jmp     ?_138                                   ; 284B _ EB, 40

?_135:  mov     eax, dword [ebp+8H]                     ; 284D _ 8B. 45, 08
        and     eax, 0FH                                ; 2850 _ 83. E0, 0F
        mov     dword [ebp-0CH], eax                    ; 2853 _ 89. 45, F4
        mov     eax, dword [ebp+8H]                     ; 2856 _ 8B. 45, 08
        shr     eax, 4                                  ; 2859 _ C1. E8, 04
        mov     dword [ebp+8H], eax                     ; 285C _ 89. 45, 08
        cmp     dword [ebp-0CH], 9                      ; 285F _ 83. 7D, F4, 09
        jle     ?_136                                   ; 2863 _ 7E, 13
        mov     eax, dword [ebp-0CH]                    ; 2865 _ 8B. 45, F4
        add     eax, 55                                 ; 2868 _ 83. C0, 37
        mov     edx, dword [ebp-8H]                     ; 286B _ 8B. 55, F8
        add     edx, str.2104                           ; 286E _ 81. C2, 00000394(d)
        mov     byte [edx], al                          ; 2874 _ 88. 02
        jmp     ?_137                                   ; 2876 _ EB, 11

?_136:  mov     eax, dword [ebp-0CH]                    ; 2878 _ 8B. 45, F4
        add     eax, 48                                 ; 287B _ 83. C0, 30
        mov     edx, dword [ebp-8H]                     ; 287E _ 8B. 55, F8
        add     edx, str.2104                           ; 2881 _ 81. C2, 00000394(d)
        mov     byte [edx], al                          ; 2887 _ 88. 02
?_137:  sub     dword [ebp-8H], 1                       ; 2889 _ 83. 6D, F8, 01
?_138:  cmp     dword [ebp-8H], 1                       ; 288D _ 83. 7D, F8, 01
        jle     ?_139                                   ; 2891 _ 7E, 06
        cmp     dword [ebp+8H], 0                       ; 2893 _ 83. 7D, 08, 00
        jnz     ?_135                                   ; 2897 _ 75, B4
?_139:  mov     eax, str.2104                           ; 2899 _ B8, 00000394(d)
        leave                                           ; 289E _ C9
        ret                                             ; 289F _ C3
; intToHexStr End of function

wait_KBC_sendready:; Function begin
        push    ebp                                     ; 28A0 _ 55
        mov     ebp, esp                                ; 28A1 _ 89. E5
        sub     esp, 24                                 ; 28A3 _ 83. EC, 18
?_140:  mov     dword [esp], 100                        ; 28A6 _ C7. 04 24, 00000064
        call    io_in8                                  ; 28AD _ E8, FFFFFFFC(rel)
        and     eax, 02H                                ; 28B2 _ 83. E0, 02
        test    eax, eax                                ; 28B5 _ 85. C0
        jnz     ?_141                                   ; 28B7 _ 75, 02
        jmp     ?_142                                   ; 28B9 _ EB, 02

?_141:  jmp     ?_140                                   ; 28BB _ EB, E9

?_142:  leave                                           ; 28BD _ C9
        ret                                             ; 28BE _ C3
; wait_KBC_sendready End of function

init_keyboard:; Function begin
        push    ebp                                     ; 28BF _ 55
        mov     ebp, esp                                ; 28C0 _ 89. E5
        sub     esp, 24                                 ; 28C2 _ 83. EC, 18
        call    wait_KBC_sendready                      ; 28C5 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 96                      ; 28CA _ C7. 44 24, 04, 00000060
        mov     dword [esp], 100                        ; 28D2 _ C7. 04 24, 00000064
        call    io_out8                                 ; 28D9 _ E8, FFFFFFFC(rel)
        call    wait_KBC_sendready                      ; 28DE _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 71                      ; 28E3 _ C7. 44 24, 04, 00000047
        mov     dword [esp], 96                         ; 28EB _ C7. 04 24, 00000060
        call    io_out8                                 ; 28F2 _ E8, FFFFFFFC(rel)
        nop                                             ; 28F7 _ 90
        leave                                           ; 28F8 _ C9
        ret                                             ; 28F9 _ C3
; init_keyboard End of function

enable_mouse:; Function begin
        push    ebp                                     ; 28FA _ 55
        mov     ebp, esp                                ; 28FB _ 89. E5
        sub     esp, 24                                 ; 28FD _ 83. EC, 18
        call    wait_KBC_sendready                      ; 2900 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 212                     ; 2905 _ C7. 44 24, 04, 000000D4
        mov     dword [esp], 100                        ; 290D _ C7. 04 24, 00000064
        call    io_out8                                 ; 2914 _ E8, FFFFFFFC(rel)
        call    wait_KBC_sendready                      ; 2919 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 244                     ; 291E _ C7. 44 24, 04, 000000F4
        mov     dword [esp], 96                         ; 2926 _ C7. 04 24, 00000060
        call    io_out8                                 ; 292D _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 2932 _ 8B. 45, 08
        mov     byte [eax+3H], 0                        ; 2935 _ C6. 40, 03, 00
        nop                                             ; 2939 _ 90
        leave                                           ; 293A _ C9
        ret                                             ; 293B _ C3
; enable_mouse End of function

intHandlerForMouse:; Function begin
        push    ebp                                     ; 293C _ 55
        mov     ebp, esp                                ; 293D _ 89. E5
        sub     esp, 40                                 ; 293F _ 83. EC, 28
        mov     dword [esp+4H], 32                      ; 2942 _ C7. 44 24, 04, 00000020
        mov     dword [esp], 160                        ; 294A _ C7. 04 24, 000000A0
        call    io_out8                                 ; 2951 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 32                      ; 2956 _ C7. 44 24, 04, 00000020
        mov     dword [esp], 32                         ; 295E _ C7. 04 24, 00000020
        call    io_out8                                 ; 2965 _ E8, FFFFFFFC(rel)
        mov     dword [esp], 96                         ; 296A _ C7. 04 24, 00000060
        call    io_in8                                  ; 2971 _ E8, FFFFFFFC(rel)
        mov     byte [ebp-9H], al                       ; 2976 _ 88. 45, F7
        movzx   eax, byte [ebp-9H]                      ; 2979 _ 0F B6. 45, F7
        mov     dword [esp+4H], eax                     ; 297D _ 89. 44 24, 04
        mov     dword [esp], mouseinfo                  ; 2981 _ C7. 04 24, 00000040(d)
        call    fifo8_put                               ; 2988 _ E8, FFFFFFFC(rel)
        leave                                           ; 298D _ C9
        ret                                             ; 298E _ C3
; intHandlerForMouse End of function

mouse_decode:; Function begin
        push    ebp                                     ; 298F _ 55
        mov     ebp, esp                                ; 2990 _ 89. E5
        sub     esp, 4                                  ; 2992 _ 83. EC, 04
        mov     eax, dword [ebp+0CH]                    ; 2995 _ 8B. 45, 0C
        mov     byte [ebp-4H], al                       ; 2998 _ 88. 45, FC
        mov     eax, dword [ebp+8H]                     ; 299B _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 299E _ 0F B6. 40, 03
        test    al, al                                  ; 29A2 _ 84. C0
        jnz     ?_144                                   ; 29A4 _ 75, 17
        cmp     byte [ebp-4H], -6                       ; 29A6 _ 80. 7D, FC, FA
        jnz     ?_143                                   ; 29AA _ 75, 07
        mov     eax, dword [ebp+8H]                     ; 29AC _ 8B. 45, 08
        mov     byte [eax+3H], 1                        ; 29AF _ C6. 40, 03, 01
?_143:  mov     eax, 0                                  ; 29B3 _ B8, 00000000
        jmp     ?_151                                   ; 29B8 _ E9, 0000010F

?_144:  mov     eax, dword [ebp+8H]                     ; 29BD _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 29C0 _ 0F B6. 40, 03
        cmp     al, 1                                   ; 29C4 _ 3C, 01
        jnz     ?_146                                   ; 29C6 _ 75, 28
        movzx   eax, byte [ebp-4H]                      ; 29C8 _ 0F B6. 45, FC
        and     eax, 0C8H                               ; 29CC _ 25, 000000C8
        cmp     eax, 8                                  ; 29D1 _ 83. F8, 08
        jnz     ?_145                                   ; 29D4 _ 75, 10
        mov     eax, dword [ebp+8H]                     ; 29D6 _ 8B. 45, 08
        movzx   edx, byte [ebp-4H]                      ; 29D9 _ 0F B6. 55, FC
        mov     byte [eax], dl                          ; 29DD _ 88. 10
        mov     eax, dword [ebp+8H]                     ; 29DF _ 8B. 45, 08
        mov     byte [eax+3H], 2                        ; 29E2 _ C6. 40, 03, 02
?_145:  mov     eax, 0                                  ; 29E6 _ B8, 00000000
        jmp     ?_151                                   ; 29EB _ E9, 000000DC

?_146:  mov     eax, dword [ebp+8H]                     ; 29F0 _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 29F3 _ 0F B6. 40, 03
        cmp     al, 2                                   ; 29F7 _ 3C, 02
        jnz     ?_147                                   ; 29F9 _ 75, 1B
        mov     eax, dword [ebp+8H]                     ; 29FB _ 8B. 45, 08
        movzx   edx, byte [ebp-4H]                      ; 29FE _ 0F B6. 55, FC
        mov     byte [eax+1H], dl                       ; 2A02 _ 88. 50, 01
        mov     eax, dword [ebp+8H]                     ; 2A05 _ 8B. 45, 08
        mov     byte [eax+3H], 3                        ; 2A08 _ C6. 40, 03, 03
        mov     eax, 0                                  ; 2A0C _ B8, 00000000
        jmp     ?_151                                   ; 2A11 _ E9, 000000B6

?_147:  mov     eax, dword [ebp+8H]                     ; 2A16 _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 2A19 _ 0F B6. 40, 03
        cmp     al, 3                                   ; 2A1D _ 3C, 03
        jne     ?_150                                   ; 2A1F _ 0F 85, 000000A2
        mov     eax, dword [ebp+8H]                     ; 2A25 _ 8B. 45, 08
        movzx   edx, byte [ebp-4H]                      ; 2A28 _ 0F B6. 55, FC
        mov     byte [eax+2H], dl                       ; 2A2C _ 88. 50, 02
        mov     eax, dword [ebp+8H]                     ; 2A2F _ 8B. 45, 08
        mov     byte [eax+3H], 1                        ; 2A32 _ C6. 40, 03, 01
        mov     eax, dword [ebp+8H]                     ; 2A36 _ 8B. 45, 08
        movzx   eax, byte [eax]                         ; 2A39 _ 0F B6. 00
        movzx   eax, al                                 ; 2A3C _ 0F B6. C0
        and     eax, 07H                                ; 2A3F _ 83. E0, 07
        mov     edx, eax                                ; 2A42 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 2A44 _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 2A47 _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 2A4A _ 8B. 45, 08
        movzx   eax, byte [eax+1H]                      ; 2A4D _ 0F B6. 40, 01
        movzx   edx, al                                 ; 2A51 _ 0F B6. D0
        mov     eax, dword [ebp+8H]                     ; 2A54 _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 2A57 _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 2A5A _ 8B. 45, 08
        movzx   eax, byte [eax+2H]                      ; 2A5D _ 0F B6. 40, 02
        movzx   edx, al                                 ; 2A61 _ 0F B6. D0
        mov     eax, dword [ebp+8H]                     ; 2A64 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 2A67 _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 2A6A _ 8B. 45, 08
        movzx   eax, byte [eax]                         ; 2A6D _ 0F B6. 00
        movzx   eax, al                                 ; 2A70 _ 0F B6. C0
        and     eax, 10H                                ; 2A73 _ 83. E0, 10
        test    eax, eax                                ; 2A76 _ 85. C0
        jz      ?_148                                   ; 2A78 _ 74, 13
        mov     eax, dword [ebp+8H]                     ; 2A7A _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 2A7D _ 8B. 40, 04
        or      eax, 0FFFFFF00H                         ; 2A80 _ 0D, FFFFFF00
        mov     edx, eax                                ; 2A85 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 2A87 _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 2A8A _ 89. 50, 04
?_148:  mov     eax, dword [ebp+8H]                     ; 2A8D _ 8B. 45, 08
        movzx   eax, byte [eax]                         ; 2A90 _ 0F B6. 00
        movzx   eax, al                                 ; 2A93 _ 0F B6. C0
        and     eax, 20H                                ; 2A96 _ 83. E0, 20
        test    eax, eax                                ; 2A99 _ 85. C0
        jz      ?_149                                   ; 2A9B _ 74, 13
        mov     eax, dword [ebp+8H]                     ; 2A9D _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 2AA0 _ 8B. 40, 08
        or      eax, 0FFFFFF00H                         ; 2AA3 _ 0D, FFFFFF00
        mov     edx, eax                                ; 2AA8 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 2AAA _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 2AAD _ 89. 50, 08
?_149:  mov     eax, dword [ebp+8H]                     ; 2AB0 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 2AB3 _ 8B. 40, 08
        neg     eax                                     ; 2AB6 _ F7. D8
        mov     edx, eax                                ; 2AB8 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 2ABA _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 2ABD _ 89. 50, 08
        mov     eax, 1                                  ; 2AC0 _ B8, 00000001
        jmp     ?_151                                   ; 2AC5 _ EB, 05

?_150:  mov     eax, 4294967295                         ; 2AC7 _ B8, FFFFFFFF
?_151:  leave                                           ; 2ACC _ C9
        ret                                             ; 2ACD _ C3
; mouse_decode End of function

showMemoryInfo:; Function begin
        push    ebp                                     ; 2ACE _ 55
        mov     ebp, esp                                ; 2ACF _ 89. E5
        sub     esp, 72                                 ; 2AD1 _ 83. EC, 48
        mov     dword [ebp-0CH], 0                      ; 2AD4 _ C7. 45, F4, 00000000
        mov     dword [ebp-10H], 0                      ; 2ADB _ C7. 45, F0, 00000000
        mov     dword [ebp-14H], 104                    ; 2AE2 _ C7. 45, EC, 00000068
        mov     dword [ebp-18H], 80                     ; 2AE9 _ C7. 45, E8, 00000050
        mov     edx, dword [ysize]                      ; 2AF0 _ 8B. 15, 00000140(d)
        mov     eax, dword [ebp+0CH]                    ; 2AF6 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 2AF9 _ 8B. 00
        mov     dword [esp+8H], edx                     ; 2AFB _ 89. 54 24, 08
        mov     edx, dword [ebp+1CH]                    ; 2AFF _ 8B. 55, 1C
        mov     dword [esp+4H], edx                     ; 2B02 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 2B06 _ 89. 04 24
        call    init_screen8                            ; 2B09 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+20H]                    ; 2B0E _ 8B. 45, 20
        movsx   eax, al                                 ; 2B11 _ 0F BE. C0
        mov     dword [esp+14H], ?_317                  ; 2B14 _ C7. 44 24, 14, 0000004A(d)
        mov     dword [esp+10H], eax                    ; 2B1C _ 89. 44 24, 10
        mov     eax, dword [ebp-10H]                    ; 2B20 _ 8B. 45, F0
        mov     dword [esp+0CH], eax                    ; 2B23 _ 89. 44 24, 0C
        mov     eax, dword [ebp-0CH]                    ; 2B27 _ 8B. 45, F4
        mov     dword [esp+8H], eax                     ; 2B2A _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 2B2E _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 2B31 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2B35 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2B38 _ 89. 04 24
        call    showString                              ; 2B3B _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+18H]                    ; 2B40 _ 8B. 45, 18
        mov     dword [esp], eax                        ; 2B43 _ 89. 04 24
        call    intToHexStr                             ; 2B46 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-1CH], eax                    ; 2B4B _ 89. 45, E4
        mov     eax, dword [ebp+20H]                    ; 2B4E _ 8B. 45, 20
        movsx   eax, al                                 ; 2B51 _ 0F BE. C0
        mov     edx, dword [ebp-1CH]                    ; 2B54 _ 8B. 55, E4
        mov     dword [esp+14H], edx                    ; 2B57 _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 2B5B _ 89. 44 24, 10
        mov     eax, dword [ebp-10H]                    ; 2B5F _ 8B. 45, F0
        mov     dword [esp+0CH], eax                    ; 2B62 _ 89. 44 24, 0C
        mov     eax, dword [ebp-14H]                    ; 2B66 _ 8B. 45, EC
        mov     dword [esp+8H], eax                     ; 2B69 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 2B6D _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 2B70 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2B74 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2B77 _ 89. 04 24
        call    showString                              ; 2B7A _ E8, FFFFFFFC(rel)
        add     dword [ebp-10H], 16                     ; 2B7F _ 83. 45, F0, 10
        mov     eax, dword [ebp+20H]                    ; 2B83 _ 8B. 45, 20
        movsx   eax, al                                 ; 2B86 _ 0F BE. C0
        mov     dword [esp+14H], ?_318                  ; 2B89 _ C7. 44 24, 14, 00000054(d)
        mov     dword [esp+10H], eax                    ; 2B91 _ 89. 44 24, 10
        mov     eax, dword [ebp-10H]                    ; 2B95 _ 8B. 45, F0
        mov     dword [esp+0CH], eax                    ; 2B98 _ 89. 44 24, 0C
        mov     eax, dword [ebp-0CH]                    ; 2B9C _ 8B. 45, F4
        mov     dword [esp+8H], eax                     ; 2B9F _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 2BA3 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 2BA6 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2BAA _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2BAD _ 89. 04 24
        call    showString                              ; 2BB0 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 2BB5 _ 8B. 45, 10
        mov     eax, dword [eax]                        ; 2BB8 _ 8B. 00
        mov     dword [esp], eax                        ; 2BBA _ 89. 04 24
        call    intToHexStr                             ; 2BBD _ E8, FFFFFFFC(rel)
        mov     dword [ebp-20H], eax                    ; 2BC2 _ 89. 45, E0
        mov     eax, dword [ebp+20H]                    ; 2BC5 _ 8B. 45, 20
        movsx   eax, al                                 ; 2BC8 _ 0F BE. C0
        mov     edx, dword [ebp-20H]                    ; 2BCB _ 8B. 55, E0
        mov     dword [esp+14H], edx                    ; 2BCE _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 2BD2 _ 89. 44 24, 10
        mov     eax, dword [ebp-10H]                    ; 2BD6 _ 8B. 45, F0
        mov     dword [esp+0CH], eax                    ; 2BD9 _ 89. 44 24, 0C
        mov     eax, dword [ebp-14H]                    ; 2BDD _ 8B. 45, EC
        mov     dword [esp+8H], eax                     ; 2BE0 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 2BE4 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 2BE7 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2BEB _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2BEE _ 89. 04 24
        call    showString                              ; 2BF1 _ E8, FFFFFFFC(rel)
        add     dword [ebp-10H], 16                     ; 2BF6 _ 83. 45, F0, 10
        mov     eax, dword [ebp+20H]                    ; 2BFA _ 8B. 45, 20
        movsx   eax, al                                 ; 2BFD _ 0F BE. C0
        mov     dword [esp+14H], ?_319                  ; 2C00 _ C7. 44 24, 14, 00000060(d)
        mov     dword [esp+10H], eax                    ; 2C08 _ 89. 44 24, 10
        mov     eax, dword [ebp-10H]                    ; 2C0C _ 8B. 45, F0
        mov     dword [esp+0CH], eax                    ; 2C0F _ 89. 44 24, 0C
        mov     eax, dword [ebp-0CH]                    ; 2C13 _ 8B. 45, F4
        mov     dword [esp+8H], eax                     ; 2C16 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 2C1A _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 2C1D _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2C21 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2C24 _ 89. 04 24
        call    showString                              ; 2C27 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 2C2C _ 8B. 45, 10
        mov     eax, dword [eax+4H]                     ; 2C2F _ 8B. 40, 04
        mov     dword [esp], eax                        ; 2C32 _ 89. 04 24
        call    intToHexStr                             ; 2C35 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-24H], eax                    ; 2C3A _ 89. 45, DC
        mov     eax, dword [ebp+20H]                    ; 2C3D _ 8B. 45, 20
        movsx   eax, al                                 ; 2C40 _ 0F BE. C0
        mov     edx, dword [ebp-24H]                    ; 2C43 _ 8B. 55, DC
        mov     dword [esp+14H], edx                    ; 2C46 _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 2C4A _ 89. 44 24, 10
        mov     eax, dword [ebp-10H]                    ; 2C4E _ 8B. 45, F0
        mov     dword [esp+0CH], eax                    ; 2C51 _ 89. 44 24, 0C
        mov     eax, dword [ebp-14H]                    ; 2C55 _ 8B. 45, EC
        mov     dword [esp+8H], eax                     ; 2C58 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 2C5C _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 2C5F _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2C63 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2C66 _ 89. 04 24
        call    showString                              ; 2C69 _ E8, FFFFFFFC(rel)
        add     dword [ebp-10H], 16                     ; 2C6E _ 83. 45, F0, 10
        mov     eax, dword [ebp+20H]                    ; 2C72 _ 8B. 45, 20
        movsx   eax, al                                 ; 2C75 _ 0F BE. C0
        mov     dword [esp+14H], ?_320                  ; 2C78 _ C7. 44 24, 14, 0000006C(d)
        mov     dword [esp+10H], eax                    ; 2C80 _ 89. 44 24, 10
        mov     eax, dword [ebp-10H]                    ; 2C84 _ 8B. 45, F0
        mov     dword [esp+0CH], eax                    ; 2C87 _ 89. 44 24, 0C
        mov     eax, dword [ebp-0CH]                    ; 2C8B _ 8B. 45, F4
        mov     dword [esp+8H], eax                     ; 2C8E _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 2C92 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 2C95 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2C99 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2C9C _ 89. 04 24
        call    showString                              ; 2C9F _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 2CA4 _ 8B. 45, 10
        mov     eax, dword [eax+8H]                     ; 2CA7 _ 8B. 40, 08
        mov     dword [esp], eax                        ; 2CAA _ 89. 04 24
        call    intToHexStr                             ; 2CAD _ E8, FFFFFFFC(rel)
        mov     dword [ebp-28H], eax                    ; 2CB2 _ 89. 45, D8
        mov     eax, dword [ebp+20H]                    ; 2CB5 _ 8B. 45, 20
        movsx   eax, al                                 ; 2CB8 _ 0F BE. C0
        mov     edx, dword [ebp-28H]                    ; 2CBB _ 8B. 55, D8
        mov     dword [esp+14H], edx                    ; 2CBE _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 2CC2 _ 89. 44 24, 10
        mov     eax, dword [ebp-10H]                    ; 2CC6 _ 8B. 45, F0
        mov     dword [esp+0CH], eax                    ; 2CC9 _ 89. 44 24, 0C
        mov     eax, dword [ebp-14H]                    ; 2CCD _ 8B. 45, EC
        mov     dword [esp+8H], eax                     ; 2CD0 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 2CD4 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 2CD7 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2CDB _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2CDE _ 89. 04 24
        call    showString                              ; 2CE1 _ E8, FFFFFFFC(rel)
        leave                                           ; 2CE6 _ C9
        ret                                             ; 2CE7 _ C3
; showMemoryInfo End of function

message_box:; Function begin
        push    ebp                                     ; 2CE8 _ 55
        mov     ebp, esp                                ; 2CE9 _ 89. E5
        sub     esp, 56                                 ; 2CEB _ 83. EC, 38
        mov     eax, dword [ebp+8H]                     ; 2CEE _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2CF1 _ 89. 04 24
        call    sheet_alloc                             ; 2CF4 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 2CF9 _ 89. 45, F4
        mov     eax, dword [memman]                     ; 2CFC _ A1, 00000000(d)
        mov     dword [esp+4H], 10880                   ; 2D01 _ C7. 44 24, 04, 00002A80
        mov     dword [esp], eax                        ; 2D09 _ 89. 04 24
        call    memman_alloc_4k                         ; 2D0C _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 2D11 _ 89. 45, F0
        mov     dword [esp+10H], -1                     ; 2D14 _ C7. 44 24, 10, FFFFFFFF
        mov     dword [esp+0CH], 68                     ; 2D1C _ C7. 44 24, 0C, 00000044
        mov     dword [esp+8H], 160                     ; 2D24 _ C7. 44 24, 08, 000000A0
        mov     eax, dword [ebp-10H]                    ; 2D2C _ 8B. 45, F0
        mov     dword [esp+4H], eax                     ; 2D2F _ 89. 44 24, 04
        mov     eax, dword [ebp-0CH]                    ; 2D33 _ 8B. 45, F4
        mov     dword [esp], eax                        ; 2D36 _ 89. 04 24
        call    sheet_setbuf                            ; 2D39 _ E8, FFFFFFFC(rel)
        mov     dword [esp+0CH], 1                      ; 2D3E _ C7. 44 24, 0C, 00000001
        mov     eax, dword [ebp+0CH]                    ; 2D46 _ 8B. 45, 0C
        mov     dword [esp+8H], eax                     ; 2D49 _ 89. 44 24, 08
        mov     eax, dword [ebp-0CH]                    ; 2D4D _ 8B. 45, F4
        mov     dword [esp+4H], eax                     ; 2D50 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2D54 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2D57 _ 89. 04 24
        call    make_window8                            ; 2D5A _ E8, FFFFFFFC(rel)
        mov     dword [esp+14H], 7                      ; 2D5F _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], 16                     ; 2D67 _ C7. 44 24, 10, 00000010
        mov     dword [esp+0CH], 144                    ; 2D6F _ C7. 44 24, 0C, 00000090
        mov     dword [esp+8H], 28                      ; 2D77 _ C7. 44 24, 08, 0000001C
        mov     dword [esp+4H], 8                       ; 2D7F _ C7. 44 24, 04, 00000008
        mov     eax, dword [ebp-0CH]                    ; 2D87 _ 8B. 45, F4
        mov     dword [esp], eax                        ; 2D8A _ 89. 04 24
        call    make_textbox8                           ; 2D8D _ E8, FFFFFFFC(rel)
        mov     dword [esp+0CH], 172                    ; 2D92 _ C7. 44 24, 0C, 000000AC
        mov     dword [esp+8H], 260                     ; 2D9A _ C7. 44 24, 08, 00000104
        mov     eax, dword [ebp-0CH]                    ; 2DA2 _ 8B. 45, F4
        mov     dword [esp+4H], eax                     ; 2DA5 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2DA9 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2DAC _ 89. 04 24
        call    sheet_slide                             ; 2DAF _ E8, FFFFFFFC(rel)
        mov     dword [esp+8H], 2                       ; 2DB4 _ C7. 44 24, 08, 00000002
        mov     eax, dword [ebp-0CH]                    ; 2DBC _ 8B. 45, F4
        mov     dword [esp+4H], eax                     ; 2DBF _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2DC3 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2DC6 _ 89. 04 24
        call    sheet_updown                            ; 2DC9 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 2DCE _ 8B. 45, F4
        leave                                           ; 2DD1 _ C9
        ret                                             ; 2DD2 _ C3
; message_box End of function

make_window8:; Function begin
        push    ebp                                     ; 2DD3 _ 55
        mov     ebp, esp                                ; 2DD4 _ 89. E5
        push    ebx                                     ; 2DD6 _ 53
        sub     esp, 52                                 ; 2DD7 _ 83. EC, 34
        mov     eax, dword [ebp+14H]                    ; 2DDA _ 8B. 45, 14
        mov     byte [ebp-1CH], al                      ; 2DDD _ 88. 45, E4
        mov     eax, dword [ebp+0CH]                    ; 2DE0 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 2DE3 _ 8B. 40, 04
        mov     dword [ebp-0CH], eax                    ; 2DE6 _ 89. 45, F4
        mov     eax, dword [ebp+0CH]                    ; 2DE9 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 2DEC _ 8B. 40, 08
        mov     dword [ebp-10H], eax                    ; 2DEF _ 89. 45, F0
        mov     eax, dword [ebp-0CH]                    ; 2DF2 _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 2DF5 _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 2DF8 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 2DFB _ 8B. 00
        mov     dword [esp+18H], 0                      ; 2DFD _ C7. 44 24, 18, 00000000
        mov     dword [esp+14H], edx                    ; 2E05 _ 89. 54 24, 14
        mov     dword [esp+10H], 0                      ; 2E09 _ C7. 44 24, 10, 00000000
        mov     dword [esp+0CH], 0                      ; 2E11 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 8                       ; 2E19 _ C7. 44 24, 08, 00000008
        mov     edx, dword [ebp-0CH]                    ; 2E21 _ 8B. 55, F4
        mov     dword [esp+4H], edx                     ; 2E24 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 2E28 _ 89. 04 24
        call    boxfill8                                ; 2E2B _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 2E30 _ 8B. 45, F4
        lea     edx, [eax-2H]                           ; 2E33 _ 8D. 50, FE
        mov     eax, dword [ebp+0CH]                    ; 2E36 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 2E39 _ 8B. 00
        mov     dword [esp+18H], 1                      ; 2E3B _ C7. 44 24, 18, 00000001
        mov     dword [esp+14H], edx                    ; 2E43 _ 89. 54 24, 14
        mov     dword [esp+10H], 1                      ; 2E47 _ C7. 44 24, 10, 00000001
        mov     dword [esp+0CH], 1                      ; 2E4F _ C7. 44 24, 0C, 00000001
        mov     dword [esp+8H], 7                       ; 2E57 _ C7. 44 24, 08, 00000007
        mov     edx, dword [ebp-0CH]                    ; 2E5F _ 8B. 55, F4
        mov     dword [esp+4H], edx                     ; 2E62 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 2E66 _ 89. 04 24
        call    boxfill8                                ; 2E69 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 2E6E _ 8B. 45, F0
        lea     edx, [eax-1H]                           ; 2E71 _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 2E74 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 2E77 _ 8B. 00
        mov     dword [esp+18H], edx                    ; 2E79 _ 89. 54 24, 18
        mov     dword [esp+14H], 0                      ; 2E7D _ C7. 44 24, 14, 00000000
        mov     dword [esp+10H], 0                      ; 2E85 _ C7. 44 24, 10, 00000000
        mov     dword [esp+0CH], 0                      ; 2E8D _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 8                       ; 2E95 _ C7. 44 24, 08, 00000008
        mov     edx, dword [ebp-0CH]                    ; 2E9D _ 8B. 55, F4
        mov     dword [esp+4H], edx                     ; 2EA0 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 2EA4 _ 89. 04 24
        call    boxfill8                                ; 2EA7 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 2EAC _ 8B. 45, F0
        lea     edx, [eax-1H]                           ; 2EAF _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 2EB2 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 2EB5 _ 8B. 00
        mov     dword [esp+18H], edx                    ; 2EB7 _ 89. 54 24, 18
        mov     dword [esp+14H], 1                      ; 2EBB _ C7. 44 24, 14, 00000001
        mov     dword [esp+10H], 1                      ; 2EC3 _ C7. 44 24, 10, 00000001
        mov     dword [esp+0CH], 1                      ; 2ECB _ C7. 44 24, 0C, 00000001
        mov     dword [esp+8H], 7                       ; 2ED3 _ C7. 44 24, 08, 00000007
        mov     edx, dword [ebp-0CH]                    ; 2EDB _ 8B. 55, F4
        mov     dword [esp+4H], edx                     ; 2EDE _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 2EE2 _ 89. 04 24
        call    boxfill8                                ; 2EE5 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 2EEA _ 8B. 45, F0
        lea     ebx, [eax-2H]                           ; 2EED _ 8D. 58, FE
        mov     eax, dword [ebp-0CH]                    ; 2EF0 _ 8B. 45, F4
        lea     ecx, [eax-2H]                           ; 2EF3 _ 8D. 48, FE
        mov     eax, dword [ebp-0CH]                    ; 2EF6 _ 8B. 45, F4
        lea     edx, [eax-2H]                           ; 2EF9 _ 8D. 50, FE
        mov     eax, dword [ebp+0CH]                    ; 2EFC _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 2EFF _ 8B. 00
        mov     dword [esp+18H], ebx                    ; 2F01 _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 2F05 _ 89. 4C 24, 14
        mov     dword [esp+10H], 1                      ; 2F09 _ C7. 44 24, 10, 00000001
        mov     dword [esp+0CH], edx                    ; 2F11 _ 89. 54 24, 0C
        mov     dword [esp+8H], 15                      ; 2F15 _ C7. 44 24, 08, 0000000F
        mov     edx, dword [ebp-0CH]                    ; 2F1D _ 8B. 55, F4
        mov     dword [esp+4H], edx                     ; 2F20 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 2F24 _ 89. 04 24
        call    boxfill8                                ; 2F27 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 2F2C _ 8B. 45, F0
        lea     ebx, [eax-1H]                           ; 2F2F _ 8D. 58, FF
        mov     eax, dword [ebp-0CH]                    ; 2F32 _ 8B. 45, F4
        lea     ecx, [eax-1H]                           ; 2F35 _ 8D. 48, FF
        mov     eax, dword [ebp-0CH]                    ; 2F38 _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 2F3B _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 2F3E _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 2F41 _ 8B. 00
        mov     dword [esp+18H], ebx                    ; 2F43 _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 2F47 _ 89. 4C 24, 14
        mov     dword [esp+10H], 0                      ; 2F4B _ C7. 44 24, 10, 00000000
        mov     dword [esp+0CH], edx                    ; 2F53 _ 89. 54 24, 0C
        mov     dword [esp+8H], 0                       ; 2F57 _ C7. 44 24, 08, 00000000
        mov     edx, dword [ebp-0CH]                    ; 2F5F _ 8B. 55, F4
        mov     dword [esp+4H], edx                     ; 2F62 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 2F66 _ 89. 04 24
        call    boxfill8                                ; 2F69 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 2F6E _ 8B. 45, F0
        lea     ecx, [eax-3H]                           ; 2F71 _ 8D. 48, FD
        mov     eax, dword [ebp-0CH]                    ; 2F74 _ 8B. 45, F4
        lea     edx, [eax-3H]                           ; 2F77 _ 8D. 50, FD
        mov     eax, dword [ebp+0CH]                    ; 2F7A _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 2F7D _ 8B. 00
        mov     dword [esp+18H], ecx                    ; 2F7F _ 89. 4C 24, 18
        mov     dword [esp+14H], edx                    ; 2F83 _ 89. 54 24, 14
        mov     dword [esp+10H], 2                      ; 2F87 _ C7. 44 24, 10, 00000002
        mov     dword [esp+0CH], 2                      ; 2F8F _ C7. 44 24, 0C, 00000002
        mov     dword [esp+8H], 8                       ; 2F97 _ C7. 44 24, 08, 00000008
        mov     edx, dword [ebp-0CH]                    ; 2F9F _ 8B. 55, F4
        mov     dword [esp+4H], edx                     ; 2FA2 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 2FA6 _ 89. 04 24
        call    boxfill8                                ; 2FA9 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 2FAE _ 8B. 45, F4
        lea     edx, [eax-4H]                           ; 2FB1 _ 8D. 50, FC
        mov     eax, dword [ebp+0CH]                    ; 2FB4 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 2FB7 _ 8B. 00
        mov     dword [esp+18H], 20                     ; 2FB9 _ C7. 44 24, 18, 00000014
        mov     dword [esp+14H], edx                    ; 2FC1 _ 89. 54 24, 14
        mov     dword [esp+10H], 3                      ; 2FC5 _ C7. 44 24, 10, 00000003
        mov     dword [esp+0CH], 3                      ; 2FCD _ C7. 44 24, 0C, 00000003
        mov     dword [esp+8H], 12                      ; 2FD5 _ C7. 44 24, 08, 0000000C
        mov     edx, dword [ebp-0CH]                    ; 2FDD _ 8B. 55, F4
        mov     dword [esp+4H], edx                     ; 2FE0 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 2FE4 _ 89. 04 24
        call    boxfill8                                ; 2FE7 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 2FEC _ 8B. 45, F0
        lea     ebx, [eax-2H]                           ; 2FEF _ 8D. 58, FE
        mov     eax, dword [ebp-0CH]                    ; 2FF2 _ 8B. 45, F4
        lea     ecx, [eax-2H]                           ; 2FF5 _ 8D. 48, FE
        mov     eax, dword [ebp-10H]                    ; 2FF8 _ 8B. 45, F0
        lea     edx, [eax-2H]                           ; 2FFB _ 8D. 50, FE
        mov     eax, dword [ebp+0CH]                    ; 2FFE _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 3001 _ 8B. 00
        mov     dword [esp+18H], ebx                    ; 3003 _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 3007 _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 300B _ 89. 54 24, 10
        mov     dword [esp+0CH], 1                      ; 300F _ C7. 44 24, 0C, 00000001
        mov     dword [esp+8H], 15                      ; 3017 _ C7. 44 24, 08, 0000000F
        mov     edx, dword [ebp-0CH]                    ; 301F _ 8B. 55, F4
        mov     dword [esp+4H], edx                     ; 3022 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 3026 _ 89. 04 24
        call    boxfill8                                ; 3029 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 302E _ 8B. 45, F0
        lea     ebx, [eax-1H]                           ; 3031 _ 8D. 58, FF
        mov     eax, dword [ebp-0CH]                    ; 3034 _ 8B. 45, F4
        lea     ecx, [eax-1H]                           ; 3037 _ 8D. 48, FF
        mov     eax, dword [ebp-10H]                    ; 303A _ 8B. 45, F0
        lea     edx, [eax-1H]                           ; 303D _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 3040 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 3043 _ 8B. 00
        mov     dword [esp+18H], ebx                    ; 3045 _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 3049 _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 304D _ 89. 54 24, 10
        mov     dword [esp+0CH], 0                      ; 3051 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 0                       ; 3059 _ C7. 44 24, 08, 00000000
        mov     edx, dword [ebp-0CH]                    ; 3061 _ 8B. 55, F4
        mov     dword [esp+4H], edx                     ; 3064 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 3068 _ 89. 04 24
        call    boxfill8                                ; 306B _ E8, FFFFFFFC(rel)
        movsx   eax, byte [ebp-1CH]                     ; 3070 _ 0F BE. 45, E4
        mov     dword [esp+0CH], eax                    ; 3074 _ 89. 44 24, 0C
        mov     eax, dword [ebp+10H]                    ; 3078 _ 8B. 45, 10
        mov     dword [esp+8H], eax                     ; 307B _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 307F _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 3082 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 3086 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3089 _ 89. 04 24
        call    make_wtitle8                            ; 308C _ E8, FFFFFFFC(rel)
        nop                                             ; 3091 _ 90
        add     esp, 52                                 ; 3092 _ 83. C4, 34
        pop     ebx                                     ; 3095 _ 5B
        pop     ebp                                     ; 3096 _ 5D
        ret                                             ; 3097 _ C3
; make_window8 End of function

make_wtitle8:; Function begin
        push    ebp                                     ; 3098 _ 55
        mov     ebp, esp                                ; 3099 _ 89. E5
        push    ebx                                     ; 309B _ 53
        sub     esp, 52                                 ; 309C _ 83. EC, 34
        mov     eax, dword [ebp+14H]                    ; 309F _ 8B. 45, 14
        mov     byte [ebp-1CH], al                      ; 30A2 _ 88. 45, E4
        cmp     byte [ebp-1CH], 0                       ; 30A5 _ 80. 7D, E4, 00
        jz      ?_152                                   ; 30A9 _ 74, 0A
        mov     byte [ebp-12H], 7                       ; 30AB _ C6. 45, EE, 07
        mov     byte [ebp-13H], 12                      ; 30AF _ C6. 45, ED, 0C
        jmp     ?_153                                   ; 30B3 _ EB, 08

?_152:  mov     byte [ebp-12H], 8                       ; 30B5 _ C6. 45, EE, 08
        mov     byte [ebp-13H], 15                      ; 30B9 _ C6. 45, ED, 0F
?_153:  mov     eax, dword [ebp+0CH]                    ; 30BD _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 30C0 _ 8B. 40, 04
        lea     ebx, [eax-4H]                           ; 30C3 _ 8D. 58, FC
        movzx   eax, byte [ebp-13H]                     ; 30C6 _ 0F B6. 45, ED
        movzx   ecx, al                                 ; 30CA _ 0F B6. C8
        mov     eax, dword [ebp+0CH]                    ; 30CD _ 8B. 45, 0C
        mov     edx, dword [eax+4H]                     ; 30D0 _ 8B. 50, 04
        mov     eax, dword [ebp+0CH]                    ; 30D3 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 30D6 _ 8B. 00
        mov     dword [esp+18H], 20                     ; 30D8 _ C7. 44 24, 18, 00000014
        mov     dword [esp+14H], ebx                    ; 30E0 _ 89. 5C 24, 14
        mov     dword [esp+10H], 3                      ; 30E4 _ C7. 44 24, 10, 00000003
        mov     dword [esp+0CH], 3                      ; 30EC _ C7. 44 24, 0C, 00000003
        mov     dword [esp+8H], ecx                     ; 30F4 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 30F8 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 30FC _ 89. 04 24
        call    boxfill8                                ; 30FF _ E8, FFFFFFFC(rel)
        movsx   eax, byte [ebp-12H]                     ; 3104 _ 0F BE. 45, EE
        mov     edx, dword [ebp+10H]                    ; 3108 _ 8B. 55, 10
        mov     dword [esp+14H], edx                    ; 310B _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 310F _ 89. 44 24, 10
        mov     dword [esp+0CH], 4                      ; 3113 _ C7. 44 24, 0C, 00000004
        mov     dword [esp+8H], 24                      ; 311B _ C7. 44 24, 08, 00000018
        mov     eax, dword [ebp+0CH]                    ; 3123 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 3126 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 312A _ 8B. 45, 08
        mov     dword [esp], eax                        ; 312D _ 89. 04 24
        call    showString                              ; 3130 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], 0                      ; 3135 _ C7. 45, F0, 00000000
        jmp     ?_161                                   ; 313C _ E9, 00000083

?_154:  mov     dword [ebp-0CH], 0                      ; 3141 _ C7. 45, F4, 00000000
        jmp     ?_160                                   ; 3148 _ EB, 70

?_155:  mov     eax, dword [ebp-10H]                    ; 314A _ 8B. 45, F0
        shl     eax, 4                                  ; 314D _ C1. E0, 04
        mov     edx, eax                                ; 3150 _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 3152 _ 8B. 45, F4
        add     eax, edx                                ; 3155 _ 01. D0
        add     eax, closebtn.2175                      ; 3157 _ 05, 00000260(d)
        movzx   eax, byte [eax]                         ; 315C _ 0F B6. 00
        mov     byte [ebp-11H], al                      ; 315F _ 88. 45, EF
        cmp     byte [ebp-11H], 64                      ; 3162 _ 80. 7D, EF, 40
        jnz     ?_156                                   ; 3166 _ 75, 06
        mov     byte [ebp-11H], 0                       ; 3168 _ C6. 45, EF, 00
        jmp     ?_159                                   ; 316C _ EB, 1C

?_156:  cmp     byte [ebp-11H], 36                      ; 316E _ 80. 7D, EF, 24
        jnz     ?_157                                   ; 3172 _ 75, 06
        mov     byte [ebp-11H], 15                      ; 3174 _ C6. 45, EF, 0F
        jmp     ?_159                                   ; 3178 _ EB, 10

?_157:  cmp     byte [ebp-11H], 81                      ; 317A _ 80. 7D, EF, 51
        jnz     ?_158                                   ; 317E _ 75, 06
        mov     byte [ebp-11H], 8                       ; 3180 _ C6. 45, EF, 08
        jmp     ?_159                                   ; 3184 _ EB, 04

?_158:  mov     byte [ebp-11H], 7                       ; 3186 _ C6. 45, EF, 07
?_159:  mov     eax, dword [ebp+0CH]                    ; 318A _ 8B. 45, 0C
        mov     edx, dword [eax]                        ; 318D _ 8B. 10
        mov     eax, dword [ebp-10H]                    ; 318F _ 8B. 45, F0
        lea     ecx, [eax+5H]                           ; 3192 _ 8D. 48, 05
        mov     eax, dword [ebp+0CH]                    ; 3195 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 3198 _ 8B. 40, 04
        imul    ecx, eax                                ; 319B _ 0F AF. C8
        mov     eax, dword [ebp+0CH]                    ; 319E _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 31A1 _ 8B. 40, 04
        lea     ebx, [eax-15H]                          ; 31A4 _ 8D. 58, EB
        mov     eax, dword [ebp-0CH]                    ; 31A7 _ 8B. 45, F4
        add     eax, ebx                                ; 31AA _ 01. D8
        add     eax, ecx                                ; 31AC _ 01. C8
        add     edx, eax                                ; 31AE _ 01. C2
        movzx   eax, byte [ebp-11H]                     ; 31B0 _ 0F B6. 45, EF
        mov     byte [edx], al                          ; 31B4 _ 88. 02
        add     dword [ebp-0CH], 1                      ; 31B6 _ 83. 45, F4, 01
?_160:  cmp     dword [ebp-0CH], 15                     ; 31BA _ 83. 7D, F4, 0F
        jle     ?_155                                   ; 31BE _ 7E, 8A
        add     dword [ebp-10H], 1                      ; 31C0 _ 83. 45, F0, 01
?_161:  cmp     dword [ebp-10H], 13                     ; 31C4 _ 83. 7D, F0, 0D
        jle     ?_154                                   ; 31C8 _ 0F 8E, FFFFFF73
        add     esp, 52                                 ; 31CE _ 83. C4, 34
        pop     ebx                                     ; 31D1 _ 5B
        pop     ebp                                     ; 31D2 _ 5D
        ret                                             ; 31D3 _ C3
; make_wtitle8 End of function

make_textbox8:; Function begin
        push    ebp                                     ; 31D4 _ 55
        mov     ebp, esp                                ; 31D5 _ 89. E5
        push    edi                                     ; 31D7 _ 57
        push    esi                                     ; 31D8 _ 56
        push    ebx                                     ; 31D9 _ 53
        sub     esp, 44                                 ; 31DA _ 83. EC, 2C
        mov     eax, dword [ebp+14H]                    ; 31DD _ 8B. 45, 14
        mov     edx, dword [ebp+0CH]                    ; 31E0 _ 8B. 55, 0C
        add     eax, edx                                ; 31E3 _ 01. D0
        mov     dword [ebp-10H], eax                    ; 31E5 _ 89. 45, F0
        mov     eax, dword [ebp+18H]                    ; 31E8 _ 8B. 45, 18
        mov     edx, dword [ebp+10H]                    ; 31EB _ 8B. 55, 10
        add     eax, edx                                ; 31EE _ 01. D0
        mov     dword [ebp-14H], eax                    ; 31F0 _ 89. 45, EC
        mov     eax, dword [ebp+10H]                    ; 31F3 _ 8B. 45, 10
        lea     edi, [eax-3H]                           ; 31F6 _ 8D. 78, FD
        mov     eax, dword [ebp-10H]                    ; 31F9 _ 8B. 45, F0
        lea     esi, [eax+1H]                           ; 31FC _ 8D. 70, 01
        mov     eax, dword [ebp+10H]                    ; 31FF _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 3202 _ 8D. 58, FD
        mov     eax, dword [ebp+0CH]                    ; 3205 _ 8B. 45, 0C
        lea     ecx, [eax-2H]                           ; 3208 _ 8D. 48, FE
        mov     eax, dword [ebp+8H]                     ; 320B _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 320E _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 3211 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 3214 _ 8B. 00
        mov     dword [esp+18H], edi                    ; 3216 _ 89. 7C 24, 18
        mov     dword [esp+14H], esi                    ; 321A _ 89. 74 24, 14
        mov     dword [esp+10H], ebx                    ; 321E _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 3222 _ 89. 4C 24, 0C
        mov     dword [esp+8H], 15                      ; 3226 _ C7. 44 24, 08, 0000000F
        mov     dword [esp+4H], edx                     ; 322E _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 3232 _ 89. 04 24
        call    boxfill8                                ; 3235 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-14H]                    ; 323A _ 8B. 45, EC
        lea     edi, [eax+1H]                           ; 323D _ 8D. 78, 01
        mov     eax, dword [ebp+0CH]                    ; 3240 _ 8B. 45, 0C
        lea     esi, [eax-3H]                           ; 3243 _ 8D. 70, FD
        mov     eax, dword [ebp+10H]                    ; 3246 _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 3249 _ 8D. 58, FD
        mov     eax, dword [ebp+0CH]                    ; 324C _ 8B. 45, 0C
        lea     ecx, [eax-3H]                           ; 324F _ 8D. 48, FD
        mov     eax, dword [ebp+8H]                     ; 3252 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 3255 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 3258 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 325B _ 8B. 00
        mov     dword [esp+18H], edi                    ; 325D _ 89. 7C 24, 18
        mov     dword [esp+14H], esi                    ; 3261 _ 89. 74 24, 14
        mov     dword [esp+10H], ebx                    ; 3265 _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 3269 _ 89. 4C 24, 0C
        mov     dword [esp+8H], 15                      ; 326D _ C7. 44 24, 08, 0000000F
        mov     dword [esp+4H], edx                     ; 3275 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 3279 _ 89. 04 24
        call    boxfill8                                ; 327C _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-14H]                    ; 3281 _ 8B. 45, EC
        lea     edi, [eax+2H]                           ; 3284 _ 8D. 78, 02
        mov     eax, dword [ebp-10H]                    ; 3287 _ 8B. 45, F0
        lea     esi, [eax+1H]                           ; 328A _ 8D. 70, 01
        mov     eax, dword [ebp-14H]                    ; 328D _ 8B. 45, EC
        lea     ebx, [eax+2H]                           ; 3290 _ 8D. 58, 02
        mov     eax, dword [ebp+0CH]                    ; 3293 _ 8B. 45, 0C
        lea     ecx, [eax-3H]                           ; 3296 _ 8D. 48, FD
        mov     eax, dword [ebp+8H]                     ; 3299 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 329C _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 329F _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 32A2 _ 8B. 00
        mov     dword [esp+18H], edi                    ; 32A4 _ 89. 7C 24, 18
        mov     dword [esp+14H], esi                    ; 32A8 _ 89. 74 24, 14
        mov     dword [esp+10H], ebx                    ; 32AC _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 32B0 _ 89. 4C 24, 0C
        mov     dword [esp+8H], 7                       ; 32B4 _ C7. 44 24, 08, 00000007
        mov     dword [esp+4H], edx                     ; 32BC _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 32C0 _ 89. 04 24
        call    boxfill8                                ; 32C3 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-14H]                    ; 32C8 _ 8B. 45, EC
        lea     edi, [eax+2H]                           ; 32CB _ 8D. 78, 02
        mov     eax, dword [ebp-10H]                    ; 32CE _ 8B. 45, F0
        lea     esi, [eax+2H]                           ; 32D1 _ 8D. 70, 02
        mov     eax, dword [ebp+10H]                    ; 32D4 _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 32D7 _ 8D. 58, FD
        mov     eax, dword [ebp-10H]                    ; 32DA _ 8B. 45, F0
        lea     ecx, [eax+2H]                           ; 32DD _ 8D. 48, 02
        mov     eax, dword [ebp+8H]                     ; 32E0 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 32E3 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 32E6 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 32E9 _ 8B. 00
        mov     dword [esp+18H], edi                    ; 32EB _ 89. 7C 24, 18
        mov     dword [esp+14H], esi                    ; 32EF _ 89. 74 24, 14
        mov     dword [esp+10H], ebx                    ; 32F3 _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 32F7 _ 89. 4C 24, 0C
        mov     dword [esp+8H], 7                       ; 32FB _ C7. 44 24, 08, 00000007
        mov     dword [esp+4H], edx                     ; 3303 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 3307 _ 89. 04 24
        call    boxfill8                                ; 330A _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 330F _ 8B. 45, 10
        lea     ecx, [eax-2H]                           ; 3312 _ 8D. 48, FE
        mov     eax, dword [ebp+10H]                    ; 3315 _ 8B. 45, 10
        lea     esi, [eax-2H]                           ; 3318 _ 8D. 70, FE
        mov     eax, dword [ebp+0CH]                    ; 331B _ 8B. 45, 0C
        lea     ebx, [eax-1H]                           ; 331E _ 8D. 58, FF
        mov     eax, dword [ebp+8H]                     ; 3321 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 3324 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 3327 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 332A _ 8B. 00
        mov     dword [esp+18H], ecx                    ; 332C _ 89. 4C 24, 18
        mov     ecx, dword [ebp-10H]                    ; 3330 _ 8B. 4D, F0
        mov     dword [esp+14H], ecx                    ; 3333 _ 89. 4C 24, 14
        mov     dword [esp+10H], esi                    ; 3337 _ 89. 74 24, 10
        mov     dword [esp+0CH], ebx                    ; 333B _ 89. 5C 24, 0C
        mov     dword [esp+8H], 0                       ; 333F _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], edx                     ; 3347 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 334B _ 89. 04 24
        call    boxfill8                                ; 334E _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+0CH]                    ; 3353 _ 8B. 45, 0C
        lea     edi, [eax-2H]                           ; 3356 _ 8D. 78, FE
        mov     eax, dword [ebp+10H]                    ; 3359 _ 8B. 45, 10
        lea     esi, [eax-2H]                           ; 335C _ 8D. 70, FE
        mov     eax, dword [ebp+0CH]                    ; 335F _ 8B. 45, 0C
        lea     ebx, [eax-2H]                           ; 3362 _ 8D. 58, FE
        mov     eax, dword [ebp+8H]                     ; 3365 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 3368 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 336B _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 336E _ 8B. 00
        mov     ecx, dword [ebp-14H]                    ; 3370 _ 8B. 4D, EC
        mov     dword [esp+18H], ecx                    ; 3373 _ 89. 4C 24, 18
        mov     dword [esp+14H], edi                    ; 3377 _ 89. 7C 24, 14
        mov     dword [esp+10H], esi                    ; 337B _ 89. 74 24, 10
        mov     dword [esp+0CH], ebx                    ; 337F _ 89. 5C 24, 0C
        mov     dword [esp+8H], 0                       ; 3383 _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], edx                     ; 338B _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 338F _ 89. 04 24
        call    boxfill8                                ; 3392 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-14H]                    ; 3397 _ 8B. 45, EC
        lea     ecx, [eax+1H]                           ; 339A _ 8D. 48, 01
        mov     eax, dword [ebp-14H]                    ; 339D _ 8B. 45, EC
        lea     esi, [eax+1H]                           ; 33A0 _ 8D. 70, 01
        mov     eax, dword [ebp+0CH]                    ; 33A3 _ 8B. 45, 0C
        lea     ebx, [eax-2H]                           ; 33A6 _ 8D. 58, FE
        mov     eax, dword [ebp+8H]                     ; 33A9 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 33AC _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 33AF _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 33B2 _ 8B. 00
        mov     dword [esp+18H], ecx                    ; 33B4 _ 89. 4C 24, 18
        mov     ecx, dword [ebp-10H]                    ; 33B8 _ 8B. 4D, F0
        mov     dword [esp+14H], ecx                    ; 33BB _ 89. 4C 24, 14
        mov     dword [esp+10H], esi                    ; 33BF _ 89. 74 24, 10
        mov     dword [esp+0CH], ebx                    ; 33C3 _ 89. 5C 24, 0C
        mov     dword [esp+8H], 8                       ; 33C7 _ C7. 44 24, 08, 00000008
        mov     dword [esp+4H], edx                     ; 33CF _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 33D3 _ 89. 04 24
        call    boxfill8                                ; 33D6 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-14H]                    ; 33DB _ 8B. 45, EC
        lea     edi, [eax+1H]                           ; 33DE _ 8D. 78, 01
        mov     eax, dword [ebp-10H]                    ; 33E1 _ 8B. 45, F0
        lea     esi, [eax+1H]                           ; 33E4 _ 8D. 70, 01
        mov     eax, dword [ebp+10H]                    ; 33E7 _ 8B. 45, 10
        lea     ebx, [eax-2H]                           ; 33EA _ 8D. 58, FE
        mov     eax, dword [ebp-10H]                    ; 33ED _ 8B. 45, F0
        lea     ecx, [eax+1H]                           ; 33F0 _ 8D. 48, 01
        mov     eax, dword [ebp+8H]                     ; 33F3 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 33F6 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 33F9 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 33FC _ 8B. 00
        mov     dword [esp+18H], edi                    ; 33FE _ 89. 7C 24, 18
        mov     dword [esp+14H], esi                    ; 3402 _ 89. 74 24, 14
        mov     dword [esp+10H], ebx                    ; 3406 _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 340A _ 89. 4C 24, 0C
        mov     dword [esp+8H], 8                       ; 340E _ C7. 44 24, 08, 00000008
        mov     dword [esp+4H], edx                     ; 3416 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 341A _ 89. 04 24
        call    boxfill8                                ; 341D _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 3422 _ 8B. 45, 10
        lea     edi, [eax-1H]                           ; 3425 _ 8D. 78, FF
        mov     eax, dword [ebp+0CH]                    ; 3428 _ 8B. 45, 0C
        lea     esi, [eax-1H]                           ; 342B _ 8D. 70, FF
        mov     eax, dword [ebp+1CH]                    ; 342E _ 8B. 45, 1C
        movzx   ecx, al                                 ; 3431 _ 0F B6. C8
        mov     eax, dword [ebp+8H]                     ; 3434 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 3437 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 343A _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 343D _ 8B. 00
        mov     ebx, dword [ebp-14H]                    ; 343F _ 8B. 5D, EC
        mov     dword [esp+18H], ebx                    ; 3442 _ 89. 5C 24, 18
        mov     ebx, dword [ebp-10H]                    ; 3446 _ 8B. 5D, F0
        mov     dword [esp+14H], ebx                    ; 3449 _ 89. 5C 24, 14
        mov     dword [esp+10H], edi                    ; 344D _ 89. 7C 24, 10
        mov     dword [esp+0CH], esi                    ; 3451 _ 89. 74 24, 0C
        mov     dword [esp+8H], ecx                     ; 3455 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 3459 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 345D _ 89. 04 24
        call    boxfill8                                ; 3460 _ E8, FFFFFFFC(rel)
        add     esp, 44                                 ; 3465 _ 83. C4, 2C
        pop     ebx                                     ; 3468 _ 5B
        pop     esi                                     ; 3469 _ 5E
        pop     edi                                     ; 346A _ 5F
        pop     ebp                                     ; 346B _ 5D
        ret                                             ; 346C _ C3
; make_textbox8 End of function

file_loadfile:; Function begin
        push    ebp                                     ; 346D _ 55
        mov     ebp, esp                                ; 346E _ 89. E5
        sub     esp, 56                                 ; 3470 _ 83. EC, 38
        mov     dword [ebp-0CH], 78848                  ; 3473 _ C7. 45, F4, 00013400
        mov     eax, dword [memman]                     ; 347A _ A1, 00000000(d)
        mov     dword [esp+4H], 13                      ; 347F _ C7. 44 24, 04, 0000000D
        mov     dword [esp], eax                        ; 3487 _ 89. 04 24
        call    memman_alloc                            ; 348A _ E8, FFFFFFFC(rel)
        mov     dword [ebp-1CH], eax                    ; 348F _ 89. 45, E4
        mov     eax, dword [ebp-1CH]                    ; 3492 _ 8B. 45, E4
        add     eax, 12                                 ; 3495 _ 83. C0, 0C
        mov     byte [eax], 0                           ; 3498 _ C6. 00, 00
        jmp     ?_172                                   ; 349B _ E9, 0000011E

?_162:  mov     dword [ebp-10H], 0                      ; 34A0 _ C7. 45, F0, 00000000
        jmp     ?_165                                   ; 34A7 _ EB, 2C

?_163:  mov     edx, dword [ebp-0CH]                    ; 34A9 _ 8B. 55, F4
        mov     eax, dword [ebp-10H]                    ; 34AC _ 8B. 45, F0
        add     eax, edx                                ; 34AF _ 01. D0
        movzx   eax, byte [eax]                         ; 34B1 _ 0F B6. 00
        test    al, al                                  ; 34B4 _ 84. C0
        jz      ?_164                                   ; 34B6 _ 74, 1B
        mov     edx, dword [ebp-10H]                    ; 34B8 _ 8B. 55, F0
        mov     eax, dword [ebp-1CH]                    ; 34BB _ 8B. 45, E4
        add     edx, eax                                ; 34BE _ 01. C2
        mov     ecx, dword [ebp-0CH]                    ; 34C0 _ 8B. 4D, F4
        mov     eax, dword [ebp-10H]                    ; 34C3 _ 8B. 45, F0
        add     eax, ecx                                ; 34C6 _ 01. C8
        movzx   eax, byte [eax]                         ; 34C8 _ 0F B6. 00
        mov     byte [edx], al                          ; 34CB _ 88. 02
        add     dword [ebp-10H], 1                      ; 34CD _ 83. 45, F0, 01
        jmp     ?_165                                   ; 34D1 _ EB, 02

?_164:  jmp     ?_166                                   ; 34D3 _ EB, 06

?_165:  cmp     dword [ebp-10H], 7                      ; 34D5 _ 83. 7D, F0, 07
        jle     ?_163                                   ; 34D9 _ 7E, CE
?_166:  mov     dword [ebp-14H], 0                      ; 34DB _ C7. 45, EC, 00000000
        mov     edx, dword [ebp-10H]                    ; 34E2 _ 8B. 55, F0
        mov     eax, dword [ebp-1CH]                    ; 34E5 _ 8B. 45, E4
        add     eax, edx                                ; 34E8 _ 01. D0
        mov     byte [eax], 46                          ; 34EA _ C6. 00, 2E
        add     dword [ebp-10H], 1                      ; 34ED _ 83. 45, F0, 01
        mov     dword [ebp-14H], 0                      ; 34F1 _ C7. 45, EC, 00000000
        jmp     ?_168                                   ; 34F8 _ EB, 1E

?_167:  mov     edx, dword [ebp-10H]                    ; 34FA _ 8B. 55, F0
        mov     eax, dword [ebp-1CH]                    ; 34FD _ 8B. 45, E4
        add     edx, eax                                ; 3500 _ 01. C2
        mov     ecx, dword [ebp-0CH]                    ; 3502 _ 8B. 4D, F4
        mov     eax, dword [ebp-14H]                    ; 3505 _ 8B. 45, EC
        add     eax, ecx                                ; 3508 _ 01. C8
        movzx   eax, byte [eax+8H]                      ; 350A _ 0F B6. 40, 08
        mov     byte [edx], al                          ; 350E _ 88. 02
        add     dword [ebp-10H], 1                      ; 3510 _ 83. 45, F0, 01
        add     dword [ebp-14H], 1                      ; 3514 _ 83. 45, EC, 01
?_168:  cmp     dword [ebp-14H], 2                      ; 3518 _ 83. 7D, EC, 02
        jle     ?_167                                   ; 351C _ 7E, DC
        mov     eax, dword [ebp-1CH]                    ; 351E _ 8B. 45, E4
        mov     dword [esp+4H], eax                     ; 3521 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 3525 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3528 _ 89. 04 24
        call    strcmp                                  ; 352B _ E8, FFFFFFFC(rel)
        cmp     eax, 1                                  ; 3530 _ 83. F8, 01
        jne     ?_171                                   ; 3533 _ 0F 85, 00000081
        mov     eax, dword [ebp-0CH]                    ; 3539 _ 8B. 45, F4
        mov     edx, dword [eax+1CH]                    ; 353C _ 8B. 50, 1C
        mov     eax, dword [memman]                     ; 353F _ A1, 00000000(d)
        mov     dword [esp+4H], edx                     ; 3544 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 3548 _ 89. 04 24
        call    memman_alloc_4k                         ; 354B _ E8, FFFFFFFC(rel)
        mov     edx, eax                                ; 3550 _ 89. C2
        mov     eax, dword [ebp+0CH]                    ; 3552 _ 8B. 45, 0C
        mov     dword [eax], edx                        ; 3555 _ 89. 10
        mov     eax, dword [ebp-0CH]                    ; 3557 _ 8B. 45, F4
        mov     eax, dword [eax+1CH]                    ; 355A _ 8B. 40, 1C
        mov     edx, eax                                ; 355D _ 89. C2
        mov     eax, dword [ebp+0CH]                    ; 355F _ 8B. 45, 0C
        mov     dword [eax+8H], edx                     ; 3562 _ 89. 50, 08
        mov     dword [ebp-20H], 88064                  ; 3565 _ C7. 45, E0, 00015800
        mov     eax, dword [ebp-0CH]                    ; 356C _ 8B. 45, F4
        movzx   eax, word [eax+1AH]                     ; 356F _ 0F B7. 40, 1A
        movzx   eax, ax                                 ; 3573 _ 0F B7. C0
        shl     eax, 9                                  ; 3576 _ C1. E0, 09
        add     dword [ebp-20H], eax                    ; 3579 _ 01. 45, E0
        mov     eax, dword [ebp-0CH]                    ; 357C _ 8B. 45, F4
        mov     eax, dword [eax+1CH]                    ; 357F _ 8B. 40, 1C
        mov     dword [ebp-24H], eax                    ; 3582 _ 89. 45, DC
        mov     dword [ebp-18H], 0                      ; 3585 _ C7. 45, E8, 00000000
        mov     dword [ebp-18H], 0                      ; 358C _ C7. 45, E8, 00000000
        jmp     ?_170                                   ; 3593 _ EB, 1B

?_169:  mov     eax, dword [ebp+0CH]                    ; 3595 _ 8B. 45, 0C
        mov     edx, dword [eax]                        ; 3598 _ 8B. 10
        mov     eax, dword [ebp-18H]                    ; 359A _ 8B. 45, E8
        add     edx, eax                                ; 359D _ 01. C2
        mov     ecx, dword [ebp-18H]                    ; 359F _ 8B. 4D, E8
        mov     eax, dword [ebp-20H]                    ; 35A2 _ 8B. 45, E0
        add     eax, ecx                                ; 35A5 _ 01. C8
        movzx   eax, byte [eax]                         ; 35A7 _ 0F B6. 00
        mov     byte [edx], al                          ; 35AA _ 88. 02
        add     dword [ebp-18H], 1                      ; 35AC _ 83. 45, E8, 01
?_170:  mov     eax, dword [ebp-18H]                    ; 35B0 _ 8B. 45, E8
        cmp     eax, dword [ebp-24H]                    ; 35B3 _ 3B. 45, DC
        jl      ?_169                                   ; 35B6 _ 7C, DD
        jmp     ?_173                                   ; 35B8 _ EB, 12

?_171:  add     dword [ebp-0CH], 32                     ; 35BA _ 83. 45, F4, 20
?_172:  mov     eax, dword [ebp-0CH]                    ; 35BE _ 8B. 45, F4
        movzx   eax, byte [eax]                         ; 35C1 _ 0F B6. 00
        test    al, al                                  ; 35C4 _ 84. C0
        jne     ?_162                                   ; 35C6 _ 0F 85, FFFFFED4
?_173:  mov     edx, dword [ebp-1CH]                    ; 35CC _ 8B. 55, E4
        mov     eax, dword [memman]                     ; 35CF _ A1, 00000000(d)
        mov     dword [esp+8H], 13                      ; 35D4 _ C7. 44 24, 08, 0000000D
        mov     dword [esp+4H], edx                     ; 35DC _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 35E0 _ 89. 04 24
        call    memman_free                             ; 35E3 _ E8, FFFFFFFC(rel)
        leave                                           ; 35E8 _ C9
        ret                                             ; 35E9 _ C3
; file_loadfile End of function

intHandlerForStackOverFlow:; Function begin
        push    ebp                                     ; 35EA _ 55
        mov     ebp, esp                                ; 35EB _ 89. E5
        sub     esp, 40                                 ; 35ED _ 83. EC, 28
        mov     dword [?_328], 8                        ; 35F0 _ C7. 05, 0000000C(d), 00000008
        mov     dword [esp], ?_321                      ; 35FA _ C7. 04 24, 00000078(d)
        call    cons_putstr                             ; 3601 _ E8, FFFFFFFC(rel)
        mov     dword [?_328], 8                        ; 3606 _ C7. 05, 0000000C(d), 00000008
        mov     eax, dword [?_329]                      ; 3610 _ A1, 00000010(d)
        add     eax, 16                                 ; 3615 _ 83. C0, 10
        mov     dword [?_329], eax                      ; 3618 _ A3, 00000010(d)
        mov     dword [esp], ?_322                      ; 361D _ C7. 04 24, 0000007F(d)
        call    cons_putstr                             ; 3624 _ E8, FFFFFFFC(rel)
        mov     dword [?_328], 8                        ; 3629 _ C7. 05, 0000000C(d), 00000008
        mov     eax, dword [?_329]                      ; 3633 _ A1, 00000010(d)
        add     eax, 16                                 ; 3638 _ 83. C0, 10
        mov     dword [?_329], eax                      ; 363B _ A3, 00000010(d)
        mov     eax, dword [ebp+8H]                     ; 3640 _ 8B. 45, 08
        add     eax, 44                                 ; 3643 _ 83. C0, 2C
        mov     eax, dword [eax]                        ; 3646 _ 8B. 00
        mov     dword [esp], eax                        ; 3648 _ 89. 04 24
        call    intToHexStr                             ; 364B _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 3650 _ 89. 45, F4
        mov     dword [esp], ?_323                      ; 3653 _ C7. 04 24, 0000008F(d)
        call    cons_putstr                             ; 365A _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 365F _ 8B. 45, F4
        mov     dword [esp], eax                        ; 3662 _ 89. 04 24
        call    cons_putstr                             ; 3665 _ E8, FFFFFFFC(rel)
        mov     dword [?_328], 8                        ; 366A _ C7. 05, 0000000C(d), 00000008
        mov     eax, dword [?_329]                      ; 3674 _ A1, 00000010(d)
        add     eax, 16                                 ; 3679 _ 83. C0, 10
        mov     dword [?_329], eax                      ; 367C _ A3, 00000010(d)
        call    task_now                                ; 3681 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 3686 _ 89. 45, F0
        mov     eax, dword [ebp-10H]                    ; 3689 _ 8B. 45, F0
        add     eax, 48                                 ; 368C _ 83. C0, 30
        leave                                           ; 368F _ C9
        ret                                             ; 3690 _ C3
; intHandlerForStackOverFlow End of function

intHandlerForException:; Function begin
        push    ebp                                     ; 3691 _ 55
        mov     ebp, esp                                ; 3692 _ 89. E5
        sub     esp, 40                                 ; 3694 _ 83. EC, 28
        mov     dword [?_328], 8                        ; 3697 _ C7. 05, 0000000C(d), 00000008
        mov     dword [esp], ?_324                      ; 36A1 _ C7. 04 24, 00000096(d)
        call    cons_putstr                             ; 36A8 _ E8, FFFFFFFC(rel)
        mov     dword [?_328], 8                        ; 36AD _ C7. 05, 0000000C(d), 00000008
        mov     eax, dword [?_329]                      ; 36B7 _ A1, 00000010(d)
        add     eax, 16                                 ; 36BC _ 83. C0, 10
        mov     dword [?_329], eax                      ; 36BF _ A3, 00000010(d)
        mov     dword [esp], ?_325                      ; 36C4 _ C7. 04 24, 0000009E(d)
        call    cons_putstr                             ; 36CB _ E8, FFFFFFFC(rel)
        mov     eax, dword [?_329]                      ; 36D0 _ A1, 00000010(d)
        add     eax, 16                                 ; 36D5 _ 83. C0, 10
        mov     dword [?_329], eax                      ; 36D8 _ A3, 00000010(d)
        mov     dword [?_328], 8                        ; 36DD _ C7. 05, 0000000C(d), 00000008
        call    task_now                                ; 36E7 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 36EC _ 89. 45, F4
        mov     eax, dword [ebp-0CH]                    ; 36EF _ 8B. 45, F4
        add     eax, 48                                 ; 36F2 _ 83. C0, 30
        leave                                           ; 36F5 _ C9
        ret                                             ; 36F6 _ C3
; intHandlerForException End of function

memman_init:; Function begin
        push    ebp                                     ; 36F7 _ 55
        mov     ebp, esp                                ; 36F8 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 36FA _ 8B. 45, 08
        mov     dword [eax], 0                          ; 36FD _ C7. 00, 00000000
        mov     eax, dword [ebp+8H]                     ; 3703 _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 3706 _ C7. 40, 04, 00000000
        mov     eax, dword [ebp+8H]                     ; 370D _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 3710 _ C7. 40, 08, 00000000
        mov     eax, dword [ebp+8H]                     ; 3717 _ 8B. 45, 08
        mov     dword [eax+0CH], 0                      ; 371A _ C7. 40, 0C, 00000000
        pop     ebp                                     ; 3721 _ 5D
        ret                                             ; 3722 _ C3
; memman_init End of function

memman_total:; Function begin
        push    ebp                                     ; 3723 _ 55
        mov     ebp, esp                                ; 3724 _ 89. E5
        sub     esp, 16                                 ; 3726 _ 83. EC, 10
        mov     dword [ebp-4H], 0                       ; 3729 _ C7. 45, FC, 00000000
        mov     dword [ebp-8H], 0                       ; 3730 _ C7. 45, F8, 00000000
        jmp     ?_175                                   ; 3737 _ EB, 14

?_174:  mov     eax, dword [ebp+8H]                     ; 3739 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 373C _ 8B. 55, F8
        add     edx, 2                                  ; 373F _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 3742 _ 8B. 44 D0, 04
        add     dword [ebp-4H], eax                     ; 3746 _ 01. 45, FC
        add     dword [ebp-8H], 1                       ; 3749 _ 83. 45, F8, 01
?_175:  mov     eax, dword [ebp+8H]                     ; 374D _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 3750 _ 8B. 00
        cmp     eax, dword [ebp-8H]                     ; 3752 _ 3B. 45, F8
        ja      ?_174                                   ; 3755 _ 77, E2
        mov     eax, dword [ebp-4H]                     ; 3757 _ 8B. 45, FC
        leave                                           ; 375A _ C9
        ret                                             ; 375B _ C3
; memman_total End of function

memman_alloc:; Function begin
        push    ebp                                     ; 375C _ 55
        mov     ebp, esp                                ; 375D _ 89. E5
        sub     esp, 16                                 ; 375F _ 83. EC, 10
        mov     dword [ebp-8H], 0                       ; 3762 _ C7. 45, F8, 00000000
        jmp     ?_179                                   ; 3769 _ E9, 00000085

?_176:  mov     eax, dword [ebp+8H]                     ; 376E _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 3771 _ 8B. 55, F8
        add     edx, 2                                  ; 3774 _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 3777 _ 8B. 44 D0, 04
        cmp     eax, dword [ebp+0CH]                    ; 377B _ 3B. 45, 0C
        jc      ?_178                                   ; 377E _ 72, 6F
        mov     eax, dword [ebp+8H]                     ; 3780 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 3783 _ 8B. 55, F8
        add     edx, 2                                  ; 3786 _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 3789 _ 8B. 04 D0
        mov     dword [ebp-4H], eax                     ; 378C _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 378F _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 3792 _ 8B. 55, F8
        add     edx, 2                                  ; 3795 _ 83. C2, 02
        mov     edx, dword [eax+edx*8]                  ; 3798 _ 8B. 14 D0
        mov     eax, dword [ebp+0CH]                    ; 379B _ 8B. 45, 0C
        lea     ecx, [edx+eax]                          ; 379E _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 37A1 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 37A4 _ 8B. 55, F8
        add     edx, 2                                  ; 37A7 _ 83. C2, 02
        mov     dword [eax+edx*8], ecx                  ; 37AA _ 89. 0C D0
        mov     eax, dword [ebp+8H]                     ; 37AD _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 37B0 _ 8B. 55, F8
        add     edx, 2                                  ; 37B3 _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 37B6 _ 8B. 44 D0, 04
        sub     eax, dword [ebp+0CH]                    ; 37BA _ 2B. 45, 0C
        mov     edx, eax                                ; 37BD _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 37BF _ 8B. 45, 08
        mov     ecx, dword [ebp-8H]                     ; 37C2 _ 8B. 4D, F8
        add     ecx, 2                                  ; 37C5 _ 83. C1, 02
        mov     dword [eax+ecx*8+4H], edx               ; 37C8 _ 89. 54 C8, 04
        mov     eax, dword [ebp+8H]                     ; 37CC _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 37CF _ 8B. 55, F8
        add     edx, 2                                  ; 37D2 _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 37D5 _ 8B. 44 D0, 04
        test    eax, eax                                ; 37D9 _ 85. C0
        jnz     ?_177                                   ; 37DB _ 75, 0D
        mov     eax, dword [ebp+8H]                     ; 37DD _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 37E0 _ 8B. 00
        lea     edx, [eax-1H]                           ; 37E2 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 37E5 _ 8B. 45, 08
        mov     dword [eax], edx                        ; 37E8 _ 89. 10
?_177:  mov     eax, dword [ebp-4H]                     ; 37EA _ 8B. 45, FC
        jmp     ?_180                                   ; 37ED _ EB, 17

?_178:  add     dword [ebp-8H], 1                       ; 37EF _ 83. 45, F8, 01
?_179:  mov     eax, dword [ebp+8H]                     ; 37F3 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 37F6 _ 8B. 00
        cmp     eax, dword [ebp-8H]                     ; 37F8 _ 3B. 45, F8
        ja      ?_176                                   ; 37FB _ 0F 87, FFFFFF6D
        mov     eax, 0                                  ; 3801 _ B8, 00000000
?_180:  leave                                           ; 3806 _ C9
        ret                                             ; 3807 _ C3
; memman_alloc End of function

memman_free:; Function begin
        push    ebp                                     ; 3808 _ 55
        mov     ebp, esp                                ; 3809 _ 89. E5
        push    ebx                                     ; 380B _ 53
        sub     esp, 16                                 ; 380C _ 83. EC, 10
        mov     dword [ebp-0CH], 0                      ; 380F _ C7. 45, F4, 00000000
        jmp     ?_183                                   ; 3816 _ EB, 17

?_181:  mov     eax, dword [ebp+8H]                     ; 3818 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 381B _ 8B. 55, F4
        add     edx, 2                                  ; 381E _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 3821 _ 8B. 04 D0
        cmp     eax, dword [ebp+0CH]                    ; 3824 _ 3B. 45, 0C
        jbe     ?_182                                   ; 3827 _ 76, 02
        jmp     ?_184                                   ; 3829 _ EB, 0E

?_182:  add     dword [ebp-0CH], 1                      ; 382B _ 83. 45, F4, 01
?_183:  mov     eax, dword [ebp+8H]                     ; 382F _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 3832 _ 8B. 00
        cmp     eax, dword [ebp-0CH]                    ; 3834 _ 3B. 45, F4
        jg      ?_181                                   ; 3837 _ 7F, DF
?_184:  cmp     dword [ebp-0CH], 0                      ; 3839 _ 83. 7D, F4, 00
        jle     ?_186                                   ; 383D _ 0F 8E, 000000BA
        mov     eax, dword [ebp-0CH]                    ; 3843 _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 3846 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 3849 _ 8B. 45, 08
        add     edx, 2                                  ; 384C _ 83. C2, 02
        mov     edx, dword [eax+edx*8]                  ; 384F _ 8B. 14 D0
        mov     eax, dword [ebp-0CH]                    ; 3852 _ 8B. 45, F4
        lea     ecx, [eax-1H]                           ; 3855 _ 8D. 48, FF
        mov     eax, dword [ebp+8H]                     ; 3858 _ 8B. 45, 08
        add     ecx, 2                                  ; 385B _ 83. C1, 02
        mov     eax, dword [eax+ecx*8+4H]               ; 385E _ 8B. 44 C8, 04
        add     eax, edx                                ; 3862 _ 01. D0
        cmp     eax, dword [ebp+0CH]                    ; 3864 _ 3B. 45, 0C
        jne     ?_186                                   ; 3867 _ 0F 85, 00000090
        mov     eax, dword [ebp-0CH]                    ; 386D _ 8B. 45, F4
        lea     ebx, [eax-1H]                           ; 3870 _ 8D. 58, FF
        mov     eax, dword [ebp-0CH]                    ; 3873 _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 3876 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 3879 _ 8B. 45, 08
        add     edx, 2                                  ; 387C _ 83. C2, 02
        mov     edx, dword [eax+edx*8+4H]               ; 387F _ 8B. 54 D0, 04
        mov     eax, dword [ebp+10H]                    ; 3883 _ 8B. 45, 10
        lea     ecx, [edx+eax]                          ; 3886 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 3889 _ 8B. 45, 08
        lea     edx, [ebx+2H]                           ; 388C _ 8D. 53, 02
        mov     dword [eax+edx*8+4H], ecx               ; 388F _ 89. 4C D0, 04
        mov     eax, dword [ebp+8H]                     ; 3893 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 3896 _ 8B. 00
        cmp     eax, dword [ebp-0CH]                    ; 3898 _ 3B. 45, F4
        jle     ?_185                                   ; 389B _ 7E, 56
        mov     eax, dword [ebp+10H]                    ; 389D _ 8B. 45, 10
        mov     edx, dword [ebp+0CH]                    ; 38A0 _ 8B. 55, 0C
        lea     ecx, [edx+eax]                          ; 38A3 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 38A6 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 38A9 _ 8B. 55, F4
        add     edx, 2                                  ; 38AC _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 38AF _ 8B. 04 D0
        cmp     ecx, eax                                ; 38B2 _ 39. C1
        jnz     ?_185                                   ; 38B4 _ 75, 3D
        mov     eax, dword [ebp-0CH]                    ; 38B6 _ 8B. 45, F4
        lea     ebx, [eax-1H]                           ; 38B9 _ 8D. 58, FF
        mov     eax, dword [ebp-0CH]                    ; 38BC _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 38BF _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 38C2 _ 8B. 45, 08
        add     edx, 2                                  ; 38C5 _ 83. C2, 02
        mov     edx, dword [eax+edx*8+4H]               ; 38C8 _ 8B. 54 D0, 04
        mov     eax, dword [ebp+8H]                     ; 38CC _ 8B. 45, 08
        mov     ecx, dword [ebp-0CH]                    ; 38CF _ 8B. 4D, F4
        add     ecx, 2                                  ; 38D2 _ 83. C1, 02
        mov     eax, dword [eax+ecx*8+4H]               ; 38D5 _ 8B. 44 C8, 04
        lea     ecx, [edx+eax]                          ; 38D9 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 38DC _ 8B. 45, 08
        lea     edx, [ebx+2H]                           ; 38DF _ 8D. 53, 02
        mov     dword [eax+edx*8+4H], ecx               ; 38E2 _ 89. 4C D0, 04
        mov     eax, dword [ebp+8H]                     ; 38E6 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 38E9 _ 8B. 00
        lea     edx, [eax-1H]                           ; 38EB _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 38EE _ 8B. 45, 08
        mov     dword [eax], edx                        ; 38F1 _ 89. 10
?_185:  mov     eax, 0                                  ; 38F3 _ B8, 00000000
        jmp     ?_192                                   ; 38F8 _ E9, 0000011C

?_186:  mov     eax, dword [ebp+8H]                     ; 38FD _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 3900 _ 8B. 00
        cmp     eax, dword [ebp-0CH]                    ; 3902 _ 3B. 45, F4
        jle     ?_187                                   ; 3905 _ 7E, 52
        mov     eax, dword [ebp+10H]                    ; 3907 _ 8B. 45, 10
        mov     edx, dword [ebp+0CH]                    ; 390A _ 8B. 55, 0C
        lea     ecx, [edx+eax]                          ; 390D _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 3910 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 3913 _ 8B. 55, F4
        add     edx, 2                                  ; 3916 _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 3919 _ 8B. 04 D0
        cmp     ecx, eax                                ; 391C _ 39. C1
        jnz     ?_187                                   ; 391E _ 75, 39
        mov     eax, dword [ebp+8H]                     ; 3920 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 3923 _ 8B. 55, F4
        lea     ecx, [edx+2H]                           ; 3926 _ 8D. 4A, 02
        mov     edx, dword [ebp+0CH]                    ; 3929 _ 8B. 55, 0C
        mov     dword [eax+ecx*8], edx                  ; 392C _ 89. 14 C8
        mov     eax, dword [ebp+8H]                     ; 392F _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 3932 _ 8B. 55, F4
        add     edx, 2                                  ; 3935 _ 83. C2, 02
        mov     edx, dword [eax+edx*8+4H]               ; 3938 _ 8B. 54 D0, 04
        mov     eax, dword [ebp+10H]                    ; 393C _ 8B. 45, 10
        lea     ecx, [edx+eax]                          ; 393F _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 3942 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 3945 _ 8B. 55, F4
        add     edx, 2                                  ; 3948 _ 83. C2, 02
        mov     dword [eax+edx*8+4H], ecx               ; 394B _ 89. 4C D0, 04
        mov     eax, 0                                  ; 394F _ B8, 00000000
        jmp     ?_192                                   ; 3954 _ E9, 000000C0

?_187:  mov     eax, dword [ebp+8H]                     ; 3959 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 395C _ 8B. 00
        cmp     eax, 4095                               ; 395E _ 3D, 00000FFF
        jg      ?_191                                   ; 3963 _ 0F 8F, 00000087
        mov     eax, dword [ebp+8H]                     ; 3969 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 396C _ 8B. 00
        mov     dword [ebp-8H], eax                     ; 396E _ 89. 45, F8
        jmp     ?_189                                   ; 3971 _ EB, 28

?_188:  mov     eax, dword [ebp-8H]                     ; 3973 _ 8B. 45, F8
        lea     edx, [eax-1H]                           ; 3976 _ 8D. 50, FF
        mov     ecx, dword [ebp+8H]                     ; 3979 _ 8B. 4D, 08
        mov     eax, dword [ebp-8H]                     ; 397C _ 8B. 45, F8
        lea     ebx, [eax+2H]                           ; 397F _ 8D. 58, 02
        mov     eax, dword [ebp+8H]                     ; 3982 _ 8B. 45, 08
        add     edx, 2                                  ; 3985 _ 83. C2, 02
        lea     edx, [eax+edx*8]                        ; 3988 _ 8D. 14 D0
        mov     eax, dword [edx]                        ; 398B _ 8B. 02
        mov     edx, dword [edx+4H]                     ; 398D _ 8B. 52, 04
        mov     dword [ecx+ebx*8], eax                  ; 3990 _ 89. 04 D9
        mov     dword [ecx+ebx*8+4H], edx               ; 3993 _ 89. 54 D9, 04
        sub     dword [ebp-8H], 1                       ; 3997 _ 83. 6D, F8, 01
?_189:  mov     eax, dword [ebp-8H]                     ; 399B _ 8B. 45, F8
        cmp     eax, dword [ebp-0CH]                    ; 399E _ 3B. 45, F4
        jg      ?_188                                   ; 39A1 _ 7F, D0
        mov     eax, dword [ebp+8H]                     ; 39A3 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 39A6 _ 8B. 00
        lea     edx, [eax+1H]                           ; 39A8 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 39AB _ 8B. 45, 08
        mov     dword [eax], edx                        ; 39AE _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 39B0 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 39B3 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 39B6 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 39B9 _ 8B. 00
        cmp     edx, eax                                ; 39BB _ 39. C2
        jge     ?_190                                   ; 39BD _ 7D, 0B
        mov     eax, dword [ebp+8H]                     ; 39BF _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 39C2 _ 8B. 10
        mov     eax, dword [ebp+8H]                     ; 39C4 _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 39C7 _ 89. 50, 04
?_190:  mov     eax, dword [ebp+8H]                     ; 39CA _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 39CD _ 8B. 55, F4
        lea     ecx, [edx+2H]                           ; 39D0 _ 8D. 4A, 02
        mov     edx, dword [ebp+0CH]                    ; 39D3 _ 8B. 55, 0C
        mov     dword [eax+ecx*8], edx                  ; 39D6 _ 89. 14 C8
        mov     eax, dword [ebp+8H]                     ; 39D9 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 39DC _ 8B. 55, F4
        lea     ecx, [edx+2H]                           ; 39DF _ 8D. 4A, 02
        mov     edx, dword [ebp+10H]                    ; 39E2 _ 8B. 55, 10
        mov     dword [eax+ecx*8+4H], edx               ; 39E5 _ 89. 54 C8, 04
        mov     eax, 0                                  ; 39E9 _ B8, 00000000
        jmp     ?_192                                   ; 39EE _ EB, 29

?_191:  mov     eax, dword [ebp+8H]                     ; 39F0 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 39F3 _ 8B. 40, 0C
        lea     edx, [eax+1H]                           ; 39F6 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 39F9 _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 39FC _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 39FF _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 3A02 _ 8B. 40, 08
        mov     edx, eax                                ; 3A05 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 3A07 _ 8B. 45, 10
        add     eax, edx                                ; 3A0A _ 01. D0
        mov     edx, eax                                ; 3A0C _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 3A0E _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 3A11 _ 89. 50, 08
        mov     eax, 4294967295                         ; 3A14 _ B8, FFFFFFFF
?_192:  add     esp, 16                                 ; 3A19 _ 83. C4, 10
        pop     ebx                                     ; 3A1C _ 5B
        pop     ebp                                     ; 3A1D _ 5D
        ret                                             ; 3A1E _ C3
; memman_free End of function

memman_alloc_4k:; Function begin
        push    ebp                                     ; 3A1F _ 55
        mov     ebp, esp                                ; 3A20 _ 89. E5
        sub     esp, 24                                 ; 3A22 _ 83. EC, 18
        mov     eax, dword [ebp+0CH]                    ; 3A25 _ 8B. 45, 0C
        add     eax, 4095                               ; 3A28 _ 05, 00000FFF
        and     eax, 0FFFFF000H                         ; 3A2D _ 25, FFFFF000
        mov     dword [ebp+0CH], eax                    ; 3A32 _ 89. 45, 0C
        mov     eax, dword [ebp+0CH]                    ; 3A35 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 3A38 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 3A3C _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3A3F _ 89. 04 24
        call    memman_alloc                            ; 3A42 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-4H], eax                     ; 3A47 _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 3A4A _ 8B. 45, FC
        leave                                           ; 3A4D _ C9
        ret                                             ; 3A4E _ C3
; memman_alloc_4k End of function

memman_free_4k:; Function begin
        push    ebp                                     ; 3A4F _ 55
        mov     ebp, esp                                ; 3A50 _ 89. E5
        sub     esp, 28                                 ; 3A52 _ 83. EC, 1C
        mov     eax, dword [ebp+10H]                    ; 3A55 _ 8B. 45, 10
        add     eax, 4095                               ; 3A58 _ 05, 00000FFF
        and     eax, 0FFFFF000H                         ; 3A5D _ 25, FFFFF000
        mov     dword [ebp+10H], eax                    ; 3A62 _ 89. 45, 10
        mov     eax, dword [ebp+10H]                    ; 3A65 _ 8B. 45, 10
        mov     dword [esp+8H], eax                     ; 3A68 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 3A6C _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 3A6F _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 3A73 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3A76 _ 89. 04 24
        call    memman_free                             ; 3A79 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-4H], eax                     ; 3A7E _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 3A81 _ 8B. 45, FC
        leave                                           ; 3A84 _ C9
        ret                                             ; 3A85 _ C3
; memman_free_4k End of function

shtctl_init:; Function begin
        push    ebp                                     ; 3A86 _ 55
        mov     ebp, esp                                ; 3A87 _ 89. E5
        sub     esp, 40                                 ; 3A89 _ 83. EC, 28
        mov     dword [esp+4H], 9232                    ; 3A8C _ C7. 44 24, 04, 00002410
        mov     eax, dword [ebp+8H]                     ; 3A94 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3A97 _ 89. 04 24
        call    memman_alloc_4k                         ; 3A9A _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 3A9F _ 89. 45, F4
        cmp     dword [ebp-0CH], 0                      ; 3AA2 _ 83. 7D, F4, 00
        jnz     ?_193                                   ; 3AA6 _ 75, 0A
        mov     eax, 0                                  ; 3AA8 _ B8, 00000000
        jmp     ?_197                                   ; 3AAD _ E9, 0000009D

?_193:  mov     eax, dword [ebp+10H]                    ; 3AB2 _ 8B. 45, 10
        imul    eax, dword [ebp+14H]                    ; 3AB5 _ 0F AF. 45, 14
        mov     dword [esp+4H], eax                     ; 3AB9 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 3ABD _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3AC0 _ 89. 04 24
        call    memman_alloc_4k                         ; 3AC3 _ E8, FFFFFFFC(rel)
        mov     edx, eax                                ; 3AC8 _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 3ACA _ 8B. 45, F4
        mov     dword [eax+4H], edx                     ; 3ACD _ 89. 50, 04
        mov     eax, dword [ebp-0CH]                    ; 3AD0 _ 8B. 45, F4
        mov     eax, dword [eax+4H]                     ; 3AD3 _ 8B. 40, 04
        test    eax, eax                                ; 3AD6 _ 85. C0
        jnz     ?_194                                   ; 3AD8 _ 75, 21
        mov     eax, dword [ebp-0CH]                    ; 3ADA _ 8B. 45, F4
        mov     dword [esp+8H], 9232                    ; 3ADD _ C7. 44 24, 08, 00002410
        mov     dword [esp+4H], eax                     ; 3AE5 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 3AE9 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3AEC _ 89. 04 24
        call    memman_free_4k                          ; 3AEF _ E8, FFFFFFFC(rel)
        mov     eax, 0                                  ; 3AF4 _ B8, 00000000
        jmp     ?_197                                   ; 3AF9 _ EB, 54

?_194:  mov     eax, dword [ebp-0CH]                    ; 3AFB _ 8B. 45, F4
        mov     edx, dword [ebp+0CH]                    ; 3AFE _ 8B. 55, 0C
        mov     dword [eax], edx                        ; 3B01 _ 89. 10
        mov     eax, dword [ebp-0CH]                    ; 3B03 _ 8B. 45, F4
        mov     edx, dword [ebp+10H]                    ; 3B06 _ 8B. 55, 10
        mov     dword [eax+8H], edx                     ; 3B09 _ 89. 50, 08
        mov     eax, dword [ebp-0CH]                    ; 3B0C _ 8B. 45, F4
        mov     edx, dword [ebp+14H]                    ; 3B0F _ 8B. 55, 14
        mov     dword [eax+0CH], edx                    ; 3B12 _ 89. 50, 0C
        mov     eax, dword [ebp-0CH]                    ; 3B15 _ 8B. 45, F4
        mov     dword [eax+10H], -1                     ; 3B18 _ C7. 40, 10, FFFFFFFF
        mov     dword [ebp-10H], 0                      ; 3B1F _ C7. 45, F0, 00000000
        jmp     ?_196                                   ; 3B26 _ EB, 1B

?_195:  mov     eax, dword [ebp-0CH]                    ; 3B28 _ 8B. 45, F4
        mov     edx, dword [ebp-10H]                    ; 3B2B _ 8B. 55, F0
        add     edx, 33                                 ; 3B2E _ 83. C2, 21
        shl     edx, 5                                  ; 3B31 _ C1. E2, 05
        add     eax, edx                                ; 3B34 _ 01. D0
        add     eax, 16                                 ; 3B36 _ 83. C0, 10
        mov     dword [eax], 0                          ; 3B39 _ C7. 00, 00000000
        add     dword [ebp-10H], 1                      ; 3B3F _ 83. 45, F0, 01
?_196:  cmp     dword [ebp-10H], 255                    ; 3B43 _ 81. 7D, F0, 000000FF
        jle     ?_195                                   ; 3B4A _ 7E, DC
        mov     eax, dword [ebp-0CH]                    ; 3B4C _ 8B. 45, F4
?_197:  leave                                           ; 3B4F _ C9
        ret                                             ; 3B50 _ C3
; shtctl_init End of function

sheet_alloc:; Function begin
        push    ebp                                     ; 3B51 _ 55
        mov     ebp, esp                                ; 3B52 _ 89. E5
        sub     esp, 16                                 ; 3B54 _ 83. EC, 10
        mov     dword [ebp-8H], 0                       ; 3B57 _ C7. 45, F8, 00000000
        jmp     ?_200                                   ; 3B5E _ EB, 5B

?_198:  mov     eax, dword [ebp+8H]                     ; 3B60 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 3B63 _ 8B. 55, F8
        add     edx, 33                                 ; 3B66 _ 83. C2, 21
        shl     edx, 5                                  ; 3B69 _ C1. E2, 05
        add     eax, edx                                ; 3B6C _ 01. D0
        add     eax, 16                                 ; 3B6E _ 83. C0, 10
        mov     eax, dword [eax]                        ; 3B71 _ 8B. 00
        test    eax, eax                                ; 3B73 _ 85. C0
        jnz     ?_199                                   ; 3B75 _ 75, 40
        mov     eax, dword [ebp-8H]                     ; 3B77 _ 8B. 45, F8
        shl     eax, 5                                  ; 3B7A _ C1. E0, 05
        lea     edx, [eax+410H]                         ; 3B7D _ 8D. 90, 00000410
        mov     eax, dword [ebp+8H]                     ; 3B83 _ 8B. 45, 08
        add     eax, edx                                ; 3B86 _ 01. D0
        add     eax, 4                                  ; 3B88 _ 83. C0, 04
        mov     dword [ebp-4H], eax                     ; 3B8B _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 3B8E _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 3B91 _ 8B. 55, F8
        lea     ecx, [edx+4H]                           ; 3B94 _ 8D. 4A, 04
        mov     edx, dword [ebp-4H]                     ; 3B97 _ 8B. 55, FC
        mov     dword [eax+ecx*4+4H], edx               ; 3B9A _ 89. 54 88, 04
        mov     eax, dword [ebp-4H]                     ; 3B9E _ 8B. 45, FC
        mov     dword [eax+1CH], 1                      ; 3BA1 _ C7. 40, 1C, 00000001
        mov     eax, dword [ebp-4H]                     ; 3BA8 _ 8B. 45, FC
        mov     dword [eax+18H], -1                     ; 3BAB _ C7. 40, 18, FFFFFFFF
        mov     eax, dword [ebp-4H]                     ; 3BB2 _ 8B. 45, FC
        jmp     ?_201                                   ; 3BB5 _ EB, 12

?_199:  add     dword [ebp-8H], 1                       ; 3BB7 _ 83. 45, F8, 01
?_200:  cmp     dword [ebp-8H], 255                     ; 3BBB _ 81. 7D, F8, 000000FF
        jle     ?_198                                   ; 3BC2 _ 7E, 9C
        mov     eax, 0                                  ; 3BC4 _ B8, 00000000
?_201:  leave                                           ; 3BC9 _ C9
        ret                                             ; 3BCA _ C3
; sheet_alloc End of function

sheet_setbuf:; Function begin
        push    ebp                                     ; 3BCB _ 55
        mov     ebp, esp                                ; 3BCC _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 3BCE _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 3BD1 _ 8B. 55, 0C
        mov     dword [eax], edx                        ; 3BD4 _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 3BD6 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 3BD9 _ 8B. 55, 10
        mov     dword [eax+4H], edx                     ; 3BDC _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 3BDF _ 8B. 45, 08
        mov     edx, dword [ebp+14H]                    ; 3BE2 _ 8B. 55, 14
        mov     dword [eax+8H], edx                     ; 3BE5 _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 3BE8 _ 8B. 45, 08
        mov     edx, dword [ebp+18H]                    ; 3BEB _ 8B. 55, 18
        mov     dword [eax+14H], edx                    ; 3BEE _ 89. 50, 14
        nop                                             ; 3BF1 _ 90
        pop     ebp                                     ; 3BF2 _ 5D
        ret                                             ; 3BF3 _ C3
; sheet_setbuf End of function

sheet_updown:; Function begin
        push    ebp                                     ; 3BF4 _ 55
        mov     ebp, esp                                ; 3BF5 _ 89. E5
        push    edi                                     ; 3BF7 _ 57
        push    esi                                     ; 3BF8 _ 56
        push    ebx                                     ; 3BF9 _ 53
        sub     esp, 60                                 ; 3BFA _ 83. EC, 3C
        mov     eax, dword [ebp+0CH]                    ; 3BFD _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 3C00 _ 8B. 40, 18
        mov     dword [ebp-1CH], eax                    ; 3C03 _ 89. 45, E4
        mov     eax, dword [ebp+8H]                     ; 3C06 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 3C09 _ 8B. 40, 10
        add     eax, 1                                  ; 3C0C _ 83. C0, 01
        cmp     eax, dword [ebp+10H]                    ; 3C0F _ 3B. 45, 10
        jge     ?_202                                   ; 3C12 _ 7D, 0C
        mov     eax, dword [ebp+8H]                     ; 3C14 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 3C17 _ 8B. 40, 10
        add     eax, 1                                  ; 3C1A _ 83. C0, 01
        mov     dword [ebp+10H], eax                    ; 3C1D _ 89. 45, 10
?_202:  cmp     dword [ebp+10H], -1                     ; 3C20 _ 83. 7D, 10, FF
        jge     ?_203                                   ; 3C24 _ 7D, 07
        mov     dword [ebp+10H], -1                     ; 3C26 _ C7. 45, 10, FFFFFFFF
?_203:  mov     eax, dword [ebp+0CH]                    ; 3C2D _ 8B. 45, 0C
        mov     edx, dword [ebp+10H]                    ; 3C30 _ 8B. 55, 10
        mov     dword [eax+18H], edx                    ; 3C33 _ 89. 50, 18
        mov     eax, dword [ebp-1CH]                    ; 3C36 _ 8B. 45, E4
        cmp     eax, dword [ebp+10H]                    ; 3C39 _ 3B. 45, 10
        jle     ?_210                                   ; 3C3C _ 0F 8E, 00000212
        cmp     dword [ebp+10H], 0                      ; 3C42 _ 83. 7D, 10, 00
        js      ?_206                                   ; 3C46 _ 0F 88, 000000FE
        mov     eax, dword [ebp-1CH]                    ; 3C4C _ 8B. 45, E4
        mov     dword [ebp-20H], eax                    ; 3C4F _ 89. 45, E0
        jmp     ?_205                                   ; 3C52 _ EB, 34

?_204:  mov     eax, dword [ebp-20H]                    ; 3C54 _ 8B. 45, E0
        lea     edx, [eax-1H]                           ; 3C57 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 3C5A _ 8B. 45, 08
        add     edx, 4                                  ; 3C5D _ 83. C2, 04
        mov     edx, dword [eax+edx*4+4H]               ; 3C60 _ 8B. 54 90, 04
        mov     eax, dword [ebp+8H]                     ; 3C64 _ 8B. 45, 08
        mov     ecx, dword [ebp-20H]                    ; 3C67 _ 8B. 4D, E0
        add     ecx, 4                                  ; 3C6A _ 83. C1, 04
        mov     dword [eax+ecx*4+4H], edx               ; 3C6D _ 89. 54 88, 04
        mov     eax, dword [ebp+8H]                     ; 3C71 _ 8B. 45, 08
        mov     edx, dword [ebp-20H]                    ; 3C74 _ 8B. 55, E0
        add     edx, 4                                  ; 3C77 _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 3C7A _ 8B. 44 90, 04
        mov     edx, dword [ebp-20H]                    ; 3C7E _ 8B. 55, E0
        mov     dword [eax+18H], edx                    ; 3C81 _ 89. 50, 18
        sub     dword [ebp-20H], 1                      ; 3C84 _ 83. 6D, E0, 01
?_205:  mov     eax, dword [ebp-20H]                    ; 3C88 _ 8B. 45, E0
        cmp     eax, dword [ebp+10H]                    ; 3C8B _ 3B. 45, 10
        jg      ?_204                                   ; 3C8E _ 7F, C4
        mov     eax, dword [ebp+8H]                     ; 3C90 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 3C93 _ 8B. 55, 10
        lea     ecx, [edx+4H]                           ; 3C96 _ 8D. 4A, 04
        mov     edx, dword [ebp+0CH]                    ; 3C99 _ 8B. 55, 0C
        mov     dword [eax+ecx*4+4H], edx               ; 3C9C _ 89. 54 88, 04
        mov     eax, dword [ebp+10H]                    ; 3CA0 _ 8B. 45, 10
        lea     esi, [eax+1H]                           ; 3CA3 _ 8D. 70, 01
        mov     eax, dword [ebp+0CH]                    ; 3CA6 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 3CA9 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 3CAC _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 3CAF _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 3CB2 _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 3CB5 _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 3CB8 _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 3CBB _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 3CBE _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 3CC1 _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 3CC4 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 3CC7 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 3CCA _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 3CCD _ 8B. 40, 0C
        mov     dword [esp+14H], esi                    ; 3CD0 _ 89. 74 24, 14
        mov     dword [esp+10H], ebx                    ; 3CD4 _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 3CD8 _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 3CDC _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 3CE0 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 3CE4 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3CE7 _ 89. 04 24
        call    sheet_refreshmap                        ; 3CEA _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 3CEF _ 8B. 45, 10
        lea     edi, [eax+1H]                           ; 3CF2 _ 8D. 78, 01
        mov     eax, dword [ebp+0CH]                    ; 3CF5 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 3CF8 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 3CFB _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 3CFE _ 8B. 40, 08
        lea     esi, [edx+eax]                          ; 3D01 _ 8D. 34 02
        mov     eax, dword [ebp+0CH]                    ; 3D04 _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 3D07 _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 3D0A _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 3D0D _ 8B. 40, 04
        lea     ebx, [edx+eax]                          ; 3D10 _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 3D13 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 3D16 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 3D19 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 3D1C _ 8B. 40, 0C
        mov     ecx, dword [ebp-1CH]                    ; 3D1F _ 8B. 4D, E4
        mov     dword [esp+18H], ecx                    ; 3D22 _ 89. 4C 24, 18
        mov     dword [esp+14H], edi                    ; 3D26 _ 89. 7C 24, 14
        mov     dword [esp+10H], esi                    ; 3D2A _ 89. 74 24, 10
        mov     dword [esp+0CH], ebx                    ; 3D2E _ 89. 5C 24, 0C
        mov     dword [esp+8H], edx                     ; 3D32 _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 3D36 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 3D3A _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3D3D _ 89. 04 24
        call    sheet_refreshsub                        ; 3D40 _ E8, FFFFFFFC(rel)
        jmp     ?_217                                   ; 3D45 _ E9, 0000027D

?_206:  mov     eax, dword [ebp+8H]                     ; 3D4A _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 3D4D _ 8B. 40, 10
        cmp     eax, dword [ebp-1CH]                    ; 3D50 _ 3B. 45, E4
        jle     ?_209                                   ; 3D53 _ 7E, 47
        mov     eax, dword [ebp-1CH]                    ; 3D55 _ 8B. 45, E4
        mov     dword [ebp-20H], eax                    ; 3D58 _ 89. 45, E0
        jmp     ?_208                                   ; 3D5B _ EB, 34

?_207:  mov     eax, dword [ebp-20H]                    ; 3D5D _ 8B. 45, E0
        lea     edx, [eax+1H]                           ; 3D60 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 3D63 _ 8B. 45, 08
        add     edx, 4                                  ; 3D66 _ 83. C2, 04
        mov     edx, dword [eax+edx*4+4H]               ; 3D69 _ 8B. 54 90, 04
        mov     eax, dword [ebp+8H]                     ; 3D6D _ 8B. 45, 08
        mov     ecx, dword [ebp-20H]                    ; 3D70 _ 8B. 4D, E0
        add     ecx, 4                                  ; 3D73 _ 83. C1, 04
        mov     dword [eax+ecx*4+4H], edx               ; 3D76 _ 89. 54 88, 04
        mov     eax, dword [ebp+8H]                     ; 3D7A _ 8B. 45, 08
        mov     edx, dword [ebp-20H]                    ; 3D7D _ 8B. 55, E0
        add     edx, 4                                  ; 3D80 _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 3D83 _ 8B. 44 90, 04
        mov     edx, dword [ebp-20H]                    ; 3D87 _ 8B. 55, E0
        mov     dword [eax+18H], edx                    ; 3D8A _ 89. 50, 18
        add     dword [ebp-20H], 1                      ; 3D8D _ 83. 45, E0, 01
?_208:  mov     eax, dword [ebp+8H]                     ; 3D91 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 3D94 _ 8B. 40, 10
        cmp     eax, dword [ebp-20H]                    ; 3D97 _ 3B. 45, E0
        jg      ?_207                                   ; 3D9A _ 7F, C1
?_209:  mov     eax, dword [ebp+8H]                     ; 3D9C _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 3D9F _ 8B. 40, 10
        lea     edx, [eax-1H]                           ; 3DA2 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 3DA5 _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 3DA8 _ 89. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 3DAB _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 3DAE _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 3DB1 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 3DB4 _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 3DB7 _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 3DBA _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 3DBD _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 3DC0 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 3DC3 _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 3DC6 _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 3DC9 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 3DCC _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 3DCF _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 3DD2 _ 8B. 40, 0C
        mov     dword [esp+14H], 0                      ; 3DD5 _ C7. 44 24, 14, 00000000
        mov     dword [esp+10H], ebx                    ; 3DDD _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 3DE1 _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 3DE5 _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 3DE9 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 3DED _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3DF0 _ 89. 04 24
        call    sheet_refreshmap                        ; 3DF3 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-1CH]                    ; 3DF8 _ 8B. 45, E4
        lea     esi, [eax-1H]                           ; 3DFB _ 8D. 70, FF
        mov     eax, dword [ebp+0CH]                    ; 3DFE _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 3E01 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 3E04 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 3E07 _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 3E0A _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 3E0D _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 3E10 _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 3E13 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 3E16 _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 3E19 _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 3E1C _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 3E1F _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 3E22 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 3E25 _ 8B. 40, 0C
        mov     dword [esp+18H], esi                    ; 3E28 _ 89. 74 24, 18
        mov     dword [esp+14H], 0                      ; 3E2C _ C7. 44 24, 14, 00000000
        mov     dword [esp+10H], ebx                    ; 3E34 _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 3E38 _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 3E3C _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 3E40 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 3E44 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3E47 _ 89. 04 24
        call    sheet_refreshsub                        ; 3E4A _ E8, FFFFFFFC(rel)
        jmp     ?_217                                   ; 3E4F _ E9, 00000173

?_210:  mov     eax, dword [ebp-1CH]                    ; 3E54 _ 8B. 45, E4
        cmp     eax, dword [ebp+10H]                    ; 3E57 _ 3B. 45, 10
        jge     ?_217                                   ; 3E5A _ 0F 8D, 00000167
        cmp     dword [ebp-1CH], 0                      ; 3E60 _ 83. 7D, E4, 00
        js      ?_213                                   ; 3E64 _ 78, 56
        mov     eax, dword [ebp-1CH]                    ; 3E66 _ 8B. 45, E4
        mov     dword [ebp-20H], eax                    ; 3E69 _ 89. 45, E0
        jmp     ?_212                                   ; 3E6C _ EB, 34

?_211:  mov     eax, dword [ebp-20H]                    ; 3E6E _ 8B. 45, E0
        lea     edx, [eax+1H]                           ; 3E71 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 3E74 _ 8B. 45, 08
        add     edx, 4                                  ; 3E77 _ 83. C2, 04
        mov     edx, dword [eax+edx*4+4H]               ; 3E7A _ 8B. 54 90, 04
        mov     eax, dword [ebp+8H]                     ; 3E7E _ 8B. 45, 08
        mov     ecx, dword [ebp-20H]                    ; 3E81 _ 8B. 4D, E0
        add     ecx, 4                                  ; 3E84 _ 83. C1, 04
        mov     dword [eax+ecx*4+4H], edx               ; 3E87 _ 89. 54 88, 04
        mov     eax, dword [ebp+8H]                     ; 3E8B _ 8B. 45, 08
        mov     edx, dword [ebp-20H]                    ; 3E8E _ 8B. 55, E0
        add     edx, 4                                  ; 3E91 _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 3E94 _ 8B. 44 90, 04
        mov     edx, dword [ebp-20H]                    ; 3E98 _ 8B. 55, E0
        mov     dword [eax+18H], edx                    ; 3E9B _ 89. 50, 18
        add     dword [ebp-20H], 1                      ; 3E9E _ 83. 45, E0, 01
?_212:  mov     eax, dword [ebp-20H]                    ; 3EA2 _ 8B. 45, E0
        cmp     eax, dword [ebp+10H]                    ; 3EA5 _ 3B. 45, 10
        jl      ?_211                                   ; 3EA8 _ 7C, C4
        mov     eax, dword [ebp+8H]                     ; 3EAA _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 3EAD _ 8B. 55, 10
        lea     ecx, [edx+4H]                           ; 3EB0 _ 8D. 4A, 04
        mov     edx, dword [ebp+0CH]                    ; 3EB3 _ 8B. 55, 0C
        mov     dword [eax+ecx*4+4H], edx               ; 3EB6 _ 89. 54 88, 04
        jmp     ?_216                                   ; 3EBA _ EB, 6C

?_213:  mov     eax, dword [ebp+8H]                     ; 3EBC _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 3EBF _ 8B. 40, 10
        mov     dword [ebp-20H], eax                    ; 3EC2 _ 89. 45, E0
        jmp     ?_215                                   ; 3EC5 _ EB, 3A

?_214:  mov     eax, dword [ebp-20H]                    ; 3EC7 _ 8B. 45, E0
        lea     ecx, [eax+1H]                           ; 3ECA _ 8D. 48, 01
        mov     eax, dword [ebp+8H]                     ; 3ECD _ 8B. 45, 08
        mov     edx, dword [ebp-20H]                    ; 3ED0 _ 8B. 55, E0
        add     edx, 4                                  ; 3ED3 _ 83. C2, 04
        mov     edx, dword [eax+edx*4+4H]               ; 3ED6 _ 8B. 54 90, 04
        mov     eax, dword [ebp+8H]                     ; 3EDA _ 8B. 45, 08
        add     ecx, 4                                  ; 3EDD _ 83. C1, 04
        mov     dword [eax+ecx*4+4H], edx               ; 3EE0 _ 89. 54 88, 04
        mov     eax, dword [ebp-20H]                    ; 3EE4 _ 8B. 45, E0
        lea     edx, [eax+1H]                           ; 3EE7 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 3EEA _ 8B. 45, 08
        add     edx, 4                                  ; 3EED _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 3EF0 _ 8B. 44 90, 04
        mov     edx, dword [ebp-20H]                    ; 3EF4 _ 8B. 55, E0
        add     edx, 1                                  ; 3EF7 _ 83. C2, 01
        mov     dword [eax+18H], edx                    ; 3EFA _ 89. 50, 18
        sub     dword [ebp-20H], 1                      ; 3EFD _ 83. 6D, E0, 01
?_215:  mov     eax, dword [ebp-20H]                    ; 3F01 _ 8B. 45, E0
        cmp     eax, dword [ebp+10H]                    ; 3F04 _ 3B. 45, 10
        jge     ?_214                                   ; 3F07 _ 7D, BE
        mov     eax, dword [ebp+8H]                     ; 3F09 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 3F0C _ 8B. 55, 10
        lea     ecx, [edx+4H]                           ; 3F0F _ 8D. 4A, 04
        mov     edx, dword [ebp+0CH]                    ; 3F12 _ 8B. 55, 0C
        mov     dword [eax+ecx*4+4H], edx               ; 3F15 _ 89. 54 88, 04
        mov     eax, dword [ebp+8H]                     ; 3F19 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 3F1C _ 8B. 40, 10
        lea     edx, [eax+1H]                           ; 3F1F _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 3F22 _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 3F25 _ 89. 50, 10
?_216:  mov     eax, dword [ebp+0CH]                    ; 3F28 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 3F2B _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 3F2E _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 3F31 _ 8B. 40, 08
        lea     esi, [edx+eax]                          ; 3F34 _ 8D. 34 02
        mov     eax, dword [ebp+0CH]                    ; 3F37 _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 3F3A _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 3F3D _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 3F40 _ 8B. 40, 04
        lea     ebx, [edx+eax]                          ; 3F43 _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 3F46 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 3F49 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 3F4C _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 3F4F _ 8B. 40, 0C
        mov     ecx, dword [ebp+10H]                    ; 3F52 _ 8B. 4D, 10
        mov     dword [esp+14H], ecx                    ; 3F55 _ 89. 4C 24, 14
        mov     dword [esp+10H], esi                    ; 3F59 _ 89. 74 24, 10
        mov     dword [esp+0CH], ebx                    ; 3F5D _ 89. 5C 24, 0C
        mov     dword [esp+8H], edx                     ; 3F61 _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 3F65 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 3F69 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3F6C _ 89. 04 24
        call    sheet_refreshmap                        ; 3F6F _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+0CH]                    ; 3F74 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 3F77 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 3F7A _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 3F7D _ 8B. 40, 08
        lea     esi, [edx+eax]                          ; 3F80 _ 8D. 34 02
        mov     eax, dword [ebp+0CH]                    ; 3F83 _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 3F86 _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 3F89 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 3F8C _ 8B. 40, 04
        lea     ebx, [edx+eax]                          ; 3F8F _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 3F92 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 3F95 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 3F98 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 3F9B _ 8B. 40, 0C
        mov     ecx, dword [ebp+10H]                    ; 3F9E _ 8B. 4D, 10
        mov     dword [esp+18H], ecx                    ; 3FA1 _ 89. 4C 24, 18
        mov     ecx, dword [ebp+10H]                    ; 3FA5 _ 8B. 4D, 10
        mov     dword [esp+14H], ecx                    ; 3FA8 _ 89. 4C 24, 14
        mov     dword [esp+10H], esi                    ; 3FAC _ 89. 74 24, 10
        mov     dword [esp+0CH], ebx                    ; 3FB0 _ 89. 5C 24, 0C
        mov     dword [esp+8H], edx                     ; 3FB4 _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 3FB8 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 3FBC _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3FBF _ 89. 04 24
        call    sheet_refreshsub                        ; 3FC2 _ E8, FFFFFFFC(rel)
?_217:  add     esp, 60                                 ; 3FC7 _ 83. C4, 3C
        pop     ebx                                     ; 3FCA _ 5B
        pop     esi                                     ; 3FCB _ 5E
        pop     edi                                     ; 3FCC _ 5F
        pop     ebp                                     ; 3FCD _ 5D
        ret                                             ; 3FCE _ C3
; sheet_updown End of function

sheet_refresh:; Function begin
        push    ebp                                     ; 3FCF _ 55
        mov     ebp, esp                                ; 3FD0 _ 89. E5
        push    edi                                     ; 3FD2 _ 57
        push    esi                                     ; 3FD3 _ 56
        push    ebx                                     ; 3FD4 _ 53
        sub     esp, 44                                 ; 3FD5 _ 83. EC, 2C
        mov     eax, dword [ebp+0CH]                    ; 3FD8 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 3FDB _ 8B. 40, 18
        test    eax, eax                                ; 3FDE _ 85. C0
        js      ?_218                                   ; 3FE0 _ 78, 61
        mov     eax, dword [ebp+0CH]                    ; 3FE2 _ 8B. 45, 0C
        mov     ebx, dword [eax+18H]                    ; 3FE5 _ 8B. 58, 18
        mov     eax, dword [ebp+0CH]                    ; 3FE8 _ 8B. 45, 0C
        mov     ecx, dword [eax+18H]                    ; 3FEB _ 8B. 48, 18
        mov     eax, dword [ebp+0CH]                    ; 3FEE _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 3FF1 _ 8B. 50, 10
        mov     eax, dword [ebp+1CH]                    ; 3FF4 _ 8B. 45, 1C
        lea     edi, [edx+eax]                          ; 3FF7 _ 8D. 3C 02
        mov     eax, dword [ebp+0CH]                    ; 3FFA _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 3FFD _ 8B. 50, 0C
        mov     eax, dword [ebp+18H]                    ; 4000 _ 8B. 45, 18
        lea     esi, [edx+eax]                          ; 4003 _ 8D. 34 02
        mov     eax, dword [ebp+0CH]                    ; 4006 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 4009 _ 8B. 50, 10
        mov     eax, dword [ebp+14H]                    ; 400C _ 8B. 45, 14
        add     edx, eax                                ; 400F _ 01. C2
        mov     eax, dword [ebp+0CH]                    ; 4011 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 4014 _ 8B. 40, 0C
        mov     dword [ebp-1CH], eax                    ; 4017 _ 89. 45, E4
        mov     eax, dword [ebp+10H]                    ; 401A _ 8B. 45, 10
        add     eax, dword [ebp-1CH]                    ; 401D _ 03. 45, E4
        mov     dword [esp+18H], ebx                    ; 4020 _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 4024 _ 89. 4C 24, 14
        mov     dword [esp+10H], edi                    ; 4028 _ 89. 7C 24, 10
        mov     dword [esp+0CH], esi                    ; 402C _ 89. 74 24, 0C
        mov     dword [esp+8H], edx                     ; 4030 _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 4034 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 4038 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 403B _ 89. 04 24
        call    sheet_refreshsub                        ; 403E _ E8, FFFFFFFC(rel)
?_218:  mov     eax, 0                                  ; 4043 _ B8, 00000000
        add     esp, 44                                 ; 4048 _ 83. C4, 2C
        pop     ebx                                     ; 404B _ 5B
        pop     esi                                     ; 404C _ 5E
        pop     edi                                     ; 404D _ 5F
        pop     ebp                                     ; 404E _ 5D
        ret                                             ; 404F _ C3
; sheet_refresh End of function

sheet_slide:; Function begin
        push    ebp                                     ; 4050 _ 55
        mov     ebp, esp                                ; 4051 _ 89. E5
        push    esi                                     ; 4053 _ 56
        push    ebx                                     ; 4054 _ 53
        sub     esp, 48                                 ; 4055 _ 83. EC, 30
        mov     eax, dword [ebp+0CH]                    ; 4058 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 405B _ 8B. 40, 0C
        mov     dword [ebp-10H], eax                    ; 405E _ 89. 45, F0
        mov     eax, dword [ebp+0CH]                    ; 4061 _ 8B. 45, 0C
        mov     eax, dword [eax+10H]                    ; 4064 _ 8B. 40, 10
        mov     dword [ebp-0CH], eax                    ; 4067 _ 89. 45, F4
        mov     eax, dword [ebp+0CH]                    ; 406A _ 8B. 45, 0C
        mov     edx, dword [ebp+10H]                    ; 406D _ 8B. 55, 10
        mov     dword [eax+0CH], edx                    ; 4070 _ 89. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 4073 _ 8B. 45, 0C
        mov     edx, dword [ebp+14H]                    ; 4076 _ 8B. 55, 14
        mov     dword [eax+10H], edx                    ; 4079 _ 89. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 407C _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 407F _ 8B. 40, 18
        test    eax, eax                                ; 4082 _ 85. C0
        js      ?_219                                   ; 4084 _ 0F 88, 00000117
        mov     eax, dword [ebp+0CH]                    ; 408A _ 8B. 45, 0C
        mov     edx, dword [eax+8H]                     ; 408D _ 8B. 50, 08
        mov     eax, dword [ebp-0CH]                    ; 4090 _ 8B. 45, F4
        add     edx, eax                                ; 4093 _ 01. C2
        mov     eax, dword [ebp+0CH]                    ; 4095 _ 8B. 45, 0C
        mov     ecx, dword [eax+4H]                     ; 4098 _ 8B. 48, 04
        mov     eax, dword [ebp-10H]                    ; 409B _ 8B. 45, F0
        add     eax, ecx                                ; 409E _ 01. C8
        mov     dword [esp+14H], 0                      ; 40A0 _ C7. 44 24, 14, 00000000
        mov     dword [esp+10H], edx                    ; 40A8 _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 40AC _ 89. 44 24, 0C
        mov     eax, dword [ebp-0CH]                    ; 40B0 _ 8B. 45, F4
        mov     dword [esp+8H], eax                     ; 40B3 _ 89. 44 24, 08
        mov     eax, dword [ebp-10H]                    ; 40B7 _ 8B. 45, F0
        mov     dword [esp+4H], eax                     ; 40BA _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 40BE _ 8B. 45, 08
        mov     dword [esp], eax                        ; 40C1 _ 89. 04 24
        call    sheet_refreshmap                        ; 40C4 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+0CH]                    ; 40C9 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 40CC _ 8B. 40, 18
        mov     edx, dword [ebp+0CH]                    ; 40CF _ 8B. 55, 0C
        mov     ecx, dword [edx+8H]                     ; 40D2 _ 8B. 4A, 08
        mov     edx, dword [ebp+14H]                    ; 40D5 _ 8B. 55, 14
        add     ecx, edx                                ; 40D8 _ 01. D1
        mov     edx, dword [ebp+0CH]                    ; 40DA _ 8B. 55, 0C
        mov     ebx, dword [edx+4H]                     ; 40DD _ 8B. 5A, 04
        mov     edx, dword [ebp+10H]                    ; 40E0 _ 8B. 55, 10
        add     edx, ebx                                ; 40E3 _ 01. DA
        mov     dword [esp+14H], eax                    ; 40E5 _ 89. 44 24, 14
        mov     dword [esp+10H], ecx                    ; 40E9 _ 89. 4C 24, 10
        mov     dword [esp+0CH], edx                    ; 40ED _ 89. 54 24, 0C
        mov     eax, dword [ebp+14H]                    ; 40F1 _ 8B. 45, 14
        mov     dword [esp+8H], eax                     ; 40F4 _ 89. 44 24, 08
        mov     eax, dword [ebp+10H]                    ; 40F8 _ 8B. 45, 10
        mov     dword [esp+4H], eax                     ; 40FB _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 40FF _ 8B. 45, 08
        mov     dword [esp], eax                        ; 4102 _ 89. 04 24
        call    sheet_refreshmap                        ; 4105 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+0CH]                    ; 410A _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 410D _ 8B. 40, 18
        lea     ecx, [eax-1H]                           ; 4110 _ 8D. 48, FF
        mov     eax, dword [ebp+0CH]                    ; 4113 _ 8B. 45, 0C
        mov     edx, dword [eax+8H]                     ; 4116 _ 8B. 50, 08
        mov     eax, dword [ebp-0CH]                    ; 4119 _ 8B. 45, F4
        add     edx, eax                                ; 411C _ 01. C2
        mov     eax, dword [ebp+0CH]                    ; 411E _ 8B. 45, 0C
        mov     ebx, dword [eax+4H]                     ; 4121 _ 8B. 58, 04
        mov     eax, dword [ebp-10H]                    ; 4124 _ 8B. 45, F0
        add     eax, ebx                                ; 4127 _ 01. D8
        mov     dword [esp+18H], ecx                    ; 4129 _ 89. 4C 24, 18
        mov     dword [esp+14H], 0                      ; 412D _ C7. 44 24, 14, 00000000
        mov     dword [esp+10H], edx                    ; 4135 _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 4139 _ 89. 44 24, 0C
        mov     eax, dword [ebp-0CH]                    ; 413D _ 8B. 45, F4
        mov     dword [esp+8H], eax                     ; 4140 _ 89. 44 24, 08
        mov     eax, dword [ebp-10H]                    ; 4144 _ 8B. 45, F0
        mov     dword [esp+4H], eax                     ; 4147 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 414B _ 8B. 45, 08
        mov     dword [esp], eax                        ; 414E _ 89. 04 24
        call    sheet_refreshsub                        ; 4151 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+0CH]                    ; 4156 _ 8B. 45, 0C
        mov     edx, dword [eax+18H]                    ; 4159 _ 8B. 50, 18
        mov     eax, dword [ebp+0CH]                    ; 415C _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 415F _ 8B. 40, 18
        mov     ecx, dword [ebp+0CH]                    ; 4162 _ 8B. 4D, 0C
        mov     ebx, dword [ecx+8H]                     ; 4165 _ 8B. 59, 08
        mov     ecx, dword [ebp+14H]                    ; 4168 _ 8B. 4D, 14
        add     ebx, ecx                                ; 416B _ 01. CB
        mov     ecx, dword [ebp+0CH]                    ; 416D _ 8B. 4D, 0C
        mov     esi, dword [ecx+4H]                     ; 4170 _ 8B. 71, 04
        mov     ecx, dword [ebp+10H]                    ; 4173 _ 8B. 4D, 10
        add     ecx, esi                                ; 4176 _ 01. F1
        mov     dword [esp+18H], edx                    ; 4178 _ 89. 54 24, 18
        mov     dword [esp+14H], eax                    ; 417C _ 89. 44 24, 14
        mov     dword [esp+10H], ebx                    ; 4180 _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 4184 _ 89. 4C 24, 0C
        mov     eax, dword [ebp+14H]                    ; 4188 _ 8B. 45, 14
        mov     dword [esp+8H], eax                     ; 418B _ 89. 44 24, 08
        mov     eax, dword [ebp+10H]                    ; 418F _ 8B. 45, 10
        mov     dword [esp+4H], eax                     ; 4192 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 4196 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 4199 _ 89. 04 24
        call    sheet_refreshsub                        ; 419C _ E8, FFFFFFFC(rel)
?_219:  add     esp, 48                                 ; 41A1 _ 83. C4, 30
        pop     ebx                                     ; 41A4 _ 5B
        pop     esi                                     ; 41A5 _ 5E
        pop     ebp                                     ; 41A6 _ 5D
        ret                                             ; 41A7 _ C3
; sheet_slide End of function

sheet_refreshsub:; Function begin
        push    ebp                                     ; 41A8 _ 55
        mov     ebp, esp                                ; 41A9 _ 89. E5
        sub     esp, 48                                 ; 41AB _ 83. EC, 30
        mov     eax, dword [ebp+8H]                     ; 41AE _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 41B1 _ 8B. 00
        mov     dword [ebp-18H], eax                    ; 41B3 _ 89. 45, E8
        mov     eax, dword [ebp+8H]                     ; 41B6 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 41B9 _ 8B. 40, 04
        mov     dword [ebp-14H], eax                    ; 41BC _ 89. 45, EC
        cmp     dword [ebp+0CH], 0                      ; 41BF _ 83. 7D, 0C, 00
        jns     ?_220                                   ; 41C3 _ 79, 07
        mov     dword [ebp+0CH], 0                      ; 41C5 _ C7. 45, 0C, 00000000
?_220:  cmp     dword [ebp+10H], 8                      ; 41CC _ 83. 7D, 10, 08
        jg      ?_221                                   ; 41D0 _ 7F, 07
        mov     dword [ebp+10H], 0                      ; 41D2 _ C7. 45, 10, 00000000
?_221:  mov     eax, dword [ebp+8H]                     ; 41D9 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 41DC _ 8B. 40, 08
        cmp     eax, dword [ebp+14H]                    ; 41DF _ 3B. 45, 14
        jge     ?_222                                   ; 41E2 _ 7D, 09
        mov     eax, dword [ebp+8H]                     ; 41E4 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 41E7 _ 8B. 40, 08
        mov     dword [ebp+14H], eax                    ; 41EA _ 89. 45, 14
?_222:  mov     eax, dword [ebp+8H]                     ; 41ED _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 41F0 _ 8B. 40, 0C
        cmp     eax, dword [ebp+18H]                    ; 41F3 _ 3B. 45, 18
        jge     ?_223                                   ; 41F6 _ 7D, 09
        mov     eax, dword [ebp+8H]                     ; 41F8 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 41FB _ 8B. 40, 0C
        mov     dword [ebp+18H], eax                    ; 41FE _ 89. 45, 18
?_223:  mov     eax, dword [ebp+1CH]                    ; 4201 _ 8B. 45, 1C
        mov     dword [ebp-24H], eax                    ; 4204 _ 89. 45, DC
        jmp     ?_230                                   ; 4207 _ E9, 00000119

?_224:  mov     eax, dword [ebp+8H]                     ; 420C _ 8B. 45, 08
        mov     edx, dword [ebp-24H]                    ; 420F _ 8B. 55, DC
        add     edx, 4                                  ; 4212 _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 4215 _ 8B. 44 90, 04
        mov     dword [ebp-10H], eax                    ; 4219 _ 89. 45, F0
        mov     eax, dword [ebp-10H]                    ; 421C _ 8B. 45, F0
        mov     eax, dword [eax]                        ; 421F _ 8B. 00
        mov     dword [ebp-0CH], eax                    ; 4221 _ 89. 45, F4
        mov     edx, dword [ebp-10H]                    ; 4224 _ 8B. 55, F0
        mov     eax, dword [ebp+8H]                     ; 4227 _ 8B. 45, 08
        add     eax, 1044                               ; 422A _ 05, 00000414
        sub     edx, eax                                ; 422F _ 29. C2
        mov     eax, edx                                ; 4231 _ 89. D0
        sar     eax, 5                                  ; 4233 _ C1. F8, 05
        mov     byte [ebp-26H], al                      ; 4236 _ 88. 45, DA
        mov     dword [ebp-1CH], 0                      ; 4239 _ C7. 45, E4, 00000000
        jmp     ?_229                                   ; 4240 _ E9, 000000CD

?_225:  mov     eax, dword [ebp-10H]                    ; 4245 _ 8B. 45, F0
        mov     edx, dword [eax+10H]                    ; 4248 _ 8B. 50, 10
        mov     eax, dword [ebp-1CH]                    ; 424B _ 8B. 45, E4
        add     eax, edx                                ; 424E _ 01. D0
        mov     dword [ebp-8H], eax                     ; 4250 _ 89. 45, F8
        mov     dword [ebp-20H], 0                      ; 4253 _ C7. 45, E0, 00000000
        jmp     ?_228                                   ; 425A _ E9, 000000A0

?_226:  mov     eax, dword [ebp-10H]                    ; 425F _ 8B. 45, F0
        mov     edx, dword [eax+0CH]                    ; 4262 _ 8B. 50, 0C
        mov     eax, dword [ebp-20H]                    ; 4265 _ 8B. 45, E0
        add     eax, edx                                ; 4268 _ 01. D0
        mov     dword [ebp-4H], eax                     ; 426A _ 89. 45, FC
        mov     eax, dword [ebp+0CH]                    ; 426D _ 8B. 45, 0C
        cmp     eax, dword [ebp-4H]                     ; 4270 _ 3B. 45, FC
        jg      ?_227                                   ; 4273 _ 0F 8F, 00000082
        mov     eax, dword [ebp-4H]                     ; 4279 _ 8B. 45, FC
        cmp     eax, dword [ebp+14H]                    ; 427C _ 3B. 45, 14
        jge     ?_227                                   ; 427F _ 7D, 7A
        mov     eax, dword [ebp+10H]                    ; 4281 _ 8B. 45, 10
        cmp     eax, dword [ebp-8H]                     ; 4284 _ 3B. 45, F8
        jg      ?_227                                   ; 4287 _ 7F, 72
        mov     eax, dword [ebp-8H]                     ; 4289 _ 8B. 45, F8
        cmp     eax, dword [ebp+18H]                    ; 428C _ 3B. 45, 18
        jge     ?_227                                   ; 428F _ 7D, 6A
        mov     eax, dword [ebp-10H]                    ; 4291 _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 4294 _ 8B. 40, 04
        imul    eax, dword [ebp-1CH]                    ; 4297 _ 0F AF. 45, E4
        mov     edx, eax                                ; 429B _ 89. C2
        mov     eax, dword [ebp-20H]                    ; 429D _ 8B. 45, E0
        add     eax, edx                                ; 42A0 _ 01. D0
        mov     edx, eax                                ; 42A2 _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 42A4 _ 8B. 45, F4
        add     eax, edx                                ; 42A7 _ 01. D0
        movzx   eax, byte [eax]                         ; 42A9 _ 0F B6. 00
        mov     byte [ebp-25H], al                      ; 42AC _ 88. 45, DB
        mov     eax, dword [ebp+8H]                     ; 42AF _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 42B2 _ 8B. 40, 08
        imul    eax, dword [ebp-8H]                     ; 42B5 _ 0F AF. 45, F8
        mov     edx, eax                                ; 42B9 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 42BB _ 8B. 45, FC
        add     eax, edx                                ; 42BE _ 01. D0
        mov     edx, eax                                ; 42C0 _ 89. C2
        mov     eax, dword [ebp-14H]                    ; 42C2 _ 8B. 45, EC
        add     eax, edx                                ; 42C5 _ 01. D0
        movzx   eax, byte [eax]                         ; 42C7 _ 0F B6. 00
        cmp     al, byte [ebp-26H]                      ; 42CA _ 3A. 45, DA
        jnz     ?_227                                   ; 42CD _ 75, 2C
        movzx   edx, byte [ebp-25H]                     ; 42CF _ 0F B6. 55, DB
        mov     eax, dword [ebp-10H]                    ; 42D3 _ 8B. 45, F0
        mov     eax, dword [eax+14H]                    ; 42D6 _ 8B. 40, 14
        cmp     edx, eax                                ; 42D9 _ 39. C2
        jz      ?_227                                   ; 42DB _ 74, 1E
        mov     eax, dword [ebp+8H]                     ; 42DD _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 42E0 _ 8B. 40, 08
        imul    eax, dword [ebp-8H]                     ; 42E3 _ 0F AF. 45, F8
        mov     edx, eax                                ; 42E7 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 42E9 _ 8B. 45, FC
        add     eax, edx                                ; 42EC _ 01. D0
        mov     edx, eax                                ; 42EE _ 89. C2
        mov     eax, dword [ebp-18H]                    ; 42F0 _ 8B. 45, E8
        add     edx, eax                                ; 42F3 _ 01. C2
        movzx   eax, byte [ebp-25H]                     ; 42F5 _ 0F B6. 45, DB
        mov     byte [edx], al                          ; 42F9 _ 88. 02
?_227:  add     dword [ebp-20H], 1                      ; 42FB _ 83. 45, E0, 01
?_228:  mov     eax, dword [ebp-10H]                    ; 42FF _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 4302 _ 8B. 40, 04
        cmp     eax, dword [ebp-20H]                    ; 4305 _ 3B. 45, E0
        jg      ?_226                                   ; 4308 _ 0F 8F, FFFFFF51
        add     dword [ebp-1CH], 1                      ; 430E _ 83. 45, E4, 01
?_229:  mov     eax, dword [ebp-10H]                    ; 4312 _ 8B. 45, F0
        mov     eax, dword [eax+8H]                     ; 4315 _ 8B. 40, 08
        cmp     eax, dword [ebp-1CH]                    ; 4318 _ 3B. 45, E4
        jg      ?_225                                   ; 431B _ 0F 8F, FFFFFF24
        add     dword [ebp-24H], 1                      ; 4321 _ 83. 45, DC, 01
?_230:  mov     eax, dword [ebp-24H]                    ; 4325 _ 8B. 45, DC
        cmp     eax, dword [ebp+20H]                    ; 4328 _ 3B. 45, 20
        jle     ?_224                                   ; 432B _ 0F 8E, FFFFFEDB
        leave                                           ; 4331 _ C9
        ret                                             ; 4332 _ C3
; sheet_refreshsub End of function

sheet_refreshmap:; Function begin
        push    ebp                                     ; 4333 _ 55
        mov     ebp, esp                                ; 4334 _ 89. E5
        sub     esp, 64                                 ; 4336 _ 83. EC, 40
        mov     eax, dword [ebp+8H]                     ; 4339 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 433C _ 8B. 40, 04
        mov     dword [ebp-14H], eax                    ; 433F _ 89. 45, EC
        cmp     dword [ebp+0CH], 0                      ; 4342 _ 83. 7D, 0C, 00
        jns     ?_231                                   ; 4346 _ 79, 07
        mov     dword [ebp+0CH], 0                      ; 4348 _ C7. 45, 0C, 00000000
?_231:  cmp     dword [ebp+10H], 0                      ; 434F _ 83. 7D, 10, 00
        jns     ?_232                                   ; 4353 _ 79, 07
        mov     dword [ebp+10H], 0                      ; 4355 _ C7. 45, 10, 00000000
?_232:  mov     eax, dword [ebp+8H]                     ; 435C _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 435F _ 8B. 40, 08
        cmp     eax, dword [ebp+14H]                    ; 4362 _ 3B. 45, 14
        jge     ?_233                                   ; 4365 _ 7D, 09
        mov     eax, dword [ebp+8H]                     ; 4367 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 436A _ 8B. 40, 08
        mov     dword [ebp+14H], eax                    ; 436D _ 89. 45, 14
?_233:  mov     eax, dword [ebp+8H]                     ; 4370 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 4373 _ 8B. 40, 0C
        cmp     eax, dword [ebp+18H]                    ; 4376 _ 3B. 45, 18
        jge     ?_234                                   ; 4379 _ 7D, 09
        mov     eax, dword [ebp+8H]                     ; 437B _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 437E _ 8B. 40, 0C
        mov     dword [ebp+18H], eax                    ; 4381 _ 89. 45, 18
?_234:  mov     eax, dword [ebp+1CH]                    ; 4384 _ 8B. 45, 1C
        mov     dword [ebp-30H], eax                    ; 4387 _ 89. 45, D0
        jmp     ?_245                                   ; 438A _ E9, 00000141

?_235:  mov     eax, dword [ebp+8H]                     ; 438F _ 8B. 45, 08
        mov     edx, dword [ebp-30H]                    ; 4392 _ 8B. 55, D0
        add     edx, 4                                  ; 4395 _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 4398 _ 8B. 44 90, 04
        mov     dword [ebp-10H], eax                    ; 439C _ 89. 45, F0
        mov     edx, dword [ebp-10H]                    ; 439F _ 8B. 55, F0
        mov     eax, dword [ebp+8H]                     ; 43A2 _ 8B. 45, 08
        add     eax, 1044                               ; 43A5 _ 05, 00000414
        sub     edx, eax                                ; 43AA _ 29. C2
        mov     eax, edx                                ; 43AC _ 89. D0
        sar     eax, 5                                  ; 43AE _ C1. F8, 05
        mov     byte [ebp-31H], al                      ; 43B1 _ 88. 45, CF
        mov     eax, dword [ebp-10H]                    ; 43B4 _ 8B. 45, F0
        mov     eax, dword [eax]                        ; 43B7 _ 8B. 00
        mov     dword [ebp-0CH], eax                    ; 43B9 _ 89. 45, F4
        mov     eax, dword [ebp-10H]                    ; 43BC _ 8B. 45, F0
        mov     eax, dword [eax+0CH]                    ; 43BF _ 8B. 40, 0C
        mov     edx, dword [ebp+0CH]                    ; 43C2 _ 8B. 55, 0C
        sub     edx, eax                                ; 43C5 _ 29. C2
        mov     eax, edx                                ; 43C7 _ 89. D0
        mov     dword [ebp-24H], eax                    ; 43C9 _ 89. 45, DC
        mov     eax, dword [ebp-10H]                    ; 43CC _ 8B. 45, F0
        mov     eax, dword [eax+10H]                    ; 43CF _ 8B. 40, 10
        mov     edx, dword [ebp+10H]                    ; 43D2 _ 8B. 55, 10
        sub     edx, eax                                ; 43D5 _ 29. C2
        mov     eax, edx                                ; 43D7 _ 89. D0
        mov     dword [ebp-20H], eax                    ; 43D9 _ 89. 45, E0
        mov     eax, dword [ebp-10H]                    ; 43DC _ 8B. 45, F0
        mov     eax, dword [eax+0CH]                    ; 43DF _ 8B. 40, 0C
        mov     edx, dword [ebp+14H]                    ; 43E2 _ 8B. 55, 14
        sub     edx, eax                                ; 43E5 _ 29. C2
        mov     eax, edx                                ; 43E7 _ 89. D0
        mov     dword [ebp-1CH], eax                    ; 43E9 _ 89. 45, E4
        mov     eax, dword [ebp-10H]                    ; 43EC _ 8B. 45, F0
        mov     eax, dword [eax+10H]                    ; 43EF _ 8B. 40, 10
        mov     edx, dword [ebp+18H]                    ; 43F2 _ 8B. 55, 18
        sub     edx, eax                                ; 43F5 _ 29. C2
        mov     eax, edx                                ; 43F7 _ 89. D0
        mov     dword [ebp-18H], eax                    ; 43F9 _ 89. 45, E8
        cmp     dword [ebp-24H], 0                      ; 43FC _ 83. 7D, DC, 00
        jns     ?_236                                   ; 4400 _ 79, 07
        mov     dword [ebp-24H], 0                      ; 4402 _ C7. 45, DC, 00000000
?_236:  cmp     dword [ebp-20H], 0                      ; 4409 _ 83. 7D, E0, 00
        jns     ?_237                                   ; 440D _ 79, 07
        mov     dword [ebp-20H], 0                      ; 440F _ C7. 45, E0, 00000000
?_237:  mov     eax, dword [ebp-10H]                    ; 4416 _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 4419 _ 8B. 40, 04
        cmp     eax, dword [ebp-1CH]                    ; 441C _ 3B. 45, E4
        jge     ?_238                                   ; 441F _ 7D, 09
        mov     eax, dword [ebp-10H]                    ; 4421 _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 4424 _ 8B. 40, 04
        mov     dword [ebp-1CH], eax                    ; 4427 _ 89. 45, E4
?_238:  mov     eax, dword [ebp-10H]                    ; 442A _ 8B. 45, F0
        mov     eax, dword [eax+8H]                     ; 442D _ 8B. 40, 08
        cmp     eax, dword [ebp-18H]                    ; 4430 _ 3B. 45, E8
        jge     ?_239                                   ; 4433 _ 7D, 09
        mov     eax, dword [ebp-10H]                    ; 4435 _ 8B. 45, F0
        mov     eax, dword [eax+8H]                     ; 4438 _ 8B. 40, 08
        mov     dword [ebp-18H], eax                    ; 443B _ 89. 45, E8
?_239:  mov     eax, dword [ebp-20H]                    ; 443E _ 8B. 45, E0
        mov     dword [ebp-28H], eax                    ; 4441 _ 89. 45, D8
        jmp     ?_244                                   ; 4444 _ EB, 7A

?_240:  mov     eax, dword [ebp-10H]                    ; 4446 _ 8B. 45, F0
        mov     edx, dword [eax+10H]                    ; 4449 _ 8B. 50, 10
        mov     eax, dword [ebp-28H]                    ; 444C _ 8B. 45, D8
        add     eax, edx                                ; 444F _ 01. D0
        mov     dword [ebp-8H], eax                     ; 4451 _ 89. 45, F8
        mov     eax, dword [ebp-24H]                    ; 4454 _ 8B. 45, DC
        mov     dword [ebp-2CH], eax                    ; 4457 _ 89. 45, D4
        jmp     ?_243                                   ; 445A _ EB, 58

?_241:  mov     eax, dword [ebp-10H]                    ; 445C _ 8B. 45, F0
        mov     edx, dword [eax+0CH]                    ; 445F _ 8B. 50, 0C
        mov     eax, dword [ebp-2CH]                    ; 4462 _ 8B. 45, D4
        add     eax, edx                                ; 4465 _ 01. D0
        mov     dword [ebp-4H], eax                     ; 4467 _ 89. 45, FC
        mov     eax, dword [ebp-10H]                    ; 446A _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 446D _ 8B. 40, 04
        imul    eax, dword [ebp-28H]                    ; 4470 _ 0F AF. 45, D8
        mov     edx, eax                                ; 4474 _ 89. C2
        mov     eax, dword [ebp-2CH]                    ; 4476 _ 8B. 45, D4
        add     eax, edx                                ; 4479 _ 01. D0
        mov     edx, eax                                ; 447B _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 447D _ 8B. 45, F4
        add     eax, edx                                ; 4480 _ 01. D0
        movzx   eax, byte [eax]                         ; 4482 _ 0F B6. 00
        movzx   edx, al                                 ; 4485 _ 0F B6. D0
        mov     eax, dword [ebp-10H]                    ; 4488 _ 8B. 45, F0
        mov     eax, dword [eax+14H]                    ; 448B _ 8B. 40, 14
        cmp     edx, eax                                ; 448E _ 39. C2
        jz      ?_242                                   ; 4490 _ 74, 1E
        mov     eax, dword [ebp+8H]                     ; 4492 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 4495 _ 8B. 40, 08
        imul    eax, dword [ebp-8H]                     ; 4498 _ 0F AF. 45, F8
        mov     edx, eax                                ; 449C _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 449E _ 8B. 45, FC
        add     eax, edx                                ; 44A1 _ 01. D0
        mov     edx, eax                                ; 44A3 _ 89. C2
        mov     eax, dword [ebp-14H]                    ; 44A5 _ 8B. 45, EC
        add     edx, eax                                ; 44A8 _ 01. C2
        movzx   eax, byte [ebp-31H]                     ; 44AA _ 0F B6. 45, CF
        mov     byte [edx], al                          ; 44AE _ 88. 02
?_242:  add     dword [ebp-2CH], 1                      ; 44B0 _ 83. 45, D4, 01
?_243:  mov     eax, dword [ebp-2CH]                    ; 44B4 _ 8B. 45, D4
        cmp     eax, dword [ebp-1CH]                    ; 44B7 _ 3B. 45, E4
        jl      ?_241                                   ; 44BA _ 7C, A0
        add     dword [ebp-28H], 1                      ; 44BC _ 83. 45, D8, 01
?_244:  mov     eax, dword [ebp-28H]                    ; 44C0 _ 8B. 45, D8
        cmp     eax, dword [ebp-18H]                    ; 44C3 _ 3B. 45, E8
        jl      ?_240                                   ; 44C6 _ 0F 8C, FFFFFF7A
        add     dword [ebp-30H], 1                      ; 44CC _ 83. 45, D0, 01
?_245:  mov     eax, dword [ebp+8H]                     ; 44D0 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 44D3 _ 8B. 40, 10
        cmp     eax, dword [ebp-30H]                    ; 44D6 _ 3B. 45, D0
        jge     ?_235                                   ; 44D9 _ 0F 8D, FFFFFEB0
        nop                                             ; 44DF _ 90
        leave                                           ; 44E0 _ C9
        ret                                             ; 44E1 _ C3
; sheet_refreshmap End of function

init_pit:; Function begin
        push    ebp                                     ; 44E2 _ 55
        mov     ebp, esp                                ; 44E3 _ 89. E5
        sub     esp, 40                                 ; 44E5 _ 83. EC, 28
        mov     dword [esp+4H], 52                      ; 44E8 _ C7. 44 24, 04, 00000034
        mov     dword [esp], 67                         ; 44F0 _ C7. 04 24, 00000043
        call    io_out8                                 ; 44F7 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 156                     ; 44FC _ C7. 44 24, 04, 0000009C
        mov     dword [esp], 64                         ; 4504 _ C7. 04 24, 00000040
        call    io_out8                                 ; 450B _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 46                      ; 4510 _ C7. 44 24, 04, 0000002E
        mov     dword [esp], 64                         ; 4518 _ C7. 04 24, 00000040
        call    io_out8                                 ; 451F _ E8, FFFFFFFC(rel)
        mov     dword [timerctl], 0                     ; 4524 _ C7. 05, 000003A0(d), 00000000
        mov     dword [ebp-0CH], 0                      ; 452E _ C7. 45, F4, 00000000
        jmp     ?_247                                   ; 4535 _ EB, 28

?_246:  mov     eax, dword [ebp-0CH]                    ; 4537 _ 8B. 45, F4
        shl     eax, 4                                  ; 453A _ C1. E0, 04
        add     eax, timerctl                           ; 453D _ 05, 000003A0(d)
        mov     dword [eax+8H], 0                       ; 4542 _ C7. 40, 08, 00000000
        mov     eax, dword [ebp-0CH]                    ; 4549 _ 8B. 45, F4
        shl     eax, 4                                  ; 454C _ C1. E0, 04
        add     eax, timerctl                           ; 454F _ 05, 000003A0(d)
        mov     dword [eax+0CH], 0                      ; 4554 _ C7. 40, 0C, 00000000
        add     dword [ebp-0CH], 1                      ; 455B _ 83. 45, F4, 01
?_247:  cmp     dword [ebp-0CH], 499                    ; 455F _ 81. 7D, F4, 000001F3
        jle     ?_246                                   ; 4566 _ 7E, CF
        leave                                           ; 4568 _ C9
        ret                                             ; 4569 _ C3
; init_pit End of function

timer_alloc:; Function begin
        push    ebp                                     ; 456A _ 55
        mov     ebp, esp                                ; 456B _ 89. E5
        sub     esp, 16                                 ; 456D _ 83. EC, 10
        mov     dword [ebp-4H], 0                       ; 4570 _ C7. 45, FC, 00000000
        jmp     ?_250                                   ; 4577 _ EB, 38

?_248:  mov     eax, dword [ebp-4H]                     ; 4579 _ 8B. 45, FC
        shl     eax, 4                                  ; 457C _ C1. E0, 04
        add     eax, timerctl                           ; 457F _ 05, 000003A0(d)
        mov     eax, dword [eax+8H]                     ; 4584 _ 8B. 40, 08
        test    eax, eax                                ; 4587 _ 85. C0
        jnz     ?_249                                   ; 4589 _ 75, 22
        mov     eax, dword [ebp-4H]                     ; 458B _ 8B. 45, FC
        shl     eax, 4                                  ; 458E _ C1. E0, 04
        add     eax, timerctl                           ; 4591 _ 05, 000003A0(d)
        mov     dword [eax+8H], 1                       ; 4596 _ C7. 40, 08, 00000001
        mov     eax, dword [ebp-4H]                     ; 459D _ 8B. 45, FC
        shl     eax, 4                                  ; 45A0 _ C1. E0, 04
        add     eax, timerctl                           ; 45A3 _ 05, 000003A0(d)
        add     eax, 4                                  ; 45A8 _ 83. C0, 04
        jmp     ?_251                                   ; 45AB _ EB, 12

?_249:  add     dword [ebp-4H], 1                       ; 45AD _ 83. 45, FC, 01
?_250:  cmp     dword [ebp-4H], 499                     ; 45B1 _ 81. 7D, FC, 000001F3
        jle     ?_248                                   ; 45B8 _ 7E, BF
        mov     eax, 0                                  ; 45BA _ B8, 00000000
?_251:  leave                                           ; 45BF _ C9
        ret                                             ; 45C0 _ C3
; timer_alloc End of function

timer_free:; Function begin
        push    ebp                                     ; 45C1 _ 55
        mov     ebp, esp                                ; 45C2 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 45C4 _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 45C7 _ C7. 40, 04, 00000000
        nop                                             ; 45CE _ 90
        pop     ebp                                     ; 45CF _ 5D
        ret                                             ; 45D0 _ C3
; timer_free End of function

timer_init:; Function begin
        push    ebp                                     ; 45D1 _ 55
        mov     ebp, esp                                ; 45D2 _ 89. E5
        sub     esp, 4                                  ; 45D4 _ 83. EC, 04
        mov     eax, dword [ebp+10H]                    ; 45D7 _ 8B. 45, 10
        mov     byte [ebp-4H], al                       ; 45DA _ 88. 45, FC
        mov     eax, dword [ebp+8H]                     ; 45DD _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 45E0 _ 8B. 55, 0C
        mov     dword [eax+8H], edx                     ; 45E3 _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 45E6 _ 8B. 45, 08
        movzx   edx, byte [ebp-4H]                      ; 45E9 _ 0F B6. 55, FC
        mov     byte [eax+0CH], dl                      ; 45ED _ 88. 50, 0C
        nop                                             ; 45F0 _ 90
        leave                                           ; 45F1 _ C9
        ret                                             ; 45F2 _ C3
; timer_init End of function

timer_settime:; Function begin
        push    ebp                                     ; 45F3 _ 55
        mov     ebp, esp                                ; 45F4 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 45F6 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 45F9 _ 8B. 55, 0C
        mov     dword [eax], edx                        ; 45FC _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 45FE _ 8B. 45, 08
        mov     dword [eax+4H], 2                       ; 4601 _ C7. 40, 04, 00000002
        nop                                             ; 4608 _ 90
        pop     ebp                                     ; 4609 _ 5D
        ret                                             ; 460A _ C3
; timer_settime End of function

intHandlerForTimer:; Function begin
        push    ebp                                     ; 460B _ 55
        mov     ebp, esp                                ; 460C _ 89. E5
        sub     esp, 40                                 ; 460E _ 83. EC, 28
        mov     dword [esp+4H], 32                      ; 4611 _ C7. 44 24, 04, 00000020
        mov     dword [esp], 32                         ; 4619 _ C7. 04 24, 00000020
        call    io_out8                                 ; 4620 _ E8, FFFFFFFC(rel)
        mov     eax, dword [timerctl]                   ; 4625 _ A1, 000003A0(d)
        add     eax, 1                                  ; 462A _ 83. C0, 01
        mov     dword [timerctl], eax                   ; 462D _ A3, 000003A0(d)
        mov     byte [ebp-0DH], 0                       ; 4632 _ C6. 45, F3, 00
        mov     dword [ebp-0CH], 0                      ; 4636 _ C7. 45, F4, 00000000
        jmp     ?_255                                   ; 463D _ E9, 000000B0

?_252:  mov     eax, dword [ebp-0CH]                    ; 4642 _ 8B. 45, F4
        shl     eax, 4                                  ; 4645 _ C1. E0, 04
        add     eax, timerctl                           ; 4648 _ 05, 000003A0(d)
        mov     eax, dword [eax+8H]                     ; 464D _ 8B. 40, 08
        cmp     eax, 2                                  ; 4650 _ 83. F8, 02
        jne     ?_253                                   ; 4653 _ 0F 85, 0000008A
        mov     eax, dword [ebp-0CH]                    ; 4659 _ 8B. 45, F4
        shl     eax, 4                                  ; 465C _ C1. E0, 04
        add     eax, timerctl                           ; 465F _ 05, 000003A0(d)
        mov     eax, dword [eax+4H]                     ; 4664 _ 8B. 40, 04
        lea     edx, [eax-1H]                           ; 4667 _ 8D. 50, FF
        mov     eax, dword [ebp-0CH]                    ; 466A _ 8B. 45, F4
        shl     eax, 4                                  ; 466D _ C1. E0, 04
        add     eax, timerctl                           ; 4670 _ 05, 000003A0(d)
        mov     dword [eax+4H], edx                     ; 4675 _ 89. 50, 04
        mov     eax, dword [ebp-0CH]                    ; 4678 _ 8B. 45, F4
        shl     eax, 4                                  ; 467B _ C1. E0, 04
        add     eax, timerctl                           ; 467E _ 05, 000003A0(d)
        mov     eax, dword [eax+4H]                     ; 4683 _ 8B. 40, 04
        test    eax, eax                                ; 4686 _ 85. C0
        jnz     ?_253                                   ; 4688 _ 75, 59
        mov     eax, dword [ebp-0CH]                    ; 468A _ 8B. 45, F4
        shl     eax, 4                                  ; 468D _ C1. E0, 04
        add     eax, timerctl                           ; 4690 _ 05, 000003A0(d)
        mov     dword [eax+8H], 1                       ; 4695 _ C7. 40, 08, 00000001
        mov     eax, dword [ebp-0CH]                    ; 469C _ 8B. 45, F4
        shl     eax, 4                                  ; 469F _ C1. E0, 04
        add     eax, timerctl                           ; 46A2 _ 05, 000003A0(d)
        movzx   eax, byte [eax+10H]                     ; 46A7 _ 0F B6. 40, 10
        movzx   edx, al                                 ; 46AB _ 0F B6. D0
        mov     eax, dword [ebp-0CH]                    ; 46AE _ 8B. 45, F4
        shl     eax, 4                                  ; 46B1 _ C1. E0, 04
        add     eax, timerctl                           ; 46B4 _ 05, 000003A0(d)
        mov     eax, dword [eax+0CH]                    ; 46B9 _ 8B. 40, 0C
        mov     dword [esp+4H], edx                     ; 46BC _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 46C0 _ 89. 04 24
        call    fifo8_put                               ; 46C3 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 46C8 _ 8B. 45, F4
        shl     eax, 4                                  ; 46CB _ C1. E0, 04
        add     eax, timerctl                           ; 46CE _ 05, 000003A0(d)
        lea     edx, [eax+4H]                           ; 46D3 _ 8D. 50, 04
        mov     eax, dword [task_timer]                 ; 46D6 _ A1, 00000000(d)
        cmp     edx, eax                                ; 46DB _ 39. C2
        jnz     ?_253                                   ; 46DD _ 75, 04
        mov     byte [ebp-0DH], 1                       ; 46DF _ C6. 45, F3, 01
?_253:  cmp     byte [ebp-0DH], 0                       ; 46E3 _ 80. 7D, F3, 00
        jz      ?_254                                   ; 46E7 _ 74, 05
        call    task_switch                             ; 46E9 _ E8, FFFFFFFC(rel)
?_254:  add     dword [ebp-0CH], 1                      ; 46EE _ 83. 45, F4, 01
?_255:  cmp     dword [ebp-0CH], 499                    ; 46F2 _ 81. 7D, F4, 000001F3
        jle     ?_252                                   ; 46F9 _ 0F 8E, FFFFFF43
        nop                                             ; 46FF _ 90
        leave                                           ; 4700 _ C9
        ret                                             ; 4701 _ C3
; intHandlerForTimer End of function

getTimerController:; Function begin
        push    ebp                                     ; 4702 _ 55
        mov     ebp, esp                                ; 4703 _ 89. E5
        mov     eax, timerctl                           ; 4705 _ B8, 000003A0(d)
        pop     ebp                                     ; 470A _ 5D
        ret                                             ; 470B _ C3
; getTimerController End of function

fifo8_init:; Function begin
        push    ebp                                     ; 470C _ 55
        mov     ebp, esp                                ; 470D _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 470F _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 4712 _ 8B. 55, 0C
        mov     dword [eax+0CH], edx                    ; 4715 _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 4718 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 471B _ 8B. 55, 10
        mov     dword [eax], edx                        ; 471E _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 4720 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 4723 _ 8B. 55, 0C
        mov     dword [eax+10H], edx                    ; 4726 _ 89. 50, 10
        mov     eax, dword [ebp+8H]                     ; 4729 _ 8B. 45, 08
        mov     dword [eax+14H], 0                      ; 472C _ C7. 40, 14, 00000000
        mov     eax, dword [ebp+8H]                     ; 4733 _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 4736 _ C7. 40, 04, 00000000
        mov     eax, dword [ebp+8H]                     ; 473D _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 4740 _ C7. 40, 08, 00000000
        mov     eax, dword [ebp+8H]                     ; 4747 _ 8B. 45, 08
        mov     edx, dword [ebp+14H]                    ; 474A _ 8B. 55, 14
        mov     dword [eax+18H], edx                    ; 474D _ 89. 50, 18
        nop                                             ; 4750 _ 90
        pop     ebp                                     ; 4751 _ 5D
        ret                                             ; 4752 _ C3
; fifo8_init End of function

fifo8_put:; Function begin
        push    ebp                                     ; 4753 _ 55
        mov     ebp, esp                                ; 4754 _ 89. E5
        sub     esp, 24                                 ; 4756 _ 83. EC, 18
        mov     eax, dword [ebp+0CH]                    ; 4759 _ 8B. 45, 0C
        mov     byte [ebp-0CH], al                      ; 475C _ 88. 45, F4
        cmp     dword [ebp+8H], 0                       ; 475F _ 83. 7D, 08, 00
        jnz     ?_256                                   ; 4763 _ 75, 0A
        mov     eax, 4294967295                         ; 4765 _ B8, FFFFFFFF
        jmp     ?_260                                   ; 476A _ E9, 000000AB

?_256:  mov     eax, dword [ebp+8H]                     ; 476F _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 4772 _ 8B. 40, 10
        test    eax, eax                                ; 4775 _ 85. C0
        jnz     ?_257                                   ; 4777 _ 75, 1B
        mov     eax, dword [ebp+8H]                     ; 4779 _ 8B. 45, 08
        mov     eax, dword [eax+14H]                    ; 477C _ 8B. 40, 14
        or      eax, 01H                                ; 477F _ 83. C8, 01
        mov     edx, eax                                ; 4782 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 4784 _ 8B. 45, 08
        mov     dword [eax+14H], edx                    ; 4787 _ 89. 50, 14
        mov     eax, 4294967295                         ; 478A _ B8, FFFFFFFF
        jmp     ?_260                                   ; 478F _ E9, 00000086

?_257:  mov     eax, dword [ebp+8H]                     ; 4794 _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 4797 _ 8B. 10
        mov     eax, dword [ebp+8H]                     ; 4799 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 479C _ 8B. 40, 04
        add     edx, eax                                ; 479F _ 01. C2
        movzx   eax, byte [ebp-0CH]                     ; 47A1 _ 0F B6. 45, F4
        mov     byte [edx], al                          ; 47A5 _ 88. 02
        mov     eax, dword [ebp+8H]                     ; 47A7 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 47AA _ 8B. 40, 04
        lea     edx, [eax+1H]                           ; 47AD _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 47B0 _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 47B3 _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 47B6 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 47B9 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 47BC _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 47BF _ 8B. 40, 0C
        cmp     edx, eax                                ; 47C2 _ 39. C2
        jnz     ?_258                                   ; 47C4 _ 75, 0A
        mov     eax, dword [ebp+8H]                     ; 47C6 _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 47C9 _ C7. 40, 04, 00000000
?_258:  mov     eax, dword [ebp+8H]                     ; 47D0 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 47D3 _ 8B. 40, 10
        lea     edx, [eax-1H]                           ; 47D6 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 47D9 _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 47DC _ 89. 50, 10
        mov     eax, dword [ebp+8H]                     ; 47DF _ 8B. 45, 08
        mov     eax, dword [eax+18H]                    ; 47E2 _ 8B. 40, 18
        test    eax, eax                                ; 47E5 _ 85. C0
        jz      ?_259                                   ; 47E7 _ 74, 2C
        mov     eax, dword [ebp+8H]                     ; 47E9 _ 8B. 45, 08
        mov     eax, dword [eax+18H]                    ; 47EC _ 8B. 40, 18
        mov     eax, dword [eax+4H]                     ; 47EF _ 8B. 40, 04
        cmp     eax, 2                                  ; 47F2 _ 83. F8, 02
        jz      ?_259                                   ; 47F5 _ 74, 1E
        mov     eax, dword [ebp+8H]                     ; 47F7 _ 8B. 45, 08
        mov     eax, dword [eax+18H]                    ; 47FA _ 8B. 40, 18
        mov     dword [esp+8H], 0                       ; 47FD _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], -1                      ; 4805 _ C7. 44 24, 04, FFFFFFFF
        mov     dword [esp], eax                        ; 480D _ 89. 04 24
        call    task_run                                ; 4810 _ E8, FFFFFFFC(rel)
?_259:  mov     eax, 0                                  ; 4815 _ B8, 00000000
?_260:  leave                                           ; 481A _ C9
        ret                                             ; 481B _ C3
; fifo8_put End of function

fifo8_get:; Function begin
        push    ebp                                     ; 481C _ 55
        mov     ebp, esp                                ; 481D _ 89. E5
        sub     esp, 16                                 ; 481F _ 83. EC, 10
        mov     eax, dword [ebp+8H]                     ; 4822 _ 8B. 45, 08
        mov     edx, dword [eax+10H]                    ; 4825 _ 8B. 50, 10
        mov     eax, dword [ebp+8H]                     ; 4828 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 482B _ 8B. 40, 0C
        cmp     edx, eax                                ; 482E _ 39. C2
        jnz     ?_261                                   ; 4830 _ 75, 07
        mov     eax, 4294967295                         ; 4832 _ B8, FFFFFFFF
        jmp     ?_263                                   ; 4837 _ EB, 51

?_261:  mov     eax, dword [ebp+8H]                     ; 4839 _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 483C _ 8B. 10
        mov     eax, dword [ebp+8H]                     ; 483E _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 4841 _ 8B. 40, 08
        add     eax, edx                                ; 4844 _ 01. D0
        movzx   eax, byte [eax]                         ; 4846 _ 0F B6. 00
        movzx   eax, al                                 ; 4849 _ 0F B6. C0
        mov     dword [ebp-4H], eax                     ; 484C _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 484F _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 4852 _ 8B. 40, 08
        lea     edx, [eax+1H]                           ; 4855 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 4858 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 485B _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 485E _ 8B. 45, 08
        mov     edx, dword [eax+8H]                     ; 4861 _ 8B. 50, 08
        mov     eax, dword [ebp+8H]                     ; 4864 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 4867 _ 8B. 40, 0C
        cmp     edx, eax                                ; 486A _ 39. C2
        jnz     ?_262                                   ; 486C _ 75, 0A
        mov     eax, dword [ebp+8H]                     ; 486E _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 4871 _ C7. 40, 08, 00000000
?_262:  mov     eax, dword [ebp+8H]                     ; 4878 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 487B _ 8B. 40, 10
        lea     edx, [eax+1H]                           ; 487E _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 4881 _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 4884 _ 89. 50, 10
        mov     eax, dword [ebp-4H]                     ; 4887 _ 8B. 45, FC
?_263:  leave                                           ; 488A _ C9
        ret                                             ; 488B _ C3
; fifo8_get End of function

fifo8_status:; Function begin
        push    ebp                                     ; 488C _ 55
        mov     ebp, esp                                ; 488D _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 488F _ 8B. 45, 08
        mov     edx, dword [eax+0CH]                    ; 4892 _ 8B. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 4895 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 4898 _ 8B. 40, 10
        sub     edx, eax                                ; 489B _ 29. C2
        mov     eax, edx                                ; 489D _ 89. D0
        pop     ebp                                     ; 489F _ 5D
        ret                                             ; 48A0 _ C3
; fifo8_status End of function

strcmp: ; Function begin
        push    ebp                                     ; 48A1 _ 55
        mov     ebp, esp                                ; 48A2 _ 89. E5
        sub     esp, 16                                 ; 48A4 _ 83. EC, 10
        cmp     dword [ebp+8H], 0                       ; 48A7 _ 83. 7D, 08, 00
        jz      ?_264                                   ; 48AB _ 74, 06
        cmp     dword [ebp+0CH], 0                      ; 48AD _ 83. 7D, 0C, 00
        jnz     ?_265                                   ; 48B1 _ 75, 0A
?_264:  mov     eax, 0                                  ; 48B3 _ B8, 00000000
        jmp     ?_272                                   ; 48B8 _ E9, 0000009B

?_265:  mov     dword [ebp-4H], 0                       ; 48BD _ C7. 45, FC, 00000000
        jmp     ?_268                                   ; 48C4 _ EB, 25

?_266:  mov     edx, dword [ebp-4H]                     ; 48C6 _ 8B. 55, FC
        mov     eax, dword [ebp+8H]                     ; 48C9 _ 8B. 45, 08
        add     eax, edx                                ; 48CC _ 01. D0
        movzx   edx, byte [eax]                         ; 48CE _ 0F B6. 10
        mov     ecx, dword [ebp-4H]                     ; 48D1 _ 8B. 4D, FC
        mov     eax, dword [ebp+0CH]                    ; 48D4 _ 8B. 45, 0C
        add     eax, ecx                                ; 48D7 _ 01. C8
        movzx   eax, byte [eax]                         ; 48D9 _ 0F B6. 00
        cmp     dl, al                                  ; 48DC _ 38. C2
        jz      ?_267                                   ; 48DE _ 74, 07
        mov     eax, 0                                  ; 48E0 _ B8, 00000000
        jmp     ?_272                                   ; 48E5 _ EB, 71

?_267:  add     dword [ebp-4H], 1                       ; 48E7 _ 83. 45, FC, 01
?_268:  mov     edx, dword [ebp-4H]                     ; 48EB _ 8B. 55, FC
        mov     eax, dword [ebp+8H]                     ; 48EE _ 8B. 45, 08
        add     eax, edx                                ; 48F1 _ 01. D0
        movzx   eax, byte [eax]                         ; 48F3 _ 0F B6. 00
        test    al, al                                  ; 48F6 _ 84. C0
        jz      ?_269                                   ; 48F8 _ 74, 0F
        mov     edx, dword [ebp-4H]                     ; 48FA _ 8B. 55, FC
        mov     eax, dword [ebp+0CH]                    ; 48FD _ 8B. 45, 0C
        add     eax, edx                                ; 4900 _ 01. D0
        movzx   eax, byte [eax]                         ; 4902 _ 0F B6. 00
        test    al, al                                  ; 4905 _ 84. C0
        jnz     ?_266                                   ; 4907 _ 75, BD
?_269:  mov     edx, dword [ebp-4H]                     ; 4909 _ 8B. 55, FC
        mov     eax, dword [ebp+8H]                     ; 490C _ 8B. 45, 08
        add     eax, edx                                ; 490F _ 01. D0
        movzx   eax, byte [eax]                         ; 4911 _ 0F B6. 00
        test    al, al                                  ; 4914 _ 84. C0
        jnz     ?_270                                   ; 4916 _ 75, 16
        mov     edx, dword [ebp-4H]                     ; 4918 _ 8B. 55, FC
        mov     eax, dword [ebp+0CH]                    ; 491B _ 8B. 45, 0C
        add     eax, edx                                ; 491E _ 01. D0
        movzx   eax, byte [eax]                         ; 4920 _ 0F B6. 00
        test    al, al                                  ; 4923 _ 84. C0
        jz      ?_270                                   ; 4925 _ 74, 07
        mov     eax, 0                                  ; 4927 _ B8, 00000000
        jmp     ?_272                                   ; 492C _ EB, 2A

?_270:  mov     edx, dword [ebp-4H]                     ; 492E _ 8B. 55, FC
        mov     eax, dword [ebp+8H]                     ; 4931 _ 8B. 45, 08
        add     eax, edx                                ; 4934 _ 01. D0
        movzx   eax, byte [eax]                         ; 4936 _ 0F B6. 00
        test    al, al                                  ; 4939 _ 84. C0
        jz      ?_271                                   ; 493B _ 74, 16
        mov     edx, dword [ebp-4H]                     ; 493D _ 8B. 55, FC
        mov     eax, dword [ebp+0CH]                    ; 4940 _ 8B. 45, 0C
        add     eax, edx                                ; 4943 _ 01. D0
        movzx   eax, byte [eax]                         ; 4945 _ 0F B6. 00
        test    al, al                                  ; 4948 _ 84. C0
        jz      ?_271                                   ; 494A _ 74, 07
        mov     eax, 0                                  ; 494C _ B8, 00000000
        jmp     ?_272                                   ; 4951 _ EB, 05

?_271:  mov     eax, 1                                  ; 4953 _ B8, 00000001
?_272:  leave                                           ; 4958 _ C9
        ret                                             ; 4959 _ C3
; strcmp End of function

set_segmdesc:; Function begin
        push    ebp                                     ; 495A _ 55
        mov     ebp, esp                                ; 495B _ 89. E5
        cmp     dword [ebp+0CH], 1048575                ; 495D _ 81. 7D, 0C, 000FFFFF
        jbe     ?_273                                   ; 4964 _ 76, 10
        or      dword [ebp+14H], 8000H                  ; 4966 _ 81. 4D, 14, 00008000
        mov     eax, dword [ebp+0CH]                    ; 496D _ 8B. 45, 0C
        shr     eax, 12                                 ; 4970 _ C1. E8, 0C
        mov     dword [ebp+0CH], eax                    ; 4973 _ 89. 45, 0C
?_273:  mov     eax, dword [ebp+0CH]                    ; 4976 _ 8B. 45, 0C
        mov     edx, eax                                ; 4979 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 497B _ 8B. 45, 08
        mov     word [eax], dx                          ; 497E _ 66: 89. 10
        mov     eax, dword [ebp+10H]                    ; 4981 _ 8B. 45, 10
        mov     edx, eax                                ; 4984 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 4986 _ 8B. 45, 08
        mov     word [eax+2H], dx                       ; 4989 _ 66: 89. 50, 02
        mov     eax, dword [ebp+10H]                    ; 498D _ 8B. 45, 10
        sar     eax, 16                                 ; 4990 _ C1. F8, 10
        mov     edx, eax                                ; 4993 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 4995 _ 8B. 45, 08
        mov     byte [eax+4H], dl                       ; 4998 _ 88. 50, 04
        mov     eax, dword [ebp+14H]                    ; 499B _ 8B. 45, 14
        mov     edx, eax                                ; 499E _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 49A0 _ 8B. 45, 08
        mov     byte [eax+5H], dl                       ; 49A3 _ 88. 50, 05
        mov     eax, dword [ebp+0CH]                    ; 49A6 _ 8B. 45, 0C
        shr     eax, 16                                 ; 49A9 _ C1. E8, 10
        and     eax, 0FH                                ; 49AC _ 83. E0, 0F
        mov     edx, eax                                ; 49AF _ 89. C2
        mov     eax, dword [ebp+14H]                    ; 49B1 _ 8B. 45, 14
        sar     eax, 8                                  ; 49B4 _ C1. F8, 08
        and     eax, 0FFFFFFF0H                         ; 49B7 _ 83. E0, F0
        or      eax, edx                                ; 49BA _ 09. D0
        mov     edx, eax                                ; 49BC _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 49BE _ 8B. 45, 08
        mov     byte [eax+6H], dl                       ; 49C1 _ 88. 50, 06
        mov     eax, dword [ebp+10H]                    ; 49C4 _ 8B. 45, 10
        shr     eax, 24                                 ; 49C7 _ C1. E8, 18
        mov     edx, eax                                ; 49CA _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 49CC _ 8B. 45, 08
        mov     byte [eax+7H], dl                       ; 49CF _ 88. 50, 07
        nop                                             ; 49D2 _ 90
        pop     ebp                                     ; 49D3 _ 5D
        ret                                             ; 49D4 _ C3
; set_segmdesc End of function

get_taskctl:; Function begin
        push    ebp                                     ; 49D5 _ 55
        mov     ebp, esp                                ; 49D6 _ 89. E5
        mov     eax, dword [taskctl]                    ; 49D8 _ A1, 000022E8(d)
        pop     ebp                                     ; 49DD _ 5D
        ret                                             ; 49DE _ C3
; get_taskctl End of function

init_task_level:; Function begin
        push    ebp                                     ; 49DF _ 55
        mov     ebp, esp                                ; 49E0 _ 89. E5
        sub     esp, 16                                 ; 49E2 _ 83. EC, 10
        mov     ecx, dword [taskctl]                    ; 49E5 _ 8B. 0D, 000022E8(d)
        mov     edx, dword [ebp+8H]                     ; 49EB _ 8B. 55, 08
        mov     eax, edx                                ; 49EE _ 89. D0
        shl     eax, 2                                  ; 49F0 _ C1. E0, 02
        add     eax, edx                                ; 49F3 _ 01. D0
        shl     eax, 2                                  ; 49F5 _ C1. E0, 02
        add     eax, ecx                                ; 49F8 _ 01. C8
        add     eax, 8                                  ; 49FA _ 83. C0, 08
        mov     dword [eax], 0                          ; 49FD _ C7. 00, 00000000
        mov     ecx, dword [taskctl]                    ; 4A03 _ 8B. 0D, 000022E8(d)
        mov     edx, dword [ebp+8H]                     ; 4A09 _ 8B. 55, 08
        mov     eax, edx                                ; 4A0C _ 89. D0
        shl     eax, 2                                  ; 4A0E _ C1. E0, 02
        add     eax, edx                                ; 4A11 _ 01. D0
        shl     eax, 2                                  ; 4A13 _ C1. E0, 02
        add     eax, ecx                                ; 4A16 _ 01. C8
        add     eax, 12                                 ; 4A18 _ 83. C0, 0C
        mov     dword [eax], 0                          ; 4A1B _ C7. 00, 00000000
        mov     dword [ebp-4H], 0                       ; 4A21 _ C7. 45, FC, 00000000
        jmp     ?_275                                   ; 4A28 _ EB, 21

?_274:  mov     ecx, dword [taskctl]                    ; 4A2A _ 8B. 0D, 000022E8(d)
        mov     edx, dword [ebp-4H]                     ; 4A30 _ 8B. 55, FC
        mov     eax, edx                                ; 4A33 _ 89. D0
        add     eax, eax                                ; 4A35 _ 01. C0
        add     eax, edx                                ; 4A37 _ 01. D0
        shl     eax, 3                                  ; 4A39 _ C1. E0, 03
        add     eax, ecx                                ; 4A3C _ 01. C8
        add     eax, 16                                 ; 4A3E _ 83. C0, 10
        mov     dword [eax], 0                          ; 4A41 _ C7. 00, 00000000
        add     dword [ebp-4H], 1                       ; 4A47 _ 83. 45, FC, 01
?_275:  cmp     dword [ebp-4H], 2                       ; 4A4B _ 83. 7D, FC, 02
        jle     ?_274                                   ; 4A4F _ 7E, D9
        leave                                           ; 4A51 _ C9
        ret                                             ; 4A52 _ C3
; init_task_level End of function

task_init:; Function begin
        push    ebp                                     ; 4A53 _ 55
        mov     ebp, esp                                ; 4A54 _ 89. E5
        sub     esp, 40                                 ; 4A56 _ 83. EC, 28
        call    get_addr_gdt                            ; 4A59 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 4A5E _ 89. 45, F0
        mov     dword [esp+4H], 808                     ; 4A61 _ C7. 44 24, 04, 00000328
        mov     eax, dword [ebp+8H]                     ; 4A69 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 4A6C _ 89. 04 24
        call    memman_alloc_4k                         ; 4A6F _ E8, FFFFFFFC(rel)
        mov     dword [taskctl], eax                    ; 4A74 _ A3, 000022E8(d)
        mov     dword [ebp-14H], 0                      ; 4A79 _ C7. 45, EC, 00000000
        jmp     ?_277                                   ; 4A80 _ E9, 00000085

?_276:  mov     edx, dword [taskctl]                    ; 4A85 _ 8B. 15, 000022E8(d)
        mov     eax, dword [ebp-14H]                    ; 4A8B _ 8B. 45, EC
        imul    eax, eax, 148                           ; 4A8E _ 69. C0, 00000094
        add     eax, edx                                ; 4A94 _ 01. D0
        add     eax, 72                                 ; 4A96 _ 83. C0, 48
        mov     dword [eax], 0                          ; 4A99 _ C7. 00, 00000000
        mov     ecx, dword [taskctl]                    ; 4A9F _ 8B. 0D, 000022E8(d)
        mov     eax, dword [ebp-14H]                    ; 4AA5 _ 8B. 45, EC
        add     eax, 7                                  ; 4AA8 _ 83. C0, 07
        lea     edx, [eax*8]                            ; 4AAB _ 8D. 14 C5, 00000000
        mov     eax, dword [ebp-14H]                    ; 4AB2 _ 8B. 45, EC
        imul    eax, eax, 148                           ; 4AB5 _ 69. C0, 00000094
        add     eax, ecx                                ; 4ABB _ 01. C8
        add     eax, 68                                 ; 4ABD _ 83. C0, 44
        mov     dword [eax], edx                        ; 4AC0 _ 89. 10
        mov     eax, dword [taskctl]                    ; 4AC2 _ A1, 000022E8(d)
        mov     edx, dword [ebp-14H]                    ; 4AC7 _ 8B. 55, EC
        imul    edx, edx, 148                           ; 4ACA _ 69. D2, 00000094
        add     edx, 96                                 ; 4AD0 _ 83. C2, 60
        add     eax, edx                                ; 4AD3 _ 01. D0
        add     eax, 16                                 ; 4AD5 _ 83. C0, 10
        mov     edx, dword [ebp-14H]                    ; 4AD8 _ 8B. 55, EC
        add     edx, 7                                  ; 4ADB _ 83. C2, 07
        lea     ecx, [edx*8]                            ; 4ADE _ 8D. 0C D5, 00000000
        mov     edx, dword [ebp-10H]                    ; 4AE5 _ 8B. 55, F0
        add     edx, ecx                                ; 4AE8 _ 01. CA
        mov     dword [esp+0CH], 137                    ; 4AEA _ C7. 44 24, 0C, 00000089
        mov     dword [esp+8H], eax                     ; 4AF2 _ 89. 44 24, 08
        mov     dword [esp+4H], 103                     ; 4AF6 _ C7. 44 24, 04, 00000067
        mov     dword [esp], edx                        ; 4AFE _ 89. 14 24
        call    set_segmdesc                            ; 4B01 _ E8, FFFFFFFC(rel)
        add     dword [ebp-14H], 1                      ; 4B06 _ 83. 45, EC, 01
?_277:  cmp     dword [ebp-14H], 4                      ; 4B0A _ 83. 7D, EC, 04
        jle     ?_276                                   ; 4B0E _ 0F 8E, FFFFFF71
        mov     dword [ebp-14H], 0                      ; 4B14 _ C7. 45, EC, 00000000
        jmp     ?_279                                   ; 4B1B _ EB, 0F

?_278:  mov     eax, dword [ebp-14H]                    ; 4B1D _ 8B. 45, EC
        mov     dword [esp], eax                        ; 4B20 _ 89. 04 24
        call    init_task_level                         ; 4B23 _ E8, FFFFFFFC(rel)
        add     dword [ebp-14H], 1                      ; 4B28 _ 83. 45, EC, 01
?_279:  cmp     dword [ebp-14H], 2                      ; 4B2C _ 83. 7D, EC, 02
        jle     ?_278                                   ; 4B30 _ 7E, EB
        call    task_alloc                              ; 4B32 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 4B37 _ 89. 45, F4
        mov     eax, dword [ebp-0CH]                    ; 4B3A _ 8B. 45, F4
        mov     dword [eax+4H], 2                       ; 4B3D _ C7. 40, 04, 00000002
        mov     eax, dword [ebp-0CH]                    ; 4B44 _ 8B. 45, F4
        mov     dword [eax+8H], 100                     ; 4B47 _ C7. 40, 08, 00000064
        mov     eax, dword [ebp-0CH]                    ; 4B4E _ 8B. 45, F4
        mov     dword [eax+0CH], 0                      ; 4B51 _ C7. 40, 0C, 00000000
        mov     eax, dword [ebp-0CH]                    ; 4B58 _ 8B. 45, F4
        mov     dword [esp], eax                        ; 4B5B _ 89. 04 24
        call    task_add                                ; 4B5E _ E8, FFFFFFFC(rel)
        call    task_switchsub                          ; 4B63 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 4B68 _ 8B. 45, F4
        mov     eax, dword [eax]                        ; 4B6B _ 8B. 00
        mov     dword [esp], eax                        ; 4B6D _ 89. 04 24
        call    load_tr                                 ; 4B70 _ E8, FFFFFFFC(rel)
        call    timer_alloc                             ; 4B75 _ E8, FFFFFFFC(rel)
        mov     dword [task_timer], eax                 ; 4B7A _ A3, 000022E4(d)
        mov     eax, dword [ebp-0CH]                    ; 4B7F _ 8B. 45, F4
        mov     eax, dword [eax+8H]                     ; 4B82 _ 8B. 40, 08
        mov     edx, eax                                ; 4B85 _ 89. C2
        mov     eax, dword [task_timer]                 ; 4B87 _ A1, 000022E4(d)
        mov     dword [esp+4H], edx                     ; 4B8C _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 4B90 _ 89. 04 24
        call    timer_settime                           ; 4B93 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 4B98 _ 8B. 45, F4
        leave                                           ; 4B9B _ C9
        ret                                             ; 4B9C _ C3
; task_init End of function

task_alloc:; Function begin
        push    ebp                                     ; 4B9D _ 55
        mov     ebp, esp                                ; 4B9E _ 89. E5
        sub     esp, 16                                 ; 4BA0 _ 83. EC, 10
        mov     dword [ebp-8H], 0                       ; 4BA3 _ C7. 45, F8, 00000000
        jmp     ?_282                                   ; 4BAA _ E9, 00000100

?_280:  mov     edx, dword [taskctl]                    ; 4BAF _ 8B. 15, 000022E8(d)
        mov     eax, dword [ebp-8H]                     ; 4BB5 _ 8B. 45, F8
        imul    eax, eax, 148                           ; 4BB8 _ 69. C0, 00000094
        add     eax, edx                                ; 4BBE _ 01. D0
        add     eax, 72                                 ; 4BC0 _ 83. C0, 48
        mov     eax, dword [eax]                        ; 4BC3 _ 8B. 00
        test    eax, eax                                ; 4BC5 _ 85. C0
        jne     ?_281                                   ; 4BC7 _ 0F 85, 000000DE
        mov     eax, dword [taskctl]                    ; 4BCD _ A1, 000022E8(d)
        mov     edx, dword [ebp-8H]                     ; 4BD2 _ 8B. 55, F8
        imul    edx, edx, 148                           ; 4BD5 _ 69. D2, 00000094
        add     edx, 64                                 ; 4BDB _ 83. C2, 40
        add     eax, edx                                ; 4BDE _ 01. D0
        add     eax, 4                                  ; 4BE0 _ 83. C0, 04
        mov     dword [ebp-4H], eax                     ; 4BE3 _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 4BE6 _ 8B. 45, FC
        mov     dword [eax+4H], 1                       ; 4BE9 _ C7. 40, 04, 00000001
        mov     eax, dword [ebp-4H]                     ; 4BF0 _ 8B. 45, FC
        mov     dword [eax+50H], 514                    ; 4BF3 _ C7. 40, 50, 00000202
        mov     eax, dword [ebp-4H]                     ; 4BFA _ 8B. 45, FC
        mov     dword [eax+54H], 0                      ; 4BFD _ C7. 40, 54, 00000000
        mov     eax, dword [ebp-4H]                     ; 4C04 _ 8B. 45, FC
        mov     dword [eax+58H], 0                      ; 4C07 _ C7. 40, 58, 00000000
        mov     eax, dword [ebp-4H]                     ; 4C0E _ 8B. 45, FC
        mov     dword [eax+5CH], 0                      ; 4C11 _ C7. 40, 5C, 00000000
        mov     eax, dword [ebp-4H]                     ; 4C18 _ 8B. 45, FC
        mov     dword [eax+60H], 0                      ; 4C1B _ C7. 40, 60, 00000000
        mov     eax, dword [ebp-4H]                     ; 4C22 _ 8B. 45, FC
        mov     dword [eax+68H], 0                      ; 4C25 _ C7. 40, 68, 00000000
        mov     eax, dword [ebp-8H]                     ; 4C2C _ 8B. 45, F8
        add     eax, 1                                  ; 4C2F _ 83. C0, 01
        shl     eax, 9                                  ; 4C32 _ C1. E0, 09
        mov     edx, eax                                ; 4C35 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 4C37 _ 8B. 45, FC
        mov     dword [eax+64H], edx                    ; 4C3A _ 89. 50, 64
        mov     eax, dword [ebp-4H]                     ; 4C3D _ 8B. 45, FC
        mov     dword [eax+6CH], 0                      ; 4C40 _ C7. 40, 6C, 00000000
        mov     eax, dword [ebp-4H]                     ; 4C47 _ 8B. 45, FC
        mov     dword [eax+70H], 0                      ; 4C4A _ C7. 40, 70, 00000000
        mov     eax, dword [ebp-4H]                     ; 4C51 _ 8B. 45, FC
        mov     dword [eax+74H], 0                      ; 4C54 _ C7. 40, 74, 00000000
        mov     eax, dword [ebp-4H]                     ; 4C5B _ 8B. 45, FC
        mov     dword [eax+80H], 0                      ; 4C5E _ C7. 80, 00000080, 00000000
        mov     eax, dword [ebp-4H]                     ; 4C68 _ 8B. 45, FC
        mov     dword [eax+84H], 0                      ; 4C6B _ C7. 80, 00000084, 00000000
        mov     eax, dword [ebp-4H]                     ; 4C75 _ 8B. 45, FC
        mov     dword [eax+88H], 0                      ; 4C78 _ C7. 80, 00000088, 00000000
        mov     eax, dword [ebp-4H]                     ; 4C82 _ 8B. 45, FC
        mov     dword [eax+34H], 0                      ; 4C85 _ C7. 40, 34, 00000000
        mov     eax, dword [ebp-4H]                     ; 4C8C _ 8B. 45, FC
        mov     dword [eax+8CH], 0                      ; 4C8F _ C7. 80, 0000008C, 00000000
        mov     eax, dword [ebp-4H]                     ; 4C99 _ 8B. 45, FC
        mov     dword [eax+90H], 1073741824             ; 4C9C _ C7. 80, 00000090, 40000000
        mov     eax, dword [ebp-4H]                     ; 4CA6 _ 8B. 45, FC
        jmp     ?_283                                   ; 4CA9 _ EB, 13

?_281:  add     dword [ebp-8H], 1                       ; 4CAB _ 83. 45, F8, 01
?_282:  cmp     dword [ebp-8H], 4                       ; 4CAF _ 83. 7D, F8, 04
        jle     ?_280                                   ; 4CB3 _ 0F 8E, FFFFFEF6
        mov     eax, 0                                  ; 4CB9 _ B8, 00000000
?_283:  leave                                           ; 4CBE _ C9
        ret                                             ; 4CBF _ C3
; task_alloc End of function

task_run:; Function begin
        push    ebp                                     ; 4CC0 _ 55
        mov     ebp, esp                                ; 4CC1 _ 89. E5
        sub     esp, 24                                 ; 4CC3 _ 83. EC, 18
        cmp     dword [ebp+0CH], 0                      ; 4CC6 _ 83. 7D, 0C, 00
        jns     ?_284                                   ; 4CCA _ 79, 09
        mov     eax, dword [ebp+8H]                     ; 4CCC _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 4CCF _ 8B. 40, 0C
        mov     dword [ebp+0CH], eax                    ; 4CD2 _ 89. 45, 0C
?_284:  cmp     dword [ebp+10H], 0                      ; 4CD5 _ 83. 7D, 10, 00
        jle     ?_285                                   ; 4CD9 _ 7E, 09
        mov     eax, dword [ebp+8H]                     ; 4CDB _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 4CDE _ 8B. 55, 10
        mov     dword [eax+8H], edx                     ; 4CE1 _ 89. 50, 08
?_285:  mov     eax, dword [ebp+8H]                     ; 4CE4 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 4CE7 _ 8B. 40, 04
        cmp     eax, 2                                  ; 4CEA _ 83. F8, 02
        jnz     ?_286                                   ; 4CED _ 75, 16
        mov     eax, dword [ebp+8H]                     ; 4CEF _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 4CF2 _ 8B. 40, 0C
        cmp     eax, dword [ebp+0CH]                    ; 4CF5 _ 3B. 45, 0C
        jz      ?_286                                   ; 4CF8 _ 74, 0B
        mov     eax, dword [ebp+8H]                     ; 4CFA _ 8B. 45, 08
        mov     dword [esp], eax                        ; 4CFD _ 89. 04 24
        call    task_remove                             ; 4D00 _ E8, FFFFFFFC(rel)
?_286:  mov     eax, dword [ebp+8H]                     ; 4D05 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 4D08 _ 8B. 40, 04
        cmp     eax, 2                                  ; 4D0B _ 83. F8, 02
        jz      ?_287                                   ; 4D0E _ 74, 14
        mov     eax, dword [ebp+8H]                     ; 4D10 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 4D13 _ 8B. 55, 0C
        mov     dword [eax+0CH], edx                    ; 4D16 _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 4D19 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 4D1C _ 89. 04 24
        call    task_add                                ; 4D1F _ E8, FFFFFFFC(rel)
?_287:  mov     eax, dword [taskctl]                    ; 4D24 _ A1, 000022E8(d)
        mov     dword [eax+4H], 1                       ; 4D29 _ C7. 40, 04, 00000001
        nop                                             ; 4D30 _ 90
        leave                                           ; 4D31 _ C9
        ret                                             ; 4D32 _ C3
; task_run End of function

task_switch:; Function begin
        push    ebp                                     ; 4D33 _ 55
        mov     ebp, esp                                ; 4D34 _ 89. E5
        sub     esp, 40                                 ; 4D36 _ 83. EC, 28
        mov     ecx, dword [taskctl]                    ; 4D39 _ 8B. 0D, 000022E8(d)
        mov     eax, dword [taskctl]                    ; 4D3F _ A1, 000022E8(d)
        mov     edx, dword [eax]                        ; 4D44 _ 8B. 10
        mov     eax, edx                                ; 4D46 _ 89. D0
        shl     eax, 2                                  ; 4D48 _ C1. E0, 02
        add     eax, edx                                ; 4D4B _ 01. D0
        shl     eax, 2                                  ; 4D4D _ C1. E0, 02
        add     eax, ecx                                ; 4D50 _ 01. C8
        add     eax, 8                                  ; 4D52 _ 83. C0, 08
        mov     dword [ebp-14H], eax                    ; 4D55 _ 89. 45, EC
        mov     eax, dword [ebp-14H]                    ; 4D58 _ 8B. 45, EC
        mov     edx, dword [eax+4H]                     ; 4D5B _ 8B. 50, 04
        mov     eax, dword [ebp-14H]                    ; 4D5E _ 8B. 45, EC
        mov     eax, dword [eax+edx*4+8H]               ; 4D61 _ 8B. 44 90, 08
        mov     dword [ebp-10H], eax                    ; 4D65 _ 89. 45, F0
        mov     eax, dword [ebp-14H]                    ; 4D68 _ 8B. 45, EC
        mov     eax, dword [eax+4H]                     ; 4D6B _ 8B. 40, 04
        lea     edx, [eax+1H]                           ; 4D6E _ 8D. 50, 01
        mov     eax, dword [ebp-14H]                    ; 4D71 _ 8B. 45, EC
        mov     dword [eax+4H], edx                     ; 4D74 _ 89. 50, 04
        mov     eax, dword [ebp-14H]                    ; 4D77 _ 8B. 45, EC
        mov     edx, dword [eax+4H]                     ; 4D7A _ 8B. 50, 04
        mov     eax, dword [ebp-14H]                    ; 4D7D _ 8B. 45, EC
        mov     eax, dword [eax]                        ; 4D80 _ 8B. 00
        cmp     edx, eax                                ; 4D82 _ 39. C2
        jnz     ?_288                                   ; 4D84 _ 75, 0A
        mov     eax, dword [ebp-14H]                    ; 4D86 _ 8B. 45, EC
        mov     dword [eax+4H], 0                       ; 4D89 _ C7. 40, 04, 00000000
?_288:  mov     eax, dword [taskctl]                    ; 4D90 _ A1, 000022E8(d)
        mov     eax, dword [eax+4H]                     ; 4D95 _ 8B. 40, 04
        test    eax, eax                                ; 4D98 _ 85. C0
        jz      ?_289                                   ; 4D9A _ 74, 24
        call    task_switchsub                          ; 4D9C _ E8, FFFFFFFC(rel)
        mov     ecx, dword [taskctl]                    ; 4DA1 _ 8B. 0D, 000022E8(d)
        mov     eax, dword [taskctl]                    ; 4DA7 _ A1, 000022E8(d)
        mov     edx, dword [eax]                        ; 4DAC _ 8B. 10
        mov     eax, edx                                ; 4DAE _ 89. D0
        shl     eax, 2                                  ; 4DB0 _ C1. E0, 02
        add     eax, edx                                ; 4DB3 _ 01. D0
        shl     eax, 2                                  ; 4DB5 _ C1. E0, 02
        add     eax, ecx                                ; 4DB8 _ 01. C8
        add     eax, 8                                  ; 4DBA _ 83. C0, 08
        mov     dword [ebp-14H], eax                    ; 4DBD _ 89. 45, EC
?_289:  mov     eax, dword [ebp-14H]                    ; 4DC0 _ 8B. 45, EC
        mov     edx, dword [eax+4H]                     ; 4DC3 _ 8B. 50, 04
        mov     eax, dword [ebp-14H]                    ; 4DC6 _ 8B. 45, EC
        mov     eax, dword [eax+edx*4+8H]               ; 4DC9 _ 8B. 44 90, 08
        mov     dword [ebp-0CH], eax                    ; 4DCD _ 89. 45, F4
        mov     eax, dword [ebp-0CH]                    ; 4DD0 _ 8B. 45, F4
        mov     eax, dword [eax+8H]                     ; 4DD3 _ 8B. 40, 08
        mov     edx, eax                                ; 4DD6 _ 89. C2
        mov     eax, dword [task_timer]                 ; 4DD8 _ A1, 000022E4(d)
        mov     dword [esp+4H], edx                     ; 4DDD _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 4DE1 _ 89. 04 24
        call    timer_settime                           ; 4DE4 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 4DE9 _ 8B. 45, F4
        cmp     eax, dword [ebp-10H]                    ; 4DEC _ 3B. 45, F0
        jz      ?_290                                   ; 4DEF _ 74, 1B
        cmp     dword [ebp-0CH], 0                      ; 4DF1 _ 83. 7D, F4, 00
        jz      ?_290                                   ; 4DF5 _ 74, 15
        mov     eax, dword [ebp-0CH]                    ; 4DF7 _ 8B. 45, F4
        mov     eax, dword [eax]                        ; 4DFA _ 8B. 00
        mov     dword [esp+4H], eax                     ; 4DFC _ 89. 44 24, 04
        mov     dword [esp], 0                          ; 4E00 _ C7. 04 24, 00000000
        call    farjmp                                  ; 4E07 _ E8, FFFFFFFC(rel)
?_290:  nop                                             ; 4E0C _ 90
        leave                                           ; 4E0D _ C9
        ret                                             ; 4E0E _ C3
; task_switch End of function

task_sleep:; Function begin
        push    ebp                                     ; 4E0F _ 55
        mov     ebp, esp                                ; 4E10 _ 89. E5
        sub     esp, 40                                 ; 4E12 _ 83. EC, 28
        mov     dword [ebp-0CH], 0                      ; 4E15 _ C7. 45, F4, 00000000
        mov     dword [ebp-10H], 0                      ; 4E1C _ C7. 45, F0, 00000000
        mov     eax, dword [ebp+8H]                     ; 4E23 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 4E26 _ 8B. 40, 04
        cmp     eax, 2                                  ; 4E29 _ 83. F8, 02
        jnz     ?_291                                   ; 4E2C _ 75, 51
        call    task_now                                ; 4E2E _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 4E33 _ 89. 45, F4
        mov     eax, dword [ebp+8H]                     ; 4E36 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 4E39 _ 89. 04 24
        call    task_remove                             ; 4E3C _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], 1                      ; 4E41 _ C7. 45, F0, 00000001
        mov     eax, dword [ebp+8H]                     ; 4E48 _ 8B. 45, 08
        cmp     eax, dword [ebp-0CH]                    ; 4E4B _ 3B. 45, F4
        jnz     ?_291                                   ; 4E4E _ 75, 2F
        call    task_switchsub                          ; 4E50 _ E8, FFFFFFFC(rel)
        call    task_now                                ; 4E55 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 4E5A _ 89. 45, F4
        mov     dword [ebp-10H], 2                      ; 4E5D _ C7. 45, F0, 00000002
        cmp     dword [ebp-0CH], 0                      ; 4E64 _ 83. 7D, F4, 00
        jz      ?_291                                   ; 4E68 _ 74, 15
        mov     eax, dword [ebp-0CH]                    ; 4E6A _ 8B. 45, F4
        mov     eax, dword [eax]                        ; 4E6D _ 8B. 00
        mov     dword [esp+4H], eax                     ; 4E6F _ 89. 44 24, 04
        mov     dword [esp], 0                          ; 4E73 _ C7. 04 24, 00000000
        call    farjmp                                  ; 4E7A _ E8, FFFFFFFC(rel)
?_291:  mov     eax, dword [ebp-10H]                    ; 4E7F _ 8B. 45, F0
        leave                                           ; 4E82 _ C9
        ret                                             ; 4E83 _ C3
; task_sleep End of function

task_now:; Function begin
        push    ebp                                     ; 4E84 _ 55
        mov     ebp, esp                                ; 4E85 _ 89. E5
        sub     esp, 16                                 ; 4E87 _ 83. EC, 10
        mov     ecx, dword [taskctl]                    ; 4E8A _ 8B. 0D, 000022E8(d)
        mov     eax, dword [taskctl]                    ; 4E90 _ A1, 000022E8(d)
        mov     edx, dword [eax]                        ; 4E95 _ 8B. 10
        mov     eax, edx                                ; 4E97 _ 89. D0
        shl     eax, 2                                  ; 4E99 _ C1. E0, 02
        add     eax, edx                                ; 4E9C _ 01. D0
        shl     eax, 2                                  ; 4E9E _ C1. E0, 02
        add     eax, ecx                                ; 4EA1 _ 01. C8
        add     eax, 8                                  ; 4EA3 _ 83. C0, 08
        mov     dword [ebp-4H], eax                     ; 4EA6 _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 4EA9 _ 8B. 45, FC
        mov     edx, dword [eax+4H]                     ; 4EAC _ 8B. 50, 04
        mov     eax, dword [ebp-4H]                     ; 4EAF _ 8B. 45, FC
        mov     eax, dword [eax+edx*4+8H]               ; 4EB2 _ 8B. 44 90, 08
        leave                                           ; 4EB6 _ C9
        ret                                             ; 4EB7 _ C3
; task_now End of function

task_add:; Function begin
        push    ebp                                     ; 4EB8 _ 55
        mov     ebp, esp                                ; 4EB9 _ 89. E5
        sub     esp, 16                                 ; 4EBB _ 83. EC, 10
        mov     ecx, dword [taskctl]                    ; 4EBE _ 8B. 0D, 000022E8(d)
        mov     eax, dword [ebp+8H]                     ; 4EC4 _ 8B. 45, 08
        mov     edx, dword [eax+0CH]                    ; 4EC7 _ 8B. 50, 0C
        mov     eax, edx                                ; 4ECA _ 89. D0
        shl     eax, 2                                  ; 4ECC _ C1. E0, 02
        add     eax, edx                                ; 4ECF _ 01. D0
        shl     eax, 2                                  ; 4ED1 _ C1. E0, 02
        add     eax, ecx                                ; 4ED4 _ 01. C8
        add     eax, 8                                  ; 4ED6 _ 83. C0, 08
        mov     dword [ebp-4H], eax                     ; 4ED9 _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 4EDC _ 8B. 45, FC
        mov     edx, dword [eax]                        ; 4EDF _ 8B. 10
        mov     eax, dword [ebp-4H]                     ; 4EE1 _ 8B. 45, FC
        mov     ecx, dword [ebp+8H]                     ; 4EE4 _ 8B. 4D, 08
        mov     dword [eax+edx*4+8H], ecx               ; 4EE7 _ 89. 4C 90, 08
        mov     eax, dword [ebp-4H]                     ; 4EEB _ 8B. 45, FC
        mov     eax, dword [eax]                        ; 4EEE _ 8B. 00
        lea     edx, [eax+1H]                           ; 4EF0 _ 8D. 50, 01
        mov     eax, dword [ebp-4H]                     ; 4EF3 _ 8B. 45, FC
        mov     dword [eax], edx                        ; 4EF6 _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 4EF8 _ 8B. 45, 08
        mov     dword [eax+4H], 2                       ; 4EFB _ C7. 40, 04, 00000002
        nop                                             ; 4F02 _ 90
        leave                                           ; 4F03 _ C9
        ret                                             ; 4F04 _ C3
; task_add End of function

task_remove:; Function begin
        push    ebp                                     ; 4F05 _ 55
        mov     ebp, esp                                ; 4F06 _ 89. E5
        sub     esp, 16                                 ; 4F08 _ 83. EC, 10
        mov     ecx, dword [taskctl]                    ; 4F0B _ 8B. 0D, 000022E8(d)
        mov     eax, dword [ebp+8H]                     ; 4F11 _ 8B. 45, 08
        mov     edx, dword [eax+0CH]                    ; 4F14 _ 8B. 50, 0C
        mov     eax, edx                                ; 4F17 _ 89. D0
        shl     eax, 2                                  ; 4F19 _ C1. E0, 02
        add     eax, edx                                ; 4F1C _ 01. D0
        shl     eax, 2                                  ; 4F1E _ C1. E0, 02
        add     eax, ecx                                ; 4F21 _ 01. C8
        add     eax, 8                                  ; 4F23 _ 83. C0, 08
        mov     dword [ebp-4H], eax                     ; 4F26 _ 89. 45, FC
        mov     dword [ebp-8H], 0                       ; 4F29 _ C7. 45, F8, 00000000
        jmp     ?_294                                   ; 4F30 _ EB, 23

?_292:  mov     eax, dword [ebp-4H]                     ; 4F32 _ 8B. 45, FC
        mov     edx, dword [ebp-8H]                     ; 4F35 _ 8B. 55, F8
        mov     eax, dword [eax+edx*4+8H]               ; 4F38 _ 8B. 44 90, 08
        cmp     eax, dword [ebp+8H]                     ; 4F3C _ 3B. 45, 08
        jnz     ?_293                                   ; 4F3F _ 75, 10
        mov     eax, dword [ebp-4H]                     ; 4F41 _ 8B. 45, FC
        mov     edx, dword [ebp-8H]                     ; 4F44 _ 8B. 55, F8
        mov     dword [eax+edx*4+8H], 0                 ; 4F47 _ C7. 44 90, 08, 00000000
        jmp     ?_295                                   ; 4F4F _ EB, 0E

?_293:  add     dword [ebp-8H], 1                       ; 4F51 _ 83. 45, F8, 01
?_294:  mov     eax, dword [ebp-4H]                     ; 4F55 _ 8B. 45, FC
        mov     eax, dword [eax]                        ; 4F58 _ 8B. 00
        cmp     eax, dword [ebp-8H]                     ; 4F5A _ 3B. 45, F8
        jg      ?_292                                   ; 4F5D _ 7F, D3
?_295:  mov     eax, dword [ebp-4H]                     ; 4F5F _ 8B. 45, FC
        mov     eax, dword [eax]                        ; 4F62 _ 8B. 00
        lea     edx, [eax-1H]                           ; 4F64 _ 8D. 50, FF
        mov     eax, dword [ebp-4H]                     ; 4F67 _ 8B. 45, FC
        mov     dword [eax], edx                        ; 4F6A _ 89. 10
        mov     eax, dword [ebp-4H]                     ; 4F6C _ 8B. 45, FC
        mov     eax, dword [eax+4H]                     ; 4F6F _ 8B. 40, 04
        cmp     eax, dword [ebp-8H]                     ; 4F72 _ 3B. 45, F8
        jle     ?_296                                   ; 4F75 _ 7E, 0F
        mov     eax, dword [ebp-4H]                     ; 4F77 _ 8B. 45, FC
        mov     eax, dword [eax+4H]                     ; 4F7A _ 8B. 40, 04
        lea     edx, [eax-1H]                           ; 4F7D _ 8D. 50, FF
        mov     eax, dword [ebp-4H]                     ; 4F80 _ 8B. 45, FC
        mov     dword [eax+4H], edx                     ; 4F83 _ 89. 50, 04
?_296:  mov     eax, dword [ebp-4H]                     ; 4F86 _ 8B. 45, FC
        mov     edx, dword [eax+4H]                     ; 4F89 _ 8B. 50, 04
        mov     eax, dword [ebp-4H]                     ; 4F8C _ 8B. 45, FC
        mov     eax, dword [eax]                        ; 4F8F _ 8B. 00
        cmp     edx, eax                                ; 4F91 _ 39. C2
        jl      ?_297                                   ; 4F93 _ 7C, 0A
        mov     eax, dword [ebp-4H]                     ; 4F95 _ 8B. 45, FC
        mov     dword [eax+4H], 0                       ; 4F98 _ C7. 40, 04, 00000000
?_297:  mov     eax, dword [ebp+8H]                     ; 4F9F _ 8B. 45, 08
        mov     dword [eax+4H], 1                       ; 4FA2 _ C7. 40, 04, 00000001
        jmp     ?_299                                   ; 4FA9 _ EB, 1B

?_298:  mov     eax, dword [ebp-8H]                     ; 4FAB _ 8B. 45, F8
        lea     edx, [eax+1H]                           ; 4FAE _ 8D. 50, 01
        mov     eax, dword [ebp-4H]                     ; 4FB1 _ 8B. 45, FC
        mov     ecx, dword [eax+edx*4+8H]               ; 4FB4 _ 8B. 4C 90, 08
        mov     eax, dword [ebp-4H]                     ; 4FB8 _ 8B. 45, FC
        mov     edx, dword [ebp-8H]                     ; 4FBB _ 8B. 55, F8
        mov     dword [eax+edx*4+8H], ecx               ; 4FBE _ 89. 4C 90, 08
        add     dword [ebp-8H], 1                       ; 4FC2 _ 83. 45, F8, 01
?_299:  mov     eax, dword [ebp-4H]                     ; 4FC6 _ 8B. 45, FC
        mov     eax, dword [eax]                        ; 4FC9 _ 8B. 00
        cmp     eax, dword [ebp-8H]                     ; 4FCB _ 3B. 45, F8
        jg      ?_298                                   ; 4FCE _ 7F, DB
        nop                                             ; 4FD0 _ 90
        leave                                           ; 4FD1 _ C9
        ret                                             ; 4FD2 _ C3
; task_remove End of function

task_switchsub:; Function begin
        push    ebp                                     ; 4FD3 _ 55
        mov     ebp, esp                                ; 4FD4 _ 89. E5
        sub     esp, 16                                 ; 4FD6 _ 83. EC, 10
        mov     dword [ebp-4H], 0                       ; 4FD9 _ C7. 45, FC, 00000000
        jmp     ?_302                                   ; 4FE0 _ EB, 24

?_300:  mov     ecx, dword [taskctl]                    ; 4FE2 _ 8B. 0D, 000022E8(d)
        mov     edx, dword [ebp-4H]                     ; 4FE8 _ 8B. 55, FC
        mov     eax, edx                                ; 4FEB _ 89. D0
        shl     eax, 2                                  ; 4FED _ C1. E0, 02
        add     eax, edx                                ; 4FF0 _ 01. D0
        shl     eax, 2                                  ; 4FF2 _ C1. E0, 02
        add     eax, ecx                                ; 4FF5 _ 01. C8
        add     eax, 8                                  ; 4FF7 _ 83. C0, 08
        mov     eax, dword [eax]                        ; 4FFA _ 8B. 00
        test    eax, eax                                ; 4FFC _ 85. C0
        jle     ?_301                                   ; 4FFE _ 7E, 02
        jmp     ?_303                                   ; 5000 _ EB, 0A

?_301:  add     dword [ebp-4H], 1                       ; 5002 _ 83. 45, FC, 01
?_302:  cmp     dword [ebp-4H], 2                       ; 5006 _ 83. 7D, FC, 02
        jle     ?_300                                   ; 500A _ 7E, D6
?_303:  mov     eax, dword [taskctl]                    ; 500C _ A1, 000022E8(d)
        mov     edx, dword [ebp-4H]                     ; 5011 _ 8B. 55, FC
        mov     dword [eax], edx                        ; 5014 _ 89. 10
        mov     eax, dword [taskctl]                    ; 5016 _ A1, 000022E8(d)
        mov     dword [eax+4H], 0                       ; 501B _ C7. 40, 04, 00000000
        leave                                           ; 5022 _ C9
        ret                                             ; 5023 _ C3
; task_switchsub End of function

send_message:; Function begin
        push    ebp                                     ; 5024 _ 55
        mov     ebp, esp                                ; 5025 _ 89. E5
        sub     esp, 24                                 ; 5027 _ 83. EC, 18
        mov     eax, dword [ebp+10H]                    ; 502A _ 8B. 45, 10
        movzx   eax, al                                 ; 502D _ 0F B6. C0
        mov     edx, dword [ebp+0CH]                    ; 5030 _ 8B. 55, 0C
        add     edx, 16                                 ; 5033 _ 83. C2, 10
        mov     dword [esp+4H], eax                     ; 5036 _ 89. 44 24, 04
        mov     dword [esp], edx                        ; 503A _ 89. 14 24
        call    fifo8_put                               ; 503D _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 5042 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 5045 _ 89. 04 24
        call    task_sleep                              ; 5048 _ E8, FFFFFFFC(rel)
        leave                                           ; 504D _ C9
        ret                                             ; 504E _ C3
; send_message End of function



?_304:                                                  ; byte
        db 63H, 6FH, 75H, 6EH, 74H, 65H, 72H, 00H       ; 0000 _ counter.

?_305:                                                  ; byte
        db 6BH, 69H, 6CH, 6CH, 20H, 70H, 72H, 6FH       ; 0008 _ kill pro
        db 63H, 65H, 73H, 73H, 00H                      ; 0010 _ cess.

?_306:                                                  ; byte
        db 74H, 61H, 73H, 6BH, 5FH, 61H, 00H            ; 0015 _ task_a.

?_307:                                                  ; byte
        db 63H, 6FH, 6EH, 73H, 6FH, 6CH, 65H, 00H       ; 001C _ console.

?_308:                                                  ; byte
        db 20H, 00H                                     ; 0024 _  .

?_309:                                                  ; byte
        db 66H, 72H, 65H, 65H, 20H, 00H                 ; 0026 _ free .

?_310:                                                  ; byte
        db 20H, 4BH, 42H, 00H                           ; 002C _  KB.

?_311:                                                  ; byte
        db 3EH, 00H                                     ; 0030 _ >.

?_312:                                                  ; byte
        db 68H, 6CH, 74H, 2EH, 65H, 78H, 65H, 00H       ; 0032 _ hlt.exe.

?_313:                                                  ; byte
        db 6DH, 65H, 6DH, 00H                           ; 003A _ mem.

?_314:                                                  ; byte
        db 63H, 6CH, 73H, 00H                           ; 003E _ cls.

?_315:                                                  ; byte
        db 68H, 6CH, 74H, 00H                           ; 0042 _ hlt.

?_316:                                                  ; byte
        db 64H, 69H, 72H, 00H                           ; 0046 _ dir.

?_317:                                                  ; byte
        db 70H, 61H, 67H, 65H, 20H, 69H, 73H, 3AH       ; 004A _ page is:
        db 20H, 00H                                     ; 0052 _  .

?_318:                                                  ; byte
        db 42H, 61H, 73H, 65H, 41H, 64H, 64H, 72H       ; 0054 _ BaseAddr
        db 4CH, 3AH, 20H, 00H                           ; 005C _ L: .

?_319:                                                  ; byte
        db 42H, 61H, 73H, 65H, 41H, 64H, 64H, 72H       ; 0060 _ BaseAddr
        db 48H, 3AH, 20H, 00H                           ; 0068 _ H: .

?_320:                                                  ; byte
        db 6CH, 65H, 6EH, 67H, 74H, 68H, 4CH, 6FH       ; 006C _ lengthLo
        db 77H, 3AH, 20H, 00H                           ; 0074 _ w: .

?_321:                                                  ; byte
        db 49H, 4EH, 54H, 20H, 4FH, 43H, 00H            ; 0078 _ INT OC.

?_322:                                                  ; byte
        db 53H, 74H, 61H, 63H, 6BH, 20H, 45H, 78H       ; 007F _ Stack Ex
        db 63H, 65H, 70H, 74H, 69H, 6FH, 6EH, 00H       ; 0087 _ ception.

?_323:                                                  ; byte
        db 45H, 49H, 50H, 20H, 3DH, 20H, 00H            ; 008F _ EIP = .

?_324:                                                  ; byte
        db 49H, 4EH, 54H, 20H, 30H, 44H, 20H, 00H       ; 0096 _ INT 0D .

?_325:                                                  ; byte
        db 47H, 65H, 6EH, 65H, 72H, 61H, 6CH, 20H       ; 009E _ General 
        db 50H, 72H, 6FH, 74H, 65H, 63H, 74H, 65H       ; 00A6 _ Protecte
        db 64H, 20H, 45H, 78H, 63H, 65H, 70H, 74H       ; 00AE _ d Except
        db 69H, 6FH, 6EH, 00H                           ; 00B6 _ ion.



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

?_326:  db 00H                                          ; 0112 _ .

?_327:  db 00H, 00H, 00H, 00H, 00H                      ; 0113 _ .....

KEY_CONTROL:                                            ; dword
        dd 0000001DH, 00000000H                         ; 0118 _ 29 0 

table_rgb.2009:                                         ; byte
        db 00H, 00H, 00H, 0FFH, 00H, 00H, 44H, 8CH      ; 0120 _ ......D.
        db 0BBH, 0FFH, 0FFH, 00H, 00H, 00H, 0FFH, 0FFH  ; 0128 _ ........
        db 00H, 0FFH, 00H, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH ; 0130 _ ........
        db 0C6H, 0C6H, 0C6H, 84H, 00H, 00H, 00H, 84H    ; 0138 _ ........
        db 00H, 84H, 84H, 00H, 00H, 00H, 84H, 84H       ; 0140 _ ........
        db 00H, 84H, 00H, 84H, 84H, 84H, 84H, 84H       ; 0148 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0150 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0158 _ ........

cursor.2056:                                            ; byte
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

closebtn.2175:                                          ; byte
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



key_shift:                                              ; dword
        resd    1                                       ; 0000

caps_lock:                                              ; dword
        resd    1                                       ; 0004

g_Console:                                              ; byte
        resd    1                                       ; 0008

?_328:  resd    1                                       ; 000C

?_329:  resd    1                                       ; 0010

?_330:  resd    1                                       ; 0014

?_331:  resb    1                                       ; 0018

?_332:  resb    3                                       ; 0019

bootInfo:                                               ; qword
        resb    4                                       ; 001C

?_333:  resw    1                                       ; 0020

?_334:  resw    1                                       ; 0022

keyinfo:                                                ; byte
        resb    24                                      ; 0024

?_335:  resd    1                                       ; 003C

mouseinfo:                                              ; byte
        resb    32                                      ; 0040

keybuf:                                                 ; yword
        resb    32                                      ; 0060

mousebuf:                                               ; byte
        resb    128                                     ; 0080

mdec:                                                   ; oword
        resb    12                                      ; 0100

?_336:  resd    1                                       ; 010C

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

task_cons:                                              ; dword
        resd    1                                       ; 0270

task_main:                                              ; dword
        resd    1                                       ; 0274

buffer:                                                 ; byte
        resd    1                                       ; 0278

?_337:  resd    1                                       ; 027C

?_338:  resd    1                                       ; 0280

task_a.1797:                                            ; dword
        resd    7                                       ; 0284

tss_a.1796:                                             ; byte
        resb    128                                     ; 02A0

tss_b.1795:                                             ; byte
        resb    104                                     ; 0320

task_b.1785:                                            ; byte
        resb    12                                      ; 0388

str.2104:                                               ; byte
        resb    1                                       ; 0394

?_339:  resb    9                                       ; 0395

?_340:  resb    2                                       ; 039E

timerctl:                                               ; byte
        resd    2001                                    ; 03A0

task_timer:                                             ; dword
        resd    1                                       ; 22E4

taskctl: resd   1                                       ; 22E8


