; Disassembly of file: ckernel.o
; Tue Mar 24 09:59:24 2020
; Mode: 32 bits
; Syntax: YASM/NASM
; Instruction set: Pentium Pro






CMain:  ; Function begin
        push    ebp                                     ; 0000 _ 55
        mov     ebp, esp                                ; 0001 _ 89. E5
        push    ebx                                     ; 0003 _ 53
        sub     esp, 132                                ; 0004 _ 81. EC, 00000084
        mov     dword [esp], bootInfo                   ; 000A _ C7. 04 24, 00000024(d)
        call    initBootInfo                            ; 0011 _ E8, FFFFFFFC(rel)
        mov     eax, dword [bootInfo]                   ; 0016 _ A1, 00000024(d)
        mov     dword [ebp-1CH], eax                    ; 001B _ 89. 45, E4
        movzx   eax, word [?_380]                       ; 001E _ 0F B7. 05, 00000028(d)
        cwde                                            ; 0025 _ 98
        mov     dword [xsize], eax                      ; 0026 _ A3, 0000015C(d)
        movzx   eax, word [?_381]                       ; 002B _ 0F B7. 05, 0000002A(d)
        cwde                                            ; 0032 _ 98
        mov     dword [ysize], eax                      ; 0033 _ A3, 00000160(d)
        call    init_pit                                ; 0038 _ E8, FFFFFFFC(rel)
        mov     dword [esp+0CH], 0                      ; 003D _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], timerbuf                ; 0045 _ C7. 44 24, 08, 0000014C(d)
        mov     dword [esp+4H], 8                       ; 004D _ C7. 44 24, 04, 00000008
        mov     dword [esp], timerinfo                  ; 0055 _ C7. 04 24, 00000130(d)
        call    fifo8_init                              ; 005C _ E8, FFFFFFFC(rel)
        call    timer_alloc                             ; 0061 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-20H], eax                    ; 0066 _ 89. 45, E0
        mov     dword [esp+8H], 10                      ; 0069 _ C7. 44 24, 08, 0000000A
        mov     dword [esp+4H], timerinfo               ; 0071 _ C7. 44 24, 04, 00000130(d)
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
        mov     dword [esp+4H], timerinfo               ; 00A7 _ C7. 44 24, 04, 00000130(d)
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
        mov     dword [esp+4H], timerinfo               ; 00DD _ C7. 44 24, 04, 00000130(d)
        mov     eax, dword [ebp-28H]                    ; 00E5 _ 8B. 45, D8
        mov     dword [esp], eax                        ; 00E8 _ 89. 04 24
        call    timer_init                              ; 00EB _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 50                      ; 00F0 _ C7. 44 24, 04, 00000032
        mov     eax, dword [ebp-28H]                    ; 00F8 _ 8B. 45, D8
        mov     dword [esp], eax                        ; 00FB _ 89. 04 24
        call    timer_settime                           ; 00FE _ E8, FFFFFFFC(rel)
        mov     dword [esp+0CH], 0                      ; 0103 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], keybuf                  ; 010B _ C7. 44 24, 08, 00000080(d)
        mov     dword [esp+4H], 32                      ; 0113 _ C7. 44 24, 04, 00000020
        mov     dword [esp], keyinfo                    ; 011B _ C7. 04 24, 0000002C(d)
        call    fifo8_init                              ; 0122 _ E8, FFFFFFFC(rel)
        mov     dword [esp+0CH], 0                      ; 0127 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], mousebuf                ; 012F _ C7. 44 24, 08, 000000A0(d)
        mov     dword [esp+4H], 128                     ; 0137 _ C7. 44 24, 04, 00000080
        mov     dword [esp], mouseinfo                  ; 013F _ C7. 04 24, 00000048(d)
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
        mov     ecx, dword [ysize]                      ; 018F _ 8B. 0D, 00000160(d)
        mov     edx, dword [xsize]                      ; 0195 _ 8B. 15, 0000015C(d)
        mov     eax, dword [memman]                     ; 019B _ A1, 00000000(d)
        mov     dword [esp+0CH], ecx                    ; 01A0 _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 01A4 _ 89. 54 24, 08
        mov     edx, dword [ebp-1CH]                    ; 01A8 _ 8B. 55, E4
        mov     dword [esp+4H], edx                     ; 01AB _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 01AF _ 89. 04 24
        call    shtctl_init                             ; 01B2 _ E8, FFFFFFFC(rel)
        mov     dword [shtctl], eax                     ; 01B7 _ A3, 00000284(d)
        mov     eax, dword [shtctl]                     ; 01BC _ A1, 00000284(d)
        mov     dword [esp], eax                        ; 01C1 _ 89. 04 24
        call    sheet_alloc                             ; 01C4 _ E8, FFFFFFFC(rel)
        mov     dword [sht_back], eax                   ; 01C9 _ A3, 00000288(d)
        mov     eax, dword [shtctl]                     ; 01CE _ A1, 00000284(d)
        mov     dword [esp], eax                        ; 01D3 _ 89. 04 24
        call    sheet_alloc                             ; 01D6 _ E8, FFFFFFFC(rel)
        mov     dword [sht_mouse], eax                  ; 01DB _ A3, 0000028C(d)
        mov     edx, dword [xsize]                      ; 01E0 _ 8B. 15, 0000015C(d)
        mov     eax, dword [ysize]                      ; 01E6 _ A1, 00000160(d)
        imul    edx, eax                                ; 01EB _ 0F AF. D0
        mov     eax, dword [memman]                     ; 01EE _ A1, 00000000(d)
        mov     dword [esp+4H], edx                     ; 01F3 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 01F7 _ 89. 04 24
        call    memman_alloc_4k                         ; 01FA _ E8, FFFFFFFC(rel)
        mov     dword [buf_back], eax                   ; 01FF _ A3, 00000164(d)
        mov     ebx, dword [ysize]                      ; 0204 _ 8B. 1D, 00000160(d)
        mov     ecx, dword [xsize]                      ; 020A _ 8B. 0D, 0000015C(d)
        mov     edx, dword [buf_back]                   ; 0210 _ 8B. 15, 00000164(d)
        mov     eax, dword [sht_back]                   ; 0216 _ A1, 00000288(d)
        mov     dword [esp+10H], 99                     ; 021B _ C7. 44 24, 10, 00000063
        mov     dword [esp+0CH], ebx                    ; 0223 _ 89. 5C 24, 0C
        mov     dword [esp+8H], ecx                     ; 0227 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 022B _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 022F _ 89. 04 24
        call    sheet_setbuf                            ; 0232 _ E8, FFFFFFFC(rel)
        mov     eax, dword [sht_mouse]                  ; 0237 _ A1, 0000028C(d)
        mov     dword [esp+10H], 99                     ; 023C _ C7. 44 24, 10, 00000063
        mov     dword [esp+0CH], 16                     ; 0244 _ C7. 44 24, 0C, 00000010
        mov     dword [esp+8H], 16                      ; 024C _ C7. 44 24, 08, 00000010
        mov     dword [esp+4H], buf_mouse               ; 0254 _ C7. 44 24, 04, 00000180(d)
        mov     dword [esp], eax                        ; 025C _ 89. 04 24
        call    sheet_setbuf                            ; 025F _ E8, FFFFFFFC(rel)
        mov     ecx, dword [ysize]                      ; 0264 _ 8B. 0D, 00000160(d)
        mov     edx, dword [xsize]                      ; 026A _ 8B. 15, 0000015C(d)
        mov     eax, dword [buf_back]                   ; 0270 _ A1, 00000164(d)
        mov     dword [esp+8H], ecx                     ; 0275 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 0279 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 027D _ 89. 04 24
        call    init_screen8                            ; 0280 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 99                      ; 0285 _ C7. 44 24, 04, 00000063
        mov     dword [esp], buf_mouse                  ; 028D _ C7. 04 24, 00000180(d)
        call    init_mouse_cursor                       ; 0294 _ E8, FFFFFFFC(rel)
        mov     edx, dword [sht_back]                   ; 0299 _ 8B. 15, 00000288(d)
        mov     eax, dword [shtctl]                     ; 029F _ A1, 00000284(d)
        mov     dword [esp+0CH], 0                      ; 02A4 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 0                       ; 02AC _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], edx                     ; 02B4 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 02B8 _ 89. 04 24
        call    sheet_slide                             ; 02BB _ E8, FFFFFFFC(rel)
        mov     eax, dword [xsize]                      ; 02C0 _ A1, 0000015C(d)
        sub     eax, 16                                 ; 02C5 _ 83. E8, 10
        mov     edx, eax                                ; 02C8 _ 89. C2
        shr     edx, 31                                 ; 02CA _ C1. EA, 1F
        add     eax, edx                                ; 02CD _ 01. D0
        sar     eax, 1                                  ; 02CF _ D1. F8
        mov     dword [mx], eax                         ; 02D1 _ A3, 00000154(d)
        mov     eax, dword [ysize]                      ; 02D6 _ A1, 00000160(d)
        sub     eax, 44                                 ; 02DB _ 83. E8, 2C
        mov     edx, eax                                ; 02DE _ 89. C2
        shr     edx, 31                                 ; 02E0 _ C1. EA, 1F
        add     eax, edx                                ; 02E3 _ 01. D0
        sar     eax, 1                                  ; 02E5 _ D1. F8
        mov     dword [my], eax                         ; 02E7 _ A3, 00000158(d)
        mov     ebx, dword [my]                         ; 02EC _ 8B. 1D, 00000158(d)
        mov     ecx, dword [mx]                         ; 02F2 _ 8B. 0D, 00000154(d)
        mov     edx, dword [sht_mouse]                  ; 02F8 _ 8B. 15, 0000028C(d)
        mov     eax, dword [shtctl]                     ; 02FE _ A1, 00000284(d)
        mov     dword [esp+0CH], ebx                    ; 0303 _ 89. 5C 24, 0C
        mov     dword [esp+8H], ecx                     ; 0307 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 030B _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 030F _ 89. 04 24
        call    sheet_slide                             ; 0312 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], 8                      ; 0317 _ C7. 45, F4, 00000008
        mov     dword [ebp-10H], 7                      ; 031E _ C7. 45, F0, 00000007
        mov     eax, dword [shtctl]                     ; 0325 _ A1, 00000284(d)
        mov     dword [esp+4H], ?_349                   ; 032A _ C7. 44 24, 04, 00000000(d)
        mov     dword [esp], eax                        ; 0332 _ 89. 04 24
        call    message_box                             ; 0335 _ E8, FFFFFFFC(rel)
        mov     dword [shtMsgBox], eax                  ; 033A _ A3, 00000280(d)
        mov     edx, dword [sht_back]                   ; 033F _ 8B. 15, 00000288(d)
        mov     eax, dword [shtctl]                     ; 0345 _ A1, 00000284(d)
        mov     dword [esp+8H], 0                       ; 034A _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], edx                     ; 0352 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0356 _ 89. 04 24
        call    sheet_updown                            ; 0359 _ E8, FFFFFFFC(rel)
        mov     edx, dword [sht_mouse]                  ; 035E _ 8B. 15, 0000028C(d)
        mov     eax, dword [shtctl]                     ; 0364 _ A1, 00000284(d)
        mov     dword [esp+8H], 100                     ; 0369 _ C7. 44 24, 08, 00000064
        mov     dword [esp+4H], edx                     ; 0371 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0375 _ 89. 04 24
        call    sheet_updown                            ; 0378 _ E8, FFFFFFFC(rel)
        call    io_sti                                  ; 037D _ E8, FFFFFFFC(rel)
        mov     dword [esp], mdec                       ; 0382 _ C7. 04 24, 00000120(d)
        call    enable_mouse                            ; 0389 _ E8, FFFFFFFC(rel)
        mov     eax, dword [memman]                     ; 038E _ A1, 00000000(d)
        mov     dword [esp], eax                        ; 0393 _ 89. 04 24
        call    task_init                               ; 0396 _ E8, FFFFFFFC(rel)
        mov     dword [task_a.1806], eax                ; 039B _ A3, 000002A8(d)
        mov     eax, dword [task_a.1806]                ; 03A0 _ A1, 000002A8(d)
        mov     dword [?_382], eax                      ; 03A5 _ A3, 00000044(d)
        mov     eax, dword [task_a.1806]                ; 03AA _ A1, 000002A8(d)
        mov     dword [task_main], eax                  ; 03AF _ A3, 00000298(d)
        mov     eax, dword [task_a.1806]                ; 03B4 _ A1, 000002A8(d)
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
?_001:  mov     dword [esp], keyinfo                    ; 040A _ C7. 04 24, 0000002C(d)
        call    fifo8_status                            ; 0411 _ E8, FFFFFFFC(rel)
        mov     ebx, eax                                ; 0416 _ 89. C3
        mov     dword [esp], mouseinfo                  ; 0418 _ C7. 04 24, 00000048(d)
        call    fifo8_status                            ; 041F _ E8, FFFFFFFC(rel)
        add     ebx, eax                                ; 0424 _ 01. C3
        mov     dword [esp], timerinfo                  ; 0426 _ C7. 04 24, 00000130(d)
        call    fifo8_status                            ; 042D _ E8, FFFFFFFC(rel)
        add     eax, ebx                                ; 0432 _ 01. D8
        test    eax, eax                                ; 0434 _ 85. C0
        jnz     ?_002                                   ; 0436 _ 75, 0A
        call    io_sti                                  ; 0438 _ E8, FFFFFFFC(rel)
        jmp     ?_010                                   ; 043D _ E9, 000003AC

?_002:  mov     dword [esp], keyinfo                    ; 0442 _ C7. 04 24, 0000002C(d)
        call    fifo8_status                            ; 0449 _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 044E _ 85. C0
        je      ?_009                                   ; 0450 _ 0F 84, 00000367
        call    io_sti                                  ; 0456 _ E8, FFFFFFFC(rel)
        mov     dword [esp], keyinfo                    ; 045B _ C7. 04 24, 0000002C(d)
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
        mov     eax, dword [task_cons]                  ; 0488 _ A1, 00000294(d)
        mov     eax, dword [eax+34H]                    ; 048D _ 8B. 40, 34
        test    eax, eax                                ; 0490 _ 85. C0
        jz      ?_003                                   ; 0492 _ 74, 2E
        mov     dword [esp], ?_350                      ; 0494 _ C7. 04 24, 00000008(d)
        call    cons_putstr                             ; 049B _ E8, FFFFFFFC(rel)
        call    io_cli                                  ; 04A0 _ E8, FFFFFFFC(rel)
        call    get_code32_addr                         ; 04A5 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-50H], eax                    ; 04AA _ 89. 45, B0
        mov     eax, dword [task_cons]                  ; 04AD _ A1, 00000294(d)
        mov     edx, kill_process                       ; 04B2 _ BA, 00000000(d)
        sub     edx, dword [ebp-50H]                    ; 04B7 _ 2B. 55, B0
        mov     dword [eax+4CH], edx                    ; 04BA _ 89. 50, 4C
        call    io_sti                                  ; 04BD _ E8, FFFFFFFC(rel)
?_003:  cmp     dword [ebp-38H], 16                     ; 04C2 _ 83. 7D, C8, 10
        jnz     ?_004                                   ; 04C6 _ 75, 28
        mov     eax, dword [shtctl]                     ; 04C8 _ A1, 00000284(d)
        mov     eax, dword [eax+10H]                    ; 04CD _ 8B. 40, 10
        lea     ecx, [eax-1H]                           ; 04D0 _ 8D. 48, FF
        mov     eax, dword [shtctl]                     ; 04D3 _ A1, 00000284(d)
        mov     edx, dword [eax+18H]                    ; 04D8 _ 8B. 50, 18
        mov     eax, dword [shtctl]                     ; 04DB _ A1, 00000284(d)
        mov     dword [esp+8H], ecx                     ; 04E0 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 04E4 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 04E8 _ 89. 04 24
        call    sheet_updown                            ; 04EB _ E8, FFFFFFFC(rel)
?_004:  cmp     dword [ebp-38H], 15                     ; 04F0 _ 83. 7D, C8, 0F
        jne     ?_007                                   ; 04F4 _ 0F 85, 0000019A
        mov     dword [ebp-18H], -1                     ; 04FA _ C7. 45, E8, FFFFFFFF
        cmp     dword [ebp-14H], 0                      ; 0501 _ 83. 7D, EC, 00
        jne     ?_005                                   ; 0505 _ 0F 85, 00000089
        mov     dword [ebp-14H], 1                      ; 050B _ C7. 45, EC, 00000001
        mov     edx, dword [shtMsgBox]                  ; 0512 _ 8B. 15, 00000280(d)
        mov     eax, dword [shtctl]                     ; 0518 _ A1, 00000284(d)
        mov     dword [esp+0CH], 0                      ; 051D _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], ?_351                   ; 0525 _ C7. 44 24, 08, 00000015(d)
        mov     dword [esp+4H], edx                     ; 052D _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0531 _ 89. 04 24
        call    make_wtitle8                            ; 0534 _ E8, FFFFFFFC(rel)
        mov     eax, dword [shtctl]                     ; 0539 _ A1, 00000284(d)
        mov     dword [esp+0CH], 1                      ; 053E _ C7. 44 24, 0C, 00000001
        mov     dword [esp+8H], ?_352                   ; 0546 _ C7. 44 24, 08, 0000001C(d)
        mov     edx, dword [ebp-34H]                    ; 054E _ 8B. 55, CC
        mov     dword [esp+4H], edx                     ; 0551 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0555 _ 89. 04 24
        call    make_wtitle8                            ; 0558 _ E8, FFFFFFFC(rel)
        mov     edx, dword [shtMsgBox]                  ; 055D _ 8B. 15, 00000280(d)
        mov     eax, dword [shtctl]                     ; 0563 _ A1, 00000284(d)
        mov     dword [esp+10H], 7                      ; 0568 _ C7. 44 24, 10, 00000007
        mov     dword [esp+0CH], 28                     ; 0570 _ C7. 44 24, 0C, 0000001C
        mov     ecx, dword [ebp-0CH]                    ; 0578 _ 8B. 4D, F4
        mov     dword [esp+8H], ecx                     ; 057B _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 057F _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0583 _ 89. 04 24
        call    set_cursor                              ; 0586 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-18H], 87                     ; 058B _ C7. 45, E8, 00000057
        jmp     ?_006                                   ; 0592 _ EB, 71

?_005:  mov     dword [ebp-14H], 0                      ; 0594 _ C7. 45, EC, 00000000
        mov     edx, dword [shtMsgBox]                  ; 059B _ 8B. 15, 00000280(d)
        mov     eax, dword [shtctl]                     ; 05A1 _ A1, 00000284(d)
        mov     dword [esp+0CH], 1                      ; 05A6 _ C7. 44 24, 0C, 00000001
        mov     dword [esp+8H], ?_351                   ; 05AE _ C7. 44 24, 08, 00000015(d)
        mov     dword [esp+4H], edx                     ; 05B6 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 05BA _ 89. 04 24
        call    make_wtitle8                            ; 05BD _ E8, FFFFFFFC(rel)
        mov     eax, dword [shtctl]                     ; 05C2 _ A1, 00000284(d)
        mov     dword [esp+0CH], 0                      ; 05C7 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], ?_352                   ; 05CF _ C7. 44 24, 08, 0000001C(d)
        mov     edx, dword [ebp-34H]                    ; 05D7 _ 8B. 55, CC
        mov     dword [esp+4H], edx                     ; 05DA _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 05DE _ 89. 04 24
        call    make_wtitle8                            ; 05E1 _ E8, FFFFFFFC(rel)
        mov     eax, dword [task_cons]                  ; 05E6 _ A1, 00000294(d)
        add     eax, 16                                 ; 05EB _ 83. C0, 10
        mov     dword [esp+4H], 88                      ; 05EE _ C7. 44 24, 04, 00000058
        mov     dword [esp], eax                        ; 05F6 _ 89. 04 24
        call    fifo8_put                               ; 05F9 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-18H], 88                     ; 05FE _ C7. 45, E8, 00000058
?_006:  mov     eax, dword [shtMsgBox]                  ; 0605 _ A1, 00000280(d)
        mov     ecx, dword [eax+4H]                     ; 060A _ 8B. 48, 04
        mov     edx, dword [shtMsgBox]                  ; 060D _ 8B. 15, 00000280(d)
        mov     eax, dword [shtctl]                     ; 0613 _ A1, 00000284(d)
        mov     dword [esp+14H], 21                     ; 0618 _ C7. 44 24, 14, 00000015
        mov     dword [esp+10H], ecx                    ; 0620 _ 89. 4C 24, 10
        mov     dword [esp+0CH], 0                      ; 0624 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 0                       ; 062C _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], edx                     ; 0634 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0638 _ 89. 04 24
        call    sheet_refresh                           ; 063B _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-34H]                    ; 0640 _ 8B. 45, CC
        mov     edx, dword [eax+4H]                     ; 0643 _ 8B. 50, 04
        mov     eax, dword [shtctl]                     ; 0646 _ A1, 00000284(d)
        mov     dword [esp+14H], 21                     ; 064B _ C7. 44 24, 14, 00000015
        mov     dword [esp+10H], edx                    ; 0653 _ 89. 54 24, 10
        mov     dword [esp+0CH], 0                      ; 0657 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 0                       ; 065F _ C7. 44 24, 08, 00000000
        mov     edx, dword [ebp-34H]                    ; 0667 _ 8B. 55, CC
        mov     dword [esp+4H], edx                     ; 066A _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 066E _ 89. 04 24
        call    sheet_refresh                           ; 0671 _ E8, FFFFFFFC(rel)
        mov     edx, dword [task_cons]                  ; 0676 _ 8B. 15, 00000294(d)
        mov     eax, dword [task_a.1806]                ; 067C _ A1, 000002A8(d)
        mov     ecx, dword [ebp-18H]                    ; 0681 _ 8B. 4D, E8
        mov     dword [esp+8H], ecx                     ; 0684 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 0688 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 068C _ 89. 04 24
        call    send_message                            ; 068F _ E8, FFFFFFFC(rel)
?_007:  cmp     dword [ebp-14H], 0                      ; 0694 _ 83. 7D, EC, 00
        jne     ?_008                                   ; 0698 _ 0F 85, 000000D6
        mov     eax, dword [ebp-38H]                    ; 069E _ 8B. 45, C8
        mov     dword [esp], eax                        ; 06A1 _ 89. 04 24
        call    transferScanCode                        ; 06A4 _ E8, FFFFFFFC(rel)
        test    al, al                                  ; 06A9 _ 84. C0
        je      ?_010                                   ; 06AB _ 0F 84, 0000013D
        cmp     dword [ebp-0CH], 143                    ; 06B1 _ 81. 7D, F4, 0000008F
        jg      ?_010                                   ; 06B8 _ 0F 8F, 00000130
        mov     edx, dword [shtMsgBox]                  ; 06BE _ 8B. 15, 00000280(d)
        mov     eax, dword [shtctl]                     ; 06C4 _ A1, 00000284(d)
        mov     dword [esp+10H], 7                      ; 06C9 _ C7. 44 24, 10, 00000007
        mov     dword [esp+0CH], 28                     ; 06D1 _ C7. 44 24, 0C, 0000001C
        mov     ecx, dword [ebp-0CH]                    ; 06D9 _ 8B. 4D, F4
        mov     dword [esp+8H], ecx                     ; 06DC _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 06E0 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 06E4 _ 89. 04 24
        call    set_cursor                              ; 06E7 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-38H]                    ; 06EC _ 8B. 45, C8
        mov     dword [esp], eax                        ; 06EF _ 89. 04 24
        call    transferScanCode                        ; 06F2 _ E8, FFFFFFFC(rel)
        mov     byte [ebp-51H], al                      ; 06F7 _ 88. 45, AF
        movzx   eax, byte [ebp-51H]                     ; 06FA _ 0F B6. 45, AF
        mov     byte [ebp-66H], al                      ; 06FE _ 88. 45, 9A
        mov     byte [ebp-65H], 0                       ; 0701 _ C6. 45, 9B, 00
        mov     edx, dword [shtMsgBox]                  ; 0705 _ 8B. 15, 00000280(d)
        mov     eax, dword [shtctl]                     ; 070B _ A1, 00000284(d)
        lea     ecx, [ebp-66H]                          ; 0710 _ 8D. 4D, 9A
        mov     dword [esp+14H], ecx                    ; 0713 _ 89. 4C 24, 14
        mov     dword [esp+10H], 0                      ; 0717 _ C7. 44 24, 10, 00000000
        mov     dword [esp+0CH], 28                     ; 071F _ C7. 44 24, 0C, 0000001C
        mov     ecx, dword [ebp-0CH]                    ; 0727 _ 8B. 4D, F4
        mov     dword [esp+8H], ecx                     ; 072A _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 072E _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0732 _ 89. 04 24
        call    showString                              ; 0735 _ E8, FFFFFFFC(rel)
        add     dword [ebp-0CH], 8                      ; 073A _ 83. 45, F4, 08
        mov     dword [ebp-48H], 1                      ; 073E _ C7. 45, B8, 00000001
        mov     edx, dword [shtMsgBox]                  ; 0745 _ 8B. 15, 00000280(d)
        mov     eax, dword [shtctl]                     ; 074B _ A1, 00000284(d)
        mov     ecx, dword [ebp-10H]                    ; 0750 _ 8B. 4D, F0
        mov     dword [esp+10H], ecx                    ; 0753 _ 89. 4C 24, 10
        mov     dword [esp+0CH], 28                     ; 0757 _ C7. 44 24, 0C, 0000001C
        mov     ecx, dword [ebp-0CH]                    ; 075F _ 8B. 4D, F4
        mov     dword [esp+8H], ecx                     ; 0762 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 0766 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 076A _ 89. 04 24
        call    set_cursor                              ; 076D _ E8, FFFFFFFC(rel)
        jmp     ?_010                                   ; 0772 _ EB, 7A

?_008:  mov     eax, dword [ebp-38H]                    ; 0774 _ 8B. 45, C8
        mov     dword [esp], eax                        ; 0777 _ 89. 04 24
        call    isSpecialKey                            ; 077A _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 077F _ 85. C0
        jnz     ?_010                                   ; 0781 _ 75, 6B
        mov     eax, dword [ebp-38H]                    ; 0783 _ 8B. 45, C8
        movzx   eax, al                                 ; 0786 _ 0F B6. C0
        mov     edx, dword [task_cons]                  ; 0789 _ 8B. 15, 00000294(d)
        add     edx, 16                                 ; 078F _ 83. C2, 10
        mov     dword [esp+4H], eax                     ; 0792 _ 89. 44 24, 04
        mov     dword [esp], edx                        ; 0796 _ 89. 14 24
        call    fifo8_put                               ; 0799 _ E8, FFFFFFFC(rel)
        mov     dword [esp], keyinfo                    ; 079E _ C7. 04 24, 0000002C(d)
        call    fifo8_status                            ; 07A5 _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 07AA _ 85. C0
        jnz     ?_010                                   ; 07AC _ 75, 40
        mov     eax, dword [task_a.1806]                ; 07AE _ A1, 000002A8(d)
        mov     dword [esp], eax                        ; 07B3 _ 89. 04 24
        call    task_sleep                              ; 07B6 _ E8, FFFFFFFC(rel)
        jmp     ?_010                                   ; 07BB _ EB, 31

?_009:  mov     dword [esp], mouseinfo                  ; 07BD _ C7. 04 24, 00000048(d)
        call    fifo8_status                            ; 07C4 _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 07C9 _ 85. C0
        jz      ?_010                                   ; 07CB _ 74, 21
        mov     ecx, dword [sht_mouse]                  ; 07CD _ 8B. 0D, 0000028C(d)
        mov     edx, dword [sht_back]                   ; 07D3 _ 8B. 15, 00000288(d)
        mov     eax, dword [shtctl]                     ; 07D9 _ A1, 00000284(d)
        mov     dword [esp+8H], ecx                     ; 07DE _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 07E2 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 07E6 _ 89. 04 24
        call    show_mouse_info                         ; 07E9 _ E8, FFFFFFFC(rel)
?_010:  mov     dword [esp], timerinfo                  ; 07EE _ C7. 04 24, 00000130(d)
        call    fifo8_status                            ; 07F5 _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 07FA _ 85. C0
        je      ?_014                                   ; 07FC _ 0F 84, 000000DB
        call    io_sti                                  ; 0802 _ E8, FFFFFFFC(rel)
        mov     dword [esp], timerinfo                  ; 0807 _ C7. 04 24, 00000130(d)
        call    fifo8_get                               ; 080E _ E8, FFFFFFFC(rel)
        mov     dword [ebp-58H], eax                    ; 0813 _ 89. 45, A8
        cmp     dword [ebp-58H], 0                      ; 0816 _ 83. 7D, A8, 00
        jz      ?_011                                   ; 081A _ 74, 24
        mov     dword [esp+8H], 0                       ; 081C _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], timerinfo               ; 0824 _ C7. 44 24, 04, 00000130(d)
        mov     eax, dword [ebp-28H]                    ; 082C _ 8B. 45, D8
        mov     dword [esp], eax                        ; 082F _ 89. 04 24
        call    timer_init                              ; 0832 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], 0                      ; 0837 _ C7. 45, F0, 00000000
        jmp     ?_012                                   ; 083E _ EB, 22

?_011:  mov     dword [esp+8H], 1                       ; 0840 _ C7. 44 24, 08, 00000001
        mov     dword [esp+4H], timerinfo               ; 0848 _ C7. 44 24, 04, 00000130(d)
        mov     eax, dword [ebp-28H]                    ; 0850 _ 8B. 45, D8
        mov     dword [esp], eax                        ; 0853 _ 89. 04 24
        call    timer_init                              ; 0856 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], 7                      ; 085B _ C7. 45, F0, 00000007
?_012:  mov     dword [esp+4H], 50                      ; 0862 _ C7. 44 24, 04, 00000032
        mov     eax, dword [ebp-28H]                    ; 086A _ 8B. 45, D8
        mov     dword [esp], eax                        ; 086D _ 89. 04 24
        call    timer_settime                           ; 0870 _ E8, FFFFFFFC(rel)
        cmp     dword [ebp-14H], 0                      ; 0875 _ 83. 7D, EC, 00
        jnz     ?_013                                   ; 0879 _ 75, 2F
        mov     edx, dword [shtMsgBox]                  ; 087B _ 8B. 15, 00000280(d)
        mov     eax, dword [shtctl]                     ; 0881 _ A1, 00000284(d)
        mov     ecx, dword [ebp-10H]                    ; 0886 _ 8B. 4D, F0
        mov     dword [esp+10H], ecx                    ; 0889 _ 89. 4C 24, 10
        mov     dword [esp+0CH], 28                     ; 088D _ C7. 44 24, 0C, 0000001C
        mov     ecx, dword [ebp-0CH]                    ; 0895 _ 8B. 4D, F4
        mov     dword [esp+8H], ecx                     ; 0898 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 089C _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 08A0 _ 89. 04 24
        call    set_cursor                              ; 08A3 _ E8, FFFFFFFC(rel)
        jmp     ?_014                                   ; 08A8 _ EB, 33

?_013:  mov     edx, dword [shtMsgBox]                  ; 08AA _ 8B. 15, 00000280(d)
        mov     eax, dword [shtctl]                     ; 08B0 _ A1, 00000284(d)
        mov     dword [esp+10H], 7                      ; 08B5 _ C7. 44 24, 10, 00000007
        mov     dword [esp+0CH], 28                     ; 08BD _ C7. 44 24, 0C, 0000001C
        mov     ecx, dword [ebp-0CH]                    ; 08C5 _ 8B. 4D, F4
        mov     dword [esp+8H], ecx                     ; 08C8 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 08CC _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 08D0 _ 89. 04 24
        call    set_cursor                              ; 08D3 _ E8, FFFFFFFC(rel)
        jmp     ?_001                                   ; 08D8 _ E9, FFFFFB2D

?_014:  jmp     ?_001                                   ; 08DD _ E9, FFFFFB28
; CMain End of function

set_cursor:; Function begin
        push    ebp                                     ; 08E2 _ 55
        mov     ebp, esp                                ; 08E3 _ 89. E5
        push    esi                                     ; 08E5 _ 56
        push    ebx                                     ; 08E6 _ 53
        sub     esp, 32                                 ; 08E7 _ 83. EC, 20
        mov     eax, dword [ebp+14H]                    ; 08EA _ 8B. 45, 14
        lea     esi, [eax+0FH]                          ; 08ED _ 8D. 70, 0F
        mov     eax, dword [ebp+10H]                    ; 08F0 _ 8B. 45, 10
        lea     ebx, [eax+7H]                           ; 08F3 _ 8D. 58, 07
        mov     eax, dword [ebp+18H]                    ; 08F6 _ 8B. 45, 18
        movzx   ecx, al                                 ; 08F9 _ 0F B6. C8
        mov     eax, dword [ebp+0CH]                    ; 08FC _ 8B. 45, 0C
        mov     edx, dword [eax+4H]                     ; 08FF _ 8B. 50, 04
        mov     eax, dword [ebp+0CH]                    ; 0902 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 0905 _ 8B. 00
        mov     dword [esp+18H], esi                    ; 0907 _ 89. 74 24, 18
        mov     dword [esp+14H], ebx                    ; 090B _ 89. 5C 24, 14
        mov     ebx, dword [ebp+14H]                    ; 090F _ 8B. 5D, 14
        mov     dword [esp+10H], ebx                    ; 0912 _ 89. 5C 24, 10
        mov     ebx, dword [ebp+10H]                    ; 0916 _ 8B. 5D, 10
        mov     dword [esp+0CH], ebx                    ; 0919 _ 89. 5C 24, 0C
        mov     dword [esp+8H], ecx                     ; 091D _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 0921 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0925 _ 89. 04 24
        call    boxfill8                                ; 0928 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+14H]                    ; 092D _ 8B. 45, 14
        lea     edx, [eax+10H]                          ; 0930 _ 8D. 50, 10
        mov     eax, dword [ebp+10H]                    ; 0933 _ 8B. 45, 10
        add     eax, 8                                  ; 0936 _ 83. C0, 08
        mov     dword [esp+14H], edx                    ; 0939 _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 093D _ 89. 44 24, 10
        mov     eax, dword [ebp+14H]                    ; 0941 _ 8B. 45, 14
        mov     dword [esp+0CH], eax                    ; 0944 _ 89. 44 24, 0C
        mov     eax, dword [ebp+10H]                    ; 0948 _ 8B. 45, 10
        mov     dword [esp+8H], eax                     ; 094B _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 094F _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0952 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0956 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0959 _ 89. 04 24
        call    sheet_refresh                           ; 095C _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0961 _ 83. C4, 20
        pop     ebx                                     ; 0964 _ 5B
        pop     esi                                     ; 0965 _ 5E
        pop     ebp                                     ; 0966 _ 5D
        ret                                             ; 0967 _ C3
; set_cursor End of function

isSpecialKey:; Function begin
        push    ebp                                     ; 0968 _ 55
        mov     ebp, esp                                ; 0969 _ 89. E5
        sub     esp, 24                                 ; 096B _ 83. EC, 18
        mov     eax, dword [ebp+8H]                     ; 096E _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0971 _ 89. 04 24
        call    transferScanCode                        ; 0974 _ E8, FFFFFFFC(rel)
        cmp     dword [ebp+8H], 58                      ; 0979 _ 83. 7D, 08, 3A
        jz      ?_015                                   ; 097D _ 74, 2D
        cmp     dword [ebp+8H], 29                      ; 097F _ 83. 7D, 08, 1D
        jz      ?_015                                   ; 0983 _ 74, 27
        cmp     dword [ebp+8H], 186                     ; 0985 _ 81. 7D, 08, 000000BA
        jz      ?_015                                   ; 098C _ 74, 1E
        cmp     dword [ebp+8H], 42                      ; 098E _ 83. 7D, 08, 2A
        jz      ?_015                                   ; 0992 _ 74, 18
        cmp     dword [ebp+8H], 54                      ; 0994 _ 83. 7D, 08, 36
        jz      ?_015                                   ; 0998 _ 74, 12
        cmp     dword [ebp+8H], 170                     ; 099A _ 81. 7D, 08, 000000AA
        jz      ?_015                                   ; 09A1 _ 74, 09
        cmp     dword [ebp+8H], 182                     ; 09A3 _ 81. 7D, 08, 000000B6
        jnz     ?_016                                   ; 09AA _ 75, 07
?_015:  mov     eax, 1                                  ; 09AC _ B8, 00000001
        jmp     ?_017                                   ; 09B1 _ EB, 05

?_016:  mov     eax, 0                                  ; 09B3 _ B8, 00000000
?_017:  leave                                           ; 09B8 _ C9
        ret                                             ; 09B9 _ C3
; isSpecialKey End of function

transferScanCode:; Function begin
        push    ebp                                     ; 09BA _ 55
        mov     ebp, esp                                ; 09BB _ 89. E5
        sub     esp, 16                                 ; 09BD _ 83. EC, 10
        cmp     dword [ebp+8H], 42                      ; 09C0 _ 83. 7D, 08, 2A
        jnz     ?_018                                   ; 09C4 _ 75, 0D
        mov     eax, dword [key_shift]                  ; 09C6 _ A1, 00000000(d)
        or      eax, 01H                                ; 09CB _ 83. C8, 01
        mov     dword [key_shift], eax                  ; 09CE _ A3, 00000000(d)
?_018:  cmp     dword [ebp+8H], 54                      ; 09D3 _ 83. 7D, 08, 36
        jnz     ?_019                                   ; 09D7 _ 75, 0D
        mov     eax, dword [key_shift]                  ; 09D9 _ A1, 00000000(d)
        or      eax, 02H                                ; 09DE _ 83. C8, 02
        mov     dword [key_shift], eax                  ; 09E1 _ A3, 00000000(d)
?_019:  cmp     dword [ebp+8H], 170                     ; 09E6 _ 81. 7D, 08, 000000AA
        jnz     ?_020                                   ; 09ED _ 75, 0D
        mov     eax, dword [key_shift]                  ; 09EF _ A1, 00000000(d)
        and     eax, 0FFFFFFFEH                         ; 09F4 _ 83. E0, FE
        mov     dword [key_shift], eax                  ; 09F7 _ A3, 00000000(d)
?_020:  cmp     dword [ebp+8H], 182                     ; 09FC _ 81. 7D, 08, 000000B6
        jnz     ?_021                                   ; 0A03 _ 75, 0D
        mov     eax, dword [key_shift]                  ; 0A05 _ A1, 00000000(d)
        and     eax, 0FFFFFFFDH                         ; 0A0A _ 83. E0, FD
        mov     dword [key_shift], eax                  ; 0A0D _ A3, 00000000(d)
?_021:  cmp     dword [ebp+8H], 58                      ; 0A12 _ 83. 7D, 08, 3A
        jnz     ?_023                                   ; 0A16 _ 75, 1F
        mov     eax, dword [caps_lock]                  ; 0A18 _ A1, 00000000(d)
        test    eax, eax                                ; 0A1D _ 85. C0
        jnz     ?_022                                   ; 0A1F _ 75, 0C
        mov     dword [caps_lock], 1                    ; 0A21 _ C7. 05, 00000000(d), 00000001
        jmp     ?_023                                   ; 0A2B _ EB, 0A

?_022:  mov     dword [caps_lock], 0                    ; 0A2D _ C7. 05, 00000000(d), 00000000
?_023:  cmp     dword [ebp+8H], 42                      ; 0A37 _ 83. 7D, 08, 2A
        jz      ?_024                                   ; 0A3B _ 74, 24
        cmp     dword [ebp+8H], 54                      ; 0A3D _ 83. 7D, 08, 36
        jz      ?_024                                   ; 0A41 _ 74, 1E
        cmp     dword [ebp+8H], 170                     ; 0A43 _ 81. 7D, 08, 000000AA
        jz      ?_024                                   ; 0A4A _ 74, 15
        cmp     dword [ebp+8H], 182                     ; 0A4C _ 81. 7D, 08, 000000B6
        jz      ?_024                                   ; 0A53 _ 74, 0C
        cmp     dword [ebp+8H], 83                      ; 0A55 _ 83. 7D, 08, 53
        jg      ?_024                                   ; 0A59 _ 7F, 06
        cmp     dword [ebp+8H], 58                      ; 0A5B _ 83. 7D, 08, 3A
        jnz     ?_025                                   ; 0A5F _ 75, 0A
?_024:  mov     eax, 0                                  ; 0A61 _ B8, 00000000
        jmp     ?_030                                   ; 0A66 _ E9, 00000089

?_025:  mov     byte [ebp-1H], 0                        ; 0A6B _ C6. 45, FF, 00
        mov     eax, dword [key_shift]                  ; 0A6F _ A1, 00000000(d)
        test    eax, eax                                ; 0A74 _ 85. C0
        jnz     ?_027                                   ; 0A76 _ 75, 46
        cmp     dword [ebp+8H], 83                      ; 0A78 _ 83. 7D, 08, 53
        jg      ?_027                                   ; 0A7C _ 7F, 40
        mov     eax, dword [ebp+8H]                     ; 0A7E _ 8B. 45, 08
        add     eax, keytable                           ; 0A81 _ 05, 00000020(d)
        movzx   eax, byte [eax]                         ; 0A86 _ 0F B6. 00
        test    al, al                                  ; 0A89 _ 84. C0
        jz      ?_027                                   ; 0A8B _ 74, 31
        mov     eax, dword [ebp+8H]                     ; 0A8D _ 8B. 45, 08
        add     eax, keytable                           ; 0A90 _ 05, 00000020(d)
        movzx   eax, byte [eax]                         ; 0A95 _ 0F B6. 00
        mov     byte [ebp-1H], al                       ; 0A98 _ 88. 45, FF
        cmp     byte [ebp-1H], 64                       ; 0A9B _ 80. 7D, FF, 40
        jle     ?_026                                   ; 0A9F _ 7E, 1B
        cmp     byte [ebp-1H], 90                       ; 0AA1 _ 80. 7D, FF, 5A
        jg      ?_026                                   ; 0AA5 _ 7F, 15
        mov     eax, dword [caps_lock]                  ; 0AA7 _ A1, 00000000(d)
        test    eax, eax                                ; 0AAC _ 85. C0
        jnz     ?_026                                   ; 0AAE _ 75, 0C
        movzx   eax, byte [ebp-1H]                      ; 0AB0 _ 0F B6. 45, FF
        add     eax, 32                                 ; 0AB4 _ 83. C0, 20
        mov     byte [ebp-1H], al                       ; 0AB7 _ 88. 45, FF
        jmp     ?_029                                   ; 0ABA _ EB, 34

?_026:  jmp     ?_029                                   ; 0ABC _ EB, 32

?_027:  mov     eax, dword [key_shift]                  ; 0ABE _ A1, 00000000(d)
        test    eax, eax                                ; 0AC3 _ 85. C0
        jz      ?_028                                   ; 0AC5 _ 74, 25
        cmp     dword [ebp+8H], 127                     ; 0AC7 _ 83. 7D, 08, 7F
        jg      ?_028                                   ; 0ACB _ 7F, 1F
        mov     eax, dword [ebp+8H]                     ; 0ACD _ 8B. 45, 08
        add     eax, keytable1                          ; 0AD0 _ 05, 00000080(d)
        movzx   eax, byte [eax]                         ; 0AD5 _ 0F B6. 00
        test    al, al                                  ; 0AD8 _ 84. C0
        jz      ?_028                                   ; 0ADA _ 74, 10
        mov     eax, dword [ebp+8H]                     ; 0ADC _ 8B. 45, 08
        add     eax, keytable1                          ; 0ADF _ 05, 00000080(d)
        movzx   eax, byte [eax]                         ; 0AE4 _ 0F B6. 00
        mov     byte [ebp-1H], al                       ; 0AE7 _ 88. 45, FF
        jmp     ?_029                                   ; 0AEA _ EB, 04

?_028:  mov     byte [ebp-1H], 0                        ; 0AEC _ C6. 45, FF, 00
?_029:  movzx   eax, byte [ebp-1H]                      ; 0AF0 _ 0F B6. 45, FF
?_030:  leave                                           ; 0AF4 _ C9
        ret                                             ; 0AF5 _ C3
; transferScanCode End of function

launch_console:; Function begin
        push    ebp                                     ; 0AF6 _ 55
        mov     ebp, esp                                ; 0AF7 _ 89. E5
        push    ebx                                     ; 0AF9 _ 53
        sub     esp, 52                                 ; 0AFA _ 83. EC, 34
        mov     eax, dword [shtctl]                     ; 0AFD _ A1, 00000284(d)
        mov     dword [esp], eax                        ; 0B02 _ 89. 04 24
        call    sheet_alloc                             ; 0B05 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 0B0A _ 89. 45, F4
        mov     eax, dword [memman]                     ; 0B0D _ A1, 00000000(d)
        mov     dword [esp+4H], 42240                   ; 0B12 _ C7. 44 24, 04, 0000A500
        mov     dword [esp], eax                        ; 0B1A _ 89. 04 24
        call    memman_alloc_4k                         ; 0B1D _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 0B22 _ 89. 45, F0
        mov     dword [esp+10H], 99                     ; 0B25 _ C7. 44 24, 10, 00000063
        mov     dword [esp+0CH], 165                    ; 0B2D _ C7. 44 24, 0C, 000000A5
        mov     dword [esp+8H], 256                     ; 0B35 _ C7. 44 24, 08, 00000100
        mov     eax, dword [ebp-10H]                    ; 0B3D _ 8B. 45, F0
        mov     dword [esp+4H], eax                     ; 0B40 _ 89. 44 24, 04
        mov     eax, dword [ebp-0CH]                    ; 0B44 _ 8B. 45, F4
        mov     dword [esp], eax                        ; 0B47 _ 89. 04 24
        call    sheet_setbuf                            ; 0B4A _ E8, FFFFFFFC(rel)
        mov     eax, dword [shtctl]                     ; 0B4F _ A1, 00000284(d)
        mov     dword [esp+0CH], 0                      ; 0B54 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], ?_352                   ; 0B5C _ C7. 44 24, 08, 0000001C(d)
        mov     edx, dword [ebp-0CH]                    ; 0B64 _ 8B. 55, F4
        mov     dword [esp+4H], edx                     ; 0B67 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0B6B _ 89. 04 24
        call    make_window8                            ; 0B6E _ E8, FFFFFFFC(rel)
        mov     dword [esp+14H], 0                      ; 0B73 _ C7. 44 24, 14, 00000000
        mov     dword [esp+10H], 128                    ; 0B7B _ C7. 44 24, 10, 00000080
        mov     dword [esp+0CH], 240                    ; 0B83 _ C7. 44 24, 0C, 000000F0
        mov     dword [esp+8H], 28                      ; 0B8B _ C7. 44 24, 08, 0000001C
        mov     dword [esp+4H], 8                       ; 0B93 _ C7. 44 24, 04, 00000008
        mov     eax, dword [ebp-0CH]                    ; 0B9B _ 8B. 45, F4
        mov     dword [esp], eax                        ; 0B9E _ 89. 04 24
        call    make_textbox8                           ; 0BA1 _ E8, FFFFFFFC(rel)
        call    task_alloc                              ; 0BA6 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-14H], eax                    ; 0BAB _ 89. 45, EC
        call    get_code32_addr                         ; 0BAE _ E8, FFFFFFFC(rel)
        mov     dword [ebp-18H], eax                    ; 0BB3 _ 89. 45, E8
        mov     eax, dword [ebp-14H]                    ; 0BB6 _ 8B. 45, EC
        mov     dword [eax+8CH], 0                      ; 0BB9 _ C7. 80, 0000008C, 00000000
        mov     eax, dword [ebp-14H]                    ; 0BC3 _ 8B. 45, EC
        mov     dword [eax+90H], 1073741824             ; 0BC6 _ C7. 80, 00000090, 40000000
        mov     eax, console_task                       ; 0BD0 _ B8, 00000000(d)
        sub     eax, dword [ebp-18H]                    ; 0BD5 _ 2B. 45, E8
        mov     edx, eax                                ; 0BD8 _ 89. C2
        mov     eax, dword [ebp-14H]                    ; 0BDA _ 8B. 45, EC
        mov     dword [eax+4CH], edx                    ; 0BDD _ 89. 50, 4C
        mov     eax, dword [ebp-14H]                    ; 0BE0 _ 8B. 45, EC
        mov     dword [eax+74H], 0                      ; 0BE3 _ C7. 40, 74, 00000000
        mov     eax, dword [ebp-14H]                    ; 0BEA _ 8B. 45, EC
        mov     dword [eax+78H], 8                      ; 0BED _ C7. 40, 78, 00000008
        mov     eax, dword [ebp-14H]                    ; 0BF4 _ 8B. 45, EC
        mov     dword [eax+7CH], 32                     ; 0BF7 _ C7. 40, 7C, 00000020
        mov     eax, dword [ebp-14H]                    ; 0BFE _ 8B. 45, EC
        mov     dword [eax+80H], 24                     ; 0C01 _ C7. 80, 00000080, 00000018
        mov     eax, dword [ebp-14H]                    ; 0C0B _ 8B. 45, EC
        mov     dword [eax+84H], 0                      ; 0C0E _ C7. 80, 00000084, 00000000
        mov     eax, dword [ebp-14H]                    ; 0C18 _ 8B. 45, EC
        mov     dword [eax+88H], 16                     ; 0C1B _ C7. 80, 00000088, 00000010
        mov     eax, dword [ebp-14H]                    ; 0C25 _ 8B. 45, EC
        mov     eax, dword [eax+64H]                    ; 0C28 _ 8B. 40, 64
        lea     edx, [eax-8H]                           ; 0C2B _ 8D. 50, F8
        mov     eax, dword [ebp-14H]                    ; 0C2E _ 8B. 45, EC
        mov     dword [eax+64H], edx                    ; 0C31 _ 89. 50, 64
        mov     eax, dword [ebp-14H]                    ; 0C34 _ 8B. 45, EC
        mov     eax, dword [eax+64H]                    ; 0C37 _ 8B. 40, 64
        add     eax, 4                                  ; 0C3A _ 83. C0, 04
        mov     edx, dword [ebp-0CH]                    ; 0C3D _ 8B. 55, F4
        mov     dword [eax], edx                        ; 0C40 _ 89. 10
        mov     eax, dword [ebp-14H]                    ; 0C42 _ 8B. 45, EC
        mov     eax, dword [eax+64H]                    ; 0C45 _ 8B. 40, 64
        add     eax, 8                                  ; 0C48 _ 83. C0, 08
        mov     ebx, eax                                ; 0C4B _ 89. C3
        mov     eax, dword [memman]                     ; 0C4D _ A1, 00000000(d)
        mov     dword [esp], eax                        ; 0C52 _ 89. 04 24
        call    memman_total                            ; 0C55 _ E8, FFFFFFFC(rel)
        mov     dword [ebx], eax                        ; 0C5A _ 89. 03
        mov     dword [esp+8H], 5                       ; 0C5C _ C7. 44 24, 08, 00000005
        mov     dword [esp+4H], 1                       ; 0C64 _ C7. 44 24, 04, 00000001
        mov     eax, dword [ebp-14H]                    ; 0C6C _ 8B. 45, EC
        mov     dword [esp], eax                        ; 0C6F _ 89. 04 24
        call    task_run                                ; 0C72 _ E8, FFFFFFFC(rel)
        mov     eax, dword [shtctl]                     ; 0C77 _ A1, 00000284(d)
        mov     dword [esp+0CH], 4                      ; 0C7C _ C7. 44 24, 0C, 00000004
        mov     dword [esp+8H], 32                      ; 0C84 _ C7. 44 24, 08, 00000020
        mov     edx, dword [ebp-0CH]                    ; 0C8C _ 8B. 55, F4
        mov     dword [esp+4H], edx                     ; 0C8F _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0C93 _ 89. 04 24
        call    sheet_slide                             ; 0C96 _ E8, FFFFFFFC(rel)
        mov     eax, dword [shtctl]                     ; 0C9B _ A1, 00000284(d)
        mov     dword [esp+8H], 1                       ; 0CA0 _ C7. 44 24, 08, 00000001
        mov     edx, dword [ebp-0CH]                    ; 0CA8 _ 8B. 55, F4
        mov     dword [esp+4H], edx                     ; 0CAB _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0CAF _ 89. 04 24
        call    sheet_updown                            ; 0CB2 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-14H]                    ; 0CB7 _ 8B. 45, EC
        mov     dword [task_cons], eax                  ; 0CBA _ A3, 00000294(d)
        mov     eax, dword [ebp-0CH]                    ; 0CBF _ 8B. 45, F4
        add     esp, 52                                 ; 0CC2 _ 83. C4, 34
        pop     ebx                                     ; 0CC5 _ 5B
        pop     ebp                                     ; 0CC6 _ 5D
        ret                                             ; 0CC7 _ C3
; launch_console End of function

kill_process:; Function begin
        push    ebp                                     ; 0CC8 _ 55
        mov     ebp, esp                                ; 0CC9 _ 89. E5
        sub     esp, 24                                 ; 0CCB _ 83. EC, 18
        mov     edx, dword [g_Console]                  ; 0CCE _ 8B. 15, 0000000C(d)
        mov     eax, dword [?_375]                      ; 0CD4 _ A1, 00000014(d)
        mov     dword [esp+4H], edx                     ; 0CD9 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0CDD _ 89. 04 24
        call    cons_newline                            ; 0CE0 _ E8, FFFFFFFC(rel)
        mov     eax, dword [?_375]                      ; 0CE5 _ A1, 00000014(d)
        add     eax, 16                                 ; 0CEA _ 83. C0, 10
        mov     dword [?_375], eax                      ; 0CED _ A3, 00000014(d)
        mov     eax, dword [task_cons]                  ; 0CF2 _ A1, 00000294(d)
        add     eax, 48                                 ; 0CF7 _ 83. C0, 30
        mov     dword [esp], eax                        ; 0CFA _ 89. 04 24
        call    asm_end_app                             ; 0CFD _ E8, FFFFFFFC(rel)
        leave                                           ; 0D02 _ C9
        ret                                             ; 0D03 _ C3
; kill_process End of function

cmd_dir:; Function begin
        push    ebp                                     ; 0D04 _ 55
        mov     ebp, esp                                ; 0D05 _ 89. E5
        push    ebx                                     ; 0D07 _ 53
        sub     esp, 68                                 ; 0D08 _ 83. EC, 44
        mov     dword [ebp-0CH], 78848                  ; 0D0B _ C7. 45, F4, 00013400
        mov     eax, dword [memman]                     ; 0D12 _ A1, 00000000(d)
        mov     dword [esp+4H], 13                      ; 0D17 _ C7. 44 24, 04, 0000000D
        mov     dword [esp], eax                        ; 0D1F _ 89. 04 24
        call    memman_alloc                            ; 0D22 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-18H], eax                    ; 0D27 _ 89. 45, E8
        mov     eax, dword [ebp-18H]                    ; 0D2A _ 8B. 45, E8
        add     eax, 12                                 ; 0D2D _ 83. C0, 0C
        mov     byte [eax], 0                           ; 0D30 _ C6. 00, 00
        jmp     ?_038                                   ; 0D33 _ E9, 00000125

?_031:  mov     dword [ebp-10H], 0                      ; 0D38 _ C7. 45, F0, 00000000
        jmp     ?_034                                   ; 0D3F _ EB, 2C

?_032:  mov     edx, dword [ebp-0CH]                    ; 0D41 _ 8B. 55, F4
        mov     eax, dword [ebp-10H]                    ; 0D44 _ 8B. 45, F0
        add     eax, edx                                ; 0D47 _ 01. D0
        movzx   eax, byte [eax]                         ; 0D49 _ 0F B6. 00
        test    al, al                                  ; 0D4C _ 84. C0
        jz      ?_033                                   ; 0D4E _ 74, 1B
        mov     edx, dword [ebp-10H]                    ; 0D50 _ 8B. 55, F0
        mov     eax, dword [ebp-18H]                    ; 0D53 _ 8B. 45, E8
        add     edx, eax                                ; 0D56 _ 01. C2
        mov     ecx, dword [ebp-0CH]                    ; 0D58 _ 8B. 4D, F4
        mov     eax, dword [ebp-10H]                    ; 0D5B _ 8B. 45, F0
        add     eax, ecx                                ; 0D5E _ 01. C8
        movzx   eax, byte [eax]                         ; 0D60 _ 0F B6. 00
        mov     byte [edx], al                          ; 0D63 _ 88. 02
        add     dword [ebp-10H], 1                      ; 0D65 _ 83. 45, F0, 01
        jmp     ?_034                                   ; 0D69 _ EB, 02

?_033:  jmp     ?_035                                   ; 0D6B _ EB, 06

?_034:  cmp     dword [ebp-10H], 7                      ; 0D6D _ 83. 7D, F0, 07
        jle     ?_032                                   ; 0D71 _ 7E, CE
?_035:  mov     dword [ebp-14H], 0                      ; 0D73 _ C7. 45, EC, 00000000
        mov     edx, dword [ebp-10H]                    ; 0D7A _ 8B. 55, F0
        mov     eax, dword [ebp-18H]                    ; 0D7D _ 8B. 45, E8
        add     eax, edx                                ; 0D80 _ 01. D0
        mov     byte [eax], 46                          ; 0D82 _ C6. 00, 2E
        add     dword [ebp-10H], 1                      ; 0D85 _ 83. 45, F0, 01
        mov     dword [ebp-14H], 0                      ; 0D89 _ C7. 45, EC, 00000000
        jmp     ?_037                                   ; 0D90 _ EB, 1E

?_036:  mov     edx, dword [ebp-10H]                    ; 0D92 _ 8B. 55, F0
        mov     eax, dword [ebp-18H]                    ; 0D95 _ 8B. 45, E8
        add     edx, eax                                ; 0D98 _ 01. C2
        mov     ecx, dword [ebp-0CH]                    ; 0D9A _ 8B. 4D, F4
        mov     eax, dword [ebp-14H]                    ; 0D9D _ 8B. 45, EC
        add     eax, ecx                                ; 0DA0 _ 01. C8
        movzx   eax, byte [eax+8H]                      ; 0DA2 _ 0F B6. 40, 08
        mov     byte [edx], al                          ; 0DA6 _ 88. 02
        add     dword [ebp-10H], 1                      ; 0DA8 _ 83. 45, F0, 01
        add     dword [ebp-14H], 1                      ; 0DAC _ 83. 45, EC, 01
?_037:  cmp     dword [ebp-14H], 2                      ; 0DB0 _ 83. 7D, EC, 02
        jle     ?_036                                   ; 0DB4 _ 7E, DC
        mov     ecx, dword [?_375]                      ; 0DB6 _ 8B. 0D, 00000014(d)
        mov     edx, dword [g_Console]                  ; 0DBC _ 8B. 15, 0000000C(d)
        mov     eax, dword [shtctl]                     ; 0DC2 _ A1, 00000284(d)
        mov     ebx, dword [ebp-18H]                    ; 0DC7 _ 8B. 5D, E8
        mov     dword [esp+14H], ebx                    ; 0DCA _ 89. 5C 24, 14
        mov     dword [esp+10H], 7                      ; 0DCE _ C7. 44 24, 10, 00000007
        mov     dword [esp+0CH], ecx                    ; 0DD6 _ 89. 4C 24, 0C
        mov     dword [esp+8H], 16                      ; 0DDA _ C7. 44 24, 08, 00000010
        mov     dword [esp+4H], edx                     ; 0DE2 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0DE6 _ 89. 04 24
        call    showString                              ; 0DE9 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-1CH], 136                    ; 0DEE _ C7. 45, E4, 00000088
        mov     eax, dword [ebp-0CH]                    ; 0DF5 _ 8B. 45, F4
        mov     eax, dword [eax+1CH]                    ; 0DF8 _ 8B. 40, 1C
        mov     dword [esp], eax                        ; 0DFB _ 89. 04 24
        call    intToHexStr                             ; 0DFE _ E8, FFFFFFFC(rel)
        mov     dword [ebp-20H], eax                    ; 0E03 _ 89. 45, E0
        mov     ecx, dword [?_375]                      ; 0E06 _ 8B. 0D, 00000014(d)
        mov     edx, dword [g_Console]                  ; 0E0C _ 8B. 15, 0000000C(d)
        mov     eax, dword [shtctl]                     ; 0E12 _ A1, 00000284(d)
        mov     ebx, dword [ebp-20H]                    ; 0E17 _ 8B. 5D, E0
        mov     dword [esp+14H], ebx                    ; 0E1A _ 89. 5C 24, 14
        mov     dword [esp+10H], 7                      ; 0E1E _ C7. 44 24, 10, 00000007
        mov     dword [esp+0CH], ecx                    ; 0E26 _ 89. 4C 24, 0C
        mov     ecx, dword [ebp-1CH]                    ; 0E2A _ 8B. 4D, E4
        mov     dword [esp+8H], ecx                     ; 0E2D _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 0E31 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0E35 _ 89. 04 24
        call    showString                              ; 0E38 _ E8, FFFFFFFC(rel)
        mov     edx, dword [g_Console]                  ; 0E3D _ 8B. 15, 0000000C(d)
        mov     eax, dword [?_375]                      ; 0E43 _ A1, 00000014(d)
        mov     dword [esp+4H], edx                     ; 0E48 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0E4C _ 89. 04 24
        call    cons_newline                            ; 0E4F _ E8, FFFFFFFC(rel)
        mov     dword [?_375], eax                      ; 0E54 _ A3, 00000014(d)
        add     dword [ebp-0CH], 32                     ; 0E59 _ 83. 45, F4, 20
?_038:  mov     eax, dword [ebp-0CH]                    ; 0E5D _ 8B. 45, F4
        movzx   eax, byte [eax]                         ; 0E60 _ 0F B6. 00
        test    al, al                                  ; 0E63 _ 84. C0
        jne     ?_031                                   ; 0E65 _ 0F 85, FFFFFECD
        mov     edx, dword [ebp-18H]                    ; 0E6B _ 8B. 55, E8
        mov     eax, dword [memman]                     ; 0E6E _ A1, 00000000(d)
        mov     dword [esp+8H], 13                      ; 0E73 _ C7. 44 24, 08, 0000000D
        mov     dword [esp+4H], edx                     ; 0E7B _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0E7F _ 89. 04 24
        call    memman_free                             ; 0E82 _ E8, FFFFFFFC(rel)
        add     esp, 68                                 ; 0E87 _ 83. C4, 44
        pop     ebx                                     ; 0E8A _ 5B
        pop     ebp                                     ; 0E8B _ 5D
        ret                                             ; 0E8C _ C3
; cmd_dir End of function

cmd_type:; Function begin
        push    ebp                                     ; 0E8D _ 55
        mov     ebp, esp                                ; 0E8E _ 89. E5
        push    esi                                     ; 0E90 _ 56
        push    ebx                                     ; 0E91 _ 53
        sub     esp, 96                                 ; 0E92 _ 83. EC, 60
        mov     eax, dword [memman]                     ; 0E95 _ A1, 00000000(d)
        mov     dword [esp+4H], 13                      ; 0E9A _ C7. 44 24, 04, 0000000D
        mov     dword [esp], eax                        ; 0EA2 _ 89. 04 24
        call    memman_alloc                            ; 0EA5 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-24H], eax                    ; 0EAA _ 89. 45, DC
        mov     eax, dword [ebp-24H]                    ; 0EAD _ 8B. 45, DC
        add     eax, 12                                 ; 0EB0 _ 83. C0, 0C
        mov     byte [eax], 0                           ; 0EB3 _ C6. 00, 00
        mov     dword [ebp-0CH], 0                      ; 0EB6 _ C7. 45, F4, 00000000
        mov     dword [ebp-10H], 5                      ; 0EBD _ C7. 45, F0, 00000005
        mov     dword [ebp-10H], 5                      ; 0EC4 _ C7. 45, F0, 00000005
        jmp     ?_041                                   ; 0ECB _ EB, 30

?_039:  mov     edx, dword [ebp-10H]                    ; 0ECD _ 8B. 55, F0
        mov     eax, dword [ebp+8H]                     ; 0ED0 _ 8B. 45, 08
        add     eax, edx                                ; 0ED3 _ 01. D0
        movzx   eax, byte [eax]                         ; 0ED5 _ 0F B6. 00
        test    al, al                                  ; 0ED8 _ 84. C0
        jz      ?_040                                   ; 0EDA _ 74, 1F
        mov     edx, dword [ebp-0CH]                    ; 0EDC _ 8B. 55, F4
        mov     eax, dword [ebp-24H]                    ; 0EDF _ 8B. 45, DC
        add     edx, eax                                ; 0EE2 _ 01. C2
        mov     ecx, dword [ebp-10H]                    ; 0EE4 _ 8B. 4D, F0
        mov     eax, dword [ebp+8H]                     ; 0EE7 _ 8B. 45, 08
        add     eax, ecx                                ; 0EEA _ 01. C8
        movzx   eax, byte [eax]                         ; 0EEC _ 0F B6. 00
        mov     byte [edx], al                          ; 0EEF _ 88. 02
        add     dword [ebp-0CH], 1                      ; 0EF1 _ 83. 45, F4, 01
        add     dword [ebp-10H], 1                      ; 0EF5 _ 83. 45, F0, 01
        jmp     ?_041                                   ; 0EF9 _ EB, 02

?_040:  jmp     ?_042                                   ; 0EFB _ EB, 06

?_041:  cmp     dword [ebp-10H], 16                     ; 0EFD _ 83. 7D, F0, 10
        jle     ?_039                                   ; 0F01 _ 7E, CA
?_042:  mov     edx, dword [ebp-0CH]                    ; 0F03 _ 8B. 55, F4
        mov     eax, dword [ebp-24H]                    ; 0F06 _ 8B. 45, DC
        add     eax, edx                                ; 0F09 _ 01. D0
        mov     byte [eax], 0                           ; 0F0B _ C6. 00, 00
        mov     dword [ebp-14H], 78848                  ; 0F0E _ C7. 45, EC, 00013400
        jmp     ?_058                                   ; 0F15 _ E9, 0000023D

?_043:  mov     byte [ebp-2DH], 0                       ; 0F1A _ C6. 45, D3, 00
        mov     dword [ebp-18H], 0                      ; 0F1E _ C7. 45, E8, 00000000
        jmp     ?_046                                   ; 0F25 _ EB, 2C

?_044:  mov     edx, dword [ebp-14H]                    ; 0F27 _ 8B. 55, EC
        mov     eax, dword [ebp-18H]                    ; 0F2A _ 8B. 45, E8
        add     eax, edx                                ; 0F2D _ 01. D0
        movzx   eax, byte [eax]                         ; 0F2F _ 0F B6. 00
        test    al, al                                  ; 0F32 _ 84. C0
        jz      ?_045                                   ; 0F34 _ 74, 1B
        mov     edx, dword [ebp-14H]                    ; 0F36 _ 8B. 55, EC
        mov     eax, dword [ebp-18H]                    ; 0F39 _ 8B. 45, E8
        add     eax, edx                                ; 0F3C _ 01. D0
        movzx   eax, byte [eax]                         ; 0F3E _ 0F B6. 00
        lea     ecx, [ebp-39H]                          ; 0F41 _ 8D. 4D, C7
        mov     edx, dword [ebp-18H]                    ; 0F44 _ 8B. 55, E8
        add     edx, ecx                                ; 0F47 _ 01. CA
        mov     byte [edx], al                          ; 0F49 _ 88. 02
        add     dword [ebp-18H], 1                      ; 0F4B _ 83. 45, E8, 01
        jmp     ?_046                                   ; 0F4F _ EB, 02

?_045:  jmp     ?_047                                   ; 0F51 _ EB, 06

?_046:  cmp     dword [ebp-18H], 7                      ; 0F53 _ 83. 7D, E8, 07
        jle     ?_044                                   ; 0F57 _ 7E, CE
?_047:  mov     dword [ebp-1CH], 0                      ; 0F59 _ C7. 45, E4, 00000000
        lea     edx, [ebp-39H]                          ; 0F60 _ 8D. 55, C7
        mov     eax, dword [ebp-18H]                    ; 0F63 _ 8B. 45, E8
        add     eax, edx                                ; 0F66 _ 01. D0
        mov     byte [eax], 46                          ; 0F68 _ C6. 00, 2E
        add     dword [ebp-18H], 1                      ; 0F6B _ 83. 45, E8, 01
        mov     dword [ebp-1CH], 0                      ; 0F6F _ C7. 45, E4, 00000000
        jmp     ?_049                                   ; 0F76 _ EB, 1E

?_048:  mov     edx, dword [ebp-14H]                    ; 0F78 _ 8B. 55, EC
        mov     eax, dword [ebp-1CH]                    ; 0F7B _ 8B. 45, E4
        add     eax, edx                                ; 0F7E _ 01. D0
        movzx   eax, byte [eax+8H]                      ; 0F80 _ 0F B6. 40, 08
        lea     ecx, [ebp-39H]                          ; 0F84 _ 8D. 4D, C7
        mov     edx, dword [ebp-18H]                    ; 0F87 _ 8B. 55, E8
        add     edx, ecx                                ; 0F8A _ 01. CA
        mov     byte [edx], al                          ; 0F8C _ 88. 02
        add     dword [ebp-18H], 1                      ; 0F8E _ 83. 45, E8, 01
        add     dword [ebp-1CH], 1                      ; 0F92 _ 83. 45, E4, 01
?_049:  cmp     dword [ebp-1CH], 2                      ; 0F96 _ 83. 7D, E4, 02
        jle     ?_048                                   ; 0F9A _ 7E, DC
        lea     eax, [ebp-39H]                          ; 0F9C _ 8D. 45, C7
        mov     dword [esp+4H], eax                     ; 0F9F _ 89. 44 24, 04
        mov     eax, dword [ebp-24H]                    ; 0FA3 _ 8B. 45, DC
        mov     dword [esp], eax                        ; 0FA6 _ 89. 04 24
        call    strcmp                                  ; 0FA9 _ E8, FFFFFFFC(rel)
        cmp     eax, 1                                  ; 0FAE _ 83. F8, 01
        jne     ?_057                                   ; 0FB1 _ 0F 85, 0000019C
        mov     dword [ebp-28H], 88064                  ; 0FB7 _ C7. 45, D8, 00015800
        mov     eax, dword [ebp-14H]                    ; 0FBE _ 8B. 45, EC
        movzx   eax, word [eax+1AH]                     ; 0FC1 _ 0F B7. 40, 1A
        movzx   eax, ax                                 ; 0FC5 _ 0F B7. C0
        shl     eax, 9                                  ; 0FC8 _ C1. E0, 09
        add     dword [ebp-28H], eax                    ; 0FCB _ 01. 45, D8
        mov     eax, dword [ebp-14H]                    ; 0FCE _ 8B. 45, EC
        mov     eax, dword [eax+1CH]                    ; 0FD1 _ 8B. 40, 1C
        mov     dword [ebp-2CH], eax                    ; 0FD4 _ 89. 45, D4
        mov     dword [ebp-20H], 0                      ; 0FD7 _ C7. 45, E0, 00000000
        mov     dword [?_374], 16                       ; 0FDE _ C7. 05, 00000010(d), 00000010
        mov     dword [ebp-20H], 0                      ; 0FE8 _ C7. 45, E0, 00000000
        jmp     ?_056                                   ; 0FEF _ E9, 00000150

?_050:  mov     edx, dword [ebp-20H]                    ; 0FF4 _ 8B. 55, E0
        mov     eax, dword [ebp-28H]                    ; 0FF7 _ 8B. 45, D8
        add     eax, edx                                ; 0FFA _ 01. D0
        movzx   eax, byte [eax]                         ; 0FFC _ 0F B6. 00
        mov     byte [ebp-3BH], al                      ; 0FFF _ 88. 45, C5
        mov     byte [ebp-3AH], 0                       ; 1002 _ C6. 45, C6, 00
        movzx   eax, byte [ebp-3BH]                     ; 1006 _ 0F B6. 45, C5
        cmp     al, 9                                   ; 100A _ 3C, 09
        jnz     ?_053                                   ; 100C _ 75, 7E
?_051:  mov     ebx, dword [?_375]                      ; 100E _ 8B. 1D, 00000014(d)
        mov     ecx, dword [?_374]                      ; 1014 _ 8B. 0D, 00000010(d)
        mov     edx, dword [g_Console]                  ; 101A _ 8B. 15, 0000000C(d)
        mov     eax, dword [shtctl]                     ; 1020 _ A1, 00000284(d)
        mov     dword [esp+14H], ?_353                  ; 1025 _ C7. 44 24, 14, 00000024(d)
        mov     dword [esp+10H], 7                      ; 102D _ C7. 44 24, 10, 00000007
        mov     dword [esp+0CH], ebx                    ; 1035 _ 89. 5C 24, 0C
        mov     dword [esp+8H], ecx                     ; 1039 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 103D _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1041 _ 89. 04 24
        call    showString                              ; 1044 _ E8, FFFFFFFC(rel)
        mov     eax, dword [?_374]                      ; 1049 _ A1, 00000010(d)
        add     eax, 8                                  ; 104E _ 83. C0, 08
        mov     dword [?_374], eax                      ; 1051 _ A3, 00000010(d)
        mov     eax, dword [?_374]                      ; 1056 _ A1, 00000010(d)
        cmp     eax, 248                                ; 105B _ 3D, 000000F8
        jnz     ?_052                                   ; 1060 _ 75, 28
        mov     dword [?_374], 8                        ; 1062 _ C7. 05, 00000010(d), 00000008
        mov     edx, dword [g_Console]                  ; 106C _ 8B. 15, 0000000C(d)
        mov     eax, dword [?_375]                      ; 1072 _ A1, 00000014(d)
        mov     dword [esp+4H], edx                     ; 1077 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 107B _ 89. 04 24
        call    cons_newline                            ; 107E _ E8, FFFFFFFC(rel)
        mov     dword [?_375], eax                      ; 1083 _ A3, 00000014(d)
        jmp     ?_051                                   ; 1088 _ EB, 84

?_052:  jmp     ?_051                                   ; 108A _ EB, 82

?_053:  movzx   eax, byte [ebp-3BH]                     ; 108C _ 0F B6. 45, C5
        cmp     al, 10                                  ; 1090 _ 3C, 0A
        jnz     ?_054                                   ; 1092 _ 75, 2B
        mov     dword [?_374], 8                        ; 1094 _ C7. 05, 00000010(d), 00000008
        mov     edx, dword [g_Console]                  ; 109E _ 8B. 15, 0000000C(d)
        mov     eax, dword [?_375]                      ; 10A4 _ A1, 00000014(d)
        mov     dword [esp+4H], edx                     ; 10A9 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 10AD _ 89. 04 24
        call    cons_newline                            ; 10B0 _ E8, FFFFFFFC(rel)
        mov     dword [?_375], eax                      ; 10B5 _ A3, 00000014(d)
        jmp     ?_055                                   ; 10BA _ E9, 00000081

?_054:  movzx   eax, byte [ebp-3BH]                     ; 10BF _ 0F B6. 45, C5
        cmp     al, 13                                  ; 10C3 _ 3C, 0D
        jz      ?_055                                   ; 10C5 _ 74, 79
        mov     ebx, dword [?_375]                      ; 10C7 _ 8B. 1D, 00000014(d)
        mov     ecx, dword [?_374]                      ; 10CD _ 8B. 0D, 00000010(d)
        mov     edx, dword [g_Console]                  ; 10D3 _ 8B. 15, 0000000C(d)
        mov     eax, dword [shtctl]                     ; 10D9 _ A1, 00000284(d)
        lea     esi, [ebp-3BH]                          ; 10DE _ 8D. 75, C5
        mov     dword [esp+14H], esi                    ; 10E1 _ 89. 74 24, 14
        mov     dword [esp+10H], 7                      ; 10E5 _ C7. 44 24, 10, 00000007
        mov     dword [esp+0CH], ebx                    ; 10ED _ 89. 5C 24, 0C
        mov     dword [esp+8H], ecx                     ; 10F1 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 10F5 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 10F9 _ 89. 04 24
        call    showString                              ; 10FC _ E8, FFFFFFFC(rel)
        mov     eax, dword [?_374]                      ; 1101 _ A1, 00000010(d)
        add     eax, 8                                  ; 1106 _ 83. C0, 08
        mov     dword [?_374], eax                      ; 1109 _ A3, 00000010(d)
        mov     eax, dword [?_374]                      ; 110E _ A1, 00000010(d)
        cmp     eax, 248                                ; 1113 _ 3D, 000000F8
        jnz     ?_055                                   ; 1118 _ 75, 26
        mov     dword [?_374], 16                       ; 111A _ C7. 05, 00000010(d), 00000010
        mov     edx, dword [g_Console]                  ; 1124 _ 8B. 15, 0000000C(d)
        mov     eax, dword [?_375]                      ; 112A _ A1, 00000014(d)
        mov     dword [esp+4H], edx                     ; 112F _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1133 _ 89. 04 24
        call    cons_newline                            ; 1136 _ E8, FFFFFFFC(rel)
        mov     dword [?_375], eax                      ; 113B _ A3, 00000014(d)
?_055:  add     dword [ebp-20H], 1                      ; 1140 _ 83. 45, E0, 01
?_056:  mov     eax, dword [ebp-20H]                    ; 1144 _ 8B. 45, E0
        cmp     eax, dword [ebp-2CH]                    ; 1147 _ 3B. 45, D4
        jl      ?_050                                   ; 114A _ 0F 8C, FFFFFEA4
        nop                                             ; 1150 _ 90
        jmp     ?_059                                   ; 1151 _ EB, 12

?_057:  add     dword [ebp-14H], 32                     ; 1153 _ 83. 45, EC, 20
?_058:  mov     eax, dword [ebp-14H]                    ; 1157 _ 8B. 45, EC
        movzx   eax, byte [eax]                         ; 115A _ 0F B6. 00
        test    al, al                                  ; 115D _ 84. C0
        jne     ?_043                                   ; 115F _ 0F 85, FFFFFDB5
?_059:  mov     edx, dword [g_Console]                  ; 1165 _ 8B. 15, 0000000C(d)
        mov     eax, dword [?_375]                      ; 116B _ A1, 00000014(d)
        mov     dword [esp+4H], edx                     ; 1170 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1174 _ 89. 04 24
        call    cons_newline                            ; 1177 _ E8, FFFFFFFC(rel)
        mov     dword [?_375], eax                      ; 117C _ A3, 00000014(d)
        mov     edx, dword [ebp-24H]                    ; 1181 _ 8B. 55, DC
        mov     eax, dword [memman]                     ; 1184 _ A1, 00000000(d)
        mov     dword [esp+8H], 13                      ; 1189 _ C7. 44 24, 08, 0000000D
        mov     dword [esp+4H], edx                     ; 1191 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1195 _ 89. 04 24
        call    memman_free                             ; 1198 _ E8, FFFFFFFC(rel)
        mov     dword [?_374], 16                       ; 119D _ C7. 05, 00000010(d), 00000010
        add     esp, 96                                 ; 11A7 _ 83. C4, 60
        pop     ebx                                     ; 11AA _ 5B
        pop     esi                                     ; 11AB _ 5E
        pop     ebp                                     ; 11AC _ 5D
        ret                                             ; 11AD _ C3
; cmd_type End of function

cmd_mem:; Function begin
        push    ebp                                     ; 11AE _ 55
        mov     ebp, esp                                ; 11AF _ 89. E5
        push    ebx                                     ; 11B1 _ 53
        sub     esp, 52                                 ; 11B2 _ 83. EC, 34
        mov     eax, dword [ebp+8H]                     ; 11B5 _ 8B. 45, 08
        lea     edx, [eax+3FFH]                         ; 11B8 _ 8D. 90, 000003FF
        test    eax, eax                                ; 11BE _ 85. C0
        cmovs   eax, edx                                ; 11C0 _ 0F 48. C2
        sar     eax, 10                                 ; 11C3 _ C1. F8, 0A
        mov     dword [esp], eax                        ; 11C6 _ 89. 04 24
        call    intToHexStr                             ; 11C9 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 11CE _ 89. 45, F4
        mov     ecx, dword [?_375]                      ; 11D1 _ 8B. 0D, 00000014(d)
        mov     edx, dword [g_Console]                  ; 11D7 _ 8B. 15, 0000000C(d)
        mov     eax, dword [shtctl]                     ; 11DD _ A1, 00000284(d)
        mov     dword [esp+14H], ?_354                  ; 11E2 _ C7. 44 24, 14, 00000026(d)
        mov     dword [esp+10H], 7                      ; 11EA _ C7. 44 24, 10, 00000007
        mov     dword [esp+0CH], ecx                    ; 11F2 _ 89. 4C 24, 0C
        mov     dword [esp+8H], 16                      ; 11F6 _ C7. 44 24, 08, 00000010
        mov     dword [esp+4H], edx                     ; 11FE _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1202 _ 89. 04 24
        call    showString                              ; 1205 _ E8, FFFFFFFC(rel)
        mov     ecx, dword [?_375]                      ; 120A _ 8B. 0D, 00000014(d)
        mov     edx, dword [g_Console]                  ; 1210 _ 8B. 15, 0000000C(d)
        mov     eax, dword [shtctl]                     ; 1216 _ A1, 00000284(d)
        mov     ebx, dword [ebp-0CH]                    ; 121B _ 8B. 5D, F4
        mov     dword [esp+14H], ebx                    ; 121E _ 89. 5C 24, 14
        mov     dword [esp+10H], 7                      ; 1222 _ C7. 44 24, 10, 00000007
        mov     dword [esp+0CH], ecx                    ; 122A _ 89. 4C 24, 0C
        mov     dword [esp+8H], 52                      ; 122E _ C7. 44 24, 08, 00000034
        mov     dword [esp+4H], edx                     ; 1236 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 123A _ 89. 04 24
        call    showString                              ; 123D _ E8, FFFFFFFC(rel)
        mov     ecx, dword [?_375]                      ; 1242 _ 8B. 0D, 00000014(d)
        mov     edx, dword [g_Console]                  ; 1248 _ 8B. 15, 0000000C(d)
        mov     eax, dword [shtctl]                     ; 124E _ A1, 00000284(d)
        mov     dword [esp+14H], ?_355                  ; 1253 _ C7. 44 24, 14, 0000002C(d)
        mov     dword [esp+10H], 7                      ; 125B _ C7. 44 24, 10, 00000007
        mov     dword [esp+0CH], ecx                    ; 1263 _ 89. 4C 24, 0C
        mov     dword [esp+8H], 126                     ; 1267 _ C7. 44 24, 08, 0000007E
        mov     dword [esp+4H], edx                     ; 126F _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1273 _ 89. 04 24
        call    showString                              ; 1276 _ E8, FFFFFFFC(rel)
        mov     edx, dword [g_Console]                  ; 127B _ 8B. 15, 0000000C(d)
        mov     eax, dword [?_375]                      ; 1281 _ A1, 00000014(d)
        mov     dword [esp+4H], edx                     ; 1286 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 128A _ 89. 04 24
        call    cons_newline                            ; 128D _ E8, FFFFFFFC(rel)
        mov     dword [?_375], eax                      ; 1292 _ A3, 00000014(d)
        add     esp, 52                                 ; 1297 _ 83. C4, 34
        pop     ebx                                     ; 129A _ 5B
        pop     ebp                                     ; 129B _ 5D
        ret                                             ; 129C _ C3
; cmd_mem End of function

cmd_cls:; Function begin
        push    ebp                                     ; 129D _ 55
        mov     ebp, esp                                ; 129E _ 89. E5
        sub     esp, 56                                 ; 12A0 _ 83. EC, 38
        mov     dword [ebp-0CH], 8                      ; 12A3 _ C7. 45, F4, 00000008
        mov     dword [ebp-10H], 28                     ; 12AA _ C7. 45, F0, 0000001C
        mov     dword [ebp-10H], 28                     ; 12B1 _ C7. 45, F0, 0000001C
        jmp     ?_063                                   ; 12B8 _ EB, 39

?_060:  mov     dword [ebp-0CH], 8                      ; 12BA _ C7. 45, F4, 00000008
        jmp     ?_062                                   ; 12C1 _ EB, 23

?_061:  mov     eax, dword [g_Console]                  ; 12C3 _ A1, 0000000C(d)
        mov     edx, dword [eax]                        ; 12C8 _ 8B. 10
        mov     eax, dword [g_Console]                  ; 12CA _ A1, 0000000C(d)
        mov     eax, dword [eax+4H]                     ; 12CF _ 8B. 40, 04
        imul    eax, dword [ebp-10H]                    ; 12D2 _ 0F AF. 45, F0
        mov     ecx, eax                                ; 12D6 _ 89. C1
        mov     eax, dword [ebp-0CH]                    ; 12D8 _ 8B. 45, F4
        add     eax, ecx                                ; 12DB _ 01. C8
        add     eax, edx                                ; 12DD _ 01. D0
        mov     byte [eax], 0                           ; 12DF _ C6. 00, 00
        add     dword [ebp-0CH], 1                      ; 12E2 _ 83. 45, F4, 01
?_062:  cmp     dword [ebp-0CH], 247                    ; 12E6 _ 81. 7D, F4, 000000F7
        jle     ?_061                                   ; 12ED _ 7E, D4
        add     dword [ebp-10H], 1                      ; 12EF _ 83. 45, F0, 01
?_063:  cmp     dword [ebp-10H], 155                    ; 12F3 _ 81. 7D, F0, 0000009B
        jle     ?_060                                   ; 12FA _ 7E, BE
        mov     edx, dword [g_Console]                  ; 12FC _ 8B. 15, 0000000C(d)
        mov     eax, dword [shtctl]                     ; 1302 _ A1, 00000284(d)
        mov     dword [esp+14H], 156                    ; 1307 _ C7. 44 24, 14, 0000009C
        mov     dword [esp+10H], 248                    ; 130F _ C7. 44 24, 10, 000000F8
        mov     dword [esp+0CH], 28                     ; 1317 _ C7. 44 24, 0C, 0000001C
        mov     dword [esp+8H], 8                       ; 131F _ C7. 44 24, 08, 00000008
        mov     dword [esp+4H], edx                     ; 1327 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 132B _ 89. 04 24
        call    sheet_refresh                           ; 132E _ E8, FFFFFFFC(rel)
        mov     dword [?_375], 28                       ; 1333 _ C7. 05, 00000014(d), 0000001C
        mov     edx, dword [g_Console]                  ; 133D _ 8B. 15, 0000000C(d)
        mov     eax, dword [shtctl]                     ; 1343 _ A1, 00000284(d)
        mov     dword [esp+14H], ?_356                  ; 1348 _ C7. 44 24, 14, 00000030(d)
        mov     dword [esp+10H], 7                      ; 1350 _ C7. 44 24, 10, 00000007
        mov     dword [esp+0CH], 28                     ; 1358 _ C7. 44 24, 0C, 0000001C
        mov     dword [esp+8H], 8                       ; 1360 _ C7. 44 24, 08, 00000008
        mov     dword [esp+4H], edx                     ; 1368 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 136C _ 89. 04 24
        call    showString                              ; 136F _ E8, FFFFFFFC(rel)
        leave                                           ; 1374 _ C9
        ret                                             ; 1375 _ C3
; cmd_cls End of function

cmd_hlt:; Function begin
        push    ebp                                     ; 1376 _ 55
        mov     ebp, esp                                ; 1377 _ 89. E5
        sub     esp, 56                                 ; 1379 _ 83. EC, 38
        mov     dword [esp+4H], buffer                  ; 137C _ C7. 44 24, 04, 0000029C(d)
        mov     dword [esp], ?_357                      ; 1384 _ C7. 04 24, 00000032(d)
        call    file_loadfile                           ; 138B _ E8, FFFFFFFC(rel)
        call    get_addr_gdt                            ; 1390 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 1395 _ 89. 45, F4
        mov     eax, dword [buffer]                     ; 1398 _ A1, 0000029C(d)
        mov     edx, dword [ebp-0CH]                    ; 139D _ 8B. 55, F4
        add     edx, 88                                 ; 13A0 _ 83. C2, 58
        mov     dword [esp+0CH], 16634                  ; 13A3 _ C7. 44 24, 0C, 000040FA
        mov     dword [esp+8H], eax                     ; 13AB _ 89. 44 24, 08
        mov     dword [esp+4H], 1048575                 ; 13AF _ C7. 44 24, 04, 000FFFFF
        mov     dword [esp], edx                        ; 13B7 _ 89. 14 24
        call    set_segmdesc                            ; 13BA _ E8, FFFFFFFC(rel)
        mov     eax, dword [memman]                     ; 13BF _ A1, 00000000(d)
        mov     dword [esp+4H], 65536                   ; 13C4 _ C7. 44 24, 04, 00010000
        mov     dword [esp], eax                        ; 13CC _ 89. 04 24
        call    memman_alloc_4k                         ; 13CF _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 13D4 _ 89. 45, F0
        mov     eax, dword [ebp-10H]                    ; 13D7 _ 8B. 45, F0
        mov     dword [?_384], eax                      ; 13DA _ A3, 000002A0(d)
        mov     eax, dword [ebp-10H]                    ; 13DF _ 8B. 45, F0
        mov     edx, dword [ebp-0CH]                    ; 13E2 _ 8B. 55, F4
        add     edx, 96                                 ; 13E5 _ 83. C2, 60
        mov     dword [esp+0CH], 16626                  ; 13E8 _ C7. 44 24, 0C, 000040F2
        mov     dword [esp+8H], eax                     ; 13F0 _ 89. 44 24, 08
        mov     dword [esp+4H], 65535                   ; 13F4 _ C7. 44 24, 04, 0000FFFF
        mov     dword [esp], edx                        ; 13FC _ 89. 14 24
        call    set_segmdesc                            ; 13FF _ E8, FFFFFFFC(rel)
        call    task_now                                ; 1404 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-14H], eax                    ; 1409 _ 89. 45, EC
        mov     eax, dword [ebp-14H]                    ; 140C _ 8B. 45, EC
        mov     dword [eax+30H], 0                      ; 140F _ C7. 40, 30, 00000000
        mov     eax, dword [ebp-14H]                    ; 1416 _ 8B. 45, EC
        add     eax, 48                                 ; 1419 _ 83. C0, 30
        mov     dword [esp+10H], eax                    ; 141C _ 89. 44 24, 10
        mov     dword [esp+0CH], 96                     ; 1420 _ C7. 44 24, 0C, 00000060
        mov     dword [esp+8H], 65536                   ; 1428 _ C7. 44 24, 08, 00010000
        mov     dword [esp+4H], 88                      ; 1430 _ C7. 44 24, 04, 00000058
        mov     dword [esp], 0                          ; 1438 _ C7. 04 24, 00000000
        call    start_app                               ; 143F _ E8, FFFFFFFC(rel)
        mov     eax, dword [?_385]                      ; 1444 _ A1, 000002A4(d)
        mov     ecx, eax                                ; 1449 _ 89. C1
        mov     eax, dword [buffer]                     ; 144B _ A1, 0000029C(d)
        mov     edx, eax                                ; 1450 _ 89. C2
        mov     eax, dword [memman]                     ; 1452 _ A1, 00000000(d)
        mov     dword [esp+8H], ecx                     ; 1457 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 145B _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 145F _ 89. 04 24
        call    memman_free_4k                          ; 1462 _ E8, FFFFFFFC(rel)
        mov     edx, dword [ebp-10H]                    ; 1467 _ 8B. 55, F0
        mov     eax, dword [memman]                     ; 146A _ A1, 00000000(d)
        mov     dword [esp+8H], 65536                   ; 146F _ C7. 44 24, 08, 00010000
        mov     dword [esp+4H], edx                     ; 1477 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 147B _ 89. 04 24
        call    memman_free_4k                          ; 147E _ E8, FFFFFFFC(rel)
        leave                                           ; 1483 _ C9
        ret                                             ; 1484 _ C3
; cmd_hlt End of function

console_task:; Function begin
        push    ebp                                     ; 1485 _ 55
        mov     ebp, esp                                ; 1486 _ 89. E5
        push    ebx                                     ; 1488 _ 53
        sub     esp, 84                                 ; 1489 _ 83. EC, 54
        call    task_now                                ; 148C _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 1491 _ 89. 45, F0
        mov     dword [ebp-0CH], 0                      ; 1494 _ C7. 45, F4, 00000000
        mov     dword [ebp-14H], 0                      ; 149B _ C7. 45, EC, 00000000
        mov     dword [ebp-18H], 0                      ; 14A2 _ C7. 45, E8, 00000000
        mov     eax, dword [memman]                     ; 14A9 _ A1, 00000000(d)
        mov     dword [esp+4H], 128                     ; 14AE _ C7. 44 24, 04, 00000080
        mov     dword [esp], eax                        ; 14B6 _ 89. 04 24
        call    memman_alloc                            ; 14B9 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-1CH], eax                    ; 14BE _ 89. 45, E4
        mov     eax, dword [memman]                     ; 14C1 _ A1, 00000000(d)
        mov     dword [esp+4H], 30                      ; 14C6 _ C7. 44 24, 04, 0000001E
        mov     dword [esp], eax                        ; 14CE _ 89. 04 24
        call    memman_alloc                            ; 14D1 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-20H], eax                    ; 14D6 _ 89. 45, E0
        mov     eax, dword [ebp+8H]                     ; 14D9 _ 8B. 45, 08
        mov     dword [g_Console], eax                  ; 14DC _ A3, 0000000C(d)
        mov     dword [?_374], 16                       ; 14E1 _ C7. 05, 00000010(d), 00000010
        mov     dword [?_375], 28                       ; 14EB _ C7. 05, 00000014(d), 0000001C
        mov     dword [?_376], -1                       ; 14F5 _ C7. 05, 00000018(d), FFFFFFFF
        mov     eax, dword [ebp-10H]                    ; 14FF _ 8B. 45, F0
        lea     edx, [eax+10H]                          ; 1502 _ 8D. 50, 10
        mov     eax, dword [ebp-10H]                    ; 1505 _ 8B. 45, F0
        mov     dword [esp+0CH], eax                    ; 1508 _ 89. 44 24, 0C
        mov     eax, dword [ebp-1CH]                    ; 150C _ 8B. 45, E4
        mov     dword [esp+8H], eax                     ; 150F _ 89. 44 24, 08
        mov     dword [esp+4H], 128                     ; 1513 _ C7. 44 24, 04, 00000080
        mov     dword [esp], edx                        ; 151B _ 89. 14 24
        call    fifo8_init                              ; 151E _ E8, FFFFFFFC(rel)
        call    timer_alloc                             ; 1523 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-24H], eax                    ; 1528 _ 89. 45, DC
        mov     eax, dword [ebp-10H]                    ; 152B _ 8B. 45, F0
        add     eax, 16                                 ; 152E _ 83. C0, 10
        mov     dword [esp+8H], 1                       ; 1531 _ C7. 44 24, 08, 00000001
        mov     dword [esp+4H], eax                     ; 1539 _ 89. 44 24, 04
        mov     eax, dword [ebp-24H]                    ; 153D _ 8B. 45, DC
        mov     dword [esp], eax                        ; 1540 _ 89. 04 24
        call    timer_init                              ; 1543 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 50                      ; 1548 _ C7. 44 24, 04, 00000032
        mov     eax, dword [ebp-24H]                    ; 1550 _ 8B. 45, DC
        mov     dword [esp], eax                        ; 1553 _ 89. 04 24
        call    timer_settime                           ; 1556 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-24H]                    ; 155B _ 8B. 45, DC
        mov     dword [?_379], eax                      ; 155E _ A3, 00000020(d)
        mov     eax, dword [shtctl]                     ; 1563 _ A1, 00000284(d)
        mov     dword [esp+14H], ?_356                  ; 1568 _ C7. 44 24, 14, 00000030(d)
        mov     dword [esp+10H], 7                      ; 1570 _ C7. 44 24, 10, 00000007
        mov     dword [esp+0CH], 28                     ; 1578 _ C7. 44 24, 0C, 0000001C
        mov     dword [esp+8H], 8                       ; 1580 _ C7. 44 24, 08, 00000008
        mov     edx, dword [ebp+8H]                     ; 1588 _ 8B. 55, 08
        mov     dword [esp+4H], edx                     ; 158B _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 158F _ 89. 04 24
        call    showString                              ; 1592 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-28H], 0                      ; 1597 _ C7. 45, D8, 00000000
        mov     dword [ebp-2CH], 78848                  ; 159E _ C7. 45, D4, 00013400
        mov     dword [ebp-30H], 0                      ; 15A5 _ C7. 45, D0, 00000000
?_064:  call    io_cli                                  ; 15AC _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 15B1 _ 8B. 45, F0
        add     eax, 16                                 ; 15B4 _ 83. C0, 10
        mov     dword [esp], eax                        ; 15B7 _ 89. 04 24
        call    fifo8_status                            ; 15BA _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 15BF _ 85. C0
        jnz     ?_065                                   ; 15C1 _ 75, 0A
        call    io_sti                                  ; 15C3 _ E8, FFFFFFFC(rel)
        jmp     ?_079                                   ; 15C8 _ E9, 000003EF

?_065:  call    io_sti                                  ; 15CD _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 15D2 _ 8B. 45, F0
        add     eax, 16                                 ; 15D5 _ 83. C0, 10
        mov     dword [esp], eax                        ; 15D8 _ 89. 04 24
        call    fifo8_get                               ; 15DB _ E8, FFFFFFFC(rel)
        mov     dword [ebp-34H], eax                    ; 15E0 _ 89. 45, CC
        cmp     dword [ebp-30H], 1                      ; 15E3 _ 83. 7D, D0, 01
        jnz     ?_066                                   ; 15E7 _ 75, 37
        mov     edx, dword [sht_back]                   ; 15E9 _ 8B. 15, 00000288(d)
        mov     eax, dword [shtctl]                     ; 15EF _ A1, 00000284(d)
        mov     dword [esp+14H], ?_358                  ; 15F4 _ C7. 44 24, 14, 0000003A(d)
        mov     dword [esp+10H], 0                      ; 15FC _ C7. 44 24, 10, 00000000
        mov     dword [esp+0CH], 232                    ; 1604 _ C7. 44 24, 0C, 000000E8
        mov     dword [esp+8H], 0                       ; 160C _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], edx                     ; 1614 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1618 _ 89. 04 24
        call    showString                              ; 161B _ E8, FFFFFFFC(rel)
?_066:  cmp     dword [ebp-34H], 1                      ; 1620 _ 83. 7D, CC, 01
        jg      ?_069                                   ; 1624 _ 7F, 6E
        cmp     dword [ebp-0CH], 0                      ; 1626 _ 83. 7D, F4, 00
        js      ?_069                                   ; 162A _ 78, 68
        cmp     dword [ebp-34H], 0                      ; 162C _ 83. 7D, CC, 00
        jz      ?_067                                   ; 1630 _ 74, 26
        mov     eax, dword [ebp-10H]                    ; 1632 _ 8B. 45, F0
        add     eax, 16                                 ; 1635 _ 83. C0, 10
        mov     dword [esp+8H], 0                       ; 1638 _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], eax                     ; 1640 _ 89. 44 24, 04
        mov     eax, dword [ebp-24H]                    ; 1644 _ 8B. 45, DC
        mov     dword [esp], eax                        ; 1647 _ 89. 04 24
        call    timer_init                              ; 164A _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], 7                      ; 164F _ C7. 45, F4, 00000007
        jmp     ?_068                                   ; 1656 _ EB, 24

?_067:  mov     eax, dword [ebp-10H]                    ; 1658 _ 8B. 45, F0
        add     eax, 16                                 ; 165B _ 83. C0, 10
        mov     dword [esp+8H], 1                       ; 165E _ C7. 44 24, 08, 00000001
        mov     dword [esp+4H], eax                     ; 1666 _ 89. 44 24, 04
        mov     eax, dword [ebp-24H]                    ; 166A _ 8B. 45, DC
        mov     dword [esp], eax                        ; 166D _ 89. 04 24
        call    timer_init                              ; 1670 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], 0                      ; 1675 _ C7. 45, F4, 00000000
?_068:  mov     dword [esp+4H], 50                      ; 167C _ C7. 44 24, 04, 00000032
        mov     eax, dword [ebp-24H]                    ; 1684 _ 8B. 45, DC
        mov     dword [esp], eax                        ; 1687 _ 89. 04 24
        call    timer_settime                           ; 168A _ E8, FFFFFFFC(rel)
        jmp     ?_078                                   ; 168F _ E9, 000002EE

?_069:  cmp     dword [ebp-34H], 87                     ; 1694 _ 83. 7D, CC, 57
        jnz     ?_070                                   ; 1698 _ 75, 3C
        mov     dword [ebp-0CH], 7                      ; 169A _ C7. 45, F4, 00000007
        mov     eax, dword [ebp-10H]                    ; 16A1 _ 8B. 45, F0
        add     eax, 16                                 ; 16A4 _ 83. C0, 10
        mov     dword [esp+8H], 0                       ; 16A7 _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], eax                     ; 16AF _ 89. 44 24, 04
        mov     eax, dword [ebp-24H]                    ; 16B3 _ 8B. 45, DC
        mov     dword [esp], eax                        ; 16B6 _ 89. 04 24
        call    timer_init                              ; 16B9 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 50                      ; 16BE _ C7. 44 24, 04, 00000032
        mov     eax, dword [ebp-24H]                    ; 16C6 _ 8B. 45, DC
        mov     dword [esp], eax                        ; 16C9 _ 89. 04 24
        call    timer_settime                           ; 16CC _ E8, FFFFFFFC(rel)
        jmp     ?_078                                   ; 16D1 _ E9, 000002AC

?_070:  cmp     dword [ebp-34H], 88                     ; 16D6 _ 83. 7D, CC, 58
        jnz     ?_071                                   ; 16DA _ 75, 59
        mov     ecx, dword [?_375]                      ; 16DC _ 8B. 0D, 00000014(d)
        mov     edx, dword [?_374]                      ; 16E2 _ 8B. 15, 00000010(d)
        mov     eax, dword [shtctl]                     ; 16E8 _ A1, 00000284(d)
        mov     dword [esp+10H], 0                      ; 16ED _ C7. 44 24, 10, 00000000
        mov     dword [esp+0CH], ecx                    ; 16F5 _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 16F9 _ 89. 54 24, 08
        mov     edx, dword [ebp+8H]                     ; 16FD _ 8B. 55, 08
        mov     dword [esp+4H], edx                     ; 1700 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1704 _ 89. 04 24
        call    set_cursor                              ; 1707 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], -1                     ; 170C _ C7. 45, F4, FFFFFFFF
        mov     eax, dword [task_main]                  ; 1713 _ A1, 00000298(d)
        mov     dword [esp+8H], 0                       ; 1718 _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], -1                      ; 1720 _ C7. 44 24, 04, FFFFFFFF
        mov     dword [esp], eax                        ; 1728 _ 89. 04 24
        call    task_run                                ; 172B _ E8, FFFFFFFC(rel)
        jmp     ?_078                                   ; 1730 _ E9, 0000024D

?_071:  cmp     dword [ebp-34H], 28                     ; 1735 _ 83. 7D, CC, 1C
        jne     ?_076                                   ; 1739 _ 0F 85, 00000157
        mov     ecx, dword [?_375]                      ; 173F _ 8B. 0D, 00000014(d)
        mov     edx, dword [?_374]                      ; 1745 _ 8B. 15, 00000010(d)
        mov     eax, dword [shtctl]                     ; 174B _ A1, 00000284(d)
        mov     dword [esp+10H], 0                      ; 1750 _ C7. 44 24, 10, 00000000
        mov     dword [esp+0CH], ecx                    ; 1758 _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 175C _ 89. 54 24, 08
        mov     edx, dword [ebp+8H]                     ; 1760 _ 8B. 55, 08
        mov     dword [esp+4H], edx                     ; 1763 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1767 _ 89. 04 24
        call    set_cursor                              ; 176A _ E8, FFFFFFFC(rel)
        mov     eax, dword [?_374]                      ; 176F _ A1, 00000010(d)
        lea     edx, [eax+7H]                           ; 1774 _ 8D. 50, 07
        test    eax, eax                                ; 1777 _ 85. C0
        cmovs   eax, edx                                ; 1779 _ 0F 48. C2
        sar     eax, 3                                  ; 177C _ C1. F8, 03
        lea     edx, [eax-2H]                           ; 177F _ 8D. 50, FE
        mov     eax, dword [ebp-20H]                    ; 1782 _ 8B. 45, E0
        add     eax, edx                                ; 1785 _ 01. D0
        mov     byte [eax], 0                           ; 1787 _ C6. 00, 00
        mov     eax, dword [?_375]                      ; 178A _ A1, 00000014(d)
        mov     edx, dword [ebp+8H]                     ; 178F _ 8B. 55, 08
        mov     dword [esp+4H], edx                     ; 1792 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1796 _ 89. 04 24
        call    cons_newline                            ; 1799 _ E8, FFFFFFFC(rel)
        mov     dword [?_375], eax                      ; 179E _ A3, 00000014(d)
        mov     dword [?_374], 16                       ; 17A3 _ C7. 05, 00000010(d), 00000010
        mov     dword [esp+4H], ?_359                   ; 17AD _ C7. 44 24, 04, 0000004B(d)
        mov     eax, dword [ebp-20H]                    ; 17B5 _ 8B. 45, E0
        mov     dword [esp], eax                        ; 17B8 _ 89. 04 24
        call    strcmp                                  ; 17BB _ E8, FFFFFFFC(rel)
        cmp     eax, 1                                  ; 17C0 _ 83. F8, 01
        jnz     ?_072                                   ; 17C3 _ 75, 10
        mov     eax, dword [ebp+0CH]                    ; 17C5 _ 8B. 45, 0C
        mov     dword [esp], eax                        ; 17C8 _ 89. 04 24
        call    cmd_mem                                 ; 17CB _ E8, FFFFFFFC(rel)
        jmp     ?_078                                   ; 17D0 _ E9, 000001AD

?_072:  mov     dword [esp+4H], ?_360                   ; 17D5 _ C7. 44 24, 04, 0000004F(d)
        mov     eax, dword [ebp-20H]                    ; 17DD _ 8B. 45, E0
        mov     dword [esp], eax                        ; 17E0 _ 89. 04 24
        call    strcmp                                  ; 17E3 _ E8, FFFFFFFC(rel)
        cmp     eax, 1                                  ; 17E8 _ 83. F8, 01
        jnz     ?_073                                   ; 17EB _ 75, 0A
        call    cmd_cls                                 ; 17ED _ E8, FFFFFFFC(rel)
        jmp     ?_078                                   ; 17F2 _ E9, 0000018B

?_073:  mov     dword [esp+4H], ?_361                   ; 17F7 _ C7. 44 24, 04, 00000053(d)
        mov     eax, dword [ebp-20H]                    ; 17FF _ 8B. 45, E0
        mov     dword [esp], eax                        ; 1802 _ 89. 04 24
        call    strcmp                                  ; 1805 _ E8, FFFFFFFC(rel)
        cmp     eax, 1                                  ; 180A _ 83. F8, 01
        jnz     ?_074                                   ; 180D _ 75, 14
        mov     dword [g_hlt], 1                        ; 180F _ C7. 05, 00000000(d), 00000001
        call    cmd_hlt                                 ; 1819 _ E8, FFFFFFFC(rel)
        jmp     ?_078                                   ; 181E _ E9, 0000015F

?_074:  mov     dword [esp+4H], ?_362                   ; 1823 _ C7. 44 24, 04, 00000057(d)
        mov     eax, dword [ebp-20H]                    ; 182B _ 8B. 45, E0
        mov     dword [esp], eax                        ; 182E _ 89. 04 24
        call    strcmp                                  ; 1831 _ E8, FFFFFFFC(rel)
        cmp     eax, 1                                  ; 1836 _ 83. F8, 01
        jnz     ?_075                                   ; 1839 _ 75, 0A
        call    cmd_dir                                 ; 183B _ E8, FFFFFFFC(rel)
        jmp     ?_078                                   ; 1840 _ E9, 0000013D

?_075:  mov     eax, dword [ebp-20H]                    ; 1845 _ 8B. 45, E0
        movzx   eax, byte [eax]                         ; 1848 _ 0F B6. 00
        cmp     al, 116                                 ; 184B _ 3C, 74
        jne     ?_078                                   ; 184D _ 0F 85, 0000012F
        mov     eax, dword [ebp-20H]                    ; 1853 _ 8B. 45, E0
        add     eax, 1                                  ; 1856 _ 83. C0, 01
        movzx   eax, byte [eax]                         ; 1859 _ 0F B6. 00
        cmp     al, 121                                 ; 185C _ 3C, 79
        jne     ?_078                                   ; 185E _ 0F 85, 0000011E
        mov     eax, dword [ebp-20H]                    ; 1864 _ 8B. 45, E0
        add     eax, 2                                  ; 1867 _ 83. C0, 02
        movzx   eax, byte [eax]                         ; 186A _ 0F B6. 00
        cmp     al, 112                                 ; 186D _ 3C, 70
        jne     ?_078                                   ; 186F _ 0F 85, 0000010D
        mov     eax, dword [ebp-20H]                    ; 1875 _ 8B. 45, E0
        add     eax, 3                                  ; 1878 _ 83. C0, 03
        movzx   eax, byte [eax]                         ; 187B _ 0F B6. 00
        cmp     al, 101                                 ; 187E _ 3C, 65
        jne     ?_078                                   ; 1880 _ 0F 85, 000000FC
        mov     eax, dword [ebp-20H]                    ; 1886 _ 8B. 45, E0
        mov     dword [esp], eax                        ; 1889 _ 89. 04 24
        call    cmd_type                                ; 188C _ E8, FFFFFFFC(rel)
        jmp     ?_078                                   ; 1891 _ E9, 000000EC

?_076:  cmp     dword [ebp-34H], 14                     ; 1896 _ 83. 7D, CC, 0E
        jnz     ?_077                                   ; 189A _ 75, 79
        mov     eax, dword [?_374]                      ; 189C _ A1, 00000010(d)
        cmp     eax, 8                                  ; 18A1 _ 83. F8, 08
        jle     ?_077                                   ; 18A4 _ 7E, 6F
        mov     ecx, dword [?_375]                      ; 18A6 _ 8B. 0D, 00000014(d)
        mov     edx, dword [?_374]                      ; 18AC _ 8B. 15, 00000010(d)
        mov     eax, dword [shtctl]                     ; 18B2 _ A1, 00000284(d)
        mov     dword [esp+10H], 0                      ; 18B7 _ C7. 44 24, 10, 00000000
        mov     dword [esp+0CH], ecx                    ; 18BF _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 18C3 _ 89. 54 24, 08
        mov     edx, dword [ebp+8H]                     ; 18C7 _ 8B. 55, 08
        mov     dword [esp+4H], edx                     ; 18CA _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 18CE _ 89. 04 24
        call    set_cursor                              ; 18D1 _ E8, FFFFFFFC(rel)
        mov     eax, dword [?_374]                      ; 18D6 _ A1, 00000010(d)
        sub     eax, 8                                  ; 18DB _ 83. E8, 08
        mov     dword [?_374], eax                      ; 18DE _ A3, 00000010(d)
        mov     ecx, dword [?_375]                      ; 18E3 _ 8B. 0D, 00000014(d)
        mov     edx, dword [?_374]                      ; 18E9 _ 8B. 15, 00000010(d)
        mov     eax, dword [shtctl]                     ; 18EF _ A1, 00000284(d)
        mov     dword [esp+10H], 0                      ; 18F4 _ C7. 44 24, 10, 00000000
        mov     dword [esp+0CH], ecx                    ; 18FC _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 1900 _ 89. 54 24, 08
        mov     edx, dword [ebp+8H]                     ; 1904 _ 8B. 55, 08
        mov     dword [esp+4H], edx                     ; 1907 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 190B _ 89. 04 24
        call    set_cursor                              ; 190E _ E8, FFFFFFFC(rel)
        jmp     ?_078                                   ; 1913 _ EB, 6D

?_077:  mov     eax, dword [ebp-34H]                    ; 1915 _ 8B. 45, CC
        mov     dword [esp], eax                        ; 1918 _ 89. 04 24
        call    transferScanCode                        ; 191B _ E8, FFFFFFFC(rel)
        mov     byte [ebp-35H], al                      ; 1920 _ 88. 45, CB
        mov     eax, dword [?_374]                      ; 1923 _ A1, 00000010(d)
        cmp     eax, 239                                ; 1928 _ 3D, 000000EF
        jg      ?_078                                   ; 192D _ 7F, 53
        cmp     byte [ebp-35H], 0                       ; 192F _ 80. 7D, CB, 00
        jz      ?_078                                   ; 1933 _ 74, 4D
        mov     eax, dword [?_374]                      ; 1935 _ A1, 00000010(d)
        lea     edx, [eax+7H]                           ; 193A _ 8D. 50, 07
        test    eax, eax                                ; 193D _ 85. C0
        cmovs   eax, edx                                ; 193F _ 0F 48. C2
        sar     eax, 3                                  ; 1942 _ C1. F8, 03
        lea     edx, [eax-2H]                           ; 1945 _ 8D. 50, FE
        mov     eax, dword [ebp-20H]                    ; 1948 _ 8B. 45, E0
        add     edx, eax                                ; 194B _ 01. C2
        movzx   eax, byte [ebp-35H]                     ; 194D _ 0F B6. 45, CB
        mov     byte [edx], al                          ; 1951 _ 88. 02
        mov     eax, dword [?_374]                      ; 1953 _ A1, 00000010(d)
        lea     edx, [eax+7H]                           ; 1958 _ 8D. 50, 07
        test    eax, eax                                ; 195B _ 85. C0
        cmovs   eax, edx                                ; 195D _ 0F 48. C2
        sar     eax, 3                                  ; 1960 _ C1. F8, 03
        lea     edx, [eax-1H]                           ; 1963 _ 8D. 50, FF
        mov     eax, dword [ebp-20H]                    ; 1966 _ 8B. 45, E0
        add     eax, edx                                ; 1969 _ 01. D0
        mov     byte [eax], 0                           ; 196B _ C6. 00, 00
        movsx   eax, byte [ebp-35H]                     ; 196E _ 0F BE. 45, CB
        mov     dword [esp+4H], 1                       ; 1972 _ C7. 44 24, 04, 00000001
        mov     dword [esp], eax                        ; 197A _ 89. 04 24
        call    cons_putchar                            ; 197D _ E8, FFFFFFFC(rel)
?_078:  cmp     dword [ebp-0CH], 0                      ; 1982 _ 83. 7D, F4, 00
        js      ?_079                                   ; 1986 _ 78, 34
        mov     ecx, dword [?_375]                      ; 1988 _ 8B. 0D, 00000014(d)
        mov     edx, dword [?_374]                      ; 198E _ 8B. 15, 00000010(d)
        mov     eax, dword [shtctl]                     ; 1994 _ A1, 00000284(d)
        mov     ebx, dword [ebp-0CH]                    ; 1999 _ 8B. 5D, F4
        mov     dword [esp+10H], ebx                    ; 199C _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 19A0 _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 19A4 _ 89. 54 24, 08
        mov     edx, dword [ebp+8H]                     ; 19A8 _ 8B. 55, 08
        mov     dword [esp+4H], edx                     ; 19AB _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 19AF _ 89. 04 24
        call    set_cursor                              ; 19B2 _ E8, FFFFFFFC(rel)
        jmp     ?_064                                   ; 19B7 _ E9, FFFFFBF0

?_079:  jmp     ?_064                                   ; 19BC _ E9, FFFFFBEB
; console_task End of function

cons_putstr:; Function begin
        push    ebp                                     ; 19C1 _ 55
        mov     ebp, esp                                ; 19C2 _ 89. E5
        sub     esp, 24                                 ; 19C4 _ 83. EC, 18
        jmp     ?_081                                   ; 19C7 _ EB, 1D

?_080:  mov     eax, dword [ebp+8H]                     ; 19C9 _ 8B. 45, 08
        movzx   eax, byte [eax]                         ; 19CC _ 0F B6. 00
        movsx   eax, al                                 ; 19CF _ 0F BE. C0
        mov     dword [esp+4H], 1                       ; 19D2 _ C7. 44 24, 04, 00000001
        mov     dword [esp], eax                        ; 19DA _ 89. 04 24
        call    cons_putchar                            ; 19DD _ E8, FFFFFFFC(rel)
        add     dword [ebp+8H], 1                       ; 19E2 _ 83. 45, 08, 01
?_081:  mov     eax, dword [ebp+8H]                     ; 19E6 _ 8B. 45, 08
        movzx   eax, byte [eax]                         ; 19E9 _ 0F B6. 00
        test    al, al                                  ; 19EC _ 84. C0
        jnz     ?_080                                   ; 19EE _ 75, D9
        nop                                             ; 19F0 _ 90
        leave                                           ; 19F1 _ C9
        ret                                             ; 19F2 _ C3
; cons_putstr End of function

api_linewin:; Function begin
        push    ebp                                     ; 19F3 _ 55
        mov     ebp, esp                                ; 19F4 _ 89. E5
        sub     esp, 32                                 ; 19F6 _ 83. EC, 20
        mov     eax, dword [ebp+0CH]                    ; 19F9 _ 8B. 45, 0C
        mov     edx, dword [ebp+14H]                    ; 19FC _ 8B. 55, 14
        sub     edx, eax                                ; 19FF _ 29. C2
        mov     eax, edx                                ; 1A01 _ 89. D0
        mov     dword [ebp-14H], eax                    ; 1A03 _ 89. 45, EC
        mov     eax, dword [ebp+10H]                    ; 1A06 _ 8B. 45, 10
        mov     edx, dword [ebp+18H]                    ; 1A09 _ 8B. 55, 18
        sub     edx, eax                                ; 1A0C _ 29. C2
        mov     eax, edx                                ; 1A0E _ 89. D0
        mov     dword [ebp-18H], eax                    ; 1A10 _ 89. 45, E8
        mov     eax, dword [ebp+0CH]                    ; 1A13 _ 8B. 45, 0C
        shl     eax, 10                                 ; 1A16 _ C1. E0, 0A
        mov     dword [ebp-8H], eax                     ; 1A19 _ 89. 45, F8
        mov     eax, dword [ebp+10H]                    ; 1A1C _ 8B. 45, 10
        shl     eax, 10                                 ; 1A1F _ C1. E0, 0A
        mov     dword [ebp-0CH], eax                    ; 1A22 _ 89. 45, F4
        cmp     dword [ebp-14H], 0                      ; 1A25 _ 83. 7D, EC, 00
        jns     ?_082                                   ; 1A29 _ 79, 03
        neg     dword [ebp-14H]                         ; 1A2B _ F7. 5D, EC
?_082:  cmp     dword [ebp-18H], 0                      ; 1A2E _ 83. 7D, E8, 00
        jns     ?_083                                   ; 1A32 _ 79, 03
        neg     dword [ebp-18H]                         ; 1A34 _ F7. 5D, E8
?_083:  mov     eax, dword [ebp-14H]                    ; 1A37 _ 8B. 45, EC
        cmp     eax, dword [ebp-18H]                    ; 1A3A _ 3B. 45, E8
        jl      ?_087                                   ; 1A3D _ 7C, 5B
        mov     eax, dword [ebp-14H]                    ; 1A3F _ 8B. 45, EC
        add     eax, 1                                  ; 1A42 _ 83. C0, 01
        mov     dword [ebp-10H], eax                    ; 1A45 _ 89. 45, F0
        mov     eax, dword [ebp+0CH]                    ; 1A48 _ 8B. 45, 0C
        cmp     eax, dword [ebp+14H]                    ; 1A4B _ 3B. 45, 14
        jle     ?_084                                   ; 1A4E _ 7E, 09
        mov     dword [ebp-14H], -1024                  ; 1A50 _ C7. 45, EC, FFFFFC00
        jmp     ?_085                                   ; 1A57 _ EB, 07

?_084:  mov     dword [ebp-14H], 1024                   ; 1A59 _ C7. 45, EC, 00000400
?_085:  mov     eax, dword [ebp+10H]                    ; 1A60 _ 8B. 45, 10
        cmp     eax, dword [ebp+18H]                    ; 1A63 _ 3B. 45, 18
        jg      ?_086                                   ; 1A66 _ 7F, 19
        mov     eax, dword [ebp+10H]                    ; 1A68 _ 8B. 45, 10
        mov     edx, dword [ebp+18H]                    ; 1A6B _ 8B. 55, 18
        sub     edx, eax                                ; 1A6E _ 29. C2
        mov     eax, edx                                ; 1A70 _ 89. D0
        add     eax, 1                                  ; 1A72 _ 83. C0, 01
        shl     eax, 10                                 ; 1A75 _ C1. E0, 0A
        cdq                                             ; 1A78 _ 99
        idiv    dword [ebp-10H]                         ; 1A79 _ F7. 7D, F0
        mov     dword [ebp-18H], eax                    ; 1A7C _ 89. 45, E8
        jmp     ?_091                                   ; 1A7F _ EB, 72

?_086:  mov     eax, dword [ebp+10H]                    ; 1A81 _ 8B. 45, 10
        mov     edx, dword [ebp+18H]                    ; 1A84 _ 8B. 55, 18
        sub     edx, eax                                ; 1A87 _ 29. C2
        mov     eax, edx                                ; 1A89 _ 89. D0
        sub     eax, 1                                  ; 1A8B _ 83. E8, 01
        shl     eax, 10                                 ; 1A8E _ C1. E0, 0A
        cdq                                             ; 1A91 _ 99
        idiv    dword [ebp-10H]                         ; 1A92 _ F7. 7D, F0
        mov     dword [ebp-18H], eax                    ; 1A95 _ 89. 45, E8
        jmp     ?_091                                   ; 1A98 _ EB, 59

?_087:  mov     eax, dword [ebp-18H]                    ; 1A9A _ 8B. 45, E8
        add     eax, 1                                  ; 1A9D _ 83. C0, 01
        mov     dword [ebp-10H], eax                    ; 1AA0 _ 89. 45, F0
        mov     eax, dword [ebp+10H]                    ; 1AA3 _ 8B. 45, 10
        cmp     eax, dword [ebp+18H]                    ; 1AA6 _ 3B. 45, 18
        jle     ?_088                                   ; 1AA9 _ 7E, 09
        mov     dword [ebp-18H], -1024                  ; 1AAB _ C7. 45, E8, FFFFFC00
        jmp     ?_089                                   ; 1AB2 _ EB, 07

?_088:  mov     dword [ebp-18H], 1024                   ; 1AB4 _ C7. 45, E8, 00000400
?_089:  mov     eax, dword [ebp+0CH]                    ; 1ABB _ 8B. 45, 0C
        cmp     eax, dword [ebp+14H]                    ; 1ABE _ 3B. 45, 14
        jg      ?_090                                   ; 1AC1 _ 7F, 19
        mov     eax, dword [ebp+0CH]                    ; 1AC3 _ 8B. 45, 0C
        mov     edx, dword [ebp+14H]                    ; 1AC6 _ 8B. 55, 14
        sub     edx, eax                                ; 1AC9 _ 29. C2
        mov     eax, edx                                ; 1ACB _ 89. D0
        add     eax, 1                                  ; 1ACD _ 83. C0, 01
        shl     eax, 10                                 ; 1AD0 _ C1. E0, 0A
        cdq                                             ; 1AD3 _ 99
        idiv    dword [ebp-10H]                         ; 1AD4 _ F7. 7D, F0
        mov     dword [ebp-14H], eax                    ; 1AD7 _ 89. 45, EC
        jmp     ?_091                                   ; 1ADA _ EB, 17

?_090:  mov     eax, dword [ebp+0CH]                    ; 1ADC _ 8B. 45, 0C
        mov     edx, dword [ebp+14H]                    ; 1ADF _ 8B. 55, 14
        sub     edx, eax                                ; 1AE2 _ 29. C2
        mov     eax, edx                                ; 1AE4 _ 89. D0
        sub     eax, 1                                  ; 1AE6 _ 83. E8, 01
        shl     eax, 10                                 ; 1AE9 _ C1. E0, 0A
        cdq                                             ; 1AEC _ 99
        idiv    dword [ebp-10H]                         ; 1AED _ F7. 7D, F0
        mov     dword [ebp-14H], eax                    ; 1AF0 _ 89. 45, EC
?_091:  mov     dword [ebp-4H], 0                       ; 1AF3 _ C7. 45, FC, 00000000
        jmp     ?_093                                   ; 1AFA _ EB, 35

?_092:  mov     eax, dword [ebp+8H]                     ; 1AFC _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 1AFF _ 8B. 10
        mov     eax, dword [ebp-0CH]                    ; 1B01 _ 8B. 45, F4
        sar     eax, 10                                 ; 1B04 _ C1. F8, 0A
        mov     ecx, eax                                ; 1B07 _ 89. C1
        mov     eax, dword [ebp+8H]                     ; 1B09 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 1B0C _ 8B. 40, 04
        imul    eax, ecx                                ; 1B0F _ 0F AF. C1
        mov     ecx, dword [ebp-8H]                     ; 1B12 _ 8B. 4D, F8
        sar     ecx, 10                                 ; 1B15 _ C1. F9, 0A
        add     eax, ecx                                ; 1B18 _ 01. C8
        add     edx, eax                                ; 1B1A _ 01. C2
        mov     eax, dword [ebp+1CH]                    ; 1B1C _ 8B. 45, 1C
        mov     byte [edx], al                          ; 1B1F _ 88. 02
        mov     eax, dword [ebp-14H]                    ; 1B21 _ 8B. 45, EC
        add     dword [ebp-8H], eax                     ; 1B24 _ 01. 45, F8
        mov     eax, dword [ebp-18H]                    ; 1B27 _ 8B. 45, E8
        add     dword [ebp-0CH], eax                    ; 1B2A _ 01. 45, F4
        add     dword [ebp-4H], 1                       ; 1B2D _ 83. 45, FC, 01
?_093:  mov     eax, dword [ebp-4H]                     ; 1B31 _ 8B. 45, FC
        cmp     eax, dword [ebp-10H]                    ; 1B34 _ 3B. 45, F0
        jl      ?_092                                   ; 1B37 _ 7C, C3
        leave                                           ; 1B39 _ C9
        ret                                             ; 1B3A _ C3
; api_linewin End of function

handle_keyboard:; Function begin
        push    ebp                                     ; 1B3B _ 55
        mov     ebp, esp                                ; 1B3C _ 89. E5
        sub     esp, 40                                 ; 1B3E _ 83. EC, 28
        mov     eax, dword [?_379]                      ; 1B41 _ A1, 00000020(d)
        mov     dword [ebp-0CH], eax                    ; 1B46 _ 89. 45, F4
?_094:  mov     eax, dword [ebp+8H]                     ; 1B49 _ 8B. 45, 08
        add     eax, 16                                 ; 1B4C _ 83. C0, 10
        mov     dword [esp], eax                        ; 1B4F _ 89. 04 24
        call    fifo8_status                            ; 1B52 _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 1B57 _ 85. C0
        jnz     ?_096                                   ; 1B59 _ 75, 23
        cmp     dword [ebp+0CH], 0                      ; 1B5B _ 83. 7D, 0C, 00
        jz      ?_095                                   ; 1B5F _ 74, 05
        jmp     ?_099                                   ; 1B61 _ E9, 00000085

?_095:  call    io_sti                                  ; 1B66 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 1B6B _ 8B. 45, 10
        add     eax, 28                                 ; 1B6E _ 83. C0, 1C
        mov     dword [eax], -1                         ; 1B71 _ C7. 00, FFFFFFFF
        mov     eax, 0                                  ; 1B77 _ B8, 00000000
        jmp     ?_100                                   ; 1B7C _ EB, 72

?_096:  mov     eax, dword [ebp+8H]                     ; 1B7E _ 8B. 45, 08
        add     eax, 16                                 ; 1B81 _ 83. C0, 10
        mov     dword [esp], eax                        ; 1B84 _ 89. 04 24
        call    fifo8_get                               ; 1B87 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 1B8C _ 89. 45, F0
        cmp     dword [ebp-10H], 1                      ; 1B8F _ 83. 7D, F0, 01
        jg      ?_097                                   ; 1B93 _ 7F, 32
        mov     eax, dword [ebp+8H]                     ; 1B95 _ 8B. 45, 08
        add     eax, 16                                 ; 1B98 _ 83. C0, 10
        mov     dword [esp+8H], 1                       ; 1B9B _ C7. 44 24, 08, 00000001
        mov     dword [esp+4H], eax                     ; 1BA3 _ 89. 44 24, 04
        mov     eax, dword [ebp-0CH]                    ; 1BA7 _ 8B. 45, F4
        mov     dword [esp], eax                        ; 1BAA _ 89. 04 24
        call    timer_init                              ; 1BAD _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 50                      ; 1BB2 _ C7. 44 24, 04, 00000032
        mov     eax, dword [ebp-0CH]                    ; 1BBA _ 8B. 45, F4
        mov     dword [esp], eax                        ; 1BBD _ 89. 04 24
        call    timer_settime                           ; 1BC0 _ E8, FFFFFFFC(rel)
        jmp     ?_099                                   ; 1BC5 _ EB, 24

?_097:  cmp     dword [ebp-10H], 2                      ; 1BC7 _ 83. 7D, F0, 02
        jnz     ?_098                                   ; 1BCB _ 75, 0C
        mov     dword [?_376], 7                        ; 1BCD _ C7. 05, 00000018(d), 00000007
        jmp     ?_099                                   ; 1BD7 _ EB, 12

?_098:  mov     eax, dword [ebp+10H]                    ; 1BD9 _ 8B. 45, 10
        lea     edx, [eax+1CH]                          ; 1BDC _ 8D. 50, 1C
        mov     eax, dword [ebp-10H]                    ; 1BDF _ 8B. 45, F0
        mov     dword [edx], eax                        ; 1BE2 _ 89. 02
        mov     eax, 0                                  ; 1BE4 _ B8, 00000000
        jmp     ?_100                                   ; 1BE9 _ EB, 05

?_099:  jmp     ?_094                                   ; 1BEB _ E9, FFFFFF59

?_100:  leave                                           ; 1BF0 _ C9
        ret                                             ; 1BF1 _ C3
; handle_keyboard End of function

kernel_api:; Function begin
        push    ebp                                     ; 1BF2 _ 55
        mov     ebp, esp                                ; 1BF3 _ 89. E5
        push    esi                                     ; 1BF5 _ 56
        push    ebx                                     ; 1BF6 _ 53
        sub     esp, 64                                 ; 1BF7 _ 83. EC, 40
        call    task_now                                ; 1BFA _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 1BFF _ 89. 45, F4
        lea     eax, [ebp+24H]                          ; 1C02 _ 8D. 45, 24
        add     eax, 4                                  ; 1C05 _ 83. C0, 04
        mov     dword [ebp-10H], eax                    ; 1C08 _ 89. 45, F0
        mov     dword [ebp-14H], 0                      ; 1C0B _ C7. 45, EC, 00000000
        cmp     dword [ebp+1CH], 1                      ; 1C12 _ 83. 7D, 1C, 01
        jnz     ?_101                                   ; 1C16 _ 75, 1B
        mov     eax, dword [ebp+24H]                    ; 1C18 _ 8B. 45, 24
        movsx   eax, al                                 ; 1C1B _ 0F BE. C0
        mov     dword [esp+4H], 1                       ; 1C1E _ C7. 44 24, 04, 00000001
        mov     dword [esp], eax                        ; 1C26 _ 89. 04 24
        call    cons_putchar                            ; 1C29 _ E8, FFFFFFFC(rel)
        jmp     ?_115                                   ; 1C2E _ E9, 00000381

?_101:  cmp     dword [ebp+1CH], 2                      ; 1C33 _ 83. 7D, 1C, 02
        jnz     ?_102                                   ; 1C37 _ 75, 18
        mov     edx, dword [buffer]                     ; 1C39 _ 8B. 15, 0000029C(d)
        mov     eax, dword [ebp+18H]                    ; 1C3F _ 8B. 45, 18
        add     eax, edx                                ; 1C42 _ 01. D0
        mov     dword [esp], eax                        ; 1C44 _ 89. 04 24
        call    cons_putstr                             ; 1C47 _ E8, FFFFFFFC(rel)
        jmp     ?_115                                   ; 1C4C _ E9, 00000363

?_102:  cmp     dword [ebp+1CH], 4                      ; 1C51 _ 83. 7D, 1C, 04
        jnz     ?_103                                   ; 1C55 _ 75, 28
        mov     eax, dword [ebp-0CH]                    ; 1C57 _ 8B. 45, F4
        mov     dword [eax+34H], 0                      ; 1C5A _ C7. 40, 34, 00000000
        mov     eax, dword [ebp-0CH]                    ; 1C61 _ 8B. 45, F4
        mov     eax, dword [eax+30H]                    ; 1C64 _ 8B. 40, 30
        mov     dword [esp], eax                        ; 1C67 _ 89. 04 24
        call    intToHexStr                             ; 1C6A _ E8, FFFFFFFC(rel)
        mov     dword [ebp-18H], eax                    ; 1C6F _ 89. 45, E8
        mov     eax, dword [task_cons]                  ; 1C72 _ A1, 00000294(d)
        add     eax, 48                                 ; 1C77 _ 83. C0, 30
        jmp     ?_116                                   ; 1C7A _ E9, 0000033A

?_103:  cmp     dword [ebp+1CH], 5                      ; 1C7F _ 83. 7D, 1C, 05
        jne     ?_104                                   ; 1C83 _ 0F 85, 000000BA
        mov     eax, dword [shtctl]                     ; 1C89 _ A1, 00000284(d)
        mov     dword [esp], eax                        ; 1C8E _ 89. 04 24
        call    sheet_alloc                             ; 1C91 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-1CH], eax                    ; 1C96 _ 89. 45, E4
        mov     eax, dword [ebp+24H]                    ; 1C99 _ 8B. 45, 24
        mov     ecx, dword [?_384]                      ; 1C9C _ 8B. 0D, 000002A0(d)
        mov     edx, dword [ebp+18H]                    ; 1CA2 _ 8B. 55, 18
        add     edx, ecx                                ; 1CA5 _ 01. CA
        mov     dword [esp+10H], eax                    ; 1CA7 _ 89. 44 24, 10
        mov     eax, dword [ebp+8H]                     ; 1CAB _ 8B. 45, 08
        mov     dword [esp+0CH], eax                    ; 1CAE _ 89. 44 24, 0C
        mov     eax, dword [ebp+0CH]                    ; 1CB2 _ 8B. 45, 0C
        mov     dword [esp+8H], eax                     ; 1CB5 _ 89. 44 24, 08
        mov     dword [esp+4H], edx                     ; 1CB9 _ 89. 54 24, 04
        mov     eax, dword [ebp-1CH]                    ; 1CBD _ 8B. 45, E4
        mov     dword [esp], eax                        ; 1CC0 _ 89. 04 24
        call    sheet_setbuf                            ; 1CC3 _ E8, FFFFFFFC(rel)
        mov     edx, dword [buffer]                     ; 1CC8 _ 8B. 15, 0000029C(d)
        mov     eax, dword [ebp+20H]                    ; 1CCE _ 8B. 45, 20
        add     edx, eax                                ; 1CD1 _ 01. C2
        mov     eax, dword [shtctl]                     ; 1CD3 _ A1, 00000284(d)
        mov     dword [esp+0CH], 0                      ; 1CD8 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], edx                     ; 1CE0 _ 89. 54 24, 08
        mov     edx, dword [ebp-1CH]                    ; 1CE4 _ 8B. 55, E4
        mov     dword [esp+4H], edx                     ; 1CE7 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1CEB _ 89. 04 24
        call    make_window8                            ; 1CEE _ E8, FFFFFFFC(rel)
        mov     eax, dword [shtctl]                     ; 1CF3 _ A1, 00000284(d)
        mov     dword [esp+0CH], 50                     ; 1CF8 _ C7. 44 24, 0C, 00000032
        mov     dword [esp+8H], 100                     ; 1D00 _ C7. 44 24, 08, 00000064
        mov     edx, dword [ebp-1CH]                    ; 1D08 _ 8B. 55, E4
        mov     dword [esp+4H], edx                     ; 1D0B _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1D0F _ 89. 04 24
        call    sheet_slide                             ; 1D12 _ E8, FFFFFFFC(rel)
        mov     eax, dword [shtctl]                     ; 1D17 _ A1, 00000284(d)
        mov     dword [esp+8H], 3                       ; 1D1C _ C7. 44 24, 08, 00000003
        mov     edx, dword [ebp-1CH]                    ; 1D24 _ 8B. 55, E4
        mov     dword [esp+4H], edx                     ; 1D27 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1D2B _ 89. 04 24
        call    sheet_updown                            ; 1D2E _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 1D33 _ 8B. 45, F0
        lea     edx, [eax+1CH]                          ; 1D36 _ 8D. 50, 1C
        mov     eax, dword [ebp-1CH]                    ; 1D39 _ 8B. 45, E4
        mov     dword [edx], eax                        ; 1D3C _ 89. 02
        jmp     ?_115                                   ; 1D3E _ E9, 00000271

?_104:  cmp     dword [ebp+1CH], 6                      ; 1D43 _ 83. 7D, 1C, 06
        jne     ?_105                                   ; 1D47 _ 0F 85, 00000086
        mov     eax, dword [ebp+18H]                    ; 1D4D _ 8B. 45, 18
        mov     dword [ebp-1CH], eax                    ; 1D50 _ 89. 45, E4
        mov     edx, dword [?_384]                      ; 1D53 _ 8B. 15, 000002A0(d)
        mov     eax, dword [ebp+10H]                    ; 1D59 _ 8B. 45, 10
        lea     ecx, [edx+eax]                          ; 1D5C _ 8D. 0C 02
        mov     eax, dword [ebp+24H]                    ; 1D5F _ 8B. 45, 24
        movsx   edx, al                                 ; 1D62 _ 0F BE. D0
        mov     eax, dword [shtctl]                     ; 1D65 _ A1, 00000284(d)
        mov     dword [esp+14H], ecx                    ; 1D6A _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 1D6E _ 89. 54 24, 10
        mov     edx, dword [ebp+8H]                     ; 1D72 _ 8B. 55, 08
        mov     dword [esp+0CH], edx                    ; 1D75 _ 89. 54 24, 0C
        mov     edx, dword [ebp+0CH]                    ; 1D79 _ 8B. 55, 0C
        mov     dword [esp+8H], edx                     ; 1D7C _ 89. 54 24, 08
        mov     edx, dword [ebp-1CH]                    ; 1D80 _ 8B. 55, E4
        mov     dword [esp+4H], edx                     ; 1D83 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1D87 _ 89. 04 24
        call    showString                              ; 1D8A _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 1D8F _ 8B. 45, 08
        lea     ecx, [eax+10H]                          ; 1D92 _ 8D. 48, 10
        mov     eax, dword [ebp+20H]                    ; 1D95 _ 8B. 45, 20
        lea     edx, [eax*8]                            ; 1D98 _ 8D. 14 C5, 00000000
        mov     eax, dword [ebp+0CH]                    ; 1D9F _ 8B. 45, 0C
        add     edx, eax                                ; 1DA2 _ 01. C2
        mov     eax, dword [shtctl]                     ; 1DA4 _ A1, 00000284(d)
        mov     dword [esp+14H], ecx                    ; 1DA9 _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 1DAD _ 89. 54 24, 10
        mov     edx, dword [ebp+8H]                     ; 1DB1 _ 8B. 55, 08
        mov     dword [esp+0CH], edx                    ; 1DB4 _ 89. 54 24, 0C
        mov     edx, dword [ebp+0CH]                    ; 1DB8 _ 8B. 55, 0C
        mov     dword [esp+8H], edx                     ; 1DBB _ 89. 54 24, 08
        mov     edx, dword [ebp-1CH]                    ; 1DBF _ 8B. 55, E4
        mov     dword [esp+4H], edx                     ; 1DC2 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1DC6 _ 89. 04 24
        call    sheet_refresh                           ; 1DC9 _ E8, FFFFFFFC(rel)
        jmp     ?_115                                   ; 1DCE _ E9, 000001E1

?_105:  cmp     dword [ebp+1CH], 7                      ; 1DD3 _ 83. 7D, 1C, 07
        jnz     ?_106                                   ; 1DD7 _ 75, 7E
        mov     eax, dword [ebp+18H]                    ; 1DD9 _ 8B. 45, 18
        mov     dword [ebp-1CH], eax                    ; 1DDC _ 89. 45, E4
        mov     ebx, dword [ebp+24H]                    ; 1DDF _ 8B. 5D, 24
        mov     eax, dword [ebp+10H]                    ; 1DE2 _ 8B. 45, 10
        movzx   ecx, al                                 ; 1DE5 _ 0F B6. C8
        mov     eax, dword [ebp-1CH]                    ; 1DE8 _ 8B. 45, E4
        mov     edx, dword [eax+4H]                     ; 1DEB _ 8B. 50, 04
        mov     eax, dword [ebp-1CH]                    ; 1DEE _ 8B. 45, E4
        mov     eax, dword [eax]                        ; 1DF1 _ 8B. 00
        mov     esi, dword [ebp+8H]                     ; 1DF3 _ 8B. 75, 08
        mov     dword [esp+18H], esi                    ; 1DF6 _ 89. 74 24, 18
        mov     esi, dword [ebp+0CH]                    ; 1DFA _ 8B. 75, 0C
        mov     dword [esp+14H], esi                    ; 1DFD _ 89. 74 24, 14
        mov     esi, dword [ebp+20H]                    ; 1E01 _ 8B. 75, 20
        mov     dword [esp+10H], esi                    ; 1E04 _ 89. 74 24, 10
        mov     dword [esp+0CH], ebx                    ; 1E08 _ 89. 5C 24, 0C
        mov     dword [esp+8H], ecx                     ; 1E0C _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 1E10 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1E14 _ 89. 04 24
        call    boxfill8                                ; 1E17 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 1E1C _ 8B. 45, 08
        lea     ebx, [eax+1H]                           ; 1E1F _ 8D. 58, 01
        mov     eax, dword [ebp+0CH]                    ; 1E22 _ 8B. 45, 0C
        lea     ecx, [eax+1H]                           ; 1E25 _ 8D. 48, 01
        mov     edx, dword [ebp+24H]                    ; 1E28 _ 8B. 55, 24
        mov     eax, dword [shtctl]                     ; 1E2B _ A1, 00000284(d)
        mov     dword [esp+14H], ebx                    ; 1E30 _ 89. 5C 24, 14
        mov     dword [esp+10H], ecx                    ; 1E34 _ 89. 4C 24, 10
        mov     ecx, dword [ebp+20H]                    ; 1E38 _ 8B. 4D, 20
        mov     dword [esp+0CH], ecx                    ; 1E3B _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 1E3F _ 89. 54 24, 08
        mov     edx, dword [ebp-1CH]                    ; 1E43 _ 8B. 55, E4
        mov     dword [esp+4H], edx                     ; 1E46 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1E4A _ 89. 04 24
        call    sheet_refresh                           ; 1E4D _ E8, FFFFFFFC(rel)
        jmp     ?_115                                   ; 1E52 _ E9, 0000015D

?_106:  cmp     dword [ebp+1CH], 11                     ; 1E57 _ 83. 7D, 1C, 0B
        jnz     ?_107                                   ; 1E5B _ 75, 28
        mov     eax, dword [ebp+18H]                    ; 1E5D _ 8B. 45, 18
        mov     dword [ebp-1CH], eax                    ; 1E60 _ 89. 45, E4
        mov     eax, dword [ebp-1CH]                    ; 1E63 _ 8B. 45, E4
        mov     edx, dword [eax]                        ; 1E66 _ 8B. 10
        mov     eax, dword [ebp-1CH]                    ; 1E68 _ 8B. 45, E4
        mov     eax, dword [eax+4H]                     ; 1E6B _ 8B. 40, 04
        imul    eax, dword [ebp+8H]                     ; 1E6E _ 0F AF. 45, 08
        mov     ecx, eax                                ; 1E72 _ 89. C1
        mov     eax, dword [ebp+0CH]                    ; 1E74 _ 8B. 45, 0C
        add     eax, ecx                                ; 1E77 _ 01. C8
        add     edx, eax                                ; 1E79 _ 01. C2
        mov     eax, dword [ebp+24H]                    ; 1E7B _ 8B. 45, 24
        mov     byte [edx], al                          ; 1E7E _ 88. 02
        jmp     ?_115                                   ; 1E80 _ E9, 0000012F

?_107:  cmp     dword [ebp+1CH], 12                     ; 1E85 _ 83. 7D, 1C, 0C
        jnz     ?_108                                   ; 1E89 _ 75, 3B
        mov     eax, dword [ebp+18H]                    ; 1E8B _ 8B. 45, 18
        mov     dword [ebp-1CH], eax                    ; 1E8E _ 89. 45, E4
        mov     edx, dword [ebp+24H]                    ; 1E91 _ 8B. 55, 24
        mov     eax, dword [shtctl]                     ; 1E94 _ A1, 00000284(d)
        mov     ecx, dword [ebp+8H]                     ; 1E99 _ 8B. 4D, 08
        mov     dword [esp+14H], ecx                    ; 1E9C _ 89. 4C 24, 14
        mov     ecx, dword [ebp+0CH]                    ; 1EA0 _ 8B. 4D, 0C
        mov     dword [esp+10H], ecx                    ; 1EA3 _ 89. 4C 24, 10
        mov     ecx, dword [ebp+20H]                    ; 1EA7 _ 8B. 4D, 20
        mov     dword [esp+0CH], ecx                    ; 1EAA _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 1EAE _ 89. 54 24, 08
        mov     edx, dword [ebp-1CH]                    ; 1EB2 _ 8B. 55, E4
        mov     dword [esp+4H], edx                     ; 1EB5 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1EB9 _ 89. 04 24
        call    sheet_refresh                           ; 1EBC _ E8, FFFFFFFC(rel)
        jmp     ?_115                                   ; 1EC1 _ E9, 000000EE

?_108:  cmp     dword [ebp+1CH], 13                     ; 1EC6 _ 83. 7D, 1C, 0D
        jnz     ?_109                                   ; 1ECA _ 75, 39
        mov     eax, dword [ebp+18H]                    ; 1ECC _ 8B. 45, 18
        mov     dword [ebp-1CH], eax                    ; 1ECF _ 89. 45, E4
        mov     eax, dword [ebp+24H]                    ; 1ED2 _ 8B. 45, 24
        mov     edx, dword [ebp+10H]                    ; 1ED5 _ 8B. 55, 10
        mov     dword [esp+14H], edx                    ; 1ED8 _ 89. 54 24, 14
        mov     edx, dword [ebp+8H]                     ; 1EDC _ 8B. 55, 08
        mov     dword [esp+10H], edx                    ; 1EDF _ 89. 54 24, 10
        mov     edx, dword [ebp+0CH]                    ; 1EE3 _ 8B. 55, 0C
        mov     dword [esp+0CH], edx                    ; 1EE6 _ 89. 54 24, 0C
        mov     edx, dword [ebp+20H]                    ; 1EEA _ 8B. 55, 20
        mov     dword [esp+8H], edx                     ; 1EED _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 1EF1 _ 89. 44 24, 04
        mov     eax, dword [ebp-1CH]                    ; 1EF5 _ 8B. 45, E4
        mov     dword [esp], eax                        ; 1EF8 _ 89. 04 24
        call    api_linewin                             ; 1EFB _ E8, FFFFFFFC(rel)
        jmp     ?_115                                   ; 1F00 _ E9, 000000AF

?_109:  cmp     dword [ebp+1CH], 14                     ; 1F05 _ 83. 7D, 1C, 0E
        jnz     ?_110                                   ; 1F09 _ 75, 1F
        mov     eax, dword [ebp+18H]                    ; 1F0B _ 8B. 45, 18
        mov     dword [ebp-1CH], eax                    ; 1F0E _ 89. 45, E4
        mov     eax, dword [shtctl]                     ; 1F11 _ A1, 00000284(d)
        mov     edx, dword [ebp-1CH]                    ; 1F16 _ 8B. 55, E4
        mov     dword [esp+4H], edx                     ; 1F19 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1F1D _ 89. 04 24
        call    sheet_free                              ; 1F20 _ E8, FFFFFFFC(rel)
        jmp     ?_115                                   ; 1F25 _ E9, 0000008A

?_110:  cmp     dword [ebp+1CH], 15                     ; 1F2A _ 83. 7D, 1C, 0F
        jnz     ?_111                                   ; 1F2E _ 75, 1B
        mov     eax, dword [ebp+24H]                    ; 1F30 _ 8B. 45, 24
        mov     edx, dword [ebp-10H]                    ; 1F33 _ 8B. 55, F0
        mov     dword [esp+8H], edx                     ; 1F36 _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 1F3A _ 89. 44 24, 04
        mov     eax, dword [ebp-0CH]                    ; 1F3E _ 8B. 45, F4
        mov     dword [esp], eax                        ; 1F41 _ 89. 04 24
        call    handle_keyboard                         ; 1F44 _ E8, FFFFFFFC(rel)
        jmp     ?_115                                   ; 1F49 _ EB, 69

?_111:  cmp     dword [ebp+1CH], 16                     ; 1F4B _ 83. 7D, 1C, 10
        jnz     ?_112                                   ; 1F4F _ 75, 0F
        mov     eax, dword [ebp-10H]                    ; 1F51 _ 8B. 45, F0
        lea     ebx, [eax+1CH]                          ; 1F54 _ 8D. 58, 1C
        call    timer_alloc                             ; 1F57 _ E8, FFFFFFFC(rel)
        mov     dword [ebx], eax                        ; 1F5C _ 89. 03
        jmp     ?_115                                   ; 1F5E _ EB, 54

?_112:  cmp     dword [ebp+1CH], 17                     ; 1F60 _ 83. 7D, 1C, 11
        jnz     ?_113                                   ; 1F64 _ 75, 21
        mov     eax, dword [ebp+24H]                    ; 1F66 _ 8B. 45, 24
        movzx   edx, al                                 ; 1F69 _ 0F B6. D0
        mov     eax, dword [ebp-0CH]                    ; 1F6C _ 8B. 45, F4
        lea     ecx, [eax+10H]                          ; 1F6F _ 8D. 48, 10
        mov     eax, dword [ebp+18H]                    ; 1F72 _ 8B. 45, 18
        mov     dword [esp+8H], edx                     ; 1F75 _ 89. 54 24, 08
        mov     dword [esp+4H], ecx                     ; 1F79 _ 89. 4C 24, 04
        mov     dword [esp], eax                        ; 1F7D _ 89. 04 24
        call    timer_init                              ; 1F80 _ E8, FFFFFFFC(rel)
        jmp     ?_115                                   ; 1F85 _ EB, 2D

?_113:  cmp     dword [ebp+1CH], 18                     ; 1F87 _ 83. 7D, 1C, 12
        jnz     ?_114                                   ; 1F8B _ 75, 16
        mov     eax, dword [ebp+24H]                    ; 1F8D _ 8B. 45, 24
        mov     edx, eax                                ; 1F90 _ 89. C2
        mov     eax, dword [ebp+18H]                    ; 1F92 _ 8B. 45, 18
        mov     dword [esp+4H], edx                     ; 1F95 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1F99 _ 89. 04 24
        call    timer_settime                           ; 1F9C _ E8, FFFFFFFC(rel)
        jmp     ?_115                                   ; 1FA1 _ EB, 11

?_114:  cmp     dword [ebp+1CH], 19                     ; 1FA3 _ 83. 7D, 1C, 13
        jnz     ?_115                                   ; 1FA7 _ 75, 0B
        mov     eax, dword [ebp+18H]                    ; 1FA9 _ 8B. 45, 18
        mov     dword [esp], eax                        ; 1FAC _ 89. 04 24
        call    timer_free                              ; 1FAF _ E8, FFFFFFFC(rel)
?_115:  mov     eax, 0                                  ; 1FB4 _ B8, 00000000
?_116:  add     esp, 64                                 ; 1FB9 _ 83. C4, 40
        pop     ebx                                     ; 1FBC _ 5B
        pop     esi                                     ; 1FBD _ 5E
        pop     ebp                                     ; 1FBE _ 5D
        ret                                             ; 1FBF _ C3
; kernel_api End of function

cons_putchar:; Function begin
        push    ebp                                     ; 1FC0 _ 55
        mov     ebp, esp                                ; 1FC1 _ 89. E5
        push    ebx                                     ; 1FC3 _ 53
        sub     esp, 36                                 ; 1FC4 _ 83. EC, 24
        mov     edx, dword [ebp+8H]                     ; 1FC7 _ 8B. 55, 08
        mov     eax, dword [ebp+0CH]                    ; 1FCA _ 8B. 45, 0C
        mov     byte [ebp-0CH], dl                      ; 1FCD _ 88. 55, F4
        mov     byte [ebp-10H], al                      ; 1FD0 _ 88. 45, F0
        mov     ebx, dword [?_375]                      ; 1FD3 _ 8B. 1D, 00000014(d)
        mov     ecx, dword [?_374]                      ; 1FD9 _ 8B. 0D, 00000010(d)
        mov     edx, dword [g_Console]                  ; 1FDF _ 8B. 15, 0000000C(d)
        mov     eax, dword [shtctl]                     ; 1FE5 _ A1, 00000284(d)
        mov     dword [esp+10H], 0                      ; 1FEA _ C7. 44 24, 10, 00000000
        mov     dword [esp+0CH], ebx                    ; 1FF2 _ 89. 5C 24, 0C
        mov     dword [esp+8H], ecx                     ; 1FF6 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 1FFA _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1FFE _ 89. 04 24
        call    set_cursor                              ; 2001 _ E8, FFFFFFFC(rel)
        movzx   eax, byte [ebp-0CH]                     ; 2006 _ 0F B6. 45, F4
        mov     byte [?_377], al                        ; 200A _ A2, 0000001C(d)
        mov     byte [?_378], 0                         ; 200F _ C6. 05, 0000001D(d), 00
        mov     ebx, dword [?_375]                      ; 2016 _ 8B. 1D, 00000014(d)
        mov     ecx, dword [?_374]                      ; 201C _ 8B. 0D, 00000010(d)
        mov     edx, dword [g_Console]                  ; 2022 _ 8B. 15, 0000000C(d)
        mov     eax, dword [shtctl]                     ; 2028 _ A1, 00000284(d)
        mov     dword [esp+14H], ?_377                  ; 202D _ C7. 44 24, 14, 0000001C(d)
        mov     dword [esp+10H], 7                      ; 2035 _ C7. 44 24, 10, 00000007
        mov     dword [esp+0CH], ebx                    ; 203D _ 89. 5C 24, 0C
        mov     dword [esp+8H], ecx                     ; 2041 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 2045 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 2049 _ 89. 04 24
        call    showString                              ; 204C _ E8, FFFFFFFC(rel)
        mov     eax, dword [?_374]                      ; 2051 _ A1, 00000010(d)
        add     eax, 8                                  ; 2056 _ 83. C0, 08
        mov     dword [?_374], eax                      ; 2059 _ A3, 00000010(d)
        add     esp, 36                                 ; 205E _ 83. C4, 24
        pop     ebx                                     ; 2061 _ 5B
        pop     ebp                                     ; 2062 _ 5D
        ret                                             ; 2063 _ C3
; cons_putchar End of function

cons_newline:; Function begin
        push    ebp                                     ; 2064 _ 55
        mov     ebp, esp                                ; 2065 _ 89. E5
        push    ebx                                     ; 2067 _ 53
        sub     esp, 52                                 ; 2068 _ 83. EC, 34
        cmp     dword [ebp+8H], 139                     ; 206B _ 81. 7D, 08, 0000008B
        jg      ?_117                                   ; 2072 _ 7F, 09
        add     dword [ebp+8H], 16                      ; 2074 _ 83. 45, 08, 10
        jmp     ?_126                                   ; 2078 _ E9, 000000DF

?_117:  mov     dword [ebp-10H], 28                     ; 207D _ C7. 45, F0, 0000001C
        jmp     ?_121                                   ; 2084 _ EB, 52

?_118:  mov     dword [ebp-0CH], 8                      ; 2086 _ C7. 45, F4, 00000008
        jmp     ?_120                                   ; 208D _ EB, 3C

?_119:  mov     eax, dword [ebp+0CH]                    ; 208F _ 8B. 45, 0C
        mov     edx, dword [eax]                        ; 2092 _ 8B. 10
        mov     eax, dword [ebp+0CH]                    ; 2094 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 2097 _ 8B. 40, 04
        imul    eax, dword [ebp-10H]                    ; 209A _ 0F AF. 45, F0
        mov     ecx, eax                                ; 209E _ 89. C1
        mov     eax, dword [ebp-0CH]                    ; 20A0 _ 8B. 45, F4
        add     eax, ecx                                ; 20A3 _ 01. C8
        add     edx, eax                                ; 20A5 _ 01. C2
        mov     eax, dword [ebp+0CH]                    ; 20A7 _ 8B. 45, 0C
        mov     ecx, dword [eax]                        ; 20AA _ 8B. 08
        mov     eax, dword [ebp-10H]                    ; 20AC _ 8B. 45, F0
        lea     ebx, [eax+10H]                          ; 20AF _ 8D. 58, 10
        mov     eax, dword [ebp+0CH]                    ; 20B2 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 20B5 _ 8B. 40, 04
        imul    ebx, eax                                ; 20B8 _ 0F AF. D8
        mov     eax, dword [ebp-0CH]                    ; 20BB _ 8B. 45, F4
        add     eax, ebx                                ; 20BE _ 01. D8
        add     eax, ecx                                ; 20C0 _ 01. C8
        movzx   eax, byte [eax]                         ; 20C2 _ 0F B6. 00
        mov     byte [edx], al                          ; 20C5 _ 88. 02
        add     dword [ebp-0CH], 1                      ; 20C7 _ 83. 45, F4, 01
?_120:  cmp     dword [ebp-0CH], 247                    ; 20CB _ 81. 7D, F4, 000000F7
        jle     ?_119                                   ; 20D2 _ 7E, BB
        add     dword [ebp-10H], 1                      ; 20D4 _ 83. 45, F0, 01
?_121:  cmp     dword [ebp-10H], 139                    ; 20D8 _ 81. 7D, F0, 0000008B
        jle     ?_118                                   ; 20DF _ 7E, A5
        mov     dword [ebp-10H], 140                    ; 20E1 _ C7. 45, F0, 0000008C
        jmp     ?_125                                   ; 20E8 _ EB, 35

?_122:  mov     dword [ebp-0CH], 8                      ; 20EA _ C7. 45, F4, 00000008
        jmp     ?_124                                   ; 20F1 _ EB, 1F

?_123:  mov     eax, dword [ebp+0CH]                    ; 20F3 _ 8B. 45, 0C
        mov     edx, dword [eax]                        ; 20F6 _ 8B. 10
        mov     eax, dword [ebp+0CH]                    ; 20F8 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 20FB _ 8B. 40, 04
        imul    eax, dword [ebp-10H]                    ; 20FE _ 0F AF. 45, F0
        mov     ecx, eax                                ; 2102 _ 89. C1
        mov     eax, dword [ebp-0CH]                    ; 2104 _ 8B. 45, F4
        add     eax, ecx                                ; 2107 _ 01. C8
        add     eax, edx                                ; 2109 _ 01. D0
        mov     byte [eax], 0                           ; 210B _ C6. 00, 00
        add     dword [ebp-0CH], 1                      ; 210E _ 83. 45, F4, 01
?_124:  cmp     dword [ebp-0CH], 247                    ; 2112 _ 81. 7D, F4, 000000F7
        jle     ?_123                                   ; 2119 _ 7E, D8
        add     dword [ebp-10H], 1                      ; 211B _ 83. 45, F0, 01
?_125:  cmp     dword [ebp-10H], 155                    ; 211F _ 81. 7D, F0, 0000009B
        jle     ?_122                                   ; 2126 _ 7E, C2
        mov     eax, dword [shtctl]                     ; 2128 _ A1, 00000284(d)
        mov     dword [esp+14H], 156                    ; 212D _ C7. 44 24, 14, 0000009C
        mov     dword [esp+10H], 248                    ; 2135 _ C7. 44 24, 10, 000000F8
        mov     dword [esp+0CH], 28                     ; 213D _ C7. 44 24, 0C, 0000001C
        mov     dword [esp+8H], 8                       ; 2145 _ C7. 44 24, 08, 00000008
        mov     edx, dword [ebp+0CH]                    ; 214D _ 8B. 55, 0C
        mov     dword [esp+4H], edx                     ; 2150 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 2154 _ 89. 04 24
        call    sheet_refresh                           ; 2157 _ E8, FFFFFFFC(rel)
?_126:  mov     eax, dword [shtctl]                     ; 215C _ A1, 00000284(d)
        mov     dword [esp+14H], ?_356                  ; 2161 _ C7. 44 24, 14, 00000030(d)
        mov     dword [esp+10H], 7                      ; 2169 _ C7. 44 24, 10, 00000007
        mov     edx, dword [ebp+8H]                     ; 2171 _ 8B. 55, 08
        mov     dword [esp+0CH], edx                    ; 2174 _ 89. 54 24, 0C
        mov     dword [esp+8H], 8                       ; 2178 _ C7. 44 24, 08, 00000008
        mov     edx, dword [ebp+0CH]                    ; 2180 _ 8B. 55, 0C
        mov     dword [esp+4H], edx                     ; 2183 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 2187 _ 89. 04 24
        call    showString                              ; 218A _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 218F _ 8B. 45, 08
        add     esp, 52                                 ; 2192 _ 83. C4, 34
        pop     ebx                                     ; 2195 _ 5B
        pop     ebp                                     ; 2196 _ 5D
        ret                                             ; 2197 _ C3
; cons_newline End of function

init_screen8:; Function begin
        push    ebp                                     ; 2198 _ 55
        mov     ebp, esp                                ; 2199 _ 89. E5
        push    ebx                                     ; 219B _ 53
        sub     esp, 36                                 ; 219C _ 83. EC, 24
        mov     eax, dword [ebp+10H]                    ; 219F _ 8B. 45, 10
        lea     edx, [eax-1DH]                          ; 21A2 _ 8D. 50, E3
        mov     eax, dword [ebp+0CH]                    ; 21A5 _ 8B. 45, 0C
        sub     eax, 1                                  ; 21A8 _ 83. E8, 01
        mov     dword [esp+18H], edx                    ; 21AB _ 89. 54 24, 18
        mov     dword [esp+14H], eax                    ; 21AF _ 89. 44 24, 14
        mov     dword [esp+10H], 0                      ; 21B3 _ C7. 44 24, 10, 00000000
        mov     dword [esp+0CH], 0                      ; 21BB _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 2                       ; 21C3 _ C7. 44 24, 08, 00000002
        mov     eax, dword [ebp+0CH]                    ; 21CB _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 21CE _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 21D2 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 21D5 _ 89. 04 24
        call    boxfill8                                ; 21D8 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 21DD _ 8B. 45, 10
        lea     ecx, [eax-1CH]                          ; 21E0 _ 8D. 48, E4
        mov     eax, dword [ebp+0CH]                    ; 21E3 _ 8B. 45, 0C
        lea     edx, [eax-1H]                           ; 21E6 _ 8D. 50, FF
        mov     eax, dword [ebp+10H]                    ; 21E9 _ 8B. 45, 10
        sub     eax, 28                                 ; 21EC _ 83. E8, 1C
        mov     dword [esp+18H], ecx                    ; 21EF _ 89. 4C 24, 18
        mov     dword [esp+14H], edx                    ; 21F3 _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 21F7 _ 89. 44 24, 10
        mov     dword [esp+0CH], 0                      ; 21FB _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 8                       ; 2203 _ C7. 44 24, 08, 00000008
        mov     eax, dword [ebp+0CH]                    ; 220B _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 220E _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2212 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2215 _ 89. 04 24
        call    boxfill8                                ; 2218 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 221D _ 8B. 45, 10
        lea     ecx, [eax-1BH]                          ; 2220 _ 8D. 48, E5
        mov     eax, dword [ebp+0CH]                    ; 2223 _ 8B. 45, 0C
        lea     edx, [eax-1H]                           ; 2226 _ 8D. 50, FF
        mov     eax, dword [ebp+10H]                    ; 2229 _ 8B. 45, 10
        sub     eax, 27                                 ; 222C _ 83. E8, 1B
        mov     dword [esp+18H], ecx                    ; 222F _ 89. 4C 24, 18
        mov     dword [esp+14H], edx                    ; 2233 _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 2237 _ 89. 44 24, 10
        mov     dword [esp+0CH], 0                      ; 223B _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 7                       ; 2243 _ C7. 44 24, 08, 00000007
        mov     eax, dword [ebp+0CH]                    ; 224B _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 224E _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2252 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2255 _ 89. 04 24
        call    boxfill8                                ; 2258 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 225D _ 8B. 45, 10
        lea     ecx, [eax-1H]                           ; 2260 _ 8D. 48, FF
        mov     eax, dword [ebp+0CH]                    ; 2263 _ 8B. 45, 0C
        lea     edx, [eax-1H]                           ; 2266 _ 8D. 50, FF
        mov     eax, dword [ebp+10H]                    ; 2269 _ 8B. 45, 10
        sub     eax, 26                                 ; 226C _ 83. E8, 1A
        mov     dword [esp+18H], ecx                    ; 226F _ 89. 4C 24, 18
        mov     dword [esp+14H], edx                    ; 2273 _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 2277 _ 89. 44 24, 10
        mov     dword [esp+0CH], 0                      ; 227B _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 8                       ; 2283 _ C7. 44 24, 08, 00000008
        mov     eax, dword [ebp+0CH]                    ; 228B _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 228E _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2292 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2295 _ 89. 04 24
        call    boxfill8                                ; 2298 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 229D _ 8B. 45, 10
        lea     edx, [eax-18H]                          ; 22A0 _ 8D. 50, E8
        mov     eax, dword [ebp+10H]                    ; 22A3 _ 8B. 45, 10
        sub     eax, 24                                 ; 22A6 _ 83. E8, 18
        mov     dword [esp+18H], edx                    ; 22A9 _ 89. 54 24, 18
        mov     dword [esp+14H], 59                     ; 22AD _ C7. 44 24, 14, 0000003B
        mov     dword [esp+10H], eax                    ; 22B5 _ 89. 44 24, 10
        mov     dword [esp+0CH], 3                      ; 22B9 _ C7. 44 24, 0C, 00000003
        mov     dword [esp+8H], 7                       ; 22C1 _ C7. 44 24, 08, 00000007
        mov     eax, dword [ebp+0CH]                    ; 22C9 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 22CC _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 22D0 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 22D3 _ 89. 04 24
        call    boxfill8                                ; 22D6 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 22DB _ 8B. 45, 10
        lea     edx, [eax-4H]                           ; 22DE _ 8D. 50, FC
        mov     eax, dword [ebp+10H]                    ; 22E1 _ 8B. 45, 10
        sub     eax, 24                                 ; 22E4 _ 83. E8, 18
        mov     dword [esp+18H], edx                    ; 22E7 _ 89. 54 24, 18
        mov     dword [esp+14H], 2                      ; 22EB _ C7. 44 24, 14, 00000002
        mov     dword [esp+10H], eax                    ; 22F3 _ 89. 44 24, 10
        mov     dword [esp+0CH], 2                      ; 22F7 _ C7. 44 24, 0C, 00000002
        mov     dword [esp+8H], 7                       ; 22FF _ C7. 44 24, 08, 00000007
        mov     eax, dword [ebp+0CH]                    ; 2307 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 230A _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 230E _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2311 _ 89. 04 24
        call    boxfill8                                ; 2314 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 2319 _ 8B. 45, 10
        lea     edx, [eax-4H]                           ; 231C _ 8D. 50, FC
        mov     eax, dword [ebp+10H]                    ; 231F _ 8B. 45, 10
        sub     eax, 4                                  ; 2322 _ 83. E8, 04
        mov     dword [esp+18H], edx                    ; 2325 _ 89. 54 24, 18
        mov     dword [esp+14H], 59                     ; 2329 _ C7. 44 24, 14, 0000003B
        mov     dword [esp+10H], eax                    ; 2331 _ 89. 44 24, 10
        mov     dword [esp+0CH], 3                      ; 2335 _ C7. 44 24, 0C, 00000003
        mov     dword [esp+8H], 2                       ; 233D _ C7. 44 24, 08, 00000002
        mov     eax, dword [ebp+0CH]                    ; 2345 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 2348 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 234C _ 8B. 45, 08
        mov     dword [esp], eax                        ; 234F _ 89. 04 24
        call    boxfill8                                ; 2352 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 2357 _ 8B. 45, 10
        lea     edx, [eax-5H]                           ; 235A _ 8D. 50, FB
        mov     eax, dword [ebp+10H]                    ; 235D _ 8B. 45, 10
        sub     eax, 23                                 ; 2360 _ 83. E8, 17
        mov     dword [esp+18H], edx                    ; 2363 _ 89. 54 24, 18
        mov     dword [esp+14H], 59                     ; 2367 _ C7. 44 24, 14, 0000003B
        mov     dword [esp+10H], eax                    ; 236F _ 89. 44 24, 10
        mov     dword [esp+0CH], 59                     ; 2373 _ C7. 44 24, 0C, 0000003B
        mov     dword [esp+8H], 2                       ; 237B _ C7. 44 24, 08, 00000002
        mov     eax, dword [ebp+0CH]                    ; 2383 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 2386 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 238A _ 8B. 45, 08
        mov     dword [esp], eax                        ; 238D _ 89. 04 24
        call    boxfill8                                ; 2390 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 2395 _ 8B. 45, 10
        lea     edx, [eax-3H]                           ; 2398 _ 8D. 50, FD
        mov     eax, dword [ebp+10H]                    ; 239B _ 8B. 45, 10
        sub     eax, 3                                  ; 239E _ 83. E8, 03
        mov     dword [esp+18H], edx                    ; 23A1 _ 89. 54 24, 18
        mov     dword [esp+14H], 59                     ; 23A5 _ C7. 44 24, 14, 0000003B
        mov     dword [esp+10H], eax                    ; 23AD _ 89. 44 24, 10
        mov     dword [esp+0CH], 2                      ; 23B1 _ C7. 44 24, 0C, 00000002
        mov     dword [esp+8H], 0                       ; 23B9 _ C7. 44 24, 08, 00000000
        mov     eax, dword [ebp+0CH]                    ; 23C1 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 23C4 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 23C8 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 23CB _ 89. 04 24
        call    boxfill8                                ; 23CE _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 23D3 _ 8B. 45, 10
        lea     edx, [eax-3H]                           ; 23D6 _ 8D. 50, FD
        mov     eax, dword [ebp+10H]                    ; 23D9 _ 8B. 45, 10
        sub     eax, 24                                 ; 23DC _ 83. E8, 18
        mov     dword [esp+18H], edx                    ; 23DF _ 89. 54 24, 18
        mov     dword [esp+14H], 60                     ; 23E3 _ C7. 44 24, 14, 0000003C
        mov     dword [esp+10H], eax                    ; 23EB _ 89. 44 24, 10
        mov     dword [esp+0CH], 60                     ; 23EF _ C7. 44 24, 0C, 0000003C
        mov     dword [esp+8H], 0                       ; 23F7 _ C7. 44 24, 08, 00000000
        mov     eax, dword [ebp+0CH]                    ; 23FF _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 2402 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2406 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2409 _ 89. 04 24
        call    boxfill8                                ; 240C _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 2411 _ 8B. 45, 10
        lea     ebx, [eax-18H]                          ; 2414 _ 8D. 58, E8
        mov     eax, dword [ebp+0CH]                    ; 2417 _ 8B. 45, 0C
        lea     ecx, [eax-4H]                           ; 241A _ 8D. 48, FC
        mov     eax, dword [ebp+10H]                    ; 241D _ 8B. 45, 10
        lea     edx, [eax-18H]                          ; 2420 _ 8D. 50, E8
        mov     eax, dword [ebp+0CH]                    ; 2423 _ 8B. 45, 0C
        sub     eax, 47                                 ; 2426 _ 83. E8, 2F
        mov     dword [esp+18H], ebx                    ; 2429 _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 242D _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 2431 _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 2435 _ 89. 44 24, 0C
        mov     dword [esp+8H], 2                       ; 2439 _ C7. 44 24, 08, 00000002
        mov     eax, dword [ebp+0CH]                    ; 2441 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 2444 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2448 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 244B _ 89. 04 24
        call    boxfill8                                ; 244E _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 2453 _ 8B. 45, 10
        lea     ebx, [eax-4H]                           ; 2456 _ 8D. 58, FC
        mov     eax, dword [ebp+0CH]                    ; 2459 _ 8B. 45, 0C
        lea     ecx, [eax-2FH]                          ; 245C _ 8D. 48, D1
        mov     eax, dword [ebp+10H]                    ; 245F _ 8B. 45, 10
        lea     edx, [eax-17H]                          ; 2462 _ 8D. 50, E9
        mov     eax, dword [ebp+0CH]                    ; 2465 _ 8B. 45, 0C
        sub     eax, 47                                 ; 2468 _ 83. E8, 2F
        mov     dword [esp+18H], ebx                    ; 246B _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 246F _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 2473 _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 2477 _ 89. 44 24, 0C
        mov     dword [esp+8H], 2                       ; 247B _ C7. 44 24, 08, 00000002
        mov     eax, dword [ebp+0CH]                    ; 2483 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 2486 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 248A _ 8B. 45, 08
        mov     dword [esp], eax                        ; 248D _ 89. 04 24
        call    boxfill8                                ; 2490 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 2495 _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 2498 _ 8D. 58, FD
        mov     eax, dword [ebp+0CH]                    ; 249B _ 8B. 45, 0C
        lea     ecx, [eax-4H]                           ; 249E _ 8D. 48, FC
        mov     eax, dword [ebp+10H]                    ; 24A1 _ 8B. 45, 10
        lea     edx, [eax-3H]                           ; 24A4 _ 8D. 50, FD
        mov     eax, dword [ebp+0CH]                    ; 24A7 _ 8B. 45, 0C
        sub     eax, 47                                 ; 24AA _ 83. E8, 2F
        mov     dword [esp+18H], ebx                    ; 24AD _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 24B1 _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 24B5 _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 24B9 _ 89. 44 24, 0C
        mov     dword [esp+8H], 7                       ; 24BD _ C7. 44 24, 08, 00000007
        mov     eax, dword [ebp+0CH]                    ; 24C5 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 24C8 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 24CC _ 8B. 45, 08
        mov     dword [esp], eax                        ; 24CF _ 89. 04 24
        call    boxfill8                                ; 24D2 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 24D7 _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 24DA _ 8D. 58, FD
        mov     eax, dword [ebp+0CH]                    ; 24DD _ 8B. 45, 0C
        lea     ecx, [eax-3H]                           ; 24E0 _ 8D. 48, FD
        mov     eax, dword [ebp+10H]                    ; 24E3 _ 8B. 45, 10
        lea     edx, [eax-18H]                          ; 24E6 _ 8D. 50, E8
        mov     eax, dword [ebp+0CH]                    ; 24E9 _ 8B. 45, 0C
        sub     eax, 3                                  ; 24EC _ 83. E8, 03
        mov     dword [esp+18H], ebx                    ; 24EF _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 24F3 _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 24F7 _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 24FB _ 89. 44 24, 0C
        mov     dword [esp+8H], 7                       ; 24FF _ C7. 44 24, 08, 00000007
        mov     eax, dword [ebp+0CH]                    ; 2507 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 250A _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 250E _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2511 _ 89. 04 24
        call    boxfill8                                ; 2514 _ E8, FFFFFFFC(rel)
        add     esp, 36                                 ; 2519 _ 83. C4, 24
        pop     ebx                                     ; 251C _ 5B
        pop     ebp                                     ; 251D _ 5D
        ret                                             ; 251E _ C3
; init_screen8 End of function

computeMousePosition:; Function begin
        push    ebp                                     ; 251F _ 55
        mov     ebp, esp                                ; 2520 _ 89. E5
        mov     eax, dword [ebp+10H]                    ; 2522 _ 8B. 45, 10
        mov     edx, dword [eax+4H]                     ; 2525 _ 8B. 50, 04
        mov     eax, dword [mx]                         ; 2528 _ A1, 00000154(d)
        add     eax, edx                                ; 252D _ 01. D0
        mov     dword [mx], eax                         ; 252F _ A3, 00000154(d)
        mov     eax, dword [ebp+10H]                    ; 2534 _ 8B. 45, 10
        mov     edx, dword [eax+8H]                     ; 2537 _ 8B. 50, 08
        mov     eax, dword [my]                         ; 253A _ A1, 00000158(d)
        add     eax, edx                                ; 253F _ 01. D0
        mov     dword [my], eax                         ; 2541 _ A3, 00000158(d)
        mov     eax, dword [mx]                         ; 2546 _ A1, 00000154(d)
        test    eax, eax                                ; 254B _ 85. C0
        jns     ?_127                                   ; 254D _ 79, 0A
        mov     dword [mx], 0                           ; 254F _ C7. 05, 00000154(d), 00000000
?_127:  mov     eax, dword [my]                         ; 2559 _ A1, 00000158(d)
        test    eax, eax                                ; 255E _ 85. C0
        jns     ?_128                                   ; 2560 _ 79, 0A
        mov     dword [my], 0                           ; 2562 _ C7. 05, 00000158(d), 00000000
?_128:  mov     eax, dword [xsize]                      ; 256C _ A1, 0000015C(d)
        lea     edx, [eax-1H]                           ; 2571 _ 8D. 50, FF
        mov     eax, dword [mx]                         ; 2574 _ A1, 00000154(d)
        cmp     edx, eax                                ; 2579 _ 39. C2
        jge     ?_129                                   ; 257B _ 7D, 0D
        mov     eax, dword [xsize]                      ; 257D _ A1, 0000015C(d)
        sub     eax, 1                                  ; 2582 _ 83. E8, 01
        mov     dword [mx], eax                         ; 2585 _ A3, 00000154(d)
?_129:  mov     eax, dword [ysize]                      ; 258A _ A1, 00000160(d)
        lea     edx, [eax-1H]                           ; 258F _ 8D. 50, FF
        mov     eax, dword [my]                         ; 2592 _ A1, 00000158(d)
        cmp     edx, eax                                ; 2597 _ 39. C2
        jge     ?_130                                   ; 2599 _ 7D, 0D
        mov     eax, dword [ysize]                      ; 259B _ A1, 00000160(d)
        sub     eax, 1                                  ; 25A0 _ 83. E8, 01
        mov     dword [my], eax                         ; 25A3 _ A3, 00000158(d)
?_130:  pop     ebp                                     ; 25A8 _ 5D
        ret                                             ; 25A9 _ C3
; computeMousePosition End of function

show_mouse_info:; Function begin
        push    ebp                                     ; 25AA _ 55
        mov     ebp, esp                                ; 25AB _ 89. E5
        sub     esp, 56                                 ; 25AD _ 83. EC, 38
        mov     eax, dword [buf_back]                   ; 25B0 _ A1, 00000164(d)
        mov     dword [ebp-10H], eax                    ; 25B5 _ 89. 45, F0
        mov     byte [ebp-11H], 0                       ; 25B8 _ C6. 45, EF, 00
        mov     dword [ebp-18H], 0                      ; 25BC _ C7. 45, E8, 00000000
        call    io_sti                                  ; 25C3 _ E8, FFFFFFFC(rel)
        mov     dword [esp], mouseinfo                  ; 25C8 _ C7. 04 24, 00000048(d)
        call    fifo8_get                               ; 25CF _ E8, FFFFFFFC(rel)
        mov     byte [ebp-11H], al                      ; 25D4 _ 88. 45, EF
        movzx   eax, byte [ebp-11H]                     ; 25D7 _ 0F B6. 45, EF
        mov     dword [esp+4H], eax                     ; 25DB _ 89. 44 24, 04
        mov     dword [esp], mdec                       ; 25DF _ C7. 04 24, 00000120(d)
        call    mouse_decode                            ; 25E6 _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 25EB _ 85. C0
        je      ?_139                                   ; 25ED _ 0F 84, 00000254
        mov     dword [esp+8H], mdec                    ; 25F3 _ C7. 44 24, 08, 00000120(d)
        mov     eax, dword [ebp+0CH]                    ; 25FB _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 25FE _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2602 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2605 _ 89. 04 24
        call    computeMousePosition                    ; 2608 _ E8, FFFFFFFC(rel)
        mov     edx, dword [my]                         ; 260D _ 8B. 15, 00000158(d)
        mov     eax, dword [mx]                         ; 2613 _ A1, 00000154(d)
        mov     dword [esp+0CH], edx                    ; 2618 _ 89. 54 24, 0C
        mov     dword [esp+8H], eax                     ; 261C _ 89. 44 24, 08
        mov     eax, dword [ebp+10H]                    ; 2620 _ 8B. 45, 10
        mov     dword [esp+4H], eax                     ; 2623 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2627 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 262A _ 89. 04 24
        call    sheet_slide                             ; 262D _ E8, FFFFFFFC(rel)
        mov     eax, dword [?_383]                      ; 2632 _ A1, 0000012C(d)
        and     eax, 01H                                ; 2637 _ 83. E0, 01
        test    eax, eax                                ; 263A _ 85. C0
        je      ?_138                                   ; 263C _ 0F 84, 000001FB
        mov     eax, dword [mmx]                        ; 2642 _ A1, 00000118(d)
        test    eax, eax                                ; 2647 _ 85. C0
        jns     ?_137                                   ; 2649 _ 0F 89, 0000017D
        mov     eax, dword [ebp+8H]                     ; 264F _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 2652 _ 8B. 40, 10
        sub     eax, 1                                  ; 2655 _ 83. E8, 01
        mov     dword [ebp-0CH], eax                    ; 2658 _ 89. 45, F4
        jmp     ?_135                                   ; 265B _ E9, 0000015E

?_131:  mov     eax, dword [ebp+8H]                     ; 2660 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 2663 _ 8B. 55, F4
        add     edx, 4                                  ; 2666 _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 2669 _ 8B. 44 90, 04
        mov     dword [ebp-18H], eax                    ; 266D _ 89. 45, E8
        mov     edx, dword [mx]                         ; 2670 _ 8B. 15, 00000154(d)
        mov     eax, dword [ebp-18H]                    ; 2676 _ 8B. 45, E8
        mov     eax, dword [eax+0CH]                    ; 2679 _ 8B. 40, 0C
        sub     edx, eax                                ; 267C _ 29. C2
        mov     eax, edx                                ; 267E _ 89. D0
        mov     dword [ebp-1CH], eax                    ; 2680 _ 89. 45, E4
        mov     edx, dword [my]                         ; 2683 _ 8B. 15, 00000158(d)
        mov     eax, dword [ebp-18H]                    ; 2689 _ 8B. 45, E8
        mov     eax, dword [eax+10H]                    ; 268C _ 8B. 40, 10
        sub     edx, eax                                ; 268F _ 29. C2
        mov     eax, edx                                ; 2691 _ 89. D0
        mov     dword [ebp-20H], eax                    ; 2693 _ 89. 45, E0
        cmp     dword [ebp-1CH], 0                      ; 2696 _ 83. 7D, E4, 00
        js      ?_134                                   ; 269A _ 0F 88, 0000011A
        mov     eax, dword [ebp-18H]                    ; 26A0 _ 8B. 45, E8
        mov     eax, dword [eax+4H]                     ; 26A3 _ 8B. 40, 04
        cmp     eax, dword [ebp-1CH]                    ; 26A6 _ 3B. 45, E4
        jle     ?_134                                   ; 26A9 _ 0F 8E, 0000010B
        cmp     dword [ebp-20H], 0                      ; 26AF _ 83. 7D, E0, 00
        js      ?_134                                   ; 26B3 _ 0F 88, 00000101
        mov     eax, dword [ebp-18H]                    ; 26B9 _ 8B. 45, E8
        mov     eax, dword [eax+8H]                     ; 26BC _ 8B. 40, 08
        cmp     eax, dword [ebp-20H]                    ; 26BF _ 3B. 45, E0
        jle     ?_134                                   ; 26C2 _ 0F 8E, 000000F2
        mov     eax, dword [ebp-18H]                    ; 26C8 _ 8B. 45, E8
        mov     edx, dword [eax]                        ; 26CB _ 8B. 10
        mov     eax, dword [ebp-18H]                    ; 26CD _ 8B. 45, E8
        mov     eax, dword [eax+4H]                     ; 26D0 _ 8B. 40, 04
        imul    eax, dword [ebp-20H]                    ; 26D3 _ 0F AF. 45, E0
        mov     ecx, eax                                ; 26D7 _ 89. C1
        mov     eax, dword [ebp-1CH]                    ; 26D9 _ 8B. 45, E4
        add     eax, ecx                                ; 26DC _ 01. C8
        add     eax, edx                                ; 26DE _ 01. D0
        movzx   eax, byte [eax]                         ; 26E0 _ 0F B6. 00
        movzx   edx, al                                 ; 26E3 _ 0F B6. D0
        mov     eax, dword [ebp-18H]                    ; 26E6 _ 8B. 45, E8
        mov     eax, dword [eax+14H]                    ; 26E9 _ 8B. 40, 14
        cmp     edx, eax                                ; 26EC _ 39. C2
        je      ?_134                                   ; 26EE _ 0F 84, 000000C6
        mov     eax, dword [ebp+8H]                     ; 26F4 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 26F7 _ 8B. 40, 10
        sub     eax, 1                                  ; 26FA _ 83. E8, 01
        mov     dword [esp+8H], eax                     ; 26FD _ 89. 44 24, 08
        mov     eax, dword [ebp-18H]                    ; 2701 _ 8B. 45, E8
        mov     dword [esp+4H], eax                     ; 2704 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2708 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 270B _ 89. 04 24
        call    sheet_updown                            ; 270E _ E8, FFFFFFFC(rel)
        cmp     dword [ebp-1CH], 2                      ; 2713 _ 83. 7D, E4, 02
        jle     ?_132                                   ; 2717 _ 7E, 36
        mov     eax, dword [ebp-18H]                    ; 2719 _ 8B. 45, E8
        mov     eax, dword [eax+4H]                     ; 271C _ 8B. 40, 04
        sub     eax, 3                                  ; 271F _ 83. E8, 03
        cmp     eax, dword [ebp-1CH]                    ; 2722 _ 3B. 45, E4
        jle     ?_132                                   ; 2725 _ 7E, 28
        cmp     dword [ebp-20H], 2                      ; 2727 _ 83. 7D, E0, 02
        jle     ?_132                                   ; 272B _ 7E, 22
        cmp     dword [ebp-20H], 20                     ; 272D _ 83. 7D, E0, 14
        jg      ?_132                                   ; 2731 _ 7F, 1C
        mov     eax, dword [mx]                         ; 2733 _ A1, 00000154(d)
        mov     dword [mmx], eax                        ; 2738 _ A3, 00000118(d)
        mov     eax, dword [my]                         ; 273D _ A1, 00000158(d)
        mov     dword [mmy], eax                        ; 2742 _ A3, 0000011C(d)
        mov     eax, dword [ebp-18H]                    ; 2747 _ 8B. 45, E8
        mov     dword [mouse_clicked_sht], eax          ; 274A _ A3, 00000290(d)
?_132:  mov     eax, dword [ebp-18H]                    ; 274F _ 8B. 45, E8
        mov     eax, dword [eax+4H]                     ; 2752 _ 8B. 40, 04
        sub     eax, 21                                 ; 2755 _ 83. E8, 15
        cmp     eax, dword [ebp-1CH]                    ; 2758 _ 3B. 45, E4
        jg      ?_133                                   ; 275B _ 7F, 5B
        mov     eax, dword [ebp-18H]                    ; 275D _ 8B. 45, E8
        mov     eax, dword [eax+4H]                     ; 2760 _ 8B. 40, 04
        sub     eax, 5                                  ; 2763 _ 83. E8, 05
        cmp     eax, dword [ebp-1CH]                    ; 2766 _ 3B. 45, E4
        jle     ?_133                                   ; 2769 _ 7E, 4D
        cmp     dword [ebp-20H], 4                      ; 276B _ 83. 7D, E0, 04
        jle     ?_133                                   ; 276F _ 7E, 47
        cmp     dword [ebp-20H], 18                     ; 2771 _ 83. 7D, E0, 12
        jg      ?_133                                   ; 2775 _ 7F, 41
        mov     eax, dword [ebp-18H]                    ; 2777 _ 8B. 45, E8
        mov     eax, dword [eax+20H]                    ; 277A _ 8B. 40, 20
        test    eax, eax                                ; 277D _ 85. C0
        jz      ?_133                                   ; 277F _ 74, 37
        call    io_cli                                  ; 2781 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-18H]                    ; 2786 _ 8B. 45, E8
        mov     dword [esp+4H], eax                     ; 2789 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 278D _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2790 _ 89. 04 24
        call    sheet_free                              ; 2793 _ E8, FFFFFFFC(rel)
        call    get_code32_addr                         ; 2798 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-24H], eax                    ; 279D _ 89. 45, DC
        mov     eax, dword [ebp-18H]                    ; 27A0 _ 8B. 45, E8
        mov     eax, dword [eax+20H]                    ; 27A3 _ 8B. 40, 20
        mov     edx, kill_process                       ; 27A6 _ BA, 00000000(d)
        sub     edx, dword [ebp-24H]                    ; 27AB _ 2B. 55, DC
        mov     dword [eax+4CH], edx                    ; 27AE _ 89. 50, 4C
        call    io_sti                                  ; 27B1 _ E8, FFFFFFFC(rel)
        jmp     ?_136                                   ; 27B6 _ EB, 12

?_133:  jmp     ?_136                                   ; 27B8 _ EB, 10

?_134:  sub     dword [ebp-0CH], 1                      ; 27BA _ 83. 6D, F4, 01
?_135:  cmp     dword [ebp-0CH], 0                      ; 27BE _ 83. 7D, F4, 00
        jg      ?_131                                   ; 27C2 _ 0F 8F, FFFFFE98
        jmp     ?_139                                   ; 27C8 _ EB, 7D

?_136:  jmp     ?_139                                   ; 27CA _ EB, 7B

?_137:  mov     edx, dword [mx]                         ; 27CC _ 8B. 15, 00000154(d)
        mov     eax, dword [mmx]                        ; 27D2 _ A1, 00000118(d)
        sub     edx, eax                                ; 27D7 _ 29. C2
        mov     eax, edx                                ; 27D9 _ 89. D0
        mov     dword [ebp-1CH], eax                    ; 27DB _ 89. 45, E4
        mov     edx, dword [my]                         ; 27DE _ 8B. 15, 00000158(d)
        mov     eax, dword [mmy]                        ; 27E4 _ A1, 0000011C(d)
        sub     edx, eax                                ; 27E9 _ 29. C2
        mov     eax, edx                                ; 27EB _ 89. D0
        mov     dword [ebp-20H], eax                    ; 27ED _ 89. 45, E0
        mov     eax, dword [mouse_clicked_sht]          ; 27F0 _ A1, 00000290(d)
        mov     edx, dword [eax+10H]                    ; 27F5 _ 8B. 50, 10
        mov     eax, dword [ebp-20H]                    ; 27F8 _ 8B. 45, E0
        lea     ecx, [edx+eax]                          ; 27FB _ 8D. 0C 02
        mov     eax, dword [mouse_clicked_sht]          ; 27FE _ A1, 00000290(d)
        mov     edx, dword [eax+0CH]                    ; 2803 _ 8B. 50, 0C
        mov     eax, dword [ebp-1CH]                    ; 2806 _ 8B. 45, E4
        add     edx, eax                                ; 2809 _ 01. C2
        mov     eax, dword [mouse_clicked_sht]          ; 280B _ A1, 00000290(d)
        mov     dword [esp+0CH], ecx                    ; 2810 _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 2814 _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 2818 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 281C _ 8B. 45, 08
        mov     dword [esp], eax                        ; 281F _ 89. 04 24
        call    sheet_slide                             ; 2822 _ E8, FFFFFFFC(rel)
        mov     eax, dword [mx]                         ; 2827 _ A1, 00000154(d)
        mov     dword [mmx], eax                        ; 282C _ A3, 00000118(d)
        mov     eax, dword [my]                         ; 2831 _ A1, 00000158(d)
        mov     dword [mmy], eax                        ; 2836 _ A3, 0000011C(d)
        jmp     ?_139                                   ; 283B _ EB, 0A

?_138:  mov     dword [mmx], -1                         ; 283D _ C7. 05, 00000118(d), FFFFFFFF
?_139:  leave                                           ; 2847 _ C9
        ret                                             ; 2848 _ C3
; show_mouse_info End of function

initBootInfo:; Function begin
        push    ebp                                     ; 2849 _ 55
        mov     ebp, esp                                ; 284A _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 284C _ 8B. 45, 08
        mov     dword [eax], -536870912                 ; 284F _ C7. 00, E0000000
        mov     eax, dword [ebp+8H]                     ; 2855 _ 8B. 45, 08
; Note: Length-changing prefix causes delay on Intel processors
        mov     word [eax+4H], 640                      ; 2858 _ 66: C7. 40, 04, 0280
        mov     eax, dword [ebp+8H]                     ; 285E _ 8B. 45, 08
; Note: Length-changing prefix causes delay on Intel processors
        mov     word [eax+6H], 480                      ; 2861 _ 66: C7. 40, 06, 01E0
        pop     ebp                                     ; 2867 _ 5D
        ret                                             ; 2868 _ C3
; initBootInfo End of function

showString:; Function begin
        push    ebp                                     ; 2869 _ 55
        mov     ebp, esp                                ; 286A _ 89. E5
        push    ebx                                     ; 286C _ 53
        sub     esp, 52                                 ; 286D _ 83. EC, 34
        mov     eax, dword [ebp+18H]                    ; 2870 _ 8B. 45, 18
        mov     byte [ebp-1CH], al                      ; 2873 _ 88. 45, E4
        mov     eax, dword [ebp+10H]                    ; 2876 _ 8B. 45, 10
        mov     dword [ebp-0CH], eax                    ; 2879 _ 89. 45, F4
        mov     dword [ebp-10H], 0                      ; 287C _ C7. 45, F0, 00000000
        jmp     ?_141                                   ; 2883 _ EB, 4B

?_140:  mov     eax, dword [ebp+1CH]                    ; 2885 _ 8B. 45, 1C
        movzx   eax, byte [eax]                         ; 2888 _ 0F B6. 00
        movzx   eax, al                                 ; 288B _ 0F B6. C0
        shl     eax, 4                                  ; 288E _ C1. E0, 04
        lea     ebx, [systemFont+eax]                   ; 2891 _ 8D. 98, 00000000(d)
        movsx   ecx, byte [ebp-1CH]                     ; 2897 _ 0F BE. 4D, E4
        mov     eax, dword [ebp+0CH]                    ; 289B _ 8B. 45, 0C
        mov     edx, dword [eax+4H]                     ; 289E _ 8B. 50, 04
        mov     eax, dword [ebp+0CH]                    ; 28A1 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 28A4 _ 8B. 00
        mov     dword [esp+14H], ebx                    ; 28A6 _ 89. 5C 24, 14
        mov     dword [esp+10H], ecx                    ; 28AA _ 89. 4C 24, 10
        mov     ecx, dword [ebp+14H]                    ; 28AE _ 8B. 4D, 14
        mov     dword [esp+0CH], ecx                    ; 28B1 _ 89. 4C 24, 0C
        mov     ecx, dword [ebp+10H]                    ; 28B5 _ 8B. 4D, 10
        mov     dword [esp+8H], ecx                     ; 28B8 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 28BC _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 28C0 _ 89. 04 24
        call    showFont8                               ; 28C3 _ E8, FFFFFFFC(rel)
        add     dword [ebp+10H], 8                      ; 28C8 _ 83. 45, 10, 08
        add     dword [ebp+1CH], 1                      ; 28CC _ 83. 45, 1C, 01
?_141:  mov     eax, dword [ebp+1CH]                    ; 28D0 _ 8B. 45, 1C
        movzx   eax, byte [eax]                         ; 28D3 _ 0F B6. 00
        test    al, al                                  ; 28D6 _ 84. C0
        jnz     ?_140                                   ; 28D8 _ 75, AB
        mov     eax, dword [ebp+14H]                    ; 28DA _ 8B. 45, 14
        add     eax, 16                                 ; 28DD _ 83. C0, 10
        mov     dword [esp+14H], eax                    ; 28E0 _ 89. 44 24, 14
        mov     eax, dword [ebp+10H]                    ; 28E4 _ 8B. 45, 10
        mov     dword [esp+10H], eax                    ; 28E7 _ 89. 44 24, 10
        mov     eax, dword [ebp+14H]                    ; 28EB _ 8B. 45, 14
        mov     dword [esp+0CH], eax                    ; 28EE _ 89. 44 24, 0C
        mov     eax, dword [ebp-0CH]                    ; 28F2 _ 8B. 45, F4
        mov     dword [esp+8H], eax                     ; 28F5 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 28F9 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 28FC _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2900 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2903 _ 89. 04 24
        call    sheet_refresh                           ; 2906 _ E8, FFFFFFFC(rel)
        add     esp, 52                                 ; 290B _ 83. C4, 34
        pop     ebx                                     ; 290E _ 5B
        pop     ebp                                     ; 290F _ 5D
        ret                                             ; 2910 _ C3
; showString End of function

init_palette:; Function begin
        push    ebp                                     ; 2911 _ 55
        mov     ebp, esp                                ; 2912 _ 89. E5
        sub     esp, 696                                ; 2914 _ 81. EC, 000002B8
        mov     dword [esp+8H], table_rgb.2054          ; 291A _ C7. 44 24, 08, 00000140(d)
        mov     dword [esp+4H], 15                      ; 2922 _ C7. 44 24, 04, 0000000F
        mov     dword [esp], 0                          ; 292A _ C7. 04 24, 00000000
        call    set_palette                             ; 2931 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-14H], 0                      ; 2936 _ C7. 45, EC, 00000000
        jmp     ?_147                                   ; 293D _ E9, 000000EF

?_142:  mov     dword [ebp-10H], 0                      ; 2942 _ C7. 45, F0, 00000000
        jmp     ?_146                                   ; 2949 _ E9, 000000D5

?_143:  mov     dword [ebp-0CH], 0                      ; 294E _ C7. 45, F4, 00000000
        jmp     ?_145                                   ; 2955 _ E9, 000000BB

?_144:  mov     edx, dword [ebp-10H]                    ; 295A _ 8B. 55, F0
        mov     eax, edx                                ; 295D _ 89. D0
        add     eax, eax                                ; 295F _ 01. C0
        add     eax, edx                                ; 2961 _ 01. D0
        add     eax, eax                                ; 2963 _ 01. C0
        mov     edx, eax                                ; 2965 _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 2967 _ 8B. 45, F4
        lea     ecx, [edx+eax]                          ; 296A _ 8D. 0C 02
        mov     edx, dword [ebp-14H]                    ; 296D _ 8B. 55, EC
        mov     eax, edx                                ; 2970 _ 89. D0
        shl     eax, 3                                  ; 2972 _ C1. E0, 03
        add     eax, edx                                ; 2975 _ 01. D0
        shl     eax, 2                                  ; 2977 _ C1. E0, 02
        lea     edx, [ecx+eax]                          ; 297A _ 8D. 14 01
        mov     eax, edx                                ; 297D _ 89. D0
        add     eax, eax                                ; 297F _ 01. C0
        add     edx, eax                                ; 2981 _ 01. C2
        mov     eax, dword [ebp-0CH]                    ; 2983 _ 8B. 45, F4
        mov     ecx, 51                                 ; 2986 _ B9, 00000033
        imul    eax, ecx                                ; 298B _ 0F AF. C1
        mov     byte [ebp+edx-29CH], al                 ; 298E _ 88. 84 15, FFFFFD64
        mov     edx, dword [ebp-10H]                    ; 2995 _ 8B. 55, F0
        mov     eax, edx                                ; 2998 _ 89. D0
        add     eax, eax                                ; 299A _ 01. C0
        add     eax, edx                                ; 299C _ 01. D0
        add     eax, eax                                ; 299E _ 01. C0
        mov     edx, eax                                ; 29A0 _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 29A2 _ 8B. 45, F4
        lea     ecx, [edx+eax]                          ; 29A5 _ 8D. 0C 02
        mov     edx, dword [ebp-14H]                    ; 29A8 _ 8B. 55, EC
        mov     eax, edx                                ; 29AB _ 89. D0
        shl     eax, 3                                  ; 29AD _ C1. E0, 03
        add     eax, edx                                ; 29B0 _ 01. D0
        shl     eax, 2                                  ; 29B2 _ C1. E0, 02
        lea     edx, [ecx+eax]                          ; 29B5 _ 8D. 14 01
        mov     eax, edx                                ; 29B8 _ 89. D0
        add     eax, eax                                ; 29BA _ 01. C0
        add     eax, edx                                ; 29BC _ 01. D0
        lea     edx, [eax+1H]                           ; 29BE _ 8D. 50, 01
        mov     eax, dword [ebp-10H]                    ; 29C1 _ 8B. 45, F0
        mov     ecx, 51                                 ; 29C4 _ B9, 00000033
        imul    eax, ecx                                ; 29C9 _ 0F AF. C1
        mov     byte [ebp+edx-29CH], al                 ; 29CC _ 88. 84 15, FFFFFD64
        mov     edx, dword [ebp-10H]                    ; 29D3 _ 8B. 55, F0
        mov     eax, edx                                ; 29D6 _ 89. D0
        add     eax, eax                                ; 29D8 _ 01. C0
        add     eax, edx                                ; 29DA _ 01. D0
        add     eax, eax                                ; 29DC _ 01. C0
        mov     edx, eax                                ; 29DE _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 29E0 _ 8B. 45, F4
        lea     ecx, [edx+eax]                          ; 29E3 _ 8D. 0C 02
        mov     edx, dword [ebp-14H]                    ; 29E6 _ 8B. 55, EC
        mov     eax, edx                                ; 29E9 _ 89. D0
        shl     eax, 3                                  ; 29EB _ C1. E0, 03
        add     eax, edx                                ; 29EE _ 01. D0
        shl     eax, 2                                  ; 29F0 _ C1. E0, 02
        lea     edx, [ecx+eax]                          ; 29F3 _ 8D. 14 01
        mov     eax, edx                                ; 29F6 _ 89. D0
        add     eax, eax                                ; 29F8 _ 01. C0
        add     eax, edx                                ; 29FA _ 01. D0
        lea     edx, [eax+2H]                           ; 29FC _ 8D. 50, 02
        mov     eax, dword [ebp-14H]                    ; 29FF _ 8B. 45, EC
        mov     ecx, 51                                 ; 2A02 _ B9, 00000033
        imul    eax, ecx                                ; 2A07 _ 0F AF. C1
        mov     byte [ebp+edx-29CH], al                 ; 2A0A _ 88. 84 15, FFFFFD64
        add     dword [ebp-0CH], 1                      ; 2A11 _ 83. 45, F4, 01
?_145:  cmp     dword [ebp-0CH], 5                      ; 2A15 _ 83. 7D, F4, 05
        jle     ?_144                                   ; 2A19 _ 0F 8E, FFFFFF3B
        add     dword [ebp-10H], 1                      ; 2A1F _ 83. 45, F0, 01
?_146:  cmp     dword [ebp-10H], 5                      ; 2A23 _ 83. 7D, F0, 05
        jle     ?_143                                   ; 2A27 _ 0F 8E, FFFFFF21
        add     dword [ebp-14H], 1                      ; 2A2D _ 83. 45, EC, 01
?_147:  cmp     dword [ebp-14H], 5                      ; 2A31 _ 83. 7D, EC, 05
        jle     ?_142                                   ; 2A35 _ 0F 8E, FFFFFF07
        lea     eax, [ebp-29CH]                         ; 2A3B _ 8D. 85, FFFFFD64
        mov     dword [esp+8H], eax                     ; 2A41 _ 89. 44 24, 08
        mov     dword [esp+4H], 231                     ; 2A45 _ C7. 44 24, 04, 000000E7
        mov     dword [esp], 16                         ; 2A4D _ C7. 04 24, 00000010
        call    set_palette                             ; 2A54 _ E8, FFFFFFFC(rel)
        nop                                             ; 2A59 _ 90
        leave                                           ; 2A5A _ C9
        ret                                             ; 2A5B _ C3
; init_palette End of function

set_palette:; Function begin
        push    ebp                                     ; 2A5C _ 55
        mov     ebp, esp                                ; 2A5D _ 89. E5
        sub     esp, 40                                 ; 2A5F _ 83. EC, 28
        call    io_load_eflags                          ; 2A62 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 2A67 _ 89. 45, F0
        call    io_cli                                  ; 2A6A _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 2A6F _ 8B. 45, 08
        mov     dword [esp+4H], eax                     ; 2A72 _ 89. 44 24, 04
        mov     dword [esp], 968                        ; 2A76 _ C7. 04 24, 000003C8
        call    io_out8                                 ; 2A7D _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 2A82 _ 8B. 45, 08
        mov     dword [ebp-0CH], eax                    ; 2A85 _ 89. 45, F4
        jmp     ?_149                                   ; 2A88 _ EB, 62

?_148:  mov     eax, dword [ebp+10H]                    ; 2A8A _ 8B. 45, 10
        movzx   eax, byte [eax]                         ; 2A8D _ 0F B6. 00
        shr     al, 2                                   ; 2A90 _ C0. E8, 02
        movzx   eax, al                                 ; 2A93 _ 0F B6. C0
        mov     dword [esp+4H], eax                     ; 2A96 _ 89. 44 24, 04
        mov     dword [esp], 969                        ; 2A9A _ C7. 04 24, 000003C9
        call    io_out8                                 ; 2AA1 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 2AA6 _ 8B. 45, 10
        add     eax, 1                                  ; 2AA9 _ 83. C0, 01
        movzx   eax, byte [eax]                         ; 2AAC _ 0F B6. 00
        shr     al, 2                                   ; 2AAF _ C0. E8, 02
        movzx   eax, al                                 ; 2AB2 _ 0F B6. C0
        mov     dword [esp+4H], eax                     ; 2AB5 _ 89. 44 24, 04
        mov     dword [esp], 969                        ; 2AB9 _ C7. 04 24, 000003C9
        call    io_out8                                 ; 2AC0 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 2AC5 _ 8B. 45, 10
        add     eax, 2                                  ; 2AC8 _ 83. C0, 02
        movzx   eax, byte [eax]                         ; 2ACB _ 0F B6. 00
        shr     al, 2                                   ; 2ACE _ C0. E8, 02
        movzx   eax, al                                 ; 2AD1 _ 0F B6. C0
        mov     dword [esp+4H], eax                     ; 2AD4 _ 89. 44 24, 04
        mov     dword [esp], 969                        ; 2AD8 _ C7. 04 24, 000003C9
        call    io_out8                                 ; 2ADF _ E8, FFFFFFFC(rel)
        add     dword [ebp+10H], 3                      ; 2AE4 _ 83. 45, 10, 03
        add     dword [ebp-0CH], 1                      ; 2AE8 _ 83. 45, F4, 01
?_149:  mov     eax, dword [ebp-0CH]                    ; 2AEC _ 8B. 45, F4
        cmp     eax, dword [ebp+0CH]                    ; 2AEF _ 3B. 45, 0C
        jle     ?_148                                   ; 2AF2 _ 7E, 96
        mov     eax, dword [ebp-10H]                    ; 2AF4 _ 8B. 45, F0
        mov     dword [esp], eax                        ; 2AF7 _ 89. 04 24
        call    io_store_eflags                         ; 2AFA _ E8, FFFFFFFC(rel)
        nop                                             ; 2AFF _ 90
        leave                                           ; 2B00 _ C9
        ret                                             ; 2B01 _ C3
; set_palette End of function

boxfill8:; Function begin
        push    ebp                                     ; 2B02 _ 55
        mov     ebp, esp                                ; 2B03 _ 89. E5
        sub     esp, 20                                 ; 2B05 _ 83. EC, 14
        mov     eax, dword [ebp+10H]                    ; 2B08 _ 8B. 45, 10
        mov     byte [ebp-14H], al                      ; 2B0B _ 88. 45, EC
        mov     eax, dword [ebp+18H]                    ; 2B0E _ 8B. 45, 18
        mov     dword [ebp-8H], eax                     ; 2B11 _ 89. 45, F8
        jmp     ?_153                                   ; 2B14 _ EB, 33

?_150:  mov     eax, dword [ebp+14H]                    ; 2B16 _ 8B. 45, 14
        mov     dword [ebp-4H], eax                     ; 2B19 _ 89. 45, FC
        jmp     ?_152                                   ; 2B1C _ EB, 1F

?_151:  mov     eax, dword [ebp-8H]                     ; 2B1E _ 8B. 45, F8
        imul    eax, dword [ebp+0CH]                    ; 2B21 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 2B25 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 2B27 _ 8B. 45, FC
        add     eax, edx                                ; 2B2A _ 01. D0
        mov     edx, eax                                ; 2B2C _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 2B2E _ 8B. 45, 08
        add     edx, eax                                ; 2B31 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 2B33 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 2B37 _ 88. 02
        add     dword [ebp-4H], 1                       ; 2B39 _ 83. 45, FC, 01
?_152:  mov     eax, dword [ebp-4H]                     ; 2B3D _ 8B. 45, FC
        cmp     eax, dword [ebp+1CH]                    ; 2B40 _ 3B. 45, 1C
        jle     ?_151                                   ; 2B43 _ 7E, D9
        add     dword [ebp-8H], 1                       ; 2B45 _ 83. 45, F8, 01
?_153:  mov     eax, dword [ebp-8H]                     ; 2B49 _ 8B. 45, F8
        cmp     eax, dword [ebp+20H]                    ; 2B4C _ 3B. 45, 20
        jle     ?_150                                   ; 2B4F _ 7E, C5
        leave                                           ; 2B51 _ C9
        ret                                             ; 2B52 _ C3
; boxfill8 End of function

showFont8:; Function begin
        push    ebp                                     ; 2B53 _ 55
        mov     ebp, esp                                ; 2B54 _ 89. E5
        sub     esp, 20                                 ; 2B56 _ 83. EC, 14
        mov     eax, dword [ebp+18H]                    ; 2B59 _ 8B. 45, 18
        mov     byte [ebp-14H], al                      ; 2B5C _ 88. 45, EC
        mov     dword [ebp-4H], 0                       ; 2B5F _ C7. 45, FC, 00000000
        jmp     ?_163                                   ; 2B66 _ E9, 0000016C

?_154:  mov     edx, dword [ebp-4H]                     ; 2B6B _ 8B. 55, FC
        mov     eax, dword [ebp+1CH]                    ; 2B6E _ 8B. 45, 1C
        add     eax, edx                                ; 2B71 _ 01. D0
        movzx   eax, byte [eax]                         ; 2B73 _ 0F B6. 00
        mov     byte [ebp-5H], al                       ; 2B76 _ 88. 45, FB
        cmp     byte [ebp-5H], 0                        ; 2B79 _ 80. 7D, FB, 00
        jns     ?_155                                   ; 2B7D _ 79, 20
        mov     eax, dword [ebp-4H]                     ; 2B7F _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 2B82 _ 8B. 55, 14
        add     eax, edx                                ; 2B85 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 2B87 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 2B8B _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 2B8D _ 8B. 45, 10
        add     eax, edx                                ; 2B90 _ 01. D0
        mov     edx, eax                                ; 2B92 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 2B94 _ 8B. 45, 08
        add     edx, eax                                ; 2B97 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 2B99 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 2B9D _ 88. 02
?_155:  movsx   eax, byte [ebp-5H]                      ; 2B9F _ 0F BE. 45, FB
        and     eax, 40H                                ; 2BA3 _ 83. E0, 40
        test    eax, eax                                ; 2BA6 _ 85. C0
        jz      ?_156                                   ; 2BA8 _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 2BAA _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 2BAD _ 8B. 55, 14
        add     eax, edx                                ; 2BB0 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 2BB2 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 2BB6 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 2BB8 _ 8B. 45, 10
        add     eax, edx                                ; 2BBB _ 01. D0
        lea     edx, [eax+1H]                           ; 2BBD _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 2BC0 _ 8B. 45, 08
        add     edx, eax                                ; 2BC3 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 2BC5 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 2BC9 _ 88. 02
?_156:  movsx   eax, byte [ebp-5H]                      ; 2BCB _ 0F BE. 45, FB
        and     eax, 20H                                ; 2BCF _ 83. E0, 20
        test    eax, eax                                ; 2BD2 _ 85. C0
        jz      ?_157                                   ; 2BD4 _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 2BD6 _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 2BD9 _ 8B. 55, 14
        add     eax, edx                                ; 2BDC _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 2BDE _ 0F AF. 45, 0C
        mov     edx, eax                                ; 2BE2 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 2BE4 _ 8B. 45, 10
        add     eax, edx                                ; 2BE7 _ 01. D0
        lea     edx, [eax+2H]                           ; 2BE9 _ 8D. 50, 02
        mov     eax, dword [ebp+8H]                     ; 2BEC _ 8B. 45, 08
        add     edx, eax                                ; 2BEF _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 2BF1 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 2BF5 _ 88. 02
?_157:  movsx   eax, byte [ebp-5H]                      ; 2BF7 _ 0F BE. 45, FB
        and     eax, 10H                                ; 2BFB _ 83. E0, 10
        test    eax, eax                                ; 2BFE _ 85. C0
        jz      ?_158                                   ; 2C00 _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 2C02 _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 2C05 _ 8B. 55, 14
        add     eax, edx                                ; 2C08 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 2C0A _ 0F AF. 45, 0C
        mov     edx, eax                                ; 2C0E _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 2C10 _ 8B. 45, 10
        add     eax, edx                                ; 2C13 _ 01. D0
        lea     edx, [eax+3H]                           ; 2C15 _ 8D. 50, 03
        mov     eax, dword [ebp+8H]                     ; 2C18 _ 8B. 45, 08
        add     edx, eax                                ; 2C1B _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 2C1D _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 2C21 _ 88. 02
?_158:  movsx   eax, byte [ebp-5H]                      ; 2C23 _ 0F BE. 45, FB
        and     eax, 08H                                ; 2C27 _ 83. E0, 08
        test    eax, eax                                ; 2C2A _ 85. C0
        jz      ?_159                                   ; 2C2C _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 2C2E _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 2C31 _ 8B. 55, 14
        add     eax, edx                                ; 2C34 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 2C36 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 2C3A _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 2C3C _ 8B. 45, 10
        add     eax, edx                                ; 2C3F _ 01. D0
        lea     edx, [eax+4H]                           ; 2C41 _ 8D. 50, 04
        mov     eax, dword [ebp+8H]                     ; 2C44 _ 8B. 45, 08
        add     edx, eax                                ; 2C47 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 2C49 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 2C4D _ 88. 02
?_159:  movsx   eax, byte [ebp-5H]                      ; 2C4F _ 0F BE. 45, FB
        and     eax, 04H                                ; 2C53 _ 83. E0, 04
        test    eax, eax                                ; 2C56 _ 85. C0
        jz      ?_160                                   ; 2C58 _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 2C5A _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 2C5D _ 8B. 55, 14
        add     eax, edx                                ; 2C60 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 2C62 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 2C66 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 2C68 _ 8B. 45, 10
        add     eax, edx                                ; 2C6B _ 01. D0
        lea     edx, [eax+5H]                           ; 2C6D _ 8D. 50, 05
        mov     eax, dword [ebp+8H]                     ; 2C70 _ 8B. 45, 08
        add     edx, eax                                ; 2C73 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 2C75 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 2C79 _ 88. 02
?_160:  movsx   eax, byte [ebp-5H]                      ; 2C7B _ 0F BE. 45, FB
        and     eax, 02H                                ; 2C7F _ 83. E0, 02
        test    eax, eax                                ; 2C82 _ 85. C0
        jz      ?_161                                   ; 2C84 _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 2C86 _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 2C89 _ 8B. 55, 14
        add     eax, edx                                ; 2C8C _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 2C8E _ 0F AF. 45, 0C
        mov     edx, eax                                ; 2C92 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 2C94 _ 8B. 45, 10
        add     eax, edx                                ; 2C97 _ 01. D0
        lea     edx, [eax+6H]                           ; 2C99 _ 8D. 50, 06
        mov     eax, dword [ebp+8H]                     ; 2C9C _ 8B. 45, 08
        add     edx, eax                                ; 2C9F _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 2CA1 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 2CA5 _ 88. 02
?_161:  movsx   eax, byte [ebp-5H]                      ; 2CA7 _ 0F BE. 45, FB
        and     eax, 01H                                ; 2CAB _ 83. E0, 01
        test    eax, eax                                ; 2CAE _ 85. C0
        jz      ?_162                                   ; 2CB0 _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 2CB2 _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 2CB5 _ 8B. 55, 14
        add     eax, edx                                ; 2CB8 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 2CBA _ 0F AF. 45, 0C
        mov     edx, eax                                ; 2CBE _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 2CC0 _ 8B. 45, 10
        add     eax, edx                                ; 2CC3 _ 01. D0
        lea     edx, [eax+7H]                           ; 2CC5 _ 8D. 50, 07
        mov     eax, dword [ebp+8H]                     ; 2CC8 _ 8B. 45, 08
        add     edx, eax                                ; 2CCB _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 2CCD _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 2CD1 _ 88. 02
?_162:  add     dword [ebp-4H], 1                       ; 2CD3 _ 83. 45, FC, 01
?_163:  cmp     dword [ebp-4H], 15                      ; 2CD7 _ 83. 7D, FC, 0F
        jle     ?_154                                   ; 2CDB _ 0F 8E, FFFFFE8A
        leave                                           ; 2CE1 _ C9
        ret                                             ; 2CE2 _ C3
; showFont8 End of function

init_mouse_cursor:; Function begin
        push    ebp                                     ; 2CE3 _ 55
        mov     ebp, esp                                ; 2CE4 _ 89. E5
        sub     esp, 20                                 ; 2CE6 _ 83. EC, 14
        mov     eax, dword [ebp+0CH]                    ; 2CE9 _ 8B. 45, 0C
        mov     byte [ebp-14H], al                      ; 2CEC _ 88. 45, EC
        mov     dword [ebp-8H], 0                       ; 2CEF _ C7. 45, F8, 00000000
        jmp     ?_170                                   ; 2CF6 _ E9, 000000B1

?_164:  mov     dword [ebp-4H], 0                       ; 2CFB _ C7. 45, FC, 00000000
        jmp     ?_169                                   ; 2D02 _ E9, 00000097

?_165:  mov     eax, dword [ebp-8H]                     ; 2D07 _ 8B. 45, F8
        shl     eax, 4                                  ; 2D0A _ C1. E0, 04
        mov     edx, eax                                ; 2D0D _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 2D0F _ 8B. 45, FC
        add     eax, edx                                ; 2D12 _ 01. D0
        add     eax, cursor.2114                        ; 2D14 _ 05, 00000180(d)
        movzx   eax, byte [eax]                         ; 2D19 _ 0F B6. 00
        cmp     al, 42                                  ; 2D1C _ 3C, 2A
        jnz     ?_166                                   ; 2D1E _ 75, 17
        mov     eax, dword [ebp-8H]                     ; 2D20 _ 8B. 45, F8
        shl     eax, 4                                  ; 2D23 _ C1. E0, 04
        mov     edx, eax                                ; 2D26 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 2D28 _ 8B. 45, FC
        add     eax, edx                                ; 2D2B _ 01. D0
        mov     edx, eax                                ; 2D2D _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 2D2F _ 8B. 45, 08
        add     eax, edx                                ; 2D32 _ 01. D0
        mov     byte [eax], 0                           ; 2D34 _ C6. 00, 00
?_166:  mov     eax, dword [ebp-8H]                     ; 2D37 _ 8B. 45, F8
        shl     eax, 4                                  ; 2D3A _ C1. E0, 04
        mov     edx, eax                                ; 2D3D _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 2D3F _ 8B. 45, FC
        add     eax, edx                                ; 2D42 _ 01. D0
        add     eax, cursor.2114                        ; 2D44 _ 05, 00000180(d)
        movzx   eax, byte [eax]                         ; 2D49 _ 0F B6. 00
        cmp     al, 79                                  ; 2D4C _ 3C, 4F
        jnz     ?_167                                   ; 2D4E _ 75, 17
        mov     eax, dword [ebp-8H]                     ; 2D50 _ 8B. 45, F8
        shl     eax, 4                                  ; 2D53 _ C1. E0, 04
        mov     edx, eax                                ; 2D56 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 2D58 _ 8B. 45, FC
        add     eax, edx                                ; 2D5B _ 01. D0
        mov     edx, eax                                ; 2D5D _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 2D5F _ 8B. 45, 08
        add     eax, edx                                ; 2D62 _ 01. D0
        mov     byte [eax], 7                           ; 2D64 _ C6. 00, 07
?_167:  mov     eax, dword [ebp-8H]                     ; 2D67 _ 8B. 45, F8
        shl     eax, 4                                  ; 2D6A _ C1. E0, 04
        mov     edx, eax                                ; 2D6D _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 2D6F _ 8B. 45, FC
        add     eax, edx                                ; 2D72 _ 01. D0
        add     eax, cursor.2114                        ; 2D74 _ 05, 00000180(d)
        movzx   eax, byte [eax]                         ; 2D79 _ 0F B6. 00
        cmp     al, 46                                  ; 2D7C _ 3C, 2E
        jnz     ?_168                                   ; 2D7E _ 75, 1A
        mov     eax, dword [ebp-8H]                     ; 2D80 _ 8B. 45, F8
        shl     eax, 4                                  ; 2D83 _ C1. E0, 04
        mov     edx, eax                                ; 2D86 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 2D88 _ 8B. 45, FC
        add     eax, edx                                ; 2D8B _ 01. D0
        mov     edx, eax                                ; 2D8D _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 2D8F _ 8B. 45, 08
        add     edx, eax                                ; 2D92 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 2D94 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 2D98 _ 88. 02
?_168:  add     dword [ebp-4H], 1                       ; 2D9A _ 83. 45, FC, 01
?_169:  cmp     dword [ebp-4H], 15                      ; 2D9E _ 83. 7D, FC, 0F
        jle     ?_165                                   ; 2DA2 _ 0F 8E, FFFFFF5F
        add     dword [ebp-8H], 1                       ; 2DA8 _ 83. 45, F8, 01
?_170:  cmp     dword [ebp-8H], 15                      ; 2DAC _ 83. 7D, F8, 0F
        jle     ?_164                                   ; 2DB0 _ 0F 8E, FFFFFF45
        leave                                           ; 2DB6 _ C9
        ret                                             ; 2DB7 _ C3
; init_mouse_cursor End of function

putblock:; Function begin
        push    ebp                                     ; 2DB8 _ 55
        mov     ebp, esp                                ; 2DB9 _ 89. E5
        sub     esp, 16                                 ; 2DBB _ 83. EC, 10
        mov     dword [ebp-8H], 0                       ; 2DBE _ C7. 45, F8, 00000000
        jmp     ?_174                                   ; 2DC5 _ EB, 50

?_171:  mov     dword [ebp-4H], 0                       ; 2DC7 _ C7. 45, FC, 00000000
        jmp     ?_173                                   ; 2DCE _ EB, 3B

?_172:  mov     eax, dword [ebp-8H]                     ; 2DD0 _ 8B. 45, F8
        mov     edx, dword [ebp+1CH]                    ; 2DD3 _ 8B. 55, 1C
        add     eax, edx                                ; 2DD6 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 2DD8 _ 0F AF. 45, 0C
        mov     edx, dword [ebp-4H]                     ; 2DDC _ 8B. 55, FC
        mov     ecx, dword [ebp+18H]                    ; 2DDF _ 8B. 4D, 18
        add     edx, ecx                                ; 2DE2 _ 01. CA
        add     eax, edx                                ; 2DE4 _ 01. D0
        mov     edx, eax                                ; 2DE6 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 2DE8 _ 8B. 45, 08
        add     edx, eax                                ; 2DEB _ 01. C2
        mov     eax, dword [ebp-8H]                     ; 2DED _ 8B. 45, F8
        imul    eax, dword [ebp+24H]                    ; 2DF0 _ 0F AF. 45, 24
        mov     ecx, eax                                ; 2DF4 _ 89. C1
        mov     eax, dword [ebp-4H]                     ; 2DF6 _ 8B. 45, FC
        add     eax, ecx                                ; 2DF9 _ 01. C8
        mov     ecx, eax                                ; 2DFB _ 89. C1
        mov     eax, dword [ebp+20H]                    ; 2DFD _ 8B. 45, 20
        add     eax, ecx                                ; 2E00 _ 01. C8
        movzx   eax, byte [eax]                         ; 2E02 _ 0F B6. 00
        mov     byte [edx], al                          ; 2E05 _ 88. 02
        add     dword [ebp-4H], 1                       ; 2E07 _ 83. 45, FC, 01
?_173:  mov     eax, dword [ebp-4H]                     ; 2E0B _ 8B. 45, FC
        cmp     eax, dword [ebp+10H]                    ; 2E0E _ 3B. 45, 10
        jl      ?_172                                   ; 2E11 _ 7C, BD
        add     dword [ebp-8H], 1                       ; 2E13 _ 83. 45, F8, 01
?_174:  mov     eax, dword [ebp-8H]                     ; 2E17 _ 8B. 45, F8
        cmp     eax, dword [ebp+14H]                    ; 2E1A _ 3B. 45, 14
        jl      ?_171                                   ; 2E1D _ 7C, A8
        leave                                           ; 2E1F _ C9
        ret                                             ; 2E20 _ C3
; putblock End of function

intHandlerFromC:; Function begin
        push    ebp                                     ; 2E21 _ 55
        mov     ebp, esp                                ; 2E22 _ 89. E5
        sub     esp, 40                                 ; 2E24 _ 83. EC, 28
        mov     eax, dword [bootInfo]                   ; 2E27 _ A1, 00000024(d)
        mov     dword [ebp-0CH], eax                    ; 2E2C _ 89. 45, F4
        movzx   eax, word [?_380]                       ; 2E2F _ 0F B7. 05, 00000028(d)
        cwde                                            ; 2E36 _ 98
        mov     dword [ebp-10H], eax                    ; 2E37 _ 89. 45, F0
        movzx   eax, word [?_381]                       ; 2E3A _ 0F B7. 05, 0000002A(d)
        cwde                                            ; 2E41 _ 98
        mov     dword [ebp-14H], eax                    ; 2E42 _ 89. 45, EC
        mov     dword [esp+4H], 32                      ; 2E45 _ C7. 44 24, 04, 00000020
        mov     dword [esp], 32                         ; 2E4D _ C7. 04 24, 00000020
        call    io_out8                                 ; 2E54 _ E8, FFFFFFFC(rel)
        mov     byte [ebp-15H], 0                       ; 2E59 _ C6. 45, EB, 00
        mov     dword [esp], 96                         ; 2E5D _ C7. 04 24, 00000060
        call    io_in8                                  ; 2E64 _ E8, FFFFFFFC(rel)
        mov     byte [ebp-15H], al                      ; 2E69 _ 88. 45, EB
        movzx   eax, byte [ebp-15H]                     ; 2E6C _ 0F B6. 45, EB
        mov     dword [esp+4H], eax                     ; 2E70 _ 89. 44 24, 04
        mov     dword [esp], keyinfo                    ; 2E74 _ C7. 04 24, 0000002C(d)
        call    fifo8_put                               ; 2E7B _ E8, FFFFFFFC(rel)
        nop                                             ; 2E80 _ 90
        leave                                           ; 2E81 _ C9
        ret                                             ; 2E82 _ C3
; intHandlerFromC End of function

charToHexVal:; Function begin
        push    ebp                                     ; 2E83 _ 55
        mov     ebp, esp                                ; 2E84 _ 89. E5
        sub     esp, 4                                  ; 2E86 _ 83. EC, 04
        mov     eax, dword [ebp+8H]                     ; 2E89 _ 8B. 45, 08
        mov     byte [ebp-4H], al                       ; 2E8C _ 88. 45, FC
        cmp     byte [ebp-4H], 9                        ; 2E8F _ 80. 7D, FC, 09
        jle     ?_175                                   ; 2E93 _ 7E, 09
        movzx   eax, byte [ebp-4H]                      ; 2E95 _ 0F B6. 45, FC
        add     eax, 55                                 ; 2E99 _ 83. C0, 37
        jmp     ?_176                                   ; 2E9C _ EB, 07

?_175:  movzx   eax, byte [ebp-4H]                      ; 2E9E _ 0F B6. 45, FC
        add     eax, 48                                 ; 2EA2 _ 83. C0, 30
?_176:  leave                                           ; 2EA5 _ C9
        ret                                             ; 2EA6 _ C3
; charToHexVal End of function

charToHexStr:; Function begin
        push    ebp                                     ; 2EA7 _ 55
        mov     ebp, esp                                ; 2EA8 _ 89. E5
        sub     esp, 24                                 ; 2EAA _ 83. EC, 18
        mov     eax, dword [ebp+8H]                     ; 2EAD _ 8B. 45, 08
        mov     byte [ebp-14H], al                      ; 2EB0 _ 88. 45, EC
        mov     dword [ebp-4H], 0                       ; 2EB3 _ C7. 45, FC, 00000000
        movzx   eax, byte [ebp-14H]                     ; 2EBA _ 0F B6. 45, EC
        and     eax, 0FH                                ; 2EBE _ 83. E0, 0F
        mov     byte [ebp-5H], al                       ; 2EC1 _ 88. 45, FB
        movsx   eax, byte [ebp-5H]                      ; 2EC4 _ 0F BE. 45, FB
        mov     dword [esp], eax                        ; 2EC8 _ 89. 04 24
        call    charToHexVal                            ; 2ECB _ E8, FFFFFFFC(rel)
        mov     byte [?_373], al                        ; 2ED0 _ A2, 00000113(d)
        movzx   eax, byte [ebp-14H]                     ; 2ED5 _ 0F B6. 45, EC
        shr     al, 4                                   ; 2ED9 _ C0. E8, 04
        mov     byte [ebp-14H], al                      ; 2EDC _ 88. 45, EC
        movzx   eax, byte [ebp-14H]                     ; 2EDF _ 0F B6. 45, EC
        movsx   eax, al                                 ; 2EE3 _ 0F BE. C0
        mov     dword [esp], eax                        ; 2EE6 _ 89. 04 24
        call    charToHexVal                            ; 2EE9 _ E8, FFFFFFFC(rel)
        mov     byte [?_372], al                        ; 2EEE _ A2, 00000112(d)
        mov     eax, keyval                             ; 2EF3 _ B8, 00000110(d)
        leave                                           ; 2EF8 _ C9
        ret                                             ; 2EF9 _ C3
; charToHexStr End of function

intToHexStr:; Function begin
        push    ebp                                     ; 2EFA _ 55
        mov     ebp, esp                                ; 2EFB _ 89. E5
        sub     esp, 16                                 ; 2EFD _ 83. EC, 10
        mov     byte [str.2162], 48                     ; 2F00 _ C6. 05, 000003B4(d), 30
        mov     byte [?_386], 88                        ; 2F07 _ C6. 05, 000003B5(d), 58
        mov     byte [?_387], 0                         ; 2F0E _ C6. 05, 000003BE(d), 00
        mov     dword [ebp-4H], 2                       ; 2F15 _ C7. 45, FC, 00000002
        jmp     ?_178                                   ; 2F1C _ EB, 0F

?_177:  mov     eax, dword [ebp-4H]                     ; 2F1E _ 8B. 45, FC
        add     eax, str.2162                           ; 2F21 _ 05, 000003B4(d)
        mov     byte [eax], 48                          ; 2F26 _ C6. 00, 30
        add     dword [ebp-4H], 1                       ; 2F29 _ 83. 45, FC, 01
?_178:  cmp     dword [ebp-4H], 9                       ; 2F2D _ 83. 7D, FC, 09
        jle     ?_177                                   ; 2F31 _ 7E, EB
        mov     dword [ebp-8H], 9                       ; 2F33 _ C7. 45, F8, 00000009
        jmp     ?_182                                   ; 2F3A _ EB, 40

?_179:  mov     eax, dword [ebp+8H]                     ; 2F3C _ 8B. 45, 08
        and     eax, 0FH                                ; 2F3F _ 83. E0, 0F
        mov     dword [ebp-0CH], eax                    ; 2F42 _ 89. 45, F4
        mov     eax, dword [ebp+8H]                     ; 2F45 _ 8B. 45, 08
        shr     eax, 4                                  ; 2F48 _ C1. E8, 04
        mov     dword [ebp+8H], eax                     ; 2F4B _ 89. 45, 08
        cmp     dword [ebp-0CH], 9                      ; 2F4E _ 83. 7D, F4, 09
        jle     ?_180                                   ; 2F52 _ 7E, 13
        mov     eax, dword [ebp-0CH]                    ; 2F54 _ 8B. 45, F4
        add     eax, 55                                 ; 2F57 _ 83. C0, 37
        mov     edx, dword [ebp-8H]                     ; 2F5A _ 8B. 55, F8
        add     edx, str.2162                           ; 2F5D _ 81. C2, 000003B4(d)
        mov     byte [edx], al                          ; 2F63 _ 88. 02
        jmp     ?_181                                   ; 2F65 _ EB, 11

?_180:  mov     eax, dword [ebp-0CH]                    ; 2F67 _ 8B. 45, F4
        add     eax, 48                                 ; 2F6A _ 83. C0, 30
        mov     edx, dword [ebp-8H]                     ; 2F6D _ 8B. 55, F8
        add     edx, str.2162                           ; 2F70 _ 81. C2, 000003B4(d)
        mov     byte [edx], al                          ; 2F76 _ 88. 02
?_181:  sub     dword [ebp-8H], 1                       ; 2F78 _ 83. 6D, F8, 01
?_182:  cmp     dword [ebp-8H], 1                       ; 2F7C _ 83. 7D, F8, 01
        jle     ?_183                                   ; 2F80 _ 7E, 06
        cmp     dword [ebp+8H], 0                       ; 2F82 _ 83. 7D, 08, 00
        jnz     ?_179                                   ; 2F86 _ 75, B4
?_183:  mov     eax, str.2162                           ; 2F88 _ B8, 000003B4(d)
        leave                                           ; 2F8D _ C9
        ret                                             ; 2F8E _ C3
; intToHexStr End of function

wait_KBC_sendready:; Function begin
        push    ebp                                     ; 2F8F _ 55
        mov     ebp, esp                                ; 2F90 _ 89. E5
        sub     esp, 24                                 ; 2F92 _ 83. EC, 18
?_184:  mov     dword [esp], 100                        ; 2F95 _ C7. 04 24, 00000064
        call    io_in8                                  ; 2F9C _ E8, FFFFFFFC(rel)
        and     eax, 02H                                ; 2FA1 _ 83. E0, 02
        test    eax, eax                                ; 2FA4 _ 85. C0
        jnz     ?_185                                   ; 2FA6 _ 75, 02
        jmp     ?_186                                   ; 2FA8 _ EB, 02

?_185:  jmp     ?_184                                   ; 2FAA _ EB, E9

?_186:  leave                                           ; 2FAC _ C9
        ret                                             ; 2FAD _ C3
; wait_KBC_sendready End of function

init_keyboard:; Function begin
        push    ebp                                     ; 2FAE _ 55
        mov     ebp, esp                                ; 2FAF _ 89. E5
        sub     esp, 24                                 ; 2FB1 _ 83. EC, 18
        call    wait_KBC_sendready                      ; 2FB4 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 96                      ; 2FB9 _ C7. 44 24, 04, 00000060
        mov     dword [esp], 100                        ; 2FC1 _ C7. 04 24, 00000064
        call    io_out8                                 ; 2FC8 _ E8, FFFFFFFC(rel)
        call    wait_KBC_sendready                      ; 2FCD _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 71                      ; 2FD2 _ C7. 44 24, 04, 00000047
        mov     dword [esp], 96                         ; 2FDA _ C7. 04 24, 00000060
        call    io_out8                                 ; 2FE1 _ E8, FFFFFFFC(rel)
        nop                                             ; 2FE6 _ 90
        leave                                           ; 2FE7 _ C9
        ret                                             ; 2FE8 _ C3
; init_keyboard End of function

enable_mouse:; Function begin
        push    ebp                                     ; 2FE9 _ 55
        mov     ebp, esp                                ; 2FEA _ 89. E5
        sub     esp, 24                                 ; 2FEC _ 83. EC, 18
        call    wait_KBC_sendready                      ; 2FEF _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 212                     ; 2FF4 _ C7. 44 24, 04, 000000D4
        mov     dword [esp], 100                        ; 2FFC _ C7. 04 24, 00000064
        call    io_out8                                 ; 3003 _ E8, FFFFFFFC(rel)
        call    wait_KBC_sendready                      ; 3008 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 244                     ; 300D _ C7. 44 24, 04, 000000F4
        mov     dword [esp], 96                         ; 3015 _ C7. 04 24, 00000060
        call    io_out8                                 ; 301C _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 3021 _ 8B. 45, 08
        mov     byte [eax+3H], 0                        ; 3024 _ C6. 40, 03, 00
        nop                                             ; 3028 _ 90
        leave                                           ; 3029 _ C9
        ret                                             ; 302A _ C3
; enable_mouse End of function

intHandlerForMouse:; Function begin
        push    ebp                                     ; 302B _ 55
        mov     ebp, esp                                ; 302C _ 89. E5
        sub     esp, 40                                 ; 302E _ 83. EC, 28
        mov     dword [esp+4H], 32                      ; 3031 _ C7. 44 24, 04, 00000020
        mov     dword [esp], 160                        ; 3039 _ C7. 04 24, 000000A0
        call    io_out8                                 ; 3040 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 32                      ; 3045 _ C7. 44 24, 04, 00000020
        mov     dword [esp], 32                         ; 304D _ C7. 04 24, 00000020
        call    io_out8                                 ; 3054 _ E8, FFFFFFFC(rel)
        mov     dword [esp], 96                         ; 3059 _ C7. 04 24, 00000060
        call    io_in8                                  ; 3060 _ E8, FFFFFFFC(rel)
        mov     byte [ebp-9H], al                       ; 3065 _ 88. 45, F7
        movzx   eax, byte [ebp-9H]                      ; 3068 _ 0F B6. 45, F7
        mov     dword [esp+4H], eax                     ; 306C _ 89. 44 24, 04
        mov     dword [esp], mouseinfo                  ; 3070 _ C7. 04 24, 00000048(d)
        call    fifo8_put                               ; 3077 _ E8, FFFFFFFC(rel)
        leave                                           ; 307C _ C9
        ret                                             ; 307D _ C3
; intHandlerForMouse End of function

mouse_decode:; Function begin
        push    ebp                                     ; 307E _ 55
        mov     ebp, esp                                ; 307F _ 89. E5
        sub     esp, 4                                  ; 3081 _ 83. EC, 04
        mov     eax, dword [ebp+0CH]                    ; 3084 _ 8B. 45, 0C
        mov     byte [ebp-4H], al                       ; 3087 _ 88. 45, FC
        mov     eax, dword [ebp+8H]                     ; 308A _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 308D _ 0F B6. 40, 03
        test    al, al                                  ; 3091 _ 84. C0
        jnz     ?_188                                   ; 3093 _ 75, 17
        cmp     byte [ebp-4H], -6                       ; 3095 _ 80. 7D, FC, FA
        jnz     ?_187                                   ; 3099 _ 75, 07
        mov     eax, dword [ebp+8H]                     ; 309B _ 8B. 45, 08
        mov     byte [eax+3H], 1                        ; 309E _ C6. 40, 03, 01
?_187:  mov     eax, 0                                  ; 30A2 _ B8, 00000000
        jmp     ?_195                                   ; 30A7 _ E9, 0000010F

?_188:  mov     eax, dword [ebp+8H]                     ; 30AC _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 30AF _ 0F B6. 40, 03
        cmp     al, 1                                   ; 30B3 _ 3C, 01
        jnz     ?_190                                   ; 30B5 _ 75, 28
        movzx   eax, byte [ebp-4H]                      ; 30B7 _ 0F B6. 45, FC
        and     eax, 0C8H                               ; 30BB _ 25, 000000C8
        cmp     eax, 8                                  ; 30C0 _ 83. F8, 08
        jnz     ?_189                                   ; 30C3 _ 75, 10
        mov     eax, dword [ebp+8H]                     ; 30C5 _ 8B. 45, 08
        movzx   edx, byte [ebp-4H]                      ; 30C8 _ 0F B6. 55, FC
        mov     byte [eax], dl                          ; 30CC _ 88. 10
        mov     eax, dword [ebp+8H]                     ; 30CE _ 8B. 45, 08
        mov     byte [eax+3H], 2                        ; 30D1 _ C6. 40, 03, 02
?_189:  mov     eax, 0                                  ; 30D5 _ B8, 00000000
        jmp     ?_195                                   ; 30DA _ E9, 000000DC

?_190:  mov     eax, dword [ebp+8H]                     ; 30DF _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 30E2 _ 0F B6. 40, 03
        cmp     al, 2                                   ; 30E6 _ 3C, 02
        jnz     ?_191                                   ; 30E8 _ 75, 1B
        mov     eax, dword [ebp+8H]                     ; 30EA _ 8B. 45, 08
        movzx   edx, byte [ebp-4H]                      ; 30ED _ 0F B6. 55, FC
        mov     byte [eax+1H], dl                       ; 30F1 _ 88. 50, 01
        mov     eax, dword [ebp+8H]                     ; 30F4 _ 8B. 45, 08
        mov     byte [eax+3H], 3                        ; 30F7 _ C6. 40, 03, 03
        mov     eax, 0                                  ; 30FB _ B8, 00000000
        jmp     ?_195                                   ; 3100 _ E9, 000000B6

?_191:  mov     eax, dword [ebp+8H]                     ; 3105 _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 3108 _ 0F B6. 40, 03
        cmp     al, 3                                   ; 310C _ 3C, 03
        jne     ?_194                                   ; 310E _ 0F 85, 000000A2
        mov     eax, dword [ebp+8H]                     ; 3114 _ 8B. 45, 08
        movzx   edx, byte [ebp-4H]                      ; 3117 _ 0F B6. 55, FC
        mov     byte [eax+2H], dl                       ; 311B _ 88. 50, 02
        mov     eax, dword [ebp+8H]                     ; 311E _ 8B. 45, 08
        mov     byte [eax+3H], 1                        ; 3121 _ C6. 40, 03, 01
        mov     eax, dword [ebp+8H]                     ; 3125 _ 8B. 45, 08
        movzx   eax, byte [eax]                         ; 3128 _ 0F B6. 00
        movzx   eax, al                                 ; 312B _ 0F B6. C0
        and     eax, 07H                                ; 312E _ 83. E0, 07
        mov     edx, eax                                ; 3131 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 3133 _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 3136 _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 3139 _ 8B. 45, 08
        movzx   eax, byte [eax+1H]                      ; 313C _ 0F B6. 40, 01
        movzx   edx, al                                 ; 3140 _ 0F B6. D0
        mov     eax, dword [ebp+8H]                     ; 3143 _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 3146 _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 3149 _ 8B. 45, 08
        movzx   eax, byte [eax+2H]                      ; 314C _ 0F B6. 40, 02
        movzx   edx, al                                 ; 3150 _ 0F B6. D0
        mov     eax, dword [ebp+8H]                     ; 3153 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 3156 _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 3159 _ 8B. 45, 08
        movzx   eax, byte [eax]                         ; 315C _ 0F B6. 00
        movzx   eax, al                                 ; 315F _ 0F B6. C0
        and     eax, 10H                                ; 3162 _ 83. E0, 10
        test    eax, eax                                ; 3165 _ 85. C0
        jz      ?_192                                   ; 3167 _ 74, 13
        mov     eax, dword [ebp+8H]                     ; 3169 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 316C _ 8B. 40, 04
        or      eax, 0FFFFFF00H                         ; 316F _ 0D, FFFFFF00
        mov     edx, eax                                ; 3174 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 3176 _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 3179 _ 89. 50, 04
?_192:  mov     eax, dword [ebp+8H]                     ; 317C _ 8B. 45, 08
        movzx   eax, byte [eax]                         ; 317F _ 0F B6. 00
        movzx   eax, al                                 ; 3182 _ 0F B6. C0
        and     eax, 20H                                ; 3185 _ 83. E0, 20
        test    eax, eax                                ; 3188 _ 85. C0
        jz      ?_193                                   ; 318A _ 74, 13
        mov     eax, dword [ebp+8H]                     ; 318C _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 318F _ 8B. 40, 08
        or      eax, 0FFFFFF00H                         ; 3192 _ 0D, FFFFFF00
        mov     edx, eax                                ; 3197 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 3199 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 319C _ 89. 50, 08
?_193:  mov     eax, dword [ebp+8H]                     ; 319F _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 31A2 _ 8B. 40, 08
        neg     eax                                     ; 31A5 _ F7. D8
        mov     edx, eax                                ; 31A7 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 31A9 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 31AC _ 89. 50, 08
        mov     eax, 1                                  ; 31AF _ B8, 00000001
        jmp     ?_195                                   ; 31B4 _ EB, 05

?_194:  mov     eax, 4294967295                         ; 31B6 _ B8, FFFFFFFF
?_195:  leave                                           ; 31BB _ C9
        ret                                             ; 31BC _ C3
; mouse_decode End of function

showMemoryInfo:; Function begin
        push    ebp                                     ; 31BD _ 55
        mov     ebp, esp                                ; 31BE _ 89. E5
        sub     esp, 72                                 ; 31C0 _ 83. EC, 48
        mov     dword [ebp-0CH], 0                      ; 31C3 _ C7. 45, F4, 00000000
        mov     dword [ebp-10H], 0                      ; 31CA _ C7. 45, F0, 00000000
        mov     dword [ebp-14H], 104                    ; 31D1 _ C7. 45, EC, 00000068
        mov     dword [ebp-18H], 80                     ; 31D8 _ C7. 45, E8, 00000050
        mov     edx, dword [ysize]                      ; 31DF _ 8B. 15, 00000160(d)
        mov     eax, dword [ebp+0CH]                    ; 31E5 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 31E8 _ 8B. 00
        mov     dword [esp+8H], edx                     ; 31EA _ 89. 54 24, 08
        mov     edx, dword [ebp+1CH]                    ; 31EE _ 8B. 55, 1C
        mov     dword [esp+4H], edx                     ; 31F1 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 31F5 _ 89. 04 24
        call    init_screen8                            ; 31F8 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+20H]                    ; 31FD _ 8B. 45, 20
        movsx   eax, al                                 ; 3200 _ 0F BE. C0
        mov     dword [esp+14H], ?_363                  ; 3203 _ C7. 44 24, 14, 0000005B(d)
        mov     dword [esp+10H], eax                    ; 320B _ 89. 44 24, 10
        mov     eax, dword [ebp-10H]                    ; 320F _ 8B. 45, F0
        mov     dword [esp+0CH], eax                    ; 3212 _ 89. 44 24, 0C
        mov     eax, dword [ebp-0CH]                    ; 3216 _ 8B. 45, F4
        mov     dword [esp+8H], eax                     ; 3219 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 321D _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 3220 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 3224 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3227 _ 89. 04 24
        call    showString                              ; 322A _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+18H]                    ; 322F _ 8B. 45, 18
        mov     dword [esp], eax                        ; 3232 _ 89. 04 24
        call    intToHexStr                             ; 3235 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-1CH], eax                    ; 323A _ 89. 45, E4
        mov     eax, dword [ebp+20H]                    ; 323D _ 8B. 45, 20
        movsx   eax, al                                 ; 3240 _ 0F BE. C0
        mov     edx, dword [ebp-1CH]                    ; 3243 _ 8B. 55, E4
        mov     dword [esp+14H], edx                    ; 3246 _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 324A _ 89. 44 24, 10
        mov     eax, dword [ebp-10H]                    ; 324E _ 8B. 45, F0
        mov     dword [esp+0CH], eax                    ; 3251 _ 89. 44 24, 0C
        mov     eax, dword [ebp-14H]                    ; 3255 _ 8B. 45, EC
        mov     dword [esp+8H], eax                     ; 3258 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 325C _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 325F _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 3263 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3266 _ 89. 04 24
        call    showString                              ; 3269 _ E8, FFFFFFFC(rel)
        add     dword [ebp-10H], 16                     ; 326E _ 83. 45, F0, 10
        mov     eax, dword [ebp+20H]                    ; 3272 _ 8B. 45, 20
        movsx   eax, al                                 ; 3275 _ 0F BE. C0
        mov     dword [esp+14H], ?_364                  ; 3278 _ C7. 44 24, 14, 00000065(d)
        mov     dword [esp+10H], eax                    ; 3280 _ 89. 44 24, 10
        mov     eax, dword [ebp-10H]                    ; 3284 _ 8B. 45, F0
        mov     dword [esp+0CH], eax                    ; 3287 _ 89. 44 24, 0C
        mov     eax, dword [ebp-0CH]                    ; 328B _ 8B. 45, F4
        mov     dword [esp+8H], eax                     ; 328E _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 3292 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 3295 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 3299 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 329C _ 89. 04 24
        call    showString                              ; 329F _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 32A4 _ 8B. 45, 10
        mov     eax, dword [eax]                        ; 32A7 _ 8B. 00
        mov     dword [esp], eax                        ; 32A9 _ 89. 04 24
        call    intToHexStr                             ; 32AC _ E8, FFFFFFFC(rel)
        mov     dword [ebp-20H], eax                    ; 32B1 _ 89. 45, E0
        mov     eax, dword [ebp+20H]                    ; 32B4 _ 8B. 45, 20
        movsx   eax, al                                 ; 32B7 _ 0F BE. C0
        mov     edx, dword [ebp-20H]                    ; 32BA _ 8B. 55, E0
        mov     dword [esp+14H], edx                    ; 32BD _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 32C1 _ 89. 44 24, 10
        mov     eax, dword [ebp-10H]                    ; 32C5 _ 8B. 45, F0
        mov     dword [esp+0CH], eax                    ; 32C8 _ 89. 44 24, 0C
        mov     eax, dword [ebp-14H]                    ; 32CC _ 8B. 45, EC
        mov     dword [esp+8H], eax                     ; 32CF _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 32D3 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 32D6 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 32DA _ 8B. 45, 08
        mov     dword [esp], eax                        ; 32DD _ 89. 04 24
        call    showString                              ; 32E0 _ E8, FFFFFFFC(rel)
        add     dword [ebp-10H], 16                     ; 32E5 _ 83. 45, F0, 10
        mov     eax, dword [ebp+20H]                    ; 32E9 _ 8B. 45, 20
        movsx   eax, al                                 ; 32EC _ 0F BE. C0
        mov     dword [esp+14H], ?_365                  ; 32EF _ C7. 44 24, 14, 00000071(d)
        mov     dword [esp+10H], eax                    ; 32F7 _ 89. 44 24, 10
        mov     eax, dword [ebp-10H]                    ; 32FB _ 8B. 45, F0
        mov     dword [esp+0CH], eax                    ; 32FE _ 89. 44 24, 0C
        mov     eax, dword [ebp-0CH]                    ; 3302 _ 8B. 45, F4
        mov     dword [esp+8H], eax                     ; 3305 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 3309 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 330C _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 3310 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3313 _ 89. 04 24
        call    showString                              ; 3316 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 331B _ 8B. 45, 10
        mov     eax, dword [eax+4H]                     ; 331E _ 8B. 40, 04
        mov     dword [esp], eax                        ; 3321 _ 89. 04 24
        call    intToHexStr                             ; 3324 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-24H], eax                    ; 3329 _ 89. 45, DC
        mov     eax, dword [ebp+20H]                    ; 332C _ 8B. 45, 20
        movsx   eax, al                                 ; 332F _ 0F BE. C0
        mov     edx, dword [ebp-24H]                    ; 3332 _ 8B. 55, DC
        mov     dword [esp+14H], edx                    ; 3335 _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 3339 _ 89. 44 24, 10
        mov     eax, dword [ebp-10H]                    ; 333D _ 8B. 45, F0
        mov     dword [esp+0CH], eax                    ; 3340 _ 89. 44 24, 0C
        mov     eax, dword [ebp-14H]                    ; 3344 _ 8B. 45, EC
        mov     dword [esp+8H], eax                     ; 3347 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 334B _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 334E _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 3352 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3355 _ 89. 04 24
        call    showString                              ; 3358 _ E8, FFFFFFFC(rel)
        add     dword [ebp-10H], 16                     ; 335D _ 83. 45, F0, 10
        mov     eax, dword [ebp+20H]                    ; 3361 _ 8B. 45, 20
        movsx   eax, al                                 ; 3364 _ 0F BE. C0
        mov     dword [esp+14H], ?_366                  ; 3367 _ C7. 44 24, 14, 0000007D(d)
        mov     dword [esp+10H], eax                    ; 336F _ 89. 44 24, 10
        mov     eax, dword [ebp-10H]                    ; 3373 _ 8B. 45, F0
        mov     dword [esp+0CH], eax                    ; 3376 _ 89. 44 24, 0C
        mov     eax, dword [ebp-0CH]                    ; 337A _ 8B. 45, F4
        mov     dword [esp+8H], eax                     ; 337D _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 3381 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 3384 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 3388 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 338B _ 89. 04 24
        call    showString                              ; 338E _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 3393 _ 8B. 45, 10
        mov     eax, dword [eax+8H]                     ; 3396 _ 8B. 40, 08
        mov     dword [esp], eax                        ; 3399 _ 89. 04 24
        call    intToHexStr                             ; 339C _ E8, FFFFFFFC(rel)
        mov     dword [ebp-28H], eax                    ; 33A1 _ 89. 45, D8
        mov     eax, dword [ebp+20H]                    ; 33A4 _ 8B. 45, 20
        movsx   eax, al                                 ; 33A7 _ 0F BE. C0
        mov     edx, dword [ebp-28H]                    ; 33AA _ 8B. 55, D8
        mov     dword [esp+14H], edx                    ; 33AD _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 33B1 _ 89. 44 24, 10
        mov     eax, dword [ebp-10H]                    ; 33B5 _ 8B. 45, F0
        mov     dword [esp+0CH], eax                    ; 33B8 _ 89. 44 24, 0C
        mov     eax, dword [ebp-14H]                    ; 33BC _ 8B. 45, EC
        mov     dword [esp+8H], eax                     ; 33BF _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 33C3 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 33C6 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 33CA _ 8B. 45, 08
        mov     dword [esp], eax                        ; 33CD _ 89. 04 24
        call    showString                              ; 33D0 _ E8, FFFFFFFC(rel)
        leave                                           ; 33D5 _ C9
        ret                                             ; 33D6 _ C3
; showMemoryInfo End of function

message_box:; Function begin
        push    ebp                                     ; 33D7 _ 55
        mov     ebp, esp                                ; 33D8 _ 89. E5
        sub     esp, 56                                 ; 33DA _ 83. EC, 38
        mov     eax, dword [ebp+8H]                     ; 33DD _ 8B. 45, 08
        mov     dword [esp], eax                        ; 33E0 _ 89. 04 24
        call    sheet_alloc                             ; 33E3 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 33E8 _ 89. 45, F4
        mov     eax, dword [memman]                     ; 33EB _ A1, 00000000(d)
        mov     dword [esp+4H], 10880                   ; 33F0 _ C7. 44 24, 04, 00002A80
        mov     dword [esp], eax                        ; 33F8 _ 89. 04 24
        call    memman_alloc_4k                         ; 33FB _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 3400 _ 89. 45, F0
        mov     dword [esp+10H], -1                     ; 3403 _ C7. 44 24, 10, FFFFFFFF
        mov     dword [esp+0CH], 68                     ; 340B _ C7. 44 24, 0C, 00000044
        mov     dword [esp+8H], 160                     ; 3413 _ C7. 44 24, 08, 000000A0
        mov     eax, dword [ebp-10H]                    ; 341B _ 8B. 45, F0
        mov     dword [esp+4H], eax                     ; 341E _ 89. 44 24, 04
        mov     eax, dword [ebp-0CH]                    ; 3422 _ 8B. 45, F4
        mov     dword [esp], eax                        ; 3425 _ 89. 04 24
        call    sheet_setbuf                            ; 3428 _ E8, FFFFFFFC(rel)
        mov     dword [esp+0CH], 1                      ; 342D _ C7. 44 24, 0C, 00000001
        mov     eax, dword [ebp+0CH]                    ; 3435 _ 8B. 45, 0C
        mov     dword [esp+8H], eax                     ; 3438 _ 89. 44 24, 08
        mov     eax, dword [ebp-0CH]                    ; 343C _ 8B. 45, F4
        mov     dword [esp+4H], eax                     ; 343F _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 3443 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3446 _ 89. 04 24
        call    make_window8                            ; 3449 _ E8, FFFFFFFC(rel)
        mov     dword [esp+14H], 7                      ; 344E _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], 16                     ; 3456 _ C7. 44 24, 10, 00000010
        mov     dword [esp+0CH], 144                    ; 345E _ C7. 44 24, 0C, 00000090
        mov     dword [esp+8H], 28                      ; 3466 _ C7. 44 24, 08, 0000001C
        mov     dword [esp+4H], 8                       ; 346E _ C7. 44 24, 04, 00000008
        mov     eax, dword [ebp-0CH]                    ; 3476 _ 8B. 45, F4
        mov     dword [esp], eax                        ; 3479 _ 89. 04 24
        call    make_textbox8                           ; 347C _ E8, FFFFFFFC(rel)
        mov     dword [esp+0CH], 172                    ; 3481 _ C7. 44 24, 0C, 000000AC
        mov     dword [esp+8H], 260                     ; 3489 _ C7. 44 24, 08, 00000104
        mov     eax, dword [ebp-0CH]                    ; 3491 _ 8B. 45, F4
        mov     dword [esp+4H], eax                     ; 3494 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 3498 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 349B _ 89. 04 24
        call    sheet_slide                             ; 349E _ E8, FFFFFFFC(rel)
        mov     dword [esp+8H], 2                       ; 34A3 _ C7. 44 24, 08, 00000002
        mov     eax, dword [ebp-0CH]                    ; 34AB _ 8B. 45, F4
        mov     dword [esp+4H], eax                     ; 34AE _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 34B2 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 34B5 _ 89. 04 24
        call    sheet_updown                            ; 34B8 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 34BD _ 8B. 45, F4
        leave                                           ; 34C0 _ C9
        ret                                             ; 34C1 _ C3
; message_box End of function

make_window8:; Function begin
        push    ebp                                     ; 34C2 _ 55
        mov     ebp, esp                                ; 34C3 _ 89. E5
        push    ebx                                     ; 34C5 _ 53
        sub     esp, 52                                 ; 34C6 _ 83. EC, 34
        mov     eax, dword [ebp+14H]                    ; 34C9 _ 8B. 45, 14
        mov     byte [ebp-1CH], al                      ; 34CC _ 88. 45, E4
        mov     eax, dword [ebp+0CH]                    ; 34CF _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 34D2 _ 8B. 40, 04
        mov     dword [ebp-0CH], eax                    ; 34D5 _ 89. 45, F4
        mov     eax, dword [ebp+0CH]                    ; 34D8 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 34DB _ 8B. 40, 08
        mov     dword [ebp-10H], eax                    ; 34DE _ 89. 45, F0
        mov     eax, dword [ebp-0CH]                    ; 34E1 _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 34E4 _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 34E7 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 34EA _ 8B. 00
        mov     dword [esp+18H], 0                      ; 34EC _ C7. 44 24, 18, 00000000
        mov     dword [esp+14H], edx                    ; 34F4 _ 89. 54 24, 14
        mov     dword [esp+10H], 0                      ; 34F8 _ C7. 44 24, 10, 00000000
        mov     dword [esp+0CH], 0                      ; 3500 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 8                       ; 3508 _ C7. 44 24, 08, 00000008
        mov     edx, dword [ebp-0CH]                    ; 3510 _ 8B. 55, F4
        mov     dword [esp+4H], edx                     ; 3513 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 3517 _ 89. 04 24
        call    boxfill8                                ; 351A _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 351F _ 8B. 45, F4
        lea     edx, [eax-2H]                           ; 3522 _ 8D. 50, FE
        mov     eax, dword [ebp+0CH]                    ; 3525 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 3528 _ 8B. 00
        mov     dword [esp+18H], 1                      ; 352A _ C7. 44 24, 18, 00000001
        mov     dword [esp+14H], edx                    ; 3532 _ 89. 54 24, 14
        mov     dword [esp+10H], 1                      ; 3536 _ C7. 44 24, 10, 00000001
        mov     dword [esp+0CH], 1                      ; 353E _ C7. 44 24, 0C, 00000001
        mov     dword [esp+8H], 7                       ; 3546 _ C7. 44 24, 08, 00000007
        mov     edx, dword [ebp-0CH]                    ; 354E _ 8B. 55, F4
        mov     dword [esp+4H], edx                     ; 3551 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 3555 _ 89. 04 24
        call    boxfill8                                ; 3558 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 355D _ 8B. 45, F0
        lea     edx, [eax-1H]                           ; 3560 _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 3563 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 3566 _ 8B. 00
        mov     dword [esp+18H], edx                    ; 3568 _ 89. 54 24, 18
        mov     dword [esp+14H], 0                      ; 356C _ C7. 44 24, 14, 00000000
        mov     dword [esp+10H], 0                      ; 3574 _ C7. 44 24, 10, 00000000
        mov     dword [esp+0CH], 0                      ; 357C _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 8                       ; 3584 _ C7. 44 24, 08, 00000008
        mov     edx, dword [ebp-0CH]                    ; 358C _ 8B. 55, F4
        mov     dword [esp+4H], edx                     ; 358F _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 3593 _ 89. 04 24
        call    boxfill8                                ; 3596 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 359B _ 8B. 45, F0
        lea     edx, [eax-1H]                           ; 359E _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 35A1 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 35A4 _ 8B. 00
        mov     dword [esp+18H], edx                    ; 35A6 _ 89. 54 24, 18
        mov     dword [esp+14H], 1                      ; 35AA _ C7. 44 24, 14, 00000001
        mov     dword [esp+10H], 1                      ; 35B2 _ C7. 44 24, 10, 00000001
        mov     dword [esp+0CH], 1                      ; 35BA _ C7. 44 24, 0C, 00000001
        mov     dword [esp+8H], 7                       ; 35C2 _ C7. 44 24, 08, 00000007
        mov     edx, dword [ebp-0CH]                    ; 35CA _ 8B. 55, F4
        mov     dword [esp+4H], edx                     ; 35CD _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 35D1 _ 89. 04 24
        call    boxfill8                                ; 35D4 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 35D9 _ 8B. 45, F0
        lea     ebx, [eax-2H]                           ; 35DC _ 8D. 58, FE
        mov     eax, dword [ebp-0CH]                    ; 35DF _ 8B. 45, F4
        lea     ecx, [eax-2H]                           ; 35E2 _ 8D. 48, FE
        mov     eax, dword [ebp-0CH]                    ; 35E5 _ 8B. 45, F4
        lea     edx, [eax-2H]                           ; 35E8 _ 8D. 50, FE
        mov     eax, dword [ebp+0CH]                    ; 35EB _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 35EE _ 8B. 00
        mov     dword [esp+18H], ebx                    ; 35F0 _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 35F4 _ 89. 4C 24, 14
        mov     dword [esp+10H], 1                      ; 35F8 _ C7. 44 24, 10, 00000001
        mov     dword [esp+0CH], edx                    ; 3600 _ 89. 54 24, 0C
        mov     dword [esp+8H], 15                      ; 3604 _ C7. 44 24, 08, 0000000F
        mov     edx, dword [ebp-0CH]                    ; 360C _ 8B. 55, F4
        mov     dword [esp+4H], edx                     ; 360F _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 3613 _ 89. 04 24
        call    boxfill8                                ; 3616 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 361B _ 8B. 45, F0
        lea     ebx, [eax-1H]                           ; 361E _ 8D. 58, FF
        mov     eax, dword [ebp-0CH]                    ; 3621 _ 8B. 45, F4
        lea     ecx, [eax-1H]                           ; 3624 _ 8D. 48, FF
        mov     eax, dword [ebp-0CH]                    ; 3627 _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 362A _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 362D _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 3630 _ 8B. 00
        mov     dword [esp+18H], ebx                    ; 3632 _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 3636 _ 89. 4C 24, 14
        mov     dword [esp+10H], 0                      ; 363A _ C7. 44 24, 10, 00000000
        mov     dword [esp+0CH], edx                    ; 3642 _ 89. 54 24, 0C
        mov     dword [esp+8H], 0                       ; 3646 _ C7. 44 24, 08, 00000000
        mov     edx, dword [ebp-0CH]                    ; 364E _ 8B. 55, F4
        mov     dword [esp+4H], edx                     ; 3651 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 3655 _ 89. 04 24
        call    boxfill8                                ; 3658 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 365D _ 8B. 45, F0
        lea     ecx, [eax-3H]                           ; 3660 _ 8D. 48, FD
        mov     eax, dword [ebp-0CH]                    ; 3663 _ 8B. 45, F4
        lea     edx, [eax-3H]                           ; 3666 _ 8D. 50, FD
        mov     eax, dword [ebp+0CH]                    ; 3669 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 366C _ 8B. 00
        mov     dword [esp+18H], ecx                    ; 366E _ 89. 4C 24, 18
        mov     dword [esp+14H], edx                    ; 3672 _ 89. 54 24, 14
        mov     dword [esp+10H], 2                      ; 3676 _ C7. 44 24, 10, 00000002
        mov     dword [esp+0CH], 2                      ; 367E _ C7. 44 24, 0C, 00000002
        mov     dword [esp+8H], 8                       ; 3686 _ C7. 44 24, 08, 00000008
        mov     edx, dword [ebp-0CH]                    ; 368E _ 8B. 55, F4
        mov     dword [esp+4H], edx                     ; 3691 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 3695 _ 89. 04 24
        call    boxfill8                                ; 3698 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 369D _ 8B. 45, F4
        lea     edx, [eax-4H]                           ; 36A0 _ 8D. 50, FC
        mov     eax, dword [ebp+0CH]                    ; 36A3 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 36A6 _ 8B. 00
        mov     dword [esp+18H], 20                     ; 36A8 _ C7. 44 24, 18, 00000014
        mov     dword [esp+14H], edx                    ; 36B0 _ 89. 54 24, 14
        mov     dword [esp+10H], 3                      ; 36B4 _ C7. 44 24, 10, 00000003
        mov     dword [esp+0CH], 3                      ; 36BC _ C7. 44 24, 0C, 00000003
        mov     dword [esp+8H], 12                      ; 36C4 _ C7. 44 24, 08, 0000000C
        mov     edx, dword [ebp-0CH]                    ; 36CC _ 8B. 55, F4
        mov     dword [esp+4H], edx                     ; 36CF _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 36D3 _ 89. 04 24
        call    boxfill8                                ; 36D6 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 36DB _ 8B. 45, F0
        lea     ebx, [eax-2H]                           ; 36DE _ 8D. 58, FE
        mov     eax, dword [ebp-0CH]                    ; 36E1 _ 8B. 45, F4
        lea     ecx, [eax-2H]                           ; 36E4 _ 8D. 48, FE
        mov     eax, dword [ebp-10H]                    ; 36E7 _ 8B. 45, F0
        lea     edx, [eax-2H]                           ; 36EA _ 8D. 50, FE
        mov     eax, dword [ebp+0CH]                    ; 36ED _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 36F0 _ 8B. 00
        mov     dword [esp+18H], ebx                    ; 36F2 _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 36F6 _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 36FA _ 89. 54 24, 10
        mov     dword [esp+0CH], 1                      ; 36FE _ C7. 44 24, 0C, 00000001
        mov     dword [esp+8H], 15                      ; 3706 _ C7. 44 24, 08, 0000000F
        mov     edx, dword [ebp-0CH]                    ; 370E _ 8B. 55, F4
        mov     dword [esp+4H], edx                     ; 3711 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 3715 _ 89. 04 24
        call    boxfill8                                ; 3718 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 371D _ 8B. 45, F0
        lea     ebx, [eax-1H]                           ; 3720 _ 8D. 58, FF
        mov     eax, dword [ebp-0CH]                    ; 3723 _ 8B. 45, F4
        lea     ecx, [eax-1H]                           ; 3726 _ 8D. 48, FF
        mov     eax, dword [ebp-10H]                    ; 3729 _ 8B. 45, F0
        lea     edx, [eax-1H]                           ; 372C _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 372F _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 3732 _ 8B. 00
        mov     dword [esp+18H], ebx                    ; 3734 _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 3738 _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 373C _ 89. 54 24, 10
        mov     dword [esp+0CH], 0                      ; 3740 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 0                       ; 3748 _ C7. 44 24, 08, 00000000
        mov     edx, dword [ebp-0CH]                    ; 3750 _ 8B. 55, F4
        mov     dword [esp+4H], edx                     ; 3753 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 3757 _ 89. 04 24
        call    boxfill8                                ; 375A _ E8, FFFFFFFC(rel)
        movsx   eax, byte [ebp-1CH]                     ; 375F _ 0F BE. 45, E4
        mov     dword [esp+0CH], eax                    ; 3763 _ 89. 44 24, 0C
        mov     eax, dword [ebp+10H]                    ; 3767 _ 8B. 45, 10
        mov     dword [esp+8H], eax                     ; 376A _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 376E _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 3771 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 3775 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3778 _ 89. 04 24
        call    make_wtitle8                            ; 377B _ E8, FFFFFFFC(rel)
        nop                                             ; 3780 _ 90
        add     esp, 52                                 ; 3781 _ 83. C4, 34
        pop     ebx                                     ; 3784 _ 5B
        pop     ebp                                     ; 3785 _ 5D
        ret                                             ; 3786 _ C3
; make_window8 End of function

make_wtitle8:; Function begin
        push    ebp                                     ; 3787 _ 55
        mov     ebp, esp                                ; 3788 _ 89. E5
        push    ebx                                     ; 378A _ 53
        sub     esp, 52                                 ; 378B _ 83. EC, 34
        mov     eax, dword [ebp+14H]                    ; 378E _ 8B. 45, 14
        mov     byte [ebp-1CH], al                      ; 3791 _ 88. 45, E4
        cmp     byte [ebp-1CH], 0                       ; 3794 _ 80. 7D, E4, 00
        jz      ?_196                                   ; 3798 _ 74, 0A
        mov     byte [ebp-12H], 7                       ; 379A _ C6. 45, EE, 07
        mov     byte [ebp-13H], 12                      ; 379E _ C6. 45, ED, 0C
        jmp     ?_197                                   ; 37A2 _ EB, 08

?_196:  mov     byte [ebp-12H], 8                       ; 37A4 _ C6. 45, EE, 08
        mov     byte [ebp-13H], 15                      ; 37A8 _ C6. 45, ED, 0F
?_197:  mov     eax, dword [ebp+0CH]                    ; 37AC _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 37AF _ 8B. 40, 04
        lea     ebx, [eax-4H]                           ; 37B2 _ 8D. 58, FC
        movzx   eax, byte [ebp-13H]                     ; 37B5 _ 0F B6. 45, ED
        movzx   ecx, al                                 ; 37B9 _ 0F B6. C8
        mov     eax, dword [ebp+0CH]                    ; 37BC _ 8B. 45, 0C
        mov     edx, dword [eax+4H]                     ; 37BF _ 8B. 50, 04
        mov     eax, dword [ebp+0CH]                    ; 37C2 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 37C5 _ 8B. 00
        mov     dword [esp+18H], 20                     ; 37C7 _ C7. 44 24, 18, 00000014
        mov     dword [esp+14H], ebx                    ; 37CF _ 89. 5C 24, 14
        mov     dword [esp+10H], 3                      ; 37D3 _ C7. 44 24, 10, 00000003
        mov     dword [esp+0CH], 3                      ; 37DB _ C7. 44 24, 0C, 00000003
        mov     dword [esp+8H], ecx                     ; 37E3 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 37E7 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 37EB _ 89. 04 24
        call    boxfill8                                ; 37EE _ E8, FFFFFFFC(rel)
        movsx   eax, byte [ebp-12H]                     ; 37F3 _ 0F BE. 45, EE
        mov     edx, dword [ebp+10H]                    ; 37F7 _ 8B. 55, 10
        mov     dword [esp+14H], edx                    ; 37FA _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 37FE _ 89. 44 24, 10
        mov     dword [esp+0CH], 4                      ; 3802 _ C7. 44 24, 0C, 00000004
        mov     dword [esp+8H], 24                      ; 380A _ C7. 44 24, 08, 00000018
        mov     eax, dword [ebp+0CH]                    ; 3812 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 3815 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 3819 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 381C _ 89. 04 24
        call    showString                              ; 381F _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], 0                      ; 3824 _ C7. 45, F0, 00000000
        jmp     ?_205                                   ; 382B _ E9, 00000083

?_198:  mov     dword [ebp-0CH], 0                      ; 3830 _ C7. 45, F4, 00000000
        jmp     ?_204                                   ; 3837 _ EB, 70

?_199:  mov     eax, dword [ebp-10H]                    ; 3839 _ 8B. 45, F0
        shl     eax, 4                                  ; 383C _ C1. E0, 04
        mov     edx, eax                                ; 383F _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 3841 _ 8B. 45, F4
        add     eax, edx                                ; 3844 _ 01. D0
        add     eax, closebtn.2233                      ; 3846 _ 05, 00000280(d)
        movzx   eax, byte [eax]                         ; 384B _ 0F B6. 00
        mov     byte [ebp-11H], al                      ; 384E _ 88. 45, EF
        cmp     byte [ebp-11H], 64                      ; 3851 _ 80. 7D, EF, 40
        jnz     ?_200                                   ; 3855 _ 75, 06
        mov     byte [ebp-11H], 0                       ; 3857 _ C6. 45, EF, 00
        jmp     ?_203                                   ; 385B _ EB, 1C

?_200:  cmp     byte [ebp-11H], 36                      ; 385D _ 80. 7D, EF, 24
        jnz     ?_201                                   ; 3861 _ 75, 06
        mov     byte [ebp-11H], 15                      ; 3863 _ C6. 45, EF, 0F
        jmp     ?_203                                   ; 3867 _ EB, 10

?_201:  cmp     byte [ebp-11H], 81                      ; 3869 _ 80. 7D, EF, 51
        jnz     ?_202                                   ; 386D _ 75, 06
        mov     byte [ebp-11H], 8                       ; 386F _ C6. 45, EF, 08
        jmp     ?_203                                   ; 3873 _ EB, 04

?_202:  mov     byte [ebp-11H], 7                       ; 3875 _ C6. 45, EF, 07
?_203:  mov     eax, dword [ebp+0CH]                    ; 3879 _ 8B. 45, 0C
        mov     edx, dword [eax]                        ; 387C _ 8B. 10
        mov     eax, dword [ebp-10H]                    ; 387E _ 8B. 45, F0
        lea     ecx, [eax+5H]                           ; 3881 _ 8D. 48, 05
        mov     eax, dword [ebp+0CH]                    ; 3884 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 3887 _ 8B. 40, 04
        imul    ecx, eax                                ; 388A _ 0F AF. C8
        mov     eax, dword [ebp+0CH]                    ; 388D _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 3890 _ 8B. 40, 04
        lea     ebx, [eax-15H]                          ; 3893 _ 8D. 58, EB
        mov     eax, dword [ebp-0CH]                    ; 3896 _ 8B. 45, F4
        add     eax, ebx                                ; 3899 _ 01. D8
        add     eax, ecx                                ; 389B _ 01. C8
        add     edx, eax                                ; 389D _ 01. C2
        movzx   eax, byte [ebp-11H]                     ; 389F _ 0F B6. 45, EF
        mov     byte [edx], al                          ; 38A3 _ 88. 02
        add     dword [ebp-0CH], 1                      ; 38A5 _ 83. 45, F4, 01
?_204:  cmp     dword [ebp-0CH], 15                     ; 38A9 _ 83. 7D, F4, 0F
        jle     ?_199                                   ; 38AD _ 7E, 8A
        add     dword [ebp-10H], 1                      ; 38AF _ 83. 45, F0, 01
?_205:  cmp     dword [ebp-10H], 13                     ; 38B3 _ 83. 7D, F0, 0D
        jle     ?_198                                   ; 38B7 _ 0F 8E, FFFFFF73
        add     esp, 52                                 ; 38BD _ 83. C4, 34
        pop     ebx                                     ; 38C0 _ 5B
        pop     ebp                                     ; 38C1 _ 5D
        ret                                             ; 38C2 _ C3
; make_wtitle8 End of function

make_textbox8:; Function begin
        push    ebp                                     ; 38C3 _ 55
        mov     ebp, esp                                ; 38C4 _ 89. E5
        push    edi                                     ; 38C6 _ 57
        push    esi                                     ; 38C7 _ 56
        push    ebx                                     ; 38C8 _ 53
        sub     esp, 44                                 ; 38C9 _ 83. EC, 2C
        mov     eax, dword [ebp+14H]                    ; 38CC _ 8B. 45, 14
        mov     edx, dword [ebp+0CH]                    ; 38CF _ 8B. 55, 0C
        add     eax, edx                                ; 38D2 _ 01. D0
        mov     dword [ebp-10H], eax                    ; 38D4 _ 89. 45, F0
        mov     eax, dword [ebp+18H]                    ; 38D7 _ 8B. 45, 18
        mov     edx, dword [ebp+10H]                    ; 38DA _ 8B. 55, 10
        add     eax, edx                                ; 38DD _ 01. D0
        mov     dword [ebp-14H], eax                    ; 38DF _ 89. 45, EC
        mov     eax, dword [ebp+10H]                    ; 38E2 _ 8B. 45, 10
        lea     edi, [eax-3H]                           ; 38E5 _ 8D. 78, FD
        mov     eax, dword [ebp-10H]                    ; 38E8 _ 8B. 45, F0
        lea     esi, [eax+1H]                           ; 38EB _ 8D. 70, 01
        mov     eax, dword [ebp+10H]                    ; 38EE _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 38F1 _ 8D. 58, FD
        mov     eax, dword [ebp+0CH]                    ; 38F4 _ 8B. 45, 0C
        lea     ecx, [eax-2H]                           ; 38F7 _ 8D. 48, FE
        mov     eax, dword [ebp+8H]                     ; 38FA _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 38FD _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 3900 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 3903 _ 8B. 00
        mov     dword [esp+18H], edi                    ; 3905 _ 89. 7C 24, 18
        mov     dword [esp+14H], esi                    ; 3909 _ 89. 74 24, 14
        mov     dword [esp+10H], ebx                    ; 390D _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 3911 _ 89. 4C 24, 0C
        mov     dword [esp+8H], 15                      ; 3915 _ C7. 44 24, 08, 0000000F
        mov     dword [esp+4H], edx                     ; 391D _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 3921 _ 89. 04 24
        call    boxfill8                                ; 3924 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-14H]                    ; 3929 _ 8B. 45, EC
        lea     edi, [eax+1H]                           ; 392C _ 8D. 78, 01
        mov     eax, dword [ebp+0CH]                    ; 392F _ 8B. 45, 0C
        lea     esi, [eax-3H]                           ; 3932 _ 8D. 70, FD
        mov     eax, dword [ebp+10H]                    ; 3935 _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 3938 _ 8D. 58, FD
        mov     eax, dword [ebp+0CH]                    ; 393B _ 8B. 45, 0C
        lea     ecx, [eax-3H]                           ; 393E _ 8D. 48, FD
        mov     eax, dword [ebp+8H]                     ; 3941 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 3944 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 3947 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 394A _ 8B. 00
        mov     dword [esp+18H], edi                    ; 394C _ 89. 7C 24, 18
        mov     dword [esp+14H], esi                    ; 3950 _ 89. 74 24, 14
        mov     dword [esp+10H], ebx                    ; 3954 _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 3958 _ 89. 4C 24, 0C
        mov     dword [esp+8H], 15                      ; 395C _ C7. 44 24, 08, 0000000F
        mov     dword [esp+4H], edx                     ; 3964 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 3968 _ 89. 04 24
        call    boxfill8                                ; 396B _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-14H]                    ; 3970 _ 8B. 45, EC
        lea     edi, [eax+2H]                           ; 3973 _ 8D. 78, 02
        mov     eax, dword [ebp-10H]                    ; 3976 _ 8B. 45, F0
        lea     esi, [eax+1H]                           ; 3979 _ 8D. 70, 01
        mov     eax, dword [ebp-14H]                    ; 397C _ 8B. 45, EC
        lea     ebx, [eax+2H]                           ; 397F _ 8D. 58, 02
        mov     eax, dword [ebp+0CH]                    ; 3982 _ 8B. 45, 0C
        lea     ecx, [eax-3H]                           ; 3985 _ 8D. 48, FD
        mov     eax, dword [ebp+8H]                     ; 3988 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 398B _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 398E _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 3991 _ 8B. 00
        mov     dword [esp+18H], edi                    ; 3993 _ 89. 7C 24, 18
        mov     dword [esp+14H], esi                    ; 3997 _ 89. 74 24, 14
        mov     dword [esp+10H], ebx                    ; 399B _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 399F _ 89. 4C 24, 0C
        mov     dword [esp+8H], 7                       ; 39A3 _ C7. 44 24, 08, 00000007
        mov     dword [esp+4H], edx                     ; 39AB _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 39AF _ 89. 04 24
        call    boxfill8                                ; 39B2 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-14H]                    ; 39B7 _ 8B. 45, EC
        lea     edi, [eax+2H]                           ; 39BA _ 8D. 78, 02
        mov     eax, dword [ebp-10H]                    ; 39BD _ 8B. 45, F0
        lea     esi, [eax+2H]                           ; 39C0 _ 8D. 70, 02
        mov     eax, dword [ebp+10H]                    ; 39C3 _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 39C6 _ 8D. 58, FD
        mov     eax, dword [ebp-10H]                    ; 39C9 _ 8B. 45, F0
        lea     ecx, [eax+2H]                           ; 39CC _ 8D. 48, 02
        mov     eax, dword [ebp+8H]                     ; 39CF _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 39D2 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 39D5 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 39D8 _ 8B. 00
        mov     dword [esp+18H], edi                    ; 39DA _ 89. 7C 24, 18
        mov     dword [esp+14H], esi                    ; 39DE _ 89. 74 24, 14
        mov     dword [esp+10H], ebx                    ; 39E2 _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 39E6 _ 89. 4C 24, 0C
        mov     dword [esp+8H], 7                       ; 39EA _ C7. 44 24, 08, 00000007
        mov     dword [esp+4H], edx                     ; 39F2 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 39F6 _ 89. 04 24
        call    boxfill8                                ; 39F9 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 39FE _ 8B. 45, 10
        lea     ecx, [eax-2H]                           ; 3A01 _ 8D. 48, FE
        mov     eax, dword [ebp+10H]                    ; 3A04 _ 8B. 45, 10
        lea     esi, [eax-2H]                           ; 3A07 _ 8D. 70, FE
        mov     eax, dword [ebp+0CH]                    ; 3A0A _ 8B. 45, 0C
        lea     ebx, [eax-1H]                           ; 3A0D _ 8D. 58, FF
        mov     eax, dword [ebp+8H]                     ; 3A10 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 3A13 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 3A16 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 3A19 _ 8B. 00
        mov     dword [esp+18H], ecx                    ; 3A1B _ 89. 4C 24, 18
        mov     ecx, dword [ebp-10H]                    ; 3A1F _ 8B. 4D, F0
        mov     dword [esp+14H], ecx                    ; 3A22 _ 89. 4C 24, 14
        mov     dword [esp+10H], esi                    ; 3A26 _ 89. 74 24, 10
        mov     dword [esp+0CH], ebx                    ; 3A2A _ 89. 5C 24, 0C
        mov     dword [esp+8H], 0                       ; 3A2E _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], edx                     ; 3A36 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 3A3A _ 89. 04 24
        call    boxfill8                                ; 3A3D _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+0CH]                    ; 3A42 _ 8B. 45, 0C
        lea     edi, [eax-2H]                           ; 3A45 _ 8D. 78, FE
        mov     eax, dword [ebp+10H]                    ; 3A48 _ 8B. 45, 10
        lea     esi, [eax-2H]                           ; 3A4B _ 8D. 70, FE
        mov     eax, dword [ebp+0CH]                    ; 3A4E _ 8B. 45, 0C
        lea     ebx, [eax-2H]                           ; 3A51 _ 8D. 58, FE
        mov     eax, dword [ebp+8H]                     ; 3A54 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 3A57 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 3A5A _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 3A5D _ 8B. 00
        mov     ecx, dword [ebp-14H]                    ; 3A5F _ 8B. 4D, EC
        mov     dword [esp+18H], ecx                    ; 3A62 _ 89. 4C 24, 18
        mov     dword [esp+14H], edi                    ; 3A66 _ 89. 7C 24, 14
        mov     dword [esp+10H], esi                    ; 3A6A _ 89. 74 24, 10
        mov     dword [esp+0CH], ebx                    ; 3A6E _ 89. 5C 24, 0C
        mov     dword [esp+8H], 0                       ; 3A72 _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], edx                     ; 3A7A _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 3A7E _ 89. 04 24
        call    boxfill8                                ; 3A81 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-14H]                    ; 3A86 _ 8B. 45, EC
        lea     ecx, [eax+1H]                           ; 3A89 _ 8D. 48, 01
        mov     eax, dword [ebp-14H]                    ; 3A8C _ 8B. 45, EC
        lea     esi, [eax+1H]                           ; 3A8F _ 8D. 70, 01
        mov     eax, dword [ebp+0CH]                    ; 3A92 _ 8B. 45, 0C
        lea     ebx, [eax-2H]                           ; 3A95 _ 8D. 58, FE
        mov     eax, dword [ebp+8H]                     ; 3A98 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 3A9B _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 3A9E _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 3AA1 _ 8B. 00
        mov     dword [esp+18H], ecx                    ; 3AA3 _ 89. 4C 24, 18
        mov     ecx, dword [ebp-10H]                    ; 3AA7 _ 8B. 4D, F0
        mov     dword [esp+14H], ecx                    ; 3AAA _ 89. 4C 24, 14
        mov     dword [esp+10H], esi                    ; 3AAE _ 89. 74 24, 10
        mov     dword [esp+0CH], ebx                    ; 3AB2 _ 89. 5C 24, 0C
        mov     dword [esp+8H], 8                       ; 3AB6 _ C7. 44 24, 08, 00000008
        mov     dword [esp+4H], edx                     ; 3ABE _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 3AC2 _ 89. 04 24
        call    boxfill8                                ; 3AC5 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-14H]                    ; 3ACA _ 8B. 45, EC
        lea     edi, [eax+1H]                           ; 3ACD _ 8D. 78, 01
        mov     eax, dword [ebp-10H]                    ; 3AD0 _ 8B. 45, F0
        lea     esi, [eax+1H]                           ; 3AD3 _ 8D. 70, 01
        mov     eax, dword [ebp+10H]                    ; 3AD6 _ 8B. 45, 10
        lea     ebx, [eax-2H]                           ; 3AD9 _ 8D. 58, FE
        mov     eax, dword [ebp-10H]                    ; 3ADC _ 8B. 45, F0
        lea     ecx, [eax+1H]                           ; 3ADF _ 8D. 48, 01
        mov     eax, dword [ebp+8H]                     ; 3AE2 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 3AE5 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 3AE8 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 3AEB _ 8B. 00
        mov     dword [esp+18H], edi                    ; 3AED _ 89. 7C 24, 18
        mov     dword [esp+14H], esi                    ; 3AF1 _ 89. 74 24, 14
        mov     dword [esp+10H], ebx                    ; 3AF5 _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 3AF9 _ 89. 4C 24, 0C
        mov     dword [esp+8H], 8                       ; 3AFD _ C7. 44 24, 08, 00000008
        mov     dword [esp+4H], edx                     ; 3B05 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 3B09 _ 89. 04 24
        call    boxfill8                                ; 3B0C _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 3B11 _ 8B. 45, 10
        lea     edi, [eax-1H]                           ; 3B14 _ 8D. 78, FF
        mov     eax, dword [ebp+0CH]                    ; 3B17 _ 8B. 45, 0C
        lea     esi, [eax-1H]                           ; 3B1A _ 8D. 70, FF
        mov     eax, dword [ebp+1CH]                    ; 3B1D _ 8B. 45, 1C
        movzx   ecx, al                                 ; 3B20 _ 0F B6. C8
        mov     eax, dword [ebp+8H]                     ; 3B23 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 3B26 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 3B29 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 3B2C _ 8B. 00
        mov     ebx, dword [ebp-14H]                    ; 3B2E _ 8B. 5D, EC
        mov     dword [esp+18H], ebx                    ; 3B31 _ 89. 5C 24, 18
        mov     ebx, dword [ebp-10H]                    ; 3B35 _ 8B. 5D, F0
        mov     dword [esp+14H], ebx                    ; 3B38 _ 89. 5C 24, 14
        mov     dword [esp+10H], edi                    ; 3B3C _ 89. 7C 24, 10
        mov     dword [esp+0CH], esi                    ; 3B40 _ 89. 74 24, 0C
        mov     dword [esp+8H], ecx                     ; 3B44 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 3B48 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 3B4C _ 89. 04 24
        call    boxfill8                                ; 3B4F _ E8, FFFFFFFC(rel)
        add     esp, 44                                 ; 3B54 _ 83. C4, 2C
        pop     ebx                                     ; 3B57 _ 5B
        pop     esi                                     ; 3B58 _ 5E
        pop     edi                                     ; 3B59 _ 5F
        pop     ebp                                     ; 3B5A _ 5D
        ret                                             ; 3B5B _ C3
; make_textbox8 End of function

file_loadfile:; Function begin
        push    ebp                                     ; 3B5C _ 55
        mov     ebp, esp                                ; 3B5D _ 89. E5
        sub     esp, 56                                 ; 3B5F _ 83. EC, 38
        mov     dword [ebp-0CH], 78848                  ; 3B62 _ C7. 45, F4, 00013400
        mov     eax, dword [memman]                     ; 3B69 _ A1, 00000000(d)
        mov     dword [esp+4H], 13                      ; 3B6E _ C7. 44 24, 04, 0000000D
        mov     dword [esp], eax                        ; 3B76 _ 89. 04 24
        call    memman_alloc                            ; 3B79 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-1CH], eax                    ; 3B7E _ 89. 45, E4
        mov     eax, dword [ebp-1CH]                    ; 3B81 _ 8B. 45, E4
        add     eax, 12                                 ; 3B84 _ 83. C0, 0C
        mov     byte [eax], 0                           ; 3B87 _ C6. 00, 00
        jmp     ?_216                                   ; 3B8A _ E9, 0000011E

?_206:  mov     dword [ebp-10H], 0                      ; 3B8F _ C7. 45, F0, 00000000
        jmp     ?_209                                   ; 3B96 _ EB, 2C

?_207:  mov     edx, dword [ebp-0CH]                    ; 3B98 _ 8B. 55, F4
        mov     eax, dword [ebp-10H]                    ; 3B9B _ 8B. 45, F0
        add     eax, edx                                ; 3B9E _ 01. D0
        movzx   eax, byte [eax]                         ; 3BA0 _ 0F B6. 00
        test    al, al                                  ; 3BA3 _ 84. C0
        jz      ?_208                                   ; 3BA5 _ 74, 1B
        mov     edx, dword [ebp-10H]                    ; 3BA7 _ 8B. 55, F0
        mov     eax, dword [ebp-1CH]                    ; 3BAA _ 8B. 45, E4
        add     edx, eax                                ; 3BAD _ 01. C2
        mov     ecx, dword [ebp-0CH]                    ; 3BAF _ 8B. 4D, F4
        mov     eax, dword [ebp-10H]                    ; 3BB2 _ 8B. 45, F0
        add     eax, ecx                                ; 3BB5 _ 01. C8
        movzx   eax, byte [eax]                         ; 3BB7 _ 0F B6. 00
        mov     byte [edx], al                          ; 3BBA _ 88. 02
        add     dword [ebp-10H], 1                      ; 3BBC _ 83. 45, F0, 01
        jmp     ?_209                                   ; 3BC0 _ EB, 02

?_208:  jmp     ?_210                                   ; 3BC2 _ EB, 06

?_209:  cmp     dword [ebp-10H], 7                      ; 3BC4 _ 83. 7D, F0, 07
        jle     ?_207                                   ; 3BC8 _ 7E, CE
?_210:  mov     dword [ebp-14H], 0                      ; 3BCA _ C7. 45, EC, 00000000
        mov     edx, dword [ebp-10H]                    ; 3BD1 _ 8B. 55, F0
        mov     eax, dword [ebp-1CH]                    ; 3BD4 _ 8B. 45, E4
        add     eax, edx                                ; 3BD7 _ 01. D0
        mov     byte [eax], 46                          ; 3BD9 _ C6. 00, 2E
        add     dword [ebp-10H], 1                      ; 3BDC _ 83. 45, F0, 01
        mov     dword [ebp-14H], 0                      ; 3BE0 _ C7. 45, EC, 00000000
        jmp     ?_212                                   ; 3BE7 _ EB, 1E

?_211:  mov     edx, dword [ebp-10H]                    ; 3BE9 _ 8B. 55, F0
        mov     eax, dword [ebp-1CH]                    ; 3BEC _ 8B. 45, E4
        add     edx, eax                                ; 3BEF _ 01. C2
        mov     ecx, dword [ebp-0CH]                    ; 3BF1 _ 8B. 4D, F4
        mov     eax, dword [ebp-14H]                    ; 3BF4 _ 8B. 45, EC
        add     eax, ecx                                ; 3BF7 _ 01. C8
        movzx   eax, byte [eax+8H]                      ; 3BF9 _ 0F B6. 40, 08
        mov     byte [edx], al                          ; 3BFD _ 88. 02
        add     dword [ebp-10H], 1                      ; 3BFF _ 83. 45, F0, 01
        add     dword [ebp-14H], 1                      ; 3C03 _ 83. 45, EC, 01
?_212:  cmp     dword [ebp-14H], 2                      ; 3C07 _ 83. 7D, EC, 02
        jle     ?_211                                   ; 3C0B _ 7E, DC
        mov     eax, dword [ebp-1CH]                    ; 3C0D _ 8B. 45, E4
        mov     dword [esp+4H], eax                     ; 3C10 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 3C14 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3C17 _ 89. 04 24
        call    strcmp                                  ; 3C1A _ E8, FFFFFFFC(rel)
        cmp     eax, 1                                  ; 3C1F _ 83. F8, 01
        jne     ?_215                                   ; 3C22 _ 0F 85, 00000081
        mov     eax, dword [ebp-0CH]                    ; 3C28 _ 8B. 45, F4
        mov     edx, dword [eax+1CH]                    ; 3C2B _ 8B. 50, 1C
        mov     eax, dword [memman]                     ; 3C2E _ A1, 00000000(d)
        mov     dword [esp+4H], edx                     ; 3C33 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 3C37 _ 89. 04 24
        call    memman_alloc_4k                         ; 3C3A _ E8, FFFFFFFC(rel)
        mov     edx, eax                                ; 3C3F _ 89. C2
        mov     eax, dword [ebp+0CH]                    ; 3C41 _ 8B. 45, 0C
        mov     dword [eax], edx                        ; 3C44 _ 89. 10
        mov     eax, dword [ebp-0CH]                    ; 3C46 _ 8B. 45, F4
        mov     eax, dword [eax+1CH]                    ; 3C49 _ 8B. 40, 1C
        mov     edx, eax                                ; 3C4C _ 89. C2
        mov     eax, dword [ebp+0CH]                    ; 3C4E _ 8B. 45, 0C
        mov     dword [eax+8H], edx                     ; 3C51 _ 89. 50, 08
        mov     dword [ebp-20H], 88064                  ; 3C54 _ C7. 45, E0, 00015800
        mov     eax, dword [ebp-0CH]                    ; 3C5B _ 8B. 45, F4
        movzx   eax, word [eax+1AH]                     ; 3C5E _ 0F B7. 40, 1A
        movzx   eax, ax                                 ; 3C62 _ 0F B7. C0
        shl     eax, 9                                  ; 3C65 _ C1. E0, 09
        add     dword [ebp-20H], eax                    ; 3C68 _ 01. 45, E0
        mov     eax, dword [ebp-0CH]                    ; 3C6B _ 8B. 45, F4
        mov     eax, dword [eax+1CH]                    ; 3C6E _ 8B. 40, 1C
        mov     dword [ebp-24H], eax                    ; 3C71 _ 89. 45, DC
        mov     dword [ebp-18H], 0                      ; 3C74 _ C7. 45, E8, 00000000
        mov     dword [ebp-18H], 0                      ; 3C7B _ C7. 45, E8, 00000000
        jmp     ?_214                                   ; 3C82 _ EB, 1B

?_213:  mov     eax, dword [ebp+0CH]                    ; 3C84 _ 8B. 45, 0C
        mov     edx, dword [eax]                        ; 3C87 _ 8B. 10
        mov     eax, dword [ebp-18H]                    ; 3C89 _ 8B. 45, E8
        add     edx, eax                                ; 3C8C _ 01. C2
        mov     ecx, dword [ebp-18H]                    ; 3C8E _ 8B. 4D, E8
        mov     eax, dword [ebp-20H]                    ; 3C91 _ 8B. 45, E0
        add     eax, ecx                                ; 3C94 _ 01. C8
        movzx   eax, byte [eax]                         ; 3C96 _ 0F B6. 00
        mov     byte [edx], al                          ; 3C99 _ 88. 02
        add     dword [ebp-18H], 1                      ; 3C9B _ 83. 45, E8, 01
?_214:  mov     eax, dword [ebp-18H]                    ; 3C9F _ 8B. 45, E8
        cmp     eax, dword [ebp-24H]                    ; 3CA2 _ 3B. 45, DC
        jl      ?_213                                   ; 3CA5 _ 7C, DD
        jmp     ?_217                                   ; 3CA7 _ EB, 12

?_215:  add     dword [ebp-0CH], 32                     ; 3CA9 _ 83. 45, F4, 20
?_216:  mov     eax, dword [ebp-0CH]                    ; 3CAD _ 8B. 45, F4
        movzx   eax, byte [eax]                         ; 3CB0 _ 0F B6. 00
        test    al, al                                  ; 3CB3 _ 84. C0
        jne     ?_206                                   ; 3CB5 _ 0F 85, FFFFFED4
?_217:  mov     edx, dword [ebp-1CH]                    ; 3CBB _ 8B. 55, E4
        mov     eax, dword [memman]                     ; 3CBE _ A1, 00000000(d)
        mov     dword [esp+8H], 13                      ; 3CC3 _ C7. 44 24, 08, 0000000D
        mov     dword [esp+4H], edx                     ; 3CCB _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 3CCF _ 89. 04 24
        call    memman_free                             ; 3CD2 _ E8, FFFFFFFC(rel)
        leave                                           ; 3CD7 _ C9
        ret                                             ; 3CD8 _ C3
; file_loadfile End of function

intHandlerForStackOverFlow:; Function begin
        push    ebp                                     ; 3CD9 _ 55
        mov     ebp, esp                                ; 3CDA _ 89. E5
        sub     esp, 40                                 ; 3CDC _ 83. EC, 28
        mov     dword [?_374], 8                        ; 3CDF _ C7. 05, 00000010(d), 00000008
        mov     dword [esp], ?_367                      ; 3CE9 _ C7. 04 24, 00000089(d)
        call    cons_putstr                             ; 3CF0 _ E8, FFFFFFFC(rel)
        mov     dword [?_374], 8                        ; 3CF5 _ C7. 05, 00000010(d), 00000008
        mov     eax, dword [?_375]                      ; 3CFF _ A1, 00000014(d)
        add     eax, 16                                 ; 3D04 _ 83. C0, 10
        mov     dword [?_375], eax                      ; 3D07 _ A3, 00000014(d)
        mov     dword [esp], ?_368                      ; 3D0C _ C7. 04 24, 00000090(d)
        call    cons_putstr                             ; 3D13 _ E8, FFFFFFFC(rel)
        mov     dword [?_374], 8                        ; 3D18 _ C7. 05, 00000010(d), 00000008
        mov     eax, dword [?_375]                      ; 3D22 _ A1, 00000014(d)
        add     eax, 16                                 ; 3D27 _ 83. C0, 10
        mov     dword [?_375], eax                      ; 3D2A _ A3, 00000014(d)
        mov     eax, dword [ebp+8H]                     ; 3D2F _ 8B. 45, 08
        add     eax, 44                                 ; 3D32 _ 83. C0, 2C
        mov     eax, dword [eax]                        ; 3D35 _ 8B. 00
        mov     dword [esp], eax                        ; 3D37 _ 89. 04 24
        call    intToHexStr                             ; 3D3A _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 3D3F _ 89. 45, F4
        mov     dword [esp], ?_369                      ; 3D42 _ C7. 04 24, 000000A0(d)
        call    cons_putstr                             ; 3D49 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 3D4E _ 8B. 45, F4
        mov     dword [esp], eax                        ; 3D51 _ 89. 04 24
        call    cons_putstr                             ; 3D54 _ E8, FFFFFFFC(rel)
        mov     dword [?_374], 8                        ; 3D59 _ C7. 05, 00000010(d), 00000008
        mov     eax, dword [?_375]                      ; 3D63 _ A1, 00000014(d)
        add     eax, 16                                 ; 3D68 _ 83. C0, 10
        mov     dword [?_375], eax                      ; 3D6B _ A3, 00000014(d)
        call    task_now                                ; 3D70 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 3D75 _ 89. 45, F0
        mov     eax, dword [ebp-10H]                    ; 3D78 _ 8B. 45, F0
        add     eax, 48                                 ; 3D7B _ 83. C0, 30
        leave                                           ; 3D7E _ C9
        ret                                             ; 3D7F _ C3
; intHandlerForStackOverFlow End of function

intHandlerForException:; Function begin
        push    ebp                                     ; 3D80 _ 55
        mov     ebp, esp                                ; 3D81 _ 89. E5
        sub     esp, 40                                 ; 3D83 _ 83. EC, 28
        mov     dword [?_374], 8                        ; 3D86 _ C7. 05, 00000010(d), 00000008
        mov     dword [esp], ?_370                      ; 3D90 _ C7. 04 24, 000000A7(d)
        call    cons_putstr                             ; 3D97 _ E8, FFFFFFFC(rel)
        mov     dword [?_374], 8                        ; 3D9C _ C7. 05, 00000010(d), 00000008
        mov     eax, dword [?_375]                      ; 3DA6 _ A1, 00000014(d)
        add     eax, 16                                 ; 3DAB _ 83. C0, 10
        mov     dword [?_375], eax                      ; 3DAE _ A3, 00000014(d)
        mov     dword [esp], ?_371                      ; 3DB3 _ C7. 04 24, 000000AF(d)
        call    cons_putstr                             ; 3DBA _ E8, FFFFFFFC(rel)
        mov     eax, dword [?_375]                      ; 3DBF _ A1, 00000014(d)
        add     eax, 16                                 ; 3DC4 _ 83. C0, 10
        mov     dword [?_375], eax                      ; 3DC7 _ A3, 00000014(d)
        mov     dword [?_374], 8                        ; 3DCC _ C7. 05, 00000010(d), 00000008
        call    task_now                                ; 3DD6 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 3DDB _ 89. 45, F4
        mov     eax, dword [ebp-0CH]                    ; 3DDE _ 8B. 45, F4
        add     eax, 48                                 ; 3DE1 _ 83. C0, 30
        leave                                           ; 3DE4 _ C9
        ret                                             ; 3DE5 _ C3
; intHandlerForException End of function

memman_init:; Function begin
        push    ebp                                     ; 3DE6 _ 55
        mov     ebp, esp                                ; 3DE7 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 3DE9 _ 8B. 45, 08
        mov     dword [eax], 0                          ; 3DEC _ C7. 00, 00000000
        mov     eax, dword [ebp+8H]                     ; 3DF2 _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 3DF5 _ C7. 40, 04, 00000000
        mov     eax, dword [ebp+8H]                     ; 3DFC _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 3DFF _ C7. 40, 08, 00000000
        mov     eax, dword [ebp+8H]                     ; 3E06 _ 8B. 45, 08
        mov     dword [eax+0CH], 0                      ; 3E09 _ C7. 40, 0C, 00000000
        pop     ebp                                     ; 3E10 _ 5D
        ret                                             ; 3E11 _ C3
; memman_init End of function

memman_total:; Function begin
        push    ebp                                     ; 3E12 _ 55
        mov     ebp, esp                                ; 3E13 _ 89. E5
        sub     esp, 16                                 ; 3E15 _ 83. EC, 10
        mov     dword [ebp-4H], 0                       ; 3E18 _ C7. 45, FC, 00000000
        mov     dword [ebp-8H], 0                       ; 3E1F _ C7. 45, F8, 00000000
        jmp     ?_219                                   ; 3E26 _ EB, 14

?_218:  mov     eax, dword [ebp+8H]                     ; 3E28 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 3E2B _ 8B. 55, F8
        add     edx, 2                                  ; 3E2E _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 3E31 _ 8B. 44 D0, 04
        add     dword [ebp-4H], eax                     ; 3E35 _ 01. 45, FC
        add     dword [ebp-8H], 1                       ; 3E38 _ 83. 45, F8, 01
?_219:  mov     eax, dword [ebp+8H]                     ; 3E3C _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 3E3F _ 8B. 00
        cmp     eax, dword [ebp-8H]                     ; 3E41 _ 3B. 45, F8
        ja      ?_218                                   ; 3E44 _ 77, E2
        mov     eax, dword [ebp-4H]                     ; 3E46 _ 8B. 45, FC
        leave                                           ; 3E49 _ C9
        ret                                             ; 3E4A _ C3
; memman_total End of function

memman_alloc:; Function begin
        push    ebp                                     ; 3E4B _ 55
        mov     ebp, esp                                ; 3E4C _ 89. E5
        sub     esp, 16                                 ; 3E4E _ 83. EC, 10
        mov     dword [ebp-8H], 0                       ; 3E51 _ C7. 45, F8, 00000000
        jmp     ?_223                                   ; 3E58 _ E9, 00000085

?_220:  mov     eax, dword [ebp+8H]                     ; 3E5D _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 3E60 _ 8B. 55, F8
        add     edx, 2                                  ; 3E63 _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 3E66 _ 8B. 44 D0, 04
        cmp     eax, dword [ebp+0CH]                    ; 3E6A _ 3B. 45, 0C
        jc      ?_222                                   ; 3E6D _ 72, 6F
        mov     eax, dword [ebp+8H]                     ; 3E6F _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 3E72 _ 8B. 55, F8
        add     edx, 2                                  ; 3E75 _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 3E78 _ 8B. 04 D0
        mov     dword [ebp-4H], eax                     ; 3E7B _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 3E7E _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 3E81 _ 8B. 55, F8
        add     edx, 2                                  ; 3E84 _ 83. C2, 02
        mov     edx, dword [eax+edx*8]                  ; 3E87 _ 8B. 14 D0
        mov     eax, dword [ebp+0CH]                    ; 3E8A _ 8B. 45, 0C
        lea     ecx, [edx+eax]                          ; 3E8D _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 3E90 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 3E93 _ 8B. 55, F8
        add     edx, 2                                  ; 3E96 _ 83. C2, 02
        mov     dword [eax+edx*8], ecx                  ; 3E99 _ 89. 0C D0
        mov     eax, dword [ebp+8H]                     ; 3E9C _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 3E9F _ 8B. 55, F8
        add     edx, 2                                  ; 3EA2 _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 3EA5 _ 8B. 44 D0, 04
        sub     eax, dword [ebp+0CH]                    ; 3EA9 _ 2B. 45, 0C
        mov     edx, eax                                ; 3EAC _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 3EAE _ 8B. 45, 08
        mov     ecx, dword [ebp-8H]                     ; 3EB1 _ 8B. 4D, F8
        add     ecx, 2                                  ; 3EB4 _ 83. C1, 02
        mov     dword [eax+ecx*8+4H], edx               ; 3EB7 _ 89. 54 C8, 04
        mov     eax, dword [ebp+8H]                     ; 3EBB _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 3EBE _ 8B. 55, F8
        add     edx, 2                                  ; 3EC1 _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 3EC4 _ 8B. 44 D0, 04
        test    eax, eax                                ; 3EC8 _ 85. C0
        jnz     ?_221                                   ; 3ECA _ 75, 0D
        mov     eax, dword [ebp+8H]                     ; 3ECC _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 3ECF _ 8B. 00
        lea     edx, [eax-1H]                           ; 3ED1 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 3ED4 _ 8B. 45, 08
        mov     dword [eax], edx                        ; 3ED7 _ 89. 10
?_221:  mov     eax, dword [ebp-4H]                     ; 3ED9 _ 8B. 45, FC
        jmp     ?_224                                   ; 3EDC _ EB, 17

?_222:  add     dword [ebp-8H], 1                       ; 3EDE _ 83. 45, F8, 01
?_223:  mov     eax, dword [ebp+8H]                     ; 3EE2 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 3EE5 _ 8B. 00
        cmp     eax, dword [ebp-8H]                     ; 3EE7 _ 3B. 45, F8
        ja      ?_220                                   ; 3EEA _ 0F 87, FFFFFF6D
        mov     eax, 0                                  ; 3EF0 _ B8, 00000000
?_224:  leave                                           ; 3EF5 _ C9
        ret                                             ; 3EF6 _ C3
; memman_alloc End of function

memman_free:; Function begin
        push    ebp                                     ; 3EF7 _ 55
        mov     ebp, esp                                ; 3EF8 _ 89. E5
        push    ebx                                     ; 3EFA _ 53
        sub     esp, 16                                 ; 3EFB _ 83. EC, 10
        mov     dword [ebp-0CH], 0                      ; 3EFE _ C7. 45, F4, 00000000
        jmp     ?_227                                   ; 3F05 _ EB, 17

?_225:  mov     eax, dword [ebp+8H]                     ; 3F07 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 3F0A _ 8B. 55, F4
        add     edx, 2                                  ; 3F0D _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 3F10 _ 8B. 04 D0
        cmp     eax, dword [ebp+0CH]                    ; 3F13 _ 3B. 45, 0C
        jbe     ?_226                                   ; 3F16 _ 76, 02
        jmp     ?_228                                   ; 3F18 _ EB, 0E

?_226:  add     dword [ebp-0CH], 1                      ; 3F1A _ 83. 45, F4, 01
?_227:  mov     eax, dword [ebp+8H]                     ; 3F1E _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 3F21 _ 8B. 00
        cmp     eax, dword [ebp-0CH]                    ; 3F23 _ 3B. 45, F4
        jg      ?_225                                   ; 3F26 _ 7F, DF
?_228:  cmp     dword [ebp-0CH], 0                      ; 3F28 _ 83. 7D, F4, 00
        jle     ?_230                                   ; 3F2C _ 0F 8E, 000000BA
        mov     eax, dword [ebp-0CH]                    ; 3F32 _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 3F35 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 3F38 _ 8B. 45, 08
        add     edx, 2                                  ; 3F3B _ 83. C2, 02
        mov     edx, dword [eax+edx*8]                  ; 3F3E _ 8B. 14 D0
        mov     eax, dword [ebp-0CH]                    ; 3F41 _ 8B. 45, F4
        lea     ecx, [eax-1H]                           ; 3F44 _ 8D. 48, FF
        mov     eax, dword [ebp+8H]                     ; 3F47 _ 8B. 45, 08
        add     ecx, 2                                  ; 3F4A _ 83. C1, 02
        mov     eax, dword [eax+ecx*8+4H]               ; 3F4D _ 8B. 44 C8, 04
        add     eax, edx                                ; 3F51 _ 01. D0
        cmp     eax, dword [ebp+0CH]                    ; 3F53 _ 3B. 45, 0C
        jne     ?_230                                   ; 3F56 _ 0F 85, 00000090
        mov     eax, dword [ebp-0CH]                    ; 3F5C _ 8B. 45, F4
        lea     ebx, [eax-1H]                           ; 3F5F _ 8D. 58, FF
        mov     eax, dword [ebp-0CH]                    ; 3F62 _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 3F65 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 3F68 _ 8B. 45, 08
        add     edx, 2                                  ; 3F6B _ 83. C2, 02
        mov     edx, dword [eax+edx*8+4H]               ; 3F6E _ 8B. 54 D0, 04
        mov     eax, dword [ebp+10H]                    ; 3F72 _ 8B. 45, 10
        lea     ecx, [edx+eax]                          ; 3F75 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 3F78 _ 8B. 45, 08
        lea     edx, [ebx+2H]                           ; 3F7B _ 8D. 53, 02
        mov     dword [eax+edx*8+4H], ecx               ; 3F7E _ 89. 4C D0, 04
        mov     eax, dword [ebp+8H]                     ; 3F82 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 3F85 _ 8B. 00
        cmp     eax, dword [ebp-0CH]                    ; 3F87 _ 3B. 45, F4
        jle     ?_229                                   ; 3F8A _ 7E, 56
        mov     eax, dword [ebp+10H]                    ; 3F8C _ 8B. 45, 10
        mov     edx, dword [ebp+0CH]                    ; 3F8F _ 8B. 55, 0C
        lea     ecx, [edx+eax]                          ; 3F92 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 3F95 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 3F98 _ 8B. 55, F4
        add     edx, 2                                  ; 3F9B _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 3F9E _ 8B. 04 D0
        cmp     ecx, eax                                ; 3FA1 _ 39. C1
        jnz     ?_229                                   ; 3FA3 _ 75, 3D
        mov     eax, dword [ebp-0CH]                    ; 3FA5 _ 8B. 45, F4
        lea     ebx, [eax-1H]                           ; 3FA8 _ 8D. 58, FF
        mov     eax, dword [ebp-0CH]                    ; 3FAB _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 3FAE _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 3FB1 _ 8B. 45, 08
        add     edx, 2                                  ; 3FB4 _ 83. C2, 02
        mov     edx, dword [eax+edx*8+4H]               ; 3FB7 _ 8B. 54 D0, 04
        mov     eax, dword [ebp+8H]                     ; 3FBB _ 8B. 45, 08
        mov     ecx, dword [ebp-0CH]                    ; 3FBE _ 8B. 4D, F4
        add     ecx, 2                                  ; 3FC1 _ 83. C1, 02
        mov     eax, dword [eax+ecx*8+4H]               ; 3FC4 _ 8B. 44 C8, 04
        lea     ecx, [edx+eax]                          ; 3FC8 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 3FCB _ 8B. 45, 08
        lea     edx, [ebx+2H]                           ; 3FCE _ 8D. 53, 02
        mov     dword [eax+edx*8+4H], ecx               ; 3FD1 _ 89. 4C D0, 04
        mov     eax, dword [ebp+8H]                     ; 3FD5 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 3FD8 _ 8B. 00
        lea     edx, [eax-1H]                           ; 3FDA _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 3FDD _ 8B. 45, 08
        mov     dword [eax], edx                        ; 3FE0 _ 89. 10
?_229:  mov     eax, 0                                  ; 3FE2 _ B8, 00000000
        jmp     ?_236                                   ; 3FE7 _ E9, 0000011C

?_230:  mov     eax, dword [ebp+8H]                     ; 3FEC _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 3FEF _ 8B. 00
        cmp     eax, dword [ebp-0CH]                    ; 3FF1 _ 3B. 45, F4
        jle     ?_231                                   ; 3FF4 _ 7E, 52
        mov     eax, dword [ebp+10H]                    ; 3FF6 _ 8B. 45, 10
        mov     edx, dword [ebp+0CH]                    ; 3FF9 _ 8B. 55, 0C
        lea     ecx, [edx+eax]                          ; 3FFC _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 3FFF _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 4002 _ 8B. 55, F4
        add     edx, 2                                  ; 4005 _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 4008 _ 8B. 04 D0
        cmp     ecx, eax                                ; 400B _ 39. C1
        jnz     ?_231                                   ; 400D _ 75, 39
        mov     eax, dword [ebp+8H]                     ; 400F _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 4012 _ 8B. 55, F4
        lea     ecx, [edx+2H]                           ; 4015 _ 8D. 4A, 02
        mov     edx, dword [ebp+0CH]                    ; 4018 _ 8B. 55, 0C
        mov     dword [eax+ecx*8], edx                  ; 401B _ 89. 14 C8
        mov     eax, dword [ebp+8H]                     ; 401E _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 4021 _ 8B. 55, F4
        add     edx, 2                                  ; 4024 _ 83. C2, 02
        mov     edx, dword [eax+edx*8+4H]               ; 4027 _ 8B. 54 D0, 04
        mov     eax, dword [ebp+10H]                    ; 402B _ 8B. 45, 10
        lea     ecx, [edx+eax]                          ; 402E _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 4031 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 4034 _ 8B. 55, F4
        add     edx, 2                                  ; 4037 _ 83. C2, 02
        mov     dword [eax+edx*8+4H], ecx               ; 403A _ 89. 4C D0, 04
        mov     eax, 0                                  ; 403E _ B8, 00000000
        jmp     ?_236                                   ; 4043 _ E9, 000000C0

?_231:  mov     eax, dword [ebp+8H]                     ; 4048 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 404B _ 8B. 00
        cmp     eax, 4095                               ; 404D _ 3D, 00000FFF
        jg      ?_235                                   ; 4052 _ 0F 8F, 00000087
        mov     eax, dword [ebp+8H]                     ; 4058 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 405B _ 8B. 00
        mov     dword [ebp-8H], eax                     ; 405D _ 89. 45, F8
        jmp     ?_233                                   ; 4060 _ EB, 28

?_232:  mov     eax, dword [ebp-8H]                     ; 4062 _ 8B. 45, F8
        lea     edx, [eax-1H]                           ; 4065 _ 8D. 50, FF
        mov     ecx, dword [ebp+8H]                     ; 4068 _ 8B. 4D, 08
        mov     eax, dword [ebp-8H]                     ; 406B _ 8B. 45, F8
        lea     ebx, [eax+2H]                           ; 406E _ 8D. 58, 02
        mov     eax, dword [ebp+8H]                     ; 4071 _ 8B. 45, 08
        add     edx, 2                                  ; 4074 _ 83. C2, 02
        lea     edx, [eax+edx*8]                        ; 4077 _ 8D. 14 D0
        mov     eax, dword [edx]                        ; 407A _ 8B. 02
        mov     edx, dword [edx+4H]                     ; 407C _ 8B. 52, 04
        mov     dword [ecx+ebx*8], eax                  ; 407F _ 89. 04 D9
        mov     dword [ecx+ebx*8+4H], edx               ; 4082 _ 89. 54 D9, 04
        sub     dword [ebp-8H], 1                       ; 4086 _ 83. 6D, F8, 01
?_233:  mov     eax, dword [ebp-8H]                     ; 408A _ 8B. 45, F8
        cmp     eax, dword [ebp-0CH]                    ; 408D _ 3B. 45, F4
        jg      ?_232                                   ; 4090 _ 7F, D0
        mov     eax, dword [ebp+8H]                     ; 4092 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 4095 _ 8B. 00
        lea     edx, [eax+1H]                           ; 4097 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 409A _ 8B. 45, 08
        mov     dword [eax], edx                        ; 409D _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 409F _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 40A2 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 40A5 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 40A8 _ 8B. 00
        cmp     edx, eax                                ; 40AA _ 39. C2
        jge     ?_234                                   ; 40AC _ 7D, 0B
        mov     eax, dword [ebp+8H]                     ; 40AE _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 40B1 _ 8B. 10
        mov     eax, dword [ebp+8H]                     ; 40B3 _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 40B6 _ 89. 50, 04
?_234:  mov     eax, dword [ebp+8H]                     ; 40B9 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 40BC _ 8B. 55, F4
        lea     ecx, [edx+2H]                           ; 40BF _ 8D. 4A, 02
        mov     edx, dword [ebp+0CH]                    ; 40C2 _ 8B. 55, 0C
        mov     dword [eax+ecx*8], edx                  ; 40C5 _ 89. 14 C8
        mov     eax, dword [ebp+8H]                     ; 40C8 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 40CB _ 8B. 55, F4
        lea     ecx, [edx+2H]                           ; 40CE _ 8D. 4A, 02
        mov     edx, dword [ebp+10H]                    ; 40D1 _ 8B. 55, 10
        mov     dword [eax+ecx*8+4H], edx               ; 40D4 _ 89. 54 C8, 04
        mov     eax, 0                                  ; 40D8 _ B8, 00000000
        jmp     ?_236                                   ; 40DD _ EB, 29

?_235:  mov     eax, dword [ebp+8H]                     ; 40DF _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 40E2 _ 8B. 40, 0C
        lea     edx, [eax+1H]                           ; 40E5 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 40E8 _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 40EB _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 40EE _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 40F1 _ 8B. 40, 08
        mov     edx, eax                                ; 40F4 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 40F6 _ 8B. 45, 10
        add     eax, edx                                ; 40F9 _ 01. D0
        mov     edx, eax                                ; 40FB _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 40FD _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 4100 _ 89. 50, 08
        mov     eax, 4294967295                         ; 4103 _ B8, FFFFFFFF
?_236:  add     esp, 16                                 ; 4108 _ 83. C4, 10
        pop     ebx                                     ; 410B _ 5B
        pop     ebp                                     ; 410C _ 5D
        ret                                             ; 410D _ C3
; memman_free End of function

memman_alloc_4k:; Function begin
        push    ebp                                     ; 410E _ 55
        mov     ebp, esp                                ; 410F _ 89. E5
        sub     esp, 24                                 ; 4111 _ 83. EC, 18
        mov     eax, dword [ebp+0CH]                    ; 4114 _ 8B. 45, 0C
        add     eax, 4095                               ; 4117 _ 05, 00000FFF
        and     eax, 0FFFFF000H                         ; 411C _ 25, FFFFF000
        mov     dword [ebp+0CH], eax                    ; 4121 _ 89. 45, 0C
        mov     eax, dword [ebp+0CH]                    ; 4124 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 4127 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 412B _ 8B. 45, 08
        mov     dword [esp], eax                        ; 412E _ 89. 04 24
        call    memman_alloc                            ; 4131 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-4H], eax                     ; 4136 _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 4139 _ 8B. 45, FC
        leave                                           ; 413C _ C9
        ret                                             ; 413D _ C3
; memman_alloc_4k End of function

memman_free_4k:; Function begin
        push    ebp                                     ; 413E _ 55
        mov     ebp, esp                                ; 413F _ 89. E5
        sub     esp, 28                                 ; 4141 _ 83. EC, 1C
        mov     eax, dword [ebp+10H]                    ; 4144 _ 8B. 45, 10
        add     eax, 4095                               ; 4147 _ 05, 00000FFF
        and     eax, 0FFFFF000H                         ; 414C _ 25, FFFFF000
        mov     dword [ebp+10H], eax                    ; 4151 _ 89. 45, 10
        mov     eax, dword [ebp+10H]                    ; 4154 _ 8B. 45, 10
        mov     dword [esp+8H], eax                     ; 4157 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 415B _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 415E _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 4162 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 4165 _ 89. 04 24
        call    memman_free                             ; 4168 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-4H], eax                     ; 416D _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 4170 _ 8B. 45, FC
        leave                                           ; 4173 _ C9
        ret                                             ; 4174 _ C3
; memman_free_4k End of function

shtctl_init:; Function begin
        push    ebp                                     ; 4175 _ 55
        mov     ebp, esp                                ; 4176 _ 89. E5
        sub     esp, 40                                 ; 4178 _ 83. EC, 28
        mov     dword [esp+4H], 9232                    ; 417B _ C7. 44 24, 04, 00002410
        mov     eax, dword [ebp+8H]                     ; 4183 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 4186 _ 89. 04 24
        call    memman_alloc_4k                         ; 4189 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 418E _ 89. 45, F4
        cmp     dword [ebp-0CH], 0                      ; 4191 _ 83. 7D, F4, 00
        jnz     ?_237                                   ; 4195 _ 75, 0A
        mov     eax, 0                                  ; 4197 _ B8, 00000000
        jmp     ?_241                                   ; 419C _ E9, 000000A3

?_237:  mov     eax, dword [ebp+10H]                    ; 41A1 _ 8B. 45, 10
        imul    eax, dword [ebp+14H]                    ; 41A4 _ 0F AF. 45, 14
        mov     dword [esp+4H], eax                     ; 41A8 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 41AC _ 8B. 45, 08
        mov     dword [esp], eax                        ; 41AF _ 89. 04 24
        call    memman_alloc_4k                         ; 41B2 _ E8, FFFFFFFC(rel)
        mov     edx, eax                                ; 41B7 _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 41B9 _ 8B. 45, F4
        mov     dword [eax+4H], edx                     ; 41BC _ 89. 50, 04
        mov     eax, dword [ebp-0CH]                    ; 41BF _ 8B. 45, F4
        mov     eax, dword [eax+4H]                     ; 41C2 _ 8B. 40, 04
        test    eax, eax                                ; 41C5 _ 85. C0
        jnz     ?_238                                   ; 41C7 _ 75, 21
        mov     eax, dword [ebp-0CH]                    ; 41C9 _ 8B. 45, F4
        mov     dword [esp+8H], 9232                    ; 41CC _ C7. 44 24, 08, 00002410
        mov     dword [esp+4H], eax                     ; 41D4 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 41D8 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 41DB _ 89. 04 24
        call    memman_free_4k                          ; 41DE _ E8, FFFFFFFC(rel)
        mov     eax, 0                                  ; 41E3 _ B8, 00000000
        jmp     ?_241                                   ; 41E8 _ EB, 5A

?_238:  mov     eax, dword [ebp-0CH]                    ; 41EA _ 8B. 45, F4
        mov     edx, dword [ebp+0CH]                    ; 41ED _ 8B. 55, 0C
        mov     dword [eax], edx                        ; 41F0 _ 89. 10
        mov     eax, dword [ebp-0CH]                    ; 41F2 _ 8B. 45, F4
        mov     edx, dword [ebp+10H]                    ; 41F5 _ 8B. 55, 10
        mov     dword [eax+8H], edx                     ; 41F8 _ 89. 50, 08
        mov     eax, dword [ebp-0CH]                    ; 41FB _ 8B. 45, F4
        mov     edx, dword [ebp+14H]                    ; 41FE _ 8B. 55, 14
        mov     dword [eax+0CH], edx                    ; 4201 _ 89. 50, 0C
        mov     eax, dword [ebp-0CH]                    ; 4204 _ 8B. 45, F4
        mov     dword [eax+10H], -1                     ; 4207 _ C7. 40, 10, FFFFFFFF
        mov     dword [ebp-10H], 0                      ; 420E _ C7. 45, F0, 00000000
        jmp     ?_240                                   ; 4215 _ EB, 21

?_239:  mov     ecx, dword [ebp-0CH]                    ; 4217 _ 8B. 4D, F4
        mov     edx, dword [ebp-10H]                    ; 421A _ 8B. 55, F0
        mov     eax, edx                                ; 421D _ 89. D0
        shl     eax, 3                                  ; 421F _ C1. E0, 03
        add     eax, edx                                ; 4222 _ 01. D0
        shl     eax, 2                                  ; 4224 _ C1. E0, 02
        add     eax, ecx                                ; 4227 _ 01. C8
        add     eax, 1072                               ; 4229 _ 05, 00000430
        mov     dword [eax], 0                          ; 422E _ C7. 00, 00000000
        add     dword [ebp-10H], 1                      ; 4234 _ 83. 45, F0, 01
?_240:  cmp     dword [ebp-10H], 255                    ; 4238 _ 81. 7D, F0, 000000FF
        jle     ?_239                                   ; 423F _ 7E, D6
        mov     eax, dword [ebp-0CH]                    ; 4241 _ 8B. 45, F4
?_241:  leave                                           ; 4244 _ C9
        ret                                             ; 4245 _ C3
; shtctl_init End of function

sheet_alloc:; Function begin
        push    ebp                                     ; 4246 _ 55
        mov     ebp, esp                                ; 4247 _ 89. E5
        sub     esp, 24                                 ; 4249 _ 83. EC, 18
        mov     dword [ebp-10H], 0                      ; 424C _ C7. 45, F0, 00000000
        jmp     ?_244                                   ; 4253 _ EB, 73

?_242:  mov     ecx, dword [ebp+8H]                     ; 4255 _ 8B. 4D, 08
        mov     edx, dword [ebp-10H]                    ; 4258 _ 8B. 55, F0
        mov     eax, edx                                ; 425B _ 89. D0
        shl     eax, 3                                  ; 425D _ C1. E0, 03
        add     eax, edx                                ; 4260 _ 01. D0
        shl     eax, 2                                  ; 4262 _ C1. E0, 02
        add     eax, ecx                                ; 4265 _ 01. C8
        add     eax, 1072                               ; 4267 _ 05, 00000430
        mov     eax, dword [eax]                        ; 426C _ 8B. 00
        test    eax, eax                                ; 426E _ 85. C0
        jnz     ?_243                                   ; 4270 _ 75, 52
        mov     edx, dword [ebp-10H]                    ; 4272 _ 8B. 55, F0
        mov     eax, edx                                ; 4275 _ 89. D0
        shl     eax, 3                                  ; 4277 _ C1. E0, 03
        add     eax, edx                                ; 427A _ 01. D0
        shl     eax, 2                                  ; 427C _ C1. E0, 02
        lea     edx, [eax+410H]                         ; 427F _ 8D. 90, 00000410
        mov     eax, dword [ebp+8H]                     ; 4285 _ 8B. 45, 08
        add     eax, edx                                ; 4288 _ 01. D0
        add     eax, 4                                  ; 428A _ 83. C0, 04
        mov     dword [ebp-0CH], eax                    ; 428D _ 89. 45, F4
        mov     eax, dword [ebp+8H]                     ; 4290 _ 8B. 45, 08
        mov     edx, dword [ebp-10H]                    ; 4293 _ 8B. 55, F0
        lea     ecx, [edx+4H]                           ; 4296 _ 8D. 4A, 04
        mov     edx, dword [ebp-0CH]                    ; 4299 _ 8B. 55, F4
        mov     dword [eax+ecx*4+4H], edx               ; 429C _ 89. 54 88, 04
        mov     eax, dword [ebp-0CH]                    ; 42A0 _ 8B. 45, F4
        mov     dword [eax+1CH], 1                      ; 42A3 _ C7. 40, 1C, 00000001
        mov     eax, dword [ebp-0CH]                    ; 42AA _ 8B. 45, F4
        mov     dword [eax+18H], -1                     ; 42AD _ C7. 40, 18, FFFFFFFF
        call    task_now                                ; 42B4 _ E8, FFFFFFFC(rel)
        mov     edx, dword [ebp-0CH]                    ; 42B9 _ 8B. 55, F4
        mov     dword [edx+20H], eax                    ; 42BC _ 89. 42, 20
        mov     eax, dword [ebp-0CH]                    ; 42BF _ 8B. 45, F4
        jmp     ?_245                                   ; 42C2 _ EB, 12

?_243:  add     dword [ebp-10H], 1                      ; 42C4 _ 83. 45, F0, 01
?_244:  cmp     dword [ebp-10H], 255                    ; 42C8 _ 81. 7D, F0, 000000FF
        jle     ?_242                                   ; 42CF _ 7E, 84
        mov     eax, 0                                  ; 42D1 _ B8, 00000000
?_245:  leave                                           ; 42D6 _ C9
        ret                                             ; 42D7 _ C3
; sheet_alloc End of function

sheet_setbuf:; Function begin
        push    ebp                                     ; 42D8 _ 55
        mov     ebp, esp                                ; 42D9 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 42DB _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 42DE _ 8B. 55, 0C
        mov     dword [eax], edx                        ; 42E1 _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 42E3 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 42E6 _ 8B. 55, 10
        mov     dword [eax+4H], edx                     ; 42E9 _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 42EC _ 8B. 45, 08
        mov     edx, dword [ebp+14H]                    ; 42EF _ 8B. 55, 14
        mov     dword [eax+8H], edx                     ; 42F2 _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 42F5 _ 8B. 45, 08
        mov     edx, dword [ebp+18H]                    ; 42F8 _ 8B. 55, 18
        mov     dword [eax+14H], edx                    ; 42FB _ 89. 50, 14
        nop                                             ; 42FE _ 90
        pop     ebp                                     ; 42FF _ 5D
        ret                                             ; 4300 _ C3
; sheet_setbuf End of function

sheet_updown:; Function begin
        push    ebp                                     ; 4301 _ 55
        mov     ebp, esp                                ; 4302 _ 89. E5
        push    edi                                     ; 4304 _ 57
        push    esi                                     ; 4305 _ 56
        push    ebx                                     ; 4306 _ 53
        sub     esp, 60                                 ; 4307 _ 83. EC, 3C
        mov     eax, dword [ebp+0CH]                    ; 430A _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 430D _ 8B. 40, 18
        mov     dword [ebp-1CH], eax                    ; 4310 _ 89. 45, E4
        mov     eax, dword [ebp+8H]                     ; 4313 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 4316 _ 8B. 40, 10
        add     eax, 1                                  ; 4319 _ 83. C0, 01
        cmp     eax, dword [ebp+10H]                    ; 431C _ 3B. 45, 10
        jge     ?_246                                   ; 431F _ 7D, 0C
        mov     eax, dword [ebp+8H]                     ; 4321 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 4324 _ 8B. 40, 10
        add     eax, 1                                  ; 4327 _ 83. C0, 01
        mov     dword [ebp+10H], eax                    ; 432A _ 89. 45, 10
?_246:  cmp     dword [ebp+10H], -1                     ; 432D _ 83. 7D, 10, FF
        jge     ?_247                                   ; 4331 _ 7D, 07
        mov     dword [ebp+10H], -1                     ; 4333 _ C7. 45, 10, FFFFFFFF
?_247:  mov     eax, dword [ebp+0CH]                    ; 433A _ 8B. 45, 0C
        mov     edx, dword [ebp+10H]                    ; 433D _ 8B. 55, 10
        mov     dword [eax+18H], edx                    ; 4340 _ 89. 50, 18
        mov     eax, dword [ebp-1CH]                    ; 4343 _ 8B. 45, E4
        cmp     eax, dword [ebp+10H]                    ; 4346 _ 3B. 45, 10
        jle     ?_254                                   ; 4349 _ 0F 8E, 00000212
        cmp     dword [ebp+10H], 0                      ; 434F _ 83. 7D, 10, 00
        js      ?_250                                   ; 4353 _ 0F 88, 000000FE
        mov     eax, dword [ebp-1CH]                    ; 4359 _ 8B. 45, E4
        mov     dword [ebp-20H], eax                    ; 435C _ 89. 45, E0
        jmp     ?_249                                   ; 435F _ EB, 34

?_248:  mov     eax, dword [ebp-20H]                    ; 4361 _ 8B. 45, E0
        lea     edx, [eax-1H]                           ; 4364 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 4367 _ 8B. 45, 08
        add     edx, 4                                  ; 436A _ 83. C2, 04
        mov     edx, dword [eax+edx*4+4H]               ; 436D _ 8B. 54 90, 04
        mov     eax, dword [ebp+8H]                     ; 4371 _ 8B. 45, 08
        mov     ecx, dword [ebp-20H]                    ; 4374 _ 8B. 4D, E0
        add     ecx, 4                                  ; 4377 _ 83. C1, 04
        mov     dword [eax+ecx*4+4H], edx               ; 437A _ 89. 54 88, 04
        mov     eax, dword [ebp+8H]                     ; 437E _ 8B. 45, 08
        mov     edx, dword [ebp-20H]                    ; 4381 _ 8B. 55, E0
        add     edx, 4                                  ; 4384 _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 4387 _ 8B. 44 90, 04
        mov     edx, dword [ebp-20H]                    ; 438B _ 8B. 55, E0
        mov     dword [eax+18H], edx                    ; 438E _ 89. 50, 18
        sub     dword [ebp-20H], 1                      ; 4391 _ 83. 6D, E0, 01
?_249:  mov     eax, dword [ebp-20H]                    ; 4395 _ 8B. 45, E0
        cmp     eax, dword [ebp+10H]                    ; 4398 _ 3B. 45, 10
        jg      ?_248                                   ; 439B _ 7F, C4
        mov     eax, dword [ebp+8H]                     ; 439D _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 43A0 _ 8B. 55, 10
        lea     ecx, [edx+4H]                           ; 43A3 _ 8D. 4A, 04
        mov     edx, dword [ebp+0CH]                    ; 43A6 _ 8B. 55, 0C
        mov     dword [eax+ecx*4+4H], edx               ; 43A9 _ 89. 54 88, 04
        mov     eax, dword [ebp+10H]                    ; 43AD _ 8B. 45, 10
        lea     esi, [eax+1H]                           ; 43B0 _ 8D. 70, 01
        mov     eax, dword [ebp+0CH]                    ; 43B3 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 43B6 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 43B9 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 43BC _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 43BF _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 43C2 _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 43C5 _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 43C8 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 43CB _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 43CE _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 43D1 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 43D4 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 43D7 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 43DA _ 8B. 40, 0C
        mov     dword [esp+14H], esi                    ; 43DD _ 89. 74 24, 14
        mov     dword [esp+10H], ebx                    ; 43E1 _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 43E5 _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 43E9 _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 43ED _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 43F1 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 43F4 _ 89. 04 24
        call    sheet_refreshmap                        ; 43F7 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 43FC _ 8B. 45, 10
        lea     edi, [eax+1H]                           ; 43FF _ 8D. 78, 01
        mov     eax, dword [ebp+0CH]                    ; 4402 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 4405 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 4408 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 440B _ 8B. 40, 08
        lea     esi, [edx+eax]                          ; 440E _ 8D. 34 02
        mov     eax, dword [ebp+0CH]                    ; 4411 _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 4414 _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 4417 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 441A _ 8B. 40, 04
        lea     ebx, [edx+eax]                          ; 441D _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 4420 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 4423 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 4426 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 4429 _ 8B. 40, 0C
        mov     ecx, dword [ebp-1CH]                    ; 442C _ 8B. 4D, E4
        mov     dword [esp+18H], ecx                    ; 442F _ 89. 4C 24, 18
        mov     dword [esp+14H], edi                    ; 4433 _ 89. 7C 24, 14
        mov     dword [esp+10H], esi                    ; 4437 _ 89. 74 24, 10
        mov     dword [esp+0CH], ebx                    ; 443B _ 89. 5C 24, 0C
        mov     dword [esp+8H], edx                     ; 443F _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 4443 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 4447 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 444A _ 89. 04 24
        call    sheet_refreshsub                        ; 444D _ E8, FFFFFFFC(rel)
        jmp     ?_261                                   ; 4452 _ E9, 0000027D

?_250:  mov     eax, dword [ebp+8H]                     ; 4457 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 445A _ 8B. 40, 10
        cmp     eax, dword [ebp-1CH]                    ; 445D _ 3B. 45, E4
        jle     ?_253                                   ; 4460 _ 7E, 47
        mov     eax, dword [ebp-1CH]                    ; 4462 _ 8B. 45, E4
        mov     dword [ebp-20H], eax                    ; 4465 _ 89. 45, E0
        jmp     ?_252                                   ; 4468 _ EB, 34

?_251:  mov     eax, dword [ebp-20H]                    ; 446A _ 8B. 45, E0
        lea     edx, [eax+1H]                           ; 446D _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 4470 _ 8B. 45, 08
        add     edx, 4                                  ; 4473 _ 83. C2, 04
        mov     edx, dword [eax+edx*4+4H]               ; 4476 _ 8B. 54 90, 04
        mov     eax, dword [ebp+8H]                     ; 447A _ 8B. 45, 08
        mov     ecx, dword [ebp-20H]                    ; 447D _ 8B. 4D, E0
        add     ecx, 4                                  ; 4480 _ 83. C1, 04
        mov     dword [eax+ecx*4+4H], edx               ; 4483 _ 89. 54 88, 04
        mov     eax, dword [ebp+8H]                     ; 4487 _ 8B. 45, 08
        mov     edx, dword [ebp-20H]                    ; 448A _ 8B. 55, E0
        add     edx, 4                                  ; 448D _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 4490 _ 8B. 44 90, 04
        mov     edx, dword [ebp-20H]                    ; 4494 _ 8B. 55, E0
        mov     dword [eax+18H], edx                    ; 4497 _ 89. 50, 18
        add     dword [ebp-20H], 1                      ; 449A _ 83. 45, E0, 01
?_252:  mov     eax, dword [ebp+8H]                     ; 449E _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 44A1 _ 8B. 40, 10
        cmp     eax, dword [ebp-20H]                    ; 44A4 _ 3B. 45, E0
        jg      ?_251                                   ; 44A7 _ 7F, C1
?_253:  mov     eax, dword [ebp+8H]                     ; 44A9 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 44AC _ 8B. 40, 10
        lea     edx, [eax-1H]                           ; 44AF _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 44B2 _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 44B5 _ 89. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 44B8 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 44BB _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 44BE _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 44C1 _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 44C4 _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 44C7 _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 44CA _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 44CD _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 44D0 _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 44D3 _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 44D6 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 44D9 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 44DC _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 44DF _ 8B. 40, 0C
        mov     dword [esp+14H], 0                      ; 44E2 _ C7. 44 24, 14, 00000000
        mov     dword [esp+10H], ebx                    ; 44EA _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 44EE _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 44F2 _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 44F6 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 44FA _ 8B. 45, 08
        mov     dword [esp], eax                        ; 44FD _ 89. 04 24
        call    sheet_refreshmap                        ; 4500 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-1CH]                    ; 4505 _ 8B. 45, E4
        lea     esi, [eax-1H]                           ; 4508 _ 8D. 70, FF
        mov     eax, dword [ebp+0CH]                    ; 450B _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 450E _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 4511 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 4514 _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 4517 _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 451A _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 451D _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 4520 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 4523 _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 4526 _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 4529 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 452C _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 452F _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 4532 _ 8B. 40, 0C
        mov     dword [esp+18H], esi                    ; 4535 _ 89. 74 24, 18
        mov     dword [esp+14H], 0                      ; 4539 _ C7. 44 24, 14, 00000000
        mov     dword [esp+10H], ebx                    ; 4541 _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 4545 _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 4549 _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 454D _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 4551 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 4554 _ 89. 04 24
        call    sheet_refreshsub                        ; 4557 _ E8, FFFFFFFC(rel)
        jmp     ?_261                                   ; 455C _ E9, 00000173

?_254:  mov     eax, dword [ebp-1CH]                    ; 4561 _ 8B. 45, E4
        cmp     eax, dword [ebp+10H]                    ; 4564 _ 3B. 45, 10
        jge     ?_261                                   ; 4567 _ 0F 8D, 00000167
        cmp     dword [ebp-1CH], 0                      ; 456D _ 83. 7D, E4, 00
        js      ?_257                                   ; 4571 _ 78, 56
        mov     eax, dword [ebp-1CH]                    ; 4573 _ 8B. 45, E4
        mov     dword [ebp-20H], eax                    ; 4576 _ 89. 45, E0
        jmp     ?_256                                   ; 4579 _ EB, 34

?_255:  mov     eax, dword [ebp-20H]                    ; 457B _ 8B. 45, E0
        lea     edx, [eax+1H]                           ; 457E _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 4581 _ 8B. 45, 08
        add     edx, 4                                  ; 4584 _ 83. C2, 04
        mov     edx, dword [eax+edx*4+4H]               ; 4587 _ 8B. 54 90, 04
        mov     eax, dword [ebp+8H]                     ; 458B _ 8B. 45, 08
        mov     ecx, dword [ebp-20H]                    ; 458E _ 8B. 4D, E0
        add     ecx, 4                                  ; 4591 _ 83. C1, 04
        mov     dword [eax+ecx*4+4H], edx               ; 4594 _ 89. 54 88, 04
        mov     eax, dword [ebp+8H]                     ; 4598 _ 8B. 45, 08
        mov     edx, dword [ebp-20H]                    ; 459B _ 8B. 55, E0
        add     edx, 4                                  ; 459E _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 45A1 _ 8B. 44 90, 04
        mov     edx, dword [ebp-20H]                    ; 45A5 _ 8B. 55, E0
        mov     dword [eax+18H], edx                    ; 45A8 _ 89. 50, 18
        add     dword [ebp-20H], 1                      ; 45AB _ 83. 45, E0, 01
?_256:  mov     eax, dword [ebp-20H]                    ; 45AF _ 8B. 45, E0
        cmp     eax, dword [ebp+10H]                    ; 45B2 _ 3B. 45, 10
        jl      ?_255                                   ; 45B5 _ 7C, C4
        mov     eax, dword [ebp+8H]                     ; 45B7 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 45BA _ 8B. 55, 10
        lea     ecx, [edx+4H]                           ; 45BD _ 8D. 4A, 04
        mov     edx, dword [ebp+0CH]                    ; 45C0 _ 8B. 55, 0C
        mov     dword [eax+ecx*4+4H], edx               ; 45C3 _ 89. 54 88, 04
        jmp     ?_260                                   ; 45C7 _ EB, 6C

?_257:  mov     eax, dword [ebp+8H]                     ; 45C9 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 45CC _ 8B. 40, 10
        mov     dword [ebp-20H], eax                    ; 45CF _ 89. 45, E0
        jmp     ?_259                                   ; 45D2 _ EB, 3A

?_258:  mov     eax, dword [ebp-20H]                    ; 45D4 _ 8B. 45, E0
        lea     ecx, [eax+1H]                           ; 45D7 _ 8D. 48, 01
        mov     eax, dword [ebp+8H]                     ; 45DA _ 8B. 45, 08
        mov     edx, dword [ebp-20H]                    ; 45DD _ 8B. 55, E0
        add     edx, 4                                  ; 45E0 _ 83. C2, 04
        mov     edx, dword [eax+edx*4+4H]               ; 45E3 _ 8B. 54 90, 04
        mov     eax, dword [ebp+8H]                     ; 45E7 _ 8B. 45, 08
        add     ecx, 4                                  ; 45EA _ 83. C1, 04
        mov     dword [eax+ecx*4+4H], edx               ; 45ED _ 89. 54 88, 04
        mov     eax, dword [ebp-20H]                    ; 45F1 _ 8B. 45, E0
        lea     edx, [eax+1H]                           ; 45F4 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 45F7 _ 8B. 45, 08
        add     edx, 4                                  ; 45FA _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 45FD _ 8B. 44 90, 04
        mov     edx, dword [ebp-20H]                    ; 4601 _ 8B. 55, E0
        add     edx, 1                                  ; 4604 _ 83. C2, 01
        mov     dword [eax+18H], edx                    ; 4607 _ 89. 50, 18
        sub     dword [ebp-20H], 1                      ; 460A _ 83. 6D, E0, 01
?_259:  mov     eax, dword [ebp-20H]                    ; 460E _ 8B. 45, E0
        cmp     eax, dword [ebp+10H]                    ; 4611 _ 3B. 45, 10
        jge     ?_258                                   ; 4614 _ 7D, BE
        mov     eax, dword [ebp+8H]                     ; 4616 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 4619 _ 8B. 55, 10
        lea     ecx, [edx+4H]                           ; 461C _ 8D. 4A, 04
        mov     edx, dword [ebp+0CH]                    ; 461F _ 8B. 55, 0C
        mov     dword [eax+ecx*4+4H], edx               ; 4622 _ 89. 54 88, 04
        mov     eax, dword [ebp+8H]                     ; 4626 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 4629 _ 8B. 40, 10
        lea     edx, [eax+1H]                           ; 462C _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 462F _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 4632 _ 89. 50, 10
?_260:  mov     eax, dword [ebp+0CH]                    ; 4635 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 4638 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 463B _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 463E _ 8B. 40, 08
        lea     esi, [edx+eax]                          ; 4641 _ 8D. 34 02
        mov     eax, dword [ebp+0CH]                    ; 4644 _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 4647 _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 464A _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 464D _ 8B. 40, 04
        lea     ebx, [edx+eax]                          ; 4650 _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 4653 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 4656 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 4659 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 465C _ 8B. 40, 0C
        mov     ecx, dword [ebp+10H]                    ; 465F _ 8B. 4D, 10
        mov     dword [esp+14H], ecx                    ; 4662 _ 89. 4C 24, 14
        mov     dword [esp+10H], esi                    ; 4666 _ 89. 74 24, 10
        mov     dword [esp+0CH], ebx                    ; 466A _ 89. 5C 24, 0C
        mov     dword [esp+8H], edx                     ; 466E _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 4672 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 4676 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 4679 _ 89. 04 24
        call    sheet_refreshmap                        ; 467C _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+0CH]                    ; 4681 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 4684 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 4687 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 468A _ 8B. 40, 08
        lea     esi, [edx+eax]                          ; 468D _ 8D. 34 02
        mov     eax, dword [ebp+0CH]                    ; 4690 _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 4693 _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 4696 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 4699 _ 8B. 40, 04
        lea     ebx, [edx+eax]                          ; 469C _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 469F _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 46A2 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 46A5 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 46A8 _ 8B. 40, 0C
        mov     ecx, dword [ebp+10H]                    ; 46AB _ 8B. 4D, 10
        mov     dword [esp+18H], ecx                    ; 46AE _ 89. 4C 24, 18
        mov     ecx, dword [ebp+10H]                    ; 46B2 _ 8B. 4D, 10
        mov     dword [esp+14H], ecx                    ; 46B5 _ 89. 4C 24, 14
        mov     dword [esp+10H], esi                    ; 46B9 _ 89. 74 24, 10
        mov     dword [esp+0CH], ebx                    ; 46BD _ 89. 5C 24, 0C
        mov     dword [esp+8H], edx                     ; 46C1 _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 46C5 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 46C9 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 46CC _ 89. 04 24
        call    sheet_refreshsub                        ; 46CF _ E8, FFFFFFFC(rel)
?_261:  add     esp, 60                                 ; 46D4 _ 83. C4, 3C
        pop     ebx                                     ; 46D7 _ 5B
        pop     esi                                     ; 46D8 _ 5E
        pop     edi                                     ; 46D9 _ 5F
        pop     ebp                                     ; 46DA _ 5D
        ret                                             ; 46DB _ C3
; sheet_updown End of function

sheet_refresh:; Function begin
        push    ebp                                     ; 46DC _ 55
        mov     ebp, esp                                ; 46DD _ 89. E5
        push    edi                                     ; 46DF _ 57
        push    esi                                     ; 46E0 _ 56
        push    ebx                                     ; 46E1 _ 53
        sub     esp, 44                                 ; 46E2 _ 83. EC, 2C
        mov     eax, dword [ebp+0CH]                    ; 46E5 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 46E8 _ 8B. 40, 18
        test    eax, eax                                ; 46EB _ 85. C0
        js      ?_262                                   ; 46ED _ 78, 61
        mov     eax, dword [ebp+0CH]                    ; 46EF _ 8B. 45, 0C
        mov     ebx, dword [eax+18H]                    ; 46F2 _ 8B. 58, 18
        mov     eax, dword [ebp+0CH]                    ; 46F5 _ 8B. 45, 0C
        mov     ecx, dword [eax+18H]                    ; 46F8 _ 8B. 48, 18
        mov     eax, dword [ebp+0CH]                    ; 46FB _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 46FE _ 8B. 50, 10
        mov     eax, dword [ebp+1CH]                    ; 4701 _ 8B. 45, 1C
        lea     edi, [edx+eax]                          ; 4704 _ 8D. 3C 02
        mov     eax, dword [ebp+0CH]                    ; 4707 _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 470A _ 8B. 50, 0C
        mov     eax, dword [ebp+18H]                    ; 470D _ 8B. 45, 18
        lea     esi, [edx+eax]                          ; 4710 _ 8D. 34 02
        mov     eax, dword [ebp+0CH]                    ; 4713 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 4716 _ 8B. 50, 10
        mov     eax, dword [ebp+14H]                    ; 4719 _ 8B. 45, 14
        add     edx, eax                                ; 471C _ 01. C2
        mov     eax, dword [ebp+0CH]                    ; 471E _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 4721 _ 8B. 40, 0C
        mov     dword [ebp-1CH], eax                    ; 4724 _ 89. 45, E4
        mov     eax, dword [ebp+10H]                    ; 4727 _ 8B. 45, 10
        add     eax, dword [ebp-1CH]                    ; 472A _ 03. 45, E4
        mov     dword [esp+18H], ebx                    ; 472D _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 4731 _ 89. 4C 24, 14
        mov     dword [esp+10H], edi                    ; 4735 _ 89. 7C 24, 10
        mov     dword [esp+0CH], esi                    ; 4739 _ 89. 74 24, 0C
        mov     dword [esp+8H], edx                     ; 473D _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 4741 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 4745 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 4748 _ 89. 04 24
        call    sheet_refreshsub                        ; 474B _ E8, FFFFFFFC(rel)
?_262:  mov     eax, 0                                  ; 4750 _ B8, 00000000
        add     esp, 44                                 ; 4755 _ 83. C4, 2C
        pop     ebx                                     ; 4758 _ 5B
        pop     esi                                     ; 4759 _ 5E
        pop     edi                                     ; 475A _ 5F
        pop     ebp                                     ; 475B _ 5D
        ret                                             ; 475C _ C3
; sheet_refresh End of function

sheet_slide:; Function begin
        push    ebp                                     ; 475D _ 55
        mov     ebp, esp                                ; 475E _ 89. E5
        push    esi                                     ; 4760 _ 56
        push    ebx                                     ; 4761 _ 53
        sub     esp, 48                                 ; 4762 _ 83. EC, 30
        mov     eax, dword [ebp+0CH]                    ; 4765 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 4768 _ 8B. 40, 0C
        mov     dword [ebp-10H], eax                    ; 476B _ 89. 45, F0
        mov     eax, dword [ebp+0CH]                    ; 476E _ 8B. 45, 0C
        mov     eax, dword [eax+10H]                    ; 4771 _ 8B. 40, 10
        mov     dword [ebp-0CH], eax                    ; 4774 _ 89. 45, F4
        mov     eax, dword [ebp+0CH]                    ; 4777 _ 8B. 45, 0C
        mov     edx, dword [ebp+10H]                    ; 477A _ 8B. 55, 10
        mov     dword [eax+0CH], edx                    ; 477D _ 89. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 4780 _ 8B. 45, 0C
        mov     edx, dword [ebp+14H]                    ; 4783 _ 8B. 55, 14
        mov     dword [eax+10H], edx                    ; 4786 _ 89. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 4789 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 478C _ 8B. 40, 18
        test    eax, eax                                ; 478F _ 85. C0
        js      ?_263                                   ; 4791 _ 0F 88, 00000117
        mov     eax, dword [ebp+0CH]                    ; 4797 _ 8B. 45, 0C
        mov     edx, dword [eax+8H]                     ; 479A _ 8B. 50, 08
        mov     eax, dword [ebp-0CH]                    ; 479D _ 8B. 45, F4
        add     edx, eax                                ; 47A0 _ 01. C2
        mov     eax, dword [ebp+0CH]                    ; 47A2 _ 8B. 45, 0C
        mov     ecx, dword [eax+4H]                     ; 47A5 _ 8B. 48, 04
        mov     eax, dword [ebp-10H]                    ; 47A8 _ 8B. 45, F0
        add     eax, ecx                                ; 47AB _ 01. C8
        mov     dword [esp+14H], 0                      ; 47AD _ C7. 44 24, 14, 00000000
        mov     dword [esp+10H], edx                    ; 47B5 _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 47B9 _ 89. 44 24, 0C
        mov     eax, dword [ebp-0CH]                    ; 47BD _ 8B. 45, F4
        mov     dword [esp+8H], eax                     ; 47C0 _ 89. 44 24, 08
        mov     eax, dword [ebp-10H]                    ; 47C4 _ 8B. 45, F0
        mov     dword [esp+4H], eax                     ; 47C7 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 47CB _ 8B. 45, 08
        mov     dword [esp], eax                        ; 47CE _ 89. 04 24
        call    sheet_refreshmap                        ; 47D1 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+0CH]                    ; 47D6 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 47D9 _ 8B. 40, 18
        mov     edx, dword [ebp+0CH]                    ; 47DC _ 8B. 55, 0C
        mov     ecx, dword [edx+8H]                     ; 47DF _ 8B. 4A, 08
        mov     edx, dword [ebp+14H]                    ; 47E2 _ 8B. 55, 14
        add     ecx, edx                                ; 47E5 _ 01. D1
        mov     edx, dword [ebp+0CH]                    ; 47E7 _ 8B. 55, 0C
        mov     ebx, dword [edx+4H]                     ; 47EA _ 8B. 5A, 04
        mov     edx, dword [ebp+10H]                    ; 47ED _ 8B. 55, 10
        add     edx, ebx                                ; 47F0 _ 01. DA
        mov     dword [esp+14H], eax                    ; 47F2 _ 89. 44 24, 14
        mov     dword [esp+10H], ecx                    ; 47F6 _ 89. 4C 24, 10
        mov     dword [esp+0CH], edx                    ; 47FA _ 89. 54 24, 0C
        mov     eax, dword [ebp+14H]                    ; 47FE _ 8B. 45, 14
        mov     dword [esp+8H], eax                     ; 4801 _ 89. 44 24, 08
        mov     eax, dword [ebp+10H]                    ; 4805 _ 8B. 45, 10
        mov     dword [esp+4H], eax                     ; 4808 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 480C _ 8B. 45, 08
        mov     dword [esp], eax                        ; 480F _ 89. 04 24
        call    sheet_refreshmap                        ; 4812 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+0CH]                    ; 4817 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 481A _ 8B. 40, 18
        lea     ecx, [eax-1H]                           ; 481D _ 8D. 48, FF
        mov     eax, dword [ebp+0CH]                    ; 4820 _ 8B. 45, 0C
        mov     edx, dword [eax+8H]                     ; 4823 _ 8B. 50, 08
        mov     eax, dword [ebp-0CH]                    ; 4826 _ 8B. 45, F4
        add     edx, eax                                ; 4829 _ 01. C2
        mov     eax, dword [ebp+0CH]                    ; 482B _ 8B. 45, 0C
        mov     ebx, dword [eax+4H]                     ; 482E _ 8B. 58, 04
        mov     eax, dword [ebp-10H]                    ; 4831 _ 8B. 45, F0
        add     eax, ebx                                ; 4834 _ 01. D8
        mov     dword [esp+18H], ecx                    ; 4836 _ 89. 4C 24, 18
        mov     dword [esp+14H], 0                      ; 483A _ C7. 44 24, 14, 00000000
        mov     dword [esp+10H], edx                    ; 4842 _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 4846 _ 89. 44 24, 0C
        mov     eax, dword [ebp-0CH]                    ; 484A _ 8B. 45, F4
        mov     dword [esp+8H], eax                     ; 484D _ 89. 44 24, 08
        mov     eax, dword [ebp-10H]                    ; 4851 _ 8B. 45, F0
        mov     dword [esp+4H], eax                     ; 4854 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 4858 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 485B _ 89. 04 24
        call    sheet_refreshsub                        ; 485E _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+0CH]                    ; 4863 _ 8B. 45, 0C
        mov     edx, dword [eax+18H]                    ; 4866 _ 8B. 50, 18
        mov     eax, dword [ebp+0CH]                    ; 4869 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 486C _ 8B. 40, 18
        mov     ecx, dword [ebp+0CH]                    ; 486F _ 8B. 4D, 0C
        mov     ebx, dword [ecx+8H]                     ; 4872 _ 8B. 59, 08
        mov     ecx, dword [ebp+14H]                    ; 4875 _ 8B. 4D, 14
        add     ebx, ecx                                ; 4878 _ 01. CB
        mov     ecx, dword [ebp+0CH]                    ; 487A _ 8B. 4D, 0C
        mov     esi, dword [ecx+4H]                     ; 487D _ 8B. 71, 04
        mov     ecx, dword [ebp+10H]                    ; 4880 _ 8B. 4D, 10
        add     ecx, esi                                ; 4883 _ 01. F1
        mov     dword [esp+18H], edx                    ; 4885 _ 89. 54 24, 18
        mov     dword [esp+14H], eax                    ; 4889 _ 89. 44 24, 14
        mov     dword [esp+10H], ebx                    ; 488D _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 4891 _ 89. 4C 24, 0C
        mov     eax, dword [ebp+14H]                    ; 4895 _ 8B. 45, 14
        mov     dword [esp+8H], eax                     ; 4898 _ 89. 44 24, 08
        mov     eax, dword [ebp+10H]                    ; 489C _ 8B. 45, 10
        mov     dword [esp+4H], eax                     ; 489F _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 48A3 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 48A6 _ 89. 04 24
        call    sheet_refreshsub                        ; 48A9 _ E8, FFFFFFFC(rel)
?_263:  add     esp, 48                                 ; 48AE _ 83. C4, 30
        pop     ebx                                     ; 48B1 _ 5B
        pop     esi                                     ; 48B2 _ 5E
        pop     ebp                                     ; 48B3 _ 5D
        ret                                             ; 48B4 _ C3
; sheet_slide End of function

sheet_refreshsub:; Function begin
        push    ebp                                     ; 48B5 _ 55
        mov     ebp, esp                                ; 48B6 _ 89. E5
        sub     esp, 48                                 ; 48B8 _ 83. EC, 30
        mov     eax, dword [ebp+8H]                     ; 48BB _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 48BE _ 8B. 00
        mov     dword [ebp-18H], eax                    ; 48C0 _ 89. 45, E8
        mov     eax, dword [ebp+8H]                     ; 48C3 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 48C6 _ 8B. 40, 04
        mov     dword [ebp-14H], eax                    ; 48C9 _ 89. 45, EC
        cmp     dword [ebp+0CH], 0                      ; 48CC _ 83. 7D, 0C, 00
        jns     ?_264                                   ; 48D0 _ 79, 07
        mov     dword [ebp+0CH], 0                      ; 48D2 _ C7. 45, 0C, 00000000
?_264:  cmp     dword [ebp+10H], 8                      ; 48D9 _ 83. 7D, 10, 08
        jg      ?_265                                   ; 48DD _ 7F, 07
        mov     dword [ebp+10H], 0                      ; 48DF _ C7. 45, 10, 00000000
?_265:  mov     eax, dword [ebp+8H]                     ; 48E6 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 48E9 _ 8B. 40, 08
        cmp     eax, dword [ebp+14H]                    ; 48EC _ 3B. 45, 14
        jge     ?_266                                   ; 48EF _ 7D, 09
        mov     eax, dword [ebp+8H]                     ; 48F1 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 48F4 _ 8B. 40, 08
        mov     dword [ebp+14H], eax                    ; 48F7 _ 89. 45, 14
?_266:  mov     eax, dword [ebp+8H]                     ; 48FA _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 48FD _ 8B. 40, 0C
        cmp     eax, dword [ebp+18H]                    ; 4900 _ 3B. 45, 18
        jge     ?_267                                   ; 4903 _ 7D, 09
        mov     eax, dword [ebp+8H]                     ; 4905 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 4908 _ 8B. 40, 0C
        mov     dword [ebp+18H], eax                    ; 490B _ 89. 45, 18
?_267:  mov     eax, dword [ebp+1CH]                    ; 490E _ 8B. 45, 1C
        mov     dword [ebp-24H], eax                    ; 4911 _ 89. 45, DC
        jmp     ?_274                                   ; 4914 _ E9, 0000011F

?_268:  mov     eax, dword [ebp+8H]                     ; 4919 _ 8B. 45, 08
        mov     edx, dword [ebp-24H]                    ; 491C _ 8B. 55, DC
        add     edx, 4                                  ; 491F _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 4922 _ 8B. 44 90, 04
        mov     dword [ebp-10H], eax                    ; 4926 _ 89. 45, F0
        mov     eax, dword [ebp-10H]                    ; 4929 _ 8B. 45, F0
        mov     eax, dword [eax]                        ; 492C _ 8B. 00
        mov     dword [ebp-0CH], eax                    ; 492E _ 89. 45, F4
        mov     edx, dword [ebp-10H]                    ; 4931 _ 8B. 55, F0
        mov     eax, dword [ebp+8H]                     ; 4934 _ 8B. 45, 08
        add     eax, 1044                               ; 4937 _ 05, 00000414
        sub     edx, eax                                ; 493C _ 29. C2
        mov     eax, edx                                ; 493E _ 89. D0
        sar     eax, 2                                  ; 4940 _ C1. F8, 02
        imul    eax, eax, 954437177                     ; 4943 _ 69. C0, 38E38E39
        mov     byte [ebp-26H], al                      ; 4949 _ 88. 45, DA
        mov     dword [ebp-1CH], 0                      ; 494C _ C7. 45, E4, 00000000
        jmp     ?_273                                   ; 4953 _ E9, 000000CD

?_269:  mov     eax, dword [ebp-10H]                    ; 4958 _ 8B. 45, F0
        mov     edx, dword [eax+10H]                    ; 495B _ 8B. 50, 10
        mov     eax, dword [ebp-1CH]                    ; 495E _ 8B. 45, E4
        add     eax, edx                                ; 4961 _ 01. D0
        mov     dword [ebp-8H], eax                     ; 4963 _ 89. 45, F8
        mov     dword [ebp-20H], 0                      ; 4966 _ C7. 45, E0, 00000000
        jmp     ?_272                                   ; 496D _ E9, 000000A0

?_270:  mov     eax, dword [ebp-10H]                    ; 4972 _ 8B. 45, F0
        mov     edx, dword [eax+0CH]                    ; 4975 _ 8B. 50, 0C
        mov     eax, dword [ebp-20H]                    ; 4978 _ 8B. 45, E0
        add     eax, edx                                ; 497B _ 01. D0
        mov     dword [ebp-4H], eax                     ; 497D _ 89. 45, FC
        mov     eax, dword [ebp+0CH]                    ; 4980 _ 8B. 45, 0C
        cmp     eax, dword [ebp-4H]                     ; 4983 _ 3B. 45, FC
        jg      ?_271                                   ; 4986 _ 0F 8F, 00000082
        mov     eax, dword [ebp-4H]                     ; 498C _ 8B. 45, FC
        cmp     eax, dword [ebp+14H]                    ; 498F _ 3B. 45, 14
        jge     ?_271                                   ; 4992 _ 7D, 7A
        mov     eax, dword [ebp+10H]                    ; 4994 _ 8B. 45, 10
        cmp     eax, dword [ebp-8H]                     ; 4997 _ 3B. 45, F8
        jg      ?_271                                   ; 499A _ 7F, 72
        mov     eax, dword [ebp-8H]                     ; 499C _ 8B. 45, F8
        cmp     eax, dword [ebp+18H]                    ; 499F _ 3B. 45, 18
        jge     ?_271                                   ; 49A2 _ 7D, 6A
        mov     eax, dword [ebp-10H]                    ; 49A4 _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 49A7 _ 8B. 40, 04
        imul    eax, dword [ebp-1CH]                    ; 49AA _ 0F AF. 45, E4
        mov     edx, eax                                ; 49AE _ 89. C2
        mov     eax, dword [ebp-20H]                    ; 49B0 _ 8B. 45, E0
        add     eax, edx                                ; 49B3 _ 01. D0
        mov     edx, eax                                ; 49B5 _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 49B7 _ 8B. 45, F4
        add     eax, edx                                ; 49BA _ 01. D0
        movzx   eax, byte [eax]                         ; 49BC _ 0F B6. 00
        mov     byte [ebp-25H], al                      ; 49BF _ 88. 45, DB
        mov     eax, dword [ebp+8H]                     ; 49C2 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 49C5 _ 8B. 40, 08
        imul    eax, dword [ebp-8H]                     ; 49C8 _ 0F AF. 45, F8
        mov     edx, eax                                ; 49CC _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 49CE _ 8B. 45, FC
        add     eax, edx                                ; 49D1 _ 01. D0
        mov     edx, eax                                ; 49D3 _ 89. C2
        mov     eax, dword [ebp-14H]                    ; 49D5 _ 8B. 45, EC
        add     eax, edx                                ; 49D8 _ 01. D0
        movzx   eax, byte [eax]                         ; 49DA _ 0F B6. 00
        cmp     al, byte [ebp-26H]                      ; 49DD _ 3A. 45, DA
        jnz     ?_271                                   ; 49E0 _ 75, 2C
        movzx   edx, byte [ebp-25H]                     ; 49E2 _ 0F B6. 55, DB
        mov     eax, dword [ebp-10H]                    ; 49E6 _ 8B. 45, F0
        mov     eax, dword [eax+14H]                    ; 49E9 _ 8B. 40, 14
        cmp     edx, eax                                ; 49EC _ 39. C2
        jz      ?_271                                   ; 49EE _ 74, 1E
        mov     eax, dword [ebp+8H]                     ; 49F0 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 49F3 _ 8B. 40, 08
        imul    eax, dword [ebp-8H]                     ; 49F6 _ 0F AF. 45, F8
        mov     edx, eax                                ; 49FA _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 49FC _ 8B. 45, FC
        add     eax, edx                                ; 49FF _ 01. D0
        mov     edx, eax                                ; 4A01 _ 89. C2
        mov     eax, dword [ebp-18H]                    ; 4A03 _ 8B. 45, E8
        add     edx, eax                                ; 4A06 _ 01. C2
        movzx   eax, byte [ebp-25H]                     ; 4A08 _ 0F B6. 45, DB
        mov     byte [edx], al                          ; 4A0C _ 88. 02
?_271:  add     dword [ebp-20H], 1                      ; 4A0E _ 83. 45, E0, 01
?_272:  mov     eax, dword [ebp-10H]                    ; 4A12 _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 4A15 _ 8B. 40, 04
        cmp     eax, dword [ebp-20H]                    ; 4A18 _ 3B. 45, E0
        jg      ?_270                                   ; 4A1B _ 0F 8F, FFFFFF51
        add     dword [ebp-1CH], 1                      ; 4A21 _ 83. 45, E4, 01
?_273:  mov     eax, dword [ebp-10H]                    ; 4A25 _ 8B. 45, F0
        mov     eax, dword [eax+8H]                     ; 4A28 _ 8B. 40, 08
        cmp     eax, dword [ebp-1CH]                    ; 4A2B _ 3B. 45, E4
        jg      ?_269                                   ; 4A2E _ 0F 8F, FFFFFF24
        add     dword [ebp-24H], 1                      ; 4A34 _ 83. 45, DC, 01
?_274:  mov     eax, dword [ebp-24H]                    ; 4A38 _ 8B. 45, DC
        cmp     eax, dword [ebp+20H]                    ; 4A3B _ 3B. 45, 20
        jle     ?_268                                   ; 4A3E _ 0F 8E, FFFFFED5
        leave                                           ; 4A44 _ C9
        ret                                             ; 4A45 _ C3
; sheet_refreshsub End of function

sheet_refreshmap:; Function begin
        push    ebp                                     ; 4A46 _ 55
        mov     ebp, esp                                ; 4A47 _ 89. E5
        sub     esp, 64                                 ; 4A49 _ 83. EC, 40
        mov     eax, dword [ebp+8H]                     ; 4A4C _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 4A4F _ 8B. 40, 04
        mov     dword [ebp-14H], eax                    ; 4A52 _ 89. 45, EC
        cmp     dword [ebp+0CH], 0                      ; 4A55 _ 83. 7D, 0C, 00
        jns     ?_275                                   ; 4A59 _ 79, 07
        mov     dword [ebp+0CH], 0                      ; 4A5B _ C7. 45, 0C, 00000000
?_275:  cmp     dword [ebp+10H], 0                      ; 4A62 _ 83. 7D, 10, 00
        jns     ?_276                                   ; 4A66 _ 79, 07
        mov     dword [ebp+10H], 0                      ; 4A68 _ C7. 45, 10, 00000000
?_276:  mov     eax, dword [ebp+8H]                     ; 4A6F _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 4A72 _ 8B. 40, 08
        cmp     eax, dword [ebp+14H]                    ; 4A75 _ 3B. 45, 14
        jge     ?_277                                   ; 4A78 _ 7D, 09
        mov     eax, dword [ebp+8H]                     ; 4A7A _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 4A7D _ 8B. 40, 08
        mov     dword [ebp+14H], eax                    ; 4A80 _ 89. 45, 14
?_277:  mov     eax, dword [ebp+8H]                     ; 4A83 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 4A86 _ 8B. 40, 0C
        cmp     eax, dword [ebp+18H]                    ; 4A89 _ 3B. 45, 18
        jge     ?_278                                   ; 4A8C _ 7D, 09
        mov     eax, dword [ebp+8H]                     ; 4A8E _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 4A91 _ 8B. 40, 0C
        mov     dword [ebp+18H], eax                    ; 4A94 _ 89. 45, 18
?_278:  mov     eax, dword [ebp+1CH]                    ; 4A97 _ 8B. 45, 1C
        mov     dword [ebp-30H], eax                    ; 4A9A _ 89. 45, D0
        jmp     ?_289                                   ; 4A9D _ E9, 00000147

?_279:  mov     eax, dword [ebp+8H]                     ; 4AA2 _ 8B. 45, 08
        mov     edx, dword [ebp-30H]                    ; 4AA5 _ 8B. 55, D0
        add     edx, 4                                  ; 4AA8 _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 4AAB _ 8B. 44 90, 04
        mov     dword [ebp-10H], eax                    ; 4AAF _ 89. 45, F0
        mov     edx, dword [ebp-10H]                    ; 4AB2 _ 8B. 55, F0
        mov     eax, dword [ebp+8H]                     ; 4AB5 _ 8B. 45, 08
        add     eax, 1044                               ; 4AB8 _ 05, 00000414
        sub     edx, eax                                ; 4ABD _ 29. C2
        mov     eax, edx                                ; 4ABF _ 89. D0
        sar     eax, 2                                  ; 4AC1 _ C1. F8, 02
        imul    eax, eax, 954437177                     ; 4AC4 _ 69. C0, 38E38E39
        mov     byte [ebp-31H], al                      ; 4ACA _ 88. 45, CF
        mov     eax, dword [ebp-10H]                    ; 4ACD _ 8B. 45, F0
        mov     eax, dword [eax]                        ; 4AD0 _ 8B. 00
        mov     dword [ebp-0CH], eax                    ; 4AD2 _ 89. 45, F4
        mov     eax, dword [ebp-10H]                    ; 4AD5 _ 8B. 45, F0
        mov     eax, dword [eax+0CH]                    ; 4AD8 _ 8B. 40, 0C
        mov     edx, dword [ebp+0CH]                    ; 4ADB _ 8B. 55, 0C
        sub     edx, eax                                ; 4ADE _ 29. C2
        mov     eax, edx                                ; 4AE0 _ 89. D0
        mov     dword [ebp-24H], eax                    ; 4AE2 _ 89. 45, DC
        mov     eax, dword [ebp-10H]                    ; 4AE5 _ 8B. 45, F0
        mov     eax, dword [eax+10H]                    ; 4AE8 _ 8B. 40, 10
        mov     edx, dword [ebp+10H]                    ; 4AEB _ 8B. 55, 10
        sub     edx, eax                                ; 4AEE _ 29. C2
        mov     eax, edx                                ; 4AF0 _ 89. D0
        mov     dword [ebp-20H], eax                    ; 4AF2 _ 89. 45, E0
        mov     eax, dword [ebp-10H]                    ; 4AF5 _ 8B. 45, F0
        mov     eax, dword [eax+0CH]                    ; 4AF8 _ 8B. 40, 0C
        mov     edx, dword [ebp+14H]                    ; 4AFB _ 8B. 55, 14
        sub     edx, eax                                ; 4AFE _ 29. C2
        mov     eax, edx                                ; 4B00 _ 89. D0
        mov     dword [ebp-1CH], eax                    ; 4B02 _ 89. 45, E4
        mov     eax, dword [ebp-10H]                    ; 4B05 _ 8B. 45, F0
        mov     eax, dword [eax+10H]                    ; 4B08 _ 8B. 40, 10
        mov     edx, dword [ebp+18H]                    ; 4B0B _ 8B. 55, 18
        sub     edx, eax                                ; 4B0E _ 29. C2
        mov     eax, edx                                ; 4B10 _ 89. D0
        mov     dword [ebp-18H], eax                    ; 4B12 _ 89. 45, E8
        cmp     dword [ebp-24H], 0                      ; 4B15 _ 83. 7D, DC, 00
        jns     ?_280                                   ; 4B19 _ 79, 07
        mov     dword [ebp-24H], 0                      ; 4B1B _ C7. 45, DC, 00000000
?_280:  cmp     dword [ebp-20H], 0                      ; 4B22 _ 83. 7D, E0, 00
        jns     ?_281                                   ; 4B26 _ 79, 07
        mov     dword [ebp-20H], 0                      ; 4B28 _ C7. 45, E0, 00000000
?_281:  mov     eax, dword [ebp-10H]                    ; 4B2F _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 4B32 _ 8B. 40, 04
        cmp     eax, dword [ebp-1CH]                    ; 4B35 _ 3B. 45, E4
        jge     ?_282                                   ; 4B38 _ 7D, 09
        mov     eax, dword [ebp-10H]                    ; 4B3A _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 4B3D _ 8B. 40, 04
        mov     dword [ebp-1CH], eax                    ; 4B40 _ 89. 45, E4
?_282:  mov     eax, dword [ebp-10H]                    ; 4B43 _ 8B. 45, F0
        mov     eax, dword [eax+8H]                     ; 4B46 _ 8B. 40, 08
        cmp     eax, dword [ebp-18H]                    ; 4B49 _ 3B. 45, E8
        jge     ?_283                                   ; 4B4C _ 7D, 09
        mov     eax, dword [ebp-10H]                    ; 4B4E _ 8B. 45, F0
        mov     eax, dword [eax+8H]                     ; 4B51 _ 8B. 40, 08
        mov     dword [ebp-18H], eax                    ; 4B54 _ 89. 45, E8
?_283:  mov     eax, dword [ebp-20H]                    ; 4B57 _ 8B. 45, E0
        mov     dword [ebp-28H], eax                    ; 4B5A _ 89. 45, D8
        jmp     ?_288                                   ; 4B5D _ EB, 7A

?_284:  mov     eax, dword [ebp-10H]                    ; 4B5F _ 8B. 45, F0
        mov     edx, dword [eax+10H]                    ; 4B62 _ 8B. 50, 10
        mov     eax, dword [ebp-28H]                    ; 4B65 _ 8B. 45, D8
        add     eax, edx                                ; 4B68 _ 01. D0
        mov     dword [ebp-8H], eax                     ; 4B6A _ 89. 45, F8
        mov     eax, dword [ebp-24H]                    ; 4B6D _ 8B. 45, DC
        mov     dword [ebp-2CH], eax                    ; 4B70 _ 89. 45, D4
        jmp     ?_287                                   ; 4B73 _ EB, 58

?_285:  mov     eax, dword [ebp-10H]                    ; 4B75 _ 8B. 45, F0
        mov     edx, dword [eax+0CH]                    ; 4B78 _ 8B. 50, 0C
        mov     eax, dword [ebp-2CH]                    ; 4B7B _ 8B. 45, D4
        add     eax, edx                                ; 4B7E _ 01. D0
        mov     dword [ebp-4H], eax                     ; 4B80 _ 89. 45, FC
        mov     eax, dword [ebp-10H]                    ; 4B83 _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 4B86 _ 8B. 40, 04
        imul    eax, dword [ebp-28H]                    ; 4B89 _ 0F AF. 45, D8
        mov     edx, eax                                ; 4B8D _ 89. C2
        mov     eax, dword [ebp-2CH]                    ; 4B8F _ 8B. 45, D4
        add     eax, edx                                ; 4B92 _ 01. D0
        mov     edx, eax                                ; 4B94 _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 4B96 _ 8B. 45, F4
        add     eax, edx                                ; 4B99 _ 01. D0
        movzx   eax, byte [eax]                         ; 4B9B _ 0F B6. 00
        movzx   edx, al                                 ; 4B9E _ 0F B6. D0
        mov     eax, dword [ebp-10H]                    ; 4BA1 _ 8B. 45, F0
        mov     eax, dword [eax+14H]                    ; 4BA4 _ 8B. 40, 14
        cmp     edx, eax                                ; 4BA7 _ 39. C2
        jz      ?_286                                   ; 4BA9 _ 74, 1E
        mov     eax, dword [ebp+8H]                     ; 4BAB _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 4BAE _ 8B. 40, 08
        imul    eax, dword [ebp-8H]                     ; 4BB1 _ 0F AF. 45, F8
        mov     edx, eax                                ; 4BB5 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 4BB7 _ 8B. 45, FC
        add     eax, edx                                ; 4BBA _ 01. D0
        mov     edx, eax                                ; 4BBC _ 89. C2
        mov     eax, dword [ebp-14H]                    ; 4BBE _ 8B. 45, EC
        add     edx, eax                                ; 4BC1 _ 01. C2
        movzx   eax, byte [ebp-31H]                     ; 4BC3 _ 0F B6. 45, CF
        mov     byte [edx], al                          ; 4BC7 _ 88. 02
?_286:  add     dword [ebp-2CH], 1                      ; 4BC9 _ 83. 45, D4, 01
?_287:  mov     eax, dword [ebp-2CH]                    ; 4BCD _ 8B. 45, D4
        cmp     eax, dword [ebp-1CH]                    ; 4BD0 _ 3B. 45, E4
        jl      ?_285                                   ; 4BD3 _ 7C, A0
        add     dword [ebp-28H], 1                      ; 4BD5 _ 83. 45, D8, 01
?_288:  mov     eax, dword [ebp-28H]                    ; 4BD9 _ 8B. 45, D8
        cmp     eax, dword [ebp-18H]                    ; 4BDC _ 3B. 45, E8
        jl      ?_284                                   ; 4BDF _ 0F 8C, FFFFFF7A
        add     dword [ebp-30H], 1                      ; 4BE5 _ 83. 45, D0, 01
?_289:  mov     eax, dword [ebp+8H]                     ; 4BE9 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 4BEC _ 8B. 40, 10
        cmp     eax, dword [ebp-30H]                    ; 4BEF _ 3B. 45, D0
        jge     ?_279                                   ; 4BF2 _ 0F 8D, FFFFFEAA
        nop                                             ; 4BF8 _ 90
        leave                                           ; 4BF9 _ C9
        ret                                             ; 4BFA _ C3
; sheet_refreshmap End of function

sheet_free:; Function begin
        push    ebp                                     ; 4BFB _ 55
        mov     ebp, esp                                ; 4BFC _ 89. E5
        sub     esp, 24                                 ; 4BFE _ 83. EC, 18
        mov     eax, dword [ebp+0CH]                    ; 4C01 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 4C04 _ 8B. 40, 18
        test    eax, eax                                ; 4C07 _ 85. C0
        js      ?_290                                   ; 4C09 _ 78, 1A
        mov     dword [esp+8H], -1                      ; 4C0B _ C7. 44 24, 08, FFFFFFFF
        mov     eax, dword [ebp+0CH]                    ; 4C13 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 4C16 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 4C1A _ 8B. 45, 08
        mov     dword [esp], eax                        ; 4C1D _ 89. 04 24
        call    sheet_updown                            ; 4C20 _ E8, FFFFFFFC(rel)
?_290:  mov     eax, dword [ebp+0CH]                    ; 4C25 _ 8B. 45, 0C
        mov     dword [eax+1CH], 0                      ; 4C28 _ C7. 40, 1C, 00000000
        nop                                             ; 4C2F _ 90
        leave                                           ; 4C30 _ C9
        ret                                             ; 4C31 _ C3
; sheet_free End of function

init_pit:; Function begin
        push    ebp                                     ; 4C32 _ 55
        mov     ebp, esp                                ; 4C33 _ 89. E5
        sub     esp, 40                                 ; 4C35 _ 83. EC, 28
        mov     dword [esp+4H], 52                      ; 4C38 _ C7. 44 24, 04, 00000034
        mov     dword [esp], 67                         ; 4C40 _ C7. 04 24, 00000043
        call    io_out8                                 ; 4C47 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 156                     ; 4C4C _ C7. 44 24, 04, 0000009C
        mov     dword [esp], 64                         ; 4C54 _ C7. 04 24, 00000040
        call    io_out8                                 ; 4C5B _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 46                      ; 4C60 _ C7. 44 24, 04, 0000002E
        mov     dword [esp], 64                         ; 4C68 _ C7. 04 24, 00000040
        call    io_out8                                 ; 4C6F _ E8, FFFFFFFC(rel)
        mov     dword [timerctl], 0                     ; 4C74 _ C7. 05, 000003C0(d), 00000000
        mov     dword [ebp-0CH], 0                      ; 4C7E _ C7. 45, F4, 00000000
        jmp     ?_292                                   ; 4C85 _ EB, 28

?_291:  mov     eax, dword [ebp-0CH]                    ; 4C87 _ 8B. 45, F4
        shl     eax, 4                                  ; 4C8A _ C1. E0, 04
        add     eax, timerctl                           ; 4C8D _ 05, 000003C0(d)
        mov     dword [eax+8H], 0                       ; 4C92 _ C7. 40, 08, 00000000
        mov     eax, dword [ebp-0CH]                    ; 4C99 _ 8B. 45, F4
        shl     eax, 4                                  ; 4C9C _ C1. E0, 04
        add     eax, timerctl                           ; 4C9F _ 05, 000003C0(d)
        mov     dword [eax+0CH], 0                      ; 4CA4 _ C7. 40, 0C, 00000000
        add     dword [ebp-0CH], 1                      ; 4CAB _ 83. 45, F4, 01
?_292:  cmp     dword [ebp-0CH], 499                    ; 4CAF _ 81. 7D, F4, 000001F3
        jle     ?_291                                   ; 4CB6 _ 7E, CF
        leave                                           ; 4CB8 _ C9
        ret                                             ; 4CB9 _ C3
; init_pit End of function

timer_alloc:; Function begin
        push    ebp                                     ; 4CBA _ 55
        mov     ebp, esp                                ; 4CBB _ 89. E5
        sub     esp, 16                                 ; 4CBD _ 83. EC, 10
        mov     dword [ebp-4H], 0                       ; 4CC0 _ C7. 45, FC, 00000000
        jmp     ?_295                                   ; 4CC7 _ EB, 38

?_293:  mov     eax, dword [ebp-4H]                     ; 4CC9 _ 8B. 45, FC
        shl     eax, 4                                  ; 4CCC _ C1. E0, 04
        add     eax, timerctl                           ; 4CCF _ 05, 000003C0(d)
        mov     eax, dword [eax+8H]                     ; 4CD4 _ 8B. 40, 08
        test    eax, eax                                ; 4CD7 _ 85. C0
        jnz     ?_294                                   ; 4CD9 _ 75, 22
        mov     eax, dword [ebp-4H]                     ; 4CDB _ 8B. 45, FC
        shl     eax, 4                                  ; 4CDE _ C1. E0, 04
        add     eax, timerctl                           ; 4CE1 _ 05, 000003C0(d)
        mov     dword [eax+8H], 1                       ; 4CE6 _ C7. 40, 08, 00000001
        mov     eax, dword [ebp-4H]                     ; 4CED _ 8B. 45, FC
        shl     eax, 4                                  ; 4CF0 _ C1. E0, 04
        add     eax, timerctl                           ; 4CF3 _ 05, 000003C0(d)
        add     eax, 4                                  ; 4CF8 _ 83. C0, 04
        jmp     ?_296                                   ; 4CFB _ EB, 12

?_294:  add     dword [ebp-4H], 1                       ; 4CFD _ 83. 45, FC, 01
?_295:  cmp     dword [ebp-4H], 499                     ; 4D01 _ 81. 7D, FC, 000001F3
        jle     ?_293                                   ; 4D08 _ 7E, BF
        mov     eax, 0                                  ; 4D0A _ B8, 00000000
?_296:  leave                                           ; 4D0F _ C9
        ret                                             ; 4D10 _ C3
; timer_alloc End of function

timer_free:; Function begin
        push    ebp                                     ; 4D11 _ 55
        mov     ebp, esp                                ; 4D12 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 4D14 _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 4D17 _ C7. 40, 04, 00000000
        nop                                             ; 4D1E _ 90
        pop     ebp                                     ; 4D1F _ 5D
        ret                                             ; 4D20 _ C3
; timer_free End of function

timer_init:; Function begin
        push    ebp                                     ; 4D21 _ 55
        mov     ebp, esp                                ; 4D22 _ 89. E5
        sub     esp, 4                                  ; 4D24 _ 83. EC, 04
        mov     eax, dword [ebp+10H]                    ; 4D27 _ 8B. 45, 10
        mov     byte [ebp-4H], al                       ; 4D2A _ 88. 45, FC
        mov     eax, dword [ebp+8H]                     ; 4D2D _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 4D30 _ 8B. 55, 0C
        mov     dword [eax+8H], edx                     ; 4D33 _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 4D36 _ 8B. 45, 08
        movzx   edx, byte [ebp-4H]                      ; 4D39 _ 0F B6. 55, FC
        mov     byte [eax+0CH], dl                      ; 4D3D _ 88. 50, 0C
        nop                                             ; 4D40 _ 90
        leave                                           ; 4D41 _ C9
        ret                                             ; 4D42 _ C3
; timer_init End of function

timer_settime:; Function begin
        push    ebp                                     ; 4D43 _ 55
        mov     ebp, esp                                ; 4D44 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 4D46 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 4D49 _ 8B. 55, 0C
        mov     dword [eax], edx                        ; 4D4C _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 4D4E _ 8B. 45, 08
        mov     dword [eax+4H], 2                       ; 4D51 _ C7. 40, 04, 00000002
        nop                                             ; 4D58 _ 90
        pop     ebp                                     ; 4D59 _ 5D
        ret                                             ; 4D5A _ C3
; timer_settime End of function

intHandlerForTimer:; Function begin
        push    ebp                                     ; 4D5B _ 55
        mov     ebp, esp                                ; 4D5C _ 89. E5
        sub     esp, 40                                 ; 4D5E _ 83. EC, 28
        mov     dword [esp+4H], 32                      ; 4D61 _ C7. 44 24, 04, 00000020
        mov     dword [esp], 32                         ; 4D69 _ C7. 04 24, 00000020
        call    io_out8                                 ; 4D70 _ E8, FFFFFFFC(rel)
        mov     eax, dword [timerctl]                   ; 4D75 _ A1, 000003C0(d)
        add     eax, 1                                  ; 4D7A _ 83. C0, 01
        mov     dword [timerctl], eax                   ; 4D7D _ A3, 000003C0(d)
        mov     byte [ebp-0DH], 0                       ; 4D82 _ C6. 45, F3, 00
        mov     dword [ebp-0CH], 0                      ; 4D86 _ C7. 45, F4, 00000000
        jmp     ?_300                                   ; 4D8D _ E9, 000000B0

?_297:  mov     eax, dword [ebp-0CH]                    ; 4D92 _ 8B. 45, F4
        shl     eax, 4                                  ; 4D95 _ C1. E0, 04
        add     eax, timerctl                           ; 4D98 _ 05, 000003C0(d)
        mov     eax, dword [eax+8H]                     ; 4D9D _ 8B. 40, 08
        cmp     eax, 2                                  ; 4DA0 _ 83. F8, 02
        jne     ?_298                                   ; 4DA3 _ 0F 85, 0000008A
        mov     eax, dword [ebp-0CH]                    ; 4DA9 _ 8B. 45, F4
        shl     eax, 4                                  ; 4DAC _ C1. E0, 04
        add     eax, timerctl                           ; 4DAF _ 05, 000003C0(d)
        mov     eax, dword [eax+4H]                     ; 4DB4 _ 8B. 40, 04
        lea     edx, [eax-1H]                           ; 4DB7 _ 8D. 50, FF
        mov     eax, dword [ebp-0CH]                    ; 4DBA _ 8B. 45, F4
        shl     eax, 4                                  ; 4DBD _ C1. E0, 04
        add     eax, timerctl                           ; 4DC0 _ 05, 000003C0(d)
        mov     dword [eax+4H], edx                     ; 4DC5 _ 89. 50, 04
        mov     eax, dword [ebp-0CH]                    ; 4DC8 _ 8B. 45, F4
        shl     eax, 4                                  ; 4DCB _ C1. E0, 04
        add     eax, timerctl                           ; 4DCE _ 05, 000003C0(d)
        mov     eax, dword [eax+4H]                     ; 4DD3 _ 8B. 40, 04
        test    eax, eax                                ; 4DD6 _ 85. C0
        jnz     ?_298                                   ; 4DD8 _ 75, 59
        mov     eax, dword [ebp-0CH]                    ; 4DDA _ 8B. 45, F4
        shl     eax, 4                                  ; 4DDD _ C1. E0, 04
        add     eax, timerctl                           ; 4DE0 _ 05, 000003C0(d)
        mov     dword [eax+8H], 1                       ; 4DE5 _ C7. 40, 08, 00000001
        mov     eax, dword [ebp-0CH]                    ; 4DEC _ 8B. 45, F4
        shl     eax, 4                                  ; 4DEF _ C1. E0, 04
        add     eax, timerctl                           ; 4DF2 _ 05, 000003C0(d)
        movzx   eax, byte [eax+10H]                     ; 4DF7 _ 0F B6. 40, 10
        movzx   edx, al                                 ; 4DFB _ 0F B6. D0
        mov     eax, dword [ebp-0CH]                    ; 4DFE _ 8B. 45, F4
        shl     eax, 4                                  ; 4E01 _ C1. E0, 04
        add     eax, timerctl                           ; 4E04 _ 05, 000003C0(d)
        mov     eax, dword [eax+0CH]                    ; 4E09 _ 8B. 40, 0C
        mov     dword [esp+4H], edx                     ; 4E0C _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 4E10 _ 89. 04 24
        call    fifo8_put                               ; 4E13 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 4E18 _ 8B. 45, F4
        shl     eax, 4                                  ; 4E1B _ C1. E0, 04
        add     eax, timerctl                           ; 4E1E _ 05, 000003C0(d)
        lea     edx, [eax+4H]                           ; 4E23 _ 8D. 50, 04
        mov     eax, dword [task_timer]                 ; 4E26 _ A1, 00000000(d)
        cmp     edx, eax                                ; 4E2B _ 39. C2
        jnz     ?_298                                   ; 4E2D _ 75, 04
        mov     byte [ebp-0DH], 1                       ; 4E2F _ C6. 45, F3, 01
?_298:  cmp     byte [ebp-0DH], 0                       ; 4E33 _ 80. 7D, F3, 00
        jz      ?_299                                   ; 4E37 _ 74, 05
        call    task_switch                             ; 4E39 _ E8, FFFFFFFC(rel)
?_299:  add     dword [ebp-0CH], 1                      ; 4E3E _ 83. 45, F4, 01
?_300:  cmp     dword [ebp-0CH], 499                    ; 4E42 _ 81. 7D, F4, 000001F3
        jle     ?_297                                   ; 4E49 _ 0F 8E, FFFFFF43
        nop                                             ; 4E4F _ 90
        leave                                           ; 4E50 _ C9
        ret                                             ; 4E51 _ C3
; intHandlerForTimer End of function

getTimerController:; Function begin
        push    ebp                                     ; 4E52 _ 55
        mov     ebp, esp                                ; 4E53 _ 89. E5
        mov     eax, timerctl                           ; 4E55 _ B8, 000003C0(d)
        pop     ebp                                     ; 4E5A _ 5D
        ret                                             ; 4E5B _ C3
; getTimerController End of function

fifo8_init:; Function begin
        push    ebp                                     ; 4E5C _ 55
        mov     ebp, esp                                ; 4E5D _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 4E5F _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 4E62 _ 8B. 55, 0C
        mov     dword [eax+0CH], edx                    ; 4E65 _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 4E68 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 4E6B _ 8B. 55, 10
        mov     dword [eax], edx                        ; 4E6E _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 4E70 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 4E73 _ 8B. 55, 0C
        mov     dword [eax+10H], edx                    ; 4E76 _ 89. 50, 10
        mov     eax, dword [ebp+8H]                     ; 4E79 _ 8B. 45, 08
        mov     dword [eax+14H], 0                      ; 4E7C _ C7. 40, 14, 00000000
        mov     eax, dword [ebp+8H]                     ; 4E83 _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 4E86 _ C7. 40, 04, 00000000
        mov     eax, dword [ebp+8H]                     ; 4E8D _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 4E90 _ C7. 40, 08, 00000000
        mov     eax, dword [ebp+8H]                     ; 4E97 _ 8B. 45, 08
        mov     edx, dword [ebp+14H]                    ; 4E9A _ 8B. 55, 14
        mov     dword [eax+18H], edx                    ; 4E9D _ 89. 50, 18
        nop                                             ; 4EA0 _ 90
        pop     ebp                                     ; 4EA1 _ 5D
        ret                                             ; 4EA2 _ C3
; fifo8_init End of function

fifo8_put:; Function begin
        push    ebp                                     ; 4EA3 _ 55
        mov     ebp, esp                                ; 4EA4 _ 89. E5
        sub     esp, 24                                 ; 4EA6 _ 83. EC, 18
        mov     eax, dword [ebp+0CH]                    ; 4EA9 _ 8B. 45, 0C
        mov     byte [ebp-0CH], al                      ; 4EAC _ 88. 45, F4
        cmp     dword [ebp+8H], 0                       ; 4EAF _ 83. 7D, 08, 00
        jnz     ?_301                                   ; 4EB3 _ 75, 0A
        mov     eax, 4294967295                         ; 4EB5 _ B8, FFFFFFFF
        jmp     ?_305                                   ; 4EBA _ E9, 000000AB

?_301:  mov     eax, dword [ebp+8H]                     ; 4EBF _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 4EC2 _ 8B. 40, 10
        test    eax, eax                                ; 4EC5 _ 85. C0
        jnz     ?_302                                   ; 4EC7 _ 75, 1B
        mov     eax, dword [ebp+8H]                     ; 4EC9 _ 8B. 45, 08
        mov     eax, dword [eax+14H]                    ; 4ECC _ 8B. 40, 14
        or      eax, 01H                                ; 4ECF _ 83. C8, 01
        mov     edx, eax                                ; 4ED2 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 4ED4 _ 8B. 45, 08
        mov     dword [eax+14H], edx                    ; 4ED7 _ 89. 50, 14
        mov     eax, 4294967295                         ; 4EDA _ B8, FFFFFFFF
        jmp     ?_305                                   ; 4EDF _ E9, 00000086

?_302:  mov     eax, dword [ebp+8H]                     ; 4EE4 _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 4EE7 _ 8B. 10
        mov     eax, dword [ebp+8H]                     ; 4EE9 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 4EEC _ 8B. 40, 04
        add     edx, eax                                ; 4EEF _ 01. C2
        movzx   eax, byte [ebp-0CH]                     ; 4EF1 _ 0F B6. 45, F4
        mov     byte [edx], al                          ; 4EF5 _ 88. 02
        mov     eax, dword [ebp+8H]                     ; 4EF7 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 4EFA _ 8B. 40, 04
        lea     edx, [eax+1H]                           ; 4EFD _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 4F00 _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 4F03 _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 4F06 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 4F09 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 4F0C _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 4F0F _ 8B. 40, 0C
        cmp     edx, eax                                ; 4F12 _ 39. C2
        jnz     ?_303                                   ; 4F14 _ 75, 0A
        mov     eax, dword [ebp+8H]                     ; 4F16 _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 4F19 _ C7. 40, 04, 00000000
?_303:  mov     eax, dword [ebp+8H]                     ; 4F20 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 4F23 _ 8B. 40, 10
        lea     edx, [eax-1H]                           ; 4F26 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 4F29 _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 4F2C _ 89. 50, 10
        mov     eax, dword [ebp+8H]                     ; 4F2F _ 8B. 45, 08
        mov     eax, dword [eax+18H]                    ; 4F32 _ 8B. 40, 18
        test    eax, eax                                ; 4F35 _ 85. C0
        jz      ?_304                                   ; 4F37 _ 74, 2C
        mov     eax, dword [ebp+8H]                     ; 4F39 _ 8B. 45, 08
        mov     eax, dword [eax+18H]                    ; 4F3C _ 8B. 40, 18
        mov     eax, dword [eax+4H]                     ; 4F3F _ 8B. 40, 04
        cmp     eax, 2                                  ; 4F42 _ 83. F8, 02
        jz      ?_304                                   ; 4F45 _ 74, 1E
        mov     eax, dword [ebp+8H]                     ; 4F47 _ 8B. 45, 08
        mov     eax, dword [eax+18H]                    ; 4F4A _ 8B. 40, 18
        mov     dword [esp+8H], 0                       ; 4F4D _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], -1                      ; 4F55 _ C7. 44 24, 04, FFFFFFFF
        mov     dword [esp], eax                        ; 4F5D _ 89. 04 24
        call    task_run                                ; 4F60 _ E8, FFFFFFFC(rel)
?_304:  mov     eax, 0                                  ; 4F65 _ B8, 00000000
?_305:  leave                                           ; 4F6A _ C9
        ret                                             ; 4F6B _ C3
; fifo8_put End of function

fifo8_get:; Function begin
        push    ebp                                     ; 4F6C _ 55
        mov     ebp, esp                                ; 4F6D _ 89. E5
        sub     esp, 16                                 ; 4F6F _ 83. EC, 10
        mov     eax, dword [ebp+8H]                     ; 4F72 _ 8B. 45, 08
        mov     edx, dword [eax+10H]                    ; 4F75 _ 8B. 50, 10
        mov     eax, dword [ebp+8H]                     ; 4F78 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 4F7B _ 8B. 40, 0C
        cmp     edx, eax                                ; 4F7E _ 39. C2
        jnz     ?_306                                   ; 4F80 _ 75, 07
        mov     eax, 4294967295                         ; 4F82 _ B8, FFFFFFFF
        jmp     ?_308                                   ; 4F87 _ EB, 51

?_306:  mov     eax, dword [ebp+8H]                     ; 4F89 _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 4F8C _ 8B. 10
        mov     eax, dword [ebp+8H]                     ; 4F8E _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 4F91 _ 8B. 40, 08
        add     eax, edx                                ; 4F94 _ 01. D0
        movzx   eax, byte [eax]                         ; 4F96 _ 0F B6. 00
        movzx   eax, al                                 ; 4F99 _ 0F B6. C0
        mov     dword [ebp-4H], eax                     ; 4F9C _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 4F9F _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 4FA2 _ 8B. 40, 08
        lea     edx, [eax+1H]                           ; 4FA5 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 4FA8 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 4FAB _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 4FAE _ 8B. 45, 08
        mov     edx, dword [eax+8H]                     ; 4FB1 _ 8B. 50, 08
        mov     eax, dword [ebp+8H]                     ; 4FB4 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 4FB7 _ 8B. 40, 0C
        cmp     edx, eax                                ; 4FBA _ 39. C2
        jnz     ?_307                                   ; 4FBC _ 75, 0A
        mov     eax, dword [ebp+8H]                     ; 4FBE _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 4FC1 _ C7. 40, 08, 00000000
?_307:  mov     eax, dword [ebp+8H]                     ; 4FC8 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 4FCB _ 8B. 40, 10
        lea     edx, [eax+1H]                           ; 4FCE _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 4FD1 _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 4FD4 _ 89. 50, 10
        mov     eax, dword [ebp-4H]                     ; 4FD7 _ 8B. 45, FC
?_308:  leave                                           ; 4FDA _ C9
        ret                                             ; 4FDB _ C3
; fifo8_get End of function

fifo8_status:; Function begin
        push    ebp                                     ; 4FDC _ 55
        mov     ebp, esp                                ; 4FDD _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 4FDF _ 8B. 45, 08
        mov     edx, dword [eax+0CH]                    ; 4FE2 _ 8B. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 4FE5 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 4FE8 _ 8B. 40, 10
        sub     edx, eax                                ; 4FEB _ 29. C2
        mov     eax, edx                                ; 4FED _ 89. D0
        pop     ebp                                     ; 4FEF _ 5D
        ret                                             ; 4FF0 _ C3
; fifo8_status End of function

strcmp: ; Function begin
        push    ebp                                     ; 4FF1 _ 55
        mov     ebp, esp                                ; 4FF2 _ 89. E5
        sub     esp, 16                                 ; 4FF4 _ 83. EC, 10
        cmp     dword [ebp+8H], 0                       ; 4FF7 _ 83. 7D, 08, 00
        jz      ?_309                                   ; 4FFB _ 74, 06
        cmp     dword [ebp+0CH], 0                      ; 4FFD _ 83. 7D, 0C, 00
        jnz     ?_310                                   ; 5001 _ 75, 0A
?_309:  mov     eax, 0                                  ; 5003 _ B8, 00000000
        jmp     ?_317                                   ; 5008 _ E9, 0000009B

?_310:  mov     dword [ebp-4H], 0                       ; 500D _ C7. 45, FC, 00000000
        jmp     ?_313                                   ; 5014 _ EB, 25

?_311:  mov     edx, dword [ebp-4H]                     ; 5016 _ 8B. 55, FC
        mov     eax, dword [ebp+8H]                     ; 5019 _ 8B. 45, 08
        add     eax, edx                                ; 501C _ 01. D0
        movzx   edx, byte [eax]                         ; 501E _ 0F B6. 10
        mov     ecx, dword [ebp-4H]                     ; 5021 _ 8B. 4D, FC
        mov     eax, dword [ebp+0CH]                    ; 5024 _ 8B. 45, 0C
        add     eax, ecx                                ; 5027 _ 01. C8
        movzx   eax, byte [eax]                         ; 5029 _ 0F B6. 00
        cmp     dl, al                                  ; 502C _ 38. C2
        jz      ?_312                                   ; 502E _ 74, 07
        mov     eax, 0                                  ; 5030 _ B8, 00000000
        jmp     ?_317                                   ; 5035 _ EB, 71

?_312:  add     dword [ebp-4H], 1                       ; 5037 _ 83. 45, FC, 01
?_313:  mov     edx, dword [ebp-4H]                     ; 503B _ 8B. 55, FC
        mov     eax, dword [ebp+8H]                     ; 503E _ 8B. 45, 08
        add     eax, edx                                ; 5041 _ 01. D0
        movzx   eax, byte [eax]                         ; 5043 _ 0F B6. 00
        test    al, al                                  ; 5046 _ 84. C0
        jz      ?_314                                   ; 5048 _ 74, 0F
        mov     edx, dword [ebp-4H]                     ; 504A _ 8B. 55, FC
        mov     eax, dword [ebp+0CH]                    ; 504D _ 8B. 45, 0C
        add     eax, edx                                ; 5050 _ 01. D0
        movzx   eax, byte [eax]                         ; 5052 _ 0F B6. 00
        test    al, al                                  ; 5055 _ 84. C0
        jnz     ?_311                                   ; 5057 _ 75, BD
?_314:  mov     edx, dword [ebp-4H]                     ; 5059 _ 8B. 55, FC
        mov     eax, dword [ebp+8H]                     ; 505C _ 8B. 45, 08
        add     eax, edx                                ; 505F _ 01. D0
        movzx   eax, byte [eax]                         ; 5061 _ 0F B6. 00
        test    al, al                                  ; 5064 _ 84. C0
        jnz     ?_315                                   ; 5066 _ 75, 16
        mov     edx, dword [ebp-4H]                     ; 5068 _ 8B. 55, FC
        mov     eax, dword [ebp+0CH]                    ; 506B _ 8B. 45, 0C
        add     eax, edx                                ; 506E _ 01. D0
        movzx   eax, byte [eax]                         ; 5070 _ 0F B6. 00
        test    al, al                                  ; 5073 _ 84. C0
        jz      ?_315                                   ; 5075 _ 74, 07
        mov     eax, 0                                  ; 5077 _ B8, 00000000
        jmp     ?_317                                   ; 507C _ EB, 2A

?_315:  mov     edx, dword [ebp-4H]                     ; 507E _ 8B. 55, FC
        mov     eax, dword [ebp+8H]                     ; 5081 _ 8B. 45, 08
        add     eax, edx                                ; 5084 _ 01. D0
        movzx   eax, byte [eax]                         ; 5086 _ 0F B6. 00
        test    al, al                                  ; 5089 _ 84. C0
        jz      ?_316                                   ; 508B _ 74, 16
        mov     edx, dword [ebp-4H]                     ; 508D _ 8B. 55, FC
        mov     eax, dword [ebp+0CH]                    ; 5090 _ 8B. 45, 0C
        add     eax, edx                                ; 5093 _ 01. D0
        movzx   eax, byte [eax]                         ; 5095 _ 0F B6. 00
        test    al, al                                  ; 5098 _ 84. C0
        jz      ?_316                                   ; 509A _ 74, 07
        mov     eax, 0                                  ; 509C _ B8, 00000000
        jmp     ?_317                                   ; 50A1 _ EB, 05

?_316:  mov     eax, 1                                  ; 50A3 _ B8, 00000001
?_317:  leave                                           ; 50A8 _ C9
        ret                                             ; 50A9 _ C3
; strcmp End of function

set_segmdesc:; Function begin
        push    ebp                                     ; 50AA _ 55
        mov     ebp, esp                                ; 50AB _ 89. E5
        cmp     dword [ebp+0CH], 1048575                ; 50AD _ 81. 7D, 0C, 000FFFFF
        jbe     ?_318                                   ; 50B4 _ 76, 10
        or      dword [ebp+14H], 8000H                  ; 50B6 _ 81. 4D, 14, 00008000
        mov     eax, dword [ebp+0CH]                    ; 50BD _ 8B. 45, 0C
        shr     eax, 12                                 ; 50C0 _ C1. E8, 0C
        mov     dword [ebp+0CH], eax                    ; 50C3 _ 89. 45, 0C
?_318:  mov     eax, dword [ebp+0CH]                    ; 50C6 _ 8B. 45, 0C
        mov     edx, eax                                ; 50C9 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 50CB _ 8B. 45, 08
        mov     word [eax], dx                          ; 50CE _ 66: 89. 10
        mov     eax, dword [ebp+10H]                    ; 50D1 _ 8B. 45, 10
        mov     edx, eax                                ; 50D4 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 50D6 _ 8B. 45, 08
        mov     word [eax+2H], dx                       ; 50D9 _ 66: 89. 50, 02
        mov     eax, dword [ebp+10H]                    ; 50DD _ 8B. 45, 10
        sar     eax, 16                                 ; 50E0 _ C1. F8, 10
        mov     edx, eax                                ; 50E3 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 50E5 _ 8B. 45, 08
        mov     byte [eax+4H], dl                       ; 50E8 _ 88. 50, 04
        mov     eax, dword [ebp+14H]                    ; 50EB _ 8B. 45, 14
        mov     edx, eax                                ; 50EE _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 50F0 _ 8B. 45, 08
        mov     byte [eax+5H], dl                       ; 50F3 _ 88. 50, 05
        mov     eax, dword [ebp+0CH]                    ; 50F6 _ 8B. 45, 0C
        shr     eax, 16                                 ; 50F9 _ C1. E8, 10
        and     eax, 0FH                                ; 50FC _ 83. E0, 0F
        mov     edx, eax                                ; 50FF _ 89. C2
        mov     eax, dword [ebp+14H]                    ; 5101 _ 8B. 45, 14
        sar     eax, 8                                  ; 5104 _ C1. F8, 08
        and     eax, 0FFFFFFF0H                         ; 5107 _ 83. E0, F0
        or      eax, edx                                ; 510A _ 09. D0
        mov     edx, eax                                ; 510C _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 510E _ 8B. 45, 08
        mov     byte [eax+6H], dl                       ; 5111 _ 88. 50, 06
        mov     eax, dword [ebp+10H]                    ; 5114 _ 8B. 45, 10
        shr     eax, 24                                 ; 5117 _ C1. E8, 18
        mov     edx, eax                                ; 511A _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 511C _ 8B. 45, 08
        mov     byte [eax+7H], dl                       ; 511F _ 88. 50, 07
        nop                                             ; 5122 _ 90
        pop     ebp                                     ; 5123 _ 5D
        ret                                             ; 5124 _ C3
; set_segmdesc End of function

get_taskctl:; Function begin
        push    ebp                                     ; 5125 _ 55
        mov     ebp, esp                                ; 5126 _ 89. E5
        mov     eax, dword [taskctl]                    ; 5128 _ A1, 00002308(d)
        pop     ebp                                     ; 512D _ 5D
        ret                                             ; 512E _ C3
; get_taskctl End of function

init_task_level:; Function begin
        push    ebp                                     ; 512F _ 55
        mov     ebp, esp                                ; 5130 _ 89. E5
        sub     esp, 16                                 ; 5132 _ 83. EC, 10
        mov     ecx, dword [taskctl]                    ; 5135 _ 8B. 0D, 00002308(d)
        mov     edx, dword [ebp+8H]                     ; 513B _ 8B. 55, 08
        mov     eax, edx                                ; 513E _ 89. D0
        shl     eax, 2                                  ; 5140 _ C1. E0, 02
        add     eax, edx                                ; 5143 _ 01. D0
        shl     eax, 2                                  ; 5145 _ C1. E0, 02
        add     eax, ecx                                ; 5148 _ 01. C8
        add     eax, 8                                  ; 514A _ 83. C0, 08
        mov     dword [eax], 0                          ; 514D _ C7. 00, 00000000
        mov     ecx, dword [taskctl]                    ; 5153 _ 8B. 0D, 00002308(d)
        mov     edx, dword [ebp+8H]                     ; 5159 _ 8B. 55, 08
        mov     eax, edx                                ; 515C _ 89. D0
        shl     eax, 2                                  ; 515E _ C1. E0, 02
        add     eax, edx                                ; 5161 _ 01. D0
        shl     eax, 2                                  ; 5163 _ C1. E0, 02
        add     eax, ecx                                ; 5166 _ 01. C8
        add     eax, 12                                 ; 5168 _ 83. C0, 0C
        mov     dword [eax], 0                          ; 516B _ C7. 00, 00000000
        mov     dword [ebp-4H], 0                       ; 5171 _ C7. 45, FC, 00000000
        jmp     ?_320                                   ; 5178 _ EB, 21

?_319:  mov     ecx, dword [taskctl]                    ; 517A _ 8B. 0D, 00002308(d)
        mov     edx, dword [ebp-4H]                     ; 5180 _ 8B. 55, FC
        mov     eax, edx                                ; 5183 _ 89. D0
        add     eax, eax                                ; 5185 _ 01. C0
        add     eax, edx                                ; 5187 _ 01. D0
        shl     eax, 3                                  ; 5189 _ C1. E0, 03
        add     eax, ecx                                ; 518C _ 01. C8
        add     eax, 16                                 ; 518E _ 83. C0, 10
        mov     dword [eax], 0                          ; 5191 _ C7. 00, 00000000
        add     dword [ebp-4H], 1                       ; 5197 _ 83. 45, FC, 01
?_320:  cmp     dword [ebp-4H], 2                       ; 519B _ 83. 7D, FC, 02
        jle     ?_319                                   ; 519F _ 7E, D9
        leave                                           ; 51A1 _ C9
        ret                                             ; 51A2 _ C3
; init_task_level End of function

task_init:; Function begin
        push    ebp                                     ; 51A3 _ 55
        mov     ebp, esp                                ; 51A4 _ 89. E5
        sub     esp, 40                                 ; 51A6 _ 83. EC, 28
        call    get_addr_gdt                            ; 51A9 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 51AE _ 89. 45, F0
        mov     dword [esp+4H], 808                     ; 51B1 _ C7. 44 24, 04, 00000328
        mov     eax, dword [ebp+8H]                     ; 51B9 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 51BC _ 89. 04 24
        call    memman_alloc_4k                         ; 51BF _ E8, FFFFFFFC(rel)
        mov     dword [taskctl], eax                    ; 51C4 _ A3, 00002308(d)
        mov     dword [ebp-14H], 0                      ; 51C9 _ C7. 45, EC, 00000000
        jmp     ?_322                                   ; 51D0 _ E9, 00000085

?_321:  mov     edx, dword [taskctl]                    ; 51D5 _ 8B. 15, 00002308(d)
        mov     eax, dword [ebp-14H]                    ; 51DB _ 8B. 45, EC
        imul    eax, eax, 148                           ; 51DE _ 69. C0, 00000094
        add     eax, edx                                ; 51E4 _ 01. D0
        add     eax, 72                                 ; 51E6 _ 83. C0, 48
        mov     dword [eax], 0                          ; 51E9 _ C7. 00, 00000000
        mov     ecx, dword [taskctl]                    ; 51EF _ 8B. 0D, 00002308(d)
        mov     eax, dword [ebp-14H]                    ; 51F5 _ 8B. 45, EC
        add     eax, 7                                  ; 51F8 _ 83. C0, 07
        lea     edx, [eax*8]                            ; 51FB _ 8D. 14 C5, 00000000
        mov     eax, dword [ebp-14H]                    ; 5202 _ 8B. 45, EC
        imul    eax, eax, 148                           ; 5205 _ 69. C0, 00000094
        add     eax, ecx                                ; 520B _ 01. C8
        add     eax, 68                                 ; 520D _ 83. C0, 44
        mov     dword [eax], edx                        ; 5210 _ 89. 10
        mov     eax, dword [taskctl]                    ; 5212 _ A1, 00002308(d)
        mov     edx, dword [ebp-14H]                    ; 5217 _ 8B. 55, EC
        imul    edx, edx, 148                           ; 521A _ 69. D2, 00000094
        add     edx, 96                                 ; 5220 _ 83. C2, 60
        add     eax, edx                                ; 5223 _ 01. D0
        add     eax, 16                                 ; 5225 _ 83. C0, 10
        mov     edx, dword [ebp-14H]                    ; 5228 _ 8B. 55, EC
        add     edx, 7                                  ; 522B _ 83. C2, 07
        lea     ecx, [edx*8]                            ; 522E _ 8D. 0C D5, 00000000
        mov     edx, dword [ebp-10H]                    ; 5235 _ 8B. 55, F0
        add     edx, ecx                                ; 5238 _ 01. CA
        mov     dword [esp+0CH], 137                    ; 523A _ C7. 44 24, 0C, 00000089
        mov     dword [esp+8H], eax                     ; 5242 _ 89. 44 24, 08
        mov     dword [esp+4H], 103                     ; 5246 _ C7. 44 24, 04, 00000067
        mov     dword [esp], edx                        ; 524E _ 89. 14 24
        call    set_segmdesc                            ; 5251 _ E8, FFFFFFFC(rel)
        add     dword [ebp-14H], 1                      ; 5256 _ 83. 45, EC, 01
?_322:  cmp     dword [ebp-14H], 4                      ; 525A _ 83. 7D, EC, 04
        jle     ?_321                                   ; 525E _ 0F 8E, FFFFFF71
        mov     dword [ebp-14H], 0                      ; 5264 _ C7. 45, EC, 00000000
        jmp     ?_324                                   ; 526B _ EB, 0F

?_323:  mov     eax, dword [ebp-14H]                    ; 526D _ 8B. 45, EC
        mov     dword [esp], eax                        ; 5270 _ 89. 04 24
        call    init_task_level                         ; 5273 _ E8, FFFFFFFC(rel)
        add     dword [ebp-14H], 1                      ; 5278 _ 83. 45, EC, 01
?_324:  cmp     dword [ebp-14H], 2                      ; 527C _ 83. 7D, EC, 02
        jle     ?_323                                   ; 5280 _ 7E, EB
        call    task_alloc                              ; 5282 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 5287 _ 89. 45, F4
        mov     eax, dword [ebp-0CH]                    ; 528A _ 8B. 45, F4
        mov     dword [eax+4H], 2                       ; 528D _ C7. 40, 04, 00000002
        mov     eax, dword [ebp-0CH]                    ; 5294 _ 8B. 45, F4
        mov     dword [eax+8H], 100                     ; 5297 _ C7. 40, 08, 00000064
        mov     eax, dword [ebp-0CH]                    ; 529E _ 8B. 45, F4
        mov     dword [eax+0CH], 0                      ; 52A1 _ C7. 40, 0C, 00000000
        mov     eax, dword [ebp-0CH]                    ; 52A8 _ 8B. 45, F4
        mov     dword [esp], eax                        ; 52AB _ 89. 04 24
        call    task_add                                ; 52AE _ E8, FFFFFFFC(rel)
        call    task_switchsub                          ; 52B3 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 52B8 _ 8B. 45, F4
        mov     eax, dword [eax]                        ; 52BB _ 8B. 00
        mov     dword [esp], eax                        ; 52BD _ 89. 04 24
        call    load_tr                                 ; 52C0 _ E8, FFFFFFFC(rel)
        call    timer_alloc                             ; 52C5 _ E8, FFFFFFFC(rel)
        mov     dword [task_timer], eax                 ; 52CA _ A3, 00002304(d)
        mov     eax, dword [ebp-0CH]                    ; 52CF _ 8B. 45, F4
        mov     eax, dword [eax+8H]                     ; 52D2 _ 8B. 40, 08
        mov     edx, eax                                ; 52D5 _ 89. C2
        mov     eax, dword [task_timer]                 ; 52D7 _ A1, 00002304(d)
        mov     dword [esp+4H], edx                     ; 52DC _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 52E0 _ 89. 04 24
        call    timer_settime                           ; 52E3 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 52E8 _ 8B. 45, F4
        leave                                           ; 52EB _ C9
        ret                                             ; 52EC _ C3
; task_init End of function

task_alloc:; Function begin
        push    ebp                                     ; 52ED _ 55
        mov     ebp, esp                                ; 52EE _ 89. E5
        sub     esp, 16                                 ; 52F0 _ 83. EC, 10
        mov     dword [ebp-8H], 0                       ; 52F3 _ C7. 45, F8, 00000000
        jmp     ?_327                                   ; 52FA _ E9, 00000100

?_325:  mov     edx, dword [taskctl]                    ; 52FF _ 8B. 15, 00002308(d)
        mov     eax, dword [ebp-8H]                     ; 5305 _ 8B. 45, F8
        imul    eax, eax, 148                           ; 5308 _ 69. C0, 00000094
        add     eax, edx                                ; 530E _ 01. D0
        add     eax, 72                                 ; 5310 _ 83. C0, 48
        mov     eax, dword [eax]                        ; 5313 _ 8B. 00
        test    eax, eax                                ; 5315 _ 85. C0
        jne     ?_326                                   ; 5317 _ 0F 85, 000000DE
        mov     eax, dword [taskctl]                    ; 531D _ A1, 00002308(d)
        mov     edx, dword [ebp-8H]                     ; 5322 _ 8B. 55, F8
        imul    edx, edx, 148                           ; 5325 _ 69. D2, 00000094
        add     edx, 64                                 ; 532B _ 83. C2, 40
        add     eax, edx                                ; 532E _ 01. D0
        add     eax, 4                                  ; 5330 _ 83. C0, 04
        mov     dword [ebp-4H], eax                     ; 5333 _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 5336 _ 8B. 45, FC
        mov     dword [eax+4H], 1                       ; 5339 _ C7. 40, 04, 00000001
        mov     eax, dword [ebp-4H]                     ; 5340 _ 8B. 45, FC
        mov     dword [eax+50H], 514                    ; 5343 _ C7. 40, 50, 00000202
        mov     eax, dword [ebp-4H]                     ; 534A _ 8B. 45, FC
        mov     dword [eax+54H], 0                      ; 534D _ C7. 40, 54, 00000000
        mov     eax, dword [ebp-4H]                     ; 5354 _ 8B. 45, FC
        mov     dword [eax+58H], 0                      ; 5357 _ C7. 40, 58, 00000000
        mov     eax, dword [ebp-4H]                     ; 535E _ 8B. 45, FC
        mov     dword [eax+5CH], 0                      ; 5361 _ C7. 40, 5C, 00000000
        mov     eax, dword [ebp-4H]                     ; 5368 _ 8B. 45, FC
        mov     dword [eax+60H], 0                      ; 536B _ C7. 40, 60, 00000000
        mov     eax, dword [ebp-4H]                     ; 5372 _ 8B. 45, FC
        mov     dword [eax+68H], 0                      ; 5375 _ C7. 40, 68, 00000000
        mov     eax, dword [ebp-8H]                     ; 537C _ 8B. 45, F8
        add     eax, 1                                  ; 537F _ 83. C0, 01
        shl     eax, 9                                  ; 5382 _ C1. E0, 09
        mov     edx, eax                                ; 5385 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 5387 _ 8B. 45, FC
        mov     dword [eax+64H], edx                    ; 538A _ 89. 50, 64
        mov     eax, dword [ebp-4H]                     ; 538D _ 8B. 45, FC
        mov     dword [eax+6CH], 0                      ; 5390 _ C7. 40, 6C, 00000000
        mov     eax, dword [ebp-4H]                     ; 5397 _ 8B. 45, FC
        mov     dword [eax+70H], 0                      ; 539A _ C7. 40, 70, 00000000
        mov     eax, dword [ebp-4H]                     ; 53A1 _ 8B. 45, FC
        mov     dword [eax+74H], 0                      ; 53A4 _ C7. 40, 74, 00000000
        mov     eax, dword [ebp-4H]                     ; 53AB _ 8B. 45, FC
        mov     dword [eax+80H], 0                      ; 53AE _ C7. 80, 00000080, 00000000
        mov     eax, dword [ebp-4H]                     ; 53B8 _ 8B. 45, FC
        mov     dword [eax+84H], 0                      ; 53BB _ C7. 80, 00000084, 00000000
        mov     eax, dword [ebp-4H]                     ; 53C5 _ 8B. 45, FC
        mov     dword [eax+88H], 0                      ; 53C8 _ C7. 80, 00000088, 00000000
        mov     eax, dword [ebp-4H]                     ; 53D2 _ 8B. 45, FC
        mov     dword [eax+34H], 0                      ; 53D5 _ C7. 40, 34, 00000000
        mov     eax, dword [ebp-4H]                     ; 53DC _ 8B. 45, FC
        mov     dword [eax+8CH], 0                      ; 53DF _ C7. 80, 0000008C, 00000000
        mov     eax, dword [ebp-4H]                     ; 53E9 _ 8B. 45, FC
        mov     dword [eax+90H], 1073741824             ; 53EC _ C7. 80, 00000090, 40000000
        mov     eax, dword [ebp-4H]                     ; 53F6 _ 8B. 45, FC
        jmp     ?_328                                   ; 53F9 _ EB, 13

?_326:  add     dword [ebp-8H], 1                       ; 53FB _ 83. 45, F8, 01
?_327:  cmp     dword [ebp-8H], 4                       ; 53FF _ 83. 7D, F8, 04
        jle     ?_325                                   ; 5403 _ 0F 8E, FFFFFEF6
        mov     eax, 0                                  ; 5409 _ B8, 00000000
?_328:  leave                                           ; 540E _ C9
        ret                                             ; 540F _ C3
; task_alloc End of function

task_run:; Function begin
        push    ebp                                     ; 5410 _ 55
        mov     ebp, esp                                ; 5411 _ 89. E5
        sub     esp, 24                                 ; 5413 _ 83. EC, 18
        cmp     dword [ebp+0CH], 0                      ; 5416 _ 83. 7D, 0C, 00
        jns     ?_329                                   ; 541A _ 79, 09
        mov     eax, dword [ebp+8H]                     ; 541C _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 541F _ 8B. 40, 0C
        mov     dword [ebp+0CH], eax                    ; 5422 _ 89. 45, 0C
?_329:  cmp     dword [ebp+10H], 0                      ; 5425 _ 83. 7D, 10, 00
        jle     ?_330                                   ; 5429 _ 7E, 09
        mov     eax, dword [ebp+8H]                     ; 542B _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 542E _ 8B. 55, 10
        mov     dword [eax+8H], edx                     ; 5431 _ 89. 50, 08
?_330:  mov     eax, dword [ebp+8H]                     ; 5434 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 5437 _ 8B. 40, 04
        cmp     eax, 2                                  ; 543A _ 83. F8, 02
        jnz     ?_331                                   ; 543D _ 75, 16
        mov     eax, dword [ebp+8H]                     ; 543F _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 5442 _ 8B. 40, 0C
        cmp     eax, dword [ebp+0CH]                    ; 5445 _ 3B. 45, 0C
        jz      ?_331                                   ; 5448 _ 74, 0B
        mov     eax, dword [ebp+8H]                     ; 544A _ 8B. 45, 08
        mov     dword [esp], eax                        ; 544D _ 89. 04 24
        call    task_remove                             ; 5450 _ E8, FFFFFFFC(rel)
?_331:  mov     eax, dword [ebp+8H]                     ; 5455 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 5458 _ 8B. 40, 04
        cmp     eax, 2                                  ; 545B _ 83. F8, 02
        jz      ?_332                                   ; 545E _ 74, 14
        mov     eax, dword [ebp+8H]                     ; 5460 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 5463 _ 8B. 55, 0C
        mov     dword [eax+0CH], edx                    ; 5466 _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 5469 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 546C _ 89. 04 24
        call    task_add                                ; 546F _ E8, FFFFFFFC(rel)
?_332:  mov     eax, dword [taskctl]                    ; 5474 _ A1, 00002308(d)
        mov     dword [eax+4H], 1                       ; 5479 _ C7. 40, 04, 00000001
        nop                                             ; 5480 _ 90
        leave                                           ; 5481 _ C9
        ret                                             ; 5482 _ C3
; task_run End of function

task_switch:; Function begin
        push    ebp                                     ; 5483 _ 55
        mov     ebp, esp                                ; 5484 _ 89. E5
        sub     esp, 40                                 ; 5486 _ 83. EC, 28
        mov     ecx, dword [taskctl]                    ; 5489 _ 8B. 0D, 00002308(d)
        mov     eax, dword [taskctl]                    ; 548F _ A1, 00002308(d)
        mov     edx, dword [eax]                        ; 5494 _ 8B. 10
        mov     eax, edx                                ; 5496 _ 89. D0
        shl     eax, 2                                  ; 5498 _ C1. E0, 02
        add     eax, edx                                ; 549B _ 01. D0
        shl     eax, 2                                  ; 549D _ C1. E0, 02
        add     eax, ecx                                ; 54A0 _ 01. C8
        add     eax, 8                                  ; 54A2 _ 83. C0, 08
        mov     dword [ebp-14H], eax                    ; 54A5 _ 89. 45, EC
        mov     eax, dword [ebp-14H]                    ; 54A8 _ 8B. 45, EC
        mov     edx, dword [eax+4H]                     ; 54AB _ 8B. 50, 04
        mov     eax, dword [ebp-14H]                    ; 54AE _ 8B. 45, EC
        mov     eax, dword [eax+edx*4+8H]               ; 54B1 _ 8B. 44 90, 08
        mov     dword [ebp-10H], eax                    ; 54B5 _ 89. 45, F0
        mov     eax, dword [ebp-14H]                    ; 54B8 _ 8B. 45, EC
        mov     eax, dword [eax+4H]                     ; 54BB _ 8B. 40, 04
        lea     edx, [eax+1H]                           ; 54BE _ 8D. 50, 01
        mov     eax, dword [ebp-14H]                    ; 54C1 _ 8B. 45, EC
        mov     dword [eax+4H], edx                     ; 54C4 _ 89. 50, 04
        mov     eax, dword [ebp-14H]                    ; 54C7 _ 8B. 45, EC
        mov     edx, dword [eax+4H]                     ; 54CA _ 8B. 50, 04
        mov     eax, dword [ebp-14H]                    ; 54CD _ 8B. 45, EC
        mov     eax, dword [eax]                        ; 54D0 _ 8B. 00
        cmp     edx, eax                                ; 54D2 _ 39. C2
        jnz     ?_333                                   ; 54D4 _ 75, 0A
        mov     eax, dword [ebp-14H]                    ; 54D6 _ 8B. 45, EC
        mov     dword [eax+4H], 0                       ; 54D9 _ C7. 40, 04, 00000000
?_333:  mov     eax, dword [taskctl]                    ; 54E0 _ A1, 00002308(d)
        mov     eax, dword [eax+4H]                     ; 54E5 _ 8B. 40, 04
        test    eax, eax                                ; 54E8 _ 85. C0
        jz      ?_334                                   ; 54EA _ 74, 24
        call    task_switchsub                          ; 54EC _ E8, FFFFFFFC(rel)
        mov     ecx, dword [taskctl]                    ; 54F1 _ 8B. 0D, 00002308(d)
        mov     eax, dword [taskctl]                    ; 54F7 _ A1, 00002308(d)
        mov     edx, dword [eax]                        ; 54FC _ 8B. 10
        mov     eax, edx                                ; 54FE _ 89. D0
        shl     eax, 2                                  ; 5500 _ C1. E0, 02
        add     eax, edx                                ; 5503 _ 01. D0
        shl     eax, 2                                  ; 5505 _ C1. E0, 02
        add     eax, ecx                                ; 5508 _ 01. C8
        add     eax, 8                                  ; 550A _ 83. C0, 08
        mov     dword [ebp-14H], eax                    ; 550D _ 89. 45, EC
?_334:  mov     eax, dword [ebp-14H]                    ; 5510 _ 8B. 45, EC
        mov     edx, dword [eax+4H]                     ; 5513 _ 8B. 50, 04
        mov     eax, dword [ebp-14H]                    ; 5516 _ 8B. 45, EC
        mov     eax, dword [eax+edx*4+8H]               ; 5519 _ 8B. 44 90, 08
        mov     dword [ebp-0CH], eax                    ; 551D _ 89. 45, F4
        mov     eax, dword [ebp-0CH]                    ; 5520 _ 8B. 45, F4
        mov     eax, dword [eax+8H]                     ; 5523 _ 8B. 40, 08
        mov     edx, eax                                ; 5526 _ 89. C2
        mov     eax, dword [task_timer]                 ; 5528 _ A1, 00002304(d)
        mov     dword [esp+4H], edx                     ; 552D _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 5531 _ 89. 04 24
        call    timer_settime                           ; 5534 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 5539 _ 8B. 45, F4
        cmp     eax, dword [ebp-10H]                    ; 553C _ 3B. 45, F0
        jz      ?_335                                   ; 553F _ 74, 1B
        cmp     dword [ebp-0CH], 0                      ; 5541 _ 83. 7D, F4, 00
        jz      ?_335                                   ; 5545 _ 74, 15
        mov     eax, dword [ebp-0CH]                    ; 5547 _ 8B. 45, F4
        mov     eax, dword [eax]                        ; 554A _ 8B. 00
        mov     dword [esp+4H], eax                     ; 554C _ 89. 44 24, 04
        mov     dword [esp], 0                          ; 5550 _ C7. 04 24, 00000000
        call    farjmp                                  ; 5557 _ E8, FFFFFFFC(rel)
?_335:  nop                                             ; 555C _ 90
        leave                                           ; 555D _ C9
        ret                                             ; 555E _ C3
; task_switch End of function

task_sleep:; Function begin
        push    ebp                                     ; 555F _ 55
        mov     ebp, esp                                ; 5560 _ 89. E5
        sub     esp, 40                                 ; 5562 _ 83. EC, 28
        mov     dword [ebp-0CH], 0                      ; 5565 _ C7. 45, F4, 00000000
        mov     dword [ebp-10H], 0                      ; 556C _ C7. 45, F0, 00000000
        mov     eax, dword [ebp+8H]                     ; 5573 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 5576 _ 8B. 40, 04
        cmp     eax, 2                                  ; 5579 _ 83. F8, 02
        jnz     ?_336                                   ; 557C _ 75, 51
        call    task_now                                ; 557E _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 5583 _ 89. 45, F4
        mov     eax, dword [ebp+8H]                     ; 5586 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 5589 _ 89. 04 24
        call    task_remove                             ; 558C _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], 1                      ; 5591 _ C7. 45, F0, 00000001
        mov     eax, dword [ebp+8H]                     ; 5598 _ 8B. 45, 08
        cmp     eax, dword [ebp-0CH]                    ; 559B _ 3B. 45, F4
        jnz     ?_336                                   ; 559E _ 75, 2F
        call    task_switchsub                          ; 55A0 _ E8, FFFFFFFC(rel)
        call    task_now                                ; 55A5 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 55AA _ 89. 45, F4
        mov     dword [ebp-10H], 2                      ; 55AD _ C7. 45, F0, 00000002
        cmp     dword [ebp-0CH], 0                      ; 55B4 _ 83. 7D, F4, 00
        jz      ?_336                                   ; 55B8 _ 74, 15
        mov     eax, dword [ebp-0CH]                    ; 55BA _ 8B. 45, F4
        mov     eax, dword [eax]                        ; 55BD _ 8B. 00
        mov     dword [esp+4H], eax                     ; 55BF _ 89. 44 24, 04
        mov     dword [esp], 0                          ; 55C3 _ C7. 04 24, 00000000
        call    farjmp                                  ; 55CA _ E8, FFFFFFFC(rel)
?_336:  mov     eax, dword [ebp-10H]                    ; 55CF _ 8B. 45, F0
        leave                                           ; 55D2 _ C9
        ret                                             ; 55D3 _ C3
; task_sleep End of function

task_now:; Function begin
        push    ebp                                     ; 55D4 _ 55
        mov     ebp, esp                                ; 55D5 _ 89. E5
        sub     esp, 16                                 ; 55D7 _ 83. EC, 10
        mov     ecx, dword [taskctl]                    ; 55DA _ 8B. 0D, 00002308(d)
        mov     eax, dword [taskctl]                    ; 55E0 _ A1, 00002308(d)
        mov     edx, dword [eax]                        ; 55E5 _ 8B. 10
        mov     eax, edx                                ; 55E7 _ 89. D0
        shl     eax, 2                                  ; 55E9 _ C1. E0, 02
        add     eax, edx                                ; 55EC _ 01. D0
        shl     eax, 2                                  ; 55EE _ C1. E0, 02
        add     eax, ecx                                ; 55F1 _ 01. C8
        add     eax, 8                                  ; 55F3 _ 83. C0, 08
        mov     dword [ebp-4H], eax                     ; 55F6 _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 55F9 _ 8B. 45, FC
        mov     edx, dword [eax+4H]                     ; 55FC _ 8B. 50, 04
        mov     eax, dword [ebp-4H]                     ; 55FF _ 8B. 45, FC
        mov     eax, dword [eax+edx*4+8H]               ; 5602 _ 8B. 44 90, 08
        leave                                           ; 5606 _ C9
        ret                                             ; 5607 _ C3
; task_now End of function

task_add:; Function begin
        push    ebp                                     ; 5608 _ 55
        mov     ebp, esp                                ; 5609 _ 89. E5
        sub     esp, 16                                 ; 560B _ 83. EC, 10
        mov     ecx, dword [taskctl]                    ; 560E _ 8B. 0D, 00002308(d)
        mov     eax, dword [ebp+8H]                     ; 5614 _ 8B. 45, 08
        mov     edx, dword [eax+0CH]                    ; 5617 _ 8B. 50, 0C
        mov     eax, edx                                ; 561A _ 89. D0
        shl     eax, 2                                  ; 561C _ C1. E0, 02
        add     eax, edx                                ; 561F _ 01. D0
        shl     eax, 2                                  ; 5621 _ C1. E0, 02
        add     eax, ecx                                ; 5624 _ 01. C8
        add     eax, 8                                  ; 5626 _ 83. C0, 08
        mov     dword [ebp-4H], eax                     ; 5629 _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 562C _ 8B. 45, FC
        mov     edx, dword [eax]                        ; 562F _ 8B. 10
        mov     eax, dword [ebp-4H]                     ; 5631 _ 8B. 45, FC
        mov     ecx, dword [ebp+8H]                     ; 5634 _ 8B. 4D, 08
        mov     dword [eax+edx*4+8H], ecx               ; 5637 _ 89. 4C 90, 08
        mov     eax, dword [ebp-4H]                     ; 563B _ 8B. 45, FC
        mov     eax, dword [eax]                        ; 563E _ 8B. 00
        lea     edx, [eax+1H]                           ; 5640 _ 8D. 50, 01
        mov     eax, dword [ebp-4H]                     ; 5643 _ 8B. 45, FC
        mov     dword [eax], edx                        ; 5646 _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 5648 _ 8B. 45, 08
        mov     dword [eax+4H], 2                       ; 564B _ C7. 40, 04, 00000002
        nop                                             ; 5652 _ 90
        leave                                           ; 5653 _ C9
        ret                                             ; 5654 _ C3
; task_add End of function

task_remove:; Function begin
        push    ebp                                     ; 5655 _ 55
        mov     ebp, esp                                ; 5656 _ 89. E5
        sub     esp, 16                                 ; 5658 _ 83. EC, 10
        mov     ecx, dword [taskctl]                    ; 565B _ 8B. 0D, 00002308(d)
        mov     eax, dword [ebp+8H]                     ; 5661 _ 8B. 45, 08
        mov     edx, dword [eax+0CH]                    ; 5664 _ 8B. 50, 0C
        mov     eax, edx                                ; 5667 _ 89. D0
        shl     eax, 2                                  ; 5669 _ C1. E0, 02
        add     eax, edx                                ; 566C _ 01. D0
        shl     eax, 2                                  ; 566E _ C1. E0, 02
        add     eax, ecx                                ; 5671 _ 01. C8
        add     eax, 8                                  ; 5673 _ 83. C0, 08
        mov     dword [ebp-4H], eax                     ; 5676 _ 89. 45, FC
        mov     dword [ebp-8H], 0                       ; 5679 _ C7. 45, F8, 00000000
        jmp     ?_339                                   ; 5680 _ EB, 23

?_337:  mov     eax, dword [ebp-4H]                     ; 5682 _ 8B. 45, FC
        mov     edx, dword [ebp-8H]                     ; 5685 _ 8B. 55, F8
        mov     eax, dword [eax+edx*4+8H]               ; 5688 _ 8B. 44 90, 08
        cmp     eax, dword [ebp+8H]                     ; 568C _ 3B. 45, 08
        jnz     ?_338                                   ; 568F _ 75, 10
        mov     eax, dword [ebp-4H]                     ; 5691 _ 8B. 45, FC
        mov     edx, dword [ebp-8H]                     ; 5694 _ 8B. 55, F8
        mov     dword [eax+edx*4+8H], 0                 ; 5697 _ C7. 44 90, 08, 00000000
        jmp     ?_340                                   ; 569F _ EB, 0E

?_338:  add     dword [ebp-8H], 1                       ; 56A1 _ 83. 45, F8, 01
?_339:  mov     eax, dword [ebp-4H]                     ; 56A5 _ 8B. 45, FC
        mov     eax, dword [eax]                        ; 56A8 _ 8B. 00
        cmp     eax, dword [ebp-8H]                     ; 56AA _ 3B. 45, F8
        jg      ?_337                                   ; 56AD _ 7F, D3
?_340:  mov     eax, dword [ebp-4H]                     ; 56AF _ 8B. 45, FC
        mov     eax, dword [eax]                        ; 56B2 _ 8B. 00
        lea     edx, [eax-1H]                           ; 56B4 _ 8D. 50, FF
        mov     eax, dword [ebp-4H]                     ; 56B7 _ 8B. 45, FC
        mov     dword [eax], edx                        ; 56BA _ 89. 10
        mov     eax, dword [ebp-4H]                     ; 56BC _ 8B. 45, FC
        mov     eax, dword [eax+4H]                     ; 56BF _ 8B. 40, 04
        cmp     eax, dword [ebp-8H]                     ; 56C2 _ 3B. 45, F8
        jle     ?_341                                   ; 56C5 _ 7E, 0F
        mov     eax, dword [ebp-4H]                     ; 56C7 _ 8B. 45, FC
        mov     eax, dword [eax+4H]                     ; 56CA _ 8B. 40, 04
        lea     edx, [eax-1H]                           ; 56CD _ 8D. 50, FF
        mov     eax, dword [ebp-4H]                     ; 56D0 _ 8B. 45, FC
        mov     dword [eax+4H], edx                     ; 56D3 _ 89. 50, 04
?_341:  mov     eax, dword [ebp-4H]                     ; 56D6 _ 8B. 45, FC
        mov     edx, dword [eax+4H]                     ; 56D9 _ 8B. 50, 04
        mov     eax, dword [ebp-4H]                     ; 56DC _ 8B. 45, FC
        mov     eax, dword [eax]                        ; 56DF _ 8B. 00
        cmp     edx, eax                                ; 56E1 _ 39. C2
        jl      ?_342                                   ; 56E3 _ 7C, 0A
        mov     eax, dword [ebp-4H]                     ; 56E5 _ 8B. 45, FC
        mov     dword [eax+4H], 0                       ; 56E8 _ C7. 40, 04, 00000000
?_342:  mov     eax, dword [ebp+8H]                     ; 56EF _ 8B. 45, 08
        mov     dword [eax+4H], 1                       ; 56F2 _ C7. 40, 04, 00000001
        jmp     ?_344                                   ; 56F9 _ EB, 1B

?_343:  mov     eax, dword [ebp-8H]                     ; 56FB _ 8B. 45, F8
        lea     edx, [eax+1H]                           ; 56FE _ 8D. 50, 01
        mov     eax, dword [ebp-4H]                     ; 5701 _ 8B. 45, FC
        mov     ecx, dword [eax+edx*4+8H]               ; 5704 _ 8B. 4C 90, 08
        mov     eax, dword [ebp-4H]                     ; 5708 _ 8B. 45, FC
        mov     edx, dword [ebp-8H]                     ; 570B _ 8B. 55, F8
        mov     dword [eax+edx*4+8H], ecx               ; 570E _ 89. 4C 90, 08
        add     dword [ebp-8H], 1                       ; 5712 _ 83. 45, F8, 01
?_344:  mov     eax, dword [ebp-4H]                     ; 5716 _ 8B. 45, FC
        mov     eax, dword [eax]                        ; 5719 _ 8B. 00
        cmp     eax, dword [ebp-8H]                     ; 571B _ 3B. 45, F8
        jg      ?_343                                   ; 571E _ 7F, DB
        nop                                             ; 5720 _ 90
        leave                                           ; 5721 _ C9
        ret                                             ; 5722 _ C3
; task_remove End of function

task_switchsub:; Function begin
        push    ebp                                     ; 5723 _ 55
        mov     ebp, esp                                ; 5724 _ 89. E5
        sub     esp, 16                                 ; 5726 _ 83. EC, 10
        mov     dword [ebp-4H], 0                       ; 5729 _ C7. 45, FC, 00000000
        jmp     ?_347                                   ; 5730 _ EB, 24

?_345:  mov     ecx, dword [taskctl]                    ; 5732 _ 8B. 0D, 00002308(d)
        mov     edx, dword [ebp-4H]                     ; 5738 _ 8B. 55, FC
        mov     eax, edx                                ; 573B _ 89. D0
        shl     eax, 2                                  ; 573D _ C1. E0, 02
        add     eax, edx                                ; 5740 _ 01. D0
        shl     eax, 2                                  ; 5742 _ C1. E0, 02
        add     eax, ecx                                ; 5745 _ 01. C8
        add     eax, 8                                  ; 5747 _ 83. C0, 08
        mov     eax, dword [eax]                        ; 574A _ 8B. 00
        test    eax, eax                                ; 574C _ 85. C0
        jle     ?_346                                   ; 574E _ 7E, 02
        jmp     ?_348                                   ; 5750 _ EB, 0A

?_346:  add     dword [ebp-4H], 1                       ; 5752 _ 83. 45, FC, 01
?_347:  cmp     dword [ebp-4H], 2                       ; 5756 _ 83. 7D, FC, 02
        jle     ?_345                                   ; 575A _ 7E, D6
?_348:  mov     eax, dword [taskctl]                    ; 575C _ A1, 00002308(d)
        mov     edx, dword [ebp-4H]                     ; 5761 _ 8B. 55, FC
        mov     dword [eax], edx                        ; 5764 _ 89. 10
        mov     eax, dword [taskctl]                    ; 5766 _ A1, 00002308(d)
        mov     dword [eax+4H], 0                       ; 576B _ C7. 40, 04, 00000000
        leave                                           ; 5772 _ C9
        ret                                             ; 5773 _ C3
; task_switchsub End of function

send_message:; Function begin
        push    ebp                                     ; 5774 _ 55
        mov     ebp, esp                                ; 5775 _ 89. E5
        sub     esp, 24                                 ; 5777 _ 83. EC, 18
        mov     eax, dword [ebp+10H]                    ; 577A _ 8B. 45, 10
        movzx   eax, al                                 ; 577D _ 0F B6. C0
        mov     edx, dword [ebp+0CH]                    ; 5780 _ 8B. 55, 0C
        add     edx, 16                                 ; 5783 _ 83. C2, 10
        mov     dword [esp+4H], eax                     ; 5786 _ 89. 44 24, 04
        mov     dword [esp], edx                        ; 578A _ 89. 14 24
        call    fifo8_put                               ; 578D _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 5792 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 5795 _ 89. 04 24
        call    task_sleep                              ; 5798 _ E8, FFFFFFFC(rel)
        leave                                           ; 579D _ C9
        ret                                             ; 579E _ C3
; send_message End of function



?_349:                                                  ; byte
        db 63H, 6FH, 75H, 6EH, 74H, 65H, 72H, 00H       ; 0000 _ counter.

?_350:                                                  ; byte
        db 6BH, 69H, 6CH, 6CH, 20H, 70H, 72H, 6FH       ; 0008 _ kill pro
        db 63H, 65H, 73H, 73H, 00H                      ; 0010 _ cess.

?_351:                                                  ; byte
        db 74H, 61H, 73H, 6BH, 5FH, 61H, 00H            ; 0015 _ task_a.

?_352:                                                  ; byte
        db 63H, 6FH, 6EH, 73H, 6FH, 6CH, 65H, 00H       ; 001C _ console.

?_353:                                                  ; byte
        db 20H, 00H                                     ; 0024 _  .

?_354:                                                  ; byte
        db 66H, 72H, 65H, 65H, 20H, 00H                 ; 0026 _ free .

?_355:                                                  ; byte
        db 20H, 4BH, 42H, 00H                           ; 002C _  KB.

?_356:                                                  ; byte
        db 3EH, 00H                                     ; 0030 _ >.

?_357:                                                  ; byte
        db 68H, 6CH, 74H, 2EH, 65H, 78H, 65H, 00H       ; 0032 _ hlt.exe.

?_358:                                                  ; byte
        db 6BH, 65H, 79H, 62H, 6FH, 61H, 72H, 64H       ; 003A _ keyboard
        db 20H, 72H, 65H, 63H, 65H, 69H, 76H, 65H       ; 0042 _  receive
        db 00H                                          ; 004A _ .

?_359:                                                  ; byte
        db 6DH, 65H, 6DH, 00H                           ; 004B _ mem.

?_360:                                                  ; byte
        db 63H, 6CH, 73H, 00H                           ; 004F _ cls.

?_361:                                                  ; byte
        db 68H, 6CH, 74H, 00H                           ; 0053 _ hlt.

?_362:                                                  ; byte
        db 64H, 69H, 72H, 00H                           ; 0057 _ dir.

?_363:                                                  ; byte
        db 70H, 61H, 67H, 65H, 20H, 69H, 73H, 3AH       ; 005B _ page is:
        db 20H, 00H                                     ; 0063 _  .

?_364:                                                  ; byte
        db 42H, 61H, 73H, 65H, 41H, 64H, 64H, 72H       ; 0065 _ BaseAddr
        db 4CH, 3AH, 20H, 00H                           ; 006D _ L: .

?_365:                                                  ; byte
        db 42H, 61H, 73H, 65H, 41H, 64H, 64H, 72H       ; 0071 _ BaseAddr
        db 48H, 3AH, 20H, 00H                           ; 0079 _ H: .

?_366:                                                  ; byte
        db 6CH, 65H, 6EH, 67H, 74H, 68H, 4CH, 6FH       ; 007D _ lengthLo
        db 77H, 3AH, 20H, 00H                           ; 0085 _ w: .

?_367:                                                  ; byte
        db 49H, 4EH, 54H, 20H, 4FH, 43H, 00H            ; 0089 _ INT OC.

?_368:                                                  ; byte
        db 53H, 74H, 61H, 63H, 6BH, 20H, 45H, 78H       ; 0090 _ Stack Ex
        db 63H, 65H, 70H, 74H, 69H, 6FH, 6EH, 00H       ; 0098 _ ception.

?_369:                                                  ; byte
        db 45H, 49H, 50H, 20H, 3DH, 20H, 00H            ; 00A0 _ EIP = .

?_370:                                                  ; byte
        db 49H, 4EH, 54H, 20H, 30H, 44H, 20H, 00H       ; 00A7 _ INT 0D .

?_371:                                                  ; byte
        db 47H, 65H, 6EH, 65H, 72H, 61H, 6CH, 20H       ; 00AF _ General 
        db 50H, 72H, 6FH, 74H, 65H, 63H, 74H, 65H       ; 00B7 _ Protecte
        db 64H, 20H, 45H, 78H, 63H, 65H, 70H, 74H       ; 00BF _ d Except
        db 69H, 6FH, 6EH, 00H                           ; 00C7 _ ion.



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

?_372:  db 00H                                          ; 0112 _ .

?_373:  db 00H, 00H, 00H, 00H, 00H                      ; 0113 _ .....

mmx:    dd 0FFFFFFFFH                                   ; 0118 _ -1 

mmy:    dd 0FFFFFFFFH                                   ; 011C _ -1 

KEY_CONTROL:                                            ; dword
        dd 0000001DH, 00000000H                         ; 0120 _ 29 0 
        dd 00000000H, 00000000H                         ; 0128 _ 0 0 
        dd 00000000H, 00000000H                         ; 0130 _ 0 0 
        dd 00000000H, 00000000H                         ; 0138 _ 0 0 

table_rgb.2054:                                         ; byte
        db 00H, 00H, 00H, 0FFH, 00H, 00H, 44H, 8CH      ; 0140 _ ......D.
        db 0BBH, 0FFH, 0FFH, 00H, 00H, 00H, 0FFH, 0FFH  ; 0148 _ ........
        db 00H, 0FFH, 00H, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH ; 0150 _ ........
        db 0C6H, 0C6H, 0C6H, 84H, 00H, 00H, 00H, 84H    ; 0158 _ ........
        db 00H, 84H, 84H, 00H, 00H, 00H, 84H, 84H       ; 0160 _ ........
        db 00H, 84H, 00H, 84H, 84H, 84H, 84H, 84H       ; 0168 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0170 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0178 _ ........

cursor.2114:                                            ; byte
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

closebtn.2233:                                          ; byte
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



g_hlt:                                                  ; dword
        resd    1                                       ; 0000

key_shift:                                              ; dword
        resd    1                                       ; 0004

caps_lock:                                              ; dword
        resd    1                                       ; 0008

g_Console:                                              ; byte
        resd    1                                       ; 000C

?_374:  resd    1                                       ; 0010

?_375:  resd    1                                       ; 0014

?_376:  resd    1                                       ; 0018

?_377:  resb    1                                       ; 001C

?_378:  resb    3                                       ; 001D

?_379:  resd    1                                       ; 0020

bootInfo:                                               ; qword
        resb    4                                       ; 0024

?_380:  resw    1                                       ; 0028

?_381:  resw    1                                       ; 002A

keyinfo:                                                ; byte
        resb    24                                      ; 002C

?_382:  resd    1                                       ; 0044

mouseinfo:                                              ; byte
        resb    56                                      ; 0048

keybuf:                                                 ; yword
        resb    32                                      ; 0080

mousebuf:                                               ; byte
        resb    128                                     ; 00A0

mdec:                                                   ; oword
        resb    12                                      ; 0120

?_383:  resd    1                                       ; 012C

timerinfo:                                              ; byte
        resb    28                                      ; 0130

timerbuf: resq  1                                       ; 014C

mx:     resd    1                                       ; 0154

my:     resd    1                                       ; 0158

xsize:  resd    1                                       ; 015C

ysize:  resd    1                                       ; 0160

buf_back: resd  7                                       ; 0164

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

task_cons:                                              ; dword
        resd    1                                       ; 0294

task_main:                                              ; dword
        resd    1                                       ; 0298

buffer:                                                 ; byte
        resd    1                                       ; 029C

?_384:  resd    1                                       ; 02A0

?_385:  resd    1                                       ; 02A4

task_a.1806:                                            ; dword
        resd    6                                       ; 02A8

tss_a.1805:                                             ; byte
        resb    128                                     ; 02C0

tss_b.1804:                                             ; byte
        resb    104                                     ; 0340

task_b.1794:                                            ; byte
        resb    12                                      ; 03A8

str.2162:                                               ; byte
        resb    1                                       ; 03B4

?_386:  resb    9                                       ; 03B5

?_387:  resb    2                                       ; 03BE

timerctl:                                               ; byte
        resd    2001                                    ; 03C0

task_timer:                                             ; dword
        resd    1                                       ; 2304

taskctl: resd   1                                       ; 2308


