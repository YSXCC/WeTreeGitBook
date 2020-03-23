; Disassembly of file: ckernel.o
; Mon Mar 23 14:24:07 2020
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
        movzx   eax, word [?_331]                       ; 001E _ 0F B7. 05, 00000020(d)
        cwde                                            ; 0025 _ 98
        mov     dword [xsize], eax                      ; 0026 _ A3, 0000013C(d)
        movzx   eax, word [?_332]                       ; 002B _ 0F B7. 05, 00000022(d)
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
        mov     dword [esp+4H], ?_302                   ; 032A _ C7. 44 24, 04, 00000000(d)
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
        mov     dword [task_a.1796], eax                ; 039B _ A3, 00000280(d)
        mov     eax, dword [task_a.1796]                ; 03A0 _ A1, 00000280(d)
        mov     dword [?_333], eax                      ; 03A5 _ A3, 0000003C(d)
        mov     eax, dword [task_a.1796]                ; 03AA _ A1, 00000280(d)
        mov     dword [task_main], eax                  ; 03AF _ A3, 00000274(d)
        mov     eax, dword [task_a.1796]                ; 03B4 _ A1, 00000280(d)
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
        mov     dword [esp], ?_303                      ; 0494 _ C7. 04 24, 00000008(d)
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
        mov     dword [esp+8H], ?_304                   ; 04F7 _ C7. 44 24, 08, 00000015(d)
        mov     dword [esp+4H], edx                     ; 04FF _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0503 _ 89. 04 24
        call    make_wtitle8                            ; 0506 _ E8, FFFFFFFC(rel)
        mov     eax, dword [shtctl]                     ; 050B _ A1, 00000264(d)
        mov     dword [esp+0CH], 1                      ; 0510 _ C7. 44 24, 0C, 00000001
        mov     dword [esp+8H], ?_305                   ; 0518 _ C7. 44 24, 08, 0000001C(d)
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
        mov     dword [esp+8H], ?_304                   ; 0580 _ C7. 44 24, 08, 00000015(d)
        mov     dword [esp+4H], edx                     ; 0588 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 058C _ 89. 04 24
        call    make_wtitle8                            ; 058F _ E8, FFFFFFFC(rel)
        mov     eax, dword [shtctl]                     ; 0594 _ A1, 00000264(d)
        mov     dword [esp+0CH], 0                      ; 0599 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], ?_305                   ; 05A1 _ C7. 44 24, 08, 0000001C(d)
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
        mov     eax, dword [task_a.1796]                ; 064E _ A1, 00000280(d)
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
        mov     eax, dword [task_a.1796]                ; 0780 _ A1, 00000280(d)
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
        mov     dword [esp+8H], ?_305                   ; 0B2E _ C7. 44 24, 08, 0000001C(d)
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
        mov     eax, dword [?_327]                      ; 0CA6 _ A1, 00000010(d)
        mov     dword [esp+4H], edx                     ; 0CAB _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0CAF _ 89. 04 24
        call    cons_newline                            ; 0CB2 _ E8, FFFFFFFC(rel)
        mov     eax, dword [?_327]                      ; 0CB7 _ A1, 00000010(d)
        add     eax, 16                                 ; 0CBC _ 83. C0, 10
        mov     dword [?_327], eax                      ; 0CBF _ A3, 00000010(d)
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
        mov     ecx, dword [?_327]                      ; 0D88 _ 8B. 0D, 00000010(d)
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
        mov     ecx, dword [?_327]                      ; 0DD8 _ 8B. 0D, 00000010(d)
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
        mov     eax, dword [?_327]                      ; 0E15 _ A1, 00000010(d)
        mov     dword [esp+4H], edx                     ; 0E1A _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0E1E _ 89. 04 24
        call    cons_newline                            ; 0E21 _ E8, FFFFFFFC(rel)
        mov     dword [?_327], eax                      ; 0E26 _ A3, 00000010(d)
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
        mov     dword [?_326], 16                       ; 0FB0 _ C7. 05, 0000000C(d), 00000010
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
?_050:  mov     ebx, dword [?_327]                      ; 0FE0 _ 8B. 1D, 00000010(d)
        mov     ecx, dword [?_326]                      ; 0FE6 _ 8B. 0D, 0000000C(d)
        mov     edx, dword [g_Console]                  ; 0FEC _ 8B. 15, 00000008(d)
        mov     eax, dword [shtctl]                     ; 0FF2 _ A1, 00000264(d)
        mov     dword [esp+14H], ?_306                  ; 0FF7 _ C7. 44 24, 14, 00000024(d)
        mov     dword [esp+10H], 7                      ; 0FFF _ C7. 44 24, 10, 00000007
        mov     dword [esp+0CH], ebx                    ; 1007 _ 89. 5C 24, 0C
        mov     dword [esp+8H], ecx                     ; 100B _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 100F _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1013 _ 89. 04 24
        call    showString                              ; 1016 _ E8, FFFFFFFC(rel)
        mov     eax, dword [?_326]                      ; 101B _ A1, 0000000C(d)
        add     eax, 8                                  ; 1020 _ 83. C0, 08
        mov     dword [?_326], eax                      ; 1023 _ A3, 0000000C(d)
        mov     eax, dword [?_326]                      ; 1028 _ A1, 0000000C(d)
        cmp     eax, 248                                ; 102D _ 3D, 000000F8
        jnz     ?_051                                   ; 1032 _ 75, 28
        mov     dword [?_326], 8                        ; 1034 _ C7. 05, 0000000C(d), 00000008
        mov     edx, dword [g_Console]                  ; 103E _ 8B. 15, 00000008(d)
        mov     eax, dword [?_327]                      ; 1044 _ A1, 00000010(d)
        mov     dword [esp+4H], edx                     ; 1049 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 104D _ 89. 04 24
        call    cons_newline                            ; 1050 _ E8, FFFFFFFC(rel)
        mov     dword [?_327], eax                      ; 1055 _ A3, 00000010(d)
        jmp     ?_050                                   ; 105A _ EB, 84

?_051:  jmp     ?_050                                   ; 105C _ EB, 82

?_052:  movzx   eax, byte [ebp-3BH]                     ; 105E _ 0F B6. 45, C5
        cmp     al, 10                                  ; 1062 _ 3C, 0A
        jnz     ?_053                                   ; 1064 _ 75, 2B
        mov     dword [?_326], 8                        ; 1066 _ C7. 05, 0000000C(d), 00000008
        mov     edx, dword [g_Console]                  ; 1070 _ 8B. 15, 00000008(d)
        mov     eax, dword [?_327]                      ; 1076 _ A1, 00000010(d)
        mov     dword [esp+4H], edx                     ; 107B _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 107F _ 89. 04 24
        call    cons_newline                            ; 1082 _ E8, FFFFFFFC(rel)
        mov     dword [?_327], eax                      ; 1087 _ A3, 00000010(d)
        jmp     ?_054                                   ; 108C _ E9, 00000081

?_053:  movzx   eax, byte [ebp-3BH]                     ; 1091 _ 0F B6. 45, C5
        cmp     al, 13                                  ; 1095 _ 3C, 0D
        jz      ?_054                                   ; 1097 _ 74, 79
        mov     ebx, dword [?_327]                      ; 1099 _ 8B. 1D, 00000010(d)
        mov     ecx, dword [?_326]                      ; 109F _ 8B. 0D, 0000000C(d)
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
        mov     eax, dword [?_326]                      ; 10D3 _ A1, 0000000C(d)
        add     eax, 8                                  ; 10D8 _ 83. C0, 08
        mov     dword [?_326], eax                      ; 10DB _ A3, 0000000C(d)
        mov     eax, dword [?_326]                      ; 10E0 _ A1, 0000000C(d)
        cmp     eax, 248                                ; 10E5 _ 3D, 000000F8
        jnz     ?_054                                   ; 10EA _ 75, 26
        mov     dword [?_326], 16                       ; 10EC _ C7. 05, 0000000C(d), 00000010
        mov     edx, dword [g_Console]                  ; 10F6 _ 8B. 15, 00000008(d)
        mov     eax, dword [?_327]                      ; 10FC _ A1, 00000010(d)
        mov     dword [esp+4H], edx                     ; 1101 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1105 _ 89. 04 24
        call    cons_newline                            ; 1108 _ E8, FFFFFFFC(rel)
        mov     dword [?_327], eax                      ; 110D _ A3, 00000010(d)
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
        mov     eax, dword [?_327]                      ; 113D _ A1, 00000010(d)
        mov     dword [esp+4H], edx                     ; 1142 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1146 _ 89. 04 24
        call    cons_newline                            ; 1149 _ E8, FFFFFFFC(rel)
        mov     dword [?_327], eax                      ; 114E _ A3, 00000010(d)
        mov     edx, dword [ebp-24H]                    ; 1153 _ 8B. 55, DC
        mov     eax, dword [memman]                     ; 1156 _ A1, 00000000(d)
        mov     dword [esp+8H], 13                      ; 115B _ C7. 44 24, 08, 0000000D
        mov     dword [esp+4H], edx                     ; 1163 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1167 _ 89. 04 24
        call    memman_free                             ; 116A _ E8, FFFFFFFC(rel)
        mov     dword [?_326], 16                       ; 116F _ C7. 05, 0000000C(d), 00000010
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
        mov     ecx, dword [?_327]                      ; 11A3 _ 8B. 0D, 00000010(d)
        mov     edx, dword [g_Console]                  ; 11A9 _ 8B. 15, 00000008(d)
        mov     eax, dword [shtctl]                     ; 11AF _ A1, 00000264(d)
        mov     dword [esp+14H], ?_307                  ; 11B4 _ C7. 44 24, 14, 00000026(d)
        mov     dword [esp+10H], 7                      ; 11BC _ C7. 44 24, 10, 00000007
        mov     dword [esp+0CH], ecx                    ; 11C4 _ 89. 4C 24, 0C
        mov     dword [esp+8H], 16                      ; 11C8 _ C7. 44 24, 08, 00000010
        mov     dword [esp+4H], edx                     ; 11D0 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 11D4 _ 89. 04 24
        call    showString                              ; 11D7 _ E8, FFFFFFFC(rel)
        mov     ecx, dword [?_327]                      ; 11DC _ 8B. 0D, 00000010(d)
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
        mov     ecx, dword [?_327]                      ; 1214 _ 8B. 0D, 00000010(d)
        mov     edx, dword [g_Console]                  ; 121A _ 8B. 15, 00000008(d)
        mov     eax, dword [shtctl]                     ; 1220 _ A1, 00000264(d)
        mov     dword [esp+14H], ?_308                  ; 1225 _ C7. 44 24, 14, 0000002C(d)
        mov     dword [esp+10H], 7                      ; 122D _ C7. 44 24, 10, 00000007
        mov     dword [esp+0CH], ecx                    ; 1235 _ 89. 4C 24, 0C
        mov     dword [esp+8H], 126                     ; 1239 _ C7. 44 24, 08, 0000007E
        mov     dword [esp+4H], edx                     ; 1241 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1245 _ 89. 04 24
        call    showString                              ; 1248 _ E8, FFFFFFFC(rel)
        mov     edx, dword [g_Console]                  ; 124D _ 8B. 15, 00000008(d)
        mov     eax, dword [?_327]                      ; 1253 _ A1, 00000010(d)
        mov     dword [esp+4H], edx                     ; 1258 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 125C _ 89. 04 24
        call    cons_newline                            ; 125F _ E8, FFFFFFFC(rel)
        mov     dword [?_327], eax                      ; 1264 _ A3, 00000010(d)
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
        mov     dword [?_327], 28                       ; 1305 _ C7. 05, 00000010(d), 0000001C
        mov     edx, dword [g_Console]                  ; 130F _ 8B. 15, 00000008(d)
        mov     eax, dword [shtctl]                     ; 1315 _ A1, 00000264(d)
        mov     dword [esp+14H], ?_309                  ; 131A _ C7. 44 24, 14, 00000030(d)
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
        mov     dword [esp], ?_310                      ; 1356 _ C7. 04 24, 00000032(d)
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
        mov     edx, dword [ebp-0CH]                    ; 13AC _ 8B. 55, F4
        add     edx, 96                                 ; 13AF _ 83. C2, 60
        mov     dword [esp+0CH], 16626                  ; 13B2 _ C7. 44 24, 0C, 000040F2
        mov     dword [esp+8H], eax                     ; 13BA _ 89. 44 24, 08
        mov     dword [esp+4H], 65535                   ; 13BE _ C7. 44 24, 04, 0000FFFF
        mov     dword [esp], edx                        ; 13C6 _ 89. 14 24
        call    set_segmdesc                            ; 13C9 _ E8, FFFFFFFC(rel)
        call    task_now                                ; 13CE _ E8, FFFFFFFC(rel)
        mov     dword [ebp-14H], eax                    ; 13D3 _ 89. 45, EC
        mov     eax, dword [ebp-14H]                    ; 13D6 _ 8B. 45, EC
        mov     dword [eax+30H], 0                      ; 13D9 _ C7. 40, 30, 00000000
        mov     eax, dword [ebp-14H]                    ; 13E0 _ 8B. 45, EC
        add     eax, 48                                 ; 13E3 _ 83. C0, 30
        mov     dword [esp+10H], eax                    ; 13E6 _ 89. 44 24, 10
        mov     dword [esp+0CH], 96                     ; 13EA _ C7. 44 24, 0C, 00000060
        mov     dword [esp+8H], 65536                   ; 13F2 _ C7. 44 24, 08, 00010000
        mov     dword [esp+4H], 88                      ; 13FA _ C7. 44 24, 04, 00000058
        mov     dword [esp], 0                          ; 1402 _ C7. 04 24, 00000000
        call    start_app                               ; 1409 _ E8, FFFFFFFC(rel)
        mov     eax, dword [?_335]                      ; 140E _ A1, 0000027C(d)
        mov     ecx, eax                                ; 1413 _ 89. C1
        mov     eax, dword [buffer]                     ; 1415 _ A1, 00000278(d)
        mov     edx, eax                                ; 141A _ 89. C2
        mov     eax, dword [memman]                     ; 141C _ A1, 00000000(d)
        mov     dword [esp+8H], ecx                     ; 1421 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 1425 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1429 _ 89. 04 24
        call    memman_free_4k                          ; 142C _ E8, FFFFFFFC(rel)
        mov     edx, dword [ebp-10H]                    ; 1431 _ 8B. 55, F0
        mov     eax, dword [memman]                     ; 1434 _ A1, 00000000(d)
        mov     dword [esp+8H], 65536                   ; 1439 _ C7. 44 24, 08, 00010000
        mov     dword [esp+4H], edx                     ; 1441 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1445 _ 89. 04 24
        call    memman_free_4k                          ; 1448 _ E8, FFFFFFFC(rel)
        leave                                           ; 144D _ C9
        ret                                             ; 144E _ C3
; cmd_hlt End of function

console_task:; Function begin
        push    ebp                                     ; 144F _ 55
        mov     ebp, esp                                ; 1450 _ 89. E5
        push    ebx                                     ; 1452 _ 53
        sub     esp, 84                                 ; 1453 _ 83. EC, 54
        call    task_now                                ; 1456 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 145B _ 89. 45, F0
        mov     dword [ebp-0CH], 0                      ; 145E _ C7. 45, F4, 00000000
        mov     dword [ebp-14H], 0                      ; 1465 _ C7. 45, EC, 00000000
        mov     dword [ebp-18H], 0                      ; 146C _ C7. 45, E8, 00000000
        mov     eax, dword [memman]                     ; 1473 _ A1, 00000000(d)
        mov     dword [esp+4H], 128                     ; 1478 _ C7. 44 24, 04, 00000080
        mov     dword [esp], eax                        ; 1480 _ 89. 04 24
        call    memman_alloc                            ; 1483 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-1CH], eax                    ; 1488 _ 89. 45, E4
        mov     eax, dword [memman]                     ; 148B _ A1, 00000000(d)
        mov     dword [esp+4H], 30                      ; 1490 _ C7. 44 24, 04, 0000001E
        mov     dword [esp], eax                        ; 1498 _ 89. 04 24
        call    memman_alloc                            ; 149B _ E8, FFFFFFFC(rel)
        mov     dword [ebp-20H], eax                    ; 14A0 _ 89. 45, E0
        mov     eax, dword [ebp+8H]                     ; 14A3 _ 8B. 45, 08
        mov     dword [g_Console], eax                  ; 14A6 _ A3, 00000008(d)
        mov     dword [?_326], 16                       ; 14AB _ C7. 05, 0000000C(d), 00000010
        mov     dword [?_327], 28                       ; 14B5 _ C7. 05, 00000010(d), 0000001C
        mov     dword [?_328], -1                       ; 14BF _ C7. 05, 00000014(d), FFFFFFFF
        mov     eax, dword [ebp-10H]                    ; 14C9 _ 8B. 45, F0
        lea     edx, [eax+10H]                          ; 14CC _ 8D. 50, 10
        mov     eax, dword [ebp-10H]                    ; 14CF _ 8B. 45, F0
        mov     dword [esp+0CH], eax                    ; 14D2 _ 89. 44 24, 0C
        mov     eax, dword [ebp-1CH]                    ; 14D6 _ 8B. 45, E4
        mov     dword [esp+8H], eax                     ; 14D9 _ 89. 44 24, 08
        mov     dword [esp+4H], 128                     ; 14DD _ C7. 44 24, 04, 00000080
        mov     dword [esp], edx                        ; 14E5 _ 89. 14 24
        call    fifo8_init                              ; 14E8 _ E8, FFFFFFFC(rel)
        call    timer_alloc                             ; 14ED _ E8, FFFFFFFC(rel)
        mov     dword [ebp-24H], eax                    ; 14F2 _ 89. 45, DC
        mov     eax, dword [ebp-10H]                    ; 14F5 _ 8B. 45, F0
        add     eax, 16                                 ; 14F8 _ 83. C0, 10
        mov     dword [esp+8H], 1                       ; 14FB _ C7. 44 24, 08, 00000001
        mov     dword [esp+4H], eax                     ; 1503 _ 89. 44 24, 04
        mov     eax, dword [ebp-24H]                    ; 1507 _ 8B. 45, DC
        mov     dword [esp], eax                        ; 150A _ 89. 04 24
        call    timer_init                              ; 150D _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 50                      ; 1512 _ C7. 44 24, 04, 00000032
        mov     eax, dword [ebp-24H]                    ; 151A _ 8B. 45, DC
        mov     dword [esp], eax                        ; 151D _ 89. 04 24
        call    timer_settime                           ; 1520 _ E8, FFFFFFFC(rel)
        mov     eax, dword [shtctl]                     ; 1525 _ A1, 00000264(d)
        mov     dword [esp+14H], ?_309                  ; 152A _ C7. 44 24, 14, 00000030(d)
        mov     dword [esp+10H], 7                      ; 1532 _ C7. 44 24, 10, 00000007
        mov     dword [esp+0CH], 28                     ; 153A _ C7. 44 24, 0C, 0000001C
        mov     dword [esp+8H], 8                       ; 1542 _ C7. 44 24, 08, 00000008
        mov     edx, dword [ebp+8H]                     ; 154A _ 8B. 55, 08
        mov     dword [esp+4H], edx                     ; 154D _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1551 _ 89. 04 24
        call    showString                              ; 1554 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-28H], 0                      ; 1559 _ C7. 45, D8, 00000000
        mov     dword [ebp-2CH], 78848                  ; 1560 _ C7. 45, D4, 00013400
        mov     dword [ebp-30H], 0                      ; 1567 _ C7. 45, D0, 00000000
?_063:  call    io_cli                                  ; 156E _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 1573 _ 8B. 45, F0
        add     eax, 16                                 ; 1576 _ 83. C0, 10
        mov     dword [esp], eax                        ; 1579 _ 89. 04 24
        call    fifo8_status                            ; 157C _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 1581 _ 85. C0
        jnz     ?_064                                   ; 1583 _ 75, 0A
        call    io_sti                                  ; 1585 _ E8, FFFFFFFC(rel)
        jmp     ?_077                                   ; 158A _ E9, 000003AF

?_064:  call    io_sti                                  ; 158F _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 1594 _ 8B. 45, F0
        add     eax, 16                                 ; 1597 _ 83. C0, 10
        mov     dword [esp], eax                        ; 159A _ 89. 04 24
        call    fifo8_get                               ; 159D _ E8, FFFFFFFC(rel)
        mov     dword [ebp-34H], eax                    ; 15A2 _ 89. 45, CC
        cmp     dword [ebp-34H], 1                      ; 15A5 _ 83. 7D, CC, 01
        jg      ?_067                                   ; 15A9 _ 7F, 6E
        cmp     dword [ebp-0CH], 0                      ; 15AB _ 83. 7D, F4, 00
        js      ?_067                                   ; 15AF _ 78, 68
        cmp     dword [ebp-34H], 0                      ; 15B1 _ 83. 7D, CC, 00
        jz      ?_065                                   ; 15B5 _ 74, 26
        mov     eax, dword [ebp-10H]                    ; 15B7 _ 8B. 45, F0
        add     eax, 16                                 ; 15BA _ 83. C0, 10
        mov     dword [esp+8H], 0                       ; 15BD _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], eax                     ; 15C5 _ 89. 44 24, 04
        mov     eax, dword [ebp-24H]                    ; 15C9 _ 8B. 45, DC
        mov     dword [esp], eax                        ; 15CC _ 89. 04 24
        call    timer_init                              ; 15CF _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], 7                      ; 15D4 _ C7. 45, F4, 00000007
        jmp     ?_066                                   ; 15DB _ EB, 24

?_065:  mov     eax, dword [ebp-10H]                    ; 15DD _ 8B. 45, F0
        add     eax, 16                                 ; 15E0 _ 83. C0, 10
        mov     dword [esp+8H], 1                       ; 15E3 _ C7. 44 24, 08, 00000001
        mov     dword [esp+4H], eax                     ; 15EB _ 89. 44 24, 04
        mov     eax, dword [ebp-24H]                    ; 15EF _ 8B. 45, DC
        mov     dword [esp], eax                        ; 15F2 _ 89. 04 24
        call    timer_init                              ; 15F5 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], 0                      ; 15FA _ C7. 45, F4, 00000000
?_066:  mov     dword [esp+4H], 50                      ; 1601 _ C7. 44 24, 04, 00000032
        mov     eax, dword [ebp-24H]                    ; 1609 _ 8B. 45, DC
        mov     dword [esp], eax                        ; 160C _ 89. 04 24
        call    timer_settime                           ; 160F _ E8, FFFFFFFC(rel)
        jmp     ?_076                                   ; 1614 _ E9, 000002EB

?_067:  cmp     dword [ebp-34H], 87                     ; 1619 _ 83. 7D, CC, 57
        jnz     ?_068                                   ; 161D _ 75, 3C
        mov     dword [ebp-0CH], 7                      ; 161F _ C7. 45, F4, 00000007
        mov     eax, dword [ebp-10H]                    ; 1626 _ 8B. 45, F0
        add     eax, 16                                 ; 1629 _ 83. C0, 10
        mov     dword [esp+8H], 0                       ; 162C _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], eax                     ; 1634 _ 89. 44 24, 04
        mov     eax, dword [ebp-24H]                    ; 1638 _ 8B. 45, DC
        mov     dword [esp], eax                        ; 163B _ 89. 04 24
        call    timer_init                              ; 163E _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 50                      ; 1643 _ C7. 44 24, 04, 00000032
        mov     eax, dword [ebp-24H]                    ; 164B _ 8B. 45, DC
        mov     dword [esp], eax                        ; 164E _ 89. 04 24
        call    timer_settime                           ; 1651 _ E8, FFFFFFFC(rel)
        jmp     ?_076                                   ; 1656 _ E9, 000002A9

?_068:  cmp     dword [ebp-34H], 88                     ; 165B _ 83. 7D, CC, 58
        jnz     ?_069                                   ; 165F _ 75, 59
        mov     ecx, dword [?_327]                      ; 1661 _ 8B. 0D, 00000010(d)
        mov     edx, dword [?_326]                      ; 1667 _ 8B. 15, 0000000C(d)
        mov     eax, dword [shtctl]                     ; 166D _ A1, 00000264(d)
        mov     dword [esp+10H], 0                      ; 1672 _ C7. 44 24, 10, 00000000
        mov     dword [esp+0CH], ecx                    ; 167A _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 167E _ 89. 54 24, 08
        mov     edx, dword [ebp+8H]                     ; 1682 _ 8B. 55, 08
        mov     dword [esp+4H], edx                     ; 1685 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1689 _ 89. 04 24
        call    set_cursor                              ; 168C _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], -1                     ; 1691 _ C7. 45, F4, FFFFFFFF
        mov     eax, dword [task_main]                  ; 1698 _ A1, 00000274(d)
        mov     dword [esp+8H], 0                       ; 169D _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], -1                      ; 16A5 _ C7. 44 24, 04, FFFFFFFF
        mov     dword [esp], eax                        ; 16AD _ 89. 04 24
        call    task_run                                ; 16B0 _ E8, FFFFFFFC(rel)
        jmp     ?_076                                   ; 16B5 _ E9, 0000024A

?_069:  cmp     dword [ebp-34H], 28                     ; 16BA _ 83. 7D, CC, 1C
        jne     ?_074                                   ; 16BE _ 0F 85, 00000154
        mov     ecx, dword [?_327]                      ; 16C4 _ 8B. 0D, 00000010(d)
        mov     edx, dword [?_326]                      ; 16CA _ 8B. 15, 0000000C(d)
        mov     eax, dword [shtctl]                     ; 16D0 _ A1, 00000264(d)
        mov     dword [esp+10H], 0                      ; 16D5 _ C7. 44 24, 10, 00000000
        mov     dword [esp+0CH], ecx                    ; 16DD _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 16E1 _ 89. 54 24, 08
        mov     edx, dword [ebp+8H]                     ; 16E5 _ 8B. 55, 08
        mov     dword [esp+4H], edx                     ; 16E8 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 16EC _ 89. 04 24
        call    set_cursor                              ; 16EF _ E8, FFFFFFFC(rel)
        mov     eax, dword [?_326]                      ; 16F4 _ A1, 0000000C(d)
        lea     edx, [eax+7H]                           ; 16F9 _ 8D. 50, 07
        test    eax, eax                                ; 16FC _ 85. C0
        cmovs   eax, edx                                ; 16FE _ 0F 48. C2
        sar     eax, 3                                  ; 1701 _ C1. F8, 03
        lea     edx, [eax-2H]                           ; 1704 _ 8D. 50, FE
        mov     eax, dword [ebp-20H]                    ; 1707 _ 8B. 45, E0
        add     eax, edx                                ; 170A _ 01. D0
        mov     byte [eax], 0                           ; 170C _ C6. 00, 00
        mov     eax, dword [?_327]                      ; 170F _ A1, 00000010(d)
        mov     edx, dword [ebp+8H]                     ; 1714 _ 8B. 55, 08
        mov     dword [esp+4H], edx                     ; 1717 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 171B _ 89. 04 24
        call    cons_newline                            ; 171E _ E8, FFFFFFFC(rel)
        mov     dword [?_327], eax                      ; 1723 _ A3, 00000010(d)
        mov     dword [?_326], 16                       ; 1728 _ C7. 05, 0000000C(d), 00000010
        mov     dword [esp+4H], ?_311                   ; 1732 _ C7. 44 24, 04, 0000003A(d)
        mov     eax, dword [ebp-20H]                    ; 173A _ 8B. 45, E0
        mov     dword [esp], eax                        ; 173D _ 89. 04 24
        call    strcmp                                  ; 1740 _ E8, FFFFFFFC(rel)
        cmp     eax, 1                                  ; 1745 _ 83. F8, 01
        jnz     ?_070                                   ; 1748 _ 75, 10
        mov     eax, dword [ebp+0CH]                    ; 174A _ 8B. 45, 0C
        mov     dword [esp], eax                        ; 174D _ 89. 04 24
        call    cmd_mem                                 ; 1750 _ E8, FFFFFFFC(rel)
        jmp     ?_076                                   ; 1755 _ E9, 000001AA

?_070:  mov     dword [esp+4H], ?_312                   ; 175A _ C7. 44 24, 04, 0000003E(d)
        mov     eax, dword [ebp-20H]                    ; 1762 _ 8B. 45, E0
        mov     dword [esp], eax                        ; 1765 _ 89. 04 24
        call    strcmp                                  ; 1768 _ E8, FFFFFFFC(rel)
        cmp     eax, 1                                  ; 176D _ 83. F8, 01
        jnz     ?_071                                   ; 1770 _ 75, 0A
        call    cmd_cls                                 ; 1772 _ E8, FFFFFFFC(rel)
        jmp     ?_076                                   ; 1777 _ E9, 00000188

?_071:  mov     dword [esp+4H], ?_313                   ; 177C _ C7. 44 24, 04, 00000042(d)
        mov     eax, dword [ebp-20H]                    ; 1784 _ 8B. 45, E0
        mov     dword [esp], eax                        ; 1787 _ 89. 04 24
        call    strcmp                                  ; 178A _ E8, FFFFFFFC(rel)
        cmp     eax, 1                                  ; 178F _ 83. F8, 01
        jnz     ?_072                                   ; 1792 _ 75, 11
        call    cmd_hlt                                 ; 1794 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-30H], 1                      ; 1799 _ C7. 45, D0, 00000001
        jmp     ?_076                                   ; 17A0 _ E9, 0000015F

?_072:  mov     dword [esp+4H], ?_314                   ; 17A5 _ C7. 44 24, 04, 00000046(d)
        mov     eax, dword [ebp-20H]                    ; 17AD _ 8B. 45, E0
        mov     dword [esp], eax                        ; 17B0 _ 89. 04 24
        call    strcmp                                  ; 17B3 _ E8, FFFFFFFC(rel)
        cmp     eax, 1                                  ; 17B8 _ 83. F8, 01
        jnz     ?_073                                   ; 17BB _ 75, 0A
        call    cmd_dir                                 ; 17BD _ E8, FFFFFFFC(rel)
        jmp     ?_076                                   ; 17C2 _ E9, 0000013D

?_073:  mov     eax, dword [ebp-20H]                    ; 17C7 _ 8B. 45, E0
        movzx   eax, byte [eax]                         ; 17CA _ 0F B6. 00
        cmp     al, 116                                 ; 17CD _ 3C, 74
        jne     ?_076                                   ; 17CF _ 0F 85, 0000012F
        mov     eax, dword [ebp-20H]                    ; 17D5 _ 8B. 45, E0
        add     eax, 1                                  ; 17D8 _ 83. C0, 01
        movzx   eax, byte [eax]                         ; 17DB _ 0F B6. 00
        cmp     al, 121                                 ; 17DE _ 3C, 79
        jne     ?_076                                   ; 17E0 _ 0F 85, 0000011E
        mov     eax, dword [ebp-20H]                    ; 17E6 _ 8B. 45, E0
        add     eax, 2                                  ; 17E9 _ 83. C0, 02
        movzx   eax, byte [eax]                         ; 17EC _ 0F B6. 00
        cmp     al, 112                                 ; 17EF _ 3C, 70
        jne     ?_076                                   ; 17F1 _ 0F 85, 0000010D
        mov     eax, dword [ebp-20H]                    ; 17F7 _ 8B. 45, E0
        add     eax, 3                                  ; 17FA _ 83. C0, 03
        movzx   eax, byte [eax]                         ; 17FD _ 0F B6. 00
        cmp     al, 101                                 ; 1800 _ 3C, 65
        jne     ?_076                                   ; 1802 _ 0F 85, 000000FC
        mov     eax, dword [ebp-20H]                    ; 1808 _ 8B. 45, E0
        mov     dword [esp], eax                        ; 180B _ 89. 04 24
        call    cmd_type                                ; 180E _ E8, FFFFFFFC(rel)
        jmp     ?_076                                   ; 1813 _ E9, 000000EC

?_074:  cmp     dword [ebp-34H], 14                     ; 1818 _ 83. 7D, CC, 0E
        jnz     ?_075                                   ; 181C _ 75, 79
        mov     eax, dword [?_326]                      ; 181E _ A1, 0000000C(d)
        cmp     eax, 8                                  ; 1823 _ 83. F8, 08
        jle     ?_075                                   ; 1826 _ 7E, 6F
        mov     ecx, dword [?_327]                      ; 1828 _ 8B. 0D, 00000010(d)
        mov     edx, dword [?_326]                      ; 182E _ 8B. 15, 0000000C(d)
        mov     eax, dword [shtctl]                     ; 1834 _ A1, 00000264(d)
        mov     dword [esp+10H], 0                      ; 1839 _ C7. 44 24, 10, 00000000
        mov     dword [esp+0CH], ecx                    ; 1841 _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 1845 _ 89. 54 24, 08
        mov     edx, dword [ebp+8H]                     ; 1849 _ 8B. 55, 08
        mov     dword [esp+4H], edx                     ; 184C _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1850 _ 89. 04 24
        call    set_cursor                              ; 1853 _ E8, FFFFFFFC(rel)
        mov     eax, dword [?_326]                      ; 1858 _ A1, 0000000C(d)
        sub     eax, 8                                  ; 185D _ 83. E8, 08
        mov     dword [?_326], eax                      ; 1860 _ A3, 0000000C(d)
        mov     ecx, dword [?_327]                      ; 1865 _ 8B. 0D, 00000010(d)
        mov     edx, dword [?_326]                      ; 186B _ 8B. 15, 0000000C(d)
        mov     eax, dword [shtctl]                     ; 1871 _ A1, 00000264(d)
        mov     dword [esp+10H], 0                      ; 1876 _ C7. 44 24, 10, 00000000
        mov     dword [esp+0CH], ecx                    ; 187E _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 1882 _ 89. 54 24, 08
        mov     edx, dword [ebp+8H]                     ; 1886 _ 8B. 55, 08
        mov     dword [esp+4H], edx                     ; 1889 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 188D _ 89. 04 24
        call    set_cursor                              ; 1890 _ E8, FFFFFFFC(rel)
        jmp     ?_076                                   ; 1895 _ EB, 6D

?_075:  mov     eax, dword [ebp-34H]                    ; 1897 _ 8B. 45, CC
        mov     dword [esp], eax                        ; 189A _ 89. 04 24
        call    transferScanCode                        ; 189D _ E8, FFFFFFFC(rel)
        mov     byte [ebp-35H], al                      ; 18A2 _ 88. 45, CB
        mov     eax, dword [?_326]                      ; 18A5 _ A1, 0000000C(d)
        cmp     eax, 239                                ; 18AA _ 3D, 000000EF
        jg      ?_076                                   ; 18AF _ 7F, 53
        cmp     byte [ebp-35H], 0                       ; 18B1 _ 80. 7D, CB, 00
        jz      ?_076                                   ; 18B5 _ 74, 4D
        mov     eax, dword [?_326]                      ; 18B7 _ A1, 0000000C(d)
        lea     edx, [eax+7H]                           ; 18BC _ 8D. 50, 07
        test    eax, eax                                ; 18BF _ 85. C0
        cmovs   eax, edx                                ; 18C1 _ 0F 48. C2
        sar     eax, 3                                  ; 18C4 _ C1. F8, 03
        lea     edx, [eax-2H]                           ; 18C7 _ 8D. 50, FE
        mov     eax, dword [ebp-20H]                    ; 18CA _ 8B. 45, E0
        add     edx, eax                                ; 18CD _ 01. C2
        movzx   eax, byte [ebp-35H]                     ; 18CF _ 0F B6. 45, CB
        mov     byte [edx], al                          ; 18D3 _ 88. 02
        mov     eax, dword [?_326]                      ; 18D5 _ A1, 0000000C(d)
        lea     edx, [eax+7H]                           ; 18DA _ 8D. 50, 07
        test    eax, eax                                ; 18DD _ 85. C0
        cmovs   eax, edx                                ; 18DF _ 0F 48. C2
        sar     eax, 3                                  ; 18E2 _ C1. F8, 03
        lea     edx, [eax-1H]                           ; 18E5 _ 8D. 50, FF
        mov     eax, dword [ebp-20H]                    ; 18E8 _ 8B. 45, E0
        add     eax, edx                                ; 18EB _ 01. D0
        mov     byte [eax], 0                           ; 18ED _ C6. 00, 00
        movsx   eax, byte [ebp-35H]                     ; 18F0 _ 0F BE. 45, CB
        mov     dword [esp+4H], 1                       ; 18F4 _ C7. 44 24, 04, 00000001
        mov     dword [esp], eax                        ; 18FC _ 89. 04 24
        call    cons_putchar                            ; 18FF _ E8, FFFFFFFC(rel)
?_076:  cmp     dword [ebp-0CH], 0                      ; 1904 _ 83. 7D, F4, 00
        js      ?_077                                   ; 1908 _ 78, 34
        mov     ecx, dword [?_327]                      ; 190A _ 8B. 0D, 00000010(d)
        mov     edx, dword [?_326]                      ; 1910 _ 8B. 15, 0000000C(d)
        mov     eax, dword [shtctl]                     ; 1916 _ A1, 00000264(d)
        mov     ebx, dword [ebp-0CH]                    ; 191B _ 8B. 5D, F4
        mov     dword [esp+10H], ebx                    ; 191E _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 1922 _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 1926 _ 89. 54 24, 08
        mov     edx, dword [ebp+8H]                     ; 192A _ 8B. 55, 08
        mov     dword [esp+4H], edx                     ; 192D _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1931 _ 89. 04 24
        call    set_cursor                              ; 1934 _ E8, FFFFFFFC(rel)
        jmp     ?_063                                   ; 1939 _ E9, FFFFFC30

?_077:  jmp     ?_063                                   ; 193E _ E9, FFFFFC2B
; console_task End of function

cons_putstr:; Function begin
        push    ebp                                     ; 1943 _ 55
        mov     ebp, esp                                ; 1944 _ 89. E5
        sub     esp, 24                                 ; 1946 _ 83. EC, 18
        jmp     ?_079                                   ; 1949 _ EB, 1D

?_078:  mov     eax, dword [ebp+8H]                     ; 194B _ 8B. 45, 08
        movzx   eax, byte [eax]                         ; 194E _ 0F B6. 00
        movsx   eax, al                                 ; 1951 _ 0F BE. C0
        mov     dword [esp+4H], 1                       ; 1954 _ C7. 44 24, 04, 00000001
        mov     dword [esp], eax                        ; 195C _ 89. 04 24
        call    cons_putchar                            ; 195F _ E8, FFFFFFFC(rel)
        add     dword [ebp+8H], 1                       ; 1964 _ 83. 45, 08, 01
?_079:  mov     eax, dword [ebp+8H]                     ; 1968 _ 8B. 45, 08
        movzx   eax, byte [eax]                         ; 196B _ 0F B6. 00
        test    al, al                                  ; 196E _ 84. C0
        jnz     ?_078                                   ; 1970 _ 75, D9
        nop                                             ; 1972 _ 90
        leave                                           ; 1973 _ C9
        ret                                             ; 1974 _ C3
; cons_putstr End of function

kernel_api:; Function begin
        push    ebp                                     ; 1975 _ 55
        mov     ebp, esp                                ; 1976 _ 89. E5
        sub     esp, 56                                 ; 1978 _ 83. EC, 38
        call    task_now                                ; 197B _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 1980 _ 89. 45, F4
        cmp     dword [ebp+1CH], 1                      ; 1983 _ 83. 7D, 1C, 01
        jnz     ?_080                                   ; 1987 _ 75, 1B
        mov     eax, dword [ebp+24H]                    ; 1989 _ 8B. 45, 24
        movsx   eax, al                                 ; 198C _ 0F BE. C0
        mov     dword [esp+4H], 1                       ; 198F _ C7. 44 24, 04, 00000001
        mov     dword [esp], eax                        ; 1997 _ 89. 04 24
        call    cons_putchar                            ; 199A _ E8, FFFFFFFC(rel)
        jmp     ?_083                                   ; 199F _ E9, 00000086

?_080:  cmp     dword [ebp+1CH], 2                      ; 19A4 _ 83. 7D, 1C, 02
        jnz     ?_081                                   ; 19A8 _ 75, 15
        mov     edx, dword [buffer]                     ; 19AA _ 8B. 15, 00000278(d)
        mov     eax, dword [ebp+18H]                    ; 19B0 _ 8B. 45, 18
        add     eax, edx                                ; 19B3 _ 01. D0
        mov     dword [esp], eax                        ; 19B5 _ 89. 04 24
        call    cons_putstr                             ; 19B8 _ E8, FFFFFFFC(rel)
        jmp     ?_083                                   ; 19BD _ EB, 6B

?_081:  cmp     dword [ebp+1CH], 4                      ; 19BF _ 83. 7D, 1C, 04
        jnz     ?_083                                   ; 19C3 _ 75, 65
        mov     eax, dword [ebp-0CH]                    ; 19C5 _ 8B. 45, F4
        mov     dword [eax+34H], 0                      ; 19C8 _ C7. 40, 34, 00000000
        mov     eax, dword [ebp-0CH]                    ; 19CF _ 8B. 45, F4
        mov     eax, dword [eax+30H]                    ; 19D2 _ 8B. 40, 30
        mov     dword [esp], eax                        ; 19D5 _ 89. 04 24
        call    intToHexStr                             ; 19D8 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 19DD _ 89. 45, F0
        mov     eax, dword [task_cons]                  ; 19E0 _ A1, 00000270(d)
        cmp     dword [ebp-0CH], eax                    ; 19E5 _ 39. 45, F4
        jnz     ?_082                                   ; 19E8 _ 75, 36
        mov     edx, dword [sht_back]                   ; 19EA _ 8B. 15, 00000268(d)
        mov     eax, dword [shtctl]                     ; 19F0 _ A1, 00000264(d)
        mov     ecx, dword [ebp-10H]                    ; 19F5 _ 8B. 4D, F0
        mov     dword [esp+14H], ecx                    ; 19F8 _ 89. 4C 24, 14
        mov     dword [esp+10H], 0                      ; 19FC _ C7. 44 24, 10, 00000000
        mov     dword [esp+0CH], 215                    ; 1A04 _ C7. 44 24, 0C, 000000D7
        mov     dword [esp+8H], 0                       ; 1A0C _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], edx                     ; 1A14 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1A18 _ 89. 04 24
        call    showString                              ; 1A1B _ E8, FFFFFFFC(rel)
?_082:  mov     eax, dword [task_cons]                  ; 1A20 _ A1, 00000270(d)
        add     eax, 48                                 ; 1A25 _ 83. C0, 30
        jmp     ?_084                                   ; 1A28 _ EB, 05

?_083:  mov     eax, 0                                  ; 1A2A _ B8, 00000000
?_084:  leave                                           ; 1A2F _ C9
        ret                                             ; 1A30 _ C3
; kernel_api End of function

cons_putchar:; Function begin
        push    ebp                                     ; 1A31 _ 55
        mov     ebp, esp                                ; 1A32 _ 89. E5
        push    ebx                                     ; 1A34 _ 53
        sub     esp, 36                                 ; 1A35 _ 83. EC, 24
        mov     edx, dword [ebp+8H]                     ; 1A38 _ 8B. 55, 08
        mov     eax, dword [ebp+0CH]                    ; 1A3B _ 8B. 45, 0C
        mov     byte [ebp-0CH], dl                      ; 1A3E _ 88. 55, F4
        mov     byte [ebp-10H], al                      ; 1A41 _ 88. 45, F0
        mov     ebx, dword [?_327]                      ; 1A44 _ 8B. 1D, 00000010(d)
        mov     ecx, dword [?_326]                      ; 1A4A _ 8B. 0D, 0000000C(d)
        mov     edx, dword [g_Console]                  ; 1A50 _ 8B. 15, 00000008(d)
        mov     eax, dword [shtctl]                     ; 1A56 _ A1, 00000264(d)
        mov     dword [esp+10H], 0                      ; 1A5B _ C7. 44 24, 10, 00000000
        mov     dword [esp+0CH], ebx                    ; 1A63 _ 89. 5C 24, 0C
        mov     dword [esp+8H], ecx                     ; 1A67 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 1A6B _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1A6F _ 89. 04 24
        call    set_cursor                              ; 1A72 _ E8, FFFFFFFC(rel)
        movzx   eax, byte [ebp-0CH]                     ; 1A77 _ 0F B6. 45, F4
        mov     byte [?_329], al                        ; 1A7B _ A2, 00000018(d)
        mov     byte [?_330], 0                         ; 1A80 _ C6. 05, 00000019(d), 00
        mov     ebx, dword [?_327]                      ; 1A87 _ 8B. 1D, 00000010(d)
        mov     ecx, dword [?_326]                      ; 1A8D _ 8B. 0D, 0000000C(d)
        mov     edx, dword [g_Console]                  ; 1A93 _ 8B. 15, 00000008(d)
        mov     eax, dword [shtctl]                     ; 1A99 _ A1, 00000264(d)
        mov     dword [esp+14H], ?_329                  ; 1A9E _ C7. 44 24, 14, 00000018(d)
        mov     dword [esp+10H], 7                      ; 1AA6 _ C7. 44 24, 10, 00000007
        mov     dword [esp+0CH], ebx                    ; 1AAE _ 89. 5C 24, 0C
        mov     dword [esp+8H], ecx                     ; 1AB2 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 1AB6 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1ABA _ 89. 04 24
        call    showString                              ; 1ABD _ E8, FFFFFFFC(rel)
        mov     eax, dword [?_326]                      ; 1AC2 _ A1, 0000000C(d)
        add     eax, 8                                  ; 1AC7 _ 83. C0, 08
        mov     dword [?_326], eax                      ; 1ACA _ A3, 0000000C(d)
        add     esp, 36                                 ; 1ACF _ 83. C4, 24
        pop     ebx                                     ; 1AD2 _ 5B
        pop     ebp                                     ; 1AD3 _ 5D
        ret                                             ; 1AD4 _ C3
; cons_putchar End of function

cons_newline:; Function begin
        push    ebp                                     ; 1AD5 _ 55
        mov     ebp, esp                                ; 1AD6 _ 89. E5
        push    ebx                                     ; 1AD8 _ 53
        sub     esp, 52                                 ; 1AD9 _ 83. EC, 34
        cmp     dword [ebp+8H], 139                     ; 1ADC _ 81. 7D, 08, 0000008B
        jg      ?_085                                   ; 1AE3 _ 7F, 09
        add     dword [ebp+8H], 16                      ; 1AE5 _ 83. 45, 08, 10
        jmp     ?_094                                   ; 1AE9 _ E9, 000000DF

?_085:  mov     dword [ebp-10H], 28                     ; 1AEE _ C7. 45, F0, 0000001C
        jmp     ?_089                                   ; 1AF5 _ EB, 52

?_086:  mov     dword [ebp-0CH], 8                      ; 1AF7 _ C7. 45, F4, 00000008
        jmp     ?_088                                   ; 1AFE _ EB, 3C

?_087:  mov     eax, dword [ebp+0CH]                    ; 1B00 _ 8B. 45, 0C
        mov     edx, dword [eax]                        ; 1B03 _ 8B. 10
        mov     eax, dword [ebp+0CH]                    ; 1B05 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 1B08 _ 8B. 40, 04
        imul    eax, dword [ebp-10H]                    ; 1B0B _ 0F AF. 45, F0
        mov     ecx, eax                                ; 1B0F _ 89. C1
        mov     eax, dword [ebp-0CH]                    ; 1B11 _ 8B. 45, F4
        add     eax, ecx                                ; 1B14 _ 01. C8
        add     edx, eax                                ; 1B16 _ 01. C2
        mov     eax, dword [ebp+0CH]                    ; 1B18 _ 8B. 45, 0C
        mov     ecx, dword [eax]                        ; 1B1B _ 8B. 08
        mov     eax, dword [ebp-10H]                    ; 1B1D _ 8B. 45, F0
        lea     ebx, [eax+10H]                          ; 1B20 _ 8D. 58, 10
        mov     eax, dword [ebp+0CH]                    ; 1B23 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 1B26 _ 8B. 40, 04
        imul    ebx, eax                                ; 1B29 _ 0F AF. D8
        mov     eax, dword [ebp-0CH]                    ; 1B2C _ 8B. 45, F4
        add     eax, ebx                                ; 1B2F _ 01. D8
        add     eax, ecx                                ; 1B31 _ 01. C8
        movzx   eax, byte [eax]                         ; 1B33 _ 0F B6. 00
        mov     byte [edx], al                          ; 1B36 _ 88. 02
        add     dword [ebp-0CH], 1                      ; 1B38 _ 83. 45, F4, 01
?_088:  cmp     dword [ebp-0CH], 247                    ; 1B3C _ 81. 7D, F4, 000000F7
        jle     ?_087                                   ; 1B43 _ 7E, BB
        add     dword [ebp-10H], 1                      ; 1B45 _ 83. 45, F0, 01
?_089:  cmp     dword [ebp-10H], 139                    ; 1B49 _ 81. 7D, F0, 0000008B
        jle     ?_086                                   ; 1B50 _ 7E, A5
        mov     dword [ebp-10H], 140                    ; 1B52 _ C7. 45, F0, 0000008C
        jmp     ?_093                                   ; 1B59 _ EB, 35

?_090:  mov     dword [ebp-0CH], 8                      ; 1B5B _ C7. 45, F4, 00000008
        jmp     ?_092                                   ; 1B62 _ EB, 1F

?_091:  mov     eax, dword [ebp+0CH]                    ; 1B64 _ 8B. 45, 0C
        mov     edx, dword [eax]                        ; 1B67 _ 8B. 10
        mov     eax, dword [ebp+0CH]                    ; 1B69 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 1B6C _ 8B. 40, 04
        imul    eax, dword [ebp-10H]                    ; 1B6F _ 0F AF. 45, F0
        mov     ecx, eax                                ; 1B73 _ 89. C1
        mov     eax, dword [ebp-0CH]                    ; 1B75 _ 8B. 45, F4
        add     eax, ecx                                ; 1B78 _ 01. C8
        add     eax, edx                                ; 1B7A _ 01. D0
        mov     byte [eax], 0                           ; 1B7C _ C6. 00, 00
        add     dword [ebp-0CH], 1                      ; 1B7F _ 83. 45, F4, 01
?_092:  cmp     dword [ebp-0CH], 247                    ; 1B83 _ 81. 7D, F4, 000000F7
        jle     ?_091                                   ; 1B8A _ 7E, D8
        add     dword [ebp-10H], 1                      ; 1B8C _ 83. 45, F0, 01
?_093:  cmp     dword [ebp-10H], 155                    ; 1B90 _ 81. 7D, F0, 0000009B
        jle     ?_090                                   ; 1B97 _ 7E, C2
        mov     eax, dword [shtctl]                     ; 1B99 _ A1, 00000264(d)
        mov     dword [esp+14H], 156                    ; 1B9E _ C7. 44 24, 14, 0000009C
        mov     dword [esp+10H], 248                    ; 1BA6 _ C7. 44 24, 10, 000000F8
        mov     dword [esp+0CH], 28                     ; 1BAE _ C7. 44 24, 0C, 0000001C
        mov     dword [esp+8H], 8                       ; 1BB6 _ C7. 44 24, 08, 00000008
        mov     edx, dword [ebp+0CH]                    ; 1BBE _ 8B. 55, 0C
        mov     dword [esp+4H], edx                     ; 1BC1 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1BC5 _ 89. 04 24
        call    sheet_refresh                           ; 1BC8 _ E8, FFFFFFFC(rel)
?_094:  mov     eax, dword [shtctl]                     ; 1BCD _ A1, 00000264(d)
        mov     dword [esp+14H], ?_309                  ; 1BD2 _ C7. 44 24, 14, 00000030(d)
        mov     dword [esp+10H], 7                      ; 1BDA _ C7. 44 24, 10, 00000007
        mov     edx, dword [ebp+8H]                     ; 1BE2 _ 8B. 55, 08
        mov     dword [esp+0CH], edx                    ; 1BE5 _ 89. 54 24, 0C
        mov     dword [esp+8H], 8                       ; 1BE9 _ C7. 44 24, 08, 00000008
        mov     edx, dword [ebp+0CH]                    ; 1BF1 _ 8B. 55, 0C
        mov     dword [esp+4H], edx                     ; 1BF4 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1BF8 _ 89. 04 24
        call    showString                              ; 1BFB _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 1C00 _ 8B. 45, 08
        add     esp, 52                                 ; 1C03 _ 83. C4, 34
        pop     ebx                                     ; 1C06 _ 5B
        pop     ebp                                     ; 1C07 _ 5D
        ret                                             ; 1C08 _ C3
; cons_newline End of function

init_screen8:; Function begin
        push    ebp                                     ; 1C09 _ 55
        mov     ebp, esp                                ; 1C0A _ 89. E5
        push    ebx                                     ; 1C0C _ 53
        sub     esp, 36                                 ; 1C0D _ 83. EC, 24
        mov     eax, dword [ebp+10H]                    ; 1C10 _ 8B. 45, 10
        lea     edx, [eax-1DH]                          ; 1C13 _ 8D. 50, E3
        mov     eax, dword [ebp+0CH]                    ; 1C16 _ 8B. 45, 0C
        sub     eax, 1                                  ; 1C19 _ 83. E8, 01
        mov     dword [esp+18H], edx                    ; 1C1C _ 89. 54 24, 18
        mov     dword [esp+14H], eax                    ; 1C20 _ 89. 44 24, 14
        mov     dword [esp+10H], 0                      ; 1C24 _ C7. 44 24, 10, 00000000
        mov     dword [esp+0CH], 0                      ; 1C2C _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 2                       ; 1C34 _ C7. 44 24, 08, 00000002
        mov     eax, dword [ebp+0CH]                    ; 1C3C _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 1C3F _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1C43 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1C46 _ 89. 04 24
        call    boxfill8                                ; 1C49 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 1C4E _ 8B. 45, 10
        lea     ecx, [eax-1CH]                          ; 1C51 _ 8D. 48, E4
        mov     eax, dword [ebp+0CH]                    ; 1C54 _ 8B. 45, 0C
        lea     edx, [eax-1H]                           ; 1C57 _ 8D. 50, FF
        mov     eax, dword [ebp+10H]                    ; 1C5A _ 8B. 45, 10
        sub     eax, 28                                 ; 1C5D _ 83. E8, 1C
        mov     dword [esp+18H], ecx                    ; 1C60 _ 89. 4C 24, 18
        mov     dword [esp+14H], edx                    ; 1C64 _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 1C68 _ 89. 44 24, 10
        mov     dword [esp+0CH], 0                      ; 1C6C _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 8                       ; 1C74 _ C7. 44 24, 08, 00000008
        mov     eax, dword [ebp+0CH]                    ; 1C7C _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 1C7F _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1C83 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1C86 _ 89. 04 24
        call    boxfill8                                ; 1C89 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 1C8E _ 8B. 45, 10
        lea     ecx, [eax-1BH]                          ; 1C91 _ 8D. 48, E5
        mov     eax, dword [ebp+0CH]                    ; 1C94 _ 8B. 45, 0C
        lea     edx, [eax-1H]                           ; 1C97 _ 8D. 50, FF
        mov     eax, dword [ebp+10H]                    ; 1C9A _ 8B. 45, 10
        sub     eax, 27                                 ; 1C9D _ 83. E8, 1B
        mov     dword [esp+18H], ecx                    ; 1CA0 _ 89. 4C 24, 18
        mov     dword [esp+14H], edx                    ; 1CA4 _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 1CA8 _ 89. 44 24, 10
        mov     dword [esp+0CH], 0                      ; 1CAC _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 7                       ; 1CB4 _ C7. 44 24, 08, 00000007
        mov     eax, dword [ebp+0CH]                    ; 1CBC _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 1CBF _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1CC3 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1CC6 _ 89. 04 24
        call    boxfill8                                ; 1CC9 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 1CCE _ 8B. 45, 10
        lea     ecx, [eax-1H]                           ; 1CD1 _ 8D. 48, FF
        mov     eax, dword [ebp+0CH]                    ; 1CD4 _ 8B. 45, 0C
        lea     edx, [eax-1H]                           ; 1CD7 _ 8D. 50, FF
        mov     eax, dword [ebp+10H]                    ; 1CDA _ 8B. 45, 10
        sub     eax, 26                                 ; 1CDD _ 83. E8, 1A
        mov     dword [esp+18H], ecx                    ; 1CE0 _ 89. 4C 24, 18
        mov     dword [esp+14H], edx                    ; 1CE4 _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 1CE8 _ 89. 44 24, 10
        mov     dword [esp+0CH], 0                      ; 1CEC _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 8                       ; 1CF4 _ C7. 44 24, 08, 00000008
        mov     eax, dword [ebp+0CH]                    ; 1CFC _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 1CFF _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1D03 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1D06 _ 89. 04 24
        call    boxfill8                                ; 1D09 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 1D0E _ 8B. 45, 10
        lea     edx, [eax-18H]                          ; 1D11 _ 8D. 50, E8
        mov     eax, dword [ebp+10H]                    ; 1D14 _ 8B. 45, 10
        sub     eax, 24                                 ; 1D17 _ 83. E8, 18
        mov     dword [esp+18H], edx                    ; 1D1A _ 89. 54 24, 18
        mov     dword [esp+14H], 59                     ; 1D1E _ C7. 44 24, 14, 0000003B
        mov     dword [esp+10H], eax                    ; 1D26 _ 89. 44 24, 10
        mov     dword [esp+0CH], 3                      ; 1D2A _ C7. 44 24, 0C, 00000003
        mov     dword [esp+8H], 7                       ; 1D32 _ C7. 44 24, 08, 00000007
        mov     eax, dword [ebp+0CH]                    ; 1D3A _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 1D3D _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1D41 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1D44 _ 89. 04 24
        call    boxfill8                                ; 1D47 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 1D4C _ 8B. 45, 10
        lea     edx, [eax-4H]                           ; 1D4F _ 8D. 50, FC
        mov     eax, dword [ebp+10H]                    ; 1D52 _ 8B. 45, 10
        sub     eax, 24                                 ; 1D55 _ 83. E8, 18
        mov     dword [esp+18H], edx                    ; 1D58 _ 89. 54 24, 18
        mov     dword [esp+14H], 2                      ; 1D5C _ C7. 44 24, 14, 00000002
        mov     dword [esp+10H], eax                    ; 1D64 _ 89. 44 24, 10
        mov     dword [esp+0CH], 2                      ; 1D68 _ C7. 44 24, 0C, 00000002
        mov     dword [esp+8H], 7                       ; 1D70 _ C7. 44 24, 08, 00000007
        mov     eax, dword [ebp+0CH]                    ; 1D78 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 1D7B _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1D7F _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1D82 _ 89. 04 24
        call    boxfill8                                ; 1D85 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 1D8A _ 8B. 45, 10
        lea     edx, [eax-4H]                           ; 1D8D _ 8D. 50, FC
        mov     eax, dword [ebp+10H]                    ; 1D90 _ 8B. 45, 10
        sub     eax, 4                                  ; 1D93 _ 83. E8, 04
        mov     dword [esp+18H], edx                    ; 1D96 _ 89. 54 24, 18
        mov     dword [esp+14H], 59                     ; 1D9A _ C7. 44 24, 14, 0000003B
        mov     dword [esp+10H], eax                    ; 1DA2 _ 89. 44 24, 10
        mov     dword [esp+0CH], 3                      ; 1DA6 _ C7. 44 24, 0C, 00000003
        mov     dword [esp+8H], 2                       ; 1DAE _ C7. 44 24, 08, 00000002
        mov     eax, dword [ebp+0CH]                    ; 1DB6 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 1DB9 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1DBD _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1DC0 _ 89. 04 24
        call    boxfill8                                ; 1DC3 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 1DC8 _ 8B. 45, 10
        lea     edx, [eax-5H]                           ; 1DCB _ 8D. 50, FB
        mov     eax, dword [ebp+10H]                    ; 1DCE _ 8B. 45, 10
        sub     eax, 23                                 ; 1DD1 _ 83. E8, 17
        mov     dword [esp+18H], edx                    ; 1DD4 _ 89. 54 24, 18
        mov     dword [esp+14H], 59                     ; 1DD8 _ C7. 44 24, 14, 0000003B
        mov     dword [esp+10H], eax                    ; 1DE0 _ 89. 44 24, 10
        mov     dword [esp+0CH], 59                     ; 1DE4 _ C7. 44 24, 0C, 0000003B
        mov     dword [esp+8H], 2                       ; 1DEC _ C7. 44 24, 08, 00000002
        mov     eax, dword [ebp+0CH]                    ; 1DF4 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 1DF7 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1DFB _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1DFE _ 89. 04 24
        call    boxfill8                                ; 1E01 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 1E06 _ 8B. 45, 10
        lea     edx, [eax-3H]                           ; 1E09 _ 8D. 50, FD
        mov     eax, dword [ebp+10H]                    ; 1E0C _ 8B. 45, 10
        sub     eax, 3                                  ; 1E0F _ 83. E8, 03
        mov     dword [esp+18H], edx                    ; 1E12 _ 89. 54 24, 18
        mov     dword [esp+14H], 59                     ; 1E16 _ C7. 44 24, 14, 0000003B
        mov     dword [esp+10H], eax                    ; 1E1E _ 89. 44 24, 10
        mov     dword [esp+0CH], 2                      ; 1E22 _ C7. 44 24, 0C, 00000002
        mov     dword [esp+8H], 0                       ; 1E2A _ C7. 44 24, 08, 00000000
        mov     eax, dword [ebp+0CH]                    ; 1E32 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 1E35 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1E39 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1E3C _ 89. 04 24
        call    boxfill8                                ; 1E3F _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 1E44 _ 8B. 45, 10
        lea     edx, [eax-3H]                           ; 1E47 _ 8D. 50, FD
        mov     eax, dword [ebp+10H]                    ; 1E4A _ 8B. 45, 10
        sub     eax, 24                                 ; 1E4D _ 83. E8, 18
        mov     dword [esp+18H], edx                    ; 1E50 _ 89. 54 24, 18
        mov     dword [esp+14H], 60                     ; 1E54 _ C7. 44 24, 14, 0000003C
        mov     dword [esp+10H], eax                    ; 1E5C _ 89. 44 24, 10
        mov     dword [esp+0CH], 60                     ; 1E60 _ C7. 44 24, 0C, 0000003C
        mov     dword [esp+8H], 0                       ; 1E68 _ C7. 44 24, 08, 00000000
        mov     eax, dword [ebp+0CH]                    ; 1E70 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 1E73 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1E77 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1E7A _ 89. 04 24
        call    boxfill8                                ; 1E7D _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 1E82 _ 8B. 45, 10
        lea     ebx, [eax-18H]                          ; 1E85 _ 8D. 58, E8
        mov     eax, dword [ebp+0CH]                    ; 1E88 _ 8B. 45, 0C
        lea     ecx, [eax-4H]                           ; 1E8B _ 8D. 48, FC
        mov     eax, dword [ebp+10H]                    ; 1E8E _ 8B. 45, 10
        lea     edx, [eax-18H]                          ; 1E91 _ 8D. 50, E8
        mov     eax, dword [ebp+0CH]                    ; 1E94 _ 8B. 45, 0C
        sub     eax, 47                                 ; 1E97 _ 83. E8, 2F
        mov     dword [esp+18H], ebx                    ; 1E9A _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 1E9E _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 1EA2 _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 1EA6 _ 89. 44 24, 0C
        mov     dword [esp+8H], 2                       ; 1EAA _ C7. 44 24, 08, 00000002
        mov     eax, dword [ebp+0CH]                    ; 1EB2 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 1EB5 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1EB9 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1EBC _ 89. 04 24
        call    boxfill8                                ; 1EBF _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 1EC4 _ 8B. 45, 10
        lea     ebx, [eax-4H]                           ; 1EC7 _ 8D. 58, FC
        mov     eax, dword [ebp+0CH]                    ; 1ECA _ 8B. 45, 0C
        lea     ecx, [eax-2FH]                          ; 1ECD _ 8D. 48, D1
        mov     eax, dword [ebp+10H]                    ; 1ED0 _ 8B. 45, 10
        lea     edx, [eax-17H]                          ; 1ED3 _ 8D. 50, E9
        mov     eax, dword [ebp+0CH]                    ; 1ED6 _ 8B. 45, 0C
        sub     eax, 47                                 ; 1ED9 _ 83. E8, 2F
        mov     dword [esp+18H], ebx                    ; 1EDC _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 1EE0 _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 1EE4 _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 1EE8 _ 89. 44 24, 0C
        mov     dword [esp+8H], 2                       ; 1EEC _ C7. 44 24, 08, 00000002
        mov     eax, dword [ebp+0CH]                    ; 1EF4 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 1EF7 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1EFB _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1EFE _ 89. 04 24
        call    boxfill8                                ; 1F01 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 1F06 _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 1F09 _ 8D. 58, FD
        mov     eax, dword [ebp+0CH]                    ; 1F0C _ 8B. 45, 0C
        lea     ecx, [eax-4H]                           ; 1F0F _ 8D. 48, FC
        mov     eax, dword [ebp+10H]                    ; 1F12 _ 8B. 45, 10
        lea     edx, [eax-3H]                           ; 1F15 _ 8D. 50, FD
        mov     eax, dword [ebp+0CH]                    ; 1F18 _ 8B. 45, 0C
        sub     eax, 47                                 ; 1F1B _ 83. E8, 2F
        mov     dword [esp+18H], ebx                    ; 1F1E _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 1F22 _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 1F26 _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 1F2A _ 89. 44 24, 0C
        mov     dword [esp+8H], 7                       ; 1F2E _ C7. 44 24, 08, 00000007
        mov     eax, dword [ebp+0CH]                    ; 1F36 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 1F39 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1F3D _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1F40 _ 89. 04 24
        call    boxfill8                                ; 1F43 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 1F48 _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 1F4B _ 8D. 58, FD
        mov     eax, dword [ebp+0CH]                    ; 1F4E _ 8B. 45, 0C
        lea     ecx, [eax-3H]                           ; 1F51 _ 8D. 48, FD
        mov     eax, dword [ebp+10H]                    ; 1F54 _ 8B. 45, 10
        lea     edx, [eax-18H]                          ; 1F57 _ 8D. 50, E8
        mov     eax, dword [ebp+0CH]                    ; 1F5A _ 8B. 45, 0C
        sub     eax, 3                                  ; 1F5D _ 83. E8, 03
        mov     dword [esp+18H], ebx                    ; 1F60 _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 1F64 _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 1F68 _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 1F6C _ 89. 44 24, 0C
        mov     dword [esp+8H], 7                       ; 1F70 _ C7. 44 24, 08, 00000007
        mov     eax, dword [ebp+0CH]                    ; 1F78 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 1F7B _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1F7F _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1F82 _ 89. 04 24
        call    boxfill8                                ; 1F85 _ E8, FFFFFFFC(rel)
        add     esp, 36                                 ; 1F8A _ 83. C4, 24
        pop     ebx                                     ; 1F8D _ 5B
        pop     ebp                                     ; 1F8E _ 5D
        ret                                             ; 1F8F _ C3
; init_screen8 End of function

computeMousePosition:; Function begin
        push    ebp                                     ; 1F90 _ 55
        mov     ebp, esp                                ; 1F91 _ 89. E5
        mov     eax, dword [ebp+10H]                    ; 1F93 _ 8B. 45, 10
        mov     edx, dword [eax+4H]                     ; 1F96 _ 8B. 50, 04
        mov     eax, dword [mx]                         ; 1F99 _ A1, 00000134(d)
        add     eax, edx                                ; 1F9E _ 01. D0
        mov     dword [mx], eax                         ; 1FA0 _ A3, 00000134(d)
        mov     eax, dword [ebp+10H]                    ; 1FA5 _ 8B. 45, 10
        mov     edx, dword [eax+8H]                     ; 1FA8 _ 8B. 50, 08
        mov     eax, dword [my]                         ; 1FAB _ A1, 00000138(d)
        add     eax, edx                                ; 1FB0 _ 01. D0
        mov     dword [my], eax                         ; 1FB2 _ A3, 00000138(d)
        mov     eax, dword [mx]                         ; 1FB7 _ A1, 00000134(d)
        test    eax, eax                                ; 1FBC _ 85. C0
        jns     ?_095                                   ; 1FBE _ 79, 0A
        mov     dword [mx], 0                           ; 1FC0 _ C7. 05, 00000134(d), 00000000
?_095:  mov     eax, dword [my]                         ; 1FCA _ A1, 00000138(d)
        test    eax, eax                                ; 1FCF _ 85. C0
        jns     ?_096                                   ; 1FD1 _ 79, 0A
        mov     dword [my], 0                           ; 1FD3 _ C7. 05, 00000138(d), 00000000
?_096:  mov     eax, dword [xsize]                      ; 1FDD _ A1, 0000013C(d)
        lea     edx, [eax-1H]                           ; 1FE2 _ 8D. 50, FF
        mov     eax, dword [mx]                         ; 1FE5 _ A1, 00000134(d)
        cmp     edx, eax                                ; 1FEA _ 39. C2
        jge     ?_097                                   ; 1FEC _ 7D, 0D
        mov     eax, dword [xsize]                      ; 1FEE _ A1, 0000013C(d)
        sub     eax, 1                                  ; 1FF3 _ 83. E8, 01
        mov     dword [mx], eax                         ; 1FF6 _ A3, 00000134(d)
?_097:  mov     eax, dword [ysize]                      ; 1FFB _ A1, 00000140(d)
        lea     edx, [eax-1H]                           ; 2000 _ 8D. 50, FF
        mov     eax, dword [my]                         ; 2003 _ A1, 00000138(d)
        cmp     edx, eax                                ; 2008 _ 39. C2
        jge     ?_098                                   ; 200A _ 7D, 0D
        mov     eax, dword [ysize]                      ; 200C _ A1, 00000140(d)
        sub     eax, 1                                  ; 2011 _ 83. E8, 01
        mov     dword [my], eax                         ; 2014 _ A3, 00000138(d)
?_098:  pop     ebp                                     ; 2019 _ 5D
        ret                                             ; 201A _ C3
; computeMousePosition End of function

show_mouse_info:; Function begin
        push    ebp                                     ; 201B _ 55
        mov     ebp, esp                                ; 201C _ 89. E5
        sub     esp, 40                                 ; 201E _ 83. EC, 28
        mov     eax, dword [buf_back]                   ; 2021 _ A1, 00000144(d)
        mov     dword [ebp-0CH], eax                    ; 2026 _ 89. 45, F4
        mov     byte [ebp-0DH], 0                       ; 2029 _ C6. 45, F3, 00
        call    io_sti                                  ; 202D _ E8, FFFFFFFC(rel)
        mov     dword [esp], mouseinfo                  ; 2032 _ C7. 04 24, 00000040(d)
        call    fifo8_get                               ; 2039 _ E8, FFFFFFFC(rel)
        mov     byte [ebp-0DH], al                      ; 203E _ 88. 45, F3
        movzx   eax, byte [ebp-0DH]                     ; 2041 _ 0F B6. 45, F3
        mov     dword [esp+4H], eax                     ; 2045 _ 89. 44 24, 04
        mov     dword [esp], mdec                       ; 2049 _ C7. 04 24, 00000100(d)
        call    mouse_decode                            ; 2050 _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 2055 _ 85. C0
        jz      ?_099                                   ; 2057 _ 74, 77
        mov     dword [esp+8H], mdec                    ; 2059 _ C7. 44 24, 08, 00000100(d)
        mov     eax, dword [ebp+0CH]                    ; 2061 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 2064 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2068 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 206B _ 89. 04 24
        call    computeMousePosition                    ; 206E _ E8, FFFFFFFC(rel)
        mov     edx, dword [my]                         ; 2073 _ 8B. 15, 00000138(d)
        mov     eax, dword [mx]                         ; 2079 _ A1, 00000134(d)
        mov     dword [esp+0CH], edx                    ; 207E _ 89. 54 24, 0C
        mov     dword [esp+8H], eax                     ; 2082 _ 89. 44 24, 08
        mov     eax, dword [ebp+10H]                    ; 2086 _ 8B. 45, 10
        mov     dword [esp+4H], eax                     ; 2089 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 208D _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2090 _ 89. 04 24
        call    sheet_slide                             ; 2093 _ E8, FFFFFFFC(rel)
        mov     eax, dword [?_334]                      ; 2098 _ A1, 0000010C(d)
        and     eax, 01H                                ; 209D _ 83. E0, 01
        test    eax, eax                                ; 20A0 _ 85. C0
        jz      ?_099                                   ; 20A2 _ 74, 2C
        mov     eax, dword [my]                         ; 20A4 _ A1, 00000138(d)
        lea     ecx, [eax-8H]                           ; 20A9 _ 8D. 48, F8
        mov     eax, dword [mx]                         ; 20AC _ A1, 00000134(d)
        lea     edx, [eax-50H]                          ; 20B1 _ 8D. 50, B0
        mov     eax, dword [shtMsgBox]                  ; 20B4 _ A1, 00000260(d)
        mov     dword [esp+0CH], ecx                    ; 20B9 _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 20BD _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 20C1 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 20C5 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 20C8 _ 89. 04 24
        call    sheet_slide                             ; 20CB _ E8, FFFFFFFC(rel)
?_099:  leave                                           ; 20D0 _ C9
        ret                                             ; 20D1 _ C3
; show_mouse_info End of function

initBootInfo:; Function begin
        push    ebp                                     ; 20D2 _ 55
        mov     ebp, esp                                ; 20D3 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 20D5 _ 8B. 45, 08
        mov     dword [eax], -536870912                 ; 20D8 _ C7. 00, E0000000
        mov     eax, dword [ebp+8H]                     ; 20DE _ 8B. 45, 08
; Note: Length-changing prefix causes delay on Intel processors
        mov     word [eax+4H], 640                      ; 20E1 _ 66: C7. 40, 04, 0280
        mov     eax, dword [ebp+8H]                     ; 20E7 _ 8B. 45, 08
; Note: Length-changing prefix causes delay on Intel processors
        mov     word [eax+6H], 480                      ; 20EA _ 66: C7. 40, 06, 01E0
        pop     ebp                                     ; 20F0 _ 5D
        ret                                             ; 20F1 _ C3
; initBootInfo End of function

showString:; Function begin
        push    ebp                                     ; 20F2 _ 55
        mov     ebp, esp                                ; 20F3 _ 89. E5
        push    ebx                                     ; 20F5 _ 53
        sub     esp, 52                                 ; 20F6 _ 83. EC, 34
        mov     eax, dword [ebp+18H]                    ; 20F9 _ 8B. 45, 18
        mov     byte [ebp-1CH], al                      ; 20FC _ 88. 45, E4
        mov     eax, dword [ebp+10H]                    ; 20FF _ 8B. 45, 10
        mov     dword [ebp-0CH], eax                    ; 2102 _ 89. 45, F4
        mov     dword [ebp-10H], 0                      ; 2105 _ C7. 45, F0, 00000000
        jmp     ?_101                                   ; 210C _ EB, 4B

?_100:  mov     eax, dword [ebp+1CH]                    ; 210E _ 8B. 45, 1C
        movzx   eax, byte [eax]                         ; 2111 _ 0F B6. 00
        movzx   eax, al                                 ; 2114 _ 0F B6. C0
        shl     eax, 4                                  ; 2117 _ C1. E0, 04
        lea     ebx, [systemFont+eax]                   ; 211A _ 8D. 98, 00000000(d)
        movsx   ecx, byte [ebp-1CH]                     ; 2120 _ 0F BE. 4D, E4
        mov     eax, dword [ebp+0CH]                    ; 2124 _ 8B. 45, 0C
        mov     edx, dword [eax+4H]                     ; 2127 _ 8B. 50, 04
        mov     eax, dword [ebp+0CH]                    ; 212A _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 212D _ 8B. 00
        mov     dword [esp+14H], ebx                    ; 212F _ 89. 5C 24, 14
        mov     dword [esp+10H], ecx                    ; 2133 _ 89. 4C 24, 10
        mov     ecx, dword [ebp+14H]                    ; 2137 _ 8B. 4D, 14
        mov     dword [esp+0CH], ecx                    ; 213A _ 89. 4C 24, 0C
        mov     ecx, dword [ebp+10H]                    ; 213E _ 8B. 4D, 10
        mov     dword [esp+8H], ecx                     ; 2141 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 2145 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 2149 _ 89. 04 24
        call    showFont8                               ; 214C _ E8, FFFFFFFC(rel)
        add     dword [ebp+10H], 8                      ; 2151 _ 83. 45, 10, 08
        add     dword [ebp+1CH], 1                      ; 2155 _ 83. 45, 1C, 01
?_101:  mov     eax, dword [ebp+1CH]                    ; 2159 _ 8B. 45, 1C
        movzx   eax, byte [eax]                         ; 215C _ 0F B6. 00
        test    al, al                                  ; 215F _ 84. C0
        jnz     ?_100                                   ; 2161 _ 75, AB
        mov     eax, dword [ebp+14H]                    ; 2163 _ 8B. 45, 14
        add     eax, 16                                 ; 2166 _ 83. C0, 10
        mov     dword [esp+14H], eax                    ; 2169 _ 89. 44 24, 14
        mov     eax, dword [ebp+10H]                    ; 216D _ 8B. 45, 10
        mov     dword [esp+10H], eax                    ; 2170 _ 89. 44 24, 10
        mov     eax, dword [ebp+14H]                    ; 2174 _ 8B. 45, 14
        mov     dword [esp+0CH], eax                    ; 2177 _ 89. 44 24, 0C
        mov     eax, dword [ebp-0CH]                    ; 217B _ 8B. 45, F4
        mov     dword [esp+8H], eax                     ; 217E _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 2182 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 2185 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2189 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 218C _ 89. 04 24
        call    sheet_refresh                           ; 218F _ E8, FFFFFFFC(rel)
        add     esp, 52                                 ; 2194 _ 83. C4, 34
        pop     ebx                                     ; 2197 _ 5B
        pop     ebp                                     ; 2198 _ 5D
        ret                                             ; 2199 _ C3
; showString End of function

init_palette:; Function begin
        push    ebp                                     ; 219A _ 55
        mov     ebp, esp                                ; 219B _ 89. E5
        sub     esp, 24                                 ; 219D _ 83. EC, 18
        mov     dword [esp+8H], table_rgb.2006          ; 21A0 _ C7. 44 24, 08, 00000120(d)
        mov     dword [esp+4H], 15                      ; 21A8 _ C7. 44 24, 04, 0000000F
        mov     dword [esp], 0                          ; 21B0 _ C7. 04 24, 00000000
        call    set_palette                             ; 21B7 _ E8, FFFFFFFC(rel)
        nop                                             ; 21BC _ 90
        leave                                           ; 21BD _ C9
        ret                                             ; 21BE _ C3
; init_palette End of function

set_palette:; Function begin
        push    ebp                                     ; 21BF _ 55
        mov     ebp, esp                                ; 21C0 _ 89. E5
        sub     esp, 40                                 ; 21C2 _ 83. EC, 28
        call    io_load_eflags                          ; 21C5 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 21CA _ 89. 45, F0
        call    io_cli                                  ; 21CD _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 21D2 _ 8B. 45, 08
        mov     dword [esp+4H], eax                     ; 21D5 _ 89. 44 24, 04
        mov     dword [esp], 968                        ; 21D9 _ C7. 04 24, 000003C8
        call    io_out8                                 ; 21E0 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 21E5 _ 8B. 45, 08
        mov     dword [ebp-0CH], eax                    ; 21E8 _ 89. 45, F4
        jmp     ?_103                                   ; 21EB _ EB, 62

?_102:  mov     eax, dword [ebp+10H]                    ; 21ED _ 8B. 45, 10
        movzx   eax, byte [eax]                         ; 21F0 _ 0F B6. 00
        shr     al, 2                                   ; 21F3 _ C0. E8, 02
        movzx   eax, al                                 ; 21F6 _ 0F B6. C0
        mov     dword [esp+4H], eax                     ; 21F9 _ 89. 44 24, 04
        mov     dword [esp], 969                        ; 21FD _ C7. 04 24, 000003C9
        call    io_out8                                 ; 2204 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 2209 _ 8B. 45, 10
        add     eax, 1                                  ; 220C _ 83. C0, 01
        movzx   eax, byte [eax]                         ; 220F _ 0F B6. 00
        shr     al, 2                                   ; 2212 _ C0. E8, 02
        movzx   eax, al                                 ; 2215 _ 0F B6. C0
        mov     dword [esp+4H], eax                     ; 2218 _ 89. 44 24, 04
        mov     dword [esp], 969                        ; 221C _ C7. 04 24, 000003C9
        call    io_out8                                 ; 2223 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 2228 _ 8B. 45, 10
        add     eax, 2                                  ; 222B _ 83. C0, 02
        movzx   eax, byte [eax]                         ; 222E _ 0F B6. 00
        shr     al, 2                                   ; 2231 _ C0. E8, 02
        movzx   eax, al                                 ; 2234 _ 0F B6. C0
        mov     dword [esp+4H], eax                     ; 2237 _ 89. 44 24, 04
        mov     dword [esp], 969                        ; 223B _ C7. 04 24, 000003C9
        call    io_out8                                 ; 2242 _ E8, FFFFFFFC(rel)
        add     dword [ebp+10H], 3                      ; 2247 _ 83. 45, 10, 03
        add     dword [ebp-0CH], 1                      ; 224B _ 83. 45, F4, 01
?_103:  mov     eax, dword [ebp-0CH]                    ; 224F _ 8B. 45, F4
        cmp     eax, dword [ebp+0CH]                    ; 2252 _ 3B. 45, 0C
        jle     ?_102                                   ; 2255 _ 7E, 96
        mov     eax, dword [ebp-10H]                    ; 2257 _ 8B. 45, F0
        mov     dword [esp], eax                        ; 225A _ 89. 04 24
        call    io_store_eflags                         ; 225D _ E8, FFFFFFFC(rel)
        nop                                             ; 2262 _ 90
        leave                                           ; 2263 _ C9
        ret                                             ; 2264 _ C3
; set_palette End of function

boxfill8:; Function begin
        push    ebp                                     ; 2265 _ 55
        mov     ebp, esp                                ; 2266 _ 89. E5
        sub     esp, 20                                 ; 2268 _ 83. EC, 14
        mov     eax, dword [ebp+10H]                    ; 226B _ 8B. 45, 10
        mov     byte [ebp-14H], al                      ; 226E _ 88. 45, EC
        mov     eax, dword [ebp+18H]                    ; 2271 _ 8B. 45, 18
        mov     dword [ebp-8H], eax                     ; 2274 _ 89. 45, F8
        jmp     ?_107                                   ; 2277 _ EB, 33

?_104:  mov     eax, dword [ebp+14H]                    ; 2279 _ 8B. 45, 14
        mov     dword [ebp-4H], eax                     ; 227C _ 89. 45, FC
        jmp     ?_106                                   ; 227F _ EB, 1F

?_105:  mov     eax, dword [ebp-8H]                     ; 2281 _ 8B. 45, F8
        imul    eax, dword [ebp+0CH]                    ; 2284 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 2288 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 228A _ 8B. 45, FC
        add     eax, edx                                ; 228D _ 01. D0
        mov     edx, eax                                ; 228F _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 2291 _ 8B. 45, 08
        add     edx, eax                                ; 2294 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 2296 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 229A _ 88. 02
        add     dword [ebp-4H], 1                       ; 229C _ 83. 45, FC, 01
?_106:  mov     eax, dword [ebp-4H]                     ; 22A0 _ 8B. 45, FC
        cmp     eax, dword [ebp+1CH]                    ; 22A3 _ 3B. 45, 1C
        jle     ?_105                                   ; 22A6 _ 7E, D9
        add     dword [ebp-8H], 1                       ; 22A8 _ 83. 45, F8, 01
?_107:  mov     eax, dword [ebp-8H]                     ; 22AC _ 8B. 45, F8
        cmp     eax, dword [ebp+20H]                    ; 22AF _ 3B. 45, 20
        jle     ?_104                                   ; 22B2 _ 7E, C5
        leave                                           ; 22B4 _ C9
        ret                                             ; 22B5 _ C3
; boxfill8 End of function

showFont8:; Function begin
        push    ebp                                     ; 22B6 _ 55
        mov     ebp, esp                                ; 22B7 _ 89. E5
        sub     esp, 20                                 ; 22B9 _ 83. EC, 14
        mov     eax, dword [ebp+18H]                    ; 22BC _ 8B. 45, 18
        mov     byte [ebp-14H], al                      ; 22BF _ 88. 45, EC
        mov     dword [ebp-4H], 0                       ; 22C2 _ C7. 45, FC, 00000000
        jmp     ?_117                                   ; 22C9 _ E9, 0000016C

?_108:  mov     edx, dword [ebp-4H]                     ; 22CE _ 8B. 55, FC
        mov     eax, dword [ebp+1CH]                    ; 22D1 _ 8B. 45, 1C
        add     eax, edx                                ; 22D4 _ 01. D0
        movzx   eax, byte [eax]                         ; 22D6 _ 0F B6. 00
        mov     byte [ebp-5H], al                       ; 22D9 _ 88. 45, FB
        cmp     byte [ebp-5H], 0                        ; 22DC _ 80. 7D, FB, 00
        jns     ?_109                                   ; 22E0 _ 79, 20
        mov     eax, dword [ebp-4H]                     ; 22E2 _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 22E5 _ 8B. 55, 14
        add     eax, edx                                ; 22E8 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 22EA _ 0F AF. 45, 0C
        mov     edx, eax                                ; 22EE _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 22F0 _ 8B. 45, 10
        add     eax, edx                                ; 22F3 _ 01. D0
        mov     edx, eax                                ; 22F5 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 22F7 _ 8B. 45, 08
        add     edx, eax                                ; 22FA _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 22FC _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 2300 _ 88. 02
?_109:  movsx   eax, byte [ebp-5H]                      ; 2302 _ 0F BE. 45, FB
        and     eax, 40H                                ; 2306 _ 83. E0, 40
        test    eax, eax                                ; 2309 _ 85. C0
        jz      ?_110                                   ; 230B _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 230D _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 2310 _ 8B. 55, 14
        add     eax, edx                                ; 2313 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 2315 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 2319 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 231B _ 8B. 45, 10
        add     eax, edx                                ; 231E _ 01. D0
        lea     edx, [eax+1H]                           ; 2320 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 2323 _ 8B. 45, 08
        add     edx, eax                                ; 2326 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 2328 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 232C _ 88. 02
?_110:  movsx   eax, byte [ebp-5H]                      ; 232E _ 0F BE. 45, FB
        and     eax, 20H                                ; 2332 _ 83. E0, 20
        test    eax, eax                                ; 2335 _ 85. C0
        jz      ?_111                                   ; 2337 _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 2339 _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 233C _ 8B. 55, 14
        add     eax, edx                                ; 233F _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 2341 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 2345 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 2347 _ 8B. 45, 10
        add     eax, edx                                ; 234A _ 01. D0
        lea     edx, [eax+2H]                           ; 234C _ 8D. 50, 02
        mov     eax, dword [ebp+8H]                     ; 234F _ 8B. 45, 08
        add     edx, eax                                ; 2352 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 2354 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 2358 _ 88. 02
?_111:  movsx   eax, byte [ebp-5H]                      ; 235A _ 0F BE. 45, FB
        and     eax, 10H                                ; 235E _ 83. E0, 10
        test    eax, eax                                ; 2361 _ 85. C0
        jz      ?_112                                   ; 2363 _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 2365 _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 2368 _ 8B. 55, 14
        add     eax, edx                                ; 236B _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 236D _ 0F AF. 45, 0C
        mov     edx, eax                                ; 2371 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 2373 _ 8B. 45, 10
        add     eax, edx                                ; 2376 _ 01. D0
        lea     edx, [eax+3H]                           ; 2378 _ 8D. 50, 03
        mov     eax, dword [ebp+8H]                     ; 237B _ 8B. 45, 08
        add     edx, eax                                ; 237E _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 2380 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 2384 _ 88. 02
?_112:  movsx   eax, byte [ebp-5H]                      ; 2386 _ 0F BE. 45, FB
        and     eax, 08H                                ; 238A _ 83. E0, 08
        test    eax, eax                                ; 238D _ 85. C0
        jz      ?_113                                   ; 238F _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 2391 _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 2394 _ 8B. 55, 14
        add     eax, edx                                ; 2397 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 2399 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 239D _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 239F _ 8B. 45, 10
        add     eax, edx                                ; 23A2 _ 01. D0
        lea     edx, [eax+4H]                           ; 23A4 _ 8D. 50, 04
        mov     eax, dword [ebp+8H]                     ; 23A7 _ 8B. 45, 08
        add     edx, eax                                ; 23AA _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 23AC _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 23B0 _ 88. 02
?_113:  movsx   eax, byte [ebp-5H]                      ; 23B2 _ 0F BE. 45, FB
        and     eax, 04H                                ; 23B6 _ 83. E0, 04
        test    eax, eax                                ; 23B9 _ 85. C0
        jz      ?_114                                   ; 23BB _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 23BD _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 23C0 _ 8B. 55, 14
        add     eax, edx                                ; 23C3 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 23C5 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 23C9 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 23CB _ 8B. 45, 10
        add     eax, edx                                ; 23CE _ 01. D0
        lea     edx, [eax+5H]                           ; 23D0 _ 8D. 50, 05
        mov     eax, dword [ebp+8H]                     ; 23D3 _ 8B. 45, 08
        add     edx, eax                                ; 23D6 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 23D8 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 23DC _ 88. 02
?_114:  movsx   eax, byte [ebp-5H]                      ; 23DE _ 0F BE. 45, FB
        and     eax, 02H                                ; 23E2 _ 83. E0, 02
        test    eax, eax                                ; 23E5 _ 85. C0
        jz      ?_115                                   ; 23E7 _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 23E9 _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 23EC _ 8B. 55, 14
        add     eax, edx                                ; 23EF _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 23F1 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 23F5 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 23F7 _ 8B. 45, 10
        add     eax, edx                                ; 23FA _ 01. D0
        lea     edx, [eax+6H]                           ; 23FC _ 8D. 50, 06
        mov     eax, dword [ebp+8H]                     ; 23FF _ 8B. 45, 08
        add     edx, eax                                ; 2402 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 2404 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 2408 _ 88. 02
?_115:  movsx   eax, byte [ebp-5H]                      ; 240A _ 0F BE. 45, FB
        and     eax, 01H                                ; 240E _ 83. E0, 01
        test    eax, eax                                ; 2411 _ 85. C0
        jz      ?_116                                   ; 2413 _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 2415 _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 2418 _ 8B. 55, 14
        add     eax, edx                                ; 241B _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 241D _ 0F AF. 45, 0C
        mov     edx, eax                                ; 2421 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 2423 _ 8B. 45, 10
        add     eax, edx                                ; 2426 _ 01. D0
        lea     edx, [eax+7H]                           ; 2428 _ 8D. 50, 07
        mov     eax, dword [ebp+8H]                     ; 242B _ 8B. 45, 08
        add     edx, eax                                ; 242E _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 2430 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 2434 _ 88. 02
?_116:  add     dword [ebp-4H], 1                       ; 2436 _ 83. 45, FC, 01
?_117:  cmp     dword [ebp-4H], 15                      ; 243A _ 83. 7D, FC, 0F
        jle     ?_108                                   ; 243E _ 0F 8E, FFFFFE8A
        leave                                           ; 2444 _ C9
        ret                                             ; 2445 _ C3
; showFont8 End of function

init_mouse_cursor:; Function begin
        push    ebp                                     ; 2446 _ 55
        mov     ebp, esp                                ; 2447 _ 89. E5
        sub     esp, 20                                 ; 2449 _ 83. EC, 14
        mov     eax, dword [ebp+0CH]                    ; 244C _ 8B. 45, 0C
        mov     byte [ebp-14H], al                      ; 244F _ 88. 45, EC
        mov     dword [ebp-8H], 0                       ; 2452 _ C7. 45, F8, 00000000
        jmp     ?_124                                   ; 2459 _ E9, 000000B1

?_118:  mov     dword [ebp-4H], 0                       ; 245E _ C7. 45, FC, 00000000
        jmp     ?_123                                   ; 2465 _ E9, 00000097

?_119:  mov     eax, dword [ebp-8H]                     ; 246A _ 8B. 45, F8
        shl     eax, 4                                  ; 246D _ C1. E0, 04
        mov     edx, eax                                ; 2470 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 2472 _ 8B. 45, FC
        add     eax, edx                                ; 2475 _ 01. D0
        add     eax, cursor.2053                        ; 2477 _ 05, 00000160(d)
        movzx   eax, byte [eax]                         ; 247C _ 0F B6. 00
        cmp     al, 42                                  ; 247F _ 3C, 2A
        jnz     ?_120                                   ; 2481 _ 75, 17
        mov     eax, dword [ebp-8H]                     ; 2483 _ 8B. 45, F8
        shl     eax, 4                                  ; 2486 _ C1. E0, 04
        mov     edx, eax                                ; 2489 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 248B _ 8B. 45, FC
        add     eax, edx                                ; 248E _ 01. D0
        mov     edx, eax                                ; 2490 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 2492 _ 8B. 45, 08
        add     eax, edx                                ; 2495 _ 01. D0
        mov     byte [eax], 0                           ; 2497 _ C6. 00, 00
?_120:  mov     eax, dword [ebp-8H]                     ; 249A _ 8B. 45, F8
        shl     eax, 4                                  ; 249D _ C1. E0, 04
        mov     edx, eax                                ; 24A0 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 24A2 _ 8B. 45, FC
        add     eax, edx                                ; 24A5 _ 01. D0
        add     eax, cursor.2053                        ; 24A7 _ 05, 00000160(d)
        movzx   eax, byte [eax]                         ; 24AC _ 0F B6. 00
        cmp     al, 79                                  ; 24AF _ 3C, 4F
        jnz     ?_121                                   ; 24B1 _ 75, 17
        mov     eax, dword [ebp-8H]                     ; 24B3 _ 8B. 45, F8
        shl     eax, 4                                  ; 24B6 _ C1. E0, 04
        mov     edx, eax                                ; 24B9 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 24BB _ 8B. 45, FC
        add     eax, edx                                ; 24BE _ 01. D0
        mov     edx, eax                                ; 24C0 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 24C2 _ 8B. 45, 08
        add     eax, edx                                ; 24C5 _ 01. D0
        mov     byte [eax], 7                           ; 24C7 _ C6. 00, 07
?_121:  mov     eax, dword [ebp-8H]                     ; 24CA _ 8B. 45, F8
        shl     eax, 4                                  ; 24CD _ C1. E0, 04
        mov     edx, eax                                ; 24D0 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 24D2 _ 8B. 45, FC
        add     eax, edx                                ; 24D5 _ 01. D0
        add     eax, cursor.2053                        ; 24D7 _ 05, 00000160(d)
        movzx   eax, byte [eax]                         ; 24DC _ 0F B6. 00
        cmp     al, 46                                  ; 24DF _ 3C, 2E
        jnz     ?_122                                   ; 24E1 _ 75, 1A
        mov     eax, dword [ebp-8H]                     ; 24E3 _ 8B. 45, F8
        shl     eax, 4                                  ; 24E6 _ C1. E0, 04
        mov     edx, eax                                ; 24E9 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 24EB _ 8B. 45, FC
        add     eax, edx                                ; 24EE _ 01. D0
        mov     edx, eax                                ; 24F0 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 24F2 _ 8B. 45, 08
        add     edx, eax                                ; 24F5 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 24F7 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 24FB _ 88. 02
?_122:  add     dword [ebp-4H], 1                       ; 24FD _ 83. 45, FC, 01
?_123:  cmp     dword [ebp-4H], 15                      ; 2501 _ 83. 7D, FC, 0F
        jle     ?_119                                   ; 2505 _ 0F 8E, FFFFFF5F
        add     dword [ebp-8H], 1                       ; 250B _ 83. 45, F8, 01
?_124:  cmp     dword [ebp-8H], 15                      ; 250F _ 83. 7D, F8, 0F
        jle     ?_118                                   ; 2513 _ 0F 8E, FFFFFF45
        leave                                           ; 2519 _ C9
        ret                                             ; 251A _ C3
; init_mouse_cursor End of function

putblock:; Function begin
        push    ebp                                     ; 251B _ 55
        mov     ebp, esp                                ; 251C _ 89. E5
        sub     esp, 16                                 ; 251E _ 83. EC, 10
        mov     dword [ebp-8H], 0                       ; 2521 _ C7. 45, F8, 00000000
        jmp     ?_128                                   ; 2528 _ EB, 50

?_125:  mov     dword [ebp-4H], 0                       ; 252A _ C7. 45, FC, 00000000
        jmp     ?_127                                   ; 2531 _ EB, 3B

?_126:  mov     eax, dword [ebp-8H]                     ; 2533 _ 8B. 45, F8
        mov     edx, dword [ebp+1CH]                    ; 2536 _ 8B. 55, 1C
        add     eax, edx                                ; 2539 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 253B _ 0F AF. 45, 0C
        mov     edx, dword [ebp-4H]                     ; 253F _ 8B. 55, FC
        mov     ecx, dword [ebp+18H]                    ; 2542 _ 8B. 4D, 18
        add     edx, ecx                                ; 2545 _ 01. CA
        add     eax, edx                                ; 2547 _ 01. D0
        mov     edx, eax                                ; 2549 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 254B _ 8B. 45, 08
        add     edx, eax                                ; 254E _ 01. C2
        mov     eax, dword [ebp-8H]                     ; 2550 _ 8B. 45, F8
        imul    eax, dword [ebp+24H]                    ; 2553 _ 0F AF. 45, 24
        mov     ecx, eax                                ; 2557 _ 89. C1
        mov     eax, dword [ebp-4H]                     ; 2559 _ 8B. 45, FC
        add     eax, ecx                                ; 255C _ 01. C8
        mov     ecx, eax                                ; 255E _ 89. C1
        mov     eax, dword [ebp+20H]                    ; 2560 _ 8B. 45, 20
        add     eax, ecx                                ; 2563 _ 01. C8
        movzx   eax, byte [eax]                         ; 2565 _ 0F B6. 00
        mov     byte [edx], al                          ; 2568 _ 88. 02
        add     dword [ebp-4H], 1                       ; 256A _ 83. 45, FC, 01
?_127:  mov     eax, dword [ebp-4H]                     ; 256E _ 8B. 45, FC
        cmp     eax, dword [ebp+10H]                    ; 2571 _ 3B. 45, 10
        jl      ?_126                                   ; 2574 _ 7C, BD
        add     dword [ebp-8H], 1                       ; 2576 _ 83. 45, F8, 01
?_128:  mov     eax, dword [ebp-8H]                     ; 257A _ 8B. 45, F8
        cmp     eax, dword [ebp+14H]                    ; 257D _ 3B. 45, 14
        jl      ?_125                                   ; 2580 _ 7C, A8
        leave                                           ; 2582 _ C9
        ret                                             ; 2583 _ C3
; putblock End of function

intHandlerFromC:; Function begin
        push    ebp                                     ; 2584 _ 55
        mov     ebp, esp                                ; 2585 _ 89. E5
        sub     esp, 40                                 ; 2587 _ 83. EC, 28
        mov     eax, dword [bootInfo]                   ; 258A _ A1, 0000001C(d)
        mov     dword [ebp-0CH], eax                    ; 258F _ 89. 45, F4
        movzx   eax, word [?_331]                       ; 2592 _ 0F B7. 05, 00000020(d)
        cwde                                            ; 2599 _ 98
        mov     dword [ebp-10H], eax                    ; 259A _ 89. 45, F0
        movzx   eax, word [?_332]                       ; 259D _ 0F B7. 05, 00000022(d)
        cwde                                            ; 25A4 _ 98
        mov     dword [ebp-14H], eax                    ; 25A5 _ 89. 45, EC
        mov     dword [esp+4H], 32                      ; 25A8 _ C7. 44 24, 04, 00000020
        mov     dword [esp], 32                         ; 25B0 _ C7. 04 24, 00000020
        call    io_out8                                 ; 25B7 _ E8, FFFFFFFC(rel)
        mov     byte [ebp-15H], 0                       ; 25BC _ C6. 45, EB, 00
        mov     dword [esp], 96                         ; 25C0 _ C7. 04 24, 00000060
        call    io_in8                                  ; 25C7 _ E8, FFFFFFFC(rel)
        mov     byte [ebp-15H], al                      ; 25CC _ 88. 45, EB
        movzx   eax, byte [ebp-15H]                     ; 25CF _ 0F B6. 45, EB
        mov     dword [esp+4H], eax                     ; 25D3 _ 89. 44 24, 04
        mov     dword [esp], keyinfo                    ; 25D7 _ C7. 04 24, 00000024(d)
        call    fifo8_put                               ; 25DE _ E8, FFFFFFFC(rel)
        nop                                             ; 25E3 _ 90
        leave                                           ; 25E4 _ C9
        ret                                             ; 25E5 _ C3
; intHandlerFromC End of function

charToHexVal:; Function begin
        push    ebp                                     ; 25E6 _ 55
        mov     ebp, esp                                ; 25E7 _ 89. E5
        sub     esp, 4                                  ; 25E9 _ 83. EC, 04
        mov     eax, dword [ebp+8H]                     ; 25EC _ 8B. 45, 08
        mov     byte [ebp-4H], al                       ; 25EF _ 88. 45, FC
        cmp     byte [ebp-4H], 9                        ; 25F2 _ 80. 7D, FC, 09
        jle     ?_129                                   ; 25F6 _ 7E, 09
        movzx   eax, byte [ebp-4H]                      ; 25F8 _ 0F B6. 45, FC
        add     eax, 55                                 ; 25FC _ 83. C0, 37
        jmp     ?_130                                   ; 25FF _ EB, 07

?_129:  movzx   eax, byte [ebp-4H]                      ; 2601 _ 0F B6. 45, FC
        add     eax, 48                                 ; 2605 _ 83. C0, 30
?_130:  leave                                           ; 2608 _ C9
        ret                                             ; 2609 _ C3
; charToHexVal End of function

charToHexStr:; Function begin
        push    ebp                                     ; 260A _ 55
        mov     ebp, esp                                ; 260B _ 89. E5
        sub     esp, 24                                 ; 260D _ 83. EC, 18
        mov     eax, dword [ebp+8H]                     ; 2610 _ 8B. 45, 08
        mov     byte [ebp-14H], al                      ; 2613 _ 88. 45, EC
        mov     dword [ebp-4H], 0                       ; 2616 _ C7. 45, FC, 00000000
        movzx   eax, byte [ebp-14H]                     ; 261D _ 0F B6. 45, EC
        and     eax, 0FH                                ; 2621 _ 83. E0, 0F
        mov     byte [ebp-5H], al                       ; 2624 _ 88. 45, FB
        movsx   eax, byte [ebp-5H]                      ; 2627 _ 0F BE. 45, FB
        mov     dword [esp], eax                        ; 262B _ 89. 04 24
        call    charToHexVal                            ; 262E _ E8, FFFFFFFC(rel)
        mov     byte [?_325], al                        ; 2633 _ A2, 00000113(d)
        movzx   eax, byte [ebp-14H]                     ; 2638 _ 0F B6. 45, EC
        shr     al, 4                                   ; 263C _ C0. E8, 04
        mov     byte [ebp-14H], al                      ; 263F _ 88. 45, EC
        movzx   eax, byte [ebp-14H]                     ; 2642 _ 0F B6. 45, EC
        movsx   eax, al                                 ; 2646 _ 0F BE. C0
        mov     dword [esp], eax                        ; 2649 _ 89. 04 24
        call    charToHexVal                            ; 264C _ E8, FFFFFFFC(rel)
        mov     byte [?_324], al                        ; 2651 _ A2, 00000112(d)
        mov     eax, keyval                             ; 2656 _ B8, 00000110(d)
        leave                                           ; 265B _ C9
        ret                                             ; 265C _ C3
; charToHexStr End of function

intToHexStr:; Function begin
        push    ebp                                     ; 265D _ 55
        mov     ebp, esp                                ; 265E _ 89. E5
        sub     esp, 16                                 ; 2660 _ 83. EC, 10
        mov     byte [str.2101], 48                     ; 2663 _ C6. 05, 00000394(d), 30
        mov     byte [?_336], 88                        ; 266A _ C6. 05, 00000395(d), 58
        mov     byte [?_337], 0                         ; 2671 _ C6. 05, 0000039E(d), 00
        mov     dword [ebp-4H], 2                       ; 2678 _ C7. 45, FC, 00000002
        jmp     ?_132                                   ; 267F _ EB, 0F

?_131:  mov     eax, dword [ebp-4H]                     ; 2681 _ 8B. 45, FC
        add     eax, str.2101                           ; 2684 _ 05, 00000394(d)
        mov     byte [eax], 48                          ; 2689 _ C6. 00, 30
        add     dword [ebp-4H], 1                       ; 268C _ 83. 45, FC, 01
?_132:  cmp     dword [ebp-4H], 9                       ; 2690 _ 83. 7D, FC, 09
        jle     ?_131                                   ; 2694 _ 7E, EB
        mov     dword [ebp-8H], 9                       ; 2696 _ C7. 45, F8, 00000009
        jmp     ?_136                                   ; 269D _ EB, 40

?_133:  mov     eax, dword [ebp+8H]                     ; 269F _ 8B. 45, 08
        and     eax, 0FH                                ; 26A2 _ 83. E0, 0F
        mov     dword [ebp-0CH], eax                    ; 26A5 _ 89. 45, F4
        mov     eax, dword [ebp+8H]                     ; 26A8 _ 8B. 45, 08
        shr     eax, 4                                  ; 26AB _ C1. E8, 04
        mov     dword [ebp+8H], eax                     ; 26AE _ 89. 45, 08
        cmp     dword [ebp-0CH], 9                      ; 26B1 _ 83. 7D, F4, 09
        jle     ?_134                                   ; 26B5 _ 7E, 13
        mov     eax, dword [ebp-0CH]                    ; 26B7 _ 8B. 45, F4
        add     eax, 55                                 ; 26BA _ 83. C0, 37
        mov     edx, dword [ebp-8H]                     ; 26BD _ 8B. 55, F8
        add     edx, str.2101                           ; 26C0 _ 81. C2, 00000394(d)
        mov     byte [edx], al                          ; 26C6 _ 88. 02
        jmp     ?_135                                   ; 26C8 _ EB, 11

?_134:  mov     eax, dword [ebp-0CH]                    ; 26CA _ 8B. 45, F4
        add     eax, 48                                 ; 26CD _ 83. C0, 30
        mov     edx, dword [ebp-8H]                     ; 26D0 _ 8B. 55, F8
        add     edx, str.2101                           ; 26D3 _ 81. C2, 00000394(d)
        mov     byte [edx], al                          ; 26D9 _ 88. 02
?_135:  sub     dword [ebp-8H], 1                       ; 26DB _ 83. 6D, F8, 01
?_136:  cmp     dword [ebp-8H], 1                       ; 26DF _ 83. 7D, F8, 01
        jle     ?_137                                   ; 26E3 _ 7E, 06
        cmp     dword [ebp+8H], 0                       ; 26E5 _ 83. 7D, 08, 00
        jnz     ?_133                                   ; 26E9 _ 75, B4
?_137:  mov     eax, str.2101                           ; 26EB _ B8, 00000394(d)
        leave                                           ; 26F0 _ C9
        ret                                             ; 26F1 _ C3
; intToHexStr End of function

wait_KBC_sendready:; Function begin
        push    ebp                                     ; 26F2 _ 55
        mov     ebp, esp                                ; 26F3 _ 89. E5
        sub     esp, 24                                 ; 26F5 _ 83. EC, 18
?_138:  mov     dword [esp], 100                        ; 26F8 _ C7. 04 24, 00000064
        call    io_in8                                  ; 26FF _ E8, FFFFFFFC(rel)
        and     eax, 02H                                ; 2704 _ 83. E0, 02
        test    eax, eax                                ; 2707 _ 85. C0
        jnz     ?_139                                   ; 2709 _ 75, 02
        jmp     ?_140                                   ; 270B _ EB, 02

?_139:  jmp     ?_138                                   ; 270D _ EB, E9

?_140:  leave                                           ; 270F _ C9
        ret                                             ; 2710 _ C3
; wait_KBC_sendready End of function

init_keyboard:; Function begin
        push    ebp                                     ; 2711 _ 55
        mov     ebp, esp                                ; 2712 _ 89. E5
        sub     esp, 24                                 ; 2714 _ 83. EC, 18
        call    wait_KBC_sendready                      ; 2717 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 96                      ; 271C _ C7. 44 24, 04, 00000060
        mov     dword [esp], 100                        ; 2724 _ C7. 04 24, 00000064
        call    io_out8                                 ; 272B _ E8, FFFFFFFC(rel)
        call    wait_KBC_sendready                      ; 2730 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 71                      ; 2735 _ C7. 44 24, 04, 00000047
        mov     dword [esp], 96                         ; 273D _ C7. 04 24, 00000060
        call    io_out8                                 ; 2744 _ E8, FFFFFFFC(rel)
        nop                                             ; 2749 _ 90
        leave                                           ; 274A _ C9
        ret                                             ; 274B _ C3
; init_keyboard End of function

enable_mouse:; Function begin
        push    ebp                                     ; 274C _ 55
        mov     ebp, esp                                ; 274D _ 89. E5
        sub     esp, 24                                 ; 274F _ 83. EC, 18
        call    wait_KBC_sendready                      ; 2752 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 212                     ; 2757 _ C7. 44 24, 04, 000000D4
        mov     dword [esp], 100                        ; 275F _ C7. 04 24, 00000064
        call    io_out8                                 ; 2766 _ E8, FFFFFFFC(rel)
        call    wait_KBC_sendready                      ; 276B _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 244                     ; 2770 _ C7. 44 24, 04, 000000F4
        mov     dword [esp], 96                         ; 2778 _ C7. 04 24, 00000060
        call    io_out8                                 ; 277F _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 2784 _ 8B. 45, 08
        mov     byte [eax+3H], 0                        ; 2787 _ C6. 40, 03, 00
        nop                                             ; 278B _ 90
        leave                                           ; 278C _ C9
        ret                                             ; 278D _ C3
; enable_mouse End of function

intHandlerForMouse:; Function begin
        push    ebp                                     ; 278E _ 55
        mov     ebp, esp                                ; 278F _ 89. E5
        sub     esp, 40                                 ; 2791 _ 83. EC, 28
        mov     dword [esp+4H], 32                      ; 2794 _ C7. 44 24, 04, 00000020
        mov     dword [esp], 160                        ; 279C _ C7. 04 24, 000000A0
        call    io_out8                                 ; 27A3 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 32                      ; 27A8 _ C7. 44 24, 04, 00000020
        mov     dword [esp], 32                         ; 27B0 _ C7. 04 24, 00000020
        call    io_out8                                 ; 27B7 _ E8, FFFFFFFC(rel)
        mov     dword [esp], 96                         ; 27BC _ C7. 04 24, 00000060
        call    io_in8                                  ; 27C3 _ E8, FFFFFFFC(rel)
        mov     byte [ebp-9H], al                       ; 27C8 _ 88. 45, F7
        movzx   eax, byte [ebp-9H]                      ; 27CB _ 0F B6. 45, F7
        mov     dword [esp+4H], eax                     ; 27CF _ 89. 44 24, 04
        mov     dword [esp], mouseinfo                  ; 27D3 _ C7. 04 24, 00000040(d)
        call    fifo8_put                               ; 27DA _ E8, FFFFFFFC(rel)
        leave                                           ; 27DF _ C9
        ret                                             ; 27E0 _ C3
; intHandlerForMouse End of function

mouse_decode:; Function begin
        push    ebp                                     ; 27E1 _ 55
        mov     ebp, esp                                ; 27E2 _ 89. E5
        sub     esp, 4                                  ; 27E4 _ 83. EC, 04
        mov     eax, dword [ebp+0CH]                    ; 27E7 _ 8B. 45, 0C
        mov     byte [ebp-4H], al                       ; 27EA _ 88. 45, FC
        mov     eax, dword [ebp+8H]                     ; 27ED _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 27F0 _ 0F B6. 40, 03
        test    al, al                                  ; 27F4 _ 84. C0
        jnz     ?_142                                   ; 27F6 _ 75, 17
        cmp     byte [ebp-4H], -6                       ; 27F8 _ 80. 7D, FC, FA
        jnz     ?_141                                   ; 27FC _ 75, 07
        mov     eax, dword [ebp+8H]                     ; 27FE _ 8B. 45, 08
        mov     byte [eax+3H], 1                        ; 2801 _ C6. 40, 03, 01
?_141:  mov     eax, 0                                  ; 2805 _ B8, 00000000
        jmp     ?_149                                   ; 280A _ E9, 0000010F

?_142:  mov     eax, dword [ebp+8H]                     ; 280F _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 2812 _ 0F B6. 40, 03
        cmp     al, 1                                   ; 2816 _ 3C, 01
        jnz     ?_144                                   ; 2818 _ 75, 28
        movzx   eax, byte [ebp-4H]                      ; 281A _ 0F B6. 45, FC
        and     eax, 0C8H                               ; 281E _ 25, 000000C8
        cmp     eax, 8                                  ; 2823 _ 83. F8, 08
        jnz     ?_143                                   ; 2826 _ 75, 10
        mov     eax, dword [ebp+8H]                     ; 2828 _ 8B. 45, 08
        movzx   edx, byte [ebp-4H]                      ; 282B _ 0F B6. 55, FC
        mov     byte [eax], dl                          ; 282F _ 88. 10
        mov     eax, dword [ebp+8H]                     ; 2831 _ 8B. 45, 08
        mov     byte [eax+3H], 2                        ; 2834 _ C6. 40, 03, 02
?_143:  mov     eax, 0                                  ; 2838 _ B8, 00000000
        jmp     ?_149                                   ; 283D _ E9, 000000DC

?_144:  mov     eax, dword [ebp+8H]                     ; 2842 _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 2845 _ 0F B6. 40, 03
        cmp     al, 2                                   ; 2849 _ 3C, 02
        jnz     ?_145                                   ; 284B _ 75, 1B
        mov     eax, dword [ebp+8H]                     ; 284D _ 8B. 45, 08
        movzx   edx, byte [ebp-4H]                      ; 2850 _ 0F B6. 55, FC
        mov     byte [eax+1H], dl                       ; 2854 _ 88. 50, 01
        mov     eax, dword [ebp+8H]                     ; 2857 _ 8B. 45, 08
        mov     byte [eax+3H], 3                        ; 285A _ C6. 40, 03, 03
        mov     eax, 0                                  ; 285E _ B8, 00000000
        jmp     ?_149                                   ; 2863 _ E9, 000000B6

?_145:  mov     eax, dword [ebp+8H]                     ; 2868 _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 286B _ 0F B6. 40, 03
        cmp     al, 3                                   ; 286F _ 3C, 03
        jne     ?_148                                   ; 2871 _ 0F 85, 000000A2
        mov     eax, dword [ebp+8H]                     ; 2877 _ 8B. 45, 08
        movzx   edx, byte [ebp-4H]                      ; 287A _ 0F B6. 55, FC
        mov     byte [eax+2H], dl                       ; 287E _ 88. 50, 02
        mov     eax, dword [ebp+8H]                     ; 2881 _ 8B. 45, 08
        mov     byte [eax+3H], 1                        ; 2884 _ C6. 40, 03, 01
        mov     eax, dword [ebp+8H]                     ; 2888 _ 8B. 45, 08
        movzx   eax, byte [eax]                         ; 288B _ 0F B6. 00
        movzx   eax, al                                 ; 288E _ 0F B6. C0
        and     eax, 07H                                ; 2891 _ 83. E0, 07
        mov     edx, eax                                ; 2894 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 2896 _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 2899 _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 289C _ 8B. 45, 08
        movzx   eax, byte [eax+1H]                      ; 289F _ 0F B6. 40, 01
        movzx   edx, al                                 ; 28A3 _ 0F B6. D0
        mov     eax, dword [ebp+8H]                     ; 28A6 _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 28A9 _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 28AC _ 8B. 45, 08
        movzx   eax, byte [eax+2H]                      ; 28AF _ 0F B6. 40, 02
        movzx   edx, al                                 ; 28B3 _ 0F B6. D0
        mov     eax, dword [ebp+8H]                     ; 28B6 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 28B9 _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 28BC _ 8B. 45, 08
        movzx   eax, byte [eax]                         ; 28BF _ 0F B6. 00
        movzx   eax, al                                 ; 28C2 _ 0F B6. C0
        and     eax, 10H                                ; 28C5 _ 83. E0, 10
        test    eax, eax                                ; 28C8 _ 85. C0
        jz      ?_146                                   ; 28CA _ 74, 13
        mov     eax, dword [ebp+8H]                     ; 28CC _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 28CF _ 8B. 40, 04
        or      eax, 0FFFFFF00H                         ; 28D2 _ 0D, FFFFFF00
        mov     edx, eax                                ; 28D7 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 28D9 _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 28DC _ 89. 50, 04
?_146:  mov     eax, dword [ebp+8H]                     ; 28DF _ 8B. 45, 08
        movzx   eax, byte [eax]                         ; 28E2 _ 0F B6. 00
        movzx   eax, al                                 ; 28E5 _ 0F B6. C0
        and     eax, 20H                                ; 28E8 _ 83. E0, 20
        test    eax, eax                                ; 28EB _ 85. C0
        jz      ?_147                                   ; 28ED _ 74, 13
        mov     eax, dword [ebp+8H]                     ; 28EF _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 28F2 _ 8B. 40, 08
        or      eax, 0FFFFFF00H                         ; 28F5 _ 0D, FFFFFF00
        mov     edx, eax                                ; 28FA _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 28FC _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 28FF _ 89. 50, 08
?_147:  mov     eax, dword [ebp+8H]                     ; 2902 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 2905 _ 8B. 40, 08
        neg     eax                                     ; 2908 _ F7. D8
        mov     edx, eax                                ; 290A _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 290C _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 290F _ 89. 50, 08
        mov     eax, 1                                  ; 2912 _ B8, 00000001
        jmp     ?_149                                   ; 2917 _ EB, 05

?_148:  mov     eax, 4294967295                         ; 2919 _ B8, FFFFFFFF
?_149:  leave                                           ; 291E _ C9
        ret                                             ; 291F _ C3
; mouse_decode End of function

showMemoryInfo:; Function begin
        push    ebp                                     ; 2920 _ 55
        mov     ebp, esp                                ; 2921 _ 89. E5
        sub     esp, 72                                 ; 2923 _ 83. EC, 48
        mov     dword [ebp-0CH], 0                      ; 2926 _ C7. 45, F4, 00000000
        mov     dword [ebp-10H], 0                      ; 292D _ C7. 45, F0, 00000000
        mov     dword [ebp-14H], 104                    ; 2934 _ C7. 45, EC, 00000068
        mov     dword [ebp-18H], 80                     ; 293B _ C7. 45, E8, 00000050
        mov     edx, dword [ysize]                      ; 2942 _ 8B. 15, 00000140(d)
        mov     eax, dword [ebp+0CH]                    ; 2948 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 294B _ 8B. 00
        mov     dword [esp+8H], edx                     ; 294D _ 89. 54 24, 08
        mov     edx, dword [ebp+1CH]                    ; 2951 _ 8B. 55, 1C
        mov     dword [esp+4H], edx                     ; 2954 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 2958 _ 89. 04 24
        call    init_screen8                            ; 295B _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+20H]                    ; 2960 _ 8B. 45, 20
        movsx   eax, al                                 ; 2963 _ 0F BE. C0
        mov     dword [esp+14H], ?_315                  ; 2966 _ C7. 44 24, 14, 0000004A(d)
        mov     dword [esp+10H], eax                    ; 296E _ 89. 44 24, 10
        mov     eax, dword [ebp-10H]                    ; 2972 _ 8B. 45, F0
        mov     dword [esp+0CH], eax                    ; 2975 _ 89. 44 24, 0C
        mov     eax, dword [ebp-0CH]                    ; 2979 _ 8B. 45, F4
        mov     dword [esp+8H], eax                     ; 297C _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 2980 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 2983 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2987 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 298A _ 89. 04 24
        call    showString                              ; 298D _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+18H]                    ; 2992 _ 8B. 45, 18
        mov     dword [esp], eax                        ; 2995 _ 89. 04 24
        call    intToHexStr                             ; 2998 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-1CH], eax                    ; 299D _ 89. 45, E4
        mov     eax, dword [ebp+20H]                    ; 29A0 _ 8B. 45, 20
        movsx   eax, al                                 ; 29A3 _ 0F BE. C0
        mov     edx, dword [ebp-1CH]                    ; 29A6 _ 8B. 55, E4
        mov     dword [esp+14H], edx                    ; 29A9 _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 29AD _ 89. 44 24, 10
        mov     eax, dword [ebp-10H]                    ; 29B1 _ 8B. 45, F0
        mov     dword [esp+0CH], eax                    ; 29B4 _ 89. 44 24, 0C
        mov     eax, dword [ebp-14H]                    ; 29B8 _ 8B. 45, EC
        mov     dword [esp+8H], eax                     ; 29BB _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 29BF _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 29C2 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 29C6 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 29C9 _ 89. 04 24
        call    showString                              ; 29CC _ E8, FFFFFFFC(rel)
        add     dword [ebp-10H], 16                     ; 29D1 _ 83. 45, F0, 10
        mov     eax, dword [ebp+20H]                    ; 29D5 _ 8B. 45, 20
        movsx   eax, al                                 ; 29D8 _ 0F BE. C0
        mov     dword [esp+14H], ?_316                  ; 29DB _ C7. 44 24, 14, 00000054(d)
        mov     dword [esp+10H], eax                    ; 29E3 _ 89. 44 24, 10
        mov     eax, dword [ebp-10H]                    ; 29E7 _ 8B. 45, F0
        mov     dword [esp+0CH], eax                    ; 29EA _ 89. 44 24, 0C
        mov     eax, dword [ebp-0CH]                    ; 29EE _ 8B. 45, F4
        mov     dword [esp+8H], eax                     ; 29F1 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 29F5 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 29F8 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 29FC _ 8B. 45, 08
        mov     dword [esp], eax                        ; 29FF _ 89. 04 24
        call    showString                              ; 2A02 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 2A07 _ 8B. 45, 10
        mov     eax, dword [eax]                        ; 2A0A _ 8B. 00
        mov     dword [esp], eax                        ; 2A0C _ 89. 04 24
        call    intToHexStr                             ; 2A0F _ E8, FFFFFFFC(rel)
        mov     dword [ebp-20H], eax                    ; 2A14 _ 89. 45, E0
        mov     eax, dword [ebp+20H]                    ; 2A17 _ 8B. 45, 20
        movsx   eax, al                                 ; 2A1A _ 0F BE. C0
        mov     edx, dword [ebp-20H]                    ; 2A1D _ 8B. 55, E0
        mov     dword [esp+14H], edx                    ; 2A20 _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 2A24 _ 89. 44 24, 10
        mov     eax, dword [ebp-10H]                    ; 2A28 _ 8B. 45, F0
        mov     dword [esp+0CH], eax                    ; 2A2B _ 89. 44 24, 0C
        mov     eax, dword [ebp-14H]                    ; 2A2F _ 8B. 45, EC
        mov     dword [esp+8H], eax                     ; 2A32 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 2A36 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 2A39 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2A3D _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2A40 _ 89. 04 24
        call    showString                              ; 2A43 _ E8, FFFFFFFC(rel)
        add     dword [ebp-10H], 16                     ; 2A48 _ 83. 45, F0, 10
        mov     eax, dword [ebp+20H]                    ; 2A4C _ 8B. 45, 20
        movsx   eax, al                                 ; 2A4F _ 0F BE. C0
        mov     dword [esp+14H], ?_317                  ; 2A52 _ C7. 44 24, 14, 00000060(d)
        mov     dword [esp+10H], eax                    ; 2A5A _ 89. 44 24, 10
        mov     eax, dword [ebp-10H]                    ; 2A5E _ 8B. 45, F0
        mov     dword [esp+0CH], eax                    ; 2A61 _ 89. 44 24, 0C
        mov     eax, dword [ebp-0CH]                    ; 2A65 _ 8B. 45, F4
        mov     dword [esp+8H], eax                     ; 2A68 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 2A6C _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 2A6F _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2A73 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2A76 _ 89. 04 24
        call    showString                              ; 2A79 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 2A7E _ 8B. 45, 10
        mov     eax, dword [eax+4H]                     ; 2A81 _ 8B. 40, 04
        mov     dword [esp], eax                        ; 2A84 _ 89. 04 24
        call    intToHexStr                             ; 2A87 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-24H], eax                    ; 2A8C _ 89. 45, DC
        mov     eax, dword [ebp+20H]                    ; 2A8F _ 8B. 45, 20
        movsx   eax, al                                 ; 2A92 _ 0F BE. C0
        mov     edx, dword [ebp-24H]                    ; 2A95 _ 8B. 55, DC
        mov     dword [esp+14H], edx                    ; 2A98 _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 2A9C _ 89. 44 24, 10
        mov     eax, dword [ebp-10H]                    ; 2AA0 _ 8B. 45, F0
        mov     dword [esp+0CH], eax                    ; 2AA3 _ 89. 44 24, 0C
        mov     eax, dword [ebp-14H]                    ; 2AA7 _ 8B. 45, EC
        mov     dword [esp+8H], eax                     ; 2AAA _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 2AAE _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 2AB1 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2AB5 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2AB8 _ 89. 04 24
        call    showString                              ; 2ABB _ E8, FFFFFFFC(rel)
        add     dword [ebp-10H], 16                     ; 2AC0 _ 83. 45, F0, 10
        mov     eax, dword [ebp+20H]                    ; 2AC4 _ 8B. 45, 20
        movsx   eax, al                                 ; 2AC7 _ 0F BE. C0
        mov     dword [esp+14H], ?_318                  ; 2ACA _ C7. 44 24, 14, 0000006C(d)
        mov     dword [esp+10H], eax                    ; 2AD2 _ 89. 44 24, 10
        mov     eax, dword [ebp-10H]                    ; 2AD6 _ 8B. 45, F0
        mov     dword [esp+0CH], eax                    ; 2AD9 _ 89. 44 24, 0C
        mov     eax, dword [ebp-0CH]                    ; 2ADD _ 8B. 45, F4
        mov     dword [esp+8H], eax                     ; 2AE0 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 2AE4 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 2AE7 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2AEB _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2AEE _ 89. 04 24
        call    showString                              ; 2AF1 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 2AF6 _ 8B. 45, 10
        mov     eax, dword [eax+8H]                     ; 2AF9 _ 8B. 40, 08
        mov     dword [esp], eax                        ; 2AFC _ 89. 04 24
        call    intToHexStr                             ; 2AFF _ E8, FFFFFFFC(rel)
        mov     dword [ebp-28H], eax                    ; 2B04 _ 89. 45, D8
        mov     eax, dword [ebp+20H]                    ; 2B07 _ 8B. 45, 20
        movsx   eax, al                                 ; 2B0A _ 0F BE. C0
        mov     edx, dword [ebp-28H]                    ; 2B0D _ 8B. 55, D8
        mov     dword [esp+14H], edx                    ; 2B10 _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 2B14 _ 89. 44 24, 10
        mov     eax, dword [ebp-10H]                    ; 2B18 _ 8B. 45, F0
        mov     dword [esp+0CH], eax                    ; 2B1B _ 89. 44 24, 0C
        mov     eax, dword [ebp-14H]                    ; 2B1F _ 8B. 45, EC
        mov     dword [esp+8H], eax                     ; 2B22 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 2B26 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 2B29 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2B2D _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2B30 _ 89. 04 24
        call    showString                              ; 2B33 _ E8, FFFFFFFC(rel)
        leave                                           ; 2B38 _ C9
        ret                                             ; 2B39 _ C3
; showMemoryInfo End of function

message_box:; Function begin
        push    ebp                                     ; 2B3A _ 55
        mov     ebp, esp                                ; 2B3B _ 89. E5
        sub     esp, 56                                 ; 2B3D _ 83. EC, 38
        mov     eax, dword [ebp+8H]                     ; 2B40 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2B43 _ 89. 04 24
        call    sheet_alloc                             ; 2B46 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 2B4B _ 89. 45, F4
        mov     eax, dword [memman]                     ; 2B4E _ A1, 00000000(d)
        mov     dword [esp+4H], 10880                   ; 2B53 _ C7. 44 24, 04, 00002A80
        mov     dword [esp], eax                        ; 2B5B _ 89. 04 24
        call    memman_alloc_4k                         ; 2B5E _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 2B63 _ 89. 45, F0
        mov     dword [esp+10H], -1                     ; 2B66 _ C7. 44 24, 10, FFFFFFFF
        mov     dword [esp+0CH], 68                     ; 2B6E _ C7. 44 24, 0C, 00000044
        mov     dword [esp+8H], 160                     ; 2B76 _ C7. 44 24, 08, 000000A0
        mov     eax, dword [ebp-10H]                    ; 2B7E _ 8B. 45, F0
        mov     dword [esp+4H], eax                     ; 2B81 _ 89. 44 24, 04
        mov     eax, dword [ebp-0CH]                    ; 2B85 _ 8B. 45, F4
        mov     dword [esp], eax                        ; 2B88 _ 89. 04 24
        call    sheet_setbuf                            ; 2B8B _ E8, FFFFFFFC(rel)
        mov     dword [esp+0CH], 1                      ; 2B90 _ C7. 44 24, 0C, 00000001
        mov     eax, dword [ebp+0CH]                    ; 2B98 _ 8B. 45, 0C
        mov     dword [esp+8H], eax                     ; 2B9B _ 89. 44 24, 08
        mov     eax, dword [ebp-0CH]                    ; 2B9F _ 8B. 45, F4
        mov     dword [esp+4H], eax                     ; 2BA2 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2BA6 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2BA9 _ 89. 04 24
        call    make_window8                            ; 2BAC _ E8, FFFFFFFC(rel)
        mov     dword [esp+14H], 7                      ; 2BB1 _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], 16                     ; 2BB9 _ C7. 44 24, 10, 00000010
        mov     dword [esp+0CH], 144                    ; 2BC1 _ C7. 44 24, 0C, 00000090
        mov     dword [esp+8H], 28                      ; 2BC9 _ C7. 44 24, 08, 0000001C
        mov     dword [esp+4H], 8                       ; 2BD1 _ C7. 44 24, 04, 00000008
        mov     eax, dword [ebp-0CH]                    ; 2BD9 _ 8B. 45, F4
        mov     dword [esp], eax                        ; 2BDC _ 89. 04 24
        call    make_textbox8                           ; 2BDF _ E8, FFFFFFFC(rel)
        mov     dword [esp+0CH], 172                    ; 2BE4 _ C7. 44 24, 0C, 000000AC
        mov     dword [esp+8H], 260                     ; 2BEC _ C7. 44 24, 08, 00000104
        mov     eax, dword [ebp-0CH]                    ; 2BF4 _ 8B. 45, F4
        mov     dword [esp+4H], eax                     ; 2BF7 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2BFB _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2BFE _ 89. 04 24
        call    sheet_slide                             ; 2C01 _ E8, FFFFFFFC(rel)
        mov     dword [esp+8H], 2                       ; 2C06 _ C7. 44 24, 08, 00000002
        mov     eax, dword [ebp-0CH]                    ; 2C0E _ 8B. 45, F4
        mov     dword [esp+4H], eax                     ; 2C11 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2C15 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2C18 _ 89. 04 24
        call    sheet_updown                            ; 2C1B _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 2C20 _ 8B. 45, F4
        leave                                           ; 2C23 _ C9
        ret                                             ; 2C24 _ C3
; message_box End of function

make_window8:; Function begin
        push    ebp                                     ; 2C25 _ 55
        mov     ebp, esp                                ; 2C26 _ 89. E5
        push    ebx                                     ; 2C28 _ 53
        sub     esp, 52                                 ; 2C29 _ 83. EC, 34
        mov     eax, dword [ebp+14H]                    ; 2C2C _ 8B. 45, 14
        mov     byte [ebp-1CH], al                      ; 2C2F _ 88. 45, E4
        mov     eax, dword [ebp+0CH]                    ; 2C32 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 2C35 _ 8B. 40, 04
        mov     dword [ebp-0CH], eax                    ; 2C38 _ 89. 45, F4
        mov     eax, dword [ebp+0CH]                    ; 2C3B _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 2C3E _ 8B. 40, 08
        mov     dword [ebp-10H], eax                    ; 2C41 _ 89. 45, F0
        mov     eax, dword [ebp-0CH]                    ; 2C44 _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 2C47 _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 2C4A _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 2C4D _ 8B. 00
        mov     dword [esp+18H], 0                      ; 2C4F _ C7. 44 24, 18, 00000000
        mov     dword [esp+14H], edx                    ; 2C57 _ 89. 54 24, 14
        mov     dword [esp+10H], 0                      ; 2C5B _ C7. 44 24, 10, 00000000
        mov     dword [esp+0CH], 0                      ; 2C63 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 8                       ; 2C6B _ C7. 44 24, 08, 00000008
        mov     edx, dword [ebp-0CH]                    ; 2C73 _ 8B. 55, F4
        mov     dword [esp+4H], edx                     ; 2C76 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 2C7A _ 89. 04 24
        call    boxfill8                                ; 2C7D _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 2C82 _ 8B. 45, F4
        lea     edx, [eax-2H]                           ; 2C85 _ 8D. 50, FE
        mov     eax, dword [ebp+0CH]                    ; 2C88 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 2C8B _ 8B. 00
        mov     dword [esp+18H], 1                      ; 2C8D _ C7. 44 24, 18, 00000001
        mov     dword [esp+14H], edx                    ; 2C95 _ 89. 54 24, 14
        mov     dword [esp+10H], 1                      ; 2C99 _ C7. 44 24, 10, 00000001
        mov     dword [esp+0CH], 1                      ; 2CA1 _ C7. 44 24, 0C, 00000001
        mov     dword [esp+8H], 7                       ; 2CA9 _ C7. 44 24, 08, 00000007
        mov     edx, dword [ebp-0CH]                    ; 2CB1 _ 8B. 55, F4
        mov     dword [esp+4H], edx                     ; 2CB4 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 2CB8 _ 89. 04 24
        call    boxfill8                                ; 2CBB _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 2CC0 _ 8B. 45, F0
        lea     edx, [eax-1H]                           ; 2CC3 _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 2CC6 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 2CC9 _ 8B. 00
        mov     dword [esp+18H], edx                    ; 2CCB _ 89. 54 24, 18
        mov     dword [esp+14H], 0                      ; 2CCF _ C7. 44 24, 14, 00000000
        mov     dword [esp+10H], 0                      ; 2CD7 _ C7. 44 24, 10, 00000000
        mov     dword [esp+0CH], 0                      ; 2CDF _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 8                       ; 2CE7 _ C7. 44 24, 08, 00000008
        mov     edx, dword [ebp-0CH]                    ; 2CEF _ 8B. 55, F4
        mov     dword [esp+4H], edx                     ; 2CF2 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 2CF6 _ 89. 04 24
        call    boxfill8                                ; 2CF9 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 2CFE _ 8B. 45, F0
        lea     edx, [eax-1H]                           ; 2D01 _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 2D04 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 2D07 _ 8B. 00
        mov     dword [esp+18H], edx                    ; 2D09 _ 89. 54 24, 18
        mov     dword [esp+14H], 1                      ; 2D0D _ C7. 44 24, 14, 00000001
        mov     dword [esp+10H], 1                      ; 2D15 _ C7. 44 24, 10, 00000001
        mov     dword [esp+0CH], 1                      ; 2D1D _ C7. 44 24, 0C, 00000001
        mov     dword [esp+8H], 7                       ; 2D25 _ C7. 44 24, 08, 00000007
        mov     edx, dword [ebp-0CH]                    ; 2D2D _ 8B. 55, F4
        mov     dword [esp+4H], edx                     ; 2D30 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 2D34 _ 89. 04 24
        call    boxfill8                                ; 2D37 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 2D3C _ 8B. 45, F0
        lea     ebx, [eax-2H]                           ; 2D3F _ 8D. 58, FE
        mov     eax, dword [ebp-0CH]                    ; 2D42 _ 8B. 45, F4
        lea     ecx, [eax-2H]                           ; 2D45 _ 8D. 48, FE
        mov     eax, dword [ebp-0CH]                    ; 2D48 _ 8B. 45, F4
        lea     edx, [eax-2H]                           ; 2D4B _ 8D. 50, FE
        mov     eax, dword [ebp+0CH]                    ; 2D4E _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 2D51 _ 8B. 00
        mov     dword [esp+18H], ebx                    ; 2D53 _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 2D57 _ 89. 4C 24, 14
        mov     dword [esp+10H], 1                      ; 2D5B _ C7. 44 24, 10, 00000001
        mov     dword [esp+0CH], edx                    ; 2D63 _ 89. 54 24, 0C
        mov     dword [esp+8H], 15                      ; 2D67 _ C7. 44 24, 08, 0000000F
        mov     edx, dword [ebp-0CH]                    ; 2D6F _ 8B. 55, F4
        mov     dword [esp+4H], edx                     ; 2D72 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 2D76 _ 89. 04 24
        call    boxfill8                                ; 2D79 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 2D7E _ 8B. 45, F0
        lea     ebx, [eax-1H]                           ; 2D81 _ 8D. 58, FF
        mov     eax, dword [ebp-0CH]                    ; 2D84 _ 8B. 45, F4
        lea     ecx, [eax-1H]                           ; 2D87 _ 8D. 48, FF
        mov     eax, dword [ebp-0CH]                    ; 2D8A _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 2D8D _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 2D90 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 2D93 _ 8B. 00
        mov     dword [esp+18H], ebx                    ; 2D95 _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 2D99 _ 89. 4C 24, 14
        mov     dword [esp+10H], 0                      ; 2D9D _ C7. 44 24, 10, 00000000
        mov     dword [esp+0CH], edx                    ; 2DA5 _ 89. 54 24, 0C
        mov     dword [esp+8H], 0                       ; 2DA9 _ C7. 44 24, 08, 00000000
        mov     edx, dword [ebp-0CH]                    ; 2DB1 _ 8B. 55, F4
        mov     dword [esp+4H], edx                     ; 2DB4 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 2DB8 _ 89. 04 24
        call    boxfill8                                ; 2DBB _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 2DC0 _ 8B. 45, F0
        lea     ecx, [eax-3H]                           ; 2DC3 _ 8D. 48, FD
        mov     eax, dword [ebp-0CH]                    ; 2DC6 _ 8B. 45, F4
        lea     edx, [eax-3H]                           ; 2DC9 _ 8D. 50, FD
        mov     eax, dword [ebp+0CH]                    ; 2DCC _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 2DCF _ 8B. 00
        mov     dword [esp+18H], ecx                    ; 2DD1 _ 89. 4C 24, 18
        mov     dword [esp+14H], edx                    ; 2DD5 _ 89. 54 24, 14
        mov     dword [esp+10H], 2                      ; 2DD9 _ C7. 44 24, 10, 00000002
        mov     dword [esp+0CH], 2                      ; 2DE1 _ C7. 44 24, 0C, 00000002
        mov     dword [esp+8H], 8                       ; 2DE9 _ C7. 44 24, 08, 00000008
        mov     edx, dword [ebp-0CH]                    ; 2DF1 _ 8B. 55, F4
        mov     dword [esp+4H], edx                     ; 2DF4 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 2DF8 _ 89. 04 24
        call    boxfill8                                ; 2DFB _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 2E00 _ 8B. 45, F4
        lea     edx, [eax-4H]                           ; 2E03 _ 8D. 50, FC
        mov     eax, dword [ebp+0CH]                    ; 2E06 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 2E09 _ 8B. 00
        mov     dword [esp+18H], 20                     ; 2E0B _ C7. 44 24, 18, 00000014
        mov     dword [esp+14H], edx                    ; 2E13 _ 89. 54 24, 14
        mov     dword [esp+10H], 3                      ; 2E17 _ C7. 44 24, 10, 00000003
        mov     dword [esp+0CH], 3                      ; 2E1F _ C7. 44 24, 0C, 00000003
        mov     dword [esp+8H], 12                      ; 2E27 _ C7. 44 24, 08, 0000000C
        mov     edx, dword [ebp-0CH]                    ; 2E2F _ 8B. 55, F4
        mov     dword [esp+4H], edx                     ; 2E32 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 2E36 _ 89. 04 24
        call    boxfill8                                ; 2E39 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 2E3E _ 8B. 45, F0
        lea     ebx, [eax-2H]                           ; 2E41 _ 8D. 58, FE
        mov     eax, dword [ebp-0CH]                    ; 2E44 _ 8B. 45, F4
        lea     ecx, [eax-2H]                           ; 2E47 _ 8D. 48, FE
        mov     eax, dword [ebp-10H]                    ; 2E4A _ 8B. 45, F0
        lea     edx, [eax-2H]                           ; 2E4D _ 8D. 50, FE
        mov     eax, dword [ebp+0CH]                    ; 2E50 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 2E53 _ 8B. 00
        mov     dword [esp+18H], ebx                    ; 2E55 _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 2E59 _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 2E5D _ 89. 54 24, 10
        mov     dword [esp+0CH], 1                      ; 2E61 _ C7. 44 24, 0C, 00000001
        mov     dword [esp+8H], 15                      ; 2E69 _ C7. 44 24, 08, 0000000F
        mov     edx, dword [ebp-0CH]                    ; 2E71 _ 8B. 55, F4
        mov     dword [esp+4H], edx                     ; 2E74 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 2E78 _ 89. 04 24
        call    boxfill8                                ; 2E7B _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 2E80 _ 8B. 45, F0
        lea     ebx, [eax-1H]                           ; 2E83 _ 8D. 58, FF
        mov     eax, dword [ebp-0CH]                    ; 2E86 _ 8B. 45, F4
        lea     ecx, [eax-1H]                           ; 2E89 _ 8D. 48, FF
        mov     eax, dword [ebp-10H]                    ; 2E8C _ 8B. 45, F0
        lea     edx, [eax-1H]                           ; 2E8F _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 2E92 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 2E95 _ 8B. 00
        mov     dword [esp+18H], ebx                    ; 2E97 _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 2E9B _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 2E9F _ 89. 54 24, 10
        mov     dword [esp+0CH], 0                      ; 2EA3 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 0                       ; 2EAB _ C7. 44 24, 08, 00000000
        mov     edx, dword [ebp-0CH]                    ; 2EB3 _ 8B. 55, F4
        mov     dword [esp+4H], edx                     ; 2EB6 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 2EBA _ 89. 04 24
        call    boxfill8                                ; 2EBD _ E8, FFFFFFFC(rel)
        movsx   eax, byte [ebp-1CH]                     ; 2EC2 _ 0F BE. 45, E4
        mov     dword [esp+0CH], eax                    ; 2EC6 _ 89. 44 24, 0C
        mov     eax, dword [ebp+10H]                    ; 2ECA _ 8B. 45, 10
        mov     dword [esp+8H], eax                     ; 2ECD _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 2ED1 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 2ED4 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2ED8 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2EDB _ 89. 04 24
        call    make_wtitle8                            ; 2EDE _ E8, FFFFFFFC(rel)
        nop                                             ; 2EE3 _ 90
        add     esp, 52                                 ; 2EE4 _ 83. C4, 34
        pop     ebx                                     ; 2EE7 _ 5B
        pop     ebp                                     ; 2EE8 _ 5D
        ret                                             ; 2EE9 _ C3
; make_window8 End of function

make_wtitle8:; Function begin
        push    ebp                                     ; 2EEA _ 55
        mov     ebp, esp                                ; 2EEB _ 89. E5
        push    ebx                                     ; 2EED _ 53
        sub     esp, 52                                 ; 2EEE _ 83. EC, 34
        mov     eax, dword [ebp+14H]                    ; 2EF1 _ 8B. 45, 14
        mov     byte [ebp-1CH], al                      ; 2EF4 _ 88. 45, E4
        cmp     byte [ebp-1CH], 0                       ; 2EF7 _ 80. 7D, E4, 00
        jz      ?_150                                   ; 2EFB _ 74, 0A
        mov     byte [ebp-12H], 7                       ; 2EFD _ C6. 45, EE, 07
        mov     byte [ebp-13H], 12                      ; 2F01 _ C6. 45, ED, 0C
        jmp     ?_151                                   ; 2F05 _ EB, 08

?_150:  mov     byte [ebp-12H], 8                       ; 2F07 _ C6. 45, EE, 08
        mov     byte [ebp-13H], 15                      ; 2F0B _ C6. 45, ED, 0F
?_151:  mov     eax, dword [ebp+0CH]                    ; 2F0F _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 2F12 _ 8B. 40, 04
        lea     ebx, [eax-4H]                           ; 2F15 _ 8D. 58, FC
        movzx   eax, byte [ebp-13H]                     ; 2F18 _ 0F B6. 45, ED
        movzx   ecx, al                                 ; 2F1C _ 0F B6. C8
        mov     eax, dword [ebp+0CH]                    ; 2F1F _ 8B. 45, 0C
        mov     edx, dword [eax+4H]                     ; 2F22 _ 8B. 50, 04
        mov     eax, dword [ebp+0CH]                    ; 2F25 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 2F28 _ 8B. 00
        mov     dword [esp+18H], 20                     ; 2F2A _ C7. 44 24, 18, 00000014
        mov     dword [esp+14H], ebx                    ; 2F32 _ 89. 5C 24, 14
        mov     dword [esp+10H], 3                      ; 2F36 _ C7. 44 24, 10, 00000003
        mov     dword [esp+0CH], 3                      ; 2F3E _ C7. 44 24, 0C, 00000003
        mov     dword [esp+8H], ecx                     ; 2F46 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 2F4A _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 2F4E _ 89. 04 24
        call    boxfill8                                ; 2F51 _ E8, FFFFFFFC(rel)
        movsx   eax, byte [ebp-12H]                     ; 2F56 _ 0F BE. 45, EE
        mov     edx, dword [ebp+10H]                    ; 2F5A _ 8B. 55, 10
        mov     dword [esp+14H], edx                    ; 2F5D _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 2F61 _ 89. 44 24, 10
        mov     dword [esp+0CH], 4                      ; 2F65 _ C7. 44 24, 0C, 00000004
        mov     dword [esp+8H], 24                      ; 2F6D _ C7. 44 24, 08, 00000018
        mov     eax, dword [ebp+0CH]                    ; 2F75 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 2F78 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2F7C _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2F7F _ 89. 04 24
        call    showString                              ; 2F82 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], 0                      ; 2F87 _ C7. 45, F0, 00000000
        jmp     ?_159                                   ; 2F8E _ E9, 00000083

?_152:  mov     dword [ebp-0CH], 0                      ; 2F93 _ C7. 45, F4, 00000000
        jmp     ?_158                                   ; 2F9A _ EB, 70

?_153:  mov     eax, dword [ebp-10H]                    ; 2F9C _ 8B. 45, F0
        shl     eax, 4                                  ; 2F9F _ C1. E0, 04
        mov     edx, eax                                ; 2FA2 _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 2FA4 _ 8B. 45, F4
        add     eax, edx                                ; 2FA7 _ 01. D0
        add     eax, closebtn.2172                      ; 2FA9 _ 05, 00000260(d)
        movzx   eax, byte [eax]                         ; 2FAE _ 0F B6. 00
        mov     byte [ebp-11H], al                      ; 2FB1 _ 88. 45, EF
        cmp     byte [ebp-11H], 64                      ; 2FB4 _ 80. 7D, EF, 40
        jnz     ?_154                                   ; 2FB8 _ 75, 06
        mov     byte [ebp-11H], 0                       ; 2FBA _ C6. 45, EF, 00
        jmp     ?_157                                   ; 2FBE _ EB, 1C

?_154:  cmp     byte [ebp-11H], 36                      ; 2FC0 _ 80. 7D, EF, 24
        jnz     ?_155                                   ; 2FC4 _ 75, 06
        mov     byte [ebp-11H], 15                      ; 2FC6 _ C6. 45, EF, 0F
        jmp     ?_157                                   ; 2FCA _ EB, 10

?_155:  cmp     byte [ebp-11H], 81                      ; 2FCC _ 80. 7D, EF, 51
        jnz     ?_156                                   ; 2FD0 _ 75, 06
        mov     byte [ebp-11H], 8                       ; 2FD2 _ C6. 45, EF, 08
        jmp     ?_157                                   ; 2FD6 _ EB, 04

?_156:  mov     byte [ebp-11H], 7                       ; 2FD8 _ C6. 45, EF, 07
?_157:  mov     eax, dword [ebp+0CH]                    ; 2FDC _ 8B. 45, 0C
        mov     edx, dword [eax]                        ; 2FDF _ 8B. 10
        mov     eax, dword [ebp-10H]                    ; 2FE1 _ 8B. 45, F0
        lea     ecx, [eax+5H]                           ; 2FE4 _ 8D. 48, 05
        mov     eax, dword [ebp+0CH]                    ; 2FE7 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 2FEA _ 8B. 40, 04
        imul    ecx, eax                                ; 2FED _ 0F AF. C8
        mov     eax, dword [ebp+0CH]                    ; 2FF0 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 2FF3 _ 8B. 40, 04
        lea     ebx, [eax-15H]                          ; 2FF6 _ 8D. 58, EB
        mov     eax, dword [ebp-0CH]                    ; 2FF9 _ 8B. 45, F4
        add     eax, ebx                                ; 2FFC _ 01. D8
        add     eax, ecx                                ; 2FFE _ 01. C8
        add     edx, eax                                ; 3000 _ 01. C2
        movzx   eax, byte [ebp-11H]                     ; 3002 _ 0F B6. 45, EF
        mov     byte [edx], al                          ; 3006 _ 88. 02
        add     dword [ebp-0CH], 1                      ; 3008 _ 83. 45, F4, 01
?_158:  cmp     dword [ebp-0CH], 15                     ; 300C _ 83. 7D, F4, 0F
        jle     ?_153                                   ; 3010 _ 7E, 8A
        add     dword [ebp-10H], 1                      ; 3012 _ 83. 45, F0, 01
?_159:  cmp     dword [ebp-10H], 13                     ; 3016 _ 83. 7D, F0, 0D
        jle     ?_152                                   ; 301A _ 0F 8E, FFFFFF73
        add     esp, 52                                 ; 3020 _ 83. C4, 34
        pop     ebx                                     ; 3023 _ 5B
        pop     ebp                                     ; 3024 _ 5D
        ret                                             ; 3025 _ C3
; make_wtitle8 End of function

make_textbox8:; Function begin
        push    ebp                                     ; 3026 _ 55
        mov     ebp, esp                                ; 3027 _ 89. E5
        push    edi                                     ; 3029 _ 57
        push    esi                                     ; 302A _ 56
        push    ebx                                     ; 302B _ 53
        sub     esp, 44                                 ; 302C _ 83. EC, 2C
        mov     eax, dword [ebp+14H]                    ; 302F _ 8B. 45, 14
        mov     edx, dword [ebp+0CH]                    ; 3032 _ 8B. 55, 0C
        add     eax, edx                                ; 3035 _ 01. D0
        mov     dword [ebp-10H], eax                    ; 3037 _ 89. 45, F0
        mov     eax, dword [ebp+18H]                    ; 303A _ 8B. 45, 18
        mov     edx, dword [ebp+10H]                    ; 303D _ 8B. 55, 10
        add     eax, edx                                ; 3040 _ 01. D0
        mov     dword [ebp-14H], eax                    ; 3042 _ 89. 45, EC
        mov     eax, dword [ebp+10H]                    ; 3045 _ 8B. 45, 10
        lea     edi, [eax-3H]                           ; 3048 _ 8D. 78, FD
        mov     eax, dword [ebp-10H]                    ; 304B _ 8B. 45, F0
        lea     esi, [eax+1H]                           ; 304E _ 8D. 70, 01
        mov     eax, dword [ebp+10H]                    ; 3051 _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 3054 _ 8D. 58, FD
        mov     eax, dword [ebp+0CH]                    ; 3057 _ 8B. 45, 0C
        lea     ecx, [eax-2H]                           ; 305A _ 8D. 48, FE
        mov     eax, dword [ebp+8H]                     ; 305D _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 3060 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 3063 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 3066 _ 8B. 00
        mov     dword [esp+18H], edi                    ; 3068 _ 89. 7C 24, 18
        mov     dword [esp+14H], esi                    ; 306C _ 89. 74 24, 14
        mov     dword [esp+10H], ebx                    ; 3070 _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 3074 _ 89. 4C 24, 0C
        mov     dword [esp+8H], 15                      ; 3078 _ C7. 44 24, 08, 0000000F
        mov     dword [esp+4H], edx                     ; 3080 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 3084 _ 89. 04 24
        call    boxfill8                                ; 3087 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-14H]                    ; 308C _ 8B. 45, EC
        lea     edi, [eax+1H]                           ; 308F _ 8D. 78, 01
        mov     eax, dword [ebp+0CH]                    ; 3092 _ 8B. 45, 0C
        lea     esi, [eax-3H]                           ; 3095 _ 8D. 70, FD
        mov     eax, dword [ebp+10H]                    ; 3098 _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 309B _ 8D. 58, FD
        mov     eax, dword [ebp+0CH]                    ; 309E _ 8B. 45, 0C
        lea     ecx, [eax-3H]                           ; 30A1 _ 8D. 48, FD
        mov     eax, dword [ebp+8H]                     ; 30A4 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 30A7 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 30AA _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 30AD _ 8B. 00
        mov     dword [esp+18H], edi                    ; 30AF _ 89. 7C 24, 18
        mov     dword [esp+14H], esi                    ; 30B3 _ 89. 74 24, 14
        mov     dword [esp+10H], ebx                    ; 30B7 _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 30BB _ 89. 4C 24, 0C
        mov     dword [esp+8H], 15                      ; 30BF _ C7. 44 24, 08, 0000000F
        mov     dword [esp+4H], edx                     ; 30C7 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 30CB _ 89. 04 24
        call    boxfill8                                ; 30CE _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-14H]                    ; 30D3 _ 8B. 45, EC
        lea     edi, [eax+2H]                           ; 30D6 _ 8D. 78, 02
        mov     eax, dword [ebp-10H]                    ; 30D9 _ 8B. 45, F0
        lea     esi, [eax+1H]                           ; 30DC _ 8D. 70, 01
        mov     eax, dword [ebp-14H]                    ; 30DF _ 8B. 45, EC
        lea     ebx, [eax+2H]                           ; 30E2 _ 8D. 58, 02
        mov     eax, dword [ebp+0CH]                    ; 30E5 _ 8B. 45, 0C
        lea     ecx, [eax-3H]                           ; 30E8 _ 8D. 48, FD
        mov     eax, dword [ebp+8H]                     ; 30EB _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 30EE _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 30F1 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 30F4 _ 8B. 00
        mov     dword [esp+18H], edi                    ; 30F6 _ 89. 7C 24, 18
        mov     dword [esp+14H], esi                    ; 30FA _ 89. 74 24, 14
        mov     dword [esp+10H], ebx                    ; 30FE _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 3102 _ 89. 4C 24, 0C
        mov     dword [esp+8H], 7                       ; 3106 _ C7. 44 24, 08, 00000007
        mov     dword [esp+4H], edx                     ; 310E _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 3112 _ 89. 04 24
        call    boxfill8                                ; 3115 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-14H]                    ; 311A _ 8B. 45, EC
        lea     edi, [eax+2H]                           ; 311D _ 8D. 78, 02
        mov     eax, dword [ebp-10H]                    ; 3120 _ 8B. 45, F0
        lea     esi, [eax+2H]                           ; 3123 _ 8D. 70, 02
        mov     eax, dword [ebp+10H]                    ; 3126 _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 3129 _ 8D. 58, FD
        mov     eax, dword [ebp-10H]                    ; 312C _ 8B. 45, F0
        lea     ecx, [eax+2H]                           ; 312F _ 8D. 48, 02
        mov     eax, dword [ebp+8H]                     ; 3132 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 3135 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 3138 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 313B _ 8B. 00
        mov     dword [esp+18H], edi                    ; 313D _ 89. 7C 24, 18
        mov     dword [esp+14H], esi                    ; 3141 _ 89. 74 24, 14
        mov     dword [esp+10H], ebx                    ; 3145 _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 3149 _ 89. 4C 24, 0C
        mov     dword [esp+8H], 7                       ; 314D _ C7. 44 24, 08, 00000007
        mov     dword [esp+4H], edx                     ; 3155 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 3159 _ 89. 04 24
        call    boxfill8                                ; 315C _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 3161 _ 8B. 45, 10
        lea     ecx, [eax-2H]                           ; 3164 _ 8D. 48, FE
        mov     eax, dword [ebp+10H]                    ; 3167 _ 8B. 45, 10
        lea     esi, [eax-2H]                           ; 316A _ 8D. 70, FE
        mov     eax, dword [ebp+0CH]                    ; 316D _ 8B. 45, 0C
        lea     ebx, [eax-1H]                           ; 3170 _ 8D. 58, FF
        mov     eax, dword [ebp+8H]                     ; 3173 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 3176 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 3179 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 317C _ 8B. 00
        mov     dword [esp+18H], ecx                    ; 317E _ 89. 4C 24, 18
        mov     ecx, dword [ebp-10H]                    ; 3182 _ 8B. 4D, F0
        mov     dword [esp+14H], ecx                    ; 3185 _ 89. 4C 24, 14
        mov     dword [esp+10H], esi                    ; 3189 _ 89. 74 24, 10
        mov     dword [esp+0CH], ebx                    ; 318D _ 89. 5C 24, 0C
        mov     dword [esp+8H], 0                       ; 3191 _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], edx                     ; 3199 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 319D _ 89. 04 24
        call    boxfill8                                ; 31A0 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+0CH]                    ; 31A5 _ 8B. 45, 0C
        lea     edi, [eax-2H]                           ; 31A8 _ 8D. 78, FE
        mov     eax, dword [ebp+10H]                    ; 31AB _ 8B. 45, 10
        lea     esi, [eax-2H]                           ; 31AE _ 8D. 70, FE
        mov     eax, dword [ebp+0CH]                    ; 31B1 _ 8B. 45, 0C
        lea     ebx, [eax-2H]                           ; 31B4 _ 8D. 58, FE
        mov     eax, dword [ebp+8H]                     ; 31B7 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 31BA _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 31BD _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 31C0 _ 8B. 00
        mov     ecx, dword [ebp-14H]                    ; 31C2 _ 8B. 4D, EC
        mov     dword [esp+18H], ecx                    ; 31C5 _ 89. 4C 24, 18
        mov     dword [esp+14H], edi                    ; 31C9 _ 89. 7C 24, 14
        mov     dword [esp+10H], esi                    ; 31CD _ 89. 74 24, 10
        mov     dword [esp+0CH], ebx                    ; 31D1 _ 89. 5C 24, 0C
        mov     dword [esp+8H], 0                       ; 31D5 _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], edx                     ; 31DD _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 31E1 _ 89. 04 24
        call    boxfill8                                ; 31E4 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-14H]                    ; 31E9 _ 8B. 45, EC
        lea     ecx, [eax+1H]                           ; 31EC _ 8D. 48, 01
        mov     eax, dword [ebp-14H]                    ; 31EF _ 8B. 45, EC
        lea     esi, [eax+1H]                           ; 31F2 _ 8D. 70, 01
        mov     eax, dword [ebp+0CH]                    ; 31F5 _ 8B. 45, 0C
        lea     ebx, [eax-2H]                           ; 31F8 _ 8D. 58, FE
        mov     eax, dword [ebp+8H]                     ; 31FB _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 31FE _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 3201 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 3204 _ 8B. 00
        mov     dword [esp+18H], ecx                    ; 3206 _ 89. 4C 24, 18
        mov     ecx, dword [ebp-10H]                    ; 320A _ 8B. 4D, F0
        mov     dword [esp+14H], ecx                    ; 320D _ 89. 4C 24, 14
        mov     dword [esp+10H], esi                    ; 3211 _ 89. 74 24, 10
        mov     dword [esp+0CH], ebx                    ; 3215 _ 89. 5C 24, 0C
        mov     dword [esp+8H], 8                       ; 3219 _ C7. 44 24, 08, 00000008
        mov     dword [esp+4H], edx                     ; 3221 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 3225 _ 89. 04 24
        call    boxfill8                                ; 3228 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-14H]                    ; 322D _ 8B. 45, EC
        lea     edi, [eax+1H]                           ; 3230 _ 8D. 78, 01
        mov     eax, dword [ebp-10H]                    ; 3233 _ 8B. 45, F0
        lea     esi, [eax+1H]                           ; 3236 _ 8D. 70, 01
        mov     eax, dword [ebp+10H]                    ; 3239 _ 8B. 45, 10
        lea     ebx, [eax-2H]                           ; 323C _ 8D. 58, FE
        mov     eax, dword [ebp-10H]                    ; 323F _ 8B. 45, F0
        lea     ecx, [eax+1H]                           ; 3242 _ 8D. 48, 01
        mov     eax, dword [ebp+8H]                     ; 3245 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 3248 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 324B _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 324E _ 8B. 00
        mov     dword [esp+18H], edi                    ; 3250 _ 89. 7C 24, 18
        mov     dword [esp+14H], esi                    ; 3254 _ 89. 74 24, 14
        mov     dword [esp+10H], ebx                    ; 3258 _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 325C _ 89. 4C 24, 0C
        mov     dword [esp+8H], 8                       ; 3260 _ C7. 44 24, 08, 00000008
        mov     dword [esp+4H], edx                     ; 3268 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 326C _ 89. 04 24
        call    boxfill8                                ; 326F _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 3274 _ 8B. 45, 10
        lea     edi, [eax-1H]                           ; 3277 _ 8D. 78, FF
        mov     eax, dword [ebp+0CH]                    ; 327A _ 8B. 45, 0C
        lea     esi, [eax-1H]                           ; 327D _ 8D. 70, FF
        mov     eax, dword [ebp+1CH]                    ; 3280 _ 8B. 45, 1C
        movzx   ecx, al                                 ; 3283 _ 0F B6. C8
        mov     eax, dword [ebp+8H]                     ; 3286 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 3289 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 328C _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 328F _ 8B. 00
        mov     ebx, dword [ebp-14H]                    ; 3291 _ 8B. 5D, EC
        mov     dword [esp+18H], ebx                    ; 3294 _ 89. 5C 24, 18
        mov     ebx, dword [ebp-10H]                    ; 3298 _ 8B. 5D, F0
        mov     dword [esp+14H], ebx                    ; 329B _ 89. 5C 24, 14
        mov     dword [esp+10H], edi                    ; 329F _ 89. 7C 24, 10
        mov     dword [esp+0CH], esi                    ; 32A3 _ 89. 74 24, 0C
        mov     dword [esp+8H], ecx                     ; 32A7 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 32AB _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 32AF _ 89. 04 24
        call    boxfill8                                ; 32B2 _ E8, FFFFFFFC(rel)
        add     esp, 44                                 ; 32B7 _ 83. C4, 2C
        pop     ebx                                     ; 32BA _ 5B
        pop     esi                                     ; 32BB _ 5E
        pop     edi                                     ; 32BC _ 5F
        pop     ebp                                     ; 32BD _ 5D
        ret                                             ; 32BE _ C3
; make_textbox8 End of function

file_loadfile:; Function begin
        push    ebp                                     ; 32BF _ 55
        mov     ebp, esp                                ; 32C0 _ 89. E5
        sub     esp, 56                                 ; 32C2 _ 83. EC, 38
        mov     dword [ebp-0CH], 78848                  ; 32C5 _ C7. 45, F4, 00013400
        mov     eax, dword [memman]                     ; 32CC _ A1, 00000000(d)
        mov     dword [esp+4H], 13                      ; 32D1 _ C7. 44 24, 04, 0000000D
        mov     dword [esp], eax                        ; 32D9 _ 89. 04 24
        call    memman_alloc                            ; 32DC _ E8, FFFFFFFC(rel)
        mov     dword [ebp-1CH], eax                    ; 32E1 _ 89. 45, E4
        mov     eax, dword [ebp-1CH]                    ; 32E4 _ 8B. 45, E4
        add     eax, 12                                 ; 32E7 _ 83. C0, 0C
        mov     byte [eax], 0                           ; 32EA _ C6. 00, 00
        jmp     ?_170                                   ; 32ED _ E9, 0000011E

?_160:  mov     dword [ebp-10H], 0                      ; 32F2 _ C7. 45, F0, 00000000
        jmp     ?_163                                   ; 32F9 _ EB, 2C

?_161:  mov     edx, dword [ebp-0CH]                    ; 32FB _ 8B. 55, F4
        mov     eax, dword [ebp-10H]                    ; 32FE _ 8B. 45, F0
        add     eax, edx                                ; 3301 _ 01. D0
        movzx   eax, byte [eax]                         ; 3303 _ 0F B6. 00
        test    al, al                                  ; 3306 _ 84. C0
        jz      ?_162                                   ; 3308 _ 74, 1B
        mov     edx, dword [ebp-10H]                    ; 330A _ 8B. 55, F0
        mov     eax, dword [ebp-1CH]                    ; 330D _ 8B. 45, E4
        add     edx, eax                                ; 3310 _ 01. C2
        mov     ecx, dword [ebp-0CH]                    ; 3312 _ 8B. 4D, F4
        mov     eax, dword [ebp-10H]                    ; 3315 _ 8B. 45, F0
        add     eax, ecx                                ; 3318 _ 01. C8
        movzx   eax, byte [eax]                         ; 331A _ 0F B6. 00
        mov     byte [edx], al                          ; 331D _ 88. 02
        add     dword [ebp-10H], 1                      ; 331F _ 83. 45, F0, 01
        jmp     ?_163                                   ; 3323 _ EB, 02

?_162:  jmp     ?_164                                   ; 3325 _ EB, 06

?_163:  cmp     dword [ebp-10H], 7                      ; 3327 _ 83. 7D, F0, 07
        jle     ?_161                                   ; 332B _ 7E, CE
?_164:  mov     dword [ebp-14H], 0                      ; 332D _ C7. 45, EC, 00000000
        mov     edx, dword [ebp-10H]                    ; 3334 _ 8B. 55, F0
        mov     eax, dword [ebp-1CH]                    ; 3337 _ 8B. 45, E4
        add     eax, edx                                ; 333A _ 01. D0
        mov     byte [eax], 46                          ; 333C _ C6. 00, 2E
        add     dword [ebp-10H], 1                      ; 333F _ 83. 45, F0, 01
        mov     dword [ebp-14H], 0                      ; 3343 _ C7. 45, EC, 00000000
        jmp     ?_166                                   ; 334A _ EB, 1E

?_165:  mov     edx, dword [ebp-10H]                    ; 334C _ 8B. 55, F0
        mov     eax, dword [ebp-1CH]                    ; 334F _ 8B. 45, E4
        add     edx, eax                                ; 3352 _ 01. C2
        mov     ecx, dword [ebp-0CH]                    ; 3354 _ 8B. 4D, F4
        mov     eax, dword [ebp-14H]                    ; 3357 _ 8B. 45, EC
        add     eax, ecx                                ; 335A _ 01. C8
        movzx   eax, byte [eax+8H]                      ; 335C _ 0F B6. 40, 08
        mov     byte [edx], al                          ; 3360 _ 88. 02
        add     dword [ebp-10H], 1                      ; 3362 _ 83. 45, F0, 01
        add     dword [ebp-14H], 1                      ; 3366 _ 83. 45, EC, 01
?_166:  cmp     dword [ebp-14H], 2                      ; 336A _ 83. 7D, EC, 02
        jle     ?_165                                   ; 336E _ 7E, DC
        mov     eax, dword [ebp-1CH]                    ; 3370 _ 8B. 45, E4
        mov     dword [esp+4H], eax                     ; 3373 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 3377 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 337A _ 89. 04 24
        call    strcmp                                  ; 337D _ E8, FFFFFFFC(rel)
        cmp     eax, 1                                  ; 3382 _ 83. F8, 01
        jne     ?_169                                   ; 3385 _ 0F 85, 00000081
        mov     eax, dword [ebp-0CH]                    ; 338B _ 8B. 45, F4
        mov     edx, dword [eax+1CH]                    ; 338E _ 8B. 50, 1C
        mov     eax, dword [memman]                     ; 3391 _ A1, 00000000(d)
        mov     dword [esp+4H], edx                     ; 3396 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 339A _ 89. 04 24
        call    memman_alloc_4k                         ; 339D _ E8, FFFFFFFC(rel)
        mov     edx, eax                                ; 33A2 _ 89. C2
        mov     eax, dword [ebp+0CH]                    ; 33A4 _ 8B. 45, 0C
        mov     dword [eax], edx                        ; 33A7 _ 89. 10
        mov     eax, dword [ebp-0CH]                    ; 33A9 _ 8B. 45, F4
        mov     eax, dword [eax+1CH]                    ; 33AC _ 8B. 40, 1C
        mov     edx, eax                                ; 33AF _ 89. C2
        mov     eax, dword [ebp+0CH]                    ; 33B1 _ 8B. 45, 0C
        mov     dword [eax+4H], edx                     ; 33B4 _ 89. 50, 04
        mov     dword [ebp-20H], 88064                  ; 33B7 _ C7. 45, E0, 00015800
        mov     eax, dword [ebp-0CH]                    ; 33BE _ 8B. 45, F4
        movzx   eax, word [eax+1AH]                     ; 33C1 _ 0F B7. 40, 1A
        movzx   eax, ax                                 ; 33C5 _ 0F B7. C0
        shl     eax, 9                                  ; 33C8 _ C1. E0, 09
        add     dword [ebp-20H], eax                    ; 33CB _ 01. 45, E0
        mov     eax, dword [ebp-0CH]                    ; 33CE _ 8B. 45, F4
        mov     eax, dword [eax+1CH]                    ; 33D1 _ 8B. 40, 1C
        mov     dword [ebp-24H], eax                    ; 33D4 _ 89. 45, DC
        mov     dword [ebp-18H], 0                      ; 33D7 _ C7. 45, E8, 00000000
        mov     dword [ebp-18H], 0                      ; 33DE _ C7. 45, E8, 00000000
        jmp     ?_168                                   ; 33E5 _ EB, 1B

?_167:  mov     eax, dword [ebp+0CH]                    ; 33E7 _ 8B. 45, 0C
        mov     edx, dword [eax]                        ; 33EA _ 8B. 10
        mov     eax, dword [ebp-18H]                    ; 33EC _ 8B. 45, E8
        add     edx, eax                                ; 33EF _ 01. C2
        mov     ecx, dword [ebp-18H]                    ; 33F1 _ 8B. 4D, E8
        mov     eax, dword [ebp-20H]                    ; 33F4 _ 8B. 45, E0
        add     eax, ecx                                ; 33F7 _ 01. C8
        movzx   eax, byte [eax]                         ; 33F9 _ 0F B6. 00
        mov     byte [edx], al                          ; 33FC _ 88. 02
        add     dword [ebp-18H], 1                      ; 33FE _ 83. 45, E8, 01
?_168:  mov     eax, dword [ebp-18H]                    ; 3402 _ 8B. 45, E8
        cmp     eax, dword [ebp-24H]                    ; 3405 _ 3B. 45, DC
        jl      ?_167                                   ; 3408 _ 7C, DD
        jmp     ?_171                                   ; 340A _ EB, 12

?_169:  add     dword [ebp-0CH], 32                     ; 340C _ 83. 45, F4, 20
?_170:  mov     eax, dword [ebp-0CH]                    ; 3410 _ 8B. 45, F4
        movzx   eax, byte [eax]                         ; 3413 _ 0F B6. 00
        test    al, al                                  ; 3416 _ 84. C0
        jne     ?_160                                   ; 3418 _ 0F 85, FFFFFED4
?_171:  mov     edx, dword [ebp-1CH]                    ; 341E _ 8B. 55, E4
        mov     eax, dword [memman]                     ; 3421 _ A1, 00000000(d)
        mov     dword [esp+8H], 13                      ; 3426 _ C7. 44 24, 08, 0000000D
        mov     dword [esp+4H], edx                     ; 342E _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 3432 _ 89. 04 24
        call    memman_free                             ; 3435 _ E8, FFFFFFFC(rel)
        leave                                           ; 343A _ C9
        ret                                             ; 343B _ C3
; file_loadfile End of function

intHandlerForStackOverFlow:; Function begin
        push    ebp                                     ; 343C _ 55
        mov     ebp, esp                                ; 343D _ 89. E5
        sub     esp, 40                                 ; 343F _ 83. EC, 28
        mov     dword [?_326], 8                        ; 3442 _ C7. 05, 0000000C(d), 00000008
        mov     dword [esp], ?_319                      ; 344C _ C7. 04 24, 00000078(d)
        call    cons_putstr                             ; 3453 _ E8, FFFFFFFC(rel)
        mov     dword [?_326], 8                        ; 3458 _ C7. 05, 0000000C(d), 00000008
        mov     eax, dword [?_327]                      ; 3462 _ A1, 00000010(d)
        add     eax, 16                                 ; 3467 _ 83. C0, 10
        mov     dword [?_327], eax                      ; 346A _ A3, 00000010(d)
        mov     dword [esp], ?_320                      ; 346F _ C7. 04 24, 0000007F(d)
        call    cons_putstr                             ; 3476 _ E8, FFFFFFFC(rel)
        mov     dword [?_326], 8                        ; 347B _ C7. 05, 0000000C(d), 00000008
        mov     eax, dword [?_327]                      ; 3485 _ A1, 00000010(d)
        add     eax, 16                                 ; 348A _ 83. C0, 10
        mov     dword [?_327], eax                      ; 348D _ A3, 00000010(d)
        mov     eax, dword [ebp+8H]                     ; 3492 _ 8B. 45, 08
        add     eax, 44                                 ; 3495 _ 83. C0, 2C
        mov     eax, dword [eax]                        ; 3498 _ 8B. 00
        mov     dword [esp], eax                        ; 349A _ 89. 04 24
        call    intToHexStr                             ; 349D _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 34A2 _ 89. 45, F4
        mov     dword [esp], ?_321                      ; 34A5 _ C7. 04 24, 0000008F(d)
        call    cons_putstr                             ; 34AC _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 34B1 _ 8B. 45, F4
        mov     dword [esp], eax                        ; 34B4 _ 89. 04 24
        call    cons_putstr                             ; 34B7 _ E8, FFFFFFFC(rel)
        mov     dword [?_326], 8                        ; 34BC _ C7. 05, 0000000C(d), 00000008
        mov     eax, dword [?_327]                      ; 34C6 _ A1, 00000010(d)
        add     eax, 16                                 ; 34CB _ 83. C0, 10
        mov     dword [?_327], eax                      ; 34CE _ A3, 00000010(d)
        call    task_now                                ; 34D3 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 34D8 _ 89. 45, F0
        mov     eax, dword [ebp-10H]                    ; 34DB _ 8B. 45, F0
        add     eax, 48                                 ; 34DE _ 83. C0, 30
        leave                                           ; 34E1 _ C9
        ret                                             ; 34E2 _ C3
; intHandlerForStackOverFlow End of function

intHandlerForException:; Function begin
        push    ebp                                     ; 34E3 _ 55
        mov     ebp, esp                                ; 34E4 _ 89. E5
        sub     esp, 40                                 ; 34E6 _ 83. EC, 28
        mov     dword [?_326], 8                        ; 34E9 _ C7. 05, 0000000C(d), 00000008
        mov     dword [esp], ?_322                      ; 34F3 _ C7. 04 24, 00000096(d)
        call    cons_putstr                             ; 34FA _ E8, FFFFFFFC(rel)
        mov     dword [?_326], 8                        ; 34FF _ C7. 05, 0000000C(d), 00000008
        mov     eax, dword [?_327]                      ; 3509 _ A1, 00000010(d)
        add     eax, 16                                 ; 350E _ 83. C0, 10
        mov     dword [?_327], eax                      ; 3511 _ A3, 00000010(d)
        mov     dword [esp], ?_323                      ; 3516 _ C7. 04 24, 0000009E(d)
        call    cons_putstr                             ; 351D _ E8, FFFFFFFC(rel)
        mov     eax, dword [?_327]                      ; 3522 _ A1, 00000010(d)
        add     eax, 16                                 ; 3527 _ 83. C0, 10
        mov     dword [?_327], eax                      ; 352A _ A3, 00000010(d)
        mov     dword [?_326], 8                        ; 352F _ C7. 05, 0000000C(d), 00000008
        call    task_now                                ; 3539 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 353E _ 89. 45, F4
        mov     eax, dword [ebp-0CH]                    ; 3541 _ 8B. 45, F4
        add     eax, 48                                 ; 3544 _ 83. C0, 30
        leave                                           ; 3547 _ C9
        ret                                             ; 3548 _ C3
; intHandlerForException End of function

memman_init:; Function begin
        push    ebp                                     ; 3549 _ 55
        mov     ebp, esp                                ; 354A _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 354C _ 8B. 45, 08
        mov     dword [eax], 0                          ; 354F _ C7. 00, 00000000
        mov     eax, dword [ebp+8H]                     ; 3555 _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 3558 _ C7. 40, 04, 00000000
        mov     eax, dword [ebp+8H]                     ; 355F _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 3562 _ C7. 40, 08, 00000000
        mov     eax, dword [ebp+8H]                     ; 3569 _ 8B. 45, 08
        mov     dword [eax+0CH], 0                      ; 356C _ C7. 40, 0C, 00000000
        pop     ebp                                     ; 3573 _ 5D
        ret                                             ; 3574 _ C3
; memman_init End of function

memman_total:; Function begin
        push    ebp                                     ; 3575 _ 55
        mov     ebp, esp                                ; 3576 _ 89. E5
        sub     esp, 16                                 ; 3578 _ 83. EC, 10
        mov     dword [ebp-4H], 0                       ; 357B _ C7. 45, FC, 00000000
        mov     dword [ebp-8H], 0                       ; 3582 _ C7. 45, F8, 00000000
        jmp     ?_173                                   ; 3589 _ EB, 14

?_172:  mov     eax, dword [ebp+8H]                     ; 358B _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 358E _ 8B. 55, F8
        add     edx, 2                                  ; 3591 _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 3594 _ 8B. 44 D0, 04
        add     dword [ebp-4H], eax                     ; 3598 _ 01. 45, FC
        add     dword [ebp-8H], 1                       ; 359B _ 83. 45, F8, 01
?_173:  mov     eax, dword [ebp+8H]                     ; 359F _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 35A2 _ 8B. 00
        cmp     eax, dword [ebp-8H]                     ; 35A4 _ 3B. 45, F8
        ja      ?_172                                   ; 35A7 _ 77, E2
        mov     eax, dword [ebp-4H]                     ; 35A9 _ 8B. 45, FC
        leave                                           ; 35AC _ C9
        ret                                             ; 35AD _ C3
; memman_total End of function

memman_alloc:; Function begin
        push    ebp                                     ; 35AE _ 55
        mov     ebp, esp                                ; 35AF _ 89. E5
        sub     esp, 16                                 ; 35B1 _ 83. EC, 10
        mov     dword [ebp-8H], 0                       ; 35B4 _ C7. 45, F8, 00000000
        jmp     ?_177                                   ; 35BB _ E9, 00000085

?_174:  mov     eax, dword [ebp+8H]                     ; 35C0 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 35C3 _ 8B. 55, F8
        add     edx, 2                                  ; 35C6 _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 35C9 _ 8B. 44 D0, 04
        cmp     eax, dword [ebp+0CH]                    ; 35CD _ 3B. 45, 0C
        jc      ?_176                                   ; 35D0 _ 72, 6F
        mov     eax, dword [ebp+8H]                     ; 35D2 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 35D5 _ 8B. 55, F8
        add     edx, 2                                  ; 35D8 _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 35DB _ 8B. 04 D0
        mov     dword [ebp-4H], eax                     ; 35DE _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 35E1 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 35E4 _ 8B. 55, F8
        add     edx, 2                                  ; 35E7 _ 83. C2, 02
        mov     edx, dword [eax+edx*8]                  ; 35EA _ 8B. 14 D0
        mov     eax, dword [ebp+0CH]                    ; 35ED _ 8B. 45, 0C
        lea     ecx, [edx+eax]                          ; 35F0 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 35F3 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 35F6 _ 8B. 55, F8
        add     edx, 2                                  ; 35F9 _ 83. C2, 02
        mov     dword [eax+edx*8], ecx                  ; 35FC _ 89. 0C D0
        mov     eax, dword [ebp+8H]                     ; 35FF _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 3602 _ 8B. 55, F8
        add     edx, 2                                  ; 3605 _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 3608 _ 8B. 44 D0, 04
        sub     eax, dword [ebp+0CH]                    ; 360C _ 2B. 45, 0C
        mov     edx, eax                                ; 360F _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 3611 _ 8B. 45, 08
        mov     ecx, dword [ebp-8H]                     ; 3614 _ 8B. 4D, F8
        add     ecx, 2                                  ; 3617 _ 83. C1, 02
        mov     dword [eax+ecx*8+4H], edx               ; 361A _ 89. 54 C8, 04
        mov     eax, dword [ebp+8H]                     ; 361E _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 3621 _ 8B. 55, F8
        add     edx, 2                                  ; 3624 _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 3627 _ 8B. 44 D0, 04
        test    eax, eax                                ; 362B _ 85. C0
        jnz     ?_175                                   ; 362D _ 75, 0D
        mov     eax, dword [ebp+8H]                     ; 362F _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 3632 _ 8B. 00
        lea     edx, [eax-1H]                           ; 3634 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 3637 _ 8B. 45, 08
        mov     dword [eax], edx                        ; 363A _ 89. 10
?_175:  mov     eax, dword [ebp-4H]                     ; 363C _ 8B. 45, FC
        jmp     ?_178                                   ; 363F _ EB, 17

?_176:  add     dword [ebp-8H], 1                       ; 3641 _ 83. 45, F8, 01
?_177:  mov     eax, dword [ebp+8H]                     ; 3645 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 3648 _ 8B. 00
        cmp     eax, dword [ebp-8H]                     ; 364A _ 3B. 45, F8
        ja      ?_174                                   ; 364D _ 0F 87, FFFFFF6D
        mov     eax, 0                                  ; 3653 _ B8, 00000000
?_178:  leave                                           ; 3658 _ C9
        ret                                             ; 3659 _ C3
; memman_alloc End of function

memman_free:; Function begin
        push    ebp                                     ; 365A _ 55
        mov     ebp, esp                                ; 365B _ 89. E5
        push    ebx                                     ; 365D _ 53
        sub     esp, 16                                 ; 365E _ 83. EC, 10
        mov     dword [ebp-0CH], 0                      ; 3661 _ C7. 45, F4, 00000000
        jmp     ?_181                                   ; 3668 _ EB, 17

?_179:  mov     eax, dword [ebp+8H]                     ; 366A _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 366D _ 8B. 55, F4
        add     edx, 2                                  ; 3670 _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 3673 _ 8B. 04 D0
        cmp     eax, dword [ebp+0CH]                    ; 3676 _ 3B. 45, 0C
        jbe     ?_180                                   ; 3679 _ 76, 02
        jmp     ?_182                                   ; 367B _ EB, 0E

?_180:  add     dword [ebp-0CH], 1                      ; 367D _ 83. 45, F4, 01
?_181:  mov     eax, dword [ebp+8H]                     ; 3681 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 3684 _ 8B. 00
        cmp     eax, dword [ebp-0CH]                    ; 3686 _ 3B. 45, F4
        jg      ?_179                                   ; 3689 _ 7F, DF
?_182:  cmp     dword [ebp-0CH], 0                      ; 368B _ 83. 7D, F4, 00
        jle     ?_184                                   ; 368F _ 0F 8E, 000000BA
        mov     eax, dword [ebp-0CH]                    ; 3695 _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 3698 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 369B _ 8B. 45, 08
        add     edx, 2                                  ; 369E _ 83. C2, 02
        mov     edx, dword [eax+edx*8]                  ; 36A1 _ 8B. 14 D0
        mov     eax, dword [ebp-0CH]                    ; 36A4 _ 8B. 45, F4
        lea     ecx, [eax-1H]                           ; 36A7 _ 8D. 48, FF
        mov     eax, dword [ebp+8H]                     ; 36AA _ 8B. 45, 08
        add     ecx, 2                                  ; 36AD _ 83. C1, 02
        mov     eax, dword [eax+ecx*8+4H]               ; 36B0 _ 8B. 44 C8, 04
        add     eax, edx                                ; 36B4 _ 01. D0
        cmp     eax, dword [ebp+0CH]                    ; 36B6 _ 3B. 45, 0C
        jne     ?_184                                   ; 36B9 _ 0F 85, 00000090
        mov     eax, dword [ebp-0CH]                    ; 36BF _ 8B. 45, F4
        lea     ebx, [eax-1H]                           ; 36C2 _ 8D. 58, FF
        mov     eax, dword [ebp-0CH]                    ; 36C5 _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 36C8 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 36CB _ 8B. 45, 08
        add     edx, 2                                  ; 36CE _ 83. C2, 02
        mov     edx, dword [eax+edx*8+4H]               ; 36D1 _ 8B. 54 D0, 04
        mov     eax, dword [ebp+10H]                    ; 36D5 _ 8B. 45, 10
        lea     ecx, [edx+eax]                          ; 36D8 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 36DB _ 8B. 45, 08
        lea     edx, [ebx+2H]                           ; 36DE _ 8D. 53, 02
        mov     dword [eax+edx*8+4H], ecx               ; 36E1 _ 89. 4C D0, 04
        mov     eax, dword [ebp+8H]                     ; 36E5 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 36E8 _ 8B. 00
        cmp     eax, dword [ebp-0CH]                    ; 36EA _ 3B. 45, F4
        jle     ?_183                                   ; 36ED _ 7E, 56
        mov     eax, dword [ebp+10H]                    ; 36EF _ 8B. 45, 10
        mov     edx, dword [ebp+0CH]                    ; 36F2 _ 8B. 55, 0C
        lea     ecx, [edx+eax]                          ; 36F5 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 36F8 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 36FB _ 8B. 55, F4
        add     edx, 2                                  ; 36FE _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 3701 _ 8B. 04 D0
        cmp     ecx, eax                                ; 3704 _ 39. C1
        jnz     ?_183                                   ; 3706 _ 75, 3D
        mov     eax, dword [ebp-0CH]                    ; 3708 _ 8B. 45, F4
        lea     ebx, [eax-1H]                           ; 370B _ 8D. 58, FF
        mov     eax, dword [ebp-0CH]                    ; 370E _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 3711 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 3714 _ 8B. 45, 08
        add     edx, 2                                  ; 3717 _ 83. C2, 02
        mov     edx, dword [eax+edx*8+4H]               ; 371A _ 8B. 54 D0, 04
        mov     eax, dword [ebp+8H]                     ; 371E _ 8B. 45, 08
        mov     ecx, dword [ebp-0CH]                    ; 3721 _ 8B. 4D, F4
        add     ecx, 2                                  ; 3724 _ 83. C1, 02
        mov     eax, dword [eax+ecx*8+4H]               ; 3727 _ 8B. 44 C8, 04
        lea     ecx, [edx+eax]                          ; 372B _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 372E _ 8B. 45, 08
        lea     edx, [ebx+2H]                           ; 3731 _ 8D. 53, 02
        mov     dword [eax+edx*8+4H], ecx               ; 3734 _ 89. 4C D0, 04
        mov     eax, dword [ebp+8H]                     ; 3738 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 373B _ 8B. 00
        lea     edx, [eax-1H]                           ; 373D _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 3740 _ 8B. 45, 08
        mov     dword [eax], edx                        ; 3743 _ 89. 10
?_183:  mov     eax, 0                                  ; 3745 _ B8, 00000000
        jmp     ?_190                                   ; 374A _ E9, 0000011C

?_184:  mov     eax, dword [ebp+8H]                     ; 374F _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 3752 _ 8B. 00
        cmp     eax, dword [ebp-0CH]                    ; 3754 _ 3B. 45, F4
        jle     ?_185                                   ; 3757 _ 7E, 52
        mov     eax, dword [ebp+10H]                    ; 3759 _ 8B. 45, 10
        mov     edx, dword [ebp+0CH]                    ; 375C _ 8B. 55, 0C
        lea     ecx, [edx+eax]                          ; 375F _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 3762 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 3765 _ 8B. 55, F4
        add     edx, 2                                  ; 3768 _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 376B _ 8B. 04 D0
        cmp     ecx, eax                                ; 376E _ 39. C1
        jnz     ?_185                                   ; 3770 _ 75, 39
        mov     eax, dword [ebp+8H]                     ; 3772 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 3775 _ 8B. 55, F4
        lea     ecx, [edx+2H]                           ; 3778 _ 8D. 4A, 02
        mov     edx, dword [ebp+0CH]                    ; 377B _ 8B. 55, 0C
        mov     dword [eax+ecx*8], edx                  ; 377E _ 89. 14 C8
        mov     eax, dword [ebp+8H]                     ; 3781 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 3784 _ 8B. 55, F4
        add     edx, 2                                  ; 3787 _ 83. C2, 02
        mov     edx, dword [eax+edx*8+4H]               ; 378A _ 8B. 54 D0, 04
        mov     eax, dword [ebp+10H]                    ; 378E _ 8B. 45, 10
        lea     ecx, [edx+eax]                          ; 3791 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 3794 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 3797 _ 8B. 55, F4
        add     edx, 2                                  ; 379A _ 83. C2, 02
        mov     dword [eax+edx*8+4H], ecx               ; 379D _ 89. 4C D0, 04
        mov     eax, 0                                  ; 37A1 _ B8, 00000000
        jmp     ?_190                                   ; 37A6 _ E9, 000000C0

?_185:  mov     eax, dword [ebp+8H]                     ; 37AB _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 37AE _ 8B. 00
        cmp     eax, 4095                               ; 37B0 _ 3D, 00000FFF
        jg      ?_189                                   ; 37B5 _ 0F 8F, 00000087
        mov     eax, dword [ebp+8H]                     ; 37BB _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 37BE _ 8B. 00
        mov     dword [ebp-8H], eax                     ; 37C0 _ 89. 45, F8
        jmp     ?_187                                   ; 37C3 _ EB, 28

?_186:  mov     eax, dword [ebp-8H]                     ; 37C5 _ 8B. 45, F8
        lea     edx, [eax-1H]                           ; 37C8 _ 8D. 50, FF
        mov     ecx, dword [ebp+8H]                     ; 37CB _ 8B. 4D, 08
        mov     eax, dword [ebp-8H]                     ; 37CE _ 8B. 45, F8
        lea     ebx, [eax+2H]                           ; 37D1 _ 8D. 58, 02
        mov     eax, dword [ebp+8H]                     ; 37D4 _ 8B. 45, 08
        add     edx, 2                                  ; 37D7 _ 83. C2, 02
        lea     edx, [eax+edx*8]                        ; 37DA _ 8D. 14 D0
        mov     eax, dword [edx]                        ; 37DD _ 8B. 02
        mov     edx, dword [edx+4H]                     ; 37DF _ 8B. 52, 04
        mov     dword [ecx+ebx*8], eax                  ; 37E2 _ 89. 04 D9
        mov     dword [ecx+ebx*8+4H], edx               ; 37E5 _ 89. 54 D9, 04
        sub     dword [ebp-8H], 1                       ; 37E9 _ 83. 6D, F8, 01
?_187:  mov     eax, dword [ebp-8H]                     ; 37ED _ 8B. 45, F8
        cmp     eax, dword [ebp-0CH]                    ; 37F0 _ 3B. 45, F4
        jg      ?_186                                   ; 37F3 _ 7F, D0
        mov     eax, dword [ebp+8H]                     ; 37F5 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 37F8 _ 8B. 00
        lea     edx, [eax+1H]                           ; 37FA _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 37FD _ 8B. 45, 08
        mov     dword [eax], edx                        ; 3800 _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 3802 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 3805 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 3808 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 380B _ 8B. 00
        cmp     edx, eax                                ; 380D _ 39. C2
        jge     ?_188                                   ; 380F _ 7D, 0B
        mov     eax, dword [ebp+8H]                     ; 3811 _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 3814 _ 8B. 10
        mov     eax, dword [ebp+8H]                     ; 3816 _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 3819 _ 89. 50, 04
?_188:  mov     eax, dword [ebp+8H]                     ; 381C _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 381F _ 8B. 55, F4
        lea     ecx, [edx+2H]                           ; 3822 _ 8D. 4A, 02
        mov     edx, dword [ebp+0CH]                    ; 3825 _ 8B. 55, 0C
        mov     dword [eax+ecx*8], edx                  ; 3828 _ 89. 14 C8
        mov     eax, dword [ebp+8H]                     ; 382B _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 382E _ 8B. 55, F4
        lea     ecx, [edx+2H]                           ; 3831 _ 8D. 4A, 02
        mov     edx, dword [ebp+10H]                    ; 3834 _ 8B. 55, 10
        mov     dword [eax+ecx*8+4H], edx               ; 3837 _ 89. 54 C8, 04
        mov     eax, 0                                  ; 383B _ B8, 00000000
        jmp     ?_190                                   ; 3840 _ EB, 29

?_189:  mov     eax, dword [ebp+8H]                     ; 3842 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 3845 _ 8B. 40, 0C
        lea     edx, [eax+1H]                           ; 3848 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 384B _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 384E _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 3851 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 3854 _ 8B. 40, 08
        mov     edx, eax                                ; 3857 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 3859 _ 8B. 45, 10
        add     eax, edx                                ; 385C _ 01. D0
        mov     edx, eax                                ; 385E _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 3860 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 3863 _ 89. 50, 08
        mov     eax, 4294967295                         ; 3866 _ B8, FFFFFFFF
?_190:  add     esp, 16                                 ; 386B _ 83. C4, 10
        pop     ebx                                     ; 386E _ 5B
        pop     ebp                                     ; 386F _ 5D
        ret                                             ; 3870 _ C3
; memman_free End of function

memman_alloc_4k:; Function begin
        push    ebp                                     ; 3871 _ 55
        mov     ebp, esp                                ; 3872 _ 89. E5
        sub     esp, 24                                 ; 3874 _ 83. EC, 18
        mov     eax, dword [ebp+0CH]                    ; 3877 _ 8B. 45, 0C
        add     eax, 4095                               ; 387A _ 05, 00000FFF
        and     eax, 0FFFFF000H                         ; 387F _ 25, FFFFF000
        mov     dword [ebp+0CH], eax                    ; 3884 _ 89. 45, 0C
        mov     eax, dword [ebp+0CH]                    ; 3887 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 388A _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 388E _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3891 _ 89. 04 24
        call    memman_alloc                            ; 3894 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-4H], eax                     ; 3899 _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 389C _ 8B. 45, FC
        leave                                           ; 389F _ C9
        ret                                             ; 38A0 _ C3
; memman_alloc_4k End of function

memman_free_4k:; Function begin
        push    ebp                                     ; 38A1 _ 55
        mov     ebp, esp                                ; 38A2 _ 89. E5
        sub     esp, 28                                 ; 38A4 _ 83. EC, 1C
        mov     eax, dword [ebp+10H]                    ; 38A7 _ 8B. 45, 10
        add     eax, 4095                               ; 38AA _ 05, 00000FFF
        and     eax, 0FFFFF000H                         ; 38AF _ 25, FFFFF000
        mov     dword [ebp+10H], eax                    ; 38B4 _ 89. 45, 10
        mov     eax, dword [ebp+10H]                    ; 38B7 _ 8B. 45, 10
        mov     dword [esp+8H], eax                     ; 38BA _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 38BE _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 38C1 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 38C5 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 38C8 _ 89. 04 24
        call    memman_free                             ; 38CB _ E8, FFFFFFFC(rel)
        mov     dword [ebp-4H], eax                     ; 38D0 _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 38D3 _ 8B. 45, FC
        leave                                           ; 38D6 _ C9
        ret                                             ; 38D7 _ C3
; memman_free_4k End of function

shtctl_init:; Function begin
        push    ebp                                     ; 38D8 _ 55
        mov     ebp, esp                                ; 38D9 _ 89. E5
        sub     esp, 40                                 ; 38DB _ 83. EC, 28
        mov     dword [esp+4H], 9232                    ; 38DE _ C7. 44 24, 04, 00002410
        mov     eax, dword [ebp+8H]                     ; 38E6 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 38E9 _ 89. 04 24
        call    memman_alloc_4k                         ; 38EC _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 38F1 _ 89. 45, F4
        cmp     dword [ebp-0CH], 0                      ; 38F4 _ 83. 7D, F4, 00
        jnz     ?_191                                   ; 38F8 _ 75, 0A
        mov     eax, 0                                  ; 38FA _ B8, 00000000
        jmp     ?_195                                   ; 38FF _ E9, 0000009D

?_191:  mov     eax, dword [ebp+10H]                    ; 3904 _ 8B. 45, 10
        imul    eax, dword [ebp+14H]                    ; 3907 _ 0F AF. 45, 14
        mov     dword [esp+4H], eax                     ; 390B _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 390F _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3912 _ 89. 04 24
        call    memman_alloc_4k                         ; 3915 _ E8, FFFFFFFC(rel)
        mov     edx, eax                                ; 391A _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 391C _ 8B. 45, F4
        mov     dword [eax+4H], edx                     ; 391F _ 89. 50, 04
        mov     eax, dword [ebp-0CH]                    ; 3922 _ 8B. 45, F4
        mov     eax, dword [eax+4H]                     ; 3925 _ 8B. 40, 04
        test    eax, eax                                ; 3928 _ 85. C0
        jnz     ?_192                                   ; 392A _ 75, 21
        mov     eax, dword [ebp-0CH]                    ; 392C _ 8B. 45, F4
        mov     dword [esp+8H], 9232                    ; 392F _ C7. 44 24, 08, 00002410
        mov     dword [esp+4H], eax                     ; 3937 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 393B _ 8B. 45, 08
        mov     dword [esp], eax                        ; 393E _ 89. 04 24
        call    memman_free_4k                          ; 3941 _ E8, FFFFFFFC(rel)
        mov     eax, 0                                  ; 3946 _ B8, 00000000
        jmp     ?_195                                   ; 394B _ EB, 54

?_192:  mov     eax, dword [ebp-0CH]                    ; 394D _ 8B. 45, F4
        mov     edx, dword [ebp+0CH]                    ; 3950 _ 8B. 55, 0C
        mov     dword [eax], edx                        ; 3953 _ 89. 10
        mov     eax, dword [ebp-0CH]                    ; 3955 _ 8B. 45, F4
        mov     edx, dword [ebp+10H]                    ; 3958 _ 8B. 55, 10
        mov     dword [eax+8H], edx                     ; 395B _ 89. 50, 08
        mov     eax, dword [ebp-0CH]                    ; 395E _ 8B. 45, F4
        mov     edx, dword [ebp+14H]                    ; 3961 _ 8B. 55, 14
        mov     dword [eax+0CH], edx                    ; 3964 _ 89. 50, 0C
        mov     eax, dword [ebp-0CH]                    ; 3967 _ 8B. 45, F4
        mov     dword [eax+10H], -1                     ; 396A _ C7. 40, 10, FFFFFFFF
        mov     dword [ebp-10H], 0                      ; 3971 _ C7. 45, F0, 00000000
        jmp     ?_194                                   ; 3978 _ EB, 1B

?_193:  mov     eax, dword [ebp-0CH]                    ; 397A _ 8B. 45, F4
        mov     edx, dword [ebp-10H]                    ; 397D _ 8B. 55, F0
        add     edx, 33                                 ; 3980 _ 83. C2, 21
        shl     edx, 5                                  ; 3983 _ C1. E2, 05
        add     eax, edx                                ; 3986 _ 01. D0
        add     eax, 16                                 ; 3988 _ 83. C0, 10
        mov     dword [eax], 0                          ; 398B _ C7. 00, 00000000
        add     dword [ebp-10H], 1                      ; 3991 _ 83. 45, F0, 01
?_194:  cmp     dword [ebp-10H], 255                    ; 3995 _ 81. 7D, F0, 000000FF
        jle     ?_193                                   ; 399C _ 7E, DC
        mov     eax, dword [ebp-0CH]                    ; 399E _ 8B. 45, F4
?_195:  leave                                           ; 39A1 _ C9
        ret                                             ; 39A2 _ C3
; shtctl_init End of function

sheet_alloc:; Function begin
        push    ebp                                     ; 39A3 _ 55
        mov     ebp, esp                                ; 39A4 _ 89. E5
        sub     esp, 16                                 ; 39A6 _ 83. EC, 10
        mov     dword [ebp-8H], 0                       ; 39A9 _ C7. 45, F8, 00000000
        jmp     ?_198                                   ; 39B0 _ EB, 5B

?_196:  mov     eax, dword [ebp+8H]                     ; 39B2 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 39B5 _ 8B. 55, F8
        add     edx, 33                                 ; 39B8 _ 83. C2, 21
        shl     edx, 5                                  ; 39BB _ C1. E2, 05
        add     eax, edx                                ; 39BE _ 01. D0
        add     eax, 16                                 ; 39C0 _ 83. C0, 10
        mov     eax, dword [eax]                        ; 39C3 _ 8B. 00
        test    eax, eax                                ; 39C5 _ 85. C0
        jnz     ?_197                                   ; 39C7 _ 75, 40
        mov     eax, dword [ebp-8H]                     ; 39C9 _ 8B. 45, F8
        shl     eax, 5                                  ; 39CC _ C1. E0, 05
        lea     edx, [eax+410H]                         ; 39CF _ 8D. 90, 00000410
        mov     eax, dword [ebp+8H]                     ; 39D5 _ 8B. 45, 08
        add     eax, edx                                ; 39D8 _ 01. D0
        add     eax, 4                                  ; 39DA _ 83. C0, 04
        mov     dword [ebp-4H], eax                     ; 39DD _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 39E0 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 39E3 _ 8B. 55, F8
        lea     ecx, [edx+4H]                           ; 39E6 _ 8D. 4A, 04
        mov     edx, dword [ebp-4H]                     ; 39E9 _ 8B. 55, FC
        mov     dword [eax+ecx*4+4H], edx               ; 39EC _ 89. 54 88, 04
        mov     eax, dword [ebp-4H]                     ; 39F0 _ 8B. 45, FC
        mov     dword [eax+1CH], 1                      ; 39F3 _ C7. 40, 1C, 00000001
        mov     eax, dword [ebp-4H]                     ; 39FA _ 8B. 45, FC
        mov     dword [eax+18H], -1                     ; 39FD _ C7. 40, 18, FFFFFFFF
        mov     eax, dword [ebp-4H]                     ; 3A04 _ 8B. 45, FC
        jmp     ?_199                                   ; 3A07 _ EB, 12

?_197:  add     dword [ebp-8H], 1                       ; 3A09 _ 83. 45, F8, 01
?_198:  cmp     dword [ebp-8H], 255                     ; 3A0D _ 81. 7D, F8, 000000FF
        jle     ?_196                                   ; 3A14 _ 7E, 9C
        mov     eax, 0                                  ; 3A16 _ B8, 00000000
?_199:  leave                                           ; 3A1B _ C9
        ret                                             ; 3A1C _ C3
; sheet_alloc End of function

sheet_setbuf:; Function begin
        push    ebp                                     ; 3A1D _ 55
        mov     ebp, esp                                ; 3A1E _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 3A20 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 3A23 _ 8B. 55, 0C
        mov     dword [eax], edx                        ; 3A26 _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 3A28 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 3A2B _ 8B. 55, 10
        mov     dword [eax+4H], edx                     ; 3A2E _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 3A31 _ 8B. 45, 08
        mov     edx, dword [ebp+14H]                    ; 3A34 _ 8B. 55, 14
        mov     dword [eax+8H], edx                     ; 3A37 _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 3A3A _ 8B. 45, 08
        mov     edx, dword [ebp+18H]                    ; 3A3D _ 8B. 55, 18
        mov     dword [eax+14H], edx                    ; 3A40 _ 89. 50, 14
        nop                                             ; 3A43 _ 90
        pop     ebp                                     ; 3A44 _ 5D
        ret                                             ; 3A45 _ C3
; sheet_setbuf End of function

sheet_updown:; Function begin
        push    ebp                                     ; 3A46 _ 55
        mov     ebp, esp                                ; 3A47 _ 89. E5
        push    edi                                     ; 3A49 _ 57
        push    esi                                     ; 3A4A _ 56
        push    ebx                                     ; 3A4B _ 53
        sub     esp, 60                                 ; 3A4C _ 83. EC, 3C
        mov     eax, dword [ebp+0CH]                    ; 3A4F _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 3A52 _ 8B. 40, 18
        mov     dword [ebp-1CH], eax                    ; 3A55 _ 89. 45, E4
        mov     eax, dword [ebp+8H]                     ; 3A58 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 3A5B _ 8B. 40, 10
        add     eax, 1                                  ; 3A5E _ 83. C0, 01
        cmp     eax, dword [ebp+10H]                    ; 3A61 _ 3B. 45, 10
        jge     ?_200                                   ; 3A64 _ 7D, 0C
        mov     eax, dword [ebp+8H]                     ; 3A66 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 3A69 _ 8B. 40, 10
        add     eax, 1                                  ; 3A6C _ 83. C0, 01
        mov     dword [ebp+10H], eax                    ; 3A6F _ 89. 45, 10
?_200:  cmp     dword [ebp+10H], -1                     ; 3A72 _ 83. 7D, 10, FF
        jge     ?_201                                   ; 3A76 _ 7D, 07
        mov     dword [ebp+10H], -1                     ; 3A78 _ C7. 45, 10, FFFFFFFF
?_201:  mov     eax, dword [ebp+0CH]                    ; 3A7F _ 8B. 45, 0C
        mov     edx, dword [ebp+10H]                    ; 3A82 _ 8B. 55, 10
        mov     dword [eax+18H], edx                    ; 3A85 _ 89. 50, 18
        mov     eax, dword [ebp-1CH]                    ; 3A88 _ 8B. 45, E4
        cmp     eax, dword [ebp+10H]                    ; 3A8B _ 3B. 45, 10
        jle     ?_208                                   ; 3A8E _ 0F 8E, 00000212
        cmp     dword [ebp+10H], 0                      ; 3A94 _ 83. 7D, 10, 00
        js      ?_204                                   ; 3A98 _ 0F 88, 000000FE
        mov     eax, dword [ebp-1CH]                    ; 3A9E _ 8B. 45, E4
        mov     dword [ebp-20H], eax                    ; 3AA1 _ 89. 45, E0
        jmp     ?_203                                   ; 3AA4 _ EB, 34

?_202:  mov     eax, dword [ebp-20H]                    ; 3AA6 _ 8B. 45, E0
        lea     edx, [eax-1H]                           ; 3AA9 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 3AAC _ 8B. 45, 08
        add     edx, 4                                  ; 3AAF _ 83. C2, 04
        mov     edx, dword [eax+edx*4+4H]               ; 3AB2 _ 8B. 54 90, 04
        mov     eax, dword [ebp+8H]                     ; 3AB6 _ 8B. 45, 08
        mov     ecx, dword [ebp-20H]                    ; 3AB9 _ 8B. 4D, E0
        add     ecx, 4                                  ; 3ABC _ 83. C1, 04
        mov     dword [eax+ecx*4+4H], edx               ; 3ABF _ 89. 54 88, 04
        mov     eax, dword [ebp+8H]                     ; 3AC3 _ 8B. 45, 08
        mov     edx, dword [ebp-20H]                    ; 3AC6 _ 8B. 55, E0
        add     edx, 4                                  ; 3AC9 _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 3ACC _ 8B. 44 90, 04
        mov     edx, dword [ebp-20H]                    ; 3AD0 _ 8B. 55, E0
        mov     dword [eax+18H], edx                    ; 3AD3 _ 89. 50, 18
        sub     dword [ebp-20H], 1                      ; 3AD6 _ 83. 6D, E0, 01
?_203:  mov     eax, dword [ebp-20H]                    ; 3ADA _ 8B. 45, E0
        cmp     eax, dword [ebp+10H]                    ; 3ADD _ 3B. 45, 10
        jg      ?_202                                   ; 3AE0 _ 7F, C4
        mov     eax, dword [ebp+8H]                     ; 3AE2 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 3AE5 _ 8B. 55, 10
        lea     ecx, [edx+4H]                           ; 3AE8 _ 8D. 4A, 04
        mov     edx, dword [ebp+0CH]                    ; 3AEB _ 8B. 55, 0C
        mov     dword [eax+ecx*4+4H], edx               ; 3AEE _ 89. 54 88, 04
        mov     eax, dword [ebp+10H]                    ; 3AF2 _ 8B. 45, 10
        lea     esi, [eax+1H]                           ; 3AF5 _ 8D. 70, 01
        mov     eax, dword [ebp+0CH]                    ; 3AF8 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 3AFB _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 3AFE _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 3B01 _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 3B04 _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 3B07 _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 3B0A _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 3B0D _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 3B10 _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 3B13 _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 3B16 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 3B19 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 3B1C _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 3B1F _ 8B. 40, 0C
        mov     dword [esp+14H], esi                    ; 3B22 _ 89. 74 24, 14
        mov     dword [esp+10H], ebx                    ; 3B26 _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 3B2A _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 3B2E _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 3B32 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 3B36 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3B39 _ 89. 04 24
        call    sheet_refreshmap                        ; 3B3C _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 3B41 _ 8B. 45, 10
        lea     edi, [eax+1H]                           ; 3B44 _ 8D. 78, 01
        mov     eax, dword [ebp+0CH]                    ; 3B47 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 3B4A _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 3B4D _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 3B50 _ 8B. 40, 08
        lea     esi, [edx+eax]                          ; 3B53 _ 8D. 34 02
        mov     eax, dword [ebp+0CH]                    ; 3B56 _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 3B59 _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 3B5C _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 3B5F _ 8B. 40, 04
        lea     ebx, [edx+eax]                          ; 3B62 _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 3B65 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 3B68 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 3B6B _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 3B6E _ 8B. 40, 0C
        mov     ecx, dword [ebp-1CH]                    ; 3B71 _ 8B. 4D, E4
        mov     dword [esp+18H], ecx                    ; 3B74 _ 89. 4C 24, 18
        mov     dword [esp+14H], edi                    ; 3B78 _ 89. 7C 24, 14
        mov     dword [esp+10H], esi                    ; 3B7C _ 89. 74 24, 10
        mov     dword [esp+0CH], ebx                    ; 3B80 _ 89. 5C 24, 0C
        mov     dword [esp+8H], edx                     ; 3B84 _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 3B88 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 3B8C _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3B8F _ 89. 04 24
        call    sheet_refreshsub                        ; 3B92 _ E8, FFFFFFFC(rel)
        jmp     ?_215                                   ; 3B97 _ E9, 0000027D

?_204:  mov     eax, dword [ebp+8H]                     ; 3B9C _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 3B9F _ 8B. 40, 10
        cmp     eax, dword [ebp-1CH]                    ; 3BA2 _ 3B. 45, E4
        jle     ?_207                                   ; 3BA5 _ 7E, 47
        mov     eax, dword [ebp-1CH]                    ; 3BA7 _ 8B. 45, E4
        mov     dword [ebp-20H], eax                    ; 3BAA _ 89. 45, E0
        jmp     ?_206                                   ; 3BAD _ EB, 34

?_205:  mov     eax, dword [ebp-20H]                    ; 3BAF _ 8B. 45, E0
        lea     edx, [eax+1H]                           ; 3BB2 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 3BB5 _ 8B. 45, 08
        add     edx, 4                                  ; 3BB8 _ 83. C2, 04
        mov     edx, dword [eax+edx*4+4H]               ; 3BBB _ 8B. 54 90, 04
        mov     eax, dword [ebp+8H]                     ; 3BBF _ 8B. 45, 08
        mov     ecx, dword [ebp-20H]                    ; 3BC2 _ 8B. 4D, E0
        add     ecx, 4                                  ; 3BC5 _ 83. C1, 04
        mov     dword [eax+ecx*4+4H], edx               ; 3BC8 _ 89. 54 88, 04
        mov     eax, dword [ebp+8H]                     ; 3BCC _ 8B. 45, 08
        mov     edx, dword [ebp-20H]                    ; 3BCF _ 8B. 55, E0
        add     edx, 4                                  ; 3BD2 _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 3BD5 _ 8B. 44 90, 04
        mov     edx, dword [ebp-20H]                    ; 3BD9 _ 8B. 55, E0
        mov     dword [eax+18H], edx                    ; 3BDC _ 89. 50, 18
        add     dword [ebp-20H], 1                      ; 3BDF _ 83. 45, E0, 01
?_206:  mov     eax, dword [ebp+8H]                     ; 3BE3 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 3BE6 _ 8B. 40, 10
        cmp     eax, dword [ebp-20H]                    ; 3BE9 _ 3B. 45, E0
        jg      ?_205                                   ; 3BEC _ 7F, C1
?_207:  mov     eax, dword [ebp+8H]                     ; 3BEE _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 3BF1 _ 8B. 40, 10
        lea     edx, [eax-1H]                           ; 3BF4 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 3BF7 _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 3BFA _ 89. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 3BFD _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 3C00 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 3C03 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 3C06 _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 3C09 _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 3C0C _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 3C0F _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 3C12 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 3C15 _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 3C18 _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 3C1B _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 3C1E _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 3C21 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 3C24 _ 8B. 40, 0C
        mov     dword [esp+14H], 0                      ; 3C27 _ C7. 44 24, 14, 00000000
        mov     dword [esp+10H], ebx                    ; 3C2F _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 3C33 _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 3C37 _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 3C3B _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 3C3F _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3C42 _ 89. 04 24
        call    sheet_refreshmap                        ; 3C45 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-1CH]                    ; 3C4A _ 8B. 45, E4
        lea     esi, [eax-1H]                           ; 3C4D _ 8D. 70, FF
        mov     eax, dword [ebp+0CH]                    ; 3C50 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 3C53 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 3C56 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 3C59 _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 3C5C _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 3C5F _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 3C62 _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 3C65 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 3C68 _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 3C6B _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 3C6E _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 3C71 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 3C74 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 3C77 _ 8B. 40, 0C
        mov     dword [esp+18H], esi                    ; 3C7A _ 89. 74 24, 18
        mov     dword [esp+14H], 0                      ; 3C7E _ C7. 44 24, 14, 00000000
        mov     dword [esp+10H], ebx                    ; 3C86 _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 3C8A _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 3C8E _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 3C92 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 3C96 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3C99 _ 89. 04 24
        call    sheet_refreshsub                        ; 3C9C _ E8, FFFFFFFC(rel)
        jmp     ?_215                                   ; 3CA1 _ E9, 00000173

?_208:  mov     eax, dword [ebp-1CH]                    ; 3CA6 _ 8B. 45, E4
        cmp     eax, dword [ebp+10H]                    ; 3CA9 _ 3B. 45, 10
        jge     ?_215                                   ; 3CAC _ 0F 8D, 00000167
        cmp     dword [ebp-1CH], 0                      ; 3CB2 _ 83. 7D, E4, 00
        js      ?_211                                   ; 3CB6 _ 78, 56
        mov     eax, dword [ebp-1CH]                    ; 3CB8 _ 8B. 45, E4
        mov     dword [ebp-20H], eax                    ; 3CBB _ 89. 45, E0
        jmp     ?_210                                   ; 3CBE _ EB, 34

?_209:  mov     eax, dword [ebp-20H]                    ; 3CC0 _ 8B. 45, E0
        lea     edx, [eax+1H]                           ; 3CC3 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 3CC6 _ 8B. 45, 08
        add     edx, 4                                  ; 3CC9 _ 83. C2, 04
        mov     edx, dword [eax+edx*4+4H]               ; 3CCC _ 8B. 54 90, 04
        mov     eax, dword [ebp+8H]                     ; 3CD0 _ 8B. 45, 08
        mov     ecx, dword [ebp-20H]                    ; 3CD3 _ 8B. 4D, E0
        add     ecx, 4                                  ; 3CD6 _ 83. C1, 04
        mov     dword [eax+ecx*4+4H], edx               ; 3CD9 _ 89. 54 88, 04
        mov     eax, dword [ebp+8H]                     ; 3CDD _ 8B. 45, 08
        mov     edx, dword [ebp-20H]                    ; 3CE0 _ 8B. 55, E0
        add     edx, 4                                  ; 3CE3 _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 3CE6 _ 8B. 44 90, 04
        mov     edx, dword [ebp-20H]                    ; 3CEA _ 8B. 55, E0
        mov     dword [eax+18H], edx                    ; 3CED _ 89. 50, 18
        add     dword [ebp-20H], 1                      ; 3CF0 _ 83. 45, E0, 01
?_210:  mov     eax, dword [ebp-20H]                    ; 3CF4 _ 8B. 45, E0
        cmp     eax, dword [ebp+10H]                    ; 3CF7 _ 3B. 45, 10
        jl      ?_209                                   ; 3CFA _ 7C, C4
        mov     eax, dword [ebp+8H]                     ; 3CFC _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 3CFF _ 8B. 55, 10
        lea     ecx, [edx+4H]                           ; 3D02 _ 8D. 4A, 04
        mov     edx, dword [ebp+0CH]                    ; 3D05 _ 8B. 55, 0C
        mov     dword [eax+ecx*4+4H], edx               ; 3D08 _ 89. 54 88, 04
        jmp     ?_214                                   ; 3D0C _ EB, 6C

?_211:  mov     eax, dword [ebp+8H]                     ; 3D0E _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 3D11 _ 8B. 40, 10
        mov     dword [ebp-20H], eax                    ; 3D14 _ 89. 45, E0
        jmp     ?_213                                   ; 3D17 _ EB, 3A

?_212:  mov     eax, dword [ebp-20H]                    ; 3D19 _ 8B. 45, E0
        lea     ecx, [eax+1H]                           ; 3D1C _ 8D. 48, 01
        mov     eax, dword [ebp+8H]                     ; 3D1F _ 8B. 45, 08
        mov     edx, dword [ebp-20H]                    ; 3D22 _ 8B. 55, E0
        add     edx, 4                                  ; 3D25 _ 83. C2, 04
        mov     edx, dword [eax+edx*4+4H]               ; 3D28 _ 8B. 54 90, 04
        mov     eax, dword [ebp+8H]                     ; 3D2C _ 8B. 45, 08
        add     ecx, 4                                  ; 3D2F _ 83. C1, 04
        mov     dword [eax+ecx*4+4H], edx               ; 3D32 _ 89. 54 88, 04
        mov     eax, dword [ebp-20H]                    ; 3D36 _ 8B. 45, E0
        lea     edx, [eax+1H]                           ; 3D39 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 3D3C _ 8B. 45, 08
        add     edx, 4                                  ; 3D3F _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 3D42 _ 8B. 44 90, 04
        mov     edx, dword [ebp-20H]                    ; 3D46 _ 8B. 55, E0
        add     edx, 1                                  ; 3D49 _ 83. C2, 01
        mov     dword [eax+18H], edx                    ; 3D4C _ 89. 50, 18
        sub     dword [ebp-20H], 1                      ; 3D4F _ 83. 6D, E0, 01
?_213:  mov     eax, dword [ebp-20H]                    ; 3D53 _ 8B. 45, E0
        cmp     eax, dword [ebp+10H]                    ; 3D56 _ 3B. 45, 10
        jge     ?_212                                   ; 3D59 _ 7D, BE
        mov     eax, dword [ebp+8H]                     ; 3D5B _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 3D5E _ 8B. 55, 10
        lea     ecx, [edx+4H]                           ; 3D61 _ 8D. 4A, 04
        mov     edx, dword [ebp+0CH]                    ; 3D64 _ 8B. 55, 0C
        mov     dword [eax+ecx*4+4H], edx               ; 3D67 _ 89. 54 88, 04
        mov     eax, dword [ebp+8H]                     ; 3D6B _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 3D6E _ 8B. 40, 10
        lea     edx, [eax+1H]                           ; 3D71 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 3D74 _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 3D77 _ 89. 50, 10
?_214:  mov     eax, dword [ebp+0CH]                    ; 3D7A _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 3D7D _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 3D80 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 3D83 _ 8B. 40, 08
        lea     esi, [edx+eax]                          ; 3D86 _ 8D. 34 02
        mov     eax, dword [ebp+0CH]                    ; 3D89 _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 3D8C _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 3D8F _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 3D92 _ 8B. 40, 04
        lea     ebx, [edx+eax]                          ; 3D95 _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 3D98 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 3D9B _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 3D9E _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 3DA1 _ 8B. 40, 0C
        mov     ecx, dword [ebp+10H]                    ; 3DA4 _ 8B. 4D, 10
        mov     dword [esp+14H], ecx                    ; 3DA7 _ 89. 4C 24, 14
        mov     dword [esp+10H], esi                    ; 3DAB _ 89. 74 24, 10
        mov     dword [esp+0CH], ebx                    ; 3DAF _ 89. 5C 24, 0C
        mov     dword [esp+8H], edx                     ; 3DB3 _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 3DB7 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 3DBB _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3DBE _ 89. 04 24
        call    sheet_refreshmap                        ; 3DC1 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+0CH]                    ; 3DC6 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 3DC9 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 3DCC _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 3DCF _ 8B. 40, 08
        lea     esi, [edx+eax]                          ; 3DD2 _ 8D. 34 02
        mov     eax, dword [ebp+0CH]                    ; 3DD5 _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 3DD8 _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 3DDB _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 3DDE _ 8B. 40, 04
        lea     ebx, [edx+eax]                          ; 3DE1 _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 3DE4 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 3DE7 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 3DEA _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 3DED _ 8B. 40, 0C
        mov     ecx, dword [ebp+10H]                    ; 3DF0 _ 8B. 4D, 10
        mov     dword [esp+18H], ecx                    ; 3DF3 _ 89. 4C 24, 18
        mov     ecx, dword [ebp+10H]                    ; 3DF7 _ 8B. 4D, 10
        mov     dword [esp+14H], ecx                    ; 3DFA _ 89. 4C 24, 14
        mov     dword [esp+10H], esi                    ; 3DFE _ 89. 74 24, 10
        mov     dword [esp+0CH], ebx                    ; 3E02 _ 89. 5C 24, 0C
        mov     dword [esp+8H], edx                     ; 3E06 _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 3E0A _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 3E0E _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3E11 _ 89. 04 24
        call    sheet_refreshsub                        ; 3E14 _ E8, FFFFFFFC(rel)
?_215:  add     esp, 60                                 ; 3E19 _ 83. C4, 3C
        pop     ebx                                     ; 3E1C _ 5B
        pop     esi                                     ; 3E1D _ 5E
        pop     edi                                     ; 3E1E _ 5F
        pop     ebp                                     ; 3E1F _ 5D
        ret                                             ; 3E20 _ C3
; sheet_updown End of function

sheet_refresh:; Function begin
        push    ebp                                     ; 3E21 _ 55
        mov     ebp, esp                                ; 3E22 _ 89. E5
        push    edi                                     ; 3E24 _ 57
        push    esi                                     ; 3E25 _ 56
        push    ebx                                     ; 3E26 _ 53
        sub     esp, 44                                 ; 3E27 _ 83. EC, 2C
        mov     eax, dword [ebp+0CH]                    ; 3E2A _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 3E2D _ 8B. 40, 18
        test    eax, eax                                ; 3E30 _ 85. C0
        js      ?_216                                   ; 3E32 _ 78, 61
        mov     eax, dword [ebp+0CH]                    ; 3E34 _ 8B. 45, 0C
        mov     ebx, dword [eax+18H]                    ; 3E37 _ 8B. 58, 18
        mov     eax, dword [ebp+0CH]                    ; 3E3A _ 8B. 45, 0C
        mov     ecx, dword [eax+18H]                    ; 3E3D _ 8B. 48, 18
        mov     eax, dword [ebp+0CH]                    ; 3E40 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 3E43 _ 8B. 50, 10
        mov     eax, dword [ebp+1CH]                    ; 3E46 _ 8B. 45, 1C
        lea     edi, [edx+eax]                          ; 3E49 _ 8D. 3C 02
        mov     eax, dword [ebp+0CH]                    ; 3E4C _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 3E4F _ 8B. 50, 0C
        mov     eax, dword [ebp+18H]                    ; 3E52 _ 8B. 45, 18
        lea     esi, [edx+eax]                          ; 3E55 _ 8D. 34 02
        mov     eax, dword [ebp+0CH]                    ; 3E58 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 3E5B _ 8B. 50, 10
        mov     eax, dword [ebp+14H]                    ; 3E5E _ 8B. 45, 14
        add     edx, eax                                ; 3E61 _ 01. C2
        mov     eax, dword [ebp+0CH]                    ; 3E63 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 3E66 _ 8B. 40, 0C
        mov     dword [ebp-1CH], eax                    ; 3E69 _ 89. 45, E4
        mov     eax, dword [ebp+10H]                    ; 3E6C _ 8B. 45, 10
        add     eax, dword [ebp-1CH]                    ; 3E6F _ 03. 45, E4
        mov     dword [esp+18H], ebx                    ; 3E72 _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 3E76 _ 89. 4C 24, 14
        mov     dword [esp+10H], edi                    ; 3E7A _ 89. 7C 24, 10
        mov     dword [esp+0CH], esi                    ; 3E7E _ 89. 74 24, 0C
        mov     dword [esp+8H], edx                     ; 3E82 _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 3E86 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 3E8A _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3E8D _ 89. 04 24
        call    sheet_refreshsub                        ; 3E90 _ E8, FFFFFFFC(rel)
?_216:  mov     eax, 0                                  ; 3E95 _ B8, 00000000
        add     esp, 44                                 ; 3E9A _ 83. C4, 2C
        pop     ebx                                     ; 3E9D _ 5B
        pop     esi                                     ; 3E9E _ 5E
        pop     edi                                     ; 3E9F _ 5F
        pop     ebp                                     ; 3EA0 _ 5D
        ret                                             ; 3EA1 _ C3
; sheet_refresh End of function

sheet_slide:; Function begin
        push    ebp                                     ; 3EA2 _ 55
        mov     ebp, esp                                ; 3EA3 _ 89. E5
        push    esi                                     ; 3EA5 _ 56
        push    ebx                                     ; 3EA6 _ 53
        sub     esp, 48                                 ; 3EA7 _ 83. EC, 30
        mov     eax, dword [ebp+0CH]                    ; 3EAA _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 3EAD _ 8B. 40, 0C
        mov     dword [ebp-10H], eax                    ; 3EB0 _ 89. 45, F0
        mov     eax, dword [ebp+0CH]                    ; 3EB3 _ 8B. 45, 0C
        mov     eax, dword [eax+10H]                    ; 3EB6 _ 8B. 40, 10
        mov     dword [ebp-0CH], eax                    ; 3EB9 _ 89. 45, F4
        mov     eax, dword [ebp+0CH]                    ; 3EBC _ 8B. 45, 0C
        mov     edx, dword [ebp+10H]                    ; 3EBF _ 8B. 55, 10
        mov     dword [eax+0CH], edx                    ; 3EC2 _ 89. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 3EC5 _ 8B. 45, 0C
        mov     edx, dword [ebp+14H]                    ; 3EC8 _ 8B. 55, 14
        mov     dword [eax+10H], edx                    ; 3ECB _ 89. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 3ECE _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 3ED1 _ 8B. 40, 18
        test    eax, eax                                ; 3ED4 _ 85. C0
        js      ?_217                                   ; 3ED6 _ 0F 88, 00000117
        mov     eax, dword [ebp+0CH]                    ; 3EDC _ 8B. 45, 0C
        mov     edx, dword [eax+8H]                     ; 3EDF _ 8B. 50, 08
        mov     eax, dword [ebp-0CH]                    ; 3EE2 _ 8B. 45, F4
        add     edx, eax                                ; 3EE5 _ 01. C2
        mov     eax, dword [ebp+0CH]                    ; 3EE7 _ 8B. 45, 0C
        mov     ecx, dword [eax+4H]                     ; 3EEA _ 8B. 48, 04
        mov     eax, dword [ebp-10H]                    ; 3EED _ 8B. 45, F0
        add     eax, ecx                                ; 3EF0 _ 01. C8
        mov     dword [esp+14H], 0                      ; 3EF2 _ C7. 44 24, 14, 00000000
        mov     dword [esp+10H], edx                    ; 3EFA _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 3EFE _ 89. 44 24, 0C
        mov     eax, dword [ebp-0CH]                    ; 3F02 _ 8B. 45, F4
        mov     dword [esp+8H], eax                     ; 3F05 _ 89. 44 24, 08
        mov     eax, dword [ebp-10H]                    ; 3F09 _ 8B. 45, F0
        mov     dword [esp+4H], eax                     ; 3F0C _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 3F10 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3F13 _ 89. 04 24
        call    sheet_refreshmap                        ; 3F16 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+0CH]                    ; 3F1B _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 3F1E _ 8B. 40, 18
        mov     edx, dword [ebp+0CH]                    ; 3F21 _ 8B. 55, 0C
        mov     ecx, dword [edx+8H]                     ; 3F24 _ 8B. 4A, 08
        mov     edx, dword [ebp+14H]                    ; 3F27 _ 8B. 55, 14
        add     ecx, edx                                ; 3F2A _ 01. D1
        mov     edx, dword [ebp+0CH]                    ; 3F2C _ 8B. 55, 0C
        mov     ebx, dword [edx+4H]                     ; 3F2F _ 8B. 5A, 04
        mov     edx, dword [ebp+10H]                    ; 3F32 _ 8B. 55, 10
        add     edx, ebx                                ; 3F35 _ 01. DA
        mov     dword [esp+14H], eax                    ; 3F37 _ 89. 44 24, 14
        mov     dword [esp+10H], ecx                    ; 3F3B _ 89. 4C 24, 10
        mov     dword [esp+0CH], edx                    ; 3F3F _ 89. 54 24, 0C
        mov     eax, dword [ebp+14H]                    ; 3F43 _ 8B. 45, 14
        mov     dword [esp+8H], eax                     ; 3F46 _ 89. 44 24, 08
        mov     eax, dword [ebp+10H]                    ; 3F4A _ 8B. 45, 10
        mov     dword [esp+4H], eax                     ; 3F4D _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 3F51 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3F54 _ 89. 04 24
        call    sheet_refreshmap                        ; 3F57 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+0CH]                    ; 3F5C _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 3F5F _ 8B. 40, 18
        lea     ecx, [eax-1H]                           ; 3F62 _ 8D. 48, FF
        mov     eax, dword [ebp+0CH]                    ; 3F65 _ 8B. 45, 0C
        mov     edx, dword [eax+8H]                     ; 3F68 _ 8B. 50, 08
        mov     eax, dword [ebp-0CH]                    ; 3F6B _ 8B. 45, F4
        add     edx, eax                                ; 3F6E _ 01. C2
        mov     eax, dword [ebp+0CH]                    ; 3F70 _ 8B. 45, 0C
        mov     ebx, dword [eax+4H]                     ; 3F73 _ 8B. 58, 04
        mov     eax, dword [ebp-10H]                    ; 3F76 _ 8B. 45, F0
        add     eax, ebx                                ; 3F79 _ 01. D8
        mov     dword [esp+18H], ecx                    ; 3F7B _ 89. 4C 24, 18
        mov     dword [esp+14H], 0                      ; 3F7F _ C7. 44 24, 14, 00000000
        mov     dword [esp+10H], edx                    ; 3F87 _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 3F8B _ 89. 44 24, 0C
        mov     eax, dword [ebp-0CH]                    ; 3F8F _ 8B. 45, F4
        mov     dword [esp+8H], eax                     ; 3F92 _ 89. 44 24, 08
        mov     eax, dword [ebp-10H]                    ; 3F96 _ 8B. 45, F0
        mov     dword [esp+4H], eax                     ; 3F99 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 3F9D _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3FA0 _ 89. 04 24
        call    sheet_refreshsub                        ; 3FA3 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+0CH]                    ; 3FA8 _ 8B. 45, 0C
        mov     edx, dword [eax+18H]                    ; 3FAB _ 8B. 50, 18
        mov     eax, dword [ebp+0CH]                    ; 3FAE _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 3FB1 _ 8B. 40, 18
        mov     ecx, dword [ebp+0CH]                    ; 3FB4 _ 8B. 4D, 0C
        mov     ebx, dword [ecx+8H]                     ; 3FB7 _ 8B. 59, 08
        mov     ecx, dword [ebp+14H]                    ; 3FBA _ 8B. 4D, 14
        add     ebx, ecx                                ; 3FBD _ 01. CB
        mov     ecx, dword [ebp+0CH]                    ; 3FBF _ 8B. 4D, 0C
        mov     esi, dword [ecx+4H]                     ; 3FC2 _ 8B. 71, 04
        mov     ecx, dword [ebp+10H]                    ; 3FC5 _ 8B. 4D, 10
        add     ecx, esi                                ; 3FC8 _ 01. F1
        mov     dword [esp+18H], edx                    ; 3FCA _ 89. 54 24, 18
        mov     dword [esp+14H], eax                    ; 3FCE _ 89. 44 24, 14
        mov     dword [esp+10H], ebx                    ; 3FD2 _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 3FD6 _ 89. 4C 24, 0C
        mov     eax, dword [ebp+14H]                    ; 3FDA _ 8B. 45, 14
        mov     dword [esp+8H], eax                     ; 3FDD _ 89. 44 24, 08
        mov     eax, dword [ebp+10H]                    ; 3FE1 _ 8B. 45, 10
        mov     dword [esp+4H], eax                     ; 3FE4 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 3FE8 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3FEB _ 89. 04 24
        call    sheet_refreshsub                        ; 3FEE _ E8, FFFFFFFC(rel)
?_217:  add     esp, 48                                 ; 3FF3 _ 83. C4, 30
        pop     ebx                                     ; 3FF6 _ 5B
        pop     esi                                     ; 3FF7 _ 5E
        pop     ebp                                     ; 3FF8 _ 5D
        ret                                             ; 3FF9 _ C3
; sheet_slide End of function

sheet_refreshsub:; Function begin
        push    ebp                                     ; 3FFA _ 55
        mov     ebp, esp                                ; 3FFB _ 89. E5
        sub     esp, 48                                 ; 3FFD _ 83. EC, 30
        mov     eax, dword [ebp+8H]                     ; 4000 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 4003 _ 8B. 00
        mov     dword [ebp-18H], eax                    ; 4005 _ 89. 45, E8
        mov     eax, dword [ebp+8H]                     ; 4008 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 400B _ 8B. 40, 04
        mov     dword [ebp-14H], eax                    ; 400E _ 89. 45, EC
        cmp     dword [ebp+0CH], 0                      ; 4011 _ 83. 7D, 0C, 00
        jns     ?_218                                   ; 4015 _ 79, 07
        mov     dword [ebp+0CH], 0                      ; 4017 _ C7. 45, 0C, 00000000
?_218:  cmp     dword [ebp+10H], 8                      ; 401E _ 83. 7D, 10, 08
        jg      ?_219                                   ; 4022 _ 7F, 07
        mov     dword [ebp+10H], 0                      ; 4024 _ C7. 45, 10, 00000000
?_219:  mov     eax, dword [ebp+8H]                     ; 402B _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 402E _ 8B. 40, 08
        cmp     eax, dword [ebp+14H]                    ; 4031 _ 3B. 45, 14
        jge     ?_220                                   ; 4034 _ 7D, 09
        mov     eax, dword [ebp+8H]                     ; 4036 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 4039 _ 8B. 40, 08
        mov     dword [ebp+14H], eax                    ; 403C _ 89. 45, 14
?_220:  mov     eax, dword [ebp+8H]                     ; 403F _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 4042 _ 8B. 40, 0C
        cmp     eax, dword [ebp+18H]                    ; 4045 _ 3B. 45, 18
        jge     ?_221                                   ; 4048 _ 7D, 09
        mov     eax, dword [ebp+8H]                     ; 404A _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 404D _ 8B. 40, 0C
        mov     dword [ebp+18H], eax                    ; 4050 _ 89. 45, 18
?_221:  mov     eax, dword [ebp+1CH]                    ; 4053 _ 8B. 45, 1C
        mov     dword [ebp-24H], eax                    ; 4056 _ 89. 45, DC
        jmp     ?_228                                   ; 4059 _ E9, 00000119

?_222:  mov     eax, dword [ebp+8H]                     ; 405E _ 8B. 45, 08
        mov     edx, dword [ebp-24H]                    ; 4061 _ 8B. 55, DC
        add     edx, 4                                  ; 4064 _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 4067 _ 8B. 44 90, 04
        mov     dword [ebp-10H], eax                    ; 406B _ 89. 45, F0
        mov     eax, dword [ebp-10H]                    ; 406E _ 8B. 45, F0
        mov     eax, dword [eax]                        ; 4071 _ 8B. 00
        mov     dword [ebp-0CH], eax                    ; 4073 _ 89. 45, F4
        mov     edx, dword [ebp-10H]                    ; 4076 _ 8B. 55, F0
        mov     eax, dword [ebp+8H]                     ; 4079 _ 8B. 45, 08
        add     eax, 1044                               ; 407C _ 05, 00000414
        sub     edx, eax                                ; 4081 _ 29. C2
        mov     eax, edx                                ; 4083 _ 89. D0
        sar     eax, 5                                  ; 4085 _ C1. F8, 05
        mov     byte [ebp-26H], al                      ; 4088 _ 88. 45, DA
        mov     dword [ebp-1CH], 0                      ; 408B _ C7. 45, E4, 00000000
        jmp     ?_227                                   ; 4092 _ E9, 000000CD

?_223:  mov     eax, dword [ebp-10H]                    ; 4097 _ 8B. 45, F0
        mov     edx, dword [eax+10H]                    ; 409A _ 8B. 50, 10
        mov     eax, dword [ebp-1CH]                    ; 409D _ 8B. 45, E4
        add     eax, edx                                ; 40A0 _ 01. D0
        mov     dword [ebp-8H], eax                     ; 40A2 _ 89. 45, F8
        mov     dword [ebp-20H], 0                      ; 40A5 _ C7. 45, E0, 00000000
        jmp     ?_226                                   ; 40AC _ E9, 000000A0

?_224:  mov     eax, dword [ebp-10H]                    ; 40B1 _ 8B. 45, F0
        mov     edx, dword [eax+0CH]                    ; 40B4 _ 8B. 50, 0C
        mov     eax, dword [ebp-20H]                    ; 40B7 _ 8B. 45, E0
        add     eax, edx                                ; 40BA _ 01. D0
        mov     dword [ebp-4H], eax                     ; 40BC _ 89. 45, FC
        mov     eax, dword [ebp+0CH]                    ; 40BF _ 8B. 45, 0C
        cmp     eax, dword [ebp-4H]                     ; 40C2 _ 3B. 45, FC
        jg      ?_225                                   ; 40C5 _ 0F 8F, 00000082
        mov     eax, dword [ebp-4H]                     ; 40CB _ 8B. 45, FC
        cmp     eax, dword [ebp+14H]                    ; 40CE _ 3B. 45, 14
        jge     ?_225                                   ; 40D1 _ 7D, 7A
        mov     eax, dword [ebp+10H]                    ; 40D3 _ 8B. 45, 10
        cmp     eax, dword [ebp-8H]                     ; 40D6 _ 3B. 45, F8
        jg      ?_225                                   ; 40D9 _ 7F, 72
        mov     eax, dword [ebp-8H]                     ; 40DB _ 8B. 45, F8
        cmp     eax, dword [ebp+18H]                    ; 40DE _ 3B. 45, 18
        jge     ?_225                                   ; 40E1 _ 7D, 6A
        mov     eax, dword [ebp-10H]                    ; 40E3 _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 40E6 _ 8B. 40, 04
        imul    eax, dword [ebp-1CH]                    ; 40E9 _ 0F AF. 45, E4
        mov     edx, eax                                ; 40ED _ 89. C2
        mov     eax, dword [ebp-20H]                    ; 40EF _ 8B. 45, E0
        add     eax, edx                                ; 40F2 _ 01. D0
        mov     edx, eax                                ; 40F4 _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 40F6 _ 8B. 45, F4
        add     eax, edx                                ; 40F9 _ 01. D0
        movzx   eax, byte [eax]                         ; 40FB _ 0F B6. 00
        mov     byte [ebp-25H], al                      ; 40FE _ 88. 45, DB
        mov     eax, dword [ebp+8H]                     ; 4101 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 4104 _ 8B. 40, 08
        imul    eax, dword [ebp-8H]                     ; 4107 _ 0F AF. 45, F8
        mov     edx, eax                                ; 410B _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 410D _ 8B. 45, FC
        add     eax, edx                                ; 4110 _ 01. D0
        mov     edx, eax                                ; 4112 _ 89. C2
        mov     eax, dword [ebp-14H]                    ; 4114 _ 8B. 45, EC
        add     eax, edx                                ; 4117 _ 01. D0
        movzx   eax, byte [eax]                         ; 4119 _ 0F B6. 00
        cmp     al, byte [ebp-26H]                      ; 411C _ 3A. 45, DA
        jnz     ?_225                                   ; 411F _ 75, 2C
        movzx   edx, byte [ebp-25H]                     ; 4121 _ 0F B6. 55, DB
        mov     eax, dword [ebp-10H]                    ; 4125 _ 8B. 45, F0
        mov     eax, dword [eax+14H]                    ; 4128 _ 8B. 40, 14
        cmp     edx, eax                                ; 412B _ 39. C2
        jz      ?_225                                   ; 412D _ 74, 1E
        mov     eax, dword [ebp+8H]                     ; 412F _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 4132 _ 8B. 40, 08
        imul    eax, dword [ebp-8H]                     ; 4135 _ 0F AF. 45, F8
        mov     edx, eax                                ; 4139 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 413B _ 8B. 45, FC
        add     eax, edx                                ; 413E _ 01. D0
        mov     edx, eax                                ; 4140 _ 89. C2
        mov     eax, dword [ebp-18H]                    ; 4142 _ 8B. 45, E8
        add     edx, eax                                ; 4145 _ 01. C2
        movzx   eax, byte [ebp-25H]                     ; 4147 _ 0F B6. 45, DB
        mov     byte [edx], al                          ; 414B _ 88. 02
?_225:  add     dword [ebp-20H], 1                      ; 414D _ 83. 45, E0, 01
?_226:  mov     eax, dword [ebp-10H]                    ; 4151 _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 4154 _ 8B. 40, 04
        cmp     eax, dword [ebp-20H]                    ; 4157 _ 3B. 45, E0
        jg      ?_224                                   ; 415A _ 0F 8F, FFFFFF51
        add     dword [ebp-1CH], 1                      ; 4160 _ 83. 45, E4, 01
?_227:  mov     eax, dword [ebp-10H]                    ; 4164 _ 8B. 45, F0
        mov     eax, dword [eax+8H]                     ; 4167 _ 8B. 40, 08
        cmp     eax, dword [ebp-1CH]                    ; 416A _ 3B. 45, E4
        jg      ?_223                                   ; 416D _ 0F 8F, FFFFFF24
        add     dword [ebp-24H], 1                      ; 4173 _ 83. 45, DC, 01
?_228:  mov     eax, dword [ebp-24H]                    ; 4177 _ 8B. 45, DC
        cmp     eax, dword [ebp+20H]                    ; 417A _ 3B. 45, 20
        jle     ?_222                                   ; 417D _ 0F 8E, FFFFFEDB
        leave                                           ; 4183 _ C9
        ret                                             ; 4184 _ C3
; sheet_refreshsub End of function

sheet_refreshmap:; Function begin
        push    ebp                                     ; 4185 _ 55
        mov     ebp, esp                                ; 4186 _ 89. E5
        sub     esp, 64                                 ; 4188 _ 83. EC, 40
        mov     eax, dword [ebp+8H]                     ; 418B _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 418E _ 8B. 40, 04
        mov     dword [ebp-14H], eax                    ; 4191 _ 89. 45, EC
        cmp     dword [ebp+0CH], 0                      ; 4194 _ 83. 7D, 0C, 00
        jns     ?_229                                   ; 4198 _ 79, 07
        mov     dword [ebp+0CH], 0                      ; 419A _ C7. 45, 0C, 00000000
?_229:  cmp     dword [ebp+10H], 0                      ; 41A1 _ 83. 7D, 10, 00
        jns     ?_230                                   ; 41A5 _ 79, 07
        mov     dword [ebp+10H], 0                      ; 41A7 _ C7. 45, 10, 00000000
?_230:  mov     eax, dword [ebp+8H]                     ; 41AE _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 41B1 _ 8B. 40, 08
        cmp     eax, dword [ebp+14H]                    ; 41B4 _ 3B. 45, 14
        jge     ?_231                                   ; 41B7 _ 7D, 09
        mov     eax, dword [ebp+8H]                     ; 41B9 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 41BC _ 8B. 40, 08
        mov     dword [ebp+14H], eax                    ; 41BF _ 89. 45, 14
?_231:  mov     eax, dword [ebp+8H]                     ; 41C2 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 41C5 _ 8B. 40, 0C
        cmp     eax, dword [ebp+18H]                    ; 41C8 _ 3B. 45, 18
        jge     ?_232                                   ; 41CB _ 7D, 09
        mov     eax, dword [ebp+8H]                     ; 41CD _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 41D0 _ 8B. 40, 0C
        mov     dword [ebp+18H], eax                    ; 41D3 _ 89. 45, 18
?_232:  mov     eax, dword [ebp+1CH]                    ; 41D6 _ 8B. 45, 1C
        mov     dword [ebp-30H], eax                    ; 41D9 _ 89. 45, D0
        jmp     ?_243                                   ; 41DC _ E9, 00000141

?_233:  mov     eax, dword [ebp+8H]                     ; 41E1 _ 8B. 45, 08
        mov     edx, dword [ebp-30H]                    ; 41E4 _ 8B. 55, D0
        add     edx, 4                                  ; 41E7 _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 41EA _ 8B. 44 90, 04
        mov     dword [ebp-10H], eax                    ; 41EE _ 89. 45, F0
        mov     edx, dword [ebp-10H]                    ; 41F1 _ 8B. 55, F0
        mov     eax, dword [ebp+8H]                     ; 41F4 _ 8B. 45, 08
        add     eax, 1044                               ; 41F7 _ 05, 00000414
        sub     edx, eax                                ; 41FC _ 29. C2
        mov     eax, edx                                ; 41FE _ 89. D0
        sar     eax, 5                                  ; 4200 _ C1. F8, 05
        mov     byte [ebp-31H], al                      ; 4203 _ 88. 45, CF
        mov     eax, dword [ebp-10H]                    ; 4206 _ 8B. 45, F0
        mov     eax, dword [eax]                        ; 4209 _ 8B. 00
        mov     dword [ebp-0CH], eax                    ; 420B _ 89. 45, F4
        mov     eax, dword [ebp-10H]                    ; 420E _ 8B. 45, F0
        mov     eax, dword [eax+0CH]                    ; 4211 _ 8B. 40, 0C
        mov     edx, dword [ebp+0CH]                    ; 4214 _ 8B. 55, 0C
        sub     edx, eax                                ; 4217 _ 29. C2
        mov     eax, edx                                ; 4219 _ 89. D0
        mov     dword [ebp-24H], eax                    ; 421B _ 89. 45, DC
        mov     eax, dword [ebp-10H]                    ; 421E _ 8B. 45, F0
        mov     eax, dword [eax+10H]                    ; 4221 _ 8B. 40, 10
        mov     edx, dword [ebp+10H]                    ; 4224 _ 8B. 55, 10
        sub     edx, eax                                ; 4227 _ 29. C2
        mov     eax, edx                                ; 4229 _ 89. D0
        mov     dword [ebp-20H], eax                    ; 422B _ 89. 45, E0
        mov     eax, dword [ebp-10H]                    ; 422E _ 8B. 45, F0
        mov     eax, dword [eax+0CH]                    ; 4231 _ 8B. 40, 0C
        mov     edx, dword [ebp+14H]                    ; 4234 _ 8B. 55, 14
        sub     edx, eax                                ; 4237 _ 29. C2
        mov     eax, edx                                ; 4239 _ 89. D0
        mov     dword [ebp-1CH], eax                    ; 423B _ 89. 45, E4
        mov     eax, dword [ebp-10H]                    ; 423E _ 8B. 45, F0
        mov     eax, dword [eax+10H]                    ; 4241 _ 8B. 40, 10
        mov     edx, dword [ebp+18H]                    ; 4244 _ 8B. 55, 18
        sub     edx, eax                                ; 4247 _ 29. C2
        mov     eax, edx                                ; 4249 _ 89. D0
        mov     dword [ebp-18H], eax                    ; 424B _ 89. 45, E8
        cmp     dword [ebp-24H], 0                      ; 424E _ 83. 7D, DC, 00
        jns     ?_234                                   ; 4252 _ 79, 07
        mov     dword [ebp-24H], 0                      ; 4254 _ C7. 45, DC, 00000000
?_234:  cmp     dword [ebp-20H], 0                      ; 425B _ 83. 7D, E0, 00
        jns     ?_235                                   ; 425F _ 79, 07
        mov     dword [ebp-20H], 0                      ; 4261 _ C7. 45, E0, 00000000
?_235:  mov     eax, dword [ebp-10H]                    ; 4268 _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 426B _ 8B. 40, 04
        cmp     eax, dword [ebp-1CH]                    ; 426E _ 3B. 45, E4
        jge     ?_236                                   ; 4271 _ 7D, 09
        mov     eax, dword [ebp-10H]                    ; 4273 _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 4276 _ 8B. 40, 04
        mov     dword [ebp-1CH], eax                    ; 4279 _ 89. 45, E4
?_236:  mov     eax, dword [ebp-10H]                    ; 427C _ 8B. 45, F0
        mov     eax, dword [eax+8H]                     ; 427F _ 8B. 40, 08
        cmp     eax, dword [ebp-18H]                    ; 4282 _ 3B. 45, E8
        jge     ?_237                                   ; 4285 _ 7D, 09
        mov     eax, dword [ebp-10H]                    ; 4287 _ 8B. 45, F0
        mov     eax, dword [eax+8H]                     ; 428A _ 8B. 40, 08
        mov     dword [ebp-18H], eax                    ; 428D _ 89. 45, E8
?_237:  mov     eax, dword [ebp-20H]                    ; 4290 _ 8B. 45, E0
        mov     dword [ebp-28H], eax                    ; 4293 _ 89. 45, D8
        jmp     ?_242                                   ; 4296 _ EB, 7A

?_238:  mov     eax, dword [ebp-10H]                    ; 4298 _ 8B. 45, F0
        mov     edx, dword [eax+10H]                    ; 429B _ 8B. 50, 10
        mov     eax, dword [ebp-28H]                    ; 429E _ 8B. 45, D8
        add     eax, edx                                ; 42A1 _ 01. D0
        mov     dword [ebp-8H], eax                     ; 42A3 _ 89. 45, F8
        mov     eax, dword [ebp-24H]                    ; 42A6 _ 8B. 45, DC
        mov     dword [ebp-2CH], eax                    ; 42A9 _ 89. 45, D4
        jmp     ?_241                                   ; 42AC _ EB, 58

?_239:  mov     eax, dword [ebp-10H]                    ; 42AE _ 8B. 45, F0
        mov     edx, dword [eax+0CH]                    ; 42B1 _ 8B. 50, 0C
        mov     eax, dword [ebp-2CH]                    ; 42B4 _ 8B. 45, D4
        add     eax, edx                                ; 42B7 _ 01. D0
        mov     dword [ebp-4H], eax                     ; 42B9 _ 89. 45, FC
        mov     eax, dword [ebp-10H]                    ; 42BC _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 42BF _ 8B. 40, 04
        imul    eax, dword [ebp-28H]                    ; 42C2 _ 0F AF. 45, D8
        mov     edx, eax                                ; 42C6 _ 89. C2
        mov     eax, dword [ebp-2CH]                    ; 42C8 _ 8B. 45, D4
        add     eax, edx                                ; 42CB _ 01. D0
        mov     edx, eax                                ; 42CD _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 42CF _ 8B. 45, F4
        add     eax, edx                                ; 42D2 _ 01. D0
        movzx   eax, byte [eax]                         ; 42D4 _ 0F B6. 00
        movzx   edx, al                                 ; 42D7 _ 0F B6. D0
        mov     eax, dword [ebp-10H]                    ; 42DA _ 8B. 45, F0
        mov     eax, dword [eax+14H]                    ; 42DD _ 8B. 40, 14
        cmp     edx, eax                                ; 42E0 _ 39. C2
        jz      ?_240                                   ; 42E2 _ 74, 1E
        mov     eax, dword [ebp+8H]                     ; 42E4 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 42E7 _ 8B. 40, 08
        imul    eax, dword [ebp-8H]                     ; 42EA _ 0F AF. 45, F8
        mov     edx, eax                                ; 42EE _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 42F0 _ 8B. 45, FC
        add     eax, edx                                ; 42F3 _ 01. D0
        mov     edx, eax                                ; 42F5 _ 89. C2
        mov     eax, dword [ebp-14H]                    ; 42F7 _ 8B. 45, EC
        add     edx, eax                                ; 42FA _ 01. C2
        movzx   eax, byte [ebp-31H]                     ; 42FC _ 0F B6. 45, CF
        mov     byte [edx], al                          ; 4300 _ 88. 02
?_240:  add     dword [ebp-2CH], 1                      ; 4302 _ 83. 45, D4, 01
?_241:  mov     eax, dword [ebp-2CH]                    ; 4306 _ 8B. 45, D4
        cmp     eax, dword [ebp-1CH]                    ; 4309 _ 3B. 45, E4
        jl      ?_239                                   ; 430C _ 7C, A0
        add     dword [ebp-28H], 1                      ; 430E _ 83. 45, D8, 01
?_242:  mov     eax, dword [ebp-28H]                    ; 4312 _ 8B. 45, D8
        cmp     eax, dword [ebp-18H]                    ; 4315 _ 3B. 45, E8
        jl      ?_238                                   ; 4318 _ 0F 8C, FFFFFF7A
        add     dword [ebp-30H], 1                      ; 431E _ 83. 45, D0, 01
?_243:  mov     eax, dword [ebp+8H]                     ; 4322 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 4325 _ 8B. 40, 10
        cmp     eax, dword [ebp-30H]                    ; 4328 _ 3B. 45, D0
        jge     ?_233                                   ; 432B _ 0F 8D, FFFFFEB0
        nop                                             ; 4331 _ 90
        leave                                           ; 4332 _ C9
        ret                                             ; 4333 _ C3
; sheet_refreshmap End of function

init_pit:; Function begin
        push    ebp                                     ; 4334 _ 55
        mov     ebp, esp                                ; 4335 _ 89. E5
        sub     esp, 40                                 ; 4337 _ 83. EC, 28
        mov     dword [esp+4H], 52                      ; 433A _ C7. 44 24, 04, 00000034
        mov     dword [esp], 67                         ; 4342 _ C7. 04 24, 00000043
        call    io_out8                                 ; 4349 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 156                     ; 434E _ C7. 44 24, 04, 0000009C
        mov     dword [esp], 64                         ; 4356 _ C7. 04 24, 00000040
        call    io_out8                                 ; 435D _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 46                      ; 4362 _ C7. 44 24, 04, 0000002E
        mov     dword [esp], 64                         ; 436A _ C7. 04 24, 00000040
        call    io_out8                                 ; 4371 _ E8, FFFFFFFC(rel)
        mov     dword [timerctl], 0                     ; 4376 _ C7. 05, 000003A0(d), 00000000
        mov     dword [ebp-0CH], 0                      ; 4380 _ C7. 45, F4, 00000000
        jmp     ?_245                                   ; 4387 _ EB, 28

?_244:  mov     eax, dword [ebp-0CH]                    ; 4389 _ 8B. 45, F4
        shl     eax, 4                                  ; 438C _ C1. E0, 04
        add     eax, timerctl                           ; 438F _ 05, 000003A0(d)
        mov     dword [eax+8H], 0                       ; 4394 _ C7. 40, 08, 00000000
        mov     eax, dword [ebp-0CH]                    ; 439B _ 8B. 45, F4
        shl     eax, 4                                  ; 439E _ C1. E0, 04
        add     eax, timerctl                           ; 43A1 _ 05, 000003A0(d)
        mov     dword [eax+0CH], 0                      ; 43A6 _ C7. 40, 0C, 00000000
        add     dword [ebp-0CH], 1                      ; 43AD _ 83. 45, F4, 01
?_245:  cmp     dword [ebp-0CH], 499                    ; 43B1 _ 81. 7D, F4, 000001F3
        jle     ?_244                                   ; 43B8 _ 7E, CF
        leave                                           ; 43BA _ C9
        ret                                             ; 43BB _ C3
; init_pit End of function

timer_alloc:; Function begin
        push    ebp                                     ; 43BC _ 55
        mov     ebp, esp                                ; 43BD _ 89. E5
        sub     esp, 16                                 ; 43BF _ 83. EC, 10
        mov     dword [ebp-4H], 0                       ; 43C2 _ C7. 45, FC, 00000000
        jmp     ?_248                                   ; 43C9 _ EB, 38

?_246:  mov     eax, dword [ebp-4H]                     ; 43CB _ 8B. 45, FC
        shl     eax, 4                                  ; 43CE _ C1. E0, 04
        add     eax, timerctl                           ; 43D1 _ 05, 000003A0(d)
        mov     eax, dword [eax+8H]                     ; 43D6 _ 8B. 40, 08
        test    eax, eax                                ; 43D9 _ 85. C0
        jnz     ?_247                                   ; 43DB _ 75, 22
        mov     eax, dword [ebp-4H]                     ; 43DD _ 8B. 45, FC
        shl     eax, 4                                  ; 43E0 _ C1. E0, 04
        add     eax, timerctl                           ; 43E3 _ 05, 000003A0(d)
        mov     dword [eax+8H], 1                       ; 43E8 _ C7. 40, 08, 00000001
        mov     eax, dword [ebp-4H]                     ; 43EF _ 8B. 45, FC
        shl     eax, 4                                  ; 43F2 _ C1. E0, 04
        add     eax, timerctl                           ; 43F5 _ 05, 000003A0(d)
        add     eax, 4                                  ; 43FA _ 83. C0, 04
        jmp     ?_249                                   ; 43FD _ EB, 12

?_247:  add     dword [ebp-4H], 1                       ; 43FF _ 83. 45, FC, 01
?_248:  cmp     dword [ebp-4H], 499                     ; 4403 _ 81. 7D, FC, 000001F3
        jle     ?_246                                   ; 440A _ 7E, BF
        mov     eax, 0                                  ; 440C _ B8, 00000000
?_249:  leave                                           ; 4411 _ C9
        ret                                             ; 4412 _ C3
; timer_alloc End of function

timer_free:; Function begin
        push    ebp                                     ; 4413 _ 55
        mov     ebp, esp                                ; 4414 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 4416 _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 4419 _ C7. 40, 04, 00000000
        nop                                             ; 4420 _ 90
        pop     ebp                                     ; 4421 _ 5D
        ret                                             ; 4422 _ C3
; timer_free End of function

timer_init:; Function begin
        push    ebp                                     ; 4423 _ 55
        mov     ebp, esp                                ; 4424 _ 89. E5
        sub     esp, 4                                  ; 4426 _ 83. EC, 04
        mov     eax, dword [ebp+10H]                    ; 4429 _ 8B. 45, 10
        mov     byte [ebp-4H], al                       ; 442C _ 88. 45, FC
        mov     eax, dword [ebp+8H]                     ; 442F _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 4432 _ 8B. 55, 0C
        mov     dword [eax+8H], edx                     ; 4435 _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 4438 _ 8B. 45, 08
        movzx   edx, byte [ebp-4H]                      ; 443B _ 0F B6. 55, FC
        mov     byte [eax+0CH], dl                      ; 443F _ 88. 50, 0C
        nop                                             ; 4442 _ 90
        leave                                           ; 4443 _ C9
        ret                                             ; 4444 _ C3
; timer_init End of function

timer_settime:; Function begin
        push    ebp                                     ; 4445 _ 55
        mov     ebp, esp                                ; 4446 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 4448 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 444B _ 8B. 55, 0C
        mov     dword [eax], edx                        ; 444E _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 4450 _ 8B. 45, 08
        mov     dword [eax+4H], 2                       ; 4453 _ C7. 40, 04, 00000002
        nop                                             ; 445A _ 90
        pop     ebp                                     ; 445B _ 5D
        ret                                             ; 445C _ C3
; timer_settime End of function

intHandlerForTimer:; Function begin
        push    ebp                                     ; 445D _ 55
        mov     ebp, esp                                ; 445E _ 89. E5
        sub     esp, 40                                 ; 4460 _ 83. EC, 28
        mov     dword [esp+4H], 32                      ; 4463 _ C7. 44 24, 04, 00000020
        mov     dword [esp], 32                         ; 446B _ C7. 04 24, 00000020
        call    io_out8                                 ; 4472 _ E8, FFFFFFFC(rel)
        mov     eax, dword [timerctl]                   ; 4477 _ A1, 000003A0(d)
        add     eax, 1                                  ; 447C _ 83. C0, 01
        mov     dword [timerctl], eax                   ; 447F _ A3, 000003A0(d)
        mov     byte [ebp-0DH], 0                       ; 4484 _ C6. 45, F3, 00
        mov     dword [ebp-0CH], 0                      ; 4488 _ C7. 45, F4, 00000000
        jmp     ?_253                                   ; 448F _ E9, 000000B0

?_250:  mov     eax, dword [ebp-0CH]                    ; 4494 _ 8B. 45, F4
        shl     eax, 4                                  ; 4497 _ C1. E0, 04
        add     eax, timerctl                           ; 449A _ 05, 000003A0(d)
        mov     eax, dword [eax+8H]                     ; 449F _ 8B. 40, 08
        cmp     eax, 2                                  ; 44A2 _ 83. F8, 02
        jne     ?_251                                   ; 44A5 _ 0F 85, 0000008A
        mov     eax, dword [ebp-0CH]                    ; 44AB _ 8B. 45, F4
        shl     eax, 4                                  ; 44AE _ C1. E0, 04
        add     eax, timerctl                           ; 44B1 _ 05, 000003A0(d)
        mov     eax, dword [eax+4H]                     ; 44B6 _ 8B. 40, 04
        lea     edx, [eax-1H]                           ; 44B9 _ 8D. 50, FF
        mov     eax, dword [ebp-0CH]                    ; 44BC _ 8B. 45, F4
        shl     eax, 4                                  ; 44BF _ C1. E0, 04
        add     eax, timerctl                           ; 44C2 _ 05, 000003A0(d)
        mov     dword [eax+4H], edx                     ; 44C7 _ 89. 50, 04
        mov     eax, dword [ebp-0CH]                    ; 44CA _ 8B. 45, F4
        shl     eax, 4                                  ; 44CD _ C1. E0, 04
        add     eax, timerctl                           ; 44D0 _ 05, 000003A0(d)
        mov     eax, dword [eax+4H]                     ; 44D5 _ 8B. 40, 04
        test    eax, eax                                ; 44D8 _ 85. C0
        jnz     ?_251                                   ; 44DA _ 75, 59
        mov     eax, dword [ebp-0CH]                    ; 44DC _ 8B. 45, F4
        shl     eax, 4                                  ; 44DF _ C1. E0, 04
        add     eax, timerctl                           ; 44E2 _ 05, 000003A0(d)
        mov     dword [eax+8H], 1                       ; 44E7 _ C7. 40, 08, 00000001
        mov     eax, dword [ebp-0CH]                    ; 44EE _ 8B. 45, F4
        shl     eax, 4                                  ; 44F1 _ C1. E0, 04
        add     eax, timerctl                           ; 44F4 _ 05, 000003A0(d)
        movzx   eax, byte [eax+10H]                     ; 44F9 _ 0F B6. 40, 10
        movzx   edx, al                                 ; 44FD _ 0F B6. D0
        mov     eax, dword [ebp-0CH]                    ; 4500 _ 8B. 45, F4
        shl     eax, 4                                  ; 4503 _ C1. E0, 04
        add     eax, timerctl                           ; 4506 _ 05, 000003A0(d)
        mov     eax, dword [eax+0CH]                    ; 450B _ 8B. 40, 0C
        mov     dword [esp+4H], edx                     ; 450E _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 4512 _ 89. 04 24
        call    fifo8_put                               ; 4515 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 451A _ 8B. 45, F4
        shl     eax, 4                                  ; 451D _ C1. E0, 04
        add     eax, timerctl                           ; 4520 _ 05, 000003A0(d)
        lea     edx, [eax+4H]                           ; 4525 _ 8D. 50, 04
        mov     eax, dword [task_timer]                 ; 4528 _ A1, 00000000(d)
        cmp     edx, eax                                ; 452D _ 39. C2
        jnz     ?_251                                   ; 452F _ 75, 04
        mov     byte [ebp-0DH], 1                       ; 4531 _ C6. 45, F3, 01
?_251:  cmp     byte [ebp-0DH], 0                       ; 4535 _ 80. 7D, F3, 00
        jz      ?_252                                   ; 4539 _ 74, 05
        call    task_switch                             ; 453B _ E8, FFFFFFFC(rel)
?_252:  add     dword [ebp-0CH], 1                      ; 4540 _ 83. 45, F4, 01
?_253:  cmp     dword [ebp-0CH], 499                    ; 4544 _ 81. 7D, F4, 000001F3
        jle     ?_250                                   ; 454B _ 0F 8E, FFFFFF43
        nop                                             ; 4551 _ 90
        leave                                           ; 4552 _ C9
        ret                                             ; 4553 _ C3
; intHandlerForTimer End of function

getTimerController:; Function begin
        push    ebp                                     ; 4554 _ 55
        mov     ebp, esp                                ; 4555 _ 89. E5
        mov     eax, timerctl                           ; 4557 _ B8, 000003A0(d)
        pop     ebp                                     ; 455C _ 5D
        ret                                             ; 455D _ C3
; getTimerController End of function

fifo8_init:; Function begin
        push    ebp                                     ; 455E _ 55
        mov     ebp, esp                                ; 455F _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 4561 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 4564 _ 8B. 55, 0C
        mov     dword [eax+0CH], edx                    ; 4567 _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 456A _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 456D _ 8B. 55, 10
        mov     dword [eax], edx                        ; 4570 _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 4572 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 4575 _ 8B. 55, 0C
        mov     dword [eax+10H], edx                    ; 4578 _ 89. 50, 10
        mov     eax, dword [ebp+8H]                     ; 457B _ 8B. 45, 08
        mov     dword [eax+14H], 0                      ; 457E _ C7. 40, 14, 00000000
        mov     eax, dword [ebp+8H]                     ; 4585 _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 4588 _ C7. 40, 04, 00000000
        mov     eax, dword [ebp+8H]                     ; 458F _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 4592 _ C7. 40, 08, 00000000
        mov     eax, dword [ebp+8H]                     ; 4599 _ 8B. 45, 08
        mov     edx, dword [ebp+14H]                    ; 459C _ 8B. 55, 14
        mov     dword [eax+18H], edx                    ; 459F _ 89. 50, 18
        nop                                             ; 45A2 _ 90
        pop     ebp                                     ; 45A3 _ 5D
        ret                                             ; 45A4 _ C3
; fifo8_init End of function

fifo8_put:; Function begin
        push    ebp                                     ; 45A5 _ 55
        mov     ebp, esp                                ; 45A6 _ 89. E5
        sub     esp, 24                                 ; 45A8 _ 83. EC, 18
        mov     eax, dword [ebp+0CH]                    ; 45AB _ 8B. 45, 0C
        mov     byte [ebp-0CH], al                      ; 45AE _ 88. 45, F4
        cmp     dword [ebp+8H], 0                       ; 45B1 _ 83. 7D, 08, 00
        jnz     ?_254                                   ; 45B5 _ 75, 0A
        mov     eax, 4294967295                         ; 45B7 _ B8, FFFFFFFF
        jmp     ?_258                                   ; 45BC _ E9, 000000AB

?_254:  mov     eax, dword [ebp+8H]                     ; 45C1 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 45C4 _ 8B. 40, 10
        test    eax, eax                                ; 45C7 _ 85. C0
        jnz     ?_255                                   ; 45C9 _ 75, 1B
        mov     eax, dword [ebp+8H]                     ; 45CB _ 8B. 45, 08
        mov     eax, dword [eax+14H]                    ; 45CE _ 8B. 40, 14
        or      eax, 01H                                ; 45D1 _ 83. C8, 01
        mov     edx, eax                                ; 45D4 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 45D6 _ 8B. 45, 08
        mov     dword [eax+14H], edx                    ; 45D9 _ 89. 50, 14
        mov     eax, 4294967295                         ; 45DC _ B8, FFFFFFFF
        jmp     ?_258                                   ; 45E1 _ E9, 00000086

?_255:  mov     eax, dword [ebp+8H]                     ; 45E6 _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 45E9 _ 8B. 10
        mov     eax, dword [ebp+8H]                     ; 45EB _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 45EE _ 8B. 40, 04
        add     edx, eax                                ; 45F1 _ 01. C2
        movzx   eax, byte [ebp-0CH]                     ; 45F3 _ 0F B6. 45, F4
        mov     byte [edx], al                          ; 45F7 _ 88. 02
        mov     eax, dword [ebp+8H]                     ; 45F9 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 45FC _ 8B. 40, 04
        lea     edx, [eax+1H]                           ; 45FF _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 4602 _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 4605 _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 4608 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 460B _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 460E _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 4611 _ 8B. 40, 0C
        cmp     edx, eax                                ; 4614 _ 39. C2
        jnz     ?_256                                   ; 4616 _ 75, 0A
        mov     eax, dword [ebp+8H]                     ; 4618 _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 461B _ C7. 40, 04, 00000000
?_256:  mov     eax, dword [ebp+8H]                     ; 4622 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 4625 _ 8B. 40, 10
        lea     edx, [eax-1H]                           ; 4628 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 462B _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 462E _ 89. 50, 10
        mov     eax, dword [ebp+8H]                     ; 4631 _ 8B. 45, 08
        mov     eax, dword [eax+18H]                    ; 4634 _ 8B. 40, 18
        test    eax, eax                                ; 4637 _ 85. C0
        jz      ?_257                                   ; 4639 _ 74, 2C
        mov     eax, dword [ebp+8H]                     ; 463B _ 8B. 45, 08
        mov     eax, dword [eax+18H]                    ; 463E _ 8B. 40, 18
        mov     eax, dword [eax+4H]                     ; 4641 _ 8B. 40, 04
        cmp     eax, 2                                  ; 4644 _ 83. F8, 02
        jz      ?_257                                   ; 4647 _ 74, 1E
        mov     eax, dword [ebp+8H]                     ; 4649 _ 8B. 45, 08
        mov     eax, dword [eax+18H]                    ; 464C _ 8B. 40, 18
        mov     dword [esp+8H], 0                       ; 464F _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], -1                      ; 4657 _ C7. 44 24, 04, FFFFFFFF
        mov     dword [esp], eax                        ; 465F _ 89. 04 24
        call    task_run                                ; 4662 _ E8, FFFFFFFC(rel)
?_257:  mov     eax, 0                                  ; 4667 _ B8, 00000000
?_258:  leave                                           ; 466C _ C9
        ret                                             ; 466D _ C3
; fifo8_put End of function

fifo8_get:; Function begin
        push    ebp                                     ; 466E _ 55
        mov     ebp, esp                                ; 466F _ 89. E5
        sub     esp, 16                                 ; 4671 _ 83. EC, 10
        mov     eax, dword [ebp+8H]                     ; 4674 _ 8B. 45, 08
        mov     edx, dword [eax+10H]                    ; 4677 _ 8B. 50, 10
        mov     eax, dword [ebp+8H]                     ; 467A _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 467D _ 8B. 40, 0C
        cmp     edx, eax                                ; 4680 _ 39. C2
        jnz     ?_259                                   ; 4682 _ 75, 07
        mov     eax, 4294967295                         ; 4684 _ B8, FFFFFFFF
        jmp     ?_261                                   ; 4689 _ EB, 51

?_259:  mov     eax, dword [ebp+8H]                     ; 468B _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 468E _ 8B. 10
        mov     eax, dword [ebp+8H]                     ; 4690 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 4693 _ 8B. 40, 08
        add     eax, edx                                ; 4696 _ 01. D0
        movzx   eax, byte [eax]                         ; 4698 _ 0F B6. 00
        movzx   eax, al                                 ; 469B _ 0F B6. C0
        mov     dword [ebp-4H], eax                     ; 469E _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 46A1 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 46A4 _ 8B. 40, 08
        lea     edx, [eax+1H]                           ; 46A7 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 46AA _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 46AD _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 46B0 _ 8B. 45, 08
        mov     edx, dword [eax+8H]                     ; 46B3 _ 8B. 50, 08
        mov     eax, dword [ebp+8H]                     ; 46B6 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 46B9 _ 8B. 40, 0C
        cmp     edx, eax                                ; 46BC _ 39. C2
        jnz     ?_260                                   ; 46BE _ 75, 0A
        mov     eax, dword [ebp+8H]                     ; 46C0 _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 46C3 _ C7. 40, 08, 00000000
?_260:  mov     eax, dword [ebp+8H]                     ; 46CA _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 46CD _ 8B. 40, 10
        lea     edx, [eax+1H]                           ; 46D0 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 46D3 _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 46D6 _ 89. 50, 10
        mov     eax, dword [ebp-4H]                     ; 46D9 _ 8B. 45, FC
?_261:  leave                                           ; 46DC _ C9
        ret                                             ; 46DD _ C3
; fifo8_get End of function

fifo8_status:; Function begin
        push    ebp                                     ; 46DE _ 55
        mov     ebp, esp                                ; 46DF _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 46E1 _ 8B. 45, 08
        mov     edx, dword [eax+0CH]                    ; 46E4 _ 8B. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 46E7 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 46EA _ 8B. 40, 10
        sub     edx, eax                                ; 46ED _ 29. C2
        mov     eax, edx                                ; 46EF _ 89. D0
        pop     ebp                                     ; 46F1 _ 5D
        ret                                             ; 46F2 _ C3
; fifo8_status End of function

strcmp: ; Function begin
        push    ebp                                     ; 46F3 _ 55
        mov     ebp, esp                                ; 46F4 _ 89. E5
        sub     esp, 16                                 ; 46F6 _ 83. EC, 10
        cmp     dword [ebp+8H], 0                       ; 46F9 _ 83. 7D, 08, 00
        jz      ?_262                                   ; 46FD _ 74, 06
        cmp     dword [ebp+0CH], 0                      ; 46FF _ 83. 7D, 0C, 00
        jnz     ?_263                                   ; 4703 _ 75, 0A
?_262:  mov     eax, 0                                  ; 4705 _ B8, 00000000
        jmp     ?_270                                   ; 470A _ E9, 0000009B

?_263:  mov     dword [ebp-4H], 0                       ; 470F _ C7. 45, FC, 00000000
        jmp     ?_266                                   ; 4716 _ EB, 25

?_264:  mov     edx, dword [ebp-4H]                     ; 4718 _ 8B. 55, FC
        mov     eax, dword [ebp+8H]                     ; 471B _ 8B. 45, 08
        add     eax, edx                                ; 471E _ 01. D0
        movzx   edx, byte [eax]                         ; 4720 _ 0F B6. 10
        mov     ecx, dword [ebp-4H]                     ; 4723 _ 8B. 4D, FC
        mov     eax, dword [ebp+0CH]                    ; 4726 _ 8B. 45, 0C
        add     eax, ecx                                ; 4729 _ 01. C8
        movzx   eax, byte [eax]                         ; 472B _ 0F B6. 00
        cmp     dl, al                                  ; 472E _ 38. C2
        jz      ?_265                                   ; 4730 _ 74, 07
        mov     eax, 0                                  ; 4732 _ B8, 00000000
        jmp     ?_270                                   ; 4737 _ EB, 71

?_265:  add     dword [ebp-4H], 1                       ; 4739 _ 83. 45, FC, 01
?_266:  mov     edx, dword [ebp-4H]                     ; 473D _ 8B. 55, FC
        mov     eax, dword [ebp+8H]                     ; 4740 _ 8B. 45, 08
        add     eax, edx                                ; 4743 _ 01. D0
        movzx   eax, byte [eax]                         ; 4745 _ 0F B6. 00
        test    al, al                                  ; 4748 _ 84. C0
        jz      ?_267                                   ; 474A _ 74, 0F
        mov     edx, dword [ebp-4H]                     ; 474C _ 8B. 55, FC
        mov     eax, dword [ebp+0CH]                    ; 474F _ 8B. 45, 0C
        add     eax, edx                                ; 4752 _ 01. D0
        movzx   eax, byte [eax]                         ; 4754 _ 0F B6. 00
        test    al, al                                  ; 4757 _ 84. C0
        jnz     ?_264                                   ; 4759 _ 75, BD
?_267:  mov     edx, dword [ebp-4H]                     ; 475B _ 8B. 55, FC
        mov     eax, dword [ebp+8H]                     ; 475E _ 8B. 45, 08
        add     eax, edx                                ; 4761 _ 01. D0
        movzx   eax, byte [eax]                         ; 4763 _ 0F B6. 00
        test    al, al                                  ; 4766 _ 84. C0
        jnz     ?_268                                   ; 4768 _ 75, 16
        mov     edx, dword [ebp-4H]                     ; 476A _ 8B. 55, FC
        mov     eax, dword [ebp+0CH]                    ; 476D _ 8B. 45, 0C
        add     eax, edx                                ; 4770 _ 01. D0
        movzx   eax, byte [eax]                         ; 4772 _ 0F B6. 00
        test    al, al                                  ; 4775 _ 84. C0
        jz      ?_268                                   ; 4777 _ 74, 07
        mov     eax, 0                                  ; 4779 _ B8, 00000000
        jmp     ?_270                                   ; 477E _ EB, 2A

?_268:  mov     edx, dword [ebp-4H]                     ; 4780 _ 8B. 55, FC
        mov     eax, dword [ebp+8H]                     ; 4783 _ 8B. 45, 08
        add     eax, edx                                ; 4786 _ 01. D0
        movzx   eax, byte [eax]                         ; 4788 _ 0F B6. 00
        test    al, al                                  ; 478B _ 84. C0
        jz      ?_269                                   ; 478D _ 74, 16
        mov     edx, dword [ebp-4H]                     ; 478F _ 8B. 55, FC
        mov     eax, dword [ebp+0CH]                    ; 4792 _ 8B. 45, 0C
        add     eax, edx                                ; 4795 _ 01. D0
        movzx   eax, byte [eax]                         ; 4797 _ 0F B6. 00
        test    al, al                                  ; 479A _ 84. C0
        jz      ?_269                                   ; 479C _ 74, 07
        mov     eax, 0                                  ; 479E _ B8, 00000000
        jmp     ?_270                                   ; 47A3 _ EB, 05

?_269:  mov     eax, 1                                  ; 47A5 _ B8, 00000001
?_270:  leave                                           ; 47AA _ C9
        ret                                             ; 47AB _ C3
; strcmp End of function

set_segmdesc:; Function begin
        push    ebp                                     ; 47AC _ 55
        mov     ebp, esp                                ; 47AD _ 89. E5
        cmp     dword [ebp+0CH], 1048575                ; 47AF _ 81. 7D, 0C, 000FFFFF
        jbe     ?_271                                   ; 47B6 _ 76, 10
        or      dword [ebp+14H], 8000H                  ; 47B8 _ 81. 4D, 14, 00008000
        mov     eax, dword [ebp+0CH]                    ; 47BF _ 8B. 45, 0C
        shr     eax, 12                                 ; 47C2 _ C1. E8, 0C
        mov     dword [ebp+0CH], eax                    ; 47C5 _ 89. 45, 0C
?_271:  mov     eax, dword [ebp+0CH]                    ; 47C8 _ 8B. 45, 0C
        mov     edx, eax                                ; 47CB _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 47CD _ 8B. 45, 08
        mov     word [eax], dx                          ; 47D0 _ 66: 89. 10
        mov     eax, dword [ebp+10H]                    ; 47D3 _ 8B. 45, 10
        mov     edx, eax                                ; 47D6 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 47D8 _ 8B. 45, 08
        mov     word [eax+2H], dx                       ; 47DB _ 66: 89. 50, 02
        mov     eax, dword [ebp+10H]                    ; 47DF _ 8B. 45, 10
        sar     eax, 16                                 ; 47E2 _ C1. F8, 10
        mov     edx, eax                                ; 47E5 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 47E7 _ 8B. 45, 08
        mov     byte [eax+4H], dl                       ; 47EA _ 88. 50, 04
        mov     eax, dword [ebp+14H]                    ; 47ED _ 8B. 45, 14
        mov     edx, eax                                ; 47F0 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 47F2 _ 8B. 45, 08
        mov     byte [eax+5H], dl                       ; 47F5 _ 88. 50, 05
        mov     eax, dword [ebp+0CH]                    ; 47F8 _ 8B. 45, 0C
        shr     eax, 16                                 ; 47FB _ C1. E8, 10
        and     eax, 0FH                                ; 47FE _ 83. E0, 0F
        mov     edx, eax                                ; 4801 _ 89. C2
        mov     eax, dword [ebp+14H]                    ; 4803 _ 8B. 45, 14
        sar     eax, 8                                  ; 4806 _ C1. F8, 08
        and     eax, 0FFFFFFF0H                         ; 4809 _ 83. E0, F0
        or      eax, edx                                ; 480C _ 09. D0
        mov     edx, eax                                ; 480E _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 4810 _ 8B. 45, 08
        mov     byte [eax+6H], dl                       ; 4813 _ 88. 50, 06
        mov     eax, dword [ebp+10H]                    ; 4816 _ 8B. 45, 10
        shr     eax, 24                                 ; 4819 _ C1. E8, 18
        mov     edx, eax                                ; 481C _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 481E _ 8B. 45, 08
        mov     byte [eax+7H], dl                       ; 4821 _ 88. 50, 07
        nop                                             ; 4824 _ 90
        pop     ebp                                     ; 4825 _ 5D
        ret                                             ; 4826 _ C3
; set_segmdesc End of function

get_taskctl:; Function begin
        push    ebp                                     ; 4827 _ 55
        mov     ebp, esp                                ; 4828 _ 89. E5
        mov     eax, dword [taskctl]                    ; 482A _ A1, 000022E8(d)
        pop     ebp                                     ; 482F _ 5D
        ret                                             ; 4830 _ C3
; get_taskctl End of function

init_task_level:; Function begin
        push    ebp                                     ; 4831 _ 55
        mov     ebp, esp                                ; 4832 _ 89. E5
        sub     esp, 16                                 ; 4834 _ 83. EC, 10
        mov     ecx, dword [taskctl]                    ; 4837 _ 8B. 0D, 000022E8(d)
        mov     edx, dword [ebp+8H]                     ; 483D _ 8B. 55, 08
        mov     eax, edx                                ; 4840 _ 89. D0
        shl     eax, 2                                  ; 4842 _ C1. E0, 02
        add     eax, edx                                ; 4845 _ 01. D0
        shl     eax, 2                                  ; 4847 _ C1. E0, 02
        add     eax, ecx                                ; 484A _ 01. C8
        add     eax, 8                                  ; 484C _ 83. C0, 08
        mov     dword [eax], 0                          ; 484F _ C7. 00, 00000000
        mov     ecx, dword [taskctl]                    ; 4855 _ 8B. 0D, 000022E8(d)
        mov     edx, dword [ebp+8H]                     ; 485B _ 8B. 55, 08
        mov     eax, edx                                ; 485E _ 89. D0
        shl     eax, 2                                  ; 4860 _ C1. E0, 02
        add     eax, edx                                ; 4863 _ 01. D0
        shl     eax, 2                                  ; 4865 _ C1. E0, 02
        add     eax, ecx                                ; 4868 _ 01. C8
        add     eax, 12                                 ; 486A _ 83. C0, 0C
        mov     dword [eax], 0                          ; 486D _ C7. 00, 00000000
        mov     dword [ebp-4H], 0                       ; 4873 _ C7. 45, FC, 00000000
        jmp     ?_273                                   ; 487A _ EB, 21

?_272:  mov     ecx, dword [taskctl]                    ; 487C _ 8B. 0D, 000022E8(d)
        mov     edx, dword [ebp-4H]                     ; 4882 _ 8B. 55, FC
        mov     eax, edx                                ; 4885 _ 89. D0
        add     eax, eax                                ; 4887 _ 01. C0
        add     eax, edx                                ; 4889 _ 01. D0
        shl     eax, 3                                  ; 488B _ C1. E0, 03
        add     eax, ecx                                ; 488E _ 01. C8
        add     eax, 16                                 ; 4890 _ 83. C0, 10
        mov     dword [eax], 0                          ; 4893 _ C7. 00, 00000000
        add     dword [ebp-4H], 1                       ; 4899 _ 83. 45, FC, 01
?_273:  cmp     dword [ebp-4H], 2                       ; 489D _ 83. 7D, FC, 02
        jle     ?_272                                   ; 48A1 _ 7E, D9
        leave                                           ; 48A3 _ C9
        ret                                             ; 48A4 _ C3
; init_task_level End of function

task_init:; Function begin
        push    ebp                                     ; 48A5 _ 55
        mov     ebp, esp                                ; 48A6 _ 89. E5
        sub     esp, 40                                 ; 48A8 _ 83. EC, 28
        call    get_addr_gdt                            ; 48AB _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 48B0 _ 89. 45, F0
        mov     dword [esp+4H], 808                     ; 48B3 _ C7. 44 24, 04, 00000328
        mov     eax, dword [ebp+8H]                     ; 48BB _ 8B. 45, 08
        mov     dword [esp], eax                        ; 48BE _ 89. 04 24
        call    memman_alloc_4k                         ; 48C1 _ E8, FFFFFFFC(rel)
        mov     dword [taskctl], eax                    ; 48C6 _ A3, 000022E8(d)
        mov     dword [ebp-14H], 0                      ; 48CB _ C7. 45, EC, 00000000
        jmp     ?_275                                   ; 48D2 _ E9, 00000085

?_274:  mov     edx, dword [taskctl]                    ; 48D7 _ 8B. 15, 000022E8(d)
        mov     eax, dword [ebp-14H]                    ; 48DD _ 8B. 45, EC
        imul    eax, eax, 148                           ; 48E0 _ 69. C0, 00000094
        add     eax, edx                                ; 48E6 _ 01. D0
        add     eax, 72                                 ; 48E8 _ 83. C0, 48
        mov     dword [eax], 0                          ; 48EB _ C7. 00, 00000000
        mov     ecx, dword [taskctl]                    ; 48F1 _ 8B. 0D, 000022E8(d)
        mov     eax, dword [ebp-14H]                    ; 48F7 _ 8B. 45, EC
        add     eax, 7                                  ; 48FA _ 83. C0, 07
        lea     edx, [eax*8]                            ; 48FD _ 8D. 14 C5, 00000000
        mov     eax, dword [ebp-14H]                    ; 4904 _ 8B. 45, EC
        imul    eax, eax, 148                           ; 4907 _ 69. C0, 00000094
        add     eax, ecx                                ; 490D _ 01. C8
        add     eax, 68                                 ; 490F _ 83. C0, 44
        mov     dword [eax], edx                        ; 4912 _ 89. 10
        mov     eax, dword [taskctl]                    ; 4914 _ A1, 000022E8(d)
        mov     edx, dword [ebp-14H]                    ; 4919 _ 8B. 55, EC
        imul    edx, edx, 148                           ; 491C _ 69. D2, 00000094
        add     edx, 96                                 ; 4922 _ 83. C2, 60
        add     eax, edx                                ; 4925 _ 01. D0
        add     eax, 16                                 ; 4927 _ 83. C0, 10
        mov     edx, dword [ebp-14H]                    ; 492A _ 8B. 55, EC
        add     edx, 7                                  ; 492D _ 83. C2, 07
        lea     ecx, [edx*8]                            ; 4930 _ 8D. 0C D5, 00000000
        mov     edx, dword [ebp-10H]                    ; 4937 _ 8B. 55, F0
        add     edx, ecx                                ; 493A _ 01. CA
        mov     dword [esp+0CH], 137                    ; 493C _ C7. 44 24, 0C, 00000089
        mov     dword [esp+8H], eax                     ; 4944 _ 89. 44 24, 08
        mov     dword [esp+4H], 103                     ; 4948 _ C7. 44 24, 04, 00000067
        mov     dword [esp], edx                        ; 4950 _ 89. 14 24
        call    set_segmdesc                            ; 4953 _ E8, FFFFFFFC(rel)
        add     dword [ebp-14H], 1                      ; 4958 _ 83. 45, EC, 01
?_275:  cmp     dword [ebp-14H], 4                      ; 495C _ 83. 7D, EC, 04
        jle     ?_274                                   ; 4960 _ 0F 8E, FFFFFF71
        mov     dword [ebp-14H], 0                      ; 4966 _ C7. 45, EC, 00000000
        jmp     ?_277                                   ; 496D _ EB, 0F

?_276:  mov     eax, dword [ebp-14H]                    ; 496F _ 8B. 45, EC
        mov     dword [esp], eax                        ; 4972 _ 89. 04 24
        call    init_task_level                         ; 4975 _ E8, FFFFFFFC(rel)
        add     dword [ebp-14H], 1                      ; 497A _ 83. 45, EC, 01
?_277:  cmp     dword [ebp-14H], 2                      ; 497E _ 83. 7D, EC, 02
        jle     ?_276                                   ; 4982 _ 7E, EB
        call    task_alloc                              ; 4984 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 4989 _ 89. 45, F4
        mov     eax, dword [ebp-0CH]                    ; 498C _ 8B. 45, F4
        mov     dword [eax+4H], 2                       ; 498F _ C7. 40, 04, 00000002
        mov     eax, dword [ebp-0CH]                    ; 4996 _ 8B. 45, F4
        mov     dword [eax+8H], 100                     ; 4999 _ C7. 40, 08, 00000064
        mov     eax, dword [ebp-0CH]                    ; 49A0 _ 8B. 45, F4
        mov     dword [eax+0CH], 0                      ; 49A3 _ C7. 40, 0C, 00000000
        mov     eax, dword [ebp-0CH]                    ; 49AA _ 8B. 45, F4
        mov     dword [esp], eax                        ; 49AD _ 89. 04 24
        call    task_add                                ; 49B0 _ E8, FFFFFFFC(rel)
        call    task_switchsub                          ; 49B5 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 49BA _ 8B. 45, F4
        mov     eax, dword [eax]                        ; 49BD _ 8B. 00
        mov     dword [esp], eax                        ; 49BF _ 89. 04 24
        call    load_tr                                 ; 49C2 _ E8, FFFFFFFC(rel)
        call    timer_alloc                             ; 49C7 _ E8, FFFFFFFC(rel)
        mov     dword [task_timer], eax                 ; 49CC _ A3, 000022E4(d)
        mov     eax, dword [ebp-0CH]                    ; 49D1 _ 8B. 45, F4
        mov     eax, dword [eax+8H]                     ; 49D4 _ 8B. 40, 08
        mov     edx, eax                                ; 49D7 _ 89. C2
        mov     eax, dword [task_timer]                 ; 49D9 _ A1, 000022E4(d)
        mov     dword [esp+4H], edx                     ; 49DE _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 49E2 _ 89. 04 24
        call    timer_settime                           ; 49E5 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 49EA _ 8B. 45, F4
        leave                                           ; 49ED _ C9
        ret                                             ; 49EE _ C3
; task_init End of function

task_alloc:; Function begin
        push    ebp                                     ; 49EF _ 55
        mov     ebp, esp                                ; 49F0 _ 89. E5
        sub     esp, 16                                 ; 49F2 _ 83. EC, 10
        mov     dword [ebp-8H], 0                       ; 49F5 _ C7. 45, F8, 00000000
        jmp     ?_280                                   ; 49FC _ E9, 00000100

?_278:  mov     edx, dword [taskctl]                    ; 4A01 _ 8B. 15, 000022E8(d)
        mov     eax, dword [ebp-8H]                     ; 4A07 _ 8B. 45, F8
        imul    eax, eax, 148                           ; 4A0A _ 69. C0, 00000094
        add     eax, edx                                ; 4A10 _ 01. D0
        add     eax, 72                                 ; 4A12 _ 83. C0, 48
        mov     eax, dword [eax]                        ; 4A15 _ 8B. 00
        test    eax, eax                                ; 4A17 _ 85. C0
        jne     ?_279                                   ; 4A19 _ 0F 85, 000000DE
        mov     eax, dword [taskctl]                    ; 4A1F _ A1, 000022E8(d)
        mov     edx, dword [ebp-8H]                     ; 4A24 _ 8B. 55, F8
        imul    edx, edx, 148                           ; 4A27 _ 69. D2, 00000094
        add     edx, 64                                 ; 4A2D _ 83. C2, 40
        add     eax, edx                                ; 4A30 _ 01. D0
        add     eax, 4                                  ; 4A32 _ 83. C0, 04
        mov     dword [ebp-4H], eax                     ; 4A35 _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 4A38 _ 8B. 45, FC
        mov     dword [eax+4H], 1                       ; 4A3B _ C7. 40, 04, 00000001
        mov     eax, dword [ebp-4H]                     ; 4A42 _ 8B. 45, FC
        mov     dword [eax+50H], 514                    ; 4A45 _ C7. 40, 50, 00000202
        mov     eax, dword [ebp-4H]                     ; 4A4C _ 8B. 45, FC
        mov     dword [eax+54H], 0                      ; 4A4F _ C7. 40, 54, 00000000
        mov     eax, dword [ebp-4H]                     ; 4A56 _ 8B. 45, FC
        mov     dword [eax+58H], 0                      ; 4A59 _ C7. 40, 58, 00000000
        mov     eax, dword [ebp-4H]                     ; 4A60 _ 8B. 45, FC
        mov     dword [eax+5CH], 0                      ; 4A63 _ C7. 40, 5C, 00000000
        mov     eax, dword [ebp-4H]                     ; 4A6A _ 8B. 45, FC
        mov     dword [eax+60H], 0                      ; 4A6D _ C7. 40, 60, 00000000
        mov     eax, dword [ebp-4H]                     ; 4A74 _ 8B. 45, FC
        mov     dword [eax+68H], 0                      ; 4A77 _ C7. 40, 68, 00000000
        mov     eax, dword [ebp-8H]                     ; 4A7E _ 8B. 45, F8
        add     eax, 1                                  ; 4A81 _ 83. C0, 01
        shl     eax, 9                                  ; 4A84 _ C1. E0, 09
        mov     edx, eax                                ; 4A87 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 4A89 _ 8B. 45, FC
        mov     dword [eax+64H], edx                    ; 4A8C _ 89. 50, 64
        mov     eax, dword [ebp-4H]                     ; 4A8F _ 8B. 45, FC
        mov     dword [eax+6CH], 0                      ; 4A92 _ C7. 40, 6C, 00000000
        mov     eax, dword [ebp-4H]                     ; 4A99 _ 8B. 45, FC
        mov     dword [eax+70H], 0                      ; 4A9C _ C7. 40, 70, 00000000
        mov     eax, dword [ebp-4H]                     ; 4AA3 _ 8B. 45, FC
        mov     dword [eax+74H], 0                      ; 4AA6 _ C7. 40, 74, 00000000
        mov     eax, dword [ebp-4H]                     ; 4AAD _ 8B. 45, FC
        mov     dword [eax+80H], 0                      ; 4AB0 _ C7. 80, 00000080, 00000000
        mov     eax, dword [ebp-4H]                     ; 4ABA _ 8B. 45, FC
        mov     dword [eax+84H], 0                      ; 4ABD _ C7. 80, 00000084, 00000000
        mov     eax, dword [ebp-4H]                     ; 4AC7 _ 8B. 45, FC
        mov     dword [eax+88H], 0                      ; 4ACA _ C7. 80, 00000088, 00000000
        mov     eax, dword [ebp-4H]                     ; 4AD4 _ 8B. 45, FC
        mov     dword [eax+34H], 0                      ; 4AD7 _ C7. 40, 34, 00000000
        mov     eax, dword [ebp-4H]                     ; 4ADE _ 8B. 45, FC
        mov     dword [eax+8CH], 0                      ; 4AE1 _ C7. 80, 0000008C, 00000000
        mov     eax, dword [ebp-4H]                     ; 4AEB _ 8B. 45, FC
        mov     dword [eax+90H], 1073741824             ; 4AEE _ C7. 80, 00000090, 40000000
        mov     eax, dword [ebp-4H]                     ; 4AF8 _ 8B. 45, FC
        jmp     ?_281                                   ; 4AFB _ EB, 13

?_279:  add     dword [ebp-8H], 1                       ; 4AFD _ 83. 45, F8, 01
?_280:  cmp     dword [ebp-8H], 4                       ; 4B01 _ 83. 7D, F8, 04
        jle     ?_278                                   ; 4B05 _ 0F 8E, FFFFFEF6
        mov     eax, 0                                  ; 4B0B _ B8, 00000000
?_281:  leave                                           ; 4B10 _ C9
        ret                                             ; 4B11 _ C3
; task_alloc End of function

task_run:; Function begin
        push    ebp                                     ; 4B12 _ 55
        mov     ebp, esp                                ; 4B13 _ 89. E5
        sub     esp, 24                                 ; 4B15 _ 83. EC, 18
        cmp     dword [ebp+0CH], 0                      ; 4B18 _ 83. 7D, 0C, 00
        jns     ?_282                                   ; 4B1C _ 79, 09
        mov     eax, dword [ebp+8H]                     ; 4B1E _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 4B21 _ 8B. 40, 0C
        mov     dword [ebp+0CH], eax                    ; 4B24 _ 89. 45, 0C
?_282:  cmp     dword [ebp+10H], 0                      ; 4B27 _ 83. 7D, 10, 00
        jle     ?_283                                   ; 4B2B _ 7E, 09
        mov     eax, dword [ebp+8H]                     ; 4B2D _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 4B30 _ 8B. 55, 10
        mov     dword [eax+8H], edx                     ; 4B33 _ 89. 50, 08
?_283:  mov     eax, dword [ebp+8H]                     ; 4B36 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 4B39 _ 8B. 40, 04
        cmp     eax, 2                                  ; 4B3C _ 83. F8, 02
        jnz     ?_284                                   ; 4B3F _ 75, 16
        mov     eax, dword [ebp+8H]                     ; 4B41 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 4B44 _ 8B. 40, 0C
        cmp     eax, dword [ebp+0CH]                    ; 4B47 _ 3B. 45, 0C
        jz      ?_284                                   ; 4B4A _ 74, 0B
        mov     eax, dword [ebp+8H]                     ; 4B4C _ 8B. 45, 08
        mov     dword [esp], eax                        ; 4B4F _ 89. 04 24
        call    task_remove                             ; 4B52 _ E8, FFFFFFFC(rel)
?_284:  mov     eax, dword [ebp+8H]                     ; 4B57 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 4B5A _ 8B. 40, 04
        cmp     eax, 2                                  ; 4B5D _ 83. F8, 02
        jz      ?_285                                   ; 4B60 _ 74, 14
        mov     eax, dword [ebp+8H]                     ; 4B62 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 4B65 _ 8B. 55, 0C
        mov     dword [eax+0CH], edx                    ; 4B68 _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 4B6B _ 8B. 45, 08
        mov     dword [esp], eax                        ; 4B6E _ 89. 04 24
        call    task_add                                ; 4B71 _ E8, FFFFFFFC(rel)
?_285:  mov     eax, dword [taskctl]                    ; 4B76 _ A1, 000022E8(d)
        mov     dword [eax+4H], 1                       ; 4B7B _ C7. 40, 04, 00000001
        nop                                             ; 4B82 _ 90
        leave                                           ; 4B83 _ C9
        ret                                             ; 4B84 _ C3
; task_run End of function

task_switch:; Function begin
        push    ebp                                     ; 4B85 _ 55
        mov     ebp, esp                                ; 4B86 _ 89. E5
        sub     esp, 40                                 ; 4B88 _ 83. EC, 28
        mov     ecx, dword [taskctl]                    ; 4B8B _ 8B. 0D, 000022E8(d)
        mov     eax, dword [taskctl]                    ; 4B91 _ A1, 000022E8(d)
        mov     edx, dword [eax]                        ; 4B96 _ 8B. 10
        mov     eax, edx                                ; 4B98 _ 89. D0
        shl     eax, 2                                  ; 4B9A _ C1. E0, 02
        add     eax, edx                                ; 4B9D _ 01. D0
        shl     eax, 2                                  ; 4B9F _ C1. E0, 02
        add     eax, ecx                                ; 4BA2 _ 01. C8
        add     eax, 8                                  ; 4BA4 _ 83. C0, 08
        mov     dword [ebp-14H], eax                    ; 4BA7 _ 89. 45, EC
        mov     eax, dword [ebp-14H]                    ; 4BAA _ 8B. 45, EC
        mov     edx, dword [eax+4H]                     ; 4BAD _ 8B. 50, 04
        mov     eax, dword [ebp-14H]                    ; 4BB0 _ 8B. 45, EC
        mov     eax, dword [eax+edx*4+8H]               ; 4BB3 _ 8B. 44 90, 08
        mov     dword [ebp-10H], eax                    ; 4BB7 _ 89. 45, F0
        mov     eax, dword [ebp-14H]                    ; 4BBA _ 8B. 45, EC
        mov     eax, dword [eax+4H]                     ; 4BBD _ 8B. 40, 04
        lea     edx, [eax+1H]                           ; 4BC0 _ 8D. 50, 01
        mov     eax, dword [ebp-14H]                    ; 4BC3 _ 8B. 45, EC
        mov     dword [eax+4H], edx                     ; 4BC6 _ 89. 50, 04
        mov     eax, dword [ebp-14H]                    ; 4BC9 _ 8B. 45, EC
        mov     edx, dword [eax+4H]                     ; 4BCC _ 8B. 50, 04
        mov     eax, dword [ebp-14H]                    ; 4BCF _ 8B. 45, EC
        mov     eax, dword [eax]                        ; 4BD2 _ 8B. 00
        cmp     edx, eax                                ; 4BD4 _ 39. C2
        jnz     ?_286                                   ; 4BD6 _ 75, 0A
        mov     eax, dword [ebp-14H]                    ; 4BD8 _ 8B. 45, EC
        mov     dword [eax+4H], 0                       ; 4BDB _ C7. 40, 04, 00000000
?_286:  mov     eax, dword [taskctl]                    ; 4BE2 _ A1, 000022E8(d)
        mov     eax, dword [eax+4H]                     ; 4BE7 _ 8B. 40, 04
        test    eax, eax                                ; 4BEA _ 85. C0
        jz      ?_287                                   ; 4BEC _ 74, 24
        call    task_switchsub                          ; 4BEE _ E8, FFFFFFFC(rel)
        mov     ecx, dword [taskctl]                    ; 4BF3 _ 8B. 0D, 000022E8(d)
        mov     eax, dword [taskctl]                    ; 4BF9 _ A1, 000022E8(d)
        mov     edx, dword [eax]                        ; 4BFE _ 8B. 10
        mov     eax, edx                                ; 4C00 _ 89. D0
        shl     eax, 2                                  ; 4C02 _ C1. E0, 02
        add     eax, edx                                ; 4C05 _ 01. D0
        shl     eax, 2                                  ; 4C07 _ C1. E0, 02
        add     eax, ecx                                ; 4C0A _ 01. C8
        add     eax, 8                                  ; 4C0C _ 83. C0, 08
        mov     dword [ebp-14H], eax                    ; 4C0F _ 89. 45, EC
?_287:  mov     eax, dword [ebp-14H]                    ; 4C12 _ 8B. 45, EC
        mov     edx, dword [eax+4H]                     ; 4C15 _ 8B. 50, 04
        mov     eax, dword [ebp-14H]                    ; 4C18 _ 8B. 45, EC
        mov     eax, dword [eax+edx*4+8H]               ; 4C1B _ 8B. 44 90, 08
        mov     dword [ebp-0CH], eax                    ; 4C1F _ 89. 45, F4
        mov     eax, dword [ebp-0CH]                    ; 4C22 _ 8B. 45, F4
        mov     eax, dword [eax+8H]                     ; 4C25 _ 8B. 40, 08
        mov     edx, eax                                ; 4C28 _ 89. C2
        mov     eax, dword [task_timer]                 ; 4C2A _ A1, 000022E4(d)
        mov     dword [esp+4H], edx                     ; 4C2F _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 4C33 _ 89. 04 24
        call    timer_settime                           ; 4C36 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 4C3B _ 8B. 45, F4
        cmp     eax, dword [ebp-10H]                    ; 4C3E _ 3B. 45, F0
        jz      ?_288                                   ; 4C41 _ 74, 1B
        cmp     dword [ebp-0CH], 0                      ; 4C43 _ 83. 7D, F4, 00
        jz      ?_288                                   ; 4C47 _ 74, 15
        mov     eax, dword [ebp-0CH]                    ; 4C49 _ 8B. 45, F4
        mov     eax, dword [eax]                        ; 4C4C _ 8B. 00
        mov     dword [esp+4H], eax                     ; 4C4E _ 89. 44 24, 04
        mov     dword [esp], 0                          ; 4C52 _ C7. 04 24, 00000000
        call    farjmp                                  ; 4C59 _ E8, FFFFFFFC(rel)
?_288:  nop                                             ; 4C5E _ 90
        leave                                           ; 4C5F _ C9
        ret                                             ; 4C60 _ C3
; task_switch End of function

task_sleep:; Function begin
        push    ebp                                     ; 4C61 _ 55
        mov     ebp, esp                                ; 4C62 _ 89. E5
        sub     esp, 40                                 ; 4C64 _ 83. EC, 28
        mov     dword [ebp-0CH], 0                      ; 4C67 _ C7. 45, F4, 00000000
        mov     dword [ebp-10H], 0                      ; 4C6E _ C7. 45, F0, 00000000
        mov     eax, dword [ebp+8H]                     ; 4C75 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 4C78 _ 8B. 40, 04
        cmp     eax, 2                                  ; 4C7B _ 83. F8, 02
        jnz     ?_289                                   ; 4C7E _ 75, 51
        call    task_now                                ; 4C80 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 4C85 _ 89. 45, F4
        mov     eax, dword [ebp+8H]                     ; 4C88 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 4C8B _ 89. 04 24
        call    task_remove                             ; 4C8E _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], 1                      ; 4C93 _ C7. 45, F0, 00000001
        mov     eax, dword [ebp+8H]                     ; 4C9A _ 8B. 45, 08
        cmp     eax, dword [ebp-0CH]                    ; 4C9D _ 3B. 45, F4
        jnz     ?_289                                   ; 4CA0 _ 75, 2F
        call    task_switchsub                          ; 4CA2 _ E8, FFFFFFFC(rel)
        call    task_now                                ; 4CA7 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 4CAC _ 89. 45, F4
        mov     dword [ebp-10H], 2                      ; 4CAF _ C7. 45, F0, 00000002
        cmp     dword [ebp-0CH], 0                      ; 4CB6 _ 83. 7D, F4, 00
        jz      ?_289                                   ; 4CBA _ 74, 15
        mov     eax, dword [ebp-0CH]                    ; 4CBC _ 8B. 45, F4
        mov     eax, dword [eax]                        ; 4CBF _ 8B. 00
        mov     dword [esp+4H], eax                     ; 4CC1 _ 89. 44 24, 04
        mov     dword [esp], 0                          ; 4CC5 _ C7. 04 24, 00000000
        call    farjmp                                  ; 4CCC _ E8, FFFFFFFC(rel)
?_289:  mov     eax, dword [ebp-10H]                    ; 4CD1 _ 8B. 45, F0
        leave                                           ; 4CD4 _ C9
        ret                                             ; 4CD5 _ C3
; task_sleep End of function

task_now:; Function begin
        push    ebp                                     ; 4CD6 _ 55
        mov     ebp, esp                                ; 4CD7 _ 89. E5
        sub     esp, 16                                 ; 4CD9 _ 83. EC, 10
        mov     ecx, dword [taskctl]                    ; 4CDC _ 8B. 0D, 000022E8(d)
        mov     eax, dword [taskctl]                    ; 4CE2 _ A1, 000022E8(d)
        mov     edx, dword [eax]                        ; 4CE7 _ 8B. 10
        mov     eax, edx                                ; 4CE9 _ 89. D0
        shl     eax, 2                                  ; 4CEB _ C1. E0, 02
        add     eax, edx                                ; 4CEE _ 01. D0
        shl     eax, 2                                  ; 4CF0 _ C1. E0, 02
        add     eax, ecx                                ; 4CF3 _ 01. C8
        add     eax, 8                                  ; 4CF5 _ 83. C0, 08
        mov     dword [ebp-4H], eax                     ; 4CF8 _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 4CFB _ 8B. 45, FC
        mov     edx, dword [eax+4H]                     ; 4CFE _ 8B. 50, 04
        mov     eax, dword [ebp-4H]                     ; 4D01 _ 8B. 45, FC
        mov     eax, dword [eax+edx*4+8H]               ; 4D04 _ 8B. 44 90, 08
        leave                                           ; 4D08 _ C9
        ret                                             ; 4D09 _ C3
; task_now End of function

task_add:; Function begin
        push    ebp                                     ; 4D0A _ 55
        mov     ebp, esp                                ; 4D0B _ 89. E5
        sub     esp, 16                                 ; 4D0D _ 83. EC, 10
        mov     ecx, dword [taskctl]                    ; 4D10 _ 8B. 0D, 000022E8(d)
        mov     eax, dword [ebp+8H]                     ; 4D16 _ 8B. 45, 08
        mov     edx, dword [eax+0CH]                    ; 4D19 _ 8B. 50, 0C
        mov     eax, edx                                ; 4D1C _ 89. D0
        shl     eax, 2                                  ; 4D1E _ C1. E0, 02
        add     eax, edx                                ; 4D21 _ 01. D0
        shl     eax, 2                                  ; 4D23 _ C1. E0, 02
        add     eax, ecx                                ; 4D26 _ 01. C8
        add     eax, 8                                  ; 4D28 _ 83. C0, 08
        mov     dword [ebp-4H], eax                     ; 4D2B _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 4D2E _ 8B. 45, FC
        mov     edx, dword [eax]                        ; 4D31 _ 8B. 10
        mov     eax, dword [ebp-4H]                     ; 4D33 _ 8B. 45, FC
        mov     ecx, dword [ebp+8H]                     ; 4D36 _ 8B. 4D, 08
        mov     dword [eax+edx*4+8H], ecx               ; 4D39 _ 89. 4C 90, 08
        mov     eax, dword [ebp-4H]                     ; 4D3D _ 8B. 45, FC
        mov     eax, dword [eax]                        ; 4D40 _ 8B. 00
        lea     edx, [eax+1H]                           ; 4D42 _ 8D. 50, 01
        mov     eax, dword [ebp-4H]                     ; 4D45 _ 8B. 45, FC
        mov     dword [eax], edx                        ; 4D48 _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 4D4A _ 8B. 45, 08
        mov     dword [eax+4H], 2                       ; 4D4D _ C7. 40, 04, 00000002
        nop                                             ; 4D54 _ 90
        leave                                           ; 4D55 _ C9
        ret                                             ; 4D56 _ C3
; task_add End of function

task_remove:; Function begin
        push    ebp                                     ; 4D57 _ 55
        mov     ebp, esp                                ; 4D58 _ 89. E5
        sub     esp, 16                                 ; 4D5A _ 83. EC, 10
        mov     ecx, dword [taskctl]                    ; 4D5D _ 8B. 0D, 000022E8(d)
        mov     eax, dword [ebp+8H]                     ; 4D63 _ 8B. 45, 08
        mov     edx, dword [eax+0CH]                    ; 4D66 _ 8B. 50, 0C
        mov     eax, edx                                ; 4D69 _ 89. D0
        shl     eax, 2                                  ; 4D6B _ C1. E0, 02
        add     eax, edx                                ; 4D6E _ 01. D0
        shl     eax, 2                                  ; 4D70 _ C1. E0, 02
        add     eax, ecx                                ; 4D73 _ 01. C8
        add     eax, 8                                  ; 4D75 _ 83. C0, 08
        mov     dword [ebp-4H], eax                     ; 4D78 _ 89. 45, FC
        mov     dword [ebp-8H], 0                       ; 4D7B _ C7. 45, F8, 00000000
        jmp     ?_292                                   ; 4D82 _ EB, 23

?_290:  mov     eax, dword [ebp-4H]                     ; 4D84 _ 8B. 45, FC
        mov     edx, dword [ebp-8H]                     ; 4D87 _ 8B. 55, F8
        mov     eax, dword [eax+edx*4+8H]               ; 4D8A _ 8B. 44 90, 08
        cmp     eax, dword [ebp+8H]                     ; 4D8E _ 3B. 45, 08
        jnz     ?_291                                   ; 4D91 _ 75, 10
        mov     eax, dword [ebp-4H]                     ; 4D93 _ 8B. 45, FC
        mov     edx, dword [ebp-8H]                     ; 4D96 _ 8B. 55, F8
        mov     dword [eax+edx*4+8H], 0                 ; 4D99 _ C7. 44 90, 08, 00000000
        jmp     ?_293                                   ; 4DA1 _ EB, 0E

?_291:  add     dword [ebp-8H], 1                       ; 4DA3 _ 83. 45, F8, 01
?_292:  mov     eax, dword [ebp-4H]                     ; 4DA7 _ 8B. 45, FC
        mov     eax, dword [eax]                        ; 4DAA _ 8B. 00
        cmp     eax, dword [ebp-8H]                     ; 4DAC _ 3B. 45, F8
        jg      ?_290                                   ; 4DAF _ 7F, D3
?_293:  mov     eax, dword [ebp-4H]                     ; 4DB1 _ 8B. 45, FC
        mov     eax, dword [eax]                        ; 4DB4 _ 8B. 00
        lea     edx, [eax-1H]                           ; 4DB6 _ 8D. 50, FF
        mov     eax, dword [ebp-4H]                     ; 4DB9 _ 8B. 45, FC
        mov     dword [eax], edx                        ; 4DBC _ 89. 10
        mov     eax, dword [ebp-4H]                     ; 4DBE _ 8B. 45, FC
        mov     eax, dword [eax+4H]                     ; 4DC1 _ 8B. 40, 04
        cmp     eax, dword [ebp-8H]                     ; 4DC4 _ 3B. 45, F8
        jle     ?_294                                   ; 4DC7 _ 7E, 0F
        mov     eax, dword [ebp-4H]                     ; 4DC9 _ 8B. 45, FC
        mov     eax, dword [eax+4H]                     ; 4DCC _ 8B. 40, 04
        lea     edx, [eax-1H]                           ; 4DCF _ 8D. 50, FF
        mov     eax, dword [ebp-4H]                     ; 4DD2 _ 8B. 45, FC
        mov     dword [eax+4H], edx                     ; 4DD5 _ 89. 50, 04
?_294:  mov     eax, dword [ebp-4H]                     ; 4DD8 _ 8B. 45, FC
        mov     edx, dword [eax+4H]                     ; 4DDB _ 8B. 50, 04
        mov     eax, dword [ebp-4H]                     ; 4DDE _ 8B. 45, FC
        mov     eax, dword [eax]                        ; 4DE1 _ 8B. 00
        cmp     edx, eax                                ; 4DE3 _ 39. C2
        jl      ?_295                                   ; 4DE5 _ 7C, 0A
        mov     eax, dword [ebp-4H]                     ; 4DE7 _ 8B. 45, FC
        mov     dword [eax+4H], 0                       ; 4DEA _ C7. 40, 04, 00000000
?_295:  mov     eax, dword [ebp+8H]                     ; 4DF1 _ 8B. 45, 08
        mov     dword [eax+4H], 1                       ; 4DF4 _ C7. 40, 04, 00000001
        jmp     ?_297                                   ; 4DFB _ EB, 1B

?_296:  mov     eax, dword [ebp-8H]                     ; 4DFD _ 8B. 45, F8
        lea     edx, [eax+1H]                           ; 4E00 _ 8D. 50, 01
        mov     eax, dword [ebp-4H]                     ; 4E03 _ 8B. 45, FC
        mov     ecx, dword [eax+edx*4+8H]               ; 4E06 _ 8B. 4C 90, 08
        mov     eax, dword [ebp-4H]                     ; 4E0A _ 8B. 45, FC
        mov     edx, dword [ebp-8H]                     ; 4E0D _ 8B. 55, F8
        mov     dword [eax+edx*4+8H], ecx               ; 4E10 _ 89. 4C 90, 08
        add     dword [ebp-8H], 1                       ; 4E14 _ 83. 45, F8, 01
?_297:  mov     eax, dword [ebp-4H]                     ; 4E18 _ 8B. 45, FC
        mov     eax, dword [eax]                        ; 4E1B _ 8B. 00
        cmp     eax, dword [ebp-8H]                     ; 4E1D _ 3B. 45, F8
        jg      ?_296                                   ; 4E20 _ 7F, DB
        nop                                             ; 4E22 _ 90
        leave                                           ; 4E23 _ C9
        ret                                             ; 4E24 _ C3
; task_remove End of function

task_switchsub:; Function begin
        push    ebp                                     ; 4E25 _ 55
        mov     ebp, esp                                ; 4E26 _ 89. E5
        sub     esp, 16                                 ; 4E28 _ 83. EC, 10
        mov     dword [ebp-4H], 0                       ; 4E2B _ C7. 45, FC, 00000000
        jmp     ?_300                                   ; 4E32 _ EB, 24

?_298:  mov     ecx, dword [taskctl]                    ; 4E34 _ 8B. 0D, 000022E8(d)
        mov     edx, dword [ebp-4H]                     ; 4E3A _ 8B. 55, FC
        mov     eax, edx                                ; 4E3D _ 89. D0
        shl     eax, 2                                  ; 4E3F _ C1. E0, 02
        add     eax, edx                                ; 4E42 _ 01. D0
        shl     eax, 2                                  ; 4E44 _ C1. E0, 02
        add     eax, ecx                                ; 4E47 _ 01. C8
        add     eax, 8                                  ; 4E49 _ 83. C0, 08
        mov     eax, dword [eax]                        ; 4E4C _ 8B. 00
        test    eax, eax                                ; 4E4E _ 85. C0
        jle     ?_299                                   ; 4E50 _ 7E, 02
        jmp     ?_301                                   ; 4E52 _ EB, 0A

?_299:  add     dword [ebp-4H], 1                       ; 4E54 _ 83. 45, FC, 01
?_300:  cmp     dword [ebp-4H], 2                       ; 4E58 _ 83. 7D, FC, 02
        jle     ?_298                                   ; 4E5C _ 7E, D6
?_301:  mov     eax, dword [taskctl]                    ; 4E5E _ A1, 000022E8(d)
        mov     edx, dword [ebp-4H]                     ; 4E63 _ 8B. 55, FC
        mov     dword [eax], edx                        ; 4E66 _ 89. 10
        mov     eax, dword [taskctl]                    ; 4E68 _ A1, 000022E8(d)
        mov     dword [eax+4H], 0                       ; 4E6D _ C7. 40, 04, 00000000
        leave                                           ; 4E74 _ C9
        ret                                             ; 4E75 _ C3
; task_switchsub End of function

send_message:; Function begin
        push    ebp                                     ; 4E76 _ 55
        mov     ebp, esp                                ; 4E77 _ 89. E5
        sub     esp, 24                                 ; 4E79 _ 83. EC, 18
        mov     eax, dword [ebp+10H]                    ; 4E7C _ 8B. 45, 10
        movzx   eax, al                                 ; 4E7F _ 0F B6. C0
        mov     edx, dword [ebp+0CH]                    ; 4E82 _ 8B. 55, 0C
        add     edx, 16                                 ; 4E85 _ 83. C2, 10
        mov     dword [esp+4H], eax                     ; 4E88 _ 89. 44 24, 04
        mov     dword [esp], edx                        ; 4E8C _ 89. 14 24
        call    fifo8_put                               ; 4E8F _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 4E94 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 4E97 _ 89. 04 24
        call    task_sleep                              ; 4E9A _ E8, FFFFFFFC(rel)
        leave                                           ; 4E9F _ C9
        ret                                             ; 4EA0 _ C3
; send_message End of function



?_302:                                                  ; byte
        db 63H, 6FH, 75H, 6EH, 74H, 65H, 72H, 00H       ; 0000 _ counter.

?_303:                                                  ; byte
        db 6BH, 69H, 6CH, 6CH, 20H, 70H, 72H, 6FH       ; 0008 _ kill pro
        db 63H, 65H, 73H, 73H, 00H                      ; 0010 _ cess.

?_304:                                                  ; byte
        db 74H, 61H, 73H, 6BH, 5FH, 61H, 00H            ; 0015 _ task_a.

?_305:                                                  ; byte
        db 63H, 6FH, 6EH, 73H, 6FH, 6CH, 65H, 00H       ; 001C _ console.

?_306:                                                  ; byte
        db 20H, 00H                                     ; 0024 _  .

?_307:                                                  ; byte
        db 66H, 72H, 65H, 65H, 20H, 00H                 ; 0026 _ free .

?_308:                                                  ; byte
        db 20H, 4BH, 42H, 00H                           ; 002C _  KB.

?_309:                                                  ; byte
        db 3EH, 00H                                     ; 0030 _ >.

?_310:                                                  ; byte
        db 68H, 6CH, 74H, 2EH, 65H, 78H, 65H, 00H       ; 0032 _ hlt.exe.

?_311:                                                  ; byte
        db 6DH, 65H, 6DH, 00H                           ; 003A _ mem.

?_312:                                                  ; byte
        db 63H, 6CH, 73H, 00H                           ; 003E _ cls.

?_313:                                                  ; byte
        db 68H, 6CH, 74H, 00H                           ; 0042 _ hlt.

?_314:                                                  ; byte
        db 64H, 69H, 72H, 00H                           ; 0046 _ dir.

?_315:                                                  ; byte
        db 70H, 61H, 67H, 65H, 20H, 69H, 73H, 3AH       ; 004A _ page is:
        db 20H, 00H                                     ; 0052 _  .

?_316:                                                  ; byte
        db 42H, 61H, 73H, 65H, 41H, 64H, 64H, 72H       ; 0054 _ BaseAddr
        db 4CH, 3AH, 20H, 00H                           ; 005C _ L: .

?_317:                                                  ; byte
        db 42H, 61H, 73H, 65H, 41H, 64H, 64H, 72H       ; 0060 _ BaseAddr
        db 48H, 3AH, 20H, 00H                           ; 0068 _ H: .

?_318:                                                  ; byte
        db 6CH, 65H, 6EH, 67H, 74H, 68H, 4CH, 6FH       ; 006C _ lengthLo
        db 77H, 3AH, 20H, 00H                           ; 0074 _ w: .

?_319:                                                  ; byte
        db 49H, 4EH, 54H, 20H, 4FH, 43H, 00H            ; 0078 _ INT OC.

?_320:                                                  ; byte
        db 53H, 74H, 61H, 63H, 6BH, 20H, 45H, 78H       ; 007F _ Stack Ex
        db 63H, 65H, 70H, 74H, 69H, 6FH, 6EH, 00H       ; 0087 _ ception.

?_321:                                                  ; byte
        db 45H, 49H, 50H, 20H, 3DH, 20H, 00H            ; 008F _ EIP = .

?_322:                                                  ; byte
        db 49H, 4EH, 54H, 20H, 30H, 44H, 20H, 00H       ; 0096 _ INT 0D .

?_323:                                                  ; byte
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

?_324:  db 00H                                          ; 0112 _ .

?_325:  db 00H, 00H, 00H, 00H, 00H                      ; 0113 _ .....

KEY_CONTROL:                                            ; dword
        dd 0000001DH, 00000000H                         ; 0118 _ 29 0 

table_rgb.2006:                                         ; byte
        db 00H, 00H, 00H, 0FFH, 00H, 00H, 44H, 8CH      ; 0120 _ ......D.
        db 0BBH, 0FFH, 0FFH, 00H, 00H, 00H, 0FFH, 0FFH  ; 0128 _ ........
        db 00H, 0FFH, 00H, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH ; 0130 _ ........
        db 0C6H, 0C6H, 0C6H, 84H, 00H, 00H, 00H, 84H    ; 0138 _ ........
        db 00H, 84H, 84H, 00H, 00H, 00H, 84H, 84H       ; 0140 _ ........
        db 00H, 84H, 00H, 84H, 84H, 84H, 84H, 84H       ; 0148 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0150 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0158 _ ........

cursor.2053:                                            ; byte
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

closebtn.2172:                                          ; byte
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

?_326:  resd    1                                       ; 000C

?_327:  resd    1                                       ; 0010

?_328:  resd    1                                       ; 0014

?_329:  resb    1                                       ; 0018

?_330:  resb    3                                       ; 0019

bootInfo:                                               ; qword
        resb    4                                       ; 001C

?_331:  resw    1                                       ; 0020

?_332:  resw    1                                       ; 0022

keyinfo:                                                ; byte
        resb    24                                      ; 0024

?_333:  resd    1                                       ; 003C

mouseinfo:                                              ; byte
        resb    32                                      ; 0040

keybuf:                                                 ; yword
        resb    32                                      ; 0060

mousebuf:                                               ; byte
        resb    128                                     ; 0080

mdec:                                                   ; oword
        resb    12                                      ; 0100

?_334:  resd    1                                       ; 010C

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

buffer:                                                 ; qword
        resb    4                                       ; 0278

?_335:  resd    1                                       ; 027C

task_a.1796:                                            ; dword
        resd    8                                       ; 0280

tss_a.1795:                                             ; byte
        resb    128                                     ; 02A0

tss_b.1794:                                             ; byte
        resb    104                                     ; 0320

task_b.1784:                                            ; byte
        resb    12                                      ; 0388

str.2101:                                               ; byte
        resb    1                                       ; 0394

?_336:  resb    9                                       ; 0395

?_337:  resb    2                                       ; 039E

timerctl:                                               ; byte
        resd    2001                                    ; 03A0

task_timer:                                             ; dword
        resd    1                                       ; 22E4

taskctl: resd   1                                       ; 22E8


