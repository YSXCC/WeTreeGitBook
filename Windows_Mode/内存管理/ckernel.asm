; Disassembly of file: ckernel.o
; Sat Feb 15 15:10:56 2020
; Mode: 32 bits
; Syntax: YASM/NASM
; Instruction set: 80386






CMain:  ; Function begin
        push    ebp                                     ; 0000 _ 55
        mov     ebp, esp                                ; 0001 _ 89. E5
        push    ebx                                     ; 0003 _ 53
        sub     esp, 84                                 ; 0004 _ 83. EC, 54
        mov     dword [esp], screen_info                ; 0007 _ C7. 04 24, 00000000(d)
        call    init_screeninfo                         ; 000E _ E8, FFFFFFFC(rel)
        mov     eax, dword [screen_info]                ; 0013 _ A1, 00000000(d)
        mov     dword [ebp-2CH], eax                    ; 0018 _ 89. 45, D4
        movzx   eax, word [screen_info+4H]              ; 001B _ 0F B7. 05, 00000004(d)
        cwde                                            ; 0022 _ 98
        mov     dword [ebp-28H], eax                    ; 0023 _ 89. 45, D8
        movzx   eax, word [screen_info+6H]              ; 0026 _ 0F B7. 05, 00000006(d)
        cwde                                            ; 002D _ 98
        mov     dword [ebp-24H], eax                    ; 002E _ 89. 45, DC
        call    init_mouse_position                     ; 0031 _ E8, FFFFFFFC(rel)
        call    init_palette                            ; 0036 _ E8, FFFFFFFC(rel)
        call    init_fifo_buf                           ; 003B _ E8, FFFFFFFC(rel)
        call    init_keyboard                           ; 0040 _ E8, FFFFFFFC(rel)
        call    get_memory_block_count                  ; 0045 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-20H], eax                    ; 004A _ 89. 45, E0
        call    get_memory_address                      ; 004D _ E8, FFFFFFFC(rel)
        mov     dword [ebp-1CH], eax                    ; 0052 _ 89. 45, E4
        call    io_sti                                  ; 0055 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-24H]                    ; 005A _ 8B. 45, DC
        mov     dword [esp+8H], eax                     ; 005D _ 89. 44 24, 08
        mov     eax, dword [ebp-28H]                    ; 0061 _ 8B. 45, D8
        mov     dword [esp+4H], eax                     ; 0064 _ 89. 44 24, 04
        mov     eax, dword [ebp-2CH]                    ; 0068 _ 8B. 45, D4
        mov     dword [esp], eax                        ; 006B _ 89. 04 24
        call    init_desktop                            ; 006E _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 2                       ; 0073 _ C7. 44 24, 04, 00000002
        mov     dword [esp], mouse_cursor_buf           ; 007B _ C7. 04 24, 00000000(d)
        call    init_mouse_cursor                       ; 0082 _ E8, FFFFFFFC(rel)
        mov     edx, dword [mouse_y]                    ; 0087 _ 8B. 15, 00000000(d)
        mov     eax, dword [mouse_x]                    ; 008D _ A1, 00000000(d)
        mov     dword [esp+18H], mouse_cursor_buf       ; 0092 _ C7. 44 24, 18, 00000000(d)
        mov     dword [esp+14H], 16                     ; 009A _ C7. 44 24, 14, 00000010
        mov     dword [esp+10H], 16                     ; 00A2 _ C7. 44 24, 10, 00000010
        mov     dword [esp+0CH], edx                    ; 00AA _ 89. 54 24, 0C
        mov     dword [esp+8H], eax                     ; 00AE _ 89. 44 24, 08
        mov     eax, dword [ebp-28H]                    ; 00B2 _ 8B. 45, D8
        mov     dword [esp+4H], eax                     ; 00B5 _ 89. 44 24, 04
        mov     eax, dword [ebp-2CH]                    ; 00B9 _ 8B. 45, D4
        mov     dword [esp], eax                        ; 00BC _ 89. 04 24
        call    paint_block                             ; 00BF _ E8, FFFFFFFC(rel)
        mov     dword [ebp-18H], 1048576                ; 00C4 _ C7. 45, E8, 00100000
        mov     eax, dword [ebp-18H]                    ; 00CB _ 8B. 45, E8
        mov     dword [esp], eax                        ; 00CE _ 89. 04 24
        call    memman_init                             ; 00D1 _ E8, FFFFFFFC(rel)
        mov     dword [esp+8H], 1072594944              ; 00D6 _ C7. 44 24, 08, 3FEE8000
        mov     dword [esp+4H], 17301504                ; 00DE _ C7. 44 24, 04, 01080000
        mov     eax, dword [ebp-18H]                    ; 00E6 _ 8B. 45, E8
        mov     dword [esp], eax                        ; 00E9 _ 89. 04 24
        call    memman_free                             ; 00EC _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-18H]                    ; 00F1 _ 8B. 45, E8
        mov     dword [esp], eax                        ; 00F4 _ 89. 04 24
        call    memman_total                            ; 00F7 _ E8, FFFFFFFC(rel)
        shr     eax, 20                                 ; 00FC _ C1. E8, 14
        mov     dword [ebp-14H], eax                    ; 00FF _ 89. 45, EC
        mov     eax, dword [ebp-14H]                    ; 0102 _ 8B. 45, EC
        mov     dword [esp], eax                        ; 0105 _ 89. 04 24
        call    intToHexStr                             ; 0108 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 010D _ 89. 45, F0
        mov     dword [esp+14H], 7                      ; 0110 _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_085                  ; 0118 _ C7. 44 24, 10, 00000000(d)
        mov     dword [esp+0CH], 0                      ; 0120 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 0                       ; 0128 _ C7. 44 24, 08, 00000000
        mov     eax, dword [ebp-28H]                    ; 0130 _ 8B. 45, D8
        mov     dword [esp+4H], eax                     ; 0133 _ 89. 44 24, 04
        mov     eax, dword [ebp-2CH]                    ; 0137 _ 8B. 45, D4
        mov     dword [esp], eax                        ; 013A _ 89. 04 24
        call    paint_string                            ; 013D _ E8, FFFFFFFC(rel)
        mov     dword [esp+14H], 7                      ; 0142 _ C7. 44 24, 14, 00000007
        mov     eax, dword [ebp-10H]                    ; 014A _ 8B. 45, F0
        mov     dword [esp+10H], eax                    ; 014D _ 89. 44 24, 10
        mov     dword [esp+0CH], 0                      ; 0151 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 136                     ; 0159 _ C7. 44 24, 08, 00000088
        mov     eax, dword [ebp-28H]                    ; 0161 _ 8B. 45, D8
        mov     dword [esp+4H], eax                     ; 0164 _ 89. 44 24, 04
        mov     eax, dword [ebp-2CH]                    ; 0168 _ 8B. 45, D4
        mov     dword [esp], eax                        ; 016B _ 89. 04 24
        call    paint_string                            ; 016E _ E8, FFFFFFFC(rel)
        mov     dword [esp+14H], 7                      ; 0173 _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_086                  ; 017B _ C7. 44 24, 10, 0000000F(d)
        mov     dword [esp+0CH], 0                      ; 0183 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 224                     ; 018B _ C7. 44 24, 08, 000000E0
        mov     eax, dword [ebp-28H]                    ; 0193 _ 8B. 45, D8
        mov     dword [esp+4H], eax                     ; 0196 _ 89. 44 24, 04
        mov     eax, dword [ebp-2CH]                    ; 019A _ 8B. 45, D4
        mov     dword [esp], eax                        ; 019D _ 89. 04 24
        call    paint_string                            ; 01A0 _ E8, FFFFFFFC(rel)
        call    enable_mouse                            ; 01A5 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], 0                      ; 01AA _ C7. 45, F4, 00000000
        mov     dword [ebp-30H], 0                      ; 01B1 _ C7. 45, D0, 00000000
?_001:  call    io_cli                                  ; 01B8 _ E8, FFFFFFFC(rel)
        mov     dword [esp], keyinfo                    ; 01BD _ C7. 04 24, 00000000(d)
        call    fifo8_status                            ; 01C4 _ E8, FFFFFFFC(rel)
        mov     ebx, eax                                ; 01C9 _ 89. C3
        mov     dword [esp], mouseinfo                  ; 01CB _ C7. 04 24, 00000000(d)
        call    fifo8_status                            ; 01D2 _ E8, FFFFFFFC(rel)
        add     eax, ebx                                ; 01D7 _ 01. D8
        test    eax, eax                                ; 01D9 _ 85. C0
        jnz     ?_002                                   ; 01DB _ 75, 07
        call    io_stihlt                               ; 01DD _ E8, FFFFFFFC(rel)
        jmp     ?_004                                   ; 01E2 _ EB, 7F

?_002:  mov     dword [esp], keyinfo                    ; 01E4 _ C7. 04 24, 00000000(d)
        call    fifo8_status                            ; 01EB _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 01F0 _ 85. C0
        jz      ?_003                                   ; 01F2 _ 74, 55
        call    io_sti                                  ; 01F4 _ E8, FFFFFFFC(rel)
        mov     dword [esp], keyinfo                    ; 01F9 _ C7. 04 24, 00000000(d)
        call    fifo8_get                               ; 0200 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 0205 _ 89. 45, F4
        cmp     dword [ebp-0CH], 28                     ; 0208 _ 83. 7D, F4, 1C
        jnz     ?_004                                   ; 020C _ 75, 55
        mov     edx, dword [ebp-30H]                    ; 020E _ 8B. 55, D0
        mov     eax, edx                                ; 0211 _ 89. D0
        shl     eax, 2                                  ; 0213 _ C1. E0, 02
        add     eax, edx                                ; 0216 _ 01. D0
        shl     eax, 2                                  ; 0218 _ C1. E0, 02
        mov     edx, eax                                ; 021B _ 89. C2
        mov     eax, dword [ebp-1CH]                    ; 021D _ 8B. 45, E4
        add     edx, eax                                ; 0220 _ 01. C2
        mov     eax, dword [ebp-30H]                    ; 0222 _ 8B. 45, D0
        mov     dword [esp+4H], eax                     ; 0225 _ 89. 44 24, 04
        mov     dword [esp], edx                        ; 0229 _ 89. 14 24
        call    show_memory_info                        ; 022C _ E8, FFFFFFFC(rel)
        add     dword [ebp-30H], 1                      ; 0231 _ 83. 45, D0, 01
        mov     eax, dword [ebp-30H]                    ; 0235 _ 8B. 45, D0
        cmp     eax, dword [ebp-20H]                    ; 0238 _ 3B. 45, E0
        jle     ?_004                                   ; 023B _ 7E, 26
        mov     dword [ebp-30H], 0                      ; 023D _ C7. 45, D0, 00000000
        jmp     ?_001                                   ; 0244 _ E9, FFFFFF6F

?_003:  mov     dword [esp], mouseinfo                  ; 0249 _ C7. 04 24, 00000000(d)
        call    fifo8_status                            ; 0250 _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 0255 _ 85. C0
        jz      ?_004                                   ; 0257 _ 74, 0A
        call    show_mouse_info                         ; 0259 _ E8, FFFFFFFC(rel)
        jmp     ?_001                                   ; 025E _ E9, FFFFFF55

?_004:  jmp     ?_001                                   ; 0263 _ E9, FFFFFF50
; CMain End of function

init_screeninfo:; Function begin
        push    ebp                                     ; 0268 _ 55
        mov     ebp, esp                                ; 0269 _ 89. E5
        mov     eax, dword [VRAM_ADDRESS]               ; 026B _ A1, 00000000(d)
        mov     edx, eax                                ; 0270 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0272 _ 8B. 45, 08
        mov     dword [eax], edx                        ; 0275 _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 0277 _ 8B. 45, 08
; Note: Length-changing prefix causes delay on Intel processors
        mov     word [eax+4H], 320                      ; 027A _ 66: C7. 40, 04, 0140
        mov     eax, dword [ebp+8H]                     ; 0280 _ 8B. 45, 08
; Note: Length-changing prefix causes delay on Intel processors
        mov     word [eax+6H], 200                      ; 0283 _ 66: C7. 40, 06, 00C8
        pop     ebp                                     ; 0289 _ 5D
        ret                                             ; 028A _ C3
; init_screeninfo End of function

init_palette:; Function begin
        push    ebp                                     ; 028B _ 55
        mov     ebp, esp                                ; 028C _ 89. E5
        sub     esp, 24                                 ; 028E _ 83. EC, 18
        mov     dword [esp+8H], table_rgb.1497          ; 0291 _ C7. 44 24, 08, 00000000(d)
        mov     dword [esp+4H], 15                      ; 0299 _ C7. 44 24, 04, 0000000F
        mov     dword [esp], 0                          ; 02A1 _ C7. 04 24, 00000000
        call    set_palette                             ; 02A8 _ E8, FFFFFFFC(rel)
        nop                                             ; 02AD _ 90
        leave                                           ; 02AE _ C9
        ret                                             ; 02AF _ C3
; init_palette End of function

set_palette:; Function begin
        push    ebp                                     ; 02B0 _ 55
        mov     ebp, esp                                ; 02B1 _ 89. E5
        sub     esp, 40                                 ; 02B3 _ 83. EC, 28
        call    io_load_eflags                          ; 02B6 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 02BB _ 89. 45, F4
        call    io_cli                                  ; 02BE _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 02C3 _ 8B. 45, 08
        mov     dword [esp+4H], eax                     ; 02C6 _ 89. 44 24, 04
        mov     dword [esp], 968                        ; 02CA _ C7. 04 24, 000003C8
        call    io_out8                                 ; 02D1 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 02D6 _ 8B. 45, 08
        mov     dword [ebp-10H], eax                    ; 02D9 _ 89. 45, F0
        jmp     ?_006                                   ; 02DC _ EB, 62

?_005:  mov     eax, dword [ebp+10H]                    ; 02DE _ 8B. 45, 10
        movzx   eax, byte [eax]                         ; 02E1 _ 0F B6. 00
        shr     al, 2                                   ; 02E4 _ C0. E8, 02
        movzx   eax, al                                 ; 02E7 _ 0F B6. C0
        mov     dword [esp+4H], eax                     ; 02EA _ 89. 44 24, 04
        mov     dword [esp], 969                        ; 02EE _ C7. 04 24, 000003C9
        call    io_out8                                 ; 02F5 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 02FA _ 8B. 45, 10
        add     eax, 1                                  ; 02FD _ 83. C0, 01
        movzx   eax, byte [eax]                         ; 0300 _ 0F B6. 00
        shr     al, 2                                   ; 0303 _ C0. E8, 02
        movzx   eax, al                                 ; 0306 _ 0F B6. C0
        mov     dword [esp+4H], eax                     ; 0309 _ 89. 44 24, 04
        mov     dword [esp], 969                        ; 030D _ C7. 04 24, 000003C9
        call    io_out8                                 ; 0314 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0319 _ 8B. 45, 10
        add     eax, 2                                  ; 031C _ 83. C0, 02
        movzx   eax, byte [eax]                         ; 031F _ 0F B6. 00
        shr     al, 2                                   ; 0322 _ C0. E8, 02
        movzx   eax, al                                 ; 0325 _ 0F B6. C0
        mov     dword [esp+4H], eax                     ; 0328 _ 89. 44 24, 04
        mov     dword [esp], 969                        ; 032C _ C7. 04 24, 000003C9
        call    io_out8                                 ; 0333 _ E8, FFFFFFFC(rel)
        add     dword [ebp+10H], 3                      ; 0338 _ 83. 45, 10, 03
        add     dword [ebp-10H], 1                      ; 033C _ 83. 45, F0, 01
?_006:  mov     eax, dword [ebp-10H]                    ; 0340 _ 8B. 45, F0
        cmp     eax, dword [ebp+0CH]                    ; 0343 _ 3B. 45, 0C
        jle     ?_005                                   ; 0346 _ 7E, 96
        mov     eax, dword [ebp-0CH]                    ; 0348 _ 8B. 45, F4
        mov     dword [esp], eax                        ; 034B _ 89. 04 24
        call    io_store_eflags                         ; 034E _ E8, FFFFFFFC(rel)
        nop                                             ; 0353 _ 90
        leave                                           ; 0354 _ C9
        ret                                             ; 0355 _ C3
; set_palette End of function

paint_rectangle:; Function begin
        push    ebp                                     ; 0356 _ 55
        mov     ebp, esp                                ; 0357 _ 89. E5
        sub     esp, 20                                 ; 0359 _ 83. EC, 14
        mov     eax, dword [ebp+10H]                    ; 035C _ 8B. 45, 10
        mov     byte [ebp-14H], al                      ; 035F _ 88. 45, EC
        mov     eax, dword [ebp+18H]                    ; 0362 _ 8B. 45, 18
        mov     dword [ebp-4H], eax                     ; 0365 _ 89. 45, FC
        jmp     ?_010                                   ; 0368 _ EB, 33

?_007:  mov     eax, dword [ebp+14H]                    ; 036A _ 8B. 45, 14
        mov     dword [ebp-8H], eax                     ; 036D _ 89. 45, F8
        jmp     ?_009                                   ; 0370 _ EB, 1F

?_008:  mov     eax, dword [ebp-4H]                     ; 0372 _ 8B. 45, FC
        imul    eax, dword [ebp+0CH]                    ; 0375 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0379 _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 037B _ 8B. 45, F8
        add     eax, edx                                ; 037E _ 01. D0
        mov     edx, eax                                ; 0380 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0382 _ 8B. 45, 08
        add     edx, eax                                ; 0385 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0387 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 038B _ 88. 02
        add     dword [ebp-8H], 1                       ; 038D _ 83. 45, F8, 01
?_009:  mov     eax, dword [ebp-8H]                     ; 0391 _ 8B. 45, F8
        cmp     eax, dword [ebp+1CH]                    ; 0394 _ 3B. 45, 1C
        jle     ?_008                                   ; 0397 _ 7E, D9
        add     dword [ebp-4H], 1                       ; 0399 _ 83. 45, FC, 01
?_010:  mov     eax, dword [ebp-4H]                     ; 039D _ 8B. 45, FC
        cmp     eax, dword [ebp+20H]                    ; 03A0 _ 3B. 45, 20
        jle     ?_007                                   ; 03A3 _ 7E, C5
        leave                                           ; 03A5 _ C9
        ret                                             ; 03A6 _ C3
; paint_rectangle End of function

init_desktop:; Function begin
        push    ebp                                     ; 03A7 _ 55
        mov     ebp, esp                                ; 03A8 _ 89. E5
        push    ebx                                     ; 03AA _ 53
        sub     esp, 28                                 ; 03AB _ 83. EC, 1C
        mov     eax, dword [ebp+10H]                    ; 03AE _ 8B. 45, 10
        lea     edx, [eax-1DH]                          ; 03B1 _ 8D. 50, E3
        mov     eax, dword [ebp+0CH]                    ; 03B4 _ 8B. 45, 0C
        sub     eax, 1                                  ; 03B7 _ 83. E8, 01
        mov     dword [esp+18H], edx                    ; 03BA _ 89. 54 24, 18
        mov     dword [esp+14H], eax                    ; 03BE _ 89. 44 24, 14
        mov     dword [esp+10H], 0                      ; 03C2 _ C7. 44 24, 10, 00000000
        mov     dword [esp+0CH], 0                      ; 03CA _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 2                       ; 03D2 _ C7. 44 24, 08, 00000002
        mov     eax, dword [ebp+0CH]                    ; 03DA _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 03DD _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 03E1 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 03E4 _ 89. 04 24
        call    paint_rectangle                         ; 03E7 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 03EC _ 8B. 45, 10
        lea     ecx, [eax-1CH]                          ; 03EF _ 8D. 48, E4
        mov     eax, dword [ebp+0CH]                    ; 03F2 _ 8B. 45, 0C
        lea     edx, [eax-1H]                           ; 03F5 _ 8D. 50, FF
        mov     eax, dword [ebp+10H]                    ; 03F8 _ 8B. 45, 10
        sub     eax, 28                                 ; 03FB _ 83. E8, 1C
        mov     dword [esp+18H], ecx                    ; 03FE _ 89. 4C 24, 18
        mov     dword [esp+14H], edx                    ; 0402 _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 0406 _ 89. 44 24, 10
        mov     dword [esp+0CH], 0                      ; 040A _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 8                       ; 0412 _ C7. 44 24, 08, 00000008
        mov     eax, dword [ebp+0CH]                    ; 041A _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 041D _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0421 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0424 _ 89. 04 24
        call    paint_rectangle                         ; 0427 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 042C _ 8B. 45, 10
        lea     ecx, [eax-1BH]                          ; 042F _ 8D. 48, E5
        mov     eax, dword [ebp+0CH]                    ; 0432 _ 8B. 45, 0C
        lea     edx, [eax-1H]                           ; 0435 _ 8D. 50, FF
        mov     eax, dword [ebp+10H]                    ; 0438 _ 8B. 45, 10
        sub     eax, 27                                 ; 043B _ 83. E8, 1B
        mov     dword [esp+18H], ecx                    ; 043E _ 89. 4C 24, 18
        mov     dword [esp+14H], edx                    ; 0442 _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 0446 _ 89. 44 24, 10
        mov     dword [esp+0CH], 0                      ; 044A _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 7                       ; 0452 _ C7. 44 24, 08, 00000007
        mov     eax, dword [ebp+0CH]                    ; 045A _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 045D _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0461 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0464 _ 89. 04 24
        call    paint_rectangle                         ; 0467 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 046C _ 8B. 45, 10
        lea     ecx, [eax-1H]                           ; 046F _ 8D. 48, FF
        mov     eax, dword [ebp+0CH]                    ; 0472 _ 8B. 45, 0C
        lea     edx, [eax-1H]                           ; 0475 _ 8D. 50, FF
        mov     eax, dword [ebp+10H]                    ; 0478 _ 8B. 45, 10
        sub     eax, 26                                 ; 047B _ 83. E8, 1A
        mov     dword [esp+18H], ecx                    ; 047E _ 89. 4C 24, 18
        mov     dword [esp+14H], edx                    ; 0482 _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 0486 _ 89. 44 24, 10
        mov     dword [esp+0CH], 0                      ; 048A _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 8                       ; 0492 _ C7. 44 24, 08, 00000008
        mov     eax, dword [ebp+0CH]                    ; 049A _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 049D _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 04A1 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 04A4 _ 89. 04 24
        call    paint_rectangle                         ; 04A7 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 04AC _ 8B. 45, 10
        lea     edx, [eax-18H]                          ; 04AF _ 8D. 50, E8
        mov     eax, dword [ebp+10H]                    ; 04B2 _ 8B. 45, 10
        sub     eax, 24                                 ; 04B5 _ 83. E8, 18
        mov     dword [esp+18H], edx                    ; 04B8 _ 89. 54 24, 18
        mov     dword [esp+14H], 59                     ; 04BC _ C7. 44 24, 14, 0000003B
        mov     dword [esp+10H], eax                    ; 04C4 _ 89. 44 24, 10
        mov     dword [esp+0CH], 3                      ; 04C8 _ C7. 44 24, 0C, 00000003
        mov     dword [esp+8H], 7                       ; 04D0 _ C7. 44 24, 08, 00000007
        mov     eax, dword [ebp+0CH]                    ; 04D8 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 04DB _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 04DF _ 8B. 45, 08
        mov     dword [esp], eax                        ; 04E2 _ 89. 04 24
        call    paint_rectangle                         ; 04E5 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 04EA _ 8B. 45, 10
        lea     edx, [eax-4H]                           ; 04ED _ 8D. 50, FC
        mov     eax, dword [ebp+10H]                    ; 04F0 _ 8B. 45, 10
        sub     eax, 24                                 ; 04F3 _ 83. E8, 18
        mov     dword [esp+18H], edx                    ; 04F6 _ 89. 54 24, 18
        mov     dword [esp+14H], 2                      ; 04FA _ C7. 44 24, 14, 00000002
        mov     dword [esp+10H], eax                    ; 0502 _ 89. 44 24, 10
        mov     dword [esp+0CH], 2                      ; 0506 _ C7. 44 24, 0C, 00000002
        mov     dword [esp+8H], 7                       ; 050E _ C7. 44 24, 08, 00000007
        mov     eax, dword [ebp+0CH]                    ; 0516 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0519 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 051D _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0520 _ 89. 04 24
        call    paint_rectangle                         ; 0523 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0528 _ 8B. 45, 10
        lea     edx, [eax-4H]                           ; 052B _ 8D. 50, FC
        mov     eax, dword [ebp+10H]                    ; 052E _ 8B. 45, 10
        sub     eax, 4                                  ; 0531 _ 83. E8, 04
        mov     dword [esp+18H], edx                    ; 0534 _ 89. 54 24, 18
        mov     dword [esp+14H], 59                     ; 0538 _ C7. 44 24, 14, 0000003B
        mov     dword [esp+10H], eax                    ; 0540 _ 89. 44 24, 10
        mov     dword [esp+0CH], 3                      ; 0544 _ C7. 44 24, 0C, 00000003
        mov     dword [esp+8H], 2                       ; 054C _ C7. 44 24, 08, 00000002
        mov     eax, dword [ebp+0CH]                    ; 0554 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0557 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 055B _ 8B. 45, 08
        mov     dword [esp], eax                        ; 055E _ 89. 04 24
        call    paint_rectangle                         ; 0561 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0566 _ 8B. 45, 10
        lea     edx, [eax-5H]                           ; 0569 _ 8D. 50, FB
        mov     eax, dword [ebp+10H]                    ; 056C _ 8B. 45, 10
        sub     eax, 23                                 ; 056F _ 83. E8, 17
        mov     dword [esp+18H], edx                    ; 0572 _ 89. 54 24, 18
        mov     dword [esp+14H], 59                     ; 0576 _ C7. 44 24, 14, 0000003B
        mov     dword [esp+10H], eax                    ; 057E _ 89. 44 24, 10
        mov     dword [esp+0CH], 59                     ; 0582 _ C7. 44 24, 0C, 0000003B
        mov     dword [esp+8H], 2                       ; 058A _ C7. 44 24, 08, 00000002
        mov     eax, dword [ebp+0CH]                    ; 0592 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0595 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0599 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 059C _ 89. 04 24
        call    paint_rectangle                         ; 059F _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 05A4 _ 8B. 45, 10
        lea     edx, [eax-3H]                           ; 05A7 _ 8D. 50, FD
        mov     eax, dword [ebp+10H]                    ; 05AA _ 8B. 45, 10
        sub     eax, 3                                  ; 05AD _ 83. E8, 03
        mov     dword [esp+18H], edx                    ; 05B0 _ 89. 54 24, 18
        mov     dword [esp+14H], 59                     ; 05B4 _ C7. 44 24, 14, 0000003B
        mov     dword [esp+10H], eax                    ; 05BC _ 89. 44 24, 10
        mov     dword [esp+0CH], 2                      ; 05C0 _ C7. 44 24, 0C, 00000002
        mov     dword [esp+8H], 0                       ; 05C8 _ C7. 44 24, 08, 00000000
        mov     eax, dword [ebp+0CH]                    ; 05D0 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 05D3 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 05D7 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 05DA _ 89. 04 24
        call    paint_rectangle                         ; 05DD _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 05E2 _ 8B. 45, 10
        lea     edx, [eax-3H]                           ; 05E5 _ 8D. 50, FD
        mov     eax, dword [ebp+10H]                    ; 05E8 _ 8B. 45, 10
        sub     eax, 24                                 ; 05EB _ 83. E8, 18
        mov     dword [esp+18H], edx                    ; 05EE _ 89. 54 24, 18
        mov     dword [esp+14H], 60                     ; 05F2 _ C7. 44 24, 14, 0000003C
        mov     dword [esp+10H], eax                    ; 05FA _ 89. 44 24, 10
        mov     dword [esp+0CH], 60                     ; 05FE _ C7. 44 24, 0C, 0000003C
        mov     dword [esp+8H], 0                       ; 0606 _ C7. 44 24, 08, 00000000
        mov     eax, dword [ebp+0CH]                    ; 060E _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0611 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0615 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0618 _ 89. 04 24
        call    paint_rectangle                         ; 061B _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0620 _ 8B. 45, 10
        lea     ebx, [eax-18H]                          ; 0623 _ 8D. 58, E8
        mov     eax, dword [ebp+0CH]                    ; 0626 _ 8B. 45, 0C
        lea     ecx, [eax-4H]                           ; 0629 _ 8D. 48, FC
        mov     eax, dword [ebp+10H]                    ; 062C _ 8B. 45, 10
        lea     edx, [eax-18H]                          ; 062F _ 8D. 50, E8
        mov     eax, dword [ebp+0CH]                    ; 0632 _ 8B. 45, 0C
        sub     eax, 47                                 ; 0635 _ 83. E8, 2F
        mov     dword [esp+18H], ebx                    ; 0638 _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 063C _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 0640 _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 0644 _ 89. 44 24, 0C
        mov     dword [esp+8H], 2                       ; 0648 _ C7. 44 24, 08, 00000002
        mov     eax, dword [ebp+0CH]                    ; 0650 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0653 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0657 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 065A _ 89. 04 24
        call    paint_rectangle                         ; 065D _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0662 _ 8B. 45, 10
        lea     ebx, [eax-4H]                           ; 0665 _ 8D. 58, FC
        mov     eax, dword [ebp+0CH]                    ; 0668 _ 8B. 45, 0C
        lea     ecx, [eax-2FH]                          ; 066B _ 8D. 48, D1
        mov     eax, dword [ebp+10H]                    ; 066E _ 8B. 45, 10
        lea     edx, [eax-17H]                          ; 0671 _ 8D. 50, E9
        mov     eax, dword [ebp+0CH]                    ; 0674 _ 8B. 45, 0C
        sub     eax, 47                                 ; 0677 _ 83. E8, 2F
        mov     dword [esp+18H], ebx                    ; 067A _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 067E _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 0682 _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 0686 _ 89. 44 24, 0C
        mov     dword [esp+8H], 2                       ; 068A _ C7. 44 24, 08, 00000002
        mov     eax, dword [ebp+0CH]                    ; 0692 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0695 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0699 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 069C _ 89. 04 24
        call    paint_rectangle                         ; 069F _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 06A4 _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 06A7 _ 8D. 58, FD
        mov     eax, dword [ebp+0CH]                    ; 06AA _ 8B. 45, 0C
        lea     ecx, [eax-4H]                           ; 06AD _ 8D. 48, FC
        mov     eax, dword [ebp+10H]                    ; 06B0 _ 8B. 45, 10
        lea     edx, [eax-3H]                           ; 06B3 _ 8D. 50, FD
        mov     eax, dword [ebp+0CH]                    ; 06B6 _ 8B. 45, 0C
        sub     eax, 47                                 ; 06B9 _ 83. E8, 2F
        mov     dword [esp+18H], ebx                    ; 06BC _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 06C0 _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 06C4 _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 06C8 _ 89. 44 24, 0C
        mov     dword [esp+8H], 7                       ; 06CC _ C7. 44 24, 08, 00000007
        mov     eax, dword [ebp+0CH]                    ; 06D4 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 06D7 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 06DB _ 8B. 45, 08
        mov     dword [esp], eax                        ; 06DE _ 89. 04 24
        call    paint_rectangle                         ; 06E1 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 06E6 _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 06E9 _ 8D. 58, FD
        mov     eax, dword [ebp+0CH]                    ; 06EC _ 8B. 45, 0C
        lea     ecx, [eax-3H]                           ; 06EF _ 8D. 48, FD
        mov     eax, dword [ebp+10H]                    ; 06F2 _ 8B. 45, 10
        lea     edx, [eax-18H]                          ; 06F5 _ 8D. 50, E8
        mov     eax, dword [ebp+0CH]                    ; 06F8 _ 8B. 45, 0C
        sub     eax, 3                                  ; 06FB _ 83. E8, 03
        mov     dword [esp+18H], ebx                    ; 06FE _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 0702 _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 0706 _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 070A _ 89. 44 24, 0C
        mov     dword [esp+8H], 7                       ; 070E _ C7. 44 24, 08, 00000007
        mov     eax, dword [ebp+0CH]                    ; 0716 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0719 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 071D _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0720 _ 89. 04 24
        call    paint_rectangle                         ; 0723 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 0728 _ 83. C4, 1C
        pop     ebx                                     ; 072B _ 5B
        pop     ebp                                     ; 072C _ 5D
        ret                                             ; 072D _ C3
; init_desktop End of function

init_mouse_position:; Function begin
        push    ebp                                     ; 072E _ 55
        mov     ebp, esp                                ; 072F _ 89. E5
        sub     esp, 16                                 ; 0731 _ 83. EC, 10
        movzx   eax, word [?_095]                       ; 0734 _ 0F B7. 05, 00000004(d)
        cwde                                            ; 073B _ 98
        mov     dword [ebp-8H], eax                     ; 073C _ 89. 45, F8
        movzx   eax, word [?_096]                       ; 073F _ 0F B7. 05, 00000006(d)
        cwde                                            ; 0746 _ 98
        mov     dword [ebp-4H], eax                     ; 0747 _ 89. 45, FC
        mov     eax, dword [ebp-8H]                     ; 074A _ 8B. 45, F8
        sub     eax, 16                                 ; 074D _ 83. E8, 10
        mov     edx, eax                                ; 0750 _ 89. C2
        shr     edx, 31                                 ; 0752 _ C1. EA, 1F
        add     eax, edx                                ; 0755 _ 01. D0
        sar     eax, 1                                  ; 0757 _ D1. F8
        mov     dword [mouse_x], eax                    ; 0759 _ A3, 00000120(d)
        mov     eax, dword [ebp-4H]                     ; 075E _ 8B. 45, FC
        sub     eax, 44                                 ; 0761 _ 83. E8, 2C
        mov     edx, eax                                ; 0764 _ 89. C2
        shr     edx, 31                                 ; 0766 _ C1. EA, 1F
        add     eax, edx                                ; 0769 _ 01. D0
        sar     eax, 1                                  ; 076B _ D1. F8
        mov     dword [mouse_y], eax                    ; 076D _ A3, 00000124(d)
        leave                                           ; 0772 _ C9
        ret                                             ; 0773 _ C3
; init_mouse_position End of function

paint_font:; Function begin
        push    ebp                                     ; 0774 _ 55
        mov     ebp, esp                                ; 0775 _ 89. E5
        sub     esp, 20                                 ; 0777 _ 83. EC, 14
        mov     eax, dword [ebp+1CH]                    ; 077A _ 8B. 45, 1C
        mov     byte [ebp-14H], al                      ; 077D _ 88. 45, EC
        mov     dword [ebp-4H], 0                       ; 0780 _ C7. 45, FC, 00000000
        jmp     ?_020                                   ; 0787 _ E9, 0000016E

?_011:  mov     edx, dword [ebp-4H]                     ; 078C _ 8B. 55, FC
        mov     eax, dword [ebp+18H]                    ; 078F _ 8B. 45, 18
        add     eax, edx                                ; 0792 _ 01. D0
        movzx   eax, byte [eax]                         ; 0794 _ 0F B6. 00
        mov     byte [ebp-5H], al                       ; 0797 _ 88. 45, FB
        movzx   eax, byte [ebp-5H]                      ; 079A _ 0F B6. 45, FB
        test    al, al                                  ; 079E _ 84. C0
        jns     ?_012                                   ; 07A0 _ 79, 20
        mov     eax, dword [ebp-4H]                     ; 07A2 _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 07A5 _ 8B. 55, 14
        add     eax, edx                                ; 07A8 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 07AA _ 0F AF. 45, 0C
        mov     edx, eax                                ; 07AE _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 07B0 _ 8B. 45, 10
        add     eax, edx                                ; 07B3 _ 01. D0
        mov     edx, eax                                ; 07B5 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 07B7 _ 8B. 45, 08
        add     edx, eax                                ; 07BA _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 07BC _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 07C0 _ 88. 02
?_012:  movzx   eax, byte [ebp-5H]                      ; 07C2 _ 0F B6. 45, FB
        and     eax, 40H                                ; 07C6 _ 83. E0, 40
        test    eax, eax                                ; 07C9 _ 85. C0
        jz      ?_013                                   ; 07CB _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 07CD _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 07D0 _ 8B. 55, 14
        add     eax, edx                                ; 07D3 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 07D5 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 07D9 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 07DB _ 8B. 45, 10
        add     eax, edx                                ; 07DE _ 01. D0
        lea     edx, [eax+1H]                           ; 07E0 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 07E3 _ 8B. 45, 08
        add     edx, eax                                ; 07E6 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 07E8 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 07EC _ 88. 02
?_013:  movzx   eax, byte [ebp-5H]                      ; 07EE _ 0F B6. 45, FB
        and     eax, 20H                                ; 07F2 _ 83. E0, 20
        test    eax, eax                                ; 07F5 _ 85. C0
        jz      ?_014                                   ; 07F7 _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 07F9 _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 07FC _ 8B. 55, 14
        add     eax, edx                                ; 07FF _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0801 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0805 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0807 _ 8B. 45, 10
        add     eax, edx                                ; 080A _ 01. D0
        lea     edx, [eax+2H]                           ; 080C _ 8D. 50, 02
        mov     eax, dword [ebp+8H]                     ; 080F _ 8B. 45, 08
        add     edx, eax                                ; 0812 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0814 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0818 _ 88. 02
?_014:  movzx   eax, byte [ebp-5H]                      ; 081A _ 0F B6. 45, FB
        and     eax, 10H                                ; 081E _ 83. E0, 10
        test    eax, eax                                ; 0821 _ 85. C0
        jz      ?_015                                   ; 0823 _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 0825 _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 0828 _ 8B. 55, 14
        add     eax, edx                                ; 082B _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 082D _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0831 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0833 _ 8B. 45, 10
        add     eax, edx                                ; 0836 _ 01. D0
        lea     edx, [eax+3H]                           ; 0838 _ 8D. 50, 03
        mov     eax, dword [ebp+8H]                     ; 083B _ 8B. 45, 08
        add     edx, eax                                ; 083E _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0840 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0844 _ 88. 02
?_015:  movzx   eax, byte [ebp-5H]                      ; 0846 _ 0F B6. 45, FB
        and     eax, 08H                                ; 084A _ 83. E0, 08
        test    eax, eax                                ; 084D _ 85. C0
        jz      ?_016                                   ; 084F _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 0851 _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 0854 _ 8B. 55, 14
        add     eax, edx                                ; 0857 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0859 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 085D _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 085F _ 8B. 45, 10
        add     eax, edx                                ; 0862 _ 01. D0
        lea     edx, [eax+4H]                           ; 0864 _ 8D. 50, 04
        mov     eax, dword [ebp+8H]                     ; 0867 _ 8B. 45, 08
        add     edx, eax                                ; 086A _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 086C _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0870 _ 88. 02
?_016:  movzx   eax, byte [ebp-5H]                      ; 0872 _ 0F B6. 45, FB
        and     eax, 04H                                ; 0876 _ 83. E0, 04
        test    eax, eax                                ; 0879 _ 85. C0
        jz      ?_017                                   ; 087B _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 087D _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 0880 _ 8B. 55, 14
        add     eax, edx                                ; 0883 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0885 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0889 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 088B _ 8B. 45, 10
        add     eax, edx                                ; 088E _ 01. D0
        lea     edx, [eax+5H]                           ; 0890 _ 8D. 50, 05
        mov     eax, dword [ebp+8H]                     ; 0893 _ 8B. 45, 08
        add     edx, eax                                ; 0896 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0898 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 089C _ 88. 02
?_017:  movzx   eax, byte [ebp-5H]                      ; 089E _ 0F B6. 45, FB
        and     eax, 02H                                ; 08A2 _ 83. E0, 02
        test    eax, eax                                ; 08A5 _ 85. C0
        jz      ?_018                                   ; 08A7 _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 08A9 _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 08AC _ 8B. 55, 14
        add     eax, edx                                ; 08AF _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 08B1 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 08B5 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 08B7 _ 8B. 45, 10
        add     eax, edx                                ; 08BA _ 01. D0
        lea     edx, [eax+6H]                           ; 08BC _ 8D. 50, 06
        mov     eax, dword [ebp+8H]                     ; 08BF _ 8B. 45, 08
        add     edx, eax                                ; 08C2 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 08C4 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 08C8 _ 88. 02
?_018:  movzx   eax, byte [ebp-5H]                      ; 08CA _ 0F B6. 45, FB
        and     eax, 01H                                ; 08CE _ 83. E0, 01
        test    eax, eax                                ; 08D1 _ 85. C0
        jz      ?_019                                   ; 08D3 _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 08D5 _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 08D8 _ 8B. 55, 14
        add     eax, edx                                ; 08DB _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 08DD _ 0F AF. 45, 0C
        mov     edx, eax                                ; 08E1 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 08E3 _ 8B. 45, 10
        add     eax, edx                                ; 08E6 _ 01. D0
        lea     edx, [eax+7H]                           ; 08E8 _ 8D. 50, 07
        mov     eax, dword [ebp+8H]                     ; 08EB _ 8B. 45, 08
        add     edx, eax                                ; 08EE _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 08F0 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 08F4 _ 88. 02
?_019:  add     dword [ebp-4H], 1                       ; 08F6 _ 83. 45, FC, 01
?_020:  cmp     dword [ebp-4H], 15                      ; 08FA _ 83. 7D, FC, 0F
        jle     ?_011                                   ; 08FE _ 0F 8E, FFFFFE88
        leave                                           ; 0904 _ C9
        ret                                             ; 0905 _ C3
; paint_font End of function

paint_string:; Function begin
        push    ebp                                     ; 0906 _ 55
        mov     ebp, esp                                ; 0907 _ 89. E5
        sub     esp, 28                                 ; 0909 _ 83. EC, 1C
        mov     eax, dword [ebp+1CH]                    ; 090C _ 8B. 45, 1C
        mov     byte [ebp-4H], al                       ; 090F _ 88. 45, FC
        jmp     ?_022                                   ; 0912 _ EB, 46

?_021:  movsx   eax, byte [ebp-4H]                      ; 0914 _ 0F BE. 45, FC
        mov     edx, dword [ebp+18H]                    ; 0918 _ 8B. 55, 18
        movzx   edx, byte [edx]                         ; 091B _ 0F B6. 12
        movsx   edx, dl                                 ; 091E _ 0F BE. D2
        shl     edx, 4                                  ; 0921 _ C1. E2, 04
        add     edx, systemFont                         ; 0924 _ 81. C2, 00000000(d)
        mov     dword [esp+14H], eax                    ; 092A _ 89. 44 24, 14
        mov     dword [esp+10H], edx                    ; 092E _ 89. 54 24, 10
        mov     eax, dword [ebp+14H]                    ; 0932 _ 8B. 45, 14
        mov     dword [esp+0CH], eax                    ; 0935 _ 89. 44 24, 0C
        mov     eax, dword [ebp+10H]                    ; 0939 _ 8B. 45, 10
        mov     dword [esp+8H], eax                     ; 093C _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 0940 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0943 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0947 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 094A _ 89. 04 24
        call    paint_font                              ; 094D _ E8, FFFFFFFC(rel)
        add     dword [ebp+10H], 8                      ; 0952 _ 83. 45, 10, 08
        add     dword [ebp+18H], 1                      ; 0956 _ 83. 45, 18, 01
?_022:  mov     eax, dword [ebp+18H]                    ; 095A _ 8B. 45, 18
        movzx   eax, byte [eax]                         ; 095D _ 0F B6. 00
        test    al, al                                  ; 0960 _ 84. C0
        jnz     ?_021                                   ; 0962 _ 75, B0
        leave                                           ; 0964 _ C9
        ret                                             ; 0965 _ C3
; paint_string End of function

init_mouse_cursor:; Function begin
        push    ebp                                     ; 0966 _ 55
        mov     ebp, esp                                ; 0967 _ 89. E5
        sub     esp, 20                                 ; 0969 _ 83. EC, 14
        mov     eax, dword [ebp+0CH]                    ; 096C _ 8B. 45, 0C
        mov     byte [ebp-14H], al                      ; 096F _ 88. 45, EC
        mov     dword [ebp-8H], 0                       ; 0972 _ C7. 45, F8, 00000000
        jmp     ?_029                                   ; 0979 _ E9, 0000009C

?_023:  mov     dword [ebp-4H], 0                       ; 097E _ C7. 45, FC, 00000000
        jmp     ?_028                                   ; 0985 _ E9, 00000082

?_024:  mov     eax, dword [ebp-8H]                     ; 098A _ 8B. 45, F8
        shl     eax, 4                                  ; 098D _ C1. E0, 04
        mov     edx, eax                                ; 0990 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 0992 _ 8B. 45, FC
        add     eax, edx                                ; 0995 _ 01. D0
        add     eax, cursor.1564                        ; 0997 _ 05, 00000040(d)
        movzx   eax, byte [eax]                         ; 099C _ 0F B6. 00
        cmp     al, 42                                  ; 099F _ 3C, 2A
        jnz     ?_025                                   ; 09A1 _ 75, 19
        mov     eax, dword [ebp-8H]                     ; 09A3 _ 8B. 45, F8
        shl     eax, 4                                  ; 09A6 _ C1. E0, 04
        mov     edx, eax                                ; 09A9 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 09AB _ 8B. 45, FC
        add     eax, edx                                ; 09AE _ 01. D0
        mov     edx, eax                                ; 09B0 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 09B2 _ 8B. 45, 08
        add     eax, edx                                ; 09B5 _ 01. D0
        mov     byte [eax], 0                           ; 09B7 _ C6. 00, 00
        jmp     ?_027                                   ; 09BA _ EB, 4C

?_025:  mov     eax, dword [ebp-8H]                     ; 09BC _ 8B. 45, F8
        shl     eax, 4                                  ; 09BF _ C1. E0, 04
        mov     edx, eax                                ; 09C2 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 09C4 _ 8B. 45, FC
        add     eax, edx                                ; 09C7 _ 01. D0
        add     eax, cursor.1564                        ; 09C9 _ 05, 00000040(d)
        movzx   eax, byte [eax]                         ; 09CE _ 0F B6. 00
        cmp     al, 79                                  ; 09D1 _ 3C, 4F
        jnz     ?_026                                   ; 09D3 _ 75, 19
        mov     eax, dword [ebp-8H]                     ; 09D5 _ 8B. 45, F8
        shl     eax, 4                                  ; 09D8 _ C1. E0, 04
        mov     edx, eax                                ; 09DB _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 09DD _ 8B. 45, FC
        add     eax, edx                                ; 09E0 _ 01. D0
        mov     edx, eax                                ; 09E2 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 09E4 _ 8B. 45, 08
        add     eax, edx                                ; 09E7 _ 01. D0
        mov     byte [eax], 7                           ; 09E9 _ C6. 00, 07
        jmp     ?_027                                   ; 09EC _ EB, 1A

?_026:  mov     eax, dword [ebp-8H]                     ; 09EE _ 8B. 45, F8
        shl     eax, 4                                  ; 09F1 _ C1. E0, 04
        mov     edx, eax                                ; 09F4 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 09F6 _ 8B. 45, FC
        add     eax, edx                                ; 09F9 _ 01. D0
        mov     edx, eax                                ; 09FB _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 09FD _ 8B. 45, 08
        add     edx, eax                                ; 0A00 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0A02 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0A06 _ 88. 02
?_027:  add     dword [ebp-4H], 1                       ; 0A08 _ 83. 45, FC, 01
?_028:  cmp     dword [ebp-4H], 15                      ; 0A0C _ 83. 7D, FC, 0F
        jle     ?_024                                   ; 0A10 _ 0F 8E, FFFFFF74
        add     dword [ebp-8H], 1                       ; 0A16 _ 83. 45, F8, 01
?_029:  cmp     dword [ebp-8H], 15                      ; 0A1A _ 83. 7D, F8, 0F
        jle     ?_023                                   ; 0A1E _ 0F 8E, FFFFFF5A
        leave                                           ; 0A24 _ C9
        ret                                             ; 0A25 _ C3
; init_mouse_cursor End of function

paint_block:; Function begin
        push    ebp                                     ; 0A26 _ 55
        mov     ebp, esp                                ; 0A27 _ 89. E5
        sub     esp, 16                                 ; 0A29 _ 83. EC, 10
        mov     dword [ebp-8H], 0                       ; 0A2C _ C7. 45, F8, 00000000
        jmp     ?_033                                   ; 0A33 _ EB, 50

?_030:  mov     dword [ebp-4H], 0                       ; 0A35 _ C7. 45, FC, 00000000
        jmp     ?_032                                   ; 0A3C _ EB, 3B

?_031:  mov     eax, dword [ebp-8H]                     ; 0A3E _ 8B. 45, F8
        mov     edx, dword [ebp+14H]                    ; 0A41 _ 8B. 55, 14
        add     eax, edx                                ; 0A44 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0A46 _ 0F AF. 45, 0C
        mov     edx, dword [ebp-4H]                     ; 0A4A _ 8B. 55, FC
        mov     ecx, dword [ebp+10H]                    ; 0A4D _ 8B. 4D, 10
        add     edx, ecx                                ; 0A50 _ 01. CA
        add     eax, edx                                ; 0A52 _ 01. D0
        mov     edx, eax                                ; 0A54 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0A56 _ 8B. 45, 08
        add     edx, eax                                ; 0A59 _ 01. C2
        mov     eax, dword [ebp-8H]                     ; 0A5B _ 8B. 45, F8
        imul    eax, dword [ebp+18H]                    ; 0A5E _ 0F AF. 45, 18
        mov     ecx, eax                                ; 0A62 _ 89. C1
        mov     eax, dword [ebp-4H]                     ; 0A64 _ 8B. 45, FC
        add     eax, ecx                                ; 0A67 _ 01. C8
        mov     ecx, eax                                ; 0A69 _ 89. C1
        mov     eax, dword [ebp+20H]                    ; 0A6B _ 8B. 45, 20
        add     eax, ecx                                ; 0A6E _ 01. C8
        movzx   eax, byte [eax]                         ; 0A70 _ 0F B6. 00
        mov     byte [edx], al                          ; 0A73 _ 88. 02
        add     dword [ebp-4H], 1                       ; 0A75 _ 83. 45, FC, 01
?_032:  mov     eax, dword [ebp-4H]                     ; 0A79 _ 8B. 45, FC
        cmp     eax, dword [ebp+18H]                    ; 0A7C _ 3B. 45, 18
        jl      ?_031                                   ; 0A7F _ 7C, BD
        add     dword [ebp-8H], 1                       ; 0A81 _ 83. 45, F8, 01
?_033:  mov     eax, dword [ebp-8H]                     ; 0A85 _ 8B. 45, F8
        cmp     eax, dword [ebp+1CH]                    ; 0A88 _ 3B. 45, 1C
        jl      ?_030                                   ; 0A8B _ 7C, A8
        leave                                           ; 0A8D _ C9
        ret                                             ; 0A8E _ C3
; paint_block End of function

init_fifo_buf:; Function begin
        push    ebp                                     ; 0A8F _ 55
        mov     ebp, esp                                ; 0A90 _ 89. E5
        sub     esp, 24                                 ; 0A92 _ 83. EC, 18
        mov     dword [esp+8H], mousebuf                ; 0A95 _ C7. 44 24, 08, 00000000(d)
        mov     dword [esp+4H], 128                     ; 0A9D _ C7. 44 24, 04, 00000080
        mov     dword [esp], mouseinfo                  ; 0AA5 _ C7. 04 24, 00000000(d)
        call    fifo8_init                              ; 0AAC _ E8, FFFFFFFC(rel)
        mov     dword [esp+8H], keybuf                  ; 0AB1 _ C7. 44 24, 08, 00000000(d)
        mov     dword [esp+4H], 32                      ; 0AB9 _ C7. 44 24, 04, 00000020
        mov     dword [esp], keyinfo                    ; 0AC1 _ C7. 04 24, 00000000(d)
        call    fifo8_init                              ; 0AC8 _ E8, FFFFFFFC(rel)
        leave                                           ; 0ACD _ C9
        ret                                             ; 0ACE _ C3
; init_fifo_buf End of function

eraser_mouse:; Function begin
        push    ebp                                     ; 0ACF _ 55
        mov     ebp, esp                                ; 0AD0 _ 89. E5
        push    ebx                                     ; 0AD2 _ 53
        sub     esp, 44                                 ; 0AD3 _ 83. EC, 2C
        mov     eax, dword [screen_info]                ; 0AD6 _ A1, 00000000(d)
        mov     dword [ebp-0CH], eax                    ; 0ADB _ 89. 45, F4
        movzx   eax, word [?_095]                       ; 0ADE _ 0F B7. 05, 00000004(d)
        cwde                                            ; 0AE5 _ 98
        mov     dword [ebp-8H], eax                     ; 0AE6 _ 89. 45, F8
        mov     eax, dword [mouse_y]                    ; 0AE9 _ A1, 00000124(d)
        lea     ebx, [eax+0FH]                          ; 0AEE _ 8D. 58, 0F
        mov     eax, dword [mouse_x]                    ; 0AF1 _ A1, 00000120(d)
        lea     ecx, [eax+0FH]                          ; 0AF6 _ 8D. 48, 0F
        mov     edx, dword [mouse_y]                    ; 0AF9 _ 8B. 15, 00000124(d)
        mov     eax, dword [mouse_x]                    ; 0AFF _ A1, 00000120(d)
        mov     dword [esp+18H], ebx                    ; 0B04 _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 0B08 _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 0B0C _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 0B10 _ 89. 44 24, 0C
        mov     dword [esp+8H], 2                       ; 0B14 _ C7. 44 24, 08, 00000002
        mov     eax, dword [ebp-8H]                     ; 0B1C _ 8B. 45, F8
        mov     dword [esp+4H], eax                     ; 0B1F _ 89. 44 24, 04
        mov     eax, dword [ebp-0CH]                    ; 0B23 _ 8B. 45, F4
        mov     dword [esp], eax                        ; 0B26 _ 89. 04 24
        call    paint_rectangle                         ; 0B29 _ E8, FFFFFFFC(rel)
        add     esp, 44                                 ; 0B2E _ 83. C4, 2C
        pop     ebx                                     ; 0B31 _ 5B
        pop     ebp                                     ; 0B32 _ 5D
        ret                                             ; 0B33 _ C3
; eraser_mouse End of function

compute_mouse_position:; Function begin
        push    ebp                                     ; 0B34 _ 55
        mov     ebp, esp                                ; 0B35 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 0B37 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 0B3A _ 8B. 50, 04
        mov     eax, dword [mouse_x]                    ; 0B3D _ A1, 00000120(d)
        add     eax, edx                                ; 0B42 _ 01. D0
        mov     dword [mouse_x], eax                    ; 0B44 _ A3, 00000120(d)
        mov     eax, dword [ebp+8H]                     ; 0B49 _ 8B. 45, 08
        mov     edx, dword [eax+8H]                     ; 0B4C _ 8B. 50, 08
        mov     eax, dword [mouse_y]                    ; 0B4F _ A1, 00000124(d)
        add     eax, edx                                ; 0B54 _ 01. D0
        mov     dword [mouse_y], eax                    ; 0B56 _ A3, 00000124(d)
        mov     eax, dword [mouse_x]                    ; 0B5B _ A1, 00000120(d)
        test    eax, eax                                ; 0B60 _ 85. C0
        jns     ?_034                                   ; 0B62 _ 79, 0A
        mov     dword [mouse_x], 0                      ; 0B64 _ C7. 05, 00000120(d), 00000000
?_034:  mov     eax, dword [mouse_y]                    ; 0B6E _ A1, 00000124(d)
        test    eax, eax                                ; 0B73 _ 85. C0
        jns     ?_035                                   ; 0B75 _ 79, 0A
        mov     dword [mouse_y], 0                      ; 0B77 _ C7. 05, 00000124(d), 00000000
?_035:  movzx   eax, word [?_095]                       ; 0B81 _ 0F B7. 05, 00000004(d)
        cwde                                            ; 0B88 _ 98
        lea     edx, [eax-10H]                          ; 0B89 _ 8D. 50, F0
        mov     eax, dword [mouse_x]                    ; 0B8C _ A1, 00000120(d)
        cmp     edx, eax                                ; 0B91 _ 39. C2
        jge     ?_036                                   ; 0B93 _ 7D, 10
        movzx   eax, word [?_095]                       ; 0B95 _ 0F B7. 05, 00000004(d)
        cwde                                            ; 0B9C _ 98
        sub     eax, 16                                 ; 0B9D _ 83. E8, 10
        mov     dword [mouse_x], eax                    ; 0BA0 _ A3, 00000120(d)
?_036:  movzx   eax, word [?_095]                       ; 0BA5 _ 0F B7. 05, 00000004(d)
        cwde                                            ; 0BAC _ 98
        lea     edx, [eax-10H]                          ; 0BAD _ 8D. 50, F0
        mov     eax, dword [mouse_y]                    ; 0BB0 _ A1, 00000124(d)
        cmp     edx, eax                                ; 0BB5 _ 39. C2
        jge     ?_037                                   ; 0BB7 _ 7D, 10
        movzx   eax, word [?_095]                       ; 0BB9 _ 0F B7. 05, 00000004(d)
        cwde                                            ; 0BC0 _ 98
        sub     eax, 16                                 ; 0BC1 _ 83. E8, 10
        mov     dword [mouse_y], eax                    ; 0BC4 _ A3, 00000124(d)
?_037:  pop     ebp                                     ; 0BC9 _ 5D
        ret                                             ; 0BCA _ C3
; compute_mouse_position End of function

draw_mouse:; Function begin
        push    ebp                                     ; 0BCB _ 55
        mov     ebp, esp                                ; 0BCC _ 89. E5
        sub     esp, 44                                 ; 0BCE _ 83. EC, 2C
        mov     eax, dword [screen_info]                ; 0BD1 _ A1, 00000000(d)
        mov     dword [ebp-8H], eax                     ; 0BD6 _ 89. 45, F8
        movzx   eax, word [?_095]                       ; 0BD9 _ 0F B7. 05, 00000004(d)
        cwde                                            ; 0BE0 _ 98
        mov     dword [ebp-4H], eax                     ; 0BE1 _ 89. 45, FC
        mov     edx, dword [mouse_y]                    ; 0BE4 _ 8B. 15, 00000124(d)
        mov     eax, dword [mouse_x]                    ; 0BEA _ A1, 00000120(d)
        mov     dword [esp+18H], mouse_cursor_buf       ; 0BEF _ C7. 44 24, 18, 00000020(d)
        mov     dword [esp+14H], 16                     ; 0BF7 _ C7. 44 24, 14, 00000010
        mov     dword [esp+10H], 16                     ; 0BFF _ C7. 44 24, 10, 00000010
        mov     dword [esp+0CH], edx                    ; 0C07 _ 89. 54 24, 0C
        mov     dword [esp+8H], eax                     ; 0C0B _ 89. 44 24, 08
        mov     eax, dword [ebp-4H]                     ; 0C0F _ 8B. 45, FC
        mov     dword [esp+4H], eax                     ; 0C12 _ 89. 44 24, 04
        mov     eax, dword [ebp-8H]                     ; 0C16 _ 8B. 45, F8
        mov     dword [esp], eax                        ; 0C19 _ 89. 04 24
        call    paint_block                             ; 0C1C _ E8, FFFFFFFC(rel)
        leave                                           ; 0C21 _ C9
        ret                                             ; 0C22 _ C3
; draw_mouse End of function

show_mouse_info:; Function begin
        push    ebp                                     ; 0C23 _ 55
        mov     ebp, esp                                ; 0C24 _ 89. E5
        sub     esp, 40                                 ; 0C26 _ 83. EC, 28
        mov     byte [ebp-9H], 0                        ; 0C29 _ C6. 45, F7, 00
        call    io_sti                                  ; 0C2D _ E8, FFFFFFFC(rel)
        mov     dword [esp], mouseinfo                  ; 0C32 _ C7. 04 24, 00000000(d)
        call    fifo8_get                               ; 0C39 _ E8, FFFFFFFC(rel)
        mov     byte [ebp-9H], al                       ; 0C3E _ 88. 45, F7
        movzx   eax, byte [ebp-9H]                      ; 0C41 _ 0F B6. 45, F7
        mov     dword [esp+4H], eax                     ; 0C45 _ 89. 44 24, 04
        mov     dword [esp], mouse_send_info            ; 0C49 _ C7. 04 24, 00000000(d)
        call    mouse_decode                            ; 0C50 _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 0C55 _ 85. C0
        jz      ?_038                                   ; 0C57 _ 74, 16
        call    eraser_mouse                            ; 0C59 _ E8, FFFFFFFC(rel)
        mov     dword [esp], mouse_send_info            ; 0C5E _ C7. 04 24, 00000000(d)
        call    compute_mouse_position                  ; 0C65 _ E8, FFFFFFFC(rel)
        call    draw_mouse                              ; 0C6A _ E8, FFFFFFFC(rel)
?_038:  leave                                           ; 0C6F _ C9
        ret                                             ; 0C70 _ C3
; show_mouse_info End of function

wait_KBC_sendready:; Function begin
        push    ebp                                     ; 0C71 _ 55
        mov     ebp, esp                                ; 0C72 _ 89. E5
        sub     esp, 24                                 ; 0C74 _ 83. EC, 18
?_039:  mov     dword [esp], 100                        ; 0C77 _ C7. 04 24, 00000064
        call    io_in8                                  ; 0C7E _ E8, FFFFFFFC(rel)
        and     eax, 02H                                ; 0C83 _ 83. E0, 02
        test    eax, eax                                ; 0C86 _ 85. C0
        jnz     ?_040                                   ; 0C88 _ 75, 02
        jmp     ?_041                                   ; 0C8A _ EB, 02

?_040:  jmp     ?_039                                   ; 0C8C _ EB, E9

?_041:  leave                                           ; 0C8E _ C9
        ret                                             ; 0C8F _ C3
; wait_KBC_sendready End of function

init_keyboard:; Function begin
        push    ebp                                     ; 0C90 _ 55
        mov     ebp, esp                                ; 0C91 _ 89. E5
        sub     esp, 24                                 ; 0C93 _ 83. EC, 18
        call    wait_KBC_sendready                      ; 0C96 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 96                      ; 0C9B _ C7. 44 24, 04, 00000060
        mov     dword [esp], 100                        ; 0CA3 _ C7. 04 24, 00000064
        call    io_out8                                 ; 0CAA _ E8, FFFFFFFC(rel)
        call    wait_KBC_sendready                      ; 0CAF _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 71                      ; 0CB4 _ C7. 44 24, 04, 00000047
        mov     dword [esp], 96                         ; 0CBC _ C7. 04 24, 00000060
        call    io_out8                                 ; 0CC3 _ E8, FFFFFFFC(rel)
        leave                                           ; 0CC8 _ C9
        ret                                             ; 0CC9 _ C3
; init_keyboard End of function

enable_mouse:; Function begin
        push    ebp                                     ; 0CCA _ 55
        mov     ebp, esp                                ; 0CCB _ 89. E5
        sub     esp, 24                                 ; 0CCD _ 83. EC, 18
        call    wait_KBC_sendready                      ; 0CD0 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 212                     ; 0CD5 _ C7. 44 24, 04, 000000D4
        mov     dword [esp], 100                        ; 0CDD _ C7. 04 24, 00000064
        call    io_out8                                 ; 0CE4 _ E8, FFFFFFFC(rel)
        call    wait_KBC_sendready                      ; 0CE9 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 244                     ; 0CEE _ C7. 44 24, 04, 000000F4
        mov     dword [esp], 96                         ; 0CF6 _ C7. 04 24, 00000060
        call    io_out8                                 ; 0CFD _ E8, FFFFFFFC(rel)
        leave                                           ; 0D02 _ C9
        ret                                             ; 0D03 _ C3
; enable_mouse End of function

mouse_decode:; Function begin
        push    ebp                                     ; 0D04 _ 55
        mov     ebp, esp                                ; 0D05 _ 89. E5
        sub     esp, 4                                  ; 0D07 _ 83. EC, 04
        mov     eax, dword [ebp+0CH]                    ; 0D0A _ 8B. 45, 0C
        mov     byte [ebp-4H], al                       ; 0D0D _ 88. 45, FC
        mov     eax, dword [ebp+8H]                     ; 0D10 _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 0D13 _ 0F B6. 40, 03
        test    al, al                                  ; 0D17 _ 84. C0
        jnz     ?_043                                   ; 0D19 _ 75, 17
        cmp     byte [ebp-4H], -6                       ; 0D1B _ 80. 7D, FC, FA
        jnz     ?_042                                   ; 0D1F _ 75, 07
        mov     eax, dword [ebp+8H]                     ; 0D21 _ 8B. 45, 08
        mov     byte [eax+3H], 1                        ; 0D24 _ C6. 40, 03, 01
?_042:  mov     eax, 0                                  ; 0D28 _ B8, 00000000
        jmp     ?_050                                   ; 0D2D _ E9, 0000010F

?_043:  mov     eax, dword [ebp+8H]                     ; 0D32 _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 0D35 _ 0F B6. 40, 03
        cmp     al, 1                                   ; 0D39 _ 3C, 01
        jnz     ?_045                                   ; 0D3B _ 75, 28
        movzx   eax, byte [ebp-4H]                      ; 0D3D _ 0F B6. 45, FC
        and     eax, 0C8H                               ; 0D41 _ 25, 000000C8
        cmp     eax, 8                                  ; 0D46 _ 83. F8, 08
        jnz     ?_044                                   ; 0D49 _ 75, 10
        mov     eax, dword [ebp+8H]                     ; 0D4B _ 8B. 45, 08
        movzx   edx, byte [ebp-4H]                      ; 0D4E _ 0F B6. 55, FC
        mov     byte [eax], dl                          ; 0D52 _ 88. 10
        mov     eax, dword [ebp+8H]                     ; 0D54 _ 8B. 45, 08
        mov     byte [eax+3H], 2                        ; 0D57 _ C6. 40, 03, 02
?_044:  mov     eax, 0                                  ; 0D5B _ B8, 00000000
        jmp     ?_050                                   ; 0D60 _ E9, 000000DC

?_045:  mov     eax, dword [ebp+8H]                     ; 0D65 _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 0D68 _ 0F B6. 40, 03
        cmp     al, 2                                   ; 0D6C _ 3C, 02
        jnz     ?_046                                   ; 0D6E _ 75, 1B
        mov     eax, dword [ebp+8H]                     ; 0D70 _ 8B. 45, 08
        movzx   edx, byte [ebp-4H]                      ; 0D73 _ 0F B6. 55, FC
        mov     byte [eax+1H], dl                       ; 0D77 _ 88. 50, 01
        mov     eax, dword [ebp+8H]                     ; 0D7A _ 8B. 45, 08
        mov     byte [eax+3H], 3                        ; 0D7D _ C6. 40, 03, 03
        mov     eax, 0                                  ; 0D81 _ B8, 00000000
        jmp     ?_050                                   ; 0D86 _ E9, 000000B6

?_046:  mov     eax, dword [ebp+8H]                     ; 0D8B _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 0D8E _ 0F B6. 40, 03
        cmp     al, 3                                   ; 0D92 _ 3C, 03
        jne     ?_049                                   ; 0D94 _ 0F 85, 000000A2
        mov     eax, dword [ebp+8H]                     ; 0D9A _ 8B. 45, 08
        movzx   edx, byte [ebp-4H]                      ; 0D9D _ 0F B6. 55, FC
        mov     byte [eax+2H], dl                       ; 0DA1 _ 88. 50, 02
        mov     eax, dword [ebp+8H]                     ; 0DA4 _ 8B. 45, 08
        mov     byte [eax+3H], 1                        ; 0DA7 _ C6. 40, 03, 01
        mov     eax, dword [ebp+8H]                     ; 0DAB _ 8B. 45, 08
        movzx   eax, byte [eax]                         ; 0DAE _ 0F B6. 00
        movzx   eax, al                                 ; 0DB1 _ 0F B6. C0
        and     eax, 07H                                ; 0DB4 _ 83. E0, 07
        mov     edx, eax                                ; 0DB7 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0DB9 _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 0DBC _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 0DBF _ 8B. 45, 08
        movzx   eax, byte [eax+1H]                      ; 0DC2 _ 0F B6. 40, 01
        movzx   edx, al                                 ; 0DC6 _ 0F B6. D0
        mov     eax, dword [ebp+8H]                     ; 0DC9 _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 0DCC _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 0DCF _ 8B. 45, 08
        movzx   eax, byte [eax+2H]                      ; 0DD2 _ 0F B6. 40, 02
        movzx   edx, al                                 ; 0DD6 _ 0F B6. D0
        mov     eax, dword [ebp+8H]                     ; 0DD9 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 0DDC _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 0DDF _ 8B. 45, 08
        movzx   eax, byte [eax]                         ; 0DE2 _ 0F B6. 00
        movzx   eax, al                                 ; 0DE5 _ 0F B6. C0
        and     eax, 10H                                ; 0DE8 _ 83. E0, 10
        test    eax, eax                                ; 0DEB _ 85. C0
        jz      ?_047                                   ; 0DED _ 74, 13
        mov     eax, dword [ebp+8H]                     ; 0DEF _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 0DF2 _ 8B. 40, 04
        or      eax, 0FFFFFF00H                         ; 0DF5 _ 0D, FFFFFF00
        mov     edx, eax                                ; 0DFA _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0DFC _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 0DFF _ 89. 50, 04
?_047:  mov     eax, dword [ebp+8H]                     ; 0E02 _ 8B. 45, 08
        movzx   eax, byte [eax]                         ; 0E05 _ 0F B6. 00
        movzx   eax, al                                 ; 0E08 _ 0F B6. C0
        and     eax, 20H                                ; 0E0B _ 83. E0, 20
        test    eax, eax                                ; 0E0E _ 85. C0
        jz      ?_048                                   ; 0E10 _ 74, 13
        mov     eax, dword [ebp+8H]                     ; 0E12 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 0E15 _ 8B. 40, 08
        or      eax, 0FFFFFF00H                         ; 0E18 _ 0D, FFFFFF00
        mov     edx, eax                                ; 0E1D _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0E1F _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 0E22 _ 89. 50, 08
?_048:  mov     eax, dword [ebp+8H]                     ; 0E25 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 0E28 _ 8B. 40, 08
        neg     eax                                     ; 0E2B _ F7. D8
        mov     edx, eax                                ; 0E2D _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0E2F _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 0E32 _ 89. 50, 08
        mov     eax, 1                                  ; 0E35 _ B8, 00000001
        jmp     ?_050                                   ; 0E3A _ EB, 05

?_049:  mov     eax, 4294967295                         ; 0E3C _ B8, FFFFFFFF
?_050:  leave                                           ; 0E41 _ C9
        ret                                             ; 0E42 _ C3
; mouse_decode End of function

intHandlerKeyboard:; Function begin
        push    ebp                                     ; 0E43 _ 55
        mov     ebp, esp                                ; 0E44 _ 89. E5
        sub     esp, 40                                 ; 0E46 _ 83. EC, 28
        mov     dword [esp+4H], 32                      ; 0E49 _ C7. 44 24, 04, 00000020
        mov     dword [esp], 32                         ; 0E51 _ C7. 04 24, 00000020
        call    io_out8                                 ; 0E58 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 32                      ; 0E5D _ C7. 44 24, 04, 00000020
        mov     dword [esp], 160                        ; 0E65 _ C7. 04 24, 000000A0
        call    io_out8                                 ; 0E6C _ E8, FFFFFFFC(rel)
        mov     dword [esp], 96                         ; 0E71 _ C7. 04 24, 00000060
        call    io_in8                                  ; 0E78 _ E8, FFFFFFFC(rel)
        mov     byte [ebp-9H], al                       ; 0E7D _ 88. 45, F7
        movzx   eax, byte [ebp-9H]                      ; 0E80 _ 0F B6. 45, F7
        mov     dword [esp+4H], eax                     ; 0E84 _ 89. 44 24, 04
        mov     dword [esp], keyinfo                    ; 0E88 _ C7. 04 24, 00000000(d)
        call    fifo8_put                               ; 0E8F _ E8, FFFFFFFC(rel)
        leave                                           ; 0E94 _ C9
        ret                                             ; 0E95 _ C3
; intHandlerKeyboard End of function

intHandlerMouse:; Function begin
        push    ebp                                     ; 0E96 _ 55
        mov     ebp, esp                                ; 0E97 _ 89. E5
        sub     esp, 40                                 ; 0E99 _ 83. EC, 28
        mov     dword [esp+4H], 32                      ; 0E9C _ C7. 44 24, 04, 00000020
        mov     dword [esp], 32                         ; 0EA4 _ C7. 04 24, 00000020
        call    io_out8                                 ; 0EAB _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 32                      ; 0EB0 _ C7. 44 24, 04, 00000020
        mov     dword [esp], 160                        ; 0EB8 _ C7. 04 24, 000000A0
        call    io_out8                                 ; 0EBF _ E8, FFFFFFFC(rel)
        mov     dword [esp], 96                         ; 0EC4 _ C7. 04 24, 00000060
        call    io_in8                                  ; 0ECB _ E8, FFFFFFFC(rel)
        mov     byte [ebp-9H], al                       ; 0ED0 _ 88. 45, F7
        movzx   eax, byte [ebp-9H]                      ; 0ED3 _ 0F B6. 45, F7
        mov     dword [esp+4H], eax                     ; 0ED7 _ 89. 44 24, 04
        mov     dword [esp], mouseinfo                  ; 0EDB _ C7. 04 24, 00000000(d)
        call    fifo8_put                               ; 0EE2 _ E8, FFFFFFFC(rel)
        leave                                           ; 0EE7 _ C9
        ret                                             ; 0EE8 _ C3
; intHandlerMouse End of function

fifo8_init:; Function begin
        push    ebp                                     ; 0EE9 _ 55
        mov     ebp, esp                                ; 0EEA _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 0EEC _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 0EEF _ 8B. 55, 10
        mov     dword [eax], edx                        ; 0EF2 _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 0EF4 _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 0EF7 _ C7. 40, 04, 00000000
        mov     eax, dword [ebp+8H]                     ; 0EFE _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 0F01 _ C7. 40, 08, 00000000
        mov     eax, dword [ebp+8H]                     ; 0F08 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 0F0B _ 8B. 55, 0C
        mov     dword [eax+0CH], edx                    ; 0F0E _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 0F11 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 0F14 _ 8B. 55, 0C
        mov     dword [eax+10H], edx                    ; 0F17 _ 89. 50, 10
        mov     eax, dword [ebp+8H]                     ; 0F1A _ 8B. 45, 08
        mov     dword [eax+14H], 0                      ; 0F1D _ C7. 40, 14, 00000000
        pop     ebp                                     ; 0F24 _ 5D
        ret                                             ; 0F25 _ C3
; fifo8_init End of function

fifo8_put:; Function begin
        push    ebp                                     ; 0F26 _ 55
        mov     ebp, esp                                ; 0F27 _ 89. E5
        sub     esp, 20                                 ; 0F29 _ 83. EC, 14
        mov     eax, dword [ebp+0CH]                    ; 0F2C _ 8B. 45, 0C
        mov     byte [ebp-14H], al                      ; 0F2F _ 88. 45, EC
        mov     eax, dword [ebp+8H]                     ; 0F32 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 0F35 _ 8B. 40, 10
        test    eax, eax                                ; 0F38 _ 85. C0
        jnz     ?_051                                   ; 0F3A _ 75, 18
        mov     eax, dword [ebp+8H]                     ; 0F3C _ 8B. 45, 08
        mov     eax, dword [eax+14H]                    ; 0F3F _ 8B. 40, 14
        or      eax, 01H                                ; 0F42 _ 83. C8, 01
        mov     edx, eax                                ; 0F45 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0F47 _ 8B. 45, 08
        mov     dword [eax+14H], edx                    ; 0F4A _ 89. 50, 14
        mov     eax, 4294967295                         ; 0F4D _ B8, FFFFFFFF
        jmp     ?_053                                   ; 0F52 _ EB, 56

?_051:  mov     eax, dword [ebp+8H]                     ; 0F54 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 0F57 _ 8B. 40, 04
        mov     dword [ebp-4H], eax                     ; 0F5A _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 0F5D _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 0F60 _ 8B. 10
        mov     eax, dword [ebp-4H]                     ; 0F62 _ 8B. 45, FC
        add     edx, eax                                ; 0F65 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0F67 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0F6B _ 88. 02
        mov     eax, dword [ebp+8H]                     ; 0F6D _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 0F70 _ 8B. 40, 04
        lea     edx, [eax+1H]                           ; 0F73 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 0F76 _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 0F79 _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 0F7C _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 0F7F _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 0F82 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 0F85 _ 8B. 40, 0C
        cmp     edx, eax                                ; 0F88 _ 39. C2
        jnz     ?_052                                   ; 0F8A _ 75, 0A
        mov     eax, dword [ebp+8H]                     ; 0F8C _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 0F8F _ C7. 40, 04, 00000000
?_052:  mov     eax, dword [ebp+8H]                     ; 0F96 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 0F99 _ 8B. 40, 10
        lea     edx, [eax-1H]                           ; 0F9C _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 0F9F _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 0FA2 _ 89. 50, 10
        mov     eax, 0                                  ; 0FA5 _ B8, 00000000
?_053:  leave                                           ; 0FAA _ C9
        ret                                             ; 0FAB _ C3
; fifo8_put End of function

fifo8_get:; Function begin
        push    ebp                                     ; 0FAC _ 55
        mov     ebp, esp                                ; 0FAD _ 89. E5
        sub     esp, 16                                 ; 0FAF _ 83. EC, 10
        mov     eax, dword [ebp+8H]                     ; 0FB2 _ 8B. 45, 08
        mov     edx, dword [eax+10H]                    ; 0FB5 _ 8B. 50, 10
        mov     eax, dword [ebp+8H]                     ; 0FB8 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 0FBB _ 8B. 40, 0C
        cmp     edx, eax                                ; 0FBE _ 39. C2
        jnz     ?_054                                   ; 0FC0 _ 75, 11
        mov     eax, dword [ebp+8H]                     ; 0FC2 _ 8B. 45, 08
        mov     dword [eax+14H], 0                      ; 0FC5 _ C7. 40, 14, 00000000
        mov     eax, 4294967295                         ; 0FCC _ B8, FFFFFFFF
        jmp     ?_056                                   ; 0FD1 _ EB, 57

?_054:  mov     eax, dword [ebp+8H]                     ; 0FD3 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 0FD6 _ 8B. 40, 08
        mov     dword [ebp-8H], eax                     ; 0FD9 _ 89. 45, F8
        mov     eax, dword [ebp+8H]                     ; 0FDC _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 0FDF _ 8B. 10
        mov     eax, dword [ebp-8H]                     ; 0FE1 _ 8B. 45, F8
        add     eax, edx                                ; 0FE4 _ 01. D0
        movzx   eax, byte [eax]                         ; 0FE6 _ 0F B6. 00
        movzx   eax, al                                 ; 0FE9 _ 0F B6. C0
        mov     dword [ebp-4H], eax                     ; 0FEC _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 0FEF _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 0FF2 _ 8B. 40, 08
        lea     edx, [eax+1H]                           ; 0FF5 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 0FF8 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 0FFB _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 0FFE _ 8B. 45, 08
        mov     edx, dword [eax+8H]                     ; 1001 _ 8B. 50, 08
        mov     eax, dword [ebp+8H]                     ; 1004 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 1007 _ 8B. 40, 0C
        cmp     edx, eax                                ; 100A _ 39. C2
        jnz     ?_055                                   ; 100C _ 75, 0A
        mov     eax, dword [ebp+8H]                     ; 100E _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 1011 _ C7. 40, 08, 00000000
?_055:  mov     eax, dword [ebp+8H]                     ; 1018 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 101B _ 8B. 40, 10
        lea     edx, [eax+1H]                           ; 101E _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 1021 _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 1024 _ 89. 50, 10
        mov     eax, dword [ebp-4H]                     ; 1027 _ 8B. 45, FC
?_056:  leave                                           ; 102A _ C9
        ret                                             ; 102B _ C3
; fifo8_get End of function

fifo8_status:; Function begin
        push    ebp                                     ; 102C _ 55
        mov     ebp, esp                                ; 102D _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 102F _ 8B. 45, 08
        mov     edx, dword [eax+0CH]                    ; 1032 _ 8B. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 1035 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 1038 _ 8B. 40, 10
        sub     edx, eax                                ; 103B _ 29. C2
        mov     eax, edx                                ; 103D _ 89. D0
        pop     ebp                                     ; 103F _ 5D
        ret                                             ; 1040 _ C3
; fifo8_status End of function

charToHexVal:; Function begin
        push    ebp                                     ; 1041 _ 55
        mov     ebp, esp                                ; 1042 _ 89. E5
        sub     esp, 4                                  ; 1044 _ 83. EC, 04
        mov     eax, dword [ebp+8H]                     ; 1047 _ 8B. 45, 08
        mov     byte [ebp-4H], al                       ; 104A _ 88. 45, FC
        cmp     byte [ebp-4H], 9                        ; 104D _ 80. 7D, FC, 09
        jle     ?_057                                   ; 1051 _ 7E, 09
        movzx   eax, byte [ebp-4H]                      ; 1053 _ 0F B6. 45, FC
        add     eax, 55                                 ; 1057 _ 83. C0, 37
        jmp     ?_058                                   ; 105A _ EB, 07

?_057:  movzx   eax, byte [ebp-4H]                      ; 105C _ 0F B6. 45, FC
        add     eax, 48                                 ; 1060 _ 83. C0, 30
?_058:  leave                                           ; 1063 _ C9
        ret                                             ; 1064 _ C3
; charToHexVal End of function

charToHexStr:; Function begin
        push    ebp                                     ; 1065 _ 55
        mov     ebp, esp                                ; 1066 _ 89. E5
        sub     esp, 24                                 ; 1068 _ 83. EC, 18
        mov     eax, dword [ebp+8H]                     ; 106B _ 8B. 45, 08
        mov     byte [ebp-14H], al                      ; 106E _ 88. 45, EC
        mov     dword [ebp-4H], 0                       ; 1071 _ C7. 45, FC, 00000000
        movzx   eax, byte [ebp-14H]                     ; 1078 _ 0F B6. 45, EC
        and     eax, 0FH                                ; 107C _ 83. E0, 0F
        mov     byte [ebp-5H], al                       ; 107F _ 88. 45, FB
        movsx   eax, byte [ebp-5H]                      ; 1082 _ 0F BE. 45, FB
        mov     dword [esp], eax                        ; 1086 _ 89. 04 24
        call    charToHexVal                            ; 1089 _ E8, FFFFFFFC(rel)
        mov     byte [?_094], al                        ; 108E _ A2, 00000143(d)
        movzx   eax, byte [ebp-14H]                     ; 1093 _ 0F B6. 45, EC
        shr     al, 4                                   ; 1097 _ C0. E8, 04
        mov     byte [ebp-14H], al                      ; 109A _ 88. 45, EC
        movzx   eax, byte [ebp-14H]                     ; 109D _ 0F B6. 45, EC
        movsx   eax, al                                 ; 10A1 _ 0F BE. C0
        mov     dword [esp], eax                        ; 10A4 _ 89. 04 24
        call    charToHexVal                            ; 10A7 _ E8, FFFFFFFC(rel)
        mov     byte [?_093], al                        ; 10AC _ A2, 00000142(d)
        mov     eax, keyval                             ; 10B1 _ B8, 00000140(d)
        leave                                           ; 10B6 _ C9
        ret                                             ; 10B7 _ C3
; charToHexStr End of function

intToHexStr:; Function begin
        push    ebp                                     ; 10B8 _ 55
        mov     ebp, esp                                ; 10B9 _ 89. E5
        sub     esp, 16                                 ; 10BB _ 83. EC, 10
        mov     byte [str.1386], 48                     ; 10BE _ C6. 05, 00000220(d), 30
        mov     byte [?_097], 88                        ; 10C5 _ C6. 05, 00000221(d), 58
        mov     byte [?_098], 0                         ; 10CC _ C6. 05, 0000022A(d), 00
        mov     dword [ebp-0CH], 2                      ; 10D3 _ C7. 45, F4, 00000002
        jmp     ?_060                                   ; 10DA _ EB, 0F

?_059:  mov     eax, dword [ebp-0CH]                    ; 10DC _ 8B. 45, F4
        add     eax, str.1386                           ; 10DF _ 05, 00000220(d)
        mov     byte [eax], 48                          ; 10E4 _ C6. 00, 30
        add     dword [ebp-0CH], 1                      ; 10E7 _ 83. 45, F4, 01
?_060:  cmp     dword [ebp-0CH], 9                      ; 10EB _ 83. 7D, F4, 09
        jle     ?_059                                   ; 10EF _ 7E, EB
        mov     dword [ebp-8H], 9                       ; 10F1 _ C7. 45, F8, 00000009
        jmp     ?_064                                   ; 10F8 _ EB, 40

?_061:  mov     eax, dword [ebp+8H]                     ; 10FA _ 8B. 45, 08
        and     eax, 0FH                                ; 10FD _ 83. E0, 0F
        mov     dword [ebp-4H], eax                     ; 1100 _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 1103 _ 8B. 45, 08
        shr     eax, 4                                  ; 1106 _ C1. E8, 04
        mov     dword [ebp+8H], eax                     ; 1109 _ 89. 45, 08
        cmp     dword [ebp-4H], 9                       ; 110C _ 83. 7D, FC, 09
        jle     ?_062                                   ; 1110 _ 7E, 13
        mov     eax, dword [ebp-4H]                     ; 1112 _ 8B. 45, FC
        add     eax, 55                                 ; 1115 _ 83. C0, 37
        mov     edx, dword [ebp-8H]                     ; 1118 _ 8B. 55, F8
        add     edx, str.1386                           ; 111B _ 81. C2, 00000220(d)
        mov     byte [edx], al                          ; 1121 _ 88. 02
        jmp     ?_063                                   ; 1123 _ EB, 11

?_062:  mov     eax, dword [ebp-4H]                     ; 1125 _ 8B. 45, FC
        add     eax, 48                                 ; 1128 _ 83. C0, 30
        mov     edx, dword [ebp-8H]                     ; 112B _ 8B. 55, F8
        add     edx, str.1386                           ; 112E _ 81. C2, 00000220(d)
        mov     byte [edx], al                          ; 1134 _ 88. 02
?_063:  sub     dword [ebp-8H], 1                       ; 1136 _ 83. 6D, F8, 01
?_064:  cmp     dword [ebp-8H], 1                       ; 113A _ 83. 7D, F8, 01
        jle     ?_065                                   ; 113E _ 7E, 06
        cmp     dword [ebp+8H], 0                       ; 1140 _ 83. 7D, 08, 00
        jnz     ?_061                                   ; 1144 _ 75, B4
?_065:  mov     eax, str.1386                           ; 1146 _ B8, 00000220(d)
        leave                                           ; 114B _ C9
        ret                                             ; 114C _ C3
; intToHexStr End of function

show_memory_info:; Function begin
        push    ebp                                     ; 114D _ 55
        mov     ebp, esp                                ; 114E _ 89. E5
        sub     esp, 88                                 ; 1150 _ 83. EC, 58
        mov     dword [ebp-38H], 0                      ; 1153 _ C7. 45, C8, 00000000
        mov     dword [ebp-34H], 0                      ; 115A _ C7. 45, CC, 00000000
        mov     dword [ebp-30H], 104                    ; 1161 _ C7. 45, D0, 00000068
        mov     eax, dword [screen_info]                ; 1168 _ A1, 00000000(d)
        mov     dword [ebp-2CH], eax                    ; 116D _ 89. 45, D4
        movzx   eax, word [screen_info+4H]              ; 1170 _ 0F B7. 05, 00000004(d)
        cwde                                            ; 1177 _ 98
        mov     dword [ebp-28H], eax                    ; 1178 _ 89. 45, D8
        movzx   eax, word [screen_info+6H]              ; 117B _ 0F B7. 05, 00000006(d)
        cwde                                            ; 1182 _ 98
        mov     dword [ebp-24H], eax                    ; 1183 _ 89. 45, DC
        mov     eax, dword [ebp-24H]                    ; 1186 _ 8B. 45, DC
        mov     dword [esp+8H], eax                     ; 1189 _ 89. 44 24, 08
        mov     eax, dword [ebp-28H]                    ; 118D _ 8B. 45, D8
        mov     dword [esp+4H], eax                     ; 1190 _ 89. 44 24, 04
        mov     eax, dword [ebp-2CH]                    ; 1194 _ 8B. 45, D4
        mov     dword [esp], eax                        ; 1197 _ 89. 04 24
        call    init_desktop                            ; 119A _ E8, FFFFFFFC(rel)
        mov     dword [esp+14H], 7                      ; 119F _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_087                  ; 11A7 _ C7. 44 24, 10, 00000013(d)
        mov     eax, dword [ebp-34H]                    ; 11AF _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 11B2 _ 89. 44 24, 0C
        mov     eax, dword [ebp-38H]                    ; 11B6 _ 8B. 45, C8
        mov     dword [esp+8H], eax                     ; 11B9 _ 89. 44 24, 08
        mov     eax, dword [ebp-28H]                    ; 11BD _ 8B. 45, D8
        mov     dword [esp+4H], eax                     ; 11C0 _ 89. 44 24, 04
        mov     eax, dword [ebp-2CH]                    ; 11C4 _ 8B. 45, D4
        mov     dword [esp], eax                        ; 11C7 _ 89. 04 24
        call    paint_string                            ; 11CA _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+0CH]                    ; 11CF _ 8B. 45, 0C
        mov     dword [esp], eax                        ; 11D2 _ 89. 04 24
        call    intToHexStr                             ; 11D5 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-20H], eax                    ; 11DA _ 89. 45, E0
        mov     dword [esp+14H], 7                      ; 11DD _ C7. 44 24, 14, 00000007
        mov     eax, dword [ebp-20H]                    ; 11E5 _ 8B. 45, E0
        mov     dword [esp+10H], eax                    ; 11E8 _ 89. 44 24, 10
        mov     eax, dword [ebp-34H]                    ; 11EC _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 11EF _ 89. 44 24, 0C
        mov     eax, dword [ebp-30H]                    ; 11F3 _ 8B. 45, D0
        mov     dword [esp+8H], eax                     ; 11F6 _ 89. 44 24, 08
        mov     eax, dword [ebp-28H]                    ; 11FA _ 8B. 45, D8
        mov     dword [esp+4H], eax                     ; 11FD _ 89. 44 24, 04
        mov     eax, dword [ebp-2CH]                    ; 1201 _ 8B. 45, D4
        mov     dword [esp], eax                        ; 1204 _ 89. 04 24
        call    paint_string                            ; 1207 _ E8, FFFFFFFC(rel)
        add     dword [ebp-34H], 16                     ; 120C _ 83. 45, CC, 10
        mov     dword [esp+14H], 7                      ; 1210 _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_088                  ; 1218 _ C7. 44 24, 10, 0000001D(d)
        mov     eax, dword [ebp-34H]                    ; 1220 _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 1223 _ 89. 44 24, 0C
        mov     eax, dword [ebp-38H]                    ; 1227 _ 8B. 45, C8
        mov     dword [esp+8H], eax                     ; 122A _ 89. 44 24, 08
        mov     eax, dword [ebp-28H]                    ; 122E _ 8B. 45, D8
        mov     dword [esp+4H], eax                     ; 1231 _ 89. 44 24, 04
        mov     eax, dword [ebp-2CH]                    ; 1235 _ 8B. 45, D4
        mov     dword [esp], eax                        ; 1238 _ 89. 04 24
        call    paint_string                            ; 123B _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 1240 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1243 _ 8B. 00
        mov     dword [esp], eax                        ; 1245 _ 89. 04 24
        call    intToHexStr                             ; 1248 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-1CH], eax                    ; 124D _ 89. 45, E4
        mov     dword [esp+14H], 7                      ; 1250 _ C7. 44 24, 14, 00000007
        mov     eax, dword [ebp-1CH]                    ; 1258 _ 8B. 45, E4
        mov     dword [esp+10H], eax                    ; 125B _ 89. 44 24, 10
        mov     eax, dword [ebp-34H]                    ; 125F _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 1262 _ 89. 44 24, 0C
        mov     eax, dword [ebp-30H]                    ; 1266 _ 8B. 45, D0
        mov     dword [esp+8H], eax                     ; 1269 _ 89. 44 24, 08
        mov     eax, dword [ebp-28H]                    ; 126D _ 8B. 45, D8
        mov     dword [esp+4H], eax                     ; 1270 _ 89. 44 24, 04
        mov     eax, dword [ebp-2CH]                    ; 1274 _ 8B. 45, D4
        mov     dword [esp], eax                        ; 1277 _ 89. 04 24
        call    paint_string                            ; 127A _ E8, FFFFFFFC(rel)
        add     dword [ebp-34H], 16                     ; 127F _ 83. 45, CC, 10
        mov     dword [esp+14H], 7                      ; 1283 _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_089                  ; 128B _ C7. 44 24, 10, 00000029(d)
        mov     eax, dword [ebp-34H]                    ; 1293 _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 1296 _ 89. 44 24, 0C
        mov     eax, dword [ebp-38H]                    ; 129A _ 8B. 45, C8
        mov     dword [esp+8H], eax                     ; 129D _ 89. 44 24, 08
        mov     eax, dword [ebp-28H]                    ; 12A1 _ 8B. 45, D8
        mov     dword [esp+4H], eax                     ; 12A4 _ 89. 44 24, 04
        mov     eax, dword [ebp-2CH]                    ; 12A8 _ 8B. 45, D4
        mov     dword [esp], eax                        ; 12AB _ 89. 04 24
        call    paint_string                            ; 12AE _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 12B3 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 12B6 _ 8B. 40, 04
        mov     dword [esp], eax                        ; 12B9 _ 89. 04 24
        call    intToHexStr                             ; 12BC _ E8, FFFFFFFC(rel)
        mov     dword [ebp-18H], eax                    ; 12C1 _ 89. 45, E8
        mov     dword [esp+14H], 7                      ; 12C4 _ C7. 44 24, 14, 00000007
        mov     eax, dword [ebp-18H]                    ; 12CC _ 8B. 45, E8
        mov     dword [esp+10H], eax                    ; 12CF _ 89. 44 24, 10
        mov     eax, dword [ebp-34H]                    ; 12D3 _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 12D6 _ 89. 44 24, 0C
        mov     eax, dword [ebp-30H]                    ; 12DA _ 8B. 45, D0
        mov     dword [esp+8H], eax                     ; 12DD _ 89. 44 24, 08
        mov     eax, dword [ebp-28H]                    ; 12E1 _ 8B. 45, D8
        mov     dword [esp+4H], eax                     ; 12E4 _ 89. 44 24, 04
        mov     eax, dword [ebp-2CH]                    ; 12E8 _ 8B. 45, D4
        mov     dword [esp], eax                        ; 12EB _ 89. 04 24
        call    paint_string                            ; 12EE _ E8, FFFFFFFC(rel)
        add     dword [ebp-34H], 16                     ; 12F3 _ 83. 45, CC, 10
        mov     dword [esp+14H], 7                      ; 12F7 _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_090                  ; 12FF _ C7. 44 24, 10, 00000035(d)
        mov     eax, dword [ebp-34H]                    ; 1307 _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 130A _ 89. 44 24, 0C
        mov     eax, dword [ebp-38H]                    ; 130E _ 8B. 45, C8
        mov     dword [esp+8H], eax                     ; 1311 _ 89. 44 24, 08
        mov     eax, dword [ebp-28H]                    ; 1315 _ 8B. 45, D8
        mov     dword [esp+4H], eax                     ; 1318 _ 89. 44 24, 04
        mov     eax, dword [ebp-2CH]                    ; 131C _ 8B. 45, D4
        mov     dword [esp], eax                        ; 131F _ 89. 04 24
        call    paint_string                            ; 1322 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 1327 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 132A _ 8B. 40, 08
        mov     dword [esp], eax                        ; 132D _ 89. 04 24
        call    intToHexStr                             ; 1330 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-14H], eax                    ; 1335 _ 89. 45, EC
        mov     dword [esp+14H], 7                      ; 1338 _ C7. 44 24, 14, 00000007
        mov     eax, dword [ebp-14H]                    ; 1340 _ 8B. 45, EC
        mov     dword [esp+10H], eax                    ; 1343 _ 89. 44 24, 10
        mov     eax, dword [ebp-34H]                    ; 1347 _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 134A _ 89. 44 24, 0C
        mov     eax, dword [ebp-30H]                    ; 134E _ 8B. 45, D0
        mov     dword [esp+8H], eax                     ; 1351 _ 89. 44 24, 08
        mov     eax, dword [ebp-28H]                    ; 1355 _ 8B. 45, D8
        mov     dword [esp+4H], eax                     ; 1358 _ 89. 44 24, 04
        mov     eax, dword [ebp-2CH]                    ; 135C _ 8B. 45, D4
        mov     dword [esp], eax                        ; 135F _ 89. 04 24
        call    paint_string                            ; 1362 _ E8, FFFFFFFC(rel)
        add     dword [ebp-34H], 16                     ; 1367 _ 83. 45, CC, 10
        mov     dword [esp+14H], 7                      ; 136B _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_091                  ; 1373 _ C7. 44 24, 10, 00000041(d)
        mov     eax, dword [ebp-34H]                    ; 137B _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 137E _ 89. 44 24, 0C
        mov     eax, dword [ebp-38H]                    ; 1382 _ 8B. 45, C8
        mov     dword [esp+8H], eax                     ; 1385 _ 89. 44 24, 08
        mov     eax, dword [ebp-28H]                    ; 1389 _ 8B. 45, D8
        mov     dword [esp+4H], eax                     ; 138C _ 89. 44 24, 04
        mov     eax, dword [ebp-2CH]                    ; 1390 _ 8B. 45, D4
        mov     dword [esp], eax                        ; 1393 _ 89. 04 24
        call    paint_string                            ; 1396 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 139B _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 139E _ 8B. 40, 0C
        mov     dword [esp], eax                        ; 13A1 _ 89. 04 24
        call    intToHexStr                             ; 13A4 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 13A9 _ 89. 45, F0
        mov     dword [esp+14H], 7                      ; 13AC _ C7. 44 24, 14, 00000007
        mov     eax, dword [ebp-10H]                    ; 13B4 _ 8B. 45, F0
        mov     dword [esp+10H], eax                    ; 13B7 _ 89. 44 24, 10
        mov     eax, dword [ebp-34H]                    ; 13BB _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 13BE _ 89. 44 24, 0C
        mov     eax, dword [ebp-30H]                    ; 13C2 _ 8B. 45, D0
        mov     dword [esp+8H], eax                     ; 13C5 _ 89. 44 24, 08
        mov     eax, dword [ebp-28H]                    ; 13C9 _ 8B. 45, D8
        mov     dword [esp+4H], eax                     ; 13CC _ 89. 44 24, 04
        mov     eax, dword [ebp-2CH]                    ; 13D0 _ 8B. 45, D4
        mov     dword [esp], eax                        ; 13D3 _ 89. 04 24
        call    paint_string                            ; 13D6 _ E8, FFFFFFFC(rel)
        add     dword [ebp-34H], 16                     ; 13DB _ 83. 45, CC, 10
        mov     dword [esp+14H], 7                      ; 13DF _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_092                  ; 13E7 _ C7. 44 24, 10, 0000004E(d)
        mov     eax, dword [ebp-34H]                    ; 13EF _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 13F2 _ 89. 44 24, 0C
        mov     eax, dword [ebp-38H]                    ; 13F6 _ 8B. 45, C8
        mov     dword [esp+8H], eax                     ; 13F9 _ 89. 44 24, 08
        mov     eax, dword [ebp-28H]                    ; 13FD _ 8B. 45, D8
        mov     dword [esp+4H], eax                     ; 1400 _ 89. 44 24, 04
        mov     eax, dword [ebp-2CH]                    ; 1404 _ 8B. 45, D4
        mov     dword [esp], eax                        ; 1407 _ 89. 04 24
        call    paint_string                            ; 140A _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 140F _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 1412 _ 8B. 40, 10
        mov     dword [esp], eax                        ; 1415 _ 89. 04 24
        call    intToHexStr                             ; 1418 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 141D _ 89. 45, F4
        mov     dword [esp+14H], 7                      ; 1420 _ C7. 44 24, 14, 00000007
        mov     eax, dword [ebp-0CH]                    ; 1428 _ 8B. 45, F4
        mov     dword [esp+10H], eax                    ; 142B _ 89. 44 24, 10
        mov     eax, dword [ebp-34H]                    ; 142F _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 1432 _ 89. 44 24, 0C
        mov     eax, dword [ebp-30H]                    ; 1436 _ 8B. 45, D0
        mov     dword [esp+8H], eax                     ; 1439 _ 89. 44 24, 08
        mov     eax, dword [ebp-28H]                    ; 143D _ 8B. 45, D8
        mov     dword [esp+4H], eax                     ; 1440 _ 89. 44 24, 04
        mov     eax, dword [ebp-2CH]                    ; 1444 _ 8B. 45, D4
        mov     dword [esp], eax                        ; 1447 _ 89. 04 24
        call    paint_string                            ; 144A _ E8, FFFFFFFC(rel)
        add     dword [ebp-34H], 16                     ; 144F _ 83. 45, CC, 10
        leave                                           ; 1453 _ C9
        ret                                             ; 1454 _ C3
; show_memory_info End of function

memman_init:; Function begin
        push    ebp                                     ; 1455 _ 55
        mov     ebp, esp                                ; 1456 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 1458 _ 8B. 45, 08
        mov     dword [eax], 0                          ; 145B _ C7. 00, 00000000
        mov     eax, dword [ebp+8H]                     ; 1461 _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 1464 _ C7. 40, 04, 00000000
        mov     eax, dword [ebp+8H]                     ; 146B _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 146E _ C7. 40, 08, 00000000
        mov     eax, dword [ebp+8H]                     ; 1475 _ 8B. 45, 08
        mov     dword [eax+0CH], 0                      ; 1478 _ C7. 40, 0C, 00000000
        pop     ebp                                     ; 147F _ 5D
        ret                                             ; 1480 _ C3
; memman_init End of function

memman_total:; Function begin
        push    ebp                                     ; 1481 _ 55
        mov     ebp, esp                                ; 1482 _ 89. E5
        sub     esp, 16                                 ; 1484 _ 83. EC, 10
        mov     dword [ebp-4H], 0                       ; 1487 _ C7. 45, FC, 00000000
        mov     dword [ebp-8H], 0                       ; 148E _ C7. 45, F8, 00000000
        jmp     ?_067                                   ; 1495 _ EB, 14

?_066:  mov     eax, dword [ebp+8H]                     ; 1497 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 149A _ 8B. 55, F8
        add     edx, 2                                  ; 149D _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 14A0 _ 8B. 44 D0, 04
        add     dword [ebp-4H], eax                     ; 14A4 _ 01. 45, FC
        add     dword [ebp-8H], 1                       ; 14A7 _ 83. 45, F8, 01
?_067:  mov     eax, dword [ebp+8H]                     ; 14AB _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 14AE _ 8B. 00
        cmp     eax, dword [ebp-8H]                     ; 14B0 _ 3B. 45, F8
        ja      ?_066                                   ; 14B3 _ 77, E2
        mov     eax, dword [ebp-4H]                     ; 14B5 _ 8B. 45, FC
        leave                                           ; 14B8 _ C9
        ret                                             ; 14B9 _ C3
; memman_total End of function

memman_alloc:; Function begin
        push    ebp                                     ; 14BA _ 55
        mov     ebp, esp                                ; 14BB _ 89. E5
        sub     esp, 16                                 ; 14BD _ 83. EC, 10
        mov     dword [ebp-8H], 0                       ; 14C0 _ C7. 45, F8, 00000000
        jmp     ?_071                                   ; 14C7 _ E9, 00000085

?_068:  mov     eax, dword [ebp+8H]                     ; 14CC _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 14CF _ 8B. 55, F8
        add     edx, 2                                  ; 14D2 _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 14D5 _ 8B. 44 D0, 04
        cmp     eax, dword [ebp+0CH]                    ; 14D9 _ 3B. 45, 0C
        jc      ?_070                                   ; 14DC _ 72, 6F
        mov     eax, dword [ebp+8H]                     ; 14DE _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 14E1 _ 8B. 55, F8
        add     edx, 2                                  ; 14E4 _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 14E7 _ 8B. 04 D0
        mov     dword [ebp-4H], eax                     ; 14EA _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 14ED _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 14F0 _ 8B. 55, F8
        add     edx, 2                                  ; 14F3 _ 83. C2, 02
        mov     edx, dword [eax+edx*8]                  ; 14F6 _ 8B. 14 D0
        mov     eax, dword [ebp+0CH]                    ; 14F9 _ 8B. 45, 0C
        lea     ecx, [edx+eax]                          ; 14FC _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 14FF _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 1502 _ 8B. 55, F8
        add     edx, 2                                  ; 1505 _ 83. C2, 02
        mov     dword [eax+edx*8], ecx                  ; 1508 _ 89. 0C D0
        mov     eax, dword [ebp+8H]                     ; 150B _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 150E _ 8B. 55, F8
        add     edx, 2                                  ; 1511 _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 1514 _ 8B. 44 D0, 04
        sub     eax, dword [ebp+0CH]                    ; 1518 _ 2B. 45, 0C
        mov     edx, eax                                ; 151B _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 151D _ 8B. 45, 08
        mov     ecx, dword [ebp-8H]                     ; 1520 _ 8B. 4D, F8
        add     ecx, 2                                  ; 1523 _ 83. C1, 02
        mov     dword [eax+ecx*8+4H], edx               ; 1526 _ 89. 54 C8, 04
        mov     eax, dword [ebp+8H]                     ; 152A _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 152D _ 8B. 55, F8
        add     edx, 2                                  ; 1530 _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 1533 _ 8B. 44 D0, 04
        test    eax, eax                                ; 1537 _ 85. C0
        jnz     ?_069                                   ; 1539 _ 75, 0D
        mov     eax, dword [ebp+8H]                     ; 153B _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 153E _ 8B. 00
        lea     edx, [eax-1H]                           ; 1540 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 1543 _ 8B. 45, 08
        mov     dword [eax], edx                        ; 1546 _ 89. 10
?_069:  mov     eax, dword [ebp-4H]                     ; 1548 _ 8B. 45, FC
        jmp     ?_072                                   ; 154B _ EB, 17

?_070:  add     dword [ebp-8H], 1                       ; 154D _ 83. 45, F8, 01
?_071:  mov     eax, dword [ebp+8H]                     ; 1551 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1554 _ 8B. 00
        cmp     eax, dword [ebp-8H]                     ; 1556 _ 3B. 45, F8
        ja      ?_068                                   ; 1559 _ 0F 87, FFFFFF6D
        mov     eax, 0                                  ; 155F _ B8, 00000000
?_072:  leave                                           ; 1564 _ C9
        ret                                             ; 1565 _ C3
; memman_alloc End of function

memman_free:; Function begin
        push    ebp                                     ; 1566 _ 55
        mov     ebp, esp                                ; 1567 _ 89. E5
        push    ebx                                     ; 1569 _ 53
        sub     esp, 16                                 ; 156A _ 83. EC, 10
        mov     dword [ebp-0CH], 0                      ; 156D _ C7. 45, F4, 00000000
        jmp     ?_075                                   ; 1574 _ EB, 17

?_073:  mov     eax, dword [ebp+8H]                     ; 1576 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 1579 _ 8B. 55, F4
        add     edx, 2                                  ; 157C _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 157F _ 8B. 04 D0
        cmp     eax, dword [ebp+0CH]                    ; 1582 _ 3B. 45, 0C
        jbe     ?_074                                   ; 1585 _ 76, 02
        jmp     ?_076                                   ; 1587 _ EB, 0E

?_074:  add     dword [ebp-0CH], 1                      ; 1589 _ 83. 45, F4, 01
?_075:  mov     eax, dword [ebp+8H]                     ; 158D _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1590 _ 8B. 00
        cmp     eax, dword [ebp-0CH]                    ; 1592 _ 3B. 45, F4
        jg      ?_073                                   ; 1595 _ 7F, DF
?_076:  cmp     dword [ebp-0CH], 0                      ; 1597 _ 83. 7D, F4, 00
        jle     ?_078                                   ; 159B _ 0F 8E, 000000BA
        mov     eax, dword [ebp-0CH]                    ; 15A1 _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 15A4 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 15A7 _ 8B. 45, 08
        add     edx, 2                                  ; 15AA _ 83. C2, 02
        mov     edx, dword [eax+edx*8]                  ; 15AD _ 8B. 14 D0
        mov     eax, dword [ebp-0CH]                    ; 15B0 _ 8B. 45, F4
        lea     ecx, [eax-1H]                           ; 15B3 _ 8D. 48, FF
        mov     eax, dword [ebp+8H]                     ; 15B6 _ 8B. 45, 08
        add     ecx, 2                                  ; 15B9 _ 83. C1, 02
        mov     eax, dword [eax+ecx*8+4H]               ; 15BC _ 8B. 44 C8, 04
        add     eax, edx                                ; 15C0 _ 01. D0
        cmp     eax, dword [ebp+0CH]                    ; 15C2 _ 3B. 45, 0C
        jne     ?_078                                   ; 15C5 _ 0F 85, 00000090
        mov     eax, dword [ebp-0CH]                    ; 15CB _ 8B. 45, F4
        lea     ebx, [eax-1H]                           ; 15CE _ 8D. 58, FF
        mov     eax, dword [ebp-0CH]                    ; 15D1 _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 15D4 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 15D7 _ 8B. 45, 08
        add     edx, 2                                  ; 15DA _ 83. C2, 02
        mov     edx, dword [eax+edx*8+4H]               ; 15DD _ 8B. 54 D0, 04
        mov     eax, dword [ebp+10H]                    ; 15E1 _ 8B. 45, 10
        lea     ecx, [edx+eax]                          ; 15E4 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 15E7 _ 8B. 45, 08
        lea     edx, [ebx+2H]                           ; 15EA _ 8D. 53, 02
        mov     dword [eax+edx*8+4H], ecx               ; 15ED _ 89. 4C D0, 04
        mov     eax, dword [ebp+8H]                     ; 15F1 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 15F4 _ 8B. 00
        cmp     eax, dword [ebp-0CH]                    ; 15F6 _ 3B. 45, F4
        jle     ?_077                                   ; 15F9 _ 7E, 56
        mov     eax, dword [ebp+10H]                    ; 15FB _ 8B. 45, 10
        mov     edx, dword [ebp+0CH]                    ; 15FE _ 8B. 55, 0C
        lea     ecx, [edx+eax]                          ; 1601 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 1604 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 1607 _ 8B. 55, F4
        add     edx, 2                                  ; 160A _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 160D _ 8B. 04 D0
        cmp     ecx, eax                                ; 1610 _ 39. C1
        jnz     ?_077                                   ; 1612 _ 75, 3D
        mov     eax, dword [ebp-0CH]                    ; 1614 _ 8B. 45, F4
        lea     ebx, [eax-1H]                           ; 1617 _ 8D. 58, FF
        mov     eax, dword [ebp-0CH]                    ; 161A _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 161D _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 1620 _ 8B. 45, 08
        add     edx, 2                                  ; 1623 _ 83. C2, 02
        mov     edx, dword [eax+edx*8+4H]               ; 1626 _ 8B. 54 D0, 04
        mov     eax, dword [ebp+8H]                     ; 162A _ 8B. 45, 08
        mov     ecx, dword [ebp-0CH]                    ; 162D _ 8B. 4D, F4
        add     ecx, 2                                  ; 1630 _ 83. C1, 02
        mov     eax, dword [eax+ecx*8+4H]               ; 1633 _ 8B. 44 C8, 04
        lea     ecx, [edx+eax]                          ; 1637 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 163A _ 8B. 45, 08
        lea     edx, [ebx+2H]                           ; 163D _ 8D. 53, 02
        mov     dword [eax+edx*8+4H], ecx               ; 1640 _ 89. 4C D0, 04
        mov     eax, dword [ebp+8H]                     ; 1644 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1647 _ 8B. 00
        lea     edx, [eax-1H]                           ; 1649 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 164C _ 8B. 45, 08
        mov     dword [eax], edx                        ; 164F _ 89. 10
?_077:  mov     eax, 0                                  ; 1651 _ B8, 00000000
        jmp     ?_084                                   ; 1656 _ E9, 0000011C

?_078:  mov     eax, dword [ebp+8H]                     ; 165B _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 165E _ 8B. 00
        cmp     eax, dword [ebp-0CH]                    ; 1660 _ 3B. 45, F4
        jle     ?_079                                   ; 1663 _ 7E, 52
        mov     eax, dword [ebp+10H]                    ; 1665 _ 8B. 45, 10
        mov     edx, dword [ebp+0CH]                    ; 1668 _ 8B. 55, 0C
        lea     ecx, [edx+eax]                          ; 166B _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 166E _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 1671 _ 8B. 55, F4
        add     edx, 2                                  ; 1674 _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 1677 _ 8B. 04 D0
        cmp     ecx, eax                                ; 167A _ 39. C1
        jnz     ?_079                                   ; 167C _ 75, 39
        mov     eax, dword [ebp+8H]                     ; 167E _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 1681 _ 8B. 55, F4
        lea     ecx, [edx+2H]                           ; 1684 _ 8D. 4A, 02
        mov     edx, dword [ebp+0CH]                    ; 1687 _ 8B. 55, 0C
        mov     dword [eax+ecx*8], edx                  ; 168A _ 89. 14 C8
        mov     eax, dword [ebp+8H]                     ; 168D _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 1690 _ 8B. 55, F4
        add     edx, 2                                  ; 1693 _ 83. C2, 02
        mov     edx, dword [eax+edx*8+4H]               ; 1696 _ 8B. 54 D0, 04
        mov     eax, dword [ebp+10H]                    ; 169A _ 8B. 45, 10
        lea     ecx, [edx+eax]                          ; 169D _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 16A0 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 16A3 _ 8B. 55, F4
        add     edx, 2                                  ; 16A6 _ 83. C2, 02
        mov     dword [eax+edx*8+4H], ecx               ; 16A9 _ 89. 4C D0, 04
        mov     eax, 0                                  ; 16AD _ B8, 00000000
        jmp     ?_084                                   ; 16B2 _ E9, 000000C0

?_079:  mov     eax, dword [ebp+8H]                     ; 16B7 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 16BA _ 8B. 00
        cmp     eax, 4095                               ; 16BC _ 3D, 00000FFF
        jg      ?_083                                   ; 16C1 _ 0F 8F, 00000087
        mov     eax, dword [ebp+8H]                     ; 16C7 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 16CA _ 8B. 00
        mov     dword [ebp-8H], eax                     ; 16CC _ 89. 45, F8
        jmp     ?_081                                   ; 16CF _ EB, 28

?_080:  mov     eax, dword [ebp-8H]                     ; 16D1 _ 8B. 45, F8
        lea     edx, [eax-1H]                           ; 16D4 _ 8D. 50, FF
        mov     ecx, dword [ebp+8H]                     ; 16D7 _ 8B. 4D, 08
        mov     eax, dword [ebp-8H]                     ; 16DA _ 8B. 45, F8
        lea     ebx, [eax+2H]                           ; 16DD _ 8D. 58, 02
        mov     eax, dword [ebp+8H]                     ; 16E0 _ 8B. 45, 08
        add     edx, 2                                  ; 16E3 _ 83. C2, 02
        lea     edx, [eax+edx*8]                        ; 16E6 _ 8D. 14 D0
        mov     eax, dword [edx]                        ; 16E9 _ 8B. 02
        mov     edx, dword [edx+4H]                     ; 16EB _ 8B. 52, 04
        mov     dword [ecx+ebx*8], eax                  ; 16EE _ 89. 04 D9
        mov     dword [ecx+ebx*8+4H], edx               ; 16F1 _ 89. 54 D9, 04
        sub     dword [ebp-8H], 1                       ; 16F5 _ 83. 6D, F8, 01
?_081:  mov     eax, dword [ebp-8H]                     ; 16F9 _ 8B. 45, F8
        cmp     eax, dword [ebp-0CH]                    ; 16FC _ 3B. 45, F4
        jg      ?_080                                   ; 16FF _ 7F, D0
        mov     eax, dword [ebp+8H]                     ; 1701 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1704 _ 8B. 00
        lea     edx, [eax+1H]                           ; 1706 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 1709 _ 8B. 45, 08
        mov     dword [eax], edx                        ; 170C _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 170E _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 1711 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1714 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1717 _ 8B. 00
        cmp     edx, eax                                ; 1719 _ 39. C2
        jge     ?_082                                   ; 171B _ 7D, 0B
        mov     eax, dword [ebp+8H]                     ; 171D _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 1720 _ 8B. 10
        mov     eax, dword [ebp+8H]                     ; 1722 _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 1725 _ 89. 50, 04
?_082:  mov     eax, dword [ebp+8H]                     ; 1728 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 172B _ 8B. 55, F4
        lea     ecx, [edx+2H]                           ; 172E _ 8D. 4A, 02
        mov     edx, dword [ebp+0CH]                    ; 1731 _ 8B. 55, 0C
        mov     dword [eax+ecx*8], edx                  ; 1734 _ 89. 14 C8
        mov     eax, dword [ebp+8H]                     ; 1737 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 173A _ 8B. 55, F4
        lea     ecx, [edx+2H]                           ; 173D _ 8D. 4A, 02
        mov     edx, dword [ebp+10H]                    ; 1740 _ 8B. 55, 10
        mov     dword [eax+ecx*8+4H], edx               ; 1743 _ 89. 54 C8, 04
        mov     eax, 0                                  ; 1747 _ B8, 00000000
        jmp     ?_084                                   ; 174C _ EB, 29

?_083:  mov     eax, dword [ebp+8H]                     ; 174E _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 1751 _ 8B. 40, 0C
        lea     edx, [eax+1H]                           ; 1754 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 1757 _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 175A _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 175D _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 1760 _ 8B. 40, 08
        mov     edx, eax                                ; 1763 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 1765 _ 8B. 45, 10
        add     eax, edx                                ; 1768 _ 01. D0
        mov     edx, eax                                ; 176A _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 176C _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 176F _ 89. 50, 08
        mov     eax, 4294967295                         ; 1772 _ B8, FFFFFFFF
?_084:  add     esp, 16                                 ; 1777 _ 83. C4, 10
        pop     ebx                                     ; 177A _ 5B
        pop     ebp                                     ; 177B _ 5D
        ret                                             ; 177C _ C3
; memman_free End of function

memman_alloc_4k:; Function begin
        push    ebp                                     ; 177D _ 55
        mov     ebp, esp                                ; 177E _ 89. E5
        sub     esp, 24                                 ; 1780 _ 83. EC, 18
        mov     eax, dword [ebp+0CH]                    ; 1783 _ 8B. 45, 0C
        add     eax, 4095                               ; 1786 _ 05, 00000FFF
        and     eax, 0FFFFF000H                         ; 178B _ 25, FFFFF000
        mov     dword [ebp+0CH], eax                    ; 1790 _ 89. 45, 0C
        mov     eax, dword [ebp+0CH]                    ; 1793 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 1796 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 179A _ 8B. 45, 08
        mov     dword [esp], eax                        ; 179D _ 89. 04 24
        call    memman_alloc                            ; 17A0 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-4H], eax                     ; 17A5 _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 17A8 _ 8B. 45, FC
        leave                                           ; 17AB _ C9
        ret                                             ; 17AC _ C3
; memman_alloc_4k End of function

memman_free_4k:; Function begin
        push    ebp                                     ; 17AD _ 55
        mov     ebp, esp                                ; 17AE _ 89. E5
        sub     esp, 28                                 ; 17B0 _ 83. EC, 1C
        mov     eax, dword [ebp+10H]                    ; 17B3 _ 8B. 45, 10
        add     eax, 4095                               ; 17B6 _ 05, 00000FFF
        and     eax, 0FFFFF000H                         ; 17BB _ 25, FFFFF000
        mov     dword [ebp+10H], eax                    ; 17C0 _ 89. 45, 10
        mov     eax, dword [ebp+10H]                    ; 17C3 _ 8B. 45, 10
        mov     dword [esp+8H], eax                     ; 17C6 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 17CA _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 17CD _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 17D1 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 17D4 _ 89. 04 24
        call    memman_free                             ; 17D7 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-4H], eax                     ; 17DC _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 17DF _ 8B. 45, FC
        leave                                           ; 17E2 _ C9
        ret                                             ; 17E3 _ C3
; memman_free_4k End of function



?_085:                                                  ; byte
        db 74H, 6FH, 74H, 61H, 6CH, 20H, 6DH, 65H       ; 0000 _ total me
        db 6DH, 20H, 69H, 73H, 3AH, 20H, 00H            ; 0008 _ m is: .

?_086:                                                  ; byte
        db 20H, 4DH, 42H, 00H                           ; 000F _  MB.

?_087:                                                  ; byte
        db 70H, 61H, 67H, 65H, 20H, 69H, 73H, 3AH       ; 0013 _ page is:
        db 20H, 00H                                     ; 001B _  .

?_088:                                                  ; byte
        db 42H, 61H, 73H, 65H, 41H, 64H, 64H, 72H       ; 001D _ BaseAddr
        db 4CH, 3AH, 20H, 00H                           ; 0025 _ L: .

?_089:                                                  ; byte
        db 42H, 61H, 73H, 65H, 41H, 64H, 64H, 72H       ; 0029 _ BaseAddr
        db 48H, 3AH, 20H, 00H                           ; 0031 _ H: .

?_090:                                                  ; byte
        db 6CH, 65H, 6EH, 67H, 74H, 68H, 4CH, 6FH       ; 0035 _ lengthLo
        db 77H, 3AH, 20H, 00H                           ; 003D _ w: .

?_091:                                                  ; byte
        db 6CH, 65H, 6EH, 67H, 74H, 68H, 48H, 69H       ; 0041 _ lengthHi
        db 67H, 68H, 3AH, 20H, 00H                      ; 0049 _ gh: .

?_092:                                                  ; byte
        db 74H, 79H, 70H, 65H, 3AH, 20H, 00H            ; 004E _ type: .



table_rgb.1497:                                         ; byte
        db 00H, 00H, 00H, 0FFH, 00H, 00H, 44H, 8CH      ; 0000 _ ......D.
        db 0BBH, 0FFH, 0FFH, 00H, 00H, 00H, 0FFH, 0FFH  ; 0008 _ ........
        db 00H, 0FFH, 00H, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH ; 0010 _ ........
        db 0C6H, 0C6H, 0C6H, 84H, 00H, 00H, 00H, 84H    ; 0018 _ ........
        db 00H, 84H, 84H, 00H, 00H, 00H, 84H, 84H       ; 0020 _ ........
        db 00H, 84H, 00H, 84H, 84H, 84H, 84H, 84H       ; 0028 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0030 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0038 _ ........

cursor.1564:                                            ; byte
        db 2AH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0040 _ *.......
        db 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0048 _ ........
        db 2AH, 2AH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0050 _ **......
        db 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0058 _ ........
        db 2AH, 4FH, 2AH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0060 _ *O*.....
        db 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0068 _ ........
        db 2AH, 4FH, 4FH, 2AH, 2EH, 2EH, 2EH, 2EH       ; 0070 _ *OO*....
        db 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0078 _ ........
        db 2AH, 4FH, 4FH, 4FH, 2AH, 2EH, 2EH, 2EH       ; 0080 _ *OOO*...
        db 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0088 _ ........
        db 2AH, 4FH, 4FH, 4FH, 4FH, 2AH, 2EH, 2EH       ; 0090 _ *OOOO*..
        db 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0098 _ ........
        db 2AH, 4FH, 4FH, 4FH, 4FH, 4FH, 2AH, 2EH       ; 00A0 _ *OOOOO*.
        db 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 00A8 _ ........
        db 2AH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 2AH       ; 00B0 _ *OOOOOO*
        db 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 00B8 _ ........
        db 2AH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH       ; 00C0 _ *OOOOOOO
        db 2AH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 00C8 _ *.......
        db 2AH, 4FH, 4FH, 4FH, 4FH, 2AH, 2AH, 2AH       ; 00D0 _ *OOOO***
        db 2AH, 2AH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 00D8 _ **......
        db 2AH, 4FH, 4FH, 2AH, 4FH, 2AH, 2EH, 2EH       ; 00E0 _ *OO*O*..
        db 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 00E8 _ ........
        db 2AH, 4FH, 2AH, 2EH, 2AH, 4FH, 2AH, 2EH       ; 00F0 _ *O*.*O*.
        db 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 00F8 _ ........
        db 2AH, 2AH, 2EH, 2EH, 2AH, 4FH, 2AH, 2EH       ; 0100 _ **..*O*.
        db 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0108 _ ........
        db 2AH, 2EH, 2EH, 2EH, 2EH, 2AH, 4FH, 2AH       ; 0110 _ *....*O*
        db 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0118 _ ........
        db 2EH, 2EH, 2EH, 2EH, 2EH, 2AH, 4FH, 2AH       ; 0120 _ .....*O*
        db 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0128 _ ........
        db 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2AH, 2EH       ; 0130 _ ......*.
        db 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0138 _ ........

keyval:                                                 ; byte
        db 30H, 58H                                     ; 0140 _ 0X

?_093:  db 00H                                          ; 0142 _ .

?_094:  db 00H, 00H                                     ; 0143 _ ..



screen_info:                                            ; qword
        resb    4                                       ; 0000

?_095:  resw    1                                       ; 0004

?_096:  resw    13                                      ; 0006

mouse_cursor_buf:                                       ; byte
        resb    256                                     ; 0020

mouse_x: resd   1                                       ; 0120

mouse_y: resd   1                                       ; 0124

mouse_send_info:                                        ; oword
        resb    24                                      ; 0128

keyinfo:                                                ; byte
        resb    32                                      ; 0140

keybuf:                                                 ; yword
        resb    32                                      ; 0160

mouseinfo:                                              ; byte
        resb    32                                      ; 0180

mousebuf:                                               ; byte
        resb    128                                     ; 01A0

str.1386:                                               ; byte
        resb    1                                       ; 0220

?_097:  resb    9                                       ; 0221

?_098:  resb    1                                       ; 022A


